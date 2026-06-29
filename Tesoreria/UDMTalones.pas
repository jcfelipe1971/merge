unit UDMTalones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, UHYTickets, FIBDatabase,
  UFIBModificados, CVBNorma19CSB, Math, FR_DSet, FR_DBSet, FR_Class,
  Fr_HYReport, HYFIBQuery, FIBDataSetRO;

type
  TDMTalones = class(TDataModule)
     QMTalones: TFIBTableSet;
     DSQMTalones: TDataSource;
     TLocal: THYTransaction;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     DSxInfoActualizada: TDataSource;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSIGNO: TFIBStringField;
     QMDetalleREGISTRO: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleCOD_CLI_PRO: TIntegerField;
     QMDetalleVENCIMIENTO: TDateTimeField;
     QMDetalleCTA_PAGO: TFIBStringField;
     QMDetalleLIQUIDO: TFloatField;
     QMDetallePAGADO: TIntegerField;
     QMDetalleIMPAGADO: TIntegerField;
     QMDetalleFORMA_PAGO: TFIBStringField;
     QMDetalleTIPO_EFECTO: TFIBStringField;
     QMDetalleACEPTADO: TIntegerField;
     QMDetalleREMESAR: TIntegerField;
     QMDetalleESTADO: TIntegerField;
     QMDetalleREMESA: TIntegerField;
     QMDetalleDOC_NUMERO: TIntegerField;
     QMDetalleDOC_SERIE: TFIBStringField;
     QMDetalleDOC_FECHA: TDateTimeField;
     QMDetalleDOC_TIPO: TFIBStringField;
     QMDetalleRIC: TIntegerField;
     QMDetalleRIVA: TIntegerField;
     QMDetalleFECHA_CIERRE: TDateTimeField;
     QMDetalleESTADO_RECIBO: TFIBStringField;
     QMDetalleRECIBIDO: TIntegerField;
     QMDetalleCONFIRMING: TIntegerField;
     QMDetalleTALON: TFIBStringField;
     QMDetalleTALON_AUTOMATICO: TIntegerField;
     xInfoActualizada: TFIBDataSetRO;
     xInfoActualizadaIMPORTE: TFloatField;
     xInfoActualizadaPAGADO: TIntegerField;
     QMTalonesEMPRESA: TIntegerField;
     QMTalonesEJERCICIO: TIntegerField;
     QMTalonesCANAL: TIntegerField;
     QMTalonesTALON: TFIBStringField;
     QMTalonesCOD_CLI_PRO: TIntegerField;
     QMTalonesTIPO_TERCERO: TFIBStringField;
     QMTalonesDESCRIPCION: TFIBStringField;
     QMTalonesLUGAR_LIBRAMIENTO: TFIBStringField;
     QMTalonesFECHA_LIBRAMIENTO: TDateTimeField;
     QMTalonesBANCO: TIntegerField;
     QMTalonesIMPORTE: TFloatField;
     QMTalonesPAGADO: TIntegerField;
     QMTalonesRIC: TIntegerField;
     QMTalonesASIENTO: TIntegerField;
     QMDetalleLIQUIDO_CANAL: TFloatField;
     QMDetalleMONEDA: TFIBStringField;
     QMDetalleLIQUIDO_MONEDA: TFloatField;
     QMTalonesTIPO_ASIENTO_KRI: TFIBStringField;
     TUpdate: THYTransaction;
     QMTalonesMARCA_CONT: TIntegerField;
     DSxTalonesPendientes: TDataSource;
     xTalonesPendientes: TFIBTableSet;
     xTalonesPendientesEMPRESA: TIntegerField;
     xTalonesPendientesEJERCICIO: TIntegerField;
     xTalonesPendientesCANAL: TIntegerField;
     xTalonesPendientesTALON: TFIBStringField;
     xTalonesPendientesCOD_CLI_PRO: TIntegerField;
     xTalonesPendientesTIPO_TERCERO: TFIBStringField;
     xTalonesPendientesDESCRIPCION: TFIBStringField;
     xTalonesPendientesLUGAR_LIBRAMIENTO: TFIBStringField;
     xTalonesPendientesFECHA_LIBRAMIENTO: TDateTimeField;
     xTalonesPendientesBANCO: TIntegerField;
     xTalonesPendientesIMPORTE: TFloatField;
     xTalonesPendientesPAGADO: TIntegerField;
     xTalonesPendientesRIC: TIntegerField;
     xTalonesPendientesASIENTO: TIntegerField;
     xTalonesPendientesTIPO_ASIENTO_KRI: TFIBStringField;
     xTalonesPendientesMARCA_CONT: TIntegerField;
     QMTalonesTALON_PAPEL: TFIBStringField;
     xIncidencias: TFIBDataSetRO;
     DSxIncidencias: TDataSource;
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
     xIncidenciasENTRADA: TIntegerField;
     xIncidenciasDIRECCION: TIntegerField;
     xIncidenciasDIR_NOMBRE: TFIBStringField;
     xIncidenciasAGENTE: TIntegerField;
     xIncidenciasCONTACTO: TIntegerField;
     xIncidenciasTIT_CONTACTO: TFIBStringField;
     xIncidenciasTIT_AGENTE: TFIBStringField;
     xIncidenciasTIPO_INCIDENCIA_KRI: TFIBStringField;
     xIncidenciasTIT_TIPO_INCIDENCIA_KRI: TFIBStringField;
     xIncidenciasUSUARIO: TIntegerField;
     xIncidenciasNOMBRE_USUARIO: TFIBStringField;
     QMDetalleCAMBIO: TFloatField;
     QMDetalleID_CARTERA: TIntegerField;
     QMDetalleID_CARTERA_DETALLE: TIntegerField;
     QMDetalleID_DOC: TIntegerField;
     QMDetalleRETENCION: TIntegerField;
     QMDetalleTIPO_RETENCION: TIntegerField;
     QMDetalleNUM_FACTURA_PROV: TFIBStringField;
     QMDetalleNUM_FACTURA_ACR: TFIBStringField;
     QMTalonesZ_NOTASTALON: TBlobField;
     QMTalonesZ_CONTADOR: TIntegerField;
     QMTalonesSALDO_DEUDOR: TFloatField;
     QMTalonesSALDO_ACREEDOR: TFloatField;
     QMTalonesSALDO: TFloatField;
     QMDetallePAGO_AUTORIZADO: TIntegerField;
     procedure DMTalonesCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure DMTalonesDestroy(Sender: TObject);
     procedure QMTalonesAfterOpen(DataSet: TDataSet);
     procedure QMTalonesBeforePost(DataSet: TDataSet);
     procedure QMTalonesNewRecord(DataSet: TDataSet);
     procedure QMTalonesAfterScroll(DataSet: TDataSet);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure QMTalonesCOD_CLI_PROChange(Sender: TField);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleBeforeEdit(DataSet: TDataSet);
     procedure QMDetalleLIQUIDO_MONEDAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMTalonesTIPO_ASIENTO_KRIChange(Sender: TField);
     procedure QMTalonesBeforeCancel(DataSet: TDataSet);
     procedure QMTalonesAfterCancel(DataSet: TDataSet);
     procedure xTalonesPendientesAfterOpen(DataSet: TDataSet);
     procedure xTalonesPendientesBeforeClose(DataSet: TDataSet);
     procedure QMTalonesCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
     TipoTercero, tipo, tipo2, tipo3, tipo4: string;
     UltimoLugarLibramientoKri: string;
     FCalcularSaldo: boolean;
     procedure Tipos;
     procedure Anticipos(Fecha: TDateTime);
     function DameTalon: integer;
     function DameLugar: string;
     procedure SetCalcularSaldo(const Value: boolean);
  public
     { Public declarations }
     NumTalon: string;
     procedure MostrarRecibosDisponibles;
     procedure SeleccionaTodos;
     procedure CierraTalon(RefrescaDatos: boolean = True);
     procedure CierraTalonTodosKri;
     procedure AbreTalon;
     procedure FiltraDetalle;
     procedure CambiaCod_Pro(Tipo: string; Cod_pro_acr: integer; var Titulo: string);
     function Detalle: boolean;
     procedure MostrarCartaPago(modo, NoContabilizado: smallint; SerieKri: string);
     procedure MostrarListadoTalones(modo: smallint; NoContabilizado: boolean; SerieKri: string);
     procedure Recibos;
     procedure BusquedaCompleja;
     procedure BorraTalones;
     procedure GeneraTalones(FechaDesde, FechaHasta: TDateTime; Serie: string; Banco: integer; Lugar: string);
     procedure Refrescar;
     property CalcularSaldo: boolean Read FCalcularSaldo Write SetCalcularSaldo;
     procedure CrearNormaSabadell(Archivo: string);
     procedure LeerRespuestaNormaSabadell(Archivo: string);
  end;

var
  DMTalones : TDMTalones;

implementation

uses UDMMain, UEntorno, uFBusca, UUtiles, UFormGest, UFMTalones, UFPregAnticipo,
  UDMLSTTalones, DateUtils, UNormaEmisionChequeSabadell, UDameDato;

{$R *.DFM}

procedure TDMTalones.DMTalonesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  FCalcularSaldo := False;

  AsignaDisplayFormat(QMTalones, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetalle, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xInfoActualizada, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xTalonesPendientes, MascaraN, MascaraI, ShortDateFormat);

  DMMain.FiltraTabla(QMTalones, '11100', True);
  DMMain.FiltraTabla(xTalonesPendientes, '11100', True);

  TipoTercero := 'PRO';
  UltimoLugarLibramientoKri := ''; {dji lrk kri - inicializo el ultimo lugar de libramiento}
end;

procedure TDMTalones.DMTalonesDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TDMTalones.Graba(DataSet: TDataSet);
var
  Contador : integer;
begin
  FMTalones.AjustaCheckTalon(QMTalonesTALON.AsString);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CONTADOR_TALON FROM EMP_BANCOS WHERE EMPRESA = ?EMPRESA AND BANCO = ?BANCO AND CONTADOR_TALON_AUTOMATICO = 1';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['BANCO'].AsInteger := QMTalonesBANCO.AsInteger;
        ExecQuery;
        Contador := FieldByName['CONTADOR_TALON'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Contador <> 0) then
  begin
     QMTalonesZ_CONTADOR.AsInteger := Contador;
     QMTalonesTALON.AsString := IntToStr(Contador);
  end;
end;

procedure TDMTalones.QMTalonesAfterOpen(DataSet: TDataSet);
begin
  xInfoActualizada.Open;
  QMDetalle.Open;
end;

procedure TDMTalones.QMTalonesBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
  begin
     QMTalonesTIPO_TERCERO.AsString := TipoTercero;
     if ((QMTalonesTALON.AsString = '') or (QMTalonesTALON.IsNull)) then
     begin
        ShowMessage(_('Es necesario el código de Talón'));
        // DataSet.DisableControls;
        Abort;
        // DataSet.EnableControls;
     end;

     // Guardo el ultimo lugar de libramiento
     UltimoLugarLibramientoKri := QMTalonesLUGAR_LIBRAMIENTO.AsString;
  end;
end;

procedure TDMTalones.QMTalonesNewRecord(DataSet: TDataSet);
var
  Talon : integer;
begin
  QMTalonesEMPRESA.AsInteger := REntorno.Empresa;
  QMTalonesEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMTalonesCANAL.AsInteger := REntorno.Canal;
  QMTalonesFECHA_LIBRAMIENTO.AsDateTime := REntorno.FechaTrab;
  QMTalonesBANCO.AsInteger := DameBancoDefecto;
  QMTalonesIMPORTE.AsFloat := 0;
  QMTalonesPAGADO.AsInteger := 0;
  Talon := DameTalon;
  if (Talon > 0) then
     QMTalonesTALON.AsString := IntToStr(Talon + 1);
  QMTalonesLUGAR_LIBRAMIENTO.AsString := DameLugar;
  QMTALONESTIPO_ASIENTO_KRI.AsString := REntorno.Asiento_TAL_P;
end;

function TDMTalones.DameTalon: integer;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE UT_MAYOR_TALON(?EMPRESA, ?EJERCICIO, ?CANAL)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        try
           ExecQuery;
           Result := StrToIntDef(FieldByName['MAXIMO'].AsString, 0);
        except
           Result := 0;
        end;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMTalones.QMTalonesAfterScroll(DataSet: TDataSet);
begin
  TipoTercero := QMTalonesTIPO_TERCERO.AsString;
  FMTalones.CambiaTipoTercero(TipoTercero);
  Tipos;
  FMTalones.AjustaCheckTalon(QMTalonesTalon.AsString);
  with QMDetalle do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CARTERA_TALONES ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO <= ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' SIGNO = ''P'' AND ');
     SelectSQL.Add(' TALON = ?TALON AND ');
     SelectSQL.Add(' TALON_AUTOMATICO = 1 AND ');
     SelectSQL.Add(' COD_CLI_PRO = ?COD_CLI_PRO ');
     SelectSQL.Add(' AND ((DOC_TIPO = ?TIPO) OR (DOC_TIPO = ?TIPO2) OR (DOC_TIPO = ?TIPO3) OR (DOC_TIPO = ?TIPO4)) ');
     Params.ByName['TIPO'].AsString := tipo;
     Params.ByName['TIPO2'].AsString := tipo2;
     Params.ByName['TIPO3'].AsString := tipo3;
     Params.ByName['TIPO4'].AsString := tipo4;
     Open;
  end;
  xInfoActualizada.Close;
  xInfoActualizada.Open;
end;

procedure TDMTalones.MostrarRecibosDisponibles;
var
  orden : string;
begin
  FMTalones.AjustaCheckTalon(QMTalonesTALON.AsString);
  with QMDetalle do
  begin
     DisableControls;
     Close;
     orden := OrdenadoPor;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CARTERA_TALONES ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' ((EMPRESA = ?EMPRESA) AND (EJERCICIO <= ?EJERCICIO) AND (CANAL = ?CANAL) ');
     SelectSQL.Add(' AND ((TALON = '''' AND PAGO_AUTORIZADO = 1) OR (TALON = ?TALON)) ');
     SelectSQL.Add(' AND (PAGADO = 0) ');
     SelectSQL.Add(' AND (COD_CLI_PRO = ?COD_CLI_PRO) ');
     SelectSQL.Add(' AND ((DOC_TIPO = ?TIPO) OR (DOC_TIPO = ?TIPO2) OR (DOC_TIPO = ?TIPO3) OR (DOC_TIPO = ?TIPO4))) ');
     SelectSQL.Add(' AND (CONFIRMING = 0) ');
     Params.ByName['TALON'].AsString := QMTalonesTALON.AsString;
     Params.ByName['TIPO'].AsString := tipo;
     Params.ByName['TIPO2'].AsString := tipo2;
     Params.ByName['TIPO3'].AsString := tipo3;
     Params.ByName['TIPO4'].AsString := tipo4;
     Params.ByName['COD_CLI_PRO'].AsInteger := QMTalonesCOD_CLI_PRO.AsInteger;
     Ordenar(orden);
     Open;
     EnableControls;
  end;
end;

procedure TDMTalones.QMDetalleAfterPost(DataSet: TDataSet);
var
  Titulo : string;
begin
  Graba(DataSet);
  xInfoActualizada.Close;
  xInfoActualizada.Open;

  // Si estoy marcando, debo verificar que el saldo de la cuenta sea mayor que el importe marcado
  if (QMDetalleTALON.AsString = QMTalonesTALON.AsString) then
  begin
     if (QMTalonesTIPO_TERCERO.AsString = 'PRO') then
        Titulo := DameTituloProveedor(QMTalonesCOD_CLI_PRO.AsInteger)
     else
        Titulo := DameTituloAcreedor(QMTalonesCOD_CLI_PRO.AsInteger);
     if (QMTalonesSALDO.AsFloat > xInfoActualizadaIMPORTE.AsFloat) then
        ShowMessage(Format(_('El saldo contable de %s es menor al importe a pagar.'), [Titulo]));
  end;
end;

procedure TDMTalones.SeleccionaTodos;
var
  Q : THYFIBQuery;
begin
  FMTalones.AjustaCheckTalon(QMTalonesTALON.AsString);

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE VER_CARTERA_TALONES SET TALON=?TALON WHERE ';
        QMDetalle.DameFiltroSelect(SQL);
        if Params.ByName['EMPRESA'] <> nil then
        begin
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        end;
        Params.ByName['TALON'].AsString := QMTalonesTALON.AsString;
        Params.ByName['TIPO'].AsString := tipo;
        Params.ByName['TIPO2'].AsString := tipo2;
        Params.ByName['TIPO3'].AsString := tipo3;
        Params.ByName['TIPO4'].AsString := tipo4;
        Params.ByName['COD_CLI_PRO'].AsInteger := QMTalonesCOD_CLI_PRO.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMDetalle.Close;
  QMDetalle.Open;
  xInfoActualizada.Close;
  xInfoActualizada.Open;
end;

procedure TDMTalones.Anticipos(Fecha: TDateTime);
var
  Saldo, tope : double;
  Moneda : string;
  Q : THYFIBQuery;
begin
  DMMain.SaldoAnticipo(TipoTercero, QMTalonesCOD_CLI_PRO.AsInteger, Fecha, Saldo, Moneda);
  if (Saldo <> 0) then
  begin
     tope := xInfoActualizadaIMPORTE.AsFloat;
     if (tope < Saldo) then
        Saldo := tope;

     if TFPregAnticipo.Create(Self).mostrar(Saldo, Moneda, Tope) then
     begin
        Q := THYFIBQuery.Create(nil);
        try
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_PON_ANTICIPO_TALON(?EMPRESA, ?EJERCICIO, ?CANAL, ?SIGNO, ?TALON, ?ANTICIPO)';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['SIGNO'].AsString := 'P';
              Params.ByName['TALON'].AsString := QMTalonesTALON.AsString;
              Params.ByName['ANTICIPO'].AsFloat := Saldo;
              ExecQuery;
              FreeHandle;
           end;
        finally
           FreeAndNil(Q);
        end;
     end;
  end;
end;

procedure TDMTalones.CierraTalon(RefrescaDatos: boolean = True);
var
  Q : THYFIBQuery;
  // id_cartera_det : integer; No se utiliza
begin
  Anticipos(QMTalonesFECHA_LIBRAMIENTO.AsDateTime);
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_PAGA_TALON(?EMPRESA, ?EJERCICIO, ?CANAL, ?TALON, ?ENTRADA, ?RETENCION, ?TIPO_RETENCION)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['TALON'].AsString := QMTalonesTALON.AsString;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['RETENCION'].AsInteger := QMDetalleRETENCION.AsInteger;
        Params.ByName['TIPO_RETENCION'].AsInteger := QMDetalleTIPO_RETENCION.AsInteger;
        ExecQuery;
        {id_cartera_det:= FieldByName['ID_CARTERA_DET'].AsInteger; No se utiliza}
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  if (RefrescaDatos) then
  begin
     with QMTalones do
     begin
        DisableControls;
        try
           Refresh;
        finally
           EnableControls;
        end;
     end;
     QMTalonesAfterScroll(QMTalones); {Para refrescar el detalle y que solo queden los del pagare}
  end;
end;

procedure TDMTalones.CierraTalonTodosKri;
var
  BM : string;
begin
  {dji lrk kri - Contabiliza todos los talones no contabilizados que esten en el filtro - Fercam}
  with QMTalones do
  begin
     {Tomo la posicion}
     BM := QMTalonesTALON.AsString;
     DisableControls;
     First;
     while (not EOF) do
     begin
        if (QMTalonesPAGADO.AsInteger = 0) then
        begin
           try
              CierraTalon(False);
           except
              on E: Exception do
                 MessageDlg(_('Talón') + ' ' + QMTalonesTALON.AsString + #13#10 + E.Message, mtError, [mbOK], 0);
           end;
        end;
        Next;
     end;
     {Vuelvo a posicionarme donde estaba}
     First;
     while ((not EOF) and (QMTalonesTALON.AsString <> BM)) do
        Next;
     Refresh;
     EnableControls;
     xInfoActualizada.Close;
     xInfoActualizada.Open;
  end;
end;

procedure TDMTalones.AbreTalon;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_DESPAGA_TALON(?EMPRESA, ?EJERCICIO, ?CANAL, ?TALON, ?ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['TALON'].AsString := QMTalonesTALON.AsString;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  QMTalones.Refresh;
  xInfoActualizada.Close;
  xInfoActualizada.Open;
end;

procedure TDMTalones.FiltraDetalle;
var
  orden : string;
begin
  with QMDetalle do
  begin
     DisableControls;
     try
        Close;
        orden := OrdenadoPor;
        Ordenar('');
        TFBusca.Create(Self).SeleccionaBusqueda(QMDetalle, '11100', False);
        if Active then
           Close;
        SelectSQL.Add(' AND ((TALON = '''' AND PAGO_AUTORIZADO = 1) OR (TALON = ?TALON)) ');
        SelectSQL.Add(' AND (PAGADO = 0) AND (COD_CLI_PRO = ?COD_CLI_PRO) ');
        SelectSQL.Add(' AND ((DOC_TIPO = ?TIPO) OR (DOC_TIPO = ?TIPO2) OR (DOC_TIPO = ?TIPO3) OR (DOC_TIPO = ?TIPO4)) ');
        SelectSQL.Add(' OR ((PAGADO = 1) AND (TALON = ?TALON) AND (TALON_AUTOMATICO = 1)) ');
        Params.ByName['TALON'].AsString := QMTalonesTALON.AsString;
        Params.ByName['TIPO'].AsString := tipo;
        Params.ByName['TIPO2'].AsString := tipo2;
        Params.ByName['TIPO3'].AsString := tipo3;
        Params.ByName['TIPO4'].AsString := tipo4;
        Params.ByName['COD_CLI_PRO'].AsInteger := QMTalonesCOD_CLI_PRO.AsInteger;
        Ordenar(orden);
        Open;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMTalones.CambiaCod_Pro(Tipo: string; Cod_Pro_Acr: integer; var Titulo: string);
begin
  TipoTercero := Tipo;
  Tipos;
  QMTalonesTIPO_TERCERO.AsString := Tipo;

  if Tipo = 'PRO' then
     Titulo := DameTituloProveedor(Cod_Pro_Acr)
  else
  if Tipo = 'ACR' then
     Titulo := DameTituloAcreedor(Cod_Pro_Acr);
end;

function TDMTalones.Detalle: boolean;
begin
  Result := False;
  if QMTalones.State <> dsInsert then {dji lrk kri - Fercam - Sino problemas para insertar talones}
     if xInfoActualizadaIMPORTE.AsFloat > 0 then
        Result := True
     else
        Result := False;
end;

procedure TDMTalones.QMTalonesCOD_CLI_PROChange(Sender: TField);
begin
  if (Detalle and (QMTalones.State = dsEdit)) then
     QMTalones.Cancel;
end;

procedure TDMTalones.Tipos;
begin
  if (TipoTercero = 'PRO') then
  begin
     tipo := 'FAP';
     tipo2 := 'AGP';
     tipo3 := 'NRP';
     tipo4 := 'AFP';
  end
  else
  begin
     tipo := 'FCR';
     tipo2 := 'AGA';
     tipo3 := 'NRA';
     tipo4 := 'AFA';
  end;
end;

procedure TDMTalones.QMDetalleNewRecord(DataSet: TDataSet);
begin
  if ((QMTalones.State = dsEdit) or (QMTalones.State = dsInsert)) then
     QMTalones.Post;

  if QMDetalle.State = dsInsert then
     DataSet.Cancel;
end;

procedure TDMTalones.QMDetalleBeforeEdit(DataSet: TDataSet);
begin
  if ((QMTalones.State = dsEdit) or (QMTalones.State = dsInsert)) then
     QMTalones.Post;
end;

function TDMTalones.DameLugar: string;
begin
  {dji lrk kri - Devuelvo el ultimo que entre}
  Result := UltimoLugarLibramientoKri;
end;

procedure TDMTalones.MostrarCartaPago(modo, NoContabilizado: smallint; SerieKri: string);
begin
  AbreData(TDMLstTalones, DMLstTalones);
  DMLstTalones.MostrarCartaPago(QMTalonesTALON.AsString, modo, NoContabilizado, SerieKri);
  CierraData(DMlstTalones);
end;

procedure TDMTalones.Recibos;
begin
  if QMDetalle.RecordCount > 0 then
     QMDetalle.Edit;
end;

procedure TDMTalones.QMDetalleLIQUIDO_MONEDAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMDetalleMONEDA.AsString, 1),
     QMDetalleLIQUIDO.AsFloat);
end;

procedure TDMTalones.QMTalonesTIPO_ASIENTO_KRIChange(Sender: TField);
begin
  REntorno.Asiento_TAL_P := Sender.AsString;
end;

procedure TDMTalones.BusquedaCompleja;
var
  orden : string;
begin
  if (TFBusca.Create(Self).SeleccionaBusqueda(QMTalones, '11100', False) <> mrCancel) then
  begin
     orden := QMTalones.OrdenadoPor;
     QMTalones.ordenar('');
     QMTalones.Ordenar(orden);
  end;
  QMTalones.Open;
end;

procedure TDMTalones.QMTalonesBeforeCancel(DataSet: TDataSet);
begin
  // NumTalon := QMTalonesTALON.AsString;
end;

procedure TDMTalones.QMTalonesAfterCancel(DataSet: TDataSet);
begin
  // QMTalonesTALON.AsString := NumTalon;
end;

procedure TDMTalones.MostrarListadoTalones(modo: smallint; NoContabilizado: boolean; SerieKri: string);
begin
  AbreData(TDMLstTalones, DMLstTalones);
  DMLstTalones.MostrarListadoTalones(QMTalonesTALON.AsString, QMTalonesTALON.AsString, modo, NoContabilizado, SerieKri);
  CierraData(DMLstTalones);
end;

procedure TDMTalones.GeneraTalones(FechaDesde, FechaHasta: TDateTime; Serie: string; Banco: integer; Lugar: string);
var
  Talon : integer;
  Q : THYFIBQuery;
  DS : TFIBDataSet;
  T : TFIBTransaction;
begin
  {Busco el numero maximo de talon}
  Talon := DameTalon;

  {Genero talones de proveedor}
  DS := TFIBDataSet.Create(nil);
  T := TFIBTransaction.Create(nil);
  try
     with T do
     begin
        DefaultDatabase := DMMain.DataBase;
        TRParams.Clear;
        TRParams.Add('read_committed');
        TRParams.Add('read');
     end;
     with DS do
     begin
        Close;
        DataBase := DMMain.DataBase;
        Transaction := T;
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;
        SelectSQL.Clear;
        SelectSQL.Add('SELECT ECD.EMPRESA, ECD.EJERCICIO, ECD.CANAL, ECT.TALON, ECD.ID_CARTERA_DETALLE, EC.COD_CLI_PRO, ');
        SelectSQL.Add('       T.NOMBRE_R_SOCIAL,ECD.VENCIMIENTO,ECD.LIQUIDO,ecd.documento, ');
        SelectSQL.Add('       ECT.MARCA_CONT,EC.DOC_NUMERO, EC.DOC_SERIE, ECT.BANCO');
        SelectSQL.Add('FROM EMP_CARTERA EC ');
        SelectSQL.Add('join EMP_CARTERA_DETALLE ECD ');
        SelectSQL.Add('ON EC.id_cartera = ECD.id_cartera ');
        SelectSQL.Add('LEFT JOIN EMP_CARTERA_TALONES ECT ');
        SelectSQL.Add('ON EC.EMPRESA = ECT.EMPRESA AND ');
        SelectSQL.Add('   EC.EJERCICIO = ECT.EJERCICIO AND ');
        SelectSQL.Add('   EC.CANAL = ECT.CANAL AND ');
        SelectSQL.Add('   ECD.documento = ECT.TALON ');
        SelectSQL.Add('JOIN EMP_PROVEEDORES EP ');
        SelectSQL.Add('ON EC.EMPRESA = EP.EMPRESA AND ');
        SelectSQL.Add('   EC.cod_cli_pro = EP.proveedor ');
        SelectSQL.Add('JOIN SYS_TERCEROS T ');
        SelectSQL.Add('ON EP.TERCERO=T.TERCERO ');
        SelectSQL.Add('JOIN SYS_TERCEROS_direcciones Td ');
        SelectSQL.Add('ON t.TERCERO=Td.TERCERO ');
        SelectSQL.Add('JOIN SYS_LOCALIDADES L ');
        SelectSQL.Add('on td.id_local=l.id_local ');
        SelectSQL.Add('WHERE ');
        SelectSQL.Add('EC.EMPRESA=?EMPRESA  AND ');
        SelectSQL.Add('EC.EJERCICIO<=?EJERCICIO AND ');
        SelectSQL.Add('EC.CANAL=?CANAL AND ');
        SelectSQL.Add('(EC.DOC_TIPO=''FAP'' OR EC.DOC_TIPO=''AGP'' OR ');
        SelectSQL.Add('EC.DOC_TIPO=''NRP'' OR EC.DOC_TIPO=''AFP'') AND ');
        {**} SelectSQL.Add('(ECD.VENCIMIENTO>=?FECHA_DESDE AND ECD.VENCIMIENTO<=?FECHA_HASTA) AND ');
        {**} SelectSQL.Add('EC.DOC_SERIE=?SERIE AND ');

        SelectSQL.Add('ECD.PAGADO=0 AND ');
        SelectSQL.Add('ECD.VISIBLE=1 AND ');
        SelectSQL.Add('L.PAIS=?PAIS AND ');
        SelectSQL.Add('(ECT.PAGADO=0 OR ECT.PAGADO is null) AND ');
        SelectSQL.Add('(ecd.doc_automatico=0) and ');
        SelectSQL.Add('(ecd.confirming=0) and ');
        SelectSQL.Add('(ecd.ord_pago=0) and ');
        SelectSQL.Add('td.dir_defecto=1 ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PAIS'].AsString := 'ESP';
        Params.ByName['SERIE'].AsString := Serie;

        Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
        Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;

        Open;
        while not EOF do
        begin
           {Genero Cabecera}
           Q := THYFIBQuery.Create(nil);
           Talon := Talon + 1;
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'INSERT INTO VER_TALONES (EMPRESA, EJERCICIO, CANAL, TIPO_TERCERO, COD_CLI_PRO, TALON, DESCRIPCION, BANCO, FECHA_LIBRAMIENTO,LUGAR_LIBRAMIENTO,MARCA_CONT) ' +
                 'VALUES (?EMPRESA,?EJERCICIO,?CANAL,?TIPO_TERCERO,?COD_CLI_PRO,?TALON,?DESCRIPCION,?BANCO,?FECHA_LIBRAMIENTO,?LUGAR_LIBRAMIENTO,?MARCA_CONT)';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['TIPO_TERCERO'].AsString := 'PRO';
              Params.ByName['COD_CLI_PRO'].AsInteger := DS.FieldByName('COD_CLI_PRO').AsInteger;
              Params.ByName['TALON'].AsString := IntToStr(Talon);
              Params.ByName['DESCRIPCION'].AsString := 'NTRO. PAGO ' + DS.FieldByName('DOC_SERIE').AsString + '/' + DS.FieldByName('DOC_NUMERO').AsString;
              Params.ByName['BANCO'].AsInteger := Banco;
              Params.ByName['FECHA_LIBRAMIENTO'].AsDateTime := FechaHasta;
              Params.ByName['LUGAR_LIBRAMIENTO'].AsString := Lugar;
              Params.ByName['MARCA_CONT'].AsInteger := 1;
              ExecQuery;
              FreeHandle;
           end;
           FreeAndNil(Q);

           {Genero Detalle}
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'UPDATE EMP_CARTERA_DETALLE SET DOCUMENTO=?TALON, DOC_AUTOMATICO=1 WHERE ID_CARTERA_DETALLE =?ID_CARTERA_DETALLE';
              Params.ByName['ID_CARTERA_DETALLE'].AsInteger := DS.FieldByName('ID_CARTERA_DETALLE').AsInteger;
              Params.ByName['TALON'].AsString := IntToStr(Talon);
              ExecQuery;
              FreeHandle;
           end;
           FreeAndNil(Q);

           Next;
        end;
        Close;
        Transaction.Commit;
     end;
  finally
     FreeAndNil(T);
     FreeAndNil(DS);
  end;

  {Genero talones de acreedor}
  DS := TFIBDataSet.Create(nil);
  T := TFIBTransaction.Create(nil);
  try
     with T do
     begin
        DefaultDatabase := DMMain.DataBase;
        TRParams.Clear;
        TRParams.Add('read_committed');
        TRParams.Add('read');
     end;
     with DS do
     begin
        Close;
        DataBase := DMMain.DataBase;
        Transaction := T;
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;
        SelectSQL.Clear;
        SelectSQL.Add('SELECT ECD.EMPRESA, ECD.EJERCICIO, ECD.CANAL, ECT.TALON, ECD.ID_CARTERA_DETALLE, EC.COD_CLI_PRO, ');
        SelectSQL.Add('       T.NOMBRE_R_SOCIAL,ECD.VENCIMIENTO,ECD.LIQUIDO,ecd.documento, ');
        SelectSQL.Add('       ECT.MARCA_CONT,EC.DOC_NUMERO,EC.DOC_SERIE ');
        SelectSQL.Add('FROM EMP_CARTERA EC ');
        SelectSQL.Add('join EMP_CARTERA_DETALLE ECD ');
        SelectSQL.Add('ON EC.id_cartera = ECD.id_cartera ');
        SelectSQL.Add('LEFT JOIN EMP_CARTERA_TALONES ECT ');
        SelectSQL.Add('ON EC.EMPRESA = ECT.EMPRESA AND ');
        SelectSQL.Add('   EC.EJERCICIO = ECT.EJERCICIO AND ');
        SelectSQL.Add('   EC.CANAL = ECT.CANAL AND ');
        SelectSQL.Add('   ECD.documento = ECT.TALON ');
        SelectSQL.Add('JOIN EMP_ACREEDORES EP ');
        SelectSQL.Add('ON EC.EMPRESA = EP.EMPRESA AND ');
        SelectSQL.Add('   EC.cod_cli_pro = EP.ACREEDOR ');
        SelectSQL.Add('JOIN SYS_TERCEROS T ');
        SelectSQL.Add('ON EP.TERCERO=T.TERCERO ');
        SelectSQL.Add('JOIN SYS_TERCEROS_direcciones Td ');
        SelectSQL.Add('ON t.TERCERO=Td.TERCERO ');
        SelectSQL.Add('JOIN SYS_LOCALIDADES L ');
        SelectSQL.Add('on td.id_local=l.id_local ');
        SelectSQL.Add('WHERE ');
        SelectSQL.Add('EC.EMPRESA=?EMPRESA  AND ');
        SelectSQL.Add('EC.EJERCICIO<=?EJERCICIO AND ');
        SelectSQL.Add('EC.CANAL=?CANAL AND ');
        SelectSQL.Add('EP.GENERA_TALONES=1 AND ');
        SelectSQL.Add('(EC.DOC_TIPO=''FCR'' OR EC.DOC_TIPO=''AGA'' OR ');
        SelectSQL.Add('EC.DOC_TIPO=''NRA'' OR EC.DOC_TIPO=''AFA'') AND ');
        {**} SelectSQL.Add('(ECD.VENCIMIENTO>=?FECHA_DESDE AND ECD.VENCIMIENTO<=?FECHA_HASTA) AND ');
        {**} SelectSQL.Add('EC.DOC_SERIE=?SERIE AND ');

        SelectSQL.Add('ECD.PAGADO=0 AND ');
        SelectSQL.Add('ECD.VISIBLE=1 and ');
        SelectSQL.Add('L.PAIS=?PAIS AND ');
        SelectSQL.Add('(ECT.PAGADO=0 or ECT.PAGADO is null) AND ');
        SelectSQL.Add('(ecd.doc_automatico=0) and ');
        SelectSQL.Add('(ecd.confirming=0) and ');
        SelectSQL.Add('(ecd.ord_pago=0) and ');
        SelectSQL.Add('td.dir_defecto=1 ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['PAIS'].AsString := 'ESP';
        Params.ByName['SERIE'].AsString := Serie;

        Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
        Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;

        Open;
        while not EOF do
        begin
           {Genero Cabecera}
           Q := THYFIBQuery.Create(nil);
           Talon := Talon + 1;
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'INSERT INTO VER_TALONES (EMPRESA, EJERCICIO, CANAL, TIPO_TERCERO, COD_CLI_PRO, TALON, DESCRIPCION, BANCO, FECHA_LIBRAMIENTO,LUGAR_LIBRAMIENTO,MARCA_CONT) ' +
                 'VALUES (?EMPRESA,?EJERCICIO,?CANAL,?TIPO_TERCERO,?COD_CLI_PRO,?TALON,?DESCRIPCION,?BANCO,?FECHA_LIBRAMIENTO,?LUGAR_LIBRAMIENTO,?MARCA_CONT)';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['TIPO_TERCERO'].AsString := 'ACR';
              Params.ByName['COD_CLI_PRO'].AsInteger := DS.FieldByName('COD_CLI_PRO').AsInteger;
              Params.ByName['TALON'].AsString := IntToStr(Talon);
              Params.ByName['DESCRIPCION'].AsString := 'NTRO. PAGO ' + DS.FieldByName('DOC_SERIE').AsString + '/' + DS.FieldByName('DOC_NUMERO').AsString;
              Params.ByName['BANCO'].AsInteger := Banco;
              Params.ByName['FECHA_LIBRAMIENTO'].AsDateTime := FechaHasta;
              Params.ByName['LUGAR_LIBRAMIENTO'].AsString := Lugar;
              Params.ByName['MARCA_CONT'].AsInteger := 1;
              ExecQuery;
              FreeHandle;
           end;
           FreeAndNil(Q);

           {Genero Detalle}
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'UPDATE EMP_CARTERA_DETALLE SET DOCUMENTO=?TALON, DOC_AUTOMATICO=1 WHERE ID_CARTERA_DETALLE =?ID_CARTERA_DETALLE';
              Params.ByName['ID_CARTERA_DETALLE'].AsInteger := DS.FieldByName('ID_CARTERA_DETALLE').AsInteger;
              Params.ByName['TALON'].AsString := IntToStr(Talon);
              ExecQuery;
              FreeHandle;
           end;
           FreeAndNil(Q);

           Next;
        end;
        Close;
        Transaction.Commit;
     end;
  finally
     FreeAndNil(T);
     FreeAndNil(DS);
  end;

  {Refresco la tabla de talones generados}
  QMTalones.Close;
  QMTalones.Open;
  xTalonesPendientes.Close;
  xTalonesPendientes.Open;
end;

procedure TDMTalones.BorraTalones;
var
  Q : THYFIBQuery;
  //  DS : TFIBDataSet;
  //  T : TFIBTransaction;
  Codigo, Talon : string;
  TalonesNoContabilizados : integer;
begin
  {Verificamos si hay talones pendientes de contabilizar}
  with Q do
  begin
     Q := THYFIBQuery.Create(nil);
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT COUNT(*) FROM VER_TALONES WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND PAGADO=0';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     ExecQuery;
     TalonesNoContabilizados := FieldByName['COUNT'].AsInteger;
     FreeHandle;
  end;
  FreeAndNil(Q);
  if (TalonesNoContabilizados > 0) then
     if MessageDlg(_('Existen talones no contabilizados, desea continuar?'), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        TalonesNoContabilizados := 0;

  if (TalonesNoContabilizados = 0) then
  begin
     with Q do
     begin
        Q := THYFIBQuery.Create(nil);
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM VER_TALONES WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND PAGADO=0 AND MARCA_CONT=0';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        FreeHandle;
     end;
     FreeAndNil(Q);

     { AGRUPANDO PROVEEDORES }
     xTalonesPendientes.Close;
     xTalonesPendientes.Ordenar('COD_CLI_PRO');
     xTalonesPendientes.Open;
     xTalonesPendientes.DisableControls;
     while not xTalonesPendientes.EOF do
     begin
        Codigo := xTalonesPendientesCOD_CLI_PRO.AsString;
        Talon := xTalonesPendientesTalon.AsString;
        xTalonesPendientes.Next;

        while ((Codigo = xTalonesPendientesCOD_CLI_PRO.AsString) and (not xTalonesPendientes.EOF)) do
        begin
           if (xTalonesPendientesTIPO_TERCERO.AsString = 'PRO') then
           begin
              {Cambio el registro de cartera del talon que tiene al que lo agrupa}
              with Q do
              begin
                 Q := THYFIBQuery.Create(nil);
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'UPDATE EMP_CARTERA_DETALLE SET DOCUMENTO=?DOCUMENTO_UNICO WHERE EMPRESA=?EMPRESA AND /*EJERCICIO=?EJERCICIO AND*/ CANAL=?CANAL AND SIGNO=''P'' AND DOCUMENTO=?DOCUMENTO AND DOC_AUTOMATICO=1';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 {params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;}
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['DOCUMENTO'].AsString := xTalonesPendientesTALON.AsString;
                 Params.ByName['DOCUMENTO_UNICO'].AsString := Talon;
                 ExecQuery;
                 FreeHandle;
              end;
              FreeAndNil(Q);

              {Recalculo el total del talón que agrupa, pues por triggers no lo hace}
              with Q do
              begin
                 Q := THYFIBQuery.Create(nil);
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'update EMP_CARTERA_TALONES ' +
                    'SET IMPORTE=(SELECT SUM(LIQUIDO) from emp_cartera_Detalle ' +
                    '   where ' +
                    '   empresa=?EMPRESA and ' +
                    '   /*ejercicio=?EJERCICIO and*/ ' +
                    '   canal=?CANAL and ' +
                    '   signo=''P'' and ' +
                    '   documento=?DOCUMENTO and ' +
                    '   doc_automatico=1) ' +
                    'WHERE ' +
                    'empresa=?EMPRESA and ' +
                    'ejercicio=?EJERCICIO and ' +
                    'canal=?CANAL and ' +
                    'talon=?DOCUMENTO';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['DOCUMENTO'].AsString := Talon;
                 ExecQuery;
                 FreeHandle;
              end;
              FreeAndNil(Q);

              { Borro el talon que ahora está vacio }
              with Q do
              begin
                 Q := THYFIBQuery.Create(nil);
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'DELETE FROM EMP_CARTERA_TALONES WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND TALON=?TALON';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['TALON'].AsString := xTalonesPendientesTALON.AsString;
                 ExecQuery;
                 FreeHandle;
              end;
              FreeAndNil(Q);
           end;
           xTalonesPendientes.Next;
        end;
     end;

     { AGRUPANDO ACREEDORES }

     xTalonesPendientes.Close;
     xTalonesPendientes.Ordenar('COD_CLI_PRO');
     xTalonesPendientes.Open;
     while not xTalonesPendientes.EOF do
     begin
        Codigo := xTalonesPendientesCOD_CLI_PRO.AsString;
        Talon := xTalonesPendientesTalon.AsString;
        xTalonesPendientes.Next;

        while ((Codigo = xTalonesPendientesCOD_CLI_PRO.AsString) and (not xTalonesPendientes.EOF)) do
        begin
           if (xTalonesPendientesTIPO_TERCERO.AsString = 'ACR') then
           begin
              {Cambio el registro de cartera del talon que tiene al que lo agrupa}
              with Q do
              begin
                 Q := THYFIBQuery.Create(nil);
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'UPDATE EMP_CARTERA_DETALLE SET DOCUMENTO=?DOCUMENTO_UNICO WHERE EMPRESA=?EMPRESA AND /*EJERCICIO=?EJERCICIO AND*/ CANAL=?CANAL AND SIGNO=''P'' AND DOCUMENTO=?DOCUMENTO AND DOC_AUTOMATICO=1';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 {params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;}
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['DOCUMENTO'].AsString := xTalonesPendientesTALON.AsString;
                 Params.ByName['DOCUMENTO_UNICO'].AsString := Talon;
                 ExecQuery;
                 FreeHandle;
              end;
              FreeAndNil(Q);

              {Recalculo el total del talón que agrupa, pues por triggers no lo hace}
              with Q do
              begin
                 Q := THYFIBQuery.Create(nil);
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'update EMP_CARTERA_TALONES ' +
                    'SET IMPORTE=(SELECT SUM(LIQUIDO) from emp_cartera_Detalle ' +
                    '   where ' +
                    '   empresa=?EMPRESA and ' +
                    '   /*ejercicio=?EJERCICIO and*/ ' +
                    '   canal=?CANAL and ' +
                    '   signo=''P'' and ' +
                    '   documento=?DOCUMENTO and ' +
                    '   doc_automatico=1) ' +
                    'WHERE ' +
                    'empresa=?EMPRESA and ' +
                    'ejercicio=?EJERCICIO and ' +
                    'canal=?CANAL and ' +
                    'talon=?DOCUMENTO';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['DOCUMENTO'].AsString := Talon;
                 ExecQuery;
                 FreeHandle;
              end;
              FreeAndNil(Q);

              { Borro el talon que ahora está vacio }
              with Q do
              begin
                 Q := THYFIBQuery.Create(nil);
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'DELETE FROM EMP_CARTERA_TALONES WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND TALON=?TALON';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['TALON'].AsString := xTalonesPendientesTALON.AsString;
                 ExecQuery;
                 FreeHandle;
              end;
              FreeAndNil(Q);
           end;
           xTalonesPendientes.Next;
        end;
     end;

     {Refresco la tabla de talones}
     QMTalones.Close;
     QMTalones.Open;
     xTalonesPendientes.Close;
     xTalonesPendientes.Open;
     xTalonesPendientes.EnableControls;
  end;
end;

procedure TDMTalones.xTalonesPendientesAfterOpen(DataSet: TDataSet);
begin
  xIncidencias.Open;
end;

procedure TDMTalones.xTalonesPendientesBeforeClose(DataSet: TDataSet);
begin
  xIncidencias.Close;
end;

procedure TDMTalones.Refrescar;
var
  BM : TBookmark;
begin
  /// Refresca los datos del talon, manteniendo la posicion del detalle
  BM := QMDetalle.GetBookmark;
  try
     QMTalones.Refresh;
     QMDetalle.GotoBookmark(BM);
  finally
     QMDetalle.FreeBookmark(BM);
  end;
end;

procedure TDMTalones.QMTalonesCalcFields(DataSet: TDataSet);
var
  SaldoDeudor : double;
  SaldoAcreedor : double;
  Saldo : double;
  Tipo : string;
begin
  /// Calculo los saldos contables.
  SaldoDeudor := 0;
  SaldoAcreedor := 0;
  Saldo := 0;
  if FCalcularSaldo then
  begin
     if (QMTalonesTIPO_TERCERO.AsString = 'PRO') then
        Tipo := 'P'
     else
        Tipo := 'A';
     DMMain.DameSaldoCliPro(' ', Tipo, QMTalonesCOD_CLI_PRO.AsInteger, SaldoDeudor, SaldoAcreedor, Saldo);
     QMTalonesSALDO_DEUDOR.AsFloat := SaldoDeudor;
     QMTalonesSALDO_ACREEDOR.AsFloat := SaldoAcreedor;
     QMTalonesSALDO.AsFloat := Saldo;
  end;

  QMTalonesSALDO_DEUDOR.AsFloat := SaldoDeudor;
  QMTalonesSALDO_ACREEDOR.AsFloat := SaldoAcreedor;
  QMTalonesSALDO.AsFloat := Saldo;
end;

procedure TDMTalones.SetCalcularSaldo(const Value: boolean);
begin
  FCalcularSaldo := Value;
  QMTalonesCalcFields(QMTalones);
end;

procedure TDMTalones.CrearNormaSabadell(Archivo: string);
var
  NIF, CodigoPostal, Poblacion : string;
  Banco, Oficina, Cuenta : string;
  Q : THYFIBQuery;
  NombreBeneficiario, Direccion, Provincia : string;
  DescripcionDocumento : string;
begin
  /// Crea la norma para emision de cheques/pagares del Banco Sabadell.
  /// Toma todos los registros filtrados.

  Inicializa(Archivo, tlChequeCuentaCorriente, feEntregaAlBeneficiario, teBSOnline);

  // Obtengo solo los 9 digitos del NIF de la empresa
  if ((Length(REntorno.CifEmpresa) > 9) and (REntorno.Pais = 'ESP')) then // NIF Ordenante
     NIF := Copy(REntorno.CifEmpresa, Length(REntorno.CifEmpresa) - 8, 9)
  else
     NIF := REntorno.CifEmpresa;

  // Obtengo datos necesarios de la empresa
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT L.CODIGO_POSTAL, L.TITULO AS LOCALIDAD ');
        SQL.Add(' FROM SYS_EMPRESAS E ');
        SQL.Add(' JOIN SYS_TERCEROS T ON E.TERCERO = T.TERCERO ');
        SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO ');
        SQL.Add(' JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL ');
        SQL.Add(' WHERE ');
        SQL.Add(' E.EMPRESA = :EMPRESA AND ');
        SQL.Add(' D.DIR_DEFECTO = 1 ');
        Params.ByName['EMPRESA'].AsInteger := QMTalonesEMPRESA.AsInteger;
        ExecQuery;
        CodigoPostal := Trim(FieldByName['CODIGO_POSTAL'].AsString);
        Poblacion := Trim(FieldByName['LOCALIDAD'].AsString);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  // Obtengo datos del banco
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'SELECT ENTIDAD, SUCURSAL, CUENTA_CORRIENTE FROM EMP_BANCOS WHERE EMPRESA = :EMPRESA AND BANCO = :BANCO';
     Params.ByName['EMPRESA'].AsInteger := QMTalonesEMPRESA.AsInteger;
     Params.ByName['BANCO'].AsInteger := QMTalonesBANCO.AsInteger;
     ExecQuery;
     Banco := FieldByName['ENTIDAD'].AsString;
     Oficina := FieldByName['SUCURSAL'].AsString;
     Cuenta := Trim(FieldByName['CUENTA_CORRIENTE'].AsString);
     FreeHandle;
  end;
  FreeAndNil(Q);

  Ordenante(NIF, Today, QMTalonesFECHA_LIBRAMIENTO.AsDateTime, Banco, Oficina, Cuenta, QMTalonesDESCRIPCION.AsString {ConceptoComun});
  DomicilioOrdenante(REntorno.NombreEmpresa, REntorno.DirEmpresa, CodigoPostal, Poblacion);

  QMTalones.First;
  while (not QMTalones.EOF) do
  begin
     // Datos del beneficiario
     // Prefiero la direccion clase 3 (Dirección para recibos)
     // Si no existe tomo la que esté por defecto de la clase 1 (Dirección Administrativa)
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST 1 T.NIF, T.TIPO_RAZON, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, ');
           SQL.Add(' D.DIR_COMPLETA_N, L.CODIGO_POSTAL, L.TITULO AS LOCALIDAD, P.TITULO AS PROVINCIA, L.PAIS ');
           if (QMTalonesTIPO_TERCERO.AsString = 'ACR') then    // Nombre Beneficiario
              SQL.Add(' FROM EMP_ACREEDORES AP ')
           else
              SQL.Add(' FROM EMP_PROVEEDORES AP ');
           SQL.Add(' JOIN SYS_TERCEROS T ON AP.TERCERO = T.TERCERO ');
           SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO ');
           SQL.Add(' JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL ');
           SQL.Add(' JOIN SYS_PROVINCIAS P ON L.PAIS = P.PAIS AND L.PROVINCIA = P.PROVINCIA ');
           SQL.Add(' WHERE ');
           SQL.Add(' AP.EMPRESA = :EMPRESA AND ');
           if (QMTalonesTIPO_TERCERO.AsString = 'ACR') then
              SQL.Add(' AP.ACREEDOR = :COD_CLI_PRO AND ')
           else
              SQL.Add(' AP.PROVEEDOR = :COD_CLI_PRO AND ');
           SQL.Add(' D.DIR_CLASE IN (1, 3) ');
           SQL.Add(' ORDER BY D.DIR_CLASE DESC, D.DIR_DEFECTO DESC ');
           Params.ByName['EMPRESA'].AsInteger := QMTalonesEMPRESA.AsInteger;
           Params.ByName['COD_CLI_PRO'].AsInteger := QMTalonesCOD_CLI_PRO.AsInteger;
           ExecQuery;
           NombreBeneficiario := Copy(FieldByName['NOMBRE_R_SOCIAL'].AsString, 1, 40);
           CodigoPostal := Trim(FieldByName['CODIGO_POSTAL'].AsString);
           Poblacion := Trim(FieldByName['LOCALIDAD'].AsString);
           Provincia := Trim(FieldByName['PROVINCIA'].AsString);
           Direccion := FieldByName['DIR_COMPLETA_N'].AsString;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;

     Beneficiario(QMDetalleCOD_CLI_PRO.AsString, QMTalonesIMPORTE.AsFloat, QMDetalleVENCIMIENTO.AsDateTime, NombreBeneficiario, Direccion, CodigoPostal, idCastellano, True {DocumentoBarrado});
     PoblacionBeneficiario(Poblacion, Provincia);

     QMDetalle.First;
     while (not QMDetalle.EOF) do
     begin
        DescripcionDocumento := QMTalonesTALON.AsString + '-';
        if (QMDetalleDOC_TIPO.AsString = 'FCR') then
           DescripcionDocumento := DescripcionDocumento + _('Factura') + ' ' + QMDetalleNUM_FACTURA_ACR.AsString + ' (' + QMDetalleDOC_SERIE.AsString + '/' + QMDetalleDOC_NUMERO.AsString + '.' + QMDetalleLINEA.AsString + ')';
        if (QMDetalleDOC_TIPO.AsString = 'FAP') then
           DescripcionDocumento := DescripcionDocumento + _('Factura') + ' ' + QMDetalleNUM_FACTURA_PROV.AsString + ' (' + QMDetalleDOC_SERIE.AsString + '/' + QMDetalleDOC_NUMERO.AsString + '.' + QMDetalleLINEA.AsString + ')';
        if ((QMDetalleDOC_TIPO.AsString = 'AGA') or (QMDetalleDOC_TIPO.AsString = 'AGP')) then
           DescripcionDocumento := DescripcionDocumento + _('Agrupacion de Recibos');
        if ((QMDetalleDOC_TIPO.AsString = 'NRA') or (QMDetalleDOC_TIPO.AsString = 'NRP')) then
           DescripcionDocumento := DescripcionDocumento + _('Recibo') + ' ' + QMDetalleREGISTRO.AsString + '.' + QMDetalleLINEA.AsString;
        if ((QMDetalleDOC_TIPO.AsString = 'AFA') or (QMDetalleDOC_TIPO.AsString = 'AFP')) then
           DescripcionDocumento := DescripcionDocumento + _('Asiendo de Factura') + ' ' + QMDetalleREGISTRO.AsString + '.' + QMDetalleLINEA.AsString;

        if (Trim(DescripcionDocumento) > '') then
           ConceptoBeneficiario(DescripcionDocumento);
        QMDetalle.Next;
     end;

     QMTalones.Next;
  end;
  Finaliza;
end;

procedure TDMTalones.LeerRespuestaNormaSabadell(Archivo: string);
var
  Q : THYFIBQuery;
  i : integer;
  sl : TStrings;
  s : string;
  Talon, TalonPapel, NroSabadell : string;
  slErrores : TStrings;
  Existe : boolean;
begin
  /// Lee la respuesta a la norma para emision de cheques/pagares del Banco Sabadell.
  /// Asigna el numero de cheque del banco a los talones

  sl := TStringList.Create;
  slErrores := TStringList.Create;
  try
     sl.LoadFromFile(Archivo);
     for i := 0 to sl.Count - 1 do
     begin
        s := sl[i];
        Talon := Copy(s, 133, 73);
        Talon := Copy(Talon, 1, Pos('-', Talon) - 1);
        NroSabadell := Copy(s, 55, 7);

        Q := THYFIBQuery.Create(nil);
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT TALON, TALON_PAPEL ');
           SQL.Add(' FROM EMP_CARTERA_TALONES ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' TALON = :TALON ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['TALON'].AsString := Talon;
           ExecQuery;
           Existe := (FieldByName['TALON'].AsString > '');
           TalonPapel := Trim(FieldByName['TALON_PAPEL'].AsString);
           FreeHandle;
        end;
        FreeAndNil(Q);

        if (not Existe) then
        begin
           slErrores.Add(_(Format('El talon %s no existe', [Talon])));
           slErrores.Add('');
           slErrores.Add('---');
        end
        else
        if (Existe) and (TalonPapel > '') and (TalonPapel <> NroSabadell) then
        begin
           slErrores.Add(_(Format('El talon %s ya tienen un numero asignado. (%s)', [Talon, TalonPapel])));
           slErrores.Add('');
           slErrores.Add('---');
        end
        else
        if (TalonPapel <> NroSabadell) then
        begin
           Q := THYFIBQuery.Create(nil);
           try
              try
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' UPDATE EMP_CARTERA_TALONES ');
                    SQL.Add(' SET TALON_PAPEL = :TALON_PAPEL ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' EMPRESA = :EMPRESA AND ');
                    SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                    SQL.Add(' CANAL = :CANAL AND ');
                    SQL.Add(' TALON = :TALON ');
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                    Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                    Params.ByName['TALON'].AsString := Talon;
                    Params.ByName['TALON_PAPEL'].AsString := NroSabadell;
                    ExecQuery;
                    FreeHandle;
                 end;
              finally
                 FreeAndNil(Q);
              end;
           except
              on E: Exception do
              begin
                 slErrores.Add(_(Format('El talon %s no se puede modificar', [Talon])));
                 slErrores.Add('');
                 slErrores.Add(E.Message);
                 slErrores.Add('---');
              end;
           end;
        end;
     end;
  finally
     sl.Free;
     if (slErrores.Count > 0) then
     begin
        Archivo := ChangeFileExt(Archivo, '.log.txt');
        slErrores.SaveToFile(Archivo);
        DMMain.AbrirArchivo(Archivo);
     end;
     slErrores.Free;
  end;

  {Refresco la tabla de talones generados}
  QMTalones.Close;
  QMTalones.Open;
  QMDetalle.Close;
  QMDetalle.Open;
  xInfoActualizada.Close;
  xInfoActualizada.Open;
end;

end.
