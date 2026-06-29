unit UDMLstItbis;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet;

type
  TDMLstItbis = class(TDataModule)
     DSxmovItbis: TDataSource;
     xMovItbis: TFIBTableSet;
     xMovItbisEMPRESA: TIntegerField;
     xMovItbisEJERCICIO: TIntegerField;
     xMovItbisCANAL: TIntegerField;
     xMovItbisREGISTRO: TIntegerField;
     xMovItbisCOD_CLI_PRO: TIntegerField;
     xMovItbisVENCIMIENTO: TDateTimeField;
     xMovItbisLIQUIDO: TFloatField;
     xMovItbisDOC_NUMERO: TIntegerField;
     xMovItbisDOC_SERIE: TFIBStringField;
     xMovItbisDOC_FECHA: TDateTimeField;
     xMovItbisESTADO_RECIBO: TFIBStringField;
     xMovItbisRECIBIDO: TIntegerField;
     xMovItbisDOCUMENTO: TFIBStringField;
     xMovItbisCAMBIO: TFloatField;
     xMovItbisID_CARTERA: TIntegerField;
     xMovItbisID_CARTERA_DETALLE: TIntegerField;
     xMovItbisID_DOC: TIntegerField;
     xMovItbisRETENCION: TIntegerField;
     xMovItbisTIPO_RETENCION: TIntegerField;
     xMovItbisNUM_FACTURA: TFIBStringField;
     xMovItbisNUM_FACTURA1: TFIBStringField;
     xMovItbisIMPORTE_RETENCION: TFloatField;
     xMovItbisIMPORTE_ISR: TFloatField;
     xMovItbisDOC_FECHA1: TDateTimeField;
     xMovItbisCUENTA_ITBIS: TFIBStringField;
     xMovItbisCUENTA_ISR: TFIBStringField;
     xMovItbisRESTO: TFloatField;
     xMovItbisTIPO_NCF: TIntegerField;
     xMovItbisTERCERO: TIntegerField;
     xMovItbisNOMBRE_COMERCIAL: TFIBStringField;
     xMovItbisNIF: TFIBStringField;
     xMovItbisTELEFONO01: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMLstItbis : TDMLstItbis;

implementation

{$R *.dfm}

procedure TDMLstItbis.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

end.
