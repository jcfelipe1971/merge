unit UDMIncidencias;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBQuery, HYFIBQuery, FIBDataSetRO, ScriptQuery,
  Controls, ShellApi, FIBTableDataSetRO;

type
  TDMIncidencias = class(TDataModule)
     TLocal: THYTransaction;
     QMIncidencias: TFIBTableSet;
     DSQMIncidencias: TDataSource;
     QMIncidenciasEMPRESA: TIntegerField;
     QMIncidenciasINCIDENCIA: TIntegerField;
     QMIncidenciasTITULO_INCIDENCIA: TFIBStringField;
     QMIncidenciasFECHA: TDateTimeField;
     QMIncidenciasFECHA_RECEPCION: TDateTimeField;
     QMIncidenciasTIPO_TERCERO: TFIBStringField;
     QMIncidenciasCOD_CLI_PRO: TIntegerField;
     QMIncidenciasTERCERO: TIntegerField;
     QMIncidenciasTITULO_TERCERO: TFIBStringField;
     QMIncidenciasDATOS_INCIDENCIA: TBlobField;
     QMIncidenciasFECHA_RESPUESTA: TDateTimeField;
     QMIncidenciasRESPUESTA_INCIDENCIA: TBlobField;
     QMIncidenciasID_S: TIntegerField;
     QMIncidenciasID_E: TIntegerField;
     QGen: THYFIBQuery;
     QMIncidenciasDOC_EJERCICIO: TIntegerField;
     QMIncidenciasDOC_SERIE: TFIBStringField;
     QMIncidenciasDOC_CANAL: TIntegerField;
     QMIncidenciasDOC_TIPO: TFIBStringField;
     QMIncidenciasDOC_RIG: TIntegerField;
     xTipoMov: TFIBDataSetRO;
     DSxTipoMov: TDataSource;
     xTipoMovTITULO: TFIBStringField;
     xSerie: TFIBDataSetRO;
     FIBStringField1: TFIBStringField;
     DSxSerie: TDataSource;
     xCanal: TFIBDataSetRO;
     FIBStringField2: TFIBStringField;
     DSxCanal: TDataSource;
     xUsuarios: TFIBDataSetRO;
     xUsuariosNOMBRE: TFIBStringField;
     DSxUsuarios: TDataSource;
     xUsuariosUSUARIO: TIntegerField;
     QMIncidenciasENTRADA: TIntegerField;
     TUpdate: THYTransaction;
     QMIncidenciasDIRECCION: TIntegerField;
     QMIncidenciasDIR_NOMBRE: TFIBStringField;
     QMIncidenciasAGENTE: TIntegerField;
     QMIncidenciasCONTACTO: TIntegerField;
     QMIncidenciasTIT_CONTACTO: TFIBStringField;
     QMIncidenciasTIT_AGENTE: TFIBStringField;
     QMIncidenciasTIPO_INCIDENCIA_KRI: TFIBStringField;
     QMIncidenciasTIT_TIPO_INCIDENCIA_KRI: TFIBStringField;
     QMIncidenciasUSUARIO: TIntegerField;
     QMIncidenciasNOMBRE_USUARIO: TFIBStringField;
     QMIncidenciasHORAS: TFloatField;
     QMIncidenciasFINALIZADO: TIntegerField;
     QMIncidenciasCONTACTO2: TIntegerField;
     QMIncidenciasTIT_CONTACTO2: TFIBStringField;
     QMIncidenciasCONTACTO3: TIntegerField;
     QMIncidenciasTIT_CONTACTO3: TFIBStringField;
     QMIncidenciasHORASEDIT: TStringField;
     xVentas: TFIBTableSetRO;
     xVentasEMPRESA: TIntegerField;
     xVentasEJERCICIO: TIntegerField;
     xVentasCANAL: TIntegerField;
     xVentasSERIE: TFIBStringField;
     xVentasTIPO: TFIBStringField;
     xVentasRIG: TIntegerField;
     xVentasALMACEN: TFIBStringField;
     xVentasMONEDA: TFIBStringField;
     xVentasFECHA: TDateTimeField;
     xVentasCLIENTE: TIntegerField;
     xVentasTERCERO: TIntegerField;
     xVentasDIRECCION: TIntegerField;
     xVentasSU_REFERENCIA: TFIBStringField;
     xVentasFORMA_PAGO: TFIBStringField;
     xVentasCAMPANYA: TIntegerField;
     xVentasNOTAS: TBlobField;
     xVentasESTADO: TIntegerField;
     xVentasBULTOS: TIntegerField;
     xVentasLINEAS: TIntegerField;
     xVentasBRUTO: TFloatField;
     xVentasI_DTO_LINEAS: TFloatField;
     xVentasS_BASES: TFloatField;
     xVentasM_BRUTO: TFloatField;
     xVentasC_TOTAL: TFloatField;
     xVentasAGENTE: TIntegerField;
     xVentasS_CUOTA_IVA: TFloatField;
     xVentasS_CUOTA_RE: TFloatField;
     xVentasB_DTO_LINEAS: TFloatField;
     xVentasDTO_PP: TFloatField;
     xVentasDTO_CIAL: TFloatField;
     xVentasB_COMISION: TFloatField;
     xVentasI_COMISION: TFloatField;
     xVentasPOR_FINANCIACION: TFloatField;
     xVentasI_FINANCIACION: TFloatField;
     xVentasLIQUIDO: TFloatField;
     xVentasENTRADA: TIntegerField;
     xVentasPROCESO_AUTO: TIntegerField;
     xVentasI_DTO_PP: TFloatField;
     xVentasI_DTO_CIAL: TFloatField;
     xVentasPORTES: TIntegerField;
     xVentasI_FINANCIACION_CANAL: TFloatField;
     xVentasS_BASES_CANAL: TFloatField;
     xVentasS_CUOTA_IVA_CANAL: TFloatField;
     xVentasS_CUOTA_RE_CANAL: TFloatField;
     xVentasLIQUIDO_CANAL: TFloatField;
     xVentasCHG_MONEDA: TIntegerField;
     xVentasTARIFA: TFIBStringField;
     DSxVentas: TDataSource;
     xVentasDetalle: TFIBTableSetRO;
     DSxVentasDetalle: TDataSource;
     xVentasID_S: TIntegerField;
     xVentasDetalleEMPRESA: TIntegerField;
     xVentasDetalleEJERCICIO: TIntegerField;
     xVentasDetalleCANAL: TIntegerField;
     xVentasDetalleSERIE: TFIBStringField;
     xVentasDetalleTIPO: TFIBStringField;
     xVentasDetalleRIG: TIntegerField;
     xVentasDetalleLINEA: TIntegerField;
     xVentasDetalleALMACEN: TFIBStringField;
     xVentasDetalleARTICULO: TFIBStringField;
     xVentasDetalleTITULO: TFIBStringField;
     xVentasDetalleUNIDADES: TFloatField;
     xVentasDetallePRECIO: TFloatField;
     xVentasDetallePIEZAS_X_BULTO: TIntegerField;
     xVentasDetalleBULTOS: TIntegerField;
     xVentasDetalleDESCUENTO: TFloatField;
     xVentasDetalleDESCUENTO_2: TFloatField;
     xVentasDetalleDESCUENTO_3: TFloatField;
     xVentasDetalleCOMISION: TFloatField;
     xVentasDetalleP_COSTE: TFloatField;
     xVentasDetalleM_MOV_STOCK: TIntegerField;
     xVentasDetallePAIS: TFIBStringField;
     xVentasDetalleTIPO_IVA: TIntegerField;
     xVentasDetalleP_IVA: TFloatField;
     xVentasDetalleP_RECARGO: TFloatField;
     xVentasDetalleBRUTO: TFloatField;
     xVentasDetalleB_COMISION: TFloatField;
     xVentasDetalleDTO_PP: TFloatField;
     xVentasDetalleDTO_CIAL: TFloatField;
     xVentasDetalleI_DTO_PP: TFloatField;
     xVentasDetalleI_DTO_CIAL: TFloatField;
     xVentasDetalleI_DESCUENTO: TFloatField;
     xVentasDetalleB_IMPONIBLE: TFloatField;
     xVentasDetalleB_DTO_LINEA: TFloatField;
     xVentasDetalleI_COMISION: TFloatField;
     xVentasDetalleC_IVA: TFloatField;
     xVentasDetalleC_RECARGO: TFloatField;
     xVentasDetalleT_COSTE: TFloatField;
     xVentasDetalleM_BRUTO: TFloatField;
     xVentasDetalleLIQUIDO: TFloatField;
     xVentasDetalleENTRADA: TIntegerField;
     xVentasDetalleNOTAS: TBlobField;
     xVentasDetalleUNIDADES_EXT: TFloatField;
     xVentasDetalleIVA_INCLUIDO: TIntegerField;
     xVentasDetalleNSERIE: TFIBStringField;
     xVentasDetalleB_COMISION_CANAL: TFloatField;
     xVentasDetalleEJER_MOV: TIntegerField;
     xVentasDetalleUNIDADES_SEC: TFloatField;
     xVentasDetalleNO_FABRICACION_KRI: TFIBStringField;
     xVentasDetalleID_S: TIntegerField;
     xVentasDetalleID_DETALLES_S: TIntegerField;
     xVentasDetalleID_D_S_GR: TIntegerField;
     xVentasDetalleID_A_M_C_T: TIntegerField;
     xVentasDetalleID_C_A: TIntegerField;
     xVentasDetalleID_A: TIntegerField;
     xVentasDetalleID_MOV_STOCKS: TIntegerField;
     xVentasDetalleCOMISION_LINEAL: TFloatField;
     xVentasDetalleI_COMISION_LINEAL: TFloatField;
     xVentasDetalleTITULO_IDIOMA: TFIBStringField;
     xVentasDetalleMARGEN_KRI: TFloatField;
     xVentasDetalleTIPO_LINEA_KRI: TIntegerField;
     xVentasDetalleORDEN: TIntegerField;
     xVentasDetalleTIPO_LINEA: TFIBStringField;
     xVentasDetalleORIGEN: TIntegerField;
     xVentasDetallePROC_PROMOCION: TIntegerField;
     xVentasDetalleID_P: TIntegerField;
     xVentasDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField;
     xVentasDetallePROYECTO: TIntegerField;
     xVentasDetalleCERTIFICADO: TIntegerField;
     xVentasDetalleCERT_NEGATIVO: TIntegerField;
     xVentasDetalleLINEA_RELACION: TIntegerField;
     xVentasDetalleNOTAS2: TBlobField;
     xVentasDetalleCRC_NOTAS: TFIBStringField;
     xVentasDetalleCRC_NOTAS2: TFIBStringField;
     xVentasDetallePRO_NUM_PLANO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMIncidenciasNewRecord(DataSet: TDataSet);
     procedure QMIncidenciasTERCEROChange(Sender: TField);
     procedure QMIncidenciasDOC_TIPOChange(Sender: TField);
     procedure QMIncidenciasAfterOpen(DataSet: TDataSet);
     procedure QMIncidenciasBeforePost(DataSet: TDataSet);
     procedure QMIncidenciasDOC_CANALChange(Sender: TField);
     procedure QMIncidenciasDOC_SERIEChange(Sender: TField);
     procedure QMIncidenciasCOD_CLI_PROChange(Sender: TField);
     procedure Graba(DataSet: TDataSet);
     procedure QMIncidenciasAGENTEChange(Sender: TField);
     procedure QMIncidenciasCONTACTOChange(Sender: TField);
     procedure QMIncidenciasTIPO_INCIDENCIA_KRIChange(Sender: TField);
     procedure QMIncidenciasDIRECCIONChange(Sender: TField);
     procedure QMIncidenciasCONTACTO2Change(Sender: TField);
     procedure QMIncidenciasCONTACTO3Change(Sender: TField);
     procedure QMIncidenciasHORASEDITGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMIncidenciasHORASEDITChange(Sender: TField);
     procedure QMIncidenciasBeforeScroll(DataSet: TDataSet);
     procedure QMIncidenciasAfterScroll(DataSet: TDataSet);
     procedure QMIncidenciasBeforeDelete(DataSet: TDataSet);
     procedure xVentasAfterOpen(DataSet: TDataSet);
     procedure xVentasBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     ClienteAnt: integer;
     AgenteUsuario: integer;
  public
     { Public declarations }
     TipoTercero: string;
     CodCliPro{, Ter}: integer;
     TipoInt, ModoForm: smallint;
     procedure FiltraMaestro(Incidencia, Maestro, DireccionKri: integer);
     procedure MuestraListado;
     procedure CambiaTipo(Tipo: smallint);
     procedure BusquedaCompleja;
     procedure AbreVentas(CodCliPro, Direccion: integer);
     procedure CierraVentas;
     procedure DuplicarIncidencia;
  end;

var
  DMIncidencias : TDMIncidencias;

implementation

uses UEntorno, UFBusca, UFPregIncidencias, UDMMain, UDameDato;

{$R *.dfm}

procedure TDMIncidencias.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMIncidenciasHORAS.DisplayFormat := ',0.00';
  xVentasFECHA.DisplayFormat := ShortDateFormat + ' ' + ShortTimeFormat;
  xVentasI_DTO_LINEAS.DisplayFormat := MascaraN;
  xVentasS_BASES.DisplayFormat := MascaraN;
  xVentasM_BRUTO.DisplayFormat := MascaraN;
  xVentasC_TOTAL.DisplayFormat := MascaraN;
  xVentasS_CUOTA_IVA.DisplayFormat := MascaraN;
  xVentasS_CUOTA_RE.DisplayFormat := MascaraN;
  xVentasB_DTO_LINEAS.DisplayFormat := MascaraN;
  xVentasB_COMISION.DisplayFormat := MascaraN;
  xVentasI_COMISION.DisplayFormat := MascaraN;
  xVentasI_FINANCIACION.DisplayFormat := MascaraN;
  xVentasLIQUIDO.DisplayFormat := MascaraN;
  xVentasI_DTO_PP.DisplayFormat := MascaraN;
  xVentasI_DTO_CIAL.DisplayFormat := MascaraN;
  xVentasI_FINANCIACION_CANAL.DisplayFormat := MascaraN;
  xVentasS_BASES_CANAL.DisplayFormat := MascaraN;
  xVentasS_CUOTA_IVA_CANAL.DisplayFormat := MascaraN;
  xVentasS_CUOTA_RE_CANAL.DisplayFormat := MascaraN;
  xVentasLIQUIDO_CANAL.DisplayFormat := MascaraN;
  xVentasDTO_PP.DisplayFormat := MascaraP;
  xVentasDTO_CIAL.DisplayFormat := MascaraP;
  xVentasPOR_FINANCIACION.DisplayFormat := MascaraP;

  xVentasDetalleUNIDADES.DisplayFormat := MascaraN;
  xVentasDetallePRECIO.DisplayFormat := MascaraN;
  xVentasDetalleDESCUENTO.DisplayFormat := MascaraP;
  xVentasDetalleDESCUENTO_2.DisplayFormat := MascaraP;
  xVentasDetalleDESCUENTO_3.DisplayFormat := MascaraP;
  xVentasDetalleCOMISION.DisplayFormat := MascaraN;
  xVentasDetalleP_COSTE.DisplayFormat := MascaraN;
  xVentasDetalleP_IVA.DisplayFormat := MascaraP;
  xVentasDetalleP_RECARGO.DisplayFormat := MascaraP;
  xVentasDetalleBRUTO.DisplayFormat := MascaraN;
  xVentasDetalleB_COMISION.DisplayFormat := MascaraN;
  xVentasDetalleI_DESCUENTO.DisplayFormat := MascaraN;
  xVentasDetalleB_IMPONIBLE.DisplayFormat := MascaraN;
  xVentasDetalleB_DTO_LINEA.DisplayFormat := MascaraN;
  xVentasDetalleLIQUIDO.DisplayFormat := MascaraN;

  ClienteAnt := 0;
  AgenteUsuario := DameAgenteUsuario(REntorno.Usuario);
end;

procedure TDMIncidencias.QMIncidenciasNewRecord(DataSet: TDataSet);
begin
  QMIncidenciasEMPRESA.AsInteger := REntorno.Empresa;
  QMIncidenciasTIPO_TERCERO.AsString := TipoTercero;

  if ModoForm = 1 then
     QMIncidenciasCOD_CLI_PRO.AsInteger := CodCliPro;

  QMIncidenciasFECHA.AsDateTime := REntorno.FechaTrab;
  QMIncidenciasFECHA_RECEPCION.AsDateTime := REntorno.FechaTrab;
  QMIncidenciasDOC_TIPO.AsString := '';
  QMIncidenciasDOC_SERIE.AsString := '';
  QMIncidenciasENTRADA.AsInteger := REntorno.Entrada;
  QMIncidenciasFINALIZADO.AsInteger := 0;
  QMIncidenciasAGENTE.AsInteger := AgenteUsuario;
  QMIncidenciasINCIDENCIA.AsInteger := 0;
end;

procedure TDMIncidencias.QMIncidenciasTERCEROChange(Sender: TField);
begin
  QMIncidenciasTITULO_TERCERO.AsString := DameTituloTercero(QMIncidenciasTERCERO.AsInteger);
end;

procedure TDMIncidencias.FiltraMaestro(Incidencia, Maestro, DireccionKri: integer);
var
  Str, Str2, Str3, Orden : string;
begin
  Orden := '';
  if Incidencia > 0 then
     Str := ' AND INCIDENCIA = ?INCIDENCIA'
  else
  begin
     Str := ' ';
     Orden := 'ORDER BY INCIDENCIA DESC';
  end;

  if Maestro = 0 then
     Str2 := ' '
  else
     Str2 := ' AND COD_CLI_PRO = ?COD_CLI_PRO ';

  if DireccionKri = 0 then
     Str3 := ' '
  else
     Str3 := ' AND DIRECCION = ?DIRECCION ';

  with QMIncidencias do
  begin
     Close;
     SelectSQL.Text := 'SELECT * FROM VER_INCIDENCIAS ' +
        'WHERE EMPRESA = ?EMPRESA AND  ' +
        'TIPO_TERCERO = ''' + TipoTercero + '''' +
        Str + Str2 + Str3 + Orden;

     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     if Maestro <> 0 then
        Params.ByName['COD_CLI_PRO'].AsInteger := Maestro;
     if Incidencia <> 0 then
        Params.ByName['INCIDENCIA'].AsInteger := Incidencia;
     if DireccionKri <> 0 then
        Params.ByName['DIRECCION'].AsInteger := DireccionKri;
     Open;
  end;
end;

procedure TDMIncidencias.QMIncidenciasDOC_TIPOChange(Sender: TField);
begin
  xTipoMov.Close;
  xTipoMov.Open;
end;

procedure TDMIncidencias.QMIncidenciasAfterOpen(DataSet: TDataSet);
begin
  xTipoMov.Open;
  xSerie.Open;
  xCanal.Open;
  xUsuarios.Open;
end;

procedure TDMIncidencias.MuestraListado;
begin
  TFPregIncidencias.Create(Self).Muestra(QMIncidenciasCOD_CLI_PRO.AsInteger, TipoInt);
end;

procedure TDMIncidencias.QMIncidenciasBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
  begin
     if QMIncidenciasID_S.IsNull then
        QMIncidenciasID_S.AsInteger := 0;
     if QMIncidenciasID_E.IsNull then
        QMIncidenciasID_E.AsInteger := 0;
     if QMIncidenciasAGENTE.IsNull then
        QMIncidenciasAGENTE.AsInteger := 0;
     if QMIncidenciasCONTACTO.IsNull then
        QMIncidenciasCONTACTO.AsInteger := 0;
     if QMIncidenciasCONTACTO2.IsNull then
        QMIncidenciasCONTACTO2.AsInteger := 0;
     if QMIncidenciasCONTACTO3.IsNull then
        QMIncidenciasCONTACTO3.AsInteger := 0;
     QMIncidenciasENTRADA.AsInteger := REntorno.Entrada;
     QMIncidenciasINCIDENCIA.AsInteger := DMMain.Contador_Gen(DataSet, 'CONTA_INCIDENCIAS', 'INCIDENCIA');
  end;
end;

procedure TDMIncidencias.QMIncidenciasDOC_CANALChange(Sender: TField);
begin
  xCanal.Close;
  xCanal.Open;
end;

procedure TDMIncidencias.QMIncidenciasDOC_SERIEChange(Sender: TField);
begin
  xSerie.Close;
  xSerie.Open;
end;

procedure TDMIncidencias.CambiaTipo(Tipo: smallint);
begin
  {dji lrk kri - agrego potenciales}
  case Tipo of
     1: TipoTercero := 'PRO';
     2: TipoTercero := 'ACR';
     3: TipoTercero := 'AGE';
     0: TipoTercero := 'CLI';
     else
        TipoTercero := 'POT';
  end;
  TipoInt := Tipo;
end;

procedure TDMIncidencias.QMIncidenciasCOD_CLI_PROChange(Sender: TField);
var
  Campo, Tabla : string;
begin
  //  if ModoForm = 1 then
  //    QMIncidenciasTERCERO.AsInteger := Ter
  //  else
  //  begin
  {dji lrk kri - agrego potenciales}
  case TipoInt of
     1:
     begin
        Campo := 'PROVEEDOR';
        Tabla := 'EMP_PROVEEDORES';
     end;
     2:
     begin
        Campo := 'ACREEDOR';
        Tabla := 'EMP_ACREEDORES';
     end;
     3:
     begin
        Campo := 'AGENTE';
        Tabla := 'EMP_AGENTES';
     end;
     0:
     begin
        Campo := 'CLIENTE';
        Tabla := 'EMP_CLIENTES';
     end
     else
     begin
        Campo := 'CLIENTE';
        Tabla := 'EMP_CLIENTES_POTENCIALES';
     end;
  end;

  with QGen do
  begin
     Close;
     SQL.Clear;
     SQL.Text := 'SELECT TERCERO FROM ' + Tabla +
        ' WHERE EMPRESA = ?EMPRESA AND ' + Campo + '=?MAESTRO';
     Params.ByName['EMPRESA'].AsInteger := QMIncidenciasEMPRESA.AsInteger;
     Params.ByName['MAESTRO'].AsInteger := QMIncidenciasCOD_CLI_PRO.AsInteger;
     ExecQuery;
     QMIncidenciasTERCERO.AsInteger := FieldByName['TERCERO'].AsInteger;
     FreeHandle;
  end;
  // end;
end;

procedure TDMIncidencias.BusquedaCompleja;
var
  {Tipo,} Orden : string;
  {Sentencia : TStrings;}
begin
  QMIncidencias.Close;
  Orden := QMIncidencias.OrdenadoPor;
  QMIncidencias.Ordenar('');
  if TFBusca.Create(Self).SeleccionaBusqueda(QMIncidencias, '10000', False) = mrOk then
  begin
     if QMIncidencias.SelectSQL.Count <> 0 then
     begin
        QMIncidencias.SelectSQL.Add(' AND TIPO_TERCERO = ?TIPO');
        QMIncidencias.Params.ByName['TIPO'].AsString := TipoTercero;
        QMIncidencias.Ordenar(Orden);
        QMIncidencias.Open;
     end;
  end
  else
     FiltraMaestro(0, 0, 0);
end;

procedure TDMIncidencias.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMIncidencias.QMIncidenciasAGENTEChange(Sender: TField);
begin
  QMIncidenciasTIT_AGENTE.AsString := DameTituloAgente(QMIncidenciasAGENTE.AsInteger);
end;

procedure TDMIncidencias.QMIncidenciasCONTACTOChange(Sender: TField);
begin
  QMIncidenciasTIT_CONTACTO.AsString := DameTituloContacto(QMIncidenciasTERCERO.AsInteger, QMIncidenciasCONTACTO.AsInteger);
end;

procedure TDMIncidencias.QMIncidenciasCONTACTO2Change(Sender: TField);
begin
  QMIncidenciasTIT_CONTACTO2.AsString := DameTituloContacto(QMIncidenciasTERCERO.AsInteger, QMIncidenciasCONTACTO2.AsInteger);
end;

procedure TDMIncidencias.QMIncidenciasCONTACTO3Change(Sender: TField);
begin
  QMIncidenciasTIT_CONTACTO3.AsString := DameTituloContacto(QMIncidenciasTERCERO.AsInteger, QMIncidenciasCONTACTO3.AsInteger);
end;

procedure TDMIncidencias.QMIncidenciasTIPO_INCIDENCIA_KRIChange(Sender: TField);
begin
  QMIncidenciasTIT_TIPO_INCIDENCIA_KRI.AsString := DameTituloTipoIncidencia(QMIncidenciasTIPO_INCIDENCIA_KRI.AsString);
end;

procedure TDMIncidencias.QMIncidenciasDIRECCIONChange(Sender: TField);
begin
  QMIncidenciasDIR_NOMBRE.AsString := DameDireccionTercero(QMIncidenciasTERCERO.AsInteger, QMIncidenciasDIRECCION.AsInteger);
end;

procedure TDMIncidencias.QMIncidenciasHORASEDITGetText(Sender: TField; var Text: string; DisplayText: boolean);
var
  Horas : integer;
  Minutos : integer;
begin
  {Convierto horas decimales a formato hh:mm}
  Horas := Trunc(QMIncidenciasHORAS.AsFloat);
  Minutos := Trunc(Frac(QMIncidenciasHORAS.AsFloat) * 60);
  Text := Format('%d:%.2d', [Horas, Minutos]);
end;

procedure TDMIncidencias.QMIncidenciasHORASEDITChange(Sender: TField);
var
  Horas : integer;
  Minutos : integer;
begin
  {Convierto formato hh:mm a horas decimales}
  Horas := StrToIntDef(Copy(Sender.AsString, 1, Pos(':', Sender.AsString)), 0);
  Minutos := StrToIntDef(Copy(Sender.AsString, Pos(':', Sender.AsString) + 1, Length(Sender.AsString)), 0);
  QMIncidenciasHORAS.AsFloat := Horas + (1 / 60 * Minutos);
end;

procedure TDMIncidencias.AbreVentas(CodCliPro, Direccion: integer);
begin
  {Abrir y cerrar las ventas solo cuando sea necesario. Puede ser algo lento}
  if (TipoTercero = 'CLI') then
  begin
     with xVentas do
     begin
        if (xVentas.Active) then
           Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['COD_CLI_PRO'].AsInteger := CodCliPro;
        Params.ByName['DIRECCION'].AsInteger := Direccion;
        Open;
     end;
     ClienteAnt := CodCliPro;
  end;
end;

procedure TDMIncidencias.CierraVentas;
begin
  ClienteAnt := 0;
end;

procedure TDMIncidencias.QMIncidenciasBeforeScroll(DataSet: TDataSet);
begin
  {Abrir y cerrar las ventas solo cuando sea necesario. Puede ser algo lento}
  if (TipoTercero = 'CLI') then
     if (ClienteAnt = 0) then
     begin
        if (xVentas.Active) then
           xVentas.Close;
     end;
end;

procedure TDMIncidencias.QMIncidenciasAfterScroll(DataSet: TDataSet);
begin
  {Abrir y cerrar las ventas solo cuando sea necesario. Puede ser algo lento}
  if (TipoTercero = 'CLI') then
     if (ClienteAnt <> 0) then
        ClienteAnt := QMIncidenciasCOD_CLI_PRO.AsInteger;
end;

procedure TDMIncidencias.QMIncidenciasBeforeDelete(DataSet: TDataSet);
begin
  {Impedir borrado de incidencias que no son del agente actual}
  if ((QMIncidenciasAGENTE.AsInteger <> AgenteUsuario) and (QMIncidenciasAGENTE.AsInteger <> 0) and (AgenteUsuario <> 0)) then
     raise Exception.Create(_('No puede borrar una incidencia con un agente diferente al suyo.'));
end;

procedure TDMIncidencias.DuplicarIncidencia;
var
  Q : THYFIBQuery;
  Incidencia : integer;
begin
  {Duplico la incidencia y me posiciono sobe la nueva}
  Incidencia := DMMain.ContadorGen('CONTA_INCIDENCIAS');
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('INSERT INTO VER_INCIDENCIAS ');
        SQL.Add('(EMPRESA,INCIDENCIA,TITULO_INCIDENCIA,FECHA,FECHA_RECEPCION,TIPO_TERCERO,COD_CLI_PRO,TERCERO,TITULO_TERCERO,FECHA_RESPUESTA,ID_S,ID_E,DOC_RIG,DOC_EJERCICIO, ');
        SQL.Add('DOC_SERIE,DOC_CANAL,DOC_TIPO,DOC_RIG,ENTRADA,DIRECCION,AGENTE,CONTACTO,CONTACTO2,CONTACTO3,TIPO_INCIDENCIA_KRI,HORAS,FINALIZADO) ');
        SQL.Add('SELECT ');
        SQL.Add('EMPRESA,:NUEVA_INCIDENCIA,TITULO_INCIDENCIA,FECHA,FECHA_RECEPCION,TIPO_TERCERO,COD_CLI_PRO,TERCERO,TITULO_TERCERO,FECHA_RESPUESTA,ID_S,ID_E,DOC_RIG,DOC_EJERCICIO, ');
        SQL.Add('DOC_SERIE,DOC_CANAL,DOC_TIPO,DOC_RIG,:ENTRADA,DIRECCION,AGENTE,CONTACTO,CONTACTO2,CONTACTO3,TIPO_INCIDENCIA_KRI,HORAS,FINALIZADO ');
        SQL.Add('FROM VER_INCIDENCIAS ');
        SQL.Add('WHERE INCIDENCIA=:INCIDENCIA ');
        Params.ByName['NUEVA_INCIDENCIA'].AsInteger := Incidencia;
        Params.ByName['INCIDENCIA'].AsInteger := QMIncidenciasINCIDENCIA.AsInteger;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
  with QMIncidencias do
  begin
     Close;
     Open;
     Last;
     while ((QMIncidenciasINCIDENCIA.AsInteger <> Incidencia) and (not BOF)) do
        Prior;
  end;
end;

procedure TDMIncidencias.xVentasAfterOpen(DataSet: TDataSet);
begin
  xVentasDetalle.Open;
end;

procedure TDMIncidencias.xVentasBeforeClose(DataSet: TDataSet);
begin
  xVentasDetalle.Close;
end;

end.
