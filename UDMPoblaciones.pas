unit UDMPoblaciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, UComponentesBusquedaFiltrada,
  FIBDatabase, FIBDataSetRO, UFIBModificados;

type
  TDMPoblaciones = class(TDataModule)
     QMPaises: TFIBTableSet;
     DSQMPaises: TDataSource;
     QMProvincias: TFIBTableSet;
     DSQMProvincias: TDataSource;
     QMLocalidades: TFIBTableSet;
     DSQMLocalidades: TDataSource;
     EntornoLoc: TEntornoFind2000;
     QMPaisesPAIS: TFIBStringField;
     QMPaisesPAIS_C2: TFIBStringField;
     QMPaisesPAIS_N3: TFIBStringField;
     QMPaisesCODIGO_TEL: TFIBStringField;
     QMPaisesIDIOMA: TFIBStringField;
     QMProvinciasPAIS: TFIBStringField;
     QMProvinciasPROVINCIA: TFIBStringField;
     QMProvinciasCODIGO_TEL: TFIBStringField;
     QMProvinciasTITULO: TFIBStringField;
     QMLocalidadesCODIGO_POSTAL: TFIBStringField;
     QMLocalidadesPAIS: TFIBStringField;
     QMLocalidadesPROVINCIA: TFIBStringField;
     QMPaisesTITULO: TFIBStringField;
     QMLocalidadesLOCALIDAD: TFIBStringField;
     QMLocalidadesTITULO: TFIBStringField;
     QMProvinciasINE: TFIBStringField;
     TLocal: THYTransaction;
     QMPaisesPERTENECE_CEE: TIntegerField;
     TUpdate: THYTransaction;
     QMLocalidadesID_LOCAL: TIntegerField;
     QMLocalidadesULT_MODIFICACION: TDateTimeField;
     QMLocalidadesCOLONIA: TFIBStringField;
     QMLocalidadesTIPO_COLONIA: TFIBStringField;
     QMLocalidadesCIUDAD: TFIBStringField;
     QMLocalidadesLATITUD: TFloatField;
     QMLocalidadesLONGITUD: TFloatField;
     QMLocalidadesZONA_HORARIA: TFloatField;
     QMRegiones: TFIBTableSet;
     DSQMRegiones: TDataSource;
     QMRegionesID_REGION: TIntegerField;
     QMRegionesPAIS: TFIBStringField;
     QMRegionesREGION: TFIBStringField;
     QMRegionesTITULO: TFIBStringField;
     QMPoblaciones: TFIBTableSet;
     DSQMPoblaciones: TDataSource;
     QMPoblacionesID_POBLACION: TIntegerField;
     QMPoblacionesPAIS: TFIBStringField;
     QMPoblacionesPOBLACION: TFIBStringField;
     QMPoblacionesTITULO: TFIBStringField;
     QMPoblacionesPROVINCIA: TFIBStringField;
     QMProvinciasLRE: TFIBStringField;
     QMRegionesLRE: TFIBStringField;
     QMRegionesABREVIATURA: TFIBStringField;
     QMPoblacionesLRE: TFIBStringField;
     procedure DMPoblacionesCreate(Sender: TObject);
     procedure QMLocalidadesPAISChange(Sender: TField);
     procedure QMLocalidadesBeforeEdit(DataSet: TDataSet);
     procedure QMPaisesNewRecord(DataSet: TDataSet);
     procedure QMLocalidadesBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure BCProvincias;
     procedure BCRegiones;
     procedure BCPoblaciones;
     procedure BCPaises;
     // procedure BuscaLocalidad(Texto: String);
     procedure FiltraLocalidades(Pais: string);
     procedure FiltraProvincias(Pais: string);
     procedure FiltraRegiones(Pais: string);
     procedure FiltraPoblaciones(Pais: string);
  end;

var
  DMPoblaciones : TDMPoblaciones;

implementation

uses UDMMain, UEntorno, uFBusca;

{$R *.DFM}

procedure TDMPoblaciones.DMPoblacionesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMPaises.Open;
  QMProvincias.Open;
  QMRegiones.Open;
  QMPoblaciones.Open;
  QMLocalidades.Open;
end;

procedure TDMPoblaciones.QMLocalidadesPAISChange(Sender: TField);
begin
  EntornoLoc.Pais := Sender.AsString;
end;

procedure TDMPoblaciones.QMLocalidadesBeforeEdit(DataSet: TDataSet);
begin
  EntornoLoc.Pais := QMLocalidadesPAIS.AsString;
end;

procedure TDMPoblaciones.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMLocalidades, '00000');
end;

procedure TDMPoblaciones.BCProvincias;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMProvincias, '00000');
end;

procedure TDMPoblaciones.BCRegiones;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMRegiones, '00000');
end;

procedure TDMPoblaciones.BCPoblaciones;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMPoblaciones, '00000');
end;

procedure TDMPoblaciones.BCPaises;
begin
  with QMPaises do
  begin
     Close;
     TFBusca.Create(Self).SeleccionaBusqueda(QMPaises, '00000', False);
     Open;
  end;
end;

procedure TDMPoblaciones.QMPaisesNewRecord(DataSet: TDataSet);
begin
  QMPaisesPERTENECE_CEE.AsInteger := 0;
end;

procedure TDMPoblaciones.QMLocalidadesBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_LOCALIDADES', 'ID_LOCAL');
end;

procedure TDMPoblaciones.FiltraLocalidades(Pais: string);
begin
  with QMLocalidades do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM SYS_LOCALIDADES ');
     if (Pais <> '') then
     begin
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' PAIS = :PAIS ');
     end;
     SelectSQL.Add(' ORDER BY LOCALIDAD ');

     if (Pais <> '') then
        Params.ByName['PAIS'].AsString := Pais;

     Open;
  end;
end;

procedure TDMPoblaciones.FiltraProvincias(Pais: string);
begin
  with QMProvincias do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM SYS_PROVINCIAS ');
     if (Pais <> '') then
     begin
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' PAIS = :PAIS ');
     end;
     SelectSQL.Add(' ORDER BY PAIS, PROVINCIA ');

     if (Pais <> '') then
        Params.ByName['PAIS'].AsString := Pais;

     Open;
  end;
end;

procedure TDMPoblaciones.FiltraRegiones(Pais: string);
begin
  with QMRegiones do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM SYS_REGIONES ');
     if (Pais <> '') then
     begin
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' PAIS = :PAIS ');
     end;
     SelectSQL.Add(' ORDER BY PAIS, REGION ');

     if (Pais <> '') then
        Params.ByName['PAIS'].AsString := Pais;

     Open;
  end;
end;

procedure TDMPoblaciones.FiltraPoblaciones(Pais: string);
begin
  with QMPoblaciones do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM SYS_POBLACION ');
     if (Pais <> '') then
     begin
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' PAIS = :PAIS ');
     end;
     SelectSQL.Add(' ORDER BY PAIS, POBLACION ');

     if (Pais <> '') then
        Params.ByName['PAIS'].AsString := Pais;

     Open;
  end;
end;

end.
