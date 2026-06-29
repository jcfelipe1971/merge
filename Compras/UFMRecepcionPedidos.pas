unit UFMRecepcionPedidos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ExtCtrls, Mask, DBCtrls, ComCtrls, ToolWin, UControlEdit, UFormGest,
  NsDBGrid, rxToolEdit, rxPlacemnt, ULFFormStorage, ULFPanel, ULFDBEdit,
  ULFToolBar, RXDBCtrl, ULFEditFind2000, ULFLabel, ULFEdit,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDateEdit, Buttons, ActnList, HYFIBQuery,
  ULFDBMemo, UFPEditSinNavegador, ULFActionList, Menus, UTeclas, UEditPanel;

type
  TFMRecepcionPedidos = class(TFPEditSinNavegador)
     TButtRegenera: TToolButton;
     DBGFPedidos: TDBGridFind2000;
     TButtLineasServidas: TToolButton;
     TButtLineasNoServidas: TToolButton;
     TButtMarcarTodas: TToolButton;
     TButtSep5: TToolButton;
     TButtCerrarYMarcarPedido: TToolButton;
     TButtGenerarFactura: TToolButton;
     TButtRecibirTodasunidadeslinea: TToolButton;
     TButtRecibirTodasunidadesTodos: TToolButton;
     ToolButton3: TToolButton;
     TButtServir: TToolButton;
     LSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     LProveedor: TLFLabel;
     EFProveedor: TLFEditFind2000;
     LBLFechaContabilidad: TLFLabel;
     DTPFechaContabilizacion: TLFDateEdit;
     DTPHoraContabilizacion: TDateTimePicker;
     LFechaRecepcion: TLFLabel;
     DTPFechaRecepcion: TLFDateEdit;
     TButtMultiLotes: TToolButton;
     TButtMarcarTodasProc: TToolButton;
     EFCanalDest: TLFEditFind2000;
     TButtSep6: TToolButton;
     PNLLineasProc: TLFPanel;
     LLineasProc: TLFLabel;
     EdLineasAProc: TLFEdit;
     PNLSepararPedidos: TLFPanel;
     CBSeparaPedidos: TLFCheckBox;
     LCanalDestino: TLFLabel;
     SBAProveedor: TSpeedButton;
     ALRecepcion: TActionList;
     AProveedor: TAction;
     ETitSerie: TLFEdit;
     ETitProveedor: TLFEdit;
     ETitCanalDest: TLFEdit;
     PNLFiltros: TLFPanel;
     LNumPedido: TLFLabel;
     EFNumPedido: TLFEditFind2000;
     EFEjercicioPedido: TLFEditFind2000;
     LFechaDocumento: TLFLabel;
     DTPFechaDocumento: TLFDateEdit;
     DTPHoraDocumento: TDateTimePicker;
     DTPHoraRecepcion: TDateTimePicker;
     PNLPie: TLFPanel;
     MNotasCompraArticulo: TLFDBMemo;
     LBPortes: TLFLabel;
     EFPortes: TLFEditFind2000;
     ETituloPortes: TLFEdit;
     LBPorPortes: TLFLabel;
     EPorPortes: TLFEdit;
     LBIPortes: TLFLabel;
     EIPortes: TLFEdit;
     ImgArticulo: TImage;
     BMostrarImagen: TBitBtn;
     MNOtasCompraPedido: TLFDBMemo;
     PNLNotas: TLFPanel;
     PNLNotasCompraPedido: TLFPanel;
     LNotasCompraPedido: TLFLabel;
     PNLNotasCompraArticulo: TLFPanel;
     LNotasCompraArticulo: TLFLabel;
     TButtSep1: TToolButton;
     TButtImportarCSV: TToolButton;
     TButtInicializarTodas: TToolButton;
     DBGPedidosRelacionados: TDBGridFind2000;
     AAsignacionCodigoBarra: TAction;
     TB1: TToolButton;
     TButtAsignacionCodigoBarra: TToolButton;
     PNLImagen: TLFPanel;
     CBImagen: TLFCheckBox;
     PNLLineasPedidos: TLFPanel;
     LDocDestino: TLFLabel;
     EFDocDestino: TLFEditFind2000;
     EDocDestino: TLFEdit;
     LEjercicio: TLFLabel;
     PNLMarcarServido: TLFPanel;
     CBMarcarServido: TLFCheckBox;
     AImportarExcel: TAction;
     TButtImportarExcel: TToolButton;
     tmrImgArticulo: TTimer;
     AImportarEropastry: TAction;
     AImportarEropastryExpedicion: TAction;
     pmImportar: TPopupMenu;
     MIImportarExcel: TMenuItem;
     MIImportarEropastry: TMenuItem;
     MIImportarEropastryExpedicion: TMenuItem;
     CBPedidosCliente: TLFCheckBox;
     CBCalculaStock: TLFCheckBox;
     EFAlmacenStock: TLFEditFind2000;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure EFProveedorExiste(Sender: TObject);
     procedure TButtRegeneraClick(Sender: TObject);
     procedure TButtLineasServidasClick(Sender: TObject);
     procedure TButtLineasNoServidasClick(Sender: TObject);
     procedure TButtMarcarTodasClick(Sender: TObject);
     procedure TButtCerrarYMarcarPedidoClick(Sender: TObject);
     procedure TButtGenerarFacturaClick(Sender: TObject);
     procedure EFProveedorBusqueda(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
     procedure TButtRecibirTodasunidadeslineaClick(Sender: TObject);
     procedure TButtRecibirTodasunidadesTodosClick(Sender: TObject);
     procedure TButtServirClick(Sender: TObject);
     procedure TButtMultiLotesClick(Sender: TObject);
     procedure TButtMarcarTodasProcClick(Sender: TObject);
     procedure EFPortesChange(Sender: TObject);
     procedure EFCanalDestChange(Sender: TObject);
     procedure EdLineasAProcChange(Sender: TObject);
     procedure AProveedorExecute(Sender: TObject);
     procedure SBAProveedorDblClick(Sender: TObject);
     procedure EFNumPedidoBusqueda(Sender: TObject);
     procedure EFNumPedidoChange(Sender: TObject);
     procedure EFEjercicioPedidoChange(Sender: TObject);
     procedure DBGFPedidosDblClick(Sender: TObject);
     procedure DBGFPedidosRowChange(Sender: TObject);
     procedure ImgArticuloClick(Sender: TObject);
     procedure BMostrarImagenClick(Sender: TObject);
     procedure PNLNotasResize(Sender: TObject);
     procedure TButtImportarCSVClick(Sender: TObject);
     procedure TButtInicializarTodasClick(Sender: TObject);
     procedure AAsignacionCodigoBarraExecute(Sender: TObject);
     procedure DBGPedidosRelacionadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGPedidosRelacionadosCellClick(Column: TColumn);
     procedure DBGPedidosRelacionadosDblClick(Sender: TObject);
     procedure CBImagenChange(Sender: TObject);
     procedure PNLLineasPedidosResize(Sender: TObject);
     procedure PNLImagenResize(Sender: TObject);
     procedure DBGFPedidosCellClick(Column: TColumn);
     procedure DBGFPedidosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure EFDocDestinoChange(Sender: TObject);
     procedure EFDocDestinoBusqueda(Sender: TObject);
     procedure AImportarExcelExecute(Sender: TObject);
     procedure tmrImgArticuloTimer(Sender: TObject);
     procedure AImportarEropastryExecute(Sender: TObject);
     procedure AImportarEropastryExpedicionExecute(Sender: TObject);
     procedure CBPedidosClienteChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure CBCalculaStockChange(Sender: TObject);
  private
     { Private declarations }
     Param_ALPFECH001: string;
     marca, ImagenMaximizada: boolean;
     ColActualDet: TColumn;
     ColActual: TColumn;
     procedure MarcaDesmarcar;
     procedure InicializaPortes;
     procedure DamePortesProv(Proveedor: integer);
     procedure CompruebaPortes;
     procedure RefrescaHoraFechas;
     procedure FiltrarPedidos(aProveedor: integer; aSerie: string; aEjercicio, aNumPedido: integer);
     procedure MarcarServidos;
  public
     { Public declarations }
     CambiandoPedido: boolean;
     procedure Filtra(Ejercicio: integer; Serie: string; Proveedor, RIG: integer; Habilita: boolean = True);
  end;

var
  FMRecepcionPedidos : TFMRecepcionPedidos;

implementation

uses UDMRecepcionPedidos, UDMMain, UEntorno, UUtiles, UFMain, {$IFNDEF TPV}UFMostrarImagen, UFMAsignacionCodigoBarra, {$ENDIF} DB, UParam, DateUtils, UDameDato, UImagenes;

{$R *.DFM}

procedure TFMRecepcionPedidos.FormCreate(Sender: TObject);
var
  i, IdColumna : integer;
begin
  inherited;
  AbreData(TDMRecepcionPedidos, DMRecepcionPedidos);
  DBGFPedidos.ColumnasChecked.Strings[DBGFPedidos.ColumnasCheckBoxes.IndexOf('ENTRADA_RECEPCION')] :=
     IntToStr(REntorno.Entrada{DMRecepcionPedidos.Entrada});

  Param_ALPFECH001 := Trim(LeeParametro('ALPFECH001'));

  EFSerie.Text := REntorno.Serie;
  DTPFechaContabilizacion.Date := REntorno.FechaTrab;
  DTPFechaRecepcion.Date := REntorno.FechaTrab;
  DTPFechaDocumento.Date := REntorno.FechaTrab;
  RefrescaHoraFechas;
  EFCanalDest.Text := IntToStr(REntorno.Canal);
  EFDocDestino.Text := '';
  EFDocDestinoChange(Sender);
  marca := True;
  ImagenMaximizada := False;
  MarcaDesmarcar;

  if (DMMain.EstadoKri(165) = 1) then {Inhabilita el Traspaso directo a Factura}
     TButtGenerarFactura.Visible := False;

  InicializaPortes;

  if (REntorno.LineasAProc < 1) then
     REntorno.LineasAProc := 100;
  EdLineasAProc.Text := IntToStr(REntorno.LineasAProc);

  CBSeparaPedidos.Checked := (1 = DMRecepcionPedidos.SepararPedidosRecepcion);

  SolapaControles(SBAProveedor, ETitProveedor);
  ETitProveedor.Color := REntorno.ColorEnlaceActivo;

  {TOLYCOR}
  CambiandoPedido := False;

  TButtServir.Visible := False;
  TButtMarcarTodas.Visible := False;
  // TButtMultiLotes.Visible := False;

  // Se establece descripcion de Campos ALFA_n
  // Se hace aquí porque la traducción reemplaza los titulos
  for i := 1 to 8 do
  begin
     IdColumna := EncuentraField(DBGFPedidos, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGFPedidos.Columns[IdColumna].Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));
  end;

  ColActual := DBGFPedidos.Columns[0];
  ColActualDet := DBGPedidosRelacionados.Columns[0];

  // Imagen
  GetBitmapFromImageList(BMostrarImagen, 1, DMMain.ILMain_Ac, 23);

  tmrImgArticulo.Enabled := True;
end;

procedure TFMRecepcionPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRecepcionPedidos);
end;

procedure TFMRecepcionPedidos.FormShow(Sender: TObject);
begin
  inherited;
  CBPedidosClienteChange(Sender);
  CBCalculaStockChange(Sender);
end;

procedure TFMRecepcionPedidos.EFProveedorExiste(Sender: TObject);
begin
  {TOLYCOR}
  if (not CambiandoPedido) then
  begin
     EFEjercicioPedido.Text := '';
     EFNumPedido.Text := '';
     EFDocDestino.Text := '';
  end;

  InicializaPortes;
  ETitProveedor.Text := DameTituloProveedor(StrToIntDef(EFProveedor.Text, 0));

  try
     FiltrarPedidos(StrToIntDef(EFProveedor.Text, 0), EFSerie.Text, StrToIntDef(EFEjercicioPedido.Text, 0), StrToIntDef(EFNumPedido.Text, 0));
     if (ETitProveedor.Text > '') then
        DamePortesProv(StrToIntDef(EFProveedor.Text, 0));
  except
  end;

  marca := True;
  MarcaDesmarcar;
end;

procedure TFMRecepcionPedidos.TButtRegeneraClick(Sender: TObject);
begin
  try
     Screen.Cursor := crHourGlass;
     DMRecepcionPedidos.RefrescarPedidos;
  finally
     Screen.Cursor := crDefault;
  end;

  RefrescaHoraFechas;
end;

procedure TFMRecepcionPedidos.TButtLineasServidasClick(Sender: TObject);
begin
  DMRecepcionPedidos.MostrarLineasServidas(True);
  DMRecepcionPedidos.RefrescarPedidos;
end;

procedure TFMRecepcionPedidos.TButtLineasNoServidasClick(Sender: TObject);
begin
  DMRecepcionPedidos.MostrarLineasServidas(False);
  DMRecepcionPedidos.RefrescarPedidos;
end;

procedure TFMRecepcionPedidos.TButtMarcarTodasClick(Sender: TObject);
begin
  if Confirma then
     try
        Screen.Cursor := crHourGlass;
        DMRecepcionPedidos.MarcarLineasPedidos;
     finally
        Screen.Cursor := crDefault;
     end;
end;

procedure TFMRecepcionPedidos.TButtCerrarYMarcarPedidoClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
     marca := True;
     CompruebaPortes;

     if (CBMarcarServido.Checked) then
        MarcarServidos;

     DMRecepcionPedidos.TraspasarPedidosAAlbaran(marca, StrToIntDef(EFCanalDest.Text, 0),
        Trunc(DTPFechaContabilizacion.Date) + Frac(DTPHoraContabilizacion.Date),
        Trunc(DTPFechaRecepcion.Date) + Frac(DTPHoraRecepcion.Date),
        Trunc(DTPFechaDocumento.Date) + Frac(DTPHoraDocumento.Date),
        StrToIntDef(EFPortes.Text, 0),
        StrToFloatDec(EPorPortes.Text, DecimalSeparator),
        StrToFloatDec(EIPortes.Text, DecimalSeparator),
        CBSeparaPedidos.Checked, StrToIntDef(EFDocDestino.Text, 0));

     MarcaDesmarcar;
  finally
     Screen.Cursor := crDefault;
  end;

  RefrescaHoraFechas;
end;

procedure TFMRecepcionPedidos.TButtGenerarFacturaClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
     marca := True;
     CompruebaPortes;

     if (CBMarcarServido.Checked) then
        MarcarServidos;

     DMRecepcionPedidos.TraspasarPedidosAFactura(marca, StrToIntDef(EFCanalDest.Text, 0),
        Trunc(DTPFechaContabilizacion.Date) + Frac(DTPHoraContabilizacion.Date),
        Trunc(DTPFechaRecepcion.Date) + Frac(DTPHoraRecepcion.Date),
        Trunc(DTPFechaDocumento.Date) + Frac(DTPHoraDocumento.Date),
        StrToIntDef(EFPortes.Text, 0),
        StrToFloatDec(EPorPortes.Text, DecimalSeparator),
        StrToFloatDec(EIPortes.Text, DecimalSeparator),
        CBSeparaPedidos.Checked, StrToIntDef(EFDocDestino.Text, 0));

     MarcaDesmarcar;
  finally
     Screen.Cursor := crDefault;
  end;

  RefrescaHoraFechas;
end;

procedure TFMRecepcionPedidos.EFProveedorBusqueda(Sender: TObject);
begin
  EFProveedor.SelectSQL.Clear;
  EFProveedor.SelectSQL.Add('SELECT DISTINCT(PROVEEDOR), TITULO FROM VER_PROVEEDORES_RECEPCION');
  EFProveedor.CondicionBusqueda := 'EMPRESA = ' + REntorno.EmpresaStr +
     ' AND EJERCICIO <= ' + REntorno.EjercicioStr +
     ' AND CANAL = ' + REntorno.CanalStr + ' AND SERIE = ''' + EFSerie.Text + '''';
end;

procedure TFMRecepcionPedidos.EFSerieChange(Sender: TObject);
begin
  ETitSerie.Text := DameTituloSerie(EFSerie.Text);
  FiltrarPedidos(StrToIntDef(EFProveedor.Text, 0), EFSerie.Text, StrToIntDef(EFEjercicioPedido.Text, 0), StrToIntDef(EFNumPedido.Text, 0));
end;

procedure TFMRecepcionPedidos.TButtRecibirTodasunidadeslineaClick(Sender: TObject);
begin
  DMRecepcionPedidos.RecibirUnidadesLinea;
end;

procedure TFMRecepcionPedidos.TButtServirClick(Sender: TObject);
begin
  if Confirma then
     DMRecepcionPedidos.ServirMarcados(Trunc(DTPFechaRecepcion.Date) + Frac(DTPHoraRecepcion.Date));

  RefrescaHoraFechas;
end;

procedure TFMRecepcionPedidos.TButtMultiLotesClick(Sender: TObject);
begin
  DMRecepcionPedidos.ConfiguraLotes;
end;

procedure TFMRecepcionPedidos.TButtMarcarTodasProcClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
     DMRecepcionPedidos.MarcarLineasPedidosProc(Marca);
     Marca := (not Marca);
     MarcaDesmarcar;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFMRecepcionPedidos.MarcaDesmarcar;
begin
  if marca then
  begin
     TButtMarcarTodasProc.Hint := _('Marcar como procesadas todas las líneas');
     TButtMarcarTodasProc.ImageIndex := 118;
  end
  else
  begin
     TButtMarcarTodasProc.Hint := _('Desmarcar todas las líneas marcadas como procesadas');
     TButtMarcarTodasProc.ImageIndex := 39;
  end;
end;

procedure TFMRecepcionPedidos.EFPortesChange(Sender: TObject);
begin
  if ((EFPortes.Text <> '')) then
  begin
     if (StrToInt(EFPortes.Text) <= 2) then
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
     ETituloPortes.Text := DameTituloPorte(StrToIntDef(EFPortes.Text, 0));
  end;
end;

procedure TFMRecepcionPedidos.DamePortesProv(Proveedor: integer);
var
  I_Portes, Por_Portes : double;
  Tipo_Portes : integer;
begin
  DMRecepcionPedidos.DamePortes(Proveedor, I_Portes, Por_Portes, Tipo_Portes);
  EFPortes.Text := IntToStr(Tipo_Portes);
  EIPortes.Text := FloatToStr(I_Portes);
  EPorPortes.Text := FloatToStr(Por_Portes);
end;

procedure TFMRecepcionPedidos.InicializaPortes;
begin
  EFPortes.Text := '';
  EIPortes.Text := '';
  EPorPortes.Text := '';
end;

procedure TFMRecepcionPedidos.CompruebaPortes;
begin
  if (EFPortes.Text = '') then
     raise Exception.Create(_('El campo tipo de portes no puede ser vacio'));
end;

procedure TFMRecepcionPedidos.EFCanalDestChange(Sender: TObject);
begin
  ETitCanalDest.Text := DameTituloCanal(StrToIntDef(EFCanalDest.Text, REntorno.Canal));
end;

procedure TFMRecepcionPedidos.EdLineasAProcChange(Sender: TObject);
begin
  if (EdLineasAProc.Text <> '') then
     REntorno.LineasAProc := StrToIntDef(EdLineasAProc.Text, 100);
  if (REntorno.LineasAProc < 1) then
     REntorno.LineasAProc := 100;
end;

procedure TFMRecepcionPedidos.AProveedorExecute(Sender: TObject);
begin
  if (StrToIntDef(EFProveedor.Text, 0) <> 0) then
     FMain.EjecutaAccion(FMain.AProveedores, 'proveedor=' +
        EFProveedor.Text + ' and ejercicio=' + REntorno.EjercicioStr);
end;

procedure TFMRecepcionPedidos.SBAProveedorDblClick(Sender: TObject);
begin
  AProveedor.Execute;
end;

{TOLYCOR}
procedure TFMRecepcionPedidos.EFNumPedidoBusqueda(Sender: TObject);
begin
  with EFNumPedido do
  begin
     CondicionBusqueda := ' TIPO=''PEP'' AND ESTADO < 2';
     if (Trim(EFSerie.Text) <> '') then
        CondicionBusqueda := CondicionBusqueda + ' AND SERIE=''' + EFSerie.Text + '''';
     if (StrToIntDef(EFEjercicioPedido.Text, 0) <> 0) then
        CondicionBusqueda := CondicionBusqueda + ' AND EJERCICIO=' + EFEjercicioPedido.Text
     else
        CondicionBusqueda := CondicionBusqueda + ' AND EJERCICIO<=' + REntorno.EjercicioStr;
     if (StrToIntDef(EFProveedor.Text, 0) <> 0) then
        CondicionBusqueda := CondicionBusqueda + ' AND PROVEEDOR=' + EFProveedor.Text;
  end;
end;

procedure TFMRecepcionPedidos.EFNumPedidoChange(Sender: TObject);
var
  OldProveedor : string;
  OldEjercicio : string;
begin
  // Busco el proveedor de ese pedido y lo aplico al EditFind para que filtre

  if (not CambiandoPedido) then
  begin
     OldProveedor := EFProveedor.Text;
     OldEjercicio := EFEjercicioPedido.Text;
     CambiandoPedido := True;
     EFProveedor.Text := '';
     EFEjercicioPedido.Text := '';
     CambiandoPedido := False;
     if (StrToIntDef(EFNumPedido.Text, 0) <> 0) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT PROVEEDOR, ACEPTA_ENTREGA_PARCIAL FROM GES_CABECERAS_E_PED ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = ?EMPRESA AND ');
              if (StrToIntDef(OldEjercicio, 0) <> 0) then
                 SQL.Add(' EJERCICIO = ?EJERCICIO AND ')
              else
                 SQL.Add(' EJERCICIO <= ?EJERCICIO AND ');
              SQL.Add(' CANAL = ?CANAL AND ');
              SQL.Add(' SERIE = ?SERIE AND ');
              SQL.Add(' TIPO = ''PEP'' AND ');
              SQL.Add(' RIG = ?RIG ');
              SQL.Add(' ORDER BY EJERCICIO DESC, RIG ');

              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              if (StrToIntDef(OldEjercicio, 0) <> 0) then
                 Params.ByName['EJERCICIO'].AsInteger := StrToInt(OldEjercicio)
              else
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['SERIE'].AsString := EFSerie.Text;
              Params.ByName['RIG'].AsInteger := StrToInt(EFNumPedido.Text);
              ExecQuery;
              CambiandoPedido := True;
              EFProveedor.Text := FieldByName['PROVEEDOR'].AsString;
              EFEjercicioPedido.Text := OldEjercicio;
              CambiandoPedido := False;
              FreeHandle;
           finally
              Free;
           end;
        end;

        FiltrarPedidos(StrToIntDef(EFProveedor.Text, 0), EFSerie.Text, StrToIntDef(EFEjercicioPedido.Text, 0), StrToIntDef(EFNumPedido.Text, 0));
     end
     else
     begin
        EFEjercicioPedido.Text := OldEjercicio;
        EFProveedor.Text := OldProveedor;
     end;
  end;
end;

procedure TFMRecepcionPedidos.EFEjercicioPedidoChange(Sender: TObject);
begin
  if (not CambiandoPedido) then
  begin
     CambiandoPedido := True;
     EFNumPedido.Text := '';
     CambiandoPedido := False;
  end;
end;

procedure TFMRecepcionPedidos.RefrescaHoraFechas;
begin
  DTPHoraContabilizacion.Time := Time;
  DTPHoraRecepcion.Time := Time;
  DTPHoraDocumento.Time := Time;
  if (Param_ALPFECH001 <> '') then
     DTPHoraDocumento.Time := RecodeTime(Time, StrToIntDef(Copy(Param_ALPFECH001, 1, 2), 0), StrToIntDef(Copy(Param_ALPFECH001, 4, 2), 0), StrToIntDef(Copy(Param_ALPFECH001, 7, 2), 0), 0);
end;

procedure TFMRecepcionPedidos.DBGFPedidosDblClick(Sender: TObject);
begin
  if ((UpperCase(ColActual.FieldName) = 'EJERCICIO') or (UpperCase(ColActual.FieldName) = 'RIG') or (UpperCase(ColActual.FieldName) = 'LINEA')) then
     FMain.TraspasoDeDocumentosEntrada(DMRecepcionPedidos.QMDetalleID_E.AsInteger);

  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
     FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' +
        DMRecepcionPedidos.QMDetalleARTICULO.AsString + '''' +
        ' AND EJERCICIO=' + REntorno.EjercicioStr);
end;

procedure TFMRecepcionPedidos.Filtra(Ejercicio: integer; Serie: string; Proveedor, RIG: integer; Habilita: boolean = True);
begin
  EFSerie.Text := Serie;
  EFProveedor.Text := IntToStr(Proveedor);
  EFEjercicioPedido.Text := IntToStr(Ejercicio);
  EFNumPedido.Text := IntToStr(RIG);

  EFSerie.Enabled := Habilita;
  EFProveedor.Enabled := Habilita;
  // TButtRegenera.Enabled := Habilita;
  TButtLineasServidas.Enabled := Habilita;
  TButtLineasNoServidas.Enabled := Habilita;
  TButtServir.Enabled := Habilita;
  TButtMarcarTodas.Enabled := Habilita;
  TButtRecibirTodasunidadeslinea.Enabled := Habilita;
  TButtGenerarFactura.Enabled := Habilita;
  TButtMultiLotes.Enabled := Habilita;
end;

procedure TFMRecepcionPedidos.DBGFPedidosRowChange(Sender: TObject);
begin
  tmrImgArticulo.Enabled := False;
  tmrImgArticulo.Enabled := True;
end;

procedure TFMRecepcionPedidos.FiltrarPedidos(aProveedor: integer; aSerie: string; aEjercicio, aNumPedido: integer);
begin
  DMRecepcionPedidos.FiltrarPedidos(aProveedor, aSerie, aEjercicio, aNumPedido);
  // Para refrescar la imagen
  DBGFPedidosRowChange(Self);
end;

procedure TFMRecepcionPedidos.ImgArticuloClick(Sender: TObject);
begin
  ImagenMaximizada := not ImagenMaximizada;

  if (ImagenMaximizada) then
  begin
     ImgArticulo.Hint := _('Click para minimizar');
     PNLImagen.Width := 2 * (PMain.Width div 3);
     PNLPie.Height := 2 * (PMain.Height div 3);
  end
  else
  begin
     ImgArticulo.Hint := _('Click para maximizar');
     PNLImagen.Width := 200;
     PNLPie.Height := 50;
  end;
end;

procedure TFMRecepcionPedidos.BMostrarImagenClick(Sender: TObject);
begin
  {$IFNDEF TPV}
  MuestraImagen(DMRecepcionPedidos.xArticulo.FieldByName('IMAGEN').AsInteger);
  {$ENDIF}
end;

procedure TFMRecepcionPedidos.PNLNotasResize(Sender: TObject);
begin
  PNLNotasCompraArticulo.Width := PNLNotas.Width div 2;
end;

procedure TFMRecepcionPedidos.TButtRecibirTodasunidadesTodosClick(Sender: TObject);
begin
  DMRecepcionPedidos.RecibirUnidadesLineaTodas;
end;

procedure TFMRecepcionPedidos.TButtImportarCSVClick(Sender: TObject);
var
  ts : TStrings;
  i, Pedido, n, fin, Encontrados : integer;
  Archivo, s, Articulo, Texto : string;
  Unidades : double;
  BM : TBookmark;
begin
  inherited;

  Archivo := '';
  with TOpenDialog.Create(nil) do
  begin
     try
        Filter := _('Fichero CSV|*.csv|Todos los archivos|*.*');
        FilterIndex := 1;
        InitialDir := REntorno.DirectorioLector;
        Title := _('Carga fichero de importacion');
        if (Execute) then
           Archivo := FileName;
     finally
        Free;
     end;
  end;

  if (Archivo > '') then
  begin
     Encontrados := 0;
     i := 0;
     BM := DMRecepcionPedidos.QMDetalle.GetBookmark;
     try
        ts := TStringList.Create;
        with ts do
        begin
           try
              LoadFromFile(Archivo);
              while (i < Count) do
              begin
                 Texto := ts[i];
                 n := 0;
                 Unidades := 0;
                 Pedido := 0;
                 Articulo := '';

                 //                             Pedido   Articulo Und
                 //24/11/2017;al1751978;PV834127;321;321;80020193;;1;Uds;CASQUILLO 47 REDONDO PTCO  E-12X12;

                 repeat
                    fin := Pos(';', Texto);
                    case n of
                       3: Pedido := StrToIntDef(Trim(Copy(Texto, 0, fin - 1)), 0);
                       5: Articulo := Trim(Copy(Texto, 0, fin - 1));
                       7: Unidades := StrToFloatDef(Trim(Copy(Texto, 0, fin - 1)), 0);
                    end;
                    System.Delete(Texto, 1, fin);
                    Inc(n);
                 until not ((fin > 0) and (n <= 7));

                 if (Unidades > 0) then
                 begin
                    // Busco si esta
                    // Si esta informo las unidades
                    with DMRecepcionPedidos.QMDetalle do
                    begin
                       DisableControls;
                       try
                          First;
                          while (not EOF) do
                          begin
                             if ((DMRecepcionPedidos.QMDetalleARTICULO.AsString = Articulo) and (DMRecepcionPedidos.QMDetalleRIG.AsInteger = Pedido)) then
                             begin
                                Inc(Encontrados);
                                try
                                   Edit;
                                   DMRecepcionPedidos.QMDetalleUNIDADES_RECEPCION.AsFloat := Unidades;
                                   Post;
                                   Last;
                                except
                                   on e: Exception do
                                   begin
                                      Cancel;
                                      s := Format(_('Error informando unidades. Pedido %d Articulo %s x %8.2n. ¿Desea continuar?'), [Pedido, Articulo, Unidades]) + #13#10 + #13#10 + E.Message;
                                      if MessageDlg(s, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                                         i := Count;
                                   end;
                                end;
                             end;
                             Next;
                          end;
                       finally
                          EnableControls;
                       end;
                    end;
                 end;

                 Inc(i);
              end;
           finally
              Free;
           end;
           DMRecepcionPedidos.QMDetalle.GotoBookmark(BM);
           s := _('Proceso finalizado.') + #13#10 + Format(_('Se han recibido %d líneas de un total de %d.'), [Encontrados, i]);
           MessageDlg(s, mtInformation, [mbOK], 0);
        end;
     finally
        DMRecepcionPedidos.QMDetalle.FreeBookmark(BM);
     end;
  end;
end;

procedure TFMRecepcionPedidos.TButtInicializarTodasClick(Sender: TObject);
begin
  DMRecepcionPedidos.InicializarUnidadesTodas;
end;

procedure TFMRecepcionPedidos.AAsignacionCodigoBarraExecute(Sender: TObject);
{$IFNDEF TPV}
var
  IdDetallesE : integer;
  ListaIdArticulo : string;
{$ENDIF}
begin
  inherited;
{$IFNDEF TPV}
  ListaIdArticulo := '';

  // Genero listad de ID_A
  with DMRecepcionPedidos.QMDetalle do
  begin
     if Active then
     begin
        IdDetallesE := FieldByName('ID_DETALLES_E').AsInteger;
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

           Posicionar(DMRecepcionPedidos.QMDetalle, 'ID_DETALLES_E', IdDetallesE);
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

procedure TFMRecepcionPedidos.DBGPedidosRelacionadosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'EJERCICIO') or (UpperCase(Column.FieldName) = 'CANAL') or (UpperCase(Column.FieldName) = 'SERIE') or (UpperCase(Column.FieldName) = 'TIPO') or (UpperCase(Column.FieldName) = 'RIG')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);
end;

procedure TFMRecepcionPedidos.DBGPedidosRelacionadosCellClick(Column: TColumn);
begin
  inherited;
  ColActualDet := Column;
end;

procedure TFMRecepcionPedidos.DBGPedidosRelacionadosDblClick(Sender: TObject);
begin
  inherited;
  if ((UpperCase(ColActualDet.FieldName) = 'EJERCICIO') or (UpperCase(ColActualDet.FieldName) = 'CANAL') or (UpperCase(ColActualDet.FieldName) = 'SERIE') or (UpperCase(ColActualDet.FieldName) = 'TIPO') or (UpperCase(ColActualDet.FieldName) = 'RIG')) then
     FMain.TraspasoDeDocumentosSalida(DMRecepcionPedidos.xRelacionID_S.AsInteger);
end;

procedure TFMRecepcionPedidos.CBImagenChange(Sender: TObject);
begin
  inherited;
  DBGFPedidosRowChange(Sender);
end;

procedure TFMRecepcionPedidos.PNLLineasPedidosResize(Sender: TObject);
begin
  inherited;
  DBGPedidosRelacionados.Height := PNLLineasPedidos.Height div 3;
end;

procedure TFMRecepcionPedidos.PNLImagenResize(Sender: TObject);
begin
  inherited;
  BMostrarImagen.Top := 0;
  BMostrarImagen.Left := PNLImagen.Width - BMostrarImagen.Width;
  CBImagen.Top := 0;
  CBImagen.Left := 3;
end;

procedure TFMRecepcionPedidos.DBGFPedidosCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMRecepcionPedidos.DBGFPedidosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'EJERCICIO') or (UpperCase(Column.FieldName) = 'RIG') or (UpperCase(Column.FieldName) = 'ARTICULO')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'LOTE') then
        begin
           if (DMRecepcionPedidos.QMDetalleLOTEABLE.AsInteger = 1) then
              ColorInfo(Canvas)
           else
              ColorInactivo(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'PEDIDOS_D_CLI') then
        begin
           if (DMRecepcionPedidos.QMDetalle.FieldByName('PEDIDOS_D_CLI').AsFloat > 0) then
              ColorResaltado3(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'STOCK_ALM') then
        begin
           if (DMRecepcionPedidos.QMDetalle.FieldByName('STOCK_ALM').AsFloat > DMRecepcionPedidos.QMDetalle.FieldByName('PEDIDOS_D_CLI').AsFloat) then
              ColorResaltado2(Canvas)
           else
              ColorError(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMRecepcionPedidos.EFDocDestinoChange(Sender: TObject);
begin
  inherited;
  if (EFDocDestino.Text = '') then
     EDocDestino.Text := _('Segun reglas de creacion de documento')
  else
  begin
     // Buscar documento segun id_e
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT TIPO || ''-'' || EJERCICIO || ''-'' || SERIE || ''/'' || RIG AS DOCUMENTO');
           SQL.Add(' FROM GES_CABECERAS_E ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_E = :ID_E ');
           Params.ByName['ID_E'].AsInteger := StrToIntDef(EFDocDestino.Text, 0);
           ExecQuery;
           EDocDestino.Text := FieldByName['DOCUMENTO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;

  end;
end;

procedure TFMRecepcionPedidos.EFDocDestinoBusqueda(Sender: TObject);
begin
  inherited;
  EFDocDestino.CondicionBusqueda := 'PROVEEDOR = ' + IntToStr(StrToIntDef(EFProveedor.Text, 0)) + ' AND TIPO IN (''ALP'', ''FAP'') AND ESTADO = 0';
end;

procedure TFMRecepcionPedidos.MarcarServidos;
begin
  DMRecepcionPedidos.MarcarServidos;
end;

procedure TFMRecepcionPedidos.AImportarExcelExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  Archivo := '';
  if (MyOpenDialog(Archivo, 'XLS,ODS,CSV,ALL', '', 'FMRecepcionPedidos-ImportarExcel')) then
  begin
     DMRecepcionPedidos.ImportarXLS(Archivo);
  end;
end;

procedure TFMRecepcionPedidos.tmrImgArticuloTimer(Sender: TObject);
begin
  inherited;
  tmrImgArticulo.Enabled := False;
  if ((DMRecepcionPedidos.xArticulo.Active) and (CBImagen.Checked)) then
  begin
     try
        RefrescarImagen(ImgArticulo, DMRecepcionPedidos.xArticulo.FieldByName('IMAGEN').AsInteger)
     except
        ImgArticulo.Picture := nil;
     end;
  end
  else
     ImgArticulo.Picture := nil;
end;

procedure TFMRecepcionPedidos.AImportarEropastryExecute(Sender: TObject);
var
  Archivo : string;
  sl : TStrings;
  i : integer;
  Fijo, CodProv, Lote, Fecha6 : string;
  Articulo : string;
  Fecha : TDateTime;
  Error : boolean;
begin
  inherited;
  {
  Fichero de Ejemplo:
  010842446500028310431109315260430
  010842446527520910501301115260408
  010842446527520910501301115260408
  010842446527520910501301115260408
  010842446527520910501301115260408
  010842446569273010502805515260128
  010842446569273010502805515260128
  010842446569273010502805515260128
  010842446562671110432510415251120
  01084244656267111432510415-251120

  FIJO-------C_PRO-???-LOTE--- ??--FECHA
  0108424465 88833 110 50830V3 15 260617
           1         2         3         4
  123456789|123456789|123456789|123456789|
  FFFFFFFFFFCCCCCLLLLLLLLLLLLYYMMDD
  01084244658883311050830V315260617
  <        ><   >< ><     ><><    >
  }
  if (StrToIntDef(EFProveedor.Text, 0) = 0) then
     ShowMessage(_('Debe elegir un proveedor'))
  else
  begin
     Archivo := 'Europastry.txt';
     if MyOpenDialog(Archivo, 'TXT', '', 'FMRecepcionPedidos_ImportarEropastry') then
     begin
        sl := TStringList.Create;
        try
           sl.LoadFromFile(Archivo);

           for i := 0 to sl.Count - 1 do
           begin
              Error := False;

              if (Length(sl[i]) <> 33) then
              begin
                 Error := True;
                 ShowMessage(format('Linea %d - La lectura tiene longitud incorrecta' + #13#10 + '%s - Longitud=%d', [i, sl[i], Length(sl[i])]));
              end;

              if (not Error) then
              begin
                 // Divido linea
                 Fijo := Copy(sl[i], 1, 10);
                 CodProv := Copy(sl[i], 11, 5); // Codigo del articulo segun el proveedor
                 Lote := Copy(sl[i], 19, 7);
                 Fecha6 := Copy(sl[i], 28, 6); // Formato: yymmdd

                 Error := not TryEncodeDate(2000 + StrToIntDef(Copy(Fecha6, 1, 2), 0), StrToIntDef(Copy(Fecha6, 3, 2), 0), StrToIntDef(Copy(Fecha6, 5, 2), 0), Fecha);
                 if Error then
                    ShowMessage(format('Linea %d - Fecha no valida (%s -> YMD:%d/%d/%d)', [i, Fecha6, 2000 + StrToIntDef(Copy(Fecha6, 1, 2), 0), StrToIntDef(Copy(Fecha6, 3, 2), 0), StrToIntDef(Copy(Fecha6, 5, 2), 0)]));
              end;

              if (not Error) then
              begin
                 // Busco el articulo segun el codigo del proveedor
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' SELECT ARTICULO FROM ART_ARTICULOS_CODPROV ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' EMPRESA = :EMPRESA AND ');
                       SQL.Add(' PROVEEDOR = :PROVEEDOR AND ');
                       SQL.Add(' CODIGO_PROVEEDOR = :CODIGO_PROVEEDOR ');
                       Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                       Params.ByName['PROVEEDOR'].AsInteger := StrToIntDef(EFProveedor.Text, 0);
                       Params.ByName['CODIGO_PROVEEDOR'].AsString := CodProv;
                       ExecQuery;
                       Articulo := FieldByName['ARTICULO'].AsString;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 if (Articulo = '') then
                 begin
                    Error := True;
                    ShowMessage(format('Linea %d - No se ecuentra articulo para el codigo de proveedor (%s)', [i, CodProv]));
                 end;
              end;

              if not Error then
              begin
                 with DMRecepcionPedidos.QMDetalle do
                 begin
                    DisableControls;
                    try
                       First;
                       while (not EOF) and (FieldByName('CODIGO_PROVEEDOR').AsString <> CodProv) do
                          Next;

                       if (FieldByName('CODIGO_PROVEEDOR').AsString = CodProv) then
                       begin
                          // Asigno lote a la linea o agrego unidades
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add(' UPDATE OR INSERT INTO TMP_TRASPASO_PEDIDO_LOTES ( ');
                                SQL.Add(' ENTRADA, ID_DETALLES, LINEA, LOTE, F_ENVASADO, F_CADUCIDAD, F_FABRICACION, ALMACEN, ARTICULO, SERIE, CLASIFICACION, ');
                                SQL.Add(' ID_A, TIPO, ERROR, PROVEEDOR, ID_LOTE, ID_A_UBICACION, UNIDADES) ');
                                SQL.Add(' VALUES ( ');
                                SQL.Add(' :ENTRADA, :ID_DETALLES_E, :LINEA, :LOTE, /*F_ENVASADO*/ NULL, :F_CADUCIDAD, ');
                                SQL.Add(' /*F_FABRICACION*/ NULL, :ALMACEN, :ARTICULO, :SERIE, :CLASIFICACION, :ID_A, :TIPO, :ERROR, :PROVEEDOR, :ID_LOTE, ');
                                SQL.Add(' :ID_A_UBICACION, COALESCE((SELECT UNIDADES ');
                                SQL.Add('                             FROM TMP_TRASPASO_PEDIDO_LOTES ');
                                SQL.Add('                             WHERE ');
                                SQL.Add('                             ENTRADA = :ENTRADA AND ');
                                SQL.Add('                             ID_DETALLES = :ID_DETALLES_E AND ');
                                SQL.Add('                             TIPO = :TIPO AND ');
                                SQL.Add('                             LINEA = :LINEA), 0) + :UNIDADES) ');
                                SQL.Add(' MATCHING (ENTRADA, ID_DETALLES, TIPO, LINEA) ');
                                Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                Params.ByName['ID_DETALLES_E'].AsInteger := DMRecepcionPedidos.QMDetalle.FieldByName('ID_DETALLES_E').AsInteger;
                                Params.ByName['LINEA'].AsInteger := DMRecepcionPedidos.QMDetalle.FieldByName('LINEA').AsInteger;
                                Params.ByName['LOTE'].AsString := Lote;
                                Params.ByName['UNIDADES'].AsInteger := 1;
                                // Params.ByName['F_ENVASADO'].AsDateTime := ;
                                Params.ByName['F_CADUCIDAD'].AsDateTime := Fecha;
                                // Params.ByName['F_FABRICACION'].AsDateTime := ;
                                Params.ByName['ALMACEN'].AsString := DMRecepcionPedidos.QMDetalle.FieldByName('ALMACEN').AsString;
                                Params.ByName['ARTICULO'].AsString := DMRecepcionPedidos.QMDetalle.FieldByName('ARTICULO').AsString;
                                Params.ByName['SERIE'].AsString := DMRecepcionPedidos.QMDetalle.FieldByName('SERIE').AsString;
                                Params.ByName['CLASIFICACION'].AsString := 'GEN';
                                Params.ByName['ID_A'].AsInteger := DMRecepcionPedidos.QMDetalle.FieldByName('ID_A').AsInteger;
                                Params.ByName['TIPO'].AsString := 'PEP';
                                Params.ByName['ERROR'].AsInteger := 0;
                                Params.ByName['PROVEEDOR'].AsInteger := StrToIntDef(EFProveedor.Text, 0);
                                Params.ByName['ID_LOTE'].AsInteger := 0;
                                Params.ByName['ID_A_UBICACION'].AsInteger := 0;
                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;

                          Edit;
                          FieldByName('UNIDADES_RECEPCION').AsFloat := FieldByName('UNIDADES_RECEPCION').AsFloat + 1;
                          Post;
                       end;
                    finally
                       EnableControls;
                    end;
                 end;
              end;
           end;
        finally
           sl.Free;
        end;
     end;
  end;
end;

procedure TFMRecepcionPedidos.AImportarEropastryExpedicionExecute(Sender: TObject);
var
  Archivo : string;
  sl : TStrings;
  slCol : TStringList;
  s, l : string;
  i, j : integer;
  Fijo, CodProv, Lote, Fecha8, Cajas : string;
  Articulo : string;
  FechaCaducidad : TDateTime;
  Error : boolean;
begin
  inherited;
  {
  Fichero de Ejemplo: (Hay una linea vacia entre cada linea de datos. Sera ignorada)
  70763359;70762769;454056;DISFORNER CONG. D'ARTESANIA S.L;00100;Croissant Mini Manteca (12KG);5013073;13/01/26;12;;;;0;0;0

  70763359;70762769;454056;DISFORNER CONG. D'ARTESANIA S.L;00225;Triangulo Croissant (126 u);4204060;22/07/25;7;;;;0;0;0
  70763359;70762769;454056;DISFORNER CONG. D'ARTESANIA S.L;00225;Triangulo Croissant (126 u);5007066;07/01/26;9;;;;0;0;0
  1        2        3      4                               5                                   6       7        8  ...
  FIJO----|FIJO----|?-----|?------------------------------|ART--|-----------------------------|LOTE---|F.CAD---|CJ||||-|-|-
  70763359;70762769;454056;DISFORNER CONG. D'ARTESANIA S.L;00100;Croissant Mini Manteca (12KG);5013073;13/01/26;12;;;;0;0;0
  }
  if (StrToIntDef(EFProveedor.Text, 0) = 0) then
     ShowMessage(_('Debe elegir un proveedor'))
  else
  begin
     Archivo := '';
     if MyOpenDialog(Archivo, 'TXT', '', 'FMRecepcionPedidos_ImportarEropastryExpedicion') then
     begin
        sl := TStringList.Create;
        slCol := TStringList.Create;
        try
           sl.LoadFromFile(Archivo);

           for i := 0 to sl.Count - 1 do
           begin
              Fijo := '';
              CodProv := '';
              Lote := '';
              Fecha8 := '';
              Cajas := '';
              Error := False;

              slCol.Clear;
              { Debo separar a mano porque los espacios también se definen como delimitador
              slCol.Delimiter := ';';
              slCol.DelimitedText := sl[i];
              }
              s := '';
              l := sl[i];
              for j := 1 to Length(l) do
              begin
                 if l[j] = ';' then
                 begin
                    slCol.Add(s);
                    s := '';
                 end
                 else
                 begin
                    s := s + l[j];
                 end;
              end;
              if Length(l) > 0 then
                 slCol.Add(s);

              if (slCol.Count < 8) then
              begin
                 Error := True;
                 // Si no tiene columnas es una linea valida pero no se tratara
                 if (slCol.Count > 0) then
                    ShowMessage(format('Linea %d - La lectura tiene longitud incorrecta' + #13#10 + '%s - Columnas=%d', [i, sl[i], slCol.Count]));
              end;

              if (not Error) then
              begin
                 // Divido linea
                 Fijo := Trim(slCol[0]);
                 CodProv := Trim(slCol[4]); // Codigo del articulo segun el proveedor
                 Lote := Trim(slCol[6]);
                 Fecha8 := Trim(slCol[7]); // Formato: dd/mm/yy
                 Cajas := Trim(slCol[8]);

                 Error := not TryEncodeDate(2000 + StrToIntDef(Copy(Fecha8, 7, 2), 0), StrToIntDef(Copy(Fecha8, 4, 2), 0), StrToIntDef(Copy(Fecha8, 1, 2), 0), FechaCaducidad);
                 if Error then
                    ShowMessage(format('Linea %d - Fecha no valida (%s -> yy/mm/dd:%d/%d/%d)', [i, Fecha8, 2000 + StrToIntDef(Copy(Fecha8, 7, 2), 0), StrToIntDef(Copy(Fecha8, 4, 2), 0), StrToIntDef(Copy(Fecha8, 1, 2), 0)]));

                 Error := (StrToIntDef(Cajas, -999999) = -999999);
                 if Error then
                    ShowMessage(format('Linea %d - No se puede convertir el datos Cajas (numerico) (%s)', [i, Cajas]));
              end;

              if (not Error) then
              begin
                 // Busco el articulo segun el codigo del proveedor
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' SELECT ARTICULO FROM ART_ARTICULOS_CODPROV ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' EMPRESA = :EMPRESA AND ');
                       SQL.Add(' PROVEEDOR = :PROVEEDOR AND ');
                       SQL.Add(' CODIGO_PROVEEDOR = :CODIGO_PROVEEDOR ');
                       Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                       Params.ByName['PROVEEDOR'].AsInteger := StrToIntDef(EFProveedor.Text, 0);
                       Params.ByName['CODIGO_PROVEEDOR'].AsString := CodProv;
                       ExecQuery;
                       Articulo := FieldByName['ARTICULO'].AsString;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 if (Articulo = '') then
                 begin
                    Error := True;
                    ShowMessage(format('Linea %d - No se ecuentra articulo para el codigo de proveedor (%s)', [i, CodProv]));
                 end;
              end;

              if not Error then
              begin
                 with DMRecepcionPedidos.QMDetalle do
                 begin
                    DisableControls;
                    try
                       First;
                       while (not EOF) and (FieldByName('CODIGO_PROVEEDOR').AsString <> CodProv) do
                          Next;

                       if (FieldByName('CODIGO_PROVEEDOR').AsString = CodProv) then
                       begin
                          // Asigno lote a la linea o agrego unidades
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add(' UPDATE OR INSERT INTO TMP_TRASPASO_PEDIDO_LOTES ( ');
                                SQL.Add(' ENTRADA, ID_DETALLES, LINEA, LOTE, F_ENVASADO, F_CADUCIDAD, F_FABRICACION, ALMACEN, ARTICULO, SERIE, CLASIFICACION, ');
                                SQL.Add(' ID_A, TIPO, ERROR, PROVEEDOR, ID_LOTE, ID_A_UBICACION, UNIDADES) ');
                                SQL.Add(' VALUES ( ');
                                SQL.Add(' :ENTRADA, :ID_DETALLES_E, :LINEA, :LOTE, /*F_ENVASADO*/ NULL, :F_CADUCIDAD, ');
                                SQL.Add(' /*F_FABRICACION*/ NULL, :ALMACEN, :ARTICULO, :SERIE, :CLASIFICACION, :ID_A, :TIPO, :ERROR, :PROVEEDOR, :ID_LOTE, ');
                                SQL.Add(' :ID_A_UBICACION, COALESCE((SELECT UNIDADES ');
                                SQL.Add('                             FROM TMP_TRASPASO_PEDIDO_LOTES ');
                                SQL.Add('                             WHERE ');
                                SQL.Add('                             ENTRADA = :ENTRADA AND ');
                                SQL.Add('                             ID_DETALLES = :ID_DETALLES_E AND ');
                                SQL.Add('                             TIPO = :TIPO AND ');
                                SQL.Add('                             LINEA = :LINEA), 0) + :UNIDADES) ');
                                SQL.Add(' MATCHING (ENTRADA, ID_DETALLES, TIPO, LINEA) ');
                                Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                Params.ByName['ID_DETALLES_E'].AsInteger := DMRecepcionPedidos.QMDetalle.FieldByName('ID_DETALLES_E').AsInteger;
                                Params.ByName['LINEA'].AsInteger := DMRecepcionPedidos.QMDetalle.FieldByName('LINEA').AsInteger;
                                Params.ByName['LOTE'].AsString := Lote;
                                Params.ByName['UNIDADES'].AsInteger := StrToInt(Cajas);
                                // Params.ByName['F_ENVASADO'].AsDateTime := ;
                                Params.ByName['F_CADUCIDAD'].AsDateTime := FechaCaducidad;
                                // Params.ByName['F_FABRICACION'].AsDateTime := ;
                                Params.ByName['ALMACEN'].AsString := DMRecepcionPedidos.QMDetalle.FieldByName('ALMACEN').AsString;
                                Params.ByName['ARTICULO'].AsString := DMRecepcionPedidos.QMDetalle.FieldByName('ARTICULO').AsString;
                                Params.ByName['SERIE'].AsString := DMRecepcionPedidos.QMDetalle.FieldByName('SERIE').AsString;
                                Params.ByName['CLASIFICACION'].AsString := 'GEN';
                                Params.ByName['ID_A'].AsInteger := DMRecepcionPedidos.QMDetalle.FieldByName('ID_A').AsInteger;
                                Params.ByName['TIPO'].AsString := 'PEP';
                                Params.ByName['ERROR'].AsInteger := 0;
                                Params.ByName['PROVEEDOR'].AsInteger := StrToIntDef(EFProveedor.Text, 0);
                                Params.ByName['ID_LOTE'].AsInteger := 0;
                                Params.ByName['ID_A_UBICACION'].AsInteger := 0;
                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;

                          Edit;
                          FieldByName('UNIDADES_RECEPCION').AsFloat := FieldByName('UNIDADES_RECEPCION').AsFloat + StrToInt(Cajas);
                          Post;
                       end;
                    finally
                       EnableControls;
                    end;
                 end;
              end;
           end;
        finally
           sl.Free;
           slCol.Free;
        end;
     end;
  end;
end;

procedure TFMRecepcionPedidos.CBPedidosClienteChange(Sender: TObject);
var
  i : integer;
begin
  inherited;

  DMRecepcionPedidos.CalculaPedidosCliente(CBPedidosCliente.Checked);

  i := EncuentraField(DBGFPedidos, 'PEDIDOS_D_CLI');
  if (i >= 0) then
     DBGFPedidos.Columns[i].Visible := CBPedidosCliente.Checked
  else
  begin
     with DBGFPedidos.Columns.Add do
     begin
        FieldName := 'PEDIDOS_D_CLI';
        Visible := CBPedidosCliente.Checked;
     end;
  end;
end;

procedure TFMRecepcionPedidos.CBCalculaStockChange(Sender: TObject);
var
  i : integer;
begin
  inherited;

  DMRecepcionPedidos.CalculaStock(CBCalculaStock.Checked, EFAlmacenStock.Text);

  i := EncuentraField(DBGFPedidos, 'STOCK_ALM');
  if (i >= 0) then
     DBGFPedidos.Columns[i].Visible := CBCalculaStock.Checked
  else
  begin
     with DBGFPedidos.Columns.Add do
     begin
        FieldName := 'STOCK_ALM';
        Visible := CBCalculaStock.Checked;
     end;
  end;
end;

end.
