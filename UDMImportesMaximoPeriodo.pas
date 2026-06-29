unit UDMImportesMaximoPeriodo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet;

type
  TDMImportesMaximoPeriodo = class(TDataModule)
     QMPeriodos: TFIBTableSet;
     QMPeriodosEMPRESA: TIntegerField;
     QMPeriodosEJERCICIO: TIntegerField;
     QMPeriodosPERIODO: TFIBStringField;
     DSQMPeriodos: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMPeriodosIMPORTE_MAXIMO_PEDIDOS: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMPeriodosNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMImportesMaximoPeriodo : TDMImportesMaximoPeriodo;

implementation

uses
  UDMMain, UEntorno;

{$R *.dfm}

procedure TDMImportesMaximoPeriodo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMPeriodosIMPORTE_MAXIMO_PEDIDOS.DisplayFormat := MascaraN;

  DMMain.FiltraTabla(QMPeriodos, '11000', True);
end;

procedure TDMImportesMaximoPeriodo.QMPeriodosNewRecord(DataSet: TDataSet);
begin
  QMPeriodosEMPRESA.AsInteger := REntorno.Empresa;
  QMPeriodosEJERCICIO.AsInteger := REntorno.Ejercicio;
end;

end.
