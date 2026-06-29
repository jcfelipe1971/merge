unit UFMConfig;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, UDBDateTimePicker, StdCtrls, Spin, Grids, DB, DBGrids,
  ExtCtrls, UHYDBGrid, UNavigator, URecursos, UFIBDBEditfind, Buttons,
  DBCtrls, Mask, Printers, WinSpool, UControlEdit,
  UFormGest, NsDBGrid, ULFDBCheckBox, ULFDBEdit, ULFToolBar, ULFEdit,
  ULFPanel, ULFPageControl, ULFComboBox, ULFCheckBox, UTools,
  TFlatCheckBoxUnit, ULFLabel, rxPlacemnt, ULFFormStorage,
  UComponentesBusquedaFiltrada, ULFEditFind2000, UFPEditSinNavegador,
  ActnList, ULFActionList, Menus, UTeclas, UEditPanel, ULFMemo, ULFDBMemo,
  UG2kTBLoc;

type
  TFMConfig = class(TFPEditSinNavegador)
     PCMain: TLFPageControl;
     TSTeclas: TTabSheet;
     TSGenericas: TTabSheet;
     TSInformacion: TTabSheet;
     PInfo: TLFPanel;
     LBaseDeDatos: TLFLabel;
     LVersion: TLFLabel;
     LUsuario: TLFLabel;
     PNLDatos: TLFPanel;
     EBaseDeDatos: TLFEdit;
     EVersion: TLFEdit;
     EUsuario: TLFEdit;
     ESistema: TLFEdit;
     LSistema: TLFLabel;
     TSMapa: TTabSheet;
     TSDetalle: TTabSheet;
     PDetalle: TLFPanel;
     PImp: TTabSheet;
     PNLBotones: TLFPanel;
     TBBotones: TLFToolBar;
     TButtBackup: TToolButton;
     LRestore: TLFLabel;
     TButtRestore: TToolButton;
     LBackup: TLFLabel;
     TButtSweep: TToolButton;
     LSweep: TLFLabel;
     EBackups: TLFEdit;
     LDirBackup: TLFLabel;
     BTNDirectorioBackup: TSpeedButton;
     TButtParches: TToolButton;
     LActualizaciones: TLFLabel;
     PNGenericas: TLFPanel;
     LVaciaEntradas: TLFLabel;
     LVaciaEntradasIncorrectas: TLFLabel;
     LInicializaSistema: TLFLabel;
     LVaciaUbicaciones: TLFLabel;
     LVaciaTemporales: TLFLabel;
     LVaciaConfiguracion: TLFLabel;
     LFLCB: TLFLabel;
     AniTempo: TAnimate;
     CBConfigPVenta: TLFCheckBox;
     CBEfectos: TLFCheckBox;
     CBUdSecundarias: TLFCheckBox;
     CBPCoste: TLFCheckBox;
     EPrefijoCodBarras: TLFEdit;
     TBGenericas: TLFToolBar;
     TButtIniciaSistema: TToolButton;
     TButtUbicaciones: TToolButton;
     TButtGen_Innecesarios: TToolButton;
     TButtGen_Todos: TToolButton;
     TButtGen_LimpiaTemp: TToolButton;
     TBBorraConf: TToolButton;
     PNTeclas: TLFPanel;
     Pnl_Edicion: TLFPanel;
     Grp_Combinacion: TGroupBox;
     Btn_Aceptar: TSpeedButton;
     Edt_Tecla: TLFEdit;
     Chk_Ctrl: TLFCheckBox;
     Chk_Alt: TLFCheckBox;
     Chk_Shift: TLFCheckBox;
     Pnl_Navegador: TLFPanel;
     HYMNavTeclas: THYMNavigator;
     Pnl_Grid: TLFPanel;
     DBGTeclas: THYTDBGrid;
     PNMapa: TLFPanel;
     PMapaTitulo: TLFPanel;
     PMapa: TLFPanel;
     TWMapa: TTreeView;
     TBMapa: TLFToolBar;
     TButtRegMapa: TToolButton;
     PNDetalle: TLFPanel;
     LEmpresa: TLFLabel;
     LEjercicio: TLFLabel;
     Canal: TLFLabel;
     LPais: TLFLabel;
     LMoneda: TLFLabel;
     LModoIVA: TLFLabel;
     LTipoIVA: TLFLabel;
     LPerfil: TLFLabel;
     DBEEmpresa: TLFDbedit;
     DBETitEmpresa: TLFDbedit;
     DBECanal: TLFDbedit;
     DBETitCanal: TLFDbedit;
     DBEEjercicio: TLFDbedit;
     DBCBActivo: TLFDBCheckBox;
     DBEPais: TLFDbedit;
     DBEModoIva: TLFDbedit;
     DBEMoneda: TLFDbedit;
     GBContabilidad: TGroupBox;
     LNiveles: TLFLabel;
     LAsientoApertura: TLFLabel;
     LFechaApertura: TLFLabel;
     LFechaCierre: TLFLabel;
     LFechaLimite: TLFLabel;
     LFechaActivacion: TLFLabel;
     LAsientoCierre: TLFLabel;
     DBENiveles: TLFDbedit;
     DBEAto_Cierre: TLFDbedit;
     DBEAto_Apertura: TLFDbedit;
     DBEFecApertura: TLFDbedit;
     DBEFecCierre: TLFDbedit;
     DBEFecLimite: TLFDbedit;
     DBEActivacion: TLFDbedit;
     DBETitPais: TLFDbedit;
     DBETitMoneda: TLFDbedit;
     DBETitModoIva: TLFDbedit;
     DBETipoIva: TLFDbedit;
     DBETitTipoIva: TLFDbedit;
     DBETitPerfil: TLFDbedit;
     DBEPerfil: TLFDbedit;
     ScrBImagen: TScrollBox;
     Imagen: TImage;
     PNImpresoras: TLFPanel;
     LImpresoraPredeterminadaPapelNormal: TLFLabel;
     LImpresoraPredeterminadaPapelContirnuo: TLFLabel;
     LblMoneda: TLFLabel;
     CBMatricial: TLFComboBox;
     EDTPuertoMatricial: TLFEdit;
     DBLCBMoneda: TDBLookupComboBox;
     CBLaser: TLFComboBox;
     TBGuardarConfig: TLFToolBar;
     TButtGuardarActual: TToolButton;
     TSConfiguracion: TTabSheet;
     DBGKriConfiguracion: TDBGrid;
     NavKriConfiguracion: THYMNavigator;
     PNLConfiguracion: TLFPanel;
     TBConfiguracion: TLFToolBar;
     ToolButton1: TToolButton;
     TButtRefrescaKriConfiguracion: TToolButton;
     DBGDicNavegadores: TFIBHYGGridFind;
     EFPerfilDicNavegadores: TLFEditFind2000;
     DBGDicGrids: TFIBHYGGridFind;
     LPerfilDicNavegadores: TLFLabel;
     EFPerfilDicGrids: TLFEditFind2000;
     LPerfilDicGrids: TLFLabel;
     PGConfiguracion: TLFPageControl;
     TSKriConfiguracion: TTabSheet;
     TSDicNavegadores: TTabSheet;
     TBDicNavegadores: TLFToolBar;
     NavDicNavegadores: THYMNavigator;
     ToolButton2: TToolButton;
     TSDicGrids: TTabSheet;
     TBDicGrids: TLFToolBar;
     NavDicGrids: THYMNavigator;
     ToolButton3: TToolButton;
     PNLFiltroConfiguracion: TLFPanel;
     EFiltroConfiguracion: TLFEdit;
     TSDicPageControls: TTabSheet;
     DBGDicPageControls1: TFIBHYGGridFind;
     TBDicPageControls: TLFToolBar;
     NavDicPageControls: THYMNavigator;
     TButtSep: TToolButton;
     LPerfilDicPageControls: TLFLabel;
     EFPerfilDicPageControls: TLFEditFind2000;
     LBaseDeDatosAdjuntos: TLFLabel;
     EBaseDeDatosAdjuntos: TLFEdit;
     TSAdjuntos: TTabSheet;
     PNLAdjuntos: TLFPanel;
     LRutaFicheros: TLFLabel;
     ERutaFicheros: TLFEdit;
     LBaseDatosAdjuntos: TLFLabel;
     LUsuarioBDAdjuntos: TLFLabel;
     LRolBDAdjuntos: TLFLabel;
     LClaveBDAdjuntos: TLFLabel;
     EBaseDatosAdjuntos: TLFEdit;
     EUsuarioBDAdjuntos: TLFEdit;
     ERolBDAdjuntos: TLFEdit;
     EClaveBDAdjuntos: TLFEdit;
     TBAdjuntos: TLFToolBar;
     TButtGrabarConfAdjuntos: TToolButton;
     TButtLeerConfAdjuntos: TToolButton;
     LCarpetaCompartida: TLFLabel;
     LUtilizarBaseSeparadaAdjuntos: TLFLabel;
     BTraspasaAdjuntosACarpetaCompartida: TButton;
     BTraspasaAdjuntosABaseSeparada: TButton;
     BTraspasaAdjutnosABase: TButton;
     TSParametros: TTabSheet;
     PNLParametros: TLFPanel;
     CEParamDef: TControlEdit;
     CEParamDefPMEdit: TPopUpTeclas;
     CEParamDefMifirst: TMenuItem;
     CEParamDefMiprior: TMenuItem;
     CEParamDefMinext: TMenuItem;
     CEParamDefMilast: TMenuItem;
     CEParamDefMiinsert: TMenuItem;
     CEParamDefMidelete: TMenuItem;
     CEParamDefMiedit: TMenuItem;
     CEParamDefMipost: TMenuItem;
     CEParamDefMicancel: TMenuItem;
     CEParamDefMirefresh: TMenuItem;
     CEParamGen: TControlEdit;
     CEParamGenPMEdit: TPopUpTeclas;
     CEParamGenMifirst: TMenuItem;
     CEParamGenMiprior: TMenuItem;
     CEParamGenMinext: TMenuItem;
     CEParamGenMilast: TMenuItem;
     CEParamGenMiinsert: TMenuItem;
     CEParamGenMidelete: TMenuItem;
     CEParamGenMiedit: TMenuItem;
     CEParamGenMipost: TMenuItem;
     CEParamGenMicancel: TMenuItem;
     CEParamGenMirefresh: TMenuItem;
     CEParamEmp: TControlEdit;
     CEParamEmpPMEdit: TPopUpTeclas;
     CEParamEmpMifirst: TMenuItem;
     CEParamEmpMiprior: TMenuItem;
     CEParamEmpMinext: TMenuItem;
     CEParamEmpMilast: TMenuItem;
     CEParamEmpMiinsert: TMenuItem;
     CEParamEmpMidelete: TMenuItem;
     CEParamEmpMiedit: TMenuItem;
     CEParamEmpMipost: TMenuItem;
     CEParamEmpMicancel: TMenuItem;
     CEParamEmpMirefresh: TMenuItem;
     CEParamSer: TControlEdit;
     CEParamSerPMEdit: TPopUpTeclas;
     CEParamSerMifirst: TMenuItem;
     CEParamSerMiprior: TMenuItem;
     CEParamSerMinext: TMenuItem;
     CEParamSerMilast: TMenuItem;
     CEParamSerMiinsert: TMenuItem;
     CEParamSerMidelete: TMenuItem;
     CEParamSerMiedit: TMenuItem;
     CEParamSerMipost: TMenuItem;
     CEParamSerMicancel: TMenuItem;
     CEParamSerMirefresh: TMenuItem;
     CEParamPer: TControlEdit;
     CEParamPerPMEdit: TPopUpTeclas;
     CEParamPerMifirst: TMenuItem;
     CEParamPerMiprior: TMenuItem;
     CEParamPerMinext: TMenuItem;
     CEParamPerMilast: TMenuItem;
     CEParamPerMiinsert: TMenuItem;
     CEParamPerMidelete: TMenuItem;
     CEParamPerMiedit: TMenuItem;
     CEParamPerMipost: TMenuItem;
     CEParamPerMicancel: TMenuItem;
     CEParamPerMirefresh: TMenuItem;
     PCParametros: TLFPageControl;
     TSParamDef: TTabSheet;
     TBParamDef: TLFToolBar;
     NavParamDef: THYMNavigator;
     PCParamDef: TLFPageControl;
     TSParamDefFicha: TTabSheet;
     PNLParamDef: TLFPanel;
     LAyuda: TLFLabel;
     LValorPorDefecto: TLFLabel;
     LNivel: TLFLabel;
     LValoresPosibles: TLFLabel;
     LLongitud: TLFLabel;
     LTipo: TLFLabel;
     LDescripcion: TLFLabel;
     LParametro: TLFLabel;
     LDetalle: TLFLabel;
     EDTitTipo: TLFEdit;
     DBAyuda: TLFDbedit;
     DBNivel: TLFDbedit;
     DBValor_Def: TLFDbedit;
     DBValores: TLFDbedit;
     DBLongitud: TLFDbedit;
     DBTipo: TLFDbedit;
     DBDescripcion: TLFDbedit;
     DBParametro: TLFDbedit;
     DBMDetalle: TLFDBMemo;
     TSParamDefTabla: TTabSheet;
     DBGParamDef: THYTDBGrid;
     TSParamGen: TTabSheet;
     TBParamGen: TLFToolBar;
     NavParamGen: THYMNavigator;
     DBGFParamGen: TDBGridFind2000;
     PNLParamGenAyuda: TLFPanel;
     DBParamGenAyuda: TDBText;
     MParamGenAyuda: TLFMemo;
     TSParamEmp: TTabSheet;
     TBParamEmp: TLFToolBar;
     NavParamEmp: THYMNavigator;
     ToolButton4: TToolButton;
     CBParamEmpTodos: TLFCheckBox;
     DBGFParamEmp: TDBGridFind2000;
     PNLParamEmpAyuda: TLFPanel;
     DBParamEmpAyuda: TDBText;
     MParamEmpAyuda: TLFMemo;
     TSParamSer: TTabSheet;
     TBParamSer: TLFToolBar;
     NavParamSer: THYMNavigator;
     ToolButton5: TToolButton;
     CBParamSerTodos: TLFCheckBox;
     DBGFParamSer: TDBGridFind2000;
     PNLParamSerAyuda: TLFPanel;
     DBParamSerAyuda: TDBText;
     MParamSerAyuda: TLFMemo;
     TSParamPer: TTabSheet;
     TBParamPer: TLFToolBar;
     NavParamPer: THYMNavigator;
     ToolButton6: TToolButton;
     CBParamPerTodos: TLFCheckBox;
     DBGFParamPer: TDBGridFind2000;
     PNLParamPerAyuda: TLFPanel;
     DBParamPerAyuda: TDBText;
     MParamPerAyuda: TLFMemo;
     TSParamUsu: TTabSheet;
     TBParamUsu: TLFToolBar;
     NavParamUsu: THYMNavigator;
     Butt1: TToolButton;
     CBParamUsuTodos: TLFCheckBox;
     DBGFParamUsu: TDBGridFind2000;
     PNLParamUsuAyuda: TLFPanel;
     DBEAyuda: TDBText;
     MParamUsuAyuda: TLFMemo;
     TBSep1: TToolButton;
     G2KTLParametro: TG2KTBLoc;
     TBSep2: TToolButton;
     TBCreaParametroGeneral: TToolButton;
     TBTBCreaParametroEmpresa: TToolButton;
     TBCreaParametroEmpresaSerie: TToolButton;
     TBCreaParametroPerfil: TToolButton;
     TBCreaParametroUsuario: TToolButton;
     TSUsuariosConcurrentes: TTabSheet;
     LUsuariosConcurrentes: TLFLabel;
     EUsuariosConcurrentes: TLFEdit;
     TBUsuariosConcurrentes: TLFToolBar;
     TBLeerConfUsuariosConcurrentes: TToolButton;
     TBGrabarConfUsuariosConcurrentes: TToolButton;
     MUsuariosConcurrentes: TMemo;
     TBRefrescarUsuariosConcurrentes: TToolButton;
     PNLUsuariosConcurrentes: TLFPanel;
     LUsuariosConcurrentesHint: TLFLabel;
     TSImagenes: TTabSheet;
     PNLImagenes: TLFPanel;
     LRutaFicherosImagenes: TLFLabel;
     LBaseDatosAmagenes: TLFLabel;
     LUsuarioBDImagenes: TLFLabel;
     LRolBDImagenes: TLFLabel;
     LClaveBDImagenes: TLFLabel;
     LCarpetaCompartidaImagenes: TLFLabel;
     LUtilizarBaseSeparadaImagenes: TLFLabel;
     ERutaImagenes: TLFEdit;
     EBaseDatosImagenes: TLFEdit;
     EUsuarioBDImagenes: TLFEdit;
     ERolBDImagenes: TLFEdit;
     EClaveBDImagenes: TLFEdit;
     TBImagenes: TLFToolBar;
     TButtLeerConfImagenes: TToolButton;
     TButtGrabarConfImagenes: TToolButton;
     BTraspasaImagenesACarpetaCompartida: TButton;
     BTraspasaImagenesABaseSeparada: TButton;
     BTraspasaImagenesABase: TButton;
     LRutaLibros: TLFLabel;
     ERutaLibros: TLFEdit;
     BDirectorioRutaLibros: TSpeedButton;
     LDirectorioEDIEntrada: TLFLabel;
     EDirectorioEDIEntrada: TLFEdit;
     SBDirectorioEDIEntrada: TSpeedButton;
     LDirectorioEDISalida: TLFLabel;
     EDirectorioEDISalida: TLFEdit;
     SBDirectorioEDISalida: TSpeedButton;
     LCharsetBDAdjuntos: TLFLabel;
     ECharsetBDAdjuntos: TLFEdit;
     LCharsetBDImagenes: TLFLabel;
     ECharsetBDImagenes: TLFEdit;
     LDirectorioAutofirma: TLFLabel;
     EDirectorioAutofirma: TLFEdit;
     SBDirectorioAutofirma: TSpeedButton;
     SBDirectorio7Zip: TSpeedButton;
     EDirectorio7Zip: TLFEdit;
     LDirectorio7Zip: TLFLabel;
     EVersionAutofirma: TLFEdit;
     LVersionAutofirma: TLFLabel;
     LDirectorioCurl: TLFLabel;
     EDirectorioCurl: TLFEdit;
     SBDirectorioCurl: TSpeedButton;
     LDirectorioLector: TLFLabel;
     EDirectorioLector: TLFEdit;
     SBDirectorioLector: TSpeedButton;
     LDirectorioSumatraPDF: TLFLabel;
     EDirectorioSumatraPDF: TLFEdit;
     SBDirectorioSumatraPDF: TSpeedButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtContadoresClick(Sender: TObject);
     procedure TButtVaciaLogClick(Sender: TObject);
     procedure TButtVaciaLogTodoClick(Sender: TObject);
     procedure TButtIniciaSistemaClick(Sender: TObject);
     procedure Chk_CtrlClick(Sender: TObject);
     procedure Chk_AltClick(Sender: TObject);
     procedure Chk_ShiftClick(Sender: TObject);
     procedure HYMNavTeclasClick(Sender: TObject; Button: TNavigateBtn);
     procedure Btn_AceptarClick(Sender: TObject);
     procedure TSInformacionShow(Sender: TObject);
     procedure TButtLimpiaEmpEjeClick(Sender: TObject);
     procedure TButtGen_TodosClick(Sender: TObject);
     procedure TButtUbicacionesClick(Sender: TObject);
     procedure TButtRegMapaClick(Sender: TObject);
     procedure PImpShow(Sender: TObject);
     procedure TButtGuardarActualClick(Sender: TObject);
     procedure TButtBackupClick(Sender: TObject);
     procedure TButtRestoreClick(Sender: TObject);
     procedure TButtSweepClick(Sender: TObject);
     procedure BTNDirectorioBackupClick(Sender: TObject);
     procedure TButtParchesClick(Sender: TObject);
     procedure CBMatricialChange(Sender: TObject);
     procedure TButtGen_LimpiaTempClick(Sender: TObject);
     procedure CBConfigPVentaClick(Sender: TObject);
     procedure CBEfectosClick(Sender: TObject);
     procedure CBUdSecundariasClick(Sender: TObject);
     procedure CBPCosteClick(Sender: TObject);
     procedure TBBorraConfClick(Sender: TObject);
     procedure TButtRefrescaKriConfiguracionClick(Sender: TObject);
     procedure EFPerfilDicNavegadoresChange(Sender: TObject);
     procedure EFPerfilDicGridsChange(Sender: TObject);
     procedure EFiltroConfiguracionChange(Sender: TObject);
     procedure EFPerfilDicPageControlsChange(Sender: TObject);
     procedure TButtGrabarConfAdjuntosClick(Sender: TObject);
     procedure TButtLeerConfAdjuntosClick(Sender: TObject);
     procedure BTraspasaAdjuntosACarpetaCompartidaClick(Sender: TObject);
     procedure BTraspasaAdjuntosABaseSeparadaClick(Sender: TObject);
     procedure BTraspasaAdjutnosABaseClick(Sender: TObject);
     procedure DBGFParamGenBusqueda(Sender: TObject);
     procedure DBGFParamEmpBusqueda(Sender: TObject);
     procedure DBGFParamSerBusqueda(Sender: TObject);
     procedure DBGFParamPerBusqueda(Sender: TObject);
     procedure DBTipoChange(Sender: TObject);
     procedure CBParamPerTodosClick(Sender: TObject);
     procedure CBParamSerTodosClick(Sender: TObject);
     procedure CBParamEmpTodosClick(Sender: TObject);
     procedure CBParamUsuTodosClick(Sender: TObject);
     procedure PCParametrosChange(Sender: TObject);
     procedure DBGFParamGenRowChange(Sender: TObject);
     procedure DBGFParamEmpRowChange(Sender: TObject);
     procedure DBGFParamSerRowChange(Sender: TObject);
     procedure DBGFParamPerRowChange(Sender: TObject);
     procedure DBGFParamUsuRowChange(Sender: TObject);
     procedure DBGFParamGenExiste(Sender: TObject);
     procedure DBGFParamEmpExiste(Sender: TObject);
     procedure DBGFParamSerExiste(Sender: TObject);
     procedure DBGFParamPerExiste(Sender: TObject);
     procedure DBGFParamUsuExiste(Sender: TObject);
     procedure TBCreaParametroGeneralClick(Sender: TObject);
     procedure TBTBCreaParametroEmpresaClick(Sender: TObject);
     procedure TBCreaParametroEmpresaSerieClick(Sender: TObject);
     procedure TBCreaParametroPerfilClick(Sender: TObject);
     procedure TBCreaParametroUsuarioClick(Sender: TObject);
     procedure TBGrabarConfUsuariosConcurrentesClick(Sender: TObject);
     procedure TBLeerConfUsuariosConcurrentesClick(Sender: TObject);
     procedure TSUsuariosConcurrentesShow(Sender: TObject);
     procedure TBRefrescarUsuariosConcurrentesClick(Sender: TObject);
     procedure TButtLeerConfImagenesClick(Sender: TObject);
     procedure TButtGrabarConfImagenesClick(Sender: TObject);
     procedure BTraspasaImagenesACarpetaCompartidaClick(Sender: TObject);
     procedure BTraspasaImagenesABaseSeparadaClick(Sender: TObject);
     procedure BTraspasaImagenesABaseClick(Sender: TObject);
     procedure ERutaLibrosChange(Sender: TObject);
     procedure EDirectorioEDIEntradaChange(Sender: TObject);
     procedure EDirectorioEDISalidaChange(Sender: TObject);
     procedure EDirectorioAutofirmaChange(Sender: TObject);
     procedure EDirectorio7ZipChange(Sender: TObject);
     procedure EVersionAutofirmaChange(Sender: TObject);
     procedure EDirectorioCurlChange(Sender: TObject);
     procedure EDirectorioLectorChange(Sender: TObject);
     procedure EDirectorioSumatraPDFChange(Sender: TObject);
  private
     { Private declarations }
     function PuertoW95(Puerto: string): string;
     procedure Animacion(Activo: boolean);
     procedure DamePuertosImpresora(impresora: string; var puerto: string);
     procedure ActualizarConfigVentas;
  public
     { Public declarations }
     procedure MostrarTeclaActual(titulo, combinacion: string);
  end;

var
  FMConfig : TFMConfig;

implementation

uses UDMConfig, UDMMain, UEntorno, UFMain, UUtiles, UFMLmpTablasTmp, HYFIBQuery, FIBDataSet, UImagenes;

{$R *.DFM}

procedure TFMConfig.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMConfig, DMConfig);
  EBackups.Text := REntorno.DirBackups;
  ActualizarConfigVentas;
  DBLCBMoneda.KeyValue := DMConfig.LeerMONEDA_SEC;
  EPrefijoCodBarras.Text := DMConfig.LeerPreCB;

  TBGenericas.Align := alLeft;
  TBBotones.Align := alNone;
  TBBotones.Left := 85;
  TBBotones.Top := 8;
  TBMapa.Align := alRight;
  TBGuardarConfig.Align := alBottom;
  RefrescarImagen(Imagen, DMConfig.xVerEstado.FieldByName('E_IMAGEN').AsInteger);
  PCMain.ActivePage := TSTeclas;

  // Solo visible Nivel 9 (Administradores) }
  TSConfiguracion.TabVisible := (REntorno.Nivel = 9);
  if (TSConfiguracion.TabVisible) then
     PGConfiguracion.ActivePage := TSKriConfiguracion;

  TSParametros.TabVisible := (REntorno.Nivel = 9);
  if (TSParametros.TabVisible) then
  begin
     TSParamDef.TabVisible := (REntorno.Nivel = 9);
     PCParametros.ActivePage := TSParamGen;
     PCParametrosChange(Self);
  end;

  TButtLeerConfAdjuntos.Click;
  TButtLeerConfImagenes.Click;

  // Asigno Imagenes a SpeedButton
  GetBitmapFromImageList(Btn_Aceptar, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(Btn_Aceptar, 2, DMMain.ILMain_In, 19);
  GetBitmapFromImageList(BTNDirectorioBackup, 1, DMMain.ILMain_Ac, 65);
  GetBitmapFromImageList(BDirectorioRutaLibros, 1, DMMain.ILMain_Ac, 65);
  GetBitmapFromImageList(SBDirectorioEDIEntrada, 1, DMMain.ILMain_Ac, 65);
  GetBitmapFromImageList(SBDirectorioEDISalida, 1, DMMain.ILMain_Ac, 65);
  GetBitmapFromImageList(SBDirectorioAutofirma, 1, DMMain.ILMain_Ac, 65);
  GetBitmapFromImageList(SBDirectorio7Zip, 1, DMMain.ILMain_Ac, 65);
  GetBitmapFromImageList(SBDirectorioCurl, 1, DMMain.ILMain_Ac, 65);
  GetBitmapFromImageList(SBDirectorioSumatraPDF, 1, DMMain.ILMain_Ac, 65);
  GetBitmapFromImageList(SBDirectorioLector, 1, DMMain.ILMain_Ac, 65);

  FMain.AddComponentePunto(ERutaFicheros);
  FMain.AddComponentePunto(EBaseDatosAdjuntos);
  FMain.AddComponentePunto(EUsuarioBDAdjuntos);
  FMain.AddComponentePunto(ERolBDAdjuntos);
  FMain.AddComponentePunto(EClaveBDAdjuntos);

  // Parametros
  DBGParamDef.DataSource := DMConfig.DSQMParamDef;
  DBGFParamGen.DataSource := DMConfig.DSQMParamGen;
  DBGFParamEmp.DataSource := DMConfig.DSQMParamEmp;
  DBGFParamSer.DataSource := DMConfig.DSQMParamSer;
  DBGFParamPer.DataSource := DMConfig.DSQMParamPer;
  NavParamDef.DataSource := DMConfig.DSQMParamDef;
  NavParamGen.DataSource := DMConfig.DSQMParamGen;
  NavParamEmp.DataSource := DMConfig.DSQMParamEmp;
  NavParamSer.DataSource := DMConfig.DSQMParamSer;
  NavParamPer.DataSource := DMConfig.DSQMParamPer;

  // Texto inicial de las ayuda
  DMConfig.RellenaDetalle(MParamGenAyuda.Lines, DMConfig.QMParamGenPARAMETRO.AsString);
  DMConfig.RellenaDetalle(MParamEmpAyuda.Lines, DMConfig.QMParamEmpPARAMETRO.AsString);
  DMConfig.RellenaDetalle(MParamSerAyuda.Lines, DMConfig.QMParamSerPARAMETRO.AsString);
  DMConfig.RellenaDetalle(MParamPerAyuda.Lines, DMConfig.QMParamPerPARAMETRO.AsString);
  DMConfig.RellenaDetalle(MParamUsuAyuda.Lines, DMConfig.QMParamUsuPARAMETRO.AsString);

  ERutaLibros.Text := LeeDatoIni('Datos', 'RutaLibros', IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, True)));
  EDirectorioEDIEntrada.Text := LeeDatoIni('Datos', 'DirectorioEDI_Entrada', IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, True)));
  EDirectorioEDISalida.Text := LeeDatoIni('Datos', 'DirectorioEDI_Salida', IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, True)));
  EDirectorioLector.Text := LeeDatoIni('Datos', 'DirectorioLector', IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, True)));

  EDirectorio7Zip.Text := LeeDatoIni('7Zip', 'Carpeta', '');
  EDirectorioCurl.Text := LeeDatoIni('Curl', 'Carpeta', '');
  EDirectorioSumatraPDF.Text := LeeDatoIni('SumatraPDF', 'Carpeta', '');

  EDirectorioAutofirma.Text := LeeDatoIni('AutoFirma', 'InstallDir', '');
  EVersionAutofirma.Text := LeeDatoIni('AutoFirma', 'Version', '');

  // Color campo ID
  ColorCampoID(DBParametro);
end;

procedure TFMConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMConfig.EscribirPreCB(EPrefijoCodBarras.Text);

  REntorno.DirBackups := EBackups.Text;
  REntorno.RutaLibros := LeeDatoIni('Datos', 'RutaLibros', IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, True)));
  REntorno.DirectorioEDI_Entrada := LeeDatoIni('Datos', 'DirectorioEDI_Entrada', IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, True)));
  REntorno.DirectorioEDI_Salida := LeeDatoIni('Datos', 'DirectorioEDI_Salida', IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, True)));

  REntorno.Directorio7Zip := LeeDatoIni('7Zip', 'Carpeta', '');
  REntorno.DirectorioCurl := LeeDatoIni('Curl', 'Carpeta', '');
  REntorno.DirectorioSumatraPDF := LeeDatoIni('SumatraPDF', 'Carpeta', '');

  REntorno.DirectorioAutofirma := LeeDatoIni('AutoFirma', 'InstallDir', '');
  REntorno.VersionAutofirma := LeeDatoIni('AutoFirma', 'Version', '');

  FMain.DelComponentePunto(ERutaFicheros);
  FMain.DelComponentePunto(EBaseDatosAdjuntos);
  FMain.DelComponentePunto(EUsuarioBDAdjuntos);
  FMain.DelComponentePunto(ERolBDAdjuntos);
  FMain.DelComponentePunto(EClaveBDAdjuntos);

  CierraData(DMConfig);
end;

procedure TFMConfig.TButtContadoresClick(Sender: TObject);
begin
  DMConfig.AjustaContadores;
end;

procedure TFMConfig.TButtVaciaLogClick(Sender: TObject);
begin
  DMConfig.VaciaLog;
end;

procedure TFMConfig.TButtVaciaLogTodoClick(Sender: TObject);
begin
  DMConfig.VaciaLogTodo;
end;

procedure TFMConfig.TButtIniciaSistemaClick(Sender: TObject);
begin
  CierraFormsMenos(Self);
  if DMConfig.InicializaSistema then
     FMain.ACambiaUser.Execute;
end;

procedure TFMConfig.MostrarTeclaActual(Titulo, Combinacion: string);
begin
  Self.Grp_Combinacion.Caption := Format(_('Combinación para %s'), [Titulo]);
  Self.Edt_Tecla.Text := combinacion;
  if Pos('CTRL', UpperCase(combinacion)) = 0 then
     Self.Chk_Ctrl.Checked := False
  else
     Self.Chk_Ctrl.Checked := True;
  if Pos('ALT', UpperCase(combinacion)) = 0 then
     Self.Chk_Alt.Checked := False
  else
     Self.Chk_Alt.Checked := True;
  if Pos('SHIFT', UpperCase(combinacion)) = 0 then
     Self.Chk_Shift.Checked := False
  else
     Self.Chk_Shift.Checked := True;
end;

procedure TFMConfig.Chk_CtrlClick(Sender: TObject);
var
  indice : integer;
begin
  //Buscamos la cadena ctrl en el edit
  indice := Pos('CTRL', UpperCase(Self.Edt_Tecla.Text));
  if Self.Chk_Ctrl.Checked = False then
  begin
     if indice <> 0 then
     begin
        //...o borramos el mas de despues...
        if Self.Edt_Tecla.Text[indice + 4] = '+' then
        begin
           Self.Edt_Tecla.Text := Copy(Self.Edt_Tecla.Text, 0, indice - 1) + Copy(Self.Edt_Tecla.Text,
              indice + 5, Length(Self.Edt_Tecla.Text));
           Exit;
        end;
        //...o borramos el mas de antes...
        if Self.Edt_Tecla.Text[indice - 1] = '+' then
        begin
           Self.Edt_Tecla.Text := Copy(Self.Edt_Tecla.Text, 0, indice - 2) + Copy(Self.Edt_Tecla.Text,
              indice + 4, Length(Self.Edt_Tecla.Text));
           Exit;
        end;
     end;
  end
  else
  begin
     //Añadimos la cadena ctrl al edit
     if indice = 0 then
     begin
        Self.Edt_Tecla.Text := 'Ctrl+' + Self.Edt_Tecla.Text;
     end;
  end;
end;

procedure TFMConfig.Chk_AltClick(Sender: TObject);
var
  indice : integer;
begin
  //Buscamos la cadena Alt en el edit
  indice := Pos('ALT', UpperCase(Self.Edt_Tecla.Text));
  if Self.Chk_Alt.Checked = False then
  begin
     if indice <> 0 then
     begin
        //...o borramos el mas de despues...
        if Self.Edt_Tecla.Text[indice + 3] = '+' then
        begin
           Self.Edt_Tecla.Text := Copy(Self.Edt_Tecla.Text, 0, indice - 1) + Copy(Self.Edt_Tecla.Text,
              indice + 4, Length(Self.Edt_Tecla.Text));
           Exit;
        end;
        //...o borramos el mas de antes...
        if Self.Edt_Tecla.Text[indice - 1] = '+' then
        begin
           Self.Edt_Tecla.Text := Copy(Self.Edt_Tecla.Text, 0, indice - 2) + Copy(Self.Edt_Tecla.Text,
              indice + 3, Length(Self.Edt_Tecla.Text));
           Exit;
        end;
     end;
  end
  else
  begin
     //Añadimos la cadena alt al edit
     if indice = 0 then
     begin
        Self.Edt_Tecla.Text := 'Alt+' + Self.Edt_Tecla.Text;
     end;
  end;
end;

procedure TFMConfig.Chk_ShiftClick(Sender: TObject);
var
  indice : integer;
begin
  //Buscamos la cadena Shift en el edit
  indice := Pos('SHIFT', UpperCase(Self.Edt_Tecla.Text));
  if Self.Chk_Shift.Checked = False then
  begin
     if indice <> 0 then
     begin
        //...o borramos el mas de despues...
        if Self.Edt_Tecla.Text[indice + 5] = '+' then
        begin
           Self.Edt_Tecla.Text := Copy(Self.Edt_Tecla.Text, 0, indice - 1) + Copy(Self.Edt_Tecla.Text,
              indice + 6, Length(Self.Edt_Tecla.Text));
           Exit;
        end;
        //...o borramos el mas de antes...
        if Self.Edt_Tecla.Text[indice - 1] = '+' then
        begin
           Self.Edt_Tecla.Text := Copy(Self.Edt_Tecla.Text, 0, indice - 2) + Copy(Self.Edt_Tecla.Text,
              indice + 5, Length(Self.Edt_Tecla.Text));
           Exit;
        end;
     end;
  end
  else
  begin
     //Añadimos la cadena Shift al edit
     if indice = 0 then
     begin
        Self.Edt_Tecla.Text := 'Shift+' + Self.Edt_Tecla.Text;
     end;
  end;
end;

procedure TFMConfig.HYMNavTeclasClick(Sender: TObject; Button: TNavigateBtn);
begin
  if Self.ActiveControl <> Self.DBGTeclas then
     Self.FocusControl(Self.DBGTeclas);
end;

procedure TFMConfig.Btn_AceptarClick(Sender: TObject);
begin
  DMConfig.UpdateTeclas(Edt_Tecla.Text);
end;

procedure TFMConfig.TSInformacionShow(Sender: TObject);
begin
  EBaseDeDatos.Text := DMMain.DataBase.DBName;
  EBaseDeDatosAdjuntos.Text := REntorno.BaseDeDatosAdjuntos;
  EVersion.Text := DMMain.DataBase.Version;
  EUsuario.Text := REntorno.Nombre;
  ESistema.Text := REntorno.Sistema;
  EBackups.Text := REntorno.DirBackups;
end;

procedure TFMConfig.TButtLimpiaEmpEjeClick(Sender: TObject);
begin
  if Confirma then
     if ConfirmaGrave then
     begin
        Animacion(True);
        DMConfig.LimpiaEmpresaEjercicio;
        Animacion(False);
        FMain.ACambiaUser.Execute;
     end;
end;

procedure TFMConfig.Animacion(Activo: boolean);
begin
  with AniTempo do
  begin
     // Centro al formulario
     Left := (Self.Width div 2) - (AniTempo.Left div 2);
     Visible := Activo;
     Active := Activo;
  end;
end;

procedure TFMConfig.TButtGen_TodosClick(Sender: TObject);
begin
  DMConfig.VaciaLogTodo;
end;

procedure TFMConfig.TButtUbicacionesClick(Sender: TObject);
begin
  DMConfig.VaciaUbicaciones;
end;

procedure TFMConfig.TButtRegMapaClick(Sender: TObject);
begin
  TWMapa.Items.Clear;
  DMConfig.RellenaMapa;
end;

procedure TFMConfig.PImpShow(Sender: TObject);
var
  iIndex : integer;
begin
  //Inicializamos el combobox
  CBMatricial.Clear;
  CBLaser.Clear;
  //Llenamos el combobox con las impresoras actuales
  for iIndex := 0 to Printer.Printers.Count - 1 do
  begin
     CBMatricial.Items.Add(Printer.Printers[iIndex]);
     CBLaser.Items.Add(Printer.Printers[iIndex]);
     // DamePuertosImpresora(Printer.Printers[iIndex],str);
     // if str=REntorno.NombreMatricial then CBMatricial.ItemIndex:=iIndex;
     // CBLaser.Items.Add(Printer.Printers[iIndex]);
     // if iIndex = printer.PrinterIndex then
     //    ELaser.Text := Printer.Printers[iIndex];
  end;
  //Seleccionamos la de defecto
  EDTPuertoMatricial.Text := REntorno.NombreMatricial;
  CBLaser.ItemIndex := REntorno.Laser;
end;

procedure TFMConfig.TButtGuardarActualClick(Sender: TObject);
begin
  REntorno.NombreMatricial := EDTPuertoMatricial.Text;
  REntorno.Laser := CBLaser.ItemIndex;
  EscribeIni;

  DMConfig.EscribirMONEDA_SEC;
end;

procedure TFMConfig.TButtBackupClick(Sender: TObject);
begin
  DMConfig.GenerarBackup;
end;

procedure TFMConfig.TButtRestoreClick(Sender: TObject);
begin
  DMConfig.GenerarRestore;
end;

procedure TFMConfig.TButtSweepClick(Sender: TObject);
begin
  DMConfig.GenerarSweep;
end;

procedure TFMConfig.BTNDirectorioBackupClick(Sender: TObject);
var
  Directorio : string;
begin
  case TSpeedButton(Sender).Tag of
     1:
     begin
        Directorio := ExcludeTrailingPathDelimiter(REntorno.DirBackups);
        if MySelectDirectory(Directorio, 'FMConfig-DirBackups') then
           REntorno.DirBackups := IncludeTrailingPathDelimiter(Directorio);
        EBackups.Text := REntorno.DirBackups;
     end;
     2:
     begin
        Directorio := ExcludeTrailingPathDelimiter(REntorno.RutaLibros);
        if MySelectDirectory(Directorio, 'FMConfig-RutaLibros') then
           REntorno.RutaLibros := IncludeTrailingPathDelimiter(Directorio);
        ERutaLibros.Text := REntorno.RutaLibros;
     end;
     3:
     begin
        Directorio := ExcludeTrailingPathDelimiter(REntorno.DirectorioEDI_Entrada);
        if MySelectDirectory(Directorio, 'FMConfig-DirectorioEDI_Entrada') then
           REntorno.DirectorioEDI_Entrada := IncludeTrailingPathDelimiter(Directorio);
        EDirectorioEDIEntrada.Text := REntorno.DirectorioEDI_Entrada;
     end;
     4:
     begin
        Directorio := ExcludeTrailingPathDelimiter(REntorno.DirectorioEDI_Salida);
        if MySelectDirectory(Directorio, 'FMConfig-DirectorioEDI_Salida') then
           REntorno.DirectorioEDI_Salida := IncludeTrailingPathDelimiter(Directorio);
        EDirectorioEDISalida.Text := REntorno.DirectorioEDI_Salida;
     end;
     5:
     begin
        Directorio := ExcludeTrailingPathDelimiter(REntorno.DirectorioAutofirma);
        if MySelectDirectory(Directorio, 'FMConfig-DirectorioAutofirma') then
           REntorno.DirectorioAutofirma := IncludeTrailingPathDelimiter(Directorio);
        EDirectorioAutofirma.Text := REntorno.DirectorioAutofirma;
     end;
     6:
     begin
        Directorio := ExcludeTrailingPathDelimiter(REntorno.Directorio7Zip);
        if MySelectDirectory(Directorio, 'FMConfig-Directorio7Zip') then
           REntorno.Directorio7Zip := IncludeTrailingPathDelimiter(Directorio);
        EDirectorio7Zip.Text := REntorno.Directorio7Zip;
     end;
     7:
     begin
        Directorio := ExcludeTrailingPathDelimiter(REntorno.DirectorioCurl);
        if MySelectDirectory(Directorio, 'FMConfig-DirectorioCurl') then
           REntorno.DirectorioCurl := IncludeTrailingPathDelimiter(Directorio);
        EDirectorioCurl.Text := REntorno.DirectorioCurl;
     end;
     8:
     begin
        Directorio := ExcludeTrailingPathDelimiter(REntorno.DirectorioLector);
        if MySelectDirectory(Directorio, 'FMConfig-DirectorioLector') then
           REntorno.DirectorioLector := IncludeTrailingPathDelimiter(Directorio);
        EDirectorioLector.Text := REntorno.DirectorioLector;
     end;
     9:
     begin
        Directorio := ExcludeTrailingPathDelimiter(REntorno.DirectorioSumatraPDF);
        if MySelectDirectory(Directorio, 'FMConfig-DirectorioSumatraPDF') then
           REntorno.DirectorioSumatraPDF := IncludeTrailingPathDelimiter(Directorio);
        EDirectorioSumatraPDF.Text := REntorno.DirectorioSumatraPDF;
     end;
  end;
end;

procedure TFMConfig.TButtParchesClick(Sender: TObject);
begin
  DMConfig.PasarParches;
end;

procedure TFMConfig.CBMatricialChange(Sender: TObject);
var
  str, OldPrinter : string;
begin
  case Win32Platform of
     VER_PLATFORM_WIN32_NT:
     begin
        OldPrinter := EDTPuertoMatricial.Text;
        DamePuertosImpresora(CBMatricial.Items.Strings[CBMatricial.ItemIndex], str);
        if (str <> '') then
           EDTPuertoMatricial.Text := str
        else
           EDTPuertoMatricial.Text := OldPrinter;
     end
     else
        EDTPuertoMatricial.Text := PuertoW95(CBMatricial.Text);
  end;
end;

procedure TFMConfig.DamePuertosImpresora(impresora: string; var puerto: string);
begin
  getRealPrinter(impresora, puerto);
end;

function TFMConfig.PuertoW95(Puerto: string): string;
var
  iIndex, oIndex : integer;
begin
  Result := '';
  oIndex := 0;
  iIndex := Length(Puerto);
  while Puerto[iIndex] <> ' ' do
  begin
     Dec(iIndex);
     Inc(oIndex);
  end;
  Result := Copy(Puerto, iIndex + 1, oIndex);
end;

procedure TFMConfig.TButtGen_LimpiaTempClick(Sender: TObject);
begin
  AbreForm(TFMLmpTablasTmp, FMLmpTablasTmp, Sender);
end;

procedure TFMConfig.ActualizarConfigVentas;
var
  Flag : integer;
begin
  DMConfig.LeerConfigPVentas(Flag);
  if (Flag = 0) then
     CBConfigPVenta.State := cbUnchecked
  else
     CBConfigPVenta.State := cbChecked;
  DMConfig.LeerEFE_COBRAR(Flag);
  if (Flag = 0) then
     CBEfectos.State := cbUnchecked
  else
     CBEfectos.State := cbChecked;
  DMConfig.LeerUD_SEC(Flag);
  if (Flag = 0) then
     CBUdSecundarias.State := cbUnchecked
  else
     CBUdSecundarias.State := cbChecked;
  DMConfig.LeerPCoste(Flag);
  if (Flag = 0) then
     CBPCoste.State := cbUnchecked
  else
     CBPCoste.State := cbChecked;
end;

procedure TFMConfig.CBConfigPVentaClick(Sender: TObject);
begin
  if (CBConfigPVenta.State = cbChecked) then
     DMConfig.EscribirConfigPVentas(1)
  else
     DMConfig.EscribirConfigPVentas(0);
end;

procedure TFMConfig.CBEfectosClick(Sender: TObject);
begin
  if (CBEfectos.State = cbChecked) then
     DMConfig.EscribirEFE_COBRAR(1)
  else
     DMConfig.EscribirEFE_COBRAR(0);
end;

procedure TFMConfig.CBUdSecundariasClick(Sender: TObject);
begin
  if (CBUdSecundarias.State = cbChecked) then
     DMConfig.EscribirUD_SEC(1)
  else
     DMConfig.EscribirUD_SEC(0);
end;

procedure TFMConfig.CBPCosteClick(Sender: TObject);
begin
  if (CBPCoste.State = cbChecked) then
     DMConfig.EscribirPCoste(1)
  else
     DMConfig.EscribirPCoste(0);
end;

procedure TFMConfig.TBBorraConfClick(Sender: TObject);
begin
  if Confirma then
     if ConfirmaGrave then
     begin
        CierraFormsMenos(Self);
        DMConfig.BorraConfiguracion;
        ShowMessage(_('Se ha borrado la configuración total de la base de datos'));
     end;
end;

procedure TFMConfig.TButtRefrescaKriConfiguracionClick(Sender: TObject);
begin
  EFiltroConfiguracion.Text := '';
  DMConfig.ReleeConfiguracion;
end;

procedure TFMConfig.EFPerfilDicNavegadoresChange(Sender: TObject);
begin
  with DMConfig.xDicNavegadores do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM DIC_NAVEGADORES ');
     if (StrToIntDef(EFPerfilDicNavegadores.Text, 0) <> 0) then
        SelectSQL.Add(' WHERE PERFIL =  ' + IntToStr(StrToIntDef(EFPerfilDicNavegadores.Text, 0)));
     SelectSQL.Add(' ORDER BY PERFIL, FORMULARIO, NAVEGADOR ');
     Open;
  end;
end;

procedure TFMConfig.EFPerfilDicGridsChange(Sender: TObject);
begin
  with DMConfig.xDicGrids do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM DIC_GRIDS ');
     if (StrToIntDef(EFPerfilDicGrids.Text, 0) <> 0) then
        SelectSQL.Add(' WHERE PERFIL =  ' + IntToStr(StrToIntDef(EFPerfilDicGrids.Text, 0)));
     SelectSQL.Add(' ORDER BY PERFIL, FORMULARIO, GRID ');
     Open;
  end;
end;

procedure TFMConfig.EFiltroConfiguracionChange(Sender: TObject);
begin
  with DMConfig.xKriConfiguracion do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM KRI_CONFIGURACION ');
     if (Trim(EFiltroConfiguracion.Text) <> '') then
     begin
        SelectSQL.Add(' WHERE UPPER(DESCRIPCION) LIKE UPPER(''%' + Trim(EFiltroConfiguracion.Text) + '%'') ');
        if (StrToIntDef(Trim(EFiltroConfiguracion.Text), 0) <> 0) then
           SelectSQL.Add(' OR ID = ' + Trim(EFiltroConfiguracion.Text));
     end;
     SelectSQL.Add(' ORDER BY ID ');
     Open;
  end;
end;

procedure TFMConfig.EFPerfilDicPageControlsChange(Sender: TObject);
begin
  with DMConfig.xDicPageControls do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM DIC_PAGECONTROLS ');
     if (StrToIntDef(EFPerfilDicPageControls.Text, 0) <> 0) then
        SelectSQL.Add(' WHERE PERFIL =  ' + IntToStr(StrToIntDef(EFPerfilDicPageControls.Text, 0)));
     SelectSQL.Add(' ORDER BY PERFIL, FORMULARIO, PAGECONTROL, TABSHEET ');
     Open;
  end;
end;

procedure TFMConfig.TButtGrabarConfAdjuntosClick(Sender: TObject);
begin
  inherited;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE SYS_CONSTANTES ');
        SQL.Add(' SET ');
        SQL.Add(' BASE_ADJUNTOS = :BASE_ADJUNTOS, ');
        SQL.Add(' USUARIO_BASE_ADJUNTOS = :USUARIO_BASE_ADJUNTOS, ');
        SQL.Add(' CLAVE_BASE_ADJUNTOS = :CLAVE_BASE_ADJUNTOS, ');
        SQL.Add(' ROL_BASE_ADJUNTOS = :ROL_BASE_ADJUNTOS, ');
        SQL.Add(' RUTA_ADJUNTOS = :RUTA_ADJUNTOS, ');
        SQL.Add(' CHARSET_BASE_ADJUNTOS = :CHARSET_BASE_ADJUNTOS ');
        Params.ByName['BASE_ADJUNTOS'].AsString := EBaseDatosAdjuntos.Text;
        Params.ByName['USUARIO_BASE_ADJUNTOS'].AsString := EUsuarioBDAdjuntos.Text;
        Params.ByName['CLAVE_BASE_ADJUNTOS'].AsString := EClaveBDAdjuntos.Text;
        Params.ByName['ROL_BASE_ADJUNTOS'].AsString := ERolBDAdjuntos.Text;
        Params.ByName['RUTA_ADJUNTOS'].AsString := ERutaFicheros.Text;
        Params.ByName['CHARSET_BASE_ADJUNTOS'].AsString := ECharsetBDAdjuntos.Text;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Guardo en el entorno
  REntorno.BaseDeDatosAdjuntos := Trim(EBaseDatosAdjuntos.Text);
  REntorno.UsuarioBDAdjuntos := Trim(EUsuarioBDAdjuntos.Text);
  REntorno.ClaveBDAdjuntos := Trim(EClaveBDAdjuntos.Text);
  REntorno.RolBDAdjuntos := Trim(ERolBDAdjuntos.Text);
  if (Trim(ERutaFicheros.Text) > '') then
     ERutaFicheros.Text := IncludeTrailingPathDelimiter(Trim(ERutaFicheros.Text));
  REntorno.RutaFicheros := ERutaFicheros.Text;

  DMMain.DesConectaAdjuntos;
  DMMain.ConectaAdjuntos;
end;

procedure TFMConfig.TButtLeerConfAdjuntosClick(Sender: TObject);
begin
  inherited;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT BASE_ADJUNTOS, USUARIO_BASE_ADJUNTOS, CLAVE_BASE_ADJUNTOS, ROL_BASE_ADJUNTOS, CHARSET_BASE_ADJUNTOS, RUTA_ADJUNTOS FROM SYS_CONSTANTES ');
        ExecQuery;
        EBaseDatosAdjuntos.Text := FieldByName['BASE_ADJUNTOS'].AsString;
        EUsuarioBDAdjuntos.Text := FieldByName['USUARIO_BASE_ADJUNTOS'].AsString;
        EClaveBDAdjuntos.Text := FieldByName['CLAVE_BASE_ADJUNTOS'].AsString;
        ECharsetBDAdjuntos.Text := FieldByName['CHARSET_BASE_ADJUNTOS'].AsString;
        ERutaFicheros.Text := FieldByName['RUTA_ADJUNTOS'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Trim(ERutaFicheros.Text) > '') then
     ERutaFicheros.Text := IncludeTrailingPathDelimiter(Trim(ERutaFicheros.Text));
end;

procedure TFMConfig.BTraspasaAdjuntosACarpetaCompartidaClick(Sender: TObject);
begin
  inherited;
  DMConfig.TraspasaAdjuntos(0);
end;

procedure TFMConfig.BTraspasaAdjuntosABaseSeparadaClick(Sender: TObject);
begin
  inherited;
  DMConfig.TraspasaAdjuntos(2);
end;

procedure TFMConfig.BTraspasaAdjutnosABaseClick(Sender: TObject);
begin
  inherited;
  DMConfig.TraspasaAdjuntos(1);
end;

procedure TFMConfig.DBGFParamGenBusqueda(Sender: TObject);
begin
  inherited;
  DBGFParamGen.CondicionBusqueda := 'NIVEL <= ' + IntToStr(REntorno.Nivel);
end;

procedure TFMConfig.DBGFParamEmpBusqueda(Sender: TObject);
begin
  inherited;
  DBGFParamEmp.CondicionBusqueda := '';
  if Pos('SYS_PARAMETROS_DEFINICION', Trim(DBGFParamEmp.TablaABuscar)) > 0 then
     DBGFParamEmp.CondicionBusqueda := 'NIVEL <= ' + IntToStr(REntorno.Nivel);
end;

procedure TFMConfig.DBGFParamSerBusqueda(Sender: TObject);
begin
  inherited;
  DBGFParamSer.CondicionBusqueda := '';
  if Pos('SYS_PARAMETROS_DEFINICION', Trim(DBGFParamSer.TablaABuscar)) > 0 then
     DBGFParamSer.CondicionBusqueda := 'NIVEL <= ' + IntToStr(REntorno.Nivel);
  if Pos('VER_SERIES', Trim(DBGFParamSer.TablaABuscar)) > 0 then
     DBGFParamSer.CondicionBusqueda :=
        'EMPRESA=' + REntorno.EmpresaStr +
        ' AND EJERCICIO=' + REntorno.EjercicioStr +
        ' AND CANAL=' + REntorno.CanalStr;
end;

procedure TFMConfig.DBGFParamPerBusqueda(Sender: TObject);
begin
  inherited;
  DBGFParamPer.CondicionBusqueda := '';
  if Pos('SYS_PARAMETROS_DEFINICION', Trim(DBGFParamPer.TablaABuscar)) > 0 then
     DBGFParamPer.CondicionBusqueda := 'NIVEL <= ' + IntToStr(REntorno.Nivel);
end;

procedure TFMConfig.DBTipoChange(Sender: TObject);
begin
  inherited;
  if DBTipo.Text = 'A' then
     EDTitTipo.Text := 'Alfanumérico'
  else
  if DBTipo.Text = 'N' then
     EDTitTipo.Text := 'Numérico'
  else
  if DBTipo.Text = 'F' then
     EDTitTipo.Text := 'Fecha'
  else
  if DBTipo.Text = 'V' then
     EDTitTipo.Text := 'Lista de Valores'
  else
     EDTitTipo.Text := '[N] Numérico [A] Alfanumérico [F] Fecha [V] Lista de valores';

  DBLongitud.Enabled := (DBTipo.Text = 'A');
  DBValores.Enabled := (DBTipo.Text = 'V');
end;

procedure TFMConfig.CBParamPerTodosClick(Sender: TObject);
begin
  inherited;
  DMConfig.FiltraParamPer(CBParamPerTodos.Checked);
end;

procedure TFMConfig.CBParamSerTodosClick(Sender: TObject);
begin
  inherited;
  DMConfig.FiltraParamSer(CBParamSerTodos.Checked);
end;

procedure TFMConfig.CBParamEmpTodosClick(Sender: TObject);
begin
  inherited;
  DMConfig.FiltraParamEmp(CBParamEmpTodos.Checked);
end;

procedure TFMConfig.CBParamUsuTodosClick(Sender: TObject);
begin
  inherited;
  DMConfig.FiltraParamUsu(CBParamUsuTodos.Checked);
end;

procedure TFMConfig.PCParametrosChange(Sender: TObject);
begin
  inherited;
  if PCParametros.ActivePage = TSParamDef then
  begin
     ControlEdit := CEParamDef;
     with G2KTLParametro do
     begin
        CondicionBusqueda := '(NIVEL <= ' + IntToStr(REntorno.Nivel) + ')';
        DataSource := DMConfig.DSQMParamDef;
        CamposADesplegar.Clear;
     end;
     with EPMain do
     begin
        if not (neBuscar in VisibleButtons) then
           VisibleButtons := VisibleButtons + [neBuscar];
        ControlEdit := CEParamDef;
     end;
  end
  else
  if PCParametros.ActivePage = TSParamGen then
  begin
     ControlEdit := CEParamGen;
     with G2KTLParametro do
     begin
        CondicionBusqueda := '(TIPO = ''000'') AND (NIVEL <= ' + IntToStr(REntorno.Nivel) + ')';
        DataSource := DMConfig.DSQMParamGen;
        CamposADesplegar.Clear;
     end;
     with EPMain do
     begin
        if not (neBuscar in VisibleButtons) then
           VisibleButtons := VisibleButtons + [neBuscar];
        ControlEdit := CEParamGen;
     end;
  end
  else
  if PCParametros.ActivePage = TSParamEmp then
  begin
     ControlEdit := CEParamEmp;
     with EPMain do
     begin
        if (neBuscar in VisibleButtons) then
           VisibleButtons := VisibleButtons - [neBuscar];
        ControlEdit := CEParamEmp;
     end;
  end
  else
  if PCParametros.ActivePage = TSParamPer then
  begin
     ControlEdit := CEParamPer;
     with EPMain do
     begin
        if (neBuscar in VisibleButtons) then
           VisibleButtons := VisibleButtons - [neBuscar];
        ControlEdit := CEParamPer;
     end;
  end
  else
  if PCParametros.ActivePage = TSParamSer then
  begin
     ControlEdit := CEParamSer;
     with EPMain do
     begin
        if (neBuscar in VisibleButtons) then
           VisibleButtons := VisibleButtons - [neBuscar];
        ControlEdit := CEParamSer;
     end;
  end;
end;

procedure TFMConfig.DBGFParamGenRowChange(Sender: TObject);
begin
  inherited;
  DMConfig.RellenaDetalle(MParamGenAyuda.Lines, DMConfig.QMParamGenPARAMETRO.AsString);
end;

procedure TFMConfig.DBGFParamEmpRowChange(Sender: TObject);
begin
  inherited;
  DMConfig.RellenaDetalle(MParamEmpAyuda.Lines, DMConfig.QMParamEmpPARAMETRO.AsString);
end;

procedure TFMConfig.DBGFParamSerRowChange(Sender: TObject);
begin
  inherited;
  DMConfig.RellenaDetalle(MParamSerAyuda.Lines, DMConfig.QMParamSerPARAMETRO.AsString);
end;

procedure TFMConfig.DBGFParamPerRowChange(Sender: TObject);
begin
  inherited;
  DMConfig.RellenaDetalle(MParamPerAyuda.Lines, DMConfig.QMParamPerPARAMETRO.AsString);
end;

procedure TFMConfig.DBGFParamUsuRowChange(Sender: TObject);
begin
  inherited;
  DMConfig.RellenaDetalle(MParamUsuAyuda.Lines, DMConfig.QMParamUsuPARAMETRO.AsString);
end;

procedure TFMConfig.DBGFParamGenExiste(Sender: TObject);
begin
  inherited;
  DMConfig.RellenaDetalle(MParamGenAyuda.Lines, DMConfig.QMParamGenPARAMETRO.AsString);
end;

procedure TFMConfig.DBGFParamEmpExiste(Sender: TObject);
begin
  inherited;
  DMConfig.RellenaDetalle(MParamEmpAyuda.Lines, DMConfig.QMParamEmpPARAMETRO.AsString);
end;

procedure TFMConfig.DBGFParamSerExiste(Sender: TObject);
begin
  inherited;
  DMConfig.RellenaDetalle(MParamSerAyuda.Lines, DMConfig.QMParamSerPARAMETRO.AsString);
end;

procedure TFMConfig.DBGFParamPerExiste(Sender: TObject);
begin
  inherited;
  DMConfig.RellenaDetalle(MParamPerAyuda.Lines, DMConfig.QMParamPerPARAMETRO.AsString);
end;

procedure TFMConfig.DBGFParamUsuExiste(Sender: TObject);
begin
  inherited;
  DMConfig.RellenaDetalle(MParamUsuAyuda.Lines, DMConfig.QMParamUsuPARAMETRO.AsString);
end;

procedure TFMConfig.TBCreaParametroGeneralClick(Sender: TObject);
begin
  inherited;
  PCParametros.ActivePage := TSParamGen;
  with DMConfig.QMParamGen do
  begin
     Last;
     Insert;
     FieldByName('PARAMETRO').AsString := DMConfig.QMParamDefPARAMETRO.AsString;
     DBGFParamGen.SetFocus;
     DBGFParamGen.SelectedIndex := EncuentraField(DBGFParamGen, 'VALOR');
  end;
end;

procedure TFMConfig.TBTBCreaParametroEmpresaClick(Sender: TObject);
begin
  inherited;
  PCParametros.ActivePage := TSParamEmp;
  with DMConfig.QMParamEmp do
  begin
     Last;
     Insert;
     FieldByName('PARAMETRO').AsString := DMConfig.QMParamDefPARAMETRO.AsString;
     FieldByName('EMPRESA').AsInteger := REntorno.Empresa;
     DBGFParamEmp.SetFocus;
     DBGFParamEmp.SelectedIndex := EncuentraField(DBGFParamEmp, 'VALOR');
  end;
end;

procedure TFMConfig.TBCreaParametroEmpresaSerieClick(Sender: TObject);
begin
  inherited;
  PCParametros.ActivePage := TSParamSer;
  with DMConfig.QMParamSer do
  begin
     Last;
     Insert;
     FieldByName('PARAMETRO').AsString := DMConfig.QMParamDefPARAMETRO.AsString;
     FieldByName('EMPRESA').AsInteger := REntorno.Empresa;
     DBGFParamSer.SetFocus;
     DBGFParamSer.SelectedIndex := EncuentraField(DBGFParamSer, 'SERIE');
  end;
end;

procedure TFMConfig.TBCreaParametroPerfilClick(Sender: TObject);
begin
  inherited;
  PCParametros.ActivePage := TSParamPer;
  with DMConfig.QMParamPer do
  begin
     Last;
     Insert;
     FieldByName('PARAMETRO').AsString := DMConfig.QMParamDefPARAMETRO.AsString;
     DBGFParamPer.SetFocus;
     DBGFParamPer.SelectedIndex := EncuentraField(DBGFParamPer, 'PERFIL');
  end;
end;

procedure TFMConfig.TBCreaParametroUsuarioClick(Sender: TObject);
begin
  inherited;
  PCParametros.ActivePage := TSParamUsu;
  with DMConfig.QMParamUsu do
  begin
     Last;
     Insert;
     FieldByName('PARAMETRO').AsString := DMConfig.QMParamDefPARAMETRO.AsString;
     DBGFParamUsu.SetFocus;
     DBGFParamUsu.SelectedIndex := EncuentraField(DBGFParamUsu, 'USUARIO');
  end;
end;

procedure TFMConfig.TBGrabarConfUsuariosConcurrentesClick(Sender: TObject);
begin
  inherited;

  EUsuariosConcurrentes.Text := IntToStr(StrToIntDef(EUsuariosConcurrentes.Text, 0));

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE SYS_CONSTANTES ');
        SQL.Add(' SET ');
        SQL.Add(' ACCESOS = :ACCESOS ');
        Params.ByName['ACCESOS'].AsInteger := StrToIntDef(EUsuariosConcurrentes.Text, 0);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TFMConfig.TBLeerConfUsuariosConcurrentesClick(Sender: TObject);
begin
  inherited;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ACCESOS FROM SYS_CONSTANTES ');
        ExecQuery;
        EUsuariosConcurrentes.Text := IntToStr(FieldByName['ACCESOS'].AsInteger);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TFMConfig.TSUsuariosConcurrentesShow(Sender: TObject);
begin
  inherited;
  TBLeerConfUsuariosConcurrentes.Click;
  TBRefrescarUsuariosConcurrentes.Click;
end;

procedure TFMConfig.TBRefrescarUsuariosConcurrentesClick(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT MON$REMOTE_ADDRESS, CAST(MON$TIMESTAMP AS DATE) MON$TIMESTAMP, MON$USER, MON$ROLE, MON$REMOTE_PROCESS ');
           SelectSQL.Add(' FROM MON$ATTACHMENTS ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' MON$SYSTEM_FLAG = 0 ');
           SelectSQL.Add(' ORDER BY MON$TIMESTAMP ');
           Open;

           MUsuariosConcurrentes.Clear;
           i := 0;
           while not EOF do
           begin
              Inc(i);
              MUsuariosConcurrentes.Lines.Add(Format(_('%.3d - Direccion: %21s, Conexion: %21s, Proceso: %s'), [i, FieldByName('MON$REMOTE_ADDRESS').AsString, DateTimeToStr(FieldByName('MON$TIMESTAMP').AsDateTime), FieldByName('MON$REMOTE_PROCESS').AsString]));
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure TFMConfig.TButtLeerConfImagenesClick(Sender: TObject);
begin
  inherited;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT BASE_IMAGENES, USUARIO_BASE_IMAGENES, CLAVE_BASE_IMAGENES, ROL_BASE_IMAGENES, CHARSET_BASE_IMAGENES, RUTA_IMAGENES FROM SYS_CONSTANTES ');
        ExecQuery;
        EBaseDatosImagenes.Text := FieldByName['BASE_IMAGENES'].AsString;
        EUsuarioBDImagenes.Text := FieldByName['USUARIO_BASE_IMAGENES'].AsString;
        EClaveBDImagenes.Text := FieldByName['CLAVE_BASE_IMAGENES'].AsString;
        ERolBDImagenes.Text := FieldByName['ROL_BASE_IMAGENES'].AsString;
        ECharsetBDImagenes.Text := FieldByName['CHARSET_BASE_IMAGENES'].AsString;
        // ERutaFicheros.Text := FieldByName['RUTA_IMAGENES'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  {
  if (Trim(ERutaFicheros.Text) > '') then
     ERutaFicheros.Text := IncludeTrailingPathDelimiter(Trim(ERutaFicheros.Text));
  }
end;

procedure TFMConfig.TButtGrabarConfImagenesClick(Sender: TObject);
begin
  inherited;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE SYS_CONSTANTES ');
        SQL.Add(' SET ');
        SQL.Add(' BASE_IMAGENES = :BASE_IMAGENES, ');
        SQL.Add(' USUARIO_BASE_IMAGENES = :USUARIO_BASE_IMAGENES, ');
        SQL.Add(' CLAVE_BASE_IMAGENES = :CLAVE_BASE_IMAGENES, ');
        SQL.Add(' ROL_BASE_IMAGENES = :ROL_BASE_IMAGENES, ');
        SQL.Add(' RUTA_IMAGENES = :RUTA_IMAGENES, ');
        SQL.Add(' CHARSET_BASE_IMAGENES = :CHARSET_BASE_IMAGENES ');
        Params.ByName['BASE_IMAGENES'].AsString := EBaseDatosImagenes.Text;
        Params.ByName['USUARIO_BASE_IMAGENES'].AsString := EUsuarioBDImagenes.Text;
        Params.ByName['CLAVE_BASE_IMAGENES'].AsString := EClaveBDImagenes.Text;
        Params.ByName['ROL_BASE_IMAGENES'].AsString := ERolBDImagenes.Text;
        Params.ByName['CHARSET_BASE_IMAGENES'].AsString := ECharsetBDImagenes.Text;
        // Params.ByName['RUTA_IMAGENES'].AsString := ERutaFicherosImagenes.Text;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Guardo en el entorno
  REntorno.BaseDeDatosImagenes := EBaseDatosImagenes.Text;
  REntorno.UsuarioBDImagenes := EUsuarioBDImagenes.Text;
  REntorno.ClaveBDImagenes := EClaveBDImagenes.Text;
  REntorno.RolBDImagenes := ERolBDImagenes.Text;
  {
  if (Trim(ERutaFicherosImagenes.Text) > '') then
     ERutaFicherosImagenes.Text := IncludeTrailingPathDelimiter(Trim(ERutaFicherosImagenes.Text));
  REntorno.RutaFicherosImagenes := ERutaFicherosImagenes.Text;
  }

  DMMain.DesConectaImagenes;
  DMMain.ConectaImagenes;
end;

procedure TFMConfig.BTraspasaImagenesACarpetaCompartidaClick(Sender: TObject);
begin
  inherited;
  // Esta opcion no se utilizara hasta nuevo aviso...
end;

procedure TFMConfig.BTraspasaImagenesABaseSeparadaClick(Sender: TObject);
begin
  inherited;
  DMConfig.TraspasaImagenes(2);
end;

procedure TFMConfig.BTraspasaImagenesABaseClick(Sender: TObject);
begin
  inherited;
  DMConfig.TraspasaImagenes(1);
end;

procedure TFMConfig.ERutaLibrosChange(Sender: TObject);
begin
  inherited;
  EscribeDatoIni('Datos', 'RutaLibros', ERutaLibros.Text);
  REntorno.RutaLibros := LeeDatoIni('Datos', 'RutaLibros', IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, True)));
end;

procedure TFMConfig.EDirectorioEDIEntradaChange(Sender: TObject);
begin
  inherited;
  EscribeDatoIni('Datos', 'DirectorioEDI_Entrada', EDirectorioEDIEntrada.Text);
  REntorno.DirectorioEDI_Entrada := LeeDatoIni('Datos', 'DirectorioEDI_Entrada', IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, True)));
end;

procedure TFMConfig.EDirectorioEDISalidaChange(Sender: TObject);
begin
  inherited;
  EscribeDatoIni('Datos', 'DirectorioEDI_Salida', EDirectorioEDISalida.Text);
  REntorno.DirectorioEDI_Salida := LeeDatoIni('Datos', 'DirectorioEDI_Salida', IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, True)));
end;

procedure TFMConfig.EDirectorioAutofirmaChange(Sender: TObject);
begin
  inherited;
  EscribeDatoIni('AutoFirma', 'InstallDir', EDirectorioAutofirma.Text);
  REntorno.DirectorioAutofirma := LeeDatoIni('AutoFirma', 'InstallDir', '');
end;

procedure TFMConfig.EVersionAutofirmaChange(Sender: TObject);
begin
  inherited;
  EscribeDatoIni('AutoFirma', 'Version', EVersionAutofirma.Text);
  REntorno.VersionAutofirma := LeeDatoIni('AutoFirma', 'Version', '');
end;

procedure TFMConfig.EDirectorio7ZipChange(Sender: TObject);
begin
  inherited;
  EscribeDatoIni('7Zip', 'Carpeta', EDirectorio7Zip.Text);
  REntorno.Directorio7Zip := LeeDatoIni('7Zip', 'Carpeta', '');
end;

procedure TFMConfig.EDirectorioCurlChange(Sender: TObject);
begin
  inherited;
  EscribeDatoIni('Curl', 'Carpeta', EDirectorioCurl.Text);
  REntorno.DirectorioCurl := LeeDatoIni('Curl', 'Carpeta', '');
end;

procedure TFMConfig.EDirectorioLectorChange(Sender: TObject);
begin
  inherited;
  EscribeDatoIni('Datos', 'DirectorioLector', EDirectorioLector.Text);
  REntorno.DirectorioLector := LeeDatoIni('Datos', 'DirectorioLector', IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, True)));
end;

procedure TFMConfig.EDirectorioSumatraPDFChange(Sender: TObject);
begin
  inherited;
  EscribeDatoIni('SumatraPDF', 'Carpeta', EDirectorioSumatraPDF.Text);
  REntorno.DirectorioSumatraPDF := LeeDatoIni('SumatraPDF', 'Carpeta', '');
end;

end.
