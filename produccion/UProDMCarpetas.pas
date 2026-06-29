unit UProDMCarpetas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery, FIBDataSetRO;

type
  TProDMCarpetas = class(TDataModule)
     TLocal: THYTransaction;
     QMCarpetas: TFIBTableSet;
     QMCarpetasID: TIntegerField;
     QMCarpetasLINEA: TIntegerField;
     QMCarpetasTIPO: TFIBStringField;
     QMCarpetasID_REGISTRO: TIntegerField;
     QMCarpetasRUTA: TFIBStringField;
     DSCarpetas: TDataSource;
     QLinia: THYFIBQuery;
     QMCarpetasDESCRIPCION: TFIBStringField;
     xRutas: TFIBDataSetRO;
     xRutasRUTA: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCarpetasNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMCarpetasAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
     id_registro: integer;
     tipo_registro: string;
  public
     { Public declarations }
     procedure ObrirTaula(id: integer; tipo: string);
  end;

var
  ProDMCarpetas : TProDMCarpetas;

implementation

uses UDMMain, UProFMCarpetas;

{$R *.dfm}

procedure TProDMCarpetas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TProDMCarpetas.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TProDMCarpetas.ObrirTaula(id: integer; tipo: string);
begin
  id_registro := id;
  tipo_registro := tipo;
  QMCarpetas.Close;
  QMCarpetas.Params.ByName['id_registro'].AsInteger := id_registro;
  QMCarpetas.Params.ByName['tipo_registro'].AsString := tipo_registro;
  QMCarpetas.Open;
end;

procedure TProDMCarpetas.QMCarpetasNewRecord(DataSet: TDataSet);
begin
  QMCarpetasID_REGISTRO.AsInteger := id_registro;
  QMCarpetasTIPO.AsString := tipo_registro;

  // Es busca el número de linia per aquest registre i tipus
  QLinia.Close;
  QLinia.Params.ByName['id_registro'].AsInteger := id_registro;
  QLinia.Params.ByName['tipo_registro'].AsString := tipo_registro;
  QLinia.Prepare;
  QLinia.ExecQuery;
  QMCarpetasLINEA.AsInteger := QLinia.FieldByName['linea'].AsInteger + 1;
  QLinia.FreeHandle;
end;

procedure TProDMCarpetas.QMCarpetasAfterScroll(DataSet: TDataSet);
begin
  xRutas.Close;
  xRutas.Params.ByName['id'].AsInteger := QMCarpetasID.AsInteger;
  xRutas.Open;
  ProFMCarpetas.Ruta.Text := QMCarpetasRUTA.AsString;
end;

end.
