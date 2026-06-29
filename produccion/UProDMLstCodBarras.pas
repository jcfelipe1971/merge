unit UProDMLstCodBarras;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery,
  DB, FIBDataSet, FIBDataSetRO, FR_Class, Fr_HYReport, FR_DSet, FR_DBSet;

type
  TProDMLstCodBarras = class(TDataModule)
     TLocal: THYTransaction;
     xTemp: TFIBDataSetRO;
     xFaseD: TFIBDataSetRO;
     DSFaseD: TDataSource;
     DSFaseH: TDataSource;
     xFaseH: TFIBDataSetRO;
     xFaseDTITULO: TFIBStringField;
     xFaseHTITULO: TFIBStringField;
     frCodBarras: TfrHYReport;
     xTempEMPRESA: TIntegerField;
     xTempCODIGO: TFIBStringField;
     xTempTITULO: TFIBStringField;
     xTempENTRADA: TIntegerField;
     xTempCODIGOBARRAS: TFIBStringField;
     xTempTIPOBARRAS: TIntegerField;
     frDBCodBarras: TfrDBDataSet;
     xMaquinaD: TFIBDataSetRO;
     DSMaquinaC: TDataSource;
     DSMaquinaH: TDataSource;
     xMaquinaH: TFIBDataSetRO;
     xMaquinaHDESCRIPCION: TFIBStringField;
     xMaquinaDDESCRIPCION: TFIBStringField;
     xEmpleadoD: TFIBDataSetRO;
     DSxEmpleadoD: TDataSource;
     DSxEmpleadoH: TDataSource;
     xEmpleadoH: TFIBDataSetRO;
     xEmpleadoDTITULO: TFIBStringField;
     xEmpleadoHTITULO: TFIBStringField;
     xTareaD: TFIBDataSetRO;
     DSxTareaD: TDataSource;
     DSxTareaH: TDataSource;
     xTareaH: TFIBDataSetRO;
     xTareaDTITULO: TFIBStringField;
     xTareaHTITULO: TFIBStringField;
     xOrdenD: TFIBDataSetRO;
     FIBStringField1: TFIBStringField;
     DSxOrdenD: TDataSource;
     DSOrdenH: TDataSource;
     xOrdenH: TFIBDataSetRO;
     FIBStringField2: TFIBStringField;
     xTempFECHA: TDateTimeField;
     xTempCANTIDAD: TFloatField;
     xTempARTICULO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure frCodBarrasGetValue(const ParName: string; var ParValue: variant);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MostrarListadoCodBarras(ejercicio, canal: integer; serie: string; codigo_ini, codigo_fin: string; numBarras, numespacios, entrada, modo, grupo, tipo: integer);
  end;

var
  ProDMLstCodBarras : TProDMLstCodBarras;

implementation

uses UDMMain, UDMListados, UEntorno, UFormGest, UProDMOrden;

{$R *.dfm}

{ TProDMLstCodBarras }

procedure TProDMLstCodBarras.MostrarListadoCodBarras(ejercicio, canal: integer; serie: string; codigo_ini, codigo_fin: string; numBarras, numespacios, entrada, modo, grupo, tipo: integer);
var
  str : string;
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_LST_COD_BARRAS(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :CODIGO_INI, :CODIGO_FIN, :NBARRAS, :ESPACIOS, :ENTRADA, :MODO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := ejercicio;
        Params.ByName['CANAL'].AsInteger := canal;
        Params.ByName['SERIE'].AsString := serie;
        Params.ByName['CODIGO_INI'].AsString := codigo_ini;
        Params.ByName['CODIGO_FIN'].AsString := codigo_fin;
        Params.ByName['NBARRAS'].AsInteger := numbarras;
        Params.ByName['ESPACIOS'].AsInteger := numespacios;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['MODO'].AsInteger := modo;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  with xTemp do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  DMListados.Imprimir(grupo, tipo, '', str, frCodBarras, nil);

  // Borra del temporal
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM PRO_TMP_COD_BARRAS WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TProDMLstCodBarras.DataModuleCreate(Sender: TObject);
begin
  // Abrir la transacción
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  xFaseD.Close;
  xFaseH.Close;
  xMaquinaD.Close;
  xMaquinaH.Close;
end;

procedure TProDMLstCodBarras.frCodBarrasGetValue(const ParName: string; var ParValue: variant);
begin
  try
     if (ParName = 'IdOrden') then
        ParValue := 'O' + ProDMOrden.QMProOrdID_ORDEN.AsString;
  except
     ParValue := 'O';
  end;
end;

procedure TProDMLstCodBarras.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

end.
