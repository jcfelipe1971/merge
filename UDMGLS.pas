unit UDMGLS;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes;

type
  TDMGLS = class(TDataModule)
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     WSSecureProtocol: boolean;
     WSURL: string;
     WSGUID: string;
     WSDebug: boolean;

     //procedure ClearCData(aXML: TStrings);
     function WS_DoPost(Metodo, Resource: string; Contenido, Respuesta: TStrings): integer;
  public
     { Public declarations }
     procedure WS_Inicializa(aURL, GUID: string; aDebug: boolean);
     function WS_Post(Resource: string; xml, Respuesta: TStrings): integer;
    {
    function WS_Add(Resource: string; xml, Respuesta: TStrings): integer;
    function WS_Get(Resource: string; id: integer; Opciones: string; Respuesta: TStrings): integer;
    function WS_Edit(Resource: string; id: integer; xml, Respuesta: TStrings): integer;
    function WS_Delete(Resource: string; id: integer; Respuesta: TStrings): integer;
    }
  end;

var
  DMGLS : TDMGLS;

implementation

uses {$IFDEF Debug} UFMPruebas, {$ENDIF} UDMMain, UUtiles, IdHttp, IdMultipartFormData, IdSSLOpenSSL, WinInet, HttpConnectionWinInet;

{$R *.dfm}

procedure TDMGLS.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  /// La definicion está en https://alb.idril.es:8443/Wsintegracion.asmx?wsdl

  // Datos para utilizar con KOMBATPADEL
  { TODO : Parametrizar }
  WS_Inicializa('https://alb.idril.es:8443/Wsintegracion', '5D405075-D828-4994-B935-4CF9CF825885', True {WSDebug});
end;

procedure TDMGLS.WS_Inicializa(aURL, GUID: string; aDebug: boolean);
begin
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

  WSGUID := GUID;

  WSDebug := aDebug;
end;

function TDMGLS.WS_DoPost(Metodo, Resource: string; Contenido, Respuesta: TStrings): integer;
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

  aURL := aURL + WSURL + '/' + Resource;

  // Transmision
  HttpConnectionWinInet := THttpConnectionWinInet.Create;
  AContent := TStringStream.Create('');
  AResponse := TStringStream.Create('');
  try
     DMMain.LogIni('WebService');
     try
        DMMain.Log('Metodo: ' + Metodo);
        DMMain.Log('URL: ' + aURL);
        if Assigned(Contenido) then
           DMMain.Log('Content: ' + Contenido.Text);

        if Assigned(Contenido) then
           Contenido.SaveToStream(AContent);

        with HttpConnectionWinInet do
        begin
           {
           BasicAuthentication_UserName := WSKey;
           BasicAuthentication_Password := '';
           }
           // Headers.Add('Username='+Token);
           // Headers.Add('Authorization='+Token);
           // Headers.Add('ws_key='+Token);

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
        DMMain.Log('ResponseCode: ' + IntToStr(Result));
     finally
        DMMain.LogFin('');
     end;

     if WSDebug then
        Respuesta.SaveToFile(DameTempPath + 'Respuesta-' + Metodo + '-' + Resource + '.xml');

     {$IFDEF Debug}
     if Assigned(FMPruebas) then
     begin
       FMPruebas.Log('------------------------------------------------------------');
       FMPruebas.Log('Metodo: ' + Metodo);
       FMPruebas.Log('Resource: ' + Resource);
       FMPruebas.Log('URL: ' + aURL);
       if Assigned(Contenido) then
          FMPruebas.Log('Contenido: ' + Contenido.Text);
       FMPruebas.Log('ResponseCode: ' + IntToStr(Result));
       FMPruebas.Log(Respuesta.Text);
     end;
     {$ENDIF}
  finally
     HttpConnectionWinInet.Free;
     AContent.Free;
     AResponse.Free;
  end;
end;

{
procedure TDMGLS.ClearCData(aXML: TStrings);
var
  pi, pf : integer;
  x, s, r : string;
begin
  x := aXML.Text;
  r := '';

  pi := Pos('<![CDATA[', x);
  pf := Pos(']]>', x);
  while ((pi > 0) and (pf > 0)) do
  begin
     // Lo que está dentro de CDATA
     s := Copy(x, pi + 9, pf - pi - 9);

     // Limpio caracteres no validos dentro de un XML
     s := StringReplace(s, '&', '&amp;', [rfReplaceAll]);
     s := StringReplace(s, '<', '&lt;', [rfReplaceAll]);
     s := StringReplace(s, '>', '&gt;', [rfReplaceAll]);

     // Acumulo respuesta
     r := r + Copy(x, 1, pi - 1) + s;

     // Tomo el resto para seguir verificando
     x := Copy(x, pf + 3, Length(x));

     pi := Pos('<![CDATA[', x);
     pf := Pos(']]>', x);
  end;

  aXML.Text := r + x;
end;
}
{
function TDMGLS.WS_Add(Resource: string; xml, Respuesta: TStrings): integer;
begin
  /// Crea recurso xml y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('POST', Resource, xml, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;

function TDMGLS.WS_Delete(Resource: string; id: integer; Respuesta: TStrings): integer;
begin
  /// Borra recurso con id y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('DELETE', Resource, nil, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;

function TDMGLS.WS_Edit(Resource: string; id: integer; xml, Respuesta: TStrings): integer;
begin
  /// Modifica recurso de xml y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('PUT', Resource, xml, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;

function TDMGLS.WS_Get(Resource: string; id: integer; Opciones: string; Respuesta: TStrings): integer;
begin
  /// Obtiene recurso y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP
  /// Opciones : filter, display, sort, limit

  Result := WS_DoPost('GET', Resource, nil, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;
}

function TDMGLS.WS_Post(Resource: string; xml, Respuesta: TStrings): integer;
begin
  Result := WS_DoPost('POST', Resource, xml, Respuesta);
end;

end.
