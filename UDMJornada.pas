unit UDMJornada;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMJornada = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMJornada: TFIBTableSet;
     DSQMJornada: TDataSource;
     QMJornadaCODIGO: TIntegerField;
     QMJornadaDESCRIPCION: TFIBStringField;
     QMTipoJornada: TFIBTableSet;
     IntegerField1: TIntegerField;
     FIBStringField1: TFIBStringField;
     DSQMTipoJornada: TDataSource;
     QMAreas: TFIBTableSet;
     IntegerField2: TIntegerField;
     FIBStringField2: TFIBStringField;
     DSQMAreas: TDataSource;
     QMCCostos: TFIBTableSet;
     IntegerField3: TIntegerField;
     FIBStringField3: TFIBStringField;
     DSQMCCostos: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMJornada : TDMJornada;

implementation

uses
  UDMMain, Variants, UUtiles, UEntorno, HYFIBQuery, UFMain, FIBQuery;

{$R *.dfm}

procedure TDMJornada.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not (TLocal.InTransaction) then
     TLocal.StartTransaction;

  QMJornada.Open;
  QMTipoJornada.Open;
  QMAreas.Open;
  QMCCostos.Open;
end;

procedure TDMJornada.DataModuleDestroy(Sender: TObject);
begin
  QMJornada.Close;
  QMTipoJornada.Close;
  QMAreas.Close;
  QMCCostos.Close;
end;

end.
