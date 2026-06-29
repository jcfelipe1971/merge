unit UDMRegistroIVA;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBQuery, FIBDatabase, UFIBModificados,
  FIBDataSetRO, HYFIBQuery;

type
  TDMRegistroIVA = class(TDataModule)
     DSQMRegistroIVA: TDataSource;
     DSQMRegistroIVADetalle: TDataSource;
     TLocal: THYTransaction;
     QMRegistroIVA: TFIBTableSet;
     QMRegistroIVAEMPRESA: TIntegerField;
     QMRegistroIVAEJERCICIO: TIntegerField;
     QMRegistroIVACANAL: TIntegerField;
     QMRegistroIVASIGNO: TFIBStringField;
     QMRegistroIVAREGISTRO: TIntegerField;
     QMRegistroIVAFECHA_REGISTRO: TDateTimeField;
     QMRegistroIVACUENTA: TFIBStringField;
     QMRegistroIVADOC_NUMERO: TIntegerField;
     QMRegistroIVADOC_SERIE: TFIBStringField;
     QMRegistroIVADOC_FECHA: TDateTimeField;
     QMRegistroIVALIQUIDO: TFloatField;
     QMRegistroIVAMODO: TIntegerField;
     QMRegistroIVAS_RECARGOS: TFloatField;
     QMRegistroIVAS_BASES: TFloatField;
     QMRegistroIVAS_IVAS: TFloatField;
     QMRegistroIVADESCRIPCION_CTA: TFIBStringField;
     QMRegistroIVARIG_VISIBLE: TIntegerField;
     QMRegistroIVADOC_TIPO: TFIBStringField;
     QMRegistroIVADOC_TIPO_TITULO: TStringField;
     QMRegistroIVADetalle: TFIBTableSet;
     QMRegistroIVADetalleTIPO_IVA: TIntegerField;
     QMRegistroIVADetalleB_IMPONIBLE: TFloatField;
     QMRegistroIVADetalleP_IVA: TFloatField;
     QMRegistroIVADetalleP_REC: TFloatField;
     QMRegistroIVADetalleDesc_Tipo: TStringField;
     QMRegistroIVADetalleI_IVA: TFloatField;
     QMRegistroIVADetalleI_REC: TFloatField;
     QMRegistroIVATERCERO: TIntegerField;
     QMRegistroIVAID_I: TIntegerField;
     QMRegistroIVADetalleID_I: TIntegerField;
     QMRegistroIVADetalleID_DETALLES_I: TIntegerField;
     QMRegistroIVANIF: TFIBStringField;
     TUpdate: THYTransaction;
     QMRegistroIVARECC: TIntegerField;
     DSQMRegistroIVADetalleRECC: TDataSource;
     QMRegistroIVADetalleRECC: TFIBDataSetRO;
     QMRegistroIVADetalleRECCFECHA_PRESENTACION: TDateTimeField;
     QMRegistroIVADetalleRECCB_IMPONIBLE: TFloatField;
     QMRegistroIVADetalleRECCI_IVA: TFloatField;
     QMRegistroIVADetalleRECCI_REC: TFloatField;
     QMRegistroIVADetalleRECCID_CARTERA_DETALLE: TIntegerField;
     QMRegistroIVADetalleRECCREGISTRO_CARTERA: TStringField;
     xRLRFacEmi: TFIBTableSet;
     DSRLRFacEmi: TDataSource;
     xDesgloseFacEmi: TFIBTableSet;
     DSDesgloseFacEmi: TDataSource;
     xRLRFacRec: TFIBTableSet;
     DSRLRFacRec: TDataSource;
     xDesgloseFacRec: TFIBTableSet;
     DSDesgloseFacRec: TDataSource;
     xRLRFacEmiID_SII_PRESENTACION: TIntegerField;
     xRLRFacEmiID_SII_REGLRFACTURASEMITIDAS: TIntegerField;
     xRLRFacEmiID_SII_SUMLRFACTURASEMITIDAS: TIntegerField;
     xRLRFacEmiID_I: TIntegerField;
     xRLRFacEmiPERIODOIMPOSITIVO_EJERCICIO: TIntegerField;
     xRLRFacEmiPERIODOIMPOSITIVO_PERIODO: TFIBStringField;
     xRLRFacEmiIDFAC_EMISOR_NIF: TFIBStringField;
     xRLRFacEmiIDFAC_EMISOR_NUMSERIEFAC: TFIBStringField;
     xRLRFacEmiIDFAC_EMISOR_NUMSERIEFACFIN: TFIBStringField;
     xRLRFacEmiIDFAC_EMISOR_FECHA_EXPEDICION: TDateTimeField;
     xRLRFacEmiFACEXP_TIPOFACTURA: TFIBStringField;
     xRLRFacEmiFACEXP_TIPORECTIFICATIVA: TFIBStringField;
     xRLRFacEmiFACEXP_FAGR_NUMSERIEFACEMISOR: TFIBStringField;
     xRLRFacEmiFACEXP_FAGR_FECHAEXPEDICION: TDateTimeField;
     xRLRFacEmiFACEXP_FRECT_NUMSERIEFACEMISOR: TFIBStringField;
     xRLRFacEmiFACEXP_FRECT_FECHAEXPEDICION: TDateTimeField;
     xRLRFacEmiFACEXP_IMPRECT_BASERECT: TFloatField;
     xRLRFacEmiFACEXP_IMPRECT_CUOTARECT: TFloatField;
     xRLRFacEmiFACEXP_IMPRECT_CUOTARECRECT: TFloatField;
     xRLRFacEmiFACEXP_FECHAOPERACION: TDateTimeField;
     xRLRFacEmiFACEXP_CLAVE_REG_ESP: TFIBStringField;
     xRLRFacEmiFACEXP_CLAVE_REG_ESP1: TFIBStringField;
     xRLRFacEmiFACEXP_CLAVE_REG_ESP2: TFIBStringField;
     xRLRFacEmiFACEXP_NUMREGACUERDOFAC: TFIBStringField;
     xRLRFacEmiFACEXP_IMPORTE_TOTAL: TFloatField;
     xRLRFacEmiFACEXP_BASEIMPONIBLEACOSTE: TFloatField;
     xRLRFacEmiFACEXP_DESCRIPCION: TFIBStringField;
     xRLRFacEmiFACEXP_INMUEBLE_SITUACIONINM: TFIBStringField;
     xRLRFacEmiFACEXP_INMUEBLE_REFCATASTRAL: TFIBStringField;
     xRLRFacEmiFACEXP_IMPORTETRANSMSUJETAIVA: TFloatField;
     xRLRFacEmiFACEXP_EMITIDA_POR_TERCEROS: TFIBStringField;
     xRLRFacEmiFACEXP_VARIOSDESTINATARIOS: TFIBStringField;
     xRLRFacEmiFACEXP_CUPON: TFIBStringField;
     xRLRFacEmiFACEXP_CONTRAP_NOMBRE_RAZON: TFIBStringField;
     xRLRFacEmiFACEXP_CONTRAP_NIF_REPRES: TFIBStringField;
     xRLRFacEmiFACEXP_CONTRAP_NIF: TFIBStringField;
     xRLRFacEmiFACEXP_CONTRAPARTE_CODPAIS: TFIBStringField;
     xRLRFacEmiFACEXP_CONTRAPARTE_IDTYPE: TFIBStringField;
     xRLRFacEmiFACEXP_CONTRAPARTE_ID: TFIBStringField;
     xRLRFacEmiTIPO_DESGLOSE: TFIBStringField;
     xRLRFacEmiTIPO_DESGLOSE_OPERACION: TFIBStringField;
     xDesgloseFacEmiID_SII_PRESENTACION: TIntegerField;
     xDesgloseFacEmiID_SII_REGLRFACTURASEMITIDAS: TIntegerField;
     xDesgloseFacEmiID_SII_DESGLOSEFACTURA_EMI: TIntegerField;
     xDesgloseFacEmiSUJETA_EXENTA_CAUSA: TFIBStringField;
     xDesgloseFacEmiSUJETA_EXENTA_BASEIMPONIBLE: TFloatField;
     xDesgloseFacEmiSUJETA_NO_EXENTA_TIPO: TFIBStringField;
     xDesgloseFacEmiSUJETA_NO_EXENTA_TIPOIMP: TFloatField;
     xDesgloseFacEmiSUJETA_NO_EXENTA_BASEIMP: TFloatField;
     xDesgloseFacEmiSUJETA_NO_EXENTA_CUOTAREP: TFloatField;
     xDesgloseFacEmiSUJETA_NO_EXENTA_TIPOREC: TFloatField;
     xDesgloseFacEmiSUJETA_NO_EXENTA_CUOTAREC: TFloatField;
     xDesgloseFacEmiNO_SUJETA_IMPORTE_ART_7_14: TFloatField;
     xDesgloseFacEmiNO_SUJETA_IMPORTE_TAI: TFloatField;
     xRLRFacRecID_SII_PRESENTACION: TIntegerField;
     xRLRFacRecID_SII_REGLRFACTURASRECIBIDAS: TIntegerField;
     xRLRFacRecID_SII_SUMLRFACTURASRECIBIDAS: TIntegerField;
     xRLRFacRecID_I: TIntegerField;
     xRLRFacRecPERIODOIMPOSITIVO_EJERCICIO: TIntegerField;
     xRLRFacRecPERIODOIMPOSITIVO_PERIODO: TFIBStringField;
     xRLRFacRecIDFAC_EMISOR_NIF: TFIBStringField;
     xRLRFacRecIDFAC_EMISOR_OTRO_CODPAIS: TFIBStringField;
     xRLRFacRecIDFAC_EMISOR_OTRO_IDTYPE: TFIBStringField;
     xRLRFacRecIDFAC_EMISOR_OTRO_ID: TFIBStringField;
     xRLRFacRecIDFAC_EMISOR_NUMSERIEFAC: TFIBStringField;
     xRLRFacRecIDFAC_EMISOR_NUMSERIEFACFIN: TFIBStringField;
     xRLRFacRecIDFAC_EMISOR_FECHA_EXPEDICION: TDateTimeField;
     xRLRFacRecFACREC_TIPOFACTURA: TFIBStringField;
     xRLRFacRecFACREC_TIPORECTIFICATIVA: TFIBStringField;
     xRLRFacRecFACREC_FAGR_NUMSERIEFACEMISOR: TFIBStringField;
     xRLRFacRecFACREC_FAGR_FECHAEXPEDICION: TDateTimeField;
     xRLRFacRecFACREC_FRECT_NUMSERIEFACEMISOR: TFIBStringField;
     xRLRFacRecFACREC_FRECT_FECHAEXPEDICION: TDateTimeField;
     xRLRFacRecFACREC_IMPRECT_BASERECT: TFloatField;
     xRLRFacRecFACREC_IMPRECT_CUOTARECT: TFloatField;
     xRLRFacRecFACREC_IMPRECT_CUOTARECRECT: TFloatField;
     xRLRFacRecFACREC_FECHAOPERACION: TDateTimeField;
     xRLRFacRecFACREC_CLAVE_REG_ESP: TFIBStringField;
     xRLRFacRecFACREC_CLAVE_REG_ESP1: TFIBStringField;
     xRLRFacRecFACREC_CLAVE_REG_ESP2: TFIBStringField;
     xRLRFacRecFACREC_NUMREGACUERDOFAC: TFIBStringField;
     xRLRFacRecFACREC_IMPORTE_TOTAL: TFloatField;
     xRLRFacRecFACREC_BASEIMPONIBLEACOSTE: TFloatField;
     xRLRFacRecFACREC_DESCRIPCION: TFIBStringField;
     xRLRFacRecFACREC_ADUANAS_NUMERODUA: TFIBStringField;
     xRLRFacRecFACREC_ADUANAS_FECHAREGCONTDUA: TDateTimeField;
     xRLRFacRecFACREC_CONTRAP_NOMBRE_RAZON: TFIBStringField;
     xRLRFacRecFACREC_CONTRAP_NIF_REPRES: TFIBStringField;
     xRLRFacRecFACREC_CONTRAP_NIF: TFIBStringField;
     xRLRFacRecFACREC_CONTRAPARTE_CODPAIS: TFIBStringField;
     xRLRFacRecFACREC_CONTRAPARTE_IDTYPE: TFIBStringField;
     xRLRFacRecFACREC_CONTRAPARTE_ID: TFIBStringField;
     xRLRFacRecFACREC_FECHAREGCONTABLE: TDateTimeField;
     xRLRFacRecFACREC_CUOTA_DEDUCIBLE: TFloatField;
     xDesgloseFacRecID_SII_PRESENTACION: TIntegerField;
     xDesgloseFacRecID_SII_REGLRFACTURASRECIBIDAS: TIntegerField;
     xDesgloseFacRecID_SII_DESGLOSEFACTURA_REC: TIntegerField;
     xDesgloseFacRecISP_TIPOIMPOSITIVO: TFloatField;
     xDesgloseFacRecISP_BASEIMPONIBLE: TFloatField;
     xDesgloseFacRecISP_CUOTASOPORTADA: TFloatField;
     xDesgloseFacRecISP_TIPORECARGOEQUIVALENCIA: TFloatField;
     xDesgloseFacRecISP_CUOTARECARGOEQUIVALENCIA: TFloatField;
     xDesgloseFacRecDI_TIPOIMPOSITIVO: TFloatField;
     xDesgloseFacRecDI_BASEIMPONIBLE: TFloatField;
     xDesgloseFacRecDI_CUOTASOPORTADA: TFloatField;
     xDesgloseFacRecDI_TIPORECARGOEQUIVALENCIA: TFloatField;
     xDesgloseFacRecDI_CUOTARECARGOEQUIVALENCIA: TFloatField;
     xDesgloseFacRecDI_PORCENTCOMPSENSACIONREAGYP: TFloatField;
     xDesgloseFacRecDI_IMPORTECOMPSENSACIONREAGYP: TFloatField;
     xRLRFacEmiESTADO_REGISTRO: TFIBStringField;
     xRLRFacEmiCODIGO_ERROR: TFIBStringField;
     xRLRFacEmiDESCRIPCION_ERROR: TFIBStringField;
     xRLRFacRecESTADO_REGISTRO: TFIBStringField;
     xRLRFacRecCODIGO_ERROR: TFIBStringField;
     xRLRFacRecDESCRIPCION_ERROR: TFIBStringField;
     xRLRFacEmiTIPOCOMUNICACION_DESTINO: TFIBStringField;
     xRLRFacRecTIPOCOMUNICACION_DESTINO: TFIBStringField;
     xRLRFacRecFACREC_INMUEBLE_SITUACIONINM: TFIBStringField;
     xRLRFacRecFACREC_INMUEBLE_REFCATASTRAL: TFIBStringField;
     QMRegistroIVADetalleDEDUCIBLE: TIntegerField;
     QMRegistroIVADetalleINVERSION_SUJETO_PASIVO: TIntegerField;
     QMRegistroIVADetalleTIPO_IMPUESTO_ADICIONAL: TIntegerField;
     QMRegistroIVADetalleP_IMPUESTO_ADICIONAL: TFloatField;
     QMRegistroIVADetalleI_IMPUESTO_ADICIONAL: TFloatField;
     QMRegistroIVAS_IMPUESTO_ADICIONAL: TFloatField;
     QMRegistroIVANUM_FACTURA: TFIBStringField;
     QMRegistroIVARETENCION: TFloatField;
     QMRegistroIVAEMITIDA_POR_TERCEROS: TIntegerField;
     QMRegistroIVAANULADO: TIntegerField;
     procedure DMRegistroIVACreate(Sender: TObject);
     procedure Renumera(Periodo: string);
     procedure QMRegistroIVAAfterOpen(DataSet: TDataSet);
     procedure QMRegistroIVADOC_TIPO_TITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMRegistroIVADetalleDesc_TipoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure DMRegistroIVADestroy(Sender: TObject);
     procedure QMRegistroIVADetalleAfterPost(DataSet: TDataSet);
     procedure QMRegistroIVADetalleAfterOpen(DataSet: TDataSet);
     procedure QMRegistroIVADetalleBeforeClose(DataSet: TDataSet);
     procedure QMRegistroIVADetalleRECCREGISTRO_CARTERAGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMRegistroIVABeforeClose(DataSet: TDataSet);
     procedure xRLRFacEmiAfterOpen(DataSet: TDataSet);
     procedure xRLRFacEmiBeforeClose(DataSet: TDataSet);
     procedure xRLRFacRecAfterOpen(DataSet: TDataSet);
     procedure xRLRFacRecBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     SQLBase: TStrings;
     Signo: string[1];
     procedure BusquedaCompleja;
     procedure CambiaSigno;
     procedure FiltraRegistroIVA(AFiltro: string; ASigno: string);
     procedure MuestraRegistroCartera;
     procedure DuplicaRegistroSII(TipoComunicacion: string);
     procedure RegeneraRegistroSII;
     procedure DesvincularSIIRecibidas;
     procedure DesvincularSIIEmitidas;
     procedure SIIModificaTipoDesgloseSIIEmitidas;
     procedure AbreSII;
     procedure CierraSII;
     procedure ExportarExcel(Periodo: string; FechaInicio, FechaFin: TDateTime);
  end;

var
  DMRegistroIVA : TDMRegistroIVA;

implementation

uses UDMMain, UEntorno, uFBusca, UUtiles, UFParada, UFMain, UHojaCalc, FIBDataSetRW,
  UFSendCorreo, DateUtils, UParam;

{$R *.DFM}

procedure TDMRegistroIVA.DMRegistroIVACreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  // Se asignan las máscaras de visualización a los campos que las requieren
  AsignaDisplayFormat(QMRegistroIVA, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMRegistroIVADetalle, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMRegistroIVADetalleRECC, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xRLRFacEmi, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xDesgloseFacEmi, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xRLRFacRec, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xDesgloseFacRec, MascaraN, MascaraI, ShortDateFormat);

  SQLBase := TStringList.Create;
  SQLBase.Text := QMRegistroIVA.SelectSQL.Text;

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMRegistroIVA.DMRegistroIVADestroy(Sender: TObject);
begin
  SQLBase.Free;
end;

procedure TDMRegistroIVA.BusquedaCompleja;
var
  Orden, Signo : string;
begin
  Signo := QMRegistroIVASIGNO.AsString;
  Orden := QMRegistroIVA.OrdenadoPor;
  QMRegistroIVA.Ordenar('');
  TFBusca.Create(Self).SeleccionaBusqueda(QMRegistroIVA, '11100', False);
  with QMRegistroIVA do
  begin
     SelectSQL.Add(' AND SIGNO = ?SIGNO ');
     Params.ByName['SIGNO'].AsString := Signo;
     Ordenar(Orden);
     Open;
  end;
end;

procedure TDMRegistroIVA.Renumera(Periodo: string);
var
  DS : TFIBDataSet;
  ID : integer;
  Duplicado : string;
  Q : THYFIBQuery;
begin
  ID := QMRegistroIVAID_I.AsInteger;

  Screen.Cursor := crHourGlass;
  try
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'EXECUTE PROCEDURE E_RENUMERA_IVA (?EMPRESA, ?EJERCICIO, ?CANAL, ?SIGNO, ?PERIODO)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SIGNO'].AsString := QMRegistroIVASIGNO.AsString;
           Params.ByName['PERIODO'].AsString := Periodo;
           TFParada.Create(Self).ExecQuery(Q);
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  finally
     Screen.Cursor := crDefault;
  end;

  // Verificar si hay duplicados
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Transaction := TFIBTransaction.Create(nil);
        try
           Close;
           DataBase := DMMain.DataBase;
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
              if (not InTransaction) then
                 StartTransaction;
           end;
           SelectSQL.Add(' SELECT RIG_VISIBLE, COUNT(*) FROM EMP_REGISTRO_IVA ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
           SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SelectSQL.Add(' CANAL = ?CANAL AND ');
           SelectSQL.Add(' SIGNO = ?SIGNO ');
           SelectSQL.Add(' GROUP BY RIG_VISIBLE HAVING COUNT (*) > 1 ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SIGNO'].AsString := QMRegistroIVASIGNO.AsString;
           Open;
           Duplicado := '';
           while not EOF do
           begin
              Duplicado := Duplicado + Format('%d x %d, ', [FieldByName('RIG_VISIBLE').AsInteger, FieldByName('COUNT').AsInteger]);
              Next;
           end;

           if (Duplicado > '') then
              ShowMessage(Format(_('Duplicados: %s'), [Duplicado]));

           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     end;
  finally
     FreeAndNil(DS);
  end;

  // Verificar si cantidades coinciden
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT MAX(RIG_VISIBLE), COUNT(*) FROM EMP_REGISTRO_IVA ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SIGNO = ?SIGNO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SIGNO'].AsString := QMRegistroIVASIGNO.AsString;
        ExecQuery;
        if (FieldByName['MAX'].AsInteger <> FieldByName['COUNT'].AsInteger) then
           ShowMessage(_('La cantidad de registros no se corresponde con la renumeración'));
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Vuelvo al registro en el que estaba antes de renumerar
  Refrescar(QMRegistroIVA, 'ID_I', ID);
end;

procedure TDMRegistroIVA.QMRegistroIVAAfterOpen(DataSet: TDataSet);
begin
  QMRegistroIVADetalle.Open;
end;

procedure TDMRegistroIVA.QMRegistroIVADOC_TIPO_TITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if QMREgistroIVADOC_TIPO.AsString = 'FAC' then
     Text := _('Factura Ventas')
  else
  begin
     if QMREgistroIVADOC_TIPO.AsString = 'FAP' then
        Text := _('Factura de Proveedor');
     if QMREgistroIVADOC_TIPO.AsString = 'FCR' then
        Text := _('Factura de Acreedor');
     if QMREgistroIVADOC_TIPO.AsString = 'GBA' then
        Text := _('Gastos Bancarios');
  end;
end;

{ Filtra por el SIGNO (R: Repercutido, S:Soportado) }
procedure TDMRegistroIVA.FiltraRegistroIVA(AFiltro: string; ASigno: string);
begin
  with QMRegistroIVA do
  begin
     DisableControls;
     try
        Close;

        if (AFiltro <> '') then
        begin
           SelectSQL.Text := 'SELECT * FROM VER_EMP_REGISTRO_IVA WHERE ' + AFiltro + ' AND SIGNO = ?SIGNO ORDER BY RIG_VISIBLE';
        end
        else
        begin
           SelectSQL.Text := SQLBase.Text;
           DMMain.FiltraTabla(QMRegistroIVA, '11100', False);
        end;

        // Relleno parametro Signo
        Params.ByName['SIGNO'].AsString := ASigno;
        Open;
     finally
        EnableControls;
     end;
  end;

  Signo := ASigno;
end;

procedure TDMRegistroIVA.CambiaSigno;
begin
  // Agrego filtro SIGNO por si no existe en el filtro actual
  if (Signo = 'R') then
     FiltraRegistroIVA('', 'S')
  else
     FiltraRegistroIVA('', 'R');
end;

procedure TDMRegistroIVA.QMRegistroIVADetalleDesc_TipoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TITULO FROM SYS_TIPO_IVA WHERE PAIS = ?PAIS AND TIPO = ?TIPO_IVA';
        Params.ByName['PAIS'].AsString := REntorno.Pais;
        Params.ByName['TIPO_IVA'].AsInteger := QMRegistroIVADetalleTIPO_IVA.AsInteger;
        ExecQuery;
        Text := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMRegistroIVA.QMRegistroIVADetalleAfterPost(DataSet: TDataSet);
begin
  QMRegistroIVA.Refresh;
end;

procedure TDMRegistroIVA.QMRegistroIVADetalleAfterOpen(DataSet: TDataSet);
begin
  QMRegistroIVADetalleRECC.Open;
end;

procedure TDMRegistroIVA.QMRegistroIVADetalleBeforeClose(DataSet: TDataSet);
begin
  QMRegistroIVADetalleRECC.Close;
end;

procedure TDMRegistroIVA.QMRegistroIVADetalleRECCREGISTRO_CARTERAGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (QMRegistroIVADetalleRECCID_CARTERA_DETALLE.AsInteger = 0) then
     Text := ''
  else
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT SIGNO, REGISTRO FROM EMP_CARTERA_DETALLE WHERE ID_CARTERA_DETALLE = ?ID_CARTERA_DETALLE';
           Params.ByName['ID_CARTERA_DETALLE'].AsInteger := QMRegistroIVADetalleRECCID_CARTERA_DETALLE.AsInteger;
           ExecQuery;
           Text := FieldByName['SIGNO'].AsString + '-' + FieldByName['REGISTRO'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMRegistroIVA.MuestraRegistroCartera;
var
  Signo : string;
begin
  if (QMRegistroIVADetalleRECCID_CARTERA_DETALLE.AsInteger <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT EJERCICIO, CANAL, SIGNO, REGISTRO FROM EMP_CARTERA_DETALLE WHERE ID_CARTERA_DETALLE = ?ID_CARTERA_DETALLE';
           Params.ByName['ID_CARTERA_DETALLE'].AsInteger := QMRegistroIVADetalleRECCID_CARTERA_DETALLE.AsInteger;
           ExecQuery;
           Signo := FieldByName['SIGNO'].AsString;
           FMain.MuestraCartera(FieldByName['EJERCICIO'].AsInteger, FieldByName['CANAL'].AsInteger, Signo[1], FieldByName['REGISTRO'].AsInteger);
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMRegistroIVA.QMRegistroIVABeforeClose(DataSet: TDataSet);
begin
  QMRegistroIVADetalle.Close;
  xRLRFacEmi.Close;
  xRLRFacRec.Close;
end;

procedure TDMRegistroIVA.xRLRFacEmiAfterOpen(DataSet: TDataSet);
begin
  xDesgloseFacEmi.Open;
end;

procedure TDMRegistroIVA.xRLRFacEmiBeforeClose(DataSet: TDataSet);
begin
  xDesgloseFacEmi.Close;
end;

procedure TDMRegistroIVA.xRLRFacRecAfterOpen(DataSet: TDataSet);
begin
  xDesgloseFacRec.Open;
end;

procedure TDMRegistroIVA.xRLRFacRecBeforeClose(DataSet: TDataSet);
begin
  xDesgloseFacRec.Close;
end;

procedure TDMRegistroIVA.DuplicaRegistroSII(TipoComunicacion: string);
var
  id : integer;
begin
  if (QMRegistroIVASIGNO.AsString = 'S') then
  begin
     id := DMMain.ContadorGen('ID_SII_REGLRFACTURASRECIBIDAS');

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO SII_REGLRFACTURASRECIBIDAS ( ');
           SQL.Add('  ID_SII_REGLRFACTURASRECIBIDAS, ID_SII_PRESENTACION, ID_SII_SUMLRFACTURASRECIBIDAS, ID_I, PERIODOIMPOSITIVO_EJERCICIO, ');
           SQL.Add('  PERIODOIMPOSITIVO_PERIODO, IDFAC_EMISOR_NIF, IDFAC_EMISOR_OTRO_CODPAIS, IDFAC_EMISOR_OTRO_IDTYPE, IDFAC_EMISOR_OTRO_ID, ');
           SQL.Add('  IDFAC_EMISOR_NUMSERIEFAC, IDFAC_EMISOR_NUMSERIEFACFIN, IDFAC_EMISOR_FECHA_EXPEDICION, FACREC_TIPOFACTURA, ');
           SQL.Add('  FACREC_TIPORECTIFICATIVA, FACREC_FAGR_NUMSERIEFACEMISOR, FACREC_FAGR_FECHAEXPEDICION, FACREC_FRECT_NUMSERIEFACEMISOR, ');
           SQL.Add('  FACREC_FRECT_FECHAEXPEDICION, FACREC_IMPRECT_BASERECT, FACREC_IMPRECT_CUOTARECT, FACREC_IMPRECT_CUOTARECRECT, ');
           SQL.Add('  FACREC_FECHAOPERACION, FACREC_CLAVE_REG_ESP, FACREC_CLAVE_REG_ESP1, FACREC_CLAVE_REG_ESP2, FACREC_NUMREGACUERDOFAC, ');
           SQL.Add('  FACREC_IMPORTE_TOTAL, FACREC_BASEIMPONIBLEACOSTE, FACREC_DESCRIPCION, FACREC_ADUANAS_NUMERODUA, ');
           SQL.Add('  FACREC_ADUANAS_FECHAREGCONTDUA, FACREC_CONTRAP_NOMBRE_RAZON, FACREC_CONTRAP_NIF_REPRES, FACREC_CONTRAP_NIF, ');
           SQL.Add('  FACREC_CONTRAPARTE_CODPAIS, FACREC_CONTRAPARTE_IDTYPE, FACREC_CONTRAPARTE_ID, FACREC_FECHAREGCONTABLE, ');
           SQL.Add('  FACREC_CUOTA_DEDUCIBLE, ESTADO_REGISTRO, CODIGO_ERROR, DESCRIPCION_ERROR, TIPOCOMUNICACION_DESTINO) ');
           SQL.Add(' SELECT :ID_SII_REGLRFACTURAS, 0, 0, ID_I, PERIODOIMPOSITIVO_EJERCICIO, PERIODOIMPOSITIVO_PERIODO, IDFAC_EMISOR_NIF, ');
           SQL.Add('        IDFAC_EMISOR_OTRO_CODPAIS, IDFAC_EMISOR_OTRO_IDTYPE, IDFAC_EMISOR_OTRO_ID, IDFAC_EMISOR_NUMSERIEFAC, ');
           SQL.Add('        IDFAC_EMISOR_NUMSERIEFACFIN, IDFAC_EMISOR_FECHA_EXPEDICION, FACREC_TIPOFACTURA, FACREC_TIPORECTIFICATIVA, ');
           SQL.Add('        FACREC_FAGR_NUMSERIEFACEMISOR, FACREC_FAGR_FECHAEXPEDICION, FACREC_FRECT_NUMSERIEFACEMISOR, ');
           SQL.Add('        FACREC_FRECT_FECHAEXPEDICION, FACREC_IMPRECT_BASERECT, FACREC_IMPRECT_CUOTARECT, FACREC_IMPRECT_CUOTARECRECT, ');
           SQL.Add('        FACREC_FECHAOPERACION, FACREC_CLAVE_REG_ESP, FACREC_CLAVE_REG_ESP1, FACREC_CLAVE_REG_ESP2, ');
           SQL.Add('        FACREC_NUMREGACUERDOFAC, FACREC_IMPORTE_TOTAL, FACREC_BASEIMPONIBLEACOSTE, FACREC_DESCRIPCION, ');
           SQL.Add('        FACREC_ADUANAS_NUMERODUA, FACREC_ADUANAS_FECHAREGCONTDUA, FACREC_CONTRAP_NOMBRE_RAZON, FACREC_CONTRAP_NIF_REPRES, ');
           SQL.Add('        FACREC_CONTRAP_NIF, FACREC_CONTRAPARTE_CODPAIS, FACREC_CONTRAPARTE_IDTYPE, FACREC_CONTRAPARTE_ID, ');
           SQL.Add('        FACREC_FECHAREGCONTABLE, FACREC_CUOTA_DEDUCIBLE, '''', '''', '''', :TIPOCOMUNICACION_DESTINO ');
           SQL.Add(' FROM SII_REGLRFACTURASRECIBIDAS ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_SII_REGLRFACTURASRECIBIDAS = :ID_SII_REGLRFACTURASRECIBIDAS ');
           Params.ByName['ID_SII_REGLRFACTURAS'].AsInteger := id;
           Params.ByName['ID_SII_REGLRFACTURASRECIBIDAS'].AsInteger := xRLRFacRecID_SII_REGLRFACTURASRECIBIDAS.AsInteger;
           Params.ByName['TIPOCOMUNICACION_DESTINO'].AsString := TipoComunicacion;
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
           SQL.Add(' INSERT INTO SII_DESGLOSEFACTURA_REC ( ');
           SQL.Add('  ID_SII_REGLRFACTURASRECIBIDAS, ID_SII_PRESENTACION, ID_SII_DESGLOSEFACTURA_REC, ISP_TIPOIMPOSITIVO, ISP_BASEIMPONIBLE, ');
           SQL.Add('  ISP_CUOTASOPORTADA, ISP_TIPORECARGOEQUIVALENCIA, ISP_CUOTARECARGOEQUIVALENCIA, DI_TIPOIMPOSITIVO, DI_BASEIMPONIBLE, ');
           SQL.Add('  DI_CUOTASOPORTADA, DI_TIPORECARGOEQUIVALENCIA, DI_CUOTARECARGOEQUIVALENCIA, DI_PORCENTCOMPSENSACIONREAGYP, ');
           SQL.Add('  DI_IMPORTECOMPSENSACIONREAGYP) ');
           SQL.Add(' SELECT :ID_SII_REGLRFACTURAS, 0, 0, ISP_TIPOIMPOSITIVO, ISP_BASEIMPONIBLE, ISP_CUOTASOPORTADA, ');
           SQL.Add('        ISP_TIPORECARGOEQUIVALENCIA, ISP_CUOTARECARGOEQUIVALENCIA, DI_TIPOIMPOSITIVO, DI_BASEIMPONIBLE, ');
           SQL.Add('        DI_CUOTASOPORTADA, DI_TIPORECARGOEQUIVALENCIA, DI_CUOTARECARGOEQUIVALENCIA, DI_PORCENTCOMPSENSACIONREAGYP, ');
           SQL.Add('        DI_IMPORTECOMPSENSACIONREAGYP ');
           SQL.Add(' FROM SII_DESGLOSEFACTURA_REC ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_SII_REGLRFACTURASRECIBIDAS = :ID_SII_REGLRFACTURASRECIBIDAS ');
           Params.ByName['ID_SII_REGLRFACTURASRECIBIDAS'].AsInteger := xRLRFacRecID_SII_REGLRFACTURASRECIBIDAS.AsInteger;
           Params.ByName['ID_SII_REGLRFACTURAS'].AsInteger := id;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     xRLRFacRec.Close;
     xRLRFacRec.Open;
  end
  else
  if (QMRegistroIVASIGNO.AsString = 'R') then
  begin
     id := DMMain.ContadorGen('ID_SII_REGLRFACTURASEMITIDAS');

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO SII_REGLRFACTURASEMITIDAS ( ');
           SQL.Add('  ID_SII_REGLRFACTURASEMITIDAS, ID_SII_PRESENTACION, ID_SII_SUMLRFACTURASEMITIDAS, ID_I, PERIODOIMPOSITIVO_EJERCICIO, ');
           SQL.Add('  PERIODOIMPOSITIVO_PERIODO, IDFAC_EMISOR_NIF, IDFAC_EMISOR_NUMSERIEFAC, IDFAC_EMISOR_NUMSERIEFACFIN, ');
           SQL.Add('  IDFAC_EMISOR_FECHA_EXPEDICION, FACEXP_TIPOFACTURA, FACEXP_TIPORECTIFICATIVA, FACEXP_FAGR_NUMSERIEFACEMISOR, ');
           SQL.Add('  FACEXP_FAGR_FECHAEXPEDICION, FACEXP_FRECT_NUMSERIEFACEMISOR, FACEXP_FRECT_FECHAEXPEDICION, FACEXP_IMPRECT_BASERECT, ');
           SQL.Add('  FACEXP_IMPRECT_CUOTARECT, FACEXP_IMPRECT_CUOTARECRECT, FACEXP_FECHAOPERACION, FACEXP_CLAVE_REG_ESP, ');
           SQL.Add('  FACEXP_CLAVE_REG_ESP1, FACEXP_CLAVE_REG_ESP2, FACEXP_NUMREGACUERDOFAC, FACEXP_IMPORTE_TOTAL, ');
           SQL.Add('  FACEXP_BASEIMPONIBLEACOSTE, FACEXP_DESCRIPCION, FACEXP_INMUEBLE_SITUACIONINM, FACEXP_INMUEBLE_REFCATASTRAL, ');
           SQL.Add('  FACEXP_IMPORTETRANSMSUJETAIVA, FACEXP_EMITIDA_POR_TERCEROS, FACEXP_VARIOSDESTINATARIOS, FACEXP_CUPON, ');
           SQL.Add('  FACEXP_CONTRAP_NOMBRE_RAZON, FACEXP_CONTRAP_NIF_REPRES, FACEXP_CONTRAP_NIF, FACEXP_CONTRAPARTE_CODPAIS, ');
           SQL.Add('  FACEXP_CONTRAPARTE_IDTYPE, FACEXP_CONTRAPARTE_ID, TIPO_DESGLOSE, TIPO_DESGLOSE_OPERACION, ESTADO_REGISTRO, ');
           SQL.Add('  CODIGO_ERROR, DESCRIPCION_ERROR, TIPOCOMUNICACION_DESTINO) ');
           SQL.Add(' SELECT ');
           SQL.Add('  :ID_SII_REGLRFACTURAS, 0, 0, ID_I, PERIODOIMPOSITIVO_EJERCICIO, ');
           SQL.Add('  PERIODOIMPOSITIVO_PERIODO, IDFAC_EMISOR_NIF, IDFAC_EMISOR_NUMSERIEFAC, IDFAC_EMISOR_NUMSERIEFACFIN, ');
           SQL.Add('  IDFAC_EMISOR_FECHA_EXPEDICION, FACEXP_TIPOFACTURA, FACEXP_TIPORECTIFICATIVA, FACEXP_FAGR_NUMSERIEFACEMISOR, ');
           SQL.Add('  FACEXP_FAGR_FECHAEXPEDICION, FACEXP_FRECT_NUMSERIEFACEMISOR, FACEXP_FRECT_FECHAEXPEDICION, FACEXP_IMPRECT_BASERECT, ');
           SQL.Add('  FACEXP_IMPRECT_CUOTARECT, FACEXP_IMPRECT_CUOTARECRECT, FACEXP_FECHAOPERACION, FACEXP_CLAVE_REG_ESP, ');
           SQL.Add('  FACEXP_CLAVE_REG_ESP1, FACEXP_CLAVE_REG_ESP2, FACEXP_NUMREGACUERDOFAC, FACEXP_IMPORTE_TOTAL, ');
           SQL.Add('  FACEXP_BASEIMPONIBLEACOSTE, FACEXP_DESCRIPCION, FACEXP_INMUEBLE_SITUACIONINM, FACEXP_INMUEBLE_REFCATASTRAL, ');
           SQL.Add('  FACEXP_IMPORTETRANSMSUJETAIVA, FACEXP_EMITIDA_POR_TERCEROS, FACEXP_VARIOSDESTINATARIOS, FACEXP_CUPON, ');
           SQL.Add('  FACEXP_CONTRAP_NOMBRE_RAZON, FACEXP_CONTRAP_NIF_REPRES, FACEXP_CONTRAP_NIF, FACEXP_CONTRAPARTE_CODPAIS, ');
           SQL.Add('  FACEXP_CONTRAPARTE_IDTYPE, FACEXP_CONTRAPARTE_ID, TIPO_DESGLOSE, TIPO_DESGLOSE_OPERACION, '''', ');
           SQL.Add('  '''', '''', :TIPOCOMUNICACION_DESTINO ');
           SQL.Add('  FROM SII_REGLRFACTURASEMITIDAS ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_SII_REGLRFACTURASEMITIDAS = :ID_SII_REGLRFACTURASEMITIDAS ');
           Params.ByName['ID_SII_REGLRFACTURAS'].AsInteger := id;
           Params.ByName['ID_SII_REGLRFACTURASEMITIDAS'].AsInteger := xRLRFacEmiID_SII_REGLRFACTURASEMITIDAS.AsInteger;
           Params.ByName['TIPOCOMUNICACION_DESTINO'].AsString := TipoComunicacion;
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
           SQL.Add(' INSERT INTO SII_DESGLOSEFACTURA_EMI ( ');
           SQL.Add(' ID_SII_REGLRFACTURASEMITIDAS, ID_SII_PRESENTACION, ID_SII_DESGLOSEFACTURA_EMI, SUJETA_EXENTA_CAUSA, ');
           SQL.Add('  SUJETA_EXENTA_BASEIMPONIBLE, SUJETA_NO_EXENTA_TIPO, SUJETA_NO_EXENTA_TIPOIMP, SUJETA_NO_EXENTA_BASEIMP, ');
           SQL.Add('  SUJETA_NO_EXENTA_CUOTAREP, SUJETA_NO_EXENTA_TIPOREC, SUJETA_NO_EXENTA_CUOTAREC, NO_SUJETA_IMPORTE_ART_7_14, ');
           SQL.Add('  NO_SUJETA_IMPORTE_TAI) ');
           SQL.Add(' SELECT :ID_SII_REGLRFACTURAS, 0, 0, SUJETA_EXENTA_CAUSA, ');
           SQL.Add('        SUJETA_EXENTA_BASEIMPONIBLE, SUJETA_NO_EXENTA_TIPO, SUJETA_NO_EXENTA_TIPOIMP, SUJETA_NO_EXENTA_BASEIMP, ');
           SQL.Add('        SUJETA_NO_EXENTA_CUOTAREP, SUJETA_NO_EXENTA_TIPOREC, SUJETA_NO_EXENTA_CUOTAREC, NO_SUJETA_IMPORTE_ART_7_14, ');
           SQL.Add('        NO_SUJETA_IMPORTE_TAI ');
           SQL.Add(' FROM SII_DESGLOSEFACTURA_EMI ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_SII_REGLRFACTURASEMITIDAS = :ID_SII_REGLRFACTURASEMITIDAS ');
           Params.ByName['ID_SII_REGLRFACTURASEMITIDAS'].AsInteger := xRLRFacEmiID_SII_REGLRFACTURASEMITIDAS.AsInteger;
           Params.ByName['ID_SII_REGLRFACTURAS'].AsInteger := id;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     xRLRFacEmi.Close;
     xRLRFacEmi.Open;
  end;
end;

procedure TDMRegistroIVA.RegeneraRegistroSII;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' EXECUTE PROCEDURE SII_CREA_REGISTRO (:ID_I) ');
        Params.ByName['ID_I'].AsInteger := QMRegistroIVAID_I.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Refresco de datos
  CierraSII;
  AbreSII;
end;

procedure TDMRegistroIVA.AbreSII;
begin
  if (QMRegistroIVASIGNO.AsString = 'R') then
     xRLRFacEmi.Open
  else
     xRLRFacRec.Open;
end;

procedure TDMRegistroIVA.CierraSII;
begin
  xRLRFacEmi.Close;
  xRLRFacRec.Close;
end;

procedure TDMRegistroIVA.ExportarExcel(Periodo: string; FechaInicio, FechaFin: TDateTime);
var
  HCalc : THojaCalc;
  c, f : integer;
  Archivo : string;
  xTabla : TFIBDataSetRW;
  CantidadRegistros : integer;
  DS : TDataSource;
begin
  Archivo := Format(_('RegistroIVA-%d-%s_%s.xls'), [REntorno.Ejercicio, Periodo, FormatDateTime('yyyymmdd-hhnnss', Now)]);
  if MySaveDialog(Archivo, 'XLS,ODS,CSV', '', 'DMRegistroIVA-ExportarExcel') then
  begin
     FechaInicio := RecodeTime(FechaInicio, 0, 0, 0, 0);
     FechaFin := RecodeTime(FechaFin, 23, 59, 59, 999);

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT COUNT(*) FROM EMP_REGISTRO_IVA I ');
           SQL.Add(' JOIN EMP_REGISTRO_IVA_DETALLE D ON I.ID_I = D.ID_I ');
           SQL.Add(' WHERE ');
           SQL.Add(' I.EMPRESA = :EMPRESA AND ');
           SQL.Add(' I.EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' I.CANAL = :CANAL AND ');
           SQL.Add(' ((I.SIGNO = ''S'' AND I.FECHA_REGISTRO BETWEEN :FECHA_DESDE AND :FECHA_HASTA) OR ');
           SQL.Add('  (I.SIGNO = ''R'' AND I.DOC_FECHA BETWEEN :FECHA_DESDE AND :FECHA_HASTA)) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['FECHA_DESDE'].AsDateTime := FechaInicio;
           Params.ByName['FECHA_HASTA'].AsDateTime := FechaFin;
           ExecQuery;
           CantidadRegistros := FieldByName['COUNT'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (UpperCase(ExtractFileExt(Archivo)) = '.CSV') then
     begin
        FSendCorreo := TFSendCorreo.Create(Self);
        try
           FSendCorreo.Titulo(Format(_('Exportando Registro de IVA (Registors: %d)'), [CantidadRegistros]));
           FSendCorreo.Show;
           FSendCorreo.Texto('');

           FSendCorreo.Texto(_('Obteniendo datos (Soportado)'));
           xTabla := TFIBDataSetRW.Create(nil);
           DS := TDataSource.Create(nil);
           try
              DS.DataSet := xTabla;

              with xTabla do
              begin
                 Unidirectional := True;
                 xTabla.DataBase := DMMain.DataBase;
                 Transaction := TFIBTransaction.Create(xTabla);
                 Transaction.DefaultDatabase := DMMain.DataBase;
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;
                 if (Active) then
                    Close;
                 SelectSQL.Add(' SELECT I.EJERCICIO, I.SIGNO, I.REGISTRO REG_INTERNO, I.RIG_VISIBLE, I.FECHA_REGISTRO, I.CUENTA, I.DOC_TIPO, I.DOC_SERIE, ');
                 SelectSQL.Add('        I.DOC_NUMERO, I.DOC_FECHA, I.MODO, I.DESCRIPCION_CTA, I.TERCERO, I.NIF, I.NOMBRE, I.DIRECCION, I.C_POSTAL, ');
                 SelectSQL.Add('        I.PROVINCIA, I.PAIS, D.LINEA, D.TIPO_IVA, D.DEDUCIBLE, D.B_IMPONIBLE, D.P_IVA, D.P_REC, D.I_IVA IMPORTE_IVA, ');
                 SelectSQL.Add('        D.I_REC IMPORTE_RECARGO, D.INVERSION_SUJETO_PASIVO, ');
                 SelectSQL.Add('        CASE I.DOC_TIPO ');
                 SelectSQL.Add('          WHEN ''FAP'' THEN (SELECT NUM_FACTURA ');
                 SelectSQL.Add('                           FROM GES_CABECERAS_E_FAC ');
                 SelectSQL.Add('                           WHERE ');
                 SelectSQL.Add('                           EMPRESA = I.EMPRESA AND ');
                 SelectSQL.Add('                           EJERCICIO = I.EJERCICIO AND ');
                 SelectSQL.Add('                           CANAL = I.CANAL AND ');
                 SelectSQL.Add('                           SERIE = I.DOC_SERIE AND ');
                 SelectSQL.Add('                           TIPO = I.DOC_TIPO AND ');
                 SelectSQL.Add('                           RIG = I.DOC_NUMERO) ');
                 SelectSQL.Add('          WHEN ''FCR'' THEN (SELECT NUM_FACTURA ');
                 SelectSQL.Add('                           FROM GES_CABECERAS_E_FCR ');
                 SelectSQL.Add('                           WHERE ');
                 SelectSQL.Add('                           EMPRESA = I.EMPRESA AND ');
                 SelectSQL.Add('                           EJERCICIO = I.EJERCICIO AND ');
                 SelectSQL.Add('                           CANAL = I.CANAL AND ');
                 SelectSQL.Add('                           SERIE = I.DOC_SERIE AND ');
                 SelectSQL.Add('                           TIPO = I.DOC_TIPO AND ');
                 SelectSQL.Add('                           RIG = I.DOC_NUMERO) ');
                 SelectSQL.Add('          ELSE CAST('''' AS VARCHAR(40)) ');
                 SelectSQL.Add('        END AS NUM_FACTURA, ');
                 SelectSQL.Add('        -- Si es la primera linea exporto la retencion para evitar duplicados ');
                 SelectSQL.Add('        CASE D.LINEA ');
                 SelectSQL.Add('          WHEN 1 THEN I.RETENCION ');
                 SelectSQL.Add('          ELSE 0 ');
                 SelectSQL.Add('        END RETENCION ');
                 SelectSQL.Add(' FROM EMP_REGISTRO_IVA I ');
                 SelectSQL.Add(' JOIN EMP_REGISTRO_IVA_DETALLE D ON I.ID_I = D.ID_I ');
                 SelectSQL.Add(' WHERE ');
                 SelectSQL.Add(' I.EMPRESA = :EMPRESA AND ');
                 // SelectSQL.Add(' I.EJERCICIO = :EJERCICIO AND ');
                 SelectSQL.Add(' I.CANAL = :CANAL AND ');
                 SelectSQL.Add(' I.SIGNO = :SIGNO AND ');
                 SelectSQL.Add(' I.FECHA_REGISTRO BETWEEN :FECHA_DESDE AND :FECHA_HASTA ');
                 SelectSQL.Add(' ORDER BY I.SIGNO, I.RIG_VISIBLE, D.LINEA ');
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 // Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['SIGNO'].AsString := 'S';
                 Params.ByName['FECHA_DESDE'].AsDateTime := FechaInicio;
                 Params.ByName['FECHA_HASTA'].AsDateTime := FechaFin;
                 Open;

                 FSendCorreo.Texto(_('Exportando Registro de IVA Soportado.'));
                 ExportarCSV(ChangeFileExt(Archivo, '-' + _('Soportado') + '.csv'), DS, ';', True, True, True, DecimalSeparator);
              end;

              with xTabla do
              begin
                 Close;

                 if (Transaction.InTransaction) then
                    Transaction.Commit;
              end;
           finally
              DS.Free;
              xTabla.Free;
           end;

           FSendCorreo.Texto(_('Obteniendo datos (Soportado)'));
           xTabla := TFIBDataSetRW.Create(nil);
           DS := TDataSource.Create(nil);
           try
              DS.DataSet := xTabla;

              with xTabla do
              begin
                 Unidirectional := True;
                 xTabla.DataBase := DMMain.DataBase;
                 Transaction := TFIBTransaction.Create(xTabla);
                 Transaction.DefaultDatabase := DMMain.DataBase;
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;
                 if (Active) then
                    Close;
                 SelectSQL.Add(' SELECT I.EJERCICIO, I.SIGNO, I.REGISTRO REG_INTERNO, I.RIG_VISIBLE, I.FECHA_REGISTRO, I.CUENTA, I.DOC_TIPO, I.DOC_SERIE, ');
                 SelectSQL.Add('        I.DOC_NUMERO, I.DOC_FECHA, I.MODO, I.DESCRIPCION_CTA, I.TERCERO, I.NIF, I.NOMBRE, I.DIRECCION, I.C_POSTAL, ');
                 SelectSQL.Add('        I.PROVINCIA, I.PAIS, D.LINEA, D.TIPO_IVA, D.DEDUCIBLE, D.B_IMPONIBLE, D.P_IVA, D.P_REC, D.I_IVA IMPORTE_IVA, ');
                 SelectSQL.Add('        D.I_REC IMPORTE_RECARGO, D.INVERSION_SUJETO_PASIVO, ');
                 SelectSQL.Add('        CAST(I.DOC_TIPO || ''-'' || I.DOC_SERIE || ''/'' || I.DOC_NUMERO AS VARCHAR(40)) AS NUM_FACTURA, ');
                 SelectSQL.Add('        CAST(I.DOC_SERIE || ''/'' || I.DOC_NUMERO AS VARCHAR(40)) AS NUM_FACTURA_HACIENDA, ');
                 SelectSQL.Add('        -- Si es la primera linea exporto la retencion para evitar duplicados ');
                 SelectSQL.Add('        CASE D.LINEA ');
                 SelectSQL.Add('          WHEN 1 THEN I.RETENCION ');
                 SelectSQL.Add('          ELSE 0 ');
                 SelectSQL.Add('        END RETENCION ');
                 SelectSQL.Add(' FROM EMP_REGISTRO_IVA I ');
                 SelectSQL.Add(' JOIN EMP_REGISTRO_IVA_DETALLE D ON I.ID_I = D.ID_I ');
                 SelectSQL.Add(' WHERE ');
                 SelectSQL.Add(' I.EMPRESA = :EMPRESA AND ');
                 // SelectSQL.Add(' I.EJERCICIO = :EJERCICIO AND ');
                 SelectSQL.Add(' I.CANAL = :CANAL AND ');
                 SelectSQL.Add(' I.SIGNO = :SIGNO AND ');
                 SelectSQL.Add(' I.DOC_FECHA BETWEEN :FECHA_DESDE AND :FECHA_HASTA ');
                 SelectSQL.Add(' ORDER BY I.SIGNO, I.RIG_VISIBLE, D.LINEA ');
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 // Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['SIGNO'].AsString := 'R';
                 Params.ByName['FECHA_DESDE'].AsDateTime := FechaInicio;
                 Params.ByName['FECHA_HASTA'].AsDateTime := FechaFin;
                 Open;

                 FSendCorreo.Texto(_('Exportando Registro de IVA Repercutido.'));
                 ExportarCSV(ChangeFileExt(Archivo, '-' + _('Repercutido') + '.csv'), DS, ';', True, True, True, DecimalSeparator);
              end;

              with xTabla do
              begin
                 Close;

                 if (Transaction.InTransaction) then
                    Transaction.Commit;
              end;
           finally
              DS.Free;
              xTabla.Free;
           end;

           FSendCorreo.Texto(_('Exportacion finalizada'));
           FSendCorreo.BitBtnOk.Visible := True;
        finally
           FreeAndNil(FSendCorreo);
        end;
     end
     else
     begin
        if (UpperCase(ExtractFileExt(Archivo)) = '.ODS') then
           HCalc := THojaCalc.Create(thcOpenOffice, False) //OpenOffice doc if possible, please
        else
           HCalc := THojaCalc.Create(thcExcel, False);

        try
           FSendCorreo := TFSendCorreo.Create(Self);
           try
              FSendCorreo.Titulo(Format(_('Exportando Registro de IVA (Registors: %d)'), [CantidadRegistros]));
              FSendCorreo.Show;
              FSendCorreo.Texto('');

              HCalc.FileName := Archivo; //Needs a file name before you SaveDoc!
              //--end of creation.

              // Exportacion de Soportado
              HCalc.AddNewSheet(_('Soportado'), True);
              HCalc.ActivateSheetByIndex(1);

              FSendCorreo.Texto(_('Obteniendo datos (Soportado)'));
              xTabla := TFIBDataSetRW.Create(nil);
              try
                 with xTabla do
                 begin
                    Unidirectional := True;
                    xTabla.DataBase := DMMain.DataBase;
                    Transaction := TFIBTransaction.Create(xTabla);
                    Transaction.DefaultDatabase := DMMain.DataBase;
                    if (not Transaction.InTransaction) then
                       Transaction.StartTransaction;
                    if (Active) then
                       Close;
                    SelectSQL.Add(' SELECT I.EJERCICIO, I.SIGNO, I.REGISTRO REG_INTERNO, I.RIG_VISIBLE, I.FECHA_REGISTRO, I.CUENTA, I.DOC_TIPO, I.DOC_SERIE, ');
                    SelectSQL.Add('        I.DOC_NUMERO, I.DOC_FECHA, I.MODO, I.DESCRIPCION_CTA, I.TERCERO, I.NIF, I.NOMBRE, I.DIRECCION, I.C_POSTAL, ');
                    SelectSQL.Add('        I.PROVINCIA, I.PAIS, D.LINEA, D.TIPO_IVA, D.DEDUCIBLE, D.B_IMPONIBLE, D.P_IVA, D.P_REC, D.I_IVA IMPORTE_IVA, ');
                    SelectSQL.Add('        D.I_REC IMPORTE_RECARGO, D.INVERSION_SUJETO_PASIVO, ');
                    SelectSQL.Add('        CASE I.DOC_TIPO ');
                    SelectSQL.Add('          WHEN ''FAP'' THEN (SELECT NUM_FACTURA ');
                    SelectSQL.Add('                           FROM GES_CABECERAS_E_FAC ');
                    SelectSQL.Add('                           WHERE ');
                    SelectSQL.Add('                           EMPRESA = I.EMPRESA AND ');
                    SelectSQL.Add('                           EJERCICIO = I.EJERCICIO AND ');
                    SelectSQL.Add('                           CANAL = I.CANAL AND ');
                    SelectSQL.Add('                           SERIE = I.DOC_SERIE AND ');
                    SelectSQL.Add('                           TIPO = I.DOC_TIPO AND ');
                    SelectSQL.Add('                           RIG = I.DOC_NUMERO) ');
                    SelectSQL.Add('          WHEN ''FCR'' THEN (SELECT NUM_FACTURA ');
                    SelectSQL.Add('                           FROM GES_CABECERAS_E_FCR ');
                    SelectSQL.Add('                           WHERE ');
                    SelectSQL.Add('                           EMPRESA = I.EMPRESA AND ');
                    SelectSQL.Add('                           EJERCICIO = I.EJERCICIO AND ');
                    SelectSQL.Add('                           CANAL = I.CANAL AND ');
                    SelectSQL.Add('                           SERIE = I.DOC_SERIE AND ');
                    SelectSQL.Add('                           TIPO = I.DOC_TIPO AND ');
                    SelectSQL.Add('                           RIG = I.DOC_NUMERO) ');
                    SelectSQL.Add('          ELSE CAST('''' AS VARCHAR(40)) ');
                    SelectSQL.Add('        END AS NUM_FACTURA, ');
                    SelectSQL.Add('        -- Si es la primera linea exporto la retencion para evitar duplicados ');
                    SelectSQL.Add('        CASE D.LINEA ');
                    SelectSQL.Add('          WHEN 1 THEN I.RETENCION ');
                    SelectSQL.Add('          ELSE 0 ');
                    SelectSQL.Add('        END RETENCION ');
                    SelectSQL.Add(' FROM EMP_REGISTRO_IVA I ');
                    SelectSQL.Add(' JOIN EMP_REGISTRO_IVA_DETALLE D ON I.ID_I = D.ID_I ');
                    SelectSQL.Add(' WHERE ');
                    SelectSQL.Add(' I.EMPRESA = :EMPRESA AND ');
                    // SelectSQL.Add(' I.EJERCICIO = :EJERCICIO AND ');
                    SelectSQL.Add(' I.CANAL = :CANAL AND ');
                    SelectSQL.Add(' I.SIGNO = :SIGNO AND ');
                    SelectSQL.Add(' I.FECHA_REGISTRO BETWEEN :FECHA_DESDE AND :FECHA_HASTA ');
                    SelectSQL.Add(' ORDER BY I.SIGNO, I.RIG_VISIBLE, D.LINEA ');
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    // Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                    Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                    Params.ByName['SIGNO'].AsString := 'S';
                    Params.ByName['FECHA_DESDE'].AsDateTime := FechaInicio;
                    Params.ByName['FECHA_HASTA'].AsDateTime := FechaFin;
                    Open;

                    // Encabezado
                    f := 1;
                    for c := 0 to xTabla.FieldCount - 1 do
                    begin
                       HCalc.CellText[f, c + 1] := xTabla.Fields[c].FieldName;
                      {
                      if (xTabla.Fields[c] is TFloatField) then
                         if (HCalc.IsOpenOffice) then
                            HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
                         // HCalc.ColNumberFormat(c + 1, '###0.00');
                      }
                      {
                      if (xTabla.Fields[c] is TDateTimeField) then
                         HCalc.ColNumberFormat(c + 1, 'MM/DD/YYYY');
                      }
                    end;

                    while not EOF do
                    begin
                       Inc(f);
                       Dec(CantidadRegistros);
                       if (CantidadRegistros mod 10 = 0) then
                          FSendCorreo.Texto(Format(_('Exportando Registro de IVA Soportado.' + #13#10 + 'Quedan %d registros'), [CantidadRegistros]));
                       for c := 0 to xTabla.FieldCount - 1 do
                       begin
                          // Campo tipo String
                          if (xTabla.Fields[c] is TStringField) then
                             HCalc.CellText[f, c + 1] := Trim(xTabla.Fields[c].AsString);

                          // Campo tipo Float
                          if (xTabla.Fields[c] is TFloatField) then
                             HCalc.SendNumber(f, c + 1, xTabla.Fields[c].AsFloat);

                          // Campo tipo Integer
                          if (xTabla.Fields[c] is TIntegerField) then
                             HCalc.SendNumber(f, c + 1, xTabla.Fields[c].AsInteger);

                          // Campo tipo Fecha
                          if (xTabla.Fields[c] is TDateTimeField) then
                          begin
                             // HCalc.SendDate(f, c + 1, xTabla.Fields[c].AsDateTime)
                             if (HCalc.IsOpenOffice) then
                                HCalc.CellText[f, c + 1] := DateToStr(xTabla.Fields[c].AsDateTime)
                             else
                                HCalc.CellText[f, c + 1] := Trim(FormatDateTime('MM/DD/YYYY', xTabla.Fields[c].AsDateTime));
                          end;

                          // Campo tipo Blob
                          // Los blobs exportan solo caracteres basicos.
                          if (xTabla.Fields[c] is TBlobField) then
                          begin
                             try
                                HCalc.CellText[f, c + 1] := Trim(LimpiaCadena(xTabla.Fields[c].AsString));
                             except
                                HCalc.CellText[f, c + 1] := 'BLOB';
                             end;
                          end;
                       end;

                       Next;
                       // Application.ProcessMessages;
                    end;

                    for c := 0 to xTabla.FieldCount - 1 do
                    begin
                       // Campo tipo String
                       if (xTabla.Fields[c] is TStringField) then
                          HCalc.AutoFit(c + 1);

                       // Formato de columna
                       if (xTabla.Fields[c] is TFloatField) then
                          if (HCalc.IsOpenOffice) then
                             HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
                    end;

                    Close;

                    if (Transaction.InTransaction) then
                       Transaction.Commit;
                 end;
              finally
                 xTabla.Free;
              end;

              // Exportacion de Repercutido
              HCalc.AddNewSheet(_('Repercutido'));
              HCalc.ActivateSheetByIndex(2);

              FSendCorreo.Texto(_('Obteniendo datos (Repercutido)'));

              xTabla := TFIBDataSetRW.Create(nil);
              try
                 with xTabla do
                 begin
                    Unidirectional := True;
                    xTabla.DataBase := DMMain.DataBase;
                    Transaction := TFIBTransaction.Create(xTabla);
                    Transaction.DefaultDatabase := DMMain.DataBase;
                    if (not Transaction.InTransaction) then
                       Transaction.StartTransaction;
                    if (Active) then
                       Close;
                    SelectSQL.Add(' SELECT I.EJERCICIO, I.SIGNO, I.REGISTRO REG_INTERNO, I.RIG_VISIBLE, I.FECHA_REGISTRO, I.CUENTA, I.DOC_TIPO, I.DOC_SERIE, ');
                    SelectSQL.Add('        I.DOC_NUMERO, I.DOC_FECHA, I.MODO, I.DESCRIPCION_CTA, I.TERCERO, I.NIF, I.NOMBRE, I.DIRECCION, I.C_POSTAL, ');
                    SelectSQL.Add('        I.PROVINCIA, I.PAIS, D.LINEA, D.TIPO_IVA, D.DEDUCIBLE, D.B_IMPONIBLE, D.P_IVA, D.P_REC, D.I_IVA IMPORTE_IVA, ');
                    SelectSQL.Add('        D.I_REC IMPORTE_RECARGO, D.INVERSION_SUJETO_PASIVO, ');
                    SelectSQL.Add('        CAST(I.DOC_TIPO || ''-'' || I.DOC_SERIE || ''/'' || I.DOC_NUMERO AS VARCHAR(40)) AS NUM_FACTURA, ');
                    SelectSQL.Add('        CAST(I.DOC_SERIE || ''/'' || I.DOC_NUMERO AS VARCHAR(40)) AS NUM_FACTURA_HACIENDA, ');
                    SelectSQL.Add('        -- Si es la primera linea exporto la retencion para evitar duplicados ');
                    SelectSQL.Add('        CASE D.LINEA ');
                    SelectSQL.Add('          WHEN 1 THEN I.RETENCION ');
                    SelectSQL.Add('          ELSE 0 ');
                    SelectSQL.Add('        END RETENCION ');
                    SelectSQL.Add(' FROM EMP_REGISTRO_IVA I ');
                    SelectSQL.Add(' JOIN EMP_REGISTRO_IVA_DETALLE D ON I.ID_I = D.ID_I ');
                    SelectSQL.Add(' WHERE ');
                    SelectSQL.Add(' I.EMPRESA = :EMPRESA AND ');
                    // SelectSQL.Add(' I.EJERCICIO = :EJERCICIO AND ');
                    SelectSQL.Add(' I.CANAL = :CANAL AND ');
                    SelectSQL.Add(' I.SIGNO = :SIGNO AND ');
                    SelectSQL.Add(' I.DOC_FECHA BETWEEN :FECHA_DESDE AND :FECHA_HASTA ');
                    SelectSQL.Add(' ORDER BY I.SIGNO, I.RIG_VISIBLE, D.LINEA ');
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    // Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                    Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                    Params.ByName['SIGNO'].AsString := 'R';
                    Params.ByName['FECHA_DESDE'].AsDateTime := FechaInicio;
                    Params.ByName['FECHA_HASTA'].AsDateTime := FechaFin;
                    Open;

                    // Encabezado
                    f := 1;
                    for c := 0 to xTabla.FieldCount - 1 do
                    begin
                       HCalc.CellText[f, c + 1] := xTabla.Fields[c].FieldName;
                      {
                      if (xTabla.Fields[c] is TFloatField) then
                         if (HCalc.IsOpenOffice) then
                            HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
                         // HCalc.ColNumberFormat(c + 1, '###0.00');
                      }
                    end;

                    while not EOF do
                    begin
                       Inc(f);
                       Dec(CantidadRegistros);
                       if (CantidadRegistros mod 10 = 0) then
                          FSendCorreo.Texto(Format(_('Exportando Registro de IVA Repercutido' + #13#10 + 'Quedan %d registros'), [CantidadRegistros]));
                       for c := 0 to xTabla.FieldCount - 1 do
                       begin
                          // Campo tipo String
                          if (xTabla.Fields[c] is TStringField) then
                             HCalc.CellText[f, c + 1] := Trim(xTabla.Fields[c].AsString);

                          // Campo tipo Float
                          if (xTabla.Fields[c] is TFloatField) then
                             HCalc.SendNumber(f, c + 1, xTabla.Fields[c].AsFloat);

                          // Campo tipo Integer
                          if (xTabla.Fields[c] is TIntegerField) then
                             HCalc.SendNumber(f, c + 1, xTabla.Fields[c].AsInteger);

                          // Campo tipo Fecha
                          if (xTabla.Fields[c] is TDateTimeField) then
                          begin
                             // HCalc.SendDate(f, c + 1, xTabla.Fields[c].AsDateTime)
                             if (HCalc.IsOpenOffice) then
                                HCalc.CellText[f, c + 1] := DateToStr(xTabla.Fields[c].AsDateTime)
                             else
                                HCalc.CellText[f, c + 1] := Trim(FormatDateTime('MM/DD/YYYY', xTabla.Fields[c].AsDateTime));
                          end;

                          // Campo tipo Blob
                          // Los blobs exportan solo caracteres basicos.
                          if (xTabla.Fields[c] is TBlobField) then
                          begin
                             try
                                HCalc.CellText[f, c + 1] := Trim(LimpiaCadena(xTabla.Fields[c].AsString));
                             except
                                HCalc.CellText[f, c + 1] := 'BLOB';
                             end;
                          end;
                       end;

                       Next;
                       // Application.ProcessMessages;
                    end;

                    for c := 0 to xTabla.FieldCount - 1 do
                    begin
                       // Campo tipo String
                       if (xTabla.Fields[c] is TStringField) then
                          HCalc.AutoFit(c + 1);

                       // Formato de columna
                       if (xTabla.Fields[c] is TFloatField) then
                          if (HCalc.IsOpenOffice) then
                             HCalc.ColNumberFormat(c + 1, '#' + ThousandSeparator + '##0' + DecimalSeparator + '00');
                    end;

                    Close;

                    if (Transaction.InTransaction) then
                       Transaction.Commit;
                 end;
              finally
                 xTabla.Free;
              end;

              FSendCorreo.Texto(_('Guardando fichero'));
              Application.ProcessMessages;
              HCalc.SaveDocAs(Archivo, (Pos('.XLS', UpperCase(ExtractFileExt(Archivo))) > 0));

              FSendCorreo.Texto(_('Exportacion finalizada'));
              FSendCorreo.BitBtnOk.Visible := True;
           finally
              FreeAndNil(FSendCorreo);
           end;
        finally
           Sleep(1000);
           Application.ProcessMessages;
           HCalc.Free;
        end;
     end;
  end;
end;

procedure TDMRegistroIVA.DesvincularSIIEmitidas;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE SII_REGLRFACTURASEMITIDAS ');
        SQL.Add(' SET ID_I = 0 ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_SII_REGLRFACTURASEMITIDAS = :ID_SII_REGLRFACTURASEMITIDAS ');
        Params.ByName['ID_SII_REGLRFACTURASEMITIDAS'].AsInteger := xRLRFacEmiID_SII_REGLRFACTURASEMITIDAS.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Refresco de datos
  CierraSII;
  AbreSII;
end;

procedure TDMRegistroIVA.DesvincularSIIRecibidas;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE SII_REGLRFACTURASRECIBIDAS ');
        SQL.Add(' SET ID_I = 0 ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_SII_REGLRFACTURASRECIBIDAS = :ID_SII_REGLRFACTURASRECIBIDAS ');
        Params.ByName['ID_SII_REGLRFACTURASRECIBIDAS'].AsInteger := xRLRFacRecID_SII_REGLRFACTURASRECIBIDAS.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Refresco de datos
  CierraSII;
  AbreSII;
end;

procedure TDMRegistroIVA.SIIModificaTipoDesgloseSIIEmitidas;
begin
  /// Modifica el Tipo de Desglos y Tipo de Operacion entre ('F', '') y ('O', 'E')
  /// No se de qué depende este dato.

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE SII_REGLRFACTURASEMITIDAS ');
        SQL.Add(' SET ');
        SQL.Add(' TIPO_DESGLOSE = :TIPO_DESGLOSE, ');
        SQL.Add(' TIPO_DESGLOSE_OPERACION = :TIPO_DESGLOSE_OPERACION ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_SII_REGLRFACTURASEMITIDAS = :ID_SII_REGLRFACTURASEMITIDAS ');
        Params.ByName['ID_SII_REGLRFACTURASEMITIDAS'].AsInteger := xRLRFacEmiID_SII_REGLRFACTURASEMITIDAS.AsInteger;
        if (xRLRFacEmiTIPO_DESGLOSE.AsString = 'F') then
        begin
           Params.ByName['TIPO_DESGLOSE'].AsString := 'O';
           Params.ByName['TIPO_DESGLOSE_OPERACION'].AsString := 'E';
        end
        else
        begin
           Params.ByName['TIPO_DESGLOSE'].AsString := 'F';
           Params.ByName['TIPO_DESGLOSE_OPERACION'].AsString := '';
        end;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Refresco de datos
  CierraSII;
  AbreSII;
end;

end.
