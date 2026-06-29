unit UDMLstConfirming;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FR_DSet,
  FR_DBSet, FR_Class, Fr_HYReport, DBTables, FIBQuery, HYFIBQuery,
  FIBDataSetRO, frxClass, frxHYReport;

type
  TDMLstConfirming = class(TDataModule)
     TLocal: THYTransaction;
     frConfirming: TfrHYReport;
     frDBConfirming: TfrDBDataSet;
     DSxConfirming: TDataSource;
     xConfirming: TFIBDataSetRO;
     frDBBancos: TfrDBDataSet;
     DSxBancos: TDataSource;
     xBancos: TFIBDataSetRO;
     SPVencimientos: THYFIBQuery;
     frxConfirming: TfrxHYReport;
     TUpdate: THYTransaction;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     frDBDetalle: TfrDBDataSet;
     procedure DMLstConfirmingCreate(Sender: TObject);
     procedure xBancosAfterScroll(DataSet: TDataSet);
     procedure frConfirmingGetValue(const ParName: string; var ParValue: variant);
     procedure DMLstConfirmingDestroy(Sender: TObject);
     procedure frConfirmingEnterRect(Memo: TStringList; View: TfrView);
     procedure frxConfirmingBeforePrint(Sender: TfrxReportComponent);
     procedure frxConfirmingGetValue(const VarName: string; var Value: variant);
     procedure xConfirmingAfterOpen(DataSet: TDataSet);
     procedure xConfirmingBeforeClose(DataSet: TDataSet);
  private
     Banco: integer;
     FechaVencimiento: TDateTime;
  public
     function DameVencimiento: TDateTime;
     procedure MuestraListado(Modo, Opcion: smallint; aBanco: integer; Vencimiento: TDateTime);
  end;

var
  DMLstConfirming : TDMLstConfirming;

implementation

{$R *.DFM}

uses UDMMain, UDMListados, UFormGest, UEntorno, DateUtils;

procedure TDMLstConfirming.DMLstConfirmingCreate(Sender: TObject);
begin
  // Abrir la transacción
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstConfirming.DMLstConfirmingDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

function TDMLstConfirming.DameVencimiento: TDateTime;
var
  Fecha : TDateTime;
begin
  with SPVencimientos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     ExecQuery;
     Fecha := FieldByName['MAXIMO'].AsDateTime;
     if (Fecha = 0) then
        Result := REntorno.FechaTrabSH
     else
        Result := Fecha;
     FreeHandle;
  end;
end;

procedure TDMLstConfirming.MuestraListado(Modo, Opcion: smallint; aBanco: integer; Vencimiento: TDateTime);
var
  Archivo : string;
begin
  // DMMain.LogProduccion('MuestraListado');
  Banco := aBanco;
  FechaVencimiento := RecodeTime(Vencimiento, 0, 0, 0, 0);

  // DMMain.LogProduccion('xBancos');
  with xBancos do
  begin
     Close;

     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_BANCOS_CUENTAS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' CANAL = :CANAL ');
     if (Opcion = 0) then
        SelectSQL.Add(' AND BANCO = :BANCO ');
     SelectSQL.Add(' ORDER BY BANCO ');

     // DMMain.LogProduccion('xBancos.SelectSQL'+#13#10+xBancos.SelectSQL.Text);
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (Opcion = 0) then
        Params.ByName['BANCO'].AsInteger := Banco;

     Open;
  end;

  Archivo := format(_('Confirming') + '_%d-%d', [xConfirming.FieldByName('EJERCICIO').AsInteger, xConfirming.FieldByName('NUM_CONFIRMING').AsInteger]);
  // DMMain.LogProduccion('Imprimir');
  DMListados.Imprimir(500, 0, Modo, '', '', frConfirming, frxConfirming, nil, nil, Archivo);
end;

procedure TDMLstConfirming.xBancosAfterScroll(DataSet: TDataSet);
begin
  // DMMain.LogProduccion('xConfirming.Open');
  with xConfirming do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['BANCO'].AsInteger := xBancos.FieldByName('BANCO').AsInteger;
     Params.ByName['FECHA'].AsDateTime := FechaVencimiento;
     Open;
  end;
end;

procedure TDMLstConfirming.frConfirmingGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TDMLstConfirming.frConfirmingEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstConfirming.frxConfirmingBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraL]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraL;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraP]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := MascaraP;
              DisplayFormat.Kind := fkNumeric;
           end;
        end;
end;

procedure TDMLstConfirming.frxConfirmingGetValue(const VarName: string; var Value: variant);
begin
  frConfirmingGetValue(VarName, Value);
end;

procedure TDMLstConfirming.xConfirmingAfterOpen(DataSet: TDataSet);
begin
  // DMMain.LogProduccion('QMDetalle.Open');
  QMDetalle.Open;
end;

procedure TDMLstConfirming.xConfirmingBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
end;

end.
