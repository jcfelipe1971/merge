unit UDMFacturaElectronicaMx;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class,
  FIBQuery, FIBDatabase, UFIBModificados, HYFIBQuery, FIBDataSetRO,
  UHYReportMail, ALetras, FR_Pars, frxClass, frxHYReport, frxDBSet,
  FIBTableDataSetRO, VAriants, ShellApi, StdCtrls, DateUtils;

type
  TDMFacturaElectronicaMx = class(TDataModule)
     DSCabecera: TDataSource;
     DSDetalle: TDataSource;
     TLocal: THYTransaction;
     QMDetalle: TFIBDataSetRO;
     QMCabecera: TFIBDataSetRO;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraEJERCICIO: TIntegerField;
     QMCabeceraCANAL: TIntegerField;
     QMCabeceraSERIE: TFIBStringField;
     QMCabeceraTIPO: TFIBStringField;
     QMCabeceraRIG: TIntegerField;
     QMCabeceraALMACEN: TFIBStringField;
     QMCabeceraMONEDA: TFIBStringField;
     QMCabeceraFECHA: TDateTimeField;
     QMCabeceraTERCERO: TIntegerField;
     QMCabeceraTITULO: TFIBStringField;
     QMCabeceraDIRECCION: TIntegerField;
     QMCabeceraCLIENTE: TIntegerField;
     QMCabeceraSU_REFERENCIA: TFIBStringField;
     QMCabeceraFORMA_PAGO: TFIBStringField;
     QMCabeceraCAMPANYA: TIntegerField;
     QMCabeceraNOTAS: TBlobField;
     QMCabeceraESTADO: TIntegerField;
     QMCabeceraBULTOS: TIntegerField;
     QMCabeceraLINEAS: TIntegerField;
     QMCabeceraBRUTO: TFloatField;
     QMCabeceraI_DTO_LINEAS: TFloatField;
     QMCabeceraS_BASES: TFloatField;
     QMCabeceraM_BRUTO: TFloatField;
     QMCabeceraC_TOTAL: TFloatField;
     QMCabeceraAGENTE: TIntegerField;
     QMCabeceraS_CUOTA_IVA: TFloatField;
     QMCabeceraS_CUOTA_RE: TFloatField;
     QMCabeceraB_DTO_LINEAS: TFloatField;
     QMCabeceraDTO_PP: TFloatField;
     QMCabeceraDTO_CIAL: TFloatField;
     QMCabeceraI_DTO_CIAL: TFloatField;
     QMCabeceraI_DTO_PP: TFloatField;
     QMCabeceraB_COMISION: TFloatField;
     QMCabeceraI_COMISION: TFloatField;
     QMCabeceraPOR_FINANCIACION: TFloatField;
     QMCabeceraI_FINANCIACION: TFloatField;
     QMCabeceraLIQUIDO: TFloatField;
     QMCabeceraENTRADA: TIntegerField;
     QMCabeceraTRANSPORTISTA: TIntegerField;
     QMCabeceraI_BASE_RETENCION: TFloatField;
     QMCabeceraP_RETENCION: TFloatField;
     QMCabeceraI_RETENCION: TFloatField;
     QMCabeceraFUERZA_VENCIMIENTOS: TIntegerField;
     QMCabeceraRIC: TIntegerField;
     QMCabeceraTIPO_IRPF: TIntegerField;
     QMCabeceraA_IRPF: TIntegerField;
     QMCabeceraTOTAL_A_COBRAR: TFloatField;
     QMCabeceraDEVOLUCION: TIntegerField;
     QMCabeceraSIN_DETALLE: TIntegerField;
     QMCabeceraASIENTO: TIntegerField;
     QMCabeceraNOMBRE_COMERCIAL: TFIBStringField;
     QMCabeceraREGISTRO: TIntegerField;
     QMCabeceraPORTES: TIntegerField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSERIE: TFIBStringField;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleALMACEN: TFIBStringField;
     QMDetalleARTICULO: TFIBStringField;
     QMDetalleTITULO: TFIBStringField;
     QMDetalleUNIDADES: TFloatField;
     QMDetallePRECIO: TFloatField;
     QMDetallePIEZAS_X_BULTO: TIntegerField;
     QMDetalleBULTOS: TIntegerField;
     QMDetalleDESCUENTO: TFloatField;
     QMDetalleDESCUENTO_2: TFloatField;
     QMDetalleDESCUENTO_3: TFloatField;
     QMDetalleCOMISION: TFloatField;
     QMDetalleP_COSTE: TFloatField;
     QMDetalleM_MOV_STOCK: TIntegerField;
     QMDetalleTIPO_IVA: TIntegerField;
     QMDetalleP_IVA: TFloatField;
     QMDetalleP_RECARGO: TFloatField;
     QMDetalleBRUTO: TFloatField;
     QMDetalleB_COMISION: TFloatField;
     QMDetalleI_DESCUENTO: TFloatField;
     QMDetalleB_IMPONIBLE: TFloatField;
     QMDetalleB_DTO_LINEA: TFloatField;
     QMDetalleI_COMISION: TFloatField;
     QMDetalleC_IVA: TFloatField;
     QMDetalleC_RECARGO: TFloatField;
     QMDetalleT_COSTE: TFloatField;
     QMDetalleM_BRUTO: TFloatField;
     QMDetalleLIQUIDO: TFloatField;
     QMDetalleENTRADA: TIntegerField;
     QMDetalleNOTAS: TBlobField;
     QMDetalleUNIDADES_EXT: TFloatField;
     QMDetalleNSERIE: TFIBStringField;
     QMDetalleUNIDADES_SEC: TFloatField;
     QMCabeceraID_S: TIntegerField;
     QMDetalleID_DETALLES_S: TIntegerField;
     QMDetalleID_S: TIntegerField;
     QMCabeceraFECHA_ENTREGA: TDateTimeField;
     QMCabeceraIDIOMA: TFIBStringField;
     QMDetalleTITULO_IDIOMA: TFIBStringField;
     QMCabeceraRECT: TIntegerField;
     QMCabeceraID_RECT: TIntegerField;
     QMDetalleID_A: TIntegerField;
     QMCabeceraTIPO_PORTES: TIntegerField;
     QMCabeceraPOR_PORTES: TFloatField;
     QMCabeceraI_PORTES: TFloatField;
     QMCabeceraI_PORTES_CANAL: TFloatField;
     QMCabeceraVALOR_CAMB_FIJO: TFloatField;
     QMDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField;
     QMCabeceraPROYECTO: TIntegerField;
     QMDetallePROYECTO: TIntegerField;
     QMCabeceraCONTACTO: TIntegerField;
     QMCabeceraTIT_CONTACTO: TFIBStringField;
     QMDetalleFECHA_PRE_DET: TDateTimeField;
     QMDetalleFECHA_REC_DET: TDateTimeField;
     QMCabeceraNOTAS_INTERNAS_KRI: TBlobField;
     QMDetalleNOTAS2: TBlobField;
     QMDetalleCENTRO_COSTE: TIntegerField;
     QMDetalleID_C_A: TIntegerField;
     QMDetalleTIPO_LINEA_KRI: TIntegerField;
     QMDetalleORDEN: TIntegerField;
     QMDetalleTIPO_LINEA: TFIBStringField;
     QMDetalleFECHA_ANTICIPO: TDateTimeField;
     QMDetalleCTA_PAGO_ANTICIPO: TFIBStringField;
     QMDetalleCERTIFICADO: TIntegerField;
     QMDetalleCERT_NEGATIVO: TIntegerField;
     QMDetalleCRC_NOTAS: TFIBStringField;
     QMDetalleCRC_NOTAS2: TFIBStringField;
     QMDetallePRO_NUM_PLANO: TFIBStringField;
     QMDetalleTIPO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetalleTITULO_UNIDAD_LOGISTICA: TFIBStringField;
     QMDetalleUNIDADES_LOGISTICAS: TFloatField;
     SPDame_DocumentoXmlMX: THYFIBQuery;
     QMCabeceraI_FINANCIACION_CANAL: TFloatField;
     QMCabeceraTARIFA: TFIBStringField;
     QMCabeceraCENTRO_COSTE: TIntegerField;
     QMCabeceraPROCESO_AUTO: TIntegerField;
     QMCabeceraRANGO: TIntegerField;
     QMCabeceraINDICE: TIntegerField;
     QMCabeceraCAMBIO_FIJO: TIntegerField;
     QMCabeceraTIPO_LINEA_KRI: TIntegerField;
     QMCabeceraMODO_IVA: TIntegerField;
     QMCabeceraFUERZA_MODO_IVA: TIntegerField;
     QMCabeceraZ_PREFIJO_NCF: TFIBStringField;
     QMCabeceraZ_CONTADOR_NCF: TFIBStringField;
     QMCabeceraZ_TIPO_NCF: TIntegerField;
     QMCabeceraCADENA_ORIGINAL: TBlobField;
     QMCabeceraSELLO_DIGITAL: TBlobField;
     QMCabeceraCERTIFICADO: TBlobField;
     QMCabeceraFICHERO: TBlobField;
     DSCabeceraFac: TDataSource;
     QMCabeceraFac: TFIBDataSet;
     QMCabeceraFacCADENA_ORIGINAL: TBlobField;
     QMCabeceraFacSELLO_DIGITAL: TBlobField;
     QMCabeceraFacCERTIFICADO: TBlobField;
     QMCabeceraFacFICHERO: TBlobField;
     TUpdate: THYTransaction;
     SPDame_Version_XML_MX: THYFIBQuery;
     procedure DMLstFacturaDestroy(Sender: TObject);
     procedure DMLstFacturaCreate(Sender: TObject);
     procedure QMDetalleAfterScroll(DataSet: TDataSet);
     procedure DobleCabeceraAfterScroll(DataSet: TDataSet);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMCabeceraFacAfterPost(DataSet: TDataSet);
  private
     {ActivaBanco, final, subir, detalle_con_origen ,MostrarNotas: boolean;}
     {sub, base, subtotal, PrecioExt, P_IvaUnico, P_REUnico, totalptoverde, precioverdeln: double;}
     {ric, ric_prm, NotasCab: TStringList;}
     {j, x, indNotas: integer;}
     {doc: string;}
     // Linea1, Linea2: string;
     // MedidasExt: string;
     // Pagina: integer;
     // IVA, VENCIMIENTO: smallint;
     // Fecha_pedido, fecha_albaran: TDateTime;
     // LocalMascaraN, LocalMascaraL: string;
     // LocalMascaraNSec, Moneda_Sec: string;
     // FacturaAnt, LineaAnt: integer;
     // Vencimientos2, dto_vacio: string;
     {linea_origen: string; No se utiliza}
     // nro_serie: string;
     // ProcAnt, ProcUnica: string;
     version, seried, formaDePago, metodoDePago, NumCtaPago, condicionesDePago, tipoDeComprobante, rfc, rfc_emp: string;
     nombre_emp, pais_emp, calle_emp, municipio_emp, estado_emp, colonia_emp, noexterior_emp, codigopostal_emp: string;
     nombre, pais, calle, estado, colonia, municipio, localidad, noexterior, nointerior, codigopostal, moneda, noCertificado: string;
     noAprobacion, anoAprobacion, folio: integer;
     subTotald, total, descuento: real;
     fecha: TDateTime;
     // function ObtenerVtos: string;
     // function n_lineas_memo_detalle:integer;
  public
     albaran_anterior: string; // dji lrk kri
     copia: integer;
     nombreFich, rutaFich: string;
     i: integer;
     procedure GenerarDocumentoXml2;
     procedure GenerarDocumentoXml3;
     procedure GenerarFicheroXml;
     function GenerarSello(cadena, certificado: string): string; //sfg.albert
     function AnyadirACadena(cadena, valor: string): string;
     procedure CrearFichero(fichero: string);//sfg.albert
     procedure EscribirFirma(instruccion, fichero: string);
     procedure EscribirCadena(instruccion, fichero: string);
     function LeerFirma(fichero: string): string; //sfg.albert
     procedure CrearCadenaOriginalFichero(fichero, cadena: string); //sfg.albert
     procedure GrabarFactura(sello, certificado, ficheroSello, cadena: string);//sfg.ruth
     procedure AbrirActual(id_s: integer; generar: byte);//sfg.ruth
  end;

var
  DMFacturaElectronicaMx : TDMFacturaElectronicaMx;
  {Todo : Todas estas variables deberían ser publicas dentro del objeto y no de la unidad}
  SW, id_s_aux, tipolistado, FiltroGen, n_imagen : integer;
  SerieGen : string;
  ficheroSello, ficheroPass : string;

implementation

uses UDMMain, UEntorno, UDMFacturas, UFormGest, UDMListados, UUtiles, UFEligeModoXML,
  PsFR_E_PDF, frxRich, frxDMPExport, UFMain;

{$R *.DFM}

procedure TDMFacturaElectronicaMx.DMLstFacturaCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);

  // Crear StringLists para las notas por artículo y para la cabecera

  { ric := TStringList.Create;
  ric_prm := TStringList.Create;
  NotasCab := TStringList.Create;

  ActivaBanco := False;
  FacturaAnt := -1000;
  LineaAnt := -1000;
  subir := False;
  detalle_con_origen := False;
  dto_vacio := ' ';
  //  MostrarNotas:= False;

  {231 - 1 - Listados de FAC, muestra las promociones como a linea mas. (No en un subdetalle)}
  { if (DMMain.EstadoKri(231) = 1) then
     QMDetalle.SelectSQL.Text := 'SELECT * FROM VER_DETALLE_FACTURA WHERE ID_S = ?ID_S AND TIPO_LINEA<>''PRM'' order by orden';  }

end;

procedure TDMFacturaElectronicaMx.DMLstFacturaDestroy(Sender: TObject);
begin
  CierraData(DMListados);
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

procedure TDMFacturaElectronicaMx.QMDetalleAfterScroll(DataSet: TDataSet);
begin
  {QSPProcedencia.Close;
  QSPProcedencia.Open;
  xArticulos.Close;
  xArticulos.Open;
  series.Close;
  series.Open;}

  {if (DMMain.EstadoKri(120) = 1) then
  begin
    with QSPProcedencia_kri do
    begin
      Close;
      Open;
    end;
  end;}
  { nro_serie := '';
  QNroSerieKri.Close;
  {dji lrk kri - Si tiene escandallo puede que alguno de sus componentes tenga nro. serie o lote
                 Por lo tanto no filtro por el hecho de que la cabecera de escandallo sea serializable
  if (xArticulosSERIALIZADO_KRI.AsInteger = 1) then
  begin}
  {  QNroSerieKri.Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
  QNroSerieKri.Params.ByName['EJERCICIO_S'].AsInteger := QSPProcedenciaEJERCICIO_O.AsInteger;
  QNroSerieKri.Params.ByName['CANAL'].AsInteger := QSPProcedenciaCANAL_O.AsInteger;
  QNroSerieKri.Params.ByName['SERIE'].AsString := QSPProcedenciaSERIE_O.AsString;
  QNroSerieKri.Params.ByName['RIG_S'].AsInteger := QSPProcedenciaRIG_O.AsInteger;
  if QSPProcedenciaTIPO_O.AsString = 'ALB' then
     QNroSerieKri.Params.ByName['LINEA_S'].AsInteger := QSPProcedenciaLINEA_O.AsInteger
  else
     QNroSerieKri.Params.ByName['LINEA_S'].AsInteger := -1;
  QNroSerieKri.Open;
  {end;}

  { QLoteKri.Close;
  {if (xArticulosLOTES_KRI.AsInteger = 1) then
  begin}
  { QLoteKri.Params.ByName['EMPRESA'].AsInteger := QMDetalleEMPRESA.AsInteger;
  QLoteKri.Params.ByName['EJERCICIO_S'].AsInteger := QSPProcedenciaEJERCICIO_O.AsInteger;
  QLoteKri.Params.ByName['CANAL'].AsInteger := QSPProcedenciaCANAL_O.AsInteger;
  QLoteKri.Params.ByName['SERIE'].AsString := QSPProcedenciaSERIE_O.AsString;
  QLoteKri.Params.ByName['RIG_S'].AsInteger := QSPProcedenciaRIG_O.AsInteger;
  if QSPProcedenciaTIPO_O.AsString = 'ALB' then
     QLoteKri.Params.ByName['LINEA_S'].AsInteger := QSPProcedenciaLINEA_O.AsInteger
  else
     QLoteKri.Params.ByName['LINEA_S'].AsInteger := -1;
  QLoteKri.Open;
  {end;}

  {if ((QMDetalle.RecordCount > 0) and (ric <> nil)) then
  begin
     ric.Assign(QMDetalle.FieldByName('NOTAS'));

     if (not QNroSerieKri.EOF) then
     begin
        if (QNroSerieKRINRO_SERIE.AsString <> '') then
           nro_serie := QNroSerieKRINRO_SERIE.AsString;
        QNroSerieKri.Next;
     end;
     while (not QNroSerieKri.EOF) do
     begin
        if (QNroSerieKRINRO_SERIE.AsString <> '') then
           nro_serie := nro_serie + ' - ' + QNroSerieKRINRO_SERIE.AsString;
        QNroSerieKri.Next;
     end;
     if (nro_serie <> '') then
        ric.Insert(0, 'Nro. de Serie : ' + nro_serie);

     while (not QLoteKri.EOF) do
     begin
        if (QLoteKriLOTE.AsString <> '') then
        begin
           ric.Insert(0, Format(_('Lote: %s Caducidad: %s x %s'), [QLoteKriLOTE.AsString, QLoteKriCADUCIDAD.AsString, QLoteKriCOUNT.AsString]));

           if (Length(nro_serie) > 0) then
              nro_serie := nro_serie + #13;
           nro_serie := nro_serie + Format(_('Lote: %s Caducidad: %s x %s'), [QLoteKriLOTE.AsString, QLoteKriCADUCIDAD.AsString, QLoteKriCOUNT.AsString]);
        end;
        QLoteKri.Next;
     end;
  end;}
end;

procedure TDMFacturaElectronicaMx.DobleCabeceraAfterScroll(DataSet: TDataSet);
{var
  DatosBancarios : string;
  comprador : string;
  Q : THYFIBQuery;}
begin
  { if QMCabeceraCLIENTE.AsInteger <= -1 then  // dji lrk kri
  begin
     xDobDireccionesNIF.Close;
     xDobDireccionesNIF.Open;
  end;

  xDobleDireccionEDI.Close;
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
     SQL.Text := 'select comprador from ges_cabeceras_s where id_s = ' +
        IntToStr(DobleCabeceraID_S.AsInteger);
     ExecQuery;
     comprador := Trim(FieldByName['COMPRADOR'].AsString);
     FreeHandle;
  end;
  FreeAndNil(Q);
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     //Transaction.TRParams.Clear; Transaction.TRParams.Add('read_committed'); Transaction.TRParams.Add('read');
     SQL.Text := 'select tercero,direccion from sys_terceros_direcciones where codigo_edi = ''' + comprador + '''';
     ExecQuery;
     xDobleDireccionEDI.Params.ByName['TERCERO'].AsInteger :=
        FieldByName['TERCERO'].AsInteger;
     xDobleDireccionEDI.Params.ByName['DIRECCION'].AsInteger :=
        FieldByName['DIRECCION'].AsInteger;
     FreeHandle;
  end;
  FreeAndNil(Q);
 { xDobleDireccionEDI.Open;

  {xDobFormaPago.Close;
  xDobFormaPago.Open;
  xDobNotasClientes.Close;
  xDobNotasClientes.Open;
  xDobRecibos.Close;
  xDobRecibos.Open;
  xDobDireccionCliente.Close;
  xDobDireccionCliente.Open;
  xDobleRecibos.Close;
  xDobleRecibos.Open;}

  { with QDatosBancarios do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := DobleCabeceraEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := DobleCabeceraEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := DobleCabeceraCANAL.AsInteger;
     Params.ByName['FORMA_PAGO'].AsString := DobleCabeceraFORMA_PAGO.AsString;
     ExecQuery;
     DatosBancarios := FieldByName['DATOS_BANCARIOS'].AsString;
     FreeHandle;
  end;

  with xDobTerceroBan do
  begin
     Close;
     if DatosBancarios = '1' then
        Params.ByName['TERCERO'].AsInteger :=
           xClienteTERCERO.AsInteger
     else if DatosBancarios = '2' then
        Params.ByName['TERCERO'].AsInteger :=
           REntorno.Tercero
     else
        Params.ByName['TERCERO'].AsInteger := -100;
     Open;
  end;

  //  with xDobTerceroBan do
  //    begin
  //      close;
  //      if (copy(DobleCabeceraFORMA_PAGO.Value,1,1)='T')
  //      then params.ByName['Tercero'].AsInteger:=REntorno.Tercero
  //      else if ((copy(DobleCabeceraFORMA_PAGO.Value,1,1)='G')or(ActivaBanco))
  //      then params.ByName['Tercero'].AsInteger:=xClienteTercero.Value
  //      else params.ByName['Tercero'].AsInteger:=-100;
  //      open;
  //      ActivaBanco:=False;
  //    end;

  with xDobTerceroBanT do
  begin
     Close;
     Params.ByName['Tercero'].AsInteger := xClienteTercero.Value;
     Open;
     ActivaBanco := False;
  end;            }
end;


procedure TDMFacturaElectronicaMx.QMCabeceraAfterOpen(DataSet: TDataSet);
begin

  QMDetalle.Open;

end;

procedure TDMFacturaElectronicaMx.GenerarDocumentoXml2;
var
  NomFic : string;        // Nombre del Fichero
  DirFic : string;        // Nombre del Fichero
  NFic : TextFile;        // Fichero
  sReg, sregConceptos, sregTraslados : string; // Registro
  DS : TFIBDataSetRO;
  sello, fechaSTR, cadena : string;
  AAnyo, AMes, ADia, AHoras, AMinutos, ASegundos, AMiliSegundos : word;
  certificado : TStrings;
  // prova : TLFMemo;
begin

  with SPDame_DocumentoXmlMX do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
     Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
     Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
     Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
     ExecQuery;
     version := Trim(FieldByName['VERSION_NCF'].AsString);
     seried := Trim(FieldByName['SERIED'].AsString);
     folio := FieldByName['FOLIO'].AsInteger;
     fecha := FieldByName['FECHA'].AsDateTime;
     noAprobacion := FieldByName['NOAPROBACION'].AsInteger;
     anoAprobacion := FieldByName['ANOAPROBACION'].AsInteger;
     formaDePago := ReemplazaTextoHTML(Trim(FieldByName['FORMADEPAGO'].AsString), 0);
     metodoDePago := ReemplazaTextoHTML(Trim(FieldByName['METODODEPAGO'].AsString), 0);
     NumCtaPago := Trim(FieldByName['NUMCTAPAGO'].AsString);
     condicionesDePago := ReemplazaTextoHTML(Trim(FieldByName['CONDICIONESDEPAGO'].AsString), 0);
     noCertificado := ChangeFileExt(FieldByName['NOCERTIFICADO'].AsString, '');
     subTotald := FieldByName['SUBTOTAL'].AsFloat;
     descuento := FieldByName['DESCUENTO'].AsFloat;
     total := FieldByName['TOTAL'].AsFloat;
     tipoDeComprobante := ReemplazaTextoHTML(Trim(FieldByName['TIPODECOMPROBANTE'].AsString), 0);
     rfc := ReemplazaTextoHTML(Trim(FieldByName['RFC'].AsString), 0);
     moneda := ReemplazaTextoHTML(Trim(FieldByName['MONEDA'].AsString), 0);
     calle_emp := ReemplazaTextoHTML(UpperCase(Trim(FieldByName['CALLE_EMP'].AsString)), 0);
     municipio_emp := ReemplazaTextoHTML(UpperCase(Trim(FieldByName['MUNICIPIO_EMP'].AsString)), 0);
     estado_emp := ReemplazaTextoHTML(UpperCase(Trim(FieldByName['ESTADO_EMP'].AsString)), 0);
     colonia_emp := ReemplazaTextoHTML(UpperCase(Trim(FieldByName['COLONIA_EMP'].AsString)), 0);
     pais_emp := ReemplazaTextoHTML(UpperCase(Trim(FieldByName['PAIS_EMP'].AsString)), 0);
     noexterior_emp := ReemplazaTextoHTML(UpperCase(Trim(FieldByName['NOEXTERIOR_EMP'].AsString)), 0);
     nombre_emp := ReemplazaTextoHTML(Trim(FieldByName['NOMBRE_EMP'].AsString), 0);
     rfc_emp := ReemplazaTextoHTML(Trim(FieldByName['RFC_EMP'].AsString), 0);
     codigopostal_emp := ReemplazaTextoHTML(Trim(FieldByName['CODIGOPOSTAL_EMP'].AsString), 0);
     nombre := ReemplazaTextoHTML(Trim(FieldByName['NOMBRE'].AsString), 0);
     calle := ReemplazaTextoHTML(UpperCase(Trim(FieldByName['CALLE'].AsString)), 0);
     estado := ReemplazaTextoHTML(UpperCase(Trim(FieldByName['ESTADO'].AsString)), 0);
     colonia := ReemplazaTextoHTML(UpperCase(Trim(FieldByName['COLONIA'].AsString)), 0);

     { TODO -oXavi -cFacturaElectronica : Revisar si LOCALIDAD = MUNICIPIO }
     (*
     Localidad no existe en el procedimiento como parametro de salida.
     Comparando con el resto de la unidad, parece que en localidad va municipio
     Lo dejo para que Xavi decida si este cambio es correcto.

     localidad := ReemplazaTextoHTML(UpperCase(Trim(FieldByName['LOCALIDAD'].AsString)), 0);
     *)
     localidad := ReemplazaTextoHTML(UpperCase(Trim(FieldByName['MUNICIPIO'].AsString)), 0);

     municipio := ReemplazaTextoHTML(UpperCase(Trim(FieldByName['MUNICIPIO'].AsString)), 0);
     noexterior := ReemplazaTextoHTML(UpperCase(Trim(FieldByName['NOEXTERIOR'].AsString)), 0);
     nointerior := ReemplazaTextoHTML(UpperCase(Trim(FieldByName['NOINTERIOR'].AsString)), 0);
     codigopostal := ReemplazaTextoHTML(Trim(FieldByName['CODIGOPOSTAL'].AsString), 0);
     pais := ReemplazaTextoHTML(UpperCase(Trim(FieldByName['PAIS'].AsString)), 0);
     ficheroPass := Trim(FieldByName['CLAVE'].AsString);
     ficheroSello := REntorno.RutaExe + Trim(FieldByName['FICHERO'].AsString);
     FreeHandle;

     DecodeDateTime(fecha, AAnyo, AMes, ADia, AHoras, AMinutos, ASegundos, AMiliSegundos);

     // Convierto la fecha al formato que esperan
     fechaSTR := IntToStr(AAnyo) + '-' + Ajusta(IntToStr(AMes), 'I', 2, '0') + '-' + Ajusta(IntToStr(ADia), 'I', 2, '0');
     fechaSTR := fechaSTR + 'T' + Ajusta(IntToStr(AHoras), 'I', 2, '0') + ':' + Ajusta(IntToStr(AMinutos), 'I', 2, '0');
     fechaSTR := fechaSTR + ':' + Ajusta(IntToStr(ASegundos), 'I', 2, '0');
  end;

  // Primero genero la cadena original, necesaria para generar el sello.
  cadena := '||';
  //Información del nodo Comprobante
  cadena := cadena + '2.2'; // version
  cadena := AnyadirACadena(cadena, seried); // serie
  cadena := AnyadirACadena(cadena, IntToStr(folio)); // folio
  cadena := AnyadirACadena(cadena, fechaSTR); // fecha
  cadena := AnyadirACadena(cadena, IntToStr(noAprobacion));  // noAprobacion
  cadena := AnyadirACadena(cadena, IntToStr(anoAprobacion)); // anoAprobacion
  cadena := AnyadirACadena(cadena, tipoDeComprobante); // tipoDeComprobante
  cadena := AnyadirACadena(cadena, formaDePago); // formaDePago
  cadena := AnyadirACadena(cadena, condicionesDePago); // condicionesDePago
  cadena := AnyadirACadena(cadena, FloatToStrDec(subTotald, '.')); // subTotal
  cadena := AnyadirACadena(cadena, FloatToStrDec(descuento, '.')); // descuento
  cadena := AnyadirACadena(cadena, FloatToStrDec(total, '.')); // total
  cadena := AnyadirACadena(cadena, metodoDePago); // metodoDePago
  cadena := AnyadirACadena(cadena, calle_emp + ' ' + colonia_emp + ' ' + municipio_emp + ' ' + estado_emp + ' ' + pais_emp); // LugarExpedición
  cadena := AnyadirACadena(cadena, NumCtaPago); // NumCtaPago
  cadena := cadena + '|1.00'; // TipoCambio
  cadena := AnyadirACadena(cadena, moneda); // Moneda
  //  cadena := cadena + '|'; // FolioFiscalOrig
  //  cadena := cadena + '|'; // FechaFolioFiscalOrig
  //  cadena := cadena + '|'; // SerieFolioFiscalOrig
  //  cadena := cadena + '|'; // MontoFolioFiscalOrig
  //Información del nodo Emisor
  cadena := AnyadirACadena(cadena, rfc_emp); // rfc
  cadena := AnyadirACadena(cadena, nombre_emp); // nombre
  //Información del nodo DomicilioFiscal
  cadena := AnyadirACadena(cadena, calle_emp); // calle
  cadena := AnyadirACadena(cadena, noexterior_emp); // noExterior
  //  cadena := cadena + '|'; // noInterior
  cadena := AnyadirACadena(cadena, colonia_emp); // colonia
  cadena := AnyadirACadena(cadena, municipio_emp); // localidad
  //  cadena := cadena + '|'; // referencia
  cadena := AnyadirACadena(cadena, municipio_emp); // municipio
  cadena := AnyadirACadena(cadena, estado_emp); // estado
  cadena := AnyadirACadena(cadena, pais_emp); // pais
  cadena := AnyadirACadena(cadena, codigopostal_emp); // codigoPostal
  //Información del nodo ExpedidoEn
  cadena := AnyadirACadena(cadena, calle_emp); // calle
  cadena := AnyadirACadena(cadena, noexterior_emp); // noExterior
  //  cadena := cadena + '|'; // noInterior
  cadena := AnyadirACadena(cadena, colonia_emp); // colonia
  cadena := AnyadirACadena(cadena, municipio_emp); // localidad
  //  cadena := cadena + '|'; // referencia
  cadena := AnyadirACadena(cadena, municipio_emp); // municipio
  cadena := AnyadirACadena(cadena, estado_emp); // estado
  cadena := AnyadirACadena(cadena, pais_emp); // pais
  cadena := AnyadirACadena(cadena, codigopostal_emp); // codigoPostal
  //Información del nodo RegimenFiscal
  cadena := cadena + '|REGIMEN GENERAL DE LEY PERSONAS MORALES'; // Regimen
  //Información del nodo Receptor
  cadena := AnyadirACadena(cadena, rfc); // rfc
  cadena := AnyadirACadena(cadena, nombre); // nombre
  //Información del nodo Domicilio
  cadena := AnyadirACadena(cadena, calle); // calle
  cadena := AnyadirACadena(cadena, noexterior); // noExterior
  //  cadena := cadena + '|'; // noInterior
  cadena := AnyadirACadena(cadena, colonia); // colonia
  cadena := AnyadirACadena(cadena, localidad); // localidad
  //  cadena := cadena + '|'; // referencia
  cadena := AnyadirACadena(cadena, municipio); // municipio
  cadena := AnyadirACadena(cadena, estado); // estado
  cadena := AnyadirACadena(cadena, pais); // pais
  cadena := AnyadirACadena(cadena, codigopostal); // codigoPostal
  //Información de cada nodo Concepto
  DS := TFIBDataSetRO.Create(nil);
  with DS do
  begin
     try
        sregConceptos := '';
        DataBase := DMMain.DataBase;
        Transaction := DMFacturaElectronicaMx.TLocal;
        SelectSQL.Clear;
        SelectSQL.Add('select det.articulo as noIdentificacion, det.unidades as cantidad, art.unidades as unidad,det.titulo, det.precio,det.bruto from ges_detalles_s det ');
        SelectSQL.Add('left join art_articulos art on(det.id_a=art.id_a)');
        SelectSQL.Add(' where det.id_s=' + IntToStr(QMCabeceraID_S.AsInteger));
        Open;         //serie=' + QMCabeceraSERIE.AsString +  ' and
        while not EOF do
        begin
           cadena := AnyadirACadena(cadena, FloatToStrDec(FieldByName('CANTIDAD').AsFloat, '.')); // cantidad
           cadena := AnyadirACadena(cadena, FieldByName('UNIDAD').AsString); // unidad
           cadena := AnyadirACadena(cadena, ReemplazaTextoHTML(FieldByName('NOIDENTIFICACION').AsString, 0)); // noIdentificacion
           cadena := AnyadirACadena(cadena, ReemplazaTextoHTML(FieldByName('TITULO').AsString, 0)); // descripcion
           cadena := AnyadirACadena(cadena, FloatToStrDec(FieldByName('PRECIO').AsFloat, '.')); // valorUnitario
           cadena := AnyadirACadena(cadena, FloatToStrDec(FieldByName('BRUTO').AsFloat, '.')); // importe

           // Variable para el XML
           sregConceptos := sregConceptos + '<Concepto noIdentificacion="' + ReemplazaTextoHTML(FieldByName('NOIDENTIFICACION').AsString, 0) + '"';
           sregConceptos := sregConceptos + ' cantidad="' + FloatToStrDec(FieldByName('CANTIDAD').AsFloat, '.') + '"';
           sregConceptos := sregConceptos + ' descripcion="' + ReemplazaTextoHTML(FieldByName('TITULO').AsString, 0) + '"';
           sregConceptos := sregConceptos + ' importe="' + FloatToStrDec(FieldByName('BRUTO').AsFloat, '.') + '"';
           sregConceptos := sregConceptos + ' unidad="' + FieldByName('UNIDAD').AsString + '"';
           sregConceptos := sregConceptos + ' valorUnitario="' + FloatToStrDec(FieldByName('PRECIO').AsFloat, '.') + '"></Concepto>';

           Next;
        end;
     finally
        Free;
     end;
  end;
  //Información de cada nodo Traslado
  DS := TFIBDataSetRO.Create(nil);
  with DS do
  begin
     try
        sregTraslados := '';
        DataBase := DMMain.DataBase;
        Transaction := DMFacturaElectronicaMx.TLocal;
        SelectSQL.Clear;
        SelectSQL.Add('select p_iva as tasa, i_iva as importe from ges_cabeceras_s_redondeos');
        SelectSQL.Add(' where id_s=' + IntToStr(QMCabeceraID_S.AsInteger));
        Open;
        while not EOF do
        begin
           cadena := AnyadirACadena(cadena, 'IVA'); // impuesto
           cadena := AnyadirACadena(cadena, FloatToStrDec(FieldByName('TASA').AsFloat, '.')); // tasa
           cadena := AnyadirACadena(cadena, FloatToStrDec(FieldByName('IMPORTE').AsFloat, '.')); // importe
           //  cadena := cadena + '|'; // totalImpuestosTrasladados

           // Variable para el XML
           sregTraslados := sregTraslados + '<Traslado impuesto="IVA" tasa="' + FloatToStrDec(FieldByName('TASA').AsFloat, '.') + '"';
           sregTraslados := sregTraslados + ' importe="' + FloatToStrDec(FieldByName('IMPORTE').AsFloat, '.') + '"></Traslado>';

           Next;
        end;
     finally
        Free;
     end;
  end;
  // Finalizo la cadena original
  cadena := cadena + '||';

  // Segundo genero el sello y el certificado
  sello := GenerarSello(UTF8Encode(cadena), noCertificado);
  certificado := TStringList.Create;
  certificado.LoadFromFile(DameTempPath + 'certificado.txt');
  if (certificado[certificado.Count - 1] = '') then
     certificado.Delete(certificado.Count - 1);

  // Tercero genero el XML

  // La carpeta sera la carpeta donde esta el exe + CFD + Canal + nro. empresa(3) : C:\Merge\Ejecutables\CFD1001
  DirFic := Format('%s%s%d%.3d', [REntorno.RutaEXE, 'CFD', REntorno.Canal, REntorno.Empresa]);
  if (not DirectoryExists(DirFic)) then
     if (not CreateDir(DirFic)) then
        raise Exception.Create(Format(_('No se ha podido crear %s'), [DirFic]));

  // NomFic = DirFic\Ejer_Serie_RIG(10)_rfc.xml : [DirFic]\2012_B_0000000001_RFC.xml
  NomFic := Format('%s\%d_%s_%.10d_%s.xml', [DirFic, QMCabeceraEJERCICIO.AsInteger, Serie, QMCabeceraRIG.AsInteger, rfc]);
  AssignFile(NFic, NomFic);
  try
     Rewrite(NFic);
     // grabamos cabecera fichero
     //sreg := '<?xml version="1.0" encoding="ISO-8859-1"?>';
     sreg := '<?xml version="1.0" encoding="UTF-8"?>';
     WriteLn(NFic, UTF8Encode(sReg));
     sreg := '<Comprobante xmlns="http://www.sat.gob.mx/cfd/2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.sat.gob.mx/cfd/2 http://www.sat.gob.mx/sitio_internet/cfd/2/cfdv2.xsd"';
     sreg := sreg + ' version="2.2"'; // + version + '"'
     sreg := sreg + ' LugarExpedicion="' + calle_emp + ' ' + colonia_emp + ' ' + municipio_emp + ' ' + estado_emp + ' ' + pais_emp + '"';
     sreg := sreg + ' Moneda="' + moneda + '"';
     sreg := sreg + ' TipoCambio="1.00"';
     // WriteLn(NFic, UTF8Encode(sReg));
     sreg := sreg + ' serie="' + seried + '"';
     sreg := sreg + ' folio="' + IntToStr(folio) + '"';
     sreg := sreg + ' fecha="' + fechaSTR + '"';
     sreg := sreg + ' noAprobacion="' + IntToStr(noAprobacion) + '"';
     sreg := sreg + ' anoAprobacion="' + IntToStr(anoAprobacion) + '"';
     sreg := sreg + ' formaDePago="' + formaDePago + '"';
     sreg := sreg + ' metodoDePago="' + metodoDePago + '"';
     sreg := sreg + ' NumCtaPago="' + NumCtaPago + '"';
     sreg := sreg + ' condicionesDePago="' + condicionesDePago + '"';
     sreg := sreg + ' subTotal="' + FloatToStrDec(subTotald, '.') + '"';
     sreg := sreg + ' descuento="' + FloatToStrDec(descuento, '.') + '"';
     sreg := sreg + ' total="' + FloatToStrDec(total, '.') + '"';
     sreg := sreg + ' tipoDeComprobante="' + tipoDeComprobante + '"';
     sreg := sreg + ' noCertificado="' + noCertificado + '"';
     sreg := sreg + ' certificado="' + certificado.Text + '"';
     sreg := sreg + ' sello="' + sello + '">';
     WriteLn(NFic, UTF8Encode(sReg));

     // EMISOR
     sreg := '<Emisor nombre="' + nombre_emp + '"';
     sreg := sreg + ' rfc="' + rfc_emp + '">';
     sreg := sreg + '<DomicilioFiscal calle="' + calle_emp + '"';
     sreg := sreg + ' codigoPostal="' + codigopostal_emp + '"';
     sreg := sreg + ' colonia="' + colonia_emp + '"';
     sreg := sreg + ' estado="' + estado_emp + '"';
     sreg := sreg + ' localidad="' + municipio_emp + '"';
     sreg := sreg + ' municipio="' + municipio_emp + '"';
     sreg := sreg + ' noExterior="' + noexterior_emp + '"';
     sreg := sreg + ' pais="' + pais_emp + '">';
     sreg := sreg + '</DomicilioFiscal>';
     sreg := sreg + '<ExpedidoEn calle="' + calle_emp + '"';
     sreg := sreg + ' codigoPostal="' + codigopostal_emp + '"';
     sreg := sreg + ' colonia="' + colonia_emp + '"';
     sreg := sreg + ' estado="' + estado_emp + '"';
     sreg := sreg + ' localidad="' + municipio_emp + '"';
     sreg := sreg + ' municipio="' + municipio_emp + '"';
     sreg := sreg + ' noExterior="' + noexterior_emp + '"';
     sreg := sreg + ' pais="' + pais_emp + '">';
     sreg := sreg + '</ExpedidoEn>';
     sreg := sreg + '<RegimenFiscal Regimen="REGIMEN GENERAL DE LEY PERSONAS MORALES"></RegimenFiscal></Emisor>';

     // RECEPTOR
     sreg := sreg + '<Receptor nombre="' + nombre + '"';
     sreg := sreg + ' rfc="' + rfc + '">';
     sreg := sreg + '<Domicilio calle="' + calle + '"';
     sreg := sreg + ' codigoPostal="' + codigopostal + '"';
     sreg := sreg + ' colonia="' + colonia + '"';
     sreg := sreg + ' estado="' + estado + '"';
     sreg := sreg + ' localidad="' + localidad + '"';
     sreg := sreg + ' municipio="' + municipio + '"';
     sreg := sreg + ' noExterior="' + noexterior + '"';
     sreg := sreg + ' pais="' + pais + '">';
     sreg := sreg + '</Domicilio></Receptor>';

     sreg := sreg + '<Conceptos>';
     sreg := sreg + sregConceptos; // String calculado al generar la cadena original
     sreg := sreg + '</Conceptos>';

     sreg := sreg + '<Impuestos><Traslados>';
     sreg := sreg + sregTraslados; // String calculado al generar la cadena original
     sreg := sreg + '</Traslados></Impuestos>';

     // Addenda
     sreg := sreg + '<Addenda>';
     sreg := sreg + '<requestForPayment>';
     sreg := sreg + '<cadenaOriginal>';
     sreg := sreg + '<Cadena>' + Cadena;
     sreg := sreg + '</Cadena></cadenaOriginal></requestForPayment></Addenda>';

     sreg := sreg + '</Comprobante>';
     WriteLn(NFic, UTF8Encode(sReg));

     CloseFile(NFic);

  except
     on E: Exception do
        ShowMessage(_('Error en la creación del fichero') + #13#10 + E.Message);
  end;

  // Update de los campos de la Factura Electrónica y eliminamos el fichero generado
  GrabarFactura(sello, certificado.Text, NomFic, cadena);
  // DeleteFile(NomFic);
  certificado.Free;
end;

procedure TDMFacturaElectronicaMx.GenerarDocumentoXml3;
var
  NomFic : string;        // Nombre del Fichero
  NFic : TextFile;        // Fichero
  sReg : string;          // Registro
  DS : TFIBDataSetRO;
  sello, cadena : string;
  // prova : TLFMemo;
begin

  with SPDame_DocumentoXmlMX do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMCabeceraEMPRESA.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMCabeceraEJERCICIO.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMCabeceraCANAL.AsInteger;
     Params.ByName['SERIE'].AsString := QMCabeceraSERIE.AsString;
     Params.ByName['RIG'].AsInteger := QMCabeceraRIG.AsInteger;
     Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
     ExecQuery;
     version := Trim(FieldByName['VERSION_NCF'].AsString);
     seried := Trim(FieldByName['SERIED'].AsString);
     folio := FieldByName['FOLIO'].AsInteger;
     fecha := FieldByName['FECHA'].AsDateTime;
     noAprobacion := FieldByName['NOAPROBACION'].AsInteger;
     anoAprobacion := FieldByName['ANOAPROBACION'].AsInteger;
     formaDePago := Trim(FieldByName['FORMADEPAGO'].AsString);
     noCertificado := ChangeFileExt(FieldByName['NOCERTIFICADO'].AsString, '');
     subTotald := FieldByName['SUBTOTAL'].AsFloat;
     descuento := FieldByName['DESCUENTO'].AsFloat;
     total := FieldByName['TOTAL'].AsFloat;
     tipoDeComprobante := Trim(FieldByName['TIPODECOMPROBANTE'].AsString);
     rfc := Trim(FieldByName['RFC'].AsString);
     rfc_emp := Trim(FieldByName['RFC_EMP'].AsString);
     ficheroSello := REntorno.RutaExe + (FieldByName['FICHERO'].AsString);
     ficheroPass := Trim(FieldByName['CLAVE'].AsString);
     nombre_emp := Trim(FieldByName['NOMBRE_EMP'].AsString);
     pais_emp := Trim(FieldByName['PAIS_EMP'].AsString);
     calle_emp := Trim(FieldByName['CALLE_EMP'].AsString);
     municipio_emp := Trim(FieldByName['MUNICIPIO_EMP'].AsString);
     estado_emp := Trim(FieldByName['ESTADO_EMP'].AsString);
     colonia_emp := Trim(FieldByName['COLONIA_EMP'].AsString);
     noexterior_emp := Trim(FieldByName['NOEXTERIOR_EMP'].AsString);
     codigopostal_emp := Trim(FieldByName['CODIGOPOSTAL_EMP'].AsString);
     nombre := Trim(FieldByName['NOMBRE'].AsString);
     pais := Trim(FieldByName['PAIS'].AsString);
     calle := Trim(FieldByName['CALLE'].AsString);
     estado := Trim(FieldByName['ESTADO'].AsString);
     colonia := Trim(FieldByName['COLONIA'].AsString);
     municipio := Trim(FieldByName['MUNICIPIO'].AsString);
     noexterior := Trim(FieldByName['NOEXTERIOR'].AsString);
     nointerior := Trim(FieldByName['NOINTERIOR'].AsString);
     codigopostal := Trim(FieldByName['CODIGOPOSTAL'].AsString);
     FreeHandle;
  end;
  sello := GenerarSello(cadena, noCertificado);
  // importe_tra_es := FieldByName['IMPORTE_TRA_ES'].AsFloat;

  NomFic := REntorno.RutaEXE + rfc + serie + IntToStr(QMCabeceraRIG.AsInteger) + '.xml';
  AssignFile(NFic, NomFic);
  try
     Rewrite(NFic);
     // grabamos cabecera fichero
     sreg := '<?xml version="1.0" encoding="UTF-8"?>';
     WriteLn(NFic, sReg);
     sreg := '<cfdi:Comprobante xsi:schemaLocation="http://www.sat.gob.mx/cfd/3 cfdv3.xsd" xmlns:cfdi="http://www.sat.gob.mx/cfd/3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="3.0" ';
     sreg := sreg + 'fecha="' + DateToStr(fecha) + '" ';
     sreg := sreg + 'sello="' + sello + '" ';
     sreg := sreg + 'total="' + FloatToStrDec(total, '.') + '" ';
     sreg := sreg + 'subtotal="' + FloatToStrDec(subTotald, '.') + '" ';
     sreg := sreg + 'descuento="' + FloatToStrDec(descuento, '.') + '" ';
     sreg := sreg + 'certificado="mdlasjfliajsdfoieuwroiquwe" ';  // No puede ser un literal
     sreg := sreg + 'formaDePago="' + formaDePago + '" ';
     sreg := sreg + 'noCertificado="' + noCertificado + '" ';
     sreg := sreg + 'tipoDeComprobante="' + tipoDeComprobante + '">';
     WriteLn(NFic, sReg);

     // cfdi:Emisor
     sreg := '<cfdi:Emisor rfc="' + rfc_emp + '" ';
     sreg := sreg + 'nombre="' + nombre_emp + '">';
     WriteLn(NFic, sReg);
     sreg := '<cfdi:DomicilioFiscal ';
     sreg := sreg + 'pais="' + pais_emp + '" ';
     sreg := sreg + 'calle="' + calle_emp + '" ';
     sreg := sreg + 'estado="' + estado_emp + '" ';
     sreg := sreg + 'colonia="' + colonia_emp + '" ';
     sreg := sreg + 'municipio="' + municipio_emp + '" ';
     sreg := sreg + 'noExterior="' + noexterior_emp + '" ';
     sreg := sreg + 'codigoPostal="' + codigopostal_emp + '"/>';
     WriteLn(NFic, sReg);
     sreg := '<cfdi:ExpedidoEn ';
     sreg := sreg + 'pais="' + pais_emp + '" ';
     sreg := sreg + 'calle="' + calle_emp + '" ';
     sreg := sreg + 'estado="' + estado_emp + '" ';
     sreg := sreg + 'colonia="' + colonia_emp + '" ';
     sreg := sreg + 'noExterior="' + noexterior_emp + '" ';
     sreg := sreg + 'codigoPostal="' + codigopostal_emp + '"/>';
     WriteLn(NFic, sReg);
     sreg := '</cfdi:Emisor>';
     WriteLn(NFic, sReg);

     // cfdi:Receptor
     sreg := '<cfdi:Receptor rfc="' + rfc + '" ';
     sreg := sreg + 'nombre="' + nombre + '">';
     WriteLn(NFic, sReg);
     sreg := '<cfdi:Domicilio ';
     sreg := sreg + 'pais="' + pais + '" ';
     sreg := sreg + 'calle="' + calle + '" ';
     sreg := sreg + 'estado="' + estado + '" ';
     sreg := sreg + 'colonia="' + colonia + '" ';
     sreg := sreg + 'municipio="' + municipio + '" ';
     sreg := sreg + 'noExterior="' + noexterior + '" ';
     sreg := sreg + 'noInterior="' + nointerior + '" ';
     sreg := sreg + 'codigoPostal="' + codigopostal + '"/>';
     WriteLn(NFic, sReg);
     sreg := '</cfdi:Receptor>';
     WriteLn(NFic, sReg);

     //     sreg := ' version="' + version + '"';
     //     WriteLn(NFic, sReg);
     //     sreg := ' serie="' + seried + '"';
     //     WriteLn(NFic, sReg);
     //     sreg := ' folio="' + folio + '"';
     //     WriteLn(NFic, sReg);
     //     sreg := ' fecha="' + fecha + '"';
     //     WriteLn(NFic, sReg);
     //     sreg := ' sello="' + sello + '"';//sfg.albert
     //     WriteLn(NFic, sReg);
     //     sreg := ' noAprobacion="' + IntToStr(noAprobacion) + '"';
     //     WriteLn(NFic, sReg);
     //     sreg := ' anoAprobacion="' + IntToStr(anoAprobacion) + '"';
     //     WriteLn(NFic, sReg);
     //     sreg := ' formaDePago="' + formaDePago + '"';
     //     WriteLn(NFic, sReg);
     //     sreg := ' noCertificado="' + IntToStr(noCertificado) + '"';
     //     WriteLn(NFic, sReg);
     //     sreg := ' subtotal="' + IntToStr(subTotald) + '"';
     //     WriteLn(NFic, sReg);
     //     sreg := ' total="' + IntToStr(total) + '"';
     //     WriteLn(NFic, sReg);
     //     sreg := ' tipoDeComprobante="' + tipoDeComprobante + '"';
     //     WriteLn(NFic, sReg);
     //     sreg := ' certificado="mdlasjfliajsdfoieuwroiquwe">';
     //     WriteLn(NFic, sReg);
     //     sreg := '<Emisor rfc="' + rfc + '">';
     //     WriteLn(NFic, sReg);

     // Conceptos
     sreg := '<cfdi:Conceptos>';
     WriteLn(NFic, sReg);

     DS := TFIBDataSetRO.Create(nil);
     with DS do
     begin
        try
           DataBase := DMMain.DataBase;
           Transaction := DMFacturaElectronicaMx.TLocal;
           SelectSQL.Clear;
           SelectSQL.Add('select det.unidades as cantidad, art.unidades as unidad,det.titulo, det.precio,det.bruto from ges_detalles_s det ');
           SelectSQL.Add('left join art_articulos art on(det.id_a=art.id_a)');
           SelectSQL.Add(' where det.id_s=' + IntToStr(QMCabeceraID_S.AsInteger));
           Open;         //serie=' + QMCabeceraSERIE.AsString +  ' and
           while not EOF do
           begin
              sreg := '<cfdi:Concepto ';
              sreg := sreg + 'unidad="' + FieldByName('UNIDAD').AsString + '" ';
              sreg := sreg + 'importe="' + FloatToStrDec(FieldByName('BRUTO').AsFloat, '.') + '" ';
              sreg := sreg + 'cantidad="' + FloatToStrDec(FieldByName('CANTIDAD').AsFloat, '.') + '" ';
              sreg := sreg + 'descripcion="' + FieldByName('TITULO').AsString + '" ';
              sreg := sreg + 'valorUnitario="' + FloatToStrDec(FieldByName('PRECIO').AsFloat, '.') + '"/>';
              WriteLn(NFic, sReg);
              Next;
           end;
        finally
           Free;
        end;
     end;
     sreg := '</cfdi:Conceptos>';
     WriteLn(NFic, sReg);

     // Impuestos
     sreg := '<cfdi:Impuestos>';
     WriteLn(NFic, sReg);

     sreg := '<cfdi:Traslados>';
     WriteLn(NFic, sReg);

     DS := TFIBDataSetRO.Create(nil);
     with DS do
     begin
        try
           DataBase := DMMain.DataBase;
           Transaction := DMFacturaElectronicaMx.TLocal;
           SelectSQL.Clear;
           SelectSQL.Add('select p_iva as tasa, sum(c_iva) as importe from ges_detalles_s ');
           SelectSQL.Add(' where empresa=' + IntToStr(QMCabeceraEMPRESA.AsInteger));
           SelectSQL.Add(' and ejercicio=' + IntToStr(QMCabeceraEJERCICIO.AsInteger) + ' and  canal=' + IntToStr(QMCabeceraCANAL.AsInteger) + ' and ');
           SelectSQL.Add('rig=' + IntToStr(QMCabeceraRIG.AsInteger) + ' and id_s=' + IntToStr(QMCabeceraID_S.AsInteger) + ' ');
           SelectSQL.Add('group by p_iva');
           Open;
           while not EOF do
           begin
              sreg := '<cfdi:Traslado ';
              sreg := sreg + 'tasa="' + FloatToStrDec(FieldByName('TASA').AsFloat, '.') + '" ';
              sreg := sreg + 'importe="' + FloatToStrDec(FieldByName('IMPORTE').AsFloat, '.') + '" ';
              sreg := sreg + 'impuesto="' + 'IVA' + '"/>';
              WriteLn(NFic, sReg);
              Next;
           end;
        finally
           Free;
        end;
     end;

     sreg := '</cfdi:Traslados>';
     WriteLn(NFic, sReg);

     sreg := '</cfdi:Impuestos>';
     WriteLn(NFic, sReg);
     {  El complento no lo hacemos nosotros.
     // Complemento
     sreg := '<cfdi:Complemento>';
     WriteLn(NFic, sReg);
     sreg := '<tfd:TimbreFiscalDigital xmlns:tfd="http://www.sat.gob.mx/TimbreFiscalDigital" xsi:schemaLocation="http://www.sat.gob.mx/TimbreFiscalDigital TimbreFiscalDigital.xsd" ';
     sreg := sreg + 'selloCFD="' + sello + '" ';
     sreg := sreg + 'FechaTimbrado="' + '' + '" ';
     sreg := sreg + 'UUID="' + '' + '" ';
     sreg := sreg + 'noCertificadoSAT="' + '' + '" ';
     sreg := sreg + 'version="' + version + '" ';
     sreg := sreg + 'selloSAT="' + '' + '"/>';
     WriteLn(NFic, sReg);

     sreg := '</cfdi:Complemento>';
     WriteLn(NFic, sReg);
 }

     sreg := '</cfdi:Comprobante>';
     WriteLn(NFic, sReg);

     CloseFile(NFic);

     // if (ShellExecute(Application.Handle, nil, PChar(NomFic), nil, nil, SW_SHOWNA) <= 32) then
     //    ShowMessage(_('Error en la creación del fichero'));
  except
     on E: Exception do
        ShowMessage(_('Error en la creación del fichero') + #13#10 + E.Message);
  end;

  // Update de los campos de la Factura Electrónica y eliminamos el fichero generado
  GrabarFactura(sello, seried, NomFic, cadena);
  DeleteFile(NomFic);
end;

procedure TDMFacturaElectronicaMx.GenerarFicheroXml;
var
  Archivo : string; // Nombre del Fichero
  NFic : TextFile; // Fichero
begin
  Archivo := Format('Fact_%d_%s_%.5d.xml', [QMCabeceraEJERCICIO.AsInteger, QMCabeceraSERIE.AsString, QMCabeceraRIG.AsInteger]);
  if MySaveDialog(Archivo, 'XML', '', 'DMFacturaElectronicaMx') then
  begin
     AssignFile(NFic, Archivo);
     try
        Rewrite(NFic);
        WriteLn(NFic, DMFacturaElectronicaMx.QMCabeceraFICHERO.AsString);
        CloseFile(NFic);
        ShowMessage(_('Fichero xml creado.') + #13#10 + Archivo);
     except
        on E: Exception do
           ShowMessage(_('Error en la creación del fichero xml') + #13#10 + E.Message);
     end;
  end;
end;

// sfg.albert - Creació i lectura de la signatura electrònica de la factura
function TDMFacturaElectronicaMx.GenerarSello(cadena, certificado: string): string;
var
  instruccion1, instruccion2, instruccion3, instruccion4, cFileKey, cPass{, cSello} : string;
  fichero_cadena, fichero_firma : string;
begin
  // Se crea la instrucción a ejecutar
  cFileKey := ficheroSello; { 'firma.key'   }
  cPass := ficheroPass;     { 'a0123456789' }
  fichero_cadena := DameTempPath + 'cadena.txt';
  fichero_firma := DameTempPath + 'firma.bat';

  // Elimino fichero sello.txt
  DeleteFile(DameTempPath + 'sello.txt');

  instruccion1 := 'openssl pkcs8 -inform DER -in ' + cFileKey + ' -passin pass:' + cPass + ' -out ' + DameTempPath + 'KEY.PEM';
  instruccion2 := 'openssl dgst -sha1 -out ' + 'sign.bin -sign ' + DameTempPath + 'KEY.PEM ' + DameTempPath + 'cadena.txt';
  instruccion3 := 'openssl enc -base64 -in ' + 'sign.bin -a -A -out ' + DameTempPath + 'sello.txt';
  instruccion4 := 'openssl enc -base64 -A -in ' + REntorno.RutaExe + certificado + '.cer -out ' + DameTempPath + 'certificado.txt';

  {
    Ejemplo de uso de openssl.exe
    "openssl pkcs8 -inform DER -in " + cFileKey + " -passin pass:" + cPass + " -out "+ oApp:cDirGen + "\KEY.PEM"
    "openssl dgst -sha1 -out " + oApp:cDirGen + "\sign.bin -sign "+ oApp:cDirGen + "\KEY.PEM " + oApp:cDirGen + "\cadena_original.xsl"
    "openssl enc -in " + oApp:cDirGen + "\sign.bin -a -A -out " + oApp:cDirGen + "\signB64.txt"
  }

  CrearCadenaOriginalFichero(fichero_cadena, cadena);
  CrearFichero(fichero_firma);

  EscribirFirma(instruccion1, fichero_firma);
  EscribirFirma(instruccion2, fichero_firma);
  EscribirFirma(instruccion3, fichero_firma);
  EscribirFirma(instruccion4, fichero_firma);

  // Abro el fichero y espero a que termine para asegurarme de que el resultado esta completo.
  RunAndWait(FMain.Handle, fichero_firma, '');

  Result := LeerFirma(DameTempPath + 'sello.txt');
end;

function TDMFacturaElectronicaMx.AnyadirACadena(cadena, valor: string): string;
begin
  // Solo se añade a la cadena si tiene valor
  if (Length(valor) > 0) then
  begin
     cadena := StringReplace(cadena, '  ', ' ', [rfReplaceAll]);
     cadena := cadena + '|' + valor;
  end;

  Result := cadena;
end;

procedure TDMFacturaElectronicaMx.CrearFichero(fichero: string);
var
  datos : TextFile;
begin
  DeleteFile(fichero);
  AssignFile(Datos, fichero);
  Rewrite(Datos);
  CloseFile(Datos);
end;

procedure TDMFacturaElectronicaMx.EscribirFirma(instruccion, fichero: string);
var
  datos : TextFile;
begin
  AssignFile(Datos, fichero);
  Append(Datos);
  WriteLn(Datos, Instruccion);
  CloseFile(Datos);
end;

procedure TDMFacturaElectronicaMx.EscribirCadena(instruccion, fichero: string);
var
  datos : TextFile;
begin
  AssignFile(Datos, fichero);
  Append(Datos);
  Write(Datos, Instruccion);
  CloseFile(Datos);
end;

function TDMFacturaElectronicaMx.LeerFirma(fichero: string): string;
var
  datos : TextFile;
  sello : string;
begin
  AssignFile(Datos, fichero);
  Reset(Datos);
  Read(datos, sello);
  Result := sello;
  CloseFile(Datos);
end;

procedure TDMFacturaElectronicaMx.CrearCadenaOriginalFichero(fichero, cadena: string);
begin
  CrearFichero(fichero);
  EscribirCadena(cadena, fichero);
end;

procedure TDMFacturaElectronicaMx.DataModuleCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  if not TUpdate.InTransaction then
     TUpdate.StartTransaction;

  // AbreData(TDMListados, DMListados);
end;

procedure TDMFacturaElectronicaMx.DataModuleDestroy(Sender: TObject);
begin
  // Liberar recursos
  { ric.Free;
  ric_prm.Free;
  NotasCab.Free;   }
  // CierraData(DMListados);
  if (TLocal.InTransaction) then
     TLocal.Commit;
  //Application.ProcessMessages;

end;

procedure TDMFacturaElectronicaMx.GrabarFactura(sello, certificado, ficheroSello, cadena: string);
var
  // Q : THYFIBQuery;
  ms : TMemoryStream;
begin
  //sfg.albert
  QMCabeceraFac.Close;
  QMCabeceraFac.Params.ByName['id_s'].AsInteger := QMCabeceraID_S.AsInteger;
  QMCabeceraFac.Open;

  ms := TMemoryStream.Create;
  ms.loadfromfile(ficherosello);
  QMCabeceraFac.Edit; // bueno, lo que sea
  QMCabeceraFacSELLO_DIGITAL.AsString := sello;
  QMCabeceraFacCADENA_ORIGINAL.AsString := cadena;
  QMCabeceraFacCERTIFICADO.AsString := certificado;
  QMCabeceraFacFICHERO.LoadFromStream(ms); // aquí estamos cargando ya el fichero
  ms.Free; // liberamos el intermediario que permite la carga.
  QMCabeceraFac.Post;

  {
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE GES_CABECERAS_S_FAC SET SELLO_DIGITAL=?SELLO, CADENA_ORIGINAL=?CADENA, CERTIFICADO=?SERIED, FICHERO=?FICHEROSELLO';
        Params.ByName['SELLO'].AsString := sello;
        Params.ByName['CADENA'].AsString := cadena;
        Params.ByName['SERIED'].AsString := seried;
        Params.ByName['FICHEROSELLO'].AsString := ficheroSello;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
  }
end;

procedure TDMFacturaElectronicaMx.AbrirActual(id_s: integer; generar: byte);
var
  // f : TFEligeModoXML;
  version_xml : string;
begin
  with QMCabecera do
  begin
     Close;
     Params.ByName['ID_S'].AsInteger := ID_S;
     Open;
  end;

  if (generar = 1) then
  begin
     {
     f := TFEligeModoXML.Create(Self);
     try
        if (f.ShowModal = mrOk) then
        begin
           if (f.modo = 0) then
              GenerarDocumentoXml2
           else
              GenerarDocumentoXml3;
        end;
     finally
        FreeAndNil(f);
     end;
     }
     with SPDame_Version_XML_MX do
     begin
        Close;
        Params.ByName['ID_S'].AsInteger := QMCabeceraID_S.AsInteger;
        ExecQuery;
        version_xml := FieldByName['VERSION_XML'].AsString;
        FreeHandle;
     end;
     if (version_xml = '2') then
        GenerarDocumentoXml2
     else
        GenerarDocumentoXml3;
  end;
end;

procedure TDMFacturaElectronicaMx.QMCabeceraFacAfterPost(DataSet: TDataSet);
begin
  TFIBDataSet(DataSet).Transaction.CommitRetaining;
end;

end.
