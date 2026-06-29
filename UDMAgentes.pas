unit UDMAgentes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBDataSetRO, SysUtils, FIBQuery, HYFIBQuery, idGlobalProtocols, ShellApi;

type
  TDMAgentes = class(TDataModule)
     QMAgentes: TFIBTableSet;
     DSQMAgentes: TDataSource;
     DSxTerceros: TDataSource;
     QMAgentesEMPRESA: TIntegerField;
     QMAgentesEJERCICIO: TIntegerField;
     QMAgentesCANAL: TIntegerField;
     QMAgentesAGENTE: TIntegerField;
     QMAgentesP_COMISION: TFloatField;
     QMAgentesTERCERO: TIntegerField;
     QMAgentesNOTAS: TBlobField;
     QMAgentesCUENTA: TFIBStringField;
     QMAgentesTITULO: TFIBStringField;
     TLocal: THYTransaction;
     xTerceros: TFIBDataSetRO;
     xTercerosNOMBRE_R_SOCIAL: TFIBStringField;
     xAgrupDisp: TFIBDataSetRO;
     DSxAgrupDisp: TDataSource;
     DSQMAgrupSonCom: TDataSource;
     QMAgrupSonCom: TFIBTableSet;
     xAgrupDispCom: TFIBDataSetRO;
     DSxAgrupDispCom: TDataSource;
     QMAgrupSonComAGRUPACION: TFIBStringField;
     QMAgrupSonComTITULO: TFIBStringField;
     QMAgrupSonComEMPRESA: TIntegerField;
     QMAgrupSonComAGENTE: TIntegerField;
     QMAgrupSonComCOMISION: TFloatField;
     DSxAgrupSon: TDataSource;
     xAgrupSon: TFIBDataSetRO;
     QMAgentesTIT_LOCALIDAD: TFIBStringField;
     QMAgentesCODIGO_POSTAL: TFIBStringField;
     xIncidencias: TFIBTableSet;
     xIncidenciasEMPRESA: TIntegerField;
     xIncidenciasINCIDENCIA: TIntegerField;
     xIncidenciasTITULO_INCIDENCIA: TFIBStringField;
     xIncidenciasFECHA: TDateTimeField;
     xIncidenciasFECHA_RECEPCION: TDateTimeField;
     xIncidenciasTIPO_TERCERO: TFIBStringField;
     xIncidenciasCOD_CLI_PRO: TIntegerField;
     xIncidenciasTERCERO: TIntegerField;
     xIncidenciasTITULO_TERCERO: TFIBStringField;
     xIncidenciasDATOS_INCIDENCIA: TBlobField;
     xIncidenciasFECHA_RESPUESTA: TDateTimeField;
     xIncidenciasRESPUESTA_INCIDENCIA: TBlobField;
     xIncidenciasID_S: TIntegerField;
     xIncidenciasID_E: TIntegerField;
     xIncidenciasDOC_EJERCICIO: TIntegerField;
     xIncidenciasDOC_SERIE: TFIBStringField;
     xIncidenciasDOC_CANAL: TIntegerField;
     xIncidenciasDOC_TIPO: TFIBStringField;
     xIncidenciasDOC_RIG: TIntegerField;
     DSxIncidencias: TDataSource;
     QMMargenes: TFIBTableSet;
     DSQMMargenes: TDataSource;
     QMMargenesEMPRESA: TIntegerField;
     QMMargenesEJERCICIO: TIntegerField;
     QMMargenesCANAL: TIntegerField;
     QMMargenesAGENTE: TIntegerField;
     QMMargenesPORCENTAJE: TFloatField;
     QMMargenesMARGEN: TFloatField;
     QMPrevision: TFIBTableSet;
     DSQMPrevision: TDataSource;
     QMPrevisionEMPRESA: TIntegerField;
     QMPrevisionEJERCICIO: TIntegerField;
     QMPrevisionCANAL: TIntegerField;
     QMPrevisionAGENTE: TIntegerField;
     QMPrevisionMARGEN: TFloatField;
     QMPrevisionPORCENTAJE: TFloatField;
     TUpdate: THYTransaction;
     xComunicaciones: TFIBTableSet;
     xComunicacionesID: TIntegerField;
     xComunicacionesEMPRESA: TIntegerField;
     xComunicacionesTIPO: TFIBStringField;
     xComunicacionesCOD_CLI_PRO: TIntegerField;
     xComunicacionesARCHIVO: TFIBStringField;
     xComunicacionesFECHA_CREACION: TDateTimeField;
     xComunicacionesFECHA_MODIFICACION: TDateTimeField;
     xComunicacionesDESCRIPCION: TFIBStringField;
     DSxComunicaciones: TDataSource;
     QMZonas: TFIBTableSet;
     DSQMZonas: TDataSource;
     QMZonasEMPRESA: TIntegerField;
     QMZonasAGENTE: TIntegerField;
     QMZonasZONA: TFIBStringField;
     QMZonasTITULO: TStringField;
     QMCalculoComisiones: TFIBTableSet;
     DSCalculoComisiones: TDataSource;
     QMAgentesSub: TFIBTableSet;
     DSQMAgentesSub: TDataSource;
     QMAgentesSubEMPRESA: TIntegerField;
     QMAgentesSubEJERCICIO: TIntegerField;
     QMAgentesSubCANAL: TIntegerField;
     QMAgentesSubAGENTE: TIntegerField;
     QMAgentesSubAGENTE_SUB: TIntegerField;
     QMAgentesSubTERCERO_SUB: TIntegerField;
     QMAgentesSubTITULO: TFIBStringField;
     QMAgentesSubP_COMISION: TFloatField;
     QMZonasP_COMISION: TFloatField;
     xAgrupDispComArt: TFIBDataSetRO;
     DSxAgrupDispComArt: TDataSource;
     QMAgrupSonComArt: TFIBTableSet;
     DSQMAgrupSonComArt: TDataSource;
     QMAgrupSonComArtAGRUPACION: TFIBStringField;
     QMAgrupSonComArtTITULO: TFIBStringField;
     QMAgrupSonComArtEMPRESA: TIntegerField;
     QMAgrupSonComArtAGENTE: TIntegerField;
     QMAgrupSonComArtCOMISION: TFloatField;
     QMAgrupSonComArtTIPO: TFIBStringField;
     QMAgentesBAJA: TIntegerField;
     QMAgentesFECHA_BAJA: TDateTimeField;
     QMAgentesMOTIVO_BAJA: TFIBStringField;
     QMCalculoComisionesAgrupado: TFIBDataSetRO;
     DSCalculoComisionesAgrupado: TDataSource;
     QMCalculoComisionesAgrupadoSERIE_FAC: TFIBStringField;
     QMCalculoComisionesAgrupadoRIG_FAC: TIntegerField;
     QMCalculoComisionesAgrupadoB_IMPONIBLE: TFloatField;
     QMCalculoComisionesAgrupadoLIQUIDO: TFloatField;
     QMCalculoComisionesAgrupadoP_COMISION_AGENTE: TFloatField;
     QMCalculoComisionesAgrupadoP_COMISION_ESCALADO: TFloatField;
     QMCalculoComisionesAgrupadoP_COMISION: TFloatField;
     QMCalculoComisionesAgrupadoZONA: TFIBStringField;
     QMCalculoComisionesAgrupadoP_COMISION_ZONA: TFloatField;
     QMCalculoComisionesAgrupadoCOMISION: TFloatField;
     QMCalculoComisionesAgrupadoBLOQUEADO: TIntegerField;
     QMCalculoComisionesAgrupadoFECHA: TDateTimeField;
     QMCalculoComisionesAgrupadoID_S: TIntegerField;
     QMCalculoComisionesAgrupadoEJERCICIO_FAC: TIntegerField;
     QMCalculoComisionesAgrupadoTITULO_CLI: TFIBStringField;
     QMAgentesENVIAR_COPIA_FAC: TIntegerField;
     xIncidenciasENTRADA: TIntegerField;
     xIncidenciasDIRECCION: TIntegerField;
     xIncidenciasDIR_NOMBRE: TFIBStringField;
     xIncidenciasAGENTE: TIntegerField;
     xIncidenciasCONTACTO: TIntegerField;
     xIncidenciasTIT_CONTACTO: TFIBStringField;
     xIncidenciasCONTACTO2: TIntegerField;
     xIncidenciasTIT_CONTACTO2: TFIBStringField;
     xIncidenciasCONTACTO3: TIntegerField;
     xIncidenciasTIT_CONTACTO3: TFIBStringField;
     xIncidenciasTIT_AGENTE: TFIBStringField;
     xIncidenciasTIPO_INCIDENCIA_KRI: TFIBStringField;
     xIncidenciasTIT_TIPO_INCIDENCIA_KRI: TFIBStringField;
     xIncidenciasUSUARIO: TIntegerField;
     xIncidenciasNOMBRE_USUARIO: TFIBStringField;
     xIncidenciasHORAS: TFloatField;
     xIncidenciasFINALIZADO: TIntegerField;
     QMAgentesFECHA_ALTA: TDateTimeField;
     QMCalculoComisionesAgrupadoCLIENTE: TIntegerField;
     QMCalculoComisionesAgrupadoPAGADO: TIntegerField;
     QMCalculoComisionesEMPRESA: TIntegerField;
     QMCalculoComisionesCANAL: TIntegerField;
     QMCalculoComisionesAGENTE: TIntegerField;
     QMCalculoComisionesEMPRESA_FAC: TIntegerField;
     QMCalculoComisionesEJERCICIO_FAC: TIntegerField;
     QMCalculoComisionesCANAL_FAC: TIntegerField;
     QMCalculoComisionesSERIE_FAC: TFIBStringField;
     QMCalculoComisionesTIPO_FAC: TFIBStringField;
     QMCalculoComisionesRIG_FAC: TIntegerField;
     QMCalculoComisionesLINEA_FAC: TIntegerField;
     QMCalculoComisionesID_S: TIntegerField;
     QMCalculoComisionesID_DETALLES_S: TIntegerField;
     QMCalculoComisionesARTICULO: TFIBStringField;
     QMCalculoComisionesUNIDADES: TFloatField;
     QMCalculoComisionesPRECIO: TFloatField;
     QMCalculoComisionesDESCUENTO: TFloatField;
     QMCalculoComisionesDESCUENTO_2: TFloatField;
     QMCalculoComisionesDESCUENTO_3: TFloatField;
     QMCalculoComisionesP_COSTE: TFloatField;
     QMCalculoComisionesB_IMPONIBLE: TFloatField;
     QMCalculoComisionesLIQUIDO: TFloatField;
     QMCalculoComisionesFECHA: TDateTimeField;
     QMCalculoComisionesP_COMISION_AGENTE: TFloatField;
     QMCalculoComisionesP_COMISION_ESCALADO: TFloatField;
     QMCalculoComisionesP_COMISION: TFloatField;
     QMCalculoComisionesCOMISION: TFloatField;
     QMCalculoComisionesBLOQUEADO: TIntegerField;
     QMCalculoComisionesID_E: TIntegerField;
     QMCalculoComisionesID_DETALLES_E: TIntegerField;
     QMCalculoComisionesZONA: TFIBStringField;
     QMCalculoComisionesP_COMISION_ZONA: TFloatField;
     QMCalculoComisionesPAGADO: TIntegerField;
     QMCalculoComisionesFECHA_PAGO: TDateTimeField;
     QMCalculoComisionesCLIENTE: TIntegerField;
     QMCalculoComisionesTITULO_CLI: TFIBStringField;
     QMCalculoComisionesTITULO_ART: TFIBStringField;
     QMAgentesCUENTA_PAGO: TFIBStringField;
     QMAgentesTITULO_REGION: TFIBStringField;
     QMAgentesTITULO_PROVINCIA: TFIBStringField;
     QMAgentesTITULO_POBLACION: TFIBStringField;
     QMAgentesTITULO_CODIGO_POSTAL: TFIBStringField;
     QMAgentesCODIGO_NTV: TFIBStringField;
     QMAgentesENVIAR_COPIA_OFC: TIntegerField;
     QMAgentesENVIAR_COPIA_PEC: TIntegerField;
     QMAgentesENVIAR_COPIA_ALB: TIntegerField;
     procedure DMAgentesCreate(Sender: TObject);
     procedure QMAgentesNewRecord(DataSet: TDataSet);
     procedure QMAgentesTERCEROChange(Sender: TField);
     procedure QMAgentesBeforePost(DataSet: TDataSet);
     procedure QMAgentesAfterOpen(DataSet: TDataSet);
     procedure DMAgentesDestroy(Sender: TObject);
     procedure QMAgentesPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure QMAgentesBeforeEdit(DataSet: TDataSet);
     procedure QMMargenesNewRecord(DataSet: TDataSet);
     procedure QMPrevisionNewRecord(DataSet: TDataSet);
     procedure AntesDeEditarMargenes(DataSet: TDataSet);
     procedure AntesDeEditarPrevision(DataSet: TDataSet);
     procedure xComunicacionesBeforePost(DataSet: TDataSet);
     procedure xComunicacionesNewRecord(DataSet: TDataSet);
     procedure QMZonasTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMZonasNewRecord(DataSet: TDataSet);
     procedure QMAgentesBeforeClose(DataSet: TDataSet);
     procedure QMAgentesSubNewRecord(DataSet: TDataSet);
     procedure QMCalculoComisionesBeforePost(DataSet: TDataSet);
     //procedure QMAgrupSonComArtAfterEdit(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     SQLBase: TStrings;
     cuentaold: string;
     PlantillaComunicaciones: string;
     function BusquedaCompleja: integer;
     procedure CambiarTercero(Tercero: integer);
     procedure AgrupacionVacia;
     procedure AgrupacionVaciaCom(tipo: string);
     procedure AgrupacionRellena;
     procedure AgrupacionRellenaCom(tipo: string);
     function HayDetalle: boolean;
     procedure AbrirMargenes;
     procedure CerrarMargenes;
     procedure TraspasarPrevMargenes;
     procedure AbrirCalculoComisiones(DFecha, HFecha: TDateTime);
     procedure CerrarCalculoComisiones;
     procedure RecalcularComisiones(Agente: integer);
     procedure EstableceBloqueoComisiones(Bloqueado: boolean);
     procedure QuitaFiltros;
     procedure FiltraAgente(Agente: integer);
     procedure MarcaComisionesPagado(Fecha: TDateTime; Pagado: boolean);
     procedure FiltraAgrupacionDisponible(Filtro: string);
  end;

var
  DMAgentes : TDMAgentes;

implementation

uses UDMMain, UEntorno, UUtiles, uFBusca, UFMain, UFParada, UDameDato;

{$R *.DFM}

procedure TDMAgentes.DMAgentesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Creamos la sentencia SQL básica para QMAgentes
  SQLBase := TStringList.Create;
  SQLBase.Add(' SELECT * FROM VER_AGENTES_CUENTAS ');
  SQLBase.Add(' WHERE ');
  SQLBase.Add(' EMPRESA = ?EMPRESA AND ');
  SQLBase.Add(' EJERCICIO = ?EJERCICIO AND ');
  SQLBase.Add(' CANAL = ?CANAL ');
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMAgentesP_COMISION.DisplayFormat := MascaraP;
  QMAgrupSonComCOMISION.DisplayFormat := MascaraP;

  QMMargenesMARGEN.DisplayFormat := MascaraN;
  QMMargenesPORCENTAJE.DisplayFormat := MascaraN;
  QMPrevisionMARGEN.DisplayFormat := MascaraN;
  QMPrevisionPORCENTAJE.DisplayFormat := MascaraN;

  QMZonasP_COMISION.DisplayFormat := MascaraP;
  QMAgentesSubP_COMISION.DisplayFormat := MascaraP;

  QMCalculoComisionesUNIDADES.DisplayFormat := MascaraI;
  QMCalculoComisionesPRECIO.DisplayFormat := MascaraN;
  QMCalculoComisionesDESCUENTO.DisplayFormat := MascaraP;
  QMCalculoComisionesDESCUENTO_2.DisplayFormat := MascaraP;
  QMCalculoComisionesDESCUENTO_3.DisplayFormat := MascaraP;
  QMCalculoComisionesP_COSTE.DisplayFormat := MascaraN;
  QMCalculoComisionesB_IMPONIBLE.DisplayFormat := MascaraN;
  QMCalculoComisionesLIQUIDO.DisplayFormat := MascaraN;
  QMCalculoComisionesFECHA.DisplayFormat := ShortDateFormat;
  QMCalculoComisionesP_COMISION_AGENTE.DisplayFormat := MascaraP;
  QMCalculoComisionesP_COMISION_ESCALADO.DisplayFormat := MascaraP;
  QMCalculoComisionesP_COMISION.DisplayFormat := MascaraP;
  QMCalculoComisionesCOMISION.DisplayFormat := MascaraL;
  QMCalculoComisionesP_COMISION_ZONA.DisplayFormat := MascaraP;
  QMCalculoComisionesFECHA_PAGO.DisplayFormat := ShortDateFormat;

  QMCalculoComisionesAgrupadoB_IMPONIBLE.DisplayFormat := MascaraN;
  QMCalculoComisionesAgrupadoLIQUIDO.DisplayFormat := MascaraN;
  QMCalculoComisionesAgrupadoFECHA.DisplayFormat := ShortDateFormat;
  QMCalculoComisionesAgrupadoP_COMISION_AGENTE.DisplayFormat := MascaraP;
  QMCalculoComisionesAgrupadoP_COMISION_ESCALADO.DisplayFormat := MascaraP;
  QMCalculoComisionesAgrupadoP_COMISION.DisplayFormat := MascaraP;
  QMCalculoComisionesAgrupadoCOMISION.DisplayFormat := MascaraN;
  QMCalculoComisionesAgrupadoP_COMISION_ZONA.DisplayFormat := MascaraP;

  QMAgrupSonComArtCOMISION.DisplayFormat := MascaraP;

  QMAgentes.SelectSQL.Text := SQLBase.Text;
  QMAgentes.SelectSQL.Add(' ORDER BY AGENTE ');
  if not (FMain.autagente) then
     DMMain.FiltraTabla(QMAgentes, '11100', True);
end;

procedure TDMAgentes.DMAgentesDestroy(Sender: TObject);
begin
  SQLBase.Free;
end;

procedure TDMAgentes.QMAgentesNewRecord(DataSet: TDataSet);
begin
  QMAgentesEMPRESA.AsInteger := REntorno.Empresa;
  QMAgentesEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMAgentesCANAL.AsInteger := REntorno.Canal;
  QMAgentesP_COMISION.AsFloat := 0;
  QMAgentesTERCERO.AsInteger := REntorno.Tercero;
  QMAgentesENVIAR_COPIA_FAC.AsInteger := 0;
end;

procedure TDMAgentes.QMAgentesTERCEROChange(Sender: TField);
begin
  with xTerceros do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := Sender.AsInteger;
     Open;
  end;
end;

procedure TDMAgentes.QMAgentesBeforePost(DataSet: TDataSet);
var
  Semilla, Cuenta : string;
  Existe : boolean;
  Crea : boolean;
begin
  Semilla := DMMain.DameSemillaCuentaGestion(SemComisionistas, 1);
  Cuenta := QMAgentesCUENTA.AsString;
  if (DataSet.State = dsInsert) then
     QMAgentesAGENTE.AsInteger := DMMain.Contador_Libre('XAG', QMAgentesAGENTE.AsInteger);

  if (Length(Cuenta) < REntorno.DigitosSub) or (Cuenta = '') then
  begin
     // Si en cuenta estan los primeros digitos de la cuenta, los utilizo como semilla
     if (Length(Cuenta + '.') = Length(Semilla)) then
        Semilla := Cuenta + '.';

     Cuenta := ExpandirCadena(Semilla + QMAgentesAGENTE.AsString);
     // Si el interfijo es diferente del nro de cliente, utilizo solo los 3 primeros numeros de la semilla
     if (DMMain.EstadoKri(326) = 1) then
     begin
        if (StrToInt(Copy(Cuenta, Length(cuenta) - Length(QMAgentesAGENTE.AsString) + 1,
           Length(QMAgentesAGENTE.AsString))) <> QMAgentesAGENTE.AsInteger) then
           Cuenta := ExpandirCadena(Copy(Semilla, 1, 3) + '.' + QMAgentesAGENTE.AsString);
     end;
  end;

  if (QMAgentesCUENTA.AsString <> Cuenta) then
     QMAgentesCUENTA.AsString := Cuenta;

  if (Length(Cuenta) > REntorno.DigitosSub) then
     raise Exception.Create(_('La cuenta generada excede de la estructura contable actual'));
  if (Length(Cuenta) < REntorno.DigitosSub) then
     raise Exception.Create(_('La cuenta generada tiene menos dígitos que la estructura contable actual'));

  // Control de que la cuenta ya existe
  if (DataSet.State = dsInsert) then
     cuentaold := '';

  if (cuentaold <> QMAgentesCUENTA.AsString) then
  begin
     Crea := True;
     Existe := (DameTituloCuenta(QMAgentesCUENTA.AsString) > '');

     if (Existe) then
     begin
        Crea := (Application.MessageBox(PChar(string(_('La cuenta ya existe, ¿quiere realmente utilizarla?'))),
           PChar(string(_('Confirmación'))),
           mb_iconstop + mb_yesno) = id_yes);
     end;

     if (Crea) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_GES_EXISTE(:EMPRESA, :EJERCICIO, :CANAL, :CUENTA, 3)';
              Params.ByName['EMPRESA'].AsInteger := QMAgentesEMPRESA.AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := QMAgentesEJERCICIO.AsInteger;
              Params.ByName['CANAL'].AsInteger := QMAgentesCANAL.AsInteger;
              Params.ByName['CUENTA'].AsString := QMAgentesCUENTA.AsString;
              ExecQuery;
              Existe := (FieldByName['EXISTE'].AsInteger >= 1);
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (Existe) then
        begin
           Crea := (Application.MessageBox(PChar(string(_('La cuenta ya esta usada por otro Agente, ¿quiere realmente crearlo?'))),
              PChar(string(_('Confirmación'))),
              mb_iconstop + mb_yesno) = id_yes);
        end;
     end;

     if not (Crea) then
        raise Exception.Create(_('El Agente no ha sido creado'));
  end;
end;

procedure TDMAgentes.QMAgentesAfterOpen(DataSet: TDataSet);
begin
  xTerceros.Open;
  xAgrupSon.Open;
  xAgrupDisp.Open;
  QMAgrupSonCom.Open;
  xAgrupDispCom.Open;
  xIncidencias.Open;
  QMAgentesSub.Open;
  xAgrupDispComArt.Open;
  QMAgrupSonComArt.Open;
end;

function TDMAgentes.BusquedaCompleja: integer;
begin
  Result := TFBusca.Create(Self).SeleccionaBusqueda(QMAgentes, '11100');
end;

procedure TDMAgentes.QMAgentesPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if QMAgentes.State = dsInsert then
  begin
     QMAgentesAGENTE.Clear;
     QMAgentesCUENTA.Clear;
  end;
end;

procedure TDMAgentes.CambiarTercero(Tercero: integer);
begin
  with QMAgentes do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_AGENTES_CUENTAS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND');
     SelectSQL.Add(' AGENTE = 0 ');
     SelectSQL.Add(' ORDER BY AGENTE ');
     DMMain.FiltraTabla(QMAgentes, '11100', True);
     Insert;
     FieldByName('TERCERO').AsInteger := Tercero;
  end;
end;

procedure TDMAgentes.QMAgentesBeforeEdit(DataSet: TDataSet);
begin
  cuentaold := QMAgentesCUENTA.AsString;
end;

procedure TDMAgentes.AgrupacionRellena;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_AGRUPACIONES_RELLENA_AGE(?AGRUPACION, ?EMPRESA, ?AGENTE)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['AGENTE'].AsInteger := QMAgentesAgente.AsInteger;
        Params.ByName['AGRUPACION'].AsString := xAgrupDisp.FieldByName('AGRUPACION').AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xAgrupSon.Close;
  xAgrupSon.Open;
  xAgrupDisp.Close;
  xAgrupDisp.Open;
end;

procedure TDMAgentes.AgrupacionRellenaCom(tipo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_AGRUPACIONES_AGE_RELLENA(?AGRUPACION, ?EMPRESA, ?AGENTE)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['AGENTE'].AsInteger := QMAgentesAGENTE.AsInteger;
        if (tipo = 'C') then // cliente -
           Params.ByName['AGRUPACION'].AsString := xAgrupDispCom.FieldByName('AGRUPACION').AsString
        else if (tipo = 'T') then // artículo -
           Params.ByName['AGRUPACION'].AsString := xAgrupDispComArt.FieldByName('AGRUPACION').AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (tipo = 'C') then // cliente
  begin
     QMAgrupSonCom.Close;
     QMAgrupSonCom.Open;
     xAgrupDispCom.Close;
     xAgrupDispCom.Open;
  end;

  if (tipo = 'T') then // artículo
  begin
     QMAgrupSonComArt.Close;
     QMAgrupSonComArt.Open;
     xAgrupDispComArt.Close;
     xAgrupDispComArt.Open;
  end;
end;

procedure TDMAgentes.AgrupacionVacia;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM EMP_AGRUPACIONES_AGENTES WHERE AGRUPACION = ?AGRUPACION AND EMPRESA = ?EMPRESA AND AGENTE = ?AGENTE';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['AGENTE'].AsInteger := QMAgentesAGENTE.AsInteger;
        Params.ByName['AGRUPACION'].AsString := xAgrupSon.FieldByName('AGRUPACION').AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xAgrupSon.Close;
  xAgrupSon.Open;
  xAgrupDisp.Close;
  xAgrupDisp.Open;
end;

procedure TDMAgentes.AgrupacionVaciaCom(tipo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM EMP_AGRUPACIONES_AGE WHERE AGRUPACION = ?AGRUPACION AND EMPRESA = ?EMPRESA AND AGENTE = ?AGENTE';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['AGENTE'].AsInteger := QMAgentesAGENTE.AsInteger;
        if (tipo = 'C') then  // Cliente
           Params.ByName['AGRUPACION'].AsString := QMAgrupSonCom.FieldByName('AGRUPACION').AsString
        else if (tipo = 'T') then  //Artículo
           Params.ByName['AGRUPACION'].AsString := QMAgrupSonComArt.FieldByName('AGRUPACION').AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (tipo = 'C') then  // Cliente
  begin
     QMAgrupSonCom.Close;
     QMAgrupSonCom.Open;
     xAgrupDispCom.Close;
     xAgrupDispCom.Open;
  end;

  if (tipo = 'T') then  // Artículo
  begin
     QMAgrupSonComArt.Close;
     QMAgrupSonComArt.Open;
     xAgrupDispComArt.Close;
     xAgrupDispComArt.Open;
  end;
end;

function TDMAgentes.HayDetalle: boolean;
begin
  Result := (xIncidencias.FieldByName('INCIDENCIA').AsInteger <> 0);
end;

procedure TDMAgentes.QMMargenesNewRecord(DataSet: TDataSet);
begin
  QMMargenesEMPRESA.AsInteger := REntorno.Empresa;
  QMMargenesEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMMargenesCANAL.AsInteger := REntorno.Canal;
  QMMargenesAGENTE.AsInteger := QMAgentesAGENTE.AsInteger;
end;

procedure TDMAgentes.AbrirMargenes;
begin
  QMMargenes.Open;
  QMPrevision.Open;
end;

procedure TDMAgentes.CerrarMargenes;
begin
  QMMargenes.Close;
  QMPrevision.Close;
end;

procedure TDMAgentes.QMPrevisionNewRecord(DataSet: TDataSet);
begin
  QMPrevisionEMPRESA.AsInteger := REntorno.Empresa;
  QMPrevisionEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMPrevisionCANAL.AsInteger := REntorno.Canal;
  QMPrevisionAGENTE.AsInteger := QMAgentesAGENTE.AsInteger;
end;

procedure TDMAgentes.AntesDeEditarMargenes(DataSet: TDataSet);
begin
  if ((QMPrevision.State = dsInsert) or (QMPrevision.State = dsEdit)) then
  begin
     QMPrevision.Post;
  end;
end;

procedure TDMAgentes.AntesDeEditarPrevision(DataSet: TDataSet);
begin
  if ((QMMargenes.State = dsInsert) or (QMMargenes.State = dsEdit)) then
  begin
     QMMargenes.Post;
  end;
end;

procedure TDMAgentes.TraspasarPrevMargenes;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TRASPASA_PREVISION_AGE_MARGEN (?EMPRESA, ?EJERCICIO, ?CANAL, ?AGENTE)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := QMAgentesEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMAgentesCANAL.AsInteger;
        Params.ByName['AGENTE'].AsInteger := QMAgentesAGENTE.AsInteger;
        // ExecQuery;
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMAgentes.Refresh;
end;

procedure TDMAgentes.xComunicacionesNewRecord(DataSet: TDataSet);
begin
  xComunicacionesEMPRESA.AsInteger := QMAgentesEMPRESA.AsInteger;
  xComunicacionesTIPO.AsString := 'AGE';
  xComunicacionesCOD_CLI_PRO.AsInteger := QMAgentesAGENTE.AsInteger;
  xComunicacionesDESCRIPCION.AsString := '';
  xComunicacionesFECHA_CREACION.AsDateTime := Now;
  xComunicacionesFECHA_MODIFICACION.AsDateTime := Now;
end;

procedure TDMAgentes.xComunicacionesBeforePost(DataSet: TDataSet);
var
  DirectorioPlantilla, Directorio : string;
  Fichero, Extension : string;
  Contador : integer;
begin
  if (DataSet.State = dsInsert) then
  begin
     DMMain.Contador_Gen(DataSet, 'CONTA_COMUNICACIONES', 'ID');

     {Fichero := DirInicial \ Empresa \ Tipo \ Cliente \ archivo[-nnn].doc}
     DirectorioPlantilla := DMMain.DameDirectorioComunicaciones('AGE');
     Directorio := DMMain.DameDirectorioCodCliPro('AGE', xComunicacionesCOD_CLI_PRO.AsInteger);
     Extension := ExtractFileExt(PlantillaComunicaciones);
     if (Extension = '') then
        Extension := '.doc';

     {Si archivo es vacio, creo un nombre segun la fecha}
     if (Trim(xComunicacionesARCHIVO.AsString) = '') then
     begin
        Contador := 0;

        Fichero := FormatDateTime('yyyymmdd', Now);
        {Si ya existe le agrego un numero de orden}
        if FileExists(Directorio + Fichero + '-' + Ajusta(IntToStr(Contador), 'I', 3, '0') + Extension) then
        begin
           while FileExists(Directorio + Fichero + '-' + Ajusta(IntToStr(Contador), 'I', 3, '0') + Extension) do
              Inc(Contador);
        end;
        xComunicacionesARCHIVO.AsString := Fichero + '-' + Ajusta(IntToStr(Contador), 'I', 3, '0') + Extension;
     end
     else
     begin
        {Verifico que tenga extensión}
        xComunicacionesARCHIVO.AsString := Trim(xComunicacionesARCHIVO.AsString);
        if (UpperCase(Copy(xComunicacionesARCHIVO.AsString, Length(xComunicacionesARCHIVO.AsString) - 3, 4)) <> UpperCase(Extension)) then
           xComunicacionesARCHIVO.AsString := xComunicacionesARCHIVO.AsString + Extension;
     end;

     CopyFileTo(DirectorioPlantilla + PlantillaComunicaciones, Directorio + xComunicacionesARCHIVO.AsString);

     DMMain.AbrirArchivo(Directorio + xComunicacionesARCHIVO.AsString);
     // ShellExecute(FMain.Handle, 'open', PChar(Directorio + xComunicacionesARCHIVO.AsString), nil, nil, SW_SHOW);
     {AbreWord(Directorio+xComunicacionesARCHIVO.AsString);}

     PlantillaComunicaciones := '';
  end;
end;

procedure TDMAgentes.QMZonasTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloZona(QMZonasZONA.AsString);
end;

procedure TDMAgentes.QMZonasNewRecord(DataSet: TDataSet);
begin
  QMZonasEMPRESA.AsInteger := QMAgentesEMPRESA.AsInteger;
  QMZonasAGENTE.AsInteger := QMAgentesAGENTE.AsInteger;
end;

procedure TDMAgentes.AbrirCalculoComisiones(DFecha, HFecha: TDateTime);
begin
  with QMCalculoComisiones do
  begin
     Close;
     Params.ByName['DFECHA'].AsDateTime := HourIntoDate(DFecha, '00:00:00');
     Params.ByName['HFECHA'].AsDateTime := HourIntoDate(HFecha, '23:59:59');
     Open;
  end;

  with QMCalculoComisionesAgrupado do
  begin
     Close;
     Params.ByName['DFECHA'].AsDateTime := HourIntoDate(DFecha, '00:00:00');
     Params.ByName['HFECHA'].AsDateTime := HourIntoDate(HFecha, '23:59:59');
     Open;
  end;
end;

procedure TDMAgentes.CerrarCalculoComisiones;
begin
  QMCalculoComisiones.Close;
  QMCalculoComisionesAgrupado.Close;
end;

procedure TDMAgentes.RecalcularComisiones(Agente: integer);
begin
  /// Si AGENTE = 0 recalcula las comisiones para todos los agentes.

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_REGENERA_TABLA_COMISIONES (:EMPRESA, :EJERCICIO, :CANAL, :AGENTE)';
        Params.ByName['EMPRESA'].AsInteger := QMAgentesEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMAgentesEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMAgentesCANAL.AsInteger;
        Params.ByName['AGENTE'].AsInteger := Agente;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMAgentes.EstableceBloqueoComisiones(Bloqueado: boolean);
begin
  with QMCalculoComisiones do
  begin
     try
        DisableControls;
        First;
        while not EOF do
        begin
           if (QMCalculoComisionesBLOQUEADO.AsInteger <> BoolToInt(Bloqueado)) then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE EMP_AGENTES_COMISIONES SET BLOQUEADO = :BLOQUEADO WHERE EMPRESA = :EMPRESA AND CANAL = :CANAL AND AGENTE = :AGENTE AND ID_DETALLES_S = :ID_DETALLES_S';
                    Params.ByName['EMPRESA'].AsInteger := QMCalculoComisionesEMPRESA.AsInteger;
                    Params.ByName['CANAL'].AsInteger := QMCalculoComisionesCANAL.AsInteger;
                    Params.ByName['AGENTE'].AsInteger := QMCalculoComisionesAGENTE.AsInteger;
                    Params.ByName['ID_DETALLES_S'].AsInteger := QMCalculoComisionesID_DETALLES_S.AsInteger;
                    Params.ByName['BLOQUEADO'].AsInteger := BoolToInt(Bloqueado);
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;

           Next;
        end;
     finally
        EnableControls;
     end;
  end;

  QMCalculoComisiones.Close;
  QMCalculoComisiones.Open;
  QMCalculoComisionesAgrupado.Close;
  QMCalculoComisionesAgrupado.Open;
end;

procedure TDMAgentes.QMAgentesBeforeClose(DataSet: TDataSet);
begin
  QMAgentesSub.Close;
end;

procedure TDMAgentes.QMAgentesSubNewRecord(DataSet: TDataSet);
begin
  QMAgentesSubEMPRESA.AsInteger := REntorno.Empresa;
  QMAgentesSubEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMAgentesSubCANAL.AsInteger := REntorno.Canal;
  QMAgentesSubAGENTE.AsInteger := QMAgentesAGENTE.AsInteger;
end;

procedure TDMAgentes.FiltraAgente(Agente: integer);
begin
  with QMAgentes do
  begin
     Close;
     SelectSQL.Assign(SQLBase);
     if (Agente <> 0) then
        SelectSQL.Add(format(' AND AGENTE = %d', [Agente]));
     SelectSQL.Add(' ORDER BY AGENTE ');
     DMMain.FiltraTabla(QMAgentes, '11100');
  end;
end;

procedure TDMAgentes.QuitaFiltros;
begin
  with QMAgentes do
  begin
     Close;
     SelectSQL.Assign(SQLBase);
     SelectSQL.Add(' ORDER BY AGENTE ');
     DMMain.FiltraTabla(QMAgentes, '11100');
  end;
end;

// Grabar en la linea de venta el indicativo de Pagado y la Fecha correspondiente
procedure TDMAgentes.MarcaComisionesPagado(Fecha: TDateTime; Pagado: boolean);
begin
  with QMCalculoComisiones do
  begin
     DisableControls;
     try
        First;
        while not EOF do
        begin
           if (QMCalculoComisionesPAGADO.AsInteger <> BoolToInt(Pagado)) then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Clear;
                    SQL.Add(' UPDATE EMP_AGENTES_COMISIONES ');
                    SQL.Add(' SET ');
                    SQL.Add(' PAGADO = :PAGADO, ');
                    SQL.Add(' FECHA_PAGO = :FECHA_PAGO ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' EMPRESA = :EMPRESA ');
                    SQL.Add(' AND CANAL = :CANAL ');
                    SQL.Add(' AND AGENTE = :AGENTE ');
                    SQL.Add(' AND ID_DETALLES_S = :ID_DETALLES_S ');
                    Params.ByName['EMPRESA'].AsInteger := QMCalculoComisionesEMPRESA.AsInteger;
                    Params.ByName['CANAL'].AsInteger := QMCalculoComisionesCANAL.AsInteger;
                    Params.ByName['AGENTE'].AsInteger := QMCalculoComisionesAGENTE.AsInteger;
                    Params.ByName['ID_DETALLES_S'].AsInteger := QMCalculoComisionesID_DETALLES_S.AsInteger;
                    Params.ByName['PAGADO'].AsInteger := BoolToInt(Pagado);
                    Params.ByName['FECHA_PAGO'].AsDateTime := Fecha;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;
           Next;
        end;
     finally
        EnableControls;
     end;
  end;

  QMCalculoComisiones.Close;
  QMCalculoComisiones.Open;
  QMCalculoComisionesAgrupado.Close;
  QMCalculoComisionesAgrupado.Open;
end;

procedure TDMAgentes.QMCalculoComisionesBeforePost(DataSet: TDataSet);
begin
  if ((QMCalculoComisionesPAGADO.AsInteger = 1) and QMCalculoComisionesFECHA_PAGO.IsNull) then
     QMCalculoComisionesFECHA_PAGO.AsDateTime := Now;
end;

procedure TDMAgentes.FiltraAgrupacionDisponible(Filtro: string);
begin
  Filtro := Trim(Filtro);
  with xAgrupDisp do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT TITULO, AGRUPACION ');
     SelectSQL.Add(' FROM VER_AGRUPACIONES ');
     SelectSQL.Add(' WHERE ');
     if (Filtro > '') then
     begin
        SelectSQL.Add(' ((UPPER(TITULO) LIKE  UPPER(''%' + Copy(Filtro, 1, 40) + '%'')) OR ');
        SelectSQL.Add('  (UPPER(AGRUPACION) LIKE  UPPER(''%' + Copy(Filtro, 1, 3) + '%''))) AND ');
     end;
     SelectSQL.Add(' TIPO = ''R'' AND ');
     SelectSQL.Add(' AGRUPACION NOT IN (SELECT AGRUPACION ');
     SelectSQL.Add('                    FROM EMP_AGRUPACIONES_ART ');
     SelectSQL.Add('                    WHERE ');
     SelectSQL.Add('                    EMPRESA = :EMPRESA AND ');
     SelectSQL.Add('                    AGENTE = :AGENTE) ');
     SelectSQL.Add(' ORDER BY AGRUPACION ');
     Open;
  end;
end;

end.
