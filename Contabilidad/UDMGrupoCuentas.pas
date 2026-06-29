unit UDMGrupoCuentas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMGrupoCuentas = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSQMGrupoCuentas: TDataSource;
     QMGrupoCuentas: TFIBTableSet;
     QMGrupoCuentasEMPRESA: TIntegerField;
     QMGrupoCuentasEJERCICIO: TIntegerField;
     QMGrupoCuentasCANAL: TIntegerField;
     QMGrupoCuentasGRUPO_CUENTAS: TIntegerField;
     QMGrupoCuentasPGC: TIntegerField;
     QMGrupoCuentasCTA_COMPRAS: TFIBStringField;
     QMGrupoCuentasCTA_DEV_COMPRAS: TFIBStringField;
     QMGrupoCuentasCTA_ABONO_COMPRAS: TFIBStringField;
     QMGrupoCuentasCTA_VENTAS: TFIBStringField;
     QMGrupoCuentasCTA_DEV_VENTAS: TFIBStringField;
     QMGrupoCuentasCTA_ABONO_VENTAS: TFIBStringField;
     QMGrupoCuentasTITULO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMGrupoCuentasNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMGrupoCuentasBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMGrupoCuentas : TDMGrupoCuentas;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMGrupoCuentas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMGrupoCuentas, '111001');
end;

procedure TDMGrupoCuentas.QMGrupoCuentasNewRecord(DataSet: TDataSet);
begin
  with DataSet do
  begin
     FieldByName('EMPRESA').AsInteger := REntorno.Empresa;
     FieldByName('EJERCICIO').AsInteger := REntorno.Ejercicio;
     FieldByName('CANAL').AsInteger := REntorno.Canal;
     FieldByName('PGC').AsInteger := REntorno.Pgc;
  end;
end;

procedure TDMGrupoCuentas.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMGrupoCuentas.QMGrupoCuentasBeforePost(DataSet: TDataSet);
begin
  if ((DataSet.State = dsInsert) and (QMGrupoCuentasGRUPO_CUENTAS.AsInteger = 0)) then
     QMGrupoCuentasGRUPO_CUENTAS.AsInteger := DMMain.Contador_EEC('GRC');
end;

end.
