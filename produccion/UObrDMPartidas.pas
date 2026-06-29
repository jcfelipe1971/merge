unit UObrDMPartidas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, DB, FIBDataSet, FIBTableDataSet;

type
  TObrDMPartidas = class(TDataModule)
     TLocal: TFIBTransaction;
     DSObrPartidas: TDataSource;
     QMObrPartidas: TFIBTableSet;
     QMObrPartidasPARTIDA: TFIBStringField;
     QMObrPartidasDESCRIPCION: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ObrDMPartidas : TObrDMPartidas;

implementation

uses UDMMain;

{$R *.dfm}

procedure TObrDMPartidas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMObrPartidas.Open;
end;

procedure TObrDMPartidas.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

end.
