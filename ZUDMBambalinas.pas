unit ZUDMBambalinas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, jpeg, GIFImage, Graphics;

type
  TZDMBambalinas = class(TDataModule)
     TLocal: THYTransaction;
     QMBambalinas: TFIBTableSet;
     DSQMBambalinas: TDataSource;
     QMBambalinasCODIGO: TFIBStringField;
     QMBambalinasDESCRIPCION: TFIBStringField;
     QMBambalinasIMAGEN: TIntegerField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZDMBambalinas : TZDMBambalinas;

implementation

uses UDMMain, ZUFMBambalinas;

{$R *.dfm}

procedure TZDMBambalinas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMBambalinas.Open;
end;

end.
