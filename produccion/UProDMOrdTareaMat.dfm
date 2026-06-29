object ProDMOrdTareaMat: TProDMOrdTareaMat
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 469
  Top = 188
  Height = 273
  Width = 433
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 288
    Top = 8
  end
  object QMTareaMatCab: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_TAREA_MAT_CAB'
      'WHERE'
      '  ID_TAREA=?old_ID_TAREA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_TAREA_MAT_CAB'
      '  (ID_TAREA,FECHA,ID_ORDEN,TIPOFASE,EMPRESA)'
      'VALUES'
      '  (?ID_TAREA,?FECHA,?ID_ORDEN,?TIPOFASE,?EMPRESA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_TAREA_MAT_CAB'
      'WHERE'
      '  ID_TAREA=?ID_TAREA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ORD_TAREA_MAT_CAB'
      'where empresa=?empresa')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_TAREA_MAT_CAB'
      'SET'
      '  FECHA=?FECHA '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,TIPOFASE=?TIPOFASE '
      '  ,EMPRESA=?EMPRESA '
      'WHERE'
      '  ID_TAREA=?ID_TAREA')
    AfterOpen = QMTareaMatCabAfterOpen
    AfterScroll = QMTareaMatCabAfterScroll
    BeforeClose = QMTareaMatCabBeforeClose
    OnNewRecord = QMTareaMatCabNewRecord
    ClavesPrimarias.Strings = (
      'ID_TAREA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_TAREA_MAT_CAB'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 8
    object QMTareaMatCabID_TAREA: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_TAREA'
      OnChange = QMTareaMatCabID_TAREAChange
    end
    object QMTareaMatCabFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMTareaMatCabID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
      OnChange = QMTareaMatCabID_ORDENChange
    end
    object QMTareaMatCabTIPOFASE: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPOFASE'
      Size = 3
    end
    object QMTareaMatCabEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTareaMatCabDescFase: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescFase'
      Size = 60
      Calculated = True
    end
  end
  object QMTareaMatDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_TAREA_MAT_DET'
      'WHERE'
      '  ID_TAREA=?old_ID_TAREA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_TAREA_MAT_DET'
      '  (ID_TAREA,LINEA,FECHA,OPERARIO,ARTICULO,CANTIDAD,EMPRESA)'
      'VALUES'
      
        '  (?ID_TAREA,?LINEA,?FECHA,?OPERARIO,?ARTICULO,?CANTIDAD,?EMPRES' +
        'A)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_TAREA_MAT_DET'
      'WHERE'
      '  ID_TAREA=?ID_TAREA AND LINEA=?LINEA')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ORD_TAREA_MAT_DET'
      'where id_tarea=?id_tarea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_TAREA_MAT_DET'
      'SET'
      '  LINEA=?LINEA '
      '  ,FECHA=?FECHA '
      '  ,OPERARIO=?OPERARIO '
      '  ,ARTICULO=?ARTICULO '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,EMPRESA=?EMPRESA '
      'WHERE'
      '  ID_TAREA=?ID_TAREA and  LINEA=?LINEA')
    DataSource = DSTareaMatCab
    BeforePost = QMTareaMatDetBeforePost
    OnNewRecord = QMTareaMatDetNewRecord
    ClavesPrimarias.Strings = (
      'ID_TAREA '
      'LINEA'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_TAREA_MAT_DET'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 56
    object QMTareaMatDetID_TAREA: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_TAREA'
    end
    object QMTareaMatDetLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMTareaMatDetFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMTareaMatDetOPERARIO: TIntegerField
      DisplayLabel = 'Operario'
      FieldName = 'OPERARIO'
      OnChange = QMTareaMatDetOPERARIOChange
    end
    object QMTareaMatDetARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMTareaMatDetARTICULOChange
      Size = 15
    end
    object QMTareaMatDetCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMTareaMatDetEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTareaMatDetDescOperario: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescOperario'
      OnGetText = QMTareaMatDetDescOperarioGetText
      Size = 60
      Calculated = True
    end
    object QMTareaMatDetDescArticulo: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescArticulo'
      OnGetText = QMTareaMatDetDescArticuloGetText
      Size = 60
      Calculated = True
    end
  end
  object DSTareaMatCab: TDataSource
    DataSet = QMTareaMatCab
    Left = 160
    Top = 8
  end
  object DSTareaMatDet: TDataSource
    DataSet = QMTareaMatDet
    Left = 160
    Top = 56
  end
  object xTareasAbiertas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select tipo_fase,titulo_fase,id_orden from pro_ver_tareas_abiert' +
        'as'
      
        'where empresa=?empresa and ejercicio=?ejercicio and identificado' +
        'r=?identificador')
    UniDirectional = False
    Left = 48
    Top = 104
    object xTareasAbiertasTIPO_FASE: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPO_FASE'
      Size = 3
    end
    object xTareasAbiertasTITULO_FASE: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_FASE'
      Size = 60
    end
    object xTareasAbiertasID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
  end
  object DSxTareasAbiertas: TDataSource
    DataSet = xTareasAbiertas
    Left = 160
    Top = 104
  end
  object DSxOrden: TDataSource
    DataSet = xOrden
    Left = 160
    Top = 152
  end
  object xOrden: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT COMPUESTO, TITULO FROM VER_PRO_ORD'
      'WHERE ID_ORDEN = ?ID_ORDEN')
    UniDirectional = False
    DataSource = DSTareaMatCab
    Left = 48
    Top = 152
    object xOrdenCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object xOrdenTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 100
    end
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
