unit UDMLstAlbaranProvArt;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBDatabase, UFIBModificados, FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TDMLstAlbaranProvArt = class(TDataModule)
     frAlbaran: TfrHYReport;
     frDBDetalle: TfrDBDataSet;
     DSDetalle: TDataSource;
     frDSxArticulo: TfrDBDataSet;
     DSxArticulo: TDataSource;
     TLocal: THYTransaction;
     QMDetalle: TFIBDataSetRO;
     xArticulo: TFIBDataSetRO;
     SPDameCambio: THYFIBQuery;
     procedure frAlbaranGetValue(const ParName: string; var ParValue: variant);
     procedure DMLstAlbaranProvArtDestroy(Sender: TObject);
     procedure frAlbaranEnterRect(Memo: TStringList; View: TfrView);
     procedure DMLstAlbaranProvArtCreate(Sender: TObject);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure QMDetalleBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     Moneda, TituloMoneda: string;
     LocalMascaraN, LocalMascaraL: string;
     FechaDesde, FechaHasta: TDateTime;
     ArticuloDesde, ArticuloHasta, Estado: string;
  public
     procedure MostrarListado(aFechaDesde, aFechaHasta: TDateTime; aArticuloDesde, aArticuloHasta: string; Modo, aEstado: integer; Serie, aMoneda: string);
  end;

var
  DMLstAlbaranProvArt : TDMLstAlbaranProvArt;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles, UDameDato;

{$R *.DFM}

procedure TDMLstAlbaranProvArt.DMLstAlbaranProvArtCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstAlbaranProvArt.DMLstAlbaranProvArtDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstAlbaranProvArt.MostrarListado(aFechaDesde, aFechaHasta: TDateTime; aArticuloDesde, aArticuloHasta: string; Modo, aEstado: integer; Serie, aMoneda: string);
var
  Archivo : string;
begin
  DMListados.Normalizar_Desde_Hasta(aArticuloDesde, aArticuloHasta);
  DMListados.Normalizar_Desde_Hasta(aFechaDesde, aFechaHasta);
  FechaDesde := aFechaDesde;
  FechaHasta := aFechaHasta;
  ArticuloDesde := aArticuloDesde;
  ArticuloHasta := aArticuloHasta;
  Estado := IntToStr(aEstado);
  Moneda := aMoneda;
  TituloMoneda := DameTituloMoneda(Moneda);
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);

  with QMDetalle do
  begin
     Close;
     SelectSQL.Clear;
     if (Modo = 2) then
        SelectSQL.Add(' SELECT ARTICULO, TITULO, FECHA, RIG, UNIDADES, PRECIO, (UNIDADES * PRECIO) AS IMPORTE  FROM VER_CABECERA_DETALLE_ALB_PROV ')
     else
        SelectSQL.Add(' SELECT * FROM VER_CABECERA_DETALLE_ALB_PROV ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' SERIE = ?SERIE AND ');
     SelectSQL.Add(' FECHA >= ?DESDE AND ');
     SelectSQL.Add(' FECHA <= ?HASTA AND ');
     SelectSQL.Add(' ARTICULO <= ?ARTICULO2 AND ');
     SelectSQL.Add(' ARTICULO >= ?ARTICULO ');
     if (aEstado <> 9) then // Todas
        SelectSQL.Add(' AND ESTADO = ?ESTADO ');
     SelectSQL.Add(' ORDER BY ARTICULO, FECHA, RIG ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['DESDE'].AsDateTime := aFechaDesde;
     Params.ByName['HASTA'].AsDateTime := aFechaHasta;
     Params.ByName['ARTICULO'].AsString := aArticuloDesde;
     Params.ByName['ARTICULO2'].AsString := aArticuloHasta;
     if (aEstado <> 9) then // Todas
        Params.ByName['ESTADO'].AsInteger := aEstado
     else
        Estado := _('Todas');
     Open;
  end;

  with xArticulo do
  begin
     Close;
     Open;
  end;

  if (Modo = 2) then
  begin
     // Exportar a Excel
     Archivo := Format(_('AlbaranesArticulos-%d_%s.xls'), [REntorno.Ejercicio, FormatDateTime('yyyymmdd-hhnnss', Now)]);
     if MySaveDialog(Archivo, 'XLS,ODS', '', 'DMLstAlbaranProvArt') then
     begin
        ExportarExcel(Archivo, DSDetalle, True, True);
     end;
  end
  else
  begin
     DMListados.Imprimir(9001, 0, Modo, Serie, '', frAlbaran, nil, nil);
  end;
end;

procedure TDMLstAlbaranProvArt.frAlbaranGetValue(const ParName: string; var ParValue: variant);
var
  Cambio : extended;
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Desde' then
     ParValue := FechaDesde;
  if ParName = 'Hasta' then
     ParValue := FechaHasta;
  if ParName = 'ArticuloD' then
     ParValue := ArticuloDesde;
  if ParName = 'ArticuloH' then
     ParValue := ArticuloHasta;
  if ParName = 'Estado' then
     ParValue := Estado;

  if ParName = 'Precio' then
  begin
     Cambio := 0;
     if (QMDetalle.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
        Cambio := 1 / QMDetalle.FieldByName('VALOR_CAMB_FIJO').AsFloat;
     ParValue := DMMain.DameCambio(True, QMDetalle.FieldByName('MONEDA').AsString, Moneda, QMDetalle.FieldByName('FECHA').AsDateTime, QMDetalle.FieldByName('PRECIO').AsFloat, Cambio);
  end;

  if ParName = 'Moneda_Canal' then
     ParValue := REntorno.Moneda;

  if ParName = 'Moneda' then
     ParValue := Moneda;

  if ParName = 'Titulo_Moneda' then
     ParValue := TituloMoneda;
end;

procedure TDMLstAlbaranProvArt.frAlbaranEnterRect(Memo: TStringList; View: TfrView);
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

procedure TDMLstAlbaranProvArt.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  xArticulo.Open;
end;

procedure TDMLstAlbaranProvArt.QMDetalleBeforeClose(DataSet: TDataSet);
begin
  xArticulo.Close;
end;

end.
