unit ZUDMModelosFechas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TZDMModelosFechas = class(TDataModule)
     TLocal: THYTransaction;
     QMModelosFechas: TFIBTableSet;
     DSModelosFechas: TDataSource;
     QMModelosFechasCODIGO: TFIBStringField;
     QMModelosFechasLINEA: TIntegerField;
     QMModelosFechasFECHA_INI: TDateTimeField;
     QMModelosFechasFECHA_FIN: TDateTimeField;
     QMModelosFechasDIAS_SERVIR: TIntegerField;
     xDescModelo: TFIBDataSetRO;
     xDescModeloCODIGO: TFIBStringField;
     xDescModeloDESCRIPCION: TFIBStringField;
     DSxDescModelo: TDataSource;
     QMModelosFechasCOLOR: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMModelosFechasNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
     Modelo: string;
  public
     { Public declarations }
     procedure FiltraModelo(aModelo: string);
     procedure ProcesoColores(Desde, Hasta: TDateTime; Borrado: boolean);
  end;

var
  ZDMModelosFechas : TZDMModelosFechas;

implementation

uses UDMMain, UUtiles;

{$R *.dfm}

procedure TZDMModelosFechas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TZDMModelosFechas.FiltraModelo(aModelo: string);
begin
  Modelo := aModelo;

  xDescModelo.Close;
  xDescModelo.Params.ByName['CODIGO'].AsString := Modelo;
  xDescModelo.Open;

  QMModelosFechas.Close;
  QMModelosFechas.Params.ByName['CODIGO'].AsString := Modelo;
  QMModelosFechas.Open;
end;

procedure TZDMModelosFechas.ProcesoColores(Desde, Hasta: TDateTime; Borrado: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_GENERA_COLORES_MODELOS(?DESDE, ?HASTA, ?BORRADO)';
        Params.ByName['DESDE'].AsDateTime := Desde;
        Params.ByName['HASTA'].AsDateTime := Hasta;
        Params.ByName['BORRADO'].AsInteger := BoolToInt(Borrado);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMModelosFechas.QMModelosFechasNewRecord(DataSet: TDataSet);
begin
  QMModelosFechasCODIGO.AsString := Modelo;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(LINEA) FROM Z_SYS_MODELOS_FECHAS WHERE CODIGO = ?CODIGO';
        Params.ByName['CODIGO'].AsString := Modelo;
        ExecQuery;
        QMModelosFechasLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
