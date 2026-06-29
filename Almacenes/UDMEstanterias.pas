unit UDMEstanterias;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, DBTables, FIBDatabase, FIBDataSet,
  FIBTableDataSet, FIBQuery, UFIBModificados;

type
  TDMEstanterias = class(TDataModule)
     QMEstanterias: TFIBTableSet;
     DSQMEstanterias: TDataSource;
     TLocal: THYTransaction;
     QMEstanteriasESTANTERIA: TFIBStringField;
     QMEstanteriasDESCRIPCION: TFIBStringField;
     QMEstanteriasEMPRESA: TIntegerField;
     TUpdate: THYTransaction;
     procedure DMCanalesCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMEstanteriasNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     procedure BusquedaCompleja;
     { Public declarations }
  end;

var
  DMEstanterias : TDMEstanterias;

implementation

uses UDMMain, UUtiles, UEntorno, UFBusca;

{$R *.DFM}

procedure TDMEstanterias.DMCanalesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  with QMEstanterias do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

procedure TDMEstanterias.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMEstanterias.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMEstanterias, '10000');
end;

procedure TDMEstanterias.QMEstanteriasNewRecord(DataSet: TDataSet);
begin
  QMEstanteriasEMPRESA.AsInteger := REntorno.Empresa;
end;

end.
