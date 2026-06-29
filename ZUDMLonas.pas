unit ZUDMLonas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, jpeg, GIFImage, Graphics;

type
  TZDMLonas = class(TDataModule)
     TLocal: THYTransaction;
     QMLonas: TFIBTableSet;
     QMLonasCODIGO: TFIBStringField;
     QMLonasDESCRIPCION: TFIBStringField;
     QMLonasIMAGEN: TIntegerField;
     DSQMLonas: TDataSource;
     QMLonasMULTIPLO: TIntegerField;
     QMLonasMULTIPLO_SALIDA: TIntegerField;
     QMLonasTIPO: TIntegerField;
     QMLonaTareas: TFIBTableSet;
     DSLonaTareas: TDataSource;
     QMLonaTareasEMPRESA: TIntegerField;
     QMLonaTareasCODIGO_LONA: TFIBStringField;
     QMLonaTareasTAREA: TFIBStringField;
     QMLonaTareasSECCION: TFIBStringField;
     QMLonaTareasORDEN: TIntegerField;
     QMLonaTareasRECURSO: TFIBStringField;
     QMLonasSECCION: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMLonaTareasNewRecord(DataSet: TDataSet);
     procedure QMLonasNewRecord(DataSet: TDataSet);
     procedure QMLonasAfterOpen(DataSet: TDataSet);
     procedure QMLonasBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZDMLonas : TZDMLonas;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TZDMLonas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMLonas.Open;
end;

procedure TZDMLonas.QMLonaTareasNewRecord(DataSet: TDataSet);
begin
  QMLonaTareasEMPRESA.AsInteger := REntorno.Empresa;
  QMLonaTareasCODIGO_LONA.AsString := QMLonasCODIGO.AsString;
  QMLonaTareasSECCION.AsString := QMLonasSECCION.AsString;
end;

procedure TZDMLonas.QMLonasNewRecord(DataSet: TDataSet);
begin
  QMLonasSECCION.AsString := 'DES';
end;

procedure TZDMLonas.QMLonasAfterOpen(DataSet: TDataSet);
begin
  QMLonaTareas.Open;
end;

procedure TZDMLonas.QMLonasBeforeClose(DataSet: TDataSet);
begin
  QMLonaTareas.Close;
end;

end.
