unit UDMRPlanCuentas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FR_DSet, FR_DBSet, FR_Class,
  Fr_HYReport, FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery,
  frxClass, frxHYReport, FIBDataSetRW;

type
  TDMRPlanCuentas = class(TDataModule)
     frPlanCuentas: TfrHYReport;
     DSQSPConCreaPlanCuentas: TDataSource;
     frDSQSPConCreaPlanCuentas: TfrDBDataSet;
     xCta_Desde: TFIBDataSetRO;
     DSxCta_Desde: TDataSource;
     xCta_Hasta: TFIBDataSetRO;
     DSxCta_Hasta: TDataSource;
     TLocal: THYTransaction;
     QMinCuenta: THYFIBQuery;
     QMaxCuenta: THYFIBQuery;
     QSPConCreaPlanCuentasCUENTA: TFIBStringField;
     QSPConCreaPlanCuentasTITULO: TFIBStringField;
     QSPConCreaPlanCuentasNIVEL: TIntegerField;
     frxPlanCuentas: TfrxHYReport;
     TUpdate: THYTransaction;
     QSPConCreaPlanCuentas: TFIBDataSetRW;
     procedure DMRPlanCuentasCreate(Sender: TObject);
     procedure frPlanCuentasGetValue(const ParName: string; var ParValue: variant);
     procedure frPlanCuentasEnterRect(Memo: TStringList; View: TfrView);
     procedure DMRPlanCuentasDestroy(Sender: TObject);
     procedure frxPlanCuentasBeforePrint(Sender: TfrxReportComponent);
     procedure frxPlanCuentasGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
  public
     { Public declarations }
     Cuenta_Inf: string;
     Cuenta_Sup: string;
     Char_Relleno: string;
     Titulo: string;
     FechaListado: TDateTime;
     procedure CalculaInforme;
     procedure Rangos;
     procedure MostrarInforme(modo: smallint);
     procedure Actualiza_Cuenta(Tabla: TFIBDataSetRO; cuenta: string);
  end;

var
  DMRPlanCuentas : TDMRPlanCuentas;
  SW : integer;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest;

{$R *.DFM}

procedure TDMRPlanCuentas.DMRPlanCuentasCreate(Sender: TObject);
begin
  // Abrir la transacción
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMRPlanCuentas.DMRPlanCuentasDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMRPlanCuentas.CalculaInforme;
begin
  with QSPConCreaPlanCuentas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CUENTA_INF'].AsString := Cuenta_Inf;
     Params.ByName['CUENTA_SUP'].AsString := Cuenta_Sup;
     Params.ByName['RELLENO'].AsString := Char_Relleno;
     Open;
  end;
end;

procedure TDMRPlanCuentas.Rangos;
begin
  with QMinCuenta do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PGC'].AsInteger := REntorno.Pgc;
     ExecQuery;
     Cuenta_Inf := FieldByName['MINIMO'].AsString;
     FreeHandle;
  end;

  with QMaxCuenta do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['PGC'].AsInteger := REntorno.Pgc;
     ExecQuery;
     Cuenta_Sup := FieldByName['MAXIMO'].AsString;
     FreeHandle;
  end;
end;

procedure TDMRPlanCuentas.MostrarInforme(Modo: smallint);
begin
  DMListados.Imprimir(19, 0, Modo, '', '', frPlanCuentas, frxPlanCuentas, nil, nil);
end;

procedure TDMRPlanCuentas.frPlanCuentasGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'FECHA_LIST' then
     ParValue := FechaListado;

  if ParName = 'TITULO' then
     ParValue := Titulo;

  if ParName = 'DESC' then
     ParValue := Format(_('Desde la cuenta %s hasta la %s'), [cuenta_inf, cuenta_sup]);

  if ParName = 'DESC1' then
     ParValue := Format(_('Desde la cuenta %s %s'), [cuenta_inf, xCta_Desde.FieldByName('TITULO').AsString]);

  if ParName = 'DESC2' then
     ParValue := Format(_('Hasta la cuenta %s %s'), [cuenta_sup, xCta_Hasta.FieldByName('TITULO').AsString]);

  if ParName = 'GRUPO' then
     ParValue := Format(_('Grupo %s'), [Copy(QSPConCreaPlanCuentas.FieldByName('CUENTA').AsString, 1, 1)]);
end;

procedure TDMRPlanCuentas.frPlanCuentasEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

{ Actualiza la cuenta (bien Desde o bien Hasta) de la tabla deseada }
procedure TDMRPlanCuentas.Actualiza_Cuenta(Tabla: TFIBDataSetRO; cuenta: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CUENTA'].AsString := cuenta;
     Params.ByName['PGC'].AsInteger := REntorno.Pgc;
     Open;
  end;
end;

procedure TDMRPlanCuentas.frxPlanCuentasBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

procedure TDMRPlanCuentas.frxPlanCuentasGetValue(const VarName: string; var Value: variant);
begin
  frPlanCuentasGetValue(VarName, Value);
end;

end.
