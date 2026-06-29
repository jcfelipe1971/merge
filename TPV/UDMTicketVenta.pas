unit UDMTicketVenta;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, Controls, frxClass, frxHYReport, FR_Class,
  Fr_HYReport, FR_DSet, FR_DBSet, frxDBSet, UHYReport;

type
  TDMTicketVenta = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMCabecera: TFIBTableSet;
     DSQMCabecera: TDataSource;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     xInfoActualizada: TFIBTableSet;
     DSxInfoActualizada: TDataSource;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraEJERCICIO: TIntegerField;
     QMCabeceraCANAL: TIntegerField;
     QMCabeceraSERIE: TFIBStringField;
     QMCabeceraTIPO: TFIBStringField;
     QMCabeceraRIT: TIntegerField;
     QMCabeceraRVT: TIntegerField;
     QMCabeceraSESION: TIntegerField;
     QMCabeceraCAJA: TIntegerField;
     QMCabeceraTURNO: TIntegerField;
     QMCabeceraUSUARIO: TIntegerField;
     QMCabeceraALMACEN: TFIBStringField;
     QMCabeceraMONEDA: TFIBStringField;
     QMCabeceraFECHA: TDateTimeField;
     QMCabeceraDESCRIPCION: TFIBStringField;
     QMCabeceraFORMA_PAGO: TFIBStringField;
     QMCabeceraNOTAS: TBlobField;
     QMCabeceraTERCERO: TIntegerField;
     QMCabeceraCLIENTE: TIntegerField;
     QMCabeceraESTADO: TIntegerField;
     QMCabeceraMODO_IVA: TIntegerField;
     QMCabeceraENTRADA: TIntegerField;
     QMCabeceraBRUTO: TFloatField;
     QMCabeceraI_DTO_LINEAS: TFloatField;
     QMCabeceraS_CUOTA_IVA: TFloatField;
     QMCabeceraS_CUOTA_RE: TFloatField;
     QMCabeceraDTO_CIAL: TFloatField;
     QMCabeceraI_DTO_CIAL: TFloatField;
     QMCabeceraDTO_PP: TFloatField;
     QMCabeceraI_DTO_PP: TFloatField;
     QMCabeceraS_BASES: TFloatField;
     QMCabeceraLINEAS: TIntegerField;
     QMCabeceraLIQUIDO: TFloatField;
     QMCabeceraB_DTO_LINEAS: TFloatField;
     QMCabeceraCONTROL_STOCK: TIntegerField;
     QMCabeceraA_DEVOLVER: TFloatField;
     QMCabeceraENTRADA_FAC: TIntegerField;
     QMCabeceraDEVOLUCION: TIntegerField;
     QMCabeceraTARIFA: TFIBStringField;
     QMCabeceraS_CUOTA_IVA_CANAL: TFloatField;
     QMCabeceraS_CUOTA_RE_CANAL: TFloatField;
     QMCabeceraS_BASES_CANAL: TFloatField;
     QMCabeceraCHG_MONEDA: TIntegerField;
     QMCabeceraA_DEVOLVER_CANAL: TFloatField;
     QMCabeceraLIQUIDO_CANAL: TFloatField;
     QMCabeceraACREEDOR: TIntegerField;
     QMCabeceraTIPO_GASTO: TIntegerField;
     QMCabeceraTIPO_RELACION: TFIBStringField;
     QMCabeceraCANAL_A_FACTURAR: TIntegerField;
     QMCabeceraAGENTE: TIntegerField;
     QMCabeceraFACTURACION: TIntegerField;
     QMCabeceraID_TICKET: TIntegerField;
     QMCabeceraID_TICKET_DEVOLUCION: TIntegerField;
     QMCabeceraID_FAMILIA: TIntegerField;
     QMCabeceraFECHA_HORA: TFIBStringField;
     QMCabeceraZ_PREFIJO_NCF: TFIBStringField;
     QMCabeceraZ_CONTADOR_NCF: TFIBStringField;
     QMCabeceraZ_TIPO_NCF: TIntegerField;
     xInfoActualizadaLIQUIDO: TFloatField;
     xInfoActualizadaS_BASES: TFloatField;
     xInfoActualizadaS_CUOTA_IVA: TFloatField;
     xInfoActualizadaUNIDADES: TFloatField;
     xTicketFormaPago: TFIBTableSet;
     DSxTicketFormaPago: TDataSource;
     xFamilia: TFIBDataSetRO;
     xFamiliaFAMILIA: TFIBStringField;
     xFamiliaTITULO: TFIBStringField;
     DSxFamilia: TDataSource;
     xArticulo: TFIBDataSetRO;
     DSArticulo: TDataSource;
     xFamiliaEMPRESA: TIntegerField;
     xFamiliaEJERCICIO: TIntegerField;
     xFamiliaCANAL: TIntegerField;
     xTicketFormaPagoEMPRESA: TIntegerField;
     xTicketFormaPagoEJERCICIO: TIntegerField;
     xTicketFormaPagoCANAL: TIntegerField;
     xTicketFormaPagoSERIE: TFIBStringField;
     xTicketFormaPagoTIPO: TFIBStringField;
     xTicketFormaPagoRIT: TIntegerField;
     xTicketFormaPagoFORMA_PAGO: TFIBStringField;
     xTicketFormaPagoTOTAL_COBRADO: TFloatField;
     xTicketFormaPagoTOTAL_ENTREGADO: TFloatField;
     xTicketFormaPagoTITULO: TFIBStringField;
     xInfoActualizadaSIGNO_MONEDA: TFIBStringField;
     xInfoActualizadaMONEDA: TFIBStringField;
     QMNIF: TFIBTableSet;
     DSQMNIF: TDataSource;
     QMNIFEMPRESA: TIntegerField;
     QMNIFEJERCICIO: TIntegerField;
     QMNIFCANAL: TIntegerField;
     QMNIFSERIE: TFIBStringField;
     QMNIFTIPO: TFIBStringField;
     QMNIFRIG: TIntegerField;
     QMNIFNOMBRE: TFIBStringField;
     QMNIFNIF: TFIBStringField;
     QMNIFDIRECCION: TFIBStringField;
     QMNIFC_POSTAL: TFIBStringField;
     QMNIFPROVINCIA: TFIBStringField;
     QMNIFID_S: TIntegerField;
     QMNIFPAIS: TFIBStringField;
     QMNIFLOCALIDAD: TFIBStringField;
     QMNIFTELEFONO01: TFIBStringField;
     QMNIFTELEFONO02: TFIBStringField;
     QMNIFTELEFAX: TFIBStringField;
     QMNIFEMAIL: TFIBStringField;
     QMNIFNOTAS: TBlobField;
     QMNIFCOLONIA: TFIBStringField;
     QMNIFTERCERO: TIntegerField;
     xInfoActualizadaA_DEVOLVER: TFloatField;
     xTickets: TFIBDataSetRO;
     DSTickets: TDataSource;
     xTicketsEMPRESA: TIntegerField;
     xTicketsEJERCICIO: TIntegerField;
     xTicketsCANAL: TIntegerField;
     xTicketsSERIE: TFIBStringField;
     xTicketsTIPO: TFIBStringField;
     xTicketsRIT: TIntegerField;
     xTicketsSESION: TIntegerField;
     xTicketsCAJA: TIntegerField;
     xTicketsTURNO: TIntegerField;
     xTicketsUSUARIO: TIntegerField;
     xTicketsFORMA_PAGO: TFIBStringField;
     xTicketsFECHA: TDateTimeField;
     xTicketsID_TICKET: TIntegerField;
     xTicketsLIQUIDO: TFloatField;
     QMTurno: TFIBTableSet;
     DSTurno: TDataSource;
     QMTurnoEMPRESA: TIntegerField;
     QMTurnoEJERCICIO: TIntegerField;
     QMTurnoCANAL: TIntegerField;
     QMTurnoSERIE: TFIBStringField;
     QMTurnoSESION: TIntegerField;
     QMTurnoCAJA: TIntegerField;
     QMTurnoTURNO: TIntegerField;
     QMTurnoABIERTO: TIntegerField;
     QMTurnoI_IVA: TFloatField;
     QMTurnoB_IMPONIBLE: TFloatField;
     QMTurnoTOTAL_TURNO: TFloatField;
     QMTurnoFECHA_INICIO: TDateTimeField;
     QMTurnoFECHA_FIN: TDateTimeField;
     QMTurnoUSUARIO_ABRE: TIntegerField;
     QMTurnoUSUARIO_CIERRA: TIntegerField;
     QMTurnoCAMBIO_ENTREGADO: TFloatField;
     QMTurnoDIFERENCIA: TFloatField;
     QMTurnoSALDO: TFloatField;
     xTurnoFP: TFIBDataSetRO;
     DSTurnoFP: TDataSource;
     xTurnoFPEMPRESA: TIntegerField;
     xTurnoFPEJERCICIO: TIntegerField;
     xTurnoFPCANAL: TIntegerField;
     xTurnoFPSERIE: TFIBStringField;
     xTurnoFPSESION: TIntegerField;
     xTurnoFPCAJA: TIntegerField;
     xTurnoFPTURNO: TIntegerField;
     xTurnoFPFORMA_PAGO: TFIBStringField;
     xTurnoFPTOTAL_COBRADO: TFloatField;
     xTurnoFPTITULO_FP: TFIBStringField;
     QMCabeceraSFV_AUTORIZACION: TFIBStringField;
     QMCabeceraSFV_CODIGO_CONTROL: TFIBStringField;
     QMCabeceraSFV_CODIGO_RESPUESTA_RAPIDA: TFIBStringField;
     xTicketsESTADO: TIntegerField;
     xTicketsTITULO_ESTADO: TFIBStringField;
     QMIngresosEgresos: TFIBTableSet;
     DSQMIngresosEgresos: TDataSource;
     QMIngresosEgresosEMPRESA: TIntegerField;
     QMIngresosEgresosEJERCICIO: TIntegerField;
     QMIngresosEgresosCANAL: TIntegerField;
     QMIngresosEgresosSERIE: TFIBStringField;
     QMIngresosEgresosSESION: TIntegerField;
     QMIngresosEgresosCAJA: TIntegerField;
     QMIngresosEgresosTURNO: TIntegerField;
     QMIngresosEgresosTIPO_MOVIMIENTO: TFIBStringField;
     QMIngresosEgresosIMPORTE: TFloatField;
     QMIngresosEgresosDESCRIPCION: TFIBStringField;
     QMIngresosEgresosNOTA: TBlobField;
     QMIngresosEgresosFECHA: TDateTimeField;
     QMIngresosEgresosENTRADA: TIntegerField;
     QMIngresosEgresosID: TIntegerField;
     QMIngresosEgresosDESC_TIPO_MOVIEMIENTO: TStringField;
     QMCabeceraSFV_NUM_DOSIFICACION: TIntegerField;
     frxDBQMIngresosEgresos: TfrxDBDataset;
     frDBQMIngresosEgresos: TfrDBDataSet;
     frIngresosEgresos: TfrHYReport;
     HYReport: THYReport;
     frxIngresosEgresos: TfrxHYReport;
     QMCabeceraVALIDO: TIntegerField;
     xInfoActualizadaESTADO: TIntegerField;
     xInfoActualizadaNUM_TICKET: TIntegerField;
     xSubfamilia: TFIBDataSetRO;
     DSxSubfamilia: TDataSource;
     xSubfamiliaSUBFAMILIA: TFIBStringField;
     xSubfamiliaTITULO: TFIBStringField;
     xSubfamiliaID_SUBFAMILIA: TIntegerField;
     xSubfamiliaEMPRESA: TIntegerField;
     xSubfamiliaEJERCICIO: TIntegerField;
     xSubfamiliaCANAL: TIntegerField;
     xSubfamiliaFAMILIA: TFIBStringField;
     xFamiliaID_FAMILIA: TIntegerField;
     xFamiliaID_IMAGEN: TIntegerField;
     xSubfamiliaID_IMAGEN: TIntegerField;
     xTicketsMOTIVO_ANULADO: TFIBStringField;
     xInfoActualizadaCLIENTE: TIntegerField;
     xInfoActualizadaNOMBRE_R_SOCIAL: TFIBStringField;
     xTicketsCLIENTE: TIntegerField;
     xTicketsNOMBRE_R_SOCIAL: TFIBStringField;
     xTicketsNOMBRE_COMERCIAL: TFIBStringField;
     QMNIFCARNET_APLICADOR: TFIBStringField;
     QMNIFNOMBRE_CONTACTO: TFIBStringField;
     QMNIFCOMO_NOS_CONOCIERON: TIntegerField;
     QMNIFTIPO_DOC_IDENT: TFIBStringField;
     QMNIFPAIS_DOC_IDENT: TFIBStringField;
     procedure QMCabeceraNewRecord(DataSet: TDataSet);
     procedure QMCabeceraBeforePost(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMDetalleAfterPost(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure xTicketFormaPagoNewRecord(DataSet: TDataSet);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure xFamiliaAfterOpen(DataSet: TDataSet);
     procedure xFamiliaBeforeClose(DataSet: TDataSet);
     procedure xInfoActualizadaLIQUIDOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraAfterScroll(DataSet: TDataSet);
     procedure QMNIFNewRecord(DataSet: TDataSet);
     procedure xFamiliaBeforeScroll(DataSet: TDataSet);
     procedure QMCabeceraAfterPost(DataSet: TDataSet);
     procedure QMIngresosEgresosNewRecord(DataSet: TDataSet);
     procedure QMIngresosEgresosBeforePost(DataSet: TDataSet);
     procedure QMIngresosEgresosCalcFields(DataSet: TDataSet);
     procedure frxIngresosEgresosBeforePrint(Sender: TfrxReportComponent);
     procedure frIngresosEgresosBeforePrint(Memo: TStringList; View: TfrView);
     procedure frIngresosEgresosGetValue(const ParName: string; var ParValue: variant);
     procedure frxIngresosEgresosGetValue(const VarName: string; var Value: variant);
     procedure xSubfamiliaAfterOpen(DataSet: TDataSet);
     procedure xSubfamiliaBeforeScroll(DataSet: TDataSet);
  private
     { Private declarations }
     Almacen: string;
     AcreedorDefecto: integer;
     CambioEntregado: double;
     TPVSincronizacion: boolean;
     param_TPVARTS001: string;
     procedure MascarasMoneda;
     procedure RefrescaTotales;
     function DameCarnetAplicadorTercero(Tercero: integer): string;
     procedure ActualizaDatosIniSincronizacion(NumeroDosificacion, Rit, Sesion: integer; ModoTrabajo: string);
     function PuedoInsertarFormaPago(Importe: double): boolean;
     procedure AsignaEmailTicket(Email: string; IdTicket: integer);
  public
     { Public declarations }
     ArticulosAMostrar: integer;
     FormaPagoTicket: string;
     SubfamiliasAMostrar: integer;
     SaltandoArticulos: integer;
     SaltandoSubfamilias: integer;
     LocalMascaraN, LocalMascaraL: string;
     procedure CheckSesionTurno;
     procedure SetTurno;
     procedure NuevoTicket;
     procedure InsertaLinea(Articulo: string);
     procedure IncrementaUnidades;
     procedure DecrementaUnidades;
     procedure Subir;
     procedure Bajar;
     procedure SubirFamilia;
     procedure BajarFamilia;
     procedure CambiaDatosCabecera(Cliente, Agente: integer; Descripcion: string; DescuentoComercial: double);
     procedure CambiaLinea(Articulo, Titulo: string; Unidades, Precio, Descuento: double; TipoIva: integer);
     procedure InsertaEntregas;
     procedure InsertaFormaPago(FormaPago: string; Importe: double);
     function CierraTicket(Imprimir, Recibo: boolean; Agente: integer; Email: string): boolean;
     procedure ImprimirTicket(Email: string; Rollo: boolean; Regalo: boolean = False);
     procedure BajaDetalle;
     procedure CreaTercero(NIF, NombreCliente, NombreComercial: string);
     procedure CreaCabeceraTicket;
     function EstadoDocumento: integer;
     procedure GrabaDatosCliente(Estado: integer);
     procedure AbreQMNif;
     function DameDatosClientes: boolean;
     procedure CierraQMNif;
     procedure AsignaTercero(Tercero, Id_Ticket: integer);
     procedure AsignaTerceroFitosanitario(Nombre, NIF, Direccion, CodigoPostal, Localidad, CarnetAplicador, Telefono: string; Tercero: integer = 0);
     procedure LimitaArticulos(Cantidad: integer);
     procedure LimitaSubfamilias(Cantidad: integer);
     procedure FiltraArticulos(Id_Subfamilia: integer);
     procedure FiltraSubfamilias;
     procedure SaltoArticulos(Direccion: integer; EsArticulo: boolean);
     procedure SeleccionaTicket(rit: integer; Ejercicio: integer = 0; Canal: integer = 0; Serie: string = '');
     procedure AnulaTicket(IdTicket: integer; Motivo: string; MoverSiguiente: boolean = True);
     procedure AbrirListaTickets;
     procedure AbrirDatosCierreTurno;
     function ExistenTicketsAbiertos: boolean;
     procedure AbrirDatosIngresosEgresos;
     procedure IngresoEgreso(TipoMovimiento: integer; Descripcion, Nota: string; Importe: double);
     function CierraTurno: integer;
     function AbreTurno: integer;
     function DameTotalEnEfectivo: double;
     function DameSaldoEntradasSalidas: double;
     procedure MostrarComprobanteIngresoEgreso(Modo: integer);
     function DameCarnetAplicador: string;
     function RequiereRegistroFitosanitario(ID_A: integer): boolean;
     function ExisteCabeceraNIF(ID_TICKET: integer): boolean;
     procedure CrearNuevoCodigoBarra(Barras: string);
     function DameDecuentoComercial(Cliente: integer): double;
     procedure DameTotalesCajaTurno(var CantidadTickets, Liquido, Promedio: double);
     function DameEmailTicket(ID_Ticket: integer): string;
     function DameCategoriaCliente(Cliente: integer): string;
     function DameClienteTercero(Tercero: integer): integer;
     procedure TicketAAlbaran;
     function ExisteFormaPagoRemesable: boolean;
     function FormaPagoTransferencia(Cliente: integer): string;
  end;

var
  DMTicketVenta : TDMTicketVenta;

implementation

uses
  UDMMain, HYFIBQuery, UEntorno, Dialogs, UDMLstTickets, UDMPrestashop, UFormGest, UUtiles, UFMSeleccion, fqbUtils, UFacturaElectronicaBO, IniFiles, UParam,
  UDMListados, UDMFacturarTickets, UDameDato;

{$R *.dfm}

procedure TDMTicketVenta.CheckSesionTurno;
begin
  /// Establece la Sesion, Turno en el Entorno-Caja.
  /// Establece Almacen, Agente de la Caja-Usuario

  // Pedir monto inicial de caja.
  if (LeeParametro('TPVTICC004', '') = 'N') then
     CambioEntregado := -1;

  // Obtenemos sesion abierta
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(SESION) FROM GES_TPV_SESIONES_CAJAS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' CAJA = :CAJA AND ');
        SQL.Add(' ABIERTA <> 0 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['CAJA'].AsInteger := REntorno.Caja;
        ExecQuery;
        REntorno.Sesion := FieldByName['MIN'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Si no existe una sesion abierta salimos
  if (REntorno.Sesion <= 0) then
  begin
     ShowMessage(_('No existe una sesion abierta'));
     Exit;
  end;

  // Obtenemos Turno Abierto
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT COALESCE(MIN(TURNO), 0) TURNO, SUM(CAMBIO_ENTREGADO) CAMBIO_ENTREGADO ');
        SQL.Add(' FROM GES_TPV_SESIONES_CAJAS_TURNO T ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' SESION = :SESION AND ');
        SQL.Add(' CAJA = :CAJA AND ');
        SQL.Add(' ABIERTO <> 0 ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['SESION'].AsInteger := REntorno.Sesion;
        Params.ByName['CAJA'].AsInteger := REntorno.Caja;
        ExecQuery;

        REntorno.Turno := FieldByName['TURNO'].AsInteger;
        if (CambioEntregado = 0) then
           CambioEntregado := FieldByName['CAMBIO_ENTREGADO'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Si no exisiste turno abierto, abrimos uno nuevo
  if (REntorno.Turno <= 0) then
  begin
     if ConfirmaMensaje(_('Desea crear un nuevo turno?')) then
     begin
        REntorno.Turno := AbreTurno;
        if (REntorno.Turno <= 0) then
           ShowMessage(_('No se ha podido abrir un nuevo turno'));
     end
     else
        Exit; // Salimos del TPV
  end;

  if (CambioEntregado = 0) then
  begin
     PideDato('DBL', CambioEntregado, 'Saldo Inicial');

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE GES_TPV_SESIONES_CAJAS_TURNO ');
           SQL.Add(' SET ');
           SQL.Add(' CAMBIO_ENTREGADO = ?CAMBIO_ENTREGADO ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SQL.Add(' CANAL = ?CANAL AND ');
           SQL.Add(' SERIE = ?SERIE AND ');
           SQL.Add(' SESION = ?SESION AND ');
           SQL.Add(' CAJA = ?CAJA AND ');
           SQL.Add(' TURNO =?TURNO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := REntorno.Serie;
           Params.ByName['CAJA'].AsInteger := REntorno.Caja;
           Params.ByName['SESION'].AsInteger := REntorno.Sesion;
           Params.ByName['TURNO'].AsInteger := REntorno.Turno;
           Params.ByName['CAMBIO_ENTREGADO'].AsFloat := CambioEntregado;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     CambioEntregado := -1;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ALMACEN, AGENTE, AGENTE_USUARIO FROM VER_CAJAS_USUARIOS_ACTIVAS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' CAJA = :CAJA AND ');
        SQL.Add(' USUARIO = :USUARIO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['CAJA'].AsInteger := REntorno.Caja;
        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
        ExecQuery;

        Almacen := FieldByName['ALMACEN'].AsString;

        if (FieldByName['AGENTE_USUARIO'].AsInteger > 0) then
           REntorno.Agente := FieldByName['AGENTE_USUARIO'].AsInteger
        else
           REntorno.Agente := FieldByName['AGENTE'].AsInteger;

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTicketVenta.NuevoTicket;
var
  Old_Sesion : integer;
  Old_Turno : integer;
begin
  // Verifico que la Sesion/Turno estén abiertos
  Old_Sesion := REntorno.Sesion;
  Old_Turno := REntorno.Turno;

  CheckSesionTurno;

  if (REntorno.Sesion <> Old_Sesion) or (REntorno.Turno <> Old_Turno) then
     ShowMessage('La Sesión o el Truno están inactivos')
  else
  begin
     with QMCabecera do
     begin
        if not Active then
           Open;
        Insert;
        Post;
     end;
  end;

  MascarasMoneda;
end;

procedure TDMTicketVenta.SetTurno;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := ' EXECUTE PROCEDURE G_TICKET_ABRE_TURNO (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :CAJA, :USUARIO, :FECHA, :TURNOOLD)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['CAJA'].AsInteger := REntorno.Caja;
        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['TURNOOLD'].AsInteger := REntorno.Turno;
        ExecQuery;

        FreeHandle;
     finally
        Free;
     end;
  end;

  CheckSesionTurno;
end;

procedure TDMTicketVenta.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  with QMCabecera do
  begin
     FieldByName('EMPRESA').AsInteger := REntorno.Empresa;
     FieldByName('EJERCICIO').AsInteger := REntorno.Ejercicio;
     FieldByName('CANAL').AsInteger := REntorno.Canal;
     FieldByName('SERIE').AsString := REntorno.Serie;
     FieldByName('TIPO').AsString := 'TIC';
     FieldByName('RIT').AsInteger := 0;

     FieldByName('SESION').AsInteger := REntorno.Sesion;
     FieldByName('CAJA').AsInteger := REntorno.Caja;
     FieldByName('TURNO').AsInteger := REntorno.Turno;

     FieldByName('FECHA').AsDateTime := REntorno.FechaTrab;
     FieldByName('ENTRADA').AsInteger := REntorno.Entrada;
     FieldByName('USUARIO').AsInteger := REntorno.Usuario;
     FieldByName('DTO_CIAL').AsFloat := 0;
     FieldByName('DTO_PP').AsFloat := 0;
     FieldByName('ENTRADA_FAC').AsInteger := 0;
     FieldByName('DEVOLUCION').AsInteger := 0;
     FieldByName('TARIFA').AsString := ''; // Se calcula en trigger;
     FieldByName('ACREEDOR').AsInteger := AcreedorDefecto;
     FieldByName('TIPO_GASTO').AsInteger := -1;
     FieldByName('ID_FAMILIA').AsInteger := 0;
     FieldByName('MONEDA').AsString := ''; // Se calcula en trigger;
     FieldByName('ALMACEN').AsString := Almacen; // También se calcula en trigger, pero no tiene en cuenta Caja-Usuario
     FieldByName('AGENTE').AsInteger := REntorno.Agente;
     FieldByName('FECHA_HORA').AsString := '00000000-000000'; // FormatDate('yyyymmdd"-000000"', REntorno.FechaTrab);

     // Si el pais es Bolivia obtenemos numero de autorizacion y para la factura
     // Replicar comportamiento en UDMFacturas
     FieldByName('SFV_AUTORIZACION').AsString := '';
     FieldByName('SFV_CODIGO_CONTROL').AsString := '';
     if (REntorno.Pais = 'BOL') then
     begin
        FieldByName('SFV_AUTORIZACION').AsString := DMMain.DameNumeroAutorizacion('E', REntorno.Serie, REntorno.FechaTrab);
        //Si existe un numero de autoizacion obtenemos el numero de docificacion
        if (FieldByName('SFV_AUTORIZACION').AsString = '') then
           raise Exception.Create(_('No existe un número de autorización válido'));
     end;
  end;
end;

procedure TDMTicketVenta.QMCabeceraBeforePost(DataSet: TDataSet);
var
  modo_trabajo, RutaSincronizacion : string;
  oIni : TIniFile;
begin
  // Si no tiene activo las sincronizacion del TPV obtenemos nuevo id
  if (not TPVSincronizacion) then
     DMMain.Contador_Gen(DataSet, 'ID_GES_CABECERAS_TICKET', 'ID_TICKET')
  else
  begin
     RutaSincronizacion := DMMain.DameRutaFicheroDeSincronizacion(QMCabeceraSERIE.AsString);

     // Si la estacion de trabajo es online obtenemos ini de sincronizacion de la estacion de trabajo remota local
     if (REntorno.MaquinaSincronizacion = 'online') then
     begin
        if (Trim(RutaSincronizacion) > '') then
        begin
           // Obtenemos el modo de trabajo (ON/OFF) del ini de sincronizacion
           oIni := TIniFile.Create(RutaSincronizacion + 'TPV-sincronizacion_' + QMCabeceraSERIE.AsString + '.ini' {REntorno.RutaFicheroValoresSinc});
           try
              modo_trabajo := oIni.ReadString('Datos', 'modo_trabajo', modo_trabajo);
           finally
              oIni.Free;
           end;
        end;

        if (modo_trabajo = 'ON') then
           DMMain.Contador_Gen(DataSet, 'ID_GES_CABECERAS_TICKET', 'ID_TICKET')
        else
        begin
           raise Exception.Create(_('Para continuar debe sincronizar la Información del TPV desde su estación de trabajo local'));
        end;
     end
     else
     if (REntorno.MaquinaSincronizacion = 'offline') then //Si la estacion de trabajo es offline obtenemos el fichero de sincronizacion en la maquina local
     begin
        oIni := TIniFile.Create(RutaSincronizacion + 'TPV-sincronizacion_' + QMCabeceraSERIE.AsString + '.ini' {REntorno.RutaFicheroValoresSinc});
        try
           modo_trabajo := oIni.ReadString('Datos', 'modo_trabajo', modo_trabajo);
        finally
           oIni.Free;
        end;

        if (modo_trabajo = 'OFF') then
           DMMain.Contador_Gen(DataSet, 'ID_GES_CABECERAS_TICKET', 'ID_TICKET')
        else
        begin
           raise Exception.Create(_('El modo de trabajo online esta activo'));
        end;
     end;

     {
     // Si la maquina es local y el modo de trabajo es OFF se crea nuevo ticket
     if ((REntorno.MaquinaSincronizacion = 'offline') and (modo_trabajo = 'OFF')) then
        DMMain.Contador_Gen(DataSet, 'ID_GES_CABECERAS_TICKET', 'ID_TICKET')
     else
     if ((modo_trabajo = 'ON') and (REntorno.MaquinaSincronizacion = 'online')) then
        // Si el modo de trabajo es ON la maquina Online esta en funcionamiento
        DMMain.Contador_Gen(DataSet, 'ID_GES_CABECERAS_TICKET', 'ID_TICKET')
     else
        raise Exception.Create(_('Para continuar debe sincronizar la Información del TPV desde su estación de trabajo local'));

     // Verificamos si la maquina es local y el modo de trabajo es ON
     if ((REntorno.MaquinaSincronizacion = 'offline') and (modo_trabajo = 'ON')) then
     begin
        raise Exception.Create(_('Para continuar debe cambiar a modo de trabajo OFF'));
        Exit;
     end;
     }
  end;
end;

procedure TDMTicketVenta.QMDetalleNewRecord(DataSet: TDataSet);
begin
  with QMDetalle do
  begin
     FieldByName('EMPRESA').AsInteger := REntorno.Empresa;
     FieldByName('EJERCICIO').AsInteger := REntorno.Ejercicio;
     FieldByName('CANAL').AsInteger := REntorno.Canal;
     FieldByName('SERIE').AsString := QMCabecera.FieldByName('SERIE').AsString;
     FieldByName('TIPO').AsString := QMCabecera.FieldByName('TIPO').AsString;
     FieldByName('RIT').AsInteger := QMCabecera.FieldByName('RIT').AsInteger;
     FieldByName('ALMACEN').AsString := QMCabecera.FieldByName('ALMACEN').AsString;
     FieldByName('TITULO').AsString := '';
     FieldByName('UNIDADES').AsInteger := 1;
     FieldByName('ENTRADA').AsInteger := REntorno.Entrada;
     FieldByName('UNIDADES_EXT').AsInteger := 0;
     FieldByName('TOTAL_LINEA').AsFloat := 0;
     FieldByName('DESCUENTO').AsFloat := 0;
     FieldByName('PRECIO').AsFloat := 0;
     FieldByName('USUARIO').AsInteger := REntorno.Usuario;
     FieldByName('NSERIE').AsString := '';
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TICKET_LINEA_SIGUIENTE(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIT)';
        Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabecera.FieldByName('EJERCICIO').AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabecera.FieldByName('CANAL').AsInteger;
        Params.ByName['SERIE'].AsString := QMCabecera.FieldByName('SERIE').AsString;
        Params.ByName['TIPO'].AsString := QMCabecera.FieldByName('TIPO').AsString;
        Params.ByName['RIT'].AsInteger := QMCabecera.FieldByName('RIT').AsInteger;
        ExecQuery;
        QMDetalle.FieldByName('LINEA').AsInteger := FieldByName['LINEA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTicketVenta.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  MascarasMoneda;
  QMDetalle.Open;
  RefrescaTotales;
  QMNIF.Open;
end;

procedure TDMTicketVenta.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
  xInfoActualizada.Close;
  QMNIF.Close;
end;

procedure TDMTicketVenta.InsertaLinea(Articulo: string);
var
  Titulo : string;
  Precio, Descuento : double;
  Baja : boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT BAJA ');
        SQL.Add(' FROM ART_ARTICULOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' ARTICULO = :ARTICULO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        ExecQuery;
        Baja := (FieldByName['BAJA'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Baja) then
     ShowMessage(_('El articulo esta dado de baja'))
  else
  begin
     if (QMCabecera.FieldByName('RIT').AsInteger = 0) then
        NuevoTicket;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' EXECUTE PROCEDURE G_PRECIO_VENTA_MONEDA( ');
           SQL.Add(' :EMPRESA, :CLIENTE, :ARTICULO, :TARIFA, :FECHA, :EJERCICIO, :CANAL, ');
           SQL.Add(' :UNIDADES_EXT, :PRECIOP, :UNIDADES, :MONEDA, :ID_A, :UNIDADES_OLD, ');
           SQL.Add(' :IDIOMA, NULL, NULL, :ALMACEN, :FACTOR) ');
           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['CLIENTE'].AsInteger := QMCabeceraCLIENTE.AsInteger;
           Params.ByName['ARTICULO'].AsString := Articulo;
           Params.ByName['TARIFA'].AsString := QMCabeceraTARIFA.AsString;
           Params.ByName['FECHA'].AsDateTime := QMCabeceraFECHA.AsDateTime;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
           Params.ByName['UNIDADES_EXT'].AsDouble := 0; // QMDetalleUNIDADES_EXT.AsFloat;
           Params.ByName['UNIDADES'].AsDouble := 1;
           Params.ByName['PRECIOP'].AsDouble := 0;
           Params.ByName['MONEDA'].AsString := QMCabeceraMONEDA.AsString;
           Params.ByName['ID_A'].IsNull := True;
           Params.ByName['UNIDADES_OLD'].AsFloat := 0;
           Params.ByName['IDIOMA'].AsString := REntorno.IdiomaCanal; // xClientesIDIOMA.AsString;
           Params.ByName['ALMACEN'].AsString := QMCabeceraALMACEN.AsString;
           Params.ByName['FACTOR'].AsDouble := 0;
           ExecQuery;
           Titulo := FieldByName['TITULO'].AsString;
           Precio := FieldByName['PRECIO'].AsDouble;
           Descuento := FieldByName['DESCUENTO'].AsDouble;
           FreeHandle;
        finally
           Free;
        end;

        with QMDetalle do
        begin
           Insert;
           FieldByName('ARTICULO').AsString := Articulo;
           FieldByName('TITULO').AsString := Titulo;
           FieldByName('PRECIO').AsFloat := Precio;
           FieldByName('DESCUENTO').AsFloat := Descuento;
           Post;
           Refrescar(QMDetalle, 'ID_TICKET_DETALLE', FieldByName('ID_TICKET_DETALLE').AsInteger);
        end;
     end;
  end;
end;

procedure TDMTicketVenta.QMDetalleAfterPost(DataSet: TDataSet);
begin
  // Pido el stock para recalcularlo. El SELECT utiliza la versión RO del procedimiento para obtener el stock.
  DMMain.DameStockArticulo(QMDetalle.FieldByName('EMPRESA').AsInteger, QMDetalle.FieldByName('CANAL').AsInteger, QMDetalle.FieldByName('ARTICULO').AsString, QMDetalle.FieldByName('ALMACEN').AsString);
  RefrescaTotales;
end;

procedure TDMTicketVenta.DecrementaUnidades;
begin
  with QMDetalle do
  begin
     if Active then
     begin
        Edit;
        FieldByName('UNIDADES').AsFloat := FieldByName('UNIDADES').AsFloat - 1;
        Post;
     end;
  end;
end;

procedure TDMTicketVenta.IncrementaUnidades;
begin
  with QMDetalle do
  begin
     if Active then
     begin
        Edit;
        FieldByName('UNIDADES').AsFloat := FieldByName('UNIDADES').AsFloat + 1;
        Post;
     end;
  end;
end;

procedure TDMTicketVenta.Bajar;
begin
  if QMDetalle.Active then
     QMDetalle.Next;
end;

procedure TDMTicketVenta.Subir;
begin
  if QMDetalle.Active then
     QMDetalle.Prior;
end;

procedure TDMTicketVenta.BajarFamilia;
begin
  if xFamilia.Active then
     xFamilia.Next;
end;

procedure TDMTicketVenta.SubirFamilia;
begin
  if xFamilia.Active then
     xFamilia.Prior;
end;

procedure TDMTicketVenta.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMCabecera, MascaraN, MascaraI, ShortDateFormat + ' hh:nn');
  AsignaDisplayFormat(xTickets, MascaraN, MascaraI, ShortDateFormat + ' hh:nn');
  AsignaDisplayFormat(xInfoActualizada, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMTurno, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xTurnoFP, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMIngresosEgresos, MascaraN, MascaraI, ShortDateFormat);

  ArticulosAMostrar := 100;
  SaltandoArticulos := 0;
  SubfamiliasAMostrar := 100;
  SaltandoSubfamilias := 0;
  AcreedorDefecto := -1;
  CambioEntregado := 0;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT OBLIGA_TICKET_DEVOLUCION, AUTO_GRABA_CABECERA, FORMA_PAGO_TICKET ');
        SQL.Add(' FROM GES_TPV_CONFIGURACION ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SERIE = ?SERIE ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        ExecQuery;
        FormaPagoTicket := FieldByName['FORMA_PAGO_TICKET'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with xFamilia do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['FAMILIA_SISTEMA'].AsString := REntorno.FamSistema;
     Open;
  end;

  if (DameTituloAcreedor(AcreedorDefecto) = '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MIN(ACREEDOR) FROM VER_ACREEDORES WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ?CANAL';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           ExecQuery;
           AcreedorDefecto := FieldByName['MIN'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  // Verificamos si esta habilitado la sincronizacion del TPV
  TPVSincronizacion := (LeeParametro('TPVSINC001', '') = 'S');

  // Campo a utilizar como codigo en los botones de seleccion de articulo
  param_TPVARTS001 := LeeParametro('TPVARTS001', REntorno.Serie);
  if (Trim(param_TPVARTS001) = '') then
     param_TPVARTS001 := 'ARTICULO';

  with xArticulo do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT FIRST :PRIMEROS SKIP :SALTANDO A.TITULO, C.ID_A, A.SUBFAMILIA, A.' + param_TPVARTS001 + ' AS ARTICULO, A.IMAGEN');
     SelectSQL.Add(' FROM CON_CUENTAS_GES_ART C ');
     SelectSQL.Add(' JOIN ART_ARTICULOS A ON C.ID_A = A.ID_A ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' C.EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' C.EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' C.CANAL = :CANAL AND ');
     SelectSQL.Add(' A.FAMILIA = :FAMILIA AND ');
     SelectSQL.Add(' A.SUBFAMILIA = :SUBFAMILIA ');
     if REntorno.VerSoloArticulosDisponibles then
        SelectSQL.Add(' AND C.DISPONIBILIDAD IN (1, 2) ');
     SelectSQL.Add(' ORDER BY A.' + param_TPVARTS001);
  end;

  // Abierto en este punto para que aparezce el total en pantalla ("0,00 €")
  xInfoActualizada.Open;
end;

procedure TDMTicketVenta.xTicketFormaPagoNewRecord(DataSet: TDataSet);
begin
  with xTicketFormaPago do
  begin
     FieldByName('EMPRESA').AsInteger := REntorno.Empresa;
     FieldByName('EJERCICIO').AsInteger := REntorno.Ejercicio;
     FieldByName('CANAL').AsInteger := REntorno.Canal;
     FieldByName('SERIE').AsString := QMCabecera.FieldByName('SERIE').AsString;
     FieldByName('TIPO').AsString := QMCabecera.FieldByName('TIPO').AsString;
     FieldByName('RIT').AsInteger := QMCabecera.FieldByName('RIT').AsInteger;
     FieldByName('TOTAL_COBRADO').AsFloat := 0;
     FieldByName('TOTAL_ENTREGADO').AsFloat := 0;
     FieldByName('FORMA_PAGO').AsString := FormaPagoTicket;
  end;
end;

procedure TDMTicketVenta.CambiaDatosCabecera(Cliente, Agente: integer; Descripcion: string; DescuentoComercial: double);
begin
  with QMCabecera do
  begin
     Edit;
     FieldByName('CLIENTE').AsInteger := Cliente;
     FieldByName('AGENTE').AsInteger := Agente;
     FieldByName('DESCRIPCION').AsString := Descripcion;
     FieldByName('DTO_CIAL').AsFloat := DescuentoComercial;
     Post;
  end;

  RefrescaTotales;
end;

procedure TDMTicketVenta.CambiaLinea(Articulo, Titulo: string; Unidades, Precio, Descuento: double; TipoIva: integer);
begin
  with QMDetalle do
  begin
     Edit;
     FieldByName('ARTICULO').AsString := Articulo;
     FieldByName('TITULO').AsString := Titulo;
     FieldByName('UNIDADES').AsFloat := Unidades;
     FieldByName('PRECIO').AsFloat := Precio;
     FieldByName('DESCUENTO').AsFloat := Descuento;
     FieldByName('TIPO_IVA').AsInteger := TipoIva;
     Post;
  end;
end;

procedure TDMTicketVenta.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  TFloatField(QMDetalle.FieldByName('UNIDADES')).DisplayFormat := MascaraI;
  TFloatField(QMDetalle.FieldByName('TOTAL_LINEA')).DisplayFormat := MascaraN;
  TFloatField(QMDetalle.FieldByName('P_IVA')).DisplayFormat := MascaraP;
  TFloatField(QMDetalle.FieldByName('PRECIO')).DisplayFormat := MascaraN;
  TFloatField(QMDetalle.FieldByName('DESCUENTO')).DisplayFormat := MascaraP;
end;

procedure TDMTicketVenta.InsertaEntregas;
begin
  if (QMCabeceraESTADO.AsInteger = 0) then
  begin
     QMCabecera.Edit;
     QMCabeceraA_DEVOLVER.AsFloat := 0;
     QMCabecera.Post;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE G_TICKET_INSERTA_ENTREGAS (?ID_TICKET)';
           Params.ByName['ID_TICKET'].AsInteger := QMCabeceraID_TICKET.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  xTicketFormaPago.Close;
  xTicketFormaPago.Open;
end;

procedure TDMTicketVenta.InsertaFormaPago(FormaPago: string; Importe: double);
begin
  if (PuedoInsertarFormaPago(Importe)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO VER_TICKET_FP ');
           SQL.Add('   (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIT,FORMA_PAGO,TOTAL_COBRADO,TOTAL_ENTREGADO) ');
           SQL.Add(' VALUES ');
           SQL.Add('   (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIT,?FORMA_PAGO,?TOTAL_COBRADO,?TOTAL_ENTREGADO) ');

           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
           Params.ByName['RIT'].AsInteger := QMCabeceraRIT.AsInteger;
           Params.ByName['FORMA_PAGO'].AsString := FormaPago;
           Params.ByName['TOTAL_COBRADO'].AsFloat := 0;
           Params.ByName['TOTAL_ENTREGADO'].AsFloat := Importe;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     xTicketFormaPago.Close;
     xTicketFormaPago.Open;
     RefrescaTotales;
  end;
end;

procedure TDMTicketVenta.xFamiliaAfterOpen(DataSet: TDataSet);
begin
  SaltandoSubfamilias := 0;
  FiltraSubfamilias;
end;

procedure TDMTicketVenta.xFamiliaBeforeClose(DataSet: TDataSet);
begin
  xSubfamilia.Close;
  xArticulo.Close;
end;

procedure TDMTicketVenta.xFamiliaBeforeScroll(DataSet: TDataSet);
begin
  SaltandoSubfamilias := 0;
  FiltraSubfamilias;
end;

function TDMTicketVenta.CierraTicket(Imprimir, Recibo: boolean; Agente: integer; Email: string): boolean;
var
  Cerrado : integer;
  NumeroAutorizacion : string;
  NumeroDosificacion : integer;
  NIT : string;
  FechaTransaccion : TDateTime;
  MontoTransaccion : double;
  LlaveDosificacion : string;
  CodigoControl : string;
  CodigoRespuestaRapida : string;
  RutaFichero : string;
begin
  // Si el agente de cobro cambia, lo modificames la cabecera del ticket.
  if ((Agente <> 0) and (Agente <> QMCabeceraAGENTE.AsInteger)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE GES_TICKET_CABECERA ');
           SQL.Add(' SET ');
           SQL.Add(' AGENTE = :AGENTE ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_TICKET = :ID_TICKET AND ');
           SQL.Add(' ESTADO = 0 ');
           Params.ByName['AGENTE'].AsInteger := Agente;
           Params.ByName['ID_TICKET'].AsInteger := QMCabeceraID_TICKET.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE G_TICKET_CIERRA_VALES( ');
        SQL.Add(' ?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?SESION, ?CAJA, ?TURNO, ');
        SQL.Add(' ?ENTRADA, ?ID_TICKET, ?USUARIO, ?FECHA_CIERRE) ');
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['SESION'].AsInteger := QMCabeceraSESION.AsInteger;
        Params.ByName['CAJA'].AsInteger := QMCabeceraCAJA.AsInteger;
        Params.ByName['TURNO'].AsInteger := QMCabeceraTURNO.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_TICKET'].AsInteger := QMCabeceraID_TICKET.AsInteger;
        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
        Params.ByName['FECHA_CIERRE'].AsDateTime := REntorno.FechaTrab;
        ExecQuery;
        Cerrado := FieldByName['CERRADO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Cerrado = 1) then
  begin
     if (REntorno.Pais = 'BOL') then
     begin
        // Calculo del codigo de control cuando se cierra la factura.
        // Ver si hay que tomar el contador de la autorizacion como numero de factura.
        // Replicar comportamiento en UDMFacturas.

        if (QMCabeceraCLIENTE.AsInteger < 0) then
        begin
           with QMNIF do
           begin
              Close;
              Params.ByName['TIPO'].AsString := 'TIC';
              Params.ByName['ID_TICKET'].AsInteger := QMCabeceraID_TICKET.AsInteger;
              Open;
              NIT := QMNIFNIF.AsString;
           end;
        end
        else
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT T.NIF FROM EMP_CLIENTES C ');
                 SQL.Add(' JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' C.EMPRESA = :EMPRESA AND ');
                 SQL.Add(' C.CLIENTE = :CLIENTE ');
                 Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
                 Params.ByName['CLIENTE'].AsInteger := QMCabeceraCLIENTE.AsInteger;
                 ExecQuery;
                 NIT := FieldByName['NIF'].AsString;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        NumeroAutorizacion := QMCabeceraSFV_AUTORIZACION.AsString;
        LlaveDosificacion := DMMain.DameLlaveDosificacion('E', NumeroAutorizacion);
        FechaTransaccion := Trunc(QMCabeceraFECHA.AsDateTime);
        MontoTransaccion := QMCabeceraLIQUIDO.AsFloat;

        NumeroDosificacion := QMCabeceraSFV_NUM_DOSIFICACION.AsInteger;
        // Calculo NumeroDosificacion si no esta rellenado con anterioridad.
        // Solo en el caso de ser una factura (Ticket que se facturará).
        if ((not Recibo) and (NumeroDosificacion = 0)) then
           NumeroDosificacion := DMMain.DameNumeroDosifiacion('E', NumeroAutorizacion);

        // Asignar valores a ini de sincronizacion
        RutaFichero := DMMain.DameRutaFicheroDeSincronizacion(QMCabeceraSerie.AsString) + 'TPV-sincronizacion_' + QMCabeceraSERIE.AsString + '.ini';
        if (Trim(RutaFichero) > '') then
        begin
           // La Maquina online actualiza los datos de sincronizacion del ultimo ticket en el ini de sincronizacion de la maquina offline
           ActualizaDatosIniSincronizacion(NumeroDosificacion, QMCabeceraRIT.AsInteger, QMCabeceraSESION.AsInteger, 'ON');
        end;

        // Calculo de Codigo de Control y datos para Codigo QR.
        CodigoControl := DameCodigoControl(NumeroAutorizacion, IntToStr(NumeroDosificacion), NIT, LlaveDosificacion, FechaTransaccion, MontoTransaccion);
        CodigoRespuestaRapida := REntorno.CifEmpresa{EMISOR} + '|' + IntToStr(NumeroDosificacion) + '|' + NumeroAutorizacion + '|' + DateTimeToStr(FechaTransaccion) + '|' + FloatToStr(MontoTransaccion) + '|' + FloatToStr(MontoTransaccion) + '|' + CodigoControl + '|' + NIT{NIT Comprador} + '|' + '0'{Importe ICE} + '|' + '0'{Importe por ventas no gravadas} + '|' + '0'{Importe no sujeto} + '|' + '0'{Descuentos, bonificaciones};

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' UPDATE GES_TICKET_CABECERA ');
              SQL.Add(' SET ');
              SQL.Add(' SFV_CODIGO_CONTROL = :SFV_CODIGO_CONTROL, ');
              SQL.Add(' SFV_NUM_DOSIFICACION = :SFV_NUM_DOSIFICACION, ');
              SQL.Add(' SFV_CODIGO_RESPUESTA_RAPIDA = :SFV_CODIGO_RESPUESTA_RAPIDA ');
              SQL.Add(' WHERE ');
              SQL.Add(' ID_TICKET = :ID_TICKET ');
              Params.ByName['SFV_CODIGO_CONTROL'].AsString := CodigoControl;
              Params.ByName['SFV_NUM_DOSIFICACION'].AsInteger := NumeroDosificacion;
              Params.ByName['SFV_CODIGO_RESPUESTA_RAPIDA'].AsString := CodigoRespuestaRapida;
              Params.ByName['ID_TICKET'].AsInteger := QMCabeceraID_TICKET.AsInteger;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE G_TICKET_CIERRA (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIT)';
           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
           Params.ByName['RIT'].AsInteger := QMCabeceraRIT.AsInteger;
           ExecQuery;
           Cerrado := FieldByName['CERRADO'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (Cerrado = 0) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE G_TICKET_ABRE_VALES(?EMPRESA, ?ID_TICKET)';
              Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
              Params.ByName['ID_TICKET'].AsInteger := QMCabeceraID_TICKET.AsInteger;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;

  if (Cerrado = 0) then
     ShowMessage(_('EL TICKET NO HA PODIDO CERRARSE. INTENTELO DE NUEVO'))
  else
  begin
     if (Imprimir) then
     begin
        ImprimirTicket(Email, True);
        if (DMMain.EstadoKri(418) = 1) then
        begin
           AbreData(TDMPrestashop, DMPrestashop);
           DMPrestashop.ActualizaStockTicket(QMCabeceraEMPRESA.AsInteger, QMCabeceraEJERCICIO.AsInteger, QMCabeceraCANAL.AsInteger, QMCabeceraSERIE.AsString, QMCabeceraTIPO.AsString, QMCabeceraRIT.AsInteger, -1);
           CierraData(DMPrestashop);
        end;
     end;

     // Pido el stock de los articulos que intervienen en el ticket para mantenerlo actualizado
     // En este punto se esta imprimiendo el ticket, por lo que es tiempo muerto
     if (QMDetalle.State = dsInactive) then
        QMDetalle.Open;

     with QMDetalle do
     begin
        First;
        while not EOF do
        begin
           DMMain.DameStockArticulo(FieldByName('EMPRESA').AsInteger, FieldByName('CANAL').AsInteger, FieldByName('ARTICULO').AsString, FieldByName('ALMACEN').AsString);
           Next;
        end;
     end;

     // No cierro para que queden los datos de cobro.
     // QMCabecera.Close;
     RefrescaTotales;
  end;

  Result := (Cerrado = 1);
end;

procedure TDMTicketVenta.ImprimirTicket(Email: string; Rollo: boolean; Regalo: boolean = False);
var
  Serie, Tipo : string;
  RIT : integer;
begin
  try
     if (QMDetalle.RecordCount > 0) then
     begin
        Serie := QMCabeceraSERIE.AsString;
        Tipo := QMCabeceraTIPO.AsString;
        RIT := QMCabeceraRIT.AsInteger;

        { TODO : Implementar AbrirCajon }
        {
        try
           AbrirCajon;
        except
        end;
        }

        // Actualizamos el email del ticket
        Email := Trim(Email);
        if (Email <> '') then
           AsignaEmailTicket(Email, QMCabeceraID_TICKET.AsInteger);

        AbreData(TDMLstTickets, DMLstTickets);
        DMLstTickets.ImprimirTicket(Email, Serie, Tipo, RIT, 0, Rollo, True, Regalo);
        CierraData(DMLstTickets);

        // Finalmente
        // Application.ProcessMessages;

        { TODO : Implementar CortePapel }
        {
        try
           CortePapel;
        except
        end;
        }
     end;
  except
     {
     on E: Exception do
     begin
        ShowMessage('Ha ocurrido un error al imprimir el ticket.' + #13 + #10 + E.Message);
     end;
     }
  end;
  {dji lrk kri - No se si es necesario - revisar CortePapel}
  {
  try
     for RIT := 1 to 1250 do
        Application.ProcessMessages;
     CortePapel;
  except
  end;
  }
  {dji lrk kri - No se si es necesario - revisar AbrirCajon}
  {
  try
     for RIT := 1 to 1250 do
        Application.ProcessMessages;
     AbrirCajon;
  except
  end;
  }
end;

procedure TDMTicketVenta.BajaDetalle;
begin
  if ConfirmaMensaje(_('¿Desea eliminar la línea?')) then
  begin
     if (QMDetalle.FieldByName('LINEA').AsInteger <> 0) then
     begin
        QMDetalle.Delete;
        RefrescaTotales;
     end;
  end;
end;

procedure TDMTicketVenta.xInfoActualizadaLIQUIDOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (xInfoActualizadaMONEDA.AsString = '') then
     Text := Format('%s %s', [FormatFloat(DMMain.MascaraMoneda(REntorno.MonedaEmpresa, 1), xInfoActualizadaLIQUIDO.AsFloat), DMMain.DameSignoMoneda(REntorno.MonedaEmpresa)])
  else
     Text := Format('%s %s', [FormatFloat(LocalMascaraN, xInfoActualizadaLIQUIDO.AsFloat), xInfoActualizadaSIGNO_MONEDA.AsString]);
end;

procedure TDMTicketVenta.MascarasMoneda;
begin
  LocalMascaraN := DMMain.MascaraMoneda(QMCabeceraMONEDA.AsString, 1);
  LocalMascaraL := DMMain.MascaraMoneda(QMCabeceraMONEDA.AsString, 0);

  xInfoActualizadaLIQUIDO.DisplayFormat := LocalMascaraN;
  xInfoActualizadaS_BASES.DisplayFormat := LocalMascaraN;
  xInfoActualizadaS_CUOTA_IVA.DisplayFormat := LocalMascaraN;

  xTicketFormaPagoTOTAL_COBRADO.DisplayFormat := LocalMascaraN;
  xTicketFormaPagoTOTAL_ENTREGADO.DisplayFormat := LocalMascaraN;
end;

procedure TDMTicketVenta.QMCabeceraAfterScroll(DataSet: TDataSet);
begin
  MascarasMoneda;
end;

procedure TDMTicketVenta.CreaTercero(NIF, NombreCliente, NombreComercial: string);
begin
  if (Trim(NombreComercial) = '') then
     NombreComercial := NombreCliente;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO VER_TERCEROS_EDICION ');
        SQL.Add(' (TERCERO, NOMBRE_COMERCIAL, NOMBRE_R_SOCIAL, NIF, DIR_LOCALIDAD, DIR_DEFECTO) ');
        SQL.Add(' VALUES ');
        SQL.Add(' (?TERCERO, ?NOMBRE_COMERCIAL, ?NOMBRE_R_SOCIAL, ?NIF, ?DIR_LOCALIDAD, ?DIR_DEFECTO) ');
        Params.ByName['TERCERO'].AsInteger := 0;
        Params.ByName['NOMBRE_COMERCIAL'].AsString := NombreCliente;
        Params.ByName['NOMBRE_R_SOCIAL'].AsString := NombreComercial;
        Params.ByName['NIF'].AsString := NIF;
        Params.ByName['DIR_LOCALIDAD'].AsString := '99999999';
        Params.ByName['DIR_DEFECTO'].AsInteger := 1;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTicketVenta.CreaCabeceraTicket;
begin
  /// Activa la cabecera y crea un nuevo ticket si no existe.

  // Verificamos si el dataset esta abierto
  with QMCabecera do
  begin
     if not Active then
        Open;

     if (FieldByName('RIT').AsInteger = 0) then
        NuevoTicket;
  end;
end;

function TDMTicketVenta.EstadoDocumento: integer;
begin
  Result := QMCabecera.FieldByName('ESTADO').AsInteger;
end;

procedure TDMTicketVenta.GrabaDatosCliente(Estado: integer);
begin
  if (LeeParametro('TERLNIF001') = 'S') then
     QMNIFNIF.AsString := LimpiaNIF(QMNIFPAIS.AsString, QMNIFNIF.AsString);

  // CLIVARI004 - Permite editar datos de clientes varios de documentos cerrados.
  if (Estado = mrOk) and ((EstadoDocumento = 0) or (LeeParametro('CLIVARI004') = 'S')) then
     QMNif.Post
  else
     QMNif.Cancel;

  if ((QMNIFNOMBRE.AsString = '') and
     (QMNifNIF.AsString = '') and
     (QMNifDIRECCION.AsString = '') and
     (QMNIFC_POSTAL.AsString = '') and
     (QMNifLOCALIDAD.AsString = '') and
     (QMNifPROVINCIA.AsString = '') and
     // Pais no lo tengo en cuenta porque se rellena con valores por defecto si es vacio. (QMNifPAIS.AsString = '') and
     (QMNifTELEFONO01.AsString = '') and
     (QMNifTELEFONO02.AsString = '') and
     (QMNifTELEFAX.AsString = '') and
     (QMNifEMAIL.AsString = '')
     ) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'DELETE FROM GES_CABECERAS_S_FAC_NIF WHERE ID_S = ?ID_S';
           Params.ByName['ID_S'].AsInteger := QMCabeceraID_TICKET.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMNif.Close;
     QMNif.Open;
  end;
end;

procedure TDMTicketVenta.AbreQMNif;
begin
  if (QMCabecera.State in [dsInsert, dsEdit]) then
     QMCabecera.Post;
  if (QMDetalle.State in [dsInsert, dsEdit]) then
     QMDetalle.Post;

  QMNif.Close;
  QMNif.Open;
end;

function TDMTicketVenta.DameDatosClientes: boolean;
begin
  if ((QMCabeceraTERCERO.AsInteger <= -1)) then
  begin
     Result := True;
     if QMNIF.RecordCount > 0 then
        QMNIF.Edit
     else
        QMNIF.Insert;
  end
  else
     Result := False;
end;

procedure TDMTicketVenta.CierraQMNif;
begin
  QMNif.Close;
end;

procedure TDMTicketVenta.QMNIFNewRecord(DataSet: TDataSet);
begin
  QMNifEMPRESA.AsInteger := QMCabeceraEMPRESA.AsInteger;
  QMNifEJERCICIO.AsInteger := QMCabeceraEJERCICIO.AsInteger;
  QMNifCANAL.AsInteger := QMCabeceraCANAL.AsInteger;
  QMNifSERIE.AsString := QMCabeceraSERIE.AsString;
  QMNifTIPO.AsString := QMCabeceraTIPO.AsString;
  QMNifRIG.AsInteger := QMCabeceraRIT.AsInteger;
  QMNifPAIS.AsString := REntorno.Pais;
  QMNifID_S.AsInteger := QMCabeceraID_TICKET.AsInteger;
  QMNIFPAIS_DOC_IDENT.AsString := REntorno.Pais;
  QMNIFTIPO_DOC_IDENT.AsString := DMMain.DameTipoDocPaisDefecto(QMNIFPAIS_DOC_IDENT.AsString);
end;

procedure TDMTicketVenta.AsignaTercero(Tercero, Id_Ticket: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        Transaction := TLocal;
        SQL.Add(' UPDATE GES_CABECERAS_S_FAC_NIF ');
        SQL.Add(' SET ');
        SQL.Add(' TERCERO = :TERCERO, ');
        SQL.Add(' NOMBRE = (SELECT NOMBRE_R_SOCIAL ');
        SQL.Add('           FROM SYS_TERCEROS ');
        SQL.Add('           WHERE ');
        SQL.Add('           TERCERO = :TERCERO), ');
        SQL.Add(' NIF = (SELECT NIF ');
        SQL.Add('        FROM SYS_TERCEROS ');
        SQL.Add('        WHERE ');
        SQL.Add('        TERCERO = :TERCERO), ');
        SQL.Add(' PAIS_DOC_IDENT = (SELECT PAIS_TERCERO ');
        SQL.Add('                   FROM SYS_TERCEROS ');
        SQL.Add('                   WHERE ');
        SQL.Add('                   TERCERO = :TERCERO), ');
        SQL.Add(' TIPO_DOC_IDENT = (SELECT TIPO_DOC_IDENT ');
        SQL.Add('                   FROM SYS_TERCEROS ');
        SQL.Add('                   WHERE ');
        SQL.Add('                   TERCERO = :TERCERO), ');
        SQL.Add(' DIRECCION = (SELECT D.DIR_COMPLETA_N ');
        SQL.Add('              FROM SYS_TERCEROS T ');
        SQL.Add('              JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO ');
        SQL.Add('              WHERE ');
        SQL.Add('              T.TERCERO = :TERCERO AND ');
        SQL.Add('              D.DIR_DEFECTO = 1), ');
        SQL.Add(' C_POSTAL = (SELECT L.CODIGO_POSTAL ');
        SQL.Add('             FROM SYS_TERCEROS T ');
        SQL.Add('             JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO ');
        SQL.Add('             JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL ');
        SQL.Add('             WHERE ');
        SQL.Add('             T.TERCERO = :TERCERO AND ');
        SQL.Add('             D.DIR_DEFECTO = 1), ');
        SQL.Add(' PROVINCIA = (SELECT P.TITULO ');
        SQL.Add('              FROM SYS_TERCEROS T ');
        SQL.Add('              JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO ');
        SQL.Add('              JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL ');
        SQL.Add('              JOIN SYS_PROVINCIAS P ON L.PAIS = P.PAIS AND L.PROVINCIA = P.PROVINCIA ');
        SQL.Add('              WHERE ');
        SQL.Add('              T.TERCERO = :TERCERO AND ');
        SQL.Add('              D.DIR_DEFECTO = 1), ');
        SQL.Add(' PAIS = (SELECT L.PAIS ');
        SQL.Add('         FROM SYS_TERCEROS T ');
        SQL.Add('         JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO ');
        SQL.Add('         JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL ');
        SQL.Add('         WHERE ');
        SQL.Add('         T.TERCERO = :TERCERO AND ');
        SQL.Add('         D.DIR_DEFECTO = 1), ');
        SQL.Add(' LOCALIDAD = (SELECT L.TITULO ');
        SQL.Add('              FROM SYS_TERCEROS T ');
        SQL.Add('              JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO ');
        SQL.Add('              JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL ');
        SQL.Add('              WHERE ');
        SQL.Add('              T.TERCERO = :TERCERO AND ');
        SQL.Add('              D.DIR_DEFECTO = 1), ');
        SQL.Add(' TELEFONO01 = (SELECT T.TELEFONO01 ');
        SQL.Add('               FROM SYS_TERCEROS T ');
        SQL.Add('               WHERE ');
        SQL.Add('               T.TERCERO = :TERCERO), ');
        SQL.Add(' TELEFONO02 = (SELECT T.TELEFONO02 ');
        SQL.Add('               FROM SYS_TERCEROS T ');
        SQL.Add('               WHERE ');
        SQL.Add('               T.TERCERO = :TERCERO), ');
        SQL.Add(' TELEFAX = (SELECT T.TELEFAX ');
        SQL.Add('            FROM SYS_TERCEROS T ');
        SQL.Add('            WHERE ');
        SQL.Add('            T.TERCERO = :TERCERO), ');
        SQL.Add(' EMAIL = (SELECT T.EMAIL ');
        SQL.Add('          FROM SYS_TERCEROS T ');
        SQL.Add('          WHERE ');
        SQL.Add('          T.TERCERO = :TERCERO), ');
        SQL.Add(' NOTAS = (SELECT NOTAS ');
        SQL.Add('          FROM SYS_TERCEROS ');
        SQL.Add('          WHERE ');
        SQL.Add('          TERCERO = :TERCERO), ');
        SQL.Add(' COLONIA = (SELECT L.COLONIA ');
        SQL.Add('            FROM SYS_TERCEROS T ');
        SQL.Add('            JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO ');
        SQL.Add('            JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL ');
        SQL.Add('            WHERE ');
        SQL.Add('            T.TERCERO = :TERCERO AND ');
        SQL.Add('            D.DIR_DEFECTO = 1) ');
        SQL.Add('            WHERE ');
        SQL.Add('            TIPO = :TIPO AND ');
        SQL.Add('            ID_S = :ID_TICKET ');

        Params.ByName['TERCERO'].AsInteger := Tercero;
        Params.ByName['TIPO'].AsString := 'TIC';
        Params.ByName['ID_TICKET'].AsInteger := Id_Ticket;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTicketVenta.AsignaTerceroFitosanitario(Nombre, NIF, Direccion, CodigoPostal, Localidad, CarnetAplicador, Telefono: string; Tercero: integer = 0);
begin
  // Devuelve el tercero, si es necesario lo crea. Tambien crea o modifica la cabecera en GES_CABECERAS_S_FAC_NIF
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        Transaction := TLocal;
        SQL.Add(' SELECT TERCERO FROM TPV_GENERA_CAB_NIF( ');
        SQL.Add(' :NOMBRE, :NIF, :DIRECCION, :CODIGOPOSTAL, :CARNET_APLICADOR, :TELEFONO, :PAIS, :ID_S, :TERCERO) ');
        Params.ByName['NOMBRE'].AsString := Nombre;
        Params.ByName['NIF'].AsString := NIF;
        Params.ByName['DIRECCION'].AsString := Direccion;
        Params.ByName['CODIGOPOSTAL'].AsString := CodigoPostal;
        Params.ByName['CARNET_APLICADOR'].AsString := CarnetAplicador;
        Params.ByName['TELEFONO'].AsString := Telefono;
        Params.ByName['PAIS'].AsString := REntorno.Pais;
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_TICKET.AsInteger;
        Params.ByName['TERCERO'].AsInteger := Tercero;
        ExecQuery;
        // Tercero := FieldByName['TERCERO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTicketVenta.LimitaArticulos(Cantidad: integer);
begin
  ArticulosAMostrar := Cantidad;
end;

procedure TDMTicketVenta.LimitaSubfamilias(Cantidad: integer);
begin
  SubfamiliasAMostrar := Cantidad;
end;

procedure TDMTicketVenta.FiltraArticulos(Id_Subfamilia: integer);
var
  Subfamilia : string;
begin
  Subfamilia := '';
  if (DMMain.EstadoKri(445) = 1) then
  begin
     // Obtenemos la subfamilia
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT SUBFAMILIA FROM ART_SUBFAMILIAS ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_SUBFAMILIA = :ID_SUBFAMILIA ');
           Params.ByName['ID_SUBFAMILIA'].AsInteger := ID_SUBFAMILIA;
           ExecQuery;
           Subfamilia := FieldByName['SUBFAMILIA'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  with xArticulo do
  begin
     Close;
     Params.ByName['PRIMEROS'].AsInteger := ArticulosAMostrar;
     Params.ByName['SALTANDO'].AsInteger := SaltandoArticulos;
     Params.ByName['SUBFAMILIA'].AsString := Subfamilia;
     Open;
  end;
end;

procedure TDMTicketVenta.FiltraSubfamilias;
begin
  with xSubfamilia do
  begin
     Close;
     Params.ByName['PRIMEROS'].AsInteger := SubfamiliasAMostrar;
     Params.ByName['SALTANDO'].AsInteger := SaltandoSubfamilias;
     Open;
     FetchAll;
  end;
end;

procedure TDMTicketVenta.SaltoArticulos(Direccion: integer; EsArticulo: boolean);
begin
  if EsArticulo then
  begin
     SaltandoArticulos := SaltandoArticulos + (ArticulosAMostrar * Direccion);
     if (SaltandoArticulos < 0) then
        SaltandoArticulos := 0;
  end
  else
  begin
     SaltandoSubfamilias := SaltandoSubfamilias + (SubfamiliasAMostrar * Direccion);
     if (SaltandoSubfamilias < 0) then
        SaltandoSubfamilias := 0;
  end;
end;

procedure TDMTicketVenta.SeleccionaTicket(rit: integer; Ejercicio: integer = 0; Canal: integer = 0; Serie: string = '');
begin
  if (Ejercicio = 0) then
     Ejercicio := REntorno.Ejercicio;
  if (Canal = 0) then
     Canal := REntorno.Canal;
  if (Serie = '') then
     Serie := REntorno.Serie;

  with QMCabecera do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := 'TIC';
     Params.ByName['RIT'].AsInteger := rit;
     Open;
  end;
end;

procedure TDMTicketVenta.AnulaTicket(IdTicket: integer; Motivo: string; MoverSiguiente: boolean = True);
begin
  if (xTickets.FieldByName('ESTADO').AsInteger = 5) then
     ShowMessage(_('No se puede anular un ticket cerrado.'))
  else
  if (xTickets.FieldByName('ESTADO').AsInteger = 2) then
     ShowMessage(_('No se puede anular un ticket anulado.'))
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE GES_TICKET_CABECERA ');
           SQL.Add(' SET ');
           SQL.Add(' ESTADO = 2, ');
           SQL.Add(' MOTIVO_ANULADO = ?MOTIVO ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_TICKET = ?ID_TICKET ');
           Params.ByName['ID_TICKET'].AsInteger := IdTicket;
           Params.ByName['MOTIVO'].AsString := Motivo;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Nos posicionamos en el siguiente ticket y refrescamos
     xTickets.Next;
     Refrescar(xTickets, 'ID_TICKET', xTickets.FieldByName('ID_TICKET').AsInteger);
  end;
end;

procedure TDMTicketVenta.AbrirListaTickets;
begin
  with xTickets do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     Params.ByName['TIPO'].AsString := 'TIC';
     Params.ByName['SESION'].AsInteger := REntorno.Sesion;
     Params.ByName['CAJA'].AsInteger := REntorno.Caja;
     Params.ByName['TURNO'].AsInteger := REntorno.Turno;
     Open;
  end;
end;

procedure TDMTicketVenta.AbrirDatosCierreTurno;
begin
  // Datos del turno
  with QMTurno do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     Params.ByName['SESION'].AsInteger := REntorno.Sesion;
     Params.ByName['CAJA'].AsInteger := REntorno.Caja;
     Params.ByName['TURNO'].AsInteger := REntorno.Turno;
     Open;
  end;

  // Desglose por forma de pago
  with xTurnoFP do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     Params.ByName['SESION'].AsInteger := REntorno.Sesion;
     Params.ByName['CAJA'].AsInteger := REntorno.Caja;
     Params.ByName['TURNO'].AsInteger := REntorno.Turno;
     Open;
  end;
end;

function TDMTicketVenta.ExistenTicketsAbiertos: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        Transaction := TLocal;
        SQL.Add(' SELECT FIRST 1 RIT FROM GES_TICKET_CABECERA ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' SESION = :SESION AND ');
        SQL.Add(' CAJA = :CAJA AND ');
        SQL.Add(' TURNO = :TURNO AND ');
        SQL.Add(' ESTADO = 0 ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['SESION'].AsInteger := REntorno.Sesion;
        Params.ByName['CAJA'].AsInteger := REntorno.Caja;
        Params.ByName['TURNO'].AsInteger := REntorno.Turno;
        ExecQuery;
        Result := (FieldByName['RIT'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTicketVenta.QMCabeceraAfterPost(DataSet: TDataSet);
var
  FicheroSincronizacion : string;
begin
  // Verificamos si tiene activo la sincronizacion y es una estacion de trabajo online
  if ((TPVSincronizacion) and (REntorno.MaquinaSincronizacion = 'online')) then
  begin
     // Obtenemos la ruta del fichero sincronizacion en la maquina local de la serie que corresponda
     FicheroSincronizacion := DMMain.DameRutaFicheroDeSincronizacion(QMCabeceraSerie.AsString) + 'TPV-sincronizacion_' + QMCabeceraSERIE.AsString + '.ini';
     if (FileExists(FicheroSincronizacion)) then
     begin
        // La Maquina online actualiza los datos de sincronizacion del ultimo ticket en el ini de sincronizacion de la maquina offline
        ActualizaDatosIniSincronizacion(QMCabeceraSFV_NUM_DOSIFICACION.AsInteger, QMCabeceraRIT.AsInteger, QMCabeceraSESION.AsInteger, 'ON');
     end
     else
        ShowMessage(_('No existe el fichero de configuracion para la sincronización'));
  end;
end;

procedure TDMTicketVenta.QMIngresosEgresosNewRecord(DataSet: TDataSet);
begin
  QMIngresosEgresosEMPRESA.AsInteger := REntorno.Empresa;
  QMIngresosEgresosEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMIngresosEgresosCANAL.AsInteger := REntorno.Canal;
  QMIngresosEgresosSERIE.AsString := REntorno.Serie;
  QMIngresosEgresosSESION.AsInteger := REntorno.Sesion;
  QMIngresosEgresosCAJA.AsInteger := REntorno.Caja;
  QMIngresosEgresosTURNO.AsInteger := REntorno.Turno;
  QMIngresosEgresosENTRADA.AsInteger := REntorno.Entrada;
  QMIngresosEgresosFECHA.AsDateTime := REntorno.FechaTrab;
end;

procedure TDMTicketVenta.QMIngresosEgresosBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_TPV_INGRESOS_EGRESOS', 'ID');
end;

procedure TDMTicketVenta.IngresoEgreso(TipoMovimiento: integer; Descripcion, Nota: string; Importe: double);
begin
  with QMIngresosEgresos do
  begin
     Append;

     if (TipoMovimiento = 0) then
        FieldByName('TIPO_MOVIMIENTO').AsString := 'ENT'
     else
        FieldByName('TIPO_MOVIMIENTO').AsString := 'SAL';
     FieldByName('IMPORTE').AsFloat := Importe;
     FieldByName('DESCRIPCION').AsString := Descripcion;
     FieldByName('NOTA').AsString := Nota;

     Post;
  end;
end;

procedure TDMTicketVenta.AbrirDatosIngresosEgresos;
begin
  with QMIngresosEgresos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := REntorno.Serie;
     Params.ByName['SESION'].AsInteger := REntorno.Sesion;
     Params.ByName['CAJA'].AsInteger := REntorno.Caja;
     Params.ByName['TURNO'].AsInteger := REntorno.Turno;
     Open;
  end;
end;

procedure TDMTicketVenta.QMIngresosEgresosCalcFields(DataSet: TDataSet);
begin
  if (QMIngresosEgresosTIPO_MOVIMIENTO.AsString = 'ENT') then
     QMIngresosEgresosDESC_TIPO_MOVIEMIENTO.AsString := _('Ingreso')
  else
     QMIngresosEgresosDESC_TIPO_MOVIEMIENTO.AsString := _('Egreso');
end;

function TDMTicketVenta.CierraTurno: integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TICKET_CIERRA_TURNO(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :SESION, :CAJA, :TURNO)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['SESION'].AsInteger := REntorno.Sesion;
        Params.ByName['CAJA'].AsInteger := REntorno.Caja;
        Params.ByName['TURNO'].AsInteger := REntorno.Turno;
        ExecQuery;
        Result := FieldByName['CERRADO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Ponemos caja a cero, para que cuando entre pueda legir una caja
  REntorno.Caja := 0;
end;

function TDMTicketVenta.AbreTurno: integer;
var
  UltimoTurno : integer;
begin
  // Obtenemos el ultimo turno cerrado de las sesion caja
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MAX(TURNO) FROM GES_TPV_SESIONES_CAJAS_TURNO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' SESION = :SESION AND ');
        SQL.Add(' CAJA = :CAJA AND ');
        SQL.Add(' ABIERTO = 0 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['SESION'].AsInteger := REntorno.Sesion;
        Params.ByName['CAJA'].AsInteger := REntorno.Caja;
        ExecQuery;
        UltimoTurno := FieldByName['MAX'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Abrimos el nuevo turno
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_TICKET_ABRE_TURNO(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :CAJA, :USUARIO, :FECHA, :TURNOOLD)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['CAJA'].AsInteger := REntorno.Caja;
        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['TURNOOLD'].AsInteger := UltimoTurno;

        ExecQuery;
        Result := FieldByName['TURNO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMTicketVenta.DameSaldoEntradasSalidas: double;
begin
  // Suma de Entradas
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(IMPORTE) FROM ');
        SQL.Add(' GES_TPV_INGRESOS_EGRESOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' SESION = :SESION AND ');
        SQL.Add(' CAJA  = :CAJA AND ');
        SQL.Add(' TURNO = :TURNO AND ');
        SQL.Add(' TIPO_MOVIMIENTO = :TIPO_MOVIMIENTO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['SESION'].AsInteger := REntorno.Sesion;
        Params.ByName['CAJA'].AsInteger := REntorno.Caja;
        Params.ByName['TURNO'].AsInteger := REntorno.Turno;
        Params.ByName['TIPO_MOVIMIENTO'].AsString := 'ENT';
        ExecQuery;
        Result := FieldByName['SUM'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Suma de salidas
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(IMPORTE) FROM ');
        SQL.Add(' GES_TPV_INGRESOS_EGRESOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' SESION = :SESION AND ');
        SQL.Add(' CAJA  = :CAJA AND ');
        SQL.Add(' TURNO = :TURNO AND ');
        SQL.Add(' TIPO_MOVIMIENTO = :TIPO_MOVIMIENTO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['SESION'].AsInteger := REntorno.Sesion;
        Params.ByName['CAJA'].AsInteger := REntorno.Caja;
        Params.ByName['TURNO'].AsInteger := REntorno.Turno;
        Params.ByName['TIPO_MOVIMIENTO'].AsString := 'SAL';
        ExecQuery;
        Result := Result - FieldByName['SUM'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMTicketVenta.DameTotalEnEfectivo: double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('SELECT SUM(T.TOTAL_COBRADO) AS TOTAL_COBRADO ');
        SQL.Add('FROM GES_TPV_SESIONES_CAJAS_TURNO_FP T ');
        SQL.Add('JOIN CON_CUENTAS_GES_FP FP ON (T.EMPRESA = FP.EMPRESA AND T.EJERCICIO = FP.EJERCICIO AND T.CANAL = FP.CANAL AND T.FORMA_PAGO = FP.FORMA_PAGO) ');
        SQL.Add('WHERE T.EMPRESA = :EMPRESA AND ');
        SQL.Add('      T.EJERCICIO = :EJERCICIO AND ');
        SQL.Add('      T.CANAL = :CANAL AND ');
        SQL.Add('      T.SERIE = :SERIE AND ');
        SQL.Add('      T.SESION = :SESION AND ');
        SQL.Add('      T.CAJA = :CAJA AND ');
        SQL.Add('      T.TURNO = :TURNO AND ');
        SQL.Add('      FP.TIPO_EFECTO = ''EFE'' ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['SESION'].AsInteger := REntorno.Sesion;
        Params.ByName['CAJA'].AsInteger := REntorno.Caja;
        Params.ByName['TURNO'].AsInteger := REntorno.Turno;

        ExecQuery;
        Result := FieldByName['TOTAL_COBRADO'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTicketVenta.MostrarComprobanteIngresoEgreso(Modo: integer);
begin
  AbreData(TDMListados, DMListados);
  DMListados.Imprimir(1039, 0, Modo, '', _('Comprobante de Ingreso Egreso'), frIngresosEgresos, frxIngresosEgresos, HYReport, nil);
  CierraData(DMListados);
end;

procedure TDMTicketVenta.frxIngresosEgresosBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

procedure TDMTicketVenta.frIngresosEgresosBeforePrint(Memo: TStringList; View: TfrView);
begin
  DMListados.BeforePrint(Memo, View);
end;

procedure TDMTicketVenta.frIngresosEgresosGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);
end;

procedure TDMTicketVenta.frxIngresosEgresosGetValue(const VarName: string; var Value: variant);
begin
  frIngresosEgresosGetValue(VarName, Value);
end;

procedure TDMTicketVenta.RefrescaTotales;
begin
  xInfoActualizada.Close;
  xInfoActualizada.Open;
end;

function TDMTicketVenta.DameCarnetAplicadorTercero(Tercero: integer): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CARNET_APLICADOR FROM SYS_TERCEROS WHERE TERCERO  = :TERCERO';
        Params.ByName['TERCERO'].AsInteger := Tercero;
        ExecQuery;
        Result := FieldByName['CARNET_APLICADOR'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMTicketVenta.DameCarnetAplicador: string;
begin
  Result := '';

  if (QMCabeceraCLIENTE.AsInteger > 0) then
     Result := DameCarnetAplicadorTercero(DameTercero('CLI', QMCabeceraCLIENTE.AsInteger))
  else
  if (QMNIFTERCERO.AsInteger > 0) then
     Result := DameCarnetAplicadorTercero(QMNIFTERCERO.AsInteger);
end;

procedure TDMTicketVenta.ActualizaDatosIniSincronizacion(NumeroDosificacion, Rit, Sesion: integer; ModoTrabajo: string);
var
  oIni : TIniFile;
  FicheroSincronizacion : string;
begin
  if (TPVSincronizacion and (REntorno.MaquinaSincronizacion = 'online')) then
  begin
     FicheroSincronizacion := DMMain.DameRutaFicheroDeSincronizacion(QMCabeceraSerie.AsString) + 'TPV-sincronizacion_' + QMCabeceraSERIE.AsString + '.ini';
     if (FileExists(FicheroSincronizacion)) then
     begin
        try
           oIni := TIniFile.Create(FicheroSincronizacion);
           try
              if (NumeroDosificacion > 0) then
                 oIni.WriteString('Datos', 'NumeroTicket', IntToStr(NumeroDosificacion));
              oIni.WriteString('Datos', 'RIT', IntToStr(Rit));
              oIni.WriteString('Datos', 'Sesion', IntToStr(Sesion));
              oIni.WriteString('Datos', 'Modo_trabajo', ModoTrabajo);
           finally
              oIni.Free;
           end;
        except
           ShowMessage(Format(_('No se puede escribir en : %s.'), [FicheroSincronizacion]));
        end;
     end
     else
        ShowMessage(_('No existe el fichero de configuracion para la sincronización'));
  end;
end;

function TDMTicketVenta.RequiereRegistroFitosanitario(ID_A: integer): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT TIPO_REGISTRO_FITOSANITARIO ');
        SQL.Add(' FROM ART_ARTICULOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_A = :ID_A ');
        Params.ByName['ID_A'].AsInteger := ID_A;
        ExecQuery;
        Result := (FieldByName['TIPO_REGISTRO_FITOSANITARIO'].AsString) <> 'Z';
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMTicketVenta.ExisteCabeceraNIF(ID_TICKET: integer): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT COUNT(EMPRESA) ');
        SQL.Add(' FROM GES_CABECERAS_S_FAC_NIF ');
        SQL.Add(' WHERE ');
        SQL.Add(' TIPO = :TIPO AND ');
        SQL.Add(' ID_S = :ID_TICKET ');
        Params.ByName['TIPO'].AsString := 'TIC';
        Params.ByName['ID_TICKET'].AsInteger := ID_TICKET;
        ExecQuery;
        Result := (FieldByName['COUNT'].AsInteger) > 0;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMTicketVenta.PuedoInsertarFormaPago(Importe: double): boolean;
begin
  if (importe <> 0) then
     Result := True
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT COUNT(EMPRESA) AS CUANTOS FROM VER_TICKET_FP ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SQL.Add(' CANAL = ?CANAL AND ');
           SQL.Add(' SERIE = ?SERIE AND ');
           SQL.Add(' TIPO = ?TIPO AND ');
           SQL.Add(' RIT = ?RIT ');

           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
           Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
           Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
           Params.ByName['RIT'].AsInteger := QMCabeceraRIT.AsInteger;
           ExecQuery;
           Result := (FieldByName['CUANTOS'].AsInteger = 0);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMTicketVenta.xSubfamiliaAfterOpen(DataSet: TDataSet);
begin
  SaltandoArticulos := 0;
  // FiltraArticulos(xFamiliaID_FAMILIA.AsInteger);
end;

procedure TDMTicketVenta.xSubfamiliaBeforeScroll(DataSet: TDataSet);
begin
  SaltandoArticulos := 0;
  // FiltraArticulos(xFamiliaID_FAMILIA.AsInteger);
end;

procedure TDMTicketVenta.CrearNuevoCodigoBarra(Barras: string);
begin
  // Nuevo Codigo de Barras
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE A_ART_NUEVO_COD_BARRAS(:ID_A, :BARRAS)');
        Params.ByName['ID_A'].AsInteger := QMDetalle.FieldByName('ID_A').AsInteger;
        Params.ByName['BARRAS'].AsString := Barras;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMTicketVenta.DameDecuentoComercial(Cliente: integer): double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT DESCUENTO_CIAL FROM EMP_CLIENTES  ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' CLIENTE = :CLIENTE ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        ExecQuery;
        Result := FieldByName['DESCUENTO_CIAL'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTicketVenta.DameTotalesCajaTurno(var CantidadTickets, Liquido, Promedio: double);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT COUNT(*) AS CANTIDAD, SUM(LIQUIDO) AS LIQUIDO, SUM(LIQUIDO) / COUNT(*) AS PROMEDIO ');
        SQL.Add(' FROM GES_TICKET_CABECERA ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' TIPO = :TIPO AND ');
        SQL.Add(' SESION = :SESION AND ');
        SQL.Add(' CAJA = :CAJA AND ');
        SQL.Add(' TURNO = :TURNO AND ');
        SQL.Add(' FACTURACION = 0 AND ');
        SQL.Add(' ESTADO = 5 AND ');
        SQL.Add(' CAST(EXTRACT(YEAR FROM FECHA) || ''.''|| EXTRACT(MONTH FROM FECHA) || ''.''|| EXTRACT(DAY FROM FECHA) AS DATE) = :FECHA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['TIPO'].AsString := 'TIC';
        Params.ByName['SESION'].AsInteger := REntorno.Sesion;
        Params.ByName['CAJA'].AsInteger := REntorno.Caja;
        Params.ByName['TURNO'].AsInteger := REntorno.Turno;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH;
        ExecQuery;
        CantidadTickets := FieldByName['CANTIDAD'].AsFloat;
        Liquido := FieldByName['LIQUIDO'].AsFloat;
        Promedio := FieldByName['PROMEDIO'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTicketVenta.AsignaEmailTicket(Email: string; IdTicket: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE OR INSERT INTO GES_TICKET_DATOS ( ');
        SQL.Add(' ID_TICKET, EMAIL) ');
        SQL.Add(' VALUES ( ');
        SQL.Add(' :ID_TICKET, :EMAIL) ');
        SQL.Add(' MATCHING (ID_TICKET) ');
        Params.ByName['ID_TICKET'].AsInteger := IdTicket;
        Params.ByName['EMAIL'].AsString := Email;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMTicketVenta.DameEmailTicket(ID_Ticket: integer): string;
begin
  /// Tomo el email del cliente del ticket.
  /// Si es un cliente vario o el cliente no tiene email, tomo el email del GES_TICKET_DATOS

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT D.EMAIL EMAIL_DATOS, C.CLIENTE, T.EMAIL EMAIL_CLIENTE ');
        SQL.Add(' FROM GES_TICKET_CABECERA C ');
        SQL.Add(' LEFT JOIN GES_TICKET_DATOS D ON C.ID_TICKET = D.ID_TICKET ');
        SQL.Add(' JOIN EMP_CLIENTES CL ON C.EMPRESA = CL.EMPRESA AND C.CLIENTE = CL.CLIENTE ');
        SQL.Add(' JOIN SYS_TERCEROS T ON CL.TERCERO = T.TERCERO ');
        SQL.Add(' WHERE ');
        SQL.Add(' C.ID_TICKET = :ID_TICKET ');
        Params.ByName['ID_TICKET'].AsInteger := ID_Ticket;
        ExecQuery;

        Result := Trim(FieldByName['EMAIL_DATOS'].AsString);
        if ((FieldByName['CLIENTE'].AsInteger > 0) and (Trim(FieldByName['EMAIL_CLIENTE'].AsString) > '')) then
           Result := Trim(FieldByName['EMAIL_CLIENTE'].AsString);

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMTicketVenta.DameCategoriaCliente(Cliente: integer): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT CATEGORIA ');
        SQL.Add(' FROM EMP_CLIENTES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' CLIENTE = :CLIENTE ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        ExecQuery;

        Result := Trim(FieldByName['CATEGORIA'].AsString);

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMTicketVenta.DameClienteTercero(Tercero: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT CLIENTE ');
        SQL.Add(' FROM EMP_CLIENTES ');
        SQL.Add(' WHERE ');
        SQL.Add(' TERCERO = :TERCERO ');
        Params.ByName['TERCERO'].AsInteger := Tercero;
        ExecQuery;

        Result := FieldByName['CLIENTE'].AsInteger;

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMTicketVenta.TicketAAlbaran;
begin
  // Ahora lo traspaso a albaran
  AbreData(TDMFacturarTickets, DMFacturarTickets);
  try
     DMFacturarTickets.TicketAAlbaran(QMCabeceraID_TICKET.AsInteger, QMCabeceraSERIE.AsString);
  finally
     CierraData(DMFacturarTickets);
  end;
end;

function TDMTicketVenta.ExisteFormaPagoRemesable: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 G.REMESAR ');
        SQL.Add(' FROM GES_TICKET_FP T ');
        SQL.Add(' JOIN CON_CUENTAS_GES_FP G ON T.EMPRESA = G.EMPRESA AND T.EJERCICIO = G.EJERCICIO AND T.CANAL = G.CANAL AND T.FORMA_PAGO = G.FORMA_PAGO ');
        SQL.Add(' WHERE ');
        SQL.Add(' T.EMPRESA = :EMPRESA AND ');
        SQL.Add(' T.EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' T.CANAL = :CANAL AND ');
        SQL.Add(' T.SERIE = :SERIE AND ');
        SQL.Add(' T.TIPO = :TIPO AND ');
        SQL.Add(' T.RIT = :RIT AND ');
        SQL.Add(' G.REMESAR = 1 ');
        Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
        Params.ByName['TIPO'].AsString := QMCabeceraTIPO.AsString;
        Params.ByName['RIT'].AsInteger := QMCabeceraRIT.AsInteger;
        ExecQuery;
        Result := (FieldByName['REMESAR'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMTicketVenta.FormaPagoTransferencia(Cliente: integer): string;
begin
  /// Obtiene la forma de pago del cliente que sea de tipo Transferencia
  /// Si no tiene devuelve vacio
  /// *** SOLO PARA CLIENTES > 0 ***

  Result := '';
  if (Cliente > 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT CC.FORMA_PAGO ');
           SQL.Add(' FROM CON_CUENTAS_GES_CLI CC ');
           SQL.Add(' JOIN EMP_CLIENTES C ON C.EMPRESA = CC.EMPRESA AND C.CLIENTE = CC.CLIENTE ');
           SQL.Add(' JOIN SYS_TERCEROS T ON T.TERCERO = C.TERCERO ');
           SQL.Add(' JOIN CON_CUENTAS_GES_FP F ON F.EMPRESA = CC.EMPRESA AND F.EJERCICIO = CC.EJERCICIO AND F.CANAL = CC.CANAL AND F.FORMA_PAGO = CC.FORMA_PAGO ');
           SQL.Add(' WHERE ');
           SQL.Add(' CC.EMPRESA = :EMPRESA AND ');
           SQL.Add(' CC.EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CC.CANAL = :CANAL AND ');
           SQL.Add(' CC.CLIENTE = :CLIENTE AND ');
           SQL.Add(' F.TIPO_EFECTO = ''TRN'' ');
           Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
           Params.ByName['CLIENTE'].AsInteger := Cliente;
           ExecQuery;
           Result := FieldByName['FORMA_PAGO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

end.
