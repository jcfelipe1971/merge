unit UDMLstPedidosaprov;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBDatabase, UFIBModificados, FIBDataSetRO, FIBQuery, HYFIBQuery,
  frxClass, frxHYReport;

type
  TDMLstPedidosaProv = class(TDataModule)
     QMCabecera: TFIBDataSetRO;
     DSCabecera: TDataSource;
     frPedido: TfrHYReport;
     frDBCabecera: TfrDBDataSet;
     xProveedores: TFIBDataSetRO;
     TLocal: THYTransaction;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     xEstados: TFIBDataSetRO;
     DSxEstado: TDataSource;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     frxPedido: TfrxHYReport;
     QMCabeceraImportesPendientes: TFIBDataSetRO;
     DSCabeceraImportesPendientes: TDataSource;
     procedure frPedidoGetValue(const ParName: string; var ParValue: variant);
     procedure DMLstPedidoaProvDestroy(Sender: TObject);
     procedure frPedidoEnterRect(Memo: TStringList; View: TfrView);
     procedure DMLstPedidosaProvCreate(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure frxPedidoBeforePrint(Sender: TfrxReportComponent);
     procedure frxPedidoGetValue(const VarName: string; var Value: variant);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     Moneda: string;
     LocalMascaraN, LocalMascaraL: string;
     FechaDesde, FechaHasta: TDateTime;
  public
     { Public declarations }
     Estado: integer;
     procedure MostrarListadoFiltrado(Modo: byte; Filtro: integer; Serie: string; SQL: TStrings);
     procedure MostrarListado(Desde, Hasta: TDateTime; ProveedorDesde, ProveedorHasta, Modo: integer; Serie, Moneda_Listado: string; Ord: boolean; aComentario: string; aFechaListado: TDateTime);
  end;

var
  DMLstPedidosaProv : TDMLstPedidosaProv;
  SW : integer;

implementation

uses UDMMain, UEntorno, UFormGest, UDMListados;

{$R *.DFM}

procedure TDMLstPedidosaProv.DMLstPedidosaProvCreate(Sender: TObject);
begin
  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  Estado := -1;
end;

procedure TDMLstPedidosaProv.DMLstPedidoaProvDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstPedidosaProv.MostrarListadoFiltrado(Modo: byte; Filtro: integer; Serie: string; SQL: TStrings);
begin
  SW := 1;
  with QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.AddStrings(SQL);

     if (Filtro = 0) then
        DMMain.FiltraRO(QMCabecera, '11110', False);

     Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;

  Moneda := REntorno.Moneda;
  LocalMascaraN := DMMain.MascaraMoneda(Moneda, 1);
  LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);

  DMListados.Imprimir(43, 0, Modo, Serie, '', frPedido, frxPedido, nil, nil);
end;

procedure TDMLstPedidosaProv.MostrarListado(Desde, Hasta: TDateTime; ProveedorDesde, ProveedorHasta, Modo: integer; Serie, Moneda_Listado: string; Ord: boolean; aComentario: string; aFechaListado: TDateTime);
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
     SelectSQL.Add(' SELECT * FROM VER_CABECERAS_PEDIDO_PROV ');
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

  DMListados.Imprimir(43, 0, Modo, Serie, '', frPedido, frxPedido, nil, nil);
end;

procedure TDMLstPedidosaProv.frPedidoGetValue(const ParName: string; var ParValue: variant);
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
        ParValue := FieldByName('TITULO').AsString;
     end;

  if ParName = 'BaseImponible' then
     ParValue := DMMain.DameCambio(False, QMCabecera.FieldByName('MONEDA').AsString, Moneda, QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('S_BASES').AsFloat);
  if ParName = 'Total_Pedido' then
     ParValue := DMMain.DameCambio(False, QMCabecera.FieldByName('MONEDA').AsString, Moneda, QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('LIQUIDO').AsFloat);

  if ParName = 'BaseImponible_Pendiente' then
     ParValue := DMMain.DameCambio(False, QMCabecera.FieldByName('MONEDA').AsString, Moneda, QMCabecera.FieldByName('FECHA').AsDateTime, QMCabeceraImportesPendientes.FieldByName('S_BASES').AsFloat);
  if ParName = 'Total_Pedido_Pendiente' then
     ParValue := DMMain.DameCambio(False, QMCabecera.FieldByName('MONEDA').AsString, Moneda, QMCabecera.FieldByName('FECHA').AsDateTime, QMCabeceraImportesPendientes.FieldByName('LIQUIDO').AsFloat);
end;

procedure TDMLstPedidosaProv.frPedidoEnterRect(Memo: TStringList; View: TfrView);
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

procedure TDMLstPedidosaProv.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  xProyectos.Open;
  xEstados.Open;
  xProveedores.Open;
  QMCabeceraImportesPendientes.Open;
end;

procedure TDMLstPedidosaProv.frxPedidoBeforePrint(Sender: TfrxReportComponent);
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

procedure TDMLstPedidosaProv.frxPedidoGetValue(const VarName: string; var Value: variant);
begin
  frPedidoGetValue(VarName, Value);
end;

procedure TDMLstPedidosaProv.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  xProyectos.Close;
  xEstados.Close;
  xProveedores.Close;
  QMCabeceraImportesPendientes.Close;
end;

end.
