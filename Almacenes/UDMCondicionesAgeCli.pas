unit UDMCondicionesAgeCli;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet,
  UComponentesBusquedaFiltrada, FIBQuery, FIBDataSetRO, HYFIBQuery;

type
  TDMCondicionesAgecli = class(TDataModule)
     TLocal: THYTransaction;
     DSxAgentes: TDataSource;
     QMCondClientes: TFIBTableSet;
     DSQMCondClientes: TDataSource;
     DSxClientes: TDataSource;
     QMCondAgrupacion: TFIBTableSet;
     DSQMCondAgrupacion: TDataSource;
     DSxAgrupacion: TDataSource;
     QControlaDuplicados: THYFIBQuery;
     QControlaDuplicadosAg: THYFIBQuery;
     QMCondClientesEMPRESA: TIntegerField;
     QMCondClientesEJERCICIO: TIntegerField;
     QMCondClientesCANAL: TIntegerField;
     QMCondClientesAGENTE: TIntegerField;
     QMCondClientesCLIENTE: TIntegerField;
     QMCondClientesTITULO_CLIENTE: TFIBStringField;
     QMCondClientesP_COMISION: TFloatField;
     QMCondClientesACTIVO: TIntegerField;
     QMCondAgrupacionEMPRESA: TIntegerField;
     QMCondAgrupacionEJERCICIO: TIntegerField;
     QMCondAgrupacionCANAL: TIntegerField;
     QMCondAgrupacionAGENTE: TIntegerField;
     QMCondAgrupacionAGRUPACION: TFIBStringField;
     QMCondAgrupacionTITULO_AGRUPACION: TFIBStringField;
     QMCondAgrupacionP_COMISION: TFloatField;
     QMCondAgrupacionACTIVO: TIntegerField;
     xAgentes: TFIBDataSetRO;
     xClientes: TFIBDataSetRO;
     xAgrupacion: TFIBDataSetRO;
     TUpdate: THYTransaction;
     QMCondClientesFECHA_ALTA: TDateTimeField;
     procedure DMCondicionescliCreate(Sender: TObject);
     procedure QMCondClientesCLIENTEChange(Sender: TField);
     procedure QMCondClientesNewRecord(DataSet: TDataSet);
     procedure QMCondClientesAfterOpen(DataSet: TDataSet);
     procedure QMCondAgrupacionNewRecord(DataSet: TDataSet);
     procedure QMCondAgrupacionAGRUPACIONChange(Sender: TField);
     procedure QMCondAgrupacionAfterOpen(DataSet: TDataSet);
     procedure QMCondClientesBeforePost(DataSet: TDataSet);
     procedure QMCondAgrupacionBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
     procedure ControlaDupCli;
     procedure ControlaDupAgrup;
  public
     { Public declarations }
     procedure FiltrarAgente(Agente: integer);
  end;

var
  DMCondicionesAgecli : TDMCondicionesAgecli;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.DFM}

procedure TDMCondicionesAgecli.DMCondicionescliCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  xAgentes.Close;
  xClientes.Close;
  xAgrupacion.Close;

  QMCondClientesP_COMISION.DisplayFormat := MascaraP;
  QMCondClientesFECHA_ALTA.DisplayFormat := ShortDateformat;
  QMCondAgrupacionP_COMISION.DisplayFormat := MascaraP;
end;

procedure TDMCondicionesAgecli.FiltrarAgente(Agente: integer);
begin
  with xAgentes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['AGENTE'].AsInteger := Agente;
     Open;
  end;

  with QMCondClientes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['AGENTE'].AsInteger := Agente;
     Open;
  end;

  with QMCondAgrupacion do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['AGENTE'].AsInteger := Agente;
     Open;
  end;
end;

procedure TDMCondicionesAgecli.QMCondClientesCLIENTEChange(Sender: TField);
begin
  with xClientes do
  begin
     Close;
     Open;
  end;

  ControlaDupCli;
end;

procedure TDMCondicionesAgecli.QMCondClientesNewRecord(DataSet: TDataSet);
begin
  QMCondClientesEMPRESA.AsInteger := REntorno.Empresa;
  QMCondClientesEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondClientesCANAL.AsInteger := REntorno.Canal;
  QMCondClientesAGENTE.AsInteger := xAgentes.FieldByName('AGENTE').AsInteger;
  QMCondClientesACTIVO.AsInteger := 1;
  QMCondClientesP_COMISION.AsFloat := 0;
  xClientes.Close;
end;

procedure TDMCondicionesAgecli.QMCondClientesAfterOpen(DataSet: TDataSet);
begin
  with xClientes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := QMCondClientesCLIENTE.Value;
     Open;
  end;
end;

procedure TDMCondicionesAgecli.QMCondAgrupacionNewRecord(DataSet: TDataSet);
begin
  QMCondAgrupacionEMPRESA.AsInteger := REntorno.Empresa;
  QMCondAgrupacionEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCondAgrupacionCANAL.AsInteger := REntorno.Canal;
  QMCondAgrupacionAGENTE.AsInteger := xAgentes.FieldByName('AGENTE').AsInteger;
  QMCondAgrupacionACTIVO.AsInteger := 1;
  QMCondAgrupacionP_COMISION.AsFloat := 0;
  xAgrupacion.Close;
end;

procedure TDMCondicionesAgecli.QMCondAgrupacionAGRUPACIONChange(Sender: TField);
begin
  with xAgrupacion do
  begin
     Close;
     Open;
  end;

  ControlaDupAgrup;
end;

procedure TDMCondicionesAgecli.QMCondAgrupacionAfterOpen(DataSet: TDataSet);
begin
  with xAgrupacion do
  begin
     Close;
     Open;
  end;
end;

procedure TDMCondicionesAgecli.ControlaDupCli;
var
  Duplicado : boolean;
begin
  Duplicado := False;
  if (QMCondClientes.State <> dsInsert) or
     (QMCondClientesCLIENTE.IsNull) then
     Exit;

  with QControlaDuplicados do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['AGENTE'].AsInteger := QMCondClientesAGENTE.Value;
     Params.ByName['CLIENTE'].AsInteger := QMCondClientesCLIENTE.Value;
     ExecQuery;
     if (FieldByName['COUNT'].AsInteger <> 0) then
        Duplicado := True;
     Close;
     FreeHandle;
  end;

  if Duplicado then
     raise Exception.Create(_('Clave duplicada'));
end;

procedure TDMCondicionesAgecli.ControlaDupAgrup;
var
  Duplicado : boolean;
begin
  Duplicado := False;
  if (QMCondAgrupacion.State <> dsInsert) or
     (QMCondAgrupacionAGRUPACION.IsNull) then
     Exit;

  with QControlaDuplicadosAg do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['AGENTE'].AsInteger := QMCondAgrupacionAGENTE.Value;
     Params.ByName['AGRUPACION'].AsString := QMCondAgrupacionAGRUPACION.Value;
     ExecQuery;
     if (FieldByName['COUNT'].AsInteger <> 0) then
        Duplicado := True;
     Close;
     FreeHandle;
  end;

  if Duplicado then
     raise Exception.Create(_('Clave duplicada'));
end;

procedure TDMCondicionesAgecli.QMCondClientesBeforePost(DataSet: TDataSet);
begin
  ControlaDupCli;
end;

procedure TDMCondicionesAgecli.QMCondAgrupacionBeforePost(DataSet: TDataSet);
begin
  ControlaDupAgrup;
end;

end.
