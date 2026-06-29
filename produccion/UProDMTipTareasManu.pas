unit UProDMTipTareasManu;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet;

type
  TProDMTipTareasManu = class(TDataModule)
     QMProTipTareasManu: TFIBTableSet;
     TLocal: THYTransaction;
     DSQMProTipTareasManu: TDataSource;
     QMProTipTareasManuID_TIPO_TAREA_MANU: TFIBStringField;
     QMProTipTareasManuTITULO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProDMTipTareasManu : TProDMTipTareasManu;

implementation

uses uFBusca, UDMMain, UEntorno;

{$R *.dfm}

procedure TProDMTipTareasManu.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMProTipTareasManu.Open;
end;

procedure TProDMTipTareasManu.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

end.
