unit UDMWoocommerce;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DBXpress, FMTBcd, DB, SqlExpr, Dialogs,
  FIBDataSetRO, FIBDatabase, UFIBModificados, ADODB, XMLDoc, XMLIntf;

type
  TDMWoocommerce = class(TDataModule)
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     // Webservice
     WSSecureProtocol: boolean;
     WSURL: string;
     WSURLAPI: string;
     WSKey: string;
     WSSecret: string;
     WSVersion: string;
     WPVersion: string;
     WPLanguage: string;
     WSDebug: boolean;
     IdShop: integer;
     IdGroupShop: integer;
     Recursos: TStrings;
     TaxRuleGroups: TStrings;

     (*
     function DameIdProductAttribute(id_configuracion, id_product, id_attribute: integer): integer;
     *)
     (*
     procedure DameCodigoWoocommerce(ID_A: integer; id_configuracion: integer; var id_product, id_product_attribute: integer; var id_attribute: string);
     *)

     // Webservice
     // function WS_Get(aURL, Token: string): string;
     function DameNodo(Nodo: IXMLNode; a: array of string): IXMLNode;
     function DameDato(Nodo: IXMLNode; a: array of string): string;
     function WS_DoPost(Metodo, Resource: string; id: integer; Opciones: string; Contenido, Respuesta: TStrings; var WP_Total: integer; var WP_TotalPages: integer): integer;
     //function WS_GetResources: integer;
     //procedure WS_GetTaxRuleGroups;
     //function WS_GetIdCountry(Pais: string): integer;
     //function WS_GetIdRootCategory: integer;
     function WS_GetSystemStatus(Respuesta: TStrings): integer;
     // function DameTipoDatoJsChild(js: TlkJSONobject):String;
  public
     { Public declarations }
     id_lang: integer;
     id_country: integer;
     id_root_category: integer;
     procedure ActualizaStockTicket(Empresa, Ejercicio, Canal: integer; Serie, Tipo: string; Rit, Factor: integer);

     // Webservice
     function WS_Inicializa(aURL, aURLGet, aURLApi, aKey, aSecret: string; aDebug: boolean): boolean;
     procedure WS_SetShop(aIdShop, aIdGroupShop: integer);
     procedure WS_DameRecursos(aRecursos: TStrings);
     procedure WS_DameTaxRuleGroups(aTaxRuleGroups: TStrings);
     function WS_DameVersionWS: string;
     function WS_DameVersionWP: string;
     function WS_Add(Resource: string; xml, Respuesta: TStrings): integer;
     function WS_Get(Resource: string; id: integer; Opciones: string; Respuesta: TStrings; var WP_Total: integer; var WP_TotalPages: integer): integer;
     function WS_Edit(Resource: string; id: integer; xml, Respuesta: TStrings): integer;
     function WS_Delete(Resource: string; id: integer; Respuesta: TStrings): integer;
     function WS_DameConteoDeArticulos(Respuesta: TStrings): integer;
  end;

var
  DMWoocommerce : TDMWoocommerce;

implementation

uses UEntorno, UDMMain, HYFIBQuery, IdHttp, IdMultipartFormData, IdSSLOpenSSL, WinInet, HttpConnectionWinInet,
  UFMPruebas, UlkJSON, UUtiles;

{$R *.dfm}

procedure TDMWoocommerce.DataModuleCreate(Sender: TObject);
begin
  DMMain.Log('TDMWoocommerce.DataModuleCreate');
  TranslateComponent(Self); //IDIOMA_CODE

  Recursos := TStringList.Create;
end;

procedure TDMWoocommerce.DataModuleDestroy(Sender: TObject);
begin
  Recursos.Free;
end;

(*
function TDMWoocommerce.DameIdProductAttribute(id_configuracion, id_product, id_attribute: integer): integer;
begin
  /// Devuelve la combinacion en la que se encuentra este producto y atributo
  /// Devuelve el primero que encuentra pero puede estar en mas de una combinacion
  /// Ejemplo:
  ///     Pantalon Talla 40 Color Blanco, Pantalon Talla 42 Color Blanco, Pantalon Talla 44 Color Blanco
  ///     Si busco el atributo "Blanco" puede estar en las 3 combinaciones de TALLA

  Result := 0;

  if (MYSQLConnection.Connected) then
  begin
     with QMySql do
     begin
        try
           if (Active) then
              Close;
           SQL.Clear;
           SQL.Add(' select a.id_product_attribute from ps_product_attribute a ');
           SQL.Add(' join ps_product_attribute_combination c ');
           SQL.Add(' on a.id_product_attribute = c.id_product_attribute ');
           SQL.Add(' where ');
           SQL.Add(' a.id_product = :id_product and ');
           SQL.Add(' c.id_attribute = :id_attribute ');
           Parameters.FindParam('id_product').Value := id_product;
           Parameters.FindParam('id_attribute').Value := id_attribute;
           Open;
           if (not IsEmpty) then
              Result := Fields[0].Value;
           Close;
        except
           on e: Exception do
              ShowMessage(_('Error al obtener id_product_attribute') + #13#10 + e.Message);
        end;
     end;
  end;
end;
*)
(*
procedure TDMWoocommerce.DameCodigoWoocommerce(ID_A: integer; id_configuracion: integer; var id_product, id_product_attribute: integer; var id_attribute: string);
var
  Q : THYFIBQuery;
begin
  id_product := 0;
  id_attribute := '';
  id_product_attribute := 0;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_PRODUCT, ID_PRODUCT_ATTRIBUTE, ID_ATTRIBUTES FROM SYS_CONF_PRESTASHOP_ARTICULO ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_CONFIGURACION = :ID_CONFIGURACION AND ');
        SQL.Add(' ID_A = :ID_A ');
        Params.ByName['ID_CONFIGURACION'].AsInteger := id_configuracion;
        Params.ByName['ID_A'].AsInteger := ID_A;
        ExecQuery;
        id_product := FieldByName['ID_PRODUCT'].AsInteger;
        id_product_attribute := FieldByName['ID_PRODUCT_ATTRIBUTE'].AsInteger;
        id_attribute := FieldByName['ID_ATTRIBUTES'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  // Si no encontré la combinación, pero hay un solo atributo
  if ((id_product_attribute = 0) and (StrToIntDef(id_attribute, 0) > 0)) then
     id_product_attribute := DameIdProductAttribute(id_configuracion, id_product, StrToIntDef(id_attribute, 0));
end;
*)
procedure TDMWoocommerce.ActualizaStockTicket(Empresa, Ejercicio, Canal: integer; Serie, Tipo: string; Rit, Factor: integer);
var
  DS : TFIBDataSetRO;
begin
  raise Exception.Create(_('No implementado'));

  // Aqui debo recorrer las lineas y actualizar las unidades en la tienda virtual
  DS := TFIBDataSetRO.Create(nil);
  try
     with DS do
     begin
        DataBase := DMMain.DataBase;
        SelectSQL.Clear;
        SelectSQL.Add('SELECT ID_A, ARTICULO, UNIDADES FROM GES_TICKET_DETALLE ');
        SelectSQL.Add('WHERE EMPRESA = ?EMPRESA AND ');
        SelectSQL.Add('EJERCICIO = ?EJERCICIO AND ');
        SelectSQL.Add('CANAL = ?CANAL AND ');
        SelectSQL.Add('SERIE =?SERIE AND ');
        SelectSQL.Add('TIPO = ?TIPO AND ');
        SelectSQL.Add('RIT = ?RIT ');
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['RIT'].AsInteger := Rit;
        Open;
        while not EOF do
        begin
           // ModificarStockTienda(FieldByName('ID_A').AsInteger, Factor * FieldByName('UNIDADES').AsFloat);
           Next;
        end;
        Close;
     end;
  finally
     FreeAndNil(DS);
  end;
end;

function TDMWoocommerce.WS_DoPost(Metodo, Resource: string; id: integer; Opciones: string; Contenido, Respuesta: TStrings; var WP_Total: integer; var WP_TotalPages: integer): integer;
var
  aURL : string;
  //js, xs : TlkJSONobject;
  HttpConnectionWinInet : THttpConnectionWinInet;
  AContent, AResponse : TStream;
begin
  // Construyo la URL
  if WSSecureProtocol then
     aURL := 'https://'
  else
     aURL := 'http://';

  // Definimos la Url Api para el conteo de productos
  if (Resource = 'products/count') then
     aURL := aURL + WSURLAPI + Resource
  else
     aURL := aURL + WSURL + Resource;

  if (id <> 0) then
     aURL := aURL + '/' + IntToStr(id);

  // Se asigna consumer_key y consumer_secret
  // DMMain.Log.Add(_('Se asigna consumer_key y consumer_secret'));
  aURL := aURL + '?consumer_key=' + WSKey;
  aURL := aURL + '&consumer_secret=' + WSSecret;

  if (Opciones > '') then
     aURL := aURL + Opciones;

{  if (IdShop <> 0) then
     aURL := aURL + '&id_shop=' + IntToStr(IdShop);

  if (IdGroupShop <> 0) then
     aURL := aURL + '&id_group_shop=' + IntToStr(IdGroupShop);
 }
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
           // BasicAuthentication_UserName := WSKey;
           // BasicAuthentication_Password := '' {WSSecret};

           // Headers.Add('Username='+Token);
           // Headers.Add('Authorization='+Token);
           // Headers.Add('ws_key='+Token);
           Headers.Add('Accept=*/*');
           // Headers.Add('Content-Type=application/x-www-form-urlencoded');
           Headers.Add('Content-Type=application/json');
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

           WP_Total := StrToIntDef(GetResponseHeader('X-WP-Total'), 0);
           WP_TotalPages := StrToIntDef(GetResponseHeader('X-WP-TotalPages'), 0);

           Result := GetResponseCode;
        end;

        if Assigned(Respuesta) then
        begin
           AResponse.Position := 0;
           Respuesta.LoadFromStream(AResponse);
        end;
        DMMain.Log('WP_Total: ' + IntToStr(WP_Total));
        DMMain.Log('WP_TotalPages: ' + IntToStr(WP_TotalPages));
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
       FMPruebas.Log('id: ' + IntToStr(id));
       FMPruebas.Log('Opciones: ' + Opciones);
       FMPruebas.Log('URL: ' + aURL);
       if Assigned(Contenido) then
          FMPruebas.Log('Contenido: ' + Contenido.Text);
       FMPruebas.Log('WP_Total: ' + IntToStr(WP_Total));
       FMPruebas.Log('WP_TotalPages: ' + IntToStr(WP_TotalPages));
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

function TDMWoocommerce.WS_Inicializa(aURL, aURLGet, aURLApi, aKey, aSecret: string; aDebug: boolean): boolean;
var
  Documento, NodoPadre, Nodo : TlkJSONbase;
  Respuesta : TStrings;
  URLGet, URLApi : string;
begin
  // Quito protocolo delante de la direccion
  WSSecureProtocol := False;
  URLGet := aURL + aURLGet;
  URLApi := aURL + aURLApi;
  if (Pos('https://', aURL) > 0) then
  begin
     WSURL := Copy(URLGet, 9, Length(URLGet));
     WSURLAPI := Copy(URLApi, 9, Length(URLApi));
     WSSecureProtocol := True;
  end
  else
  if (Pos('http://', aURL) > 0) then
  begin
     WSURL := Copy(URLGet, 8, Length(URLGet));
     WSURLAPI := Copy(URLApi, 8, Length(URLApi));
  end
  else
  begin
     WSURL := URLGet;
     WSURLAPI := URLApi;
  end;

  WSKey := aKey;
  WSSecret := aSecret;
  WSVersion := '';
  WPVersion := '';
  WPLanguage := '';
  WSDebug := aDebug;

  // Inicializacion correcta si se puede realizar conexión y obtener recursos habilitados
  Result := False;
  Respuesta := TStringList.Create;
  try
     if (WS_GetSystemStatus(Respuesta) = 200) then
     begin
        // Busco datos de Woocommerce y Wordpress
        // {"environment": {... "version": "5.6.0" ... } ... }
        // {"environment": {... "wp_version": "5.8.1" ... } ... }
        // {"environment": {... "language": "es_ES" ... } ... }
        Documento := TlkJSON.ParseText(Respuesta.Text);
        try
           if Assigned(Documento) then
           begin
              NodoPadre := Documento.Field['environment'];
              if Assigned(NodoPadre) then
              begin
                 // Version del Webservice
                 Nodo := NodoPadre.Field['version'];
                 if Assigned(Nodo) then
                    WSVersion := Nodo.Field['version'].Value;

                 // Version de Wordpress
                 Nodo := NodoPadre.Field['wp_version'];
                 if Assigned(Nodo) then
                    WPVersion := Nodo.Field['wp_version'].Value;

                 // Idioma de Wordpress
                 Nodo := NodoPadre.Field['language'];
                 if Assigned(Nodo) then
                    WPLanguage := Nodo.Field['language'].Value;
              end;
           end;
        finally
           Documento.Free;
        end;

        Result := True;
     end;
  finally
     Respuesta.Free;
  end;
end;

procedure TDMWoocommerce.WS_SetShop(aIdShop, aIdGroupShop: integer);
begin
  IdShop := aIdShop;
  IdGroupShop := aIdGroupShop;
end;

function TDMWoocommerce.WS_Add(Resource: string; xml, Respuesta: TStrings): integer;
var
  WP_Total, WP_TotalPages : integer;
begin
  /// Crea recurso xml y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('POST', Resource, 0, '', xml, Respuesta, WP_Total, WP_TotalPages);
end;

function TDMWoocommerce.WS_Get(Resource: string; id: integer; Opciones: string; Respuesta: TStrings; var WP_Total: integer; var WP_TotalPages: integer): integer;
begin
  /// Obtiene recurso y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP
  /// WP_Total y WP_TotalPages es la cantidad de recursos y la cantidad de paginas.

  Result := WS_DoPost('GET', Resource, id, Opciones, nil, Respuesta, WP_Total, WP_TotalPages);
end;

function TDMWoocommerce.WS_Edit(Resource: string; id: integer; xml, Respuesta: TStrings): integer;
var
  WP_Total, WP_TotalPages : integer;
begin
  /// Modifica recurso de xml y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('PUT', Resource, id, '', xml, Respuesta, WP_Total, WP_TotalPages);
end;

function TDMWoocommerce.WS_Delete(Resource: string; id: integer; Respuesta: TStrings): integer;
var
  WP_Total, WP_TotalPages : integer;
begin
  /// Borra recurso con id y lo devuelve en Respuesta.
  /// El resultado es el codigo de respuesta HTTP

  Result := WS_DoPost('DELETE', Resource, id, '', nil, Respuesta, WP_Total, WP_TotalPages);
end;

function TDMWoocommerce.DameNodo(Nodo: IXMLNode; a: array of string): IXMLNode;
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

function TDMWoocommerce.DameDato(Nodo: IXMLNode; a: array of string): string;
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

{function TDMWoocommerce.WS_GetResources: integer;
var
  i : integer;
  Respuesta : TStrings;
  WP_Total, WP_TotalPages : integer;
  Documento : TXMLDocument;
  NodoApi : IXMLNode;
  Nodo : IXMLNode;
begin
  /// Obtiene recursos habilitados
  /// Devuelve el resultado de la consulta http

  Recursos.Clear;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     Result := WS_DoPost('GET', '', 0, '', nil, Respuesta, WP_Total, WP_TotalPages);
     {$IFDEF Debug}
{Respuesta.SaveToFile(DameTempPath+'Respuesta-resources.xml');
     {$ENDIF}

     {if (Result = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           NodoApi := DameNodo(Documento.DocumentElement, ['api']);
           if Assigned(NodoApi) then
           begin
              for i := 0 to NodoApi.ChildNodes.Count - 1 do
              begin
                 Nodo := NodoApi.ChildNodes.Get(i);
                 Recursos.Add(Nodo.NodeName);
              end;
           end;
        end;
     end;
  finally
     Respuesta.Free;
     Documento.Free;
  end;}
{end;}

function TDMWoocommerce.WS_GetSystemStatus(Respuesta: TStrings): integer;
var
  //i : integer;
  WP_Total, WP_TotalPages : integer;
begin
  /// Devuelve el estado del servidor woocommerce
  Result := WS_Get('system_status', 0, '', Respuesta, WP_Total, WP_TotalPages);

  // Aqui habria que obtener datos de json si se desean
  {
  if (Result = 200) then
  begin

  end;
  }
end;

{procedure TDMWoocommerce.WS_GetTaxRuleGroups;
var
  i, id, Resultado : integer;
  Respuesta : TStrings;
  WP_Total, WP_TotalPages : integer;
  Documento : TXMLDocument;
  NodoPadre, Nodo : IXMLNode;
begin
  /// Obtiene Tipos de IVA
  /// https://prestashop.delfos.net/api/tax_rule_groups/?ws_key=xxxxxxxxxxxxxxxxxxxxxxxxxxxx&filter[active]=[1]&filter[deleted]=[0]&display=[id,name]

  TaxRuleGroups.Clear;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     // Resultado := WS_DoPost('GET', 'tax_rule_groups', 0, '&filter[active]=[1]&filter[deleted]=[0]&display=[id,name]', nil, Respuesta);
     Resultado := WS_DoPost('GET', 'tax_rule_groups', 0, '&filter[active]=[1]&display=[id,name]', nil, Respuesta, WP_Total, WP_TotalPages);
     {$IFDEF Debug}
     {Respuesta.SaveToFile(DameTempPath+'Respuesta-tax_rule_groups.xml');
     {$ENDIF}

     {if (Resultado = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           NodoPadre := DameNodo(Documento.DocumentElement, ['tax_rule_groups']);
           if Assigned(NodoPadre) then
           begin
              for i := 0 to NodoPadre.ChildNodes.Count - 1 do
              begin
                 Nodo := NodoPadre.ChildNodes.Get(i);

                 id := StrToInt(DameDato(Nodo, ['id']));
                 TaxRuleGroups.AddObject(DameDato(Nodo, ['name']), Pointer(id));
              end;
           end;
        end;
     end;
  finally
     Respuesta.Free;
     Documento.Free;
  end;}
{end;}

{function TDMWoocommerce.WS_GetIdCountry(Pais: string): integer;
var
  Respuesta : TStrings;
  WP_Total, WP_TotalPages : integer;
  Documento : TXMLDocument;
  Nodo : IXMLNode;
  CodigoRespuesta : integer;
begin
  // Pais debe ser el codigo ISO en dos caracteres. (España = ES)

  Result := 0;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     CodigoRespuesta := DMWoocommerce.WS_Get('countries', 0, '&display=full&filter[iso_code]=[' + Pais + ']', Respuesta, WP_Total, WP_TotalPages);
     {$IFDEF Debug}
     {Respuesta.SaveToFile(DameTempPath+'Respuesta-countries.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     {if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           Nodo := DameNodo(Documento.DocumentElement, ['countries', 'country']);
           if Assigned(Nodo) then
           begin
              Result := StrToInt(DameDato(Nodo, ['id']));
           end;
        end;
     end
     else
        ShowMessage('(countries)' + _('No se pudo obtener dato de Woocommerce. (WS_GetIdCountry)') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;}
{end;}

{function TDMWoocommerce.WS_GetIdRootCategory: integer;
var
  Respuesta : TStrings;
  WP_Total, WP_TotalPages : integer;
  Documento : TXMLDocument;
  Nodo : IXMLNode;
  CodigoRespuesta : integer;
begin
  // Pais debe ser el codigo ISO en dos caracteres. (España = ES)

  Result := 0;

  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     CodigoRespuesta := DMWoocommerce.WS_Get('categories', 0, '&display=full&filter[is_root_category]=[1]', Respuesta, WP_Total, WP_TotalPages);
     {$IFDEF Debug}
     {Respuesta.SaveToFile(DameTempPath+'Respuesta-categories-root.xml');
     {$ENDIF}

     // Si la respuesta es correcta
     {if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           XML.Text := Respuesta.Text;
           Active := True;

           Nodo := DameNodo(Documento.DocumentElement, ['categories', 'category']);
           if Assigned(Nodo) then
           begin
              Result := StrToInt(DameDato(Nodo, ['id']));
           end;
        end;
     end
     else
        ShowMessage('(categories-root)' + _('No se pudo obtener dato de Woocommerce. (WS_WS_GetIdRootCategory)') + #13#10 + Format('Respuesta: %d', [CodigoRespuesta]) + #13#10 + Respuesta.Text);
  finally
     Respuesta.Free;
     Documento.Free;
  end;}
{end;}

procedure TDMWoocommerce.WS_DameRecursos(aRecursos: TStrings);
begin
  aRecursos.Clear;
  aRecursos.AddStrings(Recursos);
end;

procedure TDMWoocommerce.WS_DameTaxRuleGroups(aTaxRuleGroups: TStrings);
begin
  aTaxRuleGroups.Clear;
  aTaxRuleGroups.AddStrings(TaxRuleGroups);
end;

function TDMWoocommerce.WS_DameVersionWS: string;
begin
  Result := WSVersion;
end;

function TDMWoocommerce.WS_DameVersionWP: string;
begin
  Result := WPVersion;
end;

function TDMWoocommerce.WS_DameConteoDeArticulos(Respuesta: TStrings): integer;
var
  //i : integer;
  WP_Total, WP_TotalPages : integer;
begin
  /// Devuelve el estado del servidor woocommerce
  Result := WS_Get('ProductosCount', 0, 'count', Respuesta, WP_Total, WP_TotalPages);
end;

{
function TDMWoocommerce.DameTipoDatoJsChild(js:TlkJSONobject):String;
begin
  if not assigned(js) then
    begin
      result 'sin asignar'
      readln;
      exit;
    end
  else
  begin
    if js.Field['childobject'] is TlkJSONnumber then
       result 'number'
    else if js.Field['childobject'] is TlkJSONstring then
       result 'string'
    else if js.Field['childobject'] is TlkJSONboolean then
       result 'boolean'
    else if js.Field['childobject'] is TlkJSONnull then
       result 'null'
    else if js.Field['childobject'] is TlkJSONlist then
       result 'list'
    else if js.Field['childobject'] is TlkJSONobject then
       result 'object';
  end;
end;
}

end.
