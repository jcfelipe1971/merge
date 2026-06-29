unit UDMUnidadesLogisitcas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMUnidadesLogisitcas = class(TDataModule)
     DSQMUnidadesLogisticas: TDataSource;
     TLocal: THYTransaction;
     QMUnidadesLogisticas: TFIBTableSet;
     TUpdate: THYTransaction;
     QMUnidadesLogisticasTIPO: TFIBStringField;
     QMUnidadesLogisticasTITULO: TFIBStringField;
     QMUnidadesLogisticasUNIDADES: TFloatField;
     QMUnidadesLogisticasRELACIONAR_CON_UNIDADES: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMUnidadesLogisticasNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMUnidadesLogisitcas : TDMUnidadesLogisitcas;

implementation

uses UDMMain;

{$R *.dfm}

procedure TDMUnidadesLogisitcas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMUnidadesLogisticas.Open;
end;

procedure TDMUnidadesLogisitcas.QMUnidadesLogisticasNewRecord(DataSet: TDataSet);
begin
  QMUnidadesLogisticasRELACIONAR_CON_UNIDADES.AsInteger := 0;
end;

end.
