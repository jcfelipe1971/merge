unit UCRMDMSeguimientos;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet;

type
  TCRMDMSeguimientos = class(TDataModule)
     QMSeguimientos: TFIBTableSet;
     TLocal: THYTransaction;
     DSQMSeguimientos: TDataSource;
     QMSeguimientosTSEGUIMIENTO: TFIBStringField;
     QMSeguimientosDESCRIPCION: TFIBStringField;
     TUpdate: THYTransaction;
     QMSeguimientosACTUALIZA_FECHA_ULT_VISITA: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  CRMDMSeguimientos : TCRMDMSeguimientos;

implementation

uses UDMMain;

{$R *.dfm}

procedure TCRMDMSeguimientos.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMSeguimientos.Open;
end;

end.
