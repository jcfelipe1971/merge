unit UDMEnvio;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, IdFTP, IdFTPCommon, IdComponent;

type
  TDMEnvio = class(TDataModule)
     TLocal: THYTransaction;
     QMEnvio: TFIBTableSet;
     DSQMEnvio: TDataSource;
     DSxZona: TDataSource;
     xZona: TFIBDataSetRO;
     DSxMinCliente: TDataSource;
     xMinCliente: TFIBDataSetRO;
     IntegerField3: TIntegerField;
     DSxMaxCliente: TDataSource;
     xMaxCliente: TFIBDataSetRO;
     IntegerField4: TIntegerField;
     QMCabeceraEnvio: TFIBTableSet;
     DSQMCabeceraEnvio: TDataSource;
     QMEnvioEMPRESA: TIntegerField;
     QMEnvioEJERCICIO: TIntegerField;
     QMEnvioCANAL: TIntegerField;
     QMEnvioSERIE: TFIBStringField;
     QMEnvioTIPO: TFIBStringField;
     QMEnvioRIG: TIntegerField;
     QMEnvioFECHA_RIG: TDateTimeField;
     QMEnvioENVIO: TIntegerField;
     QMEnvioCLIENTE: TIntegerField;
     QMEnvioTITULO_CLI: TFIBStringField;
     QMEnvioTOTAL: TFloatField;
     xMinMax: TFIBDataSetRO;
     FIBStringField3: TFIBStringField;
     QMEnvioESTADO: TIntegerField;
     QMEnvioID_S: TIntegerField;
     QMCabeceraEnvioEMPRESA: TIntegerField;
     QMCabeceraEnvioENVIO: TIntegerField;
     QMCabeceraEnvioTITULO: TFIBStringField;
     QMCabeceraEnvioFECHA_ENV: TDateTimeField;
     QMCabeceraEnvioRUTA: TFIBStringField;
     QMCabeceraEnvioNOTAS: TBlobField;
     QMCabeceraEnvioSERVIDO: TIntegerField;
     QMCabeceraEnvioMATRICULA: TFIBStringField;
     TUpdate: THYTransaction;
     QMCabeceraEnvioBULTOS: TIntegerField;
     QMCabeceraEnvioPORTES: TFloatField;
     QMEnvioTERCERO: TIntegerField;
     QMEnvioDIRECCION: TIntegerField;
     QMEnvioTITULO_DIR: TFIBStringField;
     QMCabeceraEnvioMEDIDAS: TMemoField;
     QMCabeceraEnvioTITULO_ESTADO: TStringField;
     QMEnvioTRANSPORTISTA: TIntegerField;
     QMCabeceraEnvioZONA: TFIBStringField;
     xZonaZONA: TFIBStringField;
     xZonaTITULO: TFIBStringField;
     xZonaDEFECTO: TIntegerField;
     QMEnvioNOMBRE_TRANSPORTISTA: TFIBStringField;
     QMEnvioTRANSP_INSTAL: TFIBStringField;
     QMEnvioVEHICULO_ESPECIAL: TIntegerField;
     QMEnvioTIPO_VEHICULO: TFIBStringField;
     QMEnvioCONTACTO: TFIBStringField;
     QMEnvioTELEFONO: TFIBStringField;
     QMEnvioEMAIL: TFIBStringField;
     QMEnvioTIPO_SERVICIO: TFIBStringField;
     QMEnvioLOCALIDAD: TFIBStringField;
     QMEnvioCODIGO_POSTAL: TFIBStringField;
     QMEnvioPAIS: TFIBStringField;
     QMEnvioSU_REFERENCIA: TFIBStringField;
     QMEnvioPALETS: TFloatField;
     QMEnvioBULTOS: TFloatField;
     QMEnvioPESO: TFloatField;
     QMEnvioVOLUMEN: TFloatField;
     QMEnvioCODIGO_EXPEDICION: TFIBStringField;
     procedure QMCabeceraEnvioNewRecord(DataSet: TDataSet);
     procedure QMEnvioBeforeEdit(DataSet: TDataSet);
     procedure QMEnvioNewRecord(DataSet: TDataSet);
     procedure QMEnvioPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure QMCabeceraEnvioAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraEnvioRUTAChange(Sender: TField);
     procedure QMCabeceraEnvioBeforePost(DataSet: TDataSet);
     procedure QMCabeceraEnvioBeforeEdit(DataSet: TDataSet);
     procedure QMCabeceraEnvioPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure Graba(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCabeceraEnvioAfterScroll(DataSet: TDataSet);
     procedure QMCabeceraEnvioBeforeClose(DataSet: TDataSet);
     procedure QMCabeceraEnvioCalcFields(DataSet: TDataSet);
     procedure QMCabeceraEnvioZONAChange(Sender: TField);
  private
     { Private declarations }
     function DameSQL(op: integer; cerrado, abierto: boolean): string;
     procedure IdFTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: int64);
  public
     { Public declarations }
     FiltroFacturas, FiltroAlbaranes, FiltroFechas, FiltroClientes, FiltroCanal, FiltroSerie, FiltroAgrupacion, FiltroTransportista, FiltroUnCliente: string;
     FiltrarFacturas, FiltrarAlbaranes, FiltrarFechas, FiltrarClientes, FiltrarCanal, FiltrarSerie, FiltrarAgrup, FiltrarUnCliente, FiltrarTransportista: boolean;
     procedure RefrescaDetalleEnvio(DesdeFecha, HastaFecha: TDateTime);
     procedure BusquedaCompleja;
     procedure MarcarTodo(DesdeFecha, HastaFecha: TDateTime; Marcar: boolean);
     function DameMinMax(op: integer; cerrado, abierto: boolean): variant;
     procedure PonerMatricula(Matricula: string);
     procedure AbreEnvio(abre_cierra: smallint);
     procedure GrabarCabecera;
     procedure ExportarATexto(Envio: integer; Automatico: boolean = True);

  end;

var
  DMEnvio : TDMEnvio;

implementation

uses UDMMain, UEntorno, UUtiles, uFBusca, UFMEnvio, UFParada, Forms, Controls, Dialogs,
  UFSendCorreo, UParam, UDameDato;

{$R *.dfm}

procedure TDMEnvio.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMCabeceraEnvioPORTES.DisplayFormat := MascaraN;
  QMEnvioTOTAL.DisplayFormat := MascaraN;

  with QMCabeceraEnvio do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;

     if (LeeParametro('ENVULTD001', '') = 'S') then
        Last;
  end;
end;

procedure TDMEnvio.QMCabeceraEnvioNewRecord(DataSet: TDataSet);
begin
  QMCabeceraEnvioEMPRESA.AsInteger := REntorno.Empresa;
  QMCabeceraEnvioFECHA_ENV.AsDateTime := REntorno.FechaTrab;
  QMCabeceraEnvioSERVIDO.AsInteger := 0;
  QMCabeceraEnvioBULTOS.AsInteger := 0;
  QMCabeceraEnvioPORTES.AsInteger := 0;

  FMEnvio.AInicializarFiltrosExecute(nil);
  // RefrescaDetalleEnvio;
end;

procedure TDMEnvio.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCabeceraEnvio, '10000', 1 = 1);

  if (LeeParametro('ENVULTD001', '') = 'S') then
     QMCabeceraEnvio.Last;
end;

procedure TDMEnvio.QMEnvioBeforeEdit(DataSet: TDataSet);
begin
  if (QMCabeceraEnvioSERVIDO.AsInteger = 1) then
  begin
     raise Exception.Create(_('Documento Bloqueado'));
     DataSet.Cancel;
  end
  else
  if (QMCabeceraEnvio.State = dsInsert) or (QMCabeceraEnvio.State = dsEdit) then
  begin
     QMCabeceraEnvio.Post;
     QMEnvio.Edit;
  end;
end;

procedure TDMEnvio.QMEnvioNewRecord(DataSet: TDataSet);
begin
  if QMEnvio.State = dsInsert then
     DataSet.Cancel;
end;

procedure TDMEnvio.QMEnvioPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if DataSet.State = dsEdit then
     DataSet.Cancel;
end;

procedure TDMEnvio.QMCabeceraEnvioAfterOpen(DataSet: TDataSet);
begin
  xZona.Open;
  QMEnvio.Open;
end;

procedure TDMEnvio.QMCabeceraEnvioRUTAChange(Sender: TField);
begin
  with xZona do
  begin
     Close;
     Open;
  end;
end;

procedure TDMEnvio.QMCabeceraEnvioBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     QMCabeceraEnvioENVIO.AsInteger := DMMain.Contador_Libre('ENV',
        QMCabeceraEnvioENVIO.AsInteger);
end;

procedure TDMEnvio.MarcarTodo(DesdeFecha, HastaFecha: TDateTime; Marcar: boolean);
var
  Filtro : string;
begin
  DesdeFecha := HourIntoDate(DesdeFecha, '00:00:00');
  HastaFecha := HourIntoDate(HastaFecha, '23:59:59');

  Filtro := '';
  if FiltrarFacturas then
     Filtro := Filtro + FiltroFacturas;
  if FiltrarAlbaranes then
     Filtro := Filtro + FiltroAlbaranes;
  if FiltrarClientes then
     Filtro := Filtro + FiltroClientes;
  if FiltrarCanal then
     Filtro := Filtro + FiltroCanal;
  if FiltrarSerie then
     Filtro := Filtro + FiltroSerie;
  if FiltrarAgrup then
     Filtro := Filtro + FiltroAgrupacion;
  if FiltrarFechas then
     Filtro := Filtro + FiltroFechas;
  if FiltrarTransportista then
     Filtro := Filtro + FiltroTransportista;
  if FiltrarUnCliente then
     Filtro := Filtro + FiltroUnCliente;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE VER_DETALLE_ENVIO ');
        SQL.Add(' SET ');
        SQL.Add(' ENVIO = :ENVIO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' ESTADO <> 6 AND ');
        SQL.Add(' ((TIPO = ''ALB'') OR (TIPO = ''FAC'')) AND ');
        SQL.Add(' ENVIO = :OLD_ENVIO ');
        SQL.Add(Filtro);

        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEnvioEMPRESA.AsInteger;

        if Marcar then
        begin
           Params.ByName['ENVIO'].AsInteger := QMCabeceraEnvioENVIO.AsInteger;
           Params.ByName['OLD_ENVIO'].AsInteger := -1;
        end
        else
        begin
           Params.ByName['ENVIO'].AsInteger := -1;
           Params.ByName['OLD_ENVIO'].AsInteger := QMCabeceraEnvioENVIO.AsInteger;
        end;

        if FiltrarFechas then
        begin
           Params.ByName['FECHAD'].AsDateTime := DesdeFecha;
           Params.ByName['FECHAH'].AsDateTime := HastaFecha;
        end;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with QMEnvio do
  begin
     Close;
     Open;
  end;
end;

procedure TDMEnvio.RefrescaDetalleEnvio(DesdeFecha, HastaFecha: TDateTime);
begin
  DesdeFecha := HourIntoDate(DesdeFecha, '00:00:00');
  HastaFecha := HourIntoDate(HastaFecha, '23:59:59');

  with QMEnvio do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_DETALLE_ENVIO ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ((EMPRESA = ?EMPRESA) AND ');
     SelectSQL.Add(' (ENVIO = :ENVIO)) ');

     if FiltrarFacturas or FiltrarAlbaranes or FiltrarClientes or FiltrarCanal or FiltrarSerie or FiltrarAgrup or FiltrarFechas or FiltrarTransportista or FiltrarUnCliente then
     begin
        SelectSQL.Add(' OR ( ');
        SelectSQL.Add(' (EMPRESA = ?EMPRESA) AND ');
        SelectSQL.Add(' (ENVIO = -1) ');
        if FiltrarFacturas then
           SelectSQL.Add(FiltroFacturas);
        if FiltrarAlbaranes then
           SelectSQL.Add(FiltroAlbaranes);
        if FiltrarClientes then
           SelectSQL.Add(FiltroClientes);
        if FiltrarCanal then
           SelectSQL.Add(FiltroCanal);
        if FiltrarSerie then
           SelectSQL.Add(FiltroSerie);
        if FiltrarAgrup then
           SelectSQL.Add(FiltroAgrupacion);
        if FiltrarFechas then
           SelectSQL.Add(FiltroFechas);
        if FiltrarTransportista then
           SelectSQL.Add(FiltroTransportista);
        if FiltrarUnCliente then
           SelectSQL.Add(FiltroUnCliente);
        SelectSQL.Add(' ) ');
     {
     end
     else
     begin
        SelectSQL.Add(' OR ( ');
        SelectSQL.Add(' (EMPRESA = ?EMPRESA) AND ');
        SelectSQL.Add(' (ENVIO = -1)) ');
     }
     end;

     SelectSQL.Add(' ORDER BY FECHA_RIG DESC ');

     Params.ByName['EMPRESA'].AsInteger := QMCabeceraEnvioEMPRESA.AsInteger;
     Params.ByName['ENVIO'].AsInteger := QMCabeceraEnvioENVIO.AsInteger;
     if FiltrarFechas then
     begin
        Params.ByName['FECHAD'].AsDateTime := DesdeFecha;
        Params.ByName['FECHAH'].AsDateTime := HastaFecha;
     end;

     Open;
  end;
end;

function TDMEnvio.DameSQL(op: integer; cerrado, abierto: boolean): string;
begin
  case op of
     1: Result := 'SELECT MIN(CANAL)AS RESULTADO FROM EMP_CANALES WHERE EMPRESA=?EMPRESA';
     2: Result := 'SELECT MAX(CANAL)AS RESULTADO FROM EMP_CANALES WHERE EMPRESA=?EMPRESA';
     3:
     begin
        if cerrado then
           Result :=
              'SELECT MIN(RIG)AS RESULTADO FROM GES_CABECERAS_S WHERE EMPRESA=?EMPRESA AND ESTADO = 5'
        else
           Result :=
              'SELECT MIN(RIG)AS RESULTADO FROM GES_CABECERAS_S WHERE EMPRESA=?EMPRESA AND ESTADO <> 5';

        if cerrado and abierto then
           Result :=
              'SELECT MIN(RIG)AS RESULTADO FROM GES_CABECERAS_S WHERE EMPRESA=?EMPRESA';
     end;
     4:
     begin
        if cerrado then
           Result :=
              'SELECT MAX(RIG)AS RESULTADO FROM GES_CABECERAS_S WHERE EMPRESA=?EMPRESA AND ESTADO = 5'
        else
           Result :=
              'SELECT MAX(RIG)AS RESULTADO FROM GES_CABECERAS_S WHERE EMPRESA=?EMPRESA AND ESTADO <> 5';

        if cerrado and abierto then
           Result :=
              'SELECT MIN(RIG)AS RESULTADO FROM GES_CABECERAS_S WHERE EMPRESA=?EMPRESA';
     end;
     5: Result := 'SELECT MIN(SERIE)AS RESULTADO FROM EMP_SERIES WHERE EMPRESA=?EMPRESA';
     6: Result := 'SELECT MAX(SERIE)AS RESULTADO FROM EMP_SERIES WHERE EMPRESA=?EMPRESA';
     7: Result := 'SELECT MIN(AGRUPACION)AS RESULTADO FROM EMP_AGRUPACIONES_CLI WHERE EMPRESA=?EMPRESA';
     8: Result := 'SELECT MAX(AGRUPACION)AS RESULTADO FROM EMP_AGRUPACIONES_CLI WHERE EMPRESA=?EMPRESA';
     9: Result := 'SELECT MIN(ACREEDOR)AS RESULTADO FROM EMP_ACREEDORES WHERE EMPRESA=?EMPRESA AND TIPO=7 AND BAJA=0';
     10: Result := 'SELECT MAX(ACREEDOR)AS RESULTADO FROM EMP_ACREEDORES WHERE EMPRESA=?EMPRESA AND TIPO=7 AND BAJA=0';
     11: Result := 'SELECT MIN(RIG)AS RESULTADO FROM GES_CABECERAS_S WHERE EMPRESA=?EMPRESA AND TIPO = ''ALB''';
     12: Result := 'SELECT MAX(RIG)AS RESULTADO FROM GES_CABECERAS_S WHERE EMPRESA=?EMPRESA AND TIPO = ''ALB''';
     13:
     begin
        if cerrado then
           Result :=
              'SELECT MIN(RIG)AS RESULTADO FROM GES_CABECERAS_S WHERE EMPRESA=?EMPRESA AND TIPO = ''FAC'' AND ESTADO = 5'
        else
           Result :=
              'SELECT MIN(RIG)AS RESULTADO FROM GES_CABECERAS_S WHERE EMPRESA=?EMPRESA AND TIPO = ''FAC'' AND ESTADO <> 5';

        if cerrado and abierto then
           Result :=
              'SELECT MIN(RIG)AS RESULTADO FROM GES_CABECERAS_S WHERE EMPRESA=?EMPRESA AND TIPO = ''FAC''';
     end;
     14:
     begin
        if cerrado then
           Result :=
              'SELECT MAX(RIG)AS RESULTADO FROM GES_CABECERAS_S WHERE EMPRESA=?EMPRESA AND TIPO = ''FAC'' AND ESTADO = 5'
        else
           Result :=
              'SELECT MAX(RIG)AS RESULTADO FROM GES_CABECERAS_S WHERE EMPRESA=?EMPRESA AND TIPO = ''FAC'' AND ESTADO <> 5';

        if cerrado and abierto then
           Result :=
              'SELECT MIN(RIG)AS RESULTADO FROM GES_CABECERAS_S WHERE EMPRESA=?EMPRESA AND TIPO = ''FAC''';
     end;
  end;
end;

function TDMEnvio.DameMinMax(op: integer; cerrado, abierto: boolean): variant;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := DameSQL(op, cerrado, abierto);
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        if not FieldByName['RESULTADO'].IsNull then
           Result := FieldByName['RESULTADO'].Value
        else
           Result := '';
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMEnvio.PonerMatricula(Matricula: string);
begin
  if (QMCabeceraEnvioMATRICULA.AsString <> '') then
     QMCabeceraEnvioMATRICULA.AsString := QMCabeceraEnvioMATRICULA.AsString +
        ' ' + Matricula
  else
     QMCabeceraEnvioMATRICULA.AsString := Matricula;
end;

procedure TDMEnvio.AbreEnvio(abre_cierra: smallint);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_ENVIO_ABRE_CIERRA(:EMPRESA, :ENVIO, :SERVIDO)';
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEnvioEMPRESA.AsInteger;
        Params.ByName['ENVIO'].AsInteger := QMCabeceraEnvioENVIO.AsInteger;
        Params.ByName['SERVIDO'].AsInteger := abre_cierra;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMCabeceraEnvio.Refresh;
end;

procedure TDMEnvio.QMCabeceraEnvioBeforeEdit(DataSet: TDataSet);
begin
  if (QMCabeceraEnvioSERVIDO.AsInteger = 1) then
  begin
     raise Exception.Create(_('Documento Bloqueado'));
     DataSet.Cancel;
  end;
end;

procedure TDMEnvio.QMCabeceraEnvioPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if (QMCabeceraEnvio.State = dsInsert) then
  begin
     QMCabeceraEnvioENVIO.Clear;
     // DMMain.TContador.Rollback;
  end;
end;

procedure TDMEnvio.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
  if (QMCabeceraEnvioENVIO.AsInteger > 0) then
     FMEnvio.AjustaCheckEnvio('ENVIO', QMCabeceraEnvioENVIO.AsInteger)
  else
     FMEnvio.AjustaCheckEnvio('ENVIO', -1);
end;

procedure TDMEnvio.GrabarCabecera;
begin
  if (QMCabeceraEnvio.State = dsInsert) or (QMCabeceraEnvio.State = dsEdit) then
     QMCabeceraEnvio.Post;
end;

procedure TDMEnvio.QMCabeceraEnvioAfterScroll(DataSet: TDataSet);
begin
  if (Assigned(FMEnvio)) then
  begin
     if (QMCabeceraEnvioENVIO.AsInteger > 0) then
        FMEnvio.AjustaCheckEnvio('ENVIO', QMCabeceraEnvioENVIO.AsInteger)
     else
        FMEnvio.AjustaCheckEnvio('ENVIO', -1);
  end;
end;

procedure TDMEnvio.QMCabeceraEnvioBeforeClose(DataSet: TDataSet);
begin
  QMEnvio.Close;
  xZona.Close;
end;

procedure TDMEnvio.QMCabeceraEnvioCalcFields(DataSet: TDataSet);
begin
  if QMCabeceraEnvioSERVIDO.AsInteger = 0 then
     QMCabeceraEnvioTITULO_ESTADO.AsString := DameTituloEstado(0)
  else
     QMCabeceraEnvioTITULO_ESTADO.AsString := DameTituloEstado(5);
end;

procedure TDMEnvio.ExportarATexto(Envio: integer; Automatico: boolean = True);
var
  DS : TFIBDataSet;
  ts : TStrings;
  CarpetaLocal, Fichero, NombreFichero, s : string;
  EnviarPorFtp, HostFtp, UserFtp, PasswordFtp, RutaFtp : string;
  PortFtp : integer;
begin
  {
  Datos en INI para la creacion automatica
  [ExportacionEnvioTransportista]
  CarpetaLocal - Carpeta donde generara el fichero.
  EnviarPorFtp - Por defecto N. Si tiene valor S intentara la subida por ftp del fichero.
  Host - Servidor ftp.
  Port - Por defecto 21. Puerto de conexion.
  User - Usuario ftp.
  Password - Contrasenya ftp sin encriptar. Despues se guarda encriptada.
  RutaFTP - Carpeta del ftp donde dejar el fichero.
  }

  if (Automatico) then
     CarpetaLocal := IncludeTrailingPathDelimiter(LeeDatoIni('ExportacionEnvioTransportista', 'CarpetaLocal', DameTempPath))
  else
     CarpetaLocal := IncludeTrailingPathDelimiter(LeeDatoIni('ExportacionEnvioTransportista', 'CarpetaLocal', GetSpecialFolderPath(CSIDL_PERSONAL, True)));

  EnviarPorFtp := LeeDatoIni('ExportacionEnvioTransportista', 'EnviarPorFtp', 'N');
  HostFtp := LeeDatoIni('ExportacionEnvioTransportista', 'Host', '');
  PortFtp := LeeDatoIni('ExportacionEnvioTransportista', 'Port', 21);
  UserFtp := LeeDatoIni('ExportacionEnvioTransportista', 'User', '');
  RutaFtp := LeeDatoIni('ExportacionEnvioTransportista', 'RutaFTP', '');
  PasswordFtp := LeeDatoIni('ExportacionEnvioTransportista', 'Password', '-');

  // Si no existe identificador, creo uno vacio
  if (PasswordFtp = '-') then
     EscribeDatoIni('ExportacionEnvioTransportista', 'Password', '')
  else
  begin
     // Si existe lo encripto
     // La divido en dos mitades para poder guardar claves de mas de 12 digitos
     if (PasswordFtp <> '') then
     begin
        // Si esta la clave, la encripto y la borro
        EscribeDatoIni('ExportacionEnvioTransportista', 'PasswordEnc1', CodificaClave(Copy(PasswordFtp, 1, 12)));
        EscribeDatoIni('ExportacionEnvioTransportista', 'PasswordEnc2', CodificaClave(Copy(PasswordFtp, 13, 24)));
        EscribeDatoIni('ExportacionEnvioTransportista', 'Password', '');
     end;
  end;
  PasswordFtp := DescodificaClave(LeeDatoIni('ExportacionEnvioTransportista', 'PasswordEnc2', ''));
  PasswordFtp := DescodificaClave(LeeDatoIni('ExportacionEnvioTransportista', 'PasswordEnc1', '')) + PasswordFtp;

  // Guardo valores para que genere las lineas si no están generadas
  EscribeDatoIni('ExportacionEnvioTransportista', 'CarpetaLocal', CarpetaLocal);
  EscribeDatoIni('ExportacionEnvioTransportista', 'EnviarPorFtp', EnviarPorFtp);
  EscribeDatoIni('ExportacionEnvioTransportista', 'Host', HostFtp);
  EscribeDatoIni('ExportacionEnvioTransportista', 'Port', PortFtp);
  EscribeDatoIni('ExportacionEnvioTransportista', 'User', UserFtp);
  EscribeDatoIni('ExportacionEnvioTransportista', 'RutaFTP', RutaFtp);

  NombreFichero := format(_('Envio-%d.txt'), [Envio]);
  if (Automatico) then
  begin
     // Generacion del fichero en local para despues subirlo por ftp en silencio
     Fichero := CarpetaLocal + NombreFichero;
  end
  else
  begin
     Fichero := NombreFichero;
     if not MySaveDialog(Fichero, 'TXT', CarpetaLocal) then
        Fichero := '';
  end;

  if (Fichero > '') then
  begin
     ts := TStringList.Create;
     try
        DS := TFIBDataSet.Create(nil);
        try
           with DS do
           begin
              Transaction := TFIBTransaction.Create(nil);
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 with Transaction do
                 begin
                    DefaultDatabase := DMMain.DataBase;
                    TRParams.Clear;
                    TRParams.Add('read_committed');
                    TRParams.Add('read');
                    if (not InTransaction) then
                       StartTransaction;
                 end;

                 SelectSQL.Add(' SELECT C.EMPRESA, C.ENVIO, C.RIG AS ALBARAN, SUBSTRING(T.NOMBRE_R_SOCIAL FROM 1 FOR 50) AS DESTINATARIO, ');
                 SelectSQL.Add(' SUBSTRING(D.DIR_COMPLETA_N FROM 1 FOR 80) AS DIRECCION, SUBSTRING(L.TITULO FROM 1 FOR 40) AS POBLACION, ');
                 SelectSQL.Add(' L.CODIGO_POSTAL, P.PAIS_C2 AS PAIS, ');
                 SelectSQL.Add(' (CASE FP.TIPO_EFECTO WHEN ''CON'' THEN C.LIQUIDO WHEN ''RMB'' THEN C.LIQUIDO ELSE 0 END) AS REEMBOLSO, A.BULTOS_KRI AS BULTOS, ');
                 SelectSQL.Add(' SUBSTRING(D.DIR_TELEFONO01 FROM 1 FOR 12) AS TELEFONO, SUBSTRING(T.EMAIL FROM 1 FOR 200) AS EMAIL, ');
                 SelectSQL.Add(' C.SU_REFERENCIA ');
                 SelectSQL.Add(' FROM GES_CABECERAS_S C ');
                 SelectSQL.Add(' JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO ');
                 SelectSQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON D.TERCERO = C.TERCERO AND D.DIRECCION = C.DIRECCION ');
                 SelectSQL.Add(' JOIN SYS_LOCALIDADES L ON L.ID_LOCAL = D.ID_LOCAL ');
                 SelectSQL.Add(' JOIN SYS_PAISES P ON L.PAIS = P.PAIS ');
                 SelectSQL.Add(' JOIN GES_CABECERAS_S_ALB A ON A.ID_S = C.ID_S ');
                 SelectSQL.Add(' JOIN CON_CUENTAS_GES_FP FP ON FP.EMPRESA = C.EMPRESA AND FP.EJERCICIO = C.EJERCICIO AND FP.CANAL = C.CANAL AND FP.FORMA_PAGO = C.FORMA_PAGO ');
                 SelectSQL.Add(' WHERE ');
                 SelectSQL.Add(' C.EMPRESA = :EMPRESA AND ');
                 SelectSQL.Add(' C.ENVIO = :ENVIO ');
                 SelectSQL.Add(' ORDER BY C.RIG ');

                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['ENVIO'].AsInteger := Envio;
                 Open;
                 while (not EOF) do
                 begin
                    s := FieldByName('ALBARAN').AsString + '|';
                    s := s + FieldByName('DESTINATARIO').AsString + '|';
                    s := s + FieldByName('DIRECCION').AsString + '|';
                    s := s + FieldByName('POBLACION').AsString + '|';
                    s := s + FieldByName('CODIGO_POSTAL').AsString + '|';
                    s := s + FieldByName('PAIS').AsString + '|';
                    s := s + FloatToStrDec(FieldByName('REEMBOLSO').AsFloat, '.', '0.00') + '|';
                    s := s + FieldByName('BULTOS').AsString + '|';
                    s := s + FieldByName('TELEFONO').AsString + '|';
                    s := s + FieldByName('EMAIL').AsString + '|';
                    s := s + FieldByName('SU_REFERENCIA').AsString;

                    ts.Add(s);

                    Next;
                 end;
                 Close;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;
           end;
        finally
           FreeAndNil(DS);
        end;
        ts.SaveToFile(Fichero);

        if (not Automatico) then
           ShowMessage(Format(_('Se ha creado el fichero: %s'), [Fichero]));
     finally
        ts.Free;
     end;

     if (Automatico) then
     begin
        if (EnviarPorFtp = 'S') then
        begin
           // Enviar por FTP
           with TIdFTP.Create(Self) do
           begin
              try
                 // Procedimiento que informará progreso de descarga
                 OnWork := IdFTPWork;

                 // ConnectTimeout := 10;
                 Host := HostFtp;
                 Port := PortFtp;
                 Username := UserFtp;
                 RutaFtp := RutaFtp;
                 Password := PasswordFtp;

                 Connect;
                 TransferType := ftASCII; // ftBinary

                 if (RutaFtp > '') then
                    ChangeDir(RutaFtp);

                 Put(Fichero, NombreFichero);

                 if (RutaFtp > '') then
                    ChangeDirUp;
                 Disconnect;
              finally
                 Free;
              end;
           end;

           ShowMessage(Format(_('Envío subido al ftp: %s'), [Fichero]));
        end
        else
           ShowMessage(Format(_('Se ha creado el fichero: %s'), [Fichero]));
     end;
  end;
end;

procedure TDMEnvio.IdFTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: int64);
begin
  if (Assigned(FSendCorreo)) then
  begin
     FSendCorreo.Texto(Format('%d kb transferidos', [AWorkCount div 1024]));
     Application.ProcessMessages;
  end;
end;

procedure TDMEnvio.QMCabeceraEnvioZONAChange(Sender: TField);
begin
  xZona.Close;
  xZona.Open;
end;

end.
