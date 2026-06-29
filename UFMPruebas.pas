unit UFMPruebas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, Grids, DBGrids, NsDBGrid, UHYDBGrid, ComCtrls,
  ULFPageControl, ExtCtrls, UNavigator, ToolWin, ULFToolBar, StdCtrls, URecursos,
  ULFEdit, ULFLabel, Rio, SOAPHTTPClient, ULFPanel, ULFMemo,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, Buttons, Mask, rxToolEdit,
  ULFDateEdit, DBCtrls, ULFDBMemo, ULFDBEdit, UFIBDBEditfind,
  UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, UEditPanel, UFPEditSimple, XMLDoc, XMLIntf;

type
  TFMPruebas = class(TFPEditSimple)
     PCMain: TLFPageControl;
     TSFicha: TTabSheet;
     TSTabla: TTabSheet;
     DBGMain: THYTDBGrid;
     MDebug: TLFMemo;
     TSReturning: TTabSheet;
     BPruebaReturning: TButton;
     Label1: TLFLabel;
     Memo1: TLFMemo;
     BReadFile: TButton;
     TSFormato: TTabSheet;
     PNLEjecutarDentroAplicacion: TLFPanel;
     BEjecutarNotepad: TButton;
     TSVersion: TTabSheet;
     BDameVersion: TButton;
     EDirectorioABorrar: TLFEdit;
     BBorrarDirectorio: TButton;
     TSDescargarImagen: TTabSheet;
     EURLImagen: TLFEdit;
     BDescargarImagen: TButton;
     TSEmail: TTabSheet;
     BEnviarFacturaA1: TButton;
     TSExcel: TTabSheet;
     BPruebaExportacionExcel: TButton;
     TSProduccion: TTabSheet;
     Timer: TTimer;
     BVerTablasAbiertas: TButton;
     LCerrarAbrirOrdenesLONPER: TLFLabel;
     EDesdeIdOrden: TLFEdit;
     EHastaIdOrden: TLFEdit;
     LDesdeIdOrden: TLFLabel;
     LHastaIdOrden: TLFLabel;
     BEmpezarAbrirCerrarOrdenes: TButton;
     BPruebaFormato: TButton;
     BtNRecalcularCodLote: TButton;
     BPruebaVelocidadQueryUnidireccional: TButton;
     BSep1: TToolButton;
     BBorrarMemo: TToolButton;
     BPruebaImportacionExcel: TButton;
     TSSII: TTabSheet;
     BUtilizarMSXML2: TButton;
     HTTPRIO1: THTTPRIO;
     BPruebaSIIFacturasEmitidas: TButton;
     ECertName: TLFEdit;
     EArchivoXML: TLFEdit;
     BArticuloNuevo: TButton;
     PruebaMensaje: TButton;
     TButtDaysBetween: TButton;
     Button1: TButton;
     Imagen: TImage;
     RGPrueba: TRadioGroup;
     BPruebaRG: TButton;
     BRegistry: TButton;
     IdFTP: TIdFTP;
     BDescargar: TButton;
     LProcesoDescarga: TLabel;
     PBDescargaFTP: TProgressBar;
     TSStringGrid: TTabSheet;
     sgPrueba: TStringGrid;
     dtpPrueba: TDateTimePicker;
     EDirecciones: TEdit;
     BDividirString: TButton;
     Button2: TButton;
     BVerificaIBAN: TButton;
     Button3: TButton;
     TSFacturaElectronicaBO: TTabSheet;
     QRCode: TImage;
     LNumeroFactura: TLabel;
     LFechaTransaccion: TLabel;
     LLlaveDosificacion: TLabel;
     LMontoTransaccion: TLabel;
     LNIT: TLabel;
     LNumeroAutorizacion: TLabel;
     ELlaveDosificacion: TEdit;
     EMontoTransaccion: TEdit;
     ENIT: TEdit;
     ENumeroAutorizacion: TEdit;
     ENumeroFactura: TEdit;
     BCalcularCodigoControlSFV: TButton;
     DTPFechaTransaccion: TDateTimePicker;
     BEjemplo1: TButton;
     BEjemplo2: TButton;
     BEjemplo3: TButton;
     BEjemplo4: TButton;
     BEjemplo5: TButton;
     BEjemplo6: TButton;
     BEjemplo7: TButton;
     LCodigoEsperado: TLabel;
     ECodigoEsperado: TEdit;
     ELectura: TEdit;
     LLector: TLabel;
     BNumeroALetra: TButton;
     TSWeb: TTabSheet;
     BLeerCSV: TButton;
     EURLCSV: TLFEdit;
     LCliente: TLFLabel;
     ECliente: TLFEdit;
     EMaquina: TLFEdit;
     LMaquina: TLFLabel;
     DEDesdeFecha: TLFDateEdit;
     DEHastaFecha: TLFDateEdit;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     LURLCSV: TLFLabel;
     TSNotas: TTabSheet;
     NavPruebaNotas: THYMNavigator;
     DBEArticulo: TLFDbedit;
     DBMArticuloNotas: TLFDBMemo;
     BPasteClipboard: TButton;
     BPruebaExportacionCSVSQL: TButton;
     BPruebaExportacionCSVDataSource: TButton;
     TSOrden: TTabSheet;
     NavOrden: THYMNavigator;
     FIBHYGGridFind1: TFIBHYGGridFind;
     TSSubirArchivo: TTabSheet;
     BSubirArchivo: TButton;
     EURLEvnioFichero: TLFEdit;
     EFicheroSubir: TLFEdit;
     TSPrestasop: TTabSheet;
     LPSToken: TLFLabel;
     LPSResource: TLFLabel;
     LFLabel3: TLFLabel;
     LFLabel4: TLFLabel;
     LPSURLBase: TLFLabel;
     EPSURLBase: TLFEdit;
     EPSToken: TLFEdit;
     EPSResource: TComboBox;
     LFDateEdit1: TLFDateEdit;
     LFDateEdit2: TLFDateEdit;
     LLlamadaWebService: TLFLabel;
     ELlamadaWebService: TEdit;
     BPSSynopsis: TButton;
     BPS_Blank: TButton;
     BPSCrear: TButton;
     Elastname: TEdit;
     Efirstname: TEdit;
     eemail: TEdit;
     LPSId: TLFLabel;
     EPSId: TLFEdit;
     BModificar: TButton;
     BBorrar: TButton;
     BLista: TButton;
     LPSOpciones: TLFLabel;
     EPSOpciones: TLFEdit;
     LPSOpcionesInfo: TLabel;
     BWSInicializar: TButton;
     TSSafemoney: TTabSheet;
     LFLabel1: TLFLabel;
     EImporteACobrar: TLFEdit;
     tmrSafemoney: TTimer;
     BCobrar: TButton;
     BInicializar: TButton;
     BCancelarCobro: TButton;
     mSafemoney: TMemo;
     BTimerCobro: TButton;
     PNLStringGrid: TPanel;
     EFicheroExcelStringgrid: TEdit;
     BLeerExcelStringGrid: TButton;
     BSeleccionFicheroExcelStringgrid: TButton;
     TSNet2Phone: TTabSheet;
     BClick2Call: TButton;
     EToken: TEdit;
     ETelefono: TEdit;
     EExtension: TEdit;
     LNet2PhoneToken: TLabel;
     LNet2PhoneExtension: TLabel;
     LNet2PhoneTelefono: TLabel;
     TSJSON: TTabSheet;
     MJSON: TLFMemo;
     ENodoJSONPadre: TLFEdit;
     ENodoJSONHijo: TLFEdit;
     LNodoJSONPadre: TLFLabel;
     LNodoJSONHijo: TLFLabel;
     BJSONObtenerHijos: TButton;
     BJSONObtenerValorHijo: TButton;
     TSTBAI: TTabSheet;
     ETBAI: TEdit;
     BCRC8: TButton;
     rgRegistro: TRadioGroup;
     ERutaRegistro: TEdit;
     EClaveRegistro: TEdit;
     BGetRegistro: TButton;
     TSXML: TTabSheet;
     MXML: TLFMemo;
     LXMLNodoPadre: TLFLabel;
     EXMLNodo1: TLFEdit;
     BXMLObtenerHijos: TButton;
     EXMLFichero: TLFEdit;
     BXMLCargarArchivo: TButton;
     BXMLObtenerHijosNodoPadre: TButton;
     EXMLNodo2: TLFEdit;
     BComprimirGZip: TButton;
     BFormularioImportacion: TButton;
     TSInsercionMasiva: TTabSheet;
     BInsMasiva: TButton;
     EBase64: TEdit;
     BBase64: TButton;
     BScreens: TButton;
     BFileExists: TButton;
     EDirFileExists: TEdit;
     BHexToColor: TButton;
     EHexToColor: TLFEdit;
     LEHexToColor: TLabel;
     LHex1: TLabel;
     LHex2: TLabel;
     LHex3: TLabel;
     LHex4: TLabel;
     LHex5: TLabel;
     LHex6: TLabel;
     LHex7: TLabel;
     LHex8: TLabel;
     LHex9: TLabel;
     TSGLS: TTabSheet;
     TabSheet1: TTabSheet;
     LFLabel2: TLFLabel;
     EGLSURLWebService: TLFEdit;
     LFLabel5: TLFLabel;
     EGLSGUID: TLFEdit;
     CBGLSResource: TComboBox;
     LFLabel6: TLFLabel;
     MGLSContenido: TMemo;
     PNLGLS: TLFPanel;
     LGLSContenido: TLFLabel;
     BGLSPost: TButton;
     MLogSkrit: TMemo;
     PNLSkrit: TLFPanel;
     LFLabel7: TLFLabel;
     LFLabel8: TLFLabel;
     LFLabel9: TLFLabel;
     LFLabel10: TLFLabel;
     ESkritURLBase: TLFEdit;
     ESkritToken: TLFEdit;
     CBSkritResource: TComboBox;
     BSkirPostId: TButton;
     LSkritAssociate: TLFLabel;
     ESkritAssociate: TLFEdit;
     ESkritClient: TLFEdit;
     LSkritClient: TLFLabel;
     LSkritOpciones: TLFLabel;
     EskritOpciones: TLFEdit;
     LSkritId: TLFLabel;
     ESkritId: TLFEdit;
     BSkritPostOpciones: TButton;
     Button4: TButton;
     Edit1: TEdit;
     procedure FormCreate(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BPruebaReturningClick(Sender: TObject);
     procedure BReadFileClick(Sender: TObject);
     procedure BEjecutarNotepadClick(Sender: TObject);
     procedure PNLEjecutarNotepadResize(Sender: TObject);
     procedure BDameVersionClick(Sender: TObject);
     procedure BBorrarDirectorioClick(Sender: TObject);
     procedure BDescargarImagenClick(Sender: TObject);
     procedure BEnviarFacturaA1Click(Sender: TObject);
     procedure BPruebaExportacionExcelClick(Sender: TObject);
     procedure BVerTablasAbiertasClick(Sender: TObject);
     procedure TimerTimer(Sender: TObject);
     procedure BEmpezarAbrirCerrarOrdenesClick(Sender: TObject);
     procedure BPruebaFormatoClick(Sender: TObject);
     procedure BtNRecalcularCodLoteClick(Sender: TObject);
     procedure BPruebaVelocidadQueryUnidireccionalClick(Sender: TObject);
     procedure BBorrarMemoClick(Sender: TObject);
     procedure BPruebaImportacionExcelClick(Sender: TObject);
     procedure BUtilizarMSXML2Click(Sender: TObject);
     procedure BPruebaSIIFacturasEmitidasClick(Sender: TObject);
     procedure BArticuloNuevoClick(Sender: TObject);
     procedure PruebaMensajeClick(Sender: TObject);
     procedure TButtDaysBetweenClick(Sender: TObject);
     procedure Button1Click(Sender: TObject);
     procedure BPruebaRGClick(Sender: TObject);
     procedure RGPruebaClick(Sender: TObject);
     procedure BRegistryClick(Sender: TObject);
     procedure BDescargarClick(Sender: TObject);
     procedure IdFTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: int64);
     procedure IdFTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
     procedure IdFTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: int64);
     procedure TSStringGridShow(Sender: TObject);
     procedure sgPruebaSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
     procedure dtpPruebaChange(Sender: TObject);
     procedure BDividirStringClick(Sender: TObject);
     procedure Button2Click(Sender: TObject);
     procedure BVerificaIBANClick(Sender: TObject);
     procedure Button3Click(Sender: TObject);
     procedure BCalcularCodigoControlSFVClick(Sender: TObject);
     procedure BEjemplo1Click(Sender: TObject);
     procedure BEjemplo2Click(Sender: TObject);
     procedure BEjemplo3Click(Sender: TObject);
     procedure BEjemplo4Click(Sender: TObject);
     procedure BEjemplo5Click(Sender: TObject);
     procedure BEjemplo6Click(Sender: TObject);
     procedure BEjemplo7Click(Sender: TObject);
     procedure ELecturaKeyPress(Sender: TObject; var Key: char);
     procedure BNumeroALetraClick(Sender: TObject);
     procedure BLeerCSVClick(Sender: TObject);
     procedure TSNotasShow(Sender: TObject);
     procedure BPasteClipboardClick(Sender: TObject);
     procedure BPruebaExportacionCSVSQLClick(Sender: TObject);
     procedure BPruebaExportacionCSVDataSourceClick(Sender: TObject);
     procedure TSOrdenShow(Sender: TObject);
     procedure BSubirArchivoClick(Sender: TObject);
     procedure EPSURLBaseChange(Sender: TObject);
     procedure TSPrestasopShow(Sender: TObject);
     procedure BPSSynopsisClick(Sender: TObject);
     procedure BPS_BlankClick(Sender: TObject);
     procedure BPSCrearClick(Sender: TObject);
     procedure BModificarClick(Sender: TObject);
     procedure BBorrarClick(Sender: TObject);
     procedure BListaClick(Sender: TObject);
     procedure BWSInicializarClick(Sender: TObject);
     procedure tmrSafemoneyTimer(Sender: TObject);
     procedure BCobrarClick(Sender: TObject);
     procedure BInicializarClick(Sender: TObject);
     procedure BCancelarCobroClick(Sender: TObject);
     procedure BTimerCobroClick(Sender: TObject);
     procedure BSeleccionFicheroExcelStringgridClick(Sender: TObject);
     procedure BLeerExcelStringGridClick(Sender: TObject);
     procedure BClick2CallClick(Sender: TObject);
     procedure BJSONObtenerHijosClick(Sender: TObject);
     procedure BJSONObtenerValorHijoClick(Sender: TObject);
     procedure BCRC8Click(Sender: TObject);
     procedure BGetRegistroClick(Sender: TObject);
     procedure BXMLObtenerHijosClick(Sender: TObject);
     procedure BXMLCargarArchivoClick(Sender: TObject);
     procedure BXMLObtenerHijosNodoPadreClick(Sender: TObject);
     procedure BComprimirGZipClick(Sender: TObject);
     procedure BFormularioImportacionClick(Sender: TObject);
     procedure BInsMasivaClick(Sender: TObject);
     procedure BBase64Click(Sender: TObject);
     procedure BScreensClick(Sender: TObject);
     procedure BFileExistsClick(Sender: TObject);
     procedure BHexToColorClick(Sender: TObject);
     procedure TSDescargarImagenShow(Sender: TObject);
     procedure BGLSPostClick(Sender: TObject);
     procedure BSkirPostIdClick(Sender: TObject);
     procedure Button4Click(Sender: TObject);
  private
     { Private declarations }
     ColumnaSeleccionada: integer;
     FilaSeleccionada: integer;
     ContadorLog: integer;
     InicioLog: array[1..20] of TDateTime;
     fNotepadHandle: HWND;
     Documento: TXMLDocument;
  public
     { Public declarations }
     procedure Log(s: string);
     procedure LogIni(s: string);
     procedure LogFin(s: string);
  end;

var
  FMPruebas : TFMPruebas;

implementation

uses UDMPruebas, UEntorno, ShellApi, UFMFacturas, UHojaCalc, UUtiles, UProDMOrden,
  UFMain, UProFMOrden, HYFIBQuery, UDMMain,
  ComObj {CreateOleObject}, Math, UDMSII, UFMSincronizacionTiendArticuloNuevo, DateUtils, Registry, IdFTPCommon,
  Mapi, UFacturaElectronicaBO, ALetras, IdHttp, WinInet, Clipbrd, IdSocks, UDMPrestashop, UDMSafemoney,
  UDMNet2Phone, UlkJSON, UFPImportaciones{ Componentes ,DB, IB, IBCustomDataSet, IBQuery, IBDatabase},
  UDMGLS, UDMSkrit;

{$R *.dfm}

procedure TFMPruebas.FormCreate(Sender: TObject);
begin
  inherited;

  Log('AbreData');
  AbreData(TDMPruebas, DMPruebas);

  Log('DMSafemoney');
  AbreData(TDMSafemoney, DMSafemoney);

  Log('CambiaSerie');
  DMPruebas.CambiaSerie(REntorno.Serie);

  Log('NavMAin.DataSource');
  NavMain.DataSource := DMPruebas.DSCabecera;
  Log('DBGMain.DataSource');
  DBGMain.DataSource := DMPruebas.DSCabecera;

  DEDesdeFecha.Date := Today;
  DEHastaFecha.Date := Today;

  // XML para pruebas Prestashop
  Documento := TXMLDocument.Create(Self);

  AbreData(TDMPrestashop, DMPrestashop);
end;

procedure TFMPruebas.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  Log('NavMainClickAfterAdjust');
end;

procedure TFMPruebas.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  Log('NavMainClick');
end;

procedure TFMPruebas.Log(s: string);
var
  F : TextFile;
  FileName : string;
begin
  if (Pos(#13, s) > 0) then
     s := #13#10 + s;

  MDebug.Lines.Add(FormatDatetime('[yyyy-mm-dd hh:nn:ss.zzz] ', Now) + s);

  FileName := ChangeFileExt(Application.ExeName, '_Prueba.log');
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

procedure TFMPruebas.LogIni(s: string);
var
  espacio : string;
  i : integer;
begin
  Inc(ContadorLog);
  espacio := '';
  for i := 2 to ContadorLog do
     espacio := espacio + '   ';
  InicioLog[ContadorLog] := Now;
  Log('I - ' + espacio + s);
end;

procedure TFMPruebas.LogFin(s: string);
var
  espacio : string;
  i : integer;
begin
  espacio := '';
  for i := 2 to ContadorLog do
     espacio := espacio + '   ';
  Log('F - ' + espacio + FormatDatetime('[nn:ss.zzz]', Now - InicioLog[ContadorLog]) + ' - ' + s);
  Dec(ContadorLog);
end;

procedure TFMPruebas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Log('CierraData');
  CierraData(DMSafemoney);
  CierraData(DMPrestashop);
  CierraData(DMPruebas);
  Action := caFree;
end;

procedure TFMPruebas.BPruebaReturningClick(Sender: TObject);
begin
  LogIni('Prueba Returning');
  DMPruebas.PruebaReturning;
  LogFin('Prueba Returning');
end;

procedure TFMPruebas.BReadFileClick(Sender: TObject);

  function read_file(archivo: string): ansistring;
  var
     F : file;
     contenido : ansistring;
     limite : integer;
     leyendo : integer;
     tipo : byte;
  begin
     Result := '';
     tipo := FileMode;
     FileMode := 0;
     AssignFile(F, archivo);
     Reset(F, 1);
     if (IOResult = 0) then
     begin
        limite := {Filelimite(F)}1500;
        while (limite > 1024) do
        begin
           SetLength(contenido, 1024);
           BlockRead(F, contenido[1], 1024, leyendo);
           Result := Result + contenido;
           Dec(limite, leyendo);
        end;
        SetLength(contenido, limite);
        BlockRead(F, contenido[1], limite);
        Result := Result + contenido;
        CloseFile(F);
     end;
     FileMode := tipo;
  end;

begin
  MDebug.Text := read_file('mergeDEV\G2k2Plus.todo');
end;

procedure TFMPruebas.BEjecutarNotepadClick(Sender: TObject);
var
  Rec : TShellExecuteInfo;
  Panel : TLFPanel;
const
  AVerb = 'open';
  AParams = '';
  AFileName = 'Notepad.exe';
  ADir = '';
begin
  // Crear panel en forma dinamica
  Panel := TLFPanel.Create(Self);
  with Panel do
  begin
     // Debe estar sobre el Tabsheet
     Parent := TSFormato;
     // Alineado al total del espacio disponible
     Align := alClient;
     // Cuando cambie de tamaño debe ejecutar esto para ajustar el tamaño del programa ejecutado dentro
     OnResize := PNLEjecutarNotepadResize;
  end;

  FillChar(Rec, SizeOf(Rec), #0);

  Rec.cbSize := SizeOf(Rec);
  Rec.fMask := SEE_MASK_NOCLOSEPROCESS;
  Rec.lpVerb := PChar(AVerb);
  Rec.lpFile := PChar(AfileName);
  Rec.lpParameters := PChar(AParams);
  Rec.lpDirectory := PChar(Adir);
  Rec.nShow := SW_HIDE;

  ShellExecuteEx(@Rec);
  WaitForInputIdle(Rec.hProcess, 5000);

  fNotepadHandle := Windows.FindWindow('Notepad', nil);
  Windows.SetParent(fNotepadHandle, Panel.Handle);

  // Put the focus on notepad
  Windows.SetFocus(fNotepadHandle);

  Resize;
  ShowWindow(fNotepadHandle, SW_SHOW);
end;

procedure TFMPruebas.PNLEjecutarNotepadResize(Sender: TObject);
begin
  if IsWindow(fNotepadHandle) then
  begin
     SetWindowPos(fNotepadHandle, 0, 0, 0, TPanel(Sender).ClientWidth, TPanel(Sender).ClientHeight,
        SWP_ASYNCWINDOWPOS);
  end;
end;

procedure TFMPruebas.BDameVersionClick(Sender: TObject);

  function GetFileVersion(const FileName: string): string;
  type
     TVersion = record
        major: DWORD;
        minor: DWORD;
        Release: DWORD;
        build: DWORD;
     end;

  var
     InfoSize, Handle : longword;
     Buffer : array of byte;
     FileInfo : PVSFixedFileInfo;

  begin
     try
        InfoSize := GetFileVersionInfoSize(PChar(FileName), Handle);
        SetLength(Buffer, InfoSize);
        GetFileVersionInfo(PChar(FileName), Handle, InfoSize, Buffer);
        VerQueryValue(Buffer, '\', Pointer(FileInfo), InfoSize);

        Result := Format('%d.%d.%d.%d', [LongRec(FileInfo.dwFileVersionMS).Hi,
           LongRec(FileInfo.dwFileVersionMS).Lo,
           LongRec(FileInfo.dwFileVersionLS).Hi,
           LongRec(FileInfo.dwFileVersionLS).Lo]);
     except
        Result := '0.0.0.0';
     end;
  end;

var
  FileName : string;
  MsgUsr, MsgApp : string;
begin
  FileName := Application.ExeName;
  MsgApp := 'GetFileVersion';
  MsgUsr := Format('%s v%s', [ExtractFileName(FileName), GetFileVersion(FileName)]);
  MessageBox(Handle, PChar(MsgUsr), PChar(MsgApp), MB_OK + MB_ICONINFORMATION);
end;

procedure TFMPruebas.BBorrarDirectorioClick(Sender: TObject);

  function RemoveFolder(const Folder: string): boolean;
  var
     szFile : string;
     SearchRec : TSearchRec;
     szSearchPath : string;
     nResult : integer;
     Attributes : longword;
  begin
     szSearchPath := Folder;

     // Busco el primer archivo dentro de esa carpeta
     nResult := FindFirst(szSearchPath + '\*.*', faAnyFile, SearchRec);
     try
        // Mientras haya archivos...
        while nResult = 0 do
        begin
           // Si el archivo no es uno "especial"
           if not ((SearchRec.Name = '.') or (SearchRec.Name = '..')) then
           begin
              // Obtengo el nombra
              szFile := szSearchPath + '\' + SearchRec.Name;

              // Si es un directorio llamo recursivamente a la funcion
              if ((SearchRec.Attr and faDirectory) = faDirectory) then
                 RemoveFolder(szFile)
              else
              begin
                 // Si es un archivo lo borro
                 FileSetAttr(szFile, 0);
                 DeleteFile(PAnsiChar(szFile));
              end;
           end;

           // Busco el siguiente archivo
           nResult := FindNext(SearchRec);
        end;

        // He recorido directorio y subdirectorio correctamente borrandolos
        Result := True;
     finally
        SysUtils.FindClose(SearchRec);
     end;

     // Obtengo atributos de la carpeta
     Attributes := GetFileAttributes(PChar(Folder));

     if (Attributes = $FFFFFFFF) then
        raise EInOutError.Create(SysErrorMessage(GetLastError));

     if (Attributes and FILE_ATTRIBUTE_READONLY) <> 0 then
        SetFileAttributes(PChar(Folder), Attributes and not FILE_ATTRIBUTE_READONLY);

     // Borro la carpeta
     if Windows.RemoveDirectory(PChar(Folder)) = False then
        raise EInOutError.Create(SysErrorMessage(GetLastError));
  end;

begin
  RemoveFolder(EDirectorioABorrar.Text);
end;

procedure TFMPruebas.BDescargarImagenClick(Sender: TObject);
begin
  DMPruebas.DescargarImagen(EURLImagen.Text);
end;

procedure TFMPruebas.BEnviarFacturaA1Click(Sender: TObject);
begin
  FMFacturas.AEnviarFacturaMailPdfExecute(Sender);
end;

procedure TFMPruebas.BPruebaExportacionExcelClick(Sender: TObject);
var
  HCalc : THojaCalc;
  c, f : integer;
  Archivo : string;
begin
  MDebug.Lines.Clear;
  Application.ProcessMessages;

  Archivo := Format('Prueba_%s.xls', [FormatDateTime('yyyymmdd-hhnnss', Now)]);
  if MySaveDialog(Archivo, 'XLS') then
  begin
     Log('I PruebaExportacionExcel');
     Application.ProcessMessages;

     //Create object: We have two flavours:
     //(A) from an existing file...
     // HCalc:= THojaCalc.create(OpenDialog.FileName, false);
     //(B) from a blank document...
     Log('I create Excel');
     Application.ProcessMessages;
     HCalc := THojaCalc.Create(thcOpenOffice, True); //OpenOffice doc if possible, please
     try
        Log('F create Excel');
        Application.ProcessMessages;

        Log('HCalc.FileName = ' + Archivo);
        Application.ProcessMessages;
        HCalc.FileName := Archivo; //Needs a file name before you SaveDoc!
        //--end of creation.

     {
     Log('HCalc.ActivateSheetByIndex(2)');
     Application.ProcessMessages;
     HCalc.ActivateSheetByIndex(2); //Activate second sheet
     if HCalc.IsActiveSheetProtected then
         ShowMessage('2nd sheet of name "'+HCalc.ActiveSheetName+'" IS protected');
     }

        // Change a cell value.
        Log('HCalc.CellText[f,c] := ...');
        Application.ProcessMessages;
        for c := 1 to 2 do
           for f := 1 to 10 do
              if HCalc.CellText[f, c] = '' then
                 HCalc.CellText[f, c] := 'F' + IntToStr(f) + ' C' + IntToStr(c);

        c := 3;
        for f := 1 to 10 do
        begin
           HCalc.SendNumber(f, c, f / c);
           HCalc.SendNumber(f, c + 1, (f * 1234567));
        end;

        c := 5;
        for f := 1 to 10 do
        begin
           HCalc.CellFormula[f, c] := Format('=SUM(C%d:D%d)', [f, f]);
        end;

        for c := 3 to 5 do
        begin
           HCalc.ColNumberFormat(c, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
        end;

        Log('HCalc.AddNewSheet()');
        Application.ProcessMessages;
        HCalc.AddNewSheet('New Sheet');

        // Log('HCalc.PrintDoc');
        // HCalc.PrintDoc;

        Log('HCalc.SaveDoc');
        Application.ProcessMessages;
        // HCalc.SaveDoc;
        HCalc.SaveDocAs(Archivo, True);
     finally
        Sleep(1000);
        Log('I Liberar Excel');
        Application.ProcessMessages;
        HCalc.Free;
     end;

     Log('F PruebaExportacionExcel');
     Application.ProcessMessages;
  end;
end;

procedure TFMPruebas.BVerTablasAbiertasClick(Sender: TObject);
begin
  Timer.Enabled := not Timer.Enabled;
end;

procedure TFMPruebas.TimerTimer(Sender: TObject);
begin
  MDebug.Clear;
  DMPruebas.DameTablasAbiertasProDMOrden;
end;

procedure TFMPruebas.BEmpezarAbrirCerrarOrdenesClick(Sender: TObject);
var
  Desde, Hasta, IdOrden, SituacionOriginal : integer;
  Q : THYFIBQuery;
begin
  // SituacionOriginal := 0;
  Desde := StrToInt(EDesdeIdOrden.Text);
  Hasta := StrToInt(EHastaIdOrden.Text);

  FMain.EjecutaAccion(FMain.AProOrden);

  // Filtro para que aparezcan todas las ordenes.
  ProFMOrden.AFiltrarSituacionTodo.Execute;

  with ProDMOrden.QMProOrd do
  begin
     // Me posiciono en la primera orden
     ProDMOrden.PosicionaIdOrden(Desde);

     // Recorro las ordenes
     while not EOF do
     begin
        IdOrden := FieldByName('ID_ORDEN').AsInteger;

        if ((IdOrden >= Desde) and (IdOrden <= Hasta)) then
        begin
           LogIni('IdOrden: ' + IntToStr(IdOrden));
           LogIni('Retroceder situacion hasta Lanzada');
           // Retroceder situacion hasta Lanzada
           Q := THYFIBQuery.Create(nil);
           try
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT SITUACION FROM PRO_REGENERA_OFS(:ID_ORDEN, :MODO, :SITUACION_FINAL)';
                 Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
                 Params.ByName['MODO'].AsInteger := 1;
                 Params.ByName['SITUACION_FINAL'].AsInteger := 1;
                 ExecQuery;
                 SituacionOriginal := FieldByName['SITUACION'].AsInteger;
                 FreeHandle;
              end;
           finally
              FreeAndNil(Q);
           end;

           Log('Situacion Original: ' + IntToStr(SituacionOriginal));
           LogFin('Retroceder situacion hasta Lanzada');

           // Calcular formualas
           LogIni('Calcula Formulas');

           ProDMOrden.CalculaFormulas(IdOrden);
           LogFin('Calcula Formulas');

           // Avanzar situacion hasta donde estaba
           LogIni('Avanzar situacion hasta donde estaba');
           Q := THYFIBQuery.Create(nil);
           try
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT SITUACION FROM PRO_REGENERA_OFS(:ID_ORDEN, :MODO, :SITUACION_FINAL)';
                 Params.ByName['ID_ORDEN'].AsInteger := IdOrden;
                 Params.ByName['MODO'].AsInteger := 2;
                 Params.ByName['SITUACION_FINAL'].AsInteger := SituacionOriginal;
                 ExecQuery;
                 // SituacionOriginal := FieldByName['SITUACION'].AsInteger;
                 FreeHandle;
              end;
           finally
              FreeAndNil(Q);
           end;
           LogFin('Avanzar situacion hasta donde estaba');

           LogFin('IdOrden: ' + IntToStr(IdOrden));
        end;

        Next;
     end;
  end;
end;

procedure TFMPruebas.BPruebaFormatoClick(Sender: TObject);
begin
  Log('Format (''%5.5d'', [123456]) ==> ' + Format('%5.5d', [123456]));
  Log('Format (''%5.5d'', [12345]) ==> ' + Format('%5.5d', [12345]));
  Log('Format (''%5.5d'', [1234]) ==> ' + Format('%5.5d', [1234]));
  Log('Format (''%5.5d'', [123]) ==> ' + Format('%5.5d', [123]));
  Log('Format (''%5.5d'', [12]) ==> ' + Format('%5.5d', [12]));
  Log('Format (''%5.5d'', [1]) ==> ' + Format('%5.5d', [1]));
  Log('---');
  Log('Format (''%.5d'', [123456]) ==> ' + Format('%.5d', [123456]));
  Log('Format (''%.5d'', [12345]) ==> ' + Format('%.5d', [12345]));
  Log('Format (''%.5d'', [1234]) ==> ' + Format('%.5d', [1234]));
  Log('Format (''%.5d'', [123]) ==> ' + Format('%.5d', [123]));
  Log('Format (''%.5d'', [12]) ==> ' + Format('%.5d', [12]));
  Log('Format (''%.5d'', [1]) ==> ' + Format('%.5d', [1]));
  Log('---');
  Log('Format (''%5.5d'', [123]) ==> ' + Format('%5.5d', [123]));
  Log('Format (''%5.4d'', [123]) ==> ' + Format('%5.4d', [123]));
  Log('Format (''%5.3d'', [123]) ==> ' + Format('%5.3d', [123]));
  Log('Format (''%5.2d'', [123]) ==> ' + Format('%5.2d', [123]));
  Log('Format (''%5.1d'', [123]) ==> ' + Format('%5.1d', [123]));
  Log('Format (''%5.0d'', [123]) ==> ' + Format('%5.0d', [123]));
  Log('---');
  Log('Format (''%4.5d'', [123]) ==> ' + Format('%4.5d', [123]));
  Log('Format (''%3.5d'', [123]) ==> ' + Format('%3.5d', [123]));
  Log('Format (''%2.5d'', [123]) ==> ' + Format('%2.5d', [123]));
  Log('Format (''%1.5d'', [123]) ==> ' + Format('%1.5d', [123]));
  Log('Format (''%0.5d'', [123]) ==> ' + Format('%0.5d', [123]));
  Log('---');
  Log('Format (''%2.5d'', [123]) ==> ' + Format('%2.5d', [123]));
  Log('Format (''%2.4d'', [123]) ==> ' + Format('%2.4d', [123]));
  Log('Format (''%2.3d'', [123]) ==> ' + Format('%2.3d', [123]));
  Log('Format (''%2.2d'', [123]) ==> ' + Format('%2.2d', [123]));
  Log('Format (''%2.1d'', [123]) ==> ' + Format('%2.1d', [123]));
  Log('Format (''%2.0d'', [123]) ==> ' + Format('%2.0d', [123]));
  Log('---');
  Log('Format (''%4.2d'', [123]) ==> ' + Format('%4.2d', [123]));
  Log('Format (''%3.2d'', [123]) ==> ' + Format('%3.2d', [123]));
  Log('Format (''%2.2d'', [123]) ==> ' + Format('%2.2d', [123]));
  Log('Format (''%1.2d'', [123]) ==> ' + Format('%1.2d', [123]));
  Log('Format (''%0.2d'', [123]) ==> ' + Format('%0.2d', [123]));
  Log('---');
  Log('Format (''%5.5f'', [123.456]) ==> ' + Format('%5.5f', [123.456]));
  Log('Format (''%5.4f'', [123.456]) ==> ' + Format('%5.4f', [123.456]));
  Log('Format (''%5.3f'', [123.456]) ==> ' + Format('%5.3f', [123.456]));
  Log('Format (''%5.2f'', [123.456]) ==> ' + Format('%5.2f', [123.456]));
  Log('Format (''%5.1f'', [123.456]) ==> ' + Format('%5.1f', [123.456]));
  Log('Format (''%5.0f'', [123.456]) ==> ' + Format('%5.0f', [123.456]));
  Log('---');
  Log('Format (''%4.5f'', [123.456]) ==> ' + Format('%4.5f', [123.456]));
  Log('Format (''%3.5f'', [123.456]) ==> ' + Format('%3.5f', [123.456]));
  Log('Format (''%2.5f'', [123.456]) ==> ' + Format('%2.5f', [123.456]));
  Log('Format (''%1.5f'', [123.456]) ==> ' + Format('%1.5f', [123.456]));
  Log('Format (''%0.5f'', [123.456]) ==> ' + Format('%0.5f', [123.456]));
  Log('---');
  Log('Format(''|%-10s|'', [''abcd''] ==> ' + Format('|%-10s|', ['abcd']));
  Log('Format(''|%10s|'', [''abcd''] ==> ' + Format('|%10s|', ['abcd']));
  Log('Format(''|%-10.3s|'', [''abcd''] ==> ' + Format('|%-10.3s|', ['abcd']));
  Log('Format(''|%10.3s|'', [''abcd''] ==> ' + Format('|%10.3s|', ['abcd']));
  Log('Format(''|%-3.10s|'', [''abcd''] ==> ' + Format('|%-3.10s|', ['abcd']));
  Log('Format(''|%3.10s|'', [''abcd''] ==> ' + Format('|%3.10s|', ['abcd']));
end;

procedure TFMPruebas.BtNRecalcularCodLoteClick(Sender: TObject);
begin
  DMPruebas.recalculaCodigoLote;
end;

procedure TFMPruebas.BPruebaVelocidadQueryUnidireccionalClick(Sender: TObject);
begin
  DMPruebas.PruebaVelocidadQueryUnidireccional;
end;

procedure TFMPruebas.BBorrarMemoClick(Sender: TObject);
begin
  MDebug.Clear;
end;

procedure TFMPruebas.BPruebaImportacionExcelClick(Sender: TObject);
var
  HCalc : THojaCalc;
  num_columnas, c, f : integer;
  s : string;
  Archivo : string;
begin
  Archivo := '';
  if MyOpenDialog(Archivo, 'XLS,ODS') then
  begin
     num_columnas := 4;
     Log('HCalc.Create(' + Archivo + ')');
     HCalc := THojaCalc.Create(Archivo, False);
     try
        Log('HCalc.ActivateSheetByIndex(1)');
        HCalc.ActivateSheetByIndex(1);
        // if HCalc.IsActiveSheetProtected then
        //    ShowMessage('2nd sheet of name "'+HCalc.ActiveSheetName+'" IS protected');

        Log('HCalc.LastRow ' + IntToStr(HCalc.LastRow));
        Log('HCalc.LastCol ' + IntToStr(HCalc.LastCol));
        Log('---');
        for f := 1 to HCalc.LastRow do
        begin
           s := '';
           for c := 1 to num_columnas do
           begin
              s := s + Format('%-20s|', [Trim(HCalc.CellText[f, c])]);
           end;
           Log(s);
        end;
     finally
        HCalc.Free;
     end;
  end;
end;

procedure TFMPruebas.BUtilizarMSXML2Click(Sender: TObject);
var
  Server : variant;
  XMLDocEnvio, XMLDocRespuesta : variant;
  Url, s, CertName : string;
  Documento : TXMLDocument;
begin
  CertName := ECertName.Text;
  MDebug.Lines.Clear;
  Log('Ini BUtilizarMSXML2Click');
  {
  DEFINE URLENDPOINT { "FE" => "https://www7.aeat.es/wlpl/SSII-FACT/ws/fe/SiiFactFEV1SOAP",;
                      "FR" => "https://www7.aeat.es/wlpl/SSII-FACT/ws/fr/SiiFactFRV1SOAP",;
                      "CE" => "https://www7.aeat.es/wlpl/SSII-FACT/ws/fe/SiiFactCOBV1SOAP",;
                      "PR" => "https://www7.aeat.es/wlpl/SSII-FACT/ws/fr/SiiFactPAGV1SOAP",;
                      "OI" => "https://www7.aeat.es/wlpl/SSII-FACT/ws/oi/SiiFactOIV1SOAP",;
                      "BI" => "https://www7.aeat.es/wlpl/SSII-FACT/ws/bi/SiiFactBIV1SOAP",;
                      "CM" => "https://www7.aeat.es/wlpl/SSII-FACT/ws/pm/SiiFactCMV1SOAP",;
                      "OS" => "https://www7.aeat.es/wlpl/SSII-FACT/ws/pm/SiiFactCMV1SOAP"
  }

  Url := 'https://www7.aeat.es/wlpl/SSII-FACT/ws/fe/SiiFactFEV1SOAP';
  s := '';

  Log('CreateOleObject(''MSXML2.ServerXMLHTTP.6.0'')');
  Server := CreateOleObject('MSXML2.ServerXMLHTTP.6.0');
  try
     Log('SetOption SXH_OPTION_SELECT_CLIENT_SSL_CERT');
     // 0: SXH_OPTION_URL_CODEPAGE
     // 1: SXH_OPTION_ESCAPE_PERCENT_IN_URL
     // 2: SXH_OPTION_IGNORE_SERVER_SSL_CERT_ERROR_FLAGS
     // 3: SXH_OPTION_SELECT_CLIENT_SSL_CERT
     // HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\My\Certificates\BCCC7608D2B2ADAC616CCCB6D78F956130CC3945
     Server.setOption(3, CertName);
     CertName := '123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-';
     CertName := Server.getOption(3);
     Log('CertName: ' + CertName + '<');
     Log('Server.Open(''POST'', Url, False)');
     Server.Open('POST', Url, False);
     Log('Server.SetRequestHeader(''Content-Type'', ''text/xml'')');
     Server.SetRequestHeader('Content-Type', 'text/xml');

     Log('CreateOleObject(''MSXML2.DOMDocument.6.0'')');
     XMLDocEnvio := CreateOleObject('MSXML2.DOMDocument.6.0');
     try
        Log('XMLDocEnvio.Async := False');
        XMLDocEnvio.Async := False;
        Log('XMLDocEnvio.LoadXML(''C:\Compilacion\MergeDev\Factura_A_433.xml'')');
        XMLDocEnvio.LoadXML('C:\Compilacion\MergeDev\Factura_A_433.xml');

        with TStringList.Create do
        begin
           try
              LoadFromFile(EArchivoXML.Text);
              s := Text;
           finally
              Free;
           end;
        end;

        Log('Server.Send');
        Server.Send(s);

        s := Server.ResponseText;
        Log('Respuesta');
        Log(s);

        // Formateo XML
        Documento := TXMLDocument.Create(Self);
        try
           with Documento do
           begin
              // Borro los datos que pudiera haber
              XML.Text := '';
              Active := True;
              Encoding := 'utf-8';

              // Cargo XML en el componente
              XML.Text := s;

              // Doy formato al fichero y lo grabo a disco
              XML.Text := FormatXMLData(XML.Text);
              s := XML.Text;
              Active := True;
              Encoding := 'utf-8';
              // SaveToFile(Fichero);
              Active := False;
              // Borro los datos
              XML.Text := '';
           end;
        finally
           Documento.Free;
        end;

        Log('Respuesta + Formato');
        Log(s);

        Log('CreateOleObject(''MSXML2.DOMDocument.6.0'')');
        XMLDocRespuesta := CreateOleObject('MSXML2.DOMDocument.6.0');
        try
           XMLDocRespuesta.Async := False;
           Log('XMLDocRespuesta.LoadXML(Server.responseText)');
           XMLDocRespuesta.LoadXML(Server.responseText);

        finally
           XMLDocRespuesta := Unassigned;
        end;

     finally
        XMLDocEnvio := Unassigned;
     end;
  finally
     Server := Unassigned;
  end;
  Log('Fin BUtilizarMSXML2Click');
end;

procedure TFMPruebas.BPruebaSIIFacturasEmitidasClick(Sender: TObject);
(*
var
  Documento : TXMLDocument;
  DOMString : WideString;
  Prefixsoapenv : WideString;
  Prefixsii : WideString;
  PrefixsiiLR : WideString;
  NodoRoot : IXMLNode;
  NodoPadre : IXMLNode;
  SuministroLRFacturasEmitidas, RegistroLRFacturasEmitidas, IDFactura, FacturaExpedida, DesgloseFactura, TipoDesglose, Sujeta, NoSujeta, DesgloseTipoOperacion, PrestacionServicios, Entrega : IXMLNode;
  Nodo : IXMLNode;
  Periodo, Factura : integer;
*)
  function DameNodo(Nodo: IXMLNode; a: array of string): IXMLNode;
  var
     i : integer;
  begin
     Result := nil;
     i := 0;

     while (Assigned(Nodo) and (i < Length(a))) do
     begin
        Nodo := Nodo.ChildNodes.FindNode(a[i]);
        Inc(i);
     end;

     if Assigned(Nodo) then
        Result := Nodo;
  end;

  function DameDato(Nodo: IXMLNode; a: array of string): string;
  var
     i : integer;
  begin
     Result := '';
     i := 0;

     while (Assigned(Nodo) and (i < Length(a))) do
     begin
        Nodo := Nodo.ChildNodes.FindNode(a[i]);
        Inc(i);
     end;

     if Assigned(Nodo) then
        Result := Nodo.Text;
  end;

begin
  AbreData(TDMSII, DMSII);
  // DMSII.SII_LibroFacturasEmitidas(1);
  CierraData(DMSII);

(*
  Archivo := 'sii.xml';
  if MyOpenDialog(Archivo, 'XML') then
  begin
     Documento := TXMLDocument.Create(Self);
     try
        Prefixsoapenv := 'soapenv:';
        Prefixsii := 'sii:';
        PrefixsiiLR := 'siiLR:';

        with Documento do
        begin
           // Borro los datos que pudiera haber
           XML.Text := '';
           // Se activa para poder utilizar el componente
           Active := True;
           // Codigifacion UTF-8
           Encoding := 'utf-8';
           // Standalone="yes"
           // StandAlone := 'yes';
           // Caracter para indentar el fichero XML
           NodeIndentStr := #8;

           // Creo el primer elemento
           DocumentElement := CreateElement(Prefixsoapenv + 'Envelope', '');
           with DocumentElement do
           begin
              DOMString := '';
              DeclareNamespace('soapenv', 'http://schemas.xmlsoap.org/soap/envelope/');
              DeclareNamespace('siiLR', 'https://www2.agenciatributaria.gob.es/static_files/common/internet/dep/aplicaciones/es/aeat/ssii/fact/ws/SuministroLR.xsd');
              DeclareNamespace('sii', 'https://www2.agenciatributaria.gob.es/static_files/common/internet/dep/aplicaciones/es/aeat/ssii/fact/ws/SuministroInformacion.xsd');
           end;

           NodoPadre := DocumentElement;
           NodoRoot := NodoPadre;

           Nodo := NodoPadre.AddChild(Prefixsoapenv + 'Header', DOMString);

           Nodo := NodoPadre.AddChild(Prefixsoapenv + 'Body', DOMString);

           NodoPadre := DameNodo(NodoRoot, [Prefixsoapenv + 'Body']);

           SuministroLRFacturasEmitidas := NodoPadre.AddChild(PrefixsiiLR + 'SuministroLRFacturasEmitidas', DOMString);
           NodoPadre := SuministroLRFacturasEmitidas.AddChild(Prefixsii + 'Cabecera', DOMString);
           Nodo := NodoPadre.AddChild(Prefixsii + 'IDVersionSii', DOMString);
           Nodo.Text := '0.6'; // constante

           NodoPadre := NodoPadre.AddChild(Prefixsii + 'Titular', DOMString);
           Nodo := NodoPadre.AddChild(Prefixsii + 'NombreRazon', DOMString);
           Nodo.Text := Copy('Duilio Juan Isola', 1, 40);

           Nodo := NodoPadre.AddChild(Prefixsii + 'NIF', DOMString);
           Nodo.Text := Copy('X3245299E', 1, 9);

           // Solo si es menor de edad
           if (False {MenorDeEdad}) then
           begin
              Nodo := NodoPadre.AddChild(Prefixsii + 'NIFRepresentante', DOMString);
              Nodo.Text := Copy('X3245299E', 1, 9);
           end;

           NodoPadre := DameNodo(NodoRoot, [Prefixsoapenv + 'Body', PrefixsiiLR + 'SuministroLRFacturasEmitidas', Prefixsii + 'Cabecera']);
           if (Assigned(NodoPadre)) then
           begin
              Nodo := NodoPadre.AddChild(Prefixsii + 'TipoComunicacion', DOMString);
              Nodo.Text := 'A0'; {A0 Alta, A1 Modificacion, A4 Modificacion Regimen Viajeros}
           end;

           // Bucle principal, recorriendo los registros a presentar
           // Facturas - MAX 10000

           // Las facturas tienen que estar agrupadas por periodo
           for Periodo := 1 to 2 do
           begin
              RegistroLRFacturasEmitidas := SuministroLRFacturasEmitidas.AddChild(PrefixsiiLR + 'RegistroLRFacturasEmitidas', DOMString);

              // PeriodoImpositivo
              NodoPadre := RegistroLRFacturasEmitidas.AddChild(Prefixsii + 'PeriodoImpositivo', DOMString);
              Nodo := NodoPadre.AddChild(Prefixsii + 'Ejercicio', DOMString);
              Nodo.Text := Format('%.4d', [2017]);
              Nodo := NodoPadre.AddChild(Prefixsii + 'Periodo', DOMString);
              Nodo.Text := Format('%.2d', [Periodo]); {'01..'12'}

              // Se recorren las facturas
              for Factura := Periodo * 100 to Periodo * 100 + 1 do
              begin
                 // IDFactura
                 IDFactura := RegistroLRFacturasEmitidas.AddChild(PrefixsiiLR + 'IDFactura', DOMString);
                 Nodo := IDFactura.AddChild(Prefixsii + 'IDEmisorFactura', DOMString);
                 Nodo := Nodo.AddChild(Prefixsii + 'NIF', DOMString);
                 Nodo.Text := Copy('X3245299E', 1, 9);

                 { Opcional ???}
                 // Nº Serie+Nº Factura  que identifica a la factura emitida (en su caso primera factura del asiento resumen)
                 Nodo := IDFactura.AddChild(Prefixsii + 'NumSerieFacturaEmisorResultado', DOMString);
                 Nodo.Text := Copy(Format('%s-%.8d', ['A', Factura]), 1, 60);

                 Nodo := IDFactura.AddChild(Prefixsii + 'FechaExpedicionFacturaEmisor', DOMString);
                 Nodo.Text := FormatDateTime('dd-mm-yyyy', Now);

                 // FacturaExpedida
                 // Especificación del tipo de factura a dar de alta: factura normal, factura rectificativa, tickets, factura emitida en sustitución de facturas.
                 // Lista L2_EMI - Tipo de Factura Emitidas :
                 // F1 Factura
                 // F2 Factura Simplificada (ticket)
                 // R1 Factura Rectificativa (Art 80.1 y 80.2 y error fundado en derecho)
                 // R2 Factura Rectificativa (Art. 80.3)
                 // R3 Factura Rectificativa (Art. 80.4)
                 // R4 Factura Rectificativa (Resto)
                 // R5 Factura Rectificativa en facturas simplificadas
                 // F3 Factura emitida en sustitución de facturas simplificadas facturadas y declaradas
                 // F4 Asiento resumen de facturas
                 FacturaExpedida := RegistroLRFacturasEmitidas.AddChild(PrefixsiiLR + 'FacturaExpedida', DOMString);

                 // Especificación del tipo de factura a dar de alta: factura normal, factura rectificativa, tickets, factura emitida en sustitución de facturas.
                 Nodo := FacturaExpedida.AddChild(Prefixsii + 'TipoFactura', DOMString);
                 Nodo.Text := 'F1';

                 if (False {Es_Rectificativa}) then
                 begin
                    // Campo que identifica si el tipo de factura rectificativa es por sustitución o por diferencia
                    // Lista L5 - Tipo de Factura Rectificativa
                    // S Por sustitución
                    // I Por diferencias
                    Nodo := FacturaExpedida.AddChild(Prefixsii + 'TipoRectificativa', DOMString);
                    Nodo.Text := 'S';
                 end;

                 // FacturasAgrupadas
                 NodoPadre := FacturaExpedida.AddChild(Prefixsii + 'FacturasAgrupadas', DOMString);
                 NodoPadre := NodoPadre.AddChild(Prefixsii + 'IDFacturaAgrupada', DOMString);
                 // Nº Serie+Nº Factura que identifica a la factura emitida
                 Nodo := NodoPadre.AddChild(Prefixsii + 'NumSerieFacturaEmisor', DOMString);
                 Nodo.Text := Copy(Format('%s-%.8d', ['A', Factura]), 1, 60);
                 // Fecha de expedición de la factura
                 Nodo := NodoPadre.AddChild(Prefixsii + 'FechaExpedicionFacturaEmisor', DOMString);
                 Nodo.Text := FormatDateTime('dd-mm-yyyy', Now);

                 // FacturasRectificadas
                 Nodo := FacturaExpedida.AddChild(Prefixsii + 'FacturasRectificadas', DOMString);
                 NodoPadre := NodoPadre.AddChild(Prefixsii + 'IDFacturaRectificada', DOMString);
                 // Nº Serie+Nº Factura que identifica a la factura emitida
                 Nodo := NodoPadre.AddChild(Prefixsii + 'NumSerieFacturaEmisor', DOMString);
                 Nodo.Text := Copy(Format('%s-%.8d', ['A', Factura]), 1, 60);
                 // Fecha de expedición de la factura
                 Nodo := NodoPadre.AddChild(Prefixsii + 'FechaExpedicionFacturaEmisor', DOMString);
                 Nodo.Text := FormatDateTime('dd-mm-yyyy', Now);

                 NodoPadre := FacturaExpedida.AddChild(Prefixsii + 'ImporteRectificacion', DOMString);
                 Nodo := NodoPadre.AddChild(Prefixsii + 'BaseRectificada', DOMString);
                 Nodo.Text := FormatAmount(1210.00, 2);
                 Nodo := NodoPadre.AddChild(Prefixsii + 'CuotaRectificada', DOMString);
                 Nodo.Text := FormatAmount(210.00, 2);
                 Nodo := NodoPadre.AddChild(Prefixsii + 'CuotaRecargoRectificado', DOMString);
                 Nodo.Text := FormatAmount(210.00, 2);


                 Nodo := FacturaExpedida.AddChild(Prefixsii + 'FechaOperacion', DOMString);
                 Nodo.Text := FormatDateTime('dd-mm-yyyy', Now);

                 // Clave que identificará el tipo de operación o el régimen especial con transcendencia tributaria
                 // L3.1 - Clave de régimen especial o trascendencia en facturas expedidas
                 // 01 Operación de régimen común
                 // 02 Exportación
                 // 03 Operaciones a las que se aplique el régimen especial de bienes usados, objetos de arte, antigüedades y objetos de colección (135-139 LIVA)
                 // 04 Régimen especial oro de inversión
                 // 05 Régimen especial agencias de viajes 06 Régimen especial grupo de entidades en IVA (Nivel Avanzado)
                 // 07 Régimen especial criterio de caja
                 // 08 Operaciones sujetas al IPSI / IGIC
                 // 09 Facturación de las prestaciones de servicios de agencias de viaje que actúan como mediadoras en nombre y por cuenta ajena (D.A.4ª RD1619/2012)
                 // 10 Cobros por cuenta de terceros de honorarios profesionales o de derechos derivados de la propiedad industrial, de autor u otros por cuenta de sus socios, asociados o colegiados efectuados por sociedades, asociaciones, colegios profesionales u otras entidades que realicen estas funciones de cobro
                 // 11 Operaciones de arrendamiento de local de negocio sujetas a retención
                 // 12 Operaciones de arrendamiento de local de negocio no  sujetos a retención
                 // 13 Operaciones de arrendamiento de local de negocio sujetas y no sujetas a retención
                 // 14 Factura con IVA pendiente de devengo (certificaciones de obra cuyo destinatario sea una Administración Pública)
                 // 15 Factura con IVA pendiente de devengo - operaciones de tracto sucesivo
                 Nodo := FacturaExpedida.AddChild(Prefixsii + 'ClaveRegimenEspecialOTrascendencia', DOMString);
                 Nodo.Text := '01';

                 // Importe total de la factura
                 Nodo := FacturaExpedida.AddChild(Prefixsii + 'Importetotal', DOMString);
                 Nodo.Text := FormatAmount(1210.00, 2);

                 // Para grupos de IVA
                 Nodo := FacturaExpedida.AddChild(Prefixsii + 'BaseImponibleACoste', DOMString);
                 Nodo.Text := FormatAmount(1000.00, 2);

                 // Descripción del objeto de la factura
                 Nodo := FacturaExpedida.AddChild(Prefixsii + 'DescripcionOperacion', DOMString);
                 Nodo.Text := 'Venta de algo';

                 NodoPadre := FacturaExpedida.AddChild(Prefixsii + 'DatosInmueble', DOMString);
                 NodoPadre := NodoPadre.AddChild(Prefixsii + 'DetalleInmueble', DOMString);
                 // Lista L6 - Situación del Inmueble
                 // 1 Inmueble con referencia catastral situado en cualquier punto del territorio español, excepto País Vasco y Navarra
                 // 2 Inmueble situado en la Comunidad Autónoma del País Vasco o en la Comunidad Foral de Navarra
                 // 3 Inmueble en cualquiera de las situaciones anteriores  pero sin referencia catastral
                 // 4 Inmueble situado en el extranjero
                 Nodo := NodoPadre.AddChild(Prefixsii + 'SituacionInmueble', DOMString);
                 Nodo.Text := IntToStr(1);
                 Nodo := NodoPadre.AddChild(Prefixsii + 'ReferenciaCatastral', DOMString);
                 Nodo.Text := Copy('1234567890', 1, 25);

                 Nodo := FacturaExpedida.AddChild(Prefixsii + 'ImportaTransmisionSujetoAIVA', DOMString);
                 Nodo.Text := FormatAmount(1000.00, 2);

                 // Identificador que especifica si la factura ha sido emitida por un tercero.
                 // Si no se informa este campo se entenderá que tiene valor  “N”.
                 // Lista L10 - Emitidas por Terceros
                 // S Si
                 // N No
                 Nodo := FacturaExpedida.AddChild(Prefixsii + 'EmitidaPorTerceros', DOMString);
                 Nodo.Text := 'N';

                 // Identificador que especifica si la factura tiene varios destinatarios.
                 // Si no se informa este campo se entenderá que tiene valor  “N”.
                 // Lista L20 - Varios destinatarios
                 // S Si
                 // N No
                 Nodo := FacturaExpedida.AddChild(Prefixsii + 'VariosDestinatarios', DOMString);
                 Nodo.Text := 'N';

                 // Identificador que especifica si la factura tipo R5 o F4 tiene minoración de la base imponible por la concesión de cupones,
                 // bonificaciones o descuentos cuando solo se expide el original de la factura.
                 // Si no se informa este campo se entenderá que tiene valor  “N”.
                 // Lista L22 - Varios destinatarios
                 // S Si
                 // N No
                 Nodo := FacturaExpedida.AddChild(Prefixsii + 'Cupon', DOMString);
                 Nodo.Text := 'N';

                 NodoPadre := FacturaExpedida.AddChild(Prefixsii + 'Contraparte', DOMString);
                 // Nombre-razón social de la contraparte de la operación (cliente) de facturas expedidas
                 Nodo := NodoPadre.AddChild(Prefixsii + 'NombreRazon', DOMString);
                 Nodo.Text := Copy('Duilio Juan Isola', 1, 40);
                 // NIF del representante de la contraparte de la operación
                 Nodo := NodoPadre.AddChild(Prefixsii + 'NIFRepresentante', DOMString);
                 Nodo.Text := Copy('X3245299E', 1, 9);
                 // Identificador del NIF contraparte de la operación (cliente) de facturas expedida
                 Nodo := NodoPadre.AddChild(Prefixsii + 'NIF', DOMString);
                 Nodo.Text := Copy('X3245299E', 1, 9);
                 NodoPadre := NodoPadre.AddChild(Prefixsii + 'IDOtro', DOMString);
                 // Código del país asociado contraparte de la operación (cliente) de facturas expedidas (ISO 3166-1 alpha-2 codes)
                 // Lista L17
                 Nodo := NodoPadre.AddChild(Prefixsii + 'CodigoPais', DOMString);
                 Nodo.Text := 'DE';
                 // Clave para establecer el tipo de identificación en el pais de residencia
                 // Lista L4 - Tipos de Identificación en el país de residencia
                 // 02 NIF-IVA
                 // 03 PASAPORTE
                 // 04 DOCUMENTO OFICIAL DE IDENTIFICACIÓN EXPEDIDO POR EL PAIS O TERRITORIO DE RESIDENCIA
                 // 05 CERTIFICADO DE RESIDENCIA
                 // 06 OTRO DOCUMENTO PROBATORIO
                 Nodo := NodoPadre.AddChild(Prefixsii + 'IDType', DOMString);
                 Nodo.Text := '04';
                 Nodo := NodoPadre.AddChild(Prefixsii + 'ID', DOMString);
                 Nodo.Text := Copy('23941446N', 1, 20);

                 TipoDesglose := FacturaExpedida.AddChild(Prefixsii + 'TipoDesglose', DOMString);
                 DesgloseFactura := TipoDesglose.AddChild(Prefixsii + 'DesgloseFactura', DOMString);
                 Sujeta := DesgloseFactura.AddChild(Prefixsii + 'Sujeta', DOMString);

                 NodoPadre := Sujeta.AddChild(Prefixsii + 'Excenta', DOMString);
                 // Lista L9 - Causa de exención de operaciones sujetas y exentas
                 // E1 Exenta por el artículo 20
                 // E2 Exenta por el artículo 21
                 // E3 Exenta por el artículo 22
                 // E4 Exenta por el artículo 24
                 // E5 Exenta por el artículo 25
                 // E6 Exenta por Otros
                 Nodo := NodoPadre.AddChild(Prefixsii + 'CausaExcenta', DOMString);
                 Nodo.Text := 'E1';
                 Nodo := NodoPadre.AddChild(Prefixsii + 'BaseImponible', DOMString);
                 Nodo.Text := FormatAmount(1000.00, 2);

                 NodoPadre := Sujeta.AddChild(Prefixsii + 'NoExcenta', DOMString);
                 // Lista L7 - Calificación del tipo de operación Sujeta/ No Exenta
                 // S1 Sujeta – No Exenta
                 // S2 Sujeta – No Exenta - Inv. Suj. Pasiv
                 Nodo := NodoPadre.AddChild(Prefixsii + 'TipoNoExcenta', DOMString);
                 Nodo.Text := 'S1';
                 NodoPadre := NodoPadre.AddChild(Prefixsii + 'DesgloseIVA', DOMString);
                 NodoPadre := NodoPadre.AddChild(Prefixsii + 'DetalleIVA', DOMString);
                 Nodo := NodoPadre.AddChild(Prefixsii + 'TipoImpositivo', DOMString);
                 Nodo.Text := FormatAmount(21.00, 2);
                 Nodo := NodoPadre.AddChild(Prefixsii + 'BaseImponible', DOMString);
                 Nodo.Text := FormatAmount(1000.00, 2);
                 Nodo := NodoPadre.AddChild(Prefixsii + 'CuotaRepercutida', DOMString);
                 Nodo.Text := FormatAmount(210.00, 2);
                 Nodo := NodoPadre.AddChild(Prefixsii + 'TipoRecargoEquivalencia', DOMString);
                 Nodo.Text := FormatAmount(4.50, 2);
                 Nodo := NodoPadre.AddChild(Prefixsii + 'CuotaRecargoEquivalencia', DOMString);
                 Nodo.Text := FormatAmount(53.50, 2);

                 NoSujeta := DesgloseFactura.AddChild(Prefixsii + 'NoSujeta', DOMString);
                 // Importe en euros si la sujeción es por el art. 7,14,  otros
                 Nodo := NoSujeta.AddChild(Prefixsii + 'ImportePorArticulos7_14_Otros', DOMString);
                 Nodo.Text := FormatAmount(0.00, 2);
                 // Importe en euros si la sujeción es por operaciones no sujetas en el TAI por reglas de localización
                 Nodo := NoSujeta.AddChild(Prefixsii + 'ImporteTAIReglasLocalizacion', DOMString);
                 Nodo.Text := FormatAmount(0.00, 2);

                 DesgloseTipoOperacion := TipoDesglose.AddChild(Prefixsii + 'DesgloseTipoOperacion', DOMString);
                 PrestacionServicios := DesgloseTipoOperacion.AddChild(Prefixsii + 'PrestacionServicios', DOMString);
                 Sujeta := PrestacionServicios.AddChild(Prefixsii + 'Sujeta', DOMString);
                 NodoPadre := Sujeta.AddChild(Prefixsii + 'Excenta', DOMString);
                 // Lista L9 - Causa de exención de operaciones sujetas y exentas
                 // E1 Exenta por el artículo 20
                 // E2 Exenta por el artículo 21
                 // E3 Exenta por el artículo 22
                 // E4 Exenta por el artículo 24
                 // E5 Exenta por el artículo 25
                 // E6 Exenta por Otros
                 Nodo := NodoPadre.AddChild(Prefixsii + 'CausaExcenta', DOMString);
                 Nodo.Text := 'E1';
                 Nodo := NodoPadre.AddChild(Prefixsii + 'BaseImponible', DOMString);
                 Nodo.Text := FormatAmount(1000.00, 2);
                 NodoPadre := Sujeta.AddChild(Prefixsii + 'NoExcenta', DOMString);
                 // Lista L7 - Calificación del tipo de operación Sujeta/ No Exenta
                 // S1 Sujeta – No Exenta
                 // S2 Sujeta – No Exenta - Inv. Suj. Pasiv
                 Nodo := NodoPadre.AddChild(Prefixsii + 'TipoNoExcenta', DOMString);
                 Nodo.Text := 'S1';
                 NodoPadre := NodoPadre.AddChild(Prefixsii + 'DesgloseIVA', DOMString);
                 NodoPadre := NodoPadre.AddChild(Prefixsii + 'DetalleIVA', DOMString);
                 Nodo := NodoPadre.AddChild(Prefixsii + 'TipoImpositivo', DOMString);
                 Nodo.Text := FormatAmount(21.00, 2);
                 Nodo := NodoPadre.AddChild(Prefixsii + 'BaseImponible', DOMString);
                 Nodo.Text := FormatAmount(1000.00, 2);
                 Nodo := NodoPadre.AddChild(Prefixsii + 'CuotaRepercutida', DOMString);
                 Nodo.Text := FormatAmount(210.00, 2);

                 NoSujeta := PrestacionServicios.AddChild(Prefixsii + 'NoSujeta', DOMString);
                 // Importe en euros si la sujeción es por el art. 7,14,  otros
                 Nodo := NoSujeta.AddChild(Prefixsii + 'ImportePorArticulos7_14_Otros', DOMString);
                 Nodo.Text := FormatAmount(0.00, 2);
                 // Importe en euros si la sujeción es por operaciones no sujetas en el TAI por reglas de localización
                 Nodo := NoSujeta.AddChild(Prefixsii + 'ImporteTAIReglasLocalizacion', DOMString);
                 Nodo.Text := FormatAmount(0.00, 2);

                 Entrega := DesgloseTipoOperacion.AddChild(Prefixsii + 'Entrega', DOMString);
                 Sujeta := Entrega.AddChild(Prefixsii + 'Sujeta', DOMString);
                 NodoPadre := Sujeta.AddChild(Prefixsii + 'Excenta', DOMString);
                 // Lista L9 - Causa de exención de operaciones sujetas y exentas
                 // E1 Exenta por el artículo 20
                 // E2 Exenta por el artículo 21
                 // E3 Exenta por el artículo 22
                 // E4 Exenta por el artículo 24
                 // E5 Exenta por el artículo 25
                 // E6 Exenta por Otros
                 Nodo := NodoPadre.AddChild(Prefixsii + 'CausaExcenta', DOMString);
                 Nodo.Text := 'E1';
                 Nodo := NodoPadre.AddChild(Prefixsii + 'BaseImponible', DOMString);
                 Nodo.Text := FormatAmount(1000.00, 2);
                 NodoPadre := Sujeta.AddChild(Prefixsii + 'NoExcenta', DOMString);
                 // Lista L7 - Calificación del tipo de operación Sujeta/ No Exenta
                 // S1 Sujeta – No Exenta
                 // S2 Sujeta – No Exenta - Inv. Suj. Pasiv
                 Nodo := NodoPadre.AddChild(Prefixsii + 'TipoNoExcenta', DOMString);
                 Nodo.Text := 'S1';
                 NodoPadre := NodoPadre.AddChild(Prefixsii + 'DesgloseIVA', DOMString);
                 NodoPadre := NodoPadre.AddChild(Prefixsii + 'DetalleIVA', DOMString);
                 Nodo := NodoPadre.AddChild(Prefixsii + 'TipoImpositivo', DOMString);
                 Nodo.Text := FormatAmount(21.00, 2);
                 Nodo := NodoPadre.AddChild(Prefixsii + 'BaseImponible', DOMString);
                 Nodo.Text := FormatAmount(1000.00, 2);
                 Nodo := NodoPadre.AddChild(Prefixsii + 'CuotaRepercutida', DOMString);
                 Nodo.Text := FormatAmount(210.00, 2);
                 Nodo := NodoPadre.AddChild(Prefixsii + 'TipoRecargoEquivalencia', DOMString);
                 Nodo.Text := FormatAmount(4.50, 2);
                 Nodo := NodoPadre.AddChild(Prefixsii + 'CuotaRecargoEquivalencia', DOMString);
                 Nodo.Text := FormatAmount(53.50, 2);

                 NoSujeta := Entrega.AddChild(Prefixsii + 'NoSujeta', DOMString);
                 // Importe en euros si la sujeción es por el art. 7,14,  otros
                 Nodo := NoSujeta.AddChild(Prefixsii + 'ImportePorArticulos7_14_Otros', DOMString);
                 Nodo.Text := FormatAmount(0.00, 2);
                 // Importe en euros si la sujeción es por operaciones no sujetas en el TAI por reglas de localización
                 Nodo := NoSujeta.AddChild(Prefixsii + 'ImporteTAIReglasLocalizacion', DOMString);
                 Nodo.Text := FormatAmount(0.00, 2);
              end;
           end;

           // Doy formato al fichero y lo grabo a disco
           XML.Text := FormatXMLData(XML.Text);
           Active := True;
           Encoding := 'utf-8';
           SaveToFile(OpenDialog.FileName);
           Active := False;
           // Borro los datos
           XML.Text := '';
        end;
     finally
        Documento.Free;
     end;
  end;
*)
end;

procedure TFMPruebas.BArticuloNuevoClick(Sender: TObject);
var
  articulo, Alfa1, reference : string;
begin
  MDebug.Clear;
  Articulo := 'ABC123';
  Alfa1 := 'RR-RR-RR';
  reference := 'RRRRRR';

  with TFMSincronizacionTiendArticuloNuevo.Create(nil) do
  begin
     try
        ArticuloPropuesto := Articulo;
        ReferenciaArticulo := reference;
        Alfa1Articulo := Alfa1;
        DatosImportacion.Add('Datos de producto:');
        DatosImportacion.Add('  id_product : ' + IntToStr(123));
        DatosImportacion.Add('  id_product_attribute : ' + IntToStr(456));
        DatosImportacion.Add('  id_attribute : ' + IntToStr(789));
        DatosImportacion.Add('  Cod. Articulo Propuesto : ' + Articulo);
        DatosImportacion.Add('  reference : ' + Alfa1);
        if (Alfa1 <> reference) then
           DatosImportacion.Add('  reference (limpia) : ' + reference);
        DatosImportacion.Add('  ean13 : 84123456789012');
        DatosImportacion.Add('  upc : 12345678901234');
        DatosImportacion.Add('  product_name : A Product Name');
        DatosImportacion.Add('  id_supplier : ' + IntToStr(1));
        DatosImportacion.Add('  id_manufacturer : ' + IntToStr(2));
        DatosImportacion.Add('  Fabricante : ' + IntToStr(3));
        DatosImportacion.Add('  quantity : ' + FloatToStr(10));
        DatosImportacion.Add('  price : ' + FloatToStr(12.8));
        DatosImportacion.Add('  Porcentaje IVA : ' + FloatToStr(21));
        DatosImportacion.Add('  Precio Venta Iva Incluido : ' + FloatToStr(15.7));
        DatosImportacion.Add('  weight : ' + FloatToStr(150));

        Log('Articulo seleccionado = "' + Elegir(False) + '"');
     finally
        Free;
     end;
  end;
end;

procedure TFMPruebas.PruebaMensajeClick(Sender: TObject);
begin
  ConfirmaMensajeCaption('Mensaje de Pruebas', 'Caption de Pruebas');
end;

procedure TFMPruebas.TButtDaysBetweenClick(Sender: TObject);
var
  F1, F2 : TDateTime;

  function Dias29FebreroEntreFechas(ANow, AThen: TDateTime): integer;
  var
     aYear, aMonth, aDay : word;
     T : TDateTime;
  begin
     Result := 0;

     // invierto si es necesario
     if (ANow > AThen) then
     begin
        T := AThen;
        AThen := ANow;
        ANow := T;
     end;

     while ANow < AThen do
     begin
        DecodeDate(ANow, aYear, aMonth, aDay);
        if ((aMonth = 2) and (aDay = 29)) then
           Inc(Result);
        ANow := IncDay(ANow);
     end;
  end;

begin
  F1 := EncodeDate(2017, 11, 29);
  F2 := EncodeDate(2020, 11, 29);
  Log(Format('DaysBetween(%s, %s) = %d (- %d) = %d', [DateToStr(F2), DateToStr(F1), DaysBetween(F2, F1), Dias29FebreroEntreFechas(F2, F1), DaysBetween(F2, F1) - Dias29FebreroEntreFechas(F2, F1)]));

  F1 := EncodeDate(2017, 11, 29);
  F2 := EncodeDate(2020, 02, 28);
  Log(Format('DaysBetween(%s, %s) = %d (- %d) = %d', [DateToStr(F2), DateToStr(F1), DaysBetween(F2, F1), Dias29FebreroEntreFechas(F2, F1), DaysBetween(F2, F1) - Dias29FebreroEntreFechas(F2, F1)]));

  F1 := EncodeDate(2020, 01, 01);
  F2 := EncodeDate(2020, 02, 28);
  Log(Format('DaysBetween(%s, %s) = %d (- %d) = %d', [DateToStr(F2), DateToStr(F1), DaysBetween(F2, F1), Dias29FebreroEntreFechas(F2, F1), DaysBetween(F2, F1) - Dias29FebreroEntreFechas(F2, F1)]));

  F1 := EncodeDate(2020, 01, 01);
  F2 := EncodeDate(2020, 03, 01);
  Log(Format('DaysBetween(%s, %s) = %d (- %d) = %d', [DateToStr(F2), DateToStr(F1), DaysBetween(F2, F1), Dias29FebreroEntreFechas(F2, F1), DaysBetween(F2, F1) - Dias29FebreroEntreFechas(F2, F1)]));
end;

procedure TFMPruebas.Button1Click(Sender: TObject);
begin
  // Prueba de texto con sombra
  with Imagen.Canvas do
  begin
     SetBKMode(Handle, TRANSPARENT);
     Font.Color := clBlack;
     TextOut(20, 20, 'Prueba');
     Font.Color := clWhite;
     TextOut(19, 19, 'Prueba');
  end;
end;

procedure TFMPruebas.BPruebaRGClick(Sender: TObject);
var
  i : integer;
begin
  with RGPrueba do
  begin
     for i := 0 to Items.Count do
        ItemIndex := i;
  end;
end;

procedure TFMPruebas.RGPruebaClick(Sender: TObject);
begin
  if (RGPrueba.ItemIndex = -1) then
     Log('RGPruebaClick (-1) - Indefinido')
  else
     Log(Format('RGPruebaClick (%d) - %s', [RGPrueba.ItemIndex, RGPrueba.Items[RGPrueba.ItemIndex]]));
end;

procedure TFMPruebas.BRegistryClick(Sender: TObject);
begin
  MDebug.Clear;
  Log('TRegistry.Create(KEY_READ)');
  with TRegistry.Create(KEY_READ) do
  begin
     try
        Log('RootKey := HKEY_LOCAL_MACHINE');
        RootKey := HKEY_LOCAL_MACHINE;

        if KeyExists('SOFTWARE\Borland\BLW32') then
           Log('KeyExists(''SOFTWARE\Borland\BLW32'') = True');
        if not KeyExists('SOFTWARE\Borland\BLW32') then
           Log('KeyExists(''SOFTWARE\Borland\BLW32'') = False');

        { False because we do not want to create it if it doesn’t exist }
        Log('OpenKey(''SOFTWARE\Borland\BLW32'',False);');
        OpenKey('SOFTWARE\Borland\BLW32', False);
        Log('ReadString(''LOCALE_LIB1'') = ' + ReadString('LOCALE_LIB1'));
        Log('ReadString(''DUILIO'') = ' + ReadString('DUILIO'));
     finally
        Free;
     end;
  end;
end;

procedure TFMPruebas.BDescargarClick(Sender: TObject);
begin
  MDebug.Lines.Clear;

  with IdFTP do
  begin
     try
        MDebug.Lines.Add('Inicializacion');
        // ConnectTimeout := 10;
        Host := 'ftp.sofinter.com';
        Port := 21;
        Username := 'ftpERP';
        Password := 'SoftgestERP';

        MDebug.Lines.Add('Connect');
        Connect;

        MDebug.Lines.Add('TransferType = ftBinary');
        TransferType := ftBinary;

        MDebug.Lines.Add('CurrentDir: ' + RetrieveCurrentDir);

        MDebug.Lines.Add('ChangeDir(AEAT)');
        ChangeDir('AEAT');
        MDebug.Lines.Add('CurrentDir: ' + RetrieveCurrentDir);

        MDebug.Lines.Add('ChangeDir(FACTURAE)');
        ChangeDir('FACTURAE');
        MDebug.Lines.Add('CurrentDir: ' + RetrieveCurrentDir);

        MDebug.Lines.Add('Get(...)');
        Get(Format('AutoFirma_%d_v1_6_1_installer.exe', [64]), DameTempPath + Format('AutoFirma_%d_v1_6_1_installer.exe', [64]), True, ResumeSupported);

        MDebug.Lines.Add('ChangeDirUp');
        ChangeDirUp;
        MDebug.Lines.Add('CurrentDir: ' + RetrieveCurrentDir);

        MDebug.Lines.Add('ChangeDirUp');
        ChangeDirUp;
        MDebug.Lines.Add('CurrentDir: ' + RetrieveCurrentDir);

        MDebug.Lines.Add('Disconnect');
        Disconnect;
     finally
        Free;
     end;
  end;
end;

procedure TFMPruebas.IdFTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: int64);
begin
  if AWorkMode = wmRead then
     MDebug.Lines.Add(Format('IdFTPWorkBegin - WorkMode %s - AWorkCountMax: %d', ['wmRead', AWorkCountMax]));
  if AWorkMode = wmWrite then
     MDebug.Lines.Add(Format('IdFTPWorkBegin - WorkMode %s - AWorkCountMax: %d', ['wmWrite', AWorkCountMax]));

  if AWorkMode = wmRead then
     LProcesoDescarga.Caption := 'wmRead';
  if AWorkMode = wmWrite then
     LProcesoDescarga.Caption := 'wmWrite';

  PBDescargaFTP.Max := AWorkCountMax;
end;

procedure TFMPruebas.IdFTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  MDebug.Lines.Add('IdFTPWorkEnd');
  if AWorkMode = wmRead then
     MDebug.Lines.Add(Format('WorkMode %s', ['wmRead']));
  if AWorkMode = wmWrite then
     MDebug.Lines.Add(Format('WorkMode %s', ['wmWrite']));

  PBDescargaFTP.Position := 0;
  LProcesoDescarga.Caption := 'idle';
end;

procedure TFMPruebas.IdFTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: int64);
begin
  {
  if AWorkMode = wmRead then
     MDebug.Lines.Add(Format('IdFTPWork %s: %d', ['wmRead', AWorkCount]));
  if AWorkMode = wmWrite then
     MDebug.Lines.Add(Format('IdFTPWork %s: %d', ['wmWrite', AWorkCount]));
  }

  PBDescargaFTP.Position := AWorkCount;
  LProcesoDescarga.Caption := Format('%d kb transferidos', [AWorkCount div 1024]);
  Application.ProcessMessages;
end;

procedure TFMPruebas.TSStringGridShow(Sender: TObject);
var
  c, r : integer;
begin
  with sgPrueba do
  begin
     // Inicializo (Vacio contenido)
     for c := 1 to ColCount do
     begin
        for r := 1 to RowCount do
        begin
           Cells[c, r] := '';
        end;
     end;
  end;
end;

procedure TFMPruebas.sgPruebaSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
var
  r : TRect;
begin
  // Posicion de la columna seleccionada en el StringGrid
  r := sgPrueba.CellRect(ACol, ARow);

  with dtpPrueba do
  begin
     // Guardo la fila,columna en la que estoy
     ColumnaSeleccionada := ACol;
     FilaSeleccionada := ARow;

     // Si estoy en la columna que contiene fechas, hago visible el DateTimePicker
     if (ACol = 3) then
     begin
        Left := sgPrueba.Left + sgPrueba.CellRect(ACol, ARow).Left + 2;
        Top := sgPrueba.Top + r.Top + 2;
        Width := r.Right - r.Left - 2;
        Height := r.Bottom - r.Top;

        Visible := True;
        // Trato de convertir el texto de la celda en fecha. Si no puedo, utilizo la fecha de hoy
        try
           Date := StrToDate(sgPrueba.Cells[ACol, ARow])
        except
           Date := Today;
        end;
     end
     else
        Visible := False;
  end;
end;

procedure TFMPruebas.dtpPruebaChange(Sender: TObject);
begin
  with sgPrueba do
     Cells[ColumnaSeleccionada, FilaSeleccionada] := DateToStr(dtpPrueba.Date);
end;

procedure TFMPruebas.BDividirStringClick(Sender: TObject);
var
  sl : TStrings;
  i : integer;
begin
  sl := TStringList.Create;
  try
     sl.Delimiter := ';';
     sl.DelimitedText := EDirecciones.Text;
     for i := 0 to sl.Count - 1 do
        Log(sl[i]);
  finally
     sl.Free;
  end;
end;

procedure TFMPruebas.Button2Click(Sender: TObject);

//SendMailMAPI(const Subject, Body, SenderName, SenderEMail, RecepientName, RecepientEMail, FileName: string): integer;
  function SendMailMAPI(const Subject, Body, SenderName, SenderEMail: string; RecepientName, RecepientEMail, FileName: string; const ShowDialog: boolean = True): integer;
  var
     MapiMessage : TMapiMessage;
     MError : cardinal;
     Sender : TMapiRecipDesc;
     PRecip, Recipients : PMapiRecipDesc;
     PFiles, Attachments : PMapiFileDesc;
     I : integer;
     AppHandle : THandle;
     FTOAdr, FCCAdr, FTONm, FCCNm, FAttachedFileName, FDisplayFileName : TStringList;
  begin
     FTOAdr := TStringList.Create;
     FTONm := TStringList.Create;
     FCCAdr := TStringList.Create;
     FCCNm := TStringList.Create;
     FAttachedFileName := TStringList.Create;
     FDisplayFileName := TStringList.Create;

  {
  for I := Low(RecepientEMail)       to High(RecepientEMail)       do FTOAdr.Add(RecepientEMail[I]);
  for I := Low(RecepientName)       to High(RecepientName)       do FTONm.Add(RecepientName[I]);
  // for I := Low(CC)         to High(CC)         do FCCAdr.Add(CC[I]);
  // for I := Low(CCName)     to High(CCName)     do FCCNm.Add(CCName[I]);
  for I := Low(FileName)     to High(FileName)     do FAttachedFileName.Add(FileName[I]);
  for I := Low(FileName) to High(FileName) do FDisplayFileName.Add(ExtractFileName(FileName[I]));
  }
     FTOAdr.Delimiter := ';';
     FTOAdr.DelimitedText := RecepientEMail;
     FTONm.Delimiter := ';';
     FTONm.DelimitedText := RecepientName;
     FAttachedFileName.Delimiter := ';';
     FAttachedFileName.DelimitedText := FileName;
     FDisplayFileName.Delimiter := ';';
     FDisplayFileName.DelimitedText := ExtractFileName(FileName);


     // First we store the Application Handle, if not the Component might fail to send the Email or
     // your calling Program gets locked up.
     AppHandle := Application.Handle;
     PFiles := nil;  // Initialize the Attachment Pointer, to keep Delphi quiet

     MapiMessage.nRecipCount := FTOAdr.Count + FCCAdr.Count; //  + fBCCAdr.Count We need all recipients to alloc the memory
     GetMem(Recipients, MapiMessage.nRecipCount * SizeOf(TMapiRecipDesc));

     try
        with MapiMessage do
        begin
           ulReserved := 0;
           lpszSubject := PChar(Subject);
           lpszNoteText := PChar(Body);

           lpszMessageType := nil;
           lpszDateReceived := nil;
           lpszConversationID := nil;
           flFlags := 0;

           // and the sender: (MAPI_ORIG)
           Sender.ulReserved := 0;
           Sender.ulRecipClass := MAPI_ORIG;
           Sender.lpszName := PChar(SenderName);
           Sender.lpszAddress := PChar(SenderEMail);
           Sender.ulEIDSize := 0;
           Sender.lpEntryID := nil;
           lpOriginator := @Sender;

           PRecip := Recipients;

           // We have multiple recipients: (MAPI_TO) and setting up each: }
           if nRecipCount > 0 then
           begin
              for i := 1 to FTOAdr.Count do
              begin
                 PRecip^.ulReserved := 0;
                 PRecip^.ulRecipClass := MAPI_TO;
                { lpszName should carry the Name like in the
                  contacts or the adress book. }
                 PRecip^.lpszName := PChar(FTONm.Strings[i - 1]);
                { If you use this component with Outlook97 or 2000
                  and not some of Express versions you will have to set
                  'SMTP:' in front of each (email-) adress. Otherwise
                  Outlook/Mapi will try to handle the Email on itself.
                  Sounds strange, just erease the 'SMTP:', compile, compose
                  a mail and take a look at the resulting email adresses
                  (right click).
                }
                 PRecip^.lpszAddress := StrNew(PChar('SMTP:' + FTOAdr.Strings[i - 1]));
                 PRecip^.ulEIDSize := 0;
                 PRecip^.lpEntryID := nil;
                 Inc(PRecip);
              end;

              // Same with the carbon copy recipients: (CC, MAPI_CC)
              for i := 1 to FCCAdr.Count do
              begin
                 PRecip^.ulReserved := 0;
                 PRecip^.ulRecipClass := MAPI_CC;
                 PRecip^.lpszName := PChar(FCCNm.Strings[i - 1]);
                 PRecip^.lpszAddress := StrNew(PChar('SMTP:' + FCCAdr.Strings[i - 1]));
                 PRecip^.ulEIDSize := 0;
                 PRecip^.lpEntryID := nil;
                 Inc(PRecip);
              end;

            { Copia oculta:
            for i := 1 to FBCCAdr.Count do
              begin
                PRecip^.ulReserved   := 0;
                PRecip^.ulRecipClass := MAPI_BCC;
                PRecip^.lpszName     := PChar(FBCCAdr.Strings[i - 1]);
                PRecip^.lpszAddress  := StrNew(PChar('SMTP:' + FBCCAdr.Strings[i - 1]));
                PRecip^.ulEIDSize    := 0;
                PRecip^.lpEntryID    := nil;
                Inc(PRecip);
              end; }
           end;
           lpRecips := Recipients;

           // Now we process the attachments:
           nFileCount := FAttachedFileName.Count;
           if nFileCount > 0 then
           begin
              GetMem(Attachments, nFileCount * SizeOf(TMapiFileDesc));
              PFiles := Attachments;

              // Fist setting up the display names (without path):
              FDisplayFileName.Clear;
              for i := 1 to FAttachedFileName.Count do
                 FDisplayFileName.Add(ExtractFileName(FAttachedFileName[i - 1]));

              if nFileCount > 0 then
              begin
                 // Now we pass the attached file (their paths) to the structure:
                 for i := 1 to FAttachedFileName.Count do
                 begin
                    // Setting the complete Path
                    Attachments^.lpszPathName := PChar(FAttachedFileName.Strings[i - 1]);
                    // ... and the displayname:
                    Attachments^.lpszFileName := PChar(FDisplayFileName.Strings[i - 1]);
                    Attachments^.ulReserved := 0;
                    Attachments^.flFlags := 0;
                    // Position has to be -1, please see the WinApi Help for details.
                    Attachments^.nPosition := cardinal(-1);
                    Attachments^.lpFileType := nil;
                    Inc(Attachments);
                 end;
              end;
              lpFiles := PFiles;
           end
           else
           begin
              nFileCount := 0;
              lpFiles := nil;
           end;
        end;

    { Send the Mail, silent or verbose:
      Verbose means in Express a Mail is composed and shown as setup.
      In non-Express versions we show the Login-Dialog for a new
      session and after we have choosen the profile to use, the
      composed email is shown before sending

      Silent does currently not work for non-Express version. We have
      no Session, no Login Dialog so the system refuses to compose a
      new email. In Express Versions the email is sent in the
      background.

      Please Note: It seems that your success on the delivery depends
      on a combination of MAPI-Flags (MAPI_DIALOG, MAPI_LOGON_UI, ...)
      and your used OS and Office Version. I am currently using
      Win2K SP1 and Office 2K SP2 with no problems at all.
      If you experience problems on another versions, please try
      a different combination of flags for each purpose (Dialog or not).
      I would be glad to setup a table with working flags on
      each OS/Office combination, just drop me a line.

      Possible combinations are also (with Dialog):
      1. MAPI_DIALOG or MAPI_LOGON_UI MAPI_NEW_SESSION or MAPI_USE_DEFAULT
      2. MAPI_SIMPLE_DEFAULT

      See MAPI.PAS or MAPI.H (SDK) for more...
     }
        if ShowDialog then
           MError := MapiSendMail(0, AppHandle, MapiMessage, MAPI_DIALOG or MAPI_LOGON_UI, 0)
        else
           MError := MapiSendMail(0, AppHandle, MapiMessage, 0, 0);

    { Now we have to process the error messages. There are some
      defined in the MAPI unit please take a look at the unit to get
      familiar with it.
      I decided to handle USER_ABORT and SUCCESS as special and leave
      the rest to fire the "new" error event defined at the top (as
      generic error)

      Not treated as special (constants from mapi.pas):

      MAPI_E_FAILURE = 2;
      MAPI_E_LOGON_FAILURE = 3;
      MAPI_E_LOGIN_FAILURE = MAPI_E_LOGON_FAILURE;
      MAPI_E_DISK_FULL = 4;
      MAPI_E_INSUFFICIENT_MEMORY = 5;
      MAPI_E_ACCESS_DENIED = 6;
      MAPI_E_TOO_MANY_SESSIONS = 8;
      MAPI_E_TOO_MANY_FILES = 9;
      MAPI_E_TOO_MANY_RECIPIENTS = 10;
      MAPI_E_ATTACHMENT_NOT_FOUND = 11;
      MAPI_E_ATTACHMENT_OPEN_FAILURE = 12;
      MAPI_E_ATTACHMENT_WRITE_FAILURE = 13;
      MAPI_E_UNKNOWN_RECIPIENT = 14;
      MAPI_E_BAD_RECIPTYPE = 15;
      MAPI_E_NO_MESSAGES = 16;
      MAPI_E_INVALID_MESSAGE = 17;
      MAPI_E_TEXT_TOO_LARGE = 18;
      MAPI_E_INVALID_SESSION = 19;
      MAPI_E_TYPE_NOT_SUPPORTED = 20;
      MAPI_E_AMBIGUOUS_RECIPIENT = 21;
      MAPI_E_AMBIG_RECIP = MAPI_E_AMBIGUOUS_RECIPIENT;
      MAPI_E_MESSAGE_IN_USE = 22;
      MAPI_E_NETWORK_FAILURE = 23;
      MAPI_E_INVALID_EDITFIELDS = 24;
      MAPI_E_INVALID_RECIPS = 25;
      MAPI_E_NOT_SUPPORTED = 26;
    }
        Result := MError;
     finally
        FTOAdr.Free;
        FTONm.Free;
        FCCAdr.Free;
        FCCNm.Free;
        FAttachedFileName.Free;
        FDisplayFileName.Free;

        PRecip := Recipients;
        for i := 1 to MapiMessage.nRecipCount do
        begin
           StrDispose(PRecip^.lpszAddress);
           Inc(PRecip);
        end;
        FreeMem(Recipients, MapiMessage.nRecipCount * SizeOf(TMapiRecipDesc));
        if Assigned(PFiles) then
           FreeMem(PFiles, MapiMessage.nFileCount * SizeOf(TMapiFileDesc));
     end;
  end;

var
  Retorno : integer;

begin
  {
  Retorno := EnviarMAPIEmail('Assunto', 'Este é o corpi', 'Flavio', 'junior@market.com.br', True,
                              ['junior@market.com.br', 'roberval@market.com.br'],
                              [], ['C:\Eurogest.ini'], ['Suporte'] );
  }
  Retorno := SendMailMAPI('Asunto', 'Cuerpo', 'Duilio', 'duilio.isola@fleep.io', 'Duilio1;Duilio2', 'duilio.isola1@fleep.io;duilio.isola2@fleep.io', 'C:\Eurogest.ini;C:\globdata.ini');
  case Retorno of
     MAPI_E_USER_ABORT: Caption := 'Abortado por el usuario';
     SUCCESS_SUCCESS: Caption := 'Existo';
     else
        Caption := 'Error: ' + IntToStr(Retorno);
  end;
end;

procedure TFMPruebas.BVerificaIBANClick(Sender: TObject);
begin
  IBANValido('ES121234121234567890');
end;

procedure TFMPruebas.Button3Click(Sender: TObject);

  function ExpresionValida(s: string): boolean;
  var
     i : integer;
  begin
     // Asumo que no es válido
     Result := False;

     // Si es una de las tres primeras opciones, compruebo que sean solo numeros
     if ((Length(s) = 10) or (Length(s) = 11) or (Length(s) = 15) or (Length(s) = 16) or (Length(s) = 18)) then
     begin
        Result := True;
        // Recorro la cadena
        for i := 1 to Length(s) do
        begin
           // Si no es un número, la cadena no cumple los requisitos
           if not (s[i] in ['0'..'9']) then
              Result := False;
        end;
     end;

     // Si no cumple con las expresiones regulares anteriores compruebo la cuarta opción.
     if (not Result) then
     begin
        // Debe tener entre 10 y 50 caracteres
        if ((Length(s) >= 10) and (Length(s) <= 50)) then
        begin
           Result := True;
           for i := 1 to Length(s) do
           begin
              // Debe ser una letra mayúscula o un número o el guión bajo.
              if ((not (s[i] in ['A'..'Z'])) and (not (s[i] in ['0'..'9'])) and (s[i] = '_')) then
                 Result := False;
           end;
        end;
     end;
  end;

begin
  Log('123456789 Valido ' + BoolToStr(ExpresionValida('123456789'), True));
  Log('1234567890 Valido ' + BoolToStr(ExpresionValida('1234567890'), True));
  Log('12345678901 Valido ' + BoolToStr(ExpresionValida('12345678901'), True));
  Log('123456789012 Valido ' + BoolToStr(ExpresionValida('123456789012'), True));
  Log('1234567890123 Valido ' + BoolToStr(ExpresionValida('1234567890123'), True));
  Log('12345678901234 Valido ' + BoolToStr(ExpresionValida('12345678901234'), True));
  Log('123456789012345 Valido ' + BoolToStr(ExpresionValida('123456789012345'), True));
  Log('1234567890123456 Valido ' + BoolToStr(ExpresionValida('1234567890123456'), True));
  Log('12345678901234567 Valido ' + BoolToStr(ExpresionValida('12345678901234567'), True));
  Log('123456789012345678 Valido ' + BoolToStr(ExpresionValida('123456789012345678'), True));
  Log('1234567890123456789 Valido ' + BoolToStr(ExpresionValida('1234567890123456789'), True));
  Log('12345678901234567890 Valido ' + BoolToStr(ExpresionValida('12345678901234567890'), True));
  Log('A23456789 Valido ' + BoolToStr(ExpresionValida('A23456789'), True));
  Log('A234567890 Valido ' + BoolToStr(ExpresionValida('A234567890'), True));
  Log('A2345678901 Valido ' + BoolToStr(ExpresionValida('A2345678901'), True));
  Log('A23456789012 Valido ' + BoolToStr(ExpresionValida('A23456789012'), True));
  Log('A234567890123 Valido ' + BoolToStr(ExpresionValida('A234567890123'), True));
  Log('A2345678901234 Valido ' + BoolToStr(ExpresionValida('A2345678901234'), True));
  Log('A23456789012345 Valido ' + BoolToStr(ExpresionValida('A23456789012345'), True));
  Log('A234567890123456 Valido ' + BoolToStr(ExpresionValida('A234567890123456'), True));
  Log('A2345678901234567 Valido ' + BoolToStr(ExpresionValida('A2345678901234567'), True));
  Log('A23456789012345678 Valido ' + BoolToStr(ExpresionValida('A23456789012345678'), True));
  Log('A234567890123456789 Valido ' + BoolToStr(ExpresionValida('A234567890123456789'), True));
  Log('A23456789012345678901234567890123456789012345678901 Valido ' + BoolToStr(ExpresionValida('A23456789012345678901234567890123456789012345678901'), True));
end;

procedure TFMPruebas.BCalcularCodigoControlSFVClick(Sender: TObject);
var
  NumeroAutorizacion : string;
  NumeroFactura : string;
  NIT : string;
  FechaTransaccion : TDateTime;
  MontoTransaccion : double;
  LlaveDosificacion : string;
  CodigoControlObtenido : string;
  TextoCodigoQR : string;
begin
  NumeroAutorizacion := ENumeroAutorizacion.Text;
  NumeroFactura := ENumeroFactura.Text;
  NIT := ENit.Text;
  FechaTransaccion := Trunc(DTPFechaTransaccion.Date);
  MontoTransaccion := StrToFloat(EMontoTransaccion.Text);
  LlaveDosificacion := ELlaveDosificacion.Text;

  MDebug.Lines.Clear;

  CodigoControlObtenido := DameCodigoControl(NumeroAutorizacion, NumeroFactura, NIT, LlaveDosificacion, FechaTransaccion, MontoTransaccion, MDebug.Lines);

  Log(Format('Resultado esperado  : %s', [ECodigoEsperado.Text]));
  Log(Format('Resultado obtenido  : %s', [CodigoControlObtenido]));

  TextoCodigoQR := REntorno.CifEmpresa + '|' + NumeroFactura + '|' + NumeroAutorizacion + '|' + DateTimeToStr(FechaTransaccion) + '|' + FloatToStr(MontoTransaccion) + '|' + FloatToStr(0{Base}) + '|' + CodigoControlObtenido + '|' + NIT{NIT Comprador} + '|' + '0'{Importe ICE} + '|' + '0'{Importe por vnetas no gravadas} + '|' + '0'{Importe no sujeto} + '|' + '0'{Descuentos, bonificaciones};
  CrearCodigoQR(QRCode.Picture.Bitmap, TextoCodigoQR, 3);
  Log(Format('Texto Codigo QR     : %s', [TextoCodigoQR]));
end;

procedure TFMPruebas.BEjemplo1Click(Sender: TObject);
begin
  ENumeroAutorizacion.Text := '29040011007';
  ENumeroFactura.Text := '1503';
  ENIT.Text := '4189179011';
  DTPFechaTransaccion.Date := StrToDate('02/07/2007');
  EMontoTransaccion.Text := FloatToStr(2500);
  ELlaveDosificacion.Text := '9rCB7Sv4X29d)5k7N%3ab89p-3(5[A';
  ECodigoEsperado.Text := '6A-DC-53-05-14';
end;

procedure TFMPruebas.BEjemplo2Click(Sender: TObject);
begin
  ENumeroAutorizacion.Text := '7904006306693';
  ENumeroFactura.Text := '876814';
  ENIT.Text := '1665979';
  DTPFechaTransaccion.Date := StrToDate('19/05/2008');
  EMontoTransaccion.Text := FloatToStr(35958.60);
  ELlaveDosificacion.Text := 'zZ7Z]xssKqkEf_6K9uH(EcV+%x+u[Cca9T%+_$kiLjT8(zr3T9b5Fx2xG-D+_EBS';
  ECodigoEsperado.Text := '7B-F3-48-A8';
end;

procedure TFMPruebas.BEjemplo3Click(Sender: TObject);
begin
  ENumeroAutorizacion.Text := '79040011859';
  ENumeroFactura.Text := '152';
  ENIT.Text := '1026469026';
  DTPFechaTransaccion.Date := StrToDate('28/07/2007');
  EMontoTransaccion.Text := FloatToStr(135);
  ELlaveDosificacion.Text := 'A3Fs4s$)2cvD(eY667A5C4A2rsdf53kw9654E2B23s24df35F5';
  ECodigoEsperado.Text := 'FB-A6-E4-78';
end;

procedure TFMPruebas.BEjemplo4Click(Sender: TObject);
begin
  ENumeroAutorizacion.Text := '20040010113';
  ENumeroFactura.Text := '665';
  ENIT.Text := '1004141023';
  DTPFechaTransaccion.Date := StrToDate('08/01/2007');
  EMontoTransaccion.Text := FloatToStr(905.23);
  ELlaveDosificacion.Text := '442F3w5AggG7644D737asd4BH5677sasdL4%44643(3C3674F4';
  ECodigoEsperado.Text := '71-D5-61-C8';
end;

procedure TFMPruebas.BEjemplo5Click(Sender: TObject);
begin
  ENumeroAutorizacion.Text := '1904008691195';
  ENumeroFactura.Text := '978256';
  ENIT.Text := '0';
  DTPFechaTransaccion.Date := StrToDate('01/02/2008');
  EMontoTransaccion.Text := FloatToStr(26006);
  ELlaveDosificacion.Text := 'pPgiFS%)v}@N4W3aQqqXCEHVS2[aDw_n%3)pFyU%bEB9)YXt%xNBub4@PZ4S9)ct';
  ECodigoEsperado.Text := '62-12-AF-1B';
end;

procedure TFMPruebas.BEjemplo6Click(Sender: TObject);
begin
  ENumeroAutorizacion.Text := '10040010640';
  ENumeroFactura.Text := '9901';
  ENIT.Text := '1035012010';
  DTPFechaTransaccion.Date := StrToDate('13/08/2007');
  EMontoTransaccion.Text := FloatToStr(451.49);
  ELlaveDosificacion.Text := 'DSrCB7Ssdfv4X29d)5k7N%3ab8p3S(asFG5YU8477SWW)FDAQA';
  ECodigoEsperado.Text := '6A-50-31-01-32';
end;

procedure TFMPruebas.BEjemplo7Click(Sender: TObject);
begin
  ENumeroAutorizacion.Text := '30040010595';
  ENumeroFactura.Text := '10015';
  ENIT.Text := '953387014';
  DTPFechaTransaccion.Date := StrToDate('25/08/2007');
  EMontoTransaccion.Text := FloatToStr(5725.90);
  ELlaveDosificacion.Text := '33E265B43C4435sdTuyBVssD355FC4A6F46sdQWasdA)d56666fDsmp9846636B3';
  ECodigoEsperado.Text := 'A8-6B-FD-82-16';
end;

procedure TFMPruebas.ELecturaKeyPress(Sender: TObject; var Key: char);
begin
  if Key = #13 then
  begin
     Log(Format('Leido : %s', [ELectura.Text]));
     ELectura.Text := '';
  end;
end;

procedure TFMPruebas.BNumeroALetraClick(Sender: TObject);
var
  Letras : TLetra;
  i : integer;
  d : double;
begin
  Letras := TLetra.Create(nil);
  try
     Letras.Numero := 0;
     // Datos de configuracion segun moneda
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT * FROM SYS_MONEDAS WHERE MONEDA = :MONEDA';
           Params.ByName['MONEDA'].AsString := 'EUR';
           ExecQuery;
           Letras.Moneda := LowerCase(FieldByName['TITULO'].AsString);
           Letras.GeneroMasculino := (FieldByName['GENERO_MASCULINO'].AsInteger = 1);
           Letras.Decimales := FieldByName['DEC_VER'].AsInteger;
           Letras.DescDecimales := FieldByName['DESC_DECIMALES'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Negativos
     for i := -100 to 0 do
     begin
        d := i;
        Letras.Numero := d;
        Log(Letras.AsString);
     end;

     // Positivos
     for i := 0 to 100 do
     begin
        d := i;
        Letras.Numero := d;
        Log(Letras.AsString);
     end;

     // Con decimales
     for i := 0 to 100 do
     begin
        d := 100 + (i * 0.01);
        Letras.Numero := d;
        Log(Letras.AsString);
     end;

  finally
     Letras.Free;
  end;
end;

procedure TFMPruebas.BLeerCSVClick(Sender: TObject);
var
  URL : string;
  HTMLBody : string;
  IdHTTP : TIdHTTP;
  i, j : integer;
  slCSV, slCSVLine : TStrings;
begin
  // cloudtime-eu.com/webServiceLogicart/curl.php?fecha_inicial=2019/02/14&fecha_final=2019/02/14&cliente=001&maquina=2003
  URL := EURLCSV.Text;
  URL := URL + '?fecha_inicial=' + FormatDateTime('yyyy/mm/dd', DEDesdeFecha.Date);
  URL := URL + '&fecha_final=' + FormatDateTime('yyyy/mm/dd', DEHastaFecha.Date);
  URL := URL + '&cliente=' + Trim(ECliente.Text);
  URL := URL + '&maquina=' + Trim(EMaquina.Text);

  MDebug.Lines.Clear;
  LogIni('Descarga CSV');
  Log(URL);
  // ¿Estamos conectados a Internet?
  if WinInet.InternetGetConnectedState(nil, 0) then
  begin
     IdHTTP := TIdHTTP.Create(Application);
     try
        try
           HTMLBody := IdHTTP.Get(URL);
        except
           on e: Exception do
           begin
              Log(e.message);
           end;
        end;

        HTMLBody := StringReplace(HTMLBody, #10, #13#10, [rfReplaceAll]);
        Log(HTMLBody);

        // Ejemplo
        // Cantidad, CentroCoste, CodigoExterno, CodigoPersona, DescripcionMaquina, DescripcionProducto, Direccion, Empresa(este es el campo cliente), Fecha, IdentificadorPersona, Maquina, Producto
        // 1,,132820103,1351,"MAGNA MIRRORS","PAR GUANTES 500G2P URETAN GRIS 7",,001,2019/02/18,4,1,132820103
        // 1,,132820102,1352,"MAGNA MIRRORS","PAR GUANTES 500G2P URETAN GRIS 6",,001,2019/02/18,5,1,132820102
        // 1,,132820103,1355,"MAGNA MIRRORS","PAR GUANTES 500G2P URETAN GRIS 7",,001,2019/02/18,8,1,132820103

        slCSV := TStringList.Create;
        try
           slCSV.Text := HTMLBody;

           for i := 0 to slCSV.Count - 1 do
           begin
              LogIni(Format('Registro %d', [i]));

              slCSVLine := TStringList.Create;
              try
                 slCSVLine.CommaText := slCSV[i];
                 for j := 0 to slCSVLine.Count - 1 do
                    Log(Format('Campo %d: %s', [j, slCSVLine[j]]));
              finally
                 slCSVLine.Free
              end;

              LogFin(Format('Registro %d', [i]));
           end;
        finally
           slCSV.Free
        end;
     finally
        IdHTTP.Free;
     end;
  end;
  LogFin('Descarga CSV');
end;

procedure TFMPruebas.TSNotasShow(Sender: TObject);
begin
  with DMPruebas.xArticulos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM ART_ARTICULOS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = 1 AND ');
     SelectSQL.Add(' ARTICULO = ''.'' ');
     Open;
  end;
end;

procedure TFMPruebas.BPasteClipboardClick(Sender: TObject);
var
  i : integer;

  f : THandle;
  buffer : array [0..MAX_PATH] of char;
  {i,} c : integer;
  aSL : TStringList;
begin
  MDebug.Lines.Clear;

  for i := 0 to Clipboard.FormatCount - 1 do
     Log(IntToStr(Clipboard.Formats[i]));

{
CF_TEXT           Text with a CR-LF combination at the end of each line. A null character identifies the end of the text.
CF_BITMAP   A Windows bitmap graphic.
CF_METAFILEPICT   A Windows metafile graphic.
CF_PICTURE   An object of type TPicture.
CF_COMPONENT   Any persistent object.
CF_HDROP        List of files/folders
}
  if Clipboard.HasFormat(CF_TEXT) then
  begin
     Log('Clipboard.AsText is CF_TEXT');
     Log(Clipboard.AsText);
  end
  else
  if Clipboard.HasFormat(CF_BITMAP) then
  begin
     Log('Clipboard.AsText is CF_BITMAP');
     Log('Asigno imagen');
     // Log(Clipboard.AsText);
     Imagen.Picture.Bitmap.Assign(Clipboard);
     Imagen.Picture.SaveToFile('C:\Prueba.bmp');
  end
  else
  if Clipboard.HasFormat(CF_METAFILEPICT) then
  begin
     Log('Clipboard.AsText is CF_METAFILEPICT');
     Log(Clipboard.AsText);
  end
  else
  if Clipboard.HasFormat(CF_PICTURE) then
  begin
     Log('Clipboard.AsText is CF_PICTURE');
     Log('Asigno imagen');
     // Log(Clipboard.AsText);
     Imagen.Picture.Assign(Clipboard);
  end
  else
  if Clipboard.HasFormat(CF_COMPONENT) then
  begin
     Log('Clipboard.AsText is CF_COMPONENT');
     Log(Clipboard.AsText);
  end
  else
  if Clipboard.HasFormat(CF_HDROP) then
  begin
     Log('Clipboard.AsText is CF_HDROP');

     aSL := TStringList.Create;
     try
        Clipboard.Open;
        try
           f := Clipboard.GetAsHandle(CF_HDROP);
           if f <> 0 then
           begin
              c := DragQueryFile(f, $FFFFFFFF, nil, 0);
              for i := 0 to c - 1 do
              begin
                 buffer[0] := #0;
                 DragQueryFile(f, i, buffer, SizeOf(buffer));
                 aSL.Add(buffer);
              end;
           end;
        finally
           Clipboard.Close;
        end;

        if c <> 0 then
        begin
           for i := 0 to aSL.Count - 1 do
              Log(aSL[i]);
        end
        else
           Log('No hay ficheros');
     finally
        aSL.Free;
     end;
  end;
end;

procedure TFMPruebas.BPruebaExportacionCSVSQLClick(Sender: TObject);
var
  Fichero : string;
  ts : TStrings;
begin
  Fichero := GetSpecialFolderPath(CSIDL_PERSONAL, True) + '\Prueba-' + FormatDateTime('yyyymmdd-hhnnss', Now) + '.csv';
  ts := TStringList.Create;
  try
     with ts do
     begin
        Clear;
        Add(' SELECT * FROM ART_ARTICULOS ');
        Add(' WHERE ');
        Add(' FAMILIA <> ''SYS'' ');
        Add(' ORDER BY ARTICULO ');
     end;

     ExportarCSV(Fichero, ts.Text);
  finally
     ts.Free;
  end;
end;

procedure TFMPruebas.BPruebaExportacionCSVDataSourceClick(Sender: TObject);
var
  Fichero : string;
begin
  Fichero := GetSpecialFolderPath(CSIDL_PERSONAL, True) + '\Prueba-' + FormatDateTime('yyyymmdd-hhnnss', Now) + '.csv';

  with DMPruebas.xArticulos do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM ART_ARTICULOS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' FAMILIA <> ''SYS'' ');
     SelectSQL.Add(' ORDER BY ARTICULO ');
     Open;
  end;

  ExportarCSV(Fichero, DMPruebas.DSxArticulos);
end;

procedure TFMPruebas.TSOrdenShow(Sender: TObject);
begin
  DMPruebas.AbreOrden;
  MDebug.Lines.Add('Ultimo registro de ordenes');
end;

procedure TFMPruebas.BSubirArchivoClick(Sender: TObject);
begin
  Log(format('Subiendo %s a %s.', [EURLEvnioFichero.Text, EFicheroSubir.Text]));
  if DMPruebas.SubirArchivo(EURLEvnioFichero.Text, EFicheroSubir.Text) then
     Log('Fichero subido.')
  else
     Log('Se ha producido un error al subir el fichero.');
end;

procedure TFMPruebas.EPSURLBaseChange(Sender: TObject);
begin
  inherited;
  ELlamadaWebService.Text := Copy(EPSURLBase.Text, 1, Pos('//', EPSURLBase.Text) + 1);
  ELlamadaWebService.Text := ELlamadaWebService.Text + EPSToken.Text + '@';
  ELlamadaWebService.Text := ELlamadaWebService.Text + Copy(EPSURLBase.Text, Pos('//', EPSURLBase.Text) + 2, Length(EPSURLBase.Text));
  ELlamadaWebService.Text := ELlamadaWebService.Text + EPSResource.Text;
end;

procedure TFMPruebas.TSPrestasopShow(Sender: TObject);
begin
  inherited;
  EPSURLBaseChange(Sender);
end;

procedure TFMPruebas.BBorrarClick(Sender: TObject);
var
  Envio, Respuesta : TStrings;
  CodigoRespuesta : integer;
  Opciones : string;
begin
  inherited;
  BBorrarMemo.Click;

  LogIni('Llamada a Prestashop - Borrar');

  // ¿Estamos conectados a Internet?
  if WinInet.InternetGetConnectedState(nil, 0) then
  begin
     Envio := TStringList.Create;
     Respuesta := TStringList.Create;
     try
        Opciones := '';
        CodigoRespuesta := DMPrestashop.WS_Delete(EPSResource.Text, StrToInt(EPSId.Text), Respuesta);

        Log(Format('Recurso: %s - Id: %d - Opciones: %s', [EPSResource.Text, StrToInt(EPSId.Text), Opciones]));
        Log(Format('Envio' + #13#10 + '%s', [Envio.Text]));
        Log(Format('Codigo de Respuesta: %d' + #13#10 + 'Respuesta' + #13#10 + '%s', [CodigoRespuesta, Respuesta.Text]));
     finally
        Envio.Free;
        Respuesta.Free;
     end;
  end;
  Log('-------------------------------------------------------------------------');
end;

procedure TFMPruebas.BListaClick(Sender: TObject);
var
  //Nodo : IXMLNode;
  Envio, Respuesta : TStrings;
  CodigoRespuesta : integer;
begin
  inherited;
  BBorrarMemo.Click;

  LogIni('Llamada a Prestashop - Lista');

  // ¿Estamos conectados a Internet?
  if WinInet.InternetGetConnectedState(nil, 0) then
  begin
     Envio := TStringList.Create;
     Respuesta := TStringList.Create;
     try
        CodigoRespuesta := DMPrestashop.WS_Get(EPSResource.Text, 0, EPSOpciones.Text, Respuesta);
        Log(Format('Recurso: %s - Id: %d - Opciones: %s', [EPSResource.Text, 0, EPSOpciones.Text]));
        Log(Format('Envio' + #13#10 + '%s', [Envio.Text]));
        Log(Format('Codigo de Respuesta: %d' + #13#10 + 'Respuesta' + #13#10 + '%s', [CodigoRespuesta, Respuesta.Text]));
     finally
        Envio.Free;
        Respuesta.Free;
     end;
  end;
  Log('-------------------------------------------------------------------------');
end;

procedure TFMPruebas.BWSInicializarClick(Sender: TObject);
begin
  inherited;
  with DMPrestashop do
  begin
     WS_Inicializa(EPSURLBase.Text, EPSToken.Text, 'unknown', False);
     WS_DameRecursos(EPSResource.Items);
     EPSResource.ItemIndex := 0;
  end;
end;

procedure TFMPruebas.BPSSynopsisClick(Sender: TObject);
var
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Opciones : string;
begin
  inherited;
  BBorrarMemo.Click;

  LogIni('Llamada a Prestashop - Blank');

  // ¿Estamos conectados a Internet?
  if WinInet.InternetGetConnectedState(nil, 0) then
  begin
     Opciones := '&schema=synopsis';

     Respuesta := TStringList.Create;
     try
        CodigoRespuesta := DMPrestashop.WS_Get(EPSResource.Text, 0, Opciones, Respuesta);

        Log(Format('Recurso: %s - Id: %d - Opciones: %s', [EPSResource.Text, 0, Opciones]));
        Log(Format('Envio' + #13#10 + '%s', ['']));
        Log(Format('Codigo de Respuesta: %d' + #13#10 + 'Respuesta' + #13#10 + '%s', [CodigoRespuesta, Respuesta.Text]));
     finally
        Respuesta.Free;
     end;
  end;
  Log('-------------------------------------------------------------------------');
end;

procedure TFMPruebas.BPS_BlankClick(Sender: TObject);
var
  Respuesta : TStrings;
  CodigoRespuesta : integer;
  Opciones : string;
begin
  inherited;
  BBorrarMemo.Click;

  LogIni('Llamada a Prestashop - Blank');

  // ¿Estamos conectados a Internet?
  if WinInet.InternetGetConnectedState(nil, 0) then
  begin
     Opciones := '&schema=blank';

     Respuesta := TStringList.Create;
     try
        CodigoRespuesta := DMPrestashop.WS_Get(EPSResource.Text, 0, Opciones, Respuesta);

        Log(Format('Recurso: %s - Id: %d - Opciones: %s', [EPSResource.Text, 0, Opciones]));
        Log(Format('Envio' + #13#10 + '%s', ['']));
        Log(Format('Codigo de Respuesta: %d' + #13#10 + 'Respuesta' + #13#10 + '%s', [CodigoRespuesta, Respuesta.Text]));
     finally
        Respuesta.Free;
     end;
  end;
  Log('-------------------------------------------------------------------------');
end;

procedure TFMPruebas.BPSCrearClick(Sender: TObject);
var
  Nodo : IXMLNode;
  Envio, Respuesta : TStrings;
  CodigoRespuesta : integer;
  Opciones : string;

  function DameNodo(Nodo: IXMLNode; a: array of string): IXMLNode;
  var
     i : integer;
  begin
     Result := nil;
     i := 0;

     while (Assigned(Nodo) and (i < Length(a))) do
     begin
        Nodo := Nodo.ChildNodes.FindNode(a[i]);
        Inc(i);
     end;

     Result := Nodo;
  end;

  function DameDato(Nodo: IXMLNode; a: array of string): string;
  var
     i : integer;
  begin
     Result := '';
     i := 0;

     while (Assigned(Nodo) and (i < Length(a))) do
     begin
        Nodo := Nodo.ChildNodes.FindNode(a[i]);
        Inc(i);
     end;

     if Assigned(Nodo) then
     begin
        if Nodo.IsTextElement then
           Result := Nodo.Text;
        if Nodo.NodeType = ntCData then
           Result := Nodo.NodeValue;
        if Nodo.NodeType = ntElement then
        begin
           Nodo := Nodo.ChildNodes.First;
           if Nodo.NodeType = ntCData then
              Result := Nodo.NodeValue;
        end;
     end;
  end;

begin
  inherited;
  BBorrarMemo.Click;

  /// Documento debe contener el XML de cliente en blanco, para poder rellenar con los datos del cliente a insertar.
  /// Para esto primero se debe llamar a [Blank]

  LogIni('Llamada a Prestashop - Crear');

  // ¿Estamos conectados a Internet?
  if WinInet.InternetGetConnectedState(nil, 0) then
  begin

     // Primero obtenemos el recurso en blanco para rellenarlo
     Opciones := '&schema=blank';

     Envio := TStringList.Create;
     Respuesta := TStringList.Create;
     try
        CodigoRespuesta := DMPrestashop.WS_Get(EPSResource.Text, 0, Opciones, Respuesta);

        Log(Format('Recurso: %s - Id: %d - Opciones: %s', [EPSResource.Text, 0, Opciones]));
        Log(Format('Envio' + #13#10 + '%s', ['']));
        Log(Format('Codigo de Respuesta: %d' + #13#10 + 'Respuesta' + #13#10 + '%s', [CodigoRespuesta, Respuesta.Text]));

        // Relleno nombre, apellido y correo electronico
        with TXMLDocument.Create(Self) do
        begin
           try
              XML.Text := Respuesta.Text;

              // Esto parsea el documento y lo deja listo para trabajar con el
              if not Active then
                 Active := True;

              Nodo := DameNodo(DocumentElement, ['customer', 'lastname']);
              if Assigned(Nodo) then
                 Nodo.Text := Elastname.Text;

              Nodo := DameNodo(DocumentElement, ['customer', 'firstname']);
              if Assigned(Nodo) then
                 Nodo.Text := Efirstname.Text;

              Nodo := DameNodo(DocumentElement, ['customer', 'email']);
              if Assigned(Nodo) then
                 Nodo.Text := Eemail.Text;

              Envio.Text := XML.Text;
           finally
              Free;
           end;
        end;

        CodigoRespuesta := DMPrestashop.WS_Add(EPSResource.Text, Envio, Respuesta);
        Log(Format('Recurso: %s - Id: %d - Opciones: %s', [EPSResource.Text, 0, Opciones]));
        Log(Format('Envio' + #13#10 + '%s', [Envio.Text]));
        Log(Format('Codigo de Respuesta: %d' + #13#10 + 'Respuesta' + #13#10 + '%s', [CodigoRespuesta, Respuesta.Text]));

        // Obtengo el ID creado
        with TXMLDocument.Create(Self) do
        begin
           try
              XML.Text := Respuesta.Text;

              // Esto parsea el documento y lo deja listo para trabajar con el
              if not Active then
                 Active := True;

              Log('Id creado: %s' + DameDato(DocumentElement, ['customer', 'id']));
           finally
              Free;
           end;
        end;
     finally
        Envio.Free;
        Respuesta.Free;
     end;
  end;
  Log('-------------------------------------------------------------------------');
end;

procedure TFMPruebas.BModificarClick(Sender: TObject);
var
  Nodo : IXMLNode;
  Envio, Respuesta : TStrings;
  CodigoRespuesta : integer;
  Opciones : string;

  function DameNodo(Nodo: IXMLNode; a: array of string): IXMLNode;
  var
     i : integer;
  begin
     Result := nil;
     i := 0;

     while (Assigned(Nodo) and (i < Length(a))) do
     begin
        Nodo := Nodo.ChildNodes.FindNode(a[i]);
        Inc(i);
     end;

     Result := Nodo;
  end;

  function DameDato(Nodo: IXMLNode; a: array of string): string;
  var
     i : integer;
  begin
     Result := '';
     i := 0;

     while (Assigned(Nodo) and (i < Length(a))) do
     begin
        Nodo := Nodo.ChildNodes.FindNode(a[i]);
        Inc(i);
     end;

     if Assigned(Nodo) then
     begin
        if Nodo.IsTextElement then
           Result := Nodo.Text;
        if Nodo.NodeType = ntCData then
           Result := Nodo.NodeValue;
        if Nodo.NodeType = ntElement then
        begin
           Nodo := Nodo.ChildNodes.First;
           if Nodo.NodeType = ntCData then
              Result := Nodo.NodeValue;
        end;
     end;
  end;

begin
  inherited;
  BBorrarMemo.Click;

  /// Documento debe obtener el XML de cliente para poder rellenar con los datos del cliente a modificar.

  LogIni('Llamada a Prestashop - Modificar');

  // ¿Estamos conectados a Internet?
  if WinInet.InternetGetConnectedState(nil, 0) then
  begin
     Envio := TStringList.Create;
     Respuesta := TStringList.Create;
     try
        // Obtengo el recurso segun el ID
        Opciones := '';
        CodigoRespuesta := DMPrestashop.WS_Get(EPSResource.Text, StrToInt(EPSId.Text), '', Respuesta);
        Log(Format('Recurso: %s - Id: %d - Opciones: %s', [EPSResource.Text, StrToInt(EPSId.Text), Opciones]));
        Log(Format('Envio' + #13#10 + '%s', [Envio.Text]));
        Log(Format('Codigo de Respuesta: %d' + #13#10 + 'Respuesta' + #13#10 + '%s', [CodigoRespuesta, Respuesta.Text]));

        // Modifico partes del recurso
        with TXMLDocument.Create(Self) do
        begin
           try
              XML.Text := Respuesta.Text;

              // Esto parsea el documento y lo deja listo para trabajar con el
              if not Active then
                 Active := True;

              Nodo := DameNodo(DocumentElement, ['customer', 'lastname']);
              if Assigned(Nodo) then
                 Nodo.Text := UpperCase(Elastname.Text);

              Nodo := DameNodo(DocumentElement, ['customer', 'firstname']);
              if Assigned(Nodo) then
                 Nodo.Text := UpperCase(Efirstname.Text);

              Nodo := DameNodo(DocumentElement, ['customer', 'email']);
              if Assigned(Nodo) then
                 Nodo.Text := Eemail.Text;

              Envio.Text := XML.Text;
           finally
              Free;
           end;
        end;

        Respuesta.Text := '';
        CodigoRespuesta := DMPrestashop.WS_Edit(EPSResource.Text, StrToInt(EPSId.Text), Envio, Respuesta);

        Log(Format('Recurso: %s - Id: %d - Opciones: %s', [EPSResource.Text, StrToInt(EPSId.Text), Opciones]));
        Log(Format('Envio' + #13#10 + '%s', [Envio.Text]));
        Log(Format('Codigo de Respuesta: %d' + #13#10 + 'Respuesta' + #13#10 + '%s', [CodigoRespuesta, Respuesta.Text]));
     finally
        Envio.Free;
        Respuesta.Free;
     end;
  end;
  Log('-------------------------------------------------------------------------');
end;

procedure TFMPruebas.BInicializarClick(Sender: TObject);
begin
  inherited;
  DMSafemoney.Inicializar;
  tmrSafemoney.Enabled := False;
end;

procedure TFMPruebas.BCobrarClick(Sender: TObject);
begin
  inherited;
  DMSafemoney.ImporteACobrar := StrToFloat(EImporteACobrar.Text);
  tmrSafemoney.Enabled := True;
end;

procedure TFMPruebas.tmrSafemoneyTimer(Sender: TObject);
begin
  inherited;
  tmrSafemoney.Enabled := False;
  try
     with mSafemoney.Lines do
     begin
        Clear;
        Add(format('Hora                   : %s', [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now)]));
        Add(format('Importe a Cobrar       : %9.2f', [DMSafemoney.ImporteACobrar]));
        Add(format('Importe Cobrado Parcial: %9.2f', [DMSafemoney.ImporteCobradoParcial]));
        Add(format('Importe Cobrado        : %9.2f', [DMSafemoney.ImporteCobrado]));
        Add(format('Cambio Entregado       : %9.2f', [DMSafemoney.CambioEntregado]));
        Add(format('Cambio No Entregado    : %9.2f', [DMSafemoney.CambioNoEntregado]));
        Add(format('Error De Cobro         : %s', [DMSafemoney.ErrorDeCobro]));
     end;

     if (DMSafemoney.OperacionTerminada) then
     begin
        if (DMSafemoney.ImporteCobrado > StrToFloat(EImporteACobrar.Text)) then
           mSafemoney.Lines.Add('COBRADO')
        else
        if (DMSafemoney.ErrorDeCobro <> '') then
           mSafemoney.Lines.Add('ERROR DE COBRO')
        else
           mSafemoney.Lines.Add('OPERACION CANCELADA');
     end;
  finally
     tmrSafemoney.Enabled := not DMSafemoney.OperacionTerminada;
  end;
end;

procedure TFMPruebas.BCancelarCobroClick(Sender: TObject);
begin
  inherited;
  DMSafemoney.Cancelar;
  mSafemoney.Lines.Add('CANCELADO');
  tmrSafemoney.Tag := 0;
  tmrSafemoney.Enabled := False;
end;

procedure TFMPruebas.BTimerCobroClick(Sender: TObject);
begin
  inherited;
  with BTimerCobro do
  begin
     if (Tag = 0) then
     begin
        tmrSafemoney.Enabled := True;
        Tag := 1;
        Caption := 'Refresco OFF';
     end
     else
     begin
        tmrSafemoney.Enabled := False;
        Tag := 0;
        Caption := 'Refresco ON';
     end;
  end;
end;

procedure TFMPruebas.BSeleccionFicheroExcelStringgridClick(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  Archivo := EFicheroExcelStringgrid.Text;
  if MyOpenDialog(Archivo, 'ODS,XLS') then
     EFicheroExcelStringgrid.Text := Archivo;
end;

procedure TFMPruebas.BLeerExcelStringGridClick(Sender: TObject);
var
  HCalc : THojaCalc;
  //s : string;
  Archivo : string;

  f, c, x, y : integer;
begin
  inherited;
  Archivo := EFicheroExcelStringgrid.Text;

  HCalc := THojaCalc.Create(Archivo, False); // OpenOffice doc if possible, please
  try
     Log('HCalc.FileName = ' + Archivo);
     HCalc.FileName := Archivo; // Needs a file name before you SaveDoc!

     // Log('HCalc.ActivateSheetByName(' + Hoja + ')');
     // HCalc.ActivateSheetByName(Hoja, False);
     HCalc.ActivateSheetByIndex(1);

     Log('HCalc.Last Row/Col');
     x := HCalc.LastRow + 1;
     y := HCalc.LastCol + 1;
     Log(format('LastRow:%d - LastCol:%d', [x, y]));

     sgPrueba.RowCount := x;
     sgPrueba.ColCount := y;

     for c := 1 to y do
     begin
        for f := 1 to x do
        begin
           try
              sgPrueba.Cells[c, f] := Trim(HCalc.CellText[f, c]);
           except
              sgPrueba.Cells[c, f] := _('ERROR');
           end;
        end;
     end;

           {
           // Se eliminan las columnas vacías
           DMMain.Log(format('Eliminando Columna Vacia: %d', [c]));
           }

           {
           // Se elimanan las filas vacías.
           DMMain.Log('Eliminando filas vacias');

           for f := 0 to x - 1 do
           begin
              StrList := TStringList.Create;
              for c := 0 to Columnas.Count - 1 do
                 StrList.Add((Columnas.Items[c] as TStrings)[f]);

              if Trim(StrList.Text) <> '' then
                 Filas.Add(StrList)
              else
              begin
                 DMMain.Log(format('Eliminando Fila Vacia: %d', [f]));
                 StrList.Free;
              end;
           end;
           }

     Log('Fin importacion');
  finally
     Sleep(1000);
     Log('I Liberar Excel');
     HCalc.Free;
  end;
end;

procedure TFMPruebas.BClick2CallClick(Sender: TObject);
begin
  inherited;
  AbreData(TDMNet2Phone, DMNet2Phone);

  if (DMNet2Phone.WS_Inicializa(EToken.Text)) then
     DMNet2Phone.WS_click2call(StrToIntDef(EExtension.Text, 0), ETelefono.Text);

  CierraData(DMNet2Phone);
end;

procedure TFMPruebas.BJSONObtenerHijosClick(Sender: TObject);
var
  Documento, NodoPadre, Nodo : TlkJSONBase;
  i : integer;
begin
  inherited;
  MDebug.Lines.Clear;
  Documento := TlkJSON.ParseText(MJSON.Lines.Text);
  try
     if Assigned(Documento) then
     begin
        MDebug.Lines.Add(format('Documento.Count : %d', [Documento.Count]));

        MDebug.Lines.Add(format('Nodo Padre      : %s', [ENodoJSONPadre.Text]));
        // Buscon el nodo padre
        NodoPadre := TlkJSONObject(Documento).Field[ENodoJSONPadre.Text];
        if Assigned(NodoPadre) then
        begin
           MDebug.Lines.Add(format('NodoPadre.Count : %d', [NodoPadre.Count]));

           // Recorro hijos
           for i := 0 to NodoPadre.Count - 1 do
           begin
              Nodo := NodoPadre.Child[i];
              if Assigned(Nodo) then
                 MDebug.Lines.Add(format('Nodo %d - %s : %s', [i, TlkJSONobjectmethod(Nodo).Name, TlkJSONobjectmethod(Nodo).ObjValue.Value]))
              else
                 MDebug.Lines.Add(format('Nodo %d - No se pudo obtener nodo', [i]));
           end;
        end
        else
           MDebug.Lines.Add('No existe nodo padre');
     end
     else
        MDebug.Lines.Add('No se puede abrir documento');
  finally
     Documento.Free;
  end;
end;

procedure TFMPruebas.BJSONObtenerValorHijoClick(Sender: TObject);
var
  Documento, NodoPadre, Nodo : TlkJSONbase;
begin
  inherited;
  MDebug.Lines.Clear;
  MDebug.Lines.Add('Nodo Padre   : ' + ENodoJSONPadre.Text);
  Documento := TlkJSON.ParseText(MJSON.Lines.Text);
  try
     if Assigned(Documento) then
     begin
        MDebug.Lines.Add('Nodo Hijo    : ' + ENodoJSONHijo.Text);

        // Buscon el nodo padre
        NodoPadre := Documento.Field[ENodoJSONPadre.Text];
        if Assigned(NodoPadre) then
        begin
           // Buscon el hijo
           Nodo := NodoPadre.Field[ENodoJSONHijo.Text];

           if Assigned(Nodo) then
           begin
              MDebug.Lines.Add('Valor (Field): ' + NodoPadre.Field[ENodoJSONHijo.Text].Value);
              MDebug.Lines.Add('Valor (Value): ' + Nodo.Value);
           end
           else
              MDebug.Lines.Add('No existe nodo hijo');
        end
        else
           MDebug.Lines.Add('No existe nodo padre');
     end
     else
        MDebug.Lines.Add('No se puede abrir documento');
  finally
     Documento.Free;
  end;
end;

procedure TFMPruebas.BCRC8Click(Sender: TObject);
begin
  inherited;
  MDebug.Lines.Add(ETBAI.Text + format('%.3d', [CalcCRC8Str(ETBAI.Text)]));
end;

procedure TFMPruebas.BGetRegistroClick(Sender: TObject);
begin
  inherited;
  // Create the Object
  with TRegistry.Create(KEY_READ or 512 {KEY_WOW64_64KEY}) do
  begin
     try
        // ReadOnly
        // KEY_WOW64_64KEY : (0x0100 = 256) Acceda a una clave de 64 bits desde una aplicación de 32 o 64 bits.
        // KEY_WOW64_32KEY : (0x0200 = 512) Acceda a una clave de 32 bits desde una aplicación de 32 o 64 bits.
        Access := KEY_READ or 512{KEY_WOW64_64KEY};

        // Sets the destination for our requests
        case rgRegistro.ItemIndex of
           0:
           begin
              RootKey := HKEY_LOCAL_MACHINE;
              MDebug.Lines.Add(format(_('RootKey: %s'), ['HKEY_LOCAL_MACHINE']));
           end;
           1:
           begin
              RootKey := HKEY_CURRENT_USER;
              MDebug.Lines.Add(format(_('RootKey: %s'), ['HKEY_CURRENT_USER']));
           end;
        end;

        MDebug.Lines.Add(format(_('Key: %s'), [ERutaRegistro.Text]));
        MDebug.Lines.Add(format(_('Field: %s'), [EClaveRegistro.Text]));
        // Check if whe can open our key
        if OpenKeyReadOnly(ERutaRegistro.Text) then
        begin
           // Is our field availbe
           if ValueExists(EClaveRegistro.Text) then
              // Read the value from the field
              MDebug.Lines.Add(format(_('Value: %s'), [ReadString(EClaveRegistro.Text)]))
           else
              MDebug.Lines.Add(format(_('Value: %s'), ['***No existe***']));
        end
        else
           // There is a big error if we get an errormessage by
           // opening the key
           MDebug.Lines.Add(format(_('Error abriendo : %s'), [ERutaRegistro.Text]));
        CloseKey;
     finally
        Free;
     end;
  end;
  MDebug.Lines.Add('------------');
end;

procedure TFMPruebas.BXMLObtenerHijosClick(Sender: TObject);
var
  Nodo, NodoHijo : IXMLNode;
  i : integer;
  NS, Tipo, Nombre, Prefijo, Valor : string;

  function DameNodo(Nodo: IXMLNode; a: array of string): IXMLNode;
  var
     i : integer;
  begin
     Result := nil;
     i := 0;

     while (Assigned(Nodo) and (i < Length(a))) do
     begin
        Nodo := Nodo.ChildNodes.FindNode(a[i]);
        Inc(i);
     end;

     Result := Nodo;
  end;

  function DameDato(Nodo: IXMLNode; a: array of string): string;
  var
     i : integer;
  begin
     Result := '';
     i := 0;

     while (Assigned(Nodo) and (i < Length(a))) do
     begin
        Nodo := Nodo.ChildNodes.FindNode(a[i]);
        Inc(i);
     end;

     if Assigned(Nodo) then
     begin
        if Nodo.IsTextElement then
           Result := Nodo.Text;
        if Nodo.NodeType = ntCData then
           Result := Nodo.NodeValue;
        if Nodo.NodeType = ntElement then
        begin
           Nodo := Nodo.ChildNodes.First;
           if Nodo.NodeType = ntCData then
              Result := Nodo.NodeValue;
        end;
     end;
  end;

begin
  inherited;
  MDebug.Lines.Clear;

  // Formateo XML
  Documento := TXMLDocument.Create(Self);
  try
     with Documento do
     begin
        // Borro los datos que pudiera haber
        XML.Text := '';

        // Cargo datos
        XML.Text := MXML.Text;

        Active := True;
        Encoding := 'utf-8';

        i := 0;
        Nodo := DocumentElement;

        while Assigned(Nodo) do
        begin
           Valor := '';
           Nombre := Nodo.LocalName;
           Prefijo := Nodo.Prefix;
           NS := Nodo.NamespaceURI;

           if Nodo.IsTextElement then
           begin
              Tipo := 'IsTextElement';
              Valor := Nodo.Text;
           end;
           if Nodo.NodeType = ntCData then
              Tipo := 'ntCData';
           if Nodo.NodeType = ntElement then
              Tipo := 'ntElement';

           MDebug.Lines.Add(format('Nodo %d (%s) %s %s (NS: %s) = %s', [i, Tipo, Nombre, Prefijo, NS, Valor]));

           NodoHijo := Nodo.ChildNodes.First;
           while Assigned(NodoHijo) do
           begin
              Valor := '';
              Nombre := NodoHijo.LocalName;
              Prefijo := NodoHijo.Prefix;
              NS := NodoHijo.NamespaceURI;
              if NodoHijo.IsTextElement then
              begin
                 Tipo := 'IsTextElement';
                 Valor := NodoHijo.Text;
              end;
              if NodoHijo.NodeType = ntCData then
                 Tipo := 'ntCData';
              if NodoHijo.NodeType = ntElement then
                 Tipo := 'ntElement';

              MDebug.Lines.Add(format('   Hijo %d (%s) %s %s (NS: %s) = %s', [i, Tipo, Nombre, Prefijo, NS, Valor]));

              NodoHijo := NodoHijo.NextSibling;
              Inc(i);
           end;

           Nodo := Nodo.NextSibling;
           Inc(i);
        end;

        // Borro los datos
        XML.Text := '';
     end;
  finally
     Documento.Free;
  end;
end;

procedure TFMPruebas.BXMLCargarArchivoClick(Sender: TObject);
begin
  inherited;
  MXML.Lines.LoadFromFile(EXMLFichero.Text);
end;

procedure TFMPruebas.BXMLObtenerHijosNodoPadreClick(Sender: TObject);
var
  Nodo : IXMLNode;
  //NodoHijo : IXMLNode;
  //i : integer;
  //Tipo, Nombre, Prefijo : string;
  Valor : string;
  a : array of string;

  function DameNodo(Nodo: IXMLNode; a: array of string): IXMLNode;
  var
     i : integer;
  begin
     Result := nil;
     i := 0;

     while (Assigned(Nodo) and (i < Length(a))) do
     begin
        Nodo := Nodo.ChildNodes.FindNode(a[i]);
        Inc(i);
     end;

     Result := Nodo;
  end;

  function DameDato(Nodo: IXMLNode; a: array of string): string;
  var
     i : integer;
  begin
     Result := '';
     i := 0;

     while (Assigned(Nodo) and (i < Length(a))) do
     begin
        Nodo := Nodo.ChildNodes.FindNode(a[i], '');
        Inc(i);
     end;

     if (Assigned(Nodo)) then
     begin
        if Nodo.IsTextElement then
           Result := Nodo.Text;
        if Nodo.NodeType = ntCData then
           Result := Nodo.NodeValue;
        if Nodo.NodeType = ntElement then
        begin
           Nodo := Nodo.ChildNodes.First;
           if Nodo.NodeType = ntCData then
              Result := Nodo.NodeValue;
        end;
     end
     else
        Result := 'NIL';
  end;

begin
  inherited;
  MDebug.Lines.Clear;
  // Formateo XML
  Documento := TXMLDocument.Create(Self);
  try
     with Documento do
     begin
        // Borro los datos que pudiera haber
        XML.Text := '';

        // Cargo datos
        XML.Text := MXML.Text;

        Active := True;
        Encoding := 'utf-8';

        Nodo := DocumentElement;

        SetLength(a, 0);
        if (EXMLNodo1.Text <> '') then
        begin
           SetLength(a, Length(a) + 1);
           a[Length(a) - 1] := EXMLNodo1.Text;
        end;
        if (EXMLNodo2.Text <> '') then
        begin
           SetLength(a, Length(a) + 1);
           a[Length(a) - 1] := EXMLNodo2.Text;
        end;

        Valor := DameDato(Nodo, a);


        MDebug.Lines.Add(format('   Valor = %s', [Valor]));

        // Borro los datos
        XML.Text := '';
     end;
  finally
     Documento.Free;
  end;
end;

procedure TFMPruebas.BComprimirGZipClick(Sender: TObject);
{
var
   s : string;
   c, d : RawByteString;
  AMemoryStream : TMemoryStream;
}
begin
  inherited;

(*
  s := ETBAI.Text;
  MDebug.Lines.Add(format('Original %d bytes', [Length(s)]));

  c := GZCompressStr(s);
  d := '123456890123456890123456890123456890123456890123456890123456890123456890';
  // Traansformo a Base 64

   AMemoryStream := TMemoryStream.Create;
   try
      AMemoryStream.WriteBuffer(Pointer(c), Length(c));
      StreamToStrB64(AMemoryStream, s);
   finally
      AMemoryStream.Free;
   end;

   MDebug.Lines.Add(format('Compresion %d bytes', [Length(c)]));
   {
   AMemoryStream := TMemoryStream.Create;
   try
      StrB64ToStream(s, AMemoryStream);
      AMemoryStream.Position := 0;
      AMemoryStream.ReadBuffer(Pointer(d), Length(c));
   finally
      AMemoryStream.Free;
   end;
   }
  MDebug.Lines.Add(s);

  s := GZDecompressStr(c);
  MDebug.Lines.Add(format('Descompresion %d bytes', [Length(s)]));
  MDebug.Lines.Add(s);
*)
end;

procedure TFMPruebas.BFormularioImportacionClick(Sender: TObject);
begin
  inherited;
  ImportarExcel;
end;

procedure TFMPruebas.BInsMasivaClick(Sender: TObject);
{
var
  IBDB : TIBDatabase;
  IBT : TIBTransaction;
  IBQ : TIBQuery;
  i, j : integer;
}
begin
  inherited;
  {Hay que agregar componentes IB a uses en implementation
  IBDB := TIBDatabase.Create(Self);
  IBT := TIBTransaction.Create(Self);
  try
     IBDB.DatabaseName := 'ServidorFB:ABSHOT';
     IBDB.DefaultTransaction := IBT;
     IBT.DefaultDatabase := IBDB;
     IBDB.Connected := True;

     IBT.StartTransaction;
     IBQ := TIBQuery.Create(Self);
     try
        IBQ.DataBase := IBDB;
        IBQ.Transaction := IBT;
        IBQ.SQL.Text := 'INSERT INTO TMP_TEMPORALES (NOMBRE, ENTRADA) VALUES (:NOMBRE, :ENTRADA)';

        MDebug.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' Inicio');
        for i := 0 to 9 do
        begin
           for j := 1 to 10000 do
           begin
              IBQ.Params.ParamByName('NOMBRE').AsString := IntToStr(i * 10000 + j);
              IBQ.Params.ParamByName('ENTRADA').AsInteger := i * 10000 + j;
              IBQ.ExecSQL;
           end;
           IBQ.Transaction.Commit;
           IBQ.Transaction.StartTransaction;
           MDebug.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' Bucle ' + IntToStr(i));
        end;
        MDebug.Lines.Add(FormatDateTime('hh:nn:ss', Now) + ' Fin');
     finally
        IBQ.Free;
     end;
  finally
     IBDB.Free;
     IBT.Free;
  end;
  }
end;

procedure TFMPruebas.BBase64Click(Sender: TObject);
var
  strJSON, strBase64 : string;
  StreamOrigen, AMemoryStream : TStream;
  QR : TImage;
begin
  inherited;

  strJSON := EBase64.Text;

  StreamOrigen := TStringStream.Create(strJSON);
  AMemoryStream := TMemoryStream.Create;
  QR := TImage.Create(Self);
  try
     AMemoryStream.CopyFrom(StreamOrigen, StreamOrigen.Size);
     StreamToStrB64(TMemoryStream(AMemoryStream), strBase64);

     MDebug.Lines.Add('Origen:');
     MDebug.Lines.Add(strJSON);
     MDebug.Lines.Add('Base64:');
     MDebug.Lines.Add(strBase64);

     CrearCodigoQR(QR.Picture.Bitmap, strBase64, 3);

     Imagen.Picture.Assign(QR.Picture);
  finally
     StreamOrigen.Free;
     AMemoryStream.Free;
     QR.Free;
  end;
end;

procedure TFMPruebas.BScreensClick(Sender: TObject);
var
  i : integer;
  s, s1 : string;
begin
  inherited;
  MDebug.Lines.Clear;
  for i := 0 to Screen.FormCount - 1 do
  begin
     if Assigned(Screen.Forms[i]) then
        s := 'Assigned'
     else
        s := 'NOT Assigned';

     case Screen.Forms[i].WindowState of
        wsNormal: s1 := 'wsNormal';
        wsMinimized: s1 := 'wsMinimized';
        wsMaximized: s1 := 'wsMaximized';
        else
           s1 := '?';
     end;

     Log(format('%d - Formulario: %s - WindowState: %s - %s', [i, Screen.Forms[i].Name, s1, s]));
  end;
end;

procedure TFMPruebas.BFileExistsClick(Sender: TObject);
var
  sr : TSearchRec;
  RegistrosEncontrados : integer;
begin
  inherited;
  // Me aseguro que la direccion termine en "\"
  EDirFileExists.Text := IncludeTrailingPathDelimiter(EDirFileExists.Text);

  // Busco los archivos dentro el directorio ()
  RegistrosEncontrados := FindFirst(EDirFileExists.Text + '*.*', faAnyFile, sr);
  try
     // Mientras haya archivos...
     while RegistrosEncontrados = 0 do
     begin
        // Si el archivo no es uno "especial"
        if not ((sr.Name = '.') or (sr.Name = '..')) then
        begin
           // Si es un directorio llamo recursivamente a la funcion
           if ((sr.Attr and faDirectory) = faDirectory) then
              Log(format('Directorio: %s', [sr.Name]))
           else
           begin
              if FileExists(EDirFileExists.Text + sr.Name) then
                 Log(format('Existe archivo: %s', [EDirFileExists.Text + sr.Name]))
              else
                 Log(format('NO Existe archivo: %s', [EDirFileExists.Text + sr.Name]));
           end;
        end;
        // Busco el siguiente archivo
        RegistrosEncontrados := FindNext(sr);
     end;
  finally
     SysUtils.FindClose(sr);
  end;
end;

procedure TFMPruebas.BHexToColorClick(Sender: TObject);
begin
  inherited;
  LEHexToColor.Caption := EHexToColor.Text;
  LEHexToColor.Color := HEXToColor(LEHexToColor.Caption);
end;

procedure TFMPruebas.TSDescargarImagenShow(Sender: TObject);
begin
  inherited;
  BHexToColorClick(Sender);

  LHex1.Color := HEXToColor(LHex1.Caption);
  LHex2.Color := HEXToColor(LHex2.Caption);
  LHex3.Color := HEXToColor(LHex3.Caption);
  LHex4.Color := HEXToColor(LHex4.Caption);
  LHex5.Color := HEXToColor(LHex5.Caption);
  LHex6.Color := HEXToColor(LHex6.Caption);
  LHex7.Color := HEXToColor(LHex7.Caption);
  LHex8.Color := HEXToColor(LHex8.Caption);
  LHex9.Color := HEXToColor(LHex9.Caption);
end;

procedure TFMPruebas.BGLSPostClick(Sender: TObject);
var
  XML, Respuesta : TStrings;
begin
  inherited;
  AbreData(TDMGLS, DMGLS);
  DMGLS.WS_Inicializa(EGLSURLWebService.Text, EGLSGUID.Text, True);
  XML := TStringList.Create;
  Respuesta := TStringList.Create;
  try
     XML.Text := MGLSContenido.Lines.Text;
     DMGLS.WS_Post('GrabarServicios', XML, Respuesta);
     MDebug.Text := Respuesta.Text;
  finally
     XML.Free;
     Respuesta.Free;
  end;
  CierraData(DMGLS);
end;

procedure TFMPruebas.BSkirPostIdClick(Sender: TObject);
var
  JSON, Respuesta : TStrings;
  Resultado : integer;
begin
  inherited;

  MDebug.Lines.Clear;

  AbreData(TDMSkrit, DMSkrit);
  DMSkrit.WS_Inicializa(ESkritURLBase.Text, ESkritToken.Text, ESkritAssociate.Text, ESkritClient.Text, True);
  JSON := TStringList.Create;
  Respuesta := TStringList.Create;
  try
     case TButton(Sender).Tag of
        1:
        begin
           MDebug.Lines.Add(format('DMSkrit.WS_Get("%s", "%s", "%s", Respuesta)', [CBSkritResource.Text, ESkritId.Text, '']));
           Resultado := DMSkrit.WS_Get(CBSkritResource.Text, ESkritId.Text, '', Respuesta);
        end;
        2:
        begin
           MDebug.Lines.Add(format('DMSkrit.WS_Get("%s", "%s", "%s", Respuesta)', [CBSkritResource.Text, '', EskritOpciones.Text]));
           Resultado := DMSkrit.WS_Get(CBSkritResource.Text, '', EskritOpciones.Text, Respuesta);
        end;
     end;
  finally
     JSON.Free;
     Respuesta.Free;
  end;
  CierraData(DMSkrit);
end;

procedure TFMPruebas.Button4Click(Sender: TObject);
begin
  inherited;

  MDebug.Lines.Clear;

  Log('StrToFloatDec(''' + Edit1.Text + ''', ''.'') ==> ' + FloatToStr(StrToFloatDec(Edit1.Text, '.')));
  Log('StrToFloatDec(''' + Edit1.Text + ''', '','') ==> ' + FloatToStr(StrToFloatDec(Edit1.Text, ',')));
  Log('StrToFloatDec(''' + Edit1.Text + ''', '' '') ==> ' + FloatToStr(StrToFloatDec(Edit1.Text, ' ')));
end;

end.
