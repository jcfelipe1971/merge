unit ZUFMPedidosEsp;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ComCtrls, ULFPageControl, ExtCtrls, ULFPanel,
  StdCtrls, ULFLabel, DBCtrls, ULFDBMemo, ULFDBEdit, Mask, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, ULFEdit, rxToolEdit,
  RXDBCtrl, ULFDBDateEdit, UHYDescription, ULFHYDBDescription, ToolWin,
  ULFToolBar, UNavigator, ULFEditFind2000, Menus, UTeclas, UControlEdit,
  rxCurrEdit, DB, ULFDBCtrlGrid, dbcgrids, DbComboBoxValue, Buttons, ActnList,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, Grids, DBGrids, NsDBGrid,
  ExtDlgs, RxLookup, GraphicEx, HYFIBQuery, UFPEditSimple, rxPlacemnt,
  ULFFormStorage, ULFActionList, UEditPanel;

type
  TZFMPedidosEsp = class(TFPEditSimple)
     PnlCab: TLFPanel;
     PnlTipo: TLFPanel;
     PCModelosArt: TLFPageControl;
     TSProva: TTabSheet;
     PNLProva: TLFPanel;
     LblEstado: TLFLabel;
     LblDiasServir: TLFLabel;
     LblFechaPrev: TLFLabel;
     LblFecha: TLFLabel;
     LblSuRef: TLFLabel;
     LblCliente: TLFLabel;
     EEstado: TLFEdit;
     DBESuRef: TLFDbedit;
     DBEFCliente: TLFDBEditFind2000;
     DBEDiasServir: TLFDbedit;
     DBDEFechaPrev: TLFDBDateEdit;
     DBDEFecha: TLFDBDateEdit;
     LblNotas: TLFLabel;
     DescCliente: TLFHYDBDescription;
     TSep1: TToolButton;
     LTipoArticulo: TLFLabel;
     LLacado: TLFLabel;
     LCantidad: TLFLabel;
     LModelo: TLFLabel;
     DBETipoArticulo: TLFDbedit;
     DBELacado: TLFDbedit;
     DBEModelo: TLFDbedit;
     DBECantidad: TLFDbedit;
     ButtElimina: TBitBtn;
     DBCGProva: TLFDBCtrlGrid;
     ScrBImagen: TScrollBox;
     Imagen: TImage;
     LblProva: TLFLabel;
     DBEFLinea: TLFDBEditFind2000;
     DBEFSalida: TLFDBEditFind2000;
     LSalida: TLFLabel;
     DBEFLona: TLFDBEditFind2000;
     LLona: TLFLabel;
     LCantidadDBG: TLFLabel;
     LIrAlPrimero: TLFLabel;
     PnlFax: TLFPanel;
     LBorrarLinea: TLFLabel;
     DBEComent: TLFDbedit;
     ALPedidosEsp: TActionList;
     AACliente: TAction;
     ANewCliente: TAction;
     DBEII: TLFDBEdit;
     DBMNotas: TLFDBMemo;
     PCFax: TLFPageControl;
     TSImagen: TTabSheet;
     TSTabla: TTabSheet;
     PnlFaxDet: TLFPanel;
     ScrBImagenFax: TScrollBox;
     ImagenFax: TImage;
     TBFax: TLFToolBar;
     NavImagenes: THYMNavigator;
     DBGridFind20001: TDBGridFind2000;
     CEImagenes: TControlEdit;
     CEImagenesPMEdit: TPopUpTeclas;
     DBCBManual: TLFDBCheckBox;
     DBCBMotor: TLFDBCheckBox;
     TBDBG: TLFToolBar;
     CEDetalle: TControlEdit;
     LNuevaLinea: TLFLabel;
     TButtCrearPedido: TToolButton;
     LLacadoGrid: TLFLabel;
     SBACliente: TSpeedButton;
     ButtAnyadir: TBitBtn;
     LSubtipo: TLFLabel;
     DBESubtipo: TLFDbedit;
     DBETipo: TLFDbedit;
     LTipo: TLFLabel;
     DBEFAltura: TLFDBEditFind2000;
     LAltura: TLFLabel;
     DBEFManivela: TLFDBEditFind2000;
     LManivela: TLFLabel;
     LEmisor: TLFLabel;
     DBEFEmisor: TLFDBEditFind2000;
     LMontaje: TLFLabel;
     DBEMMontaje: TLFDBEditFind2000;
     LColocacion: TLFLabel;
     DBEFColocacion: TLFDBEditFind2000;
     LTejadillo: TLFLabel;
     DBEFTejadillo: TLFDBEditFind2000;
     LPorteria: TLFLabel;
     DBEFPorteria: TLFDBEditFind2000;
     DBCBPartida: TLFDBCheckBox;
     DBCBEntrada: TLFDBCheckBox;
     LEntera: TLFLabel;
     DBEFEntera: TLFDBEditFind2000;
     DBEAncho: TLFDbedit;
     LAncho: TLFLabel;
     LLargo: TLFLabel;
     DBELargo: TLFDbedit;
     DBCBDesdeArriba: TLFDBCheckBox;
     DBCBRefuerzoAlt15cm: TLFDBCheckBox;
     DBCBDoblaAbajo5cm: TLFDBCheckBox;
     DBCBQuedar5cm: TLFDBCheckBox;
     LOllaosPeq: TLFLabel;
     DBEFOllaosPeq: TLFDBEditFind2000;
     LTipoConf: TLFLabel;
     DBEFTipoConf: TLFDBEditFind2000;
     LVarilla: TLFLabel;
     LCarril: TLFLabel;
     DBEFCarril: TLFDBEditFind2000;
     LCurrias: TLFLabel;
     DBEFCurrias: TLFDBEditFind2000;
     LTapajuntas: TLFLabel;
     DBEFTapajuntas: TLFDBEditFind2000;
     LOllaosGran: TLFLabel;
     DBEFOllaosGran: TLFDBEditFind2000;
     LRotulo: TLFLabel;
     DBCBDobladilloAlrededor: TLFDBCheckBox;
     LAlto: TLFLabel;
     LRibete: TLFLabel;
     LBanvalina: TLFLabel;
     LConfeccion: TLFLabel;
     DBCBArriba: TLFDBCheckBox;
     DBCBAbajo: TLFDBCheckBox;
     DBCBVelcro: TLFDBCheckBox;
     DBCBCorte: TLFDBCheckBox;
     DBCBMontado: TLFDBCheckBox;
     DBCBQuedar: TLFDBCheckBox;
     LGuardarCambios: TLFLabel;
     LEditarLinea: TLFLabel;
     NavDet: THYMNavigator;
     LLinea: TLFLabel;
     PNLAccionesDBG: TLFPanel;
     LBorrarLineaSup: TLFLabel;
     LIrAlPrimeroSup: TLFLabel;
     LGuardarCambiosSup: TLFLabel;
     LNuevaLineaSup: TLFLabel;
     LEditarLineaSup: TLFLabel;
     DBEFVarilla: TLFDBEditFind2000;
     DBECantidadDBG: TLFDbedit;
     DBELacadoDBG: TLFDbedit;
     DBEBanbalinas: TLFDbedit;
     DBERibete: TLFDbedit;
     DBEArticulo: TLFDbedit;
     LblPedido: TLFLabel;
     DBEPedido: TLFDbedit;
     SBAPedido: TSpeedButton;
     AAPedido: TAction;
     LLineaPed: TLFLabel;
     DBELineaPed: TLFDBEdit;
     PnlFaxCab: TLFPanel;
     LblRutaImg: TLFLabel;
     DBERutaImg: TLFDbedit;
     SBImagen: TSpeedButton;
     LblDescImg: TLFLabel;
     DBEDescImg: TLFDbedit;
     ImagenFax2: TImage;
     TSep3: TToolButton;
     TButtInformes: TToolButton;
     PMInformes: TPopupMenu;
     VerListadodePedidoEspecial1: TMenuItem;
     N1: TMenuItem;
     Configuracin1: TMenuItem;
     ListadodePedidoEspecial2: TMenuItem;
     ImprimirListadodePedidoEspecial1: TMenuItem;
     LModBamb: TLFLabel;
     DBEModBamb: TLFDbedit;
     LBLSerie: TLFLabel;
     EFSerie: TLFDBEditFind2000;
     ETitSerie: TLFEdit;
     VerLisadodePedidoEspecialNuevo1: TMenuItem;
     LFNotasB: TLFLabel;
     LAnadirNotas: TLFLabel;
     DBMNotasPed: TLFDBMemo;
     LDiasTransporte: TLFLabel;
     EDiasTransporte: TLFEdit;
     ETituloTransportista: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtCrearPedidoClick(Sender: TObject);
     procedure ButtEliminaClick(Sender: TObject);
     procedure TSPestanyaShow(Sender: TObject);
     procedure FormResize(Sender: TObject);
     procedure ImageDblClick(Sender: TObject);
     procedure LblNuevoClick(Sender: TObject);
     procedure LblInicioClick(Sender: TObject);
     procedure LblBorraClick(Sender: TObject);
     procedure DBEFSalidaBusqueda(Sender: TObject);
     procedure SBAClienteDblClick(Sender: TObject);
     procedure AAClienteExecute(Sender: TObject);
     procedure ANewClienteExecute(Sender: TObject);
     procedure DBEFClienteChange(Sender: TObject);
     procedure DBCGPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: integer);
     procedure SBImagenClick(Sender: TObject);
     procedure DBChkBChange(Sender: TObject);
     procedure LblEditaClick(Sender: TObject);
     procedure LblGuardaClick(Sender: TObject);
     procedure ButtAnyadirClick(Sender: TObject);
     procedure AAPedidoExecute(Sender: TObject);
     procedure ImagenFax2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
     procedure MotorEmisorBusqueda(Sender: TObject);
     procedure VerListadodePedidoEspecial1Click(Sender: TObject);
     procedure ImprimirListadodePedidoEspecial1Click(Sender: TObject);
     procedure ListadodePedidoEspecial2Click(Sender: TObject);
     procedure PCModelosArtResize(Sender: TObject);
     procedure VerLisadodePedidoEspecial2(Sender: TObject);
     procedure LFNotasBClick(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
  private
     { Private declarations }
     FThumbWidth, FThumbHeight: integer;
     procedure RescaleImage(Source, Target: TBitmap; FastStretch: boolean);
     procedure CreaLFLabel(Name, Caption: string; Left, Top: integer; Parent: TWinControl; Padre: TComponent);
     procedure CreaLFDbedit(Name: string; Width, Left, Top: integer; DataSource: TDataSource; Campo: string; ReadOnly: boolean; Parent: TWinControl; Padre: TComponent);
     procedure CreaLFDBEditFind(Name: string; Width, Left, Top: integer; DataSource: TDataSource; Filtros: TROpcionBusqueda; Campo, CampoNum, CampoStr, Tabla, OrdenadoPor, Cond: string; EventoCond: TNotifyEvent; SalirNoExiste, SalirVacio: boolean; Parent: TWinControl; Padre: TComponent);
     procedure CreaLFDBCheckBox(Name, Caption: string; Width, Left, Top: integer; DataSource: TDataSource; Campo, ValCheck, ValUncheck: string; EventoChange: TNotifyEvent; Parent: TWinControl; Padre: TComponent);
     // procedure CreaImagenDet(Name, Campo: string; Height, Width, Left, Top: integer; Parent: TWinControl; Padre: TComponent);
  public
     { Public declarations }
     xx, yy: integer;
     Semaforo: boolean;
     TipoG, ModeloG, ConfigTipoG, ConfigSubtipoG: string;
     procedure EstadoPed(Estado: smallint);
     procedure AbreRig(Rig: integer);
     procedure AnyadirPestanya(Lacado: string; Cantidad: double; Modelo: string);
     procedure CreaPestanya(Tipo, Modelo, ConfigTipo, ConfigSubtipo: string);
     procedure BuscaPestanya(Tipo, Modelo: string);
     procedure HabilitaEnlaces;
     //Ver Imagenes
     procedure AbrirArchivo(const Filename: string; ImgComp: TImage);
  end;

var
  ZFMPedidosEsp : TZFMPedidosEsp;

implementation

uses ZUDMPedidosEsp, UDMMain, ZUFMImgRibetes, ZUFMImgBambalinas, UFMain,
  UEntorno, UUtiles, ZUFMPedidosEspSelecTipo, ZUDMLstPedidos, UFMListConfig,
  UDMPedidos, UFMNotasCampo, UDameDato;

type
  PFileEntry = ^TFileEntry;

  TFileEntry = record
     Name: string;
     Bitmap: TBitmap;
  end;

{$R *.dfm}

procedure TZFMPedidosEsp.FormCreate(Sender: TObject);
begin
  Semaforo := True;

  AbreData(TZDMPedidosEsp, ZDMPedidosEsp);
  AbreData(TDMPedidos, DMPedidos);

  PCModelosArt.Pages[0].Free;

  FormResize(Sender);

  HabilitaEnlaces;
  ControlEdit := CEMain;

  // Asigno Imagenes a SpeedButton
  GetBitmapFromImageList(SBImagen, 1, DMMain.ILMain_Ac, 49);
  GetBitmapFromImageList(ButtAnyadir, 1, DMMain.ILMain_Ac, 65);
  GetBitmapFromImageList(ButtAnyadir, 2, DMMain.ILMain_In, 65);
  //GetBitmapFromImageList(ButtElimina, 1, DMMain.ILMain_Ac, 20);
end;

procedure TZFMPedidosEsp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ZDMPedidosEsp.GuardaDetalles;

  CierraData(ZDMPedidosEsp);
  CierraData(DMPedidos);
  Action := caFree;
end;

procedure TZFMPedidosEsp.TButtCrearPedidoClick(Sender: TObject);
begin
  ZDMPedidosEsp.CrearPedidoOrden;
  ZDMPedidosEsp.CrearPackingList;
  ShowMessage(_('Proceso finalizado.'));
end;

procedure TZFMPedidosEsp.AbreRig(Rig: integer);
begin
  ZDMPedidosEsp.Rig := Rig;
  ZDMPedidosEsp.AbreRig;
end;

procedure TZFMPedidosEsp.EstadoPed(Estado: smallint);
begin
  if (Estado = 0) then
  begin
     EEstado.Text := _('Pendiente');
     TButtCrearPedido.Enabled := True;
     ButtAnyadir.Enabled := True;
  end
  else
  if (Estado = 1) then
  begin
     EEstado.Text := _('Procesado');
     TButtCrearPedido.Enabled := False;
     ButtAnyadir.Enabled := False;
  end;
end;

procedure TZFMPedidosEsp.AnyadirPestanya(Lacado: string; Cantidad: double; Modelo: string);
begin
  ZDMPedidosEsp.AnyadirPestanya(Lacado, Cantidad, Modelo);
end;

procedure TZFMPedidosEsp.ButtEliminaClick(Sender: TObject);
var
  Index : integer;
begin
  if (ConfirmaMensajeCaption(_('¿Borra el registro?'), _('Información'))) then
  begin
     Index := PCModelosArt.ActivePageIndex;

     // ZDMPedidosEsp.QMPedidosTipo.Locate('TIPO_ARTICULO_TYC;MODELO', vararrayof([TipoG,ModeloG]), []);
     ZDMPedidosEsp.QMPedidosTipo.Delete;

     // PCModelosArt.Pages[PCModelosArt.ActivePageIndex].OnShow := nil;
     // PCModelosArt.Pages[PCModelosArt.ActivePageIndex].Destroy;
     PCModelosArt.Pages[Index].TabVisible := False;
  end;
end;

procedure TZFMPedidosEsp.CreaPestanya(Tipo, Modelo, ConfigTipo, ConfigSubtipo: string);
var
  Existe : boolean;
  Nombre : string;
  i : smallint;
  Tab : TTabSheet;
  Pnl, PnlNav : TLFPanel;
  But : TButton;
  Grd : TLFDBCtrlGrid;
  Scr : TScrollBox;
  Img : TImage;
  Lbl : TLFLabel;
  // ChkB : TLFDBCheckBox;
  // CBV : TDBComboBoxValue;
  // TB : TLFToolBar;
  // Nav : THYMNavigator;
  // CE : TControlEdit;
  Bvl : TBevel;
  Desc : TLFDBMemo;
begin
  ZDMPedidosEsp.muestra_bambalina := False; //sfg.albert

  TipoG := Tipo;
  Modelo := Trim(Modelo);
  ModeloG := Modelo;
  ConfigTipoG := ConfigTipo;
  ConfigSubtipoG := ConfigSubtipo;

  Nombre := Tipo + Modelo;

  Existe := False;
  for i := 0 to PCModelosArt.PageCount - 1 do
     if (PCModelosArt.Pages[i].Name = 'TS' + Nombre) then
     begin
        Existe := True;
        if not (PCModelosArt.Pages[i].TabVisible) then
           PCModelosArt.Pages[i].TabVisible := True;
        PCModelosArt.ActivePageIndex := i;
        Break;
     end;

  if (not Existe) then
  begin
     //Creamos la nueva pestaña
     Tab := TTabSheet.Create(PCModelosArt);
     Tab.PageControl := PCModelosArt;
     Tab.Name := 'TS' + Nombre;
     if (Tipo = 'A') then
        Tab.Caption := 'Armazones ' + Modelo
     else if (Tipo = 'T') then
        Tab.Caption := 'Toldos ' + Modelo
     else if (Tipo = 'L') then
        Tab.Caption := 'Lonas'
     else if (Tipo = 'C') then
        Tab.Caption := 'Componentes/Varios'
     else if (Tipo = 'V') then
        Tab.Caption := 'Varios';

     Tab.OnShow := TSPestanyaShow;

     //Creamos el panel superior de la pestaña con los campos necesarios
     Pnl := TLFPanel.Create(Tab);
     Pnl.Parent := Tab;
     Pnl.Name := 'PnlCab' + Nombre;
     Pnl.Caption := '';
     Pnl.Align := alTop;
     Pnl.Height := 86;
     Pnl.BevelOuter := bvNone;
     //    Pnl.ParentCtl3D := False;

     CreaLFLabel('LblTipoArt' + Nombre, 'Tipo Artículo', 4, 5, Pnl, Pnl);
     CreaLFDbedit('DBETipoArt' + Nombre, 41, 70, 1,
        ZDMPedidosEsp.DSPedidosTipo, 'TIPO_ARTICULO_TYC', True, Pnl, Pnl);

     CreaLFLabel('LblConfigTipo' + Nombre, 'Tipo', 44, 25, Pnl, Pnl);
     CreaLFDbedit('DBEConfigTipo' + Nombre, 41, 70, 22,
        ZDMPedidosEsp.DSPedidosTipo, 'CONFIG_TIPO', True, Pnl, Pnl);

     CreaLFLabel('LblConfigSubtipo' + Nombre, 'Subtipo', 139, 25, Pnl, Pnl);
     CreaLFDbedit('DBEConfigSubtipo' + Nombre, 41, 183, 22,
        ZDMPedidosEsp.DSPedidosTipo, 'CONFIG_SUBTIPO', True, Pnl, Pnl);

     CreaLFLabel('LblLacadoTipo' + Nombre, 'Lacado', 29, 46, Pnl, Pnl);
     CreaLFDbedit('DBELacadoTipo' + Nombre, 41, 70, 43,
        ZDMPedidosEsp.DSPedidosTipo, 'LACADO', True, Pnl, Pnl);

     CreaLFLabel('LblCantidadTipo' + Nombre, 'Cantidad', 133, 46, Pnl, Pnl);
     CreaLFDbedit('DBECantidadTipo' + Nombre, 41, 183, 43,
        ZDMPedidosEsp.DSPedidosTipo, 'CANTIDAD', True, Pnl, Pnl);

     if (Tipo = 'T') or (Tipo = 'A') or (Tipo = 'L') then
     begin
        CreaLFLabel('LblModelo' + Nombre, 'Modelo', 140, 6, Pnl, Pnl);
        CreaLFDbedit('DBEModelo' + Nombre, 41, 183, 1,
           ZDMPedidosEsp.DSPedidosTipo, 'MODELO', True, Pnl, Pnl);

        //Imagen del Modelo
        Scr := TScrollBox.Create(Tab);
        Scr.Name := 'ScrBImagen' + Nombre;
        Scr.Height := 59;
        Scr.Width := 66;
        Scr.Left := 238;
        Scr.Top := 3;
        Scr.Parent := Pnl;
        Img := TImage.Create(Tab);
        Img.Name := 'Image' + Nombre;
        Img.Align := alClient;
        Img.AutoSize := False;
        Img.IncrementalDisplay := False;
        Img.Stretch := True;
        Img.Parent := Scr;

        //Notas modelo
        Desc := TLFDBMemo.Create(Tab);
        Desc.Name := 'Notas' + Nombre;
        Desc.Parent := Pnl;
        Desc.Height := 62;
        Desc.Top := 3;
        Desc.Left := 324;
        Desc.Width := 210;
        Desc.DataSource := ZDMPedidosEsp.DSPedidosTipo;
        Desc.DataField := 'NOTAS';
     end;

     //Button para eliminar pestaña
     But := TBitBtn.Create(Pnl);
     But.Name := 'ButtElimina' + Nombre;
     But.Caption := 'Eliminar Pestaña';
     But.Height := 25;
     But.Width := 103;
     But.Left := 542;
     But.Top := 2;
     But.Font.Style := [fsBold];
     But.OnClick := ButtEliminaClick;
     But.Parent := Pnl;
     // Comentar con Duilio GetBitmapFromImageList(But, 1, DMMain.ILMain_Ac, 20);

     ///////////////////////////////////////////////////////////
     //Creamos la LFToolBar para el navegador
     {    TB := TLFToolBar.Create(Tab);
    TB.Parent := Tab;
    TB.Name   := 'TB' + Nombre;
    TB.Height := 24;
    TB.Flat   := True;

    //Navegador y ControlEdit
    CE := TControlEdit.Create(Self);
    CE.Name := 'CE' + Nombre;
    CE.DataSource := ZDMPedidosEsp.DSPedidosDet;
    CE.FichaEdicion   := Tab;
    CE.FichaExclusiva := Tab;
    Nav := THYMNavigator.Create(Tab);
    Nav.Parent := TB;
    Nav.Name   := 'Nav' + Nombre;
    Nav.Flat   := True;
    Nav.DataSource := ZDMPedidosEsp.DSPedidosDet;
    Nav.Width  := 220;
    Nav.ControlEdit := CE;
}

     //Creamos el panel superior de la pestaña con los labels de navegacion
     PnlNav := TLFPanel.Create(Pnl);
     PnlNav.Parent := Pnl;
     PnlNav.Name := 'PnlNav' + Nombre;
     PnlNav.Caption := '';
     PnlNav.Align := alBottom;
     PnlNav.Height := 19;
     PnlNav.BevelInner := bvNone;
     PnlNav.BevelOuter := bvNone;
     PnlNav.BorderStyle := bsNone;
     //    Pnl.ParentCtl3D := False;

     //LABEL PARA CREAR UNA NUEVA LINEA
     Lbl := TLFLabel.Create(Self);
     Lbl.Parent := PnlNav;
     Lbl.Name := 'LblNuevo' + Nombre;
     Lbl.Caption := 'Nueva Línea';
     Lbl.Left := 19;
     Lbl.Top := 2;
     Lbl.Font.Color := clBlue;
     Lbl.Font.Style := [fsUnderline];
     Lbl.OnClick := LblNuevoClick;

     //LABEL PARA EDITAR UNA LINEA
     Lbl := TLFLabel.Create(Self);
     Lbl.Parent := PnlNav;
     Lbl.Name := 'LblEditar' + Nombre;
     Lbl.Caption := 'Editar Línea';
     Lbl.Left := 103;
     Lbl.Top := 2;
     Lbl.Font.Color := clBlue;
     Lbl.Font.Style := [fsUnderline];
     // Lbl.FocusControl := DBEDiasServir;
     Lbl.OnClick := LblEditaClick;

     //LABEL PARA GUARDAR UNA LINEA
     Lbl := TLFLabel.Create(Self);
     Lbl.Parent := PnlNav;
     Lbl.Name := 'LblGuardar' + Nombre;
     Lbl.Caption := 'Guardar Cambios';
     Lbl.Left := 91;
     Lbl.Top := 2;
     Lbl.Font.Color := clBlue;
     Lbl.Font.Style := [fsUnderline];
     Lbl.OnClick := LblGuardaClick;

     //LABEL PARA VOLVER AL INICIO
     Lbl := TLFLabel.Create(Self);
     Lbl.Parent := PnlNav;
     Lbl.Name := 'LblInicio' + Nombre;
     Lbl.Caption := 'Ir al primero';
     Lbl.Left := 181;
     Lbl.Top := 2;
     Lbl.Font.Color := clBlue;
     Lbl.Font.Style := [fsUnderline];
     Lbl.OnClick := LblInicioClick;

     //LABEL PARA AÑADIR NOTAS
     Lbl := TLFLabel.Create(Self);
     Lbl.Parent := PnlNav;
     Lbl.Name := 'LblNotas' + Nombre;
     Lbl.Caption := 'Añadir notas';
     Lbl.Left := 312;
     Lbl.Top := 2;
     Lbl.Font.Color := clBlue;
     Lbl.Font.Style := [fsUnderline];
     Lbl.OnClick := LFNotasBClick;

     //LABEL PARA BORRAR LA LINEA
     Lbl := TLFLabel.Create(Self);
     Lbl.Parent := PnlNav;
     Lbl.Name := 'LblBorrar' + Nombre;
     Lbl.Caption := 'Borrar línea';
     Lbl.Left := 558;
     Lbl.Top := 2;
     Lbl.Font.Color := clBlue;
     Lbl.Font.Style := [fsUnderline];
     Lbl.OnClick := LblBorraClick;

     ///////////////////////////////////////////////////////////
     //Creamos el LFDBCtrlGrid
     Grd := TLFDBCtrlGrid.Create(Tab);
     Grd.Parent := Tab;
     Grd.Name := 'DBCG' + Nombre;
     Grd.Align := alClient;
     Grd.DataSource := ZDMPedidosEsp.DSPedidosDet;
     Grd.RowCount := 2;
     Grd.ColCount := 1;
     Grd.SelectedColor := clSilver;
     Grd.Panel.Enabled := False;
     Grd.OnPaintPanel := DBCGPaintPanel;

     if (Tipo = 'C') then
     begin
        //LINEA DETALLE DEL PEDIDO
        CreaLFLabel('LblLineaPed' + Nombre, 'Linea Ped.', 571, 9, Grd.Panel, Self);
        CreaLFDbedit('DBELineaPed' + Nombre, 20, 627, 7,
           ZDMPedidosEsp.DSPedidosDet, 'LineaPed', True, Grd.Panel, Self);

        //LINEA DETALLE
        CreaLFLabel('LblLineaDet' + Nombre, 'Linea', 595, 28, Grd.Panel, Self);
        CreaLFDbedit('DBELinea' + Nombre, 20, 627, 26,
           ZDMPedidosEsp.DSPedidosDet, 'LINEA', True, Grd.Panel, Self);

        //ARTICULO COMPONENTE
        CreaLFLabel('LblComponente' + Nombre, 'Componente', 5, 9, Grd.Panel, Self);
        CreaLFDBEditFind('DBEFComponente' + Nombre, 100, 68, 7,
           ZDMPedidosEsp.DSPedidosDet, [obEmpresa, obEjercicio, obCanal],
           'COMPONENTE', 'ARTICULO', 'TITULO', 'VER_ARTICULOS_EF',
           '', 'tipo_articulo_tyc=''C'' or tipo_articulo_tyc=''V''',
           nil, False, False, Grd.Panel, Self);

        //CANTIDAD DE TOLDOS
        CreaLFLabel('LblCantidad' + Nombre, 'Cantidad', 23, 28, Grd.Panel, Self);
        CreaLFDbedit('DBECantidad' + Nombre, 41, 68, 26,
           ZDMPedidosEsp.DSPedidosDet, 'CANTIDAD', False, Grd.Panel, Self);

        {      //LACADO
      CreaLFLabel ('LblLacado'+Nombre,'Lacado',20,85,Grd.Panel,Self);
      CreaLFDBEditFind ('DBEFLacado'+Nombre,41,59,83,
                        ZDMPedidosEsp.DSPedidosDet, [],
                        'LACADO','CODIGO','DESCRIPCION','Z_SYS_COLORES',
                        '', '', nil,
                        False, False, Grd.Panel,Self);}
     end
     else
     begin
        //    if (Tipo = 'T') then
        //    begin
        //LINEA DETALLE DEL PEDIDO
        CreaLFLabel('LblLineaPed' + Nombre, 'Linea Ped.', 571, 128, Grd.Panel, Self);
        CreaLFDbedit('DBELineaPed' + Nombre, 20, 627, 124,
           ZDMPedidosEsp.DSPedidosDet, 'LineaPed', True, Grd.Panel, Self);

        //LINEA DETALLE
        CreaLFLabel('LblLineaDet' + Nombre, 'Linea', 595, 148, Grd.Panel, Self);
        CreaLFDbedit('DBELinea' + Nombre, 20, 627, 146,
           ZDMPedidosEsp.DSPedidosDet, 'LINEA', True, Grd.Panel, Self);

        //CODIGO DE ARTICULO
        //      CreaLFLabel ('LblLineaDet'+Nombre,'Artículo',595,148,Grd.Panel,Self);
        CreaLFDbedit('DBEArticulo' + Nombre, 81, 508, 146,
           ZDMPedidosEsp.DSPedidosDet, 'Articulo', True, Grd.Panel, Self);

        {      //LABEL PARA CREAR UNA NUEVA LINEA
      Lbl := TLFLabel.Create(Self);
      Lbl.Parent  := Grd.Panel;
      Lbl.Name    := 'LblNuevo'+Nombre;
      Lbl.Caption := 'Nueva Línea';
      Lbl.Left    := 19;
      Lbl.Top     := 168;
      Lbl.Font.Color := clBlue;
      Lbl.Font.Style := [fsUnderline];
      Lbl.OnClick := LblNuevoClick;

      //LABEL PARA EDITAR UNA LINEA
      Lbl := TLFLabel.Create(Self);
      Lbl.Parent  := Grd.Panel;
      Lbl.Name    := 'LblEditar'+Nombre;
      Lbl.Caption := 'Editar Línea';
      Lbl.Left    := 103;
      Lbl.Top     := 168;
      Lbl.Font.Color := clBlue;
      Lbl.Font.Style := [fsUnderline];
      Lbl.FocusControl := DBEDiasServir;
      Lbl.OnClick := LblEditaClick;

      //LABEL PARA GUARDAR UNA LINEA
      Lbl := TLFLabel.Create(Self);
      Lbl.Parent  := Grd.Panel;
      Lbl.Name    := 'LblGuardar'+Nombre;
      Lbl.Caption := 'Guardar Cambios';
      Lbl.Left    := 91;
      Lbl.Top     := 168;
      Lbl.Font.Color := clBlue;
      Lbl.Font.Style := [fsUnderline];
      Lbl.OnClick := LblGuardaClick;

      //LABEL PARA VOLVER AL INICIO
      Lbl := TLFLabel.Create(Self);
      Lbl.Parent  := Grd.Panel;
      Lbl.Name    := 'LblInicio'+Nombre;
      Lbl.Caption := 'Ir al primero';
      Lbl.Left    := 181;
      Lbl.Top     := 168;
      Lbl.Font.Color := clBlue;
      Lbl.Font.Style := [fsUnderline];
      Lbl.OnClick := LblInicioClick;

      //LABEL PARA BORRAR LA LINEA
      Lbl := TLFLabel.Create(Self);
      Lbl.Parent  := Grd.Panel;
      Lbl.Name    := 'LblBorrar'+Nombre;
      Lbl.Caption := 'Borrar línea';
      Lbl.Left    := 558;
      Lbl.Top     := 168;
      Lbl.Font.Color := clBlue;
      Lbl.Font.Style := [fsUnderline];
      Lbl.OnClick := LblBorraClick;       }

        //LABEL y BEVEL PARA LOS DATOS DEL ALTO
        Lbl := TLFLabel.Create(Self);
        Lbl.Parent := Grd.Panel;
        Lbl.Name := 'LblAlto' + Nombre;
        Lbl.Caption := 'Alto';
        Lbl.Left := 130;
        Lbl.Top := 50;
        Lbl.Font.Style := [fsUnderline];
        Bvl := TBevel.Create(Self);
        Bvl.Parent := Grd.Panel;
        Bvl.Name := 'BvlAlto' + Nombre;
        Bvl.Height := 97;
        Bvl.Width := 128;
        Bvl.Left := 109;
        Bvl.Top := 47;

        //BEVEL PARA MANUAL o MOTOR
        Bvl := TBevel.Create(Self);
        Bvl.Parent := Grd.Panel;
        Bvl.Name := 'BvlManualMotor' + Nombre;
        Bvl.Height := 60;
        Bvl.Width := 123;
        Bvl.Left := 235;
        Bvl.Top := 4;

        //BEVEL PARA PARTIDA o ENTERA
        Bvl := TBevel.Create(Self);
        Bvl.Parent := Grd.Panel;
        Bvl.Name := 'BvlPartidaEntera' + Nombre;
        Bvl.Height := 60;
        Bvl.Width := 105;
        Bvl.Left := 356;
        Bvl.Top := 4;

        //BEVEL PARA VARIOS
        Bvl := TBevel.Create(Self);
        Bvl.Parent := Grd.Panel;
        Bvl.Name := 'BvlVarios' + Nombre;
        Bvl.Height := 82;
        Bvl.Width := 226;
        Bvl.Left := 235;
        Bvl.Top := 62;

        //LABEL y BEVEL PARA LOS DATOS DE CONFECCION
        Lbl := TLFLabel.Create(Self);
        Lbl.Parent := Grd.Panel;
        Lbl.Name := 'LblConfeccion' + Nombre;
        Lbl.Caption := 'Confección';
        Lbl.Left := 470;
        Lbl.Top := 6;
        Lbl.Font.Style := [fsUnderline];
        Bvl := TBevel.Create(Self);
        Bvl.Parent := Grd.Panel;
        Bvl.Name := 'BvlConfeccion' + Nombre;
        Bvl.Height := 140;
        Bvl.Width := 108;
        Bvl.Left := 459;
        Bvl.Top := 4;

        ZDMPedidosEsp.xDatosConfig.Close;
        ZDMPedidosEsp.xDatosConfig.Open;
        ZDMPedidosEsp.xDatosConfig.First;
        while not ZDMPedidosEsp.xDatosConfig.EOF do
        begin
           if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'LINEAL' then
           begin // MEDIDA LINEAL
              CreaLFLabel('LblLineal' + Nombre, 'Lineal', 28, 9, Grd.Panel, Self);
              CreaLFDbedit('DBELineal' + Nombre, 41, 59, 7,
                 ZDMPedidosEsp.DSPedidosDet, 'LINEAL', False, Grd.Panel, Self);
           end
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'SALIDA' then
           begin // MEDIDA SALIDA: Haremos visible el label de ''Salida'' o ''Med. Corte'' segun el check CORTE
              CreaLFLabel('LblSalida' + Nombre, 'Salida', 27, 28, Grd.Panel, Self);
              CreaLFLabel('LblMedidaCorte' + Nombre, 'Med. Corte', 4, 28, Grd.Panel, Self);
              CreaLFDbedit('DBESalida' + Nombre, 41, 59, 26,
                 ZDMPedidosEsp.DSPedidosDet, 'SALIDA', False, Grd.Panel, Self);
           end
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'ALTURA' then
           begin//ALTURA
              CreaLFLabel('LblAltura' + Nombre, 'Altura', 29, 47, Grd.Panel, Self);
              CreaLFDbedit('DBEAltura' + Nombre, 41, 59, 45,
                 ZDMPedidosEsp.DSPedidosDet, 'ALTURA', False, Grd.Panel, Self);
           end
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'CANTIDAD' then
           begin//CANTIDAD DE TOLDOS
              //          CreaLFLabel ('LblCantidad'+Nombre,'Cantidad',14,66,Grd.Panel,Self);
              CreaLFLabel('LblCantidad' + Nombre, 'Cantidad', 112, 9, Grd.Panel, Self);
              //          CreaLFDbedit ('DBECantidad'+Nombre,41,59,64,
              CreaLFDbedit('DBECantidad' + Nombre, 41, 156, 7,
                 ZDMPedidosEsp.DSPedidosDet, 'CANTIDAD', False, Grd.Panel, Self);
           end
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'LACADO' then
           begin//LACADO
              //          CreaLFLabel ('LblLacado'+Nombre,'Lacado',20,85,Grd.Panel,Self);
              CreaLFLabel('LblLacado' + Nombre, 'Lacado', 20, 68, Grd.Panel, Self);
              //          CreaLFDBEditFind ('DBEFLacado'+Nombre,41,59,83,
              CreaLFDBEditFind('DBEFLacado' + Nombre, 41, 59, 64,//156,26,
                 ZDMPedidosEsp.DSPedidosDet, [],
                 'LACADO', 'CODIGO', 'DESCRIPCION', 'Z_SYS_COLORES',
                 'CODIGO', 'ACTIVO=1', nil, False, False, Grd.Panel, Self);
           end
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'MOD_BAMBALINA' then
           begin//MODIFICACION DE BAMBALINA
              CreaLFLabel('LblModBambalina' + Nombre, 'Mod.Bamb.', 4, 85, Grd.Panel, Self);
              CreaLFDbedit('DBEModBambalina' + Nombre, 41, 59, 83,
                 ZDMPedidosEsp.DSPedidosDet, 'MOD_BAMBALINA', False, Grd.Panel, Self);
              //sfg.albert - marco com a visible la bambalina
              ZDMPedidosEsp.muestra_bambalina := True;
           end
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'BAMBALINA' then
           begin//BAMBALINA
              CreaLFLabel('LblBambalina' + Nombre, 'Bambalina', 7, 104, Grd.Panel, Self);
              CreaLFDBEditFind('DBEFBambalina' + Nombre, 41, 59, 102,
                 ZDMPedidosEsp.DSPedidosDet, [],
                 'BAMBALINA', 'CODIGO', 'DESCRIPCION', 'Z_SYS_BAMBALINAS',
                 '', '', nil, False, False, Grd.Panel, Self);
           end
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'RIBETE' then
           begin//RIBETE
              CreaLFLabel('LblRibete' + Nombre, 'Ribete', 25, 123, Grd.Panel, Self);
              CreaLFDBEditFind('DBEFRibete' + Nombre, 41, 59, 121,
                 ZDMPedidosEsp.DSPedidosDet, [],
                 'RIBETE', 'CODIGO', 'DESCRIPCION', 'Z_SYS_RIBETES',
                 'DESCRIPCION', '', nil, False, False, Grd.Panel, Self);
           end
           {        else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'BAMBALINA' then
        begin//IMAGEN BAMBALINA
          CreaLFLabel ('LblImgBambalina'+Nombre,'Bambalina',295,10,Grd.Panel,Self);
          CreaImagenDet ('Bambalina'+Nombre,'IMG_BAMBALINA',70,76,294,25,Grd.Panel,Self);
        end
        else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'RIBETE' then
        begin//IMAGEN RIBETE
          CreaLFLabel ('LblImgRibete'+Nombre,'Ribete',208,10,Grd.Panel,Self);
          CreaImagenDet ('Ribete'+Nombre,'IMG_RIBETE',70,76,207,25,Grd.Panel,Self);
        end}
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'LONA' then
           begin//ARTICULO LONA
              CreaLFLabel('LblLona' + Nombre, 'Lona', 31, 148, Grd.Panel, Self);
              CreaLFDBEditFind('DBEFLona' + Nombre, 100, 59, 146,
                 ZDMPedidosEsp.DSPedidosDet, [obEmpresa, obEjercicio, obCanal],
                 'LONA', 'ARTICULO', 'TITULO', 'VER_ARTICULOS_EF',
                 '', 'tipo_articulo_tyc=''L''', nil, False, False, Grd.Panel, Self);
           end
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'TAPAJUNTAS' then
           begin//ARTICULO TAPAJUNTAS
              CreaLFLabel('LblTapajuntas' + Nombre, 'Tapajuntas', 370, 148, Grd.Panel, Self);
              CreaLFDBEditFind('DBEFTapajuntas' + Nombre, 65, 426, 146,
                 ZDMPedidosEsp.DSPedidosDet, [obEmpresa, obEjercicio, obCanal],
                 'TAPAJUNTAS', 'ARTICULO', 'TITULO', 'VER_ARTICULOS_EF',
                 '', 'tipo_articulo_tyc=''V'' and familia<>''SYS''', nil,
                 False, False, Grd.Panel, Self);
           end
           {        else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'LONA_FORMA' then
        begin//FORMA LONA
          CreaLFLabel ('LblFormaLona'+Nombre,'Forma',117,33,Grd.Panel,Self);
          CreaLFDBEditFind ('DBEFFormaLona'+Nombre,41,150,29,
                            ZDMPedidosEsp.DSPedidosDet, [],
                            'LONA_FORMA','CODIGO','DESCRIPCION','Z_SYS_LONAS_FORMA',
                            '','', nil, False, False, Grd.Panel,Self);
        end     }
           {        else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'ANCHO' then
        begin//ANCHO
          CreaLFLabel ('LblAncho'+Nombre,'Ancho',114,9,Grd.Panel,Self);
          CreaLFDbedit ('DBEAncho'+Nombre,41,148,7,
                        ZDMPedidosEsp.DSPedidosDet, 'ANCHO',False,Grd.Panel,Self);
        end
        else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'LARGO' then
        begin//LARGO
          CreaLFLabel ('LblLargo'+Nombre,'Largo',118,28,Grd.Panel,Self);
          CreaLFDbedit ('DBELargo'+Nombre,41,148,26,
                        ZDMPedidosEsp.DSPedidosDet, 'LARGO',False,Grd.Panel,Self);
        end  }
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'ALTO' then
           begin//CHECKS ALTO
              CreaLFDBCheckBox('ChkBAltoQuedar' + Nombre, 'Quedar + 5cm', 88, 113, 63,
                 ZDMPedidosEsp.DSPedidosDet, 'ALTO_QUEDAR', '1', '0',
                 nil, Grd.Panel, Self);

              CreaLFDBCheckBox('ChkBAltoDobla' + Nombre, 'Dobla. Abajo + 5cm', 116, 113, 79,
                 ZDMPedidosEsp.DSPedidosDet, 'ALTO_DOBLA_ABAJO', '1', '0',
                 nil, Grd.Panel, Self);

              CreaLFDBCheckBox('ChkBAltoRefuerzo' + Nombre, 'Refuerzo Alt. + 15cm', 116, 113, 95,
                 ZDMPedidosEsp.DSPedidosDet, 'ALTO_REFUERZO_ALT', '1', '0',
                 nil, Grd.Panel, Self);

              CreaLFDBCheckBox('ChkBAltoDesdeArriba' + Nombre, 'Desde arriba', 116, 113, 111,
                 ZDMPedidosEsp.DSPedidosDet, 'ALTO_DESDE_ARRIBA', '1', '0',
                 nil, Grd.Panel, Self);
           end
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'MANUAL_O_MOTOR' then
           begin//TOLDO MANUAL o MOTOR
              CreaLFDBCheckBox('ChkBManual' + Nombre, 'Manual', 57, 239, 6,
                 ZDMPedidosEsp.DSPedidosDet, 'MANUAL_O_MOTOR', '0', '1',
                 DBChkBChange, Grd.Panel, Self);

              CreaLFDBCheckBox('ChkBMotor' + Nombre, 'Motor', 51, 303, 6,
                 ZDMPedidosEsp.DSPedidosDet, 'MANUAL_O_MOTOR', '1', '0',
                 DBChkBChange, Grd.Panel, Self);
              //MANIVELA
              CreaLFLabel('LblManivela' + Nombre, 'Manivela', 240, 25, Grd.Panel, Self);
              CreaLFDBEditFind('DBEFManivela' + Nombre, 65, 286, 23,
                 ZDMPedidosEsp.DSPedidosDet, [obEmpresa, obEjercicio, obCanal],
                 'MANUAL_MANIVELA', 'ARTICULO', 'TITULO', 'VER_ARTICULOS_EF',
                 '', 'tipo_articulo_tyc=''C'' and SUBTIPO_ARTICULO_tyc=''M''', nil,
                 False, False, Grd.Panel, Self);
              //LT
              CreaLFLabel('LblLT' + Nombre, 'LT', 271, 25, Grd.Panel, Self);
              CreaLFDBEditFind('DBEFLT' + Nombre, 41, 286, 23,
                 ZDMPedidosEsp.DSPedidosDet, [],
                 'MOTOR_LT', 'CODIGO', 'DESCRIPCION', 'Z_SYS_AUXILIARES',
                 '', 'tipo_aux=''LTM''', nil, False, True, Grd.Panel, Self);
              //EMISOR
              CreaLFLabel('LblEmisor' + Nombre, 'Emisor', 252, 44, Grd.Panel, Self);
              CreaLFDBEditFind('DBEFEmisor' + Nombre, 65, 286, 42,
                 ZDMPedidosEsp.DSPedidosDet, [],
                 'MOTOR_EMISOR', 'MOTOR', 'TITULO', 'z_ver_sys_modelos_det_motor',
                 '', '', MotorEmisorBusqueda, False, True, Grd.Panel, Self);
              {          CreaLFDBEditFind ('DBEFEmisor'+Nombre,65,286,42,
                            ZDMPedidosEsp.DSPedidosDet, [obEmpresa,obEjercicio,obCanal],
                            'MOTOR_EMISOR','ARTICULO','TITULO','VER_ARTICULOS_EF',
                            '','tipo_articulo_tyc=''V'' and familia<>''SYS''', nil,
                            False, True, Grd.Panel,Self);}

              {          CBV := TDBComboBoxValue.Create(Self);
          CBV.Parent := Grd.Panel;
          CBV.Name := 'DBCBVManualMotor'+Nombre;
          CBV.Width := 90;
          CBV.Left  := 352;
          CBV.Top   := 32;
          CBV.DataSource := ZDMPedidosEsp.DSPedidosDet;
          CBV.DataField  := 'MANUAL_MOTOR';
          CBV.DropDownCount := 2;
          CBV.Items.Add('Manual');
          CBV.Items.Add('Motor');
          CBV.Values.Add('0');
          CBV.Values.Add('1');   }
           end  //Fin IF CAMPO
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'PARTIDA_O_ENTERA' then
           begin//PARTIDA O ENTERA
              CreaLFDBCheckBox('ChkBPartida' + Nombre, 'Partida', 54, 367, 6,
                 ZDMPedidosEsp.DSPedidosDet, 'PARTIDA_O_ENTERA', '0', '1',
                 DBChkBChange, Grd.Panel, Self);

              CreaLFDBCheckBox('ChkBEntera' + Nombre, 'Entera', 54, 367, 22,
                 ZDMPedidosEsp.DSPedidosDet, 'PARTIDA_O_ENTERA', '1', '0',
                 DBChkBChange, Grd.Panel, Self);
              //PARTIDA
              CreaLFLabel('LblPartida' + Nombre, 'Partida', 377, 43, Grd.Panel, Self);
              CreaLFDBEditFind('DBEFPartida' + Nombre, 41, 413, 41,
                 ZDMPedidosEsp.DSPedidosDet, [],
                 'PARTIDA_DER_IZQ_MED', 'CODIGO', 'DESCRIPCION', 'Z_SYS_AUXILIARES',
                 '', 'tipo_aux=''PAR''', nil, False, False, Grd.Panel, Self);
              //ENTERA
              CreaLFLabel('LblEntera' + Nombre, ' Entera', 376, 43, Grd.Panel, Self);
              CreaLFDBEditFind('DBEFEntera' + Nombre, 41, 413, 41,
                 ZDMPedidosEsp.DSPedidosDet, [],
                 'ENTERA_DER_O_IZQ', 'CODIGO', 'DESCRIPCION', 'Z_SYS_AUXILIARES',
                 '', 'tipo_aux=''ENT''', nil, False, False, Grd.Panel, Self);
           end  //Fin IF CAMPO
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'MONTAJE' then
           begin //MONTAJE
              CreaLFLabel('LblMontaje' + Nombre, 'Montaje', 247, 67, Grd.Panel, Self);
              CreaLFDBEditFind('DBEFMontaje' + Nombre, 41, 288, 65,
                 ZDMPedidosEsp.DSPedidosDet, [],
                 'MONTAJE', 'CODIGO', 'DESCRIPCION', 'Z_SYS_AUXILIARES',
                 '', 'tipo_aux=''MON''', nil, False, False, Grd.Panel, Self);
           end
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'COLOCACION' then
           begin //COLOCACION
              CreaLFLabel('LblColocacion' + Nombre, 'Colocación', 347, 67, Grd.Panel, Self);
              CreaLFDBEditFind('DBEFColocacion' + Nombre, 41, 403, 65,
                 ZDMPedidosEsp.DSPedidosDet, [],
                 'COLOCACION', 'CODIGO', 'DESCRIPCION', 'Z_SYS_AUXILIARES',
                 '', 'tipo_aux=''CLC''', nil, False, False, Grd.Panel, Self);
           end
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'TEJADILLO' then
           begin //TEJADILLO
              CreaLFLabel('LblTejadillo' + Nombre, 'Tejadillo', 246, 86, Grd.Panel, Self);
              CreaLFDBEditFind('DBEFTejadillo' + Nombre, 41, 288, 84,
                 ZDMPedidosEsp.DSPedidosDet, [],
                 'TEJADILLO', 'CODIGO', 'DESCRIPCION', 'Z_SYS_AUXILIARES',
                 '', 'tipo_aux=''TEJ''', nil, False, False, Grd.Panel, Self);
           end
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'PORTERIA' then
           begin //PORTERIA
              CreaLFLabel('LblPorteria' + Nombre, 'Portería', 362, 86, Grd.Panel, Self);
              CreaLFDBEditFind('DBEFPorteria' + Nombre, 41, 403, 84,
                 ZDMPedidosEsp.DSPedidosDet, [],
                 'PORTERIA', 'CODIGO', 'DESCRIPCION', 'Z_SYS_AUXILIARES',
                 '', 'tipo_aux=''POR''', nil, False, False, Grd.Panel, Self);
           end
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'CURRIAS' then
           begin //CURRIAS
              CreaLFLabel('LblCurrias' + Nombre, 'Currias', 253, 105, Grd.Panel, Self);
              CreaLFDBEditFind('DBEFCurrias' + Nombre, 41, 288, 103,
                 ZDMPedidosEsp.DSPedidosDet, [],
                 'CURRIAS', 'CODIGO', 'DESCRIPCION', 'Z_SYS_AUXILIARES',
                 '', 'tipo_aux=''CUR''', nil, False, False, Grd.Panel, Self);
           end
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'CARRIL' then
           begin //CARRIL
              CreaLFLabel('LblCarril' + Nombre, 'Carril', 376, 105, Grd.Panel, Self);
              CreaLFDBEditFind('DBEFCarril' + Nombre, 41, 403, 103,
                 ZDMPedidosEsp.DSPedidosDet, [],
                 'CARRIL', 'CODIGO', 'DESCRIPCION', 'Z_SYS_AUXILIARES',
                 '', 'tipo_aux=''CAR''', nil, False, False, Grd.Panel, Self);
           end
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'VARILLA' then
           begin //VARILLA
              CreaLFLabel('LblVarilla' + Nombre, 'Varilla', 256, 124, Grd.Panel, Self);
              CreaLFDBEditFind('DBEFVarilla' + Nombre, 41, 288, 122,
                 ZDMPedidosEsp.DSPedidosDet, [],
                 'VARILLA', 'CODIGO', 'DESCRIPCION', 'Z_SYS_AUXILIARES',
                 '', 'tipo_aux=''VAR''', nil, False, False, Grd.Panel, Self);
           end
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'CONFECCION' then
           begin //CAMPOS DE CONFECCION
              //Tipo Confeccion
              CreaLFLabel('LblTipoConf' + Nombre, 'Tipo Conf.', 471, 24, Grd.Panel, Self);
              CreaLFDBEditFind('DBEFTipoConf' + Nombre, 41, 523, 21,
                 ZDMPedidosEsp.DSPedidosDet, [],
                 'TIPO_CONFECCION', 'CODIGO', 'DESCRIPCION', 'Z_SYS_AUXILIARES',
                 '', 'tipo_aux=''TCF''', nil, False, False, Grd.Panel, Self);
              //Ollaos Pequeños
              CreaLFLabel('LblOllaosPeq' + Nombre, 'Ollaos Peq.', 467, 44, Grd.Panel, Self);
              CreaLFDbedit('DBEOllaosPeq' + Nombre, 41, 523, 41,
                 ZDMPedidosEsp.DSPedidosDet, 'CONFECCION_OLLAOS_PEQ', False, Grd.Panel, Self);
              //Ollaos Grandes
              CreaLFLabel('LblOllaosGran' + Nombre, 'Ollaos Gran.', 464, 64, Grd.Panel, Self);
              CreaLFDbedit('DBEOllaosGran' + Nombre, 41, 523, 61,
                 ZDMPedidosEsp.DSPedidosDet, 'CONFECCION_OLLAOS_GRAN', False, Grd.Panel, Self);
              //Dobladillo Alrededor
              CreaLFDBCheckBox('ChkBDoblaAlred' + Nombre, 'Dobladillo Alred.', 98, 464, 85,
                 ZDMPedidosEsp.DSPedidosDet, 'CONFECCION_DOBLA_ALRED', '1', '0',
                 nil, Grd.Panel, Self);
           end
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'ARRIBA_O_ABAJO' then
           begin //CHECK ARRIBA O ABAJO
              CreaLFDBCheckBox('ChkBArriba' + Nombre, 'Arriba', 65, 572, 4,
                 ZDMPedidosEsp.DSPedidosDet, 'ARRIBA_O_ABAJO', '1', '0',
                 DBChkBChange, Grd.Panel, Self);
              CreaLFDBCheckBox('ChkBAbajo' + Nombre, 'Abajo', 65, 572, 20,
                 ZDMPedidosEsp.DSPedidosDet, 'ARRIBA_O_ABAJO', '0', '1',
                 DBChkBChange, Grd.Panel, Self);
           end
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'VELCRO' then
           begin //CHECK VELCRO
              CreaLFDBCheckBox('ChkBVelcro' + Nombre, 'Velcro', 65, 572, 45,
                 ZDMPedidosEsp.DSPedidosDet, 'VELCRO', '1', '0',
                 nil, Grd.Panel, Self);
           end
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'CORTE' then
           begin //CHECK CORTE
              CreaLFDBCheckBox('ChkBCorte' + Nombre, 'Corte', 65, 572, 61,
                 ZDMPedidosEsp.DSPedidosDet, 'CORTE', '1', '0',
                 nil, Grd.Panel, Self);
           end
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'MONTADO' then
           begin //CHECK MONTADO
              CreaLFDBCheckBox('ChkBMontado' + Nombre, 'Montado', 65, 572, 77,
                 ZDMPedidosEsp.DSPedidosDet, 'MONTADO', '1', '0',
                 nil, Grd.Panel, Self);
           end
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'QUEDAR' then
           begin //CHECK QUEDAR
              CreaLFDBCheckBox('ChkBQuedar' + Nombre, 'Quedar', 65, 572, 93,
                 ZDMPedidosEsp.DSPedidosDet, 'QUEDAR', '1', '0',
                 nil, Grd.Panel, Self);
           end
           else if ZDMPedidosEsp.xDatosConfigCAMPO.AsString = 'ROTULADO' then
           begin //COMENTARIO ROTULADO
              CreaLFLabel('LblRotulo' + Nombre, 'Rótulo', 174, 147, Grd.Panel, Self);
              CreaLFDbedit('DBEComentRotulado' + Nombre, 150, 209, 146,
                 ZDMPedidosEsp.DSPedidosDet, 'ROTULADO_COMENTARIO', False, Grd.Panel, Self);
           end;
           ZDMPedidosEsp.xDatosConfig.Next;
        end;  //Fin WHILE  
        //    end;    //Fin If Tipo=''T''
     end;    //Fin ELSE If Tipo=''C''
  end;      //Fin If Not Existe
end;

procedure TZFMPedidosEsp.TSPestanyaShow(Sender: TObject);
// var
//   i : integer;
begin
  if (ZDMPedidosEsp.QMPedidosTipo.State <> dsInsert) and
     (ZDMPedidosEsp.QMPedidosTipo.State <> dsEdit) then
  begin
     TipoG := Copy((Sender as TTabSheet).Name, 3, 1);
     ModeloG := Copy((Sender as TTabSheet).Name, 4, 3);

     {    for i:=0 to ComponentCount - 1 do
    begin
      if (Components[i] is TControlEdit) and
         ((Components[i] as TControlEdit).Name = 'CE'+TipoG+ModeloG) then
        ControlEdit := (Components[i] as TControlEdit);
    end;
}
     Semaforo := False;
     ZDMPedidosEsp.QMPedidosTipo.Locate('TIPO_ARTICULO_TYC;MODELO', VarArrayOf([TipoG, ModeloG]), []);
     Semaforo := True;

     if ((TipoG = 'T') or (TipoG = 'A')) then
        ZDMPedidosEsp.RefrescarImagen;
  end;
end;

procedure TZFMPedidosEsp.BuscaPestanya(Tipo, Modelo: string);
var
  i : integer;
begin
  if (Semaforo) then
  begin
     TipoG := Tipo;
     Modelo := Trim(Modelo);
     ModeloG := Modelo;

     for i := 0 to PCModelosArt.PageCount - 1 do
     begin
        if PCModelosArt.Pages[i].Name = 'TS' + TipoG + ModeloG then
        begin
           PCModelosArt.ActivePageIndex := i;
           Break;
        end;
     end;
  end;
end;

procedure TZFMPedidosEsp.CreaLFLabel(Name, Caption: string; Left, Top: integer; Parent: TWinControl; Padre: TComponent);
var
  Lbl : TLFLabel;
begin
  Lbl := TLFLabel.Create(Padre);
  Lbl.Parent := Parent;
  Lbl.Name := Name;
  Lbl.Caption := Caption;
  Lbl.Left := Left;
  Lbl.Top := Top;
end;

procedure TZFMPedidosEsp.CreaLFDbedit(Name: string; Width, Left, Top: integer; DataSource: TDataSource; Campo: string; ReadOnly: boolean; Parent: TWinControl; Padre: TComponent);
var
  Dbe : TLFDbedit;
begin
  Dbe := TLFDbedit.Create(Padre);
  Dbe.Parent := Parent;
  Dbe.Name := Name;
  Dbe.Height := 18;
  Dbe.Width := Width;
  Dbe.Left := Left;
  Dbe.Top := Top;
  Dbe.DataSource := DataSource;
  Dbe.DataField := Campo;
  if (ReadOnly) then
  begin
     Dbe.Color := clInfoBk;
     Dbe.Font.Color := clGrayText;
     Dbe.ReadOnly := True;
     Dbe.TabStop := False;
  end;
end;

procedure TZFMPedidosEsp.CreaLFDBEditFind(Name: string; Width, Left, Top: integer; DataSource: TDataSource; Filtros: TROpcionBusqueda; Campo, CampoNum, CampoStr, Tabla, OrdenadoPor, Cond: string; EventoCond: TNotifyEvent; SalirNoExiste, SalirVacio: boolean; Parent: TWinControl; Padre: TComponent);
var
  DBEF : TLFDBEditFind2000;
begin
  DBEF := TLFDBEditFind2000.Create(Padre);
  DBEF.Parent := Parent;
  DBEF.Name := Name;
  DBEF.Height := 18;
  DBEF.Width := Width;
  DBEF.Left := Left;
  DBEF.Top := Top;
  DBEF.Base_de_datos := DMMain.Database;
  DBEF.Entorno := DMMain.EntornoBusqueda;
  DBEF.Filtros := Filtros;
  DBEF.DataSource := DataSource;
  DBEF.DataField := Campo;
  DBEF.Tabla_a_buscar := Tabla;
  DBEF.CampoNum := CampoNum;
  DBEF.CampoStr := CampoStr;
  if (OrdenadoPor <> '') then
     DBEF.OrdenadoPor.Add(OrdenadoPor);
  DBEF.CondicionBusqueda := Cond;
  DBEF.OnBusqueda := EventoCond;
  DBEF.SalirSiNoExiste := SalirNoExiste;
  DBEF.SalirSiVacio := SalirVacio;
end;

procedure TZFMPedidosEsp.CreaLFDBCheckBox(Name, Caption: string; Width, Left, Top: integer; DataSource: TDataSource; Campo, ValCheck, ValUncheck: string; EventoChange: TNotifyEvent; Parent: TWinControl; Padre: TComponent);
var
  ChkB : TLFDBCheckBox;
begin
  ChkB := TLFDBCheckBox.Create(Padre);
  ChkB.Parent := Parent;
  ChkB.Name := Name;
  ChkB.Caption := Caption;
  ChkB.Width := Width;
  ChkB.Left := Left;
  ChkB.Top := Top;
  ChkB.ValueChecked := ValCheck;
  ChkB.ValueUnchecked := ValUncheck;
  ChkB.DataSource := DataSource;
  ChkB.DataField := Campo;
  ChkB.OnChange := EventoChange;
end;

{
procedure TZFMPedidosEsp.CreaImagenDet(Name, Campo: string; Height, Width, Left, Top: integer; Parent: TWinControl; Padre: TComponent);
var
  Bvl : TBevel;
  Img : TDBImage;
begin
  Bvl := TBevel.Create(Padre);
  Bvl.Parent := Parent;
  Bvl.Name := 'Bvl' + Name;
  Bvl.Height := Height;
  Bvl.Width := Width;
  Bvl.Left := Left;
  Bvl.Top := Top;
  Bvl.Hint := _('Doble Click para seleccionar imagen');

  Img := TDBImage.Create(Padre);
  Img.Parent := Parent;
  Img.Name := 'Img' + Name;
  Img.Height := Height - 4;
  Img.Width := Width - 4;
  Img.Left := Left + 2;
  Img.Top := Top + 2;
  Img.Stretch := True;
  Img.DataSource := ZDMPedidosEsp.DSPedidosDet;
  Img.DataField := Campo;
  Img.OnDblClick := ImageDblClick;
end;
}

procedure TZFMPedidosEsp.AbrirArchivo(const Filename: string; ImgComp: TImage);
var
  Entry : PFileEntry;
begin
  try
     // fine, we found an image file, so add it to our internal list
     New(Entry);
     try
        Entry.Name := Filename;
        Entry.Bitmap := TBitmap.Create;
        try
           ImgComp.Picture.LoadFromFile(Filename);
           if not (ImgComp.Picture.Graphic is TBitmap) then
           begin
              // Some extra steps needed to keep non TBitmap descentant alive when scaling.
              // This is needed because when accessing Picture.Bitmap all non-TBitmap content
              // will simply be erased (definitly the wrong action, but we can't do anything
              // to prevent this). Hence we must draw the graphic to a bitmap.
              with Entry.Bitmap do
              begin
                 PixelFormat := pf24Bit;
                 Width := ImgComp.Picture.Width;
                 Height := ImgComp.Picture.Height;
                 Canvas.Draw(0, 0, ImgComp.Picture.Graphic);
              end;
              ImgComp.Picture.Bitmap.Assign(Entry.Bitmap);
           end;
           RescaleImage(ImgComp.Picture.Bitmap, Entry.Bitmap, True);
        finally
           Entry.Bitmap.Free;
        end;
     finally
        Dispose(Entry)
     end;
  except
     on EInvalidGraphic do
     begin
        ImgComp.Picture.Graphic := nil;
        MessageDlg(_('Formato de imagen no aceptado'), mtError, [mbOK], 0);
     end;
     on EFOpenError do
     begin
        ImgComp.Picture.Graphic := nil;
     end;
  end;
end;

procedure TZFMPedidosEsp.FormResize(Sender: TObject);
var
  I, J, RowCount, MEDIDA_PANEL : integer;
begin
  for I := 0 to PCModelosArt.PageCount - 1 do
  begin
     for J := 0 to PCModelosArt.Pages[I].ComponentCount - 1 do
        if (PCModelosArt.Pages[I].Components[J] is TLFDBCtrlGrid) then
        begin
           if (PCModelosArt.Pages[I].Name = 'TSCIND') then
              MEDIDA_PANEL := 50
           else
              MEDIDA_PANEL := 185;
           RowCount := 1;
           (PCModelosArt.Pages[I].Components[J] as TLFDBCtrlGrid).RowCount := RowCount;
           while (PCModelosArt.Pages[I].Components[J] as TLFDBCtrlGrid).PanelHeight > MEDIDA_PANEL do
           begin
              (PCModelosArt.Pages[I].Components[J] as TLFDBCtrlGrid).RowCount := RowCount + 1;
              RowCount := (PCModelosArt.Pages[I].Components[J] as TLFDBCtrlGrid).RowCount;
           end;
           (PCModelosArt.Pages[I].Components[J] as TLFDBCtrlGrid).RowCount := RowCount - 1;
        end;
  end;
end;

procedure TZFMPedidosEsp.ImageDblClick(Sender: TObject);
begin
  if Copy((Sender as TDBImage).Name, 0, 4) = 'ImgR' then
     TZFMImgRibetes.Create(Self).ShowModal
  else if Copy((Sender as TDBImage).Name, 0, 4) = 'ImgB' then
     TZFMImgBambalinas.Create(Self).ShowModal;
end;

procedure TZFMPedidosEsp.LblNuevoClick(Sender: TObject);
begin
  ZDMPedidosEsp.QMPedidosDet.First;
  ZDMPedidosEsp.QMPedidosDet.Insert;
  {
  ZDMPedidosEsp.QMPedidosDet.Insert;
  ZDMPedidosEsp.QMPedidosDet.Post;
  ZDMPedidosEsp.QMPedidosDet.Last;
  LblEditaClick (Sender);
}
end;

procedure TZFMPedidosEsp.LblEditaClick(Sender: TObject);
var
  i, page : integer;
begin
  ZDMPedidosEsp.QMPedidosDet.Edit;

  if TBMain.CanFocus then
     TBMain.SetFocus;

  page := PCModelosArt.ActivePageIndex;
  for i := 0 to PCModelosArt.Pages[page].ComponentCount - 1 do
  begin
     if ((PCModelosArt.Pages[page].Components[i] is TLFDBCtrlGrid) and
        ((PCModelosArt.Pages[page].Components[i] as TLFDBCtrlGrid).Name = 'DBCG' + TipoG + ModeloG)) then
        (PCModelosArt.Pages[page].Components[i] as TLFDBCtrlGrid).SetFocus;
  end;
end;

procedure TZFMPedidosEsp.LblGuardaClick(Sender: TObject);
begin
  ZDMPedidosEsp.Guardar;
end;

procedure TZFMPedidosEsp.LblInicioClick(Sender: TObject);
begin
  ZDMPedidosEsp.QMPedidosDet.First;
end;

procedure TZFMPedidosEsp.LblBorraClick(Sender: TObject);
begin
  if (ConfirmaMensajeCaption(_('¿Borra el registro?'), _('Información'))) then
  begin
     ZDMPedidosEsp.QMPedidosDet.Delete;
     ZDMPedidosEsp.QMPedidosDet.Refresh;
  end;
end;

procedure TZFMPedidosEsp.DBEFSalidaBusqueda(Sender: TObject);
begin
  (Sender as TLFDBEditFind2000).CondicionBusqueda := 'codigo=''' + ModeloG + ''' and linea=' + ZDMPedidosEsp.QMPedidosDetLINEAL.AsString;
end;

procedure TZFMPedidosEsp.SBAClienteDblClick(Sender: TObject);
begin
  AACliente.Execute;
end;

procedure TZFMPedidosEsp.AAClienteExecute(Sender: TObject);
begin
  if EstructuraCreada then
     if DBEFCliente.Text <> '' then
        FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + DBEFCliente.Text);
end;

procedure TZFMPedidosEsp.AAPedidoExecute(Sender: TObject);
begin
  if EstructuraCreada then
     if DBEPedido.Text <> '' then
        FMain.MuestraDocumento
        (ZDMPedidosEsp.QMPedidosCabEJERCICIO_D.AsInteger,
           ZDMPedidosEsp.QMPedidosCabTIPO_D.AsString,
           ZDMPedidosEsp.QMPedidosCabSERIE_D.AsString,
           ZDMPedidosEsp.QMPedidosCabRIG_D.AsInteger);
end;

procedure TZFMPedidosEsp.ANewClienteExecute(Sender: TObject);
begin
  if EstructuraCreada then
  begin
     FMain.EnlaceModal := True;
     FMain.EnlaceInstancias := True;
     FMain.EnlaceCrea := True;
     FMain.EjecutaAccion(FMain.AClientes);

     if FMain.EnlaceDatos <> Null then
     begin
        DBEFCliente.SetBufferText(FMain.EnlaceDatos);
     end;
     DBESuRef.SetFocus;
     FMain.EnlaceModal := False;
     FMain.EnlaceInstancias := False;
     FMain.EnlaceCrea := False;
  end;
end;

procedure TZFMPedidosEsp.HabilitaEnlaces;
begin
  if (FMain.AClientes.Enabled = False) then
  begin
     DBEFCliente.Accion := nil;
     SBACliente.Width := 0;
  end
  else
  begin
     SolapaControles(SBACliente, DescCliente);
     DescCliente.Color := REntorno.ColorEnlaceActivo;
  end;

  if (FMain.APedidos.Enabled = False) then
  begin
     SBAPedido.Width := 0;
  end
  else
  begin
     SolapaControles(SBAPedido, DBEPedido);
     DBEPedido.Color := REntorno.ColorEnlaceActivo;
  end;
end;

procedure TZFMPedidosEsp.DBEFClienteChange(Sender: TObject);
begin
  DescCliente.ActualizaDatos('CLIENTE', DBEFCliente.Text);

  if (DBEFCliente.Text > '0') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           Database := DMMain.DataBase;
           SQL.Add(' SELECT CLI.DIAS_ENTREGA, TER.NOMBRE_R_SOCIAL FROM EMP_CLIENTES CLI ');
           SQL.Add(' LEFT JOIN EMP_ACREEDORES ACR ');
           SQL.Add(' ON (CLI.EMPRESA = ACR.EMPRESA AND CLI.TRANSPORTISTA = ACR.ACREEDOR) ');
           SQL.Add(' LEFT JOIN SYS_TERCEROS TER ');
           SQL.Add(' ON (ACR.TERCERO=TER.TERCERO) ');
           SQL.Add(' WHERE ');
           SQL.Add(' CLI.EMPRESA = :EMPRESA AND ');
           SQL.Add(' CLI.CLIENTE = :CLIENTE ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CLIENTE'].AsInteger := StrToIntDef(DBEFCliente.Text, 0);
           ExecQuery;
           EDiasTransporte.Text := FieldByName['DIAS_ENTREGA'].AsString;
           ETituloTransportista.Text := FieldByName['NOMBRE_R_SOCIAL'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TZFMPedidosEsp.DBCGPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: integer);
var
  i : integer;
begin
  if (ZDMPedidosEsp.QMPedidosDet.State in [dsInsert, dsEdit]) then
  begin
     DBCtrlGrid.SelectedColor := clMoneyGreen;
     TLFDBCtrlGrid(DBCtrlGrid).Panel.Enabled := True;
  end
  else
  begin
     DBCtrlGrid.SelectedColor := clSilver;
     TLFDBCtrlGrid(DBCtrlGrid).Panel.Enabled := False;
  end;

  for i := 0 to ComponentCount - 1 do
  begin
     //MANUAL O MOTOR
     //Manivela
     if ((Components[i] is TLFLabel) and
        ((Components[i] as TLFLabel).Name = 'LblManivela' + TipoG + ModeloG)) then
        (Components[i] as TLFLabel).Visible := ZDMPedidosEsp.QMPedidosDetMANUAL_O_MOTOR.AsInteger = 0;
     if ((Components[i] is TLFDBEditFind2000) and
        ((Components[i] as TLFDBEditFind2000).Name = 'DBEFManivela' + TipoG + ModeloG)) then
        (Components[i] as TLFDBEditFind2000).Visible := ZDMPedidosEsp.QMPedidosDetMANUAL_O_MOTOR.AsInteger = 0;
     //LT
     if ((Components[i] is TLFLabel) and
        ((Components[i] as TLFLabel).Name = 'LblLT' + TipoG + ModeloG)) then
        (Components[i] as TLFLabel).Visible := ZDMPedidosEsp.QMPedidosDetMANUAL_O_MOTOR.AsInteger = 1;
     if ((Components[i] is TLFDBEditFind2000) and
        ((Components[i] as TLFDBEditFind2000).Name = 'DBEFLT' + TipoG + ModeloG)) then
        (Components[i] as TLFDBEditFind2000).Visible := ZDMPedidosEsp.QMPedidosDetMANUAL_O_MOTOR.AsInteger = 1;
     //EMISOR
     if ((Components[i] is TLFLabel) and
        ((Components[i] as TLFLabel).Name = 'LblEmisor' + TipoG + ModeloG)) then
        (Components[i] as TLFLabel).Visible := ZDMPedidosEsp.QMPedidosDetMANUAL_O_MOTOR.AsInteger = 1;
     if ((Components[i] is TLFDBEditFind2000) and
        ((Components[i] as TLFDBEditFind2000).Name = 'DBEFEmisor' + TipoG + ModeloG)) then
        (Components[i] as TLFDBEditFind2000).Visible := ZDMPedidosEsp.QMPedidosDetMANUAL_O_MOTOR.AsInteger = 1;

     //PARTIDA O ENTERA
     //Partida
     if ((Components[i] is TLFLabel) and
        ((Components[i] as TLFLabel).Name = 'LblPartida' + TipoG + ModeloG)) then
        (Components[i] as TLFLabel).Visible := ZDMPedidosEsp.QMPedidosDetPARTIDA_O_ENTERA.AsInteger = 0;
     if ((Components[i] is TLFDBEditFind2000) and
        ((Components[i] as TLFDBEditFind2000).Name = 'DBEFPartida' + TipoG + ModeloG)) then
        (Components[i] as TLFDBEditFind2000).Visible := ZDMPedidosEsp.QMPedidosDetPARTIDA_O_ENTERA.AsInteger = 0;
     //Entera
     if ((Components[i] is TLFLabel) and
        ((Components[i] as TLFLabel).Name = 'LblEntera' + TipoG + ModeloG)) then
        (Components[i] as TLFLabel).Visible := ZDMPedidosEsp.QMPedidosDetPARTIDA_O_ENTERA.AsInteger = 1;
     if ((Components[i] is TLFDBEditFind2000) and
        ((Components[i] as TLFDBEditFind2000).Name = 'DBEFEntera' + TipoG + ModeloG)) then
        (Components[i] as TLFDBEditFind2000).Visible := ZDMPedidosEsp.QMPedidosDetPARTIDA_O_ENTERA.AsInteger = 1;

     //SALIDA O CORTE
     if ((Components[i] is TLFLabel) and
        ((Components[i] as TLFLabel).Name = 'LblSalida' + TipoG + ModeloG)) then
        (Components[i] as TLFLabel).Visible := ZDMPedidosEsp.QMPedidosDetCORTE.AsInteger = 0;
     if ((Components[i] is TLFLabel) and
        ((Components[i] as TLFLabel).Name = 'LblMedidaCorte' + TipoG + ModeloG)) then
        (Components[i] as TLFLabel).Visible := ZDMPedidosEsp.QMPedidosDetCORTE.AsInteger = 1;

     //Ajustamos Height de Edits a 18
     if (Components[i] is TLFDBEditFind2000) then
        (Components[i] as TLFDBEditFind2000).Height := 18;
     if (Components[i] is TLFDBEdit) then
        (Components[i] as TLFDBEdit).Height := 18;

     if ((Components[i] is TLFLabel) and
        ((Components[i] as TLFLabel).Name = 'LblEditar' + TipoG + ModeloG)) then
        if (ZDMPedidosEsp.QMPedidosDet.State in [dsInsert, dsEdit]) then
           (Components[i] as TLFLabel).Visible := False
        else
           (Components[i] as TLFLabel).Visible := True;

     if ((Components[i] is TLFLabel) and
        ((Components[i] as TLFLabel).Name = 'LblGuardar' + TipoG + ModeloG)) then
        if (ZDMPedidosEsp.QMPedidosDet.State in [dsInsert, dsEdit]) then
           (Components[i] as TLFLabel).Visible := True
        else
           (Components[i] as TLFLabel).Visible := False;
  end;
end;

procedure TZFMPedidosEsp.SBImagenClick(Sender: TObject);
begin
  with TOpenPictureDialog.Create(nil) do
  begin
     try
        Filter := _('Todas las imágenes|*.bmp;*.jpg;*.gif;*.png|BitMap Images (*.bmp)|*.bmp|JPG Images (*.jpg)|*.jpg|GIF Images (*.gif)|*.gif|PNG Images (*.png)|*.png');
        FilterIndex := 1;
        // Posicion inicial en Mis Imagenes
        InitialDir := GetSpecialFolderPath(CSIDL_MYPICTURES, True);
        Title := _('Carga de Imagen');
        if (Execute) then
        begin
           ZDMPedidosEsp.QMPedidosImgRUTA_IMG.AsString := FileName;
           AbrirArchivo(Filename, ImagenFax);
        end;
     finally
        Free;
     end;
  end;
end;

procedure TZFMPedidosEsp.DBChkBChange(Sender: TObject);
begin
  if (ZDMPedidosEsp.QMPedidosDet.State in [dsInsert, dsEdit]) then
  begin
     if ((Sender as TLFDBCheckBox).Parent as TDBCtrlPanel).Parent.CanFocus then
        ((Sender as TLFDBCheckBox).Parent as TDBCtrlPanel).Parent.SetFocus;

     //    try
     if ((Sender as TLFDBCheckBox).Parent as TDBCtrlPanel).Enabled then
        (Sender as TLFDBCheckBox).SetFocus;
     //    except
     //    end;
  end;
end;

procedure TZFMPedidosEsp.ButtAnyadirClick(Sender: TObject);
begin
  TZFMPedidosEspSelecTipo.Create(Self).ShowModal;
end;

procedure TZFMPedidosEsp.RescaleImage(Source, Target: TBitmap; FastStretch: boolean);
// if source is in at least one dimension larger than the thumb size then rescale source
// but keep aspect ratio
var
  NewWidth, NewHeight : integer;
begin
  FThumbWidth := 100;
  FThumbHeight := 100;
  if (Source.Width > FThumbWidth) or (Source.Height > FThumbHeight) then
  begin
     // Note: rescaling does only work for 24 bit images hence even monochrom images
     //       are converted to RGB.
     if Source.Width > Source.Height then
     begin
        NewWidth := FThumbWidth;
        NewHeight := Round(FThumbHeight * Source.Height / Source.Width);
     end
     else
     begin
        NewHeight := FThumbHeight;
        NewWidth := Round(FThumbWidth * Source.Width / Source.Height);
     end;
     if FastStretch then
     begin
        Target.PixelFormat := pf24Bit;
        Target.Width := NewWidth;
        Target.Height := NewHeight;
        Target.Palette := Source.Palette;
        SetStretchBltMode(Target.Canvas.Handle, COLORONCOLOR);
        StretchBlt(Target.Canvas.Handle, 0, 0, NewWidth, NewHeight, Source.Canvas.Handle, 0, 0,
           Source.Width, Source.Height, SRCCOPY);
        // Target.Canvas.CopyRect(Rect(0, 0, NewWidth, NewHeight), Source.Canvas, Rect(0, 0, Source.Width, Source.Height));
     end
     else
        Stretch(NewWidth, NewHeight, sfTriangle, 0, Source, Target);
  end
  else
     Target.Assign(Source);
end;


procedure TZFMPedidosEsp.ImagenFax2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
var
  OrgFormPoint, CurCursorPoint, OrgCursorPoint : TPoint;
begin
  OrgFormPoint.X := xx;
  OrgFormPoint.Y := yy;
  GetCursorpos(OrgCursorPoint);

  while (GetAsyncKeystate(VK_LBUTTON) <> 0) do
  begin
     GetCursorpos(CurCursorPoint);
     xx := OrgFormPoint.X - OrgCursorPoint.X + CurCursorPoint.X;
     yy := OrgFormPoint.Y - OrgCursorPoint.Y + CurCursorPoint.Y;
     {Borramos antes de pintar, para evitar restos perdidos}
     ImagenFax2.Canvas.FillRect(ImagenFax2.ClientRect);
     ImagenFAx2.Canvas.Draw(xx, yy, ImagenFax.picture.graphic);
     Application.ProcessMessages;
  end;
end;

procedure TZFMPedidosEsp.MotorEmisorBusqueda(Sender: TObject);
var
  Linea, Salida : integer;
begin
  Linea := ZDMPedidosEsp.DameMinimaLinea(ZDMPedidosEsp.QMPedidosDetMODELO.AsString, ZDMPedidosEsp.QMPedidosDetLINEAL.AsInteger);
  Salida := ZDMPedidosEsp.DameMinimaSalida(ZDMPedidosEsp.QMPedidosDetMODELO.AsString, Linea, ZDMPedidosEsp.QMPedidosDetSALIDA.AsInteger);

  (Sender as TLFDBEditFind2000).CondicionBusqueda :=
     'codigo=''' + ZDMPedidosEsp.QMPedidosDetMODELO.AsString + '''' +
     ' and linea=' + IntToStr(Linea) +
     ' and salida=' + IntToStr(Salida);
end;

procedure TZFMPedidosEsp.VerListadodePedidoEspecial1Click(Sender: TObject);
begin
  if (ZDMPedidosEsp.QMPedidosCabID_S_D.AsInteger > 0) then
  begin
     AbreData(TZDMLstPedidos, ZDMLstPedidos);
     ZDMLstPedidos.MostrarListadoNav(0, ZDMPedidosEsp.QMPedidosCabID_S_D.AsInteger, ZDMPedidosEsp.QTyCConfigLISTADO_PED_ESPECIALES.AsInteger, 0);
     CierraData(ZDMLstPedidos);
  end;
end;

procedure TZFMPedidosEsp.ImprimirListadodePedidoEspecial1Click(Sender: TObject);
begin
  if (ZDMPedidosEsp.QMPedidosCabID_S_D.AsInteger > 0) then
  begin
     AbreData(TZDMLstPedidos, ZDMLstPedidos);
     ZDMLstPedidos.MostrarListadoNav(1, ZDMPedidosEsp.QMPedidosCabID_S_D.AsInteger, ZDMPedidosEsp.QTyCConfigLISTADO_PED_ESPECIALES.AsInteger, 1);
     CierraData(ZDMLstPedidos);
  end;
end;

procedure TZFMPedidosEsp.ListadodePedidoEspecial2Click(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TZDMLstPedidos, ZDMLstPedidos);
  TFMListConfig.Create(Self).Muestra(ZDMPedidosEsp.QTyCConfigLISTADO_PED_ESPECIALES.AsInteger, formato, cabecera, copias,
     pijama, REntorno.Serie, ZDMLstPedidos.frPedidoEsp);
  CierraData(ZDMLstPedidos);
end;

procedure TZFMPedidosEsp.PCModelosArtResize(Sender: TObject);
begin
  FormResize(Sender);
end;

procedure TZFMPedidosEsp.VerLisadodePedidoEspecial2(Sender: TObject);
begin
  if (ZDMPedidosEsp.QMPedidosCabID_S_D.AsInteger > 0) then
  begin
     AbreData(TZDMLstPedidos, ZDMLstPedidos);
     ZDMLstPedidos.MostrarListadoNav(0, ZDMPedidosEsp.QMPedidosCabID_S_D.AsInteger, 0, 0);
     CierraData(ZDMLstPedidos);
  end;
end;

procedure TZFMPedidosEsp.LFNotasBClick(Sender: TObject);
begin
  if (ZDMPedidosEsp.QMPedidosDet.State in [dsEdit, dsInsert]) then
     ZDMPedidosEsp.QMPedidosDet.Post;
  ZDMPedidosEsp.QMPedidosDet.Edit;

  EditarCampoNotas(Self, ZDMPedidosEsp.DSPedidosDet, ZDMPedidosEsp.QMPedidosDetNOTAS);
end;

procedure TZFMPedidosEsp.EFSerieChange(Sender: TObject);
begin
  ETitSerie.Text := DameTituloSerie(EFSerie.Text);
end;

end.
