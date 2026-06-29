unit UDMRepisas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, DBTables, FIBDatabase, FIBDataSet,
  FIBTableDataSet, FIBQuery, UFIBModificados;

type
  TDMRepisas = class(TDataModule)
     QMRepisas: TFIBTableSet;
     DSQMRepisas: TDataSource;
     TLocal: THYTransaction;
     QMRepisasREPISA: TFIBStringField;
     QMRepisasDESCRIPCION: TFIBStringField;
     QMRepisasEMPRESA: TIntegerField;
     TUpdate: THYTransaction;
     procedure DMCanalesCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMRepisasNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     procedure BusquedaCompleja;
     { Public declarations }
  end;

var
  DMRepisas : TDMRepisas;

implementation

uses UDMMain, UUtiles, UEntorno, UFBusca;

{$R *.DFM}

procedure TDMRepisas.DMCanalesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  with QMRepisas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

procedure TDMRepisas.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMRepisas.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMRepisas, '10000');
end;

procedure TDMRepisas.QMRepisasNewRecord(DataSet: TDataSet);
begin
  QMRepisasEMPRESA.AsInteger := REntorno.Empresa;
end;

end.
