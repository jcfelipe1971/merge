unit UDMGasConstantes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, Variants, Dialogs, Controls;

type
  TDMGasConstantes = class(TDataModule)
     TLocal: THYTransaction;
     QMGasConstantes: TFIBTableSet;
     DSGasConstantes: TDataSource;
     QMGasConstantesID: TIntegerField;
     QMGasConstantesEMPRESA: TIntegerField;
     QMGasConstantesARTICULO: TFIBStringField;
     DSGasCuentaSeries: TDataSource;
     QMGasCuentaSeries: TFIBTableSet;
     QMGasCuentaSeriesID: TIntegerField;
     QMGasCuentaSeriesEMPRESA: TIntegerField;
     QMGasCuentaSeriesCUENTA_VENTA: TFIBStringField;
     QMGasCuentaSeriesCUENTA_CAJA: TFIBStringField;
     QMGasCuentaSeriesCUENTA_FALTANTE: TFIBStringField;
     QMGasCuentaSeriesSERIE: TFIBStringField;
     QMGasCuentaSeriesCUENTA_SOBRANTE: TFIBStringField;
     TUpdate: THYTransaction;
     QMGasCuentaSeriesEJERCICIO: TIntegerField;
     QMGasCuentaSeriesCANAL: TIntegerField;
     QMGasCuentaSeriesCUENTA_DISTRIBUCION: TFIBStringField;
     QMGasCuentaSeriesCUENTA_COSTO_SUCURSAL: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMGasConstantesNewRecord(DataSet: TDataSet);
     procedure QMGasCuentaSeriesNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMGasConstantes : TDMGasConstantes;

implementation

uses UEntorno, UDMMain;

{$R *.dfm}

procedure TDMGasConstantes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMGasConstantes, '10000');
  DMMain.FiltraTabla(QMGasCuentaSeries, '11100');
end;

procedure TDMGasConstantes.QMGasConstantesNewRecord(DataSet: TDataSet);
begin
  QMGasConstantesEMPRESA.AsInteger := REntorno.Empresa;
end;

procedure TDMGasConstantes.QMGasCuentaSeriesNewRecord(DataSet: TDataSet);
begin
  QMGasCuentaSeriesEMPRESA.AsInteger := REntorno.Empresa;
  QMGasCuentaSeriesEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMGasCuentaSeriesCANAL.AsInteger := REntorno.Canal;
end;

end.
