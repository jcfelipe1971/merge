unit UDMLstCarteraRecibos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_DSet, FR_DBSet, DB, FIBDataSet, FIBTableDataSet,
  FIBDatabase, UFIBModificados, FR_Class, Fr_HYReport, UHYReport, Math,
  FIBDataSetRO, ALetras, FIBQuery, HYFIBQuery, frxClass, frxHYReport;

type
  TDMLstCarteraRecibos = class(TDataModule)
     frRecibos: TfrHYReport;
     TLocal: THYTransaction;
     xDirecCli: TFIBDataSetRO;
     xCli: TFIBDataSetRO;
     DSxDirecCli: TDataSource;
     DSxCli: TDataSource;
     xLoc_T: TFIBDataSetRO;
     DSxLoc_T: TDataSource;
     xTipoEfecto: TFIBDataSetRO;
     xClienteRecibo: TFIBDataSetRO;
     xLocalidadEmpresa: TFIBDataSetRO;
     DSxTipoEfecto: TDataSource;
     DSxClienteRecibo: TDataSource;
     DSxLocalidadEmpresa: TDataSource;
     xTerceroEmpresa: TFIBDataSetRO;
     DSxTerceroEmpresa: TDataSource;
     xRecibos: TFIBDataSetRO;
     DSxRecibos: TDataSource;
     frDBxRecibos: TfrDBDataSet;
     xBancoCliRe: TFIBDataSetRO;
     DSxBancoCliRe: TDataSource;
     DSxBancosRe: TDataSource;
     xBancosRe: TFIBDataSetRO;
     HYRRecibos: THYReport;
     HYRSxRecibos: THYReportSource;
     HYRSxLocalidadEmpresa: THYReportSource;
     HYRSxBancoCliRe: THYReportSource;
     HYRSxClienteRecibo: THYReportSource;
     HYRSxCli: THYReportSource;
     HYRSxBancosRe: THYReportSource;
     HYRSxLoc_T: THYReportSource;
     xInfoBanco: TFIBDataSetRO;
     HYRxInfoBanco: THYReportSource;
     HYRxDirecCli: THYReportSource;
     Letras: TLetra;
     xSerie: TFIBDataSetRO;
     DSxSerie: TDataSource;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     xDetalleFacturas: TFIBDataSetRO;
     DSxDetalleFacturas: TDataSource;
     HYRxDetalleFacturasKri: THYReportSource;
     xDobleRecibos: TFIBDataSetRO;
     DSxDobleRecibos: TDataSource;
     frDBxDobleRecibos: TfrDBDataSet;
     xDobleCli: TFIBDataSetRO;
     DSxDobleCli: TDataSource;
     xDobleBancoCliRe: TFIBDataSetRO;
     DSxDobleBancoCliRe: TDataSource;
     xDobleTerceroEmpresa: TFIBDataSetRO;
     DSxDobleTerceroEmpresa: TDataSource;
     xDobleTipoEfecto: TFIBDataSetRO;
     DSxDobleTipoEfecto: TDataSource;
     xDobleClienteRecibo: TFIBDataSetRO;
     DSxDobleClienteRecibo: TDataSource;
     xDobleInfoBanco: TFIBDataSetRO;
     DSxDobleInfoBanco: TDataSource;
     xDobleBancoRe: TFIBDataSetRO;
     DSxDobleBancoRe: TDataSource;
     xDobleDirecCli: TFIBDataSetRO;
     DSxDobleDirecCli: TDataSource;
     xDobleLoc_T: TFIBDataSetRO;
     DSxDobleLoc_T: TDataSource;
     frDBxDetalleFacturas: TfrDBDataSet;
     xBancoProv: TFIBDataSetRO;
     DSxBancoProv: TDataSource;
     xDobleBancoProv: TFIBDataSetRO;
     DSxDobleBancoProv: TDataSource;
     TUpdate: THYTransaction;
     frxRecibos: TfrxHYReport;
     procedure DMLstCarteraRecibosCreate(Sender: TObject);
     procedure DMLstCarteraRecibosDestroy(Sender: TObject);
     procedure frRecibosEnterRect(Memo: TStringList; View: TfrView);
     procedure frRecibosGetValue(const ParName: string; var ParValue: variant);
     procedure HYRRecibosEnterFields(Sender: THYReport; Field: THYField; var Source: string);
     procedure xRecibosAfterOpen(DataSet: TDataSet);
     procedure xCliAfterOpen(DataSet: TDataSet);
     procedure xTerceroEmpresaAfterOpen(DataSet: TDataSet);
     procedure xDirecCliAfterOpen(DataSet: TDataSet);
     procedure xBancoCliReAfterOpen(DataSet: TDataSet);
     procedure xDobleCliAfterOpen(DataSet: TDataSet);
     procedure xDobleBancoCliReAfterOpen(DataSet: TDataSet);
     procedure xDobleDirecCliAfterOpen(DataSet: TDataSet);
     procedure xDobleRecibosAfterOpen(DataSet: TDataSet);
     procedure frRecibosPrintReport;
     procedure frxRecibosPrintReport(Sender: TObject);
     procedure HYRRecibosPrintReport(Sender: THYReport);
  private
     { Private declarations }
     Total: double;
     LocalMascaraN, LocalMascaraL: string;
     procedure ImprimirRecibos(const Serie: string; Modo: integer);
     procedure MarcaRecibo;
  public
     { Public declarations }
     procedure ImprimirUnRecibo(Modo: integer; Signo: string; Ejercicio, Registro, Linea: integer);
     procedure ImprimirRecibosFactura(const Signo, Serie, Tipo: string; Ejercicio, Rig: integer; Modo: smallint);
     procedure ImprimirRecibosDeFacturas(const Signo, Serie, Tipo: string; RIGMin, RigMax, Modo: integer);
     procedure RefrescarSerie(const Serie: string);
     function RangoSerie: string;
     function RangoFacturaMin(const Serie, Tipo: string): string;
     function RangoFacturaMax(const Serie, Tipo: string): string;
     procedure ImprimirRecibosDeFacturasFiltradas(const Signo, Serie, Tipo, Filtro: string; Modo: integer);
     procedure ImprimirRecibosFiltrados(aSQL: string; Empresa, Ejercicio, Canal: integer; Signo: string);
  end;

var
  DMLstCarteraRecibos : TDMLstCarteraRecibos;

implementation

uses UEntorno, UDMMain, UFormGest, UDMListados, UUtiles;

{$R *.DFM}

procedure TDMLstCarteraRecibos.DMLstCarteraRecibosCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);

  Letras.DescDecimales := _('céntimos');
  Letras.Separador := DecimalSeparator;
end;

procedure TDMLstCarteraRecibos.DMLstCarteraRecibosDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstCarteraRecibos.ImprimirUnRecibo(Modo: integer; Signo: string; Ejercicio, Registro, Linea: integer);
begin
  // Filtrar Recibos
  with xRecibos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_RECIBOS_CARTERA ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' SIGNO = ?SIGNO AND ');
     SelectSQL.Add(' REGISTRO = ?REGISTRO AND ');
     SelectSQL.Add(' LINEA = ?LINEA ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SIGNO'].AsString := Signo;
     Params.ByName['REGISTRO'].AsInteger := Registro;
     Params.ByName['LINEA'].AsInteger := Linea;
     Open;
  end;

  ImprimirRecibos('', Modo);
end;

// Imprimir los Recibos de una Factura
procedure TDMLstCarteraRecibos.ImprimirRecibosFactura(const Signo, Serie, Tipo: string; Ejercicio, Rig: integer; Modo: smallint);
begin
  // Filtrar Recibos
  with xRecibos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_RECIBOS_CARTERA ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' SIGNO = ?SIGNO AND ');
     SelectSQL.Add(' DOC_NUMERO = ?RIG AND ');
     SelectSQL.Add(' DOC_SERIE = ?SERIE AND ');
     SelectSQL.Add(' DOC_TIPO = ?TIPO ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SIGNO'].AsString := Signo;
     Params.ByName['RIG'].AsInteger := Rig;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := Tipo;
     Open;
  end;

  ImprimirRecibos(Serie, Modo);
end;

// Procedimiento que Previsualiza/Imprime los recibos ya filtrados
procedure TDMLstCarteraRecibos.ImprimirRecibos(const Serie: string; Modo: integer);
var
  Titulo : string;
begin
  Titulo := _('Recibo') + '-' + xRecibos.FieldByName('SIGNO').AsString + '-' + xRecibos.FieldByName('EJERCICIO').AsString + '-' + xRecibos.FieldByName('REGISTRO').AsString + '-' + xRecibos.FieldByName('LINEA').AsString;
  DMListados.Imprimir(1, 0, Modo, Serie, Titulo, frRecibos, frxRecibos, HYRRecibos);
end;

procedure TDMLstCarteraRecibos.frRecibosEnterRect(Memo: TStringList; View: TfrView);
begin
  if (memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
     if (Pos('[MascaraL]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraL;
     if (Pos('[MascaraE]', Memo[0]) > 0) then
        View.FormatStr := '###,###,##0.00';
  end;
end;

procedure TDMLstCarteraRecibos.frRecibosGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'DobleReciboKri' then {dji lrk kri}
  begin
     with xDobleRecibos do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := xRecibos.FieldByName('EMPRESA').AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xRecibos.FieldByName('EJERCICIO').AsInteger;
        Params.ByName['CANAL'].AsInteger := xRecibos.FieldByName('CANAL').AsInteger;
        Params.ByName['REMESA'].AsInteger := xRecibos.FieldByName('REMESA').AsInteger;
        Params.ByName['REGISTRO'].AsInteger := xRecibos.FieldByName('REGISTRO').AsInteger;
        Params.ByName['COD_CLI_PRO'].AsInteger := xRecibos.FieldByName('COD_CLI_PRO').AsInteger;
        Params.ByName['VENCIMIENTO'].AsDateTime := xRecibos.FieldByName('VENCIMIENTO').AsDateTime;
        Open;
     end;
     ParValue := '';
  end;

  if ParName = 'DobleLetras' then {dji lrk kri}
  begin
     Letras.Numero := xDobleRecibos.FieldByName('LIQUIDO_CANAL').AsFloat;
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString :=
           xRecibos.FieldByName('MONEDA_CANAL').AsString;
        Open;
        Letras.Moneda := LowerCase(xMonedas.FieldByName('TITULO').AsString);
        Letras.GeneroMasculino :=
           (xMonedas.FieldByName('GENERO_MASCULINO').AsInteger = 1);
        Letras.Decimales := xMonedas.FieldByName('DEC_VER').AsInteger;
        Letras.DescDecimales := xMonedas.FieldByName('DESC_DECIMALES').AsString;
     end;
     ParValue := Letras.AsString + ' ' + Letras.Moneda;
  end;

  if ParName = 'Registro' then
  begin
     // Actualizar las máscaras para el recibo actual
     LocalMascaraN := DMMain.MascaraMoneda(xRecibos.FieldByName('MONEDA').AsString, 1);
     LocalMascaraL := DMMain.MascaraMoneda(xRecibos.FieldByName('MONEDA').AsString, 0);
  end;

  if ParName = 'Inicializa' then
     Total := 0;
  if ParName = 'Liquido' then
     Total := Total + xRecibos.FieldByName('LIQUIDO').AsCurrency;
  if ParName = 'Total' then
     ParValue := Total;
  if ParName = 'Letras' then
  begin
     Letras.Numero := xRecibos.FieldByName('LIQUIDO').AsFloat;
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := xRecibos.FieldByName('MONEDA').AsString;
        Open;
        Letras.Moneda := LowerCase(xMonedas.FieldByName('TITULO').AsString);
        Letras.GeneroMasculino := (xMonedas.FieldByName('GENERO_MASCULINO').AsInteger = 1);
        Letras.Decimales := xMonedas.FieldByName('DEC_VER').AsInteger;
        Letras.DescDecimales := xMonedas.FieldByName('DESC_DECIMALES').AsString;
        if (Letras.Decimales = 2) then
           ParValue := Letras.AsString
        else
           ParValue := Letras.AsString + ' ' + Letras.Moneda;
     end;
  end;

  if ParName = 'Num_Recibo' then
     ParValue := Copy(xRecibos.FieldByName('EJERCICIO').AsString, 3, 2) + '/' +
        StringOfChar('0', 4 - Length(xRecibos.FieldByName('DOC_NUMERO').AsString)) +
        xRecibos.FieldByName('DOC_NUMERO').AsString +
        StringOfChar('0', 4 - Length(xRecibos.FieldByName('REGISTRO').AsString)) +
        xRecibos.FieldByName('REGISTRO').AsString +
        StringOfChar('0', 2 - Length(xRecibos.FieldByName('LINEA').AsString)) +
        xRecibos.FieldByName('LINEA').AsString + '/' +
        xRecibos.FieldByName('DOC_SERIE').AsString;

  if ParName = 'TelfEmpresa' then
     ParValue := REntorno.Tel1Empresa;
  if ParName = 'FaxEmpresa' then
     ParValue := REntorno.FaxEmpresa;
end;

procedure TDMLstCarteraRecibos.HYRRecibosEnterFields(Sender: THYReport; Field: THYField; var Source: string);
var
  sl : TStrings;
begin
  if Source = '[CAMBIA_RECIBO]' then
  begin
     // Actualizar las máscaras para el recibo actual
     LocalMascaraN := DMMain.MascaraMoneda(xRecibos.FieldByName('MONEDA').AsString, 1);
     LocalMascaraL := DMMain.MascaraMoneda(xRecibos.FieldByName('MONEDA').AsString, 0);
     Source := ' ';
  end;

  if Source = '[EMPRESA_LOCALIDAD]' then
     Source := REntorno.PobEmpresa;

  if Source = '[PAIS_PROVINCIA_RECIBO]' then
     Source := Copy(xLocalidadEmpresa.FieldByName('PROVINCIA').AsString + ' (' +
        xLocalidadEmpresa.FieldByName('PAIS').AsString + ')', 1, 20);

  if Source = '[NUMERO_RECIBO]' then
     Source := xRecibos.FieldByName('EJERCICIO').AsString + '.' +
        xRecibos.FieldByName('DOC_SERIE').AsString +
        '.' + StringOfChar('0', 6 - Length(xRecibos.FieldByName('DOC_NUMERO').AsString)) +
        xRecibos.FieldByName('DOC_NUMERO').AsString + '/' +
        xRecibos.FieldByName('REGISTRO').AsString +
        '.' + xRecibos.FieldByName('LINEA').AsString;

  if Source = '[IMPORTE]' then
  begin
     Source := FormatFloat(LocalMascaraN, xRecibos.FieldByName('LIQUIDO').AsFloat);
     RellenarArteriscos(Source, 11);
  end;

  {dji lrk kri}
  if Source = '[DET_LIQUIDO]' then
  begin
     LocalMascaraN := DMMain.MascaraMoneda(xRecibos.FieldByName('MONEDA').AsString, 1);
     LocalMascaraL := DMMain.MascaraMoneda(xRecibos.FieldByName('MONEDA').AsString, 0);
     Source := FormatFloat(LocalMascaraN, xDetalleFacturas.FieldByName(
        'LIQUIDO').AsFloat);
     RellenarArteriscos(Source, 11);
  end;

  {dji lrk kri}
  if Source = '[DET_DOC_LIQUIDO]' then
  begin
     LocalMascaraN := DMMain.MascaraMoneda(xRecibos.FieldByName('MONEDA').AsString, 1);
     LocalMascaraL := DMMain.MascaraMoneda(xRecibos.FieldByName('MONEDA').AsString, 0);
     Source := FormatFloat(LocalMascaraN, xDetalleFacturas.FieldByName(
        'DOC_LIQUIDO').AsFloat);
     RellenarArteriscos(Source, 11);
  end;

  if Source = '[NUMERO_RECIBO_2]' then
     Source := Copy(xRecibos.FieldByName('EJERCICIO').AsString, 3, 2) + '/' +
        StringOfChar('0', 4 - Length(xRecibos.FieldByName('DOC_NUMERO').AsString)) +
        xRecibos.FieldByName('DOC_NUMERO').AsString +
        StringOfChar('0', 4 - Length(xRecibos.FieldByName('REGISTRO').AsString)) +
        xRecibos.FieldByName('REGISTRO').AsString +
        StringOfChar('0', 2 - Length(xRecibos.FieldByName('LINEA').AsString)) +
        xRecibos.FieldByName('LINEA').AsString + '/' +
        xRecibos.FieldByName('DOC_SERIE').AsString;

  if Source = '[DC]' then
     Source := Copy(xBancoCliRe.FieldByName('CONTROL').AsString, 1, 1) + ' ' +
        Copy(xBancoCliRe.FieldByName('CONTROL').AsString, 2, 1);

  if Source = '[IMPORTE_LETRA]' then
  begin
     Letras.Numero := xRecibos.FieldByName('LIQUIDO').AsFloat;
     // Para mostrar la moneda correcta.
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := xRecibos.FieldByName('MONEDA').AsString;
        Open;
        Letras.Moneda := xMonedas.FieldByName('TITULO').AsString;
        Letras.GeneroMasculino := (xMonedas.FieldByName('GENERO_MASCULINO').AsInteger = 1);
        Letras.Decimales := xMonedas.FieldByName('DEC_VER').AsInteger;
        Letras.DescDecimales := xMonedas.FieldByName('DESC_DECIMALES').AsString;
     end;
     Source := UpperCase(Letras.AsString + ' ' + Letras.Moneda);
  end;

  if Source = '[IMPORTE_LETRA1]' then
  begin
     Letras.Numero := xRecibos.FieldByName('LIQUIDO').Value;

     // Para mostrar la moneda correcta.
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := xRecibos.FieldByName('MONEDA').AsString;
        Open;
        Letras.Moneda := LowerCase(xMonedas.FieldByName('TITULO').AsString);
        Letras.GeneroMasculino := (xMonedas.FieldByName('GENERO_MASCULINO').AsInteger = 1);
        Letras.Decimales := xMonedas.FieldByName('DEC_VER').AsInteger;
        Letras.DescDecimales := xMonedas.FieldByName('DESC_DECIMALES').AsString;
     end;
     sl := Letras.Texto;
     Source := sl[0];
     sl.Free;
  end;

  if Source = '[IMPORTE_LETRA2]' then
  begin
     sl := Letras.Texto;
     if (sl.Count > 1) then
        Source := sl[1]
     else
        Source := ' ';
     sl.Free;
  end;

  if Source = '[LIQUIDO]' then
  begin
     Source := FormatFloat(LocalMascaraN, xRecibos.FieldByName('LIQUIDO').AsFloat);
  end;

  if Source = ' ' then
     Source := '';
end;

procedure TDMLstCarteraRecibos.xRecibosAfterOpen(DataSet: TDataSet);
begin
  xCli.Close;
  xCli.Open;
  xClienteRecibo.Close;
  xClienteRecibo.Open;
  xTipoEfecto.Close;
  xTipoEfecto.Open;
  xBancoCliRe.Close;
  xBancoCliRe.Open;
  {dji lrk kri}
  if xRecibos.FieldByName('SIGNO').AsString = 'P' then
  begin
     xBancoProv.Close;
     xBancoProv.Open;
  end;
  xDetalleFacturas.Close;
  xDetalleFacturas.Open;
end;

procedure TDMLstCarteraRecibos.xCliAfterOpen(DataSet: TDataSet);
begin
  xTerceroEmpresa.Close;
  xTerceroEmpresa.Open;
  xDirecCli.Close;
  xDirecCli.Open;
end;

procedure TDMLstCarteraRecibos.xTerceroEmpresaAfterOpen(DataSet: TDataSet);
begin
  xLocalidadEmpresa.Close;
  xLocalidadEmpresa.Open;
end;

procedure TDMLstCarteraRecibos.xDirecCliAfterOpen(DataSet: TDataSet);
begin
  xLoc_T.Close;
  xLoc_T.Open;
end;

procedure TDMLstCarteraRecibos.xBancoCliReAfterOpen(DataSet: TDataSet);
begin
  xBancosRe.Close;
  xBancosRe.Open;
  xInfoBanco.Close;
  xInfoBanco.Open;
end;

// **************************************************************

// Recibos de Facturas

// Imprimir Recibos entre dos Facturas
procedure TDMLstCarteraRecibos.ImprimirRecibosDeFacturas(const Signo, Serie, Tipo: string; RIGMin, RigMax, Modo: integer);
begin
  DMListados.Normalizar_Desde_Hasta(RIGMin, RIGMax);

  // Filtrar Recibos
  with xRecibos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_RECIBOS_CARTERA ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' SIGNO = ?SIGNO AND ');
     SelectSQL.Add(' DOC_SERIE = ?SERIE AND ');
     SelectSQL.Add(' DOC_TIPO = ?TIPO AND ');
     SelectSQL.Add(' DOC_NUMERO >= ?RIG_MIN AND ');
     SelectSQL.Add(' DOC_NUMERO <= ?RIG_MAX ');
     SelectSQL.Add(' ORDER BY DOC_NUMERO ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SIGNO'].AsString := Signo;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['RIG_MIN'].AsInteger := RIGMin;
     Params.ByName['RIG_MAX'].AsInteger := RIGMax;
     Open;
  end;

  ImprimirRecibos(Serie, Modo);
end;

procedure TDMLstCarteraRecibos.RefrescarSerie(const Serie: string);
begin
  with xSerie do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;
end;

function TDMLstCarteraRecibos.RangoSerie: string;
begin
  Result := '';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(SERIE) FROM VER_SERIES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA=?EMPRESA AND ');
        SQL.Add(' EJERCICIO=?EJERCICIO AND ');
        SQL.Add(' CANAL=?CANAL ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        if HayDatos then
           Result := FieldByName['MIN'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMLstCarteraRecibos.RangoFacturaMin(const Serie, Tipo: string): string;
begin
  Result := '0';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(RIG) FROM GES_CABECERAS_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SERIE = ?SERIE AND ');
        SQL.Add(' TIPO = ?TIPO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;
        if HayDatos then
           Result := IntToStr(FieldByName['MIN'].AsInteger);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMLstCarteraRecibos.RangoFacturaMax(const Serie, Tipo: string): string;
begin
  Result := '0';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MAX(RIG) FROM GES_CABECERAS_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SERIE = ?SERIE AND ');
        SQL.Add(' TIPO = ?TIPO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;
        if HayDatos then
           Result := IntToStr(FieldByName['MAX'].AsInteger);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

// **************************************************************

procedure TDMLstCarteraRecibos.xDobleCliAfterOpen(DataSet: TDataSet);
begin
  xDobleDirecCli.Close;
  xDobleDirecCli.Open;
end;

procedure TDMLstCarteraRecibos.xDobleBancoCliReAfterOpen(DataSet: TDataSet);
begin
  xDobleInfoBanco.Close;
  xDobleInfoBanco.Open;
  xDobleBancoRe.Close;
  xDobleBancoRe.Open;
end;

procedure TDMLstCarteraRecibos.xDobleDirecCliAfterOpen(DataSet: TDataSet);
begin
  xDobleLoc_T.Close;
  xDobleLoc_T.Open;
end;

procedure TDMLstCarteraRecibos.xDobleRecibosAfterOpen(DataSet: TDataSet);
begin
  xDobleCli.Close;
  xDobleCli.Open;
  xDobleClienteRecibo.Close;
  xDobleClienteRecibo.Open;
  xDobleTerceroEmpresa.Close;
  xDobleTerceroEmpresa.Open;
  xDobleTipoEfecto.Close;
  xDobleTipoEfecto.Open;
  if xDobleRecibos.FieldByName('SIGNO').AsString = 'P' then
  begin
     xDobleBancoProv.Close;
     xDobleBancoProv.Open;
  end;
  xDobleBancoCliRe.Close;
  xDobleBancoCliRe.Open;
end;

// Imprimir Recibos entre dos Facturas
procedure TDMLstCarteraRecibos.ImprimirRecibosDeFacturasFiltradas(const Signo, Serie, Tipo, Filtro: string; Modo: integer);
begin
  // Filtrar Recibos
  with xRecibos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_RECIBOS_CARTERA CC ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' cc.EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' cc.EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' cc.CANAL = ?CANAL AND ');
     SelectSQL.Add(' cc.SIGNO = ?SIGNO AND ');
     SelectSQL.Add(' cc.DOC_SERIE = ?SERIE AND ');
     SelectSQL.Add(' cc.DOC_TIPO = ?TIPO AND ');
     SelectSQL.Add(' cc.DOC_NUMERO in (select rig from ' + filtro + ') ');
     SelectSQL.Add(' ORDER BY cc.DOC_NUMERO ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SIGNO'].AsString := Signo;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := Tipo;
     Open;
  end;

  ImprimirRecibos(Serie, Modo);
end;

procedure TDMLstCarteraRecibos.ImprimirRecibosFiltrados(aSQL: string; Empresa, Ejercicio, Canal: integer; Signo: string);
begin
  // Filtrar Recibos
  with xRecibos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Text := aSQL;
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SIGNO'].AsString := Signo;
     Open;

     ImprimirRecibos('', 1);

     First;
     while not EOF do
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' UPDATE EMP_CARTERA_DETALLE ');
              SQL.Add(' SET ');
              SQL.Add(' LISTADO = 1 ');
              SQL.Add(' WHERE ');
              SQL.Add(' ID_CARTERA_DETALLE = :ID_CARTERA_DETALLE ');
              Params.ByName['ID_CARTERA_DETALLE'].AsInteger := xRecibos.FieldByName('ID_CARTERA_DETALLE').AsInteger;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        Next;
     end;
  end;
end;

procedure TDMLstCarteraRecibos.frRecibosPrintReport;
begin
  MarcaRecibo;
end;

procedure TDMLstCarteraRecibos.frxRecibosPrintReport(Sender: TObject);
begin
  MarcaRecibo;
end;

procedure TDMLstCarteraRecibos.HYRRecibosPrintReport(Sender: THYReport);
begin
  MarcaRecibo;
end;

procedure TDMLstCarteraRecibos.MarcaRecibo;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE EMP_CARTERA_DETALLE SET LISTADO=1 WHERE ID_CARTERA_DETALLE = ?ID_CARTERA_DETALLE';
        Params.ByName['ID_CARTERA_DETALLE'].AsInteger := xRecibos.FieldByName('ID_CARTERA_DETALLE').AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
