unit UDMLstOrdenesDePago;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FR_DSet,
  FR_DBSet, FR_Class, Fr_HYReport, DBTables, FIBQuery, HYFIBQuery,
  FIBDataSetRO, frxClass, frxHYReport;

type
  TDMLstOrdenesDePago = class(TDataModule)
     TLocal: THYTransaction;
     frOrdenesDePago: TfrHYReport;
     frDBOrdenesDePago: TfrDBDataSet;
     DSxOrdenesDePago: TDataSource;
     xOrdenesDePago: TFIBDataSetRO;
     frDBDetalle: TfrDBDataSet;
     DSxDetalle: TDataSource;
     xDetalle: TFIBDataSetRO;
     frxOrdenesDePago: TfrxHYReport;
     TUpdate: THYTransaction;
     procedure DMLstOrdenesDePagoCreate(Sender: TObject);
     procedure frOrdenesDePagoGetValue(const ParName: string; var ParValue: variant);
     procedure DMLstOrdenesDePagoDestroy(Sender: TObject);
     procedure frOrdenesDePagoEnterRect(Memo: TStringList; View: TfrView);
     procedure frxOrdenesDePagoBeforePrint(Sender: TfrxReportComponent);
     procedure frxOrdenesDePagoGetValue(const VarName: string; var Value: variant);
     procedure xOrdenesDePagoAfterOpen(DataSet: TDataSet);
     procedure xOrdenesDePagoBeforeClose(DataSet: TDataSet);
     //private
     //fecha_vto: TDateTime;
  public
     procedure MuestraListado(Modo, NumOrden: integer);
  end;

var
  DMLstOrdenesDePago : TDMLstOrdenesDePago;

implementation

{$R *.DFM}

uses UDMMain, UDMListados, UFormGest, UEntorno, UDameDato;

procedure TDMLstOrdenesDePago.DMLstOrdenesDePagoCreate(Sender: TObject);
begin
  // Abrir la transacción
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstOrdenesDePago.DMLstOrdenesDePagoDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstOrdenesDePago.MuestraListado(Modo, NumOrden: integer);
begin
  with xOrdenesDePago do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['NUM_ORDEN'].AsInteger := NumOrden;
     Open;
  end;

  DMListados.Imprimir(522, 0, Modo, '', '', frOrdenesDePago, frxOrdenesDePago, nil, nil);
end;

procedure TDMLstOrdenesDePago.frOrdenesDePagoGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'Titulo') then
  begin
     if ((xDetalle.FieldByName('DOC_TIPO').AsString = 'FAP') or (xDetalle.FieldByName('DOC_TIPO').AsString = 'AGP') or
        (xDetalle.FieldByName('DOC_TIPO').AsString = 'NRP')) then
        ParValue := DameTituloProveedor(xDetalle.FieldByName('COD_CLI_PRO').AsInteger)
     else
        ParValue := DameTituloAcreedor(xDetalle.FieldByName('COD_CLI_PRO').AsInteger);
  end;
end;

procedure TDMLstOrdenesDePago.frOrdenesDePagoEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstOrdenesDePago.frxOrdenesDePagoBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMLstOrdenesDePago.frxOrdenesDePagoGetValue(const VarName: string; var Value: variant);
begin
  frOrdenesDePagoGetValue(VarName, Value);
end;

procedure TDMLstOrdenesDePago.xOrdenesDePagoAfterOpen(DataSet: TDataSet);
begin
  xDetalle.Open;
end;

procedure TDMLstOrdenesDePago.xOrdenesDePagoBeforeClose(DataSet: TDataSet);
begin
  xDetalle.Close;
end;

end.
