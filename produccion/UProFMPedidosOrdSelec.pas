unit UProFMPedidosOrdSelec;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ExtCtrls, rxPlacemnt, StdCtrls, Mask, rxToolEdit, UFormGest,
  ULFToolBar, ULFMemo, ULFEdit, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, ULFDateEdit,
  UFPEditSinNavegador, ULFFormStorage, ActnList, ULFActionList, Menus,
  UTeclas, UControlEdit, UEditPanel;

type
  TProFMPedidosOrdSelec = class(TFPEditSinNavegador)
     LFecha: TLFLabel;
     DFechaGOrden: TLFDateEdit;
     LUnidades: TLFLabel;
     EUnidades: TLFEdit;
     ENotas: TLFMemo;
     LNotas: TLFLabel;
     LStock: TLFLabel;
     CBOrdenes: TLFCheckBox;
     EStock: TLFEdit;
     LArticulo: TLFLabel;
     EArticulo: TLFEdit;
     EDArticulo: TLFEdit;
     LAlmacen: TLFLabel;
     EAlmacen: TLFEdit;
     EDAlmacen: TLFEdit;
     LEscandallo: TLFLabel;
     EEscandallo: TLFEdit;
     TBGenerar: TToolButton;
     TSep1: TToolButton;
     LUdsProducir: TLFLabel;
     EProd: TLFEdit;
     LUdsPedido: TLFLabel;
     EUnidadesPed: TLFEdit;
     LUdsManuales: TLFLabel;
     EManual: TLFEdit;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure TBGenerarClick(Sender: TObject);
     procedure EUnidadesExit(Sender: TObject);
  private
     { Private declarations }
     IdCab: integer;
  public
     { Public declarations }
     procedure GenerarOF(Sender: TObject);
     procedure CargaDatos;
     procedure Inicializa(aIdCab: integer);
  end;

var
  ProFMPedidosOrdSelec : TProFMPedidosOrdSelec;

implementation

uses UDMMain, UProDMPedidosOrd, UProDMPedidosOrdSelec, FIBDataSetRO, UEntorno,
  UProFMPedidosOrd, UProFMSelecImpEsc, UProDMGestOrden, FIBQuery,
  HYFIBQuery;

{$R *.dfm}

procedure TProFMPedidosOrdSelec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with ProDMPedidosOrdSelec.QVarios do
  begin
     Close;
     SQL.Clear;
     SQL.Add('SELECT COUNT(*) FROM PRO_LANZA_ORDENES WHERE ID_CAB = ?ID_CAB');
     Params.ByName['ID_CAB'].AsInteger := IdCab;
     ExecQuery;
     if Fields[0].AsInteger = 0 then
     begin
        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM PRO_CAB_LANZA_ORDENES WHERE ID_CAB = ?ID_CAB');
        Params.ByName['ID_CAB'].AsInteger := IdCab;
        ExecQuery;
     end;
     Close;
  end;
  CierraData(ProDMPedidosOrdSelec);
  Action := caFree;
end;

procedure TProFMPedidosOrdSelec.FormCreate(Sender: TObject);
begin
  AbreData(TProDMPedidosOrdSelec, ProDMPedidosOrdSelec);

  ProDMPedidosOrdSelec.QMarcadosPedidos.Close;
  ProDMPedidosOrdSelec.QMarcadosPedidos.Open;
  ProDMPedidosOrdSelec.QMarcadosPedidos.First;
  CargaDatos;
end;

procedure TProFMPedidosOrdSelec.TBGenerarClick(Sender: TObject);
begin
  // ProDMPedidosOrdSelec.QMarcadosPedidos.First;

  if (ProDMPedidosOrdSelec.QMarcadosPedidos.EOF <> True) then
  begin
     GenerarOF(Sender);
     ProDMPedidosOrdSelec.QMarcadosPedidos.Next;
     CargaDatos;
     EUnidades.SetFocus;
  end;

  if (ProDMPedidosOrdSelec.QMarcadosPedidos.EOF = True) then
     Close;
end;

procedure TProFMPedidosOrdSelec.EUnidadesExit(Sender: TObject);
var
  temp : string;
begin
  // Si unidades total - unidades producidas<=0
  if StrToInt(EUnidades.Text) > (ProDMPedidosOrdSelec.QMarcadosPedidosUNIDADES.Value -
     ProDMPedidosOrdSelec.QMarcadosPedidosPRO_UNIDADES.Value) then
  begin
     if MessageDlg(_('Ha sobrepasado la cantidad del pedido. Quiere fabricar ') + #13#10 +
        IntToStr(StrToInt(EUnidades.Text) - (StrToInt(EUnidadesPed.Text) -
        StrToInt(Eprod.Text))) + _(' unidades adicionales?'), mtConfirmation,
        [mbYes, mbNo], 0) = mrYes then
     begin
        temp := EUnidades.Text;
        EUnidades.Text := IntToStr(ProDMPedidosOrdSelec.QMarcadosPedidosUNIDADES.AsInteger -
           ProDMPedidosOrdSelec.QMarcadosPedidosPRO_UNIDADES.AsInteger);
        EUnidades.Color := clInfoBk;
        EUnidades.ReadOnly := True;
        LUdsManuales.Visible := True;
        EManual.Visible := True;
        EManual.Text := IntToStr((StrToInt(Temp) -
           (StrToInt(EUnidadesPed.Text) - StrToInt(Eprod.Text))));
     end
     else
        EUnidades.Text := IntToStr(ProDMPedidosOrdSelec.QMarcadosPedidosUNIDADES.AsInteger -
           ProDMPedidosOrdSelec.QMarcadosPedidosPRO_UNIDADES.AsInteger);
  end;
end;

procedure TProFMPedidosOrdSelec.GenerarOF(Sender: TObject);
var
  rig_of, estado{, genera_of} : integer;
  temp : string;
begin
  {genera_of := 0; No se utiliza}

  //Llamo al evento exit de Eunidades, para controlar las unidades manuales, sinó se ha
  //controlado ya

  if ((StrToInt(EUnidades.Text) > (ProDMPedidosOrdSelec.QMarcadosPedidosUNIDADES.Value -
     ProDMPedidosOrdSelec.QMarcadosPedidosPRO_UNIDADES.Value)) and (EManual.Visible = False)) then
     EUnidadesExit(Sender);

  {  Solo para pedidos pdtes de generar totalmente. Parciales de momento no }
  if (ProFMPedidosOrd.CBFiltro.ItemIndex <> 2) then
  begin    //MIRAR SI ELIMINAR LA PARTE DE GENERA_OF
     //Compruebo si el escandallo asociado se pruede volcar en la OF a la vez que se genera
     ProDMPedidosOrdSelec.QVarios.Close;
     ProDMPedidosOrdSelec.QVarios.SQL.Clear;
     ProDMPedidosOrdSelec.QVarios.SQL.Add('select genera_of from pro_escandallo');
     ProDMPedidosOrdSelec.QVarios.SQL.Add('where empresa=?empresa and escandallo=?escandallo and tipo=''EPR''');
     ProDMPedidosOrdSelec.QVarios.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     ProDMPedidosOrdSelec.QVarios.Params.ByName['escandallo'].AsInteger := StrToInt(EEscandallo.Text);
     ProDMPedidosOrdSelec.QVarios.ExecQuery;

     {genera_of := ProDMPedidosOrdSelec.QVarios.Fields[0].AsInteger; No se utiliza}
  end;

  if MessageDlg(_('El proceso de generar la orden es irreversible,') + #13#10 +
     _('¿ Desea continuar ?'), mtConfirmation, [mbOK, mbCancel], 0) = 1 then
  begin
     ProDMPedidosOrdSelec.InsertarPedidosOrd(EUnidades.Text, ENotas.Text, EManual.Text);
     //Modifico el stock del pedido, para que no me deje sobrepasarme del stock del pedido

     if ((StrToInt(EUnidades.Text) =
        (ProDMPedidosOrdSelec.QMarcadosPedidosUNIDADES.Value -
        ProDMPedidosOrdSelec.QMarcadosPedidosPRO_UNIDADES.Value)) or (CBOrdenes.Checked = False)) then
        estado := 2 //Estado de Creado pedido total
     else
        estado := 1; //Estado de Creado pedido parcial

     ProDMPedidosOrdSelec.QModificarEstado.Params.ByName['estado'].AsInteger := estado;
     ProDMPedidosOrdSelec.QModificarEstado.Params.ByName['VPROUNDS'].AsFloat :=
        ProDMPedidosOrdSelec.QMarcadosPedidosPRO_UNIDADES.Value + StrToInt(EUnidades.Text);
     ProDMPedidosOrdSelec.QModificarEstado.Params.ByName['VPROB_IMPONIBLE'].AsFloat :=
        ProDMPedidosOrdSelec.QMarcadosPedidosB_IMPONIBLE.Value;
     ProDMPedidosOrdSelec.QModificarEstado.Params.ByName['EMPRESA'].AsInteger := ProDMPedidosOrdSelec.QMarcadosPedidosEmpresa.Value;
     ProDMPedidosOrdSelec.QModificarEstado.Params.ByName['EJERCICIO'].AsInteger :=
        ProDMPedidosOrdSelec.QMarcadosPedidosEjercicio.Value;
     ProDMPedidosOrdSelec.QModificarEstado.Params.ByName['CANAL'].AsInteger := ProDMPedidosOrdSelec.QMarcadosPedidosCanal.Value;
     ProDMPedidosOrdSelec.QModificarEstado.Params.ByName['SERIE'].AsString := ProDMPedidosOrdSelec.QMarcadosPedidosSerie.Value;
     ProDMPedidosOrdSelec.QModificarEstado.Params.ByName['RIG'].AsInteger := ProDMPedidosOrdSelec.QMarcadosPedidosRig.Value;
     ProDMPedidosOrdSelec.QModificarEstado.Params.ByName['LINEA'].AsInteger := ProDMPedidosOrdSelec.QMarcadosPedidosLinea.Value;
     ProDMPedidosOrdSelec.QModificarEstado.ExecQuery;

     //end;
     //Refresco el grid principal
     ProDMPedidosOrd.QMDetallePedidos.Close;
     ProDMPedidosOrd.QMDetallePedidos.Open;
     ProDMPedidosOrd.QMProPedidosOrd.Close;
     ProDMPedidosOrd.QMProPedidosOrd.Open;

     //Cogo la última OF generada, que és la anterior
     ProDMPedidosOrdSelec.QVarios.Close;
     ProDMPedidosOrdSelec.QVarios.SQL.Clear;
     ProDMPedidosOrdSelec.QVarios.SQL.Add('select max(rig_of) from Pro_Ord');
     ProDMPedidosOrdSelec.QVarios.SQL.Add('where empresa=?empresa and ejercicio=?ejercicio and ');
     ProDMPedidosOrdSelec.QVarios.SQL.Add('canal=?canal and series=?series');
     ProDMPedidosOrdSelec.QVarios.Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     ProDMPedidosOrdSelec.QVarios.Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     ProDMPedidosOrdSelec.QVarios.Params.ByName['Canal'].AsInteger := REntorno.Canal;
     ProDMPedidosOrdSelec.QVarios.Params.ByName['Series'].AsString := REntorno.Serie;
     ProDMPedidosOrdSelec.QVarios.ExecQuery;
     rig_of := ProDMPedidosOrdSelec.QVarios.Fields[0].AsInteger;

     //Una vez tengo al OF, la selecciono en la Select de QMPro
     AbreData(TProDMGestOrden, ProDMGestOrden);
     temp := ProDMGestOrden.QMProOrd.SelectSQL.Text;
     ProDMGestOrden.QMProOrd.Close;
     ProDMGestOrden.QMProOrd.SelectSQL.Clear;
     ProDMGestOrden.QMProOrd.SelectSQL.Add('select * from Pro_ord');
     ProDMGestOrden.QMProOrd.SelectSQL.Add(
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal and series=?series');
     ProDMGestOrden.QMProOrd.SelectSQL.Add('and rig_of=?rig_of');
     ProDMGestOrden.QMProOrd.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     ProDMGestOrden.QMProOrd.Params.ByName['ejercicio'].AsInteger := REntorno.Ejercicio;
     ProDMGestOrden.QMProOrd.Params.ByName['canal'].AsInteger := REntorno.Canal;
     ProDMGestOrden.QMProOrd.Params.ByName['series'].AsString := REntorno.Serie;
     ProDMGestOrden.QMProOrd.Params.ByName['rig_of'].AsInteger := rig_of;
     ProDMGestOrden.QMProOrd.Open;
     //  end;

     //Llamo al formulario para hacer el volcado de escandallo
     ProFMSelecImpEsc := TProFMSelecImpEsc.Create(Self);
     ProFMSelecImpEsc.dm := ProDMGestOrden;
     ProFMSelecImpEsc.ShowModal;

     //Restauro la select de qmproord
     ProDMGestOrden.QMProOrd.Close;
     ProDMGestOrden.QMProOrd.SelectSQL.Clear;
     ProDMGestOrden.QMProOrd.SelectSQL.Text := temp;
  end;

  CierraData(ProDMGestOrden);
end;

procedure TProFMPedidosOrdSelec.CargaDatos;
begin
  LUdsManuales.Visible := False;
  EManual.Visible := False;
  EManual.Clear;
  EUnidades.Color := clWindow;
  EUnidades.ReadOnly := False;

  EArticulo.Text := ProDMPedidosOrdSelec.QMarcadosPedidosARTICULO.AsString;
  EDArticulo.Text := ProDMPedidosOrdSelec.QMarcadosPedidosTITULO.AsString;
  EEscandallo.Text := ProDMPedidosOrdSelec.QMarcadosPedidosESCANDALLO.AsString;
  //Inserto el almacen de entrada del escandallo
  ProDMPedidosOrdSelec.QAlmacen.Close;
  ProDMPedidosOrdSelec.QAlmacen.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  ProDMPedidosOrdSelec.QAlmacen.Params.ByName['escandallo'].AsInteger := ProDMPedidosOrd.QMDetallePedidosESCANDALLO.AsInteger;
  ProDMPedidosOrdSelec.QAlmacen.Open;

  EAlmacen.Text := ProDMPedidosOrdSelec.QAlmacen.Fields[0].AsString;
  EDAlmacen.Text := ProDMPedidosOrdSelec.QAlmacen.Fields[1].AsString;

  //Inserto el stock del articulo a generar la OF
  ProDMPedidosOrdSelec.QStock.Close;
  ProDMPedidosOrdSelec.QStock.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  ProDMPedidosOrdSelec.QStock.Params.ByName['canal'].AsInteger := REntorno.Canal;
  ProDMPedidosOrdSelec.QStock.Params.ByName['almacen'].AsString := EAlmacen.Text;
  ProDMPedidosOrdSelec.QStock.Params.ByName['articulo'].AsString := EArticulo.Text;
  ProDMPedidosOrdSelec.QStock.Open;

  EUnidadesPed.Text := ProDMPedidosOrdSelec.QMarcadosPedidosUNIDADES.AsString;
  EProd.Text := ProDMPedidosOrdSelec.QMarcadosPedidosPRO_UNIDADES.AsString;
  EStock.Text := ProDMPedidosOrdSelec.QStock.Fields[0].AsString;

  DFechaGorden.Date := Date;
  // Unidades totales-unidades producidas
  EUnidades.Text := IntToStr(ProDMPedidosOrdSelec.QMarcadosPedidosUNIDADES.AsInteger -
     (ProDMPedidosOrdSelec.QMarcadosPedidosPRO_UNIDADES.AsInteger +
     ProDMPedidosOrdSelec.QMarcadosPedidosUDS_PRODUCIDAS.AsInteger));
end;

procedure TProFMPedidosOrdSelec.Inicializa(aIdCab: integer);
begin
  IdCab := aIdCab;
end;

end.
