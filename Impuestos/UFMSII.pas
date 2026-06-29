unit UFMSII;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, rxToolEdit, RXDBCtrl, ULFDBDateEdit,
  StdCtrls, DBCtrls, Mask, ULFDBEdit, ULFLabel, dbcgrids, ULFDBCtrlGrid,
  ULFDateEdit, URecursos, RxDBComb;

type
  TFMSII = class(TFPEdit)
     PNLPresentacion: TLFPanel;
     LIdPresentacion: TLFLabel;
     DBEIdPresentacion: TLFDbedit;
     DBRGTipoPresentacion: TDBRadioGroup;
     PCTipoPresentacion: TLFPageControl;
     TSEmitidas: TTabSheet;
     TSRecibidas: TTabSheet;
     LIdSuministroFacturasEmitidas: TLFLabel;
     DBEIdSuministroFacturasEmitidas: TLFDbedit;
     LTipoComunicacionSuministroFacturasEmitidas: TLFLabel;
     LNIFSuministroFacturasEmitidas: TLFLabel;
     DBENIFSuministroFacturasEmitidas: TLFDbedit;
     LNIFRepresentanteSuministroFacturasEmitidas: TLFLabel;
     DBENIFRepresentanteSuministroFacturasEmitidas: TLFDbedit;
     DBDEFechaCreacionSuministroFacturasEmitidas: TLFDBDateEdit;
     LFechaCreacionSuministroFacturasEmitidas: TLFLabel;
     DBDEFechaPresentacionSuministroFacturasEmitidas: TLFDBDateEdit;
     LFechaPresentacionSuministroFacturasEmitidas: TLFLabel;
     LTitularSuministroFacturasEmitidas: TLFLabel;
     DBETitularSuministroFacturasEmitidas: TLFDbedit;
     PNLSuministroFacturasEmitidas: TLFPanel;
     PNLRegistroFacturasEmitidas: TLFPanel;
     PNLDesgloseFacturasEmitidas: TLFPanel;
     TBRegistroFacturasEmitidas: TLFToolBar;
     NavRegistroFacturasEmitidas: THYMNavigator;
     TBSuministroFacturasEmitidas: TLFToolBar;
     NavSuministroFacturasEmitidas: THYMNavigator;
     LFCategoryAction1: TLFCategoryAction;
     AGenerarPresentacion: TAction;
     PNLSuministroFacturasRecibidas: TLFPanel;
     LTitularSuministroFacturasRecibidas: TLFLabel;
     LFechaCreacionSuministroFacturasRecibidas: TLFLabel;
     LFechaPresentacionSuministroFacturasRecibidas: TLFLabel;
     LIdSuministroFacturasRecibidas: TLFLabel;
     LNISuministroFacturasRecibidas: TLFLabel;
     LNIFRepresentanteSuministroFacturasRecibidas: TLFLabel;
     LTipoComunicacionSuministroFacturasRecibidas: TLFLabel;
     DBEFechaCreacionSuministroFacturasRecibidas: TLFDBDateEdit;
     DBEFechaPresentacionSuministroFacturasRecibidas: TLFDBDateEdit;
     DBEIdSuministroFacturasRecibidas: TLFDbedit;
     DBENIFSuministroFacturasRecibidas: TLFDbedit;
     DBENIFRepresentanteSuministroFacturasRecibidas: TLFDbedit;
     DBETitularSuministroFacturasRecibidas: TLFDbedit;
     TBSuministroFacturasRecibidas: TLFToolBar;
     NavSuministroFacturasRecibidas: THYMNavigator;
     PNLRegistroFacturasRecibidas: TLFPanel;
     PNLDesgloseRegistroFacturasRecibidas: TLFPanel;
     TBRegistroFacturasRecibidas: TLFToolBar;
     NavRegistroFacturasRecibidas: THYMNavigator;
     AEnviarPresentacion: TAction;
     AGuardarFicheroPresentacion: TAction;
     AGuardarFicheroRespuesta: TAction;
     LFLabel1: TLFLabel;
     DBEID_SII_REGLRFACTURASEMITIDAS: TLFDbedit;
     DBEPERIODOIMPOSITIVO_EJERCICIO: TLFDbedit;
     LFLabel4: TLFLabel;
     LFLabel5: TLFLabel;
     DBEPERIODOIMPOSITIVO_PERIODO: TLFDbedit;
     DBEIDFAC_EMISOR_NIF: TLFDbedit;
     LFLabel6: TLFLabel;
     LFLabel7: TLFLabel;
     DBEIDFAC_EMISOR_NUMSERIEFAC: TLFDbedit;
     DBEIDFAC_EMISOR_NUMSERIEFACFIN: TLFDbedit;
     LFLabel8: TLFLabel;
     LFLabel9: TLFLabel;
     DBEFACEXP_TIPOFACTURA: TLFDbedit;
     DBEFACEXP_FAGR_NUMSERIEFACEMISOR: TLFDbedit;
     LFLabel10: TLFLabel;
     LFLabel11: TLFLabel;
     DBEFACEXP_FAGR_FECHAEXPEDICION: TLFDbedit;
     DBEFACEXP_FRECT_NUMSERIEFACEMISOR: TLFDbedit;
     LFLabel12: TLFLabel;
     LFLabel13: TLFLabel;
     DBEFACEXP_FRECT_FECHAEXPEDICION: TLFDbedit;
     DBEFACEXP_IMPRECT_BASERECT: TLFDbedit;
     LFLabel15: TLFLabel;
     DBEFACEXP_IMPRECT_CUOTARECRECT: TLFDbedit;
     DBEFACEXP_IMPRECT_CUOTARECT: TLFDbedit;
     LFLabel16: TLFLabel;
     LFLabel17: TLFLabel;
     DBEFACEXP_FECHAOPERACION: TLFDbedit;
     DBEFACEXP_CLAVE_REG_ESP: TLFDbedit;
     LFLabel18: TLFLabel;
     LFLabel19: TLFLabel;
     DBEFACEXP_CLAVE_REG_ESP1: TLFDbedit;
     DBEFACEXP_CLAVE_REG_ESP2: TLFDbedit;
     LFLabel20: TLFLabel;
     LFLabel21: TLFLabel;
     DBEFACEXP_NUMREGACUERDOFAC: TLFDbedit;
     DBEFACEXP_IMPORTE_TOTAL: TLFDbedit;
     LFLabel22: TLFLabel;
     LFLabel23: TLFLabel;
     DBEFACEXP_BASEIMPONIBLEACOSTE: TLFDbedit;
     DBEFACEXP_DESCRIPCION: TLFDbedit;
     LFLabel24: TLFLabel;
     LFLabel25: TLFLabel;
     DBEFACEXP_INMUEBLE_SITUACIONINM: TLFDbedit;
     DBEFACEXP_INMUEBLE_REFCATASTRAL: TLFDbedit;
     LFLabel26: TLFLabel;
     LFLabel27: TLFLabel;
     DBEFACEXP_IMPORTETRANSMSUJETAIVA: TLFDbedit;
     DBEFACEXP_EMITIDA_POR_TERCEROS: TLFDbedit;
     LFLabel28: TLFLabel;
     LFLabel29: TLFLabel;
     DBEFACEXP_VARIOSDESTINATARIOS: TLFDbedit;
     DBEFACEXP_CUPON: TLFDbedit;
     LFLabel30: TLFLabel;
     LFLabel31: TLFLabel;
     DBEFACEXP_CONTRAP_NOMBRE_RAZON: TLFDbedit;
     DBEFACEXP_CONTRAP_NIF: TLFDbedit;
     LFLabel32: TLFLabel;
     LFLabel33: TLFLabel;
     DBEFACEXP_CONTRAP_NIF_REPRES: TLFDbedit;
     DBEFACEXP_CONTRAPARTE_CODPAIS: TLFDbedit;
     LFLabel34: TLFLabel;
     LFLabel35: TLFLabel;
     DBEFACEXP_CONTRAPARTE_IDTYPE: TLFDbedit;
     DBEFACEXP_CONTRAPARTE_ID: TLFDbedit;
     LFLabel36: TLFLabel;
     LFLabel37: TLFLabel;
     DBETIPO_DESGLOSE: TLFDbedit;
     DBETIPO_DESGLOSE_OPERACION: TLFDbedit;
     LFLabel38: TLFLabel;
     LFLabel2: TLFLabel;
     DBEFACEXP_TIPORECTIFICATIVA: TLFDbedit;
     LFLabel3: TLFLabel;
     LFLabel14: TLFLabel;
     DBEID_SII_REGLRFACTURASRECIBIDAS: TLFDbedit;
     DBEPERIODOIMPOSITIVO_EJERCICIO1: TLFDbedit;
     LFLabel39: TLFLabel;
     LFLabel40: TLFLabel;
     DBEPERIODOIMPOSITIVO_PERIODO1: TLFDbedit;
     DBEIDFAC_EMISOR_NIF1: TLFDbedit;
     LFLabel41: TLFLabel;
     LFLabel42: TLFLabel;
     DBEIDFAC_EMISOR_OTRO_CODPAIS: TLFDbedit;
     DBEIDFAC_EMISOR_OTRO_IDTYPE: TLFDbedit;
     LFLabel43: TLFLabel;
     LFLabel44: TLFLabel;
     DBEIDFAC_EMISOR_OTRO_ID: TLFDbedit;
     DBEIDFAC_EMISOR_NUMSERIEFACFIN1: TLFDbedit;
     LFLabel45: TLFLabel;
     LFLabel46: TLFLabel;
     DBEIDFAC_EMISOR_FECHA_EXPEDICION: TLFDbedit;
     DBEFACREC_TIPOFACTURA: TLFDbedit;
     LFLabel47: TLFLabel;
     LFLabel48: TLFLabel;
     DBEFACREC_TIPORECTIFICATIVA: TLFDbedit;
     DBEFACREC_FAGR_NUMSERIEFACEMISOR: TLFDbedit;
     LFLabel49: TLFLabel;
     DBEFACREC_FAGR_FECHAEXPEDICION: TLFDbedit;
     DBEFACREC_FRECT_NUMSERIEFACEMISOR: TLFDbedit;
     LFLabel50: TLFLabel;
     LFLabel51: TLFLabel;
     DBEFACREC_FRECT_FECHAEXPEDICION: TLFDbedit;
     DBEFACREC_IMPRECT_BASERECT: TLFDbedit;
     LFLabel52: TLFLabel;
     LFLabel53: TLFLabel;
     DBEFACREC_IMPRECT_CUOTARECT: TLFDbedit;
     DBEFACREC_IMPRECT_CUOTARECRECT: TLFDbedit;
     LFLabel54: TLFLabel;
     LFLabel55: TLFLabel;
     DBEFACREC_FECHAOPERACION: TLFDbedit;
     DBEFACREC_CLAVE_REG_ESP: TLFDbedit;
     LFLabel56: TLFLabel;
     LFLabel57: TLFLabel;
     DBEFACREC_CLAVE_REG_ESP1: TLFDbedit;
     DBEFACREC_CLAVE_REG_ESP2: TLFDbedit;
     LFLabel58: TLFLabel;
     LFLabel59: TLFLabel;
     DBEFACREC_CONTRAP_NOMBRE_RAZON: TLFDbedit;
     DBEFACREC_CONTRAP_NIF: TLFDbedit;
     LFLabel60: TLFLabel;
     LFLabel61: TLFLabel;
     DBEFACREC_CONTRAP_NIF_REPRES: TLFDbedit;
     DBEFACREC_CONTRAPARTE_CODPAIS: TLFDbedit;
     LFLabel62: TLFLabel;
     LFLabel63: TLFLabel;
     DBEFACREC_CONTRAPARTE_IDTYPE: TLFDbedit;
     DBEFACREC_CONTRAPARTE_ID: TLFDbedit;
     LFLabel64: TLFLabel;
     LFLabel65: TLFLabel;
     DBEFACREC_NUMREGACUERDOFAC: TLFDbedit;
     DBEFACREC_IMPORTE_TOTAL: TLFDbedit;
     LFLabel66: TLFLabel;
     LFLabel67: TLFLabel;
     DBEFACREC_BASEIMPONIBLEACOSTE: TLFDbedit;
     DBEFACREC_DESCRIPCION: TLFDbedit;
     LFLabel68: TLFLabel;
     LFLabel69: TLFLabel;
     DBEFACREC_ADUANAS_NUMERODUA: TLFDbedit;
     DBEFACREC_ADUANAS_FECHAREGCONTDUA: TLFDbedit;
     LFLabel70: TLFLabel;
     LFLabel71: TLFLabel;
     DBEFACREC_FECHAREGCONTABLE: TLFDbedit;
     DBEFACREC_CUOTA_DEDUCIBLE: TLFDbedit;
     LFLabel72: TLFLabel;
     LFLabel73: TLFLabel;
     DBEIDFAC_EMISOR_NUMSERIEFAC1: TLFDbedit;
     LFLabel74: TLFLabel;
     DBCGDesgloseFacEmi: TLFDBCtrlGrid;
     LFLabel75: TLFLabel;
     LFLabel76: TLFLabel;
     LFLabel77: TLFLabel;
     LFLabel78: TLFLabel;
     LFLabel79: TLFLabel;
     LFLabel80: TLFLabel;
     LFLabel81: TLFLabel;
     LFLabel82: TLFLabel;
     LFLabel83: TLFLabel;
     LFLabel84: TLFLabel;
     DBEID_SII_DESGLOSEFACTURA_EMI: TLFDbedit;
     DBESUJETA_EXENTA_CAUSA: TLFDbedit;
     DBESUJETA_EXENTA_BASEIMPONIBLE: TLFDbedit;
     DBESUJETA_NO_EXENTA_TIPO: TLFDbedit;
     DBESUJETA_NO_EXENTA_TIPOIMP: TLFDbedit;
     DBESUJETA_NO_EXENTA_BASEIMP: TLFDbedit;
     DBESUJETA_NO_EXENTA_CUOTAREP: TLFDbedit;
     DBESUJETA_NO_EXENTA_TIPOREC: TLFDbedit;
     DBESUJETA_NO_EXENTA_CUOTAREC: TLFDbedit;
     DBENO_SUJETA_IMPORTE_ART_7_14: TLFDbedit;
     DBENO_SUJETA_IMPORTE_TAI: TLFDbedit;
     LFLabel85: TLFLabel;
     TBDesgloseFacturasEmitidas: TLFToolBar;
     NavDesgloseFacturasEmitidas: THYMNavigator;
     PNLRegistroFacturasEmitidasDatos: TLFPanel;
     PNLRegistroFacturasRecibidasDatos: TLFPanel;
     TBDesgloseRegistroFacturasRecibidas: TLFToolBar;
     NavDesgloseRegistroFacturasRecibidas: THYMNavigator;
     DBCGDesgloseFacRec: TLFDBCtrlGrid;
     LFLabel86: TLFLabel;
     LFLabel87: TLFLabel;
     LFLabel88: TLFLabel;
     LFLabel89: TLFLabel;
     LFLabel90: TLFLabel;
     LFLabel91: TLFLabel;
     LFLabel92: TLFLabel;
     LFLabel93: TLFLabel;
     LFLabel94: TLFLabel;
     LFLabel95: TLFLabel;
     DBEID_SII_DESGLOSEFACTURA_REC: TLFDbedit;
     DBEISP_TIPOIMPOSITIVO: TLFDbedit;
     DBEISP_BASEIMPONIBLE: TLFDbedit;
     DBEISP_CUOTASOPORTADA: TLFDbedit;
     DBEISP_TIPORECARGOEQUIVALENCIA: TLFDbedit;
     DBEISP_CUOTARECARGOEQUIVALENCIA: TLFDbedit;
     DBEDI_TIPOIMPOSITIVO: TLFDbedit;
     DBEDI_BASEIMPONIBLE: TLFDbedit;
     DBEDI_CUOTASOPORTADA: TLFDbedit;
     DBEDI_TIPORECARGOEQUIVALENCIA: TLFDbedit;
     DBEDI_CUOTARECARGOEQUIVALENCIA: TLFDbedit;
     LFLabel96: TLFLabel;
     LFLabel97: TLFLabel;
     DBEDI_PORCENTCOMPSENSACIONREAGYP: TLFDbedit;
     DBEDI_IMPORTECOMPSENSACIONREAGYP: TLFDbedit;
     LFLabel98: TLFLabel;
     LEstadoRegistro: TLFLabel;
     DBEESTADO_REGISTRO: TLFDbedit;
     DBEDESCRIPCION_ERROR: TLFDbedit;
     LCSV: TLFLabel;
     DBECSV: TLFDbedit;
     DBEESTADO_ENVIO: TLFDbedit;
     LEstadoEnvio: TLFLabel;
     lcsveMI: TLFLabel;
     DBECSV1: TLFDbedit;
     DBEESTADO_ENVIO1: TLFDbedit;
     LEstadoEnvioEmi: TLFLabel;
     DBECODIGO_ERROR: TLFDbedit;
     LEstadoRegistroEmi: TLFLabel;
     DBEESTADO_REGISTRO1: TLFDbedit;
     DBECODIGO_ERROR1: TLFDbedit;
     DBEDESCRIPCION_ERROR1: TLFDbedit;
     PCRegistroFacturasRecibidas: TLFPageControl;
     TSFichaRegistroFacturasRecibidas: TTabSheet;
     TSTablaRegistroFacturasRecibidas: TTabSheet;
     DBGRegistroFacturasRecibidas: THYTDBGrid;
     PCRegistroFacturasEmitidas: TLFPageControl;
     TSFichaRegistroFacturasEmitidas: TTabSheet;
     TSTablaRegistroFacturasEmitidas: TTabSheet;
     DBGRegistroFacturasEmitidas: THYTDBGrid;
     TSDisponiblesRegistroFacturasEmitidas: TTabSheet;
     TSDisponiblesTSRegistroFacturasRecibidas: TTabSheet;
     DBGRegistroFacturasEmitidasDisponibles: THYTDBGrid;
     DBGRegistroFacturasRecibidasDisponibles: THYTDBGrid;
     LFLabel99: TLFLabel;
     DBEIDFAC_EMISOR_FECHA_EXPEDICION1: TLFDbedit;
     PNLSeleccionDisponiblesEmitidas: TLFPanel;
     LSeleccionDisponiblesEmitidas: TLFLabel;
     DEDesdeDisponiblesEmitidas: TLFDateEdit;
     DEHastaDisponiblesEmitidas: TLFDateEdit;
     BSeleccionarDisponiblesEmitidas: TButton;
     PNLSeleccionDisponiblesRecibidas: TLFPanel;
     LSeleccionDisponiblesRecibidas: TLFLabel;
     DEDesdeDisponiblesRecibidas: TLFDateEdit;
     DEHastaDisponiblesRecibidas: TLFDateEdit;
     BSeleccionarDisponiblesRecibidas: TButton;
     ButtSep1: TToolButton;
     TButtIrADocumentoEmitidas: TToolButton;
     TButtIrARegistroIVAEmitidas: TToolButton;
     ButtSep2: TToolButton;
     TButtIrADocumentoRecibidas: TToolButton;
     TButtIrARegistroIVARecibidas: TToolButton;
     LFCategoryAction2: TLFCategoryAction;
     AIrADocumentoEmitidas: TAction;
     AIrADocumentoRecibidas: TAction;
     AIrARegistroIVAEmitidas: TAction;
     AIrARegistroIVARecibidas: TAction;
     AVerificarPresentacion: TAction;
     DBCBTipoComunicacionFacturasEmitidas: TRxDBComboBox;
     RBCBTipoComunicacionSuministroFacturasRecibidas: TRxDBComboBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBRGTipoPresentacionChange(Sender: TObject);
     procedure AGenerarPresentacionExecute(Sender: TObject);
     procedure AEnviarPresentacionExecute(Sender: TObject);
     procedure AGuardarFicheroPresentacionExecute(Sender: TObject);
     procedure AGuardarFicheroRespuestaExecute(Sender: TObject);
     procedure FormResize(Sender: TObject);
     procedure TSEmitidasShow(Sender: TObject);
     procedure TSRecibidasShow(Sender: TObject);
     procedure DBEESTADO_REGISTROChange(Sender: TObject);
     procedure DBGRegistroFacturasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGRegistroFacturasRecibidasDblClick(Sender: TObject);
     procedure DBGRegistroFacturasEmitidasDblClick(Sender: TObject);
     procedure DBGRegistroFacturasEmitidasDisponiblesDblClick(Sender: TObject);
     procedure DBGRegistroFacturasRecibidasDisponiblesDblClick(Sender: TObject);
     procedure DBGRegistroFacturasDisponiblesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBEIdPresentacionChange(Sender: TObject);
     procedure BSeleccionarDisponiblesEmitidasClick(Sender: TObject);
     procedure BSeleccionarDisponiblesRecibidasClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure AIrADocumentoEmitidasExecute(Sender: TObject);
     procedure AIrADocumentoRecibidasExecute(Sender: TObject);
     procedure AIrARegistroIVAEmitidasExecute(Sender: TObject);
     procedure AIrARegistroIVARecibidasExecute(Sender: TObject);
     procedure PCRegistroFacturasEmitidasChange(Sender: TObject);
     procedure PCRegistroFacturasRecibidasChange(Sender: TObject);
     procedure AVerificarPresentacionExecute(Sender: TObject);
     procedure DBEIdSuministroFacturasEmitidasChange(Sender: TObject);
     procedure DBEIdSuministroFacturasRecibidasChange(Sender: TObject);
     procedure DBECSV1Change(Sender: TObject);
     procedure DBECSVChange(Sender: TObject);
     procedure NavSuministroFacturasRecibidasClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
     ColorFondo1, ColorTexto1: TColor;
     ColorFondo2, ColorTexto2: TColor;
     ColorFondo3, ColorTexto3: TColor;
     ColorFondo4, ColorTexto4: TColor;
     ModificandoPageControRegistroFacturas: boolean;
     procedure RestringirDisponibles;
  public
     { Public declarations }
  end;

var
  FMSII : TFMSII;

implementation

uses
  UDMMain, UDMSII, UFormGest, UEntorno, UUtiles, DateUtils, UFMain, HYFIBQuery;

{$R *.dfm}

var
  InicioPrimerSemestre2017 : TDateTime;

procedure TFMSII.FormCreate(Sender: TObject);
begin
  inherited;

  DMMain.Log('FormCreate');
  InicioPrimerSemestre2017 := EncodeDate(2017, 07, 01);

  ColorFondo1 := Brighten(clGreen, 10);
  ColorTexto1 := clWindowText;
  ColorFondo2 := Brighten(clGreen, 30);
  ColorTexto2 := clWindowText;
  ColorFondo3 := Brighten(clGreen, 50);
  ColorTexto3 := clWindowText;
  ColorFondo4 := Brighten(clGreen, 70);
  ColorTexto4 := clWindowText;

  AbreData(TDMSII, DMSII);
  NavMain.DataSource := DMSII.DSPresentacion;
  DBGMain.DataSource := DMSII.DSPresentacion;
  G2kTableLoc.DataSource := DMSII.DSPresentacion;

  NavSuministroFacturasEmitidas.DataSource := DMSII.DSSLRFacEmi;
  NavSuministroFacturasRecibidas.DataSource := DMSII.DSSLRFacRec;

  NavRegistroFacturasRecibidas.DataSource := DMSII.DSRLRFacRec;
  DBGRegistroFacturasRecibidas.DataSource := DMSII.DSRLRFacRec;
  DBGRegistroFacturasRecibidasDisponibles.DataSource := DMSII.DSRLRFacRecDisponibles;

  NavRegistroFacturasEmitidas.DataSource := DMSII.DSRLRFacEmi;
  DBGRegistroFacturasEmitidas.DataSource := DMSII.DSRLRFacEmi;
  DBGRegistroFacturasEmitidasDisponibles.DataSource := DMSII.DSRLRFacEmiDisponibles;

  DMMain.Log('xPresentacion.Last');
  // Me posiciono en la mas reciente
  DMSII.xPresentacion.Last;

  DEDesdeDisponiblesEmitidas.Date := Today - 8;
  DEHastaDisponiblesEmitidas.Date := Today - 1;

  DEDesdeDisponiblesRecibidas.Date := Today - 8;
  DEHastaDisponiblesRecibidas.Date := Today - 1;
end;

procedure TFMSII.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMMain.Log('FormClose');
  CierraData(DMSII);
end;

procedure TFMSII.FormShow(Sender: TObject);
begin
  inherited;
  DMMain.Log('FormShow');
  DBRGTipoPresentacionChange(Sender);
  // RestringirDisponibles;
  // Establece la cantidad de lineas de detalle segun el alto del formulario
  FormResize(Sender);
end;

procedure TFMSII.DBRGTipoPresentacionChange(Sender: TObject);
begin
  inherited;
  DMMain.Log('DBRGTipoPresentacionChange');
  try
     if DMSII.xPresentacion.Active then
     begin
        TSRecibidas.TabVisible := (DBRGTipoPresentacion.ItemIndex = 0);
        TSEmitidas.TabVisible := (DBRGTipoPresentacion.ItemIndex = 1);
     end;
  except
     on e: Exception do
     begin
        DMMain.Log('DBRGTipoPresentacionChange' + #13#10 + E.Message);
     end;
  end;
end;

procedure TFMSII.AGenerarPresentacionExecute(Sender: TObject);
begin
  inherited;
  DMMain.Log('AGenerarPresentacionExecute');

  if (DMSII.xPresentacionID_SII_PRESENTACION.AsInteger = 0) then
     raise Exception.Create(_('No se ha creado presentacion'));

  if (DMSII.xPresentacionTIPO_PRESENTACION.AsString = 'EMI') then
  begin
     if (DMSII.xSLRFacEmiID_SII_SUMLRFACTURASEMITIDAS.AsInteger = 0) then
        raise Exception.Create(_('No se ha creado registro de comunicacion'));

     DMSII.SII_LibroFacturasEmitidas(REntorno.Entrada);
  end;

  if (DMSII.xPresentacionTIPO_PRESENTACION.AsString = 'REC') then
  begin
     if (DMSII.xSLRFacRecID_SII_SUMLRFACTURASRECIBIDAS.AsInteger = 0) then
        raise Exception.Create(_('No se ha creado registro de comunicacion'));

     DMSII.SII_LibroFacturasRecibidas(REntorno.Entrada);
  end;
end;

procedure TFMSII.AEnviarPresentacionExecute(Sender: TObject);
var
  Enviar : boolean;
  CSV : string;
begin
  inherited;
  if (DMSII.xPresentacionID_SII_PRESENTACION.AsInteger = 0) then
     raise Exception.Create(_('No se ha creado presentacion'));

  // Para evitar enviar una presentación dos veces por error.
  Enviar := True;
  CSV := '';
  if (DMSII.xPresentacionTIPO_PRESENTACION.AsString = 'EMI') then
     CSV := Trim(DMSII.xSLRFacEmiCSV.AsString);
  if (DMSII.xPresentacionTIPO_PRESENTACION.AsString = 'REC') then
     CSV := Trim(DMSII.xSLRFacRecCSV.AsString);

  if (CSV > '') then
     Enviar := ConfirmaMensaje(_('Este registo ya ha sido presentado. Desea presentarlo nuevamente?'));

  if Enviar then
  begin
     if (DMSII.xPresentacionTIPO_PRESENTACION.AsString = 'EMI') then
        if (DMSII.xSLRFacEmiID_SII_SUMLRFACTURASEMITIDAS.AsInteger = 0) then
           raise Exception.Create(_('No se ha creado registro de comunicacion'));

     if (DMSII.xPresentacionTIPO_PRESENTACION.AsString = 'REC') then
        if (DMSII.xSLRFacRecID_SII_SUMLRFACTURASRECIBIDAS.AsInteger = 0) then
           raise Exception.Create(_('No se ha creado registro de comunicacion'));

     DMSII.EnviarPresentacion(REntorno.Entrada);
  end;
end;

procedure TFMSII.AGuardarFicheroPresentacionExecute(Sender: TObject);
begin
  inherited;
  DMSII.GuardarFicheroPresentacion;
end;

procedure TFMSII.AGuardarFicheroRespuestaExecute(Sender: TObject);
begin
  inherited;
  DMSII.GuardarFicheroRespuesta;
end;

procedure TFMSII.FormResize(Sender: TObject);
begin
  inherited;
  DMMain.Log('FormResize');
  // Cada linea ocupa 67 px.
  DBCGDesgloseFacEmi.RowCount := DBCGDesgloseFacEmi.Height div 67;
  DBCGDesgloseFacRec.RowCount := DBCGDesgloseFacRec.Height div 67;
end;

procedure TFMSII.TSEmitidasShow(Sender: TObject);
begin
  inherited;
  DMMain.Log('TSEmitidasShow');
  DBEIdSuministroFacturasEmitidasChange(Sender);

  // Establece la cantidad de lineas de detalle segun el alto del formulario
  FormResize(Sender);
end;

procedure TFMSII.TSRecibidasShow(Sender: TObject);
begin
  inherited;
  DMMain.Log('TSRecibidasShow');
  DBEIdSuministroFacturasRecibidasChange(Sender);

  // Establece la cantidad de lineas de detalle segun el alto del formulario
  FormResize(Sender);
end;

procedure TFMSII.DBEESTADO_REGISTROChange(Sender: TObject);
begin
  inherited;
  DMMain.Log('DBEESTADO_REGISTROChange');
  if (TDBEdit(Sender).Text = 'Correcto') then
     ColorResaltado2(TDBEdit(Sender))
  else
  if (TDBEdit(Sender).Text = 'Incorrecto') then
     ColorError(TDBEdit(Sender))
  else
     ColorEdicion(TDBEdit(Sender));
end;

procedure TFMSII.DBGRegistroFacturasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  EstadoRegistro : string;
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        EstadoRegistro := DataSource.DataSet.FieldByName('ESTADO_REGISTRO').AsString;

        if (EstadoRegistro = '') then
           ColorInfo(Canvas)
        else
        if (EstadoRegistro = 'Correcto') then
           ColorResaltado2(Canvas)
        else
        if (EstadoRegistro = 'Incorrecto') then
           ColorError(Canvas)
        else
           ColorResaltado3(Canvas);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMSII.DBGRegistroFacturasRecibidasDblClick(Sender: TObject);
begin
  inherited;
  PCRegistroFacturasRecibidas.ActivePage := TSFichaRegistroFacturasRecibidas;
end;

procedure TFMSII.DBGRegistroFacturasEmitidasDblClick(Sender: TObject);
begin
  inherited;
  PCRegistroFacturasEmitidas.ActivePage := TSFichaRegistroFacturasEmitidas;
end;

procedure TFMSII.DBGRegistroFacturasEmitidasDisponiblesDblClick(Sender: TObject);
begin
  inherited;
  if (DMSII.xSLRFacEmiID_SII_SUMLRFACTURASEMITIDAS.AsInteger <> 0) then
     DMSII.SeleccionaFacturaEmitida;
end;

procedure TFMSII.DBGRegistroFacturasRecibidasDisponiblesDblClick(Sender: TObject);
begin
  inherited;
  if (DMSII.xSLRFacRecID_SII_SUMLRFACTURASRECIBIDAS.AsInteger <> 0) then
     DMSII.SeleccionaFacturaRecibida;
end;

procedure TFMSII.DBGRegistroFacturasDisponiblesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  FechaEmision : TDateTime;
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if (gdFocused in State) then // If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        FechaEmision := 0;
        if (Sender = DBGRegistroFacturasRecibidasDisponibles) then
           FechaEmision := Trunc(DataSource.DataSet.FieldByName('FACREC_FECHAREGCONTABLE').AsDateTime)
        else
        if (Sender = DBGRegistroFacturasEmitidasDisponibles) then
           FechaEmision := Trunc(DataSource.DataSet.FieldByName('IDFAC_EMISOR_FECHA_EXPEDICION').AsDateTime);

        (*
        if (FechaEmision < InicioPrimerSemestre2017) then
           ColorEdicion(Canvas)
        else
        *)

        if (FechaEmision >= Today) then
           ColorInactivo(Canvas)
        else
        if (FechaEmision < Today - 8) then
           ColorError(Canvas)
        else
        if (FechaEmision < Today - 6) then
           ColorObjeto(Canvas, ColorFondo4, ColorTexto4)
        else
        if (FechaEmision < Today - 4) then
           ColorObjeto(Canvas, ColorFondo3, ColorTexto3)
        else
        if (FechaEmision < Today - 2) then
           ColorObjeto(Canvas, ColorFondo2, ColorTexto2)
        else
           ColorObjeto(Canvas, ColorFondo1, ColorTexto1);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMSII.DBEIdPresentacionChange(Sender: TObject);
begin
  inherited;
  DMMain.Log('DBEIdPresentacionChange');
  DBRGTipoPresentacionChange(Sender);
end;

procedure TFMSII.BSeleccionarDisponiblesEmitidasClick(Sender: TObject);
begin
  inherited;
  if (DMSII.xSLRFacEmiID_SII_SUMLRFACTURASEMITIDAS.AsInteger <> 0) then
     DMSII.SeleccionaFacturaEmitidaFecha(DEDesdeDisponiblesEmitidas.Date, DEHastaDisponiblesEmitidas.Date);
end;

procedure TFMSII.BSeleccionarDisponiblesRecibidasClick(Sender: TObject);
begin
  inherited;
  if (DMSII.xSLRFacRecID_SII_SUMLRFACTURASRECIBIDAS.AsInteger <> 0) then
     DMSII.SeleccionaFacturaRecibidaFecha(DEDesdeDisponiblesRecibidas.Date, DEHastaDisponiblesRecibidas.Date);
end;

procedure TFMSII.AIrADocumentoEmitidasExecute(Sender: TObject);
begin
  inherited;
  // Enlace a documento de ventas
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT EMPRESA, EJERCICIO, CANAL, DOC_SERIE, DOC_TIPO, DOC_NUMERO FROM EMP_REGISTRO_IVA WHERE ID_I = :ID_I';
        if (PCRegistroFacturasEmitidas.ActivePage = TSDisponiblesRegistroFacturasEmitidas) then
           Params.ByName['ID_I'].AsInteger := DMSII.xRLRFacEmiDisponiblesID_I.AsInteger
        else
           Params.ByName['ID_I'].AsInteger := DMSII.xRLRFacEmiID_I.AsInteger;
        ExecQuery;

        FMain.MuestraDocumento(FieldByName['EJERCICIO'].AsInteger, FieldByName['DOC_TIPO'].AsString, FieldByName['DOC_SERIE'].AsString, FieldByName['DOC_NUMERO'].AsInteger);

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TFMSII.AIrADocumentoRecibidasExecute(Sender: TObject);
begin
  inherited;
  // Enlace a documento de compras
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT EMPRESA, EJERCICIO, CANAL, DOC_SERIE, DOC_TIPO, DOC_NUMERO FROM EMP_REGISTRO_IVA WHERE ID_I = :ID_I';
        if (PCRegistroFacturasRecibidas.ActivePage = TSDisponiblesTSRegistroFacturasRecibidas) then
           Params.ByName['ID_I'].AsInteger := DMSII.xRLRFacRecDisponiblesID_I.AsInteger
        else
           Params.ByName['ID_I'].AsInteger := DMSII.xRLRFacRecID_I.AsInteger;
        ExecQuery;

        FMain.MuestraDocumento(FieldByName['EJERCICIO'].AsInteger, FieldByName['DOC_TIPO'].AsString, FieldByName['DOC_SERIE'].AsString, FieldByName['DOC_NUMERO'].AsInteger);

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TFMSII.AIrARegistroIVAEmitidasExecute(Sender: TObject);
begin
  inherited;
  // Enlace a registro de IVA soportado
  if (PCRegistroFacturasEmitidas.ActivePage = TSDisponiblesRegistroFacturasEmitidas) then
     FMain.MuestraIVA('ID_I=' + IntToStr(DMSII.xRLRFacEmiDisponiblesID_I.AsInteger), 'R')
  else
     FMain.MuestraIVA('ID_I=' + IntToStr(DMSII.xRLRFacEmiID_I.AsInteger), 'R');
end;

procedure TFMSII.AIrARegistroIVARecibidasExecute(Sender: TObject);
begin
  inherited;
  // Enlace a registro de IVA repercutido
  if (PCRegistroFacturasRecibidas.ActivePage = TSDisponiblesTSRegistroFacturasRecibidas) then
     FMain.MuestraIVA('ID_I=' + IntToStr(DMSII.xRLRFacRecDisponiblesID_I.AsInteger), 'S')
  else
     FMain.MuestraIVA('ID_I=' + IntToStr(DMSII.xRLRFacRecID_I.AsInteger), 'S');
end;

procedure TFMSII.PCRegistroFacturasEmitidasChange(Sender: TObject);
begin
  inherited;
  // Al cambiar de pestaña, tambien se cambia la de facturas recibidas.
  if (not ModificandoPageControRegistroFacturas) then
  begin
     ModificandoPageControRegistroFacturas := True;

     if (PCRegistroFacturasEmitidas.ActivePage = TSFichaRegistroFacturasEmitidas) then
        PCRegistroFacturasRecibidas.ActivePage := TSFichaRegistroFacturasRecibidas;
     if (PCRegistroFacturasEmitidas.ActivePage = TSTablaRegistroFacturasEmitidas) then
        PCRegistroFacturasRecibidas.ActivePage := TSTablaRegistroFacturasRecibidas;
     if (PCRegistroFacturasEmitidas.ActivePage = TSDisponiblesRegistroFacturasEmitidas) then
        PCRegistroFacturasRecibidas.ActivePage := TSDisponiblesTSRegistroFacturasRecibidas;

     ModificandoPageControRegistroFacturas := False;
  end;
end;

procedure TFMSII.PCRegistroFacturasRecibidasChange(Sender: TObject);
begin
  inherited;
  // Al cambiar de pestaña, tambien se cambia la de facturas emitidas.
  if (not ModificandoPageControRegistroFacturas) then
  begin
     ModificandoPageControRegistroFacturas := True;

     if (PCRegistroFacturasRecibidas.ActivePage = TSFichaRegistroFacturasRecibidas) then
        PCRegistroFacturasEmitidas.ActivePage := TSFichaRegistroFacturasEmitidas;
     if (PCRegistroFacturasRecibidas.ActivePage = TSTablaRegistroFacturasRecibidas) then
        PCRegistroFacturasEmitidas.ActivePage := TSTablaRegistroFacturasEmitidas;
     if (PCRegistroFacturasRecibidas.ActivePage = TSDisponiblesTSRegistroFacturasRecibidas) then
        PCRegistroFacturasEmitidas.ActivePage := TSDisponiblesRegistroFacturasEmitidas;

     ModificandoPageControRegistroFacturas := False;
  end;
end;

procedure TFMSII.AVerificarPresentacionExecute(Sender: TObject);
begin
  inherited;
  DMSII.VerificarRespuestaPresentacion(REntorno.Entrada);
end;

procedure TFMSII.DBEIdSuministroFacturasEmitidasChange(Sender: TObject);
begin
  inherited;
  RestringirDisponibles;
  PNLRegistroFacturasEmitidas.Visible := (StrToIntDef(DBEIdSuministroFacturasEmitidas.Text, -1) > 0);
end;

procedure TFMSII.DBEIdSuministroFacturasRecibidasChange(Sender: TObject);
begin
  inherited;
  RestringirDisponibles;
  PNLRegistroFacturasRecibidas.Visible := (StrToIntDef(DBEIdSuministroFacturasRecibidas.Text, -1) > 0);
end;

procedure TFMSII.DBECSV1Change(Sender: TObject);
begin
  inherited;
  RestringirDisponibles;
end;

procedure TFMSII.DBECSVChange(Sender: TObject);
begin
  inherited;
  RestringirDisponibles;
end;

procedure TFMSII.RestringirDisponibles;
begin
  // Facturas emitidas
  if (DMSII.xSLRFacEmi.Active and (DMSII.xSLRFacEmiID_SII_SUMLRFACTURASEMITIDAS.AsInteger <> 0) and (DMSII.xSLRFacEmiCSV.AsString = '')) then
  begin
     TSDisponiblesRegistroFacturasEmitidas.Enabled := True;
     TSDisponiblesRegistroFacturasEmitidas.TabVisible := True;
     NavRegistroFacturasEmitidas.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh];
     PNLRegistroFacturasEmitidasDatos.Enabled := True;
     PNLDesgloseFacturasEmitidas.Enabled := True;
  end
  else
  begin
     TSDisponiblesRegistroFacturasEmitidas.Enabled := False;
     // TSDisponiblesRegistroFacturasEmitidas.TabVisible := False;
     NavRegistroFacturasEmitidas.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
     PNLRegistroFacturasEmitidasDatos.Enabled := False;
     PNLDesgloseFacturasEmitidas.Enabled := False;
  end;

  // Facturas recibidas
  if (DMSII.xSLRFacRec.Active and (DMSII.xSLRFacRecID_SII_SUMLRFACTURASRECIBIDAS.AsInteger <> 0) and (DMSII.xSLRFacRecCSV.AsString = '')) then
  begin
     TSDisponiblesTSRegistroFacturasRecibidas.Enabled := True;
     TSDisponiblesTSRegistroFacturasRecibidas.TabVisible := True;
     NavRegistroFacturasRecibidas.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh];
     PNLRegistroFacturasRecibidasDatos.Enabled := True;
     PNLDesgloseRegistroFacturasRecibidas.Enabled := True;
  end
  else
  begin
     TSDisponiblesTSRegistroFacturasRecibidas.Enabled := False;
     // TSDisponiblesTSRegistroFacturasRecibidas.TabVisible := False;
     NavRegistroFacturasRecibidas.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
     PNLRegistroFacturasRecibidasDatos.Enabled := False;
     PNLDesgloseRegistroFacturasRecibidas.Enabled := False;
  end;
end;

procedure TFMSII.NavSuministroFacturasRecibidasClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button in [nbPost]) then
     RestringirDisponibles;
end;

procedure TFMSII.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button in [nbPost]) then
     RestringirDisponibles;
end;

procedure TFMSII.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
