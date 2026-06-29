unit UFMRegistroIVA;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, ExtCtrls, URecursos, DBCtrls, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid,
  UFIBDBEditfind, Mask, UDBDateTimePicker, UDBGridSplit, Buttons,
  UComponentesBusquedaFiltrada, dbcgrids, ActnList, rxPlacemnt, NsDBGrid,
  ULFEdit, ULFDBEditFind2000, ULFDBCtrlGrid, ULFDBCheckBox, ULFDBEdit,
  ULFFormStorage, ULFActionList, ULFToolBar, ULFPanel, ULFPageControl,
  TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, UG2kTBLoc, RxDBComb;

type
  TFMRegistroIVA = class(TFPEdit)
     DBRGTipo: TDBRadioGroup;
     GBRegistro: TGroupBox;
     DBERegistro: TLFDbedit;
     LNumero: TLFLabel;
     LFecha: TLFLabel;
     GBDoc: TGroupBox;
     DBEDocNum: TLFDbedit;
     DBEDocSerie: TLFDbedit;
     LNumeroDocumento: TLFLabel;
     LSerie: TLFLabel;
     LFechaDocumento: TLFLabel;
     DBEDescripcion_Cta: TLFDbedit;
     DBECif: TLFDbedit;
     LLiquido: TLFLabel;
     DBELiquido: TLFDbedit;
     PDetalle: TLFPanel;
     LModoIVA: TLFLabel;
     ETitModo: TLFEdit;
     DBE_S_Bases: TLFDbedit;
     DBE_S_Ivas: TLFDbedit;
     DBE_S_Recargos: TLFDbedit;
     LBaseImponible: TLFLabel;
     LImporteIVA: TLFLabel;
     LImporteRecargo: TLFLabel;
     DBCBContabilizado: TLFDBCheckBox;
     DBCGDetalle: TLFDBCtrlGrid;
     EFIva: TLFDBEditFind2000;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     DBEDescTipo: TLFDbedit;
     DBEBase: TLFDbedit;
     DBEImpIva: TLFDbedit;
     TButtSep1: TToolButton;
     LPorcentajeIVA: TLFLabel;
     LImporteBase: TLFLabel;
     LCuotaIVA: TLFLabel;
     DBEImpRec: TLFDbedit;
     DBEPiva: TLFDbedit;
     DBEPRecargo: TLFDbedit;
     LPorcentajeRecargo: TLFLabel;
     LCuotaRecargo: TLFLabel;
     LTipoIVA: TLFLabel;
     DBEDocTipo: TLFDbedit;
     TButtSep2: TToolButton;
     TBtPermutarTipo: TToolButton;
     DBEDocFecha: TLFDbedit;
     DBEFechaRegistro: TLFDbedit;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     PNLTipoIVA: TLFPanel;
     ESigno: TLFEdit;
     DBEModoIva: TLFDbedit;
     DBECuenta: TLFDbedit;
     ARenumerar: TAction;
     AListadoIVA: TAction;
     LFCategoryAction1: TLFCategoryAction;
     LFCategoryAction2: TLFCategoryAction;
     DBCBRECC: TLFDBCheckBox;
     DBGRECC: THYTDBGrid;
     TSSII: TTabSheet;
     PNLSIIEmitidas: TLFPanel;
     PNLSIIRecibidas: TLFPanel;
     TBSIIEmitidas: TLFToolBar;
     NavSIIEmitidas: THYMNavigator;
     TBSIIRecibidas: TLFToolBar;
     NavSIIRecibidas: THYMNavigator;
     SBVerFactura: TSpeedButton;
     PNLRegistroFacturasEmitidasDatos: TLFPanel;
     LFLabel9: TLFLabel;
     LFLabel1: TLFLabel;
     LFLabel10: TLFLabel;
     LFLabel11: TLFLabel;
     LFLabel12: TLFLabel;
     LFLabel13: TLFLabel;
     LFLabel15: TLFLabel;
     LFLabel16: TLFLabel;
     LFLabel17: TLFLabel;
     LFLabel18: TLFLabel;
     LFLabel19: TLFLabel;
     LFLabel2: TLFLabel;
     LFLabel20: TLFLabel;
     LFLabel21: TLFLabel;
     LFLabel22: TLFLabel;
     LFLabel23: TLFLabel;
     LFLabel24: TLFLabel;
     LFLabel25: TLFLabel;
     LFLabel26: TLFLabel;
     LFLabel27: TLFLabel;
     LFLabel28: TLFLabel;
     LFLabel29: TLFLabel;
     LFLabel3: TLFLabel;
     LFLabel30: TLFLabel;
     LFLabel31: TLFLabel;
     LFLabel32: TLFLabel;
     LFLabel33: TLFLabel;
     LFLabel34: TLFLabel;
     LFLabel35: TLFLabel;
     LFLabel36: TLFLabel;
     LFLabel37: TLFLabel;
     LFLabel38: TLFLabel;
     LFLabel4: TLFLabel;
     LFLabel5: TLFLabel;
     LFLabel6: TLFLabel;
     LFLabel7: TLFLabel;
     LFLabel8: TLFLabel;
     DBEFACEXP_BASEIMPONIBLEACOSTE: TLFDbedit;
     DBEFACEXP_CLAVE_REG_ESP: TLFDbedit;
     DBEFACEXP_CLAVE_REG_ESP1: TLFDbedit;
     DBEFACEXP_CLAVE_REG_ESP2: TLFDbedit;
     DBEFACEXP_CONTRAP_NIF: TLFDbedit;
     DBEFACEXP_CONTRAP_NIF_REPRES: TLFDbedit;
     DBEFACEXP_CONTRAP_NOMBRE_RAZON: TLFDbedit;
     DBEFACEXP_CONTRAPARTE_CODPAIS: TLFDbedit;
     DBEFACEXP_CONTRAPARTE_ID: TLFDbedit;
     DBEFACEXP_CONTRAPARTE_IDTYPE: TLFDbedit;
     DBEFACEXP_CUPON: TLFDbedit;
     DBEFACEXP_DESCRIPCION: TLFDbedit;
     DBEFACEXP_EMITIDA_POR_TERCEROS: TLFDbedit;
     DBEFACEXP_FAGR_FECHAEXPEDICION: TLFDbedit;
     DBEFACEXP_FAGR_NUMSERIEFACEMISOR: TLFDbedit;
     DBEFACEXP_FECHAOPERACION: TLFDbedit;
     DBEFACEXP_FRECT_FECHAEXPEDICION: TLFDbedit;
     DBEFACEXP_FRECT_NUMSERIEFACEMISOR: TLFDbedit;
     DBEFACEXP_IMPORTE_TOTAL: TLFDbedit;
     DBEFACEXP_IMPORTETRANSMSUJETAIVA: TLFDbedit;
     DBEFACEXP_IMPRECT_BASERECT: TLFDbedit;
     DBEFACEXP_IMPRECT_CUOTARECRECT: TLFDbedit;
     DBEFACEXP_IMPRECT_CUOTARECT: TLFDbedit;
     DBEFACEXP_INMUEBLE_REFCATASTRAL: TLFDbedit;
     DBEFACEXP_INMUEBLE_SITUACIONINM: TLFDbedit;
     DBEFACEXP_NUMREGACUERDOFAC: TLFDbedit;
     DBEFACEXP_TIPOFACTURA: TLFDbedit;
     DBEFACEXP_TIPORECTIFICATIVA: TLFDbedit;
     DBEFACEXP_VARIOSDESTINATARIOS: TLFDbedit;
     DBEID_SII_REGLRFACTURASEMITIDAS: TLFDbedit;
     DBEIDFAC_EMISOR_NIF: TLFDbedit;
     DBEIDFAC_EMISOR_NUMSERIEFAC: TLFDbedit;
     DBEIDFAC_EMISOR_NUMSERIEFACFIN: TLFDbedit;
     DBEPERIODOIMPOSITIVO_EJERCICIO: TLFDbedit;
     DBEPERIODOIMPOSITIVO_PERIODO: TLFDbedit;
     DBETIPO_DESGLOSE: TLFDbedit;
     DBETIPO_DESGLOSE_OPERACION: TLFDbedit;
     PNLDesgloseFacturasEmitidas: TLFPanel;
     DBGDesgloseFacturasEmitidas: TDBGridFind2000;
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
     LFLabel85: TLFLabel;
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
     TBDesgloseFacturasEmitidas: TLFToolBar;
     NavDesgloseFacturasEmitidas: THYMNavigator;
     PNLRegistroFacturasRecibidasDatos: TLFPanel;
     LFLabel74: TLFLabel;
     LFLabel14: TLFLabel;
     LFLabel39: TLFLabel;
     LFLabel40: TLFLabel;
     LFLabel41: TLFLabel;
     LFLabel42: TLFLabel;
     LFLabel43: TLFLabel;
     LFLabel44: TLFLabel;
     LFLabel45: TLFLabel;
     LFLabel46: TLFLabel;
     LFLabel47: TLFLabel;
     LFLabel48: TLFLabel;
     LFLabel49: TLFLabel;
     LFLabel50: TLFLabel;
     LFLabel51: TLFLabel;
     LFLabel52: TLFLabel;
     LFLabel53: TLFLabel;
     LFLabel54: TLFLabel;
     LFLabel55: TLFLabel;
     LFLabel56: TLFLabel;
     LFLabel57: TLFLabel;
     LFLabel58: TLFLabel;
     LFLabel59: TLFLabel;
     LFLabel60: TLFLabel;
     LFLabel61: TLFLabel;
     LFLabel62: TLFLabel;
     LFLabel63: TLFLabel;
     LFLabel64: TLFLabel;
     LFLabel65: TLFLabel;
     LFLabel66: TLFLabel;
     LFLabel67: TLFLabel;
     LFLabel68: TLFLabel;
     LFLabel69: TLFLabel;
     LFLabel70: TLFLabel;
     LFLabel71: TLFLabel;
     LFLabel72: TLFLabel;
     LFLabel73: TLFLabel;
     DBEFACREC_ADUANAS_FECHAREGCONTDUA: TLFDbedit;
     DBEFACREC_ADUANAS_NUMERODUA: TLFDbedit;
     DBEFACREC_BASEIMPONIBLEACOSTE: TLFDbedit;
     DBEFACREC_CLAVE_REG_ESP: TLFDbedit;
     DBEFACREC_CLAVE_REG_ESP1: TLFDbedit;
     DBEFACREC_CLAVE_REG_ESP2: TLFDbedit;
     DBEFACREC_CONTRAP_NIF: TLFDbedit;
     DBEFACREC_CONTRAP_NIF_REPRES: TLFDbedit;
     DBEFACREC_CONTRAP_NOMBRE_RAZON: TLFDbedit;
     DBEFACREC_CONTRAPARTE_CODPAIS: TLFDbedit;
     DBEFACREC_CONTRAPARTE_ID: TLFDbedit;
     DBEFACREC_CONTRAPARTE_IDTYPE: TLFDbedit;
     DBEFACREC_CUOTA_DEDUCIBLE: TLFDbedit;
     DBEFACREC_DESCRIPCION: TLFDbedit;
     DBEFACREC_FAGR_FECHAEXPEDICION: TLFDbedit;
     DBEFACREC_FAGR_NUMSERIEFACEMISOR: TLFDbedit;
     DBEFACREC_FECHAOPERACION: TLFDbedit;
     DBEFACREC_FECHAREGCONTABLE: TLFDbedit;
     DBEFACREC_FRECT_FECHAEXPEDICION: TLFDbedit;
     DBEFACREC_FRECT_NUMSERIEFACEMISOR: TLFDbedit;
     DBEFACREC_IMPORTE_TOTAL: TLFDbedit;
     DBEFACREC_IMPRECT_BASERECT: TLFDbedit;
     DBEFACREC_IMPRECT_CUOTARECRECT: TLFDbedit;
     DBEFACREC_IMPRECT_CUOTARECT: TLFDbedit;
     DBEFACREC_NUMREGACUERDOFAC: TLFDbedit;
     DBEFACREC_TIPOFACTURA: TLFDbedit;
     DBEFACREC_TIPORECTIFICATIVA: TLFDbedit;
     DBEID_SII_REGLRFACTURASRECIBIDAS: TLFDbedit;
     DBEIDFAC_EMISOR_FECHA_EXPEDICION: TLFDbedit;
     DBEIDFAC_EMISOR_NIF1: TLFDbedit;
     DBEIDFAC_EMISOR_NUMSERIEFAC1: TLFDbedit;
     DBEIDFAC_EMISOR_NUMSERIEFACFIN1: TLFDbedit;
     DBEIDFAC_EMISOR_OTRO_CODPAIS: TLFDbedit;
     DBEIDFAC_EMISOR_OTRO_ID: TLFDbedit;
     DBEIDFAC_EMISOR_OTRO_IDTYPE: TLFDbedit;
     DBEPERIODOIMPOSITIVO_EJERCICIO1: TLFDbedit;
     DBEPERIODOIMPOSITIVO_PERIODO1: TLFDbedit;
     PNLDesgloseRegistroFacturasRecibidas: TLFPanel;
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
     LFLabel96: TLFLabel;
     LFLabel97: TLFLabel;
     LFLabel98: TLFLabel;
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
     DBEDI_PORCENTCOMPSENSACIONREAGYP: TLFDbedit;
     DBEDI_IMPORTECOMPSENSACIONREAGYP: TLFDbedit;
     LEstadoRegistro: TLFLabel;
     DBEEstadoRegistroRecibida: TLFDbedit;
     DBECODIGO_ERROR: TLFDbedit;
     DBEDESCRIPCION_ERROR: TLFDbedit;
     LEstadoRegistroEmi: TLFLabel;
     DBEEstadoRegistroEmitida: TLFDbedit;
     DBECODIGO_ERROR1: TLFDbedit;
     DBEDESCRIPCION_ERROR1: TLFDbedit;
     Butt1: TToolButton;
     Butt2: TToolButton;
     ButtGenerarModificacionEmitida: TToolButton;
     ButtGenerarModificacionRecibida: TToolButton;
     Butt3: TToolButton;
     Butt4: TToolButton;
     ButtGenerarBajaEmitida: TToolButton;
     ButtGenerarBajaRecibida: TToolButton;
     TButtRegenerarSIIEmitidas: TToolButton;
     TButtRegenerarSIIRecibidas: TToolButton;
     DBETipoComunicacionEmi: TLFDbedit;
     DBETipoComunicacionRec: TLFDbedit;
     CKInversionSujetoPasivo: TLFDBCheckBox;
     AExportarExcel: TAction;
     TSep1: TToolButton;
     TBDesvincularSIIEmitidas: TToolButton;
     TSep2: TToolButton;
     TBDesvincularSIIRecibida: TToolButton;
     TBTSep3: TToolButton;
     TBSIIModificaTipoDesgloseSIIEmitidas: TToolButton;
     LTipoImpuestoAdicional: TLFLabel;
     LPorcImpuestoAdicional: TLFLabel;
     LImpuestoAdicional: TLFLabel;
     DBETipoImpuestoAdicional: TLFDbedit;
     DBEPorcTipoImpuestoAdicional: TLFDbedit;
     DBELImpuestoAdicional: TLFDbedit;
     LSImpuestoAdicional: TLFLabel;
     DBESImpuestoAdicional: TLFDbedit;
     AExportarExcelPrimerTrimestre: TAction;
     AExportarExcelSegundoTrimestre: TAction;
     AExportarExcelTercerTrimestre: TAction;
     AExportarExcelCuartoTrimestre: TAction;
     EIdPresentacionEmi: TLFEdit;
     EIdPresentacionRec: TLFEdit;
     LIdPresentacinoRec: TLFLabel;
     LIdPresentacionEmi: TLFLabel;
     RBCBTipoComunicacionSuministroFacturasEmitidas: TRxDBComboBox;
     RBCBTipoComunicacionSuministroFacturasRecibidas: TRxDBComboBox;
     DBCBAnulado: TLFDBCheckBox;
     LRetencion: TLFLabel;
     DBERetencion: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TSTablaShow(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure ARenumerarExecute(Sender: TObject);
     procedure TBtPermutarTipoClick(Sender: TObject);
     procedure AListadoIVAExecute(Sender: TObject);
     procedure DBEModoIvaChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBCBRECCChange(Sender: TObject);
     procedure DBGRECCDblClick(Sender: TObject);
     procedure SBVerFacturaDblClick(Sender: TObject);
     procedure FormResize(Sender: TObject);
     procedure TSSIIShow(Sender: TObject);
     procedure DBEEstadoRegistroRecibidaChange(Sender: TObject);
     procedure ButtGenerarModificacionEmitidaClick(Sender: TObject);
     procedure ButtGenerarModificacionRecibidaClick(Sender: TObject);
     procedure ButtGenerarBajaEmitidaClick(Sender: TObject);
     procedure ButtGenerarBajaRecibidaClick(Sender: TObject);
     procedure TButtRegenerarSIIEmitidasClick(Sender: TObject);
     procedure TButtRegenerarSIIRecibidasClick(Sender: TObject);
     procedure PCMainChanging(Sender: TObject; var AllowChange: boolean);
     procedure AExportarExcelExecute(Sender: TObject);
     procedure TBDesvincularSIIEmitidasClick(Sender: TObject);
     procedure TBDesvincularSIIRecibidaClick(Sender: TObject);
     procedure TBSIIModificaTipoDesgloseSIIEmitidasClick(Sender: TObject);
     procedure DBEID_SII_REGLRFACTURASEMITIDASChange(Sender: TObject);
     procedure DBEID_SII_REGLRFACTURASRECIBIDASChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBCBAnuladoChange(Sender: TObject);
  private
     { Private declarations }
     procedure ActualizaSigno;
  public
     { Public declarations }
     procedure FiltraRegistro(Filtro: string; Signo: string);
  end;

var
  FMRegistroIVA : TFMRegistroIVA;

implementation

uses UDMRegistroIVA, UDMMain, UFormGest, UEntorno, UUtiles, UFMLSTIva,
  UFMain, HYFIBQuery, UDameDato;

{$R *.DFM}

procedure TFMRegistroIVA.FormCreate(Sender: TObject);
var
  col : integer;
begin
  inherited;
  AbreData(TDMRegistroIVA, DMRegistroIVA);

  NavMain.DataSource := DMRegistroIVA.DSQMRegistroIVA;
  DBGMain.DataSource := DMRegistroIVA.DSQMRegistroIVA;
  NavSIIEmitidas.DataSource := DMRegistroIVA.DSRLRFacEmi;
  NavDesgloseFacturasEmitidas.DataSource := DMRegistroIVA.DSDesgloseFacEmi;
  NavSIIRecibidas.DataSource := DMRegistroIVA.DSRLRFacRec;
  NavDesgloseRegistroFacturasRecibidas.DataSource := DMRegistroIVA.DSDesgloseFacRec;

  col := EncuentraField(DBGRECC, 'REGISTRO_CARTERA');
  if (col >= 0) then
     DBGRECC.Columns[col].Color := REntorno.ColorEnlaceActivo;

  PNLSIIEmitidas.Align := alClient;
  PNLSIIRecibidas.Align := alClient;

  DMRegistroIVA.FiltraRegistroIVA('', 'R');
  // Actualiza Edit de signo de IVA (Soportado/Repercutido)
  ActualizaSigno;

  SolapaControles(SBVerFactura, DBEDocTipo);
  DBEDocTipo.Color := REntorno.ColorEnlaceActivo;
  DBCBAnuladoChange(Sender);

  if (REntorno.Pais <> 'CHL') then
  begin
     LTipoImpuestoAdicional.Visible := False;
     LPorcImpuestoAdicional.Visible := False;
     LImpuestoAdicional.Visible := False;
     DBETipoImpuestoAdicional.Visible := False;
     DBEPorcTipoImpuestoAdicional.Visible := False;
     DBELImpuestoAdicional.Visible := False;
     LSImpuestoAdicional.Visible := False;
     DBESImpuestoAdicional.Visible := False;
     CKInversionSujetoPasivo.Left := DBETipoImpuestoAdicional.Left + 2;
  end;
end;

procedure TFMRegistroIVA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRegistroIVA);
end;

procedure TFMRegistroIVA.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMRegistroIVA.BusquedaCompleja;
  Continua := False;
end;

procedure TFMRegistroIVA.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMRegistroIVA.TSTablaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMRegistroIVA.FiltraRegistro(Filtro: string; Signo: string);
begin
  DMRegistroIVA.FiltraRegistroIVA(Filtro, Signo);

  // Actualiza Edit de signo de IVA (Soportado/Repercutido)
  ActualizaSigno;

  NavMain.DataSource := DMRegistroIVA.DSQMRegistroIVA;
  DBGMain.DataSource := DMRegistroIVA.DSQMRegistroIVA;
  NavSIIEmitidas.DataSource := DMRegistroIVA.DSRLRFacEmi;
  NavDesgloseFacturasEmitidas.DataSource := DMRegistroIVA.DSDesgloseFacEmi;
  NavSIIRecibidas.DataSource := DMRegistroIVA.DSRLRFacRec;
  NavDesgloseRegistroFacturasRecibidas.DataSource := DMRegistroIVA.DSDesgloseFacRec;

  TSSIIShow(Self);
end;

procedure TFMRegistroIVA.ARenumerarExecute(Sender: TObject);
var
  Periodo : string;
begin
  inherited;
  // Obtener periodo
  if (DMMain.EstadoKri(444) = 1) then
     Periodo := InputBox(_('Período'), _('Introduzca período desde el cual se procederá a remumerar'), '01')
  else
     Periodo := '01';

  if (StrToIntDef(Periodo, -1) < 1) or (StrToIntDef(Periodo, 13) > 12) then
     ShowMessage(_('El valor del período debe ser ente 01 y 12'))
  else
  begin
     // Me aseguro que el formato del periodo sea el correcto ('nn')
     Periodo := Format('%.2d', [StrToInt(Periodo)]);
     DMRegistroIVA.Renumera(Periodo);
  end;
end;

procedure TFMRegistroIVA.TBtPermutarTipoClick(Sender: TObject);
begin
  inherited;
  // Cambiar signo de IVA (Soportado/Repercutido)
  DMRegistroIVA.CambiaSigno;

  if (PCMain.ActivePage = TSSII) then
  begin
     DMRegistroIVA.CierraSII;
     TSSIIShow(Sender);
  end;

  // Actualiza Edit de signo de IVA (Soportado/Repercutido)
  ActualizaSigno;
end;

procedure TFMRegistroIVA.AListadoIVAExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TFMLstIva, FMLstIva, Sender);
  FMLstIva.EstablecerDefectoIva(DMRegistroIVA.Signo);
end;

procedure TFMRegistroIVA.DBEModoIvaChange(Sender: TObject);
begin
  inherited;
  ETitModo.Text := DameTituloModoIVA(StrToIntDef(DBEModoIva.Text, -1));
end;

procedure TFMRegistroIVA.FormShow(Sender: TObject);
begin
  /// Esto es para Mirko y MUY peligroso!!!
  /// Permite modificar los valores de IVA, pudiendo ser diferentes a la factura / contabilidad / cartera

  inherited;
  if (DMMain.EstadoKri(503) = 1) then
  begin
     DBEPiva.Enabled := True;
     DBEPiva.ReadOnly := False;
     DBEPiva.Color := clWindow;
     DBEPRecargo.Enabled := True;
     DBEPRecargo.ReadOnly := False;
     DBEPRecargo.Color := clWindow;
     DBEBase.Enabled := True;
     DBEBase.ReadOnly := False;
     DBEBase.Color := clWindow;
     DBEImpIva.Enabled := True;
     DBEImpIva.ReadOnly := False;
     DBEImpIva.Color := clWindow;
     DBEImpRec.Enabled := True;
     DBEImpRec.ReadOnly := False;
     DBEImpRec.Color := clWindow;
     NavDetalle.VisibleButtons := NavDetalle.VisibleButtons + [URecursos.nbEdit];
     NavDetalle.VisibleButtons := NavDetalle.VisibleButtons + [URecursos.nbPost];
     NavDetalle.VisibleButtons := NavDetalle.VisibleButtons + [URecursos.nbCancel];
  end
  else
  begin
     DBEPiva.Enabled := False;
     DBEPiva.ReadOnly := True;
     DBEPiva.Color := clInfoBk;
     DBEPRecargo.Enabled := False;
     DBEPRecargo.ReadOnly := True;
     DBEPRecargo.Color := clInfoBk;
     DBEBase.Enabled := False;
     DBEBase.ReadOnly := True;
     DBEBase.Color := clInfoBk;
     DBEImpIva.Enabled := False;
     DBEImpIva.ReadOnly := True;
     DBEImpIva.Color := clInfoBk;
     DBEImpRec.Enabled := False;
     DBEImpRec.ReadOnly := True;
     DBEImpRec.Color := clInfoBk;
     NavDetalle.VisibleButtons := NavDetalle.VisibleButtons - [URecursos.nbEdit];
     NavDetalle.VisibleButtons := NavDetalle.VisibleButtons - [URecursos.nbPost];
     NavDetalle.VisibleButtons := NavDetalle.VisibleButtons - [URecursos.nbCancel];
  end;

  // Reposiciono los Labes porque al agregar botones al Navegador se desplazan
  LTipoIVA.Width := (EFIva.Width + DBEDescTipo.Width) - (NavDetalle.Width + TButtSep1.Width) + 1;

  DBCBRECCChange(Sender);
end;

procedure TFMRegistroIVA.DBCBRECCChange(Sender: TObject);
begin
  inherited;
  if (DBCBRECC.Checked) then
  begin
     DBCGDetalle.RowCount := 5;
     DBGRECC.Visible := True;
  end
  else
  begin
     DBCGDetalle.RowCount := 8;
     DBGRECC.Visible := False;
  end;
end;

procedure TFMRegistroIVA.DBGRECCDblClick(Sender: TObject);
begin
  inherited;
  DMRegistroIVA.MuestraRegistroCartera;
end;

procedure TFMRegistroIVA.ActualizaSigno;
begin
  if DMRegistroIVA.Signo = 'R' then
  begin
     ESigno.Text := _('Repercutido');
     PNLSIIEmitidas.Visible := True;
     PNLSIIRecibidas.Visible := False;
  end
  else
  begin
     ESigno.Text := _('Soportado');
     PNLSIIEmitidas.Visible := False;
     PNLSIIRecibidas.Visible := True;
  end;

  // Establece la cantidad de lineas de detalle (SII), segun el alto del formulario
  FormResize(nil);
end;

procedure TFMRegistroIVA.SBVerFacturaDblClick(Sender: TObject);
begin
  inherited;
  // Abre factura o asiento segun corresponda
  FMain.MuestraDocumento(DMRegistroIVA.QMRegistroIVAEJERCICIO.AsInteger, DMRegistroIVA.QMRegistroIVADOC_TIPO.AsString,
     DMRegistroIVA.QMRegistroIVADOC_SERIE.AsString, DMRegistroIVA.QMRegistroIVADOC_NUMERO.AsInteger);
end;

procedure TFMRegistroIVA.FormResize(Sender: TObject);
begin
  inherited;
  // Cada linea ocupa 67 px.
  DBCGDesgloseFacEmi.RowCount := DBCGDesgloseFacEmi.Height div 67;
  DBCGDesgloseFacRec.RowCount := DBCGDesgloseFacRec.Height div 67;
end;

procedure TFMRegistroIVA.TSSIIShow(Sender: TObject);
begin
  inherited;
  DMRegistroIVA.AbreSII;
  // Establece la cantidad de lineas de detalle (SII), segun el alto del formulario
  FormResize(Sender);

  {
  Para evitar un error raro. Si no pongo esto al editar da un error de memoria:
   call stack - 0 : (no debug info) Find error: 400068FD
   call stack - 1 : (no debug info) Find error: 40002FEB
   call stack - 2 : Module FIBTableDataSet.pas Routine @Fibtabledataset@TFIBTableSet@DoBeforeEdit Line 1522 Find error: 00485FCA
   call stack - 3 : Module DB.pas Routine @Db@TDataSet@Edit Line 10176 Find error: 00430B9C
   call stack - 4 : Module UNavigator.pas Routine @Unavigator@THYMNavigator@BtnClick Line 582 Find error: 0048F3CA
   call stack - 5 : Module UNavigator.pas Routine @Unavigator@THYMNavigator@ClickHandler Line 514 Find error: 0048F0AD
   call stack - 6 : (no debug info) Find error: 40107986
   call stack - 7 : Module UNavigator.pas Routine @Unavigator@TNavButton@MouseUp Line 960 Find error: 00490341
   call stack - 8 : (no debug info) Find error: 40107D71
   call stack - 9 : (no debug info) Find error: 401075BB
   call stack - 10 : (no debug info) Find error: 4010A839
   call stack - 11 : (no debug info) Find error: 40039476
   call stack - 12 : (no debug info) Find error: 77E3A450
   call stack - 13 : (no debug info) Find error: 77E14601
   call stack - 14 : (no debug info) Find error: 77E15B73
   call stack - 15 : Module Merge.dpr Routine initialization Line 1789 Find error: 013B4961
   call stack - 16 : (no debug info) Find error: 794789D1
   call stack - 17 : (no debug info) Find error: FFFFFFFC
  }
  NavSIIEmitidas.BtnClick(URecursos.nbRefresh);
  NavSIIRecibidas.BtnClick(URecursos.nbRefresh);
end;

procedure TFMRegistroIVA.DBEEstadoRegistroRecibidaChange(Sender: TObject);
begin
  inherited;
  if (TDBEdit(Sender).Text = 'Correcto') then
     ColorResaltado2(TDBEdit(Sender))
  else
  if (TDBEdit(Sender).Text = 'Incorrecto') then
     ColorError(TDBEdit(Sender))
  else
  if (TDBEdit(Sender).Text = 'PENDIENTE CORRECCION') then
     ColorResaltado3(TDBEdit(Sender))
  else
     ColorEdicion(TDBEdit(Sender));
end;

procedure TFMRegistroIVA.ButtGenerarModificacionEmitidaClick(Sender: TObject);
begin
  inherited;
  if (DBEEstadoRegistroEmitida.Text = 'Correcto') then
  begin
     if (Confirma) then
        DMRegistroIVA.DuplicaRegistroSII('A1');
  end
  else
     ShowMessage(_('Solo se pueden generar modificaciones de registros presentados correctamente'));
end;

procedure TFMRegistroIVA.ButtGenerarModificacionRecibidaClick(Sender: TObject);
begin
  inherited;
  if (DBEEstadoRegistroRecibida.Text = 'Correcto') then
  begin
     if (Confirma) then
        DMRegistroIVA.DuplicaRegistroSII('A1');
  end
  else
     ShowMessage(_('Solo se pueden generar modificaciones de registros presentados correctamente'));
end;

procedure TFMRegistroIVA.ButtGenerarBajaEmitidaClick(Sender: TObject);
begin
  inherited;
  if (DBEEstadoRegistroEmitida.Text = 'Correcto') then
  begin
     if (Confirma) then
        DMRegistroIVA.DuplicaRegistroSII('A4');
  end
  else
     ShowMessage(_('Solo se pueden dar de baja registros presentados correctamente'));
end;

procedure TFMRegistroIVA.ButtGenerarBajaRecibidaClick(Sender: TObject);
begin
  inherited;
  if (DBEEstadoRegistroRecibida.Text = 'Correcto') then
  begin
     if (Confirma) then
        DMRegistroIVA.DuplicaRegistroSII('A4');
  end
  else
     ShowMessage(_('Solo se pueden dar de baja registros presentados correctamente'));
end;

procedure TFMRegistroIVA.TButtRegenerarSIIEmitidasClick(Sender: TObject);
begin
  inherited;
  if (Confirma) then
     DMRegistroIVA.RegeneraRegistroSII;
end;

procedure TFMRegistroIVA.TButtRegenerarSIIRecibidasClick(Sender: TObject);
begin
  inherited;
  if (Confirma) then
     DMRegistroIVA.RegeneraRegistroSII;
end;

procedure TFMRegistroIVA.PCMainChanging(Sender: TObject; var AllowChange: boolean);
begin
  inherited;
  if (PCMain.ActivePage = TSSII) then
     DMRegistroIVA.CierraSII;
end;

procedure TFMRegistroIVA.AExportarExcelExecute(Sender: TObject);
var
  FechaInicio, FechaFin : TDateTime;
  Periodo : string;
begin
  inherited;
  // Exportar a Excel
  FechaInicio := EncodeDate(REntorno.Ejercicio, 1, 1);
  FechaFin := EncodeDate(REntorno.Ejercicio, 12, 31);
  Periodo := '0A';

  // En el caso de pedir un trimestre, restrinjo fechas
  case TAction(Sender).Tag of
     1:
     begin
        FechaInicio := EncodeDate(REntorno.Ejercicio, 1, 1);
        FechaFin := EncodeDate(REntorno.Ejercicio, 3, 31);
        Periodo := '1T';
     end;
     2:
     begin
        FechaInicio := EncodeDate(REntorno.Ejercicio, 4, 1);
        FechaFin := EncodeDate(REntorno.Ejercicio, 6, 30);
        Periodo := '2T';
     end;
     3:
     begin
        FechaInicio := EncodeDate(REntorno.Ejercicio, 7, 1);
        FechaFin := EncodeDate(REntorno.Ejercicio, 9, 30);
        Periodo := '3T';
     end;
     4:
     begin
        FechaInicio := EncodeDate(REntorno.Ejercicio, 10, 1);
        FechaFin := EncodeDate(REntorno.Ejercicio, 12, 31);
        Periodo := '4T';
     end;
  end;

  DMRegistroIVA.ExportarExcel(Periodo, FechaInicio, FechaFin);
end;

procedure TFMRegistroIVA.TBDesvincularSIIEmitidasClick(Sender: TObject);
begin
  inherited;
  DMRegistroIVA.DesvincularSIIEmitidas;
end;

procedure TFMRegistroIVA.TBDesvincularSIIRecibidaClick(Sender: TObject);
begin
  inherited;
  DMRegistroIVA.DesvincularSIIRecibidas;
end;

procedure TFMRegistroIVA.TBSIIModificaTipoDesgloseSIIEmitidasClick(Sender: TObject);
begin
  inherited;
  DMRegistroIVA.SIIModificaTipoDesgloseSIIEmitidas;
end;

procedure TFMRegistroIVA.DBEID_SII_REGLRFACTURASEMITIDASChange(Sender: TObject);
begin
  inherited;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_SII_PRESENTACION ');
        SQL.Add(' FROM SII_SUMLRFACTURASEMITIDAS ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_SII_SUMLRFACTURASEMITIDAS = :ID_SII_SUMLRFACTURASEMITIDAS ');
        Params.ByName['ID_SII_SUMLRFACTURASEMITIDAS'].AsInteger := DMRegistroIVA.xRLRFacEmiID_SII_SUMLRFACTURASEMITIDAS.AsInteger;
        ExecQuery;
        EIdPresentacionEmi.Text := FieldByName['ID_SII_PRESENTACION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TFMRegistroIVA.DBEID_SII_REGLRFACTURASRECIBIDASChange(Sender: TObject);
begin
  inherited;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_SII_PRESENTACION ');
        SQL.Add(' FROM SII_SUMLRFACTURASRECIBIDAS ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_SII_SUMLRFACTURASRECIBIDAS = :ID_SII_SUMLRFACTURASRECIBIDAS ');
        Params.ByName['ID_SII_SUMLRFACTURASRECIBIDAS'].AsInteger := DMRegistroIVA.xRLRFacRecID_SII_SUMLRFACTURASRECIBIDAS.AsInteger;
        ExecQuery;
        EIdPresentacionRec.Text := FieldByName['ID_SII_PRESENTACION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TFMRegistroIVA.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.CondicionBusqueda := 'SIGNO = ''' + DMRegistroIVA.Signo + '''';
  G2kTableLoc.Click;
end;

procedure TFMRegistroIVA.DBCBAnuladoChange(Sender: TObject);
begin
  inherited;
  if (DBCBAnulado.Checked) then
     ColorError(DBCBAnulado)
  else
     ColorInfo(DBCBAnulado);
end;

end.
