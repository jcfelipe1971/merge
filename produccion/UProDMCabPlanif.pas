unit UProDMCabPlanif;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet;

type
  TProDMCabPlanif = class(TDataModule)
     QMProCabPlanif: TFIBTableSet;
     TLocal: THYTransaction;
     DSQMProCabPlanif: TDataSource;
     QMProCabPlanifID_PLANIF: TIntegerField;
     QMProCabPlanifTITULO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMProCabPlanifBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  ProDMCabPlanif : TProDMCabPlanif;

implementation

uses UDMMain, UEntorno, uFBusca;

{$R *.dfm}

procedure TProDMCabPlanif.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMProCabPlanif, '00000');
end;

procedure TProDMCabPlanif.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TProDMCabPlanif.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TProDMCabPlanif.QMProCabPlanifBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'Pro_Planif', 'ID_Planif');
end;

end.
