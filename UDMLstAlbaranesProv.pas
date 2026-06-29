unit UDMLstAlbaranesProv;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBDatabase, UFIBModificados, FIBDataSetRO, FIBQuery, HYFIBQuery,
  frxClass, frxHYReport;

type
  TDMLstAlbaranesProv = class(TDataModule)
     frAlbaran: TfrHYReport;
     frDBCabecera: TfrDBDataSet;
     DSCabecera: TDataSource;
     TLocal: THYTransaction;
     QMCabecera: TFIBDataSetRO;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraEJERCICIO: TIntegerField;
     QMCabeceraCANAL: TIntegerField;
     QMCabeceraSERIE: TFIBStringField;
     QMCabeceraTIPO: TFIBStringField;
     QMCabeceraRIG: TIntegerField;
     QMCabeceraALMACEN: TFIBStringField;
     QMCabeceraMONEDA: TFIBStringField;
     QMCabeceraFECHA: TDateTimeField;
     QMCabeceraPROVEEDOR: TIntegerField;
     QMCabeceraTERCERO: TIntegerField;
     QMCabeceraTITULO: TFIBStringField;
     QMCabeceraNOTAS: TBlobField;
     QMCabeceraESTADO: TIntegerField;
     QMCabeceraBULTOS: TIntegerField;
     QMCabeceraLINEAS: TIntegerField;
     QMCabeceraBRUTO: TFloatField;
     QMCabeceraI_DTO_LINEAS: TFloatField;
     QMCabeceraS_BASES: TFloatField;
     QMCabeceraS_CUOTA_IVA: TFloatField;
     QMCabeceraS_CUOTA_RE: TFloatField;
     QMCabeceraB_DTO_LINEAS: TFloatField;
     QMCabeceraDTO_PP: TFloatField;
     QMCabeceraDTO_CIAL: TFloatField;
     QMCabeceraI_DTO_CIAL: TFloatField;
     QMCabeceraI_DTO_PP: TFloatField;
     QMCabeceraLIQUIDO: TFloatField;
     QMCabeceraENTRADA: TIntegerField;
     QMCabeceraENTRADA_FACTURACION: TIntegerField;
     QMCabeceraNUM_ALBARAN: TFIBStringField;
     QMCabeceraNOMBRE_COMERCIAL: TFIBStringField;
     QMCabeceraPOR_FINANCIACION: TFloatField;
     QMCabeceraI_FINANCIACION: TFloatField;
     QMCabeceraFORMA_DE_PAGO: TFIBStringField;
     xProveedores: TFIBDataSetRO;
     xProveedoresEMPRESA: TIntegerField;
     xProveedoresEJERCICIO: TIntegerField;
     xProveedoresCANAL: TIntegerField;
     xProveedoresPROVEEDOR: TIntegerField;
     xProveedoresTERCERO: TIntegerField;
     xProveedoresTITULO: TFIBStringField;
     xProveedoresNIF: TFIBStringField;
     xProveedoresDESCUENTO: TFloatField;
     xProveedoresFORMA_PAGO: TFIBStringField;
     xProveedoresDIA_PAGO_1: TIntegerField;
     xProveedoresDIA_PAGO_2: TIntegerField;
     xProveedoresDESCUENTO_PP: TFloatField;
     xProveedoresNOTAS: TBlobField;
     xProveedoresMODO_IVA: TIntegerField;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     xEstados: TFIBDataSetRO;
     xEstadosTITULO: TFIBStringField;
     DSxEstado: TDataSource;
     xMonedasTITULO: TFIBStringField;
     xMonedasSIGNO_MONEDA: TFIBStringField;
     QMCabeceraVALOR_CAMB_FIJO: TFloatField;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     QMCabeceraPROYECTO: TIntegerField;
     frxAlbaran: TfrxHYReport;
     procedure frAlbaranGetValue(const ParName: string; var ParValue: variant);
     procedure DMLstAlbaranesProvDestroy(Sender: TObject);
     procedure frAlbaranEnterRect(Memo: TStringList; View: TfrView);
     procedure DMLstAlbaranesProvCreate(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure frxAlbaranBeforePrint(Sender: TfrxReportComponent);
     procedure frxAlbaranGetValue(const VarName: string; var Value: variant);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     FechaDesde, FechaHasta: TDateTime;
     Moneda: string;
     LocalMascaraN, LocalMascaraL: string;
     MostrarBImponible: smallint;
  public
     { Public declarations }
     Estado: integer;
     procedure MostrarListado(Desde, Hasta: TDateTime; ProveedorDesde, ProveedorHasta, Modo: integer; Serie, Moneda_Listado: string; Ord, aMostrarBImponible: boolean; aComentario: string; aFechaListado: TDateTime);
     procedure MostrarListadoFiltrado(Modo: byte; Filtro: integer; Serie: string);
  end;

var
  DMLstAlbaranesProv : TDMLstAlbaranesProv;
  SW : integer;

implementation

uses UDMMain, UEntorno, UFormGest, UDMListados, UUtiles;

{$R *.DFM}

procedure TDMLstAlbaranesProv.DMLstAlbaranesProvCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  Estado := -1;
end;

procedure TDMLstAlbaranesProv.DMLstAlbaranesProvDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstAlbaranesProv.MostrarListadoFiltrado(Modo: byte; Filtro: integer; Serie: string);
begin
  MostrarBImponible := 1;
  SW := 1;

  with QMCabecera do
  begin
     Close;
     Open;
     if (Filtro = 0) then
     begin
        DMMain.FiltraRO(QMCabecera, '11110', False);
        Params.ByName['SERIE'].AsString := Serie;
        Open;
     end;
  end;

  Moneda := REntorno.Moneda;
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);

  DMListados.Imprimir(42, 0, Modo, Serie, '', frAlbaran, frxAlbaran, nil, nil);
end;

procedure TDMLstAlbaranesProv.MostrarListado(Desde, Hasta: TDateTime; ProveedorDesde, ProveedorHasta, Modo: integer; Serie, Moneda_Listado: string; Ord, aMostrarBImponible: boolean; aComentario: string; aFechaListado: TDateTime);
var
  Orden : string;
  Grupo : integer;
begin
  SW := 1;

  MostrarBImponible := BoolToInt(aMostrarBImponible);
  FechaDesde := Desde;
  FechaHasta := Hasta;
  DMListados.Normalizar_Desde_Hasta(Desde, Hasta);
  DMListados.Normalizar_Desde_Hasta(ProveedorDesde, ProveedorHasta);

  DMListados.DatosInforme(aFechaListado, aComentario);

  Moneda := Moneda_Listado;
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);

  Grupo := 42;
  Orden := '';

  if Ord then
     Orden := 'A.SERIE, A.RIG'
  else
     Orden := 'A.FECHA, A.SERIE, A.RIG';

  with QMCabecera do
  begin
     Close;

     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CABECERAS_ALBARAN_PROV A ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' A.EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' A.CANAL = ?CANAL AND ');
     if (Serie <> '') then
        SelectSQL.Add(' A.SERIE = ?SERIE AND ');
     if (Estado >= 0) then
     begin
        case Estado of
           0, 5: SelectSQL.Add(' A.ESTADO = ?ESTADO AND ');
           10:
           begin
              SelectSQL.Add(' ((A.ESTADO = 0) OR ((A.ESTADO = 5) AND ');
              SelectSQL.Add(' ((SELECT FIRST 1 CAST(EXTRACT(DAY FROM F.FECHA)||''.''|| EXTRACT(MONTH FROM F.FECHA)||''.''|| EXTRACT(YEAR FROM F.FECHA) AS DATE) ');
              SelectSQL.Add('   FROM GES_CABECERAS_E_RELACIONES R ');
              SelectSQL.Add('   LEFT JOIN GES_CABECERAS_E F ON F.EMPRESA = R.D_EMPRESA AND F.EJERCICIO = R.D_EJERCICIO AND F.CANAL = R.D_CANAL AND F.SERIE = R.D_SERIE AND F.TIPO = R.D_TIPO AND F.RIG = R.D_RIG ');
              SelectSQL.Add('   WHERE ');
              SelectSQL.Add('   A.EMPRESA = R.O_EMPRESA AND ');
              SelectSQL.Add('   A.EJERCICIO = R.O_EJERCICIO AND ');
              SelectSQL.Add('   A.CANAL = R.O_CANAL AND ');
              SelectSQL.Add('   A.SERIE = R.O_SERIE AND ');
              SelectSQL.Add('   A.TIPO = R.O_TIPO AND ');
              SelectSQL.Add('   A.RIG = R.O_RIG AND ');
              SelectSQL.Add('   R.D_TIPO = ''FAP'') > :FECHA_HASTA))) AND ');
           end;
        end;
     end;

     SelectSQL.Add(' ((A.FECHA >= ?FECHA_DESDE) AND (A.FECHA <= ?FECHA_HASTA)) AND ');
     SelectSQL.Add(' ((A.PROVEEDOR >= ?PROVEEDOR_DESDE) AND (A.PROVEEDOR <= ?PROVEEDOR_HASTA)) ');
     SelectSQL.Add(' ORDER BY ' + Orden);

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if Serie <> '' then
        Params.ByName['SERIE'].AsString := Serie;
     if ((Estado >= 0) and (Estado <= 5)) then
        Params.ByName['ESTADO'].AsInteger := Estado;
     Params.ByName['FECHA_DESDE'].AsDateTime := Desde;
     Params.ByName['FECHA_HASTA'].AsDateTime := Hasta;
     Params.ByName['PROVEEDOR_DESDE'].AsInteger := ProveedorDesde;
     Params.ByName['PROVEEDOR_HASTA'].AsInteger := ProveedorHasta;
     Open;
  end;

  DMListados.Imprimir(Grupo, 0, Modo, Serie, '', frAlbaran, frxAlbaran, nil, nil);
end;

procedure TDMLstAlbaranesProv.frAlbaranGetValue(const ParName: string; var ParValue: variant);
var
  Cambio : extended;
begin
  DMListados.GetValue(ParName, ParValue);

  Cambio := 0;
  if (QMCabeceraVALOR_CAMB_FIJO.AsFloat <> 0) then
     Cambio := 1 / QMCabeceraVALOR_CAMB_FIJO.AsFloat;

  if ParName = 'Desde' then
     ParValue := FechaDesde;
  if ParName = 'Hasta' then
     ParValue := FechaHasta;

  if ParName = 'Moneda_Canal' then
     ParValue := REntorno.Moneda;

  if ParName = 'Moneda' then
     ParValue := Moneda;

  if ParName = 'Titulo_Moneda' then
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := Moneda;
        Open;
        ParValue := xMonedas.FieldByName('TITULO').AsString;
     end;

  if ParName = 'BaseImponible' then
     ParValue := DMMain.DameCambio(False, QMCabeceraMONEDA.AsString, Moneda, QMCabeceraFECHA.AsDateTime, QMCabeceraS_BASES.AsFloat, Cambio);

  if ParName = 'Total_Albaran' then
     ParValue := DMMain.DameCambio(False, QMCabeceraMONEDA.AsString, Moneda, QMCabeceraFECHA.AsDateTime, QMCabeceraLIQUIDO.AsFloat, Cambio);

  if ParName = 'MBI' then // Se encarga de mostrar o no la columna de la Base Imponible
     ParValue := MostrarBImponible;
end;

procedure TDMLstAlbaranesProv.frAlbaranEnterRect(Memo: TStringList; View: TfrView);
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

procedure TDMLstAlbaranesProv.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  xProyectos.Open;
  xProveedores.Open;
  xEstados.Open;
end;

procedure TDMLstAlbaranesProv.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  xProyectos.Close;
  xProveedores.Close;
  xEstados.Close;
end;

procedure TDMLstAlbaranesProv.frxAlbaranBeforePrint(Sender: TfrxReportComponent);
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
              DisplayFormat.FormatStr := LocalMascaraL;
              DisplayFormat.Kind := fkNumeric;
           end;
        end;
end;

procedure TDMLstAlbaranesProv.frxAlbaranGetValue(const VarName: string; var Value: variant);
begin
  frAlbaranGetValue(VarName, Value);
end;

end.
