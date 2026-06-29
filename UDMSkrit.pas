unit UDMSkrit;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes;

type
  TDMSkrit = class(TDataModule)
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     WSSecureProtocol: boolean;
     WSURL: string;
     WSKey: string;
     WSAssociate: string;
     WSClient: string;
     WSDebug: boolean;
     // function WS_Get(aURL, Token: string): string;
     procedure ClearCData(aJSON: TStrings);
     function WS_DoPost(Metodo, Resource: string; id: string; Opciones: string; Contenido, Respuesta: TStrings): integer;
  public
     { Public declarations }
     // Webservice
     function WS_Inicializa(aURL, aKey, aAssociate, aClient: string; aDebug: boolean): boolean;
     function WS_Add(Resource: string; json, Respuesta: TStrings): integer;
     function WS_Get(Resource: string; id: string; Opciones: string; Respuesta: TStrings): integer;
     function WS_Edit(Resource: string; id: string; json, Respuesta: TStrings): integer;
     function WS_Delete(Resource: string; id: string; Respuesta: TStrings): integer;
  end;

var
  DMSkrit : TDMSkrit;

implementation

uses UEntorno, UDMMain, UDMSincronizacion, UUtiles, UParam, IdHttp,
  IdMultipartFormData, IdSSLOpenSSL, WinInet, HttpConnectionWinInet,
  UFMPruebas;

{$R *.dfm}

procedure TDMSkrit.ClearCData(aJSON: TStrings);
begin
  // Limpia el JSON
end;

procedure TDMSkrit.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

function TDMSkrit.WS_Add(Resource: string; json, Respuesta: TStrings): integer;
begin
  /// Crea recurso xml y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('POST', Resource, '', '', json, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;

function TDMSkrit.WS_Delete(Resource: string; id: string; Respuesta: TStrings): integer;
begin
  /// Borra recurso con id y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('DELETE', Resource, id, '', nil, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;

function TDMSkrit.WS_DoPost(Metodo, Resource: string; id: string; Opciones: string; Contenido, Respuesta: TStrings): integer;
var
  aURL : string;

  HttpConnectionWinInet : THttpConnectionWinInet;
  AContent, AResponse : TStream;
begin
  /// Ejemplo de conexion:
  /// Albaranes entre fechas
  /// curl -X 'GET' \
  ///  'https://api.erp.skrit.ws/v1/HER/deliveryNotes/client/3538?from=2025-03-14&to=2025-03-14' \
  ///  -H 'accept: application/json' \
  ///  -H 'Authorization: Bearer 6D333128-D2D6-4814-ADFF-F0BBC4151CAF-9B06F069-A2BC-4324-8422-762440C5DED3'

  /// Detalles de un albaran
  /// curl -X 'GET' \
  ///   'https://api.erp.skrit.ws/v1/HER/deliveryNotes/client/3538/202500000000010' \
  ///   -H 'accept: application/json' \
  ///   -H 'Authorization: Bearer 6D333128-D2D6-4814-ADFF-F0BBC4151CAF-9B06F069-A2BC-4324-8422-762440C5DED3'

  // Construyo la URL
  if WSSecureProtocol then
     aURL := 'https://'
  else
     aURL := 'http://';

  aURL := aURL + WSURL + '/v1/' + WSAssociate + '/' + Resource + '/client/' + WSClient;
  if (id <> '') then
     aURL := aURL + '/' + id;

  if (Opciones > '') then
     aURL := aURL + Opciones;

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
           BasicAuthentication_UserName := 'VCVAutomocion';
           BasicAuthentication_Password := '';

           // Headers.Add('Username='+Token);
           // Headers.Add('Authorization='+Token);
           // Headers.Add('ws_key='+Token);
           Headers.Add('Accept=application/json');
           Headers.Add('Authorization=Bearer ' + WSKey);

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

     {$IFDEF Debug}
     if Assigned(FMPruebas) then
     begin
       FMPruebas.Log('------------------------------------------------------------');
       FMPruebas.Log('Metodo: ' + Metodo);
       FMPruebas.Log('Resource: ' + Resource);
       FMPruebas.Log('id: ' + id);
       FMPruebas.Log('Opciones: ' + Opciones);
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

function TDMSkrit.WS_Edit(Resource: string; id: string; json, Respuesta: TStrings): integer;
begin
  /// Modifica recurso de xml y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('PUT', Resource, id, '', json, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;

function TDMSkrit.WS_Get(Resource: string; id: string; Opciones: string; Respuesta: TStrings): integer;
begin
  /// Obtiene recurso y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP
  /// Opciones : filter, display, sort, limit

  Result := WS_DoPost('GET', Resource, id, Opciones, nil, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;

function TDMSkrit.WS_Inicializa(aURL, aKey, aAssociate, aClient: string; aDebug: boolean): boolean;
begin
  Result := True;

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

  WSKey := aKey;
  WSAssociate := aAssociate;
  WSClient := aClient;
  WSDebug := aDebug;

  (*
  // Inicializacion correcta si se puede realizar conexión y obtener recursos habilitados
  try
     Result := (WS_GetResources = 200);

  except
     Result := False;
  end;
  *)
end;

end.
