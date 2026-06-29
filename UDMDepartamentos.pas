unit UDMDepartamentos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMDepartamentos = class(TDataModule)
     DSQMDepartamentos: TDataSource;
     TLocal: THYTransaction;
     QMDepartamentos: TFIBTableSet;
     TUpdate: THYTransaction;
     QMDepartamentosDEPARTAMENTO: TFIBStringField;
     QMDepartamentosTITULO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMDepartamentos : TDMDepartamentos;

implementation

{$R *.dfm}

procedure TDMDepartamentos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMDepartamentos.Open;
end;

procedure TDMDepartamentos.DataModuleDestroy(Sender: TObject);
begin
  QMDepartamentos.Close;
  TLocal.Commit;
end;

end.
