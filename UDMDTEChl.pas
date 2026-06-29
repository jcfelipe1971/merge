unit UDMDTEChl;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Controls, Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, Dialogs, FIBDataSetRO, FIBTableDataSetRO, SysUtils,
  HYFIBQuery, XMLDoc, XMLIntf, Psock, NMpop3, NMMSG, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdPOP3, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdMessage, IdAttachment, ShellAPI,
  IdHTTP, Math;

type
  TDMDTEChl = class(TDataModule)
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
     xFacturaCabecera: TFIBDataSetRO;
     DSxFacturaCabecera: TDataSource;
     xTerceroClienteDte: TFIBDataSetRO;
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
     xTerceroClienteDtePAIS_DIRECCION: TFIBStringField;
     xTerceroClienteDtePROVINCIA_DIRECCION: TFIBStringField;
     xTerceroClienteDteREGION_DIRECCION: TFIBStringField;
     xTerceroClienteDtePOBLACION_DIRECCION: TFIBStringField;
     xTerceroClienteDteDIRECCION: TIntegerField;
     xTerceroClienteDteDIRECCION_LITERAL: TMemoField;
     xEmisor: TFIBDataSetRO;
     DSxEmisor: TDataSource;
     xEmisorNIF: TFIBStringField;
     xEmisorNOMBRE_R_SOCIAL: TFIBStringField;
     xEmisorTELEFONO01: TFIBStringField;
     xEmisorEMAIL: TFIBStringField;
     xEmisorDIR_COMPLETA_N: TFIBStringField;
     xEmisorTITULO_POBLACION: TFIBStringField;
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
     xCAF: TFIBDataSetRO;
     DSxCAF: TDataSource;
     xCAFXML_AUTORIZACION_FOLIOS: TMemoField;
     xCAFNUMERO_FINAL: TIntegerField;
     xCAFCONTADOR: TIntegerField;
     xCAFID: TIntegerField;
     xEmisorPOBLACION: TFIBStringField;
     xEmisorPROVINCIA: TFIBStringField;
     xEmisorREGION: TFIBStringField;
     xEmisorPAIS_DIRECCION: TFIBStringField;
     xEmisorWEB: TFIBStringField;
     DSxFacturaDetalle: TDataSource;
     xFacturaDetalle: TFIBDataSetRO;
     DSxFacCabeceraNIF: TDataSource;
     xFacCabeceraNIF: TFIBDataSetRO;
     xFacCabeceraNIFEMPRESA: TIntegerField;
     xFacCabeceraNIFEJERCICIO: TIntegerField;
     xFacCabeceraNIFCANAL: TIntegerField;
     xFacCabeceraNIFSERIE: TFIBStringField;
     xFacCabeceraNIFTIPO: TFIBStringField;
     xFacCabeceraNIFRIG: TIntegerField;
     xFacCabeceraNIFNOMBRE: TFIBStringField;
     xFacCabeceraNIFNIF: TFIBStringField;
     xFacCabeceraNIFDIRECCION: TFIBStringField;
     xFacCabeceraNIFC_POSTAL: TFIBStringField;
     xFacCabeceraNIFPROVINCIA: TFIBStringField;
     xFacCabeceraNIFID_S: TIntegerField;
     xFacCabeceraNIFPAIS: TFIBStringField;
     xFacCabeceraNIFLOCALIDAD: TFIBStringField;
     xFacCabeceraNIFTELEFONO01: TFIBStringField;
     xFacCabeceraNIFTELEFONO02: TFIBStringField;
     xFacCabeceraNIFTELEFAX: TFIBStringField;
     xFacCabeceraNIFEMAIL: TFIBStringField;
     xFacCabeceraNIFNOTAS: TMemoField;
     xFacCabeceraNIFCOLONIA: TFIBStringField;
     xFacCabeceraNIFTERCERO: TIntegerField;
     xFacCabeceraNIFCARNET_APLICADOR: TFIBStringField;
     xFacCabeceraNIFNOMBRE_CONTACTO: TFIBStringField;
     xFacCabeceraNIFCOMO_NOS_CONOCIERON: TIntegerField;
     xCertificadoSUCSII: TFIBStringField;
     xDteReferencias: TFIBDataSetRO;
     DSxDteReferencias: TDataSource;
     xDteReferenciasID_S: TIntegerField;
     xDteReferenciasNROLINREF: TIntegerField;
     xDteReferenciasID_S_REF: TIntegerField;
     xDteReferenciasTPODOCREF: TFIBStringField;
     xDteReferenciasFOLIOREF: TFIBStringField;
     xDteReferenciasFCHREF: TDateTimeField;
     xDteReferenciasCODREF: TIntegerField;
     xDteReferenciasRAZONREF: TFIBStringField;
     xDteReferenciasRUTOTR: TFIBStringField;
     xDteReferenciasFOLIO: TIntegerField;
     IdHTTP1: TIdHTTP;
     IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
     xFacturaCabeceraEMPRESA: TIntegerField;
     xFacturaCabeceraEJERCICIO: TIntegerField;
     xFacturaCabeceraCANAL: TIntegerField;
     xFacturaCabeceraSERIE: TFIBStringField;
     xFacturaCabeceraTIPO: TFIBStringField;
     xFacturaCabeceraRIG: TIntegerField;
     xFacturaCabeceraTERCERO: TIntegerField;
     xFacturaCabeceraB_COMISION: TFloatField;
     xFacturaCabeceraI_COMISION: TFloatField;
     xFacturaCabeceraLIQUIDO: TFloatField;
     xFacturaCabeceraNIF: TFIBStringField;
     xFacturaCabeceraFOLIO: TIntegerField;
     xFacturaCabeceraTIPO_DOC_TRIBUTARIO: TFIBStringField;
     xFacturaCabeceraSII_FMA_PAGO: TIntegerField;
     xFacturaCabeceraFECHA: TDateTimeField;
     xFacturaCabeceraVENCIMIENTO: TDateTimeField;
     xFacturaCabeceraID_TIPO_GIRO_CLIENTE: TIntegerField;
     xFacturaCabeceraID_TIPO_GIRO_EMPRESA: TIntegerField;
     xFacturaCabeceraCODIGO_GIRO_CLIENTE: TIntegerField;
     xFacturaCabeceraCODIGO_GIRO_EMPRESA: TIntegerField;
     xFacturaCabeceraDIR_COMPLETA: TFIBStringField;
     xFacturaCabeceraID_S: TIntegerField;
     xFacturaCabeceraCLIENTE: TIntegerField;
     xFacturaCabeceraSU_REFERENCIA: TFIBStringField;
     xFacturaDetalleORDEN: TIntegerField;
     xFacturaDetalleLINEA: TIntegerField;
     xFacturaDetalleARTICULO: TFIBStringField;
     xFacturaDetalleTITULO: TFIBStringField;
     xFacturaDetalleUNIDADES: TFloatField;
     xFacturaDetallePRECIO: TFloatField;
     xFacturaDetalleI_DESCUENTO: TFloatField;
     xFacturaDetalleNOTAS: TMemoField;
     xFacturaDetalleDESCUENTO: TFloatField;
     xFacturaDetalleSIGNO_UNIDADES: TFIBStringField;
     xFacturaDetalleTIPO_IVA: TIntegerField;
     xFacturaCabeceraINDTRASLADO: TIntegerField;
     xFacturaCabeceraTITULO_GIRO_CLIENTE: TFIBStringField;
     QMCabeceraFEChileTIPO_DOC_TRIBUTARIO: TFIBStringField;
     xFacturaDetalleLIQUIDO: TFloatField;
     xTerceroClienteDteDIR_NUMERO: TFIBStringField;
     procedure DMDTEChlCreate(Sender: TObject);
     procedure xFacturaCabeceraAfterOpen(DataSet: TDataSet);
     procedure xFacturaCabeceraBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     ID_S_DTE, ContadorNumeroEnvios: integer;
     CAF_RE, CAF_RS, CAF_TD, CAF_RNG_D, CAF_RNG_H, CAF_FA, CAF_RSAPK_M, CAF_RSAPK_E, CAF_RSAPK_IDK, CAF_FRMA, CAF_RSASK, CAF_RSAPUBK: string;
     CarpetaFichero, FicheroTXT, BaseNombreFicheros, UrlFactronicaBoletaElectronica: string;
     //XMLGenerado: WideString;
     //XMLGeneradoCliente: WideString;
     UrlImagenLogo: string;
     // TimbreElectronicoImg: WideString;
     //PdfDTECarta, PdfDTETicket: WideString;
     procedure ObtieneDatosFacturaDelfos;
     procedure ObtieneDatosDTE;
     procedure GeneraFicheroBoleta;
     procedure ObtieneDatosCertificado;
     procedure ObtieneDatosEmisor;
     procedure InsertaDatosFEChile(IdDoc: integer);
     procedure EliminaDatosFEChile(IdDoc: integer);
     function ExisteDatosFEChile(IdDoc: integer): boolean;
     procedure ObtieneDatosCAF;
     procedure AsignaFolioADocumento(IdDoc: integer);
     procedure ObtieneXMLCAF;
     procedure ObtieneDatosCabeceraNIF;
     procedure ValidaDatos;
     function ConsultaSiiChile(Pagina: string; Respuesta: TStrings): integer;
     {procedure LeerFicheroEnWideString(const NombreArchivo: string; var Resultado: WideString);}
     function VerificaSmtpDTE: boolean;
     function TerceroTieneCorreo(Tercero: integer; Tipo: string): boolean;
     procedure GeneraFicheroFacturaElectronica;
     procedure GeneraFicheroBoletaConsulta;
     procedure GeneraFicheroDteConsulta;
     function DameTituloEstadoBoleta(estado: string): string;
     function EnviaConsultaBoletaSII: boolean;
     function EnviaConsultaDteSII: boolean;
     function NCDeDocumentoExcento: boolean;
  public
     { Public declarations }
     procedure EnviaDTE(ID_S: integer);
     procedure EnviaConsultaDocumentoSII(ID_S: integer);
  end;

var
  DMDTEChl : TDMDTEChl;

implementation

uses UFBusca, UEntorno, UFormGest, UDMMain, UUtiles, UParam, UDMAdjunto, DateUtils, UHojaCalc, UDMListados, IdText, UFMAdjunto,
  UDMLstFactura, UFInformacionEnvioDte, UDMLstAlbaranes, UFMain, HttpConnectionWinInet, UlkJSON, UDameDato;

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

procedure TDMDTEChl.DMDTEChlCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  ID_S_DTE := 0;
  ContadorNumeroEnvios := 0;
end;

procedure TDMDTEChl.GeneraFicheroBoleta;
var
  ArchivoTexto : TextFile;
  //ArchivoXml : TextFile;
  //UrlEnviaFichero, FicheroRespuesta, FicheroAECFirmado : string;
  BE_Token : string;
  //NombreFichero, NombreFicheroDte : string;
  //Folio, TercerCesionario : integer;
  //TipoDocTributario, RutClienteDte, UrlFactronicaCesion, RutCedente : string;
  //DTEFirmado, CarpetaRemotaAlmacenamiento, UrlRespuesta, UrlEnviaDte, UrlAECFirmado : string;
  VlrCodigo, NmbItem, DscItem, QtyItem, DecQtyItem, UnmdItem, PrcItem, DecPrcItem, Excento : string;
  IndExe, MontoItem, DescuentoPct, DescuentoMonto, RecargoPct, RecargoMonto : string;
  RUTRecep, CdgIntRecep, RznSocRecep, GiroRecep, DirRecep, CmnaRecep, CiudadRecep, CorreoRecep, FonoRecep : string;
  SucursalSII : string;
  ModoPruebas : boolean;

  (*DTEExtraido, FileStream : string;*)
  function EliminaUltimoCaracter(Texto: string): string;
  begin
     Result := Copy(Texto, 0, Length(Texto) - 1);
  end;

begin
  ModoPruebas := (LeeParametro('DTEENVI005') = 'S');
  // Definimos Sucursal SII
  SucursalSII := xCertificadoSUCSII.AsString;

  if (SucursalSII = '') then
     SucursalSII := 'SANTIAGO CENTRO';

  BE_Token := 'token123';
  // Generamos el documento de Texto de la Boleta
  AssignFile(ArchivoTexto, FicheroTXT);
  try
     Rewrite(ArchivoTexto);
     WriteLn(ArchivoTexto, '<?php');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '$DatosBoletaElectronica = array( ');
     // WriteLn(ArchivoTexto, '$FACTRONICA = array( ');
     WriteLn(ArchivoTexto, '"TOKEN" => "' + BE_Token + '", ');

     WriteLn(ArchivoTexto, '// ################################');
     WriteLn(ArchivoTexto, '// # DATOS DEL PROCESO');
     WriteLn(ArchivoTexto, '// ################################');


     WriteLn(ArchivoTexto, '"SWENVIARSII"=>1 ,');

     //# OPCIONAL - SE UTILIZA PARA DEFINIR EL DIRECTORIO DONDE SERÁN ALMACENADOS LOS ARCHIVOS PDF DEL DOCUMENTO
     //# SI VA VACIO UTILIZARÁ POR DEFECTO: "../../home/".str_replace("-","",$jsonArray["RUTEmisor"])."/boletas";

     // WriteLn(ArchivoTexto, '"AlmacenPdf"=>"../../home/112223335",');
     WriteLn(ArchivoTexto, '"AlmacenPdf"=>"documentos",');
     WriteLn(ArchivoTexto, '');

     // OPCIONAL - SE UTILIZA PARA DEFINIR EL DIRECTORIO DONDE SERÁN ALMACENADOS LOS ARCHIVOS XML DEL DOCUMENTO');
     // SI VA VACIO UTILIZARÁ POR DEFECTO: "../../home/".str_replace("-","",$jsonArray["RUTEmisor"])."/boletas";');
     // WriteLn(ArchivoTexto, '"AlmacenXml"=>"documentos",');
     WriteLn(ArchivoTexto, '"AlmacenXml"=>"documentos",');
     WriteLn(ArchivoTexto, '');

     // OPCIONAL - SE UTILIZA PARA DEFINIR EL DIRECTORIO DONDE SERÁN ALMACENADOS LOS ARCHIVOS PNG CON EL TIMBRE PDF417 DEL DOCUMENTO');
     // SI VA VACIO UTILIZARÁ POR DEFECTO: "../../home/".str_replace("-","",$jsonArray["RUTEmisor"])."/boletas";');
     // WriteLn(ArchivoTexto, '"AlmacenPng"=>"documentos",');
     WriteLn(ArchivoTexto, '"AlmacenPng"=>"documentos",');
     WriteLn(ArchivoTexto, '');

     // OPCIONAL - SE UTILIZA PARA DEFINIR EL LOGO .PNG PARA INCLUIR EN EL PDF DEL DOCUMENTO');
     // SI VA VACIO UTILIZARÁ POR DEFECTO: "../../home/".str_replace("-","",$jsonArray["RUTEmisor"])."/logo.png";');

     WriteLn(ArchivoTexto, '"UrlLogo"=>"' + UrlImagenLogo + '",');
     WriteLn(ArchivoTexto, '');

     WriteLn(ArchivoTexto, '// ################################');
     WriteLn(ArchivoTexto, '// # DATOS DE LA CARATULA');
     WriteLn(ArchivoTexto, '// ################################');

     WriteLn(ArchivoTexto, '"RutEmisor" =>"' + xEmisorNIF.AsString + '",');
     WriteLn(ArchivoTexto, '"RutEnvia" =>"' + xCertificadoRUT.AsString + '",');
     WriteLn(ArchivoTexto, '"RutReceptor" =>"60803000-K", // aqui siempre va el rut del sii 60803000-K');
     WriteLn(ArchivoTexto, '"FchResol" =>"' + FormatDateTime('yyyy-mm-dd', xCertificadoFECHA_RESOLUCION.AsDateTime) + '",');

     if (ModoPruebas) then
        WriteLn(ArchivoTexto, '"NroResol" =>"0",')
     else
        WriteLn(ArchivoTexto, '"NroResol" =>"' + IntToStr(xCertificadoNRO_RESOLUCION.AsInteger) + '",');

     WriteLn(ArchivoTexto, '"SucSii" =>"' + SucursalSII + '",');
     WriteLn(ArchivoTexto, '');

     WriteLn(ArchivoTexto, '// ################################');
     WriteLn(ArchivoTexto, '// # DATOS DEL ENCABEZADO');
     WriteLn(ArchivoTexto, '// ################################');

     WriteLn(ArchivoTexto, '"FchEmis" =>"' + FormatDateTime('yyyy-mm-dd', xFacturaCabeceraFECHA.AsDateTime) + '",');
     WriteLn(ArchivoTexto, '"FchVenc" =>"' + FormatDateTime('yyyy-mm-dd', xFacturaCabeceraVENCIMIENTO.AsDateTime) + '",');
     WriteLn(ArchivoTexto, '"TermPagoGlosa" =>"CONTADO",'); // *********** Preguntar si es obligatorio y de donde se btiene ****** //
     WriteLn(ArchivoTexto, '"TipoDTE" =>"' + xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString + '",');
     WriteLn(ArchivoTexto, '"Folio" =>"' + IntToStr(xFacturaCabeceraFOLIO.AsInteger) + '",');
     WriteLn(ArchivoTexto, '"RazonRef" =>"",');
     WriteLn(ArchivoTexto, '"MntBruto"=>"' + FloatToStrDec(QMCabeceraFEChileMNTBRUTO.AsFloat, '.', '0.00') + '",');
     WriteLn(ArchivoTexto, '"Observaciones" =>"",');
     WriteLn(ArchivoTexto, '"Proyecto" =>"",'); // *********** Preguntar si es obligatorio y de donde se btiene ****** //
     WriteLn(ArchivoTexto, '');

     WriteLn(ArchivoTexto, '// ################################');
     WriteLn(ArchivoTexto, '// # DATOS DEL EMISOR');
     WriteLn(ArchivoTexto, '// ################################');

     WriteLn(ArchivoTexto, '"RUTEmisor" =>"' + xEmisorNIF.AsString + '",');
     WriteLn(ArchivoTexto, '"RznSoc" =>"' + QuitarAcentosTexto(xEmisorNOMBRE_R_SOCIAL.AsString) + '",');
     WriteLn(ArchivoTexto, '"GiroEmis" =>"' + QuitarAcentosTexto(DameTituloCodigoGiro(xFacturaCabeceraCODIGO_GIRO_EMPRESA.AsInteger)) + '",');
     WriteLn(ArchivoTexto, '"Acteco" =>"' + QuitarAcentosTexto(xFacturaCabeceraCODIGO_GIRO_EMPRESA.AsString) + '",');
     WriteLn(ArchivoTexto, '"CdgSIISucur" =>"13000",');// *********** Preguntar si es obligatorio y de donde se btiene ****** //
     WriteLn(ArchivoTexto, '"DirOrigen" =>"' + QuitarAcentosTexto(xEmisorDIR_COMPLETA_N.AsString) + '",');
     WriteLn(ArchivoTexto, '"CmnaOrigen" =>"' + QuitarAcentosTexto(xEmisorTITULO_POBLACION.AsString) + '",');
     WriteLn(ArchivoTexto, '"CiudadOrigen" =>"' + QuitarAcentosTexto(DameTituloProvincia(xEmisorPAIS_DIRECCION.AsString, xEmisorPROVINCIA.AsString)) + '",');
     WriteLn(ArchivoTexto, '"CdgVendedor"=>"VENTAS OFICINA",');// *********** Preguntar si es obligatorio y de donde se btiene ****** //
     WriteLn(ArchivoTexto, '"CorreoEmisor" =>"' + xEmisorEMAIL.AsString + '",');
     WriteLn(ArchivoTexto, '"Web" =>"' + xEmisorWEB.AsString + '",');
     WriteLn(ArchivoTexto, '"Telefono" =>"' + xEmisorTELEFONO01.AsString + '",');
     WriteLn(ArchivoTexto, '"Fax" =>"",');
     WriteLn(ArchivoTexto, '');

     WriteLn(ArchivoTexto, '// ################################');
     WriteLn(ArchivoTexto, '// # DATOS DEL RECEPTOR');
     WriteLn(ArchivoTexto, '// ################################');
     ObtieneDatosCabeceraNIF;

     //Asignamos datos por defecto del receptor
     RUTRecep := '11111111-1';
     CdgIntRecep := '1111';
     RznSocRecep := 'PUBLICO GENERAL';
     GiroRecep := 'PUBLICO GENERAL';
     DirRecep := 'SIN DIRECCION';
     CmnaRecep := 'SIN COMUNA';
     CiudadRecep := 'SIN CIUDAD';
     CorreoRecep := 'PUBLICO GENERAL';
     FonoRecep := '569...';

     if (xFacturaCabeceraCLIENTE.AsInteger > 0) then
     begin
        RUTRecep := xTerceroClienteDteNIF.AsString;
        CdgIntRecep := IntToStr(xFacturaCabeceraCLIENTE.AsInteger);
        RznSocRecep := xTerceroClienteDteNOMBRE_COMERCIAL.AsString;
        GiroRecep := DameTituloCodigoGiro(xFacturaCabeceraCODIGO_GIRO_CLIENTE.AsInteger);
        DirRecep := xTerceroClienteDteDIR_NOMBRE.AsString;
        CmnaRecep := xTerceroClienteDteTITULO_POBLACION.AsString;
        CiudadRecep := xTerceroClienteDteTITULO_PROVINCIA.AsString;
        CorreoRecep := xTerceroClienteDteEMAIL.AsString;
        FonoRecep := xTerceroClienteDteTELEFONO01.AsString;
     end
     else if ((xFacCabeceraNIF.RecordCount > 0)) then // Si tiene datos del cliente
     begin
        if (xFacCabeceraNIFNIF.AsString > '') then
           RUTRecep := xFacCabeceraNIFNIF.AsString;

        if (xFacCabeceraNIFNOMBRE.AsString > '') then
           RznSocRecep := xFacCabeceraNIFNOMBRE.AsString;

        if (xFacCabeceraNIFDIRECCION.AsString > '') then
           DirRecep := xFacCabeceraNIFDIRECCION.AsString;

        if (xFacCabeceraNIFPROVINCIA.AsString > '') then
           CmnaRecep := xFacCabeceraNIFPROVINCIA.AsString;

        if (xFacCabeceraNIFPROVINCIA.AsString > '') then
           CiudadRecep := xFacCabeceraNIFPROVINCIA.AsString;

        if (xFacCabeceraNIFEMAIL.AsString > '') then
           CorreoRecep := xFacCabeceraNIFEMAIL.AsString;

        if (xFacCabeceraNIFTELEFONO01.AsString > '') then
           FonoRecep := xFacCabeceraNIFTELEFONO01.AsString;
     end;

     WriteLn(ArchivoTexto, '"RUTRecep"=>"' + RUTRecep + '",');
     WriteLn(ArchivoTexto, '"CdgIntRecep"=>"' + CdgIntRecep + '",');// *********** Preguntar si es obligatorio y de donde se btiene ****** //
     WriteLn(ArchivoTexto, '"RznSocRecep"=>"' + QuitarAcentosTexto(RznSocRecep) + '",');
     WriteLn(ArchivoTexto, '"GiroRecep"=>"' + QuitarAcentosTexto(GiroRecep) + '",');
     WriteLn(ArchivoTexto, '"DirRecep"=>"' + QuitarAcentosTexto(DirRecep) + '",');
     WriteLn(ArchivoTexto, '"CmnaRecep"=>"' + QuitarAcentosTexto(CmnaRecep) + '",');
     WriteLn(ArchivoTexto, '"CiudadRecep"=>"' + QuitarAcentosTexto(CiudadRecep) + '",');
     WriteLn(ArchivoTexto, '"Contacto"=>"PUBLICO GENERAL",');// *********** Preguntar si es obligatorio y de donde se btiene ****** //
     WriteLn(ArchivoTexto, '"CorreoRecep"=>"' + QuitarAcentosTexto(CorreoRecep) + '",');
     WriteLn(ArchivoTexto, '"FonoRecep"=>"' + QuitarAcentosTexto(FonoRecep) + '",');
     WriteLn(ArchivoTexto, '');
     WriteLn(ArchivoTexto, '');

     WriteLn(ArchivoTexto, '// ################################');
     WriteLn(ArchivoTexto, '// # TOTALES');
     WriteLn(ArchivoTexto, '// ################################');

     WriteLn(ArchivoTexto, '"TasaIVA" => "' + FloatToStr(QMCabeceraFEChileTASAIVA.AsFloat) + '",');
     WriteLn(ArchivoTexto, '"MntNeto" => "' + FloatToStr(QMCabeceraFEChileMNTNETO.AsFloat) + '",');
     WriteLn(ArchivoTexto, '"MntExe" => "' + FloatToStr(QMCabeceraFEChileMNTEXE.AsFloat) + '",');
     WriteLn(ArchivoTexto, '"IVA" => "' + FloatToStr(QMCabeceraFEChileIVA.AsFloat) + '",');
     WriteLn(ArchivoTexto, '"MontoNF"=>"0",   // Corresponde a la suma de montos de bienes o servicios con Indicador exención = 2 y 6  ***********'); // *********** Preguntar si es obligatorio y de donde se btiene ****** //
     WriteLn(ArchivoTexto, '"MntTotal" => "' + FloatToStr(xFacturaCabeceraLIQUIDO.AsFloat) + '",');
     WriteLn(ArchivoTexto, '');

     WriteLn(ArchivoTexto, '// ################################');
     WriteLn(ArchivoTexto, '// # DETALLE DE ITEMS');
     WriteLn(ArchivoTexto, '// ################################');

     // Recorremos detalle para obtener datos
     VlrCodigo := '';
     NmbItem := '';
     DscItem := '';
     QtyItem := '';
     DecQtyItem := '';
     UnmdItem := '';
     PrcItem := '';
     DecPrcItem := '';
     IndExe := '';
     MontoItem := '';

     DescuentoPct := '';
     DescuentoMonto := '';
     RecargoPct := '';
     RecargoMonto := '';

     with xFacturaDetalle do
     begin
        First;
        while not EOF do
        begin
           VlrCodigo := VlrCodigo + '"' + xFacturaDetalleARTICULO.AsString + '",';
           NmbItem := NmbItem + '"' + QuitarAcentosTexto(xFacturaDetalleTITULO.AsString) + '",';
           DscItem := DscItem + '"' + QuitarAcentosTexto(xFacturaDetalleTITULO.AsString) + '",';
           QtyItem := QtyItem + '"' + FloatToStrDec(xFacturaDetalleUNIDADES.AsFloat, '.', '0.00') + '",';
           DecQtyItem := DecQtyItem + '"2",';
           UnmdItem := UnmdItem + '"' + xFacturaDetalleSIGNO_UNIDADES.AsString + '",';
           PrcItem := PrcItem + '"' + FloatToStrDec(xFacturaDetallePRECIO.AsFloat, '.', '0.00') + '",';
           DecPrcItem := DecPrcItem + '"2",';

           if (xFacturaDetalleTIPO_IVA.AsInteger = 0) then
              Excento := '1'
           else
              Excento := '0';

           IndExe := IndExe + '"' + Excento + '",';
           MontoItem := MontoItem + '"' + FormatAmount((xFacturaDetallePRECIO.AsFloat * xFacturaDetalleUNIDADES.AsFloat) - xFacturaDetalleI_DESCUENTO.AsFloat, 0) + '",';
           // Descuentos
           DescuentoPct := DescuentoPct + '"' + FloatToStrDec(xFacturaDetalleDESCUENTO.AsFloat, '.', '0.00') + '",';
           DescuentoMonto := DescuentoMonto + '"' + FormatAmount(xFacturaDetalleI_DESCUENTO.AsFloat, 0) + '",';

           Next;
        end;
     end;

     WriteLn(ArchivoTexto, '"VlrCodigo"=>array(' + EliminaUltimoCaracter(VlrCodigo) + '),');
     WriteLn(ArchivoTexto, '"NmbItem"=>array(' + EliminaUltimoCaracter(NmbItem) + '),');
     WriteLn(ArchivoTexto, '"DscItem"=>array(' + EliminaUltimoCaracter(DscItem) + '),');// Descripcion extendida
     WriteLn(ArchivoTexto, '"QtyItem"=>array(' + EliminaUltimoCaracter(QtyItem) + '),'); // Cantidades de articulos
     WriteLn(ArchivoTexto, '"DecQtyItem"=>array(' + EliminaUltimoCaracter(DecQtyItem) + '),'); // Decimales de la cantidad de cada articulo
     WriteLn(ArchivoTexto, '"UnmdItem"=>array(' + EliminaUltimoCaracter(UnmdItem) + '),'); // Unidades de medida de articulos  "KG","UN"
     WriteLn(ArchivoTexto, '"PrcItem"=>array(' + EliminaUltimoCaracter(PrcItem) + '),'); // Precios de articulos
     WriteLn(ArchivoTexto, '"DecPrcItem"=>array(' + EliminaUltimoCaracter(DecPrcItem) + '),');// Decimales del precio de cada articulo
     WriteLn(ArchivoTexto, '"IndExe"=>array(' + EliminaUltimoCaracter(IndExe) + '),');  // 0=afecto 1=exento 2=no_facturable  6=no_facturable_negativo ***********
     WriteLn(ArchivoTexto, '"MontoItem"=>array(' + EliminaUltimoCaracter(MontoItem) + '),');
     WriteLn(ArchivoTexto, '');

     WriteLn(ArchivoTexto, '// ################################');
     WriteLn(ArchivoTexto, '// # DESCUENTOS Y/O RECARGO EN ITEMS');
     WriteLn(ArchivoTexto, '// ################################');

     WriteLn(ArchivoTexto, '"DescuentoPct"=>array(' + EliminaUltimoCaracter(DescuentoPct) + '),');
     WriteLn(ArchivoTexto, '"DescuentoMonto"=>array(' + EliminaUltimoCaracter(DescuentoMonto) + '),');
     WriteLn(ArchivoTexto, '"RecargoPct"=>array(),');
     WriteLn(ArchivoTexto, '"RecargoMonto"=>array(),');
     WriteLn(ArchivoTexto, '');
     WriteLn(ArchivoTexto, '');

     WriteLn(ArchivoTexto, '// ################################');
     WriteLn(ArchivoTexto, '// # DESCUENTO O RECARGO GLOBAL');
     WriteLn(ArchivoTexto, '// ################################');

     WriteLn(ArchivoTexto, '"NroLinDR" => array(),');
     WriteLn(ArchivoTexto, '"TpoMov" => array(), // D=Descuento R=Recargo');
     WriteLn(ArchivoTexto, '"GlosaDR" => array(),');
     WriteLn(ArchivoTexto, '"TpoValor" => array(),   // % o $');
     WriteLn(ArchivoTexto, '"ValorDR" => array(),  // tasa% o monto$');
     WriteLn(ArchivoTexto, '"IndExeDR" => array(), // 0=afectos 1=exentos');
     WriteLn(ArchivoTexto, '');

     WriteLn(ArchivoTexto, '// ################################');
     WriteLn(ArchivoTexto, '// # DATOS DEL PROVEEDOR');
     WriteLn(ArchivoTexto, '// ################################');

     WriteLn(ArchivoTexto, '"PROVEEDOR_NOMBRE"=>"DELFOS ERP",');
     WriteLn(ArchivoTexto, '"PROVEEDOR_MAIL"=>"marcelonogales@delfos.net",');
     WriteLn(ArchivoTexto, '"PROVEEDOR_WEB"=>"delfosonline.cl",');
     WriteLn(ArchivoTexto, '"PROVEEDOR_FONO"=>"996700972",');
     WriteLn(ArchivoTexto, '');
     WriteLn(ArchivoTexto, '');

     WriteLn(ArchivoTexto, '// ################################');
     WriteLn(ArchivoTexto, '// # CERTIFICADO DIGITAL');
     WriteLn(ArchivoTexto, '// ################################');

     WriteLn(ArchivoTexto, '"Modulus"=>"' + xCertificadoMODULO.AsString + '",');
     WriteLn(ArchivoTexto, '');
     WriteLn(ArchivoTexto, '"Exponent"=>"' + xCertificadoEXPONENT.AsString + '",');
     WriteLn(ArchivoTexto, '');
     WriteLn(ArchivoTexto, '"X509Certificate"=>"' + xCertificadoLLAVE_PUBLICA_X509.AsString + '",');
     WriteLn(ArchivoTexto, '');
     WriteLn(ArchivoTexto, '"PrivKey"=>"' + xCertificadoLLAVE_PRIVADA_RSA.AsString + '",');
     WriteLn(ArchivoTexto, '');
     WriteLn(ArchivoTexto, '');

     WriteLn(ArchivoTexto, '// ################################');
     WriteLn(ArchivoTexto, '// # CAF TIMBRAJE DE FOLIOS');
     WriteLn(ArchivoTexto, '// ################################');

     WriteLn(ArchivoTexto, '"RE"=>"' + CAF_RE + '",');
     WriteLn(ArchivoTexto, '"RS"=>"' + CAF_RS + '",');
     WriteLn(ArchivoTexto, '"TD"=>"' + CAF_TD + '",');
     WriteLn(ArchivoTexto, '"RNG_D"=>"' + CAF_RNG_D + '",');
     WriteLn(ArchivoTexto, '"RNG_H"=>"' + CAF_RNG_H + '",');
     WriteLn(ArchivoTexto, '"FA"=>"' + CAF_FA + '",');
     WriteLn(ArchivoTexto, '"RSAPK_M"=>"' + CAF_RSAPK_M + '",');
     WriteLn(ArchivoTexto, '"RSAPK_E"=>"' + CAF_RSAPK_E + '",');
     WriteLn(ArchivoTexto, '"RSAPK_IDK"=>"' + CAF_RSAPK_IDK + '",');
     WriteLn(ArchivoTexto, '"FRMA"=>"' + CAF_FRMA + '",');
     WriteLn(ArchivoTexto, '"RSASK"=>"' + CAF_RSASK + '",');
     WriteLn(ArchivoTexto, '"RSAPUBK"=>"' + CAF_RSAPUBK + '"');
     WriteLn(ArchivoTexto, '');
     WriteLn(ArchivoTexto, ');');
     WriteLn(ArchivoTexto, '?>');
  finally
     CloseFile(ArchivoTexto);
  end;
end;

procedure TDMDTEChl.GeneraFicheroFacturaElectronica;
var
  ArchivoTexto{, ArchivoXml} : TextFile;
  BE_Token : string;
  VlrCodigo, NmbItem, DscItem, QtyItem, DecQtyItem, UnmdItem, PrcItem, DecPrcItem, Excento, TpoCodigo : string;
  IndExe, MontoItem, DescuentoPct, DescuentoMonto, RecargoPct, RecargoMonto : string;
  RUTRecep, CdgIntRecep, RznSocRecep, GiroRecep, DirRecep, CmnaRecep, CiudadRecep, CorreoRecep, FonoRecep, TermPagoGlosa : string;
  NroLinRef, TpoDocRef, FolioRef, FchRef, CodRef, RazonRef : string;
  //UrlFactronica : string;
  SucursalSII : string;
  Factor : double;
  Vencimiento : TDateTime;
  Liquido : double;
  MedioPago : string;
  ModoPruebas : boolean;

  (*DTEExtraido, FileStream : string;*)
  function EliminaUltimoCaracter(Texto: string): string;
  begin
     Result := Copy(Texto, 0, Length(Texto) - 1);
  end;

begin

  // Definimos Sucursal SII
  SucursalSII := xCertificadoSUCSII.AsString;

  ModoPruebas := (LeeParametro('DTEENVI005') = 'S');

  if (SucursalSII = '') then
     SucursalSII := 'SANTIAGO CENTRO';

  //Asignamos factor -1 para aplicar a las Notas de credito
  if (xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString = '61') then
     Factor := -1
  else
     Factor := 1;

  BE_Token := 'accesoapitest';
  // Generamos el documento de Texto de la Boleta
  AssignFile(ArchivoTexto, FicheroTXT);
  try
     Rewrite(ArchivoTexto);
     WriteLn(ArchivoTexto, '<?php');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# ARRAY CON DATOS PARA EMITIR FACTURA ELECTRÓNICA TIPO 33');
     WriteLn(ArchivoTexto, '$arregloJson = array(');

     WriteLn(ArchivoTexto, '# TOKEN DE ACCESO A LA API');
     WriteLn(ArchivoTexto, '"TOKEN" => "accesoapitest",');

     WriteLn(ArchivoTexto, '# RUT EMPRESA EMITE FACTURA');
     WriteLn(ArchivoTexto, '"RUTEMISOR"=>"' + xEmisorNIF.AsString + '",');

     WriteLn(ArchivoTexto, '# DATOS DEL PROCESO');
     WriteLn(ArchivoTexto, '"ACCION" => "INSERTAR",');
     WriteLn(ArchivoTexto, '"DOCUMENTO"=>"FACTURA",');
     WriteLn(ArchivoTexto, '"FOLIODTE"=>"' + IntToStr(xFacturaCabeceraFOLIO.AsInteger) + '",');
     WriteLn(ArchivoTexto, '"TIPODTE"=>"' + xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString + '",');
     WriteLn(ArchivoTexto, '"FECHADTE"=>"' + FormatDateTime('yyyy-mm-dd', xFacturaCabeceraFECHA.AsDateTime) + '",');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '"UrlLogo"=>"' + UrlImagenLogo + '",');
     WriteLn(ArchivoTexto, '# DATOS DE LA CARATULA');
     WriteLn(ArchivoTexto, '"RutEmisor" =>"' + xEmisorNIF.AsString + '",');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# RUT CERTIFICADO DIGITAL');
     WriteLn(ArchivoTexto, '"RutEnvia" =>"' + xCertificadoRUT.AsString + '",');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# aqui siempre va el rut del sii 60803000-K');
     WriteLn(ArchivoTexto, '"RutReceptor" =>"60803000-K",');
     WriteLn(ArchivoTexto, '"FchResol" =>"' + FormatDateTime('yyyy-mm-dd', xCertificadoFECHA_RESOLUCION.AsDateTime) + '",');

     if (ModoPruebas) then
        WriteLn(ArchivoTexto, '"NroResol" =>"0",')
     else
        WriteLn(ArchivoTexto, '"NroResol" =>"' + IntToStr(xCertificadoNRO_RESOLUCION.AsInteger) + '",');

     WriteLn(ArchivoTexto, '"SucSii" =>"' + SucursalSII + '",');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# DATOS DEL ENCABEZADO');
     WriteLn(ArchivoTexto, '"FchEmis" =>"' + FormatDateTime('yyyy-mm-dd', xFacturaCabeceraFECHA.AsDateTime) + '",');

     if (xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString <> '52') then // No se toma en cuenta para la Guia de despacho
        WriteLn(ArchivoTexto, '"FchVenc" =>"' + FormatDateTime('yyyy-mm-dd', xFacturaCabeceraVENCIMIENTO.AsDateTime) + '",');

     //Solo para guia
     if (xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString = '52') then
        WriteLn(ArchivoTexto, '"IndTraslado" =>"' + IntToStr(xFacturaCabeceraINDTRASLADO.AsInteger) + '",');

     // Montos de Pago
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST 1 D.VENCIMIENTO AS VENCIMIENTO, D.LIQUIDO AS LIQUIDO, T.MEDIO_PAGO_FACTURAE_CL ');
           SQL.Add(' FROM EMP_CARTERA C ');
           SQL.Add(' JOIN EMP_CARTERA_DETALLE D ON C.ID_CARTERA = D.ID_CARTERA ');
           SQL.Add(' JOIN SYS_TIPO_EFECTO T ON D.TIPO_EFECTO = T.TIPO ');
           SQL.Add(' WHERE ');
           SQL.Add(' C.ID_DOC = :ID_DOC AND ');
           SQL.Add(' C.SIGNO = ''C'' AND ');
           SQL.Add(' D.VISIBLE = 1 ');
           SQL.Add(' ORDER BY VENCIMIENTO ASC ');
           Params.ByName['ID_DOC'].AsInteger := ID_S_DTE;
           ExecQuery;
           Vencimiento := FieldByName['VENCIMIENTO'].AsDateTime;
           Liquido := FieldByName['LIQUIDO'].AsFloat * Factor;
           MedioPago := FieldByName['MEDIO_PAGO_FACTURAE_CL'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if ((xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString = '52') or ((xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString = '61') and (xDteReferenciasCODREF.AsInteger = 2))) then //Si es Guia de despacho la fecha de vencimiento se obtien del documento then
        Vencimiento := xFacturaCabeceraFECHA.AsDateTime;

     WriteLn(ArchivoTexto, '"FchPago" =>"' + FormatDateTime('yyyy-mm-dd', Vencimiento) + '",');
     WriteLn(ArchivoTexto, '"MntPago" =>"' + FloatToStrDec(Liquido, '.', '0.00') + '",');   //FormatAmount(Liquido, 0);

     WriteLn(ArchivoTexto, '"FmaPago" =>"' + IntToStr(xFacturaCabeceraSII_FMA_PAGO.AsInteger) + '",');

     TermPagoGlosa := '';
     if (xFacturaCabeceraSII_FMA_PAGO.AsInteger = 1) then
        TermPagoGlosa := 'CONTADO'
     else
     if (xFacturaCabeceraSII_FMA_PAGO.AsInteger = 2) then
        TermPagoGlosa := 'CREDITO'
     else
     if (xFacturaCabeceraSII_FMA_PAGO.AsInteger = 3) then
        TermPagoGlosa := 'SIN COSTO';

     WriteLn(ArchivoTexto, '"TermPagoGlosa" =>"' + TermPagoGlosa + '",');
     WriteLn(ArchivoTexto, '"TipoDTE" =>"' + xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString + '",');
     WriteLn(ArchivoTexto, '"Folio" =>"' + IntToStr(xFacturaCabeceraFOLIO.AsInteger) + '",');
     WriteLn(ArchivoTexto, '"IndServicio" =>"' + IntToStr(QMCabeceraFEChileINDSERVICIO.AsInteger) + '",');
     if ((QMCabeceraFEChileINDSERVICIO.AsInteger = 1) or (QMCabeceraFEChileINDSERVICIO.AsInteger = 2)) then
     begin
        WriteLn(ArchivoTexto, '"PeriodoDesde" =>"' + FormatDateTime('yyyy-mm-dd', xFacturaCabeceraFECHA.AsDateTime) + '",');
        WriteLn(ArchivoTexto, '"PeriodoHasta" =>"' + FormatDateTime('yyyy-mm-dd', xFacturaCabeceraFECHA.AsDateTime) + '",');
     end;
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# EN DETALLE DE ITEMS 1=VALORES_BRUTOS 0=VALORES_NETOS');
     WriteLn(ArchivoTexto, '"MntBruto"=>"' + FloatToStrDec(QMCabeceraFEChileMNTBRUTO.AsFloat, '.', '0.00') + '",');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# COMENTARIOS');
     WriteLn(ArchivoTexto, '"Observaciones" =>"",');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# DATOS DEL EMISOR');
     WriteLn(ArchivoTexto, '"RUTEmisor" =>"' + xEmisorNIF.AsString + '",');
     WriteLn(ArchivoTexto, '"RznSoc" =>"' + QuitarAcentosTexto(xEmisorNOMBRE_R_SOCIAL.AsString) + '",');
     WriteLn(ArchivoTexto, '"GiroEmis" =>"' + QuitarAcentosTexto(DameTituloCodigoGiro(xFacturaCabeceraCODIGO_GIRO_EMPRESA.AsInteger)) + '",');
     WriteLn(ArchivoTexto, '"Acteco" =>"' + QuitarAcentosTexto(xFacturaCabeceraCODIGO_GIRO_EMPRESA.AsString) + '",');
     WriteLn(ArchivoTexto, '"CdgSIISucur" =>"12312",');
     WriteLn(ArchivoTexto, '"DirOrigen" =>"' + QuitarAcentosTexto(xEmisorDIR_COMPLETA_N.AsString) + '",');
     WriteLn(ArchivoTexto, '"CmnaOrigen" =>"' + QuitarAcentosTexto(xEmisorTITULO_POBLACION.AsString) + '",');
     WriteLn(ArchivoTexto, '"CiudadOrigen" =>"' + QuitarAcentosTexto(DameTituloProvincia(xEmisorPAIS_DIRECCION.AsString, xEmisorPROVINCIA.AsString)) + '",');
     WriteLn(ArchivoTexto, '"CdgVendedor"=>"VENTAS OFICINA",');
     WriteLn(ArchivoTexto, '"CorreoEmisor" =>"' + xEmisorEMAIL.AsString + '",');
     WriteLn(ArchivoTexto, '"Web" =>"' + xEmisorWEB.AsString + '",');
     WriteLn(ArchivoTexto, '"Telefono" =>"' + xEmisorTELEFONO01.AsString + '",');
     WriteLn(ArchivoTexto, '"Fax" =>"",');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# DATOS DEL RECEPTOR');

     // Obtenemos datos cabecera NIF
     ObtieneDatosCabeceraNIF;

     // Definimos valores por defecto para el receptor
     RUTRecep := '77777777-7';
     CdgIntRecep := '1111';
     RznSocRecep := 'PUBLICO GENERAL';
     GiroRecep := 'PUBLICO GENERAL';
     DirRecep := 'SIN DIRECCION';
     CmnaRecep := 'SIN COMUNA';
     CiudadRecep := 'SIN CIUDAD';
     CorreoRecep := 'PUBLICO GENERAL';
     FonoRecep := '569...';

     if (xFacturaCabeceraCLIENTE.AsInteger > 0) then
     begin
        RUTRecep := xTerceroClienteDteNIF.AsString;
        CdgIntRecep := IntToStr(xFacturaCabeceraCLIENTE.AsInteger);
        RznSocRecep := xTerceroClienteDteNOMBRE_R_SOCIAL.AsString;
        // GiroRecep := DameTituloCodigoGiro(xFacturaCabeceraCODIGO_GIRO_CLIENTE.AsInteger);
        GiroRecep := Copy(xFacturaCabeceraTITULO_GIRO_CLIENTE.AsString, 1, 40);
        DirRecep := xTerceroClienteDteDIR_NOMBRE.AsString + ', ' + IntToStr(xTerceroClienteDteDIR_NUMERO.AsInteger);
        CmnaRecep := xTerceroClienteDteTITULO_POBLACION.AsString;
        CiudadRecep := xTerceroClienteDteTITULO_PROVINCIA.AsString;
        CorreoRecep := xTerceroClienteDteEMAIL.AsString;
        FonoRecep := xTerceroClienteDteTELEFONO01.AsString;
     end
     else if (xFacCabeceraNIF.RecordCount > 0) then // Si tiene datos del cliente
     begin
        if (xFacCabeceraNIFNIF.AsString > '') then
           RUTRecep := xFacCabeceraNIFNIF.AsString;

        if (xFacCabeceraNIFNOMBRE.AsString > '') then
           RznSocRecep := xFacCabeceraNIFNOMBRE.AsString;

        if (xFacCabeceraNIFDIRECCION.AsString > '') then
           DirRecep := xFacCabeceraNIFDIRECCION.AsString;

        if (xFacCabeceraNIFPROVINCIA.AsString > '') then
           CmnaRecep := xFacCabeceraNIFPROVINCIA.AsString;

        if (xFacCabeceraNIFPROVINCIA.AsString > '') then
           CiudadRecep := xFacCabeceraNIFPROVINCIA.AsString;

        if (xFacCabeceraNIFEMAIL.AsString > '') then
           CorreoRecep := xFacCabeceraNIFEMAIL.AsString;

        if (xFacCabeceraNIFTELEFONO01.AsString > '') then
           FonoRecep := xFacCabeceraNIFTELEFONO01.AsString;
     end;

     WriteLn(ArchivoTexto, '"RUTRecep"=>"' + RUTRecep + '",');
     WriteLn(ArchivoTexto, '"CdgIntRecep"=>"' + CdgIntRecep + '",');
     WriteLn(ArchivoTexto, '"RznSocRecep"=>"' + QuitarAcentosTexto(RznSocRecep) + '",');
     WriteLn(ArchivoTexto, '"GiroRecep"=>"' + QuitarAcentosTexto(GiroRecep) + '",');
     WriteLn(ArchivoTexto, '"DirRecep"=>"' + QuitarAcentosTexto(DirRecep) + '",');
     WriteLn(ArchivoTexto, '"CmnaRecep"=>"' + QuitarAcentosTexto(CmnaRecep) + '",');
     WriteLn(ArchivoTexto, '"CiudadRecep"=>"' + QuitarAcentosTexto(CiudadRecep) + '",');
     WriteLn(ArchivoTexto, '"Contacto"=>"PUBLICO GENERAL",');
     WriteLn(ArchivoTexto, '"CorreoRecep"=>"' + QuitarAcentosTexto(CorreoRecep) + '",');
     WriteLn(ArchivoTexto, '"FonoRecep"=>"' + QuitarAcentosTexto(FonoRecep) + '",');

     // Datos transporte para Guia
     if (xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString = '52') then
     begin
        WriteLn(ArchivoTexto, '"CmnaDest"=>"' + QuitarAcentosTexto(QMCabeceraFEChileCMNADEST.AsString) + '",');
        WriteLn(ArchivoTexto, '"CiudadDest"=>"' + QuitarAcentosTexto(QMCabeceraFEChileCIUDADDEST.AsString) + '",');
     end;

     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# TOTALES');
     if (
        (xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString = '34') or
        (xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString = '41') or
        (
        (xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString = '61') and
        (NCDeDocumentoExcento)
        )
        ) then
        WriteLn(ArchivoTexto, '"MntExe" => "' + FloatToStr(QMCabeceraFEChileMNTEXE.AsInteger * Factor) + '",')
     else
     begin
        WriteLn(ArchivoTexto, '"TasaIVA" => "' + FloatToStr(QMCabeceraFEChileTASAIVA.AsInteger) + '",');
        WriteLn(ArchivoTexto, '"MntNeto" => "' + FloatToStr(QMCabeceraFEChileMNTNETO.AsInteger * Factor) + '",');
        WriteLn(ArchivoTexto, '"IVA" => "' + FloatToStr(QMCabeceraFEChileIVA.AsInteger * Factor) + '",');
     end;
     WriteLn(ArchivoTexto, '"MntTotal" => "' + FloatToStr(xFacturaCabeceraLIQUIDO.AsInteger * Factor) + '",');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '#########################################');
     WriteLn(ArchivoTexto, '# DETALLE DE ITEMS');
     WriteLn(ArchivoTexto, '#########################################');

     // Recorremos detalle para obtener datos
     VlrCodigo := '';
     NmbItem := '';
     DscItem := '';
     QtyItem := '';
     DecQtyItem := '';
     UnmdItem := '';
     PrcItem := '';
     DecPrcItem := '';
     IndExe := '';
     MontoItem := '';
     TpoCodigo := '';

     DescuentoPct := '';
     DescuentoMonto := '';
     RecargoPct := '';
     RecargoMonto := '';

     with xFacturaDetalle do
     begin
        First;
        while not EOF do
        begin
           VlrCodigo := VlrCodigo + '"' + xFacturaDetalleARTICULO.AsString + '",';
           TpoCodigo := TpoCodigo + '"CHAR",';
           NmbItem := NmbItem + '"' + QuitarAcentosTexto(xFacturaDetalleTITULO.AsString) + '",';
           DscItem := DscItem + '"' + QuitarAcentosTexto(xFacturaDetalleTITULO.AsString) + '",';
           QtyItem := QtyItem + '"' + FloatToStrDec(xFacturaDetalleUNIDADES.AsFloat, '.', '0.00') + '",';
           DecQtyItem := DecQtyItem + '"2",';
           UnmdItem := UnmdItem + '"' + xFacturaDetalleSIGNO_UNIDADES.AsString + '",';
           PrcItem := PrcItem + '"' + FloatToStrDec(xFacturaDetallePRECIO.AsFloat, '.', '0.00') + '",';
           DecPrcItem := DecPrcItem + '"2",';

           if (xFacturaDetalleTIPO_IVA.AsInteger = 0) then
              Excento := '1'
           else
              Excento := '0';

           IndExe := IndExe + '"' + Excento + '",';
           MontoItem := MontoItem + '"' + FormatAmount(((xFacturaDetallePRECIO.AsFloat * xFacturaDetalleUNIDADES.AsFloat) - xFacturaDetalleI_DESCUENTO.AsFloat) * Factor, 0) + '",';

           // Descuentos
           DescuentoPct := DescuentoPct + '"' + FloatToStrDec(xFacturaDetalleDESCUENTO.AsFloat, '.', '0.00') + '",';
           DescuentoMonto := DescuentoMonto + '"' + FormatAmount(xFacturaDetalleI_DESCUENTO.AsFloat, 0) + '",';

           Next;
        end;
     end;

     WriteLn(ArchivoTexto, '# CODIGO DEL ITEM');
     WriteLn(ArchivoTexto, '"VlrCodigo"=>array(' + EliminaUltimoCaracter(VlrCodigo) + '),');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# TIPO DE CODIGO DEL ITEM');
     WriteLn(ArchivoTexto, '"TpoCodigo"=>array(' + EliminaUltimoCaracter(TpoCodigo) + '),');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# NOMBRE DEL ITEM');
     WriteLn(ArchivoTexto, '"NmbItem"=>array(' + EliminaUltimoCaracter(NmbItem) + '),');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# DESCRIPCION EXTENDIDA DEL ITEM');
     WriteLn(ArchivoTexto, '"DscItem"=>array(' + EliminaUltimoCaracter(DscItem) + '),');// Descripcion extendida
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# CANTIDAD');
     WriteLn(ArchivoTexto, '"QtyItem"=>array(' + EliminaUltimoCaracter(QtyItem) + '),'); // Cantidades de articulos
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# DECIMALES PARA LA CANTIDAD');
     WriteLn(ArchivoTexto, '"DecQtyItem"=>array(' + EliminaUltimoCaracter(DecQtyItem) + '),'); // Decimales de la cantidad de cada articulo
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# UNIDAD DE MEDIDA');
     WriteLn(ArchivoTexto, '"UnmdItem"=>array(' + EliminaUltimoCaracter(UnmdItem) + '),'); // Unidades de medida de articulos  "KG","UN"
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# PRECIO UNITARIO');
     WriteLn(ArchivoTexto, '"PrcItem"=>array(' + EliminaUltimoCaracter(PrcItem) + '),'); // Precios de articulos
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# DECIMALES PARA EL PRECIO UNITARIO');
     WriteLn(ArchivoTexto, '"DecPrcItem"=>array(' + EliminaUltimoCaracter(DecPrcItem) + '),');// Decimales del precio de cada articulo
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# INDICADOR DE ITEM EXENTO 1=SI 0=NO');
     WriteLn(ArchivoTexto, '"IndExe"=>array(' + EliminaUltimoCaracter(IndExe) + '),');  // 0=afecto 1=exento 2=no_facturable  6=no_facturable_negativo ***********
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# PORCENTAJE DE DESCUENTO DEL ITEM');
     WriteLn(ArchivoTexto, '"DescuentoPct"=>array(' + EliminaUltimoCaracter(DescuentoPct) + '),');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# DESCUENTO EN PESOS DEL ITEM');
     WriteLn(ArchivoTexto, '"DscItemPesos"=>array(' + EliminaUltimoCaracter(DescuentoMonto) + '),');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# SUBTOTAL DEL ITEM');
     WriteLn(ArchivoTexto, '"MontoItem"=>array(' + EliminaUltimoCaracter(MontoItem) + '),');

     WriteLn(ArchivoTexto, '#########################################');
     WriteLn(ArchivoTexto, '# REFERENCIAS');
     WriteLn(ArchivoTexto, '#########################################');
     WriteLn(ArchivoTexto, '#');

     with xDteReferencias do
     begin
        First;
        while not EOF do
        begin
           NroLinRef := NroLinRef + IntToStr(xDteReferenciasNROLINREF.AsInteger) + ',';
           TpoDocRef := TpoDocRef + '"' + xDteReferenciasTPODOCREF.AsString + '",';
           FolioRef := FolioRef + '"' + xDteReferenciasFOLIOREF.AsString + '",';
           FchRef := FchRef + '"' + FormatDateTime('yyyy-mm-dd', xDteReferenciasFCHREF.AsDateTime) + '",';
           CodRef := CodRef + IntToStr(xDteReferenciasCODREF.AsInteger) + ',';
           RazonRef := RazonRef + '"' + xDteReferenciasRAZONREF.AsString + '",';
           Next;
        end;
     end;

     WriteLn(ArchivoTexto, '# NUMERO DE REFERENCIA 1,2,3,ETC...');
     WriteLn(ArchivoTexto, '"NroLinRef"=>array(' + NroLinRef + '),');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# TIPO DE DTE AL CUAL REFERENCIA');
     WriteLn(ArchivoTexto, '"TpoDocRef"=>array(' + TpoDocRef + '),');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# SE APLICA PARA FACTURACION MASIVA DE GUIA');
     WriteLn(ArchivoTexto, '"IndGlobal"=>array(),');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# FOLIO DEL DTE QUE SE REFERENCIA');
     WriteLn(ArchivoTexto, '"FolioRef"=>array(' + FolioRef + '),');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# FECHA DEL DTE QUE SE REFERENCIA');
     WriteLn(ArchivoTexto, '"FchRef"=>array(' + FchRef + '),');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# MOTIVO 1=ANULA  2=CORRIGE_TEXTO   3=CORRIGE_VALORES');
     WriteLn(ArchivoTexto, '"CodRef"=>array(' + CodRef + '),');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '# COMENTARIO INDICANDO MOTIVO DE LA REFERENCIA');
     WriteLn(ArchivoTexto, '"RazonRef"=>array(' + RazonRef + '),');

     WriteLn(ArchivoTexto, '#########################################');
     WriteLn(ArchivoTexto, '# DATOS SERVIDOR DE CORREO');
     WriteLn(ArchivoTexto, '#########################################');
     WriteLn(ArchivoTexto, '"SMTP_HOST"=>"",');                // VARIABLE - OPCIONAL - HOST DEL SERVIDOR DE CORREO ( SI VA VACIO EL SISTEMA UTILIZO CUENTA PROPIA PARA ENVIAR MAIL )
     WriteLn(ArchivoTexto, '"SMTP_PORT"=>"",');                               // VARIABLE - OPCIONAL - PUERTO DE ENVIO DEL MAIL 25, 465 or 587
     WriteLn(ArchivoTexto, '"SMTP_SECURE"=>"",');                             // VARIABLE - OPCIONAL - SEGURIDAD tls O ssl o vacio
     WriteLn(ArchivoTexto, '"SMTP_USER"=>"",');                    // VARIABLE - OPCIONAL - CORREO DE ENVIADOR  ( SI VA VACIO EL SISTEMA UTILIZO CUENTA PROPIA PARA ENVIAR MAIL )
     WriteLn(ArchivoTexto, '"SMTP_PASS"=>"",');

     WriteLn(ArchivoTexto, '#########################################');
     WriteLn(ArchivoTexto, '# ENVIAR COPIAS DE CORREO');
     WriteLn(ArchivoTexto, '#########################################');
     WriteLn(ArchivoTexto, '"CORREO_CC1"=>"",');                           // VARIABLE - OPCIONAL - COPIA 1 DE CORREO DESTINO
     WriteLn(ArchivoTexto, '"CORREO_CC2"=>"",');                           // VARIABLE - OPCIONAL - COPIA 2 DE CORREO DESTINO
     WriteLn(ArchivoTexto, '"CORREO_BCC1"=>"",');                          // VARIABLE - OPCIONAL - COPIA OCULTA 1 DE CORREO DESTINO
     WriteLn(ArchivoTexto, '"CORREO_BCC2"=>"",');                           // VARIABLE - OPCIONAL - COPIA OCULTA 2 DE CORREO DESTINO
     WriteLn(ArchivoTexto, '"CORREO_RESPUESTA"=>"marcelonogales@delfos.net",');                           // VARIABLE - OPCIONAL - COPIA OCULTA 2 DE CORREO DESTINO

     WriteLn(ArchivoTexto, '#########################################');
     WriteLn(ArchivoTexto, '# DATOS DEL PROVEEDOR');
     WriteLn(ArchivoTexto, '#########################################');
     WriteLn(ArchivoTexto, '"PROVEEDOR_NOMBRE"=>"DELFOS ERP",');
     WriteLn(ArchivoTexto, '"PROVEEDOR_MAIL"=>"gabriel@delfos.net",');
     WriteLn(ArchivoTexto, '"PROVEEDOR_WEB"=>"delfos.net",');
     WriteLn(ArchivoTexto, '"PROVEEDOR_FONO"=>"56996700972",');

     WriteLn(ArchivoTexto, '#########################################');
     WriteLn(ArchivoTexto, '# CERTIFICADO DIGITAL');
     WriteLn(ArchivoTexto, '#########################################');
     WriteLn(ArchivoTexto, '"Modulus"=>"' + xCertificadoMODULO.AsString + '",');
     WriteLn(ArchivoTexto, '"Exponent"=>"' + xCertificadoEXPONENT.AsString + '",');
     WriteLn(ArchivoTexto, '"X509Certificate"=>"' + xCertificadoLLAVE_PUBLICA_X509.AsString + '",');
     WriteLn(ArchivoTexto, '"PrivKey"=>"' + xCertificadoLLAVE_PRIVADA_RSA.AsString + '",');

     WriteLn(ArchivoTexto, '#########################################');
     WriteLn(ArchivoTexto, '# CAF TIMBRAJE DE FOLIOS');
     WriteLn(ArchivoTexto, '#########################################');
     WriteLn(ArchivoTexto, '"RE"=>"' + CAF_RE + '",');
     WriteLn(ArchivoTexto, '"RS"=>"' + CAF_RS + '",');
     WriteLn(ArchivoTexto, '"TD"=>"' + CAF_TD + '",');
     WriteLn(ArchivoTexto, '"RNG_D"=>"' + CAF_RNG_D + '",');
     WriteLn(ArchivoTexto, '"RNG_H"=>"' + CAF_RNG_H + '",');
     WriteLn(ArchivoTexto, '"FA"=>"' + CAF_FA + '",');
     WriteLn(ArchivoTexto, '"RSAPK_M"=>"' + CAF_RSAPK_M + '",');
     WriteLn(ArchivoTexto, '"RSAPK_E"=>"' + CAF_RSAPK_E + '",');
     WriteLn(ArchivoTexto, '"RSAPK_IDK"=>"' + CAF_RSAPK_IDK + '",');
     WriteLn(ArchivoTexto, '"FRMA"=>"' + CAF_FRMA + '",');
     WriteLn(ArchivoTexto, '"RSASK"=>"' + CAF_RSASK + '",');
     WriteLn(ArchivoTexto, '"RSAPUBK"=>"' + CAF_RSAPUBK + '"');
     WriteLn(ArchivoTexto, ');');
     WriteLn(ArchivoTexto, '?>');
  finally
     CloseFile(ArchivoTexto);
  end;
end;

procedure TDMDTEChl.EnviaDTE(ID_S: integer);
var
  WndList : Pointer;
  Contenido, Respuesta : TStrings;
  //CodigoRespuesta : integer;
  UrlEnviaFicheroTexto : string;
  UrlEnviaBoletaDte : string;
  BaseUrl : string;
  UrlFactronicaDTE : string;
  ResultadoConsultaSiiChile : integer;
  BaseNombreFicheros2 : string;
  Documento, NodoPadre : TlkJSONbase;
  //Nodo : TlkJSONbase;
  //FicheroTemporalJson : TStrings;
  TrackID, EstadoRespuesta, MensajeRespuesta : string;
  BaseNombre, FicheroPdfCarta, FicheroDTEFirmado, FicheroSetFirmadoSII : string;
  FicheroSetFirmadoCliente, FicheroPdfTicket, FicheroPngTimbre : string;
  FicheroXmlTrackID, UrlCarpetaDocumentos : string;
  XMLGenerado, XMLGeneradoCliente, PDFDTECarta, PDFDTETicket : TStrings;
  //TimbreElectronicoImg : WideString;
  n : TStream;
  AMemoryStream : TMemoryStream;
  PDFStream : TFileStream;
  FicherosEnviar : TStrings;
  Asunto : string;
  param_DTEENVI002 : string;
  NombreFichero : string;
  CuerpoMail : TStrings;
  XmlEnviadoCliente : boolean;
  FicheroPdfEnvio : string;
  //UrlEnviaDTEFicheroTexto : string;
  SiiSemilla : string;
  DocumentoRespuesta : TXMLDocument;
  FicheroPDF : string;
  FicheroXML, FicheroXMLCliente, DescripcionError : string;
  Memo : TStrings;
  ConSemilla : boolean;
  NumeroEnvios : integer;
begin
  DMMain.Log('Inicio Envio DTE');
  NumeroEnvios := 20;
  Inc(ContadorNumeroEnvios);
  Contenido := TStringList.Create;
  Respuesta := TStringList.Create;
  ID_S_DTE := ID_S;
  ConSemilla := True;
  DescripcionError := '';
  try
     FInformacionEnvioDte := TFInformacionEnvioDte.Create(Self);
     WndList := DisableTaskWindows(FInformacionEnvioDte.Handle);
     with FInformacionEnvioDte do
     begin
        LBLGeneral.Caption := _('Inicializando envio...');
        MLog.Lines.Clear;
        Show;
     end;

     // Obtenemos datos factura Delfos
     ObtieneDatosFacturaDelfos;

     DMMain.Log('Numero de envio:' + IntToStr(ContadorNumeroEnvios));
     FInformacionEnvioDte.MLog.Lines.Add('Numero de envio:' + IntToStr(ContadorNumeroEnvios));


     DMMain.Log('Obtenemos datos factura Delfos');
     FInformacionEnvioDte.MLog.Lines.Add(_('Obeniendo datos factura Delfos'));


     // Obtiene Datos del Certificado
     ObtieneDatosCertificado;
     DMMain.Log('Obeniendo datos del certificado');
     FInformacionEnvioDte.MLog.Lines.Add(_('Obeniendo datos del certificado'));

     // Obtenemos datos DTE
     ObtieneDatosDTE;
     DMMain.Log('Obeniendo datos del DTE');
     FInformacionEnvioDte.MLog.Lines.Add(_('Obeniendo datos del DTE'));

     // Asignamos numero de folio a documento
     AsignaFolioADocumento(ID_S_DTE);
     DMMain.Log('Asignando numero de folio a documento');
     FInformacionEnvioDte.MLog.Lines.Add(_('Asignando numero de folio a documento'));

     with FInformacionEnvioDte do
     begin
        Caption := _('Enviando DTE al SII');
        LTipoDocTributario.Caption := DameTituloTipoDocTributario(xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString);
        LRutReceptor.Caption := QMCabeceraFEChileRUTRECEP.AsString;
        LRig.Caption := IntToStr(xFacturaCabeceraRIG.AsInteger);
        LFolio.Caption := IntToStr(xFacturaCabeceraFOLIO.AsInteger);
        LCliente.Caption := QMCabeceraFEChileRZNSOCRECEP.AsString;
        MLog.Lines.Add(_('Preparando datos documento'));
     end;

     // Obtenemos datos del CAF
     ObtieneXMLCAF;
     DMMain.Log('Obteniendo datos del XML del CAF');
     FInformacionEnvioDte.MLog.Lines.Add(_('Obteniendo datos del XML del CAF'));

     // Obtenemos datos del CAF
     ObtieneDatosCAF;
     DMMain.Log('Leyendo datos del CAF');
     FInformacionEnvioDte.MLog.Lines.Add(_('Leyendo datos del CAF'));

     // Obtiene Datos Emisor
     ObtieneDatosEmisor;
     DMMain.Log('Obteniendo datos del emisor');
     FInformacionEnvioDte.MLog.Lines.Add(_('Obteniendo datos del emisor'));


     // Guardamos informacion de documento en datos de envio del DTE ventas
     DMMain.Log('Guardamos informacion de documento en datos de envio del DTE ventas');
     if not (ExisteDatosFEChile(ID_S_DTE)) then
        InsertaDatosFEChile(ID_S_DTE)
     else
        raise Exception.Create(_('Ya existe un registro de envio de este documento'));

     DMMain.Log('Guardamos informacion de documento en datos de envio del DTE ventas');
     FInformacionEnvioDte.MLog.Lines.Add(_('Guardamos informacion de documento en datos de envio del DTE ventas'));

     // Actualizamos informacion del DTE
     QMCabeceraFEChile.Close;
     QMCabeceraFEChile.Open;

     DMMain.Log('Validamos datos');
     ValidaDatos;

     // Carpeta documentos del usuario windows
     DMMain.Log('Definimos ficheros');

     CarpetaFichero := IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, False));

     BaseNombreFicheros := xEmisorNIF.AsString + '_' + xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString + '_' + xFacturaCabeceraFOLIO.AsString + '.php';
     BaseNombreFicheros2 := xEmisorNIF.AsString + '_' + xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString + '_' + xFacturaCabeceraFOLIO.AsString;
     FicheroTXT := CarpetaFichero + BaseNombreFicheros;
     BaseUrl := DMMain.DameUrlEndPoint('FAC');

     // Definimos url del logo del documento
     UrlImagenLogo := BaseUrl + '/imagenes/logos/' + UpperCase(xEmisorNIF.AsString) + '.png';
     DMMain.Log('UrlImagenLogo:' + UrlImagenLogo);


     if ((xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString = '39') or (xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString = '41')) then
     begin
        UrlFactronicaBoletaElectronica := BaseUrl + '/' + 'factronica_boleta_creardte';
        UrlEnviaFicheroTexto := UrlFactronicaBoletaElectronica + '/recepcionFichero.php';
        UrlEnviaBoletaDte := UrlFactronicaBoletaElectronica + '/envia_json_boleta.php?NombreFichero=' + BaseNombreFicheros2;
        // Generamos fichero TXT  de envio para boleta electronica
        GeneraFicheroBoleta;
        DMMain.Log('Generamos fichero para Boleta electronica');
     end
     else
     if (
        (xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString = '33') or
        (xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString = '34') or
        (xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString = '52') or
        (xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString = '56') or
        (xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString = '61')) then
     begin
        UrlFactronicaDTE := BaseUrl + '/' + 'factronica_creadte_facturas';
        UrlEnviaFicheroTexto := UrlFactronicaDTE + '/recepcionFichero.php';
        UrlEnviaBoletaDte := UrlFactronicaDTE + '/envia_json_dte.php?NombreFichero=' + BaseNombreFicheros2;
        // Generamos fichero TXT  de envio para factura electronica
        GeneraFicheroFacturaElectronica;
        DMMain.Log('Generamos fichero para Boleta electronica');
     end;

     // Envia fichero texto del documento
     if not (UploadFile(UrlEnviaFicheroTexto, FicheroTXT)) then
     begin
        ShowMessage(_('No se ha podido subir el fichero texto de la Boleta'));
        DMMain.Log('No se ha podido subir el fichero texto de la Boleta');
     end
     else
     begin
        // DeleteFile(FicheroTXT);
        DMMain.Log('Fichero de texto enviado');
     end;

     // Se hace la solicitud de envio de la boleta al SII
     ResultadoConsultaSiiChile := ConsultaSiiChile(UrlEnviaBoletaDte, Respuesta);
     DMMain.Log('ResultadoConsultaSiiChile:' + IntToStr(ResultadoConsultaSiiChile));
     DMMain.Log('RespuestaConsultaSiiChile:' + Respuesta.Text);
     Documento := TlkJSON.ParseText(Respuesta.Text);

     (*  //***Comentado para pruebas
     FicheroTemporalJson := TStringList.Create;
     FicheroTemporalJson.LoadFromFile(IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, False)) + 'respuestaJson.txt');
     Documento := TlkJSON.ParseText(FicheroTemporalJson.Text);
     *)
     MensajeRespuesta := '';
     try
        if ((xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString = '39') or (xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString = '41')) then
        begin
           if Assigned(Documento) then
           begin
              DMMain.Log('Lee respuesta json de envio de Documento');
              // Verificamos si tiene estado del envio la respuesta
              NodoPadre := Documento.Field['estado'];
              if Assigned(NodoPadre) then
              begin
                 EstadoRespuesta := NodoPadre.Field['estado'].Value;
                 DMMain.Log('EstadoRespuesta:' + EstadoRespuesta);

                 NodoPadre := Documento.Field['trackid'];
                 if Assigned(NodoPadre) then
                 begin
                    TrackID := NodoPadre.Field['trackid'].Value;
                    DMMain.Log('TrackID:' + TrackID);
                 end
                 else
                    DMMain.Log('No se ha podio obtener el TrackID');

                 NodoPadre := Documento.Field['mensaje'];
                 if Assigned(NodoPadre) then
                 begin
                    MensajeRespuesta := NodoPadre.Field['mensaje'].Value;
                    DMMain.Log('MensajeRespuesta:' + MensajeRespuesta);
                 end
                 else
                    DMMain.Log('No se ha podio obtener el Mensaje de respuesta');
              end
              else
                 raise Exception.Create(_('No se ha podido obtener los datos de la respuesta'));
           end;
           // Definimos nombre ficheros
           BaseNombre := 'FOLIO' + IntToStr(xFacturaCabeceraFOLIO.AsInteger) + '_TIPO' + xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString + '_RUT' + StringReplace(xEmisorNIF.AsString, '-', '', [rfReplaceAll]);
           FicheroPdfCarta := BaseNombre + '_CARTA.pdf';
           FicheroDTEFirmado := BaseNombre + '_DTEFIRMADO.xml';
           FicheroSetFirmadoSII := BaseNombre + '_SETFIRMADO_SII.xml';
           FicheroSetFirmadoCliente := BaseNombre + '_SETFIRMADO_CLI.xml';
           FicheroPdfTicket := BaseNombre + '_TICKET.pdf';
           FicheroPngTimbre := BaseNombre + '_TIMBRE.png';
           FicheroXmlTrackID := BaseNombre + '_TRACKID.xml';
           UrlCarpetaDocumentos := UrlFactronicaBoletaElectronica + '/documentos';
        end
        else
        begin
           // Verificamos si tiene estado del envio la respuesta
           if Assigned(Documento) then
           begin
              DMMain.Log('Lee respuesta json de envio de DTE');
              NodoPadre := Documento.Field['siiSemilla'];
              if Assigned(NodoPadre) then
              begin
                 SiiSemilla := NodoPadre.Field['siiSemilla'].Value;
                 ConSemilla := True;
                 DMMain.Log('SiiSemilla:' + SiiSemilla);
                 FInformacionEnvioDte.MLog.Lines.Add(_('Se obtuvo la semilla: ' + SiiSemilla));
              end
              else
              begin
                 NodoPadre := Documento.Field['Error'];
                 if Assigned(NodoPadre) then
                 begin
                    DescripcionError := NodoPadre.Field['Error'].Value;
                    if (Trim(DescripcionError) = 'SII Ocupado No Hay Token') then
                       ConSemilla := False;
                    DMMain.Log('Error:' + DescripcionError);
                    FInformacionEnvioDte.MLog.Lines.Add(_('Se genero el error: ' + DescripcionError));
                 end;
              end;
           end;

           if ((ConSemilla) and (ContadorNumeroEnvios < NumeroEnvios)) then
           begin
              // Definimos nombre ficheros
              BaseNombre := 'FOLIO' + IntToStr(xFacturaCabeceraFOLIO.AsInteger) + '_TIPO' + xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString + '_RUT' + StringReplace(xEmisorNIF.AsString, '-', '', [rfReplaceAll]);
              FicheroPdfCarta := BaseNombre + '_CARTA.pdf';
              FicheroDTEFirmado := BaseNombre + '_DTEFIRMADO.xml';
              FicheroSetFirmadoSII := BaseNombre + '_SETFIRMADO_SII.xml';
              FicheroSetFirmadoCliente := BaseNombre + '_SETFIRMADO_CLI.xml';
              FicheroPdfTicket := BaseNombre + '_CARTA_TICKET.pdf';
              FicheroPngTimbre := BaseNombre + '_TIMBRE.png';
              FicheroXmlTrackID := BaseNombre + '_TRACKID.xml';
              BaseUrl := DMMain.DameUrlEndPoint('DTE');
              UrlCarpetaDocumentos := BaseUrl + '/home/' + StringReplace(xEmisorNIF.AsString, '-', '', [rfReplaceAll]) + '/ventas';
              DMMain.Log('UrlCarpetaDocumentos: ' + UrlCarpetaDocumentos);
           end;
        end;

        if ((ConSemilla) and (ContadorNumeroEnvios < NumeroEnvios)) then
        begin
           // Descargamos ficheros
           if (DescargaFichero(UrlCarpetaDocumentos + '/' + FicheroPdfCarta, CarpetaFichero + FicheroPdfCarta)) then
           begin
              PDFDTECarta := TStringList.Create;
              PDFDTECarta.LoadFromFile(CarpetaFichero + FicheroPdfCarta);
              DMMain.Log('Se descargo el fichero: ' + UrlCarpetaDocumentos + '/' + FicheroPdfCarta);
           end
           else
              DMMain.Log('No se pudo descargar el fichero: ' + UrlCarpetaDocumentos + '/' + FicheroPdfCarta);

           if (DescargaFichero(UrlCarpetaDocumentos + '/' + FicheroDTEFirmado, CarpetaFichero + FicheroDTEFirmado)) then
              DMMain.Log('Se descargo el fichero: ' + UrlCarpetaDocumentos + '/' + FicheroDTEFirmado)
           else
              DMMain.Log('No se pudo descargar el fichero: ' + UrlCarpetaDocumentos + '/' + FicheroDTEFirmado);

           if (DescargaFichero(UrlCarpetaDocumentos + '/' + FicheroSetFirmadoSII, CarpetaFichero + FicheroSetFirmadoSII)) then
           begin
              DMMain.Log('Se descargo el fichero: ' + UrlCarpetaDocumentos + '/' + FicheroSetFirmadoSII);
              XMLGenerado := TStringList.Create;
              XMLGenerado.LoadFromFile(CarpetaFichero + FicheroSetFirmadoSII);
           end
           else
              DMMain.Log('No se pudo descargar el fichero: ' + UrlCarpetaDocumentos + '/' + FicheroSetFirmadoSII);

           if (DescargaFichero(UrlCarpetaDocumentos + '/' + FicheroSetFirmadoCliente, CarpetaFichero + FicheroSetFirmadoCliente)) then
           begin
              DMMain.Log('Se descargo el fichero: ' + UrlCarpetaDocumentos + '/' + FicheroSetFirmadoCliente);
              XMLGeneradoCliente := TStringList.Create;
              XMLGeneradoCliente.LoadFromFile(CarpetaFichero + FicheroSetFirmadoSII);
           end
           else
              DMMain.Log('No se pudo descargar el fichero: ' + UrlCarpetaDocumentos + '/' + FicheroSetFirmadoCliente);

           if (DescargaFichero(UrlCarpetaDocumentos + '/' + FicheroPdfTicket, CarpetaFichero + FicheroPdfTicket)) then
           begin
              PDFDTETicket := TStringList.Create;
              PDFDTETicket.LoadFromFile(CarpetaFichero + FicheroPdfTicket);
              DMMain.Log('Se descargo el fichero: ' + UrlCarpetaDocumentos + '/' + FicheroPdfTicket);
           end
           else
              DMMain.Log('No se pudo descargar el fichero: ' + UrlCarpetaDocumentos + '/' + FicheroPdfTicket);

           if (DescargaFichero(UrlCarpetaDocumentos + '/' + FicheroPngTimbre, CarpetaFichero + FicheroPngTimbre)) then
           begin
              DMMain.Log('Se descargo el fichero: ' + UrlCarpetaDocumentos + '/' + FicheroPngTimbre);
              // TimbreElectronicoImg := TStringList.Create;
              // TimbreElectronicoImg.LoadFromFile(CarpetaFichero + FicheroPngTimbre);
           end
           else
              DMMain.Log('No se pudo descargar el fichero: ' + UrlCarpetaDocumentos + '/' + FicheroPngTimbre);

           if (DescargaFichero(UrlCarpetaDocumentos + '/' + FicheroXmlTrackID, CarpetaFichero + FicheroXmlTrackID)) then
           begin
              //Leemos datos del fichero de respuesta
              DMMain.Log('Se descargo el fichero: ' + UrlCarpetaDocumentos + '/' + FicheroXmlTrackID);

              if ((xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString <> '39') and (xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString <> '41')) then
              begin
                 DocumentoRespuesta := TXMLDocument.Create(Self);
                 try
                    with DocumentoRespuesta do
                    begin
                       XML.LoadFromFile(CarpetaFichero + FicheroXmlTrackID);

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
                       // Obtenemos el trackID
                       TrackId := DameDato(DocumentElement, ['TRACKID']);
                       DMMain.Log('TrackId' + TrackId);

                       // Obtenemos xml generado
                       EstadoRespuesta := DameDato(DocumentElement, ['STATUS']);

                       if (EstadoRespuesta = '0') then
                       begin
                          EstadoRespuesta := 'DTE RECIBIDO';
                          MensajeRespuesta := 'DTE RECIBIDO CORRECTAMENTE POR EL SII.';
                       end;

                           {if ((FolioNumeroFinal = FolioContador) and (FolioNumeroFinal = QMDTEFOLIO.AsInteger)) then
                           begin
                              with THYFIBQuery.Create(nil) do
                              begin
                                 try
                                    Close;
                                    DataBase := DMMain.DataBase;
                                    SQL.Text := 'UPDATE SII_FOLIOS SET ACTIVO = 0 WHERE ID = :ID ';
                                    Params.ByName['ID'].AsInteger := FolioId;
                                    ExecQuery;
                                    FreeHandle;
                                 finally
                                    Free;
                                 end;
                              end;
                           end;}

                    end;
                 finally
                    DocumentoRespuesta.Free;
                 end;
              end;
           end
           else
              DMMain.Log('No se pudo descargar el fichero: ' + UrlCarpetaDocumentos + '/' + FicheroXmlTrackID);

           // Guardamos los datos y ficheros generados en la base de datos
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
                    SelectSQL.Add(' SELECT * FROM GES_CABECERAS_S_FE_CHL  ');
                    SelectSQL.Add(' WHERE ');
                    SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
                    SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
                    SelectSQL.Add(' CANAL = :CANAL AND ');
                    SelectSQL.Add(' TIPO_DOC_TRIBUTARIO = :TIPO_DOC_TRIBUTARIO AND ');
                    SelectSQL.Add(' FOLIO = :FOLIO');

                    UpdateSQL.Add(' UPDATE GES_CABECERAS_S_FE_CHL ');
                    UpdateSQL.Add(' SET ');
                    UpdateSQL.Add(' XML_GENERADO = :XML_GENERADO, ');
                    UpdateSQL.Add(' XML_GENERADO_CLIENTE = :XML_GENERADO_CLIENTE, ');
                    UpdateSQL.Add(' XML_RESPUESTA = :XML_RESPUESTA, ');
                    UpdateSQL.Add(' SII_TRACKID = :SII_TRACKID, ');
                    UpdateSQL.Add(' CANTIDAD_ERRORES = :CANTIDAD_ERRORES, ');
                    UpdateSQL.Add(' MENSAJE_ERROR = :MENSAJE_ERROR, ');
                    UpdateSQL.Add(' TIMBRE_TEXTO = :TIMBRE_TEXTO, ');
                    UpdateSQL.Add(' TIMBRE_COD_BARRA = :TIMBRE_COD_BARRA, ');
                    UpdateSQL.Add(' ESTADO = :ESTADO, ');
                    UpdateSQL.Add(' GLOSA = :GLOSA, ');
                    UpdateSQL.Add(' PDF_DTE_CARTA = :PDF_DTE_CARTA, ');
                    UpdateSQL.Add(' PDF_DTE_TICKET = :PDF_DTE_TICKET ');
                    UpdateSQL.Add(' WHERE ');
                    UpdateSQL.Add(' EMPRESA = :EMPRESA AND ');
                    UpdateSQL.Add(' EJERCICIO = :EJERCICIO AND ');
                    UpdateSQL.Add(' CANAL = :CANAL AND ');
                    UpdateSQL.Add(' TIPO_DOC_TRIBUTARIO = :TIPO_DOC_TRIBUTARIO AND ');
                    UpdateSQL.Add(' FOLIO = :FOLIO ');

                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                    Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                    Params.ByName['TIPO_DOC_TRIBUTARIO'].AsString := xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString;
                    Params.ByName['FOLIO'].AsInteger := xFacturaCabeceraFOLIO.AsInteger;

                    Open;
                    Edit;

                    FieldByName('XML_GENERADO').Value := XMLGenerado.Text;

                    FieldByName('XML_GENERADO_CLIENTE').Value := XMLGeneradoCliente.Text;

                    FieldByName('XML_RESPUESTA').Value := Respuesta.Text;
                    FieldByName('CANTIDAD_ERRORES').Value := {CantidadErrores}0;
                    FieldByName('MENSAJE_ERROR').Value := {Copy(MensageError, 1, 100)}'';
                    FieldByName('SII_TRACKID').Value := TrackId;
                    FieldByName('ESTADO').Value := EstadoRespuesta;
                    FieldByName('GLOSA').Value := MensajeRespuesta;
                    FieldByName('TIMBRE_TEXTO').Value := {XMLTimbreElectronico}'';

                    DMMain.Log('Guardamos el timbre en memorystream');
                    n := CreateBlobStream(FieldByName('TIMBRE_COD_BARRA'), bmWrite);
                    try
                       AMemoryStream := TMemoryStream.Create;
                       with AMemoryStream do
                       begin
                          try
                             AMemoryStream.LoadFromFile(CarpetaFichero + FicheroPngTimbre);
                             // s := WideString(EncodeBase64(AMemoryStream.Memory, AMemoryStream.Size));
                             Position := 0;
                             n.CopyFrom(AMemoryStream, AMemoryStream.Size);
                          finally
                             Free;
                          end;
                       end;
                    finally
                       n.Free;
                    end;

                    // Guardamos Pdf DTE Carta
                    DMMain.Log('Guardamos Pdf DTE Carta en memorystream');
                    n := CreateBlobStream(FieldByName('PDF_DTE_CARTA'), bmRead);
                    try
                       try
                          PDFStream := TFileStream.Create(CarpetaFichero + FicheroPdfCarta, fmOpenRead);
                          try
                             n.CopyFrom(PDFStream, PDFStream.Size);
                          finally
                             PDFStream.Free;
                          end;
                       finally
                          n.Free;
                       end;
                    except
                       Cancel;
                    end;

                    // Guardamos Pdf DTE Ticket
                    DMMain.Log('Guardamos Pdf DTE Carta en memorystream');
                    n := CreateBlobStream(FieldByName('PDF_DTE_TICKET'), bmRead);
                    try
                       try
                          PDFStream := TFileStream.Create(CarpetaFichero + FicheroPdfTicket, fmOpenRead);
                          try
                             n.CopyFrom(PDFStream, PDFStream.Size);
                          finally
                             PDFStream.Free;
                          end;
                       finally
                          n.Free;
                       end;
                    except
                       Cancel;
                    end;

                    Post;

                    Transaction.Commit;
                    Transaction.StartTransaction;

                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                    Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                    Params.ByName['TIPO_DOC_TRIBUTARIO'].AsString := xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString;
                    Params.ByName['FOLIO'].AsInteger := xFacturaCabeceraFOLIO.AsInteger;

                    Open;

                    // Por parametro definimos el fichero Pdf que se envia normal o ticket
                    if (LeeParametro('DTEENVI003') = 'T') then
                       FicheroPdfEnvio := FicheroPdfTicket
                    else
                    if (LeeParametro('DTEENVI003') = 'N') then
                       FicheroPdfEnvio := FicheroPdfCarta
                    else
                       FicheroPdfEnvio := FicheroPdfCarta;

                    // Si no hay errores guardamos el xml timbrado como adjunto
                    if (EstadoRespuesta = 'DTE RECIBIDO') then
                    begin
                       XmlEnviadoCliente := False;
                       DMMain.Log('Envio sin errores');

                       DMMain.Log('Guardamos fichero como Adjunto');

                       FicheroPDF := CarpetaFichero + FicheroPdfEnvio;
                       DMMain.Log('Se guarda adjunto PDF:' + FicheroPDF);
                       FicheroXML := CarpetaFichero + FicheroDTEFirmado;
                       DMMain.Log('Se guarda adjunto FicheroXML:' + FicheroXML);
                       FicheroXMLCliente := CarpetaFichero + FicheroSetFirmadoCliente;
                       DMMain.Log('Se guarda adjunto FicheroXMLCliente:' + FicheroXMLCliente);

                       // Si el documento no es una boleta electronica se guarda y se envia el pdf generado por Delfos
                       if ((xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString <> '39') and (xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString <> '41')) then
                       begin
                          if (xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString <> '52') then
                          begin
                             AbreData(TDMLstFactura, DMLstFactura);
                             Memo := TStringList.Create;
                             try
                                DMMain.Log('Mostrando listado');
                                DMLstFactura.MostrarListadoMail(FieldByName('ID_S').AsInteger, xFacturaCabeceraSERIE.AsString, 2, xFacturaCabeceraEJERCICIO.AsInteger, Memo);
                                FicheroPDF := DMLstFactura.rutaFich;
                             finally
                                Memo.Free;
                                CierraData(DMLstFactura);
                             end;
                          end
                          else
                          begin
                             AbreData(TDMLstAlbaranes, DMLstAlbaranes);
                             Memo := TStringList.Create;
                             try
                                DMMain.Log('Mostrando listado');
                                DMLstAlbaranes.MostrarListadoMail(FieldByName('ID_S').AsInteger, xFacturaCabeceraSERIE.AsString, 2, xFacturaCabeceraEJERCICIO.AsInteger);
                                FicheroPDF := DMLstAlbaranes.rutaFich;
                             finally
                                Memo.Free;
                                CierraData(DMLstAlbaranes);
                             end;
                          end;
                       end;

                       // Se guardan los ficheros PDF y XML como adjuntos
                       AbreData(TDMAdjunto, DMAdjunto);
                       DMMain.Log('Creando adjunto pdf');
                       DMAdjunto.CreaAdjunto(xFacturaCabeceraTIPO.AsString, ID_S_DTE, FicheroPDF, Format(_('Factura enviada %s'), [DateTimeToStr(Now)]));
                       DMMain.Log('Creando adjunto xml');
                       DMAdjunto.CreaAdjunto(xFacturaCabeceraTIPO.AsString, ID_S_DTE, FicheroXMLCliente, Format(_('Factura electronica enviada %s'), [DateTimeToStr(Now)]));
                       CierraData(DMAdjunto);

                       // Verificamos si se envia automaticamente el DTE por E-mail al cliente
                       if (LeeParametro('DTEENVI001') = 'S') then
                       begin
                          // Si el usuario tiene configurado el SMTP enviamos email al cliente
                          if (VerificaSmtpDTE) then
                          begin
                             // Enviamos el XML por email al cliente
                             if (TerceroTieneCorreo(xFacturaCabeceraTERCERO.AsInteger, xFacturaCabeceraTIPO.AsString)) then
                             begin
                                AbreData(TDMListados, DMListados);
                                FicherosEnviar := TStringList.Create;

                                InicializaVariableEmail('DTE');
                                with VariableEmail do
                                begin
                                   Ejercicio := xFacturaCabeceraEJERCICIO.AsInteger;
                                   Serie := xFacturaCabeceraSERIE.AsString;
                                   NumeroDocumento := xFacturaCabeceraFOLIO.AsInteger; // Se toma el Folio como numero de documento
                                   Fecha := xFacturaCabeceraFECHA.AsDateTime;
                                   SuReferencia := xFacturaCabeceraSU_REFERENCIA.AsString;
                                   SuPedido := '';
                                   Folio := IntToStr(xFacturaCabeceraFOLIO.AsInteger);
                                   TituloDocTributario := DameTituloTipoDocTributario(xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString);
                                   NombreFichero := FicheroPDF;
                                   Matricula := '';
                                end;
                                DamePartesEmail(Asunto, CuerpoMail);

                                try
                                   // Ficheros a enviar segun parámetro (*P*DF; *X*ML)
                                   param_DTEENVI002 := LeeParametro('DTEENVI002');

                                   NombreFichero := '';
                                   if ((Pos('P', param_DTEENVI002) > 0)) then
                                   begin
                                      FicherosEnviar.Add(FicheroPDF);
                                      NombreFichero := FicheroPdfEnvio;
                                   end;

                                   if ((Pos('X', param_DTEENVI002) > 0)) then
                                   begin
                                      FicherosEnviar.Add(FicheroXMLCliente);
                                      NombreFichero := FicheroDTEFirmado;
                                   end;

                                   FInformacionEnvioDte.MLog.Lines.Add(_('Enviando DTE al E-mail del cliente'));
                                   if (xFacturaCabeceraCLIENTE.AsInteger = -1) then
                                   begin
                                      DMMain.Log(_('El cliente es -1'));
                                      if (xFacCabeceraNIF.RecordCount = 1) then
                                      begin
                                         DMMain.Log(_('Existe registro ges_cabeceras_nif'));
                                         if (not FormatoEmailValido(xFacCabeceraNIFEMAIL.AsString)) then
                                            DMMain.Log(_('La direccion de correo electronico no es valida'))
                                         else
                                         begin
                                            DMMain.Log(_('Enviando correoa cliente -1'));
                                            DMListados.SendMailPDF(xFacCabeceraNIFEMAIL.AsString, CuerpoMail, FicheroPDF, NombreFichero, Asunto);
                                         end;
                                      end;
                                   end
                                   else
                                      DMListados.SendMailClientePDF(xFacturaCabeceraCLIENTE.AsInteger, CuerpoMail, FicherosEnviar, NombreFichero, Asunto, xFacturaCabeceraTIPO.AsString, -1, False, '', 'DTE');

                                   XmlEnviadoCliente := True
                                finally
                                   CuerpoMail.Free;
                                   FicherosEnviar.Free;
                                end;

                                CierraData(DMListados);
                             end
                             else
                                XmlEnviadoCliente := False;
                          end
                          else
                             MessageDlg(_('ATENCIÓN: No tiene configurado el SMTP para el envio de DTE.' +
                                #13#10 + 'Por favor, envie manualmente los adjuntos del documento a su cliente'),
                                mtWarning, [mbOK], 0);
                       end;
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
        end;
     finally
        Documento.Free;
     end;

  finally
     FInformacionEnvioDte.MLog.Lines.Add(_('Finalizado el envio de la boleta'));
     Screen.Cursor := crDefault;
     EnableTaskWindows(WndList);
     FInformacionEnvioDte.Close;
     Contenido.Free;
     Respuesta.Free;
  end;

  if ((not ConSemilla) and (ContadorNumeroEnvios < NumeroEnvios)) then
  begin
     EliminaDatosFEChile(ID_S_DTE);
     EnviaDTE(ID_S_DTE);
  end;
end;

procedure TDMDTEChl.ObtieneDatosFacturaDelfos;
begin
  with xFacturaCabecera do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S_DTE;
     Open;
  end;
end;

procedure TDMDTEChl.ObtieneDatosDTE;
begin
  with QMCabeceraFEChile do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S_DTE;
     Open;
  end;
end;

procedure TDMDTEChl.ObtieneDatosEmisor;
begin
  with xEmisor do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

procedure TDMDTEChl.ObtieneXMLCAF;
begin
  // Actualizamos informacion de la cabecera de la factura
  with xFacturaCabecera do
  begin
     Close;
     Open;
  end;
end;

procedure TDMDTEChl.ObtieneDatosCabeceraNIF;
begin
  // Actualizamos informacion de la cabecera de la factura
  with xFacturaCabecera do
  begin
     Close;
     Open;
  end;
end;

procedure TDMDTEChl.ObtieneDatosCertificado;
begin
  // Obtenemos datos del Certificado
  with xCertificado do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;
end;

procedure TDMDTEChl.xFacturaCabeceraAfterOpen(DataSet: TDataSet);
begin
  xCAF.Open;
  xFacturaDetalle.Open;
  xTerceroClienteDte.Open;
  QMCabeceraFEChile.Open;
  xFacCabeceraNIF.Open;
  xDteReferencias.Open;
end;

procedure TDMDTEChl.xFacturaCabeceraBeforeClose(DataSet: TDataSet);
begin
  xCAF.Close;
  xFacturaDetalle.Close;
  xTerceroClienteDte.Close;
  QMCabeceraFEChile.Close;
  xFacCabeceraNIF.Close;
  xDteReferencias.Close;
end;

procedure TDMDTEChl.InsertaDatosFEChile(IdDoc: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE INSERTA_DATOS_FE_CL(?ID_S)';
        Params.ByName['ID_S'].AsInteger := IdDoc;
        ExecQuery;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMDTEChl.EliminaDatosFEChile(IdDoc: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM GES_CABECERAS_S_FE_CHL WHERE ID_S = :ID_S';
        Params.ByName['ID_S'].AsInteger := IdDoc;
        ExecQuery;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMDTEChl.ExisteDatosFEChile(IdDoc: integer): boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT FIRST 1 ID_S FROM GES_CABECERAS_S_FE_CHL WHERE ID_S = ?ID_S';
        Params.ByName['ID_S'].AsInteger := IdDoc;
        ExecQuery;
        Result := (FieldByName['ID_S'].AsInteger > 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMDTEChl.ObtieneDatosCAF;
var
  Documento : TXMLDocument;
  NodoPadre : IXMLNode;
  Nodo : IXMLNode;
begin
  Documento := TXMLDocument.Create(Self);
  with Documento do
  begin
     XML.Text := xCAFXML_AUTORIZACION_FOLIOS.AsString;
     Active := True;
     NodoPadre := DocumentElement;

     Nodo := DameNodo(NodoPadre, ['CAF', 'DA', 'RE']);
     if Assigned(Nodo) then
        CAF_RE := DameDato(NodoPadre, ['CAF', 'DA', 'RE'])
     else
        raise Exception.Create(_('EL fichero xml deL CAF no es correcto'));

     Nodo := DameNodo(NodoPadre, ['CAF', 'DA', 'RS']);
     if Assigned(Nodo) then
        CAF_RS := DameDato(NodoPadre, ['CAF', 'DA', 'RS'])
     else
        raise Exception.Create(_('EL fichero xml deL CAF no es correcto'));

     Nodo := DameNodo(NodoPadre, ['CAF', 'DA', 'TD']);
     if Assigned(Nodo) then
        CAF_TD := DameDato(NodoPadre, ['CAF', 'DA', 'TD'])
     else
        raise Exception.Create(_('EL fichero xml deL CAF no es correcto'));

     Nodo := DameNodo(NodoPadre, ['CAF', 'DA', 'RNG', 'D']);
     if Assigned(Nodo) then
        CAF_RNG_D := DameDato(NodoPadre, ['CAF', 'DA', 'RNG', 'D'])
     else
        raise Exception.Create(_('EL fichero xml deL CAF no es correcto'));

     Nodo := DameNodo(NodoPadre, ['CAF', 'DA', 'RNG', 'H']);
     if Assigned(Nodo) then
        CAF_RNG_H := DameDato(NodoPadre, ['CAF', 'DA', 'RNG', 'H'])
     else
        raise Exception.Create(_('EL fichero xml deL CAF no es correcto'));

     Nodo := DameNodo(NodoPadre, ['CAF', 'DA', 'FA']);
     if Assigned(Nodo) then
        CAF_FA := DameDato(NodoPadre, ['CAF', 'DA', 'FA'])
     else
        raise Exception.Create(_('EL fichero xml deL CAF no es correcto'));

     Nodo := DameNodo(NodoPadre, ['CAF', 'DA', 'RSAPK', 'M']);
     if Assigned(Nodo) then
        CAF_RSAPK_M := DameDato(NodoPadre, ['CAF', 'DA', 'RSAPK', 'M'])
     else
        raise Exception.Create(_('EL fichero xml deL CAF no es correcto'));

     Nodo := DameNodo(NodoPadre, ['CAF', 'DA', 'RSAPK', 'E']);
     if Assigned(Nodo) then
        CAF_RSAPK_E := DameDato(NodoPadre, ['CAF', 'DA', 'RSAPK', 'E'])
     else
        raise Exception.Create(_('EL fichero xml deL CAF no es correcto'));

     Nodo := DameNodo(NodoPadre, ['CAF', 'DA', 'IDK']);
     if Assigned(Nodo) then
        CAF_RSAPK_IDK := DameDato(NodoPadre, ['CAF', 'DA', 'IDK'])
     else
        raise Exception.Create(_('EL fichero xml deL CAF no es correcto'));

     Nodo := DameNodo(NodoPadre, ['CAF', 'FRMA']);
     if Assigned(Nodo) then
        CAF_FRMA := DameDato(NodoPadre, ['CAF', 'FRMA'])
     else
        raise Exception.Create(_('EL fichero xml deL CAF no es correcto'));

     Nodo := DameNodo(NodoPadre, ['RSASK']);
     if Assigned(Nodo) then
        CAF_RSASK := DameDato(NodoPadre, ['RSASK'])
     else
        raise Exception.Create(_('EL fichero xml deL CAF no es correcto'));

     Nodo := DameNodo(NodoPadre, ['RSAPUBK']);
     if Assigned(Nodo) then
        CAF_RSAPUBK := DameDato(NodoPadre, ['RSAPUBK'])
     else
        raise Exception.Create(_('EL fichero xml deL CAF no es correcto'));
  end;
end;

procedure TDMDTEChl.AsignaFolioADocumento(IdDoc: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_CABECERA_ASIGNA_FOLIO(:ID_S)';
        Params.ByName['ID_S'].AsInteger := IdDoc;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMDTEChl.ValidaDatos;
begin
  // Validamos si tieene los datos necesarios
  if (xFacturaCabecera.RecordCount = 0) then
     raise Exception.Create(_('No existe un registro para la factura con ID_S:' + IntToStr(ID_S_DTE)))
  else
  if (xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString = '') then
     raise Exception.Create(_('La factura no tiene asignada tipo de documento tributario.'))
  else
  if (xFacturaCabeceraFOLIO.AsInteger = 0) then
     raise Exception.Create(_('La factura no tiene asignada un numero de folio.'))
  else
  if (xFacturaCabeceraCODIGO_GIRO_EMPRESA.AsInteger = 0) then
     raise Exception.Create(_('La factura no tiene Giro de empresa.'))
  else
  if (xFacturaCabeceraDIR_COMPLETA.AsString = '') then
     raise Exception.Create(_('No existe un direccion para el cliente.'))
  else
  if (xFacturaCabeceraLIQUIDO.AsFloat = 0) then
     raise Exception.Create(_('La factura no puede tener un importe de cero.'))
  else
  if (QMCabeceraFEChile.RecordCount = 0) then
     raise Exception.Create(_('No existe un registro del DTE'))
  else
  if (xEmisor.RecordCount = 0) then
     raise Exception.Create(_('No existen datos de emisor'))
  else
  if (xEmisorNIF.AsString = '') then
     raise Exception.Create(_('El emisor no tiene NIF asignado'))
  else
  if (xEmisorNOMBRE_R_SOCIAL.AsString = '') then
     raise Exception.Create(_('El emisor no tiene Nombre razon social asignado'))
  else
  if (xEmisorTITULO_POBLACION.AsString = '') then
     raise Exception.Create(_('El emisor no tiene poblacion asignada'))
  else
  if (xCAF.RecordCount = 0) then
     raise Exception.Create(_('No existe un CAF registrado '))
  else
  if (xCertificado.RecordCount = 0) then
     raise Exception.Create(_('No existe un certificado registrado'))
  else
  if (xCertificadoRUT.AsString = '') then
     raise Exception.Create(_('El certificado no tiene el RUT asignado'))
  else
  if (xCertificadoNRO_RESOLUCION.AsInteger = 0) then
     raise Exception.Create(_('El certificado no tiene asignado el numero de resulucion'))
  else
  if (xCertificadoMODULO.AsString = '') then
     raise Exception.Create(_('El certificado no tiene asignado el campo modulo'))
  else
  if (xCertificadoEXPONENT.AsString = '') then
     raise Exception.Create(_('El certificado no tiene asignado el Exponent'))
  else
  if (xCertificadoLLAVE_PUBLICA_X509.AsString = '') then
     raise Exception.Create(_('El certificado no tiene asignado la llave publica'))
  else
  if (xCertificadoLLAVE_PRIVADA_RSA.AsString = '') then
     raise Exception.Create(_('El certificado no tiene asignado la llave privada'));
end;

function TDMDTEChl.ConsultaSiiChile(Pagina: string; Respuesta: TStrings): integer;
var
  IdHTTP : TIdHTTP;
  SSL : TIdSSLIOHandlerSocketOpenSSL;
  AResponse : TStringStream;
begin
  Result := 0;

  IdHTTP := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  AResponse := TStringStream.Create('');
  try
     // Forzar TLS 1.2
     SSL.SSLOptions.Method := sslvTLSv1_2;
     SSL.SSLOptions.SSLVersions := [sslvTLSv1_2];

     IdHTTP.IOHandler := SSL;
     IdHTTP.HandleRedirects := True;
     IdHTTP.Request.Accept := '*/*';
     IdHTTP.Request.ContentType := 'application/x-www-form-urlencoded';
     IdHTTP.Request.UserAgent := 'DelfosERP/Delphi6';

     IdHTTP.Get(Pagina, AResponse);
     Result := IdHTTP.ResponseCode;

     if Assigned(Respuesta) then
     begin
        AResponse.Position := 0;
        Respuesta.LoadFromStream(AResponse);
     end;
  finally
     AResponse.Free;
     SSL.Free;
     IdHTTP.Free;
  end;
end;

{procedure TDMDTEChl.LeerFicheroEnWideString(const NombreArchivo: string; var Resultado: WideString);
var
  Archivo : TFileStream;
  StringStream : TStringStream;
begin
  // Abre el archivo como flujo de lectura
  Archivo := TFileStream.Create(NombreArchivo, fmOpenRead or fmShareDenyWrite);
  // StringStream := TStringStream.Create('', TEncoding.UTF8); // Cambia la codificación si es necesario
  try
     // Copia el contenido del archivo al TStringStream
     StringStream.CopyFrom(Archivo, Archivo.Size);
     // Asigna el contenido leído al WideString
     Resultado := StringStream.DataString;
  finally
     StringStream.Free;
     Archivo.Free;
  end;
end;}

function TDMDTEChl.VerificaSmtpDTE: boolean;
begin
  /// Verifica si tiene datos de configuracion SMTP para envio DTE
  Result := False;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT VENTAS_SERVIDOR_SMTP, VENTAS_USUARIO_SMTP, VENTAS_PASSWORD_SMTP ');
        SQL.Add(' FROM SII_CONFIGURACION_EMAIL ');
        SQL.Add(' WHERE EMPRESA = :EMPRESA ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        Result := ((FieldByName['VENTAS_SERVIDOR_SMTP'].AsString > '') and
           (FieldByName['VENTAS_USUARIO_SMTP'].AsString > '') and
           (FieldByName['VENTAS_PASSWORD_SMTP'].AsString > ''));
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMDTEChl.TerceroTieneCorreo(Tercero: integer; Tipo: string): boolean;
begin
  /// Comprueba si el tercero tiene un correo para enviar documento.
  /// *** Devuevle FALSO si TIPO no es FAC o ALB, aunque el tercero tenga un correo asignado en su ficha.

  /// --------------------------------------------------------------------------
  /// DMListados.SeleccionarDireccionesEnvio()
  /// Los documentos se enviaran a los correos marcados con el TIPO de documento.
  /// Si no hay ninguno marcado, segun la configuracion de SELMAIL001:
  ///   (T) - Se enviará a TODOS los correos.
  ///   (F) - Se enviará solo al de la ficha del tercero.

  Result := False;

  if ((Tipo = 'FAC') or (Tipo = 'ALB')) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT EMAIL FROM L_DAME_EMAIL_TERCERO_TIPO(?TERCERO, ?TIPO) ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMAIL_FIC = 1 ');

           if (Tipo = 'FAC') then
              SQL.Add(' OR EMAIL_FAC = 1 ')
           else
           if (Tipo = 'ALB') then
              SQL.Add(' OR EMAIL_ALB = 1 ');

           Params.ByName['TERCERO'].AsInteger := Tercero;
           Params.ByName['TIPO'].AsString := 'ALL';
           ExecQuery;
           Result := (FieldByName['EMAIL'].AsString > '');
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMDTEChl.GeneraFicheroBoletaConsulta;
var
  ArchivoTexto : TextFile;
begin
  // Generamos el documento de Texto de consulta para la Boleta
  AssignFile(ArchivoTexto, FicheroTXT);
  try
     Rewrite(ArchivoTexto);
     WriteLn(ArchivoTexto, '<?php');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '$arregloJson = array( ');
     WriteLn(ArchivoTexto, '"TOKEN" => "apitest", ');
     WriteLn(ArchivoTexto, '"RutEmisor" => "' + QMCabeceraFEChileRUTEMISOR.AsString + '", ');
     WriteLn(ArchivoTexto, '"TrackId" => "' + QMCabeceraFEChileSII_TRACKID.AsString + '", ');

     WriteLn(ArchivoTexto, '// ################################');
     WriteLn(ArchivoTexto, '// # CERTIFICADO DIGITAL');
     WriteLn(ArchivoTexto, '// ################################');

     WriteLn(ArchivoTexto, '"Modulus"=>"' + xCertificadoMODULO.AsString + '",');
     WriteLn(ArchivoTexto, '');
     WriteLn(ArchivoTexto, '"Exponent"=>"' + xCertificadoEXPONENT.AsString + '",');
     WriteLn(ArchivoTexto, '');
     WriteLn(ArchivoTexto, '"X509Certificate"=>"' + xCertificadoLLAVE_PUBLICA_X509.AsString + '",');
     WriteLn(ArchivoTexto, '');
     WriteLn(ArchivoTexto, '"PrivKey"=>"' + xCertificadoLLAVE_PRIVADA_RSA.AsString + '"');
     WriteLn(ArchivoTexto, ');');
     WriteLn(ArchivoTexto, '?>');
  finally
     CloseFile(ArchivoTexto);
  end;
end;

procedure TDMDTEChl.GeneraFicheroDteConsulta;
var
  ArchivoTexto : TextFile;
begin
  // Generamos el documento de Texto de consulta para la Boleta
  AssignFile(ArchivoTexto, FicheroTXT);
  try
     Rewrite(ArchivoTexto);
     WriteLn(ArchivoTexto, '<?php');
     WriteLn(ArchivoTexto, '#');
     WriteLn(ArchivoTexto, '$FACTRONICA["RESPUESTASII"]="' + BaseNombreFicheros + '.xml"; ');
     WriteLn(ArchivoTexto, '$FACTRONICA["BUZONRESPUESTAS"]="temp_respuestas"; ');
     WriteLn(ArchivoTexto, '############################################################## ');
     WriteLn(ArchivoTexto, '#######	DATOS DEL ENVIO A CONSULTAR');
     WriteLn(ArchivoTexto, '############################################################## ');
     WriteLn(ArchivoTexto, '# RUT EMPRESA EMISORA DEL DTE');
     WriteLn(ArchivoTexto, '$FACTRONICA["RutCompania"]="' + Copy(xEmisorNIF.AsString, 1, Pos('-', xEmisorNIF.AsString) - 1) + '"; ');
     WriteLn(ArchivoTexto, '# DV DEL RUT DE EMPRESA EMISORA DEL DTE');
     WriteLn(ArchivoTexto, '$FACTRONICA["DvCompania"]="' + Copy(xEmisorNIF.AsString, Pos('-', xEmisorNIF.AsString) + 1, Length(xEmisorNIF.AsString)) + '"; ');
     WriteLn(ArchivoTexto, '# TRACKID DEL ENVIO AL SII');
     WriteLn(ArchivoTexto, '$FACTRONICA["TrackId"]="' + QMCabeceraFEChileSII_TRACKID.AsString + '";');
     WriteLn(ArchivoTexto, '# MODULO DEL CERTIFICADO');
     WriteLn(ArchivoTexto, '$FACTRONICA["Modulus"]="' + xCertificadoMODULO.AsString + '";');
     WriteLn(ArchivoTexto, '# EXPONENTE DEL CERTIFICADO ');
     WriteLn(ArchivoTexto, '$FACTRONICA["Exponent"]="' + xCertificadoEXPONENT.AsString + '";  ');
     WriteLn(ArchivoTexto, '# CERTIFICADO X509 ');
     WriteLn(ArchivoTexto, '$FACTRONICA["X509Certificate"]="' + xCertificadoLLAVE_PUBLICA_X509.AsString + '"; ');
     WriteLn(ArchivoTexto, '$FACTRONICA["PrivKey"]="' + xCertificadoLLAVE_PRIVADA_RSA.AsString + '"; ');
     WriteLn(ArchivoTexto, '?>');
  finally
     CloseFile(ArchivoTexto);
  end;
end;

procedure TDMDTEChl.EnviaConsultaDocumentoSII(ID_S: integer);
begin
  ID_S_DTE := ID_S;
  // Obtenemos datos del envio
  ObtieneDatosDTE;
  if ((QMCabeceraFEChileTIPO_DOC_TRIBUTARIO.AsString = '39') or (QMCabeceraFEChileTIPO_DOC_TRIBUTARIO.AsString = '41')) then
  begin
     if (EnviaConsultaBoletaSII) then
        DMMain.Log('Se realizo la consulta para la boleta con ID:' + IntToStr(ID_S_DTE))
     else
        DMMain.Log('NO Se realizo la consulta para la boleta con ID:' + IntToStr(ID_S_DTE));
  end
  else
  begin
     if (EnviaConsultaDTESII) then
        DMMain.Log('Se realizo la consulta para el DTE con ID:' + IntToStr(ID_S_DTE))
     else
        DMMain.Log('NO Se realizo la consulta para el DTE con ID:' + IntToStr(ID_S_DTE));
  end;

end;

function TDMDTEChl.EnviaConsultaBoletaSII: boolean;
var
  UrlModuloFactronica, UrlEnviaFicheroTexto, UrlEnviaConsulta : string;
  NombreBaseFicheroTexto, TrackId : string;
  BaseUrl : string;
  ResultadoConsultaSiiChile, i, j : integer;
  Respuesta : TStrings;
  Documento, NodoPadre, Nodo, DetalleObj, ErrorObj, NodoError : TlkJSONbase;
  EstadoDocumento, EstadoError, DescripcionError, DetalleError, DescripcionLineaError : string;
  //FicheroTemporalJson : TStrings;
  SinErrorConsulta : boolean;
begin
  SinErrorConsulta := True;

  if (QMCabeceraFEChile.RecordCount = 0) then
  begin
     DMMain.Log('No existe un registro del DTE con ID:' + IntToStr(ID_S_DTE));
     SinErrorConsulta := False;
  end;

  TrackId := QMCabeceraFEChileSII_TRACKID.AsString;

  if (Trim(TrackId) = '') then
  begin
     DMMain.Log('No existe un TrackId para el documento con ID:' + IntToStr(ID_S_DTE));
     SinErrorConsulta := False;
  end;

  ObtieneDatosCertificado;
  DMMain.Log('Obeniendo datos del certificado');

  if (xCertificado.RecordCount = 0) then
  begin
     DMMain.Log('No existe un Certificado asignado');
     SinErrorConsulta := False;
  end
  else if ((Trim(xCertificadoEXPONENT.AsString) = '') or
     (Trim(xCertificadoMODULO.AsString) = '') or
     (Trim(xCertificadoLLAVE_PUBLICA_X509.AsString) = '') or
     (Trim(xCertificadoLLAVE_PRIVADA_RSA.AsString) = '')) then
  begin
     DMMain.Log('El certificado no tiene los datos suficientes para la consulta');
     SinErrorConsulta := False;
  end;

  NombreBaseFicheroTexto := xCertificadoRUT.AsString + '_' + TrackId;

  CarpetaFichero := IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, False));

  FicheroTXT := CarpetaFichero + NombreBaseFicheroTexto + '.php';

  // Definicion de variables de ruta
  BaseUrl := DMMain.DameUrlEndPoint('FAC');
  UrlModuloFactronica := BaseUrl + '/' + 'factronica_boleta_consultartrackid';
  UrlEnviaFicheroTexto := UrlModuloFactronica + '/recepcionFichero.php';
  UrlEnviaConsulta := UrlModuloFactronica + '/envia_json_consulta.php?NombreFichero=' + NombreBaseFicheroTexto;
  DMMain.Log('Definicion de variables de ruta');

  // Genera fichero texto para la consulta
  if (SinErrorConsulta) then
  begin
     GeneraFicheroBoletaConsulta;
     DMMain.Log('Genera fichero texto para la consulta');

     // Envia fichero texto del documento
     if not (UploadFile(UrlEnviaFicheroTexto, FicheroTXT)) then
     begin
        DMMain.Log('No se ha podido subir el fichero de consulta');
        SinErrorConsulta := False;
     end
     else
     begin
        // DeleteFile(FicheroTXT);
        DMMain.Log('Fichero de texto enviado');
     end;
  end;

  if (SinErrorConsulta) then
  begin
     Respuesta := TStringList.Create;

     ResultadoConsultaSiiChile := ConsultaSiiChile(UrlEnviaConsulta, Respuesta);
     DMMain.Log('ResultadoConsultaSiiChile:' + IntToStr(ResultadoConsultaSiiChile));
     DMMain.Log('RespuestaConsultaSiiChile:' + Respuesta.Text);

      {$IFDEF Debug}
        Respuesta.SaveToFile(DameTempPath + NombreBaseFicheroTexto + '.json');
      {$ENDIF}

     Documento := TlkJSON.ParseText(Respuesta.Text);
     (* //*** Para pruebas
         FicheroTemporalJson := TStringList.Create;
         FicheroTemporalJson.LoadFromFile(IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, False)) + 'respuestaJson.txt');
         Documento := TlkJSON.ParseText(FicheroTemporalJson.Text);
     *)

     try

        // Verificamos si tiene estado del envio la respuesta
        if Assigned(Documento) then
        begin
           DMMain.Log('Lee respuesta json de envio de DTE');
           NodoPadre := Documento.Field['estado'];
           if Assigned(NodoPadre) then
           begin
              EstadoDocumento := NodoPadre.Field['estado'].Value;
              DMMain.Log('EstadoDocumento:' + EstadoDocumento);

              NodoPadre := Documento.Field['detalle_rep_rech'];
              if Assigned(NodoPadre) and (NodoPadre is TlkJSONlist) then
              begin
                 // Recorremos lista "detalle_rep_rech"
                 for i := 0 to TlkJSONlist(NodoPadre).Count - 1 do
                 begin
                    DetalleObj := TlkJSONobject(TlkJSONlist(NodoPadre).Child[i]);

                    Nodo := DetalleObj.Field['estado'];
                    if Assigned(Nodo) then
                    begin
                       EstadoError := Nodo.Value;
                       DMMain.Log('Estado del error: ' + EstadoError);
                    end
                    else
                       DMMain.Log('No se ha podido leer el estado del error');

                    Nodo := DetalleObj.Field['descripcion'];
                    if Assigned(Nodo) then
                    begin
                       DescripcionError := Nodo.Value;
                       DMMain.Log('Descripción del error: ' + DescripcionError);
                    end
                    else
                       DMMain.Log('No se ha podido leer la descripción del error');

                    DetalleError := '';
                    // Leemos errores
                    Nodo := DetalleObj.Field['error'];
                    if Assigned(Nodo) and (Nodo is TlkJSONlist) then
                    begin
                       // Recorremos la lista de errores
                       for j := 0 to TlkJSONlist(Nodo).Count - 1 do
                       begin
                          ErrorObj := TlkJSONobject(TlkJSONlist(Nodo).Child[j]);
                          NodoError := ErrorObj.Field['descripcion'];
                          if Assigned(NodoError) then
                             DetalleError := '(' + DetalleError + ' - ' + NodoError.Value
                          else
                             DetalleError := '';

                          NodoError := ErrorObj.Field['detalle'];
                          if Assigned(NodoError) then
                             DetalleError := DetalleError + ' ' + NodoError.Value + ')'
                          else
                             DetalleError := '';

                          DMMain.Log('DetalleError: ' + DetalleError);
                       end;
                    end
                    else
                       DMMain.Log('No se ha podido leer el arreglo de errores');

                    DescripcionLineaError := DescripcionError + ':' + DetalleError;
                 end;
              end
              else
                 DMMain.Log('No se ha podido leer el estado del documento');
           end;
        end;

        // Guardamos los datos y ficheros generados en la base de datos
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
                 SelectSQL.Add(' SELECT * FROM GES_CABECERAS_S_FE_CHL  ');
                 SelectSQL.Add(' WHERE ');
                 SelectSQL.Add(' ID_S = :ID_S ');

                 UpdateSQL.Add(' UPDATE GES_CABECERAS_S_FE_CHL ');
                 UpdateSQL.Add(' SET ');
                 UpdateSQL.Add(' ESTADO_DOCUMENTO = :ESTADO_DOCUMENTO, ');
                 UpdateSQL.Add(' GLOSA_ESTADO_DOCUMENTO = :GLOSA_ESTADO_DOCUMENTO, ');
                 UpdateSQL.Add(' ERR_CODE = :ERR_CODE, ');
                 UpdateSQL.Add(' GLOSA_ERR = :GLOSA_ERR, ');
                 UpdateSQL.Add(' ESTADO_RESPUESTA = :ESTADO_RESPUESTA ');
                 UpdateSQL.Add(' WHERE ');
                 UpdateSQL.Add(' ID_S = :ID_S ');

                 Params.ByName['ID_S'].AsInteger := ID_S_DTE;

                 Open;
                 Edit;

                 FieldByName('ESTADO_DOCUMENTO').Value := EstadoDocumento;
                 FieldByName('GLOSA_ESTADO_DOCUMENTO').Value := DameTituloEstadoBoleta(EstadoDocumento);
                 FieldByName('ERR_CODE').Value := EstadoError;
                 FieldByName('GLOSA_ERR').Value := Copy(DescripcionLineaError, 1, 256);
                 FieldByName('ESTADO_RESPUESTA').Value := Respuesta.Text;

                 Post;

                 Transaction.Commit;
                 Transaction.StartTransaction;

                 Params.ByName['ID_S'].AsInteger := ID_S_DTE;

              finally
                 Transaction.Free;
              end;
           finally
              Free;
           end;
        end;
     finally
        Documento.Free;
     end;
  end;
  Result := SinErrorConsulta;
end;

function TDMDTEChl.EnviaConsultaDteSII: boolean;
var
  UrlModuloFactronica, UrlEnviaFicheroTexto, UrlEnviaConsulta : string;
  TrackId, Estado, Glosa, NumAtencion : string;
  BaseUrl : string;
  //ResultadoConsultaSiiChile, i, j : integer;
  // Respuesta : TStrings;
  //EstadoDocumento, EstadoError, DescripcionError, DetalleError, DescripcionLineaError : string;
  //FicheroTemporalJson : TStrings;
  SinErrorConsulta : boolean;
  DocumentoRespuesta : TXMLDocument;
  //NodoRespuesta : string;
  Nodo : IXMLNode;
  NodoHijo : IXMLNode;
  NodoNieto : IXMLNode;
begin
  SinErrorConsulta := True;

  if (QMCabeceraFEChile.RecordCount = 0) then
  begin
     DMMain.Log('No existe un registro del DTE con ID:' + IntToStr(ID_S_DTE));
     SinErrorConsulta := False;
  end;

  TrackId := QMCabeceraFEChileSII_TRACKID.AsString;

  if (Trim(TrackId) = '') then
  begin
     DMMain.Log('No existe un TrackId para el documento con ID:' + IntToStr(ID_S_DTE));
     SinErrorConsulta := False;
  end;

  ObtieneDatosCertificado;
  DMMain.Log('Obeniendo datos del certificado');

  if (xCertificado.RecordCount = 0) then
  begin
     DMMain.Log('No existe un Certificado asignado');
     SinErrorConsulta := False;
  end
  else if ((Trim(xCertificadoEXPONENT.AsString) = '') or
     (Trim(xCertificadoMODULO.AsString) = '') or
     (Trim(xCertificadoLLAVE_PUBLICA_X509.AsString) = '') or
     (Trim(xCertificadoLLAVE_PRIVADA_RSA.AsString) = '')) then
  begin
     DMMain.Log('El certificado no tiene los datos suficientes para la consulta');
     SinErrorConsulta := False;
  end;

  // Obtenemos datos del documento
  ObtieneDatosFacturaDelfos;
  ObtieneDatosEmisor;
  BaseNombreFicheros := 'RUT' + StringReplace(xEmisorNIF.AsString, '-', '', [rfReplaceAll]) + '_TIPO' + xFacturaCabeceraTIPO_DOC_TRIBUTARIO.AsString + 'FOLIO' + IntToStr(xFacturaCabeceraFOLIO.AsInteger) + '_RESPUESTAENVIODTE';
  CarpetaFichero := IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, False));

  FicheroTXT := CarpetaFichero + BaseNombreFicheros + '.php';

  // Definicion de variables de ruta
  BaseUrl := DMMain.DameUrlEndPoint('FAC');
  UrlModuloFactronica := BaseUrl + '/' + 'sii_consultarenviodte';
  //  UrlEnviaFicheroTexto := UrlModuloFactronica + '/recepcionFichero.php';
  UrlEnviaFicheroTexto := UrlModuloFactronica + '/index.php';
  UrlEnviaConsulta := UrlModuloFactronica + '/enviaConsulta.php?NombreFichero=' + BaseNombreFicheros;
  DMMain.Log('Definicion de variables de ruta');

  // Genera fichero texto para la consulta
  if (SinErrorConsulta) then
  begin
     GeneraFicheroDteConsulta;
     DMMain.Log('Genera fichero texto para la consulta');

     // Envia fichero texto del documento
     if not (UploadFile(UrlEnviaFicheroTexto, FicheroTXT)) then
     begin
        DMMain.Log('No se ha podido subir el fichero de consulta');
        SinErrorConsulta := False;
     end
     else
     begin
        // DeleteFile(FicheroTXT);
        DMMain.Log('Fichero de texto enviado');
     end;
  end;

  if (SinErrorConsulta) then
  begin
     (*ResultadoConsultaSiiChile := ConsultaSiiChile(UrlEnviaConsulta, Respuesta);
     DMMain.Log('ResultadoConsultaSiiChile:' + IntToStr(ResultadoConsultaSiiChile));
     DMMain.Log('RespuestaConsultaSiiChile:' + Respuesta.Text);*)

     // Descargamos respuesta
     if (DescargaFichero(UrlModuloFactronica + '/respuestas/' + BaseNombreFicheros + '.xml', CarpetaFichero + BaseNombreFicheros + '.xml')) then
     begin
        DocumentoRespuesta := TXMLDocument.Create(Self);
        try
           with DocumentoRespuesta do
           begin
              XML.LoadFromFile(CarpetaFichero + BaseNombreFicheros + '.xml');

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

              Nodo := DocumentElement;

              while Assigned(Nodo) do
              begin
                 NodoHijo := Nodo.ChildNodes.First;
                 while Assigned(NodoHijo) do
                 begin
                    NodoNieto := NodoHijo.ChildNodes.First;
                    while Assigned(NodoNieto) do
                    begin
                       if (NodoNieto.LocalName = 'TRACKID') then
                       begin
                          TrackId := NodoNieto.Text;
                          DMMain.Log('TrackId:' + TrackId);
                       end;

                       if (NodoNieto.LocalName = 'ESTADO') then
                       begin
                          Estado := NodoNieto.Text;
                          DMMain.Log('Estado:' + Estado);
                       end;

                       if (NodoNieto.LocalName = 'GLOSA') then
                       begin
                          Glosa := NodoNieto.Text;
                          DMMain.Log('Glosa:' + Glosa);
                       end;

                       if (NodoNieto.LocalName = 'NUM_ATENCION') then
                       begin
                          NumAtencion := NodoNieto.Text;
                          DMMain.Log('NumAtencion:' + NumAtencion);
                       end;

                       NodoNieto := NodoNieto.NextSibling;
                    end;
                    NodoHijo := NodoHijo.NextSibling;
                 end;
                 Nodo := Nodo.NextSibling;
              end;
           end;
        finally
           DocumentoRespuesta.Free;
        end;

        // Guardamos los datos y ficheros generados en la base de datos
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
                 SelectSQL.Add(' SELECT * FROM GES_CABECERAS_S_FE_CHL  ');
                 SelectSQL.Add(' WHERE ');
                 SelectSQL.Add(' ID_S = :ID_S ');

                 UpdateSQL.Add(' UPDATE GES_CABECERAS_S_FE_CHL ');
                 UpdateSQL.Add(' SET ');
                 UpdateSQL.Add(' ESTADO_DOCUMENTO = :ESTADO_DOCUMENTO, ');
                 UpdateSQL.Add(' GLOSA_ESTADO_DOCUMENTO = :GLOSA_ESTADO_DOCUMENTO, ');
                 UpdateSQL.Add(' ERR_CODE = :ERR_CODE, ');
                 UpdateSQL.Add(' GLOSA_ERR = :GLOSA_ERR, ');
                 UpdateSQL.Add(' ESTADO_RESPUESTA = :ESTADO_RESPUESTA ');
                 UpdateSQL.Add(' WHERE ');
                 UpdateSQL.Add(' ID_S = :ID_S ');

                 Params.ByName['ID_S'].AsInteger := ID_S_DTE;

                 Open;
                 Edit;

                 FieldByName('ESTADO_DOCUMENTO').Value := Estado;
                 FieldByName('GLOSA_ESTADO_DOCUMENTO').Value := Glosa;
                 FieldByName('ERR_CODE').Value := '';
                 FieldByName('GLOSA_ERR').Value := '';
                 FieldByName('ESTADO_RESPUESTA').Value := '';

                 Post;

                 Transaction.Commit;
                 Transaction.StartTransaction;

                 Params.ByName['ID_S'].AsInteger := ID_S_DTE;

              finally
                 Transaction.Free;
              end;
           finally
              Free;
           end;
        end;
     end;

  end;
  Result := SinErrorConsulta;
end;

function TDMDTEChl.DameTituloEstadoBoleta(estado: string): string;
var
  Resultado : string;
begin
  if (estado = 'ENV') then
     Resultado := 'La boleta ha sido enviada al SII, pero aún no ha sido procesada o validada por el sistema'
  else if (estado = 'RCV') then
     Resultado := 'La boleta ha sido recibida por el SII y está en proceso de validación'
  else if (estado = 'OK') then
     Resultado := 'La boleta ha sido validada y aceptada por el SII'
  else if (estado = 'RFR') then
     Resultado := 'La boleta ha sido rechazada por el SII debido a errores en los datos o incumplimiento de las normas'
  else if (estado = 'EPR') then
     Resultado := 'La boleta está siendo revisada manualmente por el SII debido a inconsistencias o sospechas de errores'
  else if (estado = 'NOK') then
     Resultado := 'La boleta no ha sido aceptada por el SII, pero no necesariamente ha sido rechazada'
  else if (estado = 'ANU') then
     Resultado := 'La boleta ha sido anulada por el emisor'
  else if (estado = 'ERR') then
     Resultado := 'Ocurrió un error durante el proceso de envío o validación de la boleta'
  else if (estado = 'VOF') then
     Resultado := 'La boleta fue enviada fuera del plazo permitido por el SII'
  else if (estado = 'PEN') then
     Resultado := 'La boleta está pendiente de ser procesada o validada por el SII'
  else if (estado = 'RSC') then
     Resultado := 'La boleta fue rechazada porque no cumple con el esquema (XML) definido por el SII'
  else if (estado = 'RPT') then
     Resultado := 'La boleta fue rechazada debido a un problema con el timbre electrónico.'
  else
     Resultado := 'Codigo de error desconocido';

  Result := Resultado;
end;

function TDMDTEChl.NCDeDocumentoExcento: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('SELECT TIPO_DOC_TRIBUTARIO ');
        SQL.Add('FROM GES_CABECERAS_S_FAC ');
        SQL.Add('WHERE ');
        SQL.Add('ID_S = (SELECT FIRST 1 O_ID_S ');
        SQL.Add('        FROM GES_CABECERAS_RELACIONES ');
        SQL.Add('        WHERE ');
        SQL.Add('        D_ID_S = :ID_S) ');
        Params.ByName['ID_S'].AsInteger := ID_S_DTE;
        ExecQuery;
        Result := ((FieldByName['TIPO_DOC_TRIBUTARIO'].AsString = '34') or (FieldByName['TIPO_DOC_TRIBUTARIO'].AsString = '41'));
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
