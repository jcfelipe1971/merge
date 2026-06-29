{ TODO :
Unir codigo de ZUDMR... y UDMRStockMinimo
Unir codigo de ZUFPreg... y UFPregStockMinimo }

unit UDMRStockMinimo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FR_DSet, FR_DBSet, FR_Class,
  Fr_HYReport, FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery,
  frxClass, frxHYReport;

type
  TDMRStockMinimo = class(TDataModule)
     frStockMinimo: TfrHYReport;
     frDBDSQSPStock_Minimo: TfrDBDataSet;
     DSQSPStock_Minimo: TDataSource;
     TLocal: THYTransaction;
     QSPStock_Minimo: TFIBDataSetRO;
     frxStockMinimo: TfrxHYReport;
     TUpdate: THYTransaction;
     procedure frStockMinimoEnterRect(Memo: TStringList; View: TfrView);
     procedure frStockMinimoGetValue(const ParName: string; var ParValue: variant);
     procedure DMRStockMinimoCreate(Sender: TObject);
     procedure DMRStockMinimoDestroy(Sender: TObject);
     procedure frxStockMinimoBeforePrint(Sender: TfrxReportComponent);
     procedure frxStockMinimoGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
     RangoSelec: string;
     Almacen: string;
     ArticuloDesde, ArticuloHasta: string;
     FamiliaDesde, FamiliaHasta: string;
     // CanalIni, CanalFin: integer;
     Limites: string;
     procedure ActualizarRangoSelec(LCan, LAlm: TStrings; Canal: smallint; const Alm: string);
  public
     { Public declarations }
     procedure CalculaInforme(Canal: integer; LCan, LAlm: TStrings; aAlmacen: string; aArticuloDesde, aArticuloHasta: string; aFamiliaDesde, aFamiliaHasta: string; StockVirtual: boolean; Modo: integer);
  end;

var
  DMRStockMinimo : TDMRStockMinimo;

implementation

uses UDMMain, UUtiles, UDameDato, UEntorno, UDMListados, UFormGest;

{$R *.DFM}

procedure TDMRStockMinimo.DMRStockMinimoCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMRStockMinimo.DMRStockMinimoDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMRStockMinimo.CalculaInforme(Canal: integer; LCan, LAlm: TStrings; aAlmacen: string; aArticuloDesde, aArticuloHasta: string; aFamiliaDesde, aFamiliaHasta: string; StockVirtual: boolean; Modo: integer);
var
  str : string;
begin
  DMListados.Normalizar_Desde_Hasta(aArticuloDesde, aArticuloHasta);
  DMListados.Normalizar_Desde_Hasta(aFamiliaDesde, aFamiliaHasta);

  Almacen := aAlmacen;
  ArticuloDesde := aArticuloDesde;
  ArticuloHasta := aArticuloHasta;
  FamiliaDesde := aFamiliaDesde;
  FamiliaHasta := aFamiliaHasta;
  // CanalIni := aCanalIni;
  // CanalFin := aCanalFin;

  if (LAlm.Count = 1) then
     LAlm[0] := Almacen;

  with QSPStock_Minimo do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['ALMACEN'].AsString := Almacen;
     Params.ByName['ART_INI'].AsString := ArticuloDesde;
     Params.ByName['ART_FIN'].AsString := ArticuloHasta;
     Params.ByName['FAM_INI'].AsString := FamiliaDesde;
     Params.ByName['FAM_FIN'].AsString := FamiliaHasta;
     Params.ByName['CALCULO_VIRTUAL'].AsInteger := BoolToInt(StockVirtual);
     Open;
  end;

  if (StockVirtual) then
     str := _('SI')
  else
     str := _('NO');
  Limites := Format(_('Articulos: %s - %s, Familias: %s - %s, Stock Virtual: %s'), [ArticuloDesde, ArticuloHasta, FamiliaDesde, FamiliaHasta, str]);

  ActualizarRangoSelec(LCan, LAlm, Canal, Almacen);

  DMListados.Imprimir(22, 0, Modo, '', _('Listado de Stock bajo minimos'), frStockMinimo, frxStockMinimo, nil, nil);
end;

procedure TDMRStockMinimo.frStockMinimoEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
     DMListados.BeforePrint(Memo, View);
end;

procedure TDMRStockMinimo.frStockMinimoGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'RangoSelec' then
     ParValue := RangoSelec;
  if ParName = 'TxtCanales' then
     ParValue := RangoSelec;
  if ParName = 'Limites' then
     ParValue := Limites;

  {
  if ParName = 'CanalIni' then
     ParValue := CanalIni;
  if ParName = 'CanalFin' then
     ParValue := CanalFin;
  }

  if ParName = 'Almacen' then
     ParValue := Almacen;
  if ParName = 'AlmacenTitulo' then
     ParValue := DameTituloAlmacen(Almacen);

  if ParName = 'ArticuloDesde' then
     ParValue := ArticuloDesde;
  if ParName = 'ArticuloHasta' then
     ParValue := ArticuloHasta;
  if ParName = 'ArticuloDesdeTitulo' then
     ParValue := DameTituloArticulo(ArticuloDesde);
  if ParName = 'ArticuloHastaTitulo' then
     ParValue := DameTituloArticulo(ArticuloHasta);

  if ParName = 'FamiliaDesde' then
     ParValue := FamiliaDesde;
  if ParName = 'FamiliaHasta' then
     ParValue := FamiliaHasta;
  if ParName = 'FamiliaDesdeTitulo' then
     ParValue := DameTituloFamilia(FamiliaDesde);
  if ParName = 'FamiliaHastaTitulo' then
     ParValue := DameTituloFamilia(FamiliaHasta);
end;

procedure TDMRStockMinimo.ActualizarRangoSelec(LCan, LAlm: TStrings; Canal: smallint; const Alm: string);
var
  i : integer;
begin
  if (LCan.Count = 0) then
     RangoSelec := Format(_('Canal: %s, Almacen %s'), [IntToStr(Canal), Alm])
  else
  begin
     RangoSelec := '';
     for i := 0 to (LCan.Count - 1) do
     begin
        if (i > 0) then
           RangoSelec := RangoSelec + ', ';
        RangoSelec := RangoSelec + Format(_('Canal: %s, Almacen %s'), [LCan[i], LAlm[i]]);
     end;
  end;
end;

procedure TDMRStockMinimo.frxStockMinimoBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMRStockMinimo.frxStockMinimoGetValue(const VarName: string; var Value: variant);
begin
  frStockMinimoGetValue(VarName, Value);
end;

end.
