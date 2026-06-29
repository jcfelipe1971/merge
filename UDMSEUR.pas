unit UDMSEUR;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, uLkJSON;

type
  TDMSEUR = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xSEURTransportista: TFIBTableSet;
     xSEURTransportistaCODIGO_INTEGRACION: TIntegerField;
     xSEURTransportistaNUMERO_BULTO: TIntegerField;
     xSEURTransportistaLIMITE_BULTO_INFERIOR: TIntegerField;
     xSEURTransportistaLIMITE_BULTO_SUPERIOR: TIntegerField;
     xSEURTransportistaEMPRESA: TIntegerField;
     xSEURTransportistaACREEDOR: TIntegerField;
     xSEURTransportistaCODIGO_CLIENTE: TIntegerField;
     DSxSEURTransportista: TDataSource;
     xSEURTransportistaGRANT_TYPE: TFIBStringField;
     xSEURTransportistaCLIENT_ID: TFIBStringField;
     xSEURTransportistaCLIENT_SECRET: TFIBStringField;
     xSEURTransportistaUSERNAME: TFIBStringField;
     xSEURTransportistaUSER_PASSWORD: TFIBStringField;
     xSEURTransportistaACCESS_TOKEN: TFIBStringField;
     xSEURTransportistaREFRESH_TOKEN: TFIBStringField;
     xSEURTransportistaFECHA_EXPIRACION: TDateTimeField;
     xSEURTransportistaCCC: TFIBStringField;
     xSEURTransportistaID_NUMBER: TFIBStringField;
     xSEURTransportistaBUSINESS_UNIT: TFIBStringField;
     xSEURTransportistaSENDER_NAME: TFIBStringField;
     xSEURTransportistaSENDER_PHONE: TFIBStringField;
     xSEURTransportistaSENDER_ADDR_STREET: TFIBStringField;
     xSEURTransportistaSENDER_ADDR_POSTCODE: TFIBStringField;
     xSEURTransportistaSENDER_ADDR_COUNTRY: TFIBStringField;
     xSEURTransportistaSENDER_ADDR_CITY: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure xSEURTransportistaNewRecord(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     WSSecureProtocol: boolean;
     WSDebug: boolean;
     WSURL: string;
     WSToken: string;
     WSTokenExpira: TDateTime;
     WSgrant_type: string;
     WSclient_id: string;
     WSclient_secret: string;
     WSusername: string;
     WSpassword: string;
     Envio: TlkJSONObject;
     Referencia: string;
     procedure ClearCData(aJSON: TStrings);
     function WS_DoPost(Metodo, Resource: string; id: string; Opciones: string; Contenido, Respuesta: TStrings; aContentType: string = ''): integer;
     function WS_Add(Resource: string; json, Respuesta: TStrings; ContentType: string = ''): integer;
     function WS_Delete(Resource, id: string; Respuesta: TStrings; ContentType: string = ''): integer;
     function WS_Edit(Resource, id: string; json, Respuesta: TStrings; ContentType: string = ''): integer;
     function WS_Get(Resource, id, Opciones: string; Respuesta: TStrings; ContentType: string = ''): integer;
     procedure GetToken;
  public
     { Public declarations }
     function WS_Inicializa(Acreedor: integer; aDebug: boolean): boolean;
     procedure GetCities(countryCode, postalCode: string; Cities: TStrings);
     procedure NuevoEnvio(Servicecode, ProductCode: integer; Ref, Observations, SecondReference: string);
     procedure Receiver(Name, Phone, ContactName, email, addr_StreetName, addr_PostalCode, addr_Country, addr_CityName: string);
     procedure DeclaredValue(currencycode: string; amount: double; exportPaymentType, importPaymentType: string);
     procedure NuevoPaquete(weight: double; packReference: string);
     function Enviar(var shipmentCode: string): word;
     function GetLabel(shipmentCode, templateType, file_type, entity: string; Ficheros: TStrings): integer;
  published
     property Token: string Read WSToken;
  end;

var
  DMSEUR : TDMSEUR;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, HYFIBQuery, IdHttp, IdSSLOpenSSL, DateUtils, Dialogs;

{$R *.dfm}

procedure TDMSEUR.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  AsignaDisplayFormat(xSEURTransportista, MascaraN, MascaraI, ShortDateFormat);
  xSEURTransportistaFECHA_EXPIRACION.DisplayFormat := ShortDateFormat + ' hh:nn:ss';

  with xSEURTransportista do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;

  // JSON para enviar a SEUR
  Envio := nil;
end;

procedure TDMSEUR.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(Envio) then
     Envio.Free;
end;

procedure TDMSEUR.xSEURTransportistaNewRecord(DataSet: TDataSet);
begin
  xSEURTransportistaEMPRESA.AsInteger := REntorno.Empresa;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT * FROM UT_JUSTIFICA_DOMICILIO(:TERCERO)';
        Params.ByName['TERCERO'].AsInteger := REntorno.Tercero;
        ExecQuery;

        xSEURTransportistaSENDER_NAME.AsString := FieldByName['NOMBRE'].AsString;
        xSEURTransportistaSENDER_PHONE.AsString := FieldByName['DIR_TELEFONO01'].AsString;
        xSEURTransportistaSENDER_ADDR_STREET.AsString := FieldByName['DIRECCION'].AsString;
        xSEURTransportistaSENDER_ADDR_POSTCODE.AsString := FieldByName['CODIGO_POSTAL'].AsString;
        xSEURTransportistaSENDER_ADDR_COUNTRY.AsString := DamePaisC2(REntorno.Pais); // FieldByName['PAIS'].AsString devuelve "ESPAÑA" y necesito el codigo
        xSEURTransportistaSENDER_ADDR_CITY.AsString := FieldByName['LOCALIDAD'].AsString;

        FreeHandle;
     finally
        Free;
     end;
  end;

  xSEURTransportistaGRANT_TYPE.AsString := 'password';
end;

// WEBSERVICE

function TDMSEUR.WS_Inicializa(Acreedor: integer; aDebug: boolean): boolean;
begin
  Result := False;

  with xSEURTransportista do
  begin
     Close;
     Open;
     First;
     while (not EOF) and (xSEURTransportistaACREEDOR.AsInteger <> Acreedor) do
        Next;
  end;

  if (xSEURTransportistaACREEDOR.AsInteger = Acreedor) then
  begin
     WSSecureProtocol := True;
     WSURL := 'servicios.api.seur.io';
     WSgrant_type := xSEURTransportistaGRANT_TYPE.AsString;
     WSclient_id := xSEURTransportistaCLIENT_ID.AsString;
     WSclient_secret := xSEURTransportistaCLIENT_SECRET.AsString;
     WSusername := xSEURTransportistaUSERNAME.AsString;
     WSpassword := xSEURTransportistaUSER_PASSWORD.AsString;
     WSToken := xSEURTransportistaACCESS_TOKEN.AsString;
     WSTokenExpira := xSEURTransportistaFECHA_EXPIRACION.AsDateTime;
     WSDebug := aDebug;

     if (Now > WSTokenExpira) then
     begin
        GetToken;

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' UPDATE SEUR_CONFIGURACION ');
              SQL.Add(' SET ');
              SQL.Add('   ACCESS_TOKEN = :ACCESS_TOKEN, ');
              // SQL.Add('   REFRESH_TOKEN = :REFRESH_TOKEN, ');
              SQL.Add('   FECHA_EXPIRACION = :FECHA_EXPIRACION ');
              SQL.Add(' WHERE ');
              SQL.Add('   EMPRESA = :EMPRESA AND ');
              SQL.Add('   ACREEDOR = :ACREEDOR ');
              Params.ByName['EMPRESA'].AsInteger := xSEURTransportistaEMPRESA.AsInteger;
              Params.ByName['ACREEDOR'].AsInteger := xSEURTransportistaACREEDOR.AsInteger;
              Params.ByName['ACCESS_TOKEN'].AsString := WSToken;
              // Params.ByName['REFRESH_TOKEN'].AsString := xSEURTransportistaREFRESH_TOKEN.AsString;
              Params.ByName['FECHA_EXPIRACION'].AsDateTime := WSTokenExpira;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        xSEURTransportista.Refresh;
     end;

     if (WSToken <> '') then
     begin
        Result := True;
     end;
  end;
end;

procedure TDMSEUR.ClearCData(aJSON: TStrings);
begin
  // Limpia el JSON
end;

(*
function TDMSEUR.WS_DoPost(Metodo, Resource, id, Opciones: string;
  Contenido, Respuesta: TStrings): integer;
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

  aURL := aURL + WSURL + '/' + Resource;
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
           DMMain.Log('Content: '+#13#10+ Contenido.Text);

        if Assigned(Contenido) then
           Contenido.SaveToStream(AContent);

        with HttpConnectionWinInet do
        begin
           {
           BasicAuthentication_UserName := '';
           BasicAuthentication_Password := '';
           }
           // Headers.Add('Username='+Token);
           // Headers.Add('Authorization='+Token);
           // Headers.Add('ws_key='+Token);

           Headers.Add('Accept=application/json');
           Headers.Add('Authorization=Bearer ' + WSToken);

           if Assigned(Contenido) then
              Headers.Add('ContentLength=' + IntToStr(Length(Contenido.Text)));

           // AcceptCharSet := 'ISO-8859-1, *;q=0.8';
           Headers.Add('ContentType=application/x-www-form-urlencoded');

           DMMain.Log('Headers:'+#13#10+HttpConnectionWinInet.Headers.Text);

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
  finally
     HttpConnectionWinInet.Free;
     AContent.Free;
     AResponse.Free;
  end;
end;
*)

function TDMSEUR.WS_DoPost(Metodo, Resource, id, Opciones: string; Contenido, Respuesta: TStrings; aContentType: string = ''): integer;
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

     SSL.SSLOptions.Method := sslvTLSv1_2;   // Forzar TLS 1.2
     SSL.SSLOptions.SSLVersions := [sslvTLSv1_2];

     Http.IOHandler := SSL;
     if (aContentType = '') then
        Http.Request.ContentType := 'application/json; charset=UTF-8'
     else
        Http.Request.ContentType := aContentType; // 'application/x-www-form-urlencoded';

     // ShowMessage('Metodo:'+Metodo+#13#10+'Resource:'+Resource+#13#10+'Contenido:'+Contenido.text+#13#10+'ContentType:'+Http.Request.ContentType);

     Http.Request.CustomHeaders.Clear;
     Http.Request.CustomHeaders.Add('Authorization: Bearer ' + WSToken);

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

     {
     if Assigned(Respuesta) then
     begin
        AResponse.Position := 0;
        Respuesta.LoadFromStream(AResponse);
     end;
     }

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

function TDMSEUR.WS_Add(Resource: string; json, Respuesta: TStrings; ContentType: string = ''): integer;
begin
  /// Crea recurso xml y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('POST', Resource, '', '', json, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;

function TDMSEUR.WS_Delete(Resource: string; id: string; Respuesta: TStrings; ContentType: string = ''): integer;
begin
  /// Borra recurso con id y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('DELETE', Resource, id, '', nil, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;

function TDMSEUR.WS_Edit(Resource: string; id: string; json, Respuesta: TStrings; ContentType: string = ''): integer;
begin
  /// Modifica recurso de xml y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('PUT', Resource, id, '', json, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;

function TDMSEUR.WS_Get(Resource: string; id: string; Opciones: string; Respuesta: TStrings; ContentType: string = ''): integer;
begin
  /// Obtiene recurso y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP
  /// Opciones : filter, display, sort, limit

  Result := WS_DoPost('GET', Resource, id, Opciones, nil, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;

procedure TDMSEUR.GetToken;
var
  Body, Respuesta : TStrings;
  Documento : TlkJSONObject;
  Nodo : TlkJSONBase;
  Resultado : integer;
begin
  Body := TStringList.Create;
  Respuesta := TStringList.Create;
  try
     // Al ser application/x-www-form-urlencoded el formato el body debe ser pares separados por &
     // Debe terminar con &
     Body.Text := 'grant_type=' + WSgrant_type + '&client_id=' + WSclient_id + '&client_secret=' + WSclient_secret + '&username=' + WSusername + '&password=' + WSpassword + '&';
     // Body.SaveToFile(DameTempPath + Format('SEUR_pic_token_body_%s.log', [FormatDateTime('yymmdd_hhnnss', Now)]));

     Resultado := WS_DoPost('POST', 'pic_token', '', '', Body, Respuesta, 'application/x-www-form-urlencoded');
     DMMain.Log('ResponseHeader: ' + #13#10 + Respuesta.Text);
     // Respuesta.SaveToFile(DameTempPath + Format('SEUR_pic_token_resp_%s.log', [FormatDateTime('yymmdd_hhnnss', Now)]));

     if (Resultado = 200) then
     begin
        Documento := TlkJSON.ParseText(Respuesta.Text) as TlkJSONObject;
        try
           if Assigned(Documento) then
           begin
              Nodo := Documento.Field['access_token'];
              if Assigned(Nodo) then
              begin
                 if (Nodo is TlkJSONstring) then
                    WSToken := Nodo.Value;
              end;

              Nodo := Documento.Field['expires_in'];
              if Assigned(Nodo) then
              begin
                 if (Nodo is TlkJSONnumber) then
                    WSTokenExpira := IncSecond(Now, Nodo.Value);
              end;
           end;
        finally
           Documento.Free
        end;
     end
     else
     begin
        WSToken := '';
        ShowMessage(_('No se ha podido generar Token de seguridad SEUR') + #13#10 + Respuesta.Text + #13#10 + #13#10 + Body.Text);
     end;
  finally
     Body.Free;
     Respuesta.Free;
  end;
end;

procedure TDMSEUR.GetCities(countryCode, postalCode: string; Cities: TStrings);
var
  Body, Respuesta : TStrings;
  Documento : TlkJSONObject;
  JSONArray : TlkJSONList;
  Nodo : TlkJSONBase;
  Resultado : integer;
  CodigoPostal, Localidad : string;
  i : integer;
begin
  Cities.Clear;
  Body := TStringList.Create;
  Respuesta := TStringList.Create;
  try
     Resultado := WS_Get('pic/v1/cities', '', '?countryCode=' + countryCode + '&postalCode=' + postalCode, Respuesta);

     if (Resultado = 200) then
     begin
        Documento := TlkJSON.ParseText(Respuesta.Text) as TlkJSONObject;
        try
           if Assigned(Documento) then
           begin
              JSONArray := TlkJSONList(Documento.Field['data']);
              if Assigned(JSONArray) then
              begin
                 for i := 0 to JSONArray.Count - 1 do
                 begin
                    DMMain.Log(format('Procesando Array[%d]', [i]));
                    Nodo := TlkJSONObject(JSONArray.Child[i]).Field['postalCode'];
                    CodigoPostal := Nodo.Value;
                    Nodo := TlkJSONObject(JSONArray.Child[i]).Field['cityName'];
                    Localidad := Nodo.Value;

                    Cities.Add(CodigoPostal + ' - ' + Localidad);
                 end;
              end;
           end;
        finally
           Documento.Free
        end;
     end
     else
        WSToken := '';
  finally
     Body.Free;
     Respuesta.Free;
  end;
end;

procedure TDMSEUR.NuevoEnvio(Servicecode, ProductCode: integer; Ref, Observations, SecondReference: string);
var
  Sender, AddressSender : TlkJSONobject;
begin
  if Assigned(Envio) then
     FreeAndNil(Envio);

  Envio := TlkJSONobject.Create;

  Envio.Add('serviceCode', Servicecode);
  Envio.Add('productCode', ProductCode);
  Envio.Add('ref', Ref);
  Envio.Add('customsGoodsCode', 'C');
  Envio.Add('paymentType', 'P');
  Envio.Add('dConsig', False);
  Envio.Add('did', False);
  Envio.Add('swap', False);
  Envio.Add('dSat', False);
  Envio.Add('observations', Observations);
  Envio.Add('secondReference', SecondReference);

  // Sender
  Sender := TlkJSONobject.Create;
  Sender.Add('name', REntorno.NombreEmpresa);
  Sender.Add('ccc', xSEURTransportistaCCC.AsString + '-' + xSEURTransportistaBUSINESS_UNIT.AsString);
  Sender.Add('idNumber', xSEURTransportistaID_NUMBER.AsString);
  Sender.Add('phone', xSEURTransportistaSENDER_PHONE.AsString);
  Sender.Add('contactName', xSEURTransportistaSENDER_NAME.AsString);

  AddressSender := TlkJSONobject.Create;
  AddressSender.Add('streetName', xSEURTransportistaSENDER_ADDR_STREET.AsString);
  AddressSender.Add('postalCode', xSEURTransportistaSENDER_ADDR_POSTCODE.AsString);
  AddressSender.Add('country', xSEURTransportistaSENDER_ADDR_COUNTRY.AsString);
  AddressSender.Add('cityName', xSEURTransportistaSENDER_ADDR_CITY.AsString);
  Sender.Add('address', AddressSender);

  Envio.Add('sender', Sender);

  Referencia := Ref;
end;

procedure TDMSEUR.NuevoPaquete(weight: double; packReference: string);
var
  Parcels : TlkJSONlist;
  Parcel : TlkJSONobject;
begin
  // Parcels (array)

  // Verificar si ya existe el nodo parcels
  if Envio.Field['parcels'] <> nil then
     Parcels := TlkJSONlist(Envio.Field['parcels'])
  else
  begin
     Parcels := TlkJSONlist.Create;
     Envio.Add('parcels', Parcels);
  end;

  // Crear el objeto parcel
  Parcel := TlkJSONobject.Create;
  Parcel.Add('weight', weight);
  Parcel.Add('packReference', packReference);

  // Agregar al array
  Parcels.Add(Parcel);
end;

procedure TDMSEUR.Receiver(Name, Phone, ContactName, email, addr_StreetName, addr_PostalCode, addr_Country, addr_CityName: string);
var
  Receiver, AddressReceiver : TlkJSONobject;
begin
  Receiver := TlkJSONobject.Create;
  Receiver.Add('name', Name);
  Receiver.Add('phone', Phone);
  Receiver.Add('contactName', ContactName);
  Receiver.Add('email', email);

  AddressReceiver := TlkJSONobject.Create;
  AddressReceiver.Add('streetName', addr_StreetName);
  AddressReceiver.Add('postalCode', addr_PostalCode);
  AddressReceiver.Add('country', addr_Country);
  AddressReceiver.Add('cityName', addr_CityName);
  Receiver.Add('address', AddressReceiver);

  Envio.Add('receiver', Receiver);
end;

procedure TDMSEUR.DeclaredValue(currencycode: string; amount: double; exportPaymentType, importPaymentType: string);
var
  declaredValue : TlkJSONobject;
begin
  /// exportPaymentType y importPaymentType pueden ser: D=Debidos o P=Pagados
  declaredValue := TlkJSONobject.Create;
  declaredValue.Add('currencyCode', currencyCode);
  declaredValue.Add('amount', amount);
  Envio.Add('declaredValue', declaredValue);

  Envio.Add('exportPaymentType', exportPaymentType);
  Envio.Add('importPaymentType', importPaymentType);
end;

function TDMSEUR.Enviar(var shipmentCode: string): word;
var
  Body, Respuesta : TStrings;
  Documento : TlkJSONObject;
  JSONArray : TlkJSONList;
  Nodo : TlkJSONBase;
  i : integer;
begin
  /// Envia peticion y recibe "shipmentCode" para luego pedir las etiquetas
  /// Si el resultado no es 200, shipmentCode contiene el mensaje de error

  shipmentCode := '';
  Body := TStringList.Create;
  Respuesta := TStringList.Create;
  try
     Body.Add(TlkJSON.GenerateText(Envio));

     // Result := 200;
     // Respuesta.Text := '{"data": {"shipmentCode": "028388406528420250826","ecbs": ["28280116636601","28280116636618","28280116636625"],"parcelNumbers": ["07284049298072","07284049298073","07284049298074"]}}';
     // Result := 400
     // Respuesta.Text := {"errors": [ {"title": "BAD_REQUEST", "status": "400", "detail": "Error trying to retrieve cities from API catalogue"} ] }

     Body.SaveToFile(DameTempPath + Format('SEUR_shipments_Body_%s.log', [Referencia]));
     Result := WS_DoPost('POST', 'pic/v1/shipments', '', '', Body, Respuesta);
     Respuesta.SaveToFile(DameTempPath + Format('SEUR_shipments_Respuesta_%d_%s.log', [Result, Referencia]));

     // if (Result = 200) then
     // begin
     Documento := TlkJSON.ParseText(Respuesta.Text) as TlkJSONObject;
     try
        if Assigned(Documento) then
        begin
           Nodo := Documento.Field['data'];
           if Assigned(Nodo) then
           begin
              Nodo := Nodo.Field['shipmentCode'];
              if (Nodo is TlkJSONstring) then
                 shipmentCode := Nodo.Value;
           end
           else
           begin
              JSONArray := TlkJSONList(Documento.Field['errors']);
              if Assigned(JSONArray) then
              begin
                 for i := 0 to JSONArray.Count - 1 do
                 begin
                    Nodo := TlkJSONObject(JSONArray.Child[i]).Field['title'];
                    if Assigned(Nodo) then
                       shipmentCode := shipmentCode + Nodo.Value;

                    Nodo := TlkJSONObject(JSONArray.Child[i]).Field['status'];
                    if Assigned(Nodo) then
                       shipmentCode := shipmentCode + ' - Status: ' + Nodo.Value;

                    Nodo := TlkJSONObject(JSONArray.Child[i]).Field['detail'];
                    if Assigned(Nodo) then
                       shipmentCode := shipmentCode + #13#10 + Nodo.Value;
                 end;
              end;
           end;
        end;
     finally
        Documento.Free
     end;
     // end
     // else
     //    shipmentCode := '';
  finally
     Body.Free;
     Respuesta.Free;
  end;
end;

function TDMSEUR.GetLabel(shipmentCode, templateType, file_type, entity: string; Ficheros: TStrings): integer;
var
  Respuesta : TStrings;
  Documento : TlkJSONObject;
  JSONArray : TlkJSONList;
  Nodo : TlkJSONBase;
  FicheroEtiqueta, LabelBase64 : string;
  AMemoryStream : TMemoryStream;
  i : integer;
begin
  Ficheros.Clear;
  Respuesta := TStringList.Create;
  try
     // Result := 200;
     // Respuesta.LoadFromFile('C:\Delfos\L.json');
     Result := WS_Get('pic/v1/labels', '', '?code=' + shipmentCode + '&templateType=' + templateType + '&type=' + file_type + '&entity=' + entity, Respuesta);

     if (Result = 200) then
     begin
        Documento := TlkJSON.ParseText(Respuesta.Text) as TlkJSONObject;
        try
           if Assigned(Documento) then
           begin
              JSONArray := TlkJSONList(Documento.Field['data']);
              if Assigned(JSONArray) then
              begin
                 for i := 0 to JSONArray.Count - 1 do
                 begin
                    DMMain.Log(format('Procesando Array[%d]', [i]));
                    Nodo := TlkJSONObject(JSONArray.Child[i]).Field['pdf'];
                    LabelBase64 := Nodo.Value;

                    FicheroEtiqueta := DameTempPath + Format('SEUR_%s_%d.PDF', [shipmentCode, i]);
                    AMemoryStream := TMemoryStream.Create;
                    with AMemoryStream do
                    begin
                       try
                          StrB64ToStream(LabelBase64, AMemoryStream);
                          Position := 0;
                          SaveToFile(FicheroEtiqueta);
                       finally
                          Free;
                       end;
                    end;

                    Ficheros.Add(FicheroEtiqueta);
                 end;
              end;
           end;
        finally
           Documento.Free
        end;
     end;
  finally
     Respuesta.Free;
  end;
end;

end.
