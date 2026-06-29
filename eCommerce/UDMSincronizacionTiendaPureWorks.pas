unit UDMSincronizacionTiendaPureWorks;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, HYFIBQuery, UUtiles, StrUtils, DateUtils,
  DB, FIBDataSet, FIBDatabase, FIBTableDataSet, UFIBModificados;

type
  TDMSincronizacionTiendaPureWorks = class(TDataModule)
     TUpdate: THYTransaction;
     TLocal: THYTransaction;
     xImportacionArticulos: TFIBTableSet;
     DSxImportacionArticulos: TDataSource;
     xImportacionArticulosID_ARTICULO: TIntegerField;
     xImportacionArticulosENTRADA: TIntegerField;
     xImportacionArticulosEMPRESA: TIntegerField;
     xImportacionArticulosARTICULO: TFIBStringField;
     xImportacionArticulosREF_PROVEEDOR: TFIBStringField;
     xImportacionArticulosTITULO: TFIBStringField;
     xImportacionArticulosPVENTA1: TFloatField;
     xImportacionArticulosPVENTA2: TFloatField;
     xImportacionArticulosP_VENTA_RECOMENDADO: TFloatField;
     xImportacionArticulosPCOMPRA1: TFloatField;
     xImportacionArticulosPCOMPRA2: TFloatField;
     xImportacionArticulosPCOSTE1: TFloatField;
     xImportacionArticulosPCOSTE2: TFloatField;
     xImportacionArticulosALFA_1: TFIBStringField;
     xImportacionArticulosALFA_2: TFIBStringField;
     xImportacionArticulosNOTAS: TBlobField;
     xImportacionArticulosTRASPASADO: TIntegerField;
     xImportacionArticulosID_ART_ARTICULOS: TIntegerField;
     xImportacionArticulosTITULO_PROVEEDOR: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure xImportacionArticulosNewRecord(DataSet: TDataSet);
     procedure xImportacionArticulosARTICULOChange(Sender: TField);
     procedure xImportacionArticulosTRASPASADOChange(Sender: TField);
  private
     { Private declarations }
     ArchivoLog: string;
     FTP_Host: string;
     FTP_Port: integer;
     FTP_User: string;
     FTP_Password: string;
     FTP_CarpetaImportacion: string;
     FTP_CarpetaExportacion: string;
     CarpetaImportacion: string;
     CarpetaExportacion: string;
     {
     Pagina: string;
     UltimoClienteDireccion: integer;
     UltimoProveedorDireccion: integer;
     }
     FModoIVACanal: integer;
     // Log: TStrings;
     LineasLog: TStrings;
     SincronizarcionAutomatica: boolean;
     UltimaSincronizacion: TDateTime;
     ProveedorSincronizacion: integer;
     // empresa: integer;
     // canal: integer;
     // serie: string;
     {
     function DameModoIva: integer;
     function DameCliente(Empresa, IdCliente: integer): integer;
     function DameProveedor(Empresa, IdProveedor: integer): integer;
     function DameFabricante(Empresa, IdFabricante: integer): integer;
     function DameIdClientePrestaShop(IdConfiguracion, IdCustomer: integer): integer;
     function DameIdProveedorPrestaShop(IdConfiguracion, IdSupplier: integer): integer;
     function DameIdFabricantePrestaShop(IdConfiguracion, IdManufacturer: integer): integer;
     function DameDireccionPrestaShop(IdConfiguracion, IdAddress, Tercero: integer): integer;
     }
     procedure Log(Archivo, s: string);
     function DameArticuloSegunProveedor(Proveedor: integer; CodigoProveedor: string): string;
     function HayArticulosSinSincronizar: boolean;
     // function MySQLDateTimeToDateTime(s: string): TDateTime;
     // procedure CreaStockInicial;
  public
     { Public declarations }
     procedure InicializaFTP;
     procedure TraerDatosFTP(Directorio: string);
     procedure EnviarDatosFTP(Directorio: string);
     procedure Sincronizar(aSincronizarcionAutomatica: boolean = False; aLineasLog: TStrings = nil);
     procedure ImportarArticulos(Directorio: string);
     procedure ImportarPedidos(Directorio: string);
     procedure ExportarStocks(Directorio: string);
     procedure ExportarFamilias(Directorio: string);
     procedure RefrescarArticulos;
     procedure CrearModificarArticulos;
     procedure RelacionaArticulo(Articulo, CodigoProveedor, TituloProveedor: string);
  end;

var
  DMSincronizacionTiendaPureWorks : TDMSincronizacionTiendaPureWorks;

implementation

uses UDMMain, UFMain, UEntorno, UDameDato, UFormGest, UFSendCorreo, IdFTP, IdFTPCommon, (*IdBaseComponent, IdComponent,*)
  UDMSincronizacion, Dialogs, Math, XMLDoc, XMLIntf, UDMPrestashop, UFMSincronizacionTiendArticuloNuevo, IdGlobalProtocols,
  UFMAlbaranes;

{$R *.dfm}

const
  cDeltaSize = 1.5;

type
  TBMJumpTable = array[0..255] of integer;
  TFastPosProc = function(const aSource, aFind: Pointer; const aSourceLen, aFindLen: integer; var JumpTable: TBMJumpTable): Pointer;

// var
// GUpcaseTable : array[0..255] of char;
// GUpcaseLUT : Pointer;

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
     Result := Nodo.Text;
end;

function StrToDateTimePureWorks(const s: string): TDateTime;
var
  AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond : word;
begin
  /// "yyyy-mm-dd hh:nn:ss" --> TDateTime
  AYear := StrToIntDef(Copy(s, 1, 4), 0);
  AMonth := StrToIntDef(Copy(s, 6, 2), 0);
  ADay := StrToIntDef(Copy(s, 9, 2), 0);
  AHour := StrToIntDef(Copy(s, 12, 2), 0);
  AMinute := StrToIntDef(Copy(s, 15, 2), 0);
  ASecond := StrToIntDef(Copy(s, 18, 2), 0);
  AMilliSecond := 0;

  Result := EncodeDateTime(AYear, AMonth, ADay, AHour, AMinute, ASecond, AMilliSecond);
end;

procedure TDMSincronizacionTiendaPureWorks.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  AbreData(TDMPrestashop, DMPrestashop);

  LineasLog := nil;
  FModoIVACanal := -1;
  SincronizarcionAutomatica := False;
  ProveedorSincronizacion := 0;

  xImportacionArticulosPVENTA1.DisplayFormat := MascaraN;
  xImportacionArticulosPVENTA2.DisplayFormat := MascaraN;
  xImportacionArticulosP_VENTA_RECOMENDADO.DisplayFormat := MascaraN;
  xImportacionArticulosPCOMPRA1.DisplayFormat := MascaraN;
  xImportacionArticulosPCOMPRA2.DisplayFormat := MascaraN;
  xImportacionArticulosPCOSTE1.DisplayFormat := MascaraN;
  xImportacionArticulosPCOSTE2.DisplayFormat := MascaraN;

  xImportacionArticulos.Close;
  xImportacionArticulos.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  xImportacionArticulos.Open;
end;

procedure TDMSincronizacionTiendaPureWorks.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMPrestashop);
end;

{
function TDMSincronizacionTiendaPureWorks.DameIdClientePrestaShop(IdConfiguracion, IdCustomer: integer): integer;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_CLIENTE ');
        SQL.Add(' FROM SYS_CONF_PRESTASHOP_CLIENTE ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
        SQL.Add(' ID_CUSTOMER = :ID_CUSTOMER ');
        Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
        Params.ByName['ID_CUSTOMER'].AsInteger := IdCustomer;
        ExecQuery;
        Result := FieldByName['ID_CLIENTE'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;
}
{
function TDMSincronizacionTiendaPureWorks.DameIdProveedorPrestaShop(IdConfiguracion, IdSupplier: integer): integer;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_PROVEEDOR ');
        SQL.Add(' FROM SYS_CONF_PRESTASHOP_PROVEEDOR ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
        SQL.Add(' ID_SUPPLIER = :ID_SUPPLIER ');
        Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
        Params.ByName['ID_SUPPLIER'].AsInteger := IdSupplier;
        ExecQuery;
        Result := FieldByName['ID_PROVEEDOR'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;
}
{
function TDMSincronizacionTiendaPureWorks.DameIdFabricantePrestaShop(IdConfiguracion, IdManufacturer: integer): integer;
var
  Q : THYFIBQuery;
begin
  /// Por ahora el fabricante y el tercero es lo mismo.
  /// Se utiliza en la ficha del articulo.

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_FABRICANTE ');
        SQL.Add(' FROM SYS_CONF_PRESTASHOP_FABRICANTE ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
        SQL.Add(' ID_MANUFACTURER = :ID_MANUFACTURER ');
        Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
        Params.ByName['ID_MANUFACTURER'].AsInteger := IdManufacturer;
        ExecQuery;
        Result := FieldByName['ID_FABRICANTE'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;
}
{
function TDMSincronizacionTiendaPureWorks.DameDireccionPrestaShop(IdConfiguracion, IdAddress, Tercero: integer): integer;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT DIRECCION ');
        SQL.Add(' FROM SYS_CONF_PRESTASHOP_CLIENTE_DIR P ');
        SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ');
        SQL.Add(' ON D.TERCERO = P.TERCERO AND D.DIRECCION = P.DIRECCION ');
        SQL.Add(' WHERE ');
        SQL.Add(' P.ID_CONFIGURACION = :ID_CONFIGURACION AND ');
        SQL.Add(' P.ID_ADDRESS = :ID_ADDRESS AND ');
        SQL.Add(' P.TERCERO = :TERCERO ');
        Params.ByName['ID_CONFIGURACION'].AsInteger := IdConfiguracion;
        Params.ByName['ID_ADDRESS'].AsInteger := IdAddress;
        Params.ByName['TERCERO'].AsInteger := Tercero;
        ExecQuery;
        Result := FieldByName['DIRECCION'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;
}
{
function TDMSincronizacionTiendaPureWorks.DameCliente(Empresa, IdCliente: integer): integer;
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
        DataBase := DMMain.DataBase;
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
}
{
function TDMSincronizacionTiendaPureWorks.DameProveedor(Empresa, IdProveedor: integer): integer;
var
  Q : THYFIBQuery;
begin
  /// Devuelve el proveedor de un IdProveedor.
  /// Se requiere la empresa porqe puede que no sea de la que se quiera

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT PROVEEDOR ');
        SQL.Add(' FROM EMP_PROVEEDORES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' ID_PROVEEDOR = :ID_PROVEEDOR ');
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['ID_PROVEEDOR'].AsInteger := IdProveedor;
        ExecQuery;
        Result := FieldByName['PROVEEDOR'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;
}
{
function TDMSincronizacionTiendaPureWorks.DameFabricante(Empresa, IdFabricante: integer): integer;
begin
  /// El fabricante y el tercero en este momento es lo mismo

  Result := IdFabricante;
end;
}
{
function TDMSincronizacionTiendaPureWorks.DameModoIva: integer;
var
  Q : THYFIBQuery;
begin
  // Consulta para obtener el modo de iva del canal
  if (FModoIVACanal = -1) then
  begin
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MODO_IVA FROM EMP_CANALES WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           ExecQuery;
           FModoIVACanal := FieldByName['MODO_IVA'].AsInteger;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;
  Result := FModoIVACanal;
end;
}
procedure TDMSincronizacionTiendaPureWorks.Sincronizar(aSincronizarcionAutomatica: boolean = False; aLineasLog: TStrings = nil);
var
  FechaServidor : TDateTime;
begin
  SincronizarcionAutomatica := aSincronizarcionAutomatica;
  FechaServidor := DMMain.DameFechaServidor;
  UltimaSincronizacion := LeeDatoIni('SincronizacionTiendaPureWorks', 'UltimaSincronizacion', EncodeDate(1900, 1, 1));
  LineasLog := aLineasLog;

  // Antes de crear ArchivoLog, para obtener CarpetaImportacion
  InicializaFTP;

  ArchivoLog := Format(CarpetaImportacion + 'Sincronizacion-%s', [FormatDateTime('yyyymmdd', Today)]);
  Log(ArchivoLog, 'Inicializado FTP');

  Log(ArchivoLog, 'Inicio Sincronizacion');
  Log(ArchivoLog, 'Fecha Ultima Sincronizacion: ' + DateTimeToStr(UltimaSincronizacion));
  Log(ArchivoLog, 'Fecha Sincronizacion       : ' + DateTimeToStr(FechaServidor));
  Log(ArchivoLog, 'SincronizarcionAutomatica  : ' + IntToStr(BoolToInt(SincronizarcionAutomatica)));

  try
     TraerDatosFTP(CarpetaImportacion);
  except
     on E: Exception do
     begin
        if (SincronizarcionAutomatica) then
           Log(ArchivoLog, _('Error recibiendo ficheros.') + #13#10 + E.Message)
        else
           ShowMessage(_('Error recibiendo ficheros.') + #13#10 + E.Message);
     end;
  end;

  // Crea tabla temportal con los datos de los productos
  ImportarArticulos(CarpetaImportacion);

  // Marca los articulos que ya estén en la aplicacion.
  RefrescarArticulos;

  // Crea/modifica articulos segun los productos importados y marcados para traspasar
  if (SincronizarcionAutomatica) then
     CrearModificarArticulos;

  // Si no quedan productos por sincronizar, importo pedidos.
  if (HayArticulosSinSincronizar) then
     Log(ArchivoLog, 'Hay articulos pendientes de sincronizar. No se sincronizan pedidos.')
  else
     ImportarPedidos(CarpetaImportacion);

  // Generar Stock_yyyymmdd-hhnnss.xml
  ExportarStocks(CarpetaExportacion);

  // Generar Familia_yyyymmdd-hhnnss.xml
  ExportarFamilias(CarpetaExportacion);

  try
     EnviarDatosFTP(CarpetaExportacion);
  except
     on E: Exception do
     begin
        if (SincronizarcionAutomatica) then
           if (SincronizarcionAutomatica) then
              Log(ArchivoLog, _('Error enviando stock.') + #13#10 + E.Message)
           else
              ShowMessage(_('Error enviando stock.') + #13#10 + E.Message);
     end;
  end;

  EscribeDatoIni('SincronizacionTiendaPureWorks', 'UltimaSincronizacion', FechaServidor);

  Log(ArchivoLog, 'Final Sincronizacion');
  ShowMessage(_('Sincronizacion Finalizada.'));

  xImportacionArticulos.Close;
  xImportacionArticulos.Open;
end;

procedure TDMSincronizacionTiendaPureWorks.InicializaFTP;
begin
  /// Se obtienen parametros y carpetas de trabajo

  DMMain.Log('Obtengo datos de usuario y clave para FTP');
  FTP_Host := LeeDatoIni('SincronizacionTiendaPureWorks', 'Host', '');
  if (FTP_Host = '') then
     EscribeDatoIni('SincronizacionTiendaPureWorks', 'Host', 'pureworks.eu');
  FTP_Port := LeeDatoIni('SincronizacionTiendaPureWorks', 'Port', 0);
  if (FTP_Port = 0) then
     EscribeDatoIni('SincronizacionTiendaPureWorks', 'Port', 21);
  FTP_User := LeeDatoIni('SincronizacionTiendaPureWorks', 'User', '');
  if (FTP_User = '') then
     EscribeDatoIni('SincronizacionTiendaPureWorks', 'User', 'exportimport');

  FTP_Password := LeeDatoIni('SincronizacionTiendaPureWorks', 'Password', '-'); // ;;8U}{^Z*-T-4ep7
  // Si no existe identificador, creo uno vacio
  if (FTP_Password = '-') then
     EscribeDatoIni('SincronizacionTiendaPureWorks', 'Password', '')
  else
  // Si existe lo encripto
  // La divido en dos mitades para poder guardar claves de mas de 12 digitos
  if (FTP_Password <> '') then
  begin
     // Si esta la clave, la encripto y la borro
     EscribeDatoIni('SincronizacionTiendaPureWorks', 'PasswordEnc1', CodificaClave(Copy(FTP_Password, 1, 12)));
     EscribeDatoIni('SincronizacionTiendaPureWorks', 'PasswordEnc2', CodificaClave(Copy(FTP_Password, 13, 24)));
     EscribeDatoIni('SincronizacionTiendaPureWorks', 'Password', '');
  end;
  FTP_Password := DescodificaClave(LeeDatoIni('SincronizacionTiendaPureWorks', 'PasswordEnc2', ''));
  if (FTP_Password = 'masterkey') then
     FTP_Password := '';
  FTP_Password := DescodificaClave(LeeDatoIni('SincronizacionTiendaPureWorks', 'PasswordEnc1', '')) + FTP_Password;

  FTP_CarpetaImportacion := LeeDatoIni('SincronizacionTiendaPureWorks', 'FTP_CarpetaImportacion', '/shop2erp/');
  if (FTP_CarpetaImportacion = '') then
     EscribeDatoIni('SincronizacionTiendaPureWorks', 'FTP_CarpetaImportacion', '');

  FTP_CarpetaExportacion := LeeDatoIni('SincronizacionTiendaPureWorks', 'FTP_CarpetaExportacion', '/erp2shop/');
  if (FTP_CarpetaExportacion = '') then
     EscribeDatoIni('SincronizacionTiendaPureWorks', 'FTP_CarpetaExportacion', '');

  CarpetaImportacion := LeeDatoIni('SincronizacionTiendaPureWorks', 'CarpetaImportacion', '');
  if (CarpetaImportacion = '') then
     EscribeDatoIni('SincronizacionTiendaPureWorks', 'CarpetaImportacion', '')
  else
     EscribeDatoIni('SincronizacionTiendaPureWorks', 'CarpetaImportacion', IncludeTrailingPathDelimiter(CarpetaImportacion));

  CarpetaExportacion := LeeDatoIni('SincronizacionTiendaPureWorks', 'CarpetaExportacion', '');
  if (CarpetaExportacion = '') then
     EscribeDatoIni('SincronizacionTiendaPureWorks', 'CarpetaExportacion', '')
  else
     EscribeDatoIni('SincronizacionTiendaPureWorks', 'CarpetaExportacion', IncludeTrailingPathDelimiter(CarpetaExportacion));

  ProveedorSincronizacion := LeeDatoIni('SincronizacionTiendaPureWorks', 'ProveedorSincronizacion', 0);
  if (ProveedorSincronizacion = 0) then
     EscribeDatoIni('SincronizacionTiendaPureWorks', 'ProveedorSincronizacion', ProveedorSincronizacion);
end;

procedure TDMSincronizacionTiendaPureWorks.TraerDatosFTP(Directorio: string);
var
  s : TStrings;
  i : integer;
begin
  /// Conecta a FTP y trae todos los archivos xml.
  /// Una vez descargados borra los archivos del servidor FTP.

  Log(ArchivoLog, 'Recepcion FTP');
  DMMain.LogIni('Recepcion FTP');
  Directorio := IncludeTrailingPathDelimiter(Directorio);

  with TIdFTP.Create(Self) do
  begin
     try
        // ConnectTimeout := 10;
        Host := FTP_Host;
        Port := FTP_Port;
        Username := FTP_User;
        Password := FTP_Password;

        Connect;
        Log(ArchivoLog, 'FTP Conectado. CurrentDir: ' + RetrieveCurrentDir);
        DMMain.Log('FTP Conectado. CurrentDir: ' + RetrieveCurrentDir);
        TransferType := ftASCII;

        DMMain.Log('ChangeFTPDir ' + FTP_CarpetaImportacion);
        Log(ArchivoLog, 'ChangeFTPDir ' + FTP_CarpetaImportacion);
        ChangeDir(FTP_CarpetaImportacion);
        DMMain.Log('CurrentDir: ' + RetrieveCurrentDir);

        // Traigo XMLs
        s := TStringList.Create;
        try
           List(s, '', False);
           for i := 0 to s.Count - 1 do
           begin
              Log(ArchivoLog, Format('List[%d] ', [i]) + s[i]);
              DMMain.Log(Format('List[%d] ', [i]) + s[i]);

              if (LowerCase(ExtractFileExt(s[i])) = '.xml') then
              begin
                 Log(ArchivoLog, 'Get ' + s[i]);
                 DMMain.Log('Get ' + s[i]);
                 Get(s[i], Directorio + s[i], True, ResumeSupported);

                 {$IFNDEF Debug}
                 Log(ArchivoLog, 'Delete ' + s[i]);
                 DMMain.Log('Delete ' + s[i]);
                 Delete(s[i]);
                 {$ENDIF}
              end;
           end;
        finally
           s.Free;
        end;

        ChangeDirUp;
        Disconnect;
     finally
        Free;
     end;
  end;

  Log(ArchivoLog, 'Fin Recepcion FTP');
  DMMain.LogFin('Recepcion FTP');
end;

procedure TDMSincronizacionTiendaPureWorks.EnviarDatosFTP(Directorio: string);
var
  SearchRec : TSearchRec;
begin
  /// Envia archivos Stock_*.xml al servidor FTP
  /// Una vez enviados los renombra a Stock_*.xml.yyyymmdd-hhnnss.bak

  Log(ArchivoLog, 'Envio FTP');
  DMMain.LogIni('Envio FTP');
  Directorio := IncludeTrailingPathDelimiter(Directorio);

  with TIdFTP.Create(Self) do
  begin
     try
        // ConnectTimeout := 10;
        Host := FTP_Host;
        Port := FTP_Port;
        Username := FTP_User;
        Password := FTP_Password;

        Connect;
        Log(ArchivoLog, 'FTP Conectado. CurrentDir: ' + RetrieveCurrentDir);
        DMMain.Log('FTP Conectado. CurrentDir: ' + RetrieveCurrentDir);
        TransferType := ftASCII;

        DMMain.Log('ChangeFTPDir ' + FTP_CarpetaExportacion);
        ChangeDir(FTP_CarpetaExportacion);
        DMMain.Log('CurrentDir: ' + RetrieveCurrentDir);

        if FindFirst(CarpetaExportacion + 'Stock_*.xml', faAnyFile, SearchRec) = 0 then
        begin
           repeat
              Log(ArchivoLog, 'Put ' + SearchRec.Name);
              DMMain.Log('Put ' + SearchRec.Name);
              Put(CarpetaExportacion + SearchRec.Name, ExtractFileName(SearchRec.Name));

              // Renombro el fichero enviado
              CopyFileTo(CarpetaExportacion + SearchRec.Name, CarpetaExportacion + SearchRec.Name + '.' + FormatDateTime('yyyymmdd-hhnnss', Now) + '.bak');
              DeleteFile(CarpetaExportacion + SearchRec.Name);
           until FindNext(SearchRec) <> 0;
           FindClose(SearchRec);
        end;

        if FindFirst(CarpetaExportacion + 'Familia_*.xml', faAnyFile, SearchRec) = 0 then
        begin
           repeat
              Log(ArchivoLog, 'Put ' + SearchRec.Name);
              DMMain.Log('Put ' + SearchRec.Name);
              Put(CarpetaExportacion + SearchRec.Name, ExtractFileName(SearchRec.Name));

              // Renombro el fichero enviado
              CopyFileTo(CarpetaExportacion + SearchRec.Name, CarpetaExportacion + SearchRec.Name + '.' + FormatDateTime('yyyymmdd-hhnnss', Now) + '.bak');
              DeleteFile(CarpetaExportacion + SearchRec.Name);
           until FindNext(SearchRec) <> 0;
           FindClose(SearchRec);
        end;

        ChangeDirUp;
        Disconnect;
     finally
        Free;
     end;
  end;

  Log(ArchivoLog, 'Fin Envio FTP');
  DMMain.LogFin('Envio FTP');
end;

procedure TDMSincronizacionTiendaPureWorks.ImportarArticulos(Directorio: string);
var
  sr : TSearchRec;
  sl : TStrings;
  i : integer;
  Documento : TXMLDocument;
  Products, Product, Categories, Categorie : IXMLNode;

  id : integer;
  {
  precio : double;
  precio_venta : double;
  precio_regular : double;
  medidas_mm_alto_orig : string;
  medidas_mm_ancho_orig : string;
  medidas_mm_largo_orig : string;
  medidas_mm_alto : double;
  medidas_mm_ancho : double;
  medidas_mm_largo : double;
  }
  Notas, Categorias : TStrings;
  {
  tipo : string;
  }
  // publicado : integer;
  {
  updated : TDateTime;
  }
  Articulo : TArticulo;
  IdArticuloImportado : integer;
  nombre : string;
begin
  Directorio := IncludeTrailingPathDelimiter(Directorio);

  Log(ArchivoLog, 'Importar Articulos (' + Directorio + ')');
  sl := TStringList.Create;
  Notas := TStringList.Create;
  Categorias := TStringList.Create;
  try
     if FindFirst(Directorio + 'export_productos_*.xml', faAnyFile, sr) = 0 then
     begin
        repeat
           sl.Add(ExtractFileName(sr.Name));
        until FindNext(sr) <> 0;
        FindClose(sr);
     end;

     TStringList(sl).Sort;

     for i := 0 to sl.Count - 1 do
     begin
        // Las traducciones se importaran despues
        if (Copy(sl[i], 1, 19) <> 'export_productos_en') then
        begin
           Log(ArchivoLog, Format('Tratando fichero %d - ', [i]) + sl[i]);
           DMMain.LogIni(Format('Tratando fichero %d - ', [i]) + sl[i]);

           Documento := TXMLDocument.Create(Self);
           with Documento do
           begin
              Active := True;
              Encoding := 'utf-8';
              LoadFromFile(Directorio + sl[i]);

              // Products := DameNodo(DocumentElement, ['products']);
              if (Assigned(DocumentElement)) then
              begin
                 Products := DocumentElement;
                 Product := DameNodo(Products, ['product']);
                 while Assigned(Product) do
                 begin
                    // Averiguo si ya lo he importado a la tabla de articulos importados.
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Text := 'SELECT ID_ARTICULO FROM ART_ARTICULOS_IMPORTADOS WHERE EMPRESA = :EMPRESA AND REF_PROVEEDOR = :ID';
                          Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                          Params.ByName['ID'].AsString := DameDato(Product, ['id']);
                          ExecQuery;
                          IdArticuloImportado := FieldByName['ID_ARTICULO'].AsInteger;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;

                    // Si no lo importe, creo un registro nuevo.
                    if (IdArticuloImportado = 0) then
                    begin
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' INSERT INTO ART_ARTICULOS_IMPORTADOS ( ');
                             SQL.Add(' ID_ARTICULO, ENTRADA, EMPRESA, ARTICULO, REF_PROVEEDOR, TITULO_PROVEEDOR, PVENTA1, PVENTA2, P_VENTA_RECOMENDADO, PCOMPRA1, ');
                             SQL.Add('  PCOMPRA2, PCOSTE1, PCOSTE2, ALFA_1, ALFA_2, NOTAS, TARIFA) ');
                             SQL.Add(' VALUES ( ');
                             SQL.Add(' 0, :ENTRADA, :EMPRESA, '''', :ID, :NOMBRE, :PRECIO, :PRECIO_VENTA, :PRECIO_REGULAR, :MEDIDAS_MM_ALTO, :MEDIDAS_MM_ANCHO, ');
                             SQL.Add('  :MEDIDAS_MM_LARGO, :PESO_GRAMOS, :REFERENCIA, :ID_PADRE, :NOTAS, :TARIFA) ');
                             Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                             Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                             Params.ByName['ID'].AsString := DameDato(Product, ['id']);
                             Params.ByName['NOMBRE'].AsString := Copy(Trim(DameDato(Product, ['nombre'])), 1, 60);
                             Params.ByName['PRECIO'].AsFloat := AmountToDouble(DameDato(Product, ['precio']), False);
                             Params.ByName['PRECIO_VENTA'].AsFloat := AmountToDouble(DameDato(Product, ['precio_venta']), False);
                             Params.ByName['PRECIO_REGULAR'].AsFloat := AmountToDouble(DameDato(Product, ['precio_regular']), False);
                             Params.ByName['MEDIDAS_MM_ALTO'].AsFloat := AmountToDouble(DameDato(Product, ['medidas_mm_alto']), False);
                             Params.ByName['MEDIDAS_MM_ANCHO'].AsFloat := AmountToDouble(DameDato(Product, ['medidas_mm_ancho']), False);
                             Params.ByName['MEDIDAS_MM_LARGO'].AsFloat := AmountToDouble(DameDato(Product, ['medidas_mm_largo']), False);
                             Params.ByName['PESO_GRAMOS'].AsFloat := (AmountToDouble(DameDato(Product, ['peso_gramos']), False) / 1000);
                             Params.ByName['REFERENCIA'].AsString := Trim(DameDato(Product, ['referencia']));
                             Params.ByName['ID_PADRE'].AsString := IntToStr(StrToIntDef(DameDato(Product, ['id_padre']), -1));
                             Params.ByName['TARIFA'].AsString := REntorno.TarifaDefecto;

                             Categories := DameNodo(Product, ['categorias']);
                             Categorie := DameNodo(Categories, ['cat']);
                             Categorias.Clear;
                             while Assigned(Categorie) do
                             begin
                                Categorias.Add(Categorie.Text);
                                Categorie := Categories.ChildNodes.FindSibling(Categorie, 1);
                             end;

                             Notas.Clear;
                             Notas.Add(Format('id: %s', [DameDato(Product, ['id'])]));
                             Notas.Add(Format('nombre: %s', [Trim(DameDato(Product, ['nombre']))]));
                             Notas.Add(Format('referencia: %s', [Trim(DameDato(Product, ['referencia']))]));
                             Notas.Add(Format('precio: %f', [AmountToDouble(DameDato(Product, ['precio']), False)]));
                             Notas.Add(Format('precio_venta: %f', [AmountToDouble(DameDato(Product, ['precio_venta']), False)]));
                             Notas.Add(Format('precio_regular: %f', [AmountToDouble(DameDato(Product, ['precio_regular']), False)]));
                             Notas.Add(Format('medidas_mm_alto: %f', [AmountToDouble(DameDato(Product, ['medidas_mm_alto']), False)]));
                             Notas.Add(Format('medidas_mm_ancho: %f', [AmountToDouble(DameDato(Product, ['medidas_mm_ancho']), False)]));
                             Notas.Add(Format('medidas_mm_largo: %f', [AmountToDouble(DameDato(Product, ['medidas_mm_largo']), False)]));
                             Notas.Add(Format('peso_kg: %f', [(AmountToDouble(DameDato(Product, ['peso_gramos']), False) / 1000)]));
                             Notas.Add(Format('categorias: %s', [Categorias.CommaText]));
                             Notas.Add(Format('tipo: %s', [Trim(DameDato(Product, ['tipo']))]));
                             // Notas.Add(Format('publicado: %d', [publicado]) + #13#10;
                             Notas.Add(Format('updated: %s', [DateTimeToStr(StrToDateTimePureWorks(DameDato(Product, ['updated'])))]));
                             Notas.Add(Format('id_padre: %s', [IntToStr(StrToIntDef(DameDato(Product, ['id_padre']), -1))]));

                             Params.ByName['NOTAS'].AsString := Notas.Text;
                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;
                    end
                    else
                    begin
                       // Si existe lo actualizo
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' UPDATE ART_ARTICULOS_IMPORTADOS ');
                             SQL.Add(' SET ');
                             SQL.Add(' ENTRADA = :ENTRADA, ');
                             SQL.Add(' EMPRESA = :EMPRESA, ');
                             // SQL.Add(' ARTICULO = :ARTICULO, ');
                             SQL.Add(' REF_PROVEEDOR = :ID, ');
                             SQL.Add(' TITULO_PROVEEDOR = :NOMBRE, ');
                             SQL.Add(' PVENTA1 = :PRECIO, ');
                             SQL.Add(' PVENTA2 = :PRECIO_VENTA, ');
                             SQL.Add(' P_VENTA_RECOMENDADO = :PRECIO_REGULAR, ');
                             SQL.Add(' PCOMPRA1 = :MEDIDAS_MM_ALTO, ');
                             SQL.Add(' PCOMPRA2 = :MEDIDAS_MM_ANCHO, ');
                             SQL.Add(' PCOSTE1 = :MEDIDAS_MM_LARGO, ');
                             SQL.Add(' PCOSTE2 = :PESO_GRAMOS, ');
                             SQL.Add(' ALFA_1 = :REFERENCIA, ');
                             SQL.Add(' ALFA_2 = :ID_PADRE, ');
                             SQL.Add(' NOTAS = :NOTAS ');
                             SQL.Add(' WHERE ');
                             SQL.Add(' ID_ARTICULO = :ID_ARTICULO ');

                             Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                             Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                             Params.ByName['ID'].AsString := DameDato(Product, ['id']);
                             Params.ByName['NOMBRE'].AsString := Copy(Trim(DameDato(Product, ['nombre'])), 1, 60);
                             Params.ByName['PRECIO'].AsFloat := AmountToDouble(DameDato(Product, ['precio']), False);
                             Params.ByName['PRECIO_VENTA'].AsFloat := AmountToDouble(DameDato(Product, ['precio_venta']), False);
                             Params.ByName['PRECIO_REGULAR'].AsFloat := AmountToDouble(DameDato(Product, ['precio_regular']), False);
                             Params.ByName['MEDIDAS_MM_ALTO'].AsFloat := AmountToDouble(DameDato(Product, ['medidas_mm_alto']), False);
                             Params.ByName['MEDIDAS_MM_ANCHO'].AsFloat := AmountToDouble(DameDato(Product, ['medidas_mm_ancho']), False);
                             Params.ByName['MEDIDAS_MM_LARGO'].AsFloat := AmountToDouble(DameDato(Product, ['medidas_mm_largo']), False);
                             Params.ByName['PESO_GRAMOS'].AsFloat := (AmountToDouble(DameDato(Product, ['peso_gramos']), False) / 1000);
                             Params.ByName['REFERENCIA'].AsString := Trim(DameDato(Product, ['referencia']));
                             Params.ByName['ID_PADRE'].AsString := IntToStr(StrToIntDef(DameDato(Product, ['id_padre']), -1));
                             Params.ByName['ID_ARTICULO'].AsInteger := IdArticuloImportado;

                             Categories := DameNodo(Product, ['categorias']);
                             Categorie := DameNodo(Categories, ['cat']);
                             Categorias.Clear;
                             while Assigned(Categorie) do
                             begin
                                Categorias.Add(Categorie.Text);
                                Categorie := Categories.ChildNodes.FindSibling(Categorie, 1);
                             end;

                             Notas.Clear;
                             Notas.Add(Format('id: %s', [DameDato(Product, ['id'])]));
                             Notas.Add(Format('nombre: %s', [Trim(DameDato(Product, ['nombre']))]));
                             Notas.Add(Format('referencia: %s', [Trim(DameDato(Product, ['referencia']))]));
                             Notas.Add(Format('precio: %f', [AmountToDouble(DameDato(Product, ['precio']), False)]));
                             Notas.Add(Format('precio_venta: %f', [AmountToDouble(DameDato(Product, ['precio_venta']), False)]));
                             Notas.Add(Format('precio_regular: %f', [AmountToDouble(DameDato(Product, ['precio_regular']), False)]));
                             Notas.Add(Format('medidas_mm_alto: %f', [AmountToDouble(DameDato(Product, ['medidas_mm_alto']), False)]));
                             Notas.Add(Format('medidas_mm_ancho: %f', [AmountToDouble(DameDato(Product, ['medidas_mm_ancho']), False)]));
                             Notas.Add(Format('medidas_mm_largo: %f', [AmountToDouble(DameDato(Product, ['medidas_mm_largo']), False)]));
                             Notas.Add(Format('peso_kg: %f', [(AmountToDouble(DameDato(Product, ['peso_gramos']), False) / 1000)]));
                             Notas.Add(Format('categorias: %s', [Categorias.CommaText]));
                             Notas.Add(Format('tipo: %s', [Trim(DameDato(Product, ['tipo']))]));
                             // Notas.Add(Format('publicado: %d', [publicado]) + #13#10;
                             Notas.Add(Format('updated: %s', [DateTimeToStr(StrToDateTimePureWorks(DameDato(Product, ['updated'])))]));
                             Notas.Add(Format('id_padre: %s', [IntToStr(StrToIntDef(DameDato(Product, ['id_padre']), -1))]));

                             Params.ByName['NOTAS'].AsString := Notas.Text;
                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;
                    end;

                    Product := Products.ChildNodes.FindSibling(Product, 1);
                 end;
              end;
           end;

           Log(ArchivoLog, 'Fin ' + Format('Tratando fichero %d - ', [i]) + sl[i]);
           DMMain.LogFin(Format('Tratando fichero %d - ', [i]) + sl[i]);

           Log(ArchivoLog, 'Rename ' + sl[i]);
           DMMain.Log('Rename ' + sl[i]);
           CopyFileTo(Directorio + sl[i], Directorio + sl[i] + '.' + FormatDateTime('yyyymmdd-hhnnss', Now) + '.bak');
           DeleteFile(Directorio + sl[i]);
        end;
     end;

     { TODO : Pasarlo a procedimiento aparte y llamarlo desde Sincronizar() }
     // Ahora solo quedan ficheros de traducciones (export_productos_en)
     for i := 0 to sl.Count - 1 do
     begin
        if (Copy(sl[i], 1, 19) = 'export_productos_en') then
        begin
           Log(ArchivoLog, Format('Tratando fichero %d - ', [i]) + sl[i]);
           DMMain.LogIni(Format('Tratando fichero %d - ', [i]) + sl[i]);

           Documento := TXMLDocument.Create(Self);
           with Documento do
           begin
              Active := True;
              Encoding := 'utf-8';
              LoadFromFile(Directorio + sl[i]);

              if (Assigned(DocumentElement)) then
              begin
                 Products := DocumentElement;
                 Product := DameNodo(Products, ['product']);
                 while Assigned(Product) do
                 begin
                    InicializaArticulo(Articulo);

                    id := StrToIntDef(DameDato(Product, ['id']), -1);
                    nombre := Trim(DameDato(Product, ['nombre']));

                    DMMain.Log(Format('id: %d', [id]));
                    DMMain.Log(Format('nombre: %s', [nombre]));

                    // Crear o modificar traduccion
                    try
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' UPDATE OR INSERT INTO ART_ARTICULOS_IDIOMAS ( ');
                             SQL.Add(' EMPRESA, ARTICULO, IDIOMA, TITULO) ');
                             SQL.Add(' VALUES ( ');
                             SQL.Add(' :EMPRESA, :ARTICULO, :IDIOMA, :TITULO) ');
                             SQL.Add(' MATCHING (EMPRESA, ARTICULO, IDIOMA) ');
                             Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                             Params.ByName['ARTICULO'].AsString := IntToStr(id);
                             Params.ByName['IDIOMA'].AsString := 'ENG';
                             Params.ByName['TITULO'].AsString := nombre;
                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;
                    except
                       on E: Exception do
                          DMMain.Log(Format('Error: %s', [E.Message]));
                    end;

                    Product := Products.ChildNodes.FindSibling(Product, 1);
                 end;
              end;
           end;

           Log(ArchivoLog, 'Fin ' + Format('Tratando fichero %d - ', [i]) + sl[i]);
           DMMain.LogFin(Format('Tratando fichero %d - ', [i]) + sl[i]);

           Log(ArchivoLog, 'Rename ' + sl[i]);
           DMMain.Log('Rename ' + sl[i]);
           CopyFileTo(Directorio + sl[i], Directorio + sl[i] + '.' + FormatDateTime('yyyymmdd-hhnnss', Now) + '.bak');
           DeleteFile(Directorio + sl[i]);
        end;
     end;
  finally
     sl.Free;
     Categorias.Free;
     Notas.Free;
  end;
end;

procedure TDMSincronizacionTiendaPureWorks.ExportarStocks(Directorio: string);
var
  DS : TFIBDataSet;
  Documento : TXMLDocument;
  Products, Product, Nodo : IXMLNode;
  CodigoProveedor : string;
begin
  Directorio := IncludeTrailingPathDelimiter(Directorio);

  Log(ArchivoLog, 'Exportando Stocks (' + Directorio + ')');
  DMMain.LogIni('Exportando Stocks');

  DS := TFIBDataSet.Create(nil);
  with DS do
  begin
     try
        Transaction := TFIBTransaction.Create(nil);
        try
           Close;
           DataBase := DMMain.DataBase;
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
              if (not InTransaction) then
                 StartTransaction;
           end;
           SelectSQL.Add(' SELECT ARTICULO, EXISTENCIAS ');
           SelectSQL.Add(' FROM A_ART_STOCK_POR_ALMACEN( ');
           SelectSQL.Add(' :ENTRADA, :EMPRESA, :EJERCICIO, :CANAL, :ALMACEN, ');
           SelectSQL.Add(' :ART_INI, :ART_FIN, :FAM_INI, :FAM_FIN, :SUBFAM_INI, :SUBFAM_FIN, ');
           SelectSQL.Add(' :FECHA, :TIPO_VALOR, :MONEDA, :TARIFA, 0 /*BAJA*/, '''' /*TIPO_ARTICULO*/, ');
           SelectSQL.Add(' '''' /*CODIGO_GENERO_DESDE*/, '''' /*CODIGO_GENERO_HASTA*/, '''' /*CODIGO_TEMPORADA_DESDE*/, '''' /*CODIGO_TEMPORADA_HASTA*/, ');
           SelectSQL.Add(' '''' /*MARCA_DESDE*/, '''' /*MARCA_HASTA*/) ');
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           // Almacen 999 en Pureworks es la suma ambos canales del almacen 000.
           Params.ByName['ALMACEN'].AsString := '999';
           Params.ByName['ART_INI'].AsString := '.';
           Params.ByName['ART_FIN'].AsString := '¿?';
           Params.ByName['FAM_INI'].AsString := '.';
           Params.ByName['FAM_FIN'].AsString := '¿?';
           Params.ByName['SUBFAM_INI'].AsString := '.';
           Params.ByName['SUBFAM_FIN'].AsString := '¿?';
           Params.ByName['FECHA'].AsDateTime := Now;
           Params.ByName['TIPO_VALOR'].AsInteger := 0;
           Params.ByName['MONEDA'].AsString := REntorno.Moneda;
           Params.ByName['TARIFA'].AsString := REntorno.TarifaDefecto;
           Open;

           Documento := TXMLDocument.Create(Self);
           with Documento do
           begin
              try
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
                 DocumentElement := CreateElement('Products', '');
                 Products := DocumentElement;

                 while (not DS.EOF) do
                 begin
                    // Busco el codigo de proveedor, que es el ID de producto.
                    CodigoProveedor := DameCodigoProveedor(ProveedorSincronizacion, DS.FieldByName('ARTICULO').AsString);
                    if (CodigoProveedor <> '') then
                    begin
                       Product := Products.AddChild('Product', '');
                       Nodo := Product.AddChild('id', '');
                       Nodo.Text := CodigoProveedor;
                       Nodo := Product.AddChild('stock', '');
                       Nodo.Text := FormatAmount(DS.FieldByName('EXISTENCIAS').AsFloat, 2);
                    end;

                    DS.Next;
                 end;

                 XML.Text := FormatXMLData(XML.Text);
                 Active := True;
                 Encoding := 'utf-8';
                 DMMain.Log(Format('Fichero: %s', [Format('Stock_%s.xml', [FormatDateTime('yyyymmdd_hhnnss', Now)])]));
                 SaveToFile(Directorio + Format('Stock_%s.xml', [FormatDateTime('yyyymmdd_hhnnss', Now)]));
                 Active := False;
                 // Borro los datos
                 XML.Text := '';
              finally
                 Documento.Free;
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
  Log(ArchivoLog, 'Fin ' + 'Exportando Stocks (' + Directorio + ')');
  DMMain.LogFin('Exportando Stocks');
end;

procedure TDMSincronizacionTiendaPureWorks.ImportarPedidos(Directorio: string);
var
  sr : TSearchRec;
  sl : TStrings;
  i : integer;
  Documento : TXMLDocument;
  Pedidos, Pedido, Importes, Conceptos, Item : IXMLNode;

  Cliente : TCliente;

  // Estado : integer;
  id_s, Rig : integer;
  Proceso_auto : integer;
  Articulo : string;
begin
  Proceso_auto := DMMain.ContadorGen('CONTA_TMP_PROC_AUTO');
  Log(ArchivoLog, 'Proceso Auto (' + IntToStr(Proceso_auto) + ')');

  Directorio := IncludeTrailingPathDelimiter(Directorio);
  Log(ArchivoLog, 'Importar Pedidos (' + Directorio + ')');

  sl := TStringList.Create;
  try
     if FindFirst(Directorio + 'export_pedidos_*.xml', faAnyFile, sr) = 0 then
     begin
        repeat
           sl.Add(ExtractFileName(sr.Name));
        until FindNext(sr) <> 0;
        FindClose(sr);
     end;

     TStringList(sl).Sort;

     for i := 0 to sl.Count - 1 do
     begin
        Log(ArchivoLog, Format('Tratando fichero %d - ', [i]) + sl[i]);
        DMMain.LogIni(Format('Tratando fichero %d - ', [i]) + sl[i]);

        Documento := TXMLDocument.Create(Self);
        with Documento do
        begin
           Active := True;
           Encoding := 'utf-8';
           LoadFromFile(Directorio + sl[i]);

           if (Assigned(DocumentElement)) then
           begin
              Pedidos := DocumentElement;
              Pedido := DameNodo(Pedidos, ['pedido']);
              while Assigned(Pedido) do
              begin
                 // Creo el cliente si no existe con su direccino de facturacion
                 InicializaCliente(Cliente);
                 with Cliente do
                 begin
                    Tercero.NombreRSocial := Trim(Trim(DameDato(Pedido, ['datos_facturacion', 'facturacion_nombre'])) + ' ' + Trim(DameDato(Pedido, ['datos_facturacion', 'facturacion_apellidos'])));
                    Tercero.NIF := Trim(DameDato(Pedido, ['datos_facturacion', 'facturacion_nif']));
                    if (Tercero.NIF = '') then
                       Tercero.NIF := 'CRC' + CalcCRC32Str(Trim(DameDato(Pedido, ['datos_facturacion', 'facturacion_email'])));

                    Tercero.Telefono1 := Trim(DameDato(Pedido, ['datos_facturacion', 'facturacion_telefono']));
                    Tercero.email := Trim(DameDato(Pedido, ['datos_facturacion', 'facturacion_email']));
                    Tercero.Direccion.DirNombre1 := Trim(DameDato(Pedido, ['datos_facturacion', 'facturacion_direccion_1']));
                    Tercero.Direccion.DirNombre2 := Trim(DameDato(Pedido, ['datos_facturacion', 'facturacion_direccion_2']));
                    Tercero.Direccion.Localidad := Trim(DameDato(Pedido, ['datos_facturacion', 'facturacion_ciudad']));
                    Tercero.Direccion.Provincia := Trim(DameDato(Pedido, ['datos_facturacion', 'facturacion_provincia']));
                    Tercero.Direccion.CodigoPostal := Trim(DameDato(Pedido, ['datos_facturacion', 'facturacion_cp']));
                    Tercero.Direccion.Pais := Trim(DameDato(Pedido, ['datos_facturacion', 'facturacion_pais']));
                    Tercero.Notas := Format(_('Nombre R. Social: %s'), [Tercero.NombreRSocial]);
                    Tercero.Notas := Tercero.Notas + Format(_('NIF: %s'), [Tercero.NIF]);
                    Tercero.Notas := Tercero.Notas + Format(_('Telefono: %s'), [Tercero.Telefono1]);
                    Tercero.Notas := Tercero.Notas + Format(_('email: %s'), [Tercero.email]);
                    Tercero.Notas := Tercero.Notas + Format(_('DirNombre1: %s'), [Tercero.Direccion.DirNombre1]);
                    Tercero.Notas := Tercero.Notas + Format(_('DirNombre2: %s'), [Tercero.Direccion.DirNombre2]);
                    Tercero.Notas := Tercero.Notas + Format(_('DirLocalidad: %s'), [Tercero.Direccion.DirLocalidad]);
                    Tercero.Notas := Tercero.Notas + Format(_('Provincia: %s'), [Tercero.Direccion.Provincia]);
                    Tercero.Notas := Tercero.Notas + Format(_('CodigoPostal: %s'), [Tercero.Direccion.CodigoPostal]);
                    Tercero.Notas := Tercero.Notas + Format(_('Pais: %s'), [Tercero.Direccion.Pais]);

                    Pais := Trim(DameDato(Pedido, ['datos_facturacion', 'facturacion_pais']));
                    ModoIVA := 1;
                    Tipo := 1; // Cliente nacional
                 end;

                 CreaCliente(Cliente);

                 {
                 // Creo otro cliente, con la direccion de entrega. Como tiene mismo NIF debería agregar una dirección si no es igual a la de facturacion
                 InicializaCliente(Cliente);
                 with Cliente do
                 begin
                    Tercero.NombreRSocial := Trim(Trim(DameDato(Pedido, ['datos_facturacion', 'facturacion_nombre'])) + ' ' + Trim(DameDato(Pedido, ['datos_facturacion', 'facturacion_apellidos'])));
                    Tercero.NIF := Trim(DameDato(Pedido, ['datos_facturacion', 'facturacion_nif']));
                    if (Tercero.NIF = '') then
                       Tercero.NIF := CalcCRC32Str(Trim(DameDato(Pedido, ['datos_facturacion', 'facturacion_email'])));

                    Tercero.Direccion.DirNombre1 := Trim(DameDato(Pedido, ['datos_envio', 'envio_direccion_1']));
                    Tercero.Direccion.DirNombre2 := Trim(DameDato(Pedido, ['datos_envio', 'envio_direccion_2']));
                    Tercero.Direccion.DirLocalidad := Trim(DameDato(Pedido, ['datos_envio', 'envio_ciudad']));
                    Tercero.Direccion.Provincia := Trim(DameDato(Pedido, ['datos_envio', 'envio_provincia']));
                    Tercero.Direccion.CodigoPostal := Trim(DameDato(Pedido, ['datos_envio', 'envio_cp']));
                 end;
                 }

                 // Crear cabecera de factura
                 DMMain.Log(Format('id: %s', [DameDato(Pedido, ['id'])]));
                 DMMain.Log(Format('fecha: %s', [DameDato(Pedido, ['fecha'])]));
                 DMMain.Log(Format('modo_pago: %s', [DameDato(Pedido, ['modo_pago'])]));

                 // Verifico si el pedido ya fue importado
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'SELECT ID_S, ESTADO FROM GES_CABECERAS_S WHERE EMPRESA = :EMPRESA AND TIPO = :TIPO AND SU_REFERENCIA = :SU_REFERENCIA';
                       Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                       Params.ByName['TIPO'].AsString := 'ALB';
                       Params.ByName['SU_REFERENCIA'].AsString := Format('PEDIDO WEB %d', [StrToInt(DameDato(Pedido, ['id']))]);
                       ExecQuery;
                       id_s := FieldByName['ID_S'].AsInteger;
                       // Estado := FieldByName['ESTADO'].AsInteger;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 if (id_s = 0) then
                 begin
                    id_s := DMMain.ContadorGen('ID_GES_CABECERAS_S');
                    Rig := DMMain.Contador_EECS(REntorno.Serie, 'ALB');

                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' INSERT INTO VER_CABECERAS_ALBARAN ( ');
                          SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ID_S, FECHA, ');
                          SQL.Add(' TARIFA, TERCERO, CLIENTE, DIRECCION, ENTRADA, TRANSPORTISTA, ');
                          SQL.Add(' SU_REFERENCIA) ');
                          SQL.Add(' VALUES ( ');
                          SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :ID_S, :FECHA, ');
                          SQL.Add(' :TARIFA, :TERCERO, :CLIENTE, :DIRECCION, :ENTRADA, :TRANSPORTISTA, ');
                          SQL.Add(' :SU_REFERENCIA) ');
                          Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                          Params.ByName['EJERCICIO'].AsInteger := DameEjercicio(REntorno.Empresa, StrToDateTimePureWorks(DameDato(Pedido, ['fecha'])));
                          Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                          Params.ByName['SERIE'].AsString := 'W'; // REntorno.Serie;
                          Params.ByName['TIPO'].AsString := 'ALB';
                          Params.ByName['RIG'].AsInteger := Rig;
                          Params.ByName['FECHA'].AsDateTime := StrToDateTimePureWorks(DameDato(Pedido, ['fecha']));
                          Params.ByName['ID_S'].AsInteger := id_s;
                          Params.ByName['TARIFA'].AsString := REntorno.TarifaDefecto;
                          Params.ByName['TERCERO'].AsInteger := Cliente.Tercero.Tercero;
                          Params.ByName['CLIENTE'].AsInteger := Cliente.Cliente;
                          Params.ByName['DIRECCION'].AsInteger := Cliente.Tercero.Direccion.Direccion;
                          Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                          Params.ByName['TRANSPORTISTA'].AsInteger := 1;
                          Params.ByName['SU_REFERENCIA'].AsString := Format('PEDIDO WEB %d', [StrToInt(DameDato(Pedido, ['id']))]);
                          ExecQuery;
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
                          SQL.Add(' INSERT INTO TMP_PROCESOS_AUTO ( ');
                          SQL.Add(' CONTADOR, ENTRADA, EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG) ');
                          SQL.Add(' SELECT :PROCESO_AUTO, :ENTRADA, EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG ');
                          SQL.Add(' FROM GES_CABECERAS_S ');
                          SQL.Add(' WHERE ');
                          SQL.Add(' ID_S = :ID_S ');
                          Params.ByName['ID_S'].AsInteger := id_s;
                          Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                          Params.ByName['PROCESO_AUTO'].AsInteger := Proceso_auto;
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;

                    {
                    <id>49455</id>
                    <fecha>2017-10-31 11:21:43</fecha>
                    <modo_pago>paypal</modo_pago>
                    <importes>
                           <total>129.28</total>
                           <total_impuestos>13.1334</total_impuestos>
                           <total_gastos_envio>44.3</total_gastos_envio>
                           <recargos>
                                   <item>
                                           <descripcion>Cargo por reembolso - 6%</descripcion>
                                           <total>3.54</total>
                                           <total_impuestos>0.7434</total_impuestos>
                                   </item>
                           </recargos>
                    </importes>
                    }

                    Importes := DameNodo(Pedido, ['importes']);
                    if (StrToFloatDef(DameDato(Importes, ['total_gastos_envio']), 0) > 0) then
                    begin
                       DMMain.Log(Format('importes - total_gastos_envio: %s', [DameDato(Importes, ['total_gastos_envio'])]));

                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' UPDATE VER_CABECERAS_ALBARAN ');
                             SQL.Add(' SET ');
                             SQL.Add(' TIPO_PORTES = :TIPO_PORTES, ');
                             SQL.Add(' I_PORTES = :I_PORTES ');
                             SQL.Add(' WHERE ');
                             SQL.Add(' ID_S = :ID_S ');
                             Params.ByName['ID_S'].AsInteger := id_s;
                             Params.ByName['TIPO_PORTES'].AsInteger := 4; // Portes lineales
                             Params.ByName['I_PORTES'].AsFloat := StrToFloatDec(DameDato(Importes, ['total_gastos_envio']), '.');
                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;
                    end;

                    // Los diferentes recargos seran lineas de la factura
                    Importes := DameNodo(Importes, ['recargos']);
                    Item := DameNodo(Importes, ['item']);
                    while Assigned(Item) do
                    begin
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' INSERT INTO VER_DETALLE_ALBARAN ( ');
                             SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ARTICULO, ENTRADA, ');
                             SQL.Add(' ID_S, TITULO, UNIDADES, PRECIO, TIPO_IVA) ');
                             SQL.Add(' VALUES ( ');
                             SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA, :ARTICULO, :ENTRADA, ');
                             SQL.Add(' :ID_S, :TITULO, :UNIDADES, :PRECIO, :TIPO_IVA) ');
                             Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                             Params.ByName['EJERCICIO'].AsInteger := DameEjercicio(REntorno.Empresa, StrToDateTimePureWorks(DameDato(Pedido, ['fecha'])));
                             Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                             Params.ByName['SERIE'].AsString := 'W'; // REntorno.Serie;
                             Params.ByName['TIPO'].AsString := 'ALB';
                             Params.ByName['RIG'].AsInteger := Rig;
                             Params.ByName['LINEA'].AsInteger := DMMain.DameLineaSiguiente('ALB', id_s);
                             Params.ByName['ARTICULO'].AsString := REntorno.ArtTextoLibre;
                             Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                             Params.ByName['ID_S'].AsInteger := id_s;
                             Params.ByName['TITULO'].AsString := Copy(DameDato(Item, ['descripcion']), 1, 60);
                             Params.ByName['UNIDADES'].AsFloat := 1;
                             Params.ByName['PRECIO'].AsFloat := StrToFloatDec(DameDato(Item, ['total']), '.');
                             Params.ByName['TIPO_IVA'].AsInteger := DameTipoIVAArticulo(Params.ByName['ARTICULO'].AsString, Params.ByName['EMPRESA'].AsInteger, Params.ByName['EJERCICIO'].AsInteger, Params.ByName['CANAL'].AsInteger);
                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;

                       Item := Importes.ChildNodes.FindSibling(Item, 1);
                    end;

                    // Crear lineas
                    Conceptos := DameNodo(Pedido, ['conceptos']);
                    Item := DameNodo(Conceptos, ['item']);
                    while Assigned(Item) do
                    begin
                       DMMain.Log(Format('id_producto: %s', [DameDato(Item, ['id_producto'])]));
                       DMMain.Log(Format('producto: %s', [DameDato(Item, ['producto'])]));
                       DMMain.Log(Format('cantidad: %s', [DameDato(Item, ['cantidad'])]));
                       DMMain.Log(Format('precio_unitario: %s', [DameDato(Item, ['precio_unitario'])]));
                       DMMain.Log(Format('total: %s', [DameDato(Item, ['total'])]));
                       DMMain.Log(Format('total_impuestos: %s', [DameDato(Item, ['total_impuestos'])]));
                       {
                       <producto>Camilla fija de tres cuerpos - Color Negro</producto>
                       <id_producto>0</id_producto>
                       <id_producto_variacion>0</id_producto_variacion>
                       <cantidad>1</cantidad>
                       <precio_unitario>210</precio_unitario>
                       <total>210</total>
                       <total_impuestos>44.1</total_impuestos>
                       }
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' INSERT INTO VER_DETALLE_ALBARAN ( ');
                             SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ARTICULO, ENTRADA, ');
                             SQL.Add(' ID_S, TITULO, UNIDADES, PRECIO, TIPO_IVA) ');
                             SQL.Add(' VALUES ( ');
                             SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA, :ARTICULO, :ENTRADA, ');
                             SQL.Add(' :ID_S, :TITULO, :UNIDADES, :PRECIO, :TIPO_IVA) ');
                             Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                             Params.ByName['EJERCICIO'].AsInteger := DameEjercicio(REntorno.Empresa, StrToDateTimePureWorks(DameDato(Pedido, ['fecha'])));
                             Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                             Params.ByName['SERIE'].AsString := 'W'; // REntorno.Serie;
                             Params.ByName['TIPO'].AsString := 'ALB';
                             Params.ByName['RIG'].AsInteger := Rig;
                             Params.ByName['LINEA'].AsInteger := DMMain.DameLineaSiguiente('ALB', id_s);

                             Articulo := DameArticuloSegunProveedor(ProveedorSincronizacion, IntToStr(StrToIntDef(DameDato(Item, ['id_producto']), 0)));
                             if (Articulo <> '') then
                                Params.ByName['ARTICULO'].AsString := DameDato(Item, ['id_producto'])
                             else
                                Params.ByName['ARTICULO'].AsString := REntorno.ArtTextoLibre;

                             Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                             Params.ByName['ID_S'].AsInteger := id_s;

                             if (Articulo <> '') then
                                Params.ByName['TITULO'].AsString := Copy(DameDato(Item, ['producto']), 1, 60)
                             else
                                Params.ByName['TITULO'].AsString := Copy('ZZ' + DameDato(Item, ['producto']), 1, 60);

                             Params.ByName['UNIDADES'].AsFloat := StrToFloatDec(DameDato(Item, ['cantidad']), '.');
                             Params.ByName['PRECIO'].AsFloat := StrToFloatDec(DameDato(Item, ['precio_unitario']), '.');
                             Params.ByName['TIPO_IVA'].AsInteger := DameTipoIVAArticulo(Params.ByName['ARTICULO'].AsString, Params.ByName['EMPRESA'].AsInteger, Params.ByName['EJERCICIO'].AsInteger, Params.ByName['CANAL'].AsInteger);

                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;

                       Item := Conceptos.ChildNodes.FindSibling(Item, 1);
                    end;
                 end;

                 Pedido := Pedidos.ChildNodes.FindSibling(Pedido, 1);
              end;
           end;
        end;

        Log(ArchivoLog, 'Fin ' + Format('Tratando fichero %d - ', [i]) + sl[i]);
        DMMain.LogFin(Format('Tratando fichero %d - ', [i]) + sl[i]);

        Log(ArchivoLog, 'Rename ' + sl[i]);
        DMMain.Log('Rename ' + sl[i]);
        CopyFileTo(Directorio + sl[i], Directorio + sl[i] + '.' + FormatDateTime('yyyymmdd-hhnnss', Now) + '.bak');
        DeleteFile(Directorio + sl[i]);
     end;
  finally
     sl.Free;
  end;
  Log(ArchivoLog, 'Fin ' + 'Importar Pedidos (' + Directorio + ')');

  FMain.EjecutaAccion(FMain.AAlbaranes);
  FMAlbaranes.AgrupacionPedidos('W' {Serie}, Proceso_auto);
end;

procedure TDMSincronizacionTiendaPureWorks.Log(Archivo, s: string);
var
  F : TextFile;
  FileName : string;
begin
  FileName := ChangeFileExt(Archivo, '.log');
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

  // Lo muestro en la ventana principal
  if Assigned(LineasLog) then
     LineasLog.Add(s);
end;

procedure TDMSincronizacionTiendaPureWorks.ExportarFamilias(Directorio: string);
var
  DS : TFIBDataSet;
  Documento : TXMLDocument;
  Products, Product, Nodo : IXMLNode;
begin
  Directorio := IncludeTrailingPathDelimiter(Directorio);

  Log(ArchivoLog, 'Exportando Familias (' + Directorio + ')');
  DMMain.LogIni('Exportando Familias');

  DS := TFIBDataSet.Create(nil);
  with DS do
  begin
     try
        Transaction := TFIBTransaction.Create(nil);
        try
           Close;
           DataBase := DMMain.DataBase;
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
              if (not InTransaction) then
                 StartTransaction;
           end;
           SelectSQL.Add(' SELECT ID_FAMILIA, FAMILIA, TITULO ');
           SelectSQL.Add(' FROM ART_FAMILIAS ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' ULT_MODIFICACION >= :ULTIMA_SINCRONIZACION ');
           SelectSQL.Add(' ORDER BY FAMILIA ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ULTIMA_SINCRONIZACION'].AsDateTime := UltimaSincronizacion;
           Open;

           if (not DS.EOF) then
           begin
              Documento := TXMLDocument.Create(Self);
              with Documento do
              begin
                 try
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
                    DocumentElement := CreateElement('Families', '');
                    Products := DocumentElement;

                    while (not DS.EOF) do
                    begin
                       Product := Products.AddChild('Familie', '');
                       Nodo := Product.AddChild('id', '');
                       Nodo.Text := DS.FieldByName('ID_FAMILIA').AsString;
                       Nodo := Product.AddChild('description', '');
                       Nodo.Text := DS.FieldByName('TITULO').AsString;

                       DS.Next;
                    end;

                    XML.Text := FormatXMLData(XML.Text);
                    Active := True;
                    Encoding := 'utf-8';
                    DMMain.Log(Format('Fichero: %s', [Format('Familia_%s.xml', [FormatDateTime('yyyymmdd_hhnnss', Now)])]));
                    SaveToFile(Directorio + Format('Familia_%s.xml', [FormatDateTime('yyyymmdd_hhnnss', Now)]));
                    Active := False;
                    // Borro los datos
                    XML.Text := '';
                 finally
                    Documento.Free;
                 end;
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
  Log(ArchivoLog, 'Fin ' + 'Exportando Familias (' + Directorio + ')');
  DMMain.LogFin('Exportando Familias');
end;

procedure TDMSincronizacionTiendaPureWorks.xImportacionArticulosNewRecord(DataSet: TDataSet);
begin
  with xImportacionArticulos do
  begin
     FieldByName('EMPRESA').AsInteger := REntorno.Empresa;
     FieldByName('ENTRADA').AsInteger := REntorno.Entrada;
     FieldByName('TRASPASADO').AsInteger := 0;
  end;
end;

procedure TDMSincronizacionTiendaPureWorks.RefrescarArticulos;
var
  IdArt : integer;
  Articulo, Titulo : string;
begin
  /// Rellena campo ARTICULO de los que productos que ya estan sincronizados.

  if (ProveedorSincronizacion = 0) then
     ProveedorSincronizacion := LeeDatoIni('SincronizacionTiendaPureWorks', 'ProveedorSincronizacion', 0);

  with xImportacionArticulos do
  begin
     try
        DisableControls;
        Close;
        Open;
        First;
        while not EOF do
        begin
           if (xImportacionArticulosARTICULO.AsString = '') then
           begin
              // Busco si ya esta sincronizado
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' SELECT ID_A, ARTICULO FROM ART_ARTICULOS_CODPROV ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' EMPRESA = :EMPRESA AND ');
                    SQL.Add(' PROVEEDOR = :PROVEEDOR AND ');
                    SQL.Add(' CODIGO_PROVEEDOR = :CODIGO_PROVEEDOR ');
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['PROVEEDOR'].AsInteger := ProveedorSincronizacion;
                    Params.ByName['CODIGO_PROVEEDOR'].AsString := xImportacionArticulosREF_PROVEEDOR.AsString;
                    ExecQuery;
                    IDArt := FieldByName['ID_A'].AsInteger;
                    Articulo := FieldByName['ARTICULO'].AsString;
                    Titulo := DameTituloArticulo(IdArt);
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              if (IdArt <> 0) then
              begin
                 Edit;
                 // Establezco ID_A como registro ya sincronizado
                 xImportacionArticulosID_ART_ARTICULOS.AsInteger := IdArt;
                 xImportacionArticulosARTICULO.AsString := Articulo;
                 xImportacionArticulosTITULO.AsString := Titulo;
                 xImportacionArticulosTRASPASADO.AsInteger := 1;
                 Post;
              end
              else
              begin
                 // Si no lo encontre busco un articulo con ALFA_1 = Referencia
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' SELECT ID_A, ARTICULO, TITULO_LARGO FROM ART_ARTICULOS ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' EMPRESA = :EMPRESA AND ');
                       SQL.Add(' ALFA_1 = :REFERENCIA ');
                       Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                       Params.ByName['REFERENCIA'].AsString := xImportacionArticulosALFA_1.AsString;
                       ExecQuery;
                       IDArt := FieldByName['ID_A'].AsInteger;
                       Articulo := FieldByName['ARTICULO'].AsString;
                       Titulo := FieldByName['TITULO_LARGO'].AsString;
                       FreeHandle;
                    finally
                       Free;
                    end;

                    if (IdArt <> 0) then
                    begin
                       Edit;
                       // Dejo si asignar ID_A, para identificarlo como registro a revisar.
                       // xImportacionArticulosID_ART_ARTICULOS.AsInteger := IdArt;
                       xImportacionArticulosARTICULO.AsString := Articulo;
                       xImportacionArticulosTITULO.AsString := Titulo;
                       xImportacionArticulosTRASPASADO.AsInteger := 0;
                       Post;
                    end;
                 end;
              end;
           end;

           Next;
        end;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMSincronizacionTiendaPureWorks.CrearModificarArticulos;
var
  Articulo : TArticulo;
begin
  /// Recorre los articulos marcados con TRASPASADO = 1 y los crea/modifica

  with xImportacionArticulos do
  begin
     try
        DisableControls;
        Close;
        Open;
        First;
        while not EOF do
        begin
           if ((xImportacionArticulosTRASPASADO.AsInteger = 1) and (xImportacionArticulosARTICULO.AsString <> '')) then
           begin
              // El articulo ya esta asociado a un articulo
              // if (xImportacionArticulosID_ART_ARTICULOS.AsInteger <> 0) then
              // begin
              InicializaArticulo(Articulo);

              Articulo.control_stock := 1;
              Articulo.Disponibilidad := 1;
              Articulo.TipoIva := DameTipoIVA(21);

              Articulo.Articulo := xImportacionArticulosARTICULO.AsString;
              Articulo.Familia := DMMain.DameFamiliaArticulo(Articulo.Articulo);
              Articulo.Titulo := xImportacionArticulosTITULO_PROVEEDOR.AsString;
              Articulo.Alfa_1 := xImportacionArticulosALFA_1.AsString;

              Articulo.volumen_unit := xImportacionArticulosPVENTA1.AsFloat * xImportacionArticulosPVENTA1.AsFloat * xImportacionArticulosPVENTA1.AsFloat;
              if (xImportacionArticulosPVENTA1.AsFloat > xImportacionArticulosPVENTA1.AsFloat) then
                 Articulo.diametro_unit := xImportacionArticulosPVENTA1.AsFloat
              else
                 Articulo.diametro_unit := xImportacionArticulosPVENTA1.AsFloat;

              Articulo.Peso := xImportacionArticulosPCOMPRA1.AsFloat;

              Articulo.Alfa_2 := xImportacionArticulosALFA_2.AsString;

              Articulo.Notas := xImportacionArticulosNOTAS.AsString;

              // Crear o modificar el articulo
              CreaArticulo(Articulo);

              // Actualizo el precio de la tarifa de venta
              ActualizaPrecio(Articulo.Articulo, xImportacionArticulosPVENTA1.AsFloat);

              RelacionaArticulo(Articulo.Articulo, xImportacionArticulosREF_PROVEEDOR.AsString, xImportacionArticulosTITULO_PROVEEDOR.AsString);

              Edit;
              xImportacionArticulosID_ART_ARTICULOS.AsInteger := Articulo.Id_A;
              Post;
              // end;
           end;

           Next;
        end;
     finally
        EnableControls;
     end;
  end;

  // Borro los registros que se hayan creado/modificado
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM ART_ARTICULOS_IMPORTADOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' TRASPASADO = 1 AND ');
        SQL.Add(' ID_ART_ARTICULOS <> 0 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  xImportacionArticulos.Close;
  xImportacionArticulos.Open;
end;

function TDMSincronizacionTiendaPureWorks.DameArticuloSegunProveedor(Proveedor: integer; CodigoProveedor: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 ARTICULO FROM ART_ARTICULOS_CODPROV ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' PROVEEDOR = :PROVEEDOR AND ');
        SQL.Add(' CODIGO_PROVEEDOR = :CODIGO_PROVEEDOR ');
        SQL.Add(' ORDER BY ARTICULO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['PROVEEDOR'].AsInteger := ProveedorSincronizacion;
        Params.ByName['CODIGO_PROVEEDOR'].AsString := CodigoProveedor;
        ExecQuery;
        Result := FieldByName['ARTICULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMSincronizacionTiendaPureWorks.RelacionaArticulo(Articulo, CodigoProveedor, TituloProveedor: string);
var
  insertar : boolean;
begin
  if (ProveedorSincronizacion = 0) then
     ProveedorSincronizacion := LeeDatoIni('SincronizacionTiendaPureWorks', 'ProveedorSincronizacion', 0);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_A FROM ART_ARTICULOS_CODPROV ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' ARTICULO = :ARTICULO AND ');
        SQL.Add(' PROVEEDOR = :PROVEEDOR AND ');
        SQL.Add(' CODIGO_PROVEEDOR = :CODIGO_PROVEEDOR ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['PROVEEDOR'].AsInteger := ProveedorSincronizacion;
        Params.ByName['CODIGO_PROVEEDOR'].AsString := CodigoProveedor;
        ExecQuery;
        insertar := (FieldByName['ID_A'].AsInteger = 0);
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (insertar) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO ART_ARTICULOS_CODPROV ( ');
           SQL.Add(' EMPRESA, ARTICULO, PROVEEDOR, CODIGO_PROVEEDOR, TITULO_ART) ');
           SQL.Add(' VALUES ( ');
           SQL.Add(' :EMPRESA, :ARTICULO, :PROVEEDOR, :CODIGO_PROVEEDOR, :TITULO_ART) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['ARTICULO'].AsString := Articulo;
           Params.ByName['PROVEEDOR'].AsInteger := ProveedorSincronizacion;
           Params.ByName['CODIGO_PROVEEDOR'].AsString := CodigoProveedor;
           Params.ByName['TITULO_ART'].AsString := TituloProveedor;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMSincronizacionTiendaPureWorks.HayArticulosSinSincronizar: boolean;
begin
  // Verifica si hay registros por sincronizar
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_ARTICULO FROM ART_ARTICULOS_IMPORTADOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        Result := (FieldByName['ID_ARTICULO'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMSincronizacionTiendaPureWorks.xImportacionArticulosARTICULOChange(Sender: TField);
begin
  xImportacionArticulosTITULO.AsString := DameTituloArticulo(xImportacionArticulosARTICULO.AsString);
end;

procedure TDMSincronizacionTiendaPureWorks.xImportacionArticulosTRASPASADOChange(Sender: TField);
begin
  if (xImportacionArticulosTRASPASADO.AsInteger = 1) then
  begin
     if (xImportacionArticulosARTICULO.AsString = '') then
        xImportacionArticulosARTICULO.AsString := xImportacionArticulosREF_PROVEEDOR.AsString;
  end;
end;

end.
