unit UDMPruebas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, idGlobalProtocols, Windows;

type
  TDMPruebas = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMCabecera: TFIBTableSet;
     DSCabecera: TDataSource;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraEJERCICIO: TIntegerField;
     QMCabeceraCANAL: TIntegerField;
     QMCabeceraSERIE: TFIBStringField;
     QMCabeceraTIPO: TFIBStringField;
     QMCabeceraRIG: TIntegerField;
     QMCabeceraFECHA: TDateTimeField;
     QMCabeceraTERCERO: TIntegerField;
     QMCabeceraTITULO: TFIBStringField;
     QMCabeceraDIRECCION: TIntegerField;
     QMCabeceraCLIENTE: TIntegerField;
     QMCabeceraSU_REFERENCIA: TFIBStringField;
     QMCabeceraFORMA_PAGO: TFIBStringField;
     QMCabeceraESTADO: TIntegerField;
     QMCabeceraAGENTE: TIntegerField;
     QMCabeceraB_DTO_LINEAS: TFloatField;
     QMCabeceraDTO_PP: TFloatField;
     QMCabeceraDTO_CIAL: TFloatField;
     QMCabeceraPOR_FINANCIACION: TFloatField;
     QMCabeceraLIQUIDO: TFloatField;
     QMCabeceraTARIFA: TFIBStringField;
     QMCabeceraID_S: TIntegerField;
     QMCabeceraIDIOMA: TFIBStringField;
     QMCabeceraTIPO_PORTES: TIntegerField;
     QMCabeceraUSUARIO: TIntegerField;
     QMCabeceraNOMBRE: TFIBStringField;
     QMCabeceraMODIFICA_DOC: TIntegerField;
     xArticulos: TFIBTableSet;
     DSxArticulos: TDataSource;
     xArticulosEMPRESA: TIntegerField;
     xArticulosARTICULO: TFIBStringField;
     xArticulosTITULO: TFIBStringField;
     xArticulosFAMILIA: TFIBStringField;
     xArticulosP_COSTE: TFloatField;
     xArticulosABIERTO: TIntegerField;
     xArticulosCONTROL_STOCK: TIntegerField;
     xArticulosENTRADA: TIntegerField;
     xArticulosUNIDADES: TFIBStringField;
     xArticulosVIRTUAL: TIntegerField;
     xArticulosNOTAS: TMemoField;
     xArticulosTITULO_CORTO: TFIBStringField;
     xArticulosCONTROLA_MEDIDAS: TIntegerField;
     xArticulosSERIALIZADO: TIntegerField;
     xArticulosGARANTIA: TIntegerField;
     xArticulosPRODUCCION: TIntegerField;
     xArticulosDESCUENTO: TFloatField;
     xArticulosDESCUENTO_2: TFloatField;
     xArticulosDESCUENTO_3: TFloatField;
     xArticulosALFA_1: TFIBStringField;
     xArticulosALFA_2: TFIBStringField;
     xArticulosDISPONIBILIDAD: TIntegerField;
     xArticulosPVP_POR_UD_SECUNDARIA: TIntegerField;
     xArticulosALFA_3: TFIBStringField;
     xArticulosALFA_4: TFIBStringField;
     xArticulosALFA_5: TFIBStringField;
     xArticulosLOTES_KRI: TIntegerField;
     xArticulosLOTES: TIntegerField;
     xArticulosMULTIPLO_1: TFloatField;
     xArticulosMULTIPLO_2: TFloatField;
     xArticulosMULTIPLO_3: TFloatField;
     xArticulosMULTIPLO_4: TFloatField;
     xArticulosFACTOR_ESCALA: TFloatField;
     xArticulosUD_MINIMO_COMPRA: TFloatField;
     xArticulosUD_MINIMO_VENTA: TFloatField;
     xArticulosID_A: TIntegerField;
     xArticulosID_A_M_C_T: TIntegerField;
     xArticulosIMAGEN: TIntegerField;
     xArticulosCODIGO_INTRA: TFIBStringField;
     xArticulosPESO: TFloatField;
     xArticulosUBICABLE: TIntegerField;
     xArticulosDEFECTO_UD_SECUNDARIA: TFloatField;
     xArticulosVOLUMEN_UNIT: TFloatField;
     xArticulosDIAMETRO_UNIT: TFloatField;
     xArticulosNOTAS_COMPRAS: TMemoField;
     xArticulosNOTAS_VENTAS: TMemoField;
     xArticulosULT_MODIFICACION: TDateTimeField;
     xArticulosANTICIPO: TIntegerField;
     xArticulosANTICIPO_PREG_DATOS: TIntegerField;
     xArticulosANTICIPO_CONTADO: TIntegerField;
     xArticulosWEB: TIntegerField;
     xArticulosFABRICANTE: TIntegerField;
     xArticulosNO_CALCULA_STOCKMINMAX: TIntegerField;
     xArticulosCRC_NOTAS: TFIBStringField;
     xArticulosCRC_NOTAS_COMPRAS: TFIBStringField;
     xArticulosCRC_NOTAS_VENTAS: TFIBStringField;
     xArticulosFECHA_ENLOTADO: TDateTimeField;
     xArticulosTIPO_ARTICULO: TFIBStringField;
     xArticulosBAJA: TIntegerField;
     xArticulosFECHA_BAJA: TDateTimeField;
     xArticulosMOTIVO_BAJA: TFIBStringField;
     xArticulosTIPO_CLAVE_ADR: TIntegerField;
     xArticulosCANTIDAD_LIMITADA: TIntegerField;
     xArticulosTIPO_ARTICULO_TYC: TFIBStringField;
     xArticulosZ_ARM_MODELO: TFIBStringField;
     xArticulosZ_ARM_LINEA: TFloatField;
     xArticulosZ_ARM_SALIDA: TFloatField;
     xArticulosZ_TOL_ARMAZON: TFIBStringField;
     xArticulosZ_TOL_LONA: TFIBStringField;
     xArticulosZ_TOL_ID_A_ARMAZON: TIntegerField;
     xArticulosZ_TOL_ID_A_LONA: TIntegerField;
     xArticulosZ_LON_TIPO: TFIBStringField;
     xArticulosZ_LON_FORMA: TFIBStringField;
     xArticulosZ_LON_MODELO: TFIBStringField;
     xArticulosZ_LON_CONFECCION: TFIBStringField;
     xArticulosZ_COM_LACADO: TIntegerField;
     xArticulosZ_COM_TIPO_LACADO: TFIBStringField;
     xArticulosZ_COM_CORTE: TIntegerField;
     xArticulosZ_COM_QUITAR_SI_HAY_MOTOR: TIntegerField;
     xArticulosZ_COM_SUSTITUTO: TFIBStringField;
     xArticulosZ_KIT_TIPO: TFIBStringField;
     xArticulosZ_PREPARABLE: TIntegerField;
     xArticulosZ_MERMA: TFloatField;
     xArticulosZ_FORZAR_LACADO_SN: TIntegerField;
     xArticulosZ_TIPO_LACADO_FORZADO: TFIBStringField;
     xArticulosCOMPONENTE_MOTOR: TIntegerField;
     xArticulosZ_LAM_ANCHO: TFloatField;
     xArticulosZ_LAM_LARGO: TFloatField;
     xArticulosZ_LAM_COLOR: TFIBStringField;
     xArticulosSUBFAMILIA: TFIBStringField;
     xArticulosALFA_6: TFIBStringField;
     xArticulosSUBTIPO_ARTICULO_TYC: TFIBStringField;
     xArticulosID_GALERIA: TIntegerField;
     xArticulosEXPORTAR: TIntegerField;
     xArticulosCOSTE_ADICIONAL: TFloatField;
     xArticulosALFA_7: TFIBStringField;
     xArticulosALFA_8: TFIBStringField;
     xArticulosZ_COM_QUITAR_SI_ES_MANUAL: TIntegerField;
     xArticulosCOD_COLOR_HILO: TFIBStringField;
     xArticulosBLOQUEO_COMPRAS: TIntegerField;
     xArticulosMOTIVO_BLOQUEO_COMPRAS: TFIBStringField;
     xArticulosBLOQUEO_VENTAS: TIntegerField;
     xArticulosMOTIVO_BLOQUEO_VENTAS: TFIBStringField;
     xArticulosADR_PACKAGE: TFIBStringField;
     xArticulosTIPO_REGISTRO_FITOSANITARIO: TFIBStringField;
     xArticulosPREPARABLE: TIntegerField;
     xArticulosREPLICADO: TIntegerField;
     xArticulosSERIALIZADO_KRI: TIntegerField;
     xOrden: TFIBTableSet;
     DSxOrden: TDataSource;
     xOrdenEMPRESA: TIntegerField;
     xOrdenEJERCICIO: TIntegerField;
     xOrdenCANAL: TIntegerField;
     xOrdenSERIES: TFIBStringField;
     xOrdenRIG_OF: TIntegerField;
     xOrdenVISTOBUENO1: TIntegerField;
     xOrdenVISTOBUENO2: TIntegerField;
     xOrdenVISTOBUENO3: TIntegerField;
     xOrdenSITUACION: TIntegerField;
     xOrdenMARGEN_UNI_CIEN: TFloatField;
     xOrdenENTRADA: TIntegerField;
     xOrdenID_ORDEN: TIntegerField;
     xOrdenTIPO_LANZAMIENTO: TIntegerField;
     xOrdenID_ORDEN_MAT: TIntegerField;
     xOrdenTIPO_RESERVA: TIntegerField;
     xOrdenID_MOV_STOCK: TIntegerField;
     xOrdenISO_APROBADO: TIntegerField;
     xOrdenISO_VERIFICADO: TIntegerField;
     xOrdenISO_VALIDADO: TIntegerField;
     xOrdenID_A: TIntegerField;
     xOrdenPADRE_SUBORDEN: TIntegerField;
     xOrdenCONT_SUBORDEN: TIntegerField;
     xOrdenREFERENCIA: TFIBStringField;
     xOrdenCOSTE_COMPRAS: TFloatField;
     xOrdenHORAS_OPERARIO: TFloatField;
     xOrdenHORAS_MAQUINA: TFloatField;
     xOrdenID_DESPIECE: TIntegerField;
     xOrdenID_ORDEN_SUBORDEN: TIntegerField;
     xOrdenSELECCIONADA: TIntegerField;
     xOrdenPREVALECE_ALM_ORDEN: TIntegerField;
     xOrdenCERRAR_SUBORDENES: TIntegerField;
     xOrdenIMPORTAR_OP: TIntegerField;
     xOrdenCASO_OP: TIntegerField;
     xOrdenRESERVA_STOCK_OP: TIntegerField;
     xOrdenMEDIDA_1: TFloatField;
     xOrdenMEDIDA_2: TFloatField;
     xOrdenMEDIDA_3: TFloatField;
     xOrdenMEDIDA_4: TFloatField;
     xOrdenDESACTIVA_TRIGGER: TIntegerField;
     xOrdenRESPONSABLE: TIntegerField;
     xOrdenCOSTE_COMPRAS_PRE: TFloatField;
     xOrdenCOMPUESTOS_VIRTUALES: TIntegerField;
     xOrdenSEGUIR_SIN_STOCK: TIntegerField;
     xOrdenMARGEN_TOTAL_PRE: TFloatField;
     xOrdenMARGEN_UNI_CIEN_PRE: TFloatField;
     xOrdenCOSTE_UNITARIO_PRE: TFloatField;
     xOrdenMARGEN_UNI_PRE: TFloatField;
     xOrdenPRECIO_VENTA_PRE: TFloatField;
     xOrdenPRECIO_VENTA_TOT_PRE: TFloatField;
     xOrdenPRECIO_VENTA_TOT_REAL: TFloatField;
     xOrdenHORAS_OPERARIO_PRE: TFloatField;
     xOrdenHORAS_MAQUINA_PRE: TFloatField;
     xOrdenDIF_HORAS_MAQUINA: TFloatField;
     xOrdenDIF_HORAS_OPERARIO: TFloatField;
     xOrdenRECUPERADO_MARCAJE: TIntegerField;
     xOrdenUNI_FABRICADAS: TFloatField;
     xOrdenPLANIFICACION: TIntegerField;
     xOrdenLINEA_PLANIFICACION: TIntegerField;
     xOrdenID_PLANIFICACION: TIntegerField;
     xOrdenID_PLANIFICACION_DET: TIntegerField;
     xOrdenID_UBICACION: TIntegerField;
     xOrdenID_MOV_STOCK_RESERVA: TIntegerField;
     xOrdenUNIDAD: TFIBStringField;
     xOrdenCOSTE_MERMA_PRE: TFloatField;
     xOrdenCOSTE_MERMA_REAL: TFloatField;
     xOrdenDIF_COSTE_MERMA: TFloatField;
     xOrdenCOPIAS_PMP: TIntegerField;
     xOrdenVERSION_ORDEN: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure CambiaSerie(SerieVar: string);
     procedure PruebaReturning;
     procedure DescargarImagen(URL: string);
     function SubirArchivo(URL, Archivo: string): boolean;
     procedure DameTablasAbiertasProDMOrden;
     procedure RecalculaCodigoLote;
     procedure PruebaVelocidadQueryUnidireccional;
     procedure AbreOrden;
  end;

var
  DMPruebas : TDMPruebas;

implementation

uses UDMMain, UEntorno, UFMPruebas, HYFIBQuery, UUtiles, Dialogs, UDMAdjunto, UFormGest, UProDMOrden, FIBDataSetRO, Forms, Controls, UDameDato;

{$R *.dfm}

procedure TDMPruebas.AbreOrden;
begin
  xOrden.Close;
  DMMain.FiltraTabla(xOrden, '11110', False);
  xOrden.Open;
  xOrden.Last;
end;

procedure TDMPruebas.CambiaSerie(SerieVar: string);
begin
  FMPruebas.Log('CambiaSerie Close');
  with QMCabecera do
  begin
     Close;
     Params.ByName['SERIE'].AsString := SerieVar;
     Open;
  end;
  FMPruebas.Log('CambiaSerie Open');
  FMPruebas.Log('QMCabecera.Plan' + QMCabecera.Plan.Text);
end;

procedure TDMPruebas.DameTablasAbiertasProDMOrden;
var
  i : integer;
begin
  if Assigned(ProDMOrden) then
  begin
     with ProDMOrden do
     begin
        for i := 0 to ComponentCount - 1 do
        begin
           if (Components[i] is TFIBTableSet) then
              FMPruebas.Log(BoolToStr(TFIBTableSet(Components[i]).Active) + ' ' + TFIBTableSet(Components[i]).Name)
           else
           if (Components[i] is TFIBDataSetRO) then
              FMPruebas.Log(BoolToStr(TFIBDataSetRO(Components[i]).Active) + ' ' + TFIBDataSetRO(Components[i]).Name)
           else
           if (Components[i] is THYFIBQuery) then
              FMPruebas.Log(BoolToStr(THYFIBQuery(Components[i]).Open) + ' ' + THYFIBQuery(Components[i]).Name)
           else
           if (Components[i] is TFIBDataSet) then
              FMPruebas.Log(BoolToStr(TFIBDataSet(Components[i]).Active) + ' ' + TFIBDataSet(Components[i]).Name);
        end;
     end;
  end;
end;

procedure TDMPruebas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  FMPruebas.Log('StartTransaction');
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  FMPruebas.LogIni('DisplayFormat');
  QMCabeceraDTO_CIAL.DisplayFormat := MascaraP;
  QMCabeceraDTO_PP.DisplayFormat := MascaraP;
  QMCabeceraPOR_FINANCIACION.DisplayFormat := MascaraP;
  FMPruebas.LogFin('DisplayFormat');

  FMPruebas.Log('SelectSQL');
  with QMCabecera.SelectSQL do
  begin
     Clear;
     Add(' SELECT ');
     Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ');
     Add(' FECHA, TERCERO, TITULO, DIRECCION, CLIENTE, ');
     Add(' SU_REFERENCIA, FORMA_PAGO, ESTADO, ');
     Add(' AGENTE, ');
     Add(' B_DTO_LINEAS, DTO_PP, DTO_CIAL, ');
     Add(' POR_FINANCIACION, ');
     Add(' LIQUIDO, TARIFA, ');
     Add(' ID_S, IDIOMA, TIPO_PORTES, ');
     Add(' USUARIO, NOMBRE, MODIFICA_DOC ');
     {
     Add(' ALMACEN, MONEDA, FECHA, TERCERO, TITULO, DIRECCION, CLIENTE, CONTACTO, ');
     Add(' SU_REFERENCIA, FORMA_PAGO, CAMPANYA, ESTADO, BULTOS, LINEAS, ');
     Add(' BRUTO, I_DTO_LINEAS, S_BASES, M_BRUTO, C_TOTAL, AGENTE, ');
     Add(' S_CUOTA_IVA, S_CUOTA_RE, B_DTO_LINEAS, DTO_PP, DTO_CIAL, ');
     Add(' I_DTO_CIAL, I_DTO_PP, B_COMISION, I_COMISION, POR_FINANCIACION, ');
     Add(' I_FINANCIACION, LIQUIDO, ENTRADA, NOMBRE_COMERCIAL, TARIFA, ');
     Add(' ID_S, IDIOMA, PRESUPUESTO, ADJUNTO, TIPO_PORTES, POR_PORTES, ');
     Add(' I_PORTES, I_PORTES_CANAL, CAMBIO_FIJO, VALOR_CAMB_FIJO, PROYECTO, ');
     Add(' TIPO_LINEA_KRI, TIT_CONTACTO, Z_OBSERVACION, RANGO, INDICE, ');
     Add(' PORTES, USUARIO, NOMBRE, FECHA_VALIDEZ, PLAZO_ENTREGA, MODIFICA_DOC ');
}
     Add(' FROM VER_CABECERAS_OFERTA_C ');
     Add(' WHERE  ');
     Add(' EMPRESA = ?EMPRESA AND ');
     Add(' CANAL = ?CANAL AND ');
     Add(' SERIE = ?SERIE AND ');
     Add(' TIPO = ''OFC'' ');
     Add(' AND (EJERCICIO = ?EJERCICIO OR ((EJERCICIO < ?EJERCICIO) AND (ESTADO = 0))) ');
     if (DameRestriccionAgenteUsuario(REntorno.Usuario)) then
        Add(' AND AGENTE = ' + IntToStr(DameAgenteUsuario(REntorno.Usuario)) + ' ');
  end;
  QMCabecera.SelectSQL.Add(' ORDER BY EJERCICIO, RIG');
  FMPruebas.Log(QMCabecera.SelectSQL.Text);

  FMPruebas.LogIni('FiltraTabla');
  DMMain.FiltraTabla(QMCabecera, '11100', False);
  FMPruebas.LogFin('FiltraTabla');
end;

procedure TDMPruebas.DescargarImagen(URL: string);
var
  Stream : TFileStream;
  Archivo : string;
  Descargada : boolean;
begin
  Archivo := GetTempFile(ExtractFileExt(URL));
  Stream := TFileStream.Create(Archivo, fmCreate);
  try
     Descargada := DownloadToStream(URL, Stream);
  finally
     Stream.Free;
  end;
  if Descargada then
     DMMain.AbrirArchivo(Archivo)
  else
     ShowMessage('No se pudo descargar desde la URL' + #13#10 + URL);
end;

procedure TDMPruebas.PruebaReturning;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO SYS_ENTRADAS ');
        SQL.Add(' (USUARIO, EMPRESA, UBICACION) ');
        SQL.Add(' VALUES ');
        SQL.Add(' (:USUARIO, :EMPRESA, :UBICACION) ');
        SQL.Add(' RETURNING ');
        SQL.Add(' ENTRADA, FEC_ENTRADA ');
        Params.ByName['USUARIO'].AsInteger := 1;
        Params.ByName['EMPRESA'].AsInteger := 1;
        Params.ByName['UBICACION'].AsInteger := 1;
        FMPruebas.Log(SQL.Text);
        FMPruebas.Log('< ' + Params.ByName['USUARIO'].AsString);
        FMPruebas.Log('< ' + Params.ByName['EMPRESA'].AsString);
        FMPruebas.Log('< ' + Params.ByName['UBICACION'].AsString);
        ExecQuery;
        FMPruebas.Log('> ' + FieldByName['ENTRADA'].AsString);
        FMPruebas.Log('> ' + FormatDatetime('[yyyy-mm-dd hh:nn:ss.zzz] ', FieldByName['FEC_ENTRADA'].AsDateTime));
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMPruebas.PruebaVelocidadQueryUnidireccional;
const
  ciclos = 10000;
var
  i : integer;
  iCurScreenState : integer;
begin
  FMPruebas.Log('TFIBDataSet');

  FMPruebas.LogIni('Unidirectional OFF, Buff 32');

  iCurScreenState := Screen.Cursor;
  Screen.Cursor := crHourglass;
  try
     with TFIBDataSet.Create(nil) do
     begin
        try
           BufferChunks := 32;
           UniDirectional := False;
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
              SelectSQL.Add('SELECT ''NOW'' FROM RDB$DATABASE');

              FMPruebas.LogIni('ColdStart');
              Open;
              FMPruebas.LogFin('ColdStart');
              FMPruebas.LogIni('WarmStart x Cilcos');
              for i := 1 to ciclos do
              begin
                 Close;
                 Open;
              end;
              FMPruebas.LogFin('WarmStart x Cilcos');
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
     FMPruebas.LogFin('Unidirectional OFF, Buff 32');

     FMPruebas.LogIni('Unidirectional ON, Buff 32');
     with TFIBDataSet.Create(nil) do
     begin
        try
           BufferChunks := 32;
           UniDirectional := True;
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
              SelectSQL.Add('SELECT ''NOW'' FROM RDB$DATABASE');

              FMPruebas.LogIni('ColdStart');
              Open;
              FMPruebas.LogFin('ColdStart');
              FMPruebas.LogIni('WarmStart x Cilcos');
              for i := 1 to ciclos do
              begin
                 Close;
                 Open;
              end;
              FMPruebas.LogFin('WarmStart x Cilcos');
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
     FMPruebas.LogFin('Unidirectional ON, Buff 32');

     FMPruebas.LogIni('Unidirectional OFF, Buff 1');
     with TFIBDataSet.Create(nil) do
     begin
        try
           BufferChunks := 1;
           UniDirectional := False;
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
              SelectSQL.Add('SELECT ''NOW'' FROM RDB$DATABASE');

              FMPruebas.LogIni('ColdStart');
              Open;
              FMPruebas.LogFin('ColdStart');
              FMPruebas.LogIni('WarmStart x Cilcos');
              for i := 1 to ciclos do
              begin
                 Close;
                 Open;
              end;
              FMPruebas.LogFin('WarmStart x Cilcos');
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
     FMPruebas.LogFin('Unidirectional OFF, Buff 1');

     FMPruebas.LogIni('Unidirectional ON, Buff 1');
     with TFIBDataSet.Create(nil) do
     begin
        try
           BufferChunks := 1;
           UniDirectional := True;
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
              SelectSQL.Add('SELECT ''NOW'' FROM RDB$DATABASE');

              FMPruebas.LogIni('ColdStart');
              Open;
              FMPruebas.LogFin('ColdStart');
              FMPruebas.LogIni('WarmStart x Cilcos');
              for i := 1 to ciclos do
              begin
                 Close;
                 Open;
              end;
              FMPruebas.LogFin('WarmStart x Cilcos');
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
     FMPruebas.LogFin('Unidirectional ON, Buff 1');

     FMPruebas.Log('TFIBDataSetRO');
     FMPruebas.LogIni('Unidirectional OFF, Buff 32');
     with TFIBDataSetRO.Create(nil) do
     begin
        try
           BufferChunks := 32;
           UniDirectional := False;
           // Transaction := TFIBTransaction.Create(nil);
           try
              Close;
              DataBase := DMMain.DataBase;
              {
              with Transaction do
              begin
                 DefaultDatabase := DMMain.DataBase;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
                 if (not InTransaction) then StartTransaction;
              end;
              }
              SelectSQL.Add('SELECT ''NOW'' FROM RDB$DATABASE');

              FMPruebas.LogIni('ColdStart');
              Open;
              FMPruebas.LogFin('ColdStart');
              FMPruebas.LogIni('WarmStart x Cilcos');
              for i := 1 to ciclos do
              begin
                 Close;
                 Open;
              end;
              FMPruebas.LogFin('WarmStart x Cilcos');
              Close;
              // Transaction.Commit;
           finally
              // Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
     FMPruebas.LogFin('Unidirectional OFF, Buff 32');

     FMPruebas.LogIni('Unidirectional ON, Buff 32');
     with TFIBDataSetRO.Create(nil) do
     begin
        try
           BufferChunks := 32;
           UniDirectional := True;
           // Transaction := TFIBTransaction.Create(nil);
           try
              Close;
              DataBase := DMMain.DataBase;
              {
              with Transaction do
              begin
                 DefaultDatabase := DMMain.DataBase;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
                 if (not InTransaction) then StartTransaction;
              end;
              }
              SelectSQL.Add('SELECT ''NOW'' FROM RDB$DATABASE');

              FMPruebas.LogIni('ColdStart');
              Open;
              FMPruebas.LogFin('ColdStart');
              FMPruebas.LogIni('WarmStart x Cilcos');
              for i := 1 to ciclos do
              begin
                 Close;
                 Open;
              end;
              FMPruebas.LogFin('WarmStart x Cilcos');
              Close;
              // Transaction.Commit;
           finally
              // Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
     FMPruebas.LogFin('Unidirectional OFF, Buff 32');

     FMPruebas.LogIni('Unidirectional OFF, Buff 1');
     with TFIBDataSetRO.Create(nil) do
     begin
        try
           BufferChunks := 1;
           UniDirectional := False;
           // Transaction := TFIBTransaction.Create(nil);
           try
              Close;
              DataBase := DMMain.DataBase;
              {
              with Transaction do
              begin
                 DefaultDatabase := DMMain.DataBase;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
                 if (not InTransaction) then StartTransaction;
              end;
              }
              SelectSQL.Add('SELECT ''NOW'' FROM RDB$DATABASE');

              FMPruebas.LogIni('ColdStart');
              Open;
              FMPruebas.LogFin('ColdStart');
              FMPruebas.LogIni('WarmStart x Cilcos');
              for i := 1 to ciclos do
              begin
                 Close;
                 Open;
              end;
              FMPruebas.LogFin('WarmStart x Cilcos');
              Close;
              // Transaction.Commit;
           finally
              // Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
     FMPruebas.LogFin('Unidirectional OFF, Buff 1');

     FMPruebas.LogIni('Unidirectional ON, Buff 1');
     with TFIBDataSetRO.Create(nil) do
     begin
        try
           BufferChunks := 1;
           UniDirectional := True;
           // Transaction := TFIBTransaction.Create(nil);
           try
              Close;
              DataBase := DMMain.DataBase;
              {
              with Transaction do
              begin
                 DefaultDatabase := DMMain.DataBase;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
                 if (not InTransaction) then StartTransaction;
              end;
              }
              SelectSQL.Add('SELECT ''NOW'' FROM RDB$DATABASE');

              FMPruebas.LogIni('ColdStart');
              Open;
              FMPruebas.LogFin('ColdStart');
              FMPruebas.LogIni('WarmStart x Cilcos');
              for i := 1 to ciclos do
              begin
                 Close;
                 Open;
              end;
              FMPruebas.LogFin('WarmStart x Cilcos');
              Close;
              // Transaction.Commit;
           finally
              // Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
  finally
     Screen.Cursor := iCurScreenState;
  end;

  FMPruebas.LogFin('Unidirectional ON, Buff 1');
end;

procedure TDMPruebas.RecalculaCodigoLote;
var
  DS : TFIBDataSet;
  Q : THYFIBQuery;
  IDLote : integer;
  Lote : string;
begin
  FMPruebas.LoginI('recalculaCodigoLote');
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
           SelectSQL.Add('SELECT ID_LOTE, LOTE FROM ART_ARTICULOS_LOTES');
           Open;
           while not EOF do
           begin
              IDLote := FieldByName('ID_LOTE').AsInteger;
              Lote := FieldByName('LOTE').AsString;
              FMPruebas.Log('Lote: ' + Lote);
              Q := THYFIBQuery.Create(nil);
              try
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE ART_ARTICULOS_LOTES SET CODIGO = :CODIGO WHERE ID_LOTE = :ID_LOTE';
                    Params.ByName['CODIGO'].AsInteger := StrToIntDef(Lote, 0);
                    Params.ByName['ID_LOTE'].AsInteger := IDLote;
                    ExecQuery;
                    FreeHandle;
                 end;
              finally
                 FreeAndNil(Q);
              end;
              Next;
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
  FMPruebas.LogFin('recalculaCodigoLote');
end;

function TDMPruebas.SubirArchivo(URL, Archivo: string): boolean;
begin
  Result := UploadFile(URL, Archivo);
end;

end.
