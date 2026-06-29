unit UDMCalles;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, DBTables, FIBDatabase, FIBDataSet,
  FIBTableDataSet, FIBQuery, UFIBModificados;

type
  TDMCalles = class(TDataModule)
     QMCalles: TFIBTableSet;
     DSQMCalles: TDataSource;
     TLocal: THYTransaction;
     QMCallesCALLE: TFIBStringField;
     QMCallesDESCRIPCION: TFIBStringField;
     QMCallesEMPRESA: TIntegerField;
     TUpdate: THYTransaction;
     procedure DMCanalesCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMCallesNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     procedure BusquedaCompleja;
     { Public declarations }
  end;

var
  DMCalles : TDMCalles;

implementation

uses UDMMain, UUtiles, UEntorno, UFBusca;

{$R *.DFM}

procedure TDMCalles.DMCanalesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  with QMCalles do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

procedure TDMCalles.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMCalles.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCalles, '10000');
end;

procedure TDMCalles.QMCallesNewRecord(DataSet: TDataSet);
begin
  QMCallesEMPRESA.AsInteger := REntorno.Empresa;
end;

end.
