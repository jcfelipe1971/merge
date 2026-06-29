unit ZUDMReplicacionModelosDet;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery, Dialogs, FIBDataSetRO;

type
  TZDMReplicacionModelosDet = class(TDataModule)
     TLocal: THYTransaction;
     QInsertarTemp: THYFIBQuery;
     QMTempModelos: TFIBTableSet;
     DSTempModelos: TDataSource;
     QMTempModelosMODELO: TFIBStringField;
     QMTempModelosLINEA: TIntegerField;
     QMTempModelosSALIDA: TIntegerField;
     QMTempModelosMARCADO: TIntegerField;
     QMTempModelosENTRADA: TIntegerField;
     QMTempModelosESCANDALLO: TIntegerField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMTempModelosMARCADOChange(Sender: TField);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure ReplicarEscandallo(Modelo: string; empresa, entrada, escandallo_padre: integer);
     procedure ReplicarMotor(Modelo: string; entrada, empresa, linea, salida: integer);
     procedure ReplicarTipoConf(Modelo: string; entrada, empresa, linea, salida: integer);
     procedure ReplicarIncrLacado(Modelo: string; entrada, empresa, linea, salida: integer);
     procedure ReplicarCalcLona(Modelo: string; entrada, empresa, linea, salida: integer);
     procedure ReplicarIncrDecr(Modelo: string; entrada, empresa, linea, salida: integer);
     procedure BorrarTemp;
     procedure Seleccionar(valor: integer);
  end;

var
  ZDMReplicacionModelosDet : TZDMReplicacionModelosDet;

implementation

uses UDMMain, UEntorno, ZUDMModelosDet;

{$R *.dfm}

procedure TZDMReplicacionModelosDet.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  // S'omple la taula amb els temporals
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_RELLENA_TMP_MODELOS(:ENTRADA, :MODELO, :LINEA, :SALIDA)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['MODELO'].AsString := ZDMModelosDet.QMModelosDetCODIGO.AsString;
        Params.ByName['LINEA'].AsInteger := ZDMModelosDet.QMModelosDetLINEA.AsInteger;
        Params.ByName['SALIDA'].AsInteger := ZDMModelosDet.QMModelosDetSALIDA.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Obrir els temporals d'aquella entrada
  with QMTempModelos do
  begin
     Close;
     Params.ByName['MODELO'].AsString := ZDMModelosDet.QMModelosDetCODIGO.AsString;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TZDMReplicacionModelosDet.ReplicarEscandallo(Modelo: string; empresa, entrada, escandallo_padre: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_MODIFICAR_ESC_MODELO(:EMPRESA, :MODELO, :ENTRADA, :ESCANDALLO_PADRE)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['MODELO'].AsString := modelo;
        Params.ByName['ENTRADA'].AsInteger := entrada;
        Params.ByName['ESCANDALLO_PADRE'].AsInteger := escandallo_padre;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMReplicacionModelosDet.ReplicarMotor(Modelo: string; entrada, empresa, linea, salida: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_MODELO_REPLICA_MOTORES(:CODIGO, :ENTRADA, :EMPRESA, :LINEA, :SALIDA)';
        Params.ByName['CODIGO'].AsString := Modelo;
        Params.ByName['ENTRADA'].AsInteger := entrada;
        Params.ByName['EMPRESA'].AsInteger := empresa;
        Params.ByName['LINEA'].AsInteger := linea;
        Params.ByName['SALIDA'].AsInteger := salida;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMReplicacionModelosDet.QMTempModelosMARCADOChange(Sender: TField);
begin
  with QMTempModelos do
  begin
     if (State = dsInsert) or (State = dsEdit) then
     begin
        Post;
        Transaction.CommitRetaining;
     end;
  end;
end;

procedure TZDMReplicacionModelosDet.BorrarTemp;
begin
  // S'elimina al sortir
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM Z_REPLICAR_MODELOS_TEMP WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMReplicacionModelosDet.DataModuleDestroy(Sender: TObject);
begin
  BorrarTemp;
end;

procedure TZDMReplicacionModelosDet.ReplicarCalcLona(Modelo: string; entrada, empresa, linea, salida: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_MODELO_REPLICA_CALC_LONA(:CODIGO, :ENTRADA, :EMPRESA, :LINEA, :SALIDA)';
        Params.ByName['CODIGO'].AsString := Modelo;
        Params.ByName['ENTRADA'].AsInteger := entrada;
        Params.ByName['EMPRESA'].AsInteger := empresa;
        Params.ByName['LINEA'].AsInteger := linea;
        Params.ByName['SALIDA'].AsInteger := salida;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMReplicacionModelosDet.ReplicarIncrLacado(Modelo: string; entrada, empresa, linea, salida: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_MODELO_REPLICA_INCR_LACADO(:CODIGO, :ENTRADA, :EMPRESA, :LINEA, :SALIDA)';
        Params.ByName['CODIGO'].AsString := Modelo;
        Params.ByName['ENTRADA'].AsInteger := entrada;
        Params.ByName['EMPRESA'].AsInteger := empresa;
        Params.ByName['LINEA'].AsInteger := linea;
        Params.ByName['SALIDA'].AsInteger := salida;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMReplicacionModelosDet.ReplicarTipoConf(Modelo: string; entrada, empresa, linea, salida: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_MODELO_REPLICA_TIPO_CONF(:CODIGO, :ENTRADA, :EMPRESA, :LINEA, :SALIDA)';
        Params.ByName['CODIGO'].AsString := Modelo;
        Params.ByName['ENTRADA'].AsInteger := entrada;
        Params.ByName['EMPRESA'].AsInteger := empresa;
        Params.ByName['LINEA'].AsInteger := linea;
        Params.ByName['SALIDA'].AsInteger := salida;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMReplicacionModelosDet.ReplicarIncrDecr(Modelo: string; entrada, empresa, linea, salida: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_MODELO_REPLICA_INC_DEC(:CODIGO, :ENTRADA, :EMPRESA, :LINEA, :SALIDA)';
        Params.ByName['CODIGO'].AsString := Modelo;
        Params.ByName['ENTRADA'].AsInteger := entrada;
        Params.ByName['EMPRESA'].AsInteger := empresa;
        Params.ByName['LINEA'].AsInteger := linea;
        Params.ByName['SALIDA'].AsInteger := salida;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TZDMReplicacionModelosDet.Seleccionar(valor: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE Z_REPLICAR_MODELOS_TEMP SET MARCADO = :MARCADO WHERE MODELO = :MODELO AND ENTRADA = :ENTRADA';
        Params.ByName['MODELO'].AsString := QMTempModelosMODELO.AsString;
        Params.ByName['ENTRADA'].AsInteger := QMTempModelosENTRADA.AsInteger;
        Params.ByName['MARCADO'].AsInteger := valor;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMTempModelos.Close;
  QMTempModelos.Open;
end;

end.
