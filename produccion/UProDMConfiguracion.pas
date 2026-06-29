unit UProDMConfiguracion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, Variants, Dialogs, Controls,
  jpeg, GIFImage, Graphics, ExtCtrls, Math;

type
  TProDMConfiguracion = class(TDataModule)
     TLocal: THYTransaction;
     QMConfiguracion: TFIBTableSet;
     DSConfiguracion: TDataSource;
     QMConfiguracionCONTADOR_SER_PROD: TIntegerField;
     QMConfiguracionID: TIntegerField;
     QMConfiguracionEMPRESA: TIntegerField;
     QMConfiguracionPREVALECE_ALM_ORDEN: TIntegerField;
     QMConfiguracionCERRAR_SUBORDENES: TIntegerField;
     QMConfiguracionACTIVAR_QUIMICAS: TIntegerField;
     QMConfiguracionQUIM_TIPOCONTROL: TIntegerField;
     QMConfiguracionQUIM_FILTRO_ARTICULO_FASES: TIntegerField;
     QMConfiguracionESC_GENERA_OF: TIntegerField;
     QMConfiguracionESC_MODIFICAR_COSTE: TIntegerField;
     QMConfiguracionESC_MATERIALES: TIntegerField;
     QMConfiguracionESC_AUTO_CALCULAR: TIntegerField;
     QMConfiguracionESC_RECURSOS: TIntegerField;
     QMConfiguracionQUIM_DENSIDAD: TIntegerField;
     QMConfiguracionESC_PORCENT: TIntegerField;
     QMConfiguracionESC_ACTIVO: TIntegerField;
     QMConfiguracionGEST_OFERTAS_ESC: TIntegerField;
     QMConfiguracionIMPORTAR_OP: TIntegerField;
     QMConfiguracionGEST_ESC_PORDEFECTO: TIntegerField;
     QMConfiguracionCASO_OP: TIntegerField;
     QMConfiguracionRESERVA_STOCK_OP: TIntegerField;
     QMConfiguracionGEST_FILTRO_ESC_PED: TIntegerField;
     QMConfiguracionESC_TRASPASAR_MEDIDAS_OF: TIntegerField;
     QMConfiguracionGEST_PRECIO_VENTA_PEDIDO: TIntegerField;
     QMConfiguracionGEST_OF_PED_PROV: TIntegerField;
     QMConfiguracionCOMPUESTOS_VIRTUALES: TIntegerField;
     QMConfiguracionOF_UDS_PENDIENTES: TIntegerField;
     QMConfiguracionGEST_PED_AUTO: TIntegerField;
     QMConfiguracionGEST_OF_CIERRA: TIntegerField;
     QMConfiguracionOF_NO_DTO_COMPRAS: TIntegerField;
     QMConfiguracionOF_MODIF_COMPRAS: TIntegerField;
     QMConfiguracionMARCAJE_TIPO: TIntegerField;
     QMConfiguracionOF_BORRADO_COMPRAS: TIntegerField;
     QMConfiguracionGEST_OFE_ESC: TIntegerField;
     QMConfiguracionZ_UN_PED_N_OP: TIntegerField;
     QMConfiguracionPRES_ULT_FEC_IMP: TDateTimeField;
     QMConfiguracionPRES_CONNECTIONSTRING_IMESD: TBlobField;
     QMConfiguracionOF_MOV_STOCK_CERRAR_OP: TIntegerField;
     QMConfiguracionOF_MOV_STOCK_CERRAR_COMPUESTO: TIntegerField;
     QMConfiguracionOF_MOV_STOCK_CERRAR_COMPONENTE: TIntegerField;
     QMConfiguracionOF_CREAR_LOTE_LANZAR_OP: TIntegerField;
     DSTipo_Precio: TDataSource;
     xTipoPrecio: TFIBDataSetRO;
     xTipoPrecioTIPO_PRECIO_BASE: TIntegerField;
     xTipoPrecioTITULO: TFIBStringField;
     QMConfiguracionESC_PRECIO_MAT: TIntegerField;
     QMConfiguracionOF_DATOS_CIERRE: TIntegerField;
     QMConfiguracionCONTADOR_CREACION_AUTO: TIntegerField;
     QMConfiguracionOF_CIERRE_PARCIAL_SECUENCIAL: TIntegerField;
     QMConfiguracionOF_USAR_PRECIO_LOTE: TIntegerField;
     QMConfiguracionOF_UN_FABRICADES_MOV_COMPONENTE: TIntegerField;
     QMConfiguracionGEST_OFE_TRABAJAR_ESC_OFE: TIntegerField;
     QMConfiguracionALMACEN_ENT: TFIBStringField;
     QMConfiguracionALMACEN_LAN: TFIBStringField;
     QMConfiguracionALMACEN_SAL: TFIBStringField;
     QMConfiguracionOF_CIERRE_PARCIAL_NO_MOV_COMPON: TIntegerField;
     QMConfiguracionALMACEN_RET: TFIBStringField;
     QMConfiguracionCANT_MIN_ALM_RET: TFloatField;
     QMConfiguracionALMACEN_REC: TFIBStringField;
     QMConfiguracionNO_EXCEDER_UNIDADES_RESERVADAS: TIntegerField;
     QMConfiguracionALM_PREPARACION_TE: TStringField;
     QMConfiguracionALM_TEX: TStringField;
     QMConfiguracionALM_ENTRADA_TEX: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMConfiguracionAfterOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProDMConfiguracion : TProDMConfiguracion;

implementation

uses UEntorno, UDMMain;

{$R *.dfm}

procedure TProDMConfiguracion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMConfiguracion, '10000');
end;

procedure TProDMConfiguracion.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TProDMConfiguracion.QMConfiguracionAfterOpen(DataSet: TDataSet);
begin
  xTipoPrecio.Open;
end;

end.
