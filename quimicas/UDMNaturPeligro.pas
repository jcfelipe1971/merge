unit UDMNaturPeligro;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMNaturPeligro = class(TDataModule)
     TLocal: THYTransaction;
     DSQMNaturPeligro: TDataSource;
     QMNaturPeligro: TFIBTableSet;
     QMNaturPeligroCOD_NATURALEZA_PELIGRO: TIntegerField;
     QMNaturPeligroTEXTO: TBlobField;
     QMNaturPeligroDESCRIPCION_CORTA: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMNaturPeligroBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMNaturPeligro : TDMNaturPeligro;

implementation

uses UDMMain;

{$R *.dfm}

procedure TDMNaturPeligro.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMNaturPeligro.Open;
end;

procedure TDMNaturPeligro.QMNaturPeligroBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'CONTA_NATUR_PELIGRO', 'Cod_naturaleza_peligro');
end;

end.
