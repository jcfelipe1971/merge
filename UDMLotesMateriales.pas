unit UDMLotesMateriales;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBQuery, HYFIBQuery, FIBDataSet, FIBTableDataSet;

type
  TDMLotesMateriales = class(TDataModule)
     TLocal: THYTransaction;
     xLotesUtilizadosMI: TFIBDataSetRO;
     DSxLotesUtilizados: TDataSource;
     xLotesEnEscandallo: TFIBDataSetRO;
     DSxLotesEnEscandallo: TDataSource;
     QInsertarEnUtil: THYFIBQuery;
     QEliminaDeUtil: THYFIBQuery;
     xOrdenLineaLote: TFIBDataSetRO;
     DSxOrdenLineaLote: TDataSource;
     xOrdenLineaLoteEMPRESA: TIntegerField;
     xOrdenLineaLoteEJERCICIO: TIntegerField;
     xOrdenLineaLoteCANAL: TIntegerField;
     xOrdenLineaLoteTIPO: TFIBStringField;
     xOrdenLineaLoteNORDEN: TIntegerField;
     xOrdenLineaLoteLOTE: TFIBStringField;
     xOrdenLineaLoteN_SERIE: TFIBStringField;
     xOrdenLineaLoteCLASIFICACION: TFIBStringField;
     xOrdenLineaLoteF_FABRICACION: TDateTimeField;
     xOrdenLineaLoteF_ENVASADO: TDateTimeField;
     xOrdenLineaLoteF_CADUCIDAD: TDateTimeField;
     xOrdenLineaLoteCANTIDAD: TFloatField;
     xOrdenLineaLoteARTICULO: TFIBStringField;
     xOrdenLineaLoteALMACEN: TFIBStringField;
     xOrdenLineaLoteLINEA: TIntegerField;
     xOrdenLineaLoteID_A: TIntegerField;
     xOrdenLineaLotePROVEEDOR: TIntegerField;
     xOrdenLineaLoteID_LOTE: TIntegerField;
     xLotesUtilizadosMILOTE: TFIBStringField;
     xLotesUtilizadosMISERIE: TFIBStringField;
     xLotesUtilizadosMIARTICULO: TFIBStringField;
     xLotesUtilizadosMIF_CADUCIDAD: TDateTimeField;
     xLotesUtilizadosMICANTIDAD: TFloatField;
     xLotesUtilizadosMIID_LOTE: TIntegerField;
     xLotesUtilizadosMILINEA_MATERIA: TIntegerField;
     xArticulosConLoteEsc: TFIBDataSetRO;
     xArticulosConLoteEscDETALLE: TFIBStringField;
     xArticulosConLoteEscTITULO: TFIBStringField;
     DSxArticulosConLoteEsc: TDataSource;
     xLotesUtilizadosMIALMACEN: TFIBStringField;
     xLotesEnEscandalloLOTE: TFIBStringField;
     xLotesEnEscandalloN_SERIE: TFIBStringField;
     xLotesEnEscandalloARTICULO: TFIBStringField;
     xLotesEnEscandalloF_CADUCIDAD: TDateTimeField;
     xLotesEnEscandalloSTOCK: TFloatField;
     xLotesEnEscandalloID_LOTE: TIntegerField;
     xLotesEnEscandalloALMACEN: TFIBStringField;
     xLotesEnEscandalloPROVEEDOR: TIntegerField;
     xLotesUtilizados: TFIBTableSet;
     xLotesUtilizadosLOTE: TFIBStringField;
     xLotesUtilizadosSERIE: TFIBStringField;
     xLotesUtilizadosARTICULO: TFIBStringField;
     xLotesUtilizadosF_CADUCIDAD: TDateTimeField;
     xLotesUtilizadosCANTIDAD: TFloatField;
     xLotesUtilizadosID_LOTE: TIntegerField;
     xLotesUtilizadosLINEA_MATERIA: TIntegerField;
     xLotesUtilizadosALMACEN: TFIBStringField;
     xLotesUtilizadosEMPRESA: TIntegerField;
     xLotesUtilizadosEJERCICIO: TIntegerField;
     xLotesUtilizadosCANAL: TIntegerField;
     xLotesUtilizadosNORDEN: TIntegerField;
     xLotesUtilizadosLINEA: TIntegerField;
     xArticulosConLoteEscLINEA: TIntegerField;
     xOrdenLineaLoteSERIE: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure xLotesUtilizadosAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
     Orden, Linea: integer;
     procedure AbrirLineaLotes;
     //procedure AbrirLotesUtilizados;
     procedure AbrirLotesEnEscandallo(Articulo: string);
     procedure AbrirArticulosConLotes;
     procedure PonMascarasDeLotes(Articulo: string);
  public
     { Public declarations }
     procedure AbrirDatos(Orden, Linea: integer);
     procedure InsertarEnUtilizados;
     procedure EliminarDeUtilizados;
     procedure BorraLoteIntroducido;
     procedure GrabaEnUtilizados;
     procedure AbrirLotesUtilizados(Articulo: string);
  end;

var
  DMLotesMateriales : TDMLotesMateriales;

implementation

{$R *.dfm}

uses
  UDMMain, UEntorno;

{ TDMLotesMateriaPrima }

procedure TDMLotesMateriales.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMLotesMateriales.AbrirLineaLotes;
begin
  with xOrdenLineaLote do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['NORDEN'].AsInteger := Orden;
     Params.ByName['LINEA'].AsInteger := Linea;
     Open;
  end;
end;

procedure TDMLotesMateriales.AbrirLotesUtilizados(Articulo: string);
begin
  Linea := StrToInt(Copy(Articulo, 1, Pos('-', Articulo) - 1));

  with xLotesUtilizados do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['NORDEN'].AsInteger := Orden;
     Params.ByName['ARTICULO'].AsString := Copy(Articulo, Pos('-', Articulo) + 1, Length(Articulo));
     Params.ByName['LINEA'].AsInteger := Linea;
     Open;
  end;

  AbrirLotesEnEscandallo(Articulo);
  PonMascarasDeLotes(Copy(Articulo, Pos('-', Articulo) + 1, Length(Articulo)));
end;

procedure TDMLotesMateriales.AbrirLotesEnEscandallo(Articulo: string);
begin
  Linea := StrToInt(Copy(Articulo, 1, Pos('-', Articulo) - 1));

  with xLotesEnEscandallo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['NORDEN'].AsInteger := Orden;
     Params.ByName['ARTICULO'].AsString := Copy(Articulo, Pos('-', Articulo) + 1, Length(Articulo));
     Params.ByName['LINEA'].AsInteger := Linea;
     Open;
  end;
end;

procedure TDMLotesMateriales.AbrirDatos(Orden, Linea: integer);
begin
  Self.Orden := Orden;
  Self.Linea := Linea;
  AbrirArticulosConLotes;
  AbrirLineaLotes;
  //AbrirLotesUtilizados;
  //AbrirLotesEnEscandallo;
end;

procedure TDMLotesMateriales.InsertarEnUtilizados;
begin
  with QInsertarEnUtil do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['NORDEN'].AsInteger := Orden;
     Params.ByName['LINEA'].AsInteger := Linea;
     Params.ByName['ALMACEN'].AsString := xLotesEnEscandalloALMACEN.AsString;
     Params.ByName['ARTICULO'].AsString := xLotesEnEscandalloARTICULO.AsString;
     Params.ByName['LOTE'].AsString := xLotesEnEscandalloLOTE.AsString;
     Params.ByName['SERIE'].AsString := xOrdenLineaLoteSERIE.AsString;
     Params.ByName['PROVEEDOR'].AsInteger := xLotesEnEscandalloPROVEEDOR.AsInteger;
     Params.ByName['ID_LOTE'].AsInteger := xLotesEnEscandalloID_LOTE.AsInteger;
     ExecQuery;
     FreeHandle;
  end;
  //AbrirLotesUtilizados;
  //AbrirLotesEnEscandallo;
end;

procedure TDMLotesMateriales.EliminarDeUtilizados;
begin
  with QEliminaDeUtil do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['NORDEN'].AsInteger := Orden;
     Params.ByName['LINEA'].AsInteger := Linea;
     Params.ByName['LINEA_MATERIA'].AsString := xLotesUtilizadosLINEA_MATERIA.AsString;
     ExecQuery;
     FreeHandle;
  end;
  //AbrirLotesUtilizados;
  //AbrirLotesEnEscandallo;
end;

procedure TDMLotesMateriales.BorraLoteIntroducido;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM TMP_ART_ORDENES_PROD_LOTES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' NORDEN = :NORDEN ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['NORDEN'].AsInteger := Orden;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLotesMateriales.AbrirArticulosConLotes;
begin
  with xArticulosConLoteEsc do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ORDEN'].AsInteger := Orden;
     Open;
  end;
end;

procedure TDMLotesMateriales.PonMascarasDeLotes(Articulo: string);
var
  MascaraLotes : string;
begin
  MascaraLotes := DMMain.DameMascaraUnidades(Articulo);

  xLotesUtilizadosCANTIDAD.DisplayFormat := MascaraLotes;
  xLotesEnEscandalloSTOCK.DisplayFormat := MascaraLotes;
end;

procedure TDMLotesMateriales.xLotesUtilizadosAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMLotesMateriales.GrabaEnUtilizados;
begin
  if (xLotesUtilizados.State in [dsInsert, dsEdit]) then
     xLotesUtilizados.Post;
end;

end.
