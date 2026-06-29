unit UProDMRelacionUds;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TProDMRelacionUds = class(TDataModule)
     QMRelacionUds: TFIBTableSet;
     QMRelacionUdsUNIDAD: TFIBStringField;
     QMRelacionUdsUNIDAD_DEST: TFIBStringField;
     QMRelacionUdsCANTIDAD_DEST: TFloatField;
     QMRelacionUdsCANTIDAD_ORIG: TIntegerField;
     DSRelacionUds: TDataSource;
     TLocal: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMRelacionUdsNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProDMRelacionUds : TProDMRelacionUds;

implementation

uses UDMMain;

{$R *.dfm}

procedure TProDMRelacionUds.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMRelacionUds.Open;
end;

procedure TProDMRelacionUds.QMRelacionUdsNewRecord(DataSet: TDataSet);
begin
  QMRelacionUdsCANTIDAD_ORIG.AsInteger := 1;
end;

procedure TProDMRelacionUds.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

end.
