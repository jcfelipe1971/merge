unit UDMGestionDocumentosPago;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, HYFIBQuery, Confirming, Dialogs, FIBDataSetRO;

type
  TDMGestionDocumentosPago = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSAgrupacionDocumentos: TDataSource;
     xAgrupacionDocumentos: TFIBTableSet;
     xAgrupacionDocumentosID_AGRUP: TIntegerField;
     xAgrupacionDocumentosEMPRESA: TIntegerField;
     xAgrupacionDocumentosEJERCICIO: TIntegerField;
     xAgrupacionDocumentosCANAL: TIntegerField;
     xAgrupacionDocumentosRIG: TIntegerField;
     xAgrupacionDocumentosTIPO_EFECTO: TFIBStringField;
     xAgrupacionDocumentosENTRADA: TIntegerField;
     xAgrupacionDocumentosTITULO: TFIBStringField;
     xAgrupacionDocumentosBANCO: TIntegerField;
     xAgrupacionDocumentosFECHA: TDateTimeField;
     DSAgrupacionDocumentosDet: TDataSource;
     xAgrupacionDocumentosDet: TFIBTableSet;
     xAgrupacionDocumentosDetID_AGRUP: TIntegerField;
     xAgrupacionDocumentosDetTIPO_EFECTO: TFIBStringField;
     xAgrupacionDocumentosDetEMPRESA: TIntegerField;
     xAgrupacionDocumentosDetEJERCICIO: TIntegerField;
     xAgrupacionDocumentosDetCANAL: TIntegerField;
     xAgrupacionDocumentosDetDOCUMENTO: TFIBStringField;
     xAgrupacionDocumentosDetMARCA: TIntegerField;
     Confirming: TConfirming;
     xBanco: TFIBDataSetRO;
     xInfoActualizada: TFIBDataSetRO;
     xInfoActualizadaIMPORTE: TFloatField;
     DSxInfoActualizada: TDataSource;
     xAgrupacionDocumentosIMPORTE: TFloatField;
     xRecibos: TFIBDataSetRO;
     xRecibosID_AGRUP: TIntegerField;
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
     xRecibosLIQUIDO_CANAL: TFloatField;
     xRecibosPAGADO: TIntegerField;
     xRecibosIMPAGADO: TIntegerField;
     xRecibosFORMA_PAGO: TFIBStringField;
     xRecibosTIPO_EFECTO: TFIBStringField;
     xRecibosACEPTAR: TIntegerField;
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
     xRecibosDOCUMENTO: TFIBStringField;
     xRecibosDOC_AUTOMATICO: TIntegerField;
     xRecibosMONEDA: TFIBStringField;
     xRecibosCAMBIO: TFloatField;
     xRecibosID_CARTERA: TIntegerField;
     xRecibosID_CARTERA_DETALLE: TIntegerField;
     xRecibosID_DOC: TIntegerField;
     xRecibosRETENCION: TIntegerField;
     xRecibosTIPO_RETENCION: TIntegerField;
     xAcreedor: TFIBDataSetRO;
     xAcreedorTITULO: TFIBStringField;
     xAcreedorNIF: TFIBStringField;
     xAcreedorTERCERO: TIntegerField;
     xProveedor: TFIBDataSetRO;
     xProveedorTITULO: TFIBStringField;
     xProveedorNIF: TFIBStringField;
     xProveedorTERCERO: TIntegerField;
     DSxRecibos: TDataSource;
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
     xProveedorBanco: TFIBDataSetRO;
     xProveedorBancoENTIDAD: TFIBStringField;
     xProveedorBancoSUCURSAL: TFIBStringField;
     xProveedorBancoCONTROL: TFIBStringField;
     xProveedorBancoCUENTA: TFIBStringField;
     xProveedorBancoIBAN: TFIBStringField;
     xProveedorBancoBIC: TFIBStringField;
     xTerceros: TFIBDataSetRO;
     xTercerosTELEFONO01: TFIBStringField;
     xTercerosTELEFAX: TFIBStringField;
     xTercerosEMAIL: TFIBStringField;
     xFormaPago: TFIBTableSet;
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
     xLoc_T: TFIBDataSetRO;
     xLoc_TTITULO: TFIBStringField;
     xLoc_TCODPOSTAL: TFIBStringField;
     xLoc_TPROVINCIA: TFIBStringField;
     xLoc_TC_PAIS: TFIBStringField;
     DSxDireccionProveedor: TDataSource;
     DSxProveedor: TDataSource;
     DSxAcreedor: TDataSource;
     DSDetalleDocumento: TDataSource;
     xDetalleDocumento: TFIBDataSetRO;
     xDetalleDocumentoEMPRESA: TIntegerField;
     xDetalleDocumentoEJERCICIO: TIntegerField;
     xDetalleDocumentoCANAL: TIntegerField;
     xDetalleDocumentoSIGNO: TFIBStringField;
     xDetalleDocumentoREGISTRO: TIntegerField;
     xDetalleDocumentoLINEA: TIntegerField;
     xDetalleDocumentoCOD_CLI_PRO: TIntegerField;
     xDetalleDocumentoVENCIMIENTO: TDateTimeField;
     xDetalleDocumentoCTA_PAGO: TFIBStringField;
     xDetalleDocumentoLIQUIDO: TFloatField;
     xDetalleDocumentoLIQUIDO_CANAL: TFloatField;
     xDetalleDocumentoPAGADO: TIntegerField;
     xDetalleDocumentoIMPAGADO: TIntegerField;
     xDetalleDocumentoFORMA_PAGO: TFIBStringField;
     xDetalleDocumentoTIPO_EFECTO: TFIBStringField;
     xDetalleDocumentoACEPTAR: TIntegerField;
     xDetalleDocumentoREMESAR: TIntegerField;
     xDetalleDocumentoESTADO: TIntegerField;
     xDetalleDocumentoREMESA: TIntegerField;
     xDetalleDocumentoDOC_NUMERO: TIntegerField;
     xDetalleDocumentoDOC_SERIE: TFIBStringField;
     xDetalleDocumentoDOC_FECHA: TDateTimeField;
     xDetalleDocumentoDOC_TIPO: TFIBStringField;
     xDetalleDocumentoRIC: TIntegerField;
     xDetalleDocumentoRIVA: TIntegerField;
     xDetalleDocumentoFECHA_CIERRE: TDateTimeField;
     xDetalleDocumentoESTADO_RECIBO: TFIBStringField;
     xDetalleDocumentoRECIBIDO: TIntegerField;
     xDetalleDocumentoCONFIRMING: TIntegerField;
     xDetalleDocumentoDOCUMENTO: TFIBStringField;
     xDetalleDocumentoDOC_AUTOMATICO: TIntegerField;
     xDetalleDocumentoMONEDA: TFIBStringField;
     xDetalleDocumentoCAMBIO: TFloatField;
     xDetalleDocumentoID_CARTERA: TIntegerField;
     xDetalleDocumentoID_CARTERA_DETALLE: TIntegerField;
     xDetalleDocumentoID_DOC: TIntegerField;
     xDetalleDocumentoRETENCION: TIntegerField;
     xDetalleDocumentoTIPO_RETENCION: TIntegerField;
     xIncidencias: TFIBDataSetRO;
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
     DSxIncidencias: TDataSource;
     xAgrupacionDocumentosDetCOD_CLI_PRO: TIntegerField;
     xAgrupacionDocumentosDetTITULO: TFIBStringField;
     xAgrupacionDocumentosDetLIQUIDO: TFloatField;
     xProveedorBancoPAIS: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure xAgrupacionDocumentosNewRecord(DataSet: TDataSet);
     procedure xAgrupacionDocumentosBeforePost(DataSet: TDataSet);
     procedure xAgrupacionDocumentosAfterOpen(DataSet: TDataSet);
     procedure xAgrupacionDocumentosBeforeClose(DataSet: TDataSet);
     procedure xRecibosAfterScroll(DataSet: TDataSet);
     procedure xAgrupacionDocumentosDetAfterPost(DataSet: TDataSet);
     procedure xAgrupacionDocumentosDetAfterOpen(DataSet: TDataSet);
     procedure xAgrupacionDocumentosDetBeforeClose(DataSet: TDataSet);
     procedure xDetalleDocumentoAfterOpen(DataSet: TDataSet);
     procedure xDetalleDocumentoBeforeClose(DataSet: TDataSet);
     procedure xDetalleDocumentoAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
     Tipo: string;
     function DameDireccion: string;
     function DameNroFacturaProv(tipo, serie: string; rig, id, ric: integer): string;
     procedure RefrescaDetalle;
     procedure RefrescaTotales;
  public
     { Public declarations }
     procedure FiltraTipo(aTipo: string);
     procedure InsertaDocumentos;
     procedure MarcarTodos(Todos: boolean);
     procedure FormatoConfirming(Tipo: integer; CodCedente: string);
     procedure FormatoPagare(Tipo: integer);
     procedure BorrarMarcados;
     procedure PagarDocumentos;
     procedure OrdenarDetalle(campo: string);
  end;

var
  DMGestionDocumentosPago : TDMGestionDocumentosPago;

implementation

uses UDMMain, UEntorno, DateUtils, UUtiles, UDameDato;

{$R *.dfm}

procedure TDMGestionDocumentosPago.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  xAgrupacionDocumentosIMPORTE.DisplayFormat := MascaraN;
  xInfoActualizadaIMPORTE.DisplayFormat := MascaraN;

  xDetalleDocumentoVENCIMIENTO.DisplayFormat := ShortDateFormat;
  xDetalleDocumentoLIQUIDO.DisplayFormat := MascaraN;
  xDetalleDocumentoLIQUIDO_CANAL.DisplayFormat := MascaraN;
  xDetalleDocumentoDOC_FECHA.DisplayFormat := ShortDateFormat;
  xDetalleDocumentoFECHA_CIERRE.DisplayFormat := ShortDateFormat;

  // No se abre, porque cuando se crea el Form se llamará a FiltraTipo
  DMMain.FiltraTabla(xAgrupacionDocumentos, '11100', False);
end;

procedure TDMGestionDocumentosPago.xAgrupacionDocumentosNewRecord(DataSet: TDataSet);
begin
  xAgrupacionDocumentosEMPRESA.AsInteger := REntorno.Empresa;
  xAgrupacionDocumentosEJERCICIO.AsInteger := REntorno.Ejercicio;
  xAgrupacionDocumentosCANAL.AsInteger := REntorno.Canal;
  xAgrupacionDocumentosENTRADA.AsInteger := REntorno.Entrada;
  xAgrupacionDocumentosFECHA.AsDateTime := Today;
  xAgrupacionDocumentosTIPO_EFECTO.AsString := Tipo;
end;

procedure TDMGestionDocumentosPago.xAgrupacionDocumentosBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     DMMain.Contador_Gen(DataSet, 'CONTA_AGRUP_DOC', 'ID_AGRUP'); // ID
end;

procedure TDMGestionDocumentosPago.FiltraTipo(aTipo: string);
begin
  Tipo := aTipo;

  with xDetalleDocumento do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT ');
     SelectSQL.Add(' DET.EMPRESA, DET.EJERCICIO, DET.CANAL, DET.SIGNO, DET.REGISTRO, DET.LINEA, CAR.COD_CLI_PRO, DET.VENCIMIENTO, ');
     SelectSQL.Add(' DET.CTA_PAGO, DET.LIQUIDO, DET.LIQUIDO_CANAL, DET.PAGADO, DET.IMPAGADO, CAR.FORMA_PAGO, DET.TIPO_EFECTO, ');
     SelectSQL.Add(' FP.ACEPTAR, DET.REMESAR, DET.ESTADO, DET.REMESA, CAR.DOC_NUMERO, CAR.DOC_SERIE, CAR.DOC_FECHA, CAR.DOC_TIPO, CAR.RIC, ');
     SelectSQL.Add(' CAR.RIVA, DET.FECHA_CIERRE, DET.ESTADO_RECIBO, DET.RECIBIDO, DET.CONFIRMING, DET.DOCUMENTO, DET.DOC_AUTOMATICO, ');
     SelectSQL.Add(' DET.MONEDA, DET.CAMBIO, DET.ID_CARTERA, DET.ID_CARTERA_DETALLE, CAR.ID_DOC, DET.RETENCION, DET.TIPO_RETENCION ');
     SelectSQL.Add(' FROM EMP_CARTERA_DETALLE DET ');
     SelectSQL.Add(' JOIN EMP_CARTERA CAR ');
     SelectSQL.Add(' ON ');
     SelectSQL.Add(' DET.ID_CARTERA = CAR.ID_CARTERA ');
     SelectSQL.Add(' LEFT JOIN CON_CUENTAS_GES_FP FP ');
     SelectSQL.Add(' ON ');
     SelectSQL.Add(' DET.EMPRESA = FP.EMPRESA AND ');
     SelectSQL.Add(' DET.EJERCICIO = FP.EJERCICIO AND ');
     SelectSQL.Add(' DET.CANAL = FP.CANAL AND ');
     SelectSQL.Add(' CAR.FORMA_PAGO = FP.FORMA_PAGO ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' DET.EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' DET.EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' DET.CANAL = ?CANAL AND ');
     SelectSQL.Add(' DET.SIGNO = ''P'' AND ');
     if (Tipo = 'TAL') then
        SelectSQL.Add(' DET.DOC_AUTOMATICO = 1 AND ');
     if (Tipo = 'PAG') then
        SelectSQL.Add(' DET.DOC_AUTOMATICO = 2 AND ');
     SelectSQL.Add(' DET.DOCUMENTO = ?DOCUMENTO AND ');
     SelectSQL.Add(' DET.VISIBLE = 1 AND ');
     SelectSQL.Add(' DET.CONFIRMING = 0 AND ');
     SelectSQL.Add(' DET.ORD_PAGO = 0 ');
     SelectSQL.Add(' ORDER BY DET.EMPRESA, DET.EJERCICIO, DET.CANAL, DET.REGISTRO, DET.LINEA ');
  end;

  with xAgrupacionDocumentos do
  begin
     Close;
     Params.ByName['TIPO_EFECTO'].AsString := Tipo;
     Open;
  end;
end;

procedure TDMGestionDocumentosPago.InsertaDocumentos;
var
  Q : THYFIBQuery;
begin
  /// Inserto documentos que no estan pagados y que no existe en la agrupacion

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO EMP_CARTERA_AGRUP_DOC_DET (ID_AGRUP, TIPO_EFECTO, EMPRESA, EJERCICIO, CANAL, DOCUMENTO) ');
        SQL.Add(' SELECT ?ID_AGRUP, ?TIPO_EFECTO, EMPRESA, EJERCICIO, CANAL, ');
        if (Tipo = 'TAL') then
           SQL.Add(' TALON FROM EMP_CARTERA_TALONES DOC');
        if (Tipo = 'PAG') then
           SQL.Add(' PAGARE FROM EMP_CARTERA_PAGARES DOC');
        SQL.Add(' WHERE ');
        SQL.Add(' DOC.EMPRESA = ?EMPRESA AND ');
        SQL.Add(' DOC.EJERCICIO <= ?EJERCICIO AND ');
        SQL.Add(' DOC.CANAL = ?CANAL AND ');
        SQL.Add(' DOC.BANCO = ?BANCO AND ');
        SQL.Add(' DOC.TIPO_TERCERO IN (''PRO'', ''ACR'') AND ');
        SQL.Add(' DOC.PAGADO = 0 ');
        if (Tipo = 'PAG') then
           SQL.Add(' AND DOC.CONTABILIZADO = 1 ');
        SQL.Add(' AND NOT EXISTS( ');
        SQL.Add(' SELECT ID_AGRUP FROM EMP_CARTERA_AGRUP_DOC_DET ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_AGRUP = ?ID_AGRUP AND ');
        if (Tipo = 'TAL') then
           SQL.Add(' TIPO_EFECTO = ''TAL'' AND ');
        if (Tipo = 'PAG') then
           SQL.Add(' TIPO_EFECTO = ''PAG'' AND ');
        SQL.Add(' EMPRESA = DOC.EMPRESA AND ');
        SQL.Add(' EJERCICIO = DOC.EJERCICIO AND ');
        SQL.Add(' CANAL = DOC.CANAL AND ');
        if (Tipo = 'TAL') then
           SQL.Add(' DOCUMENTO = DOC.TALON) ');
        if (Tipo = 'PAG') then
           SQL.Add(' DOCUMENTO = DOC.PAGARE) ');
        Params.ByName['ID_AGRUP'].AsInteger := xAgrupacionDocumentosID_AGRUP.AsInteger;
        Params.ByName['TIPO_EFECTO'].AsString := xAgrupacionDocumentosTIPO_EFECTO.AsString;
        Params.ByName['EMPRESA'].AsInteger := xAgrupacionDocumentosEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xAgrupacionDocumentosEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := xAgrupacionDocumentosCANAL.AsInteger;
        Params.ByName['BANCO'].AsInteger := xAgrupacionDocumentosBANCO.AsInteger;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  RefrescaDetalle;
  RefrescaTotales;
end;

procedure TDMGestionDocumentosPago.xAgrupacionDocumentosAfterOpen(DataSet: TDataSet);
begin
  xAgrupacionDocumentosDet.Open;
  xInfoActualizada.Open;
end;

procedure TDMGestionDocumentosPago.xAgrupacionDocumentosBeforeClose(DataSet: TDataSet);
begin
  xAgrupacionDocumentosDet.Close;
  xInfoActualizada.Close;
end;

procedure TDMGestionDocumentosPago.MarcarTodos(Todos: boolean);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE EMP_CARTERA_AGRUP_DOC_DET ');
        SQL.Add(' SET MARCA = ?MARCA ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_AGRUP = ?ID_AGRUP ');
        Params.ByName['ID_AGRUP'].AsInteger := xAgrupacionDocumentosID_AGRUP.AsInteger;
        if (Todos) then
           Params.ByName['MARCA'].AsInteger := REntorno.Entrada
        else
           Params.ByName['MARCA'].AsInteger := 0;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  RefrescaDetalle;
  RefrescaTotales;
end;

procedure TDMGestionDocumentosPago.RefrescaDetalle;
begin
  with xAgrupacionDocumentosDet do
  begin
     Close;
     Open;
  end;
end;

procedure TDMGestionDocumentosPago.FormatoConfirming(Tipo: integer; CodCedente: string);
var
  TipoPago : string;
  Archivo : string;
begin
  Archivo := '';
  if MySaveDialog(Archivo, 'TXT', '', 'DMGestionDocumentosPago') then
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
        FechaConAAAA := FormatDateTime('yyyymmdd', xAgrupacionDocumentosFECHA.AsDateTime); // CambiaFecha(xAgrupacionDocumentosFECHA.AsDateTime); // AAAAMMDD
        Pais := REntorno.Pais;
        Referencia := xAgrupacionDocumentosEJERCICIO.AsString + '-' + xAgrupacionDocumentosRIG.AsString;
        // Clase de Pago (Mercancia=1 / Servicios=2)
        ClasePago := 1;
        CodigoEstadistico := '';
        // T=Transferencia, C=Cheque
        TipoPago := 'C';

        with xBanco do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['BANCO'].AsInteger := xAgrupacionDocumentosBANCO.AsInteger;
           Open;
        end;
        EntidadEmpresa := xBanco.FieldByName('ENTIDAD').AsString;
        OficinaEmpresa := xBanco.FieldByName('SUCURSAL').AsString;
        DCEmpresa := xBanco.FieldByName('CONTROL').AsString;
        CCEmpresa := xBanco.FieldByName('CUENTA_CORRIENTE').AsString;
        TotalImportes := xAgrupacionDocumentosIMPORTE.AsFloat; // En algun tipo se necesita como dato de cabecera

        // Introducimos datos de los recibos
        with xRecibos do
        begin
           Close;
           Params.ByName['ID_AGRUP'].AsInteger := xAgrupacionDocumentosID_AGRUP.AsInteger;
           if (xAgrupacionDocumentosTIPO_EFECTO.AsString = 'TAL') then
              Params.ByName['DOC_AUTOMATICO'].AsInteger := 1;
           if (xAgrupacionDocumentosTIPO_EFECTO.AsString = 'PAG') then
              Params.ByName['DOC_AUTOMATICO'].AsInteger := 2;
           Open;
           First;
        end;

        {
        // En el caso de Bankinter necesito saber antes de crear la cabecera si es nacional o internacional
        PaisProv := xLoc_TC_PAIS.AsString;
        PaisProv2 := DamePaisC2(xLoc_TC_PAIS.AsString);
        }

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
           // T=Transferencia, C=Cheque
           TipoPagoRec := 'T';
           NumFacturaRec := xRecibosDOC_NUMERO.AsString;
           NumFacturaProv := DameNroFacturaProv(xRecibosDOC_TIPO.AsString, xRecibosDOC_SERIE.AsString, xRecibosDOC_NUMERO.AsInteger, xRecibosID_DOC.AsInteger, xRecibosRIC.AsInteger);
           FechaEmiAAAA := FormatDateTime('yyyymmdd', xRecibosDOC_FECHA.AsDateTime); // CambiaFecha(xRecibosDOC_FECHA.AsDateTime);
           ImporteRec := xRecibosLIQUIDO.AsCurrency;
           TotalImportes := TotalImportes + Confirming.ImporteRec;
           FechaVtoAAAA := FormatDateTime('yyyymmdd', xRecibosVENCIMIENTO.AsDateTime); // CambiaFecha(xRecibosVENCIMIENTO.AsCurrency);
           if ImporteRec < 0 then
              SignoRec := '0'
           else
              SignoRec := '1';
           ObservacionesRec := '';
           CompRecibos;
           xRecibos.Next;
        end;

        //Introducimos los datos del total
        if TotalImportes < 0 then
           TotalSigno := '1'
        else
           TotalSigno := '0';

        CompTotales;

        Cerrar;

        ShowMessage(Format(_('Cedente : %s' + #13#10 + 'Importe : %s'), [codcedente, FormatFloat(MascaraN, TotalImportes)]));
     end;
  end;
end;

procedure TDMGestionDocumentosPago.xRecibosAfterScroll(DataSet: TDataSet);
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

function TDMGestionDocumentosPago.DameDireccion: string;
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

function TDMGestionDocumentosPago.DameNroFacturaProv(tipo, serie: string; rig, id, ric: integer): string;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     if tipo = 'FCR' then
     begin
        SQL.Text := 'SELECT NUM_FACTURA FROM GES_CABECERAS_E_FCR WHERE ID_E=' + IntToStr(id);
     end
     else
     if tipo = 'FAP' then
     begin
        SQL.Text := 'SELECT NUM_FACTURA FROM GES_CABECERAS_E_FAC WHERE ID_E=' + IntToStr(id);
     end
     else
     if tipo = 'AFP' then
     begin
        SQL.Text := 'select TEXTO as NUM_FACTURA from con_cuentas_apuntes ' +
           'where empresa=' + REntorno.EmpresaStr + ' and canal=' + REntorno.CanalStr + ' and doc_serie=''' + serie + ''' and doc_numero=''' + IntToStr(rig) + ''' and ric=' + IntToStr(ric);
     end
     else
     if tipo = 'AFA' then
     begin
        SQL.Text := 'select TEXTO as NUM_FACTURA from con_cuentas_apuntes ' +
           'where empresa=' + REntorno.EmpresaStr + ' and canal=' + REntorno.CanalStr + ' and doc_serie=''' + serie + ''' and doc_numero=''' + IntToStr(rig) + ''' and ric=' + IntToStr(ric);
     end
     else
     if tipo = 'AGP' then // Agrupacion de recibos de proveedor
     begin
        { TODO : seleccionar el texto del registro de cartera correspondiente }
        SQL.Text := 'select ''Agrup. Fact.'' as NUM_FACTURA from rdb$database ';
     end
     else
     if tipo = 'NRP' then // Recibo de proveedor creado a mano
     begin
        { TODO : seleccionar el texto del registro de cartera correspondiente }
        SQL.Text := 'select ''Recibo'' as NUM_FACTURA from rdb$database ';
     end
     else
     if tipo = 'AGA' then // Agrupacion de recibos de acreedor
     begin
        { TODO : seleccionar el texto del registro de cartera correspondiente }
        SQL.Text := 'select ''Agrup. Fact.'' as NUM_FACTURA from rdb$database ';
     end
     else
     if tipo = 'NRA' then // Recibo de acreedor creado a mano
     begin
        { TODO : seleccionar el texto del registro de cartera correspondiente }
        SQL.Text := 'select ''Recibo'' as NUM_FACTURA from rdb$database ';
     end;
     ExecQuery;
     Result := FieldByName['NUM_FACTURA'].AsString;
     if tipo = 'AFP' then
        if (Pos('PASE AUTOMATICO FRA. PROV.', Result) > 0) then
           Result := Copy(Result, Pos('(', Result) + 1, Pos(')', Result) - Pos('(', Result) - 1);
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

procedure TDMGestionDocumentosPago.xAgrupacionDocumentosDetAfterPost(DataSet: TDataSet);
begin
  RefrescaTotales;
end;

procedure TDMGestionDocumentosPago.BorrarMarcados;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM EMP_CARTERA_AGRUP_DOC_DET ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_AGRUP = ?ID_AGRUP AND MARCA = ?MARCA');
        Params.ByName['ID_AGRUP'].AsInteger := xAgrupacionDocumentosID_AGRUP.AsInteger;
        Params.ByName['MARCA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  RefrescaDetalle;
  RefrescaTotales;
end;

procedure TDMGestionDocumentosPago.RefrescaTotales;
begin
  xInfoActualizada.Close;
  xInfoActualizada.Open;
end;

procedure TDMGestionDocumentosPago.PagarDocumentos;
var
  Q : THYFIBQuery;
begin
  with xAgrupacionDocumentosDet do
  begin
     First;
     while not EOF do
     begin
        if (xAgrupacionDocumentosDetMARCA.AsInteger = REntorno.Entrada) then
        begin
           if (xAgrupacionDocumentosDetTIPO_EFECTO.AsString = 'TAL') then
           begin
              Q := THYFIBQuery.Create(nil);
              try
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_PAGA_TALON(?EMPRESA, ?EJERCICIO, ?CANAL, ?TALON, ?ENTRADA, ?RETENCION, ?TIPO_RETENCION)';
                    Params.ByName['EMPRESA'].AsInteger := xAgrupacionDocumentosDetEMPRESA.AsInteger;
                    Params.ByName['EJERCICIO'].AsInteger := xAgrupacionDocumentosDetEJERCICIO.AsInteger;
                    Params.ByName['CANAL'].AsInteger := xAgrupacionDocumentosDetCANAL.AsInteger;
                    Params.ByName['TALON'].AsString := xAgrupacionDocumentosDetDOCUMENTO.AsString;
                    Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                    Params.ByName['RETENCION'].AsInteger := 0;
                    Params.ByName['TIPO_RETENCION'].AsInteger := 0;
                    ExecQuery;
                    FreeHandle;
                 end;
              finally
                 FreeAndNil(Q);
              end;
           end;

           if (xAgrupacionDocumentosDetTIPO_EFECTO.AsString = 'PAG') then
           begin
              Q := THYFIBQuery.Create(nil);
              try
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_PAGA_PAGARE(?EMPRESA, ?EJERCICIO, ?CANAL, ?PAGARE, ?ENTRADA)';
                    Params.ByName['EMPRESA'].AsInteger := xAgrupacionDocumentosDetEMPRESA.AsInteger;
                    Params.ByName['EJERCICIO'].AsInteger := xAgrupacionDocumentosDetEJERCICIO.AsInteger;
                    Params.ByName['CANAL'].AsInteger := xAgrupacionDocumentosDetCANAL.AsInteger;
                    Params.ByName['PAGARE'].AsString := xAgrupacionDocumentosDetDOCUMENTO.AsString;
                    Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                    ExecQuery;
                    FreeHandle;
                 end;
              finally
                 FreeAndNil(Q);
              end;
           end;
        end;
        Next;
     end;
  end;
end;

procedure TDMGestionDocumentosPago.xAgrupacionDocumentosDetAfterOpen(DataSet: TDataSet);
begin
  xDetalleDocumento.Open;
end;

procedure TDMGestionDocumentosPago.xAgrupacionDocumentosDetBeforeClose(DataSet: TDataSet);
begin
  xDetalleDocumento.Close;
end;

procedure TDMGestionDocumentosPago.xDetalleDocumentoAfterOpen(DataSet: TDataSet);
begin
  if ((xDetalleDocumentoDOC_TIPO.AsString = 'FAP') or (xDetalleDocumentoDOC_TIPO.AsString = 'AGP') or
     (xDetalleDocumentoDOC_TIPO.AsString = 'NRP') or (xDetalleDocumentoDOC_TIPO.AsString = 'AFP')) then
     xIncidencias.Params.ByName['TIPO_TERCERO'].AsString := 'PRO'
  else
     xIncidencias.Params.ByName['TIPO_TERCERO'].AsString := 'ACR';

  xIncidencias.Open;
end;

procedure TDMGestionDocumentosPago.xDetalleDocumentoBeforeClose(DataSet: TDataSet);
begin
  xIncidencias.Close;
end;

procedure TDMGestionDocumentosPago.xDetalleDocumentoAfterScroll(DataSet: TDataSet);
begin
  xIncidencias.Close;

  if ((xDetalleDocumentoDOC_TIPO.AsString = 'FAP') or (xDetalleDocumentoDOC_TIPO.AsString = 'AGP') or
     (xDetalleDocumentoDOC_TIPO.AsString = 'NRP') or (xDetalleDocumentoDOC_TIPO.AsString = 'AFP')) then
     xIncidencias.Params.ByName['TIPO_TERCERO'].AsString := 'PRO'
  else
     xIncidencias.Params.ByName['TIPO_TERCERO'].AsString := 'ACR';

  xIncidencias.Open;
end;

procedure TDMGestionDocumentosPago.OrdenarDetalle(campo: string);
begin
  // Codigo especial para poder ordenar por campos que agrupan valores
  with xAgrupacionDocumentosDet do
  begin
     Close;
     SelectSQL.Text := Copy(SelectSQL.Text, 1, Pos('ORDER', SelectSQL.Text) - 1);
     if (Campo = 'COD_CLI_PRO') then
        SelectSQL.Add('ORDER BY MIN(C.COD_CLI_PRO)');
     if (Campo = 'TITULO') then
        SelectSQL.Add('ORDER BY MIN(CC.TITULO)');
     if (Campo = 'LIQUIDO') then
        SelectSQL.Add('ORDER BY SUM(D.LIQUIDO)');
     if (Campo = 'DOCUMENTO') then
        SelectSQL.Add('ORDER BY SUM(A.DOCUMENTO)');
     if (Campo = 'EJERCICIO') then
        SelectSQL.Add('ORDER BY SUM(A.EJERCICIO)');
     Open;
  end;
end;

procedure TDMGestionDocumentosPago.FormatoPagare(Tipo: integer);
var
  Archivo : string;
  s, UltimoNIF : string;
  ts : TStrings;
  RegistrosDeRemesa, BeneficiariosDeRemesa : integer;
begin
  Archivo := '';
  if MySaveDialog(Archivo, 'TXT', '', 'DMGestionDocumentosPago') then
  begin
     case Tipo of
        6:  // Banco Sabadell
        begin
           // Banco ordenante
           with xBanco do
           begin
              Close;
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['BANCO'].AsInteger := xAgrupacionDocumentosBANCO.AsInteger;
              Open;
           end;

           // Recibos pertenecientes a la agrupacion
           with xRecibos do
           begin
              Close;
              Params.ByName['ID_AGRUP'].AsInteger := xAgrupacionDocumentosID_AGRUP.AsInteger;
              if (xAgrupacionDocumentosTIPO_EFECTO.AsString = 'TAL') then
                 Params.ByName['DOC_AUTOMATICO'].AsInteger := 1;
              if (xAgrupacionDocumentosTIPO_EFECTO.AsString = 'PAG') then
                 Params.ByName['DOC_AUTOMATICO'].AsInteger := 2;
              Open;
              First;
           end;

           RegistrosDeRemesa := 0;
           BeneficiariosDeRemesa := 0;
           UltimoNIF := '';
           ts := TStringList.Create;
           try
              with ts do
              begin
                 while (not xRecibos.EOF) do
                 begin
                    if ((xRecibosDOC_TIPO.AsString = 'FAP') or (xRecibosDOC_TIPO.AsString = 'AGP') or
                       (xRecibosDOC_TIPO.AsString = 'NRP') or (xRecibosDOC_TIPO.AsString = 'AFP')) then
                    begin
                       if (UltimoNIF <> xProveedorNIF.AsString) then
                       begin
                          Inc(BeneficiariosDeRemesa);
                          UltimoNIF := xProveedorNIF.AsString;
                       end;
                    end
                    else
                    begin
                       if (UltimoNIF <> xAcreedorNIF.AsString) then
                       begin
                          Inc(BeneficiariosDeRemesa);
                          UltimoNIF := xAcreedorNIF.AsString;
                       end;
                    end;

                    // Registro Domicilio de Ordenante
                    Inc(RegistrosDeRemesa);
                    s := '';
                    s := s + Ajusta('71', 'I', 2, '0'); // Tipo de Lote - "60" Cheque bancario, "70" Cheque CC, "71" Pagare
                    s := s + 'O'; // Codigo de registro
                    s := s + Ajusta(REntorno.CifEmpresa, 'D', 10, ' '); // NIF Ordenante
                    s := s + Ajusta(REntorno.NombreEmpresa, 'D', 40, ' '); // Nombre Ordenante
                    s := s + Ajusta(REntorno.DirEmpresa, 'D', 40, ' '); // Direccion Ordenante
                    s := s + Ajusta(Copy(REntorno.PobEmpresa, 1, Pos(' ', REntorno.PobEmpresa)), 'D', 5, ' '); // Codigo Postal
                    s := s + Ajusta(REntorno.PobEmpresa, 'D', 40, ' '); // Poblacion
                    ts.Add(s);

                    // Registro Beneficiario
                    Inc(RegistrosDeRemesa);
                    s := '';
                    s := s + Ajusta('71', 'I', 2, '0'); // Tipo de Lote - "60" Cheque bancario, "70" Cheque CC, "71" Pagare
                    s := s + 'B'; // Codigo de registro
                    s := s + Ajusta(xAgrupacionDocumentosDetCOD_CLI_PRO.AsString, 'D', 12, ' '); // Codigo Beneficiario
                    s := s + FormatFloat('00000000', Trunc(xRecibosLIQUIDO.AsFloat)) + FormatFloat('00', (xRecibosLIQUIDO.AsFloat - Trunc(xRecibosLIQUIDO.AsFloat)) * 100); // Importe a abonar

                    if ((xRecibosDOC_TIPO.AsString = 'FAP') or (xRecibosDOC_TIPO.AsString = 'AGP') or
                       (xRecibosDOC_TIPO.AsString = 'NRP') or (xRecibosDOC_TIPO.AsString = 'AFP')) then
                    begin
                       s := s + Ajusta(xProveedorTITULO.AsString, 'D', 40, ' '); // Nombre Beneficiario
                       s := s + Ajusta('01', 'I', 2, '0'); // "01" Castellano, "08" Catalan
                       s := s + Ajusta(xLoc_TCODPOSTAL.AsString, 'D', 5, '0'); // Codigo Postal
                       s := s + Ajusta(xDireccionProveedorDIR_COMPLETA_N.AsString, 'D', 40, ' '); // Codigo Postal
                    end;

                    if ((xRecibosDOC_TIPO.AsString = 'FCR') or (xRecibosDOC_TIPO.AsString = 'AGA') or
                       (xRecibosDOC_TIPO.AsString = 'NRA') or (xRecibosDOC_TIPO.AsString = 'AFA')) then
                    begin
                       s := s + Ajusta(xAcreedorTITULO.AsString, 'D', 40, ' '); // Nombre Beneficiario
                       s := s + Ajusta('01', 'I', 2, '0'); // "01" Castellano, "08" Catalan
                       s := s + Ajusta(xLoc_TCODPOSTAL.AsString, 'D', 5, '0'); // Codigo Postal
                       s := s + Ajusta(xDireccionProveedorDIR_COMPLETA_N.AsString, 'D', 40, ' '); // Codigo Postal
                    end;

                    s := s + FormatDateTime('yyyymmdd', xRecibosVENCIMIENTO.AsDateTime); // Fecha de vencimiento (Solo para pageres Tipo Lote = "71")
                    s := s + Ajusta('S', 'I', 1, ' '); // Documento Barrado - "S" Si, "N" No
                    s := s + Ajusta(' ', 'D', 17, ' '); // Reservado para futuro uso
                    ts.Add(s);

                    // Registro Poblacion
                    Inc(RegistrosDeRemesa);
                    s := '';
                    s := s + Ajusta('71', 'I', 2, '0'); // Tipo de Lote - "60" Cheque bancario, "70" Cheque CC, "71" Pagare
                    s := s + 'P'; // Codigo de registro
                    s := s + Ajusta(xAgrupacionDocumentosDetCOD_CLI_PRO.AsString, 'D', 12, ' '); // Codigo Beneficiario
                    s := s + Ajusta(xLoc_TTITULO.AsString, 'D', 40, ' '); // Poblacion Beneficiario
                    s := s + Ajusta(xLoc_TPROVINCIA.AsString, 'D', 20, ' '); // Provincia Beneficiario
                    s := s + Ajusta(' ', 'D', 63, ' '); // Reservado para futuro uso
                    ts.Add(s);

                    // Registro Concepto (opcional, ilimitado)
                    {
                    inc(RegistrosDeRemesa);
                    inc(RegistrosDeRemesa);
                    s := '';
                    s := s + Ajusta('71', 'I', 2, '0'); // Tipo de Lote - "60" Cheque bancario, "70" Cheque CC, "71" Pagare
                    s := s + 'C'; // Codigo de registro
                    s := s +  Ajusta(xAgrupacionDocumentosDetCOD_CLI_PRO.AsString, 'D', 12, ' '); // Codigo Beneficiario
                    s := s + Ajusta(, 'D', 96, ' '); // Concepto
                    s := s + Ajusta(' ', 'D', 3, ' '); // Reservado para futuro uso
                    ts.Add(s);
                    }

                    xRecibos.Next;
                 end;

                 // Registro ordenante (Con totales)
                 Inc(RegistrosDeRemesa);
                 s := '';
                 s := s + Ajusta('71', 'I', 2, '0'); // Tipo de Lote - "60" Cheque bancario, "70" Cheque CC, "71" Pagare
                 s := s + 'E'; // Codigo de registro
                 s := s + Ajusta(REntorno.CifEmpresa, 'D', 10, ' '); // NIF Ordenante
                 s := s + FormatDateTime('yyyymmdd', xAgrupacionDocumentosFECHA.AsDateTime); // Fecha de la remesa
                 s := s + FormatDateTime('yyyymmdd', xAgrupacionDocumentosFECHA.AsDateTime); // Fecha de pago
                 s := s + Ajusta(xBanco.FieldByName('ENTIDAD').AsString, 'D', 4, ' ');  // Banco de Cargo Ordenante
                 s := s + Ajusta(xBanco.FieldByName('SUCURSAL').AsString, 'D', 4, ' '); // Oficina de Cargo Ordenante
                 // s := s +  Ajusta(xBanco.FieldByName('CONTROL').AsString, 'D', 2, ' ');
                 s := s + Ajusta(xBanco.FieldByName('CUENTA_CORRIENTE').AsString, 'D', 10, ' '); // Cuenta de Cargo Ordenante
                 s := s + FormatFloat('0000000000', Trunc(xInfoActualizadaIMPORTE.AsFloat)) + FormatFloat('00', (xInfoActualizadaIMPORTE.AsFloat - Trunc(xInfoActualizadaIMPORTE.AsFloat)) * 100); // Total Importe Cheques
                 s := s + FormatFloat('00000000', RegistrosDeRemesa); // Total de registros
                 s := s + FormatFloat('00000000', BeneficiariosDeRemesa); // Total de beneficiarios
                 s := s + Ajusta('B', 'I', 1, ' '); // Forma de envio - "B" Entrega al beneficiario, "O" distribucion a traves de oficina
                 s := s + Ajusta('', 'I', 60, ' '); // Concepto Comun
                 s := s + Ajusta('', 'I', 1, ' '); // Tipo de Envio - "Blanco" Enio por BS Online - "U" Envio por Infobanc
                 s := s + Ajusta('1', 'I', 1, ' '); // Version
                 // Debe ser el primer registro
                 ts.Insert(0, s);

                 // Guardo en el fichero
                 ts.SaveToFile(Archivo);
              end
           finally
              ts.Free;
           end;
        end;

        9:  // La Caixa
        begin
           // Banco ordenante
           with xBanco do
           begin
              Close;
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['BANCO'].AsInteger := xAgrupacionDocumentosBANCO.AsInteger;
              Open;
           end;

           // Recibos pertenecientes a la agrupacion
           with xRecibos do
           begin
              Close;
              Params.ByName['ID_AGRUP'].AsInteger := xAgrupacionDocumentosID_AGRUP.AsInteger;
              if (xAgrupacionDocumentosTIPO_EFECTO.AsString = 'TAL') then
                 Params.ByName['DOC_AUTOMATICO'].AsInteger := 1;
              if (xAgrupacionDocumentosTIPO_EFECTO.AsString = 'PAG') then
                 Params.ByName['DOC_AUTOMATICO'].AsInteger := 2;
              Open;
              First;
           end;

           RegistrosDeRemesa := 0;
           BeneficiariosDeRemesa := 0;
           UltimoNIF := '';
           ts := TStringList.Create;
           try
              with ts do
              begin
                 // Registros Ordenante
                 // Primer tipo de registro (Obligatorio)
                 Inc(RegistrosDeRemesa);
                 s := '';
                 s := s + '03'; // codigo de registro
                 s := s + '56'; // Codigo de operacion (Euros)
                 s := s + Ajusta(REntorno.CifEmpresa, 'D', 10, ' '); // Codigo del Ordenante
                 s := s + '34016'; // Version del cuaderno
                 s := s + Ajusta('', 'D', 7, ' '); // Libre (opcional referencia para cuaderno 43)

                 s := s + '001'; // Numero de dato
                 s := s + FormatDateTime('ddmmyy', xAgrupacionDocumentosFECHA.AsDateTime); // Fecha de envio de registro
                 s := s + FormatDateTime('ddmmyy', xAgrupacionDocumentosFECHA.AsDateTime); // Fecha de emision de ordenes
                 s := s + Ajusta(xBanco.FieldByName('ENTIDAD').AsString, 'D', 4, '0');  // Codigo de Entidad (La Caixa)
                 s := s + Ajusta(xBanco.FieldByName('SUCURSAL').AsString, 'D', 4, '0'); // Oficina de Cargo Ordenante
                 s := s + Ajusta(xBanco.FieldByName('CUENTA_CORRIENTE').AsString, 'D', 10, '0'); // Cuenta de Cargo Ordenante
                 s := s + '0'; // Cargo: 0-Por fichero, 1-Por orden
                 s := s + '3'; // Gastos: 1-Ordenando, 2-beneficiario, 3-compartidos
                 s := s + Ajusta(' ', 'D', 2, ' '); // Libre
                 s := s + Ajusta(xBanco.FieldByName('CONTROL').AsString, 'D', 2, '0');
                 s := s + Ajusta(' ', 'D', 7, ' '); // Libre
                 ts.Add(s);

                 // Segundo tipo de registro (Obligatorio)
                 Inc(RegistrosDeRemesa);
                 s := '';
                 s := s + '03'; // codigo de registro
                 s := s + '56'; // Codigo de operacion (Euros)
                 s := s + Ajusta(REntorno.CifEmpresa, 'D', 10, ' '); // Codigo del Ordenante
                 s := s + '34016'; // Version del cuaderno
                 s := s + Ajusta('', 'D', 7, ' '); // Libre (opcional referencia para cuaderno 43)

                 s := s + '002'; // Numero de dato
                 s := s + Ajusta(REntorno.NombreEmpresa, 'D', 36, ' '); // Nombre Ordenante
                 s := s + Ajusta('', 'D', 7, ' '); // Libre (opcional referencia para cuaderno 43)
                 ts.Add(s);

                 // Tercer tipo de registro (Obligatorio)
                 Inc(RegistrosDeRemesa);
                 s := '';
                 s := s + '03'; // codigo de registro
                 s := s + '56'; // Codigo de operacion (Euros)
                 s := s + Ajusta(REntorno.CifEmpresa, 'D', 10, ' '); // Codigo del Ordenante
                 s := s + '34016'; // Version del cuaderno
                 s := s + Ajusta('', 'D', 7, ' '); // Libre (opcional referencia para cuaderno 43)

                 s := s + '003'; // Numero de dato
                 s := s + Ajusta(REntorno.DirEmpresa, 'D', 36, ' '); // Direccion Ordenante
                 s := s + Ajusta('', 'D', 7, ' '); // Libre (opcional referencia para cuaderno 43)
                 ts.Add(s);

                 // Cuarto tipo de registro (Obligatorio)
                 Inc(RegistrosDeRemesa);
                 s := '';
                 s := s + '03'; // codigo de registro
                 s := s + '56'; // Codigo de operacion (Euros)
                 s := s + Ajusta(REntorno.CifEmpresa, 'D', 10, ' '); // Codigo del Ordenante
                 s := s + '34016'; // Version del cuaderno
                 s := s + Ajusta('', 'D', 7, ' '); // Libre (opcional referencia para cuaderno 43)

                 s := s + '004'; // Numero de dato
                 s := s + Ajusta(REntorno.PobEmpresa, 'D', 36, ' '); // Poblacion
                 s := s + Ajusta('', 'D', 7, ' '); // Libre (opcional referencia para cuaderno 43)
                 ts.Add(s);

                 // Quinto tipo de registro (Opcional)
                 { Cuanodo se realice por cuenta de otra persona
                  Inc(RegistrosDeRemesa);
                  s := '';
                  s := s + '03'; // codigo de registro
                  s := s + '56'; // Codigo de operacion (Euros)
                  s := s + Ajusta(REntorno.CifEmpresa, 'D', 10, ' '); // Codigo del Ordenante
                  s := s + '34016'; // Version del cuaderno

                  s := s + '007'; // Numero de dato
                  s := s + Ajusta('', 'D', 36, ' '); // Nombre de la persona
                  s := s + Ajusta('', 'D', 7, ' '); // Libre (opcional referencia para cuaderno 43)
                  ts.Add(s);
                  }

                 // Sexto tipo de registro (Opcional)
                 { Cuanodo se realice por cuenta de otra persona
                  Inc(RegistrosDeRemesa);
                  s := '';
                  s := s + '03'; // codigo de registro
                  s := s + '56'; // Codigo de operacion (Euros)
                  s := s + Ajusta(REntorno.CifEmpresa, 'D', 10, ' '); // Codigo del Ordenante
                  s := s + '34016'; // Version del cuaderno

                  s := s + '008'; // Numero de dato
                  s := s + Ajusta('', 'D', 36, ' '); // Direccion de la persona
                  s := s + Ajusta('', 'D', 7, ' '); // Libre (opcional referencia para cuaderno 43)
                  ts.Add(s);
                  }

                 while (not xRecibos.EOF) do
                 begin
                    // Registros Beneficiario
                    // Primer registro
                    Inc(RegistrosDeRemesa);
                    Inc(BeneficiariosDeRemesa);
                    s := '';
                    s := s + '06'; // codigo de registro
                    s := s + '59'; // Codigo de operacion (56-Transferencia, 57-Cheque/Nomina/bancario, 58-Cheuq cliente, 59-Pagare)
                    s := s + Ajusta(REntorno.CifEmpresa, 'D', 10, ' '); // Codigo del Ordenante
                    s := s + Ajusta(xRecibosCOD_CLI_PRO.AsString, 'D', 12, ' '); // Referenica Beneficiario

                    s := s + '010'; // Numero de dato
                    s := s + FormatFloat('0000000000', Trunc(xRecibosLIQUIDO.AsFloat)) + FormatFloat('00', (xRecibosLIQUIDO.AsFloat - Trunc(xRecibosLIQUIDO.AsFloat)) * 100); // Importe a abonar
                    s := s + Ajusta(xProveedorBancoENTIDAD.AsString, 'D', 4, '0'); // Entidad del beneficiario
                    s := s + Ajusta(xProveedorBancoSUCURSAL.AsString, 'D', 4, '0'); // Sucursal del beneficiario
                    // Cuenta del beneficiario (En el caso de pagaré tiene significado especial
                    s := s + Ajusta('0000000', 'D', 7, '0'); // Posiciones 1-7 Rellenados a 0
                    s := s + Ajusta('1', 'D', 1, '0'); // Posicion 8 - Envio de documentacion 1-Correo ordinario, 2-Correo certificado, 3-Se remite a ordenante
                    s := s + Ajusta('0', 'D', 1, '0'); // Posicion 9 - 1-No a la orden, 0-A la orden
                    s := s + Ajusta('9', 'D', 1, '0'); // Posicion 10 - 9-Barrado, 0-Sin barrar

                    s := s + Ajusta(' ', 'D', 1, ' '); // Libre
                    s := s + Ajusta('9', 'D', 1, ' '); // Concepto: 1-Nomina, 8-Pension, 9-Otros conceptos
                    s := s + Ajusta('', 'D', 2, ' '); // Libre
                    s := s + Ajusta(xProveedorBancoCONTROL.AsString, 'D', 2, '0'); // Codigo de control beneficiario
                    s := s + Ajusta('', 'D', 7, ' '); // Libre
                    ts.Add(s);

                    // Segundo registro Obligatorio
                    Inc(RegistrosDeRemesa);
                    s := '';
                    s := s + '06'; // codigo de registro
                    s := s + '59'; // Codigo de operacion (56-Transferencia, 57-Cheque/Nomina/bancario, 58-Cheuq cliente, 59-Pagare)
                    s := s + Ajusta(REntorno.CifEmpresa, 'D', 10, ' '); // Codigo del Ordenante
                    s := s + Ajusta(xRecibosCOD_CLI_PRO.AsString, 'D', 12, ' '); // Referenica Beneficiario

                    s := s + '011'; // Numero de dato
                    if ((xRecibosDOC_TIPO.AsString = 'FAP') or (xRecibosDOC_TIPO.AsString = 'AGP') or
                       (xRecibosDOC_TIPO.AsString = 'NRP') or (xRecibosDOC_TIPO.AsString = 'AFP')) then
                       s := s + Ajusta(xProveedorTITULO.AsString, 'D', 36, ' '); // Nombre
                    if ((xRecibosDOC_TIPO.AsString = 'FCR') or (xRecibosDOC_TIPO.AsString = 'AGA') or
                       (xRecibosDOC_TIPO.AsString = 'NRA') or (xRecibosDOC_TIPO.AsString = 'AFA')) then
                       s := s + Ajusta(xAcreedorTITULO.AsString, 'D', 36, ' '); // Nombre
                    s := s + Ajusta('', 'D', 7, ' '); // Libre
                    ts.Add(s);

                    // Tercero registro Obligatorio
                    Inc(RegistrosDeRemesa);
                    s := '';
                    s := s + '06'; // codigo de registro
                    s := s + '59'; // Codigo de operacion (56-Transferencia, 57-Cheque/Nomina/bancario, 58-Cheuq cliente, 59-Pagare)
                    s := s + Ajusta(REntorno.CifEmpresa, 'D', 10, ' '); // Codigo del Ordenante
                    s := s + Ajusta(xRecibosCOD_CLI_PRO.AsString, 'D', 12, ' '); // Referenica Beneficiario

                    s := s + '012'; // Numero de dato
                    s := s + Ajusta(Trim(xDireccionProveedorDIR_COMPLETA_N.AsString), 'D', 36, ' '); // Direccion
                    s := s + Ajusta('', 'D', 7, ' '); // Libre
                    ts.Add(s);

                    if (Length(Trim(xDireccionProveedorDIR_COMPLETA_N.AsString)) > 36) then
                    begin
                       // Cuarto registro Opcional
                       Inc(RegistrosDeRemesa);
                       s := '';
                       s := s + '06'; // codigo de registro
                       s := s + '59'; // Codigo de operacion (56-Transferencia, 57-Cheque/Nomina/bancario, 58-Cheuq cliente, 59-Pagare)
                       s := s + Ajusta(REntorno.CifEmpresa, 'D', 10, ' '); // Codigo del Ordenante
                       s := s + Ajusta(xRecibosCOD_CLI_PRO.AsString, 'D', 12, ' '); // Referenica Beneficiario

                       s := s + '013'; // Numero de dato
                       s := s + Ajusta(Copy(Trim(xDireccionProveedorDIR_COMPLETA_N.AsString), 37, 36), 'D', 36, ' '); // Direccion
                       s := s + Ajusta('', 'D', 7, ' '); // Libre
                       ts.Add(s);
                    end;

                    // Quinto registro Obligatorio
                    Inc(RegistrosDeRemesa);
                    s := '';
                    s := s + '06'; // codigo de registro
                    s := s + '59'; // Codigo de operacion (56-Transferencia, 57-Cheque/Nomina/bancario, 58-Cheuq cliente, 59-Pagare)
                    s := s + Ajusta(REntorno.CifEmpresa, 'D', 10, ' '); // Codigo del Ordenante
                    s := s + Ajusta(xRecibosCOD_CLI_PRO.AsString, 'D', 12, ' '); // Referenica Beneficiario

                    s := s + '014'; // Numero de dato
                    s := s + Ajusta(Trim(xLoc_TCODPOSTAL.AsString) + ' ' + xLoc_TTITULO.AsString, 'D', 36, ' '); // Codigo postal y plaza
                    s := s + Ajusta('', 'D', 7, ' '); // Libre
                    ts.Add(s);

                    // Sexto registro Obligatorio
                    Inc(RegistrosDeRemesa);
                    s := '';
                    s := s + '06'; // codigo de registro
                    s := s + '59'; // Codigo de operacion (56-Transferencia, 57-Cheque/Nomina/bancario, 58-Cheuq cliente, 59-Pagare)
                    s := s + Ajusta(REntorno.CifEmpresa, 'D', 10, ' '); // Codigo del Ordenante
                    s := s + Ajusta(xRecibosCOD_CLI_PRO.AsString, 'D', 12, ' '); // Referenica Beneficiario

                    s := s + '015'; // Numero de dato
                    s := s + Ajusta(xLoc_TPROVINCIA.AsString, 'D', 36, ' '); // Provincia
                    s := s + Ajusta('', 'D', 7, ' '); // Libre
                    ts.Add(s);

                    // Septimo registro Opcional
                    Inc(RegistrosDeRemesa);
                    s := '';
                    s := s + '06'; // codigo de registro
                    s := s + '59'; // Codigo de operacion (56-Transferencia, 57-Cheque/Nomina/bancario, 58-Cheuq cliente, 59-Pagare)
                    s := s + Ajusta(REntorno.CifEmpresa, 'D', 10, ' '); // Codigo del Ordenante
                    s := s + Ajusta(xRecibosCOD_CLI_PRO.AsString, 'D', 12, ' '); // Referenica Beneficiario

                    s := s + '016'; // Numero de dato
                    s := s + Ajusta(Format(_('Pago %s %s/%d'), [xRecibosDOC_TIPO.AsString, xRecibosDOC_SERIE.AsString, xRecibosDOC_NUMERO.AsInteger]), 'D', 36, ' '); // Concepto
                    s := s + Ajusta('', 'D', 7, ' '); // Libre
                    ts.Add(s);

                    {
                    // Octavo registro Opcional
                    Inc(RegistrosDeRemesa);
                    s := '';
                    s := s + '06'; // codigo de registro
                    s := s + '59'; // Codigo de operacion (56-Transferencia, 57-Cheque/Nomina/bancario, 58-Cheuq cliente, 59-Pagare)
                    s := s + Ajusta(REntorno.CifEmpresa, 'D', 10, ' '); // Codigo del Ordenante
                    s := s + Ajusta(xRecibosCOD_CLI_PRO.AsString, 'D', 12, ' '); // Referenica Beneficiario

                    s := s + '017'; // Numero de dato
                    s := s + Ajusta('', 'D', 36, ' '); // Continuacion concepto
                    s := s + Ajusta('', 'D', 7, ' '); // Libre
                    ts.Add(s);
                    }

                    // Noveno registro Opcional
                    Inc(RegistrosDeRemesa);
                    s := '';
                    s := s + '06'; // codigo de registro
                    s := s + '59'; // Codigo de operacion (56-Transferencia, 57-Cheque/Nomina/bancario, 58-Cheuq cliente, 59-Pagare)
                    s := s + Ajusta(REntorno.CifEmpresa, 'D', 10, ' '); // Codigo del Ordenante
                    s := s + Ajusta(xRecibosCOD_CLI_PRO.AsString, 'D', 12, ' '); // Referenica Beneficiario

                    s := s + '018'; // Numero de dato
                    if ((xRecibosDOC_TIPO.AsString = 'FAP') or (xRecibosDOC_TIPO.AsString = 'AGP') or
                       (xRecibosDOC_TIPO.AsString = 'NRP') or (xRecibosDOC_TIPO.AsString = 'AFP')) then
                       s := s + Ajusta(xProveedorNIF.AsString, 'D', 18, ' '); // NIF Beneficiario
                    if ((xRecibosDOC_TIPO.AsString = 'FCR') or (xRecibosDOC_TIPO.AsString = 'AGA') or
                       (xRecibosDOC_TIPO.AsString = 'NRA') or (xRecibosDOC_TIPO.AsString = 'AFA')) then
                       s := s + Ajusta(xAcreedorNIF.AsString, 'D', 18, ' '); // NIF Beneficiario
                    s := s + Ajusta(xRecibosCOD_CLI_PRO.AsString, 'D', 18, ' '); // Otro identificador
                    s := s + Ajusta('', 'D', 7, ' '); // Libre
                    ts.Add(s);

                    // Decimo registro Opcional
                    {
                    // Texto de la carta (cada linea son dos registros 36+36)
                    Inc(RegistrosDeRemesa);
                    s := '';
                    s := s + '06'; // codigo de registro
                    s := s + '59'; // Codigo de operacion (56-Transferencia, 57-Cheque/Nomina/bancario, 58-Cheuq cliente, 59-Pagare)
                    s := s + Ajusta(REntorno.CifEmpresa, 'D', 10, ' '); // Codigo del Ordenante
                    s := s + Ajusta(xRecibosCOD_CLI_PRO.AsString, 'D', 12, ' '); // Referenica Beneficiario

                    s := s + '103'; // Numero de dato 103-900
                    s := s + Ajusta('', 'D', 36, ' '); //
                    s := s + Ajusta('', 'D', 7, ' '); // Libre
                    ts.Add(s);
                    }

                    // Decimoprimero registro Opcional
                    {
                    // No aplica a Pagare
                    Inc(RegistrosDeRemesa);
                    s := '';
                    s := s + '06'; // codigo de registro
                    s := s + '59'; // Codigo de operacion (56-Transferencia, 57-Cheque/Nomina/bancario, 58-Cheuq cliente, 59-Pagare)
                    s := s + Ajusta(REntorno.CifEmpresa, 'D', 10, ' '); // Codigo del Ordenante
                    s := s + Ajusta(xRecibosCOD_CLI_PRO.AsString, 'D', 12, ' '); // Referenica Beneficiario

                    s := s + '019'; // Numero de dato
                    s := s + Ajusta('', 'D', 36, ' '); //
                    s := s + Ajusta('', 'D', 7, ' '); // Libre
                    ts.Add(s);
                    }

                    // Decimosegundo registro Opcional
                    {
                    // No aplica a pagare
                    Inc(RegistrosDeRemesa);
                    s := '';
                    s := s + '06'; // codigo de registro
                    s := s + '59'; // Codigo de operacion (56-Transferencia, 57-Cheque/Nomina/bancario, 58-Cheuq cliente, 59-Pagare)
                    s := s + Ajusta(REntorno.CifEmpresa, 'D', 10, ' '); // Codigo del Ordenante
                    s := s + Ajusta(xRecibosCOD_CLI_PRO.AsString, 'D', 12, ' '); // Referenica Beneficiario

                    s := s + '019'; // Numero de dato
                    s := s + Ajusta('', 'D', 36, ' '); //
                    s := s + Ajusta('', 'D', 7, ' '); // Libre
                    ts.Add(s);
                    }

                    // Decimotercero registro Opcional
                    Inc(RegistrosDeRemesa);
                    s := '';
                    s := s + '06'; // codigo de registro
                    s := s + '59'; // Codigo de operacion (56-Transferencia, 57-Cheque/Nomina/bancario, 58-Cheuq cliente, 59-Pagare)
                    s := s + Ajusta(REntorno.CifEmpresa, 'D', 10, ' '); // Codigo del Ordenante
                    s := s + Ajusta(xRecibosCOD_CLI_PRO.AsString, 'D', 12, ' '); // Referenica Beneficiario

                    s := s + '910'; // Numero de dato
                    s := s + Ajusta(FormatDateTime('ddmmyyyy', xRecibosVENCIMIENTO.AsDateTime), 'D', 36, ' '); // Fecha de vencimiento de pagare
                    s := s + Ajusta('', 'D', 7, ' '); // Libre
                    ts.Add(s);

                    xRecibos.Next;
                 end;

                 // Registro de Totales
                 Inc(RegistrosDeRemesa);
                 s := '';
                 s := s + '08'; // codigo de registro
                 s := s + '56'; // Codigo de operacion (Euros)
                 s := s + Ajusta(REntorno.CifEmpresa, 'D', 10, ' '); // Codigo del Ordenante
                 s := s + Ajusta('', 'D', 12, ' '); // Libre
                 s := s + Ajusta('', 'D', 3, ' '); // Libre
                 s := s + Ajusta('', 'D', 12, ' '); // Suma de importes
                 s := s + FormatFloat('00000000', BeneficiariosDeRemesa); // Cantidad de registros tipo 010
                 s := s + FormatFloat('0000000000', RegistrosDeRemesa); // Cantidad de registros
                 s := s + Ajusta('', 'D', 6, ' '); // Libre
                 s := s + Ajusta('', 'D', 7, ' '); // Libre
                 ts.Add(s);

                 // Guardo en el fichero
                 ts.SaveToFile(Archivo);
              end
           finally
              ts.Free;
           end;
        end;
     end;
  end;
end;

end.
