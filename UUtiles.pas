unit UUtiles;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Controls, Forms, Windows, SysUtils, DBTables, FIBDataSet, FIBTableDataSet,
  ComCtrls, DB, Dialogs, FIB, iBase, UComponentesBusquedaFiltrada,
  FIBDataSetRO, WinSpool, UHYReport, DBCtrls, Classes, HYFIBQuery,
  IdGlobalProtocols, UTools, Math, Graphics, NsDBGrid, FIBQuery, ULFDBEditFind2000,
  FR_Class, PsFR_E_PDF, PsFR_E_Main, frxClass, jpeg, ExtCtrls, IdMessage, IdSMTP, IdMessageClient,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdSocks, ComObj, FIBDataSetRW, UHYDBGrid, FIBDatabase, DBGrids, IdSSLOpenSSL,
  IdExplicitTLSClientServerBase, IdAttachmentFile, Idglobal, Grids, Buttons, TFlatButtonUnit,
  RXDBCtrl, StdCtrls, ULFDateEdit;
// The constants here are for the CRC-32 generator
// polynomial, as defined in the Microsoft
// Systems Journal, March 1995, pp. 107-108

const
  CRYPT_STRING_BASE64 = 1;

const
  {Tabla para calcular CRC}
  table: array[0..255] of DWORD =
     ($00000000, $77073096, $EE0E612C, $990951BA,
     $076DC419, $706AF48F, $E963A535, $9E6495A3,
     $0EDB8832, $79DCB8A4, $E0D5E91E, $97D2D988,
     $09B64C2B, $7EB17CBD, $E7B82D07, $90BF1D91,
     $1DB71064, $6AB020F2, $F3B97148, $84BE41DE,
     $1ADAD47D, $6DDDE4EB, $F4D4B551, $83D385C7,
     $136C9856, $646BA8C0, $FD62F97A, $8A65C9EC,
     $14015C4F, $63066CD9, $FA0F3D63, $8D080DF5,
     $3B6E20C8, $4C69105E, $D56041E4, $A2677172,
     $3C03E4D1, $4B04D447, $D20D85FD, $A50AB56B,
     $35B5A8FA, $42B2986C, $DBBBC9D6, $ACBCF940,
     $32D86CE3, $45DF5C75, $DCD60DCF, $ABD13D59,
     $26D930AC, $51DE003A, $C8D75180, $BFD06116,
     $21B4F4B5, $56B3C423, $CFBA9599, $B8BDA50F,
     $2802B89E, $5F058808, $C60CD9B2, $B10BE924,
     $2F6F7C87, $58684C11, $C1611DAB, $B6662D3D,

     $76DC4190, $01DB7106, $98D220BC, $EFD5102A,
     $71B18589, $06B6B51F, $9FBFE4A5, $E8B8D433,
     $7807C9A2, $0F00F934, $9609A88E, $E10E9818,
     $7F6A0DBB, $086D3D2D, $91646C97, $E6635C01,
     $6B6B51F4, $1C6C6162, $856530D8, $F262004E,
     $6C0695ED, $1B01A57B, $8208F4C1, $F50FC457,
     $65B0D9C6, $12B7E950, $8BBEB8EA, $FCB9887C,
     $62DD1DDF, $15DA2D49, $8CD37CF3, $FBD44C65,
     $4DB26158, $3AB551CE, $A3BC0074, $D4BB30E2,
     $4ADFA541, $3DD895D7, $A4D1C46D, $D3D6F4FB,
     $4369E96A, $346ED9FC, $AD678846, $DA60B8D0,
     $44042D73, $33031DE5, $AA0A4C5F, $DD0D7CC9,
     $5005713C, $270241AA, $BE0B1010, $C90C2086,
     $5768B525, $206F85B3, $B966D409, $CE61E49F,
     $5EDEF90E, $29D9C998, $B0D09822, $C7D7A8B4,
     $59B33D17, $2EB40D81, $B7BD5C3B, $C0BA6CAD,

     $EDB88320, $9ABFB3B6, $03B6E20C, $74B1D29A,
     $EAD54739, $9DD277AF, $04DB2615, $73DC1683,
     $E3630B12, $94643B84, $0D6D6A3E, $7A6A5AA8,
     $E40ECF0B, $9309FF9D, $0A00AE27, $7D079EB1,
     $F00F9344, $8708A3D2, $1E01F268, $6906C2FE,
     $F762575D, $806567CB, $196C3671, $6E6B06E7,
     $FED41B76, $89D32BE0, $10DA7A5A, $67DD4ACC,
     $F9B9DF6F, $8EBEEFF9, $17B7BE43, $60B08ED5,
     $D6D6A3E8, $A1D1937E, $38D8C2C4, $4FDFF252,
     $D1BB67F1, $A6BC5767, $3FB506DD, $48B2364B,
     $D80D2BDA, $AF0A1B4C, $36034AF6, $41047A60,
     $DF60EFC3, $A867DF55, $316E8EEF, $4669BE79,
     $CB61B38C, $BC66831A, $256FD2A0, $5268E236,
     $CC0C7795, $BB0B4703, $220216B9, $5505262F,
     $C5BA3BBE, $B2BD0B28, $2BB45A92, $5CB36A04,
     $C2D7FFA7, $B5D0CF31, $2CD99E8B, $5BDEAE1D,

     $9B64C2B0, $EC63F226, $756AA39C, $026D930A,
     $9C0906A9, $EB0E363F, $72076785, $05005713,
     $95BF4A82, $E2B87A14, $7BB12BAE, $0CB61B38,
     $92D28E9B, $E5D5BE0D, $7CDCEFB7, $0BDBDF21,
     $86D3D2D4, $F1D4E242, $68DDB3F8, $1FDA836E,
     $81BE16CD, $F6B9265B, $6FB077E1, $18B74777,
     $88085AE6, $FF0F6A70, $66063BCA, $11010B5C,
     $8F659EFF, $F862AE69, $616BFFD3, $166CCF45,
     $A00AE278, $D70DD2EE, $4E048354, $3903B3C2,
     $A7672661, $D06016F7, $4969474D, $3E6E77DB,
     $AED16A4A, $D9D65ADC, $40DF0B66, $37D83BF0,
     $A9BCAE53, $DEBB9EC5, $47B2CF7F, $30B5FFE9,
     $BDBDF21C, $CABAC28A, $53B39330, $24B4A3A6,
     $BAD03605, $CDD70693, $54DE5729, $23D967BF,
     $B3667A2E, $C4614AB8, $5D681B02, $2A6F2B94,
     $B40BBE37, $C30C8EA1, $5A05DF1B, $2D02EF8D);

  {Tabla para calcular CRC}
  Table_CRC8: array[0..255] of DWORD =
     ($00, $07, $0E, $09, $1C, $1B, $12, $15,
     $38, $3F, $36, $31, $24, $23, $2A, $2D,
     $70, $77, $7E, $79, $6C, $6B, $62, $65,
     $48, $4F, $46, $41, $54, $53, $5A, $5D,
     $E0, $E7, $EE, $E9, $FC, $FB, $F2, $F5,
     $D8, $DF, $D6, $D1, $C4, $C3, $CA, $CD,
     $90, $97, $9E, $99, $8C, $8B, $82, $85,
     $A8, $AF, $A6, $A1, $B4, $B3, $BA, $BD,
     $C7, $C0, $C9, $CE, $DB, $DC, $D5, $D2,
     $FF, $F8, $F1, $F6, $E3, $E4, $ED, $EA,
     $B7, $B0, $B9, $BE, $AB, $AC, $A5, $A2,
     $8F, $88, $81, $86, $93, $94, $9D, $9A,
     $27, $20, $29, $2E, $3B, $3C, $35, $32,
     $1F, $18, $11, $16, $03, $04, $0D, $0A,
     $57, $50, $59, $5E, $4B, $4C, $45, $42,
     $6F, $68, $61, $66, $73, $74, $7D, $7A,
     $89, $8E, $87, $80, $95, $92, $9B, $9C,
     $B1, $B6, $BF, $B8, $AD, $AA, $A3, $A4,
     $F9, $FE, $F7, $F0, $E5, $E2, $EB, $EC,
     $C1, $C6, $CF, $C8, $DD, $DA, $D3, $D4,
     $69, $6E, $67, $60, $75, $72, $7B, $7C,
     $51, $56, $5F, $58, $4D, $4A, $43, $44,
     $19, $1E, $17, $10, $05, $02, $0B, $0C,
     $21, $26, $2F, $28, $3D, $3A, $33, $34,
     $4E, $49, $40, $47, $52, $55, $5C, $5B,
     $76, $71, $78, $7F, $6A, $6D, $64, $63,
     $3E, $39, $30, $37, $22, $25, $2C, $2B,
     $06, $01, $08, $0F, $1A, $1D, $14, $13,
     $AE, $A9, $A0, $A7, $B2, $B5, $BC, $BB,
     $96, $91, $98, $9F, $8A, $8D, $84, $83,
     $DE, $D9, $D0, $D7, $C2, $C5, $CC, $CB,
     $E6, $E1, $E8, $EF, $FA, $FD, $F4, $F3);

// Constantes utilizadas por GetSpecialFolderPath;
const
  CSIDL_FLAG_CREATE = $8000;
  { Version 5.0. Combine this CSIDL with any of the following CSIDLs
   to force the creation of the associated folder. }

  CSIDL_ADMINTOOLS = $0030;
  { Version 5.0. The file system directory that is used to store
   administrative tools for an individual user. The Microsoft Management
   Console (MMC) will save customized consoles to this directory, and it
   will roam with the user. }

  CSIDL_ALTSTARTUP = $001d;
  { The file system directory that corresponds to the user's nonlocalized
   Startup program group. }

  CSIDL_APPDATA = $001a;
  { Version 4.71. The file system directory that serves as a common
   repository for application-specific data. A typical path is C:\Documents
   and Settings\username\Application Data. This CSIDL is supported by the
   redistributable Shfolder.dll for systems that do not have the Microsoft
   Internet Explorer 4.0 integrated Shell installed. }

  CSIDL_BITBUCKET = $000a;
  { The virtual folder containing the objects in the user's Recycle Bin. }

  CSIDL_CDBURN_AREA = $003b;
  { Version 6.0. The file system directory acting as a staging area for files
   waiting to be written to CD. A typical path is C:\Documents and Settings\
   username\Local Settings\Application Data\Microsoft\CD Burning. }

  CSIDL_COMMON_ADMINTOOLS = $002f;
  { Version 5.0. The file system directory containing administrative tools
   for all users of the computer. }

  CSIDL_COMMON_ALTSTARTUP = $001e;
  { The file system directory that corresponds to the nonlocalized Startup
   program group for all users. Valid only for Microsoft Windows NT systems. }

  CSIDL_COMMON_APPDATA = $0023;
  { Version 5.0. The file system directory containing application data for
   all users. A typical path is C:\Documents and Settings\All Users\
   Application Data. }

  CSIDL_COMMON_DESKTOPDIRECTORY = $0019;
  { The file system directory that contains files and folders that appear on
   the desktop for all users. A typical path is C:\Documents and Settings\All
   Users\Desktop. Valid only for Windows NT systems. }

  CSIDL_COMMON_DOCUMENTS = $002e;
  { The file system directory that contains documents that are common to all
   users. A typical paths is C:\Documents and Settings\All Users\Documents.
   Valid for Windows NT systems and Microsoft Windows 95 and Windows 98
   systems with Shfolder.dll installed. }

  CSIDL_COMMON_FAVORITES = $001f;
  { The file system directory that serves as a common repository for favorite
   items common to all users. Valid only for Windows NT systems. }

  CSIDL_COMMON_MUSIC = $0035;
  { Version 6.0. The file system directory that serves as a repository for
   music files common to all users. A typical path is C:\Documents and
   Settings\All Users\Documents\My Music. }

  CSIDL_COMMON_PICTURES = $0036;
  { Version 6.0. The file system directory that serves as a repository for
   image files common to all users. A typical path is C:\Documents and
   Settings\All Users\Documents\My Pictures. }

  CSIDL_COMMON_PROGRAMS = $0017;
  { The file system directory that contains the directories for the common
   program groups that appear on the Start menu for all users. A typical
   path is C:\Documents and Settings\All Users\Start Menu\Programs. Valid
   only for Windows NT systems. }

  CSIDL_COMMON_STARTMENU = $0016;
  { The file system directory that contains the programs and folders that
   appear on the Start menu for all users. A typical path is C:\Documents
   and Settings\All Users\Start Menu. Valid only for Windows NT systems. }

  CSIDL_COMMON_STARTUP = $0018;
  { The file system directory that contains the programs that appear in the
   Startup folder for all users. A typical path is C:\Documents and Settings\
   All Users\Start Menu\Programs\Startup. Valid only for Windows NT systems. }

  CSIDL_COMMON_TEMPLATES = $002d;
  { The file system directory that contains the templates that are available
   to all users. A typical path is C:\Documents and Settings\All Users\
   Templates. Valid only for Windows NT systems. }

  CSIDL_COMMON_VIDEO = $0037;
  { Version 6.0. The file system directory that serves as a repository for
   video files common to all users. A typical path is C:\Documents and
   Settings\All Users\Documents\My Videos. }

  CSIDL_COMPUTERSNEARME = $003d;
  { The folder representing other machines in your workgroup. }

  CSIDL_CONNECTIONS = $0031;
  { The virtual folder representing Network Connections, containing network
   and dial-up connections. }

  CSIDL_CONTROLS = $0003;
  { The virtual folder containing icons for the Control Panel applications. }

  CSIDL_COOKIES = $0021;
  { The file system directory that serves as a common repository for
   Internet cookies. A typical path is C:\Documents and Settings\
   username\Cookies. }

  CSIDL_DESKTOP = $0000;
  { The virtual folder representing the Windows desktop, the root
   of the namespace. }

  CSIDL_DESKTOPDIRECTORY = $0010;
  { The file system directory used to physically store file objects on the
   desktop (not to be confused with the desktop folder itself). A typical
   path is C:\Documents and Settings\username\Desktop. }

  CSIDL_DRIVES = $0011;
  { The virtual folder representing My Computer, containing everything on
   the local computer: storage devices, printers, and Control Panel. The
   folder may also contain mapped network drives. }

  CSIDL_FAVORITES = $0006;
  { The file system directory that serves as a common repository for the
   user's favorite items. A typical path is C:\Documents and Settings\
   username\Favorites. }

  CSIDL_FLAG_DONT_UNEXPAND = $2000;
  { Combine with another CSIDL constant to ensure expanding of
   environment variables. }

  CSIDL_FLAG_DONT_VERIFY = $4000;
  { Combine with another CSIDL constant, except for  CSIDL_FLAG_CREATE,
   to return an unverified folder path—with no attempt to create or
   initialize the folder. }

  CSIDL_FONTS = $0014;
  { A virtual folder containing fonts. A typical path is C:\Windows\Fonts. }

  CSIDL_HISTORY = $0022;
  { The file system directory that serves as a common repository for Internet
  history items. }

  CSIDL_INTERNET = $0001;
  { A viritual folder for Internet Explorer (icon on desktop). }

  CSIDL_INTERNET_CACHE = $0020;
  { Version 4.72. The file system directory that serves as a common
   repository for temporary Internet files. A typical path is C:\Documents
   and Settings\username\Local Settings\Temporary Internet Files. }

  CSIDL_LOCAL_APPDATA = $001c;
  { Version 5.0. The file system directory that serves as a data repository
   for local (nonroaming) applications. A typical path is C:\Documents and
   Settings\username\Local Settings\Application Data. }

  CSIDL_MYDOCUMENTS = $000c;
  { Version 6.0. The virtual folder representing the My
   Documents desktop item. }

  CSIDL_MYMUSIC = $000d;
  { The file system directory that serves as a common repository for
   music files. A typical path is C:\Documents and Settings\User\My
   Documents\My Music. }

  CSIDL_MYPICTURES = $0027;
  { Version 5.0. The file system directory that serves as a common
   repository for image files. A typical path is C:\Documents and
   Settings\username\My Documents\My Pictures. }

  CSIDL_MYVIDEO = $000e;
  { Version 6.0. The file system directory that serves as a common
   repository for video files. A typical path is C:\Documents and
   Settings\username\My Documents\My Videos. }

  CSIDL_NETHOOD = $0013;
  { A file system directory containing the link objects that may exist
   in the My Network Places virtual folder. It is not the same as
   CSIDL_NETWORK, which represents the network namespace root. A typical
   path is C:\Documents and Settings\username\NetHood. }

  CSIDL_NETWORK = $0012;
  { A virtual folder representing Network Neighborhood, the root of the
   network namespace hierarchy. }

  CSIDL_PERSONAL = $0005;
  { Version 6.0. The virtual folder representing the My Documents desktop
   item. This is equivalent to  CSIDL_MYDOCUMENTS.
   Previous to Version 6.0. The file system directory used to physically
   store a user's common repository of documents. A typical path is
   C:\Documents and Settings\username\My Documents. This should be
   distinguished from the virtual My Documents folder in the namespace.
   To access that virtual folder, use SHGetFolderLocation, which returns
   the ITEMIDLIST for the virtual location, or refer to the technique
   described in Managing the File System. }

  CSIDL_PHOTOALBUMS = $0045;
  { Windows Vista. The virtual folder used to store photo albums,
   typically username\My Pictures\Photo Albums. }

  CSIDL_PLAYLISTS = $003f;
  { Windows Vista. The virtual folder used to store play albums,
   typically username\My Music\Playlists. }

  CSIDL_PRINTERS = $0004;
  { The virtual folder containing installed printers. }

  CSIDL_PRINTHOOD = $001b;
  { The file system directory that contains the link objects that can
   exist in the Printers virtual folder. A typical path is C:\Documents
   and Settings\username\PrintHood. }

  CSIDL_PROFILE = $0028;
  { Version 5.0. The user's profile folder. A typical path is C:\Documents
   and Settings\username. Applications should not create files or folders
   at this level; they should put their data under the locations referred
   to by  CSIDL_APPDATA or  CSIDL_LOCAL_APPDATA. }

  CSIDL_PROGRAM_FILES = $0026;
  { Version 5.0. The Program Files folder. A typical path is
   C:\Program Files. }

  CSIDL_PROGRAM_FILES_COMMON = $002b;
  { Version 5.0. A folder for components that are shared across
   applications. A typical path is C:\Program Files\Common. Valid
   only for Windows NT, Windows 2000, and Windows XP systems. Not
   valid for Windows Millennium Edition (Windows Me). }

  CSIDL_PROGRAMS = $0002;
  { The file system directory that contains the user's program groups
   (which are themselves file system directories). A typical path is
   C:\Documents and Settings\username\Start Menu\Programs. }

  CSIDL_RECENT = $0008;
  { The file system directory that contains shortcuts to the user's most
   recently used documents. A typical path is C:\Documents and Settings\
   username\My Recent Documents. To create a shortcut in this folder, use
   SHAddToRecentDocs. In addition to creating the shortcut, this function
   updates the Shell's list of recent documents and adds the shortcut to
   the My Recent Documents submenu of the Start menu. }

  CSIDL_RESOURCES = $0038;
  { Windows Vista. The file system directory that contains resource data.
   A typical path is C:\Windows\Resources. }

  CSIDL_SAMPLE_MUSIC = $0040;
  { Windows Vista. The file system directory that contains sample music.
   A typical path is C:\Documents and Settings\username\My Documents\
   My Music\Sample Music. }

  CSIDL_SAMPLE_PLAYLISTS = $0041;
  { Windows Vista. The file system directory that contains sample playlists.
   A typical path is C:\Documents and Settings\username\My Documents\My
   Music\Sample Playlists. }

  CSIDL_SAMPLE_PICTURES = $0042;
  { Windows Vista. The file system directory that contains sample pictures.
   A typical path is C:\Documents and Settings\username\My Documents\My
   Pictures\Sample Pictures. }

  CSIDL_SAMPLE_VIDEOS = $0043;
  { Windows Vista. The file system directory that contains sample videos.
   A typical path is C:\Documents and Settings\username\My Documents\My
   Videos\Sample Videos. }

  CSIDL_SENDTO = $0009;
  { The file system directory that contains Send To menu items. A typical
   path is C:\Documents and Settings\username\SendTo. }

  CSIDL_STARTMENU = $000b;
  { The file system directory containing Start menu items. A typical path
   is C:\Documents and Settings\username\Start Menu. }

  CSIDL_STARTUP = $0007;
  { The file system directory that corresponds to the user's Startup
   program group. The system starts these programs whenever any user
   logs onto Windows NT or starts Windows 95. A typical path is
   C:\Documents and Settings\username\Start Menu\Programs\Startup. }

  CSIDL_SYSTEM = $0025;
  { Version 5.0. The Windows System folder. A typical path is
   C:\Windows\System32. }

  CSIDL_TEMPLATES = $0015;
  { The file system directory that serves as a common repository for
   document templates. A typical path is C:\Documents and
   Settings\username\Templates. }

  CSIDL_WINDOWS = $0024;
{ Version 5.0. The Windows directory or SYSROOT. This corresponds to
   the %windir% or %SYSTEMROOT% environment variables. A typical
   path is C:\Windows. }

type
  THashAlgorithm = (haMD5, haSHA1);

type
  TVariableEmail = record
     TipoDocumento: string;
     Ejercicio: integer;
     Serie: string;
     NumeroDocumento: integer;
     Fecha: TDateTime;
     SuReferencia: string;
     SuPedido: string;
     Folio: string;
     TituloDocTributario: string;
     Matricula: string;
     Asunto: string;
     Cuerpo: string;
     Pie: string;
     NombreFichero: string;
     IDConfigServCorreos: integer;
     NombreComercial: string;
     RazonSocial: string;
     IdOrdenTrabajo: integer;
     OrdenTrabajo: integer;
     UsuarioCreadorDocumento: string;
  end;

var
  VariableEmail : TVariableEmail;

function ConfirmaMensajeCaption(Mensaje, Caption: string): boolean;
function ConfirmaMensaje(Mensaje: string): boolean;
function Confirma: boolean;
function ConfirmaGrave: boolean;
procedure MensajesDeError(e: Exception);
function MensError(nError: integer): PChar;
function GetOsInfo: string;
procedure AbreTablas(Contenedor: TDataModule);
procedure CierraTablas(Contenedor: TDataModule);
procedure AbreQueries(Contenedor: TDataModule);
procedure CierraQueries(Contenedor: TDataModule);
procedure AbreFIB(Contenedor: TDataModule);
procedure CierraFIB(Contenedor: TDataModule);
function IsNum(Cadena: string): boolean;
function ExpandirCadena(cadena: string; long: integer = 0): string;
procedure ExpandirCadenaEdit(Sender: TDBEdit); overload;
procedure ExpandirCadenaEdit(Sender: TEdit); overload;
procedure PaginaExclusiva_Si(Pagina: TTabSheet);
procedure PaginaExclusiva_No(Pagina: TTabSheet);
procedure IconosCaption(Ventana: TForm; Estado: boolean);
function DevuelveMoneda(descripcion: string): string;
procedure DamePuertosImpresora(Impresora: string; var Puerto: string);
function GetPrinterName(Ticketera: string): string;
function GetPrinterIndex(Ticketera: string): integer;
function OnlyNumbers(cadena: string): string;
function FormatNIF(Field: TField): string;
function NIFGetLetra(Dni: string): char;
function RUTGetLetra(Dni: string): char;

procedure Actualiza_Banco(Tabla: TFIBDataSetRO; Banco: integer);
procedure Actualiza_Cuenta(Tabla: TFIBDataSetRO; Cuenta: string);
procedure Actualiza_Talon(Tabla: TFIBDataSetRO; talon: string);
procedure Actualiza_Pagare(Tabla: TFIBDataSetRO; pagare: string);
procedure Actualiza_Articulo(Tabla: TFIBTableSet; art: string);
procedure Actualiza_Familia(Tabla: TFIBTableSet; familia: string);
procedure Actualiza_FamiliaRO(Tabla: TFIBDataSetRO; familia: string);
procedure Actualiza_Almacen(Tabla: TFIBTableSet; almacen: string);
procedure Actualiza_AlmacenRO(Tabla: TFIBDataSetRO; almacen: string);
procedure Actualiza_TipoValor(Tabla: TFIBTableSet; tipo: string);
procedure Actualiza_TipoValorRO(Tabla: TFIBDataSetRO; tipo: string);
procedure Actualiza_Agente(Tabla: TFIBTableSet; agente: string);
procedure Actualiza_AgenteEmpRO(Tabla: TFIBDataSetRO; agente: string);
procedure Actualiza_Periodo(Tabla: TFIBTableSet; periodo: string);
procedure Actualiza_PeriodoRO(Tabla: TFIBDataSetRO; periodo: string);
procedure Actualiza_Tarifa(Tabla: TFIBTableSet; tarifa: string);
procedure Actualiza_TarifaRO(Tabla: TFIBDataSetRO; tarifa: string);
procedure Actualiza_Proveedor(Tabla: TFIBTableSet; prov: string);
procedure Actualiza_ProveedorRO(Tabla: TFIBDataSetRO; prov: string);
procedure Actualiza_ProveedorEmpRO(Tabla: TFIBDataSetRO; prov: string);
procedure Actualiza_Acreedor(Tabla: TFIBTableSet; acr: string);
procedure Actualiza_AcreedorRO(Tabla: TFIBDataSetRO; acr: string);
procedure Actualiza_Cliente(Tabla: TFIBTableSet; cliente: string);
procedure Actualiza_Estado(Tabla: TFIBTableSet; estado: string);
procedure Actualiza_Campanya(Tabla: TFIBDataSetRO; campanya: string);
procedure Actualiza_EstadoRO(Tabla: TFIBDataSetRO; estado: string);
procedure Actualiza_ArticuloRO(Tabla: TFIBDataSetRO; art: string);
procedure Actualiza_ClienteRO(Tabla: TFIBDataSetRO; cliente: string);
procedure Actualiza_ClienteEmpRO(Tabla: TFIBDataSetRO; cliente: string);
procedure Actualiza_CanalRO(Tabla: TFIBDataSetRO; canal: smallint);

function HourIntoDate(MyDate: TDateTime; const MyHour: string): TDateTime;
procedure RellenarArteriscos(var cad: string; long: integer);
function AreAllNumbers(const cadena: string): boolean;
procedure ModificaSelect(Tabla: TFIBTableSet; Condicion: string; Poner: boolean);
procedure SolapaControles(Control1: TControl; Control2: TWinControl);
procedure Imprimir(PrinterName: string; const Data; Count: cardinal);
procedure ImprimirBinario(PrinterName: string; const Data: string);
function BoolToInt(Value: boolean): integer;

var
  LongExpansion : smallint;

procedure CortePapel;
procedure AbrirCajon;
procedure ImpresionDirecta(impresora: string; Data: string);
procedure ImpresionTexto(Texto: TStrings);
procedure Actualiza_AgenteRO(Tabla: TFIBDataSetRO; agente: string);
function DevuelveCampoDelMensaje(m: string): string;
procedure Actualiza_Serie(Tabla: TFIBTableSet; serie: string);
procedure Actualiza_SerieRO(Tabla: TFIBDataSetRO; serie: string);
procedure Actualiza_SerieEmpRO(Tabla: TFIBDataSetRO; serie: string);
function Ajusta(Cadena, Orientacion: string; Longitud: integer; Relleno: char): string;
function StrToFloatDef(s: string; Default: double): double;
function StrToFloatDec(s: string; SeparadorDecimal: char): double;
function FloatToStrDec(f: double; SeparadorDecimal: char; Mascara: string = ''): string;
function RoundAmount(const d: double; decimales: integer): double;
function FormatAmount(const d: double; decimales: integer): string;
function AmountToDouble(s: string; Exception: boolean = True): double;

function ReemplazaTextoHTML(texto: string; modo: integer): string;
function QuitarAcentosTexto(texto: string): string;
// function ArticuloLoteable(Empresa: integer; Articulo: string): boolean;
function CuentaCCCValida(Entidad, Sucursal, DC, CC: string): boolean;
function Modulo97(s: string): integer;
function Modulo10(const s: string): integer;
function CodigoEANValido(Codigo: string): boolean;
function ChangeAlpha(input: string): string;
function CalcularIBAN(Pais, Cuenta: string): string;
function IBANValido(iban: string): boolean;
function LimpiaMensaje(e: Exception): string;
function DameDireccionDefecto(Tercero: integer): integer;
function DameDireccionDefectoVentas(Empresa, Cliente: integer): integer;
procedure ModificaDoc(Query: THYFIBQuery; ID, Posicion, Tipo: integer);
procedure CeldaEnlace(dbg: TNsDBGrid; Rect: TRect); overload;
procedure CeldaEnlace(dbg: TDBGrid; Rect: TRect); overload;
procedure ControlaBorrado(ID: integer; Tipo: string);
function CompruebaCheckUbicaciones(ID_A: integer; var Peso, Volumen, Diametro: double): integer;
// Visor
procedure Visor(s: string);
procedure VisorModoEsperaTicket(Date: TDateTime);
procedure VisorModoInsercionLinea(importe: double; descArticulo: string);
procedure VisorModoCobroTicket(total: double);
function VisorActivo: boolean;
function TextoAlineaDerecha(strNew, strBase: string): string;
function TextoAlineaIzquierda(strNew, strBase: string): string;
function TextoAlineaCentro(strNew, strBase: string): string;

// Restriccion de series
function dame_serie_activa(Serie: string): string;

// Cuerpo del correo para mandar documentos en pdf
procedure InicializaVariableEmail(Tipo: string);
procedure DamePartesEmail(var Asunto: string; var CuerpoMail: TStrings);
function ExportarPDF(Report: TfrReport; NomFichero: string): string; overload;
function ExportarPDF(Report: TfrxReport; NomFichero: string): string; overload;
function HayCambioIVATarifa(Tarifa_new, Tarifa_old: string): boolean;
procedure CambiaTarifaVentas(id_s: integer; Tarifa, Tarifa_old: string);

// Verificacion de email valido
function FormatoEmailValido(s: string): boolean;

// Rectificacion
function es_serie_rectificacion(serie: string): boolean;
function SerializadoAuto: boolean;
function HayDatosDetalle(id_s: integer): boolean;
function TienePromociones(id_detalles_s: integer): boolean;

function UdsEnteras(ID_A: integer): boolean;
function CalculaMascara(Decimales: smallint; MostrarCeros: boolean): string;

procedure CalcCRC32(p: pointer; ByteCount: DWORD; var CRCValue: DWORD);
function CalcCRC32Str(s: string): string;

function CalcCRC8Str(Buffer: string; Polynom: cardinal = $07; Initial: cardinal = 0): cardinal;
// function CalcCRC8Str(s: string): string;

procedure CapturarPantalla(Filename: string);
procedure EnviarAdjunto(De, Para, Asunto, Cuerpo: string; Adjunto: string);

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric; FontType: integer; Data: Pointer): integer; stdcall;

procedure AbreWord(archivo: string);
function LimpiaNIF(Pais, nif: string): string;
function LimpiaCadena(s: string): string;
function LimpiaCadenaBasica(s: string): string;
function LimpiaCadenaNumero(s: string): string;
function ContieneCaracteresNoPermitidos(TextoAVerificar, CaracteresNoPermitidos: string): boolean;
procedure ExportarCSV(Fichero, SQL: string; Separador: string = ';'; EntrecomillarString: boolean = True; Encabezado: boolean = True; FechaSinHora: boolean = False; SeparadorDecimal: string = '.'; ProgressBar: TProgressBar = nil); overload;
procedure ExportarCSV(Fichero: string; DataSource: TDataSource; Separador: string = ';'; EntrecomillarString: boolean = True; Encabezado: boolean = True; FechaSinHora: boolean = False; SeparadorDecimal: string = '.'; ProgressBar: TProgressBar = nil); overload;
procedure ExportarExcel(Fichero, SQL: string; Encabezado: boolean = True; FechaSinHora: boolean = False; ProgressBar: TProgressBar = nil); overload;
procedure ExportarExcel(Fichero: string; DataSource: TDataSource; Encabezado: boolean = True; FechaSinHora: boolean = False; ProgressBar: TProgressBar = nil); overload;
function LimpiaCeldaExcel(s: string): string;
function ExcelColumnName(ColumnNumber: integer): string;

procedure LeerCSV(Grid: TStringGrid; const FileName: string; const aDelimiter: char = ','; const aStringDelimiter: char = '"');

function EncuentraTitulo(Grid: THYTDBGrid; Titulo: string): smallint; overload;
function EncuentraTitulo(Grid: TDBGridFind2000; Titulo: string): smallint; overload;
function EncuentraField(Grid: TDBGrid; aFieldName: string): smallint; overload;
procedure AgregaColumna(Grid: TDBGrid; aFieldName, DisplayName: string);
procedure HabilitaColumna(Grid: TDBGrid; aFieldName: string; Habilitada: boolean);

procedure HabilitaEdit(Componente: TControl; Habilitado: boolean);

{Listador Pegasus}
function GetFSize(FileName: string): integer;
function GetTempFile(const Extension: string): string;
function DelTree(DirName: string): boolean;

function MesStr(AMes: integer): string;
function DiaStr(Dia: integer): string; overload;
function DiaStr(Fecha: TDateTime): string; overload;
function StartAssociatedExe(Prg, FileName: string; var ErrorCode: cardinal): boolean;
function RunAndWait(Handle: THandle; Ejecutable, Argumentos: string; const RunDirectory: PChar = nil; const Visibilidad: integer = sw_shownormal; MensajeSiCorrecto: boolean = True): DWORD;

function DameIPLocal: string;
function DameMACLocal: string;
function DameIPPublica: string;
function GetWMIstring(wmiHost, wmiClass, wmiProperty: string): string;

function CalcHash(Stream: TStream; Algorithm: THashAlgorithm): string; overload;
function CalcHash(Archivo: string; Algorithm: THashAlgorithm): string; overload;
function CalcHashStr(Str: string; Algorithm: THashAlgorithm): string;

function SendARP(DestIp: DWORD; srcIP: DWORD; pMacAddr: pointer; PhyAddrLen: Pointer): DWORD; stdcall; external 'iphlpapi.dll';
function MySendARP(const IPAddress: string): string;
function EscapeURL(URL: string): string;
function DownloadToStream(Url: string; Stream: TStream): boolean;
function UploadFile(Url, Archivo: string): boolean;
function IsURL404(const URL: string): boolean;
function DescargaFichero(Url, RutaArchivoGuardado: string): boolean;

function StreamToStrB64(Stream: TStream; var Str: string): boolean; overload;
function StrB64ToStream(var Str: string; MStream: TMemoryStream): boolean;
function EncodeBase64(Input: Pointer; Size: integer): string;

function DameTempPath: string;
function DameWindowsDirectory: string;
function GetSpecialFolderPath(Folder: integer; CanCreate: boolean): string;

procedure ColorObjeto(aObject: TObject; ColorFondo, ColorTexto: TColor);
procedure ColorFocused(aObject: TObject);
procedure ColorNormal(aObject: TObject);
procedure ColorCampoID(aObject: TObject);
procedure ColorCampoEnlace(aObject: TObject);
procedure ColorResaltado(aObject: TObject);
procedure ColorResaltado2(aObject: TObject);
procedure ColorResaltado3(aObject: TObject);
procedure ColorResaltado4(aObject: TObject);
procedure ColorResaltado5(aObject: TObject);
procedure ColorResaltado6(aObject: TObject);
procedure ColorInfo(aObject: TObject);
procedure ColorEdicion(aObject: TObject);
procedure ColorError(aObject: TObject);
procedure ColorBloqueado(aObject: TObject);
procedure ColorInactivo(aObject: TObject);
procedure ColorInactivoInvisible(aObject: TObject);
procedure ColorSegunEstado(aObject: TObject; Estado: integer);
procedure ColorSegunEstadoRep(aObject: TObject; Estado: integer);
procedure ColorSegunSituacion(aObject: TObject; Situacion: integer);

function LeeDatoIni(const Section, Ident: string; Default: string = ''): string; overload;
function LeeDatoIni(const Section, Ident: string; Default: integer = 0): integer; overload;
// function LeeDatoIni(const Section, Ident: string; Default: Double = 0): Double; overload; // Es ambiguo con TDateTime.
function LeeDatoIni(const Section, Ident: string; Default: TDateTime = 0): TDateTime; overload;
function LeeDatoIni(const Section, Ident: string; Default: boolean = True): boolean; overload;
procedure EliminaDatoIni(const Section, Ident: string);
procedure EscribeDatoIni(const Section, Ident, Dato: string); overload;
procedure EscribeDatoIni(const Section, Ident: string; Dato: integer); overload;
// procedure EscribeDatoIni(const Section, Ident: string; Dato: Double); overload; // Es ambiguo con TDateTime.
procedure EscribeDatoIni(const Section, Ident: string; Dato: TDateTime); overload;
procedure EscribeDatoIni(const Section, Ident: string; Dato: boolean); overload;
procedure DeleteRow(StringGrid: TStringGrid; ARow: integer);
procedure ClearStringGrid(StringGrid: TStringGrid; MantenerColumnas: boolean = False; FilasMantener: integer = 0);
procedure Posicionar(DataSet: TDataSet; CampoId: string; Id: integer; Aproximada: boolean = False; DesdeElFinal: boolean = False); overload;
procedure Refrescar(DataSet: TDataSet; CampoId: string; Id: integer; Aproximada: boolean = False; DesdeElFinal: boolean = False); overload;
procedure Posicionar(DataSet: TDataSet; CampoId: string; Id: string; Aproximada: boolean = False; DesdeElFinal: boolean = False); overload;
procedure Refrescar(DataSet: TDataSet; CampoId: string; Id: string; Aproximada: boolean = False; DesdeElFinal: boolean = False); overload;
procedure AsignaDisplayFormat(DataSet: TDataSet; FloatDisplayFormat, IntDisplayFormat, DateDisplayFormat: string);

procedure GetBitmapFromImageList(aSpeedButton: TSpeedButton; GlyphNum: integer; SourceImgL: TImageList; ImgIdx: integer); overload;
procedure GetBitmapFromImageList(aBitBtn: TBitBtn; GlyphNum: integer; SourceImgL: TImageList; ImgIdx: integer); overload;
procedure GetBitmapFromImageList(aFlatButton: TFlatButton; GlyphNum: integer; SourceImgL: TImageList; ImgIdx: integer); overload;

function SetLuminanceToRGBValue(Value, CurrentLum, NewLum: integer): byte;
function SetLuminanceToRGB(Color: TColor; NewLum: integer): TColor;
function Brighten(Color: TColor; Factor: integer): TColor;
function Darken(Color: TColor; Factor: integer): TColor;
function ChangeBrightness(Color: TColor; Factor: integer): TColor;
function HTMLToColorToHex(s: string): string;
function HEXToColor(hex: string): TColor;
function DameColor(Color: TColor): TColor;

procedure DameMinMax(Tipo: string; var Min, Max: string; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0); overload;
procedure DameMinMax(Tipo: string; var Min, Max: integer; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0); overload;
procedure DameMinMax(Tipo: string; var Min, Max: TDateTime; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0); overload;
procedure DameDesdeHastaPeriodo(Periodo: string; var Desde, Hasta: TDateTime; Empresa: integer = 0; Ejercicio: integer = 0);

function DameTransactionRW(BaseDeDatos: TFIBDatabase; Q: TComponent = nil): TFIBTransaction;
function DameTransactionRO(BaseDeDatos: TFIBDatabase; Q: TComponent = nil): TFIBTransaction;

procedure CrearCodigoQR(Bitmap: TBitmap; s: string; Factor: integer = 1);
function NumerosALetras(Numero: double): string;
function ExisteParametro(DS: TFIBDataSet; Parametro: string): boolean; overload;
function ExisteParametro(DS: TFIBDataSetRO; Parametro: string): boolean; overload;
function PS_Get(aURL, Token: string): string;
function PS_Post(aURL, Token, Datos: string): string;
// Conversiones para formato de fecha ISO8601 - (Ej. 2020-03-30 09:33:43)
function FormatDateISO8601(const d: TDateTime): string;
function FormatDateTimeISO8601(const d: TDateTime): string;
function DateISO8601ToDateTime(const s: string): TDateTime;
function SegundosToStr(Valor: double): string;
function StrToDateDD_MM_YYYY(s: string): TDateTime;
function StrToDateYYYY_MM_DD(s: string): TDateTime;
function StrToDateYYYYMMDD(s: string): TDateTime;
function StrToDateYYYYMMDD_HH_NN_SS(s: string): TDateTime;
function StrExcelToDateTime(s: string): TDateTime;

function MySelectDirectory(var Directorio: string; Ambito: string = ''): boolean;
function MySaveDialog(var Archivo: string; Extensiones: string = ''; Ubicacion: string = ''; Ambito: string = ''): boolean;
function MyOpenDialog(var Archivo: string; Extensiones: string = ''; Ubicacion: string = ''; Ambito: string = ''): boolean;
function LimpiaNombreFichero(s: string; CaracterReemplazo: string = '_'): string;
function DameNombreFichero(Tipo: string; Ejercicio: integer; Serie: string; Numero: integer; NombreCliProAcr: string; NombreAgente: string; Extension: string): string;

function CryptUIDlgSelectCertificateFromStoreCert(Handle: HWND; cTitle: WideString; cDescr: WideString): string;
(*
procedure CompressStream(inpStream, outStream: TStream);
procedure ExpandStream(inpStream, outStream: TStream);
*)
function win_regRead(Mykey, MyField: string; MostrarMensajeError: boolean = True): string;
function GetNativeSystemInfo(var SystemInfo: TSystemInfo): boolean;
function IsWindows64: boolean;
procedure GetBuildInfo(Fichero: string; var Major, Minor, Release, Build: word);

procedure CalculaTotales(Grid: TDBGrid; var Totales: array of double; CamposExepcion: string = '');
procedure PintaTotales(PNLTotales: TPanel; Grid: TDBGrid; Totales: array of double; CamposExepcion: string = '');

procedure DameCoordenadasDireccion(Direccion: string; var Lat, Lon: double);
function DameImagenMapa(Lat, Lon: double; SoloSiExisteFichero: boolean = False; Width: integer = 600; Height: integer = 400; Zoom: integer = 15): string;

function PrettyJSON(const S: string): string;

implementation

uses JwaWinCrypt, JwaWinType, JwaCryptUIApi, UDMMain, UEntorno, UFMForeignKey, UFormGest, Printers, ShellAPI, Winsock, IdHttp,
  IdMultipartFormData, WinInet, WbemScripting_TLB, ActiveX, Variants,
  DateUtils, ShlObj, IniFiles, DelphiZXingQRCode, UParam,
  UHojaCalc, UHYDirectoryDialog, Registry, ULFDBComboBoxValue, ULFREdit, UlkJSON (*, ZLib*),
  UDBDateTimePicker, DbComboBoxValue, RxLookup, UDameDato;

const
  PROCESSOR_ARCHITECTURE_AMD64 = 9;
  {$EXTERNALSYM PROCESSOR_ARCHITECTURE_AMD64}
  PROCESSOR_ARCHITECTURE_IA64 = 6;
  {$EXTERNALSYM PROCESSOR_ARCHITECTURE_IA64}

type
  HCRYPTPROV = ULONG;
  PHCRYPTPROV = ^HCRYPTPROV;
  HCRYPTKEY = ULONG;
  PHCRYPTKEY = ^HCRYPTKEY;
  HCRYPTHASH = ULONG;
  PHCRYPTHASH = ^HCRYPTHASH;
  LPAWSTR = PAnsiChar;
  ALG_ID = ULONG;

const
  CRYPT_NEWKEYSET = $00000008;
  PROV_RSA_FULL = 1;
  CALG_MD5 = $00008003;
  CALG_SHA1 = $00008004;
  HP_HASHVAL = $0002;

const
  MaxFactor = 100;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric; FontType: integer; Data: Pointer): integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

function ConfirmaMensajeCaption(Mensaje, Caption: string): boolean;
begin
  if (Caption = '') then
     Caption := _('Confirmación');
  Result := (Application.MessageBox(PChar(Mensaje), PChar(Caption),
     mb_iconstop + mb_yesno) = id_yes);
end;

function ConfirmaMensaje(Mensaje: string): boolean;
begin
  Result := ConfirmaMensajeCaption(Mensaje, _('Confirmación'));
end;

function Confirma: boolean;
begin
  Result := ConfirmaMensaje(_('Confirme el proceso'));
end;

function ConfirmaGrave: boolean;
begin
  Result := ConfirmaMensajeCaption(_('Proceso Irreversible, debe confirmar'), _('Peligro'));
end;

function LimpiaMensaje(e: Exception): string;
var
  auxStr : string;
  posicion : integer;
begin
  Result := '';

  posicion := Pos('.', E.Message);
  if posicion <> 0 then
  begin
     auxStr := Copy(E.Message, Posicion + 1, Length(E.Message));
     posicion := Pos('.', auxStr);
     if posicion <> 0 then
        Result := Copy(auxStr, Posicion + 1, Length(auxStr));
  end;
end;

procedure MensajesDeError(e: Exception);
var
  eCodigo : integer;
  Mensaje : PChar;
  Procesado : boolean;
  auxStr, aux : string;
  posicion : integer;
begin
  Mensaje := '';
  Procesado := False;
  if (e.ClassName = 'EDBEngineError') then
  begin
     eCodigo := EDBEngineError(e).errors[0].ErrorCode;
     Mensaje := MensError(eCodigo);
     Procesado := True;
  end;
  if (e is EFIBError) then
  begin
     case EFIBError(e).SQLCode of
        isc_deadlock, -913, -901:
        begin
           aux := _('El registro seleccionado está siendo modificado por otro usuario.');
           Mensaje := PChar(aux + #13#10 + #13#10 + e.Message);
        end;
        -530:
        begin
           auxStr := Copy(E.Message, Pos('FK_', UpperCase(E.Message)), 31);
           if Pos('"', auxStr) > 0 then
           begin
              auxStr := Copy(auxStr, 1, Pos('"', auxStr) - 1);
              aux := PChar(AuxStr);
           end;
           CapturarPantalla(DameTempPath + 'PantallaError_' + FormatDateTime('yyyymmdd"-"hhnnss', Now) + '.jpg');
           { TODO : EnviarAdjunto cuando hay un error (exception y captura de pantalla) }
           //EnviarAdjunto('contabilidad@dikram.es','duilio.isola@dikram.es','[BUG] - AdministraXXI',E.Message,DameTempPath+'PantallaError_'+FormatDateTime('yyyymmdd"-"hhnnss',Now)+'.jpg');
           TFMForeignKey.Create(Application).ShowForeign(auxStr, e.Message);

           Exit;
        end;
        -625: Mensaje := PChar(DevuelveCampoDelMensaje(E.Message));
        -803:
        begin
           aux := _('Se está intentando insertar un registro duplicado.');
           Mensaje := PChar(aux + #13#10 + #13#10 + e.Message);
        end;
        -836:
        begin
           posicion := Pos('.', E.Message);
           if posicion <> 0 then
           begin
              auxStr := Copy(E.Message, Posicion + 1, Length(E.Message));
              posicion := Pos('.', auxStr);
              if posicion <> 0 then
              begin
                 auxStr := Copy(auxStr, Posicion + 1, Length(auxStr));
                 Mensaje := PChar(auxStr + #13#10 + #13#10 + e.Message);
              end;
           end;
        end;
        else
           Mensaje := PChar(EFIBError(e).Message);
     end;
     Procesado := True;
  end;
  if not Procesado then
     Mensaje := PChar(e.Message);
  CapturarPantalla(DameTempPath + 'PantallaError_' + FormatDateTime('yyyymmdd"-"hhnnss', Now) + '.jpg');
  { TODO : EnviarAdjunto cuando hay un error (exception y captura de pantalla) }
  //EnviarAdjunto('contabilidad@dikram.es','duilio.isola@dikram.es','[BUG] - AdministraXXI',E.Message,DameTempPath+'PantallaError_'+FormatDateTime('yyyymmdd"-"hhnnss',Now)+'.jpg');
  Application.MessageBox(Mensaje, PChar(string(_('Alerta'))), MB_OKCANCEL);
end;

function MensError(nError: integer): PChar;
var
  s : string;
begin
  case nError of
     9729: s := _('Clave primaria duplicada');
     9732: s := _('Longitud de clave inadecuada');
     11972: s := _('No se cumplen las reglas de validación');
     13059: s := _('Inconsistencia en los datos');
     else
        s := IntToStr(nError);
  end;
  Result := PChar(s);
end;

function GetOSInfo: string;
var
  Platform : string;
  BuildNumber : integer;
begin
  case Win32Platform of
     VER_PLATFORM_WIN32_WINDOWS:
     begin
        Platform := 'Windows 95';
        BuildNumber := Win32BuildNumber and $0000FFFF;
     end;
     VER_PLATFORM_WIN32_NT:
     begin
        Platform := 'Windows NT';
        case Win32MajorVersion of
           4:
           begin
              case Win32MinorVersion of
                 0: Platform := 'Windows NT';
              end;
           end;
           5:
           begin
              case Win32MinorVersion of
                 0: Platform := 'Windows 2000';
                 1: Platform := 'Windows XP';
                 2: Platform := 'Windows Server2003';
              end;
           end;
           6:
           begin
              case Win32MinorVersion of
                 0: Platform := 'Windows Vista';
                 1: Platform := 'Windows 7';
              end;
           end;
        end;
        BuildNumber := Win32BuildNumber;
     end;
     else
     begin
        Platform := 'Windows';
        BuildNumber := 0;
     end;
  end;
  if (Win32Platform = VER_PLATFORM_WIN32_WINDOWS) or
     (Win32Platform = VER_PLATFORM_WIN32_NT) then
  begin
     if Win32CSDVersion = '' then
        Result := Format('%s %d.%d (Build %d)', [Platform, Win32MajorVersion,
           Win32MinorVersion, BuildNumber])
     else
        Result := Format('%s %d.%d (Build %d: %s)', [Platform, Win32MajorVersion,
           Win32MinorVersion, BuildNumber, Win32CSDVersion]);
  end
  else
     Result := Format('%s %d.%d', [Platform, Win32MajorVersion,
        Win32MinorVersion]);
end;

procedure AbreTablas(Contenedor: TDataModule);
var
  n : integer;
begin
  with Contenedor do
     for n := 0 to (ComponentCount - 1) do
        if (Components[n] is TTable) then
           TTable(Components[n]).Open;
end;

procedure CierraTablas(Contenedor: TDataModule);
var
  n : integer;
begin
  with Contenedor do
     for n := ComponentCount - 1 downto 0 do
        if (Components[n] is TTable) then
           TTable(Components[n]).Close;
end;

procedure AbreQueries(Contenedor: TDataModule);
var
  n : integer;
begin
  with Contenedor do
     for n := 0 to (ComponentCount - 1) do
        if (Components[n] is TQuery) then
           TQuery(Components[n]).Open;
end;

procedure CierraQueries(Contenedor: TDataModule);
var
  n : integer;
begin
  with Contenedor do
     for n := ComponentCount - 1 downto 0 do
        if (Components[n] is TQuery) then
           TQuery(Components[n]).Close;
end;

procedure AbreFIB(Contenedor: TDataModule);
var
  n : integer;
begin
  with Contenedor do
     for n := 0 to (ComponentCount - 1) do
        if (Components[n] is TFIBDataSet) then
           TFIBDataSet(Components[n]).Open;
end;

procedure CierraFIB(Contenedor: TDataModule);
var
  n : integer;
begin
  with Contenedor do
     for n := ComponentCount - 1 downto 0 do
        if (Components[n] is TFIBDataSet) then
           TFIBDataSet(Components[n]).Close;
end;

function IsNum(Cadena: string): boolean;
begin
  Result := False;
  if Length(Cadena) > 0 then
     Result := (Cadena[1] in
        ['0'..'9', '-', ThousandSeparator, DecimalSeparator]);
end;

function ExpandirCadena(cadena: string; long: integer = 0): string;
var
  cad_ini, cad_fin : string;
begin
  if (Long = 0) then
     Long := LongExpansion;

  if (Pos('.', cadena) = 0) then
  begin
     Result := cadena;
     Exit;
  end;

  cad_ini := Copy(cadena, 0, Pos('.', cadena) - 1);
  cad_fin := Copy(cadena, Pos('.', cadena) + 1, Length(cadena));

  if (Length(cad_ini) + Length(cad_fin)) > Long then
     cad_fin := Copy(cad_fin, Length(cad_fin) - (long - Length(cad_ini) - 1),
        Length(cad_fin));

  Result := cad_ini + StringOfChar('0', long - Length(cad_ini) - Length(cad_fin)) + cad_fin;
end;

procedure ExpandirCadenaEdit(Sender: TEdit);
begin
  Sender.Text := ExpandirCadena(Sender.Text, REntorno.DigitosSub);
end;

procedure ExpandirCadenaEdit(Sender: TDBEdit);
begin
  Sender.Text := ExpandirCadena(Sender.Text, REntorno.DigitosSub);
  Sender.Field.AsString := Sender.Text;
end;

procedure PaginaExclusiva_Si(Pagina: TTabSheet);
var
  i, n : integer;
begin
  i := Pagina.PageIndex;
  Pagina.TabVisible := True;
  Pagina.Show;
  with Pagina.PageControl do
     for n := 0 to (PageCount - 1) do
        if (n <> i) then
           Pages[n].TabVisible := False;
end;

procedure PaginaExclusiva_No(Pagina: TTabSheet);
var
  n : integer;
begin
  with Pagina.PageControl do
     for n := 0 to (PageCount - 1) do
        Pages[n].TabVisible := True;
end;

procedure IconosCaption(Ventana: TForm; Estado: boolean);
var
  n, w, h : integer;
begin
  if not Estado then
  begin
     h := 22;
     w := 23;
  end
  else
  begin
     h := 35;
     w := 66;
  end;
  with Ventana do
     for n := 0 to (ComponentCount - 1) do
        if (Components[n] is TToolBar) then
        begin
           TToolBar(Components[n]).ShowCaptions := Estado;
           TToolBar(Components[n]).ButtonHeight := h;
           TToolBar(Components[n]).ButtonWidth := w;
        end;
end;

function DevuelveMoneda(descripcion: string): string;
begin
  DevuelveMoneda := Copy(descripcion, 1, Pos('-', descripcion) - 1);
end;

function OnlyNumbers(cadena: string): string;
var
  TmpStr : string;
  i : integer;
begin
  TmpStr := '';
  if cadena = '' then
     Exit;
  for i := 1 to Length(cadena) do
     if (cadena[i] >= '0') and (cadena[i] <= '9') then
        TmpStr := TmpStr + cadena[i];

  Result := TmpStr;
end;

function FormatNIF(Field: TField): string;
var
  TmpStr : string;
  Tipo : byte;
begin
  TmpStr := UpperCase(Field.Text);
  Result := '';
  if TmpStr = Result then
     Exit;

  case TmpStr[1] of // ¿ Es un CIF ?
     'A'..'Z': Tipo := 1;
     else
        Tipo := 0;
  end;

  case TmpStr[Length(TmpStr)] of // O es un NIF
     'A'..'Z': Tipo := Tipo + 2;
  end;

  if Tipo = 0 then // Si no es ni NIF ni CIF sale
  begin
     ShowMessage(_('El CIF o NIF introducido no es correcto. Falta la Letra'));
     Exit; // No puede ser ninguno de los dos
  end;

  Result := OnlyNumbers(TmpStr);
  if Result = '' then
  begin
     ShowMessage(_('El CIF o NIF introducido no es correcto. No tiene números'));
     Exit;
  end;

  case Tipo of
     1: Result := TmpStr[1] + '-' + Result; // CIF
     2: Result := Result + '-' + TmpStr[Length(TmpStr)]; // NIF
     3: Result := TmpStr[1] + '-' + Result + '-' + TmpStr[Length(TmpStr)];
     else
        Result := '';
  end;
end;

function NIFGetLetra(Dni: string): char;
const
  cadena: string = 'RWAGMYFPDXBNJZSQVHLCKET';
var
  aux : integer;
begin
  aux := StrToInt(Dni) mod 23;
  if aux <> 0 then
     Result := cadena[aux]
  else
     Result := ' ';
end;

function RUTGetLetra(Dni: string): char;
var
  i, i2, Total : integer;
begin
  if ((Length(Dni) > 10) or (Length(Dni) < 9)) then
     Result := ' '
  else
  begin
     try
        // Recorro desde el final omitiendo el digito de control
        i2 := 2;
        Total := 0;
        for i := Length(Dni) - 1 downto 1 do
        begin
           if (i2 > 7) then
              i2 := 2;
           Total := Total + StrToInt(Dni[i]) * i2;
           Inc(i2);
        end;

        // Digito de Control = 11 - (Total Mod 11);
        case (11 - (Total mod 11)) of
           10: Result := 'K';
           11: Result := '0';
           else
              Result := IntToStr(11 - (Total mod 11))[1];
        end;
     except
        Result := ' ';
     end;
  end;
end;

{ ***************************************************************

   Actualizar la consulta SQL para refrescar las descripciones

  *************************************************************** }

{ Actualiza el Banco de la tabla deseada }
procedure Actualiza_Banco(Tabla: TFIBDataSetRO; Banco: integer);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Banco'].AsInteger := Banco;
     Open;
  end;
end;

{ Actualiza el Talon de la tabla deseada }
procedure Actualiza_Talon(Tabla: TFIBDataSetRO; talon: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Talon'].AsString := talon;
     Open;
  end;
end;

{ Actualiza el Talon de la tabla deseada }
procedure Actualiza_Pagare(Tabla: TFIBDataSetRO; pagare: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Pagare'].AsString := pagare;
     Open;
  end;
end;

{ Actualiza la Cuenta de la tabla deseada }
procedure Actualiza_Cuenta(Tabla: TFIBDataSetRO; Cuenta: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['cuenta'].AsString := cuenta;
     Open;
  end;
end;

{ Actualiza el Artículo de la tabla deseada }
procedure Actualiza_Articulo(Tabla: TFIBTableSet; art: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := art;
     Open;
  end;
end;

procedure Actualiza_ArticuloRO(Tabla: TFIBDataSetRO; art: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Articulo'].AsString := art;
     Open;
  end;
end;

{ Actualiza la Familia de la tabla deseada }
procedure Actualiza_Familia(Tabla: TFIBTableSet; familia: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Familia'].AsString := familia;
     Open;
  end;
end;

procedure Actualiza_FamiliaRO(Tabla: TFIBDataSetRO; familia: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Familia'].AsString := familia;
     Open;
  end;
end;

{ Actualiza el Almacén de la tabla deseada }
procedure Actualiza_Almacen(Tabla: TFIBTableSet; almacen: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Almacen'].AsString := almacen;
     Open;
  end;
end;

procedure Actualiza_AlmacenRO(Tabla: TFIBDataSetRO; almacen: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Almacen'].AsString := almacen;
     Open;
  end;
end;

{ Actualiza Tipo de Valoración de la tabla deseada }
procedure Actualiza_TipoValor(Tabla: TFIBTableSet; tipo: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Tipo'].AsInteger := StrToIntDef(tipo, 0);
     Open;
  end;
end;

procedure Actualiza_TipoValorRO(Tabla: TFIBDataSetRO; tipo: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Tipo'].AsInteger := StrToIntDef(tipo, 0);
     Open;
  end;
end;

{ Actualiza el Agente de la tabla deseada }

procedure Actualiza_Agente(Tabla: TFIBTableSet; agente: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Agente'].AsInteger := StrToIntDef(agente, 0);
     Open;
  end;
end;

procedure Actualiza_AgenteRO(Tabla: TFIBDataSetRO; agente: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Agente'].AsInteger := StrToIntDef(agente, 0);
     Open;
  end;
end;

procedure Actualiza_AgenteEmpRO(Tabla: TFIBDataSetRO; agente: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Agente'].AsInteger := StrToIntDef(agente, 0);
     Open;
  end;
end;

{ Actualiza el Periodo de la tabla deseada }
procedure Actualiza_Periodo(Tabla: TFIBTableSet; periodo: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Periodo'].AsString := periodo;
     Open;
  end;
end;

procedure Actualiza_PeriodoRO(Tabla: TFIBDataSetRO; periodo: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Periodo'].AsString := periodo;
     Open;
  end;
end;

{ Actualiza la Tarifa de la tabla deseada }
procedure Actualiza_Tarifa(Tabla: TFIBTableSet; tarifa: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Tarifa'].AsString := tarifa;
     Open;
  end;
end;

procedure Actualiza_TarifaRO(Tabla: TFIBDataSetRO; tarifa: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Tarifa'].AsString := tarifa;
     Open;
  end;
end;

{ Actualiza el Proveedor de la tabla deseada }
procedure Actualiza_Proveedor(Tabla: TFIBTableSet; prov: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Proveedor'].AsInteger := StrToIntDef(prov, 0);
     Open;
  end;
end;

procedure Actualiza_ProveedorRO(Tabla: TFIBDataSetRO; prov: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Proveedor'].AsInteger := StrToIntDef(prov, 0);
     Open;
  end;
end;

procedure Actualiza_ProveedorEmpRO(Tabla: TFIBDataSetRO; prov: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Proveedor'].AsInteger := StrToIntDef(prov, 0);
     Open;
  end;
end;

{ Actualiza el Acreedor de la tabla deseada }
procedure Actualiza_Acreedor(Tabla: TFIBTableSet; acr: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Acreedor'].AsInteger := StrToIntDef(acr, 0);
     Open;
  end;
end;

procedure Actualiza_AcreedorRO(Tabla: TFIBDataSetRO; acr: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Acreedor'].AsInteger := StrToIntDef(acr, 0);
     Open;
  end;
end;

{ Actualiza el Cliente de la tabla deseada }
procedure Actualiza_Cliente(Tabla: TFIBTableSet; cliente: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Cliente'].AsInteger := StrToIntDef(cliente, 0);
     Open;
  end;
end;

procedure Actualiza_ClienteRO(Tabla: TFIBDataSetRO; cliente: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Cliente'].AsInteger := StrToIntDef(cliente, 0);
     Open;
  end;
end;

procedure Actualiza_ClienteEmpRO(Tabla: TFIBDataSetRO; cliente: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Cliente'].AsInteger := StrToIntDef(cliente, 0);
     Open;
  end;
end;

{ Actualiza el Serie de la tabla deseada }
procedure Actualiza_Serie(Tabla: TFIBTableSet; serie: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Serie'].AsString := serie;
     Open;
  end;
end;

procedure Actualiza_SerieRO(Tabla: TFIBDataSetRO; serie: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Canal'].AsInteger := REntorno.Canal;
     Params.ByName['Serie'].AsString := serie;
     Open;
  end;
end;

procedure Actualiza_SerieEmpRO(Tabla: TFIBDataSetRO; serie: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Serie'].AsString := serie;
     Open;
  end;
end;

{ Actualiza el Estado de la tabla deseada }
procedure Actualiza_Estado(Tabla: TFIBTableSet; estado: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Estado'].AsInteger := StrToIntDef(estado, 0);
     Open;
  end;
end;

procedure Actualiza_EstadoRO(Tabla: TFIBDataSetRO; estado: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Estado'].AsInteger := StrToIntDef(estado, 0);
     Open;
  end;
end;

{ Actualiza la Campanya de la tabla deseada }
procedure Actualiza_Campanya(Tabla: TFIBDataSetRO; campanya: string);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['Campanya'].AsInteger := StrToIntDef(campanya, 0);
     Open;
  end;
end;

procedure Actualiza_CanalRO(Tabla: TFIBDataSetRO; canal: smallint);
begin
  with Tabla do
  begin
     Close;
     Params.ByName['Empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['Canal'].AsInteger := canal;
     Open;
  end;
end;

// Añadir la hora a una fecha
function HourIntoDate(MyDate: TDateTime; const MyHour: string): TDateTime;
var
  auxReal : real;
  auxDate : TDateTime;
begin
  auxDate := StrToTime(MyHour);
  auxReal := Frac(auxDate);
  Result := Trunc(MyDate) + auxReal;
end;

// Rellenar a un string arteriscos por la izquierda
procedure RellenarArteriscos(var cad: string; long: integer);
var
  i : integer;
begin
  cad := Trim(cad);
  long := long - Length(cad);
  for i := 1 to long do
     cad := '*' + cad;
end;

function AreAllNumbers(const cadena: string): boolean;
var
  i, long : integer;
begin
  Result := True;
  long := Length(cadena);
  for i := 1 to long do
     if (cadena[i] < '0') or (cadena[i] > '9') then
     begin
        Result := False;
        Exit;
     end;
end;

procedure ModificaSelect(Tabla: TFIBTableSet; Condicion: string; Poner: boolean);
var
  orden : string;
  posicion : integer;
  tempsql : string;
begin
  if Pos(' ', Condicion) <> 1 then
     Condicion := ' ' + Condicion;
  Tabla.Close;
  if Poner = True then
     with Tabla do
     begin
        if (Pos(Condicion, SelectSQL.Text) = 0) then
        begin
           orden := OrdenadoPor;
           Ordenar('');
           SelectSQL.Text := SelectSQL.Text + Condicion;
           Ordenar(orden);
        end;
     end
  else
     with Tabla do
     begin
        posicion := Pos(Condicion, SelectSQL.Text);
        if posicion <> 0 then
        begin
           tempsql := Copy(SelectSQL.Text, 1, posicion);
           tempsql := tempsql + Copy(SelectSQL.Text, posicion + Length(Condicion),
              Length(SelectSQL.Text));
           SelectSQL.Text := tempsql;
        end;
     end;
end;

procedure SolapaControles(Control1: TControl; Control2: TWinControl);
{Solapa dos controles (BitButton y DBEdit p.e.) separados por uno o varios paneles p.e.}
var
  MargenSuperior, MargenIzquierdo : integer;
  padre : TWinControl;
begin
  MargenSuperior := 0;
  MargenIzquierdo := 0;
  padre := Control2.parent;
  while (padre <> Control1.Parent) and (not (padre is TForm)) do
  begin
     MargenSuperior := MargenSuperior + Padre.Top;
     MargenIzquierdo := MargenIzquierdo + Padre.Left;
     padre := padre.parent;
  end;
  Control1.Height := Control2.Height;
  Control1.Width := Control2.Width;
  Control1.Top := Control2.Top + MargenSuperior;
  Control1.Left := Control2.Left + MargenIzquierdo;
end;

// Envio de datos binarios a una impresora o puerto
// Armando

procedure Imprimir(PrinterName: string; const Data; Count: cardinal);
  overload;
type
  TDocInfo1 = record
     DocName, OutputFile, DataType: PChar;
  end;
var
  hPrinter : THandle;
  DocInfo : TDocInfo1;
  BytesWritten : cardinal;
begin
  DocInfo.DocName := 'Document';
  Docinfo.OutputFile := nil;
  DocInfo.DataType := 'RAW';
  if not (OpenPrinter(PChar(PrinterName), hPrinter, nil)) then
     raise Exception.Create(Format(_('Imposible abrir Impresora %s. Compruebe configuración.'), [PrinterName]));

  try
     if StartDocPrinter(hPrinter, 1, @DocInfo) = 0 then
        raise Exception.Create(Format(_('No se puede iniciar el documento en %s'), [PrinterName]));
     try
        if not StartPagePrinter(hPrinter) then
           raise Exception.Create(Format(_('No se puede inicar página de impresión en %s'), [PrinterName]));

        try
           if not WritePrinter(hPrinter, @Data, Count, BytesWritten) then
              raise Exception.Create(Format(_('Es imposible escribir en %s'), [PrinterName]));
        finally
           if not EndPagePrinter(hPrinter) then
              raise Exception.Create(Format(_('No se puede finalizar el página en %s'), [PrinterName]));
        end;
     finally
        if not EndDocPrinter(hPrinter) then
           raise Exception.Create(Format(_('Imposible finalizar documento en %s'), [PrinterName]));
     end;
  finally
     ClosePrinter(hPrinter);
  end;
  if BytesWritten <> Count then
     raise Exception.Create(_('¡ ERROR FATAL !'));
end;

procedure ImprimirBinario(PrinterName: string; const Data: string);
  overload;
begin
  Imprimir(PrinterName, PChar(Data)^, Length(Data));
end;

function ProcesaCodigos(Codigos: string): string;
var
  i : integer;
  caracter : string;
begin
  caracter := '';
  Result := '';
  for i := 1 to Length(Codigos) do
  begin
     if Codigos[i] = ';' then
     begin
        Result := Result + chr(StrToInt(caracter));
        caracter := '';
     end
     else
        caracter := caracter + Codigos[i];
  end;
  if caracter <> '' then
     Result := Result + chr(StrToInt(caracter));
end;

procedure CortePapel;
begin
  if (REntorno.CortePapel <> '') then
  begin
     Application.ProcessMessages;
     ImpresionDirecta(REntorno.Ticketera, ProcesaCodigos(REntorno.CortePapel));
  end;
end;

procedure AbrirCajon;
begin
  if (REntorno.Cajon <> '') and (REntorno.AbrirCajon <> '') then
  begin
     Application.ProcessMessages;
     ImpresionDirecta(REntorno.Cajon, ProcesaCodigos(REntorno.AbrirCajon));
  end;
end;

procedure ImpresionTexto(Texto: TStrings);
var
  t : TextFile;
  i : integer;
begin
  AssignPrn(t);
  Rewrite(t);
  try
     // Printer.Canvas.Font := DBMINfo.Font;
     for i := 0 to Texto.Count - 1 do
        WriteLn(t, Texto[i]);
  finally
     CloseFile(t);
  end;
end;

procedure ImpresionDirecta(Impresora: string; Data: string);
var
  Puerto : string;
  Fichero : TextFile;
begin
  // Cogemos el puerto de la impresora a imprimir
  Puerto := Impresora;
  if ((Impresora <> 'COM1:') and
     (Impresora <> 'COM2:') and
     (Impresora <> 'COM3:') and
     (Impresora <> 'COM4:') and
     (Impresora <> 'LPT1:') and
     (Impresora <> 'LPT2:') and
     (Impresora <> 'LPT3:') and
     (Impresora <> 'LPT4:')) then
     getRealPrinter(Impresora, Puerto);

  AssignFile(Fichero, Puerto);
  try
     try
        Rewrite(Fichero);
        Write(Fichero, Data);
     except
        // ShowMessage(Format(_('No se ha podido enviar el comando %s a la impresora %s (puerto %s)'), [Data, Impresora, Puerto]))
     end;
  finally
     CloseFile(Fichero);
  end;
end;

function DevuelveCampoDelMensaje(m: string): string;
  //Devuelve el error con el campo que lo provocó y su valor
var
  i : integer;
  j : integer;
  s : string;
  pc : integer;
  aux : string;
  sc : integer;
begin
  pc := Pos('"', m);
  aux := Copy(m, pc + 1, Length(m) - pc);
  sc := Pos('"', aux);
  j := Pos('null', m);
  i := Pos('column', m);
  if i > 0 then
  begin
     s := Copy(m, i + Length('column'), Length(m) - (i + Length('column')));
     i := Pos('column', s);
     if i > 0 then
     begin
        s := Copy(s, i + Length('column'), Length(s) - (i + Length('column')));
        i := Pos(',', s);
        s := Copy(s, 1, i - 1);
        if j > 0 then //Valor nulo
           Result := Format(_('El campo %s no puede ser vacio.'), [s])
        else
           Result := Format(_('El campo %s no puede ser %s'), [s, Copy(aux, 1, sc - 1)]);
     end;
  end;

  Result := Result + #13#10 + #13#10 + m;
end;

function Ajusta(Cadena, Orientacion: string; Longitud: integer; Relleno: char): string;
begin
  // Limpio Cadena
  Cadena := Trim(Cadena);

  // Corto cadena si es mayor a la Longitud aceptada
  if Length(Cadena) > Longitud then
     Cadena := Copy(Cadena, 1, Longitud);

  // Relleno espacio restante en la Cadena
  if UpperCase(Orientacion) = 'I' then
     // Caracteres de rellena a Izquierda
     Result := StringOfChar(Relleno, Longitud - Length(Cadena)) + Cadena
  else
     // Caracteres de rellena a Derecha
     Result := Cadena + StringOfChar(Relleno, Longitud - Length(Cadena));
end;

function LimpiaStrNumero(s: string; SeparadorDecimal: char = ' '): string;
var
  i : integer;
begin
  /// Devuelve un string que contiene solo numeros, separador decimal, "+" y "-".

  Result := '';
  for i := 1 to Length(s) do
  begin
     if (SeparadorDecimal = ' ') then
        SeparadorDecimal := DecimalSeparator;

     if IsNumeric(s[i]) or (s[i] in [SeparadorDecimal, '+', '-']) then
        Result := Result + s[i];
  end;
end;

function StrToFloatDef(s: string; Default: double): double;
begin
  try
     // Quito caracteres no validos
     s := LimpiaStrNumero(s);

     if (s = '') then
        Result := Default
     else
        Result := StrToFloat(s);
  except
     Result := Default;
  end;
end;

function StrToFloatDec(s: string; SeparadorDecimal: char): double;
begin
  // ShowMessage('StrToFloatDec('''+s+''', '''+SeparadorDecimal+''')') ;
  Result := 0;

  // Quito caracteres no validos
  s := LimpiaStrNumero(s, SeparadorDecimal);

  if (s > '') then
  begin
     if (DecimalSeparator <> SeparadorDecimal) then
        s := StringReplace(s, SeparadorDecimal, DecimalSeparator, []);
     Result := StrToFloatDef(s, 0);
  end;
  // ShowMessage('StrToFloatDec('''+s+''', '''+DecimalSeparator+''') -> '+FloatToStr(Result));
end;

function FloatToStrDec(f: double; SeparadorDecimal: char; Mascara: string = ''): string;
var
  OldSep : char;
begin
  OldSep := DecimalSeparator;
  try
     DecimalSeparator := SeparadorDecimal;
     if (Mascara = '') then
        Result := FloatToStrF(f, ffGeneral, 15, 0)
     else
        Result := FormatFloat(Mascara, f);
  finally
     DecimalSeparator := OldSep;
  end;
end;

{
begin
  if (Mascara = '') then
     Result := FloatToStr(f)
  else
     Result := FormatFloat(Mascara, f);

  if (DecimalSeparator <> SeparadorDecimal) then
     Result := StringReplace(Result, DecimalSeparator, SeparadorDecimal, []);
end;
}

function RoundAmount(const d: double; decimales: integer): double;
begin
  Result := RoundTo(d, decimales * (-1));
end;

function FormatAmount(const d: double; decimales: integer): string;
var
  OldDecimalSeparator : char;
begin
  OldDecimalSeparator := DecimalSeparator; // note: not thread-safe
  DecimalSeparator := '.';
  Result := Format('%.' + IntToStr(decimales) + 'f', [RoundAmount(d, decimales)]); // round explicitly, makes sure that RoundAmount and FormatAmount behaves exactly the same
  DecimalSeparator := OldDecimalSeparator;
end;

function AmountToDouble(s: string; Exception: boolean = True): double;
begin
  if (DecimalSeparator <> '.') then
     s := StringReplace(s, '.', DecimalSeparator, []);

  if Exception then
     Result := StrToFloat(s)
  else
     Result := StrToFloatDec(s, '.');
end;

function ReemplazaTextoHTML(texto: string; modo: integer): string;
begin
  /// Devuelve una cadena modificando algunos carácteres por secuencias de escape
  /// Modo=1 reemplaza también acentos

  texto := StringReplace(texto, '&', '&amp;', [rfReplaceAll]);
  texto := StringReplace(texto, '"', '&quot;', [rfReplaceAll]);
  texto := StringReplace(texto, '<', '&lt;', [rfReplaceAll]);
  texto := StringReplace(texto, '>', '&gt;', [rfReplaceAll]);
  texto := StringReplace(texto, '''', '&apos;', [rfReplaceAll]);

  if (modo = 1) then
  begin
     texto := StringReplace(texto, 'á', '&aacute;', [rfReplaceAll]);
     texto := StringReplace(texto, 'é', '&eacute;', [rfReplaceAll]);
     texto := StringReplace(texto, 'í', '&iacute;', [rfReplaceAll]);
     texto := StringReplace(texto, 'ó', '&oacute;', [rfReplaceAll]);
     texto := StringReplace(texto, 'ú', '&uacute;', [rfReplaceAll]);
     texto := StringReplace(texto, 'Á', '&Aacute;', [rfReplaceAll]);
     texto := StringReplace(texto, 'É', '&Eacute;', [rfReplaceAll]);
     texto := StringReplace(texto, 'Í', '&Iacute;', [rfReplaceAll]);
     texto := StringReplace(texto, 'Ó', '&Oacute;', [rfReplaceAll]);
     texto := StringReplace(texto, 'Ú', '&Uacute;', [rfReplaceAll]);
     texto := StringReplace(texto, 'à', '&agrave;', [rfReplaceAll]);
     texto := StringReplace(texto, 'è', '&egrave;', [rfReplaceAll]);
     texto := StringReplace(texto, 'ì', '&igrave;', [rfReplaceAll]);
     texto := StringReplace(texto, 'ò', '&ograve;', [rfReplaceAll]);
     texto := StringReplace(texto, 'ù', '&ugrave;', [rfReplaceAll]);
     texto := StringReplace(texto, 'À', '&Agrave;', [rfReplaceAll]);
     texto := StringReplace(texto, 'È', '&Egrave;', [rfReplaceAll]);
     texto := StringReplace(texto, 'Ì', '&Igrave;', [rfReplaceAll]);
     texto := StringReplace(texto, 'Ò', '&Ograve;', [rfReplaceAll]);
     texto := StringReplace(texto, 'Ù', '&Ugrave;', [rfReplaceAll]);
     texto := StringReplace(texto, 'ï', '&iuml;', [rfReplaceAll]);
     texto := StringReplace(texto, 'Ï', '&Iuml;', [rfReplaceAll]);
     texto := StringReplace(texto, 'ñ', '&ntilde;', [rfReplaceAll]);
     texto := StringReplace(texto, 'Ñ', '&Ntilde;', [rfReplaceAll]);
  end;
  Result := texto;
end;

function QuitarAcentosTexto(texto: string): string;
begin
  // Acento agudo
  texto := StringReplace(texto, 'á', 'a', [rfReplaceAll]);
  texto := StringReplace(texto, 'é', 'e', [rfReplaceAll]);
  texto := StringReplace(texto, 'í', 'i', [rfReplaceAll]);
  texto := StringReplace(texto, 'ó', 'o', [rfReplaceAll]);
  texto := StringReplace(texto, 'ú', 'u', [rfReplaceAll]);

  texto := StringReplace(texto, 'Á', 'A', [rfReplaceAll]);
  texto := StringReplace(texto, 'É', 'E', [rfReplaceAll]);
  texto := StringReplace(texto, 'Í', 'I', [rfReplaceAll]);
  texto := StringReplace(texto, 'Ó', 'O', [rfReplaceAll]);
  texto := StringReplace(texto, 'Ú', 'U', [rfReplaceAll]);

  // Acento grave
  texto := StringReplace(texto, 'à', 'a', [rfReplaceAll]);
  texto := StringReplace(texto, 'è', 'e', [rfReplaceAll]);
  texto := StringReplace(texto, 'ì', 'i', [rfReplaceAll]);
  texto := StringReplace(texto, 'ò', 'o', [rfReplaceAll]);
  texto := StringReplace(texto, 'ù', 'u', [rfReplaceAll]);

  texto := StringReplace(texto, 'À', 'A', [rfReplaceAll]);
  texto := StringReplace(texto, 'È', 'E', [rfReplaceAll]);
  texto := StringReplace(texto, 'Ì', 'I', [rfReplaceAll]);
  texto := StringReplace(texto, 'Ò', 'O', [rfReplaceAll]);
  texto := StringReplace(texto, 'Ù', 'U', [rfReplaceAll]);

  // Dieresis
  texto := StringReplace(texto, 'ä', 'a', [rfReplaceAll]);
  texto := StringReplace(texto, 'ë', 'e', [rfReplaceAll]);
  texto := StringReplace(texto, 'ï', 'i', [rfReplaceAll]);
  texto := StringReplace(texto, 'ö', 'o', [rfReplaceAll]);
  texto := StringReplace(texto, 'ü', 'u', [rfReplaceAll]);

  texto := StringReplace(texto, 'Ä', 'A', [rfReplaceAll]);
  texto := StringReplace(texto, 'Ë', 'E', [rfReplaceAll]);
  texto := StringReplace(texto, 'Ï', 'I', [rfReplaceAll]);
  texto := StringReplace(texto, 'Ö', 'O', [rfReplaceAll]);
  texto := StringReplace(texto, 'Ü', 'U', [rfReplaceAll]);

  // Acento circunflejo
  texto := StringReplace(texto, 'â', 'a', [rfReplaceAll]);
  texto := StringReplace(texto, 'ê', 'e', [rfReplaceAll]);
  texto := StringReplace(texto, 'î', 'i', [rfReplaceAll]);
  texto := StringReplace(texto, 'ô', 'o', [rfReplaceAll]);
  texto := StringReplace(texto, 'û', 'u', [rfReplaceAll]);

  texto := StringReplace(texto, 'Â', 'A', [rfReplaceAll]);
  texto := StringReplace(texto, 'Ê', 'E', [rfReplaceAll]);
  texto := StringReplace(texto, 'Î', 'I', [rfReplaceAll]);
  texto := StringReplace(texto, 'Ô', 'O', [rfReplaceAll]);
  texto := StringReplace(texto, 'Û', 'U', [rfReplaceAll]);

  // Acento tilde
  texto := StringReplace(texto, 'ã', 'a', [rfReplaceAll]);
  texto := StringReplace(texto, 'õ', 'o', [rfReplaceAll]);
  texto := StringReplace(texto, 'ñ', 'n', [rfReplaceAll]);

  texto := StringReplace(texto, 'Ã', 'a', [rfReplaceAll]);
  texto := StringReplace(texto, 'Õ', 'o', [rfReplaceAll]);
  texto := StringReplace(texto, 'Ñ', 'N', [rfReplaceAll]);

  // Otros
  texto := StringReplace(texto, 'ç', 'c', [rfReplaceAll]);
  texto := StringReplace(texto, 'Ç', 'c', [rfReplaceAll]);
  texto := StringReplace(texto, #0, ' ', [rfReplaceAll]);

  Result := texto;
end;

{
function ArticuloLoteable(Empresa: integer; Articulo: string): boolean;
  //Devuelve si el Articulo tiene el campo Lotes checkeado o no
var
  Q : THYFIBQuery;
begin
  try
     Result := 0;
     Q := THYFIBQuery.Create(nil);
     with Q do
     begin
        Database := DMMain.DataBase;
        AutoTrans := True;
        Close;
        SQL.Text := 'SELECT LOTES FROM ART_ARTICULOS WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        ExecQuery;
        Result := (FieldByName['LOTES'].AsInteger = 1);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;
}
function CuentaCCCValida(Entidad, Sucursal, DC, CC: string): boolean;
var
  pesos : array[1..10] of integer;
  digito, calculo, sumatorio, resto, i : integer;
  dcontrol, cuentato, bancoto, dceo, dccc, resdc : string;
begin
  {Verifico que sean numeros y 20 posiciones}
  resdc := '';
  if (Length(Entidad + Sucursal + DC + CC) <> 20) then
     resdc := '**';

  if (resdc <> '**') then
     for i := 1 to Length(Entidad) do
        if (not IsNumeric(Entidad[i])) then
           resdc := '**';

  if (resdc <> '**') then
     for i := 1 to Length(Sucursal) do
        if (not IsNumeric(Sucursal[i])) then
           resdc := '**';

  if (resdc <> '**') then
     for i := 1 to Length(DC) do
        if (not IsNumeric(DC[i])) then
           resdc := '**';

  if (resdc <> '**') then
     for i := 1 to Length(CC) do
        if (not IsNumeric(CC[i])) then
           resdc := '**';

  if (resdc <> '**') then
  begin
     { traspaso de variables }
     bancoto := Entidad + Sucursal;
     dcontrol := DC;
     cuentato := CC;

     { Defición de la tabla de pesos }
     pesos[1] := 6;
     pesos[2] := 3;
     pesos[3] := 7;
     pesos[4] := 9;
     pesos[5] := 10;
     pesos[6] := 5;
     pesos[7] := 8;
     pesos[8] := 4;
     pesos[9] := 2;
     pesos[10] := 1;

     { Calculo del 1º digito, Entidad y Oficina }
     sumatorio := 0;
     for i := 1 to 8 do
     begin
        {dji lrk kri - RightStr no funciona correctamente - lo cambio por esto}
        digito := StrToInt(Copy(Copy(bancoto, Length(bancoto) + 1 - i, i), 1, 1));
        calculo := digito * pesos[i];
        sumatorio := sumatorio + calculo;
     end;

     resto := (sumatorio mod 11);
     dceo := Trim(IntToStr(Trunc(11 - resto)));

     if dceo = '10' then  { si el resto - 11 es 10 el digito de control = 1}
        dceo := '1'
     else if dceo = '11' then    { si el resto - 11 es 11 el digito de control = 0 }
        dceo := '0';

     { Calculo del 2º digito, cuenta }
     sumatorio := 0;
     for i := 1 to 10 do
     begin
        {dji lrk kri - RightStr no funciona correctamente - lo cambio por esto}
        Digito := StrToInt(Copy(Copy(cuentato, Length(cuentato) + 1 - i, i), 1, 1));
        Calculo := digito * pesos[i];
        sumatorio := sumatorio + calculo;
     end;

     resto := (sumatorio mod 11);
     dccc := Trim(IntToStr(Trunc(11 - resto)));

     if dccc = '10' then  { si el resto es 10 el digito de control = 1}
        dccc := '1'
     else if dccc = '11' then  { si el resto es 11 el digito de control = 0}
        dccc := '0';

     { configurar el digito de control }
     resdc := dceo + dccc;
     if dcontrol <> resdc then
        resdc := '**';
  end;
  Result := (resdc <> '**');
end;

function Modulo97(s: string): integer;
var
  v, l : integer;
  alpha : string;
  number : longint;
begin
  /// Devuelve el digito de control de un string de numeros
  /// Se utiliza para calcular digito de control de IBAN

  v := 1;
  l := 9;
  Result := 0;
  alpha := '';

  while (v <= Length(s)) do
  begin
     if (l > Length(s)) then
        l := Length(s);
     alpha := alpha + Copy(s, v, l);
     number := StrToInt(alpha);
     Result := number mod 97;
     v := v + l;
     alpha := IntToStr(Result);
     l := 9 - Length(alpha);
  end;
end;

function Modulo10(const s: string): integer;
var
  i, fak, sum : integer;
begin
  /// Devuelve el digito de control de un string de numeros
  /// Se utiliza para calcular digito de control de EAN8, EAN13, DUN14

  sum := 0;
  fak := Length(s);
  for i := 1 to Length(s) do
  begin
     if (fak mod 2) = 0 then
        sum := sum + (StrToInt(s[i]) * 1)
     else
        sum := sum + (StrToInt(s[i]) * 3);
     Dec(fak);
  end;
  if (sum mod 10) = 0 then
     Result := 0
  else
     Result := 10 - (sum mod 10);
end;

function CodigoEANValido(Codigo: string): boolean;
var
  Longitud : integer;
begin
  /// Verifica mediante calculo de digito de control Modulo10.
  /// Valido para EAN8, EAN13 y DUN14
  Result := True;
  Longitud := Length(Codigo);
  if (Longitud <> 14) and (Longitud <> 13) and (Longitud <> 8) then
     Result := False;
  if (Copy(Codigo, Longitud, 1) <> IntToStr(Modulo10(Copy(Codigo, 1, Longitud - 1)))) then
     Result := False;
end;

function ChangeAlpha(input: string): string;
var
  a : char;
begin
  /// A -> 10, B -> 11, C -> 12 ...
  Result := input;
  for a := 'A' to 'Z' do
  begin
     Result := StringReplace(Result, a, IntToStr(Ord(a) - 55), [rfReplaceAll]);
  end;
end;

function IBANValido(iban: string): boolean;
var
  l : integer;
begin
  Result := True;

  iban := UpperCase(iban);

  // Compruebo que sean caracteres válidos
  for l := 1 to Length(iban) do
     if (not (iban[l] in ['A'..'Z', '0'..'9'])) then
        Result := False;

  if (Result) then
  begin
     // Paso los primeros 4 digitos al final (Pais + Control)
     iban := iban + Copy(iban, 1, 4);
     Delete(iban, 1, 4);

     // Convierto letras a digitos
     iban := ChangeAlpha(iban);

     // Si el resto de modulo 97 es 1 es una cuenta válida
     Result := (Modulo97(iban) = 1);
  end;
end;

function CalcularIBAN(Pais, Cuenta: string): string;
var
  l : integer;
  HayError : boolean;
  CuentaOrig : string;
begin
  Result := '';
  HayError := False;

  Cuenta := UpperCase(Cuenta);
  CuentaOrig := Cuenta;
  Pais := UpperCase(Pais);

  // Compruebo que sean caracteres válidos
  for l := 1 to Length(Cuenta) do
     if (not (Cuenta[l] in ['A'..'Z', '0'..'9'])) then
        HayError := True;

  if (not HayError) then
  begin
     // Agrego digitos al final (Pais + Control(00))
     // Convierto letras a digitos
     // 98 - Resto de modulo 97 es el digito de control
     Result := Pais + Format('%.2d', [98 - Modulo97(ChangeAlpha(Cuenta + Pais + '00'))]) + CuentaOrig;
  end;
  if not (IBANValido(Result)) then
     raise Exception.Create('No se pudo calcular el nro de IBAN');
end;

function DameDireccionDefecto(Tercero: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT DIRECCION FROM SYS_TERCEROS_DIRECCIONES WHERE DIR_DEFECTO = 1 AND TERCERO = :TERCERO ');
        Params.ByName['TERCERO'].AsInteger := Tercero;
        ExecQuery;
        Result := FieldByName['DIRECCION'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function DameDireccionDefectoVentas(Empresa, Cliente: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT C.DIR_DEFECTO_VENTAS, C.DIRECCION_DEFECTO, D.DIRECCION ');
        SQL.Add(' FROM EMP_CLIENTES C ');
        SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON C.TERCERO = D.TERCERO ');
        SQL.Add(' WHERE ');
        SQL.Add(' C.EMPRESA = :EMPRESA AND ');
        SQL.Add(' C.CLIENTE = :CLIENTE AND ');
        SQL.Add(' D.DIR_DEFECTO = 1 ');
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        ExecQuery;
        if (FieldByName['DIR_DEFECTO_VENTAS'].AsInteger = 1) then
           Result := FieldByName['DIRECCION_DEFECTO'].AsInteger
        else
           Result := FieldByName['DIRECCION'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure ModificaDoc(Query: THYFIBQuery; ID, Posicion, Tipo: integer);
var
  Activo, Permiso, empresa, ejercicio, canal : integer;
  Total : extended;
  serie : string;
begin
  {Todo : Quitar lo que tiene que ver con semaforos y meterlo todo dentro de un SP}
  // Posicion =  Bit a comprobar;
  // Tipo = 0 Para ventas 1 para compras

  with Query do
  begin
     Close;
     case Tipo of
        0: SQL.Text := 'SELECT EMPRESA, EJERCICIO, CANAL, SERIE, MODIFICA_DOC FROM GES_CABECERAS_S WHERE ID_S = ?ID';
        1: SQL.Text := 'SELECT EMPRESA, EJERCICIO, CANAL, SERIE, MODIFICA_DOC FROM GES_CABECERAS_E WHERE ID_E = ?ID';
     end;
     Params.ByName['ID'].AsInteger := ID;
     ExecQuery;
     Empresa := FieldByName['EMPRESA'].AsInteger;
     Ejercicio := FieldByName['EJERCICIO'].AsInteger;
     Canal := FieldByName['CANAL'].AsInteger;
     Serie := FieldByName['SERIE'].AsString;
     Permiso := FieldByName['MODIFICA_DOC'].AsInteger;
     FreeHandle;

     Close;
     SQL.Text := 'EXECUTE PROCEDURE UT_BIT(?PERMISO, ?POSICION)';
     Params.ByName['PERMISO'].AsInteger := Permiso;
     Params.ByName['POSICION'].AsInteger := Posicion;
     ExecQuery;
     Activo := FieldByName['ACTIVO'].AsInteger;
     FreeHandle;

     if (Activo = 0) then
     begin
        Total := Permiso + (IntPower(2, posicion));
        try
           if (Tipo = 0) then
           begin
              // Solo para documentos de ventas
              // Cerramos el semaforo
              Close;
              SQL.Text :=
                 'EXECUTE PROCEDURE E_M_EECS(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ''EECS_FACTURA_ALBARAN'', 0)';
              Params.ByName['EMPRESA'].AsInteger := Empresa;
              Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
              Params.ByName['CANAL'].AsInteger := Canal;
              Params.ByName['SERIE'].AsString := Serie;
              ExecQuery;
              FreeHandle;
           end;

           Close;
           case Tipo of
              0: SQL.Text := 'UPDATE GES_CABECERAS_S SET MODIFICA_DOC = ?PERMISO WHERE ID_S = ?ID';
              1: SQL.Text := 'UPDATE GES_CABECERAS_E SET MODIFICA_DOC = ?PERMISO WHERE ID_E = ?ID';
           end;
           Params.ByName['PERMISO'].AsInteger := Trunc(Total);
           Params.ByName['ID'].AsInteger := ID;
           ExecQuery;
           FreeHandle;
        finally
           // Solo para documentos de ventas
           // Volvemos a abrir el semaforo
           if (Tipo = 0) then
           begin
              Close;
              SQL.Text :=
                 'EXECUTE PROCEDURE E_M_EECS(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ''EECS_FACTURA_ALBARAN'', 1)';
              Params.ByName['EMPRESA'].AsInteger := Empresa;
              Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
              Params.ByName['CANAL'].AsInteger := Canal;
              Params.ByName['SERIE'].AsString := Serie;
              ExecQuery;
              FreeHandle;
           end;
        end;
     end;
  end;
end;

function DameColor(Color: TColor): TColor;
begin
  Result := Color;

  with TColorDialog.Create(nil) do
  begin
     try
        Color := Color;
        if Execute then
           Result := Color;
     finally
        Free;
     end;
  end;
end;

procedure CeldaEnlace(dbg: TNsDBGrid; Rect: TRect);
var
  cc : TColor;
begin
  with dbg.Canvas do
  begin
     cc := Pen.Color;
     // Pen.Color := REntorno.ColorEdtFnd;
     Pen.Color := REntorno.ColorEnlaceActivo;
     Pen.Width := 2;
     MoveTo(Rect.Left, Rect.Top);
     LineTo(Rect.Right, Rect.Top);
     LineTo(Rect.Right, Rect.Bottom);
     LineTo(Rect.Left, Rect.Bottom);
     LineTo(Rect.Left, Rect.Top);
     Pen.Color := cc;
  end;
end;

procedure CeldaEnlace(dbg: TDBGrid; Rect: TRect);
var
  cc : TColor;
begin
  with dbg.Canvas do
  begin
     cc := Pen.Color;
     // Pen.Color := REntorno.ColorEdtFnd;
     Pen.Color := REntorno.ColorEnlaceActivo;
     Pen.Width := 2;
     MoveTo(Rect.Left, Rect.Top);
     LineTo(Rect.Right, Rect.Top);
     LineTo(Rect.Right, Rect.Bottom);
     LineTo(Rect.Left, Rect.Bottom);
     LineTo(Rect.Left, Rect.Top);
     Pen.Color := cc;
  end;
end;

procedure ColorObjeto(aObject: TObject; ColorFondo, ColorTexto: TColor);
begin
  if (aObject is TCanvas) then
  begin
     with TCanvas(aObject) do
     begin
        Brush.Color := ColorFondo;
        Font.Color := ColorTexto;
     end;
  end
  else
  if (aObject is TEdit) then
  begin
     TEdit(aObject).Color := ColorFondo;
     TEdit(aObject).Brush.Color := ColorFondo;
     TEdit(aObject).Font.Color := ColorTexto;
  end
  else
  if (aObject is TDBEdit) then
  begin
     TDBEdit(aObject).Color := ColorFondo;
     TDBEdit(aObject).Brush.Color := ColorFondo;
     TDBEdit(aObject).Font.Color := ColorTexto;
  end
  else
  if (aObject is TDBDateEdit) then
  begin
     TDBDateEdit(aObject).Color := ColorFondo;
     TDBDateEdit(aObject).Brush.Color := ColorFondo;
     TDBDateEdit(aObject).Font.Color := ColorTexto;
  end
  else
  if (aObject is TLabel) then
  begin
     TLabel(aObject).Color := ColorFondo;
     // TLabel(aObject).Brush.Color := ColorFondo;
     TLabel(aObject).Font.Color := ColorTexto;
  end
  else
  if (aObject is TPanel) then
  begin
     TPanel(aObject).Color := ColorFondo;
     TPanel(aObject).Brush.Color := ColorFondo;
     TPanel(aObject).Font.Color := ColorTexto;
  end
  else
  if (aObject is TLFDBComboBoxValue) then
  begin
     TLFDBComboBoxValue(aObject).Color := ColorFondo;
     TLFDBComboBoxValue(aObject).Brush.Color := ColorFondo;
     TLFDBComboBoxValue(aObject).Font.Color := ColorTexto;
  end;
end;

procedure ColorFocused(aObject: TObject);
begin
  ColorObjeto(aObject, clHighlight, clHighlightText);
end;

procedure ColorNormal(aObject: TObject);
begin
  ColorObjeto(aObject, clBtnFace, clWindowText);
end;

procedure ColorCampoID(aObject: TObject);
begin
  ColorObjeto(aObject, REntorno.ColorCampoID, clBlack);
end;

procedure ColorCampoEnlace(aObject: TObject);
begin
  ColorObjeto(aObject, REntorno.ColorEnlaceActivo, clBlack);
end;

procedure ColorResaltado(aObject: TObject);
begin
  ColorObjeto(aObject, clYellow, clWindowText);
end;

procedure ColorResaltado2(aObject: TObject);
begin
  ColorObjeto(aObject, clLime, clWindowText);
end;

procedure ColorResaltado3(aObject: TObject);
begin
  // Antes clFuchsia y clHighlightText. Destacara mejor con el blanco
  ColorObjeto(aObject, $00800080, clWhite);
end;

procedure ColorResaltado4(aObject: TObject);
begin
  ColorObjeto(aObject, clGreen, clWhite);
end;

procedure ColorResaltado5(aObject: TObject);
begin
  ColorObjeto(aObject, clMoneyGreen, clBlack);
end;

procedure ColorResaltado6(aObject: TObject);
begin
  ColorObjeto(aObject, clSkyBlue, clBlack);
end;

procedure ColorInfo(aObject: TObject);
begin
  ColorObjeto(aObject, clInfoBK, clWindowText);
end;

procedure ColorEdicion(aObject: TObject);
begin
  ColorObjeto(aObject, clWindow, clWindowText);
end;

procedure ColorError(aObject: TObject);
begin
  ColorObjeto(aObject, clRed, clWhite);
end;

procedure ColorBloqueado(aObject: TObject);
begin
  ColorObjeto(aObject, $005B6AFF, clBlack);
end;

procedure ColorInactivo(aObject: TObject);
begin
  ColorObjeto(aObject, clInactiveCaption, clInactiveCaptionText);
end;

procedure ColorInactivoInvisible(aObject: TObject);
begin
  // Color de fondo y texto igual para "hacerlo invisible"
  ColorObjeto(aObject, clInactiveCaption, clInactiveCaption);
end;

procedure ColorSegunEstado(aObject: TObject; Estado: integer);
begin
  // Color para documentos de compra/venta
  case Estado of
     0: ColorResaltado2(aObject);
     2: ColorResaltado(aObject);
     5: ColorBloqueado(aObject);
     6: ColorBloqueado(aObject);
     else
        ColorInactivo(aObject);
  end;
end;

procedure ColorSegunEstadoRep(aObject: TObject; Estado: integer);
begin
  // Color para documentos de compra/venta
  case Estado of
     1: ColorResaltado2(aObject);
     2: ColorResaltado(aObject);
     3: ColorResaltado6(aObject);
     4: ColorBloqueado(aObject);
     else
        ColorInactivo(aObject);
  end;
end;

procedure ColorSegunSituacion(aObject: TObject; Situacion: integer);
begin
  // Color para situacion de orden de produccion
  case Situacion of
     0: ColorResaltado(aObject);
     1: ColorResaltado2(aObject);
     2: ColorResaltado6(aObject);
     3: ColorResaltado3(aObject);
     4: ColorBloqueado(aObject);
     else
        ColorInactivo(aObject);
  end;
end;

// Nos proporciona la menor serie que no este en restriccion en la tabla de perfiles de usuario
function dame_serie_activa(Serie: string): string;
var
  Perfil : integer;
  SerieRestringida : boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        Database := DMMain.DataBase;
        SQL.Text := 'SELECT PERFIL FROM SYS_USUARIOS WHERE USUARIO = ?USUARIO';
        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
        ExecQuery;
        Perfil := FieldByName['PERFIL'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        Database := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 EMPRESA FROM SYS_USUARIOS_PERFIL_EEC ');
        SQL.Add(' WHERE ');
        SQL.Add(' PERFIL = ?PERFIL AND ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SERIE = ?SERIE ');
        Params.ByName['PERFIL'].AsInteger := Perfil;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        ExecQuery;
        SerieRestringida := (FieldByName['EMPRESA'].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (SerieRestringida) then
  begin
     // Si la serie esta restringida coge otra que no lo esté
     // pero siempre dentro del perfil
     with THYFIBQuery.Create(nil) do
     begin
        try
           Database := DMMain.DataBase;
           AutoTrans := True;
           Close;
           SQL.Add(' SELECT MIN(SERIE) FROM EMP_SERIES ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SQL.Add(' CANAL = ?CANAL AND ');
           SQL.Add(' SERIE NOT IN ');
           SQL.Add(' (SELECT SERIE FROM SYS_USUARIOS_PERFIL_EEC ');
           SQL.Add(' WHERE ');
           SQL.Add(' PERFIL = ?PERFIL AND ');
           SQL.Add(' EMPRESA = ?EMPRESA AND ');
           SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SQL.Add(' CANAL = ?CANAL) ');
           Params.ByName['PERFIL'].AsInteger := Perfil;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           ExecQuery;
           Result := FieldByName['MIN'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end
  else
     Result := Serie;
end;

procedure ControlaBorrado(ID: integer; Tipo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        AutoTrans := True;
        Close;
        SQL.Text := 'SELECT CONTROL FROM DAME_RESTRICCIONES(?ENTRADA, ?TIPO, ?ID)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['ID'].AsInteger := ID;
        ExecQuery;
        if (FieldByName['CONTROL'].AsInteger = 1) then
           raise Exception.Create(_('El documento esta bloqueado, no tiene permisos para modificarlo'));
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function CompruebaCheckUbicaciones(ID_A: integer; var Peso, Volumen, Diametro: double): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        DataBase := DMMain.DataBase;
        AutoTrans := True;
        Close;
        SQL.Text := 'SELECT UBICABLE, PESO, VOLUMEN_UNIT, DIAMETRO_UNIT FROM ART_ARTICULOS WHERE ID_A = ?ID_A';
        Params.ByName['ID_A'].AsInteger := ID_A;
        ExecQuery;
        Result := FieldByName['UBICABLE'].AsInteger;
        Peso := FieldByName['PESO'].AsFloat;
        Volumen := FieldByName['VOLUMEN_UNIT'].AsFloat;
        Diametro := FieldByName['DIAMETRO_UNIT'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure InicializaVariableEmail(Tipo: string);
begin
  with VariableEmail do
  begin
     // *********************************************
     // Ver también FMSysEmpresas.DBETipoConfigChange
     // *********************************************
     TipoDocumento := '';
     if (Tipo = 'OFC') then
        TipoDocumento := _('Oferta');
     if (Tipo = 'PRF') then
        TipoDocumento := _('Proforma');
     if (Tipo = 'PEC') then
        TipoDocumento := _('Pedido');
     if (Tipo = 'ALB') then
        TipoDocumento := _('Albaran');
     if (Tipo = 'FAC') then
        TipoDocumento := _('Factura');
     if (Tipo = 'OFP') then
        TipoDocumento := _('Propuesta');
     if (Tipo = 'OCP') then
        TipoDocumento := _('Propuesta');
     if (Tipo = 'PEP') then
        TipoDocumento := _('Pedido');
     if (Tipo = 'RPP') then
        TipoDocumento := _('Recordatorio');
     if (Tipo = 'ALP') then
        TipoDocumento := _('Albaran');
     if (Tipo = 'FAP') then
        TipoDocumento := _('Factura');
     if (Tipo = 'FCR') then
        TipoDocumento := _('Factura');
     if (Tipo = 'PKL') then
        TipoDocumento := _('Packing List');
     if (Tipo = 'TIC') then
        TipoDocumento := _('Ticket');
     if (Tipo = '347') then
        TipoDocumento := _('Carta 347');
     if (Tipo = 'CRE') then
        TipoDocumento := _('Carta Reclamacion');
     if (Tipo = 'DTE') then
        TipoDocumento := _('Documento Electronico');
     if (Tipo = 'RAR') then
        TipoDocumento := _('Reparacion - Aviso Recogida');

     Ejercicio := 0;
     Serie := '';
     NumeroDocumento := 0;
     Fecha := Today;
     SuReferencia := '';
     SuPedido := '';
     Folio := '';
     TituloDocTributario := '';
     NombreFichero := '';
     Matricula := '';
     IDConfigServCorreos := 0;
     NombreComercial := '';
     RazonSocial := '';
     OrdenTrabajo := 0;
     IdOrdenTrabajo := 0;
     UsuarioCreadorDocumento := '';

     with TFIBDataSet.Create(nil) do
     begin
        try
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              Close;
              DataBase := DMMain.DataBase;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT ASUNTO, CUERPO, PIE, ID_CONFIG_SERV_CORREOS FROM SYS_EMPRESAS_CORREO WHERE EMPRESA = :EMPRESA AND TIPO = :TIPO');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['TIPO'].AsString := Tipo;
              Open;
              Asunto := FieldByName('ASUNTO').AsString;
              Cuerpo := FieldByName('CUERPO').AsString;
              Pie := FieldByName('PIE').AsString;
              IDConfigServCorreos := FieldByName('ID_CONFIG_SERV_CORREOS').AsInteger;
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

procedure DamePartesEmail(var Asunto: string; var CuerpoMail: TStrings);

  function AsignaVariables(s: string): string;
  begin
     // **************************************
     // Ver también FMSysEmpresas.LstVariables
     // **************************************
     s := Trim(StringReplace(s, '[EMPRESA]', REntorno.NombreEmpresa, [rfReplaceAll]));
     s := Trim(StringReplace(s, '[NOMBREFICHERO]', VariableEmail.NombreFichero, [rfReplaceAll]));
     s := Trim(StringReplace(s, '[EJERCICIO]', IntToStr(VariableEmail.Ejercicio), [rfReplaceAll]));
     s := Trim(StringReplace(s, '[TIPODOCUMENTO]', VariableEmail.TipoDocumento, [rfReplaceAll]));
     s := Trim(StringReplace(s, '[SERIE]', VariableEmail.Serie, [rfReplaceAll]));
     s := Trim(StringReplace(s, '[NUMERODOCUMENTO]', IntToStr(VariableEmail.NumeroDocumento), [rfReplaceAll]));
     s := Trim(StringReplace(s, '[FECHA]', DateToStr(VariableEmail.Fecha), [rfReplaceAll]));
     s := Trim(StringReplace(s, '[SUREFERENCIA]', VariableEmail.SuReferencia, [rfReplaceAll]));
     s := Trim(StringReplace(s, '[SUPEDIDO]', VariableEmail.SuPedido, [rfReplaceAll]));
     s := Trim(StringReplace(s, '[FOLIO]', VariableEmail.Folio, [rfReplaceAll]));
     s := Trim(StringReplace(s, '[TITULODOCTRIBUTARIO]', VariableEmail.TituloDocTributario, [rfReplaceAll]));
     s := Trim(StringReplace(s, '[MATRICULA]', VariableEmail.Matricula, [rfReplaceAll]));
     s := Trim(StringReplace(s, '[NOMBRECOMERCIAL]', VariableEmail.NombreComercial, [rfReplaceAll]));
     s := Trim(StringReplace(s, '[RAZONSOCIAL]', VariableEmail.RazonSocial, [rfReplaceAll]));
     s := Trim(StringReplace(s, '[ORDENTRABAJO]', IntToStr(VariableEmail.OrdenTrabajo), [rfReplaceAll]));
     s := Trim(StringReplace(s, '[IDORDENTRABAJO]', IntToStr(VariableEmail.IdOrdenTrabajo), [rfReplaceAll]));
     s := Trim(StringReplace(s, '[USUARIOCREADORDOCUMENTO]', VariableEmail.UsuarioCreadorDocumento, [rfReplaceAll]));

     Result := s;
  end;

begin
  if not Assigned(CuerpoMail) then
     CuerpoMail := TStringList.Create;

  CuerpoMail.Add(AsignaVariables(VariableEmail.Cuerpo));

  if (Trim(VariableEmail.Pie) > '') then
  begin
     CuerpoMail.Add('');
     CuerpoMail.Add(AsignaVariables(VariableEmail.Pie));
  end;

  Asunto := AsignaVariables(VariableEmail.Asunto);
end;

function DameTempPath: string;
var
  pcadena : PChar;
begin
  GetMem(pcadena, MAX_PATH + 1);
  try
     GetTempPath(MAX_PATH, pcadena);
     Result := StrPas(pcadena);
  finally
     FreeMem(pcadena);
  end;
end;

function DameWindowsDirectory: string;
var
  pcadena : PChar;
begin
  GetMem(pcadena, MAX_PATH + 1);
  try
     GetWindowsDirectory(pcadena, MAX_PATH);
     Result := StrPas(pcadena);
  finally
     FreeMem(pcadena);
  end;
end;

function GetSpecialFolderPath(Folder: integer; CanCreate: boolean): string;
var
  FilePath : array [0..MAX_PATH] of char;
begin
  /// Gets path of special system folders
  /// Call this routine as follows:
  /// GetSpecialFolderPath (CSIDL_PERSONAL, false)
  /// returns folder as result
  /// Ejemplo: CSIDL_PERSONAL = 05 = Mis Documentos

  SHGetSpecialFolderPath(0, @FilePath[0], FOLDER, CanCreate);
  Result := FilePath;
end;

function ExportarPDF(Report: TfrReport; NomFichero: string): string;
var
  cadena : string;
  tmpbool : boolean;
begin
  NomFichero := LimpiaNombreFichero(NomFichero);

  cadena := DameTempPath + NomFichero;
  tmpbool := DMMain.PsfrPDFExport1.ShowDialog;
  DMMain.PsfrPDFExport1.ShowDialog := False;
  DMMain.PsfrPDFExport1.ExportImageFormat := ifJPG;
  Report.ExportTo(DMMain.PsfrPDFExport1, cadena);
  DMMain.PsfrPDFExport1.ShowDialog := tmpbool;
  Result := cadena;
end;

function ExportarPDF(Report: TfrxReport; NomFichero: string): string;
var
  cadena : string;
  TmpBool : boolean;
begin
  NomFichero := LimpiaNombreFichero(NomFichero);

  cadena := DameTempPath + NomFichero;
  TmpBool := DMMain.frxPDFExport.ShowDialog;
  DMMain.frxPDFExport.FileName := cadena;
  DMMain.frxPDFExport.ShowDialog := False;
  Report.Export(DMMain.frxPDFExport);
  DMMain.frxPDFExport.ShowDialog := TmpBool;
  Result := cadena;
end;

function HayCambioIVATarifa(Tarifa_new, Tarifa_old: string): boolean;
begin
  Result := (TarifaEsIvaIncluido(Tarifa_old) <> TarifaEsIvaIncluido(Tarifa_new));
end;

procedure CambiaTarifaVentas(id_s: integer; Tarifa, Tarifa_old: string);
var
  Error : boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ERROR FROM UT_REFRESCA_DETALLE_S_TARIFA(:ID_S, :TARIFA, :ENTRADA)';
        Params.ByName['ID_S'].AsInteger := id_s;
        Params.ByName['TARIFA'].AsString := Tarifa;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Error := (FieldByName['ERROR'].AsInteger = 1);
     finally
        Free;
     end;
  end;

  if Error then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'UPDATE GES_CABECERAS_S SET TARIFA = :TARIFA WHERE ID_S = :ID_S';
           Params.ByName['TARIFA'].AsString := Tarifa_old;
           Params.ByName['ID_S'].AsInteger := id_s;
           ExecQuery;
           ShowMessage(_('No se puede cambiar la tarifa, el documento es origen o destino de otro.'));
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function es_serie_rectificacion(serie: string): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ACTIVO, RECT FROM GEN_SERIES WHERE EMPRESA = :EMPRESA AND SERIE = :SERIE';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['SERIE'].AsString := Serie;
        ExecQuery;
        Result := ((FieldByName['ACTIVO'].AsInteger = 1) and (FieldByName['RECT'].AsInteger = 1));
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function SerializadoAuto: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT SERIALIZADO_AUTO FROM SYS_EMPRESAS WHERE EMPRESA = :EMPRESA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        Result := (FieldByName['SERIALIZADO_AUTO'].AsInteger = 1);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function HayDatosDetalle(id_s: integer): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST 1 ID_S FROM GES_DETALLES_S WHERE ID_S = ?ID_S';
        Params.ByName['ID_S'].AsInteger := id_s;
        ExecQuery;
        Result := (FieldByName['ID_S'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TienePromociones(id_detalles_s: integer): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM GES_DETALLES_S WHERE ORIGEN = :ID_DETALLES_S';
        Params.ByName['ID_DETALLES_S'].AsInteger := id_detalles_s;
        ExecQuery;
        Result := not (FieldByName['COUNT'].AsInteger = 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function UdsEnteras(ID_A: integer): boolean;
var
  Unidad : string;
begin
  Result := False;
  if (Id_a > 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Database := DMMain.DataBase;
           SQL.Text := 'SELECT UNIDADES FROM ART_ARTICULOS WHERE ID_A=' + IntToStr(ID_A);
           ExecQuery;
           Unidad := FieldByName['UNIDADES'].AsString;
        finally
           Free;
        end;
     end;

     if (Unidad <> '') then
        Result := (DMMain.DameDecimalesUnidad(Unidad) = 0);
  end;
end;

function CalculaMascara(Decimales: smallint; MostrarCeros: boolean): string;
var
  i : smallint;
begin
  Result := ',##0.';
  for i := 1 to Decimales do
  begin
     if (MostrarCeros) then
        Result := Result + '0'
     else
        Result := Result + '#';
  end;
end;

procedure DamePuertosImpresora(Impresora: string; var Puerto: string);
begin
  // Esto está en CompG2k/UTools.pas
  getRealPrinter(Impresora, Puerto);
end;

function GetPrinterName(Ticketera: string): string;
var
  List : TStrings;
  Index : integer;
begin
  Result := '';
  if (Printer.Printers.Count > 0) then
     Result := Printer.Printers[Printer.PrinterIndex];
  List := Printer.Printers;
  if (TryStrToInt(Ticketera, Index)) then
     Result := List[Index]
  else if (List.IndexOf(Ticketera) > -1) then
     Result := Ticketera;
end;

function GetPrinterIndex(Ticketera: string): integer;
var
  List : TStrings;
  Index : integer;
begin
  Result := Printer.PrinterIndex;
  List := Printer.Printers;
  if (TryStrToInt(Ticketera, Index)) then
     Result := Index
  else if (List.IndexOf(Ticketera) > -1) then
     Result := List.IndexOf(Ticketera);
end;

{   * ---------------------------------------------------------*
    *  PROCEDIMIENTOS PARA EL TRATAMIENTO DE DATOS EN EL VISOR *
    * ---------------------------------------------------------*   }

procedure Visor(s: string);
var
  Data : string;
begin
  if (not VisorActivo) then
     Exit;
  Application.ProcessMessages;
  s := Copy(s, 1, REntorno.VisorColumnas * REntorno.VisorLineas);
  Data := ProcesaCodigos(REntorno.AbrirVisor) + s + ProcesaCodigos(REntorno.CerrarVisor);
  ImpresionDirecta(REntorno.Visor, Data);
  //showMessage(Data); // TESTEO
end;

procedure VisorModoEsperaTicket(Date: TDateTime);
var
  linea1, linea2, txtModo, lineaResult : string;
  charRelleno : char;
begin
  if (not VisorActivo) then
     Exit;
  charRelleno := ' ';
  txtModo := _('Nuevo Cliente');
  linea1 := StringOfChar(charRelleno, REntorno.VisorColumnas);
  linea2 := StringOfChar(charRelleno, REntorno.VisorColumnas);

  // Se trata la primera linea
  linea1 := TextoAlineaCentro(txtModo, linea1);
  lineaResult := linea1;
  // Si tiene mas lineas, se trata la segunda
  if (REntorno.VisorLineas > 1) then
  begin
     linea2 := TextoAlineaCentro(DateToStr(Date), linea2);
     lineaResult := linea2 + linea1;
  end;

  Visor(lineaResult);
end;

procedure VisorModoInsercionLinea(importe: double; descArticulo: string);
var
  linea1, linea2, txtModo, lineaResult : string;
  charRelleno : char;
begin
  if (not VisorActivo) then
     Exit;
  charRelleno := ' ';
  txtModo := _('Importe');
  linea1 := StringOfChar(charRelleno, REntorno.VisorColumnas);
  linea2 := StringOfChar(charRelleno, REntorno.VisorColumnas);

  // Se trata la primera linea
  linea1 := TextoAlineaIzquierda(txtModo, linea1);
  linea1 := TextoAlineaDerecha(FormatFloat(MascaraN, importe), linea1);
  lineaResult := linea1;
  // Si tiene mas lineas, se trata la segunda
  if (REntorno.VisorLineas > 1) then
  begin
     linea2 := TextoAlineaIzquierda(descArticulo, linea2);
     lineaResult := linea1 + linea2;
  end;

  Visor(lineaResult);
end;

procedure VisorModoCobroTicket(total: double);
var
  linea1, linea2, txtModo1, txtModo2, lineaResult : string;
  charRelleno : char;
begin
  if (not VisorActivo) then
     Exit;
  charRelleno := ' ';
  txtModo1 := _('Total');
  txtModo2 := _('Total Venta');
  linea1 := StringOfChar(charRelleno, REntorno.VisorColumnas);
  linea2 := StringOfChar(charRelleno, REntorno.VisorColumnas);

  // Se trata la primera linea
  if (REntorno.VisorLineas = 1) then
  begin
     linea1 := TextoAlineaIzquierda(txtModo1, linea1);
     linea1 := TextoAlineaDerecha(FormatFloat(MascaraN, total), linea1);
     lineaResult := linea1;
  end
  else
  begin
     linea1 := TextoAlineaIzquierda(txtModo2, linea1);
     linea2 := TextoAlineaDerecha(FormatFloat(MascaraN, total), linea2);
     lineaResult := linea1 + linea2;
  end;

  Visor(lineaResult);
end;

function VisorActivo: boolean;
begin
  Result := ((REntorno.Visor <> '') and (REntorno.AbrirVisor <> ''));
end;

function TextoAlineaDerecha(strNew, strBase: string): string;
var
  i, b : integer;
begin
  b := Length(strBase);
  for i := Length(strNew) downto 1 do
  begin
     strBase[b] := strNew[i];
     Dec(b);
  end;
  Result := strBase;
end;

function TextoAlineaIzquierda(strNew, strBase: string): string;
var
  i, b : integer;
begin
  b := 1;
  for i := 1 to Length(strNew) do
  begin
     strBase[b] := strNew[i];
     Inc(b);
  end;
  Result := strBase;
end;

function TextoAlineaCentro(strNew, strBase: string): string;
var
  i, b : integer;
  med : double;
begin
  med := (Length(strBase) - Length(strNew)) / 2;
  b := Trunc(med) + 1;
  for i := 1 to Length(strNew) do
  begin
     strBase[b] := strNew[i];
     Inc(b);
  end;
  Result := strBase;
end;

{dji lrk kri - para agrupar notas - Iberfluid}
// Use CalcCRC32 as a procedure so CRCValue can be passed in but
// also returned. This allows multiple calls to CalcCRC32 for
// the 'same' CRC-32 calculation.
procedure CalcCRC32(p: pointer; ByteCount: DWORD; var CRCValue: DWORD);
// The following is a little cryptic (but executes very quickly).
// The algorithm is as follows:
// 1. exclusive-or the input byte with the low-order byte of
// the CRC register to get an INDEX
// 2. shift the CRC register eight bits to the right
// 3. exclusive-or the CRC register with the contents of Table[INDEX]
// 4. repeat steps 1 through 3 for all bytes

var
  i : DWORD;
  q : ^byte;
begin
  q := p;
  for i := 0 to ByteCount - 1 do
  begin
     CRCvalue := (CRCvalue shr 8) xor
        Table[q^ xor (CRCvalue and $000000FF)];
     Inc(q);
  end;
end {CalcCRC32};

function CalcCRC32Str(s: string): string;
var
  CRC32 : DWORD;
begin
  CRC32 := $FFFFFFFF;
  if (Length(s) > 0) then
     CalcCRC32(Addr(s[1]), Length(s), CRC32)
  else
     CRC32 := 0;
  Result := IntToHex(CRC32, 8);
end;

function CalcCRC8Str(Buffer: string; Polynom: cardinal = $07; Initial: cardinal = 0): cardinal;
var
  i, j : integer;
begin
  Result := Initial;

  for i := 1 to Length(Buffer) do
  begin
     Result := Result xor Ord(buffer[i]);
     for j := 0 to 7 do
     begin
        if (Result and $80) <> 0 then
           Result := (Result shl 1) xor Polynom
        else
           Result := Result shl 1;
     end;
  end;

  Result := Result and $ff;
end;

{
function CalcCRC8Str(s: String):String;
var
  data: TArray;
  len, i: Integer;
  crc: byte;
begin
  data := TEncoding.UTF8.GetBytes(s);
  len := Length(data);
  crc := 0;

  for i := 0 to len-1 do
    crc := Table_CRC8[(crc xor data[i]) and $FF];

  Result := Format('%.*d', [3, (crc and $FF)]);
end;
}

procedure CapturarPantalla(Filename: string);
var
  SrcWindow : THandle;
  SrcDC : HDC;
  Bitmap : TBitmap;
  Jpg : TJPEGImage;
begin
  SrcWindow := GetDesktopWindow;
  if SrcWindow <> 0 then
  begin
     SrcDC := GetDC(SrcWindow);
     if SrcDC <> 0 then
     begin
        Bitmap := TBitmap.Create;
        Jpg := TJPEGImage.Create;
        try
           Bitmap.Width := GetSystemMetrics(SM_CXSCREEN);
           Bitmap.Height := GetSystemMetrics(SM_CYSCREEN);
           BitBlt(Bitmap.Canvas.Handle, 0, 0, Bitmap.Width, Bitmap.Height, SrcDC, 0, 0, SRCCOPY);
           Jpg.CompressionQuality := 60;
           Jpg.Assign(Bitmap);
           try
              Jpg.SaveToFile(Filename);
           except
           end
        finally
           Bitmap.Free;
           Jpg.Free;
           ReleaseDC(SrcWindow, SrcDC);
        end;
     end;
  end;
end;

procedure EnviarAdjunto(De, Para, Asunto, Cuerpo: string; Adjunto: string);
var
  Mail : TIdMessage;
  SMTP : TIdSMTP;
  IdSSLIOHandlerSocketOpenSSL : TIdSSLIOHandlerSocketOpenSSL;
begin
  Exit;
  {enviar error por email}
  IdSSLIOHandlerSocketOpenSSL := TIdSSLIOHandlerSocketOpenSSL.Create();
  try
     SMTP := TIdSMTP.Create(nil);
     try
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

        (* INDY Original Delhi 6
        with SMTP do
        begin
           Host := REntorno.Smtp;
           UserID := REntorno.UserID;
           Password := REntorno.Password;
           Port := REntorno.Port;
           SocksInfo.Authentication := saNoAuthentication;
           AuthenticationType := atNone;
           if REntorno.Identificacion = True then
           begin
              AuthenticationType := atLogin;
              SocksInfo.Authentication := saUsernamePassword;
              SocksInfo.Host := REntorno.Smtp;
              SocksInfo.Password := REntorno.Password;
              SocksInfo.Port := REntorno.Port;
              SocksInfo.UserID := REntorno.UserID;
           end;
        end;
   *)
        Mail := TIdMessage.Create(nil);
        try
           with Mail do
           begin
              Clear;
              UseNowForDate := True;
              From.Address := De;
              From.Name := '';
              Organization := '';

              Body.Clear;
              Body.Add('Empresa :' + REntorno.NombreEmpresa);
              Body.Add('EEC :' + REntorno.EmpresaStr + '-' + REntorno.EjercicioStr + '-' + REntorno.CanalStr);
              Body.Add('Usuario :' + REntorno.UsuarioStr);
              Body.Add('Entrada :' + REntorno.EntradaStr);
              Body.Add('Error :' + Cuerpo);

              Recipients.EMailAddresses := Para;
              Subject := Asunto;

              MessageParts.Clear;
              // TIdAttachment.Create(Mail.MessageParts, Adjunto);
              TIdAttachmentFile.Create(Mail.MessageParts, Adjunto);

              // Envio
              try
                 SMTP.Connect;
              except
                 on E: Exception do
                 begin
                    ShowMessage(e.Message);
                    SMTP.Disconnect;
                 end;
              end;

              try
                 SMTP.Send(Mail);
              except
                 SMTP.Disconnect;
              end;

              SMTP.Disconnect;
           end;
        finally
           Mail.Free;
        end;
     finally
        SMTP.Free;
     end;
  finally
     IdSSLIOHandlerSocketOpenSSL.Free;
  end;
end;

procedure AbreWord(archivo: string);
var
  WordApp : variant;
begin
  //Abre Fichero Word
  //try
  { Create the OLE Object }
  WordApp := ComObj.CreateOLEObject('Word.Application');

  if FileExists(archivo) = True then           // Se pregunta si existe el Archivo
     WordApp.Documents.Open(archivo)        // Se procede a Abrir el Archivo Existente
  else
  begin                                      // En caso contrario se crea con las siguientes instrucciones
     WordApp.Documents.Add;                 // Crea y agrega un Documento
     WordApp.Documents.Item(1).SaveAs(archivo);     // Se graba el documento con el nombre de la variable 'archivo'
  end;
  WordApp.Visible := True;                     // Se visualiza y Ejecuta Word con el documento nuevo o abrir el existente
  {  except
    on E: Exception do
    begin
      E.Message := 'Word is no está disponible.';
      Raise;
    end;
  end;}
end;

function LimpiaNIF(Pais, nif: string): string;
var
  i : integer;
begin
  /// Quita espacios en blanco y lo que no sea numero o letra

  Result := '';
  for i := 1 to Length(nif) do
  begin
     if (nif[i] in ['A'..'Z', 'a'..'z', '0'..'9']) then
        Result := Result + UpperCase(nif[i])
     else
     if Pais = 'CHL' then
     begin
        if (nif[i] = '-') then
           Result := Result + nif[i];
     end;
  end;
end;

function LimpiaCadena(s: string): string;
var
  i : integer;
begin
  // Se utiliza para limpiar los blobs

  Result := '';
  for i := 1 to Length(s) do
     if s[i] in ['a'..'z', 'A'..'Z', '0'..'9', '.', ',', '-', '/', ' '] then
        Result := Result + s[i]
     else
     begin
        if s[i] in ['á', 'Á', 'à', 'À'] then
           Result := Result + 'A';
        if s[i] in ['é', 'É', 'è', 'È'] then
           Result := Result + 'E';
        if s[i] in ['í', 'Í', 'ì', 'Ì', 'ï', 'Ï'] then
           Result := Result + 'I';
        if s[i] in ['ó', 'Ó', 'ò', 'Ò'] then
           Result := Result + 'O';
        if s[i] in ['ú', 'Ú', 'ù', 'Ù', 'ü', 'Ü'] then
           Result := Result + 'U';
        if s[i] in ['ñ', 'Ñ'] then
           Result := Result + 'N';
        if s[i] = #13 then
           Result := Result + '//';
     end;
end;

function LimpiaCadenaBasica(s: string): string;
var
  i : integer;
begin
  // Se utiliza para limpiar los blobs

  Result := '';
  s := QuitarAcentosTexto(s);
  for i := 1 to Length(s) do
     if s[i] in ['a'..'z', 'A'..'Z', '0'..'9', '-', '_', ' '] then
        Result := Result + s[i]
     else
        Result := Result + '_';
end;

function LimpiaCadenaNumero(s: string): string;
var
  i : integer;
begin
  // Se utiliza para limpiar los blobs

  Result := '';
  for i := 1 to Length(s) do
     if s[i] in ['0'..'9', '.', ',', '-', '+'] then
        Result := Result + s[i];
end;

function ContieneCaracteresNoPermitidos(TextoAVerificar, CaracteresNoPermitidos: string): boolean;
var
  i : integer;
begin
  /// Responde si alguno de los caracteres no permitidos se encuentran en el Texto a Verificar

  Result := False;
  i := 1;
  while (not Result) and (i <= Length(CaracteresNoPermitidos)) do
  begin
     if Pos(CaracteresNoPermitidos[i], TextoAVerificar) > 0 then
        Result := True;

     Inc(i);
  end;
end;

procedure ExportarCSV(Fichero, SQL: string; Separador: string = ';'; EntrecomillarString: boolean = True; Encabezado: boolean = True; FechaSinHora: boolean = False; SeparadorDecimal: string = '.'; ProgressBar: TProgressBar = nil);
var
  xTabla : TFIBDataSetRW;
  DSxTabla : TDataSource;
begin
  // Se crea una tabla y un datasource para ejecutar el SQL
  xTabla := TFIBDataSetRW.Create(nil);
  DSxTabla := TDataSource.Create(nil);
  try
     DMMain.LogIni(format('ExportarCSV(%s, SQL)', [Fichero]));
     DMMain.Log(SQL);
     DSxTabla.DataSet := xTabla;
     with xTabla do
     begin
        Unidirectional := True;
        xTabla.DataBase := DMMain.DataBase;
        Transaction := TFIBTransaction.Create(xTabla);
        Transaction.DefaultDatabase := DMMain.DataBase;
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;
        if (Active) then
           Close;
        SelectSQL.Text := SQL;
        Open;

        ExportarCSV(Fichero, DSxTabla, Separador, EntrecomillarString, Encabezado, FechaSinHora, SeparadorDecimal, ProgressBar);

        Close;
        if (Transaction.InTransaction) then
           Transaction.Commit;
     end; {with xTabla}
  finally
     DSxTabla.Free;
     xTabla.Free;
     DMMain.LogFin('');
  end;
end;

procedure ExportarCSV(Fichero: string; DataSource: TDataSource; Separador: string = ';'; EntrecomillarString: boolean = True; Encabezado: boolean = True; FechaSinHora: boolean = False; SeparadorDecimal: string = '.'; ProgressBar: TProgressBar = nil);
var
  i, f : integer;
  s, Union, Comilla : string;
  TF : TextFile;
begin
  /// Exporta en formato CSV los datos asociados a un DataSource.
  /// Solo exporta las columnas visibles.
  /// Segun RFC 4180. https://tools.ietf.org/html/rfc4180

  if EntrecomillarString then
     Comilla := '"'
  else
     Comilla := '';

  AssignFile(TF, Fichero);
  try
     Rewrite(TF);
  except
     on e: Exception do
        ShowMessage('Error al abrir fichero : ' + Fichero + #13#10 + e.Message);
  end;

  try
     DMMain.LogIni(format('ExportarCSV(%s, %s)', [Fichero, DataSource.DataSet.Name]));
     with DataSource.DataSet do
     begin
        DisableControls;
        try
           if Assigned(ProgressBar) then
           begin
              ProgressBar.Position := 0;
              ProgressBar.Visible := True;
              Application.ProcessMessages;
              Last;
              ProgressBar.Max := RecordCount;
           end;

           First;

           f := 0;
           if (Encabezado) then
           begin
              Inc(f);
              // Primera linea son los titulos de los campos
              s := '';
              Union := '';
              for i := 0 to FieldCount - 1 do
              begin
                 if (Fields[i].Visible) then
                 begin
                    s := s + Union + Comilla + Fields[i].FieldName + Comilla;
                    Union := Separador;
                 end;
              end;
              WriteLn(TF, s);
           end;

           while not EOF do
           begin
              Inc(f);
              s := '';
              Union := '';
              for i := 0 to FieldCount - 1 do
              begin
                 if (Fields[i].Visible) then
                 begin
                    {Campo tipo String}
                    // Reemplazado: xxxReemplazo comilla doble por dos comillas simples si se entrecomillan los stringsxxx
                    // Reemplazo comilla doble por dos comillas dobles si se entrecomillan los strings
                    if (Fields[i] is TStringField) then
                    begin
                       if (Comilla = '"') then
                          s := s + Union + Comilla + StringReplace(Trim(Fields[i].AsString), '"', '""', [rfReplaceAll]) + Comilla
                       else
                          s := s + Union + Comilla + Trim(Fields[i].AsString) + Comilla;
                    end
                    else
                    {Campo tipo Float}
                    // Utilizo 3 decimales
                    if (Fields[i] is TFloatField) then
                       s := s + Union + FloatToStrDec(Fields[i].AsFloat, SeparadorDecimal[1], '0.000')
                    else
                    {Campo tipo Integer}
                    if (Fields[i] is TIntegerField) then
                       s := s + Union + Trim(IntToStr(Fields[i].AsInteger))
                    else
                    {Campo tipo Fecha}
                    // El formato será el del sistema en que se ejecute
                    if (Fields[i] is TDateTimeField) then
                    begin
                       if (FechaSinHora) then
                          s := s + Union + DateToStr(Fields[i].AsDateTime)
                       else
                          s := s + Union + DateTimeToStr(Fields[i].AsDateTime);
                    end
                    else
                    {Campo tipo Blob}
                    // Los blobs exportan solo caracteres basicos.
                    if (Fields[i] is TBlobField) then
                    begin
                       try
                          if (Comilla = '"') then
                             s := s + Union + Comilla + StringReplace(Trim(LimpiaCadena(Fields[i].AsString)), '"', '""', [rfReplaceAll]) + Comilla
                          else
                             s := s + Union + Comilla + Trim(LimpiaCadena(Fields[i].AsString)) + Comilla;

                       {FMain.RichEdit1.PlainText := False;
                       tmps := TStringList.Create;
                       try
                          MS := TMemoryStream.Create;
                          try
                             tmps.Assign(xTabla.Fields[i]);
                             tmps.SaveToStream(MS);
                             MS.Position := 0;
                             FMain.RichEdit1.Lines.LoadFromStream(MS);
                          finally
                             MS.Free;
                          end;
                       finally
                          tmps.Free;
                       end;
                       FMain.RichEdit1.PlainText := True;

                       saux := '"';
                       for j := 0 to FMain.RichEdit1.Lines.Count -1 do
                          saux := saux+Trim(FMain.RichEdit1.Lines[j])+'|';

                       while (pos(#9,saux)>1) do
                       begin
                          k := pos(#9,saux);
                          saux := copy(saux,1,k-1)+' '+copy(saux,k+1,length(saux));
                       end;

                       s := s + Union + saux + '"';
                       FMain.RichEdit1.Clear;}
                       except
                          s := s + Union + Comilla + '--  ERROR  --' + Comilla;
                       end;
                    end;

                    Union := Separador;
                 end;
              end;
              WriteLn(TF, s);

              if (f mod 100 = 0) then
              begin
                 if Assigned(ProgressBar) then
                 begin
                    ProgressBar.Position := f;
                    Application.ProcessMessages;
                 end;
              end;

              Next;
           end;
        finally
           EnableControls;
           if Assigned(ProgressBar) then
              ProgressBar.Visible := False;
        end;
     end;
  finally
     CloseFile(TF);
     DMMain.LogFin('');
  end;
end;

procedure ExportarExcel(Fichero, SQL: string; Encabezado: boolean = True; FechaSinHora: boolean = False; ProgressBar: TProgressBar = nil);
var
  xTabla : TFIBDataSetRW;
  DSxTabla : TDataSource;
begin
  // Se crea una tabla y un datasource para ejecutar el SQL
  xTabla := TFIBDataSetRW.Create(nil);
  DSxTabla := TDataSource.Create(nil);
  try
     DMMain.LogIni(format('ExportarExcel(%s, ' + #13#10 + SQL + #13#10 + ')', [Fichero, SQL]));
     DMMain.Log(SQL);
     DSxTabla.DataSet := xTabla;
     with xTabla do
     begin
        Unidirectional := True;
        xTabla.DataBase := DMMain.DataBase;
        Transaction := TFIBTransaction.Create(xTabla);
        Transaction.DefaultDatabase := DMMain.DataBase;
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;
        if (Active) then
           Close;
        SelectSQL.Text := SQL;
        Open;

        ExportarExcel(Fichero, DSxTabla, Encabezado, FechaSinHora, ProgressBar);

        Close;
        if (Transaction.InTransaction) then
           Transaction.Commit;
     end; {with xTabla}
  finally
     DSxTabla.Free;
     xTabla.Free;
     DMMain.LogFin('');
  end;
end;

procedure ExportarExcel(Fichero: string; DataSource: TDataSource; Encabezado: boolean = True; FechaSinHora: boolean = False; ProgressBar: TProgressBar = nil);
var
  HCalc : THojaCalc;
  i, c, f : integer;
begin
  /// Exporta en formato Excel los datos asociados a un DataSource.
  /// Solo exporta las columnas visibles.

  if (UpperCase(ExtractFileExt(Fichero)) = '.ODS') then
     HCalc := THojaCalc.Create(thcOpenOffice, False) //OpenOffice doc if possible, please
  else
     HCalc := THojaCalc.Create(thcExcel, False);

  try
     DMMain.LogIni(format('ExportarExcel(%s, %s)', [Fichero, DataSource.DataSet.Name]));
     HCalc.FileName := Fichero; //Needs a file name before you SaveDoc!

     with DataSource.DataSet do
     begin
        DisableControls;
        try
           if Assigned(ProgressBar) then
           begin
              ProgressBar.Position := 0;
              ProgressBar.Visible := True;
              Application.ProcessMessages;
              Last;
              ProgressBar.Max := RecordCount;
           end;
           First;

           f := 0;
           if (Encabezado) then
           begin
              Inc(f);

              // Primera linea son los titulos de los campos
              c := 0;
              for i := 0 to FieldCount - 1 do
              begin
                 if (Fields[i].Visible) then
                 begin
                    Inc(c);
                    HCalc.CellText[f, c] := Fields[i].FieldName;
                 end;
              end;
           end;

           while not EOF do
           begin
              Inc(f);
              c := 0;
              for i := 0 to FieldCount - 1 do
              begin
                 if (Fields[i].Visible) then
                 begin
                    Inc(c);
                    // Campo tipo String
                    if (Fields[i] is TStringField) and (Trim(Fields[i].AsString) > '') then
                       HCalc.CellText[f, c] := Trim(Fields[i].AsString)
                    else
                    // Campo tipo Float
                    if (Fields[i] is TFloatField) and (Fields[i].AsFloat <> 0) then
                       HCalc.SendNumber(f, c, Fields[i].AsFloat)
                    else
                    // Campo tipo Integer
                    if (Fields[i] is TIntegerField) and (Fields[i].AsInteger <> 0) then
                       HCalc.SendNumber(f, c, Fields[i].AsInteger)
                    else
                    // Campo tipo Fecha
                    if (Fields[i] is TDateTimeField) and (YearOf(Fields[i].AsDateTime) > 1900) then
                    begin
                       // HCalc.SendDate(f, c , Fields[c].AsDateTime)
                       if (HCalc.IsOpenOffice) then
                          HCalc.CellText[f, c] := DateToStr(Fields[i].AsDateTime)
                       else
                          HCalc.CellText[f, c] := Trim(FormatDateTime('MM/DD/YYYY', Fields[i].AsDateTime));
                    end
                    else
                    // Campo tipo Blob
                    // Los blobs exportan solo caracteres basicos.
                    if (Fields[i] is TBlobField) and (Trim(LimpiaCadena(TBlobField(Fields[i]).AsString)) > '') then
                    begin
                       try
                          HCalc.CellText[f, c] := Trim(LimpiaCadena(TBlobField(Fields[i]).AsString));
                       except
                          HCalc.CellText[f, c] := 'BLOB';
                       end;
                    end;
                 end;
              end;

              if (f mod 100 = 0) then
              begin
                 if Assigned(ProgressBar) then
                 begin
                    ProgressBar.Position := f;
                    Application.ProcessMessages;
                 end;
              end;

              Next;
              // Application.ProcessMessages;
           end;

           c := 0;
           for i := 0 to FieldCount - 1 do
           begin
              if (Fields[i].Visible) then
              begin
                 Inc(c);
                 // Campo tipo String
                 if (Fields[i] is TStringField) then
                    HCalc.AutoFit(c);

                 // Formato de columna
                 if (Fields[i] is TFloatField) then
                    if (HCalc.IsOpenOffice) then
                       HCalc.ColNumberFormat(c, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
              end;
           end;
        finally
           EnableControls;
           if Assigned(ProgressBar) then
              ProgressBar.Visible := False;
        end;
     end;

     HCalc.SaveDocAs(Fichero, (Pos('.XLS', UpperCase(ExtractFileExt(Fichero))) > 0));
  finally
     Sleep(1000);
     Application.ProcessMessages;
     HCalc.Free;
     DMMain.LogFin('');
  end;
end;

function LimpiaCeldaExcel(s: string): string;
begin
  /// Quito apostrofe inicial. Excel utiliza esto para definir numeros como texto.

  Result := '';

  if (Length(s) >= 1) then
  begin
     if (s[1] = '''') then
     begin
        if (Length(s) > 1) then
           s := Copy(s, 2, Length(s))
        else
           s := '';
     end;
  end;

  Result := Trim(s);
end;

function ExcelColumnName(ColumnNumber: integer): string;
var
  Remainder : integer;
begin
  // Dada una columna devuele el nombre de Excel (1..26 A..Z - 27..52 AA..AZ - etc.)
  Result := '';
  while ColumnNumber > 0 do
  begin
     Remainder := (ColumnNumber - 1) mod 26;
     Result := Chr(Ord('A') + Remainder) + Result;
     ColumnNumber := (ColumnNumber - 1) div 26;
  end;
end;

procedure LeerCSV(Grid: TStringGrid; const FileName: string; const aDelimiter: char = ','; const aStringDelimiter: char = '"');
var
  F : TextFile;
  Ch : char;
  s : string;
  Col, Row : integer;
  Estado : char;

  function Limpiar(s: string): string;
  begin
     // Limpieza de caracteres UTF leidos como ANSI.
     s := StringReplace(s, 'Âº', 'º', [rfReplaceAll]);
     s := StringReplace(s, 'Â°', 'º', [rfReplaceAll]);
     s := StringReplace(s, 'â‚¬', '€', [rfReplaceAll]);
     s := StringReplace(s, 'Ã¡', 'á', [rfReplaceAll]);
     s := StringReplace(s, 'Ã€', 'Á', [rfReplaceAll]);
     s := StringReplace(s, 'Ã©', 'é', [rfReplaceAll]);
     s := StringReplace(s, 'Ã‰', 'É', [rfReplaceAll]);
     s := StringReplace(s, 'Ã­', 'í', [rfReplaceAll]);
     s := StringReplace(s, 'Ã³', 'ó', [rfReplaceAll]);
     s := StringReplace(s, 'Ã“', 'Ó', [rfReplaceAll]);
     s := StringReplace(s, 'Ãº', 'ú', [rfReplaceAll]);
     s := StringReplace(s, 'Ã±', 'ñ', [rfReplaceAll]);
     s := StringReplace(s, 'Â®', '®', [rfReplaceAll]);

     Result := s;
  end;

begin
  // Borrar informacion anterior
  Grid.ColCount := 0;
  Grid.RowCount := 0;
  Col := 0;
  Row := 0;
  s := '';
  Estado := ' ';

  AssignFile(f, FileName);
  Reset(F);
  while not EOF(F) do
  begin
     Read(F, Ch);
     case Estado of
        ' ':
        begin
           if Ch = aStringDelimiter then
              Estado := 'S'
           else
           if Ch = aDelimiter then
           begin
              Grid.Cells[Col, Row] := Trim(Limpiar(s));
              s := '';
              Inc(Col);
              if Grid.ColCount < Col + 1 then
                 Grid.ColCount := Col + 1;
           end
           else
           begin
              case Ch of
                 #13:
                 begin
                    Grid.Cells[Col, Row] := Trim(Limpiar(s));
                    s := '';
                    Col := 0;
                    Grid.RowCount := Grid.RowCount + 1;
                    Inc(Row);
                 end;
                 #10:
                 begin
                    // Se ignora porque es el LF de CR (#13#10)
                 end;
                 else
                 begin
                    Estado := ' ';
                    s := s + Ch;
                 end;
              end;
           end;
        end;
        'S':
        begin
           // Estoy dentro de un String
           if Ch = aStringDelimiter then
           begin
              Estado := 'F';
              Grid.Cells[Col, Row] := Trim(Limpiar(s));
              s := '';
              Inc(Col);
              if Grid.ColCount < Col + 1 then
                 Grid.ColCount := Col + 1;
           end
           else
              s := s + Ch;
        end;
        'F':
        begin
           // He salido del string. Debo ignorar todo hasta encotnrar el ';'
           if Ch = aDelimiter then
              Estado := ' '
           else
           if Ch = #13 then
           begin
              Estado := ' ';
              Col := 0;
              Grid.RowCount := Grid.RowCount + 1;
              Inc(Row);
           end;
           // else
           //    Ignorar todo
        end;
     end;
  end;
  CloseFile(F);
end;

function EncuentraTitulo(Grid: THYTDBGrid; Titulo: string): smallint;
var
  i : integer;
begin
  Result := -1; {dji lrk kri - Si no lo encuentra que devuelva -1}
  i := 0;
  with Grid do
  begin
     while ((i <= Columns.Count - 1) and (Result = -1)) do
     begin
        if (Columns[i].Title.Caption = Titulo) then
           Result := i
        else
           Inc(i);
     end;
  end;
end;

function EncuentraTitulo(Grid: TDBGridFind2000; Titulo: string): smallint;
var
  i : integer;
begin
  Result := -1; {dji lrk kri - Si no lo encuentra que devuelva -1}
  i := 0;
  with Grid do
  begin
     while ((i <= Columns.Count - 1) and (Result = -1)) do
     begin
        if (Columns[i].Title.Caption = Titulo) then
           Result := i
        else
           Inc(i);
     end;
  end;
end;

function EncuentraField(Grid: TDBGrid; aFieldName: string): smallint;
var
  i : integer;
begin
  Result := -1; {dji lrk kri - Si no lo encuentra que devuelva -1}
  i := 0;
  with Grid do
  begin
     while ((i <= Columns.Count - 1) and (Result = -1)) do
     begin
        if (Columns[i].FieldName = aFieldName) then
           Result := i
        else
           Inc(i);
     end;
  end;
end;

procedure AgregaColumna(Grid: TDBGrid; aFieldName, DisplayName: string);
var
  i : integer;
begin
  i := EncuentraField(Grid, aFieldName);
  if (i >= 0) then
  begin
     Grid.Columns.Items[i].Visible := True;
     Grid.Columns.Items[i].Title.Caption := DisplayName;
  end
  else
  begin
     with Grid.Columns.Add do
     begin
        FieldName := aFieldName;
        Title.Caption := DisplayName;
        Visible := True;
     end;
  end;
end;

procedure HabilitaColumna(Grid: TDBGrid; aFieldName: string; Habilitada: boolean);
var
  i : integer;
  col : TColumn;
begin
  i := EncuentraField(Grid, aFieldName);
  if (i >= 0) then
  begin
     col := Grid.Columns.Items[i];
     if Assigned(col) then
     begin
        col.ReadOnly := not Habilitada;
        if (Habilitada) then
           col.Color := clWindow
        else
           col.Color := clInfoBk;
     end;
  end;
end;

procedure HabilitaEdit(Componente: TControl; Habilitado: boolean);
begin
  if Componente is TEdit then
  begin
     with TEdit(Componente) do
     begin
        if Habilitado then
        begin
           Enabled := True;
           ReadOnly := False;
           Color := clWindow;
        end
        else
        begin
           Enabled := False;
           ReadOnly := True;
           Color := clInfoBk;
        end;
     end;
  end
  else
  if Componente is TDBEdit then
  begin
     with TDBEdit(Componente) do
     begin
        if Habilitado then
        begin
           Enabled := True;
           ReadOnly := False;
           Color := clWindow;
        end
        else
        begin
           Enabled := False;
           ReadOnly := True;
           Color := clInfoBk;
        end;
     end;
  end
  else
  if Componente is TDBDateEdit then
  begin
     with TDBDateEdit(Componente) do
     begin
        if Habilitado then
        begin
           Enabled := True;
           ReadOnly := False;
           Color := clWindow;
        end
        else
        begin
           Enabled := False;
           ReadOnly := True;
           Color := clInfoBk;
        end;
     end;
  end
  else
  if Componente is TDBDateTimePicker then
  begin
     with TDBDateTimePicker(Componente) do
     begin
        if Habilitado then
        begin
           Enabled := True;
           ReadOnly := False;
           Color := clWindow;
        end
        else
        begin
           Enabled := False;
           ReadOnly := True;
           Color := clInfoBk;
        end;
     end;
  end
  else
  if Componente is TDateTimePicker then
  begin
     with TDateTimePicker(Componente) do
     begin
        if Habilitado then
        begin
           Enabled := True;
           // ReadOnly := False;
           Color := clWindow;
        end
        else
        begin
           Enabled := False;
           // ReadOnly := True;
           Color := clInfoBk;
        end;
     end;
  end
  else
  if Componente is TDBMemo then
  begin
     with TDBMemo(Componente) do
     begin
        if Habilitado then
        begin
           Enabled := True;
           ReadOnly := False;
           Color := clWindow;
        end
        else
        begin
           Enabled := False;
           ReadOnly := True;
           Color := clInfoBk;
        end;
     end;
  end
  else
  if Componente is TMemo then
  begin
     with TMemo(Componente) do
     begin
        if Habilitado then
        begin
           Enabled := True;
           ReadOnly := False;
           Color := clWindow;
        end
        else
        begin
           Enabled := False;
           ReadOnly := True;
           Color := clInfoBk;
        end;
     end;
  end
  else
  if Componente is TDBComboBoxValue then
  begin
     with TDBComboBoxValue(Componente) do
     begin
        if Habilitado then
        begin
           Enabled := True;
           ReadOnly := False;
           Color := clWindow;
        end
        else
        begin
           Enabled := False;
           ReadOnly := True;
           Color := clInfoBk;
        end;
     end;
  end
  else
  if Componente is TRxDBLookupCombo then
  begin
     with TRxDBLookupCombo(Componente) do
     begin
        if Habilitado then
        begin
           Enabled := True;
           ReadOnly := False;
           Color := clWindow;
        end
        else
        begin
           Enabled := False;
           ReadOnly := True;
           Color := clInfoBk;
        end;
     end;
  end
  else
  if Componente is TCheckBox then
  begin
     with TCheckBox(Componente) do
     begin
        if Habilitado then
        begin
           Enabled := True;
           // ReadOnly := False;
           Color := clWindow;
        end
        else
        begin
           Enabled := False;
           // ReadOnly := True;
           Color := clInfoBk;
        end;
     end;
  end
  else
     ShowMessage(Format(_('HabilitaEdit(%s) tipo no tratado %s'), [Componente.Name, Componente.ClassName]));
end;

function GetFSize(FileName: string): integer;
{
var
  f: File of Byte;
begin
  AssignFile(f, FileName);
  try
     Reset(f);
     Result := Filesize(f);
  finally
     CloseFile(f);
  end;
end;
}
{
var
  SearchRec: TSearchRec;
begin
  Result := 0;
  if FindFirst(FileName, faAnyFile, SearchRec) = 0 then
     Result := SearchRec.Size;
  FindClose(SearchRec);
end;
}
var
  h : THandle;
begin
  h := CreateFile(PChar(FileName), GENERIC_READ, FILE_SHARE_DELETE or FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  try
     Result := GetFileSize(h, nil);
  finally
     CloseHandle(h);
  end;
end;

function GetTempFile(const Extension: string): string;
var
  Buffer : array[0..MAX_PATH] of char;
  aFile : string;
begin
  GetTempPath(SizeOf(Buffer) - 1, Buffer);
  GetTempFileName(Buffer, 'TMP', 0, Buffer);
  SetString(aFile, Buffer, StrLen(Buffer));
  Result := ChangeFileExt(aFile, Extension);
end;

function DelTree(DirName: string): boolean;
var
  SHFileOpStruct : TSHFileOpStruct;
  DirBuf : array [0..255] of char;
begin
  try
     Fillchar(SHFileOpStruct, SizeOf(SHFileOpStruct), 0);
     FillChar(DirBuf, SizeOf(DirBuf), 0);
     StrPCopy(DirBuf, DirName);
     with SHFileOpStruct do
     begin
        Wnd := 0;
        pFrom := @DirBuf;
        wFunc := FO_DELETE;
        fFlags := FOF_ALLOWUNDO;
        fFlags := fFlags or FOF_NOCONFIRMATION;
        fFlags := fFlags or FOF_SILENT;
     end;
     Result := (SHFileOperation(SHFileOpStruct) = 0);
  except
     Result := False;
  end;
end;

function MesStr(AMes: integer): string;
begin
  /// Devuelve el nombre del mes con la primera letra en mayusculas
  case AMes of
     1: Result := _('Enero');
     2: Result := _('Febrero');
     3: Result := _('Marzo');
     4: Result := _('Abril');
     5: Result := _('Mayo');
     6: Result := _('Junio');
     7: Result := _('Julio');
     8: Result := _('Agosto');
     9: Result := _('Septiembre');
     10: Result := _('Octubre');
     11: Result := _('Noviembre');
     12: Result := _('Diciembre');
  end;
end;

function DiaStr(Dia: integer): string; overload;
begin
  /// Devuelve el dia de la semana con la primera letra en mayusculas
  case Dia of
     1: Result := _('Lunes');
     2: Result := _('Martes');
     3: Result := _('Miercoles');
     4: Result := _('Jueves');
     5: Result := _('Viernes');
     6: Result := _('Sabado');
     7: Result := _('Domingo');
  end;
end;

function DiaStr(Fecha: TDateTime): string; overload;
begin
  /// Devuelve el dia de la semana con la primera letra en mayusculas
  Result := DiaStr(DayOfTheWeek(Fecha));
end;

function StartAssociatedExe(Prg, FileName: string; var ErrorCode: cardinal): boolean;
var
  ProcessInfo : TProcessInformation;
  StartupInfo : TStartupInfo;
  P : PChar;
begin
  Result := False;
  FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
  with StartupInfo do
  begin
     cb := SizeOf(TStartupInfo);
     wShowWindow := SW_SHOW;
  end;
  if CreateProcess(PChar(Prg), PChar(Format('%s %s', [Prg, FileName])),
     nil, nil, False, NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo) then
  begin
     WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
     GetExitCodeProcess(ProcessInfo.hProcess, ErrorCode);
     CloseHandle(ProcessInfo.hProcess);
     CloseHandle(ProcessInfo.hThread);
     Result := True;
  end
  else
  begin
     ErrorCode := GetLastError;
     if FormatMessage(Format_Message_Allocate_Buffer + Format_Message_From_System,
        nil,
        ErrorCode,
        0, @P,
        0,
        nil) <> 0 then
     begin
        // Display the string.
        ShowMessage(P);
        // Free the buffer.
        LocalFree(integer(P));
     end;
  end;
end;

function RunAndWait(Handle: THandle; Ejecutable, Argumentos: string; const RunDirectory: PChar = nil; const Visibilidad: integer = SW_SHOWNORMAL; MensajeSiCorrecto: boolean = True): DWORD;
var
  Info : TShellExecuteInfo;
  pInfo : PShellExecuteInfo;
  ExitCode : word;
  P : PChar;
begin
  { Puntero a Info }
  { Pointer to Info }
  pInfo := @Info;
  { Rellenamos Info }
  { Fill info }
  with Info do
  begin
     cbSize := SizeOf(Info);
     fMask := SEE_MASK_NOCLOSEPROCESS;
     wnd := Handle;
     lpVerb := nil;
     lpFile := PChar(Ejecutable);
     { Parametros al ejecutable }
     { Executable parameters }
     lpParameters := PChar(Argumentos + #0);
     if RunDirectory = '' then
        lpDirectory := nil
     else
        lpDirectory := PChar(RunDirectory + #0);
     nShow := Visibilidad;
     hInstApp := 0;
  end;
  { Ejecutamos }
  { Execute }
  if not ShellExecuteEx(pInfo) then
  begin
     Result := GetLastError;
     if FormatMessage(Format_Message_Allocate_Buffer + Format_Message_From_System,
        nil,
        Result,
        0, @P,
        0,
        nil) <> 0 then
     begin
        // Display the string.
        ShowMessage(P);
        // Free the buffer.
        LocalFree(integer(P));
     end;
  end
  else
     Result := 0; // Info.hInstApp;

  { Esperamos que termine }
  { Wait to finish }
  repeat
     ExitCode := WaitForSingleObject(Info.hProcess, 500);
     Application.ProcessMessages;
  until (ExitCode <> WAIT_TIMEOUT);
  ExitCode := GetLastError;

  GetExitCodeProcess(Info.hProcess, Result);
  if ((Result < 32) and (ExitCode = 0)) then
  begin
     ExitCode := GetLastError;
     if FormatMessage(Format_Message_Allocate_Buffer + Format_Message_From_System,
        nil,
        ExitCode,
        0, @P,
        0,
        nil) <> 0 then
     begin
        // Display the string.
        if MensajeSiCorrecto or (ExitCode <> 0) then
           ShowMessage(P);
        // Free the buffer.
        LocalFree(integer(P));
     end;
  end
  else
     Result := 0; // Info.hInstApp;
end;

function DameIPLocal: string;
var
  p : PHostEnt;
  s : array[0..128] of char;
  p2 : PChar;
  wVersionRequested : word;
  wsaData : TWSAData;
begin
  // Arranca la librería WinSock
  try
     wVersionRequested := MAKEWORD(1, 1);
     WSAStartup(wVersionRequested, wsaData);

     // Obtiene el nombre del PC
     GetHostName(@s, 128);
     p := GetHostByName(@s);

     // Obtiene la dirección IP y libera la librería WinSock
     p2 := iNet_ntoa(PInAddr(p^.h_addr_list^)^);
     Result := Result + p2;
     WSACleanup;
  except
     Result := '';
  end;
end;

function DameIPPublica: string;
var
  HTMLBody : string;
  i : integer;
  IdHTTP : TIdHTTP;
begin
  Result := '';
  try
     // ¿Estamos conectados a Internet?
     if WinInet.InternetGetConnectedState(nil, 0) then
     begin
        IdHTTP := TIdHTTP.Create(Application);
        try
           HTMLBody := IdHTTP.Get('http://checkip.dyndns.org/');
           // Esta web devuelve : 'Current IP Address: 87.111.157.240'

           for i := 0 to Length(HTMLBody) - 1 do
              if IsNumeric(HTMLBody[i]) or (HTMLBody[i] = '.') then
                 Result := Result + HTMLBody[i];
        finally
           IdHTTP.Free;
        end;
     end;
  except
     Result := '';
  end;
end;

procedure DameCoordenadasDireccion(Direccion: string; var Lat, Lon: double);
var
  Url, HTMLBody : string;
  IdHTTP : TIdHTTP;
  IdSSLIOHandlerSocketOpenSSL : TIdSSLIOHandlerSocketOpenSSL;
  Documento, NodoPadre, Nodo : TlkJSONBase;
begin
  /// La llamada devuelve JSON con este formato
  /// {
  ///    "success": true,
  ///    "lat": "41.4122754",
  ///    "lon": "2.1418609",
  ///    "display_name": "GBC Business Center, 34,36, Carrer de Gomis, els Penitents, Vallcarca i els Penitents, Sarrià - Sant Gervasi, Barcelona, Barcelonès, Barcelona, Catalunya, 08023, España"
  /// }

  DMMain.Log('DameCoordenadasDireccion(' + Direccion + ')');
  Url := 'https://app.delfos-online.com/delweb/php/getMapaCoordenadas.php?string=' + EscapeURL(Direccion);

  try
     // ¿Estamos conectados a Internet?
     if WinInet.InternetGetConnectedState(nil, 0) then
     begin
        IdHTTP := TIdHTTP.Create(Application);
        try
           IdSSLIOHandlerSocketOpenSSL := TIdSSLIOHandlerSocketOpenSSL.Create;
           try
              if (LowerCase(Copy(Url, 1, 8)) = 'https://') then
              begin
                 IdHTTP.IOHandler := IdSSLIOHandlerSocketOpenSSL;
                 IdSSLIOHandlerSocketOpenSSL.SSLOptions.SSLVersions := [sslvSSLv2, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2]; //[sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
              end;

              HTMLBody := IdHTTP.Get(Url);

              DMMain.Log(HTMLBody);
              Documento := TlkJSON.ParseText(HTMLBody);
              try
                 if Assigned(Documento) then
                 begin
                    // Buscon el nodo padre
                    NodoPadre := TlkJSONObject(Documento);
                    if Assigned(NodoPadre) then
                    begin
                       Nodo := NodoPadre.Field['success'];
                       if (Assigned(Nodo) and Nodo.Value = True) then
                       begin
                          Nodo := NodoPadre.Field['lat'];
                          if Assigned(Nodo) then
                             Lat := StrToFloatDec(Nodo.Value, '.');
                          DMMain.Log(format('lat : %3.7f', [Lat]));

                          Nodo := NodoPadre.Field['lon'];
                          if Assigned(Nodo) then
                             Lon := StrToFloatDec(Nodo.Value, '.');
                          DMMain.Log(format('lon : %3.7f', [Lon]));
                       end;
                    end
                    else
                       DMMain.Log('No existe nodo padre');
                 end
                 else
                    DMMain.Log('No se puede abrir documento');
              finally
                 Documento.Free;
              end;
           finally
              IdSSLIOHandlerSocketOpenSSL.Free;
           end;
        finally
           IdHTTP.Free;
        end;
     end;
  except
     on e: Exception do
        DMMain.Log('DameCoordenadasDireccion Error' + #13#10 + e.Message);
  end;
end;

function DameImagenMapa(Lat, Lon: double; SoloSiExisteFichero: boolean = False; Width: integer = 600; Height: integer = 400; Zoom: integer = 15): string;
var
  Url, tmp : string;
  // HTMLBody : string;
  // IdHTTP : TIdHTTP;
  // IdSSLIOHandlerSocketOpenSSL : TIdSSLIOHandlerSocketOpenSSL;
  fs : TFileStream;
  Descargada : boolean;
begin
  /// La llamada devuelve ruta a fichero de imagen del mapa centrado en coordenadas

  DMMain.LogIni('DameImagenMapa(' + FloatToStr(Lat) + ', ' + FloatToStr(Lon) + ')');
  try
     // Verifico si ya esta descargada la imagen del mapa

     // Calculo directorio temporal (%LOCALAPPDATA%\Merge\ImgMapa)
     tmp := IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_LOCAL_APPDATA, False));

     if not DirectoryExists(tmp + REntorno.NombreAplicacion) then
        MkDir(tmp + REntorno.NombreAplicacion);
     tmp := IncludeTrailingPathDelimiter(tmp + REntorno.NombreAplicacion);

     if not DirectoryExists(tmp + 'ImgMapa') then
        MkDir(tmp + 'ImgMapa');
     tmp := IncludeTrailingPathDelimiter(tmp + 'ImgMapa');

     Result := tmp + format('Mapa_%3.7f-%3.7f-%5dx%5d-%2d.jpg', [Lat, Lon, Width, Height, Zoom]);
     Result := StringReplace(Result, ',', '_', [rfReplaceAll]);
     Result := StringReplace(Result, ' ', '0', [rfReplaceAll]);

     if not FileExists(Result) then
     begin
        if SoloSiExisteFichero then
           Result := ''
        else
        begin
           Url := 'https://app.delfos-online.com/delweb/php/getMapaImagen.php?lat=' + FloatToStrDec(Lat, '.') + '&lon=' + FloatToStrDec(Lon, '.') + '&zoom=' + IntToStr(Zoom) + '&width=' + IntToStr(Width) + '&height=' + IntToStr(Height);
           DMMain.Log('Url = ' + Url);
           try
              try
                 fs := TFileStream.Create(Result, fmCreate);
                 try
                    Descargada := DownloadToStream(Url, fs);
                 finally
                    fs.Free;
                 end;

                 if not Descargada then
                 begin
                    DeleteFile(Result);
                    Result := '';
                 end;
              except
                 on e: Exception do
                 begin
                    DMMain.Log('DownloadToStream ERROR' + #13#10 + e.Message);
                    Result := '';
                 end;
              end;
           except
              on e: Exception do
              begin
                 DMMain.Log('DameImagenMapa Error' + #13#10 + e.Message);
                 Result := '';
              end;
           end;
        end;
     end;
  finally
     DMMain.LogFin('Result = ' + Result);
  end;
end;

function GetWMIstring(wmiHost, wmiClass, wmiProperty: string): string;
var  // These are all needed for the WMI querying process
  Locator : ISWbemLocator;
  Services : ISWbemServices;
  SObject : ISWbemObject;
  ObjSet : ISWbemObjectSet;
  SProp : ISWbemProperty;
  Enum : IEnumVariant;
  Value : cardinal;
  TempObj : olevariant;
  Valor : string;
begin
  try
     Locator := CoSWbemLocator.Create;  // Create the Location object
     // Connect to the WMI service, with the root\cimv2 namespace
     Services := Locator.ConnectServer(wmiHost, 'root\cimv2', '', '', '', '', 0, nil);
     ObjSet := Services.ExecQuery('SELECT * FROM ' + wmiClass, 'WQL',
        wbemFlagReturnImmediately and wbemFlagForwardOnly, nil);
     Enum := (ObjSet._NewEnum) as IEnumVariant;
     while (Enum.Next(1, TempObj, Value) = S_OK) do
     begin
        SObject := IUnknown(tempObj) as ISWBemObject;
        SProp := SObject.Properties_.Item(wmiProperty, 0);
        if VarIsNull(SProp.Get_Value) then
           Result := ''
        else
        begin
           Valor := SProp.Get_Value;
           Result := Valor;
        end;
     end;
  except // Trap any exceptions (Not having WMI installed will cause one!)
     on Exception do
        Result := '';
  end;
end;

function DameMACLocal: string;
var  // These are all needed for the WMI querying process
  Locator : ISWbemLocator;
  Services : ISWbemServices;
  SObject : ISWbemObject;
  ObjSet : ISWbemObjectSet;
  SProp : ISWbemProperty;
  Enum : IEnumVariant;
  Value : cardinal;
  TempObj : olevariant;
  Valor : string;
  Indice : integer;
  IPAddress : string;
  IPLocal : string;
begin
  // Direccion de IP local del ordenador
  IPLocal := DameIPLocal;
  // Busco el indice del adaptador con la IP local
  Indice := -1;
  try
     Locator := CoSWbemLocator.Create;  // Create the Location object
     // Connect to the WMI service, with the root\cimv2 namespace
     Services := Locator.ConnectServer('', 'root\cimv2', '', '', '', '', 0, nil);
     ObjSet := Services.ExecQuery('SELECT Index, IPAddress FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled = True', 'WQL',
        wbemFlagReturnImmediately and wbemFlagForwardOnly, nil);
     Enum := (ObjSet._NewEnum) as IEnumVariant;
     while (Enum.Next(1, TempObj, Value) = S_OK) do
     begin
        SObject := IUnknown(tempObj) as ISWBemObject;
        SProp := SObject.Properties_.Item('IPAddress', 0);
        if VarIsNull(SProp.Get_Value) then
           Valor := ''
        else
           Valor := SProp.Get_Value[0];

        IPAddress := Valor;

        // Si la direccion del adaptador es la local, obtengo el indice
        if (IPLocal = IPAddress) then
        begin
           SObject := IUnknown(tempObj) as ISWBemObject;
           SProp := SObject.Properties_.Item('Index', 0);
           if VarIsNull(SProp.Get_Value) then
              Valor := ''
           else
              Valor := SProp.Get_Value;

           Indice := StrToIntDef(Valor, 0);
        end;
     end;
  except // Trap any exceptions (Not having WMI installed will cause one!)

  end;

  // Obtengo la MAC del adaptador con el indice obtenido
  if (Indice >= 0) then
  begin
     try
        Locator := CoSWbemLocator.Create;  // Create the Location object
        // Connect to the WMI service, with the root\cimv2 namespace
        Services := Locator.ConnectServer('', 'root\cimv2', '', '', '', '', 0, nil);
        ObjSet := Services.ExecQuery('SELECT MACAddress FROM Win32_NetworkAdapter WHERE Index = ' + IntToStr(Indice), 'WQL',
           wbemFlagReturnImmediately and wbemFlagForwardOnly, nil);
        Enum := (ObjSet._NewEnum) as IEnumVariant;
        while (Enum.Next(1, TempObj, Value) = S_OK) do
        begin
           SObject := IUnknown(tempObj) as ISWBemObject;
           SProp := SObject.Properties_.Item('MACAddress', 0);
           if VarIsNull(SProp.Get_Value) then
              Valor := ''
           else
              Valor := SProp.Get_Value;

           Result := Valor;
        end;
     except // Trap any exceptions (Not having WMI installed will cause one!)
        on Exception do
           Result := 'ERR';
     end;
  end
  else
     Result := '';
end;

{
  **********************************************************************
  **********************************************************************
  MD5 y SHA
  **********************************************************************
  **********************************************************************
}

function CryptAcquireContext(phProv: PHCRYPTPROV; pszContainer: LPAWSTR; pszProvider: LPAWSTR; dwProvType: DWORD; dwFlags: DWORD): BOOL; stdcall; external ADVAPI32 Name 'CryptAcquireContextA';

function CryptCreateHash(hProv: HCRYPTPROV; Algid: ALG_ID; hKey: HCRYPTKEY; dwFlags: DWORD; phHash: PHCRYPTHASH): BOOL; stdcall;
  external ADVAPI32 Name 'CryptCreateHash';

function CryptHashData(hHash: HCRYPTHASH; const pbData: PBYTE; dwDataLen: DWORD; dwFlags: DWORD): BOOL; stdcall;
  external ADVAPI32 Name 'CryptHashData';

function CryptGetHashParam(hHash: HCRYPTHASH; dwParam: DWORD; pbData: PBYTE; pdwDataLen: PDWORD; dwFlags: DWORD): BOOL; stdcall;
  external ADVAPI32 Name 'CryptGetHashParam';

function CryptDestroyHash(hHash: HCRYPTHASH): BOOL; stdcall; external ADVAPI32 Name 'CryptDestroyHash';

function CryptReleaseContext(hProv: HCRYPTPROV; dwFlags: DWORD): BOOL; stdcall; external ADVAPI32 Name 'CryptReleaseContext';

function CalcHash(Stream: TStream; Algorithm: THashAlgorithm): string; overload;
var
  hProv : HCRYPTPROV;
  hHash : HCRYPTHASH;
  Buffer : PBYTE;
  BytesRead : DWORD;
  Algid : ALG_ID;
  Data : array [1 .. 20] of byte;
  DataLen : DWORD;
  Success : BOOL;
  i : integer;
begin
  Result := EmptyStr;
  Success := CryptAcquireContext(@hProv, nil, nil, PROV_RSA_FULL, 0);
  if (not Success) then
     if GetLastError() = DWORD(NTE_BAD_KEYSET) then
        Success := CryptAcquireContext(@hProv, nil, nil, PROV_RSA_FULL, CRYPT_NEWKEYSET);
  if Success then
  begin
     if Algorithm = haMD5 then
     begin
        Algid := CALG_MD5;
        DataLen := 16;
     end
     else
     begin
        Algid := CALG_SHA1;
        DataLen := 20;
     end;
     if CryptCreateHash(hProv, Algid, 0, 0, @hHash) then
     begin
        GetMem(Buffer, 10 * 1024);
        try
           while True do
           begin
              BytesRead := Stream.Read(Buffer^, 10 * 1024);
              if (BytesRead = 0) then
              begin
                 if (CryptGetHashParam(hHash, HP_HASHVAL, @Data, @DataLen, 0)) then
                    for i := 1 to DataLen do
                       Result := Result + LowerCase(IntToHex(integer(Data[i]), 2));
                 Break;
              end;
              if (not CryptHashData(hHash, Buffer, BytesRead, 0)) then
                 Break;
           end;
        finally
           FreeMem(Buffer);
        end;
        CryptDestroyHash(hHash);
     end;
     CryptReleaseContext(hProv, 0);
  end;
end;

function CalcHash(Archivo: string; Algorithm: THashAlgorithm): string; overload;
var
  Stream : TFileStream;
begin
  Result := EmptyStr;
  if FileExists(Archivo) then
     try
        Stream := TFileStream.Create(Archivo, fmOpenRead or fmShareDenyWrite);
        try
           Result := CalcHash(Stream, Algorithm);
        finally
           Stream.Free;
        end;
     except
     end;
end;

function CalcHashStr(Str: string; Algorithm: THashAlgorithm): string;
var
  Stream : TStringStream;
begin
  Result := EmptyStr;
  Stream := TStringStream.Create(Str);
  try
     Result := CalcHash(Stream, Algorithm);
  finally
     Stream.Free;
  end;
end;

function MySendARP(const IPAddress: string): string;
var
  DestIP : ULONG;
  MacAddr : array [0..5] of byte;
  MacAddrLen : ULONG;
  SendArpResult : cardinal;
begin
  /// Devuelve la direccion MAC de una direccion IP

  DestIP := inet_addr(PAnsiChar(AnsiString(IPAddress)));
  MacAddrLen := Length(MacAddr);
  SendArpResult := SendARP(DestIP, 0, @MacAddr, @MacAddrLen);

  if SendArpResult = NO_ERROR then
     Result := Format('%2.2X:%2.2X:%2.2X:%2.2X:%2.2X:%2.2X',
        [MacAddr[0], MacAddr[1], MacAddr[2],
        MacAddr[3], MacAddr[4], MacAddr[5]])
  else
     Result := '00:00:00:00:00:00';
end;

function EscapeURL(URL: string): string;
var
  i : integer;
  Utf8Str : ansistring;
  b : byte;
begin
  Result := '';

  // En Delphi 6 UTF8Encode devuelve AnsiString con los bytes UTF-8
  Utf8Str := UTF8Encode(URL);

  for i := 1 to Length(Utf8Str) do
  begin
     b := Ord(Utf8Str[i]);

     // Caracteres seguros (RFC 3986)
     if char(b) in ['A'..'Z', 'a'..'z', '0'..'9', '-', '_', '.', '~'] then
        Result := Result + char(b)
     else
        Result := Result + '%' + IntToHex(b, 2);
  end;
(*
  /// Algunos caracteres especiales deben transformase al hacer peticiones web
  /// Ejemplo: Perez Gonzales, Jose
  /// Se transforma en: Perez%20Gonzales%2C%20Jose

  // Primero este que se utiliza como prefijo
  URL := StringReplace(URL, '%', '%25', [rfReplaceAll]);

  URL := StringReplace(URL, ' ', '%20', [rfReplaceAll]);
  URL := StringReplace(URL, '!', '%21', [rfReplaceAll]);
  URL := StringReplace(URL, '"', '%22', [rfReplaceAll]);
  URL := StringReplace(URL, '#', '%23', [rfReplaceAll]);
  URL := StringReplace(URL, '$', '%24', [rfReplaceAll]);
  URL := StringReplace(URL, '&', '%26', [rfReplaceAll]);
  URL := StringReplace(URL, '''', '%27', [rfReplaceAll]);
  URL := StringReplace(URL, '(', '%28', [rfReplaceAll]);
  URL := StringReplace(URL, ')', '%29', [rfReplaceAll]);
  URL := StringReplace(URL, '+', '%2B', [rfReplaceAll]);
  URL := StringReplace(URL, ',', '%2C', [rfReplaceAll]);
  URL := StringReplace(URL, '/', '%2F', [rfReplaceAll]);
  URL := StringReplace(URL, ':', '%3A', [rfReplaceAll]);
  URL := StringReplace(URL, ';', '%3B', [rfReplaceAll]);
  URL := StringReplace(URL, '<', '%3C', [rfReplaceAll]);
  URL := StringReplace(URL, '=', '%3D', [rfReplaceAll]);
  URL := StringReplace(URL, '>', '%3E', [rfReplaceAll]);
  URL := StringReplace(URL, '?', '%3F', [rfReplaceAll]);
  URL := StringReplace(URL, '@', '%40', [rfReplaceAll]);
  URL := StringReplace(URL, '[', '%5B', [rfReplaceAll]);
  URL := StringReplace(URL, '\', '%5C', [rfReplaceAll]);
  URL := StringReplace(URL, ']', '%5D', [rfReplaceAll]);
  URL := StringReplace(URL, '^', '%5E', [rfReplaceAll]);
  URL := StringReplace(URL, '`', '%60', [rfReplaceAll]);
  URL := StringReplace(URL, '{', '%7B', [rfReplaceAll]);
  URL := StringReplace(URL, '|', '%7C', [rfReplaceAll]);
  URL := StringReplace(URL, '}', '%7D', [rfReplaceAll]);
  URL := StringReplace(URL, '~', '%7E', [rfReplaceAll]);
  Result := URL;
*)
end;

function DownloadToStream(Url: string; Stream: TStream): boolean;
var
  hNet : HINTERNET;
  hUrl : HINTERNET;
  Buffer : PChar;
  BytesRead : DWORD;
begin
  /// Descarga un archivo desde una URL a un Stream

  Result := False;
  hNet := InternetOpen('agent', INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  if (hNet <> nil) then
  begin
     hUrl := InternetOpenUrl(hNet, PChar(Url), nil, 0, INTERNET_FLAG_RELOAD, 0);
     if (hUrl <> nil) then
     begin
        GetMem(Buffer, 100 * 1024);
        try
           while (InternetReadFile(hUrl, Buffer, 100 * 1024, BytesRead)) do
           begin
              if (BytesRead = 0) then
              begin
                 Result := True;
                 Break;
              end;
              Stream.WriteBuffer(Buffer^, BytesRead);
           end;
        finally
           FreeMem(Buffer);
        end;
        InternetCloseHandle(hUrl);
     end;
     InternetCloseHandle(hNet);
  end;
end;

function UploadFile(Url, Archivo: string): boolean;
var
  IdHTTP : TIdHTTP;
  PostData : TIdMultipartFormDataStream;
  IdSSLIOHandlerSocketOpenSSL : TIdSSLIOHandlerSocketOpenSSL;
  NombreContenedor : string;
begin
  /// Sube un fichero a una dirección web.

  Result := False;
  try
     // Si la URL es para algun modulo de Factronica
     if (Pos('factronica_cesion', url) > 0) then
        NombreContenedor := 'ArchivoDatos'
     else
     if (Pos('factronica_boleta_creardte', url) > 0) then
        NombreContenedor := 'archivito'
     else
     if (Pos('api_pfx2txtcliente', url) > 0) then
        NombreContenedor := 'pfx'
     else
        NombreContenedor := 'file';
     // ¿Estamos conectados a Internet?
     if WinInet.InternetGetConnectedState(nil, 0) then
     begin
        IdHTTP := TIdHTTP.Create(Application);
        try
           IdSSLIOHandlerSocketOpenSSL := TIdSSLIOHandlerSocketOpenSSL.Create;
           try
              if (LowerCase(Copy(Url, 1, 8)) = 'https://') then
              begin
                 IdHTTP.IOHandler := IdSSLIOHandlerSocketOpenSSL;
                 IdSSLIOHandlerSocketOpenSSL.SSLOptions.SSLVersions := [sslvSSLv2, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2]; //[sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
              end;

              PostData := TIdMultipartFormDataStream.Create;
              try
                 PostData.AddFile(NombreContenedor, Archivo);
                 IdHTTP.Post(Url, PostData);
                 Result := True;
              finally
                 PostData.Free;
              end;
           finally
              IdSSLIOHandlerSocketOpenSSL.Free;
           end;
        finally
           IdHTTP.Free;
        end;
     end;
  except
     on E: Exception do
     begin
        Result := False;
        ShowMessage(format(_('Error al subir fichero %s a %s'), [Archivo, Url]) + #13#10 + E.Message);
     end;
  end;
end;

function IsURL404(const URL: string): boolean;
var
  HTTP : TIdHTTP;
begin
  HTTP := TIdHTTP.Create(nil);
  try
     try
        // Realiza una solicitud HEAD a la URL
        HTTP.Head(URL);
        Result := HTTP.ResponseCode = 404;
     except
        on E: EIdHTTPProtocolException do
           Result := (E.ErrorCode = 404); // Captura el error 404 específicamente
        else
           Result := False; // Otros errores pueden no ser 404
     end;
  finally
     HTTP.Free;
  end;
end;

function DescargaFichero(Url, RutaArchivoGuardado: string): boolean;
var
  Stream : TFileStream;
begin
  Result := False;
  if (IsURL404(Url)) then
  begin
     DMMain.Log('No se encontro la url de descarga: ' + Url);
     Result := False;
  end;

  Stream := TFileStream.Create(RutaArchivoGuardado, fmCreate);
  try
     if (DownloadToStream(Url, Stream)) then
     begin
        Result := True;
        DMMain.Log('El archivo se descargado en: ' + RutaArchivoGuardado);
     end;
  finally
     Stream.Free;
  end;
end;

function BoolToInt(Value: boolean): integer;
begin
  if Value then
     Result := 1
  else
     Result := 0;
end;

function LeeDatoIni(const Section, Ident: string; Default: string = ''): string; overload;
begin
  with TIniFile.Create(REntorno.FicheroINI) do
  begin
     try
        Result := ReadString(Section, Ident, Default);
     finally
        Free;
     end;
  end;
end;

function LeeDatoIni(const Section, Ident: string; Default: integer = 0): integer; overload;
begin
  with TIniFile.Create(REntorno.FicheroINI) do
  begin
     try
        Result := ReadInteger(Section, Ident, Default);
     finally
        Free;
     end;
  end;
end;

{ Es ambiguo con TDateTime.
function LeeDatoIni(const Section, Ident: string; Default: Double = 0): Double; overload;
begin
  with TIniFile.Create(REntorno.FicheroINI) do
  begin
     try
        Result := ReadFloat(Section, Ident, Default);
     finally
        Free;
     end;
  end;
end;
}

function LeeDatoIni(const Section, Ident: string; Default: TDateTime = 0): TDateTime; overload;
begin
  if (Default = 0) then
     Default := Now;

  with TIniFile.Create(REntorno.FicheroINI) do
  begin
     try
        Result := ReadDateTime(Section, Ident, Default);
     finally
        Free;
     end;
  end;
end;

function LeeDatoIni(const Section, Ident: string; Default: boolean = True): boolean; overload;
begin
  with TIniFile.Create(REntorno.FicheroINI) do
  begin
     try
        Result := ReadBool(Section, Ident, Default);
     finally
        Free;
     end;
  end;
end;

procedure EscribeDatoIni(const Section, Ident, Dato: string); overload;
begin
  with TIniFile.Create(REntorno.FicheroINI) do
  begin
     try
        WriteString(Section, Ident, Dato);
     finally
        Free;
     end;
  end;
end;

procedure EscribeDatoIni(const Section, Ident: string; Dato: integer); overload;
begin
  with TIniFile.Create(REntorno.FicheroINI) do
  begin
     try
        WriteInteger(Section, Ident, Dato);
     finally
        Free;
     end;
  end;
end;

{ Es ambiguo con TDateTime.
procedure EscribeDatoIni(const Section, Ident: string; Dato: Double); overload;
begin
  with TIniFile.Create(REntorno.FicheroINI) do
  begin
     try
        WriteFloat(Section, Ident, Dato);
     finally
        Free;
     end;
  end;
end;
}
procedure EscribeDatoIni(const Section, Ident: string; Dato: TDateTime); overload;
begin
  with TIniFile.Create(REntorno.FicheroINI) do
  begin
     try
        WriteDateTime(Section, Ident, Dato);
     finally
        Free;
     end;
  end;
end;

procedure EscribeDatoIni(const Section, Ident: string; Dato: boolean); overload;
begin
  with TIniFile.Create(REntorno.FicheroINI) do
  begin
     try
        WriteBool(Section, Ident, Dato);
     finally
        Free;
     end;
  end;
end;

procedure DeleteRow(StringGrid: TStringGrid; ARow: integer);
var
  i, j : integer;
begin
  with StringGrid do
  begin
     for i := ARow to RowCount - 2 do
        for j := 0 to ColCount - 1 do
           Cells[j, i] := Cells[j, i + 1];
     RowCount := RowCount - 1;
  end;
end;

procedure ClearStringGrid(StringGrid: TStringGrid; MantenerColumnas: boolean = False; FilasMantener: integer = 0);
var
  i, j : integer;
begin
  with StringGrid do
  begin
     Visible := False;
     try
        for i := FilasMantener to RowCount - 0 do
           for j := 0 to ColCount - 1 do
              Cells[j, i] := '';

        if (not MantenerColumnas) then
           ColCount := FixedCols + 1;
        RowCount := FixedRows + FilasMantener + 1;
     finally
        Visible := True;
     end;
  end;
end;

procedure Posicionar(DataSet: TDataSet; CampoId: string; Id: integer; Aproximada: boolean = False; DesdeElFinal: boolean = False); overload;
var
  F : TIntegerField;
begin
  with DataSet do
  begin
     DisableControls;
     try
        // Abro la tabla si esta cerrada
        if not Active then
           Open;

        F := TIntegerField(FieldByName(CampoId));
        if Aproximada then
        begin
           if DesdeElFinal then
           begin
              // Encuentro el primero cuyo ID sea menor al parametro
              Last;
              while ((not BOF) and (F.AsInteger > id)) do
                 Prior;
           end
           else
           begin
              // Encuentro el primero cuyo ID sea mayor al parametro
              First;
              while ((not EOF) and (F.AsInteger < id)) do
                 Next;
           end;
        end
        else
        begin
           if DesdeElFinal then
           begin
              Last;
              // Encuentro el primero cuyo ID sea igual al parametro
              while ((not BOF) and (F.AsInteger <> id)) do
                 Prior;
           end
           else
           begin
              // Encuentro el primero cuyo ID sea igual al parametro
              First;
              while ((not EOF) and (F.AsInteger <> id)) do
                 Next;
           end;
        end;
     finally
        EnableControls;
     end;
  end;
end;

procedure Refrescar(DataSet: TDataSet; CampoId: string; Id: integer; Aproximada: boolean = False; DesdeElFinal: boolean = False); overload;
begin
  with DataSet do
  begin
     DisableControls;
     try
        // Cierro la tabla si esta abierta
        if Active then
           Close;

        if (CampoId = '') then
           Open
        else
           Posicionar(DataSet, CampoId, Id, Aproximada, DesdeElFinal);
     finally
        EnableControls;
     end;
  end;
end;

procedure Posicionar(DataSet: TDataSet; CampoId: string; Id: string; Aproximada: boolean = False; DesdeElFinal: boolean = False); overload;
begin
  with DataSet do
  begin
     DisableControls;
     try
        // Abro la tabla si esta cerrada
        if not Active then
           Open;

        if DesdeElFinal then
        begin
           Last;

           if Aproximada then
           begin
              // Encuentro el primero cuyo ID sea menor al parametro
              while ((not BOF) and (FieldByName(CampoId).AsString > id)) do
                 Prior;
           end
           else
           begin
              // Encuentro el primero cuyo ID sea igual al parametro
              while ((not BOF) and (FieldByName(CampoId).AsString <> id)) do
                 Prior;
           end;
        end
        else
        begin
           First;

           if Aproximada then
           begin
              // Encuentro el primero cuyo ID sea mayor al parametro
              while ((not EOF) and (FieldByName(CampoId).AsString < id)) do
                 Next;
           end
           else
           begin
              // Encuentro el primero cuyo ID sea igual al parametro
              while ((not EOF) and (FieldByName(CampoId).AsString <> id)) do
                 Next;
           end;
        end;
     finally
        EnableControls;
     end;
  end;
end;

procedure Refrescar(DataSet: TDataSet; CampoId: string; Id: string; Aproximada: boolean = False; DesdeElFinal: boolean = False); overload;
begin
  with DataSet do
  begin
     DisableControls;
     try
        // Cierro la tabla si esta abierta
        if Active then
           Close;

        if (CampoId = '') then
           Open
        else
           Posicionar(DataSet, CampoId, Id, Aproximada, DesdeElFinal);
     finally
        EnableControls;
     end;
  end;
end;

procedure GetBitmapFromImageList(aSpeedButton: TSpeedButton; GlyphNum: integer; SourceImgL: TImageList; ImgIdx: integer); overload;
begin
  /// Asigno a Glyph una imagen del TImageList
  /// Si es el primero, se borran todos los glyghs

  with aSpeedButton.Glyph do
  begin
     // Si es el primer Glyph, relleno primero todas las imagenes con clFuchsia
     if (GlyphNum = 1) then
     begin
        PixelFormat := pf32Bit;
        Width := SourceImgL.Width * aSpeedButton.NumGlyphs;
        Height := SourceImgL.Height;
        Canvas.Brush.Color := clFuchsia;
        Canvas.FillRect(Classes.Rect(0, 0, Width, Height));
     end;

     SourceImgL.Draw(Canvas, ((GlyphNum - 1) * SourceImgL.Width), 0, ImgIdx);
  end;
end;

procedure GetBitmapFromImageList(aBitBtn: TBitBtn; GlyphNum: integer; SourceImgL: TImageList; ImgIdx: integer); overload;
begin
  /// Asigno a Glyph una imagen del TImageList
  /// Si es el primero, se borran todos los glyghs

  with aBitBtn.Glyph do
  begin
     // Si es el primer Glyph, relleno primero todas las imagenes con clFuchsia
     if (GlyphNum = 1) then
     begin
        PixelFormat := pf32Bit;
        Width := SourceImgL.Width * aBitBtn.NumGlyphs;
        Height := SourceImgL.Height;
        Canvas.Brush.Color := clFuchsia;
        Canvas.FillRect(Classes.Rect(0, 0, Width, Height));
     end;

     SourceImgL.Draw(Canvas, ((GlyphNum - 1) * SourceImgL.Width), 0, ImgIdx);
  end;
end;

procedure GetBitmapFromImageList(aFlatButton: TFlatButton; GlyphNum: integer; SourceImgL: TImageList; ImgIdx: integer); overload;
begin
  /// Asigno a Glyph una imagen del TImageList
  /// Si es el primero, se borran todos los glyghs

  with aFlatButton.Glyph do
  begin
     // Si es el primer Glyph, relleno primero todas las imagenes con clFuchsia
     if (GlyphNum = 1) then
     begin
        PixelFormat := pf32Bit;
        Width := SourceImgL.Width * aFlatButton.NumGlyphs;
        Height := SourceImgL.Height;
        Canvas.Brush.Color := clFuchsia;
        Canvas.FillRect(Classes.Rect(0, 0, Width, Height));
     end;

     SourceImgL.Draw(Canvas, ((GlyphNum - 1) * SourceImgL.Width), 0, ImgIdx);
  end;
end;

function Brighten(Color: TColor; Factor: integer): TColor;
begin
  Color := ColorToRGB(Color);
  if 0 < Factor then             // 0 = no changes
  begin
     if Factor > MaxFactor then
        Factor := MaxFactor;
     Result := ((((255 - ((Color shr 16) and $FF)) * Factor) div MaxFactor)) shl 8;
     Result := (Result or (((255 - ((Color shr 8) and $FF)) * Factor) div MaxFactor)) shl 8;
     Result := (Result or (((255 - (Color and $FF)) * Factor) div MaxFactor));
     Result := Color + Result;
  end
  else
     Result := Color;
end;

// Factor 0..MaxFactor
function Darken(Color: TColor; Factor: integer): TColor;
begin
  Color := ColorToRGB(Color);
  if 0 < Factor then             // 0 = no changes
  begin
     if Factor > MaxFactor then
        Factor := MaxFactor;
     Result := (((((Color shr 16) and $FF) * Factor) div MaxFactor)) shl 8;
     Result := (Result or ((((Color shr 8) and $FF) * Factor) div MaxFactor)) shl 8;
     Result := (Result or (((Color and $FF) * Factor) div MaxFactor));
     Result := Color - Result;
  end
  else
     Result := Color;
end;

// Factor -MaxFactor..MaxFactor
function ChangeBrightness(Color: TColor; Factor: integer): TColor;
var
  DstValue : integer;
begin
  Color := ColorToRGB(Color);
  if Factor <> 0 then             // 0 = no changes
  begin
     if Factor > 0 then
     begin
        DstValue := 255;
     end
     else
     begin
        DstValue := 0;
        Factor := -Factor;
     end;
     if Factor > MaxFactor then
        Factor := MaxFactor;
     Result := ((((DstValue - ((Color shr 16) and $FF)) * Factor) div MaxFactor)) shl 8;
     Result := (Result + (((DstValue - ((Color shr 8) and $FF)) * Factor) div MaxFactor)) shl 8;
     Result := (Result + (((DstValue - (Color and $FF)) * Factor) div MaxFactor));
     Result := Color + Result;
  end
  else
     Result := Color;
end;

// Value: 0..255 RGB value
// CurrentLum: 0..510, current luminance
// NewLum: 0..510, destination luminance
function SetLuminanceToRGBValue(Value, CurrentLum, NewLum: integer): byte;
begin
  if (0 <= Value) and (Value <= 255) and (0 <= CurrentLum) and
     (CurrentLum <= 510) and (0 <= NewLum) and (NewLum <= 510) then
  begin
     case CurrentLum of
        1..255:
        begin
           if NewLum <= 255 then             // lower segment
              Result := (Value * NewLum) div CurrentLum
           else                              // lower -> upper segment
              Result := NewLum - 255 + (Value * (510 - NewLum)) div CurrentLum;
        end;
        256..509:
        begin
           Value := 255 - Value;
           CurrentLum := 510 - CurrentLum;
           if NewLum <= 255 then             // upper -> lower segment
              Result := NewLum - (Value * NewLum) div CurrentLum
           else                              // upper segment
              Result := 255 - (Value * (510 - NewLum)) div CurrentLum;
        end;
        else      // black or white
           Result := NewLum div 2;
     end;
  end
  else   // wrong value for Value, CurrentLum or NewLum
     Result := Value;
end;

function SetLuminanceToRGB(Color: TColor; NewLum: integer): TColor;
var
  R, G, B : integer;
  Max, Min : integer;
  CurrentLum : integer;
begin
  Color := ColorToRGB(Color);
  R := Color and $FF;
  Min := R;
  Max := R;
  Color := Color shr 8;
  G := Color and $FF;
  if Min > G then
     Min := G;
  if Max < G then
     Max := G;
  Color := Color shr 8;
  B := Color and $FF;
  if Min > B then
     Min := B;
  if Max < B then
     Max := B;
  CurrentLum := Min + Max;
  Result := SetLuminanceToRGBValue(B, CurrentLum, NewLum) shl 8;
  Result := (Result or SetLuminanceToRGBValue(G, CurrentLum, NewLum)) shl 8;
  Result := Result or SetLuminanceToRGBValue(R, CurrentLum, NewLum);
end;

function HTMLToColorToHex(s: string): string;
begin
  Result := '';
  s := UpperCase(s);
  if (s = 'BLACK') then
     Result := '000000'
  else
  if (s = 'NAVY') then
     Result := '000080'
  else
  if (s = 'DARKBLUE') then
     Result := '00008B'
  else
  if (s = 'MEDIUMBLUE') then
     Result := '0000CD'
  else
  if (s = 'BLUE') then
     Result := '0000FF'
  else
  if (s = 'DARKGREEN') then
     Result := '006400'
  else
  if (s = 'GREEN') then
     Result := '008000'
  else
  if (s = 'TEAL') then
     Result := '008080'
  else
  if (s = 'DARKCYAN') then
     Result := '008B8B'
  else
  if (s = 'DEEPSKYBLUE') then
     Result := '00BFFF'
  else
  if (s = 'DARKTURQUOISE') then
     Result := '00CED1'
  else
  if (s = 'MEDIUMSPRINGGREEN') then
     Result := '00FA9A'
  else
  if (s = 'LIME') then
     Result := '00FF00'
  else
  if (s = 'SPRINGGREEN') then
     Result := '00FF7F'
  else
  if (s = 'AQUA') then
     Result := '00FFFF'
  else
  if (s = 'CYAN') then
     Result := '00FFFF'
  else
  if (s = 'MIDNIGHTBLUE') then
     Result := '191970'
  else
  if (s = 'DODGERBLUE') then
     Result := '1E90FF'
  else
  if (s = 'LIGHTSEAGREEN') then
     Result := '20B2AA'
  else
  if (s = 'FORESTGREEN') then
     Result := '228B22'
  else
  if (s = 'SEAGREEN') then
     Result := '2E8B57'
  else
  if (s = 'DARKSLATEGRAY') then
     Result := '2F4F4F'
  else
  if (s = 'LIMEGREEN') then
     Result := '32CD32'
  else
  if (s = 'MEDIUMSEAGREEN') then
     Result := '3CB371'
  else
  if (s = 'TURQUOISE') then
     Result := '40E0D0'
  else
  if (s = 'ROYALBLUE') then
     Result := '4169E1'
  else
  if (s = 'STEELBLUE') then
     Result := '4682B4'
  else
  if (s = 'DARKSLATEBLUE') then
     Result := '483D8B'
  else
  if (s = 'MEDIUMTURQUOISE') then
     Result := '48D1CC'
  else
  if (s = 'INDIGO') then
     Result := '4B0082'
  else
  if (s = 'DARKOLIVEGREEN') then
     Result := '556B2F'
  else
  if (s = 'CADETBLUE') then
     Result := '5F9EA0'
  else
  if (s = 'CORNFLOWERBLUE') then
     Result := '6495ED'
  else
  if (s = 'MEDIUMAQUAMARINE') then
     Result := '66CDAA'
  else
  if (s = 'DIMGRAY') then
     Result := '696969'
  else
  if (s = 'SLATEBLUE') then
     Result := '6A5ACD'
  else
  if (s = 'OLIVEDRAB') then
     Result := '6B8E23'
  else
  if (s = 'SLATEGRAY') then
     Result := '708090'
  else
  if (s = 'LIGHTSLATEGRAY') then
     Result := '778899'
  else
  if (s = 'MEDIUMSLATEBLUE') then
     Result := '7B68EE'
  else
  if (s = 'MEDIUMSLATEBLUE') then
     Result := '7B68EE'
  else
  if (s = 'LAWNGREEN') then
     Result := '7CFC00'
  else
  if (s = 'CHARTREUSE') then
     Result := '7FFF00'
  else
  if (s = 'AQUAMARINE') then
     Result := '7FFFD4'
  else
  if (s = 'MAROON') then
     Result := '800000'
  else
  if (s = 'PURPLE') then
     Result := '800080'
  else
  if (s = 'OLIVE') then
     Result := '808000'
  else
  if (s = 'GRAY') then
     Result := '808080'
  else
  if (s = 'SKYBLUE') then
     Result := '87CEEB'
  else
  if (s = 'LIGHTSKYBLUE') then
     Result := '87CEFA'
  else
  if (s = 'BLUEVIOLET') then
     Result := '8A2BE2'
  else
  if (s = 'DARKRED') then
     Result := '8B0000'
  else
  if (s = 'DARKMAGENTA') then
     Result := '8B008B'
  else
  if (s = 'SADDLEBROWN') then
     Result := '8B4513'
  else
  if (s = 'DARKSEAGREEN') then
     Result := '8FBC8F'
  else
  if (s = 'LIGHTGREEN') then
     Result := '90EE90'
  else
  if (s = 'MEDIUMPURPLE') then
     Result := '9370DB'
  else
  if (s = 'DARKVIOLET') then
     Result := '9400D3'
  else
  if (s = 'PALEGREEN') then
     Result := '98FB98'
  else
  if (s = 'DARKORCHID') then
     Result := '9932CC'
  else
  if (s = 'AMETHYST') then
     Result := '9966CC'
  else
  if (s = 'YELLOWGREEN') then
     Result := '9ACD32'
  else
  if (s = 'SIENNA') then
     Result := 'A0522D'
  else
  if (s = 'BROWN') then
     Result := 'A52A2A'
  else
  if (s = 'DARKGRAY') then
     Result := 'A9A9A9'
  else
  if (s = 'LIGHTBLUE') then
     Result := 'ADD8E6'
  else
  if (s = 'GREENYELLOW') then
     Result := 'ADFF2F'
  else
  if (s = 'PALETURQUOISE') then
     Result := 'AFEEEE'
  else
  if (s = 'LIGHTSTEELBLUE') then
     Result := 'B0C4DE'
  else
  if (s = 'POWDERBLUE') then
     Result := 'B0E0E6'
  else
  if (s = 'FIREBRICK') then
     Result := 'B22222'
  else
  if (s = 'DARKGOLDENROD') then
     Result := 'B8860B'
  else
  if (s = 'MEDIUMORCHID') then
     Result := 'BA55D3'
  else
  if (s = 'ROSYBROWN') then
     Result := 'BC8F8F'
  else
  if (s = 'DARKKHAKI') then
     Result := 'BDB76B'
  else
  if (s = 'SILVER') then
     Result := 'C0C0C0'
  else
  if (s = 'SILVER') then
     Result := 'C0C0C0'
  else
  if (s = 'MEDIUMVIOLETRED') then
     Result := 'C71585'
  else
  if (s = 'INDIANRED') then
     Result := 'CD5C5C'
  else
  if (s = 'PERU') then
     Result := 'CD853F'
  else
  if (s = 'CHOCOLATE') then
     Result := 'D2691E'
  else
  if (s = 'TAN') then
     Result := 'D2B48C'
  else
  if (s = 'LIGHTGREY') then
     Result := 'D3D3D3'
  else
  if (s = 'THISTLE') then
     Result := 'D8BFD8'
  else
  if (s = 'ORCHID') then
     Result := 'DA70D6'
  else
  if (s = 'GOLDENROD') then
     Result := 'DAA520'
  else
  if (s = 'PALEVIOLETRED') then
     Result := 'DB7093'
  else
  if (s = 'CRIMSON') then
     Result := 'DC143C'
  else
  if (s = 'GAINSBORO') then
     Result := 'DCDCDC'
  else
  if (s = 'PLUM') then
     Result := 'DDA0DD'
  else
  if (s = 'BURLYWOOD') then
     Result := 'DEB887'
  else
  if (s = 'LIGHTCYAN') then
     Result := 'E0FFFF'
  else
  if (s = 'LAVENDER') then
     Result := 'E6E6FA'
  else
  if (s = 'DARKSALMON') then
     Result := 'E9967A'
  else
  if (s = 'VIOLET') then
     Result := 'EE82EE'
  else
  if (s = 'PALEGOLDENROD') then
     Result := 'EEE8AA'
  else
  if (s = 'LIGHTCORAL') then
     Result := 'F08080'
  else
  if (s = 'KHAKI') then
     Result := 'F0E68C'
  else
  if (s = 'ALICEBLUE') then
     Result := 'F0F8FF'
  else
  if (s = 'HONEYDEW') then
     Result := 'F0FFF0'
  else
  if (s = 'AZURE') then
     Result := 'F0FFFF'
  else
  if (s = 'SANDYBROWN') then
     Result := 'F4A460'
  else
  if (s = 'WHEAT') then
     Result := 'F5DEB3'
  else
  if (s = 'BEIGE') then
     Result := 'F5F5DC'
  else
  if (s = 'WHITESMOKE') then
     Result := 'F5F5F5'
  else
  if (s = 'MINTCREAM') then
     Result := 'F5FFFA'
  else
  if (s = 'GHOSTWHITE') then
     Result := 'F8F8FF'
  else
  if (s = 'SALMON') then
     Result := 'FA8072'
  else
  if (s = 'ANTIQUEWHITE') then
     Result := 'FAEBD7'
  else
  if (s = 'LINEN') then
     Result := 'FAF0E6'
  else
  if (s = 'LIGHTGOLDENRODYELLOW') then
     Result := 'FAFAD2'
  else
  if (s = 'OLDLACE') then
     Result := 'FDF5E6'
  else
  if (s = 'RED') then
     Result := 'FF0000'
  else
  if (s = 'FUCHSIA') then
     Result := 'FF00FF'
  else
  if (s = 'MAGENTA') then
     Result := 'FF00FF'
  else
  if (s = 'DEEPPINK') then
     Result := 'FF1493'
  else
  if (s = 'ORANGERED') then
     Result := 'FF4500'
  else
  if (s = 'TOMATO') then
     Result := 'FF6347'
  else
  if (s = 'HOTPINK') then
     Result := 'FF69B4'
  else
  if (s = 'CORAL') then
     Result := 'FF7F50'
  else
  if (s = 'DARKORANGE') then
     Result := 'FF8C00'
  else
  if (s = 'LIGHTSALMON') then
     Result := 'FFA07A'
  else
  if (s = 'LIGHTSALMON') then
     Result := 'FFA07A'
  else
  if (s = 'ORANGE') then
     Result := 'FFA500'
  else
  if (s = 'LIGHTPINK') then
     Result := 'FFB6C1'
  else
  if (s = 'PINK') then
     Result := 'FFC0CB'
  else
  if (s = 'GOLD') then
     Result := 'FFD700'
  else
  if (s = 'PEACHPUFF') then
     Result := 'FFDAB9'
  else
  if (s = 'NAVAJOWHITE') then
     Result := 'FFDEAD'
  else
  if (s = 'MOCCASIN') then
     Result := 'FFE4B5'
  else
  if (s = 'BISQUE') then
     Result := 'FFE4C4'
  else
  if (s = 'MISTYROSE') then
     Result := 'FFE4E1'
  else
  if (s = 'BLANCHEDALMOND') then
     Result := 'FFEBCD'
  else
  if (s = 'PAPAYAWHIP') then
     Result := 'FFEFD5'
  else
  if (s = 'LAVENDERBLUSH') then
     Result := 'FFF0F5'
  else
  if (s = 'SEASHELL') then
     Result := 'FFF5EE'
  else
  if (s = 'CORNSILK') then
     Result := 'FFF8DC'
  else
  if (s = 'LEMONCHIFFON') then
     Result := 'FFFACD'
  else
  if (s = 'FLORALWHITE') then
     Result := 'FFFAF0'
  else
  if (s = 'SNOW') then
     Result := 'FFFAFA'
  else
  if (s = 'YELLOW') then
     Result := 'FFFF00'
  else
  if (s = 'LIGHTYELLOW') then
     Result := 'FFFFE0'
  else
  if (s = 'IVORY') then
     Result := 'FFFFF0'
  else
  if (s = 'WHITE') then
     Result := 'FFFFFF';
end;

function HEXToColor(hex: string): TColor;
var
  r, g, b : integer;
begin
  /// Se espera un valor exadecimal de 6 posiciones
  /// Este valor representa colores HTML (RGB)
  /// Puede venir con prefijo "$" o "#".

  Result := 0;
  try
     // Quito prefijo
     if (Copy(hex, 1, 1) = '$') or (Copy(hex, 1, 1) = '#') then
        hex := Copy(hex, 2, Length(hex));

     // Separo canales de color, conviritendolos de HEX a BYTE
     r := StrToInt('$' + Copy(hex, 1, 2));
     g := StrToInt('$' + Copy(hex, 3, 2));
     b := StrToInt('$' + Copy(hex, 5, 2));

     // Rearmo RGB en BGR que es como Delphi representa los colores
     Result := b;
     Result := (Result shl 8) or g;
     Result := (Result shl 8) or r;
  except
  end;
end;

procedure DameMinMax(Tipo: string; var Min, Max: string; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0); overload;
var
  i : integer;
begin
  /// Devuelve el minimo y maximo valor dentro de una tabla
  /// ALM - Almacenes
  /// ART - Articulos SIN FAMILIA SISTEMA
  /// CAR - Articulos de Empresa-Ejercicio-Canal SIN FAMILIA SISTEMA
  /// CTA - Cuentas Contables de ultimo nivel
  /// FAM - Familias SIN FAMILIA SISTEMA
  /// PE1 - Periodos mensuales
  /// RFP - Referencia de Proveedor (Modelo de Tallas y Colores)
  /// GRT - Grupo de Tallas
  /// AGA - Agrupacin de Agentes
  /// AGC - Agrupacion de Clientes
  /// AGE - Agrupacion de Agentes
  /// SER - Series
  /// HOR - Horario

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        if (Tipo = 'ALM') then
           SQL.Text := 'SELECT MIN(ALMACEN), MAX(ALMACEN) FROM ART_ALMACENES WHERE EMPRESA = :EMPRESA';
        if (Tipo = 'ART') then
           SQL.Text := 'SELECT MIN(ARTICULO), MAX(ARTICULO) FROM ART_ARTICULOS WHERE EMPRESA = :EMPRESA AND FAMILIA <> ''' + REntorno.FamSistema + '''';
        if (Tipo = 'CAR') then
           SQL.Text := 'SELECT MIN(C.ARTICULO), MAX(C.ARTICULO) FROM CON_CUENTAS_GES_ART C JOIN ART_ARTICULOS A ON C.ID_A = A.ID_A WHERE C.EMPRESA = :EMPRESA AND C.EJERCICIO = :EJERCICIO AND C.CANAL = :CANAL AND A.FAMILIA <> ''' + REntorno.FamSistema + '''';
        if (Tipo = 'CTA') then
           SQL.Text := 'SELECT MIN(CUENTA), MAX(CUENTA) FROM CON_CUENTAS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND TIPO = 5 AND PGC = ' + IntToStr(REntorno.PGC);
        if (Tipo = 'FAM') then
           SQL.Text := 'SELECT MIN(FAMILIA), MAX(FAMILIA) FROM ART_FAMILIAS WHERE EMPRESA = :EMPRESA AND FAMILIA <> ''' + REntorno.FamSistema + '''';
        if (Tipo = 'PE1') then
           SQL.Text := 'SELECT MIN(PERIODO), MAX(PERIODO) FROM EMP_PERIODOS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND TIPO = 1';
        if (Tipo = 'RFP') then
           SQL.Text := 'SELECT MIN(REF_PROVEEDOR), MAX(REF_PROVEEDOR) FROM ART_ARTICULOS_MODELOS WHERE EMPRESA = :EMPRESA';
        if (Tipo = 'GRT') then
           SQL.Text := 'SELECT MIN(GRUPO), MAX(GRUPO) FROM ART_GRUPOS_TALLAS';
        if (Tipo = 'PRO') then
           SQL.Text := 'SELECT MIN(PROVEEDOR), MAX(PROVEEDOR) FROM EMP_PROVEEDORES WHERE EMPRESA = :EMPRESA';
        if (Tipo = 'AGA') then
           SQL.Text := 'SELECT MIN(AGRUPACION), MAX(AGRUPACION) FROM VER_AGRUPACIONES_ART_EF WHERE EMPRESA = :EMPRESA';
        if (Tipo = 'AGC') then
           SQL.Text := 'SELECT MIN(AGRUPACION), MAX(AGRUPACION) FROM VER_AGRUPACIONES_CLIENTE WHERE EMPRESA = :EMPRESA';
        if (Tipo = 'AGE') then
           SQL.Text := 'SELECT MIN(AGRUPACION), MAX(AGRUPACION) FROM VER_AGRUPACIONES_AGENTES_EF WHERE EMPRESA = :EMPRESA';
        if (Tipo = 'SER') then
           SQL.Text := 'SELECT MIN(SERIE), MAX(SERIE) FROM EMP_SERIES WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND ACTIVO = 1';
        if (Tipo = 'HOR') then
           SQL.Text := 'SELECT MIN(HORARIO), MAX(HORARIO) FROM OPE_HORARIOS WHERE EMPRESA = :EMPRESA';

        for i := 0 to Params.Count - 1 do
        begin
           if Params[i].Name = 'EMPRESA' then
           begin
              if (Empresa = 0) then
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa
              else
                 Params.ByName['EMPRESA'].AsInteger := Empresa;
           end;
           if Params[i].Name = 'EJERCICIO' then
           begin
              if (Ejercicio = 0) then
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio
              else
                 Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           end;
           if Params[i].Name = 'CANAL' then
           begin
              if (Canal = 0) then
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal
              else
                 Params.ByName['CANAL'].AsInteger := Canal;
           end;
        end;

        ExecQuery;
        Min := FieldByName['MIN'].AsString;
        Max := FieldByName['MAX'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure DameMinMax(Tipo: string; var Min, Max: integer; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0); overload;
var
  i : integer;
begin
  /// Devuelve el minimo y maximo valor dentro de una tabla
  /// TER - Terceros
  /// CLI - Clientes
  /// PRO - Proveedores
  /// ACR - Acreedores
  /// AGE - Agente
  /// AGC - Agente-EEC
  /// CAN - Canales
  /// CAM - Campañas
  /// BAN - Bancos
  /// EMP - Empleado
  /// IDE - Id Empleado
  /// CAL - Calendario
  /// TIN - Tipo de Incidencia
  /// USU - Usuario
  /// PRY - Proyecto

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        if (Tipo = 'TER') then
           SQL.Text := 'SELECT MIN(TERCERO), MAX(TERCERO) FROM SYS_TERCEROS';
        if (Tipo = 'CLI') then
           SQL.Text := 'SELECT MIN(CLIENTE), MAX(CLIENTE) FROM EMP_CLIENTES WHERE EMPRESA = :EMPRESA';
        if (Tipo = 'PRO') then
           SQL.Text := 'SELECT MIN(PROVEEDOR), MAX(PROVEEDOR) FROM EMP_PROVEEDORES WHERE EMPRESA = :EMPRESA';
        if (Tipo = 'ACR') then
           SQL.Text := 'SELECT MIN(ACREEDOR), MAX(ACREEDOR) FROM EMP_ACREEDORES WHERE EMPRESA = :EMPRESA';
        if (Tipo = 'AGE') then
           SQL.Text := 'SELECT MIN(AGENTE), MAX(AGENTE) FROM EMP_AGENTES WHERE EMPRESA = :EMPRESA';
        if (Tipo = 'AGC') then
           SQL.Text := 'SELECT MIN(AGENTE), MAX(AGENTE) FROM CON_CUENTAS_GES_AGE WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL';
        if (Tipo = 'CAN') then
           SQL.Text := 'SELECT MIN(CANAL), MAX(CANAL) FROM EMP_CANALES WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND ACTIVO = 1';
        if (Tipo = 'CAM') then
           SQL.Text := 'SELECT MIN(CAMPANYA), MAX(CAMPANYA) FROM EMP_CAMPANYAS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND ACTIVA = 1';
        if (Tipo = 'BAN') then
           SQL.Text := 'SELECT MIN(BANCO), MAX(BANCO) FROM VER_BANCOS_CUENTAS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND ACTIVO = 1';
        if (Tipo = 'EMP') then
           SQL.Text := 'SELECT MIN(EMPLEADO), MAX(EMPLEADO) FROM OPE_EMPLEADO WHERE EMPRESA = :EMPRESA AND ACTIVO = 1';
        if (Tipo = 'IDE') then
           SQL.Text := 'SELECT MIN(ID_EMPLEADO), MAX(ID_EMPLEADO) FROM OPE_EMPLEADO WHERE EMPRESA = :EMPRESA AND ACTIVO = 1';
        if (Tipo = 'CAL') then
           SQL.Text := 'SELECT MIN(CALENDARIO), MAX(CALENDARIO) FROM OPE_CALENDARIO_C WHERE EMPRESA = :EMPRESA';
        if (Tipo = 'TIN') then
           SQL.Text := 'SELECT MIN(ID_INCIDENCIA), MAX(ID_INCIDENCIA) FROM PRO_SYS_TIPO_INCIDENCIA';
        if (Tipo = 'USU') then
           SQL.Text := 'SELECT MIN(USUARIO), MAX(USUARIO) FROM SYS_USUARIOS';
        if (Tipo = 'PRY') then
           SQL.Text := 'SELECT MIN(PROYECTO), MAX(PROYECTO) FROM EMP_PROYECTOS WHERE EMPRESA = :EMPRESA';

        for i := 0 to Params.Count - 1 do
        begin
           if Params[i].Name = 'EMPRESA' then
           begin
              if (Empresa = 0) then
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa
              else
                 Params.ByName['EMPRESA'].AsInteger := Empresa;
           end;
           if Params[i].Name = 'EJERCICIO' then
           begin
              if (Ejercicio = 0) then
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio
              else
                 Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           end;
           if Params[i].Name = 'CANAL' then
           begin
              if (Canal = 0) then
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal
              else
                 Params.ByName['CANAL'].AsInteger := Canal;
           end;
        end;

        ExecQuery;
        Min := FieldByName['MIN'].AsInteger;
        Max := FieldByName['MAX'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure DameMinMax(Tipo: string; var Min, Max: TDateTime; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0); overload;
var
  i : integer;
begin
  /// Devuelve el minimo y maximo valor dentro de una tabla
  /// PEC - Fechas de Pedidos de cliente
  /// EJE - Apertura y cierre de ejercicio
  /// PER - Periodo

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        if (Tipo = 'PEC') then
           SQL.Text := 'SELECT MIN(FECHA), MAX(FECHA) FROM GES_CABECERAS_S WHERE EMPRESA = :EMPRESA AND EJERCICIO =:EJERCICIO AND CANAL=:CANAL AND TIPO = ''PEC''';
        if (Tipo = 'EJE') then
           SQL.Text := 'SELECT MIN(APERTURA), MAX(CIERRE) FROM EMP_EJERCICIOS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO';
        if (Tipo = 'PER') then
           SQL.Text := 'SELECT MIN(DESDE), MAX(HASTA) FROM EMP_PERIODOS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO';
        if (Tipo >= 'P01') and (Tipo <= 'P12') then
           SQL.Text := 'SELECT MIN(DESDE), MAX(HASTA) FROM EMP_PERIODOS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND PERIODO = ''' + Copy(Tipo, 2, 2) + '''';

        for i := 0 to Params.Count - 1 do
        begin
           if Params[i].Name = 'EMPRESA' then
           begin
              if (Empresa = 0) then
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa
              else
                 Params.ByName['EMPRESA'].AsInteger := Empresa;
           end;
           if Params[i].Name = 'EJERCICIO' then
           begin
              if (Ejercicio = 0) then
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio
              else
                 Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           end;
           if Params[i].Name = 'CANAL' then
           begin
              if (Canal = 0) then
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal
              else
                 Params.ByName['CANAL'].AsInteger := Canal;
           end;
        end;

        ExecQuery;
        Min := FieldByName['MIN'].AsDateTime;
        Max := FieldByName['MAX'].AsDateTime;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure DameDesdeHastaPeriodo(Periodo: string; var Desde, Hasta: TDateTime; Empresa: integer = 0; Ejercicio: integer = 0);
begin
  /// Devuelve el Fechas de periodo
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;
  if (Ejercicio = 0) then
     Ejercicio := REntorno.Ejercicio;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESDE, HASTA FROM EMP_PERIODOS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND PERIODO = :PERIODO';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['PERIODO'].AsString := Periodo;

        ExecQuery;
        Desde := FieldByName['DESDE'].AsDateTime;
        Hasta := FieldByName['HASTA'].AsDateTime;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function DameTransactionRW(BaseDeDatos: TFIBDatabase; Q: TComponent = nil): TFIBTransaction;
begin
  Result := TFIBTransaction.Create(Q);
  with Result do
  begin
     DefaultDatabase := BaseDeDatos;
     TRParams.Clear;
     TRParams.Add('read_committed');
     TRParams.Add('rec_version');
     TRParams.Add('nowait');
  end;
end;

function DameTransactionRO(BaseDeDatos: TFIBDatabase; Q: TComponent = nil): TFIBTransaction;
begin
  Result := TFIBTransaction.Create(Q);
  with Result do
  begin
     DefaultDatabase := BaseDeDatos;
     TRParams.Clear;
     TRParams.Add('read_committed');
     TRParams.Add('read');
  end;
end;

procedure CrearCodigoQR(Bitmap: TBitmap; s: string; Factor: integer = 1);
var
  QRCode : TDelphiZXingQRCode;
  Row, Column : integer;
begin
  /// Pinta un codigo QR en el BITMAP.
  /// Modificara el tamaño del BITMAP para que entre el codigo QR.
  /// Factor es el tamaño de cada punto (1 = 1 pixel, 2 son puntos de 2x2 pixels, etc.)

  QRCode := TDelphiZXingQRCode.Create;
  try
     // Configuracion del codigo QR (Alfa o numerico automatico, 4 puntos de borde).
     QRCode.Data := s;
     QRCode.Encoding := qrAuto;
     QRCode.QuietZone := 4;

     // Modifico tamaño del Bitmap
     Bitmap.Height := QRCode.Rows * Factor;
     Bitmap.Width := QRCode.Columns * Factor;

     // Recorro el codigo QR y pinto los puntos
     for Row := 0 to QRCode.Rows - 1 do
     begin
        for Column := 0 to QRCode.Columns - 1 do
        begin
           if (QRCode.IsBlack[Row, Column]) then
              Bitmap.Canvas.Brush.Color := clBlack
           else
              Bitmap.Canvas.Brush.Color := clWhite;

           // Cada punto se corresponderá a un cuadrado de (Factor x Factor) pixeles
           Bitmap.Canvas.FillRect(Classes.Rect((Factor * Column), (Factor * Row), (Factor * Column) + Factor, (Factor * Row) + Factor));
        end;
     end;
  finally
     QRCode.Free;
  end;
end;

(*
Es preferible utilizar esta versión para obtener el numero como un texto.
Unidad ALetras
Componente TLetras

var
  s : string;
  Letras : TLetra;
...
  Letras := TLetra.Create(nil);
  try
     // Numero
     Letras.Numero := 123;

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

     // Transformacion
     s := Letras.AsString;
  finally
     Letras.Free;
  end;
*)
function NumerosALetras(Numero: double): string;
const
  Digit: array[1..9] of string = ('Uno', 'Dos', 'Tres',
     'Cuatro', 'Cinco', 'Seis',
     'Siete', 'Ocho', 'Nueve');

  Numeral: array[11..19] of string = ('Once', 'Doce', 'Trece',
     'Catorce', 'Quince', 'Diez y Seis',
     'Diez y Siete', 'Diez y Ocho', 'Diez y Nueve');

  Tenths: array[1..9] of string = ('Diez', 'Veinte', 'Trienta',
     'Cuarenta', 'Cincuenta', 'Sesenta',
     'Setenta', 'Ochenta', 'Noventa');

  Hundreds: array[1..9] of string = ('Cien ', 'Docientos ', 'Trecientos ',
     'Cuatrocientos ', 'Quinientos ', 'Seicientos ',
     'Setecientos ', 'Ochocientos ', 'Novecientos ');

  Min = 1;
  Max = 4294967295;

  function RecursivoANumero(N: longword): string;
  begin
     case N of
        1..9:
        begin
           Result := Digit[N];
        end;

        11..19:
        begin
           Result := Numeral[N];
        end;

        10, 20..99:
        begin
           if (N mod 10) = 0 then
              Result := Tenths[N div 10] + RecursivoANumero(N mod 10)
           else
              Result := Tenths[N div 10] + ' y ' + RecursivoANumero(N mod 10);
        end;

        100..999:
        begin
           if (N = 100) or (N >= 200) then
              Result := Hundreds[N div 100] + RecursivoANumero(N mod 100);
           if (N > 100) and (N < 200) then
              Result := 'Ciento ' + RecursivoANumero(N mod 100);
        end;

        1000..999999:
        begin
           if (Numero >= 1000) and (Numero < 2000) then
              Result := 'Un Mil ' + RecursivoANumero(N mod 1000)
           else
              Result := RecursivoANumero(N div 1000) + ' Mil ' + RecursivoANumero(N mod 1000);
        end;

        1000000..999999999:
        begin
           if (Numero >= 1000000) and (Numero < 2000000) then
              Result := 'Un Millon ' + RecursivoANumero(N mod 1000000)
           else
              Result := RecursivoANumero(N div 1000000) + ' Millones ' + RecursivoANumero(N mod 1000000);
        end;

        1000000000..4294967295:
        begin
           if (Numero >= 1000000000) and (Numero < 2000000000) then
              Result := 'Un Millardo ' + RecursivoANumero(N mod 1000000)
           else
              Result := RecursivoANumero(N div 1000000000) + ' Millardos ' + RecursivoANumero(N mod 1000000000);
        end;
     end;
  end;

begin
  if (Numero >= Min) and (Numero <= Max) then
  begin
     Result := RecursivoANumero(Trunc(Numero));
     Result := Result + ' con ' + FormatFloat('00', Frac(Numero) * 100) + '/100';
  end
  else
     Result := '-1';
end;

function ExisteParametro(DS: TFIBDataSet; Parametro: string): boolean;
var
  i : integer;
begin
  with DS do
  begin
     i := Params.Count - 1;
     while ((i >= 0) and (Params[i].Name <> Parametro)) do
        Dec(i);
  end;

  Result := (i >= 0);
end;

function ExisteParametro(DS: TFIBDataSetRO; Parametro: string): boolean;
var
  i : integer;
begin
  with DS do
  begin
     i := Params.Count - 1;
     while ((i >= 0) and (Params[i].Name <> Parametro)) do
        Dec(i);
  end;

  Result := (i >= 0);
end;

function PS_Get(aURL, Token: string): string;
begin
  Result := '';
  try
     // ¿Estamos conectados a Internet?
     if WinInet.InternetGetConnectedState(nil, 0) then
     begin
        with TIdHTTP.Create(Application) do
        begin
           try
              Request.BasicAuthentication := True;
              Request.Username := Token;

              Result := Get(aURL);
           finally
              Free;
           end;
        end;
     end;
  except
     on e: Exception do
     begin
        Result := E.Message;
     end;
  end;
end;

function PS_Post(aURL, Token, Datos: string): string;
var
  Data : TStringList;
  PostRes : TStringStream;
  IdSSLIOHandlerSocketOpenSSL : TIdSSLIOHandlerSocketOpenSSL;
begin
  Result := '';
  IdSSLIOHandlerSocketOpenSSL := TIdSSLIOHandlerSocketOpenSSL.Create();
  try
     try
        // ¿Estamos conectados a Internet?
        if WinInet.InternetGetConnectedState(nil, 0) then
        begin
           PostRes := TStringStream.Create('');
           Data := TStringList.Create;
           with TIdHTTP.Create(Application) do
           begin
              try
                 Data.Text := Datos;

                 IOHandler := IdSSLIOHandlerSocketOpenSSL;

                 // HTTPOptions := HTTPOptions + [hoNoProtocolErrorException, hoWantProtocolErrorContent];

                 Request.BasicAuthentication := True;
                 Request.Username := Token;
                 Request.Accept := '*/*';
                 // Request.AcceptCharSet := 'ISO-8859-1, *;q=0.8';

                 Request.ContentType := 'application/xml';
                 Request.ContentLength := Length(Data.Text);
                 Request.Method := 'POST';

                 Post(aURL, Data, PostRes);
                 Data.LoadFromStream(PostRes);
                 Result := Data.Text;
              finally
                 Free;
                 PostRes.Free;
                 Data.Free;
              end;
           end;
        end;
     except
        on e: Exception do
        begin
           Result := E.Message;
        end;
     end;
  finally
     IdSSLIOHandlerSocketOpenSSL.Free;
  end;
end;

function FormatDateISO8601(const d: TDateTime): string;
begin
  Result := FormatDateTime('yyyy"-"mm"-"dd', d);
end;

function FormatDateTimeISO8601(const d: TDateTime): string;
begin
  Result := FormatDateTime('yyyy"-"mm"-"dd"T"hh":"nn":"ss"."zzz"Z"', d);
end;

function DateISO8601ToDateTime(const s: string): TDateTime;
var
  aux : string;
begin
  // 2020-03-30 09:33:43
  Result := EncodeDate(StrToIntDef(Copy(s, 1, 4), 0), StrToIntDef(Copy(s, 6, 2), 0), StrToIntDef(Copy(s, 9, 2), 0));

  if (Length(s) > 10) then
  begin
     aux := Copy(s, 12, 2);
     Result := RecodeHour(Result, StrToIntDef(aux, 0));

     aux := Copy(s, 15, 2);
     Result := RecodeMinute(Result, StrToIntDef(aux, 0));

     aux := Copy(s, 18, 2);
     Result := RecodeSecond(Result, StrToIntDef(aux, 0));
     Result := RecodeMilliSecond(Result, 0);
  end
  else
     RecodeTime(Result, 0, 0, 0, 0);
end;

function SegundosToStr(Valor: double): string;
var
  Horas, Minutos, Segundos : integer;
  Signo : string;
begin
  /// Formatea segundos a (-)HH:MM:SS

  // Si Valor es negativo guardo el signo y lo trato como positivo para "calcular" formato.
  Signo := '';
  if (Valor < 0) then
     Signo := '-';

  Segundos := Floor(Abs(Valor));
  Horas := Segundos div 3600;
  Segundos := Segundos - (Horas * 3600);
  Minutos := Segundos div 60;
  Segundos := Segundos - (Minutos * 60);

  Result := Format('%s%2.2d:%2.2d:%2.2d', [Signo, Horas, Minutos, Segundos]);
end;

function StrToDateDD_MM_YYYY(s: string): TDateTime;
begin                                    { 1234567890 }
  Result := EncodeDate(1900, 01, 01);    { DD MM YYYY }
  s := Trim(s);
  if (Length(s) = 10) then
     Result := EncodeDate(StrToIntDef(Copy(s, 7, 4), 1900), StrToIntDef(Copy(s, 4, 2), 1), StrToIntDef(Copy(s, 1, 2), 1));
end;

function StrToDateYYYY_MM_DD(s: string): TDateTime;
begin                                    { 1234567890 }
  Result := EncodeDate(1900, 01, 01);    { YYYY MM DD }
  s := Trim(s);
  if (Length(s) = 10) then
     Result := EncodeDate(StrToIntDef(Copy(s, 1, 4), 1900), StrToIntDef(Copy(s, 6, 2), 1), StrToIntDef(Copy(s, 9, 2), 1));
end;

function StrToDateYYYYMMDD(s: string): TDateTime;
begin                                    { 12345678 }
  Result := EncodeDate(1900, 01, 01);    { YYYYMMDD }
  s := Trim(s);
  if (Length(s) = 8) then
     Result := EncodeDate(StrToIntDef(Copy(s, 1, 4), 1900), StrToIntDef(Copy(s, 5, 2), 1), StrToIntDef(Copy(s, 7, 2), 1));
end;

function StrToDateYYYYMMDD_HH_NN_SS(s: string): TDateTime;
begin                                     { 20240102 08:28:00 }
  Result := EncodeDate(1900, 01, 01);     { YYYYMMDD HH NN SS }
  s := Trim(s);
  if (Length(s) >= 8) then
     Result := EncodeDate(StrToIntDef(Copy(s, 1, 4), 1900), StrToIntDef(Copy(s, 5, 2), 1), StrToIntDef(Copy(s, 7, 2), 1));
  if (Length(s) >= 11) then
     Result := RecodeHour(Result, StrToIntDef(Copy(s, 10, 2), 0));
  if (Length(s) >= 14) then
     Result := RecodeMinute(Result, StrToIntDef(Copy(s, 13, 2), 0));
  if (Length(s) >= 17) then
     Result := RecodeMinute(Result, StrToIntDef(Copy(s, 16, 2), 0));
end;

function StrExcelToDateTime(s: string): TDateTime;
var
  p : integer;
  Dia, Mes, Anyo : integer;
  n : double;
begin
  /// Se espera una fecha con formato dd/mm/yyyy hh:mm:ss
  /// Se espera formato 44084.688677662 (dias desde 01/01/1900)
  /// *** Cada termino puede venir con un solo digito ***

  if (Pos('/', s) = 0) then
  begin
     // Si es formato numerico
     n := StrToFloatDec(s, '.');
     Result := EncodeDate(1900, 1, 1);
     // Por alguna extraña razon hay que restarle 2 para que funcione correctamente.
     Result := Result + n - 2;
  end
  else
  begin
     // Si es formato dd/mm/yyyy hh:mm:ss
     p := Pos('/', s);
     Dia := StrToIntDef(Trim(Copy(s, 1, p - 1)), 0);
     // Quitamos la parte dia
     s := Trim(Copy(s, p + 1, Length(s)));

     p := Pos('/', s);
     Mes := StrToIntDef(Trim(Copy(s, 1, p - 1)), 0);
     // Quitamos la parte dia
     s := Trim(Copy(s, p + 1, Length(s)));

     p := Pos(' ', s);
     if (p = 0) then
     begin
        Anyo := StrToIntDef(s, 0);
        s := '';
     end
     else
     begin
        Anyo := StrToIntDef(Trim(Copy(s, 1, p - 1)), 0);
        // Quitamos la parte dia
        s := Trim(Copy(s, p + 1, Length(s)));
     end;

     Result := EncodeDate(Anyo, Mes, Dia);

     if (Length(s) > 0) then
     begin
        p := Pos(':', s);
        Result := RecodeHour(Result, StrToIntDef(Trim(Copy(s, 1, p - 1)), 0));
        // Quitamos la parte hora
        s := Copy(s, p + 1, Length(s));

        if (Length(s) > 0) then
        begin
           p := Pos(':', s);
           if p < 0 then
              p := Length(s) + 1;
           Result := RecodeMinute(Result, StrToIntDef(Trim(Copy(s, 1, p - 1)), 0));
           // Quitamos la parte minuto
           s := Copy(s, p + 1, Length(s));
        end;

        if (Length(s) > 0) then
           Result := RecodeSecond(Result, StrToIntDef(Trim(s), 0));

        Result := RecodeMilliSecond(Result, 0);
     end
     else
        RecodeTime(Result, 0, 0, 0, 0);
  end;
end;

function MySelectDirectory(var Directorio: string; Ambito: string = ''): boolean;
begin
  Result := False;
  if (Ambito = '') then
     Ambito := 'SIN-AMBITO';

  with TDirectoryDialog.Create(nil) do
  begin
     try
        if (Directorio = '') then
           DirectorioInicial := ExcludeTrailingPathDelimiter(LeeDatoIni('MRU-SELDIR', Ambito, GetSpecialFolderPath(CSIDL_PERSONAL, True)))
        else
           DirectorioInicial := ExcludeTrailingPathDelimiter(Directorio);

        if EscogerDirectorio then
        begin
           Result := True;
           Directorio := ExcludeTrailingPathDelimiter(DirectorioEscogido);
           EscribeDatoIni('MRU-SELDIR', Ambito, Directorio);
        end;
     finally
        Free;
     end;
  end;
end;

function MySaveDialog(var Archivo: string; Extensiones: string = ''; Ubicacion: string = ''; Ambito: string = ''): boolean;
var
  sl : TStrings;
  i : integer;
  Separador : string;
  mru : string;
begin
  /// Devuelve el nombre del fichero a guardar.
  /// Espera una lista de extensiones a elegir. Separadas por coma (ALL,TXT,XLS,ODS,CSV,DOC,ODT,PDF,XML,ZIP).
  /// Se toma la extension del ultimo fichero utilizado.
  /// Si no existe, se toma la primera extension de la lista EXTENSIONES.
  /// Si la UBICACION es vacia toma "Mis Documentos" del sistema.
  /// AMBITO es el entorno para buscar la última ubicación utilizada, si UBICACION está vacia.

  Result := False;
  if (LeeParametro('SYSSAVE001', '') = 'S') then
  begin
     if (Ubicacion = '') then
     begin
        Archivo := GetSpecialFolderPath(CSIDL_PERSONAL, True) + Archivo;
     end;

     Result := True;
  end
  else
  begin
     if (Ambito = '') then
        Ambito := 'SIN-AMBITO';
     mru := LeeDatoIni('MRU-SAVE', Ambito, GetSpecialFolderPath(CSIDL_PERSONAL, True));

     with TSaveDialog.Create(nil) do
     begin
        try
           DefaultExt := ExtractFileExt(Archivo);
           if (DefaultExt <> '') then
           begin
              // No debe llevar el punto.
              DefaultExt := Copy(DefaultExt, Pos('.', DefaultExt) + 1, Length(DefaultExt));
           end
           else
           begin
              DefaultExt := ExtractFileExt(mru);
              if (DefaultExt <> '') then
              begin
                 // No debe llevar el punto.
                 DefaultExt := Copy(DefaultExt, Pos('.', DefaultExt) + 1, Length(DefaultExt));
              end
              else
                 DefaultExt := '';
           end;

           sl := TStringList.Create;
           try
              sl.CommaText := Extensiones;

              Filter := '';
              Separador := '';

              if (DefaultExt = '') and (sl.Count > 0) and (sl[0] <> 'ALL') then
                 DefaultExt := '.' + LowerCase(sl[0]);

              for i := sl.Count - 1 downto 0 do
              begin
                 if (sl[i] = 'ALL') then
                    Filter := _('Todos los archivos|*.*') + Separador + Filter
                 else
                 if (sl[i] = 'TXT') then
                    Filter := _('Archivos de texto|*.txt') + Separador + Filter
                 else
                 if (sl[i] = 'XLS') then
                    Filter := _('Documentos Excel|*.xls;*.xlsx') + Separador + Filter
                 else
                 if (sl[i] = 'ODS') then
                    Filter := _('LibreOffice Calc|*.ods') + Separador + Filter
                 else
                 if (sl[i] = 'CSV') then
                    Filter := _('Archivos Separados por comas|*.csv') + Separador + Filter
                 else
                 if (sl[i] = 'DOC') then
                    Filter := _('Documentos Word|*.doc;*.docx') + Separador + Filter
                 else
                 if (sl[i] = 'ODT') then
                    Filter := _('Documentos LibreOffice Write|*.odt') + Separador + Filter
                 else
                 if (sl[i] = 'PDF') then
                    Filter := _('Documentos Adobe PDF|*.pdf') + Separador + Filter
                 else
                 if (sl[i] = 'XML') then
                    Filter := _('Documentos XML|*.xml') + Separador + Filter
                 else
                 if (sl[i] = 'ZIP') then
                    Filter := _('Documentos comprimidos ZIP|*.zip') + Separador + Filter;

                 Separador := '|';

                 if (UpperCase(DefaultExt) = sl[i]) then
                    FilterIndex := i + 1;
              end;
           finally
              sl.Free;
           end;

           if (Ubicacion = '') then
              InitialDir := ExtractFilePath(mru)
           else
              InitialDir := Ubicacion;

           if (ExtractFileExt(Archivo) <> '') then
              Archivo := ChangeFileExt(Archivo, '.' + DefaultExt)
           else
              Archivo := ChangeFileExt(Archivo, ExtractFileExt(mru));

           FileName := Archivo;

           DMMain.Log('Ambito: ' + Ambito);
           DMMain.Log('DefaultExt: ' + DefaultExt);
           DMMain.Log('FileName: ' + FileName);
           DMMain.Log('InitialDir: ' + InitialDir);
           DMMain.Log('Filter: ' + Filter);
           DMMain.Log('FilterIndex: ' + IntToStr(FilterIndex));

           try
              DMMain.Log('if Execute then ... ');
              if Execute then
              begin
                 DMMain.Log('Archivo: ' + FileName);
                 Result := True;
                 Archivo := FileName;
                 EscribeDatoIni('MRU-SAVE', Ambito, Archivo);
              end
              else
                 DMMain.Log('else Result := False');
           except
              on E: Exception do
                 DMMain.Log('Exception' + #13#10 + e.Message);
           end;
        finally
           Free;
        end;
     end;
  end;
end;

function MyOpenDialog(var Archivo: string; Extensiones: string = ''; Ubicacion: string = ''; Ambito: string = ''): boolean;
var
  sl : TStrings;
  i : integer;
  Separador : string;
  mru : string;
begin
  /// Devuelve el nombre del fichero seleccionado.
  /// Espera una lista de extensiones a elegir. Separadas por coma (ALL,TXT,XLS,ODS,CSV,DOC,ODT,PDF,XML,ZIP).
  /// La primera extension es la que se toma por defecto
  /// Si la ubicacion es vacia toma "Mis Documentos" del sistema.

  Result := False;
  if (Extensiones = '') then
     Extensiones := 'ALL';

  if (Ambito = '') then
     Ambito := 'SIN-AMBITO';
  mru := LeeDatoIni('MRU-OPEN', Ambito, GetSpecialFolderPath(CSIDL_PERSONAL, True));

  with TOpenDialog.Create(nil) do
  begin
     try
        // Primero trato de obtener la ultima extension utilizada
        DefaultExt := ExtractFileExt(mru);
        if (DefaultExt <> '') then
        begin
           // No debe llevar el punto.
           DefaultExt := Copy(DefaultExt, Pos('.', DefaultExt) + 1, Length(DefaultExt));
        end
        else
        begin
           // Si no la obtengo del Archivo
           DefaultExt := ExtractFileExt(Archivo);
           if (DefaultExt <> '') then
           begin
              // No debe llevar el punto.
              DefaultExt := Copy(DefaultExt, Pos('.', DefaultExt) + 1, Length(DefaultExt));
           end
           else
           begin
              DefaultExt := '';
           end;
        end;

        sl := TStringList.Create;
        try
           sl.CommaText := Extensiones;

           Filter := '';
           Separador := '';

           if (DefaultExt = '') and (sl.Count > 0) and (sl[0] <> 'ALL') then
              DefaultExt := '.' + LowerCase(sl[0]);

           for i := sl.Count - 1 downto 0 do
           begin
              if (sl[i] = 'ALL') then
                 Filter := _('Todos los archivos|*.*') + Separador + Filter
              else
              if (sl[i] = 'TXT') then
                 Filter := _('Archivos de texto|*.txt') + Separador + Filter
              else
              if (sl[i] = 'XLS') then
                 Filter := _('Documentos Excel|*.xls;*.xlsx') + Separador + Filter
              else
              if (sl[i] = 'ODS') then
                 Filter := _('LibreOffice Calc|*.ods') + Separador + Filter
              else
              if (sl[i] = 'CSV') then
                 Filter := _('Archivos Separados por comas|*.csv') + Separador + Filter
              else
              if (sl[i] = 'DOC') then
                 Filter := _('Documentos Word|*.doc;*.docx') + Separador + Filter
              else
              if (sl[i] = 'ODT') then
                 Filter := _('Documentos LibreOffice Write|*.odt') + Separador + Filter
              else
              if (sl[i] = 'PDF') then
                 Filter := _('Documentos Adobe PDF|*.pdf') + Separador + Filter
              else
              if (sl[i] = 'XML') then
                 Filter := _('Documentos XML|*.xml') + Separador + Filter
              else
              if (sl[i] = 'ZIP') then
                 Filter := _('Documentos comprimidos ZIP|*.zip') + Separador + Filter;

              Separador := '|';

              if (UpperCase(DefaultExt) = sl[i]) then
                 FilterIndex := i + 1;
           end;
        finally
           sl.Free;
        end;

        if (Ubicacion = '') then
           InitialDir := ExtractFilePath(mru)
        else
           InitialDir := Ubicacion;

        if (Archivo <> '') then
           FileName := Archivo;

        DMMain.Log('Ambito: ' + Ambito);
        DMMain.Log('Archivo: ' + Archivo);
        DMMain.Log('DefaultExt: ' + DefaultExt);
        DMMain.Log('InitialDir: ' + InitialDir);
        DMMain.Log('Filter: ' + Filter);
        DMMain.Log('FilterIndex: ' + IntToStr(FilterIndex));

        if Execute then
        begin
           DMMain.Log('Archivo: ' + FileName);
           Result := True;
           Archivo := FileName;
           EscribeDatoIni('MRU-OPEN', Ambito, Archivo);
        end;
     finally
        Free;
     end;
  end;
end;

function LimpiaNombreFichero(s: string; CaracterReemplazo: string = '_'): string;
begin
  /// Algunos caracteres especiales debe transformase ya que no son válidos para nombres de fichero
  /// *** Solo debería llegar el nombre del fichero ya que el separador de directorios se reemplazaría

  s := StringReplace(s, '/', CaracterReemplazo, [rfReplaceAll]);
  s := StringReplace(s, '\', CaracterReemplazo, [rfReplaceAll]);
  s := StringReplace(s, ':', CaracterReemplazo, [rfReplaceAll]);
  s := StringReplace(s, '*', CaracterReemplazo, [rfReplaceAll]);
  s := StringReplace(s, '?', CaracterReemplazo, [rfReplaceAll]);
  s := StringReplace(s, '"', CaracterReemplazo, [rfReplaceAll]);
  s := StringReplace(s, '<', CaracterReemplazo, [rfReplaceAll]);
  s := StringReplace(s, '>', CaracterReemplazo, [rfReplaceAll]);
  s := StringReplace(s, '|', CaracterReemplazo, [rfReplaceAll]);
  Result := s;
end;

function CryptBinaryToString(pbBinary: PByte; cbBinary: DWORD; dwFlags: DWORD; pszString: PChar; var pcchString: DWORD): BOOL; stdcall;
  external 'Crypt32.dll' Name 'CryptBinaryToStringA';

function CryptStringToBinary(pszString: PChar; cchString: DWORD; dwFlags: DWORD; pbBinary: PByte; var pcbBinary: DWORD; pdwSkip: PDWORD; pdwFlags: PDWORD): BOOL; stdcall;
  external 'Crypt32.dll' Name 'CryptStringToBinaryA';

//---------------------------------------------------------------------------
// Codifica un TStrean a cadena Encode64
function StreamToStrB64(Stream: TStream; var Str: string): boolean;
var
  Size : DWORD;
  MemoryStream : TMemoryStream;
  AString : PChar;
begin
  if (Stream is TMemoryStream) then
     MemoryStream := TMemoryStream(Stream)
  else
  begin
     MemoryStream := TMemoryStream.Create;
     MemoryStream.CopyFrom(Stream, Stream.Size);
  end;

  Result := CryptBinaryToString(TMemoryStream(MemoryStream).Memory, TMemoryStream(MemoryStream).Size, CRYPT_STRING_BASE64, nil, Size);
  if Result then
  begin
     GetMem(AString, Size);
     try
        Result := CryptBinaryToString(TMemoryStream(MemoryStream).Memory, TMemoryStream(MemoryStream).Size, CRYPT_STRING_BASE64, AString, Size);
        str := string(AString);
     finally
        FreeMem(AString);
     end;
  end;

  if not (Stream is TMemoryStream) then
     MemoryStream.Free;
end;

//---------------------------------------------------------------------------
// Decodifica una cadena Encode64 a su binario original en un TMemoryStream
function StrB64ToStream(var Str: string; MStream: TMemoryStream): boolean;
var
  Size : DWORD;
begin
  Result := CryptStringToBinary(@Str[1], Length(Str), CRYPT_STRING_BASE64, nil, Size, nil, nil);
  if Result then
  begin
     MStream.SetSize(Size);
     Result := CryptStringToBinary(@Str[1], Length(Str), CRYPT_STRING_BASE64, MStream.Memory, Size, nil, nil);
  end;
end;

function EncodeBase64(Input: Pointer; Size: integer): string;
const
  Base64Chars: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
var
  i : integer;
  Output : TStringStream;
  Bytes : array[0..2] of byte;
  Encoded : array[0..3] of char;
begin
  Output := TStringStream.Create('');
  try
     for i := 0 to (Size div 3) - 1 do
     begin
        Move(PByteArray(Input)^[i * 3], Bytes, 3);
        Encoded[0] := Base64Chars[(Bytes[0] shr 2) + 1];
        Encoded[1] := Base64Chars[((Bytes[0] and $03) shl 4) or (Bytes[1] shr 4) + 1];
        Encoded[2] := Base64Chars[((Bytes[1] and $0F) shl 2) or (Bytes[2] shr 6) + 1];
        Encoded[3] := Base64Chars[(Bytes[2] and $3F) + 1];
        Output.WriteString(string(Encoded));
     end;

     // Procesar los bytes restantes
     if (Size mod 3) > 0 then
     begin
        FillChar(Bytes, SizeOf(Bytes), 0);
        Move(PByteArray(Input)^[Size - (Size mod 3)], Bytes, Size mod 3);
        Encoded[0] := Base64Chars[(Bytes[0] shr 2) + 1];
        Encoded[1] := Base64Chars[((Bytes[0] and $03) shl 4) or (Bytes[1] shr 4) + 1];
        if (Size mod 3) = 1 then
           Encoded[2] := '='
        else
           Encoded[2] := Base64Chars[((Bytes[1] and $0F) shl 2) or (Bytes[2] shr 6) + 1];
        Encoded[3] := '=';
        Output.WriteString(string(Encoded));
     end;

     Result := Output.DataString;
  finally
     Output.Free;
  end;
end;

function FormatoEmailValido(s: string): boolean;
var
  i : integer;
begin
  /// El formato debe ser LN[n] @[1] LN[n] .[1] LN[n]
  /// {AZ, az, 09, -} @ {AZ, az, 09, -} . {AZ, az, 09, -}

  Result := False;

  s := Trim(s);
  if (s <> '') then
  begin
     // Recorro cadena hasta que encuentro una letra
     i := 1;
     while ((i < Length(s)) and (not (s[i] in ['A'..'Z', 'a'..'z', '0'..'9', '-']))) do
        Inc(i);
     Result := (i <= Length(s));

     if (Result) then
     begin
        // Recorro cadena hasta que encuentro arroba
        while Result and (i < Length(s)) and ((s[i] <> '@')) do
           Inc(i);
        Result := (s[i] = '@');
     end;

     if (Result) then
     begin
        // Salto a siguiente caracter después de arroba
        Inc(i);

        // Recorro cadena hasta que encuentro una letra
        while Result and (i < Length(s)) and (not (s[i] in ['A'..'Z', 'a'..'z', '0'..'9', '-'])) do
           Inc(i);
        Result := (s[i] in ['A'..'Z', 'a'..'z', '0'..'9', '-']);
     end;

     if (Result) then
     begin
        // Recorro cadena hasta que encuentro punto
        while Result and (i < Length(s)) and ((s[i] in ['A'..'Z', 'a'..'z', '0'..'9', '-'])) do
           Inc(i);
        Result := (s[i] = '.');
     end;

     if (Result) then
     begin
        // Salto a siguiente caracter después de arroba
        Inc(i);

        // Recorro cadena hasta que encuentro una letra
        while Result and (i < Length(s)) and (not (s[i] in ['A'..'Z', 'a'..'z', '0'..'9', '-'])) do
           Inc(i);
        Result := (s[i] in ['A'..'Z', 'a'..'z', '0'..'9', '-']);
     end;
  end;
end;

function CryptUIDlgSelectCertificateFromStoreCert(Handle: HWND; cTitle: WideString; cDescr: WideString): string;
var
  MyhCertStore : HCERTSTORE;
  pCertContext : PCCERT_CONTEXT;
  pszNameString : array[0..255] of char;
  StoreName : array[0..255] of char;
begin
  // --------------------------------------------------------------------
  // Open a certificate store.
  StoreName := 'MY';
  MyhCertStore := CertOpenSystemStore(0, StoreName);
  if (Assigned(MyhCertStore)) then
  begin
     // --------------------------------------------------------------------
     //  Display a list of the certificates in the store and
     //  allow the user to select a certificate.
     pCertContext := CryptUIDlgSelectCertificateFromStore(MyhCertStore, Handle, PWideChar(cTitle), PWideChar(cDescr), CRYPTUI_SELECT_LOCATION_COLUMN, 0, nil);
     if (not Assigned(pCertContext)) then
     begin
        Result := '';
     end
     else
     begin
        // Ver si hay que comparar con 0
        pszNameString := '';
        if (CertGetNameString(pCertContext, CERT_NAME_SIMPLE_DISPLAY_TYPE, 0, nil, pszNameString, 256) > 0) then
        begin
           Result := pszNameString;
        end
        else
        begin
           Result := '';
        end;
     end;

     if (Assigned(pCertContext)) then
     begin
        CertFreeCertificateContext(pCertContext);
     end;

     if (Assigned(MyhCertStore)) then
     begin
        CertCloseStore(MyhCertStore, 0);
     end;
  end
  else
     Result := '';
end;

(*
procedure CompressStream(inpStream, outStream: TStream);
var
  InpBuf, OutBuf : Pointer;
var
  InpBytes, OutBytes : integer;
begin
  InpBuf := nil;
  OutBuf := nil;
  try
     GetMem(InpBuf, inpStream.Size);
     inpStream.Position := 0;
     InpBytes := inpStream.Read(InpBuf^, inpStream.Size);

     CompressBuf(InpBuf, InpBytes, OutBuf, OutBytes);

     outStream.Write(OutBuf^, OutBytes);
  finally
     if InpBuf <> nil then
        FreeMem(InpBuf);
     if OutBuf <> nil then
        FreeMem(OutBuf);
  end;
end;

procedure ExpandStream(inpStream, outStream: TStream);
var
  InpBuf, OutBuf : Pointer;
var
  OutBytes, sz : integer;
begin
  InpBuf := nil;
  OutBuf := nil;
  sz := inpStream.Size - inpStream.Position;
  if sz > 0 then
     try
        GetMem(InpBuf, sz);
        inpStream.Read(InpBuf^, sz);
        DecompressBuf(InpBuf, sz, 0, OutBuf, OutBytes);
        outStream.Write(OutBuf^, OutBytes);
     finally
        if InpBuf <> nil then
           FreeMem(InpBuf);
        if OutBuf <> nil then
           FreeMem(OutBuf);
     end;
  outStream.Position := 0;
end;
*)

function win_regRead(Mykey, MyField: string; MostrarMensajeError: boolean = True): string;
begin
  Result := '';
  // Create the Object
  with TRegistry.Create(KEY_READ) do
  begin
     try
        // ReadOnly
        Access := KEY_READ;

        // Sets the destination for our requests
        RootKey := HKEY_LOCAL_MACHINE;

        // Check if whe can open our key
        if OpenKeyReadOnly(MyKey) then
        begin
           // Is our field availbe
           if ValueExists(MyField) then
              // Read the value from the field
              Result := ReadString(MyField)
           else
           if MostrarMensajeError then
              ShowMessage(format(_('La clave %s no existe en %s'), [MyField, MyKey]));
        end
        else
        // There is a big error if we get an errormessage by
        // opening the key
        if MostrarMensajeError then
           ShowMessage(format(_('Error abriendo : %s'), [MyKey]));
        CloseKey;
     finally
        Free;
     end;
  end;
end;

function GetNativeSystemInfo(var SystemInfo: TSystemInfo): boolean;
type
  TGetNativeSystemInfo = procedure(var SystemInfo: TSystemInfo) stdcall;
var
  LibraryHandle : HMODULE;
  _GetNativeSystemInfo : TGetNativeSystemInfo;
begin
  Result := False;
  LibraryHandle := GetModuleHandle(kernel32);

  if LibraryHandle <> 0 then
  begin
     _GetNativeSystemInfo := GetProcAddress(
        LibraryHandle, 'GetNativeSystemInfo');
     if Assigned(_GetNativeSystemInfo) then
     begin
        _GetNativeSystemInfo(SystemInfo);
        Result := True;
     end
     else
        GetSystemInfo(SystemInfo);
  end
  else
     GetSystemInfo(SystemInfo);
end;

function IsWindows64: boolean;
var
  ASystemInfo : TSystemInfo;
begin
  GetNativeSystemInfo(ASystemInfo);
  Result := ASystemInfo.wProcessorArchitecture in
     [PROCESSOR_ARCHITECTURE_IA64, PROCESSOR_ARCHITECTURE_AMD64];
end;

procedure EliminaDatoIni(const Section, Ident: string);
begin
  with TIniFile.Create(REntorno.FicheroINI) do
  begin
     try
        DeleteKey(Section, Ident);
     finally
        Free;
     end;
  end;
end;

procedure GetBuildInfo(Fichero: string; var Major, Minor, Release, Build: word);
var
  VerInfoSize, VerValueSize, Dummy : cardinal;
  VerInfo : Pointer;
  VerValue : PVSFixedFileInfo;
begin
  Major := 0;
  Minor := 0;
  Release := 0;
  Build := 0;

  VerInfoSize := GetFileVersionInfoSize(PChar(Fichero), Dummy);
  if VerInfoSize > 0 then
  begin
     GetMem(VerInfo, VerInfoSize);
     try
        if GetFileVersionInfo(PChar(Fichero), 0, VerInfoSize, VerInfo) then
        begin
           VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
           with VerValue^ do
           begin
              Major := dwFileVersionMS shr 16;
              Minor := dwFileVersionMS and $FFFF;
              Release := dwFileVersionLS shr 16;
              Build := dwFileVersionLS and $FFFF;
           end;
        end;
     finally
        FreeMem(VerInfo, VerInfoSize);
     end;
  end;
end;

procedure AsignaDisplayFormat(DataSet: TDataSet; FloatDisplayFormat, IntDisplayFormat, DateDisplayFormat: string);
var
  i : integer;
begin
  for i := 0 to DataSet.FieldCount - 1 do
  begin
     if (DataSet.Fields[i] is TFloatField) then
        TFloatField(DataSet.Fields[i]).DisplayFormat := FloatDisplayFormat;
     {
      Evito dar formato de números enteros para evitar errores de edición con el punto separador de miles.
      
     if (DataSet.Fields[i] is TIntegerField) then
        TFloatField(DataSet.Fields[i]).DisplayFormat := IntDisplayFormat;
     }
     if (DataSet.Fields[i] is TDateTimeField) then
        TFloatField(DataSet.Fields[i]).DisplayFormat := DateDisplayFormat;
  end;
end;

procedure CalculaTotales(Grid: TDBGrid; var Totales: array of double; CamposExepcion: string = '');
var
  i : integer;
  f : TField;
  CamposNoCalcular : TStrings;
begin
  // Calculo Totales
  CamposNoCalcular := TStringList.Create;
  try
     try
        CamposNoCalcular.CommaText := CamposExepcion;

        for i := 0 to Grid.Columns.Count - 1 do
        begin
           // Inicializo Total
           Totales[i] := 0;

           if (CamposNoCalcular.IndexOf(Grid.Columns[i].FieldName) = -1) then
           begin
              // Acumulo valor si es int o float
              f := Grid.DataSource.DataSet.FieldByName(Grid.Columns[i].FieldName);
              if Grid.DataSource.DataSet.FieldByName(Grid.Columns[i].FieldName) is TFloatField then
              begin
                 Grid.DataSource.DataSet.DisableControls;
                 try
                    Grid.DataSource.DataSet.First;
                    while not Grid.DataSource.DataSet.EOF do
                    begin
                       Totales[i] := Totales[i] + TFloatField(f).AsFloat;

                       Grid.DataSource.DataSet.Next;
                    end;
                    Grid.DataSource.DataSet.First;
                 finally
                    Grid.DataSource.DataSet.EnableControls;
                 end;
              end
              else
              if Grid.DataSource.DataSet.FieldByName(Grid.Columns[i].FieldName) is TIntegerField then
              begin
                 Grid.DataSource.DataSet.DisableControls;
                 try
                    Grid.DataSource.DataSet.First;
                    while not Grid.DataSource.DataSet.EOF do
                    begin
                       Totales[i] := Totales[i] + TIntegerField(f).AsInteger;

                       Grid.DataSource.DataSet.Next;
                    end;
                    Grid.DataSource.DataSet.First;
                 finally
                    Grid.DataSource.DataSet.EnableControls;
                 end;
              end;
           end;
        end;
     except
        on E: Exception do
           ShowMessage('Totales' + #13#10 + E.Message);
     end;
  finally
     CamposNoCalcular.Free;
  end;
end;

procedure PintaTotales(PNLTotales: TPanel; Grid: TDBGrid; Totales: array of double; CamposExepcion: string = '');
var
  i, p : integer;
  l : integer;
  e : TLFREdit;
  CamposNoPresentar : TStrings;
begin
  CamposNoPresentar := TStringList.Create;
  try
     try
        CamposNoPresentar.CommaText := CamposExepcion;

        for i := PNLTotales.ComponentCount - 1 downto 0 do
           PNLTotales.Components[i].Free;

        l := 9;
        p := TStringGrid(Grid).LeftCol;
        for i := 0 to Grid.Columns.Count - 1 do
        begin
           if (i >= p - 1) then
           begin
              if (Grid.Columns[i].FieldName > '') and (CamposNoPresentar.IndexOf(Grid.Columns[i].FieldName) = -1) then
              begin
                 if Grid.DataSource.DataSet.FieldByName(Grid.Columns[i].FieldName) is TFloatField then
                 begin
                    e := TLFREdit.Create(PNLTotales);
                    e.Parent := PNLTotales;
                    e.Alignment := taRightJustify;
                    if (Length(Totales) > i) then
                       e.Text := FormatFloat(TFloatField(Grid.Columns[i].Field).DisplayFormat, Totales[i])
                    else
                       e.Text := '-';
                    e.Left := l;
                    e.Width := Grid.Columns[i].Width;
                 end
                 else
                 if Grid.DataSource.DataSet.FieldByName(Grid.Columns[i].FieldName) is TIntegerField then
                 begin
                    e := TLFREdit.Create(PNLTotales);
                    e.Parent := PNLTotales;
                    e.Alignment := taRightJustify;
                    if (Length(Totales) > i) then
                       e.Text := FormatFloat(TIntegerField(Grid.Columns[i].Field).DisplayFormat, Totales[i])
                    else
                       e.Text := '-';
                    e.Left := l;
                    e.Width := Grid.Columns[i].Width;
                 end;
              end;

              l := l + Grid.Columns[i].Width + 1;
           end;
        end;
     except
        on E: Exception do
           ShowMessage('Presentar Totales' + #13#10 + E.Message);
     end;
  finally
     CamposNoPresentar.Free;
  end;
end;

function PrettyJSON(const S: string): string;
var
  I, Indent : integer;
  C : char;
  InString : boolean;
begin
  Result := '';
  Indent := 0;
  InString := False;

  for I := 1 to Length(S) do
  begin
     C := S[I];

     case C of
        '"':
        begin
           Result := Result + C;
           if (I = 1) or (S[I - 1] <> '\') then
              InString := not InString;
        end;

        '{', '[':
        begin
           Result := Result + C;
           if not InString then
           begin
              Inc(Indent);
              Result := Result + #13#10 + StringOfChar(' ', Indent * 2);
           end;
        end;

        '}', ']':
        begin
           if not InString then
           begin
              Dec(Indent);
              Result := Result + #13#10 + StringOfChar(' ', Indent * 2) + C;
           end
           else
              Result := Result + C;
        end;

        ',':
        begin
           Result := Result + C;
           if not InString then
              Result := Result + #13#10 + StringOfChar(' ', Indent * 2);
        end;

        ':':
        begin
           Result := Result + C;
           if not InString then
              Result := Result + ' ';
        end;

        else
           Result := Result + C;
     end;
  end;
end;

function DameNombreFichero(Tipo: string; Ejercicio: integer; Serie: string; Numero: integer; NombreCliProAcr: string; NombreAgente: string; Extension: string): string;
var
  FormatStr : string;
  DocName : string;
  TituloCli : string;
begin
  // 1. Obtener el formato del parámetro DOCFORM001 (o el valor por defecto si está vacío)
  FormatStr := LeeParametro('DOCFORM001', '[Documento]_[Ejercicio]-[Serie]-[Numero]');
  if Trim(FormatStr) = '' then
     FormatStr := '[Documento]_[Ejercicio]-[Serie]-[Numero]';

  // 2. Reemplazar [Documento] traduciendo las siglas a su nombre completo
  DocName := '';
  if Tipo = 'FAC' then
     DocName := _('Factura')
  else if Tipo = 'ALB' then
     DocName := _('Albaran')
  else if Tipo = 'PEC' then
     DocName := _('Pedido')
  else if Tipo = 'OFC' then
     DocName := _('Oferta')
  else if Tipo = 'PRF' then
     DocName := _('Proforma')
  else if Tipo = 'TIC' then
     DocName := _('Ticket')
  else
     DocName := Tipo; // Por si se pasa un tipo no predefinido

  // 3. Limpiar y procesar los nombres variables para evitar caracteres problemáticos en el sistema de archivos
  TituloCli := LimpiaCadenaBasica(NombreCliProAcr);
  TituloCli := StringReplace(TituloCli, ' ', '_', [rfReplaceAll]);

  // 4. Reemplazar marcadores estándar en el formato
  FormatStr := StringReplace(FormatStr, '[Documento]', DocName, [rfReplaceAll, rfIgnoreCase]);
  FormatStr := StringReplace(FormatStr, '[Ejercicio]', IntToStr(Ejercicio), [rfReplaceAll, rfIgnoreCase]);
  FormatStr := StringReplace(FormatStr, '[Serie]', Serie, [rfReplaceAll, rfIgnoreCase]);
  FormatStr := StringReplace(FormatStr, '[Numero]', IntToStr(Numero), [rfReplaceAll, rfIgnoreCase]);
  FormatStr := StringReplace(FormatStr, '[NombreCliProAcr]', TituloCli, [rfReplaceAll, rfIgnoreCase]);
  FormatStr := StringReplace(FormatStr, '[NombreAgente]', LimpiaCadenaBasica(NombreAgente), [rfReplaceAll, rfIgnoreCase]);

  // 5. Gestión inteligente de la extensión (con o sin corchetes en el formato)
  if (Pos('[Extension]', FormatStr) > 0) then
     FormatStr := StringReplace(FormatStr, '[Extension]', Extension, [rfReplaceAll, rfIgnoreCase])
  else if (Pos('[Extensión]', FormatStr) > 0) then
     FormatStr := StringReplace(FormatStr, '[Extensión]', Extension, [rfReplaceAll, rfIgnoreCase])
  else
  begin
     // Si la extensión no está explícitamente en el formato, se añade de forma segura al final
     if (Extension <> '') then
     begin
        if (Extension[1] <> '.') then
           FormatStr := FormatStr + '.' + Extension
        else
           FormatStr := FormatStr + Extension;
     end;
  end;

  // 6. Limpieza final de caracteres no permitidos en nombres de fichero
  Result := LimpiaNombreFichero(FormatStr);
end;

end.
