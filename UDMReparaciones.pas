unit UDMReparaciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet, FIBDataSetRO, HYFIBQuery, FIBQuery, FR_Class,
  Fr_HYReport, FR_DSet, FR_DBSet, frxClass, frxDBSet, frxHYReport;

type
  TDMReparaciones = class(TDataModule)
     QMCabReparar: TFIBTableSet;
     TLocal: THYTransaction;
     DSCabReparar: TDataSource;
     DSDetReparar: TDataSource;
     QMDetReparar: TFIBTableSet;
     QMCabRepararCLIENTE: TIntegerField;
     QMDetRepararARTICULO: TFIBStringField;
     xLstCabReparar: TFIBDataSetRO;
     xLstDetReparar: TFIBDataSetRO;
     DSxLstCabReparar: TDataSource;
     DSxLstDetReparar: TDataSource;
     frDBCabReparar: TfrDBDataSet;
     frDBDetReparar: TfrDBDataSet;
     frLstReparar: TfrHYReport;
     xLstTerceros: TFIBDataSetRO;
     DSxLstTerceros: TDataSource;
     frDBTerceros: TfrDBDataSet;
     xNSerie: TFIBDataSetRO;
     xNSerieNSERIE: TFIBStringField;
     DSxNSerie: TDataSource;
     QMDetRepararIDCABREPARAR: TIntegerField;
     QMDetRepararUNIDADES: TFloatField;
     QMDetRepararMATERIAL: TFIBStringField;
     QMDetRepararPRECIO: TFloatField;
     QMDetRepararTOTAL: TFloatField;
     QMDetRepararLINEA: TIntegerField;
     QMDetRepararPRECIO_VENTA: TFloatField;
     QMDetRepararTIPO_IVA: TIntegerField;
     QMDetRepararEMPRESA: TIntegerField;
     QMDetRepararDESCUENTO: TFloatField;
     QMDetRepararTITULO_ART: TFIBStringField;
     QMCabRepararIDCABREPARAR: TIntegerField;
     QMCabRepararEMPRESA: TIntegerField;
     QMCabRepararEJERCICIO: TIntegerField;
     QMCabRepararTERCERO: TIntegerField;
     QMCabRepararEQUIPO: TFIBStringField;
     QMCabRepararMARCA: TFIBStringField;
     QMCabRepararMODELO: TFIBStringField;
     QMCabRepararNUM_SERIE: TFIBStringField;
     QMCabRepararCONDICION: TFIBStringField;
     QMCabRepararOT: TFIBStringField;
     QMCabRepararTECNICO: TFIBStringField;
     QMCabRepararFECHA_AVISO: TDateTimeField;
     QMCabRepararFECHA_ENTRADA: TDateTimeField;
     QMCabRepararFECHA_SALIDA: TDateTimeField;
     QMCabRepararOBSERVACIONES_CLIENTE: TBlobField;
     QMCabRepararTIPO_ACTUACION: TIntegerField;
     QMCabRepararTRABAJO_REALIZADO: TMemoField;
     QMCabRepararESTADO: TIntegerField;
     QMCabRepararCARGO_COSTE: TIntegerField;
     QMCabRepararID_NUM_SERIE: TIntegerField;
     QMCabRepararTOTAL_COSTE: TFloatField;
     QMCabRepararESTADO_REPAR: TIntegerField;
     QMDetRepararEJERCICIO: TIntegerField;
     QMDetRepararCANAL: TIntegerField;
     QMCabRepararCANAL: TIntegerField;
     QMDetRepararIMPORTEDTO: TFloatField;
     QMDetRepararIMPORTEIVA: TFloatField;
     QMDetRepararBIMPONIBLE: TFloatField;
     QMDetRepararTOTAL_LINEA: TFloatField;
     QMDetRepararIMPORTE_DESCUENTO: TFloatField;
     QMDetRepararPORCENTAJE_IVA: TFloatField;
     QMDetRepararIMPORTE_IVA: TFloatField;
     QMDetRepararLIQUIDO: TFloatField;
     TUpdate: THYTransaction;
     QMTotales: TFIBTableSet;
     DSQMTotales: TDataSource;
     QMTotalesTOTAL_COSTE: TFloatField;
     QMCabRepararREPARACION: TIntegerField;
     QMCabRepararID_FICHA_TECNICA: TIntegerField;
     QMCabRepararID_S: TIntegerField;
     QMCabRepararSERIE_DOC: TStringField;
     QMCabRepararKILOMETROS: TFIBStringField;
     QMCabRepararSERIE: TFIBStringField;
     QMCabRepararFECHA_PREV_SALIDA: TDateTimeField;
     QMCabRepararCONTACTO_EMAIL: TFIBStringField;
     QMCabRepararCONTACTO_NOMBRE: TFIBStringField;
     QMCabRepararCONTACTO_TELEFONO: TFIBStringField;
     QMCabRepararKILOMETROS_ENTRADA: TFloatField;
     xEmpleado: TFIBTableSet;
     DSxEmpleado: TDataSource;
     xEmpleadoIDCABREPARAR: TIntegerField;
     xEmpleadoEMPRESA: TIntegerField;
     xEmpleadoEMPLEADO: TIntegerField;
     xEmpleadoID_EMPLEADO: TIntegerField;
     xEmpleadoTITULO: TStringField;
     xLstEmpleado: TFIBDataSetRO;
     DSxLstEmpleado: TDataSource;
     QMCabRepararSITUACION: TIntegerField;
     xSituacion: TFIBDataSetRO;
     DSxSituacion: TDataSource;
     xSituacionSITUACION: TIntegerField;
     xSituacionTITULO: TFIBStringField;
     QMCabRepararPROYECTO: TIntegerField;
     QMCabRepararTIPO: TIntegerField;
     QMCabRepararID_S_ORIGEN: TIntegerField;
     QMCabRepararCONTACTO_LATITUD: TFloatField;
     QMCabRepararCONTACTO_LONGITUD: TFloatField;
     QMCabRepararCONTACTO_LOCALIDAD: TFIBStringField;
     QMCabRepararCONTACTO_DIR_NOMBRE: TFIBStringField;
     QMCabRepararCONTACTO_DIR_NOMBRE_2: TFIBStringField;
     QMCabRepararHORARIO_1_DESDE: TDateTimeField;
     QMCabRepararHORARIO_1_HASTA: TDateTimeField;
     QMCabRepararHORARIO_2_DESDE: TDateTimeField;
     QMCabRepararHORARIO_2_HASTA: TDateTimeField;
     QMTotalesUNIDADES: TFloatField;
     QMTotalesTOTAL_LINEA: TFloatField;
     QMTotalesIMPORTE_DESCUENTO: TFloatField;
     QMTotalesBRUTO: TFloatField;
     QMTotalesIMPORTE_IVA: TFloatField;
     QMTotalesLIQUIDO: TFloatField;
     xEmpleadoLINEA_TAREA: TIntegerField;
     xLstFirmas: TFIBDataSetRO;
     DSxLstFirmas: TDataSource;
     frDBDLstFirmas: TfrDBDataSet;
     QMFirmas: TFIBDataSetRO;
     DSQMFirmas: TDataSource;
     frxDBxLstCabReparar: TfrxDBDataset;
     frxDBxLstDetReparar: TfrxDBDataset;
     frxDBxLstTerceros: TfrxDBDataset;
     frxDBxLstFirmas: TfrxDBDataset;
     frxLstReparar: TfrxHYReport;
     QMFirmasID_FIRMA: TIntegerField;
     QMFirmasNOMBRE: TFIBStringField;
     QMFirmasNIF: TFIBStringField;
     QMCabRepararDIRECCION_DOCUMENTO: TIntegerField;
     QMCabRepararID_REP_RECEPCION: TIntegerField;
     QMCabRepararNOMBRE_COMERCIAL: TFIBStringField;
     QMCabRepararNOMBRE_R_SOCIAL: TFIBStringField;
     QMCabRepararTITULO_SITUACION: TFIBStringField;
     QMCabRepararTITULO_TIPO_REPARACION: TFIBStringField;
     QMCabRepararTITULO_TIPO_ACTUACION: TFIBStringField;
     QMCabRepararTITULO_PROYECTO: TFIBStringField;
     QMCabRepararTITULO_LOCALIDAD: TFIBStringField;
     QMCabRepararCODIGO_POSTAL: TFIBStringField;
     QMCabRepararEJERCICIO_ORIGEN: TIntegerField;
     QMCabRepararCANAL_ORIGEN: TIntegerField;
     QMCabRepararSERIE_ORIGEN: TFIBStringField;
     QMCabRepararTIPO_ORIGEN: TFIBStringField;
     QMCabRepararRIG_ORIGEN: TIntegerField;
     QMCabRepararEJERCICIO_DESTINO: TIntegerField;
     QMCabRepararCANAL_DESTINO: TIntegerField;
     QMCabRepararSERIE_DESTINO: TFIBStringField;
     QMCabRepararTIPO_DESTINO: TFIBStringField;
     QMCabRepararRIG_DESTINO: TIntegerField;
     QMCabRepararTITULO_ESTADO: TFIBStringField;
     QMCabRepararMATRICULA: TFIBStringField;
     QMDetRepararID_DETALLES_E_ORIGEN: TIntegerField;
     xLstFichaTecnica: TFIBDataSetRO;
     DSxLstFichaTecnica: TDataSource;
     xLstRecepcion: TFIBDataSetRO;
     DSxLstRecepcion: TDataSource;
     QMCabRepararNOMBRE_R_SOCIAL_CLIENTE: TFIBStringField;
     QMCabRepararNOMBRE_COMERCIAL_CLIENTE: TFIBStringField;
     QMCabRepararCOMBUSTIBLE: TFloatField;
     QMCabRepararID_EMPLEADO: TIntegerField;
     QMCabRepararEMPLEADO: TIntegerField;
     QMCabRepararNOMBRE_EMPLEADO: TFIBStringField;
     QMCabRepararFECHA: TDateTimeField;
     QMCabRepararTESTIGO_AVERIA: TIntegerField;
     QMCabRepararESTADO_PLACAS_MATRICULA: TIntegerField;
     QMCabRepararESTADO_CRISTALES: TIntegerField;
     QMCabRepararESTADO_ESCOBILLAS: TIntegerField;
     QMCabRepararANTENA: TIntegerField;
     QMCabRepararPILOTOS_Y_FAROS: TIntegerField;
     QMCabRepararAPERTURA_PUERTAS_DELANTERAS: TIntegerField;
     QMCabRepararAPERTURA_PUERTAS_TRASERAS: TIntegerField;
     QMCabRepararELEVALUNAS_DELATEROS: TIntegerField;
     QMCabRepararELEVALUNAS_TRASEROS: TIntegerField;
     QMCabRepararRETROVISORES: TIntegerField;
     QMCabRepararCOMENTARIO_ESTADO: TMemoField;
     QMCabRepararTRABAJOS_A_REALIZAR: TMemoField;
     QMCabRepararID_GALERIA_RECEPCION: TIntegerField;
     QMCabRepararCOMENTARIOS_CLIENTE: TMemoField;
     QMCabRepararAUTORIZA_PRESUPUESTO: TIntegerField;
     QMCabRepararAUTORIZA_PRUEBAS: TIntegerField;
     QMCabRepararPIEZAS_DEL_CLIENTE: TIntegerField;
     QMCabRepararRECOGER_PIEZAS_SUSTITUIDAS: TIntegerField;
     QMCabRepararID_FIRMA: TIntegerField;
     QMCabRepararFECHA_HORA_CIERRE: TDateTimeField;
     xLstArticulo: TFIBDataSetRO;
     DSxLstArticulo: TDataSource;
     TLstLocal: THYTransaction;
     xTarea: TFIBTableSet;
     DSxTarea: TDataSource;
     xTareaEMPRESA: TIntegerField;
     xTareaEJERCICIO: TIntegerField;
     xTareaCANAL: TIntegerField;
     xTareaSERIE: TFIBStringField;
     xTareaREPARACION: TIntegerField;
     xTareaIDCABREPARACION: TIntegerField;
     xTareaLINEA_TAREA: TIntegerField;
     xTareaTAREA: TFIBStringField;
     xTareaTIPOTAREA: TFIBStringField;
     xTareaCOMENTARIO: TMemoField;
     xTareaRECURSO: TFIBStringField;
     xTareaCANTIDAD: TFloatField;
     xTareaPRE_COS_UNI_PRE: TFloatField;
     xTareaTOTAL_VAR_PRE: TFloatField;
     xTareaPRECIO_FIJO_PRE: TFloatField;
     xTareaTOTAL_PRE: TFloatField;
     xTareaPRE_COS_UNI_REAL: TFloatField;
     xTareaTOTAL_VAR_REAL: TFloatField;
     xTareaPRECIO_FIJO_REAL: TFloatField;
     xTareaTOTAL_REAL: TFloatField;
     xTareaESTADO: TIntegerField;
     xTareaFECHA_FIN_TAREA: TDateTimeField;
     xTareaIDENTIFICADOR: TIntegerField;
     xTareaENTRADA: TIntegerField;
     xTareaCANTIDAD_UTIL: TFloatField;
     xTareaTIEMPO: TFloatField;
     xTareaTIEMPO_UTIL: TFloatField;
     xTareaTOTAL_IMP: TFloatField;
     xTareaPRECIO_IMP: TFloatField;
     xTareaTOTAL: TFloatField;
     xTareaTOTAL_HORAS: TFloatField;
     xTareaTIEMPO_PRODUCCION: TFIBStringField;
     xTareaFECHA_INICIO_TAREA: TDateTimeField;
     xTareaSECCION: TFIBStringField;
     xTareaPRODUCIENDO: TIntegerField;
     xTareaSITUACION: TIntegerField;
     xEmpleadoTIEMPO_PRODUCCION: TFIBStringField;
     QMCabRepararID_INSPECCION_ITV: TIntegerField;
     QMCabRepararID_EMPLEADO_ITV: TIntegerField;
     QMCabRepararEMPLEADO_ITV: TIntegerField;
     QMCabRepararNOMBRE_EMPLEADO_ITV: TFIBStringField;
     QMCabRepararFECHA_HORA_CIERRE_ITV: TDateTimeField;
     QMCabRepararTITULO_EMPLEADOS_TAREAS: TFIBStringField;
     QMCabRepararTIEMPO_PRODUCCION: TFIBStringField;
     QMTotalesTOTAL_LINEA_COSTO: TFloatField;
     QMTotalesMARGEN: TFloatField;
     QMDetRepararTIPO_LINEA: TFIBStringField;
     QMDetRepararID_P: TIntegerField;
     QMDetRepararORIGEN: TIntegerField;
     QMDetRepararPROC_PROMOCION: TIntegerField;
     QMDetRepararIDDETREPAR: TIntegerField;
     QMCabRepararFORMA_PAGO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCabRepararAfterOpen(DataSet: TDataSet);
     procedure QMCabRepararNewRecord(DataSet: TDataSet);
     procedure QMCabRepararCLIENTEChange(Sender: TField);
     procedure QMDetRepararNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure xLstCabRepararAfterOpen(DataSet: TDataSet);
     procedure QMDetRepararARTICULOChange(Sender: TField);
     procedure frLstRepararGetValue(const ParName: string; var ParValue: variant);
     procedure QMCabRepararBeforeEdit(DataSet: TDataSet);
     procedure QMDetRepararBeforeEdit(DataSet: TDataSet);
     procedure QMDetRepararBeforeInsert(DataSet: TDataSet);
     procedure QMCabRepararBeforeClose(DataSet: TDataSet);
     procedure QMCabRepararBeforePost(DataSet: TDataSet);
     procedure xLstCabRepararBeforeClose(DataSet: TDataSet);
     procedure xEmpleadoTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure xEmpleadoNewRecord(DataSet: TDataSet);
     procedure QMCabRepararPROYECTOChange(Sender: TField);
     procedure xEmpleadoBeforePost(DataSet: TDataSet);
     procedure frLstRepararEnterRect(Memo: TStringList; View: TfrView);
     procedure frxLstRepararBeforePrint(Sender: TfrxReportComponent);
     procedure frxLstRepararGetValue(const VarName: string; var Value: variant);
     procedure QMDetRepararUNIDADESChange(Sender: TField);
     procedure xLstDetRepararAfterOpen(DataSet: TDataSet);
     procedure xLstDetRepararBeforeClose(DataSet: TDataSet);
     procedure xLstDetRepararAfterScroll(DataSet: TDataSet);
     procedure xTareaNewRecord(DataSet: TDataSet);
     procedure xTareaBeforePost(DataSet: TDataSet);
     procedure xTareaTIPOTAREAChange(Sender: TField);
  private
     { Private declarations }
     UtilizaVehiculo: boolean;
     Serie: string;
     procedure VerificarBloqueado(DataSet: TDataSet);
     procedure EstaleceCondiciones(Articulo: TField);
  public
     { Public declarations }
     procedure BusquedaCompleja;
     function BuscaDescNumSerie(Articulo: string; Codigo: integer): string;
     procedure TraspasaDocumento(Tipo: string);
     procedure CambiaSerie(aSerie: string);
     procedure FiltraReparaciones(Filtro: string);
     procedure RellenaSituacionReparacion(Items, Values: TStrings);
     procedure RellenaSituacionReparacionColor(Colores: TStringList);
     procedure RellenaTipoReparacion(Items, Values: TStrings);
     procedure RellenaTipoActuacion(Items, Values: TStrings);
     function DameTituloLocalidad(Localidad: string): string;
     procedure FiltrarNroSerie(Codigo: integer);
     procedure FiltrarCabecera(Filtro: string; Cliente: integer);
     procedure RellenarObservaciones;
     procedure RefrescarDatos;
     procedure RellenaEstadoReparacion(Items, Values: TStrings);
     function DameIdDocumentoEntrada(id_detalles_e: integer): integer;
     procedure FiltraListadoReparacion;
     procedure FiltraMecanicos(RelacionarTarea: boolean);
     procedure ActualizaTiemposHojaTrabajo;
     procedure CambiarEstadoRepar(Abrir: boolean);
  end;

var
  DMReparaciones : TDMReparaciones;

implementation

uses UDMMain, UEntorno, UFBusca, UDMListados, Controls, UUtiles, DateUtils, ExtCtrls, Graphics, UFMSeleccion, UParam, UDameDato, UImagenes;

{$R *.dfm}

procedure TDMReparaciones.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  UtilizaVehiculo := (DMMain.EstadoKri(474) = 1);

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMCabReparar, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMDetReparar, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMTotales, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(xEmpleado, MascaraN, MascaraI, ShortDateFormat);

  QMCabRepararFECHA_AVISO.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMCabRepararFECHA_ENTRADA.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMCabRepararFECHA_SALIDA.DisplayFormat := ShortDateFormat + ' hh:nn';
  QMCabRepararFECHA_PREV_SALIDA.DisplayFormat := ShortDateFormat + ' hh:nn';

  QMCabRepararHORARIO_1_DESDE.DisplayFormat := 'hh:nn';
  QMCabRepararHORARIO_1_HASTA.DisplayFormat := 'hh:nn';
  QMCabRepararHORARIO_2_DESDE.DisplayFormat := 'hh:nn';
  QMCabRepararHORARIO_2_HASTA.DisplayFormat := 'hh:nn';

  QMDetRepararPORCENTAJE_IVA.DisplayFormat := MascaraP;
  QMDetRepararDESCUENTO.DisplayFormat := MascaraP;

  DMMain.FiltraTabla(QMCabReparar, '11100', False);
end;

procedure TDMReparaciones.QMCabRepararAfterOpen(DataSet: TDataSet);
begin
  xSituacion.Open;
  QMDetReparar.Open;
  QMTotales.Open;
  xEmpleado.Open;
  QMFirmas.Open;
  xTarea.Open;
end;

procedure TDMReparaciones.QMCabRepararNewRecord(DataSet: TDataSet);
begin
  QMCabRepararEMPRESA.AsInteger := REntorno.Empresa;
  QMCabRepararEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCabRepararCANAL.AsInteger := REntorno.Canal;
  QMCabRepararFECHA_AVISO.AsDateTime := REntorno.FechaTrab;
  QMCabRepararFECHA_ENTRADA.AsDateTime := REntorno.FechaTrab;
  QMCabRepararSERIE_DOC.AsString := Serie;
  QMCabRepararSERIE.AsString := Serie;
  QMCabRepararPROYECTO.AsInteger := 0;
  QMCabRepararSITUACION.AsInteger := 1;
  QMCabRepararESTADO.AsInteger := 3;
  QMCabRepararTIPO_ACTUACION.AsInteger := 1;
  QMCabRepararTIPO.AsInteger := 1;
  QMCabRepararHORARIO_1_DESDE.AsDateTime := EncodeDateTime(2000, 1, 1, 0, 0, 0, 0);
  QMCabRepararHORARIO_1_HASTA.AsDateTime := EncodeDateTime(2000, 1, 1, 23, 59, 59, 0);
  QMCabRepararHORARIO_2_DESDE.AsDateTime := EncodeDateTime(2000, 1, 1, 0, 0, 0, 0);
  QMCabRepararHORARIO_2_HASTA.AsDateTime := EncodeDateTime(2000, 1, 1, 23, 59, 59, 0);
end;

procedure TDMReparaciones.QMCabRepararCLIENTEChange(Sender: TField);
begin
  if (not DMMain.ClienteBloqueado(QMCabRepararCLIENTE.AsInteger)) then
  begin
     // Obtenemos datos del cliente
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT TERCERO, FORMA_PAGO, TITULO, NOMBRE_COMERCIAL ');
           SQL.Add(' FROM VER_CLIENTES_CUENTAS ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' CLIENTE = :CLIENTE ');
           Params.ByName['EMPRESA'].AsInteger := QMCabRepararEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMCabRepararEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMCabRepararCANAL.AsInteger;
           Params.ByName['CLIENTE'].AsInteger := QMCabRepararCLIENTE.AsInteger;
           ExecQuery;
           QMCabRepararTERCERO.AsInteger := FieldByName['TERCERO'].AsInteger;
           QMCabRepararFORMA_PAGO.AsString := FieldByName['FORMA_PAGO'].AsString;
           QMCabRepararNOMBRE_R_SOCIAL_CLIENTE.AsString := FieldByName['TITULO'].AsString;
           QMCabRepararNOMBRE_COMERCIAL_CLIENTE.AsString := FieldByName['NOMBRE_COMERCIAL'].AsString;
           { TODO : Revisar si es necesario tener dos veces NOMBRE_R_SOCIAL / COMERCIAL ya que son los del cliente }
           QMCabRepararNOMBRE_R_SOCIAL.AsString := FieldByName['TITULO'].AsString;
           QMCabRepararNOMBRE_COMERCIAL.AsString := FieldByName['NOMBRE_COMERCIAL'].AsString;
           QMCabRepararDIRECCION_DOCUMENTO.AsInteger := DMMain.DameMinDireccion(FieldByName['TERCERO'].AsInteger);
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Solo si estoy insertando y todavia no he asignado el cliente relleno la
     // direccion del contacto con los mismos datos que los del cliente
     if ((QMCabReparar.State in [dsInsert]) and (QMCabRepararTERCERO.AsInteger > 0)) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT D.DIRECCION, T.EMAIL, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, T.TELEFONO01, D.DIR_COMPLETA_N, D.DIR_LOCALIDAD ');
              SQL.Add(' FROM SYS_TERCEROS T ');
              SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO ');
              SQL.Add(' WHERE ');
              SQL.Add(' TERCERO = :TERCERO AND ');
              SQL.Add(' D.DIR_DEFECTO = 1 ');
              Params.ByName['TERCERO'].AsInteger := QMCabRepararTERCERO.AsInteger;
              ExecQuery;
              QMCabRepararCONTACTO_DIR_NOMBRE.AsString := Copy(FieldByName['DIR_COMPLETA_N'].AsString, 1, 100);
              QMCabRepararCONTACTO_DIR_NOMBRE_2.AsString := Copy(FieldByName['DIR_COMPLETA_N'].AsString, 101, 100);
              QMCabRepararCONTACTO_LOCALIDAD.AsString := FieldByName['DIR_LOCALIDAD'].AsString;
              QMCabRepararCONTACTO_EMAIL.AsString := FieldByName['EMAIL'].AsString;
              QMCabRepararCONTACTO_TELEFONO.AsString := FieldByName['TELEFONO01'].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end
  else
     QMCabReparar.Cancel;
end;

procedure TDMReparaciones.QMDetRepararNewRecord(DataSet: TDataSet);
begin
  QMDetRepararEMPRESA.AsInteger := QMCabRepararEMPRESA.AsInteger;
  QMDetRepararEJERCICIO.AsInteger := QMCabRepararEJERCICIO.AsInteger;
  QMDetRepararCANAL.AsInteger := QMCabRepararCANAL.AsInteger;

  QMDetRepararIDCABREPARAR.AsInteger := QMCabRepararIDCABREPARAR.AsInteger;

  // Num. Linea siguiente
  QMDetRepararLINEA.AsInteger := DMMain.DameLineaSiguiente('REP', QMCabRepararIDCABREPARAR.AsInteger);
  QMDetRepararUNIDADES.AsFloat := 1;
  QMDetRepararTIPO_LINEA.AsString := 'NOR';

  EstaleceCondiciones(QMDetRepararARTICULO);
end;

procedure TDMReparaciones.Graba(DataSet: TDataSet);
begin
  DataSet.Refresh;

  // Al insertar un articulo es posible que se agregue una tarea por trigger (REPAR_CONF_ARTICULO_TAREA)
  if (DataSet = QMDetReparar) then
     Refrescar(QMDetReparar, 'LINEA', QMDetRepararLINEA.AsInteger);

  // Al insertar un articulo es posible que se agregue una tarea por trigger (REPAR_CONF_ARTICULO_TAREA)
  if (DataSet = QMDetReparar) then
     Refrescar(xTarea, 'IDENTIFICADOR', xTareaIDENTIFICADOR.AsInteger);

  QMTotales.Close;
  QMTotales.Open;
end;

procedure TDMReparaciones.xLstCabRepararAfterOpen(DataSet: TDataSet);
begin
  xLstDetReparar.Open;
  xLstTerceros.Open;
  xLstEmpleado.Open;
  xLstFirmas.Open;
  xLstFichaTecnica.Open;
  xLstRecepcion.Open;
end;

procedure TDMReparaciones.QMDetRepararARTICULOChange(Sender: TField);
{
var
  Tarifa : string;
}
begin
  if (QMDetReparar.State in [dsInsert, dsEdit]) then
  begin
     {
     // Busco la tarifa del cliente
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT TARIFA FROM EMP_CLIENTES ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' CLIENTE = :CLIENTE ');
           Params.ByName['EMPRESA'].AsInteger := QMCabRepararEMPRESA.AsInteger;
           Params.ByName['CLIENTE'].AsInteger := QMCabRepararCLIENTE.AsInteger;
           ExecQuery;
           Tarifa := FieldByName['TARIFA'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
     // Busco el precio de venta en la tarifa
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT FIRST 1 PRECIO_VENTA ');
           SQL.Add(' FROM ART_TARIFAS_PRECIOS ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' ARTICULO = :ARTICULO AND ');
           SQL.Add(' TARIFA = :TARIFA ');
           SQL.Add(' ORDER BY LINEA ');
           Params.ByName['EMPRESA'].AsInteger := QMDetRepararEMPRESA.AsInteger;
           Params.ByName['ARTICULO'].AsString := QMDetRepararARTICULO.AsString;
           Params.ByName['TARIFA'].AsString := Tarifa;
           ExecQuery;
           QMDetRepararPRECIO_VENTA.AsFloat := FieldByName['PRECIO_VENTA'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
     }
     // Busco el precio de venta en la tarifa
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT A.TITULO_LARGO, A.P_COSTE, C.TIPO_IVA ');
           SQL.Add(' FROM CON_CUENTAS_GES_ART C ');
           SQL.Add(' JOIN ART_ARTICULOS A ON A.EMPRESA = C.EMPRESA AND A.ARTICULO = C.ARTICULO ');
           SQL.Add(' WHERE ');
           SQL.Add(' C.EMPRESA = :EMPRESA AND ');
           SQL.Add(' C.EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' C.CANAL = :CANAL AND ');
           SQL.Add(' C.ARTICULO = :ARTICULO ');
           Params.ByName['EMPRESA'].AsInteger := QMDetRepararEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := QMDetRepararEJERCICIO.AsInteger;
           Params.ByName['CANAL'].AsInteger := QMDetRepararCANAL.AsInteger;
           Params.ByName['ARTICULO'].AsString := QMDetRepararARTICULO.AsString;
           ExecQuery;
           // QMDetRepararPRECIO.AsFloat := FieldByName['P_COSTE'].AsFloat;
           QMDetRepararTITULO_ART.AsString := FieldByName['TITULO_LARGO'].AsString;
           QMDetRepararTIPO_IVA.AsInteger := FieldByName['TIPO_IVA'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     EstaleceCondiciones(QMDetRepararARTICULO);
  end;
end;

procedure TDMReparaciones.frLstRepararGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'NombreCliente') then
     ParValue := DameTituloCliente(xLstCabReparar.FieldByName('CLIENTE').AsInteger);
end;

procedure TDMReparaciones.BusquedaCompleja;
begin
  if (TFBusca.Create(Self).SeleccionaBusqueda(QMCabReparar, '10110', True, Serie) = mrAll) then
  begin
     with QMCabReparar do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_REPAR_CAB_REPARACIONES ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EMPRESA=?EMPRESA AND ');
        SelectSQL.Add(' CANAL=?CANAL AND ');
        SelectSQL.Add(' SERIE=?SERIE ');
        SelectSQL.Add(' ORDER BY IDCABREPARAR ');
     end;

     DMMain.FiltraTabla(QMCabReparar, '10100', False);

     CambiaSerie(Serie);
  end;
end;

function TDMReparaciones.BuscaDescNumSerie(Articulo: string; Codigo: integer): string;
begin
  Result := '';
  if (Codigo <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT NSERIE FROM ART_ARTICULOS_SERIALIZACION ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' ARTICULO = :ARTICULO AND ');
           SQL.Add(' CODIGO = :CODIGO ');
           SQL.Add(' ORDER BY NSERIE ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['ARTICULO'].AsString := Articulo;
           Params.ByName['CODIGO'].AsInteger := Codigo;
           ExecQuery;
           Result := FieldByName['NSERIE'].AsString;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure TDMReparaciones.VerificarBloqueado(DataSet: TDataSet);
begin
  if ((QMCabRepararESTADO_REPAR.AsInteger = 5)) then
  begin
     raise Exception.Create(_('Documento Bloqueado'));
     DataSet.Cancel;
  end;
end;

procedure TDMReparaciones.QMCabRepararBeforeEdit(DataSet: TDataSet);
begin
  VerificarBloqueado(DataSet);
end;

procedure TDMReparaciones.QMDetRepararBeforeEdit(DataSet: TDataSet);
begin
  VerificarBloqueado(DataSet);
end;

procedure TDMReparaciones.QMDetRepararBeforeInsert(DataSet: TDataSet);
begin
  VerificarBloqueado(DataSet);
end;

procedure TDMReparaciones.QMCabRepararBeforeClose(DataSet: TDataSet);
begin
  xSituacion.Close;
  QMDetReparar.Close;
  QMTotales.Close;
  xEmpleado.Close;
  QMFirmas.Open;
  xLstFichaTecnica.Close;
  xLstRecepcion.Close;
  xTarea.Close;
end;

procedure TDMReparaciones.TraspasaDocumento(Tipo: string);
var
  info_raparar : string;
  EmpresaDestino : integer;
  Seguir : boolean;
  SerieDestino : string;
begin
  inherited;

  EmpresaDestino := StrToIntDef(LeeParametro('REPTRAS007'), 0);
  if (EmpresaDestino = 0) then
     EmpresaDestino := REntorno.Empresa;

  Seguir := True;
  // Pido empresa destino
  if (LeeParametro('REPTRAS001') = 'S') then
     Seguir := PideDato('EMP', EmpresaDestino);

  if (LeeParametro('REPTRAS009') = 'S') then
  begin
     // SERHVAS quiere este comportamiento
     if EmpresaDestino = 1 then
        Seriedestino := 'T'
     else
        SerieDestino := 'S';
  end
  else
  begin
     if (Trim(QMCabRepararSERIE_DOC.AsString) <> '') then
        SerieDestino := Trim(QMCabRepararSERIE_DOC.AsString)
     else
        SerieDestino := REntorno.Serie;
  end;

  // Pido serie destino
  if (Seguir) then
     Seguir := PideDato('SER', SerieDestino, '', '', EmpresaDestino, REntorno.Ejercicio, REntorno.Canal);

  if (Seguir) then
  begin
     info_raparar := '';
     if (LeeParametro('REPTRAS006') <> 'S') then
     begin
        // Es posa en un string totes les dades a traspassar a l'albarà al camp notas
        if (UtilizaVehiculo) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Add(' SELECT R.MATRICULA, R.MARCA, R.MODELO, R.BASTIDOR, M.TITULO ');
                 SQL.Add(' FROM REP_FICHA_TECNICA R ');
                 SQL.Add(' LEFT JOIN SYS_MARCA M ');
                 SQL.Add(' ON R.MARCA = M.MARCA ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' ID_FICHA_TECNICA = :ID_FICHA_TECNICA ');
                 Params.ByName['ID_FICHA_TECNICA'].AsInteger := QMCabRepararID_FICHA_TECNICA.AsInteger;
                 ExecQuery;
                 info_raparar := Format(_('Reparacion %s (Id: %s) de fecha %s' + #13#10 + 'Vehiculo: %s' + #13#10 + 'Marca: %s Modelo: %s' + #13#10 + 'Kilometros: %.0f' + #13#10 + 'Bastidor: %s'),
                    [QMCabRepararREPARACION.AsString, QMCabRepararIDCABREPARAR.AsString, FormatDateTime(ShortDateFormat, QMCabRepararFECHA_ENTRADA.AsDateTime), FieldByName['MATRICULA'].AsString,
                    FieldByName['TITULO'].AsString, FieldByName['MODELO'].AsString, QMCabRepararKILOMETROS_ENTRADA.AsFloat, FieldByName['BASTIDOR'].AsString]);
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end
        else
        begin
           info_raparar := Format(_('Reparacion %s (Id: %s) de fecha %s'), [QMCabRepararREPARACION.AsString, QMCabRepararIDCABREPARAR.AsString, FormatDateTime(ShortDateFormat, QMCabRepararFECHA_ENTRADA.AsDateTime)]);
           if (Trim(QMCabRepararEQUIPO.AsString) <> '') then
              info_raparar := info_raparar + Format(#13#10 + _('Equipo %s'), [QMCabRepararEQUIPO.AsString]);
           if (Trim(QMCabRepararMARCA.AsString) <> '') then
              info_raparar := info_raparar + Format(#13#10 + _('Marca %s Modelo %s'), [QMCabRepararMARCA.AsString, QMCabRepararMODELO.AsString]);
           if (Trim(QMCabRepararNUM_SERIE.AsString) <> '') then
              info_raparar := info_raparar + Format(#13#10 + _('Nro. Serie %s'), [QMCabRepararNUM_SERIE.AsString]);
           if (QMCabRepararID_NUM_SERIE.AsInteger <> 0) then
              info_raparar := info_raparar + Format(#13#10 + _('Nro. Serie %s'), [BuscaDescNumSerie(QMCabRepararEQUIPO.AsString, QMCabRepararID_NUM_SERIE.AsInteger)]);
        end;
     end;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT ID_S FROM REP_GENERA_DOCUMENTO(:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :ID_REPARAR, :ENTRADA, :INFO_REPARAR, :EMPRESA_DST)';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := SerieDestino;
           Params.ByName['TIPO'].AsString := Tipo;
           Params.ByName['ID_REPARAR'].AsInteger := QMCabRepararIDCABREPARAR.AsInteger;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['INFO_REPARAR'].AsString := info_raparar;
           Params.ByName['EMPRESA_DST'].AsInteger := EmpresaDestino;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     QMCabReparar.Refresh;
  end;
end;

procedure TDMReparaciones.QMCabRepararBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
  begin
     DMMain.Contador_Gen(DataSet, 'REPARAR_CAB', 'IDCABREPARAR');
     DataSet.FieldByName('REPARACION').AsInteger := DMMain.Contador_EECS(DataSet.FieldByName('SERIE').AsString, 'REP');
  end;

  // La parte fecha siempre será 01/01/200
  QMCabRepararHORARIO_1_DESDE.AsDateTime := RecodeDate(QMCabRepararHORARIO_1_DESDE.AsDateTime, 2000, 1, 1);
  QMCabRepararHORARIO_1_HASTA.AsDateTime := RecodeDate(QMCabRepararHORARIO_1_HASTA.AsDateTime, 2000, 1, 1);
  QMCabRepararHORARIO_2_DESDE.AsDateTime := RecodeDate(QMCabRepararHORARIO_2_DESDE.AsDateTime, 2000, 1, 1);
  QMCabRepararHORARIO_2_HASTA.AsDateTime := RecodeDate(QMCabRepararHORARIO_2_HASTA.AsDateTime, 2000, 1, 1);
end;

procedure TDMReparaciones.xLstCabRepararBeforeClose(DataSet: TDataSet);
begin
  xLstDetReparar.Close;
  xLstTerceros.Close;
  xLstEmpleado.Close;
  xLstFirmas.Close;
  xLstFichaTecnica.Close;
  xLstRecepcion.Close;
end;

procedure TDMReparaciones.CambiaSerie(aSerie: string);
var
  IdReparacion : integer;
begin
  Serie := aSerie;
  IdReparacion := QMCabRepararIDCABREPARAR.AsInteger;
  with QMCabReparar do
  begin
     Close;
     if ExisteParametro(QMCabReparar, 'SERIE') then
        Params.ByName['SERIE'].AsString := Serie;
     Open;
  end;

  if (IdReparacion <> 0) then
     Posicionar(QMCabReparar, 'IDCABREPARAR', IdReparacion);
end;

procedure TDMReparaciones.xEmpleadoTITULOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  {***}  Text := DameTituloEmpleado(xEmpleadoEMPLEADO.AsInteger);
end;

procedure TDMReparaciones.xEmpleadoNewRecord(DataSet: TDataSet);
begin
  xEmpleadoEMPRESA.AsInteger := xTareaEMPRESA.AsInteger;
  xEmpleadoIDCABREPARAR.AsInteger := xTareaIDCABREPARACION.AsInteger;
  xEmpleadoLINEA_TAREA.AsInteger := xTareaLINEA_TAREA.AsInteger;
end;

procedure TDMReparaciones.FiltraReparaciones(Filtro: string);
begin
  if (Trim(Filtro) <> '') then
  begin
     with DMReparaciones.QMCabReparar do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_REPAR_CAB_REPARACIONES ');
        SelectSQL.Add(' WHERE ' + Filtro);
        SelectSQL.Add(' ORDER BY IDCABREPARAR ');
        Open;
     end;
  end;
end;

procedure TDMReparaciones.RellenaTipoReparacion(Items, Values: TStrings);
begin
  Items.Clear;
  Values.Clear;
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT TIPO, TITULO FROM SYS_TIPO_REPARACION ');
           SelectSQL.Add(' ORDER BY TIPO ');
           Open;
           while not EOF do
           begin
              Items.Add(FieldByName('TITULO').AsString);
              Values.Add(FieldByName('TIPO').AsString);
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
end;

procedure TDMReparaciones.RellenaTipoActuacion(Items, Values: TStrings);
begin
  Items.Clear;
  Values.Clear;
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT TIPO, TITULO FROM SYS_TIPO_ACTUACION ');
           SelectSQL.Add(' ORDER BY TIPO ');
           Open;
           while not EOF do
           begin
              Items.Add(FieldByName('TITULO').AsString);
              Values.Add(FieldByName('TIPO').AsString);
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
end;

procedure TDMReparaciones.RellenarObservaciones;
begin
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT DESCRIPCION FROM SYS_TIPO_ACTUACION ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' TIPO = :TIPO ');
           Params.ByName['TIPO'].AsInteger := QMCabRepararTIPO_ACTUACION.AsInteger;
           Open;
           QMCabRepararOBSERVACIONES_CLIENTE.AsString := FieldByName('DESCRIPCION').AsString;
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

procedure TDMReparaciones.RellenaEstadoReparacion(Items, Values: TStrings);
begin
  Items.Clear;
  Values.Clear;
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT ESTADO, TITULO FROM SYS_GES_ESTADOS_REPARACIONES ');
           SelectSQL.Add(' ORDER BY ESTADO ');
           Open;
           while not EOF do
           begin
              Items.Add(FieldByName('TITULO').AsString);
              Values.Add(FieldByName('ESTADO').AsString);
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
end;

procedure TDMReparaciones.RellenaSituacionReparacion(Items, Values: TStrings);
begin
  Items.Clear;
  Values.Clear;
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT SITUACION, TITULO FROM REPAR_SITUACIONES ');
           SelectSQL.Add(' ORDER BY SITUACION ');
           Open;
           while not EOF do
           begin
              Items.Add(FieldByName('TITULO').AsString);
              Values.Add(FieldByName('SITUACION').AsString);
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
end;

procedure TDMReparaciones.RellenaSituacionReparacionColor(Colores: TStringList);
begin
  Colores.Clear;
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT SITUACION, COLOR FROM REPAR_SITUACIONES ');
           SelectSQL.Add(' ORDER BY SITUACION ');
           Open;
           while not EOF do
           begin
              Colores.Values[IntToStr(FieldByName('SITUACION').AsInteger)] := IntToStr(FieldByName('COLOR').AsInteger);
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
end;

function TDMReparaciones.DameTituloLocalidad(Localidad: string): string;
begin
  Localidad := Trim(Copy(Localidad, 1, 8));
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT L.CODIGO_POSTAL || '' '' || L.TITULO || '' ('' || P.TITULO || '')'' ');
        SQL.Add(' FROM SYS_LOCALIDADES L ');
        SQL.Add(' JOIN SYS_PROVINCIAS P ON L.PAIS = P.PAIS AND L.PROVINCIA = P.PROVINCIA ');
        SQL.Add(' WHERE ');
        SQL.Add(' L.LOCALIDAD = :LOCALIDAD ');
        Params.ByName['LOCALIDAD'].AsString := Localidad;
        ExecQuery;
        Result := Fields[0].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMReparaciones.QMCabRepararPROYECTOChange(Sender: TField);
begin
  { PARAMETRIZAR SI ALGUIEN LO UTILIZA

  // Valores por defecto a partir del proyecto
  if (QMCabRepararPROYECTO.AsInteger <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT P.KILOMETROS_DESTINO, P.HORARIO_1_DESDE, P.HORARIO_1_HASTA, P.HORARIO_2_DESDE, P.HORARIO_2_HASTA, T.EMAIL, ');
           SQL.Add('        T.TELEFONO01, T.NOMBRE_R_SOCIAL, D.DIR_LOCALIDAD, D.DIR_COMPLETA_N, D.DIR_NOMBRE_2 ');
           SQL.Add(' FROM EMP_PROYECTOS P ');
           SQL.Add(' LEFT JOIN SYS_TERCEROS T ON T.TERCERO = P.TERCERO_NULL ');
           SQL.Add(' LEFT JOIN SYS_TERCEROS_DIRECCIONES D ON D.TERCERO = P.TERCERO_NULL AND D.DIRECCION = P.DIRECCION_TERCERO_NULL ');
           SQL.Add(' WHERE ');
           SQL.Add(' P.EMPRESA = :EMPRESA AND ');
           SQL.Add(' P.PROYECTO = :PROYECTO ');
           Params.ByName['EMPRESA'].AsInteger := QMCabRepararEMPRESA.AsInteger;
           Params.ByName['PROYECTO'].AsInteger := QMCabRepararPROYECTO.AsInteger;
           ExecQuery;
           QMCabRepararKILOMETROS_ENTRADA.AsFloat := FieldByName['KILOMETROS_DESTINO'].AsFloat;
           QMCabRepararCONTACTO_NOMBRE.AsString := FieldByName['NOMBRE_R_SOCIAL'].AsString;
           QMCabRepararCONTACTO_TELEFONO.AsString := FieldByName['TELEFONO01'].AsString;
           QMCabRepararCONTACTO_EMAIL.AsString := FieldByName['EMAIL'].AsString;
           QMCabRepararCONTACTO_LOCALIDAD.AsString := FieldByName['DIR_LOCALIDAD'].AsString;
           QMCabRepararCONTACTO_DIR_NOMBRE.AsString := FieldByName['DIR_COMPLETA_N'].AsString;
           QMCabRepararCONTACTO_DIR_NOMBRE_2.AsString := FieldByName['DIR_NOMBRE_2'].AsString;
           QMCabRepararHORARIO_1_DESDE.AsDateTime := FieldByName['HORARIO_1_DESDE'].AsDateTime;
           QMCabRepararHORARIO_1_HASTA.AsDateTime := FieldByName['HORARIO_1_HASTA'].AsDateTime;
           QMCabRepararHORARIO_2_DESDE.AsDateTime := FieldByName['HORARIO_2_DESDE'].AsDateTime;
           QMCabRepararHORARIO_2_HASTA.AsDateTime := FieldByName['HORARIO_2_HASTA'].AsDateTime;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
  }
end;

procedure TDMReparaciones.xEmpleadoBeforePost(DataSet: TDataSet);
begin
  xEmpleadoID_EMPLEADO.AsInteger := DameIDEmpleado(xEmpleadoEMPLEADO.AsInteger);
end;

procedure TDMReparaciones.frLstRepararEnterRect(Memo: TStringList; View: TfrView);
var
  NumeroFirma : integer;
  s : string;
  Imagen : TImage;
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     // Las variables de firma tendrán el formato [Firma-n] donde 'n' es un numero
     s := Trim(Memo[0]);
     if ((Pos('[Firma-', s) > 0) and (View is TfrPictureView)) then
     begin
        // Obtengo numero de firma
        s := Copy(s, 8, Length(s) - Pos(']', s) + 1);
        NumeroFirma := StrToIntDef(s, -1);

        // Recorro firmas hasta encontrar la deseada
        if not xLstFirmas.Active then
           xLstFirmas.Open
        else
           xLstFirmas.First;

        while ((xLstFirmas.RecNo < NumeroFirma) and (not xLstFirmas.EOF)) do
           xLstFirmas.Next;

        // Si existe cargo la imagen en el Memo.
        if (xLstFirmas.RecNo = NumeroFirma) then
        begin
           Imagen := TImage.Create(nil);
           try
              RefrescarImagenFirma(Imagen, xLstFirmas.FieldByName('ID_FIRMA').AsInteger);
              TfrPictureView(View).Picture.Assign(Imagen.Picture);
           finally
              Imagen.Free;
           end;
        end;
     end;
  end;
end;

procedure TDMReparaciones.frxLstRepararBeforePrint(Sender: TfrxReportComponent);
var
  NumeroFirma : integer;
  s : string;
  Imagen : TImage;
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxPictureView) then
  begin
     with TfrxPictureView(Sender) do
     begin
        if (TagStr > '') then
        begin
           // Las variables de firma tendrán el formato [Firma-n] donde 'n' es un numero
           s := Trim(TagStr);
           if ((Pos('Firma-', s) > 0) and (Sender is TfrxPictureView)) then
           begin
              // Obtengo numero de firma
              s := Copy(s, 7, Length(s));
              NumeroFirma := StrToIntDef(s, -1);

              // Recorro firmas hasta encontrar la deseada
              if not xLstFirmas.Active then
                 xLstFirmas.Open
              else
                 xLstFirmas.First;

              while ((xLstFirmas.RecNo < NumeroFirma) and (not xLstFirmas.EOF)) do
                 xLstFirmas.Next;

              // Si existe cargo la imagen en el Memo.
              if (xLstFirmas.RecNo = NumeroFirma) then
              begin
                 Imagen := TImage.Create(nil);
                 try
                    Imagen.Transparent := True;
                    RefrescarImagenFirma(Imagen, xLstFirmas.FieldByName('ID_FIRMA').AsInteger);
                    TfrxPictureView(Sender).Picture.Assign(Imagen.Picture);
                 finally
                    Imagen.Free;
                 end;
              end;
           end;
        end;
     end;
  end;
end;

procedure TDMReparaciones.frxLstRepararGetValue(const VarName: string; var Value: variant);
begin
  frLstRepararGetValue(VarName, Value);
end;

procedure TDMReparaciones.FiltrarNroSerie(Codigo: integer);
begin
  with QMCabReparar do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_REPAR_CAB_REPARACIONES ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' CANAL = :CANAL AND ');
     SelectSQL.Add(' SERIE = :SERIE AND ');
     SelectSQL.Add(' ID_NUM_SERIE = ' + IntToStr(Codigo));
     SelectSQL.Add(' ORDER BY IDCABREPARAR ');
  end;

  DMMain.FiltraTabla(QMCabReparar, '10100', False);
  CambiaSerie(Serie);
end;

procedure TDMReparaciones.FiltrarCabecera(Filtro: string; Cliente: integer);
begin
  Filtro := Trim(Filtro);

  with QMCabReparar do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_REPAR_CAB_REPARACIONES ');
     SelectSQL.Add(' WHERE ');

     if ((Filtro = '') and (Cliente = 0)) then
     begin
        SelectSQL.Add(' (EMPRESA = :EMPRESA AND ');
        SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SelectSQL.Add(' CANAL = :CANAL AND ');
        SelectSQL.Add(' SERIE = :SERIE ');

        SelectSQL.Add(' ) ');
        SelectSQL.Add(' OR ');
        SelectSQL.Add(' (EMPRESA = :EMPRESA AND ');
        SelectSQL.Add(' EJERCICIO < :EJERCICIO AND ');
        SelectSQL.Add(' CANAL = :CANAL AND ');
        SelectSQL.Add(' SERIE = :SERIE AND ');
        SelectSQL.Add(' ESTADO <> 5 ');
        SelectSQL.Add(' ) ');
     end
     else
     begin
        SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
        SelectSQL.Add(' EJERCICIO <= :EJERCICIO AND ');
        SelectSQL.Add(' CANAL = :CANAL AND ');
        SelectSQL.Add(' SERIE = :SERIE AND ');
        SelectSQL.Add(' ((UPPER(CONTACTO_NOMBRE) LIKE UPPER(''%'' || CAST(:FILTRO AS VARCHAR(100)) || ''%'')) OR ');
        SelectSQL.Add(' (UPPER(CONTACTO_TELEFONO) LIKE UPPER(''%'' || SUBSTRING(CAST(:FILTRO AS VARCHAR(100)) FROM 1 FOR 18) || ''%'')) OR ');
        SelectSQL.Add(' (UPPER(CONTACTO_EMAIL) LIKE UPPER(''%'' || CAST(:FILTRO AS VARCHAR(100)) || ''%'')) OR ');
        SelectSQL.Add(' (UPPER(CONTACTO_DIR_NOMBRE) LIKE UPPER(''%''|| CAST(:FILTRO AS VARCHAR(100)) || ''%'')) OR ');
        SelectSQL.Add(' (UPPER(NOMBRE_R_SOCIAL) LIKE UPPER(''%''|| SUBSTRING(CAST(:FILTRO AS VARCHAR(100)) FROM 1 FOR 58) || ''%'')) OR ');
        SelectSQL.Add(' (UPPER(NOMBRE_COMERCIAL) LIKE UPPER(''%''|| SUBSTRING(CAST(:FILTRO AS VARCHAR(100)) FROM 1 FOR 58) || ''%'')) OR ');
        SelectSQL.Add(' (UPPER(MATRICULA) LIKE UPPER(''%''|| SUBSTRING(CAST(:FILTRO AS VARCHAR(100)) FROM 1 FOR 18) || ''%''))) ');
        if (Cliente <> 0) then
           SelectSQL.Add(' AND CLIENTE = :CLIENTE ');
     end;

     SelectSQL.Add(' ORDER BY IDCABREPARAR ');

     if (Filtro <> '') then
        Params.ByName['FILTRO'].AsString := Copy(Filtro, 1, 100);
     if (Cliente <> 0) then
        Params.ByName['CLIENTE'].AsInteger := Cliente;
  end;

  DMMain.FiltraTabla(QMCabReparar, '11100', False);
  CambiaSerie(Serie);
end;

procedure TDMReparaciones.QMDetRepararUNIDADESChange(Sender: TField);
begin
  if (QMDetReparar.State in [dsInsert, dsEdit]) then
  begin
     EstaleceCondiciones(QMDetRepararARTICULO);
  end;
end;

procedure TDMReparaciones.EstaleceCondiciones(Articulo: TField);
var
  //Modo : integer;
  Tarifa : string;
begin
  // Busco la tarifa del cliente
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT TARIFA FROM EMP_CLIENTES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' CLIENTE = :CLIENTE ');
        Params.ByName['EMPRESA'].AsInteger := QMCabRepararEMPRESA.AsInteger;
        Params.ByName['CLIENTE'].AsInteger := QMCabRepararCLIENTE.AsInteger;
        ExecQuery;
        Tarifa := FieldByName['TARIFA'].AsString;
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
        SQL.Add(' SELECT * FROM G_PRECIO_VENTA_MONEDA(:EMPRESA, :CLIENTE, :ARTICULO, :TARIFA, :FECHA, :EJERCICIO, :CANAL, ');
        SQL.Add(' :UNIDADES_EXT, :PRECIOP, :UNIDADES, :MONEDA, :ID_A, :UNIDADES_OLD, :IDIOMA, :TIPO_LINEA, :ID_P_OLD, :ALMACEN, :FACTOR) ');
        Params.ByName['EMPRESA'].AsInteger := QMCabRepararEMPRESA.AsInteger;
        Params.ByName['CLIENTE'].AsInteger := QMCabRepararCLIENTE.AsInteger;
        Params.ByName['ARTICULO'].AsString := QMDetRepararARTICULO.AsString;
        Params.ByName['TARIFA'].AsString := Tarifa;
        Params.ByName['FECHA'].AsDateTime := QMCabRepararFECHA_ENTRADA.AsDateTime;
        Params.ByName['EJERCICIO'].AsInteger := QMCabRepararEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCabRepararCANAL.AsInteger;
        Params.ByName['UNIDADES_EXT'].AsFloat := 0;
        Params.ByName['PRECIOP'].AsFloat := 0; // Precio;
        Params.ByName['UNIDADES'].AsFloat := QMDetRepararUNIDADES.AsFloat;
        Params.ByName['MONEDA'].AsString := REntorno.Moneda;
        Params.ByName['ID_A'].AsInteger := DameIdArticulo(QMDetRepararARTICULO.AsString);
        Params.ByName['UNIDADES_OLD'].AsFloat := 0; // Unidades_Old;
        Params.ByName['IDIOMA'].AsString := REntorno.IdiomaCanal;
        Params.ByName['TIPO_LINEA'].AsString := 'NOR';
        Params.ByName['ID_P_OLD'].AsInteger := 0;
        Params.ByName['ALMACEN'].AsString := REntorno.AlmacenDefecto;
        Params.ByName['FACTOR'].AsFloat := 1;
        ExecQuery;

        // 0: Precio de Tarifa; 1-11: Precio de condiciones
        //Modo := FieldByName['MODO'].AsInteger;

           {
           if (Trim(QMDetalleTITULO_IDIOMA.AsString) = '') then
              QMDetalleTITULO_IDIOMA.AsString := FieldByName['TITULO_IDIOMA'].AsString;
           }
        if (Trim(QMDetRepararTITULO_ART.AsString) = '') then
           QMDetRepararTITULO_ART.AsString := FieldByName['TITULO'].AsString;

        // if ((FieldByName['PRECIO_ANT'].AsInteger = 0) or Forzar) then
        // begin
        QMDetRepararPRECIO_VENTA.AsFloat := FieldByName['PRECIO'].AsFloat;
        QMDetRepararDESCUENTO.AsFloat := FieldByName['DESCUENTO'].AsFloat;
        QMDetRepararPRECIO.AsFloat := FieldByName['PRECIO_COSTE'].AsFloat;
        QMDetRepararID_P.AsInteger := FieldByName['ID_P'].AsInteger;

        // QMDetalleDESCUENTO_2.AsFloat := FieldByName['DESCUENTO_2'].AsFloat;
        // QMDetalleDESCUENTO_3.AsFloat := FieldByName['DESCUENTO_3'].AsFloat;
        // QMDetalleID_P.AsInteger := FieldByName['ID_P'].AsInteger;
        // Utiliza precio coste de art_tarifas_precios
        // end;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (QMDetRepararID_P.AsInteger > 0) then
     QMDetRepararPROC_PROMOCION.AsInteger := 1;
end;

procedure TDMReparaciones.RefrescarDatos;
begin
  CambiaSerie(Serie);
end;

function TDMReparaciones.DameIdDocumentoEntrada(id_detalles_e: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        Database := DMMain.DataBase;
        SQL.Text := 'SELECT ID_E FROM GES_DETALLES_E WHERE ID_DETALLES_E = :ID_DETALLES_E';
        Params.ByName['ID_DETALLES_E'].AsInteger := id_detalles_e;
        ExecQuery;
        Result := FieldByName['ID_E'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMReparaciones.xLstDetRepararAfterOpen(DataSet: TDataSet);
begin
  xLstArticulo.Open;
end;

procedure TDMReparaciones.xLstDetRepararBeforeClose(DataSet: TDataSet);
begin
  xLstArticulo.Close;
end;

procedure TDMReparaciones.FiltraListadoReparacion;
begin
  if TLstLocal.InTransaction then
     TLstLocal.Commit;
  if not TLstLocal.InTransaction then
     TLstLocal.StartTransaction;

  with xLstCabReparar do
  begin
     Close;
     Params.ByName['IDCABREPARAR'].AsInteger := QMCabRepararIDCABREPARAR.AsInteger;
     Open;
  end;
end;

procedure TDMReparaciones.xLstDetRepararAfterScroll(DataSet: TDataSet);
begin
  xLstArticulo.Close;
  xLstArticulo.Open;
end;

procedure TDMReparaciones.xTareaNewRecord(DataSet: TDataSet);
begin
  xTareaEMPRESA.AsInteger := QMCabRepararEMPRESA.AsInteger;
  xTareaEJERCICIO.AsInteger := QMCabRepararEJERCICIO.AsInteger;
  xTareaCANAL.AsInteger := QMCabRepararCANAL.AsInteger;
  xTareaSERIE.AsString := QMCabRepararSERIE.AsString;
  xTareaREPARACION.AsInteger := QMCabRepararREPARACION.AsInteger;
  xTareaIDCABREPARACION.AsInteger := QMCabRepararIDCABREPARAR.AsInteger;

  xTareaTIPOTAREA.AsString := LeeParametro('REPTARE001');
  xTareaSECCION.AsString := 'DES';
  xTareaRECURSO.AsString := 'MO';
end;

procedure TDMReparaciones.xTareaBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(xTarea, 'PRO_REP_ID_TAREAS', 'IDENTIFICADOR');
end;

procedure TDMReparaciones.FiltraMecanicos(RelacionarTarea: boolean);
begin
  with xEmpleado do
  begin
     Close;

     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM REPAR_CAB_EMPLEADOS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' IDCABREPARAR = :IDCABREPARACION ');
     if (RelacionarTarea) then
        SelectSQL.Add(' AND LINEA_TAREA =  :LINEA_TAREA ');
     SelectSQL.Add(' ORDER BY LINEA_TAREA, EMPLEADO ');

     Open;
  end;
end;

procedure TDMReparaciones.xTareaTIPOTAREAChange(Sender: TField);
begin
  xTareaTAREA.AsString := DameTituloTarea(xTareaTIPOTAREA.AsString);
end;

procedure TDMReparaciones.ActualizaTiemposHojaTrabajo;
var
  IdHojaTrabajo, Empleado : integer;
  Posicion, TotalMinutosHT, Horas, Minutos, HorasHT, MinutosHT, MinutosReparacion : integer;
  DS : TFIBDataSet;
  TiempoProduccion : string;
  IdentificadorTarea : integer;
  IdEmpleado : integer;
begin
  // Datos para reposicionar
  IdentificadorTarea := xTareaIDENTIFICADOR.AsInteger;
  IdEmpleado := xEmpleadoID_EMPLEADO.AsInteger;

  MinutosReparacion := 0;

  with xTarea do
  begin
     DisableControls;
     try
        if (RecordCount > 0) then
        begin
           // Recorro tareas de la reparacion RECALCULANDO los tiempos de las hojas de trabajo de los empleados
           First;
           while not EOF do
           begin
              // Recorremos empleados por linea de tarea
              DS := TFIBDataSet.Create(nil);
              try
                 with DS do
                 begin
                    Transaction := DameTransactionRO(DMMain.DataBase);
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       if (not Transaction.InTransaction) then
                          Transaction.StartTransaction;
                       SelectSQL.Add(' SELECT * FROM REPAR_CAB_EMPLEADOS ');
                       SelectSQL.Add(' WHERE ');
                       SelectSQL.Add(' IDCABREPARAR = :IDCABREPARAR AND ');
                       SelectSQL.Add(' LINEA_TAREA = :LINEA_TAREA ');
                       SelectSQL.Add(' ORDER BY LINEA_TAREA, EMPLEADO ');
                       Params.ByName['IDCABREPARAR'].AsInteger := xTareaIDCABREPARACION.AsInteger;
                       Params.ByName['LINEA_TAREA'].AsInteger := xTareaLINEA_TAREA.AsInteger;
                       Open;

                       First;
                       while not EOF do
                       begin
                          Empleado := FieldByName('EMPLEADO').AsInteger;

                          // Obtengo hojas de trabajo del empleado-tarea
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                Database := DMMain.DataBase;
                                SQL.Add(' SELECT FIRST 1 ID_HOJA_TRABAJO ');
                                SQL.Add(' FROM OPE_HOJAS_TRABAJO ');
                                SQL.Add(' WHERE ');
                                SQL.Add(' ID_ORDEN = :IDCABREPARAR AND ');
                                SQL.Add(' EMPRESA = :EMPRESA AND ');
                                SQL.Add(' EMPLEADO = :EMPLEADO AND ');
                                SQL.Add(' LINEA_TAREA = :LINEA_TAREA ');
                                Params.ByName['IDCABREPARAR'].AsInteger := xTareaIDCABREPARACION.AsInteger;
                                Params.ByName['EMPRESA'].AsInteger := xTareaEMPRESA.AsInteger;
                                Params.ByName['EMPLEADO'].AsInteger := Empleado;
                                Params.ByName['LINEA_TAREA'].AsInteger := xTareaLINEA_TAREA.AsInteger;
                                ExecQuery;
                                IdHojaTrabajo := FieldByName['ID_HOJA_TRABAJO'].AsInteger;
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
                                SQL.Add('EXECUTE PROCEDURE ACTUALIZA_TIEMPOS_PRODUCCION(:ID_HOJA_TRABAJO)');
                                Params.ByName['ID_HOJA_TRABAJO'].AsInteger := IdHojaTrabajo;
                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
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

              Next;
           end;

           // Recorro tareas de la reparacion SUMANDO los tiempos de las hojas de trabajo de los empleados
           First;
           while not EOF do
           begin
              // Recorremos empleados por linea de tarea
              DS := TFIBDataSet.Create(nil);
              try
                 with DS do
                 begin
                    Transaction := DameTransactionRO(DMMain.DataBase);
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       if (not Transaction.InTransaction) then
                          Transaction.StartTransaction;
                       SelectSQL.Add(' SELECT * FROM REPAR_CAB_EMPLEADOS ');
                       SelectSQL.Add(' WHERE ');
                       SelectSQL.Add(' IDCABREPARAR = :IDCABREPARAR AND ');
                       SelectSQL.Add(' LINEA_TAREA = :LINEA_TAREA ');
                       SelectSQL.Add(' ORDER BY LINEA_TAREA, EMPLEADO ');
                       Params.ByName['IDCABREPARAR'].AsInteger := xTareaIDCABREPARACION.AsInteger;
                       Params.ByName['LINEA_TAREA'].AsInteger := xTareaLINEA_TAREA.AsInteger;
                       Open;

                       TotalMinutosHT := 0;
                       First;
                       while not EOF do
                       begin
                          // Extraer horas y minutos de los tiempos
                          TiempoProduccion := FieldByName('TIEMPO_PRODUCCION').AsString;

                          if (TiempoProduccion = '') then
                             TiempoProduccion := '0:00';

                          Posicion := Pos(':', TiempoProduccion);
                          HorasHT := StrToInt(Copy(TiempoProduccion, 1, Posicion - 1));
                          MinutosHT := StrToInt(Copy(TiempoProduccion, Posicion + 1, Length(TiempoProduccion)));

                          TotalMinutosHT := TotalMinutosHT + (HorasHT * 60 + MinutosHT);

                          Next;
                       end;

                       // Definimos las horas y minutos de los totales por linea
                       Horas := TotalMinutosHT div 60;
                       Minutos := TotalMinutosHT mod 60;
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             Database := DMMain.DataBase;
                             SQL.Add(' UPDATE PRO_REP_TAREA ');
                             SQL.Add(' SET ');
                             SQL.Add(' TIEMPO_PRODUCCION = :TIEMPO_PRODUCCION ');
                             SQL.Add(' WHERE ');
                             SQL.Add(' IDCABREPARACION = :IDCABREPARACION AND ');
                             SQL.Add(' LINEA_TAREA = :LINEA_TAREA ');
                             Params.ByName['IDCABREPARACION'].AsInteger := xTareaIDCABREPARACION.AsInteger;
                             Params.ByName['LINEA_TAREA'].AsInteger := xTareaLINEA_TAREA.AsInteger;
                             Params.ByName['TIEMPO_PRODUCCION'].AsString := format('%d:%.2d', [Horas, Minutos]);
                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;

                       MinutosReparacion := MinutosReparacion + TotalMinutosHT;

                       Close;
                       Transaction.Commit;
                    finally
                       Transaction.Free;
                    end;
                 end;
              finally
                 FreeAndNil(DS);
              end;

              Next;
           end;
        end;
     finally
        EnableControls;
     end;
  end;

  Horas := MinutosReparacion div 60;
  Minutos := MinutosReparacion mod 60;

  // Guardamos el tiempo total
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        Database := DMMain.DataBase;
        SQL.Add(' UPDATE REPAR_CAB_REPARACIONES ');
        SQL.Add(' SET ');
        SQL.Add(' TIEMPO_PRODUCCION = :TIEMPO_PRODUCCION ');
        SQL.Add(' WHERE ');
        SQL.Add(' IDCABREPARAR = :IDCABREPARAR ');
        Params.ByName['IDCABREPARAR'].AsInteger := QMCabRepararIDCABREPARAR.AsInteger;
        Params.ByName['TIEMPO_PRODUCCION'].AsString := format('%d:%.2d', [Horas, Minutos]);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refrescar(QMCabReparar, 'IDCABREPARAR', QMCabRepararIDCABREPARAR.AsInteger);
  Posicionar(xTarea, 'IDENTIFICADOR', IdentificadorTarea);
  Posicionar(xEmpleado, 'ID_EMPLEADO', IdEmpleado);
end;

procedure TDMReparaciones.CambiarEstadoRepar(Abrir: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        Database := DMMain.DataBase;
        SQL.Add(' UPDATE REPAR_CAB_REPARACIONES ');
        SQL.Add(' SET ');
        SQL.Add(' ESTADO_REPAR = :ESTADO_REPAR ');
        SQL.Add(' WHERE ');
        SQL.Add(' IDCABREPARAR = :IDCABREPARAR ');
        Params.ByName['IDCABREPARAR'].AsInteger := QMCabRepararIDCABREPARAR.AsInteger;
        if Abrir then
           Params.ByName['ESTADO_REPAR'].AsInteger := 0
        else
           Params.ByName['ESTADO_REPAR'].AsInteger := 5;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
