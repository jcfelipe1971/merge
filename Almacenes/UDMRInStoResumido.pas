unit UDMRInStoResumido;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FR_Class, Fr_HYReport, DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet,
  FIBQuery, FIBDatabase, UFIBModificados, HYFIBQuery, FIBDataSetRO,
  frxClass, frxHYReport;

type
  TDMRInStoResumido = class(TDataModule)
     frInStoResumido: TfrHYReport;
     SPInStoResumido: THYFIBQuery;
     xArt_Almacen: TFIBDataSetRO;
     DSxArt_Almacen: TDataSource;
     xArt_Inventario_Tmp: TFIBDataSetRO;
     DSxArt_Inventario_Tmp: TDataSource;
     frDSxArt_Inventario_Tmp: TfrDBDataSet;
     TLocal: THYTransaction;
     xArt_Desde: TFIBDataSetRO;
     xArt_Hasta: TFIBDataSetRO;
     xFamilia_Desde: TFIBDataSetRO;
     xFamilia_Hasta: TFIBDataSetRO;
     DSxFamilia_Hasta: TDataSource;
     DSxFamilia_Desde: TDataSource;
     DSxArt_Hasta: TDataSource;
     DSxArt_Desde: TDataSource;
     xArt_Inventario_TmpEMPRESA: TIntegerField;
     xArt_Inventario_TmpEJERCICIO: TIntegerField;
     xArt_Inventario_TmpCANAL: TIntegerField;
     xArt_Inventario_TmpENTRADA: TIntegerField;
     xArt_Inventario_TmpPERIODO: TFIBStringField;
     xArt_Inventario_TmpTITULO: TFIBStringField;
     xArt_Inventario_TmpENTRADAS: TFloatField;
     xArt_Inventario_TmpSALIDAS: TFloatField;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     frxInStoResumido: TfrxHYReport;
     TUpdate: THYTransaction;
     procedure DMRCabeceraDestroy(Sender: TObject);
     procedure frInStoResumidoGetValue(const ParName: string; var ParValue: variant);
     procedure frInStoResumidoEnterRect(Memo: TStringList; View: TfrView);
     procedure DMRInStoResumidoCreate(Sender: TObject);
     procedure frxInStoResumidoBeforePrint(Sender: TfrxReportComponent);
     procedure frxInStoResumidoGetValue(const VarName: string; var Value: variant);
  private
     Acu: double;
     RangoSelec: string;
     LocalMascaraN: string;
     procedure ActualizarRangoSelec(LCan, LAlm: TStrings; Canal: smallint; const Alm: string);
  public
     Periodo, Almacen: string;
     Articulo_Desde, Articulo_Hasta: string;
     Familia_Desde, Familia_Hasta: string;
     T_Cal: integer;
     procedure Rangos;
     procedure CalculaInforme(Canal: integer);
     procedure MostrarListado(LCan, LAlm: TStrings; Canal, Modo: integer);
     procedure CambiaMoneda(Moneda: string);
  end;

var
  DMRInStoResumido : TDMRInStoResumido;
  SW : integer;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles;

{$R *.DFM}

procedure TDMRInStoResumido.DMRInStoResumidoCreate(Sender: TObject);
begin
  // Abrir la transacción
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMRInStoResumido.DMRCabeceraDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMRInStoResumido.Rangos;
var
  dummy : string;
begin
  DameMinMax('CAR', Articulo_Desde, Articulo_Hasta);
  DameMinMax('ALM', Almacen, dummy);
  DameMinMax('FAM', Familia_Desde, Familia_Hasta);
  Periodo := DMMain.DamePeriodo(REntorno.FechaTrab);
end;

procedure TDMRInStoResumido.CalculaInforme(Canal: integer);
begin
  DMListados.Normalizar_Desde_Hasta(Articulo_Desde, Articulo_Hasta);
  DMListados.Normalizar_Desde_Hasta(Familia_Desde, Familia_Hasta);
  with SPInStoResumido do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['ALMACEN'].AsString := Almacen;
     Params.ByName['ART_INI'].AsString := Articulo_Desde;
     Params.ByName['ART_FIN'].AsString := Articulo_Hasta;
     Params.ByName['FAM_INI'].AsString := Familia_Desde;
     Params.ByName['FAM_FIN'].AsString := Familia_Hasta;
     Params.ByName['TIPO_CALCULO'].AsInteger := T_Cal;
     Params.ByName['CANAL_CALCULO'].AsInteger := REntorno.Canal;
     Params.ByName['MONEDA'].AsString := xMonedas.FieldByName('MONEDA').AsString;
     ExecQuery;
     FreeHandle;
  end;
end;

procedure TDMRInStoResumido.MostrarListado(LCan, LAlm: TStrings; Canal, Modo: integer);
begin
  SW := 1;
  if (LAlm.Count = 1) then
     LAlm[0] := Almacen;
  CalculaInforme(Canal);
  ActualizarRangoSelec(LCan, LAlm, Canal, Almacen);
  LocalMascaraN := DMMain.MascaraMoneda(xMonedas.FieldByName('MONEDA').AsString, 1);

  with xArt_Inventario_Tmp do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  DMListados.Imprimir(24, 0, Modo, '', _('Listado de Stock Resumido'), frInStoResumido, frxInStoResumido, nil);
end;

procedure TDMRInStoResumido.frInStoResumidoGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'RangoCanales' then
     ParValue := RangoSelec;
  if ParName = 'Inicializa' then
     Acu := 0;
  if ParName = 'Almacen' then
     ParValue := Almacen;
  if ParName = 'Articulo Desde' then
     ParValue := Articulo_desde;
  if ParName = 'Articulo Hasta' then
     ParValue := Articulo_Hasta;
  if ParName = 'Familia Desde' then
     ParValue := Familia_Desde;
  if ParName = 'Familia Hasta' then
     ParValue := Familia_Hasta;
  if ParName = 'Val' then
     ParValue := T_Cal;
  if ParName = 'SAcumulado' then
     ParValue := Acu;
  if ParName = 'Acumulado' then
  begin
     Acu := Acu + (xArt_Inventario_Tmp.FieldByName('ENTRADAS').Value -
        xArt_Inventario_Tmp.FieldByName('SALIDAS').Value);
     ParValue := Acu;
  end;
  if ParName = 'Titulo_Moneda' then
     ParValue := xMonedas.FieldByName('TITULO').AsString;
end;

procedure TDMRInStoResumido.frInStoResumidoEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
  end;
end;

procedure TDMRInStoResumido.ActualizarRangoSelec(LCan, LAlm: TStrings; Canal: smallint; const Alm: string);
var
  i : integer;
begin
  if (LCan.Count = 0) then
     RangoSelec := Format(_('Canal: %s Almacen %s'), [IntToStr(Canal), Alm])
  else
  begin
     RangoSelec := '';
     for i := 0 to (LCan.Count - 1) do
     begin
        if (i > 0) then
           RangoSelec := RangoSelec + ', ';
        RangoSelec := RangoSelec + Format(_('Canal: %s Almacen %s'), [LCan[i], LAlm[i]]);
     end;
  end;
end;

procedure TDMRInStoResumido.CambiaMoneda(Moneda: string);
begin
  with xMonedas do
  begin
     Close;
     Params.ByName['MONEDA'].AsString := Moneda;
     Open;
  end;
end;

procedure TDMRInStoResumido.frxInStoResumidoBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMRInStoResumido.frxInStoResumidoGetValue(const VarName: string; var Value: variant);
begin
  frInStoResumidoGetValue(VarName, Value);
end;

end.
