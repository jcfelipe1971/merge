unit UDMNet2Phone;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes;

type
  TDMNet2Phone = class(TDataModule)
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     WSSecureProtocol: boolean;
     WSURL: string;
     WSToken: string;
     function WS_DoPost(Metodo, Resource: string; Opciones: string; Contenido, Respuesta: TStrings): integer;
  public
     { Public declarations }
     function WS_Inicializa(aToken: string): boolean;
     procedure WS_click2call(Extension: integer; Telefono: string);
  end;

var
  DMNet2Phone : TDMNet2Phone;

implementation

uses UEntorno, UDMMain, IdHttp, IdMultipartFormData, IdSSLOpenSSL, WinInet, HttpConnectionWinInet, Dialogs;

{$R *.dfm}

{ TDMNet2Phone }

procedure TDMNet2Phone.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

function TDMNet2Phone.WS_DoPost(Metodo, Resource: string; Opciones: string; Contenido, Respuesta: TStrings): integer;
var
  aURL : string;

  HttpConnectionWinInet : THttpConnectionWinInet;
  AContent, AResponse : TStream;
begin
  // Construyo la URL
  if WSSecureProtocol then
     aURL := 'https://'
  else
     aURL := 'http://';
  aURL := aURL + WSURL;
  aURL := aURL + Resource;

  // Paso Token como parametro ('&token =' + WSToken)
  if (Opciones = '') then
     Opciones := '?'
  else
     Opciones := Opciones + '&';
  Opciones := Opciones + format('token=%s', [WSToken]);

  if (Opciones > '') then
     aURL := aURL + Opciones;

  // Transmision
  HttpConnectionWinInet := THttpConnectionWinInet.Create;
  AContent := TStringStream.Create('');
  AResponse := TStringStream.Create('');
  try
     DMMain.LogIni('WebService');
     try
        DMMain.Log('    Metodo: ' + Metodo);
        DMMain.Log('       URL: ' + aURL);
        if Assigned(Contenido) then
           DMMain.Log('   Content: ' + Contenido.Text);
     finally
        DMMain.LogFin('');
     end;

     if Assigned(Contenido) then
        Contenido.SaveToStream(AContent);

     with HttpConnectionWinInet do
     begin
        // Lo paso como parametro ('&token =' + WSToken)
        // Headers.Add('Authorization=Bearer ' + WSToken);

        Headers.Add('Accept=*/*');
        Headers.Add('Content-Type=application/x-www-form-urlencoded');
        if Assigned(Contenido) then
           Headers.Add('ContentLength=' + IntToStr(Length(Contenido.Text)));

        // AcceptCharSet := 'ISO-8859-1, *;q=0.8';
        // ContentType := 'application/x-www-form-urlencoded';

        if (Metodo = 'POST') then
           Post(aURL, AContent, AResponse);
        if (Metodo = 'GET') then
           Get(aURL, AResponse);
        if (Metodo = 'PUT') then
           Put(aURL, AContent, AResponse);
        if (Metodo = 'DELETE') then
           Delete(aURL, AContent, AResponse);

        Result := GetResponseCode;
     end;

     if Assigned(Respuesta) then
     begin
        AResponse.Position := 0;
        Respuesta.LoadFromStream(AResponse);
     end;

     {$IFDEF Debug}
       DMMain.Log('------------------------------------------------------------');
       DMMain.Log('Metodo: ' + Metodo);
       DMMain.Log('Resource: ' + Resource);
       DMMain.Log('Opciones: ' + Opciones);
       DMMain.Log('Headers:' + #13#10+ HttpConnectionWinInet.Headers.Text);
       DMMain.Log('URL: ' + aURL);
       if Assigned(Contenido) then
          DMMain.Log('Contenido: ' + Contenido.Text);
       DMMain.Log('Respuesta: ' + IntToStr(Result));
       DMMain.Log(Respuesta.Text);
     {$ENDIF}
  finally
     HttpConnectionWinInet.Free;
     AContent.Free;
     AResponse.Free;
  end;
end;

function TDMNet2Phone.WS_Inicializa(aToken: string): boolean;
var
  aURL : string;
begin
  /// curl: curl --request GET \
  /// --url https://net2phone-api.net2phone.es/v1/click2call?origen=204&destino=666111222 \
  /// --header Authorization: Bearer
  /// eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoiY2xpY2syY2FsbCIsImNvbnRleHQiOiIwOTQzIiwiZXhwIjo4ODAyNTYxMjM5OSwicHdkIjoiNUg0Tjk2bmt1dlFMYUFUIn0.SzR9Mnkf3n4MXTftn5TePuKAomCZpI684mAKNCp8GsI

  /// URL : https://net2phone-api.net2phone.es/v1/
  /// Token : eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoiY2xpY2syY2FsbCIsImNvbnRleHQiOiIwOTQzIiwiZXhwIjo4ODAyNTYxMjM5OSwicHdkIjoiNUg0Tjk2bmt1dlFMYUFUIn0.SzR9Mnkf3n4MXTftn5TePuKAomCZpI684mAKNCp8GsI

  aURL := 'https://net2phone-api.net2phone.es/v1/';

  // Quito protocolo delante de la direccion
  WSSecureProtocol := False;
  if (Pos('https://', aURL) > 0) then
  begin
     WSURL := Copy(aURL, 9, Length(aURL));
     WSSecureProtocol := True;
  end
  else
  if (Pos('http://', aURL) > 0) then
     WSURL := Copy(aURL, 8, Length(aURL))
  else
     WSURL := aURL;

  WSToken := aToken;

  Result := True;
end;

procedure TDMNet2Phone.WS_click2call(Extension: integer; Telefono: string);
var
  Resultado : integer;
  Respuesta : TStrings;
begin
  DMMain.Log('Click 2 Call');
  DMMain.LogIni(format('Extension: %d. Telefono:%s.', [Extension, Telefono]));
  Respuesta := TStringList.Create;
  try
     Resultado := WS_DoPost('GET', 'click2call', format('?origen=%d&destino=%s', [Extension, Telefono]), nil, Respuesta);

     if (Resultado <> 200) then
        ShowMessage(_('No se ha podido realizar la peticion de llamada') + #13 + #10 + Respuesta.Text);

     DMMain.LogFin('Respuesta :' + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
  end;
end;

end.
