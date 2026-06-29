unit UDMLstFactura;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBQuery, FIBDatabase, UFIBModificados, UHYReport, HYFIBQuery, FIBDataSetRO,
  UHYReportMail, ALetras, FR_Pars, frxClass, frxHYReport, frxDBSet,
  FIBTableDataSetRO, Variants, ShellApi, DBClient;

type
  TDMLstFactura = class(TDataModule)
     frFactura: TfrHYReport;
     frDBCabecera: TfrDBDataSet;
     frDBdetalle: TfrDBDataSet;
     DSCabecera: TDataSource;
     DSDetalle: TDataSource;
     DSxCliente: TDataSource;
     frUDPie: TfrUserDataset;
     frDBxDatosIva: TfrDBDataSet;
     DSxDatosIva: TDataSource;
     DSxAgente: TDataSource;
     frDBDxAgente: TfrDBDataSet;
     DSxFormaPago: TDataSource;
     frDBxFormaPago: TfrDBDataSet;
     frUserDataset1: TfrUserDataset;
     frDBxCuenta: TfrDBDataSet;
     DSxCuenta: TDataSource;
     DSxTerceroBanco: TDataSource;
     frDBxTerceroBanco: TfrDBDataSet;
     DSxNombreBanco: TDataSource;
     frDBxNombreBanco: TfrDBDataSet;
     DSxRecibos: TDataSource;
     frDBxRecibos: TfrDBDataSet;
     FRUDNotasArt: TfrUserDataset;
     frDBxCliente: TfrDBDataSet;
     DSxDireccion_Cliente: TDataSource;
     DSxNombreIva: TDataSource;
     frDBxDireccion_Cliente: TfrDBDataSet;
     frDBxNombreIva: TfrDBDataSet;
     DSQSPProcedencia: TDataSource;
     frDBQSPProcedencia: TfrDBDataSet;
     DSxNotasCliente: TDataSource;
     frDBxNotasCliente: TfrDBDataSet;
     DSxRuta: TDataSource;
     frDBxRuta: TfrDBDataSet;
     DSxDireccionFiscal: TDataSource;
     frDBxDireccionFiscal: TfrDBDataSet;
     DSxDatosBancarios: TDataSource;
     frDBxDatosBancarios: TfrDBDataSet;
     DSxEntidad: TDataSource;
     frDBxEntidad: TfrDBDataSet;
     TLocal: THYTransaction;
     DSDobleCabecera: TDataSource;
     frDBDobleCabecera: TfrDBDataSet;
     DSxDobFormaPago: TDataSource;
     frDBxDobFormaPago: TfrDBDataSet;
     DSxDobTerceroBan: TDataSource;
     frDBxDobTerceroBan: TfrDBDataSet;
     DSxDobNomBan: TDataSource;
     frDBxDobNomBan: TfrDBDataSet;
     HYReport: THYReport;
     HYRSCabecera: THYReportSource;
     HYRSxCliente: THYReportSource;
     HYRSxDireccionCliente: THYReportSource;
     HYRSDetalle: THYReportSource;
     HYRSDetalleIVA: THYReportSource;
     HYRSxFormaPago: THYReportSource;
     HYRSxAgente: THYReportSource;
     HYRSxNombreIVA: THYReportSource;
     HYRSRuta: THYReportSource;
     QUnidadesExt: THYFIBQuery;
     DSxTercero: TDataSource;
     frDBxTransportista: TfrDBDataSet;
     DSxTransportistas: TDataSource;
     frUserNotasCab: TfrUserDataset;
     DobleCabecera: TFIBDataSetRO;
     xDobFormaPago: TFIBDataSetRO;
     xDobTerceroBan: TFIBDataSetRO;
     xDobNomBan: TFIBDataSetRO;
     QSPProcedencia: TFIBDataSetRO;
     xNombreBanco: TFIBDataSetRO;
     xRecibos: TFIBDataSetRO;
     xDireccion_Cliente: TFIBDataSetRO;
     xNotasCliente: TFIBDataSetRO;
     xDireccionFiscal: TFIBDataSetRO;
     xNombreIva: TFIBDataSetRO;
     xTercero: TFIBDataSetRO;
     xTransportistas: TFIBDataSetRO;
     xEntidad: TFIBDataSetRO;
     xDatosBancarios: TFIBDataSetRO;
     xRuta: TFIBDataSetRO;
     xTerceroBanco: TFIBDataSetRO;
     xDatosIva: TFIBDataSetRO;
     xAgente: TFIBDataSetRO;
     xFormaPago: TFIBDataSetRO;
     xCuenta: TFIBDataSetRO;
     xCliente: TFIBDataSetRO;
     QMDetalle: TFIBDataSetRO;
     QMCabecera: TFIBDataSetRO;
     HYRxTercero: THYReportSource;
     HYRDobleCabecera: THYReportSource;
     HYRxDobFormaPago: THYReportSource;
     HYRxDobTerceroBan: THYReportSource;
     HYRDobNomBan: THYReportSource;
     xDobNotasClientes: TFIBDataSetRO;
     DSxDobNotasClientes: TDataSource;
     frDBxDobNotasClientes: TfrDBDataSet;
     HYRxDobNotasClientes: THYReportSource;
     DSxDobRecibos: TDataSource;
     frDBxDobRecibos: TfrDBDataSet;
     xDobRecibos: TFIBDataSetRO;
     xDobDireccionCliente: TFIBDataSetRO;
     DSxDobDireccionCliente: TDataSource;
     frDBxDobDireccionCliente: TfrDBDataSet;
     HYRDobRecibos: THYReportSource;
     HYRDobDireccionCliente: THYReportSource;
     xDobleIva: TFIBDataSetRO;
     HYRSDobleIva: THYReportSource;
     xDobleRecibos: TFIBDataSetRO;
     HYRDobleRecibos: THYReportSource;
     SPObtenerVtos: TFIBDataSetRO;
     HYReportMail: THYReportMail;
     HYMSCabecera: THYReportMailSource;
     HYMSDetalle: THYReportMailSource;
     HYMSxCliente: THYReportMailSource;
     HYMSxDireccionCliente: THYReportMailSource;
     HYMSDetalleIVA: THYReportMailSource;
     HYMSxFormaPago: THYReportMailSource;
     HYMSxAgente: THYReportMailSource;
     HYMSxNombreIVA: THYReportMailSource;
     HYMSRuta: THYReportMailSource;
     HYMSxTercero: THYReportMailSource;
     HYMDobleCabecera: THYReportMailSource;
     HYMxDobTerceroBan: THYReportMailSource;
     HYMDobRecibos: THYReportMailSource;
     HYMxDobFormaPago: THYReportMailSource;
     HYMxDobNotasClientes: THYReportMailSource;
     HYMDobDireccionCliente: THYReportMailSource;
     HYMSDobleIva: THYReportMailSource;
     HYMDobNomBan: THYReportMailSource;
     HYMDobreRecibos: THYReportMailSource;
     Letras: TLetra;
     HYRSxCuenta: THYReportSource;
     xNroSerie: TFIBDataSetRO;
     DSxNroSerie: TDataSource;
     HYRSxNroSerie: THYReportSource;
     QSPProcedencia_kri: TFIBDataSetRO;
     DSQSPProcedencia_kri: TDataSource;
     HYRSQSPProcedencia: THYReportSource;
     HYRSxRecibos: THYReportSource;
     xLotes: TFIBDataSetRO;
     DSxLotes: TDataSource;
     frDBxLotes: TfrDBDataSet;
     HYxLotes: THYReportSource;
     xUpdateaDocumentos: TFIBDataSetRO;
     QGen: THYFIBQuery;
     frDBxNroSerie: TfrDBDataSet;
     xEmpresa: TFIBDataSetRO;
     DSxEmpresa: TDataSource;
     xArticulos: TFIBDataSetRO;
     DSxArticulos: TDataSource;
     frDBxArticulos: TfrDBDataSet;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     QLoteKri: TFIBDataSetRO;
     QNroSerieKri: TFIBDataSetRO;
     QSPProcedencia2_kri: TFIBDataSetRO;
     xDireccionKRI: TFIBDataSetRO;
     DSxDireccionKRI: TDataSource;
     HYRxDirecionKRI: THYReportSource;
     xDireccionesNIF: TFIBTableSetRO;
     xDobDireccionesNIF: TFIBTableSetRO;
     xAutofactura: TFIBDataSetRO;
     xDobDireccionAlbKri: TFIBDataSetRO;
     DSxDobDireccionAlbKri: TDataSource;
     xDobleDireccionEDI: TFIBDataSetRO;
     DSxDobleDireccionEDI: TDataSource;
     xMonedasIdiomas: TFIBDataSetRO;
     DSxMonedasIdiomas: TDataSource;
     DSxNombreIvaIdioma: TDataSource;
     xNombreIvaIdioma: TFIBDataSetRO;
     xFormaPagoIdioma: TFIBDataSetRO;
     DSxFormaPagoIdioma: TDataSource;
     HYRSxArticulos: THYReportSource;
     frDBxGarantiasKri: TfrDBDataSet;
     DSxGarantiasKri: TDataSource;
     xGarantiasKri: TFIBDataSetRO;
     frDBPromociones: TfrDBDataSet;
     QMPromociones: TFIBDataSetRO;
     DSQMPromociones: TDataSource;
     xArticulosPRM: TFIBDataSetRO;
     DSxArticulosPRM: TDataSource;
     frDBxArticulosPRM: TfrDBDataSet;
     frUDNotasArtPRM: TfrUserDataset;
     HYRSPromociones: THYReportSource;
     HYMSPromociones: THYReportMailSource;
     frxDBDetalle: TfrxDBDataset;
     frxDBxNroSerie: TfrxDBDataset;
     frxDBPromociones: TfrxDBDataset;
     frxDBxDatosIva: TfrxDBDataset;
     frxDBxRecibos: TfrxDBDataset;
     frxDBCabecera: TfrxDBDataset;
     frxUDNotasArtPRM: TfrxUserDataSet;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     xProyectosDetalle: TFIBDataSetRO;
     DSxProyectosDetalle: TDataSource;
     frxFactura: TfrxHYReport;
     xHerenciaALB: TFIBDataSetRO;
     xHerenciaPEC: TFIBDataSetRO;
     xHerenciaOFC: TFIBDataSetRO;
     DSxHerenciaALB: TDataSource;
     DSxHerenciaPEC: TDataSource;
     DSxHerenciaOFC: TDataSource;
     DSDetalleUE: TDataSource;
     QMDetalleUE: TFIBDataSetRO;
     DSDireccionEntregaLinea: TDataSource;
     xDireccionEntregaLinea: TFIBDataSetRO;
     DSCuota: TDataSource;
     xCuota: TFIBDataSetRO;
     NrosSerieAlquiler: TClientDataSet;
     NrosSerieAlquilerEMPRESA: TIntegerField;
     NrosSerieAlquilerCANAL: TIntegerField;
     NrosSerieAlquilerCODIGO: TIntegerField;
     NrosSerieAlquilerALMACEN: TStringField;
     NrosSerieAlquilerARTICULO: TStringField;
     NrosSerieAlquilerNSERIE: TStringField;
     NrosSerieAlquilerSELECCIONADO: TIntegerField;
     DSNrosSerieAlquiler: TDataSource;
     frDBNrosSerieAlquiler: TfrDBDataSet;
     NrosSerieAlquilerUNIDADES: TFloatField;
     xRecibosAnticipos: TFIBDataSetRO;
     DSxRecibosAnticipos: TDataSource;
     xTotalRecibosAnticipos: TFIBDataSetRO;
     DSxTotalRecibosAnticipos: TDataSource;
     frDBxRecibosAnticipos: TfrDBDataSet;
     frDBxTotalRecibosAnticipos: TfrDBDataSet;
     xLstFirmas: TFIBDataSetRO;
     DSxLstFirmas: TDataSource;
     frDBDLstFirmas: TfrDBDataSet;
     frxDBxLstFirmas: TfrxDBDataset;
     frDBGrupoTalla: TfrDBDataSet;
     DSGrupoTalla: TDataSource;
     HYRSGrupoTalla: THYReportSource;
     QMGrupoTalla: TFIBDataSetRO;
     HYRMGrupoTalla: THYReportMailSource;
     frxDBGrupoTalla: TfrxDBDataset;
     frDBTituloTalla: TfrDBDataSet;
     DSTituloTalla: TDataSource;
     HYRSTituloTalla: THYReportSource;
     QMTituloTalla: TFIBDataSetRO;
     HYRMTituloTalla: THYReportMailSource;
     frxDBTituloTalla: TfrxDBDataset;
     frDBDetalleTallas: TfrDBDataSet;
     DSDetalleTallas: TDataSource;
     HYRSDetalleTallas: THYReportSource;
     QMDetalleTallas: TFIBDataSetRO;
     HYRMDetalleTallas: THYReportMailSource;
     frxDBDetalleTallas: TfrxDBDataset;
     QMArticuloTallas: TFIBDataSetRO;
     DSArticuloTallas: TDataSource;
     xContacto: TFIBDataSetRO;
     DSxContacto: TDataSource;
     QMEscandallo: TFIBDataSetRO;
     DSEscandallo: TDataSource;
     frDBDEscandallo: TfrDBDataSet;
     HYRSEscandallo: THYReportSource;
     xTipoPorte: TFIBDataSetRO;
     DSxTipoPorte: TDataSource;
     xDobTipoPorte: TFIBDataSetRO;
     DSxDobTipoPorte: TDataSource;
     xReferenciaDte: TFIBDataSetRO;
     DSxReferenciaDte: TDataSource;
     frDBxReferenciaDte: TfrDBDataSet;
     xArticulosIdioma: TFIBDataSetRO;
     DSxArticulosIdioma: TDataSource;
     frDBxArticulosIdioma: TfrDBDataSet;
     xArticuloTYC: TFIBDataSetRO;
     DSxArticuloTYC: TDataSource;
     xDobleContacto: TFIBDataSetRO;
     DSxDobleContacto: TDataSource;
     DobleLetras: TLetra;
     QMDetallePorClienteOrigen: TFIBDataSetRO;
     DSQMDetallePorClienteOrigen: TDataSource;
     frDBQMDetallePorClienteOrigen: TfrDBDataSet;
     frxDBQMDetallePorClienteOrigen: TfrxDBDataset;
     xCabReparacion: TFIBDataSetRO;
     DSxCabReparacion: TDataSource;
     frDBxCabReparacion: TfrDBDataSet;
     frxDBxCabReparacion: TfrxDBDataset;
     xRecepcion: TFIBDataSetRO;
     frxDBxRecepcion: TfrxDBDataset;
     frDBxRecepcion: TfrDBDataSet;
     DSxRecepcion: TDataSource;
     xFichaTecnica: TFIBDataSetRO;
     DSxFichaTecnica: TDataSource;
     frDBxFichaTecnica: TfrDBDataSet;
     frxDBxFichaTecnica: TfrxDBDataset;
     xVerifactu: TFIBDataSetRO;
     DSxVerifactu: TDataSource;
     xECF: TFIBDataSetRO;
     DSxECF: TDataSource;
     xECFDOCUMENT_STAMP_URL: TFIBStringField;
     xECFSTAMP_DATE: TFIBStringField;
     xECFSECURITY_CODE: TFIBStringField;
     procedure frFacturaGetValue(const ParName: string; var ParValue: variant);
     procedure DMLstFacturaDestroy(Sender: TObject);
     procedure frFacturaEnterRect(Memo: TStringList; View: TfrView);
     procedure DMLstFacturaCreate(Sender: TObject);
     procedure QMDetalleAfterScroll(DataSet: TDataSet);
     procedure FRUDNotasArtCheckEOF(Sender: TObject; var EOF: boolean);
     procedure FRUDNotasArtFirst(Sender: TObject);
     procedure FRUDNotasArtNext(Sender: TObject);
     procedure QMCabeceraAfterScroll(DataSet: TDataSet);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure xClienteAfterOpen(DataSet: TDataSet);
     procedure xTerceroBancoAfterOpen(DataSet: TDataSet);
     procedure DobleCabeceraAfterScroll(DataSet: TDataSet);
     procedure HYReportEnterFields(Sender: THYReport; Field: UHYReport.THYField; var Source: string);
     procedure frUserNotasCabCheckEOF(Sender: TObject; var EOF: boolean);
     procedure frUserNotasCabFirst(Sender: TObject);
     procedure frUserNotasCabNext(Sender: TObject);
     procedure HYReportMailEnterFields(Sender: THYReportMail; Field: THYField; var Source: string);
     procedure HYReportPrepareFields(Sender: THYReport; Field: UHYReport.THYField; Contents: TStrings);
     procedure HYReportLengthBands(Sender: THYReport; Band: THYBand; var Length: integer);
     procedure frFacturaPrintReport;
     procedure HYReportPrintReport(Sender: THYReport);
     procedure frFacturaUserFunction(const Name: string; p1, p2, p3: variant; var Val: variant);
     procedure QMPromocionesAfterOpen(DataSet: TDataSet);
     procedure QMPromocionesAfterScroll(DataSet: TDataSet);
     procedure frUDNotasArtPRMCheckEOF(Sender: TObject; var EOF: boolean);
     procedure frUDNotasArtPRMFirst(Sender: TObject);
     procedure frUDNotasArtPRMNext(Sender: TObject);
     procedure frxFacturaGetValue(const VarName: string; var Value: variant);
     procedure frxFacturaBeforePrint(Sender: TfrxReportComponent);
     procedure frxFacturaPrintReport(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMDetalleBeforeClose(DataSet: TDataSet);
     procedure xClienteBeforeClose(DataSet: TDataSet);
     procedure xTerceroBancoBeforeClose(DataSet: TDataSet);
     procedure xDatosBancariosAfterOpen(DataSet: TDataSet);
     procedure xDatosBancariosBeforeClose(DataSet: TDataSet);
     procedure DobleCabeceraAfterOpen(DataSet: TDataSet);
     procedure DobleCabeceraBeforeClose(DataSet: TDataSet);
     procedure xDobTerceroBanAfterOpen(DataSet: TDataSet);
     procedure xDobTerceroBanBeforeClose(DataSet: TDataSet);
     procedure QMPromocionesBeforeClose(DataSet: TDataSet);
     procedure xHerenciaALBAfterOpen(DataSet: TDataSet);
     procedure xHerenciaPECAfterOpen(DataSet: TDataSet);
     procedure xCuotaAfterOpen(DataSet: TDataSet);
     function frxFacturaUserFunction(const MethodName: string; var Params: variant): variant;
     procedure QMGrupoTallaAfterOpen(DataSet: TDataSet);
     procedure QMGrupoTallaBeforeClose(DataSet: TDataSet);
     procedure QMDetalleTallasAfterOpen(DataSet: TDataSet);
     procedure QMDetalleTallasBeforeClose(DataSet: TDataSet);
     procedure xCabReparacionAfterOpen(DataSet: TDataSet);
     procedure xCabReparacionBeforeClose(DataSet: TDataSet);
     procedure frxFacturaProgress(Sender: TfrxReport; ProgressType: TfrxProgressType; Progress: integer);
     procedure frxFacturaProgressStart(Sender: TfrxReport; ProgressType: TfrxProgressType; Progress: integer);
     procedure frxFacturaProgressStop(Sender: TfrxReport; ProgressType: TfrxProgressType; Progress: integer);
  private
     SW, id_s_aux, TipoListado, FiltroGen, n_imagen: integer;
     SerieGen: string;
     ActivaBanco, final, subir, detalle_con_origen{,MostrarNotas}: boolean;
     sub, subtotal, PrecioExt, P_IvaUnico, P_REUnico, totalptoverde, precioverdeln: double;
     ric, ric_prm, NotasCab: TStringList;
     j, x, indNotas: integer;
     doc: string;
     MedidasExt: string;
     Pagina: integer;
     IVA, VENCIMIENTO: smallint;
     Fecha_pedido, fecha_albaran: TDateTime;
     LocalMascaraN, LocalMascaraL: string;
     LocalMascaraNSec, Moneda_Sec: string;
     FacturaAnt, LineaAnt: integer;
     Vencimientos2, dto_vacio: string;
     nro_serie: string;
     // Factura Electronica Mexico
     TipoDeComprobante: string;
     FormaPagoMX: string;
     MetodoDePago: string;
     NumCtaPago: string;
     CondicionesDePago: string;
     MarcarListado: boolean;
     Param_MODREST017: boolean;
     Param_MODREST003: boolean;
     Param_LSTOFAC001: string;
     Param_LSTOFAC002: string;
     Param_LSTOFAC003: string;
     Param_LSTFAC0003: boolean;
     CarpetaGuardadoForzado: string;
     copia: integer;
     albaran_anterior: string;
     z_peso_neto: double; // Para listado de arroceras
     function GetAlbaranProcedencia: string;
     function DameHerencia(d_tipo: string): string;
     procedure DameFecha(o_tipo: string; rig: integer);
     function ObtenerVtos: string;
     function DameTicketBAI(id_s: integer): string;
  public
     nombreFich, rutaFich: string;
     procedure MostrarListadoFiltrado(Modo: byte);
     procedure MostrarListado(ID_S, rig: integer; Serie: string; Modo, Numero: integer; const Ejercicio: integer; ForzarCopias: boolean = False; Copias: integer = 0; aMarcarListado: boolean = True);
     procedure MostrarListadoDiario(Serie: string; const Ejercicio: integer);
     procedure MostrarListadoMatricialDirecta(ID_S, rig: integer; Serie: string; Modo: byte; const Ejercicio: integer; ForzarCopias: boolean = False; Copias: integer = 0);
     procedure MatricialesEnterFields(var Source: string);
     procedure MostrarListadoMail(id_s: integer; Serie: string; Modo: integer; const Ejercicio: integer; var Memo: TStrings; aMarcarListado: boolean = True);
     procedure UpdateaDocumentos;
     procedure ForzarGuardado(Carpeta: string);
     procedure ExportarExcel(ID_S: integer; Archivo: string);
  end;

var
  DMLstFactura : TDMLstFactura;

implementation

uses UDMMain, UEntorno, UFMFacturas, UFormGest, UDMListados, UUtiles,
  PsFR_E_PDF, frxRich, frxDMPExport, UDMFirmaElectronica, UDMRecibosFactura, ExtCtrls, UParam, IdGlobalProtocols,
  UFMain, UHojaCalc, UFSendCorreo, UDameDato, UImagenes;

{$R *.DFM}

procedure TDMLstFactura.DMLstFacturaCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Abrir la transacción local
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  AbreData(TDMRecibosFactura, DMRecibosFactura);

  // Carpeta en la que se guarda una copia del documento en formato PDF.
  CarpetaGuardadoForzado := '';

  // Crear StringLists para las notas por artículo y para la cabecera
  ric := TStringList.Create;
  ric_prm := TStringList.Create;
  NotasCab := TStringList.Create;

  ActivaBanco := False;
  FacturaAnt := -1000;
  LineaAnt := -1000;
  subir := False;
  detalle_con_origen := False;
  dto_vacio := ' ';
  // MostrarNotas := False;

  Param_MODREST017 := (LeeParametro('MODREST017') = 'S');
  Param_MODREST003 := (LeeParametro('MODREST003') = 'S');
  Param_LSTOFAC001 := LeeParametro('LSTOFAC001');
  Param_LSTOFAC002 := LeeParametro('LSTOFAC002');
  Param_LSTOFAC003 := LeeParametro('LSTOFAC003');
  Param_LSTFAC0003 := (LeeParametro('LSTFAC0003') = 'S');

  if Param_MODREST017 then
  begin
     with QMGrupoTalla do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' /* Los distintos grupos de talla que intervienen en el detalle del documento */ ');
        SelectSQL.Add(' /* Solo los que tienen lineas con unidades */ ');
        if (Param_LSTOFAC003 = 'S') then
           SelectSQL.Add(' SELECT DISTINCT X.ID_S, X.O_ID_S, X.ID_G_T, G.TITULO, X.O_DOC, C.* ')
        else
           SelectSQL.Add(' SELECT DISTINCT X.ID_S, X.ID_G_T, G.TITULO, CAST(0 AS INTEGER) O_ID_S ');
        SelectSQL.Add(' FROM XVER_DETALLES_S_GR_RO_LST(:ID_S, 0, -1) X ');
        SelectSQL.Add(' JOIN ART_GRUPOS_TALLAS G ON X.ID_G_T = G.ID_G_T ');
        SelectSQL.Add(' LEFT JOIN GES_CABECERAS_S C ON X.O_ID_S = C.ID_S ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' (ABS(COALESCE(X.T01, 0)) + ABS(COALESCE(X.T02, 0)) + ABS(COALESCE(X.T03, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T04, 0)) + ABS(COALESCE(X.T05, 0)) + ABS(COALESCE(X.T06, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T07, 0)) + ABS(COALESCE(X.T08, 0)) + ABS(COALESCE(X.T09, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T10, 0)) + ABS(COALESCE(X.T11, 0)) + ABS(COALESCE(X.T12, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T13, 0)) + ABS(COALESCE(X.T14, 0)) + ABS(COALESCE(X.T15, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T16, 0)) + ABS(COALESCE(X.T17, 0)) + ABS(COALESCE(X.T18, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T19, 0)) + ABS(COALESCE(X.T20, 0)) + ABS(COALESCE(X.T21, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T22, 0))) > 0 ');
        if (Param_LSTOFAC003 = 'S') then
           SelectSQL.Add(' ORDER BY X.O_DOC, X.ID_G_T DESC ')
        else
           SelectSQL.Add(' ORDER BY X.ID_G_T DESC ');
     end;
  end;

  QMDetalle.Close;
  with QMDetalle.SelectSQL do
  begin
     Clear;
     if not Param_LSTFAC0003 then
     begin
        Add(' SELECT * FROM VER_DETALLE_FACTURA_LST ');
        Add(' WHERE ');
        Add(' ID_S = ?ID_S ');
        // 231 - 1 - Listados de FAC, muestra las promociones como a linea mas. (No en un subdetalle)
        if (DMMain.EstadoKri(231) <> 1) then
           Add(' AND TIPO_LINEA <> ''PRM'' ');
        if ((Param_LSTOFAC001) = '') then
           Add(' ORDER BY ORDEN ')
        else
           Add(' ORDER BY ' + Param_LSTOFAC001);
     end
     else
     begin
        Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, MIN(LINEA) LINEA, CLIENTE, ALMACEN, ARTICULO, TITULO, ');
        Add('        SUM(UNIDADES) UNIDADES, PRECIO, PIEZAS_X_BULTO, SUM(BULTOS) BULTOS, DESCUENTO, DESCUENTO_2, DESCUENTO_3, ');
        Add('        COMISION, P_COSTE, MIN(M_MOV_STOCK) M_MOV_STOCK, TIPO_IVA, P_IVA, P_RECARGO, SUM(BRUTO) BRUTO, ');
        Add('        SUM(B_COMISION) B_COMISION, SUM(I_DESCUENTO) I_DESCUENTO, SUM(B_IMPONIBLE) B_IMPONIBLE, ');
        Add('        SUM(B_DTO_LINEA) B_DTO_LINEA, SUM(I_COMISION) I_COMISION, C_IVA, C_RECARGO, SUM(T_COSTE) T_COSTE, ');
        Add('        SUM(M_BRUTO) M_BRUTO, SUM(LIQUIDO) LIQUIDO, MIN(ENTRADA) ENTRADA, CAST(NULL AS BLOB SUB_TYPE 1) NOTAS, CAST(NULL AS BLOB SUB_TYPE 1) NOTAS2, UNIDADES_EXT, ');
        Add('        TOTAL_UNIDADES_EXT, LIST(NSERIE, '', '') NSERIE, UNIDADES_SEC, CENTRO_COSTE, MIN(ID_DETALLES_S) ID_DETALLES_S, ');
        Add('        ID_S, ID_A, ID_C_A, COMISION_LINEAL, SUM(I_COMISION_LINEAL) I_COMISION_LINEAL, FECHA_PRE_DET, FECHA_REC_DET, ');
        Add('        TITULO_IDIOMA, TIPO_LINEA_KRI, MIN(ORDEN) ORDEN, TIPO_LINEA, PROC_PROMOCION, MIN(ORIGEN) ORIGEN, MIN(ID_P) ID_P, ');
        Add('        FECHA_ANTICIPO, CTA_PAGO_ANTICIPO, APLICA_UNIDADES_SECUNDARIAS, PROYECTO, MIN(LINEA_RELACION) LINEA_RELACION, ');
        Add('        CERTIFICADO, CERT_NEGATIVO, CAST(NULL AS VARCHAR(15)) CRC_NOTAS, CAST(NULL AS VARCHAR(15)) CRC_NOTAS2, PRO_NUM_PLANO, TIPO_UNIDAD_LOGISTICA, ');
        Add('        TITULO_UNIDAD_LOGISTICA, U_POR_U_LOGISTICA, RELACIONAR_U_LOGISTICA, MIN(UNIDADES_LOGISTICAS) UNIDADES_LOGISTICAS, ');
        Add('        CUENTA, LIST(LOTE_SIMPLE, '', '') LOTE_SIMPLE, DIRECCION_ENTREGA, PAIS, COSTE_ADICIONAL, ID_IMAGEN, CODIGO_CLIENTE, ');
        Add('        TITULO_CLIENTE, MANIPULACION, ALFA_1, ALFA_2, ALFA_3, ALFA_4, ALFA_5, ALFA_6, ALFA_7, ALFA_8, ');
        Add('        INVERSION_SUJETO_PASIVO, DECIMALES_UNIDADES, SIGNO_UNIDADES, TIPO_IMPUESTO_ADICIONAL, P_IMPUESTO_ADICIONAL, ');
        Add('        LOTEABLE, SUM(CANT_LOTE) CANT_LOTE, MIN(ID_LOTE) ID_LOTE, MIN(LOTE) LOTE, MIN(PESO) PESO, ');
        Add('        SUM(PESO_TOTAL) PESO_TOTAL, SUM(PESO_REAL) PESO_REAL, MIN(O_ID_S) O_ID_S, MIN(O_ID_DETALLES_S) O_ID_DETALLES_S, ');
        Add('        MIN(O_DOC) O_DOC, MIN(O_DOC_DET) O_DOC_DET, ECOTASA, REQUIERE_LOTE_SIMPLE, ART_CODIGO_CLIENTE, ');
        Add('        TITULO_ART_CLIENTE, CAST(NULL AS VARCHAR(256)) NOTAS_PREPARACION ');
        Add(' FROM VER_DETALLE_FACTURA_LST ');
        Add(' WHERE ');
        Add(' ID_S = ?ID_S ');
        // 231 - 1 - Listados de FAC, muestra las promociones como a linea mas. (No en un subdetalle)
        if (DMMain.EstadoKri(231) <> 1) then
           Add(' AND TIPO_LINEA <> ''PRM'' ');
        Add(' GROUP BY EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, CLIENTE, ALMACEN, ARTICULO, TITULO, PRECIO, PIEZAS_X_BULTO, -- ');
        Add(' DESCUENTO, DESCUENTO_2, DESCUENTO_3, COMISION, P_COSTE, TIPO_IVA, P_IVA, P_RECARGO, C_IVA, C_RECARGO, UNIDADES_EXT, -- ');
        Add(' TOTAL_UNIDADES_EXT, UNIDADES_SEC, CENTRO_COSTE, ID_S, ID_A, ID_C_A, COMISION_LINEAL, FECHA_PRE_DET, FECHA_REC_DET, -- ');
        Add(' TITULO_IDIOMA, TIPO_LINEA_KRI, TIPO_LINEA, PROC_PROMOCION, FECHA_ANTICIPO, CTA_PAGO_ANTICIPO, -- ');
        Add(' APLICA_UNIDADES_SECUNDARIAS, PROYECTO, CERTIFICADO, CERT_NEGATIVO, PRO_NUM_PLANO, TIPO_UNIDAD_LOGISTICA, -- ');
        Add(' TITULO_UNIDAD_LOGISTICA, U_POR_U_LOGISTICA, RELACIONAR_U_LOGISTICA, CUENTA, DIRECCION_ENTREGA, PAIS, COSTE_ADICIONAL, -- ');
        Add(' ID_IMAGEN, CODIGO_CLIENTE, TITULO_CLIENTE, MANIPULACION, ALFA_1, ALFA_2, ALFA_3, ALFA_4, ALFA_5, ALFA_6, ALFA_7, ALFA_8, -- ');
        Add(' INVERSION_SUJETO_PASIVO, DECIMALES_UNIDADES, SIGNO_UNIDADES, TIPO_IMPUESTO_ADICIONAL, P_IMPUESTO_ADICIONAL, LOTEABLE, -- ');
        Add(' ECOTASA, REQUIERE_LOTE_SIMPLE, ART_CODIGO_CLIENTE, TITULO_ART_CLIENTE ');
        Add(' ORDER BY MIN(ORDEN) ');
     end;
  end;

  Letras.DescDecimales := _('céntimos');
  Letras.Separador := DecimalSeparator;
  DobleLetras.DescDecimales := _('céntimos');
  DobleLetras.Separador := DecimalSeparator;
  NrosSerieAlquiler.CreateDataSet;

  frxFactura.AddFunction('function DAME_TEXTO_IDIOMA(i: integer; Bandera: string = ''''): string', 'Merge', 'Devuelve el texto en el idioma del documento');

  // ABSHOT - Dataset para obtener codigo de proveedor para articulos de la familia DNKA (Proveedor=487)
  if (LeeParametro('PERABSH001') = 'S') then
  begin
     with TFIBDataSetRO.Create(Self) do
     begin
        Name := 'xCodProvDNKA';
        AutoTrans := False;
        BufferChunks := 1;
        Database := DMMain.DataBase;
        Transaction := TLocal;
        DataSource := DSDetalle;
        SelectSQL.Text := 'SELECT CODIGO_PROVEEDOR, TITULO_ART FROM ART_ARTICULOS_CODPROV WHERE EMPRESA = :EMPRESA AND PROVEEDOR = 487 AND ARTICULO = :ARTICULO';
     end;

     with TfrxDBDataset.Create(Self) do
     begin
        Name := 'frxCodProvDNKA';
        UserName := 'frxCodProvDNKA';
        OpenDataSource := True;
        CloseDataSource := True;
        DataSet := TFIBDataSetRO(TDataModule(Self).FindComponent('xCodProvDNKA'));
     end;
  end;
end;

procedure TDMLstFactura.DMLstFacturaDestroy(Sender: TObject);
begin
  // Liberar recursos
  ric.Free;
  ric_prm.Free;
  NotasCab.Free;
  CierraData(DMListados);
  CierraData(DMRecibosFactura);
  if (TLocal.InTransaction) then
     TLocal.Commit;
  //Application.ProcessMessages;
end;

procedure TDMLstFactura.MostrarListado(ID_S, rig: integer; Serie: string; Modo, Numero: integer; const Ejercicio: integer; ForzarCopias: boolean = False; Copias: integer = 0; aMarcarListado: boolean = True);
var
  Titulo, TituloCliente : string;
  grupo : integer;
  Listado : smallint;
begin
  // DMMain.LogIni('DMLstFactura.MostrarListado(' + IntToStr(id_s) + ', ' + IntToStr(rig) + ', ' + Serie + ', ...)');
  id_s_aux := id_s;
  SerieGen := Serie;
  SW := 1;

  MarcarListado := aMarcarListado;
  try
     case numero of
        1: grupo := 36;
        2: grupo := 116;
        3: grupo := 117;
        4: grupo := 118;
        else
           grupo := 36;
     end;

     // DMMain.Log('QMCabecera.Open');
     with QMCabecera do
     begin
        Close;
        Params.ByName['ID_S'].AsInteger := ID_S;
        Open;
     end;

     // Si hace falta, generamos los datos de la factura electrónica
     TipoDeComprobante := '';
     FormaPagoMX := '';
     MetodoDePago := '';
     NumCtaPago := '';
     CondicionesDePago := '';
     if (DMMain.EstadoKri(412) = 1) then
     begin
        // DMMain.Log('SPDame_DocumentoXmlMX');
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE DAME_DATOS_CADENA_XML_MX(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :RIG, :ID_S)';
              Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := QMCabecera.FieldByName('EJERCICIO').AsInteger;
              Params.ByName['CANAL'].AsInteger := QMCabecera.FieldByName('CANAL').AsInteger;
              Params.ByName['SERIE'].AsString := QMCabecera.FieldByName('SERIE').AsString;
              Params.ByName['RIG'].AsInteger := QMCabecera.FieldByName('RIG').AsInteger;
              Params.ByName['ID_S'].AsInteger := QMCabecera.FieldByName('ID_S').AsInteger;
              ExecQuery;
              TipoDeComprobante := FieldByName['TIPODECOMPROBANTE'].AsString;
              FormaPagoMX := FieldByName['FORMADEPAGO'].AsString;
              MetodoDePago := FieldByName['METODODEPAGO'].AsString;
              NumCtaPago := FieldByName['NUMCTAPAGO'].AsString;
              CondicionesDePago := FieldByName['CONDICIONESDEPAGO'].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     {Se llama a la funcion ObtenerListadoPerfil que comprueba si tiene algun listado
     o copias asignado para el perfil del cliente
     Solo si se selecciono el listado 1.
     4 - Facturas a Clientes}

     // DMMain.Log('ObtenerListadoPerfil');
     Listado := 0;
     if (numero = 1) then
        Listado := DMListados.ObtenerListadoPerfil(xCliente.FieldByName('PERFIL').AsString, 4);

     if ((DMListados.Copias <> REntorno.Copias) and (DMListados.Copias <> 0)) then
        REntorno.Copias := DMListados.Copias;

     if (Modo = 0) then
        REntorno.Copias := 1; {dji lrk kri - Si visualizo, solo una copia}

     if (ForzarCopias) then
        REntorno.Copias := Copias;

     TituloCliente := '';
     if (LeeParametro('LSTFAC0004') = 'S') then
     begin
        TituloCliente := '_' + LimpiaCadenaBasica(QMCabecera.FieldByName('TITULO').AsString);
        TituloCliente := StringReplace(TituloCliente, ' ', '_', [rfReplaceAll]);
     end;

     if REntorno.Pais = 'CHL' then
        Titulo := StringReplace(DameTituloTipoDocTributario(QMCabecera.FieldByName('TIPO_DOC_TRIBUTARIO').AsString), ' ', '_', [rfReplaceAll]) + '_' + IntToStr(QMCabecera.FieldByName('FOLIO').AsInteger)
     else
     begin
        // SE UTILIZA EL NUEVO PARÁMETRO CONFIGURABLE DOCFORM001 MEDIANTE LA FUNCIÓN DameNombreFichero
        Titulo := DameNombreFichero(
           QMCabecera.FieldByName('TIPO').AsString,
           QMCabecera.FieldByName('EJERCICIO').AsInteger,
           QMCabecera.FieldByName('SERIE').AsString,
           QMCabecera.FieldByName('RIG').AsInteger,
           QMCabecera.FieldByName('TITULO').AsString,
           DameTituloAgente(QMCabecera.FieldByName('AGENTE').AsInteger),
           '' // No añadimos extensión aquí, se gestiona en la llamada de Imprimir
           );
     end;

     // DMMain.Log('Imprimir ' + Titulo);
     DMListados.Imprimir(Grupo, Listado, Modo, Serie, Titulo, frFactura, frxFactura, HYReport, LimpiaNombreFichero(Titulo + '.pdf'));

     if (CarpetaGuardadoForzado <> '') then
        if not CopyFileTo(DameTempPath + Titulo + '.pdf', CarpetaGuardadoForzado + LimpiaNombreFichero(Titulo + '.pdf')) then
           ShowMessage(format(_('No se pudo generar el fichero %s'), [CarpetaGuardadoForzado + LimpiaNombreFichero(Titulo + '.pdf')]));

     // DMMain.LogFin('DMLstFactura.MostrarListado(' + IntToStr(id_s) + ', ' + IntToStr(rig) + ', ' + Serie + ', ...)');
  finally
     MarcarListado := True;
  end;
end;

procedure TDMLstFactura.MostrarListadoMail(id_s: integer; Serie: string; Modo: integer; const Ejercicio: integer; var Memo: TStrings; aMarcarListado: boolean = True);
var
  str : string;
  Listado : integer;
  TituloCliente : string;
begin
  // DMMain.LogIni('DMLstFactura.MostrarListadoMail(' + IntToStr(id_s) + ', ' + Serie + ', ...)');
  try
     TipoListado := 0;
     SerieGen := Serie;
     id_s_aux := id_s;

     SW := 1;

     MarcarListado := aMarcarListado;
     with QMCabecera do
     begin
        Close;
        Params.ByName['ID_S'].AsInteger := ID_S;
        Open;
     end;

     TituloCliente := '';
     if (LeeParametro('LSTFAC0004') = 'S') then
     begin
        TituloCliente := '_' + LimpiaCadenaBasica(QMCabecera.FieldByName('TITULO').AsString);
        TituloCliente := StringReplace(TituloCliente, ' ', '_', [rfReplaceAll]);
     end;

     if REntorno.Pais = 'CHL' then
        nombreFich := StringReplace(DameTituloTipoDocTributario(QMCabecera.FieldByName('TIPO_DOC_TRIBUTARIO').AsString), ' ', '_', [rfReplaceAll]) + '_' + IntToStr(QMCabecera.FieldByName('FOLIO').AsInteger) + '.pdf'
     else
     begin
        // SE UTILIZA EL NUEVO PARÁMETRO CONFIGURABLE DOCFORM001 MEDIANTE LA FUNCIÓN DameNombreFichero CON EXTENSIÓN 'pdf'
        nombreFich := DameNombreFichero(
           QMCabecera.FieldByName('TIPO').AsString,
           QMCabecera.FieldByName('EJERCICIO').AsInteger,
           QMCabecera.FieldByName('SERIE').AsString,
           QMCabecera.FieldByName('RIG').AsInteger,
           QMCabecera.FieldByName('TITULO').AsString,
           DameTituloAgente(QMCabecera.FieldByName('AGENTE').AsInteger),
           'pdf'
           );
     end;

     nombreFich := LimpiaNombreFichero(nombreFich);

     if (Modo < 2) then
     begin
        DMListados.CargarMail(36, Serie);
        if (REntorno.TipoListado = 'HYM') then
        begin
           Pagina := 0;
           HYReportMail.LoadFromFIB(REntorno.Formato, str);
           HYReportMail.Prepare;
           case Modo of
              0: HYReportMail.Preview;
              1: HYReportMail.PrintinMemo(Memo);
           end;
        end
        else if (REntorno.TipoListado = 'FR3') then
        begin
           frxFactura.LoadFromFIB(REntorno.Formato, str);
           if (frxFactura.DotMatrixReport) then
           begin
              frxFactura.PrepareReport;
              frxFactura.PreviewOptions.Zoom := 0.85;
              case Modo of
                 0: frxFactura.ShowPreparedReport;
                 1: frxFactura.PrintInMemo(Memo);
              end;
              frxFactura.PreviewOptions.Zoom := 1;
           end;
        end;
     end
     // Si no es matricial y la opcion elegida es la de enviar pdf(matricial no envia pdf),se toma
     // el listado que tenga por defecto para ese documento
     else
     if (Modo = 2) then
     begin
        Listado := DMListados.ObtenerListadoPerfil(xCliente.FieldByName('PERFIL').AsString, 4, True);
        if (Listado > 0) then
           DMListados.CargarMail(36, '', Listado)
        else
           DMListados.CargarMail(36, Serie);

        if (REntorno.TipoListado = 'FRF') then
        begin
           with frFactura do
           begin
              LoadFromFIB(REntorno.Formato, str);
              Title := format('%s %d-%s-%.5d', [_('Factura'), QMCabecera.FieldByName('EJERCICIO').AsInteger, QMCabecera.FieldByName('SERIE').AsString, QMCabecera.FieldByName('RIG').AsInteger]);
              PrepareReport;

              rutaFich := ExportarPDF(frFactura, nombreFich);

              if (CarpetaGuardadoForzado <> '') then
                 if not CopyFileTo(DameTempPath + nombreFich, CarpetaGuardadoForzado + nombreFich) then
                    ShowMessage(format(_('No se pudo generar el fichero %s'), [CarpetaGuardadoForzado + nombreFich]));
           end;
        end
        else
        if (REntorno.TipoListado = 'FR3') then
        begin
           frxFactura.LoadFromFIB(REntorno.Formato, Str);
           frxFactura.PrepareReport;

           rutaFich := ExportarPDF(frxFactura, nombreFich);

           if (CarpetaGuardadoForzado <> '') then
              if not CopyFileTo(DameTempPath + nombreFich, CarpetaGuardadoForzado + nombreFich) then
                 ShowMessage(format(_('No se pudo generar el fichero %s'), [CarpetaGuardadoForzado + nombreFich]));
        end
        else
        begin
           MessageDlg(_('El formato de listado no es válido para exportar a PDF.' + #13#10 +
              'El listado debe ser de los tipos FRF o FR3.'), mtWarning, [mbOK], 0);
           raise Exception.Create(Format(_('Error creando %s'), [rutaFich]));
        end;

        // DMMain.LogIni('FirmaPDF ' + rutaFich);
        AbreData(TDMFirmaElectronica, DMFirmaElectronica);
        rutaFich := DMFirmaElectronica.FirmaPDF(rutaFich);
        nombreFich := ExtractFileName(rutaFich);
        CierraData(DMFirmaElectronica);
        // DMMain.LogFin('FirmaPDF ' + rutaFich);
     end
     else
     if (Modo = 3) then
     begin
        //sfg.rsp factura electrónica
     end;
  finally
     DMListados.LimpiaEntorno;
     // DMMain.LogFin('DMLstFactura.MostrarListadoMail(' + IntToStr(id_s) + ', ' + Serie + ', ...)');
  end;
end;

procedure TDMLstFactura.MostrarListadoFiltrado(Modo: byte);
var
  str : string;
  i : integer;
begin
  TipoListado := 0;
  SerieGen := REntorno.Serie;
  FiltroGen := FMFacturas.FiltroListadoFiltrado;
  id_s_aux := 0;
  SW := 1;

  with QMCabecera do
  begin
     Close;
     if (FMFacturas.FiltroListadoFiltrado = 0) then
     begin
        DMMain.FiltraRO(QMCabecera, '11110', False);
        Params.ByName['SERIE'].AsString := REntorno.Serie;
     end;
     Open;
  end;

  DMListados.Cargar(36, SerieGen);
  if (REntorno.TipoListado = 'FRF') then
  begin
     frfactura.LoadFromFIB(REntorno.Formato, str);
     frFactura.Title := format('%s %d-%s-%.5d', [_('Factura'), QMCabecera.FieldByName('EJERCICIO').AsInteger, QMCabecera.FieldByName('SERIE').AsString, QMCabecera.FieldByName('RIG').AsInteger]);
     frFactura.PrepareReport;
     case Modo of
        0: frFactura.ShowPreparedReport;
        1: frFactura.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end
  else
  if (REntorno.TipoListado = 'FR3') then
  begin
     frxFactura.LoadFromFIB(REntorno.Formato, str);
     frxFactura.PrepareReport;
     case Modo of
        0: frxFactura.ShowPreparedReport;
        1: frxFactura.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end
  else if (REntorno.TipoListado = 'HYR') then
  begin
     Pagina := 0;
     HYReport.LoadFromFIB(REntorno.Formato, str);
     HYReport.Prepare;
     if (REntorno.Copias = 0) then
        REntorno.Copias := 1;
     case Modo of
        0: HYReport.Preview;
        1: for i := 1 to REntorno.Copias do
              HYReport.Print(REntorno.NombreMatricial);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstFactura.MostrarListadoDiario(Serie: string; const Ejercicio: integer);
var
  str : string;
begin
  TipoListado := 1;
  SerieGen := Serie;
  id_s_aux := 0;
  SW := 1;

  QMCabecera.Close;

  with QMCabecera do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_CABECERAS_FACTURA_LST ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' SERIE = ?SERIE AND ');
     SelectSQL.Add(' FECHA >= ?FECHA1 AND FECHA <= ?FECHA2 ');
     SelectSQL.Add(' ORDER BY RIG ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['FECHA1'].AsDateTime := REntorno.FechaTrabSH;
     Params.ByName['FECHA2'].AsDateTime := REntorno.FechaTrabSH + 1;
     Open;
  end;

  if (QMCabecera.RecordCount = 0) then {dji lrk kri}
     MessageDlg(_('No hay facturas con fecha de hoy.'), mtInformation, [mbOK], 0)
  else
  begin
     with QMDetalle do
     begin
        Close;
        Params.ByName['ID_S'].AsInteger := QMCabecera.FieldByName('ID_S').AsInteger;
        Open;
     end;

     DMListados.Cargar(36, Serie);
     if (REntorno.TipoListado = 'FRF') then
     begin
        frfactura.LoadFromFIB(REntorno.Formato, str);
        frFactura.Title := format('%s %d-%s-%.5d', [_('Factura'), QMCabecera.FieldByName('EJERCICIO').AsInteger, QMCabecera.FieldByName('SERIE').AsString, QMCabecera.FieldByName('RIG').AsInteger]);
        frFactura.PrepareReport;
        frFactura.ShowPreparedReport;
     end
     else
     if (REntorno.TipoListado = 'FR3') then
     begin
        frxFactura.LoadFromFIB(REntorno.Formato, str);
        frxFactura.PrepareReport;
        frxFactura.ShowPreparedReport;
     end
     else if (REntorno.TipoListado = 'HYR') then
     begin
        Pagina := 0;
        HYReport.LoadFromFIB(REntorno.Formato, str);
        HYReport.Prepare;
        HYReport.Preview;
     end;
     DMListados.LimpiaEntorno;
  end; {dji lrk kri - QMCabecera.RecordCount=0}
end;

procedure TDMLstFactura.QMDetalleAfterScroll(DataSet: TDataSet);
begin
  // DMMain.LogIni('QMDetalleAfterScroll');
  nro_serie := '';
  QNroSerieKri.Close;
  {dji lrk kri - Si tiene escandallo puede que alguno de sus componentes tenga nro. serie o lote
                 Por lo tanto no filtro por el hecho de que la cabecera de escandallo sea serializable
  if (xArticulosSERIALIZADO_KRI.AsInteger = 1) then
  begin}
  QNroSerieKri.Params.ByName['EMPRESA'].AsInteger := QMDetalle.FieldByName('EMPRESA').AsInteger;
  QNroSerieKri.Params.ByName['EJERCICIO_S'].AsInteger := QSPProcedencia.FieldByName('EJERCICIO_O').AsInteger;
  QNroSerieKri.Params.ByName['CANAL'].AsInteger := QSPProcedencia.FieldByName('CANAL_O').AsInteger;
  QNroSerieKri.Params.ByName['SERIE'].AsString := QSPProcedencia.FieldByName('SERIE_O').AsString;
  QNroSerieKri.Params.ByName['RIG_S'].AsInteger := QSPProcedencia.FieldByName('RIG_O').AsInteger;
  if QSPProcedencia.FieldByName('TIPO_O').AsString = 'ALB' then
     QNroSerieKri.Params.ByName['LINEA_S'].AsInteger := QSPProcedencia.FieldByName('LINEA_O').AsInteger
  else
     QNroSerieKri.Params.ByName['LINEA_S'].AsInteger := -1;
  QNroSerieKri.Open;
  {end;}

  QLoteKri.Close;
  {if (xArticulosLOTES_KRI.AsInteger = 1) then
  begin}
  QLoteKri.Params.ByName['EMPRESA'].AsInteger := QMDetalle.FieldByName('EMPRESA').AsInteger;
  QLoteKri.Params.ByName['EJERCICIO_S'].AsInteger := QSPProcedencia.FieldByName('EJERCICIO_O').AsInteger;
  QLoteKri.Params.ByName['CANAL'].AsInteger := QSPProcedencia.FieldByName('CANAL_O').AsInteger;
  QLoteKri.Params.ByName['SERIE'].AsString := QSPProcedencia.FieldByName('SERIE_O').AsString;
  QLoteKri.Params.ByName['RIG_S'].AsInteger := QSPProcedencia.FieldByName('RIG_O').AsInteger;
  if QSPProcedencia.FieldByName('TIPO_O').AsString = 'ALB' then
     QLoteKri.Params.ByName['LINEA_S'].AsInteger := QSPProcedencia.FieldByName('LINEA_O').AsInteger
  else
     QLoteKri.Params.ByName['LINEA_S'].AsInteger := -1;
  QLoteKri.Open;
  {end;}

  if ((QMDetalle.RecordCount > 0) and (ric <> nil)) then
  begin
     ric.Assign(QMDetalle.FieldByName('NOTAS'));

     if (not QNroSerieKri.EOF) then
     begin
        if (QNroSerieKRI.FieldByName('NRO_SERIE').AsString <> '') then
           nro_serie := QNroSerieKRI.FieldByName('NRO_SERIE').AsString;
        QNroSerieKri.Next;
     end;
     while (not QNroSerieKri.EOF) do
     begin
        if (QNroSerieKRI.FieldByName('NRO_SERIE').AsString <> '') then
           nro_serie := nro_serie + ' - ' + QNroSerieKRI.FieldByName('NRO_SERIE').AsString;
        QNroSerieKri.Next;
     end;
     if (nro_serie <> '') then
        ric.Insert(0, 'Nro. de Serie : ' + nro_serie);

     while (not QLoteKri.EOF) do
     begin
        if (QLoteKri.FieldByName('LOTE').AsString <> '') then
        begin
           ric.Insert(0, Format(_('Lote: %s Caducidad: %s x %s'), [QLoteKri.FieldByName('LOTE').AsString, QLoteKri.FieldByName('CADUCIDAD').AsString, QLoteKri.FieldByName('COUNT').AsString]));

           if (Length(nro_serie) > 0) then
              nro_serie := nro_serie + #13;
           nro_serie := nro_serie + Format(_('Lote: %s Caducidad: %s x %s'), [QLoteKri.FieldByName('LOTE').AsString, QLoteKri.FieldByName('CADUCIDAD').AsString, QLoteKri.FieldByName('COUNT').AsString]);
        end;
        QLoteKri.Next;
     end;
  end;

  // DMMain.LogFin('QMDetalleAfterScroll');
end;

procedure TDMLstFactura.FRUDNotasArtCheckEOF(Sender: TObject; var EOF: boolean);
begin
  EOF := (ric.Count = j);
end;

procedure TDMLstFactura.FRUDNotasArtFirst(Sender: TObject);
begin
  j := 0;
end;

procedure TDMLstFactura.FRUDNotasArtNext(Sender: TObject);
begin
  j := j + 1;
end;

procedure TDMLstFactura.QMCabeceraAfterScroll(DataSet: TDataSet);
var
  id_s_cab, Ejercicio, RIG : integer;
  Serie, Tipo : string;
  DatosBancarios : char;
  BancoPagos, BancoFP : integer;
begin
  // DMMain.LogIni('QMCabeceraAfterScroll');
  // DMMain.Log('xAutofactura');
  with xAutofactura do
  begin
     Close;
     if (QMCabecera.FieldByName('ESTADO').AsInteger = 6) then
     begin
        Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabecera.FieldByName('EJERCICIO').AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabecera.FieldByName('CANAL').AsInteger;
        Params.ByName['SERIE'].AsString := QMCabecera.FieldByName('SERIE').AsString;
        Params.ByName['TIPO'].AsString := QMCabecera.FieldByName('TIPO').AsString;
        Params.ByName['RIG'].AsInteger := QMCabecera.FieldByName('RIG').AsInteger;
        Open;
     end;
  end;

  // DMMain.Log('if QMCabecera.FieldByName(''CLIENTE'').AsInteger <= -1 then');
  if QMCabecera.FieldByName('CLIENTE').AsInteger <= -1 then  // dji lrk kri
  begin
     // DMMain.Log('xDireccionesNIF');
     xDireccionesNIF.Close;
     xDireccionesNIF.Open;
  end;

  with QMCabecera do
  begin
     // DMMain.Log('if ((QMCabecera.RecordCount > 0) and (NotasCab <> nil)) then');
     if ((RecordCount > 0) and (NotasCab <> nil)) then
     begin
        // DMMain.Log('NotasCab.Assign');
        NotasCab.Assign(FieldByName('NOTAS'));
     end;
  end;

  albaran_anterior := '';  // dji lrk kri

  with QMCabecera do
     DatosBancarios := DMMain.DameDatosBancarios(FieldByName('EMPRESA').AsInteger, FieldByName('EJERCICIO').AsInteger, FieldByName('CANAL').AsInteger, FieldByName('FORMA_PAGO').AsString, BancoFP);
  BancoPagos := xCliente.FieldByName('BANCO_PAGOS').AsInteger;

  // DMMain.Log('xTerceroBanco');
  with xTerceroBanco do
  begin
     Close;
     // Inicializamos para no mostrar ningun dato
     Params.ByName['TERCERO'].AsInteger := 0;
     Params.ByName['BANCO_CLI'].AsInteger := 0;
     Params.ByName['EMPRESA'].AsInteger := 0;
     Params.ByName['BANCO'].AsInteger := 0;
     case DatosBancarios of
        '1': // Datos del cliente
        begin
           Params.ByName['TERCERO'].AsInteger := QMCabecera.FieldByName('TERCERO').AsInteger;
           // Si el parametro BANCO_CLI = 0, se muestra el primer banco activo según orden
           Params.ByName['BANCO_CLI'].AsInteger := QMCabecera.FieldByName('BANCO').AsInteger;
        end;
        '2': // Datos de la empresa
        begin
           Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
           if (BancoPagos = 0) then
              Params.ByName['BANCO'].AsInteger := BancoFP
           else
              Params.ByName['BANCO'].AsInteger := BancoPagos;
        end;
     end;
     Open;
  end;

  // DMMain.Log('Origen');
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT O_ID_S, O_EJERCICIO, O_SERIE, O_TIPO, O_RIG FROM GES_CABECERAS_RELACIONES WHERE D_ID_S = :ID_S';
        Params.ByName['ID_S'].AsInteger := QMCabecera.FieldByName('ID_S').AsInteger;
        ExecQuery;
        id_s_cab := FieldByName['O_ID_S'].AsInteger;
        Ejercicio := FieldByName['O_EJERCICIO'].AsInteger;
        Serie := FieldByName['O_SERIE'].AsString;
        Tipo := FieldByName['O_TIPO'].AsString;
        RIG := FieldByName['O_RIG'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // DMMain.Log('Calculo Recibos de documento origen de Factura (Anticipos)');
  // Filtro los recibos relacionados con el documento origen (ALB, PEC u OFC) (anticipos)
  DMRecibosFactura.Mostrar(Serie, Tipo, Rig, Ejercicio);

  with xRecibosAnticipos do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  with xTotalRecibosAnticipos do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;

  // DMMain.Log('if ((Tipo <> ''OFC'') and (Tipo > '''')) then // Tipo = ' + Tipo);
  if ((Tipo <> 'OFC') and (Tipo > '')) then
  begin
     // DMMain.Log('Tipo <> ''OFC''');

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT O_ID_S, O_TIPO FROM GES_CABECERAS_RELACIONES WHERE D_ID_S = :ID_S';
           Params.ByName['ID_S'].AsInteger := id_s_cab;
           ExecQuery;
           id_s_cab := FieldByName['O_ID_S'].AsInteger;
           Tipo := FieldByName['O_TIPO'].AsString;
        finally
           Free;
        end;
     end;
  end;

  // DMMain.Log('if ((Tipo <> ''OFC'') and (Tipo > '')) then // Tipo = ' + Tipo);
  if ((Tipo <> 'OFC') and (Tipo > '')) then
  begin
     // DMMain.Log('Tipo <> ''OFC''');

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT O_ID_S FROM GES_CABECERAS_RELACIONES WHERE D_ID_S = :ID_S';
           Params.ByName['ID_S'].AsInteger := id_s_cab;
           ExecQuery;
           id_s_cab := FieldByName['O_ID_S'].AsInteger;
        finally
           Free;
        end;
     end;
  end;

  // DMMain.Log('xGarantiasKri');
  xGarantiasKri.Close;
  xGarantiasKri.Params.ByName['ID_S'].AsInteger := id_s_cab;
  xGarantiasKri.Open;
  // DMMain.LogFin('QMCabeceraAfterScroll');
end;

procedure TDMLstFactura.QMDetalleAfterOpen(DataSet: TDataSet);
var
  DS : TComponent;
begin
  if not QSPProcedencia.Active then
     QSPProcedencia.Open;
  if not QMPromociones.Active then
     QMPromociones.Open;
  if not xLotes.Active then
     xLotes.Open;
  if not xNroSerie.Active then
     xNroSerie.Open;
  if not xArticulos.Active then
     xArticulos.Open;
  if not QMEscandallo.Active then
     QMEscandallo.Open;
  if (DMMain.EstadoKri(120) = 1) then
     if not QSPProcedencia_kri.Active then
        QSPProcedencia_kri.Open;
  if not xProyectosDetalle.Active then
     xProyectosDetalle.Open;
  xArticulosIdioma.Close;
  xArticulosIdioma.Params.ByName['IDIOMA'].AsString := QMCabecera.FieldByName('IDIOMA').AsString;
  xArticulosIdioma.Open;
  if not xHerenciaALB.Active then
     xHerenciaALB.Open;
  if not QMDetalleUE.Active then
     QMDetalleUE.Open;
  with xDireccionEntregaLinea do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM UT_JUSTIFICA_DOMICILIO (' + IntToStr(QMCabecera.FieldByName('TERCERO').AsInteger) + ') WHERE NUM = ?DIRECCION_ENTREGA';
     Open;
  end;
  xArticuloTYC.Open;

  // ABSHOT - Personalizacion
  DS := TDataModule(Self).FindComponent('xCodProvDNKA');
  if Assigned(DS) then
     TFIBDataSetRO(DS).Open;
end;

procedure TDMLstFactura.xTerceroBancoAfterOpen(DataSet: TDataSet);
begin
  if not xNombreBanco.Active then
     xNombreBanco.Open;
end;

procedure TDMLstFactura.xClienteAfterOpen(DataSet: TDataSet);
begin
  if not xTercero.Active then
     xTercero.Open;
  if not xCuenta.Active then
     xCuenta.Open;
  if not xEmpresa.Active then
     xEmpresa.Open;
  if not xDatosBancarios.Active then
     xDatosBancarios.Open;

  with xDireccion_Cliente do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := QMCabecera.FieldByName('TERCERO').Value;
     Params.ByName['DIRECCION'].AsInteger := QMCabecera.FieldByName('DIRECCION').Value;
     Open;
  end;

  with xDireccionKRI do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := QMCabecera.FieldByName('TERCERO').Value;
     Params.ByName['DIRECCION'].AsInteger := QMCabecera.FieldByName('DIRECCION').Value;
     Open;
  end;

  with xDireccionFiscal do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := QMCabecera.FieldByName('TERCERO').Value;
     Open;
  end;
end;

procedure TDMLstFactura.frFacturaGetValue(const ParName: string; var ParValue: variant);
var
  s : string;
  NumAlbaran, SuProv : string;
  em, ej, ca, ri : integer; {dji lrk kri}
  se, ti : string;  {dji lrk kri}
  Cambio : extended;
  Base : double;
  i : integer;
  GiroCliente, TituloGiroCliente : string;

  function DameVencimientos(id_s, Linea: integer): string;
  begin
     Result := '';
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT LINEA1, LINEA2 FROM DAME_VENCIMIENTOS(:ID_S)';
           Params.ByName['ID_S'].AsInteger := id_s;
           ExecQuery;
           case Linea of
              1: Result := FieldByName['LINEA1'].AsString;
              2: Result := FieldByName['LINEA2'].AsString;
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

begin
  // DMMain.Log(format('frFacturaGetValue(%s)', [ParName]));

  DMListados.GetValue(ParName, ParValue);
  Cambio := 0;

  if (ParName = 'Copia') then
     ParValue := Copia;

  if (ParName = 'Autofactura') then
     if xAutofactura.Active then
        ParValue := xAutofactura.FieldByName('RIG_1').AsInteger
     else
        ParValue := 0;
  if (ParName = 'AutofacturaProveedor') then
     if xAutofactura.Active then
        ParValue := xAutofactura.FieldByName('NOMBRE_R_SOCIAL').AsString
     else
        ParValue := '';

  if (ParName = 'Cif') then
     ParValue := xDireccion_Cliente.FieldByName('NIF').AsString;
  if (ParName = 'Empresa_Cli') then
     ParValue := xDireccion_Cliente.FieldByName('NOMBRE').AsString;
  if (ParName = 'Direccion') then //dji lrk kri
     ParValue := StringReplace(xDireccion_Cliente.FieldByName('DIRECCION').AsString, '  ', ' ', [rfReplaceAll]);
  if (ParName = 'Direccion2') then //dji lrk kri
     ParValue := StringReplace(xDireccion_Cliente.FieldByName('DIR_NOMBRE_2').AsString, '  ', ' ', [rfReplaceAll]);
  if (ParName = 'Direccion3') then //dji lrk kri
     ParValue := StringReplace(xDireccion_Cliente.FieldByName('DIR_NOMBRE_3').AsString, '  ', ' ', [rfReplaceAll]);
  if (ParName = 'CodPostal') then
     ParValue := xDireccion_Cliente.FieldByName('CODPOB').AsString;
  if (ParName = 'Provincia') then
     ParValue := xDireccion_Cliente.FieldByName('PROVINCIA').AsString;
  if (ParName = 'Colonia') then
     ParValue := xDireccion_Cliente.FieldByName('COLONIA').AsString;
  if (ParName = 'Pais') then
     ParValue := xDireccion_Cliente.FieldByName('PAIS').AsString;
  if (ParName = 'Telefono1') then
     ParValue := xDireccion_Cliente.FieldByName('DIR_TELEFONO01').AsString;
  if (ParName = 'Telefono2') then
     ParValue := xDireccion_Cliente.FieldByName('DIR_TELEFONO02').AsString;
  if (ParName = 'Telefax') then
     ParValue := xDireccion_Cliente.FieldByName('DIR_TELEFAX').AsString;
  if (ParName = 'Email') then
     ParValue := xDireccion_Cliente.FieldByName('EMAIL').AsString;

  if (ParName = 'Su_Proveedor') then
  begin
     SuProv := Trim(xCliente.FieldByName('SU_PROVEEDOR').AsString);
     if (SuProv <> '') then
        ParValue := Format(_('PROV.: %s'), [SuProv])
     else
        ParValue := '';
  end;

  if ParName = 'Factura' then
  begin
     ParValue := QMCabecera.FieldByName('RIG').AsInteger;

     // Refrescar la Doble Cabecera
     with DobleCabecera do
     begin
        Close;
        Params.ByName['ID_S'].AsInteger := QMCabecera.FieldByName('ID_S').AsInteger;
        Open;
     end;

     // Actualizar las máscaras para la factura actual
     LocalMascaraN := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 1);
     LocalMascaraL := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 0);

     // Se comprueba la segunda moneda emplear
     if (QMCabecera.FieldByName('MONEDA').AsString = REntorno.Moneda) then
        Moneda_Sec := REntorno.Moneda_Sec
     else
        Moneda_Sec := REntorno.Moneda;

     LocalMascaraNSec := DMMain.MascaraMoneda(Moneda_Sec, 1);

     IVA := 1;
     VENCIMIENTO := 1;

     // Obtener Porcentajes de IVA y de RE Únicos (Doble Cabecera)
     P_IvaUnico := 0;
     P_REUnico := 0;
     if QMDetalle.RecordCount > 0 then
     begin
        P_IvaUnico := QMDetalle.FieldByName('P_IVA').AsFloat;
        P_REUnico := QMDetalle.FieldByName('P_RECARGO').AsFloat;
     end;

     if (QMCabecera.FieldByName('RIG').AsInteger <> FacturaAnt) or
        ((QMCabecera.FieldByName('RIG').AsInteger = FacturaAnt) and (QMDetalle.FieldByName('LINEA').AsInteger = LineaAnt)) then
     begin
        subtotal := 0;
        FacturaAnt := QMCabecera.FieldByName('RIG').AsInteger;
        if (QMDetalle.Active) then
           LineaAnt := QMDetalle.FieldByName('LINEA').AsInteger;
     end;
  end;

  // IVA y RE Único
  if ParName = 'P_IvaUnico' then
     ParValue := P_IvaUnico;
  if ParName = 'P_REUnico' then
     ParValue := P_REUnico;

  //  if ParName='Subtotal' then ParValue := subtotal;
  if ParName = 'Subtotal' then
     ParValue := QMCabecera.FieldByName('B_DTO_LINEAS').AsFloat;

  if ParName = 'pbruto' then
     ParValue := QMCabecera.FieldByName('B_DTO_LINEAS').Value;
  if ParName = 'pneto' then
     ParValue := QMCabecera.FieldByName('B_DTO_LINEAS').Value -
        QMCabecera.FieldByName('I_DTO_PP').Value;
  if ParName = 'pb_imponible' then
     ParValue :=
        QMCabecera.FieldByName('TOTAL_A_COBRAR').Value - QMCabecera.FieldByName('S_CUOTA_IVA').Value;
  if ParName = 'ptotal' then
     ParValue := QMCabecera.FieldByName('TOTAL_A_COBRAR').Value;
  if ParName = 'pimp_iva' then
     ParValue := QMCabecera.FieldByName('S_CUOTA_IVA').Value;
  if ParName = 'pp_pp' then
     ParValue := QMCabecera.FieldByName('DTO_PP').Value;
  if ParName = 'pi_pp' then
     ParValue := QMCabecera.FieldByName('I_DTO_PP').Value;

  if ParName = 'Empresa' then
  begin
     // subtotal := 0;
     ParValue := REntorno.NombreEmpresa;
  end;

  if ParName = 'FacTitulo' then
  begin
     if (QMCabecera.FieldByName('DEVOLUCION').AsInteger = 1) then
        ParValue := _('Factura Devolución')
     else if (QMCabecera.FieldByName('SIN_DETALLE').AsInteger = 1) then
        ParValue := _('Factura Abono')
     else
        ParValue := _('Factura');
  end;

  if ParName = 'Fecha' then
     ParValue := QMCabecera.FieldByName('FECHA').AsDateTime;

  if ParName = 'DtoTec' then
     if QMDetalle.FieldByName('DESCUENTO').Value = 0 then
        ParValue := _('Neto')
     else
        ParValue := QMDetalle.FieldByName('DESCUENTO').AsString + ' %';

  if ParName = 'Linea1' then
     ParValue := DameVencimientos(QMCabecera.FieldByName('ID_S').AsInteger, 1);

  if ParName = 'Linea2' then
     ParValue := DameVencimientos(QMCabecera.FieldByName('ID_S').AsInteger, 2);

  if ParName = 'Linea1Doble' then
     ParValue := DameVencimientos(DobleCabecera.FieldByName('ID_S').AsInteger, 1);

  if ParName = 'Linea2Doble' then
     ParValue := DameVencimientos(DobleCabecera.FieldByName('ID_S').AsInteger, 2);

  if ParName = 'Letras' then
  begin
     Letras.Numero := QMCabecera.FieldByName('TOTAL_A_COBRAR').Value;
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := QMCabecera.FieldByName('MONEDA').AsString;
        Open;
        Letras.Moneda := LowerCase(xMonedas.FieldByName('TITULO').AsString);
        Letras.GeneroMasculino := (xMonedas.FieldByName('GENERO_MASCULINO').AsInteger = 1);
        Letras.Decimales := xMonedas.FieldByName('DEC_VER').AsInteger;
        Letras.DescDecimales := xMonedas.FieldByName('DESC_DECIMALES').AsString;
     end;
     ParValue := Letras.AsString;
  end;

  if ParName = 'DobleLetras' then
  begin
     DobleLetras.Numero := DobleCabecera.FieldByName('TOTAL_A_COBRAR').Value;
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := DobleCabecera.FieldByName('MONEDA').AsString;
        Open;
        DobleLetras.Moneda := LowerCase(xMonedas.FieldByName('TITULO').AsString);
        DobleLetras.GeneroMasculino := (xMonedas.FieldByName('GENERO_MASCULINO').AsInteger = 1);
        DobleLetras.Decimales := xMonedas.FieldByName('DEC_VER').AsInteger;
        DobleLetras.DescDecimales := xMonedas.FieldByName('DESC_DECIMALES').AsString;
     end;
     ParValue := DobleLetras.AsString;
  end;

  if ParName = 'Nombre_tipo_iva' then
     ParValue := DMMain.DameNombreIva(REntorno.Pais, xDatosIva.FieldByName('TIPO_IVA').AsInteger, QMCabecera.FieldByName('IDIOMA').AsString);

  if ParName = 'Base' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT * FROM DAME_BASES_POR_IVA(:ID_S) WHERE TIPO_IVA = :TIPO_IVA';
           Params.ByName['ID_S'].AsInteger := QMCabecera.FieldByName('ID_S').AsInteger;
           Params.ByName['TIPO_IVA'].AsInteger := xDatosIva.FieldByName('TIPO_IVA').AsInteger;
           ExecQuery;
           ParValue := FieldByName['BASE'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'BancoCli' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ENTIDAD FROM SYS_TERCEROS_BANCOS WHERE TERCERO = ?TERCERO AND MODO in (0, 2) AND ACTIVA = 1 ORDER BY ORDEN';
           Params.ByName['TERCERO'].AsInteger := xCliente.FieldByName('TERCERO').AsInteger;
           ExecQuery;
           ParValue := FieldByName['ENTIDAD'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'Total_a_CobrarE' then
     ParValue := DMMain.DameCambio(True, DobleCabecera.FieldByName('MONEDA').AsString, 'EUR', DobleCabecera.FieldByName('FECHA').AsDateTime, DobleCabecera.FieldByName('TOTAL_A_COBRAR').AsFloat, DobleCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat);

  if ParName = 'Moneda_Canal' then
     ParValue := REntorno.Moneda;

  if ParName = 'Titulo_Moneda' then
  begin
     if (QMCabecera.FieldByName('IDIOMA').AsString = 'CAS') then
     begin
        with xMonedas do
        begin
           Close;
           Params.ByName['MONEDA'].AsString := QMCabecera.FieldByName('MONEDA').AsString;
           Open;
           ParValue := xMonedas.FieldByName('TITULO').AsString;
        end;
     end
     else
     begin
        with xMonedasIdiomas do
        begin
           Close;
           Params.ByName['MONEDA'].AsString := QMCabecera.FieldByName('MONEDA').AsString;
           Open;
           ParValue := xMonedasIdiomas.FieldByName('TITULO').AsString;
        end;
     end;
  end;

  if ParName = 'Imp_dto_Cial' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT * FROM DAME_BASES_POR_IVA(:ID_S) WHERE TIPO_IVA = :TIPO_IVA';
           Params.ByName['ID_S'].AsInteger := QMCabecera.FieldByName('ID_S').AsInteger;
           Params.ByName['TIPO_IVA'].AsInteger := xDatosIva.FieldByName('TIPO_IVA').AsInteger;
           ExecQuery;
           Base := FieldByName['BASE'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;

        ParValue := ((QMCabecera.FieldByName('DTO_CIAL').Value * Base) / 100);
     end;
  end;

  if ParName = 'Total' then
  begin
     subtotal := subtotal + QMDetalle.FieldByName('B_DTO_LINEA').Value;
     ParValue := QMDetalle.FieldByName('B_DTO_LINEA').Value;
  end;

  if ParName = 'TOTAL' then
  begin
     if (QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) then
        ParValue := 0
     else
        ParValue := subtotal;
  end;

  if ParName = 'Articulo' then
     if (QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) then
        ParValue := ' '
     else
        ParValue := QMDetalle.FieldByName('ARTICULO').AsString;

  if ParName = 'Unidades' then
  begin
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        ParValue := ' '
     else
     begin
        if ((xArticulos.FieldByName('PVP_POR_UD_SECUNDARIA').AsInteger <> 0) and
           (QMDetalle.FieldByName('APLICA_UNIDADES_SECUNDARIAS').AsInteger <> 0)) then
           ParValue := TrimRight(FormatFloat(MascaraI, QMDetalle.FieldByName('UNIDADES_SEC').AsFloat) +
              ' ' + DMMain.DameSignoUnidadArticulo(QMDetalle.FieldByName('ARTICULO').AsString))
        else
           ParValue := TrimRight(FormatFloat(MascaraI,
              QMDetalle.FieldByName('UNIDADES').AsFloat) + ' ' + DMMain.DameSignoUnidadArticulo(QMDetalle.FieldByName('ARTICULO').AsString));
     end;
  end;

  if ParName = 'UnidadesSF' then
  begin
     // Sin Formato, para poder utilizarlo en cálculos internos del listado
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        ParValue := ' '
     else
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT PVP_POR_UD_SECUNDARIA FROM ART_ARTICULOS WHERE EMPRESA = ?EMPRESA AND ID_A = ?ID_A';
              Params.ByName['EMPRESA'].AsInteger := QMDetalle.FieldByName('EMPRESA').AsInteger;
              Params.ByName['ID_A'].AsInteger := QMDetalle.FieldByName('ID_A').AsInteger;
              ExecQuery;
              if (FieldByName['PVP_POR_UD_SECUNDARIA'].AsInteger = 1) and REntorno.PVP_Ud_Sec then
                 ParValue := QMDetalle.FieldByName('UNIDADES_SEC').AsFloat
              else
                 ParValue := QMDetalle.FieldByName('UNIDADES').AsFloat;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;

  if ParName = 'Albaran' then
  begin
     NumAlbaran := GetAlbaranProcedencia;
     if NumAlbaran = ' ' then
        NumAlbaran := '0';
     ParValue := NumAlbaran;
  end;

  // ----------  Unidades Extendidas  ----------

  if ParName = 'CalcularExt' then
  begin
     with QUnidadesExt do
     begin
        Close;
        Params.ByName['Empresa'].AsInteger := QMDetalle.FieldByName('EMPRESA').AsInteger;
        Params.ByName['Ejercicio'].AsInteger := QMDetalle.FieldByName('EJERCICIO').AsInteger;
        Params.ByName['Canal'].AsInteger := QMDetalle.FieldByName('CANAL').AsInteger;
        Params.ByName['Serie'].AsString := QMDetalle.FieldByName('SERIE').AsString;
        Params.ByName['RIG'].AsInteger := QMDetalle.FieldByName('rig').AsInteger;
        Params.ByName['Tipo'].AsString := QMDetalle.FieldByName('TIPO').AsString;
        Params.ByName['Linea'].AsInteger := QMDetalle.FieldByName('LINEA').AsInteger;
        ExecQuery;
        if (HayDatos) then  // Artículo con unidades extendidas
        begin
           MedidasExt := FormatFloat('####0',
              FieldByName['Medida1'].AsFloat * 100) + 'x' +
              FormatFloat('####0', FieldByName['Medida2'].AsFloat * 100);
           PrecioExt := FieldByName['Precio'].AsFloat;
        end
        else     // Artículo sin unidades extendidas
        begin
           MedidasExt := '';
           PrecioExt := QMDetalle.FieldByName('PRECIO').AsFloat;
        end;
        FreeHandle;
     end;
  end;

  if ParName = 'MedidasExt' then
     ParValue := MedidasExt;

  if ParName = 'PrecioExt' then
     ParValue := FloatToStr(PrecioExt);

  // ----------------------------------------

  // Procedencia

  if ParName = 'Pedido' then
  begin
     ParValue := '';
     QSPProcedencia2_KRI.Close;
     QSPProcedencia2_KRI.Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
     QSPProcedencia2_KRI.Params.ByName['EJERCICIO'].AsInteger := QMCabecera.FieldByName('EJERCICIO').AsInteger;
     QSPProcedencia2_KRI.Params.ByName['CANAL'].AsInteger := QMCabecera.FieldByName('CANAL').AsInteger;
     QSPProcedencia2_KRI.Params.ByName['SERIE'].AsString := QMCabecera.FieldByName('SERIE').AsString;
     QSPProcedencia2_KRI.Params.ByName['RIG'].AsInteger := QMCabecera.FieldByName('RIG').AsInteger;
     QSPProcedencia2_KRI.Params.ByName['TIPO'].AsString := QMCabecera.FieldByName('TIPO').AsString;
     QSPProcedencia2_KRI.Open;
     if QSPProcedencia2_KRI.FieldByName('O_TIPO').AsString = 'PEC' then
        ParValue := QSPProcedencia2_KRI.FieldByName('O_RIG').AsInteger
     else
     begin
        em := QSPProcedencia2_KRI.FieldByName('O_EMPRESA').AsInteger;
        ej := QSPProcedencia2_KRI.FieldByName('O_EJERCICIO').AsInteger;
        ca := QSPProcedencia2_KRI.FieldByName('O_CANAL').AsInteger;
        se := QSPProcedencia2_KRI.FieldByName('O_SERIE').AsString;
        ti := QSPProcedencia2_KRI.FieldByName('O_TIPO').AsString;
        ri := QSPProcedencia2_KRI.FieldByName('O_RIG').AsInteger;
        QSPProcedencia2_KRI.Close;
        QSPProcedencia2_KRI.Params.ByName['EMPRESA'].AsInteger := em;
        QSPProcedencia2_KRI.Params.ByName['EJERCICIO'].AsInteger := ej;
        QSPProcedencia2_KRI.Params.ByName['CANAL'].AsInteger := ca;
        QSPProcedencia2_KRI.Params.ByName['SERIE'].AsString := se;
        QSPProcedencia2_KRI.Params.ByName['RIG'].AsInteger := ri;
        QSPProcedencia2_KRI.Params.ByName['TIPO'].AsString := ti;
        QSPProcedencia2_KRI.Open;
        if QSPProcedencia2_KRI.FieldByName('O_TIPO').AsString = 'PEC' then
           ParValue := QSPProcedencia2_KRI.FieldByName('O_RIG').AsInteger;
     end;
  end;

  if ParName = 'Procedencia' then
  begin
     with QSPProcedencia do
     begin
        if FieldByName('TIPO_O').AsString = 'OFC' then
           ParValue := Format(_('Oferta %s Linea %s Fecha %s'), [FieldByName('RIG_O').AsString, FieldByName('LINEA_O').AsString, DateToStr(FieldByName('FECHA').AsDateTime)])
        else if FieldByName('TIPO_O').AsString = 'PEC' then
           ParValue := Format(_('Pedido %s Linea %s Fecha %s'), [FieldByName('RIG_O').AsString, FieldByName('LINEA_O').AsString, DateToStr(FieldByName('FECHA').AsDateTime)])
        else if FieldByName('TIPO_O').AsString = 'ALB' then
           ParValue := Format(_('Albaran %s Linea %s Fecha %s'), [FieldByName('RIG_O').AsString, FieldByName('LINEA_O').AsString, DateToStr(FieldByName('FECHA').AsDateTime)])
        else if FieldByName('TIPO_O').AsString = 'TIC' then
           ParValue := Format(_('Ticket %s Linea %s Fecha %s'), [FieldByName('RIG_O').AsString, FieldByName('LINEA_O').AsString, DateToStr(FieldByName('FECHA').AsDateTime)])
        else
           ParValue := '';
     end;
  end;

  // Para que no la muestre por artículo, sino por procedencia.
  // KRI 120 Devuelve también la referencia
  if ParName = 'ProcedenciaUnica' then
  begin
     with QSPProcedencia do
     begin
        if (DMMain.EstadoKri(120) = 1) then
        begin
           if FieldByName('TIPO_O').AsString = 'OFC' then
              ParValue := Format(_('Oferta %s Fecha %s %s'), [FieldByName('RIG_O').AsString, DateToStr(FieldByName('FECHA').AsDateTime), FieldByName('SU_REFERENCIA').AsString])
           else if FieldByName('TIPO_O').AsString = 'PEC' then
              ParValue := Format(_('Pedido %s Fecha %s %s'), [FieldByName('RIG_O').AsString, DateToStr(FieldByName('FECHA').AsDateTime), FieldByName('SU_REFERENCIA').AsString])
           else if FieldByName('TIPO_O').AsString = 'ALB' then
              ParValue := Format(_('Albarán %s Fecha %s %s'), [FieldByName('RIG_O').AsString, DateToStr(FieldByName('FECHA').AsDateTime), FieldByName('SU_REFERENCIA').AsString])
           else if FieldByName('TIPO_O').AsString = 'TIC' then
              ParValue := Format(_('Ticket %s Fecha %s'), [FieldByName('RIG_O').AsString, DateToStr(FieldByName('FECHA').AsDateTime)])
           else
              ParValue := '';
        end
        else
        begin
           if FieldByName('TIPO_O').AsString = 'OFC' then
              ParValue := Format(_('Oferta %s Fecha %s'), [FieldByName('RIG_O').AsString, DateToStr(FieldByName('FECHA').AsDateTime)])
           else if FieldByName('TIPO_O').AsString = 'PEC' then
              ParValue := Format(_('Pedido %s Fecha %s'), [FieldByName('RIG_O').AsString, DateToStr(FieldByName('FECHA').AsDateTime)])
           else if FieldByName('TIPO_O').AsString = 'ALB' then
              ParValue := Format(_('Albarán %s Fecha %s'), [FieldByName('RIG_O').AsString, DateToStr(FieldByName('FECHA').AsDateTime)])
           else if FieldByName('TIPO_O').AsString = 'TIC' then
              ParValue := Format(_('Ticket %s Fecha %s'), [FieldByName('RIG_O').AsString, DateToStr(FieldByName('FECHA').AsDateTime)])
           else
              ParValue := '';
        end;
     end;
  end;

  if ParName = 'ProcedenciaUnicaSerie' then  // Muestra la Serie de procedencia
  begin
     with QSPProcedencia do
     begin
        if ((FieldByName('TIPO_O').AsString = 'OFC') or
           (FieldByName('TIPO_O').AsString = 'PEC') or
           (FieldByName('TIPO_O').AsString = 'ALB') or
           (FieldByName('TIPO_O').AsString = 'TIC')) then
           ParValue := Format(_('Oferta %s Serie %s Fecha %s %s'), [FieldByName('RIG_O').AsString, FieldByName('SERIE_O').AsString, DateToStr(FieldByName('FECHA').AsDateTime)])
        else
           ParValue := '';
     end;
  end;

  // Devuelve el documento de procedencia.
  if ParName = 'Proc' then
  begin
     with QSPProcedencia do
     begin
        if ((FieldByName('TIPO_O').AsString = 'OFC') or
           (FieldByName('TIPO_O').AsString = 'PEC') or
           (FieldByName('TIPO_O').AsString = 'ALB') or
           (FieldByName('TIPO_O').AsString = 'TIC')) then
           ParValue := FieldByName('TIPO_O').AsString + FieldByName('SERIE_O').AsString + FieldByName('RIG_O').AsString
        else
           ParValue := '';
     end;
  end;

  // Devuelve el Pedido de procedencia
  if ParName = 'ProcPEC' then
  begin
     with QSPProcedencia do
     begin
        while (not EOF) and (FieldByName('TIPO_O').AsString <> 'PEC') do
           Next;

        if (FieldByName('TIPO_O').AsString = 'PEC') then
           ParValue := ParValue + FieldByName('TIPO_O').AsString + FieldByName('SERIE_O').AsString + FieldByName('RIG_O').AsString
        else
           ParValue := '';
     end;
  end;

  if ParName = 'PieVisible' then
     if ((not QMCabecera.EOF) and (DobleCabecera.Active) and (QMCabecera.FieldByName('ID_S').AsInteger = DobleCabecera.FieldByName('ID_S').AsInteger)) then
        ParValue := 0
     else
        ParValue := 1;

  if ParName = 'Vencimientos' then
     ParValue := ObtenerVtos;
  if ParName = 'Vencimientos2' then
     ParValue := Vencimientos2;

  if ParName = 'Moneda_Sec' then
     ParValue := Moneda_Sec;
  if ParName = 'TotalMonSec' then
  begin
     if (DobleCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
        Cambio := 1 / DobleCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;
     ParValue := DMMain.DameCambio(True, DobleCabecera.FieldByName('MONEDA').AsString, Moneda_Sec, DobleCabecera.FieldByName('FECHA').AsDateTime, DobleCabecera.FieldByName('TOTAL_A_COBRAR').AsFloat, Cambio);
  end;

  if ParName = 'NroSerie' then
     ParValue := nro_serie;

  // Variables PIVA[1..9] - Porcentaje de IVA
  if Copy(UpperCase(ParName), 1, 4) = 'PIVA' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 5, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('P_IVA').IsNull then
           ParValue := xDobleIva.FieldByName('P_IVA').AsFloat;
     end;
  end;

  // Variables PIVAR[1..9] o PRE[1..9] - Porcentaje de Recargo por equivalencia
  if (Copy(UpperCase(ParName), 1, 5) = 'PIVAR') or (Copy(UpperCase(ParName), 1, 3) = 'PRE') then
  begin
     i := 0;
     if (Copy(UpperCase(ParName), 1, 5) = 'PIVAR') then
        i := StrToIntDef(Copy(UpperCase(ParName), 6, 1), 0);
     if (Copy(UpperCase(ParName), 1, 3) = 'PRE') then
        i := StrToIntDef(Copy(UpperCase(ParName), 4, 1), 0);

     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('P_RE').IsNull then
           ParValue := xDobleIva.FieldByName('P_RE').AsFloat;
     end;
  end;

  // Variables BI[1..9] - Base Imponible
  if Copy(UpperCase(ParName), 1, 2) = 'BI' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 3, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('S_BASES_DTO').IsNull then
           ParValue := xDobleIva.FieldByName('S_BASES_DTO').AsFloat;
     end;
  end;

  // Variables IIVA[1..9] - Importe de IVA
  if Copy(UpperCase(ParName), 1, 4) = 'IIVA' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 5, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('I_IVA').IsNull then
           ParValue := xDobleIva.FieldByName('I_IVA').AsFloat;
     end;
  end;

  // Variables IIVAR[1..9] - Importe de Recargo por equivalencia
  if (Copy(UpperCase(ParName), 1, 5) = 'IIVAR') or (Copy(UpperCase(ParName), 1, 3) = 'IRE') then
  begin
     i := 0;
     if (Copy(UpperCase(ParName), 1, 5) = 'IIVAR') then
        i := StrToIntDef(Copy(UpperCase(ParName), 6, 1), 0);
     if (Copy(UpperCase(ParName), 1, 3) = 'IRE') then
        i := StrToIntDef(Copy(UpperCase(ParName), 4, 1), 0);

     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('I_RE').IsNull then
           ParValue := xDobleIva.FieldByName('I_RE').AsFloat;
     end;
  end;

  // Variables PIA[1..9] - Porcentaje Impuesto Adicional
  if Copy(UpperCase(ParName), 1, 3) = 'PIA' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 4, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('P_IMPUESTO_ADICIONAL').IsNull then
           ParValue := xDobleIva.FieldByName('P_IMPUESTO_ADICIONAL').AsFloat;
     end;
  end;

  // Variables IIA[1..9] - Importe Impuesto Adicional
  if Copy(UpperCase(ParName), 1, 3) = 'IIA' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 4, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('I_IMPUESTO_ADICIONAL').IsNull then
           ParValue := xDobleIva.FieldByName('I_IMPUESTO_ADICIONAL').AsFloat;
     end;
  end;

  // Variables IVA_RE[1..9] - Importe IVA + Recargo por equivalencia
  if Copy(UpperCase(ParName), 1, 6) = 'IVA_RE' then
  begin
     i := StrToIntDef(Copy(UpperCase(ParName), 7, 1), 0);
     if (i > 0) then
     begin
        ParValue := 0;

        xDobleIva.Close;
        xDobleIva.Open;

        while ((not xDobleIva.EOF) and (i > 1)) do
        begin
           xDobleIva.Next;
           Dec(i);
        end;

        if not xDobleIva.EOF and not xDobleIva.FieldByName('I_RE').IsNull and not xDobleIva.FieldByName('I_IVA').IsNull then
           ParValue := xDobleIva.FieldByName('I_RE').AsFloat + xDobleIva.FieldByName('I_IVA').AsFloat;
     end;
  end;

  if ParName = 'PrecioUdPtoVerde' then
  begin
     ParValue := 0;
     if (xCliente.FieldByName('APLICAR_PTO_VERDE').AsInteger = 1) then
        ParValue := xArticulos.FieldByName('PTO_VERDE').AsFloat;

     ParValue := DMMain.DameCambio(False, REntorno.Moneda, QMCabecera.FieldByName('MONEDA').AsString, QMCabecera.FieldByName('FECHA').AsDateTime, ParValue, QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat);
  end;

  if ParName = 'ACTIVA_IVA_VENC' then
  begin
     xDobleIva.Close;
     xDobleIva.Open;
     xDobleRecibos.Close;
     xDobleRecibos.Open;
     ParValue := '';
     IVA := 1;
     VENCIMIENTO := 1;
  end;

  if ParName = 'NEXT_IVA' then
  begin
     IVA := IVA + 1;
     xDobleIva.Next;
     if IVA > xDobleIva.RecordCount then
        IVA := -100;
     ParValue := ' ';
  end;
  if ParName = 'NEXT_RECIBO' then
  begin
     VENCIMIENTO := VENCIMIENTO + 1;
     xDobleRecibos.Next;
     if VENCIMIENTO > xDobleRecibos.RecordCount then
        VENCIMIENTO := -100;
     ParValue := ' ';
  end;

  if ParName = 'DOBLE_ID_CARTERA_DETALLE' then
  begin
     if ((VENCIMIENTO > 0) and (xDobleRecibos.RecordCount <> 0)) then
        ParValue := xDobleRecibos.FieldByName('ID_CARTERA_DETALLE').AsInteger
     else
        ParValue := 0;
  end;
  if ParName = 'DOBLE_VENCIMIENTO' then
  begin
     if ((VENCIMIENTO > 0) and (xDobleRecibos.RecordCount <> 0)) then
        ParValue := DateToStr(xDobleRecibos.FieldByName('VENCIMIENTO').AsDateTime)
     else
        ParValue := '';
  end;
  if ParName = 'DOBLE_LIQUIDO' then
  begin
     if ((VENCIMIENTO > 0) and (xDobleRecibos.RecordCount <> 0)) then
        ParValue := FormatFloat(LocalMascaraN, xDobleRecibos.FieldByName('LIQUIDO').AsFloat)
     else
        ParValue := '';
  end;
  if ParName = 'DOBLE_PAGADO' then
  begin
     if ((VENCIMIENTO > 0) and (xDobleRecibos.RecordCount <> 0)) then
        ParValue := xDobleRecibos.FieldByName('PAGADO').AsInteger
     else
        ParValue := '';
  end;

  if ParName = 'DOBLE_TITULO_TIPO_EFECTO' then
  begin
     if ((VENCIMIENTO > 0) and (xDobleRecibos.RecordCount <> 0)) then
        ParValue := xDobleRecibos.FieldByName('TITULO_TIPO_EFECTO').AsString
     else
        ParValue := '';
  end;

  if ParName = 'DOBLE_P_RECARGO' then
  begin
     if (IVA > 0) and (xDobleIva.FieldByName('P_RE').AsFloat > 0) then
        ParValue := FormatFloat(MascaraN, xDobleIva.FieldByName('P_RE').AsFloat)
     else
        ParValue := '';
  end;
  if ParName = 'DOBLE_I_RECARGO' then
  begin
     if (IVA > 0) and (xDobleIva.FieldByName('P_RE').AsFloat > 0) then
        ParValue := FormatFloat(LocalMascaraN, xDobleIva.FieldByName('I_RE').AsFloat)
     else
        ParValue := '';
  end;

  if ParName = 'DOBLE_P_IVA' then
  begin
     if (IVA > 0) then
        ParValue := FormatFloat(MascaraP, xDobleIva.FieldByName('P_IVA').AsFloat)
     else
        ParValue := '';
  end;
  if ParName = 'DOBLE_I_IVA' then
  begin
     if (IVA > 0) then
        ParValue := FormatFloat(LocalMascaraN, xDobleIva.FieldByName('I_IVA').AsFloat)
     else
        ParValue := '';
  end;
  if ParName = 'DOBLE_P_PP' then
  begin
     if (IVA > 0) then
        ParValue := FormatFloat(MascaraP, xDobleIVA.FieldByName('DTO_PP').AsFloat)
     else
        ParValue := '';
  end;
  if ParName = 'DOBLE_I_PP' then
  begin
     if (IVA > 0) then
        ParValue := FormatFloat(LocalMascaraN, xDobleIVA.FieldByName('I_DTO_PP').AsFloat)
     else
        ParValue := '';
  end;
  if ParName = 'DOBLE_BASE_IMPONIBLE' then
  begin
     if (IVA > 0) then
        ParValue := FormatFloat(LocalMascaraN,
           xDobleIva.FieldByName('S_BASES_DTO').AsFloat)
     else
        ParValue := '';
  end;

  if ParName = 'IMAGEN' then
  begin
     if n_imagen > 0 then
        ParValue := n_imagen
     else
        ParValue := -1;
  end;

  if ParName = 'RECTIFICACION' then
  begin
     ParValue := '';
     if (QMCabecera.FieldByName('RECT').AsInteger = 1) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG FROM GES_CABECERAS_S WHERE ID_S = :ID_RECT';
              Params.ByName['ID_RECT'].AsInteger := QMCabecera.FieldByName('ID_RECT').AsInteger;
              ExecQuery;
              ParValue := Format(_('Rectificación de la Factura: %s/%d'), [FieldByName['SERIE'].AsString, FieldByName['RIG'].AsInteger]);
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;

  if ParName = 'DOB_RECTIFICACION' then
  begin
     ParValue := '';
     if (DobleCabecera.FieldByName('RECT').AsInteger = 1) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG FROM GES_CABECERAS_S WHERE ID_S = :ID_RECT';
              Params.ByName['ID_RECT'].AsInteger := DobleCabecera.FieldByName('ID_RECT').AsInteger;
              ExecQuery;
              ParValue := Format(_('Rectificación de la Factura: %s/%d'), [FieldByName['SERIE'].AsString, FieldByName['RIG'].AsInteger]);
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;

  if ParName = 'Barras' then
     ParValue := DameCodigoBarras(QMDetalle.FieldByName('ARTICULO').AsString);

  if ParName = 'EAN13' then
     ParValue := DameEAN13Articulo(QMDetalle.FieldByName('ARTICULO').AsString);

  if ParName = 'EAN8' then
     ParValue := DameEAN8Articulo(QMDetalle.FieldByName('ARTICULO').AsString);

  if ParName = 'DUN14' then
     ParValue := DameDUN14Articulo(QMDetalle.FieldByName('ARTICULO').AsString);

  if ParName = 'UPC' then
     ParValue := DameUPCArticulo(QMDetalle.FieldByName('ARTICULO').AsString);

  if ParName = 'ISBN' then
     ParValue := DameISBNArticulo(QMDetalle.FieldByName('ARTICULO').AsString);

  //Portes en documentos
  if ParName = 'PorteVisible' then
     ParValue := not (QMCabecera.FieldByName('TIPO_PORTES').AsInteger = 0);

  if ParName = 'DoblePorteVisible' then
     ParValue := not (DobleCabecera.FieldByName('TIPO_PORTES').AsInteger = 0);

  if ParName = 'DescPortes' then
     ParValue := DameTituloPorte(QMCabecera.FieldByName('TIPO_PORTES').AsInteger, QMCabecera.FieldByName('IDIOMA').AsString);

  if ParName = 'DobleDescPortes' then
     ParValue := DameTituloPorte(DobleCabecera.FieldByName('TIPO_PORTES').AsInteger, DobleCabecera.FieldByName('IDIOMA').AsString);

  //Promociones
  if ParName = 'Articulo_prm' then
     if (QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) then
        ParValue := ' '
     else
        ParValue := QMPromociones.FieldByName('ARTICULO').AsString;

  if ParName = 'Unidades_prm' then
  begin
     if ((QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMPromociones.FieldByName('UNIDADES').AsFloat = 0)) then
        ParValue := ' '
     else
     begin
        if (xArticulos.FieldByName('PRMPVP_POR_UD_SECUNDARIA').AsInteger <> 0) then
           ParValue := TrimRight(FormatFloat(MascaraI, QMPromociones.FieldByName('UNIDADES_SEC').AsFloat) +
              ' ' + DMMain.DameSignoUnidadArticulo(QMPromociones.FieldByName('ARTICULO').AsString))
        else
           ParValue := TrimRight(FormatFloat(MascaraI,
              QMPromociones.FieldByName('UNIDADES').AsFloat) + ' ' + DMMain.DameSignoUnidadArticulo(QMPromociones.FieldByName('ARTICULO').AsString));
     end;
  end;

  if ParName = 'DetalleVisible' then
     ParValue := not (QMDetalle.EOF);

  if ParName = 'NombreUsuarioKri' then {dji lrk kri}
     ParValue := DameNombreCorreoUsuario(DameUsuarioSegunEntrada(QMCabecera.FieldByName('ENTRADA').AsInteger));

  if (ParName = 'NombreUsuarioCreacion') then
     ParValue := DameTituloUsuario(QMCabecera.FieldByName('USUARIO_CREACION').AsInteger);

  if (ParName = 'DblNombreUsuarioCreacion') then
     ParValue := DameTituloUsuario(DobleCabecera.FieldByName('USUARIO_CREACION').AsInteger);

  // SFG_RSL -BEGIN- COGE CAMPO DE REFERENCIA DE PEDIDO DE CLIENTE
  if ParName = 'PEDIDO_CLIENTE' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT PED.PEDIDO_CLIENTE FROM GES_CABECERAS_S PED ');
           SQL.Add(' JOIN GES_CABECERAS_RELACIONES RA ');
           SQL.Add(' ON PED.EMPRESA = RA.O_EMPRESA AND PED.EJERCICIO = RA.O_EJERCICIO AND PED.CANAL = RA.O_CANAL AND PED.SERIE = RA.O_SERIE AND PED.TIPO = RA.O_TIPO AND PED.RIG = RA.O_RIG ');
           SQL.Add(' JOIN GES_CABECERAS_RELACIONES RF ');
           SQL.Add(' ON RF.O_EMPRESA = RA.D_EMPRESA AND RF.O_EJERCICIO = RA.D_EJERCICIO AND RF.O_CANAL = RA.D_CANAL AND RF.O_SERIE = RA.D_SERIE AND RF.O_TIPO = RA.D_TIPO AND RF.O_RIG = RA.D_RIG ');
           SQL.Add(' WHERE ');
           SQL.Add(' RF.D_EMPRESA = ?EMPRESA AND ');
           SQL.Add(' RF.D_EJERCICIO = ?EJERCICIO AND ');
           SQL.Add(' RF.D_CANAL = ?CANAL AND ');
           SQL.Add(' RF.D_SERIE = ?SERIE AND ');
           SQL.Add(' RF.D_TIPO = ?TIPO AND ');
           SQL.Add(' RF.D_RIG = ?RIG ');

           Params.ByName['EMPRESA'].AsInteger := QMDetalle.FieldByName('EMPRESA').AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMDetalle.FieldByName('EJERCICIO').AsInteger;
           Params.ByName['CANAL'].AsInteger := QMDetalle.FieldByName('CANAL').AsInteger;
           Params.ByName['SERIE'].AsString := QMDetalle.FieldByName('SERIE').AsString;
           Params.ByName['TIPO'].AsString := QMDetalle.FieldByName('TIPO').AsString;
           Params.ByName['RIG'].AsInteger := QMDetalle.FieldByName('RIG').AsInteger;
           // Params.ByName['LINEA'].AsInteger := QMDetalle.FieldByName('LINEA').AsInteger;
           ExecQuery;
           ParValue := FieldByName['PEDIDO_CLIENTE'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
  // SFG_RSL -END- COGE CAMPO DE REFERENCIA DE PEDIDO DE CLIENTE

  // Factura Electrónica
  if (ParName = 'CadenaOriginalMX') then
  begin
     // Este procedimiento no existe en la base de datos
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE DAME_DATOS_CADENA_ORIGINAL_MX(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :RIG, :ID_S)';
           Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabecera.FieldByName('EJERCICIO').AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabecera.FieldByName('CANAL').AsInteger;
           Params.ByName['SERIE'].AsString := QMCabecera.FieldByName('SERIE').AsString;
           Params.ByName['RIG'].AsInteger := QMCabecera.FieldByName('RIG').AsInteger;
           Params.ByName['ID_S'].AsInteger := QMCabecera.FieldByName('ID_S').AsInteger;
           ExecQuery;
           ParValue := FieldByName['CADENA'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if (ParName = 'TipoDeComprobante') then
     ParValue := TipoDeComprobante;

  if (ParName = 'FormaPagoMX') then
     ParValue := FormaPagoMX;

  if (ParName = 'MetodoDePago') then
     ParValue := MetodoDePago;

  if (ParName = 'NumCtaPago') then
     ParValue := NumCtaPago;

  if (ParName = 'CondicionesDePago') then
     ParValue := CondicionesDePago;

  if ParName = 'TituloAgente' then
     ParValue := DameTituloAgente(QMCabecera.FieldByName('AGENTE').AsInteger);

  if UpperCase(ParName) = 'FORMA_PAGO_IDIOMA' then
     ParValue := DameTituloFormaPago(QMCabecera.FieldByName('FORMA_PAGO').AsString, QMCabecera.FieldByName('IDIOMA').AsString);

  if UpperCase(ParName) = 'DOB_FORMA_PAGO_IDIOMA' then
     if (DobleCabecera.Active) then
        ParValue := DameTituloFormaPago(DobleCabecera.FieldByName('FORMA_PAGO').AsString, DobleCabecera.FieldByName('IDIOMA').AsString);

  if UpperCase(ParName) = 'FORMA_PAGO_IDIOMA_LARGO' then
     ParValue := DameTituloLargoFormaPago(QMCabecera.FieldByName('FORMA_PAGO').AsString, QMCabecera.FieldByName('IDIOMA').AsString);

  if UpperCase(ParName) = 'DOB_FORMA_PAGO_IDIOMA_LARGO' then
     if (DobleCabecera.Active) then
        ParValue := DameTituloLargoFormaPago(DobleCabecera.FieldByName('FORMA_PAGO').AsString, DobleCabecera.FieldByName('IDIOMA').AsString);

  if UpperCase(ParName) = 'CANT_NRO_SERIE' then
     ParValue := NrosSerieAlquiler.RecordCount;

  if ParName = 'NroSerieLista' then
  begin
     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add(' SELECT S.ARTICULO, A.TITULO_LARGO AS TITULO, LIST(S.NSERIE, '', '') ');
              SelectSQL.Add(' FROM VER_DETALLE_SERIALIZACION S ');
              SelectSQL.Add(' JOIN ART_ARTICULOS A ON S.EMPRESA = A.EMPRESA AND S.ARTICULO = A.ARTICULO ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' S.EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' S.EJERCICIO = :EJERCICIO AND ');
              SelectSQL.Add(' S.CANAL = :CANAL AND ');
              SelectSQL.Add(' S.SERIE = :SERIE AND ');
              SelectSQL.Add(' S.TIPO = :TIPO AND ');
              SelectSQL.Add(' S.RIG = :RIG AND ');
              SelectSQL.Add(' S.LINEA = :LINEA ');
              SelectSQL.Add(' GROUP BY S.ARTICULO, A.TITULO_LARGO ');
              Params.ByName['EMPRESA'].AsInteger := QMDetalle.FieldByName('EMPRESA').AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := QMDetalle.FieldByName('EJERCICIO').AsInteger;
              Params.ByName['CANAL'].AsInteger := QMDetalle.FieldByName('CANAL').AsInteger;
              Params.ByName['SERIE'].AsString := QMDetalle.FieldByName('SERIE').AsString;
              Params.ByName['TIPO'].AsString := QMDetalle.FieldByName('TIPO').AsString;
              Params.ByName['RIG'].AsInteger := QMDetalle.FieldByName('RIG').AsInteger;
              Params.ByName['LINEA'].AsInteger := QMDetalle.FieldByName('LINEA').AsInteger;
              Open;

              // Salto de linea antes de cada registro, excepto el primero.
              s := '';
              ParValue := '';
              while not EOF do
              begin
                 ParValue := ParValue + s + FieldByName('ARTICULO').AsString + ' - ' + FieldByName('TITULO').AsString;
                 s := #13#10;
                 ParValue := ParValue + s + FieldByName('LIST').AsString;
                 Next;
              end;

              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'LotesLista' then
  begin
     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add(' SELECT LIST(LOTE, '', '') ');
              SelectSQL.Add(' FROM GES_DETALLES_S_LOTES ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' ID_DETALLES_S = :ID_DETALLES_S ');
              Params.ByName['ID_DETALLES_S'].AsInteger := QMDetalle.FieldByName('ID_DETALLES_S').AsInteger;
              Open;

              ParValue := FieldByName('LIST').AsString;

              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
  end;

  // Texto con el que se ha hecho el codigo de barras PDF417 para factuas de Chile.
  if ParName = 'Timbre' then
  begin
     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Text := 'SELECT TIMBRE_TEXTO FROM GES_CABECERAS_S_FE_CHL WHERE ID_S = :ID_S';
              Params.ByName['ID_S'].AsInteger := QMCabecera.FieldByName('ID_S').AsInteger;
              Open;

              ParValue := FieldByName('TIMBRE_TEXTO').AsString;

              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'TicketBAI' then
     ParValue := DameTicketBAI(DobleCabecera.FieldByName('ID_S').AsInteger);

  if ParName = 'NotasCabTO' then
     ParValue := FMain.DameTexto(TBlobField(QMCabecera.FieldByName('NOTAS')));
  if ParName = 'NotasDetTO' then
     ParValue := FMain.DameTexto(TBlobField(QMDetalle.FieldByName('NOTAS')));
  if ParName = 'NotasArtTO' then
     ParValue := FMain.DameTexto(TBlobField(xArticulos.FieldByName('NOTAS')));
  if ParName = 'NotasArtComprasTO' then
     ParValue := FMain.DameTexto(TBlobField(xArticulos.FieldByName('NOTAS_COMPRAS')));
  if ParName = 'NotasArtVentasTO' then
     ParValue := FMain.DameTexto(TBlobField(xArticulos.FieldByName('NOTAS_VENTAS')));
  if ParName = 'NotasArtIdiomaTO' then
     ParValue := FMain.DameTexto(TBlobField(xArticulosIdioma.FieldByName('DESCRIPCION_EXTENDIDA')));

  if ParName = 'Stock' then
     ParValue := DMMain.DameStockArticulo(QMDetalle.FieldByName('EMPRESA').AsInteger, QMDetalle.FieldByName('CANAL').AsInteger, QMDetalle.FieldByName('ARTICULO').AsString, QMDetalle.FieldByName('ALMACEN').AsString);

  if ParName = 'TextoQRVerifactu' then
  begin
     if (QMCabecera.FieldByName('ESTADO').AsInteger = 5) then
        ParValue := xVerifactu.FieldByName('INFO_QR').AsString
     else
        ParValue := '';
  end;

  if ParName = 'TextoQRECF' then
     ParValue := xECF.FieldByName('DOCUMENT_STAMP_URL').AsString;

  if ParName = 'TextoStampDate' then
     ParValue := xECF.FieldByName('STAMP_DATE').AsString;

  if ParName = 'TextoSecurityCode' then
     ParValue := xECF.FieldByName('SECURITY_CODE').AsString;

  if (UpperCase(ParName) = UpperCase('TarifaIVAIncluido')) then
     ParValue := TarifaEsIvaIncluido(QMCabecera.FieldByName('TARIFA').AsString);

  if ParName = 'TituloFamilia' then
     ParValue := DameTituloFamilia(xArticulos.FieldByName('FAMILIA').AsString);

  if (REntorno.Pais = 'CHL') then
  begin
     // Buscamos Giro cliente
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT G.CODIGO_GIRO, T.TITULO ');
           SQL.Add(' FROM EMP_CLIENTES_GIROS G ');
           SQL.Add(' JOIN SYS_TIPO_GIRO T ON G.ID_TIPO_GIRO = T.ID ');
           SQL.Add(' WHERE ');
           SQL.Add(' G.EMPRESA = :EMPRESA AND ');
           SQL.Add(' G.CLIENTE = :CLIENTE AND ');
           SQL.Add(' G.DEFECTO = 1 ');
           Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
           Params.ByName['CLIENTE'].AsInteger := QMCabecera.FieldByName('CLIENTE').AsInteger;
           ExecQuery;
           GiroCliente := FieldByName['CODIGO_GIRO'].AsString;
           TituloGiroCliente := FieldByName['TITULO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (ParName = 'GIRO_CLIENTE') then
        ParValue := GiroCliente;

     if (ParName = 'TITULO_GIRO_CLIENTE') then
        ParValue := TituloGiroCliente;
  end;
end;

procedure TDMLstFactura.frFacturaEnterRect(Memo: TStringList; View: TfrView);
var
  NumeroFirma : integer;
  s : string;
  Imagen : TImage;
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraArt]', Memo[0]) > 0) then
        View.FormatStr := CalculaMascara(DMMain.DameDecimalesUnidad(xArticulos.FieldByName('UNIDADES').AsString), False);

     if (Pos('[MascaraArtT]', Memo[0]) > 0) then
        View.FormatStr := CalculaMascara(DMMain.DameDecimalesUnidad(xArticulos.FieldByName('UNIDADES').AsString), False);

     if Memo[0] = '[NotasArt]' then
        Memo[0] := ric.Strings[j];

     if Memo[0] = '[NotasCabecera]' then
        Memo[0] := NotasCab.Strings[indNotas];

     if (Pos('[Notas]', Memo[0]) > 0) then
     begin
        if QMCabecera.FieldByName('NOTAS').Value = '' then
        begin
           view.Visible := False;
           view.Parent.dy := 0;
        end
        else
        begin
           if Copy(QMCabecera.FieldByName('NOTAS').Value, 1, 4) = #$D#$A#$D#$A then
              view.Parent.dy := 0
           else
           begin
              view.Parent.dy := 34;
              view.Visible := True;
           end;
        end;
     end;

     if (Memo[0] = 'CANTIDADES') then
        SW := 1;
     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
     if (Pos('[MascaraNSec]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraNSec;
     if (Pos('[MascaraE]', Memo[0]) > 0) then
        View.FormatStr := '###,###,##0.00';

     if (Pos('[MascaraP]', Memo[0]) > 0) then
        if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
           (QMDetalle.FieldByName('UNIDADES').AsFloat = 0) and (view.Parent.DataSet = frDBDetalle)) then
           Memo[0] := ''
        else
           View.FormatStr := MascaraP;

     if (Pos('[MascaraL]', Memo[0]) > 0) then
        if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
           (QMDetalle.FieldByName('UNIDADES').AsFloat = 0) and (view.Parent.DataSet = frDBDetalle)) then
           Memo[0] := ''
        else
           View.FormatStr := LocalMascaraL;

     if (Memo[0] = '[ImgArticulo]') and (View is TfrPictureView) then
     begin
        DMListados.MostrarImagen(xArticulos.FieldByName('IMAGEN').AsInteger, View);
        n_imagen := xArticulos.FieldByName('IMAGEN').AsInteger;
     end;

     if (Memo[0] = '[ImgDetalle]') and (View is TfrPictureView) then
        DMListados.MostrarImagen(QMDetalle.FieldByName('ID_IMAGEN').AsInteger, View);

     if Memo[0] = '[NotasArtPRM]' then
     begin
        Memo[0] := ric_prm.Strings[x];
     end;

     // Codigo de Respuesta Rapida (Codigo QR para factura Bolivia)
     if (Memo[0] = '[CodigoRespuestaRapida]') and (View is TfrPictureView) then
     begin
        Imagen := TImage.Create(nil);
        try
           CrearCodigoQR(Imagen.Picture.Bitmap, QMCabecera.FieldByName('SFV_CODIGO_RESPUESTA_RAPIDA').AsString, 3);
           TfrPictureView(View).Picture.Assign(Imagen.Picture);
        finally
           Imagen.Free;
        end;
     end;

     // Codigo de TicketBAI (Codigo QR para factura Pais Vasco)
     if (Memo[0] = '[QRTicketBAI]') and (View is TfrPictureView) then
     begin
        with DobleCabecera do
        begin
           s := 'https://batuz.eus/QRTBAI/';
           s := s + '?id=' + DameTicketBAI(FieldByName('ID_S').AsInteger);
           s := s + '&s=' + FieldByName('SERIE').AsString;
           s := s + '&nf=' + FieldByName('RIG').AsString;
           s := s + '&i=' + FloatToStrDec(FieldByName('LIQUIDO').AsFloat, '.');
           s := s + '&cr=' + format('%.3d', [CalcCRC8Str(s)]);
        end;

        Imagen := TImage.Create(nil);
        try
           CrearCodigoQR(Imagen.Picture.Bitmap, s, 3);
           TfrPictureView(View).Picture.Assign(Imagen.Picture);
        finally
           Imagen.Free;
        end;
     end;

     if (Memo[0] = '[ImgTimbre]') and (View is TfrPictureView) then
     begin
        Imagen := TImage.Create(nil);
        try
           RefrescarImagenTimbre(Imagen, QMCabecera.FieldByName('ID_S').AsInteger);
           TfrPictureView(View).Picture.Assign(Imagen.Picture);
        finally
           Imagen.Free;
        end;
     end;

     if (Memo[0] = '[DobleImgTimbre]') and (View is TfrPictureView) then
     begin
        Imagen := TImage.Create(nil);
        try
           RefrescarImagenTimbre(Imagen, DobleCabecera.FieldByName('ID_S').AsInteger);
           TfrPictureView(View).Picture.Assign(Imagen.Picture);
        finally
           Imagen.Free;
        end;
     end;

     if (Memo[0] = '[QRVerifactu]') and (View is TfrPictureView) then
     begin
        // Devuelvo imagen QR solo si la factura está contabilizada.
        Imagen := TImage.Create(nil);
        try
           if (QMCabecera.FieldByName('ESTADO').AsInteger = 5) then
           begin
              s := xVerifactu.FieldByName('INFO_QR').AsString;
              if (s <> '') then
                 CrearCodigoQR(Imagen.Picture.Bitmap, s, 3);
           end;

           TfrPictureView(View).Picture.Assign(Imagen.Picture);
        finally
           Imagen.Free;
        end;
     end;

     if (Memo[0] = '[QRECF]') and (View is TfrPictureView) then
     begin
        s := xECF.FieldByName('DOCUMENT_STAMP_URL').AsString;

        Imagen := TImage.Create(nil);
        try
           CrearCodigoQR(Imagen.Picture.Bitmap, s, 3);
           TfrPictureView(View).Picture.Assign(Imagen.Picture);
        finally
           Imagen.Free;
        end;
     end;

     // Las variables de firma tendrán el formato [Firma-n] donde 'n' es un numero
     s := Trim(Memo[0]);
     if ((Pos('[Firma-', s) > 0) and (View is TfrPictureView)) then
     begin
        // Obtengo numero de firma
        s := Copy(s, 8, Length(s) - Pos(']', s) + 1);
        NumeroFirma := StrToIntDef(s, -1);

        // Recorro firmas hasta encontrar la deseada
        if not xLstFirmas.Active then
           xLstFirmas.Open
        else
           xLstFirmas.First;

        while ((xLstFirmas.RecNo < NumeroFirma) and (not xLstFirmas.EOF)) do
           xLstFirmas.Next;

        // Si existe cargo la imagen en el Memo.
        if (xLstFirmas.RecNo = NumeroFirma) then
        begin
           Imagen := TImage.Create(nil);
           try
              RefrescarImagenFirma(Imagen, xLstFirmas.FieldByName('ID_FIRMA').AsInteger);
              TfrPictureView(View).Picture.Assign(Imagen.Picture);
           finally
              Imagen.Free;
           end;
        end;
     end;
  end;
end;

procedure TDMLstFactura.DobleCabeceraAfterScroll(DataSet: TDataSet);
var
  DatosBancarios : char;
  Comprador : string;
  BancoPagos, BancoFP : integer;
begin
  if QMCabecera.FieldByName('CLIENTE').AsInteger <= -1 then  // dji lrk kri
  begin
     xDobDireccionesNIF.Close;
     xDobDireccionesNIF.Open;
  end;

  xDobleDireccionEDI.Close;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COMPRADOR FROM GES_CABECERAS_S WHERE ID_S = ' + IntToStr(DobleCabecera.FieldByName('ID_S').AsInteger);
        ExecQuery;
        Comprador := Trim(FieldByName['COMPRADOR'].AsString);
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TERCERO, DIRECCION FROM SYS_TERCEROS_DIRECCIONES WHERE CODIGO_EDI = ''' + Comprador + '''';
        ExecQuery;
        xDobleDireccionEDI.Params.ByName['TERCERO'].AsInteger := FieldByName['TERCERO'].AsInteger;
        xDobleDireccionEDI.Params.ByName['DIRECCION'].AsInteger := FieldByName['DIRECCION'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
  xDobleDireccionEDI.Open;

  BancoPagos := 0;
  if (DobleCabecera.Active) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT BANCO_PAGOS FROM CON_CUENTAS_GES_CLI WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND CLIENTE = :CLIENTE';
           Params.ByName['EMPRESA'].AsInteger := DobleCabecera.FieldByName('EMPRESA').AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := DobleCabecera.FieldByName('EJERCICIO').AsInteger;
           Params.ByName['CANAL'].AsInteger := DobleCabecera.FieldByName('CANAL').AsInteger;
           Params.ByName['CLIENTE'].AsInteger := DobleCabecera.FieldByName('CLIENTE').AsInteger;
           ExecQuery;
           BancoPagos := FieldByName['BANCO_PAGOS'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  with DobleCabecera do
     DatosBancarios := DMMain.DameDatosBancarios(FieldByName('EMPRESA').AsInteger, FieldByName('EJERCICIO').AsInteger, FieldByName('CANAL').AsInteger, FieldByName('FORMA_PAGO').AsString, BancoFP);

  with xDobTerceroBan do
  begin
     Close;
     // Inicializamos para no mostrar ningun dato
     Params.ByName['TERCERO'].AsInteger := 0;
     Params.ByName['BANCO_CLI'].AsInteger := 0;
     Params.ByName['EMPRESA'].AsInteger := 0;
     Params.ByName['BANCO'].AsInteger := 0;
     case DatosBancarios of
        '1': // Datos del cliente
        begin
           Params.ByName['TERCERO'].AsInteger := DobleCabecera.FieldByName('TERCERO').AsInteger;
           // Si el parametro BANCO_CLI = 0, se muestra el primer banco activo según orden
           Params.ByName['BANCO_CLI'].AsInteger := DobleCabecera.FieldByName('BANCO').AsInteger;
        end;
        '2': // Datos de la empresa
        begin
           Params.ByName['EMPRESA'].AsInteger := DobleCabecera.FieldByName('EMPRESA').AsInteger;
           if (BancoPagos = 0) then
              Params.ByName['BANCO'].AsInteger := BancoFP
           else
              Params.ByName['BANCO'].AsInteger := BancoPagos;
        end;
     end;
     Open;
  end;
end;

procedure TDMLstFactura.HYReportEnterFields(Sender: THYReport; Field: UHYReport.THYField; var Source: string);
begin
  MatricialesEnterFields(Source);
  if ((detalle_con_origen and not final) and (Field.Band.HYReportSource <> nil) and
     (Field.Band.Kind = UHYReport.bkPageFooter)
     ) then
  begin
     Source := '';
  end;
end;

procedure TDMLstFactura.MostrarListadoMatricialDirecta(ID_S, rig: integer; Serie: string; Modo: byte; const Ejercicio: integer; ForzarCopias: boolean = False; Copias: integer = 0);
var
  str : string;
  i : integer;
  Listado : smallint;
begin
  TipoListado := 0;
  id_s_aux := id_s;
  SerieGen := Serie;
  SW := 1;

  with QMCabecera do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  // Actualizar el Nº de Copias
  Listado := DMListados.ObtenerListadoPerfil(xCliente.FieldByName('PERFIL').AsString, 4, True);
  if (Listado > 0) then
     DMListados.CargarMail(36, '', Listado)
  else
     DMListados.CargarMail(36, Serie);

  if (ForzarCopias) then
     REntorno.Copias := Copias;

  HYReport.LoadFromFIB(1998, str);  // Cargar el Listado Facturas Matricial
  HYReport.Prepare;
  case Modo of
     0: HYReport.Preview;
     1: for i := 1 to REntorno.Copias do
           HYReport.Print(REntorno.NombreMatricial);
  end;
  DMListados.Copias := 0;
end;

function TDMLstFactura.GetAlbaranProcedencia: string;
begin
  Result := '';
  if QSPProcedencia.FieldByName('TIPO_O').AsString = 'ALB' then
     Result := Trim(QSPProcedencia.FieldByName('RIG_O').AsString);

  if Result = '' then
     Result := ' ';
end;

// Control de las lineas de las notas de la cabecera

procedure TDMLstFactura.frUserNotasCabCheckEOF(Sender: TObject; var EOF: boolean);
begin
  EOF := (NotasCab.Count = indNotas);
end;

procedure TDMLstFactura.frUserNotasCabFirst(Sender: TObject);
begin
  indNotas := 0;
end;

procedure TDMLstFactura.frUserNotasCabNext(Sender: TObject);
begin
  indNotas := indNotas + 1;
end;

function TDMLstFactura.DameHerencia(d_tipo: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(RRIG) FROM G_RELACIONES_ORIGENES(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG) ');
        SQL.Add(' WHERE ');
        SQL.Add(' RTIPO = :D_TIPO ');
        Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabecera.FieldByName('EJERCICIO').AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabecera.FieldByName('CANAL').AsInteger;
        Params.ByName['SERIE'].AsString := QMCabecera.FieldByName('SERIE').AsString;
        Params.ByName['TIPO'].AsString := QMCabecera.FieldByName('TIPO').AsString;
        Params.ByName['RIG'].AsInteger := QMCabecera.FieldByName('RIG').AsInteger;
        Params.ByName['D_TIPO'].AsString := d_tipo;
        ExecQuery;
        Result := FieldByName['MIN'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstFactura.DameFecha(o_tipo: string; rig: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FECHA FROM GES_CABECERAS_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' TIPO = :TIPO AND ');
        SQL.Add(' RIG = :RIG ');
        Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabecera.FieldByName('EJERCICIO').AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabecera.FieldByName('CANAL').AsInteger;
        Params.ByName['SERIE'].AsString := QMCabecera.FieldByName('SERIE').AsString;
        Params.ByName['TIPO'].AsString := o_tipo;
        Params.ByName['RIG'].AsInteger := rig;
        ExecQuery;
        if o_tipo = 'PEC' then
           fecha_pedido := FieldByName['FECHA'].AsDateTime
        else
           fecha_albaran := FieldByName['FECHA'].AsDateTime;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMLstFactura.ObtenerVtos: string;
var
  NVenc : integer;
begin
  NVenc := 0;
  Vencimientos2 := '';
  with SPObtenerVtos do
  begin
     Close;
     Open;
     if (RecordCount = 0) then
        Result := ' '
     else
     begin
        while (not EOF) do
        begin
           NVenc := NVenc + 1;
           if (NVenc <= 3) then
              Result := Result + '|| ' + DateToStr(
                 SPObtenerVtos.FieldByName('VENCIMIENTO').AsDateTime) + ' : ' + FormatFloat(LocalMascaraN,
                 SPObtenerVtos.FieldByName('IMPORTE').AsFloat) + ' '
           else
              Vencimientos2 := Vencimientos2 + '|| ' + DateToStr(
                 SPObtenerVtos.FieldByName('VENCIMIENTO').AsDateTime) + ' : ' + FormatFloat(LocalMascaraN,
                 SPObtenerVtos.FieldByName('IMPORTE').AsFloat) + ' ';
           Next;
        end;  // while
        if (NVenc <= 3) then
           Result := Result + '||';
        if (NVenc > 3) then
           Vencimientos2 := Vencimientos2 + '||';
     end;
  end;  // with
end;

procedure TDMLstFactura.MatricialesEnterFields(var Source: string);
var
  strTotal : string;
  aux{, Direccion} : string;
  pto_verde : double;
  Cambio : extended;
begin
  DMListados.EnterFields(Source);

  if (Source = '[Z_QUINTALES]') then
  begin
     // Source := FormatFloat(LocalMascaraN, xArticulosPeso.AsFloat * QMDetalleUNIDADES.AsFloat);
     // z_peso_neto := z_peso_neto +  (xArticulosPeso.AsFloat * QMDetalleUNIDADES.AsFloat);
     Source := FormatFloat(LocalMascaraN, xArticulos.FieldByName('Peso').AsFloat * QMDetalle.FieldByName('UNIDADES').AsFloat);
     z_peso_neto := z_peso_neto + (xArticulos.FieldByName('Peso').AsFloat * QMDetalle.FieldByName('UNIDADES').AsFloat);
  end;

  if (Source = '[Z_PESO_NETO]') then
     Source := FormatFloat(LocalMascaraN, z_peso_neto);

  if Source = '[AUTOFACTURA]' then {dji lrk kri}
     if xAutofactura.Active then
        Source := xAutofactura.FieldByName('RIG1').AsString
     else
        Source := '';
  if Source = '[AUTOFACTURA_PROVEEDOR]' then {dji lrk kri}
     if xAutofactura.Active then
        Source := xAutofactura.FieldByName('NOMBRE_R_SOCIAL').AsString
     else
        Source := '';

  if Source = '[NOTAS_ART]' then {dji lrk kri}
     if (not QMDetalle.FieldByName('NOTAS').IsNull) then
        Source := QMDetalle.FieldByName('NOTAS').AsString
     else
        Source := '';

  if Source = '[EMPRESA]' then
     Source := REntorno.NombreEmpresa;

  if Source = '[NIF_EMPRESA]' then
     Source := REntorno.CifEmpresa;

  if Source = '[EJERCICIO2]' then
     Source := Copy(QMCabecera.FieldByName('EJERCICIO').AsString, 3, 2);

  if Source = '[I_IVA]' then
     Source := FormatFloat(LocalMascaraN, xDatosIva.FieldByName('I_IVA').AsFloat);

  if Source = '[I_RE]' then
     Source := FormatFloat(LocalMascaraN, xDatosIva.FieldByName('I_RE').AsFloat);

  if Source = '[FECHA_CABECERA]' then
     Source := FormatDateTime(ShortDateFormat, QMCabecera.FieldByName('FECHA').AsDateTime);

  if Source = '[TIPO_FACTURA]' then
  begin
     if (QMCabecera.FieldByName('DEVOLUCION').AsInteger = 1) then
        Source := 'DEVOLUCION'
     else if (QMCabecera.FieldByName('SIN_DETALLE').AsInteger = 1) then
        Source := 'ABONO'
     else
        Source := '';
  end;

  if Source = '[S_BASES_IVA]' then
     Source := FormatFloat(LocalMascaraN, xDatosIva.FieldByName('S_BASES').AsFloat);

  if Source = '[FORMA_PAGO]' then
     Source := DameTituloFormaPago(QMCabecera.FieldByName('FORMA_PAGO').AsString);

  if (QMCabecera.Active and (QMCabecera.FieldByName('CLIENTE').AsInteger <= -1)) then
  begin
     if (Source = '[NIF]') then
        Source := xDireccionesNIF.FieldByName('NIF').AsString;
     if (Source = '[NOMBRE]') then
        Source := xDireccionesNIF.FieldByName('NOMBRE').AsString;
     if (Source = '[DIRECCION]') then
        Source := xDireccionesNIF.FieldByName('DIRECCION').AsString;
     if (Source = '[CODIGO_POSTAL]') then
        Source := xDireccionesNIF.FieldByName('C_POSTAL').AsString;
     if (Source = '[POBLACION]') then
        Source := xDireccionesNIF.FieldByName('PROVINCIA').AsString;
     if (Source = '[PROVINCIA]') then
        Source := ' ';
     if (Source = '[PAIS]') then
        Source := '';
  end;

  if (DobleCabecera.Active and (DobleCabecera.FieldByName('CLIENTE').AsInteger <= -1)) then
  begin
     if (Source = '[DOB_NIF]') then
        Source := xDobDireccionesNIF.FieldByName('NIF').AsString;
     if (Source = '[DOB_NOMBRE]') then
        Source := xDobDireccionesNIF.FieldByName('NOMBRE').AsString;
     if (Source = '[DOB_DIRECCION]') then
        Source := xDobDireccionesNIF.FieldByName('DIRECCION').AsString;
     if (Source = '[DOB_CODIGO_POSTAL]') then
        Source := xDobDireccionesNIF.FieldByName('C_POSTAL').AsString;
     if (Source = '[DOB_POBLACION]') then
        Source := xDobDireccionesNIF.FieldByName('PROVINCIA').AsString;
     if (Source = '[DOB_PROVINCIA]') then
        Source := ' ';
     if (Source = '[DOB_PAIS]') then
        Source := '';
  end;

  if (QMCabecera.FieldByName('CLIENTE').AsInteger > -1) then
  begin
     if (Source = '[NIF]') then
        Source := xCliente.FieldByName('NIF').AsString;
     if (Source = '[NOMBRE]') then
        Source := xCliente.FieldByName('TITULO').AsString;
     if (Source = '[DIRECCION]') then
     begin
        Source := StringReplace(xDireccion_Cliente.FieldByName('DIRECCION').AsString, '  ', ' ', [rfReplaceAll]);
     end;
     if (Source = '[CODIGO_POSTAL]') then
        Source := Copy(xDireccion_Cliente.FieldByName('CODPOB').AsString, 1, 5);
     if (Source = '[POBLACION]') then
        Source := Copy(xDireccion_Cliente.FieldByName('CODPOB').AsString, 6, 40);
     if (Source = '[PROVINCIA]') then
        Source := xDireccion_Cliente.FieldByName('PROVINCIA').AsString;
     if (Source = '[PAIS]') then
        Source := xDireccion_Cliente.FieldByName('PAIS').AsString;
  end;

  if (DobleCabecera.Active and (DobleCabecera.FieldByName('CLIENTE').AsInteger > -1)) then
  begin
     if (Source = '[DOB_NOMBRE]') then
        Source := xDobNotasClientes.FieldByName('TITULO').AsString;
     if (Source = '[DOB_DIRECCION]') then
        Source := xDobDireccionCliente.FieldByName('DIRECCION').AsString;
     if (Source = '[DOB_CODIGO_POSTAL]') then
        Source := Copy(xDobDireccionCliente.FieldByName('CODPOB').AsString, 1, 5);
     if (Source = '[DOB_POBLACION]') then
        Source := Copy(xDobDireccionCliente.FieldByName('CODPOB').AsString, 6, 40);
     if (Source = '[DOB_PROVINCIA]') then
        Source := xDobDireccionCliente.FieldByName('PROVINCIA').AsString;
     if (Source = '[DOB_PAIS]') then
        Source := xDobDireccionCliente.FieldByName('PAIS').AsString;
  end;

  if Source = '[DIR_EMPRESA]' then
     Source := REntorno.DirEmpresa + #13#10 + REntorno.PobEmpresa + ' (' +
        REntorno.ProvEmpresa + ' - ' + REntorno.Pais + ')';

  if Source = '[DIR_CLIENTE]' then
  begin
     xDireccionFiscal.Close;
     xDireccionFiscal.Open;
     Source := xDireccionFiscal.FieldByName('DIRECCION').AsString +
        #13#10 + xDireccionFiscal.FieldByName('CODPOB').AsString + ' (' +
        xDireccionFiscal.FieldByName('PROVINCIA').AsString + ' - ' +
        xDireccionFiscal.FieldByName('PAIS').AsString + ')';
  end;

  if Source = '[COD_CLI]' then
     Source := '(' + Trim(xCliente.FieldByName('CLIENTE').AsString) + ')';

  if Source = '[CUENTA_CLI]' then
     Source := '(' + Trim(xCuenta.FieldByName('CUENTA').AsString) + ')';

  if Source = '[TELF_EMPRESA]' then
     Source := REntorno.Tel1Empresa;

  if Source = '[NUM_ALBARAN]' then
     Source := GetAlbaranProcedencia;

  if Source = '[PAGINA]' then
  begin
     Pagina := Pagina + 1;
     Source := IntToStr(Pagina);
  end;

  if Source = '[POB_PROV_CLI]' then
  begin
     Source := xDireccion_Cliente.FieldByName('CODPOB').AsString;
  end;

  if Source = '[TOTAL_FAC_AJUST]' then
  begin
     Pagina := 0;
     strTotal := FormatFloat(LocalMascaraN, QMCabecera.FieldByName('TOTAL_A_COBRAR').AsFloat);
     RellenarArteriscos(strTotal, 14);
     Source := strTotal;
  end;

  if Source = '[RECTIFICACION]' then
  begin
     Source := '';
     if (QMCabecera.FieldByName('RECT').AsInteger = 1) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'select empresa,ejercicio,canal,serie,tipo,rig from ges_cabeceras_s where id_s=?id_rect';
              Params.ByName['ID_RECT'].AsInteger := QMCabecera.FieldByName('ID_RECT').AsInteger;
              ExecQuery;
              Source := Format(_('Rectificación de la Factura: %s-%s/%s'), [IntToStr(FieldByName['EJERCICIO'].AsInteger), FieldByName['SERIE'].AsString, IntToStr(FieldByName['RIG'].AsInteger)]);
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;

  if Source = '[DOB_RECTIFICACION]' then
  begin
     Source := '';
     if (DobleCabecera.FieldByName('RECT').AsInteger = 1) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'select empresa,ejercicio,canal,serie,tipo,rig from ges_cabeceras_s where id_s=?id_rect';
              Params.ByName['ID_RECT'].AsInteger := DobleCabecera.FieldByName('ID_RECT').AsInteger;
              ExecQuery;
              Source := Format(_('Rectificación de la Factura: %s-%s/%s'), [IntToStr(FieldByName['EJERCICIO'].AsInteger), FieldByName['SERIE'].AsString, IntToStr(FieldByName['RIG'].AsInteger)]);
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;

  // DETALLE

  if Source = '[ARTICULO]' then
     if QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre then
        Source := ' '
     else
        Source := QMDetalle.FieldByName('ARTICULO').AsString;

  if Source = '[UNIDADES]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(MascaraI, QMDetalle.FieldByName('UNIDADES').AsFloat);

  if Source = '[SUBTOTAL]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(LocalMascaraN,
           (QMDetalle.FieldByName('UNIDADES').AsFloat * QMDetalle.FieldByName('PRECIO').AsFloat));

  if Source = '[DTO]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FloatToStr(QMDetalle.FieldByName('DESCUENTO').AsFloat);

  if Source = '[DTO2]' then // dji lrk kri
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsInteger = 0)) then
        Source := ' '
     else
        Source := FloatToStr(QMDetalle.FieldByName('DESCUENTO_2').AsFloat);

  if Source = '[DTO3]' then // dji lrk kri
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsInteger = 0)) then
        Source := ' '
     else
        Source := FloatToStr(QMDetalle.FieldByName('DESCUENTO_3').AsFloat);

  if Source = '[PRECIO_DETALLE]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(LocalMascaraL, QMDetalle.FieldByName('PRECIO').AsFloat);

  if Source = '[B_DTO_LINEA]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(LocalMascaraL, QMDetalle.FieldByName('B_DTO_LINEA').AsFloat);

  if Source = '[P_IVA]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FloatToStr(QMDetalle.FieldByName('P_IVA').AsFloat);

  if Source = '[IVA]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(LocalMascaraN, QMDetalle.FieldByName('C_IVA').AsFloat);

  // cálculo del punto verde
  if Source = '[PRECIOUD]' then
  begin
     // pto_verde := 0;
     // Sin Formato, para poder utilizarlo en cálculos internos del listado
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
     begin
        pto_verde := 0;
        if (xCliente.FieldByName('APLICAR_PTO_VERDE').AsInteger = 1) then
           pto_verde := xArticulos.FieldByName('PTO_VERDE').AsFloat;

        {
        // Calculo del precio total de la linea
        if QMDetalle.FieldByName('UNIDADES_SEC').AsFloat <> 0 then
           precioverdeln := pto_verde * QMDetalle.FieldByName('UNIDADES_SEC').AsFloat
        else
           precioverdeln := pto_verde * QMDetalle.FieldByName('UNIDADES').AsFloat;
        }

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT PVP_POR_UD_SECUNDARIA FROM ART_ARTICULOS WHERE EMPRESA = ?EMPRESA AND ID_A = ?ID_A';
              Params.ByName['EMPRESA'].AsInteger := QMDetalle.FieldByName('EMPRESA').AsInteger;
              Params.ByName['ID_A'].AsInteger := QMDetalle.FieldByName('ID_A').AsInteger;
              ExecQuery;
              if (FieldByName['PVP_POR_UD_SECUNDARIA'].AsInteger = 1) and REntorno.PVP_Ud_Sec then
                 precioverdeln := pto_verde * QMDetalle.FieldByName('UNIDADES_SEC').AsFloat
              else
                 precioverdeln := pto_verde * QMDetalle.FieldByName('UNIDADES').AsFloat;
              FreeHandle;
           finally
              Free;
           end;
        end;

        pto_verde := DMMain.DameCambio(False, REntorno.Moneda, QMCabecera.FieldByName('MONEDA').AsString, QMCabecera.FieldByName('FECHA').AsDateTime, pto_verde, QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat);

        //calculo del precio por unidad
        pto_verde := QMDetalle.FieldByName('PRECIO').AsFloat - pto_verde;
        Source := FloatToStr(pto_verde);

        // para totalizar el punto verde
        totalptoverde := totalptoverde + precioverdeln;
     end;
  end;

  if Source = '[PRECIOVERDELN]' then
     Source := FloatToStr(DMMain.DameCambio(False, REntorno.Moneda, QMCabecera.FieldByName('MONEDA').AsString, QMCabecera.FieldByName('FECHA').AsDateTime, precioverdeln, QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat));

  // TOTALES

  if Source = '[PRECIO_TOTAL]' then
     Source := FormatFloat(LocalMascaraN, (QMDetalle.FieldByName('PRECIO').AsFloat *
        QMDetalle.FieldByName('UNIDADES').AsFloat));

  if Source = '[TOTAL_LINEA]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(LocalMascaraN, (QMDetalle.FieldByName('B_DTO_LINEA').AsFloat));

  if Source = '[TOTAL_BRUTO]' then
     Source := FormatFloat(LocalMascaraN, (DobleCabecera.FieldByName('B_COMISION').AsFloat));
  if Source = '[TOTAL_P_COMERCIAL]' then
     Source := FormatFloat(LocalMascaraN, (DobleCabecera.FieldByName('DTO_CIAL').AsFloat));
  if Source = '[TOTAL_I_COMERCIAL]' then
     Source := FormatFloat(LocalMascaraN, (DobleCabecera.FieldByName('I_DTO_CIAL').AsFloat));

  if Source = '[TOTAL_IMPORTE]' then
     Source := FormatFloat(LocalMascaraN, (DobleCabecera.FieldByName('B_DTO_LINEAS').AsFloat));

  if Source = '[BRUTO_PIE]' then // dji lrk kri
     Source := FormatFloat(LocalMascaraN, (DobleCabecera.FieldByName('B_DTO_LINEAS').AsFloat));
  if Source = '[S_BASES_PIE]' then  // dji lrk kri
     Source := FormatFloat(LocalMascaraN, (DobleCabecera.FieldByName('S_BASES').AsFloat));

  if Source = '[DTO_PP]' then
     Source := FormatFloat(LocalMascaraN, (DobleCabecera.FieldByName('I_DTO_PP').AsFloat));

  if Source = '[B_IMPONIBLE]' then
     Source := FormatFloat(LocalMascaraN, (DobleCabecera.FieldByName('I_BASE_RETENCION').AsFloat));

  if Source = '[IMPOR_IVA]' then
     Source := FormatFloat(LocalMascaraN, (DobleCabecera.FieldByName('S_CUOTA_IVA').AsFloat));

  if Source = '[REC_EQ]' then
     Source := FormatFloat(LocalMascaraN, (DobleCabecera.FieldByName('S_CUOTA_RE').AsFloat));

  if Source = '[TOTAL_A_COBRAR]' then
     Source := FormatFloat(LocalMascaraN, DobleCabecera.FieldByName('TOTAL_A_COBRAR').AsFloat);

  if Source = '[TOTAL_EUROS]' then
  begin
     Cambio := 0;
     if (DobleCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
        Cambio := 1 / DobleCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;
     if (DobleCabecera.FieldByName('MONEDA').AsString = 'EUR') then
        Source := ' '
     else
        Source := FormatFloat(MascaraE, DMMain.DameCambio(True, DobleCabecera.FieldByName('MONEDA').AsString, 'EUR', DobleCabecera.FieldByName('FECHA').AsDateTime, DobleCabecera.FieldByName('TOTAL_A_COBRAR').AsFloat, Cambio));
  end;

  if Source = '[TOTALPTOVERDE]' then
     Source := FormatFloat(MascaraE, DMMain.DameCambio(True, REntorno.Moneda, DobleCabecera.FieldByName('MONEDA').AsString, DobleCabecera.FieldByName('FECHA').AsDateTime, totalptoverde, DobleCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat));

  if Source = '[MONEDA]' then
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := DobleCabecera.FieldByName('MONEDA').AsString;
        Open;
        Source := 'Moneda: ' + xMonedas.FieldByName('TITULO').AsString;
     end;

  if Source = 'Total Euros:' then
     if (DobleCabecera.FieldByName('MONEDA').AsString = 'EUR') then
        Source := ' ';

  // Activamos la doble cabecera
  if Source = '[ACTIVAR]' then
     with DobleCabecera do
     begin
        Close;
        Params.ByName['ID_S'].AsInteger := QMCabecera.FieldByName('ID_S').AsInteger;
        Open;
        Source := '';
        IVA := 1;
        VENCIMIENTO := 1;

        // Actualizar las máscaras para la factura actual
        LocalMascaraN := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 1);
        LocalMascaraL := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 0);

        // Se comprueba la segunda moneda emplear
        if (QMCabecera.FieldByName('MONEDA').AsString = REntorno.Moneda) then
           Moneda_Sec := REntorno.Moneda_Sec
        else
           Moneda_Sec := REntorno.Moneda;

        LocalMascaraNSec := DMMain.MascaraMoneda(Moneda_Sec, 1);
     end;

  // Activamos el IVA y los VENCIMIENTOS para una factura con 2 páginas.
  if Source = '[ACTIVA_IVA_VENC]' then
  begin
     xDobleIva.Close;
     xDobleIva.Open;
     xDobleRecibos.Close;
     xDobleRecibos.Open;
     Source := '';
     IVA := 1;
     VENCIMIENTO := 1;
  end;

  if Source = '[PROVINCIA]' then
     Source := REntorno.ProvEmpresa;
  if Source = '[LETRAS]' then
  begin
     Letras.Numero := DobleCabecera.FieldByName('TOTAL_A_COBRAR').Value;
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := DobleCabecera.FieldByName('MONEDA').AsString;
        Open;
        Letras.Moneda := xMonedas.FieldByName('TITULO').AsString;
        Letras.GeneroMasculino := (xMonedas.FieldByName('GENERO_MASCULINO').AsInteger = 1);
        Letras.Decimales := xMonedas.FieldByName('DEC_VER').AsInteger;
     end;
     Source := Letras.AsString;
  end;
  if Source = '[TOTAL_RECIBO]' then
  begin
     Source := '** ' + FormatFloat(LocalMascaraN,
        DobleCabecera.FieldByName('TOTAL_A_COBRAR').AsFloat) + ' **';
  end;
  if Source = '[NEXT_IVA]' then
  begin
     IVA := IVA + 1;
     xDobleIva.Next;
     if IVA > xDobleIva.RecordCount then
        IVA := -100;
     Source := ' ';
  end;
  if Source = '[NEXT_RECIBO]' then
  begin
     VENCIMIENTO := VENCIMIENTO + 1;
     xDobleRecibos.Next;
     if VENCIMIENTO > xDobleRecibos.RecordCount then
        VENCIMIENTO := -100;
     Source := ' ';
  end;

  if Source = '[DOBLE_VENCIMIDOBLE_ID_CARTERA_DETALLEENTO]' then
  begin
     if (VENCIMIENTO > 0) then
        Source := xDobleRecibos.FieldByName('ID_CARTERA_DETALLE').AsString
     else
        Source := '';
  end;
  if Source = '[DOBLE_VENCIMIENTO]' then
  begin
     if (VENCIMIENTO > 0) then
        Source := xDobleRecibos.FieldByName('VENCIMIENTO').AsString
     else
        Source := '';
  end;
  if Source = '[DOBLE_VENCIMIENTO_IMPORTE]' then // dji lrk kri
  begin
     if (VENCIMIENTO > 0) then
        Source := FormatFloat(LocalMascaraN, xDobleRecibos.FieldByName('LIQUIDO').AsFloat)
     else
        Source := '';
  end;
  if Source = '[DOBLE_LIQUIDO]' then
  begin
     if (VENCIMIENTO > 0) then
        Source := xDobleRecibos.FieldByName('LIQUIDO').AsString
     else
        Source := '';
  end;
  if Source = '[DOBLE_TITULO_TIPO_EFECTO]' then
  begin
     if (VENCIMIENTO > 0) then
        Source := xDobleRecibos.FieldByName('DOBLE_TITULO_TIPO_EFECTO').AsString
     else
        Source := '';
  end;
  if Source = '[DOBLE_P_IVA]' then
  begin
     if (IVA > 0) then
        Source := xDobleIva.FieldByName('P_IVA').AsString
     else
        Source := '';
  end;
  if Source = '[DOBLE_I_IVA]' then
  begin
     if (IVA > 0) then
        Source := FormatFloat(LocalMascaraN, xDobleIva.FieldByName('I_IVA').AsFloat)
     else
        Source := '';
  end;
  if Source = '[DOBLE_P_PP]' then
  begin
     if (IVA > 0) then
        Source := FormatFloat(LocalMascaraN, DobleCabecera.FieldByName('DTO_PP').AsFloat)
     //dji lrk kri then Source:=xDobleIVA.FieldByName('DTO_PP').AsString
     else
        Source := '';
  end;
  if Source = '[DOBLE_I_PP]' then
  begin
     if (IVA > 0) then
        Source := FormatFloat(LocalMascaraN, xDobleIVA.FieldByName('I_DTO_PP').AsFloat)
     else
        Source := '';
  end;
  if Source = '[DOBLE_BASE_IMPONIBLE]' then
  begin
     if (IVA > 0) then
        Source := FormatFloat(LocalMascaraN,
           xDobleIva.FieldByName('S_BASES_DTO').AsFloat)// xDobleIVAS_BASES.AsFloat
     else
        Source := '';
  end;
  if Source = '[PEDIDO]' then
  begin
     Source := DameHerencia('PEC');
     DameFecha('PEC', StrToIntDef(Source, 0));
  end;
  if Source = '[ALBARAN]' then
  begin
     Source := DameHerencia('ALB');
     DameFecha('ALB', StrToIntDef(Source, 0));
  end;
  {  if Source = '[FECHA_ALBARAN]' then Source := datetoStr(fecha_albaran);
  if Source = '[FECHA_PEDIDO]' then Source := datetoStr(fecha_pedido);}
  if Source = '[FECHA_ALBARAN]' then // dji lrk kri
  begin
     if fecha_albaran > EncodeDate(1999, 01, 01) then
        Source := DateToStr(fecha_albaran)
     else
        Source := '';
  end;
  if Source = '[FECHA_PEDIDO]' then // dji lrk kri
  begin
     if fecha_pedido > EncodeDate(1999, 01, 01) then
        Source := DateToStr(fecha_pedido)
     else
        Source := '';
  end;

  // Origen en el detalle

  if Source = '[INI_DETALLE_CON_ORIGEN]' then
  begin
     Source := ' ';
     final := False;
     doc := '-1';
     sub := 0;
     subir := False;
     detalle_con_origen := True;
  end;

  if Source = '[FIN_DETALLE_CON_ORIGEN]' then
  begin
     Source := ' ';
     final := True;
  end;

  {dji lrk kri - SU_REFERENCIA en la procedencia}
  if Source = '[ORIGEN_DETALLE]' then
  begin
     if (DMMain.EstadoKri(120) = 1) then
     begin
        if not subir {(doc<>QSPProcedencia.FieldByName('RIG_O').AsInteger)} then
        begin
           if QSPProcedencia.FieldByName('TIPO_O').AsString = 'OFC' then
              Source := Format(_('Oferta %s Fecha %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)])
           else if QSPProcedencia.FieldByName('TIPO_O').AsString = 'PEC' then
              Source := Format(_('Pedido %s Fecha %s %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime), QSPProcedencia_KRI.FieldByName('SU_REFERENCIA').AsString])
           else if QSPProcedencia.FieldByName('TIPO_O').AsString = 'ALB' then
              Source := Format(_('Albaran %s Fecha %s %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime), QSPProcedencia_KRI.FieldByName('SU_REFERENCIA').AsString])
           else if QSPProcedencia.FieldByName('TIPO_O').AsString = 'TIC' then
              Source := Format(_('Ticket %s Fecha %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)]);
        end
        else
           Source := ' ';
     end
     else
     begin
        if not subir {(doc<>QSPProcedencia.FieldByName('RIG_O').AsInteger)} then
        begin
           if QSPProcedencia.FieldByName('TIPO_O').AsString = 'OFC' then
              Source := Format(_('Oferta %s Fecha %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)])
           else if QSPProcedencia.FieldByName('TIPO_O').AsString = 'PEC' then
              Source := Format(_('Pedido %s Fecha %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)])
           else if QSPProcedencia.FieldByName('TIPO_O').AsString = 'ALB' then
              Source := Format(_('Albaran %s Fecha %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)])
           else if QSPProcedencia.FieldByName('TIPO_O').AsString = 'TIC' then
              Source := Format(_('Ticket %s Fecha %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)]);
        end
        else
           Source := '';
     end;
  end;

  if Source = '[ORIGEN_DETALLE_SERIE]' then  // Muestra la Serie de procedencia
  begin
     if not subir {(doc<>QSPProcedencia.FieldByName('RIG_O').AsInteger)} then
     begin
        if QSPProcedencia.FieldByName('TIPO_O').AsString = 'OFC' then
           Source := Format(_('Oferta %s Serie %s Fecha %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, QSPProcedencia.FieldByName('SERIE_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)])
        else if QSPProcedencia.FieldByName('TIPO_O').AsString = 'PEC' then
           Source := Format(_('Pedido %s Serie %s Fecha %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, QSPProcedencia.FieldByName('SERIE_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)])
        else if QSPProcedencia.FieldByName('TIPO_O').AsString = 'ALB' then
           Source := Format(_('Albaran %s Serie %s Fecha %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, QSPProcedencia.FieldByName('SERIE_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)])
        else if QSPProcedencia.FieldByName('TIPO_O').AsString = 'TIC' then
           Source := Format(_('Ticket %s Serie %s Fecha %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, QSPProcedencia.FieldByName('SERIE_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)]);
     end
     else
        Source := '';
  end;

  if Source = '[ORIGEN_DETALLE_]' then
  begin
     if (DMMain.EstadoKri(120) = 1) then
     begin
        if not subir {(doc<>QSPProcedencia.FieldByName('RIG_O').AsInteger)} then
        begin
           if QSPProcedencia.FieldByName('TIPO_O').AsString = 'OFC' then
              Source := Format(_('Oferta %s Fecha %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)])
           else if QSPProcedencia.FieldByName('TIPO_O').AsString = 'PEC' then
              Source := Format(_('Pedido %s Fecha %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)])
           else if QSPProcedencia.FieldByName('TIPO_O').AsString = 'ALB' then
              Source := Format(_('Albaran %s Fecha %s %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime), QSPProcedencia_KRI.FieldByName('SU_REFERENCIA').AsString])
           else if QSPProcedencia.FieldByName('TIPO_O').AsString = 'TIC' then
              Source := Format(_('Ticket %s Fecha %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)]);
        end
        else
           Source := ' ';
     end
     else
     begin
        if not subir {(doc<>QSPProcedencia.FieldByName('RIG_O').AsInteger)} then
        begin
           if QSPProcedencia.FieldByName('TIPO_O').AsString = 'OFC' then
              Source := Format(_('Oferta %s Fecha %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)])
           else if QSPProcedencia.FieldByName('TIPO_O').AsString = 'PEC' then
              Source := Format(_('Pedido %s Fecha %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)])
           else if QSPProcedencia.FieldByName('TIPO_O').AsString = 'ALB' then
              Source := Format(_('Albaran %s Fecha %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)])
           else if QSPProcedencia.FieldByName('TIPO_O').AsString = 'TIC' then
              Source := Format(_('Ticket %s Fecha %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)]);
        end
        else
           Source := '';
     end;
  end;

  // dji lrk kri para poner solo el numero de albaran origen (tw)
  if Source = '[ORIGEN_ALBARAN]' then
  begin
     if not subir {(doc<>QSPProcedencia.FieldByName('RIG_O').AsInteger)} then
     begin
        if QSPProcedencia.FieldByName('TIPO_O').AsString = 'OFC' then
           Source := Format(_('Oferta %s Fecha %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)])
        else if QSPProcedencia.FieldByName('TIPO_O').AsString = 'PEC' then
           Source := Format(_('Pedido %s Fecha %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)])
        else if QSPProcedencia.FieldByName('TIPO_O').AsString = 'ALB' then
           Source := Format(_('Albaran %s Fecha %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)])
        else if QSPProcedencia.FieldByName('TIPO_O').AsString = 'TIC' then
           Source := Format(_('Ticket %s Fecha %s'), [QSPProcedencia.FieldByName('RIG_O').AsString, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)]);
     end
     else
        Source := ' ';
  end;

  if Source = '[DTO_NETO]' then
  begin
     dto_vacio := _('Neto');
     Source := ' ';
  end;

  if Source = '[DTO_VACIO]' then
     if (QMDetalle.FieldByName('DESCUENTO').AsFloat = 0) then
        Source := dto_vacio
     else
        Source := FloatToStr(QMDetalle.FieldByName('DESCUENTO').AsFloat);

  if Source = '[ACTIVAR_BANCO]' then
  begin
     ActivaBanco := True;
     Source := ' ';
  end;

  if Source = '[DESACTIVAR_BANCO]' then
  begin
     ActivaBanco := False;
     Source := ' ';
  end;

  if (Source = '[DOBLE_P_RE]') then
     if (final) then
     begin
        if (IVA > 0) then
           Source := xDobleIva.FieldByName('P_RE').AsString
        else
           Source := '';
     end
     else
        Source := '';

  if (Source = '[DOBLE_I_RE]') then
     if (final) then
     begin
        if (IVA > 0) then
           Source := FormatFloat(MascaraN, xDobleIva.FieldByName('I_RE').AsFloat)
        else
           Source := '';
     end
     else
        Source := '';

  if Source = '[TOTAL_A_COBRAR_EURO_FIJO]' then
     Source := FormatFloat(',##0.##', (DobleCabecera.FieldByName('TOTAL_A_COBRAR').AsFloat / 166.386));

  if ((Source = '[MEMO0]') and (ric.Count >= 1)) then
     Source := ric.Strings[0];
  if ((Source = '[MEMO1]') and (ric.Count >= 2)) then
     Source := ric.Strings[1];
  if ((Source = '[MEMO2]') and (ric.Count >= 3)) then
     Source := ric.Strings[2];
  if ((Source = '[MEMO3]') and (ric.Count >= 4)) then
     Source := ric.Strings[3];
  if ((Source = '[MEMO4]') and (ric.Count >= 5)) then
     Source := ric.Strings[4];
  if ((Source = '[MEMO5]') and (ric.Count >= 6)) then
     Source := ric.Strings[5];
  if ((Source = '[MEMO6]') and (ric.Count >= 7)) then
     Source := ric.Strings[6];
  if ((Source = '[MEMO7]') and (ric.Count >= 8)) then
     Source := ric.Strings[7];
  if ((Source = '[MEMO8]') and (ric.Count >= 9)) then
     Source := ric.Strings[8];
  if ((Source = '[MEMO9]') and (ric.Count >= 10)) then
     Source := ric.Strings[9];
  if ((Source = '[MEMO10]') and (ric.Count >= 11)) then
     Source := ric.Strings[10];

  if Source = '[I_TOTALMONSEC]' then
  begin
     Cambio := 0;
     if (QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
        Cambio := 1 / DobleCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;

     if (QMCabecera.FieldByName('MONEDA').AsString <> Moneda_Sec) then
        Source := FormatFloat(LocalMascaraNSec, DMMain.DameCambio(True, QMCabecera.FieldByName('MONEDA').AsString, Moneda_Sec, QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('TOTAL_A_COBRAR').AsFloat, Cambio))
     else
        Source := ' ';
  end;

  if Source = '[DOBLE_I_TOTALMONSEC]' then
  begin
     Cambio := 0;
     if (DobleCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
        Cambio := 1 / DobleCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;

     if (DobleCabecera.FieldByName('MONEDA').AsString <> Moneda_Sec) then
        Source := FormatFloat(LocalMascaraNSec, DMMain.DameCambio(True, DobleCabecera.FieldByName('MONEDA').AsString, Moneda_Sec, DobleCabecera.FieldByName('FECHA').AsDateTime, DobleCabecera.FieldByName('TOTAL_A_COBRAR').AsFloat, Cambio))
     else
        Source := ' ';
  end;

  if Source = '[TOTAL_MONEDA_SEC]' then
  begin
     if (QMCabecera.FieldByName('MONEDA').AsString <> Moneda_Sec) then
        Source := _('Total') + ' ' + Moneda_Sec + ':'
     else
        Source := ' ';
  end;

  if Source = '[DOBLE_TOTAL_MONEDA_SEC]' then
  begin
     if (DobleCabecera.FieldByName('MONEDA').AsString <> Moneda_Sec) then
        Source := _('Total') + ' ' + Moneda_Sec + ':'
     else
        Source := ' ';
  end;

  //  if (Source='[MOSTRAR_NOTAS]') then
  //    begin
  //      MostrarNotas:= True;
  //      Source:='';
  //    end;

  if (Source = '[BLANCO]') then
     Source := '';

  if Source = '[NUM_ALBARAN_UNICO]' then
  begin
     aux := GetAlbaranProcedencia; // DameHerencia('ALB');
     if (aux <> albaran_anterior) then
     begin
        Source := _('Albaran') + ': ' + aux;
        albaran_anterior := aux;
     end
     else
        Source := _('Sin Albaran');
     DameFecha('ALB', StrToIntDef(aux, 0));
  end;

  if Source = ' ' then
     Source := '';

  //Portes
  if Source = '[PORTES]' then
  begin
     if (QMCabecera.FieldByName('TIPO_PORTES').AsInteger = 0) then
        Source := ' '
     else
        Source := _('Portes') + ': ' + DameTituloPorte(QMCabecera.FieldByName('TIPO_PORTES').AsInteger, QMCabecera.FieldByName('IDIOMA').AsString);
  end;

  if Source = '[DOBLE_PORTES]' then
  begin
     if (DobleCabecera.FieldByName('TIPO_PORTES').AsInteger = 0) then
        Source := ' '
     else
        Source := _('Portes') + ': ' + DameTituloPorte(DobleCabecera.FieldByName('TIPO_PORTES').AsInteger, DobleCabecera.FieldByName('IDIOMA').AsString);
  end;

  if Source = '[I_PORTES]' then
     Source := FormatFloat(MascaraN, QMCabecera.FieldByName('I_PORTES').AsFloat);

  if Source = '[I_PORTES_CANAL]' then
     Source := FormatFloat(MascaraN, QMCabecera.FieldByName('I_PORTES_CANAL').AsFloat);

  if Source = '[I_DOBLEPORTES]' then
     Source := FormatFloat(MascaraN, DobleCabecera.FieldByName('I_PORTES').AsFloat);

  if Source = '[I_DOBLEPORTES_CANAL]' then
     Source := FormatFloat(MascaraN, DobleCabecera.FieldByName('I_PORTES_CANAL').AsFloat);

  //PROMOCIONES
  if Source = '[ARTICULO_PRM]' then
     if QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre then
        Source := ' '
     else
        Source := QMPromociones.FieldByName('ARTICULO').AsString;

  if Source = '[UNIDADES_PRM]' then
     if ((QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMPromociones.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(MascaraI, QMPromociones.FieldByName('UNIDADES').AsFloat);

  if Source = '[PRECIO_DETALLE_PRM]' then
     if ((QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMPromociones.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(LocalMascaraL, QMPromociones.FieldByName('PRECIO').AsFloat);

  if Source = '[DTO_VACIO_PRM]' then
     if (QMPromociones.FieldByName('DESCUENTO').AsFloat = 0) then
        Source := dto_vacio
     else
        Source := FloatToStr(QMPromociones.FieldByName('DESCUENTO').AsFloat);

  if Source = '[B_DTO_LINEA_PRM]' then
     if ((QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMPromociones.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(LocalMascaraL, QMPromociones.FieldByName('B_DTO_LINEA').AsFloat);

  if Source = '[DTO_PRM]' then
     if ((QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMPromociones.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FloatToStr(QMPromociones.FieldByName('DESCUENTO').AsFloat);

  // cálculo del punto verde
  if Source = '[PRECIOUD_PRM]' then
  begin
     //pto_verde := 0;
     //Sin Formato, para poder utilizarlo en cálculos internos del listado
     if ((QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMPromociones.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
     begin
        pto_verde := 0;
        if (xCliente.FieldByName('APLICAR_PTO_VERDE').AsInteger = 1) then
           pto_verde := xArticulos.FieldByName('PTO_VERDE').AsFloat;

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT PVP_POR_UD_SECUNDARIA FROM ART_ARTICULOS WHERE EMPRESA = ?EMPRESA AND ID_A = ?ID_A';
              Params.ByName['EMPRESA'].AsInteger := QMPromociones.FieldByName('EMPRESA').AsInteger;
              Params.ByName['ID_A'].AsInteger := QMPromociones.FieldByName('ID_A').AsInteger;

              ExecQuery;
              if (FieldByName['PVP_POR_UD_SECUNDARIA'].AsInteger = 1) and REntorno.PVP_Ud_Sec then
                 precioverdeln := pto_verde * QMPromociones.FieldByName('UNIDADES_SEC').AsFloat
              else
                 precioverdeln := pto_verde * QMPromociones.FieldByName('UNIDADES').AsFloat;
              FreeHandle;
           finally
              Free;
           end;
        end;

        pto_verde := DMMain.DameCambio(False, REntorno.Moneda, QMCabecera.FieldByName('MONEDA').AsString, QMCabecera.FieldByName('FECHA').AsDateTime, pto_verde, QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat);

        //calculo del precio por unidad
        pto_verde := QMPromociones.FieldByName('PRECIO').AsFloat - pto_verde;
        Source := FloatToStr(pto_verde);

        //para totalizar el punto verde
        totalptoverde := totalptoverde + precioverdeln;
     end;
  end;

  if Source = '[PRECIOVERDELN_PRM]' then
     Source := FloatToStr(DMMain.DameCambio(False, REntorno.Moneda, QMCabecera.FieldByName('MONEDA').AsString, QMCabecera.FieldByName('FECHA').AsDateTime, precioverdeln, QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat));
end;

procedure TDMLstFactura.HYReportMailEnterFields(Sender: THYReportMail; Field: THYField; var Source: string);
begin
  MatricialesEnterFields(Source);
end;

procedure TDMLstFactura.HYReportPrepareFields(Sender: THYReport; Field: UHYReport.THYField; Contents: TStrings);
begin
  {  if  ( (detalle_con_origen)
        and (Field.Source<>'[ORIGEN_DETALLE]')
        and (Field.Source<>'[ORIGEN_DETALLE_SERIE]')
        and (Field.Band.HYReportSource <> nil)
        and (Field.Band.HYReportSource.name='HYRSDetalle')
      )
    then
      begin
        if (subir)
          then
            begin
//              if (copy(UHYReport.THYField(field).source,2,4)='MEMO') then
//                  UHYReport.THYField(field).Top:=(strtoint(copy(UHYReport.THYField(field).source,6,1))+1)
//                else
                  UHYReport.THYField(field).Top:=0;
            end
          else
            begin
//              if (copy(UHYReport.THYField(field).source,2,4)='MEMO') then
//                UHYReport.THYField(field).Top:=(strtoint(copy(UHYReport.THYField(field).source,6,1))+2)
//              else
                UHYReport.THYField(field).Top:=1;
            end;
      end;}
end;

procedure TDMLstFactura.HYReportLengthBands(Sender: THYReport; Band: THYBand; var Length: integer);
begin
  if (detalle_con_origen) then
  begin
     if (band.HYReportSourceName = 'HYRSDetalle') then
     begin
        if ((doc = QSPProcedencia.FieldByName('SERIE_O').AsString +
           IntToStr(QSPProcedencia.FieldByName('RIG_O').AsInteger)) or
           (QSPProcedencia.RecordCount = 0)) then
        begin
           subir := True;
           //            if MostrarNotas
           //              then length:=1+n_lineas_memo_detalle
           //              else length:=1;
        end
        else
        begin
           subir := False;
           //            if MostrarNotas
           //              then length:=2+n_lineas_memo_detalle
           //              else length:=2;
           doc := QSPProcedencia.FieldByName('SERIE_O').AsString + IntToStr(QSPProcedencia.FieldByName('RIG_O').AsInteger);
        end;
     end;
  end;
  //    else
  //      if (band.HYReportSourceName='HYRSDetalle') then
  //        if MostrarNotas
  //          then Length:=1+n_lineas_memo_detalle
  //          else Length:=1;
end;

//function TDMLstFactura.n_lineas_memo_detalle:integer;
//begin
//  if (QMDetalle.RecordCount>0) then
//    ric.Assign(QMDetalle.FieldByName('NOTAS'));
//  result:=ric.Count;
//end;

procedure TDMLstFactura.UpdateaDocumentos;
var
  ID_S : integer;
begin
  if (MarcarListado) then
  begin
     case TipoListado of
        0:
        begin
           with xUpdateaDocumentos do
           begin
              Close;
              SelectSQL.Text := QMCabecera.SelectSQL.Text;
              Plan.Text := QMCabecera.Plan.Text;
              if (id_s_aux = 0) then
              begin
                 Params.ByName['SERIE'].AsString := SerieGen;
                 if (FiltroGen = 0) then
                 begin
                    DMMain.FiltraRO(xUpdateaDocumentos, '11110', False);
                    Params.ByName['SERIE'].AsString := REntorno.Serie;
                 end;
              end
              else
                 Params.ByName['ID_S'].AsInteger := id_s_aux;
              Open;
              First;
              ID_S := FieldByName('ID_S').AsInteger;
              while not EOF do
              begin
                 ModificaDoc(QGen, ID_S, 0, 0);
                 Next;
                 ID_S := FieldByName('ID_S').AsInteger;
              end;
           end;
        end;
        1:
        begin
           with xUpdateaDocumentos do
           begin
              Close;
              SelectSQL.Text := QMCabecera.SelectSQL.Text;
              Plan.Text := QMCabecera.Plan.Text;
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['SERIE'].AsString := SerieGen;
              Params.ByName['FECHA1'].AsDateTime := REntorno.FechaTrabSH;
              Params.ByName['FECHA2'].AsDateTime := REntorno.FechaTrabSH + 1;
              Open;
              First;
              ID_S := FieldByName('ID_S').AsInteger;
              while not EOF do
              begin
                 ModificaDoc(QGen, ID_S, 0, 0);
                 Next;
                 ID_S := FieldByName('ID_S').AsInteger;
              end;
           end;
        end;
     end;
  end;
end;

procedure TDMLstFactura.frFacturaPrintReport;
begin
  UpdateaDocumentos;
end;

procedure TDMLstFactura.HYReportPrintReport(Sender: THYReport);
begin
  UpdateaDocumentos;
end;

procedure TDMLstFactura.frFacturaUserFunction(const Name: string; p1, p2, p3: variant; var Val: variant);
var
  Idioma : string;
  Grupo : integer;
  Parser : TfrParser;
  Bandera : string;
begin
  if (Name = 'DAME_TEXTO_IDIOMA') then
  begin
     Grupo := Parser.Calc(p1);
     // Bandera = D el memo está en el pie de pagina y ha de cojer los valores de la doble cabecera
     Bandera := Parser.Calc(p2);
     if (Bandera = 'D') then
        Idioma := DobleCabecera.FieldByName('IDIOMA').AsString
     else
        Idioma := QMCabecera.FieldByName('IDIOMA').AsString;

     Val := DMMain.DameTextoIdioma(Grupo, Idioma);
  end;
end;

procedure TDMLstFactura.QMPromocionesAfterOpen(DataSet: TDataSet);
begin
  if not xArticulosPRM.Active then
     xArticulosPRM.Open;
end;

procedure TDMLstFactura.QMPromocionesAfterScroll(DataSet: TDataSet);
begin
  if ((QMPromociones.RecordCount > 0) and (ric_prm <> nil)) then
     ric_prm.Assign(QMPromociones.FieldByName('NOTAS'));
  //if QMDetalle.Eof then QMDetalle.Close;
  {xArticulosPRM.Close;
  xArticulosPRM.Open;}
end;

procedure TDMLstFactura.frUDNotasArtPRMCheckEOF(Sender: TObject; var EOF: boolean);
begin
  EOF := (ric_prm.Count = x);
end;

procedure TDMLstFactura.frUDNotasArtPRMFirst(Sender: TObject);
begin
  x := 0;
end;

procedure TDMLstFactura.frUDNotasArtPRMNext(Sender: TObject);
begin
  x := x + 1;
end;

procedure TDMLstFactura.frxFacturaGetValue(const VarName: string; var Value: variant);
begin
  frFacturaGetValue(VarName, Value);
end;

procedure TDMLstFactura.frxFacturaBeforePrint(Sender: TfrxReportComponent);
var
  NumeroFirma : integer;
  s : string;
  Imagen : TImage;
begin
  // DMMain.Log(format('frxFacturaBeforePrint(%s)', [Sender.Name]));

  DMListados.BeforePrint(Sender);


  if (Sender is TfrxCustomMemoView) then
  begin
     with TfrxCustomMemoView(Sender) do
     begin
        if (Memo.Count > 0) then
        begin

           {if memo[0] = '[NotasArt]' then
          memo[0] := ric.Strings[j];

        if memo[0] = '[NotasCabecera]' then
          memo[0] := NotasCab.Strings[indNotas];}

           if (Memo[0] = 'CANTIDADES') then
              SW := 1;
           if (Pos('[MascaraN]', Memo[0]) > 0) then
           begin
              DisplayFormat.FormatStr := LocalMascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
           if (Pos('[MascaraNSec]', Memo[0]) > 0) then
           begin
              DisplayFormat.FormatStr := LocalMascaraNSec;
              DisplayFormat.Kind := fkNumeric;
           end;
           if (Pos('[MascaraE]', Memo[0]) > 0) then
           begin
              DisplayFormat.FormatStr := '###,###,##0.00';
              DisplayFormat.Kind := fkNumeric;
           end;

           if (Pos('[MascaraP]', Memo[0]) > 0) then
              if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
              begin
                 if (TfrxBand(TfrxCustomMemoView(Sender).Parent) is TfrxDetailData) then
                    if (TfrxDetailData(TfrxCustomMemoView(Sender).Parent).DataSet = frxDBDetalle) then
                       Memo[0] := ''
                    else
                    begin
                       DisplayFormat.FormatStr := MascaraP;
                       DisplayFormat.Kind := fkNumeric;
                    end;
              end
              else
              begin
                 DisplayFormat.FormatStr := MascaraP;
                 DisplayFormat.Kind := fkNumeric;
              end;

           if (Pos('[MascaraL]', Memo[0]) > 0) then
              if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
              begin
                 if (TfrxBand(TfrxCustomMemoView(Sender).Parent) is TfrxDetailData) then
                    if (TfrxDetailData(TfrxCustomMemoView(Sender).Parent).DataSet = frxDBDetalle) then
                       Memo[0] := ''
                    else
                    begin
                       DisplayFormat.FormatStr := MascaraL;
                       DisplayFormat.Kind := fkNumeric;
                    end;
              end
              else
              begin
                 DisplayFormat.FormatStr := LocalMascaraL;
                 DisplayFormat.Kind := fkNumeric;
              end;

           if Memo[0] = '[NotasArtPRM]' then
           begin
              Memo[0] := ric_prm.Strings[x];
           end;
        end;
     end;
  end;

  if (Sender is TfrxRichView) then
  begin
     with TfrxRichView(Sender) do
     begin
        if (TagStr = 'NotasCabecera') then
        begin
           if (QMCabecera.FieldByName('NOTAS').Value = '') then
           begin
              Visible := False;
              Parent.Height := 0;
           end
           else
           begin
              if Copy(QMCabecera.FieldByName('NOTAS').Value, 1, 4) = #$D#$A#$D#$A then
                 Parent.Height := 0
              else
              begin
                 Parent.Height := 34;
                 Visible := True;
              end;
           end;
        end;
     end;
  end;

  if (Sender is TfrxPictureView) then
  begin
     s := Trim(TfrxPictureView(Sender).TagStr);
     if (s = 'ImgArticulo') then
     begin
        DMListados.MostrarImagen(xArticulos.FieldByName('IMAGEN').AsInteger, TfrxPictureView(Sender));
        TfrxPictureView(Sender).Visible := True;
        n_imagen := xArticulos.FieldByName('IMAGEN').AsInteger;
     end;

     if (s = 'ImgDetalle') then
        DMListados.MostrarImagen(QMDetalle.FieldByName('ID_IMAGEN').AsInteger, TfrxPictureView(Sender));

     if (s = 'CodigoRespuestaRapida') then
     begin
        Imagen := TImage.Create(nil);
        try
           CrearCodigoQR(Imagen.Picture.Bitmap, QMCabecera.FieldByName('SFV_CODIGO_RESPUESTA_RAPIDA').AsString, 3);
           TfrxPictureView(Sender).Picture.Assign(Imagen.Picture);
        finally
           Imagen.Free;
        end;
     end;

     if (s = 'ImgTimbre') then
     begin
        Imagen := TImage.Create(nil);
        try
           RefrescarImagenTimbre(Imagen, QMCabecera.FieldByName('ID_S').AsInteger);
           TfrxPictureView(Sender).Picture.Assign(Imagen.Picture);
        finally
           Imagen.Free;
        end;
     end;

     // Las variables de firma tendrán el formato [Firma-n] donde 'n' es un numero
     if (Pos('Firma-', s) > 0) then
     begin
        // Obtengo numero de firma
        s := Copy(s, 7, Length(s));
        NumeroFirma := StrToIntDef(s, -1);

        // Recorro firmas hasta encontrar la deseada
        if not xLstFirmas.Active then
           xLstFirmas.Open
        else
           xLstFirmas.First;

        while ((xLstFirmas.RecNo < NumeroFirma) and (not xLstFirmas.EOF)) do
           xLstFirmas.Next;

        // Si existe cargo la imagen en el Memo.
        if (xLstFirmas.RecNo = NumeroFirma) then
        begin
           Imagen := TImage.Create(nil);
           try
              Imagen.Transparent := True;
              RefrescarImagenFirma(Imagen, xLstFirmas.FieldByName('ID_FIRMA').AsInteger);
              TfrxPictureView(Sender).Picture.Assign(Imagen.Picture);
           finally
              Imagen.Free;
           end;
        end;
     end;

     // Codigo de TicketBAI (Codigo QR para factura Pais Vasco)
     if (s = 'QRTicketBAI') then
     begin
        with DobleCabecera do
        begin
           s := 'https://batuz.eus/QRTBAI/';
           s := s + '?id=' + DameTicketBAI(FieldByName('ID_S').AsInteger);
           s := s + '&s=' + FieldByName('SERIE').AsString;
           s := s + '&nf=' + FieldByName('RIG').AsString;
           s := s + '&i=' + FloatToStrDec(FieldByName('LIQUIDO').AsFloat, '.');
           s := s + '&cr=' + format('%.3d', [CalcCRC8Str(s)]);
        end;

        Imagen := TImage.Create(nil);
        try
           CrearCodigoQR(Imagen.Picture.Bitmap, s, 3);
           TfrxPictureView(Sender).Picture.Assign(Imagen.Picture);
        finally
           Imagen.Free;
        end;
     end;

     if (s = 'QRVerifactu') then
     begin
        // Devuelvo imagen QR solo si la factura está contabilizada.
        Imagen := TImage.Create(nil);
        try
           if (QMCabecera.FieldByName('ESTADO').AsInteger = 5) then
           begin
              s := xVerifactu.FieldByName('INFO_QR').AsString;
              CrearCodigoQR(Imagen.Picture.Bitmap, s, 3);
           end;

           TfrxPictureView(Sender).Picture.Assign(Imagen.Picture);
        finally
           Imagen.Free;
        end;
     end;
  end;
end;

procedure TDMLstFactura.frxFacturaPrintReport(Sender: TObject);
begin
  UpdateaDocumentos;
end;

procedure TDMLstFactura.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  if not QMDetalle.Active then
     QMDetalle.Open;
  if not xCliente.Active then
     xCliente.Open;
  if not xAgente.Active then
     xAgente.Open;
  if not xFormaPago.Active then
     xFormaPago.Open;
  if not xTransportistas.Active then
     xTransportistas.Open;
  if not xNotasCliente.Active then
     xNotasCliente.Open;
  if not xRuta.Active then
     xRuta.Open;
  if not xDireccionFiscal.Active then
     xDireccionFiscal.Open;
  if not xDobDireccionAlbKri.Active then
     xDobDireccionAlbKri.Open;
  if not xRecibos.Active then
     xRecibos.Open;
  if not xDatosIva.Active then
     xDatosIva.Open;
  if not xProyectos.Active then
     xProyectos.Open;
  if not xCuota.Active then
     xCuota.Open;
  if not xLstFirmas.Active then
     xLstFirmas.Open;
  if not xReferenciaDte.Active then
     xReferenciaDte.Open;
  if not QMDetallePorClienteOrigen.Active then
     QMDetallePorClienteOrigen.Open;
  if not xVerifactu.Active then
     xVerifactu.Open;
  if not xECF.Active then
     xECF.Open;
  if Param_MODREST003 and (not xCabReparacion.Active) then
     xCabReparacion.Open;

  xContacto.Open;
  xTipoPorte.Open;

  if Param_MODREST017 then
  begin
     with QMDetalleTallas do
     begin
        Close;
        SelectSQL.Clear;
        // También que pertenezcan al mismo origen
        if (Param_LSTOFAC003 = 'S') then
           SelectSQL.Add(' SELECT X.* FROM XVER_DETALLES_S_GR_RO_LST(:ID_S, :ID_G_T, :O_ID_S) X ')
        else
           SelectSQL.Add(' SELECT X.* FROM XVER_DETALLES_S_GR_RO_LST(:ID_S, :ID_G_T, -1) X ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' (ABS(COALESCE(X.T01, 0)) + ABS(COALESCE(X.T02, 0)) + ABS(COALESCE(X.T03, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T04, 0)) + ABS(COALESCE(X.T05, 0)) + ABS(COALESCE(X.T06, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T07, 0)) + ABS(COALESCE(X.T08, 0)) + ABS(COALESCE(X.T09, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T10, 0)) + ABS(COALESCE(X.T11, 0)) + ABS(COALESCE(X.T12, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T13, 0)) + ABS(COALESCE(X.T14, 0)) + ABS(COALESCE(X.T15, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T16, 0)) + ABS(COALESCE(X.T17, 0)) + ABS(COALESCE(X.T18, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T19, 0)) + ABS(COALESCE(X.T20, 0)) + ABS(COALESCE(X.T21, 0)) + ');
        SelectSQL.Add(' ABS(COALESCE(X.T22, 0)))  > 0 ');
        if (Param_LSTOFAC002 = '') then
           SelectSQL.Add(' ORDER BY X.CAJA_EDI, X.GENERO, X.FAMILIA, X.SUBFAMILIA, X.REF_PROVEEDOR, X.S_COLOR ')
        else
           SelectSQL.Add(' ORDER BY ' + Param_LSTOFAC002);
     end;

     QMGrupoTalla.Open;
  end;
end;

procedure TDMLstFactura.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
  xCliente.Close;
  xAgente.Close;
  xFormaPago.Close;
  xTransportistas.Close;
  xNotasCliente.Close;
  xRuta.Close;
  xDireccionFiscal.Close;
  xDobDireccionAlbKri.Close;
  xRecibos.Close;
  xDatosIva.Close;
  xProyectos.Close;
  xCuota.Close;
  xLstFirmas.Close;
  QMGrupoTalla.Close;
  xContacto.Close;
  xTipoPorte.Close;
  xReferenciaDte.Close;
  QMDetallePorClienteOrigen.Close;
  xCabReparacion.Close;
  xVerifactu.Close;
  xECF.Close;
end;

procedure TDMLstFactura.QMDetalleBeforeClose(DataSet: TDataSet);
begin
  QSPProcedencia.Close;
  QMPromociones.Close;
  xLotes.Close;
  xNroSerie.Close;
  xArticulos.Close;
  QMEscandallo.Close;
  xProyectosDetalle.Close;
  xArticulosIdioma.Close;
  QSPProcedencia_kri.Close;
  QMDetalleUE.Close;
  xDireccionEntregaLinea.Close;
  xArticuloTYC.Close;
end;

procedure TDMLstFactura.xClienteBeforeClose(DataSet: TDataSet);
begin
  xCuenta.Close;
  xTercero.Close;
  xEmpresa.Close;
  xDatosBancarios.Close;
end;

procedure TDMLstFactura.xTerceroBancoBeforeClose(DataSet: TDataSet);
begin
  xNombreBanco.Close;
end;

procedure TDMLstFactura.xDatosBancariosAfterOpen(DataSet: TDataSet);
begin
  if not xEntidad.Active then
     xEntidad.Open;
end;

procedure TDMLstFactura.xDatosBancariosBeforeClose(DataSet: TDataSet);
begin
  xEntidad.Close;
end;

procedure TDMLstFactura.DobleCabeceraAfterOpen(DataSet: TDataSet);
begin
  if not xDobFormaPago.Active then
     xDobFormaPago.Open;
  if not xDobNotasClientes.Active then
     xDobNotasClientes.Open;
  if not xDobRecibos.Active then
     xDobRecibos.Open;
  if not xDobDireccionCliente.Active then
     xDobDireccionCliente.Open;
  if not xDobleIva.Active then
     xDobleIva.Open;
  if not xDobleRecibos.Active then
     xDobleRecibos.Open;
  if not xDobleContacto.Active then
     xDobleContacto.Open;

  xDobTipoPorte.Open;
end;

procedure TDMLstFactura.DobleCabeceraBeforeClose(DataSet: TDataSet);
begin
  xDobFormaPago.Close;
  xDobNotasClientes.Close;
  xDobRecibos.Close;
  xDobDireccionCliente.Close;
  xDobleIva.Close;
  xDobleRecibos.Close;
  xDobTipoPorte.Close;
  xDobleContacto.Open;
end;

procedure TDMLstFactura.xDobTerceroBanAfterOpen(DataSet: TDataSet);
begin
  if not xDobNomBan.Active then
     xDobNomBan.Open;
end;

procedure TDMLstFactura.xDobTerceroBanBeforeClose(DataSet: TDataSet);
begin
  xDobNomBan.Close;
end;

procedure TDMLstFactura.QMPromocionesBeforeClose(DataSet: TDataSet);
begin
  xArticulosPRM.Close;
end;

procedure TDMLstFactura.xHerenciaALBAfterOpen(DataSet: TDataSet);
begin
  xHerenciaPEC.Open;
end;

procedure TDMLstFactura.xHerenciaPECAfterOpen(DataSet: TDataSet);
begin
  xHerenciaOFC.Open;
end;

procedure TDMLstFactura.xCuotaAfterOpen(DataSet: TDataSet);
begin
  if (xCuota.FieldByName('ID_ALQ').AsInteger <> 0) then
  begin
     // Calculo los numeros de serie que tiene el cliente en deposito

     // Borro contenido
     with NrosSerieAlquiler do
     begin
        First;
        while not EOF do
           Delete;
     end;

     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;

              // Nros de Serie depositados asociados al alquiler
              SelectSQL.Add(' SELECT SS.*, S.* ');
              SelectSQL.Add(' FROM EMP_ALQUILER A ');
              SelectSQL.Add(' JOIN EMP_ALQUILER_REV R ON A.ID_ALQ = R.ID_ALQ ');
              SelectSQL.Add(' JOIN GES_CABECERAS_S C ON R.ID_S_ALB = C.ID_S ');
              SelectSQL.Add(' JOIN GES_CABECERAS_S_ALB CA ON C.ID_S = CA.ID_S ');
              SelectSQL.Add(' JOIN GES_CABECERAS_ST CS ON CA.EMPRESA = CS.EMPRESA AND CA.EJERCICIO = CS.EJERCICIO AND CA.SERIE = CS.SERIE AND CA.NUM_MOV_DEPOSITO = CS.RIG ');
              SelectSQL.Add(' JOIN GES_DETALLES_SERIALIZACION S ON S.EMPRESA = CS.EMPRESA AND S.EJERCICIO = CS.EJERCICIO AND S.SERIE = CS.SERIE AND S.RIG = CA.NUM_MOV_DEPOSITO AND ((S.TIPO = ''MVE'') OR (S.TIPO = ''MVS'')) ');
              SelectSQL.Add(' JOIN ART_ARTICULOS_SERIALIZACION SS ON S.EMPRESA = SS.EMPRESA AND S.CANAL = SS.CANAL AND S.ALMACEN = SS.ALMACEN AND S.CODIGO = SS.CODIGO ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' A.ID_ALQ = :ID_ALQ ');
              SelectSQL.Add(' ORDER BY SS.ARTICULO DESC, S.FECHA DESC ');
              Params.ByName['ID_ALQ'].AsInteger := xCuota.FieldByName('ID_ALQ').AsInteger;
              Open;

              // Calculo nros de serie activos
              Last;
              while not BOF do
              begin
                 if NrosSerieAlquiler.Locate('EMPRESA;CANAL;CODIGO;ALMACEN', VarArrayOf([FieldByName('EMPRESA').AsInteger, FieldByName('CANAL').AsInteger, FieldByName('CODIGO').AsInteger, FieldByName('ALMACEN').AsString]), []) then
                 begin
                    if (FieldByName('TIPO').AsString = 'MVE') then
                    begin
                       if (NrosSerieAlquiler.FieldByName('UNIDADES').AsFloat = -1) then
                          NrosSerieAlquiler.Delete
                       else
                       begin
                          NrosSerieAlquiler.Edit;
                          NrosSerieAlquiler.FieldByName('UNIDADES').AsFloat := NrosSerieAlquiler.FieldByName('UNIDADES').AsFloat + 1;
                          NrosSerieAlquiler.Post;
                       end;
                    end
                    else
                    if (FieldByName('TIPO').AsString = 'MVS') then
                    begin
                       if (NrosSerieAlquiler.FieldByName('UNIDADES').AsFloat = 1) then
                          NrosSerieAlquiler.Delete
                       else
                       begin
                          NrosSerieAlquiler.Edit;
                          NrosSerieAlquiler.FieldByName('UNIDADES').AsFloat := NrosSerieAlquiler.FieldByName('UNIDADES').AsFloat - 1;
                          NrosSerieAlquiler.Post;
                       end;
                    end;
                 end
                 else
                 begin
                    if (FieldByName('TIPO').AsString = 'MVE') then
                    begin
                       NrosSerieAlquiler.Append;
                       NrosSerieAlquiler.FieldByName('EMPRESA').AsInteger := FieldByName('EMPRESA').AsInteger;
                       NrosSerieAlquiler.FieldByName('CANAL').AsInteger := FieldByName('CANAL').AsInteger;
                       NrosSerieAlquiler.FieldByName('CODIGO').AsInteger := FieldByName('CODIGO').AsInteger;
                       NrosSerieAlquiler.FieldByName('ALMACEN').AsString := FieldByName('ALMACEN').AsString;
                       NrosSerieAlquiler.FieldByName('ARTICULO').AsString := FieldByName('ARTICULO').AsString;
                       NrosSerieAlquiler.FieldByName('NSERIE').AsString := FieldByName('NSERIE').AsString;
                       NrosSerieAlquiler.FieldByName('SELECCIONADO').AsInteger := 0;
                       NrosSerieAlquiler.FieldByName('UNIDADES').AsInteger := 1;
                       NrosSerieAlquiler.Post;
                    end;
                    if (FieldByName('TIPO').AsString = 'MVS') then
                    begin
                       NrosSerieAlquiler.Append;
                       NrosSerieAlquiler.FieldByName('EMPRESA').AsInteger := FieldByName('EMPRESA').AsInteger;
                       NrosSerieAlquiler.FieldByName('CANAL').AsInteger := FieldByName('CANAL').AsInteger;
                       NrosSerieAlquiler.FieldByName('CODIGO').AsInteger := FieldByName('CODIGO').AsInteger;
                       NrosSerieAlquiler.FieldByName('ALMACEN').AsString := FieldByName('ALMACEN').AsString;
                       NrosSerieAlquiler.FieldByName('ARTICULO').AsString := FieldByName('ARTICULO').AsString;
                       NrosSerieAlquiler.FieldByName('NSERIE').AsString := FieldByName('NSERIE').AsString;
                       NrosSerieAlquiler.FieldByName('SELECCIONADO').AsInteger := 0;
                       NrosSerieAlquiler.FieldByName('UNIDADES').AsInteger := -1;
                       NrosSerieAlquiler.Post;
                    end;
                 end;

                 Prior;
              end;

              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMLstFactura.frxFacturaUserFunction(const MethodName: string; var Params: variant): variant;
var
  Idioma : string;
  Grupo : integer;
  // Parser : TfrxParser;
  Bandera : string;
begin
  if (MethodName = 'DAME_TEXTO_IDIOMA') then
  begin
     Grupo := Params[0];

     Bandera := '';
     Bandera := Params[1];
     if (Bandera = 'D') then
        Idioma := DobleCabecera.FieldByName('IDIOMA').AsString
     else
        Idioma := QMCabecera.FieldByName('IDIOMA').AsString;

     Result := DMMain.DameTextoIdioma(Grupo, Idioma);
  end;
end;

procedure TDMLstFactura.QMGrupoTallaAfterOpen(DataSet: TDataSet);
begin
  QMTituloTalla.Open;
  QMDetalleTallas.Open;
end;

procedure TDMLstFactura.QMGrupoTallaBeforeClose(DataSet: TDataSet);
begin
  QMTituloTalla.Close;
  QMDetalleTallas.Close;
end;

procedure TDMLstFactura.QMDetalleTallasAfterOpen(DataSet: TDataSet);
begin
  if QMGrupoTalla.Active then
     DMMain.Log(format('QMDetalleTallasAfterOpen ID_G_T=%d - ID_S=%d - O_ID_S=%d - O_DOC=%s - ',
        [QMGrupoTalla.FieldByName('ID_G_T').AsInteger,
        QMGrupoTalla.FieldByName('ID_S').AsInteger,
        QMGrupoTalla.FieldByName('O_ID_S').AsInteger,
        QMGrupoTalla.FieldByName('O_DOC').AsString]))
  else
     DMMain.Log('QMDetalleTallasAfterOpen (QMGrupoTalla.Active=False)');

  QMArticuloTallas.Open;
end;

procedure TDMLstFactura.QMDetalleTallasBeforeClose(DataSet: TDataSet);
begin
  DMMain.Log('QMDetalleTallasBeforeClose');

  QMArticuloTallas.Close;
end;

procedure TDMLstFactura.ForzarGuardado(Carpeta: string);
begin
  CarpetaGuardadoForzado := Carpeta;
end;

function TDMLstFactura.DameTicketBAI(id_s: integer): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CODIGO_IDENTIFICATIVO FROM GES_CABECERAS_S_FAC_TBAI WHERE ID_S = :ID_S';
        Params.ByName['ID_S'].AsInteger := id_s;
        ExecQuery;
        Result := FieldByName['CODIGO_IDENTIFICATIVO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstFactura.ExportarExcel(ID_S: integer; Archivo: string);
var
  Fila, Columna, Orden : integer;
  MaxCol : integer;
  HCalc : THojaCalc;

  procedure DestacaFila(aFila: integer; Color: TColor);
  var
     c : integer;
  begin
     for c := 1 to MaxCol do
     begin
        HCalc.Bold(aFila, c);
        HCalc.BackgroundColor(aFila, c, Color);
     end;
  end;

begin
  MaxCol := 14;
  DMMain.Log('Exportando Factura Excel: ' + Archivo);

  // Deshabilito datasets que no se utilizan para la generacion del Excel
  // Esto es para ganar velocidad
  QSPProcedencia.DataSource := nil;
  QMPromociones.DataSource := nil;
  xArticulos.DataSource := nil;
  QMEscandallo.DataSource := nil;
  QSPProcedencia_kri.DataSource := nil;
  xProyectosDetalle.DataSource := nil;
  xArticulosIdioma.DataSource := nil;
  xHerenciaALB.DataSource := nil;
  QMDetalleUE.DataSource := nil;
  xDireccionEntregaLinea.DataSource := nil;
  xArticuloTYC.DataSource := nil;

  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(format(_('Exportando Factura Excel: %s'), [Archivo]));
     FSendCorreo.Texto(_('Iniciando exportacion'));
     FSendCorreo.MuestraBarraProgreso(7);
     FSendCorreo.Show;
     // Verifico si es excel o OpenOffice
     if (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0) then
        HCalc := THojaCalc.Create(thcExcel, False)
     else
        HCalc := THojaCalc.Create(thcOpenOffice, False);

     try
        HCalc.FileName := Archivo;

        HCalc.ActivateSheetByIndex(1);

        // Cabecera
        FSendCorreo.Texto(_('Cabecera'));
        FSendCorreo.PBProgreso.Position := 1;
        Fila := 1;
        HCalc.CellText[Fila, 1] := _('Cabecera');
        DestacaFila(Fila, clYellow);
        Inc(Fila);

        with QMCabecera do
        begin
           Close;
           Params.ByName['ID_S'].AsInteger := ID_S;
           Open;
        end;

        HCalc.CellText[Fila, 2] := _('Factura:');
        HCalc.CellText[Fila, 3] := format('%s/%d', [QMCabecera.FieldByName('SERIE').AsString, QMCabecera.FieldByName('RIG').AsInteger]);
        Inc(Fila);

        HCalc.CellText[Fila, 2] := _('Fecha:');
        HCalc.CellText[Fila, 3] := DateToStr(QMCabecera.FieldByName('FECHA').AsDateTime);
        Inc(Fila);

        HCalc.CellText[Fila, 2] := _('Referencia:');
        HCalc.CellText[Fila, 3] := QMCabecera.FieldByName('SU_REFERENCIA').AsString;
        HCalc.HorizontalAlignment(Fila, 3, taLeftJustify);
        Inc(Fila);

        HCalc.CellText[Fila, 2] := _('No. Pedido:');
        HCalc.CellText[Fila, 3] := QMCabecera.FieldByName('PEDIDO_CLIENTE').AsString;
        HCalc.HorizontalAlignment(Fila, 3, taLeftJustify);
        Inc(Fila);

        HCalc.CellText[Fila, 2] := _('Cliente:');
        HCalc.CellText[Fila, 3] := QMCabecera.FieldByName('TITULO').AsString;
        Inc(Fila);
        if (QMCabecera.FieldByName('NOMBRE_COMERCIAL').AsString <> QMCabecera.FieldByName('TITULO').AsString) then
        begin
           HCalc.CellText[Fila, 3] := QMCabecera.FieldByName('NOMBRE_COMERCIAL').AsString;
           Inc(Fila);
        end;

        HCalc.CellText[Fila, 2] := _('Forma Pago:');
        HCalc.CellText[Fila, 3] := DameTituloFormaPago(QMCabecera.FieldByName('FORMA_PAGO').AsString, QMCabecera.FieldByName('IDIOMA').AsString);
        Inc(Fila);
        Inc(Fila);

        // Direccion
        with xDireccion_Cliente do
        begin
           Close;
           Params.ByName['TERCERO'].AsInteger := QMCabecera.FieldByName('TERCERO').Value;
           Params.ByName['DIRECCION'].AsInteger := QMCabecera.FieldByName('DIRECCION').Value;
           Open;
        end;

        HCalc.CellText[Fila, 2] := _('Direccion:');
        HCalc.CellText[Fila, 3] := xDireccion_Cliente.FieldByName('DIRECCION').AsString;
        Inc(Fila);
        HCalc.CellText[Fila, 3] := xDireccion_Cliente.FieldByName('CODPOB').AsString;
        Inc(Fila);
        Inc(Fila);

        // Descuentos 
        if (QMCabecera.FieldByName('DTO_CIAL').Value <> 0) then
        begin
           HCalc.CellText[Fila, 2] := _('Desc. Cial.:');
           HCalc.CellText[Fila, 3] := QMCabecera.FieldByName('DTO_CIAL').AsString;
           HCalc.HorizontalAlignment(Fila, 3, taLeftJustify);
           Inc(Fila);
        end;

        if (QMCabecera.FieldByName('DTO_PP').Value <> 0) then
        begin
           HCalc.CellText[Fila, 2] := _('Desc. PP:');
           HCalc.CellText[Fila, 3] := QMCabecera.FieldByName('DTO_PP').AsString;
           HCalc.HorizontalAlignment(Fila, 3, taLeftJustify);
           Inc(Fila);
        end;

        // Detalle
        FSendCorreo.Texto(_('Detalle'));
        FSendCorreo.PBProgreso.Position := 2;
        Inc(Fila);
        HCalc.CellText[Fila, 1] := _('Detalle');
        DestacaFila(Fila, clYellow);
        Inc(Fila);

        // Columnas del detalle
        HCalc.CellText[Fila, 1] := _('Articulo');
        HCalc.CellText[Fila, 2] := _('Cod.Barras');
        HCalc.CellText[Fila, 3] := _('Descripción');
        HCalc.CellText[Fila, 4] := _('Unidades');
        HCalc.CellText[Fila, 5] := _('Precio');
        HCalc.CellText[Fila, 6] := _('Desc.1');
        HCalc.CellText[Fila, 7] := _('Desc.2');
        HCalc.CellText[Fila, 8] := _('Desc.3');
        HCalc.CellText[Fila, 9] := _('Bruto');
        HCalc.CellText[Fila, 10] := _('RAEE');
        HCalc.CellText[Fila, 11] := _('Base');
        HCalc.CellText[Fila, 12] := _('% IVA');
        HCalc.CellText[Fila, 13] := _('Imp IVA');
        HCalc.CellText[Fila, 14] := _('Liquido Linea');

        // Destaco titulos
        DestacaFila(Fila, clSilver);

        // Recorre los detalles
        QMDetalle.First;
        while not QMDetalle.EOF do
        begin
           FSendCorreo.Texto(_('Detalle') + format(_('Linea: %d'), [QMDetalle.FieldByName('LINEA').AsInteger]));
           Inc(Fila);

           HCalc.CellText[Fila, 1] := QMDetalle.FieldByName('ARTICULO').AsString;
           HCalc.CellText[Fila, 2] := DameCodigoBarras(QMDetalle.FieldByName('ARTICULO').AsString);
           HCalc.CellText[Fila, 3] := QMDetalle.FieldByName('TITULO').AsString;
           HCalc.SendNumber(Fila, 4, QMDetalle.FieldByName('UNIDADES').AsFloat);
           HCalc.SendNumber(Fila, 5, QMDetalle.FieldByName('PRECIO').AsFloat);
           if (QMDetalle.FieldByName('DESCUENTO').AsFloat <> 0) then
              HCalc.SendNumber(Fila, 6, QMDetalle.FieldByName('DESCUENTO').AsFloat);
           if (QMDetalle.FieldByName('DESCUENTO_2').AsFloat <> 0) then
              HCalc.SendNumber(Fila, 7, QMDetalle.FieldByName('DESCUENTO_2').AsFloat);
           if (QMDetalle.FieldByName('DESCUENTO_3').AsFloat <> 0) then
              HCalc.SendNumber(Fila, 8, QMDetalle.FieldByName('DESCUENTO_3').AsFloat);
           HCalc.SendNumber(Fila, 9, QMDetalle.FieldByName('BRUTO').AsFloat);
           if (QMDetalle.FieldByName('ECOTASA').AsFloat <> 0) then
              HCalc.SendNumber(Fila, 10, QMDetalle.FieldByName('ECOTASA').AsFloat);
           HCalc.SendNumber(Fila, 11, QMDetalle.FieldByName('B_IMPONIBLE').AsFloat);
           HCalc.SendNumber(Fila, 12, QMDetalle.FieldByName('P_IVA').AsFloat);
           HCalc.SendNumber(Fila, 13, QMDetalle.FieldByName('C_IVA').AsFloat);
           HCalc.SendNumber(Fila, 14, QMDetalle.FieldByName('LIQUIDO').AsFloat);

           QMDetalle.Next;
        end;

        // Impuestos
        FSendCorreo.Texto(_('Impuestos'));
        FSendCorreo.PBProgreso.Position := 3;
        Inc(Fila);
        Inc(Fila);
        HCalc.CellText[Fila, 1] := _('Impuestos');
        DestacaFila(Fila, clYellow);
        Inc(Fila);

        HCalc.CellText[Fila, 2] := _('Orden');
        HCalc.CellText[Fila, 3] := _('Descripcion');
        HCalc.CellText[Fila, 4] := _('Porcentaje');
        HCalc.CellText[Fila, 5] := _('Base');
        HCalc.CellText[Fila, 6] := _('Cuota');
        HCalc.CellText[Fila, 7] := _('% R.E.');
        HCalc.CellText[Fila, 8] := _('R.E.');
        DestacaFila(Fila, clSilver);
        Inc(Fila);

        with xDobleIva do
        begin
           Close;
           Params.ByName['ID_S'].AsInteger := ID_S;
           Open;
        end;

        Orden := 0;
        while not xDobleIva.EOF do
        begin
           if xDobleIva.FieldByName('S_BASES').AsFloat > 0 then
           begin
              Inc(Orden);
              HCalc.SendNumber(Fila, 2, Orden);
              HCalc.CellText[Fila, 3] := DMMain.DameNombreIva(REntorno.Pais, xDobleIva.FieldByName('TIPO_IVA').AsInteger, QMCabecera.FieldByName('IDIOMA').AsString);
              HCalc.SendNumber(Fila, 4, xDobleIva.FieldByName('P_IVA').AsFloat);
              HCalc.SendNumber(Fila, 5, xDobleIva.FieldByName('S_BASES').AsFloat);
              HCalc.SendNumber(Fila, 6, xDobleIva.FieldByName('I_IVA').AsFloat);
              if (xDobleIva.FieldByName('P_RE').AsFloat <> 0) then
              begin
                 HCalc.SendNumber(Fila, 7, xDobleIva.FieldByName('P_RE').AsFloat);
                 HCalc.SendNumber(Fila, 8, xDobleIva.FieldByName('I_RE').AsFloat);
              end;
              Inc(Fila);
           end;
           xDobleIva.Next;
        end;

        // Total
        FSendCorreo.Texto(_('Total'));
        FSendCorreo.PBProgreso.Position := 4;
        Inc(Fila);
        HCalc.CellText[Fila, 1] := _('Total');
        DestacaFila(Fila, clYellow);
        Inc(Fila);
        HCalc.CellText[Fila, 2] := _('Total Factura');
        HCalc.SendNumber(Fila, 4, QMCabecera.FieldByName('TOTAL_A_COBRAR').AsFloat);
        Inc(Fila);

        // Vencimientos
        FSendCorreo.Texto(_('Vencimientos'));
        FSendCorreo.PBProgreso.Position := 5;
        Inc(Fila);
        HCalc.CellText[Fila, 1] := _('Vencimientos');
        DestacaFila(Fila, clYellow);
        Inc(Fila);

        HCalc.CellText[Fila, 2] := _('Orden');
        HCalc.CellText[Fila, 3] := _('Fecha Vencimiento');
        HCalc.CellText[Fila, 4] := _('Importe');
        DestacaFila(Fila, clSilver);
        Inc(Fila);

        with xDobleRecibos do
        begin
           Close;
           Params.ByName['ID_S'].AsInteger := ID_S;
           Open;
        end;

        Orden := 0;
        while not xDobleRecibos.EOF do
        begin
           Inc(Orden);
           HCalc.SendNumber(Fila, 2, Orden);
           HCalc.CellText[Fila, 3] := DateToStr(xDobleRecibos.FieldByName('VENCIMIENTO').AsDateTime);
           HCalc.SendNumber(Fila, 4, xDobleRecibos.FieldByName('LIQUIDO').AsFloat);
           Inc(Fila);
           xDobleRecibos.Next;
        end;

        // Formato de columnas numéricas
        HCalc.ColNumberFormat(4, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
        HCalc.ColNumberFormat(5, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
        HCalc.ColNumberFormat(6, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
        HCalc.ColNumberFormat(7, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
        HCalc.ColNumberFormat(8, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
        HCalc.ColNumberFormat(9, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
        HCalc.ColNumberFormat(10, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
        HCalc.ColNumberFormat(11, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
        HCalc.ColNumberFormat(12, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
        HCalc.ColNumberFormat(13, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
        HCalc.ColNumberFormat(14, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');

        // AutoFit de las columnas
        for Columna := 1 to MaxCol do
           HCalc.AutoFit(Columna);

        // Lotes
        FSendCorreo.Texto(_('Lotes'));
        FSendCorreo.PBProgreso.Position := 6;
        Inc(Fila);
        HCalc.CellText[Fila, 1] := _('Lotes');
        DestacaFila(Fila, clYellow);
        Inc(Fila);

        HCalc.CellText[Fila, 2] := _('Articulo');
        HCalc.CellText[Fila, 3] := _('Lote');
        HCalc.CellText[Fila, 4] := _('Cantidad');
        DestacaFila(Fila, clSilver);
        Inc(Fila);

        QMDetalle.First;
        while not QMDetalle.EOF do
        begin
           while not xLotes.EOF do
           begin
              FSendCorreo.Texto(_('Lotes') + ' ' + format(_('Linea: %d'), [QMDetalle.FieldByName('LINEA').AsInteger]));
              HCalc.CellText[Fila, 2] := xLotes.FieldByName('ARTICULO').AsString;
              HCalc.CellText[Fila, 3] := xLotes.FieldByName('LOTE').AsString;
              HCalc.HorizontalAlignment(Fila, 3, taLeftJustify);
              HCalc.SendNumber(Fila, 4, xLotes.FieldByName('CANTIDAD').AsFloat);
              Inc(Fila);

              xLotes.Next;
           end;

           QMDetalle.Next;
        end;

        // Numeros de series
        FSendCorreo.Texto(_('Numeros de series'));
        FSendCorreo.PBProgreso.Position := 7;
        Inc(Fila);
        HCalc.CellText[Fila, 1] := _('Nros. de Serie');
        DestacaFila(Fila, clYellow);
        Inc(Fila);

        HCalc.CellText[Fila, 2] := _('Articulo');
        HCalc.CellText[Fila, 3] := _('Nro. de Serie');
        DestacaFila(Fila, clSilver);
        Inc(Fila);

        QMDetalle.First; // Recorro el detalle para tener los parametros necesarios para obtener los numeros de serie
        while not QMDetalle.EOF do
        begin
           with TFIBDataSet.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 Transaction := DameTransactionRO(DMMain.DataBase);
                 try
                    if (not Transaction.InTransaction) then
                       Transaction.StartTransaction;

                    // Nros de Serie
                    SelectSQL.Add(' SELECT A.ARTICULO, S.NSERIE ');
                    SelectSQL.Add(' FROM VER_DETALLE_SERIALIZACION S ');
                    SelectSQL.Add(' JOIN ART_ARTICULOS A ON S.EMPRESA = A.EMPRESA AND S.ARTICULO = A.ARTICULO ');
                    SelectSQL.Add(' WHERE ');
                    SelectSQL.Add(' S.EMPRESA = :EMPRESA AND ');
                    SelectSQL.Add(' S.EJERCICIO = :EJERCICIO AND ');
                    SelectSQL.Add(' S.CANAL = :CANAL AND ');
                    SelectSQL.Add(' S.SERIE = :SERIE AND ');
                    SelectSQL.Add(' S.TIPO = :TIPO AND ');
                    SelectSQL.Add(' S.RIG = :RIG AND  ');
                    SelectSQL.Add(' S.LINEA = :LINEA ');
                    SelectSQL.Add(' ORDER BY S.ARTICULO, S.NSERIE ');

                    Params.ByName['EMPRESA'].AsInteger := QMDetalle.FieldByName('EMPRESA').AsInteger;
                    Params.ByName['EJERCICIO'].AsInteger := QMDetalle.FieldByName('EJERCICIO').AsInteger;
                    Params.ByName['CANAL'].AsInteger := QMDetalle.FieldByName('CANAL').AsInteger;
                    Params.ByName['SERIE'].AsString := QMDetalle.FieldByName('SERIE').AsString;
                    Params.ByName['TIPO'].AsString := QMDetalle.FieldByName('TIPO').AsString;
                    Params.ByName['RIG'].AsInteger := QMDetalle.FieldByName('RIG').AsInteger;
                    Params.ByName['LINEA'].AsInteger := QMDetalle.FieldByName('LINEA').AsInteger;
                    Open;

                    while not EOF do
                    begin
                       FSendCorreo.Texto(_('Numeros de series') + ' ' + format(_('Linea: %d'), [QMDetalle.FieldByName('LINEA').AsInteger]));
                       HCalc.CellText[Fila, 2] := FieldByName('ARTICULO').AsString;
                       HCalc.CellText[Fila, 3] := FieldByName('NSERIE').AsString;
                       HCalc.HorizontalAlignment(Fila, 3, taLeftJustify);
                       Inc(Fila);

                       Next;
                    end;
                    Close;
                    Transaction.Commit;
                 finally
                    Transaction.Free;
                 end;
              finally
                 Free;
              end;
           end;

           QMDetalle.Next;
        end;

        HCalc.SaveDocAs(Archivo, (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0));
     finally
        HCalc.Free;
     end;
     FSendCorreo.Close;
  finally
     FreeAndNil(FSendCorreo);
  end;
end;

procedure TDMLstFactura.xCabReparacionAfterOpen(DataSet: TDataSet);
begin
  xRecepcion.Open;
  xFichaTecnica.Open;
end;

procedure TDMLstFactura.xCabReparacionBeforeClose(DataSet: TDataSet);
begin
  xRecepcion.Close;
  xFichaTecnica.Close;
end;

procedure TDMLstFactura.frxFacturaProgress(Sender: TfrxReport; ProgressType: TfrxProgressType; Progress: integer);
var
  Tipo : string;
begin
  case ProgressType of
     ptRunning: Tipo := 'ptRunning';
     ptExporting: Tipo := 'ptExporting';
     ptPrinting: Tipo := 'ptPrinting';
  end;
  DMMain.Log(format('frxFacturaProgress = %s - %d', [Tipo, Progress]));
end;

procedure TDMLstFactura.frxFacturaProgressStart(Sender: TfrxReport; ProgressType: TfrxProgressType; Progress: integer);
var
  Tipo : string;
begin
  case ProgressType of
     ptRunning: Tipo := 'ptRunning';
     ptExporting: Tipo := 'ptExporting';
     ptPrinting: Tipo := 'ptPrinting';
  end;
  DMMain.LogIni(format('frxFacturaProgressStart = %s - %d', [Tipo, Progress]));
end;

procedure TDMLstFactura.frxFacturaProgressStop(Sender: TfrxReport; ProgressType: TfrxProgressType; Progress: integer);
var
  Tipo : string;
begin
  case ProgressType of
     ptRunning: Tipo := 'ptRunning';
     ptExporting: Tipo := 'ptExporting';
     ptPrinting: Tipo := 'ptPrinting';
  end;
  DMMain.LogFin(format('frxFacturaProgressStop = %s - %d', [Tipo, Progress]));
end;

end.
