unit UEntorno;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Classes, Controls;

{
type
  TRPos = record
     Empresa: smallint;
     Ejercicio: smallint;
     Canal: smallint;
     Serie: string[10];
  end;
}
type
  TaDigCont = array[1..15] of smallint;

  TREntorno = class(TComponent)
  private
     FNombreAplicacion: string;
     FDirectorioBase: string;
     FCanal: integer;
     FCanalStr: string;
     FEjercicio: integer;
     FEjercicioStr: string;
     FEmpresa: integer;
     FEmpresaStr: string;
     FEntrada: integer;
     FEntradaStr: string;
     FFechaTrab: TDateTime;
     FFechaTrabStr: string;
     FNivel: integer;
     FNivelStr: string;
     FRestriccion: integer;
     FRestriccionStr: string;
     FUsuario: integer;
     FUsuarioStr: string;
     FAgente: integer;
     FModoCierraForm: integer;
     FModoCierraFormStr: string;
     FModoEnter: integer;
     FModoEnterStr: string;
     FFamSistema: string;      // Familia del Sistema
     FFamDefecto: string;      // Familia por Defecto
     FTarifaDefecto: string;   // Tarifa por Defecto
     FAlmacenDefecto: string;  // Almacén por Defecto
     FArtTextoLibre: string;   // Artículo de Texto Libre
     FUser_Profile: integer;
     FPgc: integer;
     FFicheroINI: string;
     FSmtp: string;
     FPort: integer;
     FUserID: string;
     FPassword: string;
     FPasswordEnc: string;
     FIdentificacion: boolean;
     FAutenticacionTLS: boolean;
     FRestriccionDocumento: integer;
     procedure SetCanal(valor: integer);
     procedure SetEjercicio(valor: integer);
     procedure SetEmpresa(valor: integer);
     procedure SetEntrada(valor: integer);
     procedure SetFechaTrab(valor: TDateTime);
     procedure SetNivel(valor: integer);
     procedure SetRestriccion(valor: integer);
     procedure SetUsuario(valor: integer);
     procedure setAgente(valor: integer);
     procedure SetModoCierraForm(valor: integer);
     procedure SetModoEnter(valor: integer);
     function GetFechaTrab: TDateTime;
     function GetFechaTrabSH: TDate;
     function GetFechaTrabStr: string;
     function GetFechaTrabSHStr: string;
     function GetRestriccionDocumento: integer;
     procedure SetRestriccionDocumento(Valor: integer);
     procedure SetLaser(const Value: integer);
     procedure SetBandejaLaser(const Value: integer);
     procedure SetEtiquetas(const Value: integer);
     procedure SetMatricial(const Value: integer);
     procedure SetNombreLaser(const Value: string);
     procedure SetNombreEtiquetas(const Value: string);
     procedure SetNombreEtiquetasCompleto(const Value: string);
     procedure SetNombreMatricial(const Value: string);
  public
     Nombre: string[31];
     Clave: string[31];
     Moneda: string[03];
     MonedaEmpresa: string[03];
     Serie: string[10];
     SerieDeposito: string[10]; {dji lrk kri}
     Caja: integer;
     Turno: integer;
     Sesion: integer;
     OldTicket: boolean;
     NivelesCont: smallint;
     MascaraCuentas: string;
     MaxNivCont: smallint;
     DigitCont: TaDigCont;
     DigitAcumula: TaDigCont;
     DigitosSub: smallint;
     BaseDeDatos: string;
     BaseDeDatosAdjuntos: string;
     BaseDeDatosImagenes: string;
     OtrasBasesDeDatos: TStrings;
     IconosSimples: boolean;
     Memorizar_Fecha: boolean;
     Sistema: string;
     IconosCaption: boolean;
     Version: string[5];
     Perfil: string;
     Logo: string; // Dirección en disco del logo en entrada
     RutaFicheros: string; // Ruta de carpeta compartida donde se guardan los adjuntos. Se establece en SYS_CONSTANTES
     // TPV
     AbrirCajon: string; // Provisional
     Ticketera: string;
     TicketeraPuerto: string;
     Cajon: string;
     CortePapel: string;
     Visor: string;
     AbrirVisor: string;
     CerrarVisor: string;
     VisorColumnas: integer;
     VisorLineas: integer;
     ClavePorTicket: boolean;
     TabStopUnidades: boolean;
     CajaUnica: integer;
     LimitaAbrirTickets: boolean;
     LimitaBorrarTickets: boolean;
     LimitaEditarTickets: boolean;
     LimitaEditarPrecio: boolean;
     Estilo: smallint;
     TodoTactil: smallint;
     FLaser: integer;
     FBandejaLaser: integer;
     FEtiquetas: integer;
     FMatricial: integer;
     FNombreLaser: string;
     FNombreEtiquetas: string;
     FNombreEtiquetasCompleto: string;
     FNombreMatricial: string;
     Menu_Left: smallint;
     Menu_Top: smallint;
     Servidores: smallint;
     UsuarioBD, ClaveBD, RolBD, CharsetBD: string;
     UsuarioBD_Admin, ClaveBD_Admin, RolBD_Admin, CharsetBD_Admin: string;
     UsuarioBDAdjuntos, ClaveBDAdjuntos, RolBDAdjuntos, CharsetBDAdjuntos: string;
     UsuarioBDImagenes, ClaveBDImagenes, RolBDImagenes, CharsetBDImagenes: string;
     DirBackups: string;
     VerSoloArticulosDisponibles: boolean;
     // En documentos de compra y venta, en el gridfind del articulo, que filtre según la disponibilidad
     ColorEnlaceActivo: integer;
     ColorCampoID: integer;
     PVP_Ud_Sec: boolean;
     Moneda_Sec: string; // Moneda secundaria para la impresión de documentos.
     Precio_coste_mov: boolean;
     // Correo electrónico
     // Smtp: String;
     // Port: Integer;
     // UserID: String;
     // Password: String;
     // Identificacion: Boolean;
     // Grupos de Noticias
     News: string;
     PortNews: integer;
     UserIDNews: string;
     PasswordNews: string;
     IdentNews: boolean;
     // Parametrización del INI y proyecto
     NombrePrograma: string;
     FicheroAyuda: string;
     FicheroEXE: string;
     // RutaFicheroValoresSinc: string;
     // RutaIniSincronizacion: string;
     // FicheroINI: String;
     ReportesReportSmith: string;  // dji lrk kri directorio para los reportes de ReportSmith (Reportes de Usuarios)
     RuntimeReportSmith: string;  // dji lrk kri directorio donde esta RS_RUN.exe (Reportes de Usuarios)
     Delegacion: string;  // dji lrk kri
     AlmacenRestringido: string;  // dji lrk kri
     SerieRestringida: string;  // dji lrk kri
     AlbaranRestringido: boolean; {dji lrk kri}
     ContabilidadRestringida: boolean; {dji lrk kri}
     // Seleccion de todos los datos de una empresa
     Tercero: integer;       // El Tercero de la Empresa
     NombreEmpresa: string;  // Titulo de la Empresa
     NombreEmpCom: string;   // Titulo Comercial de la Empresa
     TipoRazon: string;      // Tipo de Razón de la Empresa
     CifEmpresa: string;     // NIF de la Empresa
     DirEmpresa: string;     // Direccion ajustada de la Empresa
     PobEmpresa: string;     // Código Postal y población
     ProvEmpresa: string;
     ColoniaEmpresa: string;
     Tel1Empresa: string;     // Teléfono 1
     Tel2Empresa: string;     // Teléfono 2
     FaxEmpresa: string;      // Fax de la Empresa
     EmailEmpresa: string;    // E-casa de la empresa
     WebEmpresa: string;      // Güeb de la Empresa
     ImagenEmpresa: integer;  // Imagen de la Empresa
     ImagenFondo: integer;    // Imagen de fondo
     ImpCabEmpresa: integer;  // Impresión de cabecera de la empresa en lst
     Pais: string;            // País de la Empresa
     NombreCaja: string;       // Titulo de la caja
     // dji lrk kri diarios
     // Facturas Acreedor
     Asiento_FCR: string;
     // Tipo de Asiento por defecto para las facturas de Acr.
     Asiento_REM: string;  // Tipo de Asiento por defecto para Remesas
     Asiento_CAR_C: string;  // Tipo de Asiento por defecto para Cartera Cobros
     Asiento_CAR_P: string;  // Tipo de Asiento por defecto para Cartera Pagos
     Asiento_P_AGR_C: string;  // Tipo de Asiento por defecto para Pagos Agrupados
     Asiento_P_AGR_P: string;  // Tipo de Asiento por defecto para Pagos Agrupados
     Asiento_ANT: string;  // Tipo de Asiento por defecto para Anticipos
     Asiento_TAL_C: string;  // Tipo de Asiento por defecto para Talones
     Asiento_TAL_P: string;  // Tipo de Asiento por defecto para Talones
     Asiento_PAG_C: string;  // Tipo de Asiento por defecto para Pagares
     Asiento_PAG_P: string;  // Tipo de Asiento por defecto para Pagares
     // Impresion de Documentos
     Ofertas: smallint;
     Pedidos: smallint;
     Albaranes: smallint;
     Facturas: smallint;
     DispositivoFirma: string;
     // Seleccion del Riesgo del Cliente
     Riesgo: integer;  // El Riesgo de un Cliente (def. EmpEjerCanal)
     // Seleccion de clientes automáticos
     Cliente_aut: boolean;
     Proveedor_aut: boolean;
     Acreedor_aut: boolean;
     // Seleccion de Impresión
     Grupo: integer;          // Grupo de listados
     Formato: integer;        // Formato de Impresion
     Cabecera: integer;       // Cabecera del Listado
     Copias: integer;         // Numero de copias a imprimir
     Pijama: integer;         // Usar pijama o no
     TipoListado: string[3];  // Tipo de Listado
     DecimalesVer, DecimalesCalculo: integer;
     // Datos cerrados al arrancar
     DatosAbiertos: boolean;
     // Guarda los filtros de los forms
     GuardaFiltros: boolean;
     // Listar los pedidos de compra
     ListaPedCompra: integer;   // 0 No 1 Si.
     // dji lrk kri - EDI
     DirectorioEDI_Entrada: string;
     DirectorioEDI_Salida: string;
     DirectorioAutofirma: string;
     VersionAutofirma: string;
     Directorio7Zip: string;
     DirectorioCurl: string;
     DirectorioSumatraPDF: string;
     DirectorioAdjuntos: string;
     DirectorioLector: string;
     DirectorioComunicaciones: string;  { dji lrk kri directorio para cartas a cli/pro/... }
     // Ruta de los libros diarios
     RutaLibros: string;
     // Ruta Exe
     RutaExe: string;
     // Cantidad de Líneas a procesar en cada iterasión.
     LineasAProc: integer;
     AbrirPropuestas: boolean;
     TarifaDefectoTPV: string;
     procesos: integer; //sfg.albert (dmprocesos)
     timer_proc: integer; //sfg.albert - expresado en segundos
     FechaHoraG2k: boolean;
     RECC: integer; // Registro Especial de Criterio de Caja
     IdiomaCanal: string;
     MaquinaSincronizacion: string;
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;
  published
     property NombreAplicacion: string Read FNombreAplicacion Write FNombreAplicacion;
     property Canal: integer Read FCanal Write SetCanal;
     property CanalStr: string Read FCanalStr;
     property Ejercicio: integer Read FEjercicio Write SetEjercicio;
     property EjercicioStr: string Read FEjercicioStr;
     property Empresa: integer Read FEmpresa Write SetEmpresa;
     property EmpresaStr: string Read FEmpresaStr;
     property Entrada: integer Read FEntrada Write SetEntrada;
     property EntradaStr: string Read FEntradaStr;
     property FechaTrab: TDateTime Read GetFechaTrab Write SetFechaTrab;
     property FechaTrabSH: TDate Read GetFechaTrabSH;
     property FechaTrabStr: string Read GetFechaTrabStr;
     property FechaTrabSHStr: string Read GetFechaTrabSHStr;
     property Nivel: integer Read FNivel Write SetNivel;
     property NivelStr: string Read FNivelStr;
     property Usuario: integer Read FUsuario Write SetUsuario;
     property UsuarioStr: string Read FUsuarioStr;
     property Agente: integer Read FAgente Write SetAgente;
     property Pgc: integer Read FPgc Write FPgc;
     // property Restriccion: integer read FNivel write SetNivel;
     property Restriccion: integer Read FRestriccion Write SetRestriccion;
     property ModoCierraFormStr: string Read FModoCierraFormStr;
     property ModoCierraForm: integer Read FModoCierraForm Write SetModoCierraForm;
     property ModoEnterStr: string Read FModoEnterStr;
     property ModoEnter: integer Read FModoEnter Write SetModoEnter;
     property RestriccionDocumento: integer Read GetRestriccionDocumento Write SetRestriccionDocumento;
     property User_Profile: integer Read FUser_Profile Write FUser_Profile;
     // Familia del Sistema
     property FamSistema: string Read FFamSistema Write FFamSistema;
     // Familia Normal
     property FamDefecto: string Read FFamDefecto Write FFamDefecto;
     // Tarifa Normal
     property TarifaDefecto: string Read FTarifaDefecto Write FTarifaDefecto;
     // Almacén por Defecto
     property AlmacenDefecto: string Read FAlmacenDefecto Write FAlmacenDefecto;
     // Artículo Texto Libre
     property ArtTextoLibre: string Read FArtTextoLibre Write FArtTextoLibre;
     // Parametrización del INI y proyecto
     property FicheroINI: string Read FFicheroINI Write FFicheroINI;
     // Correo electrónico
     property Smtp: string Read FSmtp Write FSmtp;
     property Port: integer Read FPort Write FPort;
     property UserID: string Read FUserID Write FUserID;
     property Password: string Read FPassword Write FPassword;
     property PasswordEnc: string Read FPasswordEnc Write FPasswordEnc;
     property Identificacion: boolean Read FIdentificacion Write FIdentificacion;
     property AutenticacionTLS: boolean Read FAutenticacionTLS Write FAutenticacionTLS;
     property Laser: integer Read FLaser Write SetLaser;
     property BandejaLaser: integer Read FBandejaLaser Write SetBandejaLaser;
     property Etiquetas: integer Read FEtiquetas Write SetEtiquetas;
     property Matricial: integer Read FMatricial Write SetMatricial;
     property NombreLaser: string Read FNombreLaser Write SetNombreLaser;
     property NombreEtiquetas: string Read FNombreEtiquetas Write SetNombreEtiquetas;
     property NombreEtiquetasCompleto: string Read FNombreEtiquetasCompleto Write SetNombreEtiquetasCompleto;
     property NombreMatricial: string Read FNombreMatricial Write SetNombreMatricial;
  end;

var
  REntorno : TREntorno;
  MascaraN : string;    // Mascara decimales ver por Empresa, ejercicio, canal
  MascaraNSec : string; // Máscara decimales ver para la moneda secundaria
  MascaraL : string;    // Mascara decimales calculo por Empresa, ejercicio, canal
  MascaraE : string;    // Mascara decimales ver pero sólo por empresa
  MascaraD : string;    // Mascara decimales cálculo sólo por empresa

const
  versiondemo = False;
  UsaMayusculas = False;
  // Porcentajes
  MascaraP = '##0.00%';
  // Enteros
  MascaraI = ',##0.###';
  MascaraMini = '###0';
  MascaraC = ',##0.00000';
  MascaraKri = ',##0.000000'; {dji lrk kri}
  // MascaraF = '00/00/0000';
  SemCompras = 1;
  SemVentas = 2;
  SemClientes = 3;
  SemProveedores = 4;
  SemAcreedores = 5;
  SemComisionistas = 6;
  SemCC = 27;
  SemCA = 28;
  SemDescuentosEfectos = 29;
  SemEfectosDescontados = 30;
  SemCGASTOS = 44;
  SemCGASTOSDes = 31;

procedure InicializaIdioma; //IDIOMA_CODE
procedure CrearRegistroEntorno;
procedure DestruirRegistroEntorno;
procedure InicializaEntorno;
procedure LeeIni;
procedure EscribeIni;
function EstructuraCreada: boolean;
function CodificaClave(clave: string): string;
function DescodificaClave(clave: string): string;
procedure AjustaFormatoFechaHoraG2k;

implementation

uses UUtiles, UDMMain, DateUtils, UBackup, SysUtils, Math, Dialogs, IniFiles,
  {INI IDIOMA_CODE}
  Graphics,
  FIBTableDataSet, FIBEditFind, Forms, UHYReport,
  ActnList, DBCtrls, ExtCtrls, DB, UFIBModificados, FIBDataSet,
  FIBDataSetRO, HYFIBQuery, FIBTableDataSetRO, ULFDBEdit, ULFHYDBDescription,
  DBGrids, ULFDBEditFind2000, ULFEditFind2000, ULFEdit, ULFDBMemo, RXDBCtrl, ULFDBCheckBox,
  UFIBDBEditfind, DbComboBoxValue, Yearplan, ComCtrls, ULFToolBar, UG2kTBLoc, Fr_HYReport,
  FRD_Mngr, FR_FIBDB, FR_E_RTF, FR_E_CSV, FR_E_TXT, FR_E_HTM, FR_OLE, FR_BarC, FR_Chart,
  FR_RRect, FR_PTabl, FR_RxRTF, FR_Desgn, FR_HyDesgn, FR_DCtrl, FR_Cross,
  FR_Shape, FR_ChBox, FR_Rich, PsFR_E_WMF, PsFR_E_EMF,
  PsFR_E_BMP, PsFR_E_GIF, PsFR_E_Graphic, PsFR_E_JPEG, PsFR_E_EXCEL,
  PsFR_E_RTF, PsFR_E_HTML, PsFR_E_Main, PsFR_E_PDF, frxDCtrl, frxCross,
  frxDesgn, frxHyDesgn, frxClass, frxFIBHYComponents, frxChart, frxBarcode,
  frxChBox, frxExportCSV, frxExportHTML, frxOLE, frxRich, frxExportRTF,
  frxExportTXT, frxExportPDF, frxExportMail, frxExportText, frxDMPExport,
  frxHYMailExport, FR_E_HTML2, frRtfExp, frOLEExl, frxExportXLS,
  frxExportXML, frxHYReport, FR_DBSet, UHYReportMail,
  ULFFormStorage, FIBQuery, UComponentesBusquedaFiltrada, ADODB, ULFDBDateEdit, ULFDateEdit,
  ShDocVw, RxDBComb
  {FIN IDIOMA_CODE};


//  ______________________  //
// |                      | //
// | Metodos de TREntorno | //
// |______________________| //
//                          //

procedure TREntorno.SetModoCierraForm(valor: integer);
begin
  FModoCierraForm := valor;
  FModoCierraFormStr := IntToStr(valor);
end;

procedure TREntorno.SetModoEnter(valor: integer);
begin
  FModoEnter := valor;
  FModoEnterStr := IntToStr(valor);
end;

procedure TREntorno.SetCanal(valor: integer);
begin
  FCanal := valor;
  FCanalStr := IntToStr(valor);
end;

procedure TREntorno.SetEjercicio(valor: integer);
begin
  FEjercicio := valor;
  FEjercicioStr := IntToStr(valor);
end;

procedure TREntorno.SetEmpresa(valor: integer);
begin
  FEmpresa := valor;
  FEmpresaStr := IntToStr(valor);
end;

procedure TREntorno.SetEntrada(valor: integer);
begin
  FEntrada := valor;
  FEntradaStr := IntToStr(valor);
end;

procedure TREntorno.SetFechaTrab(valor: TDateTime);
begin
  FFechaTrab := valor;
  FFechaTrabStr := DateToStr(valor);
end;

procedure TREntorno.SetNivel(valor: integer);
begin
  FNivel := valor;
  FNivelStr := IntToStr(valor);
end;

procedure TREntorno.SetRestriccion(valor: integer);
begin
  FRestriccion := valor;
  FRestriccionStr := IntToStr(valor);
end;

procedure TREntorno.SetUsuario(valor: integer);
begin
  FUsuario := valor;
  FUsuarioStr := IntToStr(valor);
end;

procedure TREntorno.SetAgente(valor: integer);
begin
  FAgente := valor;
end;

function TREntorno.GetFechaTrab: TDateTime;
begin
  Result := DateOf(FFechaTrab) + Time;
end;

function TREntorno.GetFechaTrabSH: TDate;
begin
  Result := DateOf(FFechaTrab);
end;

function TREntorno.GetFechaTrabStr: string;
begin
  Result := DateTimeToStr(FechaTrab);
end;

function TREntorno.GetFechaTrabSHStr: string;
begin
  Result := DateToStr(FechaTrab);
end;

function TREntorno.GetRestriccionDocumento: integer;
begin
  // if (RestriccionDocumento = -1) then
  // begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MODIFICA_DOC FROM SYS_USUARIOS WHERE USUARIO = ' + IntToStr(REntorno.Usuario);
        ExecQuery;
        Result := FieldByName['MODIFICA_DOC'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
  // end
  // else
  //    Result := -1;
end;

procedure TREntorno.SetRestriccionDocumento(Valor: integer);
begin
  FRestriccionDocumento := Valor;
end;

constructor TREntorno.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  TranslateComponent(Self);
  OtrasBasesDeDatos := TStringList.Create;
end;

destructor TREntorno.Destroy;
begin
  inherited Destroy;
  OtrasBasesDeDatos.Free;
end;

//  _____________________  //
// |                     | //
// | Funciones Generales | //
// |_____________________| //
//                         //

//IDIOMA_CODE
procedure InicializaIdioma;
begin
  // Add extra domain for runtime library translations
  AddDomainForResourceString('delphi');

  // Force program to use CATALA instead of the current Windows settings
  // UseLanguage ('ca');

  // El dominio solo debe ser el nombre del ejecutable. GNUGetText buscara dentro de la carpeta lang\[idioma]\[NombreEjecutable].mo
  // TextDomain('delfos_' + GetCurrentLanguage);
  TextDomain(Copy(ExtractFileName(Application.ExeName), 1, Pos('.', ExtractFileName(Application.ExeName)) - 1));

  // Put ignores on the properties that cannot be translated
  TP_GlobalIgnoreClass(TDataSource);
  TP_GlobalIgnoreClass(TFont);
  TP_GlobalIgnoreClass(TParam);
  TP_GlobalIgnoreClass(TREntorno);
  TP_GlobalIgnoreClass(TEntornoFind2000);
  TP_GlobalIgnoreClass(TLFFibFormStorage);

  // FastReport
  TP_GlobalIgnoreClass(TfrxHYReport);
  TP_GlobalIgnoreClass(TfrDBDataSet);
  TP_GlobalIgnoreClass(THYReport);
  TP_GlobalIgnoreClass(THYReportMail);
  TP_GlobalIgnoreClass(TfrxUserDataSet);
  TP_GlobalIgnoreClass(THYPrinterOptions);
  TP_GlobalIgnoreClass(TfrTextExport);
  TP_GlobalIgnoreClass(TfrRxRichObject);
  TP_GlobalIgnoreClass(TfrPrintGrid);
  TP_GlobalIgnoreClass(TfrRoundRectObject);
  TP_GlobalIgnoreClass(TfrChartObject);
  TP_GlobalIgnoreClass(TfrBarCodeObject);
  TP_GlobalIgnoreClass(TfrOLEObject);
  TP_GlobalIgnoreClass(TfrHTMExport);
  TP_GlobalIgnoreClass(TfrCSVExport);
  TP_GlobalIgnoreClass(TfrRTFExport);
  TP_GlobalIgnoreClass(TfrFIBComponents);
  TP_GlobalIgnoreClass(TfrDataStorage);
  TP_GlobalIgnoreClass(TfrRichObject);
  TP_GlobalIgnoreClass(TfrCheckBoxObject);
  TP_GlobalIgnoreClass(TfrShapeObject);
  TP_GlobalIgnoreClass(TfrCrossObject);
  TP_GlobalIgnoreClass(TfrDialogControls);
  TP_GlobalIgnoreClass(TfrHyDesigner);
  TP_GlobalIgnoreClass(TfrHYReport);
  TP_GlobalIgnoreClass(TPsfrPDFExport);
  TP_GlobalIgnoreClass(TPsfrHTMLExport);
  TP_GlobalIgnoreClass(TPsfrRTFExport);
  TP_GlobalIgnoreClass(TPsfrEXCELExport);
  TP_GlobalIgnoreClass(TPsfrJPEGExport);
  TP_GlobalIgnoreClass(TPsfrGIFExport);
  TP_GlobalIgnoreClass(TPsfrBMPExport);
  TP_GlobalIgnoreClass(TPsfrEMFExport);
  TP_GlobalIgnoreClass(TPsfrWMFExport);
  TP_GlobalIgnoreClass(TfrxReport);
  TP_GlobalIgnoreClass(TfrxRTFExport);
  TP_GlobalIgnoreClass(TfrxRichObject);
  TP_GlobalIgnoreClass(TfrxOLEObject);
  TP_GlobalIgnoreClass(TfrxHTMLExport);
  TP_GlobalIgnoreClass(TfrxCSVExport);
  TP_GlobalIgnoreClass(TfrxCheckBoxObject);
  TP_GlobalIgnoreClass(TfrxBarCodeObject);
  TP_GlobalIgnoreClass(TfrxChartObject);
  TP_GlobalIgnoreClass(TfrxFIBHYComponents);
  TP_GlobalIgnoreClass(TfrxHYDesigner);
  TP_GlobalIgnoreClass(TfrxCrossObject);
  TP_GlobalIgnoreClass(TfrxDialogControls);
  TP_GlobalIgnoreClass(TfrxDotMatrixExport);
  TP_GlobalIgnoreClass(TfrxPDFExport);
  TP_GlobalIgnoreClass(TfrxHYMailExport);
  TP_GlobalIgnoreClass(TfrOLEExcelExport);
  TP_GlobalIgnoreClass(TfrRtfAdvExport);
  TP_GlobalIgnoreClass(TfrHTML2Export);
  TP_GlobalIgnoreClass(TfrxXLSExport);
  TP_GlobalIgnoreClass(TfrxXMLExport);

  TP_GlobalIgnoreClassProperty(TForm, 'HelpFile');
  TP_IgnoreClassProperty(TWebBrowser, 'StatusText');

  TP_GlobalIgnoreClassProperty(TAction, 'Category');
  TP_GlobalIgnoreClassProperty(TControl, 'HelpKeyword');
  TP_GlobalIgnoreClassProperty(TControl, 'ImeName');
  TP_GlobalIgnoreClassProperty(TNotebook, 'Pages');

  TP_GlobalIgnoreClassProperty(TFieldDef, 'Name');
  TP_GlobalIgnoreClassProperty(TColumn, 'FieldName');

  TP_GlobalIgnoreClass(TLFDateEdit);
  TP_GlobalIgnoreClass(TDBDateEdit);
  TP_GlobalIgnoreClass(TLFDBDateEdit);
  TP_GlobalIgnoreClass(TLFEdit);
  TP_GlobalIgnoreClass(TLFDbedit);
  TP_GlobalIgnoreClass(TLFDBEditFind2000);
  TP_GlobalIgnoreClass(TLFEditFind2000);
  TP_GlobalIgnoreClass(TLFDBMemo);
  TP_GlobalIgnoreClass(TLFHYDBDescription);

  //Clases de UFIBDBEditFind
  TP_GlobalIgnoreClass(TTablaBusqueda);
  TP_GlobalIgnoreClass(TFibDbEditDlg);
  TP_GlobalIgnoreClass(TFIBHYGGridFind);
  TP_GlobalIgnoreClass(TFIBHYGEditFind);
  TP_GlobalIgnoreClass(TFIBDBEditfind);
  TP_GlobalIgnoreClass(THYGRightEdit);
  TP_GlobalIgnoreClass(THYGDBRightEdit);
  TP_GlobalIgnoreClass(TTablaABuscarProperty);

  TP_GlobalIgnoreClassProperty(TG2KTBLoc, 'CampoNum');
  TP_GlobalIgnoreClassProperty(TG2KTBLoc, 'CamposADesplegar');
  TP_GlobalIgnoreClassProperty(TG2KTBLoc, 'CamposStr');
  TP_GlobalIgnoreClassProperty(TG2KTBLoc, 'Tabla_a_buscar');
  TP_GlobalIgnoreClassProperty(TG2KTBLoc, 'CondicionBusqueda');
  TP_GlobalIgnoreClassProperty(TG2KTBLoc, 'OrdenadoPor');
  TP_GlobalIgnoreClassProperty(TG2KTBLoc, 'Plan');

  TP_GlobalIgnoreClassProperty(TDBComboBox, 'DataField');
  TP_GlobalIgnoreClassProperty(TDBComboBox, 'Name');
  TP_GlobalIgnoreClassProperty(TDBCheckBox, 'DataField');
  TP_GlobalIgnoreClassProperty(TDBCheckBox, 'Name');
  TP_GlobalIgnoreClassProperty(TDBEdit, 'DataField');
  TP_GlobalIgnoreClassProperty(TDBEdit, 'Name');
  TP_GlobalIgnoreClassProperty(TDBImage, 'DataField');
  TP_GlobalIgnoreClassProperty(TDBImage, 'Name');
  TP_GlobalIgnoreClassProperty(TDBListBox, 'DataField');
  TP_GlobalIgnoreClassProperty(TDBListBox, 'Name');
  TP_GlobalIgnoreClassProperty(TDBLookupControl, 'DataField');
  TP_GlobalIgnoreClassProperty(TDBLookupControl, 'KeyField');
  TP_GlobalIgnoreClassProperty(TDBLookupControl, 'ListField');
  TP_GlobalIgnoreClassProperty(TDBLookupControl, 'Name');
  TP_GlobalIgnoreClassProperty(TDBMemo, 'DataField');
  TP_GlobalIgnoreClassProperty(TDBMemo, 'Name');
  TP_GlobalIgnoreClassProperty(TDBRadioGroup, 'DataField');
  TP_GlobalIgnoreClassProperty(TDBRadioGroup, 'Name');
  TP_GlobalIgnoreClassProperty(TDBRadioGroup, 'Values');
  TP_GlobalIgnoreClassProperty(TDBRichEdit, 'DataField');
  TP_GlobalIgnoreClassProperty(TDBRichEdit, 'Name');
  TP_GlobalIgnoreClassProperty(TDBText, 'DataField');
  TP_GlobalIgnoreClassProperty(TDBText, 'Name');

  TP_GlobalIgnoreClassProperty(TDBComboBoxValue, 'DataField');
  TP_GlobalIgnoreClassProperty(TDBComboBoxValue, 'DataSource');
  TP_GlobalIgnoreClassProperty(TDBComboBoxValue, 'Name');
  TP_GlobalIgnoreClassProperty(TLFDBCheckBox, 'DataField');
  TP_GlobalIgnoreClassProperty(TLFDBCheckBox, 'DataSource');

  TP_GlobalIgnoreClass(THYDatabase);
  TP_GlobalIgnoreClass(THYTransaction);
  TP_GlobalIgnoreClass(THYIBBackup);
  TP_GlobalIgnoreClass(THYFIBQuery);
  TP_GlobalIgnoreClass(TFIBQuery);
  TP_GlobalIgnoreClass(TFIBTableSet);
  TP_GlobalIgnoreClass(TFIBDataSet);
  {
  TP_GlobalIgnoreClassProperty(TFIBTableSet, 'CamposBloqueo');
  TP_GlobalIgnoreClassProperty(TFIBTableSet, 'CamposNoComparables');
  TP_GlobalIgnoreClassProperty(TFIBTableSet, 'ClavesPrimarias');
  TP_GlobalIgnoreClassProperty(TFIBTableSet, 'Database');
  TP_GlobalIgnoreClassProperty(TFIBTableSet, 'DataSource');
  TP_GlobalIgnoreClassProperty(TFIBTableSet, 'DeleteSQL');
  TP_GlobalIgnoreClassProperty(TFIBTableSet, 'Documentacion');
  TP_GlobalIgnoreClassProperty(TFIBTableSet, 'InsertSQL');
  TP_GlobalIgnoreClassProperty(TFIBTableSet, 'Name');
  TP_GlobalIgnoreClassProperty(TFIBTableSet, 'Plan');
  TP_GlobalIgnoreClassProperty(TFIBTableSet, 'RefreshSQL');
  TP_GlobalIgnoreClassProperty(TFIBTableSet, 'SelectSQL');
  TP_GlobalIgnoreClassProperty(TFIBTableSet, 'TablasBloqueo');
  TP_GlobalIgnoreClassProperty(TFIBTableSet, 'TableName');
  TP_GlobalIgnoreClassProperty(TFIBTableSet, 'Transaction');
  TP_GlobalIgnoreClassProperty(TFIBTableSet, 'UpdateSQL');
}
  TP_GlobalIgnoreClass(TFIBTableSetRO);
  {
  TP_GlobalIgnoreClassProperty(TFIBTableSetRO, 'ClavesPrimarias');
  TP_GlobalIgnoreClassProperty(TFIBTableSetRO, 'Database');
  TP_GlobalIgnoreClassProperty(TFIBTableSetRO, 'DataSource');
  TP_GlobalIgnoreClassProperty(TFIBTableSetRO, 'Documentacion');
  TP_GlobalIgnoreClassProperty(TFIBTableSetRO, 'Name');
  TP_GlobalIgnoreClassProperty(TFIBTableSetRO, 'Plan');
  TP_GlobalIgnoreClassProperty(TFIBTableSetRO, 'RefreshSQL');
  TP_GlobalIgnoreClassProperty(TFIBTableSetRO, 'SelectSQL');
  TP_GlobalIgnoreClassProperty(TFIBTableSetRO, 'TableName');
  TP_GlobalIgnoreClassProperty(TFIBTableSetRO, 'Transaction');
}
  TP_GlobalIgnoreClass(TFIBDataSetRO);
  {
  TP_GlobalIgnoreClassProperty(TFIBDataSetRO, 'Database');
  TP_GlobalIgnoreClassProperty(TFIBDataSetRO, 'DataSource');
  TP_GlobalIgnoreClassProperty(TFIBDataSetRO, 'Name');
  TP_GlobalIgnoreClassProperty(TFIBDataSetRO, 'Plan');
  TP_GlobalIgnoreClassProperty(TFIBDataSetRO, 'RefreshSQL');
  TP_GlobalIgnoreClassProperty(TFIBDataSetRO, 'SelectSQL');
  TP_GlobalIgnoreClassProperty(TFIBDataSetRO, 'Transaction');
}

  TP_GlobalIgnoreClass(TADOConnection);
  TP_GlobalIgnoreClass(TADOQuery);

  TP_GlobalIgnoreClass(TYearPlanner);

  TP_GlobalIgnoreClassProperty(TField, 'DefaultExpression');
  TP_GlobalIgnoreClassProperty(TField, 'FieldName');
  TP_GlobalIgnoreClassProperty(TField, 'KeyFields');
  TP_GlobalIgnoreClassProperty(TField, 'DisplayName');
  TP_GlobalIgnoreClassProperty(TField, 'LookupKeyFields');
  TP_GlobalIgnoreClassProperty(TField, 'LookupResultField');
  TP_GlobalIgnoreClassProperty(TField, 'Origin');
  TP_GlobalIgnoreClassProperty(TField, 'CustomConstraint');
  TP_GlobalIgnoreClassProperty(TField, 'ImportedConstraint');
  TP_GlobalIgnoreClassProperty(TField, 'ConstraintErrorMessage');
  TP_GlobalIgnoreClassProperty(TField, 'EditMask');

  TP_GlobalIgnoreClassProperty(TNumericField, 'EditFormat');
  TP_GlobalIgnoreClassProperty(TNumericField, 'DisplayFormat');

  TP_GlobalIgnoreClass(TRxDBComboBox);
end;
//FIN IDIOMA_CODE

procedure CrearRegistroEntorno;
var
  oIni : TIniFile;
begin
  REntorno := TREntorno.Create(Application);
  with REntorno do
  begin
     FNombreAplicacion := 'Merge';
     FDirectorioBase := 'C:\Delfos\';

     {$IFDEF AdmXXI}
     FNombreAplicacion := 'AdmXXI';
     FDirectorioBase := 'C:\Dikram\';
     {$ENDIF}

     {$IFDEF MaxFactu}
     FNombreAplicacion := 'MaxFactu';
     FDirectorioBase := 'C:\MaxFactu\';
     {$ENDIF}

     FicheroEXE := ExtractFileName(Application.ExeName);
     RutaEXE := ExtractFilePath(Application.ExeName);
     NombrePrograma := Copy(REntorno.FicheroEXE, 1, Length(REntorno.FicheroEXE) - Length(ExtractFileExt(REntorno.FicheroEXE)));
     FicheroAyuda := ChangeFileExt(RutaEXE + FicheroEXE, '.CHM');

     // Primero busco el .INI junto con el fichero exe.
     FicheroINI := ChangeFileExt(RutaEXE + FicheroEXE, '.INI');
     // Si no está, lo busco en lugar por defecto segun Windows (%APPDATA%\Merge\)
     if not FileExists(FicheroINI) then
        FicheroINI := ChangeFileExt(GetSpecialFolderPath(CSIDL_APPDATA, False) + '\' + FNombreAplicacion + '\' + FicheroEXE, '.INI');
     // Si no está, lo busco en lugar por defecto segun Windows (%CSIDL_LOCAL_APPDATA%\Merge\)
     if not FileExists(FicheroINI) then
        FicheroINI := ChangeFileExt(GetSpecialFolderPath(CSIDL_LOCAL_APPDATA, False) + '\' + FNombreAplicacion + '\' + FicheroEXE, '.INI');
     if not FileExists(FicheroINI) then
        FicheroINI := ChangeFileExt(FicheroEXE, '.INI');

     oIni := TIniFile.Create(FicheroINI);
     try
        if (oIni.ReadString('Ultimo Acceso', 'Fecha y Hora', '') = '') then
        begin
           CreateDir(GetSpecialFolderPath(CSIDL_LOCAL_APPDATA, False) + '\' + FNombreAplicacion + '\');
           FicheroINI := ChangeFileExt(GetSpecialFolderPath(CSIDL_LOCAL_APPDATA, False) + '\' + FNombreAplicacion + '\' + FicheroEXE, '.INI');
        end;
     finally
        oIni.Free;
     end;
  end;
  InicializaEntorno;
end;

procedure DestruirRegistroEntorno;
begin
  FreeAndNil(REntorno);
end;

procedure InicializaEntorno;
begin
  with REntorno do
  begin
     Entrada := 0;
     Usuario := 0;
     Agente := 0;
     Nombre := _('Desconocido');
     Nivel := 0;
     Ejercicio := 1998;
     FechaTrab := Date;
     Empresa := 0;
     Canal := 0;
     Serie := '';
     SerieDeposito := '';
     Pais := '';
     NivelesCont := 5;
     MaxNivCont := 7;
     MascaraCuentas := 'CCCCCCCCCCCCCCC';
     DigitosSub := 0;
     BaseDeDatos := '';
     // BaseDeDatos := 'c:\Datos\G2K\G2K1.gdb';
     IconosSimples := True;
     Sistema := GetOSInfo;
     IconosCaption := True;
     Version := '1.01a';
     Servidores := 1;
     ClaveBD := 'masterkey';
     DirBackups := DameTempPath;
     ModoCierraForm := 0;
     FamSistema := 'SYS';
     FamDefecto := 'VAR';
     TarifaDefecto := 'NOR';
     ArtTextoLibre := '.';
     DatosAbiertos := True;
     GuardaFiltros := True;
     VerSoloArticulosDisponibles := False;
     Smtp := '';
     Port := 25;
     UserID := '';
     PassWord := '';
     Identificacion := False;
     AutenticacionTLS := False;
     News := '';
     PortNews := 119;
     UserIDNews := '';
     PasswordNews := '';
     IdentNews := False;
     Ofertas := 1;
     Pedidos := 1;
     Albaranes := 1;
     Facturas := 1;
     DispositivoFirma := '';
     LineasAProc := 100;
     AbrirPropuestas := False;
     TarifaDefectoTPV := TarifaDefecto;
     procesos := 0;
     timer_proc := 60;
     FEtiquetas := 0;
     RestriccionDocumento := -1;
     RECC := 0;
     ImagenEmpresa := 0;
     ImagenFondo := -2;
  end;
end;

procedure LeeIni;
var
  oIni : TIniFile;
  Base, Lang : string;
  i : integer;
begin
  oIni := TIniFile.Create(REntorno.FicheroINI);
  try
     with REntorno do
     begin
        BaseDeDatos := oIni.ReadString('Datos', 'BaseDeDatos', BaseDeDatos);
        Ejercicio := oIni.ReadInteger('Datos', 'Ejercicio', Ejercicio);
        Serie := oIni.ReadString('Datos', 'Serie', Serie);
        SerieDeposito := oIni.ReadString('Datos', 'SerieDeposito', SerieDeposito);
        Pais := oIni.ReadString('Datos', 'Pais', Pais);
        {
        DatosAbiertos := oIni.ReadBool('Datos', 'DatosAbiertos', DatosAbiertos);
        GuardaFiltros := oIni.ReadBool('Datos', 'GuardaFiltros', GuardaFiltros);
        }
        Nombre := oIni.ReadString('Usuario', 'Nombre', Nombre);
        TMR_Ventana_Busqueda := oIni.ReadInteger('Usuario', 'TimerBusqueda', 250);
        {
        VerSoloArticulosDisponibles := (1 = oIni.ReadInteger('Datos', 'Disponibilidad', 0));
        }
        Logo := oIni.ReadString('Datos', 'Logo', Logo);
        ReportesReportSmith := IncludeTrailingPathDelimiter(oIni.ReadString('Datos', 'ReportesReportSmith', FDirectorioBase + 'Listados\'));
        RuntimeReportSmith := IncludeTrailingPathDelimiter(oIni.ReadString('Datos', 'RuntimeReportSmith', GetEnvironmentVariable('ProgramFiles') + '\Borland\Rs_Run32\'));

        DirectorioEDI_Entrada := IncludeTrailingPathDelimiter(oIni.ReadString('Datos', 'DirectorioEDI_Entrada', FDirectorioBase + 'EDI\ENTRADA\'));
        DirectorioEDI_Salida := IncludeTrailingPathDelimiter(oIni.ReadString('Datos', 'DirectorioEDI_Salida', FDirectorioBase + 'EDI\SALIDA\'));

        // Software Autoforma
        DirectorioAutofirma := IncludeTrailingPathDelimiter(oIni.ReadString('AutoFirma', 'InstallDir', ''));
        if (Trim(ExcludeTrailingPathDelimiter(DirectorioAutofirma)) = '') then
           try
              DirectorioAutofirma := IncludeTrailingPathDelimiter(win_regRead('SOFTWARE\AutoFirma', 'InstallDir', False));
           except
              DirectorioAutofirma := '';
           end;

        VersionAutofirma := oIni.ReadString('AutoFirma', 'Version', '');
        if (Trim(VersionAutofirma) = '') then
           try
              VersionAutofirma := win_regRead('SOFTWARE\AutoFirma', 'Version', False);
           except
              VersionAutofirma := '';
           end;

        // Software 7Zip
        Directorio7Zip := IncludeTrailingPathDelimiter(oIni.ReadString('7Zip', 'Carpeta', ''));
        if (Trim(ExcludeTrailingPathDelimiter(Directorio7Zip)) = '') then
           try
              Directorio7Zip := IncludeTrailingPathDelimiter(win_regRead('SOFTWARE\7-Zip', 'Path', False));
           except
              Directorio7Zip := '';
           end;

        // Software Curl
        DirectorioCurl := IncludeTrailingPathDelimiter(oIni.ReadString('Curl', 'Carpeta', ''));
        if (Trim(ExcludeTrailingPathDelimiter(DirectorioCurl)) = '') then
           try
              DirectorioCurl := IncludeTrailingPathDelimiter('C:\curl\');
           except
              DirectorioCurl := '';
           end;

        // Software SumatraPDF
        DirectorioSumatraPDF := IncludeTrailingPathDelimiter(oIni.ReadString('SumatraPDF', 'Carpeta', ''));
        if (Trim(ExcludeTrailingPathDelimiter(DirectorioSumatraPDF)) = '') then
           try
              DirectorioSumatraPDF := IncludeTrailingPathDelimiter('C:\SumatraPDF\');
           except
              DirectorioSumatraPDF := '';
           end;

        DirectorioAdjuntos := IncludeTrailingPathDelimiter(oIni.ReadString('Datos', 'DirectorioAdjuntos', FDirectorioBase + 'Adjuntos\'));
        DirectorioComunicaciones := IncludeTrailingPathDelimiter(oIni.ReadString('Datos', 'DirectorioComunicaciones', FDirectorioBase + 'Comunicaciones\'));
        DirectorioLector := IncludeTrailingPathDelimiter(oIni.ReadString('Datos', 'DirectorioLector', FDirectorioBase + 'Lector\'));
        LineasAProc := oIni.ReadInteger('Datos', 'LineasAProc', LineasAProc);
        if (LineasAProc < 1) then
           LineasAProc := 100;

        // Impresoras
        FLaser := oIni.ReadInteger('Impresoras', 'Laser', FLaser);
        FBandejaLaser := oIni.ReadInteger('Impresoras', 'BandejaLaser', FBandejaLaser);
        FEtiquetas := oIni.ReadInteger('Impresoras', 'Etiquetas', FEtiquetas);
        FMatricial := oIni.ReadInteger('Impresoras', 'Matricial', FMatricial);
        FNombreLaser := oIni.ReadString('Impresoras', 'NombreLaser', FNombreLaser);
        FNombreEtiquetas := oIni.ReadString('Impresoras', 'NombreEtiquetas', FNombreEtiquetas);
        FNombreMatricial := oIni.ReadString('Impresoras', 'NombreMatricial', FNombreMatricial);

        // Impresión Documentos
        Ofertas := oIni.ReadInteger('Documentos', 'Ofertas', Ofertas);
        Pedidos := oIni.ReadInteger('Documentos', 'Pedidos', Pedidos);
        albaranes := oIni.ReadInteger('Documentos', 'Albaranes', Albaranes);
        facturas := oIni.ReadInteger('Documentos', 'Facturas', Facturas);
        DispositivoFirma := oIni.ReadString('Documentos', 'DispositivoFirma', DispositivoFirma);

        // News
        News := oIni.ReadString('News', 'News', News);
        PortNews := oIni.ReadInteger('News', 'PortNews', PortNews);
        UserIDNews := oIni.ReadString('News', 'UserIDNews', UserIDNews);
        IdentNews := oIni.ReadBool('News', 'IdentNews', IdentNews);
        PasswordNews := oIni.ReadString('News', 'PasswordNews', PasswordNews);
        RutaLibros := IncludeTrailingPathDelimiter(oIni.ReadString('Datos', 'RutaLibros', FDirectorioBase + 'Libros\') {RutaLibros - dji lrk kri});
        if (Length(RutaLibros) = 0) then
           RutaLibros := DameTempPath;

        // sfg. Albert - leer ini procesos
        Procesos := OIni.ReadInteger('Procesos', 'Procesos', Procesos);
        Timer_proc := OIni.ReadInteger('Procesos', 'Timer', timer_proc);

        DirBackups := IncludeTrailingPathDelimiter(oIni.ReadString('Datos', 'DirBackup', FDirectorioBase + 'Backup\'));
        if (Length(DirBackups) = 0) then
           DirBackups := DameTempPath;

        UsuarioBD := Trim(oIni.ReadString('Datos', 'UsuarioBD', 'DELFOS'));
        RolBD := Trim(oIni.ReadString('Datos', 'RolBD', 'ROL_DELFOS'));
        CharsetBD := Trim(oIni.ReadString('Datos', 'CharsetBD', 'WIN1252'));
        // Obtengo la clave sin codificar. Si no la encuentro, tomo la clave codificada.
        ClaveBD := Trim(oIni.ReadString('Datos', 'ClaveBDSinCodificar', ''));
        if (ClaveBD > '') then
        begin
           oIni.WriteString('Datos', 'ClaveBD', CodificaClave(ClaveBD));
           oIni.WriteString('Datos', 'ClaveBDSinCodificar', '');
        end
        else
        begin
           ClaveBD := DescodificaClave(oIni.ReadString('Datos', 'ClaveBD', ''));
           if (ClaveBD = '') then
              ClaveBD := 'cloud2112';
           oIni.WriteString('Datos', 'ClaveBDSinCodificar', ClaveBD);
        end;

        UsuarioBD_Admin := Trim(oIni.ReadString('Datos', 'UsuarioBD_Admin', 'SYSDBA'));
        oIni.WriteString('Datos', 'UsuarioBD_Admin', UsuarioBD_Admin);
        RolBD_Admin := Trim(oIni.ReadString('Datos', 'RolBD_Admin', ''));
        oIni.WriteString('Datos', 'RolBD_Admin', RolBD_Admin);
        CharsetBD_Admin := Trim(oIni.ReadString('Datos', 'CharsetBD_Admin', 'WIN1252'));
        oIni.WriteString('Datos', 'CharsetBD_Admin', CharsetBD_Admin);
        // Obtengo la clave sin codificar. Si no la encuentro, tomo la clave codificada.
        ClaveBD_Admin := Trim(oIni.ReadString('Datos', 'ClaveBD_AdminSinCodificar', ''));
        if (ClaveBD_Admin > '') then
        begin
           oIni.WriteString('Datos', 'ClaveBD_Admin', CodificaClave(ClaveBD_Admin));
           oIni.WriteString('Datos', 'ClaveBD_AdminSinCodificar', '');
        end
        else
        begin
           ClaveBD_Admin := DescodificaClave(oIni.ReadString('Datos', 'ClaveBD_Admin', ''));
           if (ClaveBD_Admin = '') then
              ClaveBD_Admin := 'masterkey';
           oIni.WriteString('Datos', 'ClaveBD_AdminSinCodificar', ClaveBD_Admin);
        end;

        // Esto se rellenará al conectar la base de datos. Se obtine desde SYS_COSNTANTES
        UsuarioBDAdjuntos := '';
        ClaveBDAdjuntos := '';
        RolBDAdjuntos := '';
        CharsetBDAdjuntos := '';
        RutaFicheros := '';

        OtrasBasesDeDatos.Clear;
        i := 1;
        while (i > 0) do
        begin
           Base := Trim(oIni.ReadString('Datos', Format('BaseDeDatos%d', [i]), ''));
           Inc(i);

           if (Base = '') then
              i := -1
           else
           if (Base <> BaseDeDatos) then
              OtrasBasesDeDatos.Add(Base);
        end;
        Servidores := OtrasBasesDeDatos.Count + 1;

        Lang := oIni.ReadString('Usuario', 'Lang', GetCurrentLanguage);
        UseLanguage(Lang);
        FechaHoraG2k := oIni.ReadBool('Usuario', 'FechaHoraG2k', False);

        MaquinaSincronizacion := oIni.ReadString('TPV-sincronizacion', 'MaquinaSincronizacion', MaquinaSincronizacion);
     end;

     if Assigned(DMMain) then
        if DMMain.FindComponent('HYPrinterOptions') <> nil then
           THYPrinterOptions(DMMain.FindComponent('HYPrinterOptions')).LoadIni(oIni);
  finally
     oIni.Free;
  end;

  if (REntorno.Ejercicio = 0) then
     EscribeIni;

  if REntorno.FechaHoraG2k then
     AjustaFormatoFechaHoraG2k;
end;

procedure EscribeIni;
var
  oIni : TIniFile;
begin
  oIni := TIniFile.Create(REntorno.FicheroINI);
  with REntorno do
  begin
     oIni.WriteString('Datos', 'BaseDeDatos', BaseDeDatos);
     oIni.WriteString('Datos', 'UsuarioBD', UsuarioBD);
     oIni.WriteString('Datos', 'RolBD', RolBD);
     oIni.WriteString('Datos', 'CharsetBD', CharsetBD);
     oIni.WriteInteger('Datos', 'Ejercicio', Ejercicio);
     oIni.WriteInteger('Datos', 'Canal', Canal);
     oIni.WriteString('Datos', 'Serie', Serie);
     oIni.WriteString('Datos', 'Logo', Logo);
     {dji lrk kri}
     oIni.WriteString('Datos', 'SerieDeposito', SerieDeposito);
     oIni.WriteString('Datos', 'DirectorioEDI_Entrada', DirectorioEDI_Entrada);
     oIni.WriteString('Datos', 'DirectorioEDI_Salida', DirectorioEDI_Salida);
     oIni.WriteString('AutoFirma', 'InstallDir', DirectorioAutofirma);
     oIni.WriteString('AutoFirma', 'Version', VersionAutofirma);
     oIni.WriteString('7Zip', 'Carpeta', Directorio7Zip);
     oIni.WriteString('Curl', 'Carpeta', DirectorioCurl);
     oIni.WriteString('SumatraPDF', 'Carpeta', DirectorioSumatraPDF);
     oIni.WriteString('Datos', 'DirectorioAdjuntos', DirectorioAdjuntos);
     oIni.WriteString('Datos', 'ReportesReportSmith', ReportesReportSmith);
     oIni.WriteString('Datos', 'RuntimeReportSmith', RuntimeReportSmith);
     oIni.WriteString('Datos', 'DirectorioComunicaciones', DirectorioComunicaciones);
     oIni.WriteString('Datos', 'DirectorioLector', DirectorioLector);
     if (LineasAProc < 1) then
        LineasAProc := 100;
     oIni.WriteInteger('Datos', 'LineasAProc', LineasAProc);
     {
     oIni.WriteBool('Datos', 'Disponibilidad', VerSoloArticulosDisponibles);
     }
     {
     oIni.WriteBool('Datos', 'GuardaFiltros', GuardaFiltros);
     }
     {
     oIni.WriteBool('Datos', 'DatosAbiertos', DatosAbiertos);
     }
     oIni.WriteString('Datos', 'DirBackup', DirBackups);
     oIni.WriteString('Datos', 'RutaLibros', RutaLibros);

     // Impresión Documentos
     oIni.WriteInteger('Documentos', 'Ofertas', Ofertas);
     oIni.WriteInteger('Documentos', 'Pedidos', Pedidos);
     oIni.WriteInteger('Documentos', 'Albaranes', Albaranes);
     oIni.WriteInteger('Documentos', 'Facturas', Facturas);
     oIni.WriteString('Documentos', 'DispositivoFirma', DispositivoFirma);

     // News
     oIni.WriteString('News', 'News', News);
     oIni.WriteInteger('News', 'PortNews', PortNews);
     oIni.WriteString('News', 'UserIDNews', UserIDNews);
     oIni.WriteBool('News', 'IdentNews', IdentNews);
     oIni.WriteString('News', 'PasswordNews', PasswordNews);

     oIni.WriteInteger('Procesos', 'Procesos', Procesos);
     oIni.WriteInteger('Procesos', 'Timer', timer_proc);

     // Usuario
     oIni.WriteBool('Usuario', 'FechaHoraG2k', FechaHoraG2k);
     oIni.WriteString('Usuario', 'Nombre', Nombre);

     // Ultimo Acceso
     oIni.WriteString('Ultimo Acceso', 'Fecha y Hora', DateTimeToStr(Now));

     // Idioma aplicacion
     oIni.WriteString('Usuario', 'Lang', GetCurrentLanguage);
  end;

  oIni.Free;
end;

function CodificaClave(clave: string): string;
var
  s : string;
  i : integer;

  function Codifica(clave: string): string;
  var
     cont, longitud : integer;
     clave1, clave2 : int64;
  begin
     longitud := Length(clave);
     clave1 := 0;
     clave2 := 0;
     if longitud > 4 then
        longitud := 4;
     for cont := 1 to longitud do
     begin
        clave1 := clave1 + integer(clave[cont]) * Trunc(IntPower(256, cont - 1));
     end;
     longitud := Length(clave);
     for cont := 5 to longitud do
     begin
        clave2 := clave2 + integer(clave[cont]) * Trunc(IntPower(256, cont - 5));
     end;
     Result := IntToStr(clave1) + ',' + IntToStr(clave2);
  end;

begin
  /// Recorro Clave dividiendo de a 8 caracteres y codifico cada parte.
  /// El resultado es las codificaciones separadas por ;
  /// Ejemplo: CodificaClave('abcdef123456') = '1684234849,842098277;909456435,0'

  Result := '';
  i := 1;
  while (i <= Length(Clave)) do
  begin
     s := Copy(Clave, i, 8);
     if (s > '') then
     begin
        if (i > 1) then
           Result := Result + ';';
        Result := Result + Codifica(s);
     end;
     Inc(i, 8);
  end;
end;

function DescodificaClave(clave: string): string;
var
  s : string;

  function Descodifica(clave: string): string;
  var
     posicion, cont : integer;
     clave1, clave2 : int64;
     resultado : array[0..11] of char;
  begin
     Result := '';
     if (clave <> '') then
     begin
        posicion := Pos(',', clave);
        clave1 := StrToInt64Def(Copy(clave, 1, posicion - 1), 0);
        clave2 := StrToInt64Def(Copy(clave, posicion + 1, Length(clave)), 0);
        for cont := 0 to 3 do
        begin
           resultado[cont] := char(clave1 mod 256);
           clave1 := clave1 div 256;
        end;
        for cont := 4 to 11 do
        begin
           resultado[cont] := char(clave2 mod 256);
           clave2 := clave2 div 256;
        end;
        if resultado <> '' then
           Result := resultado;
     end;
  end;

begin
  /// Recorro Clave codificada obteniendo cada parte separada por ;
  /// Se decodifica cada parte y concatena para obtener la clave original
  /// Ejemplo: CodificaClave('1684234849,842098277;909456435,0') = 'abcdef123456'

  Result := '';
  s := Clave;

  while (Pos(';', s) > 0) do
  begin
     Result := Result + Descodifica(Copy(s, 1, Pos(';', s) - 1));
     s := Copy(s, Pos(';', s) + 1, Length(s));
  end;

  if (Pos(';', s) = 0) then
     Result := Result + Descodifica(s);
end;

function EstructuraCreada: boolean;
begin
  if REntorno.NivelesCont <= 4 then
  begin
     ShowMessage(_('La estructura contable no ha sido creada en el canal actual.'));  //IDIOMA_CODE
     Result := False;
  end
  else
     Result := True;
end;

procedure AjustaFormatoFechaHoraG2k;
begin
  // Variables de Entorno Windows
  ThousandSeparator := '.';
  DecimalSeparator := ',';
  CurrencyDecimals := 2;
  DateSeparator := '/';
  ShortDateFormat := 'dd/mm/yyyy';
  LongDateFormat := '"Hoy es" dddd d "de" mmmm "de" yyyy';
  TimeSeparator := ':';
  ShortTimeFormat := 'HH:mm';
  LongTimeFormat := 'HH:mm:ss';
end;

procedure TREntorno.SetEtiquetas(const Value: integer);
begin
  FEtiquetas := Value;
  EscribeDatoIni('Impresoras', 'Etiquetas', Value);
end;

procedure TREntorno.SetLaser(const Value: integer);
begin
  FLaser := Value;
  EscribeDatoIni('Impresoras', 'Laser', Value);
end;

procedure TREntorno.SetBandejaLaser(const Value: integer);
begin
  FBandejaLaser := Value;
  EscribeDatoIni('Impresoras', 'BandejaLaser', Value);
end;

procedure TREntorno.SetMatricial(const Value: integer);
begin
  FMatricial := Value;
  EscribeDatoIni('Impresoras', 'Matricial', Value);
end;

procedure TREntorno.SetNombreEtiquetas(const Value: string);
begin
  FNombreEtiquetas := Value;
  EscribeDatoIni('Impresoras', 'NombreEtiquetas', Value);
end;

procedure TREntorno.SetNombreEtiquetasCompleto(const Value: string);
begin
  FNombreEtiquetasCompleto := Value;
  EscribeDatoIni('Impresoras', 'NombreEtiquetasCompleto', Value);
end;

procedure TREntorno.SetNombreLaser(const Value: string);
begin
  FNombreLaser := Value;
  EscribeDatoIni('Impresoras', 'NombreLaser', Value);
end;

procedure TREntorno.SetNombreMatricial(const Value: string);
begin
  FNombreMatricial := Value;
  EscribeDatoIni('Impresoras', 'NombreMatricial', Value);
end;

end.
