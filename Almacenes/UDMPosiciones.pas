unit UDMPosiciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, DBTables, FIBDatabase, FIBDataSet,
  FIBTableDataSet, FIBQuery, UFIBModificados;

type
  TDMPosiciones = class(TDataModule)
     QMPosiciones: TFIBTableSet;
     DSQMPosiciones: TDataSource;
     TLocal: THYTransaction;
     QMPosicionesPOSICION: TFIBStringField;
     QMPosicionesDESCRIPCION: TFIBStringField;
     QMPosicionesEMPRESA: TIntegerField;
     TUpdate: THYTransaction;
     procedure DMCanalesCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMPosicionesNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     procedure BusquedaCompleja;
     { Public declarations }
  end;

var
  DMPosiciones : TDMPosiciones;

implementation

uses UDMMain, UUtiles, UEntorno, UFBusca;

{$R *.DFM}

procedure TDMPosiciones.DMCanalesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  with QMPosiciones do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

procedure TDMPosiciones.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMPosiciones.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMPosiciones, '10000');
end;

procedure TDMPosiciones.QMPosicionesNewRecord(DataSet: TDataSet);
begin
  QMPosicionesEMPRESA.AsInteger := REntorno.Empresa;
end;

end.
