object ProDMMarcajesTe: TProDMMarcajesTe
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 674
  Top = 109
  Height = 522
  Width = 584
  object QMProCabMarca: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_CAB_MARCA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_CAB_MARCA'
      
        '  (FECHA,SERIE,RIG,TIEMPO_TOT,RIG_OFF,ID_ORDEN,EMPRESA,EJERCICIO' +
        ',CANAL,OPERARIO,MAQUINA,PROVEEDOR,TIPO,VARIOS,TIPOFASE)'
      'VALUES'
      
        '  (?FECHA,?SERIE,?RIG,?TIEMPO_TOT,?RIG_OFF,?ID_ORDEN,?EMPRESA,?E' +
        'JERCICIO,?CANAL,?OPERARIO,?MAQUINA,?PROVEEDOR,?TIPO,?VARIOS,?TIP' +
        'OFASE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_CAB_MARCA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_ORD_CAB_MARCA'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'SERIE = ?SERIE AND'
      'TIPO = ?TIPO'
      'ORDER BY FECHA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_CAB_MARCA'
      'SET'
      '  FECHA=?FECHA '
      '  ,TIEMPO_TOT=?TIEMPO_TOT '
      '  ,RIG_OFF=?RIG_OFF '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,OPERARIO=?OPERARIO '
      '  ,MAQUINA=?MAQUINA '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,VARIOS=?VARIOS '
      '  ,TIPOFASE=?TIPOFASE '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    Plan.Strings = (
      ' ')
    AfterDelete = Graba
    AfterOpen = QMProCabMarcaAfterOpen
    AfterPost = Graba
    BeforeClose = QMProCabMarcaBeforeClose
    OnNewRecord = QMProCabMarcaNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_CAB_MARCA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 8
    object QMProCabMarcaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProCabMarcaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProCabMarcaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProCabMarcaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMProCabMarcaTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMProCabMarcaRIG: TIntegerField
      DisplayLabel = 'Rig'
      FieldName = 'RIG'
    end
    object QMProCabMarcaOPERARIO: TIntegerField
      DisplayLabel = 'Operario'
      FieldName = 'OPERARIO'
    end
    object QMProCabMarcaMAQUINA: TIntegerField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
    end
    object QMProCabMarcaPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
      OnChange = QMProCabMarcaPROVEEDORChange
    end
    object QMProCabMarcaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMProCabMarcaTIEMPO_TOT: TFloatField
      DisplayLabel = 'T.Tiempo'
      FieldName = 'TIEMPO_TOT'
      EditFormat = '!90:00;1;_'
    end
    object QMProCabMarcaRIG_OFF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OFF'
    end
    object QMProCabMarcaDESC_PROVEEDOR: TStringField
      DisplayLabel = 'Desc. Proveedor'
      FieldKind = fkCalculated
      FieldName = 'DESC_PROVEEDOR'
      OnGetText = QMProCabMarcaDESC_PROVEEDORGetText
      Size = 60
      Calculated = True
    end
    object QMProCabMarcaVARIOS: TFIBStringField
      DisplayLabel = 'Varios'
      FieldName = 'VARIOS'
      Size = 3
    end
    object QMProCabMarcaID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMProCabMarcaTIPOFASE: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPOFASE'
      Size = 3
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 296
    Top = 8
  end
  object DSQMProCabMarca: TDataSource
    DataSet = QMProCabMarca
    Left = 136
    Top = 8
  end
  object QMProDetMarca: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_DET_MARCA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_DET_MARCA'
      
        '  (FECHA_PREV,FECHA_REAL,PRECIO_RECURSO,UNIDADES_FAB,UNIDADES_DE' +
        'FEC,NOTAS,TOTAL_RECURSO,CANTIDAD,CANTIDAD_RECHAZADA,FECHA_DET,TI' +
        'EMPO_DEC,SERIE,RIG,RIG_OF,SUBORDEN,HORA_INICIO,HORA_FIN,TIEMPO,I' +
        'DTAREA,ID_ORDEN,ENTRADA,MARCAJE_DIRECTO_BD,HORAS_NO_PRODUCTIVAS,' +
        'TIPO_DEFECTO,EMPRESA,EJERCICIO,CANAL,LINEA,LINEA_FASE,LINEA_TARE' +
        'A,NUM_REF_SAL,ESTADO,NUEVA_TAREA,NO_PRODUCTIVA,TIPO,RECURSO,TIPO' +
        '_RECURSO,IMPUTACION,TIPOFASE,TIPOTAREA,TIPO_MARCAJE,MOTIVO,TURNO' +
        ',CAUSA)'
      'VALUES'
      
        '  (?FECHA_PREV,?FECHA_REAL,?PRECIO_RECURSO,?UNIDADES_FAB,?UNIDAD' +
        'ES_DEFEC,?NOTAS,?TOTAL_RECURSO,?CANTIDAD,?CANTIDAD_RECHAZADA,?FE' +
        'CHA_DET,?TIEMPO_DEC,?SERIE,?RIG,?RIG_OF,?SUBORDEN,?HORA_INICIO,?' +
        'HORA_FIN,?TIEMPO,?IDTAREA,?ID_ORDEN,?ENTRADA,?MARCAJE_DIRECTO_BD' +
        ',?HORAS_NO_PRODUCTIVAS,?TIPO_DEFECTO,?EMPRESA,?EJERCICIO,?CANAL,' +
        '?LINEA,?LINEA_FASE,?LINEA_TAREA,?NUM_REF_SAL,?ESTADO,?NUEVA_TARE' +
        'A,?NO_PRODUCTIVA,?TIPO,?RECURSO,?TIPO_RECURSO,?IMPUTACION,?TIPOF' +
        'ASE,?TIPOTAREA,?TIPO_MARCAJE,?MOTIVO,?TURNO,?CAUSA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_DET_MARCA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_DET_MARCA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG '
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_DET_MARCA'
      'SET'
      '  FECHA_PREV=?FECHA_PREV '
      '  ,FECHA_REAL=?FECHA_REAL '
      '  ,PRECIO_RECURSO=?PRECIO_RECURSO '
      '  ,UNIDADES_FAB=?UNIDADES_FAB '
      '  ,UNIDADES_DEFECTUOSAS=?UNIDADES_DEFECTUOSAS '
      '  ,NOTAS=?NOTAS '
      '  ,TOTAL_RECURSO=?TOTAL_RECURSO '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,CANTIDAD_RECHAZADA=?CANTIDAD_RECHAZADA '
      '  ,FECHA_DET=?FECHA_DET '
      '  ,TIEMPO_DEC=?TIEMPO_DEC '
      '  ,RIG_OF=?RIG_OF '
      '  ,SUBORDEN=?SUBORDEN '
      '  ,HORA_INICIO=?HORA_INICIO '
      '  ,HORA_FIN=?HORA_FIN '
      '  ,TIEMPO=?TIEMPO '
      '  ,IDTAREA=?IDTAREA '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,ENTRADA=?ENTRADA '
      '  ,MARCAJE_DIRECTO_BD=?MARCAJE_DIRECTO_BD '
      '  ,HORAS_NO_PRODUCTIVAS=?HORAS_NO_PRODUCTIVAS '
      '  ,TIPO_DEFECTO=?TIPO_DEFECTO '
      '  ,LINEA_FASE=?LINEA_FASE '
      '  ,LINEA_TAREA=?LINEA_TAREA '
      '  ,NUM_REF_SAL=?NUM_REF_SAL '
      '  ,ESTADO=?ESTADO '
      '  ,NUEVA_TAREA=?NUEVA_TAREA '
      '  ,NO_PRODUCTIVA=?NO_PRODUCTIVA '
      '  ,RECURSO=?RECURSO '
      '  ,TIPO_RECURSO=?TIPO_RECURSO '
      '  ,IMPUTACION=?IMPUTACION '
      '  ,TIPOFASE=?TIPOFASE '
      '  ,TIPOTAREA=?TIPOTAREA '
      '  ,TIPO_MARCAJE=?TIPO_MARCAJE '
      '  ,MOTIVO=?MOTIVO '
      '  ,TURNO=?TURNO '
      '  ,CAUSA=?CAUSA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMProCabMarca
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMProDetMarcaNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_DET_MARCA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 56
    object QMProDetMarcaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProDetMarcaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProDetMarcaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProDetMarcaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMProDetMarcaTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMProDetMarcaRIG: TIntegerField
      DisplayLabel = 'Rig'
      FieldName = 'RIG'
    end
    object QMProDetMarcaLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMProDetMarcaRIG_OF: TIntegerField
      DisplayLabel = 'Rig_of'
      FieldName = 'RIG_OF'
      OnChange = QMProDetMarcaRIG_OFChange
    end
    object QMProDetMarcaSUBORDEN: TIntegerField
      DisplayLabel = 'SubOrden'
      FieldName = 'SUBORDEN'
    end
    object QMProDetMarcaLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
      OnChange = QMProDetMarcaLINEA_FASEChange
    end
    object QMProDetMarcaLINEA_TAREA: TIntegerField
      DisplayLabel = 'Linea Tarea'
      FieldName = 'LINEA_TAREA'
      OnChange = QMProDetMarcaLINEA_TAREAChange
    end
    object QMProDetMarcaFECHA_PREV: TDateTimeField
      DisplayLabel = 'Fecha Prevista'
      FieldName = 'FECHA_PREV'
    end
    object QMProDetMarcaFECHA_REAL: TDateTimeField
      DisplayLabel = 'Fecha Real'
      FieldName = 'FECHA_REAL'
    end
    object QMProDetMarcaNUM_REF_SAL: TIntegerField
      DisplayLabel = 'Ref. Salida'
      FieldName = 'NUM_REF_SAL'
    end
    object QMProDetMarcaHORA_INICIO: TFloatField
      DisplayLabel = 'Hora Inicio'
      FieldName = 'HORA_INICIO'
      EditFormat = '!00:00;1;_'
    end
    object QMProDetMarcaHORA_FIN: TFloatField
      DisplayLabel = 'Hora Fin'
      FieldName = 'HORA_FIN'
      EditFormat = '!00:00;1;_'
    end
    object QMProDetMarcaTIEMPO: TFloatField
      DisplayLabel = 'Tiempo'
      FieldName = 'TIEMPO'
      EditFormat = '!00:00;1;_'
    end
    object QMProDetMarcaRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      OnChange = QMProDetMarcaRECURSOChange
      Size = 5
    end
    object QMProDetMarcaPRECIO_RECURSO: TFloatField
      DisplayLabel = 'Precio Rec.'
      FieldName = 'PRECIO_RECURSO'
      OnChange = QMProDetMarcaPRECIO_RECURSOChange
    end
    object QMProDetMarcaUNIDADES_FAB: TFloatField
      DisplayLabel = 'Uds. Fabricadas'
      FieldName = 'UNIDADES_FAB'
    end
    object QMProDetMarcaUNIDADES_DEFECTUOSAS: TFloatField
      DisplayLabel = 'Unid. Defectuosas'
      FieldName = 'UNIDADES_DEFECTUOSAS'
    end
    object QMProDetMarcaESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMProDetMarcaNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMProDetMarcaTOTAL_RECURSO: TFloatField
      DisplayLabel = 'Total Recurso'
      FieldName = 'TOTAL_RECURSO'
    end
    object QMProDetMarcaDescripFase: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescripFase'
      OnGetText = QMProDetMarcaDescripFaseGetText
      Size = 60
      Calculated = True
    end
    object QMProDetMarcaDescripTarea: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescripTarea'
      OnGetText = QMProDetMarcaDescripTareaGetText
      Size = 60
      Calculated = True
    end
    object QMProDetMarcaDescripRec: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescripRec'
      OnGetText = QMProDetMarcaDescripRecGetText
      Size = 60
      Calculated = True
    end
    object QMProDetMarcaIDTAREA: TIntegerField
      DisplayLabel = 'Id.'
      FieldName = 'IDTAREA'
    end
    object QMProDetMarcaTIPO_RECURSO: TFIBStringField
      DisplayLabel = 'Tipo Recurso'
      FieldName = 'TIPO_RECURSO'
      Size = 5
    end
    object QMProDetMarcaTIEMPO_DEC: TFloatField
      DisplayLabel = 'Tiempo Dec.'
      FieldName = 'TIEMPO_DEC'
      OnChange = QMProDetMarcaTIEMPO_DECChange
    end
    object QMProDetMarcaTIPO_MARCAJE: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_MARCAJE'
      Size = 3
    end
    object QMProDetMarcaIMPUTACION: TFIBStringField
      DisplayLabel = 'Imputacion'
      FieldName = 'IMPUTACION'
      Size = 3
    end
    object QMProDetMarcaTIPOFASE: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPOFASE'
      Size = 3
    end
    object QMProDetMarcaTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      Size = 3
    end
    object QMProDetMarcaNUEVA_TAREA: TIntegerField
      DisplayLabel = 'Nueva Tarea'
      FieldName = 'NUEVA_TAREA'
    end
    object QMProDetMarcaENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMProDetMarcaCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMProDetMarcaID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
      OnChange = QMProDetMarcaID_ORDENChange
    end
  end
  object DSQMProDetMarca: TDataSource
    DataSet = QMProDetMarca
    Left = 136
    Top = 56
  end
  object DSxTituloFase: TDataSource
    DataSet = xTituloFase
    Left = 136
    Top = 152
  end
  object xTarea: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select Tarea'
      'From Pro_Ord_Tarea'
      'Where ((Linea_Tarea=?Linea_Tarea) and'
      '             (Rig_Of=?Rig_Of))')
    UniDirectional = False
    DataSource = DSQMProDetMarca
    Left = 32
    Top = 200
    object xTareaTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 60
    end
  end
  object DSxTarea: TDataSource
    DataSet = xTarea
    Left = 136
    Top = 200
  end
  object xTituloFase: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select Fase'
      'From Pro_Ord_Fases'
      'Where ((Linea_Fase=?Linea_Fase) and'
      '             (Rig_Of=?Rig_Of))')
    UniDirectional = False
    DataSource = DSQMProDetMarca
    Left = 32
    Top = 152
    object xTituloFaseFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 60
    end
  end
  object xSubOrden: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select SubOrden From Pro_Ord'
      'Where Empresa=:Empresa and'
      '            Ejercicio=:Ejericio and'
      '           Canal=:Canal and'
      '           Series=:Serie and'
      '           Rig_Of=:RIG_OF')
    UniDirectional = False
    Left = 32
    Top = 296
    object xSubOrdenSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
  end
  object DSxSubOrden: TDataSource
    DataSet = xSubOrden
    Left = 136
    Top = 296
  end
  object xDatosTarea: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    UniDirectional = False
    Left = 32
    Top = 248
    object xDatosTareaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDatosTareaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xDatosTareaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xDatosTareaSERIES: TFIBStringField
      DisplayLabel = 'Series'
      FieldName = 'SERIES'
      Size = 10
    end
    object xDatosTareaRIG_OF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OF'
    end
    object xDatosTareaSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object xDatosTareaLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object xDatosTareaLINEA_TAREA: TIntegerField
      DisplayLabel = 'Linea Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object xDatosTareaTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 60
    end
    object xDatosTareaORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xDatosTareaTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      Size = 3
    end
    object xDatosTareaCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object xDatosTareaRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 3
    end
    object xDatosTareaCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xDatosTareaPRE_COS_UNI_PRE: TFloatField
      DisplayLabel = 'Coste Unit. Previsto'
      FieldName = 'PRE_COS_UNI_PRE'
    end
    object xDatosTareaTOTAL_VAR_PRE: TFloatField
      DisplayLabel = 'Total Var. Previsto'
      FieldName = 'TOTAL_VAR_PRE'
    end
    object xDatosTareaPRECIO_FIJO_PRE: TFloatField
      DisplayLabel = 'Precio Fijo Previsto'
      FieldName = 'PRECIO_FIJO_PRE'
    end
    object xDatosTareaTOTAL_PRE: TFloatField
      DisplayLabel = 'Total Previsto Horas'
      FieldName = 'TOTAL_PRE'
    end
    object xDatosTareaPRE_COS_UNI_REAL: TFloatField
      DisplayLabel = 'Coste Unit. Real'
      FieldName = 'PRE_COS_UNI_REAL'
    end
    object xDatosTareaTOTAL_VAR_REAL: TFloatField
      DisplayLabel = 'Total Var. Real'
      FieldName = 'TOTAL_VAR_REAL'
    end
    object xDatosTareaPRECIO_FIJO_REAL: TFloatField
      DisplayLabel = 'Precio Fijo Real'
      FieldName = 'PRECIO_FIJO_REAL'
    end
    object xDatosTareaTOTAL_REAL: TFloatField
      DisplayLabel = 'Total Real'
      FieldName = 'TOTAL_REAL'
    end
    object xDatosTareaESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xDatosTareaIDENTIFICADOR: TIntegerField
      DisplayLabel = 'Identificador'
      FieldName = 'IDENTIFICADOR'
    end
    object xDatosTareaID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
  end
  object DSxDatosTarea: TDataSource
    DataSet = xDatosTarea
    Left = 136
    Top = 248
  end
  object xInfoActualizada: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  TIEMPO_TOT'
      'FROM PRO_ORD_CAB_MARCA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND'
      '  RIG=?RIG')
    SelectSQL.Strings = (
      'SELECT'
      '  TIEMPO_TOT'
      'FROM PRO_ORD_CAB_MARCA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND'
      '  RIG=?RIG')
    UniDirectional = False
    DataSource = DSQMProCabMarca
    Left = 32
    Top = 104
    object xInfoActualizadaTIEMPO_TOT: TFloatField
      DisplayLabel = 'Tiempo Total'
      FieldName = 'TIEMPO_TOT'
    end
  end
  object DSxInfoActualizada: TDataSource
    DataSet = xInfoActualizada
    Left = 136
    Top = 104
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 360
    Top = 8
  end
end
