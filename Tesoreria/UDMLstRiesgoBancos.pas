unit UDMLstRiesgoBancos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FR_Class, Fr_HYReport, FIBDataSet, FIBQuery, FIBTableDataSetRO, FR_DSet,
  FR_DBSet, HYFIBQuery, frxClass, frxHYReport;

type
  TDMLstRiesgoBancos = class(TDataModule)
     TLocal: THYTransaction;
     frRiesgoBancos: TfrHYReport;
     DSxEmpBancos: TDataSource;
     xVerRecibosCartera: TFIBDataSetRO;
     DSxVerRecibosCartera: TDataSource;
     frDBDSEmpBancos: TfrDBDataSet;
     frDBDSVerRecibosCartera: TfrDBDataSet;
     xEmpBancos: TFIBDataSetRO;
     xMonedas: TFIBDataSetRO;
     xMonedasMONEDA: TFIBStringField;
     xMonedasTITULO: TFIBStringField;
     xMonedasSIGNO_MONEDA: TFIBStringField;
     xMonedasDEC_VER: TIntegerField;
     xMonedasDEC_CALCULOS: TIntegerField;
     xMonedasDEFECTO: TIntegerField;
     DSxMonedas: TDataSource;
     frxRiesgoBancos: TfrxHYReport;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frRiesgoBancosGetValue(const ParName: string; var ParValue: variant);
     procedure frRiesgoBancosBeforePrint(Memo: TStringList; View: TfrView);
     procedure frxRiesgoBancosBeforePrint(Sender: TfrxReportComponent);
     procedure frxRiesgoBancosGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     LocalMascaraN: string;
  public
     { Public declarations }
     FechaDesde, FechaHasta: TDateTime;
     procedure MostrarListadoFiltrado(Modo: byte; DesdeBanco, HastaBanco: integer; aFechaDesde, aFechaHasta: TDateTime; aFechaListado: TDateTime; aComentario: string);
  end;

var
  DMLstRiesgoBancos : TDMLstRiesgoBancos;

implementation

{$R *.dfm}

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles, DateUtils, UDameDato;

procedure TDMLstRiesgoBancos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  AbreData(TDMListados, DMListados);
  xMonedas.Open;
end;

procedure TDMLstRiesgoBancos.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstRiesgoBancos.MostrarListadoFiltrado(Modo: byte; DesdeBanco, HastaBanco: integer; aFechaDesde, aFechaHasta: TDateTime; aFechaListado: TDateTime; aComentario: string);
begin
  DMListados.Normalizar_Desde_Hasta(DesdeBanco, HastaBanco);
  DMListados.Normalizar_Desde_Hasta(aFechaDesde, aFechaHasta);
  FechaDesde := RecodeTime(aFechaDesde, 0, 0, 0, 0);
  FechaHasta := RecodeTime(aFechaHasta, 23, 59, 59, 999);

  DMListados.DatosInforme(aFechaListado, aComentario);

  LocalMascaraN := DMMain.MascaraMoneda(xMonedas.FieldByName('MONEDA').AsString, 1);

  with xEmpBancos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['BANCO_DESDE'].AsInteger := DesdeBanco;
     Params.ByName['BANCO_HASTA'].AsInteger := HastaBanco;
     Open;
  end;

  with xVerRecibosCartera do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['BANCO'].AsInteger := xEmpBancos.FieldByName('BANCO').AsInteger;
     Params.ByName['FECHAD'].AsDateTime := FechaDesde;
     Params.ByName['FECHAH'].AsDateTime := FechaHasta;
     // Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
     Open;
  end;

  DMListados.Imprimir(202, 0, Modo, '', '', frRiesgoBancos, frxRiesgoBancos, nil, nil);
end;

procedure TDMLstRiesgoBancos.frRiesgoBancosGetValue(const ParName: string; var ParValue: variant);
var
  Cambio : extended;
begin
  Cambio := 0;
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;

  if ParName = 'FechaDesde' then
     ParValue := StrToDate(DateToStr(FechaDesde));

  if ParName = 'FechaHasta' then
     ParValue := StrToDate(DateToStr(FechaHasta));

  if ParName = 'Moneda' then
     ParValue := xMonedasTITULO.AsString;

  if ParName = 'RConcedido' then
     ParValue := DMMain.DameCambio(True, REntorno.Moneda, xMonedas.FieldByName('MONEDA').AsString, REntorno.FechaTrab, xEmpBancos.FieldByName('RIESGO_CON').AsFloat, Cambio);

  if ParName = 'RUtilizado' then
     ParValue := DMMain.DameCambio(True, REntorno.Moneda, xMonedas.FieldByName('MONEDA').AsString, REntorno.FechaTrab, xEmpBancos.FieldByName('RIESGO_UTI').AsFloat, Cambio);

  if ParName = 'RPendiente' then
     ParValue := DMMain.DameCambio(True, REntorno.Moneda, xMonedas.FieldByName('MONEDA').AsString, REntorno.FechaTrab, (xEmpBancos.FieldByName('RIESGO_CON').AsFloat - xEmpBancos.FieldByName('RIESGO_UTI').AsFloat));

  if ParName = 'NombreCliente' then
     ParValue := DameTituloCliente(xVerRecibosCartera.FieldByName('COD_CLI_PRO').AsInteger, xVerRecibosCartera.FieldByName('EMPRESA').AsInteger, xVerRecibosCartera.FieldByName('EJERCICIO').AsInteger, xVerRecibosCartera.FieldByName('CANAL').AsInteger);

  if ParName = 'ImporteRecibo' then
     ParValue := DMMain.DameCambio(True, xVerRecibosCartera.FieldByName('MONEDA').AsString, xMonedas.FieldByName('MONEDA').AsString, xVerRecibosCartera.FieldByName('VENCIMIENTO').AsDateTime, xVerRecibosCartera.FieldByName('LIQUIDO').AsFloat);
end;

procedure TDMLstRiesgoBancos.frRiesgoBancosBeforePrint(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
  end;
end;

procedure TDMLstRiesgoBancos.frxRiesgoBancosBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMLstRiesgoBancos.frxRiesgoBancosGetValue(const VarName: string; var Value: variant);
begin
  frRiesgoBancosGetValue(VarName, Value);
end;

end.
