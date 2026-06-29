unit UDMIntroduccionOperario;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMIntroduccionOperario = class(TDataModule)
     DSQMCabecera: TDataSource;
     QMCabecera: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMCabeceraID: TIntegerField;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraHOJA: TIntegerField;
     QMCabeceraCLIENTE: TIntegerField;
     QMCabeceraNOMBRE_R_SOCIAL: TFIBStringField;
     QMCabeceraRESPONSABLE: TIntegerField;
     QMCabeceraTITUTLO_RESPONSABLE: TFIBStringField;
     QMCabeceraFECHA_INICIO: TDateTimeField;
     QMCabeceraFECHA_FIN: TDateTimeField;
     QMCabeceraCOMENTARIO: TFIBStringField;
     QMCabeceraTOTAL_UNIDADES: TFloatField;
     QMCabeceraTOTAL_UNIDADES_LOGISTICAS: TFloatField;
     QMCabeceraDIRECCION: TIntegerField;
     QMCabeceraDIR_COMPLETA_N: TFIBStringField;
     QMCabeceraID_EMPLEADO: TIntegerField;
     QMCabeceraESTADO: TIntegerField;
     QMCabeceraGENERAR_ALBARAN: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMIntroduccionOperario : TDMIntroduccionOperario;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMIntroduccionOperario.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

end.
