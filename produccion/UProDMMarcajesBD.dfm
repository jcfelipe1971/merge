object ProDMMarcajesBD: TProDMMarcajesBD
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 498
  Top = 234
  Height = 351
  Width = 351
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 124
    Top = 22
  end
  object QMMarcajes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_MARCAJES'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_MARCAJES'
      '  (ID,CADENA,PROCESADO,FECHA_LECTURA,FECHA_PROCESADO)'
      'VALUES'
      '  (?ID,?CADENA,?PROCESADO,?FECHA_LECTURA,?FECHA_PROCESADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_MARCAJES'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_MARCAJES order by id desc')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted, cusDeleted, cusUninserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_MARCAJES'
      'SET'
      '  CADENA=?CADENA '
      '  ,PROCESADO=?PROCESADO '
      '  ,FECHA_LECTURA=?FECHA_LECTURA '
      '  ,FECHA_PROCESADO=?FECHA_PROCESADO '
      'WHERE'
      '  ID=?ID ')
    AfterOpen = QMMarcajesAfterOpen
    AfterPost = QMMarcajesAfterPost
    AfterScroll = QMMarcajesAfterScroll
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_MARCAJES'
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 40
    Top = 20
    object QMMarcajesID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMMarcajesCADENA: TFIBStringField
      DisplayLabel = 'Cadena'
      FieldName = 'CADENA'
      ReadOnly = True
      Size = 40
    end
    object QMMarcajesPROCESADO: TIntegerField
      DisplayLabel = 'Procesado'
      FieldName = 'PROCESADO'
      ReadOnly = True
    end
    object QMMarcajesFECHA_LECTURA: TDateTimeField
      DisplayLabel = 'Fecha Lectura'
      FieldName = 'FECHA_LECTURA'
      ReadOnly = True
    end
    object QMMarcajesFECHA_PROCESADO: TDateTimeField
      DisplayLabel = 'Fecha Procesado'
      FieldName = 'FECHA_PROCESADO'
      ReadOnly = True
    end
    object QMMarcajesID_GRUPO: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_GRUPO'
    end
    object QMMarcajesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMMarcajesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMMarcajesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMMarcajesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMMarcajesHORA_PROCESADO: TFloatField
      DisplayLabel = 'Hora Procesado'
      FieldName = 'HORA_PROCESADO'
    end
    object QMMarcajesID_TAREA: TIntegerField
      DisplayLabel = 'Id Tarea'
      FieldName = 'ID_TAREA'
    end
  end
  object DSQMMarcajes: TDataSource
    DataSet = QMMarcajes
    Left = 39
    Top = 67
  end
  object QMIncidencias: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from pro_marcajes_det where id = ?id')
    InsertSQL.Strings = (
      
        'INSERT INTO PRO_MARCAJES_DET (id_cab,cadena,empresa,ejercicio,ca' +
        'nal,serie)'
      'VALUES (?id_cab,?cadena,?empresa,?ejercicio,?canal,?serie)')
    RefreshSQL.Strings = (
      'SELECT * FROM PRO_MARCAJES_DET '
      'WHERE ID_CAB = ?ID')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_MARCAJES_DET '
      'WHERE ID_CAB = ?ID'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted, cusDeleted, cusUninserted]
    DataSource = DSQMMarcajes
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMIncidenciasNewRecord
    ClavesPrimarias.Strings = (
      'ID'#13)
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_MARCAJES_DET'
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 40
    Top = 123
    object QMIncidenciasID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMIncidenciasID_CAB: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CAB'
    end
    object QMIncidenciasESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMIncidenciasCADENA: TFIBStringField
      DisplayLabel = 'Cadena'
      FieldName = 'CADENA'
      Size = 40
    end
    object QMIncidenciasHORA_LECTURA: TFloatField
      DisplayLabel = 'Hora Lectura'
      FieldName = 'HORA_LECTURA'
    end
    object QMIncidenciasCADENA_ERR: TFIBStringField
      DisplayLabel = 'Cadena Erronea'
      FieldName = 'CADENA_ERR'
      Size = 40
    end
    object QMIncidenciasINCIDENCIA: TFIBStringField
      DisplayLabel = 'Incidencia'
      FieldName = 'INCIDENCIA'
      Size = 3
    end
    object QMIncidenciasDESC_INCIDENCIA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_INCIDENCIA'
      Size = 100
    end
    object QMIncidenciasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMIncidenciasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMIncidenciasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMIncidenciasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
  end
  object DSQMIncidencias: TDataSource
    DataSet = QMIncidencias
    Left = 39
    Top = 169
  end
  object xDescIncidencia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select descripcion from pro_sys_marcajes_inc'
      'where incidencia=?incidencia')
    UniDirectional = False
    DataSource = DSQMIncidencias
    Left = 120
    Top = 124
    object xDescIncidenciaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object QBorraMarcajes: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'delete from pro_marcajes')
    Transaction = TLocal
    AutoTrans = True
    Left = 248
    Top = 24
  end
  object QTemp: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 36
    Top = 220
  end
end
