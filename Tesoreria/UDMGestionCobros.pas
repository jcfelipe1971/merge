unit UDMGestionCobros;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSetRO, FIBDatabase, UFIBModificados,
  FIBDataSet, HYFIBQuery, UFormGest, FIBTableDataSet, IdMessage,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, Dialogs, IdSMTP, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdExplicitTLSClientServerBase,
  IdSMTPBase;

type
  TDMGestionCobros = class(TDataModule)
     TLocal: THYTransaction;
     xClientes: TFIBDataSetRO;
     DSxClientes: TDataSource;
     DSRecibosCobroCliente: TDataSource;
     DSIncidencias: TDataSource;
     DSRecibosCobroProveedor: TDataSource;
     xClientesCLIENTE: TIntegerField;
     xClientesTERCERO: TIntegerField;
     xClientesNOMBRE_COMERCIAL: TFIBStringField;
     xClientesFORMA_PAGO: TFIBStringField;
     xClientesNIF: TFIBStringField;
     xClientesAGENTE: TIntegerField;
     xClientesDIR_COMPLETA_N: TFIBStringField;
     xClientesTELEFONO01: TFIBStringField;
     xClientesTELEFAX: TFIBStringField;
     xClientesEMAIL: TFIBStringField;
     xClientesPAIS_C2: TFIBStringField;
     xRecibosCobroProveedor: TFIBDataSet;
     xRecibosCobroProveedorID_CARTERA: TIntegerField;
     xRecibosCobroProveedorID_CARTERA_DETALLE: TIntegerField;
     xRecibosCobroProveedorREGISTRO: TIntegerField;
     xRecibosCobroProveedorFECHA_REGISTRO: TDateTimeField;
     xRecibosCobroProveedorVENCIMIENTO: TDateTimeField;
     xRecibosCobroProveedorCUENTA: TFIBStringField;
     xRecibosCobroProveedorDOC_NUMERO: TIntegerField;
     xRecibosCobroProveedorDOC_SERIE: TFIBStringField;
     xRecibosCobroProveedorDOC_TIPO: TFIBStringField;
     xRecibosCobroProveedorBASES: TFloatField;
     xRecibosCobroProveedorLIQUIDO: TFloatField;
     xRecibosCobroProveedorMONEDA: TFIBStringField;
     xRecibosCobroProveedorTIPO_EFECTO: TFIBStringField;
     xRecibosCobroProveedorREMESA: TIntegerField;
     xRecibosCobroProveedorCONFIRMING: TIntegerField;
     xRecibosCobroProveedorORD_PAGO: TIntegerField;
     xTotalRecibos: TFIBDataSetRO;
     DSxTotalRecibos: TDataSource;
     TUpdate: THYTransaction;
     xTotalRecibosBASE: TFloatField;
     xTotalRecibosLIQUIDO: TFloatField;
     xRecibosCobroCliente: TFIBTableSet;
     xRecibosCobroClienteEMPRESA: TIntegerField;
     xRecibosCobroClienteEJERCICIO: TIntegerField;
     xRecibosCobroClienteCANAL: TIntegerField;
     xRecibosCobroClienteID_CARTERA: TIntegerField;
     xRecibosCobroClienteID_CARTERA_DETALLE: TIntegerField;
     xRecibosCobroClienteREGISTRO: TIntegerField;
     xRecibosCobroClienteFECHA_REGISTRO: TDateTimeField;
     xRecibosCobroClienteVENCIMIENTO: TDateTimeField;
     xRecibosCobroClienteCUENTA: TFIBStringField;
     xRecibosCobroClienteDOC_NUMERO: TIntegerField;
     xRecibosCobroClienteDOC_SERIE: TFIBStringField;
     xRecibosCobroClienteDOC_TIPO: TFIBStringField;
     xRecibosCobroClienteBASES: TFloatField;
     xRecibosCobroClienteLIQUIDO: TFloatField;
     xRecibosCobroClienteMONEDA: TFIBStringField;
     xRecibosCobroClienteTIPO_EFECTO: TFIBStringField;
     xRecibosCobroClienteREMESA: TIntegerField;
     xRecibosCobroClienteCONFIRMING: TIntegerField;
     xRecibosCobroClienteORD_PAGO: TIntegerField;
     xRecibosCobroClienteRESPONSABLE: TIntegerField;
     xRecibosCobroClienteCARTA1: TIntegerField;
     xRecibosCobroClienteCARTA2: TIntegerField;
     xRecibosCobroClienteCARTA3: TIntegerField;
     xRecibosCobroClienteCARTA4: TIntegerField;
     xRecibosCobroClienteCARTA5: TIntegerField;
     xRecibosCobroClienteNOMBRE_R_SOCIAL: TFIBStringField;
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
     xRecibosCobroProveedorEMPRESA: TIntegerField;
     xRecibosCobroProveedorEJERCICIO: TIntegerField;
     xRecibosCobroProveedorCANAL: TIntegerField;
     SMTP: TIdSMTP;
     Mail: TIdMessage;
     xMailResponsablesEnviados: TFIBDataSetRO;
     DSMailResponsablesEnviados: TDataSource;
     xMailResponsablesEnviadosID_CARTERA_DETALLE: TIntegerField;
     xMailResponsablesEnviadosRESPONSABLE: TIntegerField;
     IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
     xCartas: TFIBTableSet;
     DSxCartas: TDataSource;
     xCartasID_CARTERA: TIntegerField;
     xCartasID_CARTERA_DETALLE: TIntegerField;
     xCartasEMPRESA: TIntegerField;
     xCartasEJERCICIO: TIntegerField;
     xCartasCANAL: TIntegerField;
     xCartasSIGNO: TFIBStringField;
     xCartasREGISTRO: TIntegerField;
     xCartasLINEA: TIntegerField;
     xCartasCTA_PAGO: TFIBStringField;
     xCartasDOC_TIPO: TFIBStringField;
     xCartasDOC_SERIE: TFIBStringField;
     xCartasDOC_NUMERO: TIntegerField;
     xCartasDOC_FECHA: TDateTimeField;
     xCartasFORMA_PAGO: TFIBStringField;
     xCartasID_DOC: TIntegerField;
     xCartasNOMBRE_R_SOCIAL: TFIBStringField;
     xCartasNOMBRE_COMERCIAL: TFIBStringField;
     xCartasVENCIMIENTO: TDateTimeField;
     xCartasLIQUIDO: TFloatField;
     xCartasTIPO_EFECTO: TFIBStringField;
     xCartasBANCO: TIntegerField;
     xCartasRESPONSABLE: TIntegerField;
     xCartasCARTA1: TIntegerField;
     xCartasCARTA2: TIntegerField;
     xCartasCARTA3: TIntegerField;
     xCartasCARTA4: TIntegerField;
     xCartasCARTA5: TIntegerField;
     xCartasOBSERVACIONES: TFIBStringField;
     xCartasLISTADO: TIntegerField;
     xCartasFECHA_REGISTRO: TDateTimeField;
     xCartasCUENTA: TFIBStringField;
     xCartasCOD_CLI_PRO: TIntegerField;
     xCartasAGENTE: TIntegerField;
     xCartasTERCERO: TIntegerField;
     xCartasNIF: TFIBStringField;
     xCartasTELEFONO01: TFIBStringField;
     xCartasTELEFONO02: TFIBStringField;
     xCartasTELEFAX: TFIBStringField;
     xCartasEMAIL: TFIBStringField;
     xCartasORIGEN_IMPAGADO: TIntegerField;
     xCartasTEXTO: TFIBStringField;
     xCartasVISIBLE: TIntegerField;
     xCartasPAGADO: TIntegerField;
     xCartasREMESA: TIntegerField;
     xCartasCONFIRMING: TIntegerField;
     xCartasDOCUMENTO: TFIBStringField;
     xCartasORD_PAGO: TIntegerField;
     xCartasSU_DOCUMENTO: TFIBStringField;
     xCartasRECIBIDO: TIntegerField;
     xTotal: TFIBDataSetRO;
     DSxTotal: TDataSource;
     xTotalTOTAL: TFloatField;
     xCartasFOLIO: TFIBStringField;
     xCarteraDetalle: TFIBDataSetRO;
     DSxCarteraDetalle: TDataSource;
     xCarteraDetalleID_CARTERA: TIntegerField;
     xCarteraDetalleCUENTA: TFIBStringField;
     xCarteraDetalleTITULO: TFIBStringField;
     xCarteraDetalleVENCIMIENTO: TDateTimeField;
     xCarteraDetalleFECHA_PAGO: TDateTimeField;
     xCarteraDetalleDOC_FECHA: TDateTimeField;
     xCarteraDetalleDOC_TIPO: TFIBStringField;
     xCarteraDetalleDOC_SERIE: TFIBStringField;
     xCarteraDetalleDOC_NUMERO: TIntegerField;
     xCarteraDetallePAGADO: TIntegerField;
     xCarteraDetalleDOCUMENTO: TFIBStringField;
     xCarteraDetalleREMESA: TIntegerField;
     xCarteraDetalleFECHA_CIERRE: TDateTimeField;
     xCarteraDetalleID_CARTERA_AGRUP: TIntegerField;
     xCarteraDetalleAGRUPACION: TFIBStringField;
     xCarteraDetalleID_DOC: TIntegerField;
     xCarteraDetalleEJERCICIO: TIntegerField;
     xCarteraDetalleREGISTRO: TIntegerField;
     xCarteraDetalleLINEA: TIntegerField;
     xCarteraDetalleLIQUIDO: TFloatField;
     xTotalCarteraDetalle: TFIBDataSetRO;
     xTotalCarteraDetalleTOTAL: TFloatField;
     DSxTotalCarteraDetalle: TDataSource;
     xCarteraDetalleAGENTE: TIntegerField;
     xCarteraDetalleRUTA: TIntegerField;
     xPagados: TFIBDataSetRO;
     DSxPagados: TDataSource;
     xTotalPagados: TFIBDataSetRO;
     FloatField2: TFloatField;
     DSxTotalPagados: TDataSource;
     xPagadosID_CARTERA: TIntegerField;
     xPagadosEJERCICIO: TIntegerField;
     xPagadosREGISTRO: TIntegerField;
     xPagadosLINEA: TIntegerField;
     xPagadosCUENTA: TFIBStringField;
     xPagadosTITULO: TFIBStringField;
     xPagadosVENCIMIENTO: TDateTimeField;
     xPagadosFECHA_PAGO: TDateTimeField;
     xPagadosDOC_FECHA: TDateTimeField;
     xPagadosDOC_TIPO: TFIBStringField;
     xPagadosDOC_SERIE: TFIBStringField;
     xPagadosDOC_NUMERO: TIntegerField;
     xPagadosPAGADO: TIntegerField;
     xPagadosDOCUMENTO: TFIBStringField;
     xPagadosCONFIRMING: TIntegerField;
     xPagadosORD_PAGO: TIntegerField;
     xPagadosFECHA_CIERRE: TDateTimeField;
     xPagadosID_DOC: TIntegerField;
     xPagadosLIQUIDO: TFloatField;
     xPagadosID_CARTERA_AGRUP: TIntegerField;
     xPagadosAGRUPACION: TFIBStringField;
     xCartasPAGO_AUTORIZADO: TIntegerField;
     xClientesNOMBRE_R_SOCIAL: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     procedure DameDatosUsuario(var Nombre: string; var Nombre_Correo: string; var EMail: string);
     procedure InicaializaMail;
     procedure DameDatosResponsable(Tercero: integer; var NombreDest: string; var EmailDest: string);
     function DameTerceroEmpleado(Empleado: integer): integer;
     procedure BorraTemporal;
  public
     { Public declarations }
     LocalMascaraN: string;
     function DameProveedorDeTercero(Tercero: integer): integer;
     procedure DameDatosCliente(Cliente: integer);
     procedure RefrescaDatosCliente;
     procedure RefrescaDatosCartas;
     procedure AbreIncidencia;
     procedure AbreRecibo(TipoTercero: string; Ejercicio, Registro: integer);
     procedure AbreCliProAcr(Tipo: string; CodCliPro: integer);
     procedure FiltraIncidencia(Abierto: boolean; TipoIncidencia: string);
     procedure CalculaTotalRecibos(Signo: string);
     procedure EnviaEmailAResponsable;
     procedure AbreDocumentoCompraVenta(Tipo: string; id_s: integer);
     procedure BusquedaCompleja(Signo: string);
     procedure FiltraCartera(Signo: string; Tercero: integer);
     procedure MarcarEnviada(Marca: integer);
     procedure FiltraCobrados(Desde_FechaPago, Hasta_FechaPago: TDateTime; PagosPendientes: boolean; CampoOrden: string; Agente, Ruta: integer);
     procedure FiltraPagados(Desde_FechaPago, Hasta_FechaPago: TDateTime; PagosPendientes: boolean; CampoOrden: string);
  end;

var
  DMGestionCobros : TDMGestionCobros;

implementation

uses UDMMain, UEntorno, UFMain, UFSendCorreo, UFBusca, UUtiles, DateUtils, UParam;

{$R *.dfm}

procedure TDMGestionCobros.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  LocalMascaraN := DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 1);
  AsignaDisplayFormat(xRecibosCobroCliente, LocalMascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xTotalRecibos, LocalMascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xIncidencias, LocalMascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xCartas, LocalMascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xTotal, LocalMascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xCarteraDetalle, LocalMascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xTotalCarteraDetalle, LocalMascaraN, MascaraI, ShortDateFormat);

  // Se necesita la hora de pago para Disforner
  xCarteraDetalleFECHA_PAGO.DisplayFormat := ShortDateFormat + ' hh:nn';

  if (LeeParametro('TESAUTO002') <> 'S') then
     xCartas.UpdateSQL.Text := '';
end;

procedure TDMGestionCobros.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

function TDMGestionCobros.DameProveedorDeTercero(Tercero: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST(1) PROVEEDOR FROM EMP_PROVEEDORES WHERE EMPRESA = ?EMPRESA AND TERCERO = ?TERCERO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['TERCERO'].AsInteger := Tercero;
        ExecQuery;
        Result := FieldByName['PROVEEDOR'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMGestionCobros.DameDatosCliente(Cliente: integer);
begin
  {Filtro Datos Cliente}
  with xClientes do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Open;
  end;

  {Filtro Recibos Cliente}
  with xRecibosCobroCliente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['COD_CLI_PRO'].AsInteger := Cliente;
     Open;
  end;

  with xRecibosCobroProveedor do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['COD_CLI_PRO'].AsInteger := DameProveedorDeTercero(xClientesTERCERO.AsInteger);
     Open;
  end;

  {Filtro las incidencias del Cliente}
  with xIncidencias do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['COD_CLI_PRO'].AsInteger := Cliente;
     Open;
  end;
end;

procedure TDMGestionCobros.RefrescaDatosCliente;
begin
  with xClientes do
  begin
     Close;
     Open;
  end;

  with xRecibosCobroCliente do
  begin
     Close;
     Open;
  end;

  with xRecibosCobroProveedor do
  begin
     Close;
     Open;
  end;

  with xIncidencias do
  begin
     Close;
     Open;
  end;
end;

procedure TDMGestionCobros.RefrescaDatosCartas;
begin
  if (xCartasID_CARTERA_DETALLE.AsInteger = 0) then
  begin
     xCartas.Close;
     xCartas.Open;
  end
  else
     Refrescar(xCartas, 'ID_CARTERA_DETALLE', xCartasID_CARTERA_DETALLE.AsInteger, False, True);
end;

procedure TDMGestionCobros.AbreIncidencia;
begin
  FMain.MuestraIncidencia(xClientesCliente.AsInteger, xIncidenciasIncidencia.AsInteger, 0 {clientes});
end;

procedure TDMGestionCobros.AbreRecibo(TipoTercero: string; Ejercicio, Registro: integer);
begin
  FMain.MuestraCartera(Ejercicio, REntorno.Canal, TipoTercero[1], Registro);
end;

procedure TDMGestionCobros.AbreCliProAcr(Tipo: string; CodCliPro: integer);
begin
  if ((Tipo = 'FAC') or (Tipo = 'AGC') or (Tipo = 'NRC') or (Tipo = 'NRC')) then
     FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(CodCliPro))
  else
  if ((Tipo = 'FAP') or (Tipo = 'AGP') or (Tipo = 'NRP') or (Tipo = 'NRP')) then
     FMain.EjecutaAccion(FMain.AProveedores, 'PROVEEDOR = ' + IntToStr(CodCliPro))
  else
     FMain.EjecutaAccion(FMain.AAcreedores, 'ACREEDOR = ' + IntToStr(CodCliPro));
end;


procedure TDMGestionCobros.FiltraCobrados(Desde_FechaPago, Hasta_FechaPago: TDateTime; PagosPendientes: boolean; CampoOrden: string; Agente, Ruta: integer);
begin
  Desde_FechaPago := RecodeTime(Desde_FechaPago, 0, 0, 0, 0);
  Hasta_FechaPago := RecodeTime(Hasta_FechaPago, 0, 0, 0, 0) + 1;

  xTotalCarteraDetalle.Close;

  with xCarteraDetalle do
  begin
     Close;

     with SelectSQL do
     begin
        Clear;
        Add(' -- Recibos no agrupados, pagados, no remesados ');
        Add(' select c.id_cartera, c.ejercicio, c.registro, d.linea, c.cuenta, cc.titulo, d.vencimiento, a.fecha fecha_pago, ');
        Add('        c.doc_fecha, c.doc_tipo, c.doc_serie, c.doc_numero, d.pagado, d.documento, d.remesa, d.fecha_cierre, c.id_doc, d.liquido ');
        Add('        -- ');
        Add('        , cast(0 as integer) id_cartera_agrup, cast('''' as varchar(100)) agrupacion, ');
        Add('        case ');
        Add('          when (f.agente is null) then ');
        Add('              cl.agente  ');
        Add('          else f.agente ');
        Add('        end as agente, ');
        Add('        cl.ruta as ruta ');
        Add(' from emp_cartera c ');
        Add(' left join emp_cartera_detalle d on c.id_cartera = d.id_cartera ');
        Add(' left join emp_cartera_documento x on d.id_cartera_detalle = x.id_cartera_detalle ');
        Add(' left join con_cuentas cc on c.empresa = cc.empresa and c.ejercicio = cc.ejercicio and c.canal = cc.canal and c.cuenta = cc.cuenta ');
        Add(' left join con_cuentas_asientos a on c.empresa = a.empresa and c.canal = a.canal and d.ric = a.ric and a.ejercicio = (select ejercicio ');
        Add('                                                                                                                      from e_pronostica_ejercicio(c.empresa, d.fecha_cierre)) ');
        Add(' left join ges_cabeceras_s f on c.id_doc = f.id_s ');
        Add(' left join emp_clientes cl on c.empresa = cl.empresa and c.cod_cli_pro = cl.cliente ');
        Add(' where ');
        Add(' c.empresa = :empresa and ');
        Add(' c.ejercicio = :ejercicio and ');
        Add(' c.canal = :canal and ');
        Add(' c.signo = ''C'' and ');
        Add(' c.doc_tipo in (''AFC'', ''FAC'', ''NRC'') and ');
        Add(' x.id_cartera_detalle is null and ');
        Add(' d.id_cartera_detalle is not null and ');
        Add(' d.documento = '''' and ');
        Add(' d.remesa <= 0 and ');
        Add(' d.pagado = 1 and ');
        Add(' d.visible = 1 ');

        if (PagosPendientes) then
           Add(' and ((a.fecha between :d_fecha_pago and :h_fecha_pago) or (a.fecha is null)) ')
        else
           Add(' and (a.fecha between :d_fecha_pago and :h_fecha_pago) ');

        if (Agente <> 0) then
           Add(' and ((f.agente = :agente) or (cl.agente = :agente and f.agente is null)) ');

        if (Ruta <> 0) then
           Add(' and cl.ruta = :ruta ');

        Add(' -- and c.cuenta = ''430002603'' ');
        Add('  ');
        Add(' union ');
        Add('  ');
        Add(' -- Recibos no agrupados, pagados, remesados ');
        Add(' select c.id_cartera, c.ejercicio, c.registro, d.linea, c.cuenta, cc.titulo, d.vencimiento, a.fecha fecha_pago, ');
        Add('        c.doc_fecha, c.doc_tipo, c.doc_serie, c.doc_numero, d.pagado, d.documento, d.remesa, d.fecha_cierre, c.id_doc, d.liquido ');
        Add('        -- ');
        Add('        , cast(0 as integer) id_cartera_agrup, cast('''' as varchar(100)) agrupacion, ');
        Add('        case ');
        Add('          when (f.agente is null) then ');
        Add('              cl.agente  ');
        Add('          else f.agente ');
        Add('        end as agente, ');
        Add('        cl.ruta  as ruta ');
        Add(' from emp_cartera c ');
        Add(' left join emp_cartera_detalle d on c.id_cartera = d.id_cartera ');
        Add(' left join emp_cartera_documento x on d.id_cartera_detalle = x.id_cartera_detalle ');
        Add(' left join con_cuentas cc on c.empresa = cc.empresa and c.ejercicio = cc.ejercicio and c.canal = cc.canal and c.cuenta = cc.cuenta ');
        Add(' join emp_cartera_remesas r on d.empresa = r.empresa and d.ejercicio_remesa = r.ejercicio and d.canal = r.canal and d.remesa = r.remesa ');
        Add(' left join con_cuentas_asientos a on r.empresa = a.empresa and r.canal = a.canal and r.ric_abono = a.ric and d.ejercicio_abono = a.ejercicio ');
        Add(' left join ges_cabeceras_s f on c.id_doc = f.id_s ');
        Add(' left join emp_clientes cl on c.empresa = cl.empresa and c.cod_cli_pro = cl.cliente ');
        Add(' where ');
        Add(' c.empresa = :empresa and ');
        Add(' c.ejercicio = :ejercicio and ');
        Add(' c.canal = :canal and ');
        Add(' c.signo = ''C'' and ');
        Add(' c.doc_tipo in (''AFC'', ''FAC'', ''NRC'') and ');
        Add(' x.id_cartera_detalle is null and ');
        Add(' d.id_cartera_detalle is not null and ');
        Add(' d.documento = '''' and ');
        Add(' d.remesa > 0 and ');
        Add(' d.visible = 1 ');

        if (PagosPendientes) then
           Add(' and ((a.fecha between :d_fecha_pago and :h_fecha_pago) or (a.fecha is null)) ')
        else
           Add(' and (a.fecha between :d_fecha_pago and :h_fecha_pago) ');

        if (Agente <> 0) then
           Add(' and ((f.agente = :agente) or (cl.agente = :agente and f.agente is null)) ');

        if (Ruta <> 0) then
           Add(' and cl.ruta = :ruta ');

        Add(' -- and c.cuenta = ''430002603'' ');
        Add(' -- ');
        Add('  ');
        Add(' union ');
        Add('  ');
        Add(' -- Recibos agrupados, pagados, no remesados ');
        Add(' select c.id_cartera, c.ejercicio, c.registro, d.linea, c.cuenta, cc.titulo, d.vencimiento, a.fecha fecha_pago, ');
        Add('        c.doc_fecha, c.doc_tipo, c.doc_serie, c.doc_numero, d.pagado, d.documento, d.remesa, d.fecha_cierre, c.id_doc, d.liquido ');
        Add('        -- ');
        Add('        , x.id_cartera id_cartera_agrup, ');
        Add('        cast(''REG. '' || x.signo || ''-'' || x.ejercicio || ''-'' || x.registro as varchar(100)) agrupacion, ');
        Add('        case ');
        Add('          when (f.agente is null) then ');
        Add('              cl.agente  ');
        Add('          else f.agente ');
        Add('        end as agente, ');
        Add('        cl.ruta  as ruta ');
        Add(' from emp_cartera c ');
        Add(' left join emp_cartera_detalle d on c.id_cartera = d.id_cartera ');
        Add(' left join emp_cartera_documento x on d.id_cartera = x.id_cartera_rec ');
        Add(' left join emp_cartera cx on x.id_cartera = cx.id_cartera ');
        Add(' left join emp_cartera_detalle dx on cx.id_cartera = dx.id_cartera ');
        Add(' left join con_cuentas cc on cx.empresa = cc.empresa and cx.ejercicio = cc.ejercicio and cx.canal = cc.canal and cx.cuenta = cc.cuenta ');
        Add(' left join con_cuentas_asientos a on cx.empresa = a.empresa and cx.canal = a.canal and dx.ric = a.ric and a.ejercicio = (select ejercicio ');
        Add('                                                                                                                         from e_pronostica_ejercicio(cx.empresa, dx.fecha_cierre)) ');
        Add(' left join ges_cabeceras_s f on c.id_doc = f.id_s ');
        Add(' left join emp_clientes cl on c.empresa = cl.empresa and c.cod_cli_pro = cl.cliente ');
        Add(' where ');
        Add(' c.empresa = :empresa and ');
        Add(' c.ejercicio = :ejercicio and ');
        Add(' c.canal = :canal and ');
        Add(' c.signo = ''C'' and ');
        Add(' c.doc_tipo in (''AFC'', ''FAC'', ''NRC'') and ');
        Add(' x.id_cartera_detalle is not null and ');
        Add(' d.id_cartera_detalle is not null and ');
        Add(' dx.documento = '''' and ');
        Add(' dx.remesa <= 0 and ');
        Add(' dx.pagado = 1 and ');
        Add(' d.visible = 0 ');

        if (PagosPendientes) then
           Add(' and ((a.fecha between :d_fecha_pago and :h_fecha_pago) or (a.fecha is null)) ')
        else
           Add(' and (a.fecha between :d_fecha_pago and :h_fecha_pago) ');

        if (Agente <> 0) then
           Add(' and ((f.agente = :agente) or (cl.agente = :agente and f.agente is null)) ');

        if (Ruta <> 0) then
           Add(' and cl.ruta = :ruta ');

        Add(' --and c.cuenta = ''430000003'' ');
        Add('  ');
        Add(' union ');
        Add('  ');
        Add(' -- Recibos agrupados, pagados, remesados ');
        Add(' select c.id_cartera, c.ejercicio, c.registro, d.linea, c.cuenta, cc.titulo, d.vencimiento, a.fecha fecha_pago, ');
        Add('        c.doc_fecha, c.doc_tipo, c.doc_serie, c.doc_numero, d.pagado, d.documento, d.remesa, d.fecha_cierre, c.id_doc, d.liquido ');
        Add('        -- ');
        Add('        , x.id_cartera id_cartera_agrup, ');
        Add('        cast(''REG. '' || x.signo || ''-'' || x.ejercicio || ''-'' || x.registro as varchar(100)) agrupacion, ');
        Add('        case ');
        Add('          when (f.agente is null) then ');
        Add('              cl.agente  ');
        Add('          else f.agente ');
        Add('        end as agente, ');
        Add('        cl.ruta  as ruta ');
        Add(' from emp_cartera c ');
        Add(' left join emp_cartera_detalle d on c.id_cartera = d.id_cartera ');
        Add(' left join emp_cartera_documento x on d.id_cartera = x.id_cartera_rec ');
        Add(' left join emp_cartera cx on x.id_cartera = cx.id_cartera ');
        Add(' left join emp_cartera_detalle dx on cx.id_cartera = dx.id_cartera ');
        Add(' left join con_cuentas cc on cx.empresa = cc.empresa and cx.ejercicio = cc.ejercicio and cx.canal = cc.canal and cx.cuenta = cc.cuenta ');
        Add(' join emp_cartera_remesas r on dx.empresa = r.empresa and dx.ejercicio_remesa = r.ejercicio and dx.canal = r.canal and dx.remesa = r.remesa ');
        Add(' left join con_cuentas_asientos a on r.empresa = a.empresa and r.canal = a.canal and r.ric_abono = a.ric and dx.ejercicio_abono = a.ejercicio ');
        Add(' left join ges_cabeceras_s f on c.id_doc = f.id_s ');
        Add(' left join emp_clientes cl on c.empresa = cl.empresa and c.cod_cli_pro = cl.cliente ');
        Add(' where ');
        Add(' c.empresa = :empresa and ');
        Add(' c.ejercicio = :ejercicio and ');
        Add(' c.canal = :canal and ');
        Add(' c.signo = ''C'' and ');
        Add(' c.doc_tipo in (''AFC'', ''FAC'', ''NRC'') and ');
        Add(' x.id_cartera_detalle is not null and ');
        Add(' d.id_cartera_detalle is not null and ');
        Add(' dx.documento = '''' and ');
        Add(' dx.remesa > 0 and ');
        Add(' dx.pagado = 1 and ');
        Add(' d.visible = 0 ');

        if (PagosPendientes) then
           Add(' and ((a.fecha between :d_fecha_pago and :h_fecha_pago) or (a.fecha is null)) ')
        else
           Add(' and (a.fecha between :d_fecha_pago and :h_fecha_pago) ');

        if (Agente <> 0) then
           Add(' and ((f.agente = :agente) or (cl.agente = :agente and f.agente is null)) ');

        if (Ruta <> 0) then
           Add(' and cl.ruta = :ruta ');

        Add(' --and c.cuenta = ''430000003'' ');
     end;

     // Ultilizo mismo SQL para calcular totales
     xTotalCarteraDetalle.SelectSQL.Clear;
     xTotalCarteraDetalle.SelectSQL.Add(' select sum(liquido) as TOTAL from (');
     xTotalCarteraDetalle.SelectSQL.Add(xCarteraDetalle.SelectSQL.Text);
     xTotalCarteraDetalle.SelectSQL.Add(' )');

     if (CampoOrden = '') then
        SelectSQL.Add(' ORDER BY 8 ') // ORDER BY "FECHA_PAGO"
     else
     begin
        if (StrToIntDef(CampoOrden, 0) > 0) then
           SelectSQL.Add(' ORDER BY ' + CampoOrden)
        else
           SelectSQL.Add(' ORDER BY ' + IntToStr(ABS(StrToIntDef(CampoOrden, 0))) + ' DESC');
     end;

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['D_FECHA_PAGO'].AsDateTime := Desde_FechaPago;
     Params.ByName['H_FECHA_PAGO'].AsDateTime := Hasta_FechaPago;
     if (Agente <> 0) then
        Params.ByName['AGENTE'].AsInteger := Agente;
     if (Ruta <> 0) then
        Params.ByName['RUTA'].AsInteger := Ruta;
     Open;
  end;

  with xTotalCarteraDetalle do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['D_FECHA_PAGO'].AsDateTime := Desde_FechaPago;
     Params.ByName['H_FECHA_PAGO'].AsDateTime := Hasta_FechaPago;
     if (Agente <> 0) then
        Params.ByName['AGENTE'].AsInteger := Agente;
     if (Ruta <> 0) then
        Params.ByName['RUTA'].AsInteger := Ruta;
     Open;
  end;
end;

procedure TDMGestionCobros.FiltraPagados(Desde_FechaPago, Hasta_FechaPago: TDateTime; PagosPendientes: boolean; CampoOrden: string);
begin

  Desde_FechaPago := RecodeTime(Desde_FechaPago, 0, 0, 0, 0);
  Hasta_FechaPago := RecodeTime(Hasta_FechaPago, 0, 0, 0, 0) + 1;

  xTotalPagados.Close;

  with xPagados do
  begin
     Close;

     with SelectSQL do
     begin
        Clear;

        Add(' -- Recibos no agrupados, pagados, no confirming, no ord_pago ');
        Add(' select c.id_cartera, c.ejercicio, c.registro, d.linea, c.cuenta, cc.titulo, d.vencimiento, a.fecha fecha_pago, ');
        Add(' c.doc_fecha, c.doc_tipo, c.doc_serie, c.doc_numero, d.pagado, d.documento, d.confirming, d.ord_pago, ');
        Add(' d.fecha_cierre, c.id_doc, d.liquido ');
        Add(' --  ');
        Add(' , cast(0 as integer) id_cartera_agrup, cast('''' as varchar(100)) agrupacion ');
        Add(' from emp_cartera c ');
        Add(' left join emp_cartera_detalle d on c.id_cartera = d.id_cartera ');
        Add(' left join emp_cartera_documento x on d.id_cartera_detalle = x.id_cartera_detalle ');
        Add(' left join con_cuentas cc on c.empresa = cc.empresa and c.ejercicio = cc.ejercicio and c.canal = cc.canal and c.cuenta = cc.cuenta ');
        Add(' left join con_cuentas_asientos a on c.empresa = a.empresa and c.canal = a.canal and d.ric = a.ric and a.ejercicio = (select ejercicio ');
        Add('                                                                                                                      from e_pronostica_ejercicio(c.empresa, d.fecha_cierre)) ');
        Add(' where ');
        Add(' c.empresa = :EMPRESA and  ');
        Add(' c.ejercicio = :EJERCICIO and  ');
        Add(' c.canal = :CANAL and   ');
        Add(' c.signo = ''P'' and  ');
        Add(' c.doc_tipo in (''AFA'', ''AFP'', ''FCR'', ''FAP'', ''NRA'', ''NRP'' ) and  ');
        Add(' x.id_cartera_detalle is null and ');
        Add(' d.id_cartera_detalle is not null and ');
        Add(' d.confirming = 0 and ');
        Add(' d.ord_pago = 0 and ');
        Add(' d.pagado = 1 and ');
        Add(' d.visible = 1  ');
        Add(' -- and c.cuenta = ''400000132'' ');

        if (PagosPendientes) then
           Add(' and ((a.fecha between :d_fecha_pago and :h_fecha_pago) or (a.fecha is null)) ')
        else
           Add(' and (a.fecha between :d_fecha_pago and :h_fecha_pago) ');

        Add(' union ');

        Add(' -- Recibos no agrupados, pagados, confirming, no ord_pago ');
        Add(' select c.id_cartera, c.ejercicio, c.registro, d.linea, c.cuenta, cc.titulo, d.vencimiento, a.fecha fecha_pago, ');
        Add(' c.doc_fecha, c.doc_tipo, c.doc_serie, c.doc_numero, d.pagado, d.documento, d.confirming, d.ord_pago, ');
        Add(' d.fecha_cierre, c.id_doc, d.liquido ');
        Add(' --  ');
        Add(' , cast(0 as integer) id_cartera_agrup, cast('''' as varchar(100)) agrupacion ');
        Add(' from emp_cartera c ');
        Add(' left join emp_cartera_detalle d on c.id_cartera = d.id_cartera  ');
        Add(' left join emp_cartera_documento x on d.id_cartera_detalle = x.id_cartera_detalle ');
        Add(' left join con_cuentas cc on c.empresa = cc.empresa and c.ejercicio = cc.ejercicio and c.canal = cc.canal and c.cuenta = cc.cuenta ');
        Add(' left join emp_cartera_confirming co on d.empresa = co.empresa and d.ejercicio_confirming = co.ejercicio and d.canal = c.canal and d.signo = co.signo and d.confirming = co.num_confirming  ');
        Add(' left join emp_cartera_conf_descontado des on d.id_cartera_detalle = des.id_cartera_detalle ');
        Add(' left join con_cuentas_asientos a on des.empresa = a.empresa and des.canal = a.canal and des.ric_descuento = a.ric and a.ejercicio = des.ejercicio_ric_descuento ');
        Add(' where  ');
        Add(' c.empresa = :EMPRESA and  ');
        Add(' c.ejercicio = :EJERCICIO and  ');
        Add(' c.canal = :CANAL and   ');
        Add(' c.signo = ''P'' and ');
        Add(' c.doc_tipo in (''AFA'', ''AFP'', ''FCR'', ''FAP'', ''NRA'', ''NRP'') and  ');
        Add(' x.id_cartera_detalle is null and  ');
        Add(' d.id_cartera_detalle is not null and  ');
        Add(' d.confirming > 0 and ');
        Add(' d.ord_pago = 0 and ');
        Add(' d.pagado = 1 and  ');
        Add(' d.visible = 1 ');
        Add(' -- and c.cuenta = ''400000132'' ');

        if (PagosPendientes) then
           Add(' and ((a.fecha between :d_fecha_pago and :h_fecha_pago) or (a.fecha is null)) ')
        else
           Add(' and (a.fecha between :d_fecha_pago and :h_fecha_pago) ');

        Add(' union ');
        Add(' -- Recibos no agrupados, pagados, no confirming, ord_pago ');
        Add(' select c.id_cartera, c.ejercicio, c.registro, d.linea, c.cuenta, cc.titulo, d.vencimiento, a.fecha fecha_pago, ');
        Add(' c.doc_fecha, c.doc_tipo, c.doc_serie, c.doc_numero, d.pagado, d.documento, d.confirming, d.ord_pago, ');
        Add(' d.fecha_cierre, c.id_doc, d.liquido ');
        Add(' -- ');
        Add(' , cast(0 as integer) id_cartera_agrup, cast('''' as varchar(100)) agrupacion ');
        Add(' from emp_cartera c ');
        Add(' left join emp_cartera_detalle d on c.id_cartera = d.id_cartera ');
        Add(' left join emp_cartera_documento x on d.id_cartera_detalle = x.id_cartera_detalle ');
        Add(' left join con_cuentas cc on c.empresa = cc.empresa and c.ejercicio = cc.ejercicio and c.canal = cc.canal and c.cuenta = cc.cuenta ');
        Add(' left join emp_cartera_ord_pago o on d.empresa = o.empresa and d.ejercicio_ord_pago = o.ejercicio and d.canal = c.canal and d.signo = o.signo and d.ord_pago = o.num_orden ');
        Add(' left join con_cuentas_asientos a on o.empresa = a.empresa and o.canal = a.canal and o.ric = a.ric and a.ejercicio = o.ejercicio ');
        Add(' where  ');
        Add(' c.empresa = :EMPRESA and  ');
        Add(' c.ejercicio = :EJERCICIO and  ');
        Add(' c.canal = :CANAL and   ');
        Add(' c.signo = ''P'' and  ');
        Add(' c.doc_tipo in (''AFA'', ''AFP'', ''FCR'', ''FAP'', ''NRA'', ''NRP'') and ');
        Add(' x.id_cartera_detalle is null and  ');
        Add(' d.id_cartera_detalle is not null and  ');
        Add(' d.confirming = 0 and ');
        Add(' d.ord_pago > 0 and  ');
        Add(' d.pagado = 1 and  ');
        Add(' d.visible = 1  ');
        Add(' -- and c.cuenta = ''400000132'' ');

        if (PagosPendientes) then
           Add(' and ((a.fecha between :d_fecha_pago and :h_fecha_pago) or (a.fecha is null)) ')
        else
           Add(' and (a.fecha between :d_fecha_pago and :h_fecha_pago) ');

        Add(' union ');
        Add(' -- Recibos agrupados, pagados, no confirming, no ord_pago ');
        Add(' select c.id_cartera, c.ejercicio, c.registro, d.linea, c.cuenta, cc.titulo, d.vencimiento, a.fecha fecha_pago, ');
        Add(' c.doc_fecha, c.doc_tipo, c.doc_serie, c.doc_numero, d.pagado, d.documento, d.confirming, d.ord_pago, ');
        Add(' d.fecha_cierre, c.id_doc, d.liquido ');
        Add('  -- ');
        Add('  , x.id_cartera id_cartera_agrup, ');
        Add('  cast(''REG. '' || x.signo || ''-'' || x.ejercicio || ''-'' || x.registro as varchar(100)) agrupacion ');
        Add(' from emp_cartera c ');
        Add(' left join emp_cartera_detalle d on c.id_cartera = d.id_cartera  ');
        Add(' left join emp_cartera_documento x on d.id_cartera_detalle = x.id_cartera_detalle  ');
        Add(' left join emp_cartera cx on x.id_cartera = cx.id_cartera ');
        Add(' left join emp_cartera_detalle dx on cx.id_cartera = dx.id_cartera ');
        Add(' left join con_cuentas cc on cx.empresa = cc.empresa and cx.ejercicio = cc.ejercicio and cx.canal = cc.canal and cx.cuenta = cc.cuenta ');
        Add(' left join con_cuentas_asientos a on cx.empresa = a.empresa and cx.canal = a.canal and dx.ric = a.ric and a.ejercicio = (select ejercicio  ');
        Add('                                                                                                                         from e_pronostica_ejercicio(cx.empresa, dx.fecha_cierre)) ');
        Add(' where ');
        Add(' c.empresa = :EMPRESA and  ');
        Add(' c.ejercicio = :EJERCICIO and  ');
        Add(' c.canal = :CANAL and   ');
        Add(' c.signo = ''P'' and  ');
        Add(' c.doc_tipo in (''AFA'', ''AFP'', ''FCR'', ''FAP'', ''NRA'', ''NRP'') and  ');
        Add(' x.id_cartera_detalle is not null and ');
        Add(' d.id_cartera_detalle is not null and  ');
        Add(' dx.confirming = 0 and ');
        Add(' dx.ord_pago = 0 and  ');
        Add(' dx.pagado = 1 and  ');
        Add(' d.visible = 0   ');
        Add(' -- and c.cuenta = ''400000017'' ');

        if (PagosPendientes) then
           Add(' and ((a.fecha between :d_fecha_pago and :h_fecha_pago) or (a.fecha is null)) ')
        else
           Add(' and (a.fecha between :d_fecha_pago and :h_fecha_pago) ');

        Add(' union ');
        Add(' -- Recibos agrupados, pagados, confirming, no ord_pago ');
        Add(' select c.id_cartera, c.ejercicio, c.registro, d.linea, c.cuenta, cc.titulo, d.vencimiento, a.fecha fecha_pago, ');
        Add(' c.doc_fecha, c.doc_tipo, c.doc_serie, c.doc_numero, d.pagado, d.documento, d.confirming, d.ord_pago, ');
        Add(' d.fecha_cierre, c.id_doc, d.liquido ');
        Add(' --  ');
        Add(' , x.id_cartera id_cartera_agrup, ');
        Add(' cast(''REG. '' || x.signo || ''-'' || x.ejercicio || ''-'' || x.registro as varchar(100)) agrupacion ');
        Add(' from emp_cartera c ');
        Add(' left join emp_cartera_detalle d on c.id_cartera = d.id_cartera ');
        Add(' left join emp_cartera_documento x on d.id_cartera_detalle = x.id_cartera_detalle  ');
        Add(' left join emp_cartera cx on x.id_cartera = cx.id_cartera ');
        Add(' left join emp_cartera_detalle dx on cx.id_cartera = dx.id_cartera ');
        Add(' left join con_cuentas cc on cx.empresa = cc.empresa and cx.ejercicio = cc.ejercicio and cx.canal = cc.canal and cx.cuenta = cc.cuenta ');
        Add(' left join emp_cartera_confirming co on dx.empresa = co.empresa and dx.ejercicio_confirming = co.ejercicio and dx.canal = c.canal and dx.signo = co.signo and dx.confirming = co.num_confirming  ');
        Add(' left join emp_cartera_conf_descontado des on dx.id_cartera_detalle = des.id_cartera_detalle ');
        Add(' left join con_cuentas_asientos a on des.empresa = a.empresa and des.canal = a.canal and des.ric_descuento = a.ric and a.ejercicio = des.ejercicio_ric_descuento ');
        Add(' where ');
        Add(' c.empresa = :EMPRESA and  ');
        Add(' c.ejercicio = :EJERCICIO and  ');
        Add(' c.canal = :CANAL and   ');
        Add(' c.signo = ''P'' and ');
        Add(' c.doc_tipo in (''AFA'', ''AFP'', ''FCR'', ''FAP'', ''NRA'', ''NRP'') and ');
        Add(' x.id_cartera_detalle is not null and ');
        Add(' d.id_cartera_detalle is not null and  ');
        Add(' dx.confirming > 0 and ');
        Add(' dx.ord_pago = 0 and ');
        Add(' dx.pagado = 1 and ');
        Add(' d.visible = 0 ');
        Add(' -- and c.cuenta = ''400000017'' ');

        if (PagosPendientes) then
           Add(' and ((a.fecha between :d_fecha_pago and :h_fecha_pago) or (a.fecha is null)) ')
        else
           Add(' and (a.fecha between :d_fecha_pago and :h_fecha_pago) ');

        Add(' union ');
        Add(' -- Recibos agrupados, pagados, no confirming, ord_pago ');
        Add(' select c.id_cartera, c.ejercicio, c.registro, d.linea, c.cuenta, cc.titulo, d.vencimiento, a.fecha fecha_pago, ');
        Add(' c.doc_fecha, c.doc_tipo, c.doc_serie, c.doc_numero, d.pagado, d.documento, d.confirming, d.ord_pago, ');
        Add(' d.fecha_cierre, c.id_doc, d.liquido ');
        Add(' --  ');
        Add(' , x.id_cartera id_cartera_agrup, ');
        Add(' cast(''REG. '' || x.signo || ''-'' || x.ejercicio || ''-'' || x.registro as varchar(100)) agrupacion  ');
        Add(' from emp_cartera c ');
        Add(' left join emp_cartera_detalle d on c.id_cartera = d.id_cartera ');
        Add(' left join emp_cartera_documento x on d.id_cartera_detalle = x.id_cartera_detalle ');
        Add(' left join emp_cartera cx on x.id_cartera = cx.id_cartera ');
        Add(' left join emp_cartera_detalle dx on cx.id_cartera = dx.id_cartera ');
        Add(' left join con_cuentas cc on cx.empresa = cc.empresa and cx.ejercicio = cc.ejercicio and cx.canal = cc.canal and cx.cuenta = cc.cuenta ');
        Add(' left join emp_cartera_ord_pago o on dx.empresa = o.empresa and dx.ejercicio_ord_pago = o.ejercicio and dx.canal = c.canal and dx.signo = o.signo and dx.ord_pago = o.num_orden ');
        Add(' left join con_cuentas_asientos a on o.empresa = a.empresa and o.canal = a.canal and o.ric = a.ric and a.ejercicio = o.ejercicio ');
        Add(' where ');
        Add(' c.empresa = :EMPRESA and  ');
        Add(' c.ejercicio = :EJERCICIO and  ');
        Add(' c.canal = :CANAL and   ');
        Add(' c.signo = ''P'' and ');
        Add(' c.doc_tipo in (''AFA'', ''AFP'', ''FCR'', ''FAP'', ''NRA'', ''NRP'') and  ');
        Add(' x.id_cartera_detalle is not null and  ');
        Add(' d.id_cartera_detalle is not null and  ');
        Add(' dx.confirming = 0 and ');
        Add(' dx.ord_pago > 0 and  ');
        Add(' dx.pagado = 1 and ');
        Add(' d.visible = 0 ');
        Add(' -- and c.cuenta = ''400000132'' ');

        if (PagosPendientes) then
           Add(' and ((a.fecha between :d_fecha_pago and :h_fecha_pago) or (a.fecha is null)) ')
        else
           Add(' and (a.fecha between :d_fecha_pago and :h_fecha_pago) ');
     end;

     // Ultilizo mismo SQL para calcular totales
     xTotalPagados.SelectSQL.Clear;
     xTotalPagados.SelectSQL.Add(' select sum(liquido) as TOTAL from (');
     xTotalPagados.SelectSQL.Add(xPagados.SelectSQL.Text);
     xTotalPagados.SelectSQL.Add(' )');

     if (CampoOrden = '') then
        SelectSQL.Add(' ORDER BY 8 ') // ORDER BY "FECHA_PAGO"
     else
     begin
        if (StrToIntDef(CampoOrden, 0) > 0) then
           SelectSQL.Add(' ORDER BY ' + CampoOrden)
        else
           SelectSQL.Add(' ORDER BY ' + IntToStr(ABS(StrToIntDef(CampoOrden, 0))) + ' DESC');
     end;

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['D_FECHA_PAGO'].AsDateTime := Desde_FechaPago;
     Params.ByName['H_FECHA_PAGO'].AsDateTime := Hasta_FechaPago;
     Open;
  end;

  with xTotalPagados do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['D_FECHA_PAGO'].AsDateTime := Desde_FechaPago;
     Params.ByName['H_FECHA_PAGO'].AsDateTime := Hasta_FechaPago;
     Open;
  end;
end;

procedure TDMGestionCobros.FiltraIncidencia(Abierto: boolean; TipoIncidencia: string);
begin
  TipoIncidencia := Trim(TipoIncidencia);

  // Filtro las incidencias del Cliente
  with xIncidencias do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add('SELECT * FROM VER_INCIDENCIAS ');
     SelectSQL.Add('WHERE ');
     SelectSQL.Add('EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add('COD_CLI_PRO = ?COD_CLI_PRO AND ');
     SelectSQL.Add('TIPO_TERCERO = ?TIPO_TERCERO ');
     if (Abierto) then
        SelectSQL.Add('AND FECHA_RESPUESTA IS NULL ');
     if (TipoIncidencia <> '') then
        SelectSQL.Add('AND TIPO_INCIDENCIA_KRI = ?TIPO_INCIDENCIA_KRI ');

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['COD_CLI_PRO'].AsInteger := xClientesCLIENTE.AsInteger;
     Params.ByName['TIPO_TERCERO'].AsString := 'CLI';
     if (TipoIncidencia <> '') then
        Params.ByName['TIPO_INCIDENCIA_KRI'].AsString := TipoIncidencia;
     Open;
  end;
end;

procedure TDMGestionCobros.CalculaTotalRecibos(Signo: string);
begin
  with xTotalRecibos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SIGNO'].AsString := Signo;
     if Signo = 'C' then
        Params.ByName['COD_CLI_PRO'].AsInteger := xClientesCLIENTE.AsInteger;
     if Signo = 'P' then
        Params.ByName['COD_CLI_PRO'].AsInteger := DameProveedorDeTercero(xClientesTERCERO.AsInteger);
     Open;
  end;
end;

procedure TDMGestionCobros.EnviaEmailAResponsable;
var
  Q : THYFIBQuery;
  DSRecibo, DSResponsable : TFIBDataSet;
  Nombre, Nombre_Correo, Email : string;
  NombreDest, EmailDest : string;
  Responsable : integer;
begin
  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(_('Enviando notificación'));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Preparando datos ...'));

     DSResponsable := TFIBDataSet.Create(nil);
     try
        with DSResponsable do
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
              SelectSQL.Add('SELECT DISTINCT RESPONSABLE FROM TMP_ENVIA_MAIL_RESP ORDER BY RESPONSABLE');
              Open;
              while not EOF do
              begin
                 // Enviamos un mail por Responsable
                 InicaializaMail;
                 with Mail do
                 begin
                    Clear;
                    UseNowForDate := True;
                    DameDatosUsuario(Nombre, Nombre_Correo, EMail);
                    Responsable := DameTerceroEmpleado(FieldByName('RESPONSABLE').AsInteger);
                    DameDatosResponsable(Responsable, NombreDest, EmailDest);
                    From.Address := Email;
                    From.Name := Nombre;
                    Organization := Nombre;
                    if EmailDest = '' then
                       raise Exception.Create(_('El destinatario no tiene e-mail...'));
                    Recipients.EMailAddresses := EmailDest;
                    Subject := _('Recibos asignados');
                    Body.Clear;
                    Body.Add(_('Ha sido asignado como responsable del cobro de los siguientes recibos:'));

                    // Buscamos Recibos relacionados a cada Responsable
                    DSRecibo := TFIBDataSet.Create(nil);
                    try
                       with DSRecibo do
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
                             SelectSQL.Add('SELECT ID_CARTERA_DETALLE FROM TMP_ENVIA_MAIL_RESP WHERE RESPONSABLE = :RESPONSABLE ORDER BY ID_CARTERA_DETALLE');
                             Params.ByName['RESPONSABLE'].AsInteger := DSResponsable.FieldByName('RESPONSABLE').AsInteger;
                             Open;
                             while not EOF do
                             begin
                                // Buscamos datos Recibo
                                Q := THYFIBQuery.Create(nil);
                                try
                                   with Q do
                                   begin
                                      Close;
                                      DataBase := DMMain.DataBase;
                                      SQL.Clear;
                                      SQL.Add(' SELECT EC.REGISTRO,EC.FECHA_REGISTRO,ECD.VENCIMIENTO,EC.CUENTA,EC.DOC_NUMERO, ');
                                      SQL.Add(' EC.DOC_SERIE, EC.DOC_TIPO, EC.BASES, EC.LIQUIDO, EC.MONEDA, ECD.RESPONSABLE, ');
                                      SQL.Add(' T.NOMBRE_R_SOCIAL ');
                                      SQL.Add(' FROM EMP_CARTERA EC ');
                                      SQL.Add(' JOIN EMP_CARTERA_DETALLE ECD ');
                                      SQL.Add(' ON (EC.ID_CARTERA = ECD.ID_CARTERA) ');
                                      SQL.Add(' LEFT JOIN OPE_EMPLEADO E ');
                                      SQL.Add(' ON (ECD.EMPRESA=E.EMPRESA AND ECD.RESPONSABLE=E.EMPLEADO) ');
                                      SQL.Add(' LEFT JOIN SYS_TERCEROS T ');
                                      SQL.Add(' ON (E.TERCERO=T.TERCERO) ');
                                      SQL.Add(' WHERE ');
                                      SQL.Add(' ECD.ID_CARTERA_DETALLE = :ID_CARTERA_DETALLE ');
                                      Params.ByName['ID_CARTERA_DETALLE'].AsInteger := DSRecibo.FieldByName('ID_CARTERA_DETALLE').AsInteger;
                                      ExecQuery;
                                      Body.Add('   ');
                                      Body.Add('   ');
                                      Body.Add('   ' + _('Recibo') + ': ' + FieldByName['REGISTRO'].AsString);
                                      Body.Add('   ' + _('Nombre') + ': ' + xClientesNOMBRE_COMERCIAL.AsString);
                                      Body.Add('   ' + _('Fecha de Registro') + ' : ' + FieldByName['FECHA_REGISTRO'].AsString);
                                      Body.Add('   ' + _('Vencimiento') + ': ' + FieldByName['VENCIMIENTO'].AsString);
                                      Body.Add('   ' + Format(_('Documento: %s / %d'), [FieldByName['DOC_SERIE'].AsString, FieldByName['DOC_NUMERO'].AsInteger]));
                                      Body.Add('   ' + Format(_('Liquido: %n %s'), [FieldByName['LIQUIDO'].AsFloat, FieldByName['MONEDA'].AsString]));
                                      Body.Add('   ' + _('Dirección') + ': ' + xClientesDIR_COMPLETA_N.AsString);
                                      Body.Add('   ' + _('Teléfono') + ': ' + xClientesTELEFONO01.AsString);
                                      Body.Add('   ' + _('Email') + ': ' + xClientesEMAIL.AsString);
                                      Body.Add('   ' + _('Telefax') + ': ' + xClientesTELEFAX.AsString);
                                      Body.Add('   ' + _('Pais') + ': ' + xClientesPAIS_C2.AsString);
                                      Body.Add('   ');
                                      Body.Add('   ');
                                      FreeHandle;
                                   end; // with Q
                                finally
                                   FreeAndNil(Q);
                                end;
                                Next;
                             end;
                             Close;
                             Transaction.Commit;
                          finally
                             Transaction.Free;
                          end;
                       end; // with DSRecibo
                    finally
                       FreeAndNil(DSRecibo);
                    end;

                    FSendCorreo.Texto(_('Enviando correo a:') + ' ' + NombreDest);
                    // Envio
                    try
                       SMTP.Connect;
                    except
                       SMTP.Disconnect;
                       raise Exception.Create(_('Se ha producido un error al intentar la conexión.'));
                    end;

                    SMTP.Send(Mail);

                    FSendCorreo.Texto(_('Enviando copia de correo'));
                    Recipients.EMailAddresses := From.Address;
                    {$IFDEF AdmXXI}
                    Subject := '[AdmXXI] - ' + Subject;
                    {$ENDIF}
                    {$IFNDEF AdmXXI}
                    Subject := '[DelfosERP] - ' + Subject;
                    {$ENDIF}
                    try
                       SMTP.Send(Mail);
                    except
                       SMTP.Disconnect;
                       ShowMessage(_('No ha sido posible enviar el mensaje de confirmación.'));
                    end;
                    SMTP.Disconnect;
                 end; // Mail
                 Next;
              end; // While
           finally;
           end;
           Transaction.Free;
        end; // with DSResponsable
     finally;
        FreeAndNil(DSResponsable);
     end;
     // Borramos contenido de Tabla Temporal
     BorraTemporal;
  finally
     FreeAndNil(FSendCorreo);
  end;
end;

procedure TDMGestionCobros.DameDatosResponsable(Tercero: integer; var NombreDest: string; var EmailDest: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT EMAIL, NOMBRE_COMERCIAL FROM VER_TERCEROS_EDICION WHERE TERCERO = ?TERCERO';
        Params.ByName['TERCERO'].AsInteger := Tercero;
        ExecQuery;
        NombreDest := FieldByName['NOMBRE_COMERCIAL'].AsString;
        EmailDest := FieldByName['EMAIL'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMGestionCobros.InicaializaMail;
begin
  with SMTP do
  begin
     IOHandler := nil;
     ManagedIOHandler := True;

     Host := REntorno.Smtp;
     Username := REntorno.UserID;
     Password := REntorno.Password;
     Port := REntorno.Port;
     begin
        IOHandler := IdSSLIOHandlerSocketOpenSSL;
        UseTLS := utUseExplicitTLS;
        IdSSLIOHandlerSocketOpenSSL.Host := SMTP.Host;
        IdSSLIOHandlerSocketOpenSSL.Port := SMTP.Port;
        IdSSLIOHandlerSocketOpenSSL.SSLOptions.Method := sslvTLSv1;
     end;

     AuthType := satNone;
     if REntorno.Identificacion = True then
     begin
        AuthType := satDefault;
     end;
  end;
  DMMain.LogFin('InitMailFin()');

  (* INDY Original Delhi 6
  with SMTP do
  begin
     Host := REntorno.Smtp;
     UserID := REntorno.UserID;
     Password := REntorno.Password;
     Port := REntorno.Port;
     if REntorno.Identificacion = True then
     begin
        AuthenticationType := atLogin;
        SocksInfo.Host := REntorno.Smtp;
        SocksInfo.Password := REntorno.Password;
        SocksInfo.Port := REntorno.Port;
        SocksInfo.UserID := REntorno.UserID;
     end;
  end;
*)
end;

procedure TDMGestionCobros.DameDatosUsuario(var Nombre: string; var Nombre_Correo: string; var EMail: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT NOMBRE,NOMBRE_CORREO, DIR_CORREO FROM SYS_USUARIOS WHERE USUARIO = ?USUARIO';
        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
        ExecQuery;
        Nombre := FieldByName['NOMBRE'].AsString;
        Nombre_Correo := FieldByName['NOMBRE_CORREO'].AsString;
        EMail := FieldByName['DIR_CORREO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMGestionCobros.DameTerceroEmpleado(Empleado: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TERCERO FROM OPE_EMPLEADO WHERE EMPRESA = ?EMPRESA AND EMPLEADO = ?EMPLEADO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EMPLEADO'].AsInteger := Empleado;
        ExecQuery;
        Result := FieldByName['TERCERO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMGestionCobros.BorraTemporal;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_ENVIA_MAIL_RESP';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMGestionCobros.AbreDocumentoCompraVenta(Tipo: string; id_s: integer);
begin
  if ((Tipo = 'FAC') or (Tipo = 'AGC') or (Tipo = 'NRC') or (Tipo = 'NRC')) then
     FMain.TraspasoDeDocumentosSalida(id_s)
  else
     FMain.TraspasoDeDocumentosEntrada(id_s);
end;

procedure TDMGestionCobros.BusquedaCompleja(Signo: string);
var
  Orden : string;
begin
  with xCartas do
  begin
     Orden := OrdenadoPor;

     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CARTERA_CARTAS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' CANAL = :CANAL AND ');
     SelectSQL.Add(' SIGNO = :SIGNO AND ');
     SelectSQL.Add(' VISIBLE = 1 AND ');
     SelectSQL.Add(' PAGADO = 0 AND ');
     SelectSQL.Add(' REMESA < 1 AND ');
     SelectSQL.Add(' CONFIRMING = 0 AND ');
     SelectSQL.Add(' DOCUMENTO = '''' AND ');
     SelectSQL.Add(' ORD_PAGO = 0  AND ');
     SelectSQL.Add(' RECIBIDO = 0 ');

     TFBusca.Create(Self).SeleccionaBusqueda(xCartas, '00000', False);

     SelectSQL.Add(' AND ( ');
     SelectSQL.Add('     EMPRESA = :EMPRESA AND ');
     SelectSQL.Add('     CANAL = :CANAL AND ');
     SelectSQL.Add('     SIGNO = :SIGNO AND ');
     SelectSQL.Add('     VISIBLE = 1 AND ');
     SelectSQL.Add('     PAGADO = 0 AND ');
     SelectSQL.Add('     REMESA < 1 AND ');
     SelectSQL.Add('     CONFIRMING = 0 AND ');
     SelectSQL.Add('     DOCUMENTO = '''' AND ');
     SelectSQL.Add('     ORD_PAGO = 0  AND ');
     SelectSQL.Add('     RECIBIDO = 0 ');
     SelectSQL.Add('     ) ');

     Ordenar(Orden);

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SIGNO'].AsString := Signo;
  end;

  RefrescaDatosCartas;
end;

procedure TDMGestionCobros.FiltraCartera(Signo: string; Tercero: integer);
begin
  with xCartas do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CARTERA_CARTAS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' CANAL = :CANAL AND ');
     SelectSQL.Add(' SIGNO = :SIGNO AND ');
     SelectSQL.Add(' VISIBLE = 1 AND ');
     SelectSQL.Add(' PAGADO = 0 AND ');
     SelectSQL.Add(' REMESA < 1 AND ');
     SelectSQL.Add(' CONFIRMING = 0 AND ');
     SelectSQL.Add(' DOCUMENTO = '''' AND ');
     SelectSQL.Add(' ORD_PAGO = 0  AND ');
     SelectSQL.Add(' RECIBIDO = 0 ');
     if (Tercero <> 0) then
        SelectSQL.Add(' AND TERCERO = :TERCERO ');
     SelectSQL.Add(' ORDER BY VENCIMIENTO ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SIGNO'].AsString := Signo;
     if (Tercero <> 0) then
        Params.ByName['TERCERO'].AsInteger := Tercero;
     Open;
  end;

  with xTotal do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT SUM(LIQUIDO) AS TOTAL FROM VER_CARTERA_CARTAS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' CANAL = :CANAL AND ');
     SelectSQL.Add(' SIGNO = :SIGNO AND ');
     SelectSQL.Add(' VISIBLE = 1 AND ');
     SelectSQL.Add(' PAGADO = 0 AND ');
     SelectSQL.Add(' REMESA < 1 AND ');
     SelectSQL.Add(' CONFIRMING = 0 AND ');
     SelectSQL.Add(' DOCUMENTO = '''' AND ');
     SelectSQL.Add(' ORD_PAGO = 0 AND ');
     SelectSQL.Add(' RECIBIDO = 0 ');
     if (Tercero <> 0) then
        SelectSQL.Add(' AND TERCERO = :TERCERO ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SIGNO'].AsString := Signo;
     if (Tercero <> 0) then
        Params.ByName['TERCERO'].AsInteger := Tercero;
     Open;
  end;
end;

procedure TDMGestionCobros.MarcarEnviada(Marca: integer);
begin
  /// Marca o desmarca la ultima carta como enviada

  xRecibosCobroCliente.Edit;
  if (Marca = 1) then
  begin
     if (xRecibosCobroClienteCARTA1.AsInteger = 0) then
        xRecibosCobroClienteCARTA1.AsInteger := 1
     else
     if (xRecibosCobroClienteCARTA2.AsInteger = 0) then
        xRecibosCobroClienteCARTA2.AsInteger := 1
     else
     if (xRecibosCobroClienteCARTA3.AsInteger = 0) then
        xRecibosCobroClienteCARTA3.AsInteger := 1
     else
     if (xRecibosCobroClienteCARTA4.AsInteger = 0) then
        xRecibosCobroClienteCARTA4.AsInteger := 1
     else
     if (xRecibosCobroClienteCARTA5.AsInteger = 0) then
        xRecibosCobroClienteCARTA5.AsInteger := 1;
  end
  else
  if (Marca = -1) then
  begin
     if (xRecibosCobroClienteCARTA5.AsInteger = 1) then
        xRecibosCobroClienteCARTA5.AsInteger := 0
     else
     if (xRecibosCobroClienteCARTA4.AsInteger = 1) then
        xRecibosCobroClienteCARTA4.AsInteger := 0
     else
     if (xRecibosCobroClienteCARTA3.AsInteger = 1) then
        xRecibosCobroClienteCARTA3.AsInteger := 0
     else
     if (xRecibosCobroClienteCARTA2.AsInteger = 1) then
        xRecibosCobroClienteCARTA2.AsInteger := 0
     else
     if (xRecibosCobroClienteCARTA1.AsInteger = 1) then
        xRecibosCobroClienteCARTA1.AsInteger := 0;
  end;
  xRecibosCobroCliente.Post;

  RefrescaDatosCartas;
end;

end.
