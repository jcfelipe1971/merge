unit UDMCodigoIncoterm;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMCodigoIncoterm = class(TDataModule)
     DSQMCodigo: TDataSource;
     TLocal: THYTransaction;
     QMCodigo: TFIBTableSet;
     TUpdate: THYTransaction;
     QMCodigoGRUPO: TFIBStringField;
     QMCodigoCODIGO: TFIBStringField;
     QMCodigoTITULO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMCodigoIncoterm : TDMCodigoIncoterm;

implementation

uses UDMMain;

{$R *.dfm}

procedure TDMCodigoIncoterm.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMCodigo.Open;
end;

end.
