unit UFMPlanMaestroProduccion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, ULFDBEditFind2000, StdCtrls, ULFEdit,
  TFlatCheckBoxUnit, ULFCheckBox, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  ULFFIBDBEditFind, UFormGest, rxToolEdit, RXDBCtrl, ULFDBDateEdit, ULFDBMemo, UEntorno,
  UFPEdit, HYFIBQuery, DB, ULFDBCheckBox;

type
  TFMPlanMaestroProduccion = class(TFPEdit)
     LPlanificacion: TLFLabel;
     LTipo: TLFLabel;
     LFechaCreacion: TLFLabel;
     LFechaLanzamiento: TLFLabel;
     LResponsable: TLFLabel;
     LEstado: TLFLabel;
     EFPlanificacion: TLFDbedit;
     ETituloEstado: TLFEdit;
     EFTipo: TLFDBEditFind2000;
     ETituloTipo: TLFEdit;
     ETituloResponsable: TLFEdit;
     EFResponsable: TLFDBEditFind2000;
     DBEEstado: TLFDbedit;
     DBFechaCreacion: TLFDBDateEdit;
     DBFechaLanzamiento: TLFDBDateEdit;
     TBAtras: TToolButton;
     TBSep2: TToolButton;
     TBAdelante: TToolButton;
     LAlmacen: TLFLabel;
     DBEAlmacen: TLFDBEditFind2000;
     ETituloAlmacen: TLFEdit;
     TSNotas: TTabSheet;
     PCabNotas: TLFPanel;
     PEdNotas: TLFPanel;
     DBREComentario: TDBRichEdit;
     DBENotasPlanificacion: TLFDbedit;
     DBENotasTipo: TLFDbedit;
     LNotasTipo: TLFLabel;
     DBENotasEstado: TLFDbedit;
     NavNotas: THYMNavigator;
     LNotasEstado: TLFLabel;
     CENotasPMEdit: TPopUpTeclas;
     CENotasMifirst: TMenuItem;
     CENotasMiprior: TMenuItem;
     CENotasMinext: TMenuItem;
     CENotasMilast: TMenuItem;
     CENotasMiinsert: TMenuItem;
     CENotasMidelete: TMenuItem;
     CENotasMiedit: TMenuItem;
     CENotasMipost: TMenuItem;
     CENotasMicancel: TMenuItem;
     CENotasMirefresh: TMenuItem;
     CENotas: TControlEdit;
     ETipoTitulo: TLFEdit;
     TBPLanificar: TToolButton;
     TBSep1: TToolButton;
     LNotasAlmacen: TLFLabel;
     DBENotasAlmacen: TLFDbedit;
     DBCBAgrupaCompuestos: TLFDBCheckBox;
     DBCBCalculaStock: TLFDBCheckBox;
     ALPlanProduccion: TLFActionList;
     AEstadoSiguiente: TAction;
     AEstadoAnterior: TAction;
     ACalculaPlanificacion: TAction;
     LNotasPlanificacion: TLFLabel;
     AActualizaStocks: TAction;
     LFCategoryAction2: TLFCategoryAction;
     ACreaOP: TAction;
     PCDetalle: TLFPageControl;
     TSOPPend: TTabSheet;
     TSOPLanzadas: TTabSheet;
     TBOrdProdPendientes: TLFToolBar;
     NavDetalle: THYMNavigator;
     TBSep4: TToolButton;
     DBGFDetalle: TDBGridFind2000;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     DBGOPLanzadas: TDBGridFind2000;
     TSNecesidades: TTabSheet;
     DBGNecesidades: TDBGridFind2000;
     ANecesidades: TAction;
     TBMateriales: TLFToolBar;
     NavMateriales: THYMNavigator;
     AGenerarSuborden: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AListadosPMP: TAction;
     AComprarMat: TAction;
     ACerrarPMP: TAction;
     ALanzarOP: TAction;
     TBOPLanzadas: TLFToolBar;
     NavOPCreadas: THYMNavigator;
     LAlmacenNecesidades: TLFLabel;
     ETituloAlmacenNec: TLFEdit;
     DBEAlmacenNec: TLFDBEditFind2000;
     AReservarOP: TAction;
     ACerrarOP: TAction;
     ADeslanzarOP: TAction;
     ADesreservarOP: TAction;
     procedure EFTipoChange(Sender: TObject);
     procedure EFResponsableChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure DBEEstadoChange(Sender: TObject);
     procedure DBEAlmacenChange(Sender: TObject);
     procedure NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure AEstadoSiguienteExecute(Sender: TObject);
     procedure AEstadoAnteriorExecute(Sender: TObject);
     procedure ACalculaPlanificacionExecute(Sender: TObject);
     procedure AActualizaStocksExecute(Sender: TObject);
     procedure ACreaOPExecute(Sender: TObject);
     procedure DBGOPLanzadasDblClick(Sender: TObject);
     procedure ANecesidadesExecute(Sender: TObject);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure AGenerarSubordenExecute(Sender: TObject);
     procedure AListadosPMPExecute(Sender: TObject);
     procedure AComprarMatExecute(Sender: TObject);
     procedure DBGNecesidadesDblClick(Sender: TObject);
     procedure DBGNecesidadesCellClick(Column: TColumn);
     procedure ACerrarPMPExecute(Sender: TObject);
     procedure ALanzarOPExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure DBEAlmacenNecChange(Sender: TObject);
     procedure EFPlanificacionChange(Sender: TObject);
     procedure AReservarOPExecute(Sender: TObject);
     procedure ACerrarOPExecute(Sender: TObject);
     procedure ADeslanzarOPExecute(Sender: TObject);
     procedure ADesreservarOPExecute(Sender: TObject);
     procedure DBGOPLanzadasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     { Private declarations }
     ColActual: TColumn;
  public
     { Public declarations }
  end;

var
  FMPlanMaestroProduccion : TFMPlanMaestroProduccion;

implementation

uses UDMPlanMaestroProduccion, UDMMain, UFMain, UUtiles, UProFMListadosPMP, UDameDato;

{$R *.dfm}

procedure TFMPlanMaestroProduccion.FormCreate(Sender: TObject);
var
  col : integer;
begin
  inherited;
  AbreData(TDMPlanMaestroProduccion, DMPlanMaestroProduccion);

  NavMain.DataSource := DMPlanMaestroProduccion.DSQMCabecera;
  DBGMain.DataSource := DMPlanMaestroProduccion.DSQMCabecera;
  NavDetalle.DataSource := DMPlanMaestroProduccion.DSQMDetalle;
  DBGFDetalle.DataSource := DMPlanMaestroProduccion.DSQMDetalle;
  NavNotas.DataSource := DMPlanMaestroProduccion.DSQMCabecera;
  G2KTableLoc.DataSource := DMPlanMaestroProduccion.DSQMCabecera;

  col := EncuentraField(DBGOPLanzadas, 'ID_ORDEN');
  if (col >= 0) then
     DBGOPLanzadas.Columns[col].Color := REntorno.ColorEnlaceActivo;

  col := EncuentraField(DBGFDetalle, 'RIG_PEDIDO');
  if (col >= 0) then
     DBGFDetalle.Columns[col].Color := REntorno.ColorEnlaceActivo;

  col := EncuentraField(DBGNecesidades, 'ID_E_PEDIDO');
  if (col >= 0) then
     DBGNecesidades.Columns[col].Color := REntorno.ColorEnlaceActivo;

  col := EncuentraField(DBGNecesidades, 'COMPONENTE');
  if (col >= 0) then
     DBGNecesidades.Columns[col].Color := REntorno.ColorEnlaceActivo;

  col := EncuentraField(DBGFDetalle, 'COMPUESTO');
  if (col >= 0) then
     DBGFDetalle.Columns[col].Color := REntorno.ColorEnlaceActivo;

  col := EncuentraField(DBGFDetalle, 'ID_ESCANDALLO');
  if (col >= 0) then
     DBGFDetalle.Columns[col].Color := REntorno.ColorEnlaceActivo;

  if ((DMPlanMaestroProduccion.QMCabeceraESTADO.AsInteger = 3) or (DMPlanMaestroProduccion.QMCabeceraESTADO.AsInteger = 4)) then
  begin
     PCDetalle.ActivePage := TSOPLanzadas;
     TSOPPend.TabVisible := False;
  end
  else
  begin
     TSOPPend.TabVisible := True;
     PCDetalle.ActivePage := TSOPPend;
  end;

  col := EncuentraField(DBGFDetalle, 'COMPUESTO');
  if (col >= 0) then
     DBGFDetalle.ColumnaInicial := col;
end;

procedure TFMPlanMaestroProduccion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPlanMaestroProduccion);
end;

procedure TFMPlanMaestroProduccion.EFTipoChange(Sender: TObject);
begin
  inherited;
  ETituloTipo.Text := DMPlanMaestroProduccion.DameTituloTipoPlanificacion(StrToIntDef(EFTipo.Text, 0));
  ETipoTitulo.Text := ETituloTipo.Text;
  if (EFTipo.Text = '0') then
     ACalculaPlanificacion.Enabled := False
  else if ((EFTipo.Text <> '0') and (DBEEstado.Text < '3')) then
     ACalculaPlanificacion.Enabled := True;
end;

procedure TFMPlanMaestroProduccion.EFResponsableChange(Sender: TObject);
begin
  inherited;
  ETituloResponsable.Text := DameTituloEmpleado(StrToIntDef(EFResponsable.Text, 0));
end;

procedure TFMPlanMaestroProduccion.DBEEstadoChange(Sender: TObject);
var
  Estado : integer;
begin
  inherited;
  if (DBEEstado.Text <> '') then
  begin
     Estado := StrToIntDef(DBEEstado.Text, 0);
     ETituloEstado.Text := DMPlanMaestroProduccion.DameTituloEstado(Estado);

     ALanzarOP.Enabled := (Estado < 3);
     ADesLanzarOP.Enabled := (Estado >= 1);

     ACreaOP.Enabled := (Estado <> 3);
     ACalculaPlanificacion.Enabled := (Estado <> 3);
     AReservarOP.Enabled := (Estado <= 3);
     ADesReservarOP.Enabled := (Estado <= 3);
  end;

  if ((DMPlanMaestroProduccion.QMCabeceraESTADO.AsInteger = 3) or (DMPlanMaestroProduccion.QMCabeceraESTADO.AsInteger = 4)) then
  begin
     PCDetalle.ActivePage := TSOPLanzadas;
     TSOPPend.TabVisible := False;
  end
  else
  begin
     TSOPPend.TabVisible := True;
     PCDetalle.ActivePage := TSOPPend;
  end;
end;

procedure TFMPlanMaestroProduccion.DBEAlmacenChange(Sender: TObject);
begin
  inherited;
  ETituloAlmacen.Text := DameTituloAlmacen(DBEAlmacen.Text);

  with DMPlanMaestroProduccion do
  begin
     if ((QMCabecera.State = dsEdit) and
        (QMCabeceraESTADO.AsInteger = 1){ or
        (QMCabecera.State = dsInsert)}) then

        if ConfirmaMensaje(_('Se recalculará la planificación. desea continuar?')) then
        begin
           QMCabecera.Post;
           EjecutaPlanificacion;
        end;
  end;
end;

procedure TFMPlanMaestroProduccion.NavNotasBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if (Button = nbCancel) then
     NavNotas.SetFocus;
  if (Button = nbEdit) then
     NavNotas.SetFocus;
  if (Button = nbPost) then
     NavNotas.SetFocus;
end;

procedure TFMPlanMaestroProduccion.DBGFDetalleBusqueda(Sender: TObject);
begin
  inherited;

  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'VER_PRO_COMPUESTOS_ESC_EF') then
        {if  (Fields[SelectedIndex]= DataSource.DataSet.FieldByName('COMPUESTO'))then}
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr + 'AND ESTADO = 1';
     if (Trim(TablaABuscar) = 'PRO_VER_ESCANDALLO') then
        {if  (Fields[SelectedIndex] = DataSource.DataSet.FieldByName('ID_ESCANDALLO'))then}
        CondicionBusqueda := 'EMPRESA=' + REntorno.EmpresaStr + ' AND COMPUESTO like ' + chr(39) + DMPlanMaestroProduccion.QMDetalleCOD_MODELO.AsString + '%' + chr(39);
  end;
end;

procedure TFMPlanMaestroProduccion.AEstadoSiguienteExecute(Sender: TObject);
begin
  inherited;
  DMPlanMaestroProduccion.CambiaEstado(1);
end;

procedure TFMPlanMaestroProduccion.AEstadoAnteriorExecute(Sender: TObject);
begin
  inherited;
  DMPlanMaestroProduccion.CambiaEstado(-1);
end;

procedure TFMPlanMaestroProduccion.ACalculaPlanificacionExecute(Sender: TObject);
begin
  inherited;
  DMPlanMaestroProduccion.EjecutaPlanificacion;
end;

procedure TFMPlanMaestroProduccion.AActualizaStocksExecute(Sender: TObject);
begin
  inherited;
  DMPlanMaestroProduccion.ActualizaStockArticulo;
end;

procedure TFMPlanMaestroProduccion.ACreaOPExecute(Sender: TObject);
begin
  inherited;
  DMPlanMaestroProduccion.ProcesoGenerarOP;

  if (DMPlanMaestroProduccion.QMCabeceraESTADO.AsInteger = 3) then
     PCDetalle.ActivePage := TSOPLanzadas;
end;

procedure TFMPlanMaestroProduccion.ALanzarOPExecute(Sender: TObject);
begin
  inherited;
  DMPlanMaestroProduccion.LanzarOP(DMPlanMaestroProduccion.QMCabeceraID_PLANIFICACION.AsInteger);
end;

procedure TFMPlanMaestroProduccion.AReservarOPExecute(Sender: TObject);
begin
  inherited;
  if ConfirmaMensaje(_('Desea reservar las OP Lanzadas?')) then
     DMPlanMaestroProduccion.ReservarOP;
end;

procedure TFMPlanMaestroProduccion.ACerrarOPExecute(Sender: TObject);
begin
  inherited;
  if ConfirmaMensaje(_('Desea cerrar las OP?')) then
     DMPlanMaestroProduccion.CerrarOP;
end;

procedure TFMPlanMaestroProduccion.DBGOPLanzadasDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(DBGOPLanzadas.ColumnaActual) = 'ID_ORDEN') then
     FMain.EjecutaAccion(FMain.AProOrden, DMPlanMaestroProduccion.QMOPLanzadasID_ORDEN.AsString);
end;

procedure TFMPlanMaestroProduccion.ANecesidadesExecute(Sender: TObject);
begin
  inherited;
  // sfg.albert - Si hi ha l'ordre creada, no puc generar necessitats
  {
  if (DMPlanMaestroProduccion.QMCabeceraESTADO.AsInteger = 3) then
     if (DMPlanMaestroProduccion.QMNecesidades.RecordCount = 0) then // Si no hi ha necessitats generades per aquest PMP
        DMPlanMaestroProduccion.GenerarNecesidades
     else
        ShowMessage(_('Ya se han generado las necesidades para esta PMP'))

  else
     ShowMessage(_('OP no generada. No es posible generar necesidades'));
}
end;

procedure TFMPlanMaestroProduccion.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(DBGFDetalle.ColumnaActual) = 'RIG_PEDIDO') then
  begin
     FMain.TraspasoDeDocumentosSalida(DMPlanMaestroProduccion.QMDetalleID_PEDIDO.AsInteger);
  end;

  if (UpperCase(DBGFDetalle.ColumnaActual) = 'COMPUESTO') then
  begin
     FMain.EjecutaAccion(FMain.AArticulos, 'Articulo = ''' +
        DMPlanMaestroProduccion.QMDetalleCOMPUESTO.AsString + '''' +
        ' and ejercicio=' + DMPlanMaestroProduccion.QMCabeceraEJERCICIO.AsString);
  end;

  if (UpperCase(DBGFDetalle.ColumnaActual) = 'ID_ESCANDALLO') then
  begin
     FMain.EjecutaAccion(FMain.AProEscandalloSF, 'empresa=' + DMPlanMaestroProduccion.QMDetalleEMPRESA.AsString + ' and escandallo = ' +
        DMPlanMaestroProduccion.QMDetalleID_ESCANDALLO.AsString);
  end;
end;

procedure TFMPlanMaestroProduccion.AGenerarSubordenExecute(Sender: TObject);
begin
  inherited;
  DMPlanMaestroProduccion.GenerarSubordenes;
end;

procedure TFMPlanMaestroProduccion.AListadosPMPExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMListadosPMP, ProFMListadosPMP, Sender);
end;

procedure TFMPlanMaestroProduccion.AComprarMatExecute(Sender: TObject);
begin
  inherited;
  DMPlanMaestroProduccion.GenerarPedidoCompra;
end;

procedure TFMPlanMaestroProduccion.DBGNecesidadesDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'ID_E_PEDIDO') then
  begin
     FMain.TraspasoDeDocumentosSalida(DMPlanMaestroProduccion.QMDetalleID_PEDIDO.AsInteger);
  end;
  if (UpperCase(ColActual.FieldName) = 'COMPONENTE') then
     FMain.EjecutaAccion(FMain.AArticulos, 'Articulo = ''' +
        DMPlanMaestroProduccion.QMNecesidadesCOMPONENTE.AsString + '''' +
        ' and ejercicio=' + REntorno.EjercicioStr);
end;

procedure TFMPlanMaestroProduccion.DBGNecesidadesCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;

  if (UpperCase(DBGNecesidades.ColumnaActual) = 'COMPRAR') then
  begin
     if ((DMPlanMaestroProduccion.QMNecesidadesCANTIDAD_DIF.AsFloat <= 0) or
        (DMPlanMaestroProduccion.QMNecesidadesID_E_PEDIDO.AsInteger > 0)) then
     begin
        if (DMPlanMaestroProduccion.QMNecesidadesCANTIDAD_DIF.AsFloat <= 0) then
           ShowMessage(_('No se ha generará pedido de compra. Hay suficientes unidades en stock.'));

        if (DMPlanMaestroProduccion.QMNecesidadesID_E_PEDIDO.AsInteger > 0) then
           ShowMessage(_('Pedido de compra ya realizado. Imposible generar.'));

        with DMPlanMaestroProduccion.QMNecesidades do
        begin
           Edit;
           DMPlanMaestroProduccion.QMNecesidadesCOMPRAR.AsInteger := 0;
           Post;
           Refresh;
        end;
     end;
  end;
end;

procedure TFMPlanMaestroProduccion.ACerrarPMPExecute(Sender: TObject);
begin
  inherited;
  DMPlanMaestroProduccion.CierrePMP;
end;

procedure TFMPlanMaestroProduccion.DBGFDetalleCellClick(Column: TColumn);
begin
  inherited;
  if (UpperCase(DBGFDetalle.ColumnaActual) = 'FABRICAR') then
  begin
     if (DMPlanMaestroProduccion.QMDetalleCANTIDAD_FABRICAR.AsFloat <= 0) then
     begin
        ShowMessage(_('No se ha generará la OP para este compuesto. Hay suficientes unidades en stock.'));

        with DMPlanMaestroProduccion do
        begin
           QMDetalle.Edit;
           QMDetalleFABRICAR.AsInteger := 0;
           QMDetalle.Post;
        end;
     end;
  end;
end;

procedure TFMPlanMaestroProduccion.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMPlanMaestroProduccion.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMPlanMaestroProduccion.BusquedaCompleja;
end;

procedure TFMPlanMaestroProduccion.DBEAlmacenNecChange(Sender: TObject);
begin
  inherited;
  ETituloAlmacenNec.Text := DameTituloAlmacen(DBEAlmacenNec.Text);
end;

procedure TFMPlanMaestroProduccion.EFPlanificacionChange(Sender: TObject);
begin
  inherited;
  DBEEstadoChange(Sender);
end;

procedure TFMPlanMaestroProduccion.ADeslanzarOPExecute(Sender: TObject);
begin
  inherited;
  if ConfirmaMensaje(_('Desea Deslanzar las OP Marcadas?')) then
     DMPlanMaestroProduccion.DesLanzarOP(DMPlanMaestroProduccion.QMCabeceraID_PLANIFICACION.AsInteger);
end;

procedure TFMPlanMaestroProduccion.ADesreservarOPExecute(Sender: TObject);
begin
  inherited;
  if ConfirmaMensaje(_('Desea eliminar las reservar las OP?')) then
     DMPlanMaestroProduccion.DesReservarOP;
end;

procedure TFMPlanMaestroProduccion.DBGOPLanzadasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then
     begin
        ColorFocused(Canvas);
     end
     else
     begin
        case DMPlanMaestroProduccion.QMOPLanzadasSITUACION.AsInteger of
           0: ColorResaltado(Canvas);
           1: ColorResaltado2(Canvas);
           2: ColorResaltado6(Canvas);
           3: ColorResaltado3(Canvas);
           4: ColorBloqueado(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

end.
