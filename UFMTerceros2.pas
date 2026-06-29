unit UFMTerceros2;

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
  ULFDBDateEdit, RxLookup;

type
  TFMTerceros2 = class(TFPEdit)
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
     DBE_C_InfoTit: TLFDbedit;
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
     Lbl_Tipo: TLFLabel;
     Lbl_Num: TLFLabel;
     Lbl_Blq: TLFLabel;
     Lbl_Piso: TLFLabel;
     LDireccionesLocalidad: TLFLabel;
     LDireccionesProvincia: TLFLabel;
     LDireccionesDireccion: TLFLabel;
     DBE_D_Calle: TLFDbedit;
     DBE_D_Num: TLFDbedit;
     DBE_D_BloqEsc: TLFDbedit;
     DBE_D_Piso: TLFDbedit;
     DBE_D_TituloLocalidad: TLFDbedit;
     DBE_D_CPLocalidad: TLFDbedit;
     DBE_D_Pais: TLFDbedit;
     DBE_D_Provincia: TLFDbedit;
     DBE_D_Direccion: TLFDbedit;
     LTercero: TLFLabel;
     LNombre: TLFLabel;
     LDireccion2: TLFLabel;
     LLocalidad: TLFLabel;
     LTelefonos: TLFLabel;
     LWeb: TLFLabel;
     LProvincia: TLFLabel;
     LFax: TLFLabel;
     LNumero: TLFLabel;
     LBLoqueEscalera: TLFLabel;
     LPiso: TLFLabel;
     LFechaAlta: TLFLabel;
     DBETercero: TLFDbedit;
     DBENombre: TLFDbedit;
     DBECif: TLFDbedit;
     DBETelefono1: TLFDbedit;
     DBETelefono2: TLFDbedit;
     DBETelefax: TLFDbedit;
     DBEEmail: TLFDbedit;
     DBEWeb: TLFDbedit;
     DBELocalidadNombre: TLFDbedit;
     DBECpostal: TLFDbedit;
     DBEProvincia: TLFDbedit;
     DBEPais: TLFDbedit;
     EFLocalidad: TLFDBEditFind2000;
     DBE_TitRazones: TLFDbedit;
     DBEDirNombre: TLFDbedit;
     DBEDirBloqEsc: TLFDbedit;
     DBEDirPiso: TLFDbedit;
     DBEDirNumero: TLFDbedit;
     DBEInfoAlta: TLFDbedit;
     TSDi_Ficha: TTabSheet;
     TSDi_Tabla: TTabSheet;
     DBG_Direcciones: THYTDBGrid;
     CEContactosPMEdit: TPopUpTeclas;
     CEDireccionesPMEdit: TPopUpTeclas;
     CECuentasPMEdit: TPopUpTeclas;
     DBE_C_Movil: TLFDbedit;
     LContactoMovil: TLFLabel;
     DBETipoDir: TLFDBEditFind2000;
     DBE_D_CodLocalidad: TLFDBEditFind2000;
     DBE_D_Tipo: TLFDBEditFind2000;
     DBT_TipDir_T: TDBText;
     DBT_TipDir_D: TDBText;
     PCDirecciones: TLFPageControl;
     TSCuentas: TTabSheet;
     DBEDirPuerta: TLFDbedit;
     LPuerta: TLFLabel;
     DBE_D_Puerta: TLFDbedit;
     Puertas: TLFLabel;
     DBEDireccion2: TLFDbedit;
     DBENombreComercial: TLFDbedit;
     LNombreComercial: TLFLabel;
     DBE_D_Direccion2: TLFDbedit;
     LDireccionesDireccion2: TLFLabel;
     LBancoTitular: TLFLabel;
     DBETipoRazon: TLFDBEditFind2000;
     SBCli: TSpeedButton;
     SBPro: TSpeedButton;
     SBAcr: TSpeedButton;
     SBAge: TSpeedButton;
     LBCreacionAutomatica: TLFLabel;
     LBLRazonSocial: TLFLabel;
     LDireccionesTelefonos: TLFLabel;
     DBETel01: TLFDbedit;
     DBETel02: TLFDbedit;
     LDireccionesFAX: TLFLabel;
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
     DBCBCLientePotencialKRI: TLFDBCheckBox;
     DBNotasDireccionKri: TLFDBMemo;
     LNotasKri: TLFLabel;
     DBEEAN13: TLFDBEdit;
     LEAN13: TLFLabel;
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
     PBtnMaestros: TLFPanel;
     FBHaciaCliente: TFlatButton;
     FBHaciaProveedor: TFlatButton;
     FBHaciaAcreedor: TFlatButton;
     FBHaciaAgente: TFlatButton;
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
     TBSep2: TToolButton;
     AVerificaNIF: TAction;
     SBPot: TSpeedButton;
     FBHaciaClientePotencial: TFlatButton;
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
     DBEFTransportista: TLFDBEditFind2000;
     ETransportista: TLFEdit;
     LDireccionesTercero: TLFLabel;
     SBCrm: TSpeedButton;
     FBHaciaCRM: TFlatButton;
     PNLCreacionAutomaticaMaestros: TLFPanel;
     LColonia: TLFLabel;
     DBEColonia: TLFDbedit;
     LEmail: TLFLabel;
     LDireccionesColonia: TLFLabel;
     DBEDireccionesColonia: TLFDbedit;
     SBAWeb: TSpeedButton;
     SBAEmail: TSpeedButton;
     SBADireccion: TSpeedButton;
     SBADireccion2: TSpeedButton;
     SABContactosEmail: TSpeedButton;
     DBE_D_Direccion3: TLFDbedit;
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
     AImprimirCartaSpeedLock: TAction;
     AVisualizarCartaSpeedLock: TAction;
     AListConfigCartaSpeedLock: TAction;
     ACreaTercerosRandom: TAction;
     AReemplazaCarateres: TAction;
     DBRGTipoContrato: TDBRadioGroup;
     LFCategoryAction5: TLFCategoryAction;
     LFCategoryAction6: TLFCategoryAction;
     AEnviarEmailCartaSEPA: TAction;
     AEnviarEmailCartaSpeedLock: TAction;
     ACalculaIBAN: TAction;
     BCargarImagen: TButton;
     ARenombraTercerosRandom: TAction;
     LFechaNacimiento: TLFLabel;
     DBEFechaNacimiento: TLFDBDateEdit;
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
     AEnviarEmailCartaSpeedLock2: TAction;
     PNLBusqueda: TLFPanel;
     LCarnetAplicador: TLFLabel;
     DBECarnetAplicador: TLFDbedit;
     LRegistroMercantil: TLFLabel;
     DBERegistroMercantil: TLFDbedit;
     DBDTPFechaValidezCarnet: TLFDBDateEdit;
     LFechaValidezCarnet: TLFLabel;
     APedirFirma: TAction;
     ABorrarFirma: TAction;
     BClipboard: TButton;
     LBancoDireccion: TLFLabel;
     DBEFBancoDireccion: TLFDBEditFind2000;
     EBancoDireccion: TLFEdit;
     AEmpleado: TAction;
     ACRM: TAction;
     LTipoDocumento: TLFLabel;
     DBETipoDocumento: TLFDBEditFind2000;
     ETipoDocumentoTitulo: TLFEdit;
     DBEPaisTercero: TLFDBEditFind2000;
     SBNuevaLocalidadFicha: TSpeedButton;
     SBNuevaLocalidadDireccion: TSpeedButton;
     TButtTransportistaSegunCP: TButton;
     LIdUsuarioWeb: TLFLabel;
     DBEIdUsuarioWeb: TLFDbedit;
     TBSep1: TToolButton;
     TBCreaUsuarioWeb: TToolButton;
     SBEmpleado: TSpeedButton;
     LHorario: TLFLabel;
     DBEHorario: TLFDbedit;
     LMedios: TLFLabel;
     DBEMedios: TLFDbedit;
     LDirCorreo: TLFLabel;
     LDirContacto: TLFLabel;
     DBEDirCorreo: TLFDbedit;
     DBEDirContacto: TLFDbedit;
     TBEmpresasChile: TToolButton;
     TBSepEmpresasChile: TToolButton;
     AEmpresasChile: TAction;
     LFCategoryAction8: TLFCategoryAction;
     LTipoCuenta: TLFLabel;
     DBEFTipoCuenta: TLFDBEditFind2000;
     EDescripcionTipoCuenta: TLFEdit;
     LPaisBanco: TLFLabel;
     DBEFPaisBanco: TLFDBEditFind2000;
     EPaisBanco: TLFEdit;
     FBHaciaEmpleado: TFlatButton;
     DBLCComoNosConocieron: TRxDBLookupCombo;
     LDBLCComoNosConocieron: TLFLabel;
     BObtenerBIC: TButton;
     DBTValidacionResultado: TDBText;
     DBTValidacionNombre: TDBText;
     DBTValidacionFechaCombrobacion: TDBText;
     LValidacionDocumento: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure Btn_C_SalirClick(Sender: TObject);
     procedure TSDireccionesShow(Sender: TObject);
     procedure TSContactosShow(Sender: TObject);
     procedure TSNotasShow(Sender: TObject);
     procedure TSDi_TablaShow(Sender: TObject);
     procedure DBEFEntidadChange(Sender: TObject);
     procedure DBENombreExit(Sender: TObject);
     procedure TSCuentasShow(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TSCo_TablaShow(Sender: TObject);
     procedure TSCu_TablaShow(Sender: TObject);
     procedure MuestraFiltrado(tipo: byte);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure TSFichaShow(Sender: TObject);
     procedure MIListConfigClick(Sender: TObject);
     procedure PCMainChanging(Sender: TObject; var AllowChange: boolean);
     procedure SBCliClick(Sender: TObject);
     procedure SBProClick(Sender: TObject);
     procedure SBAcrClick(Sender: TObject);
     procedure SBAgeClick(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure DBSE_B_OrdenChange(Sender: TObject);
     procedure EFLocalidadBusqueda(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure SBHaciaClienteClick(Sender: TObject);
     procedure SBHaciaProveedorClick(Sender: TObject);
     procedure SBHaciaAcreedorClick(Sender: TObject);
     procedure SBHaciaAgenteClick(Sender: TObject);
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
     procedure DBEFTransportistaChange(Sender: TObject);
     procedure SBCrmClick(Sender: TObject);
     procedure FBHaciaCRMClick(Sender: TObject);
     procedure SBAEmailDblClick(Sender: TObject);
     procedure SBAWebDblClick(Sender: TObject);
     procedure SABContactosEmailDblClick(Sender: TObject);
     procedure AImprimirNotasExecute(Sender: TObject);
     procedure DBEIBANChange(Sender: TObject);
     procedure AImprimirCartaSEPAExecute(Sender: TObject);
     procedure AVisualizarCartaSEPAExecute(Sender: TObject);
     procedure AListConfigCartaSEPAExecute(Sender: TObject);
     procedure AImprimirCartaSpeedLockExecute(Sender: TObject);
     procedure AVisualizarCartaSpeedLockExecute(Sender: TObject);
     procedure AListConfigCartaSpeedLockExecute(Sender: TObject);
     procedure ACreaTercerosRandomExecute(Sender: TObject);
     procedure AReemplazaCarateresExecute(Sender: TObject);
     procedure AEnviarEmailCartaSEPAExecute(Sender: TObject);
     procedure AEnviarEmailCartaSpeedLockExecute(Sender: TObject);
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
     procedure AEnviarEmailCartaSpeedLock2Execute(Sender: TObject);
     procedure APedirFirmaExecute(Sender: TObject);
     procedure ABorrarFirmaExecute(Sender: TObject);
     procedure BClipboardClick(Sender: TObject);
     procedure DBEFBancoDireccionBusqueda(Sender: TObject);
     procedure DBEFBancoDireccionChange(Sender: TObject);
     procedure ACRMExecute(Sender: TObject);
     procedure AEmpleadoExecute(Sender: TObject);
     procedure DBETipoDocumentoBusqueda(Sender: TObject);
     procedure DBETipoDocumentoChange(Sender: TObject);
     procedure DBEPaisTerceroChange(Sender: TObject);
     procedure DBECifExit(Sender: TObject);
     procedure SBNuevaLocalidadFichaClick(Sender: TObject);
     procedure SBNuevaLocalidadDireccionClick(Sender: TObject);
     procedure TButtTransportistaSegunCPClick(Sender: TObject);
     procedure TBCreaUsuarioWebClick(Sender: TObject);
     procedure SBEmpleadoClick(Sender: TObject);
     procedure PCMainChange(Sender: TObject);
     procedure AEmpresasChileExecute(Sender: TObject);
     procedure SBADireccionDblClick(Sender: TObject);
     procedure SBADireccion2DblClick(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure FormShow(Sender: TObject);
     procedure DBEFTipoCuentaChange(Sender: TObject);
     procedure DBEFPaisBancoChange(Sender: TObject);
     procedure DBEFEntidadBusqueda(Sender: TObject);
     procedure FBHaciaEmpleadoClick(Sender: TObject);
     procedure BObtenerBICClick(Sender: TObject);
     procedure DBETerceroChange(Sender: TObject);
  private
     { Private declarations }
     Primera: boolean;
     EvitaMultipleCliProAcrPorTercero: boolean;
     MostrarEmpleado: boolean;
     PNLOcultaInfoBottom: TLFPanel;
     PNLOcultaInfoRight: TLFPanel;
     procedure Reconectar_Tablas;
     procedure CompruebaCuentaBancaria;
     procedure ValidaDocumentoIdentificacion;
     procedure RestringirPestanya;
  public
     { Public declarations }
     procedure TraspasosActivos(Activacion: integer);
     procedure PonBotones;
     procedure InsertarTercero;
     procedure FiltraTercero(Filtro: string);
     procedure PosicionaDireccion(Direccion: integer);
     procedure PosicionaContacto(Contacto: integer);
     procedure CreaArbolContactos;
  end;

var
  FMTerceros2 : TFMTerceros2;

implementation

uses UDMMain, UFMain, UUtiles, UDameDato, UEntorno, UFormGest, UDMTerceros2, UDMLstTerceros, UFMListConfig,
  UFMClientes, UDMClientes, UFMProveedores, UFMAcreedores, UFMAgentes,
  UFMClientesPotencialesKri, UFMIncidencias, UFMAdjunto, UCrmFMContactos, UOpeFMEmpleados,
  UParam, UFMCreaLocalidad, URecibeFicheros, UDMAdjunto, UFMUsuariosWeb, UImagenes;

{$R *.DFM}

procedure TFMTerceros2.FormCreate(Sender: TObject);
var
  i : integer;
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);
  MostrarEmpleado := FMain.FormularioEmpleadoHabilitado;
  PNLOcultaInfoBottom := nil;
  PNLOcultaInfoRight := nil;

  AbreData(TDMTerceros2, DMTerceros2);
  NavMain.DataSource := DMTerceros2.DSQMTerceros;
  EPMain.DataSource := DMTerceros2.DSQMTerceros;
  DBGMain.DataSource := DMTerceros2.DSQMTerceros;
  G2KTableLoc.DataSource := DMTerceros2.DSQMTerceros; {dji lrk kri}
  PCMain.ActivePage := TSFicha;
  Campo := DMTerceros2.QMTercerosTERCERO;

  EvitaMultipleCliProAcrPorTercero := (LeeParametro('TERDUPL001') = 'S');

  SBPot.Visible := False;
  FBHaciaClientePotencial.Visible := False;
  if (LeeParametro('MODREST016') = 'S') then
  begin
     SBPot.Visible := True;
     FBHaciaClientePotencial.Visible := True;
  end;

  // Modulo CRM habilitado?
  SBCrm.Visible := False;
  FBHaciaCRM.Visible := False;
  ACRM.Visible := False;
  if (LeeParametro('MODREST002') = 'S') then
  begin
     SBCrm.Visible := True;
     FBHaciaCRM.Visible := True;
     ACRM.Visible := True;
  end;

  if MostrarEmpleado then
  begin
     SBEmpleado.Visible := True;
     FBHaciaEmpleado.Visible := True;
     AEmpleado.Visible := True;
  end;

  if ((REntorno.Usuario <> 1) and (REntorno.Delegacion = 'S')) then // dji lrk kri
  begin
     NavMain.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
     NavInfo.VisibleButtons := [nbRefresh];
     NavDirecciones.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
     NavContactos.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
     NavCuentas.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
     FBHAciaCliente.Visible := False;
     FBHAciaProveedor.Visible := False;
     FBHAciaAcreedor.Visible := False;
     FBHAciaAgente.Visible := False;
     FBHaciaCRM.Visible := False;
     FBHaciaClientePotencial.Visible := False;
     FBHaciaEmpleado.Visible := False;
  end;

  i := 0;
  FBHaciaCliente.Left := i;
  if FBHaciaCliente.Visible then
     i := i + 32;
  FBHAciaProveedor.Left := i;
  if FBHAciaProveedor.Visible then
     i := i + 32;
  FBHAciaAcreedor.Left := i;
  if FBHAciaAcreedor.Visible then
     i := i + 32;
  FBHAciaAgente.Left := i;
  if FBHAciaAgente.Visible then
     i := i + 32;
  FBHaciaCRM.Left := i;
  if FBHaciaCRM.Visible then
     i := i + 32;
  FBHaciaClientePotencial.Left := i;
  if FBHaciaClientePotencial.Visible then
     i := i + 32;
  FBHaciaEmpleado.Left := i;
  // if FBHaciaEmpleado.Visible then
  //    i := i + 32;

  // Determino si se ve el Edit de Colonia.
  // Si no se ve, debo hacerlo invisible y mover los demás Edits hacia arriba
  if (DMMain.EstadoKri(427) <> 1) then
  begin
     {
     // Cuarta Linea
     LFechaAlta.Top := LWeb.Top;
     DBCBCLientePotencialKRI.Top := LWeb.Top;
     DBEInfoAlta.Top := DBEWeb.Top;
     }
     // Tercera Linea
     LWeb.Top := LEmail.Top;
     DBEWeb.Top := DBEEmail.Top;
     // Segunda Linea
     LEmail.Top := LTelefonos.Top;
     DBEEmail.Top := DBETelefono1.Top;
     // Primera Linea
     LTelefonos.Top := LColonia.Top;
     LFax.Top := LColonia.Top;
     DBETelefono1.Top := DBEColonia.Top;
     DBETelefono2.Top := DBEColonia.Top;
     DBETelefax.Top := DBEColonia.Top;
     LColonia.Visible := False;
     DBEColonia.Visible := False;

     // Lo mismo en la pestaña de direcciones

     {
     // Extiendo la nota para ocupar la linea que sobra
     DBNotasDireccionKri.Height := DBNotasDireccionKri.Height + LNotasKri.Top - LDireccionesTelefonos.Top + 1;
     // Segunda Linea
     LNotasKri.Top := LDireccionesTelefonos.Top;
     DBNotasDireccionKri.Top := DBETel01.Top;
     }

     // Primera Linea
     LDireccionesTelefonos.Top := LDireccionesColonia.Top;
     LDireccionesFAX.Top := LDireccionesColonia.Top;
     DBETel01.Top := DBEDireccionesColonia.Top;
     DBETel02.Top := DBEDireccionesColonia.Top;
     DBEFax.Top := DBEDireccionesColonia.Top;
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

  // Accion para crear 300 clientes al azar
  ACreaTercerosRandom.Visible := False;
  ARenombraTercerosRandom.Visible := False;
  AReemplazaCarateres.Visible := False;

  // Habilitamos elementos especificos para Chile
  if (REntorno.Pais = 'CHL') then
  begin
     TBSepEmpresasChile.Visible := True;
     TBEmpresasChile.Visible := True;
  end
  else
  begin
     TBSepEmpresasChile.Visible := False;
     TBEmpresasChile.Visible := False;
  end;

  AImprimirCartaSpeedLock.Enabled := False;
  AVisualizarCartaSpeedLock.Enabled := False;
  AEnviarEmailCartaSpeedLock.Enabled := False;
  AEnviarEmailCartaSpeedLock2.Enabled := False;

  {$IFDEF Debug}
  ACreaTercerosRandom.Visible := True;
  ARenombraTercerosRandom.Visible := True;
  AReemplazaCarateres.Visible := True;
  {$ENDIF}
end;

procedure TFMTerceros2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(DMTerceros2);
end;

procedure TFMTerceros2.Btn_C_SalirClick(Sender: TObject);
begin
  TSFicha.Show;
end;

procedure TFMTerceros2.TSDireccionesShow(Sender: TObject);
begin
  DMTerceros2.AbrirDirecciones;
  ControlEdit := CEDirecciones;
  // EFDireccionTerceroKri.CondicionBusqueda := 'TERCERO='+IntToStr(DMTerceros2.QMTercerosTERCERO.AsInteger);
end;

procedure TFMTerceros2.TSContactosShow(Sender: TObject);
begin
  DMTerceros2.AbrirContactos;
  ControlEdit := CEContactos;
  AImprimirCartaSpeedLock.Enabled := True;
  AVisualizarCartaSpeedLock.Enabled := True;
  AEnviarEmailCartaSpeedLock.Enabled := True;
  AEnviarEmailCartaSpeedLock2.Enabled := True;
  // EFContactoKri.CondicionBusqueda := 'TERCERO='+IntToStr(DMTerceros2.QMTercerosTERCERO.AsInteger);
end;

procedure TFMTerceros2.TSNotasShow(Sender: TObject);
begin
  ControlEdit := CEInfo;
end;

procedure TFMTerceros2.TSDi_TablaShow(Sender: TObject);
begin
  DBG_Direcciones.SetFocus;
end;

procedure TFMTerceros2.DBEFEntidadChange(Sender: TObject);
begin
  CompruebaCuentaBancaria;
  if not TDBEdit(Sender).Focused then
     Exit;
  if Length(TDBEdit(Sender).Text) = TDBEdit(Sender).MaxLength then
     SelectNext(TDBEdit(Sender), True, True);
end;

procedure TFMTerceros2.DBENombreExit(Sender: TObject);
begin
  if (DBENombreComercial.Text = '') and (DBENombre.Text = '') then
     raise Exception.Create(_('No puede haber un tercero sin nombre'));
end;

procedure TFMTerceros2.TSCuentasShow(Sender: TObject);
begin
  DMTerceros2.AbrirCuentas;
  ControlEdit := CECuentas;
end;

procedure TFMTerceros2.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMTerceros2.BusquedaCompleja;
  Continua := False;
  Reconectar_Tablas;
  PonBotones;
  RestringirPestanya;
end;

procedure TFMTerceros2.TSCo_TablaShow(Sender: TObject);
begin
  DBG_Contactos.SetFocus;
end;

procedure TFMTerceros2.TSCu_TablaShow(Sender: TObject);
begin
  DBG_Cuentas.SetFocus;
end;

procedure TFMTerceros2.MuestraFiltrado(tipo: byte);
begin
  AbreData(TDMLstTerceros, DMLstTerceros);
  DMLstTerceros.FiltraTerceros(DMTerceros2.QMTerceros.SelectSQL);
  DMLstTerceros.MostrarListadoFiltrado(tipo);
  CierraData(DMLstTerceros);
end;

procedure TFMTerceros2.PonBotones;
var
  Cliente, Proveedor, Acreedor, Agente, Empleado, Potencial, Crm : boolean;
begin
  DMTerceros2.QueEs(DMTerceros2.QMTercerosTERCERO.AsInteger, Cliente, Proveedor, Acreedor, Agente, Empleado, Potencial, Crm);

  SBCli.Enabled := Cliente;
  SBPro.Enabled := Proveedor;
  SBAcr.Enabled := Acreedor;
  SBAge.Enabled := Agente;
  SBEmpleado.Enabled := Empleado;
  if (SBCrm.Visible) then
     SBCrm.Enabled := Crm;
  if (SBPot.Visible) then
     SBPot.Enabled := Potencial;

  if ((Empleado) and (DMTerceros2.QMTercerosTERCERO.AsInteger <> REntorno.Tercero)) then
  begin
     if not MostrarEmpleado then
     begin
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
     end;
  end
  else
  begin
     if not MostrarEmpleado then
     begin
        FreeAndNil(PNLOcultaInfoBottom);
        FreeAndNil(PNLOcultaInfoRight);
     end;
  end;

  if (EvitaMultipleCliProAcrPorTercero) then
  begin
     FBHaciaCliente.Enabled := not Cliente;
     FBHaciaProveedor.Enabled := not Proveedor;
     FBHaciaAcreedor.Enabled := not Acreedor;
     FBHaciaAgente.Enabled := not Agente;
     FBHaciaClientePotencial.Enabled := not Potencial;
     FBHaciaCRM.Enabled := not Crm;
     FBHaciaEmpleado.Enabled := not Empleado;
  end;
end;

procedure TFMTerceros2.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  PonBotones;

  RestringirPestanya;

  if FMain.SourceCallTer = True then
  begin
     FMain.SourceCallTer := False;
     Close;
  end;

  SBNuevaLocalidadFicha.Visible := (Button in [nbEdit, nbInsert]);

  if Button = nbPost then
     ValidaDocumentoIdentificacion;
end;

procedure TFMTerceros2.TSFichaShow(Sender: TObject);
begin
  ControlEdit := CEMain;
  DMTerceros2.AbrirFicha;
  PonBotones;
end;

procedure TFMTerceros2.MIListConfigClick(Sender: TObject);
begin
end;

// Vuelve a conectar las tablas pertinentes después de la Búsqueda
procedure TFMTerceros2.Reconectar_Tablas;
begin
  if PCMain.ActivePage = TSFicha then
     DMTerceros2.AbrirFicha;         // Ficha
  if PCMain.ActivePage = TSDireccion then
     DMTerceros2.AbrirDirecciones;   // Direcciones
  if PCMain.ActivePage = TSContactos then
     DMTerceros2.AbrirContactos;     // Contactos
  if PCMain.ActivePage = TSCuentas then
     DMTerceros2.AbrirCuentas;       // Cuentas Bancarias
  if PCMain.ActivePage = TSImagenes then
     RefrescarImagen(Imagen, DMTerceros2.QMTercerosIMAGEN.AsInteger); // Imágenes
  if PCMain.ActivePage = TSMails then
     DMTerceros2.AbrirEmail;         // Emails
end;

procedure TFMTerceros2.PCMainChanging(Sender: TObject; var AllowChange: boolean);
begin
  if PCMain.ActivePage = TSFicha then
     DMTerceros2.CerrarFicha;         // Ficha
  if PCMain.ActivePage = TSDireccion then
     DMTerceros2.CerrarDirecciones;   // Direcciones
  if PCMain.ActivePage = TSContactos then
  begin
     DMTerceros2.CerrarContactos;     // Contactos
     AImprimirCartaSpeedLock.Enabled := False;
     AVisualizarCartaSpeedLock.Enabled := False;
     AEnviarEmailCartaSpeedLock.Enabled := False;
     AEnviarEmailCartaSpeedLock2.Enabled := False;
  end;
  if PCMain.ActivePage = TSCuentas then
     DMTerceros2.CerrarCuentas;       // Cuentas Bancarias
  // if PCMain.ActivePage = TSImagenes then DMTerceros2.CerrarImagenes;      // Imágenes
  if PCMain.ActivePage = TSMails then
     DMTerceros2.CerrarEmail;         // Emails
end;

// Abrir/Activar el formulario de Clientes
procedure TFMTerceros2.SBCliClick(Sender: TObject);
begin
  FMain.EjecutaAccion(FMain.AClientes, 'TERCERO = ' + DMTerceros2.QMTercerosTERCERO.AsString);
end;

// Abrir/Activar el formulario de Proveedores
procedure TFMTerceros2.SBProClick(Sender: TObject);
begin
  FMain.EjecutaAccion(FMain.AProveedores, 'Tercero = ' +
     DMTerceros2.QMTercerosTERCERO.AsString +
     'and Ejercicio = ' + REntorno.EjercicioStr);
end;

// Abrir/Activar el formulario de Acreedores
procedure TFMTerceros2.SBAcrClick(Sender: TObject);
begin
  FMain.EjecutaAccion(FMain.AAcreedores, 'Tercero = ' +
     DMTerceros2.QMTercerosTERCERO.AsString + ' and Ejercicio = ' + REntorno.EjercicioStr);
end;

// Abrir/Activar el formulario de Agentes
procedure TFMTerceros2.SBAgeClick(Sender: TObject);
begin
  FMain.EjecutaAccion(FMain.AAgentes, 'Tercero = ' +
     DMTerceros2.QMTercerosTERCERO.AsString +
     ' and Ejercicio = ' + REntorno.EjercicioStr);
end;

procedure TFMTerceros2.SBPotClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AClientesPotencialesKri, 'TERCERO = ' + DMTerceros2.QMTercerosTERCERO.AsString);
end;

procedure TFMTerceros2.TSTablaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMTerceros2.DBSE_B_OrdenChange(Sender: TObject);
begin
  if DBSE_B_Orden.Value < 0 then
     DBSE_B_Orden.Value := 0;
end;

procedure TFMTerceros2.EFLocalidadBusqueda(Sender: TObject);
begin
  BEEP;
end;

procedure TFMTerceros2.FormActivate(Sender: TObject);
begin
  inherited;
  if not Primera then
     if not REntorno.DatosAbiertos then
        DMTerceros2.BusquedaCompleja;
  Primera := True;
  PonBotones;
  if FMain.EnlaceCrea then
     InsertarTercero;
end;

procedure TFMTerceros2.SBHaciaClienteClick(Sender: TObject);
begin
  { if EstructuraCreada then
    begin
      fmain.autcliente := true;
      FMain.EjecutaAccion (fmain.AClientes);
      FMClientes.Tercero_a_Cliente( StrToInt(DBETercero.Text) );
    end;}
end;

procedure TFMTerceros2.SBHaciaProveedorClick(Sender: TObject);
begin
  { if EstructuraCreada then
    begin
      fmain.autproveedor := true;
      FMain.EjecutaAccion (FMain.AProveedores);
      FMProveedores.Tercero_a_Proveedor( StrToInt(DBETercero.Text) );
    end;  }
end;

procedure TFMTerceros2.SBHaciaAcreedorClick(Sender: TObject);
begin
  { if EstructuraCreada then
    begin
      fmain.autacreedor := true;
      FMain.EjecutaAccion (FMain.AAcreedores);
      FMAcreedores.Tercero_a_Acreedor( StrToInt(DBETercero.Text) );
    end;}
end;

procedure TFMTerceros2.SBHaciaAgenteClick(Sender: TObject);
begin
  {  if EstructuraCreada then
    begin
      fmain.autagente := true;
      FMain.EjecutaAccion (FMain.AAgentes);
      FMAgentes.Tercero_a_Agente( StrToInt(DBETercero.Text) );
    end;}
end;

procedure TFMTerceros2.CierraCliente;
begin
  FMain.autcliente := False;
  Application.ProcessMessages;
  SetFocus;
  FMClientes.Close;
end;

procedure TFMTerceros2.CierraProveedor;
begin
  FMain.autproveedor := False;
  Application.ProcessMessages;
  SetFocus;
  FMProveedores.Close;
end;

procedure TFMTerceros2.CierraAcreedor;
begin
  FMain.autacreedor := False;
  Application.ProcessMessages;
  SetFocus;
  FMAcreedores.Close;
end;

procedure TFMTerceros2.CierraAgente;
begin
  FMain.autagente := False;
  Application.ProcessMessages;
  SetFocus;
  FMAgentes.Close;
end;

procedure TFMTerceros2.TraspasosActivos(Activacion: integer);
begin
  if Activacion = 1 then
  begin
     FBHaciaAgente.Font.Color := clBlack;
     FBHaciaAcreedor.Font.Color := clBlack;
     FBHaciaProveedor.Font.Color := clBlack;
     FBHaciaCliente.Font.Color := clBlack;
     FBHaciaCRM.Font.Color := clBlack;
     FBHaciaClientePotencial.Font.Color := clBlack;
     PBtnMaestros.Enabled := True;
  end
  else
  if Activacion = 0 then
  begin
     FBHaciaAgente.Font.Color := clGray;
     FBHaciaAcreedor.Font.Color := clGray;
     FBHaciaProveedor.Font.Color := clGray;
     FBHaciaCliente.Font.Color := clGray;
     FBHaciaCRM.Font.Color := clGray;
     FBHaciaClientePotencial.Font.Color := clGray;
     PBtnMaestros.Enabled := False;
  end;
end;

procedure TFMTerceros2.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbEdit then
     TraspasosActivos(0)
  else
  if Button = nbInsert then
     TraspasosActivos(0)
  else
  if Button = nbCancel then
     TraspasosActivos(1);
end;

procedure TFMTerceros2.InsertarTercero;
begin
  // if Assigned(DMTerceros2) then
  DMTerceros2.InsertarTercero;
end;

// Filtra por Tercero
procedure TFMTerceros2.FiltraTercero(Filtro: string);
begin
  if Assigned(DMTerceros2) then
  begin
     DMTerceros2.FiltraTercero(Filtro);
     Reconectar_Tablas;
     PonBotones;
  end;
end;

procedure TFMTerceros2.NavDireccionesClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  SBNuevaLocalidadDireccion.Visible := (Button in [nbEdit, nbInsert]);
  TButtTransportistaSegunCP.Visible := (Button in [nbEdit, nbInsert]);
  PonBotones;
end;

procedure TFMTerceros2.NavContactosClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  PonBotones;
end;

procedure TFMTerceros2.NavCuentasClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  PonBotones;

  BObtenerBIC.Visible := (Button in [nbInsert, nbEdit]);
end;

procedure TFMTerceros2.NavInfoClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  PonBotones;
end;

procedure TFMTerceros2.TSImagenesShow(Sender: TObject);
begin
  RefrescarImagen(Imagen, DMTerceros2.QMTercerosIMAGEN.AsInteger);
  ETituloImagen.Text := DameTituloImagen(DMTerceros2.QMTercerosIMAGEN.AsInteger);
  ControlEdit := CEImagenes;
end;

procedure TFMTerceros2.NavImagenesClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  PonBotones;
end;

procedure TFMTerceros2.DBEFImagenChange(Sender: TObject);
begin
  if (PCMain.ActivePage = TSImagenes) then
  begin
     RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
     ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
  end;
end;

procedure TFMTerceros2.NavDireccionesClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
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

procedure TFMTerceros2.AVisualizarListadoExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(0);
end;

procedure TFMTerceros2.AImprimirListadoExecute(Sender: TObject);
begin
  inherited;
  MuestraFiltrado(1);
end;

procedure TFMTerceros2.AListConfigExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstTerceros, DMLstTerceros);
  TFMListConfig.Create(Self).Muestra(5, Formato, Cabecera, Copias, Pijama, '',
     DMLstTerceros.frTerceros);
  CierraData(DMLstTerceros);
end;

procedure TFMTerceros2.ADirDefectoExecute(Sender: TObject);
begin
  inherited;
  DMTerceros2.DireccionDefecto;
end;

procedure TFMTerceros2.AResDirDefectoExecute(Sender: TObject);
begin
  inherited;
  DMTerceros2.ResDireccionDefecto;
  PCMain.ActivePage := TSFicha;
end;

procedure TFMTerceros2.NavContactosBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbCancel then
     NavContactos.SetFocus;
end;

procedure TFMTerceros2.NavCuentasBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbCancel then
     NavCuentas.SetFocus;
end;

procedure TFMTerceros2.NavInfoBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbCancel then
     NavInfo.SetFocus;
end;

procedure TFMTerceros2.AClienteExecute(Sender: TObject);
begin
  inherited;
  if EstructuraCreada then
  begin
     FMain.autcliente := True;
     FMain.EjecutaAccion(FMain.AClientes);
     FMClientes.Tercero_a_Cliente(StrToInt(DBETercero.Text));
  end;
end;

procedure TFMTerceros2.AProveedorExecute(Sender: TObject);
begin
  inherited;
  if EstructuraCreada then
  begin
     FMain.autproveedor := True;
     FMain.EjecutaAccion(FMain.AProveedores);
     FMProveedores.Tercero_a_Proveedor(StrToInt(DBETercero.Text));
  end;
end;

procedure TFMTerceros2.AAcreedorExecute(Sender: TObject);
begin
  inherited;
  if EstructuraCreada then
  begin
     FMain.autacreedor := True;
     FMain.EjecutaAccion(FMain.AAcreedores);
     FMAcreedores.Tercero_a_Acreedor(StrToInt(DBETercero.Text));
  end;
end;

procedure TFMTerceros2.AAgenteExecute(Sender: TObject);
begin
  inherited;
  if EstructuraCreada then
  begin
     FMain.autagente := True;
     FMain.EjecutaAccion(FMain.AAgentes);
     FMAgentes.Tercero_a_Agente(StrToInt(DBETercero.Text));
  end;
end;

procedure TFMTerceros2.FBHaciaClientePotencialClick(Sender: TObject);
begin
  inherited;
  if EstructuraCreada then
  begin
     FMain.autagente := True;
     FMain.EjecutaAccion(FMain.AClientesPotencialesKri);
     FMClientesPotencialesKri.Tercero_a_ClientePotencial(StrToInt(DBETercero.Text));
  end;
end;

procedure TFMTerceros2.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMTerceros2.FiltraTercero('');
  G2KTableLoc.DataSource := DMTerceros2.DSQMTerceros;
  G2KTableLoc.Click;

  Reconectar_Tablas;
  PonBotones;
  RestringirPestanya;
end;

procedure TFMTerceros2.TSMailsShow(Sender: TObject);
begin
  inherited;
  DMTerceros2.AbrirEmail; // Emails
end;

procedure TFMTerceros2.DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  PonBotones;
end;

procedure TFMTerceros2.DBGMainColEnter(Sender: TObject);
begin
  inherited;
  PonBotones;
end;

procedure TFMTerceros2.LFDBEAgenteKriChange(Sender: TObject);
begin
  inherited;
  LFEAgente.Text := DameTituloAgente(StrToIntDef(LFDBEAgenteKri.Text, 0));
end;

procedure TFMTerceros2.EFTerceroChange(Sender: TObject);
begin
  inherited;
  DMTerceros2.FiltraUnTercero(StrToIntDef(EFTercero.Text, 0));

  Reconectar_Tablas;
  PonBotones;
end;

procedure TFMTerceros2.LNombreCom_SocClick(Sender: TObject);
begin
  inherited;
  with G2kTableLoc do
  begin
     CamposADesplegar.Clear;
     CamposADesplegar.Add('TELEFONO01');
     CamposADesplegar.Add('NIF');
  end;

  if (LNombreCom_Soc.Caption = _('Com')) then
  begin
     LNombreCom_Soc.Caption := _('Fis');
     G2kTableLoc.CampoStr := 'NOMBRE_R_SOCIAL';
     G2kTableLoc.CamposADesplegar.Add('NOMBRE_COMERCIAL');
     EFTercero.CampoStr := 'NOMBRE_R_SOCIAL';
  end
  else
  begin
     LNombreCom_Soc.Caption := _('Com');
     G2kTableLoc.CampoStr := 'NOMBRE_COMERCIAL';
     G2kTableLoc.CamposADesplegar.Add('NOMBRE_R_SOCIAL');
     EFTercero.CampoStr := 'NOMBRE_COMERCIAL';
  end;
end;

procedure TFMTerceros2.AVerificaNIFExecute(Sender: TObject);
begin
  inherited;
  DMTerceros2.VerificaNifKri;
end;

procedure TFMTerceros2.ValidaDocumentoIdentificacion;
var
  Valido : boolean;
  MensajeError : string;
begin
  DMMain.VerificaDocumentoIdentificacion(DMTerceros2.QMTercerosPAIS_TERCERO.AsString, DMTerceros2.QMTercerosTIPO_DOC_IDENT.AsString, DMTerceros2.QMTercerosNIF.AsString, Valido, MensajeError);
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

procedure TFMTerceros2.DBECifChange(Sender: TObject);
begin
  inherited;
  if (DMTerceros2.QMTerceros.State = dsBrowse) then
  begin
     ValidaDocumentoIdentificacion;
  end;
end;

procedure TFMTerceros2.DBEFDireccionChange(Sender: TObject);
begin
  inherited;
  EDireccion.Text := DameDireccionTercero(DMTerceros2.QMContactosTERCERO.AsInteger, DMTerceros2.QMContactosDIRECCION.AsInteger);
end;

procedure TFMTerceros2.DBEFDireccionBusqueda(Sender: TObject);
begin
  inherited;
  DBEFDireccion.CondicionBusqueda := 'tercero=' + IntToStr(DMTerceros2.QMContactosTERCERO.AsInteger);
end;

procedure TFMTerceros2.SBFiltraContactosClick(Sender: TObject);
begin
  inherited;
  TSContactos.Show;
  with DMTerceros2.QMContactos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM SYS_TERCEROS_CONTACTOS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' TERCERO = ?TERCERO AND ');
     SelectSQL.Add(' DIRECCION = ?DIRECCION ');
     SelectSQL.Add(' ORDER BY CONTACTO ');
     Params.ByName['DIRECCION'].AsInteger := DMTerceros2.QMDireccionesDIRECCION.AsInteger;
     Open;
  end;
end;

procedure TFMTerceros2.SBIncidenciasKriClick(Sender: TObject);
begin
  inherited;
  AbreForm(TFMIncidencias, FMIncidencias, Sender);
  FMIncidencias.Muestra(0, DMTerceros2.QMDireccionesTERCERO.AsInteger, 0, 0, 0, DMTerceros2.QMDireccionesDIRECCION.AsInteger);
end;

procedure TFMTerceros2.EFContactoKriExiste(Sender: TObject);
begin
  inherited;
  if (EFContactoKri.Text <> '') then
     Posicionar(DMTerceros2.QMContactos, 'CONTACTO', StrToIntDef(EFContactoKri.Text, 0));
end;

procedure TFMTerceros2.EFDireccionTerceroKriExiste(Sender: TObject);
begin
  inherited;
  if (EFDireccionTerceroKri.Text <> '') then
     Posicionar(DMTerceros2.QMdirecciones, 'DIRECCION', StrToIntDef(EFDireccionTerceroKri.Text, 0));
end;

procedure TFMTerceros2.CompruebaCuentaBancaria;
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

procedure TFMTerceros2.PosicionaDireccion(Direccion: integer);
begin
  PCMain.ActivePage := TSDireccion;
  while ((not DMTerceros2.QMDirecciones.EOF) and (DMTerceros2.QMDireccionesDIRECCION.AsInteger <> Direccion)) do
     DMTerceros2.QMDirecciones.Next;
  if (DMTerceros2.QMDireccionesDIRECCION.AsInteger <> Direccion) then
     DMTerceros2.QMDirecciones.First;
end;

procedure TFMTerceros2.PosicionaContacto(Contacto: integer);
begin
  PCMain.ActivePage := TSContactos;
  while ((not DMTerceros2.QMContactos.EOF) and (DMTerceros2.QMContactosCONTACTO.AsInteger <> Contacto)) do
     DMTerceros2.QMContactos.Next;
  if (DMTerceros2.QMContactosCONTACTO.AsInteger <> Contacto) then
     DMTerceros2.QMContactos.First;
end;

procedure TFMTerceros2.EFDireccionTerceroKriBusqueda(Sender: TObject);
begin
  inherited;
  EFDireccionTerceroKri.CondicionBusqueda := 'TERCERO=' + IntToStr(DMTerceros2.QMTercerosTERCERO.AsInteger);
end;

procedure TFMTerceros2.EFContactoKriBusqueda(Sender: TObject);
begin
  inherited;
  EFContactoKri.CondicionBusqueda := 'TERCERO=' + IntToStr(DMTerceros2.QMTercerosTERCERO.AsInteger);
end;

procedure TFMTerceros2.AAdjuntosTerceroExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('TER', DMTerceros2.QMTercerosTERCERO.AsInteger);
end;

procedure TFMTerceros2.DBEFContactoPadreBusqueda(Sender: TObject);
begin
  inherited;
  DBEFContactoPadre.CondicionBusqueda := 'TERCERO=' + IntToStr(DMTerceros2.QMTercerosTERCERO.AsInteger);
end;

procedure TFMTerceros2.DBEFContactoPadreChange(Sender: TObject);
begin
  inherited;
  EContactoPadre.Text := DameTituloContacto(DMTerceros2.QMTercerosTERCERO.AsInteger, StrToIntDef(DBEFContactoPadre.Text, 0));
end;

procedure TFMTerceros2.CreaArbolContactos;
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
        Nodo := TVContactos.Items.Add(nil, Trim(DMTerceros2.QMTercerosNOMBRE_R_SOCIAL.AsString));
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
           Params.ByName['TERCERO'].AsInteger := DMTerceros2.QMTercerosTERCERO.AsInteger;
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
           Params.ByName['TERCERO'].AsInteger := DMTerceros2.QMTercerosTERCERO.AsInteger;
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

procedure TFMTerceros2.PCContactosChanging(Sender: TObject; var AllowChange: boolean);
begin
  inherited;
  // Borro el arbol
  if (PCContactos.ActivePage = TSCo_Jerarquia) then
     TVContactos.Items.Clear;
end;

procedure TFMTerceros2.PCContactosChange(Sender: TObject);
begin
  inherited;
  if (PCContactos.ActivePage = TSCo_Jerarquia) then
     CreaArbolContactos;
end;

procedure TFMTerceros2.TVContactosDblClick(Sender: TObject);
begin
  inherited;
  DMTerceros2.PosicionaContacto(integer(TVContactos.Selections[0].Data));
  PCContactos.ActivePage := TSCo_Ficha;
end;

procedure TFMTerceros2.DBEDepartamentoChange(Sender: TObject);
begin
  inherited;
  ETituloDepartamento.Text := DameTituloDepartamento(DBEDepartamento.Text);
end;

procedure TFMTerceros2.DBEFTransportistaChange(Sender: TObject);
begin
  inherited;
  ETransportista.Text := DameTituloAcreedor(StrToIntDef(DBEFTransportista.Text, 0));
end;

procedure TFMTerceros2.SBCrmClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.ACrmContactos, 'TERCERO = ' +
     DMTerceros2.QMTercerosTERCERO.AsString);
end;

procedure TFMTerceros2.FBHaciaCRMClick(Sender: TObject);
begin
  inherited;
  if EstructuraCreada then
  begin
     FMain.autcrm := True;
     FMain.EjecutaAccion(FMain.ACrmContactos);
     CrmFMContactos.Tercero_a_Crm(StrToInt(DBETercero.Text));
  end;
end;

procedure TFMTerceros2.SBAEmailDblClick(Sender: TObject);
begin
  inherited;
  if ShellExecute(Application.Handle, nil, PChar('mailto:' + DBEEmail.Text), nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('Error en el Mail'));
end;

procedure TFMTerceros2.SBAWebDblClick(Sender: TObject);
begin
  inherited;
  if ShellExecute(Application.Handle, nil, PChar(DBEWeb.Text), nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('Error en la Página Web'));
end;

procedure TFMTerceros2.SABContactosEmailDblClick(Sender: TObject);
begin
  inherited;
  if ShellExecute(Application.Handle, nil, PChar('mailto:' + DBE_C_Email.Text), nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('Error en el Mail'));
end;

procedure TFMTerceros2.AImprimirNotasExecute(Sender: TObject);
var
  s : TStrings;
begin
  inherited;
  s := TStringList.Create;
  try
     s.Add('----------------------------------------------------------------------');
     s.Add(Format(_('Notas del tercero %d - %s'), [DMTerceros2.QMTercerosTERCERO.AsInteger, DMTerceros2.QMTercerosNOMBRE_R_SOCIAL.AsString]));
     s.Add('----------------------------------------------------------------------');
     s.AddStrings(DBMINfo.Lines);
     s.Add('----------------------------------------------------------------------');
     ImpresionTexto(s);
  finally
     s.Free;
  end;
end;

procedure TFMTerceros2.DBEIBANChange(Sender: TObject);
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

procedure TFMTerceros2.AImprimirCartaSEPAExecute(Sender: TObject);
begin
  inherited;
  DMTerceros2.ImprimirCartaSEPA(1, False);
end;

procedure TFMTerceros2.AVisualizarCartaSEPAExecute(Sender: TObject);
begin
  inherited;
  DMTerceros2.ImprimirCartaSEPA(0, False);
end;

procedure TFMTerceros2.AListConfigCartaSEPAExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstTerceros, DMLstTerceros);
  TFMListConfig.Create(Self).Muestra(2009, Formato, Cabecera, Copias, Pijama, '',
     DMLstTerceros.frTerceros);
  CierraData(DMLstTerceros);
end;

procedure TFMTerceros2.AImprimirCartaSpeedLockExecute(Sender: TObject);
begin
  inherited;
  DMTerceros2.ImprimirCartaSpeedLock(1, False);
end;

procedure TFMTerceros2.AVisualizarCartaSpeedLockExecute(Sender: TObject);
begin
  inherited;
  DMTerceros2.ImprimirCartaSpeedLock(0, False);
end;

procedure TFMTerceros2.AListConfigCartaSpeedLockExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstTerceros, DMLstTerceros);
  TFMListConfig.Create(Self).Muestra(649, Formato, Cabecera, Copias, Pijama, '',
     DMLstTerceros.frTerceros);
  CierraData(DMLstTerceros);
end;

procedure TFMTerceros2.ACreaTercerosRandomExecute(Sender: TObject);
begin
  inherited;
  DMTerceros2.CreaTerceros;
end;

procedure TFMTerceros2.AReemplazaCarateresExecute(Sender: TObject);
begin
  inherited;
  DMTerceros2.ReemplazaCarateres;
end;

procedure TFMTerceros2.AEnviarEmailCartaSEPAExecute(Sender: TObject);
begin
  inherited;
  DMTerceros2.ImprimirCartaSEPA(2, False);
end;

procedure TFMTerceros2.AEnviarEmailCartaSpeedLockExecute(Sender: TObject);
begin
  inherited;
  DMTerceros2.ImprimirCartaSpeedLock(2, False);
end;

procedure TFMTerceros2.ACalculaIBANExecute(Sender: TObject);
begin
  inherited;
  DMTerceros2.CalculaIBAN;
end;

procedure TFMTerceros2.DBEIBANEnter(Sender: TObject);
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
        Params.ByName['ID_LOCAL'].AsInteger := DMTerceros2.QMTercerosID_LOCAL.AsInteger;
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

procedure TFMTerceros2.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  DMTerceros2.QMTercerosIMAGEN.AsInteger := ImportarImagen('');
end;

procedure TFMTerceros2.NavImagenesClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);
end;

procedure TFMTerceros2.ARenombraTercerosRandomExecute(Sender: TObject);
begin
  inherited;
  DMTerceros2.RenombraTerceros;
end;

procedure TFMTerceros2.DBEFClaseDireccionChange(Sender: TObject);
begin
  inherited;
  EClaseDireccion.Text := DameTituloClaseDireccion(StrToIntDef(DBEFClaseDireccion.Text, -1));
end;

procedure TFMTerceros2.AImprimirCartaLOPDExecute(Sender: TObject);
begin
  inherited;
  DMTerceros2.ImprimirCartaLOPD(1, False);
end;

procedure TFMTerceros2.AVisualizarCartaLOPDExecute(Sender: TObject);
begin
  inherited;
  DMTerceros2.ImprimirCartaLOPD(0, False);
end;

procedure TFMTerceros2.AEnviarEmailCartaLOPDExecute(Sender: TObject);
begin
  inherited;
  DMTerceros2.ImprimirCartaLOPD(2, False);
end;

procedure TFMTerceros2.AListConfigCartaLOPDExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  AbreData(TDMLstTerceros, DMLstTerceros);
  TFMListConfig.Create(Self).Muestra(2014, Formato, Cabecera, Copias, Pijama, '',
     DMLstTerceros.frTerceros);
  CierraData(DMLstTerceros);
end;

procedure TFMTerceros2.AEnviarEmailCartaLOPD2Execute(Sender: TObject);
begin
  inherited;
  DMTerceros2.ImprimirCartaLOPD(2, True);
end;

procedure TFMTerceros2.AEnviarEmailCartaSEPA2Execute(Sender: TObject);
begin
  inherited;
  DMTerceros2.ImprimirCartaSEPA(2, True);
end;

procedure TFMTerceros2.AEnviarEmailCartaSpeedLock2Execute(Sender: TObject);
begin
  inherited;
  DMTerceros2.ImprimirCartaSpeedLock(2, True);
end;

procedure TFMTerceros2.APedirFirmaExecute(Sender: TObject);
begin
  inherited;
  DMMain.PedirFirma('LOP', DMTerceros2.QMTercerosTERCERO.AsInteger);
end;

procedure TFMTerceros2.ABorrarFirmaExecute(Sender: TObject);
begin
  inherited;
  DMMain.BorrarFirma('LOP', DMTerceros2.QMTercerosTERCERO.AsInteger);
end;

procedure TFMTerceros2.BClipboardClick(Sender: TObject);
begin
  inherited;
  DMTerceros2.QMTercerosIMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

procedure TFMTerceros2.ACRMExecute(Sender: TObject);
begin
  inherited;
  if (DMTerceros2.VerificaExisteEnTercero(DMTerceros2.QMTercerosTERCERO.AsInteger, 'CRM')) then
     FMain.EjecutaAccion(FMain.ACrmContactos, 'TERCERO = ' + IntToStr(DMTerceros2.QMTercerosTERCERO.AsInteger))
  else
  if EstructuraCreada then
  begin
     FMain.autcrm := True;
     FMain.EjecutaAccion(FMain.ACrmContactos);
     CrmFMContactos.Tercero_a_Crm(StrToInt(DBETercero.Text));
  end;
end;

procedure TFMTerceros2.AEmpleadoExecute(Sender: TObject);
begin
  inherited;
  if (DMTerceros2.VerificaExisteEnTercero(DMTerceros2.QMTercerosTERCERO.AsInteger, 'OPE')) then
     FMain.EjecutaAccion(FMain.AOpeEmpleados, 'TERCERO = ' + IntToStr(DMTerceros2.QMTercerosTERCERO.AsInteger))
  else
  if EstructuraCreada then
  begin
     FMain.autempleado := True;
     FMain.EjecutaAccion(FMain.AOpeEmpleados);
     OpeFMEmpleados.Tercero_a_Empleado(StrToInt(DBETercero.Text));
  end;
end;

procedure TFMTerceros2.DBEFBancoDireccionBusqueda(Sender: TObject);
begin
  inherited;
  DBEFBancoDireccion.CondicionBusqueda := 'TERCERO = ' + IntToStr(DMTerceros2.QMDireccionesTERCERO.AsInteger);
end;

procedure TFMTerceros2.DBEFBancoDireccionChange(Sender: TObject);
begin
  inherited;
  EBancoDireccion.Text := DameTituloBancoTercero(DMTerceros2.QMDireccionesTERCERO.AsInteger, DMTerceros2.QMDireccionesBANCO.AsInteger);
end;

procedure TFMTerceros2.DBETipoDocumentoBusqueda(Sender: TObject);
begin
  inherited;
  DBETipoDocumento.CondicionBusqueda := 'PAIS = ''' + DMTerceros2.QMTercerosPAIS_TERCERO.AsString + '''';
end;

procedure TFMTerceros2.DBETipoDocumentoChange(Sender: TObject);
begin
  inherited;
  if ((DMTerceros2.QMTercerosPAIS_TERCERO.AsString > '') and (DMTerceros2.QMTercerosTIPO_DOC_IDENT.AsString > '')) then
     ETipoDocumentoTitulo.Text := DameTituloTipoDocIdentidad(DMTerceros2.QMTercerosPAIS_TERCERO.AsString, DMTerceros2.QMTercerosTIPO_DOC_IDENT.AsString);

  ValidaDocumentoIdentificacion;
end;

procedure TFMTerceros2.DBEPaisTerceroChange(Sender: TObject);
begin
  inherited;
  ETipoDocumentoTitulo.Text := DameTituloTipoDocIdentidad(DMTerceros2.QMTercerosPAIS_TERCERO.AsString, DMTerceros2.QMTercerosTIPO_DOC_IDENT.AsString);

  ValidaDocumentoIdentificacion;
end;

procedure TFMTerceros2.DBECifExit(Sender: TObject);
begin
  inherited;
  ValidaDocumentoIdentificacion;
end;

procedure TFMTerceros2.SBNuevaLocalidadFichaClick(Sender: TObject);
var
  Localidad : string;
begin
  inherited;
  Localidad := CreaLocalidad(REntorno.Pais);
  if (Localidad <> '') then
     DMTerceros2.QMTercerosDIR_LOCALIDAD.AsString := Localidad;
end;

procedure TFMTerceros2.SBNuevaLocalidadDireccionClick(Sender: TObject);
var
  Localidad : string;
begin
  inherited;
  Localidad := CreaLocalidad(REntorno.Pais);
  if (Localidad <> '') then
     DMTerceros2.QMDireccionesDIR_LOCALIDAD.AsString := Localidad;
end;

procedure TFMTerceros2.TButtTransportistaSegunCPClick(Sender: TObject);
begin
  inherited;
  DMTerceros2.TransportistaSegunCP(DBE_D_CPLocalidad.Text);
end;

procedure TFMTerceros2.TBCreaUsuarioWebClick(Sender: TObject);
var
  UsuarioNuevo : boolean;
begin
  inherited;
  UsuarioNuevo := False;

  with DMTerceros2 do
  begin
     if (QMContactosID_USUARIO_WEB.AsInteger = 0) then
        UsuarioNuevo := True;

     CreaUsuarioWeb(QMContactosTERCERO.AsInteger, QMContactosCONTACTO.AsInteger, QMContactosDIRECCION.AsInteger, QMContactosAPELLIDOS.AsString + ' ' + QMContactosNOMBRE.AsString, QMContactosCORREO.AsString);

     FMain.EjecutaAccion(FMain.AUsuariosWeb, IntToStr(QMContactosID_USUARIO_WEB.AsInteger));

     if UsuarioNuevo then
        FMUsuariosWeb.UsuarioNuevo;
  end;
end;

procedure TFMTerceros2.SBEmpleadoClick(Sender: TObject);
begin
  inherited;
  if (DMTerceros2.VerificaExisteEnTercero(DMTerceros2.QMTercerosTERCERO.AsInteger, 'OPE')) then
     FMain.EjecutaAccion(FMain.AOpeEmpleados, 'TERCERO = ' + DMTerceros2.QMTercerosTERCERO.AsString)
  else
  if EstructuraCreada then
  begin
     FMain.autempleado := True;
     FMain.EjecutaAccion(FMain.AOpeEmpleados);
     OpeFMEmpleados.Tercero_a_Empleado(StrToInt(DBETercero.Text));
  end;
end;

procedure TFMTerceros2.PCMainChange(Sender: TObject);
begin
  inherited;
  RestringirPestanya;
end;

procedure TFMTerceros2.RestringirPestanya;
begin
  // Restringir pestaña si no se pueden ver empleados
  if ((not MostrarEmpleado) and (SBEmpleado.Enabled) and (DMTerceros2.QMTercerosTERCERO.AsInteger <> REntorno.Tercero)) then
  begin
     if ((PCMain.ActivePage <> TSFicha) and (PCMain.ActivePage <> TSTabla)) then
        PCMain.ActivePage := TSFicha;
  end;
end;

procedure TFMTerceros2.AEmpresasChileExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AEmpresasChile);
end;

procedure TFMTerceros2.SBADireccionDblClick(Sender: TObject);
var
  Direccion : string;
begin
  inherited;
  Direccion := Trim(QuitarAcentosTexto(DMTerceros2.QMTercerosDIRECCION_LITERAL.AsString));
  Direccion := EscapeURL(Direccion);
  Direccion := 'http://maps.google.com/maps?q=' + Direccion;
  if ShellExecute(Application.Handle, nil, PChar(Direccion), nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('Error en la Página Web'));
end;

procedure TFMTerceros2.SBADireccion2DblClick(Sender: TObject);
var
  Direccion : string;
begin
  inherited;
  Direccion := Trim(QuitarAcentosTexto(DMTerceros2.QMDireccionesDIRECCION_LITERAL.AsString));
  Direccion := EscapeURL(Direccion);
  Direccion := 'http://maps.google.com/maps?q=' + Direccion;
  if ShellExecute(Application.Handle, nil, PChar(Direccion), nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('Error en la Página Web'));
end;

procedure TFMTerceros2.WMDropFiles(var Msg: TWMDropFiles);
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
              DMAdjunto.CreaAdjunto('TER', DMTerceros2.QMTercerosTERCERO.AsInteger, Ficheros[i]);
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

procedure TFMTerceros2.FormShow(Sender: TObject);
begin
  inherited;
  if (LeeParametro('MODSINC016') <> 'S') then
  begin
     AImprimirCartaSpeedLock.Visible := False;
     AVisualizarCartaSpeedLock.Visible := False;
     AEnviarEmailCartaSpeedLock.Visible := False;
     AEnviarEmailCartaSpeedLock2.Visible := False;
  end;

  // Color campo ID
  ColorCampoID(DBETercero);
end;

procedure TFMTerceros2.DBEFTipoCuentaChange(Sender: TObject);
begin
  inherited;
  EDescripcionTipoCuenta.Text := DameTituloTipoCuenta(StrToIntDef(DBEFTipoCuenta.Text, 0));
end;

procedure TFMTerceros2.DBEFPaisBancoChange(Sender: TObject);
begin
  inherited;
  EPaisBanco.Text := DameTituloPais(DBEFPaisBanco.Text);
end;

procedure TFMTerceros2.DBEFEntidadBusqueda(Sender: TObject);
begin
  inherited;
  DBEFEntidad.CondicionBusqueda := 'PAIS = ''' + DBEFPaisBanco.Text + '''';
end;

procedure TFMTerceros2.FBHaciaEmpleadoClick(Sender: TObject);
begin
  inherited;
  if EstructuraCreada then
  begin
     FMain.autempleado := True;
     FMain.EjecutaAccion(FMain.AOpeEmpleados);
     OpeFMEmpleados.Tercero_a_Empleado(StrToInt(DBETercero.Text));
  end;
end;

procedure TFMTerceros2.BObtenerBICClick(Sender: TObject);
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
        DMTerceros2.QMBancosBIC.AsString := Trim(FieldByName['BIC'].AsString);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TFMTerceros2.DBETerceroChange(Sender: TObject);
var
  ColorFondo, ColorTexto : TColor;
begin
  inherited;
  DBTValidacionResultado.Hint := DBTValidacionResultado.Caption;
  DBTValidacionNombre.Hint := DBTValidacionNombre.Caption;

  if (DMTerceros2.QMTercerosNIF.AsString = '') or (DBTValidacionResultado.Caption = '') or (DBTValidacionResultado.Caption = 'IDENTIFICADO') or (DBTValidacionResultado.Caption = 'VALIDO') then
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
