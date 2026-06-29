unit UDMGeneroTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMGeneroTallas = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMGeneroTallas: TFIBTableSet;
     DSQMGeneroTallas: TDataSource;
     QMGeneroTallasCODIGO: TFIBStringField;
     QMGeneroTallasTITULO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMGeneroTallas : TDMGeneroTallas;

implementation

uses
  UDMMain;

{$R *.dfm}

procedure TDMGeneroTallas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  DMMain.FiltraTabla(QMGeneroTallas, '00000', True);
end;

end.
