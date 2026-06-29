unit UFMAgrupacionOfertasVentas;

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
  TFMAgrupacionOfertasVentas = class(TFPEditSinNavegador)
     DBGFind2000Ofertas: TDBGridFind2000;
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
     TButtCerrarYMarcarOferta: TToolButton;
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
     LOferta: TLFLabel;
     EOferta: TLFEdit;
     LLector: TLFLabel;
     EArticulo: TLFEdit;
     TButtLector: TToolButton;
     LFechaRecepcion: TLFLabel;
     PCOfertas: TLFPageControl;
     TSAgrupacion: TTabSheet;
     TSHojaPreparacion: TTabSheet;
     DBGFCabeceraHojaPreparacion: TDBGridFind2000;
     DBGFDetalleHojaPreparacion: TDBGridFind2000;
     PNLHojaPreparacion: TLFPanel;
     Splitter1: TSplitter;
     PNLFechasRecepcion: TLFPanel;
     PNLOferta: TLFPanel;
     PNLLector: TLFPanel;
     ToolButton8: TToolButton;
     CBForzarPortes: TLFCheckBox;
     ETituloTransportista: TLFEdit;
     PNLSeleccion: TLFPanel;
     LOfertaSeleccion: TLFLabel;
     EOfertaSeleccionDesde: TLFEdit;
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
     EOfertaSeleccionHAsta: TLFEdit;
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
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure TButtSalirClick(Sender: TObject);
     procedure EFClienteExiste(Sender: TObject);
     procedure TButtRegeneraClick(Sender: TObject);
     procedure TButtLineasServidasClick(Sender: TObject);
     procedure TButtLineasNoServidasClick(Sender: TObject);
     procedure TButtMarcarTodasClick(Sender: TObject);
     procedure TButtCerrarYMarcarOfertaClick(Sender: TObject);
     procedure TButtGenerarFacturaClick(Sender: TObject);
     procedure TButtServirTodaLineaClick(Sender: TObject);
     procedure TButtServirMarcadosClick(Sender: TObject);
     procedure EFClienteBusqueda(Sender: TObject);
     procedure TButtMarcarTodasProcClick(Sender: TObject);
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
     procedure EOfertaSeleccionDesdeExit(Sender: TObject);
     procedure DBGFind2000OfertasDblClick(Sender: TObject);
     procedure DBGFind2000OfertasCellClick(Column: TColumn);
     procedure DBGFind2000OfertasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFind2000OfertasKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure FormShow(Sender: TObject);
     procedure CBCalcularStockChange(Sender: TObject);
     procedure EFSeleccionKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFDocumentoBusqueda(Sender: TObject);
     procedure EFDocumentoChange(Sender: TObject);
     procedure CBSoloListoPrepararChange(Sender: TObject);
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
  FMAgrupacionOfertasVentas : TFMAgrupacionOfertasVentas;

implementation

uses UDMAgrupacionOfertasVentas, UDMMain, UEntorno, UUtiles, UDameDato,
  UFInfoFacturacionAlb, UFMControlErroresAgrupPec, UFMain, UParam, DateUtils, URellenaLista;

{$R *.DFM}

procedure TFMAgrupacionOfertasVentas.FormCreate(Sender: TObject);
var
  i, IdColumna : integer;
begin
  inherited;
  AbreData(TDMAgrupacionOfertasVentas, DMAgrupacionOfertasVentas);
  DBGFind2000Ofertas.ColumnasChecked.Strings[DBGFind2000Ofertas.ColumnasCheckBoxes.IndexOf('ENTRADA_AGRUPACION')] :=
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
     PNLOferta.Visible := True;
     PNLLector.Visible := True;
  end
  else
  begin
     TButtLector.Visible := False;
     PNLOferta.Visible := False;
     PNLLector.Visible := False;
  end;

  // Se establece descripcion de Campos ALFA_n
  // Se hace aquí porque la traducción reemplaza los titulos
  for i := 1 to 8 do
  begin
     IdColumna := EncuentraField(DBGFind2000Ofertas, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGFind2000Ofertas.Columns[IdColumna].Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));
  end;

  if (DMMain.EstadoKri(165) = 1) then {Inhabilita el Traspaso directo a Factura}
     TButtGenerarFactura.Visible := False;

  PCOfertas.ActivePage := TSAgrupacion;
  // Hojas de preparacion de Ofertas
  if (LeeParametro('HOJAPRE001') = '0') then
     TSHojaPreparacion.TabVisible := False;

  if (StrToIntDef(LeeParametro('SYSCONF005'), 0) = 0) then
  begin
     DBGFind2000Ofertas.FindColumn('U_LOGISTICAS_RESERVADAS').Visible := False;
     DBGFind2000Ofertas.FindColumn('TIPO_UNIDAD_LOGISTICA').Visible := False;
     DBGFind2000Ofertas.FindColumn('UNIDADES_LOGISTICAS').Visible := False;
     DBGFind2000Ofertas.FindColumn('TITULO_UNIDAD_LOGISTICA').Visible := False;
  end;

  SolapaControles(SBAClientes, DBETitClientes);
  DBETitClientes.Color := REntorno.ColorEnlaceActivo;
  ColActual := DBGFind2000Ofertas.Columns[0];
  CBDividirPorDirecciones.Checked := False;
  EFTransportistaChange(Sender);

  param_AGRPEDC001 := (LeeParametro('AGRPEDC001') = 'S');
end;

procedure TFMAgrupacionOfertasVentas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAgrupacionOfertasVentas);
end;

procedure TFMAgrupacionOfertasVentas.TButtSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TFMAgrupacionOfertasVentas.EFClienteExiste(Sender: TObject);
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
        PMain.Enabled := False;
        TButtServirMarcados.Enabled := False;
        TButtMarcarTodas.Enabled := False;
        TButtServirTodaLinea.Enabled := False;
        TButtMarcarTodasProc.Enabled := False;
        TButtDesmarcarTodasProc.Enabled := False;
        TButtCerrarYMarcarOferta.Enabled := False;
        TButtGenerarFactura.Enabled := False;
     end
     else
     begin
        PMain.Enabled := True;
        TButtServirMarcados.Enabled := True;
        TButtMarcarTodas.Enabled := True;
        TButtServirTodaLinea.Enabled := True;
        TButtMarcarTodasProc.Enabled := True;
        TButtDesmarcarTodasProc.Enabled := True;
        TButtCerrarYMarcarOferta.Enabled := True;
        TButtGenerarFactura.Enabled := False;
     end;

     RefrescarDatos(Cliente);

     if (DMMain.EstadoKri(140) = 1) then
        EOferta.SetFocus; {dji lrk kri - Perez Morant}

     DMAgrupacionOfertasVentas.Errores.Clear;

     // Hojas de preparacion de Ofertas
     if (LeeParametro('HOJAPRE001') <> '0') then
        DMAgrupacionOfertasVentas.FiltraHojaPreparacion(Cliente);

     // Mirko - Para algunos clientes nunca debe dividir por direccion de entrega
     if (DMMain.EstadoKri(411) = 1) then
        CBDividirPorDirecciones.Checked := not ((Cliente = 60412) or (Cliente = 60406) or (Cliente = 60417));
  end;
end;

procedure TFMAgrupacionOfertasVentas.TButtRegeneraClick(Sender: TObject);
begin
  RefrescarDatos(StrToIntDef(EFCliente.Text, 0));
end;

procedure TFMAgrupacionOfertasVentas.TButtLineasServidasClick(Sender: TObject);
begin
  DMAgrupacionOfertasVentas.MostrarLineasServidas(1);
  DMAgrupacionOfertasVentas.RefrescarOfertas;
end;

procedure TFMAgrupacionOfertasVentas.TButtLineasNoServidasClick(Sender: TObject);
begin
  DMAgrupacionOfertasVentas.MostrarLineasServidas(0);
  DMAgrupacionOfertasVentas.RefrescarOfertas;
end;

procedure TFMAgrupacionOfertasVentas.TButtMarcarTodasClick(Sender: TObject);
begin
  if Confirma then
     DMAgrupacionOfertasVentas.MarcarLineasOfertas;
end;

procedure TFMAgrupacionOfertasVentas.TButtCerrarYMarcarOfertaClick(Sender: TObject);
begin
  // Marca los albaranes segun el detalle de la Hoja de Preparacion
  if (PCOfertas.ActivePage = TSHojaPreparacion) then
     DMAgrupacionOfertasVentas.InicializaTraspasoHojas('ALB');

  DMAgrupacionOfertasVentas.Fecha_Rec := DateOf(DEFechaRecepcion.Date) + TimeOf(DTPHoraRecepcion.Time);
  CompruebaPortes;
  InicializaTraspaso('ALB');

  // Termina el traspaso - Establece ubicacion y Lote
  if (PCOfertas.ActivePage = TSHojaPreparacion) then
     DMAgrupacionOfertasVentas.ActualizaInfoAlbaran;
end;

procedure TFMAgrupacionOfertasVentas.TButtGenerarFacturaClick(Sender: TObject);
begin
  DMAgrupacionOfertasVentas.Fecha_Rec := DateOf(DEFechaRecepcion.Date) + TimeOf(DTPHoraRecepcion.Time);
  CompruebaPortes;
  InicializaTraspaso('FAC');
end;

procedure TFMAgrupacionOfertasVentas.TButtServirTodaLineaClick(Sender: TObject);
begin
  DMAgrupacionOfertasVentas.ServirTodaLinea;
end;

procedure TFMAgrupacionOfertasVentas.TButtServirMarcadosClick(Sender: TObject);
begin
  if Confirma then
  begin
     DMAgrupacionOfertasVentas.Fecha_Rec := DateOf(DEFechaRecepcion.Date) + TimeOf(DTPHoraRecepcion.Time);
     DMAgrupacionOfertasVentas.ServirMarcados;
  end;
end;

procedure TFMAgrupacionOfertasVentas.EFClienteBusqueda(Sender: TObject);
var
  Serie : string;
begin
  Serie := DMAgrupacionOfertasVentas.GetSerie;
  EFCliente.CondicionBusqueda := 'EMPRESA = ' + REntorno.EmpresaStr +
     ' AND EJERCICIO <= ' + REntorno.EjercicioStr +
     ' AND CANAL = ' + REntorno.CanalStr + ' AND SERIE = ''' + Serie + '''' +
     ' AND TIPO = ''OFC'' AND ESTADO in (0, 1, 3, 4)'; {dji lrk kri - (ESTADO <> 5 AND ESTADO <> 2)}
end;

procedure TFMAgrupacionOfertasVentas.InicializaTraspaso(Tipo: string);
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

  if (not DMAgrupacionOfertasVentas.PuedeRealizarAlbFac(StrToInt(EFCliente.Text))) then
  begin
     Application.MessageBox(PChar(string(_('No se pueden realizar ventas a este cliente, cliente bloqueado.'))),
        PChar(string(_('Se ha producido un error'))), MB_OK);
     Exit; // Saltamos del procedimiento
  end;

  DMAgrupacionOfertasVentas.GrabaDetalle;

  // Aqui tiene que comprobar que las Ofertas hayan sido marcados COMPLETOS
  Rig := 0;
  with DMAgrupacionOfertasVentas.Errores do
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
     // Verifica que se esta sirviendo la Oferta completa P.Morant
     if (DMMain.EstadoKri(142) = 1) then
     begin
        with DMAgrupacionOfertasVentas.QMDetalle do
        begin
           Transaction.CommitRetaining;
           DMAgrupacionOfertasVentas.MostrarLineasServidas(1);
           DMAgrupacionOfertasVentas.RefrescarOfertas;
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
                    if (FieldByName('UNIDADES_RESERVADAS').AsInteger <> FieldByName('UNIDADES_PENDIENTES').AsInteger) then
                    begin
                       Articulo := Trim(FieldByName('ARTICULO').AsString);
                       Stock := DMMain.DameStockArticulo(REntorno.Empresa, 1, DMAgrupacionOfertasVentas.QMDetalleARTICULO.AsString, DMAgrupacionOfertasVentas.QMDetalleALMACEN.AsString);

                       {Si hay de menos}
                       if (FieldByName('UNIDADES_RESERVADAS').AsInteger > FieldByName('UNIDADES_PENDIENTES').AsInteger) then
                          temp.Add(Format(_('Oferta %d - SOBRAN %d uds. del articulo %s - STOCK: %d'), [FieldByName('RIG').AsInteger, FieldByName('UNIDADES_RESERVADAS').AsInteger - FieldByName('UNIDADES_PENDIENTES').AsInteger, Articulo, Stock]))
                       else {Si hay de mas}
                          temp.Add(Format(_('Oferta %d - FALTAN %d uds. del articulo %s - STOCK: %d'), [FieldByName('RIG').AsInteger, FieldByName('UNIDADES_PENDIENTES').AsInteger - FieldByName('UNIDADES_RESERVADAS').AsInteger, Articulo, Stock]));
                    end;
                    Next;
                 end;
                 if (Marcado) then
                    DMAgrupacionOfertasVentas.Errores.AddStrings(temp);
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
  if (DMAgrupacionOfertasVentas.Errores.Count > 0) then
  begin
     aux := _('Existen los siguientes errores, Desea seguir?') + #13#10 + #13#10;
     Rig := 0;
     while (Rig < DMAgrupacionOfertasVentas.Errores.Count) do
     begin
        aux := aux + DMAgrupacionOfertasVentas.Errores.Strings[Rig] + #13#10;
        Inc(Rig);
     end;
     Beep;
     Marcado := mrOk = MessageDlg(aux, mtWarning, [mbOK, mbCancel], 0);
  end;
  // FIN Comprobacion Ofertas completos

  if (Marcado) then
  begin
     // Comprobacion stock suficiente
     if (DMMain.EstadoKri(182) = 1) then
     begin
        temp := TStringList.Create;
        try
           with DMAgrupacionOfertasVentas.QMDetalle do
           begin
              BM := DMAgrupacionOfertasVentas.QMDetalleID_DETALLES_S.AsInteger;
              DisableControls;
              try
                 First;
                 while not EOF do
                 begin
                    if (DMAgrupacionOfertasVentas.QMDetalleENTRADA_AGRUPACION.AsInteger = REntorno.Entrada) then
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
                             Params.ByName['ARTICULO'].AsString := DMAgrupacionOfertasVentas.QMDetalleARTICULO.AsString;
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
                                SQL.Add(' SELECT SUM(UNIDADES_RESERVADAS) FROM VER_DETALLE_OFERTA_C ');
                                SQL.Add(' WHERE ');
                                SQL.Add(' EMPRESA = :EMPRESA AND ');
                                SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                                SQL.Add(' CANAL = :CANAL AND ');
                                SQL.Add(' SERIE = :SERIE AND ');
                                SQL.Add(' TIPO = ''OFC'' AND ');
                                SQL.Add(' RIG = :RIG AND ');
                                SQL.Add(' CLIENTE = :CLIENTE AND ');
                                SQL.Add(' /* SERVIDO = 0 AND */ ');
                                SQL.Add(' ESTADO <> 5 AND ');
                                SQL.Add(' ENTRADA_AGRUPACION = :ENTRADA_AGRUPACION AND ');
                                SQL.Add(' ARTICULO = :ARTICULO ');
                                Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                                Params.ByName['EJERCICIO'].AsInteger := DMAgrupacionOfertasVentas.QMDetalleEJERCICIO.AsInteger;
                                Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                                Params.ByName['SERIE'].AsString := DMAgrupacionOfertasVentas.QMDetalleSERIE.AsString;
                                Params.ByName['RIG'].AsInteger := DMAgrupacionOfertasVentas.QMDetalleRIG.AsInteger;
                                Params.ByName['CLIENTE'].AsInteger := DMAgrupacionOfertasVentas.QMDetalleCLIENTE.AsInteger;
                                Params.ByName['ENTRADA_AGRUPACION'].AsInteger := REntorno.Entrada;
                                Params.ByName['ARTICULO'].AsString := DMAgrupacionOfertasVentas.QMDetalleARTICULO.AsString;
                                ExecQuery;
                                Unidades := FieldByName['SUM'].AsFloat;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;

                          Existencias := DMMain.DameStockArticulo(REntorno.Empresa, 1, DMAgrupacionOfertasVentas.QMDetalleARTICULO.AsString, DMAgrupacionOfertasVentas.QMDetalleALMACEN.AsString);
                          if ((Existencias < 0) or ((Existencias - Unidades) < -0.001)) then
                             temp.Add(Format('Ped. %d - Linea %d - Articulo %s: No hay stock suficiente.(Stock: %n)', [DMAgrupacionOfertasVentas.QMDetalleRIG.AsInteger, DMAgrupacionOfertasVentas.QMDetalleLINEA.AsInteger, DMAgrupacionOfertasVentas.QMDetalleARTICULO.AsString, Existencias]));
                       end; // abierto <> 1
                    end;
                    Next;
                 end; // while not EOF

                 // GotoBookmark(BM);
                 Posicionar(DMAgrupacionOfertasVentas.QMDetalle, 'ID_DETALLES_S', BM);
              finally
                 EnableControls;
              end;
              if (temp.Count > 0) then
              begin
                 // PermitirTraspaso sera siempre false si hay un error de stock
                 Marcado := False;
                 MessageDlg(temp.Text, mtInformation, [mbOK], 0);
              end;
           end; // with DMAgrupacionOfertasVentas.QMDetalle
        finally
           temp.Free;
        end;
     end; // if EstadoKri(182) = 1
  end;
  // FIN Comprobacion stock suficiente

  // Marcado se utiliza tambien para ver si hubo errores
  if (Marcado) then
  begin
     if (DMAgrupacionOfertasVentas.PermitirTraspaso) then
     begin
        try
           Screen.Cursor := crHourGlass;
           FInfoFacturacionAlb := TFInfoFacturacionAlb.Create(Self);
           WndList := DisableTaskWindows(FInfoFacturacionAlb.Handle);
           with FInfoFacturacionAlb do
           begin
              LBLGeneral.Caption := _('Traspasando Ofertas');
              GBProcesaCab.Caption := _('Procesando Oferta');
              LBLEjercicio.Caption := '';
              LBLCanal.Caption := '';
              LBLSerie.Caption := '';
              LBLRig.Caption := '';
              Show;
           end;

           Application.ProcessMessages;

           DMAgrupacionOfertasVentas.InicializaTraspaso;

           // Recorriendo y creando cabeceras
           with DMAgrupacionOfertasVentas.xRecorre do
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

                 DMAgrupacionOfertasVentas.GeneraCabeceras(Ejercicio, Canal, Rig, id_s, Serie,
                    Tipo, Transportista, Portes, Rango, Indice, StrToIntDef(EFCanales.Text,
                    REntorno.Canal), I_Portes, Por_Portes, DateOf(DEFechaDestino.Date) + TimeOf(DTPHoraDestino.Time), Direccion, CBForzarPortes.Checked, CBDividirPorDirecciones.Checked, StrToIntDef(EFDocumento.Text, 0));

                 Next;
              end;
              Close;
           end;

           // Recorremos los grupos generados
           DMAgrupacionOfertasVentas.RecorreProcesados(REntorno.Entrada);

           with FInfoFacturacionAlb do
           begin
              LBLGeneral.Caption := _('Traspasando Ofertas');
              GBProcesaCab.Caption := _('Traspasando Oferta');
           end;

           with DMAgrupacionOfertasVentas.xProcesar do
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
                    LBLRig.Caption := IntToStr(Rig) + ' (' + IntToStr(Rig) + '->' + FieldByName('seried').AsString + '/' + IntToStr(FieldByName('rigd').AsInteger) + ')';
                 end;
                 Application.ProcessMessages;
                 DMAgrupacionOfertasVentas.TraspasaOferta(id_s, id_s_d, Tipo, CBDividirPorDirecciones.Checked, (StrToIntDef(EFDocumento.Text, 0) <> 0));

                 Next;
              end;
              Close;
           end;

           DMAgrupacionOfertasVentas.RecorreFacturados(DMAgrupacionOfertasVentas.Proceso_auto);
           with FInfoFacturacionAlb do
           begin
              LBLGeneral.Caption := _('Actualizando Precios');
              GBProcesaCab.Caption := _('Procesando Artículo');
           end;
           with DMAgrupacionOfertasVentas.xFacturados do
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
                 DMAgrupacionOfertasVentas.ActualizaPrecio(Articulo, DMAgrupacionOfertasVentas.Proceso_auto);

                 Next;
              end;
              Close;
           end;

           DMAgrupacionOfertasVentas.RecorreProcesados(REntorno.Entrada);
           with FInfoFacturacionAlb do
           begin
              LBLGeneral.Caption := _('Ajustando Ofertas');
              GBProcesaCab.Caption := _('Ajustando Oferta');
              LTitEjercicio.Caption := _('Ejercicio') + ':';
              LTitCanal.Caption := _('Canal') + ':';
              LTitSerie.Caption := _('Serie') + ':';
              LTitRIG.Caption := _('RIG');
           end;

           with DMAgrupacionOfertasVentas.xProcesar do
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
                 DMAgrupacionOfertasVentas.ActualizaOfertas(id_s, id_s_d);

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
           DMAgrupacionOfertasVentas.BorraTemporales;
           Screen.Cursor := crDefault;
           EnableTaskWindows(WndList);
           FInfoFacturacionAlb.Close;

           CambiaCanal := (StrToIntDef(EFCanales.Text, REntorno.Canal) <> REntorno.Canal);

           DMAgrupacionOfertasVentas.Final(DMAgrupacionOfertasVentas.Proceso_auto, StrToIntDef(EFCanales.Text, REntorno.Canal),
              Tipo, DMAgrupacionOfertasVentas.SerieDestino);

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

procedure TFMAgrupacionOfertasVentas.TButtMarcarTodasProcClick(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMAgrupacionOfertasVentas.MarcarLineasOfertasProc(1);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMAgrupacionOfertasVentas.TButtDesmarcarTodasProcClick(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMAgrupacionOfertasVentas.MarcarLineasOfertasProc(0);
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMAgrupacionOfertasVentas.EArticuloKeyPress(Sender: TObject; var Key: char);
var
  aux, art : string;
begin
  if ((Trim(EArticulo.Text) <> '') and (Key = #13)) then
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

     DMAgrupacionOfertasVentas.AgregaArticulo(art, StrToIntDef(EOferta.Text, 0));
  end;
end;

procedure TFMAgrupacionOfertasVentas.TButtLectorClick(Sender: TObject);
var
  Archivo : TextFile;
  DirOri, s : string;
  ArticuloLeido : string;
  Articulo : string;
  Cantidad : integer;
  c : integer;
  I, J, K : integer;
  // fecha : TDateTime;
  aux : char;
  ArchivoLog : TextFile;
  FechaLog : string;
begin
  DirOri := REntorno.DirectorioLector;

  FechaLog := FormatDateTime('yymmdd_hhnnss', Now);
  AssignFile(ArchivoLog, DirOri + 'AgrPEC' + '_' + FechaLog + '.log');
  try
     Rewrite(ArchivoLog);
     WriteLn(ArchivoLog, 'Agrupacion de Ofertas de Cliente ');
     WriteLn(ArchivoLog, 'Cliente (' + EFCliente.Text + ') ' + DBETitClientes.Text);
     WriteLn(ArchivoLog, '--------------------------------------------------');

     AssignFile(Archivo, DirOri + 'Oferta.txt');
     Reset(Archivo);
     try
        while (not EOF(Archivo)) do
        begin
           Articulo := '';
           ReadLn(Archivo, s);
           i := Pos(',', S);
           j := Pos(',', Copy(s, i + 1, Length(s)));
           k := Pos(',', Copy(s, i + j + 1, Length(s)));
           // fecha := StrToDateTime(copy(s, 1, i - 1) + ' ' + Copy(s, i + 1, j - 1));
           ArticuloLeido := Copy(s, j + i + 1, k - 1);
           Cantidad := StrToIntDef(Copy(s, j + i + k + 1, Length(s)), 0);

           // Primero veo si el articulo leido es un codigo de barras
           Articulo := DameArticuloBarras(ArticuloLeido);
           // Si no es un codigo de barras veo si existe (pido su titulo)
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
              for c := 1 to Cantidad do
              begin
                 EArticulo.Text := Articulo;
                 aux := #13;
                 EArticuloKeyPress(Sender, aux);
              end;
           end
           else
           begin
              WriteLn(ArchivoLog, 'No Existe el articulo ' + Articulo + ' x ' + IntToStr(Cantidad) + ' unidades. Articulo Leido: ' + ArticuloLeido);
              ShowMessage(Format(_('No encuentro el articulo leido: %s x %d' + #13#10 + 'Deberá agregarlo luego'), [ArticuloLeido, Cantidad]));
           end;
        end;
     finally
        CloseFile(Archivo);
     end;
  finally
     CloseFile(ArchivoLog);
  end;

  CopyFileTo(DirOri + 'Oferta.txt', DirOri + 'AgrPEC' + '_' + FormatDateTime('yymmdd_hhnnss', Now) + '.txt');

  try
     Rewrite(Archivo);
  finally
     CloseFile(Archivo);
  end;
end;

procedure TFMAgrupacionOfertasVentas.EFTransportistaChange(Sender: TObject);
begin
  if (StrToIntDef(EFTransportista.Text, 0) <> 0) then
     ETituloTransportista.Text := DameTituloAcreedor(StrToIntDef(EFTransportista.Text, 0))
  else
  begin
     if param_AGRPEDC001 then
        ETituloTransportista.Text := _('Se obtendrá el transportista de la Oferta.')
     else
        ETituloTransportista.Text := _('Se obtendrá el valor por defecto para el cliente.');
  end;
end;

procedure TFMAgrupacionOfertasVentas.DamePortesCliente(Cliente: integer);
var
  Tipo_Portes, Rango, Indice : integer;
  I_Portes, Por_Portes : double;
begin
  DMAgrupacionOfertasVentas.DamePortesCliente(Cliente, Tipo_Portes, Rango, Indice, I_Portes, Por_Portes);
  EFPortes.Text := IntToStr(Tipo_Portes);
  EIPortes.Text := FloatToStr(I_Portes);
  EPorPortes.Text := FloatToStr(Por_Portes);
  EFRango.Text := IntToStr(Rango);
  EFIndice.Text := IntToStr(Indice);
end;

procedure TFMAgrupacionOfertasVentas.EFPortesChange(Sender: TObject);
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
     DMAgrupacionOfertasVentas.CambiaPortes(StrToIntDef(EFPortes.Text, 0));
end;

procedure TFMAgrupacionOfertasVentas.CamposVisibles(Visible: boolean);
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

procedure TFMAgrupacionOfertasVentas.EFRangoChange(Sender: TObject);
var
  Habilita : boolean;
begin
  EFIndice.Text := '';
  DMAgrupacionOfertasVentas.CambiaRango(StrToIntDef(EFRango.Text, 0), Habilita);
  EFIndice.Enabled := Habilita;
end;

procedure TFMAgrupacionOfertasVentas.EFIndiceChange(Sender: TObject);
begin
  DMAgrupacionOfertasVentas.CambiaIndice(StrToIntDef(EFRango.Text, 0), StrToIntDef(EFIndice.Text, 0));
end;

procedure TFMAgrupacionOfertasVentas.EFIndiceBusqueda(Sender: TObject);
begin
  EFIndice.CondicionBusqueda := ' RANGO=' + EFRango.Text;
end;

procedure TFMAgrupacionOfertasVentas.DeshabilitaPortes;
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

procedure TFMAgrupacionOfertasVentas.CompruebaPortes;
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

procedure TFMAgrupacionOfertasVentas.EFRangoBusqueda(Sender: TObject);
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

procedure TFMAgrupacionOfertasVentas.EFCanalesChange(Sender: TObject);
begin
  DMAgrupacionOfertasVentas.DameTituloCanal(StrToIntDef(EFCanales.Text, REntorno.Canal));
end;

procedure TFMAgrupacionOfertasVentas.CBSeriesChange(Sender: TObject);
var
  Serie : string;
begin
  if (CBSeries.Text <> '') then
  begin
     // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
     Serie := CBSeries.Items[CBSeries.ItemIndex];
     Serie := Copy(Serie, 1, Pos(' ', Serie) - 1);
     DMAgrupacionOfertasVentas.SetSerie(Serie);
     DMAgrupacionOfertasVentas.RefrescarOfertas;
  end;
end;

procedure TFMAgrupacionOfertasVentas.RefrescarDatos(Cliente: integer);
begin
  DeshabilitaPortes;

  // Primero desmarco, porque el Entorno de Busqueda tiene el cliente anterior
  DMAgrupacionOfertasVentas.DesmarcarEntradas;

  // Ahora establezco el Entorno de Busqueda
  DMAgrupacionOfertasVentas.SetCliente(Cliente);

  try
     DMAgrupacionOfertasVentas.RefrescarOfertas;
     if not (DMAgrupacionOfertasVentas.xClientes.FieldByName('NOMBRE_R_SOCIAL').IsNull) then
     begin
        GBPortes.Enabled := True;
        EFTransportista.Text := ''; // IntToStr(DMAgrupacionOfertasVentas.DameMinTransportista(Cliente));
        DamePortesCliente(Cliente);
     end;
  except
  end;

  // Actualizo hora de recepcion/documento
  DTPHoraRecepcion.Time := Now;
  DTPHoraDestino.Time := Now;
end;

procedure TFMAgrupacionOfertasVentas.FormResize(Sender: TObject);
begin
  if (DBGFCabeceraHojaPreparacion.Height > PNLHojaPreparacion.Height) then
     DBGFCabeceraHojaPreparacion.Height := PNLHojaPreparacion.Height div 2;
end;

procedure TFMAgrupacionOfertasVentas.BFiltrarSeleccionClick(Sender: TObject);
begin
  DMAgrupacionOfertasVentas.FiltraOfertas(StrToIntDef(EOfertaSeleccionDesde.Text, 0), StrToIntDef(EOfertaSeleccionHasta.Text, 0), EFPaisSeleccion.Text, StrToIntDef(EDireccionSeleccion.Text, 0), EArticuloSeleccion.Text, CBSoloListoPreparar.Checked);
end;

procedure TFMAgrupacionOfertasVentas.BEnviarSeleccionClick(Sender: TObject);
begin
  DMAgrupacionOfertasVentas.EnviaOfertasFiltrados;
end;

procedure TFMAgrupacionOfertasVentas.BLimpiarSeleccionClick(Sender: TObject);
begin
  EOfertaSeleccionDesde.Text := '';
  EOfertaSeleccionHasta.Text := '';
  EFPaisSeleccion.Text := '';
  EDireccionSeleccion.Text := '';
  EArticuloSeleccion.Text := '';
  Application.ProcessMessages;
  BFiltrarSeleccion.Click;
end;

procedure TFMAgrupacionOfertasVentas.EArticuloExit(Sender: TObject);
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
     DMAgrupacionOfertasVentas.AgregaArticulo(art, StrToIntDef(EOferta.Text, 0));
  end;
end;

procedure TFMAgrupacionOfertasVentas.SBAClientesDblClick(Sender: TObject);
begin
  ACliente.Execute;
end;

procedure TFMAgrupacionOfertasVentas.AClienteExecute(Sender: TObject);
begin
  if (StrToIntDef(EFCliente.Text, 0) <> 0) then
     FMain.EjecutaAccion(FMain.Aclientes, 'CLIENTE=' + EFCliente.Text);
end;

procedure TFMAgrupacionOfertasVentas.EOfertaSeleccionDesdeExit(Sender: TObject);
begin
  if (EOfertaSeleccionHasta.Text = '') then
     EOfertaSeleccionHasta.Text := EOfertaSeleccionDesde.Text;
end;

procedure TFMAgrupacionOfertasVentas.DBGFind2000OfertasDblClick(Sender: TObject);
begin
  if (UpperCase(ColActual.FieldName) = 'RIG') then
     FMain.TraspasoDeDocumentosSalida(DMAgrupacionOfertasVentas.QMDetalleID_S.AsInteger);
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
     FMain.EjecutaAccion(FMain.AArticulos, 'Articulo = ''' + DMAgrupacionOfertasVentas.QMDetalleARTICULO.AsString + '''');
end;

procedure TFMAgrupacionOfertasVentas.DBGFind2000OfertasCellClick(Column: TColumn);
begin
  ColActual := Column;
end;

procedure TFMAgrupacionOfertasVentas.DBGFind2000OfertasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  Fecha : TDateTime;
begin
  if ((UpperCase(Column.FieldName) = 'RIG') or (UpperCase(Column.FieldName) = 'ARTICULO')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (UpperCase(Column.FieldName) = 'STOCK') then
     begin
        if (CBCalcularStock.Checked) then
        begin
           if (DMAgrupacionOfertasVentas.QMDetalleUNIDADES_RESERVADAS.AsFloat <> 0) then
           begin
              if ((DMAgrupacionOfertasVentas.QMDetalleSTOCK.AsFloat - DMAgrupacionOfertasVentas.QMDetalleUNIDADES_RESERVADAS.AsFloat) > 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end
           else
           begin
              if ((DMAgrupacionOfertasVentas.QMDetalleSTOCK.AsFloat - DMAgrupacionOfertasVentas.QMDetalleUNIDADES_PENDIENTES.AsFloat) >= 0) then
                 ColorResaltado2(Canvas)
              else
                 ColorError(Canvas);
           end;
        end
        else
           ColorInactivo(Canvas);
     end;

     if (UpperCase(Column.FieldName) = 'STOCK_MINIMO') then
     begin
        if (CBCalcularStock.Checked) then
        begin
           if (DMAgrupacionOfertasVentas.QMDetalleSTOCK.AsFloat - DMAgrupacionOfertasVentas.QMDetalleUNIDADES_RESERVADAS.AsFloat >= DMAgrupacionOfertasVentas.QMDetalleSTOCK_MINIMO.AsFloat) then
              ColorResaltado2(Canvas)
           else
              ColorResaltado3(Canvas);
        end
        else
           ColorInfo(Canvas);
     end;

     if (UpperCase(Column.FieldName) = 'ID_LOTE') then
     begin
        if (DMAgrupacionOfertasVentas.QMDetalleLOTES.AsInteger = 1) then
           ColorInfo(Canvas)
        else
           ColorInactivo(Canvas);
     end;

     if (Column.FieldName = 'FECHA_ENTREGA_PREV') then
     begin
        Fecha := DMAgrupacionOfertasVentas.QMDetalleFECHA_ENTREGA_PREV.AsDateTime;
        if (Fecha < Today) then
           ColorError(Canvas)
        else
        if (Fecha >= Today) and (Fecha < Tomorrow) then
           ColorResaltado(Canvas)
        else
           ColorInfo(Canvas);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMAgrupacionOfertasVentas.DBGFind2000OfertasKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_F3) then
  begin
     if (TDBGridFind2000(Sender).ColumnaActual = 'ID_LOTE') then
        DMAgrupacionOfertasVentas.InfoLotes;
     Key := 0;
  end;
end;

procedure TFMAgrupacionOfertasVentas.FormShow(Sender: TObject);
begin
  inherited;
  if ((EncuentraField(DBGFind2000Ofertas, 'STOCK') < 0) and (EncuentraField(DBGFind2000Ofertas, 'STOCK_MINIMO') < 0)) then
     CBCalcularStock.Checked := False;

  DMAgrupacionOfertasVentas.CalculaStock := CBCalcularStock.Checked;
end;

procedure TFMAgrupacionOfertasVentas.CBCalcularStockChange(Sender: TObject);
begin
  inherited;
  DMAgrupacionOfertasVentas.CalculaStock := CBCalcularStock.Checked;
  TButtRegenera.Click;
end;

procedure TFMAgrupacionOfertasVentas.EFSeleccionKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
     BFiltrarSeleccion.Click;
end;

procedure TFMAgrupacionOfertasVentas.EFDocumentoBusqueda(Sender: TObject);
begin
  EFDocumento.CondicionBusqueda := 'ESTADO=0 AND TIPO=''ALB'' AND EJERCICIO<=' + REntorno.EjercicioStr + ' AND CLIENTE=' + EFCliente.Text;
  if (StrToIntDef(EFDocumento.Text, 0) <> 0) then
     EFDocumento.CondicionBusqueda := EFDocumento.CondicionBusqueda + ' AND CANAL=' + EFCanales.Text;
end;

procedure TFMAgrupacionOfertasVentas.EFDocumentoChange(Sender: TObject);
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

procedure TFMAgrupacionOfertasVentas.CBSoloListoPrepararChange(Sender: TObject);
begin
  inherited;
  BFiltrarSeleccion.Click;
end;

end.
