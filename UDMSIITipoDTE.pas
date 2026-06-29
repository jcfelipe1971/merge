unit UDMSIITipoDTE;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet;

type
  TDMSIITipoDTE = class(TDataModule)
     QTipoDTE: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSQTipoDTE: TDataSource;
     QTipoDTECODIGO: TFIBStringField;
     QTipoDTETITULO: TFIBStringField;
     QTipoDTEVISIBLE_ALB: TIntegerField;
     QTipoDTEVISIBLE_FAC: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMSIITipoDTE : TDMSIITipoDTE;

implementation

uses
  UDMMain;

{$R *.dfm}

procedure TDMSIITipoDTE.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QTipoDTE.Open;
end;

end.
