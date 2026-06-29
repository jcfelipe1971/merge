unit UDMSMSPubli;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados;

type
  TDMSMSPubli = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xSMSPubliConfig: TFIBTableSet;
     DSxSMSPubliConfig: TDataSource;
     xSMSPubliMensajes: TFIBTableSet;
     DSxSMSPubliMensajes: TDataSource;
     xSMSPubliConfigEMPRESA: TIntegerField;
     xSMSPubliConfigCANAL: TIntegerField;
     xSMSPubliConfigAPIKEY: TFIBStringField;
     xSMSPubliConfigREPORT_URL: TFIBStringField;
     xSMSPubliConfigMESSAGE_FROM: TFIBStringField;
     xSMSPubliMensajesID: TIntegerField;
     xSMSPubliMensajesEMPRESA: TIntegerField;
     xSMSPubliMensajesCANAL: TIntegerField;
     xSMSPubliMensajesMESSAGE_FROM: TFIBStringField;
     xSMSPubliMensajesMESSAGE_TO: TFIBStringField;
     xSMSPubliMensajesMESSAGE_TEXT: TFIBStringField;
     xSMSPubliMensajesMESSAGE_CUSTOM: TFIBStringField;
     xSMSPubliMensajesMESSAGE_SEND_AT: TDateTimeField;
     xSMSPubliMensajesREPORT_URL: TFIBStringField;
     xSMSPubliMensajesCONCAT: TIntegerField;
     xSMSPubliMensajesENCODING: TFIBStringField;
     xSMSPubliMensajesFAKE: TIntegerField;
     xSMSPubliMensajesRESPONSE_STATUS: TFIBStringField;
     xSMSPubliMensajesRESPONSE_SMS_ID: TFIBStringField;
     xSMSPubliMensajesRESPONSE_CUSTOM: TFIBStringField;
     xSMSPubliConfigCONCAT: TIntegerField;
     xSMSPubliConfigENCODING: TFIBStringField;
     procedure xSMSPubliConfigNewRecord(DataSet: TDataSet);
     procedure xSMSPubliMensajesNewRecord(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     WSSecureProtocol: boolean;
     WSURL: string;
     procedure ClearCData(aJSON: TStrings);
     function WS_DoPost(Metodo, Resource, id, Opciones: string; Contenido, Respuesta: TStrings; aContentType: string = ''): integer;
     function WS_Add(Resource: string; json, Respuesta: TStrings; ContentType: string = ''): integer;
     (*
     function WS_Delete(Resource, id: string; Respuesta: TStrings; ContentType: string = ''): integer;
     function WS_Edit(Resource, id: string; json, Respuesta: TStrings; ContentType: string = ''): integer;
     function WS_Get(Resource, id, Opciones: string; Respuesta: TStrings; ContentType: string = ''): integer;
     *)
  public
     { Public declarations }
     procedure AbrirMensajes;
     procedure CerrarMensajes;
     procedure NuevoMensaje(Destinatario, TextoMensaje: string; SendAt: TDateTime; Custom: string = '');
     function Enviar(Fake: boolean = False): boolean;
  end;

var
  DMSMSPubli : TDMSMSPubli;

implementation

uses UDMMain, UEntorno, HYFIBQuery, IdHttp, IdSSLOpenSSL, UUtiles, DateUtils, Dialogs, uLkJSON;

{$R *.dfm}

(*
Endpoint
--------
https://api.gateway360.com/api/3.0/sms


CURL example
------------
curl -X POST \
 -H 'Content-Type: application/json' \
 -H 'Accept: application/json' \
 -d '{
    "api_key":"399d2b438a53ebed3db8a7d52107f846",
    "report_url":"http://yourserver.com/callback/script",
    "concat":1,
    "messages":[
        {
            "from":"GOOD PIZZA",
            "to":"34666666111",
            "text":"Hi John, today 2x1 in pizzas, watch the game like a boss with our new pepperoni pizza!",
            "send_at":"2018-02-18 17:30:00"
        },
        {
            "from":"GOOD PIZZA",
            "to":"34666666112",
            "text":"Hi Maria, , today 2x1 in pizzas, watch the game like a boss with our new pepperoni pizza!",
            "custom":"MyMsgID-12345",
            "send_at":"2018-02-18 17:30:00"
        }
    ]
}' https://api.gateway360.com/api/3.0/sms/send


Parameters
----------
api_key         Mandatory - Your API Key.
messages        Array of messages you want to send.
    from        Mandatory - Originator address (sender). Up to 15 numeric or 11 alphanumeric characters. All characters non-ASCII will be replaced with its equivalent if exist any (á => a), empty in another case.
    to          Mandatory - Destination mobile number in international format. Country code must be included.Ex: to=447525812121 when sending to UK.
    text        Mandatory - Body of the text message (with a maximum length of 459 characters)
    custom      Optional - Include any reference string for your reference. Useful for your internal reports. Maximum 32 alphanumeric characters.
    send_at     Optional - When this message should be sent as timestamp in YYYY-MM-DD HH:MM:SS format. If you specify a time in the past, the message will be sent immediately.
report_url      Optional - URL where you want to receive the delivery report (DLR).
concat          Optional - Set to 1 if you want to allow concatenated messages (more than 160 characters). If concat is 0 (or it's not present) only first 160 chars will be sent.
encoding        Optional - Set to UCS2 if you want to send messages UCS2 (70 Unicode characters per SMS) with accents, emoticons and special characters. If encoding is GSM7 (or it's not present) the SMS will be treated as GSM7 (160 non Unicode characters per SMS). The Unicode encoding is only applicable to the text of message.
fake            Optional - Set to 1 if you want to simulate submitting messages, it's perfect for testing and debugging, it has no cost.


Response
--------
200 OK
{
    "status":"ok",
    "result":[
        {
            "status":"ok",
            "sms_id":"1a8940dc7471427db3021cde5b464444",
            "custom":"test"
        },
        {
            "status":"ok",
            "sms_id":"1a8940dc7471427db3021cde5b464481",
            "custom":""
        }
    ]
}


Errors
------
Error ID                Explanation
INVALID_CONTENT_TYPE    The content type must be: Content-Type: application/json
JSON_PARSE_ERROR        Your JSON was formatted incorrectly or was considered otherwise improper or incomplete. Check it here.
MISSING_PARAMS          Your request is incomplete and missing some mandatory parameters.
BAD_PARAMS              One or more of your parameters has incorrect format or value.
UNAUTHORIZED            Your API key may be invalid, double-check that your API key was input correctly or see if the IP is blocked in your account API settings.
INVALID_SENDER          The sender address (from parameter) was not allowed for this message.
INVALID_DESTINATION     Our Gateway was unable to process your destination. The number must be in MSISDN format. Check format here.
INVALID_TEXT            The field was empty or is corrupt.
INVALID_DATETIME        The format we were expecting was: YYYY-MM-DD HH:MM:SS
NOT_ENOUGH_BALANCE      Your account has no funds to process this request, add credits to your account and try again.
LIMIT_EXCEEDED          Your request has exceeded the maximum of 1000 sms requests per batch.


Opt out
-------
You can automatically add the unsubscription URL to your SMS.
You only need to add {STOP} tag to the text of your SMS and it will be replaced with your unique unsubscription URL.

*)

procedure TDMSMSPubli.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  AsignaDisplayFormat(xSMSPubliConfig, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xSMSPubliMensajes, MascaraN, MascaraI, ShortDateFormat + ' hh:nn:ss');

  with xSMSPubliConfig do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;

  WSSecureProtocol := True;
  WSURL := 'api.gateway360.com/api/3.0/sms';
end;

procedure TDMSMSPubli.DataModuleDestroy(Sender: TObject);
begin
  xSMSPubliConfig.Close;
end;

procedure TDMSMSPubli.xSMSPubliConfigNewRecord(DataSet: TDataSet);
begin
  xSMSPubliConfigEMPRESA.AsInteger := REntorno.Empresa;
  xSMSPubliConfigCANAL.AsInteger := REntorno.Canal;
end;

procedure TDMSMSPubli.xSMSPubliMensajesNewRecord(DataSet: TDataSet);
begin
  xSMSPubliMensajesEMPRESA.AsInteger := xSMSPubliConfigEMPRESA.AsInteger;
  xSMSPubliMensajesCANAL.AsInteger := xSMSPubliConfigCANAL.AsInteger;
  xSMSPubliMensajesMESSAGE_FROM.AsString := xSMSPubliConfigMESSAGE_FROM.AsString;
  xSMSPubliMensajesREPORT_URL.AsString := xSMSPubliConfigREPORT_URL.AsString;
  xSMSPubliMensajesMESSAGE_SEND_AT.AsDateTime := Now;
end;

procedure TDMSMSPubli.AbrirMensajes;
begin
  xSMSPubliMensajes.Open;
end;


procedure TDMSMSPubli.CerrarMensajes;
begin
  xSMSPubliMensajes.Close;
end;

procedure TDMSMSPubli.ClearCData(aJSON: TStrings);
begin
  // Limpia el JSON
end;

function TDMSMSPubli.WS_DoPost(Metodo, Resource, id, Opciones: string; Contenido, Respuesta: TStrings; aContentType: string = ''): integer;
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
  /// Obtencion de Token
  /// curl --request POST \
  ///   --url 'https://servicios.api.seur.io/pic_token?=' \
  ///   --header 'Content-Type: application/x-www-form-urlencoded' \
  ///   --header 'User-Agent: insomnia/11.3.0' \
  ///   --cookie '8a001cb98b95ca7ca8dee5d504821ceb=7730895fe6bb66a4038667406c71b91b; visid_incap_2392811=M6QZHrQ7SXKkQdqpq5lsRMw8r2gAAAAAQUIPAAAAAACpJGz6ewM4wkqhqZ8kKgZx; incap_ses_250_2392811=Dr82dTqe5SxFFRCSIS54A8w8r2gAAAAA8rNwNdQXoC%2FsvEKK32aeEQ%3D%3D' \
  ///   --data grant_type=password \
  ///   --data client_id=bbfeb31f \
  ///   --data client_secret=d7d5c79ef36c184e10b324e99260bc6a \
  ///   --data username=knNGHN9 \
  ///   --data password=FRG4TwfQm10d

  /// Resto de llamadas
  /// curl --request GET \
  ///   --url 'https://servicios.api.seur.io/pic/v1/cities?countryCode=ES&postalCode=01117' \
  ///   --header 'Authorization: Bearer eyJh ... wvKFQ' \

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
  // AContent := TStringStream.Create('');
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
        if (aContentType = 'application/x-www-form-urlencoded') then
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

     SSL.SSLOptions.Method := sslvSSLv23;
     SSL.SSLOptions.SSLVersions := [sslvSSLv2, sslvSSLv3, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
     {
     SSL.SSLOptions.Method := sslvTLSv1_2;   // Forzar TLS 1.2
     SSL.SSLOptions.SSLVersions := [sslvTLSv1_2];
     }
     {
     SSL.SSLOptions.Method := sslvSSLv23;
     SSL.SSLOptions.SSLVersions := [sslvSSLv2,sslvSSLv3,sslvTLSv1,sslvTLSv1_1,sslvTLSv1_2];
     SSL.SSLOptions.Mode := sslmServer;
     SSL.SSLOptions.VerifyDepth := 0;
     SSL.SSLOptions.VerifyMode := [];
     }
     Http.IOHandler := SSL;
     if (aContentType = '') then
        Http.Request.ContentType := 'application/json' // +'; charset=UTF-8'
     else
        Http.Request.ContentType := aContentType; // 'application/x-www-form-urlencoded';

     // ShowMessage('Metodo:'+Metodo+#13#10+'Resource:'+Resource+#13#10+'Contenido:'+Contenido.text+#13#10+'ContentType:'+Http.Request.ContentType);

     {
     Http.Request.CustomHeaders.Clear;
     Http.Request.CustomHeaders.Add('Authorization: Bearer ' + WSToken);
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

function TDMSMSPubli.WS_Add(Resource: string; json, Respuesta: TStrings; ContentType: string = ''): integer;
begin
  /// Crea recurso xml y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('POST', Resource, '', '', json, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;

(*
function TDMSMSPubli.WS_Delete(Resource: string; id: string; Respuesta: TStrings; ContentType: string = ''): integer;
begin
  /// Borra recurso con id y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('DELETE', Resource, id, '', nil, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;

function TDMSMSPubli.WS_Edit(Resource: string; id: string; json, Respuesta: TStrings; ContentType: string = ''): integer;
begin
  /// Modifica recurso de xml y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('PUT', Resource, id, '', json, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;

function TDMSMSPubli.WS_Get(Resource: string; id: string; Opciones: string; Respuesta: TStrings; ContentType: string = ''): integer;
begin
  /// Obtiene recurso y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP
  /// Opciones : filter, display, sort, limit

  Result := WS_DoPost('GET', Resource, id, Opciones, nil, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;
*)

procedure TDMSMSPubli.NuevoMensaje(Destinatario, TextoMensaje: string; SendAt: TDateTime; Custom: string = '');
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO SMSPUBLI_MENSAJES ( ');
        SQL.Add(' EMPRESA, CANAL, MESSAGE_TO, MESSAGE_TEXT, MESSAGE_CUSTOM, MESSAGE_SEND_AT) ');
        SQL.Add(' VALUES ( ');
        SQL.Add(' :EMPRESA, :CANAL, :MESSAGE_TO, :MESSAGE_TEXT, :MESSAGE_CUSTOM, :MESSAGE_SEND_AT) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['MESSAGE_TO'].AsString := Destinatario;
        Params.ByName['MESSAGE_TEXT'].AsString := TextoMensaje;
        Params.ByName['MESSAGE_CUSTOM'].AsString := Custom;
        Params.ByName['MESSAGE_SEND_AT'].AsDateTime := SendAt;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMSMSPubli.Enviar(Fake: boolean = False): boolean;
var
  Envio : TlkJSONobject;
  ListaMensajes : TlkJSONlist;
  Mensaje : TlkJSONobject;
  jSONRespuesta : TlkJSONObject;
  JSONArray : TlkJSONList;
  Nodo : TlkJSONBase;
  i, id : integer;
  jSON, Respuesta : TStrings;
  Resultado : integer;
  status : string;
  error_id, error_msg : string;
  result_sms_id, result_custom : string;
  result_error_id, result_error_msg : string;
begin
  Result := True;

  jSON := TStringList.Create;
  Respuesta := TStringList.Create;
  Envio := TlkJSONobject.Create;
  try
     Envio.Add('api_key', xSMSPubliConfigAPIKEY.AsString);

     if (xSMSPubliConfigREPORT_URL.AsString <> '') then
        Envio.Add('report_url', xSMSPubliConfigREPORT_URL.AsString);

     if (xSMSPubliConfigCONCAT.AsString <> '') then
        Envio.Add('concat', xSMSPubliConfigCONCAT.AsString);

     if (xSMSPubliConfigENCODING.AsString <> '') then
        Envio.Add('encoding', xSMSPubliConfigENCODING.AsString);

     if (Fake) then
        Envio.Add('fake', 1);

     // Recorro los mensajes que no tiene status
     ListaMensajes := TlkJSONlist.Create;

     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add(' SELECT ID, MESSAGE_TO, MESSAGE_TEXT, MESSAGE_CUSTOM, MESSAGE_SEND_AT ');
              SelectSQL.Add(' FROM SMSPUBLI_MENSAJES ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
              SelectSQL.Add(' CANAL = :CANAL AND ');
              SelectSQL.Add(' RESPONSE_STATUS = '''' ');
              SelectSQL.Add(' ORDER BY ID ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Open;
              while not EOF do
              begin
                 id := FieldByName('ID').AsInteger;

                 // Crear el objeto mensaje
                 Mensaje := TlkJSONobject.Create;
                 Mensaje.Add('from', xSMSPubliConfigMESSAGE_FROM.AsString);
                 Mensaje.Add('to', FieldByName('MESSAGE_TO').AsString);
                 Mensaje.Add('text', FieldByName('MESSAGE_TEXT').AsString);

                 { Utilizare CUSTOM para identificar los mensajes enviados
                 if (FieldByName('MESSAGE_CUSTOM').AsString <> '') then
                    Mensaje.Add('custom', FieldByName('MESSAGE_CUSTOM').AsString);
                 }
                 Mensaje.Add('custom', IntToStr(id));

                 if (FieldByName('MESSAGE_SEND_AT').AsDateTime > Now) then
                    Mensaje.Add('send_at', FormatDateTime('yyyy-mm-dd hh:nn:ss', FieldByName('MESSAGE_SEND_AT').AsDateTime))
                 else
                    Mensaje.Add('send_at', FormatDateTime('yyyy-mm-dd hh:nn:ss', Now));

                 // Agregar al array
                 ListaMensajes.Add(Mensaje);

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

     Envio.Add('messages', ListaMensajes);

     jSON.Add(TlkJSON.GenerateText(Envio));

     jSON.SaveToFile(DameTempPath + Format('smspubli_Envio_%s.log', [FormatDateTime('yyyymmdd_hhnnss', Now)]));
     Resultado := WS_Add('send', jSON, Respuesta);
     Respuesta.SaveToFile(DameTempPath + Format('smspubli_Envio_Respuesta_%d_%s.log', [Resultado, FormatDateTime('yyyymmdd_hhnnss', Now)]));

     try
        jSONRespuesta := TlkJSON.ParseText(Respuesta.Text) as TlkJSONObject;
        try
           if Assigned(jSONRespuesta) then
           begin
              Nodo := jSONRespuesta.Field['status'];
              if Assigned(Nodo) then
              begin
                 Nodo := Nodo.Field['status'];
                 if (Nodo is TlkJSONstring) then
                    status := Nodo.Value;
              end;

              // Status = "ok" / "error"
              if (status = 'ok') then
              begin
                 JSONArray := TlkJSONList(jSONRespuesta.Field['result']);
                 if Assigned(JSONArray) then
                 begin
                    for i := 0 to JSONArray.Count - 1 do
                    begin
                       result_sms_id := '';
                       result_custom := '';
                       result_error_id := '';
                       result_error_msg := '';

                       Nodo := TlkJSONObject(JSONArray.Child[i]).Field['status'];
                       if Assigned(Nodo) then
                          status := Nodo.Value;

                       if (status = 'ok') then
                       begin
                          Nodo := TlkJSONObject(JSONArray.Child[i]).Field['sms_id'];
                          if Assigned(Nodo) then
                             result_sms_id := Nodo.Value;

                          Nodo := TlkJSONObject(JSONArray.Child[i]).Field['custom'];
                          if Assigned(Nodo) then
                             result_custom := Nodo.Value;

                          // UPDATE al mensaje con este custom con el Status + SMS_ID
                       end
                       else
                       begin
                          Result := False;

                          Nodo := TlkJSONObject(JSONArray.Child[i]).Field['error_id'];
                          if Assigned(Nodo) then
                             result_error_id := Nodo.Value;

                          Nodo := TlkJSONObject(JSONArray.Child[i]).Field['error_msg'];
                          if Assigned(Nodo) then
                             result_error_msg := Nodo.Value;

                          Nodo := TlkJSONObject(JSONArray.Child[i]).Field['custom'];
                          if Assigned(Nodo) then
                             result_custom := Nodo.Value;
                       end;

                       // UPDATE al mensaje con este custom con el Status + ERROR_ID + ERROR_MSG
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' UPDATE SMSPUBLI_MENSAJES ');
                             SQL.Add(' SET ');
                             SQL.Add(' MESSAGE_FROM = :MESSAGE_FROM, ');
                             SQL.Add(' REPORT_URL = :REPORT_URL, ');
                             SQL.Add(' CONCAT = :CONCAT, ');
                             SQL.Add(' ENCODING = :ENCODING, ');
                             SQL.Add(' FAKE = :FAKE, ');
                             SQL.Add(' RESPONSE_STATUS = :RESPONSE_STATUS, ');
                             SQL.Add(' RESPONSE_SMS_ID = :RESPONSE_SMS_ID, ');
                             SQL.Add(' RESPONSE_ERROR_ID = :RESPONSE_ERROR_ID, ');
                             SQL.Add(' RESPONSE_ERROR_MSG = :RESPONSE_ERROR_MSG, ');
                             SQL.Add(' RESPONSE_CUSTOM = :RESPONSE_CUSTOM ');
                             SQL.Add(' WHERE ');
                             SQL.Add(' ID = :ID ');
                             Params.ByName['ID'].AsInteger := StrToIntDef(result_custom, 0);
                             Params.ByName['MESSAGE_FROM'].AsString := xSMSPubliConfigMESSAGE_FROM.AsString;
                             Params.ByName['REPORT_URL'].AsString := xSMSPubliConfigREPORT_URL.AsString;
                             Params.ByName['CONCAT'].AsInteger := xSMSPubliConfigCONCAT.AsInteger;
                             Params.ByName['ENCODING'].AsString := xSMSPubliConfigENCODING.AsString;
                             Params.ByName['FAKE'].AsInteger := BoolToInt(Fake);
                             Params.ByName['RESPONSE_STATUS'].AsString := status;
                             Params.ByName['RESPONSE_SMS_ID'].AsString := result_sms_id;
                             Params.ByName['RESPONSE_ERROR_ID'].AsString := result_error_id;
                             Params.ByName['RESPONSE_ERROR_MSG'].AsString := result_error_msg;
                             Params.ByName['RESPONSE_CUSTOM'].AsString := result_custom;
                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;
                    end;
                 end;
              end
              else
              begin
                 Result := False;

                 Nodo := jSONRespuesta.Field['error_id'];
                 if Assigned(Nodo) then
                 begin
                    Nodo := Nodo.Field['error_id'];
                    if (Nodo is TlkJSONstring) then
                       error_id := Nodo.Value;
                 end;

                 Nodo := jSONRespuesta.Field['error_msg'];
                 if Assigned(Nodo) then
                 begin
                    Nodo := Nodo.Field['error_msg'];
                    if (Nodo is TlkJSONstring) then
                       error_msg := Nodo.Value;
                 end;

                 // UPDATE a todos los mensajes con este mensaje de error
                 // O mostrar error por pantalla
                 ShowMessage(_('Error al enviar SMS') + #13#10 + format('ID: %s' + #13#10 + 'Error: %s', [error_id, error_msg]));
              end;
           end;
        finally
           jSONRespuesta.Free
        end;
     except
        on e: Exception do
           ShowMessage(_('Error al enviar SMS') + #13#10 + Respuesta.Text + #13#10 + E.Message);
     end;
  finally
     Envio.Free;
     jSON.Free;
     Respuesta.Free;
  end;
end;

end.
