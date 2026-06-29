{ TODO : Quitar dependencias de OpeFMEmpleado }
unit UOpeFMEmpleados;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, UDBDateTimePicker, Buttons,
  rxPlacemnt, NsDBGrid, rxToolEdit, RXDBCtrl, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFDBMemo,
  ULFDBEditFind2000, ULFDBEdit, ULFFIBDBEditFind, UG2kTBLoc,
  UHYDescription, ULFHYDBDescription, ULFLabel, ImgList, ULFEdit,
  TFlatCheckBoxUnit, ULFCheckBox, DB, ULFDBCheckBox, ULFDBDateEdit,
  ULFEditFind2000, ULFComboBox, ULFDateEdit, RxDBComb, DbComboBoxValue,
  ULFDBComboBoxValue;

type
  TOpeFMEmpleados = class(TFPEdit)
     LblEmpleado: TLFLabel;
     DBEEmpleado: TLFDbedit;
     LblTercero: TLFLabel;
     DBEFTercero: TLFDBEditFind2000;
     LblCategoria: TLFLabel;
     DBEFCategoria: TLFDBEditFind2000;
     LblCentro: TLFLabel;
     LblDepartamento: TLFLabel;
     DBEFDepartamento: TLFDBEditFind2000;
     DBEFCentro: TLFDBEditFind2000;
     LblSeccion: TLFLabel;
     DBEFSeccion: TLFDBEditFind2000;
     LblCalendario: TLFLabel;
     DBEFCal: TLFDBEditFind2000;
     LblNumSegSoc: TLFLabel;
     DBENunSegSoc: TLFDbedit;
     LblTipoContrato: TLFLabel;
     DBEFTipContrato: TLFDBEditFind2000;
     LblFinContrato: TLFLabel;
     LblFechaNacimiento: TLFLabel;
     DBDTPFechaNac: TLFDBDateEdit;
     LblEstadoCivil: TLFLabel;
     LblCodTarjeta: TLFLabel;
     DBECodTar: TLFDbedit;
     TSNotas: TTabSheet;
     PEditNotas: TLFPanel;
     PNLCabNotas: TLFPanel;
     LEmpleadoNotas: TLFLabel;
     LTerceroNotas: TLFLabel;
     DBEmpleadoNotas: TLFDbedit;
     DBEDescTerceroNotas: TLFDbedit;
     DBETerceroNotas: TLFDbedit;
     NavNotas: THYMNavigator;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     ScrBImagen: TScrollBox;
     Imagen: TImage;
     CEListados: TPopupMenu;
     Fichaempleado1: TMenuItem;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     DBEFRecurso: TLFDBEditFind2000;
     DBEFImputacion: TLFDBEditFind2000;
     LblHorario: TLFLabel;
     DBEFHorario: TLFDBEditFind2000;
     AListadoEmpleados: TAction;
     LFCategoryAction1: TLFCategoryAction;
     DBEFImagen: TLFFibDBEditFind;
     LblImagen: TLFLabel;
     DescTercero: TLFHYDBDescription;
     DescCategoria: TLFHYDBDescription;
     DescCentro: TLFHYDBDescription;
     DescDepartamento: TLFHYDBDescription;
     DescSeccion: TLFHYDBDescription;
     DescCalendario: TLFHYDBDescription;
     DescTipoContrato: TLFHYDBDescription;
     DescRecurso: TLFHYDBDescription;
     DescHorario: TLFHYDBDescription;
     ETituloImagen: TLFEdit;
     DBMNotas: TDBRichEdit;
     TBNotas: TLFToolBar;
     TButtUndo: TToolButton;
     TButtCut: TToolButton;
     TButtCopy: TToolButton;
     TButtPaste: TToolButton;
     ToolButton6: TToolButton;
     FontName: TLFComboBox;
     FontSize: TLFEdit;
     UpDown1: TUpDown;
     ToolButton3: TToolButton;
     TButtNegrita: TToolButton;
     TButtCursiva: TToolButton;
     TButtSubrayado: TToolButton;
     ToolButton7: TToolButton;
     TButtLeftAlign: TToolButton;
     TButtCenterAlign: TToolButton;
     TButtRightAlign: TToolButton;
     ToolButton1: TToolButton;
     TButtColor: TToolButton;
     LRecursoDefecto: TLFLabel;
     LTareaDefecto: TLFLabel;
     DBEFTTarea: TLFDBEditFind2000;
     DescTTarea: TLFHYDBDescription;
     DescImputacion: TLFDbedit;
     DBCBImputacion: TLFDBCheckBox;
     PNLNotas: TLFPanel;
     ALstConfig: TAction;
     TSFormacion: TTabSheet;
     TBFormacion: TLFToolBar;
     LFPanelFormacion: TLFPanel;
     DBETerceroFormacion: TLFDbedit;
     DBETituloTerceroFormacion: TLFDbedit;
     NavFormacion: THYMNavigator;
     ToolButton2: TToolButton;
     LFPanelCursos: TLFPanel;
     DBGCursos: TDBGridFind2000;
     LFPFormacionDatos: TLFPanel;
     LFormacionInicial: TLFLabel;
     LFDBFormacionIni: TLFDBMemo;
     LExperienciaProfesional: TLFLabel;
     LFDBExpProf: TLFDBMemo;
     TBCursos: TLFToolBar;
     NavCursos: THYMNavigator;
     CEFormacionOpe: TControlEdit;
     CEFormacionOpePMEdit: TPopUpTeclas;
     CECursos: TControlEdit;
     CECursosPMEdit: TPopUpTeclas;
     ALstFormacion: TAction;
     ALstConfigFor: TAction;
     LFCategoryAction2: TLFCategoryAction;
     ALstEtiqueta: TAction;
     ALstCodBarrasEmpl: TAction;
     ToolButton4: TToolButton;
     ALEmpleados: TLFActionList;
     ToolButton5: TToolButton;
     ToolButton8: TToolButton;
     LFCategoryAction3: TLFCategoryAction;
     AMarcajes: TAction;
     ADocumentos: TAction;
     LFormacionEspecifica: TLFLabel;
     LFDBFormacionEspHab: TLFDBMemo;
     TBCarpetas: TToolButton;
     ALstResumen: TAction;
     ALstResumenEmpleados: TAction;
     TSNomina: TTabSheet;
     LFCtaDevengo: TLFLabel;
     LFCtaRetencion: TLFLabel;
     LFCtaRemuneracion: TLFLabel;
     LFCtaSeguroSocial: TLFLabel;
     ECtaDevengo: TLFEdit;
     ECtaRetencion: TLFEdit;
     ECtaRemuneracion: TLFEdit;
     ECtaSegSocial: TLFEdit;
     PNLCuentas: TLFPanel;
     EFCtaDevengo: TLFDBEditFind2000;
     EFCtaRetencion: TLFDBEditFind2000;
     EFCtaRemuneracion: TLFDBEditFind2000;
     EFCtaSegSocial: TLFDBEditFind2000;
     TBNominas: TLFToolBar;
     NavNominas: THYMNavigator;
     CENominas: TControlEdit;
     CENominasPMEdit: TPopUpTeclas;
     DBETerceroNomina: TLFDbedit;
     DBETituloTerceroNomina: TLFDbedit;
     ToolButton9: TToolButton;
     LCtaAnticipo: TLFLabel;
     EFCtaAnticipo: TLFDBEditFind2000;
     ECtaAnticipo: TLFEdit;
     SBATercero: TSpeedButton;
     LFCtaSeguroSocialEmpresa: TLFLabel;
     ECtaSegSocialEmpresa: TLFEdit;
     EFCtaSegSocialEmpresa: TLFDBEditFind2000;
     BCargarImagen: TButton;
     LUsuario: TLFLabel;
     DBEFUsuario: TLFDBEditFind2000;
     EUsuario: TLFEdit;
     SBACalendario: TSpeedButton;
     DBCBActivo: TLFDBCheckBox;
     LID: TLFLabel;
     DBEIdEmpleado: TLFDbedit;
     BClipboard: TButton;
     TSSecciones: TTabSheet;
     TBSecciones: TLFToolBar;
     DBETerceroSecciones: TLFDbedit;
     DBETituloTerceroSecciones: TLFDbedit;
     ToolButton10: TToolButton;
     NavSecciones: THYMNavigator;
     DBGFSecciones: TDBGridFind2000;
     PNLSecciones: TLFPanel;
     LFCategoryAction4: TLFCategoryAction;
     AAdjuntosEmpleado: TAction;
     AAdjuntosTercero: TAction;
     DBECodigoGestoria: TLFDbedit;
     LCodigoGestoria: TLFLabel;
     LCtaSIngServSociales: TLFLabel;
     LCtaRetribucionesEspecieSocios: TLFLabel;
     LCtaICECES: TLFLabel;
     LCtaCERETA: TLFLabel;
     ECtaSIngServSociales: TLFEdit;
     ECtaRetribucionesEspecieSocios: TLFEdit;
     DBEFCtaRetribucionesEspecieSocios: TLFDBEditFind2000;
     DBEFCtaSIngServSociales: TLFDBEditFind2000;
     DBEFCtaICECES: TLFDBEditFind2000;
     ECtaICECES: TLFEdit;
     ECtaCERETA: TLFEdit;
     DBEFCtaCERETA: TLFDBEditFind2000;
     LCtaRetribucionEspeciaAutonomo: TLFLabel;
     DBEFCtaRetribucionEspeciaAutonomo: TLFDBEditFind2000;
     ECtaRetribucionEspeciaAutonomo: TLFEdit;
     LEjemploContabilizacionNomina: TLabel;
     TSHorasCompensar: TTabSheet;
     TBHorasCompensar: TLFToolBar;
     DBETerceroHorasCompensar: TLFDbedit;
     DBEDescTereroHorasCompensar: TLFDbedit;
     TBSep1: TToolButton;
     NavHorasCompensar: THYMNavigator;
     PNLHorasCompensar: TLFPanel;
     DBGFHorasCompensar: TDBGridFind2000;
     PNLHorasCompensarFechaIni: TLFPanel;
     LHorasCompensarFechaIni: TLFLabel;
     DEHorasCompensarFechaIni: TLFDateEdit;
     LCliente: TLFLabel;
     DBEFCliente: TLFDBEditFind2000;
     ECliente: TLFEdit;
     LDireccionCliente: TLFLabel;
     DBEFDireccion: TLFDBEditFind2000;
     EDireccion: TLFEdit;
     DBCBApto: TLFDBCheckBox;
     TSImputaciones: TTabSheet;
     PNLImputaciones: TLFPanel;
     TBImputaciones: TLFToolBar;
     NavImputaciones: THYMNavigator;
     DBGFImputaciones: TDBGridFind2000;
     LNombre: TLFLabel;
     DBENombre: TLFDbedit;
     LTipoDocumento: TLFLabel;
     DBEPaisTercero: TLFDBEditFind2000;
     DBETipoDocumento: TLFDBEditFind2000;
     ETipoDocumentoTitulo: TLFEdit;
     DBECif: TLFDbedit;
     LDireccion2: TLFLabel;
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
     DBEDireccion2: TLFDbedit;
     DBEEmpleadoImputaciones: TLFDbedit;
     DBEDescEmpleadoImputaciones: TLFDbedit;
     TBSep2: TToolButton;
     LBancoCuenta: TLFLabel;
     LBancoEntidad: TLFLabel;
     LBancoIBAN: TLFLabel;
     LBancoBIC: TLFLabel;
     DBE_B_Sucursal: TLFDbedit;
     DBE_B_Cuenta: TLFDbedit;
     DBEFEntidad: TLFDBEditFind2000;
     DBE_B_DigCont: TLFDbedit;
     DBEBIC: TLFDbedit;
     DBEIBAN: TLFDbedit;
     EEntidad: TLFEdit;
     LCtaEmbargo: TLFLabel;
     DBEFCtaEmbargo: TLFDBEditFind2000;
     ECtaEmbargo: TLFEdit;
     DBETelefono1: TLFDbedit;
     LTelefonos: TLFLabel;
     DBETelefono2: TLFDbedit;
     LCorreo: TLFLabel;
     DBECorreo: TLFDbedit;
     LDireccion: TLFLabel;
     LGenero: TLFLabel;
     DBCBGenero: TRxDBComboBox;
     LContactoNombre: TLFLabel;
     LContactoParentesco: TLFLabel;
     DBEContacto: TLFDbedit;
     DBEParentesco: TLFDbedit;
     LContactoTelefono: TLFLabel;
     DBEContactoTelefono: TLFDbedit;
     TSContratos: TTabSheet;
     TBContratos: TLFToolBar;
     DBEEmpleadoContratos: TLFDbedit;
     DBEDescTerceroContratos: TLFDbedit;
     TBSep3: TToolButton;
     NavContratos: THYMNavigator;
     DBGContratos: TDBGridFind2000;
     PNLContratos: TLFPanel;
     CEContratos: TControlEdit;
     CEContratosPMEdit: TPopUpTeclas;
     LFecUltimaLlamada: TLFLabel;
     DBDEFecUltimaLlamada: TLFDBDateEdit;
     LFCategoryAction5: TLFCategoryAction;
     AFiltroTodos: TAction;
     AFiltroInactivos: TAction;
     AFiltroActivos: TAction;
     TSIncapacidadTransitoria: TTabSheet;
     TBContratos1: TLFToolBar;
     DBEIncapacidadTransitoriaEmpleado: TLFDbedit;
     DBEIncapacidadTransitoriaDescTercero: TLFDbedit;
     TBSep32: TToolButton;
     NavIncapacidadTransitoria: THYMNavigator;
     PNLIncapacidadTransitoria: TLFPanel;
     DBGIncapacidadTransitoria: TDBGridFind2000;
     CEIncapacidadTransitoria: TControlEdit;
     CEIncapacidadTransitoriaPMEdit: TPopUpTeclas;
     DBCBContratoSuspendido: TLFDBCheckBox;
     DBDEFechaSuspencionContrato: TLFDBDateEdit;
     PnlDireccion: TPanel;
     DBEPais: TLFDbedit;
     DBECpostal: TLFDbedit;
     DBELocalidadNombre: TLFDbedit;
     DBEProvincia: TLFDbedit;
     EFLocalidad: TLFDBEditFind2000;
     SBNuevaLocalidadFicha: TSpeedButton;
     LProvincia: TLFLabel;
     LPaisDireccion: TLFLabel;
     DBEPaisDireccion: TLFDBEditFind2000;
     ETituloPaisDireccion: TLFEdit;
     LLocalidad: TLFLabel;
     PnlDireccion2: TLFPanel;
     LRegion: TLFLabel;
     LProvinciaDireccion: TLFLabel;
     LPoblacion: TLFLabel;
     LCodigoPostal: TLFLabel;
     ETituloRegion: TLFEdit;
     ETituloProvinciaTercero: TLFEdit;
     ETituloPoblacion: TLFEdit;
     ETituloCodigoPostal: TLFEdit;
     DBERegion: TLFDBEditFind2000;
     DBEProvinciaDireccion: TLFDBEditFind2000;
     EFPoblacion: TLFDBEditFind2000;
     EFCodigoPostal: TLFDBEditFind2000;
     LFechaIngreso: TLFLabel;
     LFDBDateEdit1: TLFDBDateEdit;
     DBCBNacionalidad: TLFDBComboBoxValue;
     LOriundo: TLFLabel;
     TSConceptosNomina: TTabSheet;
     PNLConceptosNomina: TLFPanel;
     PNLNominasPeriodo: TLFPanel;
     TBConceptosNomina: TLFToolBar;
     DBETituloTerceroConceptosNomina: TLFDbedit;
     DBETerceroConceptosNomina: TLFDbedit;
     PNLOtrosDatosNominas: TLFPanel;
     LSueldoBase: TLFLabel;
     DBESueldoBase: TLFDbedit;
     LMovilizacion: TLFLabel;
     DBEMovilizacion: TLFDbedit;
     LColacion: TLFLabel;
     DBEColacion: TLFDbedit;
     DBEFonasa: TLFDbedit;
     LFonasa: TLFLabel;
     DBEPlanIsapre: TLFDbedit;
     LPlanIsapre: TLFLabel;
     DBEIsapre: TLFDBEditFind2000;
     LIsapre: TLFLabel;
     ETituloIsapre: TLFEdit;
     ETituloAFP: TLFEdit;
     DBEAFP: TLFDBEditFind2000;
     LAFP: TLFLabel;
     LFPlanISAPREUF: TLFLabel;
     LTipoContrato: TLFLabel;
     DBCHKGratificacion: TLFDBCheckBox;
     ETipoContrato: TLFEdit;
     DBETipoContrato: TLFDBEditFind2000;
     Splitter1: TSplitter;
     PNLIncapacidad: TLFPanel;
     TBIncapacidad: TLFToolBar;
     NavIncapacidad: THYMNavigator;
     LApellido: TLFLabel;
     LAMaterno: TLFLabel;
     DBEApellido: TLFDbedit;
     DBEAMaterno: TLFDbedit;
     DBCBEstadoCivil: TRxDBComboBox;
     DBCBDiscapacidad: TRxDBComboBox;
     LDiscapacidad: TLFLabel;
     DBDTPFechaFin: TLFDBDateEdit;
     LFLabel1: TLFLabel;
     DBEJornada: TLFDBEditFind2000;
     LTipoJornada: TLFLabel;
     EDescripcionJornada: TLFEdit;
     EDescripcionTipoJornada: TLFEdit;
     DBETipoJornada: TLFDBEditFind2000;
     DBEHoras: TLFDbedit;
     LHoras: TLFLabel;
     LArea: TLFLabel;
     DBEArea: TLFDBEditFind2000;
     EDescripcionArea: TLFEdit;
     LFLabel2: TLFLabel;
     DBECentroCosto: TLFDBEditFind2000;
     EDescripcionCentroCosto: TLFEdit;
     LVenPlazoFijo: TLFLabel;
     DBDTPVenPlazoFijo: TLFDBDateEdit;
     LMedioPago: TLFLabel;
     DBEMedioPago: TLFDBEditFind2000;
     EDescripcionMedioPago: TLFEdit;
     LTipoCuenta: TLFLabel;
     DBEFTipoCuenta: TLFDBEditFind2000;
     EDescripcionTipoCuenta: TLFEdit;
     SBAJornada: TSpeedButton;
     SBATipoJornada: TSpeedButton;
     SBAAreas: TSpeedButton;
     SBACCosto: TSpeedButton;
     HYTDBGrid1: THYTDBGrid;
     DBGIncapacidad: TDBGridFind2000;
     BRellenacuentasDefecto: TButton;
     LEntidadEmpleado: TLFLabel;
     LCuenta: TLFLabel;
     DBEEntidadEmpleado: TLFDBEditFind2000;
     DBECuenta: TLFDbedit;
     DBEEntidadEmpleadoTitulo: TLFEdit;
     DEFechaIni: TLFDateEdit;
     DEFechaFin: TLFDateEdit;
     DBECuentaChl: TLFDBEditFind2000;
     DBEAnticipo: TLFDBEditFind2000;
     LAnticipo: TLFLabel;
     DBEPrestamo: TLFDBEditFind2000;
     LPrestamo: TLFLabel;
     DBELeyesSociales: TLFDBEditFind2000;
     LLeyesSociales: TLFLabel;
     DBEFonasaCuemta: TLFDBEditFind2000;
     LFonasaCuenta: TLFLabel;
     LMutual: TLFLabel;
     DBEFMutual: TLFDBEditFind2000;
     LImpuestoUnico: TLFLabel;
     DBEFImpuestoUnico: TLFDBEditFind2000;
     LCuentaChl: TLFLabel;
     DEBE: TLFLabel;
     LFLabel3: TLFLabel;
     LDescuadre: TLFLabel;
     DBELDescuadre: TLFDBEditFind2000;
     LGastoRemuneracion: TLFLabel;
     DBEGastoRemuneracion: TLFDBEditFind2000;
     LMutualEmpresa: TLFLabel;
     DBEMutualEmpresa: TLFDBEditFind2000;
     LSeguroCesantia: TLFLabel;
     DBESeguroCesantia: TLFDBEditFind2000;
     LPaisBanco: TLFLabel;
     DBEFPaisBanco: TLFDBEditFind2000;
     EPaisBanco: TLFEdit;
     DBEFProyecto: TDBEditFind2000;
     EProyecto: TLFEdit;
     LProyecto: TLFLabel;
     LLRE: TLFLabel;
     ELRETitulo: TLFEdit;
     DBELRE: TLFDBEditFind2000;
     LEmpresaDstReparacion: TLFLabel;
     DBEFEmpresaDstReparacion: TDBEditFind2000;
     EEmpresaDstReparacion: TLFEdit;
     ESerieDstReparacion: TLFEdit;
     DBEFSerieDstReparacion: TDBEditFind2000;
     LSerieDstReparacion: TLFLabel;
     LDestinoReparaciones: TLFLabel;
     AImportaAusenciasFIE: TAction;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormCreate(Sender: TObject);
     procedure TbuttCompClick(Sender: TObject);
     procedure Fichaempleado1Click(Sender: TObject);
     procedure CBTipoRecImpClick(Sender: TObject);
     procedure DBEFImputacionBusqueda(Sender: TObject);
     procedure AListadoEmpleadosExecute(Sender: TObject);
     procedure DBEFImagenChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure DBEFTerceroChange(Sender: TObject);
     procedure DBEFCategoriaChange(Sender: TObject);
     procedure DBEFCentroChange(Sender: TObject);
     procedure DBEFDepartamentoChange(Sender: TObject);
     procedure DBEFSeccionChange(Sender: TObject);
     procedure DBEFCalChange(Sender: TObject);
     procedure DBEFTipContratoChange(Sender: TObject);
     procedure DBEFHorarioChange(Sender: TObject);
     procedure DBEFRecursoChange(Sender: TObject);
     procedure SelectionChange(Sender: TObject);
     procedure TButtUndoClick(Sender: TObject);
     procedure TButtCutClick(Sender: TObject);
     procedure TButtCopyClick(Sender: TObject);
     procedure TButtPasteClick(Sender: TObject);
     procedure FontNameChange(Sender: TObject);
     procedure FontSizeChange(Sender: TObject);
     procedure TButtNegritaClick(Sender: TObject);
     procedure TButtCursivaClick(Sender: TObject);
     procedure TButtSubrayadoClick(Sender: TObject);
     procedure TButtLeftAlignClick(Sender: TObject);
     procedure TButtCenterAlignClick(Sender: TObject);
     procedure TButtRightAlignClick(Sender: TObject);
     procedure TButtColorClick(Sender: TObject);
     procedure DBEFTTareaChange(Sender: TObject);
     procedure DBEFImputacionChange(Sender: TObject);
     procedure DBCBImputacionChange(Sender: TObject);
     procedure ALstConfigExecute(Sender: TObject);
     procedure ALstFormacionExecute(Sender: TObject);
     procedure ALstConfigForExecute(Sender: TObject);
     procedure ALstEtiquetaExecute(Sender: TObject);
     procedure ALstCodBarrasEmplExecute(Sender: TObject);
     procedure AMarcajesExecute(Sender: TObject);
     procedure ADocumentosExecute(Sender: TObject);
     procedure TBCarpetasClick(Sender: TObject);
     procedure ALstResumenExecute(Sender: TObject);
     procedure ALstResumenEmpleadosExecute(Sender: TObject);
     procedure EFCtaDevengoChange(Sender: TObject);
     procedure EFCtaRetencionChange(Sender: TObject);
     procedure EFCtaRemuneracionChange(Sender: TObject);
     procedure EFCtaSegSocialChange(Sender: TObject);
     procedure EFCtaAnticipoChange(Sender: TObject);
     procedure SBATerceroDblClick(Sender: TObject);
     procedure ExpandirCuentaExit(Sender: TObject);
     procedure ExpandirCuentaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure EFCtaSegSocialEmpresaChange(Sender: TObject);
     procedure EFOnBusqueda(Sender: TObject);
     procedure BCargarImagenClick(Sender: TObject);
     procedure DBEFUsuarioChange(Sender: TObject);
     procedure SBACalendarioDblClick(Sender: TObject);
     procedure BClipboardClick(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure AAdjuntosEmpleadoExecute(Sender: TObject);
     procedure AAdjuntosTerceroExecute(Sender: TObject);
     procedure DBEFCtaRetribucionesEspecieSociosChange(Sender: TObject);
     procedure DBEFCtaSIngServSocialesChange(Sender: TObject);
     procedure DBEFCtaICECESChange(Sender: TObject);
     procedure DBEFCtaCERETAChange(Sender: TObject);
     procedure DBEFCtaRetribucionEspeciaAutonomoChange(Sender: TObject);
     procedure DEHorasCompensarFechaIniChange(Sender: TObject);
     procedure DBEFClienteChange(Sender: TObject);
     procedure DBEFDireccionBusqueda(Sender: TObject);
     procedure DBEFDireccionChange(Sender: TObject);
     procedure DBETipoDocumentoBusqueda(Sender: TObject);
     procedure DBETipoDocumentoChange(Sender: TObject);
     procedure DBECifExit(Sender: TObject);
     procedure DBEPaisTerceroExit(Sender: TObject);
     procedure DBETipoDocumentoExit(Sender: TObject);
     procedure DBECifChange(Sender: TObject);
     procedure DBEFEntidadChange(Sender: TObject);
     procedure DBE_B_SucursalChange(Sender: TObject);
     procedure DBE_B_DigContChange(Sender: TObject);
     procedure DBE_B_CuentaChange(Sender: TObject);
     procedure DBEIBANChange(Sender: TObject);
     procedure DBEIBANEnter(Sender: TObject);
     procedure DBEFCtaEmbargoChange(Sender: TObject);
     procedure AFiltroTodosExecute(Sender: TObject);
     procedure AFiltroInactivosExecute(Sender: TObject);
     procedure AFiltroActivosExecute(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
     procedure DBERegionChange(Sender: TObject);
     procedure DBEProvinciaDireccionChange(Sender: TObject);
     procedure EFPoblacionChange(Sender: TObject);
     procedure EFCodigoPostalChange(Sender: TObject);
     procedure DBERegionBusqueda(Sender: TObject);
     procedure DBEProvinciaDireccionBusqueda(Sender: TObject);
     procedure EFPoblacionBusqueda(Sender: TObject);
     procedure EFCodigoPostalBusqueda(Sender: TObject);
     procedure DBEPaisDireccionChange(Sender: TObject);
     procedure DBEAFPChange(Sender: TObject);
     procedure DBEIsapreChange(Sender: TObject);
     procedure PNLConceptosNominaResize(Sender: TObject);
     procedure DBGNominasParametrosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGNominasHaberesBusqueda(Sender: TObject);
     procedure DBGNominasDescuentosBusqueda(Sender: TObject);
     procedure DBETipoContratoChange(Sender: TObject);
     procedure DBEJornadaChange(Sender: TObject);
     procedure DBETipoJornadaChange(Sender: TObject);
     procedure DBEAreaChange(Sender: TObject);
     procedure DBECentroCostoChange(Sender: TObject);
     procedure DBEMedioPagoChange(Sender: TObject);
     procedure DBEFTipoCuentaChange(Sender: TObject);
     procedure SBAJornadaDblClick(Sender: TObject);
     procedure BRellenacuentasDefectoClick(Sender: TObject);
     procedure NavNominasClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure HYTDBGrid1DblClick(Sender: TObject);
     procedure DBEEntidadEmpleadoChange(Sender: TObject);
     procedure DBGIncapacidadTransitoriaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DEFechaIniChange(Sender: TObject);
     procedure DEFechaFinChange(Sender: TObject);
     procedure NavIncapacidadTransitoriaClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBECuentaChlDblClick(Sender: TObject);
     procedure DBEFPaisBancoChange(Sender: TObject);
     procedure DBEFEntidadBusqueda(Sender: TObject);
     procedure DBEFProyectoChange(Sender: TObject);
     procedure DBELREChange(Sender: TObject);
     procedure DBEFSerieDstReparacionBusqueda(Sender: TObject);
     procedure DBEFEmpresaDstReparacionChange(Sender: TObject);
     procedure DBEFSerieDstReparacionChange(Sender: TObject);
     procedure AImportaAusenciasFIEExecute(Sender: TObject);
  private
     { Private declarations }
     FUpdating: boolean;
     FactoEscalaPNLDescuentos: double;
     FactorEscalaPNLParametros: double;
     function CurrText(Notas: TDBRichEdit): TTextAttributes;
     procedure GetFontNames;
     procedure ValidaDocumentoIdentificacion;
     procedure CompruebaCuentaBancaria;
     procedure EjecutaContaExtracto(Cuenta: string);
  public
     { Public declarations }
     procedure FiltraEmpleado(Filtro: string);
     procedure Tercero_a_Empleado(Tercero: integer);
     procedure MuestraTabla;
  end;

var
  OpeFMEmpleados : TOpeFMEmpleados;

implementation

uses UDMMain, UEntorno, UDameDato, UFormGest, UOpeDMEmpleados, UDMListados, UFMListconfig,
  UProFMFicherosCliente, UFMain, UProFMCarpetas, UOpeFMLstFormacion,
  UOpeFMLstEtiquetasEmpleados, UProFmlstCodbarras, UUtiles, UFMAdjunto,
  UFMPresencia, DateUtils, ShellApi, URecibeFicheros, UDMAdjunto,
  UDMTerceros, UFMSeleccion, UFMNominasCabecera, UImagenes;

{$R *.DFM}

procedure TOpeFMEmpleados.FormCreate(Sender: TObject);
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);
  AbreData(TOpeDMEmpleados, OpeDMEmpleados);
  AbreData(TDMListados, DMListados);

  // Formatació texte
  GetFontNames;
  SelectionChange(Self);

  CurrText(DBMNotas).Name := DefFontData.Name;
  CurrText(DBMNotas).Size := -MulDiv(DefFontData.Height, 72, Screen.PixelsPerInch);

  NavMain.DataSource := OpeDMEmpleados.DSQMEmpleados;
  EPMain.DataSource := OpeDMEmpleados.DSQMEmpleados;
  DBGMain.DataSource := OpeDMEmpleados.DSQMEmpleados;
  G2kTableLoc.DataSource := OpeDMEmpleados.DSQMEmpleados;
  DBGIncapacidad.DataSource := OpeDMEmpleados.DSQMIncapacidad;
  NavIncapacidad.DataSource := OpeDMEmpleados.DSQMIncapacidad;

  // Si el tipus d'imputació és 0, és a dir, està marcat, posem enabled
  DBEFImputacion.Enabled := (OpeDMEmpleados.QMEmpleadosTIPOIMPUTACION.AsInteger = 2);

  DEHorasCompensarFechaIni.Date := EncodeDate(YearOf(Today), 1, 1);
  DEHorasCompensarFechaIniChange(Self);

  SolapaControles(SBATercero, DescTercero);
  DescTercero.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBACalendario, DescCalendario);
  DescCalendario.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAJornada, EDescripcionJornada);
  EDescripcionJornada.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBATipoJornada, EDescripcionTipoJornada);
  EDescripcionTipoJornada.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBAAreas, EDescripcionArea);
  EDescripcionArea.Color := REntorno.ColorEnlaceActivo;
  SolapaControles(SBACCOsto, EDescripcionCentroCosto);
  EDescripcionCentroCosto.Color := REntorno.ColorEnlaceActivo;
  //SolapaControles(SBAEmpleado, DBETituloTerceroConceptosNomina);
  DBETituloTerceroConceptosNomina.Color := REntorno.ColorEnlaceActivo;
  FMain.AddComponentePunto(EFCtaDevengo);
  FMain.AddComponentePunto(EFCtaRetencion);
  FMain.AddComponentePunto(EFCtaRemuneracion);
  FMain.AddComponentePunto(EFCtaSegSocial);
  FMain.AddComponentePunto(EFCtaAnticipo);
  FMain.AddComponentePunto(EFCtaSegSocialEmpresa);
  FMain.AddComponentePunto(DBEFCtaRetribucionesEspecieSocios);
  FMain.AddComponentePunto(DBEFCtaSIngServSociales);
  FMain.AddComponentePunto(DBEFCtaRetribucionEspeciaAutonomo);
  FMain.AddComponentePunto(DBEFCtaICECES);
  FMain.AddComponentePunto(DBEFCtaCERETA);
  FMain.AddComponentePunto(DBEFCtaEmbargo);

  EFCtaDevengo.MaxLength := REntorno.DigitosSub;
  EFCtaRetencion.MaxLength := REntorno.DigitosSub;
  EFCtaRemuneracion.MaxLength := REntorno.DigitosSub;
  EFCtaSegSocial.MaxLength := REntorno.DigitosSub;
  EFCtaAnticipo.MaxLength := REntorno.DigitosSub;
  EFCtaSegSocialEmpresa.MaxLength := REntorno.DigitosSub;
  DBEFCtaRetribucionesEspecieSocios.MaxLength := REntorno.DigitosSub;
  DBEFCtaSIngServSociales.MaxLength := REntorno.DigitosSub;
  DBEFCtaRetribucionEspeciaAutonomo.MaxLength := REntorno.DigitosSub;
  DBEFCtaICECES.MaxLength := REntorno.DigitosSub;
  DBEFCtaCERETA.MaxLength := REntorno.DigitosSub;
  DBEFCtaEmbargo.MaxLength := REntorno.DigitosSub;

  // Habilitamos elementos especificos para Chile
  if (REntorno.Pais = 'CHL') then
  begin
     PnlDireccion2.Visible := True;
     PnlDireccion.Visible := False;
     DBEPaisDireccion.Visible := True;
     LPaisDireccion.Visible := True;
     ETituloPaisDireccion.Visible := True;
     TSConceptosNomina.TabVisible := True;
     TSSecciones.TabVisible := True;
     TSHorasCompensar.TabVisible := True;
     TSImputaciones.TabVisible := True;
     TSIncapacidadTransitoria.TabVisible := True;
     LblNumSegSoc.Visible := False;
     DBENunSegSoc.Visible := False;
  end
  else
  begin
     PnlDireccion2.Visible := False;
     PnlDireccion.Visible := True;
     DBEPaisDireccion.Visible := False;
     LPaisDireccion.Visible := False;
     ETituloPaisDireccion.Visible := False;
     TSConceptosNomina.TabVisible := False;
     TSSecciones.TabVisible := False;
     TSHorasCompensar.TabVisible := False;
     TSImputaciones.TabVisible := False;
     TSIncapacidadTransitoria.TabVisible := False;
     LblNumSegSoc.Visible := True;
     DBENunSegSoc.Visible := True;
  end;

  // Color campo ID
  ColorCampoID(DBEIdEmpleado);

  // Proporción para que el panel de parametros sea un poco mas grande porque tiene mas campos.
  FactorEscalaPNLParametros := 2.61;
  FactoEscalaPNLDescuentos := 3.19;
end;

procedure TOpeFMEmpleados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FMain.DelComponentePunto(EFCtaDevengo);
  FMain.DelComponentePunto(EFCtaRetencion);
  FMain.DelComponentePunto(EFCtaRemuneracion);
  FMain.DelComponentePunto(EFCtaSegSocial);
  FMain.DelComponentePunto(EFCtaAnticipo);
  FMain.DelComponentePunto(EFCtaSegSocialEmpresa);
  FMain.DelComponentePunto(DBEFCtaRetribucionesEspecieSocios);
  FMain.DelComponentePunto(DBEFCtaSIngServSociales);
  FMain.DelComponentePunto(DBEFCtaRetribucionEspeciaAutonomo);
  FMain.DelComponentePunto(DBEFCtaICECES);
  FMain.DelComponentePunto(DBEFCtaCERETA);
  FMain.DelComponentePunto(DBEFCtaEmbargo);

  CierraData(OpeDMEmpleados);
  CierraData(DMListados);
end;

procedure TOpeFMEmpleados.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  OpeDMEmpleados.BusquedaCompleja;
  Continua := False;
end;

procedure TOpeFMEmpleados.TbuttCompClick(Sender: TObject);
begin
  inherited;
  if Trim(DBEFTercero.Text) <> '' then
     FMain.MuestraInfoTercero(StrToIntDef(DBEFTercero.Text, 0));
end;

procedure TOpeFMEmpleados.Fichaempleado1Click(Sender: TObject);
begin
  inherited;
  DMListados.Imprimir(8010, 0, 0, '', '', OpeDMEmpleados.frEmpleados, OpeDMEmpleados.frxEmpleados, nil);
end;

procedure TOpeFMEmpleados.CBTipoRecImpClick(Sender: TObject);
begin
  inherited;
  { Parece que no se utiliza
  if ((Sender as TCheckBox).Checked = True) then
  begin
     DBEFRecurso.Enabled := True;
     DBGFImputaciones.Columns[EncuentraField(DBGFImputaciones, 'HORAS')].Visible := False;
  end
  else //si es false
  begin
     DBEFRecurso.Enabled := False;
     DBGFImputaciones.Columns[EncuentraField(DBGFImputaciones, 'HORAS')].Visible := True;
  end;
  }
end;

procedure TOpeFMEmpleados.DBEFImputacionBusqueda(Sender: TObject);
begin
  inherited;
  DBEFImputacion.CondicionBusqueda := 'empresa=' + REntorno.EmpresaStr + ' and empleado=' + OpeDMEmpleados.QMEmpleadosEMPLEADO.AsString;
end;

procedure TOpeFMEmpleados.AListadoEmpleadosExecute(Sender: TObject);
begin
  inherited;
  DMListados.Imprimir(8010, 0, 0, '', '', OpeDMEmpleados.frEmpleados, OpeDMEmpleados.frxEmpleados, nil);
end;

procedure TOpeFMEmpleados.DBEFImagenChange(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
  ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
end;

procedure TOpeFMEmpleados.FormShow(Sender: TObject);
var
  c : integer;
begin
  inherited;
  RefrescarImagen(Imagen, OpeDMEmpleados.QMEmpleadosID_IMAGEN.AsInteger);

  c := EncuentraField(DBGContratos, 'CODIGO_FINALIZACION_CHL');
  if (c >= 0) then
     DBGContratos.Columns[c].Visible := (REntorno.Pais = 'CHL')
  else
  begin
     with DBGContratos.Columns.Add do
     begin
        FieldName := 'CODIGO_FINALIZACION_CHL';
        Width := 250;
        Visible := (REntorno.Pais = 'CHL');
     end;
  end;

  c := EncuentraField(DBGContratos, 'DESC_FINALIZACION_CHL');
  if (c >= 0) then
     DBGContratos.Columns[c].Visible := (REntorno.Pais = 'CHL')
  else
  begin
     with DBGContratos.Columns.Add do
     begin
        FieldName := 'DESC_FINALIZACION_CHL';
        Width := 250;
        Visible := (REntorno.Pais = 'CHL');
     end;
  end;
end;

procedure TOpeFMEmpleados.TSFichaShow(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, OpeDMEmpleados.QMEmpleadosID_IMAGEN.AsInteger);
end;

procedure TOpeFMEmpleados.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button = nbEdit then
  begin
     DBEEmpleado.Enabled := False;
     DBEEmpleado.Color := clInfoBk;
  end
  else
  begin
     DBEEmpleado.Enabled := True;
     DBEEmpleado.Color := clWindow;
  end;

  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);
end;

procedure TOpeFMEmpleados.DBEFTerceroChange(Sender: TObject);
begin
  inherited;
  DescTercero.ActualizaDatos('TERCERO', DBEFTercero.Text);
end;

procedure TOpeFMEmpleados.DBEFCategoriaChange(Sender: TObject);
begin
  inherited;
  DescCategoria.ActualizaDatos('CATEGORIA', DBEFCategoria.Text);
end;

procedure TOpeFMEmpleados.DBEFCentroChange(Sender: TObject);
begin
  inherited;
  DescCentro.ActualizaDatos('CENTRO', DBEFCentro.Text);
end;

procedure TOpeFMEmpleados.DBEFDepartamentoChange(Sender: TObject);
begin
  inherited;
  DescDepartamento.ActualizaDatos('DEPARTAMENTO', DBEFDepartamento.Text);
end;

procedure TOpeFMEmpleados.DBEFSeccionChange(Sender: TObject);
begin
  inherited;
  DescSeccion.ActualizaDatos('SECCION', DBEFSeccion.Text);
end;

procedure TOpeFMEmpleados.DBEFCalChange(Sender: TObject);
begin
  inherited;
  DescCalendario.ActualizaDatos('CALENDARIO', DBEFCal.Text);
end;

procedure TOpeFMEmpleados.DBEFTipContratoChange(Sender: TObject);
begin
  inherited;
  DescTipoContrato.ActualizaDatos('TIPO_CONTRATO', DBEFTipContrato.Text);
end;

procedure TOpeFMEmpleados.DBEFHorarioChange(Sender: TObject);
begin
  inherited;
  DescHorario.ActualizaDatos('HORARIO', DBEFHorario.Text);
end;

procedure TOpeFMEmpleados.DBEFRecursoChange(Sender: TObject);
begin
  inherited;
  DescRecurso.ActualizaDatos('RECURSO', DBEFRecurso.Text);
end;

function TOpeFMEmpleados.CurrText(Notas: TDBRichEdit): TTextAttributes;
begin
  if Notas.SelLength > 0 then
     Result := Notas.SelAttributes
  else
     Result := Notas.DefAttributes;
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric; FontType: integer; Data: Pointer): integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure TOpeFMEmpleados.DBGIncapacidadTransitoriaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) and (DataSource.State in [dsEdit, dsInsert]) then
     begin
        with DEFechaIni do
        begin
           if (Column.FieldName = 'FECHA_INICIO') then
           begin
              Left := Rect.Left + DBGIncapacidadTransitoria.Left + 1;
              Top := Rect.Top + DBGIncapacidadTransitoria.Top + 1;
              Width := Rect.Right - Rect.Left + 2;
              Height := Rect.Bottom - Rect.Top + 2;
              Date := OpeDMEmpleados.xIncapacidadTransitoriaFECHA_INICIO.AsDateTime;
              Visible := True;
           end
           else
              Visible := False;
        end;

        with DEFechaFin do
        begin
           if (Column.FieldName = 'FECHA_FIN') then
           begin
              Left := Rect.Left + DBGIncapacidadTransitoria.Left + 1;
              Top := Rect.Top + DBGIncapacidadTransitoria.Top + 1;
              Width := Rect.Right - Rect.Left + 2;
              Height := Rect.Bottom - Rect.Top + 2;
              Date := OpeDMEmpleados.xIncapacidadTransitoriaFECHA_FIN.AsDateTime;
              Visible := True;
           end
           else
              Visible := False;
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TOpeFMEmpleados.GetFontNames;
var
  DC : HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
  ReleaseDC(0, DC);
  FontName.Sorted := True;
end;

procedure TOpeFMEmpleados.SelectionChange(Sender: TObject);
begin
  with DBMNotas.Paragraph do
     try
        FUpdating := True;
        TButtNegrita.Down := fsBold in DBMNotas.SelAttributes.Style;
        TButtCursiva.Down := fsItalic in DBMNotas.SelAttributes.Style;
        TButtSubrayado.Down := fsUnderline in DBMNotas.SelAttributes.Style;

        FontSize.Text := IntToStr(DBMNotas.SelAttributes.Size);
        FontName.Text := DBMNotas.SelAttributes.Name;
        case Ord(Alignment) of
           0: TButtLeftAlign.Down := True;
           1: TButtRightAlign.Down := True;
           2: TButtCenterAlign.Down := True;
        end;
     finally
        FUpdating := False;
     end;
end;

procedure TOpeFMEmpleados.TButtUndoClick(Sender: TObject);
begin
  inherited;
  with DBMNotas do
     if HandleAllocated then
        SendMessage(Handle, EM_UNDO, 0, 0);
end;

procedure TOpeFMEmpleados.TButtCutClick(Sender: TObject);
begin
  inherited;
  DBMNotas.CutToClipboard;
end;

procedure TOpeFMEmpleados.TButtCopyClick(Sender: TObject);
begin
  inherited;
  DBMNotas.CopyToClipboard;
end;

procedure TOpeFMEmpleados.TButtPasteClick(Sender: TObject);
begin
  inherited;
  DBMNotas.PasteFromClipboard;
end;

procedure TOpeFMEmpleados.FontNameChange(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  CurrText(DBMNotas).Name := FontName.Items[FontName.ItemIndex];
end;

procedure TOpeFMEmpleados.FontSizeChange(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  CurrText(DBMNotas).Size := StrToInt(FontSize.Text);
end;

procedure TOpeFMEmpleados.TButtNegritaClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  if TButtNegrita.Down then
     CurrText(DBMNotas).Style := CurrText(DBMNotas).Style + [fsBold]
  else
     CurrText(DBMNotas).Style := CurrText(DBMNotas).Style - [fsBold];
end;

procedure TOpeFMEmpleados.TButtCursivaClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  if TButtCursiva.Down then
     CurrText(DBMNotas).Style := CurrText(DBMNotas).Style + [fsItalic]
  else
     CurrText(DBMNotas).Style := CurrText(DBMNotas).Style - [fsItalic];
end;

procedure TOpeFMEmpleados.TButtSubrayadoClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  if TButtSubrayado.Down then
     CurrText(DBMNotas).Style := CurrText(DBMNotas).Style + [fsUnderline]
  else
     CurrText(DBMNotas).Style := CurrText(DBMNotas).Style - [fsUnderline];
end;

procedure TOpeFMEmpleados.TButtLeftAlignClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  DBMNotas.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TOpeFMEmpleados.TButtCenterAlignClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  DBMNotas.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TOpeFMEmpleados.TButtRightAlignClick(Sender: TObject);
begin
  inherited;
  if FUpdating then
     Exit;
  DBMNotas.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TOpeFMEmpleados.TButtColorClick(Sender: TObject);
var
  ColorDefecto : TColor;
  ColorSeleccionado : TColor;
begin
  ColorDefecto := DBMNotas.Color;
  ColorSeleccionado := DameColor(ColorDefecto);

  if FUpdating then
     Exit;

  if (ColorSeleccionado <> ColorDefecto) then
     CurrText(DBMNotas).Color := ColorSeleccionado
  else
     CurrText(DBMNotas).Color := ColorDefecto;
end;

procedure TOpeFMEmpleados.DBEFTTareaChange(Sender: TObject);
begin
  inherited;
  DescTTarea.ActualizaDatos('TITPOTAREA', DBEFTTarea.Text);
end;

procedure TOpeFMEmpleados.DBEFImputacionChange(Sender: TObject);
begin
  inherited;
  if (OpeDMEmpleados.QMEmpleados.State in [dsInsert, dsEdit]) then
  begin
     OpeDMEmpleados.QMTipoImputacion.Close;
     OpeDMEmpleados.QMTipoImputacion.Open;
  end;
end;

procedure TOpeFMEmpleados.DBCBImputacionChange(Sender: TObject);
begin
  inherited;
  if (DBCBImputacion.Checked = True) then
  begin
     DBEFImputacion.Enabled := True;
     if (OpeDMEmpleados.QMEmpleados.State in [dsInsert, dsEdit]) then
        DBEFImputacion.SetFocus;
  end
  else
  begin
     DBEFImputacion.Clear;
     DescImputacion.Clear;
     DBEFImputacion.Enabled := False;
  end;
end;

procedure TOpeFMEmpleados.FiltraEmpleado(Filtro: string);
begin
  OpeDMEmpleados.FiltraEmpleado(Filtro);
end;

procedure TOpeFMEmpleados.ALstConfigExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8010, Formato, Cabecera, Copias, Pijama, '', OpeDMEmpleados.frEmpleados);
end;

procedure TOpeFMEmpleados.ALstFormacionExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TOpeFMLstFormacion, OpeFMLstFormacion);
  OpeFMLstFormacion.LFDBEmpleadosDesde.Text := OpeDMEmpleados.QMEmpleadosEMPLEADO.AsString;
  OpeFMLstFormacion.LFDBEmpleadosHasta.Text := OpeDMEmpleados.QMEmpleadosEMPLEADO.AsString;
end;

procedure TOpeFMEmpleados.ALstConfigForExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8033, Formato, Cabecera, Copias, Pijama, '', OpeDMEmpleados.frFormacion);
end;

procedure TOpeFMEmpleados.ALstEtiquetaExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TOpeFMLSTEtiquetasEmpleados, OpeFMLSTEtiquetasEmpleados);
end;

procedure TOpeFMEmpleados.ALstCodBarrasEmplExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMLstCodBarras, ProFMLstCodBarras, Sender);
  ProFMLstCodBarras.PCMain.ActivePage := ProFMLstCodBarras.TSEmpleado;
end;

procedure TOpeFMEmpleados.AMarcajesExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.APresencia);
  FMPresencia.FiltraEmpleado(OpeDMEmpleados.QMEmpleadosEMPLEADO.AsInteger, EncodeDate(YearOf(Today), 1, 1), EncodeDate(YearOf(Today), 12, 31));
end;

procedure TOpeFMEmpleados.ADocumentosExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMFicherosCliente, ProFMFicherosCliente, Sender);
  ProFMFicherosCliente.Filtra(OpeDMEmpleados.QMEmpleadosID_EMPLEADO.AsString, 'OPE_EMPLEADO(ID_EMPLEADO)', 'DELFOS-EMPLEADOS', _('Ficheros de Empleado'));
end;

procedure TOpeFMEmpleados.TBCarpetasClick(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMCarpetas, ProFMCarpetas, Sender);
  ProFMCarpetas.Posicionar(OpeDMEmpleados.QMEmpleadosEMPLEADO.AsInteger, 'OPE');
end;

procedure TOpeFMEmpleados.ALstResumenExecute(Sender: TObject);
var
  IdEmpleado : integer;
begin
  inherited;
  IdEmpleado := OpeDMEmpleados.QMEmpleadosID_EMPLEADO.AsInteger;

  DMListados.Imprimir(8061, 0, 0, '', '', OpeDMEmpleados.frLstResumenEmpl, OpeDMEmpleados.frxLstResumenEmpl, nil);

  Posicionar(OpeDMEmpleados.QMEmpleados, 'ID_EMPLEADO', Idempleado);
end;

procedure TOpeFMEmpleados.ALstResumenEmpleadosExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8061, Formato, Cabecera, Copias, Pijama, '', OpeDMEmpleados.frLstResumenEmpl);
end;

procedure TOpeFMEmpleados.EFCtaDevengoChange(Sender: TObject);
begin
  inherited;
  ECtaDevengo.Text := DameTituloCuenta(EFCtaDevengo.Text);
end;

procedure TOpeFMEmpleados.EFCtaRetencionChange(Sender: TObject);
begin
  inherited;
  ECtaRetencion.Text := DameTituloCuenta(EFCtaRetencion.Text);
end;

procedure TOpeFMEmpleados.EFCtaRemuneracionChange(Sender: TObject);
begin
  inherited;
  ECtaRemuneracion.Text := DameTituloCuenta(EFCtaRemuneracion.Text);
end;

procedure TOpeFMEmpleados.EFCtaSegSocialChange(Sender: TObject);
begin
  inherited;
  ECtaSegSocial.Text := DameTituloCuenta(EFCtaSegSocial.Text);
end;

procedure TOpeFMEmpleados.EFCtaAnticipoChange(Sender: TObject);
begin
  inherited;
  ECtaAnticipo.Text := DameTituloCuenta(EFCtaAnticipo.Text);
end;

procedure TOpeFMEmpleados.SBATerceroDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.ATerceros, 'TERCERO = ' + IntToStr(OpeDMEmpleados.QMEmpleadosTERCERO.AsInteger));
end;

procedure TOpeFMEmpleados.SBACalendarioDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AOpeCalendarioEmp, 'EMPLEADO = ' + IntToStr(OpeDMEmpleados.QMEmpleadosEMPLEADO.AsInteger));
end;

procedure TOpeFMEmpleados.ExpandirCuentaExit(Sender: TObject);
begin
  inherited;
  ExpandirCadenaEdit(TLFDBEditFind2000(Sender));
end;

procedure TOpeFMEmpleados.ExpandirCuentaKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
     ExpandirCadenaEdit(TLFDBEditFind2000(Sender));
end;

procedure TOpeFMEmpleados.EFCtaSegSocialEmpresaChange(Sender: TObject);
begin
  inherited;
  ECtaSegSocialEmpresa.Text := DameTituloCuenta(EFCtaSegSocialEmpresa.Text);
end;

procedure TOpeFMEmpleados.EFOnBusqueda(Sender: TObject);
begin
  inherited;
  TLFDBEditFind2000(Sender).CondicionBusqueda := 'NIVEL=' + IntToStr(REntorno.NivelesCont);
end;

procedure TOpeFMEmpleados.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  OpeDMEmpleados.QMEmpleadosID_IMAGEN.AsInteger := ImportarImagen('');
end;

procedure TOpeFMEmpleados.DBEFUsuarioChange(Sender: TObject);
begin
  inherited;
  EUsuario.Text := DameTituloUsuario(StrToIntDef(DBEFUsuario.Text, 0));
end;

procedure TOpeFMEmpleados.BClipboardClick(Sender: TObject);
begin
  inherited;
  OpeDMEmpleados.QMEmpleadosID_IMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

procedure TOpeFMEmpleados.Tercero_a_Empleado(Tercero: integer);
begin
  OpeDMEmpleados.CambiarTercero(Tercero);
end;

procedure TOpeFMEmpleados.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TOpeFMEmpleados.AAdjuntosEmpleadoExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('OPE', OpeDMEmpleados.QMEmpleadosID_EMPLEADO.AsInteger);
end;

procedure TOpeFMEmpleados.AAdjuntosTerceroExecute(Sender: TObject);
begin
  inherited;
  FMain.MuestraAdunto('TER', OpeDMEmpleados.QMEmpleadosTERCERO.AsInteger);
end;

procedure TOpeFMEmpleados.DBEFCtaRetribucionesEspecieSociosChange(Sender: TObject);
begin
  inherited;
  ECtaRetribucionesEspecieSocios.Text := DameTituloCuenta(DBEFCtaRetribucionesEspecieSocios.Text);
end;

procedure TOpeFMEmpleados.DBEFCtaSIngServSocialesChange(Sender: TObject);
begin
  inherited;
  ECtaSIngServSociales.Text := DameTituloCuenta(DBEFCtaSIngServSociales.Text);
end;

procedure TOpeFMEmpleados.DBEFCtaICECESChange(Sender: TObject);
begin
  inherited;
  ECtaICECES.Text := DameTituloCuenta(DBEFCtaICECES.Text);
end;

procedure TOpeFMEmpleados.DBEFCtaCERETAChange(Sender: TObject);
begin
  inherited;
  ECtaCERETA.Text := DameTituloCuenta(DBEFCtaCERETA.Text);
end;

procedure TOpeFMEmpleados.DBEFCtaRetribucionEspeciaAutonomoChange(Sender: TObject);
begin
  inherited;
  ECtaRetribucionEspeciaAutonomo.Text := DameTituloCuenta(DBEFCtaRetribucionEspeciaAutonomo.Text);
end;

procedure TOpeFMEmpleados.DEHorasCompensarFechaIniChange(Sender: TObject);
begin
  inherited;
  OpeDMEmpleados.SetHorasCompensarFechaIni(DEHorasCompensarFechaIni.Date);
end;

procedure TOpeFMEmpleados.DBEFClienteChange(Sender: TObject);
begin
  inherited;
  ECliente.Text := DameTituloCliente(StrToIntDef(DBEFCliente.Text, 0));
  EDireccion.Text := DameDireccionTercero(OpeDMEmpleados.QMEmpleadosTERCERO_CLIENTE.AsInteger, StrToIntDef(DBEFDireccion.Text, 0));
end;

procedure TOpeFMEmpleados.DBEFDireccionBusqueda(Sender: TObject);
begin
  inherited;
  DBEFDireccion.CondicionBusqueda := 'TERCERO=' + IntToStr(OpeDMEmpleados.QMEmpleadosTERCERO_CLIENTE.AsInteger);
end;

procedure TOpeFMEmpleados.DBEFDireccionChange(Sender: TObject);
begin
  inherited;
  EDireccion.Text := DameDireccionTercero(OpeDMEmpleados.QMEmpleadosTERCERO_CLIENTE.AsInteger, StrToIntDef(DBEFDireccion.Text, 0));
end;

procedure TOpeFMEmpleados.DBETipoDocumentoBusqueda(Sender: TObject);
begin
  inherited;
  DBETipoDocumento.CondicionBusqueda := 'PAIS = ''' + OpeDMEmpleados.QMEmpleadosPAIS_TERCERO.AsString + '''';
end;

procedure TOpeFMEmpleados.DBETipoDocumentoChange(Sender: TObject);
begin
  inherited;
  if ((OpeDMEmpleados.QMEmpleadosPAIS_TERCERO.AsString > '') and (OpeDMEmpleados.QMEmpleadosTIPO_DOC_IDENT.AsString > '')) then
     ETipoDocumentoTitulo.Text := DameTituloTipoDocIdentidad(OpeDMEmpleados.QMEmpleadosPAIS_TERCERO.AsString, OpeDMEmpleados.QMEmpleadosTIPO_DOC_IDENT.AsString);
  ValidaDocumentoIdentificacion;
end;

procedure TOpeFMEmpleados.ValidaDocumentoIdentificacion;
var
  Valido : boolean;
  MensajeError : string;
begin
  DMMain.VerificaDocumentoIdentificacion(OpeDMEmpleados.QMEmpleadosPAIS_TERCERO.AsString, OpeDMEmpleados.QMEmpleadosTIPO_DOC_IDENT.AsString, OpeDMEmpleados.QMEmpleadosNIF.AsString, Valido, MensajeError);
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

procedure TOpeFMEmpleados.CompruebaCuentaBancaria;
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

procedure TOpeFMEmpleados.DBECifExit(Sender: TObject);
begin
  inherited;
  ValidaDocumentoIdentificacion;
end;

procedure TOpeFMEmpleados.DBEPaisTerceroExit(Sender: TObject);
begin
  inherited;
  ValidaDocumentoIdentificacion;
end;

procedure TOpeFMEmpleados.DBETipoDocumentoExit(Sender: TObject);
begin
  inherited;
  ValidaDocumentoIdentificacion;
end;

procedure TOpeFMEmpleados.DBECifChange(Sender: TObject);
begin
  inherited;
  ValidaDocumentoIdentificacion;
end;

procedure TOpeFMEmpleados.DBEFEntidadChange(Sender: TObject);
begin
  inherited;
  EEntidad.Text := DameTituloEntidad(OpeDMEmpleados.QMEmpleadosPAIS_BANCO.AsString, DBEFEntidad.Text);
  CompruebaCuentaBancaria;
end;

procedure TOpeFMEmpleados.DBE_B_SucursalChange(Sender: TObject);
begin
  inherited;
  CompruebaCuentaBancaria;
end;

procedure TOpeFMEmpleados.DBE_B_DigContChange(Sender: TObject);
begin
  inherited;
  CompruebaCuentaBancaria;
end;

procedure TOpeFMEmpleados.DBE_B_CuentaChange(Sender: TObject);
begin
  inherited;
  CompruebaCuentaBancaria;
end;

procedure TOpeFMEmpleados.DBEIBANChange(Sender: TObject);
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

procedure TOpeFMEmpleados.DBEIBANEnter(Sender: TObject);
var
  Pais : string;
begin
  inherited;
  Pais := OpeDMEmpleados.QMEmpleadosPAIS_TERCERO.AsString;
  if (DBEIBAN.Text = '') and (Trim(DBE_B_Cuenta.Text) <> '') then
     DBEIBAN.Text := CalcularIBAN(DamePaisC2(Pais), Trim(DBEFEntidad.Text) + Trim(DBE_B_Sucursal.Text) + Trim(DBE_B_DigCont.Text) + Trim(DBE_B_Cuenta.Text));
end;

procedure TOpeFMEmpleados.DBEFCtaEmbargoChange(Sender: TObject);
begin
  inherited;
  ECtaEmbargo.Text := DameTituloCuenta(DBEFCtaEmbargo.Text);
end;

procedure TOpeFMEmpleados.AFiltroTodosExecute(Sender: TObject);
begin
  inherited;
  OpeDMEmpleados.FiltraEmpleadoActivo(0);
end;

procedure TOpeFMEmpleados.AFiltroInactivosExecute(Sender: TObject);
begin
  inherited;
  OpeDMEmpleados.FiltraEmpleadoActivo(1);
end;

procedure TOpeFMEmpleados.AFiltroActivosExecute(Sender: TObject);
begin
  inherited;
  OpeDMEmpleados.FiltraEmpleadoActivo(2);
end;

procedure TOpeFMEmpleados.WMDropFiles(var Msg: TWMDropFiles);
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

     if ConfirmaMensaje(_('¿Esta seguro de importar los archivos?' + #13#10 + Ficheros.Text)) then
     begin
        AbreData(TDMAdjunto, DMAdjunto);
        try
           for i := 0 to Ficheros.Count - 1 do
              DMAdjunto.CreaAdjunto('OPE', OpeDMEmpleados.QMEmpleadosID_EMPLEADO.AsInteger, Ficheros[i]);
        finally
           CierraData(DMAdjunto);
        end;

        AAdjuntosEmpleado.Execute;
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

procedure TOpeFMEmpleados.DBERegionChange(Sender: TObject);
begin
  inherited;
  if ((DBEPaisDireccion.Text > '') and (DBERegion.Text > '')) then
     ETituloRegion.Text := DameTituloRegion(DBEPaisDireccion.Text, DBERegion.Text)
  else
     ETituloRegion.Text := '';
end;

procedure TOpeFMEmpleados.DBEProvinciaDireccionChange(Sender: TObject);
begin
  inherited;
  if (OpeDMEmpleados.QMEmpleadosPAIS_DIRECCION.AsString > '') then
     ETituloProvinciaTercero.Text := DameTituloProvincia(OpeDMEmpleados.QMEmpleadosPAIS_DIRECCION.AsString, OpeDMEmpleados.QMEmpleadosPROVINCIA_DIRECCION.AsString)
  else
     ETituloProvinciaTercero.Text := '';
end;

procedure TOpeFMEmpleados.EFPoblacionChange(Sender: TObject);
var
  Region, Provincia : string;
begin
  inherited;
  if (DBEPaisDireccion.Text > '') then
  begin
     ETituloPoblacion.Text := DameTituloPoblacion(OpeDMEmpleados.QMEmpleadosPAIS_DIRECCION.AsString, OpeDMEmpleados.QMEmpleadosPOBLACION_DIRECCION.AsString);

     if ((DBERegion.Text = '') and (DBEProvinciaDireccion.Text = '') and (EFPoblacion.Text > '')) then
     begin
        DMTerceros.BuscaDatosDireccionPoblacion(OpeDMEmpleados.QMEmpleadosPAIS_DIRECCION.AsString, EFPoblacion.Text, Region, Provincia);
        if (Region > '') then
           OpeDMEmpleados.QMEmpleadosREGION_DIRECCION.AsString := Region;
        if (Provincia > '') then
           OpeDMEmpleados.QMEmpleadosPROVINCIA_DIRECCION.AsString := Provincia;
     end;
  end;
end;

procedure TOpeFMEmpleados.EFCodigoPostalChange(Sender: TObject);
var
  Region, Provincia, Poblacion : string;
begin
  inherited;
  if ((OpeDMEmpleados.QMEmpleadosPAIS_DIRECCION.AsString > '') and (EFCodigoPostal.Text > '')) then
  begin
     ETituloCodigoPostal.Text := DameTituloCodigoPostal(OpeDMEmpleados.QMEmpleadosPAIS_DIRECCION.AsString, EFCodigoPostal.Text);
     if ((DBERegion.Text = '') and (DBEProvinciaDireccion.Text = '') and (EFPoblacion.Text = '')) then
     begin
        DMTerceros.BuscaDatosDireccionCP(OpeDMEmpleados.QMEmpleadosPAIS_DIRECCION.AsString, EFCodigoPostal.Text, Region, Provincia, Poblacion);
        if (Region > '') then
           OpeDMEmpleados.QMEmpleadosREGION_DIRECCION.AsString := Region;
        if (Provincia > '') then
           OpeDMEmpleados.QMEmpleadosPROVINCIA_DIRECCION.AsString := Provincia;
        if (Poblacion > '') then
           OpeDMEmpleados.QMEmpleadosPOBLACION_DIRECCION.AsString := Poblacion;
     end;
  end
  else
     ETituloCodigoPostal.Text := '';
end;

procedure TOpeFMEmpleados.DBERegionBusqueda(Sender: TObject);
begin
  inherited;
  with DBERegion do
  begin
     CondicionBusqueda := 'PAIS = ''' + DBEPaisDireccion.Text + '''';
  end;
end;

procedure TOpeFMEmpleados.DBEProvinciaDireccionBusqueda(Sender: TObject);
begin
  inherited;
  with DBEProvinciaDireccion do
  begin
     CondicionBusqueda := 'PAIS = ''' + DBEPaisDireccion.Text + '''';
     if ((Trim(DBERegion.Text) > '') and (Trim(DBERegion.Text) <> 'ZZZ')) then
        CondicionBusqueda := CondicionBusqueda + ' AND REGION = ''' + DBERegion.Text + '''';
  end;
end;

procedure TOpeFMEmpleados.EFPoblacionBusqueda(Sender: TObject);
begin
  inherited;
  with EFPoblacion do
  begin
     CondicionBusqueda := 'PAIS = ''' + DBEPaisDireccion.Text + '''';
     if (Trim(DBEProvinciaDireccion.Text) > '') then
        CondicionBusqueda := CondicionBusqueda + ' AND PROVINCIA = ''' + DBEProvinciaDireccion.Text + '''';
  end;
end;

procedure TOpeFMEmpleados.EFCodigoPostalBusqueda(Sender: TObject);
begin
  inherited;
  with EFCodigoPostal do
  begin
     CondicionBusqueda := 'PAIS = ''' + DBEPaisDireccion.Text + '''';
     if ((Trim(EFPoblacion.Text) > '') and (Trim(EFPoblacion.Text) <> 'ZZZ')) then
        CondicionBusqueda := CondicionBusqueda + ' AND POBLACION = ''' + EFPoblacion.Text + '''';
  end;
end;

procedure TOpeFMEmpleados.DBEPaisDireccionChange(Sender: TObject);
var
  TituloRegion, TituloProvincia, TituloPoblacion : string;
begin
  inherited;
  if (DBEPaisDireccion.Text > '') then
  begin
     ETituloPaisDireccion.Text := DameTituloPais(DBEPaisDireccion.Text);

     DMMain.DameDatosPais(DBEPaisDireccion.Text, TituloRegion, TituloProvincia, TituloPoblacion);
     LRegion.Caption := TituloRegion;
     LProvinciaDireccion.Caption := TituloProvincia;
     LPoblacion.Caption := TituloPoblacion;
  end;
end;

procedure TOpeFMEmpleados.DBEAFPChange(Sender: TObject);
begin
  inherited;
  ETituloAFP.Text := DameTituloEquivalenciaPrevired(10, DBEAFP.Text);
end;

procedure TOpeFMEmpleados.DBEIsapreChange(Sender: TObject);
begin
  inherited;
  ETituloIsapre.Text := DameTituloEquivalenciaPrevired(16, DBEIsapre.Text);
end;

procedure TOpeFMEmpleados.PNLConceptosNominaResize(Sender: TObject);
begin
  inherited;
  if (FactoEscalaPNLDescuentos = 0) then
     FactoEscalaPNLDescuentos := 3;
  if (FactorEscalaPNLParametros = 0) then
     FactorEscalaPNLParametros := 3;
end;

procedure TOpeFMEmpleados.DBGNominasParametrosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'IMPORTE') then
        begin
           if (Trim(DataSource.DataSet.FieldByName('TIPO_DATO').AsString) <> 'N') then
              ColorInactivo(Canvas)
           else
              ColorEdicion(Canvas);
        end;
        if (UpperCase(Column.FieldName) = 'DATO_TEXTO') then
        begin
           if (Trim(DataSource.DataSet.FieldByName('TIPO_DATO').AsString) <> 'T') then
              ColorInactivo(Canvas)
           else
              ColorEdicion(Canvas);
        end;
        if (UpperCase(Column.FieldName) = 'DATO_FECHA') then
        begin
           if (Trim(DataSource.DataSet.FieldByName('TIPO_DATO').AsString) <> 'F') then
              ColorInactivo(Canvas)
           else
              ColorEdicion(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TOpeFMEmpleados.DBGNominasHaberesBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'CON_CUENTAS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND PGC=' + IntToStr(REntorno.Pgc) + ' AND NIVEL = ' + IntToStr(REntorno.NivelesCont);
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CUENTA';
     end;
  end;
end;

procedure TOpeFMEmpleados.DBGNominasDescuentosBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (Trim(TablaABuscar) = 'CON_CUENTAS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND PGC=' + IntToStr(REntorno.Pgc) + ' AND NIVEL = ' + IntToStr(REntorno.NivelesCont);
        PlanBusquedaNum := '';
        PlanBusquedaStr := '';
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'CUENTA';
     end;
  end;
end;

procedure TOpeFMEmpleados.DBETipoContratoChange(Sender: TObject);
begin
  inherited;
  ETipoContrato.Text := OpeDMEmpleados.DameTituloTipoContrato(DBETipoContrato.Text);
end;

procedure TOpeFMEmpleados.DBEJornadaChange(Sender: TObject);
begin
  inherited;
  if (DBEJornada.Text > '') then
     EDescripcionJornada.Text := OpeDMEmpleados.DameDescripcionJornada(StrToInt(DBEJornada.Text))
  else
     DBEJornada.Text := '';
end;

procedure TOpeFMEmpleados.DBETipoJornadaChange(Sender: TObject);
begin
  inherited;
  if (DBETipoJornada.Text > '') then
     EDescripcionTipoJornada.Text := OpeDMEmpleados.DameDescripcionTipoJornada(StrToInt(DBETipoJornada.Text))
  else
     DBETipoJornada.Text := '';
end;

procedure TOpeFMEmpleados.DBEAreaChange(Sender: TObject);
begin
  inherited;
  if (DBEArea.Text > '') then
     EDescripcionArea.Text := OpeDMEmpleados.DameDescripcionArea(StrToInt(DBEArea.Text))
  else
     DBEArea.Text := '';
end;

procedure TOpeFMEmpleados.DBECentroCostoChange(Sender: TObject);
begin
  inherited;
  if (DBECentroCosto.Text > '') then
     EDescripcionCentroCosto.Text := OpeDMEmpleados.DameDescripcionCentroCosto(StrToInt(DBECentroCosto.Text))
  else
     DBECentroCosto.Text := '';
end;

procedure TOpeFMEmpleados.DBEMedioPagoChange(Sender: TObject);
begin
  inherited;
  EDescripcionMedioPago.Text := DameTituloEfecto(DBEMedioPago.Text);
end;

procedure TOpeFMEmpleados.DBEFTipoCuentaChange(Sender: TObject);
begin
  inherited;
  EDescripcionTipoCuenta.Text := DameTituloTipoCuenta(StrToIntDef(DBEFTipoCuenta.Text, 0));
end;

procedure TOpeFMEmpleados.SBAJornadaDblClick(Sender: TObject);
begin
  inherited;
  FMain.AJornadaExecute(Self);
end;

procedure TOpeFMEmpleados.MuestraTabla;
begin
  PCMain.ActivePage := TSTabla;
end;

procedure TOpeFMEmpleados.BRellenacuentasDefectoClick(Sender: TObject);
begin
  inherited;
  OpeDMEmpleados.RellenacuentasDefecto;
end;

procedure TOpeFMEmpleados.NavNominasClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BRellenacuentasDefecto.Visible := ((Button = nbEdit) and (REntorno.Pais = 'ESP'));
end;

procedure TOpeFMEmpleados.HYTDBGrid1DblClick(Sender: TObject);
var
  Filtro : string;
begin
  inherited;
  //Abrimos la nomina del empleado
  Filtro := 'EMPLEADO = ' + OpeDMEmpleados.QMNomCabEMPLEADO.AsString + ' AND PERIODO = ''' + OpeDMEmpleados.QMNomCabPERIODO.AsString + '''';
  FMain.EjecutaAccion(FMain.ANominas, Filtro);
end;

procedure TOpeFMEmpleados.DBEEntidadEmpleadoChange(Sender: TObject);
begin
  inherited;
  DBEEntidadEmpleadoTitulo.Text := DameTituloEntidad(OpeDMEmpleados.QMEmpleadosPAIS_BANCO.AsString, DBEEntidadEmpleado.Text);
end;

procedure TOpeFMEmpleados.DEFechaIniChange(Sender: TObject);
begin
  inherited;
  if DBGIncapacidadTransitoria.DataSource.State in [dsEdit, dsInsert] then
     OpeDMEmpleados.xIncapacidadTransitoriaFECHA_INICIO.Value := DEFechaIni.Date;
end;

procedure TOpeFMEmpleados.DEFechaFinChange(Sender: TObject);
begin
  if DBGIncapacidadTransitoria.DataSource.State in [dsEdit, dsInsert] then
     OpeDMEmpleados.xIncapacidadTransitoriaFECHA_FIN.Value := DEFechaFin.Date;
end;

procedure TOpeFMEmpleados.NavIncapacidadTransitoriaClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button in [nbCancel, nbPost, nbRefresh]) then
  begin
     DEFechaIni.Visible := False;
     DEFechaFin.Visible := False;
  end;
end;

procedure TOpeFMEmpleados.DBECuentaChlDblClick(Sender: TObject);
begin
  inherited;
  if (Sender as TLFDBEditFind2000).Text <> '' then
     EjecutaContaExtracto((Sender as TLFDBEditFind2000).Text);
end;

procedure TOpeFMEmpleados.EjecutaContaExtracto(Cuenta: string);
begin
  FMain.EjecutaAccion(FMain.AContaExtracto, Cuenta);
end;

procedure TOpeFMEmpleados.DBEFPaisBancoChange(Sender: TObject);
begin
  inherited;
  EPaisBanco.Text := DameTituloPais(DBEFPaisBanco.Text);
end;

procedure TOpeFMEmpleados.DBEFEntidadBusqueda(Sender: TObject);
begin
  inherited;
  DBEFEntidad.CondicionBusqueda := 'PAIS = ''' + DBEFPaisBanco.Text + '''';
end;

procedure TOpeFMEmpleados.DBEFProyectoChange(Sender: TObject);
begin
  inherited;
  EProyecto.Text := DameTituloProyecto(StrToIntDef(DBEFProyecto.Text, 0));
end;

procedure TOpeFMEmpleados.DBELREChange(Sender: TObject);
begin
  inherited;
  ELRETitulo.Text := DMMain.DameLREComuna(DBELRE.Text);
end;

procedure TOpeFMEmpleados.DBEFSerieDstReparacionBusqueda(Sender: TObject);
begin
  inherited;
  DBEFSerieDstReparacion.CondicionBusqueda := 'EMPRESA = ' + IntToStr(StrToIntDef(DBEFEmpresaDstReparacion.Text, 0)) + 'AND EJERCICIO = ' + REntorno.EjercicioStr + ' AND CANAL = ' + REntorno.CanalStr;
end;

procedure TOpeFMEmpleados.DBEFEmpresaDstReparacionChange(Sender: TObject);
begin
  inherited;
  EEmpresaDstReparacion.Text := DameTituloEmpresa(StrToIntDef(DBEFEmpresaDstReparacion.Text, 0));
end;

procedure TOpeFMEmpleados.DBEFSerieDstReparacionChange(Sender: TObject);
begin
  inherited;
  ESerieDstReparacion.Text := DameTituloSerie(DBEFSerieDstReparacion.Text);
end;

procedure TOpeFMEmpleados.AImportaAusenciasFIEExecute(Sender: TObject);
begin
  inherited;
  OpeDMEmpleados.ImportaAusenciasFIE;
end;

end.
