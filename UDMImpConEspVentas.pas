unit UDMImpConEspVentas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery;

type
  TDMImpConEspVentas = class(TDataModule)
     DSQMDetalle: TDataSource;
     QMDetalle: TFIBTableSet;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleUNID_MINIMAS: TFloatField;
     QMDetalleUNID_MAXIMAS: TFloatField;
     QMDetallePRECIO: TFloatField;
     QMDetalleDESCUENTO: TFloatField;
     QMDetalleDESCUENTO_2: TFloatField;
     QMDetalleDESCUENTO_3: TFloatField;
     QMCondiciones: TFIBTableSet;
     QMCondicionesEMPRESA: TIntegerField;
     QMCondicionesEJERCICIO: TIntegerField;
     QMCondicionesCANAL: TIntegerField;
     QMCondicionesTIPO: TFIBStringField;
     QMCondicionesRIG: TIntegerField;
     QMCondicionesCLIENTE: TIntegerField;
     QMCondicionesTITULO_CLIENTE: TFIBStringField;
     QMCondicionesARTICULO: TFIBStringField;
     QMCondicionesTITULO_ARTICULO: TFIBStringField;
     QMCondicionesFAMILIA: TFIBStringField;
     QMCondicionesTITULO_FAMILIA: TFIBStringField;
     QMCondicionesPERFIL: TFIBStringField;
     QMCondicionesTITULO_PERFIL: TFIBStringField;
     QMCondicionesAGRUPACION: TFIBStringField;
     QMCondicionesTITULO_AGRUPACION: TFIBStringField;
     QMCondicionesALTA: TDateTimeField;
     QMCondicionesBAJA: TDateTimeField;
     QMCondicionesACTIVO: TIntegerField;
     QMCondicionesTRASPASAR: TIntegerField;
     DSQMCondiciones: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     SPLineaSiguiente: THYFIBQuery;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCondicionesNewRecord(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMCondicionesAfterOpen(DataSet: TDataSet);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMDetalleBeforeEdit(DataSet: TDataSet);
     procedure QMDetalleBeforeDelete(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure InsertaCondicionEspecial(Tipo: string; Cliente: integer; Articulo, Familia, Perfil: string; Agrupacion: string; Alta, Baja: TDateTime; UdsMin, UdsMax, Precio, Desc1, Desc2, Desc3: double; Modificar: boolean);
  end;

var
  DMImpConEspVentas : TDMImpConEspVentas;

implementation

uses UDMMain, UEntorno, ufBusca, UUtiles;

{$R *.dfm}

procedure TDMImpConEspVentas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMDetalleUNID_MINIMAS.DisplayFormat := MascaraN;
  QMDetalleUNID_MAXIMAS.DisplayFormat := MascaraN;
  QMDetalleDESCUENTO.DisplayFormat := MascaraP;
  QMDetalleDESCUENTO_2.DisplayFormat := MascaraP;
  QMDetalleDESCUENTO_3.DisplayFormat := MascaraP;
  QMDetallePRECIO.DisplayFormat := MascaraL;
end;

procedure TDMImpConEspVentas.QMCondicionesNewRecord(DataSet: TDataSet);
begin
  QMCondicionesEMPRESA.AsInteger := REntorno.Empresa;
  QMCondicionesEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondicionesCANAL.AsInteger := REntorno.Canal;
  QMCondicionesRIG.AsInteger := 0;
  QMCondicionesALTA.AsDateTime := Date;
  QMCondicionesBAJA.AsDateTime := Date;
  QMCondicionesACTIVO.AsInteger := 1;
  QMCondicionesTRASPASAR.AsInteger := 1;
end;

procedure TDMImpConEspVentas.QMDetalleNewRecord(DataSet: TDataSet);
begin
  if ((QMCondiciones.State = dsInsert) or (QMCondiciones.State = dsEdit)) then
  begin
     QMDetalle.Cancel;
     QMCondiciones.Post;
     QMCondiciones.Refresh;
     QMDetalle.Edit;
  end;

  QMDetalleEMPRESA.AsInteger := REntorno.Empresa;
  QMDetalleEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMDetalleCANAL.AsInteger := REntorno.Canal;
  QMDetalleTIPO.AsString := QMCondiciones.FieldByName('TIPO').AsString;
  QMDetalleRIG.AsInteger := QMCondiciones.FieldByName('RIG').AsInteger;
  with SPLineaSiguiente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TIPO'].AsString := QMCondiciones.FieldByName('TIPO').AsString;
     Params.ByName['RIG'].AsInteger := QMCondiciones.FieldByName('RIG').AsInteger;
     ExecQuery;
     QMDetalleLINEA.AsInteger := FieldByName['LINEA'].AsInteger;
     FreeHandle;
  end;
  QMDetallePRECIO.AsFloat := 0;
  QMDetalleDESCUENTO.AsFloat := 0;
  QMDetalleDESCUENTO_2.AsFloat := 0;
  QMDetalleDESCUENTO_3.AsFloat := 0;
end;

procedure TDMImpConEspVentas.QMCondicionesAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Close;
  QMDetalle.Open;
end;

procedure TDMImpConEspVentas.QMDetalleAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  QMDetalle.Close;
  QMDetalle.Open;
end;

procedure TDMImpConEspVentas.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMImpConEspVentas.QMDetalleBeforeEdit(DataSet: TDataSet);
begin
  if ((QMCondiciones.State = dsInsert) or (QMCondiciones.State = dsEdit)) then
  begin
     QMDetalle.Cancel;
     QMCondiciones.Post;
     QMCondiciones.Refresh;
     QMDetalle.Edit;
  end;
end;

procedure TDMImpConEspVentas.QMDetalleBeforeDelete(DataSet: TDataSet);
begin
  if ((QMCondiciones.State = dsInsert) or (QMCondiciones.State = dsEdit)) then
  begin
     QMCondiciones.Post;
     QMCondiciones.Refresh;
  end;
end;

procedure TDMImpConEspVentas.InsertaCondicionEspecial(Tipo: string; Cliente: integer; Articulo, Familia, Perfil: string; Agrupacion: string; Alta, Baja: TDateTime; UdsMin, UdsMax, Precio, Desc1, Desc2, Desc3: double; Modificar: boolean);
begin
  // Insertar condicion
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        // Transaction := TLocal;
        SQL.Add(' EXECUTE PROCEDURE INS_CONDICION_ESPECIAL_VENTA( ');
        SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :TIPO, ');
        SQL.Add(' :CLIENTE, :ARTICULO, :FAMILIA, :PERFIL, :AGRUPACION, ');
        SQL.Add(' :ALTA, :BAJA, ');
        SQL.Add(' :UNID_MINIMAS, :UNID_MAXIMAS, :PRECIO, :DESCUENTO, :DESCUENTO_2, :DESCUENTO_3, ');
        SQL.Add(' :MODIFICAR) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['FAMILIA'].AsString := Familia;
        Params.ByName['PERFIL'].AsString := Perfil;
        Params.ByName['AGRUPACION'].AsString := Agrupacion;
        Params.ByName['ALTA'].AsDateTime := Alta;
        Params.ByName['BAJA'].AsDateTime := Baja;
        Params.ByName['UNID_MINIMAS'].AsFloat := UdsMin;
        Params.ByName['UNID_MAXIMAS'].AsFloat := UdsMax;
        Params.ByName['PRECIO'].AsFloat := Precio;
        Params.ByName['DESCUENTO'].AsFloat := Desc1;
        Params.ByName['DESCUENTO_2'].AsFloat := Desc2;
        Params.ByName['DESCUENTO_3'].AsFloat := Desc3;
        Params.ByName['MODIFICAR'].AsInteger := BoolToInt(Modificar);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
