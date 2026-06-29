unit UDMLstPedidoRentabilidad;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, DB, FIBDataSetRO, FIBDataSet, FR_Class,
  Fr_HYReport, FIBQuery, HYFIBQuery, FR_DSet, FR_DBSet, FIBTableDataSet;

type
  TDMLstPedidoRentabilidad = class(TDataModule)
     TLocal: TFIBTransaction;
     xClienteD: TFIBDataSetRO;
     xClienteH: TFIBDataSetRO;
     DSxClienteD: TDataSource;
     DSxClienteH: TDataSource;
     xClienteDTITULO: TFIBStringField;
     xClienteHTITULO: TFIBStringField;
     frPedidoRentabilidad: TfrHYReport;
     QMCabPedido: TFIBDataSetRO;
     QMDetPedido: TFIBDataSetRO;
     DSCabPedido: TDataSource;
     DSDetPedido: TDataSource;
     DSQMProOrd: TDataSource;
     QMProOrd: TFIBDataSetRO;
     QDameID: THYFIBQuery;
     Z_xBuscaOrden: TFIBDataSetRO;
     frDBPedidoCab: TfrDBDataSet;
     frDBPedidoDet: TfrDBDataSet;
     frDBProOrd: TfrDBDataSet;
     QMProOrdMat: TFIBTableSet;
     QMProOrdMatCompra: TFIBTableSet;
     DSQMProOrdMat: TDataSource;
     DSQMProOrdMatCompra: TDataSource;
     DSQMProOrdTarea: TDataSource;
     QMProOrdTarea: TFIBTableSet;
     QMProOrdFases: TFIBTableSet;
     DSQMProOrdFases: TDataSource;
     frDBFases: TfrDBDataSet;
     frDBMaterial: TfrDBDataSet;
     frDBCompra: TfrDBDataSet;
     frDBTarea: TfrDBDataSet;
     QueryTemp: THYFIBQuery;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMProOrdAfterOpen(DataSet: TDataSet);
     procedure QMProOrdFasesAfterOpen(DataSet: TDataSet);
     procedure QMDetPedidoAfterScroll(DataSet: TDataSet);
     procedure frPedidoRentabilidadGetValue(const ParName: string; var ParValue: variant);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     function DameIDPedido(pedido: integer): integer;
     procedure MostrarListado(modo, pedidod, pedidoh, cliented, clienteh: integer; fechad, fechah: TDateTime);
  end;

var
  DMLstPedidoRentabilidad : TDMLstPedidoRentabilidad;
  ordenp : integer;

implementation

uses UDMMain, UFormGest, UEntorno, UDMListados;

{$R *.dfm}

procedure TDMLstPedidoRentabilidad.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstPedidoRentabilidad.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

function TDMLstPedidoRentabilidad.DameIDPedido(pedido: integer): integer;
begin
  {
select id_s from ver_cabeceras_pedido
where
empresa=?empresa and
ejercicio=?ejercicio and
canal=?canal and
serie=?serie and
tipo='PEC' and
rig=?rig
}

  QDameID.Close;
  QDameID.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  QDameID.Params.ByName['ejercicio'].AsInteger := REntorno.Ejercicio;
  QDameID.Params.ByName['canal'].AsInteger := REntorno.canal;
  QDameID.Params.ByName['serie'].AsString := REntorno.Serie;
  QDameID.Params.ByName['rig'].AsInteger := pedido;
  QDameID.Prepare;
  QDameID.ExecQuery;

  Result := QDameID.Fields[0].AsInteger;
end;

procedure TDMLstPedidoRentabilidad.MostrarListado(Modo, pedidod, pedidoh, cliented, clienteh: integer; fechad, fechah: TDateTime);
var
  id_d, id_h : integer;
begin
  id_d := DameIDPedido(pedidod);
  id_h := DameIDPedido(pedidoh);

  QMCabPedido.Close;
  QMCabPedido.Params.ByName['id_sd'].AsInteger := id_d;
  QMCabPedido.Params.ByName['id_sh'].AsInteger := id_h;
  QMCabPedido.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  QMCabPedido.Params.ByName['ejercicio'].AsInteger := REntorno.Ejercicio;
  QMCabPedido.Params.ByName['canal'].AsInteger := REntorno.Canal;
  QMCabPedido.Params.ByName['cliented'].AsInteger := cliented;
  QMCabPedido.Params.ByName['clienteh'].AsInteger := clienteh;
  QMCabPedido.Open;

  QMDetPedido.Close;
  QMDetPedido.Open;

  {
  Z_xBuscaOrden.Close;
  Z_xBuscaOrden.Open;

  if ((Z_xBuscaOrdenID_ORDEN.AsInteger<>0) or (Z_xBuscaOrdenID_ORDEN.IsNull=True)) then
  begin
     QMProOrd.Close;
     QMProOrd.Params.ByName['id_orden'].AsInteger:=Z_xBuscaOrdenID_ORDEN.AsInteger;
     QMProOrd.Open;
  end;
  }

  DMListados.Imprimir(9014, Modo, '', '', frPedidoRentabilidad, nil);
end;

procedure TDMLstPedidoRentabilidad.QMProOrdAfterOpen(DataSet: TDataSet);
begin
  QMProOrdFases.Close;
  QMProOrdFases.Open;
end;

procedure TDMLstPedidoRentabilidad.QMProOrdFasesAfterOpen(DataSet: TDataSet);
begin
  QMProOrdMat.Close;
  QMProOrdMat.Open;

  QMProOrdMatCompra.Close;
  QMProOrdMatCompra.Open;

  QMProOrdTarea.Close;
  // QMproOrdTarea.Params.ByName['ID_ORDEN'].AsInteger := QMProOrd.FieldByName('ID_ORDEN').AsInteger;
  QMProOrdTarea.Open;
end;

procedure TDMLstPedidoRentabilidad.QMDetPedidoAfterScroll(DataSet: TDataSet);
begin
  if (ordenp <> QMCabPedido.FieldByName('RIG').AsInteger) then
  begin
     Z_xBuscaOrden.Close;
     Z_xBuscaOrden.Open;

     if ((Z_xBuscaOrden.FieldByName('ID_ORDEN').AsInteger <> 0) or (Z_xBuscaOrden.FieldByName('ID_ORDEN').IsNull = True)) then
     begin
        QMProOrd.Close;
        QMProOrd.Params.ByName['ID_ORDEN'].AsInteger := Z_xBuscaOrden.FieldByName('ID_ORDEN').AsInteger;
        QMProOrd.Open;
     end;
  end;
end;

procedure TDMLstPedidoRentabilidad.frPedidoRentabilidadGetValue(const ParName: string; var ParValue: variant);
var
  material, tarea : real;
begin
  if (ParName = 'TotalPedido') then
  begin
     with QueryTemp do
     begin
        Close;
        SQL.Clear;
        SQL.Add('select sum(b_imponible) as Suma from ver_detalle_pedido');
        SQL.Add('where id_s=?id_s');
        Params[0].Value := QMCabPedido.FieldByName('ID_S').AsInteger;
        ExecQuery;
        ParValue := FieldByName['Suma'].AsString;
     end;
  end;

  if (ParName = 'TotalCoste') then
  begin
     with QueryTemp do
     begin
        Close;
        SQL.Clear;
        SQL.Add('select sum(total_real) as suma from pro_ord_mat');
        SQL.Add('where id_orden=?id_orden');
        Params[0].Value := QMProOrd.FieldByName('ID_ORDEN').AsInteger;
        ExecQuery;

        material := FieldByName['Suma'].AsFloat;
     end;

     with QueryTemp do
     begin
        Close;
        SQL.Clear;
        SQL.Add('select sum(total_real) as suma from pro_ord_tarea');
        SQL.Add('where id_orden=?id_orden');
        Params[0].Value := QMProOrd.FieldByName('ID_ORDEN').AsInteger;
        ExecQuery;

        tarea := FieldByName['Suma'].AsFloat;

        ParValue := FloatToStr(material + tarea);
     end;
  end;
end;

end.
