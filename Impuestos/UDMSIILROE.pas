unit UDMSIILROE;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet, XMLDoc, XMLIntf;

type
  TDMSIILROE = class(TDataModule)
     xPresentacion: TFIBTableSet;
     DSPresentacion: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xPresentacionID: TIntegerField;
     xPresentacionEMPRESA: TIntegerField;
     xPresentacionCANAL: TIntegerField;
     xPresentacionMODELO: TFIBStringField;
     xPresentacionCAPITULO: TFIBStringField;
     xPresentacionSUBCAPITULO: TFIBStringField;
     xPresentacionOPERACION: TFIBStringField;
     xPresentacionEJERCICIO: TIntegerField;
     xPresentacionOBLIGADOTRIBUTARIO_NIF: TFIBStringField;
     xPresentacionOBLIGADOTRIBUTARIO_NOMBRE: TFIBStringField;
     xPresentacionESTADO_ENVIO: TFIBStringField;
     xDocumentos: TFIBTableSet;
     DSDocumentos: TDataSource;
     xDisponibles: TFIBTableSet;
     DSDisponibles: TDataSource;
     xPresentacionDESCRIPCION_ESTADO: TFIBStringField;
     xDisponiblesID_I: TIntegerField;
     xDisponiblesTIPO: TFIBStringField;
     xDisponiblesSERIE: TFIBStringField;
     xDisponiblesRIG: TIntegerField;
     xDisponiblesCODIGO_IDENTIFICATIVO: TFIBStringField;
     xDisponiblesCSV: TFIBStringField;
     xDisponiblesFECHA_RECEPCION: TFIBStringField;
     xDocumentosID: TIntegerField;
     xDocumentosESTADO_ENVIO: TFIBStringField;
     xDocumentosDESCRIPCION_ESTADO: TFIBStringField;
     xDocumentosID_I: TIntegerField;
     xDocumentosTIPO: TFIBStringField;
     xDocumentosSERIE: TFIBStringField;
     xDocumentosRIG: TIntegerField;
     xDocumentosCODIGO_IDENTIFICATIVO: TFIBStringField;
     xDocumentosCSV: TFIBStringField;
     xDocumentosFECHA_RECEPCION: TFIBStringField;
     xDocumentosID_S: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure xPresentacionNewRecord(DataSet: TDataSet);
     procedure xPresentacionAfterOpen(DataSet: TDataSet);
     procedure xPresentacionBeforeClose(DataSet: TDataSet);
     procedure xPresentacionBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
     procedure CreaElemento(NodoPadre: IXMLNode; Prefix, TagName, DOMString, AText: WideString);
     function CreaNodo(NodoPadre: IXMLNode; Prefix, TagName, DOMString: WideString): IXMLNode;
     procedure GuardaXML(id: integer; Tipo, xml: string);
     function DameTicketBAI_BASE64(IdDoc: integer): string;
     function DameXML(id: integer; Tipo: string): string;
  public
     { Public declarations }
     procedure Seleccionar(RefrescarDatos: boolean = True);
     procedure Deseleccionar(RefrescarDatos: boolean = True);
     procedure SeleccionarTodo;
     procedure DeseleccionarTodo;
     procedure GenerarPresentacion;
     procedure EnviarPresentacion;
     procedure GuardarFicheroPresentacion;
     procedure GuardarFicheroRespuesta;
  end;

var
  DMSIILROE : TDMSIILROE;

implementation

uses UDMMain, HYFIBQuery, UUtiles, UEntorno, UlkJSON,
  gzip, UFMain, UParam, ComObj, Variants, ZLib, Windows, Dialogs, IdGlobalProtocols, Math;

{$R *.dfm}

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

procedure TDMSIILROE.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  DMMain.Log('DataModuleCreate');
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(xPresentacion, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xDocumentos, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xDisponibles, MascaraN, MascaraI, ShortDateFormat);

  DMMain.Log('FiltraTabla(xPresentacion, ...');
  DMMain.FiltraTabla(xPresentacion, '10100');
end;

procedure TDMSIILROE.Deseleccionar(RefrescarDatos: boolean = True);
begin
  if (xPresentacion.State = dsBrowse) and (xPresentacionESTADO_ENVIO.AsString = '') then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' DELETE FROM SII_LROE_DOCUMENTO ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID = :ID ');
           Params.ByName['ID'].AsInteger := xDocumentosID.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if RefrescarDatos then
     begin
        xDocumentos.Prior;
        if (xDocumentos.BOF) then
           Refrescar(xDocumentos, 'ID', 0, False, True)
        else
           Refrescar(xDocumentos, 'ID', xDocumentosID.AsInteger);

        Refrescar(xDisponibles, 'ID_I', xDisponiblesID_I.AsInteger);
     end;
  end;
end;

procedure TDMSIILROE.Seleccionar(RefrescarDatos: boolean = True);
begin
  if (xPresentacion.State = dsBrowse) and (xPresentacionESTADO_ENVIO.AsString = '') and (xDisponiblesCODIGO_IDENTIFICATIVO.AsString <> '') and (xDisponiblesID_I.AsInteger <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO SII_LROE_DOCUMENTO ( ');
           SQL.Add(' ID, ID_PRESENTACION, ID_DOC, ESTADO_ENVIO) ');
           SQL.Add(' VALUES ( ');
           SQL.Add(' 0, :ID_PRESENTACION, :ID_DOC, '''') ');
           Params.ByName['ID_PRESENTACION'].AsInteger := xPresentacionID.AsInteger;
           Params.ByName['ID_DOC'].AsInteger := xDisponiblesID_I.AsInteger;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if RefrescarDatos then
     begin
        xDisponibles.Prior;
        if (xDisponibles.BOF) then
           Refrescar(xDisponibles, 'ID_I', 0, False, True)
        else
           Refrescar(xDisponibles, 'ID_I', xDisponiblesID_I.AsInteger);

        Refrescar(xDocumentos, 'ID', xDocumentosID.AsInteger);
     end;
  end;
end;

procedure TDMSIILROE.xPresentacionNewRecord(DataSet: TDataSet);
//var
//s : string;
//i : integer;
begin
  xPresentacionEMPRESA.AsInteger := REntorno.Empresa;
  xPresentacionCANAL.AsInteger := REntorno.Canal;
  xPresentacionMODELO.AsString := '240';
  xPresentacionCAPITULO.AsString := '1';
  xPresentacionSUBCAPITULO.AsString := '1.1';
  xPresentacionOPERACION.AsString := 'A00';  // Alta
  xPresentacionEJERCICIO.AsInteger := REntorno.Ejercicio;
  {
  xPresentacionOBLIGADOTRIBUTARIO_NIF.AsString := REntorno.CifEmpresa;

  // Solo se aceptan letras y numeros
  s := '';
  for i := 1 to Length(REntorno.NombreEmpresa) do
  begin
     if REntorno.NombreEmpresa[i] in ['0'..'9', 'A'..'Z', 'a', 'z', ' '] then
        s := s + UpperCase(REntorno.NombreEmpresa[i]);
  end;
  s := Trim(s);
  xPresentacionOBLIGADOTRIBUTARIO_NOMBRE.AsString := Copy(s, 1, 120);
  }
  xPresentacionOBLIGADOTRIBUTARIO_NIF.AsString := LeeDatoIni('TBAI', 'NIF', '');
  xPresentacionOBLIGADOTRIBUTARIO_NOMBRE.AsString := LeeDatoIni('TBAI', 'Nombre', '');
end;

procedure TDMSIILROE.xPresentacionAfterOpen(DataSet: TDataSet);
begin
  xDocumentos.Open;
  xDisponibles.Open;
end;

procedure TDMSIILROE.xPresentacionBeforeClose(DataSet: TDataSet);
begin
  xDocumentos.Close;
  xDisponibles.Close;
end;

procedure TDMSIILROE.SeleccionarTodo;
begin
  if (xPresentacion.State = dsBrowse) then
  begin
     with xDisponibles do
     begin
        First;
        while not EOF do
        begin
           Seleccionar(False);
           Next;
        end;
     end;

     Refrescar(xDisponibles, 'ID_I', 0);
     Refrescar(xDocumentos, 'ID', 0);
  end;
end;

procedure TDMSIILROE.DeseleccionarTodo;
begin
  if (xPresentacion.State = dsBrowse) then
  begin
     with xDocumentos do
     begin
        First;
        while not EOF do
        begin
           Deseleccionar(False);
           Next;
        end;
     end;

     Refrescar(xDisponibles, 'ID_I', 0);
     Refrescar(xDocumentos, 'ID', 0);
  end;
end;

function TDMSIILROE.CreaNodo(NodoPadre: IXMLNode; Prefix, TagName, DOMString: WideString): IXMLNode;
begin
  Result := NodoPadre.AddChild(Prefix + TagName, DOMString);
end;

procedure TDMSIILROE.CreaElemento(NodoPadre: IXMLNode; Prefix, TagName, DOMString, AText: WideString);
// var
//   Nodo : IXMLNode;
begin
  // Nodo := NodoPadre.AddChild(Prefix + TagName);
  // Nodo.Text := AText;

  NodoPadre.AddChild(Prefix + TagName, DOMString).Text := AText;
end;

procedure TDMSIILROE.GenerarPresentacion;
var
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
  //SuministroLRFacturasEmitidas, RegistroLRFacturasEmitidas, IDFactura, FacturaExpedida, DesgloseFactura, TipoDesglose, Sujeta, NoSujeta, Exenta, NoExenta : IXMLNode;
  //DesgloseTipoOperacion, PrestacionServicios, Entrega : IXMLNode;
  Clave1, Clave2, Clave3 : string;
  i : integer;
  JSONString : TStrings;
  JSONDocument : TlkJSONBase;
  //JSONNodoPadre : TlkJSONObject;
  JSONNodo : TlkJSONObject;

  procedure SetDestinatarios(NodoPadre: IXMLNode; NIF, ApellidosNombreRazonSocial, CodigoPais, IDType, ID: string; CodigoPostal: string = ''; Direccion: string = '');
  var
     Nodo : IXMLNode;
  begin
     // Nodo padre para Destinatarios
     NodoPadre := CreaNodo(NodoPadre, '', 'Destinatarios', '');

     if Assigned(NodoPadre) then
     begin
        // Puede haber hasta 100 destinatarios. Solo utilizaremos 1
        NodoPadre := CreaNodo(NodoPadre, '', 'IDDestinatario', '');

        if (NIF > '') then
           CreaElemento(NodoPadre, '', 'NIF', '', NIF)
        else
        begin
           Nodo := CreaNodo(NodoPadre, '', 'IDOtro', '');
           // ISO 3166-1 Alfa(2)
           CreaElemento(Nodo, '', 'CodigoPais', '', CodigoPais);

           // L2
           // 02 NIF-IVA
           // 03 Pasaporte
           // 04 Documento oficial de identificación expedido por el país o territorio de residencia
           // 05 Certificado de residencia
           // 06 Otro documento probatorio
           CreaElemento(Nodo, '', 'IDType', '', IDType);

           // Alfa(20)
           CreaElemento(Nodo, '', 'ID', '', ID);
        end;

        CreaElemento(NodoPadre, '', 'ApellidosNombreRazonSocial', '', ApellidosNombreRazonSocial);

        // Es opcional (Obligatorio en Guipuzcoa), debe ser como numerico
        if (CodigoPostal > '') then
           CreaElemento(NodoPadre, '', 'CodigoPostal', '', CodigoPostal);
     end;
  end;

  procedure SetFacturaCabecera(NodoPadre: IXMLNode; Serie, Numero: string; FechaExpedicion: TDateTime);
  begin
     NodoPadre := CreaNodo(NodoPadre, '', 'CabeceraFactura', '');

     if Assigned(NodoPadre) then
     begin
        // Solo las letras
        CreaElemento(NodoPadre, '', 'SerieFactura', '', Serie);

        // Solo los numeros
        CreaElemento(NodoPadre, '', 'NumFactura', '', Numero);

        // Fecha de expedición de la factura rectificada o sustituida.
        CreaElemento(NodoPadre, '', 'FechaExpedicionFactura', '', FormatDateTime('dd-mm-yyyy', FechaExpedicion));

        // FacturaSimplificada
        // FacturaEmitidaSustitucionSimplificada
        // AsientoResumen
        // NumFacturaFin
        // Factura Rectificativa
        //  - Codigo
        //  - Tipo
        //  - ImporteRectificacionSustitutiva
        //     - BaseRectificada
        //     - CuotaRectificada
        //     - CuotaRecargoRectificada
        // FacturasRectificadasSustituidas
        //  - IDFacturaRectificadaSustituida
        //     - SerieFactura
        //     - NumFactura
        //     - FechaExpedicionFactura
     end;
  end;

  procedure SetFacturaDatos(NodoPadre: IXMLNode; FechaExpedicion, FechaOperacion: TDateTime; Descripcion: string; Importe, Retencion, BaseImponibleACoste: double; Clave1, Clave2, Clave3: string);
  var
     NodoClaves : IXMLNode;
     Nodo : IXMLNode;
  begin
     NodoPadre := CreaNodo(NodoPadre, '', 'DatosFactura', '');

     if Assigned(NodoPadre) then
     begin
        // Fecha en la que se ha realizado la operación siempre que sea diferente a la fecha de expedición.
        if (FormatDateTime('dd-mm-yyyy', FechaOperacion) <> FormatDateTime('dd-mm-yyyy', FechaExpedicion)) then
           CreaElemento(NodoPadre, '', 'FechaOperacion', '', FormatDateTime('dd-mm-yyyy', FechaOperacion));

        CreaElemento(NodoPadre, '', 'DescripcionFactura', '', Copy(Descripcion, 1, 250));

        CreaElemento(NodoPadre, '', 'ImporteTotalFactura', '', FormatAmount(Importe, 2));

        if (Retencion <> 0) then
           CreaElemento(NodoPadre, '', 'RetencionSoportada', '', FormatAmount(Retencion, 2));

        if (BaseImponibleACoste <> 0) then
           CreaElemento(NodoPadre, '', 'BaseImponibleACoste', '', FormatAmount(BaseImponibleACoste, 2));

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
        NodoClaves := CreaNodo(NodoPadre, '', 'Claves', '');
        Nodo := CreaNodo(NodoClaves, '', 'IDClave', '');
        CreaElemento(Nodo, '', 'ClaveRegimenIvaOpTrascendencia', '', Clave1);

        if (Clave2 > '') then
        begin
           Nodo := CreaNodo(NodoClaves, '', 'IDClave', '');
           CreaElemento(Nodo, '', 'ClaveRegimenIvaOpTrascendencia', '', Clave2);
        end;

        if (Clave3 > '') then
        begin
           Nodo := CreaNodo(NodoClaves, '', 'IDClave', '');
           CreaElemento(Nodo, '', 'ClaveRegimenIvaOpTrascendencia', '', Clave3);
        end;
     end;
  end;

  procedure SetFacturaDesgloseFactura_SujetaExenta(NodoPadre: IXMLNode; CausaExencion: string; BaseImponible: double);
  var
     Nodo : IXMLNode;
  begin
     if Assigned(NodoPadre) then
     begin
        with Documento do
        begin
           // Verifico que exista Factura->TipoDesglose
           Nodo := DameNodo(NodoPadre, ['TipoDesglose']);
           if not Assigned(Nodo) then
              NodoPadre := CreaNodo(NodoPadre, '', 'TipoDesglose', '')
           else
              NodoPadre := Nodo;

           // Verifico que exista Factura->TipoDesglose->DesgloseFactura
           Nodo := DameNodo(NodoPadre, ['DesgloseFactura']);
           if not Assigned(Nodo) then
              NodoPadre := CreaNodo(NodoPadre, '', 'DesgloseFactura', '')
           else
              NodoPadre := Nodo;

           // Verifico que exista Factura->TipoDesglose->DesgloseFactura->Sujeta
           Nodo := DameNodo(NodoPadre, ['Sujeta']);
           if not Assigned(Nodo) then
              NodoPadre := CreaNodo(NodoPadre, '', 'Sujeta', '')
           else
              NodoPadre := Nodo;

           NodoPadre := CreaNodo(NodoPadre, '', 'Exenta', '');
           NodoPadre := CreaNodo(NodoPadre, '', 'DetalleExenta', '');

           // L10 - Causa de exención de operaciones sujetas y exentasValoresDescripción
           // E1 Exenta por el artículo 20 de la Norma Foral del IVA
           // E2 Exenta por el artículo 21 de la Norma Foral del IVA
           // E3 Exenta por el artículo 22 de la Norma Foral del IVA
           // E4 Exenta por el artículo 23 y 24 de la Norma Foral del IVA
           // E5 Exenta por el artículo 25 de la Norma Foral del IVA
           // E6 Exenta por otra causa
           CreaElemento(NodoPadre, '', 'CausaExencion', '', CausaExencion);
           CreaElemento(NodoPadre, '', 'BaseImponible', '', FormatAmount(BaseImponible, 2));
        end;
     end;
  end;

  procedure SetFacturaDesgloseFactura_SujetaNoExenta(NodoPadre: IXMLNode; TipoNoExenta: string; BaseImponible, TipoImpositivo, CuotaImpuesto, TipoRecargoEquivalencia, CuotaRecargoEquivalencia: double; OperacionEnRecargoDeEquivalencia: string);
  var
     Nodo : IXMLNode;
  begin
     if Assigned(NodoPadre) then
     begin
        with Documento do
        begin
           // Verifico que exista Factura->TipoDesglose
           Nodo := DameNodo(NodoPadre, ['TipoDesglose']);
           if not Assigned(Nodo) then
              NodoPadre := CreaNodo(NodoPadre, '', 'TipoDesglose', '')
           else
              NodoPadre := Nodo;

           // Verifico que exista Factura->TipoDesglose->DesgloseFactura
           Nodo := DameNodo(NodoPadre, ['DesgloseFactura']);
           if not Assigned(Nodo) then
              NodoPadre := CreaNodo(NodoPadre, '', 'DesgloseFactura', '')
           else
              NodoPadre := Nodo;

           // Verifico que exista Factura->TipoDesglose->DesgloseFactura->NoSujeta
           Nodo := DameNodo(NodoPadre, ['Sujeta']);
           if not Assigned(Nodo) then
              NodoPadre := CreaNodo(NodoPadre, '', 'Sujeta', '')
           else
              NodoPadre := Nodo;

           NodoPadre := CreaNodo(NodoPadre, '', 'NoExenta', '');

           if Assigned(NodoPadre) then
           begin
              // Puede haber dos detalles (Con o Sin ISP)
              // Debo averiguar si ya existe la que neceisto para este registro

              Nodo := DameNodo(NodoPadre, ['DetalleNoExenta']);
              if not Assigned(Nodo) then
                 NodoPadre := CreaNodo(NodoPadre, '', 'DetalleNoExenta', '')
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
                          NodoPadre := CreaNodo(NodoPadre, '', 'DetalleNoExenta', '');
                    end;
                 end
                 else
                    NodoPadre := Nodo;
              end;

              // L11
              // S1 Sin inversión del sujeto pasivo
              // S2 Con inversión del sujeto pasivo
              if (not Assigned(DameNodo(NodoPadre, ['TipoNoExenta']))) then
                 CreaElemento(NodoPadre, '', 'TipoNoExenta', '', TipoNoExenta);

              Nodo := DameNodo(NodoPadre, ['DesgloseIVA']);
              if not Assigned(Nodo) then
                 NodoPadre := CreaNodo(NodoPadre, '', 'DesgloseIVA', '')
              else
                 NodoPadre := Nodo;

              NodoPadre := CreaNodo(NodoPadre, '', 'DetalleIVA', '');

              CreaElemento(NodoPadre, '', 'BaseImponible', '', FormatAmount(BaseImponible, 2));
              CreaElemento(NodoPadre, '', 'TipoImpositivo', '', FormatAmount(TipoImpositivo, 2));
              CreaElemento(NodoPadre, '', 'CuotaImpuesto', '', FormatAmount(CuotaImpuesto, 2));
              CreaElemento(NodoPadre, '', 'TipoRecargoEquivalencia', '', FormatAmount(TipoRecargoEquivalencia, 2));
              CreaElemento(NodoPadre, '', 'CuotaRecargoEquivalencia', '', FormatAmount(CuotaRecargoEquivalencia, 2));

              // Operación en recargo de equivalencia o Régimen simplificado.
              // El valor por defecto es "N".
              // Si se marca "S", se trata de una factura expedida por un contribuyente en régimen simplificado o en régimen de recargo de equivalencia.
              if (OperacionEnRecargoDeEquivalencia = 'S') then
              begin
                 // L12
                 // S o N
                 CreaElemento(NodoPadre, '', 'OperacionEnRecargoDeEquivalenciaORegimenSimplificado', '', OperacionEnRecargoDeEquivalencia);
              end;
           end;
        end;
     end;
  end;

  procedure SetFacturaDesgloseFactura_NoSujeta(NodoPadre: IXMLNode; Causa: string; Importe: double);
  var
     Nodo : IXMLNode;
  begin
     if Assigned(NodoPadre) then
     begin
        with Documento do
        begin
           // Verifico que exista Factura->TipoDesglose
           Nodo := DameNodo(NodoPadre, ['TipoDesglose']);
           if not Assigned(Nodo) then
              NodoPadre := CreaNodo(NodoPadre, '', 'TipoDesglose', '')
           else
              NodoPadre := Nodo;

           // Verifico que exista Factura->TipoDesglose->DesgloseFactura
           Nodo := DameNodo(NodoPadre, ['DesgloseFactura']);
           if not Assigned(Nodo) then
              NodoPadre := CreaNodo(NodoPadre, '', 'DesgloseFactura', '')
           else
              NodoPadre := Nodo;

           // Verifico que exista Factura->TipoDesglose->DesgloseFactura->NoSujeta
           Nodo := DameNodo(NodoPadre, ['NoSujeta']);
           if not Assigned(Nodo) then
              NodoPadre := CreaNodo(NodoPadre, '', 'NoSujeta', '')
           else
              NodoPadre := Nodo;

           if Assigned(NodoPadre) then
           begin
              NodoPadre := CreaNodo(NodoPadre, '', 'DetalleNoSujeta', '');

              // L13 Causa de no sujeción
              // OT No sujeto por el artículo 7 de la Norma Foral de IVAOtros supuestos de no sujeción
              // RL No sujeto por reglas de localización
              CreaElemento(NodoPadre, '', 'Causa', '', Causa);
              CreaElemento(NodoPadre, '', 'Importe', '', FormatAmount(Importe, 2));
           end;
        end;
     end;
  end;

  procedure SetFacturaDesgloseOperacion_Entrega_SujetaExenta(NodoPadre: IXMLNode; CausaExencion: string; BaseImponible: double);
  var
     Nodo : IXMLNode;
  begin
     with Documento do
     begin
        // Verifico que exista Factura->TipoDesglose
        Nodo := DameNodo(NodoPadre, ['TipoDesglose']);
        if not Assigned(Nodo) then
           NodoPadre := CreaNodo(NodoPadre, '', 'TipoDesglose', '')
        else
           NodoPadre := Nodo;

        // Verifico que exista Factura->TipoDesglose->DesgloseTipoOperacion
        Nodo := DameNodo(NodoPadre, ['DesgloseTipoOperacion']);
        if not Assigned(Nodo) then
           NodoPadre := CreaNodo(NodoPadre, '', 'DesgloseTipoOperacion', '')
        else
           NodoPadre := Nodo;

        // Verifico que exista Factura->TipoDesglose->DesgloseTipoOperacion->Entrega
        Nodo := DameNodo(NodoPadre, ['Entrega']);
        if not Assigned(Nodo) then
           NodoPadre := CreaNodo(NodoPadre, '', 'Entrega', '')
        else
           NodoPadre := Nodo;

        // Verifico que exista Factura->TipoDesglose->DesgloseTipoOperacion->Entrega->Sujeta
        Nodo := DameNodo(NodoPadre, ['Sujeta']);
        if not Assigned(Nodo) then
           NodoPadre := CreaNodo(NodoPadre, '', 'Sujeta', '')
        else
           NodoPadre := Nodo;

        // Verifico que exista Factura->TipoDesglose->DesgloseTipoOperacion->Entrega->Sujeta->Exenta
        Nodo := DameNodo(NodoPadre, ['Exenta']);
        if not Assigned(Nodo) then
           NodoPadre := CreaNodo(NodoPadre, '', 'Exenta', '')
        else
           NodoPadre := Nodo;

        NodoPadre := CreaNodo(NodoPadre, '', 'DetalleExenta', '');

        // L10 - Causa de exención de operaciones sujetas y exentasValoresDescripción
        // E1 Exenta por el artículo 20 de la Norma Foral del IVA
        // E2 Exenta por el artículo 21 de la Norma Foral del IVA
        // E3 Exenta por el artículo 22 de la Norma Foral del IVA
        // E4 Exenta por el artículo 23 y 24 de la Norma Foral del IVA
        // E5 Exenta por el artículo 25 de la Norma Foral del IVA
        // E6 Exenta por otra causa
        CreaElemento(NodoPadre, '', 'CausaExencion', '', CausaExencion);
        CreaElemento(NodoPadre, '', 'BaseImponible', '', FormatAmount(BaseImponible, 2));
     end;
  end;

  procedure SetFacturaDesgloseOperacion_Entrega_SujetaNoExenta(NodoPadre: IXMLNode; TipoNoExenta: string; BaseImponible, TipoImpositivo, CuotaImpuesto, TipoRecargoEquivalencia, CuotaRecargoEquivalencia: double; OperacionEnRecargoDeEquivalencia: string);
  var
     Nodo : IXMLNode;
  begin
     with Documento do
     begin
        // Verifico que exista Factura->TipoDesglose
        Nodo := DameNodo(NodoPadre, ['TipoDesglose']);
        if not Assigned(Nodo) then
           NodoPadre := CreaNodo(NodoPadre, '', 'TipoDesglose', '')
        else
           NodoPadre := Nodo;

        // Verifico que exista Factura->TipoDesglose->DesgloseTipoOperacion
        Nodo := DameNodo(NodoPadre, ['DesgloseTipoOperacion']);
        if not Assigned(Nodo) then
           NodoPadre := CreaNodo(NodoPadre, '', 'DesgloseTipoOperacion', '')
        else
           NodoPadre := Nodo;

        // Verifico que exista Factura->TipoDesglose->DesgloseTipoOperacion->Entrega
        Nodo := DameNodo(NodoPadre, ['Entrega']);
        if not Assigned(Nodo) then
           NodoPadre := CreaNodo(NodoPadre, '', 'Entrega', '')
        else
           NodoPadre := Nodo;

        // Verifico que exista Factura->TipoDesglose->DesgloseTipoOperacion->Entrega->Sujeta
        Nodo := DameNodo(NodoPadre, ['Sujeta']);
        if not Assigned(Nodo) then
           NodoPadre := CreaNodo(NodoPadre, '', 'Sujeta', '')
        else
           NodoPadre := Nodo;

        // Verifico que exista Factura->TipoDesglose->DesgloseTipoOperacion->Entrega->Sujeta->NoExenta
        Nodo := DameNodo(NodoPadre, ['NoExenta']);
        if not Assigned(Nodo) then
           NodoPadre := CreaNodo(NodoPadre, '', 'NoExenta', '')
        else
           NodoPadre := Nodo;

        if Assigned(NodoPadre) then
        begin
           // Puede haber dos detalles (Con o Sin ISP)
           // Debo averiguar si ya existe la que neceisto para este registro
           Nodo := DameNodo(NodoPadre, ['DetalleNoExenta']);
           if not Assigned(Nodo) then
              NodoPadre := CreaNodo(NodoPadre, '', 'DetalleNoExenta', '')
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
                       NodoPadre := CreaNodo(NodoPadre, '', 'DetalleNoExenta', '');
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
              CreaElemento(NodoPadre, '', 'TipoNoExenta', '', TipoNoExenta);
           end;

           Nodo := DameNodo(NodoPadre, ['DesgloseIVA']);
           if not Assigned(Nodo) then
              NodoPadre := CreaNodo(NodoPadre, '', 'DesgloseIVA', '')
           else
              NodoPadre := Nodo;

           NodoPadre := CreaNodo(NodoPadre, '', 'DetalleIVA', '');

           CreaElemento(NodoPadre, '', 'BaseImponible', '', FormatAmount(BaseImponible, 2));
           CreaElemento(NodoPadre, '', 'TipoImpositivo', '', FormatAmount(TipoImpositivo, 2));
           CreaElemento(NodoPadre, '', 'CuotaImpuesto', '', FormatAmount(CuotaImpuesto, 2));
           CreaElemento(NodoPadre, '', 'TipoRecargoEquivalencia', '', FormatAmount(TipoRecargoEquivalencia, 2));
           CreaElemento(NodoPadre, '', 'CuotaRecargoEquivalencia', '', FormatAmount(CuotaRecargoEquivalencia, 2));

           // Operación en recargo de equivalencia o Régimen simplificado.
           // El valor por defecto es "N".
           // Si se marca "S", se trata de una factura expedida por un contribuyente en régimen simplificado o en régimen de recargo de equivalencia.
           if (OperacionEnRecargoDeEquivalencia = 'S') then
           begin
              // L12
              // S o N
              CreaElemento(NodoPadre, '', 'OperacionEnRecargoDeEquivalenciaORegimenSimplificado', '', OperacionEnRecargoDeEquivalencia);
           end;
        end;
     end;
  end;

  procedure SetFacturaDesgloseOperacion_Entrega_NoSujeta(NodoPadre: IXMLNode; Causa: string; Importe: double);
  var
     Nodo : IXMLNode;
  begin
     with Documento do
     begin
        // Verifico que exista Factura->TipoDesglose
        Nodo := DameNodo(NodoPadre, ['TipoDesglose']);
        if not Assigned(Nodo) then
           NodoPadre := CreaNodo(NodoPadre, '', 'TipoDesglose', '')
        else
           NodoPadre := Nodo;

        // Verifico que exista Factura->TipoDesglose->DesgloseTipoOperacion
        Nodo := DameNodo(NodoPadre, ['DesgloseTipoOperacion']);
        if not Assigned(Nodo) then
           NodoPadre := CreaNodo(NodoPadre, '', 'DesgloseTipoOperacion', '')
        else
           NodoPadre := Nodo;

        // Verifico que exista Factura->TipoDesglose->DesgloseTipoOperacion->Entrega
        Nodo := DameNodo(NodoPadre, ['Entrega']);
        if not Assigned(Nodo) then
           NodoPadre := CreaNodo(NodoPadre, '', 'Entrega', '')
        else
           NodoPadre := Nodo;

        // Verifico que exista Factura->TipoDesglose->DesgloseTipoOperacion->Entrega->NoSujeta
        Nodo := DameNodo(NodoPadre, ['NoSujeta']);
        if not Assigned(Nodo) then
           NodoPadre := CreaNodo(NodoPadre, '', 'NoSujeta', '')
        else
           NodoPadre := Nodo;

        if Assigned(NodoPadre) then
        begin
           NodoPadre := CreaNodo(NodoPadre, '', 'DetalleNoSujeta', '');

           // L13 Causa de no sujeción
           // OT No sujeto por el artículo 7 de la Norma Foral de IVAOtros supuestos de no sujeción
           // RL No sujeto por reglas de localización
           CreaElemento(NodoPadre, '', 'Causa', '', Causa);
           CreaElemento(NodoPadre, '', 'Importe', '', FormatAmount(Importe, 2));
        end;
     end;
  end;

  procedure SetFacturaOtraInformacionTrascendenciaTributaria(NodoPadre: IXMLNode; NIFRepresentante: string);
  var
     Nodo : IXMLNode;
  begin
     with Documento do
     begin
        // Verifico que exista Factura->OtraInformacionTrascendenciaTributaria
        Nodo := DameNodo(NodoPadre, ['OtraInformacionTrascendenciaTributaria']);
        if not Assigned(Nodo) then
           NodoPadre := CreaNodo(NodoPadre, '', 'OtraInformacionTrascendenciaTributaria', '')
        else
           NodoPadre := Nodo;

        if Assigned(NodoPadre) then
        begin
           CreaElemento(NodoPadre, '', 'NIFRepresentanteDeclarado', '', NIFRepresentante);
        end;
     end;
  end;

begin
  // XML
  Documento := TXMLDocument.Create(Self);
  try
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

        if (xPresentacionMODELO.AsString = '240') and (xPresentacionCAPITULO.AsString = '1') and (xPresentacionSUBCAPITULO.AsString = '1.1') and (xPresentacionOPERACION.AsString = 'A00') then
        begin
           with xDocumentos do
           begin
              First;
              while not EOF do
              begin
                 if (Trim(xDocumentosCODIGO_IDENTIFICATIVO.AsString) = '') then
                    raise Exception.Create(_('Se han seleccionado documentos sin Ticket BAI generado'));

                 Next;
              end;
           end;

           DocumentElement := CreateElement('lrpjfecsgap:' + 'LROEPJ240FacturasEmitidasConSGAltaPeticion', '');
           DocumentElement.DeclareNamespace('lrpjfecsgap', 'https://www.batuz.eus/fitxategiak/batuz/LROE/esquemas/LROE_PJ_240_1_1_FacturasEmitidas_ConSG_AltaPeticion_V1_0_2.xsd');

           NodoPadre := CreaNodo(DocumentElement, '', 'Cabecera', '');
           CreaElemento(NodoPadre, '', 'Modelo', '', xPresentacionMODELO.AsString);
           CreaElemento(NodoPadre, '', 'Capitulo', '', xPresentacionCAPITULO.AsString);
           CreaElemento(NodoPadre, '', 'Subcapitulo', '', xPresentacionSUBCAPITULO.AsString);
           CreaElemento(NodoPadre, '', 'Operacion', '', xPresentacionOPERACION.AsString);
           CreaElemento(NodoPadre, '', 'Version', '', '1.0');
           CreaElemento(NodoPadre, '', 'Ejercicio', '', xPresentacionEJERCICIO.AsString);

           NodoPadre := CreaNodo(NodoPadre, '', 'ObligadoTributario', '');
           CreaElemento(NodoPadre, '', 'NIF', '', LeeDatoIni('TBAI', 'NIF', '') {xPresentacionOBLIGADOTRIBUTARIO_NIF.AsString});
           CreaElemento(NodoPadre, '', 'ApellidosNombreRazonSocial', '', LeeDatoIni('TBAI', 'Nombre', '') {xPresentacionOBLIGADOTRIBUTARIO_NOMBRE.AsString});

           NodoPadre := CreaNodo(DocumentElement, '', 'FacturasEmitidas', '');

           with xDocumentos do
           begin
              First;
              while not EOF do
              begin
                 Nodo := CreaNodo(NodoPadre, '', 'FacturaEmitida', '');

                 CreaElemento(Nodo, '', 'TicketBai', '', DameTicketBAI_BASE64(xDocumentosID_S.AsInteger));

                 Next;
              end;
           end;
        end
        else
        if (xPresentacionMODELO.AsString = '240') and (xPresentacionCAPITULO.AsString = '1') and (xPresentacionSUBCAPITULO.AsString = '1.2') and (xPresentacionOPERACION.AsString = 'A00') then
        begin
           DocumentElement := CreateElement('lrpjfessgamp:' + 'LROEPJ240FacturasEmitidasSinSGAltaModifPeticion', '');
           DocumentElement.DeclareNamespace('lrpjfessgamp', 'https://www.batuz.eus/fitxategiak/batuz/LROE/esquemas/LROE_PJ_240_1_2_FacturasEmitidas_SinSG_AltaModifPeticion_V1_0_1.xsd');

           NodoPadre := CreaNodo(DocumentElement, '', 'Cabecera', '');
           CreaElemento(NodoPadre, '', 'Modelo', '', xPresentacionMODELO.AsString);
           CreaElemento(NodoPadre, '', 'Capitulo', '', xPresentacionCAPITULO.AsString);
           CreaElemento(NodoPadre, '', 'Subcapitulo', '', xPresentacionSUBCAPITULO.AsString);
           CreaElemento(NodoPadre, '', 'Operacion', '', xPresentacionOPERACION.AsString);
           CreaElemento(NodoPadre, '', 'Version', '', '1.0');
           CreaElemento(NodoPadre, '', 'Ejercicio', '', xPresentacionEJERCICIO.AsString);

           NodoPadre := CreaNodo(NodoPadre, '', 'ObligadoTributario', '');
           CreaElemento(NodoPadre, '', 'NIF', '', LeeDatoIni('TBAI', 'NIF', '') {xPresentacionOBLIGADOTRIBUTARIO_NIF.AsString});
           CreaElemento(NodoPadre, '', 'ApellidosNombreRazonSocial', '', LeeDatoIni('TBAI', 'Nombre', '') {xPresentacionOBLIGADOTRIBUTARIO_NOMBRE.AsString});

           NodoPadre := CreaNodo(DocumentElement, '', 'FacturasEmitidas', '');

           with xDocumentos do
           begin
              First;
              while not EOF do
              begin
                 Nodo := CreaNodo(NodoPadre, '', 'FacturaEmitida', '');

                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' SELECT C.SERIE, C.RIG, I.NIF, I.NOMBRE, PP.PAIS_C2, I.C_POSTAL, I.DIRECCION, F.FECHA_CON, C.LIQUIDO, F.I_RETENCION ');
                       SQL.Add(' FROM SII_LROE_DOCUMENTO L ');
                       SQL.Add(' JOIN EMP_REGISTRO_IVA I ON L.ID_DOC = I.ID_I ');
                       SQL.Add(' JOIN SYS_PAISES PP ON I.PAIS = PP.PAIS ');
                       SQL.Add(' LEFT JOIN GES_CABECERAS_S C ON I.EMPRESA = C.EMPRESA AND I.EJERCICIO = C.EJERCICIO AND I.CANAL = C.CANAL AND I.DOC_SERIE = C.SERIE AND I.DOC_TIPO = C.TIPO AND I.DOC_NUMERO = C.RIG ');
                       SQL.Add(' LEFT JOIN GES_CABECERAS_S_FAC F ON C.ID_S = F.ID_S ');
                       SQL.Add(' LEFT JOIN GES_CABECERAS_S_FAC_TBAI T ON T.ID_S = F.ID_S AND T.TIPO = F.TIPO ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' L.ID = :ID ');
                       Params.ByName['ID'].AsInteger := xDocumentosID.AsInteger;
                       ExecQuery;

                       SetDestinatarios(Nodo, FieldByName['NIF'].AsString, FieldByName['NOMBRE'].AsString, FieldByName['PAIS_C2'].AsString, '' {IDType}, '' {ID}, FieldByName['C_POSTAL'].AsString, FieldByName['DIRECCION'].AsString);

                       // Identificador que especifica si la factura tiene varios destinatarios o varias destinatarias. Si no se informa este campo se entenderá que tiene valor «N»
                       // VariosDestinatarios

                       // Identificador que especifica si la factura ha sido emitida por un tercero o una tercera o por el destinatario o la destinataria. Si no se informa este campo se entenderá que tiene valor «N»
                       // EmitidaPorTercerosODestinatario

                       SetFacturaCabecera(Nodo, FieldByName['SERIE'].AsString, FieldByName['RIG'].AsString, FieldByName['FECHA_CON'].AsDateTime);

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
                       Clave1 := '01';
                       Clave2 := '';
                       Clave3 := '';
                       SetFacturaDatos(Nodo, FieldByName['FECHA_CON'].AsDateTime, FieldByName['FECHA_CON'].AsDateTime, _('Venta'), FieldByName['LIQUIDO'].AsFloat, FieldByName['I_RETENCION'].AsFloat, 0{BaseImponibleACoste}, Clave1, Clave2, Clave3);

                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 // Abro registro de IVA
                 with TFIBDataSet.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       Transaction := DameTransactionRO(DMMain.DataBase);
                       try
                          if (not Transaction.InTransaction) then
                             Transaction.StartTransaction;
                          SelectSQL.Add(' SELECT D.DEDUCIBLE, M.IVA, M.TIPO_TRANSACCION, M.RECARGO, T.REGIMEN, D.B_IMPONIBLE, D.P_IVA, D.P_REC, D.I_IVA, D.I_REC, D.INVERSION_SUJETO_PASIVO ');
                          SelectSQL.Add(' FROM EMP_REGISTRO_IVA C ');
                          SelectSQL.Add(' JOIN EMP_REGISTRO_IVA_DETALLE D ON C.ID_I = D.ID_I ');
                          SelectSQL.Add(' JOIN SYS_MODO_IVA M ON C.MODO = M.MODO ');
                          SelectSQL.Add(' JOIN SYS_TIPO_IVA T ON D.TIPO_IVA = T.TIPO ');
                          SelectSQL.Add(' WHERE ');
                          SelectSQL.Add(' C.ID_I = :ID_I AND ');
                          SelectSQL.Add(' T.PAIS = :PAIS ');
                          SelectSQL.Add(' ORDER BY D.P_IVA ');
                          Params.ByName['ID_I'].AsInteger := xDocumentosID_I.AsInteger;
                          Params.ByName['PAIS'].AsString := REntorno.Pais;
                          Open;
                          while not EOF do
                          begin
                             // Desglose a nivel de factura
                             // Desglose de factura: Cuando la contraparte es un "nacional"
                             {
                             SetFacturaDesgloseFactura_SujetaExenta(CausaExencion: string; BaseImponible: double);
                             SetFacturaDesgloseFactura_SujetaNoExenta(TipoNoExenta: string; BaseImponible, TipoImpositivo, CuotaImpuesto, TipoRecargoEquivalencia, CuotaRecargoEquivalencia: double; OperacionEnRecargoDeEquivalencia: string);
                             SetFacturaDesgloseFactura_NoSujeta(Causa: string; Imponible: double);
                             }
                             if (FieldByName('TIPO_TRANSACCION').AsInteger = 0) then
                             begin
                                // Nacionales
                                if (FieldByName('IVA').AsInteger = 0) then
                                   // L13 Causa de no sujeción
                                   // OT No sujeto por el artículo 7 de la Norma Foral de IVAOtros supuestos de no sujeción
                                   // RL No sujeto por reglas de localización
                                   SetFacturaDesgloseFactura_NoSujeta(Nodo, 'OT', FieldByName('B_IMPONIBLE').AsFloat)
                                else
                                if (FieldByName('P_IVA').AsFloat = 0) then
                                   // L10 - Causa de exención de operaciones sujetas y exentasValoresDescripción
                                   // E1 Exenta por el artículo 20 de la Norma Foral del IVA
                                   // E2 Exenta por el artículo 21 de la Norma Foral del IVA
                                   // E3 Exenta por el artículo 22 de la Norma Foral del IVA
                                   // E4 Exenta por el artículo 23 y 24 de la Norma Foral del IVA
                                   // E5 Exenta por el artículo 25 de la Norma Foral del IVA
                                   // E6 Exenta por otra causa
                                   SetFacturaDesgloseFactura_SujetaExenta(Nodo, 'E1', FieldByName('B_IMPONIBLE').AsFloat)
                                else
                                // L11
                                // S1 Sin inversión del sujeto pasivo
                                // S2 Con inversión del sujeto pasivo
                                if (FieldByName('INVERSION_SUJETO_PASIVO').AsInteger = 0) then
                                begin
                                   if (FieldByName('RECARGO').AsInteger = 0) then
                                      SetFacturaDesgloseFactura_SujetaNoExenta(Nodo, 'S1', FieldByName('B_IMPONIBLE').AsFloat, FieldByName('P_IVA').AsFloat, FieldByName('I_IVA').AsFloat, FieldByName('P_REC').AsFloat, FieldByName('I_REC').AsFloat, 'N')
                                   else
                                      SetFacturaDesgloseFactura_SujetaNoExenta(Nodo, 'S1', FieldByName('B_IMPONIBLE').AsFloat, FieldByName('P_IVA').AsFloat, FieldByName('I_IVA').AsFloat, FieldByName('P_REC').AsFloat, FieldByName('I_REC').AsFloat, 'S');
                                end
                                else
                                begin
                                   if (FieldByName('RECARGO').AsInteger = 0) then
                                      SetFacturaDesgloseFactura_SujetaNoExenta(Nodo, 'S1', FieldByName('B_IMPONIBLE').AsFloat, FieldByName('P_IVA').AsFloat, FieldByName('I_IVA').AsFloat, FieldByName('P_REC').AsFloat, FieldByName('I_REC').AsFloat, 'N')
                                   else
                                      SetFacturaDesgloseFactura_SujetaNoExenta(Nodo, 'S2', FieldByName('B_IMPONIBLE').AsFloat, FieldByName('P_IVA').AsFloat, FieldByName('I_IVA').AsFloat, FieldByName('P_REC').AsFloat, FieldByName('I_REC').AsFloat, 'S');
                                end;
                             end;

                             // Desglose de Tipo de Operación
                             // Entrega de bienes / Prestación de servicio: Cuando contraparte es no nacional.

                             { TODO : Averiguar como decidir si es entrega de bienes o prestacion de servicios }

                             {
                             SetFacturaDesgloseOperacion_Entrega_SujetaExenta(CausaExencion: string; BaseImponible: double);
                             SetFacturaDesgloseOperacion_Entrega_SujetaNoExenta(TipoNoExenta: string; BaseImponible, TipoImpositivo, CuotaImpuesto, TipoRecargoEquivalencia, CuotaRecargoEquivalencia: double; OperacionEnRecargoDeEquivalencia: string);
                             SetFacturaDesgloseOperacion_Entrega_NoSujeta(Causa: string; Imponible: double);

                             SetFacturaDesgloseOperacion_PrestacionServicios_SujetaExenta(CausaExencion: string; BaseImponible: double);
                             SetFacturaDesgloseOperacion_PrestacionServicios_SujetaNoExenta(TipoNoExenta: string; BaseImponible, TipoImpositivo, CuotaImpuesto, TipoRecargoEquivalencia, CuotaRecargoEquivalencia: double; OperacionEnRecargoDeEquivalencia: string);
                             SetFacturaDesgloseOperacion_PrestacionServicios_NoSujeta(Causa: string; Imponible: double);
                             }
                             if (FieldByName('TIPO_TRANSACCION').AsInteger <> 0) then
                             begin
                                if (FieldByName('DEDUCIBLE').AsInteger = 0) then
                                   // L13 Causa de no sujeción
                                   // OT No sujeto por el artículo 7 de la Norma Foral de IVAOtros supuestos de no sujeción
                                   // RL No sujeto por reglas de localización
                                   SetFacturaDesgloseOperacion_Entrega_NoSujeta(Nodo, 'OT', FieldByName('B_IMPONIBLE').AsFloat)
                                else
                                if (FieldByName('P_IVA').AsFloat = 0) then
                                   // L10 - Causa de exención de operaciones sujetas y exentasValoresDescripción
                                   // E1 Exenta por el artículo 20 de la Norma Foral del IVA
                                   // E2 Exenta por el artículo 21 de la Norma Foral del IVA
                                   // E3 Exenta por el artículo 22 de la Norma Foral del IVA
                                   // E4 Exenta por el artículo 23 y 24 de la Norma Foral del IVA
                                   // E5 Exenta por el artículo 25 de la Norma Foral del IVA
                                   // E6 Exenta por otra causa
                                   SetFacturaDesgloseOperacion_Entrega_SujetaExenta(Nodo, 'E1', FieldByName('B_IMPONIBLE').AsFloat)
                                else
                                // L11
                                // S1 Sin inversión del sujeto pasivo
                                // S2 Con inversión del sujeto pasivo
                                if (FieldByName('INVERSION_SUJETO_PASIVO').AsInteger = 0) then
                                begin
                                   if (FieldByName('RECARGO').AsInteger = 0) then
                                      SetFacturaDesgloseOperacion_Entrega_SujetaNoExenta(Nodo, 'S1', FieldByName('B_IMPONIBLE').AsFloat, FieldByName('P_IVA').AsFloat, FieldByName('I_IVA').AsFloat, FieldByName('P_REC').AsFloat, FieldByName('I_REC').AsFloat, 'N')
                                   else
                                      SetFacturaDesgloseOperacion_Entrega_SujetaNoExenta(Nodo, 'S1', FieldByName('B_IMPONIBLE').AsFloat, FieldByName('P_IVA').AsFloat, FieldByName('I_IVA').AsFloat, FieldByName('P_REC').AsFloat, FieldByName('I_REC').AsFloat, 'S');
                                end
                                else
                                begin
                                   if (FieldByName('RECARGO').AsInteger = 0) then
                                      SetFacturaDesgloseOperacion_Entrega_SujetaNoExenta(Nodo, 'S1', FieldByName('B_IMPONIBLE').AsFloat, FieldByName('P_IVA').AsFloat, FieldByName('I_IVA').AsFloat, FieldByName('P_REC').AsFloat, FieldByName('I_REC').AsFloat, 'N')
                                   else
                                      SetFacturaDesgloseOperacion_Entrega_SujetaNoExenta(Nodo, 'S2', FieldByName('B_IMPONIBLE').AsFloat, FieldByName('P_IVA').AsFloat, FieldByName('I_IVA').AsFloat, FieldByName('P_REC').AsFloat, FieldByName('I_REC').AsFloat, 'S');
                                end;
                             end;

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

                 Next;
              end;
           end;

           // Doy formato al fichero y lo grabo a disco
           XML.Text := FormatXMLData(XML.Text);
        end;

        // Guardo presentacion
        GuardaXML(xPresentacionID.AsInteger, 'PRE', XML.Text);
        {$IFDEF Debug}
        XML.SaveTofile(DameTempPath + format('Presentacion_%d.xml', [xPresentacionID.AsInteger]));
        {$ENDIF}

        Active := False;

        // Borro los datos
        XML.Text := '';
     end;
  finally
     Documento.Free;
  end;

  // JSON
  JSONDocument := TlkJSONObject.Create;
  JSONString := TStringList.Create;
  try
     if Assigned(JSONDocument) then
     begin
        with TlkJSONObject(JSONDocument) do
        begin
           Add('con', 'LROE');
           if (xPresentacionSUBCAPITULO.AsString <> '') then
              Add('apa', xPresentacionSUBCAPITULO.AsString)
           else
              Add('apa', xPresentacionCAPITULO.AsString);

           JSONNodo := TlkJSONObject.Create;
           JSONNodo.Add('nif', LeeDatoIni('TBAI', 'NIF', '') {xPresentacionOBLIGADOTRIBUTARIO_NIF.AsString});
           JSONNodo.Add('nrs', LeeDatoIni('TBAI', 'Nombre', '') {xPresentacionOBLIGADOTRIBUTARIO_NOMBRE.AsString});
           JSONNodo.Add('ap1', '');
           JSONNodo.Add('ap2', '');
           Add('inte', JSONNodo);

           JSONNodo := TlkJSONObject.Create;
           JSONNodo.Add('mode', xPresentacionMODELO.AsString);
           JSONNodo.Add('ejer', xPresentacionEJERCICIO.AsString);
           Add('drs', JSONNodo);
        end;

        i := 0;
        JSONString.Text := GenerateReadableText(JSONDocument, i);
        {$IFDEF Debug}
        JSONString.SaveTofile(DameTempPath + format('Presentacion_%d.json', [xPresentacionID.AsInteger]));
        {$ENDIF}
        GuardaXML(xPresentacionID.AsInteger, 'JSO', JSONString.Text);
     end;
  finally
     JSONDocument.Free;
     JSONString.Free;
  end;
end;

procedure TDMSIILROE.GuardaXML(id: integer; Tipo, xml: string);
var
  DS : TFIBDataSet;
  StreamDestino, StreamOrigen : TStream;
begin
  // Primero elimino el contenido que hubiera.
  // A veces queda basura y se mezcla con lo siguiente.
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE SII_LROE_PRESENTACION ');
        SQL.Add(' SET ');
        if (Tipo = 'PRE') then
           SQL.Add(' XML_PRESENTADO = NULL ');
        if (Tipo = 'RES') then
           SQL.Add(' XML_RESPUESTA = NULL ');
        if (Tipo = 'JSO') then
           SQL.Add(' JSON_PRESENTADO = NULL ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID = :ID ');
        Params.ByName['ID'].AsInteger := id;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRW(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;

           SelectSQL.Add(' SELECT * FROM SII_LROE_PRESENTACION WHERE ID = :ID ');

           UpdateSQL.Add(' UPDATE SII_LROE_PRESENTACION ');
           UpdateSQL.Add(' SET ');
           if (Tipo = 'PRE') then
              UpdateSQL.Add(' XML_PRESENTADO = :XML_PRESENTADO ');
           if (Tipo = 'RES') then
              UpdateSQL.Add(' XML_RESPUESTA = :XML_RESPUESTA ');
           if (Tipo = 'JSO') then
              UpdateSQL.Add(' JSON_PRESENTADO = :JSON_PRESENTADO ');
           UpdateSQL.Add(' WHERE ');
           UpdateSQL.Add(' ID = :ID ');

           // Abro Dataset
           Params.ByName['ID'].AsInteger := id;
           Open;

           // Se pone en modo Edicion
           Edit;

           StreamDestino := nil;
           if (Tipo = 'PRE') then
              StreamDestino := CreateBlobStream(FieldByName('XML_PRESENTADO'), bmRead);
           if (Tipo = 'RES') then
              StreamDestino := CreateBlobStream(FieldByName('XML_RESPUESTA'), bmRead);
           if (Tipo = 'JSO') then
              StreamDestino := CreateBlobStream(FieldByName('JSON_PRESENTADO'), bmRead);

           try
              try
                 if Assigned(StreamDestino) then
                 begin
                    StreamOrigen := TStringStream.Create(xml);
                    try
                       StreamDestino.CopyFrom(StreamOrigen, StreamOrigen.Size);
                    finally
                       StreamOrigen.Free;
                    end;
                 end;
              finally
                 StreamDestino.Free;
              end;

              // Si no se pudo copiar el fichero al repositorio de adjuntos devuelvo un error
           except
              DS.Cancel;
           end;

           Post;

           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     end;
  finally
     FreeAndNil(DS);
  end;
end;

function TDMSIILROE.DameTicketBAI_BASE64(IdDoc: integer): string;
var
  DS : TFIBDataSet;
  //StreamDestino : TStream
  StreamOrigen, AMemoryStream : TStream;
begin
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRW(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;

           SelectSQL.Add(' SELECT XML FROM GES_CABECERAS_S_FAC_TBAI WHERE ID_S = :ID_S ');

           // Abro Dataset
           Params.ByName['ID_S'].AsInteger := IdDoc;
           Open;

           StreamOrigen := CreateBlobStream(FieldByName('XML'), bmRead);
           AMemoryStream := TMemoryStream.Create;
           try
              AMemoryStream.CopyFrom(StreamOrigen, StreamOrigen.Size);
              StreamToStrB64(TMemoryStream(AMemoryStream), Result)
           finally
              StreamOrigen.Free;
              AMemoryStream.Free;
           end;

           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     end;
  finally
     FreeAndNil(DS);
  end;
end;

procedure TDMSIILROE.xPresentacionBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(xPresentacion, 'ID_SII_LROE_PRESENTACION', 'ID');
end;

procedure TDMSIILROE.EnviarPresentacion;
var
  StreamXML, StreamGZ : TStream;
  f : TFileStream;
  DS : TFIBDataSet;
  JSON : TStrings;
  //Server : variant;
  Url : string;
  //Certificado : string;
  //VersionMSXML : string;
  i : integer;
  W : WideString;
  s : string;
  sl : TStrings;
  ContentTypeRespuesta : string;
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
  Estado : string;
  //Codigo, Descripcion : string;
  DescripcionEstado : string;
  FicheroCertificado, ClaveCertificado : string;
  sr : TSearchRec;
  //MensajeRespuesta : string;
  //Respuesta : string;
  SerieFactura : string;
  NumFactura : string;
  FicheroRespuesta : string;
  EstadoRegistro : string;

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

begin
  DMMain.Log('EnviarPresentacion');
  (*
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
     Certificado := DMMain.DameCertificado('');
  *)

  // Certificado.
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CERTIFICADO_LROE_FICHERO, CERTIFICADO_LROE_CLAVE FROM EMP_MODELOS_HACIENDA WHERE EMPRESA=:EMPRESA AND EJERCICIO=:EJERCICIO AND CANAL=:CANAL';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        FicheroCertificado := FieldByName['CERTIFICADO_LROE_FICHERO'].AsString;
        ClaveCertificado := FieldByName['CERTIFICADO_LROE_CLAVE'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
  DMMain.Log(format('FicheroCertificado: %s', [FicheroCertificado]));
  DMMain.Log(format('ClaveCertificado: %s', [ClaveCertificado]));

  // Entorno de pruebas (10/08/2022) https://pruesarrerak.bizkaia.eus/N3B4000M/aurkezpena
  // Entorno de produccion (10/08/2022) ???
  Url := DMMain.DameUrlEndPoint('LRA');
  DMMain.Log(format('Url: %s', [Url]));

  DS := TFIBDataSet.Create(nil);
  JSON := TStringList.Create;
  try
     with DS do
     begin
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRW(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;

           SelectSQL.Add(' SELECT XML_PRESENTADO, JSON_PRESENTADO FROM SII_LROE_PRESENTACION WHERE ID = :ID ');

           // Abro Dataset
           Params.ByName['ID'].AsInteger := xPresentacionID.AsInteger;
           Open;

           StreamXML := CreateBlobStream(FieldByName('XML_PRESENTADO'), bmRead);
           try
              StreamXML.Position := 0;

              // Guardo en disco
              f := TFileStream.Create(DameTempPath + format('Presentacion_%d.xml', [xPresentacionID.AsInteger]), fmCreate);
              try
                 f.CopyFrom(StreamXML, 0);
              finally
                 f.Free;
              end;
           finally
              // LZip.Free;
              StreamXML.Free;
           end;

           DMMain.Log('Comprimir xml');
           // Comprimo
           RunAndWait(FMain.Handle, PChar('"' + REntorno.Directorio7Zip + '7z.exe"'), PChar(format('a Presentacion_%d.gz Presentacion_%d.xml', [xPresentacionID.AsInteger, xPresentacionID.AsInteger])), PChar(DameTempPath), SW_SHOWMINIMIZED, False);

           DMMain.Log('Leer archivo comprimido');
           // Leo el archivo comprimido a un WideString
           StreamGZ := TMemoryStream.Create;
           try
              // Obtengo el xml comprimido
              f := TFileStream.Create(DameTempPath + format('Presentacion_%d.gz', [xPresentacionID.AsInteger]), fmOpenRead);
              try
                 StreamGZ.CopyFrom(f, 0);

                 StreamGZ.Position := 0;
                 i := StreamGZ.Size;
                 SetLength(s, i);
                 //i := StreamGZ.Read(s[1], i);

                 w := s;
              finally
                 f.Free;
              end;
           finally
              StreamGZ.Free;
           end;

           DMMain.Log('Leo JSON');
           JSON.Text := FieldByName('JSON_PRESENTADO').AsString;

           sl := TStringList.Create;
           try
              sl.Add('cd ' + DameTempPath);

              sl.Add('rem HEADER del mensaje que enviamos.');
              sl.Add('set CAB0=--insecure ');
              sl.Add('set CAB1=-H "Accept-Encoding: gzip" ');
              sl.Add('set CAB2=-H "Content-Encoding: gzip" ');
              sl.Add(format('set CAB3=-H "Content-Length: %d" ', [GetFSize(format(DameTempPath + 'Presentacion_%d.gz', [xPresentacionID.AsInteger]))]));
              sl.Add('set CAB4=-H "Content-Type: application/octet-stream" ');
              sl.Add('set CAB5=-H "eus-bizkaia-n3-version: 1.0" ');
              sl.Add('set CAB6=-H "eus-bizkaia-n3-content-type: application/xml" ');

              // Reemplazo
              // - comillas por \"
              // - quito saltos de linea
              // - quito espacios repetidos
              // {\"con\": \"LROE\",\"apa\": \"1.1\",\"inte\": {\"nif\": \"NIF\",\"nrs\": \"NOMBRE\"},\"drs\": {\"mode\": \"240\",\"ejer\": \"2022\"}}"
              s := JSON.Text;
              s := StringReplace(s, '"', '\"', [rfReplaceAll]);
              s := StringReplace(s, #13#10, '', [rfReplaceAll]);
              s := StringReplace(s, '     ', ' ', [rfReplaceAll]);
              s := StringReplace(s, '    ', ' ', [rfReplaceAll]);
              s := StringReplace(s, '   ', ' ', [rfReplaceAll]);
              s := StringReplace(s, '  ', ' ', [rfReplaceAll]);
              s := StringReplace(s, '{ ', '{', [rfReplaceAll]);
              s := StringReplace(s, ', \"', ',\"', [rfReplaceAll]);
              s := StringReplace(s, ' }', '}', [rfReplaceAll]);
              sl.Add('rem JSON de la cabecera con datos de la presentacion');
              sl.Add('set CAB7=-H "eus-bizkaia-n3-data: ' + s + '"');
              sl.Add('set FICHERO=--data-binary "@' + format('Presentacion_%d.gz', [xPresentacionID.AsInteger]) + '" ');

              sl.Add('rem Certificado');
              sl.Add('rem set CERT_TYPE=--cert-type PEM ');
              sl.Add('rem set CERT=--cert Certificado_crt.pem ');
              sl.Add('rem set CERT_KEY=--key Certificado_key.pem ');

              sl.Add('rem TIPO P12 ');
              sl.Add('set CERT_TYPE=--cert-type P12 ');
              // sl.Add(format('set CERT=--cert %s:%s ', ['PertsonaFisikoa_PersonaFisica.p12', 'IZDesa2021']));
              sl.Add(format('set CERT=--cert "%s:%s" ', [StringReplace(FicheroCertificado, '\', '\\', [rfReplaceAll]), ClaveCertificado]));

              sl.Add('rem URL a donde enviamos el mensaje. (Alta y Baja en produccion o en pruebas)');
              sl.Add('set URL=-v ' + Url);

              sl.Add('rem Fichero con el mensaje de respuesta. Puede ser un mensaje de error en formato XML (<ns2:TicketBaiResponse xmlns:ns2="urn:ticketbai:emision">).');
              sl.Add('set FICHERORESPUESTA=--output ' + format('Respuesta_%d.gz', [xPresentacionID.AsInteger]));

              sl.Add('rem La primera linea sera el codigo de error. Por ejemplo "HTTP/1.1 200 OK".');
              sl.Add('rem Tambien devolvera el tipo de contenido de la respuesta. Por ejemplo "Content-Type: application/xml;charset=utf-8".');
              sl.Add('set HEADERRESPUESTA=-D ' + format('Respuesta_%d.txt', [xPresentacionID.AsInteger]));

              sl.Add('cls ');

              sl.Add('"' + REntorno.DirectorioCurl + 'curl.exe" -v %CAB0% %CAB1% %CAB2% %CAB3% %CAB4% %CAB5% %CAB6% %CAB7% %FICHERO% %CERT_TYPE% %CERT% %CERT_KEY% %URL% %FICHERORESPUESTA% %HEADERRESPUESTA% ');

              sl.SaveToFile(DameTempPath + format('Presentacion_%d.bat', [xPresentacionID.AsInteger]));
           finally
              sl.Free;
           end;

           DMMain.Log('Ejecuto bat');
           RunAndWait(FMain.Handle, PChar('"' + DameTempPath + format('Presentacion_%d.bat', [xPresentacionID.AsInteger]) + '"'), PChar(''), PChar(DameTempPath), SW_SHOWMINIMIZED, False);

           DMMain.Log('Leo respuesta');
           sl := TStringList.Create;
           try
              if FileExists(DameTempPath + format('Respuesta_%d.txt', [xPresentacionID.AsInteger])) then
              begin
                 sl.LoadFromFile(DameTempPath + format('Respuesta_%d.txt', [xPresentacionID.AsInteger]));
                 // Primera linea es el resultado de la comunicacion (Esperamo "HTTP/1.1 200 OK")
                 ContentTypeRespuesta := '';
                 if (sl.Count > 0) then
                 begin
                    if (sl[0] = 'HTTP/1.1 200 OK') then
                    begin
                       for i := 1 to sl.Count - 1 do
                       begin
                          // Busco la linea que contiene el tipo de contenido de la respuesta
                          // Por ejemplo: "application/xml;charset=utf-8"
                          if (Copy(sl[i], 1, 13) = 'Content-Type:') then
                             ContentTypeRespuesta := LowerCase(Trim(Copy(sl[i], 14, Length(sl[i]))));
                          if (Copy(sl[i], 1, 33) = 'eus-bizkaia-n3-mensaje-respuesta:') then
                             DescripcionEstado := Trim(Copy(sl[i], 34, Length(sl[i])));
                          if (Copy(sl[i], 1, 30) = 'eus-bizkaia-n3-tipo-respuesta:') then
                             Estado := Trim(Copy(sl[i], 31, Length(sl[i])));
                       end;

                       DMMain.Log(format('ContentTypeRespuesta: %s', [ContentTypeRespuesta]));
                       DMMain.Log(format('MensajeRespuesta: %s', [DescripcionEstado]));
                       DMMain.Log(format('Respuesta: %s', [Estado]));
                       ShowMessage(_('Respuesta') + #13#10 + Estado + #13#10 + DescripcionEstado);
                    end
                    else
                       ShowMessage(sl.Text);
                 end
                 else
                    ShowMessage('Respuesta vacia');
              end
              else
                 ShowMessage('No se obtuvo Respuesta');
           finally
              sl.Free;
           end;

           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     end;
  finally
     FreeAndNil(DS);
     JSON.Free;
  end;

  // Ahora trato la respuesta
  if (ContentTypeRespuesta = 'application/xml;charset=utf-8') then
  begin
     DMMain.Log('Modifico estado presentacion');
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'UPDATE SII_LROE_PRESENTACION SET ESTADO_ENVIO = :ESTADO_ENVIO, DESCRIPCION_ESTADO = :DESCRIPCION_ESTADO WHERE ID = :ID';
           Params.ByName['ID'].AsInteger := xPresentacionID.AsInteger;
           Params.ByName['ESTADO_ENVIO'].AsString := Copy(Estado, 1, 40);
           Params.ByName['DESCRIPCION_ESTADO'].AsString := Copy(DescripcionEstado, 1, 256);
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Descomprimo la respuesta
     DMMain.Log('Descomprimo la respuesta');
     DMMain.Log('"' + REntorno.Directorio7Zip + '7z.exe" ' + format('"-o' + DameTempPath + 'Respuesta_%d\" e "' + DameTempPath + 'Respuesta_%d.gz"', [xPresentacionID.AsInteger, xPresentacionID.AsInteger]));
     // Descomprimo. Esto generará una carpeta Respuesta_N que contedrá un archivo XML
     RunAndWait(FMain.Handle, PChar('"' + REntorno.Directorio7Zip + '7z.exe"'), PChar(format('"-o' + DameTempPath + 'Respuesta_%d\" e "' + DameTempPath + 'Respuesta_%d.gz"', [xPresentacionID.AsInteger, xPresentacionID.AsInteger])), PChar(DameTempPath), SW_SHOWMINIMIZED, False);

     FicheroRespuesta := '';
     if (FindFirst(DameTempPath + format('Respuesta_%d\*.xml', [xPresentacionID.AsInteger]), faAnyFile, sr) = 0) then
        FicheroRespuesta := DameTempPath + format('Respuesta_%d\', [xPresentacionID.AsInteger]) + sr.Name;
     SysUtils.FindClose(sr);

     DMMain.Log(format('Parse xml respuesta : %s', [FicheroRespuesta]));
     // XML
     Documento := TXMLDocument.Create(Self);
     try
        with Documento do
        begin
           // Borro los datos que pudiera haber
           XML.LoadFromFile(FicheroRespuesta);
           // Se activa para poder utilizar el componente
           Active := True;
           // Codigifacion UTF-8
           Encoding := 'utf-8';
           // Standalone="yes"
           // StandAlone := 'yes';
           // Caracter para indentar el fichero XML
           NodeIndentStr := #8;

           DMMain.Log('Guarda xml respuesta');
           GuardaXML(xPresentacionID.AsInteger, 'RES', XML.Text);

           NodoPadre := DocumentElement;

           s := '';
           DMMain.Log('DameNodo(NodoPadre, [''Registros''], '''')');
           NodoPadre := DameNodo(NodoPadre, ['Registros'], '');
           if Assigned(NodoPadre) then
           begin
              DMMain.Log('DameNodo(NodoPadre, [''Registro''], '''')');
              Nodo := DameNodo(NodoPadre, ['Registro'], '');
              while Assigned(Nodo) do
              begin
                 if ((xPresentacionMODELO.AsString = '240') and
                    (xPresentacionCAPITULO.AsString = '1') and
                    (xPresentacionSUBCAPITULO.AsString = '1.1') and
                    (xPresentacionOPERACION.AsString = 'A00')) then
                 begin
                    // Modelo 240 + Capitulo 1 + Subcapitulo 1.1 + Operacion 'A00' - Facturas Emitidas Con Software Garante
                    SerieFactura := DameDato(Nodo, ['Identificador', 'IDFactura', 'SerieFactura'], '');
                    DMMain.Log('SerieFactura: ' + SerieFactura);
                    NumFactura := DameDato(Nodo, ['Identificador', 'IDFactura', 'NumFactura'], '');
                    DMMain.Log('NumFactura: ' + NumFactura);
                 end
                 else
                 if ((xPresentacionMODELO.AsString = '240') and
                    (xPresentacionCAPITULO.AsString = '1') and
                    (xPresentacionSUBCAPITULO.AsString = '1.2') and
                    (xPresentacionOPERACION.AsString = 'A00')) then
                 begin
                    // Modelo 240 + Capitulo 1 + Subcapitulo 1.2 + Operacion 'A00' - Facturas Emitidas Sin Software Garante
                    SerieFactura := DameDato(Nodo, ['IDFactura', 'SerieFactura'], '');
                    DMMain.Log('SerieFactura: ' + SerieFactura);
                    NumFactura := DameDato(Nodo, ['IDFactura', 'NumFactura'], '');
                    DMMain.Log('NumFactura: ' + NumFactura);
                 end;

                 s := #13#10 + SerieFactura + '/' + NumFactura;
                 EstadoRegistro := DameDato(Nodo, ['SituacionRegistro', 'EstadoRegistro'], '');
                 DescripcionEstado := '';
                 DMMain.Log('EstadoRegistro: ' + EstadoRegistro);
                 s := s + ' - ' + EstadoRegistro;
                 if (EstadoRegistro <> 'Correcto') then
                 begin
                    DMMain.Log('Rellenando Resultado CodigoErrorRegistro');
                    s := s + ' - ' + DameDato(Nodo, ['SituacionRegistro', 'CodigoErrorRegistro'], '');
                    DMMain.Log('Rellenando Resultado DescripcionErrorRegistroES');
                    DescripcionEstado := DameDato(Nodo, ['SituacionRegistro', 'DescripcionErrorRegistroES'], '');
                    s := s + ' - ' + DescripcionEstado;
                 end;

                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' UPDATE SII_LROE_DOCUMENTO ');
                       SQL.Add(' SET ');
                       SQL.Add(' ESTADO_ENVIO = :ESTADO_ENVIO, ');
                       SQL.Add(' DESCRIPCION_ESTADO = :DESCRIPCION_ESTADO ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' ID_PRESENTACION = :ID_PRESENTACION AND ');
                       SQL.Add(' ID_DOC = (SELECT I.ID_I ');
                       SQL.Add('           FROM GES_CABECERAS_S C ');
                       SQL.Add('           JOIN GES_CABECERAS_S_FAC F ON C.ID_S = F.ID_S ');
                       SQL.Add('           JOIN EMP_REGISTRO_IVA I ON F.EMPRESA = I.EMPRESA AND F.EJERCICIO = I.EJERCICIO AND F.CANAL = I.CANAL AND F.RIR = I.REGISTRO ');
                       SQL.Add('           WHERE ');
                       SQL.Add('           C.EMPRESA = :EMPRESA AND ');
                       SQL.Add('           C.EJERCICIO = :EJERCICIO AND ');
                       SQL.Add('           C.CANAL = :CANAL AND ');
                       SQL.Add('           C.SERIE = :SERIE AND ');
                       SQL.Add('           C.TIPO = :TIPO AND ');
                       SQL.Add('           C.RIG = :RIG) ');
                       Params.ByName['ID_PRESENTACION'].AsInteger := xPresentacionID.AsInteger;
                       Params.ByName['EMPRESA'].AsInteger := xPresentacionEMPRESA.AsInteger;
                       Params.ByName['EJERCICIO'].AsInteger := xPresentacionEJERCICIO.AsInteger;
                       Params.ByName['CANAL'].AsInteger := xPresentacionCANAL.AsInteger;
                       Params.ByName['SERIE'].AsString := SerieFactura;
                       Params.ByName['TIPO'].AsString := 'FAC';
                       Params.ByName['RIG'].AsInteger := StrToIntDef(NumFactura, 0);
                       Params.ByName['ESTADO_ENVIO'].AsString := Copy(EstadoRegistro, 1, 40);
                       Params.ByName['DESCRIPCION_ESTADO'].AsString := Copy(DescripcionEstado, 1, 256);
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 Nodo := Nodo.NextSibling;
              end;
           end;

           ShowMessage(_('Resultado') + s);
        end;
     finally
        Documento.Free;
     end;
  end;

  DMMain.Log('Rename ' + FicheroRespuesta);
  CopyFileTo(FicheroRespuesta, FicheroRespuesta + '.' + FormatDateTime('yyyymmdd-hhnnss', Now) + '.bak');
  DeleteFile(PChar(FicheroRespuesta));

  DMMain.Log('Refresco dataset');
  xPresentacion.Refresh;

  DMMain.Log('Fin EnviarPresentacion');
end;

procedure TDMSIILROE.GuardarFicheroPresentacion;
var
  Archivo : string;
  xml : TStrings;
begin
  Archivo := Format('\lroe_presentacion-%d.xml', [xPresentacionID.AsInteger]);
  if MySaveDialog(Archivo, 'XML', '', 'DMSIILROE') then
  begin
     xml := TStringList.Create;
     try
        xml.Text := DameXML(xPresentacionID.AsInteger, 'PRE');
        xml.SaveToFile(Archivo);
     finally
        xml.Free;
     end;
  end;
end;

procedure TDMSIILROE.GuardarFicheroRespuesta;
var
  Archivo : string;
  xml : TStrings;
begin
  Archivo := Format('\lroe_respuesta-%d.xml', [xPresentacionID.AsInteger]);
  if MySaveDialog(Archivo, 'XML', '', 'DMSIILROE') then
  begin
     xml := TStringList.Create;
     try
        xml.Text := DameXML(xPresentacionID.AsInteger, 'RES');
        xml.SaveToFile(Archivo);
     finally
        xml.Free;
     end;
  end;
end;

function TDMSIILROE.DameXML(id: integer; Tipo: string): string;
var
  DS : TFIBDataSet;
  // StreamDestino, StreamOrigen : TStream;
begin
  Result := '';
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;

           SelectSQL.Add(' SELECT * FROM SII_LROE_PRESENTACION WHERE ID = :ID ');
           Params.ByName['ID'].AsInteger := id;
           Open;

           if (Tipo = 'PRE') then
              Result := FieldByName('XML_PRESENTADO').AsString;
           if (Tipo = 'RES') then
              Result := FieldByName('XML_RESPUESTA').AsString;

           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     end;
  finally
     FreeAndNil(DS);
  end;
end;

end.
