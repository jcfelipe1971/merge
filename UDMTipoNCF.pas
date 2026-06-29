unit UDMTipoNCF;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMTipoNCF = class(TDataModule)
     TUpdate: THYTransaction;
     TLocal: THYTransaction;
     QMTipoNCF: TFIBTableSet;
     QMTipoNCFTIPO_NCF: TIntegerField;
     QMTipoNCFTITULO: TFIBStringField;
     DSQMTipoNCF: TDataSource;
     QMTipoNCFTIPO_DOCUMENTO: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMTipoNCF : TDMTipoNCF;

implementation

{$R *.dfm}

procedure TDMTipoNCF.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMTipoNCF.Open;
end;

end.
