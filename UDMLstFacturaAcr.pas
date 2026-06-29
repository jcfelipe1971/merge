unit UDMLstFacturaAcr;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBQuery, HYFIBQuery, FR_DSet, FR_DBSet, DB, FIBDataSet, FIBDataSetRO,
  FIBDatabase, UFIBModificados, FR_Class, Fr_HYReport, frxClass,
  frxHYReport;

type
  TDMLstFacturaAcr = class(TDataModule)
     frFactura: TfrHYReport;
     TLocal: THYTransaction;
     QMCabecera: TFIBDataSetRO;
     DSCabecera: TDataSource;
     frDBCabecera: TfrDBDataSet;
     xAcreedores: TFIBDataSetRO;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     xEstados: TFIBDataSetRO;
     DSxEstado: TDataSource;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     frxFactura: TfrxHYReport;
     procedure DMLstFacturaAcrCreate(Sender: TObject);
     procedure DMLstFacturaAcrDestroy(Sender: TObject);
     procedure frFacturaGetValue(const ParName: string; var ParValue: variant);
     procedure frFacturaEnterRect(Memo: TStringList; View: TfrView);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure frxFacturaBeforePrint(Sender: TfrxReportComponent);
     procedure frxFacturaGetValue(const VarName: string; var Value: variant);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     Moneda: string;
     FechaDesde, FechaHasta, FechaConDesde, FechaConHasta: TDateTime;
     LocalMascaraN, LocalMascaraL: string;
  public
     { Public declarations }
     Estado: integer;
     procedure MostrarListadoFiltrado(Modo: byte; Filtro: integer; Serie: string);
     procedure MostrarListado(Desde, Hasta, DesdeCon, HastaCon: TDateTime; AcreedorDesde, AcreedorHasta, Modo: integer; Serie, Moneda_Listado: string; Ord: boolean; aComentario: string; aFechaListado: TDateTime);
  end;

var
  DMLstFacturaAcr : TDMLstFacturaAcr;
  SW : integer;

implementation

uses UDMMain, UEntorno, UDameDato, UDMListados, UFormGest;

{$R *.DFM}

procedure TDMLstFacturaAcr.DMLstFacturaAcrCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  Estado := -1;
end;

procedure TDMLstFacturaAcr.DMLstFacturaAcrDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstFacturaAcr.MostrarListadoFiltrado(Modo: byte; Filtro: integer; Serie: string);
begin
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

  DMListados.Imprimir(101, 0, Modo, Serie, '', frFactura, frxFactura, nil, nil);
end;

procedure TDMLstFacturaAcr.MostrarListado(Desde, Hasta, DesdeCon, HastaCon: TDateTime; AcreedorDesde, AcreedorHasta, Modo: integer; Serie, Moneda_Listado: string; Ord: boolean; aComentario: string; aFechaListado: TDateTime);
var
  Orden : string;
begin
  SW := 1;

  FechaDesde := Desde;
  FechaHasta := Hasta;
  FechaConDesde := DesdeCon;
  FechaConHasta := HastaCon;

  DMListados.Normalizar_Desde_Hasta(Desde, Hasta);
  DMListados.Normalizar_Desde_Hasta(DesdeCon, HastaCon);
  DMListados.Normalizar_Desde_Hasta(AcreedorDesde, AcreedorHasta);

  DMListados.DatosInforme(aFechaListado, aComentario);

  Moneda := Moneda_Listado;
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);

  if Ord then
     Orden := 'SERIE, RIG'
  else
     Orden := 'FECHA, SERIE, RIG';

  with QMCabecera do
  begin
     Close;

     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CABECERAS_FACTURA_ACR ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     if (Serie <> '') then
        SelectSQL.Add(' SERIE = ?SERIE AND ');
     if (Estado >= 0) then
        SelectSQL.Add(' ESTADO = ?ESTADO AND ');
     SelectSQL.Add(' ((FECHA >= ?FECHA_DESDE) AND (FECHA <= ?FECHA_HASTA)) AND ');
     SelectSQL.Add(' ((FECHA_CON >= ?FECHA_DESDE_CON) AND (FECHA_CON <= ?FECHA_HASTA_CON)) AND ');
     SelectSQL.Add(' ((ACREEDOR >= ?ACREEDOR_DESDE) AND (ACREEDOR <= ?ACREEDOR_HASTA)) ');
     SelectSQL.Add(' ORDER BY ' + Orden);

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (Serie <> '') then
        Params.ByName['SERIE'].AsString := Serie;
     if (Estado >= 0) then
        Params.ByName['ESTADO'].AsInteger := Estado;
     Params.ByName['FECHA_DESDE'].AsDateTime := Desde;
     Params.ByName['FECHA_HASTA'].AsDateTime := Hasta;
     Params.ByName['FECHA_DESDE_CON'].AsDateTime := DesdeCon;
     Params.ByName['FECHA_HASTA_CON'].AsDateTime := HastaCon;
     Params.ByName['ACREEDOR_DESDE'].AsInteger := AcreedorDesde;
     Params.ByName['ACREEDOR_HASTA'].AsInteger := AcreedorHasta;
     Open;
  end;

  DMListados.Imprimir(101, 0, Modo, Serie, '', frFactura, frxFactura, nil, nil);
end;

procedure TDMLstFacturaAcr.frFacturaGetValue(const ParName: string; var ParValue: variant);
var
  Cambio : extended;
begin
  DMListados.GetValue(ParName, ParValue);
  Cambio := 0;
  if (QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
     Cambio := 1 / QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;

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

  if ParName = 'Total_Factura' then
     ParValue := DMMain.DameCambio(False, QMCabecera.FieldByName('MONEDA').AsString, Moneda, QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('TOTAL_FACTURA').AsFloat, Cambio);

  if ParName = 'Acreedor' then
  begin
     if (QMCabecera.FieldByName('ACREEDOR').AsInteger <= -1) then
        ParValue := DameNombreTercerosVarios(QMCabecera.FieldByName('TIPO').AsString, QMCabecera.FieldByName('ID_E').AsInteger)
     else
        ParValue := QMCabecera.FieldByName('TITULO').AsString;
  end;
end;

procedure TDMLstFacturaAcr.frFacturaEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
  end;
end;

procedure TDMLstFacturaAcr.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  xProyectos.Open;
  xAcreedores.Open;
  xEstados.Open;
end;

procedure TDMLstFacturaAcr.frxFacturaBeforePrint(Sender: TfrxReportComponent);
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
        end;
end;

procedure TDMLstFacturaAcr.frxFacturaGetValue(const VarName: string; var Value: variant);
begin
  frFacturaGetValue(VarName, Value);
end;

procedure TDMLstFacturaAcr.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  xProyectos.Close;
  xAcreedores.Close;
  xEstados.Close;
end;

end.
