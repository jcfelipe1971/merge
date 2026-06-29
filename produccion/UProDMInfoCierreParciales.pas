unit UProDMInfoCierreParciales;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBDataSetRO;

type
  TProDMInfoCierresParciales = class(TDataModule)
     QCierresParciales: TFIBDataSetRO;
     QCierresParcialesEMPRESA: TIntegerField;
     QCierresParcialesEJERCICIO: TIntegerField;
     QCierresParcialesCANAL: TIntegerField;
     QCierresParcialesSERIE: TFIBStringField;
     QCierresParcialesCIERRE: TIntegerField;
     QCierresParcialesFECHA_CREACION: TDateTimeField;
     QCierresParcialesESTADO: TIntegerField;
     QCierresParcialesCOMENTARIO: TFIBStringField;
     QCierresParcialesID: TIntegerField;
     QCierresParcialesENTRADA: TIntegerField;
     DSQCierresParciales: TDataSource;
     TLocal: THYTransaction;
     QCierresParcialesARTICULO: TFIBStringField;
     QCierresParcialesALM_DEST: TFIBStringField;
     QCierresParcialesID_LOTE: TIntegerField;
     QCierresParcialesUNIDADES: TFloatField;
     QCierresParcialesLOTE: TFIBStringField;
     QCierresParcialesUDS_CIERRE: TFloatField;
     QCierresParcialesID_RESERVA: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     IdOrden: integer;
  public
     { Public declarations }
     procedure AbrirCierres(aIdOrden: integer);
     procedure Refrescar;
  end;

var
  ProDMInfoCierresParciales : TProDMInfoCierresParciales;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TProDMInfoCierresParciales.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QCierresParcialesUNIDADES.DisplayFormat := MascaraN;
  QCierresParcialesUDS_CIERRE.DisplayFormat := MascaraN;
end;

procedure TProDMInfoCierresParciales.AbrirCierres(aIdOrden: integer);
begin
  IdOrden := aIdOrden;
  Refrescar;
end;

procedure TProDMInfoCierresParciales.Refrescar;
begin
  with QCierresParciales do
  begin
     Close;
     Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
     Open;
  end;
end;

end.
