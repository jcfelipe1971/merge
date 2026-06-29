unit UDMCanales;

interface

uses
  Windows, Classes, Forms, DB, DBTables, FIBDatabase, FIBDataSet,
  FIBTableDataSet, FIBQuery, UFIBModificados;

type
  TDMCanales = class(TDataModule)
     QMCanales: TFIBTableSet;
     DSQMCanales: TDataSource;
     QMCanalesCANAL: TIntegerField;
     QMCanalesTITULO: TFIBStringField;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     procedure DMCanalesCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMCanalesBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     procedure BusquedaCompleja;
     { Public declarations }
  end;

var
  DMCanales : TDMCanales;

implementation

uses UDMMain, UUtiles, UEntorno, UFBusca;

{$R *.DFM}

procedure TDMCanales.DMCanalesCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMCanales.Open;
end;

procedure TDMCanales.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMCanales.QMCanalesBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'Conta_Canales', 'Canal');
end;

procedure TDMCanales.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCanales, '00000');
end;

end.
