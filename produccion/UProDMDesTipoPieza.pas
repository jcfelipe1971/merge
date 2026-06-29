unit UProDMDesTipoPieza;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet;

type
  TProDMDesTipoPieza = class(TDataModule)
     QMTipoPieza: TFIBTableSet;
     TLocal: THYTransaction;
     DSTipoPieza: TDataSource;
     QMTipoPiezaDESCRIPCION: TFIBStringField;
     QMTipoPiezaFORMULA_CALC_ALTURA: TFIBStringField;
     QMTipoPiezaFORMULA_CALC_ANCHURA: TFIBStringField;
     QMTipoPiezaFORMULA_CALC_PROF: TFIBStringField;
     QMTipoPiezaFORMULA_CALC_GRUESO: TFIBStringField;
     QMTipoPiezaCODIGO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  ProDMDesTipoPieza : TProDMDesTipoPieza;

implementation

uses UDMMain, UFBusca;

{$R *.dfm}

procedure TProDMDesTipoPieza.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMTipoPieza.Open;
end;

procedure TProDMDesTipoPieza.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TProDMDesTipoPieza.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTipoPieza, '00000');
end;

end.
