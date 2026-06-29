unit UDMLstAltaHojaDePrepaparacion;

interface

uses
  SysUtils, Classes, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, frxClass,
  frxHYReport, DB, FIBDataSet, FIBDataSetRO, FIBDatabase, UFIBModificados,
  UEntorno, FIBTableDataSet, FIBQuery;

type
  TDMLstAltaHojaDePrepaparacion = class(TDataModule)
     TLocal: THYTransaction;
     QMAltaPedidos: TFIBDataSetRO;
     DSQMAltaPedidos: TDataSource;
     frxQMAltaPedidos: TfrxHYReport;
     frQMAltaPedidos: TfrHYReport;
     frDSQMAltaPedidos: TfrDBDataSet;
     QMAltaPedFiltro: TFIBDataSetRO;
     DSQMAltaPedFiltro: TDataSource;
     frDBAltaPedFiltro: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frQMAltaPedidosGetValue(const ParName: string; var ParValue: variant);
     procedure frxQMAltaPedidosGetValue(const VarName: string; var Value: variant);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MuestraListado(modo: integer);
     procedure MuestraListadoFiltrado(modo: integer; DesdeCliente, HastaCliente, PedidoDesde, PedidoHasta: integer; FechaDesde, FechaHasta: TDateTime; DesdeArticulo, HastaArticulo, Almacen: string; SQL: TStrings); //sfg.albert
  end;

var
  DMLstAltaHojaDePrepaparacion : TDMLstAltaHojaDePrepaparacion;

implementation

uses UDMMain, UDMListados, UFormGest, UDMAltaHojasDePreparacion;

{$R *.dfm}

procedure TDMLstAltaHojaDePrepaparacion.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstAltaHojaDePrepaparacion.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstAltaHojaDePrepaparacion.MuestraListado(modo: integer);
begin
  with QMAltaPedidos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     Params.ByName['TIPO'].AsString := 'PEC';
     Open;
  end;

  DMListados.Imprimir(5110, 0, Modo, '', '', frQMAltaPedidos, frxQMAltaPedidos, nil, nil);
end;

procedure TDMLstAltaHojaDePrepaparacion.MuestraListadoFiltrado(modo: integer; DesdeCliente, HastaCliente, PedidoDesde, PedidoHasta: integer; FechaDesde, FechaHasta: TDateTime; DesdeArticulo, HastaArticulo, Almacen: string; SQL: TStrings);
begin
  with QMAltaPedFiltro do
  begin
     Close;
     SelectSQL.Assign(SQL);
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     Params.ByName['TIPO'].AsString := 'PEC';
     Params.ByName['DESDE_CLIENTE'].AsInteger := DesdeCliente;
     Params.ByName['HASTA_CLIENTE'].AsInteger := HastaCliente;
     Params.ByName['PEDIDO_DESDE'].AsInteger := PedidoDesde;
     Params.ByName['PEDIDO_HASTA'].AsInteger := PedidoHasta;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
     Params.ByName['DESDE_ARTICULO'].AsString := DesdeArticulo;
     Params.ByName['HASTA_ARTICULO'].AsString := HastaArticulo;
     {Params.ByName['ALMACEN'     ].AsString  := Almacen;}
     Open;
  end;

  DMListados.Imprimir(5120, 0, Modo, '', '', frQMAltaPedidos, frxQMAltaPedidos, nil, nil);
end;

procedure TDMLstAltaHojaDePrepaparacion.frQMAltaPedidosGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  {Esta function me devuelve el stock del artículo, pero tambien posiciona RxStock}
  if (ParName = 'Stock') then
     ParValue :=
        DMAltaHojasDePreparacion.DameStock(QMAltaPedFiltro.FieldByName('EMPRESA').AsInteger, QMAltaPedFiltro.FieldByName('CANAL').AsInteger, QMAltaPedFiltro.FieldByName('ARTICULO').AsString, QMAltaPedFiltro.FieldByName('ALMACEN').AsString);

  if (ParName = 'DisponiblesUb') then
     ParValue :=
        DMAltaHojasDePreparacion.DameUnidadesDisponibles(QMAltaPedFiltro.FieldByName('ALMACEN').AsString, QMAltaPedFiltro.FieldByName('ID_A').AsInteger);

  if (ParName = 'Uni_Preparacion') then
     ParValue :=
        DMAltaHojasDePreparacion.DameUnidadesEnPreparacion(QMAltaPedFiltro.FieldByName('ARTICULO').AsString, QMAltaPedFiltro.FieldByName('ALMACEN').AsString);
end;

procedure TDMLstAltaHojaDePrepaparacion.frxQMAltaPedidosGetValue(const VarName: string; var Value: variant);
begin
  frQMAltaPedidosGetValue(VarName, Value);
end;

end.
