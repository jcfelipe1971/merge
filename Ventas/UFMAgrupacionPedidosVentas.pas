unit UFMAgrupacionPedidosVentas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, Mask, DBCtrls, ComCtrls, ToolWin, UControlEdit, UFormGest,
  NsDBGrid, ULFPanel, ULFDBEdit, ULFToolBar, ULFEditFind2000, rxToolEdit,
  ULFLabel, rxPlacemnt, ULFFormStorage, ULFEdit, HYFIBQuery, DB, ULFComboBox,
  ULFPageControl, Menus, UTeclas, idGlobalProtocols, ULFCheckBox, TFlatCheckBoxUnit, ULFDateEdit,
  Buttons, ActnList, UFPEditSinNavegador, ULFActionList, UEditPanel,
  ULFDBMemo;

type
  TFMAgrupacionPedidosVentas = class(TFPEditSinNavegador)
     DBGFind2000Pedidos: TDBGridFind2000;
     PNTotales: TLFPanel;
     GBPortes: TGroupBox;
     LBTransportista: TLFLabel;
     EFTransportista: TLFEditFind2000;
     LBPortes: TLFLabel;
     EFPortes: TLFEditFind2000;
     DBETituloPortes: TLFDbedit;
     LBIPortes: TLFLabel;
     LBPorPortes: TLFLabel;
     LBRango: TLFLabel;
     EFRango: TLFEditFind2000;
     DBETituloRango: TLFDbedit;
     DBETituloIndice: TLFDbedit;
     EFIndice: TLFEditFind2000;
     LBIndice: TLFLabel;
     EPorPortes: TLFEdit;
     EIPortes: TLFEdit;
     PNLDivisionDocumento: TLFPanel;
     LSerie: TLFLabel;
     CBSeries: TLFComboBox;
     PNLCliente: TLFPanel;
     LCliente: TLFLabel;
     EFCliente: TLFEditFind2000;
     DBETitClientes: TLFDbedit;
     ToolButton6: TToolButton;
     TButtRegenera: TToolButton;
     TButtLineasServidas: TToolButton;
     TButtLineasNoServidas: TToolButton;
     ToolButton1: TToolButton;
     TButtServirMarcados: TToolButton;
     TButtMarcarTodas: TToolButton;
     TButtServirTodaLinea: TToolButton;
     TButtMarcarTodasProc: TToolButton;
     TButtCerrarYMarcarPedido: TToolButton;
     TButtGenerarFactura: TToolButton;
     ToolButton4: TToolButton;
     TBCabeceraAgrupacion: TLFToolBar;
     PNLCanalDestino: TLFPanel;
     LBDestino: TLFLabel;
     EFCanales: TLFEditFind2000;
     DBETitCanal: TLFDbedit;
     DEFechaRecepcion: TLFDateEdit;
     PNLFechasDestino: TLFPanel;
     LFechaDestino: TLFLabel;
     DEFechaDestino: TLFDateEdit;
     LPedido: TLFLabel;
     EPedido: TLFEdit;
     LLector: TLFLabel;
     EArticulo: TLFEdit;
     TButtLector: TToolButton;
     LFechaRecepcion: TLFLabel;
     PCPedidos: TLFPageControl;
     TSAgrupacion: TTabSheet;
     TSHojaPreparacion: TTabSheet;
     DBGFCabeceraHojaPreparacion: TDBGridFind2000;
     DBGFDetalleHojaPreparacion: TDBGridFind2000;
     PNLHojaPreparacion: TLFPanel;
     Splitter1: TSplitter;
     PNLFechasRecepcion: TLFPanel;
     PNLPedido: TLFPanel;
     PNLLector: TLFPanel;
     ToolButton8: TToolButton;
     CBForzarPortes: TLFCheckBox;
     ETituloTransportista: TLFEdit;
     PNLSeleccion: TLFPanel;
     LPedidoSeleccion: TLFLabel;
     EPedidoSeleccionDesde: TLFEdit;
     LDireccionSeleccion: TLFLabel;
     EDireccionSeleccion: TLFEdit;
     LArticuloSeleccion: TLFLabel;
     EArticuloSeleccion: TLFEdit;
     BFiltrarSeleccion: TButton;
     BEnviarSeleccion: TButton;
     EFPaisSeleccion: TLFEditFind2000;
     LPais: TLFLabel;
     BLimpiarSeleccion: TButton;
     SBAClientes: TSpeedButton;
     ALAgrupa: TActionList;
     ACliente: TAction;
     PNLTotalUnidades: TLFPanel;
     LTotalUnidades: TLFLabel;
     DBETotalUnidades: TLFDbedit;
     LTotalUnidadesPedidas: TLFLabel;
     DBETotalUnidadesPedidas: TLFDbedit;
     TButtDesmarcarTodasProc: TToolButton;
     ToolButton2: TToolButton;
     ToolButton5: TToolButton;
     CBDividirPorDirecciones: TLFCheckBox;
     EPedidoSeleccionHasta: TLFEdit;
     PNLSerie: TLFPanel;
     CBCalcularStock: TLFCheckBox;
     DTPHoraRecepcion: TDateTimePicker;
     DTPHoraDestino: TDateTimePicker;
     EFDocumento: TLFEditFind2000;
     LDocDestino: TLFLabel;
     EDescripcionDocumento: TLFEdit;
     PNLDocDestino: TLFPanel;
     TBSep3: TToolButton;
     GBAvisos: TGroupBox;
     DBMAvisos: TLFDBMemo;
     CBSoloListoPreparar: TLFCheckBox;
     AAsignacionCodigoBarra: TAction;
     TButtAsignacionCodigoBarra: TToolButton;
     EArticuloServir: TLFEditFind2000;
     ECantidadServir: TLFEdit;
     B_SERVIR: TButton;
     TButtImportarExcel: TToolButton;
     AImportarExcel: TAction;
     LServicio: TLFLabel;
     LBultos: TLFLabel;
     LHorario: TLFLabel;
     LPeso: TLFLabel;
     CBServicio: TComboBox;
     EBultos: TLFEdit;
     CBHorario: TComboBox;
     EPeso: TLFEdit;
     GBDireccion: TGroupBox;
     DBTDireccion: TDBText;
     DBTLocalidad: TDBText;
     DBTPais: TDBText;
     DBTCodigoPostal: TDBText;
     DBTProvincia: TDBText;
     BAlbaranYEtiqTransporte: TButton;
     CBCalcularPedidosProv: TLFCheckBox;
     pmMarcarTodas: TPopupMenu;
     MIMarcarTodas: TMenuItem;
     MIMarcarTodasStockSuficiente: TMenuItem;
     MIMarcarTodasServirParcialmente: TMenuItem;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure TButtSalirClick(Sender: TObject);
     procedure EFClienteExiste(Sender: TObject);
     procedure TButtRegeneraClick(Sender: TObject);
     procedure TButtLineasServidasClick(Sender: TObject);
     procedure TButtLineasNoServidasClick(Sender: TObject);
     procedure TButtMarcarTodasClick(Sender: TObject);
     procedure TButtCerrarYMarcarPedidoClick(Sender: TObject);
     procedure TButtGenerarFacturaClick(Sender: TObject);
     procedure TButtServirTodaLineaClick(Sender: TObject);
     procedure TButtServirMarcadosClick(Sender: TObject);
     procedure EFClienteBusqueda(Sender: TObject);
     procedure EFTransportistaChange(Sender: TObject);
     procedure EFPortesChange(Sender: TObject);
     procedure EFRangoChange(Sender: TObject);
     procedure EFIndiceChange(Sender: TObject);
     procedure EFIndiceBusqueda(Sender: TObject);
     procedure EFRangoBusqueda(Sender: TObject);
     procedure EFCanalesChange(Sender: TObject);
     procedure EArticuloKeyPress(Sender: TObject; var Key: char);
     procedure TButtLectorClick(Sender: TObject);
     procedure CBSeriesChange(Sender: TObject);
     procedure FormResize(Sender: TObject);
     procedure BFiltrarSeleccionClick(Sender: TObject);
     procedure BEnviarSeleccionClick(Sender: TObject);
     procedure BLimpiarSeleccionClick(Sender: TObject);
     procedure EArticuloExit(Sender: TObject);
     procedure SBAClientesDblClick(Sender: TObject);
     procedure AClienteExecute(Sender: TObject);
     procedure TButtDesmarcarTodasProcClick(Sender: TObject);
     procedure MIMarcarTodasClick(Sender: TObject);
     procedure EPedidoSeleccionDesdeExit(Sender: TObject);
     procedure DBGFind2000PedidosDblClick(Sender: TObject);
     procedure DBGFind2000PedidosCellClick(Column: TColumn);
     procedure DBGFind2000PedidosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFind2000PedidosKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure FormShow(Sender: TObject);
     procedure CBCalcularStockChange(Sender: TObject);
     procedure EFSeleccionKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFDocumentoBusqueda(Sender: TObject);
     procedure EFDocumentoChange(Sender: TObject);
     procedure CBSoloListoPrepararChange(Sender: TObject);
     procedure AAsignacionCodigoBarraExecute(Sender: TObject);
     procedure B_SERVIRClick(Sender: TObject);
     procedure AImportarExcelExecute(Sender: TObject);
     procedure BAlbaranYEtiqTransporteClick(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     param_AGRPEDC001: boolean;
     procedure InicializaTraspaso(Tipo: string);
     procedure CamposVisibles(Visible: boolean);
     procedure DamePortesCliente(Cliente: integer);
     procedure DeshabilitaPortes;
     procedure CompruebaPortes;
     procedure RefrescarDatos(Cliente: integer);
  public
     { Public declarations }
  end;

var
  FMAgrupacionPedidosVentas : TFMAgrupacionPedidosVentas;

implementation

uses UDMAgrupacionPedidosVentas, UDMMain, UEntorno, UUtiles, UDameDato,
  UFInfoFacturacionAlb, UFMControlErroresAgrupPec, UFMain, UParam, DateUtils {$IFNDEF TPV},
  UFMAsignacionCodigoBarra {$ENDIF}, URellenaLista;

{$R *.DFM}

procedure TFMAgrupacionPedidosVentas.FormCreate(Sender: TObject);
var
  i, IdColumna : integer;
  col : TColumn;
begin
  inherited;
  AbreData(TDMAgrupacionPedidosVentas, DMAgrupacionPedidosVentas);
  DBGFind2000Pedidos.ColumnasChecked.Strings[DBGFind2000Pedidos.ColumnasCheckBoxes.IndexOf('ENTRADA_AGRUPACION')] :=
     REntorno.EntradaStr;

  // DBLCBSerie.KeyValue := REntorno.Serie;

  RellenaSeries(CBSeries.Items);
  // Me posiciono en la serie por defecto (REntorno.Serie)
  CBSeries.ItemIndex := 0;
  while ((CBSeries.ItemIndex < CBSeries.Items.Count - 1) and
        (Copy(CBSeries.Items[CBSeries.ItemIndex], 1, Length(REntorno.Serie + ' ')) <> REntorno.Serie + ' ')) do
     CBSeries.ItemIndex := CBSeries.ItemIndex + 1;
  CBSeriesChange(Self);

  DEFechaRecepcion.Date := REntorno.FechaTrabSH;
  DTPHoraRecepcion.Time := Now;
  EFCanales.Text := REntorno.CanalStr;
  CamposVisibles(True);
  DeshabilitaPortes;

  DEFechaDestino.Date := REntorno.FechaTrabSH;
  DTPHoraDestino.Time := Now;

  if (DMMain.EstadoKri(140) = 1) then
  begin
     TButtLector.Visible := True;
     PNLPedido.Visible := True;
     PNLLector.Visible := True;
  end
  else
  begin
     TButtLector.Visible := False;
     PNLPedido.Visible := False;
     PNLLector.Visible := False;
  end;

  // Se establece descripcion de Campos ALFA_n
  // Se hace aquí porque la traducción reemplaza los titulos
  for i := 1 to 8 do
  begin
     IdColumna := EncuentraField(DBGFind2000Pedidos, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGFind2000Pedidos.Columns[IdColumna].Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));
  end;

  if (DMMain.EstadoKri(165) = 1) then {Inhabilita el Traspaso directo a Factura}
     TButtGenerarFactura.Visible := False;

  PCPedidos.ActivePage := TSAgrupacion;
  // Hojas de preparacion de pedidos
  if (LeeParametro('HOJAPRE001') = '0') then
     TSHojaPreparacion.TabVisible := False;

  if (StrToIntDef(LeeParametro('SYSCONF005'), 0) = 0) then
  begin
     col := DBGFind2000Pedidos.FindColumn('U_LOGISTICAS_RESERVADAS');
     if Assigned(col) then
        col.Visible := False;
     col := DBGFind2000Pedidos.FindColumn('TIPO_UNIDAD_LOGISTICA');
     if Assigned(col) then
        col.Visible := False;
     col := DBGFind2000Pedidos.FindColumn('UNIDADES_LOGISTICAS');
     if Assigned(col) then
        col.Visible := False;
     col := DBGFind2000Pedidos.FindColumn('TITULO_UNIDAD_LOGISTICA');
     if Assigned(col) then
        col.Visible := False;
  end;

  SolapaControles(SBAClientes, DBETitClientes);
  DBETitClientes.Color := REntorno.ColorEnlaceActivo;
  ColActual := DBGFind2000Pedidos.Columns[0];
  CBDividirPorDirecciones.Checked := False;
  EFTransportistaChange(Sender);

  param_AGRPEDC001 := (LeeParametro('AGRPEDC001') = 'S');

  EArticuloServir.CondicionBusqueda := 'FAMILIA <> ''' + REntorno.FamSistema + '''';
end;

procedure TFMAgrupacionPedidosVentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMAgrupacionPedidosVentas.DesmarcarEntradas;
  CierraData(DMAgrupacionPedidosVentas);
end;

procedure TFMAgrupacionPedidosVentas.TButtSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFMAgrupacionPedidosVentas.EFClienteExiste(Sender: TObject);
var
  Cliente : integer;
begin
  // Si el cliente existe
  Cliente := StrToIntDef(EFCliente.Text, 0);
  if (DameTituloCliente(Cliente) > '') then
  begin
     // Aviso o bloqueo según esté informado en el cliente
     if (DMMain.ClienteBloqueado(Cliente)) then
     begin
        PCPedidos.Enabled := False;
        TButtServirMarcados.Enabled := False;
        TButtMarcarTodas.Enabled := False;
        TButtServirTodaLinea.Enabled := False;
        TButtMarcarTodasProc.Enabled := False;
        TButtDesmarcarTodasProc.Enabled := False;
        TButtCerrarYMarcarPedido.Enabled := False;
        TButtGenerarFactura.Enabled := False;
     end
     else
     begin
        PCPedidos.Enabled := True;
        TButtServirMarcados.Enabled := True;
        TButtMarcarTodas.Enabled := True;
        TButtServirTodaLinea.Enabled := True;
        TButtMarcarTodasProc.Enabled := True;
        TButtDesmarcarTodasProc.Enabled := True;
        TButtCerrarYMarcarPedido.Enabled := True;
        TButtGenerarFactura.Enabled := True;
     end;

     RefrescarDatos(Cliente);

     if (DMMain.EstadoKri(140) = 1) then
        EPedido.SetFocus; {dji lrk kri - Perez Morant}

     DMAgrupacionPedidosVentas.Errores.Clear;

     // Hojas de preparacion de pedidos
     if (LeeParametro('HOJAPRE001') <> '0') then
        DMAgrupacionPedidosVentas.FiltraHojaPreparacion(Cliente);

     // Mirko - Para algunos clientes nunca debe dividir por direccion de entrega
     if (DMMain.EstadoKri(411) = 1) then
        CBDividirPorDirecciones.Checked := not ((Cliente = 60412) or (Cliente = 60406) or (Cliente = 60417));

     if (DMAgrupacionPedidosVentas.QMDireccionPAIS.AsString = 'ZZZ') then
     begin
        DBTPais.Color := clRed;
        DBTPais.Font.Color := clWhite;
        BAlbaranYEtiqTransporte.Enabled := False;
     end
     else
     begin
        DBTPais.Color := clInfoBk;
        DBTPais.Font.Color := clWindowText;
        BAlbaranYEtiqTransporte.Enabled := True;
     end;

     if (DMAgrupacionPedidosVentas.QMDireccionPAIS.AsString = 'ESP') then
     begin
        CBServicio.ItemIndex := 5; // 301 - España
        CBHorario.ItemIndex := 0; // 3 - 24H España
     end
     else
     begin
        CBServicio.ItemIndex := 6; // 3074 - Internacional
        CBHorario.ItemIndex := 4; // 99 - 24H Internacional
     end;

     { TODO : Calcular peso }
     // EPeso.Text := FormatFloat('0.00', DMAgrupacionPedidosVentas.QMPedidosPESO_TOTAL.AsFloat);
  end;
end;

procedure TFMAgrupacionPedidosVentas.TButtRegeneraClick(Sender: TObject);
begin
  RefrescarDatos(StrToIntDef(EFCliente.Text, 0));
end;

procedure TFMAgrupacionPedidosVentas.TButtLineasServidasClick(Sender: TObject);
begin
  DMAgrupacionPedidosVentas.MostrarLineasServidas(1);
  DMAgrupacionPedidosVentas.RefrescarPedidos;
end;

procedure TFMAgrupacionPedidosVentas.TButtLineasNoServidasClick(Sender: TObject);
begin
  DMAgrupacionPedidosVentas.MostrarLineasServidas(0);
  DMAgrupacionPedidosVentas.RefrescarPedidos;
end;

procedure TFMAgrupacionPedidosVentas.TButtMarcarTodasClick(Sender: TObject);
begin
  if Confirma then
     DMAgrupacionPedidosVentas.MarcarLineasPedidos;
end;

procedure TFMAgrupacionPedidosVentas.TButtCerrarYMarcarPedidoClick(Sender: TObject);
begin
  // Marca los albaranes segun el detalle de la Hoja de Preparacion
  if (PCPedidos.ActivePage = TSHojaPreparacion) then
     DMAgrupacionPedidosVentas.InicializaTraspasoHojas('ALB');

  DMAgrupacionPedidosVentas.Fecha_Rec := DateOf(DEFechaRecepcion.Date) + TimeOf(DTPHoraRecepcion.Time);
  CompruebaPortes;
  InicializaTraspaso('ALB');

  // Termina el traspaso - Establece ubicacion y Lote
  if (PCPedidos.ActivePage = TSHojaPreparacion) then
     DMAgrupacionPedidosVentas.ActualizaInfoAlbaran;
end;

procedure TFMAgrupacionPedidosVentas.TButtGenerarFacturaClick(Sender: TObject);
begin
  DMAgrupacionPedidosVentas.Fecha_Rec := DateOf(DEFechaRecepcion.Date) + TimeOf(DTPHoraRecepcion.Time);
  CompruebaPortes;
  InicializaTraspaso('FAC');
end;

procedure TFMAgrupacionPedidosVentas.TButtServirTodaLineaClick(Sender: TObject);
begin
  DMAgrupacionPedidosVentas.ServirTodaLinea;
end;

procedure TFMAgrupacionPedidosVentas.TButtServirMarcadosClick(Sender: TObject);
begin
  if Confirma then
  begin
     DMAgrupacionPedidosVentas.Fecha_Rec := DateOf(DEFechaRecepcion.Date) + TimeOf(DTPHoraRecepcion.Time);
     DMAgrupacionPedidosVentas.ServirMarcados;
  end;
end;

procedure TFMAgrupacionPedidosVentas.EFClienteBusqueda(Sender: TObject);
var
  Serie : string;
begin
  Serie := DMAgrupacionPedidosVentas.GetSerie;
  EFCliente.CondicionBusqueda := 'EMPRESA = ' + REntorno.EmpresaStr +
     ' AND EJERCICIO <= ' + REntorno.EjercicioStr +
     ' AND CANAL = ' + REntorno.CanalStr + ' AND SERIE = ''' + Serie + '''' +
     ' AND TIPO = ''PEC'' AND ESTADO in (0, 1, 3, 4)'; {dji lrk kri - (ESTADO <> 5 AND ESTADO <> 2)}
end;

procedure TFMAgrupacionPedidosVentas.InicializaTraspaso(Tipo: string);
var
  Ejercicio, Canal, Rig, id_s, id_s_d, Portes, Rango, Indice, Transportista, i, ForzarPortes : integer;
  WndList : Pointer;
  Serie : string;
  Por_Portes, I_Portes : double;
  Marcado : boolean;
  Articulo, aux : string;
  Stock : real;
  temp : TStrings;
  BM : integer; // Guardaré el ID_DETALLES_S
  Unidades : double;
  Direccion : integer;
  Abierto : boolean;
  ControlStock : boolean;
  PermiteStockNegativo : boolean;
  CambiaCanal : boolean;
  Existencias : double;
begin
  // Tratamos los valores de los portes
  Portes := StrToIntDef(EFPortes.Text, 0);
  Transportista := StrToIntDef(EFTransportista.Text, 0);
  Rango := StrToIntDef(EFRango.Text, 0);
  Indice := StrToIntDef(EFIndice.Text, 0);
  Por_Portes := StrToFloatDef(EPorPortes.Text, 0);
  I_Portes := StrToFloatDef(EIPortes.Text, 0);

  if (not DMAgrupacionPedidosVentas.PuedeRealizarAlbFac(StrToInt(EFCliente.Text))) then
  begin
     Application.MessageBox(PChar(string(_('No se pueden realizar ventas a este cliente, cliente bloqueado.'))),
        PChar(string(_('Se ha producido un error'))), MB_OK);
     Exit; // Saltamos del procedimiento
  end;

  DMAgrupacionPedidosVentas.GrabaDetalle;

  // Aqui tiene que comprobar que los pedidos hayan sido marcados COMPLETOS
  Rig := 0;
  with DMAgrupacionPedidosVentas.Errores do
     while (Rig < Count) do
     begin
        if ((Pos('FALTAN', Strings[Rig]) > 0) or (Pos('SOBRAN', Strings[Rig]) > 0)) then
        begin
           Delete(Rig);
           Dec(Rig);
        end;
        Inc(Rig);
     end;

  temp := TStringList.Create;
  try
     // Verifica que se esta sirviendo el pedido completo P.Morant
     if (DMMain.EstadoKri(142) = 1) then
     begin
        with DMAgrupacionPedidosVentas.QMDetalle do
        begin
           Transaction.CommitRetaining;
           DMAgrupacionPedidosVentas.MostrarLineasServidas(1);
           DMAgrupacionPedidosVentas.RefrescarPedidos;
           // Ordenar('RIG'); dji lrk kri - ya viene ordenado
           DisableControls;
           try
              while (not EOF) do
              begin
                 Rig := FieldByName('RIG').AsInteger;
                 Marcado := False;
                 while ((Rig = FieldByName('RIG').AsInteger) and (not EOF)) do
                 begin
                    if (FieldByName('ENTRADA_AGRUPACION').AsInteger = REntorno.Entrada) then
                       Marcado := True;
                    if (FieldByName('UNIDADES_RESERVADAS').AsInteger <>
                       FieldByName('UNIDADES_PENDIENTES').AsInteger) then
                    begin
                       Articulo := Trim(FieldByName('ARTICULO').AsString);
                       Stock := DMMain.DameStockArticulo(REntorno.Empresa, 1,
                          DMAgrupacionPedidosVentas.QMDetalleARTICULO.AsString, DMAgrupacionPedidosVentas.QMDetalleALMACEN.AsString);

                       {Si hay de menos}
                       if (FieldByName('UNIDADES_RESERVADAS').AsInteger >
                          FieldByName('UNIDADES_PENDIENTES').AsInteger) then
                          temp.Add(Format(_('Pedido %d - SOBRAN %d uds. del articulo %s - STOCK: %d'),
                             [FieldByName('RIG').AsInteger, FieldByName('UNIDADES_RESERVADAS').AsInteger -
                             FieldByName('UNIDADES_PENDIENTES').AsInteger, Articulo, Stock]))
                       else {Si hay de mas}
                          temp.Add(Format(_('Pedido %d - FALTAN %d uds. del articulo %s - STOCK: %d'),
                             [FieldByName('RIG').AsInteger, FieldByName('UNIDADES_PENDIENTES').AsInteger -
                             FieldByName('UNIDADES_RESERVADAS').AsInteger, Articulo, Stock]));
                    end;
                    Next;
                 end;
                 if (Marcado) then
                    DMAgrupacionPedidosVentas.Errores.AddStrings(temp);
                 temp.Clear;
              end;
              // MostrarLineasServidas(0);
           finally
              EnableControls;
           end;
        end;
     end;
  finally
     temp.Free;
  end;

  Marcado := True;
  if (DMAgrupacionPedidosVentas.Errores.Count > 0) then
  begin
     aux := _('Existen los siguientes errores, Desea seguir?') + #13#10 + #13#10;
     Rig := 0;
     while (Rig < DMAgrupacionPedidosVentas.Errores.Count) do
     begin
        aux := aux + DMAgrupacionPedidosVentas.Errores.Strings[Rig] + #13#10;
        Inc(Rig);
     end;
     Beep;
     Marcado := mrOk = MessageDlg(aux, mtWarning, [mbOK, mbCancel], 0);
  end;
  // FIN Comprobacion pedidos completos

  if (Marcado) then
  begin
     // Comprobacion stock suficiente
     if (DMMain.EstadoKri(182) = 1) then
     begin
        temp := TStringList.Create;
        try
           with DMAgrupacionPedidosVentas.QMDetalle do
           begin
              BM := DMAgrupacionPedidosVentas.QMDetalleID_DETALLES_S.AsInteger;
              DisableControls;
              try
                 First;
                 while not EOF do
                 begin
                    if (DMAgrupacionPedidosVentas.QMDetalleENTRADA_AGRUPACION.AsInteger = REntorno.Entrada) then
                    begin
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' SELECT A.ABIERTO, A.CONTROL_STOCK, F.VENTA ');
                             SQL.Add(' FROM ART_ARTICULOS A ');
                             SQL.Add(' JOIN CON_CUENTAS_GES_FAM F ON A.EMPRESA = F.EMPRESA AND A.FAMILIA = F.FAMILIA ');
                             SQL.Add(' WHERE ');
                             SQL.Add(' A.EMPRESA = :EMPRESA AND ');
                             SQL.Add(' A.ARTICULO = :ARTICULO AND ');
                             SQL.Add(' F.EJERCICIO = :EJERCICIO AND ');
                             SQL.Add(' F.CANAL = :CANAL ');
                             Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                             Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                             Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                             Params.ByName['ARTICULO'].AsString :=
                                DMAgrupacionPedidosVentas.QMDetalleARTICULO.AsString;
                             ExecQuery;
                             Abierto := (FieldByName['ABIERTO'].AsInteger = 1);
                             ControlStock := (FieldByName['CONTROL_STOCK'].AsInteger = 1);
                             PermiteStockNegativo := (FieldByName['VENTA'].AsInteger = 1);
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;

                       // Si controla stock y no permite negativos y además no es un escandallo
                       if ((ControlStock) and (not PermiteStockNegativo) and (not Abierto)) then
                       begin
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add(' SELECT SUM(UNIDADES_RESERVADAS) FROM VER_DETALLE_PEDIDO ');
                                SQL.Add(' WHERE ');
                                SQL.Add(' EMPRESA = :EMPRESA AND ');
                                SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                                SQL.Add(' CANAL = :CANAL AND ');
                                SQL.Add(' SERIE = :SERIE AND ');
                                SQL.Add(' TIPO = ''PEC'' AND ');
                                SQL.Add(' RIG = :RIG AND ');
                                SQL.Add(' CLIENTE = :CLIENTE AND ');
                                SQL.Add(' /* SERVIDO = 0 AND */ ');
                                SQL.Add(' ESTADO <> 5 AND ');
                                SQL.Add(' ENTRADA_AGRUPACION = :ENTRADA_AGRUPACION AND ');
                                SQL.Add(' ARTICULO = :ARTICULO ');
                                Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                                Params.ByName['EJERCICIO'].AsInteger :=
                                   DMAgrupacionPedidosVentas.QMDetalleEJERCICIO.AsInteger;
                                Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                                Params.ByName['SERIE'].AsString := DMAgrupacionPedidosVentas.QMDetalleSERIE.AsString;
                                Params.ByName['RIG'].AsInteger := DMAgrupacionPedidosVentas.QMDetalleRIG.AsInteger;
                                Params.ByName['CLIENTE'].AsInteger :=
                                   DMAgrupacionPedidosVentas.QMDetalleCLIENTE.AsInteger;
                                Params.ByName['ENTRADA_AGRUPACION'].AsInteger := REntorno.Entrada;
                                Params.ByName['ARTICULO'].AsString :=
                                   DMAgrupacionPedidosVentas.QMDetalleARTICULO.AsString;
                                ExecQuery;
                                Unidades := FieldByName['SUM'].AsFloat;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;

                          Existencias :=
                             DMMain.DameStockArticulo(REntorno.Empresa, 1, DMAgrupacionPedidosVentas.QMDetalleARTICULO.AsString,
                             DMAgrupacionPedidosVentas.QMDetalleALMACEN.AsString);
                          if ((Existencias < 0) or ((Existencias - Unidades) < -0.001)) then
                             temp.Add(Format('Ped. %d - Linea %d - Articulo %s: No hay stock suficiente.(Stock: %n)',
                                [DMAgrupacionPedidosVentas.QMDetalleRIG.AsInteger, DMAgrupacionPedidosVentas.QMDetalleLINEA.AsInteger,
                                DMAgrupacionPedidosVentas.QMDetalleARTICULO.AsString, Existencias]));
                       end; // abierto <> 1
                    end;
                    Next;
                 end; // while not EOF

                 // GotoBookmark(BM);
                 Posicionar(DMAgrupacionPedidosVentas.QMDetalle, 'ID_DETALLES_S', BM);
              finally
                 EnableControls;
              end;
              if (temp.Count > 0) then
              begin
                 // PermitirTraspaso sera siempre false si hay un error de stock
                 Marcado := False;
                 MessageDlg(temp.Text, mtInformation, [mbOK], 0);
              end;
           end; // with DMAgrupacionPedidosVentas.QMDetalle
        finally
           temp.Free;
        end;
     end; // if EstadoKri(182) = 1
  end;
  // FIN Comprobacion stock suficiente

  // Marcado se utiliza tambien para ver si hubo errores
  if (Marcado) then
  begin
     if (DMAgrupacionPedidosVentas.PermitirTraspaso) then
     begin
        try
           Screen.Cursor := crHourGlass;
           FInfoFacturacionAlb := TFInfoFacturacionAlb.Create(Self);
           WndList := DisableTaskWindows(FInfoFacturacionAlb.Handle);
           with FInfoFacturacionAlb do
           begin
              LBLGeneral.Caption := _('Traspasando Pedidos');
              GBProcesaCab.Caption := _('Procesando Pedido');
              LBLEjercicio.Caption := '';
              LBLCanal.Caption := '';
              LBLSerie.Caption := '';
              LBLRig.Caption := '';
              Show;
           end;

           Application.ProcessMessages;

           DMAgrupacionPedidosVentas.InicializaTraspaso;

           // Recorriendo y creando cabeceras
           with DMAgrupacionPedidosVentas.xRecorre do
           begin
              First;
              while not EOF do
              begin
                 id_s := FieldByName('ID_S').AsInteger;
                 Ejercicio := FieldByName('EJERCICIO').AsInteger;
                 Canal := FieldByName('CANAL').AsInteger;
                 Serie := FieldByName('SERIE').AsString;
                 Rig := FieldByName('RIG').AsInteger;
                 Direccion := FieldByName('DIRECCION').AsInteger;
                 with FInfoFacturacionAlb do
                 begin
                    LBLEjercicio.Caption := IntToStr(Ejercicio);
                    LBLCanal.Caption := IntToStr(Canal);
                    LBLSerie.Caption := Serie;
                    LBLRig.Caption := IntToStr(Rig) + ' (' + IntToStr(Direccion) + ')';
                 end;

                 Application.ProcessMessages;

                 DMAgrupacionPedidosVentas.GeneraCabeceras(Ejercicio, Canal, Rig, id_s, Serie,
                    Tipo, Transportista, Portes, Rango, Indice, StrToIntDef(EFCanales.Text,
                    REntorno.Canal), I_Portes, Por_Portes, DateOf(DEFechaDestino.Date) +
                    TimeOf(DTPHoraDestino.Time), Direccion, CBForzarPortes.Checked, CBDividirPorDirecciones.Checked,
                    StrToIntDef(EFDocumento.Text, 0));

                 Next;
              end;
              Close;
           end;

           // Recorremos los grupos generados
           DMAgrupacionPedidosVentas.RecorreProcesados(REntorno.Entrada);

           with FInfoFacturacionAlb do
           begin
              LBLGeneral.Caption := _('Traspasando Pedidos');
              GBProcesaCab.Caption := _('Traspasando Pedido');
           end;

           with DMAgrupacionPedidosVentas.xProcesar do
           begin
              First;
              while not EOF do
              begin
                 id_s := FieldByName('id_s').AsInteger;
                 id_s_d := FieldByName('id_s_d').AsInteger;
                 Ejercicio := FieldByName('ejercicio').AsInteger;
                 Canal := FieldByName('canal').AsInteger;
                 Serie := FieldByName('serie').AsString;
                 Rig := FieldByName('rig').AsInteger;

                 with FInfoFacturacionAlb do
                 begin
                    LBLEjercicio.Caption := IntToStr(Ejercicio);
                    LBLCanal.Caption := IntToStr(Canal);
                    LBLSerie.Caption := Serie;
                    LBLRig.Caption := IntToStr(Rig) + ' (' + IntToStr(Rig) + '->' +
                       FieldByName('seried').AsString + '/' + IntToStr(FieldByName('rigd').AsInteger) + ')';
                 end;
                 Application.ProcessMessages;
                 DMAgrupacionPedidosVentas.TraspasaPedido(id_s, id_s_d, Tipo,
                    CBDividirPorDirecciones.Checked, (StrToIntDef(EFDocumento.Text, 0) <> 0));

                 Next;
              end;
              Close;
           end;

           DMAgrupacionPedidosVentas.RecorreFacturados(DMAgrupacionPedidosVentas.Proceso_auto);
           with FInfoFacturacionAlb do
           begin
              LBLGeneral.Caption := _('Actualizando Precios');
              GBProcesaCab.Caption := _('Procesando Artículo');
           end;
           with DMAgrupacionPedidosVentas.xFacturados do
           begin
              First;
              while not EOF do
              begin
                 Articulo := FieldByName('ARTICULO').AsString;
                 with FInfoFacturacionAlb do
                 begin
                    LTitEjercicio.Caption := _('Código') + ' :';
                    LTitCanal.Caption := '';
                    LTitSerie.Caption := '';
                    LTitRIG.Caption := '';
                    LBLEjercicio.Caption := Articulo;
                    LBLCanal.Caption := '';
                    LBLSerie.Caption := '';
                    LBLRig.Caption := '';
                 end;
                 Application.ProcessMessages;
                 DMAgrupacionPedidosVentas.ActualizaPrecio(Articulo, DMAgrupacionPedidosVentas.Proceso_auto);

                 Next;
              end;
              Close;
           end;

           DMAgrupacionPedidosVentas.RecorreProcesados(REntorno.Entrada);
           with FInfoFacturacionAlb do
           begin
              LBLGeneral.Caption := _('Ajustando Pedidos');
              GBProcesaCab.Caption := _('Ajustando Pedido');
              LTitEjercicio.Caption := _('Ejercicio') + ':';
              LTitCanal.Caption := _('Canal') + ':';
              LTitSerie.Caption := _('Serie') + ':';
              LTitRIG.Caption := _('RIG');
           end;

           with DMAgrupacionPedidosVentas.xProcesar do
           begin
              First;
              while not EOF do
              begin
                 id_s := FieldByName('id_s').AsInteger;
                 id_s_d := FieldByName('id_s_d').AsInteger;
                 Ejercicio := FieldByName('ejercicio').AsInteger;
                 Canal := FieldByName('canal').AsInteger;
                 Serie := FieldByName('serie').AsString;
                 Rig := FieldByName('rig').AsInteger;
                 with FInfoFacturacionAlb do
                 begin
                    LBLEjercicio.Caption := IntToStr(Ejercicio);
                    LBLCanal.Caption := IntToStr(Canal);
                    LBLSerie.Caption := Serie;
                    LBLRig.Caption := IntToStr(Rig);
                 end;
                 Application.ProcessMessages;
                 DMAgrupacionPedidosVentas.ActualizaPedidos(id_s, id_s_d);

                 Next;
              end;
              Close;
           end;
        finally
           with FInfoFacturacionAlb do
           begin
              LBLGeneral.Caption := _('Borrando temporales');
              GBProcesaCab.Caption := 'Borrando temporales';
              LBLEjercicio.Caption := '';
              LBLCanal.Caption := '';
              LBLSerie.Caption := '';
              LBLRig.Caption := '';
           end;
           Application.ProcessMessages;
           DMAgrupacionPedidosVentas.BorraTemporales;
           Screen.Cursor := crDefault;
           EnableTaskWindows(WndList);
           FInfoFacturacionAlb.Close;

           CambiaCanal := (StrToIntDef(EFCanales.Text, REntorno.Canal) <> REntorno.Canal);

           DMAgrupacionPedidosVentas.Final(DMAgrupacionPedidosVentas.Proceso_auto,
              StrToIntDef(EFCanales.Text, REntorno.Canal),
              Tipo, DMAgrupacionPedidosVentas.SerieDestino);

           // Reseteamos el estado de los botones
           // TButtMarcarTodasProcClick(Self);
           RefrescarDatos(StrToIntDef(EFCliente.Text, 0));

           if (CambiaCanal) then
              Close;
        end;
     end
     else
        raise Exception.Create('Las unidades enviadas no coinciden con las definidas en los lotes. No se puede traspasar');
  end; // Marcado - Control de Stock suficiente
end;

procedure TFMAgrupacionPedidosVentas.TButtDesmarcarTodasProcClick(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMAgrupacionPedidosVentas.MarcarLineasPedidosProc(0);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMAgrupacionPedidosVentas.MIMarcarTodasClick(Sender: TObject);
begin
  inherited;

  // Tag 1:Todas - 2:Linea completa - 3:Linea Parcial
  try
     Screen.Cursor := crHourGlass;
     DMAgrupacionPedidosVentas.MarcarLineasPedidosProc(TMenuItem(Sender).Tag);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMAgrupacionPedidosVentas.EArticuloKeyPress(Sender: TObject; var Key: char);
var
  Articulo : string;
begin
  if ((Trim(EArticulo.Text) <> '') and (Key = #13)) then
  begin
     Articulo := DameArticuloBarras(Trim(EArticulo.Text));
     if (Articulo = '') then
        Articulo := Trim(EArticulo.Text);

     DMAgrupacionPedidosVentas.AgregaArticulo(Articulo, StrToIntDef(EPedido.Text, 0));
  end;
end;

procedure TFMAgrupacionPedidosVentas.TButtLectorClick(Sender: TObject);
var
  Archivo : TextFile;
  DirOri, s, Campo : string;
  ArticuloLeido, LoteLeido, CantidadLeida : string;
  Articulo, Lote : string;
  IdLote : integer;
  Cantidad : double;
  // c : integer;
  i : integer;
  // fecha : TDateTime;
  // aux : char;
  ArchivoLog : TextFile;
  FechaLog : string;
begin
  DirOri := REntorno.DirectorioLector;

  FechaLog := FormatDateTime('yymmdd_hhnnss', Now);
  AssignFile(ArchivoLog, DirOri + 'AgrPEC' + '_' + FechaLog + '.log');
  try
     Rewrite(ArchivoLog);
     WriteLn(ArchivoLog, 'Agrupacion de Pedidos de Cliente ');
     WriteLn(ArchivoLog, 'Cliente (' + EFCliente.Text + ') ' + DBETitClientes.Text);
     WriteLn(ArchivoLog, '--------------------------------------------------');

     AssignFile(Archivo, DirOri + 'Pedido.txt');
     Reset(Archivo);
     try
        while (not EOF(Archivo)) do
        begin
           Articulo := '';
           Lote := '';
           IdLote := 0;
           Cantidad := 0;

           ReadLn(Archivo, s);
           WriteLn(ArchivoLog, s);

           i := Pos(',', s);
           if (i > 0) then
              Campo := Copy(s, 1, i - 1)
           else
              Campo := s;
           // fecha := StrToDateTime(campo + ' ' + Copy(s, i + 1, j - 1));
           s := Copy(s, i + 1, Length(s));

           i := Pos(',', s);
           if (i > 0) then
              Campo := Copy(s, 1, i - 1)
           else
              Campo := s;
           // fecha := RecodeTime(fecha, StrToInt(copy(campo,1,2)), StrToInt(copy(campo,4,2)), StrToInt(copy(campo,7,2)), 0);
           s := Copy(s, i + 1, Length(s));

           i := Pos(',', s);
           if (i > 0) then
              Campo := Copy(s, 1, i - 1)
           else
              Campo := s;
           ArticuloLeido := Trim(Campo);
           s := Copy(s, i + 1, Length(s));

           i := Pos(',', s);
           if (i > 0) then
              Campo := Copy(s, 1, i - 1)
           else
              Campo := s;
           LoteLeido := Trim(Campo);
           s := Copy(s, i + 1, Length(s));

           i := Pos(',', s);
           if (i > 0) then
              Campo := Copy(s, 1, i - 1)
           else
              Campo := s;
           CantidadLeida := Trim(campo);
           s := Copy(s, i + 1, Length(s));

           // Primero veo si el articulo leido es un codigo de barras
           Articulo := DameArticuloBarras(ArticuloLeido);
           if (Articulo <> '') then
              WriteLn(ArchivoLog, 'Articulo: ' + Articulo + ' (Cod. Barras leido: ' + ArticuloLeido + ')')
           else
           if (DameTituloArticulo(ArticuloLeido) > '') then
           begin
              Articulo := ArticuloLeido;
              WriteLn(ArchivoLog, 'Articulo: ' + Articulo);
           end
           else
           begin
              WriteLn(ArchivoLog, '*** No encuentro articulo: ' + ArticuloLeido);
              Articulo := '';
           end;

           // Si encuentro el articulo
           if (Articulo > '') then
           begin
              if ArticuloLoteable(Articulo) then
              begin
                 IdLote := DameIDLote(Articulo, LoteLeido);
                 if (IdLote <> 0) then
                 begin
                    Lote := LoteLeido;
                    WriteLn(ArchivoLog, 'Id Lote: ' + IntToStr(IdLote) + ' (Lote leido: ' + LoteLeido + ')');
                 end
                 else
                 begin
                    WriteLn(ArchivoLog, '*** No encuentro lote: ' + LoteLeido);
                    Lote := '';
                    ShowMessage(Format(_('No encuentro el lote leido: %s - Articulo: %s' +
                       #13#10 + 'Deberá agregarlo manualmente'), [LoteLeido, Articulo]));
                 end;
              end;

              Cantidad := StrToFloatDec(CantidadLeida, '.');
              if (Cantidad > 0) then
                 WriteLn(ArchivoLog, 'Cantidad: ' + FloatToStrDec(Cantidad, '.', '0.00') +
                    ' (Cantidad leida: ' + CantidadLeida + ')')
              else
              begin
                 WriteLn(ArchivoLog, '*** No interpreto cantidad: ' + CantidadLeida);
                 Cantidad := 0;
                 ShowMessage(Format(_('No interpreto la cantidad leida: %s - Articulo: %s' +
                    #13#10 + 'Deberá agregarlo manualmente'), [CantidadLeida, Articulo]));
              end;

              DMAgrupacionPedidosVentas.AgregaArticulo(Articulo, 0, IdLote, Cantidad);
           end
           else
           begin
              ShowMessage(Format(_('No encuentro el articulo leido: %s x %d - Lote: %s' +
                 #13#10 + 'Deberá agregarlo manualmente'), [ArticuloLeido, Cantidad, LoteLeido]));
           end;
        end;
     finally
        CloseFile(Archivo);
     end;
  finally
     CloseFile(ArchivoLog);
  end;

  CopyFileTo(DirOri + 'Pedido.txt', DirOri + 'AgrPEC' + '_' + FormatDateTime('yymmdd_hhnnss', Now) + '.txt');

  try
     Rewrite(Archivo);
  finally
     CloseFile(Archivo);
  end;
end;

procedure TFMAgrupacionPedidosVentas.EFTransportistaChange(Sender: TObject);
begin
  if (StrToIntDef(EFTransportista.Text, 0) <> 0) then
     ETituloTransportista.Text := DameTituloAcreedor(StrToIntDef(EFTransportista.Text, 0))
  else
  begin
     if param_AGRPEDC001 then
        ETituloTransportista.Text := _('Se obtendrá el transportista del pedido.')
     else
        ETituloTransportista.Text := _('Se obtendrá el valor por defecto para el cliente.');
  end;
end;

procedure TFMAgrupacionPedidosVentas.DamePortesCliente(Cliente: integer);
var
  Tipo_Portes, Rango, Indice : integer;
  I_Portes, Por_Portes : double;
begin
  DMAgrupacionPedidosVentas.DamePortesCliente(Cliente, Tipo_Portes, Rango, Indice, I_Portes, Por_Portes);
  EFPortes.Text := IntToStr(Tipo_Portes);
  EIPortes.Text := FloatToStr(I_Portes);
  EPorPortes.Text := FloatToStr(Por_Portes);
  EFRango.Text := IntToStr(Rango);
  EFIndice.Text := IntToStr(Indice);
end;

procedure TFMAgrupacionPedidosVentas.EFPortesChange(Sender: TObject);
begin
  if ((EFPortes.Text <> '')) then
  begin
     CamposVisibles(4 >= (StrToInt(EFPortes.Text)));

     if ((StrToInt(EFPortes.Text) <= 2) or (StrToInt(EFPortes.Text) > 4)) then
     begin
        EPorPortes.Text := '0';
        EPorPortes.Color := clInfoBk;
        EPorPortes.Enabled := False;
        EPorPortes.Font.Color := clgrayText;

        EIPortes.Text := '0';
        EIPortes.Color := clInfoBk;
        EIPortes.Enabled := False;
        EIPortes.Font.Color := clgrayText;
     end
     else
     if (StrToInt(EFPortes.Text) = 3) then
     begin
        EPorPortes.Color := clWindow;
        EPorPortes.Enabled := True;
        EIPortes.Color := clInfoBk;
        EIPortes.Enabled := False;
        EPorPortes.Font.Color := clWindowText;
        EIPortes.Font.Color := clgrayText;
     end;
     if (StrToInt(EFPortes.Text) = 4) then
     begin
        EPorPortes.Color := clInfoBk;
        EPorPortes.Enabled := False;
        EIPortes.Color := clWindow;
        EIPortes.Enabled := True;
        EIPortes.Font.Color := clWindowText;
        EPorPortes.Font.Color := clGrayText;
     end;
  end;

  if (EFPortes.Text <> '') then
     DMAgrupacionPedidosVentas.CambiaPortes(StrToIntDef(EFPortes.Text, 0));
end;

procedure TFMAgrupacionPedidosVentas.CamposVisibles(Visible: boolean);
begin
  LBPorPortes.Visible := Visible;
  EPorPortes.Visible := Visible;
  LBIPortes.Visible := Visible;
  EIPortes.Visible := Visible;
  LBRango.Visible := not (Visible);
  EFRango.Visible := not (Visible);
  DBETituloRango.Visible := not (Visible);
  LBIndice.Visible := not (Visible);
  EFIndice.Visible := not (Visible);
  DBETituloIndice.Visible := not (Visible);
  if (EFIndice.Visible) then
     EFIndice.Text := '';
  if (EFRango.Visible) then
     EFRango.Text := '';
end;

procedure TFMAgrupacionPedidosVentas.EFRangoChange(Sender: TObject);
var
  Habilita : boolean;
begin
  EFIndice.Text := '';
  DMAgrupacionPedidosVentas.CambiaRango(StrToIntDef(EFRango.Text, 0), Habilita);
  EFIndice.Enabled := Habilita;
end;

procedure TFMAgrupacionPedidosVentas.EFIndiceChange(Sender: TObject);
begin
  DMAgrupacionPedidosVentas.CambiaIndice(StrToIntDef(EFRango.Text, 0), StrToIntDef(EFIndice.Text, 0));
end;

procedure TFMAgrupacionPedidosVentas.EFIndiceBusqueda(Sender: TObject);
begin
  EFIndice.CondicionBusqueda := ' RANGO=' + EFRango.Text;
end;

procedure TFMAgrupacionPedidosVentas.DeshabilitaPortes;
begin
  EFTransportista.Text := '';
  EFPortes.Text := '';
  EPorPortes.Text := '';
  EIPortes.Text := '';
  EFRango.Text := '';
  EFIndice.Text := '';
  GBPortes.Enabled := False;
  CamposVisibles(True);
end;

procedure TFMAgrupacionPedidosVentas.CompruebaPortes;
begin
  { Puede ser vacío. En ese caso creará el albarán con el transportista por defecto según dirección -> cliente -> min(transportista)
  if (EFTransportista.Text = '') then
     raise Exception.Create(_('El campo transportista no puede ser vacio'));
  }
  if (EFPortes.Text = '') then
     raise Exception.Create(_('El campo portes no puede ser vacio'))
  else
  if ((StrToInt(EFPortes.Text) > 4) and ((EFRango.Text = '') or (EFIndice.Text = ''))) then
     raise Exception.Create(_('Los campos rango/indice no pueden ser vacios'));
end;

procedure TFMAgrupacionPedidosVentas.EFRangoBusqueda(Sender: TObject);
var
  Str : string;
begin
  inherited;
  if (StrToInt(EFPortes.Text) in [5, 6, 7]) then
  begin
     if (StrToInt(EFPortes.Text) = 5) then // Rateo por pesos
        Str := ' TIPO=1';
     if (StrToInt(EFPortes.Text) = 6) then // Rateo por importes
        Str := ' TIPO=2';
     if (StrToInt(EFPortes.Text) = 7) then // Rateo por bultos
        Str := ' TIPO=3';
     EFRango.CondicionBusqueda := Str;
  end;
end;

procedure TFMAgrupacionPedidosVentas.EFCanalesChange(Sender: TObject);
begin
  DMAgrupacionPedidosVentas.DameTituloCanal(StrToIntDef(EFCanales.Text, REntorno.Canal));
end;

procedure TFMAgrupacionPedidosVentas.CBSeriesChange(Sender: TObject);
var
  Serie : string;
begin
  if (CBSeries.Text <> '') then
  begin
     // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
     Serie := CBSeries.Items[CBSeries.ItemIndex];
     Serie := Copy(Serie, 1, Pos(' ', Serie) - 1);
     DMAgrupacionPedidosVentas.SetSerie(Serie);
     DMAgrupacionPedidosVentas.RefrescarPedidos;
  end;
end;

procedure TFMAgrupacionPedidosVentas.RefrescarDatos(Cliente: integer);
begin
  DeshabilitaPortes;

  // Primero desmarco, porque el Entorno de Busqueda tiene el cliente anterior
  DMAgrupacionPedidosVentas.DesmarcarEntradas;

  // Ahora establezco el Entorno de Busqueda
  DMAgrupacionPedidosVentas.SetCliente(Cliente);

  try
     DMAgrupacionPedidosVentas.RefrescarPedidos;
     if not (DMAgrupacionPedidosVentas.xClientes.FieldByName('NOMBRE_R_SOCIAL').IsNull) then
     begin
        GBPortes.Enabled := True;
        EFTransportista.Text := ''; // IntToStr(DMAgrupacionPedidosVentas.DameMinTransportista(Cliente));
        DamePortesCliente(Cliente);
     end;
  except
  end;

  // Actualizo hora de recepcion/documento
  DTPHoraRecepcion.Time := Now;
  DTPHoraDestino.Time := Now;
end;

procedure TFMAgrupacionPedidosVentas.FormResize(Sender: TObject);
begin
  if (DBGFCabeceraHojaPreparacion.Height > PNLHojaPreparacion.Height) then
     DBGFCabeceraHojaPreparacion.Height := PNLHojaPreparacion.Height div 2;
end;

procedure TFMAgrupacionPedidosVentas.BFiltrarSeleccionClick(Sender: TObject);
begin
  DMAgrupacionPedidosVentas.FiltraPedidos(StrToIntDef(EPedidoSeleccionDesde.Text, 0),
     StrToIntDef(EPedidoSeleccionHasta.Text, 0), EFPaisSeleccion.Text, StrToIntDef(EDireccionSeleccion.Text, 0),
     EArticuloSeleccion.Text, CBSoloListoPreparar.Checked);
end;

procedure TFMAgrupacionPedidosVentas.BEnviarSeleccionClick(Sender: TObject);
begin
  DMAgrupacionPedidosVentas.EnviaPedidosFiltrados;
end;

procedure TFMAgrupacionPedidosVentas.BLimpiarSeleccionClick(Sender: TObject);
begin
  EPedidoSeleccionDesde.Text := '';
  EPedidoSeleccionHasta.Text := '';
  EFPaisSeleccion.Text := '';
  EDireccionSeleccion.Text := '';
  EArticuloSeleccion.Text := '';
  Application.ProcessMessages;
  BFiltrarSeleccion.Click;
end;

procedure TFMAgrupacionPedidosVentas.EArticuloExit(Sender: TObject);
var
  aux, art : string;
begin
  if (Trim(EArticulo.Text) <> '') then
  begin
     art := DameArticuloBarras(EArticulo.Text);

     if (art <> '') then
        aux := DameTituloArticulo(art)
     else
     begin
        art := EArticulo.Text;
        aux := DameTituloArticulo(EArticulo.Text);
     end;
     EArticulo.Text := '';
     EArticulo.SetFocus;
     DMAgrupacionPedidosVentas.AgregaArticulo(art, StrToIntDef(EPedido.Text, 0));
  end;
end;

procedure TFMAgrupacionPedidosVentas.SBAClientesDblClick(Sender: TObject);
begin
  ACliente.Execute;
end;

procedure TFMAgrupacionPedidosVentas.AClienteExecute(Sender: TObject);
begin
  if (StrToIntDef(EFCliente.Text, 0) <> 0) then
     FMain.EjecutaAccion(FMain.Aclientes, 'CLIENTE=' + EFCliente.Text);
end;

procedure TFMAgrupacionPedidosVentas.EPedidoSeleccionDesdeExit(Sender: TObject);
begin
  if (EPedidoSeleccionHasta.Text = '') then
     EPedidoSeleccionHasta.Text := EPedidoSeleccionDesde.Text;
end;

procedure TFMAgrupacionPedidosVentas.DBGFind2000PedidosDblClick(Sender: TObject);
begin
  if (UpperCase(ColActual.FieldName) = 'RIG') then
     FMain.TraspasoDeDocumentosSalida(DMAgrupacionPedidosVentas.QMDetalleID_S.AsInteger);
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
     FMain.EjecutaAccion(FMain.AArticulos, 'Articulo = ''' +
        DMAgrupacionPedidosVentas.QMDetalleARTICULO.AsString + '''');
end;

procedure TFMAgrupacionPedidosVentas.DBGFind2000PedidosCellClick(Column: TColumn);
begin
  ColActual := Column;
end;

procedure TFMAgrupacionPedidosVentas.DBGFind2000PedidosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  Fecha : TDateTime;
begin
  if ((UpperCase(Column.FieldName) = 'RIG') or (UpperCase(Column.FieldName) = 'ARTICULO')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     // Coloreamos la linea segun condiciones
     if (DMAgrupacionPedidosVentas.QMDetallePEDIR.AsInteger = 1) then
        ColorBloqueado(Canvas);

     // Coloreamos celdas especificas
     if (UpperCase(Column.FieldName) = 'STOCK') then
     begin
        if (CBCalcularStock.Checked) then
        begin
           if (Abs(DMAgrupacionPedidosVentas.QMDetalleUNIDADES_RESERVADAS.AsFloat) > 0.01) then
           begin
              if ((DMAgrupacionPedidosVentas.QMDetalleSTOCK.AsFloat -
                 DMAgrupacionPedidosVentas.QMDetalleUNIDADES_RESERVADAS.AsFloat) >= 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           begin
              if ((DMAgrupacionPedidosVentas.QMDetalleSTOCK.AsFloat -
                 DMAgrupacionPedidosVentas.QMDetalleUNIDADES_PENDIENTES.AsFloat) >= 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end;
        end
        else
           ColorInactivo(Canvas);
     end
     else
     if (UpperCase(Column.FieldName) = 'UNIDADES_RESERVADAS') then
     begin
        if (CBCalcularStock.Checked) then
        begin
           if (DMAgrupacionPedidosVentas.QMDetalleUNIDADES_RESERVADAS.AsFloat = 0) then
              ColorEdicion(Canvas)
           else
           begin
              if ((DMAgrupacionPedidosVentas.QMDetalleSTOCK.AsFloat -
                 DMAgrupacionPedidosVentas.QMDetalleUNIDADES_RESERVADAS.AsFloat) < 0) then
                 ColorError(Canvas);
           end;
        end
        else
           ColorInactivo(Canvas);
     end
     else
     if (UpperCase(Column.FieldName) = 'STOCK_MINIMO') then
     begin
        if (CBCalcularStock.Checked) then
        begin
           if (DMAgrupacionPedidosVentas.QMDetalleSTOCK.AsFloat -
              DMAgrupacionPedidosVentas.QMDetalleUNIDADES_RESERVADAS.AsFloat >=
              DMAgrupacionPedidosVentas.QMDetalleSTOCK_MINIMO.AsFloat) then
              ColorResaltado2(Canvas)
           else
              ColorResaltado3(Canvas);
        end
        else
           ColorInfo(Canvas);
     end
     else
     if (UpperCase(Column.FieldName) = 'PEDIDOS_A_PRO') then
     begin
        if (CBCalcularPedidosProv.Checked) then
        begin
           if (DMAgrupacionPedidosVentas.QMDetalleUNIDADES_RESERVADAS.AsFloat <> 0) then
           begin
              if ((DMAgrupacionPedidosVentas.QMDetallePEDIDOS_A_PRO.AsFloat -
                 DMAgrupacionPedidosVentas.QMDetalleUNIDADES_RESERVADAS.AsFloat) > 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           begin
              if ((DMAgrupacionPedidosVentas.QMDetallePEDIDOS_A_PRO.AsFloat -
                 DMAgrupacionPedidosVentas.QMDetalleUNIDADES_PENDIENTES.AsFloat) >= 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end;
        end
        else
           ColorInactivo(Canvas);
     end
     else
     if (UpperCase(Column.FieldName) = 'ID_LOTE') then
     begin
        if (DMAgrupacionPedidosVentas.QMDetalleLOTES.AsInteger = 1) then
           ColorInfo(Canvas)
        else
           ColorInactivo(Canvas);
     end
     else
     if (Column.FieldName = 'FECHA_ENTREGA_PREV') then
     begin
        Fecha := DMAgrupacionPedidosVentas.QMDetalleFECHA_ENTREGA_PREV.AsDateTime;
        if (Fecha < Today) then
           ColorError(Canvas)
        else
        if (Fecha >= Today) and (Fecha < Tomorrow) then
           ColorResaltado(Canvas)
        else
           ColorInfo(Canvas);
     end
     else
     if (Column.FieldName = 'PRECIO') then
     begin
        if (DMAgrupacionPedidosVentas.QMDetallePRECIO.AsFloat = 0) then
           ColorBloqueado(Canvas);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMAgrupacionPedidosVentas.DBGFind2000PedidosKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_F3) then
  begin
     if (TDBGridFind2000(Sender).ColumnaActual = 'ID_LOTE') then
        DMAgrupacionPedidosVentas.InfoLotes;
     Key := 0;
  end;
end;

procedure TFMAgrupacionPedidosVentas.FormShow(Sender: TObject);
var
  i, p : integer;
begin
  inherited;

  p := EncuentraField(DBGFind2000Pedidos, 'ENTRADA_AGRUPACION');

  i := EncuentraField(DBGFind2000Pedidos, 'STOCK');
  if (i >= 0) then
     DBGFind2000Pedidos.Columns.Items[i].Visible := True
  else
  begin
     with DBGFind2000Pedidos.Columns.Add do
     begin
        FieldName := 'STOCK';
        Title.Caption := _('Stock');
        Visible := True;
        Index := p + 1;
     end;
  end;

  i := EncuentraField(DBGFind2000Pedidos, 'STOCK_MINIMO');
  if (i >= 0) then
     DBGFind2000Pedidos.Columns.Items[i].Visible := True
  else
  begin
     with DBGFind2000Pedidos.Columns.Add do
     begin
        FieldName := 'STOCK_MINIMO';
        Title.Caption := _('Stock Min.');
        Visible := True;
        Index := p + 2;
     end;
  end;

  i := EncuentraField(DBGFind2000Pedidos, 'PEDIDOS_A_PRO');
  if (i >= 0) then
     DBGFind2000Pedidos.Columns.Items[i].Visible := True
  else
  begin
     with DBGFind2000Pedidos.Columns.Add do
     begin
        FieldName := 'PEDIDOS_A_PRO';
        Title.Caption := _('Ped. Prov.');
        Visible := True;
        Index := p + 3;
     end;
  end;

  DMAgrupacionPedidosVentas.CalculaStock := CBCalcularStock.Checked;
  DMAgrupacionPedidosVentas.PedidosProv := CBCalcularPedidosProv.Checked;
end;

procedure TFMAgrupacionPedidosVentas.CBCalcularStockChange(Sender: TObject);
begin
  inherited;
  DMAgrupacionPedidosVentas.CalculaStock := CBCalcularStock.Checked;
  DMAgrupacionPedidosVentas.PedidosProv := CBCalcularPedidosProv.Checked;
  TButtRegenera.Click;

  MIMarcarTodasStockSuficiente.Enabled := CBCalcularStock.Checked;
  MIMarcarTodasServirParcialmente.Enabled := CBCalcularStock.Checked;
end;

procedure TFMAgrupacionPedidosVentas.EFSeleccionKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
     BFiltrarSeleccion.Click;
end;

procedure TFMAgrupacionPedidosVentas.EFDocumentoBusqueda(Sender: TObject);
begin
  EFDocumento.CondicionBusqueda := 'ESTADO=0 AND TIPO=''ALB'' AND EJERCICIO<=' +
     REntorno.EjercicioStr + ' AND CLIENTE=' + EFCliente.Text;
  if (StrToIntDef(EFDocumento.Text, 0) <> 0) then
     EFDocumento.CondicionBusqueda := EFDocumento.CondicionBusqueda + ' AND CANAL=' + EFCanales.Text;
end;

procedure TFMAgrupacionPedidosVentas.EFDocumentoChange(Sender: TObject);
begin
  inherited;
  if (StrToIntDef(EFDocumento.Text, 0) <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT TIPO||'' ''||EJERCICIO||''-''||SERIE||''/''||RIG DESC_DOCUMENTO FROM GES_CABECERAS_S WHERE ID_S = :ID_S';
           Params.ByName['ID_S'].AsInteger := StrToIntDef(EFDocumento.Text, 0);
           ExecQuery;
           EDescripcionDocumento.Text := FieldByName['DESC_DOCUMENTO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TFMAgrupacionPedidosVentas.CBSoloListoPrepararChange(Sender: TObject);
begin
  inherited;
  BFiltrarSeleccion.Click;
end;

procedure TFMAgrupacionPedidosVentas.AAsignacionCodigoBarraExecute(Sender: TObject);
{$IFNDEF TPV}
var
  IdDetallesS : integer;
  ListaIdArticulo : string;
{$ENDIF}
begin
  inherited;
{$IFNDEF TPV}
  ListaIdArticulo := '';

  // Genero listad de ID_A
  with DMAgrupacionPedidosVentas.QMDetalle do
  begin
     if Active then
     begin
        IdDetallesS := FieldByName('ID_DETALLES_S').AsInteger;
        DisableControls;
        try
           First;
           if not EOF then
           begin
              ListaIdArticulo := FieldByName('ID_A').AsString;
              Next;
           end;
           while not EOF do
           begin
              ListaIdArticulo := ListaIdArticulo + ', ' + FieldByName('ID_A').AsString;
              Next;
           end;

           Posicionar(DMAgrupacionPedidosVentas.QMDetalle, 'ID_DETALLES_S', IdDetallesS);
        finally
           EnableControls;
        end;
     end;
  end;

  if (ListaIdArticulo > '') then
  begin
     AbreForm(TFMAsignacionCodigoBarra, FMAsignacionCodigoBarra);
     FMAsignacionCodigoBarra.Filtrar('ID_A IN (' + ListaIdArticulo + ')');
  end;
{$ENDIF}
end;

procedure TFMAgrupacionPedidosVentas.B_SERVIRClick(Sender: TObject);
begin
  if (Trim(EArticuloServir.Text) = '') then
  begin
     ShowMessage('Debe indicar el Artículo a Servir');
     Activecontrol := EArticuloServir;
     Exit;
  end;

  if (StrToFloatDef(ECantidadServir.Text, -1) = -1) then
  begin
     ShowMessage('Debe indicar la Cantidad a Servir');
     Activecontrol := ECantidadServir;
     Exit;
  end;

  // DMAgrupacionPedidosVentas.FiltraPedidos(StrToIntDef(EPedidoSeleccionDesde.Text, 0), StrToIntDef(EPedidoSeleccionHasta.Text, 0), EFPaisSeleccion.Text, StrToIntDef(EDireccionSeleccion.Text, 0), EArticuloServir.Text, CBSoloListoPreparar.Checked);

  DMAgrupacionPedidosVentas.ServirArticulo(Trim(EArticuloServir.Text), StrToFloat(ECantidadServir.Text));
end;

procedure TFMAgrupacionPedidosVentas.AImportarExcelExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  Archivo := '';
  if (MyOpenDialog(Archivo, 'XLS,ODS,CSV,ALL', '', 'FMAgrupacionPedidosVentas-AImportarExcel')) then
  begin
     DMAgrupacionPedidosVentas.ImportarXLS(Archivo);
  end;
end;

procedure TFMAgrupacionPedidosVentas.BAlbaranYEtiqTransporteClick(Sender: TObject);
(*
var
  ImprimirDocDestino : boolean;
  IdPEC, IdALB, Bultos : integer;
  SuReferencia : string;
  Peso : double;
  Expedicion : string;
  FicheroPeticion, FicheroRespuesta, RespuestaError, RutaGLS, RutaGLS_2, FicheroRespuestaSOAPRequest, FicheroRespuestaSOAPResponse : string;
  HoraEnvioFichero : TDateTime;
  Servicio, Horario : string;
  Resultado : word;
  TerceroAlb, DireccionAlb : integer;
  RazonSocial, Nombre, Direccion, Poblacion, Provincia, Pais, CP, Telefono, Movil, Email, Departamento, Observaciones : string;
  i : integer;
  sl : TStrings;
*)
begin
  inherited;
  (*
  Servicio := Trim(Copy(CBServicio.Text, 1, Pos('-', CBServicio.Text) - 1));
  Horario := Trim(Copy(CBHorario.Text, 1, Pos('-', CBHorario.Text) - 1));
  Bultos := StrToIntDef(EBultos.Text, -1);
  Peso := StrToFloatDef(EPeso.Text, -1);
  RutaGLS := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
  RutaGLS_2 := IncludeTrailingPathDelimiter(LeeDatoIni('GLS', 'RutaCopiaEtiqueta', ''));

  if (DMServirPedidosVenta.CantidadMarcados <> 1) then
     ShowMessage(_('Solo se puede servir de a un solo pedido en esta opcion'))
  else
  if (not DMServirPedidosVenta.LotesSimplesAsignados) then
     ShowMessage(_('Falta asignar Nro. Serie / Lote'))
  else
  if (Bultos = -1) then
     ShowMessage(_('La cantidad de bultos no esta definida'))
  else
  if (Peso = -1) then
     ShowMessage(_('El peso no esta definido'))
  else
  if (not FileExists(RutaGLS + 'GLS.exe')) then
     ShowMessage(_('No se encuentra ' + RutaGLS + 'GLS.exe'))
  else
  begin
     // ImprimirDocDestino := CBImprimirDocDestino.Checked;
     try
        // CBImprimirDocDestino.Checked := True;
        // Posicionar(DMServirPedidosVenta.QMPedidos, 'ENTRADA_AGRUPACION', REntorno.Entrada);
        IdPEC := DMServirPedidosVenta.QMPedidos.FieldByName('ID_S').AsInteger;
        SuReferencia := DMServirPedidosVenta.QMPedidos.FieldByName('SU_REFERENCIA').AsString;

        try
           // Automatico := True;
           TButtCerrarYMarcarPedido.Click;
        finally
           // Automatico := False;
        end;

        DMServirPedidosVenta.DameAlbaranDestino(IdPEC, IdALB, TerceroAlb, DireccionAlb);

        // Crear Peticion GLS e imprimir la etiqueta
        FicheroPeticion := RutaGLS + 'GLSPeticion-' + IntToStr(IdALB) + '.ini';
        with TIniFile.Create(FicheroPeticion) do
        begin
           try
              WriteString('Peticion', 'Nombre', 'GrabaServicio');

              WriteString('Servicio', 'Servicio', Servicio);
              WriteString('Servicio', 'Horario', Horario);
              WriteInteger('Servicio', 'Bultos', Bultos);
              WriteFloat('Servicio', 'Peso', Peso);

              DMServirPedidosVenta.DameDireccionTercero(REntorno.Tercero, 0, RazonSocial, Nombre, Direccion, Poblacion, Provincia, Pais, CP, Telefono, Movil, Email, Departamento, Observaciones);

              Nombre := LeeDatoIni('GLS', 'Remitente-Nombre', RazonSocial);
              Direccion := LeeDatoIni('GLS', 'Remitente-Direccion', Direccion);
              Poblacion := LeeDatoIni('GLS', 'Remitente-Poblacion', Poblacion);
              Pais := LeeDatoIni('GLS', 'Remitente-Pais', '34');
              CP := LeeDatoIni('GLS', 'Remitente-CP', CP);
              Telefono := LeeDatoIni('GLS', 'Remitente-Telefono', Telefono);
              Movil := LeeDatoIni('GLS', 'Remitente-Movil', Movil);
              Email := LeeDatoIni('GLS', 'Remitente-Email', Email);
              Departamento := LeeDatoIni('GLS', 'Remitente-Departamento', Departamento);
              Observaciones := LeeDatoIni('GLS', 'Remitente-Observaciones', Observaciones);

              WriteString('Remite', 'Nombre', Nombre);
              WriteString('Remite', 'Direccion', Direccion);
              WriteString('Remite', 'Poblacion', Poblacion);
              WriteString('Remite', 'Pais', Pais);
              WriteString('Remite', 'CP', CP);
              WriteString('Remite', 'Telefono', Telefono);
              WriteString('Remite', 'Movil', Movil);
              WriteString('Remite', 'Email', Email);
              WriteString('Remite', 'Departamento', Departamento);
              WriteString('Remite', 'Observaciones', Observaciones);

              DMServirPedidosVenta.DameDireccionTercero(TerceroAlb, DireccionAlb, RazonSocial, Nombre, Direccion, Poblacion, Provincia, Pais, CP, Telefono, Movil, Email, Departamento, Observaciones);

              // Para GLS, si el país es Andorra, se debe poner como España + CP=87111
              // Correo de Daniel Martin (KombatPadel) 27/01/2025 17:50
              if (Pais = '376') then
              begin
                 Pais := '34';
                 CP := '87111';
              end;

              WriteString('Destinatario', 'Nombre', Nombre);
              WriteString('Destinatario', 'Direccion', Direccion);
              WriteString('Destinatario', 'Poblacion', Poblacion);
              WriteString('Destinatario', 'Pais', Pais);
              WriteString('Destinatario', 'CP', CP);
              WriteString('Destinatario', 'Telefono', Telefono);
              WriteString('Destinatario', 'Movil', Movil);
              WriteString('Destinatario', 'Email', Email);
              WriteString('Destinatario', 'Departamento', Departamento);
              WriteString('Destinatario', 'Observaciones', Observaciones);
              WriteString('Destinatario', 'ATT', '');

              WriteString('Referencia', 'Tipo0', '');
              WriteInteger('Referencia', 'TipoC', IdALB);
              WriteString('Referencia', 'TipoG', '');
              WriteString('Referencia', 'TipoN', '');

              {
              WriteString('Seguro', 'Tipo', '');
              WriteString('Seguro', 'Descripcion', '');
              WriteString('Seguro', 'Importe', 0);
              }

              WriteString('DevuelveAdicionales', 'TipoEtiqueta', 'PDF');

              {
              for i := 1 to bultos do
                 WriteString(format('DetalleBultos%d', i), 'Kilos', 0);
                 ...
              }

              {
              for i := 0 to Mercancia do
              WriteString(format('DescMercancia%d', i), 'Kilos', 0);
              ...
              }
           finally
              Free;
           end;
        end;
        Sleep(500);

        HoraEnvioFichero := Now;
        if FileExists(FicheroPeticion) then
        begin
           AbreData(TDMAdjunto, DMAdjunto);
           DMAdjunto.CreaAdjunto('ALB', IdALB, FicheroPeticion, Format(_('Fichero Pedicion GLS %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', HoraEnvioFichero)]));
           CierraData(DMAdjunto);
        end;

        // Se utiliza cadena vacía en vez de 'open' porque algunas aplicaciones no tienen esta accion.
        Resultado := ShellExecute(Application.Handle, '' {'open'}, PChar(RutaGLS + 'GLS.exe'), PChar(FicheroPeticion), nil, SW_SHOW);
        // Resultado <= 32 es un error
        case Resultado of
           0: ShowMessage(_('El sistema operativo no tiene memoria o recursos suficiente.')); // The operating system is out of memory or resources
           ERROR_BAD_FORMAT {11}: ShowMessage(_('El archivo EXE es inválido.')); // The .EXE file is invalid (non-Win32 .EXE or error in .EXE image)
           SE_ERR_ACCESSDENIED{5}: ShowMessage(_('El sistema operativo denego el acceso al archivo especificado.')); // The operating system denied access to the specified file
           SE_ERR_ASSOCINCOMPLETE{27}: ShowMessage(_('El archivo asociado es incompatible o inválido.')); //The filename association is incomplete or invalid
           SE_ERR_DDEBUSY{30}: ShowMessage(_('La transacción DDE no pudo completarse porque otra transaccion DDE estaba siendo procesada.')); // The DDE transaction could not be completed because other DDE transactions were being processed
           SE_ERR_DDEFAIL{29}: ShowMessage(_('La transacción DDE falló.')); // The DDE transaction failed
           SE_ERR_DDETIMEOUT{28}: ShowMessage(_('La transacción DDE no pudo completarse porque ha expirado.')); // The DDE transaction could not be completed because the request timed out
           SE_ERR_DLLNOTFOUND{32}: ShowMessage(_('La librería dinamica especificada no se ha encontrado.')); // The specified dynamic-link library was not found
           SE_ERR_FNF{2}: ShowMessage(_('El archivo no ha sido encontrado.')); //The specified file was not found
           SE_ERR_NOASSOC{31}: ShowMessage(_('No hay ninguna aplicación asociada con la extensión del archivo dado.')); // There is no application associated with the given filename extension
           SE_ERR_OOM{8}: ShowMessage(_('No ha habido memoria suficiente para completar la operación.')); // There was not enough memory to complete the operation
           SE_ERR_PNF{3}: ShowMessage(_('No se ha encontrado la carpeta especificada.')); // The specified path was not found
           SE_ERR_SHARE{26}: ShowMessage(_('Error de permisos.')); // A sharing violation occurred
        end;

        // Espero al fichero de respuesta
        HoraEnvioFichero := Now;
        FicheroRespuesta := RutaGLS + 'GLSPeticion-' + IntToStr(IdALB) + '_Respuesta.ini';
        FicheroRespuestaSOAPRequest := RutaGLS + 'GLSPeticion-' + IntToStr(IdALB) + '_Respuesta_SOAPRequest.xml';
        FicheroRespuestaSOAPResponse := RutaGLS + 'GLSPeticion-' + IntToStr(IdALB) + '_Respuesta_SOAPResponse.xml';
        while ((Resultado > 32) and (not FileExists(FicheroRespuesta)) and (SecondsBetween(Now, HoraEnvioFichero) < 30)) do
        begin
           Sleep(500);
        end;
        Sleep(500);

        if FileExists(FicheroRespuesta) then
        begin
           AbreData(TDMAdjunto, DMAdjunto);
           DMAdjunto.CreaAdjunto('ALB', IdALB, FicheroRespuesta, Format(_('Fichero Respuesta GLS %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', HoraEnvioFichero)]));
           CierraData(DMAdjunto);
        end;

        if FileExists(FicheroRespuestaSOAPRequest) then
        begin
           AbreData(TDMAdjunto, DMAdjunto);
           DMAdjunto.CreaAdjunto('ALB', IdALB, FicheroRespuestaSOAPRequest, Format(_('Fichero SOAP Request GLS %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', HoraEnvioFichero)]));
           CierraData(DMAdjunto);
        end;

        if FileExists(FicheroRespuestaSOAPResponse) then
        begin
           AbreData(TDMAdjunto, DMAdjunto);
           DMAdjunto.CreaAdjunto('ALB', IdALB, FicheroRespuestaSOAPResponse, Format(_('Fichero SOAP Response GLS %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', HoraEnvioFichero)]));
           CierraData(DMAdjunto);
        end;

        Expedicion := '';
        if FileExists(FicheroRespuesta) then
        begin
           with TIniFile.Create(FicheroRespuesta) do
           begin
              try
                {
                [Envio]
                CodBarras=51160860102019
                codexp=7081933296
                Resultado=0
                [Referencias]
                0=
                C=3964
                [Etiquetas]
                Fichero1=C:\Users\DUILIO~1\AppData\Local\Temp\Merge-1063-Debug\Etiqueta1.PDF
                [Observaciones]
                Observaciones=
                }
                 Expedicion := ReadString('Envio', 'codexp', '');
                 FicheroEtiqueta := ReadString('Etiquetas', 'Fichero1', '');

                 sl := TStringList.Create;
                 try
                    ReadSection('RespuestaError', sl);
                    if (sl.Count > 0) then
                    begin
                       RespuestaError := '';
                       for i := 0 to sl.Count - 1 do
                          RespuestaError := RespuestaError + ReadString('RespuestaError', sl[i], '') + #13#10;

                       ShowMessage(_('Error al hacer la peticion GLS.') + #13#10 + RespuestaError);
                    end
                    else
                    begin
                       DMMain.AbrirArchivo(FicheroEtiqueta);

                       // Guardo el etiqueta como adjunto.
                       AbreData(TDMAdjunto, DMAdjunto);
                       DMAdjunto.CreaAdjunto('ALB', IdALB, FicheroEtiqueta, Format(_('Etiqueta Expedicion GLS %s'), [Expedicion]));
                       CierraData(DMAdjunto);

                       if (RutaGLS_2 > '') then
                       begin
                          try
                             CopyFileTo(FicheroEtiqueta, RutaGLS_2 + ExtractFileName(FicheroEtiqueta));
                          except
                             on E: Exception do
                                ShowMessage(_('Error copiando etiqueta a carpeta auxiliar') + #13#10 +
                                   _('Orig: ') + FicheroEtiqueta + #13#10 +
                                   _('Dest: ') + RutaGLS_2 + ExtractFileName(FicheroEtiqueta) + #13#10 +
                                   E.Message);
                          end;

                          try
                             CopyFileTo(FicheroEtiqueta, RutaGLS_2 + format('%s.pdf', [Expedicion]));
                          except
                             on E: Exception do
                                ShowMessage(_('Error copiando etiqueta a carpeta auxiliar') + #13#10 +
                                   _('Orig: ') + FicheroEtiqueta + #13#10 +
                                   _('Dest: ') + RutaGLS_2 + format('%s.pdf', [Expedicion]) + #13#10 +
                                   E.Message);
                          end;

                          try
                             CopyFileTo(FicheroEtiqueta, RutaGLS_2 + format('%s.pdf', [SuReferencia]));
                          except
                             on E: Exception do
                                ShowMessage(_('Error copiando etiqueta a carpeta auxiliar') + #13#10 +
                                   _('Orig: ') + FicheroEtiqueta + #13#10 +
                                   _('Dest: ') + RutaGLS_2 + format('%s.pdf', [SuReferencia]) + #13#10 +
                                   E.Message);
                          end;
                       end;
                    end;
                 finally
                    sl.Free;
                 end;
              finally
                 Free;
              end;
           end;
        end;

        try
           DMMain.GrabaExpedicion(IdALB, Bultos, Peso, Expedicion, 'GLS', Today);
        except
           on E: Exception do
              ShowMessage(_('No se ha podido agregar el Albarán a Envio') + #13#10 + E.Message);
        end;
     finally
        CBImprimirDocDestino.Checked := ImprimirDocDestino;
     end;
  end;
  *)
end;

end.
