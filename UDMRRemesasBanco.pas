unit UDMRRemesasBanco;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_Class, Fr_HYReport, DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet,
  FIBDatabase, UFIBModificados, UHYReport, FIBQuery, Math,
  FIBDataSetRO, HYFIBQuery, ALetras, frxClass, frxHYReport;

type
  TDMRRemesasBanco = class(TDataModule)
     frRemesas: TfrHYReport;
     xCabecera: TFIBDataSetRO;
     xDetalle: TFIBDataSetRO;
     DSxDetalle: TDataSource;
     DSxCabecera: TDataSource;
     xCliente: TFIBDataSetRO;
     xProveedor: TFIBDataSetRO;
     xBanco: TFIBDataSetRO;
     frDSxDetalle: TfrDBDataSet;
     frDSxCabecera: TfrDBDataSet;
     DSxBanco: TDataSource;
     frDBxBanco: TfrDBDataSet;
     DSxProveedor: TDataSource;
     frDBxProveedor: TfrDBDataSet;
     DSxCliente: TDataSource;
     frDBxCliente: TfrDBDataSet;
     TLocal: THYTransaction;
     xBancoCli: TFIBDataSetRO;
     DSxBancoCli: TDataSource;
     DSxBancos: TDataSource;
     xBancos: TFIBDataSetRO;
     HYRRemesas: THYReport;
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
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     Letras: TLetra;
     DSxDetalleFacturas: TDataSource;
     xDetalleFacturas: TFIBDataSetRO;
     HYRxDetalleFacturas: THYReportSource;
     frDBxDetalleFacturas: TfrDBDataSet;
     xDobleRecibos: TFIBDataSetRO;
     DSxDobleRecibos: TDataSource;
     frDBxDobleRecibos: TfrDBDataSet;
     xDobleTipoEfecto: TFIBDataSetRO;
     DSxDobleTipoEfecto: TDataSource;
     xDobleCli: TFIBDataSetRO;
     DSxDobleCli: TDataSource;
     xDobleBancoCliRe: TFIBDataSetRO;
     DSxDobleBancoCliRe: TDataSource;
     xDobleTerceroEmpresa: TFIBDataSetRO;
     DSxDobleTerceroEmpresa: TDataSource;
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
     HYRSxCliKRI: THYReportSource;
     xCliKRI: TFIBDataSetRO;
     DSxCliKRI: TDataSource;
     frxRemesas: TfrxHYReport;
     frDBxDobleBancoRe: TfrDBDataSet;
     TUpdate: THYTransaction;
     procedure DMRCabeceraDestroy(Sender: TObject);
     procedure frRemesasGetValue(const ParName: string; var ParValue: variant);
     procedure frRemesasEnterRect(Memo: TStringList; View: TfrView);
     procedure DMRRemesasBancoCreate(Sender: TObject);
     procedure HYRRemesasEnterFields(Sender: THYReport; Field: THYField; var Source: string);
     procedure xCliAfterOpen(DataSet: TDataSet);
     procedure xDirecCliAfterOpen(DataSet: TDataSet);
     procedure xTerceroEmpresaAfterOpen(DataSet: TDataSet);
     procedure xRecibosAfterOpen(DataSet: TDataSet);
     procedure HYRRemesasPrepareFields(Sender: THYReport; Field: THYField; Contents: TStrings);
     procedure xBancoCliReAfterOpen(DataSet: TDataSet);
     procedure xDetalleAfterOpen(DataSet: TDataSet);
     procedure xDobleRecibosAfterOpen(DataSet: TDataSet);
     procedure xDobleBancoCliReAfterOpen(DataSet: TDataSet);
     procedure xDobleCliAfterOpen(DataSet: TDataSet);
     procedure xDobleDirecCliAfterOpen(DataSet: TDataSet);
     procedure xRecibosAfterScroll(DataSet: TDataSet);
     procedure xClienteReciboAfterScroll(DataSet: TDataSet);
     procedure frxRemesasBeforePrint(Sender: TfrxReportComponent);
     procedure frxRemesasGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     Total: double;
     LocalMascaraN, LocalMascaraL: string;
  public
     { Public declarations }
     procedure MostrarListado(Remesa, IdRemesa: integer; Signo, SQL: string);
     procedure CargaDatos(var FechaDesde, FechaHasta: TDateTime; var ClienteDesde, ClienteHasta: integer);
     procedure MostrarListadoRecibos(Modo: smallint; min_fecha, max_fecha: TDateTime; min_cliente, max_cliente, Dremesa: integer; Hremesa: integer; DFPago: string; HFPago: string);
  end;

var
  DMRRemesasBanco : TDMRRemesasBanco;
  SW : integer;

implementation

uses UEntorno, UDMMain, UFormGest, UDMListados, UUtiles;

{$R *.DFM}

procedure TDMRRemesasBanco.DMRRemesasBancoCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  if (DMMain.EstadoKri(213) = 1) then
  begin
     with xDetalle.SelectSQL do
     begin
        Clear;
        Add(' SELECT COD_CLI_PRO, EMPRESA, EJERCICIO, CANAL, SIGNO, REGISTRO, LINEA, VENCIMIENTO, CTA_PAGO, LIQUIDO, LIQUIDO_CANAL, ');
        Add('        PAGADO, IMPAGADO, FORMA_PAGO, TIPO_EFECTO, ACEPTADO, REMESAR, ESTADO, REMESA, DOC_NUMERO, DOC_SERIE, DOC_FECHA, ');
        Add('        DOC_TIPO, RIC, RIVA, FECHA_CIERRE, ESTADO_RECIBO, RECIBIDO, FECHA_REGISTRO, EJERCICIO_CARTERA, MONEDA, ');
        Add('        MONEDA_CANAL, BANCO_KRI, FP_TITULO, FECHA_VALOR, ABONO, EJERCICIO_ABONO, ORIGEN_IMPAGADO, TITULO, PAIS, ');
        Add('        NOMBRE_COMERCIAL, NOMBRE_R_SOCIAL, TERCERO, ID_CARTERA, ID_CARTERA_DETALLE, ID_DOC, ID_REMESAS, ');
        Add('        AGRUP_COD_CLI_PRO_KRI ');
        Add(' FROM VER_CARTERA_REMESA ');
        Add(' WHERE ');
        Add(' ID_REMESAS = :ID_REMESAS AND ');
        Add(' AGRUP_COD_CLI_PRO_KRI = 0 ');
        Add(' UNION ');
        Add(' SELECT AGRUP_COD_CLI_PRO_KRI AS COD_CLI_PRO, MIN(EMPRESA), MIN(EJERCICIO), MIN(CANAL), MIN(SIGNO), MIN(REGISTRO), ');
        Add('        MIN(LINEA), MIN(VENCIMIENTO), MIN(CTA_PAGO), SUM(LIQUIDO), SUM(LIQUIDO_CANAL), MIN(PAGADO), MIN(IMPAGADO), ');
        Add('        MIN(FORMA_PAGO), MIN(TIPO_EFECTO), MIN(ACEPTADO), MIN(REMESAR), MIN(ESTADO), MIN(REMESA), MIN(DOC_NUMERO), ');
        Add('        MIN(DOC_SERIE), MIN(DOC_FECHA), MIN(DOC_TIPO), MIN(RIC), MIN(RIVA), MIN(FECHA_CIERRE), MIN(ESTADO_RECIBO), ');
        Add('        MIN(RECIBIDO), MIN(FECHA_REGISTRO), MIN(EJERCICIO_CARTERA), MIN(MONEDA), MIN(MONEDA_CANAL), MIN(BANCO_KRI), ');
        Add('        MIN(FP_TITULO), MIN(FECHA_VALOR), MIN(ABONO), MIN(EJERCICIO_ABONO), MIN(ORIGEN_IMPAGADO), MIN(TITULO), MIN(PAIS), ');
        Add('        MIN(NOMBRE_COMERCIAL), MIN(NOMBRE_R_SOCIAL), MIN(TERCERO), MIN(ID_CARTERA), MIN(ID_CARTERA_DETALLE), MIN(ID_DOC), ');
        Add('        MIN(ID_REMESAS), AGRUP_COD_CLI_PRO_KRI ');
        Add(' FROM VER_CARTERA_REMESA ');
        Add(' WHERE ');
        Add(' ID_REMESAS = :ID_REMESAS AND ');
        Add(' AGRUP_COD_CLI_PRO_KRI <> 0 ');
        Add(' GROUP BY AGRUP_COD_CLI_PRO_KRI ');
        Add(' ORDER BY 8 ');
     end;
  end;

  Letras.DescDecimales := _('céntimos');
  Letras.Separador := DecimalSeparator;
end;

procedure TDMRRemesasBanco.DMRCabeceraDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMRRemesasBanco.MostrarListado(Remesa, IdRemesa: integer; Signo, SQL: string);
var
  Titulo : string;
begin
  SW := 1;

  with xCabecera do
  begin
     Close;
     Params.ByName['ID_REMESAS'].AsInteger := IdRemesa;
     Open;
  end;

  {dji lrk kri - Fercam siempre agrupa y ordena por vencimiento}
  {              Ya viene ordenado en el OnCreate de este DM   }
  if (DMMain.EstadoKri(213) <> 1) then
  begin
     with xDetalle do
     begin
        Close;
        if Pos('order', SelectSQL.Text) > 0 then
           SelectSQL.Text := Copy(SelectSQL.Text, 1, (Pos('order', SelectSQL.Text) - 1));

        if (SQL <> '') then
           SelectSQL.Add('order by ' + SQL);
        if (SQL = '') then
           SelectSQL.Add('order by vencimiento'); {dji lrk kri}
        Open;
     end;
  end
  else
  begin
     with xDetalle do
     begin
        Close;
        Open;
     end;
  end;

  with xBanco do
  begin
     Close;
     Open;
  end;

  Titulo := _('Remesa') + '-' + IntToStr(Remesa) + '_' + FormatDateTime('yyyymmddhhnn', Now);
  DMListados.Imprimir(27, 0, 0, '', Titulo, frRemesas, frxRemesas, HYRRemesas);
end;

procedure TDMRRemesasBanco.frRemesasGetValue(const ParName: string; var ParValue: variant);
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
  if ParName = 'Inicializa' then
  begin
     Total := 0;
     // Establece la máscara para el Informe de la Remesa.
     // LocalMascaraN := DMMain.MascaraMoneda (xDetalle.FieldByName('MONEDA').AsString,1);
     LocalMascaraN := DMMain.MascaraMoneda(REntorno.Moneda, 1);
  end;

  if ParName = 'Registro' then
  begin
     // Actualizar las máscaras para el recibo actual
     LocalMascaraN := DMMain.MascaraMoneda(xRecibos.FieldByName('MONEDA').AsString, 1);
     LocalMascaraL := DMMain.MascaraMoneda(xRecibos.FieldByName('MONEDA').AsString, 0);
  end;

  if ParName = 'Liquido' then
  begin
     ParValue := DMMain.DameCambio(True, xDetalle.FieldByName('MONEDA').AsString, REntorno.Moneda, xDetalle.FieldByName('VENCIMIENTO').AsDateTime, xDetalle.FieldByName('LIQUIDO').AsFloat);
     Total := Total + ParValue;
  end;

  if ParName = 'Total' then
     ParValue := Total;

  if ParName = 'Letras' then
  begin
     Letras.Numero := xRecibos.FieldByName('LIQUIDO').Value;
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
     ParValue := Letras.AsString{ + ' ' + Letras.Moneda};
  end;

  if ParName = 'DobleLetras' then {dji lrk kri}
  begin
     Letras.Numero := xDobleRecibos.FieldByName('LIQUIDO').Value;
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := xRecibos.FieldByName('MONEDA').AsString;
        Open;
        Letras.Moneda := LowerCase(xMonedas.FieldByName('TITULO').AsString);
        Letras.GeneroMasculino :=
           (xMonedas.FieldByName('GENERO_MASCULINO').AsInteger = 1);
        Letras.Decimales := xMonedas.FieldByName('DEC_VER').AsInteger;
        Letras.DescDecimales := xMonedas.FieldByName('DESC_DECIMALES').AsString;
     end;
     ParValue := Letras.AsString{ + ' ' + Letras.Moneda};
  end;

  if ParName = 'Cli/Prov' then
  begin
     if (xDetalle.FieldByName('SIGNO').Value = 'C') then
     begin
        with xCliente do
        begin
           Close;
           Open;
        end;
        ParValue := xCliente.FieldByName('TITULO').AsString;
     end
     else
     begin
        with xProveedor do
        begin
           Close;
           Open;
        end;
        ParValue := xProveedor.FieldByName('TITULO').AsString;
     end;
  end;
end;

procedure TDMRRemesasBanco.frRemesasEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
     if (Pos('[MascaraL]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraL;
  end;
end;

procedure TDMRRemesasBanco.CargaDatos(var FechaDesde, FechaHasta: TDateTime; var ClienteDesde, ClienteHasta: integer);
begin
  // Procedimiento Carga los Valores por Defecto
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(COD_CLI_PRO), MAX(COD_CLI_PRO), MIN(VENCIMIENTO) AS MIN_VENC, MAX(VENCIMIENTO) AS MAX_VENC ');
        SQL.Add(' FROM VER_CARTERA_REMESA ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA=' + REntorno.EmpresaStr);
        SQL.Add(' AND EJERCICIO=' + REntorno.EjercicioStr);
        SQL.Add(' AND CANAL=' + REntorno.CanalStr);
        SQL.Add(' AND SIGNO=''C'' ');
        ExecQuery;
        ClienteDesde := FieldByName['MIN'].AsInteger;
        Clientehasta := FieldByName['MAX'].AsInteger;
        FechaDesde := Trunc(FieldByName['MIN_VENC'].AsDateTime);
        FechaHasta := Trunc(FieldByName['MAX_VENC'].AsDateTime);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRRemesasBanco.HYRRemesasEnterFields(Sender: THYReport; Field: THYField; var Source: string);
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
     Source := UpperCase(Letras.AsString{ + ' ' + Letras.Moneda});
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

procedure TDMRRemesasBanco.xCliAfterOpen(DataSet: TDataSet);
begin
  xDirecCli.Close;
  xDirecCli.Open;
end;

procedure TDMRRemesasBanco.xDirecCliAfterOpen(DataSet: TDataSet);
begin
  xLoc_T.Close;
  xLoc_T.Open;
end;

procedure TDMRRemesasBanco.xTerceroEmpresaAfterOpen(DataSet: TDataSet);
begin
  xLocalidadEmpresa.Close;
  xLocalidadEmpresa.Open;
end;

procedure TDMRRemesasBanco.xRecibosAfterOpen(DataSet: TDataSet);
begin
  with xCli do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := xRecibos.FieldByName('EMPRESA').AsInteger;
     if xRecibos.FieldByName('EJERCICIO').AsInteger = 0 then
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio
     else
        Params.ByName['EJERCICIO'].AsInteger := xRecibos.FieldByName('EJERCICIO').AsInteger;
     Params.ByName['CANAL'].AsInteger := xRecibos.FieldByName('CANAL').AsInteger;
     Params.ByName['COD_CLI_PRO'].AsInteger := xRecibos.FieldByName('COD_CLI_PRO').AsInteger;
     Open;
  end;

  with xClienteRecibo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := xRecibos.FieldByName('EMPRESA').AsInteger;
     if xRecibos.FieldByName('EJERCICIO').AsInteger = 0 then
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio
     else
        Params.ByName['EJERCICIO'].AsInteger := xRecibos.FieldByName('EJERCICIO').AsInteger;
     Params.ByName['CANAL'].AsInteger := xRecibos.FieldByName('CANAL').AsInteger;
     Params.ByName['COD_CLI_PRO'].AsInteger := xRecibos.FieldByName('COD_CLI_PRO').AsInteger;
     Open;
  end;

  xTerceroEmpresa.Close;
  xTerceroEmpresa.Open;
  xTipoEfecto.Close;
  xTipoEfecto.Open;

  with xBancoCliRe do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := xRecibos.FieldByName('EMPRESA').AsInteger;
     if xRecibos.FieldByName('EJERCICIO').AsInteger = 0 then
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio
     else
        Params.ByName['EJERCICIO'].AsInteger := xRecibos.FieldByName('EJERCICIO').AsInteger;
     Params.ByName['CANAL'].AsInteger := xRecibos.FieldByName('CANAL').AsInteger;
     Params.ByName['COD_CLI_PRO'].AsInteger := xRecibos.FieldByName('COD_CLI_PRO').AsInteger;
     Open;
  end;

  xDetalleFacturas.Close;
  xDetalleFacturas.Open;
end;

procedure TDMRRemesasBanco.HYRRemesasPrepareFields(Sender: THYReport; Field: THYField; Contents: TStrings);
begin
  if Field.Source = '[EMPRESA_LOCALIDAD]' then
  begin
     Contents.Text := REntorno.PobEmpresa;
  end;

  if Field.Source = '[PAIS_PROVINCIA_RECIBO]' then
  begin
     Contents.Text := Copy(xLocalidadEmpresa.FieldByName('PROVINCIA').AsString + ' (' +
        xLocalidadEmpresa.FieldByName('PAIS').AsString + ')', 1, 20);
  end;

  if Field.Source = '[NUMERO_RECIBO]' then
  begin
     Contents.Text := xRecibos.FieldByName('EJERCICIO').AsString +
        '.' + xRecibos.FieldByName('DOC_SERIE').AsString +
        '.' + StringOfChar('0',
        6 - Length(xRecibos.FieldByName('DOC_NUMERO').AsString)) +
        xRecibos.FieldByName('DOC_NUMERO').AsString +
        '/' + xRecibos.FieldByName('REGISTRO').AsString +
        '.' + xRecibos.FieldByName('LINEA').AsString;
  end;
end;

procedure TDMRRemesasBanco.xBancoCliReAfterOpen(DataSet: TDataSet);
begin
  xBancosRe.Close;
  xBancosRe.Open;
  xInfoBanco.Close;
  xInfoBanco.Open;
end;

procedure TDMRRemesasBanco.xDetalleAfterOpen(DataSet: TDataSet);
begin
  xProveedor.Close;
  xProveedor.Open;
  xCliente.Close;
  xCliente.Open;
  xBancoCli.Close;
  xBancoCli.Open;
  xBancos.Close;
  xBancos.Open;
end;

procedure TDMRRemesasBanco.xDobleRecibosAfterOpen(DataSet: TDataSet);
begin
  xDobleCli.Close;
  xDobleCli.Open;
  xDobleClienteRecibo.Close;
  xDobleClienteRecibo.Open;
  xDobleTerceroEmpresa.Close;
  xDobleTerceroEmpresa.Open;
  xDobleTipoEfecto.Close;
  xDobleTipoEfecto.Open;
  xDobleBancoCliRe.Close;
  xDobleBancoCliRe.Open;
end;

procedure TDMRRemesasBanco.xDobleBancoCliReAfterOpen(DataSet: TDataSet);
begin
  xDobleInfoBanco.Close;
  xDobleInfoBanco.Open;
  xDobleBancoRe.Close;
  xDobleBancoRe.Open;
end;

procedure TDMRRemesasBanco.xDobleCliAfterOpen(DataSet: TDataSet);
begin
  xDobleDirecCli.Close;
  xDobleDirecCli.Open;
end;

procedure TDMRRemesasBanco.xDobleDirecCliAfterOpen(DataSet: TDataSet);
begin
  xDobleLoc_T.Close;
  xDobleLoc_T.Open;
end;

procedure TDMRRemesasBanco.MostrarListadoRecibos(Modo: smallint; min_fecha, max_fecha: TDateTime; min_cliente, max_cliente, Dremesa: integer; Hremesa: integer; DFPago: string; HFPago: string);
var
  Titulo : string;
begin
  with xRecibos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CARTERA_REMESA ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' SIGNO = ''C'' AND ');
     SelectSQL.Add(' REMESA >= ?DREMESA AND ');
     SelectSQL.Add(' REMESA <= ?HREMESA AND ');
     SelectSQL.Add(' FORMA_PAGO >= ?DFORMA_PAGO AND ');
     SelectSQL.Add(' FORMA_PAGO <= ?HFORMA_PAGO AND ');
     SelectSQL.Add(' COD_CLI_PRO <= ?MAX_CLI AND ');
     SelectSQL.Add(' COD_CLI_PRO >= ?MIN_CLI AND ');
     SelectSQL.Add(' VENCIMIENTO <= ?MAX_VTO AND ');
     SelectSQL.Add(' VENCIMIENTO >= ?MIN_VTO ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DREMESA'].AsInteger := DRemesa;
     Params.ByName['HREMESA'].AsInteger := HRemesa;
     Params.ByName['DFORMA_PAGO'].AsString := DFPago;
     Params.ByName['HFORMA_PAGO'].AsString := HFPago;
     Params.ByName['MAX_CLI'].AsInteger := max_cliente;
     Params.ByName['MIN_CLI'].AsInteger := min_cliente;
     Params.ByName['MAX_VTO'].AsDateTime := max_fecha;
     Params.ByName['MIN_VTO'].AsDateTime := min_fecha;
     Open;
  end;

  Titulo := _('Recibos') + '_' + FormatDateTime('yyyymmddhhnn', Now);
  DMListados.Imprimir(1, 0, Modo, '', Titulo, frRemesas, frxRemesas, HYRRemesas);
end;

procedure TDMRRemesasBanco.xRecibosAfterScroll(DataSet: TDataSet);
begin
  with xCli do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := xRecibos.FieldByName('EMPRESA').AsInteger;
     if xRecibos.FieldByName('EJERCICIO').AsInteger = 0 then
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio
     else
        Params.ByName['EJERCICIO'].AsInteger := xRecibos.FieldByName('EJERCICIO').AsInteger;
     Params.ByName['CANAL'].AsInteger := xRecibos.FieldByName('CANAL').AsInteger;
     Params.ByName['COD_CLI_PRO'].AsInteger := xRecibos.FieldByName('COD_CLI_PRO').AsInteger;
     Open;
  end;

  xTerceroEmpresa.Close;
  xTerceroEmpresa.Open;

  with xClienteRecibo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := xRecibos.FieldByName('EMPRESA').AsInteger;
     if xRecibos.FieldByName('EJERCICIO').AsInteger = 0 then
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio
     else
        Params.ByName['EJERCICIO'].AsInteger := xRecibos.FieldByName('EJERCICIO').AsInteger;
     Params.ByName['CANAL'].AsInteger := xRecibos.FieldByName('CANAL').AsInteger;
     Params.ByName['COD_CLI_PRO'].AsInteger := xRecibos.FieldByName('COD_CLI_PRO').AsInteger;
     Open;
  end;

  with xBancoCliRe do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := xRecibos.FieldByName('EMPRESA').AsInteger;
     if xRecibos.FieldByName('EJERCICIO').AsInteger = 0 then
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio
     else
        Params.ByName['EJERCICIO'].AsInteger := xRecibos.FieldByName('EJERCICIO').AsInteger;
     Params.ByName['CANAL'].AsInteger := xRecibos.FieldByName('CANAL').AsInteger;
     Params.ByName['COD_CLI_PRO'].AsInteger := xRecibos.FieldByName('COD_CLI_PRO').AsInteger;
     Open;
  end;

  xDetalleFacturas.Close;
  xDetalleFacturas.Open;
end;

procedure TDMRRemesasBanco.xClienteReciboAfterScroll(DataSet: TDataSet);
begin
  xCliKRI.Close;
  xCliKRI.Open;
end;

procedure TDMRRemesasBanco.frxRemesasBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
  begin
     with TfrxCustomMemoView(Sender) do
     begin
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
  end;
end;

procedure TDMRRemesasBanco.frxRemesasGetValue(const VarName: string; var Value: variant);
begin
  frRemesasGetValue(VarName, Value);
end;

end.
