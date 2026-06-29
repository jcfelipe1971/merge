unit UDMFormasPagoTpv;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMFormasPagoTpv = class(TDataModule)
     TLocal: THYTransaction;
     QMFormasPagoTpv: TFIBTableSet;
     QMFormasPagoTpvEMPRESA: TIntegerField;
     QMFormasPagoTpvEJERCICIO: TIntegerField;
     QMFormasPagoTpvCANAL: TIntegerField;
     QMFormasPagoTpvSERIE: TFIBStringField;
     QMFormasPagoTpvFORMA_PAGO: TFIBStringField;
     QMFormasPagoTpvCUENTA_PAGO: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMFormasPagoTpvNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMFormasPagoTpv : TDMFormasPagoTpv;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMFormasPagoTpv.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  DMMain.FiltraTABLA(QMFormasPagoTpv, '11110', True);
end;

procedure TDMFormasPagoTpv.QMFormasPagoTpvNewRecord(DataSet: TDataSet);
begin
  QMFormasPagoTpv['EMPRESA'] := REntorno.Empresa;
  QMFormasPagoTpv['EJERCICIO'] := REntorno.Ejercicio;
  QMFormasPagoTpv['CANAL'] := REntorno.Canal;
  QMFormasPagoTpv['SERIE'] := REntorno.Serie;
end;

end.
