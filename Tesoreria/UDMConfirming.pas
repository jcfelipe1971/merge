unit UDMConfirming;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, UHYTickets, FIBDatabase,
  UFIBModificados, CVBNorma19CSB, Math, FR_DSet, FR_DBSet, FR_Class,
  Fr_HYReport, CVBNorma32CSB, CVBNorma58CSB, Confirming,
  HYFIBQuery, FIBDataSetRO, CVBNorma34CSB;

type
  TDMConfirming = class(TDataModule)
     QMConfirming: TFIBTableSet;
     DSQMConfirming: TDataSource;
     TLocal: THYTransaction;
     QMConfirmingEMPRESA: TIntegerField;
     QMConfirmingEJERCICIO: TIntegerField;
     QMConfirmingCANAL: TIntegerField;
     QMConfirmingSIGNO: TFIBStringField;
     QMConfirmingNUM_CONFIRMING: TIntegerField;
     QMConfirmingFECHA: TDateTimeField;
     QMConfirmingIMPORTE: TFloatField;
     QMConfirmingBANCO: TIntegerField;
     QMConfirmingTITULO: TFIBStringField;
     QMConfirmingCERRADO: TIntegerField;
     QMConfirmingRIC: TIntegerField;
     QMConfirmingASIENTO: TIntegerField;
     xBancos: TFIBDataSetRO;
     xBancosEMPRESA: TIntegerField;
     xBancosBANCO: TIntegerField;
     xBancosTITULO: TFIBStringField;
     DSxBancos: TDataSource;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     xInfoActualizada: TFIBDataSetRO;
     DSxInfoActualizada: TDataSource;
     xInfoActualizadaIMPORTE: TFloatField;
     Confirming: TConfirming;
     xBancoConfirming: TFIBDataSetRO;
     xBancoConfirmingEMPRESA: TIntegerField;
     xBancoConfirmingEJERCICIO: TIntegerField;
     xBancoConfirmingCANAL: TIntegerField;
     xBancoConfirmingBANCO: TIntegerField;
     xBancoConfirmingTITULO: TFIBStringField;
     xBancoConfirmingENTIDAD: TFIBStringField;
     xBancoConfirmingSUCURSAL: TFIBStringField;
     xBancoConfirmingCONTROL: TFIBStringField;
     xBancoConfirmingRIESGO_CON: TFloatField;
     xBancoConfirmingRIESGO_UTI: TFloatField;
     xBancoConfirmingACTIVO: TIntegerField;
     xBancoConfirmingCUENTA_CONTABLE: TFIBStringField;
     xBancoConfirmingCUENTA_CC: TFIBStringField;
     xBancoConfirmingCUENTA_AHORRO: TFIBStringField;
     xBancoConfirmingCUENTA_DTO: TFIBStringField;
     xBancoConfirmingSEPARA_APUNTES: TIntegerField;
     xProveedor: TFIBDataSetRO;
     xProveedorTITULO: TFIBStringField;
     xProveedorNIF: TFIBStringField;
     xProveedorBanco: TFIBDataSetRO;
     xProveedorBancoENTIDAD: TFIBStringField;
     xProveedorBancoSUCURSAL: TFIBStringField;
     xProveedorBancoCONTROL: TFIBStringField;
     xProveedorBancoCUENTA: TFIBStringField;
     xRecibos: TFIBDataSetRO;
     DSxRecibos: TDataSource;
     DSxProveedor: TDataSource;
     xDireccionProveedor: TFIBDataSetRO;
     xDireccionProveedorTERCERO: TIntegerField;
     xDireccionProveedorDIRECCION: TIntegerField;
     xDireccionProveedorDIR_TIPO: TFIBStringField;
     xDireccionProveedorDIR_NOMBRE: TFIBStringField;
     xDireccionProveedorDIR_NOMBRE_2: TFIBStringField;
     xDireccionProveedorDIR_NUMERO: TFIBStringField;
     xDireccionProveedorDIR_BLOQUE_ESCALERA: TFIBStringField;
     xDireccionProveedorDIR_PISO: TFIBStringField;
     xDireccionProveedorDIR_PUERTA: TFIBStringField;
     xDireccionProveedorDIR_COMPLETA: TFIBStringField;
     xDireccionProveedorDIR_LOCALIDAD: TFIBStringField;
     xDireccionProveedorDIR_COMPLETA_N: TFIBStringField;
     xLoc_T: TFIBDataSetRO;
     xLoc_TTITULO: TFIBStringField;
     xLoc_TCODPOSTAL: TFIBStringField;
     xLoc_TPROVINCIA: TFIBStringField;
     DSxLoc_T: TDataSource;
     DSxDireccionProveedor: TDataSource;
     xTerceros: TFIBDataSetRO;
     xTercerosTELEFONO01: TFIBStringField;
     xTercerosTELEFAX: TFIBStringField;
     xRecibosEMPRESA: TIntegerField;
     xRecibosEJERCICIO: TIntegerField;
     xRecibosCANAL: TIntegerField;
     xRecibosSIGNO: TFIBStringField;
     xRecibosREGISTRO: TIntegerField;
     xRecibosLINEA: TIntegerField;
     xRecibosCOD_CLI_PRO: TIntegerField;
     xRecibosVENCIMIENTO: TDateTimeField;
     xRecibosCTA_PAGO: TFIBStringField;
     xRecibosLIQUIDO: TFloatField;
     xRecibosPAGADO: TIntegerField;
     xRecibosIMPAGADO: TIntegerField;
     xRecibosFORMA_PAGO: TFIBStringField;
     xRecibosTIPO_EFECTO: TFIBStringField;
     xRecibosACEPTADO: TIntegerField;
     xRecibosREMESAR: TIntegerField;
     xRecibosESTADO: TIntegerField;
     xRecibosREMESA: TIntegerField;
     xRecibosDOC_NUMERO: TIntegerField;
     xRecibosDOC_SERIE: TFIBStringField;
     xRecibosDOC_FECHA: TDateTimeField;
     xRecibosDOC_TIPO: TFIBStringField;
     xRecibosRIC: TIntegerField;
     xRecibosRIVA: TIntegerField;
     xRecibosFECHA_CIERRE: TDateTimeField;
     xRecibosESTADO_RECIBO: TFIBStringField;
     xRecibosRECIBIDO: TIntegerField;
     xRecibosCONFIRMING: TIntegerField;
     xFormaPago: TFIBTableSet;
     QMConfirmingRIESGO_DESCONTADO: TIntegerField;
     QMConfirmingRIC_VTO: TIntegerField;
     QMConfirmingASIENTO_VTO: TIntegerField;
     xFormaPagoEMPRESA: TIntegerField;
     xFormaPagoEJERCICIO: TIntegerField;
     xFormaPagoCANAL: TIntegerField;
     xFormaPagoFORMA_PAGO: TFIBStringField;
     xFormaPagoCUENTA_PAGO: TFIBStringField;
     xFormaPagoTITULO: TFIBStringField;
     xFormaPagoPLAZOS: TIntegerField;
     xFormaPagoDIAS_1_PLAZO: TIntegerField;
     xFormaPagoDIAS_E_PLAZOS: TIntegerField;
     xFormaPagoTIPO_EFECTO: TFIBStringField;
     xFormaPagoREMESAR: TIntegerField;
     xFormaPagoPRONTO_PAGO: TIntegerField;
     xFormaPagoACEPTAR: TIntegerField;
     xFormaPagoTIPO_PAGO: TFIBStringField;
     xAcreedor: TFIBDataSetRO;
     DSxAcreedor: TDataSource;
     xAcreedorTITULO: TFIBStringField;
     xAcreedorNIF: TFIBStringField;
     xInfoActualizadaCERRADO: TIntegerField;
     QMDetalleLIQUIDO_MONEDA: TFloatField;
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
     QMDetalleMONEDA: TFIBStringField;
     QMDetalleLIQUIDO_CANAL: TFloatField;
     QMDetalleMONEDA_CANAL: TFIBStringField;
     QMDetalleEJERCICIO_CONFIRMING: TIntegerField;
     Norma34: TCVBNorma34CSB;
     xProveedorTERCERO: TIntegerField;
     xAcreedorTERCERO: TIntegerField;
     xBancoConfirmingCUENTA_CORRIENTE: TFIBStringField;
     TUpdate: THYTransaction;
     xTercerosEMAIL: TFIBStringField;
     xLoc_TC_PAIS: TFIBStringField;
     xRecibosID_CARTERA: TIntegerField;
     xRecibosID_CARTERA_DETALLE: TIntegerField;
     xRecibosID_DOC: TIntegerField;
     xProveedorBancoIBAN: TFIBStringField;
     xProveedorBancoBIC: TFIBStringField;
     QMDetalleSALDO_DEUDOR: TFloatField;
     QMDetalleSALDO_ACREEDOR: TFloatField;
     QMDetalleSALDO: TFloatField;
     QMConfirmingCLASE_PAGO: TFIBStringField;
     QMConfirmingCODIGO_ESTADISTICO: TFIBStringField;
     QMConfirmingTIPO_PAGO: TFIBStringField;
     QMConfirmingFECHA_VTO: TDateTimeField;
     QMDetalleID_CARTERA: TIntegerField;
     QMDetalleID_CARTERA_DETALLE: TIntegerField;
     QMDetalleID_DOC: TIntegerField;
     QMDetalleRIC_DESCUENTO: TIntegerField;
     QMDetalleEJERCICIO_RIC_DESCUENTO: TIntegerField;
     QMDetalleNUM_FACTURA: TFIBStringField;
     xRecibosNUM_FACTURA: TFIBStringField;
     QMDetalleTITULO: TFIBStringField;
     QMDetallePAGO_AUTORIZADO: TIntegerField;
     xProveedorBancoPAIS: TFIBStringField;
     procedure DMConfirmingCreate(Sender: TObject);
     procedure DMConfirmingDestroy(Sender: TObject);
     procedure QMConfirmingAfterOpen(DataSet: TDataSet);
     procedure QMConfirmingBeforePost(DataSet: TDataSet);
     procedure QMConfirmingNewRecord(DataSet: TDataSet);
     procedure QMConfirmingPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure QMConfirmingAfterScroll(DataSet: TDataSet);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure xRecibosAfterScroll(DataSet: TDataSet);
     procedure QMDetalleLIQUIDO_MONEDAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMConfirmingASIENTOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMConfirmingASIENTO_VTOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMConfirmingAfterPost(DataSet: TDataSet);
     procedure QMDetalleCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
     FCalcularSaldo: boolean;
     function DameDireccion: string;
     function DameNroFacturaProv(tipo, serie: string; rig, id, ric, id_cartera: integer): string;
     procedure SetCalcularSaldo(const Value: boolean);
  public
     { Public declarations }
     procedure cambiaBanco(Banco: integer);
     procedure filtra;
     procedure MostrarRecibosDisponibles;
     procedure SeleccionaTodos;
     procedure CierraConfirming;
     procedure AbreConfirming;
     procedure FiltraDetalle;
     procedure FormatoConfirming(Tipo: integer; CodCedente: string);
     procedure BusquedaCompleja;
     procedure DesvenceConfirming;
     procedure DesvenceLineaConfirming;
     property CalcularSaldo: boolean Read FCalcularSaldo Write SetCalcularSaldo;
  end;

var
  DMConfirming : TDMConfirming;

implementation

uses UDMMain, UEntorno, uFBusca, UUtiles, UFormGest, UFMConfirming, UParam, UDameDato;

{$R *.DFM}

procedure TDMConfirming.DMConfirmingCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  FCalcularSaldo := False;

  xInfoActualizadaIMPORTE.DisplayFormat := MascaraN;
  QMConfirmingIMPORTE.DisplayFormat := MascaraN;
  QMDetalleLIQUIDO.DisplayFormat := MascaraN;
  QMDetalleSALDO_DEUDOR.DisplayFormat := MascaraN;
  QMDetalleSALDO_ACREEDOR.DisplayFormat := MascaraN;
  QMDetalleSALDO.DisplayFormat := MascaraN;

  xProveedor.Open;
  xAcreedor.Open;
  xLoc_T.Open;
end;

procedure TDMConfirming.DMConfirmingDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit; // Para saltarnos el onchange del banco en el formulario
end;

procedure TDMConfirming.Filtra;
begin
  DMMain.FiltraTabla(QMConfirming, '11100', True);
end;

procedure TDMConfirming.cambiaBanco(Banco: integer);
begin
  with xBancos do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Banco'].AsInteger := Banco;
     Open;
  end;
end;

procedure TDMConfirming.QMConfirmingAfterOpen(DataSet: TDataSet);
begin
  xInfoActualizada.Open;
  xBancos.Open;
  QMDetalle.Open;
end;

procedure TDMConfirming.QMConfirmingBeforePost(DataSet: TDataSet);
begin
  if ((DataSet.State = dsInsert) and
     ((QMConfirmingNUM_CONFIRMING.AsInteger = 0) or (QMConfirmingNUM_CONFIRMING.IsNull))) then
  begin
     QMConfirmingNUM_CONFIRMING.AsInteger := DMMain.Contador_EEC('CON');

     if (Trim(QMConfirmingTITULO.AsString) = '') then
        QMConfirmingTITULO.AsString := format(_('CONFIRMING-%d-%.3d'), [QMConfirmingEJERCICIO.AsInteger, QMConfirmingNUM_CONFIRMING.AsInteger]);
  end;
end;

procedure TDMConfirming.QMConfirmingNewRecord(DataSet: TDataSet);
begin
  QMConfirmingEMPRESA.AsInteger := REntorno.Empresa;
  QMConfirmingEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMConfirmingCANAL.AsInteger := REntorno.Canal;
  QMConfirmingSIGNO.AsString := 'P';
  QMConfirmingFECHA.AsDateTime := REntorno.FechaTrab;
  QMConfirmingBANCO.AsInteger := DameBancoDefecto;
  QMConfirmingCERRADO.AsInteger := 0;
  QMConfirmingCLASE_PAGO.AsString := 'M';
  QMConfirmingCODIGO_ESTADISTICO.AsString := '000000';
  QMConfirmingTIPO_PAGO.AsString := 'T';

  // Se informa al grid del detalle del formulario
  if QMConfirming.State <> dsInsert then
     FMConfirming.AjustaCheckConfirming(QMConfirmingNUM_CONFIRMING.AsInteger)
  else
     QMDetalle.Close;
end;

procedure TDMConfirming.QMConfirmingPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if QMConfirming.State = dsInsert then
     QMConfirmingNUM_CONFIRMING.Clear;
end;

procedure TDMConfirming.QMConfirmingAfterScroll(DataSet: TDataSet);
begin
  if QMConfirming.State <> dsInsert then
  begin
     FMConfirming.AjustaCheckConfirming(QMConfirmingNUM_CONFIRMING.AsInteger);
     with QMDetalle do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_CARTERA_CONFIRMING ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = :EMPRESA ');
        SelectSQL.Add(' AND EJERCICIO_CONFIRMING = :EJERCICIO ');
        SelectSQL.Add(' AND CANAL = :CANAL ');
        SelectSQL.Add(' AND SIGNO = ''P'' ');
        SelectSQL.Add(' AND CONFIRMING = :NUM_CONFIRMING ');
        SelectSQL.Add(' ORDER BY VENCIMIENTO ');
        Open;
     end;
     xInfoActualizada.Close;
     xInfoActualizada.Open;
     xBancos.Close;
     xBancos.Open;
  end;
end;

procedure TDMConfirming.MostrarRecibosDisponibles;
var
  Orden : string;
  SoloVencimientosPosteriores : boolean;
begin
  SoloVencimientosPosteriores := (DMMain.EstadoKri(29) = 1);

  QMConfirmingAfterScroll(QMConfirming);
  with QMDetalle do
  begin
     DisableControls;
     try
        Close;
        Orden := OrdenadoPor;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_CARTERA_CONFIRMING ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA = :EMPRESA ');
        SelectSQL.Add(' AND ((EJERCICIO_CONFIRMING = 0) OR (EJERCICIO_CONFIRMING = :EJERCICIO)) ');
        SelectSQL.Add(' AND CANAL = :CANAL ');
        SelectSQL.Add(' AND ((CONFIRMING = 0 AND PAGO_AUTORIZADO = 1) OR (CONFIRMING = :CONFIRMING)) ');
        SelectSQL.Add(' AND ACEPTADO = 1 ');
        SelectSQL.Add(' AND PAGADO = 0 ');
        if (SoloVencimientosPosteriores) then
           SelectSQL.Add(' AND VENCIMIENTO >= :FECHA');
        Params.ByName['CONFIRMING'].AsInteger := QMConfirmingNUM_CONFIRMING.AsInteger;
        if (SoloVencimientosPosteriores) then
           Params.ByName['FECHA'].AsDateTime := Trunc(QMConfirmingFECHA.AsDateTime);
        Ordenar(Orden);
        Open;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMConfirming.QMDetalleAfterPost(DataSet: TDataSet);
begin
  xInfoActualizada.Close;
  xInfoActualizada.Open;
end;

procedure TDMConfirming.SeleccionaTodos;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE VER_CARTERA_CONFIRMING ');
        SQL.Add(' SET ');
        SQL.Add('     CONFIRMING=' + QMConfirmingNUM_CONFIRMING.AsString + ' ');
        SQL.Add('    ,EJERCICIO_CONFIRMING=' + QMConfirmingEJERCICIO.AsString + ' ');
        SQL.Add(' WHERE ');
        QMDetalle.DameFiltroSelect(SQL);
        if Params.ByName['EMPRESA'] <> nil then
        begin
           Params.ByName['EMPRESA'].AsInteger := QMConfirmingEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMConfirmingEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMConfirmingCANAL.AsInteger;
        end;
        Params.ByName['CONFIRMING'].AsInteger := QMConfirmingNUM_CONFIRMING.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMDetalle.Close;
  QMDetalle.Open;
  xInfoActualizada.Close;
  xInfoActualizada.Open;
end;

procedure TDMConfirming.CierraConfirming;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_CIERRA_CONFIRMING(?EMPRESA, ?EJERCICIO, ?CANAL, ?CONFIRMING, ?FECHA, ?ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CONFIRMING'].AsInteger := QMConfirmingNUM_CONFIRMING.AsInteger;
        Params.ByName['FECHA'].AsDateTime := QMConfirmingFECHA.AsDateTime {dji lrk kri - REntorno.FechaTrab};
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMConfirming.Refresh;
  QMConfirmingAfterScroll(QMConfirming); {dji lrk kri - para que muestro solo los datos marcados}
end;

procedure TDMConfirming.AbreConfirming;
var
  Abrir : boolean;
  FechaApertura : TDateTime;
begin
  // Verifico si el confirming ya ha vencido y alerto si es así.
  Abrir := True;
  FechaApertura := REntorno.FechaTrab;
  if (REntorno.FechaTrabSH > HourIntoDate(QMConfirmingFECHA_VTO.AsDateTime, '00:00:00')) then
  begin
     Abrir := ConfirmaMensaje(_('El confirming ya ha vencido. ¿Desea abrirlo de todos modos?'));
     FechaApertura := QMConfirmingFECHA_VTO.AsDateTime;
  end;

  if (Abrir) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_ABRE_CONFIRMING(?EMPRESA, ?EJERCICIO, ?CANAL, ?CONFIRMING, ?FECHA, ?ENTRADA)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['CONFIRMING'].AsInteger := QMConfirmingNUM_CONFIRMING.AsInteger;
           Params.ByName['FECHA'].AsDateTime := FechaApertura;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMConfirming.Refresh;
     xInfoActualizada.Close;
     xInfoActualizada.Open;
  end;
end;

procedure TDMConfirming.FormatoConfirming(Tipo: integer; CodCedente: string);
var
  TipoPago : string;
  Archivo : string;
begin
  Archivo := Format(_('Confirming-%d-%.3d.txt'), [QMConfirmingEJERCICIO.AsInteger, QMConfirmingNUM_CONFIRMING.AsInteger]);
  if MySaveDialog(Archivo, 'TXT', '', 'DMConfirming') then
  begin
     with Confirming do
     begin
        // Definitos el formato de banco de trabajo
        TipoConfirming := Tipo;
        // Iniciamos el confirming
        NomFichero := Archivo;
        InicioConfirming;
        // Introducimos los datos del Confirming
        CodEmpresa := CodCedente;
        CifEmpresa := REntorno.CifEmpresa;
        NombreEmpresa := REntorno.NombreEmpresa;
        ViaEmpresa := REntorno.DirEmpresa;
        PoblacionEmpresa := REntorno.PobEmpresa;
        FechaConAAAA := FormatDateTime('yyyymmdd', QMConfirmingFECHA.AsDateTime); // AAAAMMDD
        Pais := REntorno.Pais;
        Referencia := QMConfirmingEJERCICIO.AsString + '-' + QMConfirmingNUM_CONFIRMING.AsString;
        // Clase de Pago (Mercancia / Servicios)
        if (QMConfirmingCLASE_PAGO.AsString = 'M') then
           ClasePago := 1;
        if (QMConfirmingCLASE_PAGO.AsString = 'S') then
           ClasePago := 2;
        CodigoEstadistico := QMConfirmingCODIGO_ESTADISTICO.AsString;
        TipoPago := QMConfirmingTIPO_PAGO.AsString;

        with xBancoConfirming do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['BANCO'].AsInteger := QMConfirmingBANCO.AsInteger;
           Open;
        end;
        EntidadEmpresa := xBancoConfirmingENTIDAD.AsString;
        OficinaEmpresa := xBancoConfirmingSUCURSAL.AsString;
        DCEmpresa := xBancoConfirmingCONTROL.AsString;
        CCEmpresa := xBancoConfirmingCUENTA_CORRIENTE.AsString;
        TotalImportes := QMConfirmingIMPORTE.AsFloat; // En algun tipo se necesita como dato de cabecera

        // Introducimos datos de los recibos
        with xRecibos do
        begin
           Close;
           Params.ByName['Empresa'].AsInteger := QMConfirmingEMPRESA.AsInteger;
           Params.ByName['Ejercicio'].AsInteger := QMConfirmingEJERCICIO.AsInteger;
           Params.ByName['Canal'].AsInteger := QMConfirmingCANAL.AsInteger;
           Params.ByName['Confirming'].AsInteger := QMConfirmingNUM_CONFIRMING.AsInteger;
           Open;
           First;
        end;

        // En el caso de Bankinter necesito saber antes de crear la cabecera si es nacional o internacional
        PaisProv := xLoc_TC_PAIS.AsString;
        PaisProv2 := DamePaisC2(xLoc_TC_PAIS.AsString);

        CompCabecera;

        TotalImportes := 0;
        CantRemesas := 0;

        while (not xRecibos.EOF) do
        begin
           CantRemesas := confirming.CantRemesas + 1;
           CodProv := xRecibosCOD_CLI_PRO.AsString;
           if ((xRecibosDOC_TIPO.AsString = 'FAP') or (xRecibosDOC_TIPO.AsString = 'AGP') or
              (xRecibosDOC_TIPO.AsString = 'NRP') or (xRecibosDOC_TIPO.AsString = 'AFP')) then
           begin
              CifProv := xProveedorNIF.AsString;
              NombreProv := xProveedorTITULO.AsString;
           end;
           if ((xRecibosDOC_TIPO.AsString = 'FCR') or (xRecibosDOC_TIPO.AsString = 'AGA') or
              (xRecibosDOC_TIPO.AsString = 'NRA') or (xRecibosDOC_TIPO.AsString = 'AFA')) then
           begin
              CifProv := xAcreedorNIF.AsString;
              NombreProv := xAcreedorTITULO.AsString;
           end;
           PaisProv := xLoc_TC_PAIS.AsString;
           PaisProv2 := DamePaisC2(xLoc_TC_PAIS.AsString);
           {Si es NIF español, tomo los ultimos 9 caracteres (por si empieza por ES...)}
           if ((Length(Confirming.CifProv) > 9) and (xLoc_TC_PAIS.AsString = 'ESP')) then
              CifProv := Copy(Confirming.CifProv, Length(Confirming.CifProv) - 8, 9);
           ViaProv := DameDireccion;
           NumeroViaProv := StrToIntDef(xDireccionProveedorDIR_NUMERO.AsString, 0);
           CodPostalProv := StrToIntDef(xLoc_TCODPOSTAL.AsString, 0);
           PoblacionProv := xLoc_TTITULO.AsString;
           ProvinciaProv := xLoc_TPROVINCIA.AsString;
           TelefonoProv := xTercerosTELEFONO01.AsString;
           FaxProv := xTercerosTELEFAX.AsString;
           email := xTercerosEMAIL.AsString;
           Aptdo := '';
           EntidadProv := xProveedorBancoENTIDAD.AsString;
           OficinaProv := xProveedorBancoSUCURSAL.AsString;
           DCProv := xProveedorBancoCONTROL.AsString;
           CCProv := xProveedorBancoCUENTA.AsString;
           IBANProv := xProveedorBancoIBAN.AsString;
           SWIFTProv := xProveedorBancoBIC.AsString;
           DescBanco := DameTituloEntidad(xProveedorBancoPAIS.AsString, xProveedorBancoENTIDAD.AsString);
           NumOrdenPago := xRecibosEJERCICIO.AsString + '-' + xRecibosREGISTRO.AsString;

           // Tipo de pago del Confirming (Transferencia, Cheque)
           // Lo selecciona segun forma de pago o en la cabecera del confirming.
           if (DMMain.EstadoKri(453) = 1) then
              TipoPagoRec := TipoPago[1]
           else
           begin
              if Copy(xFormaPagoTIPO_PAGO.AsString, 1, 1) = 'T' then
                 TipoPagoRec := 'T'
              else
                 TipoPagoRec := 'C';
           end;

           NumFacturaRec := xRecibosDOC_NUMERO.AsString;
           NumFacturaProv := DameNroFacturaProv(xRecibosDOC_TIPO.AsString, xRecibosDOC_SERIE.AsString, xRecibosDOC_NUMERO.AsInteger, xRecibosID_DOC.AsInteger, xRecibosRIC.AsInteger, xRecibosID_CARTERA.AsInteger);
           FechaEmiAAAA := FormatDateTime('yyyymmdd', xRecibosDOC_FECHA.AsDateTime);
           ImporteRec := xRecibosLIQUIDO.AsCurrency;
           TotalImportes := TotalImportes + Confirming.ImporteRec;
           FechaVtoAAAA := FormatDateTime('yyyymmdd', xRecibosVENCIMIENTO.AsDateTime);

           if (ImporteRec < 0) then
              SignoRec := '0'
           else
              SignoRec := '1';

           ObservacionesRec := '';
           CompRecibos;
           xRecibos.Next;
        end;

        // Introducimos los datos del total
        if (TotalImportes < 0) then
           TotalSigno := '1'
        else
           TotalSigno := '0';

        CompTotales;

        Cerrar;

        ShowMessage(Format(_('Cedente : %s' + #13#10 + 'Importe : %s'), [codcedente, FormatFloat(MascaraN, TotalImportes)]));
     end;
  end;
end;

function TDMConfirming.DameNroFacturaProv(tipo, serie: string; rig, id, ric, id_cartera: integer): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        if tipo = 'FCR' then
        begin
           // Facturas de Acreedor
           SQL.Text := 'SELECT NUM_FACTURA FROM GES_CABECERAS_E_FCR WHERE ID_E=' + IntToStr(id);
        end
        else
        if tipo = 'FAP' then
        begin
           // Facturas de Proveedor
           SQL.Text := 'SELECT NUM_FACTURA FROM GES_CABECERAS_E_FAC WHERE ID_E=' + IntToStr(id);
        end
        else
        if ((tipo = 'AFP') or (tipo = 'AFA')) then
        begin
           // Asiento factura Proveedor/Acreedor
           SQL.Text := 'select TEXTO as NUM_FACTURA from con_cuentas_apuntes ' +
              'where empresa=' + REntorno.EmpresaStr + ' and canal=' + REntorno.CanalStr + ' and doc_serie=''' + serie + ''' and doc_numero=''' + IntToStr(rig) + ''' and ric=' + IntToStr(ric);
        end
        else
        if ((tipo = 'AGP') or (tipo = 'NRP') or (tipo = 'AGA') or (tipo = 'NRA')) then // Agrupacion de recibos de proveedor
        begin
           // AG? = Agrupacion de recibos de Proveedor/Acreedor
           // NR? = Recibo de Proveedor/Acreedor creado a mano
           SQL.Text := 'select TEXTO as NUM_FACTURA from emp_cartera_texto where id_cartera=' + IntToStr(id_cartera);
        end;
        ExecQuery;
        Result := FieldByName['NUM_FACTURA'].AsString;

        // Si es un pase automático, devuelvo el valor que está después del texto fijo, entre parentesis
        if (tipo = 'AFP') then
           if (Pos('PASE AUTOMATICO FRA. PROV.', Result) > 0) then
              Result := Copy(Result, Pos('(', Result) + 1, Pos(')', Result) - Pos('(', Result) - 1);

        // Si es una grupación de facturas, quito la primera parte porque solo tengo de 14 a 16 posiciones para este dato en la descripcion de confirmings
        { TODO : Verificar como se comporta esto en otros idiomas. Creo que el sring está en Triggers/SP de la base de datos }
        if ((tipo = 'AGP') or (tipo = 'AGA')) then
           if (Pos('Agrup. Facs. ', Result) > 0) then
              Result := Copy(Result, Length('Agrup. Facs. ') + 1, Length(Result));

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMConfirming.FiltraDetalle;
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
        SelectSQL.Add(' AND ((CONFIRMING = 0 AND PAGO_AUTORIZADO = 1) OR (CONFIRMING = :CONFIRMING)) ');
        SelectSQL.Add(' AND ACEPTADO = 1 ');
        SelectSQL.Add(' AND PAGADO = 0 ');
        Params.ByName['CONFIRMING'].AsInteger := QMConfirmingNUM_CONFIRMING.AsInteger;
        Ordenar(orden);
        Open;
     finally
        EnableControls;
     end;
  end;

  FMConfirming.AjustaCheckConfirming(QMConfirmingNUM_CONFIRMING.AsInteger);
end;

procedure TDMConfirming.xRecibosAfterScroll(DataSet: TDataSet);
begin
  if (DataSet.RecordCount > 0) then
  begin
     xDireccionProveedor.Close;
     xProveedorBanco.Close;
     xTerceros.Close;
     xLoc_T.Close;
     xFormaPago.Close;

     if ((xRecibosDOC_TIPO.AsString = 'FAP') or (xRecibosDOC_TIPO.AsString = 'AGP') or
        (xRecibosDOC_TIPO.AsString = 'NRP') or (xRecibosDOC_TIPO.AsString = 'AFP')) then
     begin
        xProveedor.Close;
        xDireccionProveedor.DataSource := DSxProveedor;
        xProveedorBanco.DataSource := DSxProveedor;
        xTerceros.DataSource := DSxProveedor;
        xProveedor.Open;
     end;
     if ((xRecibosDOC_TIPO.AsString = 'FCR') or (xRecibosDOC_TIPO.AsString = 'AGA') or
        (xRecibosDOC_TIPO.AsString = 'NRA') or (xRecibosDOC_TIPO.AsString = 'AFA')) then
     begin
        xAcreedor.Close;
        xDireccionProveedor.DataSource := DSxAcreedor;
        xProveedorBanco.DataSource := DSxAcreedor;
        xTerceros.DataSource := DSxAcreedor;
        xAcreedor.Open;
     end;

     xDireccionProveedor.Open;
     xProveedorBanco.Open;
     xTerceros.Open;
     xLoc_T.Open;
     xFormaPago.Open;
  end;
end;

function TDMConfirming.DameDireccion: string;
begin
  Result := xDireccionProveedorDIR_NOMBRE.AsString;
  if xDireccionProveedorDIR_NUMERO.AsString <> '' then
     Result := Result + ', ' + xDireccionProveedorDIR_NUMERO.AsString;
  if xDireccionProveedorDIR_BLOQUE_ESCALERA.AsString <> '' then
     Result := Result + ' ' + xDireccionProveedorDIR_BLOQUE_ESCALERA.AsString;
  if xDireccionProveedorDIR_PISO.AsString <> '' then
     Result := Result + ' ' + xDireccionProveedorDIR_PISO.AsString;
  if xDireccionProveedorDIR_PUERTA.AsString <> '' then
     Result := Result + ' ' + xDireccionProveedorDIR_PUERTA.AsString;
end;

procedure TDMConfirming.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMConfirming, '11100');
end;

procedure TDMConfirming.QMDetalleLIQUIDO_MONEDAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := FormatFloat(DMMain.MascaraMoneda(QMDetalleMONEDA.AsString, 1),
     QMDetalleLIQUIDO.AsFloat);
end;

procedure TDMConfirming.QMDetalleBeforePost(DataSet: TDataSet);
begin
  if (QMConfirmingCERRADO.AsInteger = 1) then
  begin
     ShowMessage(_('El confirming esta cerrado'));
     DataSet.Cancel;
  end
  else
  begin
     if QMDetalleCONFIRMING.AsInteger = QMConfirmingNUM_CONFIRMING.AsInteger then
        QMDetalleEJERCICIO_CONFIRMING.AsInteger := QMConfirmingEJERCICIO.AsInteger
     else
        QMDetalleEJERCICIO_CONFIRMING.AsInteger := 0;
  end;
end;

procedure TDMConfirming.QMDetalleNewRecord(DataSet: TDataSet);
begin
  if ((QMConfirming.State = dsEdit) or (QMConfirming.State = dsInsert)) then
     QMConfirming.Post;

  if QMDetalle.State = dsInsert then
     DataSet.Cancel;
end;

procedure TDMConfirming.DesvenceConfirming;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_DESVENCE_CONFIRMING(:EMPRESA, :EJERCICIO, :CANAL, :SIGNO, :CONFIRMING)';
        Params.ByName['EMPRESA'].AsInteger := QMConfirmingEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMConfirmingEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMConfirmingCANAL.AsInteger;
        Params.ByName['SIGNO'].AsString := QMConfirmingSIGNO.AsString;
        Params.ByName['CONFIRMING'].AsInteger := QMConfirmingNUM_CONFIRMING.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
  QMConfirming.Refresh;
end;

procedure TDMConfirming.DesvenceLineaConfirming;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_DESVENCE_CONF_LINEA(:EMPRESA, :EJERCICIO, :CANAL, :SIGNO, :CONFIRMING, :ID_CARTERA_DETALLE)';
        Params.ByName['EMPRESA'].AsInteger := QMConfirmingEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMConfirmingEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMConfirmingCANAL.AsInteger;
        Params.ByName['SIGNO'].AsString := QMConfirmingSIGNO.AsString;
        Params.ByName['CONFIRMING'].AsInteger := QMConfirmingNUM_CONFIRMING.AsInteger;
        Params.ByName['ID_CARTERA_DETALLE'].AsInteger := QMDetalleID_CARTERA_DETALLE.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
  QMConfirming.Refresh;
end;

procedure TDMConfirming.QMConfirmingASIENTOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMConfirmingCERRADO.AsInteger = 0) then
     Text := ' '
  else
     Text := IntToStr(QMConfirmingASIENTO.AsInteger);
end;

procedure TDMConfirming.QMConfirmingASIENTO_VTOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMConfirmingRIESGO_DESCONTADO.AsInteger = 0) then
     Text := ' '
  else
     Text := IntToStr(QMConfirmingASIENTO_VTO.AsInteger);
end;

procedure TDMConfirming.QMConfirmingAfterPost(DataSet: TDataSet);
begin
  if (not QMDetalle.Active) then
     QMDetalle.Open;
end;

procedure TDMConfirming.QMDetalleCalcFields(DataSet: TDataSet);
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
     if ((DataSet.FieldByName('DOC_TIPO').AsString = 'FAP') or (DataSet.FieldByName('DOC_TIPO').AsString = 'AGP') or
        (DataSet.FieldByName('DOC_TIPO').AsString = 'NRP')) then
        Tipo := 'P'
     else
     if ((DataSet.FieldByName('DOC_TIPO').AsString = 'FCR') or (DataSet.FieldByName('DOC_TIPO').AsString = 'AGA') or
        (DataSet.FieldByName('DOC_TIPO').AsString = 'NRA')) then
        Tipo := 'A';
     DMMain.DameSaldoCliPro(' ', Tipo, QMDetalleCOD_CLI_PRO.AsInteger, SaldoDeudor, SaldoAcreedor, Saldo);
     QMDetalleSALDO_DEUDOR.AsFloat := SaldoDeudor;
     QMDetalleSALDO_ACREEDOR.AsFloat := SaldoAcreedor;
     QMDetalleSALDO.AsFloat := Saldo;
  end;
  QMDetalleSALDO_DEUDOR.AsFloat := SaldoDeudor;
  QMDetalleSALDO_ACREEDOR.AsFloat := SaldoAcreedor;
  QMDetalleSALDO.AsFloat := Saldo;
end;

procedure TDMConfirming.SetCalcularSaldo(const Value: boolean);
begin
  FCalcularSaldo := Value;
  QMDetalleCalcFields(QMDetalle);
end;

end.
