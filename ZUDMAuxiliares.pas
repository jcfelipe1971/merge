unit ZUDMAuxiliares;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO;

type
  TZDMAuxiliares = class(TDataModule)
     TLocal: THYTransaction;
     QMAuxiliares: TFIBTableSet;
     DSQMAuxiliares: TDataSource;
     QMAuxiliaresTIPO_AUX: TFIBStringField;
     QMAuxiliaresCODIGO: TFIBStringField;
     QMAuxiliaresDESCRIPCION: TFIBStringField;
     xDescTipo: TFIBDataSetRO;
     DSxDescTipo: TDataSource;
     xDescTipoDESCRIPCION: TFIBStringField;
     TUpdate: THYTransaction;
     QMAuxiliaresIMAGEN: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMAuxiliaresNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BuscaTipo(Tipo: string);
  end;

var
  ZDMAuxiliares : TZDMAuxiliares;

implementation

uses UDMMain, ZUFMAuxiliares;

{$R *.dfm}

procedure TZDMAuxiliares.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMAuxiliares.Open;
end;

procedure TZDMAuxiliares.BuscaTipo(Tipo: string);
begin
  xDescTipo.Close;
  xDescTipo.Params.ByName['TIPO'].AsString := Tipo;
  xDescTipo.Open;

  QMAuxiliares.Close;
  QMAuxiliares.Params.ByName['TIPO'].AsString := Tipo;
  QMAuxiliares.Open;
end;

procedure TZDMAuxiliares.QMAuxiliaresNewRecord(DataSet: TDataSet);
begin
  QMAuxiliaresTIPO_AUX.AsString := ZFMAuxiliares.EFTipo.Text;
end;

end.
