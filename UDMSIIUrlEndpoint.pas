unit UDMSIIUrlEndpoint;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMSIIUrlEndpoint = class(TDataModule)
     QMURLEndPoint: TFIBTableSet;
     DSQMURLEndPoint: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMURLEndPointTIPO: TFIBStringField;
     QMURLEndPointURL: TFIBStringField;
     QMURLEndPointPAIS: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMURLEndPointNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMSIIUrlEndpoint : TDMSIIUrlEndpoint;

implementation

uses
  UDMMain, UEntorno;

{$R *.dfm}

procedure TDMSIIUrlEndpoint.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMURLEndPoint, '000010', True);
end;

procedure TDMSIIUrlEndpoint.QMURLEndPointNewRecord(DataSet: TDataSet);
begin
  QMURLEndPointPAIS.AsString := REntorno.Pais;
end;

end.
