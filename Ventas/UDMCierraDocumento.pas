unit UDMCierraDocumento;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDatabase, UFIBModificados, FIBDataSetRO, HYFIBQuery, SysUtils;

type
  TDMCierraDocumento = class(TDataModule)
     QMCabeceras: TFIBTableSet;
     DSQMCabeceras: TDataSource;
     DSxSeries: TDataSource;
     xSeries: TFIBDataSetRO;
     TLocal: THYTransaction;
     xRecorre: TFIBDataSetRO;
     xRecorreENTRADA: TIntegerField;
     xRecorreEMPRESA: TIntegerField;
     xRecorreEJERCICIO: TIntegerField;
     xRecorreCANAL: TIntegerField;
     xRecorreSERIE: TFIBStringField;
     xRecorreTIPO: TFIBStringField;
     xRecorreRIG: TIntegerField;
     xRecorreFECHA: TDateTimeField;
     xRecorreID: TIntegerField;
     TUpdate: THYTransaction;
     QMCabecerasEMPRESA: TIntegerField;
     QMCabecerasEJERCICIO: TIntegerField;
     QMCabecerasCANAL: TIntegerField;
     QMCabecerasSERIE: TFIBStringField;
     QMCabecerasTIPO: TFIBStringField;
     QMCabecerasRIG: TIntegerField;
     QMCabecerasALMACEN: TFIBStringField;
     QMCabecerasMONEDA: TFIBStringField;
     QMCabecerasFECHA: TDateTimeField;
     QMCabecerasTERCERO: TIntegerField;
     QMCabecerasTITULO: TFIBStringField;
     QMCabecerasDIRECCION: TIntegerField;
     QMCabecerasCLIENTE: TIntegerField;
     QMCabecerasCONTACTO: TIntegerField;
     QMCabecerasSU_REFERENCIA: TFIBStringField;
     QMCabecerasFORMA_PAGO: TFIBStringField;
     QMCabecerasCAMPANYA: TIntegerField;
     QMCabecerasNOTAS: TBlobField;
     QMCabecerasESTADO: TIntegerField;
     QMCabecerasBULTOS: TIntegerField;
     QMCabecerasLINEAS: TIntegerField;
     QMCabecerasBRUTO: TFloatField;
     QMCabecerasI_DTO_LINEAS: TFloatField;
     QMCabecerasS_BASES: TFloatField;
     QMCabecerasM_BRUTO: TFloatField;
     QMCabecerasC_TOTAL: TFloatField;
     QMCabecerasAGENTE: TIntegerField;
     QMCabecerasS_CUOTA_IVA: TFloatField;
     QMCabecerasS_CUOTA_RE: TFloatField;
     QMCabecerasB_DTO_LINEAS: TFloatField;
     QMCabecerasDTO_PP: TFloatField;
     QMCabecerasDTO_CIAL: TFloatField;
     QMCabecerasI_DTO_CIAL: TFloatField;
     QMCabecerasI_DTO_PP: TFloatField;
     QMCabecerasB_COMISION: TFloatField;
     QMCabecerasI_COMISION: TFloatField;
     QMCabecerasPOR_FINANCIACION: TFloatField;
     QMCabecerasI_FINANCIACION: TFloatField;
     QMCabecerasLIQUIDO: TFloatField;
     QMCabecerasENTRADA: TIntegerField;
     QMCabecerasTRANSPORTISTA: TIntegerField;
     QMCabecerasI_BASE_RETENCION: TFloatField;
     QMCabecerasP_RETENCION: TFloatField;
     QMCabecerasI_RETENCION: TFloatField;
     QMCabecerasFUERZA_VENCIMIENTOS: TIntegerField;
     QMCabecerasRIC: TIntegerField;
     QMCabecerasTIPO_IRPF: TIntegerField;
     QMCabecerasA_IRPF: TIntegerField;
     QMCabecerasTOTAL_A_COBRAR: TFloatField;
     QMCabecerasDEVOLUCION: TIntegerField;
     QMCabecerasSIN_DETALLE: TIntegerField;
     QMCabecerasASIENTO: TIntegerField;
     QMCabecerasNOMBRE_COMERCIAL: TFIBStringField;
     QMCabecerasREGISTRO: TIntegerField;
     QMCabecerasPORTES: TIntegerField;
     QMCabecerasI_FINANCIACION_CANAL: TFloatField;
     QMCabecerasTARIFA: TFIBStringField;
     QMCabecerasCENTRO_COSTE: TIntegerField;
     QMCabecerasID_S: TIntegerField;
     QMCabecerasPROCESO_AUTO: TIntegerField;
     QMCabecerasFECHA_ENTREGA: TDateTimeField;
     QMCabecerasIDIOMA: TFIBStringField;
     QMCabecerasRECT: TIntegerField;
     QMCabecerasID_RECT: TIntegerField;
     QMCabecerasTIPO_PORTES: TIntegerField;
     QMCabecerasPOR_PORTES: TFloatField;
     QMCabecerasI_PORTES: TFloatField;
     QMCabecerasI_PORTES_CANAL: TFloatField;
     QMCabecerasRANGO: TIntegerField;
     QMCabecerasINDICE: TIntegerField;
     QMCabecerasCAMBIO_FIJO: TIntegerField;
     QMCabecerasVALOR_CAMB_FIJO: TFloatField;
     QMCabecerasPROYECTO: TIntegerField;
     QMCabecerasNOTAS_INTERNAS_KRI: TBlobField;
     QMCabecerasTIPO_LINEA_KRI: TIntegerField;
     QMCabecerasTIT_CONTACTO: TFIBStringField;
     QMCabecerasMODO_IVA: TIntegerField;
     QMCabecerasZ_PREFIJO_NCF: TFIBStringField;
     QMCabecerasZ_CONTADOR_NCF: TFIBStringField;
     QMCabecerasZ_TIPO_NCF: TIntegerField;
     QMCabecerasCADENA_ORIGINAL: TBlobField;
     QMCabecerasSELLO_DIGITAL: TBlobField;
     QMCabecerasCERTIFICADO: TBlobField;
     QMCabecerasFICHERO: TBlobField;
     QMCabecerasMODIFICA_DOC: TIntegerField;
     QMCabecerasNIF: TFIBStringField;
     QMCabecerasRECC: TIntegerField;
     QMCabecerasIMPORTE_ANTICIPO: TFloatField;
     QMCabecerasSALDO_ANTICIPO_A_CIERRE_FAC: TFloatField;
     QMCabecerasINVERSION_SUJETO_PASIVO: TIntegerField;
     QMCabecerasUSUARIO: TIntegerField;
     QMCabecerasEMPLEADO_RESPONSABLE: TIntegerField;
     QMCabecerasEMPLEADO_ATENCION: TIntegerField;
     QMCabecerasZ_OBSERVACION: TFIBStringField;
     QMCabecerasENTRADA_FACTURACION: TIntegerField;
     QMCabecerasPEDIDO_CLIENTE: TFIBStringField;
     QMCabecerasDIR_COMPLETA: TFIBStringField;
     QMCabecerasCODIGO_POSTAL: TFIBStringField;
     QMCabecerasLOCALIDAD: TFIBStringField;
     QMCabecerasBANCO: TIntegerField;
     QMCabecerasVALOR_CAMB_FIJO_INV: TFloatField;
     QMCabecerasREGISTRO_CARTERA: TIntegerField;
     QMCabecerasTOTAL_ANTICIPADO: TFloatField;
     QMCabecerasUNIDADES: TFloatField;
     QMCabecerasPOR_PROPINA: TFloatField;
     QMCabecerasSFV_AUTORIZACION: TFIBStringField;
     QMCabecerasSFV_NUM_DOSIFICACION: TIntegerField;
     QMCabecerasSFV_CODIGO_CONTROL: TFIBStringField;
     QMCabecerasSFV_CODIGO_RESPUESTA_RAPIDA: TFIBStringField;
     QMCabecerasPOR_RETENCION_GARANTIA: TFloatField;
     QMCabecerasI_RETENCION_GARANTIA: TFloatField;
     QMCabecerasFECHA_RETENCION_GARANTIA: TDateTimeField;
     QMCabecerasID_DEV: TIntegerField;
     QMCabecerasID_TIPO_GIRO_CLIENTE: TIntegerField;
     QMCabecerasCODIGO_GIRO_CLIENTE: TIntegerField;
     QMCabecerasID_TIPO_GIRO_EMPRESA: TIntegerField;
     QMCabecerasCODIGO_GIRO_EMPRESA: TIntegerField;
     QMCabecerasTIPO_VENTA: TIntegerField;
     QMCabecerasCODIGO_RESPUESTA_SII: TMemoField;
     QMCabecerasFOLIO: TIntegerField;
     QMCabecerasTIPO_DOC_TRIBUTARIO: TFIBStringField;
     QMCabecerasID_TIPO_DESPACHO: TIntegerField;
     QMCabecerasSII_FMA_PAGO: TIntegerField;
     QMCabecerasSIN_RECIBOS: TIntegerField;
     QMCabecerasFECHA_CON: TDateTimeField;
     QMCabecerasFECHA_ENTREGA_REPARTO: TDateTimeField;
     QMCabecerasEMPAQUETADO_EMPRESA: TIntegerField;
     QMCabecerasDIR_RECOGIDA_MANUAL: TMemoField;
     QMCabecerasDIR_ENTREGA_MANUAL: TMemoField;
     QMCabecerasEQUIPO_RECOGIDA: TFIBStringField;
     QMCabecerasEQUIPO_ENTREGA: TFIBStringField;
     QMCabecerasMATRICULA_RECOGIDA: TFIBStringField;
     QMCabecerasMATRICULA_ENTREGA: TFIBStringField;
     QMCabecerasFECHA_RECOGIDA_MANUAL: TDateTimeField;
     QMCabecerasFECHA_ENTREGA_MANUAL: TDateTimeField;
     QMCabecerasSII_ID_DOC_REF: TIntegerField;
     QMCabecerasUSUARIO_CREACION: TIntegerField;
     QMCabecerasVALOR_UNIDAD_FOMENTO: TFloatField;
     QMCabecerasPERIODO_FACTURACION_INI: TDateTimeField;
     QMCabecerasPERIODO_FACTURACION_FIN: TDateTimeField;
     QMCabecerasINDSERVICIO: TIntegerField;
     QMCabecerasRECIBO_PAGADO: TIntegerField;
     QMCabecerasLEGAL_LITERALS: TMemoField;
     QMCabecerasCOD_MOTIVO_ABONO: TIntegerField;
     QMCabecerasDIR_NOMBRE_2: TFIBStringField;
     QMCabecerasVENCIMIENTO: TDateTimeField;
     QMCabecerasEMITIDA_POR_TERCEROS: TIntegerField;
     QMCabecerasID_FICHA_TECNICA: TIntegerField;
     QMCabecerasMATRICULA: TFIBStringField;
     QMCabecerasORIGEN_DOCUMENTO: TFIBStringField;
     QMCabecerasTITULO_GIRO_CLIENTE: TFIBStringField;
     QMCabecerasTIPO_INGRESOS: TIntegerField;
     QMCabecerasGD_NROLINREF: TIntegerField;
     QMCabecerasGD_TPODOCREF: TFIBStringField;
     QMCabecerasGD_FOLIOREF: TFIBStringField;
     QMCabecerasGD_RUTOTR: TFIBStringField;
     QMCabecerasGD_FCHREF: TDateTimeField;
     QMCabecerasGD_CODREF: TIntegerField;
     QMCabecerasGD_RAZONREF: TFIBStringField;
     QMCabecerasOC_NROLINREF: TIntegerField;
     QMCabecerasOC_TPODOCREF: TFIBStringField;
     QMCabecerasOC_FOLIOREF: TFIBStringField;
     QMCabecerasOC_RUTOTR: TFIBStringField;
     QMCabecerasOC_FCHREF: TDateTimeField;
     QMCabecerasOC_CODREF: TIntegerField;
     QMCabecerasOC_RAZONREF: TFIBStringField;
     procedure QMCabecerasNewRecord(DataSet: TDataSet);
     procedure xSeriesAfterOpen(DataSet: TDataSet);
     procedure DMCierraDocumentoCreate(Sender: TObject);
     procedure xSeriesBeforeClose(DataSet: TDataSet);
     procedure QMCabecerasBeforeOpen(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MarcarTodo(Entrada: integer);
     procedure MuestraErrores;
     function HayErrores: boolean;
     procedure InicializaFacturacion;
     procedure CierraFactura(Ejercicio, Canal, Rig, id_s: integer; Serie: string; Fecha: TDateTime);
     procedure BorraTemporales;
     procedure Cerrar;
  end;

var
  DMCierraDocumento : TDMCierraDocumento;

implementation

uses UDMMain, UEntorno, UUtiles, UFMControlErroresFactura, UFParada, UFInfoFacturacionAlb, Controls;

{$R *.DFM}

procedure TDMCierraDocumento.DMCierraDocumentoCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraRO(xSeries, '11100', True);
end;

procedure TDMCierraDocumento.QMCabecerasNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMCierraDocumento.MarcarTodo(Entrada: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_MARCA_S_TODO(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := xSeries.FieldByName('SERIE').AsString;
        Params.ByName['ENTRADA'].AsInteger := Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refrescar(QMCabeceras, 'ID_S', QMCabecerasID_S.AsInteger, True, True);
end;

procedure TDMCierraDocumento.xSeriesAfterOpen(DataSet: TDataSet);
begin
  QMCabeceras.Open;
end;

function TDMCierraDocumento.HayErrores: boolean;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT COUNT(*) FROM TMP_ERRORES_FACTURACION WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        Result := (FieldByName['COUNT'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMCierraDocumento.MuestraErrores;
begin
  FMControlErroresFactura := TFMControlErroresFactura.Create(Self);
  FMControlErroresFactura.ShowModal;
  FMControlErroresFactura.Free;
end;

procedure TDMCierraDocumento.InicializaFacturacion;
begin
  BorraTemporales;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE G_CIERRE_MASIVO_FAC_PROCESA(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ENTRADA)';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := xSeries.FieldByName('SERIE').AsString;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Seleccionamos las facturas
  with xRecorre do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
     First;
  end;
end;

procedure TDMCierraDocumento.CierraFactura(Ejercicio, Canal, Rig, id_s: integer; Serie: string; Fecha: TDateTime);
var
  Anticipo : double;
begin
  if (REntorno.PAis = 'CHL') then
     DMMain.ReNumerarOrdenDetalleVenta(id_s);

  // Anticipos creados en documentos de herencia (ALB, PEC, OFC)
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(DET.LIQUIDO) ');
        SQL.Add(' FROM G_RELACIONES_ORIGENES(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG) DOC ');
        SQL.Add(' JOIN GES_CABECERAS_S_CAR REC ON REC.ID_S = DOC.ID_S ');
        SQL.Add(' JOIN EMP_CARTERA CAR ON REC.ID_CARTERA = CAR.ID_CARTERA ');
        SQL.Add(' JOIN EMP_CARTERA_DETALLE DET ON DET.ID_CARTERA = CAR.ID_CARTERA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['TIPO'].AsString := 'FAC';
        Params.ByName['RIG'].AsInteger := Rig;
        ExecQuery;
        Anticipo := FieldByName['SUM'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Actualizo el anticipo a utilizar
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE GES_CABECERAS_S_FAC SET IMPORTE_ANTICIPO = :IMPORTE_ANTICIPO WHERE ID_S = :ID_S AND IMPORTE_ANTICIPO <> :IMPORTE_ANTICIPO';
        Params.ByName['IMPORTE_ANTICIPO'].AsFloat := Anticipo;
        Params.ByName['ID_S'].AsInteger := id_s;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        AutoTrans := False;
        Close;
        Transaction := TFIBTransaction.Create(nil);
        try
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              Name := 'TCierreFactura';
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('rec_version');
              TRParams.Add('nowait');
           end;

           DataBase := DMMain.DataBase;
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;

           SQL.Text := 'EXECUTE PROCEDURE G_CIERRE_MASIVO_FAC_CIERRA(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :RIG, :FECHA, :ENTRADA, :ID_S)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           Params.ByName['CANAL'].AsInteger := Canal;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['RIG'].AsInteger := Rig;
           Params.ByName['FECHA'].AsDateTime := Fecha;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['ID_S'].AsInteger := id_s;
           ExecQuery;
           Transaction.Commit;
           FreeHandle;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure TDMCierraDocumento.BorraTemporales;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_CIERRA_FACTURAS WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMCierraDocumento.xSeriesBeforeClose(DataSet: TDataSet);
begin
  QMCabeceras.Close;
end;

procedure TDMCierraDocumento.QMCabecerasBeforeOpen(DataSet: TDataSet);
begin
  with QMCabeceras do
  begin
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ESTADO'].AsInteger := 0;
  end;
end;

procedure TDMCierraDocumento.Cerrar;
var
  WndList : Pointer;
  id_s, ejercicio, canal, factura{, empresa} : integer;
  serie : string;
  fecha : TDateTime;
  TiempoUltimaFactura : TDateTime;
begin
  Screen.Cursor := crHourGlass;
  try
     FInfoFacturacionAlb := TFInfoFacturacionAlb.Create(Self);
     WndList := DisableTaskWindows(FInfoFacturacionAlb.Handle);
     try
        with FInfoFacturacionAlb do
        begin
           LBLGeneral.Caption := _('Cierre Masivo de Documentos');
           GBProcesaCab.Caption := _('Procesando Factura');
           LBLEjercicio.Caption := '';
           LBLCanal.Caption := '';
           LBLSerie.Caption := '';
           LBLRig.Caption := '';
           Show;
        end;

        Application.ProcessMessages;

        //Insertamos en la tabla temporal las facturas elegidas
        InicializaFacturacion;

        TiempoUltimaFactura := Now;
        //Recorremos las facturas
        while not xRecorre.EOF do
        begin
           ejercicio := xRecorreEJERCICIO.AsInteger;
           canal := xRecorreCANAL.AsInteger;
           serie := xRecorreSERIE.AsString;
           factura := xRecorreRIG.AsInteger;
           fecha := xRecorreFECHA.AsDateTime;
           id_s := xRecorreID.AsInteger;

           with FInfoFacturacionAlb do
           begin
              Caption := _('Información de Facturación') + ' (' + FormatDateTime('hh:nn:ss', Now - TiempoUltimaFactura) + ')';
              TiempoUltimaFactura := Now;
              LBLGeneral.Caption := _('Cerrando Factura');
              LBLEjercicio.Caption := IntToStr(Ejercicio);
              LBLCanal.Caption := IntToStr(Canal);
              LBLSerie.Caption := Serie;
              LBLRig.Caption := IntToStr(factura);
           end;
           Application.ProcessMessages;
           CierraFactura(Ejercicio, Canal, factura, id_s, serie, fecha);
           xRecorre.Next;
        end;
        xRecorre.Close;
     finally
        EnableTaskWindows(WndList);
     end;
  finally
     Screen.Cursor := crDefault;
     BorraTemporales;
     FInfoFacturacionAlb.Close;
     FInfoFacturacionAlb.Free;

     xSeries.Close;
     xSeries.Open;

     if HayErrores then
        MuestraErrores;
  end;
end;

end.
