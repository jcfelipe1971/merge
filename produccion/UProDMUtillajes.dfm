object ProDMUtillajes: TProDMUtillajes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 565
  Top = 276
  Height = 392
  Width = 508
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 272
    Top = 32
  end
  object QMProSysUtillajes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_SYS_UTILLAJES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_SYS_UTILLAJES'
      
        '  (EMPRESA,'#13#10'CODIGO,DESCRIPCION,IMAGEN,ARTICULO,TITULO_ART,GOLPE' +
        'S_ACUMULADOS,NOTAS,PROYECTO,TITULO_PROYECTO,BAJA,'#13#10'ACTIVO,CLIENT' +
        'E,NOMBRE_R_SOCIAL,NOMBRE_COMERCIAL)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?CODIGO,?DESCRIPCION,?IMAGEN,?ARTICULO,?TITULO_ART' +
        ',?GOLPES_ACUMULADOS,?NOTAS,?PROYECTO,?TITULO_PROYECTO,?BAJA,'#13#10'?A' +
        'CTIVO,?CLIENTE,?NOMBRE_R_SOCIAL,?NOMBRE_COMERCIAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_SYS_UTILLAJES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_SYS_UTILLAJES'
      'WHERE'
      '  EMPRESA = ?EMPRESA '
      'ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_SYS_UTILLAJES'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      '  ,IMAGEN=?IMAGEN '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ART=?TITULO_ART '
      '  ,GOLPES_ACUMULADOS=?GOLPES_ACUMULADOS '
      '  ,NOTAS=?NOTAS '
      '  ,PROYECTO=?PROYECTO '
      '  ,TITULO_PROYECTO=?TITULO_PROYECTO '
      '  ,BAJA=?BAJA '
      '  ,ACTIVO=?ACTIVO '
      '  ,CLIENTE=?CLIENTE '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,NOMBRE_COMERCIAL=?NOMBRE_COMERCIAL '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CODIGO=?CODIGO ')
    OnNewRecord = QMProSysUtillajesNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA'
      'CODIGO')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_SYS_UTILLAJES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 32
    object QMProSysUtillajesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProSysUtillajesCODIGO: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 10
    end
    object QMProSysUtillajesDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object QMProSysUtillajesIMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
    end
    object QMProSysUtillajesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMProSysUtillajesARTICULOChange
      Size = 15
    end
    object QMProSysUtillajesTITULO_ART: TFIBStringField
      DisplayLabel = 'Titulo Art.'
      FieldName = 'TITULO_ART'
      Size = 256
    end
    object QMProSysUtillajesGOLPES_ACUMULADOS: TIntegerField
      DisplayLabel = 'Golpes Acum.'
      FieldName = 'GOLPES_ACUMULADOS'
    end
    object QMProSysUtillajesNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMProSysUtillajesPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
      OnChange = QMProSysUtillajesPROYECTOChange
    end
    object QMProSysUtillajesTITULO_PROYECTO: TFIBStringField
      DisplayLabel = 'Titulo Proyecto'
      FieldName = 'TITULO_PROYECTO'
      Size = 60
    end
    object QMProSysUtillajesBAJA: TIntegerField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMProSysUtillajesACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMProSysUtillajesCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      OnChange = QMProSysUtillajesCLIENTEChange
    end
    object QMProSysUtillajesNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Razon Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMProSysUtillajesNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMProSysUtillajesCOMPUESTO_ORDEN: TFIBStringField
      DisplayLabel = 'Compuesto Ord,.'
      FieldName = 'COMPUESTO_ORDEN'
      Size = 15
    end
    object QMProSysUtillajesFECHA_INI_ORDEN: TDateTimeField
      DisplayLabel = 'Fec. Ini. Ord.'
      FieldName = 'FECHA_INI_ORDEN'
    end
    object QMProSysUtillajesFECHA_FIN_ORDEN: TDateTimeField
      DisplayLabel = 'Fec. Fin Ord.'
      FieldName = 'FECHA_FIN_ORDEN'
    end
  end
  object DSQMProSysUtillajes: TDataSource
    DataSet = QMProSysUtillajes
    Left = 152
    Top = 32
  end
  object QUtilizacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    RefreshSQL.Strings = (
      'SELECT O.*, T.*'
      'FROM PRO_ORD_TAREA T'
      'JOIN PRO_ORD O ON T.ID_ORDEN = O.ID_ORDEN'
      'WHERE'
      'T.EMPRESA = :EMPRESA AND'
      'T.ID_UTILLAJE = :CODIGO AND'
      'T.ID_ORDEN = :ID_ORDEN')
    SelectSQL.Strings = (
      'SELECT O.*, T.*'
      'FROM PRO_ORD_TAREA T'
      'JOIN PRO_ORD O ON T.ID_ORDEN = O.ID_ORDEN'
      'WHERE'
      'T.EMPRESA = :EMPRESA AND'
      'T.ID_UTILLAJE = :CODIGO'
      'ORDER BY O.FECHA_ORD DESC, O.ID_ORDEN DESC')
    UniDirectional = False
    DataSource = DSQMProSysUtillajes
    Left = 40
    Top = 80
    object QUtilizacionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QUtilizacionEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
    end
    object QUtilizacionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QUtilizacionSERIES: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIES'
      Size = 10
    end
    object QUtilizacionRIG_OF: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'RIG_OF'
    end
    object QUtilizacionSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object QUtilizacionALMACEN_SAL: TFIBStringField
      DisplayLabel = 'Alm. Sal.'
      FieldName = 'ALMACEN_SAL'
      Size = 3
    end
    object QUtilizacionALMACEN_LAN: TFIBStringField
      DisplayLabel = 'Alm. Lan.'
      FieldName = 'ALMACEN_LAN'
      Size = 3
    end
    object QUtilizacionALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Alm. Ent.'
      FieldName = 'ALMACEN_ENT'
      Size = 3
    end
    object QUtilizacionFECHA_ORD: TDateTimeField
      DisplayLabel = 'Fec. Ord.'
      FieldName = 'FECHA_ORD'
    end
    object QUtilizacionCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QUtilizacionCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object QUtilizacionESCANDALLO: TIntegerField
      DisplayLabel = 'Esc.'
      FieldName = 'ESCANDALLO'
    end
    object QUtilizacionESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QUtilizacionPEDIDO: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'PEDIDO'
    end
    object QUtilizacionLINEA_PED: TIntegerField
      DisplayLabel = 'Lin. Ped.'
      FieldName = 'LINEA_PED'
    end
    object QUtilizacionFECHA_PED: TDateTimeField
      DisplayLabel = 'Fec. Ped.'
      FieldName = 'FECHA_PED'
    end
    object QUtilizacionUNI_PEDID: TFloatField
      DisplayLabel = 'Uds. Ped.'
      FieldName = 'UNI_PEDID'
    end
    object QUtilizacionUNI_MANUAL: TFloatField
      DisplayLabel = 'Uds. Manual'
      FieldName = 'UNI_MANUAL'
    end
    object QUtilizacionUNI_TOTAL: TFloatField
      DisplayLabel = 'Uds. Total'
      FieldName = 'UNI_TOTAL'
    end
    object QUtilizacionPRIORIDAD: TIntegerField
      DisplayLabel = 'Prioridad'
      FieldName = 'PRIORIDAD'
    end
    object QUtilizacionMERMA: TFloatField
      DisplayLabel = 'Merma'
      FieldName = 'MERMA'
    end
    object QUtilizacionUNI_PRODUC: TFloatField
      DisplayLabel = 'Uds. Prod.'
      FieldName = 'UNI_PRODUC'
    end
    object QUtilizacionUNI_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'UNI_PENDIENTES'
    end
    object QUtilizacionFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fec. Entrega'
      FieldName = 'FECHA_ENTREGA'
    end
    object QUtilizacionFECHA_INI: TDateTimeField
      DisplayLabel = 'Fec. Ini.'
      FieldName = 'FECHA_INI'
    end
    object QUtilizacionFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fec. fin'
      FieldName = 'FECHA_FIN'
    end
    object QUtilizacionHORAS_TOTALES: TFloatField
      DisplayLabel = 'Horas Totales'
      FieldName = 'HORAS_TOTALES'
    end
    object QUtilizacionSITUACION: TIntegerField
      DisplayLabel = 'Situacion'
      FieldName = 'SITUACION'
    end
    object QUtilizacionID_ORDEN: TIntegerField
      DisplayLabel = 'Id Orden'
      FieldName = 'ID_ORDEN'
    end
    object QUtilizacionTIPO_LANZAMIENTO: TIntegerField
      DisplayLabel = 'Tipo Lanz.'
      FieldName = 'TIPO_LANZAMIENTO'
    end
    object QUtilizacionID_ORDEN_MAT: TIntegerField
      DisplayLabel = 'Id. Ord. Mat.'
      FieldName = 'ID_ORDEN_MAT'
    end
    object QUtilizacionTIPO_RESERVA: TIntegerField
      DisplayLabel = 'Tipo Reserva'
      FieldName = 'TIPO_RESERVA'
    end
    object QUtilizacionID_MOV_STOCK: TIntegerField
      DisplayLabel = 'Id Mov. Stock'
      FieldName = 'ID_MOV_STOCK'
    end
    object QUtilizacionISO_APROBADO: TIntegerField
      DisplayLabel = 'ISO Aprob.'
      FieldName = 'ISO_APROBADO'
    end
    object QUtilizacionISO_VERIFICADO: TIntegerField
      DisplayLabel = 'ISO Verif.'
      FieldName = 'ISO_VERIFICADO'
    end
    object QUtilizacionISO_VALIDADO: TIntegerField
      DisplayLabel = 'ISO Valid.'
      FieldName = 'ISO_VALIDADO'
    end
    object QUtilizacionCONT_SUBORDEN: TIntegerField
      FieldName = 'CONT_SUBORDEN'
    end
    object QUtilizacionREFERENCIA: TFIBStringField
      DisplayLabel = 'Ref.'
      FieldName = 'REFERENCIA'
      Size = 40
    end
    object QUtilizacionHORAS_OPERARIO: TFloatField
      DisplayLabel = 'Horas Oper.'
      FieldName = 'HORAS_OPERARIO'
    end
    object QUtilizacionHORAS_MAQUINA: TFloatField
      DisplayLabel = 'Horas Maq.'
      FieldName = 'HORAS_MAQUINA'
    end
    object QUtilizacionTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 60
    end
    object QUtilizacionORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QUtilizacionTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      Size = 3
    end
    object QUtilizacionCOMENTARIO: TMemoField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object QUtilizacionRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object QUtilizacionCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QUtilizacionARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QUtilizacionFECHA_FIN_TAREA: TDateTimeField
      DisplayLabel = 'Fec. Fin Tarea'
      FieldName = 'FECHA_FIN_TAREA'
    end
    object QUtilizacionIDENTIFICADOR: TIntegerField
      DisplayLabel = 'Identif.'
      FieldName = 'IDENTIFICADOR'
    end
    object QUtilizacionCANTIDAD_UTIL: TFloatField
      DisplayLabel = 'Cant. Util'
      FieldName = 'CANTIDAD_UTIL'
    end
    object QUtilizacionTIEMPO: TFloatField
      DisplayLabel = 'Tiempo'
      FieldName = 'TIEMPO'
    end
    object QUtilizacionTIEMPO_UTIL: TFloatField
      DisplayLabel = 'Tiempo Util'
      FieldName = 'TIEMPO_UTIL'
    end
    object QUtilizacionUDS_FABRICADAS: TFloatField
      DisplayLabel = 'Uds. Fab.'
      FieldName = 'UDS_FABRICADAS'
    end
    object QUtilizacionCANTIDAD_IMPUTADA: TFloatField
      DisplayLabel = 'Cant. Imputada'
      FieldName = 'CANTIDAD_IMPUTADA'
    end
    object QUtilizacionTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object QUtilizacionTOTAL_HORAS: TFloatField
      DisplayLabel = 'Total Horas'
      FieldName = 'TOTAL_HORAS'
    end
    object QUtilizacionMAQUINA: TIntegerField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
    end
    object QUtilizacionTIEMPO_PRODUCCION: TFIBStringField
      DisplayLabel = 'Tiempo Prod.'
      FieldName = 'TIEMPO_PRODUCCION'
    end
    object QUtilizacionFECHA_INICIO_TAREA: TDateTimeField
      DisplayLabel = 'Fec. Ini. Tarea'
      FieldName = 'FECHA_INICIO_TAREA'
    end
  end
  object DSUtilizacion: TDataSource
    DataSet = QUtilizacion
    Left = 152
    Top = 80
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 272
    Top = 80
  end
  object QMIntervencion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_UTILLAJES_INTERV'
      'WHERE'
      '  ID_INTERVENCION=?old_ID_INTERVENCION ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_UTILLAJES_INTERV'
      
        '  (ID_INTERVENCION,EMPRESA,CODIGO,CODMAQ,FECHA,DESCRIPCION_AVERI' +
        'A,MATRICERO,INICIO_REPARACION,FINAL_REPARACION,DESCRIPCION_INTER' +
        'VENCION,FECHA_CALIDAD,VERIFICADOR,CONFORMIDAD)'
      'VALUES'
      
        '  (?ID_INTERVENCION,?EMPRESA,?CODIGO,?CODMAQ,?FECHA,?DESCRIPCION' +
        '_AVERIA,?MATRICERO,?INICIO_REPARACION,?FINAL_REPARACION,?DESCRIP' +
        'CION_INTERVENCION,?FECHA_CALIDAD,?VERIFICADOR,?CONFORMIDAD)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_UTILLAJES_INTERV'
      'WHERE'
      '  ID_INTERVENCION=?ID_INTERVENCION ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_UTILLAJES_INTERV'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CODIGO = :CODIGO'
      'ORDER BY ID_INTERVENCION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_UTILLAJES_INTERV'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,CODIGO=?CODIGO '
      '  ,CODMAQ=?CODMAQ '
      '  ,FECHA=?FECHA '
      '  ,DESCRIPCION_AVERIA=?DESCRIPCION_AVERIA '
      '  ,MATRICERO=?MATRICERO '
      '  ,INICIO_REPARACION=?INICIO_REPARACION '
      '  ,FINAL_REPARACION=?FINAL_REPARACION '
      '  ,DESCRIPCION_INTERVENCION=?DESCRIPCION_INTERVENCION '
      '  ,FECHA_CALIDAD=?FECHA_CALIDAD '
      '  ,VERIFICADOR=?VERIFICADOR '
      '  ,CONFORMIDAD=?CONFORMIDAD '
      'WHERE'
      '  ID_INTERVENCION=?ID_INTERVENCION ')
    DataSource = DSQMProSysUtillajes
    BeforePost = QMIntervencionBeforePost
    OnNewRecord = QMIntervencionNewRecord
    ClavesPrimarias.Strings = (
      'ID_INTERVENCION ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_UTILLAJES_INTERV'
    CamposBloqueo.Strings = (
      'CODIGO')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 128
    object QMIntervencionID_INTERVENCION: TIntegerField
      DisplayLabel = 'Interv.'
      FieldName = 'ID_INTERVENCION'
    end
    object QMIntervencionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMIntervencionCODIGO: TFIBStringField
      DisplayLabel = 'Utillaje'
      FieldName = 'CODIGO'
      Size = 10
    end
    object QMIntervencionCODMAQ: TIntegerField
      DisplayLabel = 'Maquina'
      FieldName = 'CODMAQ'
    end
    object QMIntervencionFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMIntervencionDESCRIPCION_AVERIA: TFIBStringField
      DisplayLabel = 'Descrip. Averia'
      FieldName = 'DESCRIPCION_AVERIA'
      Size = 256
    end
    object QMIntervencionMATRICERO: TIntegerField
      DisplayLabel = 'Matricero'
      FieldName = 'MATRICERO'
    end
    object QMIntervencionINICIO_REPARACION: TDateTimeField
      DisplayLabel = 'Inicio Repar.'
      FieldName = 'INICIO_REPARACION'
    end
    object QMIntervencionFINAL_REPARACION: TDateTimeField
      DisplayLabel = 'Final Repar.'
      FieldName = 'FINAL_REPARACION'
    end
    object QMIntervencionDESCRIPCION_INTERVENCION: TFIBStringField
      DisplayLabel = 'Descrip. Intervencion'
      FieldName = 'DESCRIPCION_INTERVENCION'
      Size = 256
    end
    object QMIntervencionFECHA_CALIDAD: TDateTimeField
      DisplayLabel = 'Fecha Calidad'
      FieldName = 'FECHA_CALIDAD'
    end
    object QMIntervencionVERIFICADOR: TIntegerField
      DisplayLabel = 'Verificador'
      FieldName = 'VERIFICADOR'
    end
    object QMIntervencionCONFORMIDAD: TIntegerField
      DisplayLabel = 'Conformidad'
      FieldName = 'CONFORMIDAD'
    end
  end
  object DSQMIntervencion: TDataSource
    DataSet = QMIntervencion
    Left = 152
    Top = 128
  end
end
