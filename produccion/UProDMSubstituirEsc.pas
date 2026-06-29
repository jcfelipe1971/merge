unit UProDMSubstituirEsc;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FR_DSet, FR_DBSet, FR_Class, DB, FIBDataSet,
  FIBDatabase, UFIBModificados, FIBDataSetRO, Fr_HYReport, FIBQuery,
  HYFIBQuery, StrUtils, FIBDataSetRW, FIBTableDataSet, Dialogs;

type
  TProDMSubstituirEsc = class(TDataModule)
     TLocal: THYTransaction;
     QTempSubsEsc: TFIBTableSet;
     DSQTempSubsEsc: TDataSource;
     QTempSubsEscID_ESC: TIntegerField;
     QTempSubsEscESCANDALLO: TIntegerField;
     QTempSubsEscCOMPUESTO: TFIBStringField;
     QTempSubsEscFECHA: TDateTimeField;
     QTempSubsEscESTADO: TIntegerField;
     QTempSubsEscENTRADA: TIntegerField;
     QTempSubsEscMARCADO: TIntegerField;
     QTempSubsEscEMPRESA: TIntegerField;
     QTempSubsEscDESC_COMPUESTO: TFIBStringField;
     QMCompuestoDestino: TFIBTableSet;
     DSQMCompuestoDestino: TDataSource;
     QMCompuestoOrigen: TFIBTableSet;
     DSQMCompuestoOrigen: TDataSource;
     QMCompuestoOrigenENTRADA: TIntegerField;
     QMCompuestoOrigenCOMPONENTE: TFIBStringField;
     QMCompuestoOrigenDESC_COMPONENTE: TFIBStringField;
     QMCompuestoOrigenMAESTRO: TIntegerField;
     QMCompuestoDestinoENTRADA: TIntegerField;
     QMCompuestoDestinoCOMPONENTE: TFIBStringField;
     QMCompuestoDestinoDESC_COMPONENTE: TFIBStringField;
     QMCompuestoDestinoUNIDADES: TIntegerField;
     QMCompuestoDestinoORDEN: TIntegerField;
     TUpdate: THYTransaction;
     QTempSubsEscUNIDADES: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QTempSubsEscMARCADOChange(Sender: TField);
     procedure QMCompuestoOrigenNewRecord(DataSet: TDataSet);
     procedure QMCompuestoDestinoNewRecord(DataSet: TDataSet);
     procedure QMCompuestoOrigenBeforePost(DataSet: TDataSet);
     procedure QMCompuestoDestinoBeforePost(DataSet: TDataSet);
     procedure QMCompuestoOrigenAfterPost(DataSet: TDataSet);
     procedure QMCompuestoOrigenCOMPONENTEChange(Sender: TField);
     procedure QMCompuestoDestinoCOMPONENTEChange(Sender: TField);
  private
     { Private declarations }
     Estado: integer;
     Filtro: string;
  public
     { Public declarations }
     comentario: string;
     grupo: integer;
     PorDefecto: integer;
     procedure CambiarSeleccion(aEstado: integer; aFiltro: string);
     procedure Marcar(Marca: integer);
     procedure RellenaTemporal(aEstado: integer);
     procedure InicializaDatos;
     function NingunoMarcado: boolean;
     procedure EjecutarReplicacion;
     procedure FiltraComp(aFiltro: string);
  end;

var
  ProDMSubstituirEsc : TProDMSubstituirEsc;

implementation

uses UDMMain, UEntorno, UDameDato, UDMListados, UFormGest, StdCtrls;

{$R *.dfm}

procedure TProDMSubstituirEsc.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QTempSubsEscFECHA.DisplayFormat := ShortDateFormat;
  Estado := 2;
  Filtro := '';

  with QMCompuestoOrigen do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
  with QMCompuestoDestino do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TProDMSubstituirEsc.QTempSubsEscMARCADOChange(Sender: TField);
begin
  with QTempSubsEsc do
  begin
     if (State = dsInsert) or (State = dsEdit) then
     begin
        Post;
     end;
  end;
end;

procedure TProDMSubstituirEsc.CambiarSeleccion(aEstado: integer; aFiltro: string);
begin
  Estado := aEstado;
  Filtro := aFiltro;

  with QTempSubsEsc do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT T.*, (SELECT SUM(UNIDADES) FROM PRO_MAT_ESC WHERE ID_ESC = T.ID_ESC AND COMPONENTE = ''' + QMCompuestoOrigenCOMPONENTE.AsString + ''') AS UNIDADES FROM PRO_TEMP_SUBS_ESC T ');
     SelectSQL.Add(' WHERE T.EMPRESA = :EMPRESA AND T.ENTRADA = :ENTRADA ');

     RefreshSQL.Clear;
     RefreshSQL.Add(' SELECT T.*, (SELECT SUM(UNIDADES) FROM PRO_MAT_ESC WHERE ID_ESC = T.ID_ESC AND COMPONENTE = ''' + QMCompuestoOrigenCOMPONENTE.AsString + ''') AS UNIDADES FROM PRO_TEMP_SUBS_ESC T ');
     RefreshSQL.Add(' WHERE T.ID_ESC=?ID_ESC AND T.ENTRADA = :ENTRADA and LINEA_MAT = T.LINEA_MAT ');

     if (Estado <> 2) then
     begin
        SelectSQL.Add(' AND ESTADO = :ESTADO ');
        Params.ByName['ESTADO'].AsInteger := Estado;
     end;

     if (Trim(Filtro) > '') then
     begin
        SelectSQL.Add(' AND UPPER (DESC_COMPUESTO) LIKE UPPER(''' + Filtro + '%'') ');
     end;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;

     Open;
  end;
end;

procedure TProDMSubstituirEsc.Marcar(Marca: integer);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE PRO_TEMP_SUBS_ESC ');
        SQL.Add(' SET MARCADO = :MARCADO ');
        SQL.Add(' WHERE EMPRESA = :EMPRESA AND ENTRADA = :ENTRADA ');

        if (Estado <> 2) then
        begin
           SQL.Add(' AND ESTADO = :ESTADO ');
           Params.ByName['ESTADO'].AsInteger := Estado;
        end;

        if (Trim(Filtro) > '') then
        begin
           SQL.Add(' AND UPPER (DESC_COMPUESTO) LIKE UPPER(''' + Filtro + '%'') ');
        end;

        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['MARCADO'].AsInteger := Marca;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QTempSubsEsc.Close;
  QTempSubsEsc.Open;
end;

procedure TProDMSubstituirEsc.RellenaTemporal(aEstado: integer);
var
  Q : THYFIBQuery;
begin
  if (QMCompuestoOrigen.State in [dsEdit, dsInsert]) then
     QMCompuestoOrigen.Post;
  if (QMCompuestoDestino.State in [dsEdit, dsInsert]) then
     QMCompuestoDestino.Post;

  // Buscamos los escandallos que contienen los articulos origen
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_RELLENA_SUBS_ESC(:ENTRADA, :EMPRESA)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  // Abrimos la tabla temporal con los escandallos
  CambiarSeleccion(aEstado, Filtro);

  // Refresco los datos
  with QMCompuestoOrigen do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  with QMCompuestoDestino do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TProDMSubstituirEsc.EjecutarReplicacion;
var
  Q : THYFIBQuery;
begin
  // Borro temporal que ya no se utilizará
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE PRO_SUBS_COMP_ESC(:ENTRADA, :EMPRESA)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  ShowMessage('Proceso finalizado');
end;

procedure TProDMSubstituirEsc.QMCompuestoOrigenNewRecord(DataSet: TDataSet);
begin
  QMCompuestoOrigenENTRADA.AsInteger := REntorno.Entrada;
  if (QMCompuestoOrigen.RecordCount = 0) then
     QMCompuestoOrigenMAESTRO.AsInteger := 1;
end;

procedure TProDMSubstituirEsc.QMCompuestoDestinoNewRecord(DataSet: TDataSet);
begin
  QMCompuestoDestinoENTRADA.AsInteger := REntorno.Entrada;
  QMCompuestoDestinoUNIDADES.AsFloat := 0;
end;

procedure TProDMSubstituirEsc.QMCompuestoOrigenBeforePost(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  QMCompuestoOrigenDESC_COMPONENTE.AsString := DameTituloArticulo(QMCompuestoOrigenCOMPONENTE.AsString);

  if (QMCompuestoOrigenMAESTRO.AsInteger = 1) then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'UPDATE PRO_TEMP_COMPUESTO_ORIGEN SET MAESTRO = 0 WHERE ENTRADA = :ENTRADA AND COMPONENTE <> :COMPONENTE';
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['COMPONENTE'].AsString := QMCompuestoOrigenCOMPONENTE.AsString;
           ExecQuery;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;
end;

procedure TProDMSubstituirEsc.QMCompuestoDestinoBeforePost(DataSet: TDataSet);
begin
  QMCompuestoDestinoDESC_COMPONENTE.AsString := DameTituloArticulo(QMCompuestoDestinoCOMPONENTE.AsString);
end;

function TProDMSubstituirEsc.NingunoMarcado: boolean;
var
  Q : THYFIBQuery;
begin
  // Veo si no hay ninguno marcado

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM PRO_TEMP_SUBS_ESC WHERE ENTRADA = :ENTRADA AND MARCADO = 1';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := (FieldByName['COUNT'].AsInteger = 0);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TProDMSubstituirEsc.QMCompuestoOrigenAfterPost(DataSet: TDataSet);
begin
  if (QMCompuestoOrigenMAESTRO.AsInteger = 1) then
  begin
     with QMCompuestoOrigen do
     begin
        Close;
        Open;
        while ((not EOF) and (QMCompuestoOrigenMAESTRO.AsInteger <> 1)) do
           Next;
     end;
  end;
end;

procedure TProDMSubstituirEsc.FiltraComp(aFiltro: string);
begin
  CambiarSeleccion(Estado, aFiltro);
end;

procedure TProDMSubstituirEsc.InicializaDatos;
var
  Q : THYFIBQuery;
begin
  // Borro temporal
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM PRO_TEMP_SUBS_ESC WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  // Borro las seleccion de articulos origen y destino
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM PRO_TEMP_COMPUESTO_ORIGEN WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM PRO_TEMP_COMPUESTO_DESTINO WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QTempSubsEsc.Close;
  QTempSubsEsc.Open;
  QMCompuestoOrigen.Close;
  QMCompuestoOrigen.Open;
  QMCompuestoDestino.Close;
  QMCompuestoDestino.Open;
end;

procedure TProDMSubstituirEsc.QMCompuestoOrigenCOMPONENTEChange(Sender: TField);
begin
  QMCompuestoOrigenDESC_COMPONENTE.AsString := DameTituloArticulo(QMCompuestoOrigenCOMPONENTE.AsString);
end;

procedure TProDMSubstituirEsc.QMCompuestoDestinoCOMPONENTEChange(Sender: TField);
begin
  QMCompuestoDestinoDESC_COMPONENTE.AsString := DameTituloArticulo(QMCompuestoDestinoCOMPONENTE.AsString);
end;

end.
