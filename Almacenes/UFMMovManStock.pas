unit UFMMovManStock;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UDBDateTimePicker, StdCtrls, Mask, DBCtrls,
  ActnList, rxPlacemnt, NsDBGrid, rxToolEdit, RXDBCtrl, ULFDBEdit,
  ULFDBEditFind2000, ULFFormStorage, ULFActionList, ULFPageControl,
  ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc, DB, idGlobalProtocols, ULFDBDateEdit,
  ULFEdit, UFPEditDetalle, ULFComboBox, Buttons, TFlatCheckBoxUnit,
  ULFCheckBox;

type
  TFMMovManStock = class(TFPEditDetalle)
     DBRGTipoMov: TDBRadioGroup;
     LBLSerie: TLFLabel;
     LBLNumero: TLFLabel;
     LBLFecha: TLFLabel;
     DBEFSerie: TLFDBEditFind2000;
     DBERig: TLFDbedit;
     DBDTPFecha: TLFDBDateEdit;
     LBLAlmacenOrig: TLFLabel;
     LBLAlmacenDst: TLFLabel;
     DBEFAlmacenOrig: TLFDBEditFind2000;
     DBEFAlmacenDst: TLFDBEditFind2000;
     LBLCanalOrig: TLFLabel;
     LBLCanalDst: TLFLabel;
     DBEFCanalOrig: TLFDBEditFind2000;
     DBEFCanalDst: TLFDBEditFind2000;
     LBLComentario: TLFLabel;
     DBEComentario: TLFDbedit;
     DBEAlmacenOrig: TLFDbedit;
     DBEAlmacenDst: TLFDbedit;
     ECanalOrig: TLFEdit;
     ECanalDst: TLFEdit;
     ALMovMan: TLFActionList;
     AStocks: TAction;
     AUnidadesExt: TAction;
     ToolButton2: TToolButton;
     TButtStocks: TToolButton;
     TButtUnidades_Ext: TToolButton;
     AVisualizarListadodeMovimientos: TAction;
     AImprimirListadodeMovimientos: TAction;
     AListadodeMovimientosFiltrado: TAction;
     AConfListados: TAction;
     LFCategoryAction1: TLFCategoryAction;
     TButtInfoLotes: TToolButton;
     AInfoLotes: TAction;
     ASep: TAction;
     TButSerializacion: TToolButton;
     ASerializacion: TAction;
     TButHistNserie: TToolButton;
     AHistoricoSerializacion: TAction;
     LEstado: TLFLabel;
     DBEstado: TLFDbedit;
     TButtAbreCierra: TToolButton;
     AAbrirCerrar: TAction;
     TButtUbicaciones: TToolButton;
     AVerUbicaciones: TAction;
     LFCategoryAction2: TLFCategoryAction;
     ACodBarras: TAction;
     TButtDescargaLector: TToolButton;
     ToolButton3: TToolButton;
     LFCategoryAction3: TLFCategoryAction;
     ADescargaLectorCreaMov: TAction;
     ADescargaLectorVerificaMov: TAction;
     PopupUbicaciones: TPopupMenu;
     MIEntradas1: TMenuItem;
     MISalidas1: TMenuItem;
     TButtImportarDetalle: TToolButton;
     LFLOrigen: TLFLabel;
     LFDsbOrigen: TLFDbedit;
     AImportarDetalle: TAction;
     DBESumaUnidades: TLFDbedit;
     LUnidades: TLFLabel;
     PNLTotales: TLFPanel;
     DBESumaPrecio: TLFDbedit;
     LTotal: TLFLabel;
     DBEAsiento: TLFDbedit;
     LAsiento: TLFLabel;
     AListarEtiquetas: TAction;
     BAsignaKit: TToolButton;
     AAsignaKit: TAction;
     PNLFiltroSerie: TLFPanel;
     CBSeries: TLFComboBox;
     LSerie: TLFLabel;
     SBVerAsiento: TSpeedButton;
     AAsientoMovimiento: TAction;
     TBInsercionMasivaModelo: TToolButton;
     AInsercionMasivaModelo: TAction;
     DBDTPHora: TDBDateTimePicker;
     PNLMostratSotck: TLFPanel;
     LMostraStock: TLFLabel;
     CBMostrarStockOri: TLFCheckBox;
     CBMostrarStockDst: TLFCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure DBRGTipoMovChange(Sender: TObject);
     procedure DBEFSerieBusqueda(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure AStocksExecute(Sender: TObject);
     procedure AUnidadesExtExecute(Sender: TObject);
     procedure NavDetalleBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure AVisualizarListadodeMovimientosExecute(Sender: TObject);
     procedure AImprimirListadodeMovimientosExecute(Sender: TObject);
     procedure AListadodeMovimientosFiltradoExecute(Sender: TObject);
     procedure AConfListadosExecute(Sender: TObject);
     procedure AInfoLotesExecute(Sender: TObject);
     procedure ASerializacionExecute(Sender: TObject);
     procedure AHistoricoSerializacionExecute(Sender: TObject);
     procedure AAbrirCerrarExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBGFDetalleExiste(Sender: TObject);
     procedure DBGFDetalleCampoDevuelve(Sender: TObject; valor: string);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure AVerUbicacionesExecute(Sender: TObject);
     procedure ACodBarrasExecute(Sender: TObject);
     procedure ADescargaLectorCreaMovExecute(Sender: TObject);
     procedure ADescargaLectorVerificaMovExecute(Sender: TObject);
     procedure DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGFDetalleBeforeColExit(Sender: TObject; var Continuar: boolean);
     procedure AImportarDetalleExecute(Sender: TObject);
     procedure AListarEtiquetasExecute(Sender: TObject);
     procedure DBEFCanalOrigChange(Sender: TObject);
     procedure DBEFCanalDstChange(Sender: TObject);
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
     procedure AAsignaKitExecute(Sender: TObject);
     procedure DBEstadoChange(Sender: TObject);
     procedure CBSeriesChange(Sender: TObject);
     procedure AAsientoMovimientoExecute(Sender: TObject);
     procedure SBVerAsientoClick(Sender: TObject);
     procedure DBEFSerieChange(Sender: TObject);
     procedure AInsercionMasivaModeloExecute(Sender: TObject);
     procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFDetalleKeyPress(Sender: TObject; var Key: char);
     procedure DBGFDetalleRowChange(Sender: TObject);
     procedure CBMostrarStockChange(Sender: TObject);
  private
     { Private declarations }
     Param_MOVSTCK002: string;
     Param_MOVSTCK003: string;
     Param_MOVSTCK004: string;
     Param_MOVSTCK008: boolean;
     Param_MOVSTCK009: boolean;
     Param_MOVSTCK012: boolean;
     Param_ARTBUSQ004: boolean;
     Serie: string;
     DBGDetalleArticulo: string;
     procedure ActivaControles(Color: TColor; Activo: boolean);
     procedure Origen(Color: TColor; Activo: boolean);
     procedure Destino(Color: TColor; Activo: boolean);
     procedure AbreOCierra;
     procedure HabilitaEnlaces;
     procedure EstableceVisibilidadStockAlmacen;
  public
     { Public declarations }
     procedure FiltraMovimiento(Empresa, Ejercicio, Rig: integer; aSerie: string);
  end;

var
  FMMovManStock : TFMMovManStock;

implementation

uses UDMMovManStock, UFormGest, UDMMain, UEntorno, UDameDato, UFMDocInfoStocks,
  UDMLSTMovManStock, UFMListConfig, UFPregMovManStock, UFMArtSerializacion,
  UFMHistoricoSerializacion, UUtiles, UFMain, UFMInsercionArticuloDesdeTexto,
  UFMIntroduceSeries, UFMImprimirCodBarras, UFMSelecAlmacenCantidad, UFMSeleccionKit,
  Math, UParam, UFMSeleccion, DateUtils, UFMSeleccionArticulo, URellenaLista;

{$R *.DFM}

procedure TFMMovManStock.FormCreate(Sender: TObject);
var
  v : boolean;
  i : integer;
  Serie : string;
begin
  inherited;
  AbreData(TDMMovManStock, DMMovManStock);
  NavMain.DataSource := DMMovManStock.DSQMCabecera;
  DBGMain.DataSource := DMMovManStock.DSQMCabecera;
  NavDetalle.DataSource := DMMovManStock.DSQMDetalle;
  DBGFDetalle.DataSource := DMMovManStock.DSQMDetalle;

  {dji lrk kri ------------------------------------------------------------------}
  v := (DMMain.EstadoKri(201) = 1);
  with DBGFDetalle do
  begin
     for i := 0 to Columns.Count - 1 do
        if ((Columns[i].FieldName = 'PRECIO_VENTA') or
           (Columns[i].FieldName = 'ORDEN_PRODUCCION')) then
           Columns[i].Visible := v;
  end;

  {dji lrk kri ------------------------------------------------------------------}
  if (REntorno.Delegacion = 'S') then {dji lrk kri}
  begin
     DBRGTipoMov.Enabled := False;
     DBRGTipoMov.ReadOnly := True;
     NavMain.InsertaControl := DBEFSerie;
  end
  else
  begin
     DBRGTipoMov.Enabled := True;
     DBRGTipoMov.ReadOnly := False;
     NavMain.InsertaControl := DBRGTipoMov;
  end;

  DBEAsiento.Color := REntorno.ColorEnlaceActivo;
  if DMMain.UtilizarInventarioPermanente then
  begin
     LAsiento.Visible := True;
     DBEAsiento.Visible := True;
     SBVerAsiento.Visible := True;
  end
  else
  begin
     LAsiento.Visible := False;
     DBEAsiento.Visible := False;
     SBVerAsiento.Visible := False;
  end;

  // Campo para realizar busqueda de articulo en documentos de compra/venta. Por ejemplo ARTICULO, ALFA_1, etc.
  if ((LeeParametro('ARTBUSQ001') <> 'ARTICULO') and (LeeParametro('ARTBUSQ001') <> '')) then
  begin
     for i := 0 to DBGFDetalle.Tablas.Count - 1 do
     begin
        if (Trim(UpperCase(DBGFDetalle.Tablas[i])) = 'VER_ARTICULOS_EF') and
           (DBGFDetalle.CamposDesplegar[i] = '1') then
        begin
           DBGFDetalle.Numericos[i] := LeeParametro('ARTBUSQ001');
           DBGFDetalle.CamposADevolver[i] := 'ARTICULO';
           DBGFDetalle.OrdenadosPor[i] := LeeParametro('ARTBUSQ001');
        end;
     end;
  end;

  CBMostrarStockChange(Sender);

  HabilitaEnlaces;
  RellenaSeries(CBSeries.Items);

  if REntorno.SerieRestringida <> '' then
     Serie := REntorno.SerieRestringida
  else
     Serie := REntorno.Serie;

  // Me posiciono en la serie
  CBSeries.ItemIndex := 0;
  while ((CBSeries.ItemIndex < CBSeries.Items.Count - 1) and
        (Copy(CBSeries.Items[CBSeries.ItemIndex], 1, Length(Serie + ' ')) <> Serie + ' ')) do
     CBSeries.ItemIndex := CBSeries.ItemIndex + 1;
  CBSeriesChange(Sender);

  if REntorno.SerieRestringida <> '' then
  begin
     CBSeries.Enabled := False;
     CBSeries.Color := clInfoBk;
     DBEFSerie.Enabled := False;
     DBEFSerie.ReadOnly := True;
     DBEFSerie.Color := clInfoBk;
  end;
end;

procedure TFMMovManStock.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMMovManStock);
end;

procedure TFMMovManStock.FormShow(Sender: TObject);
var
  i : integer;
begin
  inherited;
  AbreOCierra;
  EstableceVisibilidadStockAlmacen;
  DBEstadoChange(DBEstado);

  // Asigno nombre a campos ALFA
  for i := 1 to 8 do
  begin
     if (EncuentraField(DBGFDetalle, Format('ALFA_%d', [i])) >= 0) then
        DBGFDetalle.FindColumn(Format('ALFA_%d', [i])).Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));
  end;
end;

procedure TFMMovManStock.DBGFDetalleBusqueda(Sender: TObject);
begin
  with TDBGridFind2000(Sender) do
  begin
     if (TablaABuscar = 'VER_ARTICULOS_EF') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' + REntorno.EjercicioStr +
           ' AND CANAL=' + REntorno.CanalStr + ' AND ' + 'FAMILIA<>''' +
           REntorno.FamSistema + '''';
     end
     else
     if (TablaABuscar = 'VER_ARTICULOS_CON_BARRAS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' + REntorno.EjercicioStr +
           ' AND CANAL=' + REntorno.CanalStr + ' AND BAJA=0';
     end
     else
     begin
        if (TablaABuscar = 'ART_ALMACENES_UBICACIONES') then
        begin
           if ((DMMovManStock.QMCabeceraTIPO_OPERACION.AsString = 'E') or ((DMMovManStock.QMCabeceraTIPO_OPERACION.AsString = 'T') and (ColumnaActual = 'ID_UBICACION_E'))) then
           begin
              CondicionBusqueda :=
                 'EMPRESA=' + REntorno.EmpresaStr + ' AND ALMACEN=''' + DMMovManStock.QMCabeceraALMACEN_DST.AsString + '''';
           end
           else
           begin
              if ((DMMovManStock.QMCabeceraTIPO_OPERACION.AsString = 'S') or ((DMMovManStock.QMCabeceraTIPO_OPERACION.AsString = 'T') and (ColumnaActual = 'ID_UBICACION_S'))) then
                 CondicionBusqueda :=
                    'EMPRESA=' + REntorno.EmpresaStr + ' AND ALMACEN=''' + DMMovManStock.QMCabeceraALMACEN_ORI.AsString + '''';
           end;
        end
        else
           CondicionBusqueda := 'EMPRESA =' + REntorno.EmpresaStr;
     end;
  end;
end;

procedure TFMMovManStock.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMMovManStock.TSTablaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMMovManStock.NavMainClick(Sender: TObject; Button: TNavigateBtn);
var
  TipoOperacion, Parametro_MOVSTCK001 : string;
  i : integer;
begin
  // Habiltamos o deshabilitamos los controles correspondientes
  if (Button = nbEdit) then
  begin
     ActivaControles(clInfoBk, False);
     Origen(clInfoBk, False);
     Destino(clInfoBk, False);
  end;

  if (Button = nbPost) or (Button = nbCancel) then
  begin
     ActivaControles(clWindow, True);

     if (DBRGTipoMov.Value = 'E') then
     begin
        Origen(clInfoBk, False);
        Destino(clWindow, True and (not Param_MOVSTCK009));
     end;

     if (DBRGTipoMov.Value = 'S') then
     begin
        Origen(clWindow, True and (not Param_MOVSTCK008));
        Destino(clInfoBk, False);
     end;
  end;

  if (Button = nbInsert) or (Button = nbEdit) then
  begin
     // Leo el parametro para la serie que se está insertando.
     // Puede ser una serie distina a la del filtro de cabecera
     Parametro_MOVSTCK001 := LeeParametro('MOVSTCK001', DBEFSerie.Text);
     if (Length(Parametro_MOVSTCK001) = 0) then
        Parametro_MOVSTCK001 := 'EST';

     with DBRGTipoMov do
     begin
        Items.Clear;
        Values.Clear;
        for i := 1 to Length(Parametro_MOVSTCK001) do
        begin
           if (Parametro_MOVSTCK001[i] = 'E') then
           begin
              Values.Add(Parametro_MOVSTCK001[i]);
              Items.Add(_('&Entrada'));
           end;
           if (Parametro_MOVSTCK001[i] = 'S') then
           begin
              Values.Add(Parametro_MOVSTCK001[i]);
              Items.Add(_('&Salida'));
           end;
           if (Parametro_MOVSTCK001[i] = 'T') then
           begin
              Values.Add(Parametro_MOVSTCK001[i]);
              Items.Add(_('&Traspaso entre Almacenes'));
           end;
        end;

        // Refresh, Invalidate, Update, Repaint no funcionan para refrescar el componente.
        DataField := '';
        DataField := 'TIPO_OPERACION';
     end;

     TipoOperacion := DMMovManStock.QMCabeceraTIPO_OPERACION.AsString;
     if (Pos(TipoOperacion, Parametro_MOVSTCK001) = 0) then
        DMMovManStock.QMCabeceraTIPO_OPERACION.AsString := Parametro_MOVSTCK001[1];
  end;
end;

procedure TFMMovManStock.ActivaControles(Color: TColor; Activo: boolean);
begin
  // Modificamos la habilitación del control
  DBEFSerie.Enabled := Activo;
  DBRGTipoMov.ReadOnly := not DBEFSerie.Enabled;

  // DBDTPFecha.Enabled := Activo;
  // DBDTPHora.Enabled := Activo;

  if (REntorno.Delegacion = 'S') then
     DBRGTipoMov.Enabled := False
  else
     DBRGTipoMov.Enabled := Activo;
  DBRGTipoMov.ReadOnly := not DBRGTipoMov.Enabled;

  // Ponemos el color de los campos
  DBEFSerie.Color := Color;
  // DBDTPFecha.Color := Color;
  // DBDTPHora.Color := Color;
end;

procedure TFMMovManStock.Origen(Color: TColor; Activo: boolean);
begin
  DBEFCanalOrig.Color := Color;
  DBEFCanalOrig.Enabled := Activo;
  DBEFCanalOrig.ReadOnly := not Activo;
  DBEFCanalOrig.TabStop := Activo;
  DBEFAlmacenOrig.Color := Color;
  DBEFAlmacenOrig.Enabled := Activo;
  DBEFAlmacenOrig.ReadOnly := not Activo;
  DBEFAlmacenOrig.TabStop := Activo;
end;

procedure TFMMovManStock.Destino(Color: TColor; Activo: boolean);
begin
  DBEFCanalDst.Color := Color;
  DBEFCanalDst.Enabled := Activo;
  DBEFCanalDst.ReadOnly := not Activo;
  DBEFCanalDst.TabStop := Activo;
  DBEFAlmacenDst.Color := Color;
  DBEFAlmacenDst.Enabled := Activo;
  DBEFAlmacenDst.ReadOnly := not Activo;
  DBEFAlmacenDst.TabStop := Activo;
end;

procedure TFMMovManStock.DBRGTipoMovChange(Sender: TObject);
var
  Visibilidad : boolean;
  Fecha : TDateTime;

  procedure VisibilidadColumna(DBG: TDBGridFind2000; Campo: string; Visibilidad: boolean);
  var
     c : integer;
  begin
     c := EncuentraField(DBG, Campo);
     if (c >= 0) then
        DBG.Columns[c].Visible := Visibilidad;
  end;

begin
  // Habilitamos o deshabilitamos los controles correspondientes
  if (DBRGTipoMov.Value = 'E') then
  begin
     Origen(clInfoBk, False);
     Destino(clWindow, True and (not Param_MOVSTCK008));
  end;
  if (DBRGTipoMov.Value = 'S') then
  begin
     Origen(clWindow, True and (not Param_MOVSTCK009));
     Destino(clInfoBk, False);
  end;
  if (DBRGTipoMov.Value = 'T') then
  begin
     Origen(clWindow, True and (not Param_MOVSTCK009));
     Destino(clWindow, True and (not Param_MOVSTCK008));
  end;

  with DBGFDetalle do
  begin
     Visibilidad := ((DBRGTipoMov.Value = 'E') or (DBRGTipoMov.Value = 'T'));
     VisibilidadColumna(DBGFDetalle, 'ID_UBICACION_E', Visibilidad);
     VisibilidadColumna(DBGFDetalle, 'CALLE_E', Visibilidad);
     VisibilidadColumna(DBGFDetalle, 'ESTANTERIA_E', Visibilidad);
     VisibilidadColumna(DBGFDetalle, 'REPISA_E', Visibilidad);
     VisibilidadColumna(DBGFDetalle, 'POSICION_E', Visibilidad);
     VisibilidadColumna(DBGFDetalle, 'COMPOSICION_E', Visibilidad);
     VisibilidadColumna(DBGFDetalle, 'TIT_UBICACION_E', Visibilidad);

     Visibilidad := ((DBRGTipoMov.Value = 'S') or (DBRGTipoMov.Value = 'T'));
     VisibilidadColumna(DBGFDetalle, 'ID_UBICACION_S', Visibilidad);
     VisibilidadColumna(DBGFDetalle, 'CALLE_S', Visibilidad);
     VisibilidadColumna(DBGFDetalle, 'ESTANTERIA_S', Visibilidad);
     VisibilidadColumna(DBGFDetalle, 'REPISA_S', Visibilidad);
     VisibilidadColumna(DBGFDetalle, 'POSICION_S', Visibilidad);
     VisibilidadColumna(DBGFDetalle, 'COMPOSICION_S', Visibilidad);
     VisibilidadColumna(DBGFDetalle, 'TIT_UBICACION_S', Visibilidad);
  end;

  if (DMMovManStock.QMCabecera.State in [dsEdit, dsInsert]) then
  begin
     // Hora para movimiento de tipo (2:Entrada; 3:Salida; 4:Traspaso)
     if ((DBRGTipoMov.Value = 'E') and (Param_MOVSTCK002 <> '')) then
        DMMovManStock.QMCabeceraFECHA.AsDateTime := RecodeTime(DMMovManStock.QMCabeceraFECHA.AsDateTime, StrToIntDef(Copy(Param_MOVSTCK002, 1, 2), 0), StrToIntDef(Copy(Param_MOVSTCK002, 4, 2), 0), StrToIntDef(Copy(Param_MOVSTCK002, 7, 2), 0), 0)
     else
     if ((DBRGTipoMov.Value = 'S') and (Param_MOVSTCK003 <> '')) then
        DMMovManStock.QMCabeceraFECHA.AsDateTime := RecodeTime(DMMovManStock.QMCabeceraFECHA.AsDateTime, StrToIntDef(Copy(Param_MOVSTCK003, 1, 2), 0), StrToIntDef(Copy(Param_MOVSTCK003, 4, 2), 0), StrToIntDef(Copy(Param_MOVSTCK003, 7, 2), 0), 0)
     else
     if ((DBRGTipoMov.Value = 'T') and (Param_MOVSTCK004 <> '')) then
        DMMovManStock.QMCabeceraFECHA.AsDateTime := RecodeTime(DMMovManStock.QMCabeceraFECHA.AsDateTime, StrToIntDef(Copy(Param_MOVSTCK004, 1, 2), 0), StrToIntDef(Copy(Param_MOVSTCK004, 4, 2), 0), StrToIntDef(Copy(Param_MOVSTCK004, 7, 2), 0), 0)
     else
     begin
        Fecha := DMMovManStock.QMCabeceraFECHA.AsDateTime;
        ReplaceTime(Fecha, Now);
        DMMovManStock.QMCabeceraFECHA.AsDateTime := Fecha;
     end;
  end;
end;

procedure TFMMovManStock.DBEFSerieBusqueda(Sender: TObject);
begin
  // Filtramos por las series activas
  DBEFSerie.CondicionBusqueda := 'ACTIVO=1';
end;

procedure TFMMovManStock.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  // Llamada al buscador
  DMMovManStock.BusquedaCompleja;
end;

procedure TFMMovManStock.AStocksExecute(Sender: TObject);
var
  Articulo, Almacen : string;
begin
  // Abrimos la información de stock
  DMMovManStock.DatosStocks(Articulo, Almacen);
  AbreStocks(REntorno.Empresa, REntorno.Canal, Articulo, Almacen, Self);
end;

procedure TFMMovManStock.AUnidadesExtExecute(Sender: TObject);
begin
  inherited;
  DMMovManStock.CambiaUnidadesExt(DMMovManStock.QMDetalleARTICULO);
end;

procedure TFMMovManStock.NavDetalleBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if button = nbCancel then
     DMMovManStock.BorraLineaExt;

  if Button in [nbRefresh, nbDelete, nbPost] then
     DMMovManStock.ReiniciaStock(DMMovManStock.QMDetalleARTICULO.AsString);
end;

procedure TFMMovManStock.DBGFDetalleColEnter(Sender: TObject);
begin
  ControlEdit := CEDetalle;

  if (DBGFDetalle.SelectedField.FieldName = 'ARTICULO') then
  begin
     DBGDetalleArticulo := '';
     FMain.AddComponentePunto(DBGFDetalle);
  end
  else
     FMain.DelComponentePunto(DBGFDetalle);

  DMMovManStock.Continua;
end;

procedure TFMMovManStock.FiltraMovimiento(Empresa, Ejercicio, Rig: integer; aSerie: string);
var
  i : integer;
begin
  DMMovManStock.FiltraMovimiento(Empresa, Ejercicio, Rig, aSerie);

  // Posiciono la serie
  i := 0;
  while ((Copy(CBSeries.Items[i], 1, Pos(' ', CBSeries.Items[i]) - 1) <> aSerie) and (CBSeries.Items.Count < i)) do
     Inc(i);

  if (CBSeries.Items.Count < i) then
     CBSeries.ItemIndex := i;

  AbreOCierra;
end;

procedure TFMMovManStock.AVisualizarListadodeMovimientosExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLSTMovManStock, DMLSTMovManStock);
  DMLSTMovManStock.MostrarListado(DMMovManStock.QMCabeceraID_ST.AsInteger, 0, 507);
  CierraData(DMLSTMovManStock);
end;

procedure TFMMovManStock.AImprimirListadodeMovimientosExecute(Sender: TObject);
begin
  inherited;
  AbreData(TDMLSTMovManStock, DMLSTMovManStock);
  DMLSTMovManStock.MostrarListado(DMMovManStock.QMCabeceraID_ST.AsInteger, 1, 507);
  CierraData(DMLSTMovManStock);
end;

procedure TFMMovManStock.AListadodeMovimientosFiltradoExecute(Sender: TObject);
begin
  inherited;
  TFPregMovManStock.Create(Self).ShowModal;
end;

procedure TFMMovManStock.AConfListadosExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLSTMovManStock, DMLSTMovManStock);
  TFMListConfig.Create(Self).Muestra(507, formato, cabecera, copias,
     pijama, '', DMLSTMovManStock.FRMovManStock, DMLSTMovManStock.HYReport);
  CierraData(DMLSTMovManStock);
end;

procedure TFMMovManStock.AInfoLotesExecute(Sender: TObject);
begin
  DMMovManStock.InfoLotes;
end;

procedure TFMMovManStock.ASerializacionExecute(Sender: TObject);
begin
  DMMovManStock.PreparaSerializacion;
  if not DMMovManStock.Serializado then
     ShowMessage(_('El artículo no está serializado'))
  else
  begin
     FMIntroduceSeries := TFMIntroduceSeries.Create(Self);
     FMIntroduceSeries.Inicializar(DMMovManStock.QMDetalleID_DETALLES_ST.AsInteger, 'MV' + DMMovManStock.QMCabeceraTIPO_OPERACION.AsString);
     FMIntroduceSeries.ShowModal;
  end;
end;

procedure TFMMovManStock.AHistoricoSerializacionExecute(Sender: TObject);
begin
  HistoricoSerie(Self);
end;

procedure TFMMovManStock.AAbrirCerrarExecute(Sender: TObject);
begin
  inherited;
  if Confirma then
     try
        Screen.Cursor := crHourGlass;
        if (TButtAbreCierra.Tag = 0) then
        begin
           DMMovManStock.AbreCierra(5);
        end
        else
           DMMovManStock.AbreCierra(0);
     finally
        Screen.Cursor := crDefault;
        AbreOCierra;
     end;
end;

procedure TFMMovManStock.AbreOCierra;
begin
  if DMMovManStock.QMCabeceraESTADO.AsInteger = 5 then
  begin
     TButtAbreCierra.Hint := _('Abre y desbloquea el documento');
     TButtAbreCierra.ImageIndex := 67;
     TButtAbreCierra.Tag := 1;
     AAbrirCerrar.Hint := _('Abre y desbloquea el documento');
     AAbrirCerrar.ImageIndex := 67;
     AAbrirCerrar.Tag := 1;
     AAbrirCerrar.Caption := _('Abrir Documento');
     AAbrirCerrar.Enabled := Param_MOVSTCK012;
     TButtAbreCierra.Enabled := Param_MOVSTCK012;
  end
  else
  begin
     TButtAbreCierra.Hint := _('Cierra y bloquea el documento');
     TButtAbreCierra.ImageIndex := 68;
     TButtAbreCierra.Tag := 0;
     AAbrirCerrar.Hint := _('Cierra y bloquea el documento');
     AAbrirCerrar.ImageIndex := 68;
     AAbrirCerrar.Tag := 0;
     AAbrirCerrar.Caption := _('Cerrar Documento');
     AAbrirCerrar.Enabled := True;
     TButtAbreCierra.Enabled := True;
  end;
end;

procedure TFMMovManStock.DBGFDetalleExiste(Sender: TObject);
begin
  inherited;
  if DBGFDetalle.ColumnaActual = 'ARTICULO' then
     DMMovManStock.VaciaNumSerie;
end;

procedure TFMMovManStock.DBGFDetalleCampoDevuelve(Sender: TObject; valor: string);
begin
  inherited;
  if (DBGFDetalle.SelectedField.DisplayName = 'ARTICULO') then
     DMMovManStock.BusquedaArticulo(valor);
  DMMovManStock.Continua;
end;

procedure TFMMovManStock.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  if DMMovManStock.HayDetalle then
  begin
     if (DBGFDetalle.ColumnaActual = 'ARTICULO') then
        if EstructuraCreada and PDetalle.Enabled then
           FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' +
              DMMovManStock.QMDetalleARTICULO.AsString + '''');
  end;
end;

procedure TFMMovManStock.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if DMMovManStock.HayDetalle then
  begin
     if (UpperCase(Column.FieldName) = 'ARTICULO') then
        CeldaEnlace(TDBGridFind2000(Sender), Rect);

     with TDBGridFind2000(Sender) do
     begin
        // if (DataSource.DataSet.State = dsBrowse) then
        begin
           if (gdFocused in State) then
           begin
              Canvas.Font.Color := clHighlightText;
              Canvas.Brush.Color := clHighlight;
           end
           else
           begin
              if ((UpperCase(Column.FieldName) = 'ID_LOTE') or (UpperCase(Column.FieldName) = 'LOTE')) then
              begin
                 if (DMMovManStock.QMDetalleLOTEABLE.AsInteger = 1) then
                 begin
                    if (Abs(RoundTo(DMMovManStock.QMDetalleUNIDADES.AsFloat - DMMovManStock.QMDetalleCANT_LOTE.AsFloat, -2)) > 0.00) then
                       ColorError(Canvas)
                    else
                       ColorEdicion(Canvas);
                 end
                 else
                    ColorInactivo(Canvas);
              end;

              if (UpperCase(Column.FieldName) = 'ID_UBICACION_E') then
              begin
                 if (DMMovManStock.AlmacenDstUbicable and (DMMovManStock.QMDetalleUBICABLE.AsInteger = 1)) then
                    ColorEdicion(Canvas)
                 else
                    ColorInactivo(Canvas);
              end;
              if (UpperCase(Column.FieldName) = 'ID_UBICACION_S') then
              begin
                 if (DMMovManStock.AlmacenOriUbicable and (DMMovManStock.QMDetalleUBICABLE.AsInteger = 1)) then
                    ColorEdicion(Canvas)
                 else
                    ColorInactivo(Canvas);
              end;
              if (UpperCase(Column.FieldName) = 'STOCK_ALM') then
              begin
                 if (DMMovManStock.QMDetalleSTOCK_ALM.AsFloat > 0) then
                    ColorResaltado2(Canvas)
                 else
                    ColorError(Canvas);
              end
              else
              if (UpperCase(Column.FieldName) = 'STOCK_ALM2') then
              begin
                 if (DMMovManStock.QMDetalleSTOCK_ALM2.AsFloat > 0) then
                    ColorResaltado2(Canvas)
                 else
                    ColorError(Canvas);
              end
              else
              if (UpperCase(Column.FieldName) = 'STOCK_ALM3') then
              begin
                 if (DMMovManStock.QMDetalleSTOCK_ALM3.AsFloat > 0) then
                    ColorResaltado2(Canvas)
                 else
                    ColorError(Canvas);
              end
              else
              if (UpperCase(Column.FieldName) = 'STOCK_ORI') then
              begin
                 if (DMMovManStock.QMDetalleSTOCK_ORI.AsFloat > 0) then
                    ColorResaltado2(Canvas)
                 else
                    ColorError(Canvas);
              end
              else
              if (UpperCase(Column.FieldName) = 'STOCK_DST') then
              begin
                 if (DMMovManStock.QMDetalleSTOCK_DST.AsFloat > 0) then
                    ColorResaltado2(Canvas)
                 else
                    ColorError(Canvas);
              end;
           end;
        end; {Solo pinto si está en estado Browse}
     end; {with TDBGridFind2000}
  end; {if HayDetalle}
  TDBGridFind2000(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMMovManStock.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button in [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbRefresh]) then
     AbreOCierra;

  if (Button in [nbPost, nbCancel]) then
  begin
     with DBRGTipoMov do
     begin
        Items.Clear;
        Values.Clear;

        Values.Add('E');
        Items.Add(_('&Entrada'));
        Values.Add('S');
        Items.Add(_('&Salida'));
        Values.Add('T');
        Items.Add(_('&Traspaso entre Almacenes'));

        // Refresh, Invalidate, Update, Repaint no funcionan para refrescar el componente.
        DataField := '';
        DataField := 'TIPO_OPERACION';
     end;
  end;
end;

procedure TFMMovManStock.AVerUbicacionesExecute(Sender: TObject);
begin
  inherited;
  if (DMMovManStock.QMCabeceraTIPO_OPERACION.AsString = 'T') then
  begin
     if (Sender = MIEntradas1) then
        DMMovManStock.MuestraUbicacion('E')
     else
     if (Sender = MISalidas1) then
        DMMovManStock.MuestraUbicacion('S');
  end
  else
     DMMovManStock.MuestraUbicacion('');
end;

procedure TFMMovManStock.ACodBarrasExecute(Sender: TObject);
begin
  inherited;
  DMMovManStock.ListarCodBarras;
end;

procedure TFMMovManStock.ADescargaLectorCreaMovExecute(Sender: TObject);
var
  Archivo : TextFile;
  DirOri, s, m : string;
  ArticuloLeido : string;
  articulo : string;
  cantidad : integer;
  i, j, k : integer;
  {fecha : TDateTime; No se utiliza}
  RegistroCambiado : boolean;
  ArchivoLog : TextFile;
  FechaLog : string;
begin
  inherited;
  DirOri := REntorno.DirectorioLector;

  FechaLog := FormatDateTime('yymmdd_hhnnss', Now);
  AssignFile(ArchivoLog, DirOri + 'MovMan' + '_' + FechaLog + '.log');
  try
     Rewrite(ArchivoLog);
     WriteLn(ArchivoLog, 'Movimiento Manual de Stock ' + DBEFSerie.Text + '/' + DBERig.Text);
     WriteLn(ArchivoLog, 'Estado ' + DBEstado.Text);
     WriteLn(ArchivoLog, 'Lineas ' + IntToStr(DMMovManStock.QMDetalle.RecordCount));
     WriteLn(ArchivoLog, '--------------------------------------------------');

     AssignFile(Archivo, DirOri + 'Pedido.txt');
     Reset(Archivo);
     try
        while (not EOF(Archivo)) do
        begin
           Articulo := '';
           ReadLn(Archivo, s);
           i := Pos(',', S);
           j := Pos(',', Copy(s, i + 1, Length(s)));
           k := Pos(',', Copy(s, i + j + 1, Length(s)));

           {fecha:=StrToDateTime(copy(s,1,i-1)+' '+ Copy(s,i+1,j-1)); No se utiliza}
           ArticuloLeido := Copy(s, j + i + 1, k - 1);
           Cantidad := StrToIntDef(Copy(s, j + i + k + 1, Length(s)), 0);

           {Primero veo si el articulo leido es un codigo de barras}
           Articulo := DameArticuloBarras(ArticuloLeido);
           {Si no es un codigo de barras veo si existe (pido su titulo)}
           if (Articulo = '') then
           begin
              if (DameTituloArticulo(ArticuloLeido) > '') then
                 Articulo := ArticuloLeido
              else
                 Articulo := '';
           end;

           {Si encuentro el articulo}
           if (Articulo > ' ') then
           begin
              with DMMovManStock.QMDetalle do
              begin
                 {Primero lo busco y agrego unidades si encuentro}
                 First;
                 RegistroCambiado := False;
                 while (not EOF) and (not RegistroCambiado) do
                 begin
                    if (DBGFDetalle.FindColumn('ARTICULO').Field.AsString = Articulo) then
                    begin
                       WriteLn(ArchivoLog, 'Encontrado ' + Articulo + ', se agregan ' + IntToStr(Cantidad) + ' unidades.');
                       try
                          Edit;
                          DBGFDetalle.FindColumn('UNIDADES').Field.AsInteger := DBGFDetalle.FindColumn('UNIDADES').Field.AsInteger + Cantidad;
                          Post;
                          RegistroCambiado := True;
                          Last;
                       except
                          on e: Exception do
                          begin
                             Cancel;
                             m := Format(_('Error agregando unidades. Articulo %s x %d'), [Articulo, Cantidad]);
                             ShowMessage(m + #13#10 + E.Message);
                             WriteLn(ArchivoLog, m + #13#10 + E.Message);
                          end;
                       end;
                    end;
                    Next;
                 end; {while not EOF}

                 {Si no encuentro, lo inserto}
                 if (not RegistroCambiado) then
                 begin
                    WriteLn(ArchivoLog, 'No Encontrado ' + Articulo + ', se agregan ' + IntToStr(Cantidad) + ' unidades.');
                    try
                       DMMovManStock.Continua;
                       Insert;
                       DBGFDetalle.FindColumn('ARTICULO').Field.AsString := Articulo;
                       DBGFDetalle.FindColumn('UNIDADES').Field.AsInteger := Cantidad;
                       Post;
                    except
                       on e: Exception do
                       begin
                          Cancel;
                          m := Format(_('Error insertando articulo %s x %d'), [Articulo, Cantidad]);
                          ShowMessage(m + #13#10 + E.Message);
                          WriteLn(ArchivoLog, m + #13#10 + E.Message);
                       end;
                    end;
                 end;
              end; {with}
           end
           else
           begin
              WriteLn(ArchivoLog, 'No Existe el articulo ' + Articulo + ' x ' + IntToStr(Cantidad) + ' unidades. Articulo Leido: ' + ArticuloLeido);
              m := Format(_('No encuentro el articulo leido: %s x %d unidades. Deberá agregarlo luego.'), [ArticuloLeido, Cantidad]);
              ShowMessage(m);
           end;
        end;
     finally
        CloseFile(Archivo);
     end;
  finally
     CloseFile(ArchivoLog);
  end;
  CopyFileTo(DirOri + 'Pedido.txt', DirOri + 'MovMan' + '_' + FormatDateTime('yymmdd_hhnnss', Now) + '.txt');
  try
     Rewrite(Archivo);
  finally
     CloseFile(Archivo);
  end;
end;

procedure TFMMovManStock.ADescargaLectorVerificaMovExecute(Sender: TObject);
var
  Archivo : TextFile;
  DirOri, s, m : string;
  ArticuloLeido : string;
  articulo : string;
  cantidad : integer;
  i, j, k : integer;
  {fecha : TDateTime; No se utiliza}
  {RegistroCambiado : Boolean; No se utiliza}
  Errores : TStringList;
  ArchivoLog : TextFile;
  FechaLog : string;
begin
  inherited;
  DirOri := REntorno.DirectorioLector;

  FechaLog := FormatDateTime('yymmdd_hhnnss', Now);
  AssignFile(ArchivoLog, DirOri + 'MovManVerif' + '_' + FechaLog + '.log');
  Rewrite(ArchivoLog);
  WriteLn(ArchivoLog, 'Movimiento Manual de Stock ' + DBEFSerie.Text + '/' + DBERig.Text);
  WriteLn(ArchivoLog, 'Estado ' + DBEstado.Text);
  WriteLn(ArchivoLog, 'Lineas ' + IntToStr(DMMovManStock.QMDetalle.RecordCount));
  WriteLn(ArchivoLog, '--------------------------------------------------');

  // DMMovManStock.QMDetalle.DisableControls;
  Errores := TStringList.Create;
  try
     Errores.Sorted := True;
     {Relleno Errores con los datos del movimiento y lo verifico}
     with DMMovManStock.QMDetalle do
     begin
        First;
        while (not EOF) do
        begin
           Errores.Add(FieldByName('ARTICULO').AsString + ',' + FieldByName('UNIDADES').AsString);
           Next;
        end;
     end;

     AssignFile(Archivo, DirOri + 'Pedido.txt');
     Reset(Archivo);
     Cantidad := 0;
     try
        while (not EOF(Archivo)) do
        begin
           Articulo := '';
           ReadLn(Archivo, s);
           i := Pos(',', S);
           j := Pos(',', Copy(s, i + 1, Length(s)));
           k := Pos(',', Copy(s, i + j + 1, Length(s)));

           {fecha:=StrToDateTime(copy(s,1,i-1)+' '+ Copy(s,i+1,j-1)); No se utiliza}
           ArticuloLeido := Copy(s, j + i + 1, k - 1);
           Cantidad := StrToIntDef(Copy(s, j + i + k + 1, Length(s)), 0);

           {Primero veo si el articulo leido es un codigo de barras}
           Articulo := DameArticuloBarras(ArticuloLeido);
           {Si no es un codigo de barras veo si existe (pido su titulo)}
           if (Articulo = '') then
           begin
              if (DameTituloArticulo(ArticuloLeido) > '') then
                 Articulo := ArticuloLeido
              else
                 Articulo := '';
           end;

           {Si encuentro el articulo}
           if (Articulo > ' ') then
           begin
              WriteLn(ArchivoLog, 'Encontrado ' + Articulo + ', se agregan ' + IntToStr(Cantidad) + ' unidades.');
              i := 0;
              Errores.Find(Articulo + ',', i);
              if ((Errores.Count > 0) and (i + 1 <= Errores.Count)) then
              begin
                 if (Pos(Articulo + ',', Errores[i]) > 0) then
                 begin
                    j := Pos(',', Errores[i]);
                    k := StrToIntDef(Copy(Errores[i], j + 1, Length(Errores[i])), 0);
                    Errores.Delete(i);
                    if (k > Cantidad) then
                       Errores.Add(Articulo + ',' + IntToStr(k - Cantidad));
                    if (k < Cantidad) then
                       Errores.Add(Articulo + ',' + IntToStr(k - Cantidad));
                 end
                 else
                    Errores.Add(Articulo + ',' + IntToStr((-1) * Cantidad));
              end
              else
                 Errores.Add(Articulo + ',' + IntToStr((-1) * Cantidad));
           end
           else
           begin
              begin
                 WriteLn(ArchivoLog, 'No Existe el articulo ' + Articulo + ' x ' + IntToStr(Cantidad) + ' unidades. Articulo Leido: ' + ArticuloLeido);
                 m := Format(_('No encuentro el articulo leido: %s x %d. No existe en la base de datos'), [ArticuloLeido, Cantidad]);
                 ShowMessage(m);
              end;
           end;
        end; {while}

        if (Errores.Count > 0) then
        begin
           Errores.Sorted := False;
           for i := 0 to Errores.Count - 1 do
           begin
              j := Pos(',', Errores[i]);
              articulo := Copy(Errores[i], 1, j - 1);
              cantidad := StrToIntDef(Copy(Errores[i], j + 1, Length(Errores[i])), 0);
              if (Cantidad > 0) then
                 Errores[i] := Format(_('Falta %d unidad/es del artículo %s'), [Cantidad, Articulo])
              else
                 Errores[i] := Format(_('Sobra %d unidad/es del artículo %s'), [Abs(Cantidad), Articulo]);
           end;
           m := Format(_('No encuentro el articulo leido: %s x %d. No existe en la base de datos'), [ArticuloLeido, Cantidad]);
           ShowMessage(_('Se encontraron los siguiente errores:') + #13#10 + Errores.Text);
        end;
     finally
        CloseFile(Archivo);
     end;
  finally
     CloseFile(ArchivoLog);
     Errores.Free;
  end;
  CopyFileTo(DirOri + 'Pedido.txt', DirOri + 'MovManVerif' + '_' + FormatDateTime('yymmdd_hhnnss', Now) + '.txt');
  try
     Rewrite(Archivo);
  finally
     CloseFile(Archivo);
  end;
end;

procedure TFMMovManStock.DBGFDetalleKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (TDBGridFind2000(Sender).ColumnaActual = 'ID_LOTE') then
  begin
     if (Key = VK_F3) then
     begin
        DMMovManStock.InfoLotes;
        Key := 0;
     end;
  end
  else
  if Param_ARTBUSQ004 and (TDBGridFind2000(Sender).ColumnaActual = 'ARTICULO') then
  begin
     if (Key = VK_F3) then
     begin
        if PideArticulo(DBGDetalleArticulo) then
        begin
           DMMovManStock.QMDetalle.Edit;
           DMMovManStock.QMDetalleARTICULO.AsString := DBGDetalleArticulo;
        end;
        Key := 0;
     end;
  end;
end;

procedure TFMMovManStock.DBGFDetalleBeforeColExit(Sender: TObject; var Continuar: boolean);
var
  c : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (ColumnaActual = 'ARTICULO') then
     begin
        {Ubicaciones}
        if ((not DMMovManStock.ArticuloUbicable) and (DataSource.DataSet.State = dsInsert)) then
        begin
           c := EncuentraField(TDBGridFind2000(Sender), 'ID_UBICACION_E');
           if (c >= 0) then
           begin
              TDBGridFind2000(Sender).Columns[c].ReadOnly := True;
              TDBGridFind2000(Sender).Columns[c].Color := clInfoBk;
           end;
           c := EncuentraField(TDBGridFind2000(Sender), 'ID_UBICACION_S');
           if (c >= 0) then
           begin
              TDBGridFind2000(Sender).Columns[c].ReadOnly := True;
              TDBGridFind2000(Sender).Columns[c].Color := clInfoBk;
           end;
        end
        else
        begin
           c := EncuentraField(TDBGridFind2000(Sender), 'ID_UBICACION_E');
           if (c >= 0) then
           begin
              TDBGridFind2000(Sender).Columns[c].ReadOnly := False;
              TDBGridFind2000(Sender).Columns[c].Color := clWindow;
           end;
           c := EncuentraField(TDBGridFind2000(Sender), 'ID_UBICACION_S');
           if (c >= 0) then
           begin
              TDBGridFind2000(Sender).Columns[c].ReadOnly := False;
              TDBGridFind2000(Sender).Columns[c].Color := clWindow;
           end;
        end;

        {Lotes}
        if ((not DMMovManStock.ArticuloLoteable) and (DataSource.DataSet.State = dsInsert)) then
        begin
           c := EncuentraField(TDBGridFind2000(Sender), 'ID_LOTE');
           if (c >= 0) then
           begin
              TDBGridFind2000(Sender).Columns[c].ReadOnly := True;
              TDBGridFind2000(Sender).Columns[c].Color := clInfoBk;
           end;
        end
        else
        begin
           c := EncuentraField(TDBGridFind2000(Sender), 'ID_LOTE');
           if (c >= 0) then
           begin
              TDBGridFind2000(Sender).Columns[c].ReadOnly := False;
              TDBGridFind2000(Sender).Columns[c].Color := clWindow;
           end;
        end;
     end;
  end;
end;

procedure TFMMovManStock.AImportarDetalleExecute(Sender: TObject);
begin
  inherited;
  with TFMInsercionArticuloDesdeTexto.Create(Self) do
  begin
     DM := DMMovManStock;
     ShowModal;
     Free;
  end;

  DMMovManStock.RefrescarCabecera;
end;

procedure TFMMovManStock.AListarEtiquetasExecute(Sender: TObject);
var
  SQL : TStrings;
begin
  AbreForm(TFMImprimirCodBarras, FMImprimirCodBarras, Self);
  if (DMMain.EstadoKri(490) = 1) then  //Verificamos si las etiquetas se harán por lotes
  begin
     SQL := TStringList.Create;
     try
        DMMovManStock.DameSqlImpresionEtiquetas(SQL);
        FMImprimirCodBarras.ImportarDatosSql('MO' + DMMovManStock.QMCabeceraTIPO_OPERACION.AsString, DMMovManStock.QMCabeceraID_ST.AsInteger, SQL);
     finally
        SQL.Free;
     end;
  end
  else
     FMImprimirCodBarras.ImportarDatos('MO' + DMMovManStock.QMCabeceraTIPO_OPERACION.AsString, DMMovManStock.QMCabeceraID_ST.AsInteger);
end;

procedure TFMMovManStock.DBEFCanalOrigChange(Sender: TObject);
begin
  inherited;
  ECanalOrig.Text := DameTituloCanal(StrToIntDef(DBEFCanalOrig.Text, 0));
end;

procedure TFMMovManStock.DBEFCanalDstChange(Sender: TObject);
begin
  inherited;
  ECanalDst.Text := DameTituloCanal(StrToIntDef(DBEFCanalDst.Text, 0));
end;

procedure TFMMovManStock.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  inherited;
  AVisualizarListadodeMovimientos.Execute;
end;

procedure TFMMovManStock.AAsignaKitExecute(Sender: TObject);
begin
  inherited;
  DMMovManStock.AsignaKit;
end;

procedure TFMMovManStock.DBEstadoChange(Sender: TObject);
begin
  inherited;
  ColorSegunEstado(TLFDbedit(Sender), DMMovManStock.QMCabeceraESTADO.AsInteger);
end;

procedure TFMMovManStock.CBSeriesChange(Sender: TObject);
begin
  inherited;
  if (CBSeries.ItemIndex = 0) then
     Serie := ''
  else
     Serie := Copy(CBSeries.Items[CBSeries.ItemIndex], 1, Pos(' ', CBSeries.Items[CBSeries.ItemIndex]) - 1);

  DMMovManStock.CambiaSerie(Serie);

  EstableceVisibilidadStockAlmacen;
  Param_ARTBUSQ004 := (LeeParametro('ARTBUSQ004', Serie) = 'S');
  // Hora para movimiento de tipo (2:Entrada; 3:Salida; 4:Traspaso)
  Param_MOVSTCK002 := Trim(LeeParametro('MOVSTCK002', Serie));
  Param_MOVSTCK003 := Trim(LeeParametro('MOVSTCK003', Serie));
  Param_MOVSTCK004 := Trim(LeeParametro('MOVSTCK004', Serie));
  Param_MOVSTCK008 := (LeeParametro('MOVSTCK008', Serie) = 'S');
  Param_MOVSTCK009 := (LeeParametro('MOVSTCK009', Serie) = 'S');
  Param_MOVSTCK012 := (LeeParametro('MOVSTCK012', Serie) = 'S');
  AbreOCierra;
end;

procedure TFMMovManStock.AAsientoMovimientoExecute(Sender: TObject);
begin
  inherited;
  if (DMMovManStock.QMCabeceraESTADO.AsInteger = 5) then
     FMain.MuestraMovConta(' RIC= ' + DMMovManStock.QMCabeceraRIC.AsString +
        ' AND EJERCICIO=' + DMMovManStock.QMCabeceraEJERCICIO.AsString);
end;

procedure TFMMovManStock.HabilitaEnlaces;
begin
  SolapaControles(SBVerAsiento, DBEAsiento);
end;

procedure TFMMovManStock.SBVerAsientoClick(Sender: TObject);
begin
  inherited;
  AAsientoMovimiento.Execute;
end;

procedure TFMMovManStock.DBEFSerieChange(Sender: TObject);
var
  TipoOperacion, Parametro_MOVSTCK001 : string;
  i : integer;
begin
  inherited;

  // Si estoy en modo inserción debo respetar la configuración según parámetro
  if (DMMovManStock.QMCabecera.State = dsInsert) then
  begin
     Parametro_MOVSTCK001 := LeeParametro('MOVSTCK001', DBEFSerie.Text);
     if (Length(Parametro_MOVSTCK001) = 0) then
        Parametro_MOVSTCK001 := 'EST';

     with DBRGTipoMov do
     begin
        Items.Clear;
        Values.Clear;
        for i := 1 to Length(Parametro_MOVSTCK001) do
        begin
           if (Parametro_MOVSTCK001[i] = 'E') then
           begin
              Values.Add(Parametro_MOVSTCK001[i]);
              Items.Add(_('&Entrada'));
           end;
           if (Parametro_MOVSTCK001[i] = 'S') then
           begin
              Values.Add(Parametro_MOVSTCK001[i]);
              Items.Add(_('&Salida'));
           end;
           if (Parametro_MOVSTCK001[i] = 'T') then
           begin
              Values.Add(Parametro_MOVSTCK001[i]);
              Items.Add(_('&Traspaso entre Almacenes'));
           end;
        end;

        // Refresh, Invalidate, Update, Repaint no funcionan para refrescar el componente.
        DataField := '';
        DataField := 'TIPO_OPERACION';
     end;

     TipoOperacion := DMMovManStock.QMCabeceraTIPO_OPERACION.AsString;
     if (Pos(TipoOperacion, Parametro_MOVSTCK001) = 0) then
        DMMovManStock.QMCabeceraTIPO_OPERACION.AsString := Parametro_MOVSTCK001[1];
  end;
end;

procedure TFMMovManStock.AInsercionMasivaModeloExecute(Sender: TObject);
var
  RefProveedor : string;
begin
  inherited;

  if PideDato('MOD', RefProveedor, _('Modelo'), 'BAJA = 0') then
     DMMovManStock.InsertaModelo(RefProveedor);
end;

procedure TFMMovManStock.EstableceVisibilidadStockAlmacen;

  procedure EstableceVisibilidad(Campo, Parametro, Descripcion: string);
  var
     i : smallint;
     AlmacenStock : string;
  begin
     AlmacenStock := LeeParametro(Parametro, Serie);
     if (AlmacenStock = '') then
        AlmacenStock := 'NOCALC';
     if (AlmacenStock <> 'NOCALC') then
        AlmacenStock := Copy(AlmacenStock, 1, 3);

     Descripcion := Descripcion + ' ' + AlmacenStock;

     i := EncuentraField(DBGFDetalle, Campo);
     if (i >= 0) then
     begin
        with DBGFDetalle.Columns[i] do
        begin
           Visible := (AlmacenStock <> 'NOCALC');
           Title.Caption := Descripcion;
           ReadOnly := True;
        end;
     end
     else
     begin
        with DBGFDetalle.Columns.Add do
        begin
           FieldName := Campo;
           Title.Caption := Descripcion;
           Visible := (AlmacenStock <> 'NOCALC');
           ReadOnly := True;
        end;
     end;
  end;

begin
  EstableceVisibilidad('STOCK_ALM', 'MOVSTKA001', _('Stock'));
  EstableceVisibilidad('STOCK_ALM2', 'MOVSTKA002', _('Stock'));
  EstableceVisibilidad('STOCK_ALM3', 'MOVSTKA003', _('Stock'));
end;

procedure TFMMovManStock.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button in [nbRefresh, nbDelete]) then
     DMMovManStock.ReiniciaStock;
end;

procedure TFMMovManStock.DBGFDetalleKeyPress(Sender: TObject; var Key: char);
begin
  inherited;
  if TDBGridFind2000(Sender).DataSource.DataSet.State in [dsEdit, dsInsert] then
  begin
     if Param_ARTBUSQ004 and (TDBGridFind2000(Sender).ColumnaActual = 'ARTICULO') then
     begin
        if Key in ['a'..'z', 'A'..'Z', '0'..'9', '.', '-', '*', '%', ' ', '_'] then
           DBGDetalleArticulo := DBGDetalleArticulo + Key
        else
        if Key in [#8] then
           DBGDetalleArticulo := Copy(DBGDetalleArticulo, 1, Length(DBGDetalleArticulo) - 1);
     end;
  end
  else
     DBGDetalleArticulo := '';
end;

procedure TFMMovManStock.DBGFDetalleRowChange(Sender: TObject);
begin
  inherited;
  DBGDetalleArticulo := '';
end;

procedure TFMMovManStock.CBMostrarStockChange(Sender: TObject);
var
  i : integer;
begin
  inherited;

  DMMovManStock.MostrarStock(CBMostrarStockOri.Checked, CBMostrarStockDst.Checked);

  i := EncuentraField(DBGFDetalle, 'STOCK_ORI');
  if (i >= 0) then
     DBGFDetalle.Columns[i].Visible := CBMostrarStockOri.Checked
  else
  begin
     with DBGFDetalle.Columns.Add do
     begin
        FieldName := 'STOCK_ORI';
        Title.Caption := _('Stock Orig.');
        Visible := CBMostrarStockOri.Checked;
        ReadOnly := True;
        Index := EncuentraField(DBGFDetalle, 'UNIDADES_EXT') + 1;
     end;
  end;

  i := EncuentraField(DBGFDetalle, 'STOCK_DST');
  if (i >= 0) then
     DBGFDetalle.Columns[i].Visible := CBMostrarStockDst.Checked
  else
  begin
     with DBGFDetalle.Columns.Add do
     begin
        FieldName := 'STOCK_DST';
        Title.Caption := _('Stock Dest.');
        Visible := CBMostrarStockDst.Checked;
        ReadOnly := True;
        Index := EncuentraField(DBGFDetalle, 'STOCK_ORI') + 1;
     end;
  end;
end;

end.
