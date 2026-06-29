unit UCrmDMConsultaAcciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery, Dialogs, Controls;

type
  TCrmDMConsultaAcciones = class(TDataModule)
     TLocal: THYTransaction;
     DSQMAccionesSeg: TDataSource;
     xContactos: TFIBDataSetRO;
     DSxContactos: TDataSource;
     xContactosID_CONTACTO: TIntegerField;
     xContactosNOMBRE_COMERCIAL: TFIBStringField;
     xContactosTELEFONO01: TFIBStringField;
     xContactosDIR_NOMBRE: TFIBStringField;
     xContactosEMAIL: TFIBStringField;
     xContactosTERCERO: TIntegerField;
     xContactosNIF: TFIBStringField;
     QMAcciones: TFIBTableSet;
     DSQMAcciones: TDataSource;
     QMAccionesID_CONTACTO: TIntegerField;
     QMAccionesLINEA: TIntegerField;
     QMAccionesEMPRESA_AGENTE: TIntegerField;
     QMAccionesAGENTE: TIntegerField;
     QMAccionesFECHA_ACCION: TDateTimeField;
     QMAccionesTIPO_ACCION: TFIBStringField;
     QMAccionesDESCRIPCION_ACCION: TFIBStringField;
     QMAccionesNOTAS: TBlobField;
     QMAccionesFIN_ACCION: TIntegerField;
     QMAccionesFECHA_PROX_ACCION: TDateTimeField;
     QMAccionesTIPO_PROX_ACCION: TFIBStringField;
     QMAccionesDESCRIPCION_PROX_ACCION: TFIBStringField;
     QMAccionesHORA_PROX_ACCION: TFIBStringField;
     QMAccionesID_ACCION: TIntegerField;
     xAccComercial: TFIBDataSetRO;
     DSxAccComercial: TDataSource;
     xAccComercialFECHA_ACCION: TDateTimeField;
     xAccComercialTIPO_ACCION: TFIBStringField;
     xAccComercialDESCRIPCION_ACCION: TFIBStringField;
     xAccComercialID_ACCION: TIntegerField;
     xAccComercialID_CONTACTO: TIntegerField;
     xAccComercialLINEA: TIntegerField;
     xAccComercialEMPRESA_AGENTE: TIntegerField;
     xAccComercialAGENTE: TIntegerField;
     xAccComercialNOTAS: TBlobField;
     xAccComercialFIN_ACCION: TIntegerField;
     xAccComercialFECHA_PROX_ACCION: TDateTimeField;
     xAccComercialTIPO_PROX_ACCION: TFIBStringField;
     xAccComercialDESCRIPCION_PROX_ACCION: TFIBStringField;
     xAccComercialHORA_PROX_ACCION: TFIBStringField;
     DSxSeguimiento: TDataSource;
     QMAccionesSeg: TFIBTableSet;
     QMAccionesSegID_CONTACTO: TIntegerField;
     QMAccionesSegLINEA_CAB: TIntegerField;
     QMAccionesSegORDEN: TIntegerField;
     QMAccionesSegID_ACCION_DET: TIntegerField;
     QMAccionesSegID_ACCION: TIntegerField;
     QMAccionesSegFECHA: TDateTimeField;
     QMAccionesSegHORA_ACCION: TFIBStringField;
     QMAccionesSegNOTAS: TBlobField;
     QMAccionesSegFIN_SEG: TIntegerField;
     xTipoAccSeg: TFIBDataSetRO;
     DSxTipoAccSeg: TDataSource;
     xAgente: TFIBDataSetRO;
     DSxAgente: TDataSource;
     xTipoAccSegTIPO_SEG: TFIBStringField;
     QMAccionesSegID_SEG_SIGUIENTE: TIntegerField;
     QMAccionesSegFECHA_SEG_SIGUIENTE: TDateTimeField;
     QMAccionesSegTIPO_SEG: TFIBStringField;
     xSeguimiento: TFIBTableSet;
     xSeguimientoAGENTE: TIntegerField;
     xSeguimientoID_CONTACTO: TIntegerField;
     xSeguimientoLINEA_CAB: TIntegerField;
     xSeguimientoORDEN: TIntegerField;
     xSeguimientoID_ACCION_DET: TIntegerField;
     xSeguimientoID_ACCION: TIntegerField;
     xSeguimientoFECHA: TDateTimeField;
     xSeguimientoHORA_ACCION: TFIBStringField;
     xSeguimientoNOTAS: TBlobField;
     xSeguimientoFIN_SEG: TIntegerField;
     xSeguimientoID_SEG_SIGUIENTE: TIntegerField;
     xSeguimientoFECHA_SEG_SIGUIENTE: TDateTimeField;
     xSeguimientoTIPO_SEG: TFIBStringField;
     xPContactes: TFIBDataSetRO;
     DSxPContactes: TDataSource;
     xPContactesID_CONTACTO: TIntegerField;
     xPContactesNUM_PERSONA: TIntegerField;
     xPContactesNOMBRE: TFIBStringField;
     xPContactesAPELLIDOS: TFIBStringField;
     xPContactesTELEFONO: TFIBStringField;
     xPContactesMOVIL: TFIBStringField;
     xPContactesFAX: TFIBStringField;
     xPContactesEXTENSION: TFIBStringField;
     xPContactesEMAIL: TFIBStringField;
     xPContactesNOTAS: TBlobField;
     xSeguimientoNOMBRE_CORTO: TFIBStringField;
     xSeguimientoNOMBRE_COMERCIAL: TFIBStringField;
     xSeguimientoNOMBRE_R_SOCIAL: TFIBStringField;
     xSeguimientoCODIGO_POSTAL: TFIBStringField;
     xSeguimientoTITULO: TFIBStringField;
     xSeguimientoDESCRIPCION_SEGUIMIENTO: TFIBStringField;
     QMAccionesSegDESCRIPCION_SEGUIMIENTO: TFIBStringField;
     xAccComercialDOC_ACCION: TIntegerField;
     xAccComercialDOC_EMPRESAS: TIntegerField;
     xAccComercialDOC_CANAL: TIntegerField;
     xAccComercialDOC_SERIES: TFIBStringField;
     xAccComercialDOC_EJERCICIO: TIntegerField;
     xAccComercialID_ACCION_CAB: TIntegerField;
     TUpdate: THYTransaction;
     xSeguimientoDESCRIPCION_ACCION: TFIBStringField;
     xSeguimientoPROGRESO: TIntegerField;
     xSeguimientoHORARIO_DESDE: TDateTimeField;
     xSeguimientoHORARIO_HASTA: TDateTimeField;
     QMAccionesSegPROGRESO: TIntegerField;
     QMAccionesSegHORARIO_DESDE: TDateTimeField;
     QMAccionesSegHORARIO_HASTA: TDateTimeField;
     QMAccionesDOC_ACCION: TIntegerField;
     QMAccionesDOC_EMPRESAS: TIntegerField;
     QMAccionesDOC_CANAL: TIntegerField;
     QMAccionesDOC_SERIES: TFIBStringField;
     QMAccionesDOC_EJERCICIO: TIntegerField;
     QMAccionesPROGRESO: TIntegerField;
     QMAccionesID_FICHA_TECNICA: TIntegerField;
     xSeguimientoPROGRESO_ACCION: TIntegerField;
     xSeguimientoID_ACCION_CAB: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMAccionesSegNewRecord(DataSet: TDataSet);
     procedure xSeguimientoAfterOpen(DataSet: TDataSet);
     procedure xSeguimientoBeforeClose(DataSet: TDataSet);
     procedure xAccComercialAfterOpen(DataSet: TDataSet);
     procedure xAccComercialBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     Fin_Seg_Ant: boolean;
  public
     { Public declarations }
     procedure Filtra(Agente, IdContacto, IdAccionCab: integer; TipoAccion: string; FechaAccion: TDateTime; Fin: smallint; TipoFecha: smallint; FechaAccion2: TDateTime; Accion: integer; Tipo_Seg: string);
     procedure TancaSegActual(IdAccionDet: integer);
     procedure TancaAccActual(IdAccion: integer);
     procedure ObrirSeguiment(Accion: char);
     procedure MuestraDocumentoAsociado;
     procedure RellenaTipoSeguimiento(Lista: TStrings);
     procedure RefrescarSeguimiento;
  end;

var
  CrmDMConsultaAcciones : TCrmDMConsultaAcciones;

implementation

uses UFMain, UDMMain, UEntorno, UFormGest, UUtiles, UCrmFMContactosDetalleAcc;

{$R *.dfm}

procedure TCrmDMConsultaAcciones.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(xSeguimiento, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMAccionesSeg, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xContactos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xPContactes, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xAccComercial, MascaraN, MascaraI, ShortDateFormat);
end;

procedure TCrmDMConsultaAcciones.Filtra(Agente, IdContacto, IdAccionCab: integer; TipoAccion: string; FechaAccion: TDateTime; Fin: smallint; TipoFecha: smallint; FechaAccion2: TDateTime; Accion: integer; Tipo_Seg: string);
var
  id_accion_det : integer;
  Orden : string;
begin
  id_accion_det := xSeguimientoID_ACCION_DET.AsInteger;

  with xSeguimiento do
  begin
     Orden := OrdenadoPor;
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT CAB.AGENTE, CAB.PROGRESO PROGRESO_ACCION, CAB.ID_ACCION_CAB, ');
     SelectSQL.Add(' DET.*, ');
     SelectSQL.Add(' CON.NOMBRE_CORTO, CON.NOMBRE_COMERCIAL, CON.NOMBRE_R_SOCIAL, ');
     SelectSQL.Add(' LOC.CODIGO_POSTAL, LOC.TITULO ');
     SelectSQL.Add(' FROM CRM_CONTACTOS_ACCIONES CAB ');
     SelectSQL.Add(' JOIN CRM_CONTACTOS_ACCIONES_DET DET ON CAB.ID_CONTACTO = DET.ID_CONTACTO AND CAB.LINEA = DET.LINEA_CAB ');
     SelectSQL.Add(' LEFT JOIN CRM_CONTACTOS CON ON CON.ID_CONTACTO = CAB.ID_CONTACTO ');
     SelectSQL.Add(' LEFT JOIN SYS_LOCALIDADES LOC ON CON.DIR_LOCALIDAD = LOC.LOCALIDAD ');
     SelectSQL.Add(' WHERE CAB.EMPRESA_AGENTE = ' + REntorno.EmpresaStr);
     if (Agente <> 0) then
        SelectSQL.Add(' AND CAB.AGENTE = ' + IntToStr(Agente));
     if (IdContacto <> 0) then
        SelectSQL.Add(' AND CAB.ID_CONTACTO = ' + IntToStr(IdContacto));
     if (TipoAccion <> '') then
        SelectSQL.Add(' AND CAB.TIPO_ACCION = ''' + TipoAccion + '''');
     if (IdAccionCab <> 0) then
        SelectSQL.Add(' AND CAB.ID_ACCION_CAB = ''' + IntToStr(IdAccionCab) + '''');
     if (Accion <> -1) then
        SelectSQL.Add(' AND DET.ID_ACCION = ' + IntToStr(Accion));
     if (Tipo_Seg <> 'TOT') then
        SelectSQL.Add(' AND DET.TIPO_SEG = ''' + Tipo_Seg + '''');

     // Anterior a fecha
     if ((TipoFecha = 0) and (FechaAccion <> 0)) then
        SelectSQL.Add(' AND DET.FECHA <= ''' + FormatDateTime('mm/dd/yyyy 23:59:59', FechaAccion) + '''');

     // Un dia
     if ((TipoFecha = 1) and (FechaAccion2 = 0)) then
     begin
        SelectSQL.Add(' AND DET.FECHA >= ''' + FormatDateTime('mm/dd/yyyy 00:00:00', FechaAccion) + '''');
        SelectSQL.Add(' AND DET.FECHA <= ''' + FormatDateTime('mm/dd/yyyy 23:59:59', FechaAccion) + '''');
     end;

     // Entre fechas
     if ((TipoFecha = 1) and (FechaAccion2 <> 0)) then
     begin
        SelectSQL.Add(' AND DET.FECHA >= ''' + FormatDateTime('mm/dd/yyyy 00:00:00', FechaAccion) + '''');
        SelectSQL.Add(' AND DET.FECHA <= ''' + FormatDateTime('mm/dd/yyyy 23:59:59', FechaAccion2) + '''');
     end;

     if (Fin = 0) then
        SelectSQL.Add(' AND DET.FIN_SEG = 0')
     else if (Fin = 1) then
        SelectSQL.Add(' AND DET.FIN_SEG = 1');

     Ordenar(Orden);
     Open;
  end;

  Posicionar(xSeguimiento, 'ID_ACCION_DET', id_accion_det, False, True);
end;

procedure TCrmDMConsultaAcciones.QMAccionesSegNewRecord(DataSet: TDataSet);
var
  IdAccionDet : integer;
begin
  QMAccionesSegID_CONTACTO.AsInteger := xSeguimientoID_CONTACTO.AsInteger;
  QMAccionesSegLINEA_CAB.AsInteger := xSeguimientoLINEA_CAB.AsInteger;
  QMAccionesSegID_ACCION.AsInteger := xSeguimientoID_ACCION.AsInteger;
  QMAccionesSegFECHA.AsDateTime := REntorno.FechaTrabSH;
  QMAccionesSegFIN_SEG.AsInteger := 0;

  // Es busca quin és el tipus de seguiment assignat al tipus d'acció de l'acció
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SYS.TIPO_SEG ');
        SQL.Add(' FROM CRM_CONTACTOS_ACCIONES ACC ');
        SQL.Add(' LEFT JOIN CRM_SYS_ACCIONES SYS ON (SYS.ACCION = ACC.TIPO_ACCION) ');
        SQL.Add(' WHERE ');
        SQL.Add(' ACC.ID_ACCION = :ID_ACCION ');
        Params.ByName['ID_ACCION'].AsInteger := QMAccionesSegID_ACCION.AsInteger;
        ExecQuery;
        QMAccionesSegTIPO_SEG.AsString := FieldByName['TIPO_SEG'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // nº de orden/linia
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(ORDEN) FROM CRM_CONTACTOS_ACCIONES_DET WHERE ID_ACCION = :ID_ACCION';
        Params.ByName['ID_ACCION'].AsInteger := xSeguimientoID_ACCION.AsInteger;
        ExecQuery;
        QMAccionesSegORDEN.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Es finalitza la linia de seguiment a partir de la que es crea la nova
  if (Fin_Seg_Ant) then
  begin
     // Es busca el id generat nou
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST (1) ID_ACCION_DET ');
           SQL.Add(' FROM CRM_CONTACTOS_ACCIONES_DET ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_CONTACTO = :ID_CONTACTO AND ');
           SQL.Add(' LINEA_CAB = :LINEA_CAB ');
           SQL.Add(' ORDER BY ID_ACCION_DET DESC ');
           Params.ByName['ID_CONTACTO'].AsInteger := xSeguimientoID_CONTACTO.AsInteger;
           Params.ByName['LINEA_CAB'].AsInteger := xSeguimientoLINEA_CAB.AsInteger;
           ExecQuery;
           IdAccionDet := FieldByName['ID_ACCION_DET'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Es realitza el tancament i s'assigna el nou seguiment a l'anterior
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE CRM_CONTACTOS_ACCIONES_DET ');
           SQL.Add(' SET ');
           SQL.Add(' FIN_SEG = 1, ');
           SQL.Add(' ID_SEG_SIGUIENTE = :ID_SEG_SIGUIENTE ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_ACCION_DET = :ID_ACCION_DET ');
           Params.ByName['ID_SEG_SIGUIENTE'].AsInteger := IdAccionDet;
           Params.ByName['ID_ACCION_DET'].AsInteger := xSeguimientoID_ACCION_DET.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  Refrescar(xSeguimiento, 'ID_ACCION_DET', IdAccionDet);
end;

procedure TCrmDMConsultaAcciones.ObrirSeguiment(Accion: char);
var
  old_id_accion_det, id_accion_det : integer;
  FinalizaSeguimientoAnterior : boolean;
begin
  id_accion_det := 0;
  if (Accion = 'E') then
     id_accion_det := xSeguimientoID_ACCION_DET.AsInteger;

  old_id_accion_det := id_accion_det;

  AbreForm(TCrmFMContactosDetAcc, CrmFMContactosDetAcc);

  // Abro el seguimiento y obtengo el nuevo ID y si debo crear otro seguimiento
  FinalizaSeguimientoAnterior := CrmFMContactosDetAcc.Mostrar('A', xSeguimientoID_ACCION.AsInteger, id_accion_det);

  if ((FinalizaSeguimientoAnterior) and (id_accion_det <> 0)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE CRM_CONTACTOS_ACCIONES_DET ');
           SQL.Add(' SET ');
           SQL.Add(' FIN_SEG = 1, ');
           SQL.Add(' ID_SEG_SIGUIENTE = ?ID_SEG_SIGUIENTE ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_ACCION_DET = (SELECT MAX(ID_ACCION_DET) FROM CRM_CONTACTOS_ACCIONES_DET WHERE ID_ACCION = ?ID_ACCION AND ID_ACCION_DET <> ?ID_SEG_SIGUIENTE) ');
           Params.ByName['ID_SEG_SIGUIENTE'].AsInteger := id_accion_det;
           Params.ByName['ID_ACCION'].AsInteger := xSeguimientoID_ACCION.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  CierraForm(CrmFMContactosDetAcc);

  if (id_accion_det = 0) then
     id_accion_det := old_id_accion_det;

  Refrescar(xSeguimiento, 'ID_ACCION_DET', id_accion_det);
end;

// Procediment que tanca el seguiment actual seleccionat a la part de l'esquerra
procedure TCrmDMConsultaAcciones.TancaSegActual(IdAccionDet: integer);
begin
  if MessageDlg(_('Desea finalizar el seguimiento actual?'),
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'UPDATE CRM_CONTACTOS_ACCIONES_DET SET FIN_SEG = 1 WHERE ID_ACCION_DET = :ID_ACCION_DET';
           Params.ByName['ID_ACCION_DET'].AsInteger := IdAccionDet;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     ShowMessage(_('Proceso finalizado con éxito'));
  end;
end;

procedure TCrmDMConsultaAcciones.TancaAccActual(IdAccion: integer);
begin
  if MessageDlg(_('Desea finalizar la acción actual?'),
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'UPDATE CRM_CONTACTOS_ACCIONES SET FIN_ACCION = 1 WHERE ID_ACCION = :ID_ACCION';
           Params.ByName['ID_ACCION'].AsInteger := IdAccion;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     ShowMessage(_('Proceso finalizado con éxito'));
  end;
end;

procedure TCrmDMConsultaAcciones.xSeguimientoAfterOpen(DataSet: TDataSet);
begin
  QMAccionesSeg.Open;
  xAccComercial.Open;
  xContactos.Open;
  xTipoAccSeg.Open;
  xPContactes.Open;
end;

procedure TCrmDMConsultaAcciones.xSeguimientoBeforeClose(DataSet: TDataSet);
begin
  QMAccionesSeg.Close;
  xAccComercial.Close;
  xContactos.Close;
  xTipoAccSeg.Close;
  xPContactes.Close;
end;

procedure TCrmDMConsultaAcciones.xAccComercialAfterOpen(DataSet: TDataSet);
begin
  xAgente.Open;
end;

procedure TCrmDMConsultaAcciones.xAccComercialBeforeClose(DataSet: TDataSet);
begin
  xAgente.Close;
end;

procedure TCrmDMConsultaAcciones.MuestraDocumentoAsociado;
var
  Tipo : string;
begin
  if (xAccComercialTIPO_ACCION.AsString = 'OFE') then
     Tipo := 'OFC';

  if ((xAccComercialDOC_ACCION.AsInteger > 0) and (xAccComercialTIPO_ACCION.AsString = 'OFE')) then
     FMain.MuestraDocumento(xAccComercialDOC_EJERCICIO.AsInteger,
        Tipo, xAccComercialDOC_SERIES.AsString,
        xAccComercialDOC_ACCION.AsInteger);
end;

procedure TCrmDMConsultaAcciones.RellenaTipoSeguimiento(Lista: TStrings);
var
  TipoSeguimiento : string;
  DS : TFIBDataSetRO;
begin
  Lista.Clear;
  Lista.AddObject(_('Todos'), Pointer(0));
  DS := TFIBDataSetRO.Create(nil);
  try
     with DS do
     begin
        DataBase := DMMain.DataBase;
        Transaction := TFIBTransaction.Create(nil);
        try
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
              if (not InTransaction) then
                 StartTransaction;
           end;
           SelectSQL.Clear;
           SelectSQL.Add('SELECT TSEGUIMIENTO, DESCRIPCION FROM CRM_SYS_TIPO_SEG ORDER BY TSEGUIMIENTO');
           Open;
           while not EOF do
           begin
              TipoSeguimiento := FieldByName('TSEGUIMIENTO').AsString + ' - ' + FieldByName('DESCRIPCION').AsString;
              Lista.AddObject(TipoSeguimiento, Pointer(0));
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
end;

procedure TCrmDMConsultaAcciones.RefrescarSeguimiento;
begin
  Refrescar(xSeguimiento, 'ID_ACCION_DET', xSeguimientoID_ACCION_DET.AsInteger);
end;

end.
