unit UDMParamArticulos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery;

type
  TDMParamArticulos = class(TDataModule)
     TMaestro_Estructura: TFIBTableSet;
     TDetalle_Estructura: TFIBTableSet;
     DSTMaestro_Estructura: TDataSource;
     DSTDetalle_Estructura: TDataSource;
     TLocal: THYTransaction;
     TMaestro_EstructuraEMPRESA: TIntegerField;
     TMaestro_EstructuraCOD_MODELO: TFIBStringField;
     TMaestro_EstructuraTITULO: TFIBStringField;
     TDetalle_EstructuraEMPRESA: TIntegerField;
     TDetalle_EstructuraCOD_MODELO: TFIBStringField;
     TDetalle_EstructuraORDEN: TIntegerField;
     TDetalle_EstructuraTIPO: TFIBStringField;
     TDetalle_EstructuraLIBRE: TFIBStringField;
     TDetalle_EstructuraDIGITOS: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure TMaestro_EstructuraAfterOpen(DataSet: TDataSet);
     procedure TMaestro_EstructuraAfterScroll(DataSet: TDataSet);
     procedure TMaestro_EstructuraNewRecord(DataSet: TDataSet);
     procedure TDetalle_EstructuraNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure TMaestro_EstructuraBeforeOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure InsertaLinea(Campo, libre: string; Digitos: integer);
     procedure BorraDetalle(Opcion: integer);
     procedure Reordena(Orden: integer);
     function ControlaRepetidos(Campo: string): integer;
     procedure FiltraEstructura(Codigo: string);
  end;

var
  DMParamArticulos : TDMParamArticulos;

implementation

uses UDMMain, UEntorno{, UDMMaestrosTallas};

{$R *.dfm}

procedure TDMParamArticulos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  TMaestro_Estructura.Open;
end;

procedure TDMParamArticulos.TMaestro_EstructuraAfterOpen(DataSet: TDataSet);
begin
  TDetalle_Estructura.Open;
end;

procedure TDMParamArticulos.TMaestro_EstructuraAfterScroll(DataSet: TDataSet);
begin
  TDetalle_estructura.Close;
  TDetalle_estructura.Open;
end;

procedure TDMParamArticulos.TMaestro_EstructuraNewRecord(DataSet: TDataSet);
begin
  TMaestro_EstructuraEMPRESA.AsInteger := REntorno.Empresa;
  // TMaestro_EstructuraID_A_M.AsInteger := DMMaestrosTallas.QMart_articulos_modelosID_A_M.AsInteger;
end;

procedure TDMParamArticulos.InsertaLinea(Campo, libre: string; Digitos: integer);
begin
  TDetalle_Estructura.Insert;
  TDetalle_EstructuraTIPO.AsString := Campo;
  TDetalle_EstructuraDIGITOS.AsInteger := Digitos;
  TDetalle_EstructuraLIBRE.AsString := Libre;
  try
     TDetalle_Estructura.Post;
  except
     TDetalle_Estructura.Cancel;
  end;
end;

procedure TDMParamArticulos.TDetalle_EstructuraNewRecord(DataSet: TDataSet);
begin
  TDetalle_estructuraEMPRESA.AsInteger := TMaestro_estructuraEMPRESA.AsInteger;
  TDetalle_estructuraCOD_MODELO.AsString := TMaestro_estructuraCOD_MODELO.AsString;
end;

procedure TDMParamArticulos.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
end;

procedure TDMParamArticulos.BorraDetalle(Opcion: integer);
var
  SQL : string;
begin
  if (Opcion = 1) then
     TDetalle_Estructura.Delete;

  if (Opcion = 2) then
  begin
     with TDetalle_estructura do
     begin
        if Active then
           Close;
        SQL := DeleteSQL.Text;
        DeleteSQL.Text := ' DELETE FROM ART_MOD_ESTRUCTURA_DET WHERE EMPRESA = ?old_EMPRESA AND COD_MODELO = ?old_COD_MODELO ';
        Open;
        Delete;
        Close;
        DeleteSQL.Text := SQL;
        Open;
     end;
  end;
end;

function TDMParamArticulos.ControlaRepetidos(Campo: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT COUNT(*) ');
        SQL.Add(' FROM ART_MOD_ESTRUCTURA_DET ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' COD_MODELO = ?COD_MODELO AND ');
        SQL.Add(' TIPO = ?TIPO ');
        Params.ByName['EMPRESA'].AsInteger := TMaestro_EstructuraEMPRESA.AsInteger;
        Params.ByName['COD_MODELO'].AsString := TMaestro_EstructuraCOD_MODELO.AsString;
        Params.ByName['TIPO'].AsString := Campo;
        ExecQuery;
        Result := FieldByName['COUNT'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMParamArticulos.Reordena(Orden: integer); //1 asciende ,2 desciende la linea
var
  LineaActual : integer;
begin
  LineaActual := TDetalle_estructuraORDEN.AsInteger;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE  PROCEDURE ART_ESTRUCTURA_REORDENA (?EMPRESA, ?COD_MODELO, ?ORDEN, ?SENTIDO)';
        Params.ByName['EMPRESA'].AsInteger := TDetalle_estructuraEMPRESA.AsInteger;
        Params.ByName['COD_MODELO'].AsString := TDetalle_estructuraCOD_MODELO.AsString;
        Params.ByName['ORDEN'].AsInteger := TDetalle_estructuraORDEN.AsInteger;
        Params.ByName['SENTIDO'].AsInteger := Orden;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Graba(TDetalle_estructura);
  with TDetalle_estructura do
  begin
     Close;
     Open;

     if (Orden = 1) then
        Dec(LineaActual)
     else
        Inc(LineaActual);

     Locate('orden', LineaActual, []);
  end;
end;

procedure TDMParamArticulos.FiltraEstructura(Codigo: string);
begin
  if (Codigo <> '') then
     TMaestro_Estructura.Locate('COD_MODELO', Codigo, []);
end;

procedure TDMParamArticulos.TMaestro_EstructuraBeforeOpen(DataSet: TDataSet);
begin
  TMaestro_Estructura.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
end;

end.
