unit UDMPostizos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMPostizos = class(TDataModule)
     TLocal: THYTransaction;
     QMPostizos: TFIBTableSet;
     DSQMPostizos: TDataSource;
     QMPostizosEMPRESA: TIntegerField;
     QMPostizosNUM_POSTIZO: TIntegerField;
     QMPostizosDESCRIPCION: TFIBStringField;
     QMPostizosID_UBICACION: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMPostizosNewRecord(DataSet: TDataSet);
     procedure QMPostizosBeforePost(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMPostizos : TDMPostizos;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMPostizos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction; //Sempre hem d'obrir transaccio

  DMMain.FiltraTabla(QMPostizos, '10000');   //Per obrir la taula amb una consulta filtrant per Empresa
end;

procedure TDMPostizos.QMPostizosNewRecord(DataSet: TDataSet);
begin
  QMPostizosEMPRESA.AsInteger := REntorno.Empresa;
end;

procedure TDMPostizos.QMPostizosBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     QMPostizosNUM_POSTIZO.AsInteger := DMMain.Contador_E('ZPO');
end;

procedure TDMPostizos.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

end.
