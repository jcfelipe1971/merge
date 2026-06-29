unit UDMFactoringChl;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Controls, Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, Dialogs, FIBDataSetRO, FIBTableDataSetRO, SysUtils,
  HYFIBQuery, XMLDoc, XMLIntf, Psock, NMpop3, NMMSG, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdPOP3, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdMessage, IdAttachment, ShellAPI;

type
  TDMFactoringChl = class(TDataModule)
     TLocal: THYTransaction;
     QMCabeceraFEChile: TFIBDataSetRO;
     DSCabeceraFEChile: TDataSource;
     QMCabeceraFEChileID_S: TIntegerField;
     QMCabeceraFEChileINDSERVICIO: TIntegerField;
     QMCabeceraFEChileMNTBRUTO: TFloatField;
     QMCabeceraFEChileTPOTRANCOMPRA: TIntegerField;
     QMCabeceraFEChileTPOTRANVENTA: TIntegerField;
     QMCabeceraFEChileFMAPAGO: TIntegerField;
     QMCabeceraFEChileFCHCANCEL: TDateTimeField;
     QMCabeceraFEChileMNTCANCEL: TFloatField;
     QMCabeceraFEChileSALDOINSOL: TFloatField;
     QMCabeceraFEChileMEDIOPAGO: TFIBStringField;
     QMCabeceraFEChileTIPOCTAPAGO: TFIBStringField;
     QMCabeceraFEChileNUMCTAPAGO: TFIBStringField;
     QMCabeceraFEChileBCOPAGO: TFIBStringField;
     QMCabeceraFEChileTERMPAGOCDG: TFIBStringField;
     QMCabeceraFEChileTERMPAGOGLOSA: TFIBStringField;
     QMCabeceraFEChileTERMPAGODIAS: TFloatField;
     QMCabeceraFEChileFCHVENC: TDateTimeField;
     QMCabeceraFEChileTIPOFACTESP: TFloatField;
     QMCabeceraFEChileGIROEMIS: TFIBStringField;
     QMCabeceraFEChileRUTEMISOR: TFIBStringField;
     QMCabeceraFEChileRZNSOC: TFIBStringField;
     QMCabeceraFEChileTELEFONO: TFIBStringField;
     QMCabeceraFEChileCORREOEMISOR: TFIBStringField;
     QMCabeceraFEChileACTECO: TIntegerField;
     QMCabeceraFEChileSUCURSAL: TFIBStringField;
     QMCabeceraFEChileCDGSIISUCUR: TIntegerField;
     QMCabeceraFEChileDIRORIGEN: TFIBStringField;
     QMCabeceraFEChileCMNAORIGEN: TFIBStringField;
     QMCabeceraFEChileCIUDADORIGEN: TFIBStringField;
     QMCabeceraFEChileCDGVENDEDOR: TFIBStringField;
     QMCabeceraFEChileRUTMANDANTE: TFIBStringField;
     QMCabeceraFEChileRUTRECEP: TFIBStringField;
     QMCabeceraFEChileCDGINTRECEP: TFIBStringField;
     QMCabeceraFEChileRZNSOCRECEP: TFIBStringField;
     QMCabeceraFEChileNUMID: TFIBStringField;
     QMCabeceraFEChileNACIONALIDAD: TFIBStringField;
     QMCabeceraFEChileTIPODOCID: TFIBStringField;
     QMCabeceraFEChileGIRORECEP: TFIBStringField;
     QMCabeceraFEChileCONTACTO: TFIBStringField;
     QMCabeceraFEChileCORREORECEP: TFIBStringField;
     QMCabeceraFEChileDIRRECEP: TFIBStringField;
     QMCabeceraFEChileCMNARECEP: TFIBStringField;
     QMCabeceraFEChileCIUDADRECEP: TFIBStringField;
     QMCabeceraFEChileDIRPOSTAL: TFIBStringField;
     QMCabeceraFEChileCMNAPOSTAL: TFIBStringField;
     QMCabeceraFEChileCIUDADPOSTAL: TFIBStringField;
     QMCabeceraFEChileRUTSOLICITA: TFIBStringField;
     QMCabeceraFEChilePATENTE: TFIBStringField;
     QMCabeceraFEChileRUTTRANS: TFIBStringField;
     QMCabeceraFEChileRUTCHOFER: TFIBStringField;
     QMCabeceraFEChileNOMBRECHOFER: TFIBStringField;
     QMCabeceraFEChileDIRDEST: TFIBStringField;
     QMCabeceraFEChileCMNADEST: TFIBStringField;
     QMCabeceraFEChileCIUDADDEST: TFIBStringField;
     QMCabeceraFEChileMNTNETO: TFloatField;
     QMCabeceraFEChileMNTEXE: TFloatField;
     QMCabeceraFEChileMNTBASE: TFloatField;
     QMCabeceraFEChileMNTMARGENCOM: TFloatField;
     QMCabeceraFEChileTASAIVA: TFloatField;
     QMCabeceraFEChileIVA: TFloatField;
     QMCabeceraFEChileVAPROP: TFloatField;
     QMCabeceraFEChileIVATERC: TFloatField;
     QMCabeceraFEChileCREDEC: TFloatField;
     QMCabeceraFEChileGRNTDEP: TFloatField;
     QMCabeceraFEChileMNTTOTAL: TFloatField;
     QMCabeceraFEChileMONTONF: TFloatField;
     QMCabeceraFEChileMONTOPERIODO: TFloatField;
     QMCabeceraFEChileSALDOANTERIOR: TFloatField;
     QMCabeceraFEChileVLRPAGAR: TFloatField;
     QMCabeceraFEChileTPOMONEDA: TFIBStringField;
     QMCabeceraFEChileTPOCAMBIO: TFloatField;
     QMCabeceraFEChileMNTNETOOTRMNDA: TFloatField;
     QMCabeceraFEChileMNTEXEOTRMNDA: TFloatField;
     QMCabeceraFEChileMNTFAECARNEOTRMNDA: TFloatField;
     QMCabeceraFEChileMNTMARGCOMOTRMNDA: TFloatField;
     QMCabeceraFEChileIVAOTRMNDA: TFloatField;
     QMCabeceraFEChileVANORETOTRMNDA: TFloatField;
     QMCabeceraFEChileMNTTOTOTRMNDA: TFloatField;
     QMCabeceraFEChileXML_GENERADO: TMemoField;
     QMCabeceraFEChileSII_TRACKID: TFIBStringField;
     QMCabeceraFEChileXML_RESPUESTA: TMemoField;
     QMCabeceraFEChileNROLINREF: TIntegerField;
     QMCabeceraFEChileTPODOCREF: TFIBStringField;
     QMCabeceraFEChileRUTOTR: TFIBStringField;
     QMCabeceraFEChileFCHREF: TDateTimeField;
     QMCabeceraFEChileCODREF: TIntegerField;
     QMCabeceraFEChileRAZONREF: TFIBStringField;
     QMCabeceraFEChileTIMBRE_TEXTO: TMemoField;
     QMCabeceraFEChileTIMBRE_COD_BARRA: TBlobField;
     TUpdate: THYTransaction;
     QMCabeceraFEChileFOLIOREF: TFIBStringField;
     IdPOP31: TIdPOP3;
     SSL1: TIdSSLIOHandlerSocketOpenSSL;
     xFactura: TFIBDataSetRO;
     DSxFactura: TDataSource;
     xFacturaEMPRESA: TIntegerField;
     xFacturaEJERCICIO: TIntegerField;
     xFacturaCANAL: TIntegerField;
     xFacturaSERIE: TFIBStringField;
     xFacturaTIPO: TFIBStringField;
     xFacturaRIG: TIntegerField;
     xFacturaB_COMISION: TFloatField;
     xFacturaI_COMISION: TFloatField;
     xFacturaLIQUIDO: TFloatField;
     xFacturaNIF: TFIBStringField;
     xFacturaFOLIO: TIntegerField;
     xFacturaTIPO_DOC_TRIBUTARIO: TFIBStringField;
     xFacturaSII_FMA_PAGO: TIntegerField;
     xTerceroClienteDte: TFIBDataSetRO;
     xFacturaTERCERO: TIntegerField;
     DSxTerceroClienteDte: TDataSource;
     xTerceroClienteDteTERCERO: TIntegerField;
     xTerceroClienteDteNOMBRE_COMERCIAL: TFIBStringField;
     xTerceroClienteDteNOMBRE_R_SOCIAL: TFIBStringField;
     xTerceroClienteDteTIPO_RAZON: TFIBStringField;
     xTerceroClienteDteNIF: TFIBStringField;
     xTerceroClienteDteDIR_NOMBRE: TFIBStringField;
     xTerceroClienteDteTELEFONO01: TFIBStringField;
     xTerceroClienteDteEMAIL: TFIBStringField;
     xTerceroClienteDteTITULO_REGION: TFIBStringField;
     xTerceroClienteDteTITULO_PROVINCIA: TFIBStringField;
     xTerceroClienteDteTITULO_POBLACION: TFIBStringField;
     xTerceroClienteDteTITULO_CODIGO_POSTAL: TFIBStringField;
     DSxTerceroCedente: TDataSource;
     xTerceroCedente: TFIBDataSetRO;
     xTerceroCedenteTERCERO: TIntegerField;
     xTerceroCedenteNOMBRE_COMERCIAL: TFIBStringField;
     xTerceroCedenteNOMBRE_R_SOCIAL: TFIBStringField;
     xTerceroCedenteNIF: TFIBStringField;
     xTerceroCedenteDIR_NOMBRE: TFIBStringField;
     xTerceroCedentePROVINCIA_DIRECCION: TFIBStringField;
     xTerceroCedenteREGION_DIRECCION: TFIBStringField;
     xTerceroCedentePOBLACION_DIRECCION: TFIBStringField;
     xTerceroCedenteDIRECCION: TIntegerField;
     xTerceroCedenteTITULO_REGION: TFIBStringField;
     xTerceroCedenteTITULO_PROVINCIA: TFIBStringField;
     xTerceroCedenteTITULO_POBLACION: TFIBStringField;
     xTerceroCedenteTITULO_CODIGO_POSTAL: TFIBStringField;
     xTerceroClienteDtePAIS_DIRECCION: TFIBStringField;
     xTerceroClienteDtePROVINCIA_DIRECCION: TFIBStringField;
     xTerceroClienteDteREGION_DIRECCION: TFIBStringField;
     xTerceroClienteDtePOBLACION_DIRECCION: TFIBStringField;
     xTerceroClienteDteDIRECCION: TIntegerField;
     xTerceroClienteDteDIRECCION_LITERAL: TMemoField;
     xTerceroCesionario: TFIBDataSetRO;
     DSxTerceroCesionario: TDataSource;
     xTerceroCesionarioTERCERO: TIntegerField;
     xTerceroCesionarioNOMBRE_COMERCIAL: TFIBStringField;
     xTerceroCesionarioNOMBRE_R_SOCIAL: TFIBStringField;
     xTerceroCesionarioNIF: TFIBStringField;
     xTerceroCesionarioDIR_NOMBRE: TFIBStringField;
     xTerceroCesionarioTELEFONO01: TFIBStringField;
     xTerceroCesionarioPAIS_DIRECCION: TFIBStringField;
     xTerceroCesionarioPROVINCIA_DIRECCION: TFIBStringField;
     xTerceroCesionarioREGION_DIRECCION: TFIBStringField;
     xTerceroCesionarioPOBLACION_DIRECCION: TFIBStringField;
     xTerceroCesionarioTITULO_REGION: TFIBStringField;
     xTerceroCesionarioTITULO_PROVINCIA: TFIBStringField;
     xTerceroCesionarioTITULO_POBLACION: TFIBStringField;
     xTerceroCesionarioTITULO_CODIGO_POSTAL: TFIBStringField;
     xTerceroCesionarioContacto: TFIBDataSetRO;
     DSxTerceroCesionarioContacto: TDataSource;
     xTerceroCesionarioContactoTERCERO: TIntegerField;
     xTerceroCesionarioContactoCONTACTO: TIntegerField;
     xTerceroCesionarioContactoNOMBRE: TFIBStringField;
     xTerceroCesionarioContactoAPELLIDOS: TFIBStringField;
     xTerceroCesionarioContactoTELEFONO: TFIBStringField;
     xTerceroCesionarioContactoCORREO: TFIBStringField;
     xTerceroCesionarioContactoDIRECCION: TIntegerField;
     xTerceroCesionarioContactoDIR_NOMBRE: TFIBStringField;
     xTerceroCesionarioContactoDIR_COMPLETA: TFIBStringField;
     xTerceroCesionarioContactoDIRECCION_LITERAL: TMemoField;
     xEmisor: TFIBDataSetRO;
     DSxEmisor: TDataSource;
     xEmisorNIF: TFIBStringField;
     xEmisorNOMBRE_R_SOCIAL: TFIBStringField;
     xEmisorTELEFONO01: TFIBStringField;
     xEmisorEMAIL: TFIBStringField;
     xEmisorDIR_COMPLETA_N: TFIBStringField;
     xEmisorTITULO_POBLACION: TFIBStringField;
     xFacturaFECHA: TDateTimeField;
     xTerceroCedenteDIRECCION_LITERAL: TMemoField;
     xTerceroCedenteEMAIL: TFIBStringField;
     xCertificado: TFIBDataSetRO;
     DSxCertificado: TDataSource;
     xCertificadoEMPRESA: TIntegerField;
     xCertificadoCERTIFICADO: TBlobField;
     xCertificadoCONTRASENYA: TFIBStringField;
     xCertificadoRUT: TFIBStringField;
     xCertificadoFECHA_RESOLUCION: TDateTimeField;
     xCertificadoNRO_RESOLUCION: TIntegerField;
     xCertificadoNOMBRE_RESPONSABLE: TFIBStringField;
     xCertificadoEXPONENT: TFIBStringField;
     xCertificadoMODULO: TBlobField;
     xCertificadoLLAVE_PUBLICA_X509: TBlobField;
     xCertificadoLLAVE_PRIVADA_RSA: TBlobField;
     xCertificadoLLAVE_PRIVADA_2: TBlobField;
     xTerceroCesionarioEMAIL: TFIBStringField;
     xFacturaVENCIMIENTO: TDateTimeField;
     procedure DMFactoringChlCreate(Sender: TObject);
  private
     { Private declarations }
     function VerificaSmtpUsuario: boolean;
     procedure GeneraFicheroFactoring(Proveedor, ID_S: integer);
  public
     { Public declarations }
     procedure EnviaDocumentoFactoring(Proveedor, ID_S: integer);
  end;

var
  DMFactoringChl : TDMFactoringChl;

implementation

uses UFBusca, UEntorno, UFormGest, UDMMain, UUtiles, UParam, UFacturaElectronicaCL, UDMAdjunto, DateUtils, UHojaCalc, UDMListados, IdText, UFMAdjunto,
  UDMLstFactura, UFInformacionEnvioDte, UDMLstAlbaranes, UFMain, IdHttp, UDameDato;

{$R *.DFM}

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

procedure TDMFactoringChl.DMFactoringChlCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMFactoringChl.GeneraFicheroFactoring(Proveedor, ID_S: integer);
var
  ArchivoTexto, ArchivoXml : TextFile;
  UrlEnviaFichero, FicheroRespuesta, FicheroAECFirmado : string;
  (*DirOri, s : string;*)
  CarpetaFichero, NombreFichero, NombreFicheroDte, FicheroTXT, BaseNombreFicheros : string;
  Folio, TercerCesionario : integer;
  TipoDocTributario, RutClienteDte, UrlFactronicaCesion, RutCedente : string;
  DTEFirmado, CarpetaRemotaAlmacenamiento, UrlRespuesta, UrlEnviaDte, UrlAECFirmado : string;
  WndList : Pointer;

  procedure ObtieneDatosFactura;
  begin
     with xFactura do
     begin
        Close;
        Params.ByName['ID_S'].AsInteger := ID_S;
        Open;
     end;
  end;

  procedure ObtieneDatosDTE;
  begin
     with QMCabeceraFEChile do
     begin
        Close;
        Params.ByName['ID_S'].AsInteger := ID_S;
        Open;
     end;
  end;

  procedure ObtieneDatosCesionario;
  begin
     // Obtenemos datos tercero cesionario
     with xTerceroCesionario do
     begin
        Close;
        Params.ByName['TERCERO'].AsInteger := TercerCesionario;
        Open;
     end;

     // Obtenemos contacto cesionario
     with xTerceroCesionarioContacto do
     begin
        Close;
        Params.ByName['TERCERO'].AsInteger := TercerCesionario;
        Open;
     end;
  end;

  procedure ObtieneDatosEmisor;
  begin
     // Obtenemos datos del emisor
     with xEmisor do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Open;
     end;
  end;

  procedure ObtieneDatosTerceroCliente;
  begin
     // Obtenemos datos del tercero del cliente
     with xTerceroClienteDte do
     begin
        Close;
        Params.ByName['TERCERO'].AsInteger := xFacturaTERCERO.AsInteger;
        Open;
     end;
  end;

  procedure ObtieneDatosCertificado;
  begin
     // Obtenemos datos del Certificado
     with xCertificado do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Open;
     end;
  end;

  procedure ObtieneDatosTerceroCedente;
  begin
     // Obtenemos datos de Tercero cedente
     with xTerceroCedente do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Open;
     end;
  end;

  function ExtraeDTEFirmado: string;
  var
     texto : string;
     posicionInicio, posicionFinal : integer;
  begin
     texto := QMCabeceraFEChileXML_GENERADO.AsString;
     posicionFinal := Pos('</DTE>', texto);
     if (Pos('LibreDTE', texto) > 0) then
        texto := Copy(texto, 0, posicionFinal + 6)
     else
        texto := Copy(texto, 0, posicionFinal + 5);

     posicionInicio := Pos('<DTE', texto);
     texto := Copy(texto, posicionInicio, Length(texto) - 1);
     texto := '<?xml version="1.0" encoding="ISO-8859-1"?>' + #13 + #10 + texto;

     {$IFDEF Debug}
     with TStringList.Create do
     begin
        try
           Add(texto);
           SaveToFile(DameTempPath + 'XML_FIRMADO.xml');
        finally
           Free;
        end;
     end;
     {$ENDIF}

     Result := texto;
  end;

  function LoadFileContentToWideString(const FileName: string): WideString;
  var
     StringList : TStringList;
  begin
     StringList := TStringList.Create;
     try
        // Cargar el contenido del archivo en TStringList
        StringList.LoadFromFile(FileName);
        // Asignar el contenido a un WideString
        Result := WideString(StringList.Text);
     finally
        StringList.Free;
     end;
  end;

  function IsURL404(const URL: string): boolean;
  var
     HTTP : TIdHTTP;
  begin
     HTTP := TIdHTTP.Create(nil);
     try
        try
           // Realiza una solicitud HEAD a la URL
           HTTP.Head(URL);
           Result := HTTP.ResponseCode = 404;
        except
           on E: EIdHTTPProtocolException do
              Result := (E.ErrorCode = 404); // Captura el error 404 específicamente
           else
              Result := False; // Otros errores pueden no ser 404
        end;
     finally
        HTTP.Free;
     end;
  end;

  procedure ObtieneRespuestaDeEnvio;
  var
     Stream : TFileStream;
     Archivo, ArchivoAEC, TrackID : string;
     DescargadaRespuesta, DescargadaAECFirmada : boolean;
     Documento : TXMLDocument;
     NodoPadre : IXMLNode;
     Nodo : IXMLNode;
     Status : integer;
     DteFirmadoWS, FicheroTextoWS : WideString;
     CuerpoMail : TStrings;

  begin
     //Status := -1;
     TrackID := '';
     DMMain.Log('Inicia - Obtiene respueta envio');
     //DescargadaRespuesta := True;
     //DescargadaAECFirmada := True;

     if (IsURL404(UrlRespuesta)) then
        raise Exception.Create(_('No se encuentra la URL' + UrlRespuesta));

     Archivo := IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, False)) + FicheroRespuesta;
     DMMain.Log('El archivo que se descarga se guarda en:' + Archivo);

     Stream := TFileStream.Create(Archivo, fmCreate);
     try
        DescargadaRespuesta := DownloadToStream(UrlRespuesta, Stream);
        DMMain.Log('Se descarga el fichero: ' + UrlRespuesta);
     finally
        Stream.Free;
     end;

     ArchivoAEC := IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, False)) + FicheroAECFirmado;
     DMMain.Log('El archivo que se descarga se guarda en:' + ArchivoAEC);
     FInformacionEnvioDte.MLog.Lines.Add(_('Se descarga AEC firmado'));

     Stream := TFileStream.Create(ArchivoAEC, fmCreate);
     try
        DescargadaAECFirmada := DownloadToStream(UrlAECFirmado, Stream);
        DMMain.Log('Se descarga el fichero: ' + UrlAECFirmado);
     finally
        Stream.Free;
     end;


     if ((DescargadaRespuesta) and (DescargadaAECFirmada)) then
     begin
        DMMain.Log('Se ha descargado el archivo de respuesta');
        FInformacionEnvioDte.MLog.Lines.Add(_('Se ha descargado el archivo de respuesta'));
        Documento := TXMLDocument.Create(Self);
        with Documento do
        begin
           XML.LoadFromFile(Archivo);
           Active := True;

           NodoPadre := DocumentElement;

           Nodo := DameNodo(NodoPadre, ['STATUS']);
           if Assigned(Nodo) then
           begin
              Status := StrToInt(DameDato(NodoPadre, ['STATUS']));
              DMMain.Log('Se obtiene el STATUS:' + IntToStr(Status));
              // Si el estado es cero obtenemos trackid
              if (Status = 0) then
              begin
                 Nodo := DameNodo(NodoPadre, ['TRACKID']);
                 if Assigned(Nodo) then
                 begin
                    TrackID := DameDato(NodoPadre, ['TRACKID']);
                    DMMain.Log('Se obtiene el TrackID:' + TrackID);
                    FInformacionEnvioDte.MLog.Lines.Add(_('Se obtiene el TrackID:') + TrackID);
                 end;
              end;
           end
           else
           begin
              DMMain.Log('EL fichero xml de respuesta no es correcto');
              FInformacionEnvioDte.MLog.Lines.Add(_('EL fichero xml de respuesta no es correcto'));
              raise Exception.Create(_('EL fichero xml de respuesta no es correcto'));
           end;
        end;

        DteFirmadoWS := LoadFileContentToWideString(DTEFirmado);
        FicheroTextoWS := LoadFileContentToWideString(Archivo);

        //Guardamos datos obtenidos
        with TFIBDataSet.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              Transaction := DameTransactionRW(DMMain.DataBase);
              try
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;

                 // Guardamos el XML generado en la base de datos
                 FInformacionEnvioDte.MLog.Lines.Add(_('Guardamos el XML generado en la base de datos'));
                 DMMain.Log('Guardamos el XML de respuesta y datos obtenidos');
                 SelectSQL.Add(' SELECT * FROM GES_CABECERAS_S_AEC_CHL ');
                 SelectSQL.Add(' WHERE ID_S = :ID_S ');
                 Params.ByName['ID_S'].AsInteger := ID_S;


                 InsertSQL.Add(' INSERT INTO GES_CABECERAS_S_AEC_CHL ( ');
                 InsertSQL.Add(' ID_S, TRACKID, XML_DTE_FIRMADO, XML_RESPUESTA_ENVIO, PROVEEDOR, STATUS) ');
                 InsertSQL.Add(' VALUES ( ');
                 InsertSQL.Add(' :ID_S, :TRACKID, :XML_DTE_FIRMADO, :XML_RESPUESTA_ENVIO, :PROVEEDOR, :STATUS ) ');
                 Open;
                 Insert;

                 FieldByName('ID_S').AsInteger := ID_S;
                 FieldByName('TRACKID').AsString := TrackID;
                 FieldByName('XML_DTE_FIRMADO').Value := DteFirmadoWS;
                 FieldByName('XML_RESPUESTA_ENVIO').Value := FicheroTextoWS;
                 FieldByName('PROVEEDOR').AsInteger := Proveedor;
                 FieldByName('STATUS').AsInteger := Status;
                 Post;
                 Close;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;
           finally
              Free;
           end;
        end;

        { Si la respuesta de envio es OK enviamos correo automatico al Factoring con el AEC firmado}
        if ((Status = 0) and (TrackID > '')) then
        begin
           AbreData(TDMListados, DMListados);
           FInformacionEnvioDte.MLog.Lines.Add(_('Preparando correo para factoring'));
           try
              CuerpoMail := TStringList.Create;
              CuerpoMail.Add('Señores');
              CuerpoMail.Add(xTerceroCesionarioNOMBRE_R_SOCIAL.AsString);
              CuerpoMail.Add(xTerceroCesionarioContactoDIR_NOMBRE.AsString);
              CuerpoMail.Add('Presente.-');
              CuerpoMail.Add('');
              CuerpoMail.Add('');
              CuerpoMail.Add('De Nuestra Consideración,');
              CuerpoMail.Add('Notifico a Usted que se cedió a ' + xTerceroCesionarioNOMBRE_R_SOCIAL.AsString + ' , los derechos sobre el DTE Nº ' + IntToStr(xFacturaFOLIO.AsInteger) + ' que se detalla:');
              CuerpoMail.Add('');
              CuerpoMail.Add('Nº Documento:' + IntToStr(xFacturaFOLIO.AsInteger));
              CuerpoMail.Add('Rut:' + xTerceroClienteDteNIF.AsString);
              CuerpoMail.Add('Razón Social:' + xTerceroClienteDteNOMBRE_R_SOCIAL.AsString);
              CuerpoMail.Add('Monto:' + FloatToStr(xFacturaLIQUIDO.AsFloat));
              CuerpoMail.Add('');
              CuerpoMail.Add('En virtud de la ley Nº 19.983 sobre la transferencia de facturas,');
              CuerpoMail.Add('cualquier acuerdo que tenga por objeto limitar la cesión de las facturas se entenderá por no escrita y el pago de estas facturas para que sea liberatorio, solo deberá ser efectuado al cesionario');
              CuerpoMail.Add(xTerceroCesionarioNOMBRE_R_SOCIAL.AsString + ' domiciliado en ' + xTerceroCesionarioDIR_NOMBRE.AsString + ' Rut Nº ' + xTerceroCesionarioNIF.AsString);
              CuerpoMail.Add('');
              CuerpoMail.Add('');
              CuerpoMail.Add('');
              CuerpoMail.Add(xTerceroCedenteNOMBRE_R_SOCIAL.AsString + ' - ' + xTerceroCedenteNIF.AsString);

              //Descargamos fichero AEC firmado
             {if (IsURL404(UrlAECFirmado)) then
                raise Exception.Create(_('No se encuentra la URL' + UrlAECFirmado));
               }


              //Enviamos datos
              FInformacionEnvioDte.MLog.Lines.Add(_('Enviando correo con documento AEC a factoring'));
              DMListados.SendMailPDF(xTerceroCesionarioContactoCORREO.AsString, CuerpoMail, ArchivoAEC, FicheroAECFirmado, 'Envio AEC', '');
           finally
              CuerpoMail.Free;
           end;
           CierraData(DMListados);
        end;
     end
     else
     begin
        DMMain.Log('NO se ha descargado el archivo de respuesta');
        ShowMessage('No se pudo descargar desde la URL' + #13#10 + UrlRespuesta);
     end;
  end;

  function ExisteRegistroAEC: boolean;
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT FIRST 1 ID_S FROM GES_CABECERAS_S_AEC_CHL WHERE ID_S = :ID_S';
           Params.ByName['ID_S'].AsInteger := ID_S;
           ExecQuery;
           Result := (FieldByName['ID_S'].AsInteger > 0);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  function ValidaDatosEAC: boolean;
  begin
     Result := True;

     // Verificamos si tiene nombre de cesionario
     if (xTerceroCesionarioContactoNOMBRE.AsString = '') then
     begin
        ShowMessage(_('Es necesario el nombre del contacto del cesionario'));
        Result := False;
     end
     else
     // Verificamos si el cesionario tiene telefono
     if (xTerceroCesionarioContactoTELEFONO.AsString = '') then
     begin
        ShowMessage(_('Es necesario el telefono del contacto del cesionario'));
        Result := False;
     end
     else
     // Verificamos si el cesionario tiene telefono
     if ((xTerceroCesionarioContactoCORREO.AsString = '') or FormatoEmailValido(xTerceroCesionarioContactoCORREO.AsString) = False) then
     begin
        ShowMessage(_('Es necesario el correo valido del contacto del cesionario'));
        Result := False;
     end
     else
     // Verificamos si tiene registro de envio AEC
     if (ExisteRegistroAEC) then
     begin
        ShowMessage(_('Ya se tiene un registro AEC de este documento'));
        Result := False;
     end
     else
     // Verificamos si el usuario tiene configurado el correo
     if (VerificaSmtpUsuario = False) then
     begin
        ShowMessage(_('El usuario no tiene configurado el correo electronico para el envio automatico del documento.'));
        Result := False;
     end;

  end;

begin
  FInformacionEnvioDte := TFInformacionEnvioDte.Create(Self);
  WndList := DisableTaskWindows(FInformacionEnvioDte.Handle);
  with FInformacionEnvioDte do
  begin
     LBLGeneral.Caption := _('Inicializando Factoring ...');
     MLog.Lines.Clear;
     Show;
  end;

  FInformacionEnvioDte.LBLGeneral.Caption := _('Generando factoring ...');
  FInformacionEnvioDte.GBProcesaCab.Visible := True;

  ObtieneDatosFactura;
  ObtieneDatosDTE;

  with FInformacionEnvioDte do
  begin
     Caption := _('Generando factoring ...');
     LTipoDocTributario.Caption := DameTituloTipoDocTributario(xFacturaTIPO_DOC_TRIBUTARIO.AsString);
     LTituloRutReceptor.Caption := 'RUT Cesionario';
     LRutReceptor.Caption := xTerceroCesionarioNIF.AsString;
     LRig.Caption := IntToStr(xFacturaRIG.AsInteger);
     LFolio.Caption := IntToStr(xFacturaFOLIO.AsInteger);
     LCliente.Caption := xTerceroClienteDteNOMBRE_R_SOCIAL.AsString;
     MLog.Lines.Add(_('Preparando datos documento'));
  end;

  UrlFactronicaCesion := DMMain.DameUrlEndPoint('FAC') + '/' + 'factronica_cesion';
  CarpetaFichero := IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, False));
  TercerCesionario := DameTercero('PRO', Proveedor, REntorno.Empresa);

  ObtieneDatosCesionario;
  FInformacionEnvioDte.MLog.Lines.Add(_('Obteniendo datos cesionario'));

  ObtieneDatosEmisor;
  FInformacionEnvioDte.MLog.Lines.Add(_('Obteniendo datos Emisor'));

  ObtieneDatosCertificado;
  FInformacionEnvioDte.MLog.Lines.Add(_('Obteniendo datos Certificado'));

  ObtieneDatosTerceroCliente;
  FInformacionEnvioDte.MLog.Lines.Add(_('Obteniendo datos Cliente'));

  ObtieneDatosTerceroCedente;
  FInformacionEnvioDte.MLog.Lines.Add(_('Obteniendo datos Cedente'));


  // Definimos nombres de ficheros
  Folio := xFacturaFOLIO.AsInteger;
  TipoDocTributario := xFacturaTIPO_DOC_TRIBUTARIO.AsString;
  RutClienteDte := xTerceroClienteDteNIF.AsString;
  RutCedente := xTerceroCedenteNIF.AsString;
  BaseNombreFicheros := RutCedente + '_' + RutClienteDte + '_' + TipoDocTributario + '_' + IntToStr(Folio);
  NombreFichero := BaseNombreFicheros + '_cargar_datos.txt';
  FicheroTXT := CarpetaFichero + NombreFichero;
  NombreFicheroDte := BaseNombreFicheros + '_DTEFIRMADO.xml';
  DTEFirmado := CarpetaFichero + NombreFicheroDte; // Archivo firmado del DTE
  UrlEnviaFichero := UrlFactronicaCesion + '/ws_cesion.php';
  UrlEnviaDte := UrlFactronicaCesion + '/recibedte.php';
  FicheroRespuesta := BaseNombreFicheros + '_CESION_TRACKID_RUT.xml';
  FicheroAECFirmado := BaseNombreFicheros + '_DOCUMENTOAECFIRMADO.xml';
  CarpetaRemotaAlmacenamiento := 'xml';
  UrlRespuesta := UrlFactronicaCesion + '/' + CarpetaRemotaAlmacenamiento + '/' + FicheroRespuesta;
  UrlAECFirmado := UrlFactronicaCesion + '/' + CarpetaRemotaAlmacenamiento + '/' + FicheroAECFirmado;

  try
     // VErificamos datos EAC
     if (ValidaDatosEAC) then
     begin
        FInformacionEnvioDte.MLog.Lines.Add(_('Generando documento EAC'));
        // Generamos el documento de Texto
        AssignFile(ArchivoTexto, FicheroTXT);
        try
           Rewrite(ArchivoTexto);
           WriteLn(ArchivoTexto, '<?php');
           WriteLn(ArchivoTexto, '##############################################################');
           WriteLn(ArchivoTexto, '####### NOMBRES DIRECTORIOS DE ALMACENAMIENTO LOCAL Y REMOTO');
           WriteLn(ArchivoTexto, '##############################################################');
           WriteLn(ArchivoTexto, '#');
           WriteLn(ArchivoTexto, '$CONFACTRONICA["ENVIARSII"]="1";');
           WriteLn(ArchivoTexto, '# NOMBRE DE LA CARPETA LOCAL DE ALMACENAMIENTO');
           WriteLn(ArchivoTexto, '$CONFACTRONICA["ALMACENLOCAL"]="xml";');
           WriteLn(ArchivoTexto, '# NOMBRE DE LA CARPETA REMOTA DE ALMACENAMIENTO');
           WriteLn(ArchivoTexto, '$CONFACTRONICA["ALMACENREMOTO"]="' + CarpetaRemotaAlmacenamiento + '";');
           WriteLn(ArchivoTexto, '# NOMBRE DEL ARCHIVO PLANO QUE ESTA ENVIANDO');
           WriteLn(ArchivoTexto, '$CONFACTRONICA["ARCHIVOPLANO"]="' + NombreFichero + '";');
           WriteLn(ArchivoTexto, '# NOMBRE DEL ARCHIVO XML A CEDER (SOLO EL DTE FIRMADO SIN SOBRE)');
           WriteLn(ArchivoTexto, '$CONFACTRONICA["DTEFIRMADO"]="' + NombreFicheroDte + '";');
           WriteLn(ArchivoTexto, '# NOMBRE DEL ARCHIVO XML CON LA RESPUESTA DEL SII (TRACKID)');
           WriteLn(ArchivoTexto, '$CONFACTRONICA["TRACKID"]="' + FicheroRespuesta + '";');
           WriteLn(ArchivoTexto, '#');
           WriteLn(ArchivoTexto, '$CONFACTRONICA["DTECEDIDOPORFIRMAR"]="' + BaseNombreFicheros + '_DTECEDIDOPORFIRMAR.xml";');
           WriteLn(ArchivoTexto, '#');
           WriteLn(ArchivoTexto, '$CONFACTRONICA["DTECEDIDOFIRMADO"]="' + BaseNombreFicheros + '_DTECEDIDOFIRMADO.xml";');
           WriteLn(ArchivoTexto, '#');
           WriteLn(ArchivoTexto, '$CONFACTRONICA["CESIONPORFIRMAR"]="' + BaseNombreFicheros + '_CESIONPORFIRMAR.xml";');
           WriteLn(ArchivoTexto, '#');
           WriteLn(ArchivoTexto, '$CONFACTRONICA["CESIONFIRMADA"]="' + BaseNombreFicheros + '_CESIONFIRMADA.xml";');
           WriteLn(ArchivoTexto, '#');
           WriteLn(ArchivoTexto, '$CONFACTRONICA["DOCUMENTOAECPORFIRMAR"]="' + BaseNombreFicheros + '_DOCUMENTOAECPORFIRMAR.xml";');
           WriteLn(ArchivoTexto, '#');
           WriteLn(ArchivoTexto, '$CONFACTRONICA["DOCUMENTOAECFIRMADO"]="' + FicheroAECFirmado + '";');
           WriteLn(ArchivoTexto, '');
           WriteLn(ArchivoTexto, '##############################################################');
           WriteLn(ArchivoTexto, '####### CONFIGURACIÓN DEL SERVIDOR DE FACTURACIÓN');
           WriteLn(ArchivoTexto, '##############################################################');
           WriteLn(ArchivoTexto, '# URL DEL WEBSERVICE SERVIDOR');
           WriteLn(ArchivoTexto, '$CONFACTRONICA["URLHOST"]="' + UrlFactronicaCesion + '";');
           WriteLn(ArchivoTexto, '# SCRIPT DEL WEBSERVICE SERVIDOR');
           WriteLn(ArchivoTexto, '$CONFACTRONICA["URLFILE"]="ws_cesion.php";');
           WriteLn(ArchivoTexto, '# PUERTO DE COMUNICACION ej.80');
           WriteLn(ArchivoTexto, '$CONFACTRONICA["PORT"]="443";');
           WriteLn(ArchivoTexto, '# DEPURAR ej. 1');
           WriteLn(ArchivoTexto, '$CONFACTRONICA["VERBOSE"]="1";');
           WriteLn(ArchivoTexto, '# RETORNAR RESULTADOS ej. 1');
           WriteLn(ArchivoTexto, '$CONFACTRONICA["RETURNTRANSFER"]="1";');
           WriteLn(ArchivoTexto, '# TIEMPO MAXIMO ESPERA ej.30');
           WriteLn(ArchivoTexto, '$CONFACTRONICA["TIMEOUT"]="30";');
           WriteLn(ArchivoTexto, '# ENCABEZADO DEL ENVIO ej. 0');
           WriteLn(ArchivoTexto, '$CONFACTRONICA["HEADER"]="0";');
           WriteLn(ArchivoTexto, '# ENVIAR ENCABEZADO EJ. true');
           WriteLn(ArchivoTexto, '$CONFACTRONICA["HEADER_OUT"]="1";');
           WriteLn(ArchivoTexto, '');
           WriteLn(ArchivoTexto, '##############################################################');
           WriteLn(ArchivoTexto, '# DATOS DE CARATULA');
           WriteLn(ArchivoTexto, '##############################################################');
           WriteLn(ArchivoTexto, '#Definido por el desarrollador');
           WriteLn(ArchivoTexto, '$DocumentoAEC["ID"]="CEDE_DTE_' + IntToStr(ID_S) + '";');
           WriteLn(ArchivoTexto, '#RUT de la empresa que emitio la factura');
           WriteLn(ArchivoTexto, '$Caratula["RutCedente"]="' + xTerceroCedenteNIF.AsString + '";');
           WriteLn(ArchivoTexto, '#RUT del factoring');
           WriteLn(ArchivoTexto, '$Caratula["RutCesionario"]="' + xTerceroCesionarioNIF.AsString + '";');
           WriteLn(ArchivoTexto, '#Nombre contacto');
           WriteLn(ArchivoTexto, '$Caratula["NmbContacto"]="' + xTerceroCesionarioContactoNOMBRE.AsString + ' ' + xTerceroCesionarioContactoAPELLIDOS.AsString + '";');
           WriteLn(ArchivoTexto, '#Fono contacto');
           WriteLn(ArchivoTexto, '$Caratula["FonoContacto"]="' + xTerceroCesionarioContactoTELEFONO.AsString + '";');
           WriteLn(ArchivoTexto, '#Mail contacto');
           WriteLn(ArchivoTexto, '$Caratula["MailContacto"]="' + xTerceroCesionarioContactoCORREO.AsString + '";');
           WriteLn(ArchivoTexto, '');
           WriteLn(ArchivoTexto, '##############################################################');
           WriteLn(ArchivoTexto, '# DATOS DEL CESION');
           WriteLn(ArchivoTexto, '##############################################################');
           WriteLn(ArchivoTexto, '$DocumentoCesion["ID"]="DOC_CESION_' + IntToStr(ID_S) + '";');
           WriteLn(ArchivoTexto, '$DocumentoCesion["SeqCesion"]="1";');
           WriteLn(ArchivoTexto, '');
           WriteLn(ArchivoTexto, '##############################################################');
           WriteLn(ArchivoTexto, '# DATOS DEL DTE');
           WriteLn(ArchivoTexto, '##############################################################');
           WriteLn(ArchivoTexto, '$IdDTE["TipoDTE"]="' + TipoDocTributario + '"; // Tipo de Factura Cedida');
           WriteLn(ArchivoTexto, '$IdDTE["RUTEmisor"]="' + xEmisorNIF.AsString + '"; // Rut del Emisor de la Factura Cedida');
           WriteLn(ArchivoTexto, '$IdDTE["RUTReceptor"]="' + xFacturaNIF.AsString + '"; // Rut del Receptor (Cliente) de la Factura Cedida');
           WriteLn(ArchivoTexto, '$IdDTE["Folio"]="' + IntToStr(Folio) + '"; // Folio de la Factura Cedida');
           WriteLn(ArchivoTexto, '$IdDTE["FchEmis"]="' + FormatDateTime('yyyy-mm-dd', xFacturaFECHA.AsDateTime) + '"; // Fecha de la factura cedida formato aaaa-mm-dd');
           WriteLn(ArchivoTexto, '$IdDTE["MntTotal"]="' + FloatToStr(xFacturaLIQUIDO.AsFloat) + '"; // Monto total bruto de la factura cedida');
           WriteLn(ArchivoTexto, '');
           WriteLn(ArchivoTexto, '##############################################################');
           WriteLn(ArchivoTexto, '# DATOS DEL CEDENTE - Empresa que emitio la factura');
           WriteLn(ArchivoTexto, '##############################################################');
           WriteLn(ArchivoTexto, '$Cedente["RUT"]="' + xTerceroCedenteNIF.AsString + '";');
           WriteLn(ArchivoTexto, '$Cedente["RazonSocial"]="' + xTerceroCedenteNOMBRE_R_SOCIAL.AsString + '";');
           WriteLn(ArchivoTexto, '$Cedente["Direccion"]="' + xTerceroCedenteDIR_NOMBRE.AsString + '";');
           WriteLn(ArchivoTexto, '$Cedente["eMail"]="' + xTerceroCedenteEMAIL.AsString + '";');
           WriteLn(ArchivoTexto, '$Cedente["RUTAutorizado"]="' + xTerceroCedenteNIF.AsString + '";');
           WriteLn(ArchivoTexto, '$Cedente["Nombre"]="' + xCertificadoNOMBRE_RESPONSABLE.AsString + '";');
           Write(ArchivoTexto, '$Cedente["DeclaracionJurada"]="' + xCertificadoNOMBRE_RESPONSABLE.AsString + ', Rut ' + xTerceroCedenteNIF.AsString + ', en representación de ' + xTerceroCedenteNOMBRE_R_SOCIAL.AsString + ', RUT ' + xTerceroCedenteNIF.AsString + ' ');
           Write(ArchivoTexto, 'declaro bajo juramento que he puesto a disposición del cesionario ' + xTerceroCesionarioNOMBRE_R_SOCIAL.AsString + ', RUT ' + xTerceroCesionarioNIF.AsString + ', el (los) documento(s) ');
           Write(ArchivoTexto, 'donde constan los recibos de la recepción de las mercaderías entregadas o servicios prestados, entregados por parte del ');
           Write(ArchivoTexto, 'deudor de la factura ' + xTerceroClienteDteNOMBRE_R_SOCIAL.AsString + '. , Rut ' + xTerceroClienteDteNIF.AsString + ', de acuerdo a lo establecido en la Ley N° 19.983.";');
           WriteLn(ArchivoTexto, '');
           WriteLn(ArchivoTexto, '##############################################################');
           WriteLn(ArchivoTexto, '# DATOS DEL CESIONARIO - Datos del Factoring');
           WriteLn(ArchivoTexto, '##############################################################');
           WriteLn(ArchivoTexto, '$Cesionario["RUT"]="' + xTerceroCesionarioNIF.AsString + '";');
           WriteLn(ArchivoTexto, '$Cesionario["RazonSocial"]="' + xTerceroCesionarioNOMBRE_R_SOCIAL.AsString + '";');
           WriteLn(ArchivoTexto, '$Cesionario["Direccion"]="' + xTerceroCesionarioDIR_NOMBRE.AsString + '";');
           WriteLn(ArchivoTexto, '$Cesionario["eMail"]="' + xTerceroCesionarioEMAIL.AsString + '";');
           WriteLn(ArchivoTexto, '');
           WriteLn(ArchivoTexto, '##############################################################');
           WriteLn(ArchivoTexto, '# DATOS DEL DOCUMENTO CEDIDO');
           WriteLn(ArchivoTexto, '##############################################################');
           WriteLn(ArchivoTexto, '$DocumentoCesion["MontoCesion"]="' + FloatToStr(xFacturaLIQUIDO.AsFloat) + '";');
           WriteLn(ArchivoTexto, '$DocumentoCesion["UltimoVencimiento"]="' + FormatDateTime('yyyy-mm-dd', xFacturaVENCIMIENTO.AsDateTime) + '";');
           WriteLn(ArchivoTexto, '$DocumentoCesion["eMailDeudor"]="' + xTerceroClienteDteEMAIL.AsString + '";');
           WriteLn(ArchivoTexto, '');
           WriteLn(ArchivoTexto, '##############################################################');
           WriteLn(ArchivoTexto, '# CONFIGURACION DE NOMBRES DE CARPETAS Y ARCHIVOS');
           WriteLn(ArchivoTexto, '##############################################################');
           WriteLn(ArchivoTexto, '$DocumentoDTECedido["ID"]="DTEURI_' + IntToStr(ID_S) + '";');
           WriteLn(ArchivoTexto, '');
           WriteLn(ArchivoTexto, '##############################################################');
           WriteLn(ArchivoTexto, '# CARGAR CERTIFICADO DIGITAL');
           WriteLn(ArchivoTexto, '##############################################################');
           WriteLn(ArchivoTexto, '# MODULO DEL CERTIFICADO');
           WriteLn(ArchivoTexto, '$certificado["Modulus"]="' + xCertificadoMODULO.AsString + '";');
           WriteLn(ArchivoTexto, '# EXPONENTE DEL CERTIFICADO');
           WriteLn(ArchivoTexto, '$certificado["Exponent"]="' + xCertificadoEXPONENT.AsString + '";');
           WriteLn(ArchivoTexto, '# CERTIFICADO X509');
           WriteLn(ArchivoTexto, '$certificado["X509Certificate"]="' + xCertificadoLLAVE_PUBLICA_X509.AsString + '";');
           WriteLn(ArchivoTexto, '# LLAVE PRIVADA SIN CLAVE');
           WriteLn(ArchivoTexto, '$certificado["PrivKey"]="' + xCertificadoLLAVE_PRIVADA_RSA.AsString + '";');
           WriteLn(ArchivoTexto, '');
           WriteLn(ArchivoTexto, '?>');
        finally
           CloseFile(ArchivoTexto);
        end;

        FInformacionEnvioDte.MLog.Lines.Add(_('Obteniendo DTE firmado'));

        // Guardamos DTE en Xml
        AssignFile(ArchivoXml, DTEFirmado);
        try
           Rewrite(ArchivoXml);
           WriteLn(ArchivoXml, ExtraeDTEFirmado);
        finally
           CloseFile(ArchivoXml);
        end;

        // Enviamos DTE Firmado
        if not (UploadFile(UrlEnviaDte, DTEFirmado)) then
           ShowMessage(_('No se ha podido subir el XML del DTE'))
        else
        begin
           FInformacionEnvioDte.MLog.Lines.Add(_('Enviando DTE firmado'));
           // Si se ha enviado el fichero el DTE firmado enviamos archivo de texto
           if not (UploadFile(UrlEnviaFichero, FicheroTXT)) then
              ShowMessage(_('No se ha podido subir el XML del DTE'))
           else
           begin
              // Si se ha enviado el fichero el archivo eliminamos del temporal
              FInformacionEnvioDte.MLog.Lines.Add(_('Enviando EAC'));
              // DeleteFile(FicheroTXT);
           end;
           // DeleteFile(DTEFirmado);
        end;

        // Obtenemos respuesta
        ObtieneRespuestaDeEnvio;
        FInformacionEnvioDte.MLog.Lines.Add(_('Finalizado el factoring'));
     end;
  finally
     Screen.Cursor := crDefault;
     EnableTaskWindows(WndList);
     FInformacionEnvioDte.Close;
  end;
end;

procedure TDMFactoringChl.EnviaDocumentoFactoring(Proveedor, ID_S: integer);
begin
  GeneraFicheroFactoring(Proveedor, ID_S);
end;

function TDMFactoringChl.VerificaSmtpUsuario: boolean;
begin
  /// Verifica si tiene datos de configuracion SMTP para el usuario del entorno
  //Result := False;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SMTP_SERVIDOR, SMTP_USUARIO, SMTP_PASSWORD ');
        SQL.Add(' FROM SYS_USUARIOS ');
        SQL.Add(' WHERE ');
        SQL.Add(' USUARIO = :USUARIO ');

        Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
        ExecQuery;
        Result := ((FieldByName['SMTP_SERVIDOR'].AsString > '') and
           (FieldByName['SMTP_USUARIO'].AsString > '') and
           (FieldByName['SMTP_PASSWORD'].AsString > ''));
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
