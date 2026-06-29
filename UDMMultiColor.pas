unit UDMMultiColor;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMMultiColor = class(TDataModule)
     TLocal: THYTransaction;
     DSQMColores: TDataSource;
     QMColores: TFIBTableSet;
     TUpdate: THYTransaction;
     QMColoresENTRADA: TIntegerField;
     QMColoresID_A_M_C: TIntegerField;
     QMColoresCOD_COLOR: TFIBStringField;
     QMColoresS_COLOR: TFIBStringField;
     QMColoresTITULO: TFIBStringField;
     QMColoresMARCADO: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     ID_A_M: integer;
  public
     { Public declarations }
     procedure MarcarTodos(Marca: smallint);
     procedure RellenarSeleccion(aID_A_M: integer);
     procedure BorraTemporal;
  end;

var
  DMMultiColor : TDMMultiColor;

implementation

uses UDMMain, HYFIBQuery, UEntorno;

{$R *.dfm}

procedure TDMMultiColor.BorraTemporal;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM TMP_ART_ARTICULOS_MOD_COLOR ');
        SQL.Add(' WHERE ');
        SQL.Add(' ENTRADA = :ENTRADA ');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMMultiColor.DataModuleCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMMultiColor.MarcarTodos(Marca: smallint);
var
  Q : THYFIBQuery;
begin
  // Cancelo la edición para evitar el error de: hay otro usuario modificando este registro
  QMColores.Cancel;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE TMP_ART_ARTICULOS_MOD_COLOR ');
        SQL.Add(' SET MARCADO = :MARCA ');
        SQL.Add(' WHERE ');
        SQL.Add(' ENTRADA = :ENTRADA AND ');
        SQL.Add(' ID_A_M = :ID_A_M ');
        Params.ByName['MARCA'].AsInteger := Marca;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_A_M'].AsInteger := ID_A_M;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMColores.Close;
  QMColores.Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
  QMColores.Open;
end;

procedure TDMMultiColor.RellenarSeleccion(aID_A_M: integer);
var
  Q : THYFIBQuery;
begin
  ID_A_M := aID_A_M;

  BorraTemporal;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO TMP_ART_ARTICULOS_MOD_COLOR ( ');
        SQL.Add(' ENTRADA, ID_A_M_C, ID_A_M, COD_COLOR, S_COLOR, TITULO, MARCADO) ');
        SQL.Add(' SELECT :ENTRADA, ID_A_M_C, ID_A_M, COD_COLOR, S_COLOR, TITULO, 1 ');
        SQL.Add(' FROM ART_ARTICULOS_MOD_COLOR ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_A_M = :ID_A_M ');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_A_M'].AsInteger := ID_A_M;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  MarcarTodos(1);
end;

end.
