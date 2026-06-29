unit UDMRDiarioStock;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, FIBDataSet, FIBTableDataSet, FIBQuery, FR_DSet, FR_DBSet, FR_Class,
  Fr_HYReport, FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery,
  frxClass, frxHYReport;

type
  TDMRDiarioStock = class(TDataModule)
     DSArt_Mov_Stock: TDataSource;
     QMArt_Mov_Stock: TFIBDataSetRO;
     frDiarioStock: TfrHYReport;
     frDBDSArt_Mov_Stock: TfrDBDataSet;
     TLocal: THYTransaction;
     xPeriodo_Desde: TFIBDataSetRO;
     xPeriodo_Hasta: TFIBDataSetRO;
     DSxPeriodo_Desde: TDataSource;
     DSxPeriodo_Hasta: TDataSource;
     QMinFecha: THYFIBQuery;
     QMaxFecha: THYFIBQuery;
     QMinPeriodo: THYFIBQuery;
     QMaxPeriodo: THYFIBQuery;
     xMonedas: TFIBDataSetRO;
     QInfoPeriodos: THYFIBQuery;
     QGen: THYFIBQuery;
     frxDiarioStock: TfrxHYReport;
     TUpdate: THYTransaction;
     procedure frDiarioStockEnterRect(Memo: TStringList; View: TfrView);
     procedure frDiarioStockGetValue(const ParName: string; var ParValue: variant);
     procedure DMRDiarioStockCreate(Sender: TObject);
     procedure DMRDiarioStockDestroy(Sender: TObject);
     procedure frxDiarioStockBeforePrint(Sender: TfrxReportComponent);
     procedure frxDiarioStockGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     LocalMascaraN: string;
     ImporteLinea: double;
  public
     SumaSalida, SumaEntrada: double; // Totales
     Limites: string;
     Periodo_Desde, Periodo_Hasta: string;
     Fecha_Desde, Fecha_Hasta: TDate;
     procedure Rangos;
     procedure MostrarListado(ListaCanales: TStringList; Modo: smallint; Desde_Periodo, Hasta_Periodo: string; Desde_Fecha, Hasta_Fecha: TDateTime);
  end;

var
  DMRDiarioStock : TDMRDiarioStock;

implementation

{$R *.DFM}

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles, UDMMultiSeleccion;

procedure TDMRDiarioStock.DMRDiarioStockCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);
end;

procedure TDMRDiarioStock.DMRDiarioStockDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMRDiarioStock.MostrarListado(ListaCanales: TStringList; Modo: smallint; Desde_Periodo, Hasta_Periodo: string; Desde_Fecha, Hasta_Fecha: TDateTime);
begin
  DMListados.Normalizar_Desde_Hasta(Desde_Periodo, Hasta_Periodo);
  DMListados.Normalizar_Desde_Hasta(Desde_Fecha, Hasta_Fecha);

  with QInfoPeriodos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['PERIODO'].AsString := Desde_Periodo;
     ExecQuery;
     Desde_Periodo := FieldByName['P_DESDE'].AsString;
     Close;
     FreeHandle;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['PERIODO'].AsString := Hasta_Periodo;
     ExecQuery;
     Hasta_Periodo := FieldByName['P_HASTA'].AsString;
     FreeHandle;
  end;

  Desde_Fecha := HourIntoDate(Desde_Fecha, '00:00:00');
  Hasta_Fecha := HourIntoDate(Hasta_Fecha, '23:59:59');

  //Inicializamos los totales
  SumaEntrada := 0;
  SumaSalida := 0;
  Limites := Format(_('Canal %s Periodos %s - %s Fechas %s - %s'), [DMMultiSeleccion.CanalesPorComas(ListaCanales), Desde_Periodo, Hasta_Periodo, DateToStr(Desde_Fecha), DateToStr(Hasta_Fecha)]);

  with QMArt_Mov_Stock do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM VER_ART_MOV_STOCKS ' +
        'WHERE (EMPRESA=?EMPRESA)AND(EJERCICIO=?EJERCICIO)AND' +
        '(FECHA >= ?DESDE_FECHA)AND(FECHA <= ?HASTA_FECHA)AND' +
        '(PERIODO >= ?DESDE_PERIODO)AND(PERIODO <= ?HASTA_PERIODO)' +
        DMMultiSeleccion.WhereCanales(ListaCanales) +
        'ORDER BY FECHA';

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['DESDE_FECHA'].AsDateTime := Desde_Fecha;
     Params.ByName['HASTA_FECHA'].AsDateTime := Hasta_Fecha;
     Params.ByName['DESDE_PERIODO'].AsString := Desde_Periodo;
     Params.ByName['HASTA_PERIODO'].AsString := Hasta_Periodo;
     Open;
  end;

  //  QMArt_Articulos.Open;

  DMListados.Imprimir(23, 0, Modo, '', '', frDiarioStock, frxDiarioStock, nil, nil);
end;

procedure TDMRDiarioStock.Rangos;
begin
  Periodo_Desde := DMMain.DamePeriodo(REntorno.FechaTrab);
  Periodo_Hasta := Periodo_Desde;

  Fecha_Desde := REntorno.FechaTrab;
  Fecha_Hasta := REntorno.FechaTrab;
end;

procedure TDMRDiarioStock.frDiarioStockEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[LocalMascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
  end;
end;

procedure TDMRDiarioStock.frDiarioStockGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Inicializa' then
  begin
     SumaEntrada := 0;
     SumaSalida := 0;
  end;

  if ParName = 'ActualizaMascara' then
     LocalMascaraN := DMMain.MascaraMoneda(QMArt_Mov_Stock.FieldByName('MONEDA').AsString, 1);

  if ParName = 'Titulo_Moneda' then
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := REntorno.Moneda;
        Open;
        ParValue := xMonedas.FieldByName('TITULO').AsString;
     end;

  if ParName = 'Limites' then
     ParValue := Limites;

  if ParName = 'SValor' then
  begin
     ImporteLinea := DMMain.DameCambio(False, QMArt_Mov_Stock.FieldByName('MONEDA').AsString, REntorno.Moneda, QMArt_Mov_Stock.FieldByName('FECHA').AsDateTime, QMArt_Mov_Stock.FieldByName('IMPORTE').AsFloat);

     if (QMArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'E') or
        (QMArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'A') or
        (QMArt_Mov_Stock.FieldByName('TIPO_OPER').AsString = 'D') then
        SumaEntrada := SumaEntrada + ImporteLinea
     else
        SumaSalida := SumaSalida + ImporteLinea;
  end;

  if ParName = 'TOTALENTRADAS' then
     ParValue := SumaEntrada;
  if ParName = 'TOTALSALIDAS' then
     ParValue := SumaSalida;
end;

procedure TDMRDiarioStock.frxDiarioStockBeforePrint(Sender: TfrxReportComponent);
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
           if Pos('[LocalMascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraN;
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
           {if Pos('[MascaraI]', Memo[0]) > 0 then begin
          DisplayFormat.FormatStr := MascaraI;
          DisplayFormat.Kind := fkNumeric;
        end;}
        end;
end;

procedure TDMRDiarioStock.frxDiarioStockGetValue(const VarName: string; var Value: variant);
begin
  frDiarioStockGetValue(VarName, Value);
end;

end.
