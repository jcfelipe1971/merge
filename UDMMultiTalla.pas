unit UDMMultiTalla;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMMultiTalla = class(TDataModule)
     TLocal: THYTransaction;
     DSQMTallas: TDataSource;
     QMTallas: TFIBTableSet;
     TUpdate: THYTransaction;
     QMTallasENTRADA: TIntegerField;
     QMTallasID_A_T: TIntegerField;
     QMTallasTALLA: TFIBStringField;
     QMTallasTITULO: TFIBStringField;
     QMTallasMARCADO: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     ID_G_T: integer;
  public
     { Public declarations }
     procedure MarcarTodos(Marca: smallint);
     procedure MarcarPack(Pack: string);
     procedure RellenarSeleccion(aID_G_T: integer; Pack: string);
     procedure BorraTemporal;
  end;

var
  DMMultiTalla : TDMMultiTalla;

implementation

uses UDMMain, HYFIBQuery, UEntorno;

{$R *.dfm}

procedure TDMMultiTalla.BorraTemporal;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM TMP_ART_TALLAS ');
        SQL.Add(' WHERE ');
        SQL.Add(' ENTRADA = :ENTRADA ');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMultiTalla.DataModuleCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMMultiTalla.MarcarPack(Pack: string);
var
  sl : TStrings;
  i : integer;
begin
  // Marco las tallas que esten en el pack

  MarcarTodos(0);

  sl := TStringList.Create;
  try
     sl.Delimiter := ',';
     sl.DelimitedText := Pack;
     for i := 0 to sl.Count - 1 do
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' UPDATE TMP_ART_TALLAS ');
              SQL.Add(' SET MARCADO = :MARCA ');
              SQL.Add(' WHERE ');
              SQL.Add(' ENTRADA = :ENTRADA AND ');
              SQL.Add(' ID_G_T = :ID_G_T AND ');
              SQL.Add(' TITULO = :TITULO ');
              Params.ByName['MARCA'].AsInteger := 1;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['ID_G_T'].AsInteger := ID_G_T;
              Params.ByName['TITULO'].AsString := Trim(sl[i]);
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  finally
     sl.Free;
  end;

  QMTallas.Close;
  QMTallas.Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
  QMTallas.Open;
end;

procedure TDMMultiTalla.MarcarTodos(Marca: smallint);
begin
  // Cancelo la edición para evitar el error de: hay otro usuario modificando este registro
  QMTallas.Cancel;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE TMP_ART_TALLAS ');
        SQL.Add(' SET MARCADO = :MARCA ');
        SQL.Add(' WHERE ');
        SQL.Add(' ENTRADA = :ENTRADA AND ');
        SQL.Add(' ID_G_T = :ID_G_T ');
        Params.ByName['MARCA'].AsInteger := Marca;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_G_T'].AsInteger := ID_G_T;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMTallas.Close;
  QMTallas.Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
  QMTallas.Open;
end;

procedure TDMMultiTalla.RellenarSeleccion(aID_G_T: integer; Pack: string);
begin
  ID_G_T := aID_G_T;

  BorraTemporal;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO TMP_ART_TALLAS ( ');
        SQL.Add(' ENTRADA, ID_A_T, ID_G_T, TALLA, TITULO, MARCADO) ');
        SQL.Add(' SELECT :ENTRADA, ID_A_T, ID_G_T, TALLA, TITULO, 1 ');
        SQL.Add(' FROM ART_TALLAS ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_G_T = :ID_G_T ');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_G_T'].AsInteger := ID_G_T;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Pack = '') then
     MarcarTodos(1)
  else
     MarcarPack(Pack);
end;

end.
