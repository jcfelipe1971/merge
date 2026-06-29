unit UDMLstPropuestasDeProv;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBDatabase, UFIBModificados, FIBDataSetRO, FIBQuery, HYFIBQuery,
  frxClass, frxHYReport;

type
  TDMLstPropuestasDeProv = class(TDataModule)
     QMCabecera: TFIBDataSetRO;
     DSCabecera: TDataSource;
     frPropuesta: TfrHYReport;
     frDBCabecera: TfrDBDataSet;
     xProveedores: TFIBDataSetRO;
     TLocal: THYTransaction;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     xEstados: TFIBDataSetRO;
     DSxEstado: TDataSource;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     frxPropuesta: TfrxHYReport;
     procedure frPropuestaGetValue(const ParName: string; var ParValue: variant);
     procedure frPropuestaEnterRect(Memo: TStringList; View: TfrView);
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure frxPropuestaBeforePrint(Sender: TfrxReportComponent);
     procedure frxPropuestaGetValue(const VarName: string; var Value: variant);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     FechaDesde, FechaHasta: TDateTime;
     Moneda: string;
     LocalMascaraN, LocalMascaraL: string;
     SW: integer;
  public
     { Public declarations }
     Estado: integer;
     procedure MostrarListadoFiltrado(Modo: byte; Filtro: integer; Serie: string);
     procedure MostrarListado(Desde, Hasta: TDateTime; ProveedorDesde, ProveedorHasta, Modo: integer; Serie, Moneda_Listado: string; Ord: boolean; aComentario: string; aFechaListado: TDateTime);
  end;

var
  DMLstPropuestasDeProv : TDMLstPropuestasDeProv;

implementation

uses UDMMain, UEntorno, UFormGest, UDMListados, UFMLstEntreFechas;

{$R *.DFM}

procedure TDMLstPropuestasDeProv.DataModuleCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  Estado := -1;
end;

procedure TDMLstPropuestasDeProv.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstPropuestasDeProv.MostrarListadoFiltrado(Modo: byte; Filtro: integer; Serie: string);
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

  DMListados.Imprimir(520, 0, Modo, Serie, '', frPropuesta, frxPropuesta, nil, nil);
end;

procedure TDMLstPropuestasDeProv.MostrarListado(Desde, Hasta: TDateTime; ProveedorDesde, ProveedorHasta, Modo: integer; Serie, Moneda_Listado: string; Ord: boolean; aComentario: string; aFechaListado: TDateTime);
var
  Orden : string;
begin
  SW := 1;

  FechaDesde := Desde;
  FechaHasta := Hasta;
  DMListados.Normalizar_Desde_Hasta(Desde, Hasta);
  DMListados.Normalizar_Desde_Hasta(ProveedorDesde, ProveedorHasta);

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
     SelectSQL.Add(' SELECT * FROM VER_CABECERAS_OFP ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     if (Serie <> '') then
        SelectSQL.Add(' SERIE = ?SERIE AND ');
     if (Estado >= 0) then
        SelectSQL.Add(' ESTADO = ?ESTADO AND ');
     SelectSQL.Add(' ((FECHA >= ?FECHA_DESDE) AND (FECHA <= ?FECHA_HASTA)) AND ');
     SelectSQL.Add(' ((PROVEEDOR >= ?PROVEEDOR_DESDE) AND (PROVEEDOR <= ?PROVEEDOR_HASTA)) ');
     SelectSQL.Add(' ORDER BY ' + Orden);

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (Serie <> '') then
        Params.ByName['SERIE'].AsString := Serie;
     if (Estado >= 0) then
        Params.ByName['ESTADO'].AsInteger := Estado;
     Params.ByName['FECHA_DESDE'].AsDateTime := Desde;
     Params.ByName['FECHA_HASTA'].AsDateTime := Hasta;
     Params.ByName['PROVEEDOR_DESDE'].AsInteger := ProveedorDesde;
     Params.ByName['PROVEEDOR_HASTA'].AsInteger := ProveedorHasta;
     Open;
  end;

  DMListados.Imprimir(520, 0, Modo, Serie, '', frPropuesta, frxPropuesta, nil, nil);
end;

procedure TDMLstPropuestasDeProv.frPropuestaGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'Desde' then
     ParValue := FechaDesde;
  if ParName = 'Hasta' then
     ParValue := FechaHasta;
  if ParName = 'Fecha' then
     ParValue := QMCabecera.FieldByName('FECHA').AsDateTime;

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

  if ParName = 'Total_Propuesta' then
     ParValue := DMMain.DameCambio(False, QMCabecera.FieldByName('MONEDA').AsString, Moneda, QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('LIQUIDO').AsFloat);
end;

procedure TDMLstPropuestasDeProv.frPropuestaEnterRect(Memo: TStringList; View: TfrView);
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

procedure TDMLstPropuestasDeProv.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  xProyectos.Open;
  xEstados.Open;
  xProveedores.Open;
end;

procedure TDMLstPropuestasDeProv.frxPropuestaBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMLstPropuestasDeProv.frxPropuestaGetValue(const VarName: string; var Value: variant);
begin
  frPropuestaGetValue(VarName, Value);
end;

procedure TDMLstPropuestasDeProv.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  xProyectos.Close;
  xEstados.Close;
  xProveedores.Close;
end;

end.
