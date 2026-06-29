unit UDMDteRecepcionCorreos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, IdBaseComponent, IdComponent, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessage, IdMessageClient, IdPOP3, IdAttachment, HYFIBQuery, Forms, XMLDoc, XMLIntf;

type
  TDMDteRecepcionCorreos = class(TDataModule)
     SSL1: TIdSSLIOHandlerSocketOpenSSL;
     IdPOP31: TIdPOP3;
  private
     { Private declarations }
     function XmlAcuseReciboDte(Fichero: string; ID_Adjunto_SIE: integer): boolean;
     function XmlDocumentoEstadoCliente(Fichero: string; ID_Adjunto_SIE: integer): boolean;
     function XmlDteProveedor(Fichero: string; ID_Adjunto_SIE: integer): boolean;
  public
     { Public declarations }
     function LeerCorreo(MsgLog: TStrings): boolean;
  end;

var
  DMDteRecepcionCorreos : TDMDteRecepcionCorreos;

implementation

uses
  UDMMain, UDMAdjunto, UEntorno, IdText, UUtiles, UFormGest, UParam;

{$R *.dfm}

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
begin
  Result := '';

  Nodo := DameNodo(Nodo, a);

  // Si encuentro el nodo, obtengo el texto
  if Assigned(Nodo) then
     Result := Nodo.Text
  else
     Result := '';
end;

function TDMDteRecepcionCorreos.LeerCorreo(MsgLog: TStrings): boolean;
var
  POP3 : TIdPOP3;
  Mensaje : TIdMessage;
  IdMensaje, IdMessagePart : integer;
  ServidorPOP3, UsuarioPOP3, PasswordPOP3, sMensaje : string;
  PuertoPOP3 : integer;
  CantidadMensajes, iNumero : integer;
  Cuerpo : TIdText;
  sAdjunto : string;
  Id_Sie : integer;
  Fichero : string;
  NuevoCorreo : boolean;
  IncluyeCorreosLeidos : boolean;

  function LimpiaMensaje(s: string): string;
  var
     i : integer;
     max : integer;
  begin
     /// Dejo solo 100 primeros caracteres en una linea sin caracteres epeciales.
     Result := '';
     max := Length(s);
     if (max > 100) then
        max := 100;
     for i := 1 to max do
     begin
        if s[i] in ['A'..'Z', 'a'..'z', '0'..'9', ' ', '+', '-', '_', '/', '(', ')'] then
           Result := Result + s[i]
        else
           Result := Result + '?';
     end;
  end;

begin
  /// Si no hay correos en el buzon devuelve FALSE.
  Result := True;
  IncluyeCorreosLeidos := (LeeParametro('DTERECE001') = 'S');
  // Obtenemos datos del servidor pop3
  MsgLog.Add(_('Leyendo Configuracion de servidor de correo'));
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('SELECT COMPRAS_SERVIDOR_POP3, COMPRAS_PUERTO_POP3, COMPRAS_USUARIO_POP3, COMPRAS_PASSWORD_POP3 ');
        SQL.Add('FROM SII_CONFIGURACION_EMAIL ');
        SQL.Add('WHERE ');
        SQL.Add('EMPRESA = :EMPRESA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        ServidorPOP3 := FieldByName['COMPRAS_SERVIDOR_POP3'].AsString;
        PuertoPOP3 := FieldByName['COMPRAS_PUERTO_POP3'].AsInteger;
        UsuarioPOP3 := FieldByName['COMPRAS_USUARIO_POP3'].AsString;
        if (IncluyeCorreosLeidos) then
           UsuarioPOP3 := 'recent:' + UsuarioPOP3;
        PasswordPOP3 := FieldByName['COMPRAS_PASSWORD_POP3'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if ((ServidorPOP3 = '') or (UsuarioPOP3 = '')) then
     raise Exception.Create(_('No existen datos de conexion con el servidor de correos'));

  MsgLog.Add(_('Conectando con el servidor de correos'));

  // Creamos el objeto POP3
  POP3 := TIdPOP3.Create(nil);
  with POP3 do
  begin
     try
        SSL1.SSLOptions.Method := sslvTLSv1_2;
        IOHandler := SSL1;
        Host := ServidorPOP3;
        AuthType := patUserPass;
        Username := UsuarioPOP3;
        Password := PasswordPOP3;
        Port := PuertoPOP3;
        if (IncluyeCorreosLeidos) then
           AutoLogin := True;

        {$IFDEF Debug}
        MsgLog.Add(_('Servidor: ' + ServidorPOP3));
        MsgLog.Add(_('Usuario: ' + UsuarioPOP3));
        MsgLog.Add(_('Contraseña: ' + PasswordPOP3));
        MsgLog.Add(_('Puerto: ' + IntToStr(PuertoPOP3)));
        {$ENDIF}

        UseTLS := utUseImplicitTLS;
        POP3.IOHandler.MaxLineLength := MaxInt; // Asignamos el tamanyo maximo por line para evitar error de lectura
        try
           Connect();
           MsgLog.Add(_('Coneccion realizada con el servidor de correos'));
        except
           on E: Exception do
              raise Exception.Create('Error al conectar con el servidor.' + #13#10 + E.Message);
        end;

        CantidadMensajes := POP3.CheckMessages;
        MsgLog.Add(format(_('Se encontraron %d mensajes'), [CantidadMensajes]));

        {$IFDEF Debug}
        // CantidadMensajes := 20;
        {$ENDIF}

        Result := (CantidadMensajes > 0);

        Mensaje := TIdMessage.Create(nil);
        try
           for IdMensaje := 1 to CantidadMensajes do
           begin
              // Leemos y guardamos mensajes
              Mensaje.Clear;
              if POP3.Retrieve(IdMensaje, Mensaje) then
              begin
                 MsgLog.BeginUpdate;
                 try
                    MsgLog.Add('----------');
                    MsgLog.Add(format(_('Obteniendo mensaje %d de %d'), [IdMensaje, CantidadMensajes]));
                    MsgLog.Add(format(_('Remitente: %s'), [Mensaje.From.Address]));
                    MsgLog.Add(format(_('Asunto   : %s'), [Mensaje.Subject]));
                    MsgLog.Add(format(_('Fecha    : %s'), [DateTimeToStr(Mensaje.Date)]));
                 finally
                    MsgLog.EndUpdate;
                 end;
                 Application.ProcessMessages;

                 DMMain.Log(format(_('Obteniendo mensaje %d de %d'), [IdMensaje, CantidadMensajes]));
                 DMMain.Log(format(_('MsgId  : %s'), [Mensaje.MsgId]));
                 DMMain.Log(format(_('From   : %s'), [Mensaje.From.Address]));
                 DMMain.Log(format(_('Subject: %s'), [Mensaje.Subject]));
                 DMMain.Log(format(_('Fecha  : %s'), [DateTimeToStr(Mensaje.Date)]));
                 DMMain.Log(format(_('Cuerpo : %s'), [Mensaje.Body.Text]));

                 // Guardamos cabecera del correo
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' EXECUTE PROCEDURE SII_INSERTA_CABECERA_EMAIL(:EMPRESA, :MSG_ID, :EMAIL_RECEPTOR, :EMAIL_REMITENTE, :ASUNTO, :FECHA, :CUERPO) ');
                       Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                       Params.ByName['MSG_ID'].AsString := Mensaje.MsgId;
                       Params.ByName['EMAIL_RECEPTOR'].AsString := UsuarioPOP3;
                       Params.ByName['EMAIL_REMITENTE'].AsString := Mensaje.From.Address;
                       Params.ByName['ASUNTO'].AsString := Mensaje.Subject;
                       Params.ByName['FECHA'].AsDateTime := Mensaje.Date;
                       Params.ByName['CUERPO'].AsString := Mensaje.Body.Text;

                       ExecQuery;

                       Id_Sie := FieldByName['ID_SII_INTERCAMBIO_EMAIL'].AsInteger;
                       NuevoCorreo := (FieldByName['EXISTE'].AsInteger = 0);
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 if not NuevoCorreo then
                    MsgLog.Add(_('Correo existente. No se trata'));
                 begin
                    // Verificamos si tiene cuerpo y adjuntos
                    MsgLog.Add(format(_('Partes   : %d'), [Mensaje.MessageParts.Count]));
                    if Mensaje.MessageParts.Count > 0 then
                    begin
                       // Leemos todas las partes del mensaje
                       for IdMessagePart := 0 to Mensaje.MessageParts.Count - 1 do
                       begin
                          // Si la parte es texto
                          if (Mensaje.MessageParts.Items[IdMessagePart] is TIdText) then
                          begin
                             sMensaje := TIdText(Mensaje.MessageParts.Items[IdMessagePart]).Body.Text;
                             MsgLog.Add(format(_('   Partes: %d - %s'), [IdMessagePart, LimpiaMensaje(sMensaje)]));

                             sAdjunto := format('TextoMensaje_%d-%d.html', [Id_Sie, IdMessagePart]);//El cuerpo del mensaje lo guardamos como html(para abrir con el navegador txt ó html)
                             Fichero := DameTempPath + sAdjunto;

                             // Si ya existe el archivo adjunto lo borramos para que no de error
                             if FileExists(Fichero) then
                                DeleteFile(Fichero);

                             // Guardamos el archivo adjunto en el temporal
                             TIdText(Mensaje.MessageParts.Items[IdMessagePart]).Body.SaveToFile(Fichero);

                             DMMain.LogIni('CreaAdjunto SIE,' + IntToStr(Id_Sie) + ', %TEMP%\' + sAdjunto + ', ...)');
                             AbreData(TDMAdjunto, DMAdjunto);
                             DMAdjunto.CreaAdjunto('SIE', Id_Sie, Fichero, Format(_('Adjunto de Email de intercambio %d-%d'), [Id_Sie, IdMessagePart]));
                             CierraData(DMAdjunto);
                             DMMain.LogFin('Fin CreaAdjunto(...)');

                             // Eliminamos el archivo temporal
                             if FileExists(Fichero) then
                                DeleteFile(Fichero);
                          end
                          else
                          // Si el archivo es un adjunto binaro
                          if (Mensaje.MessageParts.Items[IdMessagePart] is TIdAttachment) then
                          begin
                             // Guardamos el nombre del archivo adjunto en una variable para hacerlo más legible
                             sAdjunto := TIdAttachment(Mensaje.MessageParts.Items[IdMessagePart]).FileName;
                             if (sAdjunto > '') then
                             begin
                                MsgLog.Add(format(_('   Partes: %d - Fichero %s'), [IdMessagePart, sAdjunto]));

                                Fichero := DameTempPath + sAdjunto;

                                // Si ya existe el archivo adjunto lo borramos para que no de error
                                if FileExists(Fichero) then
                                   DeleteFile(Fichero);

                                // Guardamos el archivo adjunto en el temporal
                                TIdAttachment(Mensaje.MessageParts.Items[IdMessagePart]).SaveToFile(Fichero);

                                DMMain.LogIni('CreaAdjunto SIE,' + IntToStr(Id_Sie) + ', %TEMP%\' + sAdjunto + ', ...)');
                                AbreData(TDMAdjunto, DMAdjunto);
                                DMAdjunto.CreaAdjunto('SIE', Id_Sie, Fichero, Format(_('Adjunto de Email de intercambio %d-%d'), [Id_Sie, IdMessagePart]));
                                CierraData(DMAdjunto);
                                DMMain.LogFin('Fin CreaAdjunto(...)');

                                // Si el adjunto es un Xml, lo leemos
                                if (UpperCase(ExtractFileExt(Fichero)) = UpperCase('.XML')) then
                                begin
                                   {
                                   if not (XmlAcuseReciboDte(Fichero, Id_Sie)) then // Determinamos si el fichero es un acuse de recibo de documento
                                   if not (XmlDocumentoEstadoCliente(Fichero, Id_Sie)) then // Determinamos si el fichero contiene el estado que se le ha asignado al DTE
                                          XmlDteProveedor(Fichero, Id_Sie); // Determinamos si el fichero contiene el Xml del Dte del proveedor
                                   }
                                   XmlAcuseReciboDte(Fichero, Id_Sie);
                                   XmlDocumentoEstadoCliente(Fichero, Id_Sie);
                                   XmlDteProveedor(Fichero, Id_Sie);
                                end;
                                // Eliminamos el archivo temporal
                                if FileExists(Fichero) then
                                   DeleteFile(Fichero);
                             end;
                          end;
                       end;
                    end;
                 end;
              end;
           end;
        finally
           Mensaje.Free;
        end;

        POP3.Disconnect;
        MsgLog.Add('Desconectando del servidor de correos');
     finally
        Free;
     end;
  end;
end;

function TDMDteRecepcionCorreos.XmlAcuseReciboDte(Fichero: string; ID_Adjunto_SIE: integer): boolean;
var
  //s : string;
  Documento : TXMLDocument;
  NodoPadre, NodoHijo : IXMLNode;
  Continua : boolean;
  Folio : integer;
  TipoDocTrib, RUTRecep : string;
begin
  DMMain.LogIni('XmlAcuseReciboDte');
  DMMain.Log('fichero: ' + Fichero + 'ID_Adjunto_SIE: ' + IntToStr(ID_Adjunto_SIE));

  // Verificamos si el Xml es sobre documento recibido
  Continua := False;
  Documento := TXMLDocument.Create(Self);
  try
     with Documento do
     begin
        XML.LoadFromFile(Fichero);
        DMMain.Log('Documento.Active := True');
        // Se activa para poder utilizar el componente
        Active := True;
        DMMain.Log('Documento.Encoding = utf-8');
        // Codigifacion UTF-8
        // Para Envio DTE de Chile debe ser ISO-8859-1
        Encoding := 'utf-8';

        DMMain.Log('Documento.NodeIndentStr = #8');
        // Caracter para indentar el fichero XML
        NodeIndentStr := #8;

        DMMain.Log('Obtener nodos');
        NodoPadre := DocumentElement;

        NodoHijo := DameNodo(NodoPadre, ['SetRecibos', 'Recibo', 'DocumentoRecibo']);
        if Assigned(NodoHijo) then
        begin
           TipoDocTrib := DameDato(NodoHijo, ['TipoDoc']);
           Folio := StrToInt(DameDato(NodoHijo, ['Folio']));
           RUTRecep := DameDato(NodoHijo, ['RUTRecep']);

           // Asignamos el campo de acuse de recibo por el cliente
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add('UPDATE GES_CABECERAS_S_FE_CHL ');
                 SQL.Add('SET ');
                 SQL.Add('ENVIADO_MAIL_CLIENTE = 1, ');
                 SQL.Add('ID_ADJUNTO_SIE = :ID_ADJUNTO_SIE ');
                 SQL.Add('WHERE ');
                 SQL.Add('TIPO_DOC_TRIBUTARIO = :TIPO_DOC_TRIBUTARIO AND ');
                 SQL.Add('FOLIO = :FOLIO AND ');
                 SQL.Add('RUTRECEP = :RUT_RECEPTOR ');

                 Params.ByName['ID_ADJUNTO_SIE'].AsInteger := ID_Adjunto_SIE;
                 Params.ByName['TIPO_DOC_TRIBUTARIO'].AsString := TipoDocTrib;
                 Params.ByName['FOLIO'].AsInteger := Folio;
                 Params.ByName['RUT_RECEPTOR'].AsString := RUTRecep;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           Result := True;
        end;
     end;
  finally
     Documento.Free;
  end;
  DMMain.LogFin('XmlAcuseReciboDte');
end;

function TDMDteRecepcionCorreos.XmlDocumentoEstadoCliente(Fichero: string; ID_Adjunto_SIE: integer): boolean;
var
  //s : string;
  Documento : TXMLDocument;
  NodoPadre, NodoHijo : IXMLNode;
  //Continua : boolean;
  Folio, EstadoRecepDTE : integer;
  TipoDocTrib, RUTRecep, RecepDteGlosa : string;
begin
  DMMain.LogIni('XmlDocumentoEstadoCliente');
  DMMain.Log('fichero: ' + Fichero + 'ID_Adjunto_SIE: ' + IntToStr(ID_Adjunto_SIE));

  // Verificamos si el Xml es sobre el estado del documento asignado por el cliente
  Result := False;

  Documento := TXMLDocument.Create(Self);
  try
     with Documento do
     begin
        XML.LoadFromFile(Fichero);
        DMMain.Log('Documento.Active := True');
        // Se activa para poder utilizar el componente
        Active := True;
        DMMain.Log('Documento.Encoding = utf-8');
        // Codigifacion UTF-8
        // Para Envio DTE de Chile debe ser ISO-8859-1
        Encoding := 'utf-8';

        DMMain.Log('Documento.NodeIndentStr = #8');
        // Caracter para indentar el fichero XML
        NodeIndentStr := #8;

        DMMain.Log('Obtener nodos');
        NodoPadre := DocumentElement;

        NodoHijo := DameNodo(NodoPadre, ['Resultado', 'RecepcionEnvio', 'RecepcionDTE']);
        if Assigned(NodoHijo) then
        begin
           TipoDocTrib := DameDato(NodoHijo, ['TipoDTE']);
           Folio := StrToInt(DameDato(NodoHijo, ['Folio']));
           RUTRecep := DameDato(NodoHijo, ['RUTRecep']);
           EstadoRecepDTE := StrToInt(DameDato(NodoHijo, ['EstadoRecepDTE']));
           RecepDteGlosa := DameDato(NodoHijo, ['RecepDTEGlosa']);

           // Asignamos el campo de Estado de documento cliente
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add('UPDATE GES_CABECERAS_S_FE_CHL ');
                 SQL.Add('SET ');
                 SQL.Add('ACEPTADO_CLIENTE = :ACEPTADO_CLIENTE, ');
                 SQL.Add('RECEPDTEGLOSA = :RECEPDTEGLOSA, ');
                 SQL.Add('ID_ADJUNTO_SIE = :ID_ADJUNTO_SIE ');
                 SQL.Add('WHERE ');
                 SQL.Add('TIPO_DOC_TRIBUTARIO = :TIPO_DOC_TRIBUTARIO AND ');
                 SQL.Add('FOLIO = :FOLIO AND ');
                 SQL.Add('RUTRECEP = :RUT_RECEPTOR ');

                 Params.ByName['ID_ADJUNTO_SIE'].AsInteger := ID_Adjunto_SIE;
                 Params.ByName['ACEPTADO_CLIENTE'].AsInteger := EstadoRecepDTE;
                 Params.ByName['RECEPDTEGLOSA'].AsString := RecepDteGlosa;
                 Params.ByName['TIPO_DOC_TRIBUTARIO'].AsString := TipoDocTrib;
                 Params.ByName['FOLIO'].AsInteger := Folio;
                 Params.ByName['RUT_RECEPTOR'].AsString := RUTRecep;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           Result := True;
        end;
     end;
  finally
     Documento.Free;
  end;
  DMMain.LogFin('XmlDocumentoEstadoCliente');
end;

function TDMDteRecepcionCorreos.XmlDteProveedor(Fichero: string; ID_Adjunto_SIE: integer): boolean;
var
  //s : string;
  Documento : TXMLDocument;
  NodoPadre, NodoHijo : IXMLNode;
  //Continua : boolean;
  //EstadoRecepDTE : integer;
  TipoDocTrib, RUTEmisor, FchEmis : string;
  //RecepDteGlosa : string;
  FechaEmision : TDateTime;
  Folio : string;
  MntNeto, MntExe, TasaIVA, IVA, MntTotal : double;

  function TipoDTEValido(TipoDocTrib: string): boolean;
  begin
     Result := True;

     if (Length(TipoDocTrib) > 3) then
        Result := False
     else
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add('SELECT COUNT(*) FROM SII_TIPO_DOCUMENTO_TRIBUTARIO ');
              SQL.Add('WHERE ');
              SQL.Add('VISIBLE_FAC = 1 AND ');
              SQL.Add('CODIGO = :TIPO_DOC_TRIBUTARIO ');
              Params.ByName['TIPO_DOC_TRIBUTARIO'].AsString := TipoDocTrib;
              ExecQuery;
              if (FieldByName['COUNT'].AsInteger < 1) then
                 Result := False;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;

begin
  DMMain.LogIni(format('XmlDteProveedor(%s, %d)', [Fichero, ID_Adjunto_SIE]));

  // Verificamos si el Xml es sobre el estado del documento asignado por el cliente
  Result := False;

  Documento := TXMLDocument.Create(Self);
  try
     with Documento do
     begin
        XML.LoadFromFile(Fichero);
        DMMain.Log('Documento.Active := True');
        // Se activa para poder utilizar el componente
        Active := True;
        DMMain.Log('Documento.Encoding = utf-8');
        // Codigifacion UTF-8
        // Para Envio DTE de Chile debe ser ISO-8859-1
        Encoding := 'utf-8';

        DMMain.Log('Documento.NodeIndentStr = #8');
        // Caracter para indentar el fichero XML
        NodeIndentStr := #8;

        DMMain.Log('Obtener nodos');
        NodoPadre := DocumentElement;

        NodoHijo := DameNodo(NodoPadre, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'IdDoc']);
        if Assigned(NodoHijo) then
        begin
           TipoDocTrib := DameDato(NodoHijo, ['TipoDTE']);
           Folio := DameDato(NodoHijo, ['Folio']);
           FchEmis := DameDato(NodoHijo, ['FchEmis']);
           FechaEmision := StrToDateTime(Copy(FchEmis, 9, Length(FchEmis)) + '/' + Copy(FchEmis, 6, Length(FchEmis) - 8) + '/' + Copy(FchEmis, 0, Length(FchEmis) - 6));

           NodoHijo := DameNodo(NodoPadre, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'Emisor']);
           if Assigned(NodoHijo) then
              RUTEmisor := DameDato(NodoHijo, ['RUTEmisor']);

           // Obtenemos datos de los totales
           MntNeto := 0;
           MntExe := 0;
           TasaIVA := 0;
           IVA := 0;
           MntTotal := 0;

           NodoHijo := DameNodo(NodoPadre, ['SetDTE', 'DTE', 'Documento', 'Encabezado', 'Totales']);
           if Assigned(NodoHijo) then
           begin
              MntNeto := StrToFloatDef(DameDato(NodoHijo, ['MntNeto']), 0);
              MntExe := StrToFloatDef(DameDato(NodoHijo, ['MntExe']), 0);
              TasaIVA := StrToFloatDef(DameDato(NodoHijo, ['TasaIVA']), 0);
              IVA := StrToFloatDef(DameDato(NodoHijo, ['IVA']), 0);
              MntTotal := StrToFloatDef(DameDato(NodoHijo, ['MntTotal']), 0);
           end;

           // Validamos Tipo de documento tributario electronico
           if (not TipoDTEValido(TipoDocTrib)) then
           begin
              DMMain.Log('El tipo de documuento triburario es incorrecto:' + TipoDocTrib);
              Result := False;
           end;

           // Insertamos o creamos registro de factura de compra
           if (Result) then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' UPDATE OR INSERT INTO RCV_COMPRA( ');
                    SQL.Add(' EMPRESA, RUT_PROVEEDOR, TIPO_DOC, FOLIO, FECHA_DOCTO, ID_ADJUNTO_SIE, ');
                    SQL.Add(' MONTO_NETO, MONTO_EXENTO, TASA_IVA, IVA, MONTO_TOTAL ');
                    {
                    SQL.Add('  , TIPO_COMPRA, RAZON_SOCIAL, FECHA_RECEPCION, FECHA_ACUSE, ');
                    SQL.Add('  MONTO_EXENTO, MONTO_NETO, MONTO_IVA_RECUPERABLE, MONTO_IVA_NO_RECUPERABLE, CODIGO_IVA_NO_RECUPERABLE,  MONTO_TOTAL, ');
                    SQL.Add('  MONTO_NETO_ACTIVO_FIJO, IVA_ACTIVO_FIJO, IVA_USO_COMUN, IMPUESTO_SIN_DERECHO_CREDITO, ');
                    SQL.Add('  IVA_NO_RETENIDO, TABACOS_PUROS, TABACOS_SIGARRILLOS, TABACOS_ELABORADOS, NCE_NDE_FACTURA_COMPRA, ');
                    SQL.Add('  CODIGO_OTRO, VALOR_OTRO_IMP, TASA_OTRO_IMP ');
                    }
                    SQL.Add(' ) VALUES ( ');
                    SQL.Add('  :EMPRESA, :RUT_PROVEEDOR, :TIPO_DOC, :FOLIO, :FECHA_DOCTO, :ID_ADJUNTO_SIE, ');
                    SQL.Add('  :MONTO_NETO, :MONTO_EXENTO, :TASA_IVA, :IVA, :MONTO_TOTAL ');

                    {
                    SQL.Add('  :TIPO_COMPRA, :RAZON_SOCIAL, :FECHA_RECEPCION, :FECHA_ACUSE, ');
                    SQL.Add('  :MONTO_EXENTO, :MONTO_NETO, :MONTO_IVA_RECUPERABLE, :MONTO_IVA_NO_RECUPERABLE, :CODIGO_IVA_NO_RECUPERABLE,  :MONTO_TOTAL, ');
                    SQL.Add('  :MONTO_NETO_ACTIVO_FIJO, :IVA_ACTIVO_FIJO, :IVA_USO_COMUN, :IMPUESTO_SIN_DERECHO_CREDITO, ');
                    SQL.Add('  :IVA_NO_RETENIDO, :TABACOS_PUROS, :TABACOS_SIGARRILLOS, :TABACOS_ELABORADOS, :NCE_NDE_FACTURA_COMPRA, ');
                    SQL.Add('  :CODIGO_OTRO, :VALOR_OTRO_IMP, :TASA_OTRO_IMP ');
                    }
                    SQL.Add(' ) MATCHING (EMPRESA, RUT_PROVEEDOR, TIPO_DOC, FOLIO) ');
                    DMMain.Log('select: ' + SQL.Text);

                    // Asignamos valores a campos
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['TIPO_DOC'].AsString := TipoDocTrib;
                    Params.ByName['RUT_PROVEEDOR'].AsString := RUTEmisor;
                    Params.ByName['FOLIO'].AsString := Folio;
                    Params.ByName['FECHA_DOCTO'].AsDateTime := FechaEmision;
                    Params.ByName['ID_ADJUNTO_SIE'].AsInteger := ID_Adjunto_SIE;
                    Params.ByName['MONTO_NETO'].AsFloat := MntNeto;
                    Params.ByName['MONTO_EXENTO'].AsFloat := MntExe;
                    Params.ByName['TASA_IVA'].AsFloat := TasaIVA;
                    Params.ByName['IVA'].AsFloat := IVA;
                    Params.ByName['MONTO_TOTAL'].AsFloat := MntTotal;
                    {
                    Params.ByName['TIPO_COMPRA'].AsString := '';
                    Params.ByName['RAZON_SOCIAL'].AsString := '';
                    Params.ByName['FECHA_DOCTO'].AsDateTime := FechaEmision;
                    Params.ByName['FECHA_RECEPCION'].AsDateTime := Now;
                    Params.ByName['FECHA_ACUSE'].AsDateTime := Now;
                    Params.ByName['MONTO_EXENTO'].AsFloat := 0;
                    Params.ByName['MONTO_NETO'].AsFloat := 0;
                    Params.ByName['MONTO_IVA_RECUPERABLE'].AsFloat := 0;
                    Params.ByName['MONTO_IVA_NO_RECUPERABLE'].AsFloat := 0;
                    Params.ByName['CODIGO_IVA_NO_RECUPERABLE'].AsFloat := 0;
                    Params.ByName['MONTO_TOTAL'].AsFloat := 0;
                    Params.ByName['MONTO_NETO_ACTIVO_FIJO'].AsFloat := 0;
                    Params.ByName['IVA_ACTIVO_FIJO'].AsFloat := 0;
                    Params.ByName['IVA_USO_COMUN'].AsFloat := 0;
                    Params.ByName['IMPUESTO_SIN_DERECHO_CREDITO'].AsFloat := 0;
                    Params.ByName['IVA_NO_RETENIDO'].AsFloat := 0;
                    Params.ByName['TABACOS_PUROS'].AsFloat := 0;
                    Params.ByName['TABACOS_SIGARRILLOS'].AsFloat := 0;
                    Params.ByName['TABACOS_ELABORADOS'].AsFloat := 0;
                    Params.ByName['NCE_NDE_FACTURA_COMPRA'].AsFloat := 0;
                    Params.ByName['CODIGO_OTRO'].AsFloat := 0;
                    Params.ByName['VALOR_OTRO_IMP'].AsFloat := 0;
                    Params.ByName['TASA_OTRO_IMP'].AsInteger := 0;
                    }
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end
           else
           begin
              DMMain.Log('No se pudo guardar los datos del Xml');
              Result := False;
           end;
        end;
     end;
  finally
     Documento.Free;
  end;

  DMMain.LogFin('XmlDteProveedor');
end;

end.
