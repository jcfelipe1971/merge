object DMHojaDeTrabajo: TDMHojaDeTrabajo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 382
  Top = 130
  Height = 363
  Width = 547
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 304
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 224
    Top = 8
  end
  object DSxAsignado: TDataSource
    DataSet = xAsignado
    Left = 136
    Top = 8
  end
  object xDisponible: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM PRO_VER_TAREAS_ABIERTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIES AND'
      'RIG_OF = :RIG_OF AND'
      'LINEA_FASE = :LINEA_FASE AND'
      'LINEA_TAREA = :LINEA_TAREA')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_VER_TAREAS_ABIERTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL'
      'ORDER BY EJERCICIO, SERIE, RIG_OF, LINEA_FASE, LINEA_TAREA')
    UniDirectional = False
    Left = 40
    Top = 104
    object xDisponibleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDisponibleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xDisponibleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xDisponibleRIG_OF: TIntegerField
      DisplayLabel = 'OF'
      FieldName = 'RIG_OF'
    end
    object xDisponibleLINEA_FASE: TIntegerField
      DisplayLabel = 'Lin. Fase'
      FieldName = 'LINEA_FASE'
    end
    object xDisponibleLINEA_TAREA: TIntegerField
      DisplayLabel = 'Lin. Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object xDisponibleRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object xDisponibleTITULO_RECURSO: TFIBStringField
      DisplayLabel = 'Tit. Recurso'
      FieldName = 'TITULO_RECURSO'
      Size = 40
    end
    object xDisponibleTIPO_RECURSO: TFIBStringField
      DisplayLabel = 'Tipo Recurso'
      FieldName = 'TIPO_RECURSO'
      Size = 3
    end
    object xDisponibleIDENTIFICADOR: TIntegerField
      DisplayLabel = 'Identificador'
      FieldName = 'IDENTIFICADOR'
    end
    object xDisponibleTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 60
    end
    object xDisponibleSITUACION: TIntegerField
      DisplayLabel = 'Situacion'
      FieldName = 'SITUACION'
    end
    object xDisponibleUNI_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pendientes'
      FieldName = 'UNI_PENDIENTES'
    end
    object xDisponibleCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object xDisponibleTITULO_COMPUESTO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_COMPUESTO'
      Size = 256
    end
    object xDisponibleID_ORDEN: TIntegerField
      DisplayLabel = 'Id Orden'
      FieldName = 'ID_ORDEN'
    end
    object xDisponibleTITULO_TAREA: TFIBStringField
      DisplayLabel = 'Titulo Tarea'
      FieldName = 'TITULO_TAREA'
      Size = 40
    end
    object xDisponibleTIPO_TAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPO_TAREA'
      Size = 3
    end
    object xDisponibleTIPO_FASE: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPO_FASE'
      Size = 3
    end
    object xDisponibleTITULO_FASE: TFIBStringField
      DisplayLabel = 'Titulo Fase'
      FieldName = 'TITULO_FASE'
      Size = 60
    end
    object xDisponibleSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
  end
  object DSxDisponible: TDataSource
    DataSet = xDisponible
    Left = 136
    Top = 104
  end
  object xAsignado: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_OPE_HOJAS_TRABAJO'
      'WHERE'
      '  ID_HOJA_TRABAJO=?old_ID_HOJA_TRABAJO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_OPE_HOJAS_TRABAJO'
      
        '  (ID_HOJA_TRABAJO,TIPO,EMPRESA,SECCION,EMPLEADO,ID_ORDEN,ID_DOC' +
        ',LINEA_FASE,LINEA_TAREA,FECHA_TRABAJO,PRIORIDAD,VISIBLE,FINALIZA' +
        'DO,ID_IMAGEN,FECHA_INI,FECHA_FIN,CANTIDAD,CANTIDAD_REALIZADA,CLI' +
        'ENTE,NOMBRE_R_SOCIAL,PEDIDO,ARTICULO,TITULO_ARTICULO,TIPOTAREA,T' +
        'ITULO_TAREA)'
      'VALUES'
      
        '  (?ID_HOJA_TRABAJO,?TIPO,?EMPRESA,?SECCION,?EMPLEADO,?ID_ORDEN,' +
        '?ID_DOC,?LINEA_FASE,?LINEA_TAREA,?FECHA_TRABAJO,?PRIORIDAD,?VISI' +
        'BLE,?FINALIZADO,?ID_IMAGEN,?FECHA_INI,?FECHA_FIN,?CANTIDAD,?CANT' +
        'IDAD_REALIZADA,?CLIENTE,?NOMBRE_R_SOCIAL,?PEDIDO,?ARTICULO,?TITU' +
        'LO_ARTICULO,?TIPOTAREA,?TITULO_TAREA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_OPE_HOJAS_TRABAJO'
      'WHERE'
      '  ID_HOJA_TRABAJO=?ID_HOJA_TRABAJO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_OPE_HOJAS_TRABAJO'
      'WHERE'
      'EMPRESA = ?EMPRESA '
      'ORDER BY PRIORIDAD')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_OPE_HOJAS_TRABAJO'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,TIPO=?TIPO'
      '  ,SECCION=?SECCION '
      '  ,EMPLEADO=?EMPLEADO '
      '  ,ID_ORDEN=?ID_ORDEN'
      '  ,ID_DOC=?ID_DOC '
      '  ,LINEA_FASE=?LINEA_FASE '
      '  ,LINEA_TAREA=?LINEA_TAREA '
      '  ,FECHA_TRABAJO=?FECHA_TRABAJO '
      '  ,PRIORIDAD=?PRIORIDAD '
      '  ,VISIBLE=?VISIBLE '
      '  ,ID_IMAGEN=?ID_IMAGEN '
      '  /*'
      '  FINALIZADO= FINALIZADO '
      '  ,FECHA_INI= FECHA_INI '
      '  ,FECHA_FIN= FECHA_FIN '
      '  */'
      '  ,CANTIDAD=?CANTIDAD '
      '  ,CANTIDAD_REALIZADA=?CANTIDAD_REALIZADA '
      '  ,CLIENTE=?CLIENTE '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,PEDIDO=?PEDIDO '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,TIPOTAREA=?TIPOTAREA'
      '  ,TITULO_TAREA=?TITULO_TAREA'
      'WHERE'
      '  ID_HOJA_TRABAJO=?ID_HOJA_TRABAJO ')
    AfterOpen = xAsignadoAfterOpen
    BeforeClose = xAsignadoBeforeClose
    BeforePost = xAsignadoBeforePost
    OnNewRecord = xAsignadoNewRecord
    ClavesPrimarias.Strings = (
      'ID_HOJA_TRABAJO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_OPE_HOJAS_TRABAJO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object xAsignadoID_HOJA_TRABAJO: TIntegerField
      DisplayLabel = 'Id Hoja Trab.'
      FieldName = 'ID_HOJA_TRABAJO'
    end
    object xAsignadoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xAsignadoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAsignadoSECCION: TFIBStringField
      DisplayLabel = 'Seccion'
      FieldName = 'SECCION'
      Size = 3
    end
    object xAsignadoEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object xAsignadoID_ORDEN: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_DOC'
    end
    object xAsignadoLINEA_FASE: TIntegerField
      DisplayLabel = 'Lin. Fase'
      FieldName = 'LINEA_FASE'
    end
    object xAsignadoLINEA_TAREA: TIntegerField
      DisplayLabel = 'Lin. Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object xAsignadoFECHA_TRABAJO: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_TRABAJO'
    end
    object xAsignadoPRIORIDAD: TIntegerField
      DisplayLabel = 'Prioridad'
      FieldName = 'PRIORIDAD'
    end
    object xAsignadoVISIBLE: TIntegerField
      DisplayLabel = 'Visible'
      FieldName = 'VISIBLE'
    end
    object xAsignadoFINALIZADO: TIntegerField
      DisplayLabel = 'Finalizado'
      FieldName = 'FINALIZADO'
    end
    object xAsignadoID_IMAGEN: TIntegerField
      DisplayLabel = 'Id Imagen'
      FieldName = 'ID_IMAGEN'
    end
    object xAsignadoFECHA_INI: TDateTimeField
      DisplayLabel = 'Fecha Ini.'
      FieldName = 'FECHA_INI'
    end
    object xAsignadoFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fecha Fin'
      FieldName = 'FECHA_FIN'
    end
    object xAsignadoCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xAsignadoCANTIDAD_REALIZADA: TFloatField
      DisplayLabel = 'Cant. Realizada'
      FieldName = 'CANTIDAD_REALIZADA'
    end
    object xAsignadoCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xAsignadoNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      ReadOnly = True
      Size = 60
    end
    object xAsignadoPEDIDO: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'PEDIDO'
      ReadOnly = True
    end
    object xAsignadoARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      ReadOnly = True
      Size = 15
    end
    object xAsignadoTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Titulo Articulo'
      FieldName = 'TITULO_ARTICULO'
      ReadOnly = True
      Size = 256
    end
    object xAsignadoTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      ReadOnly = True
      Size = 3
    end
    object xAsignadoTITULO_TAREA: TFIBStringField
      DisplayLabel = 'Titulo Tarea'
      FieldName = 'TITULO_TAREA'
      ReadOnly = True
      Size = 40
    end
    object xAsignadoID_ORDEN2: TIntegerField
      DisplayLabel = 'Id Orden'
      FieldName = 'ID_ORDEN'
    end
    object xAsignadoMAQUINA: TIntegerField
      DisplayLabel = 'M'#225'quina'
      FieldName = 'MAQUINA'
    end
    object QMAsignadoTIEMPO_PREVISTO: TFIBStringField
      DisplayLabel = 'T. Previsto'
      FieldName = 'TIEMPO_PREVISTO'
    end
    object QMAsignadoTIEMPO_REAL: TFIBStringField
      DisplayLabel = 'T. Real'
      FieldName = 'TIEMPO_REAL'
      Size = 18
    end
    object QMAsignadoUNIDADES_FAB: TFloatField
      DisplayLabel = 'Uni. Fab.'
      FieldName = 'UNIDADES_FAB'
    end
    object QMAsignadoUNIDADES_DEFECTUOSAS: TFloatField
      DisplayLabel = 'Uni. Def.'
      FieldName = 'UNIDADES_DEFECTUOSAS'
    end
    object QMAsignadoTOTAL_UNIDADES_FAB: TFloatField
      DisplayLabel = 'Total Uni. Fab.'
      FieldName = 'TOTAL_UNIDADES_FAB'
    end
    object QMAsignadoTOTAL_UNIDADES_DEFECTUOSAS: TFloatField
      DisplayLabel = 'Total Uni. Def.'
      FieldName = 'TOTAL_UNIDADES_DEFECTUOSAS'
    end
    object QMAsignadoTOTAL_UNIDADES_ORDEN: TFloatField
      DisplayLabel = 'Total Uni. Orden'
      FieldName = 'TOTAL_UNIDADES_ORDEN'
    end
  end
  object DSxAsignadoNotas: TDataSource
    DataSet = xAsignadoNotas
    Left = 136
    Top = 56
  end
  object xAsignadoNotas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  ID_HOJA_TRABAJO, NOTAS, COMENTARIO'
      'FROM OPE_HOJAS_TRABAJO'
      'WHERE'
      '  ID_HOJA_TRABAJO=?ID_HOJA_TRABAJO '
      '')
    SelectSQL.Strings = (
      'SELECT'
      '  ID_HOJA_TRABAJO, NOTAS, COMENTARIO'
      'FROM OPE_HOJAS_TRABAJO'
      'WHERE'
      '  ID_HOJA_TRABAJO=?ID_HOJA_TRABAJO ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_HOJAS_TRABAJO'
      'SET'
      '  NOTAS=?NOTAS '
      '  ,COMENTARIO=?COMENTARIO '
      'WHERE'
      '  ID_HOJA_TRABAJO=?ID_HOJA_TRABAJO ')
    DataSource = DSxAsignado
    ClavesPrimarias.Strings = (
      'ID_HOJA_TRABAJO ')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_HOJAS_TRABAJO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
  end
  object xPausas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM OPE_HOJAS_TRABAJO_PAUSAS'
      'WHERE'
      'ID_PAUSA_TRABAJO = :ID_PAUSA_TRABAJO')
    SelectSQL.Strings = (
      'SELECT * FROM OPE_HOJAS_TRABAJO_PAUSAS'
      'WHERE'
      'ID_HOJA_TRABAJO =:ID_HOJA_TRABAJO'
      'ORDER BY INICIO')
    UniDirectional = False
    DataSource = DSxAsignado
    Left = 40
    Top = 152
    object xPausasID_PAUSA_TRABAJO: TIntegerField
      DisplayLabel = 'Id Pausa'
      FieldName = 'ID_PAUSA_TRABAJO'
    end
    object xPausasID_HOJA_TRABAJO: TIntegerField
      DisplayLabel = 'Id Hoja Trabajo'
      FieldName = 'ID_HOJA_TRABAJO'
    end
    object xPausasINICIO: TDateTimeField
      DisplayLabel = 'Inicio'
      FieldName = 'INICIO'
    end
    object xPausasFINAL: TDateTimeField
      DisplayLabel = 'Final'
      FieldName = 'FINAL'
    end
    object xPausasCOMENTARIO: TMemoField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object xPausasTIPO_INCIDENCIA: TFIBStringField
      DisplayLabel = 'Tipo Incidencia'
      FieldName = 'TIPO_INCIDENCIA'
      Size = 3
    end
  end
  object DSxPausas: TDataSource
    DataSet = xPausas
    Left = 136
    Top = 152
  end
end
