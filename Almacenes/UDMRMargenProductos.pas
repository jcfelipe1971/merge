unit UDMRMargenProductos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FR_DSet, FR_DBSet, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados, FR_Class, Fr_HYReport, FIBQuery, HYFIBQuery, frxClass,
  frxHYReport;

type
  TDMRMargenProductos = class(TDataModule)
     frMargenProductos: TfrHYReport;
     TLocal: THYTransaction;
     xArt_Desde: TFIBDataSetRO;
     xArt_Hasta: TFIBDataSetRO;
     DSxArt_Desde: TDataSource;
     DSxArt_Hasta: TDataSource;
     xMargenProductos: TFIBDataSetRO;
     xMargenProductosALMACEN: TFIBStringField;
     xMargenProductosARTICULO: TFIBStringField;
     xMargenProductosTITULO: TFIBStringField;
     xMargenProductosUNI_VENDIDAS: TFloatField;
     xMargenProductosIMP_VENTA: TFloatField;
     xMargenProductosPR_VENTAS: TFloatField;
     xMargenProductosUNI_PENDIENTES: TFloatField;
     xMargenProductosUNI_DEPOSITO: TFloatField;
     xMargenProductosUNI_COMPRAS: TFloatField;
     xMargenProductosIMP_COMPRAS: TFloatField;
     xMargenProductosPR_COMPRAS: TFloatField;
     DSxMargenProductos: TDataSource;
     frDBxMargenProductos: TfrDBDataSet;
     QMinArt: THYFIBQuery;
     QMaxArt: THYFIBQuery;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     xMargenProductosSTOCK: TFloatField;
     TUpdate: THYTransaction;
     frxMargenProductos: TfrxHYReport;
     procedure DMRMargenProductosCreate(Sender: TObject);
     procedure DMRMargenProductosDestroy(Sender: TObject);
     procedure frMargenProductosEnterRect(Memo: TStringList; View: TfrView);
     procedure frMargenProductosGetValue(const ParName: string; var ParValue: variant);
     procedure frxMargenProductosBeforePrint(Sender: TfrxReportComponent);
     procedure frxMargenProductosGetValue(const VarName: string; var Value: variant);
  private
     LocalMascaraN: string;
  public
     { Public declarations }
     Articulo_Desde, Articulo_Hasta: string;
     Fecha_Desde, Fecha_Hasta: TDateTime;
     procedure MostrarListado(MTrabajo, Modo: integer; Articulo_Desde, Articulo_Hasta: string; F_Desde, F_Hasta: TDateTime; MostrarCeros: boolean; DProveedor, HProveedor: integer);
     procedure Rangos;
     procedure CambiaMoneda(Moneda: string);
  end;

var
  DMRMargenProductos : TDMRMargenProductos;
  SW : integer;
  ModoTrabajo : smallint;

implementation

{$R *.DFM}

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles;

procedure TDMRMargenProductos.DMRMargenProductosCreate(Sender: TObject);
begin
  // Abrir la transacción
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);
end;

procedure TDMRMargenProductos.DMRMargenProductosDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  Application.ProcessMessages;
end;

procedure TDMRMargenProductos.MostrarListado(MTrabajo, Modo: integer; Articulo_Desde, Articulo_Hasta: string; F_Desde, F_Hasta: TDateTime; MostrarCeros: boolean; DProveedor, HProveedor: integer);
var
  str : string;
  MC : integer;
begin
  LocalMascaraN := DMMain.MascaraMoneda(xMonedas.FieldByName('MONEDA').AsString, 1);

  if MostrarCeros then
     MC := 1
  else
     MC := 0;

  with xMargenProductos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ARTICULO_INI'].AsString := Articulo_Desde;
     Params.ByName['ARTICULO_FIN'].AsString := Articulo_Hasta;
     Params.ByName['FECHA_INI'].AsDateTime := F_Desde;
     Params.ByName['FECHA_FIN'].AsDateTime := F_Hasta;
     Params.ByName['MODO'].AsInteger := MTrabajo;
     Params.ByName['MONEDA'].AsString := xMonedas.FieldByName('MONEDA').AsString;
     Params.ByName['DPROVEEDOR'].AsInteger := DProveedor; {dji lrk kri}
     Params.ByName['HPROVEEDOR'].AsInteger := HProveedor; {dji lrk kri}
     Params.ByName['MOSTRARCEROS'].AsInteger := MC;
     Open;
  end;

  SW := 1;
  ModoTrabajo := MTrabajo;
  DMListados.Cargar(504, '');

  if (REntorno.TipoListado = 'FRF') then
  begin
     frMargenProductos.LoadFromFIB(REntorno.Formato, str);
     frMargenProductos.PrepareReport;
     case Modo of
        0: frMargenProductos.ShowPreparedReport;
        1: frMargenProductos.PrintPreparedReport('', REntorno.Copias);
     end;
  end;
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxMargenProductos.LoadFromFIB(REntorno.Formato, str);
     frxMargenProductos.PrepareReport;
     case Modo of
        0: frxMargenProductos.ShowPreparedReport;
        1: frxMargenProductos.PrintPreparedReport('', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TDMRMargenProductos.Rangos;
begin
  DameMinMax('EJE', Fecha_Desde, Fecha_Hasta);

  // Artículos
  with QMinArt do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     ExecQuery;
     Articulo_Desde := FieldByName['MINIMO'].AsString;
     FreeHandle;
  end;

  with QMaxArt do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     ExecQuery;
     Articulo_Hasta := FieldByName['MAXIMO'].AsString;
     FreeHandle;
  end;
end;

procedure TDMRMargenProductos.frMargenProductosEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
     if (Pos('[MascaraE]', Memo[0]) > 0) then
        View.FormatStr := '###,###,##0.00';
  end;
end;

procedure TDMRMargenProductos.frMargenProductosGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'ModoTrabajo' then
     ParValue := ModoTrabajo;
  if ParName = 'Titulo_Moneda' then
     ParValue := xMonedas.FieldByName('TITULO').AsString;
end;

procedure TDMRMargenProductos.CambiaMoneda(Moneda: string);
begin
  with xMonedas do
  begin
     Close;
     Params.ByName['MONEDA'].AsString := Moneda;
     Open;
  end;
end;

procedure TDMRMargenProductos.frxMargenProductosBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
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
           if Pos('[MascaraE]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := '###,###,##0.00';
              DisplayFormat.Kind := fkNumeric;
           end;
        end;
end;

procedure TDMRMargenProductos.frxMargenProductosGetValue(const VarName: string; var Value: variant);
begin
  frMargenProductosGetValue(VarName, Value);
end;

end.
