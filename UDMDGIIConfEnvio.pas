unit UDMDGIIConfEnvio;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMDGIIConfEnvio = class(TDataModule)
     DSQMDgiiConfiguracion: TDataSource;
     QMDgiiConfiguracion: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMDgiiConfiguracionEMPRESA: TIntegerField;
     QMDgiiConfiguracionTOKEN: TFIBStringField;
     QMDgiiConfiguracionURL_BASE: TFIBStringField;
     QMDgiiConfiguracionID_COMPANY: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMDgiiConfiguracionNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMDGIIConfEnvio : TDMDGIIConfEnvio;

implementation

uses
  UDMMain, UEntorno;

{$R *.dfm}

procedure TDMDGIIConfEnvio.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMDgiiConfiguracion, '10000', True);
end;

procedure TDMDGIIConfEnvio.QMDgiiConfiguracionNewRecord(DataSet: TDataSet);
begin
  QMDgiiConfiguracionEMPRESA.AsInteger := REntorno.Empresa;
end;

end.
