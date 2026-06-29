unit ZUDMLonasForma;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, jpeg, GIFImage, Graphics;

type
  TZDMLonasForma = class(TDataModule)
     TLocal: THYTransaction;
     QMLonasForma: TFIBTableSet;
     QMLonasFormaDESCRIPCION: TFIBStringField;
     QMLonasFormaIMAGEN: TIntegerField;
     DSQMLonasForma: TDataSource;
     QMLonasFormaCODIGO: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZDMLonasForma : TZDMLonasForma;

implementation

uses UDMMain;

{$R *.dfm}

procedure TZDMLonasForma.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMLonasForma.Open;
end;

end.
