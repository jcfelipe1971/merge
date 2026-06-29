unit UDMLstPedidosEntreAlmacenes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados, FR_Class, Fr_HYReport, UHYReport, FR_DSet, FR_DBSet,
  frxClass, frxHYReport;

type
  TDMLstPedidosEntreAlmacenes = class(TDataModule)
     frPedidos: TfrHYReport;
     TLocal: THYTransaction;
     QMCabecera: TFIBDataSetRO;
     DSCabecera: TDataSource;
     QMDetalle: TFIBDataSetRO;
     DSDetalle: TDataSource;
     HYRSCabecera: THYReportSource;
     HYReport: THYReport;
     HYRSDetalle: THYReportSource;
     frDBdetalle: TfrDBDataSet;
     frDBCabecera: TfrDBDataSet;
     QMCabeceraPendientes: TFIBDataSetRO;
     DSCabeceraPendientes: TDataSource;
     QMDetallePendientes: TFIBDataSetRO;
     DSDetallePendientes: TDataSource;
     HYRSCabeceraPendientes: THYReportSource;
     HYRSDetallePendientes: THYReportSource;
     frDBDetallePendientes: TfrDBDataSet;
     frDBCabeceraPendientes: TfrDBDataSet;
     xAlmacenOrigen: TFIBDataSetRO;
     DSxAlmacenOrigen: TDataSource;
     xAlmacenDestino: TFIBDataSetRO;
     DSxAlmacenDestino: TDataSource;
     HYRxAlmacenOrigen: THYReportSource;
     HYRxAlmacenDestino: THYReportSource;
     frDBxAlmacenDestino: TfrDBDataSet;
     frDBxAlmacenOrigen: TfrDBDataSet;
     frxPedidos: TfrxHYReport;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frPedidosGetValue(const ParName: string; var ParValue: variant);
     procedure frPedidosBeforePrint(Memo: TStringList; View: TfrView);
     procedure frxPedidosBeforePrint(Sender: TfrxReportComponent);
  private
     { Private declarations }
     Param_LSTPICK003: string;
  public
     { Public declarations }
     procedure MostrarListado(Modo, ID: integer);
     procedure MostrarListadoPendientes(Modo: integer);
     procedure MostrarListadoPicking(Modo, ID: integer);
  end;

var
  DMLstPedidosEntreAlmacenes : TDMLstPedidosEntreAlmacenes;

implementation

uses UDMListados, UEntorno, UFormGest, UParam, UDMMain;

{$R *.dfm}

procedure TDMLstPedidosEntreAlmacenes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstPedidosEntreAlmacenes.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstPedidosEntreAlmacenes.MostrarListado(Modo, ID: integer);
var
  Serie, Titulo : string;
  Grupo, Listado : integer;
  //Copias : integer;
begin
  Grupo := 2002;
  Listado := 0;

  with QMCabecera do
  begin
     Close;
     Params.ByName['ID'].AsInteger := ID;
     Open;
  end;

  with QMDetalle do
  begin
     Close;
     Open;
  end;

  with xAlmacenOrigen do
  begin
     DataSource := DSCabecera;
     Close;
     Open;
  end;

  with xAlmacenDestino do
  begin
     DataSource := DSCabecera;
     Close;
     Open;
  end;

  Serie := QMCabecera.FieldByName('SERIE').AsString;
  Titulo := _('PedAlm') + '_' + QMCabecera.FieldByName('EJERCICIO').AsString + '-' + QMCabecera.FieldByName('SERIE').AsString + '-' + QMCabecera.FieldByName('RIG').AsString;
  DMListados.Imprimir(Grupo, Listado, Modo, Serie, Titulo, frPedidos, frxPedidos, HYReport);
end;

procedure TDMLstPedidosEntreAlmacenes.MostrarListadoPendientes(Modo: integer);
var
  Serie, Titulo : string;
  Grupo, Listado : integer;
  //Copias : integer;
begin
  Grupo := 2003;
  Listado := 0;

  with QMCabeceraPendientes do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM GES_CABECERAS_PEA ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA=?EMPRESA AND ');
     SelectSQL.Add(' CANAL=?CANAL AND ');
     SelectSQL.Add(' ESTADO=0 ');
     if (Trim(REntorno.AlmacenRestringido) > ' ') then
        SelectSQL.Add('AND (ALMACEN_ORI=?ALMACEN OR ALMACEN_DST=?ALMACEN) ');
     SelectSQL.Add('ORDER BY EJERCICIO, RIG');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (Trim(REntorno.AlmacenRestringido) > ' ') then
        Params.ByName['ALMACEN'].AsString := REntorno.AlmacenRestringido;
     Open;
  end;

  with QMDetallePendientes do
  begin
     Close;
     Open;
  end;

  with xAlmacenOrigen do
  begin
     DataSource := DSCabeceraPendientes;
     Close;
     Open;
  end;

  with xAlmacenDestino do
  begin
     DataSource := DSCabeceraPendientes;
     Close;
     Open;
  end;

  Serie := QMCabeceraPendientes.FieldByName('SERIE').AsString;
  Titulo := _('PedAlm') + '_' + QMCabeceraPendientes.FieldByName('EJERCICIO').AsString + '-' + QMCabeceraPendientes.FieldByName('SERIE').AsString + '-' + QMCabeceraPendientes.FieldByName('RIG').AsString;
  DMListados.Imprimir(Grupo, Listado, Modo, Serie, Titulo, frPedidos, frxPedidos, HYReport);
end;

procedure TDMLstPedidosEntreAlmacenes.MostrarListadoPicking(Modo, ID: integer);
var
  Serie, Titulo : string;
  Grupo, Listado : integer;
  //Copias : integer;
begin
  Grupo := 653;
  Listado := 0;

  with QMCabecera do
  begin
     Close;
     Params.ByName['ID'].AsInteger := ID;
     Open;
  end;

  Param_LSTPICK003 := LeeParametro('LSTPICK003');
  with QMDetalle do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_DETALLE_PEA_LST ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ID_CAB = :ID ');
     if ((Param_LSTPICK003) = '') then
        SelectSQL.Add(' ORDER BY LINEA ')
     else
        SelectSQL.Add(' ORDER BY ' + Param_LSTPICK003);

     Open;
  end;

  with xAlmacenOrigen do
  begin
     DataSource := DSCabecera;
     Close;
     Open;
  end;

  with xAlmacenDestino do
  begin
     DataSource := DSCabecera;
     Close;
     Open;
  end;

  Serie := QMCabecera.FieldByName('SERIE').AsString;
  Titulo := _('Picking') + '_' + QMCabecera.FieldByName('EJERCICIO').AsString + '-' + QMCabecera.FieldByName('SERIE').AsString + '-' + QMCabecera.FieldByName('RIG').AsString;
  DMListados.Imprimir(Grupo, Listado, Modo, Serie, Titulo, frPedidos, frxPedidos, HYReport);
end;

procedure TDMLstPedidosEntreAlmacenes.frPedidosGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  // Stock informa el stock del almacen que entrega
  if ParName = 'Stock' then
     ParValue := DMMain.DameStockArticulo(QMDetalle.FieldByName('EMPRESA').AsInteger, QMDetalle.FieldByName('CANAL').AsInteger, QMDetalle.FieldByName('ARTICULO').AsString, QMCabecera.FieldByName('ALMACEN_DST').AsString);

  if ParName = 'Stock_AlmPide' then
     ParValue := DMMain.DameStockArticulo(QMDetalle.FieldByName('EMPRESA').AsInteger, QMDetalle.FieldByName('CANAL').AsInteger, QMDetalle.FieldByName('ARTICULO').AsString, QMCabecera.FieldByName('ALMACEN_ORI').AsString);
  if ParName = 'Stock_AlmEntrega' then
     ParValue := DMMain.DameStockArticulo(QMDetalle.FieldByName('EMPRESA').AsInteger, QMDetalle.FieldByName('CANAL').AsInteger, QMDetalle.FieldByName('ARTICULO').AsString, QMCabecera.FieldByName('ALMACEN_DST').AsString);
end;

procedure TDMLstPedidosEntreAlmacenes.frPedidosBeforePrint(Memo: TStringList; View: TfrView);
begin
  DMListados.BeforePrint(Memo, View);
end;

procedure TDMLstPedidosEntreAlmacenes.frxPedidosBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

end.
