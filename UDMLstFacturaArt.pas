unit UDMLstFacturaArt;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBDatabase, UFIBModificados, FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TDMLstFacturaArt = class(TDataModule)
     frFactura: TfrHYReport;
     frDBDetalle: TfrDBDataSet;
     QMDetalle: TFIBDataSetRO;
     DSDetalle: TDataSource;
     xArticulo: TFIBDataSetRO;
     xCliente: TFIBDataSetRO;
     DSxFactura: TDataSource;
     TLocal: THYTransaction;
     xFactura: TFIBDataSetRO;
     procedure frFacturaGetValue(const ParName: string; var ParValue: variant);
     procedure DMLstFacturaDestroy(Sender: TObject);
     procedure frFacturaEnterRect(Memo: TStringList; View: TfrView);
     procedure DMLstFacturaArtCreate(Sender: TObject);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure xFacturaAfterOpen(DataSet: TDataSet);
     procedure QMDetalleBeforeClose(DataSet: TDataSet);
     procedure xFacturaBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     Moneda, TituloMoneda: string;
     LocalMascaraN, LocalMascaraL: string;
     FechaDesde, FechaHasta: TDateTime;
     ArticuloDesde, ArticuloHasta, Estado: string;
  public
     { Public declarations }
     procedure MostrarListado(aFechaDesde, aFechaHasta: TDateTime; aArticuloDesde, aArticuloHasta: string; Modo, aEstado: integer; Serie, aMoneda: string);
  end;

var
  DMLstFacturaArt : TDMLstFacturaArt;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles, UDameDato;

{$R *.DFM}

procedure TDMLstFacturaArt.DMLstFacturaArtCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstFacturaArt.DMLstFacturaDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstFacturaArt.MostrarListado(aFechaDesde, aFechaHasta: TDateTime; aArticuloDesde, aArticuloHasta: string; Modo, aEstado: integer; Serie, aMoneda: string);
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
        SelectSQL.Add(' SELECT ARTICULO, TITULO, FECHA, RIG, TIPO_DOC_TRIBUTARIO, FOLIO, UNIDADES, PRECIO, (UNIDADES * PRECIO) AS IMPORTE, LIQUIDO, NOMBRE_R_SOCIAL AS CLIENTE, NIF, PROYECTO FROM VER_CABECERA_DETALLE_FAC ')
     else
        SelectSQL.Add(' SELECT * FROM VER_CABECERA_DETALLE_FAC CD ');

     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' CANAL = :CANAL AND ');
     SelectSQL.Add(' SERIE = :SERIE AND ');
     SelectSQL.Add(' FECHA >= :FECHA_DESDE AND ');
     SelectSQL.Add(' FECHA <= :FECHA_HASTA AND ');
     SelectSQL.Add(' ARTICULO >= :ARTICULO_DESDE AND ');
     SelectSQL.Add(' ARTICULO <= :ARTICULO_HASTA ');
     if (aEstado <> 9) then // Todas
        SelectSQL.Add(' AND ESTADO = :ESTADO ');
     SelectSQL.Add(' ORDER BY ARTICULO, FECHA, RIG, LINEA ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
     Params.ByName['ARTICULO_DESDE'].AsString := ArticuloDesde;
     Params.ByName['ARTICULO_HASTA'].AsString := ArticuloHasta;
     if (aEstado <> 9) then // Todas
        Params.ByName['ESTADO'].AsInteger := aEstado
     else
        Estado := 'Todas';
     Open;
  end;

  if (Modo = 2) then
  begin
     // Exportar a Excel
     Archivo := Format(_('FacturasArticulos-%d_%s.xls'), [REntorno.Ejercicio, FormatDateTime('yyyymmdd-hhnnss', Now)]);
     if MySaveDialog(Archivo, 'XLS,ODS', '', 'DMLstFacturaArt') then
     begin
        ExportarExcel(Archivo, DSDetalle, True, True);
     end;
  end
  else
  begin
     DMListados.Imprimir(48, 0, Modo, Serie, '', frFactura, nil, nil);
  end;
end;

procedure TDMLstFacturaArt.frFacturaGetValue(const ParName: string; var ParValue: variant);
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
     ParValue := DMMain.DameCambio(False, QMDetalle.FieldByName('MONEDA').AsString, Moneda, QMDetalle.FieldByName('FECHA').AsDateTime, QMDetalle.FieldByName('PRECIO').AsFloat, Cambio);
  end;

  if ParName = 'Moneda_Canal' then
     ParValue := REntorno.Moneda;

  if ParName = 'Moneda' then
     ParValue := Moneda;

  if ParName = 'Titulo_Moneda' then
     ParValue := TituloMoneda;
end;

procedure TDMLstFacturaArt.frFacturaEnterRect(Memo: TStringList; View: TfrView);
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

procedure TDMLstFacturaArt.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  xFactura.Open;
  xArticulo.Open;
end;

procedure TDMLstFacturaArt.xFacturaAfterOpen(DataSet: TDataSet);
begin
  xCliente.Open;
end;

procedure TDMLstFacturaArt.QMDetalleBeforeClose(DataSet: TDataSet);
begin
  xFactura.Close;
  xArticulo.Close;
end;

procedure TDMLstFacturaArt.xFacturaBeforeClose(DataSet: TDataSet);
begin
  xCliente.Close;
end;

end.
