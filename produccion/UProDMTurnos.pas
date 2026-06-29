unit UProDMTurnos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, HYFIBQuery;

type
  TProDMTurnos = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMTurno: TFIBTableSet;
     DSQMTurno: TDataSource;
     QMTurnoEMPRESA: TIntegerField;
     QMTurnoTURNO: TFIBStringField;
     QMTurnoDESCRIPCION: TFIBStringField;
     QMTurnoORDEN: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMTurnoNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  ProDMTurnos : TProDMTurnos;

implementation

uses UDMMain, UEntorno, UUtiles, uFBusca;

{$R *.dfm}

procedure TProDMTurnos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMTurno, '10000', True);
end;

procedure TProDMTurnos.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTurno, '10000');
end;

procedure TProDMTurnos.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TProDMTurnos.QMTurnoNewRecord(DataSet: TDataSet);
begin
  QMTurnoEMPRESA.AsInteger := REntorno.Empresa;
end;

end.
