unit UDMParamApuntes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSetRO, FIBDatabase, UFIBModificados,
  FIBQuery, HYFIBQuery, FIBDataSet, FIBTableDataSet, FIBTableDataSetRO;

type
  TDMParamApuntes = class(TDataModule)
     TLocal: THYTransaction;
     xGrupoAsientos: TFIBDataSetRO;
     DSxGruposAsientos: TDataSource;
     xAsientos: TFIBDataSetRO;
     xApuntes: TFIBDataSetRO;
     DSxAsientos: TDataSource;
     DSxApuntes: TDataSource;
     DSxInsertaVariables: TDataSource;
     xGrupoAsientosTITULO: TFIBStringField;
     xGrupoAsientosCOD_GRUP_ASIENTO: TIntegerField;
     xInsertaVariables: TFIBTableSetRO;
     SPGrabaTexto: THYFIBQuery;
     xInsertaVariablesTITULO: TFIBStringField;
     xInsertaFormatoF: TFIBTableSetRO;
     DSxInsertaFormatoF: TDataSource;
     xInsertaFormatoO: TFIBTableSetRO;
     DSInsertaFormatoO: TDataSource;
     xAsientosCOD_GRUP_ASIENTO: TIntegerField;
     xAsientosCOD_ASIENTO: TIntegerField;
     xAsientosTITULO: TFIBStringField;
     xApuntesCOD_GRUP_ASIENTO: TIntegerField;
     xApuntesCOD_ASIENTO: TIntegerField;
     xApuntesCOD_APUNTE: TIntegerField;
     xApuntesTITULO: TFIBStringField;
     xInsertaFormatoFTITULO: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure DameTituloApute(GrupoAsientos, Asiento, Apunte: integer);
     procedure DameTituloGAsiento(GrupoAsientos: integer);
     procedure DameTituloAsientos(GrupoAsientos, Asientos: integer);
     procedure InsertaFormatoF(Lista: TStrings; GruposAsientos, Asientos, Apuntes: integer);
     procedure InsertaFormato0(Lista: TStrings; GruposAsientos, Asientos, Apuntes: integer);
     procedure InsertaVariables(Lista: TStrings; GruposAsientos, Asientos, Apuntes: integer);
     procedure ConfiguracionMasiva(Modo: byte);
     procedure GrabaTexto(GruposAsientos, Asientos, Apuntes: integer; Indice: string; Orden: integer);
     procedure BorraTablaFinal(GruposAsientos, Asientos, Apuntes: integer);
  end;

var
  DMParamApuntes : TDMParamApuntes;

implementation

uses UDMMain, UEntorno, UFParada;

{$R *.dfm}

procedure TDMParamApuntes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMParamApuntes.DameTituloGAsiento(GrupoAsientos: integer);
begin
  with xGrupoAsientos do
  begin
     Close;
     Params.ByName['COD_GRUP_ASIENTO'].AsInteger := GrupoAsientos;
     Open;
  end;
end;

procedure TDMParamApuntes.DameTituloAsientos(GrupoAsientos, Asientos: integer);
begin
  with xAsientos do
  begin
     Close;
     Params.ByName['COD_GRUP_ASIENTO'].AsInteger := GrupoAsientos;
     Params.ByName['COD_ASIENTO'].AsInteger := Asientos;
     Open;
  end;
end;

procedure TDMParamApuntes.DameTituloApute(GrupoAsientos, Asiento, Apunte: integer);
begin
  with xApuntes do
  begin
     Close;
     Params.ByName['COD_GRUP_ASIENTO'].AsInteger := GrupoAsientos;
     Params.ByName['COD_ASIENTO'].AsInteger := Asiento;
     Params.ByName['COD_APUNTE'].AsInteger := Apunte;
     Open;
  end;
end;

procedure TDMParamApuntes.ConfiguracionMasiva(modo: byte);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        DataBase := DMMain.DataBase;
        Close;
        SQL.Text := 'EXECUTE PROCEDURE G_TEXTOAPUNTE_CONFMASIVA (?EMPRESA, ?MODO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['MODO'].AsInteger := Modo;
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMParamApuntes.InsertaFormato0(Lista: TStrings; GruposAsientos, Asientos, Apuntes: integer);
begin
  with xInsertaFormatoO do
  begin
     Close;
     Params.ByName['GRUPO'].AsInteger := GruposAsientos;
     Params.ByName['ASIENTO'].AsInteger := Asientos;
     Params.ByName['APUNTE'].AsInteger := Apuntes;
     Open;
  end;

  // Se insertan los campos por lineas en ListDestino
  while not (xInsertaFormatoO.EOF) do
  begin
     Lista.Add(xInsertaFormatoO.FieldByName('TITULO').AsString);
     DMParamApuntes.xInsertaFormatoO.Next;
  end;
end;

procedure TDMParamApuntes.BorraTablaFinal(GruposAsientos, Asientos, Apuntes: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        Close;
        SQL.Text := 'DELETE FROM SYS_TEXTO_ASIENTOS_FINAL WHERE EMPRESA=?EMPRESA AND COD_GRUP_ASIENTO=?GRUPO AND COD_ASIENTO=?ASIENTO AND COD_APUNTE=?APUNTE';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['GRUPO'].AsInteger := GruposAsientos;
        Params.ByName['ASIENTO'].AsInteger := Asientos;
        Params.ByName['APUNTE'].AsInteger := Apuntes;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMParamApuntes.GrabaTexto(GruposAsientos, Asientos, Apuntes: integer; Indice: string; Orden: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TEXTOFINAL_GRABA (?EMPRESA, ?GRUPO, ?ASIENTO, ?APUNTE, ?TITULO_CAMPO, ?ORDEN)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['GRUPO'].AsInteger := GruposAsientos;
        Params.ByName['ASIENTO'].AsInteger := Asientos;
        Params.ByName['APUNTE'].AsInteger := Apuntes;
        Params.ByName['TITULO_CAMPO'].AsString := Indice;
        Params.ByName['ORDEN'].AsInteger := Orden;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMParamApuntes.InsertaVariables(Lista: TStrings; GruposAsientos, Asientos, Apuntes: integer);
begin
  with xInsertaVariables do
  begin
     Close;
     Params.ByName['GRUPO'].AsInteger := GruposAsientos;
     Params.ByName['ASIENTO'].AsInteger := Asientos;
     Params.ByName['APUNTE'].AsInteger := Apuntes;
     Open;
  end;

  while not (xInsertaVariables.EOF) do
  begin
     Lista.Add(xInsertaVariables.FieldByName('TITULO').AsString);
     xInsertaVariables.Next;
  end;
end;

procedure TDMParamApuntes.InsertaFormatoF(Lista: TStrings; GruposAsientos, Asientos, Apuntes: integer);
begin
  with xInsertaFormatoF do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['GRUPO'].AsInteger := GruposAsientos;
     Params.ByName['ASIENTO'].AsInteger := Asientos;
     Params.ByName['APUNTE'].AsInteger := Apuntes;
     Open;
  end;

  while not (xInsertaFormatoF.EOF) do
  begin
     Lista.Add(xInsertaFormatoF.FieldByName('TITULO').AsString);
     xInsertaFormatoF.Next;
  end;
end;

end.
