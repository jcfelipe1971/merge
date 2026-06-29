unit ZUDMLstTiempoMarc;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, Variants, Dialogs, Controls,
  jpeg, GIFImage, Graphics, ExtCtrls, Math;

type
  TZDMLstTiempoMarc = class(TDataModule)
     TLocal: THYTransaction;
     DSQMListado: TDataSource;
     QMListado: TFIBDataSetRO;
     QTemp: THYFIBQuery;
     QMListadoR_CLIENTE: TIntegerField;
     QMListadoR_DESC_CLIENTE: TFIBStringField;
     QMListadoR_SU_REFERENCIA: TFIBStringField;
     QMListadoR_FECHA_CORTE: TDateTimeField;
     QMListadoR_FECHA_UNION: TDateTimeField;
     QMListadoR_FECHA_MACARRON: TDateTimeField;
     QMListadoR_FECHA_MONTAJE: TDateTimeField;
     QMListadoR_FECHA_TERMINADO: TDateTimeField;
     QMListadoR_FECHA_PREPARADO: TDateTimeField;
     QMListadoR_FECHA: TDateTimeField;
     QMListadoR_FECHA_ENTREGA_PREV: TDateTimeField;
     QMListadoR_FECHA_ALBARAN: TDateTimeField;
     QMListadoZ_COD_BARRAS: TIntegerField;
     QMListadoR_SERIE: TFIBStringField;
     QMListadoR_OPE_CORTE: TIntegerField;
     QMListadoR_OPE_UNION: TIntegerField;
     QMListadoR_OPE_MACARRON: TIntegerField;
     QMListadoR_OPE_MONTAJE: TIntegerField;
     QMListadoR_OPE_TERMINADO: TIntegerField;
     QMListadoR_OPE_PREPARADO: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure EjecutaListado(LFFechaDesde, LFFechaHasta: TDateTime; LFClienteDEsde, LFClienteHasta: integer; LFSerie: string; ItemSelected1, ItemSelected2: integer);
     function DameDescCliente(Cliente: integer): string;
     procedure DameClientes(var ClienteDesde, ClienteHasta: string);
     procedure DamePedido(var ejercicio, rig: integer; var serie: string);
     function HayDetalle: boolean;
  end;

var
  ZDMLstTiempoMarc : TZDMLstTiempoMarc;

implementation

uses UEntorno, UDMMain, ZUFMLstTiempoMarc;

{$R *.dfm}

procedure TZDMLstTiempoMarc.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TZDMLstTiempoMarc.EjecutaListado(LFFechaDesde, LFFechaHasta: TDateTime; LFClienteDEsde, LFClienteHasta: integer; LFSerie: string; ItemSelected1, ItemSelected2: integer);
var
  order_by : string;
  transporte : integer;
begin
  case ItemSelected1 of
     0: order_by := ' ORDER BY Z_COD_BARRAS';
     1: order_by := ' ORDER BY R_CLIENTE';
     2: order_by := ' ORDER BY R_FECHA_CORTE';
     3: order_by := ' ORDER BY R_FECHA_UNION';
     4: order_by := ' ORDER BY R_FECHA_MACARRON';
     5: order_by := ' ORDER BY R_FECHA_MONTAJE';
     6: order_by := ' ORDER BY R_FECHA_TERMINADO';
     7: order_by := ' ORDER BY R_FECHA_PREPARADO';
     8: order_by := ' ORDER BY R_FECHA';
     9: order_by := ' ORDER BY R_FECHA_ENTREGA_PREV';
     10: order_by := ' ORDER BY R_FECHA_ALBARAN';
  end;

  case ItemSelected2 of
     0: transporte := 7067;
     1: transporte := 7068;
     2: transporte := 0;
     else
        transporte := 0;
  end;

  with QMListado do
  begin
     Close;
     SelectSQL.Text := 'select * from z_lst_tiempo_marc(?empresa,?ejercicio' +
        ',?serie,?canal,?fecha_desde ,?fecha_hasta ,?cliente_desde' +
        ',?cliente_hasta,?transporte )' + order_by;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Fecha_desde'].AsDateTime := LFFechaDesde;
     Params.ByName['Fecha_hasta'].AsDateTime := LFFechaHasta;
     Params.ByName['Cliente_desde'].AsInteger := LFClienteDEsde;
     Params.ByName['Cliente_hasta'].AsInteger := LFClienteHasta;
     Params.ByName['Serie'].AsString := LFSerie;
     Params.ByName['Transporte'].AsInteger := transporte;
     Open;
  end;
end;

function TZDMLstTiempoMarc.DameDescCliente(Cliente: integer): string;
begin
  with QTemp do
  begin
     Close;
     SQL.Text := 'Select titulo from ver_clientes_ef ' +
        'where empresa=?empresa ' +
        'and canal=?canal and ejercicio=?ejercicio ' +
        'and cliente=?cliente';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     ExecQuery;
     Result := FieldByName['titulo'].AsString;
     FreeHandle;
  end;
end;

procedure TZDMLstTiempoMarc.DameClientes(var ClienteDesde: string; var ClienteHasta: string);
begin
  with QTemp do
  begin
     Close;
     SQL.Text := 'Select min(cliente) as ClienteMin from ver_clientes_ef ' +
        'where empresa=?empresa ' +
        'and canal=?canal and ejercicio=?ejercicio';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     ExecQuery;
     ClienteDesde := FieldByName['ClienteMin'].AsString;
     FreeHandle;
  end;

  with QTemp do
  begin
     Close;
     SQL.Text := 'Select max(cliente) as ClienteMax from ver_clientes_ef ' +
        'where empresa=?empresa ' +
        'and canal=?canal and ejercicio=?ejercicio';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     ExecQuery;
     ClienteHasta := FieldByName['ClienteMax'].AsString;
     FreeHandle;
  end;
end;

function TZDMLstTiempoMarc.HayDetalle: boolean;
begin
  Result := (QMListado.RecordCount > 0);
end;

procedure TZDMLstTiempoMarc.DamePedido(var ejercicio, rig: integer; var serie: string);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'select EJERCICIO,RIG,SERIE ' +
        'from ver_cabeceras_pedido  ' +
        'where z_cod_barras_ped=?CODIGO_BARRAS and empresa=?EMPRESA';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CODIGO_BARRAS'].AsInteger := QMListadoZ_COD_BARRAS.AsInteger;
     ExecQuery;
     ejercicio := FieldByName['EJERCICIO'].AsInteger;
     rig := FieldByName['RIG'].AsInteger;
     serie := FieldByName['SERIE'].AsString;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

end.
