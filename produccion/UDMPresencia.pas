unit UDMPresencia;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO, FIBTableDataSet, FIBQuery, HYFIBQuery, Dialogs, Math, Graphics,
  ADODB, Forms;

type
  TDMPresencia = class(TDataModule)
     QMProCabPre: TFIBTableSet;
     TLocal: THYTransaction;
     DSQMProCabPre: TDataSource;
     QMProDetPre: TFIBTableSet;
     DSQMProDetPre: TDataSource;
     QMProCabPreEMPRESA: TIntegerField;
     QMProCabPreEJERCICIO: TIntegerField;
     QMProCabPreCANAL: TIntegerField;
     QMProCabPreSERIE: TFIBStringField;
     QMProCabPreTIPO: TFIBStringField;
     QMProCabPreRIG: TIntegerField;
     QMProCabPreOPERARIO: TIntegerField;
     QMProCabPreFECHA: TDateTimeField;
     QMProCabPreID_CAB_PRESENCIA: TIntegerField;
     QMProCabPreHORARIO: TFIBStringField;
     QMProCabPreNOTAS: TMemoField;
     QMProCabPreESTADO: TIntegerField;
     QMProDetPreEMPRESA: TIntegerField;
     QMProDetPreEJERCICIO: TIntegerField;
     QMProDetPreCANAL: TIntegerField;
     QMProDetPreSERIE: TFIBStringField;
     QMProDetPreTIPO: TFIBStringField;
     QMProDetPreRIG: TIntegerField;
     QMProDetPreLINEA: TIntegerField;
     QMProDetPreID_DET_PRESENCIA: TIntegerField;
     QMProDetPreID_CAB_PRESENCIA: TIntegerField;
     QMProDetPreTIPO_PRE: TFIBStringField;
     QMProDetPreNOTAS: TMemoField;
     QMProDetPreESTADO: TIntegerField;
     QMProDetPreID_INCIDENCIA: TIntegerField;
     TUpdate: THYTransaction;
     ADOConnection: TADOConnection;
     ADOQuery: TADOQuery;
     QMProDetPreHORA_ENTRADA: TDateTimeField;
     QMProDetPreHORA_SALIDA: TDateTimeField;
     QMProCabPreTIEMPO_TOTAL: TDateTimeField;
     QMProDetPreTIEMPO: TDateTimeField;
     QMProDetPreTIEMPO_DEC: TFloatField;
     QMProDetPreTIT_INCIDENCIA: TStringField;
     QMProCabPreNOMBRE_R_SOCIAL: TFIBStringField;
     xInfoActualizada: TFIBDataSetRO;
     DSxInfoActualizada: TDataSource;
     xInfoActualizadaEMPRESA: TIntegerField;
     xInfoActualizadaEJERCICIO: TIntegerField;
     xInfoActualizadaCANAL: TIntegerField;
     xInfoActualizadaSERIE: TFIBStringField;
     xInfoActualizadaTIPO: TFIBStringField;
     xInfoActualizadaRIG: TIntegerField;
     xInfoActualizadaID_CAB_PRESENCIA: TIntegerField;
     xInfoActualizadaOPERARIO: TIntegerField;
     xInfoActualizadaFECHA: TDateTimeField;
     xInfoActualizadaHORARIO: TFIBStringField;
     xInfoActualizadaNOTAS: TMemoField;
     xInfoActualizadaESTADO: TIntegerField;
     xInfoActualizadaTIEMPO_TOTAL: TDateTimeField;
     xInfoActualizadaID_EMPLEADO: TIntegerField;
     xInfoActualizadaNOMBRE_R_SOCIAL: TFIBStringField;
     QMProCabPreID_EMPLEADO: TIntegerField;
     QMProCabPreCALENDARIO: TIntegerField;
     QMProCabPreDESCRIPCION_HORARIO: TFIBStringField;
     QMProCabPreDESCRIPCION_CALENDARIO: TFIBStringField;
     QMProDetPreHORA_ENTRADA_ORIGINAL: TDateTimeField;
     QMProDetPreHORA_SALIDA_ORIGINAL: TDateTimeField;
     QMMarcajes: TFIBTableSet;
     DSQMMarcajes: TDataSource;
     QMProDetPreID_IMPORTACION_ENTRADA: TIntegerField;
     QMProDetPreID_IMPORTACION_SALIDA: TIntegerField;
     QMMarcajesID_OPE_PRESENCIA_MARCAJE: TIntegerField;
     QMMarcajesFECHA_MARCAJE: TDateTimeField;
     QMMarcajesIDENTIFICADOR_EMPLEADO: TFIBStringField;
     QMMarcajesIDENTIFICADOR_DISPOSITIVO: TFIBStringField;
     QMMarcajesIDENTIFICADOR_TIPO_MARCAJE: TFIBStringField;
     QMMarcajesIDENTIFICADOR_INCIDENCIA: TFIBStringField;
     QMMarcajesLATITUD: TFloatField;
     QMMarcajesLONGITUD: TFloatField;
     QMMarcajesID_EMPLEADO: TIntegerField;
     QMMarcajesID_DISPOSITIVO: TIntegerField;
     QMMarcajesTIPO_MARCAJE: TFIBStringField;
     QMMarcajesID_INCIDENCIA: TIntegerField;
     QMMarcajesESTADO: TIntegerField;
     QMMarcajesERROR_AL_PROCESAR: TFIBStringField;
     QMMarcajesID_CAB_PRESENCIA: TIntegerField;
     QMMarcajesID_DET_PRESENCIA: TIntegerField;
     QMMarcajesENTRADA_AGRUPACION: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMProCabPreAfterOpen(DataSet: TDataSet);
     procedure QMProCabPreNewRecord(DataSet: TDataSet);
     procedure QMProDetPreNewRecord(DataSet: TDataSet);
     procedure QMProCabPreOPERARIOChange(Sender: TField);
     procedure QMProDetPreBeforePost(DataSet: TDataSet);
     procedure QMProCabPreBeforePost(DataSet: TDataSet);
     procedure QMProDetPreTIT_INCIDENCIAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMProCabPreBeforeClose(DataSet: TDataSet);
     procedure QMProDetPreAfterPost(DataSet: TDataSet);
     procedure QMProDetPreHORA_SALIDASetText(Sender: TField; const Text: string);
     procedure QMProDetPreHORA_ENTRADASetText(Sender: TField; const Text: string);
     procedure QMProDetPreHORA_ENTRADAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMProDetPreHORA_SALIDAGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     SQLBase: TStrings;
  public
     { Public declarations }
     procedure BusquedaCompleja;
     function ErrorParejaMarcaje(IdCabPresencia: integer): boolean;
     procedure RecogerMarcajesImesD;
     procedure Filtra(Filtro: string);
     function DameTituloHorario(Horario: string): string;
     function DameTituloCalendario(Calendario: integer): string;
     procedure RefrescaDatos;
     procedure BuscaMarcajeConIncidencia(Direccion: char);
     procedure RecalcularDesdeMarcaje;
  end;

var
  DMPresencia : TDMPresencia;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, UFBusca, DateUtils;

{$R *.dfm}

procedure TDMPresencia.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  SQLBase := TStringList.Create;
  SQLBase.Add(' SELECT * FROM VER_CABECERA_PRESENCIA ');
  SQLBase.Add(' WHERE ');
  SQLBase.Add(' EMPRESA = :EMPRESA AND ');
  SQLBase.Add(' EJERCICIO = :EJERCICIO AND ');
  SQLBase.Add(' CANAL = :CANAL AND ');
  SQLBase.Add(' SERIE = :SERIE AND ');
  SQLBase.Add(' TIPO = :TIPO ');

  QMProCabPre.SelectSQL.Text := SQLBase.Text;
  QMProCabPre.SelectSQL.Add(' ORDER BY FECHA, RIG ');

  QMProCabPre.Params.ByName['SERIE'].AsString := 'A'; // REntorno.Serie;
  QMProCabPre.Params.ByName['TIPO'].AsString := 'PRE';
  DMMain.FiltraTabla(QMProCabPre, '11100', False);

  AsignaDisplayFormat(QMProCabPre, MascaraN, MascaraI, ShortDateFormat + ' hh:nn');
  AsignaDisplayFormat(xInfoActualizada, MascaraN, MascaraI, ShortDateFormat + ' hh:nn');
  AsignaDisplayFormat(QMProDetPre, MascaraN, MascaraI, ShortDateFormat + ' hh:nn');
  AsignaDisplayFormat(QMMarcajes, MascaraN, MascaraI, ShortDateFormat + ' hh:nn');

  QMProCabPreTIEMPO_TOTAL.DisplayFormat := ' hh:nn';
  QMProCabPreFECHA.DisplayFormat := ShortDateFormat;

  xInfoActualizadaTIEMPO_TOTAL.DisplayFormat := ' hh:nn';
  xInfoActualizadaFECHA.DisplayFormat := ShortDateFormat;

  QMProDetPreTIEMPO_DEC.DisplayFormat := '0.0000';
  QMProDetPreHORA_ENTRADA.DisplayFormat := ' hh:nn';
  QMProDetPreHORA_SALIDA.DisplayFormat := ' hh:nn';
  QMProDetPreHORA_ENTRADA_ORIGINAL.DisplayFormat := ' hh:nn';
  QMProDetPreHORA_SALIDA_ORIGINAL.DisplayFormat := ' hh:nn';
  QMProDetPreTIEMPO.DisplayFormat := ' hh:nn';

  QMMarcajesLATITUD.DisplayFormat := '0.00000';
  QMMarcajesLONGITUD.DisplayFormat := '0.00000';
end;

procedure TDMPresencia.DataModuleDestroy(Sender: TObject);
begin
  SQLBase.Free;
end;

procedure TDMPresencia.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMProCabPre, '11100', False);
  with QMProCabPre.SelectSQL do
     Text := StringReplace(UpperCase(Text), 'ORDER', 'AND TIPO=''PRE'' ORDER',
        [rfReplaceAll, rfIgnoreCase]);
  QMProCabPre.Open;
end;

procedure TDMPresencia.QMProCabPreAfterOpen(DataSet: TDataSet);
begin
  QMProDetPre.Open;
  QMMarcajes.Open;
  xInfoActualizada.Open;
end;

procedure TDMPresencia.QMProCabPreBeforeClose(DataSet: TDataSet);
begin
  QMProDetPre.Close;
  QMMarcajes.Close;
  xInfoActualizada.Close;
end;

procedure TDMPresencia.QMProCabPreNewRecord(DataSet: TDataSet);
begin
  QMProCabPreEMPRESA.Value := REntorno.Empresa;
  QMProCabPreEJERCICIO.Value := REntorno.Ejercicio;
  QMProCabPreCANAL.Value := REntorno.Canal;
  QMProCabPreSERIE.Value := 'A'; // REntorno.Serie;
  QMProCabPreFECHA.Value := Date;
  QMProCabPreTIPO.Value := 'PRE';
  QMProCabPreTIEMPO_TOTal.Value := 0;
  QMProCabPreESTADO.Value := 0;
end;

procedure TDMPresencia.QMProDetPreNewRecord(DataSet: TDataSet);
begin
  if (QMProCabPre.State = dsInsert) then
  begin
     QMProCabPre.Post;
  end;

  QMProDetPreEMPRESA.Value := QMProCabPreEMPRESA.Value;
  QMProDetPreEJERCICIO.Value := QMProCabPreEJERCICIO.Value;
  QMProDetPreCANAL.Value := QMProCabPreCANAL.Value;
  QMProDetPreSERIE.Value := QMProCabPreSERIE.Value;
  QMProDetPreRIG.Value := QMProCabPreRIG.Value;
  QMProDetPreTIPO.Value := QMProCabPreTIPO.AsString;
  QMProDetPreTIPO_PRE.Value := 'PRE';
  QMProDetPreTIEMPO.Value := 0;
  // QMProDetPreID_INCIDENCIA.Value := 0; // 0:DESCONOCIDA
  QMProDetPreID_CAB_PRESENCIA.AsInteger := QMProCabPreID_CAB_PRESENCIA.AsInteger;

  QMProDetPreESTADO.AsInteger := 0;
  QMProDetPreHORA_ENTRADA.Clear;
  QMProDetPreHORA_SALIDA.Clear;
end;

procedure TDMPresencia.QMProCabPreOPERARIOChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT HORARIO, CALENDARIO FROM OPE_EMPLEADO WHERE EMPRESA = :EMPRESA AND EMPLEADO = :OPERARIO';
        Params.ByName['EMPRESA'].AsInteger := QMProCabPreEMPRESA.AsInteger;
        Params.ByName['OPERARIO'].AsInteger := QMProCabPreOPERARIO.AsInteger;
        ExecQuery;
        QMProCabPreHORARIO.Text := FieldByName['HORARIO'].AsString;
        QMProCabPreCALENDARIO.Text := FieldByName['CALENDARIO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMPresencia.ErrorParejaMarcaje(IdCabPresencia: integer): boolean;
begin
  /// Registros donde hay una entrada pero no una salida y al reves.

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT COUNT(*) ');
        SQL.Add(' FROM PRO_DET_PRESENCIA ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_CAB_PRESENCIA = :ID_CAB_PRESENCIA AND ');
        SQL.Add(' ( ');
        SQL.Add('     (HORA_ENTRADA IS NOT NULL AND HORA_SALIDA IS NULL) OR ');
        SQL.Add('     (HORA_ENTRADA IS NULL AND HORA_SALIDA IS NOT NULL) ');
        SQL.Add(' ) ');
        Params.ByName['ID_CAB_PRESENCIA'].AsInteger := IdCabPresencia;
        ExecQuery;
        Result := (FieldByName['COUNT'].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPresencia.QMProDetPreBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MAX(LINEA) FROM PRO_DET_PRESENCIA WHERE ID_CAB_PRESENCIA = ?ID_CAB_PRESENCIA';
           Params.ByName['ID_CAB_PRESENCIA'].AsString := QMProCabPreID_CAB_PRESENCIA.AsString;
           ExecQuery;
           QMProDetPreLINEA.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMPresencia.QMProDetPreAfterPost(DataSet: TDataSet);
begin
  xInfoActualizada.Close;
  xInfoActualizada.Open;
end;

procedure TDMPresencia.QMProCabPreBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     QMProCabPreRIG.AsInteger := DMMain.Contador_EECS('A' {REntorno.Serie}, 'PRE');
end;

procedure TDMPresencia.RecogerMarcajesImesD;
var
  DS : TFIBDataSet;
  UltimaFecha : TDateTime;
  sConnectionString : string;
  Operario : integer;
  Fecha, Hora : TDateTime;
  Incidencia : string;
begin
  {Procedimiento para leer marcajes desde la base de accsess de IMesD}
  {Buscar ultima fecha importada}
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Transaction := TFIBTransaction.Create(nil);
        try
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
           end;
           Close;
           DataBase := DMMain.DataBase;
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add('SELECT PRES_ULT_FEC_IMP, PRES_CONNECTIONSTRING_IMESD FROM PRO_CONSTANTES');
           Open;
           UltimaFecha := FieldByName('PRES_ULT_FEC_IMP').AsDateTime;
           sConnectionString := FieldByName('PRES_CONNECTIONSTRING_IMESD').AsString;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     end;
  finally
     FreeAndNil(DS);
  end;

  {Conectar Access}
  with ADOConnection do
  begin
     if (Connected) then
        Close;
     ConnectionString := sConnectionString;
     Open;
  end;

  {Buscar los que sean mayores que el ultimo marcaje importado}
  with ADOQuery do
  begin
     Close;
     Parameters[0].Value := UltimaFecha;
     Open;
     First;

     {Importar marcajes}
     while not EOF do
     begin
        {Espero un poco entre cada linea importada}
        sleep(10);
        Application.ProcessMessages;
        sleep(10);
        Application.ProcessMessages;
        sleep(10);
        Application.ProcessMessages;
        sleep(10);
        Application.ProcessMessages;
        sleep(10);
        Application.ProcessMessages;
        sleep(10);
        Application.ProcessMessages;
        sleep(10);
        Application.ProcessMessages;
        sleep(10);
        Application.ProcessMessages;
        sleep(10);
        Application.ProcessMessages;
        sleep(10);
        Application.ProcessMessages;

        Operario := DameEmpleadoTarjeta(ADOQuery.FieldByName('MAR_Matricula').AsString);
        UltimaFecha := ADOQuery.FieldByName('MAR_Data').AsDateTime;
        Fecha := Trunc(UltimaFecha);
        Hora := UltimaFecha - Fecha;
        Incidencia := ADOQuery.FieldByName('MAR_Incidencia').AsString; {string(6) '000000' entrada, '000001' salida, 'nnnnnn' otros}

        if (Operario <> 0) then {Solo importo los empleados que conozca}
        begin
           {Importo mediante SP}
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'EXECUTE PROCEDURE PRO_PRES_IMPORTO_MARCAJES_IMESD(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?OPERARIO,?FECHA,?HORA,?IDENTIFICADOR_INCIDENCIA)';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['SERIE'].AsString := 'A'; // REntorno.Serie;
                 Params.ByName['TIPO'].AsString := 'PRE';
                 Params.ByName['OPERARIO'].AsInteger := Operario;
                 Params.ByName['FECHA'].AsDateTime := Fecha;
                 Params.ByName['HORA'].AsDateTime := Hora;
                 Params.ByName['IDENTIFICADOR_INCIDENCIA'].AsString := Incidencia;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        Next;
     end; {while not Eof}
  end; {with ADOQuery}

  {Desconectar Access}
  ADOQuery.Close;
  ADOConnection.Close;

  {Guardar Ultima Fecha importada}
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE PRO_CONSTANTES SET PRES_ULT_FEC_IMP = ?PRES_ULT_FEC_IMP';
        Params.ByName['PRES_ULT_FEC_IMP'].AsDateTime := UltimaFecha;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMProCabPre.Close;
  QMProCabPre.Open;
end;

procedure TDMPresencia.QMProDetPreTIT_INCIDENCIAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloIncidencia(QMProDetPreID_INCIDENCIA.AsInteger);
end;

procedure TDMPresencia.Filtra(Filtro: string);
begin
  // Se filtran los marcajes, pora cuando se haga doble click o se filtren
  with QMProCabPre do
  begin
     Close;
     SelectSQL.Text := SQLBase.Text;
     if (Trim(Filtro) <> '') then
        SelectSQL.Add(' AND (' + Filtro + ')');
     SelectSQL.Add(' ORDER BY FECHA, RIG ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := 'A'; // REntorno.Serie;
     Params.ByName['TIPO'].AsString := 'PRE';
     Open;
  end;
end;

function TDMPresencia.DameTituloHorario(Horario: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM OPE_HORARIOS WHERE EMPRESA = :EMPRESA AND HORARIO = :HORARIO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['HORARIO'].AsString := Horario;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMPresencia.DameTituloCalendario(Calendario: integer): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM OPE_CALENDARIO_C WHERE EMPRESA = :EMPRESA AND CALENDARIO = :CALENDARIO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CALENDARIO'].AsInteger := Calendario;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMPresencia.RefrescaDatos;
begin
  Refrescar(QMProCabPre, 'ID_CAB_PRESENCIA', QMProCabPreID_CAB_PRESENCIA.AsInteger, False, True);
end;

procedure TDMPresencia.BuscaMarcajeConIncidencia(Direccion: char);
begin
  if Direccion = 'S' then
  begin
     with QMProCabPre do
     begin
        Next;
        while not EOF and not ErrorParejaMarcaje(QMProCabPreID_CAB_PRESENCIA.AsInteger) do
           Next;
     end;
  end
  else
  if Direccion = 'A' then
  begin
     with QMProCabPre do
     begin
        Prior;
        while not BOF and not ErrorParejaMarcaje(QMProCabPreID_CAB_PRESENCIA.AsInteger) do
           Prior;
     end;
  end;
end;

procedure TDMPresencia.QMProDetPreHORA_SALIDASetText(Sender: TField; const Text: string);
var
  Hora : TDateTime;
begin
  if (Text = '  :  ') then
     QMProDetPreHORA_SALIDA.Clear
  else
  begin
     Hora := QMProCabPreFECHA.AsDateTime;
     Hora := RecodeHour(Hora, StrToIntDef(Copy(Text, 1, 2), 0));
     Hora := RecodeMinute(Hora, StrToIntDef(Copy(Text, 4, 2), 0));
     QMProDetPreHORA_SALIDA.AsDateTime := Hora;
  end;
end;

procedure TDMPresencia.QMProDetPreHORA_ENTRADASetText(Sender: TField; const Text: string);
var
  Hora : TDateTime;
begin
  if (Text = '  :  ') then
     QMProDetPreHORA_ENTRADA.Clear
  else
  begin
     Hora := QMProCabPreFECHA.AsDateTime;
     Hora := RecodeHour(Hora, StrToIntDef(Copy(Text, 1, 2), 0));
     Hora := RecodeMinute(Hora, StrToIntDef(Copy(Text, 4, 2), 0));
     QMProDetPreHORA_ENTRADA.AsDateTime := Hora;
  end;
end;

procedure TDMPresencia.QMProDetPreHORA_ENTRADAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if QMProDetPreHORA_ENTRADA.IsNull then
     Text := '__:__'
  else
     Text := format('%2.2d:%2.2d', [HourOf(QMProDetPreHORA_ENTRADA.AsDateTime), MinuteOf(QMProDetPreHORA_ENTRADA.AsDateTime)]);
end;

procedure TDMPresencia.QMProDetPreHORA_SALIDAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if QMProDetPreHORA_SALIDA.IsNull then
     Text := '__:__'
  else
     Text := format('%2.2d:%2.2d', [HourOf(QMProDetPreHORA_SALIDA.AsDateTime), MinuteOf(QMProDetPreHORA_SALIDA.AsDateTime)]);
end;

procedure TDMPresencia.RecalcularDesdeMarcaje;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE RECALCULA_OPE_PRESENCIA_MARCAJE(:ENTRADA, :ID_EMPLEADO, :FECHA_INICIO, :FECHA_FIN)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_EMPLEADO'].AsInteger := QMProCabPreID_EMPLEADO.AsInteger;
        Params.ByName['FECHA_INICIO'].AsDateTime := RecodeTime(QMProCabPreFECHA.AsDateTime, 0, 0, 0, 0);
        Params.ByName['FECHA_FIN'].AsDateTime := RecodeTime(QMProCabPreFECHA.AsDateTime, 23, 59, 59, 0);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaDatos;
end;

end.
