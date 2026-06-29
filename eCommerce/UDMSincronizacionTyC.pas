unit UDMSincronizacionTyC;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet;

type
  TDMSincronizacionTyC = class(TDataModule)
     QMCabecera: TFIBTableSet;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     DSQMCabecera: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraID: TFIBStringField;
     QMCabeceraREFERENCE: TFIBStringField;
     QMCabeceraDELIVERY_DATE: TDateTimeField;
     QMCabeceraCLIENTE: TIntegerField;
     QMCabeceraDIRECCION: TIntegerField;
     QMCabeceraTOTAL_AMOUNT: TFloatField;
     QMCabeceraMARGIN: TFloatField;
     QMCabeceraINSTALLATION_AMOUNT: TFloatField;
     QMCabeceraSHIPPING_AMOUNT: TFloatField;
     QMCabeceraSALES_BUDGET: TFloatField;
     QMCabeceraSALES_BUDGET_PLUS_TAXES: TFloatField;
     QMCabeceraOBSERVATIONS: TMemoField;
     QMCabeceraRAW_JSON: TMemoField;
     QMCabeceraDATE_ADD: TDateTimeField;
     QMCabeceraDATE_UPD: TDateTimeField;
     QMCabeceraID_S: TIntegerField;
     QMDetalleID: TFIBStringField;
     QMDetalleID_CAB: TFIBStringField;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleUNITS: TFloatField;
     QMDetalleRATE_BEFORE_DISCOUNT: TFloatField;
     QMDetalleDTO1: TFloatField;
     QMDetalleDTO2: TFloatField;
     QMDetalleDTO3: TFloatField;
     QMDetalleTOTAL: TFloatField;
     QMDetalleES_TOLDO: TIntegerField;
     QMDetalleACC_AUTO_LADO: TFIBStringField;
     QMDetalleACC_AUTO_LONG_MANIVELA: TFloatField;
     QMDetalleACC_AUTO_TIPO: TFIBStringField;
     QMDetalleACC_OP_BRAZOS_LUZ_LED: TIntegerField;
     QMDetalleACC_OP_ESCUADRA_A_TECHO: TIntegerField;
     QMDetalleACC_OP_ESCUADRA_A_TECHO_UDS: TFloatField;
     QMDetalleACC_OP_ESCUADRA_SOPORTE_A_TECHO: TIntegerField;
     QMDetalleACC_OP_JUEGO_SOPORTES_TECHO: TIntegerField;
     QMDetalleACC_OP_JUEGO_SOPORTES_TECHO_TIP: TFIBStringField;
     QMDetalleACC_OP_LASTRE_HORMIGO_MACETERO_: TIntegerField;
     QMDetalleACC_OP_LUZ_LED_BARRA_DE_CARGA: TIntegerField;
     QMDetalleACC_OP_LUZ_LED_PERFIL_COFRE: TIntegerField;
     QMDetalleACC_OP_MACETERO_GEMINI_POT: TIntegerField;
     QMDetalleACC_OP_PAREJA_PUNTALES_TELESCOP: TIntegerField;
     QMDetalleACC_OP_PL_AJ_SOPORTE_BRAZO: TIntegerField;
     QMDetalleACC_OP_PL_AJ_SOPORTE_BRAZO_UDS: TFloatField;
     QMDetalleACC_OP_PL_AJ_SOPORTE_CENTRAL: TIntegerField;
     QMDetalleACC_OP_PLACA_PATAS_FIJAS_MACETE: TIntegerField;
     QMDetalleACC_OP_RUEDA_GIRATORIA_MACETERO: TIntegerField;
     QMDetalleACC_OP_SOPORTE_ENTREPAREDES: TIntegerField;
     QMDetalleACC_OP_SOPORTE_ENTREPAREDES_UDS: TFloatField;
     QMDetalleACC_OP_SOPORTE_LARGO: TIntegerField;
     QMDetalleACC_OP_SOPORTE_LARGO_UDS: TFloatField;
     QMDetalleACC_OP_TEJADILLO: TIntegerField;
     QMDetalleACC_OP_TEJADILLO_JUEGO_TAPAS: TIntegerField;
     QMDetalleACC_OP_TEJADILLO_N_LAMAS: TFloatField;
     QMDetalleACC_OP_VIGAS_PIES_100_100: TIntegerField;
     QMDetalleCOLOR_ESTRUCTURA_COLOR: TFIBStringField;
     QMDetalleINSTALACION_TIPO: TFIBStringField;
     QMDetalleMEDIDAS_ALTURA_DELANTERA: TFloatField;
     QMDetalleMEDIDAS_ALTURA_PIES: TFloatField;
     QMDetalleMEDIDAS_ALTURA_PORTERIA: TFloatField;
     QMDetalleMEDIDAS_ALTURA_PORTERIA_2: TFloatField;
     QMDetalleMEDIDAS_ALTURA_TRASERA: TFloatField;
     QMDetalleMEDIDAS_CAIDA: TFloatField;
     QMDetalleMEDIDAS_LINEA: TFloatField;
     QMDetalleMEDIDAS_SALIDA: TFloatField;
     QMDetalleMEDIDAS_UDS: TFloatField;
     QMDetalleOP_ESTRUCTURA_DOBLE_TIRO: TIntegerField;
     QMDetalleOP_ESTRUCTURA_GUIA_120_120: TIntegerField;
     QMDetalleOP_ESTRUCTURA_GUIA_ADICIONAL: TIntegerField;
     QMDetalleOP_ESTRUCTURA_N_LATERALES: TFloatField;
     QMDetalleOP_ESTRUCTURA_PERIMETRAL: TIntegerField;
     QMDetalleOP_ESTRUCTURA_PILAR_AD_BASE: TIntegerField;
     QMDetalleOP_ESTRUCTURA_PILAR_AD_BASE_UDS: TFloatField;
     QMDetalleOP_ESTRUCTURA_POLEA_TIRO_CUERDA: TIntegerField;
     QMDetalleOP_ESTRUCTURA_SUPLEMENTO_TAPA: TIntegerField;
     QMDetalleOP_ESTRUCTURA_TEJ_MOD: TIntegerField;
     QMDetalleOP_ESTRUCTURA_TEJ_MOD_N_LAMAS: TFloatField;
     QMDetalleOP_ESTRUCTURA_TEJ_MO_SOPORTE: TIntegerField;
     QMDetalleOP_ESTRUCTURA_TEJ_MOD_TAPA: TIntegerField;
     QMDetalleOP_ESTRUCTURA_TEJAD_MOD_UDS: TFloatField;
     QMDetalleTEJIDO_ALTURA: TFloatField;
     QMDetalleTEJIDO_BAMBALINA: TFIBStringField;
     QMDetalleTEJIDO_LONA: TFIBStringField;
     QMDetalleTEJIDO_ONDA: TFIBStringField;
     QMDetalleTEJIDO_RIBETE: TFIBStringField;
     QMDetalleDATE_ADD: TDateTimeField;
     QMDetalleDATE_UPD: TDateTimeField;
     QMDetalleID_DETALLES_S: TIntegerField;
     QMDetalleID_DESPIECE_CAB: TIntegerField;
     QMDetalleCREATED: TIntegerField;
     QMDetalleMEDIDA_1: TFloatField;
     QMDetalleMEDIDA_2: TFloatField;
     QMDetalleMEDIDA_3: TFloatField;
     QMDetalleMEDIDA_4: TFloatField;
     QMDetalleCOLOR: TFIBStringField;
     QMDetalleCOLOCACION: TIntegerField;
     QMDetalleLONA: TFIBStringField;
     QMDetalleMONTAJE: TIntegerField;
     QMDetalleES_MOTOR: TIntegerField;
     QMDetalleMOTOR: TIntegerField;
     QMDetalleMANIVELA: TFIBStringField;
     QMDetalleTITULO_LARGO: TFIBStringField;
     QMDetalleCODIGO: TFIBStringField;
     QMDetalleDESCRIPCION: TFIBStringField;
     QMCabeceraTERCERO: TIntegerField;
     QMCabeceraNOMBRE_R_SOCIAL: TFIBStringField;
     QMCabeceraNOMBRE_COMERCIAL: TFIBStringField;
     QMCabeceraDIR_COMPLETA_N: TFIBStringField;
     QMCabeceraDOCUMENTO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMSincronizacionTyC : TDMSincronizacionTyC;

implementation

uses
  UDMMain, UEntorno, UUtiles;

{$R *.dfm}

procedure TDMSincronizacionTyC.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMCabecera, MascaraN, MascaraI, ShortDateFormat);
  QMCabeceraDATE_ADD.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMCabeceraDATE_UPD.DisplayFormat := ShortDateFormat + ' hh:nn';

  AsignaDisplayFormat(QMDetalle, MascaraN, MascaraI, ShortDateFormat);
  QMDetalleDATE_ADD.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMDetalleDATE_UPD.DisplayFormat := ShortDateFormat + ' hh:nn';

  DMMain.FiltraTabla(QMCabecera, '10000');
end;

procedure TDMSincronizacionTyC.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
end;

procedure TDMSincronizacionTyC.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
end;

end.
