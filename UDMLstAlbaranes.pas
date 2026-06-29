unit UDMLstAlbaranes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport,
  FIBQuery, FIBDatabase, UFIBModificados, UHYReport, HYFIBQuery,
  FIBDataSetRO, UHYReportMail, FR_Pars, frxClass, frxHYReport, frxDBSet, FIBTableDataSetRO,
  ALetras;

type
  TDMLstAlbaranes = class(TDataModule)
     frAlbaranes: TfrHYReport;
     frDBDetalle: TfrDBDataSet;
     DSDetalle: TDataSource;
     DSxCliente: TDataSource;
     frUDPie: TfrUserDataset;
     frUDNotasArt: TfrUserDataset;
     frDBxTransportista: TfrDBDataSet;
     frDBxDireccion_Cliente: TfrDBDataSet;
     DSxDireccion_Cliente: TDataSource;
     DSxTransportistas: TDataSource;
     DSQSPProcedencia: TDataSource;
     frDBQSPProcedencia: TfrDBDataSet;
     frDBxNotasCliente: TfrDBDataSet;
     DSxNotasCliente: TDataSource;
     DSxRuta: TDataSource;
     frDBxRuta: TfrDBDataSet;
     DSxDireccionFiscal: TDataSource;
     frDBxDireccionFiscal: TfrDBDataSet;
     TLocal: THYTransaction;
     HYReport: THYReport;
     HYRSCabecera: THYReportSource;
     HYRSxCliente: THYReportSource;
     HYRSxDirCliente: THYReportSource;
     HYRSDetalle: THYReportSource;
     HYRSDetalleIVA: THYReportSource;
     DSxCuenta: TDataSource;
     HYRSTransportista: THYReportSource;
     DSxTercero: TDataSource;
     frDBxTercero: TfrDBDataSet;
     QDirCompleta: THYFIBQuery;
     DSxAgente: TDataSource;
     frDBDxAgente: TfrDBDataSet;
     QProcedenciaUnica: THYFIBQuery;
     frDBxDatosIva: TfrDBDataSet;
     DSxDatosIva: TDataSource;
     DSxFormaPago: TDataSource;
     frDBxFormaPago: TfrDBDataSet;
     SPDame_factor: THYFIBQuery;
     frUserNotasCab: TfrUserDataset;
     QMCabecera: TFIBDataSetRO;
     QMDetalle: TFIBDataSetRO;
     xCliente: TFIBDataSetRO;
     xDireccion_Cliente: TFIBDataSetRO;
     xTransportistas: TFIBDataSetRO;
     xRuta: TFIBDataSetRO;
     xNotasCliente: TFIBDataSetRO;
     QSPProcedencia: TFIBDataSetRO;
     xDireccionFiscal: TFIBDataSetRO;
     xTercero: TFIBDataSetRO;
     xAgente: TFIBDataSetRO;
     xDatosIva: TFIBDataSetRO;
     xCuenta: TFIBDataSetRO;
     xFormaPago: TFIBDataSetRO;
     frDBDSDobleCabecera: TfrDBDataSet;
     DSDobleCabecera: TDataSource;
     DobleCabecera: TFIBDataSetRO;
     DSxDobFormaPago: TDataSource;
     frDBDSxDobFormaPago: TfrDBDataSet;
     xDobFormaPago: TFIBDataSetRO;
     HYRxTercero: THYReportSource;
     xDobTransportista: TFIBDataSetRO;
     HYRxDobTransportista: THYReportSource;
     HYRSDobleCabecera: THYReportSource;
     HYRDobDireccionCliente: THYReportSource;
     xDobDireccionCliente: TFIBDataSetRO;
     xDireccionCliente: TFIBDataSetRO;
     HYRSDireccionCliente: THYReportSource;
     xDobNotasClientes: TFIBDataSetRO;
     HYRxDobNotasClientes: THYReportSource;
     xDobleIva: TFIBDataSetRO;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     QDamePrecioUdPtoVerde: THYFIBQuery;
     xLotes: TFIBDataSetRO;
     DSxLotes: TDataSource;
     frDBxLotes: TfrDBDataSet;
     HYxLotes: THYReportSource;
     QGen: THYFIBQuery;
     xUpdateaDocumentos: TFIBDataSetRO;
     DSQSPProcedencia_kri: TDataSource;
     QSPProcedencia_kri: TFIBDataSetRO;
     QLoteKri: TFIBDataSetRO;
     QNroSerieKri: TFIBDataSetRO;
     DSxDireccionKRI: TDataSource;
     xDireccionKRI: TFIBDataSetRO;
     HYRxDireccionKRI: THYReportSource;
     xDireccionesNIF: TFIBTableSetRO;
     xDobDireccionesNIF: TFIBTableSetRO;
     frDBDetalleTallas_borrar: TfrDBDataSet;
     DSDetalleTallas_borrar: TDataSource;
     QMDetalleTallas_borrar: TFIBDataSetRO;
     xTallas: TFIBDataSetRO;
     DSxTallas: TDataSource;
     frDBxTallas: TfrDBDataSet;
     xDireccionEDI: TFIBDataSetRO;
     DSxDireccionEDI: TDataSource;
     DSQMCabeceraEDI: TDataSource;
     QMCabeceraEDI: TFIBDataSetRO;
     DSxDobleIva: TDataSource;
     DSxDobNotasClientes: TDataSource;
     DSxDireccionCliente: TDataSource;
     DSxDobDireccionCliente: TDataSource;
     DSxDobTransportista: TDataSource;
     HYRSxAgente: THYReportSource;
     xDestinatario: TFIBDataSetRO;
     DSxDestinatario: TDataSource;
     xIntermediaria: TFIBDataSetRO;
     DSxIntermediaria: TDataSource;
     xTransportistaCarta: TFIBDataSetRO;
     DSxTransportistaCarta: TDataSource;
     xExpedidora: TFIBDataSetRO;
     DSxExpedidora: TDataSource;
     xPeso: TFIBDataSetRO;
     DSxPeso: TDataSource;
     xPortes: TFIBDataSetRO;
     DSxPortes: TDataSource;
     xCargadora: TFIBDataSetRO;
     DSxCargadora: TDataSource;
     xNaturaleza1: TFIBDataSetRO;
     DSxNaturaleza1: TDataSource;
     xNaturaleza2: TFIBDataSetRO;
     DSxNaturaleza2: TDataSource;
     xNaturaleza3: TFIBDataSetRO;
     DSxNaturaleza3: TDataSource;
     xMatricula1: TFIBDataSetRO;
     DSxMatricula1: TDataSource;
     xMatricula2: TFIBDataSetRO;
     DSxMatricula2: TDataSource;
     xMatricula3: TFIBDataSetRO;
     DSxMatricula3: TDataSource;
     xDobleMatricula: TFIBDataSetRO;
     xDobleCartaPortes: TFIBDataSetRO;
     xDobleNaturaleza: TFIBDataSetRO;
     DSxDobleMatricula: TDataSource;
     DSxDobleNaturaleza: TDataSource;
     DSxDobleCartaPortes: TDataSource;
     frDBxDobleMatricula: TfrDBDataSet;
     frDBxDobleNaturaleza: TfrDBDataSet;
     frDBxDobleCartaPortes: TfrDBDataSet;
     xNroSerie: TFIBDataSetRO;
     DSxNroSerie: TDataSource;
     frDBxNroSerie: TfrDBDataSet;
     HYRSxNroSerie: THYReportSource;
     xArticulos: TFIBDataSetRO;
     DSxArticulos: TDataSource;
     frDBxArticulos: TfrDBDataSet;
     xMonedasIdiomas: TFIBDataSetRO;
     DSxMonedasIdiomas: TDataSource;
     frDBCabecera: TfrDBDataSet;
     DSCabecera: TDataSource;
     HYRSxArticulos: THYReportSource;
     HYRSxFormaPago: THYReportSource;
     HYRxDobFormaPago: THYReportSource;
     HYRSxRuta: THYReportSource;
     frDBxGarantiasKri: TfrDBDataSet;
     xGarantiasKri: TFIBDataSetRO;
     DSxGarantiasKri: TDataSource;
     frDBPromociones: TfrDBDataSet;
     QMPromociones: TFIBDataSetRO;
     DSQMPromociones: TDataSource;
     frUDNotasArtPRM: TfrUserDataset;
     xArticulosPRM: TFIBDataSetRO;
     DSxArticulosPRM: TDataSource;
     frDBxArticulosPRM: TfrDBDataSet;
     HYRSPromociones: THYReportSource;
     frxDBCabecera: TfrxDBDataset;
     frxDBDetalle: TfrxDBDataset;
     frxDBPromociones: TfrxDBDataset;
     frxUDNotasArtPRM: TfrxUserDataSet;
     frxUDNotasArt: TfrxUserDataSet;
     frxDBQSPProcedencia: TfrxDBDataset;
     frxAlbaranes: TfrxHYReport;
     xProyectos: TFIBDataSetRO;
     DSxProyectos: TDataSource;
     xProyectosDetalle: TFIBDataSetRO;
     DSxProyectosDetalle: TDataSource;
     frxDBxDatosIva: TfrxDBDataset;
     QMArticuloTallas: TFIBDataSetRO;
     DSArticuloTallas: TDataSource;
     Letras: TLetra;
     QMDetallesPortesQui: TFIBDataSetRO;
     DSQMDetallesPortesQui: TDataSource;
     frDBQMDetallesPortesQui: TfrDBDataSet;
     frDBxCartaPortes: TfrDBDataSet;
     DSxCartaPortes: TDataSource;
     xCartaPortes: TFIBDataSetRO;
     DSxDobTranspCarta: TDataSource;
     xDobTranspCarta: TFIBDataSetRO;
     xDetalleDeCabecera: TFIBDataSetRO;
     DSxDetalleDeCabecera: TDataSource;
     DSDetalleUE: TDataSource;
     QMDetalleUE: TFIBDataSetRO;
     DSDireccionEntregaLinea: TDataSource;
     xDireccionEntregaLinea: TFIBDataSetRO;
     xPedidoAlquiler: TFIBDataSetRO;
     DSPedidoAlquiler: TDataSource;
     xRecibosAnticipos: TFIBDataSetRO;
     DSxRecibosAnticipos: TDataSource;
     xTotalRecibosAnticipos: TFIBDataSetRO;
     DSxTotalRecibosAnticipos: TDataSource;
     frDBxRecibosAnticipos: TfrDBDataSet;
     frDBxTotalRecibosAnticipos: TfrDBDataSet;
     QMDetalleADR: TFIBDataSetRO;
     DSQMDetalleADR: TDataSource;
     frDBQMDetalleADR: TfrDBDataSet;
     xLstFirmas: TFIBDataSetRO;
     DSxLstFirmas: TDataSource;
     frDBDLstFirmas: TfrDBDataSet;
     frxDBxLstFirmas: TfrxDBDataset;
     DSCuota: TDataSource;
     xCuota: TFIBDataSetRO;
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
     xOrdProd: TFIBDataSetRO;
     DSxOrdProd: TDataSource;
     xOrdProdEmpleado: TFIBDataSetRO;
     DSxOrdProdEmpleado: TDataSource;
     xHerenciaPEC: TFIBDataSetRO;
     xHerenciaOFC: TFIBDataSetRO;
     DSxHerenciaPEC: TDataSource;
     DSxHerenciaOFC: TDataSource;
     xReferenciaDte: TFIBDataSetRO;
     frDBxReferenciaDte: TfrDBDataSet;
     DSxReferenciaDte: TDataSource;
     xArticulosIdioma: TFIBDataSetRO;
     DSxArticulosIdioma: TDataSource;
     frDBxArticulosIdioma: TfrDBDataSet;
     xArticuloTYC: TFIBDataSetRO;
     DSxArticuloTYC: TDataSource;
     xCopiasCartaPorte: TFIBDataSetRO;
     DSxCopiasCartaPorte: TDataSource;
     frDBxCopiasCartaPorte: TfrDBDataSet;
     xTerceroBanco: TFIBDataSetRO;
     DSxTerceroBanco: TDataSource;
     frDBxTerceroBanco: TfrDBDataSet;
     DSxDobTerceroBan: TDataSource;
     frDBxDobTerceroBan: TfrDBDataSet;
     xDobTerceroBan: TFIBDataSetRO;
     procedure frAlbaranesGetValue(const ParName: string; var ParValue: variant);
     procedure DMLstAlbaranesDestroy(Sender: TObject);
     procedure frAlbaranesEnterRect(Memo: TStringList; View: TfrView);
     procedure frUDNotasArtCheckEOF(Sender: TObject; var EOF: boolean);
     procedure frUDNotasArtFirst(Sender: TObject);
     procedure frUDNotasArtNext(Sender: TObject);
     procedure DMLstAlbaranesCreate(Sender: TObject);
     procedure QMDetalleAfterScroll(DataSet: TDataSet);
     procedure QMCabeceraAfterScroll(DataSet: TDataSet);
     procedure xClienteAfterScroll(DataSet: TDataSet);
     procedure HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
     procedure frAlbaranesBeginDoc;
     procedure frUserNotasCabCheckEOF(Sender: TObject; var EOF: boolean);
     procedure frUserNotasCabFirst(Sender: TObject);
     procedure frUserNotasCabNext(Sender: TObject);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure HYReportLengthBands(Sender: THYReport; Band: THYBand; var Length: integer);
     procedure HYReportPrepareFields(Sender: THYReport; Field: THYField; Contents: TStrings);
     procedure QMDetalleTallas_borrarAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraEDIAfterOpen(DataSet: TDataSet);
     procedure frAlbaranesPrintReport;
     procedure HYReportPrintReport(Sender: THYReport);
     procedure frAlbaranesUserFunction(const Name: string; p1, p2, p3: variant; var Val: variant);
     procedure DobleCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMPromocionesAfterOpen(DataSet: TDataSet);
     procedure QMPromocionesAfterScroll(DataSet: TDataSet);
     procedure frUDNotasArtPRMCheckEOF(Sender: TObject; var EOF: boolean);
     procedure frUDNotasArtPRMFirst(Sender: TObject);
     procedure frUDNotasArtPRMNext(Sender: TObject);
     procedure frxAlbaranesBeforePrint(Sender: TfrxReportComponent);
     procedure frxAlbaranesBeginDoc(Sender: TObject);
     procedure frxAlbaranesPrintReport(Sender: TObject);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure QMDetalleBeforeClose(DataSet: TDataSet);
     procedure xClienteAfterOpen(DataSet: TDataSet);
     procedure xClienteBeforeClose(DataSet: TDataSet);
     procedure DobleCabeceraBeforeClose(DataSet: TDataSet);
     procedure xDobleCartaPortesAfterOpen(DataSet: TDataSet);
     procedure xDobleCartaPortesBeforeClose(DataSet: TDataSet);
     procedure xCartaPortesAfterOpen(DataSet: TDataSet);
     procedure xCartaPortesBeforeClose(DataSet: TDataSet);
     procedure QMPromocionesBeforeClose(DataSet: TDataSet);
     procedure QMDetalleTallas_borrarAfterScroll(DataSet: TDataSet);
     function frxAlbaranesUserFunction(const MethodName: string; var Params: variant): variant;
     procedure QMGrupoTallaAfterOpen(DataSet: TDataSet);
     procedure QMGrupoTallaBeforeClose(DataSet: TDataSet);
     procedure QMDetalleTallasAfterOpen(DataSet: TDataSet);
     procedure QMDetalleTallasBeforeClose(DataSet: TDataSet);
     procedure xOrdProdBeforeClose(DataSet: TDataSet);
     procedure xOrdProdAfterOpen(DataSet: TDataSet);
     procedure QMDetalleADRAfterOpen(DataSet: TDataSet);
     procedure QMDetalleADRBeforeClose(DataSet: TDataSet);
     procedure xHerenciaPECAfterOpen(DataSet: TDataSet);
     procedure xHerenciaPECBeforeClose(DataSet: TDataSet);
     procedure DobleCabeceraAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
     i, x, indNotas: integer;
     ric, ric_prm, NotasCab: TStringList;
     Pagina: integer;
     TipoDoc: string;
     P_IvaUnico, P_REUnico, subtotal, totalptoverde, precioverdeln: double;
     IVA: smallint;
     LocalMascaraN, LocalMascaraL: string;
     LocalMascaraNSec, Moneda_Sec: string;
     nro_serie: string;
     SerieGen: string;
     SW, ID_S_AUX, FiltroGen: integer;
     MarcarListado: boolean;
     Param_MODREST006: boolean;
     Param_MODREST015: boolean;
     Param_MODREST017: boolean;
     Param_LSTOALB001: string;
     Param_LSTOALB002: string;
     Param_LSTOALB003: string;
     Param_LSTPICK002: string;
     Param_LSTALB0001: boolean;
     procedure GetProcedencia(var Tipo, strRIG: string);
     function DameHerencia(DTipo: string): string;
     function DameFechaHerencia(DTipo: string): TDateTime;
     function DameImagenArtPromo: integer;
     function n_lineas_memo_detalle: integer;
     function DamePrecioUdPtoVerde(Empresa, Ejercicio, Canal: integer; Articulo: string): double;
     procedure LineasNoSerializadas(L: TStrings; Tipo: string; ID_S: integer);
  public
     nombreFich, rutaFich: string;
     procedure MostrarListado(const ID_S, RIG: integer; const Serie: string; Modo, Numero: byte; const Ejercicio: integer; aMarcarListado: boolean = True);
     procedure MostrarListadoPicking(const ID_S, RIG: integer; const Serie: string; Modo, Numero: byte; const Ejercicio: integer);
     procedure MostrarListadoEtiqueta(const ID_S, RIG, Grupo: integer; const Serie: string; Modo: byte; const Ejercicio: integer);
     procedure MostrarListadoFiltrado(Modo: byte; Filtro: integer; Serie: string);
     procedure UpdateaDocumentos;
     procedure MostrarListadoMail(id_s: integer; Serie: string; Modo: integer; const Ejercicio: integer; aMarcarListado: boolean = True);
     procedure ExportarExcel(ID_S: integer; Archivo: string);
  end;

var
  DMLstAlbaranes : TDMLstAlbaranes;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles, frxRich, UDMRecibosFactura, ExtCtrls, UParam,
  UFMain, UFSendCorreo, UHojaCalc, UDameDato, UImagenes;

{$R *.DFM}

procedure TDMLstAlbaranes.DMLstAlbaranesCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.Log('DMLstAlbaranesCreate');

  AbreData(TDMListados, DMListados);
  AbreData(TDMRecibosFactura, DMRecibosFactura);

  // Crear StringLists para las notas por artículo y para la cabecera

  ric := TStringList.Create;
  ric_prm := TStringList.Create;
  NotasCab := TStringList.Create;

  Param_MODREST006 := (LeeParametro('MODREST006') = 'S');
  Param_MODREST015 := (LeeParametro('MODREST015') = 'S');
  Param_MODREST017 := (LeeParametro('MODREST017') = 'S');
  Param_LSTOALB001 := LeeParametro('LSTOALB001');
  Param_LSTOALB002 := LeeParametro('LSTOALB002');
  Param_LSTOALB003 := LeeParametro('LSTOALB003');
  Param_LSTPICK002 := LeeParametro('LSTPICK002');
  Param_LSTALB0001 := (LeeParametro('LSTALB0001') = 'S');

  if Param_MODREST017 then
  begin
     with QMGrupoTalla do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' /* Los distintos grupos de talla que intervienen en el detalle del documento */ ');
        SelectSQL.Add(' /* Solo los que tienen lineas con unidades */ ');
        if (Param_LSTOALB003 = 'S') then
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
        if (Param_LSTOALB003 = 'S') then
           SelectSQL.Add(' ORDER BY X.O_DOC, X.ID_G_T DESC ')
        else
           SelectSQL.Add(' ORDER BY X.ID_G_T DESC ');
     end;
  end;

  QMDetalle.Close;
  with QMDetalle.SelectSQL do
  begin
     Clear;
     if not Param_LSTALB0001 then
     begin
        Add(' SELECT * FROM VER_DETALLE_ALBARAN_LST ');
        Add(' WHERE ');
        Add(' ID_S = ?ID_S ');

        // 230 - 1 - Listados de ALB, muestra las promociones como a linea mas. (No en un subdetalle)
        if (DMMain.EstadoKri(230) <> 1) then
           Add(' AND TIPO_LINEA<>''PRM'' ');

        if ((Param_LSTOALB001) = '') then
           Add(' ORDER BY ORDEN ')
        else
           Add(' ORDER BY ' + Param_LSTOALB001);
     end
     else
     begin
        Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, MIN(LINEA) LINEA, ALMACEN, ARTICULO, TITULO, SUM(UNIDADES) UNIDADES, ');
        Add('        PRECIO, PIEZAS_X_BULTO, SUM(BULTOS) BULTOS, DESCUENTO, DESCUENTO_2, DESCUENTO_3, COMISION, P_COSTE, ');
        Add('        MIN(M_MOV_STOCK) M_MOV_STOCK, TIPO_IVA, P_IVA, P_RECARGO, SUM(BRUTO) BRUTO, SUM(B_COMISION) B_COMISION, ');
        Add('        SUM(I_DESCUENTO) I_DESCUENTO, SUM(B_IMPONIBLE) B_IMPONIBLE, SUM(B_DTO_LINEA) B_DTO_LINEA, ');
        Add('        SUM(I_COMISION) I_COMISION, C_IVA, C_RECARGO, SUM(T_COSTE) T_COSTE, M_BRUTO, SUM(LIQUIDO) LIQUIDO, ');
        Add('        MIN(ENTRADA) ENTRADA, CAST(NULL AS BLOB SUB_TYPE 1) NOTAS, CAST(NULL AS BLOB SUB_TYPE 1) NOTAS2, UNIDADES_EXT, ');
        Add('        TOTAL_UNIDADES_EXT, LIST(NSERIE, '', '') NSERIE, UNIDADES_SEC, MIN(ID_DETALLES_S) ID_DETALLES_S, ID_S, ID_A, ');
        Add('        ID_C_A, NO_FABRICACION_KRI, SUM(UNIDADES_FACTURADAS) UNIDADES_FACTURADAS, LINEA_SERVIDA, CAJA_EDI, TIPO_CAJA_EDI, ');
        Add('        COMISION_LINEAL, SUM(I_COMISION_LINEAL) I_COMISION_LINEAL, FECHA_PRE_DET, FECHA_REC_DET, TITULO_IDIOMA, ');
        Add('        TIPO_LINEA_KRI, MIN(ORDEN) ORDEN, TIPO_LINEA, PROC_PROMOCION, MIN(ORIGEN) ORIGEN, MIN(ID_P) ID_P, ');
        Add('        APLICA_UNIDADES_SECUNDARIAS, PROYECTO, MIN(LINEA_RELACION) LINEA_RELACION, CAST(NULL AS VARCHAR(15)) CRC_NOTAS, ');
        Add('        CAST(NULL AS VARCHAR(15)) CRC_NOTAS2, PRO_NUM_PLANO, TIPO_UNIDAD_LOGISTICA, TITULO_UNIDAD_LOGISTICA, ');
        Add('        U_POR_U_LOGISTICA, RELACIONAR_U_LOGISTICA, SUM(UNIDADES_LOGISTICAS) UNIDADES_LOGISTICAS, ');
        Add('        MIN(ID_UBICACION) ID_UBICACION, MIN(COMPOSICION) COMPOSICION, MIN(ID_A_UBICACION) ID_A_UBICACION, ');
        Add('        SUM(UNIDADES_UB) UNIDADES_UB, ALMACEN_UB, MIN(CALLE) CALLE, MIN(ESTANTERIA) ESTANTERIA, MIN(REPISA) REPISA, ');
        Add('        MIN(POSICION) POSICION, LIST(LOTE_SIMPLE, '', '') LOTE_SIMPLE, DIRECCION_ENTREGA, PAIS, COSTE_ADICIONAL, ID_IMAGEN, ');
        Add('        CODIGO_CLIENTE, TITULO_CLIENTE, MANIPULACION, ALFA_1, ALFA_2, ALFA_3, ALFA_4, ALFA_5, ALFA_6, ALFA_7, ALFA_8, ');
        Add('        INVERSION_SUJETO_PASIVO, DECIMALES_UNIDADES, SIGNO_UNIDADES, TIPO_IMPUESTO_ADICIONAL, P_IMPUESTO_ADICIONAL, ');
        Add('        LOTEABLE, SUM(CANT_LOTE) CANT_LOTE, MIN(ID_LOTE) ID_LOTE, MIN(LOTE) LOTE, SUM(UNIDADES_LOT) UNIDADES_LOT, ');
        Add('        MIN(PESO) PESO, SUM(PESO_TOTAL) PESO_TOTAL, SUM(PESO_REAL) PESO_REAL, MIN(O_ID_S) O_ID_S, ');
        Add('        MIN(O_ID_DETALLES_S) O_ID_DETALLES_S, MIN(O_DOC) O_DOC, MIN(O_DOC_DET) O_DOC_DET, ECOTASA, REQUIERE_LOTE_SIMPLE, ');
        Add('        ART_CODIGO_CLIENTE, TITULO_ART_CLIENTE, CAST(NULL AS VARCHAR(256)) NOTAS_PREPARACION ');
        Add(' FROM VER_DETALLE_ALBARAN_LST ');
        Add(' WHERE ');
        Add(' ID_S = ?ID_S ');
        // 230 - 1 - Listados de ALB, muestra las promociones como a linea mas. (No en un subdetalle)
        if (DMMain.EstadoKri(230) <> 1) then
           Add(' AND TIPO_LINEA<>''PRM'' ');
        Add(' GROUP BY -- ');
        Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ALMACEN, ARTICULO, TITULO, PRECIO, PIEZAS_X_BULTO, DESCUENTO, DESCUENTO_2, -- ');
        Add(' DESCUENTO_3, COMISION, P_COSTE, TIPO_IVA, P_IVA, P_RECARGO, C_IVA, C_RECARGO, M_BRUTO, UNIDADES_EXT, TOTAL_UNIDADES_EXT, -- ');
        Add(' UNIDADES_SEC, ID_S, ID_A, ID_C_A, NO_FABRICACION_KRI, LINEA_SERVIDA, CAJA_EDI, TIPO_CAJA_EDI, COMISION_LINEAL, -- ');
        Add(' FECHA_PRE_DET, FECHA_REC_DET, TITULO_IDIOMA, TIPO_LINEA_KRI, TIPO_LINEA, PROC_PROMOCION, APLICA_UNIDADES_SECUNDARIAS, -- ');
        Add(' PROYECTO, PRO_NUM_PLANO, TIPO_UNIDAD_LOGISTICA, TITULO_UNIDAD_LOGISTICA, U_POR_U_LOGISTICA, RELACIONAR_U_LOGISTICA, -- ');
        Add(' ALMACEN_UB, DIRECCION_ENTREGA, PAIS, COSTE_ADICIONAL, ID_IMAGEN, CODIGO_CLIENTE, TITULO_CLIENTE, MANIPULACION, -- ');
        Add(' ALFA_1, ALFA_2, ALFA_3, ALFA_4, ALFA_5, ALFA_6, ALFA_7, ALFA_8, INVERSION_SUJETO_PASIVO, DECIMALES_UNIDADES, -- ');
        Add(' SIGNO_UNIDADES, TIPO_IMPUESTO_ADICIONAL, P_IMPUESTO_ADICIONAL, LOTEABLE, ECOTASA, REQUIERE_LOTE_SIMPLE, -- ');
        Add(' ART_CODIGO_CLIENTE, TITULO_ART_CLIENTE ');
        Add(' ORDER BY MIN(ORDEN) ');
     end;
  end;

  Letras.DescDecimales := _('céntimos');
  Letras.Separador := DecimalSeparator;

  frxAlbaranes.AddFunction('function DAME_TEXTO_IDIOMA(i: integer; Bandera: string = ''''): string', 'Merge', 'Devuelve el texto en el idioma del documento');

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

procedure TDMLstAlbaranes.DMLstAlbaranesDestroy(Sender: TObject);
begin
  DMMain.Log('DMLstAlbaranesDestroy');
  ric.Free;
  ric_prm.Free;
  NotasCab.Free;
  CierraData(DMListados);
  CierraData(DMRecibosFactura);
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TDMLstAlbaranes.MostrarListadoFiltrado(Modo: byte; Filtro: integer; Serie: string);
var
  Titulo, str : string;
  i : integer;
  L : TStrings;
begin
  SerieGen := Serie;
  FiltroGen := Filtro;
  id_s_aux := 0;
  SW := 1;
  with QMCabecera do
  begin
     Close;
     Open;
     if (Filtro = 0) then
     begin
        DMMain.FiltraRO(QMCabecera, '11110', False);
        Params.ByName['SERIE'].AsString := Serie;
        Open;
     end;

     if (LeeParametro('ALBNSER001', Serie) = 'S') then
     begin
        L := TStringList.Create;
        try
           First;
           while not EOF do
           begin
              L.Clear;
              LineasNoSerializadas(L, 'ALB', QMCabecera.FieldByName('ID_S').AsInteger);
              if (L.Count > 0) then
                 raise Exception.Create(_('Faltan lineas por serializar') + #13#10 + _('Albaran') + ' ' + QMCabecera.FieldByName('EJERCICIO').AsString + '-' + QMCabecera.FieldByName('SERIE').AsString + '/' + QMCabecera.FieldByName('RIG').AsString + ' ' + #13#10 + L.Text);

              Next;
           end;
        finally
           L.Free;
        end;
     end;

     First;
  end;

  Titulo := format('%s_%d-%s-%.5d', [('Albaran'), QMCabecera.FieldByName('EJERCICIO').AsInteger, QMCabecera.FieldByName('SERIE').AsString, QMCabecera.FieldByName('RIG').AsInteger]);

  DMListados.Cargar(34, Serie);
  if (REntorno.TipoListado = 'FRF') then
  begin
     frAlbaranes.LoadFromFIB(REntorno.Formato, str);
     frAlbaranes.Title := Titulo;
     frAlbaranes.PrepareReport;
     case Modo of
        0: frAlbaranes.ShowPreparedReport;
        1: frAlbaranes.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end
  else if (REntorno.TipoListado = 'FR3') then
  begin
     frxAlbaranes.LoadFromFIB(REntorno.Formato, str);
     frxAlbaranes.ReportOptions.Name := Titulo;
     frxAlbaranes.PrepareReport;
     case Modo of
        0: frxAlbaranes.ShowPreparedReport;
        1: frxAlbaranes.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end
  else if (REntorno.TipoListado = 'HYR') then
  begin
     Pagina := 0;
     HYReport.LoadFromFIB(REntorno.Formato, str);
     HYReport.Prepare;
     case Modo of
        0: HYReport.Preview;
        1: for i := 1 to REntorno.Copias do
              HYReport.Print(REntorno.NombreMatricial);
     end;
  end;
  DMListados.LimpiaEntorno;
end;

procedure TDMLstAlbaranes.MostrarListado(const ID_S, RIG: integer; const Serie: string; Modo, Numero: byte; const Ejercicio: integer; aMarcarListado: boolean = True);
var
  Titulo, TituloCliente : string;
  Grupo : integer;
  Listado : smallint;
  L : TStrings;
begin
  // DMMain.Log('TFMAlbaranes.AInformeAlbaranExecute');
  L := TStringList.Create;
  try
     if (LeeParametro('ALBNSER001', Serie) = 'S') then
        LineasNoSerializadas(L, 'ALB', ID_S);

     if (L.Count > 0) then
        ShowMessage(_('Faltan lineas por serializar') + #13#10 + L.Text)
     else
     begin
        SerieGen := Serie;
        id_s_aux := id_s;
        SW := 1;

        MarcarListado := aMarcarListado;
        DMMain.LogIni('MostrarListado');
        try
           case Numero of
              1: Grupo := 34;
              2: Grupo := 113;
              3: Grupo := 114;
              4: Grupo := 115;
              5: Grupo := 162;
              6: Grupo := 652;
              else
                 Grupo := 34;
           end;

           DMMain.LogIni('QMCabecera.Open');
           with QMCabecera do
           begin
              Close;
              Params.ByName['ID_S'].AsInteger := ID_S;
              Open;
           end;
           DMMain.LogFin('QMCabecera.Open');

           xLotes.DataSource := DSDetalle;
           xNroSerie.DataSource := DSDetalle;

           // Si es una carta de portes, abro ADR.
           if (Numero in [5, 6]) then
           begin
              xLotes.DataSource := DSQMDetalleADR;
              xNroSerie.DataSource := DSQMDetalleADR;

              QMDetalleADR.Open;
              // Carta de porte especial para Químicas (ADR Quimicas Cuadrado)
              { TODO : Tratar de modificar el listado de Quimicas Cuadrado para poder quitar este DataSet. }
              QMDetallesPortesQui.Open;

              // Tantas copias como Palets o Bultos si Palets=0.
              xCopiasCartaPorte.Close;
              if (xCartaPortes.FieldByName('PALETS').AsInteger <> 0) then
                 xCopiasCartaPorte.Params.ByName['CANTIDAD'].AsInteger := xCartaPortes.FieldByName('PALETS').AsInteger
              else
                 xCopiasCartaPorte.Params.ByName['CANTIDAD'].AsInteger := xCartaPortes.FieldByName('BULTOS').AsInteger;
              xCopiasCartaPorte.Open;
           end;

           {Se llama a la funcion ObtenerListadoPerfil que comprueba si tiene algun listado
           o copias asignado para el perfil del cliente
           Solo si se selecciono el listado 1.
           3 - Albaranes a Clientes}

           DMMain.LogIni('ObtenerListadoPerfil');
           Listado := 0;
           if (Numero = 1) then
              Listado := DMListados.ObtenerListadoPerfil(xCliente.FieldByName('PERFIL').AsString, 3);
           DMMain.LogFin('ObtenerListadoPerfil');

           if ((DMListados.Copias <> REntorno.Copias) and (DMListados.Copias <> 0)) then
              REntorno.Copias := DMListados.Copias;

           if (Modo = 0) then
              REntorno.Copias := 1; {dji lrk kri - Si visualizo, solo una copia}

           DMMain.LogIni('Titulo');
           if (Numero = 1) then
              Titulo := _('Albaran')
           else
           if (Numero in [5, 6]) then
              Titulo := _('CartaPorte')
           else
           if (Numero <> 1) then
              Titulo := DameTituloListadoDefectoGrupo(Grupo);

           TituloCliente := '';
           if (LeeParametro('LSTALB0004') = 'S') then
           begin
              TituloCliente := '_' + LimpiaCadenaBasica(QMCabecera.FieldByName('TITULO').AsString);
              TituloCliente := StringReplace(TituloCliente, ' ', '_', [rfReplaceAll]);
           end;

           Titulo := format('%s_%d-%s-%.5d%s', [Titulo, QMCabecera.FieldByName('EJERCICIO').AsInteger, QMCabecera.FieldByName('SERIE').AsString, QMCabecera.FieldByName('RIG').AsInteger, TituloCliente]);

           DMMain.LogFin('Titulo');

           DMMain.LogIni('DMListados.Imprimir');
           DMListados.Imprimir(Grupo, Listado, Modo, Serie, Titulo, frAlbaranes, frxAlbaranes, HYReport, LimpiaNombreFichero(Titulo + '.pdf'));
           DMMain.LogFin('DMListados.Imprimir');
        finally
           MarcarListado := True;
           DMMain.LogFin('MostrarListado');
        end;
     end;
  finally
     L.Free;
  end;
end;

procedure TDMLstAlbaranes.frAlbaranesGetValue(const ParName: string; var ParValue: variant);
var
  s : string;
  strRIG : string;
  Cambio : extended;
  i : integer;
  GiroCliente, TituloGiroCliente : string;
begin
  DMListados.GetValue(ParName, ParValue);

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

  if QMCabecera.FieldByName('CLIENTE').AsInteger > -1 then //dji lrk kri
  begin
     if (ParName = '[DIRECCION]') or (ParName = '[CODIGO_POSTAL]') or
        (ParName = '[PROVINCIA]') or (ParName = '[PAIS]') then
     begin
        xDireccionFiscal.Close;
        xDireccionFiscal.Open;
     end;
     if (ParName = 'NIF') then
        ParValue := xCliente.FieldByName('NIF').AsString;
     if (ParName = 'NOMBRE') then
        ParValue := xCliente.FieldByName('TITULO').AsString;
     if (ParName = 'DIRECCION') then
        ParValue := xDireccionFiscal.FieldByName('DIRECCION').AsString;
     if (ParName = 'CODIGO_POSTAL') then
        ParValue := Copy(xDireccionFiscal.FieldByName('CODPOB').AsString, 1, 5);
     if (ParName = 'POBLACION') then
        ParValue := Copy(xDireccionFiscal.FieldByName('CODPOB').AsString, 6, 40);
     if (ParName = 'PROVINCIA') then
        ParValue := xDireccionFiscal.FieldByName('PROVINCIA').AsString;
     if (ParName = 'PAIS') then
        ParValue := xDireccionFiscal.FieldByName('PAIS').AsString;
  end;

  if ParName = 'Albaran' then
  begin
     ParValue := QMCabecera.FieldByName('RIG').AsInteger;

     // Refrescar la Doble Cabecera
     with DobleCabecera do
     begin
        Close;
        Params.ByName['ID_S'].AsInteger := QMCabecera.FieldByName('ID_S').AsInteger;
        Open;
     end;

     // Actualizar las máscaras para el albarán actual
     LocalMascaraN := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 1);
     LocalMascaraL := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 0);

     // Se comprueba la segunda moneda emplear
     if (QMCabecera.FieldByName('MONEDA').AsString = REntorno.Moneda) then
        Moneda_Sec := REntorno.Moneda_Sec
     else
        Moneda_Sec := REntorno.Moneda;

     LocalMascaraNSec := DMMain.MascaraMoneda(Moneda_Sec, 1);

     // Inicializamos el subtotal
     subtotal := 0;

     // Obtener Porcentajes de IVA y de RE Únicos (Doble Cabecera)
     P_IvaUnico := 0;
     P_REUnico := 0;
     if QMDetalle.RecordCount > 0 then
     begin
        P_IvaUnico := QMDetalle.FieldByName('P_IVA').AsFloat;
        P_REUnico := QMDetalle.FieldByName('P_RECARGO').AsFloat;
     end;
  end;

  if ParName = 'Subtotal' then
     ParValue := subtotal;

  // IVA y RE Único

  if ParName = 'P_IvaUnico' then
     ParValue := P_IvaUnico;
  if ParName = 'P_REUnico' then
     ParValue := P_REUnico;

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
     //Sin Formato, para poder utilizarlo en cálculos internos del listado
  begin
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        ParValue := ' '
     else
     begin
        if (DMMain.DamePVPPorUdSecundaria(QMDetalle.FieldByName('ID_A').AsInteger) and REntorno.PVP_Ud_Sec) then
           ParValue := QMDetalle.FieldByName('UNIDADES_SEC').AsFloat
        else
           ParValue := QMDetalle.FieldByName('UNIDADES').AsFloat;
     end;
  end;

  if ParName = 'DirCompleta' then
  begin
     ParValue := '';
     with QDirCompleta do
     begin
        Close;
        Params.ByName['TERCERO'].AsInteger := xCliente.FieldByName('TERCERO').AsInteger;
        ExecQuery;
        ParValue := FieldByName['DIR_COMPLETA'].AsString;
        FreeHandle;
     end;
  end;

  if ParName = 'Direccion2' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT DIR_NOMBRE_2 FROM SYS_TERCEROS_DIRECCIONES WHERE TERCERO = :TERCERO';
           Params.ByName['TERCERO'].AsInteger := xCliente.FieldByName('TERCERO').AsInteger;
           ExecQuery;
           ParValue := FieldByName['DIR_NOMBRE_2'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'Total_AlbaranE' then
     if (QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
        ParValue := QMCabecera.FieldByName('TOTAL_A_COBRAR').Value * QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat
     else
     begin
        with SPDame_Factor do
        begin
           Close;
           Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabecera.FieldByName('EJERCICIO').AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabecera.FieldByName('CANAL').AsInteger;
           Params.ByName['FECHA'].AsDateTime := QMCabecera.FieldByName('FECHA').AsDateTime;
           ExecQuery;
           if (FieldByName['FACTOR'].AsFloat <> 0) then
              ParValue := QMCabecera.FieldByName('TOTAL_A_COBRAR').Value / FieldByName['FACTOR'].AsFloat
           else
              ParValue := QMCabecera.FieldByName('TOTAL_A_COBRAR').Value;
           FreeHandle;
        end;
     end;

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

  if ParName = 'Moneda_Sec' then
     ParValue := Moneda_Sec;

  if ParName = 'Pedido_Oferta' then
  begin
     GetProcedencia(TipoDoc, strRIG);
     ParValue := strRIG;
  end;

  if ParName = 'Procedencia' then
     if QSPProcedencia.FieldByName('TIPO_O').AsString = 'PEC' then
        ParValue := Format(_('Pedido: %d Linea: %d Fecha: %s'), [QSPProcedencia.FieldByName('RIG_O').AsInteger, QSPProcedencia.FieldByName('LINEA_O').AsInteger, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)])
     else
        ParValue := Format(_('Oferta: %d Linea: %d Fecha: %s'), [QSPProcedencia.FieldByName('RIG_O').AsInteger, QSPProcedencia.FieldByName('LINEA_O').AsInteger, DateToStr(QSPProcedencia.FieldByName('FECHA').AsDateTime)]);

  // Para que no la muestre por artículo, sino por procedencia.
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

  if ParName = 'Proc' then
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

  if ParName = 'PieVisible' then
     if ((not QMCabecera.EOF) and (DobleCabecera.Active) and (QMCabecera.FieldByName('ID_S').AsInteger = DobleCabecera.FieldByName('ID_S').AsInteger)) then
        ParValue := 0
     else
        ParValue := 1;

  if ParName = 'TotalEuros' then  //Esta opción se deja por si alguien lo utiliza
  begin
     Cambio := 0;
     if (DobleCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
        Cambio := 1 / DobleCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;

     ParValue := DMMain.DameCambio(True, DobleCabecera.FieldByName('MONEDA').AsString, 'EUR', DobleCabecera.FieldByName('FECHA').AsDateTime, DobleCabecera.FieldByName('TOTAL_A_COBRAR').AsFloat, Cambio);
  end;

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

  if ParName = 'TotalMonSec' then
  begin
     Cambio := 0;
     if (DobleCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
        Cambio := 1 / DobleCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;

     ParValue := DMMain.DameCambio(True, DobleCabecera.FieldByName('MONEDA').AsString, Moneda_Sec, DobleCabecera.FieldByName('FECHA').AsDateTime, DobleCabecera.FieldByName('TOTAL_A_COBRAR').AsFloat, Cambio);
  end;

  if ParName = 'PrecioUdPtoVerde' then
  begin
     with QMDetalle do
        ParValue := DamePrecioUdPtoVerde(FieldByName('EMPRESA').AsInteger, FieldByName('EJERCICIO').AsInteger, FieldByName('CANAL').AsInteger, FieldByName('ARTICULO').AsString);

     with QMCabecera do
        ParValue := DMMain.DameCambio(False, REntorno.Moneda, FieldByName('MONEDA').AsString, FieldByName('FECHA').AsDateTime, ParValue, FieldByName('VALOR_CAMB_FIJO').AsFloat);
  end;

  if ParName = 'OrigenDestino' then
     ParValue := DMListados.OrigenesDestinos(DobleCabecera.FieldByName('ID_S').AsInteger, 'PEC');

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
        if (xArticulosPRM.FieldByName('PVP_POR_UD_SECUNDARIA').AsInteger <> 0) then
           ParValue := TrimRight(FormatFloat(MascaraI, QMPromociones.FieldByName('UNIDADES_SEC').AsFloat) +
              ' ' + DMMain.DameSignoUnidadArticulo(QMPromociones.FieldByName('ARTICULO').AsString))
        else
           ParValue := TrimRight(FormatFloat(MascaraI,
              QMPromociones.FieldByName('UNIDADES').AsFloat) + ' ' + DMMain.DameSignoUnidadArticulo(QMPromociones.FieldByName('ARTICULO').AsString));
     end;
  end;

  if ParName = 'DetalleVisible' then
     ParValue := not (QMDetalle.EOF);

  if ParName = 'PrecioUdPtoVerdePRM' then
  begin
     with QMPromociones do
        ParValue := DamePrecioUdPtoVerde(FieldByName('EMPRESA').AsInteger, FieldByName('EJERCICIO').AsInteger, FieldByName('CANAL').AsInteger, FieldByName('ARTICULO').AsString);
  end;

  if ParName = 'UnidadesSF_PRM' then
  begin
     if ((QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMPromociones.FieldByName('UNIDADES').AsFloat = 0)) then
        ParValue := ' '
     else
     begin
        if (DMMain.DamePVPPorUdSecundaria(QMPromociones.FieldByName('ID_A').AsInteger) and REntorno.PVP_Ud_Sec) then
           ParValue := QMPromociones.FieldByName('UNIDADES_SEC').AsFloat
        else
           ParValue := QMPromociones.FieldByName('UNIDADES').AsFloat;
     end;
  end;

  if ParName = 'NombreUsuarioKri' then {dji lrk kri}
     ParValue := DameNombreCorreoUsuario(DameUsuarioSegunEntrada(QMCabecera.FieldByName('ENTRADA').AsInteger));

  if (ParName = 'NombreUsuarioCreacion') then
     ParValue := DameTituloUsuario(QMCabecera.FieldByName('USUARIO_CREACION').AsInteger);

  if (ParName = 'DblNombreUsuarioCreacion') then
     ParValue := DameTituloUsuario(DobleCabecera.FieldByName('USUARIO_CREACION').AsInteger);

  if ParName = 'NroSerie' then
     ParValue := nro_serie;

  if ParName = 'Letras' then
  begin
     Letras.Numero := QMCabecera.FieldByName('TOTAL_A_COBRAR').AsFloat;
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := QMCabecera.FieldByName('MONEDA').AsString;
        Open;
        Letras.Moneda := LowerCase(xMonedas.FieldByName('TITULO').AsString);
        Letras.GeneroMasculino := (xMonedas.FieldByName('GENERO_MASCULINO').AsInteger = 1);
        Letras.Decimales := xMonedas.FieldByName('DEC_VER').AsInteger;
        Letras.DescDecimales := xMonedas.FieldByName('DESC_DECIMALES').AsString;
        if (Letras.Decimales = 2) then
           ParValue := Letras.AsString
        else
           ParValue := Letras.AsString + ' ' + Letras.Moneda;
     end;
  end;

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

procedure TDMLstAlbaranes.frAlbaranesEnterRect(Memo: TStringList; View: TfrView);
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
     begin
        Memo[0] := ric.Strings[I];
        //Notas:=True;
     end
     else
     begin
        //Notas:=False;
     end;

     if Memo[0] = '[NotasCabecera]' then
        Memo[0] := NotasCab.Strings[indNotas];

     if Memo[0] = 'CANTIDADES' then
        SW := 1;

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
              View.Parent.dy := 0
           else
           begin
              View.Parent.dy := 34;
              View.Visible := True;
           end;
        end;
     end;

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
     if (Pos('[MascaraNSec]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraNSec;
     if (Pos('[MascaraE]', Memo[0]) > 0) then
        View.FormatStr := '###,###,##0.00';

     if (Pos('[MascaraP]', Memo[0]) > 0) then
        if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
           (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
           Memo[0] := ''
        else
           View.FormatStr := MascaraP;

     if (Pos('[MascaraL]', Memo[0]) > 0) then
        if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
           (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
           Memo[0] := ''
        else
           View.FormatStr := LocalMascaraL;

     if (Memo[0] = '[ImgArticulo]') and (View is TfrPictureView) then
        DMListados.MostrarImagen(xArticulos.FieldByName('IMAGEN').AsInteger, View);

     if (Memo[0] = '[ImgArticuloPRM]') and (View is TfrPictureView) then
        DMListados.MostrarImagen(DameImagenArtPromo, View);

     if (Memo[0] = '[ImgDetalle]') and (View is TfrPictureView) then
        DMListados.MostrarImagen(QMDetalle.FieldByName('ID_IMAGEN').AsInteger, View);

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

     if Memo[0] = '[NotasArtPRM]' then
     begin
        Memo[0] := ric_prm.Strings[x];
     end;
  end;
end;

procedure TDMLstAlbaranes.frUDNotasArtCheckEOF(Sender: TObject; var EOF: boolean);
begin
  EOF := (ric.Count = i);
end;

procedure TDMLstAlbaranes.frUDNotasArtFirst(Sender: TObject);
begin
  i := 0;
end;

procedure TDMLstAlbaranes.frUDNotasArtNext(Sender: TObject);
begin
  i := i + 1;
end;

procedure TDMLstAlbaranes.QMDetalleAfterScroll(DataSet: TDataSet);
begin
  {QSPProcedencia.Close;
  QSPProcedencia.Open;
  xArticulos.Close;
  xArticulos.Open;}
  nro_serie := '';
  QNroSerieKri.Close;
  QNroSerieKri.Params.ByName['RIG'].AsInteger := QMDetalle.FieldByName('RIG').AsInteger;
  QNroSerieKri.Params.ByName['LINEA'].AsInteger := QMDetalle.FieldByName('LINEA').AsInteger;
  QNroSerieKri.Open;

  QLoteKri.Close;
  QLoteKri.Params.ByName['RIG'].AsInteger := QMDetalle.FieldByName('RIG').AsInteger;
  QLoteKri.Params.ByName['LINEA'].AsInteger := QMDetalle.FieldByName('LINEA').AsInteger;
  QLoteKri.Open;
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
        ric.Insert(0, _('Nro. de Serie') + ': ' + nro_serie);

     while (not QLoteKri.EOF) do
     begin
        if (QLoteKri.FieldByName('LOTE').AsString <> '') then
        begin
           ric.Insert(0, _('Lote') + ': ' + QLoteKri.FieldByName('LOTE').AsString + ' ' + _('Caducidad') + ': ' +
              QLoteKri.FieldByName('CADUCIDAD').AsString + ' x ' + QLoteKri.FieldByName('COUNT').AsString);

           if (Length(nro_serie) > 0) then
              nro_serie := nro_serie + #13;
           nro_serie := nro_serie + _('Lote') + ': ' + QLoteKri.FieldByName('LOTE').AsString + ' ' + _('Caducidad') + ': ' +
              QLoteKri.FieldByName('CADUCIDAD').AsString + ' x ' + QLoteKri.FieldByName('COUNT').AsString;
        end;

        QLoteKri.Next;
     end;
  end;

  //if QMDetalle.Eof then QMDetalle.Close;
end;

procedure TDMLstAlbaranes.QMCabeceraAfterScroll(DataSet: TDataSet);
var
  id_s_cab, Empresa, Ejercicio, Canal, Rig : integer;
  Serie, Tipo : string;
  DatosBancarios : char;
  BancoPagos, BancoFP : integer;
begin
  xDireccionesNIF.Close;
  xDireccionesNIF.Open;
  QMCabeceraEDI.Close;
  QMCabeceraEDI.Open;

  with QMCabecera do
  begin
     if ((RecordCount > 0) and (NotasCab <> nil)) then
        NotasCab.Assign(FieldByName('NOTAS'));

     // Filtro los recibos relacionados con este documento (anticipos)
     DMRecibosFactura.Mostrar(FieldByName('SERIE').AsString, FieldByName('TIPO').AsString, FieldByName('RIG').AsInteger, FieldByName('EJERCICIO').AsInteger);

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
  end;

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

  with THYFIBQuery.Create(nil) do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Add(' SELECT CAB.ID_S, REL.O_EMPRESA, REL.O_EJERCICIO, REL.O_CANAL, REL.O_SERIE, REL.O_TIPO, REL.O_RIG ');
     SQL.Add(' FROM GES_CABECERAS_RELACIONES REL ');
     SQL.Add(' JOIN GES_CABECERAS_S CAB ON ');
     SQL.Add(' CAB.EMPRESA = REL.O_EMPRESA AND ');
     SQL.Add(' CAB.EJERCICIO = REL.O_EJERCICIO AND ');
     SQL.Add(' CAB.CANAL = REL.O_CANAL AND ');
     SQL.Add(' CAB.SERIE = REL.O_SERIE AND ');
     SQL.Add(' CAB.TIPO = REL.O_TIPO AND ');
     SQL.Add(' CAB.RIG = REL.O_RIG ');
     SQL.Add(' WHERE ');
     SQL.Add(' REL.D_EMPRESA = ?D_EMPRESA AND ');
     SQL.Add(' REL.D_EJERCICIO = ?D_EJERCICIO AND ');
     SQL.Add(' REL.D_CANAL = ?D_CANAL AND ');
     SQL.Add(' REL.D_SERIE = ?D_SERIE AND ');
     SQL.Add(' REL.D_TIPO = ?D_TIPO AND ');
     SQL.Add(' REL.D_RIG = ?D_RIG ');
     Params.ByName['D_EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
     Params.ByName['D_EJERCICIO'].AsInteger := QMCabecera.FieldByName('EJERCICIO').AsInteger;
     Params.ByName['D_CANAL'].AsInteger := QMCabecera.FieldByName('CANAL').AsInteger;
     Params.ByName['D_SERIE'].AsString := QMCabecera.FieldByName('SERIE').AsString;
     Params.ByName['D_TIPO'].AsString := QMCabecera.FieldByName('TIPO').AsString;
     Params.ByName['D_RIG'].AsInteger := QMCabecera.FieldByName('RIG').AsInteger;
     ExecQuery;
     id_s_cab := FieldByName['ID_S'].AsInteger;
     Empresa := FieldByName['O_EMPRESA'].AsInteger;
     Ejercicio := FieldByName['O_EJERCICIO'].AsInteger;
     Canal := FieldByName['O_CANAL'].AsInteger;
     Serie := FieldByName['O_SERIE'].AsString;
     Tipo := FieldByName['O_TIPO'].AsString;
     Rig := FieldByName['O_RIG'].AsInteger;
     FreeHandle;
     Free;
  end;

  if ((Tipo <> 'OFC') and (Tipo > '')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT CAB.ID_S, CAB.TIPO FROM GES_CABECERAS_RELACIONES REL ');
        SQL.Add(' JOIN GES_CABECERAS_S CAB ON ');
        SQL.Add(' CAB.EMPRESA = REL.O_EMPRESA AND ');
        SQL.Add(' CAB.EJERCICIO = REL.O_EJERCICIO AND ');
        SQL.Add(' CAB.CANAL = REL.O_CANAL AND ');
        SQL.Add(' CAB.SERIE = REL.O_SERIE AND ');
        SQL.Add(' CAB.TIPO = REL.O_TIPO AND ');
        SQL.Add(' CAB.RIG = REL.O_RIG ');
        SQL.Add(' WHERE ');
        SQL.Add(' REL.D_EMPRESA = ?D_EMPRESA AND ');
        SQL.Add(' REL.D_EJERCICIO = ?D_EJERCICIO AND ');
        SQL.Add(' REL.D_CANAL = ?D_CANAL AND ');
        SQL.Add(' REL.D_SERIE = ?D_SERIE AND ');
        SQL.Add(' REL.D_TIPO = ?D_TIPO AND ');
        SQL.Add(' REL.D_RIG = ?D_RIG ');
        Params.ByName['D_EMPRESA'].AsInteger := Empresa;
        Params.ByName['D_EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['D_CANAL'].AsInteger := Canal;
        Params.ByName['D_SERIE'].AsString := Serie;
        Params.ByName['D_TIPO'].AsString := Tipo;
        Params.ByName['D_RIG'].AsInteger := Rig;
        ExecQuery;
        id_s_cab := FieldByName['ID_S'].AsInteger;
        Tipo := FieldByName['TIPO'].AsString;
        FreeHandle;
        Free;
     end;
  end;

  xGarantiasKri.Close;
  xGarantiasKri.Params.ByName['ID_S'].AsInteger := id_s_cab;
  xGarantiasKri.Open;
end;

procedure TDMLstAlbaranes.xClienteAfterScroll(DataSet: TDataSet);
begin
  with xDireccion_Cliente do
  begin
     Close;
     Params.ByName['Tercero'].AsInteger := xCliente.FieldByName('TERCERO').AsInteger;
     Params.ByName['Direccion'].AsInteger := QMCabecera.FieldByName('DIRECCION').AsInteger;
     Open;
  end;

  with xDireccionKRI do
  begin
     Close;
     Params.ByName['Tercero'].AsInteger := xCliente.FieldByName('TERCERO').AsInteger;
     Params.ByName['Direccion'].AsInteger := QMCabecera.FieldByName('DIRECCION').AsInteger;
     Open;
  end;

  with xDireccionFiscal do
  begin
     Close;
     Params.ByName['Tercero'].AsInteger := xCliente.FieldByName('TERCERO').AsInteger;
     Open;
  end;

  with xDireccionCliente do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := xCliente.FieldByName('TERCERO').AsInteger;
     Open;
  end;
end;

procedure TDMLstAlbaranes.HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
var
  strTotal : string;
  AplicarPuntoVerde : boolean;
  pto_verde : double;
  cambio : extended;
begin
  // CABECERA

  if Source = '[EMPRESA]' then
     Source := REntorno.NombreEmpresa;

  if Source = '[NIF_EMPRESA]' then
     Source := REntorno.CifEmpresa;

  if Source = '[DIR_EMPRESA]' then
     Source := REntorno.DirEmpresa + #13#10 + REntorno.PobEmpresa + ' (' +
        REntorno.ProvEmpresa + ' - ' + REntorno.Pais + ')';

  if Source = '[TELF_EMPRESA]' then
     Source := REntorno.Tel1Empresa;

  if (QMCabecera.FieldByName('CLIENTE').AsInteger <= -1) then
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
        Source := '';
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
     if (Source = '[DIRECCION]') or (Source = '[CODIGO_POSTAL]') or
        (Source = '[PROVINCIA]') or (Source = '[PAIS]') then
     begin
        xDireccionFiscal.Close;
        xDireccionFiscal.Open;
     end;
     if (Source = '[NIF]') then
        Source := xCliente.FieldByName('NIF').AsString;
     if (Source = '[NOMBRE]') then
        Source := xCliente.FieldByName('TITULO').AsString;
     if (Source = '[DIRECCION]') then
        Source := xDireccionFiscal.FieldByName('DIRECCION').AsString;
     if (Source = '[CODIGO_POSTAL]') then
        Source := Copy(xDireccionFiscal.FieldByName('CODPOB').AsString, 1, 5);
     if (Source = '[POBLACION]') then
        Source := Copy(xDireccionFiscal.FieldByName('CODPOB').AsString, 6, 40);
     if (Source = '[PROVINCIA]') then
        Source := xDireccionFiscal.FieldByName('PROVINCIA').AsString;
     if (Source = '[PAIS]') then
        Source := xDireccionFiscal.FieldByName('PAIS').AsString;
  end;

  if Source = '[DIR_CLIENTE]' then
  begin
     xDireccionFiscal.Close;
     xDireccionFiscal.Open;
     Source := xDireccionFiscal.FieldByName('DIRECCION').AsString +
        #13#10 + xDireccionFiscal.FieldByName('CODPOB').AsString + ' (' +
        xDireccionFiscal.FieldByName('PROVINCIA').AsString + ' - ' +
        xDireccionFiscal.FieldByName('PAIS').AsString + ')';
  end;

  if Source = '[CUENTA]' then
  begin
     Source := xCuenta.FieldByName('CUENTA').AsString;
  end;

  if Source = '[POB_PROV_CLI]' then
  begin
     Source := xDireccion_Cliente.FieldByName('CODPOB').AsString;
  end;

  if Source = '[COD_CLI]' then
     Source := '(' + Trim(xCliente.FieldByName('CLIENTE').AsString) + ')';

  if Source = '[CUENTA_CLI]' then
     Source := '(' + Trim(xCuenta.FieldByName('CUENTA').AsString) + ')';

  if Source = '[FECHA_CABECERA]' then
     Source := FormatDateTime(ShortDateFormat, QMCabecera.FieldByName('FECHA').AsDateTime);

  if Source = '[PAGINA]' then
  begin
     Pagina := Pagina + 1;
     Source := IntToStr(Pagina);
  end;

  if Source = '[PEDIDO]' then
  begin
     Source := DameHerencia('PEC');
  end;

  if Source = '[FECHA_PEDIDO]' then
     Source := DateToStr(DameFechaHerencia('PEC'));

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

        // Actualizar las máscaras para el albaran actual
        LocalMascaraN := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 1);
        LocalMascaraL := DMMain.MascaraMoneda(QMCabecera.FieldByName('MONEDA').AsString, 0);

        // Se comprueba la segunda moneda emplear
        if (QMCabecera.FieldByName('MONEDA').AsString = REntorno.Moneda) then
           Moneda_Sec := REntorno.Moneda_Sec
        else
           Moneda_Sec := REntorno.Moneda;

        LocalMascaraNSec := DMMain.MascaraMoneda(Moneda_Sec, 1);
     end;

  // Activamos el IVA para un albarán con 2 páginas.
  if Source = '[ACTIVA_IVA]' then
  begin
     xDobleIva.Close;
     xDobleIva.Open;
     Source := '';
     IVA := 1;
  end;

  if Source = '[NEXT_IVA]' then
  begin
     IVA := IVA + 1;
     xDobleIva.Next;
     if IVA > xDobleIva.RecordCount then
        IVA := -100;
     Source := ' ';
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

  if Source = '[DTO]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FloatToStr(QMDetalle.FieldByName('DESCUENTO').AsFloat);

  if Source = '[DTO2]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FloatToStr(QMDetalle.FieldByName('DESCUENTO_2').AsFloat);

  if Source = '[DTO3]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FloatToStr(QMDetalle.FieldByName('DESCUENTO_3').AsFloat);

  if Source = '[DTO_VACIO]' then
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else if QMDetalle.FieldByName('DESCUENTO').AsFloat <> 0 then
        Source := FloatToStr(QMDetalle.FieldByName('DESCUENTO').AsFloat)
     else
        Source := ' ';

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

  // DETALLE IVA

  if Source = '[S_BASES_IVA]' then
     Source := FormatFloat(LocalMascaraN, xDatosIva.FieldByName('S_BASES').AsFloat);

  if Source = '[I_IVA]' then
     Source := FormatFloat(LocalMascaraN, xDatosIva.FieldByName('I_IVA').AsFloat);

  if Source = '[I_RE]' then
     Source := FormatFloat(LocalMascaraN, xDatosIva.FieldByName('I_RE').AsFloat);

  if Source = '[TITULO_IVA]' then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT TITULO FROM SYS_TIPO_IVA WHERE PAIS = :PAIS AND TIPO = TIPO';
           Params.ByName['PAIS'].AsString := REntorno.Pais;
           Params.ByName['TIPO'].AsInteger := xDatosIva.FieldByName('TIPO_IVA').AsInteger;
           ExecQuery;
           Source := FieldByName['TITULO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  {  if Source='[TOTAL_LINEA]' then
    if ( (QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
         (QMDetalle.FieldByName('UNIDADES').AsFloat = 0) )then
      Source := ' '
    else
      Source := FormatFloat(LocalMascaraL,(QMDetalle.FieldByName('B_DTO_LINEA').AsFloat+QMDetalle.FieldByName('C_IVA').AsFloat));}

  if Source = '[TOTAL_LINEA]' then
     Source := FormatFloat(LocalMascaraL, (QMDetalle.FieldByName('B_DTO_LINEA').AsFloat +
        QMDetalle.FieldByName('C_IVA').AsFloat));

  // cálculo del punto verde
  if Source = '[PRECIOUD]' then
  begin
     //Sin Formato, para poder utilizarlo en cálculos internos del listado
     if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT APLICAR_PTO_VERDE FROM EMP_CLIENTES WHERE EMPRESA = :EMPRESA AND CLIENTE = :CLIENTE';
              Params.ByName['EMPRESA'].AsInteger := QMDetalle.FieldByName('EMPRESA').AsInteger;
              Params.ByName['CLIENTE'].AsInteger := QMCabecera.FieldByName('CLIENTE').AsInteger;
              ExecQuery;
              AplicarPuntoVerde := (FieldByName['APLICAR_PTO_VERDE'].AsInteger = 1);
              FreeHandle;
           finally
              Free;
           end;
        end;

        if AplicarPuntoVerde then
        begin
           with QMDetalle do
              pto_verde := DamePrecioUdPtoVerde(FieldByName('EMPRESA').AsInteger, FieldByName('EJERCICIO').AsInteger, FieldByName('CANAL').AsInteger, FieldByName('ARTICULO').AsString);
        end
        else
           pto_verde := 0;


        if (DMMain.DamePVPPorUdSecundaria(QMDetalle.FieldByName('ID_A').AsInteger) and REntorno.PVP_Ud_Sec) then
           precioverdeln := pto_verde * QMDetalle.FieldByName('UNIDADES_SEC').AsFloat
        else
           precioverdeln := pto_verde * QMDetalle.FieldByName('UNIDADES').AsFloat;

        Pto_Verde := DMMain.DameCambio(False, REntorno.Moneda, QMCabecera.FieldByName('MONEDA').AsString, QMCabecera.FieldByName('FECHA').AsDateTime, pto_verde, QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat);

        //calculo del precio por unidad
        pto_verde := QMDetalle.FieldByName('PRECIO').AsFloat - pto_verde;
        Source := FloatToStr(pto_verde);

        //para totalizar el punto verde
        totalptoverde := totalptoverde + precioverdeln;
     end;
  end;

  if Source = '[PRECIOVERDELN]' then
     Source := FloatToStr(DMMain.DameCambio(False, REntorno.Moneda, QMCabecera.FieldByName('MONEDA').AsString, QMCabecera.FieldByName('FECHA').AsDateTime, precioverdeln, QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat));

  // TOTALES

  if Source = '[TOTAL_ALB_AJUST]' then
  begin
     Pagina := 0;
     strTotal := FormatFloat(MascaraI, QMCabecera.FieldByName('TOTAL_A_COBRAR').AsFloat);
     RellenarArteriscos(strTotal, 14);
     Source := strTotal;
  end;

  if Source = '[TOTAL_A_COBRAR]' then
     Source := FormatFloat(LocalMascaraN, QMCabecera.FieldByName('TOTAL_A_COBRAR').AsFloat);

  if Source = '[TOTAL_EUROS]' then
  begin
     cambio := 0;
     if (QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
        cambio := 1 / QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;

     if (QMCabecera.FieldByName('MONEDA').AsString = 'EUR') then
        Source := ' '
     else
        Source := FormatFloat(MascaraE, DMMain.DameCambio(True, QMCabecera.FieldByName('MONEDA').AsString, 'EUR', QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('TOTAL_A_COBRAR').AsFloat, Cambio));
  end;

  if Source = '[MONEDA]' then
     with xMonedas do
     begin
        Close;
        Params.ByName['MONEDA'].AsString := QMCabecera.FieldByName('MONEDA').AsString;
        Open;
        Source := _('Moneda') + ': ' + xMonedas.FieldByName('TITULO').AsString;
     end;

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

  if Source = '[TOTAL_BRUTO]' then
     Source := FormatFloat(LocalMascaraN, (DobleCabecera.FieldByName('B_COMISION').AsFloat));

  if Source = '[TOTAL_P_COMERCIAL]' then
     Source := DobleCabecera.FieldByName('DTO_CIAL').AsString;

  if Source = '[TOTAL_I_COMERCIAL]' then
     Source := FormatFloat(LocalMascaraN, (DobleCabecera.FieldByName('I_DTO_CIAL').AsFloat));

  if Source = '[DOBLE_P_PP]' then
  begin
     if (IVA > 0) then
        Source := xDobleIVA.FieldByName('DTO_PP').AsString
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
           xDobleIva.FieldByName('S_BASES_DTO').AsFloat) // xDobleIVA.FieldByName('S_BASES').AsFloat
     else
        Source := '';
  end;

  if Source = '[DOBLE_P_IVA]' then
  begin
     if (IVA > 0) then
        Source := xDobleIVA.FieldByName('P_IVA').AsString
     else
        Source := '';
  end;
  if Source = '[DOBLE_I_IVA]' then
  begin
     if (IVA > 0) then
        Source := FormatFloat(LocalMascaraN, xDobleIVA.FieldByName('I_IVA').AsFloat)
     else
        Source := '';
  end;

  if Source = '[TOT_COBRAR]' then
     Source := FormatFloat(LocalMascaraN, DobleCabecera.FieldByName('TOTAL_A_COBRAR').AsFloat);

  if Source = '[I_TOTALMONSEC]' then
  begin
     {cambio := 0;
     if (QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
        cambio := 1 / QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;}

     if (QMCabecera.FieldByName('MONEDA').AsString <> Moneda_Sec) then
        Source := FormatFloat(LocalMascaraNSec, DMMain.DameCambio(True, QMCabecera.FieldByName('MONEDA').AsString, Moneda_Sec, QMCabecera.FieldByName('FECHA').AsDateTime, QMCabecera.FieldByName('TOTAL_A_COBRAR').AsFloat, QMCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat))
     else
        Source := ' ';
  end;

  if Source = '[DOBLE_I_TOTALMONSEC]' then
  begin
     cambio := 0;
     if (DobleCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
        cambio := 1 / DobleCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;

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

  if Source = '[TOTALPTOVERDE]' then
  begin
     cambio := 0;
     if (DobleCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat <> 0) then
        cambio := 1 / DobleCabecera.FieldByName('VALOR_CAMB_FIJO').AsFloat;

     Source := FormatFloat(LocalMascaraN, DMMain.DameCambio(True, DobleCabecera.FieldByName('MONEDA').AsString, Moneda_Sec, DobleCabecera.FieldByName('FECHA').AsDateTime, totalptoverde, Cambio));
  end;

  if Source = ' ' then
     Source := '';

  //Promociones
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

  if Source = '[DTO_PRM]' then
     if ((QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMPromociones.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FloatToStr(QMPromociones.FieldByName('DESCUENTO').AsFloat);

  if Source = '[B_DTO_LINEA_PRM]' then
     if ((QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMPromociones.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
        Source := FormatFloat(LocalMascaraL, QMPromociones.FieldByName('B_DTO_LINEA').AsFloat);

  if Source = '[TOTAL_LINEA_PRM]' then
     Source := FormatFloat(LocalMascaraL, (QMPromociones.FieldByName('B_DTO_LINEA').AsFloat +
        QMPromociones.FieldByName('C_IVA').AsFloat));

  if Source = '[PRECIOUD_PRM]' then
  begin
     //Sin Formato, para poder utilizarlo en cálculos internos del listado
     if ((QMPromociones.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
        (QMPromociones.FieldByName('UNIDADES').AsFloat = 0)) then
        Source := ' '
     else
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT APLICAR_PTO_VERDE FROM EMP_CLIENTES WHERE EMPRESA = :EMPRESA AND CLIENTE = :CLIENTE';
              Params.ByName['EMPRESA'].AsInteger := QMPromociones.FieldByName('EMPRESA').AsInteger;
              Params.ByName['CLIENTE'].AsInteger := QMCabecera.FieldByName('CLIENTE').AsInteger;
              ExecQuery;
              AplicarPuntoVerde := (FieldByName['APLICAR_PTO_VERDE'].AsInteger = 1);
              FreeHandle;
           finally
              Free;
           end;
        end;

        if AplicarPuntoVerde then
        begin
           with QMPromociones do
              pto_verde := DamePrecioUdPtoVerde(FieldByName('EMPRESA').AsInteger, FieldByName('EJERCICIO').AsInteger, FieldByName('CANAL').AsInteger, FieldByName('ARTICULO').AsString);
        end
        else
           pto_verde := 0;


        if (DMMain.DamePVPPorUdSecundaria(QMPromociones.FieldByName('ID_A').AsInteger) and REntorno.PVP_Ud_Sec) then
           precioverdeln := pto_verde * QMPromociones.FieldByName('UNIDADES_SEC').AsFloat
        else
           precioverdeln := pto_verde * QMPromociones.FieldByName('UNIDADES').AsFloat;

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

procedure TDMLstAlbaranes.GetProcedencia(var Tipo, strRIG: string);
var
  RIG : integer;
begin
  with QProcedenciaUnica do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMDetalle.FieldByName('EMPRESA').AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMDetalle.FieldByName('EJERCICIO').AsInteger;
     Params.ByName['CANAL'].AsInteger := QMDetalle.FieldByName('CANAL').AsInteger;
     Params.ByName['SERIE'].AsString := QMDetalle.FieldByName('SERIE').AsString;
     Params.ByName['TIPO'].AsString := QMDetalle.FieldByName('TIPO').AsString;
     Params.ByName['RIG'].AsInteger := QMDetalle.FieldByName('RIG').AsInteger;
     ExecQuery;
     Tipo := FieldByName['O_TIPO'].AsString;
     RIG := FieldByName['O_RIG'].AsInteger;
     FreeHandle;
  end;

  if (RIG <> 0) then
     strRIG := IntToStr(RIG)
  else
     strRIG := ' ';
end;

procedure TDMLstAlbaranes.frAlbaranesBeginDoc;
begin
  TipoDoc := '';  // Tipo de Documento
end;

procedure TDMLstAlbaranes.frUserNotasCabCheckEOF(Sender: TObject; var EOF: boolean);
begin
  EOF := (NotasCab.Count = indNotas);
end;

procedure TDMLstAlbaranes.frUserNotasCabFirst(Sender: TObject);
begin
  indNotas := 0;
end;

procedure TDMLstAlbaranes.frUserNotasCabNext(Sender: TObject);
begin
  indNotas := indNotas + 1;
end;

function TDMLstAlbaranes.DameHerencia(DTipo: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(RRIG) FROM G_RELACIONES_ORIGENES(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG) WHERE RTIPO = ?D_TIPO';
        Params.ByName['EMPRESA'].AsInteger := QMCabecera.FieldByName('EMPRESA').AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCabecera.FieldByName('EJERCICIO').AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabecera.FieldByName('CANAL').AsInteger;
        Params.ByName['SERIE'].AsString := QMCabecera.FieldByName('SERIE').AsString;
        Params.ByName['TIPO'].AsString := QMCabecera.FieldByName('TIPO').AsString;
        Params.ByName['RIG'].AsInteger := QMCabecera.FieldByName('RIG').AsInteger;
        Params.ByName['D_TIPO'].AsString := DTipo;
        ExecQuery;
        Result := FieldByName['MIN'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMLstAlbaranes.DameFechaHerencia(DTipo: string): TDateTime;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT C.FECHA FROM ');
        SQL.Add(' G_RELACIONES_ORIGENES_ID(?ID_S) R ');
        SQL.Add(' JOIN GES_CABECERAS_S C ');
        SQL.Add(' ON R.ID_S = C.ID_S ');
        SQL.Add(' WHERE R.RTIPO = ?D_TIPO ');
        Params.ByName['ID_S'].AsInteger := QMCabecera.FieldByName('ID_S').AsInteger;
        Params.ByName['D_TIPO'].AsString := DTipo;
        ExecQuery;
        Result := FieldByName['FECHA'].AsDateTime;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstAlbaranes.QMDetalleAfterOpen(DataSet: TDataSet);
var
  IdOrden : integer;
  DS : TComponent;
begin
  QMPromociones.Open;
  xLotes.Open;
  xNroSerie.Open;
  xArticulos.Open;
  QMEscandallo.Open;
  xProyectosDetalle.Open;
  xArticulosIdioma.Close;
  xArticulosIdioma.Params.ByName['IDIOMA'].AsString := QMCabecera.FieldByName('IDIOMA').AsString;
  xArticulosIdioma.Open;
  // QMDetalleTallas.Open; {dji lrk kri}
  QMDetalleUE.Open;
  QSPProcedencia.Open;
  if DMMain.EstadoKri(120) = 1 then
     QSPProcedencia_kri.Open; {dji lrk kri}
  with xDireccionEntregaLinea do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM UT_JUSTIFICA_DOMICILIO (' + IntToStr(QMCabecera.FieldByName('TERCERO').AsInteger) + ') WHERE NUM = ?DIRECCION_ENTREGA';
     Open;
  end;

  if not xHerenciaPEC.Active then
     xHerenciaPEC.Open;

  // HANDTE - Quiere datos de la orden asociada al *PEDIDO*
  if ((Param_MODREST006) or (Param_MODREST015)) then
  begin
     IdOrden := 0;
     if (QSPProcedencia.FieldByName('TIPO_O').AsString = 'PEC') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT FIRST 1 ID_ORDEN FROM GES_DETALLES_S_PED ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = :EMPRESA AND ');
              SQL.Add(' EJERCICIO = :EJERCICIO AND ');
              SQL.Add(' CANAL = :CANAL AND ');
              SQL.Add(' SERIE = :SERIE AND ');
              SQL.Add(' TIPO = :TIPO AND ');
              SQL.Add(' RIG = :RIG AND ');
              SQL.Add(' ID_ORDEN > 0 ');
              SQL.Add(' ORDER BY LINEA ');
              Params.ByName['EMPRESA'].AsInteger := QSPProcedencia.FieldByName('EMPRESA_O').AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := QSPProcedencia.FieldByName('EJERCICIO_O').AsInteger;
              Params.ByName['CANAL'].AsInteger := QSPProcedencia.FieldByName('CANAL_O').AsInteger;
              Params.ByName['SERIE'].AsString := QSPProcedencia.FieldByName('SERIE_O').AsString;
              Params.ByName['TIPO'].AsString := QSPProcedencia.FieldByName('TIPO_O').AsString;
              Params.ByName['RIG'].AsInteger := QSPProcedencia.FieldByName('RIG_O').AsInteger;
              // Params.ByName['LINEA'].AsInteger := QSPProcedencia.FieldByName('LINEA_O').AsInteger;
              ExecQuery;
              IdOrden := FieldByName['ID_ORDEN'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     xOrdProd.Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
     xOrdProd.Open;
  end;
  xArticuloTYC.Open;

  // ABSHOT - Personalizacion
  DS := TDataModule(Self).FindComponent('xCodProvDNKA');
  if Assigned(DS) then
     TFIBDataSetRO(DS).Open;
end;

procedure TDMLstAlbaranes.HYReportLengthBands(Sender: THYReport; Band: THYBand; var Length: integer);
begin
  if (band.HYReportSourceName = 'HYRSDetalle') then
     Length := 1 + n_lineas_memo_detalle;
end;

function TDMLstAlbaranes.n_lineas_memo_detalle: integer;
begin
  {dji lrk kri
  if (QMDetalle.RecordCount>0) then
    ric.Assign(QMDetalle.FieldByName('NOTAS'));
}
  Result := ric.Count;
end;

procedure TDMLstAlbaranes.HYReportPrepareFields(Sender: THYReport; Field: THYField; Contents: TStrings);
begin
  if (Copy(UHYReport.THYField(Field).Source, 2, 4) = 'MEMO') then
     UHYReport.THYField(Field).Top :=
        (StrToInt(Copy(UHYReport.THYField(Field).Source, 6, 1)) + 1);
end;

procedure TDMLstAlbaranes.QMDetalleTallas_borrarAfterOpen(DataSet: TDataSet);
begin
  xTallas.Close;
  xTallas.Open;
end;

procedure TDMLstAlbaranes.QMCabeceraEDIAfterOpen(DataSet: TDataSet);
var
  Comprador : string;
  Receptor : string;
begin
  xDireccionEDI.Close;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COMPRADOR, RECEPTOR FROM GES_CABECERAS_S WHERE ID_S = ' +
           IntToStr(QMCabecera.FieldByName('ID_S').AsInteger);
        ExecQuery;
        Comprador := Trim(FieldByName['COMPRADOR'].AsString);
        Receptor := Trim(FieldByName['RECEPTOR'].AsString);
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
        if (QMCabecera.FieldByName('CLIENTE').AsInteger = 60412) then
           SQL.Text := 'SELECT TERCERO, DIRECCION FROM SYS_TERCEROS_DIRECCIONES WHERE CODIGO_EDI = ''' + Receptor + ''''
        else
           SQL.Text := 'SELECT TERCERO, DIRECCION FROM SYS_TERCEROS_DIRECCIONES WHERE CODIGO_EDI = ''' + Comprador + '''';
        ExecQuery;
        xDireccionEDI.Params.ByName['TERCERO'].AsInteger := FieldByName['TERCERO'].AsInteger;
        xDireccionEDI.Params.ByName['DIRECCION'].AsInteger := FieldByName['DIRECCION'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xDireccionEDI.Open;
end;

procedure TDMLstAlbaranes.UpdateaDocumentos;
var
  ID_S : integer;
begin
  if (MarcarListado) then
  begin
     with xUpdateaDocumentos do
     begin
        Close;
        SelectSQL.Text := QMCabecera.SelectSQL.Text;
        Plan.Text := QMCabecera.Plan.Text;
        if (id_s_aux = 0) then
           Params.ByName['SERIE'].AsString := seriegen
        else
           Params.ByName['ID_S'].AsInteger := ID_S_AUX;
        Open;
        if (id_s_aux = 0) then
           if (FiltroGen = 0) then
           begin
              DMMain.FiltraRO(QMCabecera, '11110', False);
              Params.ByName['SERIE'].AsString := seriegen;
              Open;
           end;
        First;
        ID_S := FieldByName('ID_S').AsInteger;
        while not EOF do
        begin
           ModificaDoc(QGen, ID_S, 1, 0);
           Next;
           ID_S := FieldByName('ID_S').AsInteger;
        end;
     end;
  end;
end;

procedure TDMLstAlbaranes.frAlbaranesPrintReport;
begin
  UpdateaDocumentos;
end;

procedure TDMLstAlbaranes.HYReportPrintReport(Sender: THYReport);
begin
  UpdateaDocumentos;
end;

procedure TDMLstAlbaranes.frAlbaranesUserFunction(const Name: string; p1, p2, p3: variant; var Val: variant);
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

function TDMLstAlbaranes.frxAlbaranesUserFunction(const MethodName: string; var Params: variant): variant;
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

procedure TDMLstAlbaranes.MostrarListadoMail(id_s: integer; Serie: string; Modo: integer; const Ejercicio: integer; aMarcarListado: boolean = True);
var
  str : string;
  Listado : smallint;
  L : TStrings;
  TituloCliente : string;
begin
  // DMMain.Log('TFMAlbaranes.AInformeAlbaranExecute');
  L := TStringList.Create;
  try
     if (LeeParametro('ALBNSER001', Serie) = 'S') then
        LineasNoSerializadas(L, 'ALB', ID_S);

     if (L.Count > 0) then
        raise Exception.Create(_('Faltan lineas por serializar') + #13#10 + L.Text)
     else
     begin
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
        if (LeeParametro('LSTALB0004') = 'S') then
        begin
           TituloCliente := '_' + LimpiaCadenaBasica(QMCabecera.FieldByName('TITULO').AsString);
           TituloCliente := StringReplace(TituloCliente, ' ', '_', [rfReplaceAll]);
        end;

        nombreFich := LimpiaNombreFichero(format('%s_%d-%s-%.5d%s.pdf', [_('Albaran'), QMCabecera.FieldByName('EJERCICIO').AsInteger, QMCabecera.FieldByName('SERIE').AsString, QMCabecera.FieldByName('RIG').AsInteger, TituloCliente]));

        Listado := DMListados.ObtenerListadoPerfil(xCliente.FieldByName('PERFIL').AsString, 3, True);

        if (Listado > 0) then
           DMListados.CargarMail(34, '', Listado)
        else
           DMListados.CargarMail(34, Serie);

        // Sino es matricial y la opcion elegida es la de enviar pdf (matricial no envia pdf),
        // se toma el listado que tenga por defecto para ese documento

        if (REntorno.TipoListado = 'FRF') then
        begin
           with frAlbaranes do
           begin
              LoadFromFIB(REntorno.Formato, str);
              PrepareReport;
              rutaFich := ExportarPDF(frAlbaranes, nombreFich);
           end;
        end
        else if (REntorno.TipoListado = 'FR3') then
        begin
           frxAlbaranes.LoadFromFIB(REntorno.Formato, Str);
           frxAlbaranes.PrepareReport;
           rutaFich := ExportarPDF(frxAlbaranes, nombreFich);
        end
        else
        begin
           MessageDlg(_('El formato de listado no es válido para exportar a PDF.' + #13#10 +
              'El listado debe ser de los tipos FRF o FR3.'), mtWarning, [mbOK], 0);
           raise Exception.Create('');
        end;

        DMListados.LimpiaEntorno;
     end;
  finally
     L.Free;
  end;
end;

procedure TDMLstAlbaranes.DobleCabeceraAfterOpen(DataSet: TDataSet);
begin
  xDobFormaPago.Open;
  xDobTransportista.Open;
  xDobDireccionCliente.Open;
  xDobNotasClientes.Open;
  xDobleIva.Open;
  xDobleCartaPortes.Open;
  xMatricula1.Open;
  xMatricula2.Open;
  xMatricula3.Open;
  xDireccionesNIF.Open;
  xDobTipoPorte.Open;
end;

procedure TDMLstAlbaranes.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
  xCliente.Open;
  xFormaPago.Open;
  xAgente.Open;
  xTransportistas.Open;
  xProyectos.Open;
  xRuta.Open;
  xDatosIva.Open;
  xNotasCliente.Open;
  xCartaPortes.Open;
  xDetalleDeCabecera.Open;
  xPedidoAlquiler.Open;
  xLstFirmas.Open;
  xCuota.Open;
  xContacto.Open;
  xTipoPorte.Open;
  xReferenciaDte.Open;

  if Param_MODREST017 then
  begin
     with QMDetalleTallas do
     begin
        Close;
        SelectSQL.Clear;
        // También que pertenezcan al mismo origen
        if (Param_LSTOALB003 = 'S') then
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
        if (Param_LSTOALB002 = '') then
           SelectSQL.Add(' ORDER BY X.CAJA_EDI, X.GENERO, X.FAMILIA, X.SUBFAMILIA, X.REF_PROVEEDOR, X.S_COLOR ')
        else
           SelectSQL.Add(' ORDER BY ' + Param_LSTOALB002);
     end;

     QMGrupoTalla.Open;
  end;
end;

procedure TDMLstAlbaranes.QMPromocionesAfterOpen(DataSet: TDataSet);
begin
  xArticulosPRM.Open;
end;

procedure TDMLstAlbaranes.QMPromocionesAfterScroll(DataSet: TDataSet);
begin
  if ((QMPromociones.RecordCount > 0) and (ric_prm <> nil)) then
     ric_prm.Assign(QMPromociones.FieldByName('NOTAS'));
  //if QMDetalle.Eof then QMDetalle.Close;
  {xArticulosPRM.Close;
  xArticulosPRM.Open;}
end;

procedure TDMLstAlbaranes.frUDNotasArtPRMCheckEOF(Sender: TObject; var EOF: boolean);
begin
  EOF := (ric_prm.Count = x);
end;

procedure TDMLstAlbaranes.frUDNotasArtPRMFirst(Sender: TObject);
begin
  x := 0;
end;

procedure TDMLstAlbaranes.frUDNotasArtPRMNext(Sender: TObject);
begin
  x := x + 1;
end;

function TDMLstAlbaranes.DameImagenArtPromo: integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        Database := DMMain.Database;
        SQL.Text := 'SELECT IMAGEN FROM ART_ARTICULOS WHERE ID_A = :ID_A';
        Params.ByName['ID_A'].AsInteger := QMPromociones.FieldByName('ID_A').AsInteger;
        ExecQuery;
        Result := FieldByName['IMAGEN'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstAlbaranes.frxAlbaranesBeforePrint(Sender: TfrxReportComponent);
var
  NumeroFirma : integer;
  s : string;
  Imagen : TImage;
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
  begin
     with TfrxCustomMemoView(Sender) do
     begin
        if (Memo.Count > 0) then
        begin
           if Memo[0] = '[NotasArt]' then
           begin
              Memo[0] := ric.Strings[I];
              //Notas:=True;
           end
           else
           begin
              //Notas:=False;
           end;

           if memo[0] = '[NotasCabecera]' then
              memo[0] := NotasCab.Strings[indNotas];

           if memo[0] = 'CANTIDADES' then
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
              if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
                 (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
                 Memo[0] := ''
              else
              begin
                 DisplayFormat.FormatStr := MascaraP;
                 DisplayFormat.Kind := fkNumeric;
              end;

           if (Pos('[MascaraL]', Memo[0]) > 0) then
              if ((QMDetalle.FieldByName('ARTICULO').AsString = REntorno.ArtTextoLibre) and
                 (QMDetalle.FieldByName('UNIDADES').AsFloat = 0)) then
                 Memo[0] := ''
              else
              begin
                 DisplayFormat.FormatStr := LocalMascaraL;
                 DisplayFormat.Kind := fkNumeric;
              end;

           if memo[0] = '[NotasArtPRM]' then
           begin
              memo[0] := ric_prm.Strings[x];
           end;
        end;
     end;
  end;

  if (Sender is TfrxRichView) then
  begin
     with TfrxRichView(Sender) do
     begin
        if (TagStr = 'Notas') then
        begin
           if QMCabecera.FieldByName('NOTAS').Value = '' then
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
     s := TfrxPictureView(Sender).TagStr;
     if (s = 'ImgArticulo') then
     begin
        DMListados.MostrarImagen(xArticulos.FieldByName('IMAGEN').AsInteger, TfrxPictureView(Sender));
        TfrxPictureView(Sender).Visible := True;
     end;

     if (s = 'ImgArticuloPRM') then
     begin
        DMListados.MostrarImagen(DameImagenArtPromo, TfrxPictureView(Sender));
        TfrxPictureView(Sender).Visible := True;
     end;

     if (s = 'ImgDetalle') then
        DMListados.MostrarImagen(QMDetalle.FieldByName('ID_IMAGEN').AsInteger, TfrxPictureView(Sender));

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
  end;
end;

procedure TDMLstAlbaranes.frxAlbaranesBeginDoc(Sender: TObject);
begin
  TipoDoc := '';  // Tipo de Documento
end;

procedure TDMLstAlbaranes.frxAlbaranesPrintReport(Sender: TObject);
begin
  UpdateaDocumentos;
end;

procedure TDMLstAlbaranes.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
  xCliente.Close;
  xFormaPago.Close;
  xAgente.Close;
  xTransportistas.Close;
  xProyectos.Close;
  xRuta.Close;
  xDatosIva.Close;
  xNotasCliente.Close;
  xCartaPortes.Close;
  xDetalleDeCabecera.Close;
  xPedidoAlquiler.Close;
  xLstFirmas.Close;
  xCuota.Close;
  QMGrupoTalla.Close;
  xContacto.Close;
  xTipoPorte.Close;
  xReferenciaDte.Close;
end;

procedure TDMLstAlbaranes.QMDetalleBeforeClose(DataSet: TDataSet);
begin
  // QMDetalleTallas.Close; {dji lrk kri}
  QMPromociones.Close;
  xLotes.Close;
  xNroSerie.Close;
  xArticulos.Close;
  QMEscandallo.Close;
  xProyectosDetalle.Close;
  xArticulosIdioma.Close;
  QSPProcedencia.Close;
  QSPProcedencia_kri.Close; {dji lrk kri}
  QMDetalleUE.Close;
  xDireccionEntregaLinea.Close;
  xHerenciaPEC.Close;
  xArticuloTYC.Close;
end;

procedure TDMLstAlbaranes.xClienteAfterOpen(DataSet: TDataSet);
begin
  xTercero.Open;
  xCuenta.Open;
  with xDireccion_Cliente do
  begin
     Close;
     Params.ByName['TERCERO'].AsInteger := xCliente.FieldByName('TERCERO').AsInteger;
     Params.ByName['DIRECCION'].AsInteger := QMCabecera.FieldByName('DIRECCION').AsInteger;
     Open;
  end;
end;

procedure TDMLstAlbaranes.xClienteBeforeClose(DataSet: TDataSet);
begin
  xCuenta.Close;
  xTercero.Close;
end;

procedure TDMLstAlbaranes.DobleCabeceraBeforeClose(DataSet: TDataSet);
begin
  xDobFormaPago.Close;
  xDobTransportista.Close;
  xDobDireccionCliente.Close;
  xDobNotasClientes.Close;
  xDobleIva.Close;
  xDobleCartaPortes.Close;
  xMatricula1.Close;
  xMatricula2.Close;
  xMatricula3.Close;
  xDireccionesNIF.Close;
  xDobTipoPorte.Close;
end;

procedure TDMLstAlbaranes.xDobleCartaPortesAfterOpen(DataSet: TDataSet);
begin
  xCargadora.Open;
  xIntermediaria.Open;
  xDobTranspCarta.Open;
  xTransportistaCarta.Open;
  xExpedidora.Open;
  xDestinatario.Open;
  xDobleNaturaleza.Open;
  xDobleMatricula.Open;
end;

procedure TDMLstAlbaranes.xDobleCartaPortesBeforeClose(DataSet: TDataSet);
begin
  xCargadora.Close;
  xIntermediaria.Close;
  xDobTranspCarta.Close;
  xExpedidora.Close;
  xDestinatario.Close;
  xDobleNaturaleza.Close;
  xDobleMatricula.Close;
end;

procedure TDMLstAlbaranes.xCartaPortesAfterOpen(DataSet: TDataSet);
begin
  xTransportistaCarta.Open;
end;

procedure TDMLstAlbaranes.xCartaPortesBeforeClose(DataSet: TDataSet);
begin
  xTransportistaCarta.Close;
end;

procedure TDMLstAlbaranes.QMPromocionesBeforeClose(DataSet: TDataSet);
begin
  xArticulosPRM.Close;
end;

procedure TDMLstAlbaranes.QMDetalleTallas_borrarAfterScroll(DataSet: TDataSet);
begin
{ Borrar si no se utiliza
  MIRKO ???
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ARTICULO FROM ART_ARTICULOS_M_C_TALLAS WHERE ID_A_M_C= ' + QMDetalleTallas.FieldByName('ID_A_M_C').AsString;
        ExecQuery;
        xArticuloTallasKri.Close;
        xArticuloTallasKri.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        xArticuloTallasKri.Params.ByName['ARTICULO'].AsString := FieldByName['ARTICULO'].AsString;
        xArticuloTallasKri.Open;
        FreeHandle;
     finally
        Free;
     end;
  end;
}
end;

function TDMLstAlbaranes.DamePrecioUdPtoVerde(Empresa, Ejercicio, Canal: integer; Articulo: string): double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT PTO_VERDE FROM CON_CUENTAS_GES_ART WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND ARTICULO = :ARTICULO';
        ExecQuery;
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['ARTICULO'].AsString := Articulo;
        ExecQuery;
        Result := FieldByName['PTO_VERDE'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMLstAlbaranes.MostrarListadoEtiqueta(const ID_S, RIG, Grupo: integer; const Serie: string; Modo: byte; const Ejercicio: integer);
var
  Titulo : string;
  Listado : smallint;
begin
  SerieGen := Serie;
  id_s_aux := id_s;
  SW := 1;
  with QMCabecera do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  {Quimicas Cuadrado. Datos de ADR.
  if ((numero = 5) and (LeeParametro('MODREST011') = 'S')) then
     QMDetallesPortesQui.Open;
  }

  {Se llama a la funcion ObtenerListadoPerfil que comprueba si tiene algun listado
  o copias asignado para el perfil del cliente
  Solo si se selecciono el listado 1.
  3 - Albaranes a Clientes}

  Listado := 0;
  {if (numero = 1) then
     Listado := DMListados.ObtenerListadoPerfil(xCliente.FieldByName('PERFIL').AsString, 3);
  }
  if ((DMListados.Copias <> REntorno.Copias) and (DMListados.Copias <> 0)) then
     REntorno.Copias := DMListados.Copias;

  if (Modo = 0) then
     REntorno.Copias := 1; {dji lrk kri - Si visualizo, solo una copia}

  Titulo := format('%s_%d-%s-%.5d', [('Albaran'), QMCabecera.FieldByName('EJERCICIO').AsInteger, QMCabecera.FieldByName('SERIE').AsString, QMCabecera.FieldByName('RIG').AsInteger]);

  DMListados.Imprimir(Grupo, Listado, Modo, Serie, Titulo, frAlbaranes, frxAlbaranes, HYReport);
end;

procedure TDMLstAlbaranes.QMGrupoTallaAfterOpen(DataSet: TDataSet);
begin
  QMTituloTalla.Open;
  QMDetalleTallas.Open;
end;

procedure TDMLstAlbaranes.QMGrupoTallaBeforeClose(DataSet: TDataSet);
begin
  QMTituloTalla.Close;
  QMDetalleTallas.Close;
end;

procedure TDMLstAlbaranes.QMDetalleTallasAfterOpen(DataSet: TDataSet);
begin
  QMArticuloTallas.Open;
end;

procedure TDMLstAlbaranes.QMDetalleTallasBeforeClose(DataSet: TDataSet);
begin
  QMArticuloTallas.Close;
end;

procedure TDMLstAlbaranes.xOrdProdBeforeClose(DataSet: TDataSet);
begin
  xOrdProdEmpleado.Close;
end;

procedure TDMLstAlbaranes.xOrdProdAfterOpen(DataSet: TDataSet);
begin
  xOrdProdEmpleado.Open;
end;

procedure TDMLstAlbaranes.QMDetalleADRAfterOpen(DataSet: TDataSet);
begin
  xLotes.Open;
  xNroSerie.Open;
end;

procedure TDMLstAlbaranes.QMDetalleADRBeforeClose(DataSet: TDataSet);
begin
  xLotes.Close;
  xNroSerie.Close;
end;

procedure TDMLstAlbaranes.xHerenciaPECAfterOpen(DataSet: TDataSet);
begin
  xHerenciaOFC.Open;
end;

procedure TDMLstAlbaranes.xHerenciaPECBeforeClose(DataSet: TDataSet);
begin
  xHerenciaOFC.Close;
end;

procedure TDMLstAlbaranes.MostrarListadoPicking(const ID_S, RIG: integer; const Serie: string; Modo, Numero: byte; const Ejercicio: integer);
var
  Titulo : string;
  Grupo : integer;
  Listado : smallint;
begin
  SerieGen := Serie;
  id_s_aux := id_s;
  SW := 1;

  MarcarListado := False;
  DMMain.LogIni('MostrarListado');
  try
     Grupo := 651;

     // Listado de Picking List debe estar ordenado por ubicacion.
     // Dado que los clientes tienen este dato en diferentes campos se parametriza mediante el parámetro LSTPICK002
     QMDetalle.Close;
     with QMDetalle.SelectSQL do
     begin
        Clear;
        Add(' SELECT * FROM VER_DETALLE_ALBARAN_LST WHERE ID_S = ?ID_S ');

        if ((Param_LSTPICK002) = '') then
           Add(' ORDER BY COMPOSICION ')
        else
           Add(' ORDER BY ' + Param_LSTPICK002);
     end;

     DMMain.LogIni('QMCabecera.Open');
     with QMCabecera do
     begin
        Close;
        Params.ByName['ID_S'].AsInteger := ID_S;
        Open;
     end;
     DMMain.LogFin('QMCabecera.Open');

     xLotes.DataSource := DSDetalle;
     xNroSerie.DataSource := DSDetalle;

     Listado := 0;
     if (Modo = 0) then
        REntorno.Copias := 1; {dji lrk kri - Si visualizo, solo una copia}

     DMMain.LogIni('Titulo');
     Titulo := format('%s_%d-%s-%.5d', [_('PickingList'), QMCabecera.FieldByName('EJERCICIO').AsInteger, QMCabecera.FieldByName('SERIE').AsString, QMCabecera.FieldByName('RIG').AsInteger]);
     DMMain.LogFin('Titulo');

     DMMain.LogIni('DMListados.Imprimir');
     DMListados.Imprimir(Grupo, Listado, Modo, Serie, Titulo, frAlbaranes, frxAlbaranes, HYReport, LimpiaNombreFichero(Titulo + '.pdf'));
     DMMain.LogFin('DMListados.Imprimir');
  finally
     MarcarListado := True;
     DMMain.LogFin('MostrarListado');
  end;
end;

procedure TDMLstAlbaranes.LineasNoSerializadas(L: TStrings; Tipo: string; ID_S: integer);
var
  DS : TFIBDataSet;
begin
  /// Comprueba que no haya lineas sin los nros de serie suficientes asignados.

  TStringList(L).Clear;
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT D.LINEA, D.ARTICULO, D.TITULO, D.UNIDADES, ');
           SelectSQL.Add('        (SELECT COUNT(*) ');
           SelectSQL.Add('         FROM GES_DETALLES_SERIALIZACION ');
           SelectSQL.Add('         WHERE ');
           SelectSQL.Add('         TIPO = D.TIPO AND ');
           SelectSQL.Add('         ID_DETALLE_DOC = D.ID_DETALLES_S) UNIDADES_SERIALIZADAS ');
           SelectSQL.Add(' FROM GES_DETALLES_S D ');
           SelectSQL.Add(' JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' A.SERIALIZADO = 1 AND ');
           SelectSQL.Add(' TIPO = :TIPO AND ');
           SelectSQL.Add(' ID_S = :ID_S AND ');
           SelectSQL.Add(' ABS(D.UNIDADES) <> (SELECT COUNT(*) ');
           SelectSQL.Add('                     FROM GES_DETALLES_SERIALIZACION ');
           SelectSQL.Add('                     WHERE ');
           SelectSQL.Add('                     EMPRESA = D.EMPRESA AND ');
           SelectSQL.Add('                     EJERCICIO = D.EJERCICIO AND ');
           SelectSQL.Add('                     CANAL = D.CANAL AND ');
           SelectSQL.Add('                     SERIE = D.SERIE AND ');
           SelectSQL.Add('                     TIPO = D.TIPO AND ');
           SelectSQL.Add('                     RIG = D.RIG AND ');
           SelectSQL.Add('                     LINEA = D.LINEA) ');
           Params.ByName['TIPO'].AsString := Tipo;
           Params.ByName['ID_S'].AsInteger := ID_S;
           Open;
           while not EOF do
           begin
              TStringList(L).Add(format(_('Linea %d (%s) - Uds.=%d - Serializadas %d.'), [FieldByName('LINEA').AsInteger, FieldByName('ARTICULO').AsString, Trunc(FieldByName('UNIDADES').AsFloat), FieldByName('UNIDADES_SERIALIZADAS').AsInteger]));
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

procedure TDMLstAlbaranes.ExportarExcel(ID_S: integer; Archivo: string);
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
  DMMain.Log('Exportando Albarán Excel: ' + Archivo);

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

        HCalc.CellText[Fila, 2] := _('Albarán:');
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

        {
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

        Orden := 0;
        }

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

procedure TDMLstAlbaranes.DobleCabeceraAfterScroll(DataSet: TDataSet);
var
  DatosBancarios : char;
  BancoPagos, BancoFP : integer;
begin
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

end.
