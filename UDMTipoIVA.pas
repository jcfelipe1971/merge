unit UDMTipoIVA;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, FIBDatabase, FIBDataSet, FIBTableDataSet, FIBQuery,
  UFIBModificados, HYFIBQuery, FIBDataSetRO;

type
  TDMTipoIVA = class(TDataModule)
     QMTipoIva: TFIBTableSet;
     DSQMTipoIva: TDataSource;
     TLocal: THYTransaction;
     QMTipoIvaPAIS: TFIBStringField;
     QMTipoIvaTIPO: TIntegerField;
     QMTipoIvaTITULO: TFIBStringField;
     QMTipoIvaP_IVA: TFloatField;
     QMTipoIvaP_RECARGO: TFloatField;
     QMTipoIvaACTIVO: TIntegerField;
     QMTipoIvaDEFECTO: TIntegerField;
     QMTipoIvaREGIMEN: TIntegerField;
     xSysTipoRegimen: TFIBDataSetRO;
     DSxSysTipoRegimen: TDataSource;
     TUpdate: THYTransaction;
     procedure DMTipoIVACreate(Sender: TObject);
     procedure QMTipoIvaBeforePost(DataSet: TDataSet);
     procedure QMTipoIvaAfterPost(DataSet: TDataSet);
     procedure QMTipoIvaNewRecord(DataSet: TDataSet);
     procedure QMTipoIvaREGIMENChange(Sender: TField);
     procedure QMTipoIvaAfterOpen(DataSet: TDataSet);
     procedure QMTipoIvaBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     procedure RefrescaDatos;
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure AltaCuentasIva;
  end;

var
  DMTipoIVA : TDMTipoIVA;

implementation

uses UDMMain, UUtiles, UEntorno, UFBusca;

{$R *.DFM}

procedure TDMTipoIVA.DMTipoIVACreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMTipoIvaTIPO.DisplayFormat := MascaraMini;
  QMTipoIvaP_IVA.DisplayFormat := MascaraP;
  QMTipoIvaP_RECARGO.DisplayFormat := MascaraP;
  DMMain.FiltraTabla(QMTipoIVA, '00001', True);
end;

procedure TDMTipoIVA.QMTipoIvaBeforePost(DataSet: TDataSet);
begin
  if (DSQMTipoIVA.State = dsInsert) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MAX(TIPO) FROM SYS_TIPO_IVA WHERE PAIS = ?PAIS';
           Params.ByName['PAIS'].AsString := REntorno.Pais;
           ExecQuery;
           QMTipoIVATIPO.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMTipoIVa.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTipoIVA, '00001');
end;

procedure TDMTipoIVA.QMTipoIvaAfterPost(DataSet: TDataSet);
begin
  AltaCuentasIva;

  // Refresco toda la tabla por si hubo cambios en el IVA por defecto
  RefrescaDatos;
end;

procedure TDMTipoIVA.QMTipoIvaNewRecord(DataSet: TDataSet);
begin
  QMTipoIvaTITULO.AsString := _('Desconocido');
  QMTipoIvaP_IVA.AsInteger := 0;
  QMTipoIvaP_RECARGO.AsInteger := 0;
  QMTipoIvaACTIVO.AsInteger := 1;
  QMTipoIvaDEFECTO.AsInteger := 0;
  QMTipoIvaREGIMEN.AsInteger := 0;
  QMTipoIvaPAIS.AsString := REntorno.Pais;
end;

procedure TDMTipoIVa.AltaCuentasIva;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_IVA_ALTA (?EMPRESA, ?EJERCICIO, ?CANAL)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTipoIVA.QMTipoIvaREGIMENChange(Sender: TField);
begin
  with xSysTipoRegimen do
  begin
     Close;
     Open;
  end;
end;

procedure TDMTipoIVA.QMTipoIvaAfterOpen(DataSet: TDataSet);
begin
  xSysTipoRegimen.Open;
end;

procedure TDMTipoIVA.RefrescaDatos;
begin
  // Cierra y abre la tabla manteniendo posicion
  Refrescar(QMTipoIva, 'TIPO', QMTipoIvaTIPO.AsInteger);
end;

procedure TDMTipoIVA.QMTipoIvaBeforeClose(DataSet: TDataSet);
begin
  xSysTipoRegimen.Close;
end;

end.
