unit UCrmDMOrigenRel;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TCrmDMOrigenRel = class(TDataModule)
     TLocal: THYTransaction;
     QMOrigRel: TFIBTableSet;
     DSQMOrigRel: TDataSource;
     QMOrigRelTORIGEN: TFIBStringField;
     QMOrigRelDESCRIPCION: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  CrmDMOrigenRel : TCrmDMOrigenRel;

implementation

uses UDMMain;

{$R *.dfm}

procedure TCrmDMOrigenRel.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMOrigRel.Open;
end;

end.
