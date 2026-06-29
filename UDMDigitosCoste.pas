unit UDMDigitosCoste;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, HYFIBQuery;

type
  TDMDigitosCoste = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMCentroCoste: TFIBTableSet;
     QMCentroCosteID: TIntegerField;
     QMCentroCosteLINEA: TIntegerField;
     QMCentroCosteD1: TFIBStringField;
     QMCentroCosteD2: TFIBStringField;
     QMCentroCosteD3: TFIBStringField;
     QMCentroCosteD4: TFIBStringField;
     QMCentroCosteD5: TFIBStringField;
     QMCentroCostePORCENTAJE: TFloatField;
     DSQMCentroCoste: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCentroCosteNewRecord(DataSet: TDataSet);
     procedure QMCentroCosteBeforePost(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     Id: integer;
  public
     { Public declarations }
     procedure Inicializa(aId: integer);
  end;

var
  DMDigitosCoste : TDMDigitosCoste;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMDigitosCoste.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMCentroCostePORCENTAJE.DisplayFormat := MascaraP;
end;

procedure TDMDigitosCoste.Inicializa(aId: integer);
begin
  Id := aId;
  QMCentroCoste.Close;
  QMCentroCoste.Params.ByName['ID'].AsInteger := Id;
  QMCentroCoste.Open;
end;

procedure TDMDigitosCoste.QMCentroCosteNewRecord(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  QMCentroCosteID.AsInteger := Id;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT SUM(PORCENTAJE) FROM TMP_CENTRO_COSTE WHERE ID=?ID';
        Params.ByName['ID'].AsInteger := Id;
        ExecQuery;
        QMCentroCostePORCENTAJE.AsFloat := 100 - FieldByName['SUM'].AsFloat;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMDigitosCoste.QMCentroCosteBeforePost(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  if (DataSet.State = dsInsert) then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MAX(LINEA) FROM TMP_CENTRO_COSTE WHERE ID=?ID';
           Params.ByName['ID'].AsInteger := Id;
           ExecQuery;
           QMCentroCosteLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;
end;

procedure TDMDigitosCoste.DataModuleDestroy(Sender: TObject);
begin
  if (QMCentroCoste.Active) then
  begin
     if ((QMCentroCoste.State = dsInsert) or (QMCentroCoste.State = dsEdit)) then
        QMCentroCoste.Post;
     QMCentroCoste.Close;
  end;
  if not TLocal.InTransaction then
     TLocal.Commit;
end;

end.
