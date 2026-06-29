unit UTicketBAI;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Messages, SysUtils, Classes, Dialogs, XMLDoc, XMLIntf, Math;

type
  TTicketBAI = class(TComponent)
  private
     Documento: TXMLDocument;
     DOMString: WideString;
     FFichero: string;
     FTipo: string;
     HayError: boolean;
     FOnError: TNotifyEvent;
     NodoRoot: IXMLNode;
     Sujetos, Factura, DetalleFactura, IDFactura, HuellaTBAI: IXMLNode;
     IDVersionTBAI: string;
  protected
     procedure Error(id: integer); dynamic;
  public
     { Public declarations }
     ErrorId: integer;
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;

     procedure Inicia(aTipo, Fichero: string);

     // Alta
     procedure SetSujetosEmisor(NIF, ApellidosNombreRazonSocial: string);
     procedure SetSujetosDestinatarios(NIF, ApellidosNombreRazonSocial, CodigoPais, IDType, ID: string; CodigoPostal: string = ''; Direccion: string = '');

     procedure SetFacturaCabecera(Serie, Numero: string; FechaExpedicion: TDateTime);
     // procedure SetFacturaCabeceraRectificativa(...);

     procedure SetFacturaDatos(FechaOperacion: TDateTime; Descripcion: string; Importe, Retencion, BaseImponibleACoste: double; Clave1: string; Clave2: string = ''; Clave3: string = '');
     procedure SetFacturaDetalle(Descripcion: string; Cantidad, Importe, Decuento, ImporteTotal: double);

     procedure SetFacturaDesgloseFactura_SujetaExenta(CausaExencion: string; BaseImponible: double);
     procedure SetFacturaDesgloseFactura_SujetaNoExenta(TipoNoExenta: string; BaseImponible, TipoImpositivo, CuotaImpuesto, TipoRecargoEquivalencia, CuotaRecargoEquivalencia: double; OperacionEnRecargoDeEquivalencia: string);
     procedure SetFacturaDesgloseFactura_NoSujeta(Causa: string; Importe: double);

     procedure SetFacturaDesgloseOperacion_PrestacionServicios_SujetaExenta(CausaExencion: string; BaseImponible: double);
     procedure SetFacturaDesgloseOperacion_PrestacionServicios_SujetaNoExenta(TipoNoExenta: string; BaseImponible, TipoImpositivo, CuotaImpuesto, TipoRecargoEquivalencia, CuotaRecargoEquivalencia: double; OperacionEnRecargoDeEquivalencia: string);
     procedure SetFacturaDesgloseOperacion_PrestacionServicios_NoSujeta(Causa: string; Importe: double);

     procedure SetFacturaDesgloseOperacion_Entrega_SujetaExenta(CausaExencion: string; BaseImponible: double);
     procedure SetFacturaDesgloseOperacion_Entrega_SujetaNoExenta(TipoNoExenta: string; BaseImponible, TipoImpositivo, CuotaImpuesto, TipoRecargoEquivalencia, CuotaRecargoEquivalencia: double; OperacionEnRecargoDeEquivalencia: string);
     procedure SetFacturaDesgloseOperacion_Entrega_NoSujeta(Causa: string; Importe: double);

     procedure SetHuellaTBAIEncadenamiento(Serie, Numero: string; FechaExpedicion: TDateTime; FirmaFactura: string);
     procedure SetHuellaTBAISoftware(LicenciaTBAI: string; NIFEntidad, Nombre, VersionSoftware: string; CodigoPais: string = ''; IDType: string = ''; ID: string = '');
     procedure SetHuellaTBAINumSerie(NumSerieDispositivo: string);

     // Baja
     procedure SetIdFacturaEmisor(NIF, ApellidosNombreRazonSocial: string);
     procedure SetIdFacturaCabecera(Serie, Numero: string; FechaExpedicion: TDateTime);

     procedure Finaliza;
     function Enviar(IdDoc: integer): boolean;
  published
     { Published declarations }
     property Fichero: string Read FFichero Write FFichero;
     property Tipo: string Read FTipo Write FTipo;
     property OnError: TNotifyEvent Read FOnError Write FOnError;
  end;

implementation

uses UDMMain, UFormGest, UEntorno, UUtiles, UFMain, HYFIBQuery, UParam, ComObj, UDMAdjunto, Variants;

function DameNodo(Nodo: IXMLNode; a: array of string): IXMLNode; overload;
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

function DameNodo(Nodo: IXMLNode; a: array of string; NameSpaceURI: string): IXMLNode; overload;
var
  i : integer;
begin
  Result := nil;
  i := 0;

  while (Assigned(Nodo) and (i < Length(a))) do
  begin
     Nodo := Nodo.ChildNodes.FindNode(a[i], NameSpaceURI);
     Inc(i);
  end;

  Result := Nodo;
end;

function DameDato(Nodo: IXMLNode; a: array of string): string; overload;
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
     Result := Nodo.Text;
end;

function DameDato(Nodo: IXMLNode; a: array of string; NameSpaceURI: string): string; overload;
var
  i : integer;
begin
  Result := '';
  i := 0;

  while (Assigned(Nodo) and (i < Length(a))) do
  begin
     Nodo := Nodo.ChildNodes.FindNode(a[i], NameSpaceURI);
     Inc(i);
  end;

  if Assigned(Nodo) then
     Result := Nodo.Text;
end;

function TTicketBAI.Enviar(IdDoc: integer): boolean;
var
  Server : variant;
  Url, Certificado : string;
  XMLRespuesta : TXMLDocument;
  Nodo, NodoSalida : IXMLNode;
  sl : TStrings;
  //EstadoEnvio : WideString;
  s : WideString;
  //NumSerieFacturaEmisor, EstadoRegistro, CodigoErrorRegistro, DescripcionErrorRegistro : WideString;
  //IdRegLRFacturas, id : integer;
  VersionMSXML : string;
  Estado, DescripcionEstado : string;
  FechaRecepcion : string;
  CSV : string;
  ResultadosValidacion : string;
begin
  DMMain.LogIni('Envio TBAI: ' + Fichero);
  try
     // Certificado. Si viene en blanco, se toma el primero del ordenador.
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT CERTIFICADO FROM EMP_MODELOS_HACIENDA WHERE EMPRESA=:EMPRESA AND EJERCICIO=:EJERCICIO AND CANAL=:CANAL';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           ExecQuery;
           Certificado := FieldByName['CERTIFICADO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (Certificado = '') then
        Certificado := DMMain.DameCertificado(REntorno.Serie);

     if (FTipo = 'Alta') then
        Url := DMMain.DameUrlEndPoint('TBA');
     if (FTipo = 'Baja') then
        Url := DMMain.DameUrlEndPoint('TBB');

     // Por defecto tomaria '6.0', pero puede ser tambien '3.0'
     VersionMSXML := LeeParametro('SIIMSXML01', '');
     DMMain.Log('CreateOleObject(''MSXML2.ServerXMLHTTP.' + VersionMSXML + ''')');
     Server := CreateOleObject('MSXML2.ServerXMLHTTP.' + VersionMSXML);

     try
        DMMain.Log('SetOption SXH_OPTION_SELECT_CLIENT_SSL_CERT + ' + Certificado);
        // 0: SXH_OPTION_URL_CODEPAGE
        // 1: SXH_OPTION_ESCAPE_PERCENT_IN_URL
        // 2: SXH_OPTION_IGNORE_SERVER_SSL_CERT_ERROR_FLAGS
        // 3: SXH_OPTION_SELECT_CLIENT_SSL_CERT
        // HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\My\Certificates\BCCC7608D2B2ADAC616CCCB6D78F956130CC3945

        Server.setOption(3, Certificado);

        // Para verificad el nombre de certificado utilizado
        Certificado := '';
        Certificado := Server.getOption(3);
        DMMain.Log('getOption(CertName) = ' + Certificado + '<');

        DMMain.Log('Server.Open(''POST'', Url, False)');
        Server.Open('POST', Url, False);

        DMMain.Log('Server.SetRequestHeader(''Content-Type'', ''application/xml'')');
        Server.SetRequestHeader('Content-Type', 'application/xml');
        Server.SetRequestHeader('charset', 'UTF-8');

        // Lo guardo como adjunto, para poder tenerlo si pasa algo.

        DMMain.LogIni('CreaAdjunto("FAC", ' + IntToStr(IdDoc) + ', TBAI Alta ' + FormatDateTime('yyyymmdd-hhnnss', Now) + ', + Fichero + ');
        AbreData(TDMAdjunto, DMAdjunto);
        DMAdjunto.CreaAdjunto('FAC', IdDoc, Fichero, 'TBAI Alta ' + FormatDateTime('yyyymmdd-hhnnss', Now));
        CierraData(DMAdjunto);
        DMMain.LogFin('Fin CreaAdjunto(...)');

        DMMain.Log('Server.Send');
        sl := TStringList.Create;
        try
           sl.LoadFromFile(Fichero);
           s := sl.Text;
           Server.Send(s);

           s := Server.ResponseText;
           sl.Text := s;
           sl.SaveToFile(ChangeFileExt(Fichero, '_Respuesta.xml'));
           DMMain.Log('Respuesta');
           DMMain.Log(s);
        finally
           sl.Free;
        end;

        DMMain.LogIni('CreaAdjunto("FAC", ' + IntToStr(IdDoc) + ', TBAI Alta Respuesta' + FormatDateTime('yyyymmdd-hhnnss', Now) + ', + Fichero + ');
        AbreData(TDMAdjunto, DMAdjunto);
        DMAdjunto.CreaAdjunto('FAC', IdDoc, ChangeFileExt(Fichero, '_Respuesta.xml'), 'TBAI Alta Respuesta' + FormatDateTime('yyyymmdd-hhnnss', Now));
        CierraData(DMAdjunto);
        DMMain.LogFin('Fin CreaAdjunto(...)');

        {
        sl := TStringList.Create;
        try
           sl.LoadFromFile('C:\WINDOWS\Temp\TicketBAI-2021-C-211083_Respuesta.xml');
           s := sl.Text;
        finally
           sl.Free;
        end;
        }

        // Formateo respuesta XML
        try
           DMMain.Log('Procesando respuesta');
           XMLRespuesta := TXMLDocument.Create(Self);
           try
              with XMLRespuesta do
              begin
                 // Borro los datos que pudiera haber
                 XML.Text := '';

                 // Cargo XML en el componente
                 XML.Text := Utf8Encode(s);
                 // XML.Text := s;

                 Active := True;

                 DMMain.Log('Respuesta XML - Busco Salida');
                 Estado := '';
                 DescripcionEstado := '';
                 FechaRecepcion := '';
                 CSV := '';
                 ResultadosValidacion := '';

                 NodoSalida := DameNodo(DocumentElement, ['Salida'], '');
                 if (Assigned(NodoSalida)) then
                 begin
                    DMMain.Log('Respuesta XML - Encontrado Nodo Salida');
                    Nodo := DameNodo(NodoSalida, ['Estado'], '');
                    if (Assigned(Nodo)) then
                    begin
                       DMMain.Log('Respuesta XML - Encontrado Nodo Estado');
                       Estado := DameDato(NodoSalida, ['Estado'], '');
                    end;

                    Nodo := DameNodo(NodoSalida, ['Descripcion'], '');
                    if (Assigned(Nodo)) then
                       DescripcionEstado := DameDato(NodoSalida, ['Descripcion'], '');

                    Nodo := DameNodo(NodoSalida, ['FechaRecepcion'], '');
                    if (Assigned(Nodo)) then
                       FechaRecepcion := DameDato(NodoSalida, ['FechaRecepcion'], '');

                    Nodo := DameNodo(NodoSalida, ['CSV'], '');
                    if (Assigned(Nodo)) then
                       CSV := DameDato(NodoSalida, ['CSV'], '');

                    ResultadosValidacion := Estado + ' - ' + DescripcionEstado;
                    Nodo := NodoSalida.ChildNodes.First;
                    while Assigned(Nodo) do
                    begin
                       if (Nodo.LocalName = 'ResultadosValidacion') then
                          ResultadosValidacion := ResultadosValidacion + #13#10 + '(' + DameDato(Nodo, ['Codigo'], '') + ')' + ' ' + DameDato(Nodo, ['Descripcion'], '');

                       Nodo := Nodo.NextSibling;
                    end;
                 end;

                 DMMain.Log('Respuesta XML - ' + #13#10 + ResultadosValidacion);

                 if (Estado = '') then
                    ShowMessage(_('No se pudo leer respuesta. Se ha guardado una copia en adjuntos'))
                 else
                    ShowMessage(ResultadosValidacion);

                 Active := False;
                 // Borro los datos
                 XML.Text := '';
              end;
           finally
              XMLRespuesta.Free;
           end;

           if Estado = '00' then
           begin
              DMMain.Log('CSV: ' + CSV);
              DMMain.Log('Fecha Recepcion: ' + FechaRecepcion);

              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' UPDATE GES_CABECERAS_S_FAC_TBAI ');
                    SQL.Add(' SET ');
                    if (FTipo = 'Alta') then
                    begin
                       SQL.Add(' CSV = :CSV, ');
                       SQL.Add(' FECHA_RECEPCION = :FECHA_RECEPCION ');
                    end;
                    if (FTipo = 'Baja') then
                    begin
                       SQL.Add(' CSV_BAJA = :CSV, ');
                       SQL.Add(' FECHA_RECEPCION_BAJA = :FECHA_RECEPCION ');
                    end;
                    SQL.Add(' WHERE ');
                    SQL.Add(' ID_S = :ID_S ');
                    Params.ByName['ID_S'].AsInteger := IdDoc;
                    Params.ByName['CSV'].AsString := CSV;
                    Params.ByName['FECHA_RECEPCION'].AsString := FechaRecepcion;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;

           DMMain.Log(s);
        except
           on e: Exception do
           begin
              // Si algo falla al tratar la respuesta, por lo menos guardo la version en bruto
              // Guardo respuesta
              DMMain.LogIni('CreaAdjunto("FAC", ' + IntToStr(IdDoc) + ', TBAI Alta Error' + FormatDateTime('yyyymmdd-hhnnss', Now) + ', + Fichero + ');
              AbreData(TDMAdjunto, DMAdjunto);
              DMAdjunto.CreaAdjunto('FAC', IdDoc, ChangeFileExt(Fichero, '_Respuesta.xml'), 'TBAI Alta Error' + FormatDateTime('yyyymmdd-hhnnss', Now));
              CierraData(DMAdjunto);
              DMMain.LogFin('Fin CreaAdjunto(...)');

              ShowMessage('Hubo un fallo. Se ha guardado una copia de la respuesta en adjuntoes.' + #13#10 + E.Message);
           end;
        end;
     finally
        Server := Unassigned;
     end;
  finally
     DMMain.LogFin('Envio TBAI');
  end;
end;

constructor TTicketBAI.Create(AOwner: TComponent);
begin
  inherited;
  Documento := TXMLDocument.Create(Self);
  IDVersionTBAI := '1.2';
end;

destructor TTicketBAI.Destroy;
begin
  inherited;
  // Se libera con el componente, pues es su padre
  // Documento.Free;
end;

procedure TTicketBAI.Error(Id: integer);
var
  MsgError : string;
begin
  ErrorId := Id;
  HayError := True;
  if Assigned(OnError) then
     OnError(Self)
  else
  begin
     case Id of
        1: MsgError := 'El emisor ya ha sido asignado';
        2: MsgError := 'El destinatario ya ha sido asignado';
        3: MsgError := 'La cabecera de factura ya esta asignada';
        4: MsgError := 'El encadenamiento ya ha sido asignado';
        5: MsgError := 'Los datos de Software ya estan informados';
        6: MsgError := 'El Numero de Serie del Dispositivo ya esta asignado';
        {
        7: MsgError := 'UnitOfMeasure debe tener un valor entre ''01'' y ''35''';
        8: MsgError := 'TaxTypeCode debe tener un valor entre ''01'' y ''29''';
        9: MsgError := 'PaymentMean debe tener un valor entre ''01'' y ''19''';
        10: MsgError := 'En caso de forma de pago "Transferencia" la cuenta de abono es obligatoria';
        11: MsgError := 'En caso de forma de pago "Recibo domiciliado" la cuenta de abono es obligatoria';
        12: MsgError := 'RoleTypeCode solo puede contener valores de 01 a 05 en Centros Adiministrativos del Comprador';
        }
        998: MsgError := '998 - No existe nodo padre (SetFacturaDetalle)';
        999: MsgError := '999 - Se esta intentando insertar nodo de tipo incorrecto (Alta/Baja)';
     end;
     raise Exception.Create('Error en la generación del fichero' + #13#10 + MsgError);
  end;
end;

procedure TTicketBAI.Inicia(aTipo, Fichero: string);
var
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
begin
  HayError := False;

  FFichero := Fichero;
  FTipo := aTipo;

  if (FTipo <> 'Alta') and (FTipo <> 'Baja') then
     raise Exception.Create('El tipo de Ticket BAI solo puede ser "Alta" o "Baja"');

  with Documento do
  begin
     // Borro los datos que pudiera haber
     XML.Text := '';
     // Se activa para poder utilizar el componente
     Active := True;
     // Codigifacion UTF-8
     Encoding := 'utf-8';
     // Standalone="yes"
     // StandAlone := 'yes';
     // Caracter para indentar el fichero XML
     NodeIndentStr := #8;

     // Creo el primer elemento
     if (FTipo = 'Alta') then
     begin
        DocumentElement := CreateElement('T:TicketBai', '');
        with DocumentElement do
        begin
           DOMString := '';
           DeclareNamespace('T', 'urn:ticketbai:emision');
        end;
     end;

     if (FTipo = 'Baja') then
     begin
        DocumentElement := CreateElement('T:AnulaTicketBai', '');
        with DocumentElement do
        begin
           DOMString := '';
           DeclareNamespace('T', 'urn:ticketbai:anulacion');
        end;
     end;

     NodoPadre := DocumentElement;
     NodoRoot := DocumentElement;
     Sujetos := nil;
     Factura := nil;
     DetalleFactura := nil;
     HuellaTBAI := nil;
     IDFactura := nil;

     // Cabecera -------------------------------------------------------------
     NodoPadre := NodoPadre.AddChild('Cabecera', DOMString);
     Nodo := NodoPadre.AddChild('IDVersionTBAI', DOMString);
     Nodo.Text := IDVersionTBAI;
  end;
end;

procedure TTicketBAI.Finaliza;
begin
  /// Guarda el XML generado en el fichero si esta definido
  /// Limpia el XML para poder generar otra factura

  with Documento do
  begin
     // Doy formato al fichero y lo grabo a disco
     XML.Text := FormatXMLData(XML.Text);
     Active := True;
     Encoding := 'utf-8';
     if (FFichero > '') then
        SaveToFile(FFichero);
     Active := False;
     // Borro los datos
     XML.Text := '';
  end;
end;

procedure TTicketBAI.SetSujetosEmisor(NIF, ApellidosNombreRazonSocial: string);
var
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
begin
  HayError := False;

  if (FTipo = 'Alta') then
  begin
     with Documento do
     begin
        // Verifico que exista Sujetos
        if not Assigned(Sujetos) then
           Sujetos := DameNodo(DocumentElement, ['Sujetos']);
        if not Assigned(Sujetos) then
           Sujetos := DocumentElement.AddChild('Sujetos', DOMString);

        // Verifico que exista Sujetos->Emisor
        Nodo := DameNodo(Sujetos, ['Emisor']);
        if not Assigned(Nodo) then
        begin
           NodoPadre := Sujetos.AddChild('Emisor', DOMString);

           Nodo := NodoPadre.AddChild('NIF', DOMString);
           Nodo.Text := NIF;

           Nodo := NodoPadre.AddChild('ApellidosNombreRazonSocial', DOMString);
           Nodo.Text := ApellidosNombreRazonSocial;
        end
        else
           Error(1);
     end;
  end
  else
     Error(999);
end;

procedure TTicketBAI.SetSujetosDestinatarios(NIF, ApellidosNombreRazonSocial, CodigoPais, IDType, ID: string; CodigoPostal: string = ''; Direccion: string = '');
var
  NodoPadre : IXMLNode;
  NodoIDOtro : IXMLNode;
  Nodo : IXMLNode;
begin
  HayError := False;

  with Documento do
  begin
     // Verifico que exista Sujetos
     if not Assigned(Sujetos) then
        Sujetos := DameNodo(DocumentElement, ['Sujetos']);
     if not Assigned(Sujetos) then
        Sujetos := DocumentElement.AddChild('Sujetos', DOMString);

     // Verifico que exista Sujetos->Emisor
     Nodo := DameNodo(Sujetos, ['Destinatarios']);
     if not Assigned(Nodo) then
     begin
        NodoPadre := Sujetos.AddChild('Destinatarios', DOMString);

        // Puede haber hasta 100 destinatarios. Solo utilizaremos 1
        NodoPadre := NodoPadre.AddChild('IDDestinatario', DOMString);

        if (NIF > '') then
        begin
           Nodo := NodoPadre.AddChild('NIF', DOMString);
           Nodo.Text := NIF;
        end
        else
        begin
           NodoIDOtro := NodoPadre.AddChild('IDOtro', DOMString);

           // ISO 3166-1 Alfa(2)
           Nodo := NodoIDOtro.AddChild('CodigoPais', DOMString);
           Nodo.Text := CodigoPais;

           // L2
           // 02 NIF-IVA
           // 03 Pasaporte
           // 04 Documento oficial de identificación expedido por el país o territorio de residencia
           // 05 Certificado de residencia
           // 06 Otro documento probatorio
           Nodo := NodoIDOtro.AddChild('IDType', DOMString);
           Nodo.Text := IDType;

           // Alfa(20)
           Nodo := NodoIDOtro.AddChild('ID', DOMString);
           Nodo.Text := ID;
        end;

        Nodo := NodoPadre.AddChild('ApellidosNombreRazonSocial', DOMString);
        Nodo.Text := ApellidosNombreRazonSocial;

        // Es opcional (Obligatorio en Guipuzcoa), debe ser como numerico
        if (CodigoPostal > '') then
        begin
           Nodo := NodoPadre.AddChild('CodigoPostal', DOMString);
           Nodo.Text := CodigoPostal;
        end;

        // Es opcional (Obligatorio en Guipuzcoa), debe ser como numerico
        if (Direccion > '') then
        begin
           Nodo := NodoPadre.AddChild('Direccion', DOMString);
           Nodo.Text := Direccion;
        end;
     end
     else
        Error(2);
  end;
end;

procedure TTicketBAI.SetFacturaCabecera(Serie, Numero: string; FechaExpedicion: TDateTime);
var
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
begin
  HayError := False;

  if (FTipo = 'Alta') then
  begin
     with Documento do
     begin
        // Verifico que exista Factura
        if not Assigned(Factura) then
           Factura := DameNodo(DocumentElement, ['Factura']);
        if not Assigned(Factura) then
           Factura := DocumentElement.AddChild('Factura', DOMString);

        // Verifico que exista Factura->CabeceraFactura
        Nodo := DameNodo(Factura, ['CabeceraFactura']);
        if not Assigned(Nodo) then
        begin
           NodoPadre := Factura.AddChild('CabeceraFactura', DOMString);

           // Solo las letras
           Nodo := NodoPadre.AddChild('SerieFactura', DOMString);
           Nodo.Text := Serie;

           // Solo los numeros
           Nodo := NodoPadre.AddChild('NumFactura', DOMString);
           Nodo.Text := Numero;

           // Fecha de expedición de la factura rectificada o sustituida.
           Nodo := NodoPadre.AddChild('FechaExpedicionFactura', DOMString);
           Nodo.Text := FormatDateTime('dd-mm-yyyy', FechaExpedicion);

           Nodo := NodoPadre.AddChild('HoraExpedicionFactura', DOMString);
           Nodo.Text := FormatDateTime('hh:nn:ss', FechaExpedicion);
        end
        else
           Error(3);
     end;
  end
  else
     Error(999);
end;

procedure TTicketBAI.SetFacturaDatos(FechaOperacion: TDateTime; Descripcion: string; Importe, Retencion, BaseImponibleACoste: double; Clave1, Clave2, Clave3: string);
var
  NodoPadre : IXMLNode;
  NodoClaves : IXMLNode;
  Nodo : IXMLNode;
begin
  HayError := False;

  with Documento do
  begin
     // Verifico que exista Factura
     if not Assigned(Factura) then
        Factura := DameNodo(DocumentElement, ['Factura']);
     if not Assigned(Factura) then
        Factura := DocumentElement.AddChild('Factura', DOMString);

     // Verifico que exista Factura->DatosFactura
     Nodo := DameNodo(Factura, ['DatosFactura']);
     if not Assigned(Nodo) then
     begin
        NodoPadre := Factura.AddChild('DatosFactura', DOMString);

        // Fecha en la que se ha realizado la operación siempre que sea diferente a la fecha de expedición.
        if (FormatDateTime('dd-mm-yyyy', FechaOperacion) <> DameDato(Factura, ['CabeceraFactura', 'FechaExpedicionFactura'])) then
        begin
           Nodo := NodoPadre.AddChild('FechaOperacion', DOMString);
           Nodo.Text := FormatDateTime('dd-mm-yyyy', FechaOperacion);
        end;

        // Descripción general de las operaciones
        Nodo := NodoPadre.AddChild('DescripcionFactura', DOMString);
        Nodo.Text := Copy(Descripcion, 1, 250);

        // Es nodo opcional, pero obligatorio en Guipuzcoa
        DetalleFactura := NodoPadre.AddChild('DetallesFactura', DOMString);

        // Importe total de la factura.
        Nodo := NodoPadre.AddChild('ImporteTotalFactura', DOMString);
        Nodo.Text := FormatAmount(Importe, 2);

        if (Retencion <> 0) then
        begin
           Nodo := NodoPadre.AddChild('RetencionSoportada', DOMString);
           Nodo.Text := FormatAmount(Retencion, 2);
        end;

        if (BaseImponibleACoste <> 0) then
        begin
           Nodo := NodoPadre.AddChild('BaseImponibleACoste', DOMString);
           Nodo.Text := FormatAmount(BaseImponibleACoste, 2);
        end;

        // Claves
        {
        L9
        Clave de régimen especial de IVA y operaciones con trascendencia tributaria
        Valores - Descripción
        01 Operación de régimen general y cualquier otro supuesto que no esté recogido en los siguientes valores
        02 Exportación
        03 Operaciones a las que se aplique el régimen especial de bienes usados, objetos de arte, antigüedades y objetos de colección
        04 Régimen especial del oro de inversión
        05 Régimen especial de las agencias de viajes
        06 Régimen especial grupo de entidades en IVA (Nivel Avanzado)
        07 Régimen especial del criterio de caja
        08 Operaciones sujetas al IPSI/IGIC (Impuesto sobre la Producción, los Servicios y la Importación / Impuesto General Indirecto Canario)
        09 Facturación de las prestaciones de servicios de agencias de viaje que actúan como mediadoras en nombre y por cuenta ajena (disposición adicional 3ª del Reglamento de Facturación)
        10 Cobros por cuenta de terceros o terceras de honorarios profesionales o de derechos derivados de la propiedad industrial, de autor u otros por cuenta de sus socios, socias, asociados, asociadas, colegiados o colegiadas efectuados por sociedades, asociaciones, colegios profesionales u otras entidades que realicen estas funciones de cobro
        11 Operaciones de arrendamiento de local de negocio sujetos a retención
        12 Operaciones de arrendamiento de local de negocio no sujetos a retención
        13 Operaciones de arrendamiento de local de negocio sujetas y no sujetas a retención
        14 Factura con IVA pendiente de devengo en certificaciones de obra cuya destinataria sea una Administración Pública
        15 Factura con IVA pendiente de devengo en operaciones de tracto sucesivo
        51 Operaciones en recargo de equivalencia
        52 Operaciones en régimen simplificado
        53 Operaciones realizadas por personas o entidades que no tengan la consideración de empresarios, empresarias o profesionales a efectos del IVA
        }
        NodoClaves := NodoPadre.AddChild('Claves', DOMString);
        Nodo := NodoClaves.AddChild('IDClave', DOMString);
        Nodo := Nodo.AddChild('ClaveRegimenIvaOpTrascendencia', DOMString);
        Nodo.Text := Clave1;

        if (Clave2 > '') then
        begin
           Nodo := NodoClaves.AddChild('IDClave', DOMString);
           Nodo := Nodo.AddChild('ClaveRegimenIvaOpTrascendencia', DOMString);
           Nodo.Text := Clave2;
        end;

        if (Clave3 > '') then
        begin
           Nodo := NodoClaves.AddChild('IDClave', DOMString);
           Nodo := Nodo.AddChild('ClaveRegimenIvaOpTrascendencia', DOMString);
           Nodo.Text := Clave3;
        end;
     end
     else
        Error(3);
  end;
end;

procedure TTicketBAI.SetFacturaDetalle(Descripcion: string; Cantidad, Importe, Decuento, ImporteTotal: double);
var
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
begin
  HayError := False;

  with Documento do
  begin
     // Verifico que exista Factura
     if not Assigned(Factura) then
        Error(998)
     else
        // Verifico que exista Factura->DatosFactura
        NodoPadre := DameNodo(Factura, ['DatosFactura']);
     if not Assigned(NodoPadre) then
        Error(998)
     else
     begin
        // Verifico que exista Factura->DatosFactura
        NodoPadre := DameNodo(NodoPadre, ['DetallesFactura']);
        if not Assigned(NodoPadre) then
           Error(998)
        else
        begin
           NodoPadre := NodoPadre.AddChild('IDDetalleFactura', DOMString);

           Nodo := NodoPadre.AddChild('DescripcionDetalle', DOMString);
           Nodo.Text := Copy(Descripcion, 1, 250);

           Nodo := NodoPadre.AddChild('Cantidad', DOMString);
           Nodo.Text := FormatAmount(Cantidad, 2);

           // Importe unitario SIN IVA de la línea de factura. (8 decimales)
           Nodo := NodoPadre.AddChild('ImporteUnitario', DOMString);
           Nodo.Text := FormatAmount(Importe, 8);

           // Importe EN EUROS del descuento de la línea de factura
           Nodo := NodoPadre.AddChild('Descuento', DOMString);
           Nodo.Text := FormatAmount(Decuento, 2);

           // Importe total CON IVA de la línea de factura.
           Nodo := NodoPadre.AddChild('ImporteTotal', DOMString);
           Nodo.Text := FormatAmount(ImporteTotal, 2);
        end;
     end;
  end;
end;

procedure TTicketBAI.SetFacturaDesgloseFactura_SujetaExenta(CausaExencion: string; BaseImponible: double);
var
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
begin
  HayError := False;

  with Documento do
  begin
     // Verifico que exista Factura
     if not Assigned(Factura) then
        Factura := DameNodo(DocumentElement, ['Factura']);
     if not Assigned(Factura) then
        Factura := DocumentElement.AddChild('Factura', DOMString);

     // Verifico que exista Factura->TipoDesglose
     NodoPadre := DameNodo(Factura, ['TipoDesglose']);
     if not Assigned(NodoPadre) then
        NodoPadre := Factura.AddChild('TipoDesglose', DOMString);

     // Verifico que exista Factura->TipoDesglose->DesgloseFactura
     Nodo := DameNodo(NodoPadre, ['DesgloseFactura']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('DesgloseFactura', DOMString)
     else
        NodoPadre := Nodo;

     // Verifico que exista Factura->TipoDesglose->DesgloseFactura->Sujeta
     Nodo := DameNodo(NodoPadre, ['Sujeta']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('Sujeta', DOMString)
     else
        NodoPadre := Nodo;

     // Verifico que exista Factura->TipoDesglose->DesgloseFactura->Sujeta->Exenta
     Nodo := DameNodo(NodoPadre, ['Exenta']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('Exenta', DOMString)
     else
        NodoPadre := Nodo;

     if Assigned(NodoPadre) then
     begin
        NodoPadre := NodoPadre.AddChild('DetalleExenta', DOMString);

        // L10 - Causa de exención de operaciones sujetas y exentasValoresDescripción
        // E1 Exenta por el artículo 20 de la Norma Foral del IVA
        // E2 Exenta por el artículo 21 de la Norma Foral del IVA
        // E3 Exenta por el artículo 22 de la Norma Foral del IVA
        // E4 Exenta por el artículo 23 y 24 de la Norma Foral del IVA
        // E5 Exenta por el artículo 25 de la Norma Foral del IVA
        // E6 Exenta por otra causa
        Nodo := NodoPadre.AddChild('CausaExencion', DOMString);
        Nodo.Text := CausaExencion;

        Nodo := NodoPadre.AddChild('BaseImponible', DOMString);
        Nodo.Text := FormatAmount(BaseImponible, 2);
     end;
  end;
end;

procedure TTicketBAI.SetFacturaDesgloseFactura_SujetaNoExenta(TipoNoExenta: string; BaseImponible, TipoImpositivo, CuotaImpuesto, TipoRecargoEquivalencia, CuotaRecargoEquivalencia: double; OperacionEnRecargoDeEquivalencia: string);
var
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
begin
  HayError := False;

  with Documento do
  begin
     // Verifico que exista Factura
     if not Assigned(Factura) then
        Factura := DameNodo(DocumentElement, ['Factura']);
     if not Assigned(Factura) then
        Factura := DocumentElement.AddChild('Factura', DOMString);

     // Verifico que exista Factura->TipoDesglose
     NodoPadre := DameNodo(Factura, ['TipoDesglose']);
     if not Assigned(NodoPadre) then
        NodoPadre := Factura.AddChild('TipoDesglose', DOMString);

     // Verifico que exista Factura->TipoDesglose->DesgloseFactura
     Nodo := DameNodo(NodoPadre, ['DesgloseFactura']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('DesgloseFactura', DOMString)
     else
        NodoPadre := Nodo;

     // Verifico que exista Factura->TipoDesglose->DesgloseFactura->Sujeta
     Nodo := DameNodo(NodoPadre, ['Sujeta']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('Sujeta', DOMString)
     else
        NodoPadre := Nodo;

     // Verifico que exista Factura->TipoDesglose->DesgloseFactura->Sujeta->Exenta
     Nodo := DameNodo(NodoPadre, ['NoExenta']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('NoExenta', DOMString)
     else
        NodoPadre := Nodo;

     if Assigned(NodoPadre) then
     begin
        // Puede haber dos detalles (Con o Sin ISP)
        // Debo averiguar si ya existe la que neceisto para este registro
        Nodo := DameNodo(NodoPadre, ['DetalleNoExenta']);
        if not Assigned(Nodo) then
           NodoPadre := NodoPadre.AddChild('DetalleNoExenta', DOMString)
        else
        begin
           if (Assigned(DameNodo(Nodo, ['TipoNoExenta']))) then
           begin
              if (DameDato(Nodo, ['TipoNoExenta']) = TipoNoExenta) then
                 NodoPadre := Nodo
              else
              begin
                 // El otro nodo solo puede ser del tipo que busco.
                 Nodo := NodoPadre.NextSibling;

                 if not Assigned(Nodo) then
                    NodoPadre := NodoPadre.AddChild('DetalleNoExenta', DOMString);
              end;
           end
           else
              NodoPadre := Nodo;
        end;

        // L11
        // S1 Sin inversión del sujeto pasivo
        // S2 Con inversión del sujeto pasivo
        if (not Assigned(DameNodo(NodoPadre, ['TipoNoExenta']))) then
        begin
           Nodo := NodoPadre.AddChild('TipoNoExenta', DOMString);
           Nodo.Text := TipoNoExenta;
        end;

        Nodo := DameNodo(NodoPadre, ['DesgloseIVA']);
        if not Assigned(Nodo) then
           NodoPadre := NodoPadre.AddChild('DesgloseIVA', DOMString)
        else
           NodoPadre := Nodo;

        NodoPadre := NodoPadre.AddChild('DetalleIVA', DOMString);

        Nodo := NodoPadre.AddChild('BaseImponible', DOMString);
        Nodo.Text := FormatAmount(BaseImponible, 2);

        Nodo := NodoPadre.AddChild('TipoImpositivo', DOMString);
        Nodo.Text := FormatAmount(TipoImpositivo, 2);

        Nodo := NodoPadre.AddChild('CuotaImpuesto', DOMString);
        Nodo.Text := FormatAmount(CuotaImpuesto, 2);

        Nodo := NodoPadre.AddChild('TipoRecargoEquivalencia', DOMString);
        Nodo.Text := FormatAmount(TipoRecargoEquivalencia, 2);

        Nodo := NodoPadre.AddChild('CuotaRecargoEquivalencia', DOMString);
        Nodo.Text := FormatAmount(CuotaRecargoEquivalencia, 2);

        // Operación en recargo de equivalencia o Régimen simplificado.
        // El valor por defecto es "N".
        // Si se marca "S", se trata de una factura expedida por un contribuyente en régimen simplificado o en régimen de recargo de equivalencia.
        if (OperacionEnRecargoDeEquivalencia = 'S') then
        begin
           // L12
           // S o N
           Nodo := NodoPadre.AddChild('OperacionEnRecargoDeEquivalenciaORegimenSimplificado', DOMString);
           Nodo.Text := OperacionEnRecargoDeEquivalencia;
        end;
     end;
  end;
end;

procedure TTicketBAI.SetFacturaDesgloseFactura_NoSujeta(Causa: string; Importe: double);
var
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
begin
  HayError := False;

  with Documento do
  begin
     // Verifico que exista Factura
     if not Assigned(Factura) then
        Factura := DameNodo(DocumentElement, ['Factura']);
     if not Assigned(Factura) then
        Factura := DocumentElement.AddChild('Factura', DOMString);

     // Verifico que exista Factura->TipoDesglose
     Nodo := DameNodo(Factura, ['TipoDesglose']);
     if not Assigned(Nodo) then
        NodoPadre := Factura.AddChild('TipoDesglose', DOMString)
     else
        NodoPadre := Nodo;

     // Verifico que exista Factura->TipoDesglose->DesgloseFactura
     Nodo := DameNodo(NodoPadre, ['DesgloseFactura']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('DesgloseFactura', DOMString)
     else
        NodoPadre := Nodo;

     // Verifico que exista Factura->TipoDesglose->DesgloseFactura->NoSujeta
     Nodo := DameNodo(NodoPadre, ['NoSujeta']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('NoSujeta', DOMString)
     else
        NodoPadre := Nodo;

     if Assigned(NodoPadre) then
     begin
        NodoPadre := NodoPadre.AddChild('DetalleNoSujeta', DOMString);

        // L13 Causa de no sujeción
        // OT No sujeto por el artículo 7 de la Norma Foral de IVAOtros supuestos de no sujeción
        // RL No sujeto por reglas de localización
        Nodo := NodoPadre.AddChild('Causa', DOMString);
        Nodo.Text := Causa;

        Nodo := NodoPadre.AddChild('Importe', DOMString);
        Nodo.Text := FormatAmount(Importe, 2);
     end;
  end;
end;

procedure TTicketBAI.SetFacturaDesgloseOperacion_PrestacionServicios_SujetaExenta(CausaExencion: string; BaseImponible: double);
var
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
begin
  HayError := False;

  with Documento do
  begin
     // Verifico que exista Factura
     if not Assigned(Factura) then
        Factura := DameNodo(DocumentElement, ['Factura']);
     if not Assigned(Factura) then
        Factura := DocumentElement.AddChild('Factura', DOMString);

     // Verifico que exista Factura->TipoDesglose
     NodoPadre := DameNodo(Factura, ['TipoDesglose']);
     if not Assigned(NodoPadre) then
        NodoPadre := Factura.AddChild('TipoDesglose', DOMString);

     // Verifico que exista Factura->TipoDesglose->DesgloseTipoOperacion
     NodoPadre := DameNodo(Factura, ['DesgloseTipoOperacion']);
     if not Assigned(NodoPadre) then
        NodoPadre := Factura.AddChild('DesgloseTipoOperacion', DOMString);

     // Verifico que exista Factura->TipoDesglose->DesgloseFactura
     Nodo := DameNodo(NodoPadre, ['PrestacionServicios']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('PrestacionServicios', DOMString)
     else
        NodoPadre := Nodo;

     // Verifico que exista Factura->TipoDesglose->DesgloseFactura->Sujeta
     Nodo := DameNodo(NodoPadre, ['Sujeta']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('Sujeta', DOMString)
     else
        NodoPadre := Nodo;

     // Verifico que exista Factura->TipoDesglose->DesgloseFactura->Sujeta->Exenta
     Nodo := DameNodo(NodoPadre, ['Exenta']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('Exenta', DOMString)
     else
        NodoPadre := Nodo;

     if Assigned(NodoPadre) then
     begin
        NodoPadre := NodoPadre.AddChild('DetalleExenta', DOMString);

        // L10
        Nodo := NodoPadre.AddChild('CausaExencion', DOMString);
        Nodo.Text := CausaExencion;

        Nodo := NodoPadre.AddChild('BaseImponible', DOMString);
        Nodo.Text := FormatAmount(BaseImponible, 2);
     end;
  end;
end;

procedure TTicketBAI.SetFacturaDesgloseOperacion_PrestacionServicios_SujetaNoExenta(TipoNoExenta: string; BaseImponible, TipoImpositivo, CuotaImpuesto, TipoRecargoEquivalencia, CuotaRecargoEquivalencia: double; OperacionEnRecargoDeEquivalencia: string);
var
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
begin
  HayError := False;

  with Documento do
  begin
     // Verifico que exista Factura
     if not Assigned(Factura) then
        Factura := DameNodo(DocumentElement, ['Factura']);
     if not Assigned(Factura) then
        Factura := DocumentElement.AddChild('Factura', DOMString);

     // Verifico que exista Factura->TipoDesglose
     NodoPadre := DameNodo(Factura, ['TipoDesglose']);
     if not Assigned(NodoPadre) then
        NodoPadre := Factura.AddChild('TipoDesglose', DOMString);

     // Verifico que exista Factura->TipoDesglose->DesgloseTipoOperacion
     NodoPadre := DameNodo(Factura, ['DesgloseTipoOperacion']);
     if not Assigned(NodoPadre) then
        NodoPadre := Factura.AddChild('DesgloseTipoOperacion', DOMString);

     // Verifico que exista Factura->TipoDesglose->DesgloseFactura
     Nodo := DameNodo(NodoPadre, ['PrestacionServicios']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('PrestacionServicios', DOMString)
     else
        NodoPadre := Nodo;

     // Verifico que exista Factura->TipoDesglose->DesgloseFactura->Sujeta
     Nodo := DameNodo(NodoPadre, ['Sujeta']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('Sujeta', DOMString)
     else
        NodoPadre := Nodo;

     // Verifico que exista Factura->TipoDesglose->DesgloseFactura->Sujeta->Exenta
     Nodo := DameNodo(NodoPadre, ['NoExenta']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('NoExenta', DOMString)
     else
        NodoPadre := Nodo;

     if Assigned(NodoPadre) then
     begin
        // Puede haber dos detalles (Con o Sin ISP)
        // Debo averiguar si ya existe la que neceisto para este registro
        Nodo := DameNodo(NodoPadre, ['DetalleNoExenta']);
        if not Assigned(Nodo) then
           NodoPadre := NodoPadre.AddChild('DetalleNoExenta', DOMString)
        else
        begin
           if (Assigned(DameNodo(Nodo, ['TipoNoExenta']))) then
           begin
              if (DameDato(Nodo, ['TipoNoExenta']) = TipoNoExenta) then
                 NodoPadre := Nodo
              else
              begin
                 // El otro nodo solo puede ser del tipo que busco.
                 Nodo := NodoPadre.NextSibling;

                 if not Assigned(Nodo) then
                    NodoPadre := NodoPadre.AddChild('DetalleNoExenta', DOMString);
              end;
           end
           else
              NodoPadre := Nodo;
        end;

        // L11
        // S1 Sin inversión del sujeto pasivo
        // S2 Con inversión del sujeto pasivo
        if (not Assigned(DameNodo(NodoPadre, ['TipoNoExenta']))) then
        begin
           Nodo := NodoPadre.AddChild('TipoNoExenta', DOMString);
           Nodo.Text := TipoNoExenta;
        end;

        Nodo := DameNodo(NodoPadre, ['DesgloseIVA']);
        if not Assigned(Nodo) then
           NodoPadre := NodoPadre.AddChild('DesgloseIVA', DOMString)
        else
           NodoPadre := Nodo;

        NodoPadre := NodoPadre.AddChild('DetalleIVA', DOMString);

        Nodo := NodoPadre.AddChild('BaseImponible', DOMString);
        Nodo.Text := FormatAmount(BaseImponible, 2);

        Nodo := NodoPadre.AddChild('TipoImpositivo', DOMString);
        Nodo.Text := FormatAmount(TipoImpositivo, 2);

        Nodo := NodoPadre.AddChild('CuotaImpuesto', DOMString);
        Nodo.Text := FormatAmount(CuotaImpuesto, 2);

        Nodo := NodoPadre.AddChild('TipoRecargoEquivalencia', DOMString);
        Nodo.Text := FormatAmount(TipoRecargoEquivalencia, 2);

        Nodo := NodoPadre.AddChild('CuotaRecargoEquivalencia', DOMString);
        Nodo.Text := FormatAmount(CuotaRecargoEquivalencia, 2);

        // Operación en recargo de equivalencia o Régimen simplificado.
        // El valor por defecto es "N".
        // Si se marca "S", se trata de una factura expedida por un contribuyente en régimen simplificado o en régimen de recargo de equivalencia.
        if (OperacionEnRecargoDeEquivalencia = 'S') then
        begin
           // L12
           // S o N
           Nodo := NodoPadre.AddChild('OperacionEnRecargoDeEquivalenciaORegimenSimplificado', DOMString);
           Nodo.Text := OperacionEnRecargoDeEquivalencia;
        end;
     end;
  end;
end;

procedure TTicketBAI.SetFacturaDesgloseOperacion_PrestacionServicios_NoSujeta(Causa: string; Importe: double);
var
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
begin
  HayError := False;

  with Documento do
  begin
     // Verifico que exista Factura
     if not Assigned(Factura) then
        Factura := DameNodo(DocumentElement, ['Factura']);
     if not Assigned(Factura) then
        Factura := DocumentElement.AddChild('Factura', DOMString);

     // Verifico que exista Factura->TipoDesglose
     NodoPadre := DameNodo(Factura, ['TipoDesglose']);
     if not Assigned(NodoPadre) then
        NodoPadre := Factura.AddChild('TipoDesglose', DOMString);

     // Verifico que exista Factura->TipoDesglose->DesgloseTipoOperacion
     NodoPadre := DameNodo(Factura, ['DesgloseTipoOperacion']);
     if not Assigned(NodoPadre) then
        NodoPadre := Factura.AddChild('DesgloseTipoOperacion', DOMString);

     // Verifico que exista Factura->TipoDesglose->DesgloseFactura
     Nodo := DameNodo(NodoPadre, ['PrestacionServicios']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('PrestacionServicios', DOMString)
     else
        NodoPadre := Nodo;

     // Verifico que exista Factura->TipoDesglose->DesgloseFactura->NoSujeta
     Nodo := DameNodo(NodoPadre, ['NoSujeta']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('NoSujeta', DOMString)
     else
        NodoPadre := Nodo;

     if Assigned(NodoPadre) then
     begin
        NodoPadre := NodoPadre.AddChild('DetalleNoSujeta', DOMString);

        // L13 Causa de no sujeción
        // OT No sujeto por el artículo 7 de la Norma Foral de IVAOtros supuestos de no sujeción
        // RL No sujeto por reglas de localización
        Nodo := NodoPadre.AddChild('Causa', DOMString);
        Nodo.Text := Causa;

        Nodo := NodoPadre.AddChild('Importe', DOMString);
        Nodo.Text := FormatAmount(Importe, 2);
     end;
  end;
end;

procedure TTicketBAI.SetFacturaDesgloseOperacion_Entrega_SujetaExenta(CausaExencion: string; BaseImponible: double);
var
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
begin
  HayError := False;

  with Documento do
  begin
     // Verifico que exista Factura
     if not Assigned(Factura) then
        Factura := DameNodo(DocumentElement, ['Factura']);
     if not Assigned(Factura) then
        Factura := DocumentElement.AddChild('Factura', DOMString);

     // Verifico que exista Factura->TipoDesglose
     NodoPadre := DameNodo(Factura, ['TipoDesglose']);
     if not Assigned(NodoPadre) then
        NodoPadre := Factura.AddChild('TipoDesglose', DOMString);

     // Verifico que exista Factura->TipoDesglose->DesgloseTipoOperacion
     NodoPadre := DameNodo(Factura, ['DesgloseTipoOperacion']);
     if not Assigned(NodoPadre) then
        NodoPadre := Factura.AddChild('DesgloseTipoOperacion', DOMString);

     // Verifico que exista Factura->TipoDesglose->DesgloseTipoOperacion
     Nodo := DameNodo(NodoPadre, ['Entrega']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('Entrega', DOMString)
     else
        NodoPadre := Nodo;

     // Verifico que exista Factura->TipoDesglose->DesgloseTipoOperacion->Sujeta
     Nodo := DameNodo(NodoPadre, ['Sujeta']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('Sujeta', DOMString)
     else
        NodoPadre := Nodo;

     // Verifico que exista Factura->TipoDesglose->DesgloseTipoOperacion->Sujeta->Exenta
     Nodo := DameNodo(NodoPadre, ['Exenta']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('Exenta', DOMString)
     else
        NodoPadre := Nodo;

     if Assigned(NodoPadre) then
     begin
        NodoPadre := NodoPadre.AddChild('DetalleExenta', DOMString);

        // L10
        Nodo := NodoPadre.AddChild('CausaExencion', DOMString);
        Nodo.Text := CausaExencion;

        Nodo := NodoPadre.AddChild('BaseImponible', DOMString);
        Nodo.Text := FormatAmount(BaseImponible, 2);
     end;
  end;
end;

procedure TTicketBAI.SetFacturaDesgloseOperacion_Entrega_SujetaNoExenta(TipoNoExenta: string; BaseImponible, TipoImpositivo, CuotaImpuesto, TipoRecargoEquivalencia, CuotaRecargoEquivalencia: double; OperacionEnRecargoDeEquivalencia: string);
var
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
begin
  HayError := False;

  with Documento do
  begin
     // Verifico que exista Factura
     if not Assigned(Factura) then
        Factura := DameNodo(DocumentElement, ['Factura']);
     if not Assigned(Factura) then
        Factura := DocumentElement.AddChild('Factura', DOMString);

     // Verifico que exista Factura->TipoDesglose
     NodoPadre := DameNodo(Factura, ['TipoDesglose']);
     if not Assigned(NodoPadre) then
        NodoPadre := Factura.AddChild('TipoDesglose', DOMString);

     // Verifico que exista Factura->TipoDesglose->DesgloseTipoOperacion
     NodoPadre := DameNodo(Factura, ['DesgloseTipoOperacion']);
     if not Assigned(NodoPadre) then
        NodoPadre := Factura.AddChild('DesgloseTipoOperacion', DOMString);

     // Verifico que exista Factura->TipoDesglose->DesgloseTipoOperacion
     Nodo := DameNodo(NodoPadre, ['Entrega']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('Entrega', DOMString)
     else
        NodoPadre := Nodo;

     // Verifico que exista Factura->TipoDesglose->DesgloseTipoOperacion->Sujeta
     Nodo := DameNodo(NodoPadre, ['Sujeta']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('Sujeta', DOMString)
     else
        NodoPadre := Nodo;

     // Verifico que exista Factura->TipoDesglose->DesgloseTipoOperacion->Sujeta->Exenta
     Nodo := DameNodo(NodoPadre, ['NoExenta']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('NoExenta', DOMString)
     else
        NodoPadre := Nodo;

     if Assigned(NodoPadre) then
     begin
        // Puede haber dos detalles (Con o Sin ISP)
        // Debo averiguar si ya existe la que neceisto para este registro
        Nodo := DameNodo(NodoPadre, ['DetalleNoExenta']);
        if not Assigned(Nodo) then
           NodoPadre := NodoPadre.AddChild('DetalleNoExenta', DOMString)
        else
        begin
           if (Assigned(DameNodo(Nodo, ['TipoNoExenta']))) then
           begin
              if (DameDato(Nodo, ['TipoNoExenta']) = TipoNoExenta) then
                 NodoPadre := Nodo
              else
              begin
                 // El otro nodo solo puede ser del tipo que busco.
                 Nodo := NodoPadre.NextSibling;

                 if not Assigned(Nodo) then
                    NodoPadre := NodoPadre.AddChild('DetalleNoExenta', DOMString);
              end;
           end
           else
              NodoPadre := Nodo;
        end;

        // L11
        // S1 Sin inversión del sujeto pasivo
        // S2 Con inversión del sujeto pasivo
        if (not Assigned(DameNodo(NodoPadre, ['TipoNoExenta']))) then
        begin
           Nodo := NodoPadre.AddChild('TipoNoExenta', DOMString);
           Nodo.Text := TipoNoExenta;
        end;

        Nodo := DameNodo(NodoPadre, ['DesgloseIVA']);
        if not Assigned(Nodo) then
           NodoPadre := NodoPadre.AddChild('DesgloseIVA', DOMString)
        else
           NodoPadre := Nodo;

        NodoPadre := NodoPadre.AddChild('DetalleIVA', DOMString);

        Nodo := NodoPadre.AddChild('BaseImponible', DOMString);
        Nodo.Text := FormatAmount(BaseImponible, 2);

        Nodo := NodoPadre.AddChild('TipoImpositivo', DOMString);
        Nodo.Text := FormatAmount(TipoImpositivo, 2);

        Nodo := NodoPadre.AddChild('CuotaImpuesto', DOMString);
        Nodo.Text := FormatAmount(CuotaImpuesto, 2);

        Nodo := NodoPadre.AddChild('TipoRecargoEquivalencia', DOMString);
        Nodo.Text := FormatAmount(TipoRecargoEquivalencia, 2);

        Nodo := NodoPadre.AddChild('CuotaRecargoEquivalencia', DOMString);
        Nodo.Text := FormatAmount(CuotaRecargoEquivalencia, 2);

        // Operación en recargo de equivalencia o Régimen simplificado.
        // El valor por defecto es "N".
        // Si se marca "S", se trata de una factura expedida por un contribuyente en régimen simplificado o en régimen de recargo de equivalencia.
        if (OperacionEnRecargoDeEquivalencia = 'S') then
        begin
           // L12
           // S o N
           Nodo := NodoPadre.AddChild('OperacionEnRecargoDeEquivalenciaORegimenSimplificado', DOMString);
           Nodo.Text := OperacionEnRecargoDeEquivalencia;
        end;
     end;
  end;
end;

procedure TTicketBAI.SetFacturaDesgloseOperacion_Entrega_NoSujeta(Causa: string; Importe: double);
var
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
begin
  HayError := False;

  with Documento do
  begin
     // Verifico que exista Factura
     if not Assigned(Factura) then
        Factura := DameNodo(DocumentElement, ['Factura']);
     if not Assigned(Factura) then
        Factura := DocumentElement.AddChild('Factura', DOMString);

     // Verifico que exista Factura->TipoDesglose
     NodoPadre := DameNodo(Factura, ['TipoDesglose']);
     if not Assigned(NodoPadre) then
        NodoPadre := Factura.AddChild('TipoDesglose', DOMString);

     // Verifico que exista Factura->TipoDesglose->DesgloseTipoOperacion
     NodoPadre := DameNodo(Factura, ['DesgloseTipoOperacion']);
     if not Assigned(NodoPadre) then
        NodoPadre := Factura.AddChild('DesgloseTipoOperacion', DOMString);

     // Verifico que exista Factura->TipoDesglose->DesgloseFactura
     Nodo := DameNodo(NodoPadre, ['Entrega']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('Entrega', DOMString)
     else
        NodoPadre := Nodo;

     // Verifico que exista Factura->TipoDesglose->DesgloseFactura->NoSujeta
     Nodo := DameNodo(NodoPadre, ['NoSujeta']);
     if not Assigned(Nodo) then
        NodoPadre := NodoPadre.AddChild('NoSujeta', DOMString)
     else
        NodoPadre := Nodo;

     if Assigned(NodoPadre) then
     begin
        NodoPadre := NodoPadre.AddChild('DetalleNoSujeta', DOMString);

        // L13 Causa de no sujeción
        // OT No sujeto por el artículo 7 de la Norma Foral de IVAOtros supuestos de no sujeción
        // RL No sujeto por reglas de localización
        Nodo := NodoPadre.AddChild('Causa', DOMString);
        Nodo.Text := Causa;

        Nodo := NodoPadre.AddChild('Importe', DOMString);
        Nodo.Text := FormatAmount(Importe, 2);
     end;
  end;
end;

procedure TTicketBAI.SetHuellaTBAIEncadenamiento(Serie, Numero: string; FechaExpedicion: TDateTime; FirmaFactura: string);
var
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
begin
  HayError := False;

  with Documento do
  begin
     // Verifico que exista HuellaTBAI
     if not Assigned(HuellaTBAI) then
        HuellaTBAI := DameNodo(DocumentElement, ['HuellaTBAI']);
     if not Assigned(HuellaTBAI) then
        HuellaTBAI := DocumentElement.AddChild('HuellaTBAI', DOMString);

     // Verifico que exista HuellaTBAI->EncadenamientoFacturaAnterior
     Nodo := DameNodo(HuellaTBAI, ['EncadenamientoFacturaAnterior']);
     if not Assigned(Nodo) then
     begin
        NodoPadre := HuellaTBAI.AddChild('EncadenamientoFacturaAnterior', DOMString);

        Nodo := NodoPadre.AddChild('SerieFacturaAnterior', DOMString);
        Nodo.Text := Serie;

        Nodo := NodoPadre.AddChild('NumFacturaAnterior', DOMString);
        Nodo.Text := Numero;

        Nodo := NodoPadre.AddChild('FechaExpedicionFacturaAnterior', DOMString);
        Nodo.Text := FormatDateTime('dd-mm-yyyy', FechaExpedicion);

        // Primeros 100 caracteres de la firma anterior
        Nodo := NodoPadre.AddChild('SignatureValueFirmaFacturaAnterior', DOMString);
        Nodo.Text := Copy(FirmaFactura, 1, 100);
     end
     else
        Error(4);
  end;
end;

procedure TTicketBAI.SetHuellaTBAISoftware(LicenciaTBAI, NIFEntidad, Nombre, VersionSoftware: string; CodigoPais: string = ''; IDType: string = ''; ID: string = '');
var
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
  NodoIDOtro : IXMLNode;
begin
  HayError := False;

  with Documento do
  begin
     // Verifico que exista HuellaTBAI
     if not Assigned(HuellaTBAI) then
        HuellaTBAI := DameNodo(DocumentElement, ['HuellaTBAI']);
     if not Assigned(HuellaTBAI) then
        HuellaTBAI := DocumentElement.AddChild('HuellaTBAI', DOMString);

     // Verifico que exista HuellaTBAI->EncadenamientoFacturaAnterior
     Nodo := DameNodo(HuellaTBAI, ['Software']);
     if not Assigned(Nodo) then
     begin
        NodoPadre := HuellaTBAI.AddChild('Software', DOMString);

        Nodo := NodoPadre.AddChild('LicenciaTBAI', DOMString);
        Nodo.Text := LicenciaTBAI;

        Nodo := NodoPadre.AddChild('EntidadDesarrolladora', DOMString);
        if (NIFEntidad > '') then
        begin
           Nodo := Nodo.AddChild('NIF', DOMString);
           Nodo.Text := NIFEntidad;
        end
        else
        begin
           NodoIDOtro := Nodo.AddChild('IDOtro', DOMString);
           Nodo := NodoIDOtro.AddChild('CodigoPais', DOMString);
           Nodo.Text := CodigoPais;

           // L2
           // 02 NIF-IVA
           // 03 Pasaporte
           // 04 Documento oficial de identificación expedido por el país o territorio de residencia
           // 05 Certificado de residencia06Otro documento probatorio
           Nodo := NodoIDOtro.AddChild('IDType', DOMString);
           Nodo.Text := IDType;

           Nodo := NodoIDOtro.AddChild('ID', DOMString);
           Nodo.Text := ID;
        end;

        Nodo := NodoPadre.AddChild('Nombre', DOMString);
        Nodo.Text := Nombre;

        Nodo := NodoPadre.AddChild('Version', DOMString);
        Nodo.Text := VersionSoftware;
     end
     else
        Error(5);
  end;
end;

procedure TTicketBAI.SetHuellaTBAINumSerie(NumSerieDispositivo: string);
var
  Nodo : IXMLNode;
begin
  HayError := False;

  with Documento do
  begin
     // Verifico que exista HuellaTBAI
     if not Assigned(HuellaTBAI) then
        HuellaTBAI := DameNodo(DocumentElement, ['HuellaTBAI']);
     if not Assigned(HuellaTBAI) then
        HuellaTBAI := DocumentElement.AddChild('HuellaTBAI', DOMString);

     // Verifico que exista HuellaTBAI->NumSerieDispositivo
     Nodo := DameNodo(HuellaTBAI, ['NumSerieDispositivo']);
     if not Assigned(Nodo) then
     begin
        Nodo := HuellaTBAI.AddChild('NumSerieDispositivo', DOMString);
        Nodo.Text := NumSerieDispositivo;
     end
     else
        Error(6);
  end;
end;

procedure TTicketBAI.SetIdFacturaEmisor(NIF, ApellidosNombreRazonSocial: string);
var
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
begin
  HayError := False;

  if (FTipo = 'Baja') then
  begin
     with Documento do
     begin
        // Verifico que exista Sujetos
        if not Assigned(IdFactura) then
           IdFactura := DameNodo(DocumentElement, ['IDFactura']);
        if not Assigned(IdFactura) then
           IdFactura := DocumentElement.AddChild('IDFactura', DOMString);

        // Verifico que exista Sujetos->Emisor
        Nodo := DameNodo(IdFactura, ['Emisor']);
        if not Assigned(Nodo) then
        begin
           NodoPadre := IdFactura.AddChild('Emisor', DOMString);

           Nodo := NodoPadre.AddChild('NIF', DOMString);
           Nodo.Text := NIF;

           Nodo := NodoPadre.AddChild('ApellidosNombreRazonSocial', DOMString);
           Nodo.Text := ApellidosNombreRazonSocial;
        end
        else
           Error(1);
     end;
  end
  else
     Error(999);
end;

procedure TTicketBAI.SetIdFacturaCabecera(Serie, Numero: string; FechaExpedicion: TDateTime);
var
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
begin
  HayError := False;

  if (FTipo = 'Baja') then
  begin
     with Documento do
     begin
        // Verifico que exista Factura
        if not Assigned(IdFactura) then
           IdFactura := DameNodo(DocumentElement, ['IDFactura']);
        if not Assigned(IdFactura) then
           IdFactura := DocumentElement.AddChild('IDFactura', DOMString);

        // Verifico que exista Factura->CabeceraFactura
        Nodo := DameNodo(IdFactura, ['CabeceraFactura']);
        if not Assigned(Nodo) then
        begin
           NodoPadre := IdFactura.AddChild('CabeceraFactura', DOMString);

           Nodo := NodoPadre.AddChild('SerieFactura', DOMString);
           Nodo.Text := Serie;

           Nodo := NodoPadre.AddChild('NumFactura', DOMString);
           Nodo.Text := Numero;

           Nodo := NodoPadre.AddChild('FechaExpedicionFactura', DOMString);
           Nodo.Text := FormatDateTime('dd-mm-yyyy', FechaExpedicion);
        end
        else
           Error(3);
     end;
  end
  else
     Error(999);
end;

end.
