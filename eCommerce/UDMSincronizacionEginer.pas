unit UDMSincronizacionEginer;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, XMLDoc, XMLIntf, FIBDatabase, UFIBModificados, DB,
  FIBDataSet, FIBTableDataSet;

type
  TDMSincronizacionEginer = class(TDataModule)
     xUsuarios: TFIBTableSet;
     DSxUsuarios: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xUsuariosUSUARIOID: TFIBStringField;
     xUsuariosEMAIL: TFIBStringField;
     xUsuariosNOMBRE: TFIBStringField;
     xUsuariosID_USUARIO: TIntegerField;
     xUsuariosDATE_UPD: TDateTimeField;
     xAtributos: TFIBTableSet;
     DSxAtributos: TDataSource;
     xArticulos: TFIBTableSet;
     DSxArticulos: TDataSource;
     xCombinaciones: TFIBTableSet;
     DSxCombinaciones: TDataSource;
     xCombinacionArtributo: TFIBTableSet;
     DSxCombinacionAtributo: TDataSource;
     xElementosBorrados: TFIBTableSet;
     DSxElementosBorrados: TDataSource;
     xStocks: TFIBTableSet;
     DSsStocks: TDataSource;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     URL: string;
     LogSincronizacionPedidos: TStrings;
     LogSincronizacionArticulos: TStrings;
     LogSincronizacionUsuarios: TStrings;
     LogSincronizacionStocks: TStrings;
     function WS_DoPost(Metodo, Resource: string; id: integer; Contenido, Respuesta: TStrings): integer;
     function DameDato(Nodo: IXMLNode; a: array of string): string;
     function DameNodo(Nodo: IXMLNode; a: array of string): IXMLNode;
     function SincronizarBorraElementos(aURL: string; Tipo: string; Id: integer): boolean;
     function SincronizarUnUsuario(aURL: string; IdUsuario: integer): boolean;
     function SincronizarUnAtributo(aURL: string; Id: integer): boolean;
     function SincronizarUnArticulo(aURL: string; Id: integer): boolean;
     function SincronizarUnStock(aURL, Articulo: string; Id: integer; Stock: double; EsVirtual: boolean = False): boolean;
     function SincronizarUnaCombinacion(aURL: string; Id: integer): boolean;
     function SincronizarUnaCombinacionArtributo(aURL: string; Id: integer): boolean;
     function SincronizarObtenerPedidos(aURL: string; UtlimoPedidoSincronizado: integer): integer;
     function SincronizarEstadoPedidos(aURL: string; FechaUltimaSincronizacion: TDateTime): boolean;
     procedure Log(Tipo, s: string);
  public
     { Public declarations }
     procedure SincronizarPedidos(aURL: string; var UtlimoPedidoSincronizado: integer; var FechaUltimaSincronizacion: TDateTime);
     function SincronizarUsuarios(aURL: string; FechaUltimaSincronizacion: TDateTime): TDateTime;
     function SincronizarArticulos(aURL: string; FechaUltimaSincronizacion: TDateTime): TDateTime;
     function SincronizarStock(aURL: string; FechaUltimaSincronizacion: TDateTime): TDateTime;
     procedure RefrescaUsuarios(Fecha: TDateTime);
     procedure RefrescaArticulos(Fecha: TDateTime);
     procedure RefrescaStocks(Fecha: TDateTime);
     function DameUltimaFechaSincronizacion(Tipo: string): TDateTime;
     function DameUltimoIdSincronizacion(Tipo: string): integer;
     procedure SetUltimaSincronizacion(Tipo: string; Id: integer); overload;
     procedure SetUltimaSincronizacion(Tipo: string; Fecha: TDateTime); overload;
     procedure SetRelacionSincronizacion(Tipo: string; IdOrigen, IdDestino: integer);
     function GetRelacionSincronizacion(Tipo: string; IdOrigen: integer): integer;
     procedure AsignaLog(Tipo: string; Log: TStrings);
  end;

var
  DMSincronizacionEginer : TDMSincronizacionEginer;

implementation

uses UEntorno, UDMMain, UUtiles, HYFIBQuery,
  IdHttp, IdMultipartFormData, IdSSLOpenSSL, WinInet, HttpConnectionWinInet,
  idBaseComponent, IdCoderMIME,
  ExtCtrls, UDMAdjunto, UFormGest, UDameDato, UImagenes;

{$R *.dfm}

procedure TDMSincronizacionEginer.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  LogSincronizacionPedidos := nil;
  LogSincronizacionArticulos := nil;
  LogSincronizacionUsuarios := nil;
end;

function TDMSincronizacionEginer.DameNodo(Nodo: IXMLNode; a: array of string): IXMLNode;
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

function TDMSincronizacionEginer.DameDato(Nodo: IXMLNode; a: array of string): string;
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
        Result := Nodo.Text
     else
     if Nodo.NodeType = ntCData then
        Result := Nodo.NodeValue
     else
     if Nodo.NodeType = ntElement then
     begin
        Nodo := Nodo.ChildNodes.First;
        if Assigned(Nodo) then
        begin
           if Nodo.IsTextElement then
              Result := Nodo.Text
           else
           if Nodo.NodeType = ntCData then
              Result := Nodo.NodeValue;
        end;
     end;
  end;
end;

function TDMSincronizacionEginer.SincronizarObtenerPedidos(aURL: string; UtlimoPedidoSincronizado: integer): integer;
var
  Contenido, Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
  i : integer;
  IdPedido : integer;
  IdUsuario : integer;
  Fecha : TDateTime;
  Estado : integer;
  Total : double;
  ImportePortes : double;
  ZRefCliente : string;
  ZObservaciones : string;
  IdLinea : integer;
  IdArticulo : integer;
  Articulo : string;
  Titulo : string;
  CodigoLlave : string;
  ImagenBase64 : string;
  FicheroImagen : string;
  Unidades : double;
  Precio : double;
  Descuento : double;
  TotalLinea : double;
  IdDoc, IdDetalleDoc : integer;
  AMemoryStream : TMemoryStream;
  TipoPortes : integer;
  ConCualquierLlave : integer;
  EnviaranFoto : integer;

  function CreaCabecera(IdPedido, IdUsuario: integer; Fecha: TDateTime; ZRefCliente: string; ZObservaciones: string; ImportePortes: double): integer;
  var
     Cliente, Direccion, Contacto, Transportista : integer;
     UsuarioWeb : string;
     IdDoc : integer;
  begin
     // Verificar si ya existe el pedido relacionado.
     IdDoc := GetRelacionSincronizacion('PEC', IdPedido);

     if (IdDoc = 0) then
     begin
        // Obtener Cliente y direccion asociado al usuario

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT U.USUARIOID, C.CLIENTE, U.DIRECCION, U.CONTACTO, D.DIR_TRANSPORTISTA FROM USUARIOS_WEB U ');
              SQL.Add(' JOIN EMP_CLIENTES C ON U.ID_CLIENTE_AGENTE = C.ID_CLIENTE ');
              SQL.Add(' LEFT JOIN SYS_TERCEROS_DIRECCIONES D ON D.TERCERO = C.TERCERO AND D.DIRECCION = U.DIRECCION ');
              SQL.Add(' WHERE ');
              SQL.Add(' ID_USUARIO = :ID_USUARIO ');

              Params.ByName['ID_USUARIO'].AsInteger := IdUsuario;
              ExecQuery;
              UsuarioWeb := FieldByName['USUARIOID'].AsString;
              Cliente := FieldByName['CLIENTE'].AsInteger;
              Direccion := FieldByName['DIRECCION'].AsInteger;
              Contacto := FieldByName['CONTACTO'].AsInteger;
              Transportista := FieldByName['DIR_TRANSPORTISTA'].AsInteger;
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
              SQL.Add(' EXECUTE PROCEDURE WEB_INS_CABECERA_VENTA_6 ');
              SQL.Add(' (:USUARIOID, :TIPO, :CLIENTE, :REFERENCIA, :ENTRADA, :ALMACEN, :FECHA_DOC, ');
              SQL.Add(' :AGENTE, :SERIE, :RIG_IN, :CANAL, :LISTO_PARA_PREPARAR, :DIRECCION) ');
              Params.ByName['USUARIOID'].AsString := UsuarioWeb;
              Params.ByName['TIPO'].AsString := 'PEC';
              Params.ByName['CLIENTE'].AsInteger := Cliente;
              Params.ByName['REFERENCIA'].AsString := Format('SPEEDLOCK %d', [IdPedido]);
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['ALMACEN'].AsString := '';
              Params.ByName['FECHA_DOC'].AsDateTime := Fecha;
              Params.ByName['AGENTE'].AsInteger := 0;
              Params.ByName['SERIE'].AsString := '';
              Params.ByName['RIG_IN'].AsInteger := 0;
              Params.ByName['CANAL'].AsInteger := 0;
              Params.ByName['LISTO_PARA_PREPARAR'].AsInteger := 0;
              Params.ByName['DIRECCION'].AsInteger := Direccion;
              ExecQuery;
              IdDoc := FieldByName['ID_S'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;

        TipoPortes := 4;
        if ImportePortes = 0 then
           TipoPortes := 0;

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' UPDATE VER_CABECERAS_PEDIDO ');
              SQL.Add(' SET ');
              SQL.Add(' CONTACTO = :CONTACTO, ');
              SQL.Add(' PEDIDO_CLIENTE = :PEDIDO_CLIENTE, ');
              SQL.Add(' Z_OBSERVACION = :Z_OBSERVACION, ');
              SQL.Add(' TIPO_PORTES = :TIPO_PORTES, ');
              SQL.Add(' I_PORTES = :I_PORTES ');
              if (Transportista <> 0) then
                 SQL.Add(' ,TRANSPORTISTA = :TRANSPORTISTA ');
              SQL.Add(' WHERE ');
              SQL.Add(' ID_S = :ID_S ');
              Params.ByName['ID_S'].AsInteger := IdDoc;
              Params.ByName['CONTACTO'].AsInteger := Contacto;
              Params.ByName['PEDIDO_CLIENTE'].AsString := ZRefCliente;
              Params.ByName['Z_OBSERVACION'].AsString := ZObservaciones;
              Params.ByName['TIPO_PORTES'].AsInteger := TipoPortes;
              Params.ByName['I_PORTES'].AsFloat := ImportePortes;
              if (Transportista <> 0) then
                 Params.ByName['TRANSPORTISTA'].AsInteger := Transportista;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        SetRelacionSincronizacion('PEC', IdPedido, IdDoc);
     end;

     Result := IdDoc;
  end;

  function CreaDetalle(IdDoc, IdLinea, IdArticulo: integer; Titulo, CodigoLlave: string; ConCualquierLlave, EnviaranFoto: integer; ImagenLlave: boolean; Unidades, Precio, Descuento: double): integer;
  var
     Notas : TStrings;
  begin
     IdDetalleDoc := 0;
     // Verificar si ya existe el pedido relacionado.
     if (IdLinea <> 0) then
        IdDetalleDoc := GetRelacionSincronizacion('PED', IdLinea);

     if (IdDetalleDoc = 0) then
     begin
        Notas := TStringList.Create;
        try
           if (CodigoLlave > '') then
              Notas.Add(Format(_('Codigo de llave: %s'), [CodigoLlave]));
           if (ImagenLlave) then
              Notas.Add(_('Adjunta Imagen'));
           if (EnviaranFoto = 1) then
              Notas.Add(_('Enviaran foto'));
           if (ConCualquierLlave = 1) then
              Notas.Add(_('Con cualquier llave'));

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'EXECUTE PROCEDURE WEB_INS_DETALLE_VENTA (:TIPO, :ID_S, :ID_A, :TITULO, :UNIDADES, :NOTAS, :PRECIO, :DESCUENTO)';
                 Params.ByName['TIPO'].AsString := 'PEC';
                 Params.ByName['ID_S'].AsInteger := IdDoc;
                 Params.ByName['ID_A'].AsInteger := IdArticulo;
                 Params.ByName['TITULO'].AsString := Titulo;
                 Params.ByName['UNIDADES'].AsFloat := Unidades;
                 Params.ByName['PRECIO'].AsFloat := Precio;
                 Params.ByName['DESCUENTO'].AsFloat := Descuento;
                 Params.ByName['NOTAS'].AsString := Notas.Text;
                 ExecQuery;
                 IdDetalleDoc := FieldByName['ID_DETALLES_S'].AsInteger;
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
                 SQL.Text := 'UPDATE GES_DETALLES_S SET PRO_NUM_PLANO = :PRO_NUM_PLANO WHERE ID_DETALLES_S = :ID_DETALLES_S';
                 Params.ByName['PRO_NUM_PLANO'].AsString := Copy(Notas.DelimitedText, 1, 35);
                 Params.ByName['ID_DETALLES_S'].AsInteger := IdDetalleDoc;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        finally
           Notas.Free;
        end;

        if (IdLinea <> 0) then
           SetRelacionSincronizacion('PED', IdLinea, IdDetalleDoc);
     end;

     Result := IdDetalleDoc;
  end;

begin
  URL := aURL;
  Result := -1;
  AbreData(TDMAdjunto, DMAdjunto);
  Contenido := TStringList.Create;
  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     CodigoRespuesta := WS_DoPost('POST', 'pedidos/getPedido.php', UtlimoPedidoSincronizado, Contenido, Respuesta);

     Log('PEC', 'CodigoRespuesta: ' + IntToStr(CodigoRespuesta));

     // Si obtengo respuesta trato el xml del pedido obtenido
     if (CodigoRespuesta = 200) then
     begin
        with Documento do
        begin
           try
              XML.Text := Respuesta.Text;
              XML.Text := FormatXMLData(XML.Text);
              Active := True;
           except
              on E: Exception do
              begin
                 Log('PEC', 'ERROR');
                 Log('PEC', E.Message);
                 Log('PEC', Format('XML Respuesta: %sGET_PEDIDO_Error.xml', [DameTempPath]));
                 XML.SaveToFile(DameTempPath + 'GET_PEDIDO_Error.xml');
                 Log('PEC', '');
              end;
           end;

           // Recorro los pedidos
           NodoPadre := Documento.DocumentElement; // DameNodo(Documento.DocumentElement, ['RESPONSE']);
           if Assigned(NodoPadre) then
           begin
              try
                 IdPedido := StrToIntDef((DameDato(NodoPadre, ['ID'])), 0);

                 {$IFDEF Debug}
                 XML.SaveToFile(DameTempPath+Format('GET_PEDIDO_%d.xml', [IdPedido]));
                 {$ENDIF}

                 if (IdPedido > 0) then
                 begin
                    Log('PEC', Format('IdPedido: %d', [IdPedido]));

                    IdUsuario := StrToInt(DameDato(NodoPadre, ['ID_USUARIO']));
                    Log('PEC', Format('IdUsuario: %d', [IdUsuario]));

                    Fecha := DateISO8601ToDateTime(DameDato(NodoPadre, ['FECHA']));
                    Log('PEC', Format('Fecha: %s', [DateTimeToStr(Fecha)]));

                    ZRefCliente := DameDato(NodoPadre, ['PEDIDO_CLIENTE']);
                    Log('PEC', Format('Ref. Cliente: %s', [ZRefCliente]));

                    ZObservaciones := DameDato(NodoPadre, ['Z_OBSERVACION']);
                    Log('PEC', Format('Observaciones: %s', [ZObservaciones]));

                    Estado := StrToInt(DameDato(NodoPadre, ['ESTADO']));
                    Log('PEC', Format('Estado: %d', [Estado]));

                    Total := StrToFloatDec(DameDato(NodoPadre, ['TOTAL']), '.');
                    Log('PEC', Format('Total: %f', [Total]));

                    ImportePortes := StrToFloatDec(DameDato(NodoPadre, ['IMPORTE_PORTE']), '.');
                    Log('PEC', Format('Importe Portes: %f', [ImportePortes]));

                    IdDoc := CreaCabecera(IdPedido, IdUsuario, Fecha, ZRefCliente, ZObservaciones, ImportePortes);

                    NodoPadre := DameNodo(NodoPadre, ['DETALLE']);
                    if not Assigned(NodoPadre) then
                    begin
                       Log('PEC', '*************************');
                       Log('PEC', '*** PEDIDO SIN LINEAS ***');
                       Log('PEC', '*************************');
                       ImagenBase64 := '';
                    end
                    else
                    begin
                       for i := 0 to NodoPadre.ChildNodes.Count - 1 do
                       begin
                          Log('PEC', Format('Linea: %d', [i]));
                          Nodo := NodoPadre.ChildNodes.Get(i);

                          IdLinea := StrToInt(DameDato(Nodo, ['ID']));
                          Log('PEC', Format('   IdLinea: %d', [IdLinea]));
                          IdArticulo := StrToInt(DameDato(Nodo, ['ID_A']));
                          Log('PEC', Format('   IdArticulo: %d', [IdArticulo]));
                          Articulo := DameDato(Nodo, ['ARTICULO']);
                          Log('PEC', Format('   Articulo: %s', [Articulo]));
                          Titulo := DameDato(Nodo, ['TITULO']);
                          Log('PEC', Format('   Titulo: %s', [Titulo]));
                          CodigoLlave := DameDato(Nodo, ['CODIGO_LLAVE']);
                          Log('PEC', Format('   Codigo Llave: %s', [CodigoLlave]));
                          ImagenBase64 := DameDato(Nodo, ['IMAGEN_ADJUNTA']);
                          Log('PEC', Format('   ImagenBase64: %d bytes', [Length(ImagenBase64)]));
                          Unidades := StrToFloatDec(DameDato(Nodo, ['UNIDADES']), '.');
                          Log('PEC', Format('   Unidades: %f', [Unidades]));
                          Precio := StrToFloatDec(DameDato(Nodo, ['PRECIO']), '.');
                          Log('PEC', Format('   Precio: %f', [Precio]));
                          Descuento := StrToFloatDec(DameDato(Nodo, ['DESCUENTO']), '.');
                          Log('PEC', Format('   Descuento: %f', [Descuento]));
                          TotalLinea := StrToFloatDec(DameDato(Nodo, ['TOTAL']), '.');
                          Log('PEC', Format('   TotalLinea: %f', [TotalLinea]));
                          ConCualquierLlave := StrToInt(DameDato(Nodo, ['CON_CUALQUIER_LLAVE']));
                          Log('PEC', Format('   ConCualquierLlave: %d', [ConCualquierLlave]));
                          EnviaranFoto := StrToInt(DameDato(Nodo, ['ENVIARAN_FOTO']));
                          Log('PEC', Format('   EnviaranFoto: %d', [EnviaranFoto]));

                          // Agrego indicador de notas
                          if (Length(CodigoLlave) > 0) then
                             Titulo := Copy(Format('(+COD) %s', [Titulo]), 1, 60);

                          // Agrego indicador de imagen adjunta
                          if (Length(ImagenBase64) > 0) then
                             Titulo := Copy(Format('(+IMG) %s', [Titulo]), 1, 60);

                          IdDetalleDoc := CreaDetalle(IdDoc, IdLinea, IdArticulo, Titulo, CodigoLlave, ConCualquierLlave, EnviaranFoto, (Length(ImagenBase64) > 0), Unidades, Precio, Descuento);

                       {No haygo esto porque luego no se querra pasar a albaran y quedará abierto.
                       // Agrego una linea para indicar que hay un adjunto en este pedido con la imagen de la llave.
                       if (Length(ImagenBase64) > 0) then
                          IdDetalleDoc := CreaDetalle(IdDoc, 0, DameIdArticulo(REntorno.ArtTextoLibre), Format(_('Imagen Adjunta de %s'), [Articulo]), 0, 0, 0);
                       }

                          if (ImagenBase64 > '') then
                          begin
                             FicheroImagen := DameTempPath + Format('SPEEDLOCK_%d_%d.JPG', [IdPedido, IdLinea]);
                             AMemoryStream := TMemoryStream.Create;
                             with AMemoryStream do
                             begin
                                try
                                   StrB64ToStream(ImagenBase64, AMemoryStream);
                                   Position := 0;
                                   SaveToFile(FicheroImagen);
                                finally
                                   Free;
                                end;
                             end;

                             DMAdjunto.CreaAdjunto('PEC', IdDoc, FicheroImagen, Format(_('Imagen de %s'), [Titulo]));
                          end;
                       end;
                    end;

                    Result := IdPedido;
                 end;
              except
                 on E: Exception do
                 begin
                    Log('PEC', 'ERROR');
                    Log('PEC', E.Message);
                 end;
              end;
           end
           else
              Log('PEC', 'No existe nodo padre <RESPONSE>');
        end;
     end;

     Log('PEC', '------------------------------------------------------------');
     Log('PEC', '');
  finally
     Contenido.Free;
     Respuesta.Free;
     Documento.Free;
     CierraData(DMAdjunto);
  end;
end;

function TDMSincronizacionEginer.WS_DoPost(Metodo, Resource: string; id: integer; Contenido, Respuesta: TStrings): integer;
var
  aURL : string;

  HttpConnectionWinInet : THttpConnectionWinInet;
  AContent, AResponse : TStream;
begin
  // Construyo la URL
  aURL := URL + '/' + Resource;

  if (id <> 0) then
     aURL := aURL + '?id=' + IntToStr(id);

  // Transmision
  HttpConnectionWinInet := THttpConnectionWinInet.Create;
  AContent := TStringStream.Create('');
  AResponse := TStringStream.Create('');
  try
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
       DMMain.Log('id: ' + IntToStr(id));
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

procedure TDMSincronizacionEginer.RefrescaUsuarios(Fecha: TDateTime);
begin
  with xUsuarios do
  begin
     Close;
     Params.ByName['FECHA_ULTIMA_MODIFICACION'].AsDateTime := Fecha;
     Open;
  end;
end;

function TDMSincronizacionEginer.SincronizarUnUsuario(aURL: string; IdUsuario: integer): boolean;
var
  Contenido, Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
  Q : THYFIBQuery;
begin
  URL := aURL;
  Contenido := TStringList.Create;
  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);

  try
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT U.ID_USUARIO, U.USUARIOID AS USUARIO, U.CONTRASENYA, U.EMAIL, U.NOMBRE, C.CLIENTE, T.NOMBRE_R_SOCIAL AS NOMBRE_CLIENTE, ');
           SQL.Add('        D.DIRECCION, D.DIR_COMPLETA_N AS DIRECCION_COMPLETA, L.PAIS, L.PROVINCIA, P.TITULO AS TITULO_PROVINCIA, ');
           SQL.Add('        CC.TIPO_PORTES, CC.I_PORTES, C.BAJA, C.BLOQUEO, ');
           SQL.Add('        -- ');
           SQL.Add('        COALESCE((SELECT FIRST 1 AGRUPACION ');
           SQL.Add('                  FROM EMP_AGRUPACIONES_CLI ');
           SQL.Add('                  WHERE ');
           SQL.Add('                  EMPRESA = C.EMPRESA AND ');
           SQL.Add('                  CLIENTE = C.CLIENTE AND ');
           SQL.Add('                  AGRUPACION IN (''GEN'', ''VIP'') ');
           SQL.Add('                  ORDER BY AGRUPACION DESC), '''') AS AGRUPACION, ');
           SQL.Add('        -- ');
           SQL.Add('        COALESCE((SELECT FIRST 1 AGRUPACION ');
           SQL.Add('                  FROM EMP_AGRUPACIONES_CLI ');
           SQL.Add('                  WHERE ');
           SQL.Add('                  EMPRESA = C.EMPRESA AND ');
           SQL.Add('                  CLIENTE = C.CLIENTE AND ');
           SQL.Add('                  AGRUPACION = ''CLL''), '''') AS COBRAR_LLAVE, ');
           SQL.Add('        -- ');
           SQL.Add('        (SELECT FIRST 1 ');
           SQL.Add('                        CASE TIPO_EFECTO_FACTURAE ');
           SQL.Add('                          WHEN 18 THEN ');
           SQL.Add('                              IMPORTE_RMB ');
           SQL.Add('                          ELSE IMPORTE ');
           SQL.Add('                        END ');
           SQL.Add('         FROM CON_CUENTAS_GES_TAR_PORTES T ');
           SQL.Add('         WHERE ');
           SQL.Add('         T.EMPRESA = C.EMPRESA AND ');
           SQL.Add('         T.EJERCICIO = CC.EJERCICIO AND ');
           SQL.Add('         T.CANAL = CC.CANAL AND ');
           SQL.Add('         T.ACREEDOR = D.DIR_TRANSPORTISTA AND ');
           SQL.Add('         ((T.ZONA = C.ZONA) OR (L.CODIGO_POSTAL BETWEEN T.CODIGO_POSTAL_INI AND T.CODIGO_POSTAL_FIN)) ');
           SQL.Add('         ORDER BY T.ZONA, T.CODIGO_POSTAL_INI) IMPORTE_PORTE ');
           SQL.Add(' FROM USUARIOS_WEB U ');
           SQL.Add(' JOIN EMP_CLIENTES C ON U.ID_CLIENTE_AGENTE = C.ID_CLIENTE ');
           SQL.Add(' JOIN CON_CUENTAS_GES_CLI CC ON C.EMPRESA = CC.EMPRESA AND C.CLIENTE = CC.CLIENTE ');
           SQL.Add(' JOIN CON_CUENTAS_GES_FP F ON CC.EMPRESA = F.EMPRESA AND CC.EJERCICIO = F.EJERCICIO AND CC.CANAL = F.CANAL AND CC.FORMA_PAGO = F.FORMA_PAGO ');
           SQL.Add(' JOIN SYS_TIPO_EFECTO E ON F.TIPO_EFECTO = E.TIPO ');
           SQL.Add(' JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO ');
           SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO AND D.DIRECCION = U.DIRECCION ');
           SQL.Add(' JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL ');
           SQL.Add(' JOIN SYS_PROVINCIAS P ON L.PAIS = P.PAIS AND L.PROVINCIA = P.PROVINCIA ');
           SQL.Add(' WHERE ');
           SQL.Add(' U.ID_USUARIO = :ID_USUARIO AND ');
           SQL.Add(' CC.EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CC.CANAL = :CANAL ');

           Params.ByName['ID_USUARIO'].AsInteger := IdUsuario;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           ExecQuery;
        end;

        with Documento do
        begin
           Active := True;
           Encoding := 'utf-8';
           Options := [doNodeAutoIndent];

           { TODO : Obtener datos de usuario a exportar (relacionados con cliente) }
           // Creo los datos del usuario
           NodoPadre := AddChild('USUARIO');
           Nodo := NodoPadre.AddChild('ID_USUARIO');
           Nodo.Text := IntToStr(IdUsuario);

           Nodo := NodoPadre.AddChild('USUARIO');
           Nodo.Text := Q.FieldByName['USUARIO'].AsString;

           Nodo := NodoPadre.AddChild('CONTRASENYA');
           Nodo.Text := Q.FieldByName['CONTRASENYA'].AsString;

           Nodo := NodoPadre.AddChild('NOMBRE');
           Nodo.Text := Q.FieldByName['NOMBRE'].AsString;

           Nodo := NodoPadre.AddChild('CLIENTE');
           Nodo.Text := IntToStr(Q.FieldByName['CLIENTE'].AsInteger);

           Nodo := NodoPadre.AddChild('NOMBRE_CLIENTE');
           Nodo.Text := Q.FieldByName['NOMBRE_CLIENTE'].AsString;

           Nodo := NodoPadre.AddChild('DIRECCION');
           Nodo.Text := IntToStr(Q.FieldByName['DIRECCION'].AsInteger);

           Nodo := NodoPadre.AddChild('DIRECCION_COMPLETA');
           Nodo.Text := Q.FieldByName['DIRECCION_COMPLETA'].AsString;

           Nodo := NodoPadre.AddChild('PAIS');
           Nodo.Text := Q.FieldByName['PAIS'].AsString;

           Nodo := NodoPadre.AddChild('PROVINCIA');
           Nodo.Text := Q.FieldByName['PROVINCIA'].AsString;

           Nodo := NodoPadre.AddChild('TITULO_PROVINCIA');
           Nodo.Text := Q.FieldByName['TITULO_PROVINCIA'].AsString;

           Nodo := NodoPadre.AddChild('AGRUPACION');
           Nodo.Text := Q.FieldByName['AGRUPACION'].AsString;

           Nodo := NodoPadre.AddChild('EMAIL');
           Nodo.Text := Q.FieldByName['EMAIL'].AsString;

           Nodo := NodoPadre.AddChild('COBRAR_LLAVE');
           if (Q.FieldByName['COBRAR_LLAVE'].AsString = 'CLL') then
              Nodo.Text := '1'
           else
              Nodo.Text := '0';

           // Si no tiene tipo porte establecido se toma de la tarifa del transportista
           Nodo := NodoPadre.AddChild('IMPORTE_PORTE');
           if (Q.FieldByName['TIPO_PORTES'].AsInteger = 0) then
              Nodo.Text := FloatToStrDec(Q.FieldByName['IMPORTE_PORTE'].AsFloat, '.')
           else
              Nodo.Text := FloatToStrDec(Q.FieldByName['I_PORTES'].AsFloat, '.');

           Nodo := NodoPadre.AddChild('BAJA');
           Nodo.Text := IntToStr(Q.FieldByName['BAJA'].AsInteger);

           // Solo enviamos 0:Activo o 1:Bloqueado 
           Nodo := NodoPadre.AddChild('BLOQUEO');
           if (Q.FieldByName['BLOQUEO'].AsInteger = 2) then
              Nodo.Text := '1'
           else
              Nodo.Text := '0';

           Contenido.Text := XML.Text;

           {$IFDEF Debug}
           XML.SaveToFile(DameTempPath+Format('SET_USUARIO_%d.xml', [IdUsuario]));
           {$ENDIF}
        end;

        // Contenido.Delete(0);

        CodigoRespuesta := WS_DoPost('POST', 'usuarios/setUsuario.php', 0, Contenido, Respuesta);
        Result := (CodigoRespuesta = 200);
        Log('USR', 'CodigoRespuesta: ' + IntToStr(CodigoRespuesta));
        Log('USR', 'Contenido: ' + Contenido.Text);
        Log('USR', 'Respuesta: ' + Respuesta.Text);
        Log('USR', '------------------------------------------------------------');
     finally
        Q.FreeHandle;
        Q.Free;
     end;
  finally
     Contenido.Free;
     Respuesta.Free;
     Documento.Free;
  end;
end;

function TDMSincronizacionEginer.SincronizarUsuarios(aURL: string; FechaUltimaSincronizacion: TDateTime): TDateTime;
var
  FechaServidor : TDateTime;
  SincronizacionCorrecta : boolean;
begin
  Log('USR', format(_('Inicio Sincronizando de Usuarios - %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now)]));

  FechaServidor := DMMain.DameFechaServidor;
  Log('STO', format(_('Fecha Servidor: %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', FechaServidor)]));

  Result := FechaUltimaSincronizacion;
  RefrescaUsuarios(FechaUltimaSincronizacion);
  SincronizacionCorrecta := True;

  if SincronizacionCorrecta then
  begin
     with xElementosBorrados do
     begin
        Close;
        Open;
        while (not EOF) and SincronizacionCorrecta do
        begin
           if (FieldByName('TIPO').AsString = 'USW') then
              SincronizacionCorrecta := SincronizarBorraElementos(aURL, FieldByName('TIPO').AsString, FieldByName('ID').AsInteger);
           {$IFDEF Debug}
           SincronizacionCorrecta :=  True;
           {$ENDIF}

           Next;
        end;
     end;
  end;

  if SincronizacionCorrecta then
  begin
     with xUsuarios do
     begin
        Close;
        Open;
        while (not EOF) and SincronizacionCorrecta do
        begin
           SincronizacionCorrecta := SincronizarUnUsuario(aURL, xUsuariosID_USUARIO.AsInteger);
           {$IFDEF Debug}
           SincronizacionCorrecta :=  True;
           {$ENDIF}

           Next;
        end;
     end;
  end;

  if SincronizacionCorrecta then
  begin
     Log('USR', _('Sincronizacion sin errores'));
     SetUltimaSincronizacion('USR', FechaServidor);
     Result := FechaServidor;
  end;
  Log('USR', format(_('Fin Sincronizando de Usuarios - %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now)]));
end;

procedure TDMSincronizacionEginer.RefrescaArticulos(Fecha: TDateTime);
begin
  with xAtributos do
  begin
     Close;
     Params.ByName['FECHA_ULTIMA_MODIFICACION'].AsDateTime := Fecha;
     Open;
  end;

  with xArticulos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['TARIFA'].AsString := REntorno.TarifaDefecto;
     Params.ByName['FECHA_ULTIMA_MODIFICACION'].AsDateTime := Fecha;
     Open;
  end;

  with xCombinaciones do
  begin
     Close;
     Params.ByName['FECHA_ULTIMA_MODIFICACION'].AsDateTime := Fecha;
     Open;
  end;

  with xCombinacionArtributo do
  begin
     Close;
     Params.ByName['FECHA_ULTIMA_MODIFICACION'].AsDateTime := Fecha;
     Open;
  end;
end;

function TDMSincronizacionEginer.SincronizarArticulos(aURL: string; FechaUltimaSincronizacion: TDateTime): TDateTime;
var
  FechaServidor : TDateTime;
  SincronizacionCorrecta : boolean;
begin
  Log('ART', format(_('Inicio Sincronizando de Articulos - %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now)]));

  FechaServidor := DMMain.DameFechaServidor;
  Log('ART', format(_('Fecha Servidor: %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', FechaServidor)]));

  Result := FechaUltimaSincronizacion;
  RefrescaArticulos(FechaUltimaSincronizacion);
  SincronizacionCorrecta := True;

  if SincronizacionCorrecta then
  begin
     with xElementosBorrados do
     begin
        Close;
        Open;
        while (not EOF) and SincronizacionCorrecta do
        begin
           if ((FieldByName('TIPO').AsString = 'ART') or
              (FieldByName('TIPO').AsString = 'ATR') or
              (FieldByName('TIPO').AsString = 'COM') or
              (FieldByName('TIPO').AsString = 'CMA')) then
              SincronizacionCorrecta := SincronizarBorraElementos(aURL, FieldByName('TIPO').AsString, FieldByName('ID').AsInteger);
           {$IFDEF Debug}
           SincronizacionCorrecta :=  True;
           {$ENDIF}

           Next;
        end;
     end;
  end;

  if SincronizacionCorrecta then
  begin
     with xArticulos do
     begin
        Close;
        Open;
        while (not EOF) and SincronizacionCorrecta do
        begin
           SincronizacionCorrecta := SincronizarUnArticulo(aURL, FieldByName('ID_A').AsInteger);
           {$IFDEF Debug}
           SincronizacionCorrecta :=  True;
           {$ENDIF}

           Next;
        end;
     end;
  end;

  if SincronizacionCorrecta then
  begin
     with xAtributos do
     begin
        Close;
        Open;
        while (not EOF) and SincronizacionCorrecta do
        begin
           SincronizacionCorrecta := SincronizarUnAtributo(aURL, FieldByName('ID').AsInteger);
           {$IFDEF Debug}
           SincronizacionCorrecta :=  True;
           {$ENDIF}

           Next;
        end;
     end;
  end;

  if SincronizacionCorrecta then
  begin
     with xCombinaciones do
     begin
        Close;
        Open;
        while (not EOF) and SincronizacionCorrecta do
        begin
           SincronizacionCorrecta := SincronizarUnaCombinacion(aURL, FieldByName('ID').AsInteger);
           {$IFDEF Debug}
           SincronizacionCorrecta :=  True;
           {$ENDIF}

           Next;
        end;
     end;
  end;

  if SincronizacionCorrecta then
  begin
     with xCombinacionArtributo do
     begin
        Close;
        Open;
        while (not EOF) and SincronizacionCorrecta do
        begin
           SincronizacionCorrecta := SincronizarUnaCombinacionArtributo(aURL, FieldByName('ID').AsInteger);
           {$IFDEF Debug}
           SincronizacionCorrecta :=  True;
           {$ENDIF}

           Next;
        end;
     end;
  end;

  if SincronizacionCorrecta then
  begin
     Log('ART', _('Sincronizacion sin errores'));
     SetUltimaSincronizacion('ART', FechaServidor);
     Result := FechaServidor;
  end;
  Log('ART', format(_('Fin Sincronizando de Articulos - %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now)]));
end;

function TDMSincronizacionEginer.SincronizarUnaCombinacion(aURL: string; Id: integer): boolean;
var
  Contenido, Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
  Q : THYFIBQuery;
begin
  URL := aURL;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID, COMBINACION, ID_A, ID_TIPO_VEHICULO FROM ART_COMBINACION WHERE ID = :ID';
        Params.ByName['ID'].AsInteger := id;
        ExecQuery;
     end;

     Contenido := TStringList.Create;
     Respuesta := TStringList.Create;
     Documento := TXMLDocument.Create(Self);
     try
        with Documento do
        begin
           Active := True;
           Encoding := 'utf-8';
           Options := [doNodeAutoIndent];

           // Creo los datos del usuario
           NodoPadre := AddChild('COMBINACION');

           Nodo := NodoPadre.AddChild('ID');
           Nodo.Text := IntToStr(Q.FieldByName['ID'].AsInteger);

           Nodo := NodoPadre.AddChild('COMBINACION');
           Nodo.Text := Q.FieldByName['COMBINACION'].AsString;

           Nodo := NodoPadre.AddChild('ID_A');
           Nodo.Text := IntToStr(Q.FieldByName['ID_A'].AsInteger);

           Nodo := NodoPadre.AddChild('ID_TIPO_VEHICULO');
           Nodo.Text := IntToStr(Q.FieldByName['ID_TIPO_VEHICULO'].AsInteger);

           Contenido.Text := XML.Text;
           {$IFDEF Debug}
           XML.SaveToFile(DameTempPath+Format('SET_COMBINACION_%d.xml', [id]));
           {$ENDIF}
        end;

        CodigoRespuesta := WS_DoPost('POST', 'articulos/setCombinacion.php', 0, Contenido, Respuesta);
        Result := (CodigoRespuesta = 200);
        Log('ART', 'CodigoRespuesta: ' + IntToStr(CodigoRespuesta));
        Log('ART', 'Contenido: ' + Contenido.Text);
        Log('ART', 'Respuesta: ' + Respuesta.Text);
        Log('ART', '------------------------------------------------------------');
     finally
        Contenido.Free;
        Respuesta.Free;
        Documento.Free;
     end;
  finally
     Q.FreeHandle;
     Q.Free;
  end;
end;

function TDMSincronizacionEginer.SincronizarUnArticulo(aURL: string; Id: integer): boolean;
var
  Contenido, Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
  Q : THYFIBQuery;
  AMemoryStream : TMemoryStream;
  s : string;
  Imagen : TImage;
  ModeloLlave, ConCualquierLlave : string;
begin
  URL := aURL;
  LogSincronizacionArticulos.Clear;

  { TODO : Obtener datos de articulo a sincronizar. tambien imagen }
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT A.ID_A, A.ARTICULO, A.TITULO_LARGO AS TITULO, A.DESCUENTO, A.DESCUENTO_2, A.DESCUENTO_3, P.PRECIO_VENTA, A.IMAGEN, A.TIPO_ARTICULO, ');
        SQL.Add('        (SELECT FIRST 1 AGRUPACION ');
        SQL.Add('         FROM EMP_AGRUPACIONES_ART ');
        SQL.Add('         WHERE ');
        SQL.Add('         EMPRESA = A.EMPRESA AND ');
        SQL.Add('         ARTICULO = A.ARTICULO AND ');
        SQL.Add('         AGRUPACION BETWEEN ''M01'' AND ''M99'' ');
        SQL.Add('         ORDER BY AGRUPACION) AS MODELO_LLAVE, ');
        SQL.Add('        (SELECT FIRST 1 AGRUPACION ');
        SQL.Add('         FROM EMP_AGRUPACIONES_ART ');
        SQL.Add('         WHERE ');
        SQL.Add('         EMPRESA = A.EMPRESA AND ');
        SQL.Add('         ARTICULO = A.ARTICULO AND ');
        SQL.Add('         AGRUPACION BETWEEN ''CL1'' AND ''CL9'' ');
        SQL.Add('         ORDER BY AGRUPACION) AS CON_CUALQUIER_LLAVE, ');
        SQL.Add('        (SELECT FIRST 1 I.P_IVA FROM CON_CUENTAS_GES_ART C ');
        SQL.Add('         JOIN SYS_TIPO_IVA I ON C.TIPO_IVA = I.TIPO ');
        SQL.Add('         WHERE ');
        SQL.Add('         C.EMPRESA = A.EMPRESA AND ');
        SQL.Add('         C.ARTICULO = A.ARTICULO AND ');
        SQL.Add('         I.PAIS = :PAIS ');
        SQL.Add('         ORDER BY C.EJERCICIO DESC, C.CANAL) PORCENTAJE_IVA ');
        SQL.Add(' FROM ART_ARTICULOS A ');
        SQL.Add(' JOIN ART_TARIFAS_C T ON A.EMPRESA = T.EMPRESA ');
        SQL.Add(' JOIN ART_TARIFAS_PRECIOS P ON T.EMPRESA = P.EMPRESA AND T.TARIFA = P.TARIFA AND A.ARTICULO = P.ARTICULO ');
        SQL.Add(' WHERE ');
        SQL.Add(' A.ID_A = :ID AND ');
        SQL.Add(' T.TARIFA = :TARIFA AND ');
        SQL.Add(' P.LINEA = 1 ');
        Params.ByName['ID'].AsInteger := id;
        Params.ByName['TARIFA'].AsString := REntorno.TarifaDefecto;
        Params.ByName['PAIS'].AsString := REntorno.Pais;
        ExecQuery;
     end;

     Log('ART', format('Sincronizando id_a: %d', [Q.FieldByName['ID_A'].AsInteger]));
     Log('ART', format('Sincronizando Articulo: %s', [Q.FieldByName['ARTICULO'].AsString]));
     Log('ART', format('Sincronizando Titulo: %s', [Q.FieldByName['TITULO'].AsString]));
     Log('ART', format('Sincronizando Id imagen: %d', [Q.FieldByName['IMAGEN'].AsInteger]));

     Contenido := TStringList.Create;
     Respuesta := TStringList.Create;
     Documento := TXMLDocument.Create(Self);
     try
        with Documento do
        begin
           Active := True;
           Encoding := 'utf-8';
           Options := [doNodeAutoIndent];

           // Creo los datos del usuario
           NodoPadre := AddChild('ARTICULO');

           Nodo := NodoPadre.AddChild('ID_A');
           Nodo.Text := IntToStr(Q.FieldByName['ID_A'].AsInteger);

           Nodo := NodoPadre.AddChild('ARTICULO');
           Nodo.Text := Q.FieldByName['ARTICULO'].AsString;

           Nodo := NodoPadre.AddChild('TITULO');
           Nodo.Text := Q.FieldByName['TITULO'].AsString;

           Nodo := NodoPadre.AddChild('PRECIO');
           Nodo.Text := FloatToStrDec(Q.FieldByName['PRECIO_VENTA'].AsFloat, '.');

           Nodo := NodoPadre.AddChild('PORCENTAJE_IVA');
           Nodo.Text := FloatToStrDec(Q.FieldByName['PORCENTAJE_IVA'].AsFloat, '.');

           Nodo := NodoPadre.AddChild('DESCUENTO_1');
           Nodo.Text := FloatToStrDec(Q.FieldByName['DESCUENTO'].AsFloat, '.');

           Nodo := NodoPadre.AddChild('DESCUENTO_2');
           Nodo.Text := FloatToStrDec(Q.FieldByName['DESCUENTO_2'].AsFloat, '.');

           Nodo := NodoPadre.AddChild('DESCUENTO_3');
           Nodo.Text := FloatToStrDec(Q.FieldByName['DESCUENTO_3'].AsFloat, '.');

           Nodo := NodoPadre.AddChild('TIPO_LLAVE');
           Nodo.Text := Q.FieldByName['TIPO_ARTICULO'].AsString;

           // Guardo estos datos para poder marcarlo como replicado si todo sale bien.
           ModeloLlave := Q.FieldByName['MODELO_LLAVE'].AsString;
           ConCualquierLlave := Q.FieldByName['CON_CUALQUIER_LLAVE'].AsString;

           Nodo := NodoPadre.AddChild('MODELO_LLAVE');
           Nodo.Text := ModeloLlave;

           Nodo := NodoPadre.AddChild('DESC_MODELO_LLAVE');
           Nodo.Text := DameTituloAgrupacion('T', ModeloLlave);

           Nodo := NodoPadre.AddChild('CON_CUALQUIER_LLAVE');
           Nodo.Text := ConCualquierLlave;

           Nodo := NodoPadre.AddChild('DESC_CON_CUALQUIER_LLAVE');
           Nodo.Text := DameTituloAgrupacion('T', ConCualquierLlave);

           Nodo := NodoPadre.AddChild('IMAGEN');
           AMemoryStream := TMemoryStream.Create;
           Imagen := TImage.Create(nil);
           try
              try
                 RefrescarImagen(Imagen, Q.FieldByName['IMAGEN'].AsInteger);
                 if (Imagen.Picture.Graphic <> nil) then
                 begin
                    Imagen.Picture.Bitmap.Canvas.StretchDraw(Rect(0, 0, 200, 200), Imagen.Picture.Bitmap);
                    Imagen.Picture.Bitmap.Width := 200;
                    Imagen.Picture.Bitmap.Height := 200;

                    Imagen.Picture.Graphic.SaveToStream(AMemoryStream);
                    AMemoryStream.Position := 0;
                    if StreamToStrB64(AMemoryStream, s) then
                       Nodo.Text := s;
                 end;
              except
                 Nodo.Text := '';
              end;
           finally
              AMemoryStream.Free;
              Imagen.Free;
           end;

           Contenido.Text := XML.Text;
           {$IFDEF Debug}
           XML.SaveToFile(DameTempPath+Format('SET_ARTICULO_%d.xml', [id]));
           {$ENDIF}
        end;

        CodigoRespuesta := WS_DoPost('POST', 'articulos/setArticulo.php', 0, Contenido, Respuesta);
        Result := (CodigoRespuesta = 200);

        Log('ART', 'CodigoRespuesta: ' + IntToStr(CodigoRespuesta));
        Log('ART', 'Contenido: ' + Contenido.Text);
        Log('ART', 'Respuesta: ' + Respuesta.Text);
        Log('ART', '------------------------------------------------------------');
     finally
        Contenido.Free;
        Respuesta.Free;
        Documento.Free;
     end;
  finally
     Q.FreeHandle;
     Q.Free;
  end;

  // Marco las agrupaciones como replicadas
  if Result then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE EMP_AGRUPACIONES_ART ');
           SQL.Add(' SET ');
           SQL.Add(' REPLICADO = 1 ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_A = :ID AND ');
           SQL.Add(' AGRUPACION = :AGRUPACION ');
           Params.ByName['ID'].AsInteger := id;
           Params.ByName['AGRUPACION'].AsString := ModeloLlave;
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
           SQL.Add(' UPDATE EMP_AGRUPACIONES_ART ');
           SQL.Add(' SET ');
           SQL.Add(' REPLICADO = 1 ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_A = :ID AND ');
           SQL.Add(' AGRUPACION = :AGRUPACION ');
           Params.ByName['ID'].AsInteger := id;
           Params.ByName['AGRUPACION'].AsString := ConCualquierLlave;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

function TDMSincronizacionEginer.SincronizarUnAtributo(aURL: string; Id: integer): boolean;
var
  Contenido, Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
  Q : THYFIBQuery;
begin
  URL := aURL;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID, TIPO, ATRIBUTO, TIPO_PADRE, ID_PADRE FROM ART_ATRIBUTO WHERE ID = :ID';
        Params.ByName['ID'].AsInteger := id;
        ExecQuery;
     end;

     Contenido := TStringList.Create;
     Respuesta := TStringList.Create;
     Documento := TXMLDocument.Create(Self);
     try
        with Documento do
        begin
           Active := True;
           Encoding := 'utf-8';
           Options := [doNodeAutoIndent];

           // Creo los datos del usuario
           NodoPadre := AddChild('ATRIBUTO');

           Nodo := NodoPadre.AddChild('ID');
           Nodo.Text := IntToStr(Q.FieldByName['ID'].AsInteger);

           Nodo := NodoPadre.AddChild('TIPO');
           Nodo.Text := Q.FieldByName['TIPO'].AsString;

           Nodo := NodoPadre.AddChild('ATRIBUTO');
           Nodo.Text := Q.FieldByName['ATRIBUTO'].AsString;

           Nodo := NodoPadre.AddChild('TIPO_PADRE');
           Nodo.Text := Q.FieldByName['TIPO_PADRE'].AsString;

           Nodo := NodoPadre.AddChild('ID_PADRE');
           Nodo.Text := IntToStr(Q.FieldByName['ID_PADRE'].AsInteger);

           Contenido.Text := XML.Text;
           {$IFDEF Debug}
           XML.SaveToFile(DameTempPath+Format('SET_ATRIBUTO_%d.xml', [id]));
           {$ENDIF}
        end;

        CodigoRespuesta := WS_DoPost('POST', 'articulos/setAtributo.php', 0, Contenido, Respuesta);
        Result := (CodigoRespuesta = 200);
        Log('ART', 'CodigoRespuesta: ' + IntToStr(CodigoRespuesta));
        Log('ART', 'Contenido: ' + Contenido.Text);
        Log('ART', 'Respuesta: ' + Respuesta.Text);
        Log('ART', '------------------------------------------------------------');
     finally
        Contenido.Free;
        Respuesta.Free;
        Documento.Free;
     end;
  finally
     Q.FreeHandle;
     Q.Free;
  end;
end;

function TDMSincronizacionEginer.SincronizarUnaCombinacionArtributo(aURL: string; Id: integer): boolean;
var
  Contenido, Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
  Q : THYFIBQuery;
begin
  URL := aURL;

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID, ID_COMBINACION, ID_ATRIBUTO, TIPO_ATRIBUTO_PADRE, ID_ATRIBUTO_PADRE FROM ART_COMBINACION_ART_ATRIB WHERE ID = :ID';
        Params.ByName['ID'].AsInteger := id;
        ExecQuery;
     end;

     Contenido := TStringList.Create;
     Respuesta := TStringList.Create;
     Documento := TXMLDocument.Create(Self);
     try
        with Documento do
        begin
           Active := True;
           Encoding := 'utf-8';
           Options := [doNodeAutoIndent];

           // Creo los datos del usuario
           NodoPadre := AddChild('COMBINACIONARTRIBUTO');

           Nodo := NodoPadre.AddChild('ID');
           Nodo.Text := IntToStr(Q.FieldByName['ID'].AsInteger);

           Nodo := NodoPadre.AddChild('ID_COMBINACION');
           Nodo.Text := IntToStr(Q.FieldByName['ID_COMBINACION'].AsInteger);

           Nodo := NodoPadre.AddChild('ID_ATRIBUTO');
           Nodo.Text := IntToStr(Q.FieldByName['ID_ATRIBUTO'].AsInteger);

           Nodo := NodoPadre.AddChild('TIPO_ATRIBUTO_PADRE');
           Nodo.Text := Q.FieldByName['TIPO_ATRIBUTO_PADRE'].AsString;

           Nodo := NodoPadre.AddChild('ID_ATRIBUTO_PADRE');
           Nodo.Text := IntToStr(Q.FieldByName['ID_ATRIBUTO_PADRE'].AsInteger);

           Contenido.Text := XML.Text;
           {$IFDEF Debug}
           XML.SaveToFile(DameTempPath+Format('SET_COMBINACION_ATRIBUTO_%d.xml', [id]));
           {$ENDIF}
        end;

        CodigoRespuesta := WS_DoPost('POST', 'articulos/setCombinacionAtributo.php', 0, Contenido, Respuesta);
        Result := (CodigoRespuesta = 200);
        Log('ART', 'CodigoRespuesta: ' + IntToStr(CodigoRespuesta));
        Log('ART', 'Contenido: ' + Contenido.Text);
        Log('ART', 'Respuesta: ' + Respuesta.Text);
        Log('ART', '------------------------------------------------------------');
     finally
        Contenido.Free;
        Respuesta.Free;
        Documento.Free;
     end;
  finally
     Q.FreeHandle;
     Q.Free;
  end;
end;

function TDMSincronizacionEginer.SincronizarBorraElementos(aURL, Tipo: string; Id: integer): boolean;
var
  Contenido, Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  TipoLog : string;
begin
  Result := True;
  URL := aURL;
  Contenido := TStringList.Create;
  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     TipoLog := 'ART';
     if (Tipo = 'USW') then
        TipoLog := 'USR';

     Log(TipoLog, Format('Borrando %s %d ', [Tipo, Id]));

     CodigoRespuesta := 404;

     if (Tipo = 'ART') then
        CodigoRespuesta := WS_DoPost('POST', 'articulos/delArticulo.php', Id, Contenido, Respuesta);
     if (Tipo = 'ATR') then
        CodigoRespuesta := WS_DoPost('POST', 'articulos/delAtributo.php', Id, Contenido, Respuesta);
     if (Tipo = 'COM') then
        CodigoRespuesta := WS_DoPost('POST', 'articulos/delCombinacion.php', Id, Contenido, Respuesta);
     if (Tipo = 'CMA') then
        CodigoRespuesta := WS_DoPost('POST', 'articulos/delCombinacionAtributo.php', Id, Contenido, Respuesta);
     if (Tipo = 'USW') then
        CodigoRespuesta := WS_DoPost('POST', 'usuarios/delUsuario.php', Id, Contenido, Respuesta);

     Log(TipoLog, 'CodigoRespuesta: ' + IntToStr(CodigoRespuesta));

     if (CodigoRespuesta = 200) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'DELETE FROM SYS_SINC_ID_BORRADO WHERE TIPO = :TIPO AND ID = :ID';
              Params.ByName['TIPO'].AsString := Tipo;
              Params.ByName['ID'].AsInteger := iD;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end
     else
        Result := False;

     Log(TipoLog, '------------------------------------------------------------');
  finally
     Contenido.Free;
     Respuesta.Free;
     Documento.Free;
  end;
end;

procedure TDMSincronizacionEginer.SincronizarPedidos(aURL: string; var UtlimoPedidoSincronizado: integer; var FechaUltimaSincronizacion: TDateTime);
var
  UltimoPedido : integer;
  FechaServidor : TDateTime;
begin
  Log('PEC', format(_('Inicio Sincronizando de Pedidos - %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now)]));

  FechaServidor := DMMain.DameFechaServidor;
  Log('STO', format(_('Fecha Servidor: %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', FechaServidor)]));

  if SincronizarEstadoPedidos(aURL, FechaUltimaSincronizacion) then
  begin
     FechaUltimaSincronizacion := FechaServidor;
     SetUltimaSincronizacion('PEC', FechaUltimaSincronizacion);
  end;

  UltimoPedido := UtlimoPedidoSincronizado;
  UtlimoPedidoSincronizado := -1;
  while (UltimoPedido <> -1) do
  begin
     UltimoPedido := SincronizarObtenerPedidos(aURL, UltimoPedido);

     // Actualizo datos de último pedido sincronizado
     if (UltimoPedido <> -1) then
     begin
        Log('PEC', _('Sincronizacion sin errores'));
        UtlimoPedidoSincronizado := UltimoPedido;
        SetUltimaSincronizacion('PEC', UtlimoPedidoSincronizado);
     end;
  end;
  Log('PEC', format(_('Fin Sincronizando de Pedidos - %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now)]));
end;

function TDMSincronizacionEginer.SincronizarEstadoPedidos(aURL: string; FechaUltimaSincronizacion: TDateTime): boolean;
var
  Contenido, Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
  DS : TFIBDataSet;
begin
  URL := aURL;
  Result := True;

  DS := TFIBDataSet.Create(nil);
  try
     DS.Close;
     DS.DataBase := DMMain.DataBase;
     DS.Transaction := DameTransactionRO(DMMain.DataBase);
     try
        if (not DS.Transaction.InTransaction) then
           DS.Transaction.StartTransaction;
        DS.SelectSQL.Add(' SELECT C.ID_S, R.ID_ORIGEN, C.ESTADO, C.ULT_MODIFICACION ');
        DS.SelectSQL.Add(' FROM GES_CABECERAS_S C ');
        DS.SelectSQL.Add(' JOIN SYS_SINC_RELACIONES R ON C.ID_S = R.ID_DESTINO ');
        DS.SelectSQL.Add(' WHERE ');
        DS.SelectSQL.Add(' C.EMPRESA = :EMPRESA AND ');
        DS.SelectSQL.Add(' C.ULT_MODIFICACION >= :ULT_MODIFICACION AND ');
        DS.SelectSQL.Add(' R.TIPO = ''PEC'' ');
        DS.SelectSQL.Add(' ORDER BY C.ULT_MODIFICACION ');
        DS.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        DS.Params.ByName['ULT_MODIFICACION'].AsDateTime := FechaUltimaSincronizacion;
        DS.Open;

        while (not DS.EOF) and Result do
        begin
           Contenido := TStringList.Create;
           Respuesta := TStringList.Create;
           Documento := TXMLDocument.Create(Self);
           try
              with Documento do
              begin
                 Active := True;
                 Encoding := 'utf-8';
                 Options := [doNodeAutoIndent];

                 // Creo los datos del usuario
                 NodoPadre := AddChild('PEDIDO');

                 Nodo := NodoPadre.AddChild('ID');
                 Nodo.Text := IntToStr(DS.FieldByName('ID_ORIGEN').AsInteger);

                 Nodo := NodoPadre.AddChild('ESTADO');
                 Nodo.Text := IntToStr(DS.FieldByName('ESTADO').AsInteger);

                 Contenido.Text := XML.Text;

                 {$IFDEF Debug}
                 XML.SaveToFile(DameTempPath+Format('SET_PEDIDO_%d.xml', [DS.FieldByName('ID_ORIGEN').AsInteger]));
                 {$ENDIF}
              end;

              CodigoRespuesta := WS_DoPost('POST', 'pedidos/setPedido.php', 0, Contenido, Respuesta);
              Result := (CodigoRespuesta = 200);

              Log('PEC', 'CodigoRespuesta: ' + IntToStr(CodigoRespuesta));
              Log('PEC', 'Contenido: ' + Contenido.Text);
              Log('PEC', 'Respuesta: ' + Respuesta.Text);
              Log('PEC', '------------------------------------------------------------');
           finally
              Contenido.Free;
              Respuesta.Free;
              Documento.Free;
           end;

           DS.Next;
        end;
        DS.Close;
        DS.Transaction.Commit;
     finally
        DS.Transaction.Free;
     end;
  finally
     DS.Free;
  end;
end;

function TDMSincronizacionEginer.DameUltimaFechaSincronizacion(Tipo: string): TDateTime;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FECHA FROM SYS_SINC_ULTIMA_SINCRONIZACION WHERE TIPO = :TIPO';
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;
        Result := FieldByName['FECHA'].AsDateTime;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMSincronizacionEginer.DameUltimoIdSincronizacion(Tipo: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID FROM SYS_SINC_ULTIMA_SINCRONIZACION WHERE TIPO = :TIPO';
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;
        Result := FieldByName['ID'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMSincronizacionEginer.SetUltimaSincronizacion(Tipo: string; Id: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE OR INSERT INTO SYS_SINC_ULTIMA_SINCRONIZACION( ');
        SQL.Add(' TIPO, ID) ');
        SQL.Add(' VALUES (:TIPO, :ID) ');
        SQL.Add(' MATCHING (TIPO) ');
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['ID'].AsInteger := Id;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMSincronizacionEginer.SetUltimaSincronizacion(Tipo: string; Fecha: TDateTime);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE OR INSERT INTO SYS_SINC_ULTIMA_SINCRONIZACION( ');
        SQL.Add(' TIPO, FECHA) ');
        SQL.Add(' VALUES (:TIPO, :FECHA) ');
        SQL.Add(' MATCHING (TIPO) ');
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['FECHA'].AsDateTime := Fecha;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMSincronizacionEginer.SetRelacionSincronizacion(Tipo: string; IdOrigen, IdDestino: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE OR INSERT INTO SYS_SINC_RELACIONES( ');
        SQL.Add(' TIPO, ID_ORIGEN, ID_DESTINO) ');
        SQL.Add(' VALUES (:TIPO, :ID_ORIGEN, :ID_DESTINO) ');
        SQL.Add(' MATCHING (TIPO, ID_ORIGEN) ');
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['ID_ORIGEN'].AsInteger := IdOrigen;
        Params.ByName['ID_DESTINO'].AsInteger := IdDestino;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMSincronizacionEginer.GetRelacionSincronizacion(Tipo: string; IdOrigen: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_DESTINO FROM SYS_SINC_RELACIONES WHERE TIPO = :TIPO AND ID_ORIGEN = :ID_ORIGEN';
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['ID_ORIGEN'].AsInteger := IdOrigen;
        ExecQuery;
        Result := FieldByName['ID_DESTINO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMSincronizacionEginer.Log(Tipo, s: string);
begin
  if (Tipo = 'PEC') and Assigned(LogSincronizacionPedidos) then
     LogSincronizacionPedidos.Add(s);
  if (Tipo = 'ART') and Assigned(LogSincronizacionArticulos) then
     LogSincronizacionArticulos.Add(s);
  if (Tipo = 'USR') and Assigned(LogSincronizacionUsuarios) then
     LogSincronizacionUsuarios.Add(s);
  if (Tipo = 'STO') and Assigned(LogSincronizacionStocks) then
     LogSincronizacionStocks.Add(s);
end;

procedure TDMSincronizacionEginer.AsignaLog(Tipo: string; Log: TStrings);
begin
  if (Tipo = 'PEC') then
     LogSincronizacionPedidos := Log;
  if (Tipo = 'ART') then
     LogSincronizacionArticulos := Log;
  if (Tipo = 'USR') then
     LogSincronizacionUsuarios := Log;
  if (Tipo = 'STO') then
     LogSincronizacionStocks := Log;
end;

procedure TDMSincronizacionEginer.RefrescaStocks(Fecha: TDateTime);
begin
  with xStocks do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['FECHA_ULTIMA_MODIFICACION'].AsDateTime := Fecha;
     Open;
  end;
end;

function TDMSincronizacionEginer.SincronizarStock(aURL: string; FechaUltimaSincronizacion: TDateTime): TDateTime;
var
  FechaServidor : TDateTime;
  SincronizacionCorrecta : boolean;
  Stock : double;
  DS : TFIBDataSet;
begin
  Log('STO', format(_('Inicio Sincronizando de Stock - %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now)]));

  FechaServidor := DMMain.DameFechaServidor;
  Log('STO', format(_('Fecha Servidor: %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', FechaServidor)]));

  Result := FechaUltimaSincronizacion;
  RefrescaStocks(FechaUltimaSincronizacion);
  SincronizacionCorrecta := True;

  if SincronizacionCorrecta then
  begin
     with xStocks do
     begin
        Close;
        Open;
        while (not EOF) and SincronizacionCorrecta do
        begin
           Stock := DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, FieldByName('ARTICULO').AsString, '000');
           try
              SincronizacionCorrecta := SincronizarUnStock(aURL, FieldByName('ARTICULO').AsString, FieldByName('ID_A').AsInteger, Stock);
           except
              SincronizacionCorrecta := False;
           end;

           {$IFDEF Debug}
           SincronizacionCorrecta :=  True;
           {$ENDIF}

           // Mismo stock para los articulos virtuales de esta referencia base
           if SincronizacionCorrecta then
           begin
              DS := TFIBDataSet.Create(nil);
              try
                 DS.Close;
                 DS.DataBase := DMMain.DataBase;
                 DS.Transaction := DameTransactionRO(DMMain.DataBase);
                 try
                    if (not DS.Transaction.InTransaction) then
                       DS.Transaction.StartTransaction;
                    DS.SelectSQL.Add(' SELECT P.ARTICULO AS ARTICULO_VIRTUAL, P.ID_A AS ID_A_VIRTUAL ');
                    DS.SelectSQL.Add(' FROM ART_ARTICULOS A ');
                    DS.SelectSQL.Add(' LEFT JOIN ART_ARTICULOS P ON A.EMPRESA = P.EMPRESA AND P.ALFA_1 = A.ARTICULO ');
                    DS.SelectSQL.Add(' WHERE ');
                    DS.SelectSQL.Add(' A.EMPRESA = :EMPRESA AND ');
                    DS.SelectSQL.Add(' A.ARTICULO = :ARTICULO ');
                    DS.SelectSQL.Add(' ORDER BY P.ARTICULO ');

                    DS.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    DS.Params.ByName['ARTICULO'].AsString := xStocks.FieldByName('ARTICULO').AsString;
                    DS.Open;
                    while (not DS.EOF) and SincronizacionCorrecta do
                    begin
                       try
                          if (DS.FieldByName('ID_A_VIRTUAL').AsInteger <> 0) then
                             SincronizacionCorrecta := SincronizarUnStock(aURL, DS.FieldByName('ARTICULO_VIRTUAL').AsString, DS.FieldByName('ID_A_VIRTUAL').AsInteger, Stock, True);
                       except
                          SincronizacionCorrecta := False;
                       end;

                       {$IFDEF Debug}
                       SincronizacionCorrecta :=  True;
                       {$ENDIF}

                       DS.Next;
                    end;
                    DS.Close;
                    DS.Transaction.Commit;
                 finally
                    DS.Transaction.Free;
                 end;
              finally
                 DS.Free;
              end;
           end;

           Next;
        end;
     end;
  end;

  if SincronizacionCorrecta then
  begin
     Log('STO', _('Sincronizacion sin errores'));
     SetUltimaSincronizacion('STO', FechaServidor);
     Result := FechaServidor;
  end;
  Log('STO', format(_('Fin Sincronizando de Stock - %s'), [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now)]));
end;

function TDMSincronizacionEginer.SincronizarUnStock(aURL, Articulo: string; id: integer; Stock: double; EsVirtual: boolean = False): boolean;
var
  Contenido, Respuesta : TStrings;
  CodigoRespuesta : integer;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
begin
  URL := aURL;
  LogSincronizacionArticulos.Clear;

  if not EsVirtual then
     Log('STO', format('Sincronizando Articulo: %-15s -  Stock: %9.2f', [Articulo, Stock]))
  else
     Log('STO', format('            | Virtual : %-15s', [Articulo]));

  Contenido := TStringList.Create;
  Respuesta := TStringList.Create;
  Documento := TXMLDocument.Create(Self);
  try
     with Documento do
     begin
        Active := True;
        Encoding := 'utf-8';
        Options := [doNodeAutoIndent];

        // Creo los datos del usuario
        NodoPadre := AddChild('ARTICULO');

        Nodo := NodoPadre.AddChild('ID_A');
        Nodo.Text := IntToStr(id);

        Nodo := NodoPadre.AddChild('STOCK');
        Nodo.Text := FloatToStrDec(Stock, '.');

        Contenido.Text := XML.Text;
        {$IFDEF Debug}
        XML.SaveToFile(DameTempPath+Format('SET_ARTICULO_STOCK_%d.xml', [id]));
        {$ENDIF}
     end;

     CodigoRespuesta := WS_DoPost('POST', 'articulos/setArticuloStock.php', 0, Contenido, Respuesta);
     Result := (CodigoRespuesta = 200);

     (*
     {$IFDEF Debug}
     Log('STO', 'CodigoRespuesta: ' + IntToStr(CodigoRespuesta));
     Log('STO', 'Contenido: ' + Contenido.Text);
     Log('STO', 'Respuesta: ' + Respuesta.Text);
     Log('STO', '------------------------------------------------------------');
     {$ENDIF}
     *)
  finally
     Contenido.Free;
     Respuesta.Free;
     Documento.Free;
  end;
end;

end.
