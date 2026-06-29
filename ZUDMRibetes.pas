unit ZUDMRibetes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, jpeg, GIFImage, Graphics;

type
  TZDMRibetes = class(TDataModule)
     TLocal: THYTransaction;
     QMRibetes: TFIBTableSet;
     DSQMRibetes: TDataSource;
     QMRibetesCODIGO: TFIBStringField;
     QMRibetesDESCRIPCION: TFIBStringField;
     QMRibetesIMAGEN: TIntegerField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZDMRibetes : TZDMRibetes;

implementation

uses UDMMain;

{$R *.dfm}

procedure TZDMRibetes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMRibetes.Open;
end;

end.
