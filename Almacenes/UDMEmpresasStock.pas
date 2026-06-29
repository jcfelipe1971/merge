unit UDMEmpresasStock;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMEmpresasStock = class(TDataModule)
     TLocal: THYTransaction;
     QMEmpresas: TFIBTableSet;
     QMDSEmpresas: TDataSource;
     QMEmpresasEMPRESA: TIntegerField;
     QMEmpresasCANAL: TIntegerField;
     QMEmpresasALMACEN: TFIBStringField;
     QMEmpresasEMPRESA_D: TIntegerField;
     QMEmpresasCANAL_D: TIntegerField;
     QMEmpresasALMACEN_D: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMEmpresasBeforeEdit(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMEmpresasStock : TDMEmpresasStock;

implementation

uses UDMMain;

{$R *.dfm}

procedure TDMEmpresasStock.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMEmpresas);
end;

procedure TDMEmpresasStock.QMEmpresasBeforeEdit(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

end.
