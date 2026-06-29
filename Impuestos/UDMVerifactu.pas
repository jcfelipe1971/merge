unit UDMVerifactu;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBDataSetRO;

type
  TDMVerifactu = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xRegFacturas: TFIBTableSet;
     DSRegFacturasPend: TDataSource;
     xRegFacturasID_SECUENCIA: TIntegerField;
     xRegFacturasTIPO_REGISTRO: TFIBStringField;
     xRegFacturasENCADENAMIENTO_PRIMERREG: TFIBStringField;
     xRegFacturasENC_RA_IDEMISORFACTURA: TFIBStringField;
     xRegFacturasENC_RA_NUMSERIEFACTURA: TFIBStringField;
     xRegFacturasENC_RA_FECHAEXPEDICIONFACTURA: TDateTimeField;
     xRegFacturasENC_RA_HUELLA: TFIBStringField;
     xRegFacturasFECHAHORAHUSOGENREGISTRO: TFIBStringField;
     xRegFacturasID_SISTEMAINFORMATICO: TIntegerField;
     xRegFacturasTIPOHUELLA: TFIBStringField;
     xRegFacturasINFO_HUELLA: TFIBStringField;
     xRegFacturasHUELLA: TFIBStringField;
     xRegFacturasID_REMISION: TIntegerField;
     xRegFacturasEMPRESA: TIntegerField;
     xRegFacturasCANAL: TIntegerField;
     xRegFactAlta: TFIBTableSet;
     DSRegFactAlta: TDataSource;
     xRegFactAltaID_SECUENCIA: TIntegerField;
     xRegFactAltaID_I: TIntegerField;
     xRegFactAltaID_S: TIntegerField;
     xRegFactAltaIDVERSION: TFIBStringField;
     xRegFactAltaIDFACTURA_IDEMISORFACTURA: TFIBStringField;
     xRegFactAltaIDFACTURA_NUMSERIEFACTURA: TFIBStringField;
     xRegFactAltaIDFACTURA_FECHAEXPEDICIONFAC: TDateTimeField;
     xRegFactAltaREFEXTERNA: TFIBStringField;
     xRegFactAltaNOMBRERAZONEMISOR: TFIBStringField;
     xRegFactAltaSUBSANACION: TFIBStringField;
     xRegFactAltaRECHAZOPREVIO: TFIBStringField;
     xRegFactAltaTIPOFACTURA: TFIBStringField;
     xRegFactAltaTIPORECTIFICATIVA: TFIBStringField;
     xRegFactAltaFR_IDFR_IDEMISORFACTURA: TFIBStringField;
     xRegFactAltaFR_IDFR_NUMSERIEFACTURA: TFIBStringField;
     xRegFactAltaFR_IDFR_FECHAEXPEDICIONFAC: TDateTimeField;
     xRegFactAltaFS_IDFS_IDEMISORFACTURA: TFIBStringField;
     xRegFactAltaFS_IDFS_NUMSERIEFACTURA: TFIBStringField;
     xRegFactAltaFS_IDFS_FECHAEXPEDICIONFAC: TDateTimeField;
     xRegFactAltaIMPORTERECT_BASERECTIFICADA: TFloatField;
     xRegFactAltaIMPORTERECT_CUOTARECTIFICADA: TFloatField;
     xRegFactAltaIMPORTERECT_CUOTARECARGORECT: TFloatField;
     xRegFactAltaFECHAOPERACION: TDateTimeField;
     xRegFactAltaDESCRIPCIONOPERACION: TFIBStringField;
     xRegFactAltaFACTURASIMPLIFICADAART7273: TFIBStringField;
     xRegFactAltaFACTURASINIDENTIFDEST: TFIBStringField;
     xRegFactAltaMACRODATO: TFIBStringField;
     xRegFactAltaEMITIDAPORTERCEROODEST: TFIBStringField;
     xRegFactAltaTERCERO_NOMBRERAZON: TFIBStringField;
     xRegFactAltaTERCERO_NIF: TFIBStringField;
     xRegFactAltaTERCERO_IDOTRO_CODIGOPAIS: TFIBStringField;
     xRegFactAltaTERCERO_IDOTRO_IDTYPE: TFIBStringField;
     xRegFactAltaTERCERO_IDOTRO_ID: TFIBStringField;
     xRegFactAltaDEST_IDD_NOMBRERAZON: TFIBStringField;
     xRegFactAltaDEST_IDD_NIF: TFIBStringField;
     xRegFactAltaDEST_IDD_IDOTRO_CODIGOPAIS: TFIBStringField;
     xRegFactAltaDEST_IDD_IDOTRO_IDTYPE: TFIBStringField;
     xRegFactAltaDEST_IDD_IDOTRO_ID: TFIBStringField;
     xRegFactAltaCUPON: TFIBStringField;
     xRegFactAltaCUOTATOTAL: TFloatField;
     xRegFactAltaIMPORTETOTAL: TFloatField;
     xRegFactAltaNUMREGISTROACUERDOFACTURACION: TFIBStringField;
     xRegFactAltaIDACUERDOSISTEMAINFORMATICO: TFIBStringField;
     xRegFactAltaINFO_QR: TFIBStringField;
     xRegFactAltaEMPRESA: TIntegerField;
     xRegFactAltaCANAL: TIntegerField;
     xRegFactAltaDesg: TFIBTableSet;
     DSRegFactAltaDesg: TDataSource;
     xRegFactAltaDesgID_SECUENCIA: TIntegerField;
     xRegFactAltaDesgIMPUESTO: TFIBStringField;
     xRegFactAltaDesgCLAVEREGIMEN: TFIBStringField;
     xRegFactAltaDesgCALIFICACIONOPERACION: TFIBStringField;
     xRegFactAltaDesgOPERACIONEXENTA: TFIBStringField;
     xRegFactAltaDesgTIPOIMPOSITIVO: TFloatField;
     xRegFactAltaDesgBASEIMPONIBLEOIMPORTENOSUJETO: TFloatField;
     xRegFactAltaDesgBASEIMPONIBLEACOSTE: TFloatField;
     xRegFactAltaDesgCUOTAREPERCUTIDA: TFloatField;
     xRegFactAltaDesgTIPORECARGOEQUIVALENCIA: TFloatField;
     xRegFactAltaDesgCUOTARECARGOEQUIVALENCIA: TFloatField;
     xRegFactAnulacion: TFIBTableSet;
     DSRegFactAnulacion: TDataSource;
     xRegFactAnulacionID_SECUENCIA: TIntegerField;
     xRegFactAnulacionID_I: TIntegerField;
     xRegFactAnulacionID_S: TIntegerField;
     xRegFactAnulacionIDVERSION: TFIBStringField;
     xRegFactAnulacionIDEMISORFACTURAANULADA: TFIBStringField;
     xRegFactAnulacionNUMSERIEFACTURAANULADA: TFIBStringField;
     xRegFactAnulacionFECHAEXPEDICIONFACTURAANULADA: TDateTimeField;
     xRegFactAnulacionREFEXTERNA: TFIBStringField;
     xRegFactAnulacionSINREGISTROPREVIO: TFIBStringField;
     xRegFactAnulacionRECHAZOPREVIO: TFIBStringField;
     xRegFactAnulacionGENERADOPOR: TFIBStringField;
     xRegFactAnulacionGENERADOR_NOMBRERAZON: TFIBStringField;
     xRegFactAnulacionGENERADOR_NIF: TFIBStringField;
     xRegFactAnulacionGENERADOR_IDOTRO_CODIGOPAIS: TFIBStringField;
     xRegFactAnulacionGENERADOR_IDOTRO_IDTYPE: TFIBStringField;
     xRegFactAnulacionGENERADOR_IDOTRO_ID: TFIBStringField;
     xRegFactAnulacionEMPRESA: TIntegerField;
     xRegFactAnulacionCANAL: TIntegerField;
     xRemision: TFIBTableSet;
     DSRemision: TDataSource;
     xRemisionEMPRESA: TIntegerField;
     xRemisionCANAL: TIntegerField;
     xRemisionTIPO: TFIBStringField;
     xRemisionID_REMISION: TIntegerField;
     xRemisionOBLIGADOEMISION_NOMBRERAZON: TFIBStringField;
     xRemisionOBLIGADOEMISION_NIF: TFIBStringField;
     xRemisionREPRESENTANTE_NOMBRERAZON: TFIBStringField;
     xRemisionREPRESENTANTE_NIF: TFIBStringField;
     xRemisionREMISIONVOL_FECHAFINVERIFACTU: TDateTimeField;
     xRemisionREMISIONVOL_INCIDENCIA: TFIBStringField;
     xRemisionREMISIONREQUERIMIENTO_REFREQ: TFIBStringField;
     xRemisionREMISIONREQUERIMIENTO_FINREQ: TFIBStringField;
     xRemisionCSV: TFIBStringField;
     xRemisionTIMESTAMPPRESENTACION: TFIBStringField;
     xRemisionESTADO_ENVIO: TFIBStringField;
     xRemisionSOAP: TFIBTableSet;
     DSRemisionSOAP: TDataSource;
     xRemisionSOAPSOAP_REQUEST: TMemoField;
     xRemisionSOAPSOAP_RESPONSE: TMemoField;
     xRegFacturasESTADO_REGISTRO: TFIBStringField;
     xRegFacturasCODIGO_ERROR_REGISTRO: TFIBStringField;
     xRegFacturasDESCRIPCIONERRORREGISTRO: TFIBStringField;
     xRegFacturasACTIVO: TIntegerField;
     xConfiguracion: TFIBTableSet;
     DSConfiguracion: TDataSource;
     xConfiguracionEMPRESA: TIntegerField;
     xConfiguracionCANAL: TIntegerField;
     xConfiguracionCERTIFICADO: TBlobField;
     xConfiguracionNOMBRERAZON: TFIBStringField;
     xConfiguracionNIF: TFIBStringField;
     xConfiguracionIDOTRO_CODIGOPAIS: TFIBStringField;
     xConfiguracionIDOTRO_IDTYPE: TFIBStringField;
     xConfiguracionIDOTRO_ID: TFIBStringField;
     xConfiguracionNOMBRESISTEMAINFORMATICO: TFIBStringField;
     xConfiguracionIDSISTEMAINFORMATICO: TFIBStringField;
     xConfiguracionNUMEROINSTALACION: TFIBStringField;
     xConfiguracionTIPOUSOPOSIBLESOLOVERIFACTU: TFIBStringField;
     xConfiguracionTIPOUSOPOSIBLEMULTIOT: TFIBStringField;
     xConfiguracionINDICADORMULTIPLESOT: TFIBStringField;
     xConfiguracionENTORNO_PREUBAS: TIntegerField;
     xConfiguracionINTERVALO_REFRESCO: TIntegerField;
     xConfiguracionCERTIFICADO_CARGADO: TStringField;
     xConfiguracionVERSION_SIF: TFIBStringField;
     xConfiguracionCERTIFICADO_FICHERO: TFIBStringField;
     xConfiguracionCERTIFICADO_VENCIMIENTO: TDateTimeField;
     xConfiguracionCERTIFICADO_CLAVE: TFIBStringField;
     DSxErrores: TDataSource;
     xErrores: TFIBDataSetRO;
     xErroresEMPRESA: TIntegerField;
     xErroresEJERCICIO: TIntegerField;
     xErroresCANAL: TIntegerField;
     xErroresSERIE: TFIBStringField;
     xErroresTIPO: TFIBStringField;
     xErroresRIG: TIntegerField;
     xErroresID_S: TIntegerField;
     xErroresTIPO_REGISTRO: TFIBStringField;
     xErroresID_SECUENCIA: TIntegerField;
     xErroresID_REMISION: TIntegerField;
     xErroresESTADO_REGISTRO: TFIBStringField;
     xErroresCODIGO_ERROR: TFIBStringField;
     xErroresDESCRIPCION_ERROR: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure xRegFacturasAfterOpen(DataSet: TDataSet);
     procedure xRegFacturasBeforeClose(DataSet: TDataSet);
     procedure xRegFactAltaAfterOpen(DataSet: TDataSet);
     procedure xRegFactAltaBeforeClose(DataSet: TDataSet);
     procedure xConfiguracionCERTIFICADO_CARGADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure MuestraRegistrosPendientes;
     procedure MuestraRegistrosRemision;
     procedure MuestraRegistrosError;
     procedure ConectaSOAP;
     procedure DesconectaSOAP;
     procedure AnularRegistroFacturacion(IdSecuencia: integer);
     procedure DuplicarRegistroFacturacion(IdSecuencia: integer);
     procedure CargaCertificado(Archivo: string);
     procedure Posiciona(IdRemision, IdSecuencia: integer);
  end;

var
  DMVerifactu : TDMVerifactu;

implementation

uses UDMMain, UUtiles, UEntorno, HYFIBQuery;

{$R *.dfm}

procedure TDMVerifactu.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  DMMain.Log('TDMVerifactu.DataModuleCreate');
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(xRegFacturas, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xRegFactAlta, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xRegFactAltaDesg, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xRegFactAnulacion, MascaraN, MascaraI, ShortDateFormat);

  AsignaDisplayFormat(xRemision, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xConfiguracion, MascaraN, MascaraI, ShortDateFormat);

  DMMain.FiltraTabla(xConfiguracion, '10100');

  MuestraRegistrosPendientes;
end;

procedure TDMVerifactu.xRegFacturasAfterOpen(DataSet: TDataSet);
begin
  xRegFactAlta.Open;
  xRegFactAnulacion.Open;
end;

procedure TDMVerifactu.xRegFacturasBeforeClose(DataSet: TDataSet);
begin
  xRegFactAlta.Close;
  xRegFactAnulacion.Close;
end;

procedure TDMVerifactu.xRegFactAltaAfterOpen(DataSet: TDataSet);
begin
  xRegFactAltaDesg.Open;
end;

procedure TDMVerifactu.xRegFactAltaBeforeClose(DataSet: TDataSet);
begin
  xRegFactAltaDesg.Close;
end;

procedure TDMVerifactu.MuestraRegistrosPendientes;
begin
  with xRegFacturas do
  begin
     Close;
     DataSource := nil;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VF_SECUENCIA ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' CANAL = :CANAL AND ');
     SelectSQL.Add(' ID_REMISION = 0 ');
     SelectSQL.Add(' ORDER BY ID_SECUENCIA ');
  end;

  DMMain.FiltraTabla(xRegFacturas, '10100');
end;

procedure TDMVerifactu.MuestraRegistrosRemision;
begin
  with xRegFacturas do
  begin
     Close;
     DataSource := DSRemision;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VF_SECUENCIA ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' CANAL = :CANAL AND ');
     SelectSQL.Add(' ID_REMISION <> 0 AND ');
     SelectSQL.Add(' ID_REMISION = :ID_REMISION ');
     SelectSQL.Add(' ORDER BY ID_SECUENCIA DESC ');
  end;

  DMMain.FiltraTabla(xRemision, '10100');
  xRegFacturas.Open;
end;

procedure TDMVerifactu.MuestraRegistrosError;
begin
  xErrores.Close;
  xErrores.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  xErrores.Params.ByName['CANAL'].AsInteger := REntorno.Canal;
  xErrores.Open;
end;

procedure TDMVerifactu.ConectaSOAP;
begin
  xRemisionSOAP.Open;
end;

procedure TDMVerifactu.DesconectaSOAP;
begin
  xRemisionSOAP.Close;
end;

procedure TDMVerifactu.AnularRegistroFacturacion(IdSecuencia: integer);
begin
  // Genera un registro de anulacion *INACTIVO* para poder retocarlo
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE VF_CREA_REGISTRO_ANULACION((SELECT ID_I FROM VF_REGISTRO_ALTA WHERE ID_SECUENCIA = :ID_SECUENCIA), 0)';
        Params.ByName['ID_SECUENCIA'].AsInteger := IdSecuencia;
        ExecQuery;
        IdSecuencia := FieldByName['ID_SECUENCIA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refrescar(xRegFacturas, 'ID_SECUENCIA', IdSecuencia);
end;

procedure TDMVerifactu.DuplicarRegistroFacturacion(IdSecuencia: integer);
begin
  // Genera un registro de *INACTIVO* para poder retocarlo
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE VF_CREA_REGISTRO_ALTA((SELECT ID_I FROM VF_REGISTRO_ALTA WHERE ID_SECUENCIA = :ID_SECUENCIA), 0)';
        Params.ByName['ID_SECUENCIA'].AsInteger := IdSecuencia;
        ExecQuery;
        IdSecuencia := FieldByName['ID_SECUENCIA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refrescar(xRegFacturas, 'ID_SECUENCIA', IdSecuencia);
end;

procedure TDMVerifactu.CargaCertificado(Archivo: string);
var
  m, f : TStream;
begin
  if not (xConfiguracion.State = dsEdit) then
     xConfiguracion.Edit;
  xConfiguracionCERTIFICADO_FICHERO.AsString := ExtractFileName(Archivo);

  m := xConfiguracion.CreateBlobStream(xConfiguracionCERTIFICADO, bmWrite);
  try
     f := TFileStream.Create(Archivo, fmOpenRead);
     try
        m.CopyFrom(f, f.Size);
     finally
        f.Free;
     end;
  finally
     m.Free;
  end;
end;

procedure TDMVerifactu.xConfiguracionCERTIFICADO_CARGADOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  if (xConfiguracionCERTIFICADO.IsNull) then
     Text := _('Pendiente')
  else
     Text := _('Cargado');
end;

procedure TDMVerifactu.Posiciona(IdRemision, IdSecuencia: integer);
begin
  Posicionar(xRemision, 'ID_REMISION', IdRemision);
  Posicionar(xRegFacturas, 'ID_SECUENCIA', IdSecuencia);
end;

end.
