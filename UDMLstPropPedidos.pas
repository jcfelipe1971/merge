unit UDMLstPropPedidos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FR_DSet, FR_DBSet, FR_Class, DB, FIBDataSet,
  FIBTableDataSet, FIBDatabase, UFIBModificados, FIBDataSetRO, Fr_HYReport;

type
  TDMLstPropPedidos = class(TDataModule)
     TLocal: THYTransaction;
     DSQMPedidosPorProveedorTodosLosAlm: TDataSource;
     frDBQMPedidosPorProveedorTodosLosAlm: TfrDBDataSet;
     QMPedidosPorProveedorTodosLosAlm: TFIBDataSetRO;
     DSQMPedidosPorFamiliaTodosLosAlm: TDataSource;
     frDBQMPedidosPorFamiliaTodosLosAlm: TfrDBDataSet;
     QMPedidosPorFamiliaTodosLosAlm: TFIBDataSetRO;
     QMPedidosPorFamilia: TFIBDataSetRO;
     DSQMPedidosPorFamilia: TDataSource;
     frDBQMPedidosPorFamilia: TfrDBDataSet;
     QMPedidosPorProveedor: TFIBDataSetRO;
     DSQMPedidosPorProveedor: TDataSource;
     frDBQMPedidosPorProveedor: TfrDBDataSet;
     frPropuestaDePedido: TfrHYReport;
     QMProveedores: TFIBDataSetRO;
     QMAlmacenes: TFIBDataSetRO;
     DSQMProveedores: TDataSource;
     DSQMAlmacenes: TDataSource;
     frDBQMProveedores: TfrDBDataSet;
     QMFamilias: TFIBDataSetRO;
     DSQMFamilias: TDataSource;
     frDBQMFamilias: TfrDBDataSet;
     frDBQMAlmacenes: TfrDBDataSet;
     QMProvAlm: TFIBDataSetRO;
     DSQMProvAlm: TDataSource;
     frDBQMProvAlm: TfrDBDataSet;
     QMAlmFam: TFIBDataSetRO;
     DSQMAlmFam: TDataSource;
     frDBQMAlmFam: TfrDBDataSet;
     QMFamAlm: TFIBDataSetRO;
     DSQMFamAlm: TDataSource;
     frDBQMFamAlm: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frPropuestaDePedidoGetValue(const ParName: string; var ParValue: variant);
     procedure QMProveedoresAfterScroll(DataSet: TDataSet);
     procedure QMFamiliasAfterScroll(DataSet: TDataSet);
     procedure QMAlmacenesAfterScroll(DataSet: TDataSet);
     procedure QMProvAlmAfterScroll(DataSet: TDataSet);
     procedure QMAlmFamAfterScroll(DataSet: TDataSet);
     procedure QMFamAlmAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
     DesdeProveedor, HastaProveedor: integer;
     DesdeFamilia, HastaFamilia: string;
     DesdeAmlacen, HastaAlmacen: string;
  public
     { Public declarations }
     procedure Imprimir(Grupo, Modo: integer; aDesdeProveedor: integer = 0; aHastaProveedor: integer = 0; aDesdeFamilia: string = ''; aHastaFamilia: string = ''; aDesdeAmlacen: string = ''; aHastaAlmacen: string = '');
  end;

var
  DMLstPropPedidos : TDMLstPropPedidos;

implementation

uses UDMListados, UDMMain, UEntorno, UFormGest;

{$R *.dfm}

procedure TDMLstPropPedidos.Imprimir(Grupo, Modo: integer; aDesdeProveedor: integer = 0; aHastaProveedor: integer = 0; aDesdeFamilia: string = ''; aHastaFamilia: string = ''; aDesdeAmlacen: string = ''; aHastaAlmacen: string = '');
begin
  if (aDesdeProveedor <> 0) then
     DesdeProveedor := aDesdeProveedor;
  if (aHastaProveedor <> 0) then
     HastaProveedor := aHastaProveedor;
  if (aDesdeFamilia <> '') then
     DesdeFamilia := aDesdeFamilia;
  if (aHastaFamilia <> '') then
     HastaFamilia := aHastaFamilia;
  if (aDesdeAmlacen <> '') then
     DesdeAmlacen := aDesdeAmlacen;
  if (aHastaAlmacen <> '') then
     HastaAlmacen := aHastaAlmacen;

  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  if (Grupo = 5500) then // Listado por Familia
  begin
     QMAlmFam.Close;
     QMAlmFam.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     QMAlmFam.Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     QMAlmFam.Params.ByName['DALMACEN'].AsString := DesdeAmlacen;
     QMAlmFam.Params.ByName['HALMACEN'].AsString := HastaAlmacen;
     QMAlmFam.Open;
  end;

  if (Grupo = 5501) then // Listado por Familia *Proveedor*
  begin
     QMAlmacenes.Close;
     QMAlmacenes.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     QMAlmacenes.Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     QMAlmacenes.Params.ByName['DALMACEN'].AsString := DesdeAmlacen;
     QMAlmacenes.Params.ByName['HALMACEN'].AsString := HastaAlmacen;
     QMAlmacenes.Open;
  end;

  if (Grupo = 5502) then // Listado por Proveedor todos los Almacenes
  begin
     QMProveedores.Close;
     QMProveedores.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     QMProveedores.Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     QMProveedores.Params.ByName['DPROVEEDOR'].AsInteger := DesdeProveedor;
     QMProveedores.Params.ByName['HPROVEEDOR'].AsInteger := HastaProveedor;
     QMProveedores.Open;
  end;

  if (Grupo = 5503) then // Listado por Familia *Proveedor* todos los Almacenes
  begin
     QMFamilias.Close;
     QMFamilias.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     QMFamilias.Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     QMFamilias.Params.ByName['DFAMILIA'].AsString := DesdeFamilia;
     QMFamilias.Params.ByName['HFAMILIA'].AsString := HastaFamilia;
     QMFamilias.Open;
  end;

  DMListados.Imprimir(Grupo, Modo, '', '', frPropuestaDePedido, nil);
end;

procedure TDMLstPropPedidos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TDMListados, DMListados);

  DesdeProveedor := 0;
  HastaProveedor := 999999999;
  DesdeFamilia := '';
  HastaFamilia := 'ZZZZZ';
  DesdeAmlacen := '';
  HastaAlmacen := 'ZZZ';
end;

procedure TDMLstPropPedidos.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstPropPedidos.frPropuestaDePedidoGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TDMLstPropPedidos.QMProveedoresAfterScroll(DataSet: TDataSet);
begin
  QMPedidosPorProveedorTodosLosAlm.Close;
  QMPedidosPorProveedorTodosLosAlm.Open;
end;

procedure TDMLstPropPedidos.QMFamiliasAfterScroll(DataSet: TDataSet);
begin
  QMPedidosPorFamiliaTodosLosAlm.Close;
  QMPedidosPorFamiliaTodosLosAlm.Open;
end;

procedure TDMLstPropPedidos.QMAlmacenesAfterScroll(DataSet: TDataSet);
begin
  QMProvAlm.Close;
  QMProvAlm.Params.ByName['DPROVEEDOR'].AsInteger := DesdeProveedor;
  QMProvAlm.Params.ByName['HPROVEEDOR'].AsInteger := HastaProveedor;
  QMProvAlm.Open;
end;

procedure TDMLstPropPedidos.QMProvAlmAfterScroll(DataSet: TDataSet);
begin
  QMPedidosPorProveedor.Close;
  QMPedidosPorProveedor.Open;
end;

procedure TDMLstPropPedidos.QMAlmFamAfterScroll(DataSet: TDataSet);
begin
  QMFamAlm.Close;
  QMFamAlm.Params.ByName['DFAMILIA'].AsString := DesdeFamilia;
  QMFamAlm.Params.ByName['HFAMILIA'].AsString := HastaFamilia;
  QMFamAlm.Open;
end;

procedure TDMLstPropPedidos.QMFamAlmAfterScroll(DataSet: TDataSet);
begin
  QMPedidosPorFamilia.Close;
  QMPedidosPorFamilia.Open;
end;

end.
