unit UDMHubSpot;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes;

type
  TDMHubSpot = class(TDataModule)
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     WSSecureProtocol: boolean;
     WSDebug: boolean;
     WSURL: string;
     WSToken: string;
     procedure ClearCData(aJSON: TStrings);
     function WS_DoPost(Metodo, Resource: string; id: string; Opciones: string; Contenido, Respuesta: TStrings; aContentType: string = ''): integer;
  public
     { Public declarations }
     function WS_Inicializa(aURL, aToken: string; aDebug: boolean): boolean;
     function WS_Add(Resource: string; Contenido, Respuesta: TStrings; ContentType: string = ''): integer;
     function WS_Delete(Resource, id: string; Respuesta: TStrings; ContentType: string = ''): integer;
     function WS_Edit(Resource, id: string; Contenido, Respuesta: TStrings; ContentType: string = ''): integer;
     function WS_Get(Resource, id, Opciones: string; Respuesta: TStrings; ContentType: string = ''): integer;
  end;

var
  DMHubSpot : TDMHubSpot;

implementation

uses UDMMain, IdHttp, IdSSLOpenSSL;

{$R *.dfm}

procedure TDMHubSpot.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

procedure TDMHubSpot.ClearCData(aJSON: TStrings);
begin
  // Limpia el JSON
end;

function TDMHubSpot.WS_Add(Resource: string; Contenido, Respuesta: TStrings; ContentType: string): integer;
begin
  /// Crea recurso xml y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('POST', Resource, '', '', Contenido, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;

function TDMHubSpot.WS_Delete(Resource, id: string; Respuesta: TStrings; ContentType: string): integer;
begin
  /// Borra recurso con id y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('DELETE', Resource, id, '', nil, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;

function TDMHubSpot.WS_DoPost(Metodo, Resource, id, Opciones: string; Contenido, Respuesta: TStrings; aContentType: string): integer;
var
  aURL : string;

  Http : TIdHTTP;
  SSL : TIdSSLIOHandlerSocketOpenSSL;
  Resp : string;

  AContent, AResponse : TStream;

  function StringsToUTF8Stream(Strings: TStrings): TStringStream;
  var
     utf8Str : UTF8String;
  begin
     utf8Str := UTF8Encode(Strings.Text);
     Result := TStringStream.Create(utf8Str);
  end;

begin
  /// Ejemplo de conexion:
  /// curl --request POST \
  /// --url https://example.com/api/service \
  /// --header 'User-Agent: insomnia/11.3.0' \
  /// --header 'api-key: 1cf766c1-ff92-40b8-8a85-************'

  // Construyo la URL
  if WSSecureProtocol then
     aURL := 'https://'
  else
     aURL := 'http://';

  aURL := aURL + WSURL + '/' + Resource;
  if (id <> '') then
     aURL := aURL + '/' + id;

  if (Opciones > '') then
     aURL := aURL + Opciones;

  // Transmision
  Http := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

  AContent := nil;

  AResponse := TStringStream.Create('');
  try
     DMMain.LogIni('WebService');
     DMMain.Log('URL: ' + aURL);
     if Assigned(Contenido) then
        DMMain.Log('Content: ' + #13#10 + Contenido.Text);

     if Assigned(Contenido) then
     begin
        // Contenido.SaveToStream(AContent);
        if (aContentType = 'application/application/json') then
        begin
           AContent := TStringStream.Create(Contenido.Text);
           // Contenido.SaveToStream(AContent);
        end
        else
           AContent := StringsToUTF8Stream(Contenido);

        AContent.Position := 0;
     end
     else
     begin
        AContent := TStringStream.Create('');
     end;

     SSL.SSLOptions.Method := sslvTLSv1_2;   // Forzar TLS 1.2
     SSL.SSLOptions.SSLVersions := [sslvTLSv1_2];

     Http.IOHandler := SSL;
     if (aContentType = '') then
        Http.Request.ContentType := 'application/json; charset=UTF-8'
     else
        Http.Request.ContentType := aContentType; // 'application/x-www-form-urlencoded';

     // ShowMessage('Metodo:'+Metodo+#13#10+'Resource:'+Resource+#13#10+'Contenido:'+Contenido.text+#13#10+'ContentType:'+Http.Request.ContentType);

     Http.Request.CustomHeaders.Clear;
     // Variable api-key
     Http.Request.CustomHeaders.Add('api-key: ' + WSToken);
     {
     // Agregar variables de Header
     // Headers.Add('Username='+Token);
     // Headers.Add('Authorization='+Token);
     // Headers.Add('ws_key='+Token);
     // Http.Request.CustomHeaders.Add('x-version: 3.1.0');
     }

     {
     // Autenticacion mediante Token "Authorization: Bearer"
     Http.Request.CustomHeaders.Add('Authorization: Bearer ' + WSToken);
     }

     {
     // Autenticacion ásica mediante usuario y clave
     Http.Request.BasicAuthentication := True;
     Http.Request.UserName := WSUsername;
     Http.Request.Password := WSPassword;
     }

     DMMain.Log('Http. CustomHeaders: ' + #13#10 + Http.Request.CustomHeaders.Text);
     DMMain.Log('aContentType: ' + aContentType);
     DMMain.Log('ContentType: ' + Http.Request.ContentType);

     try
        if (Metodo = 'POST') then
           Resp := Http.Post(aURL, AContent);
        if (Metodo = 'GET') then
           Resp := Http.Get(aURL);
        if (Metodo = 'PUT') then
           Resp := Http.Put(aURL, AContent);
        if (Metodo = 'DELETE') then
           Resp := Http.Delete(aURL);

        Respuesta.Text := (Resp);
        Result := Http.ResponseCode;
     except
        on E: EIdHTTPProtocolException do
        begin
           // Aquí capturas los errores HTTP (400, 401, 500, etc.)
           Respuesta.Text := E.ErrorMessage;   // el body de la respuesta del servidor
           Result := E.ErrorCode;              // el código HTTP (400, 401...)
        end;
        on E: Exception do
        begin
           // Otros errores (timeout, conexión, etc.)
           Respuesta.Text := E.Message;
           Result := -1;
        end;
     end;

     DMMain.Log('ResponseCode: ' + IntToStr(Result));
     DMMain.Log('Response: ' + Respuesta.Text);
  finally
     DMMain.LogFin('');
     Http.Free;
     SSL.Free;
     AContent.Free;
     AResponse.Free;
  end;
end;

function TDMHubSpot.WS_Edit(Resource, id: string; Contenido, Respuesta: TStrings; ContentType: string): integer;
begin
  /// Modifica recurso de xml y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('PUT', Resource, id, '', Contenido, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;

function TDMHubSpot.WS_Get(Resource, id, Opciones: string; Respuesta: TStrings; ContentType: string): integer;
begin
  /// Obtiene recurso y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP
  /// Opciones : filter, display, sort, limit

  Result := WS_DoPost('GET', Resource, id, Opciones, nil, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;

function TDMHubSpot.WS_Inicializa(aURL, aToken: string; aDebug: boolean): boolean;
begin
  /// aURL debe ser la base de la URL para crear la dirección del servicio.
  /// NO DEBE TERMINAR EN "/".

  Result := True;

  WSURL := aURL;
  WSToken := aToken;
  WSDebug := aDebug;

  WSSecureProtocol := True;
  if Copy(LowerCase(WSURL), 1, 8) = 'https://' then
  begin
     WSURL := Copy(WSURL, 9, Length(WSURL));
  end
  else
  if Copy(LowerCase(WSURL), 1, 7) = 'http://' then
  begin
     WSSecureProtocol := False;
     WSURL := Copy(WSURL, 8, Length(WSURL));
  end;
end;

end.
