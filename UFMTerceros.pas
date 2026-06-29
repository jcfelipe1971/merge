unit UFMTerceros;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Grids, DBGrids, UHYDBGrid, Mask, Buttons, ExtCtrls,
  ComCtrls, UEditPanel, UNavigator, ToolWin, Menus, UControlEdit,
  UFIBDBEditfind, UTeclas, Spin, UDBSpin, DB, DBTables, FIBEditFind,
  UComponentesBusquedaFiltrada, IOFFind, UFPEdit, UHYEdits, rxPlacemnt,
  NsDBGrid, ActnList, ULFDBMemo, ULFDBCheckBox, ULFPageControl,
  ULFDBEditFind2000, ULFDBEdit, ULFFormStorage, ULFActionList, ULFToolBar,
  ULFPanel, DBActns, TFlatCheckBoxUnit, ULFCheckBox, TFlatButtonUnit,
  ULFLabel, UG2kTBLoc, URecursos, ULFEdit, ULFEditFind2000, FIBDataSet, FIBDatabase, HYFIBQuery,
  UHYDescription, ULFHYDBDescription, ShellApi, rxToolEdit, RXDBCtrl,
  ULFDBDateEdit, ULFMemo, OleCtrls, SHDocVw, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, UrlMon, ULFFIBDBEditFind, RxLookup;

type
  TFMTerceros = class(TFPEdit)
     TBInfo: TLFToolBar;
     P_I_Info: TLFPanel;
     LNotasTercero: TLFLabel;
     DBE_I_cod: TLFDbedit;
     DBE_I_Nom: TLFDbedit;
     NavInfo: THYMNavigator;
     PEditInfo: TLFPanel;
     DBMINfo: TLFDBMemo;
     TSNotas: TTabSheet;
     TSDireccion: TTabSheet;
     TSContactos: TTabSheet;
     P_Info_con: TLFPanel;
     LContactoTercero: TLFLabel;
     DBE_C_InfoCod: TLFDbedit;
     PCContactos: TLFPageControl;
     TSCo_Ficha: TTabSheet;
     PEditContactos: TLFPanel;
     LContactoNombre: TLFLabel;
     LContactoApellidos: TLFLabel;
     LContactoTelefono: TLFLabel;
     LContactoFAX: TLFLabel;
     LContactoExtension: TLFLabel;
     LContactoEmail: TLFLabel;
     LContactoContacto: TLFLabel;
     DBE_C_Nombre: TLFDbedit;
     DBE_C_Apellidos: TLFDbedit;
     DBE_C_Telefono: TLFDbedit;
     DBE_C_TeleFax: TLFDbedit;
     DBE_C_Extension: TLFDbedit;
     DBE_C_Email: TLFDbedit;
     DBM_Co_Notas: TLFDBMemo;
     DBE_C_Contacto: TLFDbedit;
     TSCo_Tabla: TTabSheet;
     DBG_Contactos: THYTDBGrid;
     TB_B_Main: TLFToolBar;
     NavCuentas: THYMNavigator;
     PCCuentas: TLFPageControl;
     TSCu_Ficha: TTabSheet;
     PEditCuentas: TLFPanel;
     LBancoCuenta: TLFLabel;
     LBancoBanco: TLFLabel;
     LBancoEntidad: TLFLabel;
     LBancoOrden: TLFLabel;
     DBE_B_Titulo: TLFDbedit;
     DBE_B_Sucursal: TLFDbedit;
     DBE_B_Cuenta: TLFDbedit;
     DBM_B_Notas: TLFDBMemo;
     DBE_B_TitEntidad: TLFDbedit;
     DBEFEntidad: TLFDBEditFind2000;
     DBE_B_Banco: TLFDbedit;
     DBE_B_DigCont: TLFDbedit;
     DBCBActiva: TLFDBCheckBox;
     DBRG_B_Uso: TDBRadioGroup;
     DBSE_B_Orden: TDBSpinEdit;
     TSCu_Tabla: TTabSheet;
     DBG_Cuentas: THYTDBGrid;
     PInfoCuentas: TLFPanel;
     LBancoTercero: TLFLabel;
     DBE_CB_InfoCod: TLFDbedit;
     DBE_CB_InfoTit: TLFDbedit;
     TB_C_Main: TLFToolBar;
     NavContactos: THYMNavigator;
     TBDirecciones: TLFToolBar;
     NavDirecciones: THYMNavigator;
     CEDirecciones: TControlEdit;
     CEContactos: TControlEdit;
     CECuentas: TControlEdit;
     CEInfo: TControlEdit;
     CEInfoPMEdit: TPopUpTeclas;
     CEInfoMifirst: TMenuItem;
     CEInfoMiprior: TMenuItem;
     CEInfoMinext: TMenuItem;
     CEInfoMilast: TMenuItem;
     CEInfoMiinsert: TMenuItem;
     CEInfoMidelete: TMenuItem;
     CEInfoMiedit: TMenuItem;
     CEInfoMipost: TMenuItem;
     CEInfoMicancel: TMenuItem;
     CEInfoMirefresh: TMenuItem;
     PEditDirecciones: TLFPanel;
     Lbl_Num: TLFLabel;
     Lbl_Blq: TLFLabel;
     Lbl_Piso: TLFLabel;
     DBE_D_Calle: TLFDbedit;
     DBE_D_Num: TLFDbedit;
     DBE_D_BloqEsc: TLFDbedit;
     DBE_D_Piso: TLFDbedit;
     DBE_D_Direccion: TLFDbedit;
     LTercero: TLFLabel;
     LNombre: TLFLabel;
     DBETercero: TLFDbedit;
     DBENombre: TLFDbedit;
     DBECif: TLFDbedit;
     DBE_TitRazones: TLFDbedit;
     TSDi_Ficha: TTabSheet;
     TSDi_Tabla: TTabSheet;
     DBG_Direcciones: THYTDBGrid;
     CEContactosPMEdit: TPopUpTeclas;
     CEDireccionesPMEdit: TPopUpTeclas;
     CECuentasPMEdit: TPopUpTeclas;
     DBE_C_Movil: TLFDbedit;
     LContactoMovil: TLFLabel;
     DBE_D_Tipo: TLFDBEditFind2000;
     DBT_TipDir_D: TDBText;
     PCDirecciones: TLFPageControl;
     TSCuentas: TTabSheet;
     DBE_D_Puerta: TLFDbedit;
     Puertas: TLFLabel;
     DBENombreComercial: TLFDbedit;
     LNombreComercial: TLFLabel;
     DBE_D_Direccion2: TLFDbedit;
     LBancoTitular: TLFLabel;
     DBETipoRazon: TLFDBEditFind2000;
     LBLRazonSocial: TLFLabel;
     LDireccionesTelefonos: TLFLabel;
     DBETel01: TLFDbedit;
     DBETel02: TLFDbedit;
     DBEFax: TLFDbedit;
     DBEFClaseDireccion: TLFDBEditFind2000;
     LClaseDireccion: TLFLabel;
     TSImagenes: TTabSheet;
     TBImagenes: TLFToolBar;
     PInfoImagenes: TLFPanel;
     LImagenesTercero: TLFLabel;
     DBE_I_InfoCod: TLFDbedit;
     DBE_I_InfoTit: TLFDbedit;
     PEditImagenes: TLFPanel;
     ScrBImagen: TScrollBox;
     Imagen: TImage;
     LBLImagen: TLFLabel;
     DBEFImagen: TLFDBEditFind2000;
     ETituloImagen: TLFEdit;
     NavImagenes: THYMNavigator;
     CEImagenes: TControlEdit;
     CEImagenesPMEdit: TPopUpTeclas;
     ToolButton1: TToolButton;
     DBNotasDireccionKri: TLFDBMemo;
     LNotasDireccion: TLFLabel;
     LDireccionesEAN13: TLFLabel;
     DBECodigoEdiDireccion: TLFDBEdit;
     DBCBDefecto: TLFDBCheckBox;
     ToolButton2: TToolButton;
     AVisualizarListado: TAction;
     AImprimirListado: TAction;
     AListConfig: TAction;
     LFCategoryAction1: TLFCategoryAction;
     ADirDefecto: TLFDatasetAction;
     AResDirDefecto: TLFDatasetAction;
     LFCategoryAction2: TLFCategoryAction;
     ASep: TAction;
     AAcreedor: TAction;
     AProveedor: TAction;
     AAgente: TAction;
     LFCategoryAction3: TLFCategoryAction;
     ACliente: TAction;
     TSMails: TTabSheet;
     DBGMail: TNsDBGrid;
     LFLAgenteKri: TLFLabel;
     LFDBEAgenteKri: TLFDBEditFind2000;
     LFEAgente: TLFEdit;
     LContactoZona: TLFLabel;
     LFDBEZona: TLFDbedit;
     LBancoIBAN: TLFLabel;
     LBancoBIC: TLFLabel;
     DBEBIC: TLFDbedit;
     DBEIBAN: TLFDbedit;
     LNombreCom_Soc: TLFLabel;
     EFTercero: TLFEditFind2000;
     AVerificaNIF: TAction;
     LContactoDireccion: TLFLabel;
     DBEFDireccion: TLFDBEditFind2000;
     EDireccion: TLFEdit;
     LFiltraDireccionKri: TLFLabel;
     EFDireccionTerceroKri: TLFEditFind2000;
     ToolButton4: TToolButton;
     SBFiltraContactos: TSpeedButton;
     EFContactoKri: TLFEditFind2000;
     LFiltraContactoKri: TLFLabel;
     SBIncidenciasKri: TSpeedButton;
     LFCategoryAction4: TLFCategoryAction;
     AAdjuntosTercero: TAction;
     LContactoPadre: TLFLabel;
     EContactoPadre: TLFEdit;
     DBEFContactoPadre: TLFDBEditFind2000;
     TSCo_Jerarquia: TTabSheet;
     TVContactos: TTreeView;
     ETituloDepartamento: TLFEdit;
     LDepartamento: TLFLabel;
     DBEDepartamento: TLFDBEditFind2000;
     LTransportista: TLFLabel;
     DBEFTransportistaDir: TLFDBEditFind2000;
     ETransportistaDirTitulo: TLFEdit;
     LDireccionesColonia: TLFLabel;
     DBEDireccionesColonia: TLFDbedit;
     SBAWeb: TSpeedButton;
     SBAEmail: TSpeedButton;
     SABContactosEmail: TSpeedButton;
     SBADireccion: TSpeedButton;
     SBADireccion2: TSpeedButton;
     ToolButton5: TToolButton;
     TButtImprimirNotas: TToolButton;
     AImprimirNotas: TAction;
     LFirmaSEPA: TLFLabel;
     LFechaFirmaSEPA: TLFLabel;
     DBEFirmaSEPA: TLFDbedit;
     DBDEFechaFirmaSEPA: TLFDBDateEdit;
     DBRGTipoAdeudo: TDBRadioGroup;
     AImprimirCartaSEPA: TAction;
     AVisualizarCartaSEPA: TAction;
     AListConfigCartaSEPA: TAction;
     ACreaTercerosRandom: TAction;
     AReemplazaCarateres: TAction;
     DBRGTipoContrato: TDBRadioGroup;
     LFCategoryAction5: TLFCategoryAction;
     LFCategoryAction6: TLFCategoryAction;
     AEnviarEmailCartaSEPA: TAction;
     ACalculaIBAN: TAction;
     BCargarImagen: TButton;
     ARenombraTercerosRandom: TAction;
     DBCBDirActiva: TLFDBCheckBox;
     LIdForceManager: TLFLabel;
     DBEIdForceManager: TLFDbedit;
     LIdForceManagerDrieccion: TLFLabel;
     DBEIdForceManagerDrieccion: TLFDbedit;
     GBEmailVentas: TGroupBox;
     DBCBEmailOfeCli: TLFDBCheckBox;
     DBCBEmailPedCli: TLFDBCheckBox;
     DBCBEmailAlbCli: TLFDBCheckBox;
     DBCBEmailFacCli: TLFDBCheckBox;
     GBEmailCompras: TGroupBox;
     DBCBEmailPedProv: TLFDBCheckBox;
     DBCBEmailAlbProv: TLFDBCheckBox;
     DBCBEmailFacProv: TLFDBCheckBox;
     DBCBEmailPropProv: TLFDBCheckBox;
     DBCBEmailPropConf: TLFDBCheckBox;
     DBCBEmailFacAcr: TLFDBCheckBox;
     EClaseDireccion: TLFEdit;
     LFCategoryAction7: TLFCategoryAction;
     AImprimirCartaLOPD: TAction;
     AVisualizarCartaLOPD: TAction;
     AEnviarEmailCartaLOPD: TAction;
     AListConfigCartaLOPD: TAction;
     AEnviarEmailCartaLOPD2: TAction;
     AEnviarEmailCartaSEPA2: TAction;
     PNLBusqueda: TLFPanel;
     LContactos: TLFLabel;
     ETituloPaisTercero: TLFEdit;
     LPaisTercero: TLFLabel;
     LTipoDocumento: TLFLabel;
     ETipoDocumentoTitulo: TLFEdit;
     DBETipoDocumento: TLFDBEditFind2000;
     DBEPaisTercero: TLFDBEditFind2000;
     GBDireccion: TGroupBox;
     LPaisDireccion: TLFLabel;
     ETituloPaisDireccion: TLFEdit;
     DBEPaisDireccion: TLFDBEditFind2000;
     LNumero: TLFLabel;
     LBLoqueEscalera: TLFLabel;
     LPiso: TLFLabel;
     DBT_TipDir_T: TDBText;
     LPuerta: TLFLabel;
     DBEDirNombre: TLFDbedit;
     DBEDirBloqEsc: TLFDbedit;
     DBEDirPiso: TLFDbedit;
     DBEDirNumero: TLFDbedit;
     DBETipoDir: TLFDBEditFind2000;
     DBEDirPuerta: TLFDbedit;
     DBENombreDireccion: TLFDbedit;
     GBOtros: TGroupBox;
     LFechaValidezCarnet: TLFLabel;
     DBCBCLientePotencialKRI: TLFDBCheckBox;
     DBDTPFechaValidezCarnet: TLFDBDateEdit;
     LCarnetAplicador: TLFLabel;
     LRegistroMercantil: TLFLabel;
     DBECarnetAplicador: TLFDbedit;
     DBERegistroMercantil: TLFDbedit;
     APedirFirma: TAction;
     ABorrarFirma: TAction;
     BClipboard: TButton;
     DBEWeb: TLFDbedit;
     DBEEmail: TLFDbedit;
     LEmail: TLFLabel;
     LWeb: TLFLabel;
     DBEInfoAlta: TLFDbedit;
     LFechaAlta: TLFLabel;
     LDirClase: TLFLabel;
     DBEDirClase: TLFDBEditFind2000;
     EDirClaseTitulo: TLFEdit;
     DBETelefax: TLFDbedit;
     DBETelefono2: TLFDbedit;
     DBETelefono1: TLFDbedit;
     LTelefonos: TLFLabel;
     LFechaNacimiento: TLFLabel;
     DBEFechaNacimiento: TLFDBDateEdit;
     DBEDireccionPais: TLFDBEditFind2000;
     EDireccionPais: TLFEdit;
     LDireccionPais: TLFLabel;
     EDIRNombre2: TLFDbedit;
     BAbreProveedor: TBitBtn;
     BAbreAcreedor: TBitBtn;
     BAbreAgente: TBitBtn;
     TSepProveedor: TToolButton;
     TSepAcreedor: TToolButton;
     TSepAgente: TToolButton;
     TSepCRM: TToolButton;
     BAbreEmpleado: TBitBtn;
     TSepEmpleado: TToolButton;
     BAbreCRM: TBitBtn;
     AEmpleado: TAction;
     ACRM: TAction;
     DBMDireccion: TLFDBMemo;
     TSepLocalizacion: TToolButton;
     DBDireccionDireccionLiteral: TLFDBMemo;
     ABuscaDatosDireccion: TAction;
     LDireccion2: TLFLabel;
     LTransportistaTercero: TLFLabel;
     DBEFTransportistaFicha: TLFDBEditFind2000;
     ETransportistaFichaTitulo: TLFEdit;
     DBMNotasTercero: TLFDBMemo;
     LNotas: TLFLabel;
     DBEEAN13: TLFDbedit;
     LEAN13: TLFLabel;
     DBE_U_InfoCod: TLFDbedit;
     LDireccionesTercero: TLFLabel;
     DBDirPais: TLFDbedit;
     EDirTituloPais: TLFEdit;
     DBEDirEmail: TLFDbedit;
     DBEDirWeb: TLFDbedit;
     LDirNComercial: TLFLabel;
     LDirRSocial: TLFLabel;
     LDirPais: TLFLabel;
     LDirEmail: TLFLabel;
     LDirWeb: TLFLabel;
     DBEDirNombreComercial: TLFDbedit;
     DBEDirRazonSocail: TLFDbedit;
     LDirDireccion2: TLFLabel;
     DBGContactos: THYTDBGrid;
     LDireccionContactos: TLFLabel;
     DBDireccionContactos: THYTDBGrid;
     PLocalizacion: TLFPanel;
     LTituloSinMapa: TLabel;
     LTerNComercial: TLabel;
     LContRSocial: TLabel;
     LContPais: TLabel;
     LContEmail: TLabel;
     LContWeb: TLabel;
     DBEContNombreComercial: TLFDbedit;
     DBEContRazonSocail: TLFDbedit;
     DBContPais: TLFDbedit;
     DBEContEmail: TLFFibDBEditFind;
     DBEContWeb: TLFFibDBEditFind;
     EContTituloPais: TLFEdit;
     LContNotas: TLFLabel;
     PnlDireccionLocalizacion: TLFPanel;
     LTituloDireccionSinMapa: TLFLabel;
     BAbreCliente: TBitBtn;
     DBEFBancoDireccion: TLFDBEditFind2000;
     EBancoDireccion: TLFEdit;
     LBancoDireccion: TLFLabel;
     PnlDireccion: TLFPanel;
     LColonia: TLFLabel;
     DBEColonia: TLFDbedit;
     PnlDireccion2: TLFPanel;
     LPoblacion: TLFLabel;
     LRegion: TLFLabel;
     LCodigoPostal: TLFLabel;
     LProvinciaDireccion: TLFLabel;
     ETituloPoblacion: TLFEdit;
     DBERegion: TLFDBEditFind2000;
     ETituloRegion: TLFEdit;
     ETituloCodigoPostal: TLFEdit;
     EFPoblacion: TLFDBEditFind2000;
     EFCodigoPostal: TLFDBEditFind2000;
     ETituloProvinciaTercero: TLFEdit;
     DBEProvinciaDireccion: TLFDBEditFind2000;
     LLocalidad: TLFLabel;
     LProvincia: TLFLabel;
     EFLocalidad: TLFDBEditFind2000;
     DBELocalidadNombre: TLFDbedit;
     DBECpostal: TLFDbedit;
     DBEProvincia: TLFDbedit;
     DBEPais: TLFDbedit;
     PnlDirDireccion2: TPanel;
     LDireccionesProvincia: TLFLabel;
     LDireccionRegion: TLFLabel;
     LDireccionPoblacion: TLFLabel;
     LDireccionCodigoPostal: TLFLabel;
     DBEDireccionRegion: TLFDBEditFind2000;
     DBEDireccionProvincia: TLFDBEditFind2000;
     EDireccionRegion: TLFEdit;
     EDireccionProvincia: TLFEdit;
     DBEDireccionPoblacion: TLFDBEditFind2000;
     DBEDireccionCodigoPostal: TLFDBEditFind2000;
     EDireccionPoblacion: TLFEdit;
     EDireccionCodigoPostal: TLFEdit;
     PnlDirDireccion: TPanel;
     DBE_D_CodLocalidad: TLFDBEditFind2000;
     DBE_D_TituloLocalidad: TLFDbedit;
     DBE_D_CPLocalidad: TLFDbedit;
     DBE_D_Provincia: TLFDbedit;
     DBE_D_Pais: TLFDbedit;
     LDirDireccionesLocalidad: TLFLabel;
     LDirDireccionesProvincia: TLFLabel;
     SBNuevaLocalidadFicha: TSpeedButton;
     SBNuevaLocalidadDireccion: TSpeedButton;
     TButtTransportistaSegunCP: TButton;
     TBNet2Phone: TToolButton;
     PMNet2Phone: TPopupMenu;
     LIdUsuarioWeb: TLFLabel;
     DBEIdUsuarioWeb: TLFDbedit;
     TBSep1: TToolButton;
     TBCreaUsuarioWeb: TToolButton;
     EDIRNombre3: TLFDbedit;
     LDireccion3: TLFLabel;
     DBE_D_Direccion3: TLFDbedit;
     LDirDireccion3: TLFLabel;
     LDirNumeroDireccion: TLFLabel;
     LNumeroDireccion: TLFLabel;
     TMRReferescoMapa: TTimer;
     PNLDatosTercero: TLFPanel;
     DBEHorario: TLFDbedit;
     LHorario: TLFLabel;
     LMedios: TLFLabel;
     DBEMedios: TLFDbedit;
     LDirCorreo: TLFLabel;
     LDirContacto: TLFLabel;
     DBEDirCorreo: TLFDbedit;
     DBEDirContacto: TLFDbedit;
     TBSepEmpresasChile: TToolButton;
     TBEmpresasChile: TToolButton;
     AEmpresasChile: TAction;
     CBVerMapa: TLFCheckBox;
     AActualizaCasillaDteDesdeCsv: TAction;
     LTipoCuenta: TLFLabel;
     DBEFTipoCuenta: TLFDBEditFind2000;
     EDescripcionTipoCuenta: TLFEdit;
     LPaisBanco: TLFLabel;
     DBEFPaisBanco: TLFDBEditFind2000;
     EPaisBanco: TLFEdit;
     LDBLCComoNosConocieron: TLFLabel;
     DBLCComoNosConocieron: TRxDBLookupCombo;
     BObtenerBIC: TButton;
     ImgMapaFicha: TImage;
     ImgMapaDireccion: TImage;
     LValidacionDocumento: TLFLabel;
     DBTValidacionResultado: TDBText;
     DBTValidacionNombre: TDBText;
     DBTValidacionFechaCombrobacion: TDBText;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure Btn_C_SalirClick(Sender: TObject);
     procedure TSDireccionesShow(Sender: TObject);
     procedure TSContactosShow(Sender: TObject);
     procedure TSNotasShow(Sender: TObject);
     procedure DBEFEntidadChange(Sender: TObject);
     procedure DBENombreExit(Sender: TObject);
     procedure TSCuentasShow(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TSCu_TablaShow(Sender: TObject);
     procedure MuestraFiltrado(tipo: byte);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure TSFichaShow(Sender: TObject);
     procedure PCMainChanging(Sender: TObject; var AllowChange: boolean);
     procedure SBCliClick(Sender: TObject);
     procedure SBProClick(Sender: TObject);
     procedure SBAcrClick(Sender: TObject);
     procedure SBAgeClick(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure DBSE_B_OrdenChange(Sender: TObject);
     procedure EFLocalidadBusqueda(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure CierraCliente;
     procedure CierraProveedor;
     procedure CierraAcreedor;
     procedure CierraAgente;
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure NavDireccionesClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure NavContactosClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure NavCuentasClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure NavInfoClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure TSImagenesShow(Sender: TObject);
     procedure NavImagenesClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBEFImagenChange(Sender: TObject);
     procedure NavDireccionesClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure AVisualizarListadoExecute(Sender: TObject);
     procedure AImprimirListadoExecute(Sender: TObject);
     procedure AListConfigExecute(Sender: TObject);
     procedure ADirDefectoExecute(Sender: TObject);
     procedure AResDirDefectoExecute(Sender: TObject);
     procedure NavContactosBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure NavCuentasBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure NavInfoBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure AClienteExecute(Sender: TObject);
     procedure AProveedorExecute(Sender: TObject);
     procedure AAcreedorExecute(Sender: TObject);
     procedure AAgenteExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGMainColEnter(Sender: TObject);
     procedure TSMailsShow(Sender: TObject);
     procedure LFDBEAgenteKriChange(Sender: TObject);
     procedure EFTerceroChange(Sender: TObject);
     procedure LNombreCom_SocClick(Sender: TObject);
     procedure AVerificaNIFExecute(Sender: TObject);
     procedure DBECifChange(Sender: TObject);
     procedure SBPotClick(Sender: TObject);
     procedure FBHaciaClientePotencialClick(Sender: TObject);
     procedure DBEFDireccionChange(Sender: TObject);
     procedure DBEFDireccionBusqueda(Sender: TObject);
     procedure SBFiltraContactosClick(Sender: TObject);
     procedure SBIncidenciasKriClick(Sender: TObject);
     procedure EFContactoKriExiste(Sender: TObject);
     procedure EFDireccionTerceroKriExiste(Sender: TObject);
     procedure EFDireccionTerceroKriBusqueda(Sender: TObject);
     procedure EFContactoKriBusqueda(Sender: TObject);
     procedure AAdjuntosTerceroExecute(Sender: TObject);
     procedure DBEFContactoPadreBusqueda(Sender: TObject);
     procedure DBEFContactoPadreChange(Sender: TObject);
     procedure PCContactosChanging(Sender: TObject; var AllowChange: boolean);
     procedure PCContactosChange(Sender: TObject);
     procedure TVContactosDblClick(Sender: TObject);
     procedure DBEDepartamentoChange(Sender: TObject);
     procedure DBEFTransportistaDirChange(Sender: TObject);
     procedure SBCrmClick(Sender: TObject);
     procedure SBAEmailDblClick(Sender: TObject);
     procedure SBAWebDblClick(Sender: TObject);
     procedure SABContactosEmailDblClick(Sender: TObject);
     procedure AImprimirNotasExecute(Sender: TObject);
     procedure DBEIBANChange(Sender: TObject);
     procedure AImprimirCartaSEPAExecute(Sender: TObject);
     procedure AVisualizarCartaSEPAExecute(Sender: TObject);
     procedure AListConfigCartaSEPAExecute(Sender: TObject);
     procedure ACreaTercerosRandomExecute(Sender: TObject);
     procedure AReemplazaCarateresExecute(Sender: TObject);
     procedure AEnviarEmailCartaSEPAExecute(Sender: TObject);
     procedure ACalculaIBANExecute(Sender: TObject);
     procedure DBEIBANEnter(Sender: TObject);
     procedure BCargarImagenClick(Sender: TObject);
     procedure NavImagenesClick(Sender: TObject; Button: TNavigateBtn);
     procedure ARenombraTercerosRandomExecute(Sender: TObject);
     procedure DBEFClaseDireccionChange(Sender: TObject);
     procedure AImprimirCartaLOPDExecute(Sender: TObject);
     procedure AVisualizarCartaLOPDExecute(Sender: TObject);
     procedure AEnviarEmailCartaLOPDExecute(Sender: TObject);
     procedure AListConfigCartaLOPDExecute(Sender: TObject);
     procedure AEnviarEmailCartaLOPD2Execute(Sender: TObject);
     procedure AEnviarEmailCartaSEPA2Execute(Sender: TObject);
     procedure APedirFirmaExecute(Sender: TObject);
     procedure ABorrarFirmaExecute(Sender: TObject);
     procedure BClipboardClick(Sender: TObject);
     procedure DBEFBancoDireccionBusqueda(Sender: TObject);
     procedure DBEFBancoDireccionChange(Sender: TObject);
     procedure DBERegionChange(Sender: TObject);
     procedure EFCodigoPostalChange(Sender: TObject);
     procedure DBETipoDocumentoBusqueda(Sender: TObject);
     procedure DBETipoDocumentoChange(Sender: TObject);
     procedure DBEPaisTerceroChange(Sender: TObject);
     procedure DBEPaisDireccionChange(Sender: TObject);
     procedure EFPoblacionChange(Sender: TObject);
     procedure DBEProvinciaDireccionChange(Sender: TObject);
     procedure DBERegionBusqueda(Sender: TObject);
     procedure DBEProvinciaDireccionBusqueda(Sender: TObject);
     procedure EFPoblacionBusqueda(Sender: TObject);
     procedure DBEFTransportistaFichaChange(Sender: TObject);
     procedure DBEDirClaseChange(Sender: TObject);
     procedure DBEDireccionPaisChange(Sender: TObject);
     procedure DBEDireccionRegionChange(Sender: TObject);
     procedure DBEDireccionRegionBusqueda(Sender: TObject);
     procedure DBEDireccionProvinciaChange(Sender: TObject);
     procedure DBEDireccionProvinciaBusqueda(Sender: TObject);
     procedure DBEDireccionPoblacionChange(Sender: TObject);
     procedure DBEDireccionPoblacionBusqueda(Sender: TObject);
     procedure EFCodigoPostalBusqueda(Sender: TObject);
     procedure DBEDireccionCodigoPostalChange(Sender: TObject);
     procedure DBEDireccionCodigoPostalBusqueda(Sender: TObject);
     procedure ACRMExecute(Sender: TObject);
     procedure AEmpleadoExecute(Sender: TObject);
     procedure DBDirPaisChange(Sender: TObject);
     procedure DBContPaisChange(Sender: TObject);
     procedure NavDireccionesClick(Sender: TObject; Button: TNavigateBtn);
     procedure DBMDireccionChange(Sender: TObject);
     procedure DBDireccionDireccionLiteralChange(Sender: TObject);
     procedure DBECifExit(Sender: TObject);
     procedure SBNuevaLocalidadFichaClick(Sender: TObject);
     procedure SBNuevaLocalidadDireccionClick(Sender: TObject);
     procedure ANet2PhoneExecute(Sender: TObject);
     procedure TBNet2PhoneClick(Sender: TObject);
     procedure TBCreaUsuarioWebClick(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure TMRReferescoMapaTimer(Sender: TObject);
     procedure AEmpresasChileExecute(Sender: TObject);
     procedure SBADireccionDblClick(Sender: TObject);
     procedure SBADireccion2DblClick(Sender: TObject);
     procedure CBVerMapaChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure AActualizaCasillaDteDesdeCsvExecute(Sender: TObject);
     procedure DBEFTipoCuentaChange(Sender: TObject);
     procedure DBEFPaisBancoChange(Sender: TObject);
     procedure DBEFEntidadBusqueda(Sender: TObject);
     procedure BObtenerBICClick(Sender: TObject);
     procedure DBETerceroChange(Sender: TObject);
  private
     { Private declarations }
     Primera: boolean;
     MostrarEmpleado: boolean;
     PNLOcultaInfoBottom: TLFPanel;
     PNLOcultaInfoRight: TLFPanel;
     procedure Reconectar_Tablas;
     procedure CompruebaCuentaBancaria;
     procedure PosicionaElementosDireccion(Pais: string);
     procedure GeneraLocalizacion;
     procedure MostrarMapa;
     procedure ValidaDocumentoIdentificacion;
     procedure RestringirPestanya;
  public
     { Public declarations }
     procedure TraspasosActivos(activacion: integer);
     procedure PonBotones;
     procedure InsertarTercero;
     procedure FiltraTercero(Filtro: string);
     procedure PosicionaDireccion(Direccion: integer);
     procedure PosicionaContacto(Contacto: integer);
     procedure CreaArbolContactos;
  end;

var
  FMTerceros : TFMTerceros;

implementation

uses UDMMain, UFMain, UUtiles, UDameDato, UEntorno, UFormGest, UDMTerceros, UDMLstTerceros, UFMListConfig,
  UFMClientes, UDMClientes, UFMProveedores, UFMAcreedores, UFMAgentes,
  UFMClientesPotencialesKri, UFMIncidencias, UFMAdjunto, UCrmFMContactos, UParam,
  UOpeFMEmpleados, UFMCreaLocalidad, URecibeFicheros, UDMAdjunto,
  UFMUsuariosWeb, URellenaLista, UImagenes;

{$R *.DFM}

procedure TFMTerceros.FormCreate(Sender: TObject);
var
  i : integer;
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);
  MostrarEmpleado := FMain.FormularioEmpleadoHabilitado;
  PNLOcultaInfoBottom := nil;
  PNLOcultaInfoRight := nil;

  AbreData(TDMTerceros, DMTerceros);
  NavMain.DataSource := DMTerceros.DSQMTerceros;
  EPMain.DataSource := DMTerceros.DSQMTerceros;
  DBGMain.DataSource := DMTerceros.DSQMTerceros;
  G2KTableLoc.DataSource := DMTerceros.DSQMTerceros; {dji lrk kri}
  PCMain.ActivePage := TSFicha;
  Campo := DMTerceros.QMTercerosTERCERO;

  // Habilitamos elementos especificos para Chile
  if ((REntorno.Pais = 'CHL') or (REntorno.Pais = 'BOL')) then
  begin
     PnlDireccion2.Visible := True;
     PnlDireccion.Visible := False;
     PnlDirDireccion2.Visible := True;
     PnlDirDireccion.Visible := False;
     DBEPaisDireccion.Visible := True;
     LPaisDireccion.Visible := True;
     ETituloPaisDireccion.Visible := True;
     DBEDireccionPais.Visible := True;
     LDireccionPais.Visible := True;
     EDireccionPais.Visible := True;
     TBSepEmpresasChile.Visible := True;
     TBEmpresasChile.Visible := True;
     if (REntorno.Pais = 'BOL') then
     begin
        LCodigoPostal.Visible := False;
        EFCodigoPostal.Visible := False;
        ETituloCodigoPostal.Visible := False;
     end;
  end
  else
  begin
     PnlDireccion2.Visible := False;
     PnlDireccion.Visible := True;
     PnlDirDireccion2.Visible := False;
     PnlDirDireccion.Visible := True;
     DBEPaisDireccion.Visible := False;
     LPaisDireccion.Visible := False;
     ETituloPaisDireccion.Visible := False;
     DBEDireccionPais.Visible := False;
     LDireccionPais.Visible := False;
     EDireccionPais.Visible := False;
     TBSepEmpresasChile.Visible := False;
     TBEmpresasChile.Visible := False;
  end;

  if ((REntorno.Usuario <> 1) and (REntorno.Delegacion = 'S')) then // dji lrk kri
  begin
     NavMain.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
     NavInfo.VisibleButtons := [nbRefresh];
     NavDirecciones.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
     NavContactos.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
     NavCuentas.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
  end;

  // Determino si se ve el Edit de Colonia.
  // Si no se ve, debo hacerlo invisible y mover los demás Edits hacia arriba
  if (DMMain.EstadoKri(427) <> 1) then
  begin
     LColonia.Visible := False;
     DBEColonia.Visible := False;
     LDireccionesColonia.Visible := False;
     DBEDireccionesColonia.Visible := False;
  end;

  SolapaControles(SBAEmail, DBEEmail);
  DBEEmail.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBAWeb, DBEWeb);
  DBEWeb.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SABContactosEmail, DBE_C_Email);
  DBE_C_Email.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBADireccion, DBEDirNombre);
  DBEDirNombre.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBADireccion2, DBE_D_Calle);
  DBE_D_Calle.Color := REntorno.ColorEnlaceActivo;

  //TODO  SolapaControles(xxx, DBETelefono1);
  DBETelefono1.Color := REntorno.ColorEnlaceActivo;

  //todo  SolapaControles(xxx, DBETelefono2);
  DBETelefono2.Color := REntorno.ColorEnlaceActivo;

  //todo  SolapaControles(xxx, DBETelefax);
  DBETelefax.Color := REntorno.ColorEnlaceActivo;

  //todo  SolapaControles(xxx, DBETel01);
  DBETel01.Color := REntorno.ColorEnlaceActivo;

  //todo  SolapaControles(xxx, DBETel02);
  DBETel02.Color := REntorno.ColorEnlaceActivo;

  //todo  SolapaControles(xxx, DBEFax);
  DBEFax.Color := REntorno.ColorEnlaceActivo;

  // Elimino las acciones para ver adjuntos
  if (DMMain.EstadoKri(242) <> 1) then
  begin
     for i := Self.ComponentCount - 1 downto 0 do
     begin
        if (Self.Components[i] is TAction) then
        begin
           if TAction(Self.Components[i]).Category = 'Adjuntos' then
              TAction(Self.Components[i]).Free;
        end
        else
        begin
           if (Components[i] is TLFCategoryAction) then
              if TLFCategoryAction(Self.Components[i]).Category = 'Adjuntos' then
                 TLFCategoryAction(Self.Components[i]).Free;
        end;
     end;
  end;

  // Modulo CRM habilitado?
  BAbreCRM.Visible := False;
  TSepCRM.Visible := False;
  ACRM.Visible := False;
  if (LeeParametro('MODREST002') = 'S') then
  begin
     BAbreCRM.Visible := True;
     TSepCRM.Visible := True;
     ACRM.Visible := True;
  end;

  // Accion para crear 300 clientes al azar
  ACreaTercerosRandom.Visible := False;
  ARenombraTercerosRandom.Visible := False;
  AReemplazaCarateres.Visible := False;

  {$IFDEF Debug}
  ACreaTercerosRandom.Visible := True;
  ARenombraTercerosRandom.Visible := True;
  AReemplazaCarateres.Visible := True;
  {$ENDIF}
end;

procedure TFMTerceros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTerceros);
end;

procedure TFMTerceros.FormShow(Sender: TObject);
begin
  inherited;
  // Color campo ID
  ColorCampoID(DBETercero);
end;

procedure TFMTerceros.FormActivate(Sender: TObject);
begin
  inherited;
  if not Primera then
     if not REntorno.DatosAbiertos then
        DMTerceros.BusquedaCompleja;
  Primera := True;
  PonBotones;
  if FMain.EnlaceCrea then
     InsertarTercero;
end;

procedure TFMTerceros.Btn_C_SalirClick(Sender: TObject);
begin
  TSFicha.Show;
end;

procedure TFMTerceros.TSDireccionesShow(Sender: TObject);
begin
  DMTerceros.AbrirDirecciones;
  ControlEdit := CEDirecciones;

  // Reutilizo acciones para doble click
  SBAEmail.Parent := TSDireccion;
  SBAWeb.Parent := TSDireccion;
  SolapaControles(SBAEmail, DBEDirEmail);
  SolapaControles(SBAWeb, DBEDirWeb);
  MostrarMapa;
end;

procedure TFMTerceros.TSContactosShow(Sender: TObject);
begin
  DMTerceros.AbrirContactos;
  ControlEdit := CEContactos;
end;

procedure TFMTerceros.TSNotasShow(Sender: TObject);
begin
  ControlEdit := CEInfo;
end;

procedure TFMTerceros.DBEFEntidadChange(Sender: TObject);
begin
  CompruebaCuentaBancaria;
  if not TDBEdit(Sender).Focused then
     Exit;
  if Length(TDBEdit(Sender).Text) = TDBEdit(Sender).MaxLength then
     SelectNext(TDBEdit(Sender), True, True);
end;

procedure TFMTerceros.DBENombreExit(Sender: TObject);
begin
  if (DBENombreComercial.Text = '') and (DBENombre.Text = '') then
     raise Exception.Create(_('No puede haber un tercero sin nombre'));
end;

procedure TFMTerceros.TSCuentasShow(Sender: TObject);
begin
  DMTerceros.AbrirCuentas;
  ControlEdit := CECuentas;
end;

procedure TFMTerceros.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMTerceros.BusquedaCompleja;
  Continua := False;
  Reconectar_Tablas;
  PonBotones;
  RestringirPestanya;
end;

procedure TFMTerceros.TSCu_TablaShow(Sender: TObject);
begin
  DBG_Cuentas.SetFocus;
end;

procedure TFMTerceros.MuestraFiltrado(tipo: byte);
begin
  AbreData(TDMLstTerceros, DMLstTerceros);
  DMLstTerceros.FiltraTerceros(DMTerceros.QMTerceros.SelectSQL);
  DMLstTerceros.MostrarListadoFiltrado(tipo);
  CierraData(DMLstTerceros);
end;

procedure TFMTerceros.PonBotones;
var
  Cliente, Proveedor, Acreedor, Agente, Empleado, Potencial, Crm : boolean;
begin
  DMTerceros.QueEs(DMTerceros.QMTercerosTERCERO.AsInteger, Cliente, Proveedor, Acreedor, Agente, Empleado, Potencial, Crm);

  if (Cliente) then
     BAbreCliente.Font.Color := clWindowText
  else
     BAbreCliente.Font.Color := clSilver;

  if (Proveedor) then
     BAbreProveedor.Font.Color := clWindowText
  else
     BAbreProveedor.Font.Color := clSilver;

  if (Acreedor) then
     BAbreAcreedor.Font.Color := clWindowText
  else
     BAbreAcreedor.Font.Color := clSilver;

  if (Agente) then
     BAbreAgente.Font.Color := clWindowText
  else
     BAbreAgente.Font.Color := clSilver;

  if ((Empleado) and (DMTerceros.QMTercerosTERCERO.AsInteger <> REntorno.Tercero)) then
  begin
     BAbreEmpleado.Font.Color := clWindowText;

     if not MostrarEmpleado then
     begin
        // Oculto informacion del tercero
        // Oculto informacion del tercero
        if not Assigned(PNLOcultaInfoBottom) then
        begin
           PNLOcultaInfoBottom := TLFPanel.Create(PEdit);
           with PNLOcultaInfoBottom do
           begin
              Parent := PEdit;
              BevelInner := bvNone;
              BevelOuter := bvNone;
           end;
        end;
        if not Assigned(PNLOcultaInfoRight) then
        begin
           PNLOcultaInfoRight := TLFPanel.Create(PEdit);
           with PNLOcultaInfoRight do
           begin
              Parent := PEdit;
              BevelInner := bvNone;
              BevelOuter := bvNone;
           end;
        end;

        with PNLOcultaInfoBottom do
        begin
           Top := DBEPaisTercero.Top;
           Left := 0;
           Width := PEdit.Width;
           Height := PEdit.Height - Top;
           Visible := True;
        end;

        with PNLOcultaInfoRight do
        begin
           Top := 0;
           Left := DBENombre.Left + DBENombre.Width;
           Width := PEdit.Width - Left;
           Height := PEdit.Height;
           Visible := True;
        end;

        GBDireccion.Visible := False;
        GBOtros.Visible := False;
        DBGContactos.Visible := False;
     end;
  end
  else
  begin
     BAbreEmpleado.Font.Color := clSilver;

     if not MostrarEmpleado then
     begin
        // Muestro informacion del tercero
        FreeAndNil(PNLOcultaInfoBottom);
        FreeAndNil(PNLOcultaInfoRight);
        GBDireccion.Visible := True;
        GBOtros.Visible := True;
        DBGContactos.Visible := True;
     end;
  end;

  if (Crm) then
     BAbreCRM.Font.Color := clWindowText
  else
     BAbreCRM.Font.Color := clSilver;
end;

procedure TFMTerceros.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  PonBotones;

  RestringirPestanya;

  if FMain.SourceCallTer = True then
  begin
     FMain.SourceCallTer := False;
     Close;
  end;

  if Button = nbPost then
     ValidaDocumentoIdentificacion;

  SBNuevaLocalidadFicha.Visible := (Button in [nbEdit, nbInsert]);

  MostrarMapa;
end;

procedure TFMTerceros.TSFichaShow(Sender: TObject);
begin
  ControlEdit := CEMain;
  DMTerceros.AbrirFicha;
  DMTerceros.AbrirContactos;
  PonBotones;

  // Reutilizo acciones para doble click
  SBAEmail.Parent := TSFicha;
  SBAWeb.Parent := TSFicha;
  SolapaControles(SBAEmail, DBEEmail);
  SolapaControles(SBAWeb, DBEWeb);
  MostrarMapa;
end;

// Vuelve a conectar las tablas pertinentes después de la Búsqueda
procedure TFMTerceros.Reconectar_Tablas;
begin
  if PCMain.ActivePage = TSFicha then
     DMTerceros.AbrirFicha;         // Ficha
  if PCMain.ActivePage = TSDireccion then
     DMTerceros.AbrirDirecciones;   // Direcciones
  if PCMain.ActivePage = TSContactos then
     DMTerceros.AbrirContactos;     // Contactos
  if PCMain.ActivePage = TSCuentas then
     DMTerceros.AbrirCuentas;       // Cuentas Bancarias
  if PCMain.ActivePage = TSImagenes then
     RefrescarImagen(Imagen, DMTerceros.QMTercerosIMAGEN.AsInteger); // Imágenes
  if PCMain.ActivePage = TSMails then
     DMTerceros.AbrirEmail;         // Emails
end;

procedure TFMTerceros.PCMainChanging(Sender: TObject; var AllowChange: boolean);
begin
  if PCMain.ActivePage = TSFicha then
  begin
     DMTerceros.CerrarFicha;
     DMTerceros.CerrarContactos;
  end;

  if PCMain.ActivePage = TSDireccion then
     DMTerceros.CerrarDirecciones;   // Direcciones
  if PCMain.ActivePage = TSContactos then
     DMTerceros.CerrarContactos;     // Contactos
  if PCMain.ActivePage = TSCuentas then
     DMTerceros.CerrarCuentas;       // Cuentas Bancarias
  // if PCMain.ActivePage = TSImagenes then DMTerceros.CerrarImagenes;      // Imágenes
  if PCMain.ActivePage = TSMails then
     DMTerceros.CerrarEmail;         // Emails
end;

// Abrir/Activar el formulario de Clientes
procedure TFMTerceros.SBCliClick(Sender: TObject);
begin
  FMain.EjecutaAccion(FMain.AClientes, 'TERCERO = ' + DMTerceros.QMTercerosTERCERO.AsString);
end;

// Abrir/Activar el formulario de Proveedores
procedure TFMTerceros.SBProClick(Sender: TObject);
begin
  FMain.EjecutaAccion(FMain.AProveedores, 'Tercero = ' +
     DMTerceros.QMTercerosTERCERO.AsString +
     'and Ejercicio = ' + REntorno.EjercicioStr);
end;

// Abrir/Activar el formulario de Acreedores
procedure TFMTerceros.SBAcrClick(Sender: TObject);
begin
  FMain.EjecutaAccion(FMain.AAcreedores, 'Tercero = ' +
     DMTerceros.QMTercerosTERCERO.AsString + ' and Ejercicio = ' + REntorno.EjercicioStr);
end;

// Abrir/Activar el formulario de Agentes
procedure TFMTerceros.SBAgeClick(Sender: TObject);
begin
  FMain.EjecutaAccion(FMain.AAgentes, 'Tercero = ' +
     DMTerceros.QMTercerosTERCERO.AsString +
     ' and Ejercicio = ' + REntorno.EjercicioStr);
end;

procedure TFMTerceros.SBPotClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AClientesPotencialesKri, 'TERCERO = ' + DMTerceros.QMTercerosTERCERO.AsString);
end;

procedure TFMTerceros.TSTablaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMTerceros.DBSE_B_OrdenChange(Sender: TObject);
begin
  if DBSE_B_Orden.Value < 0 then
     DBSE_B_Orden.Value := 0;
end;

procedure TFMTerceros.EFLocalidadBusqueda(Sender: TObject);
begin
  BEEP;
end;

procedure TFMTerceros.CierraCliente;
begin
  FMain.autcliente := False;
  Application.ProcessMessages;
  SetFocus;
  FMClientes.Close;
end;

procedure TFMTerceros.CierraProveedor;
begin
  FMain.autproveedor := False;
  Application.ProcessMessages;
  SetFocus;
  FMProveedores.Close;
end;

procedure TFMTerceros.CierraAcreedor;
begin
  FMain.autacreedor := False;
  Application.ProcessMessages;
  SetFocus;
  FMAcreedores.Close;
end;

procedure TFMTerceros.CierraAgente;
begin
  FMain.autagente := False;
  Application.ProcessMessages;
  SetFocus;
  FMAgentes.Close;
end;

procedure TFMTerceros.TraspasosActivos(activacion: integer);
begin
  if activacion = 1 then
  begin
     {
     FBHaciaAgente.Font.Color := clBlack;
     FBHaciaAcreedor.Font.Color := clBlack;
     FBHaciaProveedor.Font.Color := clBlack;
     FBHaciaCliente.Font.Color := clBlack;
     }
     // PBtnMaestros.Enabled := True;
  end
  else
  if activacion = 0 then
  begin
     {
     FBHaciaAgente.Font.Color := clGray;
     FBHaciaAcreedor.Font.Color := clGray;
     FBHaciaProveedor.Font.Color := clGray;
     FBHaciaCliente.Font.Color := clGray;
     }
     // PBtnMaestros.Enabled := False;
  end;
end;

procedure TFMTerceros.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbEdit then
  begin
     BAbreCliente.Font.Color := clSilver;
     BAbreProveedor.Font.Color := clSilver;
     BAbreAcreedor.Font.Color := clSilver;
     BAbreAgente.Font.Color := clSilver;
     BAbreEmpleado.Font.Color := clSilver;
     BAbreCRM.Font.Color := clSilver;
  end
  else
  if Button = nbInsert then
  begin
     BAbreCliente.Font.Color := clSilver;
     BAbreProveedor.Font.Color := clSilver;
     BAbreAcreedor.Font.Color := clSilver;
     BAbreAgente.Font.Color := clSilver;
     BAbreEmpleado.Font.Color := clSilver;
     BAbreCRM.Font.Color := clSilver;
  end
  else
  if Button = nbCancel then
  begin
     BAbreCliente.Font.Color := clBlack;
     BAbreProveedor.Font.Color := clBlack;
     BAbreAcreedor.Font.Color := clBlack;
     BAbreAgente.Font.Color := clBlack;
     BAbreEmpleado.Font.Color := clBlack;
     BAbreCRM.Font.Color := clBlack;
  end;
  if ((Button = nbFirst) or (Button = nbPrior) or (Button = nbNext) or (Button = nbLast)) then
  begin
     // Determinamos si la direccion es de 3 o 4 niveles para mostrar los campos necesarios
     PosicionaElementosDireccion(DBEPaisDireccion.Text);
  end;
end;

procedure TFMTerceros.InsertarTercero;
begin
  DMTerceros.InsertarTercero;
end;

// Filtra por Tercero
procedure TFMTerceros.FiltraTercero(Filtro: string);
begin
  if Assigned(DMTerceros) then
  begin
     DMTerceros.FiltraTercero(Filtro);
     Reconectar_Tablas;
     PonBotones;
  end;
end;

procedure TFMTerceros.NavDireccionesClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  SBNuevaLocalidadDireccion.Visible := (Button in [nbEdit, nbInsert]);
  TButtTransportistaSegunCP.Visible := (Button in [nbEdit, nbInsert]);
  PonBotones;
end;

procedure TFMTerceros.NavContactosClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  PonBotones;
end;

procedure TFMTerceros.NavCuentasClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  PonBotones;
  BObtenerBIC.Visible := (Button in [nbInsert, nbEdit]);
end;

procedure TFMTerceros.NavInfoClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  PonBotones;
end;

procedure TFMTerceros.TSImagenesShow(Sender: TObject);
begin
  RefrescarImagen(Imagen, DMTerceros.QMTercerosIMAGEN.AsInteger);
  ETituloImagen.Text := DameTituloImagen(DMTerceros.QMTercerosIMAGEN.AsInteger);
  ControlEdit := CEImagenes;
end;

procedure TFMTerceros.NavImagenesClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  PonBotones;
end;

procedure TFMTerceros.DBEFImagenChange(Sender: TObject);
begin
  if (PCMain.ActivePage = TSImagenes) then
  begin
     RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
     ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
  end;
end;

procedure TFMTerceros.NavDireccionesClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  inherited;
  // Para poder poner el nro de direccion a mano
  if (Button = nbInsert) then
  begin
     DBE_D_Direccion.Enabled := True;
     DBE_D_Direccion.ReadOnly := not DBE_D_Direccion.Enabled;
     DBE_D_Direccion.Color := clWindow;
     DBE_D_Direccion.Font.Color := clWindowText;
  end
  else
  begin
     DBE_D_Direccion.Enabled := False;
     DBE_D_Direccion.ReadOnly := not DBE_D_Direccion.Enabled;
     DBE_D_Direccion.Color := clInfoBk;
     DBE_D_Direccion.Font.Color := clGrayText;
  end;
end;

procedure TFMTerceros.AVisualizarListadoExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(0);
end;

procedure TFMTerceros.AImprimirListadoExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(1);
end;

procedure TFMTerceros.AListConfigExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstTerceros, DMLstTerceros);
  TFMListConfig.Create(Self).Muestra(5, Formato, Cabecera, Copias, Pijama, '',
     DMLstTerceros.frTerceros);
  CierraData(DMLstTerceros);
end;

procedure TFMTerceros.ADirDefectoExecute(Sender: TObject);
begin
  inherited;
  DMTerceros.DireccionDefecto;
end;

procedure TFMTerceros.AResDirDefectoExecute(Sender: TObject);
begin
  inherited;
  DMTerceros.ResDireccionDefecto;
  PCMain.ActivePage := TSFicha;
end;

procedure TFMTerceros.NavContactosBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbCancel then
     NavContactos.SetFocus;
end;

procedure TFMTerceros.NavCuentasBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbCancel then
     NavCuentas.SetFocus;
end;

procedure TFMTerceros.NavInfoBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbCancel then
     NavInfo.SetFocus;
end;

procedure TFMTerceros.AClienteExecute(Sender: TObject);
begin
  inherited;
  if (DMTerceros.VerificaExisteEnTercero(DMTerceros.QMTercerosTERCERO.AsInteger, 'CLI')) then
     FMain.EjecutaAccion(FMain.AClientes, 'TERCERO = ' + DMTerceros.QMTercerosTERCERO.AsString)
  else
  if EstructuraCreada then
  begin
     FMain.autcliente := True;
     FMain.EjecutaAccion(FMain.AClientes);
     FMClientes.Tercero_a_Cliente(StrToInt(DBETercero.Text));
  end;
end;

procedure TFMTerceros.AProveedorExecute(Sender: TObject);
begin
  inherited;
  if (DMTerceros.VerificaExisteEnTercero(DMTerceros.QMTercerosTERCERO.AsInteger, 'PROV')) then
     FMain.EjecutaAccion(FMain.AProveedores, 'Tercero = ' + DMTerceros.QMTercerosTERCERO.AsString + 'and Ejercicio = ' + REntorno.EjercicioStr)
  else
  if EstructuraCreada then
  begin
     FMain.autproveedor := True;
     FMain.EjecutaAccion(FMain.AProveedores);
     FMProveedores.Tercero_a_Proveedor(StrToInt(DBETercero.Text));
  end;
end;

procedure TFMTerceros.AAcreedorExecute(Sender: TObject);
begin
  inherited;
  if (DMTerceros.VerificaExisteEnTercero(DMTerceros.QMTercerosTERCERO.AsInteger, 'ACR')) then
     FMain.EjecutaAccion(FMain.AAcreedores, 'Tercero = ' + DMTerceros.QMTercerosTERCERO.AsString + ' and Ejercicio = ' + REntorno.EjercicioStr)
  else
  if EstructuraCreada then
  begin
     FMain.autacreedor := True;
     FMain.EjecutaAccion(FMain.AAcreedores);
     FMAcreedores.Tercero_a_Acreedor(StrToInt(DBETercero.Text));
  end;
end;

procedure TFMTerceros.AAgenteExecute(Sender: TObject);
begin
  inherited;
  if (DMTerceros.VerificaExisteEnTercero(DMTerceros.QMTercerosTERCERO.AsInteger, 'AGE')) then
     FMain.EjecutaAccion(FMain.AAgentes, 'Tercero = ' + DMTerceros.QMTercerosTERCERO.AsString + ' and Ejercicio = ' + REntorno.EjercicioStr)
  else
  if EstructuraCreada then
  begin
     FMain.autagente := True;
     FMain.EjecutaAccion(FMain.AAgentes);
     FMAgentes.Tercero_a_Agente(StrToInt(DBETercero.Text));
  end;
end;

procedure TFMTerceros.FBHaciaClientePotencialClick(Sender: TObject);
begin
  inherited;
  if EstructuraCreada then
  begin
     FMain.autagente := True;
     FMain.EjecutaAccion(FMain.AClientesPotencialesKri);
     FMClientesPotencialesKri.Tercero_a_ClientePotencial(StrToInt(DBETercero.Text));
  end;
end;

procedure TFMTerceros.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  // Nava - Quitar filtro antes de realizar la búsqueda
  DMTerceros.FiltraTercero('');
  G2KTableLoc.DataSource := DMTerceros.DSQMTerceros;
  G2KTableLoc.Click;

  Reconectar_Tablas;
  PonBotones;
  RestringirPestanya;
end;

procedure TFMTerceros.TSMailsShow(Sender: TObject);
begin
  inherited;
  DMTerceros.AbrirEmail; // Emails
end;

procedure TFMTerceros.DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  PonBotones;
end;

procedure TFMTerceros.DBGMainColEnter(Sender: TObject);
begin
  inherited;
  PonBotones;
end;

procedure TFMTerceros.LFDBEAgenteKriChange(Sender: TObject);
begin
  inherited;
  LFEAgente.Text := DameTituloAgente(StrToIntDef(LFDBEAgenteKri.Text, 0));
end;

procedure TFMTerceros.EFTerceroChange(Sender: TObject);
begin
  inherited;
  DMTerceros.FiltraUnTercero(StrToIntDef(EFTercero.Text, 0));

  Reconectar_Tablas;
  PonBotones;
end;

procedure TFMTerceros.LNombreCom_SocClick(Sender: TObject);
begin
  inherited;
  if (LNombreCom_Soc.Caption = _('Nombre comercial')) then
  begin
     LNombreCom_Soc.Caption := _('Razon social');
     G2kTableLoc.CampoStr := 'NOMBRE_R_SOCIAL';
     EFTercero.CampoStr := 'NOMBRE_R_SOCIAL';
  end
  else
  begin
     LNombreCom_Soc.Caption := _('Nombre comercial');
     G2kTableLoc.CampoStr := 'NOMBRE_COMERCIAL';
     EFTercero.CampoStr := 'NOMBRE_COMERCIAL';
  end;
end;

procedure TFMTerceros.AVerificaNIFExecute(Sender: TObject);
begin
  inherited;
  DMTerceros.VerificaNifKri;
end;

procedure TFMTerceros.ValidaDocumentoIdentificacion;
var
  Valido : boolean;
  MensajeError : string;
begin
  inherited;
  DMMain.VerificaDocumentoIdentificacion(DMTerceros.QMTercerosPAIS_TERCERO.AsString, DMTerceros.QMTercerosTIPO_DOC_IDENT.AsString, DMTerceros.QMTercerosNIF.AsString, Valido, MensajeError);
  if Valido then
  begin
     DBECif.Hint := '';
     ColorEdicion(DBECif);
  end
  else
  begin
     DBECif.Hint := MensajeError;
     ColorError(DBECif);
  end;
end;

procedure TFMTerceros.DBECifChange(Sender: TObject);
begin
  inherited;
  if (DMTerceros.QMTerceros.State = dsBrowse) then
  begin
     ValidaDocumentoIdentificacion;
  end;
end;

procedure TFMTerceros.DBEFDireccionChange(Sender: TObject);
begin
  inherited;
  EDireccion.Text := DameDireccionTercero(DMTerceros.QMContactosTERCERO.AsInteger, DMTerceros.QMContactosDIRECCION.AsInteger);
end;

procedure TFMTerceros.DBEFDireccionBusqueda(Sender: TObject);
begin
  inherited;
  DBEFDireccion.CondicionBusqueda := 'tercero=' + IntToStr(DMTerceros.QMContactosTERCERO.AsInteger);
end;

procedure TFMTerceros.SBFiltraContactosClick(Sender: TObject);
begin
  inherited;
  TSContactos.Show;
  with DMTerceros.QMContactos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM SYS_TERCEROS_CONTACTOS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' TERCERO = ?TERCERO AND ');
     SelectSQL.Add(' DIRECCION = ?DIRECCION ');
     SelectSQL.Add(' ORDER BY CONTACTO ');
     Params.ByName['DIRECCION'].AsInteger := DMTerceros.QMDireccionesDIRECCION.AsInteger;
     Open;
  end;
end;

procedure TFMTerceros.SBIncidenciasKriClick(Sender: TObject);
begin
  inherited;
  AbreForm(TFMIncidencias, FMIncidencias, Sender);
  FMIncidencias.Muestra(0, DMTerceros.QMDireccionesTERCERO.AsInteger, 0, 0, 0, DMTerceros.QMDireccionesDIRECCION.AsInteger);
end;

procedure TFMTerceros.EFContactoKriExiste(Sender: TObject);
begin
  inherited;
  if (EFContactoKri.Text <> '') then
     Posicionar(DMTerceros.QMContactos, 'CONTACTO', StrToIntDef(EFContactoKri.Text, 0));
end;

procedure TFMTerceros.EFDireccionTerceroKriExiste(Sender: TObject);
begin
  inherited;
  if (EFDireccionTerceroKri.Text <> '') then
     Posicionar(DMTerceros.QMdirecciones, 'DIRECCION', StrToIntDef(EFDireccionTerceroKri.Text, 0));
end;

procedure TFMTerceros.CompruebaCuentaBancaria;
begin
  // Si esta vacio no lo chequeo
  if ((Trim(DBEFEntidad.Text) + Trim(DBE_B_Sucursal.Text) + Trim(DBE_B_DigCont.Text) + Trim(DBE_B_Cuenta.Text) > ' ') and
     (DBE_B_DigCont.Text <> '**')) and
     (CuentaCCCValida(DBEFEntidad.Text, DBE_B_Sucursal.Text, DBE_B_DigCont.Text, Trim(DBE_B_Cuenta.Text))) then
  begin
     ColorEdicion(DBEFEntidad);
     ColorEdicion(DBE_B_Sucursal);
     ColorEdicion(DBE_B_DigCont);
     ColorEdicion(DBE_B_Cuenta);
  end
  else
  begin
     ColorError(DBEFEntidad);
     ColorError(DBE_B_Sucursal);
     ColorError(DBE_B_DigCont);
     ColorError(DBE_B_Cuenta);
  end;
end;

procedure TFMTerceros.PosicionaDireccion(Direccion: integer);
begin
  PCMain.ActivePage := TSDireccion;
  while ((not DMTerceros.QMDirecciones.EOF) and (DMTerceros.QMDireccionesDIRECCION.AsInteger <> Direccion)) do
     DMTerceros.QMDirecciones.Next;
  if (DMTerceros.QMDireccionesDIRECCION.AsInteger <> Direccion) then
     DMTerceros.QMDirecciones.First;
end;

procedure TFMTerceros.PosicionaContacto(Contacto: integer);
begin
  PCMain.ActivePage := TSContactos;
  while ((not DMTerceros.QMContactos.EOF) and (DMTerceros.QMContactosCONTACTO.AsInteger <> Contacto)) do
     DMTerceros.QMContactos.Next;
  if (DMTerceros.QMContactosCONTACTO.AsInteger <> Contacto) then
     DMTerceros.QMContactos.First;
end;

procedure TFMTerceros.EFDireccionTerceroKriBusqueda(Sender: TObject);
begin
  inherited;
  EFDireccionTerceroKri.CondicionBusqueda := 'TERCERO=' + IntToStr(DMTerceros.QMTercerosTERCERO.AsInteger);
end;

procedure TFMTerceros.EFContactoKriBusqueda(Sender: TObject);
begin
  inherited;
  EFContactoKri.CondicionBusqueda := 'TERCERO=' + IntToStr(DMTerceros.QMTercerosTERCERO.AsInteger);
end;

procedure TFMTerceros.AAdjuntosTerceroExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('TER', DMTerceros.QMTercerosTERCERO.AsInteger);
end;

procedure TFMTerceros.DBEFContactoPadreBusqueda(Sender: TObject);
begin
  inherited;
  DBEFContactoPadre.CondicionBusqueda := 'TERCERO=' + IntToStr(DMTerceros.QMTercerosTERCERO.AsInteger);
end;

procedure TFMTerceros.DBEFContactoPadreChange(Sender: TObject);
begin
  inherited;
  EContactoPadre.Text := DameTituloContacto(DMTerceros.QMTercerosTERCERO.AsInteger, StrToIntDef(DBEFContactoPadre.Text, 0));
end;

procedure TFMTerceros.CreaArbolContactos;
var
  Nodo, Hijo, Departamento : TTreeNode;
  i : integer;
  DS : TFIBDataSet;
  T : TFIBTransaction;
  d, s : string;
begin
  inherited;
  // Crea el arbol
  if (PCContactos.ActivePage = TSCo_Jerarquia) then
  begin
     DS := TFIBDataSet.Create(nil);
     T := DameTransactionRO(DMMain.DataBase);
     try
        // Primero inserto el nodo padre
        TVContactos.Items.Clear;
        Nodo := TVContactos.Items.Add(nil, Trim(DMTerceros.QMTercerosNOMBRE_R_SOCIAL.AsString));
        Nodo.Data := Pointer(0);

        // Inserto los departamentos
        with DS do
        begin
           Close;
           DataBase := DMMain.DataBase;
           Transaction := T;
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Text := 'SELECT DISTINCT(DEPARTAMENTO) FROM SYS_TERCEROS_CONTACTOS WHERE TERCERO = ?TERCERO AND DEPARTAMENTO > '' '' ';
           Params.ByName['TERCERO'].AsInteger := DMTerceros.QMTercerosTERCERO.AsInteger;
           Open;
           while (not EOF) do
           begin
              s := FieldByName('DEPARTAMENTO').AsString + ' - ' + DameTituloDepartamento(FieldByName('DEPARTAMENTO').AsString);
              Departamento := TVContactos.Items.AddChild(Nodo, s);
              Departamento.Data := Pointer(-1);
              Next;
           end;
           Transaction.Commit;
        end;

        // Tercero inserto todos los contactos
        with DS do
        begin
           Close;
           DataBase := DMMain.DataBase;
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Text := 'SELECT * FROM SYS_TERCEROS_CONTACTOS WHERE TERCERO = ?TERCERO ORDER BY PADRE, CONTACTO';
           Params.ByName['TERCERO'].AsInteger := DMTerceros.QMTercerosTERCERO.AsInteger;
           Open;
           while (not EOF) do
           begin
              // Preparo el string a mostrar para el contacto
              s := FieldByName('CONTACTO').AsString + ' - ' + Trim(FieldByName('NOMBRE').AsString) + ' ' + Trim(FieldByName('APELLIDOS').AsString);
              if (Trim(FieldByName('TELEFONO').AsString) > '') then
                 s := s + ' - Tel. ' + Trim(FieldByName('TELEFONO').AsString);
              if (Trim(FieldByName('EXTENSION').AsString) > '') then
                 s := s + ' - Ext. ' + Trim(FieldByName('EXTENSION').AsString);
              if (Trim(FieldByName('MOVIL').AsString) > '') then
                 s := s + ' - Mov. ' + Trim(FieldByName('MOVIL').AsString);

              if (Trim(FieldByName('DEPARTAMENTO').AsString) = '') then
              begin
                 Hijo := TVContactos.Items.AddChild(Nodo, s);
                 Hijo.Data := Pointer(DS.FieldByName('CONTACTO').AsInteger);
              end
              else
              begin
                 {Busco el nodo del Departamento}
                 d := FieldByName('DEPARTAMENTO').AsString + ' - ' + DameTituloDepartamento(FieldByName('DEPARTAMENTO').AsString);
                 Departamento := nil;
                 for i := 0 to TVContactos.Items.Count - 1 do
                 begin
                    if (TVContactos.Items[i].Text = d) then
                    begin
                       Departamento := TVContactos.Items[i];
                       // s :=  FieldByName('DEPARTAMENTO').AsString;
                       // Hijo.Data := Pointer(FieldByName('DEPARTAMENTO').AsString);
                    end;
                 end;
                 Hijo := TVContactos.Items.AddChild(Departamento, s);
                 Hijo.Data := Pointer(FieldByName('CONTACTO').AsInteger);
              end;
              Next;
           end;
        end;

        // Despues muevo cada contacto debajo de su padre
        with DS do
        begin
           First;
           while (not DS.EOF) do
           begin
              if ((DS.FieldByName('PADRE').AsInteger <> DS.FieldByName('CONTACTO').AsInteger) and
                 (DS.FieldByName('PADRE').AsInteger <> 0)) then
              begin
                 Hijo := nil;
                 {Busco el nodo del contacto}
                 for i := 0 to TVContactos.Items.Count - 1 do
                 begin
                    if (TVContactos.Items[i].Data = Pointer(DS.FieldByName('CONTACTO').AsInteger)) then
                       Hijo := TVContactos.Items[i];
                 end;
                 {Busco el nodo del contacto padre}
                 for i := 0 to TVContactos.Items.Count - 1 do
                 begin
                    if (TVContactos.Items[i].Data = Pointer(DS.FieldByName('PADRE').AsInteger)) then
                       Nodo := TVContactos.Items[i];
                 end;
                 // Muevo el hijo debajo del padre
                 Hijo.MoveTo(Nodo, naAddChild);
              end;
              DS.Next;
           end;
           Close;
           Transaction.Commit;
        end;
     finally
        FreeAndNil(DS);
        FreeAndNil(T);
     end;
     TVContactos.FullExpand;
  end
  else
     TVContactos.Items.Clear;
end;

procedure TFMTerceros.PCContactosChanging(Sender: TObject; var AllowChange: boolean);
begin
  inherited;
  // Borro el arbol
  if (PCContactos.ActivePage = TSCo_Jerarquia) then
     TVContactos.Items.Clear;
end;

procedure TFMTerceros.PCContactosChange(Sender: TObject);
begin
  inherited;
  if (PCContactos.ActivePage = TSCo_Jerarquia) then
     CreaArbolContactos;
end;

procedure TFMTerceros.TVContactosDblClick(Sender: TObject);
begin
  inherited;
  DMTerceros.PosicionaContacto(integer(TVContactos.Selections[0].Data));
  PCContactos.ActivePage := TSCo_Ficha;
end;

procedure TFMTerceros.DBEDepartamentoChange(Sender: TObject);
begin
  inherited;
  ETituloDepartamento.Text := DameTituloDepartamento(DBEDepartamento.Text);
end;

procedure TFMTerceros.DBEFTransportistaDirChange(Sender: TObject);
begin
  inherited;
  ETransportistaDirTitulo.Text := DameTituloAcreedor(StrToIntDef(DBEFTransportistaDir.Text, 0));
end;

procedure TFMTerceros.SBCrmClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.ACrmContactos, 'TERCERO = ' +
     DMTerceros.QMTercerosTERCERO.AsString);
end;

procedure TFMTerceros.SBAEmailDblClick(Sender: TObject);
begin
  inherited;
  if ShellExecute(Application.Handle, nil, PChar('mailto:' + DBEEmail.Text), nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('Error en el Mail'));
end;

procedure TFMTerceros.SBAWebDblClick(Sender: TObject);
begin
  inherited;
  if ShellExecute(Application.Handle, nil, PChar(DBEWeb.Text), nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('Error en la Página Web'));
end;

procedure TFMTerceros.SABContactosEmailDblClick(Sender: TObject);
begin
  inherited;
  if ShellExecute(Application.Handle, nil, PChar('mailto:' + DBE_C_Email.Text), nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('Error en el Mail'));
end;

procedure TFMTerceros.AImprimirNotasExecute(Sender: TObject);
var
  s : TStrings;
begin
  inherited;
  s := TStringList.Create;
  try
     s.Add('----------------------------------------------------------------------');
     s.Add(Format(_('Notas del tercero %d - %s'), [DMTerceros.QMTercerosTERCERO.AsInteger, DMTerceros.QMTercerosNOMBRE_R_SOCIAL.AsString]));
     s.Add('----------------------------------------------------------------------');
     s.AddStrings(DBMINfo.Lines);
     s.Add('----------------------------------------------------------------------');
     ImpresionTexto(s);
  finally
     s.Free;
  end;
end;

procedure TFMTerceros.DBEIBANChange(Sender: TObject);
begin
  inherited;
  if (Trim(DBEIBAN.Text) > '') and (not IBANValido(DBEIBAN.Text)) then
  begin
     ColorError(DBEIBAN);
  end
  else
  begin
     ColorEdicion(DBEIBAN);
  end;
end;

procedure TFMTerceros.AImprimirCartaSEPAExecute(Sender: TObject);
begin
  inherited;
  DMTerceros.ImprimirCartaSEPA(1, False);
end;

procedure TFMTerceros.AVisualizarCartaSEPAExecute(Sender: TObject);
begin
  inherited;
  DMTerceros.ImprimirCartaSEPA(0, False);
end;

procedure TFMTerceros.AListConfigCartaSEPAExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstTerceros, DMLstTerceros);
  TFMListConfig.Create(Self).Muestra(2009, Formato, Cabecera, Copias, Pijama, '',
     DMLstTerceros.frTerceros);
  CierraData(DMLstTerceros);
end;

procedure TFMTerceros.ACreaTercerosRandomExecute(Sender: TObject);
begin
  inherited;
  DMTerceros.CreaTerceros;
end;

procedure TFMTerceros.AReemplazaCarateresExecute(Sender: TObject);
begin
  inherited;
  DMTerceros.ReemplazaCarateres;
end;

procedure TFMTerceros.AEnviarEmailCartaSEPAExecute(Sender: TObject);
begin
  inherited;
  DMTerceros.ImprimirCartaSEPA(2, False);
end;

procedure TFMTerceros.ACalculaIBANExecute(Sender: TObject);
begin
  inherited;
  DMTerceros.CalculaIBAN;
end;

procedure TFMTerceros.DBEIBANEnter(Sender: TObject);
var
  Pais : string;
begin
  inherited;

  // Averiguo el pais del tercero.
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT PAIS FROM SYS_LOCALIDADES WHERE ID_LOCAL = :ID_LOCAL';
        Params.ByName['ID_LOCAL'].AsInteger := DMTerceros.QMTercerosID_LOCAL.AsInteger;
        ExecQuery;
        Pais := FieldByName['PAIS'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (DBEIBAN.Text = '') and (Trim(DBE_B_Cuenta.Text) <> '') then
     DBEIBAN.Text := CalcularIBAN(DamePaisC2(Pais), Trim(DBEFEntidad.Text) + Trim(DBE_B_Sucursal.Text) + Trim(DBE_B_DigCont.Text) + Trim(DBE_B_Cuenta.Text));
end;

procedure TFMTerceros.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  DMTerceros.QMTercerosIMAGEN.AsInteger := ImportarImagen('');
end;

procedure TFMTerceros.NavImagenesClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);
end;

procedure TFMTerceros.ARenombraTercerosRandomExecute(Sender: TObject);
begin
  inherited;
  DMTerceros.RenombraTerceros;
end;

procedure TFMTerceros.DBEFClaseDireccionChange(Sender: TObject);
begin
  inherited;
  EClaseDireccion.Text := DameTituloClaseDireccion(StrToIntDef(DBEFClaseDireccion.Text, -1));
end;

procedure TFMTerceros.AImprimirCartaLOPDExecute(Sender: TObject);
begin
  inherited;
  DMTerceros.ImprimirCartaLOPD(1, False);
end;

procedure TFMTerceros.AVisualizarCartaLOPDExecute(Sender: TObject);
begin
  inherited;
  DMTerceros.ImprimirCartaLOPD(0, False);
end;

procedure TFMTerceros.AEnviarEmailCartaLOPDExecute(Sender: TObject);
begin
  inherited;
  DMTerceros.ImprimirCartaLOPD(2, False);
end;

procedure TFMTerceros.AListConfigCartaLOPDExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstTerceros, DMLstTerceros);
  TFMListConfig.Create(Self).Muestra(2014, Formato, Cabecera, Copias, Pijama, '',
     DMLstTerceros.frTerceros);
  CierraData(DMLstTerceros);
end;

procedure TFMTerceros.AEnviarEmailCartaLOPD2Execute(Sender: TObject);
begin
  inherited;
  DMTerceros.ImprimirCartaLOPD(2, True);
end;

procedure TFMTerceros.AEnviarEmailCartaSEPA2Execute(Sender: TObject);
begin
  inherited;
  DMTerceros.ImprimirCartaSEPA(2, True);
end;

procedure TFMTerceros.APedirFirmaExecute(Sender: TObject);
begin
  inherited;
  DMMain.PedirFirma('LOP', DMTerceros.QMTercerosTERCERO.AsInteger);
end;

procedure TFMTerceros.ABorrarFirmaExecute(Sender: TObject);
begin
  inherited;
  DMMain.BorrarFirma('LOP', DMTerceros.QMTercerosTERCERO.AsInteger);
end;

procedure TFMTerceros.BClipboardClick(Sender: TObject);
begin
  inherited;
  DMTerceros.QMTercerosIMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

procedure TFMTerceros.DBEFBancoDireccionBusqueda(Sender: TObject);
begin
  inherited;
  DBEFBancoDireccion.CondicionBusqueda := 'TERCERO = ' + IntToStr(DMTerceros.QMDireccionesTERCERO.AsInteger);
end;

procedure TFMTerceros.DBEFBancoDireccionChange(Sender: TObject);
begin
  inherited;
  EBancoDireccion.Text := DameTituloBancoTercero(DMTerceros.QMDireccionesTERCERO.AsInteger, DMTerceros.QMDireccionesBANCO.AsInteger);
end;

procedure TFMTerceros.DBERegionChange(Sender: TObject);
begin
  inherited;
  if ((DBEPaisDireccion.Text > '') and (DBERegion.Text > '')) then
     ETituloRegion.Text := DameTituloRegion(DBEPaisDireccion.Text, DBERegion.Text)
  else
     ETituloRegion.Text := '';
end;

procedure TFMTerceros.EFCodigoPostalChange(Sender: TObject);
var
  Region, Provincia, Poblacion : string;
begin
  inherited;
  if ((DMTerceros.QMTercerosPAIS_DIRECCION.AsString > '') and (EFCodigoPostal.Text > '')) then
  begin
     ETituloCodigoPostal.Text := DameTituloCodigoPostal(DMTerceros.QMTercerosPAIS_DIRECCION.AsString, EFCodigoPostal.Text);
     if ((DBERegion.Text = '') and (DBEProvinciaDireccion.Text = '') and (EFPoblacion.Text = '')) then
     begin
        DMTerceros.BuscaDatosDireccionCP(DMTerceros.QMTercerosPAIS_DIRECCION.AsString, EFCodigoPostal.Text, Region, Provincia, Poblacion);
        if (Region > '') then
           DMTerceros.QMTercerosREGION_DIRECCION.AsString := Region;
        if (Provincia > '') then
           DMTerceros.QMTercerosPROVINCIA_DIRECCION.AsString := Provincia;
        if (Poblacion > '') then
           DMTerceros.QMTercerosPOBLACION_DIRECCION.AsString := Poblacion;
     end;
  end
  else
     ETituloCodigoPostal.Text := '';
end;

procedure TFMTerceros.DBETipoDocumentoBusqueda(Sender: TObject);
begin
  inherited;
  DBETipoDocumento.CondicionBusqueda := 'PAIS = ''' + DMTerceros.QMTercerosPAIS_TERCERO.AsString + '''';
end;

procedure TFMTerceros.DBETipoDocumentoChange(Sender: TObject);
begin
  inherited;
  if ((DMTerceros.QMTercerosPAIS_TERCERO.AsString > '') and (DMTerceros.QMTercerosTIPO_DOC_IDENT.AsString > '')) then
     ETipoDocumentoTitulo.Text := DameTituloTipoDocIdentidad(DMTerceros.QMTercerosPAIS_TERCERO.AsString, DMTerceros.QMTercerosTIPO_DOC_IDENT.AsString);
  ValidaDocumentoIdentificacion;
end;

procedure TFMTerceros.DBEPaisTerceroChange(Sender: TObject);
begin
  inherited;
  ETituloPaisTercero.Text := DameTituloPais(DBEPaisTercero.Text);
  ETipoDocumentoTitulo.Text := DameTituloTipoDocIdentidad(DMTerceros.QMTercerosPAIS_TERCERO.AsString, DMTerceros.QMTercerosTIPO_DOC_IDENT.AsString);
  ValidaDocumentoIdentificacion;
end;

procedure TFMTerceros.DBEPaisDireccionChange(Sender: TObject);
var
  TituloRegion, TituloProvincia, TituloPoblacion : string;
begin
  inherited;
  if (DBEPaisDireccion.Text > '') then
  begin
     ETituloPaisDireccion.Text := DameTituloPais(DBEPaisDireccion.Text);

     // Determinamos si la direccion es de 3 o 4 niveles para mostrar los campos necesarios
     PosicionaElementosDireccion(DMTerceros.QMTercerosPAIS_DIRECCION.AsString);

     DMMain.DameDatosPais(DBEPaisDireccion.Text, TituloRegion, TituloProvincia, TituloPoblacion);
     LRegion.Caption := TituloRegion;
     LProvinciaDireccion.Caption := TituloProvincia;
     LPoblacion.Caption := TituloPoblacion;
  end;
end;

procedure TFMTerceros.EFPoblacionChange(Sender: TObject);
var
  Region, Provincia : string;
begin
  inherited;
  if (DBEPaisDireccion.Text > '') then
  begin
     ETituloPoblacion.Text := DameTituloPoblacion(DMTerceros.QMTercerosPAIS_DIRECCION.AsString, DMTerceros.QMTercerosPOBLACION_DIRECCION.AsString);

     if ((DBERegion.Text = '') and (DBEProvinciaDireccion.Text = '') and (EFPoblacion.Text > '')) then
     begin
        DMTerceros.BuscaDatosDireccionPoblacion(DMTerceros.QMTercerosPAIS_DIRECCION.AsString, EFPoblacion.Text, Region, Provincia);
        if (Region > '') then
           DMTerceros.QMTercerosREGION_DIRECCION.AsString := Region;
        if (Provincia > '') then
           DMTerceros.QMTercerosPROVINCIA_DIRECCION.AsString := Provincia;
     end;
  end;
end;

procedure TFMTerceros.DBEProvinciaDireccionChange(Sender: TObject);
begin
  inherited;
  if (DMTerceros.QMTercerosPAIS_DIRECCION.AsString > '') then
     ETituloProvinciaTercero.Text := DameTituloProvincia(DMTerceros.QMTercerosPAIS_DIRECCION.AsString, DMTerceros.QMTercerosPROVINCIA_DIRECCION.AsString)
  else
     ETituloProvinciaTercero.Text := '';
end;

procedure TFMTerceros.DBERegionBusqueda(Sender: TObject);
begin
  inherited;
  with DBERegion do
  begin
     CondicionBusqueda := 'PAIS = ''' + DBEPaisDireccion.Text + '''';
  end;
end;

procedure TFMTerceros.DBEProvinciaDireccionBusqueda(Sender: TObject);
begin
  inherited;
  with DBEProvinciaDireccion do
  begin
     CondicionBusqueda := 'PAIS = ''' + DBEPaisDireccion.Text + '''';
     if ((Trim(DBERegion.Text) > '') and (Trim(DBERegion.Text) <> 'ZZZ')) then
        CondicionBusqueda := CondicionBusqueda + ' AND REGION = ''' + DBERegion.Text + '''';
  end;
end;

procedure TFMTerceros.EFPoblacionBusqueda(Sender: TObject);
begin
  inherited;
  with EFPoblacion do
  begin
     CondicionBusqueda := 'PAIS = ''' + DBEPaisDireccion.Text + '''';
     if (Trim(DBEProvinciaDireccion.Text) > '') then
        CondicionBusqueda := CondicionBusqueda + ' AND PROVINCIA = ''' + DBEProvinciaDireccion.Text + '''';
  end;
end;

procedure TFMTerceros.EFCodigoPostalBusqueda(Sender: TObject);
begin
  inherited;
  with EFCodigoPostal do
  begin
     CondicionBusqueda := 'PAIS = ''' + DBEPaisDireccion.Text + '''';
     if ((Trim(EFPoblacion.Text) > '') and (Trim(EFPoblacion.Text) <> 'ZZZ')) then
        CondicionBusqueda := CondicionBusqueda + ' AND POBLACION = ''' + EFPoblacion.Text + '''';
  end;
end;

procedure TFMTerceros.PosicionaElementosDireccion(Pais: string);
var
  SepVertical : integer;
  NivelDireccion : integer;
begin
  SepVertical := 22;
  NivelDireccion := DMMain.DameNivelDireccionPais(Pais);

  // En la pestaña ficha
  if (PCMain.ActivePage = TSFicha) then
  begin
     if ((LRegion.Visible = False) and (NivelDireccion = 4)) then
     begin
        LRegion.Visible := True;
        DBERegion.Visible := True;
        ETituloRegion.Visible := True;
        LProvinciaDireccion.Top := LProvinciaDireccion.Top + SepVertical;
        DBEProvinciaDireccion.Top := DBEProvinciaDireccion.Top + SepVertical;
        ETituloProvinciaTercero.Top := ETituloProvinciaTercero.Top + SepVertical;
        LPoblacion.Top := LPoblacion.Top + SepVertical;
        EFPoblacion.Top := EFPoblacion.Top + SepVertical;
        ETituloPoblacion.Top := ETituloPoblacion.Top + SepVertical;
        LCodigoPostal.Top := LCodigoPostal.Top + SepVertical;
        EFCodigoPostal.Top := EFCodigoPostal.Top + SepVertical;
        ETituloCodigoPostal.Top := ETituloCodigoPostal.Top + SepVertical;
        LColonia.Top := LColonia.Top + SepVertical;
        DBEColonia.Top := DBEColonia.Top + SepVertical;
     end;
     if ((LRegion.Visible = True) and (NivelDireccion = 3)) then
     begin
        LRegion.Visible := False;
        DBERegion.Visible := False;
        ETituloRegion.Visible := False;
        LProvinciaDireccion.Top := LProvinciaDireccion.Top - SepVertical;
        DBEProvinciaDireccion.Top := DBEProvinciaDireccion.Top - SepVertical;
        ETituloProvinciaTercero.Top := ETituloProvinciaTercero.Top - SepVertical;
        LPoblacion.Top := LPoblacion.Top - SepVertical;
        EFPoblacion.Top := EFPoblacion.Top - SepVertical;
        ETituloPoblacion.Top := ETituloPoblacion.Top - SepVertical;
        LCodigoPostal.Top := LCodigoPostal.Top - SepVertical;
        EFCodigoPostal.Top := EFCodigoPostal.Top - SepVertical;
        ETituloCodigoPostal.Top := ETituloCodigoPostal.Top - SepVertical;
        LColonia.Top := LColonia.Top - SepVertical;
        DBEColonia.Top := DBEColonia.Top - SepVertical;
     end;

     // Verificamos si existen regiones, provincias poblacion para ese pais
     if (not DMTerceros.ExistenDatosDireccionPais(DBEPaisDireccion.Text)) then
     begin
        DBERegion.Enabled := False;
        DBEProvinciaDireccion.Enabled := False;
        EFPoblacion.Enabled := False;
        EFCodigoPostal.Enabled := False;
        DBEColonia.Enabled := False;
        // DBMDireccion.SetFocus;

        DBERegion.Color := clSilver;
        DBEProvinciaDireccion.Color := clSilver;
        EFPoblacion.Color := clSilver;
        EFCodigoPostal.Color := clSilver;
        DBEColonia.Color := clSilver;
     end
     else
     begin
        DBERegion.Enabled := True;
        DBEProvinciaDireccion.Enabled := True;
        EFPoblacion.Enabled := True;
        EFCodigoPostal.Enabled := True;
        DBEColonia.Enabled := True;

        DBERegion.Color := clWindow;
        DBEProvinciaDireccion.Color := clWindow;
        EFPoblacion.Color := clWindow;
        EFCodigoPostal.Color := clSkyBlue;
        DBEColonia.Color := clWindow;
        // EDIRNombre3.SetFocus;
     end;

     DBERegion.ReadOnly := not DBERegion.Enabled;
     DBEProvinciaDireccion.ReadOnly := not DBEProvinciaDireccion.Enabled;
     EFPoblacion.ReadOnly := not EFPoblacion.Enabled;
     EFCodigoPostal.ReadOnly := not EFCodigoPostal.Enabled;
     DBEColonia.ReadOnly := not DBEColonia.Enabled;
  end
  else
  if (PCMain.ActivePage = TSDireccion) then
  begin
     if ((LDireccionRegion.Visible = False) and (NivelDireccion = 4)) then
     begin
        LDireccionRegion.Visible := True;
        DBEDireccionRegion.Visible := True;
        EDireccionRegion.Visible := True;
        LDireccionesProvincia.Top := LDireccionesProvincia.Top + SepVertical;
        DBEDireccionProvincia.Top := DBEDireccionProvincia.Top + SepVertical;
        EDireccionProvincia.Top := EDireccionProvincia.Top + SepVertical;
        LDireccionPoblacion.Top := LDireccionPoblacion.Top + SepVertical;
        DBEDireccionPoblacion.Top := DBEDireccionPoblacion.Top + SepVertical;
        EDireccionPoblacion.Top := EDireccionPoblacion.Top + SepVertical;
        LDireccionCodigoPostal.Top := LDireccionCodigoPostal.Top + SepVertical;
        DBEDireccionCodigoPostal.Top := DBEDireccionCodigoPostal.Top + SepVertical;
        EDireccionCodigoPostal.Top := EDireccionCodigoPostal.Top + SepVertical;
        LDireccionesColonia.Top := LDireccionesColonia.Top + SepVertical;
        DBEDireccionesColonia.Top := DBEDireccionesColonia.Top + SepVertical;
     end;
     if ((LDireccionRegion.Visible = True) and (NivelDireccion = 3)) then
     begin
        LDireccionRegion.Visible := False;
        DBEDireccionRegion.Visible := False;
        ETituloRegion.Visible := False;
        LDireccionesProvincia.Top := LDireccionesProvincia.Top - SepVertical;
        DBEDireccionProvincia.Top := DBEDireccionProvincia.Top - SepVertical;
        EDireccionProvincia.Top := EDireccionProvincia.Top - SepVertical;
        LDireccionPoblacion.Top := LDireccionPoblacion.Top - SepVertical;
        DBEDireccionPoblacion.Top := DBEDireccionPoblacion.Top - SepVertical;
        EDireccionPoblacion.Top := EDireccionPoblacion.Top - SepVertical;
        LDireccionCodigoPostal.Top := LDireccionCodigoPostal.Top - SepVertical;
        DBEDireccionCodigoPostal.Top := DBEDireccionCodigoPostal.Top - SepVertical;
        EDireccionCodigoPostal.Top := EDireccionCodigoPostal.Top - SepVertical;
        LDireccionesColonia.Top := LDireccionesColonia.Top - SepVertical;
        DBEDireccionesColonia.Top := DBEDireccionesColonia.Top - SepVertical;
     end;

     // Verificamos si existen regiones, provincias poblacion para ese pais
     if (not DMTerceros.ExistenDatosDireccionPais(DBEDireccionPais.Text)) then
     begin
        DBEDireccionRegion.Enabled := False;
        DBEDireccionProvincia.Enabled := False;
        DBEDireccionPoblacion.Enabled := False;
        DBEDireccionCodigoPostal.Enabled := False;
        DBEDireccionesColonia.Enabled := False;
        // DBDireccionDireccionLiteral.SetFocus;

        DBEDireccionRegion.Color := clSilver;
        DBEDireccionProvincia.Color := clSilver;
        DBEDireccionPoblacion.Color := clSilver;
        DBEDireccionCodigoPostal.Color := clSkyBlue;
        DBEDireccionesColonia.Color := clSilver;
     end
     else
     begin
        DBEDireccionRegion.Enabled := True;
        DBEDireccionProvincia.Enabled := True;
        DBEDireccionPoblacion.Enabled := True;
        DBEDireccionCodigoPostal.Enabled := True;
        DBEDireccionesColonia.Enabled := True;

        DBEDireccionRegion.Color := clWindow;
        DBEDireccionProvincia.Color := clWindow;
        DBEDireccionPoblacion.Color := clWindow;
        DBEDireccionCodigoPostal.Color := clSkyBlue;
        DBEDireccionesColonia.Color := clWindow;
     end;

     DBEDireccionRegion.ReadOnly := not DBEDireccionRegion.Enabled;
     DBEDireccionProvincia.ReadOnly := not DBEDireccionProvincia.Enabled;
     DBEDireccionPoblacion.ReadOnly := not DBEDireccionPoblacion.Enabled;
     DBEDireccionCodigoPostal.ReadOnly := not DBEDireccionCodigoPostal.Enabled;
     DBEDireccionesColonia.ReadOnly := not DBEDireccionesColonia.Enabled;
  end;
end;

procedure TFMTerceros.DBEFTransportistaFichaChange(Sender: TObject);
begin
  inherited;
  ETransportistaFichaTitulo.Text := DameTituloAcreedor(StrToIntDef(DBEFTransportistaFicha.Text, 0));
end;

procedure TFMTerceros.DBEDirClaseChange(Sender: TObject);
begin
  inherited;
  EDirClaseTitulo.Text := DameTituloClaseDireccion(StrToIntDef(DBEDirClase.Text, -1));
end;

procedure TFMTerceros.DBEDireccionPaisChange(Sender: TObject);
var
  TituloRegion, TituloProvincia, TituloPoblacion : string;
begin
  inherited;
  if (DBEDireccionPais.Text > '') then
  begin
     EDireccionPais.Text := DameTituloPais(DBEDireccionPais.Text);

     // Determinamos si la direccion es de 3 o 4 niveles para mostrar los campos necesarios
     PosicionaElementosDireccion(DMTerceros.QMDireccionesPAIS_DIRECCION.AsString);

     // Asignamos titulos a datos a campos de direccion
     DMMain.DameDatosPais(DBEDireccionPais.Text, TituloRegion, TituloProvincia, TituloPoblacion);
     LDireccionRegion.Caption := TituloRegion;
     LDireccionesProvincia.Caption := TituloProvincia;
     LDireccionPoblacion.Caption := TituloPoblacion;
  end;
end;

procedure TFMTerceros.DBEDireccionRegionChange(Sender: TObject);
begin
  inherited;
  if ((DMTerceros.QMDireccionesPAIS_DIRECCION.AsString > '') and (DBEDireccionRegion.Text > '')) then
     EDireccionRegion.Text := DameTituloRegion(DMTerceros.QMDireccionesPAIS_DIRECCION.AsString, DBEDireccionRegion.Text)
  else
     EDireccionRegion.Text := '';
end;

procedure TFMTerceros.DBEDireccionRegionBusqueda(Sender: TObject);
begin
  inherited;
  with DBEDireccionRegion do
     CondicionBusqueda := 'PAIS = ''' + DBEDireccionPais.Text + '''';
end;

procedure TFMTerceros.DBEDireccionProvinciaChange(Sender: TObject);
begin
  inherited;
  if (DMTerceros.QMDireccionesPAIS_DIRECCION.AsString > '') then
     EDireccionProvincia.Text := DameTituloProvincia(DMTerceros.QMDireccionesPAIS_DIRECCION.AsString, DBEDireccionProvincia.Text)
  else
     EDireccionProvincia.Text := '';
end;

procedure TFMTerceros.DBEDireccionProvinciaBusqueda(Sender: TObject);
begin
  inherited;
  with DBEDireccionProvincia do
  begin
     CondicionBusqueda := 'PAIS = ''' + DBEDireccionPais.Text + '''';
     if ((Trim(DBEDireccionRegion.Text) > '') and (Trim(DBEDireccionRegion.Text) <> 'ZZZ')) then
        CondicionBusqueda := CondicionBusqueda + ' AND REGION = ''' + DBEDireccionRegion.Text + '''';
  end;
end;

procedure TFMTerceros.DBEDireccionPoblacionChange(Sender: TObject);
begin
  inherited;
  if (DMTerceros.QMDireccionesPAIS_DIRECCION.AsString > '') then
     EDireccionPoblacion.Text := DameTituloPoblacion(DMTerceros.QMDireccionesPAIS_DIRECCION.AsString, DBEDireccionPoblacion.Text)
  else
     EDireccionPoblacion.Text := '';
end;

procedure TFMTerceros.DBEDireccionPoblacionBusqueda(Sender: TObject);
begin
  inherited;
  with DBEDireccionPoblacion do
  begin
     CondicionBusqueda := 'PAIS = ''' + DMTerceros.QMDireccionesPAIS_DIRECCION.Text + '''';
     if (Trim(DBEDireccionProvincia.Text) > '') then
        CondicionBusqueda := CondicionBusqueda + ' AND PROVINCIA = ''' + DBEDireccionProvincia.Text + '''';
  end;
end;

procedure TFMTerceros.DBEDireccionCodigoPostalChange(Sender: TObject);
var
  Region, Provincia, Poblacion : string;
begin
  inherited;
  if ((DBEDireccionPais.Text > '') and (DBEDireccionCodigoPostal.Text > '')) then
  begin
     EDireccionCodigoPostal.Text := DameTituloCodigoPostal(DBEDireccionPais.Text, DBEDireccionCodigoPostal.Text);

     if ((DBEDireccionRegion.Text = '') and (DBEDireccionProvincia.Text = '') and (DBEDireccionPoblacion.Text = '')) then
     begin
        DMTerceros.BuscaDatosDireccionCP(DMTerceros.QMDireccionesPAIS_DIRECCION.AsString, DBEDireccionCodigoPostal.Text, Region, Provincia, Poblacion);
        if (Region > '') then
           DMTerceros.QMDireccionesREGION.AsString := Region;
        if (Provincia > '') then
           DMTerceros.QMDireccionesPROVINCIA.AsString := Provincia;
        if (Poblacion > '') then
           DMTerceros.QMDireccionesPOBLACION.AsString := Poblacion;
     end;
  end
  else
     EDireccionCodigoPostal.Text := '';
end;

procedure TFMTerceros.DBEDireccionCodigoPostalBusqueda(Sender: TObject);
begin
  inherited;
  with DBEDireccionCodigoPostal do
  begin
     CondicionBusqueda := 'PAIS = ''' + DMTerceros.QMDireccionesPAIS_DIRECCION.AsString + '''';
     if ((Trim(DBEDireccionPoblacion.Text) > '') and (Trim(DBEDireccionPoblacion.Text) <> 'ZZZ')) then
        CondicionBusqueda := CondicionBusqueda + ' AND POBLACION = ''' + DBEDireccionPoblacion.Text + '''';
  end;

end;

procedure TFMTerceros.ACRMExecute(Sender: TObject);
begin
  inherited;
  if (DMTerceros.VerificaExisteEnTercero(DMTerceros.QMTercerosTERCERO.AsInteger, 'CRM')) then
     FMain.EjecutaAccion(FMain.ACrmContactos, 'TERCERO = ' + IntToStr(DMTerceros.QMTercerosTERCERO.AsInteger))
  else
  if EstructuraCreada then
  begin
     FMain.autcrm := True;
     FMain.EjecutaAccion(FMain.ACrmContactos);
     CrmFMContactos.Tercero_a_Crm(StrToInt(DBETercero.Text));
  end;
end;

procedure TFMTerceros.AEmpleadoExecute(Sender: TObject);
begin
  inherited;
  if (DMTerceros.VerificaExisteEnTercero(DMTerceros.QMTercerosTERCERO.AsInteger, 'OPE')) then
     FMain.EjecutaAccion(FMain.AOpeEmpleados, 'TERCERO = ' + IntToStr(DMTerceros.QMTercerosTERCERO.AsInteger))
  else
  if EstructuraCreada then
  begin
     FMain.autempleado := True;
     FMain.EjecutaAccion(FMain.AOpeEmpleados);
     OpeFMEmpleados.Tercero_a_Empleado(StrToInt(DBETercero.Text));
  end;
end;

procedure TFMTerceros.MostrarMapa;
var
  Lat, Lon : double;
  FicheroImageMapa : string;
  Imagen : TImage;
begin
  inherited;

  TMRReferescoMapa.Enabled := False;
  if CBVerMapa.Checked then
  begin
     // Tomo coordenadas de la direccion
     if (PCMain.ActivePage = TSFicha) then
     begin
        Imagen := ImgMapaFicha;
        Lat := DMTerceros.QMTercerosLATITUD.AsFloat;
        Lon := DMTerceros.QMTercerosLONGITUD.AsFloat;
     end
     else
     begin
        Imagen := ImgMapaDireccion;
        Lat := DMTerceros.QMDireccionesLATITUD.AsFloat;
        Lon := DMTerceros.QMDireccionesLONGITUD.AsFloat;
     end;

     // Si tengo coordenadas busco imagen de mapa
     FicheroImageMapa := '';
     if ((Lat <> 0) and (Lon <> 0)) then
        FicheroImageMapa := DameImagenMapa(Lat, Lon, True);

     if (FicheroImageMapa > '') then
        CargarImagenDeArchivo(Imagen, FicheroImageMapa, 'JPG')
     else
     begin
        Imagen.Picture := nil;
        TMRReferescoMapa.Enabled := True;
     end;
  end
  else
  begin
     ImgMapaFicha.Picture := nil;
     ImgMapaDireccion.Picture := nil;
  end;
end;

procedure TFMTerceros.TMRReferescoMapaTimer(Sender: TObject);
begin
  inherited;
  TMRReferescoMapa.Enabled := False;

  if (DMTerceros.QMTerceros.Active) then
  begin
     if (PCMain.ActivePage = TSFicha) then
     begin
        // Actualizamos mapa cuando no esta en edicion o insercion de datos
        if ((DMTerceros.QMTerceros.State <> dsEdit) and (DMTerceros.QMTerceros.State <> dsInsert)) then
        begin
           LTituloSinMapa.Visible := (Trim(DMTerceros.QMTercerosDIRECCION_LITERAL.AsString) = '');
           GeneraLocalizacion;
        end;
     end
     else
     if (PCMain.ActivePage = TSDireccion) then
     begin
        if ((DMTerceros.QMDirecciones.State <> dsEdit) and (DMTerceros.QMDirecciones.State <> dsInsert)) then
        begin
           if DMTerceros.QMDirecciones.Active then
           begin
              LTituloDireccionSinMapa.Visible := (Trim(DMTerceros.QMDireccionesDIRECCION_LITERAL.AsString) = '');
              GeneraLocalizacion;
           end;
        end;
     end;
  end;
end;

procedure TFMTerceros.GeneraLocalizacion;
var
  Lat, Lon : double;
  DireccionCompleta : string;
  FicheroImageMapa : string;
  Imagen : TImage;
  Tercero, Direccion : integer;
begin
  if not CBVerMapa.Checked then
  begin
     ImgMapaFicha.Picture := nil;
     ImgMapaDireccion.Picture := nil;
  end
  else
  begin
     // Tomo coordenadas de la direccion
     if (PCMain.ActivePage = TSFicha) then
     begin
        Tercero := DMTerceros.QMTercerosTERCERO.AsInteger;
        Direccion := DMTerceros.QMTercerosDIRECCION.AsInteger;
        Imagen := ImgMapaFicha;
        DireccionCompleta := Trim(QuitarAcentosTexto(DMTerceros.QMTercerosDIRECCION_LITERAL.AsString));
        Lat := DMTerceros.QMTercerosLATITUD.AsFloat;
        Lon := DMTerceros.QMTercerosLONGITUD.AsFloat;
     end
     else
     begin
        Tercero := DMTerceros.QMDireccionesTERCERO.AsInteger;
        Direccion := DMTerceros.QMDireccionesDIRECCION.AsInteger;
        Imagen := ImgMapaDireccion;
        DireccionCompleta := Trim(QuitarAcentosTexto(DMTerceros.QMDireccionesDIRECCION_LITERAL.AsString));
        Lat := DMTerceros.QMDireccionesLATITUD.AsFloat;
        Lon := DMTerceros.QMDireccionesLONGITUD.AsFloat;
     end;

     try
        // Si estan vacias las obtengo segun direccion
        if ((Lat = 0) and (Lon = 0)) then
        begin
           DameCoordenadasDireccion(DireccionCompleta, Lat, Lon);

           if ((Lat <> 0) and (Lon <> 0)) then
           begin
              DMTerceros.ActualizaCoordenadas(Tercero, Direccion, Lat, Lon);
              if (PCMain.ActivePage = TSFicha) then
                 DMTerceros.QMTerceros.Refresh
              else
                 DMTerceros.QMDirecciones.Refresh;
           end;
        end;

        // Si tengo coordenadas busco imagen de mapa
        if ((Lat <> 0) and (Lon <> 0)) then
        begin
           FicheroImageMapa := DameImagenMapa(Lat, Lon);
           if (FicheroImageMapa > '') then
              CargarImagenDeArchivo(Imagen, FicheroImageMapa, 'JPG')
           else
              Imagen.Picture := nil;
        end
        else
        begin
           Imagen.Picture := nil;
        end;
     except
        if Assigned(Imagen) then
           Imagen.Picture := nil;
     end;
  end;
end;

procedure TFMTerceros.DBDirPaisChange(Sender: TObject);
begin
  inherited;
  if (DBDirPais.Text > '') then
  begin
     EDirTituloPais.Text := DameTituloPais(DBDirPais.Text);
  end;
end;

procedure TFMTerceros.DBContPaisChange(Sender: TObject);
begin
  inherited;
  EContTituloPais.Text := DameTituloPais(DBContPais.Text);
end;

procedure TFMTerceros.NavDireccionesClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if ((Button = nbFirst) or (Button = nbPrior) or (Button = nbNext) or (Button = nbLast)) then
  begin
     // Determinamos si la direccion es de 3 o 4 niveles para mostrar los campos necesarios
     PosicionaElementosDireccion(DBEDireccionPais.Text);
  end;
end;

procedure TFMTerceros.DBMDireccionChange(Sender: TObject);
begin
  inherited;
  MostrarMapa;
end;

procedure TFMTerceros.DBDireccionDireccionLiteralChange(Sender: TObject);
begin
  inherited;
  MostrarMapa;
end;

procedure TFMTerceros.DBECifExit(Sender: TObject);
begin
  inherited;
  ValidaDocumentoIdentificacion;
end;

procedure TFMTerceros.SBNuevaLocalidadFichaClick(Sender: TObject);
var
  Localidad : string;
begin
  inherited;
  Localidad := CreaLocalidad(DBEPaisTercero.Text);

  if (Localidad <> '') then
     DMTerceros.QMTercerosDIR_LOCALIDAD.AsString := Localidad;
end;

procedure TFMTerceros.SBNuevaLocalidadDireccionClick(Sender: TObject);
var
  Localidad : string;
begin
  inherited;
  Localidad := CreaLocalidad(DBEPaisTercero.Text);
  if (Localidad <> '') then
     DMTerceros.QMDireccionesDIR_LOCALIDAD.AsString := Localidad;
end;

procedure TFMTerceros.ANet2PhoneExecute(Sender: TObject);
var
  Telefono : string;
begin
  Telefono := Copy(TAction(Sender).Caption, 1, Pos(' ', TAction(Sender).Caption) - 1);
  DMMain.Click2Call(Telefono);
end;

procedure TFMTerceros.TBNet2PhoneClick(Sender: TObject);
var
  i : integer;
  Telefonos : TStrings;

  function CrearMenuItem(i: integer; aCaption: string): TMenuItem;
  var
     NewItem : TMenuItem;
     NewAction : TAction;
  begin
     NewAction := TAction.Create(Self);
     NewAction.Caption := aCaption;
     NewAction.ImageIndex := 58;
     NewAction.Name := 'AMyNet2Phone' + IntToStr(i);
     NewAction.OnExecute := ANet2PhoneExecute;

     NewItem := TMenuItem.Create(PMNet2Phone);
     NewItem.Action := NewAction;
     PMNet2Phone.Items.Add(NewItem);

     Result := NewItem;
  end;

begin
  inherited;

  // Elimino acciones y MenuItems de llamada a telefonos
  for i := PMNet2Phone.Items.Count - 1 downto 0 do
  begin
     PMNet2Phone.Items[i].Action.Free;
     PMNet2Phone.Items[i].Free;
  end;

  Telefonos := TStringList.Create;
  try
     RellenaListaTelefonosTercero(DMTerceros.QMTercerosTERCERO.AsInteger, Telefonos);
     for i := 0 to Telefonos.Count - 1 do
        CrearMenuItem(i, Telefonos[i]);
  finally
     Telefonos.Free;
  end;

  TBNet2Phone.CheckMenuDropdown;
end;

procedure TFMTerceros.TBCreaUsuarioWebClick(Sender: TObject);
var
  UsuarioNuevo : boolean;
begin
  inherited;
  UsuarioNuevo := False;

  with DMTerceros do
  begin
     if (QMContactosID_USUARIO_WEB.AsInteger = 0) then
        UsuarioNuevo := True;

     CreaUsuarioWeb(QMContactosTERCERO.AsInteger, QMContactosCONTACTO.AsInteger, QMContactosDIRECCION.AsInteger, QMContactosAPELLIDOS.AsString + ' ' + QMContactosNOMBRE.AsString, QMContactosCORREO.AsString);

     FMain.EjecutaAccion(FMain.AUsuariosWeb, IntToStr(QMContactosID_USUARIO_WEB.AsInteger));

     if UsuarioNuevo then
        FMUsuariosWeb.UsuarioNuevo;
  end;
end;

procedure TFMTerceros.PCMainChange(Sender: TObject);
begin
  inherited;
  RestringirPestanya;
end;

procedure TFMTerceros.RestringirPestanya;
begin
  // Restringir pestaña si no se pueden ver empleados
  if ((not MostrarEmpleado) and (BAbreEmpleado.Font.Color = clWindowText) and (DMTerceros.QMTercerosTERCERO.AsInteger <> REntorno.Tercero)) then
  begin
     if ((PCMain.ActivePage <> TSFicha) and (PCMain.ActivePage <> TSTabla)) then
        PCMain.ActivePage := TSFicha;
  end;
end;

procedure TFMTerceros.AEmpresasChileExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AEmpresasChile);
end;

procedure TFMTerceros.SBADireccionDblClick(Sender: TObject);
var
  Direccion : string;
begin
  inherited;
  Direccion := Trim(QuitarAcentosTexto(DMTerceros.QMTercerosDIRECCION_LITERAL.AsString));
  Direccion := EscapeURL(Direccion);
  Direccion := 'http://maps.google.com/maps?q=' + Direccion;
  if ShellExecute(Application.Handle, nil, PChar(Direccion), nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('Error en la Página Web'));
end;

procedure TFMTerceros.SBADireccion2DblClick(Sender: TObject);
var
  Direccion : string;
begin
  inherited;
  Direccion := Trim(QuitarAcentosTexto(DMTerceros.QMDireccionesDIRECCION_LITERAL.AsString));
  Direccion := EscapeURL(Direccion);
  Direccion := 'http://maps.google.com/maps?q=' + Direccion;
  if ShellExecute(Application.Handle, nil, PChar(Direccion), nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('Error en la Página Web'));
end;

procedure TFMTerceros.CBVerMapaChange(Sender: TObject);
begin
  inherited;
  MostrarMapa;
end;

procedure TFMTerceros.WMDropFiles(var Msg: TWMDropFiles);
var
  i : integer;
  DropPoint : TPoint;
  RecibeFicheros : TRecibeFicheros;
  Ficheros : TStrings;
begin
  inherited;
  Ficheros := TStringList.Create;
  RecibeFicheros := TRecibeFicheros.Create(Msg.Drop);
  try
     for i := 0 to Pred(RecibeFicheros.FileCount) do
        Ficheros.Add(RecibeFicheros.Files[i]);

     DropPoint := RecibeFicheros.DropPoint;

     if ConfirmaMensaje(_('Esta seguro de importar los archivos?' + #13#10 + Ficheros.Text)) then
     begin
        AbreData(TDMAdjunto, DMAdjunto);
        try
           for i := 0 to Ficheros.Count - 1 do
              DMAdjunto.CreaAdjunto('TER', DMTerceros.QMTercerosTERCERO.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntosTercero.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TFMTerceros.AActualizaCasillaDteDesdeCsvExecute(Sender: TObject);
begin
  inherited;
  DMTerceros.ActualizaCasillasDteDesdeCsv;
end;

procedure TFMTerceros.DBEFTipoCuentaChange(Sender: TObject);
begin
  inherited;
  EDescripcionTipoCuenta.Text := DameTituloTipoCuenta(StrToIntDef(DBEFTipoCuenta.Text, 0));
end;

procedure TFMTerceros.DBEFPaisBancoChange(Sender: TObject);
begin
  inherited;
  EPaisBanco.Text := DameTituloPais(DBEFPaisBanco.Text);
end;

procedure TFMTerceros.DBEFEntidadBusqueda(Sender: TObject);
begin
  inherited;
  DBEFEntidad.CondicionBusqueda := 'PAIS = ''' + DBEFPaisBanco.Text + '''';
end;

procedure TFMTerceros.BObtenerBICClick(Sender: TObject);
begin
  inherited;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST 1 BIC FROM SYS_TERCEROS_BANCOS WHERE TRIM(BIC) > '''' AND PAIS = :PAIS AND ENTIDAD = :ENTIDAD ORDER BY TERCERO DESC';
        Params.ByName['PAIS'].AsString := DBEFPaisBanco.Text;
        Params.ByName['ENTIDAD'].AsString := DBEFEntidad.Text;
        ExecQuery;
        DMTerceros.QMBancosBIC.AsString := Trim(FieldByName['BIC'].AsString);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TFMTerceros.DBETerceroChange(Sender: TObject);
var
  ColorFondo, ColorTexto : TColor;
begin
  inherited;
  DBTValidacionResultado.Hint := DBTValidacionResultado.Caption;
  DBTValidacionNombre.Hint := DBTValidacionNombre.Caption;

  if (DMTerceros.QMTercerosNIF.AsString = '') or (DBTValidacionResultado.Caption = '') or (DBTValidacionResultado.Caption = 'IDENTIFICADO') or (DBTValidacionResultado.Caption = 'VALIDO') then
  begin
     ColorFondo := clBtnFace;
     ColorTexto := clWindowText;
  end
  else
  begin
     ColorFondo := clRed;
     ColorTexto := clWhite;
  end;

  DBTValidacionResultado.Color := ColorFondo;
  DBTValidacionNombre.Color := ColorFondo;
  DBTValidacionFechaCombrobacion.Color := ColorFondo;
  DBTValidacionResultado.Font.Color := ColorTexto;
  DBTValidacionNombre.Font.Color := ColorTexto;
  DBTValidacionFechaCombrobacion.Font.Color := ColorTexto;
end;

end.
