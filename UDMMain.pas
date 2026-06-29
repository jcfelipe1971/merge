unit UDMMain;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, ExtDlgs,
  ImgList, DB, FIBDatabase, FIBQuery, UTeclas, FIBTableDataSet, FIBDataSet,
  UFIBModificados, UComponentesBusquedaFiltrada, StdCtrls, FR_Class,
  Menus, ComCtrls, registry, UEntorno, UControlEdit, UHYReport, HYFIBQuery,
  FIBDataSetRO, FIBTableDataSetRO, UFormGest, RxMemDS, Variants, FRD_Mngr,
  FR_FIBDB, FR_E_RTF, FR_E_CSV, FR_E_TXT, FR_E_HTM, FR_OLE, FR_BarC, FR_Chart,
  FR_RRect, FR_PTabl, FR_RxRTF, FR_Desgn, FR_HyDesgn, FR_DCtrl, FR_Cross,
  FR_Shape, FR_ChBox, FR_Rich, jpeg, GIFImage, ULFManager,
  ULFFormStorage, Printers, Fr_HYReport, PsFR_E_WMF, PsFR_E_EMF,
  PsFR_E_BMP, PsFR_E_GIF, PsFR_E_Graphic, PsFR_E_JPEG, PsFR_E_EXCEL,
  PsFR_E_RTF, PsFR_E_HTML, PsFR_E_Main, PsFR_E_PDF, frxDCtrl, frxCross,
  frxDesgn, frxHyDesgn, frxClass, frxFIBHYComponents, frxChart, frxBarcode,
  frxChBox, frxExportCSV, frxExportHTML, frxOLE, frxRich, frxExportRTF,
  frxExportTXT, frxExportPDF, frxExportMail, frxExportText, frxDMPExport,
  frxHYMailExport, FR_E_HTML2, frRtfExp, frOLEExl, frxExportXLS,
  frxExportXML, ExtActns, ExtCtrls, rxPlacemnt, Midaslib, ULFDateEdit, SyncObjs;

type
  TMonedaInf = record
     Moneda: string;
     DecimalesVer: integer;
     DescimalesCalculos: integer;
     DecimalesVerStr: string;
     DescimalesCalculosStr: string;
     Signo: string;
  end;
  TMonedaInfList = array of TMonedaInf;

  TParametroFiltrado = class(TObject)
  public
     Filtro: string;
     SQLBase: TStrings;
     Tabla: TFIBTableSet;
  end;

  TDMMain = class(TDataModule)
     PSDImpresora: TPrinterSetupDialog;
     DataBase: THYDatabase;
     Teclas: TTeclas;
     EntornoBusqueda: TEntornoFind2000;
     ILOrdGrid: TImageList;
     QListados: TFIBTableSet;
     HYPrinterOptions: THYPrinterOptions;
     QListadosLISTADO: TIntegerField;
     QListadosGRUPO: TIntegerField;
     QListadosTITULO: TFIBStringField;
     QListadosDEF_LISTADO: TBlobField;
     QListadosEDITABLE: TIntegerField;
     QListadosCABECERA: TIntegerField;
     QListadosTIPO: TFIBStringField;
     xFactorMoneda: TFIBTableSetRO;
     frRxRichObject1: TfrRxRichObject;
     frPrintGrid1: TfrPrintGrid;
     frRoundRectObject1: TfrRoundRectObject;
     frChartObject1: TfrChartObject;
     frBarCodeObject1: TfrBarCodeObject;
     frOLEObject1: TfrOLEObject;
     frHTMExport1: TfrHTMExport;
     frCSVExport1: TfrCSVExport;
     frTextExport1: TfrTextExport;
     frRTFExport1: TfrRTFExport;
     frFIBComponents1: TfrFIBComponents;
     frDataStorage1: TfrDataStorage;
     frRichObject1: TfrRichObject;
     frCheckBoxObject1: TfrCheckBoxObject;
     frShapeObject1: TfrShapeObject;
     frCrossObject1: TfrCrossObject;
     frDialogControls1: TfrDialogControls;
     frHyDesigner1: TfrHyDesigner;
     FSLookAndFeel: TLFFibFormStorage;
     ILMain_In: TImageList;
     ILMain_Ac: TImageList;
     frHYReport1: TfrHYReport;
     PsfrPDFExport1: TPsfrPDFExport;
     PsfrHTMLExport1: TPsfrHTMLExport;
     PsfrRTFExport1: TPsfrRTFExport;
     PsfrEXCELExport1: TPsfrEXCELExport;
     PsfrJPEGExport1: TPsfrJPEGExport;
     PsfrGIFExport1: TPsfrGIFExport;
     PsfrBMPExport1: TPsfrBMPExport;
     PsfrEMFExport1: TPsfrEMFExport;
     PsfrWMFExport1: TPsfrWMFExport;
     frxReport1: TfrxReport;
     frxRTFExport1: TfrxRTFExport;
     frxRichObject1: TfrxRichObject;
     frxOLEObject1: TfrxOLEObject;
     frxHTMLExport1: TfrxHTMLExport;
     frxCSVExport1: TfrxCSVExport;
     frxCheckBoxObject1: TfrxCheckBoxObject;
     frxBarCodeObject1: TfrxBarCodeObject;
     frxChartObject1: TfrxChartObject;
     frxFIBHYComponents1: TfrxFIBHYComponents;
     frxHYDesigner1: TfrxHYDesigner;
     frxCrossObject1: TfrxCrossObject;
     frxDialogControls1: TfrxDialogControls;
     frxDotMatrixExport: TfrxDotMatrixExport;
     frxPDFExport: TfrxPDFExport;
     frxHYMailExport: TfrxHYMailExport;
     frOLEExcelExport1: TfrOLEExcelExport;
     frRtfAdvExport1: TfrRtfAdvExport;
     frHTML2Export1: TfrHTML2Export;
     TLocal: THYTransaction;
     LFManager: TLFManager;
     ToolbarImages: TImageList;
     frxXLSExport: TfrxXLSExport;
     frxXMLExport: TfrxXMLExport;
     ILOrdenFabricacion: TImageList;
     ILTPV_Ac: TImageList;
     ILTPV_In: TImageList;
     DataBaseAdjuntos: THYDatabase;
     TLocalAdjuntos: THYTransaction;
     DataBaseImagenes: THYDatabase;
     TLocalImagenes: THYTransaction;
     TDesconexionBaseAdjunto: TTimer;
     TDesconexionBaseImagenes: TTimer;
     procedure DMMainCreate(Sender: TObject);
     procedure DMMainDestroy(Sender: TObject);
     procedure TDesconexionBaseAdjuntoTimer(Sender: TObject);
     procedure TDesconexionBaseImagenesTimer(Sender: TObject);
  private
     { Private declarations }
     MonedaInfList: TMonedaInfList;
     ComponentesEsc: TList;
     PrimeraVez: boolean;
     FDMImageList: TDataModule;
     SeparadorDecimal: char; {dji lrk kri - EDI}
     EstadoKri_Codigo: TStrings;
     EstadoKri_Estado: TStrings;
     ContadorLog: integer;
     InicioLog: array[1..20] of TDateTime;
     OldTipoUnidad: string;
     //OldTituloUnidad: string;
     UltimaUnidad: string;
     UltimoDecimales: integer;
     UltimoMascaraUnidadesArticulo: string;
     UltimoMascaraUnidadesTipoUnidad: string;
     UltimoMascaraUnidadesDecimales: integer;
     //UltimoArticuloLoteable: string;
     //UltimoArticuloLoteableLoteable: boolean;
     //UltimoIDALoteable: integer;
     //UltimoIDALoteableLoteable: boolean;
     TeclasLeidas: boolean;
     RutaImagenTPV: string;
     procedure CargaMonedaInfList;
  public
     { Public declarations }
     Version_Demo: boolean;
     Fecha_Demo: TDateTime;
     UltimoAvisoMostrado: integer;

     UsuarioWindows: string;
     NombreMaquina: string;
     DatosOrdenador: string;
     MACServidor: string;
     IP_Servidor: string;

     TituloSituacionProduccion: array[0..4] of string;
     TituloEstado: array[0..6] of string;
     TituloUnidadMedida: TStrings;

     procedure RegeneraControl;
     procedure InicializaImagenes;
     procedure AjustaImagenes;
     procedure Conecta;
     procedure DesConecta;
     procedure RegistraEntrada;
     procedure RegistraSalida;
     procedure AjustaMascaraMoneda;
     procedure RegistraSalidaDeEntrada(Entrada: integer);
     procedure Busca(Busca: string; Tabla: TFIBTableSet; CampoNum, CampoTit: string; Filtro: string = '00000'; Orden: string = '');
     procedure BuscaRO(Busca: string; Tabla: TFIBTableSetRO; CampoNum, CampoTit: string; Filtro: string = '00000'; Orden: string = '');
     procedure CreaRegistroPresenciaEntrada;
     procedure CreaRegistroPresenciaSalida;

     // Compuesto '00000'
     // el primer  0 filtra empresas
     // el segundo 0 filtra ejercicios
     // el tercero 0 filtra canales
     // el cuarto  0 filtra series
     // el quinto  0 filtra Paises

     procedure AjustaNivelesContables;
     procedure ConfiguraImpresora;
     function ValidaEntrada: boolean;
     function ContadorGen(NomGen: string): integer;
     function Contador_GEN(DataSet: TDataSet; NomGen, NomCampo: string; Fuerza: boolean = False): integer;
     function Contador_E(Tipo: string; Empresa: integer = 0): integer;
     function Contador_EE(Tipo: string; Empresa: integer = 0; Ejercicio: integer = 0): integer;
     function Contador_EEC(Tipo: string; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0): integer;
     function Contador_EECS(Serie, Tipo: string; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0): integer;
     function Contador_EES(Serie, Tipo: string; Empresa: integer = 0; Ejercicio: integer = 0): integer;
     function Contador_EC(Tipo: string; Empresa: integer = 0; Canal: integer = 0): integer;
     procedure AjustaMovimientos;
     procedure LeerTeclas(Forzar: boolean = False);
     procedure ActualizaUsuario;
     procedure FiltraTabla(Tabla: TFIBDataSet; Filtro: string = '000000'; Abre: boolean = True);
     procedure FiltraRO(Tabla: TFIBDataSetRO; Filtro: string = '000000'; Abre: boolean = True);
     procedure FiltraQry(Query: TFIBQuery; Filtro: string = '000000'; Abre: boolean = True);
     procedure FiltraSQL(Parametro: TParametroFiltrado; Abrir: boolean = True);
     procedure DevuelveMonedas(Monedas: TStrings);
     procedure AsignaEntornoBusqueda;
     function DameSemillaCuentaGestion(Gestion: smallint; TipoTercero: smallint): string;
     function DameSemillaCuentaGestionMin(Gestion: smallint): string;
     function DameCuentaGestion(Gestion: smallint; TipoTercero: smallint = -1; Empresa: integer = 0): string;
     function DameRestriccionUsuario: string;
     function MascaraMoneda(Moneda: string; Tipo: smallint = 1): string;
     function DameSignoMoneda(moneda: string): string;
     function CompruebaRestriccionUsuario: boolean;
     procedure RenumeraAsientos;
     procedure ValidaFecha(Empresa: integer; Ejercicio: integer; Fecha: TDateTime);
     function Contador_Libre(Tipo: string; Codigo_Ent: integer): integer;
     function Contador_Libre_EECS(Serie, Tipo: string; Codigo_Ent: integer): integer;
     // function AltaEntrada: integer;
     procedure AjustaRiesgoConfirming;
     function ChequeaInmovilizado(Empresa, Ejercicio, Canal: integer; Fecha: TDateTime): boolean;
     function ChequeaVencimientos(Empresa, Ejercicio, Canal: integer; Fecha: TDateTime; var Lista: string): integer;
     function MinTercero: integer;
     procedure Cambios(Origen, Destino: string; Fecha: TDateTime; Importe: double; var Ver, Calculo: double);
     function ChequeaPagPagares(Empresa, Ejercicio, Canal: integer; Fecha: TDateTime; var Lista: string): integer;
     function ChequeaConPagares(Empresa, Ejercicio, Canal: integer; Fecha: TDateTime; var Lista: string): integer;
     procedure Redondeos(var Importe: double; Moneda: string; var Val_Ver, Val_Cal: double; var Val_VerSTR, Val_CalSTR: string);
     function DameFactor(Origen, Destino: string; Fecha: TDateTime): double;
     function FindComponenteEsc(componente: TComponent): integer;
     procedure AddComponenteEsc(componente: TComponent);
     procedure DelComponenteEsc(componente: TComponent);
     function MostrarAvisos: boolean;
     function MuestraRolloHacienda: boolean;
     procedure ImagenFondo;
     procedure DatosVersion(var VersionBaseDeDatos, Empresa, Copyright, NombreProducto: string; Forzar: boolean = False);
     {dji lrk kri}
     function EstadoKri(id: integer): integer;
     procedure BorraEstadoKri(id: integer);
     function DescripcionEstadoKri(id: integer): string;
     function DameCorreoCopiaAgente(Agente: integer; TipoDoc: string; Empresa: integer = 0): string;
     procedure CargaImageListGaleria(IdGaleria: integer; Lista: TListView; Alto: integer = 0; Ancho: integer = 0);
     function IntToEDINum(numero, longitud, Dec: integer): string;
     function FloatToEDINum(numero: real; longitud, Dec: integer): string;
     function StrToEDI(s: string; longitud: integer): string;
     function DateToEDI(d: TDateTime): string;
     function Date8ToEDI(d: TDateTime): string;
     function EDIToDate(s: string): TDateTime;
     function EDIToInt(s: string): integer;
     function EDIToFloat(s: string; decimales: integer): real;
     function AgregaDigitoControl(Codigo: string): string;
     function DameRiesgoPedido(Cliente: integer): double;
     procedure DameListadoSegunPerfil(cliente: integer; modo: string; var Formato: integer; var Cabecera: integer; var Grupo: integer; var Copias: integer; var Tipo: string);
     function ValidaVersionDemoKri(Fecha: TDateTime): TDateTime;
     // function VerificaNifKri(Pais, NifEntrada: string): integer;
     function EjercicioContableAbierto(ejercicio: integer): boolean;
     function DameDirectorioComunicaciones(Tipo: string): string;
     function DameDirectorioCodCliPro(Tipo: string; CodCliPro: integer): string;
     function CompruebaControlUbicacionAlmacen(Almacen: string): boolean;
     function DamePrecioMovimientoArticulo(Empresa, Canal: integer; Articulo, Almacen: string; UnidadesExt: double; TipoOper: string; PrecioOp: double): double;
     function DamePMPArticulo(Articulo, Almacen: string): double;
     function ChequeaCuotasPendientes: integer;
     function ChequeaAccionesPendientes: integer;
     function DameRevisionesAlquiler: string;
     function DamePagosTransferenciaPendientes: string;
     function ArticulosBajoStockMinimoMarcados(var ListaArticulos: string): integer;
     function LotesCaducidadDias(var ListaArticulos: string; Dias: integer): integer;
     function VencimientosMas75Dias(var ListaRecibos: string): integer;
     function ControlAcciones: boolean;
     function FloatToStrSinComa(numero: real; Dec: integer; long: integer = 0; Signo: string = '-'): string;
     function DameRiesgoDisponible(Cliente: integer): double;
     function DameAlmacenDocumento(Tipo, Serie: string): string;
     //sfg.albert
     function Download_HTM(const sURL, sLocalFileName: string): boolean;
     function DameStockArticulo(Empresa, Canal: integer; Articulo, Almacen: string): double;
     function DameStockArticuloFecha(Empresa, Canal: integer; Articulo, Almacen: string; Fecha: TDateTime): double;
     function DameStockVirtualArticulo(Empresa, Canal: integer; Articulo, Almacen: string): double;
     function DameStockRealArticulo(Empresa, Canal: integer; Articulo, Almacen: string): double;
     function DameStockMontura(Empresa, Canal: integer; Articulo, Almacen: string): double;
     function DameStockRefBase(Empresa, Canal: integer; Articulo, Almacen: string): double;
     function DamePedidosAProveedor(Empresa, Canal: integer; Articulo, Almacen: string): double;
     function DamePedidosDeCliente(Empresa, Canal: integer; Articulo, Almacen: string): double;
     function ArticuloControlaStock(Articulo: string): boolean; overload;
     function ArticuloControlaStock(ID_A: integer): boolean; overload;
     function DameMinIRPF: integer;
     procedure DameSaldoCliPro(Serie, Tipo: string; CodCliPro: integer; var SaldoDeudor: double; var SaldoAcreedor: double; var Saldo: double);
     procedure CreaMiniatura(Archivo: string; Imagen: TPicture);
     procedure AbrirArchivo(Archivo: string);
     function DameConstanteProduccion(Valor: string): integer;
     function DameConstanteProduccionS(Valor: string): string;
     function DameSituacionOrden(IdOrden: integer): integer;
     function DameTelefonoTercero(Tercero: integer): string;
     function DameDescripcionColor(Color: string): string;
     procedure LogProduccion(s: string);
     procedure Log(s: string);
     procedure LogIni(s: string);
     procedure LogFin(s: string);
     function DamePVPPorUdSecundaria(ID_A: integer): boolean;
     function ClienteValido(Cliente: integer): boolean;
     function ProveedorValido(Proveedor: integer): boolean;
     function AcreedorValido(Acreedor: integer): boolean;
     function PuedeHacerImputaciones: boolean;
     function DameCambio(ResultVer: boolean; MonedaOrigen, MonedaDestino: string; Fecha: TDateTime; Importe: double; Factor: double = 0): double;
     procedure SaldoAnticipo(Tipo: string; CodCliPro: integer; Fecha: TDateTime; var Saldo: double; var Moneda: string);
     function DameSignoUnidadArticulo(Articulo: string): string;
     function DameDecimalesUnidad(Tipo: string): integer;
     function DameDecimalesUnidadArticulo(Articulo: string): integer;
     function DameMascaraUnidades(Articulo: string): string;
     function DameUnidadesConFormato(Articulo: string; Unidades: double): string;
     procedure CargarClipboardTexto(s: string);
     procedure CargarClipboardImagen(Codigo: integer);
     function DamePrecioCosteArticulo(Articulo: string): double;
     function AceptaRECC(Tipo: string; Codigo: integer): boolean;
     procedure EstableceIdiomaCanal;
     function BusquedaArticulo(Descripcion, Almacen: string; Cliente: integer = 0; CampoNroSerie: TField = nil): string;
     function DameLoteSiguiente(id_a, RIG: integer; Tipo: string; IdDoc: integer = 0): string;
     function CrearLote(id_a: integer; Lote: string; Clasificacion: string = ''; Almacen: string = ''): integer;
     function ControlStockNegativoEmpresa: boolean;
     function DamePrecioTarifa(Tarifa, Articulo: string; Empresa: integer = 0): double;
     function DamePrecioTarifaBasiImponible(Tarifa, Articulo: string; Empresa: integer = 0): double;
     function DamePrecioMercado(id_a: integer): double;
     function DameLineaSiguiente(Tipo: string; IdDoc: integer): integer;
     function DamePedidoMinimoArticuloProveedor(id_a, proveedor: integer): double;
     function DamePrefijoArticulo(Modelo: string): string;
     function DameArticuloSegunMedidas(Modelo, TipoLona: string; Lineal, Salida: double): string;
     function ClienteBloqueado(Cliente: integer; Empresa: integer = 0): boolean;
     procedure MuestraAviso(Tipo: string; Id: integer; TipoDocumento: string);
     function ProveedorBloqueado(Proveedor: integer; Empresa: integer = 0): boolean;
     function AcreedorBloqueado(Acreedor: integer; Empresa: integer = 0): boolean;
     function DameFamiliaArticulo(Articulo: string; Empresa: integer = 0): string;
     function DameGrupoGrupoTalla(IdGrupoTalla: integer): string;
     function DameMinDireccion(Tercero: integer): integer;
     function DameMargenUtilidad(PrecioVenta, PrecioCoste: double): double;
     function DameTotalRecibosDocumento(IdS: integer): double;
     function DameIdModeloArticulo(id_a: integer): integer;
     function ArticuloBloqueado(Articulo: string; TipoDoc: string; Empresa: integer = 0): boolean;
     function DameFechaServidor: TDateTime;
     function DamePeriodo(Fecha: TDateTime; Tipo: integer = 1): string;
     function DameNombreComercialNIF(NIF: string): string;
     function DameTerceroNIF(NIF: string): integer;
     function DameNumeroAutorizacion(Tipo, Serie: string; Fecha: TDateTime): string;
     function DameLlaveDosificacion(Tipo, Autorizacion: string): string;
     function DameNumeroDosifiacion(Tipo, Autorizacion: string): integer;
     function DameEjercicioDoc(Tipo: string; IdDoc: integer): integer;
     procedure CambiaFechas(Desde, Hasta: TLFDateEdit; Accion: string);
     function DameRutaFicheroDeSincronizacion(Serie: string): string;
     function UtilizarInventarioPermanente(Empresa: integer = 0): boolean;
     procedure PedirFirma(Tipo: string; IdDoc: integer);
     procedure BorrarFirma(Tipo: string; IdDoc: integer);
     procedure ConectaAdjuntos;
     procedure DesConectaAdjuntos;
     procedure ConectaImagenes;
     procedure DesConectaImagenes;
     function DameDatosBancarios(Empresa, Ejercicio, Canal: integer; FormaPago: string; var Banco: integer): char;
     function DameTipoDocPaisDefecto(Pais: string): string;
     procedure DameDatosPais(Pais: string; var TituloRegion, TituloProvincia, TituloPoblacion: string);
     procedure VerificaDocumentoIdentificacion(Pais, TipoDoc, NumeroDocumento: string; var Valido: boolean; var MensajeError: string);
     function DameGiro(Tipo: string; Empresa: integer; Codigo: integer = 0): integer;
     function DameNivelDireccionPais(Pais: string): integer;
     function DameUrlEndPoint(Tipo: string): string;
     function DameModoIVACanal: integer;
     function DamePorcentajeIva(Pais: string; Tipo: integer): double;
     function DameNombreIva(Pais: string; Tipo: integer; Idioma: string = ''): string;
     function ExisteAdjunto(Tipo: string; ID: integer; Empresa: integer = 0): boolean;
     function DameIdFicheroAdjunto(Tipo: string; ID: integer; Fichero: string; Empresa: integer = 0): integer;
     function EnviarFacturasClientePorEmail(Cliente: integer; Empresa: integer = 0): boolean;
     function EnviarFacturasProvAcrePorEmail(Tercero: integer; Empresa: integer = 0): boolean;
     function DameTextoIdioma(Grupo: integer; Idioma: string): string;
     procedure ReestablecerConexiones(Rol: string);
     procedure Click2Call(Telefono: string);
     function TipoDocTributarioValido(TipoDoc, TipoDocTriburario: string): boolean;
     function ExisteDocumentoReferencia(ID_S: integer): boolean;
     function DameFolioDTE(ID_S: integer): integer;
     procedure CreaReferenciaDte(ID_S, CODREF, ID_S_REF: integer; FOLIOREF, TPODOCREF, RAZONREF, RUTOTR: string; FCHREF: TDateTime);
     function DameArticuloDesdeAlfa(Valor: string; Alfa: integer; Empresa: integer = 0): string;
     function DameAlfaArticulo(Articulo: string; Numero: integer): string;
     function DameAlfaProveedor(Proveedor, Numero: integer): string;
     function DameLoteSimple(Articulo: string; Fecha: TDateTime): string;
     function DameAlmacenDefectoArticulo(Articulo: string): string;
     function DameCodigoArticulo(FormatoCodigo, Familia, SubFamilia: string): string;
     function DameCertificado(Serie: string): string;
     function DameCliente(Empresa, IdCliente: integer): integer;
     function DameCodigoPostal(Pais, Titulo: string): string;
     function ExisteCodigoPostal(Pais, CodigoPostal: string): boolean;
     procedure RestingeEdicion(DataSet: TDataSet; Estado: integer);
     function DameGlosa(Tipo: integer; Codigo: string; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0): string;
     procedure ReNumerarOrdenDetalleVenta(ID_S: integer);
     function EjercicioActivo(Ejercicio: integer; Empresa: integer = 0): boolean;
     function UtilizaSII: boolean;
     function UtilizaTicketBAI: boolean;
     function UtilizaVerifactu: boolean;
     function FechaServicioPresentacionVerifactu: TDateTime;
     procedure EnviaMensajeUsuario(Usuario: integer; Mensaje: string);
     function ExisteDocumentoFolio(Rut, Folio, TipoDocTributario: string): boolean;
     function DameMotivoAbono(Codigo: integer): string;
     function DameMatriculaFichaTecnica(IdFichaTecnica: integer): string;
     function ExistePalabra(Palabra: string): boolean;
     procedure AgregarPalabra(Palabra, Origen: string);
     {$IFDEF Debug}
     function ServidorActivo: boolean;
     {$ENDIF}
     function DameID_Concepto(Concepto: string): integer;
     function DameCuentaBanco(Banco: integer): string;
     function DameValorTabla(Tabla, Condicion, CampoDevolver: string; Filtro: string = '0000'): string;
     function DameLREComuna(LRE: string): string;
     procedure GrabaExpedicion(IdALB, Bultos: integer; Peso: double; Expedicion, Prefijo: string; Fecha: TDateTime; Transportista: integer);
     procedure ValidacionTercero(Tercero: integer; var NIF, ResultadoValidacion, ResultadoValidacionNombre: string; var ResultadoFechaComprobacion: TDateTime);
     procedure ValidacionTerceroVarios(IdS: integer; var NIF, ResultadoValidacion, ResultadoValidacionNombre: string; var ResultadoFechaComprobacion: TDateTime);
     function DameFacturasAbiertas(Dias: integer): string;
     function DameAlbaranesAbiertos(Dias: integer): string;
     function DameOferasAbiertas(Dias: integer): string;
     function DamePedidosAbiertos(Dias: integer): string;
     function AccesoSeguroATransaction(DB: TFIBDatabase): TFIBTransaction;
     procedure EjecutarCargaImagen(Imagen: TImage; Codigo: integer);
     function GetRutaImagenTPV: string;
  end;

var
  DMMain : TDMMain;
  TSLNiveles : TStringList;

implementation

uses
  {$IFDEF Debug}
  UPing,
  {$ENDIF}
  UUtiles, UDameDato, UFMBaseDeDatos, UFFondo, UFAcerca, rxAppUtils,
  UFMUsuarioCuenta, ShellObjHelper, ShObjIdlQuot, ShellApi, IdHttp, WinInet,
  UFLogo, UParam, GraphicEx, Clipbrd, UDMNet2Phone, UFMain, StrUtils, DateUtils,
  UImagenes;

  {$R *.DFM}


function TDMMain.GetRutaImagenTPV: string;
begin
  Result := RutaImagenTPV;
end;

function TDMMain.AccesoSeguroATransaction(DB: TFIBDatabase): TFIBTransaction;
begin
  Result := DameTransactionRO(DB); // Llama a la función privada
end;

procedure TDMMain.EjecutarCargaImagen(Imagen: TImage; Codigo: integer);
begin
  UImagenes.ThreadCargaImagen.CargaImagen(Imagen, Codigo); // Llama a la privada
end;

function GetDefaultIniName: string;
begin
  Result := REntorno.FicheroINI;
end;

procedure TDMMain.DMMainCreate(Sender: TObject);
var
  NmMaquina, NmUsuario : array [0..255] of char;
  Long : cardinal;
  TomoIPLocal : boolean;
  i : integer;
  DS : TFIBDataSet;
  sr : TSearchRec;
begin
  TranslateComponent(Self); //IDIOMA_CODE

  Log('INICIO ---');
  LogIni('DMMainCreate');

  // Creo el thread para obtener imagenes
  ThreadCargaImagen := TLoadImageThread.Create;

  // Timero para desconectar base de adjuntos e imagenes despues de 1 minuto de inactividad
  TDesconexionBaseAdjunto.Enabled := False;
  TDesconexionBaseImagenes.Enabled := False;

  // Se crea una sola vez
  TSLNiveles := TStringList.Create;
  TituloUnidadMedida := TStringList.Create;

  PrimeraVez := True;
  TeclasLeidas := False;
  if (ILMain_in.Count = 0) then
  begin
     InicializaImagenes;
  end;

  // InicializaEntorno;

  // Nombre del ordenador
  Long := 256;
  GetComputerName(NmMaquina, Long);
  NombreMaquina := StrPas(NmMaquina);
  Log('NombreMaquina: ' + NombreMaquina);
  // Nombre del usuario Windows
  Long := 256;
  GetUserName(NmUsuario, Long);
  UsuarioWindows := StrPas(NmUsuario);
  Log('UsuarioWindows: ' + UsuarioWindows);

  RegistraEntrada;

  // Recojo datos del ordenador y luego calculo un hash para obtener un nro de serie de todo el ordenador
  // Win32_DISKDRIVE - PNPDeviceID
  // Win32_BIOS - SerialNumber
  // Win32_BaseBoard - SerialNumber
  // Win32_Processor - ProcessorId
  // Win32_OperatingSystem - SerialNumber
  DatosOrdenador := getWMIstring('', 'Win32_BIOS', 'SerialNumber') + ' - ' +
     getWMIstring('', 'Win32_BaseBoard', 'SerialNumber') + ' - ' +
     getWMIstring('', 'Win32_Processor', 'ProcessorId') + ' - ' +
     getWMIstring('', 'Win32_OperatingSystem', 'SerialNumber') + ' - ' +
     getWMIstring('', 'Win32_DISKDRIVE', 'PNPDeviceID');
  Log('DatosOrdenador (1): ' + DatosOrdenador);

  // La conexion puede tener uno de estos formatos
  //    192.168.152.250:/samba/bases/demomerge.fdb
  //    localhost:C:\Delfos\Datos\demomerge.fdb
  //    C:\Delfos\Datos\demomerge.fdb
  //    demomerge.fdb

  TomoIPLocal := False;
  IP_Servidor := Copy(DataBase.DBName, 1, Pos(':', DataBase.DBName) - 1);
  Log('IP_Servidor: ' + IP_Servidor);

  // No va por IP. Se asume que es local en el mismo directorio que la aplicacion (demomerge.fdb)
  if (Length(IP_Servidor) = 0) then
     TomoIPLocal := True
  else
  if (Length(IP_Servidor) = 1) then
  begin
     TomoIPLocal := True; // No va por IP. Es el nombre de la unidad de disco (C:)
     IP_Servidor := 'localhost';
  end
  else
  begin
     // Verifico que sea una direccion IP
     for i := 1 to Length(IP_Servidor) do
        if not (IP_Servidor[i] in ['0'..'9', '.']) then
           TomoIPLocal := True;

     { TODO -oDuilio : Habria que resolver el nombre y transformarlo en una IP (localhost: = 127.0.0.1:, LinuxDikram: = 192.168.152.250:) }
     // Asumo que es localhost. (localhost: = 127.0.0.1:)
     if ((not TomoIPLocal) and (DameIPLocal = IP_Servidor)) then
        TomoIPLocal := True;
  end;

  if TomoIPLocal then
     Log('TomoIPLocal: SI')
  else
     Log('TomoIPLocal: NO');

  if (not TomoIPLocal) then
     MACServidor := MySendARP(IP_Servidor)
  else
     // Aqui debemos buscar la MAC del equipo local
     MACServidor := DameMacLocal;
  Log('MACServidor: ' + MACServidor);

  // ShowMessage(Format('IP_Servidor: %s - MacServidor: %s - NombreMaquina: %s - UsuarioWindows %s', [IP_Servidor, MACServidor, NombreMaquina, UsuarioWindows]));

  DatosOrdenador := IP_Servidor + ' - ' + MACServidor + ' - ' + NombreMaquina + ' - ' + UsuarioWindows + ' - ' + DatosOrdenador;
  Log('DatosOrdenador (2): ' + DatosOrdenador);

  {$IFDEF Debug}
  {
  ShowMessage(MySendARP('127.0.0.1') + ' - MySendARP(127.0.0.1)' + #13#10 +
     MySendARP('localhost') + ' - MySendARP(localhost)' + #13#10 +
     DameMacLocal + ' - DameMacLocal');
  }
  {$ENDIF}

  OnGetDefaultIniName := GetDefaultIniName;
  FSLookAndFeel.RestoreFormPlacement;
  ComponentesEsc := TList.Create; // Unica
  SeparadorDecimal := '.'; {dji lrk kri - EDI}
  EstadoKri_Codigo := TStringList.Create;
  EstadoKri_Estado := TStringList.Create;
  Version_Demo := False;
  Fecha_Demo := EncodeDateTime(2013, 12, 31, 23, 59, 59, 999);
  {$IFDEF Demo}
  Version_Demo := True;
  {$ENDIF}

  UltimoAvisoMostrado := 0;
  ContadorLog := 0;
  OldTipoUnidad := '';
  UltimaUnidad := '';
  UltimoDecimales := 0;

  // Cache de descripciones de Situaciones de Ordenes de Produccion
  // Inicializamos
  for i := 0 to 4 do
     TituloSituacionProduccion[i] := '-';

  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Close;
        DataBase := Self.DataBase;
        Transaction := DameTransactionRO(Self.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT ESTADO, TITULO FROM PRO_SYS_ESTADO ');
           SelectSQL.Add(' ORDER BY ESTADO');
           Open;
           while not EOF do
           begin
              if (FieldByName('ESTADO').AsInteger <= 4) then
                 TituloSituacionProduccion[FieldByName('ESTADO').AsInteger] := FieldByName('TITULO').AsString;
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

  // Cache de descripciones de Estados de documentos
  // Inicializamos
  for i := 0 to 6 do
     TituloEstado[i] := '-';

  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Close;
        DataBase := Self.DataBase;
        Transaction := DameTransactionRO(Self.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT ESTADO, TITULO FROM SYS_GES_ESTADOS ');
           Open;
           while not EOF do
           begin
              if (FieldByName('ESTADO').AsInteger <= 6) then
                 TituloEstado[FieldByName('ESTADO').AsInteger] := FieldByName('TITULO').AsString;
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

  // Cache de descripciones de Unidades de Medida
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Close;
        DataBase := Self.DataBase;
        Transaction := DameTransactionRO(Self.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT TIPO, TITULO FROM SYS_UNIDADES_ARTICULOS ORDER BY TIPO ');
           Open;
           while not EOF do
           begin
              TituloUnidadMedida.Values[FieldByName('TIPO').AsString] := FieldByName('TITULO').AsString;

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

  // Calculo directorio temporal (%LOCALAPPDATA%\Merge\ImgMapa)
  RutaImagenTPV := IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_LOCAL_APPDATA, False));

  if not DirectoryExists(RutaImagenTPV + REntorno.NombreAplicacion) then
     CreateDir(RutaImagenTPV + REntorno.NombreAplicacion);
  RutaImagenTPV := IncludeTrailingPathDelimiter(RutaImagenTPV + REntorno.NombreAplicacion);

  if not DirectoryExists(RutaImagenTPV + 'ImgTPV') then
     CreateDir(RutaImagenTPV + 'ImgTPV');
  RutaImagenTPV := IncludeTrailingPathDelimiter(RutaImagenTPV + 'ImgTPV');

  Log('Borro las 10 imagenes mas viejas de la cache');
  // Borro las 10 imagenes mas viejas de la cache
  i := 0;
  if FindFirst(RutaImagenTPV + 'TMPIMG_*.*', SysUtils.faAnyFile, sr) = 0 then
  begin
     repeat
        Inc(i);
        Log('   ' + format('%d - %s', [i, sr.Name]));
        if (FileDateToDateTime(sr.Time) < Now - 30) then
           DeleteFile(REntorno.RutaEXE + sr.Name);
     until (i > 10) or (FindNext(sr) <> 0);
     FindClose(sr);
  end;
  LogFin('DMMainCreate');
end;

procedure TDMMain.Busca(Busca: string; Tabla: TFIBTableSet; CampoNum, CampoTit: string; Filtro: string = '00000'; Orden: string = '');
var
  TmpStr, WhereAnd : string;
  x : integer;
  FIsNum : boolean;
begin
  TmpStr := Busca;
  FIsNum := IsNum(TmpStr);
  WhereAnd := ' where ';
  if Length(Busca) = 0 then
     Exit;
  with Tabla do
  begin
     Close;
     SelectSQL := CopiaSelectSQL;
     // Si ya hay un Order By lo quita
     for x := SelectSQL.Count - 1 downto 0 do
        if Pos('ORDER BY', UpperCase(SelectSQL[x])) <> 0 then
        begin
           SelectSQL.Delete(x);
        end;
     // Si ya hay un where no pone otro where sino un AND
     for x := 0 to SelectSQL.Count - 1 do
        if Pos('WHERE', UpperCase(SelectSQL[x])) <> 0 then
        begin
           WhereAnd := ' AND ';
           Break;
        end;

     // Añadimos la búsqueda ( Helio )
     if FIsNum then
        SelectSQL.Add(WhereAnd + CampoNum + ' LIKE ''' + Busca + '%''')
     else
        SelectSQL.Add(WhereAnd + CampoTit + ' LIKE ''' + Busca + '%''');

     // Ponemos la linea de orden si hay algún orden
     SelectSQL.Add('ORDER BY ');
     if Orden <> '' then
        SelectSQL.Add(Orden)
     else if FIsNum then
        SelectSQL.Add(CampoNum)
     else
        SelectSQL.Add(CampoTit);

     FiltraTabla(Tabla, Filtro, False);
     Open;
  end;
end;

procedure TDMMain.BuscaRO(Busca: string; Tabla: TFIBTableSetRO; CampoNum, CampoTit: string; Filtro: string = '00000'; Orden: string = '');
var
  TmpStr, WhereAnd : string;
  x : integer;
  FIsNum : boolean;
begin
  TmpStr := Busca;
  FIsNum := IsNum(TmpStr);
  WhereAnd := ' where ';
  if Length(Busca) = 0 then
     Exit;
  with Tabla do
  begin
     Close;
     SelectSQL := CopiaSelectSQL;
     // Si ya hay un Order By lo quita
     for x := SelectSQL.Count - 1 downto 0 do
        if Pos('ORDER BY', UpperCase(SelectSQL[x])) <> 0 then
        begin
           SelectSQL.Delete(x);
        end;
     // Si ya hay un where no pone otro where sino un AND
     for x := 0 to SelectSQL.Count - 1 do
        if Pos('WHERE', UpperCase(SelectSQL[x])) <> 0 then
        begin
           WhereAnd := ' and ';
           Break;
        end;

     // Añadimos la búsqueda ( Helio )
     if FIsNum then
        SelectSQL.Add(WhereAnd + CampoNum + ' LIKE ''' + Busca + '%''')
     else
        SelectSQL.Add(WhereAnd + CampoTit + ' LIKE ''' + Busca + '%''');

     // Ponemos la linea de orden si hay algún orden
     SelectSQL.Add('ORDER BY ');
     if Orden <> '' then
        SelectSQL.Add(Orden)
     else if FIsNum then
        SelectSQL.Add(CampoNum)
     else
        SelectSQL.Add(CampoTit);

     FiltraRO(Tabla, Filtro, False);
     Open;
  end;
end;

procedure TDMMain.LeerTeclas(Forzar: boolean = False);
var
  DS : TFIBDataSet;
begin
  if (not TeclasLeidas) or Forzar then
  begin
     // Se obtienen las teclas de la base de datos
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Close;
           DataBase := Self.DataBase;
           Transaction := DameTransactionRO(Self.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Text := 'SELECT TECLA, COMBINACION FROM S_LEE_TECLAS(:USUARIO)';
              Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
              Open;
              while not EOF do
              begin
                 Teclas.SetNumTecla(FieldByName('TECLA').AsInteger, FieldByName('COMBINACION').AsInteger);
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
     TeclasLeidas := True;
  end;
end;

procedure TDMMain.InicializaImagenes;
var
  clazz : TPersistentClass;
  h : HModule;
begin
  if (not Assigned(FDMImageList)) and (not FindCmdLineSwitch('nobpl', ['/', '-'], True)) then
  begin
     try
        h := LoadPackage('ImageList.bpl');
        try
           clazz := GetClass('TDMImageList');
           if clazz <> nil then
           begin
              FDMImageList := TDataModule(TComponentClass(clazz).Create(Self));
              try
                 ILMain_in.AddImages(TImageList(FDMImageList.FindComponent('ILMain_In')));
                 DMMain.Log(Format('ILMain_In.Count: %d', [ILMain_In.Count]));
                 ILMain_ac.AddImages(TImageList(FDMImageList.FindComponent('ILMain_ac')));
                 DMMain.Log(Format('ILMain_ac.Count: %d', [ILMain_ac.Count]));
                 ILOrdGrid.AddImages(TImageList(FDMImageList.FindComponent('ILOrdGrid')));
                 DMMain.Log(Format('ILOrdGrid.Count: %d', [ILOrdGrid.Count]));
                 ToolbarImages.AddImages(TImageList(FDMImageList.FindComponent('ToolbarImages')));
                 DMMain.Log(Format('ToolbarImages.Count: %d', [ToolbarImages.Count]));
                 ILOrdenFabricacion.AddImages(TImageList(FDMImageList.FindComponent('ILOrdenFabricacion')));
                 DMMain.Log(Format('ILOrdenFabricacion.Count: %d', [ILOrdenFabricacion.Count]));
                 ILTPV_Ac.AddImages(TImageList(FDMImageList.FindComponent('ILTPV_Ac')));
                 DMMain.Log(Format('ILTPV_Ac.Count: %d', [ILTPV_Ac.Count]));
                 ILTPV_In.AddImages(TImageList(FDMImageList.FindComponent('ILTPV_In')));
                 DMMain.Log(Format('ILTPV_In.Count: %d', [ILTPV_In.Count]));
              finally
                 FreeAndNil(FDMImageList);
              end;
           end;
        finally
           UnLoadPackage(h);
        end;
     except
        on E: Exception do
           DMMain.Log('Error InicializaImagenes' + #13#10 + E.Message);
     end;
  end;
end;

procedure TDMMain.AjustaImagenes;
var
  clazz : TPersistentClass;
  h : HModule;
begin
  if (not Assigned(FDMImageList)) and (not FindCmdLineSwitch('nobpl', ['/', '-'], True)) then
  begin
     try
        h := LoadPackage('ImageList.bpl');
        try
           clazz := GetClass('TDMImageList');
           if clazz <> nil then
           begin
              FDMImageList := TDataModule(TComponentClass(clazz).Create(Self));
              try
                 ILMain_in.Clear;
                 if REntorno.IconosSimples then
                    ILMain_in.AddImages(TImageList(FDMImageList.FindComponent('ILMain_In')))
                 else
                    ILMain_in.AddImages(TImageList(FDMImageList.FindComponent('ILMain_ac')));
                 DMMain.Log(Format('ILMain_In.Count: %d', [ILMain_In.Count]));
              finally
                 FreeAndNil(FDMImageList);
              end;
           end;
        finally
           UnLoadPackage(h);
        end;
     except
        on E: Exception do
           DMMain.Log('Error AjustaImagenes' + #13#10 + E.Message);
     end;
  end;
end;

procedure TDMMain.DesConecta;
begin
  DesConectaAdjuntos;
  DesConectaImagenes;

  if (DataBase.Connected) then
     DataBase.Close;
end;

procedure TDMMain.Conecta;
var
  SePudo : boolean;
begin
  SePudo := True;
  with DataBase do
  begin
     try
        // Probamos conexion con el usuario DELFOS
        if not TestConnected then
        begin
           DBName := REntorno.BaseDeDatos;
           DBParams.Clear;
           DBParams.Values['user_name'] := REntorno.UsuarioBD;
           DBParams.Values['password'] := REntorno.ClaveBD;
           if (REntorno.CharsetBD <> '') then
              DBParams.Values['lc_ctype'] := REntorno.CharsetBD;
           if (REntorno.RolBD <> '') then
              DBParams.Values['sql_role_name'] := REntorno.RolBD;
           Log(format('Conectando. user_name: %s, password: %s, sql_role_name: %s', [DBParams.Values['user_name'], DBParams.Values['password'], DBParams.Values['sql_role_name']]));
           Open;
        end;
     except
        on e: Exception do
        begin
           SePudo := False;
           try
              if (Assigned(FLogo)) then
                 FLogo.Hide;
           except
           end;
           LogProduccion('   ' + Format(_('Imposible abrir %s' + #13#10 + 'user_name: %s, sql_role_name: %s.') + #13#10 + e.Message, [REntorno.BaseDeDatos, REntorno.UsuarioBD, REntorno.RolBD]));
           ShowMessage(Format(_('Imposible abrir %s' + #13#10 + 'user_name: %s, sql_role_name: %s.') + #13#10 + e.Message, [REntorno.BaseDeDatos, REntorno.UsuarioBD, REntorno.RolBD]));
        end;
     end;
  end;

  if not SePudo then
     Application.Terminate;

  // ThreadCargaImagen.ConectaBD(DataBase);
  {tlocal
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  }

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Add(' SELECT BASE_ADJUNTOS, USUARIO_BASE_ADJUNTOS, CLAVE_BASE_ADJUNTOS, ROL_BASE_ADJUNTOS, CHARSET_BASE_ADJUNTOS, RUTA_ADJUNTOS, ');
        SQL.Add('        BASE_IMAGENES, USUARIO_BASE_IMAGENES, CLAVE_BASE_IMAGENES, ROL_BASE_IMAGENES, CHARSET_BASE_IMAGENES, RUTA_IMAGENES ');
        SQL.Add(' FROM SYS_CONSTANTES ');
        ExecQuery;
        REntorno.BaseDeDatosAdjuntos := FieldByName['BASE_ADJUNTOS'].AsString;
        REntorno.UsuarioBDAdjuntos := FieldByName['USUARIO_BASE_ADJUNTOS'].AsString;
        REntorno.ClaveBDAdjuntos := FieldByName['CLAVE_BASE_ADJUNTOS'].AsString;
        REntorno.RolBDAdjuntos := FieldByName['ROL_BASE_ADJUNTOS'].AsString;
        REntorno.CharsetBDAdjuntos := FieldByName['CHARSET_BASE_ADJUNTOS'].AsString;
        REntorno.RutaFicheros := FieldByName['RUTA_ADJUNTOS'].AsString;
        REntorno.BaseDeDatosImagenes := FieldByName['BASE_IMAGENES'].AsString;
        REntorno.UsuarioBDImagenes := FieldByName['USUARIO_BASE_IMAGENES'].AsString;
        REntorno.ClaveBDImagenes := FieldByName['CLAVE_BASE_IMAGENES'].AsString;
        REntorno.RolBDImagenes := FieldByName['ROL_BASE_IMAGENES'].AsString;
        REntorno.CharsetBDImagenes := FieldByName['CHARSET_BASE_IMAGENES'].AsString;
        // REntorno.RutaFicherosImagenes := FieldByName['RUTA_IMAGENES'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Trim(REntorno.RutaFicheros) > '') then
     REntorno.RutaFicheros := IncludeTrailingPathDelimiter(Trim(REntorno.RutaFicheros));
  {
  if (Trim(REntorno.RutaFicheros) > '') then
     REntorno.RutaFicheros := IncludeTrailingPathDelimiter(Trim(REntorno.RutaFicherosImagenes));
  }

  ConectaAdjuntos;
  ConectaImagenes;

  // Control de Firebird.
  if (Database.ODSMajorVersion < 10) then
  begin
     MessageDlg(_('ATENCIÓN: No es posible ejecutar la aplicacion sin un servidor de Firebird.' +
        #13#10 + 'Por favor, desinstale Interbase e instale Firebird.'),
        mtWarning, [mbOK], 0);
     try
        begin
           if Database.TestConnected then
              Database.Close;
           Application.Terminate;
        end;
     except
        Application.Terminate;
     end;
  end;
end;

procedure TDMMain.ConectaAdjuntos;
begin
  if (REntorno.BaseDeDatosAdjuntos <> '') then
  begin
     with DataBaseAdjuntos do
     begin
        try
           // Probamos conexion con el usuario DELFOS
           if not TestConnected then
           begin
              DBName := REntorno.BaseDeDatosAdjuntos;
              DBParams.Clear;
              DBParams.Values['user_name'] := REntorno.UsuarioBDAdjuntos;
              DBParams.Values['password'] := REntorno.ClaveBDAdjuntos;
              if (REntorno.CharsetBDAdjuntos > '') then
                 DBParams.Values['lc_ctype'] := REntorno.CharsetBDAdjuntos;
              if (REntorno.RolBDAdjuntos <> '') then
                 DBParams.Values['sql_role_name'] := REntorno.RolBDAdjuntos;
              Log(format('ConectaAdjuntos. user_name: %s, password: %s, sql_role_name: %s', [DBParams.Values['user_name'], DBParams.Values['password'], DBParams.Values['sql_role_name']]));
              Open;
           end;

           // Reset de timer para desconectar base de adjuntos despues de 1 minuto de inactividad
           TDesconexionBaseAdjunto.Enabled := False;
           TDesconexionBaseAdjunto.Enabled := True;

           if not TLocalAdjuntos.InTransaction then
              TLocalAdjuntos.StartTransaction;
        except
           on e: Exception do
           begin
              ShowMessage(Format(_('Imposible abrir base de datos adjuntos %s' + #13#10 + 'user_name: %s, sql_role_name: %s.') + #13#10 + e.Message, [REntorno.BaseDeDatosAdjuntos, REntorno.UsuarioBDAdjuntos, REntorno.RolBDAdjuntos]));
           end;
        end;
     end;
  end;
end;

procedure TDMMain.DesConectaAdjuntos;
begin
  if (DataBaseAdjuntos.Connected) then
     DataBaseAdjuntos.Close;
end;

procedure TDMMain.ConectaImagenes;
begin
  if (REntorno.BaseDeDatosImagenes <> '') then
  begin
     with DataBaseImagenes do
     begin
        try
           // Probamos conexion con el usuario DELFOS
           if not TestConnected then
           begin
              DBName := REntorno.BaseDeDatosImagenes;
              DBParams.Clear;
              DBParams.Values['user_name'] := REntorno.UsuarioBDImagenes;
              DBParams.Values['password'] := REntorno.ClaveBDImagenes;
              if (REntorno.CharsetBDImagenes > '') then
                 DBParams.Values['lc_ctype'] := REntorno.CharsetBDImagenes;
              if (REntorno.RolBDImagenes <> '') then
                 DBParams.Values['sql_role_name'] := REntorno.RolBDImagenes;
              Log(format('ConectaImagenes. user_name: %s, password: %s, sql_role_name: %s', [DBParams.Values['user_name'], DBParams.Values['password'], DBParams.Values['sql_role_name']]));
              Open;
           end;

           // Reset de timer para desconectar base de imagenes despues de 1 minuto de inactividad
           TDesconexionBaseImagenes.Enabled := False;
           TDesconexionBaseImagenes.Enabled := True;

           if not TLocalImagenes.InTransaction then
              TLocalImagenes.StartTransaction;
        except
           on e: Exception do
           begin
              try
                 if (Assigned(FLogo)) then
                    FLogo.Hide;
              except
              end;
              ShowMessage(Format(_('Imposible abrir base de datos imagenes %s' + #13#10 + 'user_name: %s, sql_role_name: %s.') + #13#10 + e.Message, [REntorno.BaseDeDatosImagenes, REntorno.UsuarioBDImagenes, REntorno.RolBDImagenes]));
           end;
        end;
     end;

     { TODO : Esto da error con imagenes en bases separadas }
     {
     try
        ThreadCargaImagen.ConectaBDImg(DataBaseImagenes);
     except
       on e:Exception do
          Log('Error al conectar ThreadCargaImagen.ConectaBDImg'+#13#10+e.Message);
     end;
     }
  end;
end;

procedure TDMMain.DesConectaImagenes;
begin
  if (DataBaseImagenes.Connected) then
     DataBaseImagenes.Close;
end;

procedure TDMMain.RegistraEntrada;
begin
  Leeini;
  if (PrimeraVez) and (REntorno.Servidores = 1) then
  begin
     PrimeraVez := False;
     if (Trim(REntorno.BaseDeDatos) = '') then
     begin
        Desconecta;
        try
           if (Assigned(FLogo)) then
              FLogo.Hide;
        except
        end;
        TFMBaseDeDatos.Create(Self).ShowModal;
     end;
  end
  else
  begin
     Desconecta;
     try
        if (Assigned(FLogo)) then
           FLogo.Hide;
     except
     end;
     TFMBaseDeDatos.Create(Self).ShowModal;
  end;

  Conecta;

  // No necesitamos impresoras si estamos en modo desatendido
  // if not ((FMain.SincronizacionPureWorks) or (FMain.SincronizacionPrestashop) or (FMain.SincronizacionWoocommerce) or (FMain.SincronizacionSellforege) or (FMain.PonderaArticulos) or (FMain.ActualizaPMPArticulos)) then
  {
  begin
    LogProduccion('   Cargamos la impresora');
    // Cargamos la impresora
    try
       if (REntorno.Laser >= 0) then
          frHYReport1.ChangePrinter(-1, REntorno.Laser)
       else
       begin
          frHYReport1.ChangePrinter(-1, 0);
          REntorno.Laser := 0;
       end;
    except
       frHYReport1.ChangePrinter(-1, 0);
       REntorno.Laser := 0;
    end;
  end;
  }

  EscribeIni;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE LOG_ENTRADAS_ALTA (?MAQUINA, ?LOGIN, ?OS)';
        Params.ByName['MAQUINA'].AsString := Copy(NombreMaquina, 1, 31);
        Params.ByName['LOGIN'].AsString := Copy(UsuarioWindows, 1, 31);
        Params.ByName['OS'].AsString := REntorno.Sistema;
        ExecQuery;
        REntorno.Entrada := FieldByName['ENTRADA'].AsInteger;
        REntorno.FechaTrab := FieldByName['FECHA'].AsDateTime;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.ValidaEntrada: boolean;
var
  Clave : string;
  ResultadoValidacion, Mensaje : string;
  Licencia, EmailLicencia : string;
  Accesos, i : integer;

  function ValidaLicencia: string;
  var
     HTMLBody : string;
     IdHTTP : TIdHTTP;
     Peticion : string;
     UltimaValidacion : TDateTime;
     LicenciaNueva : boolean;
  begin
     // Conectamos a http://www.dikram.es/ControlLicencias.php/...
     // o http://delfos-online.com/delcloud/ControlLicencias.php/...
     // Enviamos licencia, usuario, nro serie ordenador, info
     // Nos devolvera la validez de la licenia
     // R_0 = Habilitado para iniciar sesión
     // R_1 = La licencia no existe
     // R_2 = Licencia caducada
     // R_3 = La MAC del servidor no es correcta
     // R_4 = Se ha superado la cantidad de usuarios permitidos por la licencia.
     // R_5 = El usuario esta inactivo
     // R_6 = El producto no existe
     Result := '';
     Licencia := '';
     LicenciaNueva := False;
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'SELECT LICENCIA, /*EMAIL_LICENCIA,*/ ULTIMA_VALIDACION_LICENCIA FROM SYS_CONSTANTES';
           ExecQuery;
           Licencia := FieldByName['LICENCIA'].AsString;
           // EmailLicencia := FieldByName['EMAIL_LICENCIA'].AsString;
           UltimaValidacion := FieldByName['ULTIMA_VALIDACION_LICENCIA'].AsDateTime;
           FreeHandle;
        finally
           Free;
        end;
     end;
     EmailLicencia := DameEmailLicencia;

     Log('Licencia (BD): ' + Licencia + '(' + Copy(Licencia, Length(Licencia) - 8 + 1, Length(Licencia)) + ')');
     // Si no tiene una licencia o es nula, la genero y la aplico a la base
     // El servidor de licencias la creara con 30 dias de validez
     if (Licencia = '') or (Copy(Licencia, Length(Licencia) - 8 + 1, Length(Licencia)) = '00000000') then
     begin
        LicenciaNueva := True;
        {$IFDEF AdmXXI}
        // Administra XXI
        Licencia := 'AXXI' + CalcCRC32Str(MACServidor + DataBase.DBName + DateTimeToStr(Now));
        {$ENDIF}
        {$IFNDEF AdmXXI}
        // Merge / MaxFactu
        Licencia := 'DLFS' + CalcCRC32Str(MACServidor + DataBase.DBName + DateTimeToStr(Now));
        {$ENDIF}
     end;
     Log('Licencia: ' + Licencia);

     // ¿Estamos conectados a Internet?
     if WinInet.InternetGetConnectedState(nil, 0) then
     begin
        IdHTTP := TIdHTTP.Create(Application);
        try
           {$IFDEF AdmXXI}
           // Peticion := 'http://www.dikram.es/ControlLicencias.php/?producto=' + 'AdministraXXI' + '&licencia=' + EscapeURL(Licencia) + '&email_licencia=' + EscapeURL(EmailLicencia) + '&usuario=' + EscapeURL(REntorno.Nombre) + '&num_serie=' + EscapeURL(MACServidor) + '&info=' + EscapeURL(DatosOrdenador);
           Peticion := 'http://g2k.abox.com/ControlLicencias.php/?producto=' + 'AdministraXXI' + '&licencia=' + EscapeURL(Licencia) + '&email_licencia=' + EscapeURL(EmailLicencia) + '&usuario=' + EscapeURL(REntorno.Nombre) + '&num_serie=' + EscapeURL(MACServidor) + '&info=' + EscapeURL(DatosOrdenador);
           {$ENDIF}

           {$IFNDEF AdmXXI}
           Peticion := 'http://delfos-online.com/delcloud/ControlLicencias.php/?producto=' + 'DELFOS' + '&licencia=' + EscapeURL(Licencia) + '&email_licencia=' + EscapeURL(EmailLicencia) + '&usuario=' + EscapeURL(REntorno.Nombre) + '&num_serie=' + EscapeURL(MACServidor) + '&info=' + EscapeURL(DatosOrdenador);
           {$ENDIF}

           {$IFDEF Debug}
           Peticion := 'http://delfos-online.com/delcloud/ControlLicencias.php/?producto=' + 'DELFOS' + '&licencia=' + EscapeURL(Licencia) + '&email_licencia=' + EscapeURL(EmailLicencia) + '&usuario=' + EscapeURL(REntorno.Nombre) + '&num_serie=' + EscapeURL(MACServidor) + '&info=' + EscapeURL(DatosOrdenador);
           {$ENDIF}

           Log('Peticion: ' + Peticion);
           try
              HTMLBody := IdHTTP.Get(Peticion);
              // Limpio caracteres raros
              HTMLBody := StringReplace(HTMLBody, '?', '', [rfReplaceAll]);

              Log('Respuesta: ' + HTMLBody);
           except
              on e: Exception do
              begin

                 ShowMessage(_('Error validando licencia:') + #13#10 + e.message);

                 HTMLBody := '404';
              end;
           end;
           // Esta web devuelve : 'R_0, R_1, R_2, ...'
           Result := Trim(HTMLBody);
        finally
           IdHTTP.Free;
        end;
     end;
     Log('Validacion Licencia: ' + Result);

     if ((Result = 'R_0') or (LicenciaNueva)) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := Self.DataBase;
              SQL.Add(' UPDATE SYS_CONSTANTES SET ');
              if (LicenciaNueva) then
                 SQL.Add(' LICENCIA = ?LICENCIA, ');
              SQL.Add(' ULTIMA_VALIDACION_LICENCIA=''NOW'' ');
              if (LicenciaNueva) then
                 Params.ByName['LICENCIA'].AsString := Licencia;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     // Si hubo un error y no obtengo un resultado valido, permito el acceso durante ocho dias
     if ((Result < 'R_0') or (Result > 'R_6')) then
        if (UltimaValidacion + 8 > Now) then
           Result := 'R_0';
  end;

begin
  Result := False;
  ResultadoValidacion := '';
  REntorno.Usuario := 0;
  Clave := '';

  if ((REntorno.Nombre <> '')) then
  begin
     try
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := Self.DataBase;
              SQL.Text := 'SELECT * FROM LOG_ENTRADAS_VALIDA_SA (?NOMBRE, ?ENTRADA)';
              Params.ByName['NOMBRE'].AsString := REntorno.Nombre;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              ExecQuery;

              if (FieldByName['USUARIO'].AsInteger > 0) then
              begin
                 REntorno.Usuario := FieldByName['USUARIO'].AsInteger;
                 Clave := FieldByName['CLAVE'].AsString;
                 REntorno.Nivel := FieldByName['NIVEL'].AsInteger; //<- La restricción equivale al nivel de acceso
                 REntorno.Restriccion := FieldByName['NIVEL'].AsInteger; //<- La restricción equivale al nivel de acceso
                 REntorno.Empresa := FieldByName['EMPRESA'].AsInteger;
                 REntorno.Ejercicio := FieldByName['EJERCICIO'].AsInteger;
                 REntorno.Canal := FieldByName['CANAL'].AsInteger;
                 REntorno.IconosSimples := FieldByName['ICONOS'].AsInteger = 1;
                 REntorno.FechaTrab := FieldByName['FECHA'].AsDateTime;
                 REntorno.Memorizar_Fecha := FieldByName['MEMORIZAR'].AsInteger = 1;
                 REntorno.Moneda := FieldByName['MONEDA'].AsString;
                 REntorno.Pais := FieldByName['PAIS'].AsString;
                 REntorno.Menu_Left := FieldByName['MENU_LEFT'].AsInteger;
                 REntorno.Menu_Top := FieldByName['MENU_TOP'].AsInteger;
                 REntorno.Perfil := FieldByName['PERFIL'].AsString;
                 REntorno.MonedaEmpresa := FieldByName['MONEDAEMPRESA'].AsString;
                 REntorno.User_Profile := FieldByName['USER_PROFILE'].AsInteger;
                 REntorno.Pgc := FieldByName['PGC'].AsInteger;
                 REntorno.SMTP := Trim(FieldByName['SMTP_SERVIDOR'].AsString);
                 REntorno.Port := FieldByName['SMTP_PUERTO'].AsInteger;
                 REntorno.UserID := Trim(FieldByName['SMTP_USUARIO'].AsString);
                 REntorno.Password := Trim(FieldByName['SMTP_PASSWORD'].AsString);
                 REntorno.Identificacion := (FieldByName['SMTP_AUTENTIFICAR'].AsInteger = 1);
                 REntorno.AutenticacionTLS := (FieldByName['SMTP_TSL'].AsInteger = 1);
                 REntorno.VerSoloArticulosDisponibles := (FieldByName['VER_SOLO_ART_DISPONIBLE'].AsInteger = 1);
                 REntorno.GuardaFiltros := (FieldByName['GUARDA_FILTROS'].AsInteger = 1);
                 REntorno.DatosAbiertos := (FieldByName['DATOS_ABIERTOS'].AsInteger = 1);

                 try
                    REntorno.ModoCierraForm := FieldByName['MODO_CIERRA_FORM'].AsInteger;
                    REntorno.ModoEnter := FieldByName['MODO_ENTER'].AsInteger;
                    CE_Color_Activo := FieldByName['COLOR_NAV_ACTIVO'].AsInteger;
                    CE_Color_Inactivo := FieldByName['COLOR_NAV_INACTIVO'].AsInteger;
                    CE_Menu_1_Off := FieldByName['COLOR_MENU_1_OFF'].AsInteger;
                    CE_Menu_1_On := FieldByName['COLOR_MENU_1_ON'].AsInteger;
                    CE_Menu_2_Off := FieldByName['COLOR_MENU_2_OFF'].AsInteger;
                    CE_Menu_2_On := FieldByName['COLOR_MENU_2_ON'].AsInteger;
                    REntorno.ColorEnlaceActivo := FieldByName['COLOR_ENLACE_ACTIVO'].AsInteger;
                    REntorno.ColorCampoID := FieldByName['COLOR_CAMPO_ID'].AsInteger;
                 except
                    //...
                 end;
              end;

              FreeHandle;
           finally
              Free;
           end;
        end;
     except
        on e: Exception do
        begin
           REntorno.Usuario := 0;
           ShowMessage(_('Error validando entrada') + #13#10 + e.Message);
        end;
     end;
  end;

  // Si la autentificación de usuario es correcta comprobamos usuarios concurrentes
  if (REntorno.Usuario > 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Add('SELECT ACCESOS FROM SYS_CONSTANTES');
           ExecQuery;
           Accesos := FieldByName['ACCESOS'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Comprobamos la cantidad de conexiones a la base de datos concurrentes.
     if (Accesos > 0) then
     begin
        i := 0;
        Mensaje := '';
        with TFIBDataSet.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              Transaction := DameTransactionRO(DMMain.DataBase);
              try
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;
                 SelectSQL.Add(' SELECT MON$REMOTE_ADDRESS, CAST(MON$TIMESTAMP AS DATE) MON$TIMESTAMP, MON$USER, MON$ROLE, MON$REMOTE_PROCESS ');
                 SelectSQL.Add(' FROM MON$ATTACHMENTS ');
                 SelectSQL.Add(' WHERE ');
                 SelectSQL.Add(' MON$SYSTEM_FLAG = 0 ');
                 SelectSQL.Add(' ORDER BY MON$TIMESTAMP ');
                 Open;

                 while not EOF do
                 begin
                    // Solo cuento las conexiones desde esta aplicación.
                    // Evito contar las conexionces desde Utilidades, Relojes, ODBC, etc.
                    if (UpperCase(ExtractFileName(FieldByName('MON$REMOTE_PROCESS').AsString)) = UpperCase(ExtractFileName(Application.ExeName))) then
                    begin
                       Inc(i);
                       Mensaje := Mensaje + #13#10 + Format(_('Direccion: %s, Conexion: %s'), [FieldByName('MON$REMOTE_ADDRESS').AsString, DateTimeToStr(FieldByName('MON$TIMESTAMP').AsDateTime)]);
                    end;
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

        if (i > Accesos) then
        begin
           REntorno.Usuario := 0;
           MessageDlg(_('Se ha superado la cantidad de conexiones concurrentes.' + Mensaje), mtError, [mbOK], 0);
        end;
     end;
  end;

  if (REntorno.Usuario > 0) then
  begin
     if (Clave <> REntorno.Clave) then
     begin
        REntorno.Usuario := 0;
     end;
  end;

  if (REntorno.Usuario > 0) then
  begin
     // Se asigna el entorno de Busqueda
     AsignaEntornoBusqueda;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'SELECT CUENTA_NUNCA_CADUCA, CUENTA_DESHABILITADA, FECHA_CAMBIO_PASSW, DIAS_CADUCIDAD FROM SYS_USUARIOS WHERE USUARIO=?USUARIO';
           Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
           ExecQuery;

           // Comprobamos si la cuenta está deshabilitada
           if (FieldByName['CUENTA_DESHABILITADA'].AsInteger = 1) then
           begin
              MessageDlg(_('Su cuenta está desactivada. Póngase en contacto con el administrador de su sistema.'),
                 mtWarning, [mbOK], 0);
              REntorno.Usuario := 0;
           end
           else
           begin
              // Comprobamos si la cuenta ha caducado
              if (FieldByName['CUENTA_NUNCA_CADUCA'].AsInteger = 0) and
                 (REntorno.FechaTrab >= (FieldByName['FECHA_CAMBIO_PASSW'].AsDateTime + FieldByName['DIAS_CADUCIDAD'].AsInteger)) then
                 if MessageDlg(_('Su cuenta de usuario ha caducado. ¿Desea cambiar su clave?'),
                    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                 begin
                    TFMUsuarioCuenta.Create(Self).MuestraUsuario(REntorno.Usuario, 1);
                    Clave := REntorno.Clave;
                 end
                 else
                    REntorno.Usuario := 0;
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  // Si llego aqui el usuario esta activo
  if (REntorno.Usuario > 0) then
     EstableceIdiomaCanal;

  // Si el usuario es valido en el sistema, validamos a travez de internet
  if (REntorno.Usuario > 0) then
  begin
        {$IFNDEF Debug}
     ResultadoValidacion := ValidaLicencia;
        {$ENDIF}

        {$IFDEF Debug}
        ResultadoValidacion := 'R_0';
        {$ENDIF}

     // Una vez se empiece a controlar con el control de licencias, se debe borrar esta linea
     // ResultadoValidacion := 'R_0';

     if (ResultadoValidacion <> 'R_0') then
     begin
        if (ResultadoValidacion = 'R_1') then
           Mensaje := _('La licencia no existe')
        else
        if (ResultadoValidacion = 'R_2') then
           Mensaje := _('Licencia caducada.')
        else
        if (ResultadoValidacion = 'R_3') then
           Mensaje := _('La MAC del servidor no es correcta')
        else
        if (ResultadoValidacion = 'R_4') then
           Mensaje := _('Se ha superado la cantidad de usuarios permitidos por la licencia')
        else
        if (ResultadoValidacion = 'R_5') then
           Mensaje := _('El usuario esta inactivo')
        else
        if (ResultadoValidacion = 'R_6') then
           Mensaje := _('El producto no existe')
        else
           Mensaje := Format(_('Error de validación: %s'), [ResultadoValidacion]);

        ShowMessage(Mensaje + #13#10 + #13#10 + _('Usuario') + ': ' + REntorno.Nombre + #13#10 + _('Licencia') + ': ' + DameLicencia + #13#10 + _('MAC') + ': ' + MacServidor + #13#10 + _('Correo') + ': ' + DameEmailLicencia);
     end;
  end;

  if ((REntorno.Usuario > 0) and (Clave = REntorno.Clave) and (ResultadoValidacion = 'R_0')) then
  begin
     RegeneraControl;
     AjustaImagenes;
     CreaRegistroPresenciaEntrada;
     Result := True;
  end;
end;

procedure TDMMain.DMMainDestroy(Sender: TObject);
var
  i : integer;
begin
  Log('FIN ------');
  Log('');

  for i := ComponentesEsc.Count - 1 downto 0 do
     TObject(ComponentesEsc.Items[i]).Free;
  ComponentesEsc.Free;

  ThreadCargaImagen.Free;

  if TLocal.Active then
     TLocal.Commit;

  DesConecta;

  EstadoKri_Codigo.Free;
  EstadoKri_Estado.Free;
  TSLNiveles.Free;
  TituloUnidadMedida.Free;
end;

procedure TDMMain.RegistraSalida;
begin
  try
     CreaRegistroPresenciaSalida;
     RegistraSalidaDeEntrada(REntorno.Entrada);
  except
     on E: Exception do
        if not ((FMain.SincronizacionPureWorks) or (FMain.SincronizacionPrestashop) or (FMain.SincronizacionWoocommerce) or (FMain.SincronizacionSellforege) or (FMain.PonderaArticulos) or (FMain.ActualizaPMPArticulos)) then
           ShowMessage(_('No se han podido registrar la salida de la sesion') + #13#10 + E.Message);
  end;

  PrimeraVez := True;
  // EscribeIni;
  // DesConecta;
end;

procedure TDMMain.AjustaNivelesContables;
var
  n : smallint;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_NIVELES_CONTABLES (?EMPRESA, ?EJERCICIO, ?CANAL)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        REntorno.NivelesCont := FieldByName['NIVELES'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  REntorno.MaxNivCont := 15;
  REntorno.DigitosSub := 0;
  for n := 1 to 15 do
  begin
     REntorno.DigitCont[n] := 0;
     REntorno.DigitAcumula[n] := 0;
  end;

  TSLNiveles.Clear;
  TSLNiveles.Add(_('Todos'));

  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        Transaction := DameTransactionRO(Self.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT NIVEL, DIGITOS FROM CON_CUENTAS_NIVELES ');
           SelectSQL.Add(' WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ?CANAL ');
           SelectSQL.Add(' ORDER BY EMPRESA, NIVEL ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Open;
           while not EOF do
           begin
              n := FieldByName('NIVEL').AsInteger;
              REntorno.DigitCont[n] := FieldByName('DIGITOS').AsInteger;
              if n > 1 then
                 REntorno.DigitAcumula[n] := REntorno.DigitAcumula[n - 1] + REntorno.DigitCont[n]
              else
                 REntorno.DigitAcumula[n] := REntorno.DigitCont[n];
              if (REntorno.DigitCont[n] > 0) then
              begin
                 REntorno.DigitosSub := REntorno.DigitosSub + REntorno.DigitCont[n];
                 TSLNiveles.Add(_('Nivel') + ' ' + IntToStr(n));
              end;
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

  UUtiles.LongExpansion := REntorno.DigitosSub;
  REntorno.MascaraCuentas := StringOfChar('C', REntorno.DigitosSub) + ';0;_';
end;

procedure TDMMain.ConfiguraImpresora;
begin
  PSDImpresora.Execute;
end;

function TDMMain.ContadorGen(NomGen: string): integer;
begin
  Result := 0;
  if (Trim(NomGen) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'SELECT GEN_ID(' + NomGen + ', 1) FROM RDB$DATABASE';
           ExecQuery;
           Result := Fields[0].AsInteger;
           Close;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.Contador_Gen(DataSet: TDataSet; NomGen, NomCampo: string; Fuerza: boolean = False): integer;
begin
  Result := 0;
  if (DataSet.State = dsInsert) then
     if Fuerza or (DataSet.FieldByName(NomCampo).AsInteger = 0) then
     begin
        Result := ContadorGen(NomGen);
        DataSet.FieldByName(NomCampo).AsInteger := Result;
     end;
end;

function TDMMain.Contador_E(Tipo: string; Empresa: integer = 0): integer;
begin
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE COD_CONTADORES_E(?EMPRESA, ?TIPO)';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;
        Result := FieldByName['CODIGO'].AsInteger;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.Contador_EE(Tipo: string; Empresa: integer = 0; Ejercicio: integer = 0): integer;
begin
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;
  if (Ejercicio = 0) then
     Ejercicio := REntorno.Ejercicio;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE COD_CONTADORES_EE(?EMPRESA, ?EJERCICIO, ?TIPO)';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;
        Result := FieldByName['CODIGO'].AsInteger;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.Contador_EEC(Tipo: string; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0): integer;
begin
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;
  if (Ejercicio = 0) then
     Ejercicio := REntorno.Ejercicio;
  if (Canal = 0) then
     Canal := REntorno.Canal;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE COD_CONTADORES_EEC(?EMPRESA, ?EJERCICIO, ?CANAL, ?TIPO)';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;
        Result := FieldByName['CODIGO'].AsInteger;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.Contador_EECS(Serie, Tipo: string; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0): integer;
begin
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;
  if (Ejercicio = 0) then
     Ejercicio := REntorno.Ejercicio;
  if (Canal = 0) then
     Canal := REntorno.Canal;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE COD_CONTADORES_EECS(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO)';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;
        Result := FieldByName['CODIGO'].AsInteger;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.Contador_EES(Serie, Tipo: string; Empresa: integer = 0; Ejercicio: integer = 0): integer;
begin
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;
  if (Ejercicio = 0) then
     Ejercicio := REntorno.Ejercicio;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE COD_CONTADORES_EES(?EMPRESA, ?EJERCICIO, ?SERIE, ?TIPO)';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;
        Result := FieldByName['CODIGO'].AsInteger;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.Contador_EC(Tipo: string; Empresa: integer = 0; Canal: integer = 0): integer;
begin
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;
  if (Canal = 0) then
     Canal := REntorno.Canal;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE COD_CONTADORES_EC(?EMPRESA, ?CANAL, ?TIPO)';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;
        Result := FieldByName['CODIGO'].AsInteger;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMain.AjustaMovimientos;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := Self.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_CONTADORES_AJUSTA';
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMain.ActualizaUsuario;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := Self.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE S_USUARIOS_ACTUALIZA (?EMPRESA, ?EJERCICIO, ?CANAL, ?USUARIO, ?FECHA, ?MEMORIZAR_FECHA)';
        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['MEMORIZAR_FECHA'].AsInteger := BoolToInt(REntorno.Memorizar_Fecha);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  AsignaEntornoBusqueda;
  AjustaNivelesContables;
  AjustaMascaraMoneda;
end;

procedure TDMMain.FiltraTabla(Tabla: TFIBDataSet; Filtro: string = '000000'; Abre: boolean = True);
begin
  // Aseguro que Filtro tenga 6 caracteres
  if (Length(Filtro) < 6) then
     Filtro := Copy(Filtro + '000000', 1, 6);

  with Tabla do
  begin
     Close;
     if Filtro[1] = '1' then
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     if Filtro[2] = '1' then
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     if Filtro[3] = '1' then
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if Filtro[4] = '1' then
        Params.ByName['SERIE'].AsString := REntorno.Serie;
     if Filtro[5] = '1' then
        Params.ByName['PAIS'].AsString := REntorno.Pais;
     if Filtro[6] = '1' then
        Params.ByName['PGC'].AsInteger := REntorno.Pgc;
  end;

  if Abre and not (Tabla.Active) then
     Tabla.Open;
end;

procedure TDMMain.FiltraRO(Tabla: TFIBDataSetRO; Filtro: string = '000000'; Abre: boolean = True);
begin
  // Aseguro que Filtro tenga 6 caracteres
  if (Length(Filtro) < 6) then
     Filtro := Copy(Filtro + '000000', 1, 6);

  with Tabla do
  begin
     Close;
     if Filtro[1] = '1' then
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     if Filtro[2] = '1' then
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     if Filtro[3] = '1' then
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if Filtro[4] = '1' then
        Params.ByName['SERIE'].AsString := REntorno.Serie;
     if Filtro[5] = '1' then
        Params.ByName['PAIS'].AsString := REntorno.Pais;
     if Filtro[6] = '1' then
        Params.ByName['PGC'].AsInteger := REntorno.Pgc;
  end;

  if Abre and not (Tabla.Active) then
     Tabla.Open;
end;

procedure TDMMain.FiltraQry(Query: TFIBQuery; Filtro: string = '000000'; Abre: boolean = True);
begin
  // Aseguro que Filtro tenga 6 caracteres
  if (Length(Filtro) < 6) then
     Filtro := Copy(Filtro + '000000', 1, 6);

  with Query do
  begin
     Close;
     if Filtro[1] = '1' then
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     if Filtro[2] = '1' then
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     if Filtro[3] = '1' then
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if Filtro[4] = '1' then
        Params.ByName['SERIE'].AsString := REntorno.Serie;
     if Filtro[5] = '1' then
        Params.ByName['PAIS'].AsString := REntorno.Pais;
     if Filtro[6] = '1' then
        Params.ByName['PGC'].AsInteger := REntorno.Pgc;
  end;

  if Abre then
     Query.ExecQuery;
end;

{ Filtra una tabla añadiendo clausulas AND }
procedure TDMMain.FiltraSQL(Parametro: TParametroFiltrado; Abrir: boolean = True);
var
  orden : string;
  Filtro : string;
  i : integer;
begin
  if (Length(Parametro.Filtro) > 0) then
  begin
     with Parametro.Tabla do
     begin
        DisableControls;
        try
           Close;
           SelectSQL.Clear;
           SelectSQL.AddStrings(Parametro.SQLBase);
           orden := OrdenadoPor;
           Ordenar('');
           SelectSQL.Add(' And (' + Parametro.Filtro + ')');
           Ordenar(orden);

           // Busco parametros por los cuales haya que filtrar
           Filtro := '000000';
           for i := 0 to Parametro.Tabla.Params.Count - 1 do
           begin
              if (Parametro.Tabla.Params[i].Name = 'EMPRESA') then
                 Filtro[1] := '1'
              else
              if (Parametro.Tabla.Params[i].Name = 'EJERCICIO') then
                 Filtro[2] := '1'
              else
              if (Parametro.Tabla.Params[i].Name = 'CANAL') then
                 Filtro[3] := '1'
              else
              if (Parametro.Tabla.Params[i].Name = 'SERIE') then
                 Filtro[4] := '1'
              else
              if (Parametro.Tabla.Params[i].Name = 'PAIS') then
                 Filtro[5] := '1'
              else
              if (Parametro.Tabla.Params[i].Name = 'PGC') then
                 Filtro[6] := '1';
           end;

           FiltraTabla(Parametro.Tabla, Filtro, Abrir);
        finally
           EnableControls;
        end;
     end;
  end;
end;

procedure TDMMain.DevuelveMonedas(Monedas: TStrings);
begin
  // Se introducen las monedas existentes en la base de datos
  // como lineas del StringList 'Monedas'
  Monedas.Clear;

  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        Transaction := DameTransactionRO(Self.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT MONEDA, TITULO FROM SYS_MONEDAS ');
           SelectSQL.Add(' ORDER BY DEFECTO DESC, MONEDA ');
           Open;
           while not EOF do
           begin
              Monedas.Add(FieldByName('MONEDA').AsString + '-' + FieldByName('TITULO').AsString);
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

procedure TDMMain.AsignaEntornoBusqueda;
begin
  EntornoBusqueda.Empresa := REntorno.Empresa;
  EntornoBusqueda.Ejercicio := REntorno.Ejercicio;
  EntornoBusqueda.Canal := REntorno.Canal;
  EntornoBusqueda.Pais := REntorno.Pais;
  EntornoBusqueda.Pgc := REntorno.Pgc;
end;

function TDMMain.DameSemillaCuentaGestion(Gestion: smallint; TipoTercero: smallint): string;
begin
  {
      Gestion
      1-Compras
      2-Ventas
      3-Clientes
      4-Proveedores
      5-Acreedores
      6-Comisionistas
      7-IVA Soportado
      8-IGIC Soportado
      9-IVA Repercutido
     10-IGIC Repercutido
     11-Tesorería
  }
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT MAX(CUENTA) FROM SYS_CUENTAS WHERE PAIS = :PAIS AND GESTION = :GESTION AND TIPO_TERCERO = :TIPO_TERCERO AND PGC = :PGC';
        Params.ByName['PAIS'].AsString := REntorno.Pais;
        Params.ByName['GESTION'].AsInteger := Gestion;
        Params.ByName['TIPO_TERCERO'].AsInteger := TipoTercero;
        Params.ByName['PGC'].AsInteger := REntorno.PGC;
        ExecQuery;
        Result := FieldByName['MAX'].AsString + '.';
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Si no se ha encontrado una cuenta de gestion por lo menos doy un mensaje de aviso
  if (Result = '.') then
     ShowMessage(Format(_('No se ha encontrado una cuenta en el PGC con Gestion %d y Tipo de Tercero %d'), [Gestion, TipoTercero]));
end;

function TDMMain.DameSemillaCuentaGestionMin(Gestion: smallint): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT MIN(CUENTA) FROM SYS_CUENTAS WHERE PAIS = :PAIS AND GESTION = :GESTION AND PGC = :PGC';
        Params.ByName['PAIS'].AsString := REntorno.Pais;
        Params.ByName['GESTION'].AsInteger := Gestion;
        Params.ByName['PGC'].AsInteger := REntorno.Pgc;
        ExecQuery;
        Result := FieldByName['MIN'].AsString + '.';
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameCuentaGestion(Gestion: smallint; TipoTercero: smallint = -1; Empresa: integer = 0): string;
begin
  /// Devuelve la primera cuenta con la GESTION y TIPO_TERCERO pedidos.
  /// Si TIPO_TERCERO < 0, no se tiene en cuenta

  if (Empresa = 0) then
     Empresa := REntorno.Empresa;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MIN(CUENTA) FROM CON_CUENTAS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' GESTION = :GESTION AND ');
        SQL.Add(' TIPO = 5 AND ');
        if (TipoTercero > 0) then
           SQL.Add(' TIPO_TERCERO = :TIPO_TERCERO AND ');
        SQL.Add(' PGC = :PGC ');
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['GESTION'].AsInteger := Gestion;
        if (TipoTercero > 0) then
           Params.ByName['TIPO_TERCERO'].AsInteger := TipoTercero;
        Params.ByName['PGC'].AsInteger := REntorno.Pgc;
        ExecQuery;
        Result := FieldByName['MIN'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameRestriccionUsuario: string;
begin
  REntorno.Restriccion := DamePerfilUsuario(REntorno.Usuario);

  // Debe ser un Dataset pues un Query no realiza la conversión de blob a string
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        Transaction := DameTransactionRO(Self.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add('SELECT PROTECCION FROM SYS_USUARIOS_PERFIL WHERE PERFIL = ?PERFIL');
           Params.ByName['PERFIL'].AsInteger := REntorno.Restriccion;
           Open;
           Result := FieldByName('PROTECCION').AsString;
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

function TDMMain.MascaraMoneda(Moneda: string; Tipo: smallint): string;
var
  i : integer;
begin
  // Busca la mascara en el MonedaInfList
  i := 0;
  Result := '';
  while ((i < Length(MonedaInfList)) and (not (MonedaInfList[i].Moneda = Moneda))) do
     Inc(i);

  if ((i < Length(MonedaInfList)) and (MonedaInfList[i].Moneda = Moneda)) then
  begin
     if (Tipo = 1) then
     begin
        Result := MonedaInfList[i].DecimalesVerStr;
        REntorno.DecimalesVer := MonedaInfList[i].DecimalesVer;
     end
     else
     begin
        Result := MonedaInfList[i].DescimalesCalculosStr;
        REntorno.DecimalesCalculo := MonedaInfList[i].DescimalesCalculos;
     end;
  end;
end;

function TDMMain.DameSignoMoneda(Moneda: string): string;
var
  i : integer;
begin
  // Busca el signo de la moneda en MonedaInfList
  i := 0;
  Result := '';
  while ((i < Length(MonedaInfList)) and (not (MonedaInfList[i].Moneda = Moneda))) do
     Inc(i);

  if ((i < Length(MonedaInfList)) and (MonedaInfList[i].Moneda = Moneda)) then
     Result := MonedaInfList[i].Signo;
end;

procedure TDMMain.AjustaMascaraMoneda;
begin
  CargaMonedaInfList;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT MONEDA FROM EMP_CANALES WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        MascaraN := MascaraMoneda(FieldByName['MONEDA'].AsString, 1);
        MascaraL := MascaraMoneda(FieldByName['MONEDA'].AsString, 0);
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT MONEDA FROM SYS_EMPRESAS WHERE EMPRESA = :EMPRESA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        REntorno.MonedaEmpresa := FieldByName['MONEDA'].AsString;
        MascaraE := MascaraMoneda(FieldByName['MONEDA'].AsString, 0);
        MascaraD := MascaraMoneda(FieldByName['MONEDA'].AsString, 1);
        FreeHandle;
     finally
        Free;
     end;
  end;

  MascaraNSec := MascaraMoneda(REntorno.Moneda_Sec, 1);
end;

function TDMMain.CompruebaRestriccionUsuario: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Add(' SELECT * FROM SYS_USUARIOS_PERFIL_EEC ');
        SQL.Add(' WHERE ');
        SQL.Add(' PERFIL = ' + IntToStr(REntorno.Restriccion) + ' AND ');
        SQL.Add(' (SERIE = '''') AND ');
        SQL.Add('(((EMPRESA=' + REntorno.EmpresaStr + ') AND ');
        SQL.Add('  (EJERCICIO = 0) AND ');
        SQL.Add('  (CANAL = 0)) OR ');
        SQL.Add(' ((EMPRESA=' + REntorno.EmpresaStr + ') AND ');
        SQL.Add('  (EJERCICIO=' + REntorno.EjercicioStr + ') AND ');
        SQL.Add('  (CANAL = 0)) OR ');
        SQL.Add(' ((EMPRESA=' + REntorno.EmpresaStr + ') AND ');
        SQL.Add('  (EJERCICIO=' + REntorno.EjercicioStr + ') AND ');
        SQL.Add('  (CANAL=' + REntorno.CanalStr + '))) ');
        ExecQuery;
        Result := not (HayDatos);
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Add(' SELECT DELEGACION, CONTABILIDAD_RESTRINGIDA, ALBARAN_RESTRINGIDO, SERIE, ALMACEN FROM SYS_USUARIOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' USUARIO = ' + REntorno.UsuarioStr);
        ExecQuery;
        REntorno.SerieRestringida := Trim(FieldByName['SERIE'].AsString);
        REntorno.AlmacenRestringido := Trim(FieldByName['ALMACEN'].AsString);
        REntorno.ContabilidadRestringida := FieldByName['CONTABILIDAD_RESTRINGIDA'].AsInteger = 1;
        REntorno.AlbaranRestringido := FieldByName['ALBARAN_RESTRINGIDO'].AsInteger = 1;
        if (FieldByName['DELEGACION'].AsInteger = 1) then
           REntorno.Delegacion := 'S'
        else
           REntorno.Delegacion := 'N';
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMain.Log(s: string);
{$IFDEF Debug}
var
  F : TextFile;
  FileName : string;
{$ENDIF}
begin
  {$IFDEF Debug}
  FileName := ChangeFileExt(Application.ExeName, '.log');
  AssignFile(F, FileName);
  try
     Append(F);
  except
     try
        Rewrite(F);
     except
        on e: Exception do
           ShowMessage('Error al abrir fichero : ' + FileName + #13#10 + e.Message);
     end;
  end;
  WriteLn(F, FormatDatetime('[yyyy-mm-dd hh:nn:ss.zzz] ', Now) + s);
  CloseFile(F);
  {$ENDIF}
end;

procedure TDMMain.LogProduccion(s: string);
var
  F : TextFile;
  FileName : string;
begin
  FileName := ChangeFileExt(Application.ExeName, '.log');
  AssignFile(F, FileName);
  try
     Append(F);
  except
     try
        Rewrite(F);
     except
        on e: Exception do
           ShowMessage('Error al abrir fichero : ' + FileName + #13#10 + e.Message);
     end;
  end;
  WriteLn(F, FormatDatetime('[yyyy-mm-dd hh:nn:ss.zzz] ', Now) + s);
  CloseFile(F);
end;

procedure TDMMain.LogIni(s: string);
var
  espacio : string;
  i : integer;
begin
  Inc(ContadorLog);
  espacio := '';
  for i := 2 to ContadorLog do
     espacio := espacio + '   ';
  if (ContadorLog < 20) then
     InicioLog[ContadorLog] := Now;
  Log('I - ' + espacio + s);
end;

procedure TDMMain.LogFin(s: string);
var
  espacio : string;
  i : integer;
begin
  espacio := '';
  for i := 2 to ContadorLog do
     espacio := espacio + '   ';
  if (ContadorLog < 20) then
     Log('F - ' + espacio + FormatDatetime('[nn:ss.zzz]', Now - InicioLog[ContadorLog]) + ' - ' + s)
  else
     Log('F - ' + espacio + FormatDatetime('[nn:ss.zzz]', Now - Now) + ' - ' + s);
  if (ContadorLog > 0) then
     Dec(ContadorLog);
end;

procedure TDMMain.RenumeraAsientos;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE C_CUENTAS_ASIENTOS_RENUM (:EMPRESA, :EJERCICIO, :CANAL)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  ShowMessage(_('Se han renumerado todos los asientos contables'));
end;

procedure TDMMain.ValidaFecha(Empresa: integer; Ejercicio: integer; Fecha: TDateTime);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE E_FECHA_EJERCICIO (?EMPRESA, ?EJERCICIO, ?FECHA)';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['FECHA'].AsDateTime := Fecha;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.Contador_Libre(Tipo: string; Codigo_Ent: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE COD_CONTADORES_LIBRE_E(?EMPRESA, ?TIPO, ?CODIGO_ENT)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['CODIGO_ENT'].AsInteger := Codigo_Ent;
        ExecQuery;
        Result := FieldByName['CODIGO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.Contador_Libre_EECS(Serie, Tipo: string; Codigo_Ent: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE COD_CONTADORES_LIBRE_EECS(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?CODIGO_ENT)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['CODIGO_ENT'].AsInteger := Codigo_Ent;
        ExecQuery;
        Result := FieldByName['CODIGO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMain.RegeneraControl;
  {Por alguna razón quedan algunos semáforos abiertos
   Uno es EECS_ARTICULOS_DISP que queda en emp_semaforos_multiusuario}
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE UT_INICIALIZA_SEMAFOROS (0, 0, 0, '''', 0)';
        try
           ExecQuery;
        except
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMain.RegistraSalidaDeEntrada(Entrada: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE LOG_ENTRADAS_SALIDA (?ENTRADA, ?MENU_LEFT, ?MENU_TOP)';
           Params.ByName['ENTRADA'].AsInteger := Entrada;
           Params.ByName['MENU_LEFT'].AsInteger := REntorno.Menu_Left;
           Params.ByName['MENU_TOP'].AsInteger := REntorno.Menu_Top;
           ExecQuery;
           FreeHandle;
        except
           on E: Exception do
           begin
              if not ((FMain.SincronizacionPureWorks) or (FMain.SincronizacionPrestashop) or (FMain.SincronizacionWoocommerce) or (FMain.SincronizacionSellforege) or (FMain.PonderaArticulos) or (FMain.ActualizaPMPArticulos)) then
                 ShowMessage(_('No se han podido guardar la salida de la sesion') + #13#10 + E.Message);
           end;
        end;
     finally
        Free;
     end;
  end;
end;

procedure TDMMain.AjustaRiesgoConfirming;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE E_CARTERA_AJUSTA_RIESGO_CFM(?EMPRESA, ?EJERCICIO, ?CANAL, ?FECHA, ?ENTRADA)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           ExecQuery;
           FreeHandle;
        except
           on E: Exception do
              ShowMessage(_('No se han podido ajustar los riesgos de confirming') + #13#10 + E.Message);
        end;
     finally
        Free;
     end;
  end;
end;

function TDMMain.ChequeaInmovilizado(Empresa, Ejercicio, Canal: integer; Fecha: TDateTime): boolean;
begin
  Result := False;
  with THYFIBQuery.Create(nil) do
  begin
     try
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE C_INMOV_CHEQUEA (?EMPRESA, ?EJERCICIO, ?CANAL, ?FECHA)';
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           Params.ByName['CANAL'].AsInteger := Canal;
           Params.ByName['FECHA'].AsDateTime := Fecha;
           ExecQuery;
           Result := (FieldByName['CHEQUEO'].AsInteger = 1);
           FreeHandle;
        except
           on E: Exception do
              ShowMessage(_('No se han podido verificar inmovilizados pendientes de contabilizar') + #13#10 + E.Message);
        end;
     finally
        Free;
     end;
  end;
end;

function TDMMain.ChequeaVencimientos(Empresa, Ejercicio, Canal: integer; Fecha: TDateTime; var Lista: string): integer;
begin
  Result := 0;
  // Cantidad y Lista de recibos dentro de remesas al descuento con fecha valor anterior a la fecha pedida
  try
     with THYFIBQuery.Create(nil) do
     begin
        try
           try
              Close;
              DataBase := Self.DataBase;
              SQL.Text := 'SELECT CANTIDAD, CAST(SUBSTRING(LISTA FROM 1 FOR 512) AS VARCHAR(512)) AS LISTA FROM E_CARTERA_EXISTEN_VENCIMIENTOS (?EMPRESA, ?EJERCICIO, ?CANAL, ?FECHA)';
              Params.ByName['EMPRESA'].AsInteger := Empresa;
              Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
              Params.ByName['CANAL'].AsInteger := Canal;
              Params.ByName['FECHA'].AsDateTime := Fecha;
              ExecQuery;
              Result := FieldByName['CANTIDAD'].AsInteger;
              Lista := FieldByName['LISTA'].AsString;
              FreeHandle;
           except
              on E: Exception do
                 ShowMessage(_('No se han podido verificar vencimientos pendientes') + #13#10 + E.Message);
           end;
        finally
           Free;
        end;
     end;
  except
     Result := 0;
  end;
end;

function TDMMain.MinTercero: integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT MIN(TERCERO) FROM SYS_TERCEROS WHERE TERCERO > -1';
        ExecQuery;
        Result := FieldByName['MIN'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMain.Cambios(Origen, Destino: string; Fecha: TDateTime; Importe: double; var Ver, Calculo: double);
var
  tmp : string;
  Factor : double;
begin
  if (Origen <> Destino) then
  begin
     Factor := DameFactor(Origen, Destino, Fecha);
     if (Factor <> 0) then
        Importe := Importe / Factor;
  end;

  Redondeos(Importe, Destino, Ver, Calculo, tmp, tmp);
end;

function TDMMain.ChequeaConPagares(Empresa, Ejercicio, Canal: integer; Fecha: TDateTime; var Lista: string): integer;
begin
  Result := 0;
  Fecha := HourIntoDate(Fecha, '23:59:59');
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        Transaction := DameTransactionRO(Self.DataBase);
        try
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add(' SELECT COUNT(*), LIST(EJERCICIO || ''-'' || TIPO_TERCERO || ''-'' || PAGARE, '', '') ');
              SelectSQL.Add(' FROM EMP_CARTERA_PAGARES ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
              SelectSQL.Add(' EJERCICIO <= ?EJERCICIO AND ');
              SelectSQL.Add(' CANAL = ?CANAL AND ');
              SelectSQL.Add(' FECHA_VENCIMIENTO <= ?FECHA AND ');
              SelectSQL.Add(' CONTABILIZADO = 0 ');
              Params.ByName['EMPRESA'].AsInteger := Empresa;
              Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
              Params.ByName['CANAL'].AsInteger := Canal;
              Params.ByName['FECHA'].AsDateTime := Fecha;
              Open;
              Result := FieldByName('COUNT').AsInteger;
              Lista := FieldByName('LIST').AsString;
              Close;
              Transaction.Commit;
           except
              on E: Exception do
                 ShowMessage(_('No se han podido verificar pagares pendientes de contabilizar') + #13#10 + E.Message);
           end;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

function TDMMain.ChequeaPagPagares(Empresa, Ejercicio, Canal: integer; Fecha: TDateTime; var Lista: string): integer;
begin
  Result := 0;
  Fecha := HourIntoDate(Fecha, '23:59:59');
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        Transaction := DameTransactionRO(Self.DataBase);
        try
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add(' SELECT COUNT(*), LIST(EJERCICIO || ''-'' || TIPO_TERCERO || ''-'' || PAGARE, '', '') ');
              SelectSQL.Add(' FROM EMP_CARTERA_PAGARES ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
              SelectSQL.Add(' EJERCICIO <= ?EJERCICIO AND ');
              SelectSQL.Add(' CANAL = ?CANAL AND ');
              SelectSQL.Add(' FECHA_VENCIMIENTO <= ?FECHA AND ');
              SelectSQL.Add(' CONTABILIZADO = 1 AND ');
              SelectSQL.Add(' PAGADO = 0 ');

              Params.ByName['EMPRESA'].AsInteger := Empresa;
              Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
              Params.ByName['CANAL'].AsInteger := Canal;
              Params.ByName['FECHA'].AsDateTime := Fecha;
              Open;
              Result := FieldByName('COUNT').AsInteger;
              Lista := FieldByName('LIST').AsString;
              Close;
              Transaction.Commit;
           except
              on E: Exception do
                 ShowMessage(_('No se han podido verificar pagares pendientes de pagar') + #13#10 + E.Message);
           end;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure TDMMain.Redondeos(var Importe: double; Moneda: string; var Val_Ver, Val_Cal: double; var Val_VerSTR, Val_CalSTR: string);
var
  MascaraVer, MascaraCal, tmp : string;
begin
  MascaraVer := MascaraMoneda(Moneda, 1);
  MascaraCal := MascaraMoneda(Moneda, 0);

  Val_VerSTR := FormatFloat(MascaraVer, Importe);
  tmp := StringReplace(Val_VerSTR, ThousandSeparator, '', [rfReplaceAll]);
  Val_Ver := StrToFloat(tmp);

  Val_CalSTR := FormatFloat(MascaraCal, Importe);
  tmp := StringReplace(Val_CalSTR, ThousandSeparator, '', [rfReplaceAll]);
  Val_Cal := StrToFloat(tmp);
end;

function TDMMain.DameFactor(Origen, Destino: string; Fecha: TDateTime): double;
var
  Encontrado : boolean;
begin
  //  Result := 1;
  with xFactorMoneda do
  begin
     if not Active then
     begin
        Open;
        Last;
     end;
     Encontrado := Locate('ORIGEN;DESTINO', VarArrayOf([origen, destino]), []);
     while ((not Encontrado) or (FieldByName('F_ALTA').AsFloat > Fecha)) do
     begin
        Next;
        if EOF then
           Break;
        Encontrado := LocateNext('ORIGEN;DESTINO',
           VarArrayOf([origen, destino]), []);
     end;
     if Encontrado then
     begin
        Result := FieldByName('FACTOR').AsFloat;
        Exit;
     end;
     Encontrado := Locate('ORIGEN;DESTINO', VarArrayOf([origen, destino]), []);
     while ((not Encontrado) or (FieldByName('F_ALTA').AsFloat > Fecha)) do
     begin
        Next;
        if EOF then
           Break;
        Encontrado := LocateNext('ORIGEN;DESTINO',
           VarArrayOf([origen, destino]), []);
     end;
     if Encontrado then
     begin
        Result := FieldByName('FACTOR').AsFloat;
        Exit;
     end;
     Result := 1;
  end;
end;

procedure TDMMain.AddComponenteEsc(componente: TComponent);
begin
  if ComponentesEsc.IndexOf(componente) = -1 then
     ComponentesEsc.Add(componente);
end;

procedure TDMMain.DelComponenteEsc(componente: TComponent);
begin
  if ComponentesEsc.IndexOf(componente) > -1 then
     ComponentesEsc.Remove(componente);
end;

function TDMMain.FindComponenteEsc(componente: TComponent): integer;
begin
  Result := ComponentesEsc.IndexOf(componente);
end;

function TDMMain.MostrarAvisos: boolean;
begin
  Result := False;
  if (Self.DataBase.TestConnected) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Add(' SELECT MAX(AVISO) FROM VER_USUARIOS_MENSAJES ');
           SQL.Add(' WHERE ');
           SQL.Add(' ((USUARIO = :USUARIO) OR (AVISO IN (SELECT AVISO ');
           SQL.Add('                                     FROM SYS_USUARIOS_MENSAJES_DEST ');
           SQL.Add('                                     WHERE ');
           SQL.Add('                                     USUARIO = :USUARIO))) AND ');
           SQL.Add(' ACTIVO = 1 AND ');
           SQL.Add(' FECHA_VAL <= ?FECHA AND ');
           SQL.Add(' AVISO > ?ULTIMO_AVISO_MOSTRADO ');
           Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
           Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH;
           Params.ByName['ULTIMO_AVISO_MOSTRADO'].AsInteger := UltimoAvisoMostrado;
           ExecQuery;
           Result := (UltimoAvisoMostrado < FieldByName['MAX'].AsInteger);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.MuestraRolloHacienda: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT ROLLO_HACIENDA FROM GES_TPV_CONFIGURACION WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ?CANAL AND SERIE = ?SERIE';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        ExecQuery;
        Result := (FieldByName['ROLLO_HACIENDA'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMain.ImagenFondo;
begin
  // Abre imagen de fondo
  RefrescarImagen(FFondo.IFondo, REntorno.ImagenFondo);

  // Abrea imagen de logo en fondo
  if ((REntorno.Empresa > 0) and (LeeParametro('SYSCONF001') = '2')) then
     RefrescarImagen(FFondo.ILogo, REntorno.ImagenEmpresa);
end;

procedure TDMMain.DatosVersion(var VersionBaseDeDatos, Empresa, Copyright, NombreProducto: string; Forzar: boolean = False);
begin
  // Solo busco los datos en la base de datos si no los tengo o si fuerzo.
  if Forzar or ((VersionBaseDeDatos = '') and
     (Empresa = 'UNK') and
     (Copyright = 'UNK') and
     (NombreProducto = 'UNK')) then
  begin
     if (Self.DataBase.TestConnected) then
     begin
        try
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := Self.DataBase;
                 SQL.Text := 'SELECT CLAVE, EMPRESA_ACERCA_DE, COPYRIGHT_ACERCA_DE, NOMBRE_PRODUCTO_ACERCA_DE FROM SYS_CONSTANTES';
                 ExecQuery;
                 VersionBaseDeDatos := FieldByName['CLAVE'].AsString;
                 Empresa := FieldByName['EMPRESA_ACERCA_DE'].AsString;
                 Copyright := FieldByName['COPYRIGHT_ACERCA_DE'].AsString;
                 NombreProducto := FieldByName['NOMBRE_PRODUCTO_ACERCA_DE'].AsString;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        except
        end;
     end
     else
     begin
        VersionBaseDeDatos := '';
        Empresa := 'UNK';
        Copyright := 'UNK';
        NombreProducto := 'UNK';
     end;
  end;
end;

function TDMMain.IntToEDINum(numero, longitud, Dec: integer): string;
var
  i : integer;
begin
  Result := IntToStr(numero);
  if (Dec > 0) then
     Result := Result + SeparadorDecimal;
  for i := 1 to Dec do
     Result := Result + '0';
  while (Length(Result) < longitud) do
     Result := '0' + Result;
  if (numero >= 0) then
     Result[1] := '+'
  else
     Result[1] := '-';
end;

function TDMMain.FloatToEDINum(numero: real; longitud, Dec: integer): string;
var
  i : integer;
  formato : string;
begin
  formato := '0.';
  for i := 1 to Dec do
     formato := formato + '0';
  Result := FormatFloat(Formato, numero);
  while (Length(Result) < longitud) do
     Result := '0' + Result;
  if (numero >= 0) then
     Result[1] := '+'
  else
     Result[1] := '-';
end;

function TDMMain.StrToEDI(s: string; longitud: integer): string;
var
  i : integer;
begin
  i := 1;
  Result := '';
  while (longitud >= i) do
  begin
     if (i <= Length(s)) then
        Result := Result + s[i]
     else
        Result := Result + ' ';
     Inc(i);
  end;
end;

function TDMMain.DateToEDI(d: TDateTime): string;
begin
  if (d > EncodeDate(2000, 01, 01)) then
  begin
     Result := '';
     Result := IntToStr(MinuteOf(d)) + Result;
     if Length(Result) = 1 then
        Result := '0' + Result;
     Result := IntToStr(HourOf(d)) + Result;
     if Length(Result) = 3 then
        Result := '0' + Result;
     Result := IntToStr(DayOf(d)) + Result;
     if Length(Result) = 5 then
        Result := '0' + Result;
     Result := IntToStr(MonthOf(d)) + Result;
     if Length(Result) = 7 then
        Result := '0' + Result;
     Result := IntToStr(YearOf(d)) + Result;
  end
  else
     Result := '            ';
end;

function TDMMain.Date8ToEDI(d: TDateTime): string;
begin
  if (d > EncodeDate(2000, 01, 01)) then
  begin
     Result := '';
     Result := IntToStr(DayOf(d)) + Result;
     if Length(Result) = 1 then
        Result := '0' + Result;
     Result := IntToStr(MonthOf(d)) + Result;
     if Length(Result) = 3 then
        Result := '0' + Result;
     Result := IntToStr(YearOf(d)) + Result;
  end
  else
     Result := '        ';
end;

function TDMMain.EDIToDate(s: string): TDateTime;
begin                                     { 123456789012 }
  Result := EncodeDate(1900, 01, 01);     { YYYYMMDDhhmm }
  if ((Length(s) = 6) and (s <> '      ')) then
     Result := StrToDate(Copy(s, 7, 2) + '/' + Copy(s, 5, 2) + '/20' + Copy(s, 1, 4));
  if ((Length(s) = 8) and (s <> '        ')) then
     Result := StrToDate(Copy(s, 7, 2) + '/' + Copy(s, 5, 2) + '/' + Copy(s, 1, 4));
  if ((Length(s) = 12) and (s <> '            ')) then
     Result := StrToDateTime(Copy(s, 7, 2) + '/' + Copy(s, 5, 2) + '/' + Copy(
        s, 1, 4) + ' ' + Copy(s, 9, 2) + ':' + Copy(s, 11, 2) + ':00');
end;

function TDMMain.EDIToInt(s: string): integer;
begin
  Result := 0;
  if (Trim(s) <> '') then
     Result := StrToInt(s);
end;

function TDMMain.EDIToFloat(s: string; decimales: integer): real;
var
  divisor : real;
  i : integer;
  aux : string;
begin
  Result := 0;
  if (Trim(s) <> '') then
  begin
     if ((Pos('.', s) = 0) and (Pos(',', s) = 0)) then
     begin
        divisor := 1;
        if (decimales > 0) then
           for i := 1 to decimales do
              divisor := divisor * 10;
        Result := StrToFloat(s) / divisor;
     end
     else
     begin
        aux := '';
        for i := 1 to Length(s) do
           if ((s[i] = ',') or (s[i] = '.')) then
              aux := aux + DecimalSeparator
           else
              aux := aux + s[i];
        Result := StrToFloat(aux);
     end;
  end;
end;

function TDMMain.EstadoKri(id: integer): integer;
var
  i : integer;
  Buscar : boolean;
begin
  Result := 0;
  i := 0;
  Buscar := True;
  while (i <= (EstadoKri_Codigo.Count - 1)) do
  begin
     if (EstadoKri_Codigo[i] = IntToStr(id)) then
     begin
        Result := StrToInt(EstadoKri_Estado[i]);
        EstadoKri_Codigo.Move(i, 0);
        EstadoKri_Estado.Move(i, 0);
        Buscar := False; {la tengo en memoria}
        i := EstadoKri_Codigo.Count; {por lo tanto no seguir}
     end;
     Inc(i);
  end;

  if (Buscar and DataBase.TestConnected) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           Transaction := DameTransactionRO(Self.DataBase);
           SQL.Text := 'SELECT ESTADO FROM G_ESTADO_KRI(' + IntToStr(id) + ')';
           ExecQuery;
           Result := FieldByName['ESTADO'].AsInteger;
           EstadoKri_Codigo.Insert(0, IntToStr(id));
           EstadoKri_Estado.Insert(0, IntToStr(FieldByName['ESTADO'].AsInteger));
           FreeHandle;
        finally
           Transaction.Free;
           Free;
        end;
     end;
  end;
end;

procedure TDMMain.BorraEstadoKri(id: integer);
var
  i : integer;
begin
  {Borra en estado de la memoria (lista).
   Por lo que se volvera a leer de la BD cuando se necesite}
  i := 0;
  while (i <= (EstadoKri_Codigo.Count - 1)) do
  begin
     if (EstadoKri_Codigo[i] = IntToStr(id)) then
     begin
        EstadoKri_Codigo.Delete(i);
        EstadoKri_Estado.Delete(i);
        i := EstadoKri_Codigo.Count; {por lo tanto no seguir}
     end;
     Inc(i);
  end;
end;

function TDMMain.DescripcionEstadoKri(id: integer): string;
begin
  Result := '';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM G_ESTADO_KRI_DESCRIPCION(' + IntToStr(id) + ')';
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameMatriculaFichaTecnica(IdFichaTecnica: integer): string;
begin
  Result := '';
  if (IdFichaTecnica <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Add(' SELECT MATRICULA ');
           SQL.Add(' FROM REP_FICHA_TECNICA ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_FICHA_TECNICA = ' + IntToStr(IdFichaTecnica));
           ExecQuery;
           Result := Trim(FieldByName['MATRICULA'].AsString);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.AgregaDigitoControl(Codigo: string): string;
var
  i : integer;
  Multiplo : integer;
  Resultado : integer;
begin
{
- Se numera el código de Derecha a Izquierda, se multiplican por 1 los dígitos
   que ocupan posición par, y por tres los dígitos que ocupan posición impar.

 - Se suman los valores de los productos obtenidos.

 - Se busca la decena superior al resultado de la suma anterior y se restan
   estos dos valores. El resultado obtenido es el dígito de control.
}

  Multiplo := 3;
  Resultado := 0;

  for i := Length(Codigo) downto 1 do
  begin
     Resultado := Resultado + StrToInt(Codigo[i]) * Multiplo;
     if (Multiplo = 3) then
        Multiplo := 1
     else
        Multiplo := 3;
  end;

  Resultado := (((Resultado div 10) * 10) + 10) - Resultado;

  if (Resultado = 10) then
     Resultado := 0;

  Result := Codigo + IntToStr(Resultado);
end;

function TDMMain.DameRiesgoPedido(Cliente: integer): double;
begin
  Result := 0;
  if (Cliente <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Add(' SELECT SUM(D.LIQUIDO / D.UNIDADES * P.U_PENDIENTES) FROM GES_CABECERAS_S C ');
           SQL.Add(' JOIN GES_DETALLES_S D ON ');
           SQL.Add(' C.ID_S = D.ID_S ');
           SQL.Add(' JOIN GES_DETALLES_S_PED P ON ');
           SQL.Add(' D.ID_DETALLES_S=P.ID_DETALLES_S ');
           SQL.Add(' WHERE ');
           SQL.Add(' C.EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
           SQL.Add(' C.CANAL = ' + REntorno.CanalStr + ' AND ');
           SQL.Add(' C.TIPO = ''PEC'' AND ');
           SQL.Add(' C.ESTADO = 0 AND ');
           SQL.Add(' D.UNIDADES <> 0 AND ');
           SQL.Add(' P.U_PENDIENTES <> 0 AND ');
           SQL.Add(' C.CLIENTE = ' + IntToStr(Cliente));
           try
              ExecQuery;
              Result := FieldByName['SUM'].AsFloat;
           except
              Result := 0;
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DameRiesgoDisponible(Cliente: integer): double;
begin
  Result := 0;
  if (Cliente <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'SELECT RIESGO_DIS FROM DAME_RIESGO_CLIENTE (?EMPRESA, ?EJERCICIO, ?CANAL, ?CLIENTE, ?FECHA)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['CLIENTE'].AsInteger := Cliente;
           Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH;
           try
              ExecQuery;
              Result := FieldByName['RIESGO_DIS'].AsFloat;
           except
              Result := 0;
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMMain.DameListadoSegunPerfil(cliente: integer; modo: string; var Formato: integer; var Cabecera: integer; var Grupo: integer; var Copias: integer; var Tipo: string);
var
  perfil : string;
begin
  Copias := 1;
  if (Cliente <> 0) and (REntorno.Formato = 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Add(' select perfil from con_cuentas_ges_cli where ');
           SQL.Add(' empresa = ' + REntorno.EmpresaStr + ' and ');
           SQL.Add(' ejercicio = ' + REntorno.EjercicioStr + ' and ');
           SQL.Add(' canal = ' + REntorno.CanalStr + ' and ');
           SQL.Add(' cliente = ' + IntToStr(Cliente));
           ExecQuery;
           perfil := FieldByName['PERFIL'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (perfil > ' ') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := Self.DataBase;
              if modo = 'OFC' then
                 SQL.Text := 'select imponer_listados,modelo_oferta as modelo,imponer_copias,copias_oferta as copias from sys_perfiles where perfil=''' + perfil + '''';
              if modo = 'PEC' then
                 SQL.Text := 'select imponer_listados,modelo_pedido as modelo,imponer_copias,copias_pedido as copias from sys_perfiles where perfil=''' + perfil + '''';
              if modo = 'ALB' then
                 SQL.Text := 'select imponer_listados,modelo_albaran as modelo,imponer_copias,copias_albaran as copias from sys_perfiles where perfil=''' + perfil + '''';
              if modo = 'FAC' then
                 SQL.Text := 'select imponer_listados,modelo_factura as modelo,imponer_copias,copias_factura as copias from sys_perfiles where perfil=''' + perfil + '''';
              ExecQuery;
              if FieldByName['IMPONER_LISTADOS'].AsInteger = 1 then
                 Formato := FieldByName['MODELO'].AsInteger;
              if FieldByName['IMPONER_COPIAS'].AsInteger = 1 then
                 Copias := FieldByName['COPIAS'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := Self.DataBase;
              SQL.Text := 'select cabecera, grupo, tipo from dic_listados where listado = ' + IntToStr(Formato);
              ExecQuery;
              Cabecera := FieldByName['CABECERA'].AsInteger;
              Grupo := FieldByName['GRUPO'].AsInteger;
              Tipo := FieldByName['TIPO'].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

function TDMMain.DameCorreoCopiaAgente(Agente: integer; TipoDoc: string; Empresa: integer = 0): string;
begin
  /// Devuelve el correo electronico del agente para enviar copias del documento enviada al cliente
  /// Si el agente no desea copia, se devuelve vacio.

  Result := '';
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;

  if (Agente <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Add(' SELECT T.EMAIL, A.ENVIAR_COPIA_OFC, A.ENVIAR_COPIA_PEC, A.ENVIAR_COPIA_ALB, A.ENVIAR_COPIA_FAC ');
           SQL.Add(' FROM EMP_AGENTES A ');
           SQL.Add(' JOIN SYS_TERCEROS T ON T.TERCERO = A.TERCERO ');
           SQL.Add(' WHERE ');
           SQL.Add(' A.EMPRESA = :EMPRESA AND ');
           SQL.Add(' A.AGENTE = :AGENTE ');
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['AGENTE'].AsInteger := Agente;
           ExecQuery;
           if ((TipoDoc = 'OFC') and (FieldByName['ENVIAR_COPIA_OFC'].AsInteger = 1)) then
              Result := FieldByName['EMAIL'].AsString;
           if ((TipoDoc = 'PEC') and (FieldByName['ENVIAR_COPIA_PEC'].AsInteger = 1)) then
              Result := FieldByName['EMAIL'].AsString;
           if ((TipoDoc = 'ALB') and (FieldByName['ENVIAR_COPIA_ALB'].AsInteger = 1)) then
              Result := FieldByName['EMAIL'].AsString;
           if ((TipoDoc = 'FAC') and (FieldByName['ENVIAR_COPIA_FAC'].AsInteger = 1)) then
              Result := FieldByName['EMAIL'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.ValidaVersionDemoKri(Fecha: TDateTime): TDateTime;
begin
  Result := Fecha;
  if (Version_Demo) then
     if (Fecha > Fecha_Demo) then
     begin
        MessageDlg(Format(_('Version de Prueba.' + #13#10 + 'Valido hasta : %s'), [DateToStr(Fecha_Demo)]), mtError, [mbOK], 0);
        Result := Fecha_Demo;
     end;
end;

function TDMMain.PuedeHacerImputaciones: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := Self.DataBase;
        SQL.Text := 'SELECT CONTABILIDAD_ANALITICA FROM SYS_USUARIOS_PERFIL WHERE PERFIL=?PERFIL';
        Params.ByName['PERFIL'].AsInteger := REntorno.User_Profile;
        ExecQuery;
        Result := FieldByName['CONTABILIDAD_ANALITICA'].AsInteger = 1;
     finally
        Free;
     end;
  end;
end;

(*
function TDMMain.VerificaNifKri(Pais, NifEntrada: string): integer;
{
var
  nif, LetraPrincipio, LetraFinal, NumeroStr : string;
  i, i2, aux, Total : integer;
}
var
  Valido: boolean;
  MensajeError: string;
begin
  VerificaDocumentoIdentificacion(Pais, 'NIF', NifEntrada, Valido, MensajeError);
  Result := 0;
  if not Valido then
    Result := 4;

  {
  Se centraliza la verificacion en un solo punto, en la base de datos.

  /// Veridicacion de numero de identificacion
  /// Segun pais, verifica con el método apropiado
  /// Devuelve codigo de error:
  ///   0 si no hay error
  ///   1 si la cantidad de digitos no es correcta
  ///   2 letra incorrecta
  ///   3 si el dig. control es incorrecto
  ///   4 el DNI no es correcto
  ///   5 el DNI de otro pais. No controlado

  nif := '';
  // Quita espacios en blanco y lo que no sea numero o letra
  for i := 1 to Length(NifEntrada) do
     if (NifEntrada[i] in ['A'..'Z', 'a'..'z', '0'..'9']) then
        nif := nif + UpperCase(NifEntrada[i]);

  Result := 0;
  if (Pais = 'ESP') then
  begin
     // Separo letras y numero
     if (Length(nif) > 0) then
     begin
        // Si empieza por las letras del pais, las quito.
        if (Copy(nif, 1, 2) = 'ES') then
           nif := Copy(nif, 3, Length(nif) - 2);

        NumeroStr := '';
        LetraPrincipio := '';
        LetraFinal := '';

        // Busca el primer numero
        i := 1;
        while ((i < Length(nif)) and (not (nif[i] in ['0'..'9']))) do
           Inc(i);
        LetraPrincipio := Copy(nif, 1, i - 1);

        // Saca el numero
        while ((i <= Length(nif)) and (nif[i] in ['0'..'9'])) do
        begin
           NumeroStr := NumeroStr + nif[i];
           Inc(i);
        end;

        // Saca la letra final
        LetraFinal := Copy(nif, i, Length(nif) - i + 1);

        // Verifica que la letra principio sea de una sola letra
        if (Length(LetraPrincipio) > 1) then
           LetraPrincipio := Copy(LetraPrincipio, Length(LetraPrincipio), 1);

        nif := LetraPrincipio + NumeroStr + LetraFinal;
     end;

     if (Length(nif) = 9) then
     begin
        if ((Length(LetraPrincipio) = 0) or (LetraPrincipio[1] in ['X', 'Y', 'Z'])) then
        begin
           // Es un NIE - Numero de Identificacion de Extrangero
           if (Length(LetraPrincipio) > 0) then
           begin
              case LetraPrincipio[1] of
                 'X': NumeroStr := '0' + NumeroStr;
                 'Y': NumeroStr := '1' + NumeroStr;
                 'Z': NumeroStr := '2' + NumeroStr;
              end;
           end;

           if (LetraFinal = Copy('TRWAGMYFPDXBNJZSQVHLCKET', 1 + StrToInt(NumeroStr) mod 23, 1)) then
              Result := 0
           else
              Result := 4; // NIF Incorrecto
        end
        else
        begin
           // Es un NIF
           if (LetraPrincipio[1] in ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'S', 'U', 'V', 'W', 'R']) then
           begin
              if (Length(LetraFinal) > 0) then
              begin
                 if (not (LetraFinal[1] in ['A'..'J'])) then
                    Result := 3 // Digito control incorrecto
                 else
                    // Convierte la letra final en un numero (es el dig. control)
                    LetraFinal := Copy('0123456789', Pos(LetraFinal[1], 'JABCDEFGHI'), 1);
              end
              else
              begin
                 LetraFinal := Copy(NumeroStr, Length(NumeroStr), 1);
                 NumeroStr := Copy(NumeroStr, 1, Length(NumeroStr) - 1);
              end;

              if (Result = 0) then
              begin
                 // Verificacion
                 // Sumamos las posiciones pares
                 i2 := StrToInt(nif[2 + 1]) + StrToInt(nif[4 + 1]) + StrToInt(nif[6 + 1]);

                 // Sumamos las posiciones impares multiplicadas x2
                 i := StrToInt(nif[1 + 1]) * 2;
                 if (i > 9) then
                    i2 := i2 + StrToInt(IntToStr(i)[1]) + StrToInt(IntToStr(i)[2])
                 else
                    i2 := i2 + i;

                 i := StrToInt(nif[3 + 1]) * 2;
                 if (i > 9) then
                    i2 := i2 + StrToInt(IntToStr(i)[1]) + StrToInt(IntToStr(i)[2])
                 else
                    i2 := i2 + i;

                 i := StrToInt(nif[5 + 1]) * 2;
                 if (i > 9) then
                    i2 := i2 + StrToInt(IntToStr(i)[1]) + StrToInt(IntToStr(i)[2])
                 else
                    i2 := i2 + i;

                 i := StrToInt(nif[7 + 1]) * 2;
                 if (i > 9) then
                    i2 := i2 + StrToInt(IntToStr(i)[1]) + StrToInt(IntToStr(i)[2])
                 else
                    i2 := i2 + i;

                 if (i2 > 9) then
                    i2 := StrToInt(IntToStr(i2)[2]);

                 i2 := 10 - i2;

                 if (i2 = 10) then
                    i2 := 0;

                 if (LetraFinal <> IntToStr(i2)) then
                    Result := 4; // NIF Incorrecto
              end;
           end
           else
              Result := 2; // Primera letra incorrecta
        end;
     end
     else
     begin
        Result := 1; // Largo incorrecto
     end;
  end
  else
  if (Pais = 'CHL') then // Chile
  begin
     if ((Length(nif) > 10) or (Length(nif) < 9)) then
        Result := 1 // Largo incorrecto
     else
     begin
        // Recorro desde el final omitiendo el digito de control
        i2 := 2;
        Total := 0;
        for i := Length(nif) - 1 downto 1 do
        begin
           if (i2 > 7) then
              i2 := 2;

           aux := StrToIntDef(nif[i], -1);

           if (aux >= 0) then
              Total := Total + StrToInt(nif[i]) * i2;

           Inc(i2);
        end;

        // Digito de Control = 11 - (Total Mod 11);
        case (11 - (Total mod 11)) of
           10: LetraFinal := 'K';
           11: LetraFinal := '0';
           else
              LetraFinal := IntToStr(11 - (Total mod 11));
        end;

        if (nif[Length(nif)] <> LetraFinal) then
           Result := 4; // Nif incorrecto
     end;
  end
  else
     Result := 5; // Nif de otro pais. No controlado.
  }
end;
*)

function TDMMain.EjercicioContableAbierto(Ejercicio: integer): boolean;
begin
  Result := False;
  if (Ejercicio > 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'SELECT ATO_APERTURA FROM EMP_CANALES WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' + IntToStr(Ejercicio) + ' AND CANAL=' + REntorno.CanalStr;
           ExecQuery;
           Result := FieldByName['ATO_APERTURA'].AsInteger > 0;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMMain.CargaMonedaInfList;
var
  i, j, aDescimalesVer, aDescimalesCalculos : integer;
  aDescimalesVerStr, aDescimalesCalculosStr : string;
begin
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        Transaction := DameTransactionRO(Self.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT MONEDA, DEC_VER, DEC_CALCULOS, SIGNO_MONEDA FROM SYS_MONEDAS ');
           SelectSQL.Add(' ORDER BY DEFECTO DESC, MONEDA ');
           Open;
           Last;
           SetLength(MonedaInfList, RecordCount);
           First;
           j := 0;
           while not EOF do
           begin
              // DEC_VER
              aDescimalesVer := FieldByName('DEC_VER').AsInteger;
              aDescimalesVerStr := '#,0.';
              for i := 1 to aDescimalesVer do
                 aDescimalesVerStr := aDescimalesVerStr + '0';

              // DEC_CALCULOS
              aDescimalesCalculos := FieldByName('DEC_CALCULOS').AsInteger;
              aDescimalesCalculosStr := '#,0.';
              for i := 1 to aDescimalesCalculos do
                 aDescimalesCalculosStr := aDescimalesCalculosStr + '0';

              MonedaInfList[j].Moneda := FieldByName('MONEDA').AsString;
              MonedaInfList[j].DecimalesVer := aDescimalesVer;
              MonedaInfList[j].DescimalesCalculos := aDescimalesCalculos;
              MonedaInfList[j].DecimalesVerStr := aDescimalesVerStr;
              MonedaInfList[j].DescimalesCalculosStr := aDescimalesCalculosStr;
              MonedaInfList[j].Signo := FieldByName('SIGNO_MONEDA').AsString;
              Inc(j);
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

function TDMMain.DameDirectorioComunicaciones(Tipo: string): string;
begin
  {Directorio base}
  Result := ExcludeTrailingPathDelimiter(REntorno.DirectorioComunicaciones);
  if (not DirectoryExists(Result)) then
     CreateDir(Result); {Creo directorios si no existen}

  {Empresa en 3 digitos}
  Result := Result + '\' + Ajusta(REntorno.EmpresaStr, 'I', 3, '0');
  if (not DirectoryExists(Result)) then
     CreateDir(Result); {Creo directorios si no existen}

  {Tipo - CLI, PRO, etc.}
  Result := Result + '\' + Tipo;
  if (not DirectoryExists(Result)) then
     CreateDir(Result); {Creo directorios si no existen}

  Result := Result + '\';
end;

function TDMMain.DameDirectorioCodCliPro(Tipo: string; CodCliPro: integer): string;
begin
  {Directorio base}
  Result := ExcludeTrailingPathDelimiter(REntorno.DirectorioComunicaciones);
  if (not DirectoryExists(Result)) then
     CreateDir(Result); {Creo directorios si no existen}

  {Empresa en 3 digitos}
  Result := Result + '\' + Ajusta(REntorno.EmpresaStr, 'I', 3, '0');
  if (not DirectoryExists(Result)) then
     CreateDir(Result); {Creo directorios si no existen}

  {Tipo - CLI, PRO, etc.}
  Result := Result + '\' + Tipo;
  if (not DirectoryExists(Result)) then
     CreateDir(Result); {Creo directorios si no existen}

  {226 - Directorio = DirBase\Emp\Tipo\CodCliPro en 5 digitos (Trepat).}
  if (EstadoKri(226) = 1) then
     Result := Result + '\' + Ajusta(IntToStr(CodCliPro), 'I', 5, '0')
  else
     Result := Result + '\' + IntToStr(CodCliPro);
  if (not DirectoryExists(Result)) then
     CreateDir(Result); {Creo directorios si no existen}

  Result := Result + '\';
end;

{procedure TDMMain.DescargaLector(Articulo : string; Cantidad : integer; Fecha : TDateTime): boolean;
var
   oini : TIniFile;
   DatosLector : TStrings;
begin
   DatosLector := TStringList.Create;
   try
      with DatosLector do
      begin
         oini := TInifile.Create(REntorno.FicheroINI);
         LoadFromFile(oini.ReadString('Datos', 'DirectorioLector', DirectorioBase + 'Lector\') + 'Pedido.txt');
         oini.Free;

         Fecha := StrToDateTime(CommaText[0] + ' ' + CommaText[1]);
         Articulo := CommaText[2];
         Cantidad := StrToIntDef(CommaText[2], 0);
         Articulo := Self.DameArticuloBarras(Articulo);
      end; - with -

   finally
      DatosLector.Free;
   end;
end;
}
function TDMMain.CompruebaControlUbicacionAlmacen(Almacen: string): boolean;
begin
  Result := False;
  if (Trim(Almacen) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'SELECT CTROL_UBICACION FROM ART_ALMACENES WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND ALMACEN=''' + Trim(Almacen) + '''';
           ExecQuery;
           Result := (FieldByName['CTROL_UBICACION'].AsInteger = 1);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DamePrecioMovimientoArticulo(Empresa, Canal: integer; Articulo, Almacen: string; UnidadesExt: double; TipoOper: string; PrecioOp: double): double;
begin
  Result := 0;
  if ((Trim(Articulo) > '') and (Trim(Almacen) > '')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE G_PRECIO_MOVIMIENTOS(?EMPRESA, ?CANAL, ?ARTICULO, ?ALMACEN, ?UNIDADES_EXT, ?TIPO_OPER, ?PRECIOP, ?UTILIZAR_PRECIO_COSTE_MOV)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['ARTICULO'].AsString := Articulo;
           Params.ByName['ALMACEN'].AsString := Almacen;
           Params.ByName['UNIDADES_EXT'].AsFloat := UnidadesExt;
           Params.ByName['TIPO_OPER'].AsString := TipoOper;
           Params.ByName['PRECIOP'].AsFloat := PrecioOp;
           Params.ByName['UTILIZAR_PRECIO_COSTE_MOV'].AsInteger := BoolToInt(REntorno.Precio_coste_mov);
           ExecQuery;
           Result := FieldByName['PRECIO'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DamePMPArticulo(Articulo, Almacen: string): double;
begin
  Result := 0;
  if ((Trim(Articulo) > '') and (Trim(Almacen) > '')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE A_ART_OBTENER_PRECIO(?EMPRESA, ?CANAL, ?ALMACEN, ?ARTICULO, ?RES_PMP)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['ALMACEN'].AsString := Almacen;
           Params.ByName['ARTICULO'].AsString := Articulo;
           Params.ByName['RES_PMP'].AsInteger := 0; // 0 PMP, 1 Segun Config, 2 PCoste
           ExecQuery;
           Result := FieldByName['PRECIO'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DameID_Concepto(Concepto: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID FROM SYS_NOMINA_CONCEPTOS WHERE CONCEPTO = ?CONCEPTO';
        Params.ByName['CONCEPTO'].AsString := Concepto;
        ExecQuery;
        Result := FieldByName['ID'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.ChequeaCuotasPendientes: integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Add(' SELECT COUNT(*) FROM VER_CLIENTES_CUOTAS_DETALLE_DOC ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' ID_S = 0 AND ');
        SQL.Add(' FECHA < ?FECHA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrabSH + 0.999999;
        ExecQuery;
        Result := FieldByName['COUNT'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.ChequeaAccionesPendientes: integer;
begin
  Result := 0;
  if ControlAcciones then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Add(' SELECT COUNT(*) FROM CRM_CONTACTOS_ACCIONES CAB ');
           SQL.Add(' JOIN CRM_CONTACTOS_ACCIONES_DET DET ');
           SQL.Add(' ON (CAB.ID_CONTACTO = DET.ID_CONTACTO AND CAB.LINEA = DET.LINEA_CAB) ');
           SQL.Add(' -- JOIN CRM_CONTACTOS CON ');
           SQL.Add(' -- ON (CON.ID_CONTACTO = CAB.ID_CONTACTO) ');
           SQL.Add(' JOIN SYS_USUARIOS SY ');
           SQL.Add(' ON CAB.AGENTE = SY.AGENTE ');
           SQL.Add(' WHERE ');
           SQL.Add(' CAB.EMPRESA_AGENTE = :EMPRESA AND ');
           SQL.Add(' DET.FIN_SEG = 0 AND ');
           SQL.Add(' SY.USUARIO = :USUARIO AND ');
           SQL.Add(' DET.FECHA < ''TOMORROW'' ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
           ExecQuery;
           Result := FieldByName['COUNT'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DameRevisionesAlquiler: string;
begin
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        Transaction := DameTransactionRO(Self.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT LIST(''ALQ. '' || ID_ALQ || '' ('' || ALBARAN, ''), '') ');
           SelectSQL.Add(' FROM (SELECT R.ID_ALQ, ');
           SelectSQL.Add('              (SELECT EJERCICIO || ''-'' || SERIE || ''/'' || RIG ');
           SelectSQL.Add('               FROM GES_CABECERAS_S ');
           SelectSQL.Add('               WHERE ');
           SelectSQL.Add('               ID_S = R.ID_S_ALB AND ');
           SelectSQL.Add('               FECHA < ''NOW'' - 165) ALBARAN ');
           SelectSQL.Add('       FROM EMP_ALQUILER_REV R ');
           SelectSQL.Add('       ORDER BY R.ID_S_ALB DESC) ');
           Open;
           Result := FieldByName('LIST').AsString;
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

function TDMMain.DamePagosTransferenciaPendientes: string;
begin
  /// Devuelve los siguientes pagos por transferencia de los próximos 7 dias.
  Result := '';
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        Transaction := DameTransactionRO(Self.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT PREV.SERIE || ''/'' || PREV.FACTURA || '' ('' || PREV.NUM_FACTURA || '')'' DOCUMENTO, PREV.VENCIMIENTO, ');
           SelectSQL.Add('        CASE ');
           SelectSQL.Add('          WHEN TIPO IN (''FAP'', ''AGP'', ''NRP'', ''AFP'') THEN ');
           SelectSQL.Add('              (SELECT T.NOMBRE_R_SOCIAL ');
           SelectSQL.Add('               FROM EMP_PROVEEDORES P ');
           SelectSQL.Add('               JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO ');
           SelectSQL.Add('               WHERE ');
           SelectSQL.Add('               P.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add('               P.PROVEEDOR = PREV.CODCLI) ');
           SelectSQL.Add('          ELSE (SELECT T.NOMBRE_R_SOCIAL ');
           SelectSQL.Add('                FROM EMP_ACREEDORES A ');
           SelectSQL.Add('                JOIN SYS_TERCEROS T ON A.TERCERO = T.TERCERO ');
           SelectSQL.Add('                WHERE ');
           SelectSQL.Add('                A.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add('                A.ACREEDOR = PREV.CODCLI) ');
           SelectSQL.Add('        END NOMBRE_R_SOCIAL ');
           SelectSQL.Add(' FROM C_CREA_PREVISION_C_P(:EMPRESA, :CANAL, :DESDE, :HASTA, :SIGNO, :MONEDA, :FECHA, :CLIPROACR, :TIPOTER, 0, 1) PREV ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' PREV.EFECTO = ''TRN'' AND ');
           SelectSQL.Add(' PREV.TIPO <> ''PEP'' AND ');
           SelectSQL.Add(' PREV.TIPO <> ''ALP'' ');
           SelectSQL.Add(' ORDER BY PREV.VENCIMIENTO, PREV.CODCLI, PREV.BANCO, PREV.ORDEN ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['DESDE'].AsDateTime := EncodeDate(2000, 01, 01);
           Params.ByName['HASTA'].AsDateTime := RecodeTime(Today + 7, 23, 59, 59, 999);
           Params.ByName['SIGNO'].AsString := 'P';
           Params.ByName['MONEDA'].AsString := REntorno.Moneda;
           Params.ByName['FECHA'].AsDateTime := Today;
           Params.ByName['CLIPROACR'].AsInteger := 0;
           Params.ByName['TIPOTER'].AsString := 'ALL';
           Open;
           while not EOF do
           begin
              Result := format(_('Factura %s - Vencimieto: %s - Prov./Acr.: %s') + #13#10, [FieldByName('DOCUMENTO').AsString, FormatDateTime(ShortDateFormat, FieldByName('VENCIMIENTO').AsDateTime), FieldByName('NOMBRE_R_SOCIAL').AsString]);
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

function TDMMain.DameFacturasAbiertas(Dias: integer): string;
var
  i : integer;
begin
  /// Devuelve facturas abiertas con fecha anterior a n dias.

  Result := '';
  i := 0;
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        Transaction := DameTransactionRO(Self.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT EJERCICIO, SERIE, RIG, FECHA ');
           SelectSQL.Add(' FROM GES_CABECERAS_S ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' EJERCICIO <= :EJERCICIO AND ');
           SelectSQL.Add(' CANAL = :CANAL AND ');
           SelectSQL.Add(' TIPO = ''FAC'' AND ');
           SelectSQL.Add(' FECHA < :FECHA AND ');
           SelectSQL.Add(' ESTADO = 0 ');
           SelectSQL.Add(' ORDER BY EJERCICIO, SERIE, RIG ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['FECHA'].AsDateTime := IncDay(Today, (Dias - 1) * (-1));
           Open;
           while not EOF do
           begin
              Inc(i);
              if (i <= 10) then
                 Result := Result + format(_('Factura') + ' %d-%s/%d - %s' + #13#10, [FieldByName('EJERCICIO').AsInteger, FieldByName('SERIE').AsString, FieldByName('RIG').AsInteger, FormatDateTime(ShortDateFormat, FieldByName('FECHA').AsDateTime)]);
              Next;
           end;
           if (i > 10) then
              Result := Result + format('... +%d', [i - 10]);
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

function TDMMain.DameAlbaranesAbiertos(Dias: integer): string;
var
  i : integer;
begin
  /// Devuelve albaranes abiertas con fecha anterior a n dias.

  Result := '';
  i := 0;
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        Transaction := DameTransactionRO(Self.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT EJERCICIO, SERIE, RIG, FECHA ');
           SelectSQL.Add(' FROM GES_CABECERAS_S ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' EJERCICIO <= :EJERCICIO AND ');
           SelectSQL.Add(' CANAL = :CANAL AND ');
           SelectSQL.Add(' TIPO = ''ALB'' AND ');
           SelectSQL.Add(' FECHA < :FECHA AND ');
           SelectSQL.Add(' ESTADO = 0 ');
           SelectSQL.Add(' ORDER BY EJERCICIO, SERIE, RIG ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['FECHA'].AsDateTime := IncDay(Today, (Dias - 1) * (-1));
           Open;
           while not EOF do
           begin
              Inc(i);
              if (i <= 10) then
                 Result := Result + format(_('Albaran') + ' %d-%s/%d - %s' + #13#10, [FieldByName('EJERCICIO').AsInteger, FieldByName('SERIE').AsString, FieldByName('RIG').AsInteger, FormatDateTime(ShortDateFormat, FieldByName('FECHA').AsDateTime)]);
              Next;
           end;
           if (i > 10) then
              Result := Result + format('... +%d', [i - 10]);
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

function TDMMain.DamePedidosAbiertos(Dias: integer): string;
var
  i : integer;
begin
  /// Devuelve pedidos abiertas con fecha anterior a n dias.

  Result := '';
  i := 0;
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        Transaction := DameTransactionRO(Self.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT EJERCICIO, SERIE, RIG, FECHA ');
           SelectSQL.Add(' FROM GES_CABECERAS_S ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' EJERCICIO <= :EJERCICIO AND ');
           SelectSQL.Add(' CANAL = :CANAL AND ');
           SelectSQL.Add(' TIPO = ''PEC'' AND ');
           SelectSQL.Add(' FECHA < :FECHA AND ');
           SelectSQL.Add(' ESTADO = 0 ');
           SelectSQL.Add(' ORDER BY EJERCICIO, SERIE, RIG ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['FECHA'].AsDateTime := IncDay(Today, (Dias - 1) * (-1));
           Open;
           while not EOF do
           begin
              Inc(i);
              if (i <= 10) then
                 Result := Result + format(_('Pedido') + ' %d-%s/%d - %s' + #13#10, [FieldByName('EJERCICIO').AsInteger, FieldByName('SERIE').AsString, FieldByName('RIG').AsInteger, FormatDateTime(ShortDateFormat, FieldByName('FECHA').AsDateTime)]);
              Next;
           end;
           if (i > 10) then
              Result := Result + format('... +%d', [i - 10]);
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

function TDMMain.DameOferasAbiertas(Dias: integer): string;
var
  i : integer;
begin
  /// Devuelve ofertas abiertas con fecha anterior a n dias.

  Result := '';
  i := 0;
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        Transaction := DameTransactionRO(Self.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT EJERCICIO, SERIE, RIG, FECHA ');
           SelectSQL.Add(' FROM GES_CABECERAS_S ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' EJERCICIO <= :EJERCICIO AND ');
           SelectSQL.Add(' CANAL = :CANAL AND ');
           SelectSQL.Add(' TIPO = ''OFC'' AND ');
           SelectSQL.Add(' FECHA < :FECHA AND ');
           SelectSQL.Add(' ESTADO = 0 ');
           SelectSQL.Add(' ORDER BY EJERCICIO, SERIE, RIG ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['FECHA'].AsDateTime := IncDay(Today, (Dias - 1) * (-1));
           Open;
           while not EOF do
           begin
              Inc(i);
              if (i <= 10) then
                 Result := Result + format(_('Oferta') + ' %d-%s/%d - %s' + #13#10, [FieldByName('EJERCICIO').AsInteger, FieldByName('SERIE').AsString, FieldByName('RIG').AsInteger, FormatDateTime(ShortDateFormat, FieldByName('FECHA').AsDateTime)]);
              Next;
           end;
           if (i > 10) then
              Result := Result + format('... +%d', [i - 10]);
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

function TDMMain.ArticulosBajoStockMinimoMarcados(var ListaArticulos: string): integer;
var
  DS : TFIBDataSet;
begin
  ListaArticulos := '';
  //Result := 0;
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Close;
        DataBase := Self.DataBase;
        Transaction := DameTransactionRW(Self.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' WITH S ');
           SelectSQL.Add(' AS (SELECT A.EMPRESA, A.CANAL, A.AVISO_STOCK_MINIMO, A.ARTICULO, A.STOCK_MINIMO, ');
           SelectSQL.Add('            (SELECT STOCK ');
           SelectSQL.Add('             FROM A_ART_DAME_STOCK2(A.EMPRESA, A.CANAL, A.ALMACEN, A.ARTICULO, ''3000.01.01'')) ');
           SelectSQL.Add('     FROM ART_ARTICULOS_ALMACENES_ART A ');
           SelectSQL.Add('     JOIN ART_ARTICULOS ART ON A.ID_A = ART.ID_A ');
           SelectSQL.Add('     WHERE ');
           SelectSQL.Add('     ART.BAJA = 0) ');
           SelectSQL.Add(' SELECT COUNT(*) ');
           SelectSQL.Add(' FROM S ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' S.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' S.CANAL = :CANAL AND ');
           SelectSQL.Add(' S.AVISO_STOCK_MINIMO = 1 AND ');
           SelectSQL.Add(' S.STOCK_MINIMO > 0 AND ');
           SelectSQL.Add(' S.STOCK_MINIMO > S.STOCK ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Open;
           Result := FieldByName('COUNT').AsInteger;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     end;
  finally
     FreeAndNil(DS);
  end;

  if (Result > 0) then
  begin
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Close;
           DataBase := Self.DataBase;
           Transaction := DameTransactionRW(Self.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add(' WITH S ');
              SelectSQL.Add(' AS (SELECT A.EMPRESA, A.CANAL, A.AVISO_STOCK_MINIMO, A.ARTICULO, A.STOCK_MINIMO, ART.TITULO_LARGO, ');
              SelectSQL.Add('            (SELECT STOCK ');
              SelectSQL.Add('             FROM A_ART_DAME_STOCK2(A.EMPRESA, A.CANAL, A.ALMACEN, A.ARTICULO, ''3000.01.01'')) ');
              SelectSQL.Add('     FROM ART_ARTICULOS_ALMACENES_ART A ');
              SelectSQL.Add('     JOIN ART_ARTICULOS ART ON A.ID_A = ART.ID_A ');
              SelectSQL.Add('     WHERE ');
              SelectSQL.Add('     ART.BAJA = 0) ');
              SelectSQL.Add(' SELECT CAST(SUBSTRING(LIST(S.ARTICULO || '' - '' || S.TITULO_LARGO, ASCII_CHAR(13) || ASCII_CHAR(10)) FROM 1 FOR 512) AS VARCHAR(512)) ');
              SelectSQL.Add(' FROM S ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' S.EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' S.CANAL = :CANAL AND ');
              SelectSQL.Add(' S.AVISO_STOCK_MINIMO = 1 AND ');
              SelectSQL.Add(' S.STOCK_MINIMO > 0 AND ');
              SelectSQL.Add(' S.STOCK_MINIMO > S.STOCK ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Open;
              ListaArticulos := FieldByName('CAST').AsString;
              if (Length(ListaArticulos) = 512) then
                 ListaArticulos := ListaArticulos + '...';
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
end;

function TDMMain.ControlAcciones: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT CRM_AVISOS FROM CRM_CONFIGURACION';
        ExecQuery;
        Result := (FieldByName['CRM_AVISOS'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.FloatToStrSinComa(numero: real; Dec: integer; long: integer = 0; Signo: string = '-'): string;
var
  pot : real;
  i : integer;
begin
  // Primero convierto a string
  pot := 1;
  for i := 1 to Dec do
     pot := pot * 10;
  // pot := Power(10,dec);
  numero := numero * pot;
  Result := IntToStr(Round(numero));

  // Si es negativo modifico el signo
  if (Signo <> '-') then
     Result := StringReplace(Result, '-', Signo, []);

  // Relleno con 0 hasta long
  if (long <> 0) then
  begin
     while (Length(Result) < long) do
     begin
        // Si es menor que 0 tengo que insertar 0 despues del singo
        if (Numero < 0) then
           Result := Copy(Result, 1, 1) + '0' + Copy(Result, 2, Length(Result))
        else
           Result := '0' + Result;
     end;
  end;
end;

function TDMMain.DameAlmacenDocumento(Tipo, Serie: string): string;
begin
  {Todo -cAlmacenes -oDuilio : Quizás habría que utilizarlo para movimientos entre almacenes y produccion}

  if (REntorno.AlmacenRestringido <> '') then
     Result := REntorno.AlmacenRestringido
  else
     Result := LeeParametro('ALMD' + Tipo + '001', Serie);

  if (Trim(Result) = '') then
     Result := REntorno.AlmacenDefecto;
end;

function TDMMain.DameModoIVACanal: integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT MODO_IVA FROM EMP_CANALES WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        Result := FieldByName['MODO_IVA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DamePrecioTarifa(Tarifa, Articulo: string; Empresa: integer = 0): double;
begin
  Result := 0;

  if (Empresa = 0) then
     Empresa := REntorno.Empresa;

  Tarifa := Copy(Trim(Tarifa), 1, 3);
  Articulo := Copy(Trim(Articulo), 1, 15);
  if ((Tarifa > '') and (Tarifa > '')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'SELECT FIRST 1 PRECIO_VENTA FROM ART_TARIFAS_PRECIOS WHERE EMPRESA = :EMPRESA AND TARIFA = :TARIFA AND ARTICULO = :ARTICULO ORDER BY LINEA';
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['TARIFA'].AsString := Tarifa;
           Params.ByName['ARTICULO'].AsString := Articulo;
           ExecQuery;
           Result := FieldByName['PRECIO_VENTA'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DamePrecioTarifaBasiImponible(Tarifa, Articulo: string; Empresa: integer = 0): double;
begin
  Result := 0;

  if (Empresa = 0) then
     Empresa := REntorno.Empresa;

  Tarifa := Copy(Trim(Tarifa), 1, 3);
  Articulo := Copy(Trim(Articulo), 1, 15);
  if ((Tarifa > '') and (Tarifa > '')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Add(' SELECT ');
           SQL.Add('        CASE ');
           SQL.Add('          WHEN (T.IVA_INCLUIDO = 1) THEN ');
           SQL.Add('              (SELECT VALOR_SIN_IVA ');
           SQL.Add('               FROM A_ART_PRECIO_SIN_IVA(P.EMPRESA, P.ARTICULO, P.PRECIO_VENTA, T.MONEDA)) ');
           SQL.Add('          ELSE P.PRECIO_VENTA ');
           SQL.Add('        END PRECIO_VENTA');
           SQL.Add(' FROM ART_TARIFAS_PRECIOS P ');
           SQL.Add(' JOIN ART_TARIFAS_C T ON P.EMPRESA = T.EMPRESA AND P.TARIFA = T.TARIFA ');
           SQL.Add(' WHERE ');
           SQL.Add(' P.EMPRESA = :EMPRESA AND ');
           SQL.Add(' P.ARTICULO = :ARTICULO AND ');
           SQL.Add(' P.TARIFA = :TARIFA ');
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['TARIFA'].AsString := Tarifa;
           Params.ByName['ARTICULO'].AsString := Articulo;
           ExecQuery;
           Result := FieldByName['PRECIO_VENTA'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DamePrecioMercado(id_a: integer): double;
begin
  Result := 0;
  if (id_a > 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'SELECT PRECIO_MERCADO FROM ART_ARTICULOS_PRECIOS WHERE ID_A = :ID_A';
           Params.ByName['ID_A'].AsInteger := id_a;
           ExecQuery;
           Result := FieldByName['PRECIO_MERCADO'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.Download_HTM(const sURL, sLocalFileName: string): boolean;
begin
  Result := True;
  with TDownLoadURL.Create(nil) do
     try
        URL := sURL;
        FileName := sLocalFileName;
        try
           ExecuteTarget(nil);
        except
           Result := False
        end;
     finally
        Free;
     end;
end;

function TDMMain.ArticuloControlaStock(Articulo: string): boolean;
begin
  Result := False;
  if (Trim(Articulo) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Add(' SELECT CONTROL_STOCK FROM ART_ARTICULOS WHERE EMPRESA = :EMPRESA AND ARTICULO = :ARTICULO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ARTICULO'].AsString := Articulo;
           ExecQuery;
           Result := (FieldByName['CONTROL_STOCK'].AsInteger = 1);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.ArticuloControlaStock(ID_A: integer): boolean;
begin
  Result := False;
  if (ID_A > 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Add(' SELECT CONTROL_STOCK FROM ART_ARTICULOS WHERE ID_A = :ID_A ');
           Params.ByName['ID_A'].AsInteger := ID_A;
           ExecQuery;
           Result := (FieldByName['CONTROL_STOCK'].AsInteger = 1);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DameStockArticulo(Empresa, Canal: integer; Articulo, Almacen: string): double;
begin
  /// Devuelve el stock actual del articulo

  Result := DameStockArticuloFecha(Empresa, Canal, Articulo, Almacen, EncodeDate(3000, 01, 01));

  (*
       Se comenta porque no da los mismos resultados que A_ART_DAME_STOCK_ART_ED

  Result := 0;
  if (Trim(Articulo) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Add(' SELECT STOCK FROM ');
           SQL.Add(' A_ART_DAME_STOCK_SIN_VALORAR (:EMPRESA, :CANAL, :ALMACEN, :ARTICULO, 0) ');
           SQL.Add(' WHERE CANAL = :CANAL ');
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['CANAL'].AsInteger := Canal;
           Params.ByName['ALMACEN'].AsString := Almacen;
           Params.ByName['ARTICULO'].AsString := Articulo;
           ExecQuery;
           Result := FieldByName['STOCK'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
  *)
end;

function TDMMain.DameStockArticuloFecha(Empresa, Canal: integer; Articulo, Almacen: string; Fecha: TDateTime): double;
begin
  /// Devuelve el stock del articulo a una fecha

  Result := 0;
  if (Trim(Articulo) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           AutoTrans := False;
           Transaction := DameTransactionRW(DataBase);
           try
              Transaction.StartTransaction;
              // Temporal, por si falla esta forma de obtener stock
              if (EstadoKri(888) = 0) then
              begin
                 SQL.Add(' SELECT STOCK FROM A_ART_DAME_STOCK2(:EMPRESA, :CANAL, :ALMACEN, :ARTICULO, :FECHA) ');
              end
              else
              begin
                 SQL.Add(' SELECT SUM(EXISTENCIAS) STOCK FROM ');
                 SQL.Add(' A_ART_DAME_STOCK_ART_ED (:EMPRESA, :CANAL, :ARTICULO, :ALMACEN, 1, 0, 0, 0, 0, 0, 0, :FECHA) ');
                 SQL.Add(' WHERE (CANAL = :CANAL or :CANAL = 0) ');
              end;
              Params.ByName['EMPRESA'].AsInteger := Empresa;
              Params.ByName['CANAL'].AsInteger := Canal;
              Params.ByName['ARTICULO'].AsString := Articulo;
              Params.ByName['ALMACEN'].AsString := Almacen;
              Params.ByName['FECHA'].AsDateTime := Fecha;
              ExecQuery;
              Result := FieldByName['STOCK'].AsFloat;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DameStockVirtualArticulo(Empresa, Canal: integer; Articulo, Almacen: string): double;
begin
  /// Devuelve el stock virtual del articulo

  Result := 0;
  if (Trim(Articulo) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           AutoTrans := False;
           Transaction := DameTransactionRW(DataBase);
           try
              Transaction.StartTransaction;
              // Temporal, por si falla esta forma de obtener stock
              if (EstadoKri(888) = 0) then
              begin
                 SQL.Add(' SELECT (STOCK + PEDIDOS_A_PRO - PEDIDOS_D_CLI) STOCK FROM A_ART_DAME_STOCK2_PED(:EMPRESA, :CANAL, :ALMACEN, :ARTICULO, :FECHA) ');
              end
              else
              begin
                 SQL.Add(' SELECT SUM(STOCK_VIRTUAL) STOCK FROM ');
                 SQL.Add(' A_ART_DAME_STOCK_ART_ED (:EMPRESA, :CANAL, :ARTICULO, :ALMACEN, 1, 0, 1, 1, 0, 0, 0, :FECHA) ');
                 SQL.Add(' WHERE (CANAL = :CANAL or :CANAL = 0) ');
              end;
              Params.ByName['EMPRESA'].AsInteger := Empresa;
              Params.ByName['CANAL'].AsInteger := Canal;
              Params.ByName['ARTICULO'].AsString := Articulo;
              Params.ByName['ALMACEN'].AsString := Almacen;
              Params.ByName['FECHA'].AsDateTime := EncodeDate(3000, 01, 01);
              ExecQuery;
              Result := FieldByName['STOCK'].AsFloat;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DameStockRealArticulo(Empresa, Canal: integer; Articulo, Almacen: string): double;
begin
  /// Devuelve el (STOCK - PEDIOS DE CLIENTE) del articulo

  Result := 0;
  if (Trim(Articulo) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           AutoTrans := False;
           Transaction := DameTransactionRW(DataBase);
           try
              Transaction.StartTransaction;
              // Temporal, por si falla esta forma de obtener stock
              if (EstadoKri(888) = 0) then
              begin
                 SQL.Add(' SELECT (STOCK - PEDIDOS_D_CLI) STOCK FROM A_ART_DAME_STOCK2_PED(:EMPRESA, :CANAL, :ALMACEN, :ARTICULO, :FECHA) ');
              end
              else
              begin
                 SQL.Add(' SELECT SUM(EXISTENCIAS - PEDIDOS_D_CLI) STOCK FROM ');
                 SQL.Add(' A_ART_DAME_STOCK_ART_ED (:EMPRESA, :CANAL, :ARTICULO, :ALMACEN, 1, 0, 0, 1, 0, 0, 0, :FECHA) ');
                 SQL.Add(' WHERE (CANAL = :CANAL or :CANAL = 0) ');
              end;
              Params.ByName['EMPRESA'].AsInteger := Empresa;
              Params.ByName['CANAL'].AsInteger := Canal;
              Params.ByName['ARTICULO'].AsString := Articulo;
              Params.ByName['ALMACEN'].AsString := Almacen;
              Params.ByName['FECHA'].AsDateTime := EncodeDate(3000, 01, 01);
              ExecQuery;
              Result := FieldByName['STOCK'].AsFloat;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DameStockMontura(Empresa, Canal: integer; Articulo, Almacen: string): double;
begin
  /// Devuelve el stock virtual del articulo

  Result := 0;
  if (Trim(Articulo) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           AutoTrans := False;
           Transaction := DameTransactionRW(DataBase);
           try
              Transaction.StartTransaction;
              // Temporal, por si falla esta forma de obtener stock
              if (EstadoKri(888) = 0) then
              begin
                 SQL.Add(' SELECT A.EMPRESA, A.ARTICULO, M.ARTICULO_ESTRUCTURA, E.ARTICULO, ');
                 SQL.Add('        -- ');
                 SQL.Add('        (SELECT STOCK ');
                 SQL.Add('         FROM A_ART_DAME_STOCK2(E.EMPRESA, :CANAL, :ALMACEN, MAT.COMPONENTE, :FECHA)) AS STOCK ');
                 SQL.Add(' FROM ART_ARTICULOS A ');
                 SQL.Add(' JOIN ART_ARTICULOS_M_C_TALLAS MCT ON A.ARTICULO = MCT.ARTICULO ');
                 SQL.Add(' JOIN ART_ARTICULOS_MOD_COLOR MC ON MC.ID_A_M_C = MCT.ID_A_M_C ');
                 SQL.Add(' JOIN ART_ARTICULOS_MODELOS M ON M.ID_A_M = MC.ID_A_M ');
                 SQL.Add(' JOIN ART_ARTICULOS E ON E.EMPRESA = M.EMPRESA AND E.ARTICULO = M.ARTICULO_ESTRUCTURA ');
                 SQL.Add(' JOIN PRO_ESCANDALLO ESC ON ESC.EMPRESA = E.EMPRESA AND ESC.COMPUESTO = E.ARTICULO AND ESC.DEFECTO = 1 ');
                 SQL.Add(' JOIN PRO_MAT_ESC MAT ON MAT.ID_ESC = ESC.ID_ESC ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' A.EMPRESA = :EMPRESA AND ');
                 SQL.Add(' A.ARTICULO = :ARTICULO AND ');
                 SQL.Add(' -- Solo articulos que vienen de modelos de tallas y colores ');
                 SQL.Add(' A.ID_A_M_C_T > 0 ');
              end
              else
              begin
                 SQL.Add(' SELECT A.EMPRESA, A.ARTICULO, M.ARTICULO_ESTRUCTURA, E.ARTICULO, ');
                 SQL.Add('        -- ');
                 SQL.Add('        (SELECT SUM(STOCK_VIRTUAL) STOCK FROM ');
                 SQL.Add('         A_ART_DAME_STOCK_ART_ED (E.EMPRESA, :CANAL, MAT.COMPONENTE, :ALMACEN, 1, 0, 1, 1, 0, 0, 0, :FECHA) ');
                 SQL.Add('         WHERE (CANAL = :CANAL or :CANAL = 0)) AS STOCK ');
                 SQL.Add(' FROM ART_ARTICULOS A ');
                 SQL.Add(' JOIN ART_ARTICULOS_M_C_TALLAS MCT ON A.ARTICULO = MCT.ARTICULO ');
                 SQL.Add(' JOIN ART_ARTICULOS_MOD_COLOR MC ON MC.ID_A_M_C = MCT.ID_A_M_C ');
                 SQL.Add(' JOIN ART_ARTICULOS_MODELOS M ON M.ID_A_M = MC.ID_A_M ');
                 SQL.Add(' JOIN ART_ARTICULOS E ON E.EMPRESA = M.EMPRESA AND E.ARTICULO = M.ARTICULO_ESTRUCTURA ');
                 SQL.Add(' JOIN PRO_ESCANDALLO ESC ON ESC.EMPRESA = E.EMPRESA AND ESC.COMPUESTO = E.ARTICULO AND ESC.DEFECTO = 1 ');
                 SQL.Add(' JOIN PRO_MAT_ESC MAT ON MAT.ID_ESC = ESC.ID_ESC ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' A.EMPRESA = :EMPRESA AND ');
                 SQL.Add(' A.ARTICULO = :ARTICULO AND ');
                 SQL.Add(' -- Solo articulos que vienen de modelos de tallas y colores ');
                 SQL.Add(' A.ID_A_M_C_T > 0 ');
              end;
              Params.ByName['EMPRESA'].AsInteger := Empresa;
              Params.ByName['CANAL'].AsInteger := Canal;
              Params.ByName['ARTICULO'].AsString := Articulo;
              Params.ByName['ALMACEN'].AsString := Almacen;
              Params.ByName['FECHA'].AsDateTime := EncodeDate(3000, 01, 01);
              ExecQuery;
              Result := FieldByName['STOCK'].AsFloat;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DameStockRefBase(Empresa, Canal: integer; Articulo, Almacen: string): double;
begin
  /// Cliente: EGINER
  /// Devuelve el stock del articulo padre (Referencia Base)
  /// El articulo padre esta definido en el campo ALFA_1.

  Result := 0;
  if (Trim(Articulo) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           AutoTrans := False;
           Transaction := DameTransactionRW(DataBase);
           try
              Transaction.StartTransaction;
              // Temporal, por si falla esta forma de obtener stock
              if (EstadoKri(888) = 0) then
              begin
                 SQL.Add(' SELECT (SELECT STOCK FROM A_ART_DAME_STOCK2(A.EMPRESA, :CANAL, :ALMACEN, P.ARTICULO, :FECHA)) AS STOCK ');
                 SQL.Add(' FROM ART_ARTICULOS A ');
                 SQL.Add(' JOIN ART_ARTICULOS P ON A.EMPRESA = P.EMPRESA AND A.ALFA_1 = P.ARTICULO ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' A.EMPRESA = :EMPRESA AND ');
                 SQL.Add(' A.ARTICULO = :ARTICULO ');
                 SQL.Add(' ORDER BY P.ARTICULO ');
              end
              else
              begin
                 SQL.Add(' SELECT (SELECT SUM(STOCK_VIRTUAL) ');
                 SQL.Add('         FROM A_ART_DAME_STOCK_ART_ED(A.EMPRESA, :CANAL, P.ARTICULO, :ALMACEN, 1, 0, 1, 1, 0, 0, 0, :FECHA) ');
                 SQL.Add('         WHERE ');
                 SQL.Add('         (CANAL = :CANAL OR :CANAL = 0)) STOCK ');
                 SQL.Add(' FROM ART_ARTICULOS A ');
                 SQL.Add(' JOIN ART_ARTICULOS P ON A.EMPRESA = P.EMPRESA AND A.ALFA_1 = P.ARTICULO ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' A.EMPRESA = :EMPRESA AND ');
                 SQL.Add(' A.ARTICULO = :ARTICULO ');
                 SQL.Add(' ORDER BY P.ARTICULO ');
              end;
              Params.ByName['EMPRESA'].AsInteger := Empresa;
              Params.ByName['CANAL'].AsInteger := Canal;
              Params.ByName['ARTICULO'].AsString := Articulo;
              Params.ByName['ALMACEN'].AsString := Almacen;
              Params.ByName['FECHA'].AsDateTime := EncodeDate(3000, 01, 01);
              ExecQuery;
              Result := FieldByName['STOCK'].AsFloat;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DamePedidosDeCliente(Empresa, Canal: integer; Articulo, Almacen: string): double;
begin
  /// Devuelve la cantidad de unidades pendientes de servir.
  /// Si el almacen se deja vacio devuelve de todos los almacenes.

  //Result := 0;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Add('SELECT PEDIDOS_D_CLI FROM A_ART_DAME_PEDIDOS_CLI(:EMPRESA, :CANAL, :ALMACEN, :ARTICULO)');
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['ALMACEN'].AsString := Almacen;
        Params.ByName['ARTICULO'].AsString := Articulo;
        ExecQuery;
        Result := FieldByName['PEDIDOS_D_CLI'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DamePedidosAProveedor(Empresa, Canal: integer; Articulo, Almacen: string): double;
begin
  /// Devuelve la cantidad de unidades pendientes de recibir.
  /// Si el almacen se deja vacio devuelve de todos los almacenes.

  //Result := 0;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Add('SELECT PEDIDOS_A_PRO FROM A_ART_DAME_PEDIDOS_PRO(:EMPRESA, :CANAL, :ALMACEN, :ARTICULO)');
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['ALMACEN'].AsString := Almacen;
        Params.ByName['ARTICULO'].AsString := Articulo;
        ExecQuery;
        Result := FieldByName['PEDIDOS_A_PRO'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameMinIRPF: integer;
begin
  /// Devuelve el primer tipo de IRPF ordenado por porcentaje.
  /// Normalmente devolvera 'IRPF EXCENTO'

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Add('SELECT FIRST 1 TIPO FROM SYS_TIPO_IRPF WHERE PAIS=:PAIS ORDER BY P_IRPF');
        Params.ByName['PAIS'].AsString := REntorno.Pais;
        ExecQuery;
        Result := FieldByName['TIPO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMain.DameSaldoCliPro(Serie, Tipo: string; CodCliPro: integer; var SaldoDeudor: double; var SaldoAcreedor: double; var Saldo: double);
begin
  /// Devuelve la suma de saldos de las cuentas que tenga como proveedor, acreedor y cliente
  /// El SP mira el NIF del tercero y busca los saldos de las cuentas asociadas.

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Clear;
        SQL.Add('SELECT SUM(SALDO) AS SALDO, SUM(SALDO_DEUDOR) AS SALDO_DEUDOR, SUM(SALDO_ACREEDOR) AS SALDO_ACREEDOR ');
        SQL.Add('FROM KRI_SALDO_AGRUPADO_CLI_PRO(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?CODCLIPRO) ');
        // if ((Tipo='P') or (Tipo='A')) then
        //    SQL.Add('WHERE CUENTA STARTING WITH ''400'' OR CUENTA STARTING WITH ''410'' ');
        // if (Tipo='C') then
        //    SQL.Add('WHERE CUENTA STARTING WITH ''430'' ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['CODCLIPRO'].AsInteger := CodCliPro;
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;
        SaldoDeudor := FieldByName['SALDO_DEUDOR'].AsFloat;
        SaldoAcreedor := FieldByName['SALDO_ACREEDOR'].AsFloat;
        Saldo := FieldByName['SALDO'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMain.CreaMiniatura(Archivo: string; Imagen: TPicture);
const
  MINIATURA_WIDTH = 100;
  MINIATURA_HEIGHT = 100;
var
  XtractImage : IExtractImage;
  Bmp : TBitmap;
  Icon : TIcon;
  ColorDepth : integer;
  Flags : DWORD;
  RT : IRunnableTask;
begin
  // Obtiene miniatura.

  // Puede ser 4, 8, 16, 24, 32
  ColorDepth := 16;

  // Estas constantes estan en ShObjIdlQuot
  Flags := IEIFLAG_SCREEN + IEIFLAG_QUALITY;

  Bmp := nil;
  Icon := nil;
  try
     if GetExtractImageItfPtr(Archivo, XTractImage) and
        ExtractImageGetFileThumbnail(XtractImage, MINIATURA_WIDTH, MINIATURA_HEIGHT,
        ColorDepth, Flags, RT, Bmp) then
     begin
        Imagen.Assign(Bmp);
     end
     else
     begin
        if GetFileLargeIcon(Archivo, Icon) then
        begin
           Bmp := TBitmap.Create;
           Bmp.Height := Icon.Height;
           Bmp.Width := Icon.Width;
           Bmp.Canvas.Draw(0, 0, Icon);
           Imagen.Assign(Bmp);
        end;
     end;
  finally
     Icon.Free;
     Bmp.Free;
  end;
end;

procedure TDMMain.CargaImageListGaleria(IdGaleria: integer; Lista: TListView; Alto: integer = 0; Ancho: integer = 0);
var
  Imagen : TImage;
  Item : TListItem;
  RDim : TRect;
begin
  Lista.Clear;
  if not Assigned(Lista.LargeImages) then
     Lista.LargeImages := TImageList.Create(Lista);
  Lista.LargeImages.Clear;

  if ((Alto = 0) and (Ancho = 0)) then
  begin
     Alto := 100;
     Ancho := 100;
  end;

  Lista.LargeImages.Height := Alto;
  Lista.LargeImages.Width := Ancho;

  RDim.Left := 0;
  RDim.Top := 0;
  RDim.Right := Lista.LargeImages.Height;
  RDim.Bottom := Lista.LargeImages.Width;

  Imagen := TImage.Create(Self);
  try
     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           Transaction := DameTransactionRO(Self.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT CODIGO, NOMBRE FROM VER_GALERIA_IMAGEN WHERE ID_GALERIA = ?ID_GALERIA ORDER BY ORDEN');
              Params.ByName['ID_GALERIA'].AsInteger := IdGaleria;

              Open;
              First;
              while not EOF do
              begin
                 Item := Lista.Items.Add;
                 Item.Caption := FieldByName('NOMBRE').AsString;
                 Item.Data := Pointer(FieldByName('CODIGO').AsInteger);

                 Imagen.Picture := nil;
                 RefrescarImagen(Imagen, FieldByName('CODIGO').AsInteger);
                 Imagen.Picture.Bitmap.Canvas.StretchDraw(RDim, Imagen.Picture.Graphic);
                 Imagen.Picture.Bitmap.Height := Lista.LargeImages.Height;
                 Imagen.Picture.Bitmap.Width := Lista.LargeImages.Width;
                 Item.ImageIndex := Lista.LargeImages.Add(Imagen.Picture.Bitmap, nil);

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
  finally
     Imagen.Free;
  end;
end;

procedure TDMMain.AbrirArchivo(Archivo: string);
var
  Resultado : word;
begin
  // Se utiliza cadena vacía en vez de 'open' porque algunas aplicaciones no tienen esta accion.
  Resultado := ShellExecute(Application.Handle, '' {'open'}, PChar(Archivo), nil, nil, SW_SHOW);
  // Resultado <= 32 es un error
  case Resultado of
     0: ShowMessage(_('El sistema operativo no tiene memoria o recursos suficiente.')); // The operating system is out of memory or resources
     ERROR_BAD_FORMAT {11}: ShowMessage(_('El archivo EXE es inválido.')); // The .EXE file is invalid (non-Win32 .EXE or error in .EXE image)
     SE_ERR_ACCESSDENIED{5}: ShowMessage(_('El sistema operativo denego el acceso al archivo especificado.')); // The operating system denied access to the specified file
     SE_ERR_ASSOCINCOMPLETE{27}: ShowMessage(_('El archivo asociado es incompatible o inválido.')); //The filename association is incomplete or invalid
     SE_ERR_DDEBUSY{30}: ShowMessage(_('La transacción DDE no pudo completarse porque otra transaccion DDE estaba siendo procesada.')); // The DDE transaction could not be completed because other DDE transactions were being processed
     SE_ERR_DDEFAIL{29}: ShowMessage(_('La transacción DDE falló.')); // The DDE transaction failed
     SE_ERR_DDETIMEOUT{28}: ShowMessage(_('La transacción DDE no pudo completarse porque ha expirado.')); // The DDE transaction could not be completed because the request timed out
     SE_ERR_DLLNOTFOUND{32}: ShowMessage(_('La librería dinamica especificada no se ha encontrado.')); // The specified dynamic-link library was not found
     SE_ERR_FNF{2}: ShowMessage(_('El archivo no ha sido encontrado.')); //The specified file was not found
     SE_ERR_NOASSOC{31}: ShowMessage(_('No hay ninguna aplicación asociada con la extensión del archivo dado.')); // There is no application associated with the given filename extension
     SE_ERR_OOM{8}: ShowMessage(_('No ha habido memoria suficiente para completar la operación.')); // There was not enough memory to complete the operation
     SE_ERR_PNF{3}: ShowMessage(_('No se ha encontrado la carpeta especificada.')); // The specified path was not found
     SE_ERR_SHARE{26}: ShowMessage(_('Error de permisos.')); // A sharing violation occurred
  end;
end;

function TDMMain.DameConstanteProduccion(Valor: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT ' + Valor + ' FROM PRO_CONSTANTES WHERE EMPRESA = :EMPRESA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        Result := Fields[0].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameConstanteProduccionS(Valor: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT ' + Valor + ' FROM PRO_CONSTANTES WHERE EMPRESA = :EMPRESA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        Result := Fields[0].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameSituacionOrden(IdOrden: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT SITUACION FROM PRO_ORD WHERE ID_ORDEN = :ID_ORDEN';
        Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
        ExecQuery;
        Result := FieldByName['SITUACION'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameTelefonoTercero(Tercero: integer): string;
begin
  Result := '';
  if (Tercero > 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'SELECT DIR_TELEFONO01 FROM SYS_TERCEROS_DIRECCIONES WHERE TERCERO = ?TERCERO AND DIR_DEFECTO = 1';
           Params.ByName['TERCERO'].AsInteger := Tercero;
           ExecQuery;
           Result := FieldByName['DIR_TELEFONO01'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DamePVPPorUdSecundaria(id_a: integer): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT PVP_POR_UD_SECUNDARIA FROM ART_ARTICULOS WHERE ID_A=' + IntToStr(id_a);
        ExecQuery;
        Result := (FieldByName['PVP_POR_UD_SECUNDARIA'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.ClienteValido(Cliente: integer): boolean;
begin
  Result := True;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT MOROSO, BAJA, FECHA_BAJA, MOTIVO_BAJA FROM EMP_CLIENTES WHERE EMPRESA = ?EMPRESA AND CLIENTE = ?CLIENTE';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        ExecQuery;
        if FieldByName['MOROSO'].AsInteger = 1 then
        begin
           MessageDlg(_('Este Cliente es Moroso'), mtWarning, [mbOK], 0);
           if (LeeParametro('CLIPEMO001', '') <> 'S') then {si S, permite seguir}
              Result := False;
        end;
        if FieldByName['BAJA'].AsInteger = 1 then
        begin
           MessageDlg(Format(_('Este Cliente ha sido dado de baja.' + #13#10 + 'Fecha: %s' + #13#10 + 'Motivo: %s'), [DateToStr(FieldByName['FECHA_BAJA'].AsDateTime), FieldByName['MOTIVO_BAJA'].AsString]), mtWarning, [mbOK], 0);
           Result := False;
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.ProveedorValido(Proveedor: integer): boolean;
begin
  Result := True;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT BAJA, FECHA_BAJA, MOTIVO_BAJA FROM EMP_PROVEEDORES WHERE EMPRESA = ?EMPRESA AND PROVEEDOR = ?PROVEEDOR';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        ExecQuery;
        if FieldByName['BAJA'].AsInteger = 1 then
        begin
           MessageDlg(Format(_('Este Proveedor ha sido dado de baja.' + #13#10 + 'Fecha: %s' + #13#10 + 'Motivo: %s'), [DateToStr(FieldByName['FECHA_BAJA'].AsDateTime), FieldByName['MOTIVO_BAJA'].AsString]), mtWarning, [mbOK], 0);
           Result := False;
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.AcreedorValido(Acreedor: integer): boolean;
begin
  Result := True;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT BAJA, FECHA_BAJA, MOTIVO_BAJA FROM EMP_ACREEDORES WHERE EMPRESA = ?EMPRESA AND ACREEDOR = ?ACREEDOR';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ACREEDOR'].AsInteger := Acreedor;
        ExecQuery;
        if FieldByName['BAJA'].AsInteger = 1 then
        begin
           MessageDlg(Format(_('Este Acreedor ha sido dado de baja.' + #13#10 + 'Fecha: %s' + #13#10 + 'Motivo: %s'), [DateToStr(FieldByName['FECHA_BAJA'].AsDateTime), FieldByName['MOTIVO_BAJA'].AsString]), mtWarning, [mbOK], 0);
           Result := False;
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameCambio(ResultVer: boolean; MonedaOrigen, MonedaDestino: string; Fecha: TDateTime; Importe: double; Factor: double = 0): double;
begin
  if ((MonedaOrigen = MonedaDestino) or (Importe = 0)) then
     Result := Importe
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE S_CAMBIA_IMPORTE(?ORIGEN, ?DESTINO, ?FECHA, ?IMPORTE, ?FACTOR)';
           Params.ByName['ORIGEN'].AsString := MonedaOrigen;
           Params.ByName['DESTINO'].AsString := MonedaDestino;
           Params.ByName['FECHA'].AsDateTime := Fecha;
           Params.ByName['IMPORTE'].AsFloat := Importe;
           Params.ByName['FACTOR'].AsFloat := Factor;
           ExecQuery;
           if ResultVer then
              Result := FieldByName['RESULTVER'].AsFloat
           else
              Result := FieldByName['RESULTCALC'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DameSignoUnidadArticulo(Articulo: string): string;
begin
  Result := '';
  if (Trim(Articulo) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE DAME_ART_UNIDAD(?EMPRESA, ?ARTICULO)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ARTICULO'].AsString := Articulo;
           ExecQuery;
           Result := FieldByName['SIGNO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DameDecimalesUnidad(Tipo: string): integer;
begin
  Result := 0;
  Tipo := Trim(Tipo);
  if (Tipo > '') then
  begin
     if (Tipo = UltimaUnidad) then
        Result := UltimoDecimales
     else
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT DECIMALES FROM SYS_UNIDADES_ARTICULOS WHERE TIPO = ?TIPO';
              Params.ByName['TIPO'].AsString := Tipo;
              ExecQuery;
              Result := FieldByName['DECIMALES'].AsInteger;
              UltimaUnidad := Tipo;
              UltimoDecimales := FieldByName['DECIMALES'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

procedure TDMMain.SaldoAnticipo(Tipo: string; CodCliPro: integer; Fecha: TDateTime; var Saldo: double; var Moneda: string);
var
  Select : string;
  UsarAnticipos : boolean;
begin
  Saldo := 0;
  Moneda := REntorno.Moneda;

  if (Tipo = 'CLI') then
     Select := 'SELECT USAR_ANTICIPOS FROM EMP_CLIENTES WHERE EMPRESA = ?EMPRESA AND CLIENTE = ?COD_CLI_PRO'
  else
  if (Tipo = 'PRO') then
     Select := 'SELECT USAR_ANTICIPOS FROM EMP_PROVEEDORES WHERE EMPRESA = ?EMPRESA AND PROVEEDOR = ?COD_CLI_PRO'
  else
  if (Tipo = 'ACR') then
     Select := 'SELECT USAR_ANTICIPOS FROM EMP_ACREEDORES WHERE EMPRESA = ?EMPRESA AND ACREEDOR = ?COD_CLI_PRO';

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := Select;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['COD_CLI_PRO'].AsInteger := CodCliPro;
        ExecQuery;
        UsarAnticipos := (FieldByName['USAR_ANTICIPOS'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (UsarAnticipos) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE C_DAME_SALDO_CUENTA_ANT (?EMPRESA, ?EJERCICIO, ?CANAL, ?TIPO_TERCERO, ?COD_CLI_PRO, ?FECHA)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['TIPO_TERCERO'].AsString := Tipo;
           Params.ByName['COD_CLI_PRO'].AsInteger := CodCliPro;
           Params.ByName['FECHA'].AsDateTime := Fecha;
           ExecQuery;
           Saldo := FieldByName['SALDO'].AsFloat;
           Moneda := FieldByName['MONEDA'].AsString;
           if (Tipo = 'CLI') then
              Saldo := Saldo * (-1);
           FreeHandle;
        finally
           Free;
        end;
     end;

     {dji lrk kri - Santa Lucia - Que pueda tomar los Anticipos sin cerrar ejercicio}
     if (not DMMain.EjercicioContableAbierto(REntorno.Ejercicio)) then
     begin
        // Capturo excepciones por si el cod_cli_pro no existe en este ejercicio
        try
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := Self.DataBase;
                 SQL.Text := 'EXECUTE PROCEDURE C_DAME_SALDO_CUENTA_ANT (?EMPRESA, ?EJERCICIO, ?CANAL, ?TIPO_TERCERO, ?COD_CLI_PRO, ?FECHA)';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio - 1;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['TIPO_TERCERO'].AsString := Tipo;
                 Params.ByName['COD_CLI_PRO'].AsInteger := CodCliPro;
                 Params.ByName['FECHA'].AsDateTime := EncodeDate(REntorno.Ejercicio - 1, 01, 01); {QMCarteraDetalleVENCIMIENTO.AsDateTime}
                 ExecQuery;
                 if (Tipo = 'CLI') then
                    Saldo := Saldo + (FieldByName['SALDO'].AsFloat * (-1))
                 else
                    Saldo := Saldo + FieldByName['SALDO'].AsFloat;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        except
        end;
     end;
  end;
end;

function TDMMain.DameMascaraUnidades(Articulo: string): string;
begin
  /// Devuelve mascara con los decimales que tenga el tipo de unidades que utilice el articulo
  /// Si el tipo de unidad es Mi o Tn muestra todos los decimales

  // Si es un articulo diferente al ultimo que se trato busco su unidad y decimales
  if (Articulo <> UltimoMascaraUnidadesArticulo) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Add(' SELECT A.UNIDADES, U.DECIMALES FROM ART_ARTICULOS A ');
           SQL.Add(' JOIN SYS_UNIDADES_ARTICULOS U ');
           SQL.Add(' ON A.UNIDADES = U.TIPO ');
           SQL.Add(' WHERE A.EMPRESA = :EMPRESA AND A.ARTICULO = :ARTICULO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ARTICULO'].AsString := Articulo;
           ExecQuery;
           UltimoMascaraUnidadesTipoUnidad := FieldByName['UNIDADES'].AsString;
           UltimoMascaraUnidadesDecimales := FieldByName['DECIMALES'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     UltimoMascaraUnidadesArticulo := Articulo;
  end;

  Result := CalculaMascara(UltimoMascaraUnidadesDecimales, ((UltimoMascaraUnidadesTipoUnidad = 'Mi') or (UltimoMascaraUnidadesTipoUnidad = 'Tn')));
end;

function TDMMain.DameDecimalesUnidadArticulo(Articulo: string): integer;
begin
  /// Decimales utilizados segun unidad de medida del articulo

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Add(' SELECT U.DECIMALES FROM ART_ARTICULOS A ');
        SQL.Add(' JOIN SYS_UNIDADES_ARTICULOS U ');
        SQL.Add(' ON A.UNIDADES = U.TIPO ');
        SQL.Add(' WHERE A.EMPRESA = :EMPRESA AND A.ARTICULO = :ARTICULO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        ExecQuery;
        Result := FieldByName['DECIMALES'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameUnidadesConFormato(Articulo: string; Unidades: double): string;
begin
  /// Devuelve unidades con los decimales que tenga el tipo de unidades que utilice el articulo
  /// Si el tipo de unidad es Mi o Tn muestra todos los decimales

  Result := FormatFloat(DameMascaraUnidades(Articulo), Unidades);
end;

function TDMMain.DamePrecioCosteArticulo(Articulo: string): double;
begin
  Result := 0;
  if (Trim(Articulo) > '') then
  begin
     with THYFIBQuery.Create(Self) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'SELECT P_COSTE FROM ART_ARTICULOS WHERE EMPRESA = ?EMPRESA AND ARTICULO = ?ARTICULO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ARTICULO'].AsString := Trim(Articulo);
           ExecQuery;
           Result := FieldByName['P_COSTE'].AsFloat;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.AceptaRECC(Tipo: string; Codigo: integer): boolean;
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        if (Tipo = 'CLI') then
           SQL.Text := 'SELECT RECC FROM EMP_CLIENTES WHERE EMPRESA = ?EMPRESA AND CLIENTE = ?CODIGO';
        if (Tipo = 'PRO') then
           SQL.Text := 'SELECT RECC FROM EMP_PROVEEDORES WHERE EMPRESA = ?EMPRESA AND PROVEEDOR = ?CODIGO';
        if (Tipo = 'ACR') then
           SQL.Text := 'SELECT RECC FROM EMP_ACREEDORES WHERE EMPRESA = ?EMPRESA AND ACREEDOR = ?CODIGO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CODIGO'].AsInteger := Codigo;
        ExecQuery;
        Result := (FieldByName['RECC'].AsInteger = 1);
     finally
        Free;
     end;
  end;
end;

procedure TDMMain.CargarClipboardTexto(s: string);
begin
  Clipboard.SetTextBuf(PChar(s));
end;

procedure TDMMain.CargarClipboardImagen(Codigo: integer);
var
  Imagen : TImage;
  JPG : TJpegImage;
  Stream : TStream;
  MyFormat : word;
  AData : THandle;
  APalette : HPALETTE;
begin
  Imagen := TImage.Create(Self);
  JPG := TJpegImage.Create;
  try
     RefrescarImagen(Imagen, Codigo);

     // Convierto imagen a JPG
     JPG.Assign(Imagen.Picture.Bitmap);
     JPG.CompressionQuality := 80;
     JPG.Compress;

     Stream := TMemoryStream.Create;
     try
        JPG.SaveToStream(Stream);
        JPG.SaveToClipBoardFormat(MyFormat, AData, APalette);
        ClipBoard.SetAsHandle(MyFormat, AData);
     finally
        Stream.Free;
     end;
  finally
     Imagen.Free;
     JPG.Free;
  end;
end;

procedure TDMMain.EstableceIdiomaCanal;
begin
  // Busco el idioma del canal
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT IDIOMA FROM SYS_PAISES WHERE PAIS=?PAIS';
        Params.ByName['PAIS'].AsString := REntorno.Pais;
        ExecQuery;
        REntorno.IdiomaCanal := FieldByName['IDIOMA'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.BusquedaArticulo(Descripcion, Almacen: string; Cliente: integer = 0; CampoNroSerie: TField = nil): string;
begin
  /// Buscamos el codigo en varias tablas y devuelve su codigo y tabla donde se encuentra
  /// Barras -> Nro. Serie -> Cod. Articulo de Cliente -> Cod. Articulo de la empresa

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := ' EXECUTE PROCEDURE A_ART_BUSQUEDA(:EMPRESA, :EJERCICIO, :CANAL, :DESCRIPCION, :ALMACEN, :CLIENTE) ';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['DESCRIPCION'].AsString := Descripcion;
        Params.ByName['ALMACEN'].AsString := Almacen;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        ExecQuery;

        // Si lo encuentra en una tabla
        if (FieldByName['TABLA'].AsString <> '') then
        begin
           Result := FieldByName['ARTICULO'].AsString;

           // Si se informa el campo para el Nro. de Serie, lo rellenamos
           if ((FieldByName['TABLA'].AsString = 'SERIE') and (TField <> nil)) then
              CampoNroSerie.AsString := Descripcion;
        end
        else
           Result := Descripcion;

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameLoteSiguiente(id_a, RIG: integer; Tipo: string; IdDoc: integer = 0): string;
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := Self.DataBase;
        Close;
        SQL.Text := 'SELECT LOTE FROM A_ART_DAME_LOTE_SIGUIENTE(:ID_A, :RIG, :TIPO, :IDDOC)';
        Params.ByName['ID_A'].AsInteger := id_a;
        Params.ByName['RIG'].AsInteger := RIG;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['IDDOC'].AsInteger := IdDoc;
        ExecQuery;
        Result := FieldByName['LOTE'].AsString;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.CrearLote(id_a: integer; Lote: string; Clasificacion: string = ''; Almacen: string = ''): integer;
var
  id_lote : integer;
  Articulo : string;
begin
  /// Crea el Lote para el articulo.
  /// Si ya existe solo devuelve el ID del lote.
  /// Si LOTE viene vacio crea un lote nuevo segun la funcion DameLoteSiguiente();
  /// Si el almacen viene vacio, lo crea utilizando el almacen por defecto (aunque esta informacion no es necesaria).

  // Limpieza de parametros
  Lote := Trim(Lote);
  Clasificacion := Trim(Clasificacion);
  Almacen := Trim(Almacen);

  // Averiguo el ID del articulo, puesto que puede que ya exista
  Articulo := DameArticulo(id_a);

  //Si el lote es vacio deberia crear un nuevo lote
  if (Lote <> '') then
     id_lote := DameIDLote(Articulo, Lote)
  else
     id_lote := 0;

  // Si no existe, lo creo
  if (id_lote = 0) then
  begin
     // Generar el id_lote
     id_lote := DMMain.ContadorGen('ID_LOTES');

     if (Lote = '') then
     begin
        if (EstadoKri(491) = 1) then
           Lote := IntToStr(id_lote)
        else
           raise Exception.Create(_('El Lote vacio'));
     end;

     if (Almacen = '') then
        Almacen := REntorno.AlmacenDefecto;

     // Caso especial para JVV en el caso del compuesto tenga mas de un SEMI
     if ((Clasificacion = 'CLASIFICACION <- ID_LOTE') and (EstadoKri(493) = 1)) then
        Clasificacion := IntToStr(id_lote);

     // Insertar el lote
     with THYFIBQuery.Create(nil) do
     begin
        try
           Database := DMMain.DataBase;
           // Transaction := TLocal;
           SQL.Add(' INSERT INTO ART_ARTICULOS_LOTES ( ');
           SQL.Add(' EMPRESA, CANAL, ALMACEN, ARTICULO, LOTE, CLASIFICACION, ');
           SQL.Add(' F_ENVASADO, F_CADUCIDAD, F_FABRICACION, ID_A, PROVEEDOR, ');
           SQL.Add(' ID_LOTE, NOTAS, CODIGO) ');
           SQL.Add(' VALUES ( ');
           SQL.Add(' :EMPRESA, :CANAL, :ALMACEN, :ARTICULO, :LOTE, :CLASIFICACION, ');
           SQL.Add(' :F_ENVASADO, :F_CADUCIDAD, :F_FABRICACION, :ID_A, :PROVEEDOR, ');
           SQL.Add(' :ID_LOTE, :NOTAS, :CODIGO) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ARTICULO'].AsString := Articulo;
           Params.ByName['LOTE'].AsString := Lote;
           Params.ByName['ID_LOTE'].AsInteger := id_lote;
           Params.ByName['ID_A'].AsInteger := id_a;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['ALMACEN'].AsString := Almacen;
           if ((Clasificacion = '') and (EstadoKri(491) = 1)) then
              Params.ByName['CLASIFICACION'].AsString := IntToStr(id_lote)
           else
              Params.ByName['CLASIFICACION'].AsString := Clasificacion;
           Params.ByName['F_ENVASADO'].AsDateTime := Now;
           Params.ByName['F_CADUCIDAD'].AsDateTime := Now;
           Params.ByName['F_FABRICACION'].AsDateTime := Now;
           Params.ByName['PROVEEDOR'].AsInteger := -1;
           Params.ByName['NOTAS'].AsString := '';
           Params.ByName['CODIGO'].AsInteger := StrToIntDef(Lote, 0);
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  Result := id_lote;
end;

{$IFDEF Debug}
function TDMMain.ServidorActivo: boolean;
begin
  // Result := Ping(IP_Servidor);
end;
{$ENDIF}

function TDMMain.ControlStockNegativoEmpresa: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT CONTROL_STOCK_NEG FROM SYS_EMPRESAS WHERE EMPRESA = :EMPRESA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        Result := (FieldByName['CONTROL_STOCK_NEG'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameLineaSiguiente(Tipo: string; IdDoc: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;

        if ((Tipo = 'OFP') or (Tipo = 'OCP') or (Tipo = 'ALP') or (Tipo = 'PEP') or (Tipo = 'FAP') or (Tipo = 'FCR')) then
           SQL.Text := 'SELECT MAX(LINEA) FROM GES_DETALLES_E WHERE ID_E = :ID_DOC'
        else
        if ((Tipo = 'OFC') or (Tipo = 'ALB') or (Tipo = 'PEC') or (Tipo = 'FAC')) then
           SQL.Text := 'SELECT MAX(LINEA) FROM GES_DETALLES_S WHERE ID_S = :ID_DOC'
        else
        if (Tipo = 'MOV') then
           SQL.Text := 'SELECT MAX(LINEA) FROM GES_DETALLES_ST WHERE ID_ST = :ID_DOC'
        else
        if (Tipo = 'REG') then
           SQL.Text := 'SELECT MAX(LINEA) FROM ART_REG_INVENTARIO_DETALLE WHERE ID_REG = :ID_DOC'
        else
        if (Tipo = 'PEA') then
           SQL.Text := 'SELECT MAX(LINEA) FROM GES_DETALLES_PEA WHERE (ID_CAB = :ID_DOC)'
        else
        if (Tipo = 'REP') then
           SQL.Text := 'SELECT MAX(LINEA) FROM REPAR_DET_REPARACIONES WHERE IDCABREPARAR = ?ID_DOC'
        else
        if (Tipo = 'PLA') then
           SQL.Text := 'SELECT MAX(LINEA) FROM PRO_PMP_DET WHERE ID_PLANIFICACION = :ID_DOC';

        Params.ByName['ID_DOC'].AsInteger := IdDoc;
        ExecQuery;
        Result := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DamePedidoMinimoArticuloProveedor(id_a, proveedor: integer): double;
begin
  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := Self.DataBase;
        Close;
        SQL.Text := 'SELECT PEDIDO_MINIMO FROM ART_ARTICULOS_PROVEEDORES WHERE ID_A = :ID_A AND PROVEEDOR = :PROVEEDOR';
        Params.ByName['ID_A'].AsInteger := id_a;
        Params.ByName['PROVEEDOR'].AsInteger := proveedor;
        ExecQuery;
        Result := FieldByName['PEDIDO_MINIMO'].AsFloat;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DamePrefijoArticulo(Modelo: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT PREFIJO_ARTICULO FROM DAME_PREFIJOS_MODELO(?MODELO)';
        Params.ByName['MODELO'].AsString := Modelo;
        ExecQuery;
        Result := FieldByName['PREFIJO_ARTICULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameArticuloSegunMedidas(Modelo, TipoLona: string; Lineal, Salida: double): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT ARTICULO FROM DAME_ARTICULO_SEGUN_MEDIDAS (:MODELO, :LINEAL, :SALIDA, :TIPO_LONA)';
        Params.ByName['MODELO'].AsString := Modelo;
        Params.ByName['LINEAL'].AsInteger := Trunc(Lineal);
        Params.ByName['SALIDA'].AsInteger := Trunc(Salida);
        Params.ByName['TIPO_LONA'].AsString := TipoLona;
        ExecQuery;
        Result := FieldByName['ARTICULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.ClienteBloqueado(Cliente: integer; Empresa: integer = 0): boolean;
var
  Mensaje, Tipo : string;
  Bloqueo : integer;
begin
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT BLOQUEO, MOTIVO_BLOQUEO FROM EMP_CLIENTES WHERE EMPRESA = ?EMPRESA AND CLIENTE = ?CLIENTE';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        ExecQuery;
        Bloqueo := FieldByName['BLOQUEO'].AsInteger;
        Mensaje := FieldByName['MOTIVO_BLOQUEO'].AsString;
        FreeHandle;
     finally
        Free;
     end;

     {0.- Sin mensaje
      1.- Aviso
      2.- Bloquear}
     Result := (Bloqueo = 2);
     if (Bloqueo > 0) then
     begin
        Mensaje := _('Motivo') + ': ' + Mensaje;

        if (Bloqueo = 1) then
           Tipo := _('Aviso');

        if (Bloqueo = 2) then
           Tipo := _('Bloqueo');

        Application.MessageBox(PChar(Mensaje), PChar(Tipo), mb_iconinformation + mb_ok);
     end;
  end;
end;

procedure TDMMain.MuestraAviso(Tipo: string; Id: integer; TipoDocumento: string);
var
  Mensaje, TipoMensaje : string;
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
           SelectSQL.Add(' SELECT MENSAJE FROM EMP_AVISOS ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' TIPO_OBJETO = :TIPO_OBJETO AND ');
           SelectSQL.Add(' ID_OBJETO = :ID_OBJETO AND ');
           SelectSQL.Add(' TIPO_DOCUMENTO = :TIPO_DOCUMENTO AND ');
           SelectSQL.Add(' ACTIVO = 1 ');
           Params.ByName['TIPO_OBJETO'].AsString := Tipo;
           Params.ByName['ID_OBJETO'].AsInteger := Id;
           Params.ByName['TIPO_DOCUMENTO'].AsString := TipoDocumento;
           Open;
           Mensaje := Trim(FieldByName('MENSAJE').AsString);
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;

  if (Mensaje > '') then
  begin
     TipoMensaje := _('Aviso');
     Application.MessageBox(PChar(Mensaje), PChar(TipoMensaje), mb_iconinformation + mb_ok);
  end;
end;

function TDMMain.ProveedorBloqueado(Proveedor: integer; Empresa: integer = 0): boolean;
var
  Mensaje, Tipo : string;
  Bloqueo : integer;
begin
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT BLOQUEO, MOTIVO_BLOQUEO FROM EMP_PROVEEDORES WHERE EMPRESA = ?EMPRESA AND PROVEEDOR = ?PROVEEDOR';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        ExecQuery;
        Bloqueo := FieldByName['BLOQUEO'].AsInteger;
        Mensaje := FieldByName['MOTIVO_BLOQUEO'].AsString;
        FreeHandle;
     finally
        Free;
     end;

     {0.- Sin mensaje
      1.- Aviso
      2.- Bloquear}
     Result := (Bloqueo = 2);
     if (Bloqueo > 0) then
     begin
        Mensaje := _('Motivo') + ': ' + Mensaje;

        if (Bloqueo = 1) then
           Tipo := _('Aviso');

        if (Bloqueo = 2) then
           Tipo := _('Bloqueo');

        Application.MessageBox(PChar(Mensaje), PChar(Tipo), mb_iconinformation + mb_ok);
     end;
  end;
end;

function TDMMain.AcreedorBloqueado(Acreedor: integer; Empresa: integer = 0): boolean;
var
  Mensaje, Tipo : string;
  Bloqueo : integer;
begin
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT BLOQUEO, MOTIVO_BLOQUEO FROM EMP_ACREEDORES WHERE EMPRESA = ?EMPRESA AND ACREEDOR = ?ACREEDOR';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['ACREEDOR'].AsInteger := Acreedor;
        ExecQuery;
        Bloqueo := FieldByName['BLOQUEO'].AsInteger;
        Mensaje := FieldByName['MOTIVO_BLOQUEO'].AsString;
        FreeHandle;
     finally
        Free;
     end;

     {0.- Sin mensaje
      1.- Aviso
      2.- Bloquear}
     Result := (Bloqueo = 2);
     if (Bloqueo > 0) then
     begin
        Mensaje := _('Motivo') + ': ' + Mensaje;

        if (Bloqueo = 1) then
           Tipo := _('Aviso');

        if (Bloqueo = 2) then
           Tipo := _('Bloqueo');

        Application.MessageBox(PChar(Mensaje), PChar(Tipo), mb_iconinformation + mb_ok);
     end;
  end;
end;

function TDMMain.DameFamiliaArticulo(Articulo: string; Empresa: integer = 0): string;
begin
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT FAMILIA FROM ART_ARTICULOS WHERE EMPRESA = :EMPRESA AND ARTICULO = :ARTICULO';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        ExecQuery;
        Result := FieldByName['FAMILIA'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameGrupoGrupoTalla(IdGrupoTalla: integer): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT GRUPO FROM ART_GRUPOS_TALLAS WHERE ID_G_T = :ID_G_T';
        Params.ByName['ID_G_T'].AsInteger := IdGrupoTalla;
        ExecQuery;
        Result := FieldByName['GRUPO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameMinDireccion(Tercero: integer): integer;
begin
  Result := 0;

  if (Tercero <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT DIRECCION FROM SYS_TERCEROS_DIRECCIONES ');
           SQL.Add(' WHERE ');
           SQL.Add(' TERCERO = :TERCERO AND ');
           SQL.Add(' ACTIVO = 1 ');
           SQL.Add(' ORDER BY DIR_DEFECTO DESC ');
           Params.ByName['TERCERO'].AsInteger := Tercero;
           ExecQuery;
           Result := FieldByName['DIRECCION'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DameDescripcionColor(Color: string): string;
begin
  Result := '';
  if (Trim(Color) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'SELECT DESCRIPCION FROM Z_SYS_COLORES WHERE CODIGO = :COLOR';
           Params.ByName['COLOR'].AsString := Color;
           ExecQuery;
           Result := FieldByName['DESCRIPCION'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DameMargenUtilidad(PrecioVenta, PrecioCoste: double): double;
begin
  if (PrecioVenta <> 0) then
     Result := (1 - (PrecioCoste / PrecioVenta)) * 100
  else
     Result := 0;
end;

function TDMMain.DameTotalRecibosDocumento(IdS: integer): double;
begin
  /// (Recibos relacionados con documentos de los que hereda)
  /// + (Recibos relacionados con el documento)

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT (COALESCE((SELECT SUM(DET.LIQUIDO) ');
        SQL.Add('         FROM G_RELACIONES_ORIGENES_ID(:ID_S) DOC ');
        SQL.Add('         JOIN GES_CABECERAS_S_CAR REC ON REC.ID_S = DOC.ID_S ');
        SQL.Add('         JOIN EMP_CARTERA CAR ON REC.ID_CARTERA = CAR.ID_CARTERA ');
        SQL.Add('         JOIN EMP_CARTERA_DETALLE DET ON DET.ID_CARTERA = CAR.ID_CARTERA), 0) ');
        SQL.Add('        + ');
        SQL.Add('        COALESCE((SELECT SUM(DET.LIQUIDO) ');
        SQL.Add('         FROM GES_CABECERAS_S DOC ');
        SQL.Add('         JOIN GES_CABECERAS_S_CAR REC ON REC.ID_S = DOC.ID_S ');
        SQL.Add('         JOIN EMP_CARTERA CAR ON REC.ID_CARTERA = CAR.ID_CARTERA ');
        SQL.Add('         JOIN EMP_CARTERA_DETALLE DET ON DET.ID_CARTERA = CAR.ID_CARTERA ');
        SQL.Add('         WHERE ');
        SQL.Add('         DOC.ID_S = :ID_S), 0)) AS TOTAL_ANTICIPO ');
        SQL.Add(' FROM RDB$DATABASE ');
        Params.ByName['ID_S'].AsInteger := IdS;
        ExecQuery;
        Result := FieldByName['TOTAL_ANTICIPO'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameIdModeloArticulo(id_a: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT AMC.ID_A_M ');
        SQL.Add(' FROM ART_ARTICULOS A ');
        SQL.Add(' JOIN ART_ARTICULOS_M_C_TALLAS AMCT ON (A.ID_A_M_C_T = AMCT.ID_A_M_C_T) ');
        SQL.Add(' JOIN ART_ARTICULOS_MOD_COLOR AMC ON (AMCT.ID_A_M_C = AMC.ID_A_M_C) ');
        // SQL.Add(' JOIN ART_ARTICULOS_MODELOS AM ON (AMC.ID_A_M = AM.ID_A_M) ');
        SQL.Add(' WHERE ');
        SQL.Add(' A.ID_A = :ID_A ');
        Params.ByName['ID_A'].AsInteger := id_a;
        ExecQuery;
        Result := FieldByName['ID_A_M'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameFechaServidor: TDateTime;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CAST(''NOW'' AS DATE) AS FECHA_SERVIDOR FROM RDB$DATABASE';
        ExecQuery;
        Result := FieldByName['FECHA_SERVIDOR'].AsDateTime;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.ArticuloBloqueado(Articulo: string; TipoDoc: string; Empresa: integer = 0): boolean;
var
  Mensaje, Tipo : string;
  Bloqueo : integer;
begin
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;

        SQL.Add('SELECT ');
        if ((TipoDoc = 'ALP') or (TipoDoc = 'FAP') or (TipoDoc = 'PEP') or (TipoDoc = 'OFP') or (TipoDoc = 'OCP')) then
           SQL.Add('BLOQUEO_COMPRAS BLOQUEO, MOTIVO_BLOQUEO_COMPRAS MOTIVO_BLOQUEO ')
        else
        if ((TipoDoc = 'OFC') or (TipoDoc = 'PEC') or (TipoDoc = 'ALB') or (TipoDoc = 'FAC')) then
           SQL.Add('BLOQUEO_VENTAS BLOQUEO, MOTIVO_BLOQUEO_VENTAS MOTIVO_BLOQUEO ');
        SQL.Add(' FROM ART_ARTICULOS WHERE EMPRESA = ?EMPRESA AND ARTICULO = ?ARTICULO ');

        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        ExecQuery;

        Bloqueo := FieldByName['BLOQUEO'].AsInteger;
        Mensaje := FieldByName['MOTIVO_BLOQUEO'].AsString;
        FreeHandle;
     finally
        Free;
     end;

     {0.- Sin mensaje
      1.- Aviso
      2.- Bloquear}
     Result := (Bloqueo = 2);
     if (Bloqueo > 0) then
     begin
        Mensaje := _('Motivo') + ': ' + Mensaje;

        if (Bloqueo = 1) then
           Tipo := _('Aviso');

        if (Bloqueo = 2) then
           Tipo := _('Bloqueo');

        Application.MessageBox(PChar(Mensaje), PChar(Tipo), mb_iconinformation + mb_ok);
     end;
  end;
end;

function TDMMain.DamePeriodo(Fecha: TDateTime; Tipo: integer = 1): string;
begin
  /// Devuelve periodo al que pertenece una fecha
  /// Tipo 1 Mensual
  /// Tipo 2 Trimestral
  /// Tipo 3 Semestral

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Add(' SELECT PERIODO FROM EMP_PERIODOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' TIPO = :TIPO AND ');
        SQL.Add(' :FECHA BETWEEN DESDE AND HASTA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['TIPO'].AsInteger := Tipo;
        Params.ByName['FECHA'].AsDateTime := Fecha;
        ExecQuery;
        Result := FieldByName['PERIODO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameNombreComercialNIF(NIF: string): string;
begin
  Result := '';
  if (NIF <> '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'SELECT FIRST 1 NOMBRE_COMERCIAL FROM SYS_TERCEROS WHERE NIF = :NIF ORDER BY TERCERO';
           Params.ByName['NIF'].AsString := NIF;
           ExecQuery;
           Result := FieldByName['NOMBRE_COMERCIAL'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DameTerceroNIF(NIF: string): integer;
begin
  Result := 0;
  if (NIF <> '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'SELECT FIRST 1 TERCERO FROM SYS_TERCEROS WHERE NIF = :NIF ORDER BY TERCERO';
           Params.ByName['NIF'].AsString := NIF;
           ExecQuery;
           Result := FieldByName['TERCERO'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DameNumeroAutorizacion(Tipo, Serie: string; Fecha: TDateTime): string;
begin
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Add(' SELECT FIRST 1 ES.SFV_AUTORIZACION ');
           SQL.Add(' FROM SFV_AUTORIZACIONES A ');
           SQL.Add(' JOIN GEN_SERIES ES ON (ES.EMPRESA = A.EMPRESA AND ES.SFV_AUTORIZACION = A.AUTORIZACION) ');
           SQL.Add(' WHERE ');
           SQL.Add(' ES.EMPRESA = :EMPRESA AND ');
           SQL.Add(' ES.SERIE = :SERIE AND ');
           SQL.Add(' ES.ACTIVO = 1 AND ');
           SQL.Add(' A.TIPO = :TIPO AND ');
           SQL.Add(' A.FECHA_DESDE <= :FECHA AND ');
           SQL.Add(' A.FECHA_HASTA >= :FECHA ');
           SQL.Add(' ORDER BY A.AUTORIZACION ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['TIPO'].AsString := Tipo;
           Params.ByName['FECHA'].AsDateTime := Fecha;
           ExecQuery;
           Result := FieldByName['SFV_AUTORIZACION'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DameLlaveDosificacion(Tipo, Autorizacion: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Add(' SELECT FIRST 1 LLAVE_DOSIFICACION FROM SFV_AUTORIZACIONES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' TIPO = :TIPO AND ');
        SQL.Add(' AUTORIZACION = :AUTORIZACION ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['AUTORIZACION'].AsString := Autorizacion;
        ExecQuery;
        Result := FieldByName['LLAVE_DOSIFICACION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameNumeroDosifiacion(Tipo, Autorizacion: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Add(' SELECT CONTADOR FROM SFV_DAME_NUM_DOSIFICACION(:EMPRESA, :TIPO, :AUTORIZACION) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['AUTORIZACION'].AsString := Autorizacion;
        ExecQuery;
        Result := FieldByName['CONTADOR'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameEjercicioDoc(Tipo: string; IdDoc: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        if ((Tipo = 'OFP') or (Tipo = 'OCP') or (Tipo = 'ALP') or (Tipo = 'PEP') or (Tipo = 'FAP') or (Tipo = 'FCR')) then
           SQL.Text := 'SELECT EJERCICIO FROM GES_CABECERAS_E WHERE ID_E = :ID_DOC';
        if ((Tipo = 'OFC') or (Tipo = 'ALB') or (Tipo = 'PEC') or (Tipo = 'FAC')) then
           SQL.Text := 'SELECT EJERCICIO FROM GES_CABECERAS_S WHERE ID_S = :ID_DOC';
        if (Tipo = 'MOV') then
           SQL.Text := 'SELECT EJERCICIO FROM GES_CABECERAS_ST WHERE ID_ST = :ID_DOC';
        {
        if (Tipo = 'REG') then
           SQL.Text := 'SELECT MAX(LINEA) FROM ART_REG_INVENTARIO_DETALLE WHERE ID_REG = :ID_DOC';
        if (Tipo = 'PEA') then
           SQL.Text := 'SELECT MAX(LINEA) FROM GES_DETALLES_PEA WHERE (ID_CAB = :ID_DOC)';
        if (Tipo = 'REP') then
           SQL.Text := 'SELECT MAX(LINEA) FROM REPAR_DET_REPARACIONES WHERE IDCABREPARAR = ?ID_DOC';
        if (Tipo = 'PLA') then
           SQL.Text := 'SELECT MAX(LINEA) FROM PRO_PMP_DET WHERE ID_PLANIFICACION = :ID_DOC';
        }
        Params.ByName['ID_DOC'].AsInteger := IdDoc;
        ExecQuery;
        Result := FieldByName['EJERCICIO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMain.CambiaFechas(Desde, Hasta: TLFDateEdit; Accion: string);
var
  AnyoDesde, MesDesde, DiaDesde : word;
  AnyoHasta, MesHasta, DiaHasta : word;
  DesdeFecha, HastaFecha : TDateTime;
begin
  // Inicializo variables.
  AnyoDesde := REntorno.Ejercicio;
  MesDesde := 1;
  DiaDesde := 1;

  AnyoHasta := REntorno.Ejercicio;
  MesHasta := 12;
  DiaHasta := 31;

  if (Accion = 'EJE') then
  begin
     AnyoDesde := REntorno.Ejercicio;
     MesDesde := 1;
     DiaDesde := 1;

     AnyoHasta := REntorno.Ejercicio;
     MesHasta := 12;
     DiaHasta := 31;
  end
  else
  if (Accion = 'E-') then
  begin
     AnyoDesde := YearOf(Desde.Date) - 1;
     MesDesde := MonthOf(Desde.Date);
     DiaDesde := DayOf(Desde.Date);
     if (DiaDesde > DaysInAMonth(AnyoDesde, MesDesde)) then
        DiaDesde := DaysInAMonth(AnyoDesde, MesDesde);

     AnyoHasta := YearOf(Hasta.Date) - 1;
     MesHasta := MonthOf(Hasta.Date);
     DiaHasta := DayOf(Hasta.Date);
     if (DiaHasta > DaysInAMonth(AnyoHasta, MesHasta)) then
        DiaHasta := DaysInAMonth(AnyoHasta, MesHasta);
  end
  else
  if (Accion = 'E+') then
  begin
     AnyoDesde := YearOf(Desde.Date) + 1;
     MesDesde := MonthOf(Desde.Date);
     DiaDesde := DayOf(Desde.Date);
     if (DiaDesde > DaysInAMonth(AnyoDesde, MesDesde)) then
        DiaDesde := DaysInAMonth(AnyoDesde, MesDesde);

     AnyoHasta := YearOf(Hasta.Date) + 1;
     MesHasta := MonthOf(Hasta.Date);
     DiaHasta := DayOf(Hasta.Date);
     if (DiaHasta > DaysInAMonth(AnyoHasta, MesHasta)) then
        DiaHasta := DaysInAMonth(AnyoHasta, MesHasta);
  end
  else
  if (Accion = 'MES') then
  begin
     AnyoDesde := REntorno.Ejercicio;
     MesDesde := MonthOf(Today);
     DiaDesde := 1;

     AnyoHasta := REntorno.Ejercicio;
     MesHasta := MonthOf(Today);
     DiaHasta := DaysInAMonth(REntorno.Ejercicio, MesHasta);
  end
  else
  if (Accion = 'M-') then
  begin
     AnyoDesde := REntorno.Ejercicio;
     MesDesde := MonthOf(Desde.Date) - 1;
     if (MesDesde < 1) then
        MesDesde := 1;
     DiaDesde := 1;

     AnyoHasta := REntorno.Ejercicio;
     MesHasta := MonthOf(Hasta.Date) - 1;
     if (MesHasta < 1) then
        MesHasta := 1;
     DiaHasta := DaysInAMonth(REntorno.Ejercicio, MesHasta);
  end
  else
  if (Accion = 'M+') then
  begin
     AnyoDesde := REntorno.Ejercicio;
     MesDesde := MonthOf(Desde.Date) + 1;
     if (MesDesde > 12) then
        MesDesde := 12;
     DiaDesde := 1;

     AnyoHasta := REntorno.Ejercicio;
     MesHasta := MonthOf(Hasta.Date) + 1;
     if (MesHasta > 12) then
        MesHasta := 12;
     DiaHasta := DaysInAMonth(REntorno.Ejercicio, MesHasta);
  end
  else
  if (Accion = 'DIA') then
  begin
     AnyoDesde := REntorno.Ejercicio;
     MesDesde := MonthOf(Today);
     DiaDesde := DayOf(Today);

     AnyoHasta := REntorno.Ejercicio;
     MesHasta := MonthOf(Today);
     DiaHasta := DayOf(Today);
  end
  else
  if (Accion = 'D-') then
  begin
     DecodeDate(IncDay(Desde.Date, -1), AnyoDesde, MesDesde, DiaDesde);
     DecodeDate(IncDay(Hasta.Date, -1), AnyoHasta, MesHasta, DiaHasta);
  end
  else
  if (Accion = 'D+') then
  begin
     DecodeDate(IncDay(Desde.Date), AnyoDesde, MesDesde, DiaDesde);
     DecodeDate(IncDay(Hasta.Date), AnyoHasta, MesHasta, DiaHasta);
  end
  else
  if (Accion = 'SEM') then
  begin
     DecodeDate(IncDay(Today, ((-1) * DayOfTheWeek(Today)) + 1), AnyoDesde, MesDesde, DiaDesde);
     DecodeDate(IncDay(Today, 7 - DayOfTheWeek(Today)), AnyoHasta, MesHasta, DiaHasta);
  end
  else
  if (Accion = 'T1') then
  begin
     AnyoDesde := REntorno.Ejercicio;
     MesDesde := 1;
     DiaDesde := 1;

     AnyoHasta := REntorno.Ejercicio;
     MesHasta := 3;
     DiaHasta := DaysInAMonth(REntorno.Ejercicio, MesHasta);
  end
  else
  if (Accion = 'T2') then
  begin
     AnyoDesde := REntorno.Ejercicio;
     MesDesde := 4;
     DiaDesde := 1;

     AnyoHasta := REntorno.Ejercicio;
     MesHasta := 6;
     DiaHasta := DaysInAMonth(REntorno.Ejercicio, MesHasta);
  end
  else
  if (Accion = 'T3') then
  begin
     AnyoDesde := REntorno.Ejercicio;
     MesDesde := 7;
     DiaDesde := 1;

     AnyoHasta := REntorno.Ejercicio;
     MesHasta := 9;
     DiaHasta := DaysInAMonth(REntorno.Ejercicio, MesHasta);
  end
  else
  if (Accion = 'T4') then
  begin
     AnyoDesde := REntorno.Ejercicio;
     MesDesde := 10;
     DiaDesde := 1;

     AnyoHasta := REntorno.Ejercicio;
     MesHasta := 12;
     DiaHasta := DaysInAMonth(REntorno.Ejercicio, MesHasta);
  end
  else
  if (Accion[1] = 'P') then
  begin
     { TODO : Probar esta parte...}
     // Periodos de la empresa (01..12 Mensuales, 13..16 trimestrales, 17..18 semestrales, 19 y 20 anulaes)
     // No necesariamente empiezan el 01/01

     UUtiles.DameDesdeHastaPeriodo(Copy(Accion, 2, 2), DesdeFecha, HastaFecha);
     AnyoDesde := YearOf(DesdeFecha);
     MesDesde := MonthOf(DesdeFecha);
     DiaDesde := DayOf(DesdeFecha);

     AnyoHasta := YearOf(HastaFecha);
     MesHasta := MonthOf(HastaFecha);
     DiaHasta := DayOf(HastaFecha);
  end;

  // Establezco fecha en componentes.
  Desde.Date := EncodeDate(AnyoDesde, MesDesde, DiaDesde);
  Hasta.Date := EncodeDate(AnyoHasta, MesHasta, DiaHasta);
end;

function TDMMain.DameRutaFicheroDeSincronizacion(Serie: string): string;
begin
  try
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT RUTA FROM SYS_TPV_SERVIDOR_SINC WHERE SERIE = :SERIE';
           Params.ByName['SERIE'].AsString := Serie;
           ExecQuery;
           Result := FieldByName['RUTA'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  except
     on E: Exception do
        DMMain.Log(_('No se ha podido determinar la ruta del fichero para la sincronización') + #13#10 + E.Message);
  end;
end;

procedure TDMMain.CreaRegistroPresenciaEntrada;
var
  IdEmpleado : integer;
begin
  /// Registra una entrada en el control de presencia.

  if (LeeParametro('OPEPRES001') = 'S') then
  begin
     // Obtengo el empleado asociado al usuario
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Add(' SELECT FIRST 1 ID_EMPLEADO FROM OPE_EMPLEADO E ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' USUARIO = :USUARIO ');
           SQL.Add(' ORDER BY EMPLEADO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
           ExecQuery;
           IdEmpleado := FieldByName['ID_EMPLEADO'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (IdEmpleado <> 0) then
     begin
        // Creo registro de entrada
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := Self.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE INSERTA_MARCAJE_TIPO(:ID_EMPLEADO, :CANAL, :SERIE, :TIPO, :FECHA_MARCAJE, :HORARIO, NULL /*NOTAS*/, NULL /*INCIDENCIA*/, :TIPO_OPERACION, 0)';
              Params.ByName['ID_EMPLEADO'].AsInteger := IdEmpleado;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['SERIE'].AsString := 'A';
              Params.ByName['TIPO'].AsString := 'PRE';
              Params.ByName['FECHA_MARCAJE'].AsDateTime := Now;
              Params.ByName['HORARIO'].AsString := 'DES';
              Params.ByName['TIPO_OPERACION'].AsString := 'E';
              try
                 ExecQuery;
              except
              end;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

procedure TDMMain.CreaRegistroPresenciaSalida;
var
  IdEmpleado : integer;
begin
  /// Registra una salida en el control de presencia.

  if (LeeParametro('OPEPRES001') = 'S') then
  begin
     // Obtengo el empleado asociado al usuario
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Add(' SELECT FIRST 1 ID_EMPLEADO FROM OPE_EMPLEADO E ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' USUARIO = :USUARIO ');
           SQL.Add(' ORDER BY EMPLEADO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
           ExecQuery;
           IdEmpleado := FieldByName['ID_EMPLEADO'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (IdEmpleado <> 0) then
     begin
        // Creo registro de salida
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := Self.DataBase;
              SQL.Text := 'EXECUTE PROCEDURE INSERTA_MARCAJE_TIPO(:ID_EMPLEADO, :CANAL, :SERIE, :TIPO, :FECHA_MARCAJE, :HORARIO, NULL /*NOTAS*/, NULL /*INCIDENCIA*/, :TIPO_OPERACION, 0)';
              Params.ByName['ID_EMPLEADO'].AsInteger := IdEmpleado;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['SERIE'].AsString := 'A';
              Params.ByName['TIPO'].AsString := 'PRE';
              Params.ByName['FECHA_MARCAJE'].AsDateTime := Now;
              Params.ByName['HORARIO'].AsString := 'DES';
              Params.ByName['TIPO_OPERACION'].AsString := 'S';
              try
                 ExecQuery;
              except
              end;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

function TDMMain.UtilizarInventarioPermanente(Empresa: integer = 0): boolean;
begin
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT INVENTARIO_PERMANENTE FROM SYS_EMPRESAS WHERE EMPRESA = :EMPRESA';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        ExecQuery;
        Result := (FieldByName['INVENTARIO_PERMANENTE'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMain.PedirFirma(Tipo: string; IdDoc: integer);
begin
  if (REntorno.DispositivoFirma > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'INSERT INTO GES_FIRMAS (TIPO, ID_DOC, DISPOSITIVO, EMPRESA) VALUES (:TIPO, :ID_DOC, :DISPOSITIVO, :EMPRESA)';
           Params.ByName['TIPO'].AsString := Tipo;
           Params.ByName['ID_DOC'].AsInteger := IdDoc;
           Params.ByName['DISPOSITIVO'].AsString := REntorno.DispositivoFirma;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMMain.BorrarFirma(Tipo: string; IdDoc: integer);
begin
  if (REntorno.DispositivoFirma > '') then
  begin
     if ConfirmaMensaje(_('Esta accion borrara todas las firmas asociadas al documento. ¿Desea seguir?')) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := Self.DataBase;
              SQL.Text := 'DELETE FROM GES_FIRMAS WHERE TIPO = :TIPO AND ID_DOC = :ID_DOC';
              Params.ByName['TIPO'].AsString := Tipo;
              Params.ByName['ID_DOC'].AsInteger := IdDoc;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

function TDMMain.DameDatosBancarios(Empresa, Ejercicio, Canal: integer; FormaPago: string; var Banco: integer): char;
var
  DatosBancarios : string;
begin
  /// Datos bancarios a mostrar en documentos de venta
  /// '0' : Ninguno
  /// '1' : Datos del Cliente
  /// '2' : Datos de la Empresa

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT F.DATOS_BANCARIOS, COALESCE(B.BANCO, -1) AS BANCO');
        SQL.Add(' FROM CON_CUENTAS_GES_FP F ');
        SQL.Add(' LEFT JOIN CON_CUENTAS_GES_BAN B ON F.EMPRESA = B.EMPRESA AND F.EJERCICIO = B.EJERCICIO AND F.CANAL = B.CANAL AND F.CUENTA_PAGO = B.CUENTA ');
        SQL.Add(' WHERE ');
        SQL.Add(' F.EMPRESA = :EMPRESA AND ');
        SQL.Add(' F.EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' F.CANAL = :CANAL AND ');
        SQL.Add(' F.FORMA_PAGO = :FORMA_PAGO ');
        SQL.Add(' ORDER BY B.BANCO ');
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['FORMA_PAGO'].AsString := FormaPago;
        ExecQuery;
        DatosBancarios := FieldByName['DATOS_BANCARIOS'].AsString;
        Banco := FieldByName['BANCO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Result := DatosBancarios[1];
end;

function TDMMain.DameTipoDocPaisDefecto(Pais: string): string;
begin
  Result := '';
  if (Pais > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Add('SELECT TIPO_DOC_IDENT FROM SYS_TIPO_DOC_IDENT_PAIS WHERE PAIS = :PAIS AND DEFECTO = 1');
           Params.ByName['PAIS'].AsString := Pais;
           ExecQuery;
           Result := FieldByName['TIPO_DOC_IDENT'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMMain.DameDatosPais(Pais: string; var TituloRegion, TituloProvincia, TituloPoblacion: string);
begin
  TituloRegion := '';
  TituloProvincia := '';
  TituloPoblacion := '';

  if (Trim(Pais) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'SELECT TITULO_REGION, TITULO_PROVINCIA, TITULO_POBLACION FROM SYS_PAISES WHERE PAIS = :PAIS';
           Params.ByName['PAIS'].AsString := Pais;
           ExecQuery;
           TituloRegion := FieldByName['TITULO_REGION'].AsString;
           TituloProvincia := FieldByName['TITULO_PROVINCIA'].AsString;
           TituloPoblacion := FieldByName['TITULO_POBLACION'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  // Valores por defecto si quedan vacios
  if (TituloRegion = '') then
     TituloRegion := _('Region');

  if (TituloProvincia = '') then
     TituloProvincia := _('Provincia');

  if (TituloPoblacion = '') then
     TituloPoblacion := _('Poblacion');
end;

procedure TDMMain.VerificaDocumentoIdentificacion(Pais, TipoDoc, NumeroDocumento: string; var Valido: boolean; var MensajeError: string);
//var
//RNC_Limpio : string;
//i, Suma, Resto, DigitoVerificador, Valor : integer;
//Coeficientes : array[1..8] of integer;
//EsDNI : boolean;
begin
  Valido := True;
  MensajeError := '';

  if (Trim(Pais) = 'DOM') then
  begin
     { TODO : PASAR VERIFICACION DOM A FIREBIRD }

     (* Se desactiva temporalmente a pedido de Cesar

     Valido := False;
     MensajeError := '';
     MensajeError := '';

     // Quitar guiones o espacios
     RNC_Limpio := '';
     for i := 1 to Length(NumeroDocumento) do
        if NumeroDocumento[i] in ['0'..'9'] then
           RNC_Limpio := RNC_Limpio + NumeroDocumento[i];

     // Verificar longitud (9 para RNC, 11 para DNI)
     if not (Length(RNC_Limpio) in [9, 11]) then
        MensajeError := _('Longitud incorrecta');

     // Determinar si es DNI (11 dígitos) o RNC (9 dígitos)
     TipoDoc := '';
     if (Length(RNC_Limpio) = 9) then
        TipoDoc := 'RNC'
     else
     if (Length(RNC_Limpio) = 11) then
        TipoDoc := 'DNI';

     if (TipoDoc = 'DNI') then
     begin
        // Validación para DNI (11 dígitos)
        // Se utiliza coeficinete 1, 2 alterativamente.
        // Se suman las multiplicaciones.
        // (10 - Resusutado MOD 10) debe ser igual al ultimo digito.
        // Si es 10 el digito verificador es 0.
        Suma := 0;
        for i := 1 to 10 do
        begin
           // Coeficientes para DNI: alternan entre 1 y 2
           if (i mod 2) = 1 then
              Valor := 1  // Coeficiente impar
           else
              Valor := 2; // Coeficiente par

           Suma := Suma + (StrToInt(RNC_Limpio[i]) * Valor);
        end;

        // Calculo dígito verificador
        Resto := Suma mod 10;
        if Resto = 0 then
           DigitoVerificador := 0
        else
           DigitoVerificador := 10 - Resto;

        // Comparar con el último dígito del DNI
        Valido := (DigitoVerificador = StrToInt(RNC_Limpio[11]));
        if not Valido then
           MensajeError := _('Validacion digito control incorrecta');
     end
     else
     if (TipoDoc = 'RNC') then
     begin
        // Validación original para RNC (9 dígitos)
        // Se utiliza coeficinete para multiplicar cada digito
        // Se suman las multiplicaciones
        // (11 - Resusutado MOD 11) debe ser igual al ultimo digito
        // Si es 11 el digito verificador es 0
        // Si es 10 el digito verificador es 1

        // Coeficientes según DGII
        Coeficientes[1] := 7;
        Coeficientes[2] := 9;
        Coeficientes[3] := 8;
        Coeficientes[4] := 6;
        Coeficientes[5] := 5;
        Coeficientes[6] := 4;
        Coeficientes[7] := 3;
        Coeficientes[8] := 2;

        Suma := 0;
        for i := 1 to 8 do
        begin
           Valor := StrToInt(RNC_Limpio[i]);
           Suma := Suma + (Valor * Coeficientes[i]);
        end;

        // Calcular el dígito verificador esperado
        Resto := Suma mod 11;
        if Resto = 0 then
           DigitoVerificador := 2
        else
        if Resto = 1 then
           DigitoVerificador := 1
        else
           DigitoVerificador := 11 - Resto;

        // Comparar con el dígito verificador real
        Valido := (DigitoVerificador = StrToInt(RNC_Limpio[9]));
        if not Valido then
           MensajeError := _('Validacion digito control incorrecta');
     end;
     *)
  end
  else
  if ((Trim(Pais) > '') and (Trim(NumeroDocumento) > '')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Add('EXECUTE PROCEDURE VERIFICA_DOCUMENTO_IDENTIDAD(?NUMERO_DOCUMENTO, ?PAIS, ?TIPO_DOCUMENTO)');
           Params.ByName['NUMERO_DOCUMENTO'].AsString := NumeroDocumento;
           Params.ByName['PAIS'].AsString := Pais;
           Params.ByName['TIPO_DOCUMENTO'].AsString := TipoDoc;
           ExecQuery;
           Valido := (FieldByName['VALIDO'].AsInteger = 1);
           MensajeError := FieldByName['MENSAJE_ERROR'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DameGiro(Tipo: string; Empresa: integer; Codigo: integer = 0): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        if (Tipo = 'EMP') then
           SQL.Add('SELECT CODIGO_GIRO FROM SYS_EMPRESAS_GIROS WHERE EMPRESA = :EMPRESA AND DEFECTO = 1');
        if (Tipo = 'CLI') then
           SQL.Add('SELECT CODIGO_GIRO FROM EMP_CLIENTES_GIROS WHERE EMPRESA = :EMPRESA AND CLIENTE = :CODIGO AND DEFECTO = 1');
        if (Tipo = 'PRO') then
           SQL.Add('SELECT CODIGO_GIRO FROM EMP_PROVEEDORES_GIROS WHERE EMPRESA = :EMPRESA AND PROVEEDOR = :CODIGO AND DEFECTO = 1');
        if (Tipo = 'ACR') then
           SQL.Add('SELECT CODIGO_GIRO FROM EMP_ACREEDORES_GIROS WHERE EMPRESA = :EMPRESA AND ACREEDOR = :CODIGO AND DEFECTO = 1');
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        if (Tipo <> 'EMP') then
           Params.ByName['CODIGO'].AsInteger := Codigo;
        ExecQuery;
        Result := FieldByName['CODIGO_GIRO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameNivelDireccionPais(Pais: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT NIVEL_DIRECCIONES FROM SYS_PAISES WHERE PAIS = :PAIS';
        Params.ByName['PAIS'].AsString := Pais;
        ExecQuery;
        Result := FieldByName['NIVEL_DIRECCIONES'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameUrlEndPoint(Tipo: string): string;
begin
  /// EndPoint para transmisiones del sistema SII de España
  /// También se utilizará para envios del SII de Chile

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT URL FROM SII_URL_ENDPOINT WHERE PAIS = :PAIS AND TIPO = :TIPO';
        Params.ByName['PAIS'].AsString := REntorno.Pais;
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;
        Result := FieldByName['URL'].AsString;

        {
        El EndPoint para SII en España no tiene que tener "/" final
        Este ultimo caracter final se tratara donde se utilice este dato.

        if ((Result > '') and (Copy(Result, Length(Result), 1) <> '/')) then
           Result := Result + '/';
        }

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DamePorcentajeIva(Pais: string; Tipo: integer): double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT P_IVA FROM SYS_TIPO_IVA WHERE PAIS = :PAIS AND TIPO = :TIPO';
        Params.ByName['PAIS'].AsString := Pais;
        Params.ByName['TIPO'].AsInteger := Tipo;
        ExecQuery;
        Result := FieldByName['P_IVA'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameNombreIva(Pais: string; Tipo: integer; Idioma: string = ''): string;
begin
  Result := '';

  if (Idioma = '') then
     Idioma := REntorno.IdiomaCanal;

  if (REntorno.IdiomaCanal <> Idioma) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'SELECT TITULO FROM SYS_TIPO_IVA_IDIOMAS WHERE PAIS = :PAIS AND TIPO = :TIPO AND IDIOMA = :IDIOMA';
           Params.ByName['PAIS'].AsString := Pais;
           Params.ByName['TIPO'].AsInteger := Tipo;
           Params.ByName['IDIOMA'].AsString := Idioma;
           ExecQuery;
           Result := Trim(FieldByName['TITULO'].AsString);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if (Result = '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'SELECT TITULO FROM SYS_TIPO_IVA WHERE PAIS = :PAIS AND TIPO = :TIPO';
           Params.ByName['PAIS'].AsString := Pais;
           Params.ByName['TIPO'].AsInteger := Tipo;
           ExecQuery;
           Result := Trim(FieldByName['TITULO'].AsString);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.ExisteAdjunto(Tipo: string; ID: integer; Empresa: integer = 0): boolean;
begin
  /// Devuelve verdadero si existe al menos un adjunto para este TIPO-ID

  if (Empresa = 0) then
     Empresa := REntorno.Empresa;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT FIRST 1 ID FROM EMP_ADJUNTOS_RELACION WHERE EMPRESA = :EMPRESA AND TIPO = :TIPO AND ID = :ID';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['ID'].AsInteger := ID;
        ExecQuery;

        Result := (FieldByName['ID'].AsInteger > 0);

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameIdFicheroAdjunto(Tipo: string; ID: integer; Fichero: string; Empresa: integer = 0): integer;
begin
  /// Devuelve el id del adjunto cuyo nombre de fichero coincida (Sin tener en cuenta carpeta).

  Result := 0;
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;

  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Text := 'SELECT ID_ADJUNTO, NOMBRE FROM VER_ADJUNTOS WHERE EMPRESA = :EMPRESA AND TIPO = :TIPO AND ID = :ID ORDER BY FECHA';
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['TIPO'].AsString := Tipo;
           Params.ByName['ID'].AsInteger := ID;
           Open;
           while not EOF do
           begin
              if (UpperCase(ExtractFileName(FieldByName('NOMBRE').AsString)) = UpperCase(Fichero)) then
                 Result := FieldByName('ID_ADJUNTO').AsInteger;
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

function TDMMain.EnviarFacturasClientePorEmail(Cliente: integer; Empresa: integer = 0): boolean;
begin
  /// Devuelve verdadero si el cliente tiene marcade enviar facturas por email.

  if (Empresa = 0) then
     Empresa := REntorno.Empresa;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT FACTURAS_POR_EMAIL_KRI FROM EMP_CLIENTES WHERE EMPRESA = :EMPRESA AND CLIENTE = :CLIENTE';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        ExecQuery;

        Result := (FieldByName['FACTURAS_POR_EMAIL_KRI'].AsInteger > 0);

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.EnviarFacturasProvAcrePorEmail(Tercero: integer; Empresa: integer = 0): boolean;
begin
  /// Devuelve verdadero si existe un email asignado al tercero

  {
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;
  }
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT TRIM(EMAIL) as EMAIL FROM SYS_TERCEROS WHERE TERCERO = :TERCERO';
        Params.ByName['TERCERO'].AsInteger := Tercero;
        ExecQuery;

        Result := (FieldByName['EMAIL'].AsString > '');

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameTextoIdioma(Grupo: integer; Idioma: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE DAME_TEXTO_IDIOMA(:GRUPO, :IDIOMA)';
        Params.ByName['GRUPO'].AsInteger := Grupo;
        Params.ByName['IDIOMA'].AsString := Idioma;
        ExecQuery;
        Result := FieldByName['TEXTO'].AsString;

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMain.ReestablecerConexiones(Rol: string);
var
  DB : THYDatabase;
begin
  DB := THYDatabase.Create(Self);
  with DB do
  begin
     try
        DBName := DataBase.DBName;
        DBParams.Values['user_name'] := REntorno.UsuarioBD_Admin;
        DBParams.Values['password'] := REntorno.ClaveBD_Admin;
        DBParams.Values['lc_ctype'] := 'WIN1252';
        if (REntorno.CharsetBD <> '') then
           DBParams.Values['lc_ctype'] := REntorno.CharsetBD_Admin;
        if (REntorno.RolBD_Admin <> '') then
           DBParams.Values['sql_role_name'] := REntorno.RolBD_Admin;

        Connected := True;

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DB;
              SQL.Text := 'DELETE FROM MON$ATTACHMENTS WHERE MON$ROLE = :ROLE';
              Params.ByName['ROLE'].AsString := Rol;
              ExecQuery;
              Transaction.Commit;
              FreeHandle;
           finally
              Free;
           end;
        end;

        Connected := False;
     finally
        DB.Free;
     end;
  end;
end;

procedure TDMMain.TDesconexionBaseAdjuntoTimer(Sender: TObject);
begin
  // Desconecto base de adjuntos despues de 1 minuto de inactividad
  DesConectaAdjuntos;
  TDesconexionBaseAdjunto.Enabled := False;
end;

procedure TDMMain.TDesconexionBaseImagenesTimer(Sender: TObject);
begin
  // Desconecto base de adjuntos despues de 1 minuto de inactividad
  DesConectaImagenes;
  TDesconexionBaseImagenes.Enabled := False;
end;

procedure TDMMain.Click2Call(Telefono: string);
var
  Extension : integer;
  Token : string;
begin
  AbreData(TDMNet2Phone, DMNet2Phone);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT NET2PHONE_TOKEN, NET2PHONE_EXTENSION FROM SYS_USUARIOS WHERE USUARIO = :USUARIO';
        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
        ExecQuery;
        Token := FieldByName['NET2PHONE_TOKEN'].AsString;
        Extension := FieldByName['NET2PHONE_EXTENSION'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (DMNet2Phone.WS_Inicializa(Token)) then
     DMNet2Phone.WS_click2call(Extension, Telefono);

  CierraData(DMNet2Phone);
end;

function TDMMain.TipoDocTributarioValido(TipoDoc, TipoDocTriburario: string): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT FIRST 1 CODIGO FROM SII_TIPO_DOCUMENTO_TRIBUTARIO WHERE VISIBLE_' + TipoDoc + ' = 1 AND CODIGO = :CODIGO';
        Params.ByName['CODIGO'].AsString := TipoDocTriburario;
        ExecQuery;
        Result := (FieldByName['CODIGO'].AsString > '');
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.ExisteDocumentoReferencia(ID_S: integer): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT FIRST 1 ID_S FROM GES_CABECERAS_S WHERE ID_S = :ID_S';
        Params.ByName['ID_S'].AsInteger := ID_S;
        ExecQuery;
        Result := (FieldByName['ID_S'].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameFolioDTE(ID_S: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT FOLIO FROM GES_CABECERAS_S_FAC WHERE ID_S = :ID_S';
        Params.ByName['ID_S'].AsInteger := ID_S;
        ExecQuery;
        Result := FieldByName['FOLIO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMain.CreaReferenciaDte(ID_S, CODREF, ID_S_REF: integer; FOLIOREF, TPODOCREF, RAZONREF, RUTOTR: string; FCHREF: TDateTime);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Add('INSERT INTO SII_DTE_REFERENCIA ');
        SQL.Add('(ID_S, TPODOCREF, FOLIOREF, FCHREF, CODREF, RAZONREF, ID_S_REF, RUTOTR) ');
        SQL.Add('VALUES ');
        SQL.Add('(:ID_S, :TPODOCREF, :FOLIOREF, :FCHREF, :CODREF, :RAZONREF, :ID_S_REF, :RUTOTR) ');
        Params.ByName['ID_S'].AsInteger := ID_S;
        Params.ByName['TPODOCREF'].AsString := TPODOCREF;
        Params.ByName['FOLIOREF'].AsString := FOLIOREF;
        Params.ByName['FCHREF'].AsDateTime := FCHREF;
        Params.ByName['CODREF'].AsInteger := CODREF;
        Params.ByName['RAZONREF'].AsString := RAZONREF;
        Params.ByName['ID_S_REF'].AsInteger := ID_S_REF;
        Params.ByName['RUTOTR'].AsString := RUTOTR;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameArticuloDesdeAlfa(Valor: string; Alfa: integer; Empresa: integer = 0): string;
begin
  /// Devuelve el primer articulo cuyo ALFA_[Alfa] contenga [Valor]
  /// Si Valor es vacio no devuelve ningun articulo.

  Result := '';
  if (Trim(Valor) > '') then
  begin
     if ((Alfa >= 1) and (Alfa <= 8)) then
     begin
        if (Empresa = 0) then
           Empresa := REntorno.Empresa;

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := Self.DataBase;
              SQL.Text := format('SELECT FIRST 1 ARTICULO FROM ART_ARTICULOS WHERE EMPRESA = :EMPRESA AND ALFA_%d = :VALOR ORDER BY ARTICULO', [Alfa]);
              Params.ByName['EMPRESA'].AsInteger := Empresa;
              Params.ByName['VALOR'].AsString := Valor;
              ExecQuery;
              Result := FieldByName['ARTICULO'].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

function TDMMain.DameAlfaArticulo(Articulo: string; Numero: integer): string;
begin
  Result := '';
  if ((Numero > 0) and (Numero < 9)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ALFA_' + IntToStr(Numero) + ' AS ALFA FROM ART_ARTICULOS WHERE EMPRESA = :EMPRESA AND ARTICULO = :ARTICULO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ARTICULO'].AsString := Articulo;
           ExecQuery;
           Result := FieldByName['ALFA'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DameAlfaProveedor(Proveedor, Numero: integer): string;
begin
  Result := '';
  if ((Numero > 0) and (Numero < 9)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ALFA_' + IntToStr(Numero) + ' AS ALFA FROM EMP_PROVEEDORES WHERE EMPRESA = :EMPRESA AND PROVEEDOR = :PROVEEDOR';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
           ExecQuery;
           Result := FieldByName['ALFA'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DameLoteSimple(Articulo: string; Fecha: TDateTime): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Add(' SELECT COALESCE((SELECT FIRST 1 LOTE_SIMPLE ');
        SQL.Add('                  FROM ART_LOTE_SIMPLE ');
        SQL.Add('                  WHERE ');
        SQL.Add('                  EMPRESA = A.EMPRESA AND ');
        SQL.Add('                  FAMILIA = A.FAMILIA AND ');
        SQL.Add('                  FECHA_INICIO <= :FECHA ');
        SQL.Add('                  ORDER BY FECHA_INICIO DESC), '''') LOTE_SIMPLE ');
        SQL.Add(' FROM ART_ARTICULOS A ');
        SQL.Add(' WHERE ');
        SQL.Add(' A.EMPRESA = :EMPRESA AND ');
        SQL.Add(' A.ARTICULO = :ARTICULO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['FECHA'].AsDateTime := Fecha;
        ExecQuery;
        Result := FieldByName['LOTE_SIMPLE'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameAlmacenDefectoArticulo(Articulo: string): string;
begin
  Result := '';
  if (Trim(Articulo) > '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Add(' SELECT FIRST 1 ALMACEN FROM ART_ARTICULOS_ALMACENES_ART ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' ARTICULO = :ARTICULO AND ');
           SQL.Add(' DEFECTO = 1 ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['ARTICULO'].AsString := Articulo;

           ExecQuery;
           Result := Trim(FieldByName['ALMACEN'].AsString);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.DameCodigoArticulo(FormatoCodigo, Familia, SubFamilia: string): string;
var
  CodigoArticulo, aux, car, Contador : string;
  i : integer;
begin
  /// Recorremos el FormatoCodigo en busca de F para familia, S para subfamilia y N para contadores.
  /// Esperamos que los ultimos caracteres sean los N

  CodigoArticulo := '';
  aux := '';
  i := 1;

  while (i <= Length(FormatoCodigo)) do
  begin
     car := Copy(FormatoCodigo, i, 1);

     // Si cambio caracter de formato o llegue al final
     if (((aux <> '') and (car <> Copy(aux, 1, 1))) or (i = Length(FormatoCodigo))) then
     begin
        if (i = Length(FormatoCodigo)) then
           aux := aux + car;

        if (Copy(aux, 1, 1) = 'F') then
        begin
           // Familia
           CodigoArticulo := CodigoArticulo + Ajusta(Familia, 'D', Length(aux), '-');
        end
        else if (Copy(aux, 1, 1) = 'S') then
        begin
           // Subfamilia
           CodigoArticulo := CodigoArticulo + Ajusta(SubFamilia, 'D', Length(aux), '-');
        end
        else if (Copy(aux, 1, 1) = 'N') then
        begin
           // Numero
           // Selecciono el ultimo articulo con el prefijo segun el formato
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT MAX(ARTICULO) ART FROM ART_ARTICULOS WHERE EMPRESA = :EMPRESA AND FAMILIA = :FAMILIA AND SUBFAMILIA = :SUBFAMILIA AND ARTICULO STARTING WITH :ARTICULO AND CHAR_LENGTH(ARTICULO) = ' + IntToStr(Length(FormatoCodigo));
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['FAMILIA'].AsString := Familia;
                 Params.ByName['SUBFAMILIA'].AsString := SubFamilia;
                 Params.ByName['ARTICULO'].AsString := CodigoArticulo;
                 ExecQuery;
                 Contador := FieldByName['ART'].AsString;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           // Tomo los digitos correspondientes al contador
           if (Length(Contador) = Length(FormatoCodigo)) then
              Contador := Copy(Contador, Length(CodigoArticulo) + 1, Length(Contador))
           else
              // En el caso de que no encuentre nada la longitud sera 0.
              Contador := '0';

           CodigoArticulo := CodigoArticulo + Format('%' + IntToStr(Length(aux)) + '.' + IntToStr(Length(aux)) + 'd', [StrToIntDef(Contador, 0) + 1]);
        end
        else
        begin
           CodigoArticulo := CodigoArticulo + aux;
        end;

        aux := car;
     end
     else
        aux := aux + car;

     Inc(i);
  end;

  Result := CodigoArticulo;
end;

function TDMMain.DameCertificado(Serie: string): string;
begin
  Result := CryptUIDlgSelectCertificateFromStoreCert(FMain.Handle, PChar('Delfos') + Chr(0), PChar('Seleccione un certificado') + Chr(0));

  if (LeeParametro('CERLIMP001', Serie) = 'S') then
  begin
     // Reemplazo caracteres
     Result := StringReplace(Result, ' ', '_', [rfReplaceAll]);
     Result := StringReplace(Result, '(', '_', [rfReplaceAll]);
     Result := StringReplace(Result, ')', '_', [rfReplaceAll]);
  end;
end;

function TDMMain.DameCliente(Empresa, IdCliente: integer): integer;
var
  Q : THYFIBQuery;
begin
  /// Devuelve el cliente de un IdCliente.
  /// Se requiere la empresa porqe puede que no sea de la que se quiera

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := Self.DataBase;
        SQL.Add(' SELECT CLIENTE ');
        SQL.Add(' FROM EMP_CLIENTES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' ID_CLIENTE = :ID_CLIENTE ');
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['ID_CLIENTE'].AsInteger := IdCliente;
        ExecQuery;
        Result := FieldByName['CLIENTE'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

function TDMMain.DameCodigoPostal(Pais, Titulo: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Add(' SELECT FIRST 1 CODIGO_POSTAL ');
        SQL.Add(' FROM SYS_CODIGOS_POSTALES ');
        SQL.Add(' WHERE ');
        SQL.Add(' PAIS = :PAIS AND ');
        SQL.Add(' UPPER(TITULO) = UPPER(:TITULO) ');
        Params.ByName['PAIS'].AsString := Pais;
        Params.ByName['TITULO'].AsString := Copy(Titulo, 1, 40);
        ExecQuery;
        Result := FieldByName['CODIGO_POSTAL'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.ExisteCodigoPostal(Pais, CodigoPostal: string): boolean;
begin
  /// Devuelve verdadero si existe al menos un codigo postal
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Add('SELECT FIRST 1 CODIGO_POSTAL ');
        SQL.Add('FROM SYS_CODIGOS_POSTALES ');
        SQL.Add('WHERE ');
        SQL.Add('PAIS = :PAIS AND ');
        SQL.Add('CODIGO_POSTAL = :CODIGO_POSTAL ');
        Params.ByName['PAIS'].AsString := Pais;
        Params.ByName['CODIGO_POSTAL'].AsString := CodigoPostal;
        ExecQuery;
        Result := (FieldByName['CODIGO_POSTAL'].AsString > '');
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMain.RestingeEdicion(DataSet: TDataSet; Estado: integer);
begin
  // Se restringe modificacion del documento si esta cerrado
  if (Estado = 5) then
     raise Exception.Create(_('No puede modificar un documento cerrado.'));
end;

function TDMMain.DameGlosa(Tipo: integer; Codigo: string; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0): string;
begin
  /// Devuelve la descripcion del concepto seleccionado para la nomina.

  if Empresa = 0 then
     Empresa := REntorno.Empresa;
  if Ejercicio = 0 then
     Ejercicio := REntorno.Ejercicio;
  if Canal = 0 then
     Canal := REntorno.Canal;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT GLOSA FROM ');
        case Tipo of
           1: SQL.Add(' EMP_CONCEPTO_HABERES ');
           2: SQL.Add(' EMP_CONCEPTO_DESCUENTOS ');
           3: SQL.Add(' EMP_CONCEPTO_PARAMETROS ');
           4: SQL.Add(' SYS_CONCEPTO_CONSTANTES ');
        end;
        SQL.Add(' WHERE ');
        SQL.Add(' CODIGO = :CODIGO ');
        if (Tipo < 4) then
        begin
           SQL.Add(' AND EMPRESA = :EMPRESA ');
           SQL.Add(' AND EJERCICIO = :EJERCICIO ');
           SQL.Add(' AND CANAL = :CANAL ');
        end;
        Params.ByName['CODIGO'].AsString := Codigo;
        if (Tipo < 4) then
        begin
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           Params.ByName['CANAL'].AsInteger := Canal;
        end;

        ExecQuery;
        Result := FieldByName['GLOSA'].AsString;
     finally
        Free;
     end;
  end;
end;

procedure TDMMain.ReNumerarOrdenDetalleVenta(ID_S: integer);
var
  Orden : integer;

  procedure ModificaOrden(id_detalles_s, NuevoOrden: integer);
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE GES_DETALLES_S ');
           SQL.Add(' SET ORDEN = :ORDEN ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_DETALLES_S = :ID_DETALLES_S AND ');
           SQL.Add(' ORDEN <> :ORDEN ');
           Params.ByName['ORDEN'].AsInteger := NuevoOrden;
           Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

begin
  // Renumeramos el detalle comenzando por el ORDEN=1.
  Orden := 1;
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT ID_DETALLES_S FROM GES_DETALLES_S ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' ID_S = :ID_S ');
           SelectSQL.Add(' ORDER BY ORDEN ');
           Params.ByName['ID_S'].AsInteger := ID_S;
           Open;
           while not EOF do
           begin
              ModificaOrden(FieldByName('ID_DETALLES_S').AsInteger, Orden);
              Inc(Orden);
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

function TDMMain.EjercicioActivo(Ejercicio: integer; Empresa: integer = 0): boolean;
begin
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT FIRST 1 EJERCICIO FROM EMP_EJERCICIOS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND ACTIVO = 1';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        ExecQuery;
        Result := (FieldByName['EJERCICIO'].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.UtilizaSII: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT UTILIZA_SII FROM EMP_MODELOS_HACIENDA WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        Result := (FieldByName['UTILIZA_SII'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.UtilizaTicketBAI: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT UTILIZA_TICKETBAI FROM EMP_MODELOS_HACIENDA WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        Result := (FieldByName['UTILIZA_TICKETBAI'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.UtilizaVerifactu: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'SELECT UTILIZA_VERIFACTU FROM EMP_MODELOS_HACIENDA WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        Result := (FieldByName['UTILIZA_VERIFACTU'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.FechaServicioPresentacionVerifactu: TDateTime;
begin
  /// Devuelve la última fecha de conexión de servicio Verifactu.
  /// Deberia estar dentro del minuto de la fecha actual

  Result := EncodeDate(2000, 1, 1);

  if Self.DataBase.Connected then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'SELECT FECHA_SERVICIO_ULT_CONEXION FROM VF_ESTADO WHERE EMPRESA = :EMPRESA AND CANAL = :CANAL';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           ExecQuery;
           Result := FieldByName['FECHA_SERVICIO_ULT_CONEXION'].AsDateTime;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMMain.EnviaMensajeUsuario(Usuario: integer; Mensaje: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Text := 'INSERT INTO SYS_USUARIOS_MENSAJES (FECHA_INI, TERCERO, USUARIO, ACTIVO, MENSAJE) VALUES (:FECHA_INI, -1, :USUARIO, 1, :MENSAJE)';
        Params.ByName['FECHA_INI'].AsDateTime := Now;
        // Params.ByName['TERCERO'].AsInteger := Tercero;
        Params.ByName['USUARIO'].AsInteger := Usuario;
        // Params.ByName['ACTIVO'].AsInteger := 1;
        Params.ByName['MENSAJE'].AsString := Mensaje;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.ExisteDocumentoFolio(Rut, Folio, TipoDocTributario: string): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        SQL.Add(' SELECT FIRST 1 F.ID_E ');

        if (TipoDocTributario = '52') then
           SQL.Add(' FROM GES_CABECERAS_E_ALB F ')
        else
           SQL.Add(' FROM GES_CABECERAS_E_FAC F ');

        SQL.Add(' JOIN SYS_TERCEROS T ON F.TERCERO = T.TERCERO ');
        SQL.Add(' WHERE ');
        SQL.Add(' F.EMPRESA = :EMPRESA AND ');
        SQL.Add(' F.CANAL = :CANAL AND ');
        SQL.Add(' T.NIF = :RUT AND ');
        SQL.Add(' F.FOLIO = :FOLIO AND ');
        SQL.Add(' F.TIPO_DOC_TRIBUTARIO = :TIPO_DOC_TRIBUTARIO ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['RUT'].AsString := Rut;
        Params.ByName['FOLIO'].AsString := Folio;
        Params.ByName['TIPO_DOC_TRIBUTARIO'].AsString := TipoDocTributario;
        ExecQuery;

        Result := (FieldByName['ID_E'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameMotivoAbono(Codigo: integer): string;
begin
  Result := '';
  if (Codigo >= 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'SELECT DESCRIPCION FROM SYS_MOTIVO_ABONO WHERE CODIGO = ' + IntToStr(Codigo);
           ExecQuery;
           Result := FieldByName['DESCRIPCION'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMMain.ExistePalabra(Palabra: string): boolean;
begin
  Result := False;
  Palabra := Trim(Copy(Palabra, 1, 40));
  if (Palabra >= ' ') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           // Las palabras conocidas se han insertado utilizando UPPER() por lo que no es necesario para wl "WHERE PALABRA ="
           SQL.Text := 'SELECT CAST(1 AS INTEGER) EXISTE FROM DIC_PALABRAS WHERE PALABRA = UPPER(CAST(''' + Palabra + ''' AS VARCHAR(40)))';
           ExecQuery;
           Result := (FieldByName['EXISTE'].AsInteger = 1);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMMain.AgregarPalabra(Palabra, Origen: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := Self.DataBase;
        // Las palbras conocidas se insertan utilizando UPPER() para normalizar los datos
        SQL.Text := 'INSERT INTO DIC_PALABRAS (PALABRA, ENTRADA, ORIGEN) VALUES (UPPER(:PALABRA), :ENTRADA, :ORIGEN)';
        Params.ByName['PALABRA'].AsString := Trim(Copy(Palabra, 1, 40));
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ORIGEN'].AsString := Origen;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameCuentaBanco(Banco: integer): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CUENTA_CC FROM CON_CUENTAS_GES_BAN WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND BANCO = :BANCO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['BANCO'].AsInteger := Banco;
        ExecQuery;
        Result := FieldByName['CUENTA_CC'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.LotesCaducidadDias(var ListaArticulos: string; Dias: integer): integer;
var
  DS : TFIBDataSet;
begin
  ListaArticulos := '';
  Result := 0;
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Close;
        DataBase := Self.DataBase;
        Transaction := DameTransactionRW(Self.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' WITH T ');
           SelectSQL.Add(' AS (SELECT L.ARTICULO, L.ID_LOTE, L.LOTE, L.F_CADUCIDAD, ');
           SelectSQL.Add('            (SELECT STOCK ');
           SelectSQL.Add('             FROM A_ART_DAME_STOCK_LOTE_UBICACION(L.EMPRESA, L.CANAL, L.ALMACEN, L.ID_LOTE, -1)) STOCK');
           SelectSQL.Add('     FROM ART_ARTICULOS_LOTES L ');
           SelectSQL.Add('     WHERE ');
           SelectSQL.Add('     L.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add('     L.F_CADUCIDAD BETWEEN CAST(''TODAY'' AS DATE) AND (CAST(''TODAY'' AS DATE) + CAST(:DIAS AS INTEGER))) ');
           SelectSQL.Add(' SELECT * ');
           SelectSQL.Add(' FROM T ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' STOCK <> 0 ');
           SelectSQL.Add(' ORDER BY F_CADUCIDAD, ARTICULO, LOTE ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['DIAS'].AsInteger := Dias;
           Open;

           ListaArticulos := format('%.15s - %.15s - %.10s - %.9s', [_('ARTICULO'), _('LOTE'), _('CADUCIDAD'), _('STOCK')]) + #13#10;
           while not EOF do
           begin
              ListaArticulos := ListaArticulos + format('%.15s - %.15s - %.10s - %9.2f' + #13#10, [FieldByName('ARTICULO').AsString, FieldByName('LOTE').AsString, FormatDateTime('dd/mm/yyyy', FieldByName('F_CADUCIDAD').AsDateTime), FieldByName('STOCK').AsFloat]);

              if (Length(ListaArticulos) = 512) then
              begin
                 ListaArticulos := ListaArticulos + '...';
                 Last;
              end;

              Inc(Result);
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

function TDMMain.VencimientosMas75Dias(var ListaRecibos: string): integer;
var
  DS : TFIBDataSet;
begin
  /// Lista de recibos que vencieron hace 75 dias.
  /// No tiene en cuenta "Terccero Varios" ni recibos manuales (Tipo "NRC") ni remesados
  /// Lo pidió Tubos París para recordar los recibos que deben reclamarse a Crédito y Caución

  ListaRecibos := '';
  Result := 0;
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Close;
        DataBase := Self.DataBase;
        Transaction := DameTransactionRW(Self.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT C.DOC_TIPO || '' '' || C.DOC_SERIE || ''/'' || C.DOC_NUMERO DOCUMENTO, C.DOC_FECHA, D.VENCIMIENTO, ');
           SelectSQL.Add('        DATEDIFF(DAY FROM D.VENCIMIENTO TO CAST(''TODAY'' AS DATE)), CC.CLIENTE, T.NOMBRE_R_SOCIAL, T.NIF ');
           SelectSQL.Add(' FROM EMP_CARTERA C ');
           SelectSQL.Add(' JOIN EMP_CARTERA_DETALLE D ON C.ID_CARTERA = D.ID_CARTERA ');
           SelectSQL.Add(' LEFT JOIN GES_CABECERAS_S CC ON C.ID_DOC = CC.ID_S ');
           SelectSQL.Add(' LEFT JOIN EMP_CLIENTES CL ON CC.EMPRESA = CL.EMPRESA AND CC.CLIENTE = CL.CLIENTE ');
           SelectSQL.Add(' LEFT JOIN SYS_TERCEROS T ON CL.TERCERO = T.TERCERO ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' C.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' C.CANAL = :CANAL AND ');
           SelectSQL.Add(' C.SIGNO = ''C'' AND ');
           SelectSQL.Add(' D.VISIBLE = 1 AND ');
           SelectSQL.Add(' D.PAGADO = 0 AND ');
           SelectSQL.Add(' D.REMESA <= 0 AND ');
           SelectSQL.Add(' C.COD_CLI_PRO > 0 AND ');
           SelectSQL.Add(' C.DOC_TIPO <> ''NRC'' AND ');
           SelectSQL.Add(' DATEDIFF(DAY FROM D.VENCIMIENTO TO CAST(''TODAY'' AS DATE)) BETWEEN 75 AND 91 ');
           SelectSQL.Add(' ORDER BY D.VENCIMIENTO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Open;

           ListaRecibos := format('%.15s - %.10s - %.15s - %.9s', [_('FACTURA'), _('VENC.'), _('NIF'), _('CLIENTE'), _('NOMBRE')]) + #13#10;
           while not EOF do
           begin
              ListaRecibos := ListaRecibos + format('%.15s - %.15s - %.10s - %s' + #13#10, [FieldByName('DOCUMENTO').AsString, FormatDateTime('dd/mm/yyyy', FieldByName('VENCIMIENTO').AsDateTime), FieldByName('NIF').AsString, FieldByName('NOMBRE_R_SOCIAL').AsString]);

              if (Length(ListaRecibos) = 512) then
              begin
                 ListaRecibos := ListaRecibos + '...';
                 Last;
              end;

              Inc(Result);
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

/// Funcion para leer cualquier valor de cualquier tabla, convertido a string
/// Ejemplo de uso:
/// DameValorTabla('OPE_EMPLEADO', 'EMPLEADO=01', 'NOMBRE','1000')
function TDMMain.DameValorTabla(Tabla, Condicion, CampoDevolver: string; Filtro: string = '0000'): string;
var
  Q : THYFIBQuery;
begin
  Result := '';

  // Aseguro que Filtro tenga 4 caracteres
  if (Length(Filtro) < 4) then
     Filtro := Copy(Filtro + '0000', 1, 4);

  // Limpio Condicion
  if (Trim(Condicion) = '') then
     Condicion := '1 = 1';

  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ' + CampoDevolver + ' FROM ' + Tabla);
        SQL.Add(' WHERE ');
        SQL.Add(' (' + Condicion + ') ');

        if Filtro <> '0000' then
        begin
           if Filtro[1] = '1' then
              SQL.Add(' AND EMPRESA = :EMPRESA ');
           if Filtro[2] = '1' then
              SQL.Add(' AND EJERCICIO = :EJERCICIO ');
           if Filtro[3] = '1' then
              SQL.Add(' AND CANAL = :CANAL ');
           if Filtro[4] = '1' then
              SQL.Add(' AND SERIE = :SERIE ');
        end;

        FiltraQry(Q, Filtro);

        Result := FieldByName[CampoDevolver].AsString;

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMMain.DameLREComuna(LRE: string): string;
begin
  try
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := Self.DataBase;
           SQL.Text := 'SELECT TITULO FROM SYS_POBLACION WHERE PAIS = :PAIS AND LRE = :LRE';
           Params.ByName['PAIS'].AsString := REntorno.Pais;
           Params.ByName['LRE'].AsString := LRE;
           ExecQuery;
           Result := FieldByName['TITULO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  except
     Result := '';
  end;
end;

procedure TDMMain.GrabaExpedicion(IdALB, Bultos: integer; Peso: double; Expedicion, Prefijo: string; Fecha: TDateTime; Transportista: integer);
var
  Envio : integer;
  Empresa, Ejercicio, Canal, Rig, Estado : integer;
  Serie, Tipo : string;
begin
  // Quito la hora
  Fecha := RecodeTime(Fecha, 0, 0, 0, 0);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ENVIO FROM GES_CABECERAS_S_ENVIO  ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' FECHA_ENV = :FECHA AND ');
        SQL.Add(' TITULO STARTING WITH :PREFIJO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['FECHA'].AsDateTime := Fecha;
        Params.ByName['PREFIJO'].AsString := Prefijo;
        ExecQuery;
        Envio := FieldByName['ENVIO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Envio = 0) then
  begin
     Envio := DMMain.Contador_E('ENV');

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO GES_CABECERAS_S_ENVIO ( ');
           SQL.Add(' EMPRESA, ENVIO, TITULO, FECHA_ENV/*, BULTOS*/) ');
           SQL.Add(' VALUES ( ');
           SQL.Add(' :EMPRESA, :ENVIO, :TITULO, :FECHA /*, _BULTOS*/) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ENVIO'].AsInteger := Envio;
           Params.ByName['FECHA'].AsDateTime := Fecha;
           Params.ByName['TITULO'].AsString := Prefijo + ' ' + FormatDateTime('yyyy-mm-dd', Fecha);
           // Params.ByName['BULTOS'].AsInteger := Bultos;
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
        SQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ESTADO ');
        SQL.Add(' FROM GES_CABECERAS_S ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_S = :ID_S ');
        Params.ByName['ID_S'].AsInteger := IdALB;
        ExecQuery;
        Empresa := FieldByName['EMPRESA'].AsInteger;
        Ejercicio := FieldByName['EJERCICIO'].AsInteger;
        Canal := FieldByName['CANAL'].AsInteger;
        Serie := FieldByName['SERIE'].AsString;
        Tipo := FieldByName['TIPO'].AsString;
        Rig := FieldByName['RIG'].AsInteger;
        Estado := FieldByName['ESTADO'].AsInteger;
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
        SQL.Add(' UPDATE GES_CABECERAS_S_ALB ');
        SQL.Add(' SET ');
        SQL.Add(' BULTOS_KRI = :BULTOS, ');
        SQL.Add(' TEXTO_PORTES = :EXPEDICION ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_S = :ID_S ');
        Params.ByName['ID_S'].AsInteger := IdALB;
        Params.ByName['BULTOS'].AsInteger := Bultos;
        Params.ByName['EXPEDICION'].AsString := Copy(Expedicion, 1, 35);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (Estado = 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE OR INSERT INTO GES_CABECERAS_S_CGA ( ');
           SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, BULTOS, PESO, CODIGO_EXPEDICION, TRANSPORTISTA) ');
           SQL.Add(' VALUES ( ');
           SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :BULTOS, :PESO, :CODIGO_EXPEDICION, :TRANSPORTISTA) ');
           SQL.Add(' MATCHING (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG) ');
           Params.ByName['EMPRESA'].AsInteger := Empresa;
           Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           Params.ByName['CANAL'].AsInteger := Canal;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['TIPO'].AsString := Tipo;
           Params.ByName['RIG'].AsInteger := Rig;
           Params.ByName['BULTOS'].AsInteger := Bultos;
           Params.ByName['PESO'].AsFloat := Peso;
           Params.ByName['CODIGO_EXPEDICION'].AsString := Copy(Expedicion, 1, 35);
           Params.ByName['TRANSPORTISTA'].AsInteger := Transportista;
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
        SQL.Add(' UPDATE GES_CABECERAS_S ');
        SQL.Add(' SET ');
        SQL.Add(' ENVIO = :ENVIO ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_S = :ID_S ');
        Params.ByName['ID_S'].AsInteger := IdALB;
        Params.ByName['ENVIO'].AsInteger := Envio;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMain.ValidacionTercero(Tercero: integer; var NIF, ResultadoValidacion, ResultadoValidacionNombre: string; var ResultadoFechaComprobacion: TDateTime);
begin
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT T.NIF, V.RESULTADO, V.RESULTADO_NOMBRE, V.FECHA_COMPROBACION ');
           SQL.Add(' FROM SYS_TERCEROS T ');
           SQL.Add(' JOIN VALIDACION_DOCUMENTO V ON T.PAIS_TERCERO = V.PAIS AND T.TIPO_DOC_IDENT = V.TIPO_DOC_IDENT AND T.NIF = V.DOCUMENTO ');
           SQL.Add(' WHERE ');
           SQL.Add(' T.TERCERO = :TERCERO ');
           Params.ByName['TERCERO'].AsInteger := Tercero;
           ExecQuery;
           NIF := FieldByName['NIF'].AsString;
           ResultadoValidacion := FieldByName['RESULTADO'].AsString;
           ResultadoValidacionNombre := FieldByName['RESULTADO_NOMBRE'].AsString;
           ResultadoFechaComprobacion := FieldByName['FECHA_COMPROBACION'].AsDateTime;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMMain.ValidacionTerceroVarios(IdS: integer; var NIF, ResultadoValidacion, ResultadoValidacionNombre: string; var ResultadoFechaComprobacion: TDateTime);
begin
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT C.NIF, V.RESULTADO, V.RESULTADO_NOMBRE, V.FECHA_COMPROBACION ');
           SQL.Add(' FROM GES_CABECERAS_S_FAC_NIF C ');
           SQL.Add(' JOIN VALIDACION_DOCUMENTO V ON C.PAIS_DOC_IDENT = V.PAIS AND C.TIPO_DOC_IDENT = V.TIPO_DOC_IDENT AND C.NIF = V.DOCUMENTO ');
           SQL.Add(' WHERE ');
           SQL.Add(' C.ID_S = :ID_S ');
           Params.ByName['ID_S'].AsInteger := IdS;
           ExecQuery;
           NIF := FieldByName['NIF'].AsString;
           ResultadoValidacion := FieldByName['RESULTADO'].AsString;
           ResultadoValidacionNombre := FieldByName['RESULTADO_NOMBRE'].AsString;
           ResultadoFechaComprobacion := FieldByName['FECHA_COMPROBACION'].AsDateTime;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

end.
{
   with THYFIBQuery.Create(nil) do
   begin
      try
         Close;
         DataBase := DMMain.DataBase;
         SQL.Text := '';
         Params.ByName[''].AsString := ;
         ExecQuery;
         Result := FieldByName[''].AsInteger;
         FreeHandle;
      finally
         Free;
      end;
   end;
}{
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := '';
        Params.ByName[''].AsString := ;
        TFParada.Create(Self).ExecQuery(Q);
        FreeHandle;
     finally
        Free;
     end;
  end;
}{
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := '';
        Params.ByName[''].AsString := ;
        with TFParadaExt.Create(Self) do
        begin
           try
              repeat until ExecQuery(Q, _('Atención:'), 30000);
           finally
              Free;
           end;
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;
}{
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add('');
           Params.ByName[''].AsString := ;
           Open;
           while (not EOF) do
           begin
              // Hacer cosas

              Next;
           end;
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
}{
procedure TFMxxx.DBGridBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     CondicionBusqueda := '';
     PlanBusquedaNum := '';
     PlanBusquedaStr := '';
     // Busco indice de tabla
     i := Tablas.IndexOf(TablaABuscar);
     if (i >= 0) then
     begin
        // Si no hay suficientes elementos en OrdenadosPor, los agrego
        while (OrdenadosPor.Count <= i) do
           OrdenadosPor.Add('');
     end;

     if (Trim(TablaABuscar) = 'VER_ARTICULOS_EF') or
        (Trim(TablaABuscar) = 'VER_ARTICULOS_EF_VENTAS') then
     begin
        CondicionBusqueda :=
           'EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' +
           REntorno.EjercicioStr + ' AND CANAL=' + REntorno.CanalStr + ' AND ' +
           'FAMILIA<>''' + REntorno.FamSistema + '''';
        // Se establece el orden para esta tabla
        OrdenadosPor[i] := 'ARTICULO';
     end
     else
        CondicionBusqueda := 'EMPRESA = ' + REntorno.EmpresaStr;
  end;
end;
}{
select a.id_a, a.articulo, a.titulo, f.id_familia, f.familia, t.precio_venta,
(select sum(EXISTENCIAS) from A_ART_DAME_STOCK_ART_ED(a.empresa, 1 /*canal*/, a.articulo, '', 1, 0, 0, 0, 0, 0, 0, null)) as stock
from art_articulos a
join art_familias f
on a.empresa = f.empresa and a.familia = f.familia
join art_tarifas_precios t
on a.empresa = t.empresa and a.articulo = t.articulo and t.tarifa = 'NOR' and t.linea = 1
where
a.empresa = 1
and a.web = 1
and a.ult_modificacion > '01-01-2011'
order by a.id_a


select id_familia, familia, titulo from art_familias
where
empresa = 1
and web = 1
and ult_modificacion > '01-01-2011'
order by id_familia
}