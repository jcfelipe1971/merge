unit UDMDHL;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, uLkJSON;

type
  TDMDHL = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xDHLTransportista: TFIBTableSet;
     DSxDHLTransportista: TDataSource;
     xDHLTransportistaEMPRESA: TIntegerField;
     xDHLTransportistaACREEDOR: TIntegerField;
     xDHLTransportistaACCOUNT_TYPECODE: TFIBStringField;
     xDHLTransportistaACCOUNT_NUMBER: TFIBStringField;
     xDHLTransportistaPICKUP_CLOSETIME: TFIBStringField;
     xDHLTransportistaPICKUP_LOCATION: TFIBStringField;
     xDHLTransportistaPICKUP_LOCATIONTYPE: TFIBStringField;
     xDHLTransportistaPICKUP_SPECIALINST_VALUE: TFIBStringField;
     xDHLTransportistaPICKUP_SPECIALINST_TYPECODE: TFIBStringField;
     xDHLTransportistaPICKUP_REMARK: TFIBStringField;
     xDHLTransportistaPICKUP_SHIPPER_POSTALCODE: TFIBStringField;
     xDHLTransportistaPICKUP_SHIPPER_CITYNAME: TFIBStringField;
     xDHLTransportistaPICKUP_SHIPPER_COUNTRYCODE: TFIBStringField;
     xDHLTransportistaPICKUP_SHIPPER_PROVINCECODE: TFIBStringField;
     xDHLTransportistaPICKUP_SHIPPER_ADDRESSLINE1: TFIBStringField;
     xDHLTransportistaPICKUP_SHIPPER_ADDRESSLINE2: TFIBStringField;
     xDHLTransportistaPICKUP_SHIPPER_ADDRESSLINE3: TFIBStringField;
     xDHLTransportistaPICKUP_SHIPPER_COUNTYNAME: TFIBStringField;
     xDHLTransportistaPICKUP_SH_CONTACT_EMAIL: TFIBStringField;
     xDHLTransportistaPICKUP_SH_CONTACT_PHONE: TFIBStringField;
     xDHLTransportistaPICKUP_SH_CONTACT_MOBILEPHONE: TFIBStringField;
     xDHLTransportistaPICKUP_SH_CONTACT_COMPANYNAME: TFIBStringField;
     xDHLTransportistaPICKUP_SH_CONTACT_FULLNAME: TFIBStringField;
     xDHLTransportistaPICKUP_DETAILS_POSTALCODE: TFIBStringField;
     xDHLTransportistaPICKUP_DETAILS_CITYNAME: TFIBStringField;
     xDHLTransportistaPICKUP_DETAILS_COUNTRYCODE: TFIBStringField;
     xDHLTransportistaPICKUP_DETAILS_PROVINCECODE: TFIBStringField;
     xDHLTransportistaPICKUP_DETAILS_ADDRESSLINE1: TFIBStringField;
     xDHLTransportistaPICKUP_DETAILS_ADDRESSLINE2: TFIBStringField;
     xDHLTransportistaPICKUP_DETAILS_ADDRESSLINE3: TFIBStringField;
     xDHLTransportistaPICKUP_DETAILS_COUNTYNAME: TFIBStringField;
     xDHLTransportistaPICKUP_DE_CONTACT_EMAIL: TFIBStringField;
     xDHLTransportistaPICKUP_DE_CONTACT_PHONE: TFIBStringField;
     xDHLTransportistaPICKUP_DE_CONTACT_MOBILEPHONE: TFIBStringField;
     xDHLTransportistaPICKUP_DE_CONTACT_COMPANYNAME: TFIBStringField;
     xDHLTransportistaPICKUP_DE_CONTACT_FULLNAME: TFIBStringField;
     xDHLTransportistaUNITOFMEASUREMENT: TFIBStringField;
     xDHLTransportistaWS_USERNAME: TFIBStringField;
     xDHLTransportistaWS_PASSWORD: TFIBStringField;
     xDHLTransportistaWS_URL: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure xDHLTransportistaNewRecord(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     WSSecureProtocol: boolean;
     WSDebug: boolean;
     WSURL: string;
     WSusername: string;
     WSpassword: string;
     {
     WSToken: string;
     WSTokenExpira: TDateTime;
     WSgrant_type: string;
     WSclient_id: string;
     WSclient_secret: string;
     }
     Envio: TlkJSONObject;
     Referencia: string;
     //procedure ClearCData(aJSON: TStrings);
     function WS_DoPost(Metodo, Resource: string; id: string; Opciones: string; Contenido, Respuesta: TStrings; aContentType: string = ''): integer;
     //function WS_Add(Resource: string; json, Respuesta: TStrings; ContentType: string = ''): integer;
     //function WS_Delete(Resource, id: string; Respuesta: TStrings; ContentType: string = ''): integer;
     //function WS_Edit(Resource, id: string; json, Respuesta: TStrings; ContentType: string = ''): integer;
     //function WS_Get(Resource, id, Opciones: string; Respuesta: TStrings; ContentType: string = ''): integer;
  public
     { Public declarations }
     function WS_Inicializa(Acreedor: integer; aDebug: boolean): boolean;

     procedure NuevoEnvio(ProductCode, localProductCode: string; getRateEstimates: boolean; Ref: string);
     procedure NuevoOutputImages(typeCode, templateName: string; isRequested: boolean);
     procedure NuevoValueAddedServices(serviceCode: string; Value: double; currency: string);
     procedure customerDetails_shipperDetails_auto;
     procedure customerDetails_shipperDetails(postalCode, cityName, countryCode, provinceCode, addressLine1, addressLine2, addressLine3, countyName, provinceName, countryName, email, phone, mobilePhone, companyName, fullName, registrationNumber_typeCode, registrationNumber_number, registrationNumber_issuerCountryCode, bankDetail_name, bankDetail_settlementLocalCurrency, bankDetail_settlementForeignCurrency, typeCode: string);
     procedure customerDetails_receiverDetails(postalCode, cityName, countryCode, provinceCode, addressLine1, addressLine2, addressLine3, countyName, provinceName, countryName, email, phone, mobilePhone, companyName, fullName, registrationNumber_typeCode, registrationNumber_number, registrationNumber_issuerCountryCode, bankDetail_name, bankDetail_settlementLocalCurrency, bankDetail_settlementForeignCurrency, typeCode: string);

     procedure Contenido(isCustomsDeclarable: boolean; declaredValue: double; declaredValueCurrency, description, USFilingTypeValue, incoterm, unitOfMeasurement: string);

     procedure NuevoPaquete(typeCode: string; weight, Length, Width, Height: double; customerReference_value, customerReference_typeCode, description, labelDescription: string);
     procedure exportDeclarationline(destinationPortName, placeOfIncoterm, payerVATNumber, recipientReference, exporter_id, exporter_code, packageMarks, declarationNote_value, exportReference, exportReason, exportReasonType, license_typeCode, license_value, shipmentType, customsDocument_typeCode, customsDocument_value: string);
     procedure NuevoexportDeclarationlineItems(number: integer; description: string; price, quantity_value: double; quantity_unitOfMeasurement, commodity_typeCode1, commodity_value1, commodity_typeCode2, commodity_value2, exportReasonType, manufacturerCountry, exportControlClassificationNumber: string; netValue, grossValue: double; isTaxesPaid: boolean; line_additionalInformation, customerReference_typeCode1, customerReference_value1, customerReference_typeCode2, customerReference_value2, customsDocument_typeCode1, customsDocument_value1: string);
     procedure exportDeclarationInvoice(number: string; InvoiceDate: TDateTime; invoice_instruction: string; totalNetWeight, totalGrossWeight: double; termsOfPayment: string; importCustomsDutyValue, importTaxesValue: double; customerReference_typeCode1: string = ''; customerReference_value1: string = ''; customerReference_typeCode2: string = ''; customerReference_value2: string = ''; customerReference_typeCode3: string = ''; customerReference_value3: string = '');
     procedure NuevoexportDeclarationRemarks(Value: string);
     procedure NuevoexportDeclarationAdditionalCharges(Value: double; Caption, typeCode: string);
     procedure NuevoshipmentNotification(typeCode, receiverId, languageCode, languageCountryCode, bespokeMessage: string);

     procedure getTransliteratedResponse(Value: boolean);
     procedure estimatedDeliveryDate(isRequested: boolean; typeCode: string);
     procedure NuevogetAdditionalInformation(isRequested: boolean; typeCode: string);

     function Enviar(var shipmentTrackingNumber: string; Ficheros: TStrings): word;
     procedure GuardarFicheroEnvio(Fichero: string);

     procedure DeclaredValue(currencycode: string; amount: double; exportPaymentType, importPaymentType: string);
     function GetLabel(shipmentCode, templateType, file_type, entity: string; Ficheros: TStrings): integer;
     procedure rates(var productCode: string; var localProductCode: string; destinationCountryCode: string; destinationPostalCode: string; destinationCityName: string; weight: integer; Length: integer; Height: integer; Width: integer; plannedShippingDate: TDateTime; isCustomsDeclarable: boolean);
  published
     // property Token: string Read WSToken;
     property username: string Read WSusername;
     property password: string Read WSpassword;
  end;

var
  DMDHL : TDMDHL;

implementation

uses UDMMain, UUtiles, UDameDato, UEntorno, HYFIBQuery, IdHttp, IdSSLOpenSSL, DateUtils, Dialogs;

{$R *.dfm}

procedure TDMDHL.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  AsignaDisplayFormat(xDHLTransportista, MascaraN, MascaraI, ShortDateFormat);

  with xDHLTransportista do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;

  // JSON para enviar a DHL
  Envio := nil;
end;

procedure TDMDHL.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(Envio) then
     Envio.Free;
end;

procedure TDMDHL.xDHLTransportistaNewRecord(DataSet: TDataSet);
begin
  xDHLTransportistaEMPRESA.AsInteger := REntorno.Empresa;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT * FROM UT_JUSTIFICA_DOMICILIO(:TERCERO)';
        Params.ByName['TERCERO'].AsInteger := REntorno.Tercero;
        ExecQuery;

        xDHLTransportistaPICKUP_SH_CONTACT_FULLNAME.AsString := FieldByName['NOMBRE'].AsString;
        xDHLTransportistaPICKUP_SH_CONTACT_PHONE.AsString := FieldByName['DIR_TELEFONO01'].AsString;
        xDHLTransportistaPICKUP_SHIPPER_ADDRESSLINE1.AsString := FieldByName['DIRECCION'].AsString;
        xDHLTransportistaPICKUP_SHIPPER_POSTALCODE.AsString := FieldByName['CODIGO_POSTAL'].AsString;
        xDHLTransportistaPICKUP_SHIPPER_COUNTRYCODE.AsString := DamePaisC2(REntorno.Pais); // FieldByName['PAIS'].AsString devuelve "ESPAÑA" y necesito el codigo
        xDHLTransportistaPICKUP_SHIPPER_CITYNAME.AsString := FieldByName['LOCALIDAD'].AsString;

        FreeHandle;
     finally
        Free;
     end;
  end;
end;

// WEBSERVICE

function TDMDHL.WS_Inicializa(Acreedor: integer; aDebug: boolean): boolean;
begin
  Result := False;

  with xDHLTransportista do
  begin
     Close;
     Open;
     First;
     while (not EOF) and (xDHLTransportistaACREEDOR.AsInteger <> Acreedor) do
        Next;
  end;

  if (xDHLTransportistaACREEDOR.AsInteger = Acreedor) then
  begin
     WSSecureProtocol := True;
     {
     // Mock
     // WSURL := 'api-mock.dhl.com/mydhlapi';

     // Test
     WSURL := 'express.api.dhl.com/mydhlapi/test';

     // Produccion
     // WSURL := 'express.api.dhl.com/mydhlapi';

     WSusername:= 'goodforpadeES';
     WSpassword:='E!9cC$6kR^2eN^1x';
     }

     WSURL := xDHLTransportistaWS_URL.AsString;
     WSusername := xDHLTransportistaWS_USERNAME.AsString;
     WSpassword := xDHLTransportistaWS_PASSWORD.AsString;

     WSDebug := aDebug;
  end;
end;

{procedure TDMDHL.ClearCData(aJSON: TStrings);
begin
  // Limpia el JSON
end;}

(*
function TDMDHL.WS_DoPost(Metodo, Resource, id, Opciones: string;
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

function TDMDHL.WS_DoPost(Metodo, Resource, id, Opciones: string; Contenido, Respuesta: TStrings; aContentType: string = ''): integer;
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
  /// shipments:
  /// curl --location 'https://api-mock.dhl.com/mydhlapi/shipments' \
  /// --header 'content-type: application/json' \
  /// --header 'Message-Reference: SOME_STRING_VALUE' \
  /// --header 'Message-Reference-Date: SOME_STRING_VALUE' \
  /// --header 'Plugin-Name: SOME_STRING_VALUE' \
  /// --header 'Plugin-Version: SOME_STRING_VALUE' \
  /// --header 'Shipping-System-Platform-Name: SOME_STRING_VALUE' \
  /// --header 'Shipping-System-Platform-Version: SOME_STRING_VALUE' \
  /// --header 'Webstore-Platform-Name: SOME_STRING_VALUE' \
  /// --header 'Webstore-Platform-Version: SOME_STRING_VALUE' \
  /// --header 'x-version: SOME_STRING_VALUE' \
  /// --header 'Authorization: Basic REPLACE_BASIC_AUTH' \
  /// --data-raw '{"plannedPickupDateAndTime":"2019-08-04T14:00:31GMT+01:00", ...

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
     Http.Request.CustomHeaders.Add('x-version: 3.1.0');
     // Http.Request.CustomHeaders.Add('Authorization: Bearer ' + WSToken);

     Http.Request.BasicAuthentication := True;
     Http.Request.UserName := WSUsername;
     Http.Request.Password := WSPassword;

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

{function TDMDHL.WS_Add(Resource: string; json, Respuesta: TStrings; ContentType: string = ''): integer;
begin
  /// Crea recurso xml y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('POST', Resource, '', '', json, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;}


{function TDMDHL.WS_Delete(Resource: string; id: string; Respuesta: TStrings; ContentType: string = ''): integer;
begin
  /// Borra recurso con id y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('DELETE', Resource, id, '', nil, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;}


{function TDMDHL.WS_Edit(Resource: string; id: string; json, Respuesta: TStrings; ContentType: string = ''): integer;
begin
  /// Modifica recurso de xml y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('PUT', Resource, id, '', json, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;}

{function TDMDHL.WS_Get(Resource: string; id: string; Opciones: string; Respuesta: TStrings; ContentType: string = ''): integer;
begin
  /// Obtiene recurso y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP
  /// Opciones : filter, display, sort, limit

  Result := WS_DoPost('GET', Resource, id, Opciones, nil, Respuesta);
  if (Result = 200) then
     ClearCData(Respuesta);
end;}

procedure TDMDHL.NuevoEnvio(ProductCode, localProductCode: string; getRateEstimates: boolean; Ref: string);
var
  pickup, account : TlkJSONobject;
  //outputImageProperties, imageOption, valueAddedService : TlkJSONobject;
  accounts : TlkJSONlist;
  //valueAddedServices, imageOptions : TlkJSONlist;
begin
  Referencia := Ref;

  if Assigned(Envio) then
     FreeAndNil(Envio);

  Envio := TlkJSONobject.Create;

  Envio.Add('plannedShippingDateAndTime', FormatDateTime('yyyy-mm-dd"T"hh:nn:ss' + '" GMT+00:00"', Now));

  pickup := TlkJSONobject.Create;
  Envio.Add('pickup', pickup);
  pickup.Add('isRequested', False);

  Envio.Add('productCode', ProductCode);

  // Este dato es solo para envios excepcionales y no es necesario enviarlo
  if Trim(localProductCode) > '' then
     Envio.Add('localProductCode', localProductCode);
  Envio.Add('getRateEstimates', getRateEstimates);

  // Array accounts
  accounts := TlkJSONlist.Create;
  Envio.Add('accounts', accounts);

  // Crear el objeto account
  account := TlkJSONobject.Create;
  accounts.Add(account);
  account.Add('typeCode', xDHLTransportistaACCOUNT_TYPECODE.AsString);
  account.Add('number', xDHLTransportistaACCOUNT_NUMBER.AsString);

  {
  outputImageProperties := TlkJSONobject.Create;
  Envio.Add('outputImageProperties', outputImageProperties);
  outputImageProperties.Add('printerDPI', 300);
  outputImageProperties.Add('encodingFormat', 'pdf');

  // Array imageOptions
  imageOptions := TlkJSONlist.Create;
  outputImageProperties.Add('imageOptions', imageOptions);

  // Crear el objeto imageOption - invoice
  imageOption := TlkJSONobject.Create;
  imageOptions.Add(imageOption);
  imageOption.Add('typeCode', 'invoice');
  imageOption.Add('templateName', 'COMMERCIAL_INVOICE_P_10');
  imageOption.Add('isRequested', True);
  imageOption.Add('invoiceType', 'commercial');
  imageOption.Add('languageCode', 'eng');
  imageOption.Add('languageCountryCode', 'US');

  // Crear el objeto imageOption - waybillDoc
  imageOption := TlkJSONobject.Create;
  imageOptions.Add(imageOption);
  imageOption.Add('typeCode', 'waybillDoc');
  imageOption.Add('templateName', 'ARCH_8x4');
  imageOption.Add('isRequested', True);
  imageOption.Add('hideAccountNumber', False);
  imageOption.Add('numberOfCopies', 1);

  imageOption := TlkJSONobject.Create;
  imageOptions.Add(imageOption);
  imageOption.Add('typeCode', 'label');
  imageOption.Add('templateName', 'ECOM26_84_001');
  imageOption.Add('renderDHLLogo', True);
  imageOption.Add('fitLabelsToA4', False);

  outputImageProperties.Add('splitTransportAndWaybillDocLabels', True);
  outputImageProperties.Add('allDocumentsInOneImage', False);
  outputImageProperties.Add('splitDocumentsByPages', False);
  outputImageProperties.Add('splitInvoiceAndReceipt', True);
  outputImageProperties.Add('receiptAndLabelsInOneImage', False);
  }
end;

procedure TDMDHL.NuevoOutputImages(typeCode, templateName: string; isRequested: boolean);
var
  outputImageProperties, imageOption : TlkJSONobject;
  imageOptions : TlkJSONlist;
begin
  // Verificar si ya existe el nodo parcels
  if Envio.Field['outputImageProperties'] <> nil then
  begin
     outputImageProperties := TlkJSONobject(Envio.Field['outputImageProperties']);
     imageOptions := TlkJSONlist(outputImageProperties.Field['imageOptions']);
  end
  else
  begin
     outputImageProperties := TlkJSONobject.Create;
     Envio.Add('outputImageProperties', outputImageProperties);
     outputImageProperties.Add('printerDPI', 300);
     outputImageProperties.Add('encodingFormat', 'pdf');

     // Array imageOptions
     imageOptions := TlkJSONlist.Create;
     outputImageProperties.Add('imageOptions', imageOptions);
  end;

  if (typeCode = 'invoice') then
  begin
     // Crear el objeto imageOption - invoice
     imageOption := TlkJSONobject.Create;
     imageOptions.Add(imageOption);
     imageOption.Add('typeCode', typeCode);
     if Trim(templateName) > '' then
        imageOption.Add('templateName', templateName);
     imageOption.Add('isRequested', isRequested);

     // Forzamos esta parte
     imageOption.Add('invoiceType', 'commercial');
     imageOption.Add('languageCode', 'eng');
     imageOption.Add('languageCountryCode', 'US');
  end
  else
  if (typeCode = 'waybillDoc') then
  begin
     // Crear el objeto imageOption - waybillDoc
     imageOption := TlkJSONobject.Create;
     imageOptions.Add(imageOption);
     imageOption.Add('typeCode', typeCode);
     if Trim(templateName) > '' then
        imageOption.Add('templateName', templateName);
     imageOption.Add('isRequested', isRequested);
  {
  imageOption.Add('hideAccountNumber', False);
  imageOption.Add('numberOfCopies', 1);
  }
  end
  else
  if (typeCode = 'label') then
  begin
     imageOption := TlkJSONobject.Create;
     imageOptions.Add(imageOption);
     imageOption.Add('typeCode', typeCode);
     if Trim(templateName) > '' then
        imageOption.Add('templateName', templateName);
  {
  imageOption.Add('renderDHLLogo', True);
  imageOption.Add('fitLabelsToA4', False);
  }
  end;
  {
  outputImageProperties.Add('splitTransportAndWaybillDocLabels', True);
  outputImageProperties.Add('allDocumentsInOneImage', False);
  outputImageProperties.Add('splitDocumentsByPages', False);
  outputImageProperties.Add('splitInvoiceAndReceipt', True);
  outputImageProperties.Add('receiptAndLabelsInOneImage', False);
  }
end;

procedure TDMDHL.NuevoValueAddedServices(serviceCode: string; Value: double; currency: string);
var
  AddedServices : TlkJSONobject;
  valueAddedServices : TlkJSONlist;
begin
  // Verificar si ya existe el nodo parcels
  if Envio.Field['valueAddedServices'] <> nil then
     valueAddedServices := TlkJSONlist(Envio.Field['valueAddedServices'])
  else
  begin
     valueAddedServices := TlkJSONlist.Create;
     Envio.Add('valueAddedServices', valueAddedServices);
  end;

  AddedServices := TlkJSONobject.Create;
  valueAddedServices.Add(AddedServices);

  AddedServices.Add('serviceCode', serviceCode);
  AddedServices.Add('value', Value);
  AddedServices.Add('currency', currency);
end;

procedure TDMDHL.customerDetails_shipperDetails_auto;
var
  postalCode, cityName, countryCode, provinceCode, addressLine1, addressLine2, addressLine3, countyName, provinceName, countryName, email, phone, mobilePhone, companyName, fullName, registrationNumber_typeCode, registrationNumber_number, registrationNumber_issuerCountryCode, bankDetail_name, bankDetail_settlementLocalCurrency, bankDetail_settlementForeignCurrency, typeCode : string;
begin
  /// Rellena los datos de Shipper con los del formulario de configuracion

  postalCode := xDHLTransportistaPICKUP_SHIPPER_POSTALCODE.AsString;
  cityName := xDHLTransportistaPICKUP_SHIPPER_CITYNAME.AsString;
  countryCode := xDHLTransportistaPICKUP_SHIPPER_COUNTRYCODE.AsString;
  provinceCode := xDHLTransportistaPICKUP_SHIPPER_PROVINCECODE.AsString;
  addressLine1 := xDHLTransportistaPICKUP_SHIPPER_ADDRESSLINE1.AsString;
  addressLine2 := xDHLTransportistaPICKUP_SHIPPER_ADDRESSLINE2.AsString;
  addressLine3 := xDHLTransportistaPICKUP_SHIPPER_ADDRESSLINE3.AsString;
  countyName := xDHLTransportistaPICKUP_SHIPPER_COUNTYNAME.AsString;
  provinceName := '';
  countryName := '';
  email := xDHLTransportistaPICKUP_SH_CONTACT_EMAIL.AsString;
  phone := xDHLTransportistaPICKUP_SH_CONTACT_PHONE.AsString;
  mobilePhone := xDHLTransportistaPICKUP_SH_CONTACT_MOBILEPHONE.AsString;
  companyName := xDHLTransportistaPICKUP_SH_CONTACT_COMPANYNAME.AsString;
  fullName := xDHLTransportistaPICKUP_SH_CONTACT_FULLNAME.AsString;
  registrationNumber_typeCode := '';
  registrationNumber_number := '';
  registrationNumber_issuerCountryCode := '';
  bankDetail_name := '';
  bankDetail_settlementLocalCurrency := '';
  bankDetail_settlementForeignCurrency := '';
  typeCode := 'business';

  registrationNumber_typeCode := 'VAT';
  registrationNumber_number := REntorno.CifEmpresa;
  registrationNumber_issuerCountryCode := DamePaisC2(REntorno.Pais);

  customerDetails_shipperDetails(postalCode, cityName, countryCode, provinceCode, addressLine1, addressLine2, addressLine3, countyName, provinceName, countryName, email, phone, mobilePhone, companyName, fullName, registrationNumber_typeCode, registrationNumber_number, registrationNumber_issuerCountryCode, bankDetail_name, bankDetail_settlementLocalCurrency, bankDetail_settlementForeignCurrency, typeCode);
end;

procedure TDMDHL.customerDetails_shipperDetails(postalCode, cityName, countryCode, provinceCode, addressLine1, addressLine2, addressLine3, countyName, provinceName, countryName, email, phone, mobilePhone, companyName, fullName, registrationNumber_typeCode, registrationNumber_number, registrationNumber_issuerCountryCode, bankDetail_name, bankDetail_settlementLocalCurrency, bankDetail_settlementForeignCurrency, typeCode: string);
var
  customerDetails, shipperDetails : TlkJSONobject;
  postalAddress, contactInformation, registrationNumber, bankDetail : TlkJSONobject;
  registrationNumbers, bankDetails : TlkJSONlist;
begin
  // Verificar si ya existe el nodo parcels
  if Envio.Field['customerDetails'] <> nil then
     customerDetails := TlkJSONobject(Envio.Field['customerDetails'])
  else
  begin
     customerDetails := TlkJSONobject.Create;
     Envio.Add('customerDetails', customerDetails);
  end;

  shipperDetails := TlkJSONobject.Create;
  customerDetails.Add('shipperDetails', shipperDetails);

  postalAddress := TlkJSONobject.Create;
  shipperDetails.Add('postalAddress', postalAddress);
  postalAddress.Add('postalCode', postalCode);
  postalAddress.Add('cityName', cityName);
  postalAddress.Add('countryCode', countryCode);
  if Trim(provinceCode) > '' then
     postalAddress.Add('provinceCode', provinceCode);
  postalAddress.Add('addressLine1', addressLine1);
  if (Trim(addressLine2) > '') then
     postalAddress.Add('addressLine2', addressLine2);
  if (Trim(addressLine3) > '') then
     postalAddress.Add('addressLine3', addressLine3);
  if (Trim(countyName) > '') then
     postalAddress.Add('countyName', countyName);
  if Trim(provinceName) > '' then
     postalAddress.Add('provinceName', provinceName);
  if Trim(countryName) > '' then
     postalAddress.Add('countryName', countryName);

  contactInformation := TlkJSONobject.Create;
  shipperDetails.Add('contactInformation', contactInformation);
  if Trim(email) > '' then
     contactInformation.Add('email', email);
  contactInformation.Add('phone', phone);
  if Trim(mobilePhone) > '' then
     contactInformation.Add('mobilePhone', mobilePhone);
  contactInformation.Add('companyName', companyName);
  contactInformation.Add('fullName', fullName);

  // Array registrationNumbers
  registrationNumbers := TlkJSONlist.Create;
  shipperDetails.Add('registrationNumbers', registrationNumbers);

  registrationNumber := TlkJSONobject.Create;
  registrationNumbers.Add(registrationNumber);
  // ["VAT","EIN","SSN","EOR","DUN","FED","STA","CNP","IE","INN","KPP","OGR","OKP","MRN","SDT","FTZ","DAN","TAN","DTF","RGP","NID","PAS","IMS","EIC","FTN","CIC","PEP"]
  registrationNumber.Add('typeCode', registrationNumber_typeCode);
  registrationNumber.Add('number', registrationNumber_number);
  registrationNumber.Add('issuerCountryCode', registrationNumber_issuerCountryCode);

  // Array bankDetails
  if Trim(bankDetail_name) > '' then
  begin
     bankDetails := TlkJSONlist.Create;
     shipperDetails.Add('bankDetails', bankDetails);

     // Crear el objeto valueAddedService
     bankDetail := TlkJSONobject.Create;
     bankDetails.Add(bankDetail);
     if Trim(bankDetail_name) > '' then
        bankDetail.Add('name', bankDetail_name);
     if Trim(bankDetail_settlementLocalCurrency) > '' then
        bankDetail.Add('settlementLocalCurrency', bankDetail_settlementLocalCurrency);
     if Trim(bankDetail_settlementForeignCurrency) > '' then
        bankDetail.Add('settlementForeignCurrency', bankDetail_settlementForeignCurrency);
  end;

  // "business","direct_consumer","government","other","private","reseller"
  if Trim(typeCode) > '' then
     shipperDetails.Add('typeCode', typeCode);
end;

procedure TDMDHL.customerDetails_receiverDetails(postalCode, cityName, countryCode, provinceCode, addressLine1, addressLine2, addressLine3, countyName, provinceName, countryName, email, phone, mobilePhone, companyName, fullName, registrationNumber_typeCode, registrationNumber_number, registrationNumber_issuerCountryCode, bankDetail_name, bankDetail_settlementLocalCurrency, bankDetail_settlementForeignCurrency, typeCode: string);
var
  customerDetails, receiverDetails : TlkJSONobject;
  postalAddress, contactInformation, registrationNumber, bankDetail : TlkJSONobject;
  registrationNumbers, bankDetails : TlkJSONlist;
begin
  // Verificar si ya existe el nodo parcels
  if Envio.Field['customerDetails'] <> nil then
     customerDetails := TlkJSONobject(Envio.Field['customerDetails'])
  else
  begin
     customerDetails := TlkJSONobject.Create;
     Envio.Add('customerDetails', customerDetails);
  end;

  receiverDetails := TlkJSONobject.Create;
  customerDetails.Add('receiverDetails', receiverDetails);

  postalAddress := TlkJSONobject.Create;
  receiverDetails.Add('postalAddress', postalAddress);
  postalAddress.Add('postalCode', postalCode);
  postalAddress.Add('cityName', cityName);
  postalAddress.Add('countryCode', countryCode);
  if (Trim(provinceCode) > '') then
     postalAddress.Add('provinceCode', provinceCode);
  postalAddress.Add('addressLine1', addressLine1);
  if (Trim(addressLine2) > '') then
     postalAddress.Add('addressLine2', addressLine2);
  if (Trim(addressLine3) > '') then
     postalAddress.Add('addressLine3', addressLine3);
  if (Trim(countyName) > '') then
     postalAddress.Add('countyName', countyName);
  if (Trim(provinceName) > '') then
     postalAddress.Add('provinceName', provinceName);
  postalAddress.Add('countryName', countryName);

  contactInformation := TlkJSONobject.Create;
  receiverDetails.Add('contactInformation', contactInformation);
  if (Trim(email) > '') then
     contactInformation.Add('email', email);
  contactInformation.Add('phone', phone);
  if (Trim(mobilePhone) > '') then
     contactInformation.Add('mobilePhone', mobilePhone);
  contactInformation.Add('companyName', companyName);
  contactInformation.Add('fullName', fullName);

  // Array registrationNumbers
  registrationNumbers := TlkJSONlist.Create;
  receiverDetails.Add('registrationNumbers', registrationNumbers);

  // Crear el objeto valueAddedService
  if Trim(registrationNumber_number) > '' then
  begin
     registrationNumber := TlkJSONobject.Create;
     registrationNumbers.Add(registrationNumber);
     // ["VAT","EIN","SSN","EOR","DUN","FED","STA","CNP","IE","INN","KPP","OGR","OKP","MRN","SDT","FTZ","DAN","TAN","DTF","RGP","NID","PAS","IMS","EIC","FTN","CIC","PEP"]
     registrationNumber.Add('typeCode', registrationNumber_typeCode);
     registrationNumber.Add('number', registrationNumber_number);
     registrationNumber.Add('issuerCountryCode', registrationNumber_issuerCountryCode);
  end;

  // Array bankDetails
  if Trim(bankDetail_name) > '' then
  begin
     bankDetails := TlkJSONlist.Create;
     receiverDetails.Add('bankDetails', bankDetails);

     // Crear el objeto valueAddedService
     bankDetail := TlkJSONobject.Create;
     bankDetails.Add(bankDetail);
     if Trim(bankDetail_name) > '' then
        bankDetail.Add('name', bankDetail_name);
     if Trim(bankDetail_settlementLocalCurrency) > '' then
        bankDetail.Add('settlementLocalCurrency', bankDetail_settlementLocalCurrency);
     if Trim(bankDetail_settlementForeignCurrency) > '' then
        bankDetail.Add('settlementForeignCurrency', bankDetail_settlementForeignCurrency);
  end;

  // "business","direct_consumer","government","other","private","reseller"
  receiverDetails.Add('typeCode', typeCode);
end;

procedure TDMDHL.Contenido(isCustomsDeclarable: boolean; declaredValue: double; declaredValueCurrency, description, USFilingTypeValue, incoterm, unitOfMeasurement: string);
var
  content : TlkJSONobject;
begin
  // Verificar si ya existe el nodo parcels
  if Envio.Field['content'] <> nil then
     content := TlkJSONobject(Envio.Field['content'])
  else
  begin
     content := TlkJSONobject.Create;
     Envio.Add('content', content);
  end;

  content.Add('isCustomsDeclarable', isCustomsDeclarable);
  content.Add('declaredValue', declaredValue);
  content.Add('declaredValueCurrency', declaredValueCurrency);
  content.Add('description', description);
  if Trim(USFilingTypeValue) > '' then
     content.Add('USFilingTypeValue', USFilingTypeValue);
  // ["EXW","FCA","CPT","CIP","DPU","DAP","DDP","FAS","FOB","CFR","CIF","DAF","DAT","DDU","DEQ","DES"]
  content.Add('incoterm', incoterm);

  // ["metric","imperial"]
  if unitOfMeasurement <> '' then
     content.Add('unitOfMeasurement', unitOfMeasurement)
  else
     content.Add('unitOfMeasurement', xDHLTransportistaUNITOFMEASUREMENT.AsString);
end;

procedure TDMDHL.NuevoPaquete(typeCode: string; weight, Length, Width, Height: double; customerReference_value, customerReference_typeCode, description, labelDescription: string);
var
  content, package, dimensions, customerReference : TlkJSONobject;
  packages, customerReferences : TlkJSONlist;
begin
  // Verificar si ya existe el nodo parcels
  if Envio.Field['content'] <> nil then
     content := TlkJSONobject(Envio.Field['content'])
  else
  begin
     content := TlkJSONobject.Create;
     Envio.Add('content', content);
  end;

  // Verificar si ya existe el nodo parcels
  if content.Field['packages'] <> nil then
     packages := TlkJSONlist(content.Field['packages'])
  else
  begin
     packages := TlkJSONlist.Create;
     content.Add('packages', packages);
  end;

  package := TlkJSONobject.Create;
  packages.Add(package);
  // ["1CE","2BC","2BP","2BX","3BX","4BX","5BX","6BX","7BX","8BX","CE1","TBL","TBS","WB1","WB2","WB3","WB6","XPD"]
  if Trim(typeCode) > '' then
     package.Add('typeCode', typeCode);
  package.Add('weight', weight);

  dimensions := TlkJSONobject.Create;
  package.Add('dimensions', dimensions);
  dimensions.Add('length', Length);
  dimensions.Add('width', Width);
  dimensions.Add('height', Height);

  customerReferences := TlkJSONlist.Create;
  package.Add('customerReferences', customerReferences);
  customerReference := TlkJSONobject.Create;
  customerReferences.Add(customerReference);
  customerReference.Add('value', customerReference_value);
  // ["AAO","CU","FF","FN","IBC","LLR","OBC","PRN","ACP","ACS","ACR","CDN","STD","CO"]
  if Trim(customerReference_typeCode) > '' then
     customerReference.Add('typeCode', customerReference_typeCode)
  else
     customerReference.Add('typeCode', 'CU'); // "CU" (referencia del consignador)

  if Trim(description) > '' then
     package.Add('description', description);
  if Trim(labelDescription) > '' then
     package.Add('labelDescription', labelDescription);
end;

procedure TDMDHL.exportDeclarationline(destinationPortName, placeOfIncoterm, payerVATNumber, recipientReference, exporter_id, exporter_code, packageMarks, declarationNote_value, exportReference, exportReason, exportReasonType, license_typeCode, license_value, shipmentType, customsDocument_typeCode, customsDocument_value: string);
var
  content, exportDeclaration, exporter, declarationNote, license, customsDocument : TlkJSONobject;
  declarationNotes, licenses, customsDocuments : TlkJSONlist;
begin
  // Verificar si ya existe el nodo parcels
  if Envio.Field['content'] <> nil then
     content := TlkJSONobject(Envio.Field['content'])
  else
  begin
     content := TlkJSONobject.Create;
     Envio.Add('content', content);
  end;

  // Verificar si ya existe el nodo parcels
  if content.Field['exportDeclaration'] <> nil then
     exportDeclaration := TlkJSONobject(content.Field['exportDeclaration'])
  else
  begin
     exportDeclaration := TlkJSONobject.Create;
     content.Add('exportDeclaration', exportDeclaration);
  end;

  if Trim(destinationPortName) > '' then
     exportDeclaration.Add('destinationPortName', destinationPortName);
  if Trim(placeOfIncoterm) > '' then
     exportDeclaration.Add('placeOfIncoterm', placeOfIncoterm);
  if Trim(payerVATNumber) > '' then
     exportDeclaration.Add('payerVATNumber', payerVATNumber);
  if Trim(recipientReference) > '' then
     exportDeclaration.Add('recipientReference', recipientReference);

  if Trim(exporter_id) > '' then
  begin
     exporter := TlkJSONobject.Create;
     exportDeclaration.Add('exporter', exporter);
     exporter.Add('id', exporter_id);
     exporter.Add('code', exporter_code);
  end;

  if Trim(packageMarks) > '' then
     exportDeclaration.Add('packageMarks', packageMarks);

  //declarationNotes - Hasta 3 registros
  declarationNotes := TlkJSONlist.Create;
  exportDeclaration.Add('declarationNotes', declarationNotes);
  declarationNote := TlkJSONobject.Create;
  declarationNotes.Add(declarationNote);
  declarationNote.Add('value', declarationNote_value);

  if Trim(exportReference) > '' then
     exportDeclaration.Add('exportReference', exportReference);
  if Trim(exportReason) > '' then
     exportDeclaration.Add('exportReason', exportReason);
  if Trim(exportReasonType) > '' then
     exportDeclaration.Add('exportReasonType', exportReasonType);

  //licenses - Hasta 2 registros
  licenses := TlkJSONlist.Create;
  exportDeclaration.Add('licenses', licenses);
  license := TlkJSONobject.Create;
  licenses.Add(license);
  // ["export","import"]
  license.Add('typeCode', license_typeCode);
  license.Add('value', license_value);

  if Trim(shipmentType) > '' then
     // ["personal","commercial"]
     exportDeclaration.Add('shipmentType', shipmentType);

  //customsDocuments - Hasta 50 registros
  customsDocuments := TlkJSONlist.Create;
  exportDeclaration.Add('customsDocuments', customsDocuments);
  customsDocument := TlkJSONobject.Create;
  customsDocuments.Add(customsDocument);
  // ["972","AHC","ALC","ATA","ATR","BEX","CHA","CHD","CHP","CIT","CIV","CI2","COO","CPA","CRL","CSD","DEX","DGD","DLI","DOV","ELP","EU1","EU2","EUS","EXL","FMA","HLC","HWB","INV","IPA","JLC","LIC","LNP","NID","PAS","PFI","PHY","PLI","POA","PCH","ROD","T2M","TAD","TCS","VET","VEX","ORD","OEI","RGR","CHA","CP2"]
  customsDocument.Add('typeCode', customsDocument_typeCode);
  customsDocument.Add('value', customsDocument_value);
end;

procedure TDMDHL.NuevoexportDeclarationlineItems(number: integer; description: string; price, quantity_value: double; quantity_unitOfMeasurement, commodity_typeCode1, commodity_value1, commodity_typeCode2, commodity_value2, exportReasonType, manufacturerCountry, exportControlClassificationNumber: string; netValue, grossValue: double; isTaxesPaid: boolean; line_additionalInformation, customerReference_typeCode1, customerReference_value1, customerReference_typeCode2, customerReference_value2, customsDocument_typeCode1, customsDocument_value1: string);
var
  content, exportDeclaration, lineItem, quantity, commodityCode, weight, customerReference, customsDocument : TlkJSONobject;
  lineItems, commodityCodes, customerReferences, customsDocuments, additionalInformation : TlkJSONlist;
begin
  // Verificar si ya existe el nodo parcels
  if Envio.Field['content'] <> nil then
     content := TlkJSONobject(Envio.Field['content'])
  else
  begin
     content := TlkJSONobject.Create;
     Envio.Add('content', content);
  end;

  // Verificar si ya existe el nodo parcels
  if content.Field['exportDeclaration'] <> nil then
     exportDeclaration := TlkJSONobject(content.Field['exportDeclaration'])
  else
  begin
     exportDeclaration := TlkJSONobject.Create;
     content.Add('exportDeclaration', exportDeclaration);
  end;

  // Verificar si ya existe el nodo parcels
  if exportDeclaration.Field['lineItems'] <> nil then
     lineItems := TlkJSONlist(exportDeclaration.Field['lineItems'])
  else
  begin
     lineItems := TlkJSONlist.Create;
     exportDeclaration.Add('lineItems', lineItems);
  end;

  lineItem := TlkJSONobject.Create;
  lineItems.Add(lineItem);
  lineItem.Add('number', number);
  lineItem.Add('description', description);
  lineItem.Add('price', price);

  quantity := TlkJSONobject.Create;
  lineItem.Add('quantity', quantity);
  quantity.Add('value', quantity_value);
  // PCS (Pieces) ...
  quantity.Add('unitOfMeasurement', quantity_unitOfMeasurement);

  if Trim(commodity_typeCode1) > '' then
  begin
     commodityCodes := TlkJSONlist.Create;
     lineItem.Add('commodityCodes', commodityCodes);
     commodityCode := TlkJSONobject.Create;
     commodityCodes.Add(commodityCode);
     // ["outbound","inbound"]
     commodityCode.Add('typeCode', Trim(commodity_typeCode1));
     commodityCode.Add('value', commodity_value1);
  end;

  if Trim(commodity_typeCode2) > '' then
  begin
     commodityCode := TlkJSONobject.Create;
     commodityCodes.Add(commodityCode);
     // ["outbound","inbound"]
     commodityCode.Add('typeCode', Trim(commodity_typeCode2));
     commodityCode.Add('value', commodity_value2);
  end;

  // ["permanent","temporary","return","used_exhibition_goods_to_origin","intercompany_use","commercial_purpose_or_sale","personal_belongings_or_personal_use","sample","gift","return_to_origin","warranty_replacement","diplomatic_goods","defence_material"]
  if Trim(exportReasonType) > '' then
     lineItem.Add('exportReasonType', exportReasonType);
  lineItem.Add('manufacturerCountry', manufacturerCountry);

  if Trim(exportControlClassificationNumber) > '' then
     lineItem.Add('exportControlClassificationNumber', exportControlClassificationNumber);

  weight := TlkJSONobject.Create;
  lineItem.Add('weight', weight);
  weight.Add('netValue', netValue);
  weight.Add('grossValue', grossValue);

  lineItem.Add('isTaxesPaid', isTaxesPaid);

  // Podria haber mas de una instruccion
  additionalInformation := TlkJSONlist.Create;
  lineItem.Add('additionalInformation', additionalInformation);
  additionalInformation.Add(TlkJSONstring.Generate(line_additionalInformation));

  // Podria haber mas de una referencia
  // ["AFE","BRD","DGC","AAJ","INB","MAK","ALX","PAN","PON","ABW","SE","SON","OID","DTC","DTM","DTQ","DTR","ITR","MID","OED","OET","OOR","SME","USM","AAM","CFR","DOM","FOR","USG","MAT","NLR","DDS","ARN","OP","OSC","TAR","TCO","AEI","EXN","AFK","AEA","PTA"]
  if Trim(customerReference_typeCode1) > '' then
  begin
     customerReferences := TlkJSONlist.Create;
     lineItem.Add('customerReferences', customerReferences);
     customerReference := TlkJSONobject.Create;
     customerReferences.Add(customerReference);
     customerReference.Add('typeCode', customerReference_typeCode1);
     customerReference.Add('value', customerReference_value1);
  end;

  // ["AFE","BRD","DGC","AAJ","INB","MAK","ALX","PAN","PON","ABW","SE","SON","OID","DTC","DTM","DTQ","DTR","ITR","MID","OED","OET","OOR","SME","USM","AAM","CFR","DOM","FOR","USG","MAT","NLR","DDS","ARN","OP","OSC","TAR","TCO","AEI","EXN","AFK","AEA","PTA"]
  if Trim(customerReference_typeCode2) > '' then
  begin
     customerReference := TlkJSONobject.Create;
     customerReferences.Add(customerReference);
     customerReference.Add('typeCode', customerReference_typeCode2);
     customerReference.Add('value', customerReference_value2);
  end;

  // Podria haber mas de una referencia
  // ["972","AHC","ALC","ATA","ATR","BEX","CHA","CHD","CHP","CIT","CIV","CI2","COO","CPA","CRL","CSD","DEX","DGD","DLI","DOV","ELP","EU1","EU2","EUS","EXL","FMA","HLC","HWB","INV","IPA","JLC","LIC","LNP","NID","PAS","PFI","PHY","PLI","POA","PCH","ROD","T2M","TAD","TCS","VET","VEX","ORD","OEI","RGR","CHA","CP2"]
  if Trim(customsDocument_typeCode1) > '' then
  begin
     customsDocuments := TlkJSONlist.Create;
     lineItem.Add('customsDocuments', customsDocuments);
     customsDocument := TlkJSONobject.Create;
     customsDocuments.Add(customsDocument);
     customsDocument.Add('typeCode', customsDocument_typeCode1);
     customsDocument.Add('value', customsDocument_value1);
  end;
end;

procedure TDMDHL.exportDeclarationInvoice(number: string; InvoiceDate: TDateTime; invoice_instruction: string; totalNetWeight, totalGrossWeight: double; termsOfPayment: string; importCustomsDutyValue, importTaxesValue: double; customerReference_typeCode1: string = ''; customerReference_value1: string = ''; customerReference_typeCode2: string = ''; customerReference_value2: string = ''; customerReference_typeCode3: string = ''; customerReference_value3: string = '');
var
  content, exportDeclaration, invoice, indicativeCustomsValues, customerReference : TlkJSONobject;
  //instruction : TlkJSONobject;
  instructions, customerReferences : TlkJSONlist;
begin
  // Verificar si ya existe el nodo parcels
  if Envio.Field['content'] <> nil then
     content := TlkJSONobject(Envio.Field['content'])
  else
  begin
     content := TlkJSONobject.Create;
     Envio.Add('content', content);
  end;

  // Verificar si ya existe el nodo parcels
  if content.Field['exportDeclaration'] <> nil then
     exportDeclaration := TlkJSONobject(content.Field['exportDeclaration'])
  else
  begin
     exportDeclaration := TlkJSONobject.Create;
     content.Add('exportDeclaration', exportDeclaration);
  end;

  invoice := TlkJSONobject.Create;
  exportDeclaration.Add('invoice', invoice);

  invoice.Add('number', number);
  invoice.Add('date', FormatDateTime('yyyy-mm-dd', InvoiceDate));

  // instructions
  if Trim(invoice_instruction) > '' then
  begin
     // Podria haber mas de una instruccion
     instructions := TlkJSONlist.Create;
     invoice.Add('instructions', instructions);
     instructions.Add(TlkJSONstring.Generate(invoice_instruction));
  end;

  if totalNetWeight > 0 then
     invoice.Add('totalNetWeight', totalNetWeight);
  if totalGrossWeight > 0 then
     invoice.Add('totalGrossWeight', totalGrossWeight);

  // customerReferences
  // Puede haber mas de una referencia
  if Trim(customerReference_typeCode1) > '' then
  begin
     customerReferences := TlkJSONlist.Create;
     invoice.Add('customerReferences', customerReferences);
     customerReference := TlkJSONobject.Create;
     customerReferences.Add(customerReference);
     // ["ACL","CID","CN","CU","ITN","UCN","MRN","OID","PON","RMA","AAM","ABT","ADA","AES","AFD","ANT","BKN","BOL","CDN","COD","DSC","FF","FN","FTR","HWB","IBC","IPP","LLR","MAB","MWB","OBC","PD","PRN","RTL","SID","SS","SWN","TAR","TCO","PX","PTA"]
     customerReference.Add('typeCode', customerReference_typeCode1);
     customerReference.Add('value', customerReference_value1);
  end;

  if Trim(customerReference_typeCode2) > '' then
  begin
     customerReference := TlkJSONobject.Create;
     customerReferences.Add(customerReference);
     // ["ACL","CID","CN","CU","ITN","UCN","MRN","OID","PON","RMA","AAM","ABT","ADA","AES","AFD","ANT","BKN","BOL","CDN","COD","DSC","FF","FN","FTR","HWB","IBC","IPP","LLR","MAB","MWB","OBC","PD","PRN","RTL","SID","SS","SWN","TAR","TCO","PX","PTA"]
     customerReference.Add('typeCode', customerReference_typeCode2);
     customerReference.Add('value', customerReference_value2);
  end;

  if Trim(customerReference_typeCode3) > '' then
  begin
     customerReference := TlkJSONobject.Create;
     customerReferences.Add(customerReference);
     // ["ACL","CID","CN","CU","ITN","UCN","MRN","OID","PON","RMA","AAM","ABT","ADA","AES","AFD","ANT","BKN","BOL","CDN","COD","DSC","FF","FN","FTR","HWB","IBC","IPP","LLR","MAB","MWB","OBC","PD","PRN","RTL","SID","SS","SWN","TAR","TCO","PX","PTA"]
     customerReference.Add('typeCode', customerReference_typeCode3);
     customerReference.Add('value', customerReference_value3);
  end;

  if Trim(termsOfPayment) > '' then
     invoice.Add('termsOfPayment', termsOfPayment);

  if importCustomsDutyValue <> 0 then
  begin
     indicativeCustomsValues := TlkJSONobject.Create;
     invoice.Add('indicativeCustomsValues', indicativeCustomsValues);
     indicativeCustomsValues.Add('importCustomsDutyValue', importCustomsDutyValue);
     indicativeCustomsValues.Add('importTaxesValue', importTaxesValue);
  end;
end;

procedure TDMDHL.NuevoexportDeclarationRemarks(Value: string);
var
  content, exportDeclaration, remark : TlkJSONobject;
  remarks : TlkJSONlist;
begin
  // Verificar si ya existe el nodo parcels
  if Envio.Field['content'] <> nil then
     content := TlkJSONobject(Envio.Field['content'])
  else
  begin
     content := TlkJSONobject.Create;
     Envio.Add('content', content);
  end;

  // Verificar si ya existe el nodo parcels
  if content.Field['exportDeclaration'] <> nil then
     exportDeclaration := TlkJSONobject(content.Field['exportDeclaration'])
  else
  begin
     exportDeclaration := TlkJSONobject.Create;
     content.Add('exportDeclaration', exportDeclaration);
  end;

  // Verificar si ya existe el nodo parcels
  if exportDeclaration.Field['remarks'] <> nil then
     remarks := TlkJSONlist(exportDeclaration.Field['remarks'])
  else
  begin
     remarks := TlkJSONlist.Create;
     exportDeclaration.Add('remarks', remarks);
  end;

  remark := TlkJSONobject.Create;
  remarks.Add(remark);
  remark.Add('value', Value);
end;

procedure TDMDHL.NuevoexportDeclarationAdditionalCharges(Value: double; Caption, typeCode: string);
var
  content, exportDeclaration, additionalCharge : TlkJSONobject;
  additionalCharges : TlkJSONlist;
begin
  // Verificar si ya existe el nodo parcels
  if Envio.Field['content'] <> nil then
     content := TlkJSONobject(Envio.Field['content'])
  else
  begin
     content := TlkJSONobject.Create;
     Envio.Add('content', content);
  end;

  // Verificar si ya existe el nodo parcels
  if content.Field['exportDeclaration'] <> nil then
     exportDeclaration := TlkJSONobject(content.Field['exportDeclaration'])
  else
  begin
     exportDeclaration := TlkJSONobject.Create;
     content.Add('exportDeclaration', exportDeclaration);
  end;

  // Verificar si ya existe el nodo parcels
  if exportDeclaration.Field['additionalCharges'] <> nil then
     additionalCharges := TlkJSONlist(exportDeclaration.Field['additionalCharges'])
  else
  begin
     additionalCharges := TlkJSONlist.Create;
     exportDeclaration.Add('additionalCharges', additionalCharges);
  end;

  additionalCharge := TlkJSONobject.Create;
  additionalCharges.Add(additionalCharge);
  additionalCharge.Add('value', Value);
  additionalCharge.Add('caption', Caption);
  additionalCharge.Add('typeCode', typeCode);
end;

procedure TDMDHL.NuevoshipmentNotification(typeCode, receiverId, languageCode, languageCountryCode, bespokeMessage: string);
var
  Notification : TlkJSONobject;
  shipmentNotification : TlkJSONlist;
begin
  // Verificar si ya existe el nodo parcels
  if Envio.Field['shipmentNotification'] <> nil then
     shipmentNotification := TlkJSONlist(Envio.Field['shipmentNotification'])
  else
  begin
     shipmentNotification := TlkJSONlist.Create;
     Envio.Add('shipmentNotification', shipmentNotification);
  end;

  Notification := TlkJSONobject.Create;
  shipmentNotification.Add(Notification);

  // ["email"]
  Notification.Add('typeCode', typeCode);
  Notification.Add('receiverId', receiverId);
  if Trim(languageCode) > '' then
     Notification.Add('languageCode', languageCode);
  if Trim(languageCountryCode) > '' then
     Notification.Add('languageCountryCode', languageCountryCode);
  if Trim(bespokeMessage) > '' then
     Notification.Add('bespokeMessage', bespokeMessage);
end;

procedure TDMDHL.getTransliteratedResponse(Value: boolean);
begin
  Envio.Add('getTransliteratedResponse', Value);
end;

procedure TDMDHL.estimatedDeliveryDate(isRequested: boolean; typeCode: string);
var
  DeliveryDate : TlkJSONobject;
begin
  DeliveryDate := TlkJSONobject.Create;
  Envio.Add('estimatedDeliveryDate', DeliveryDate);

  DeliveryDate.Add('isRequested', isRequested);
  // ["QDDC","QDDF"]
  DeliveryDate.Add('typeCode', typeCode);
end;

procedure TDMDHL.NuevogetAdditionalInformation(isRequested: boolean; typeCode: string);
var
  AdditionalInformation : TlkJSONobject;
  getAdditionalInformation : TlkJSONlist;
begin
  // Verificar si ya existe el nodo parcels
  if Envio.Field['getAdditionalInformation'] <> nil then
     getAdditionalInformation := TlkJSONlist(Envio.Field['getAdditionalInformation'])
  else
  begin
     getAdditionalInformation := TlkJSONlist.Create;
     Envio.Add('getAdditionalInformation', getAdditionalInformation);
  end;

  AdditionalInformation := TlkJSONobject.Create;
  getAdditionalInformation.Add(AdditionalInformation);

  // ["pickupDetails","optionalShipmentData","barcodeInformation","linkLabelsByPieces"]
  AdditionalInformation.Add('typeCode', typeCode);
  AdditionalInformation.Add('isRequested', isRequested);
end;

function TDMDHL.Enviar(var shipmentTrackingNumber: string; Ficheros: TStrings): word;
var
  Body, Respuesta : TStrings;
  Documento : TlkJSONObject;
  JSONArray : TlkJSONList;
  Nodo : TlkJSONBase;
  i : integer;
  imageFormat : string;
  typeCode : string;
  content : string;
  Fichero : string;
  AMemoryStream : TMemoryStream;
begin
  /// Envia peticion y recibe "shipmentTrackingNumber" para luego pedir las etiquetas
  /// Si el resultado no es 200, shipmentTrackingNumber contiene el mensaje de error

  DMMain.LogIni(format('TDMDHL.Enviar(%s, ...) ', [shipmentTrackingNumber]));
  try
     Ficheros.Clear;
     shipmentTrackingNumber := '';
     Body := TStringList.Create;
     Respuesta := TStringList.Create;
     try
        Body.Add(TlkJSON.GenerateText(Envio));

        // Result := 200;
        // Respuesta.Text := '{"data": {"shipmentCode": "028388406528420250826","ecbs": ["28280116636601","28280116636618","28280116636625"],"parcelNumbers": ["07284049298072","07284049298073","07284049298074"]}}';
        // Result := 400
        // Respuesta.Text := {"errors": [ {"title": "BAD_REQUEST", "status": "400", "detail": "Error trying to retrieve cities from API catalogue"} ] }

        Body.SaveToFile(DameTempPath + Format('DHL_shipments_Body_%s.log', [Referencia]));
        Result := WS_DoPost('POST', 'shipments', '', '', Body, Respuesta);
        Respuesta.SaveToFile(DameTempPath + Format('DHL_shipments_Respuesta_%d_%s.log', [Result, Referencia]));

        DMMain.Log(format('Resultado WS_DoPost = %d', [Result]));

        // if (Result = 200) then
        // begin
        Documento := TlkJSON.ParseText(Respuesta.Text) as TlkJSONObject;
        DMMain.Log('Documento := TlkJSON.ParseText(Respuesta.Text)');
        try
           DMMain.Log('if Assigned(Documento) then');
           if Assigned(Documento) then
           begin
              DMMain.Log('Nodo.Field[''shipmentTrackingNumber'']');
              Nodo := Documento.Field['shipmentTrackingNumber'];
              if Assigned(Nodo) then
              begin
                 DMMain.Log('Assigned(Nodo)');
                 if (Nodo is TlkJSONstring) then
                    shipmentTrackingNumber := Nodo.Value;

                 JSONArray := TlkJSONList(Documento.Field['documents']);
                 if Assigned(JSONArray) then
                 begin
                    for i := 0 to JSONArray.Count - 1 do
                    begin
                       imageFormat := '';
                       typeCode := '';

                       // PDF
                       Nodo := TlkJSONObject(JSONArray.Child[i]).Field['imageFormat'];
                       if Assigned(Nodo) then
                          imageFormat := Nodo.Value;

                       // label, invoice, etc.
                       Nodo := TlkJSONObject(JSONArray.Child[i]).Field['typeCode'];
                       if Assigned(Nodo) then
                          typeCode := Nodo.Value;

                       // base64 encoded document
                       Nodo := TlkJSONObject(JSONArray.Child[i]).Field['content'];
                       if Assigned(Nodo) then
                       begin
                          content := Nodo.Value;

                          Fichero := DameTempPath + Format('DHL_%s_%d_%s.%s', [shipmentTrackingNumber, i, typeCode, imageFormat]);
                          AMemoryStream := TMemoryStream.Create;
                          with AMemoryStream do
                          begin
                             try
                                StrB64ToStream(content, AMemoryStream);
                                Position := 0;
                                SaveToFile(Fichero);
                             finally
                                Free;
                             end;
                          end;
                       end;

                       Ficheros.Add(Fichero);
                    end;
                 end;
              end;
           end;
        finally
           Documento.Free
        end;
        // end
        // else
        //    shipmentTrackingNumber := '';
     finally
        Body.Free;
        Respuesta.Free;
     end;
  finally
     DMMain.LogFin(format('TDMDHL.Enviar(%s, ...) ', [shipmentTrackingNumber]));
  end;
end;

procedure TDMDHL.DeclaredValue(currencycode: string; amount: double; exportPaymentType, importPaymentType: string);
//var
//declaredValue : TlkJSONobject;
begin
  (*
  /// exportPaymentType y importPaymentType pueden ser: D=Debidos o P=Pagados
  declaredValue := TlkJSONobject.Create;
  declaredValue.Add('currencyCode', currencyCode);
  declaredValue.Add('amount', amount);
  Envio.Add('declaredValue', declaredValue);

  Envio.Add('exportPaymentType', exportPaymentType);
  Envio.Add('importPaymentType', importPaymentType);
  *)
end;

function TDMDHL.GetLabel(shipmentCode, templateType, file_type, entity: string; Ficheros: TStrings): integer;
  //var
  //Respuesta : TStrings;
  //Documento : TlkJSONObject;
  //JSONArray : TlkJSONList;
  //Nodo : TlkJSONBase;
  //FicheroEtiqueta, LabelBase64 : string;
  //AMemoryStream : TMemoryStream;
  //i : integer;
begin
  Ficheros.Clear;
  Result := -1;
  (*
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

                    FicheroEtiqueta := DameTempPath + Format('DHL_%s_%d.PDF', [shipmentCode, i]);
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
  *)
end;

procedure TDMDHL.GuardarFicheroEnvio(Fichero: string);
var
  ts : TStrings;
begin
  ts := TStringList.Create;
  try
     ts.Add(TlkJSON.GenerateText(Envio));
     ts.SaveTofile(Fichero);
  finally
     ts.Free;
  end;
end;

procedure TDMDHL.rates(var productCode: string; var localProductCode: string; destinationCountryCode: string; destinationPostalCode: string; destinationCityName: string; weight: integer; Length: integer; Height: integer; Width: integer; plannedShippingDate: TDateTime; isCustomsDeclarable: boolean);
var
  accountNumber : string;
  x_version : string;
  originCountryCode : string;
  originPostalCode : string;
  originCityName : string;
  unitOfMeasurement : string;
  pc : string;
  lpc : string;
  pn : string;

  productName : string;
  price, MejorPrecio : double;
  Opciones : string;
  Respuesta : TStrings;
  Documento : TlkJSONObject;
  products, totalPrice : TlkJSONList;
  Nodo : TlkJSONBase;
  i, j : integer;
  Resultado : word;
begin
  productName := '';
  productCode := '';
  localProductCode := '';
  MejorPrecio := 0;

  accountNumber := xDHLTransportistaACCOUNT_NUMBER.AsString;
  x_version := '3.2.0';

  originCountryCode := xDHLTransportistaPICKUP_SHIPPER_COUNTRYCODE.AsString;
  originPostalCode := xDHLTransportistaPICKUP_SHIPPER_POSTALCODE.AsString;
  originCityName := xDHLTransportistaPICKUP_SHIPPER_CITYNAME.AsString;
  unitOfMeasurement := xDHLTransportistaUNITOFMEASUREMENT.AsString;

  /// Envia pregunta a rates y obtiene lista de posibles "productCode"
  /// Se eligirá el más barato

  DMMain.LogIni('TDMDHL.rates()');
  try
     Respuesta := TStringList.Create;
     try
        // https://express.api.dhl.com/mydhlapi/rates?accountNumber=313608773&originCountryCode=ES&originPostalCode=28080&originCityName=Madrid
        //                                           &destinationCountryCode=fr&destinationPostalCode=60540&destinationCityName=Bornel
        //                                           &weight=1&length=1&height=1&width=1&plannedShippingDate=2026-03-24
        //                                           &isCustomsDeclarable=false&unitOfMeasurement=metric&x-version=3.2.0
        Opciones := '';
        Opciones := Opciones + format('?accountNumber=%s', [accountNumber]);
        Opciones := Opciones + format('&originCountryCode=%s', [originCountryCode]);
        Opciones := Opciones + format('&originPostalCode=%s', [EscapeURL(originPostalCode)]);
        Opciones := Opciones + format('&originCityName=%s', [EscapeURL(originCityName)]);
        Opciones := Opciones + format('&destinationCountryCode=%s', [destinationCountryCode]);
        Opciones := Opciones + format('&destinationPostalCode=%s', [EscapeURL(destinationPostalCode)]);

        // Ha dado problemas cuando hay parentesis en el nombre de la ciudad
        destinationCityName := StringReplace(destinationCityName, '(', ' ', [rfReplaceAll]);
        destinationCityName := StringReplace(destinationCityName, ')', ' ', [rfReplaceAll]);
        destinationCityName := StringReplace(destinationCityName, '  ', ' ', [rfReplaceAll]);
        Opciones := Opciones + format('&destinationCityName=%s', [EscapeURL(destinationCityName)]);

        Opciones := Opciones + format('&weight=%d', [weight]);
        Opciones := Opciones + format('&length=%d', [Length]);
        Opciones := Opciones + format('&height=%d', [Height]);
        Opciones := Opciones + format('&width=%d', [Width]);
        Opciones := Opciones + format('&plannedShippingDate=%s', [FormatDateTime('yyyy-mm-dd', plannedShippingDate)]);
        if isCustomsDeclarable then
           Opciones := Opciones + format('&isCustomsDeclarable=%s', ['true'])
        else
           Opciones := Opciones + format('&isCustomsDeclarable=%s', ['false']);
        Opciones := Opciones + format('&unitOfMeasurement=%s', [unitOfMeasurement]);
        Opciones := Opciones + format('&x-version=%s', [x_version]);

        Resultado := WS_DoPost('GET', 'rates', '', Opciones, nil, Respuesta);
        Respuesta.SaveToFile(DameTempPath + Format('DHL_rates_Respuesta_%d.log', [Resultado]));

        DMMain.Log(format('Resultado WS_DoPost = %d', [Resultado]));

        if (Resultado = 200) then
        begin
           Documento := TlkJSON.ParseText(Respuesta.Text) as TlkJSONObject;
           DMMain.Log('Documento := TlkJSON.ParseText(Respuesta.Text)');
           try
              DMMain.Log('if Assigned(Documento) then');
              if Assigned(Documento) then
              begin
                 products := TlkJSONList(Documento.Field['products']);
                 if Assigned(products) then
                 begin
                    for i := 0 to products.Count - 1 do
                    begin
                       Nodo := TlkJSONObject(products.Child[i]).Field['productName'];
                       if Assigned(Nodo) then
                          pn := Nodo.Value;

                       Nodo := TlkJSONObject(products.Child[i]).Field['productCode'];
                       if Assigned(Nodo) then
                          pc := Nodo.Value;

                       Nodo := TlkJSONObject(products.Child[i]).Field['localProductCode'];
                       if Assigned(Nodo) then
                          lpc := Nodo.Value;

                       DMMain.Log(format('Producto[%d]: %s %s - %s', [i, pc, lpc, pn]));

                       totalPrice := TlkJSONList(TlkJSONObject(products.Child[i]).Field['totalPrice']);
                       if Assigned(totalPrice) then
                       begin
                          for j := 0 to totalPrice.Count - 1 do
                          begin
                             DMMain.Log(format('   totalPrice[%d]', [j]));
                             Nodo := TlkJSONObject(totalPrice.Child[j]).Field['priceCurrency'];
                             if Assigned(Nodo) then
                             begin
                                if (Nodo.Value = 'EUR') then
                                begin
                                   Nodo := TlkJSONObject(totalPrice.Child[j]).Field['price'];
                                   if Assigned(Nodo) then
                                   begin
                                      price := Nodo.Value;
                                      DMMain.Log(format('   price %.2f', [price]));
                                      if (productCode = '') or (price < MejorPrecio) then
                                      begin
{
Nombre comercial      | Ámbito                                    | Trafico   | Campo "isCustomsDeclarable" | productCode | Nombre abreviado
DHL EXPRESS WORLDWIDE | Fuera del país de origen, dentro de la UE | Aéreo     | FALSE                       | U           | ECX
ECONOMY SELECT        | Fuera del país de origen, dentro de la UE | Carretera | FALSE                       | W           | ESU
DHL EXPRESS WORLDWIDE | Fuera del país de origen, fuera de la UE  | Aéreo     | TRUE                        | P           | WPX
ECONOMY SELECT        | Fuera del país de origen, fuera de la UE  | Carretera | TRUE                        | H           | ESI
DOMESTIC EXPRESS      | Dentro del mismo pais                     | N/A       | FALSE                       | N           | DOM
}
                                         // KOMBATPADEL solo tiene algunos (U, P y N)
                                         { TODO : Agregar tabla de parametrizacion }
                                         if (pc = 'U') or (pc = 'P') or (pc = 'N') then
                                         begin
                                            MejorPrecio := price;
                                            productName := pn;
                                            productCode := pc;
                                            localProductCode := lpc;

                                            DMMain.Log(format('   Mejor Precio %s %s - %.2f - %s', [productCode, localProductCode, price, productName]));
                                         end;
                                      end;
                                   end
                                   else
                                   begin
                                      price := 0;
                                   end;
                                end;
                             end;
                          end;
                       end;
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
  finally
     DMMain.LogFin(format('TDMDHL.rates() --> %s %s - %s', [productCode, localProductCode, productName]));
  end;
end;

end.
