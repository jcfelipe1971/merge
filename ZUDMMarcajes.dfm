object ZDMMarcajes: TZDMMarcajes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 552
  Top = 172
  Height = 246
  Width = 375
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 248
    Top = 8
  end
  object QMMarcajes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_MARCAJES'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO Z_MARCAJES'
      '  (ID,CADENA,PROCESADO,FECHA_LECTURA,FECHA_PROCESADO)'
      'VALUES'
      '  (?ID,?CADENA,?PROCESADO,?FECHA_LECTURA,?FECHA_PROCESADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_MARCAJES'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_MARCAJES')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_MARCAJES'
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
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_MARCAJES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMMarcajesID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMMarcajesCADENA: TFIBStringField
      DisplayLabel = 'Cadena'
      FieldName = 'CADENA'
      Size = 40
    end
    object QMMarcajesPROCESADO: TIntegerField
      DisplayLabel = 'Procesado'
      FieldName = 'PROCESADO'
    end
    object QMMarcajesFECHA_LECTURA: TDateTimeField
      DisplayLabel = 'Fecha Lectura'
      FieldName = 'FECHA_LECTURA'
    end
    object QMMarcajesFECHA_PROCESADO: TDateTimeField
      DisplayLabel = 'Fecha Procesado'
      FieldName = 'FECHA_PROCESADO'
    end
  end
  object DSQMMarcajes: TDataSource
    DataSet = QMMarcajes
    Left = 136
    Top = 8
  end
  object QMIncidencias: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_MARCAJES_INC'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO Z_MARCAJES_INC'
      '  (ID,LINEA,CADENA,INCIDENCIA,DESC_INCIDENCIA)'
      'VALUES'
      '  (?ID,?LINEA,?CADENA,?INCIDENCIA,?DESC_INCIDENCIA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_MARCAJES_INC'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_MARCAJES_INC'
      'where id=?id'
      'order by linea desc')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_MARCAJES_INC'
      'SET'
      '  CADENA=?CADENA '
      '  ,INCIDENCIA=?INCIDENCIA '
      '  ,DESC_INCIDENCIA=?DESC_INCIDENCIA '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ID=?ID ')
    DataSource = DSQMMarcajes
    ClavesPrimarias.Strings = (
      'LINEA '
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_MARCAJES_INC'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
    object QMIncidenciasID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMIncidenciasLINEA: TIntegerField
      DisplayLabel = 'N'#186
      FieldName = 'LINEA'
    end
    object QMIncidenciasCADENA: TFIBStringField
      DisplayLabel = 'Cadena Corregida'
      FieldName = 'CADENA'
      Size = 40
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
    object QMIncidenciasDescIncidencia: TStringField
      DisplayLabel = 'Desc. Incidencia'
      FieldKind = fkCalculated
      FieldName = 'DescIncidencia'
      OnGetText = QMIncidenciasDescIncidenciaGetText
      Size = 60
      Calculated = True
    end
    object QMIncidenciasDESC_INCIDENCIA: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'DESC_INCIDENCIA'
      Size = 100
    end
  end
  object DSQMIncidencias: TDataSource
    DataSet = QMIncidencias
    Left = 136
    Top = 56
  end
  object xDescIncidencia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'select descripcion from sys_tipo_incidencias_maq'
      'where tipo=?incidencia')
    UniDirectional = False
    DataSource = DSQMIncidencias
    Left = 40
    Top = 104
    object xDescIncidenciaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
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
    Left = 248
    Top = 56
  end
end
