unit UDMTemporadaTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMTemporadaTallas = class(TDataModule)
     DSQMTemporadaTallas: TDataSource;
     QMTemporadaTallas: TFIBTableSet;
     TUpdate: THYTransaction;
     TLocal: THYTransaction;
     QMTemporadaTallasCODIGO: TFIBStringField;
     QMTemporadaTallasTITULO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMTemporadaTallas : TDMTemporadaTallas;

implementation

uses
  UDMMain;

{$R *.dfm}

procedure TDMTemporadaTallas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMTemporadaTallas, '00000', True);
end;

end.
