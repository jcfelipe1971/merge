object DMCambioDivisas: TDMCambioDivisas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 514
  Top = 190
  Height = 312
  Width = 471
  object QMCambios: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_MONEDAS_CAMBIOS'
      'WHERE'
      '  NUM_CAMBIO=?old_NUM_CAMBIO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_MONEDAS_CAMBIOS'
      
        '  (F_ALTA,F_BAJA,CAMBIO,FACTOR,NUM_CAMBIO,ACTIVO,ORIGEN,DESTINO,' +
        'CARGO_LINEAL)'
      'VALUES'
      
        '  (?F_ALTA,?F_BAJA,?CAMBIO,?FACTOR,?NUM_CAMBIO,?ACTIVO,?ORIGEN,?' +
        'DESTINO,?CARGO_LINEAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_MONEDAS_CAMBIOS'
      'WHERE'
      '  NUM_CAMBIO=?NUM_CAMBIO ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SYS_MONEDAS_CAMBIOS'
      'WHERE'
      'ORIGEN = ?ORIGEN AND'
      'DESTINO = ?DESTINO'
      'ORDER BY ORIGEN, DESTINO, F_ALTA DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_MONEDAS_CAMBIOS'
      'SET'
      '  F_ALTA=?F_ALTA '
      '  ,F_BAJA=?F_BAJA '
      '  ,CAMBIO=?CAMBIO '
      '  ,FACTOR=?FACTOR '
      '  ,ACTIVO=?ACTIVO '
      '  ,ORIGEN=?ORIGEN '
      '  ,DESTINO=?DESTINO '
      '  ,CARGO_LINEAL=?CARGO_LINEAL '
      'WHERE'
      '  NUM_CAMBIO=?NUM_CAMBIO ')
    AfterCancel = QMCambiosAfterCancel
    AfterDelete = QMCambiosAfterDelete
    AfterOpen = QMCambiosAfterOpen
    AfterPost = QMCambiosAfterPost
    BeforeClose = QMCambiosBeforeClose
    BeforePost = QMCambiosBeforePost
    OnNewRecord = QMCambiosNewRecord
    OnPostError = QMCambiosPostError
    ClavesPrimarias.Strings = (
      'NUM_CAMBIO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_MONEDAS_CAMBIOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 64
    object QMCambiosORIGEN: TFIBStringField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
      Size = 3
    end
    object QMCambiosDESTINO: TFIBStringField
      DisplayLabel = 'Destino'
      FieldName = 'DESTINO'
      Size = 3
    end
    object QMCambiosF_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'F_ALTA'
    end
    object QMCambiosF_BAJA: TDateTimeField
      DisplayLabel = 'Fec. Baja'
      FieldName = 'F_BAJA'
    end
    object QMCambiosCAMBIO: TFloatField
      DisplayLabel = 'Cambio'
      FieldName = 'CAMBIO'
    end
    object QMCambiosFACTOR: TFloatField
      DisplayLabel = 'Factor'
      FieldName = 'FACTOR'
    end
    object QMCambiosACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMCambiosNUM_CAMBIO: TIntegerField
      DisplayLabel = 'Nro. Cambio'
      FieldName = 'NUM_CAMBIO'
    end
    object QMCambiosCARGO_LINEAL: TFloatField
      DisplayLabel = 'Cargo Lineal'
      FieldName = 'CARGO_LINEAL'
    end
  end
  object DSQMCambios: TDataSource
    DataSet = QMCambios
    Left = 128
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 32
    Top = 16
  end
  object xCambios: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT FIRST (1) *'
      'FROM VER_MONEDAS_CAMBIOS'
      'WHERE'
      'ORIGEN = ?ORIGEN AND'
      'DESTINO = ?DESTINO'
      'ORDER BY F_ALTA DESC ')
    UniDirectional = False
    DataSource = DSQMCambios
    Left = 32
    Top = 112
    object xCambiosNUM_CAMBIO: TIntegerField
      DisplayLabel = 'Nro. Cambio'
      FieldName = 'NUM_CAMBIO'
    end
    object xCambiosORIGEN: TFIBStringField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
      Size = 3
    end
    object xCambiosT_ORIGEN: TFIBStringField
      DisplayLabel = 'T. Origen'
      FieldName = 'T_ORIGEN'
      Size = 40
    end
    object xCambiosDESTINO: TFIBStringField
      DisplayLabel = 'Destino'
      FieldName = 'DESTINO'
      Size = 3
    end
    object xCambiosT_DESTINO: TFIBStringField
      DisplayLabel = 'T. Destino'
      FieldName = 'T_DESTINO'
      Size = 40
    end
    object xCambiosF_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'F_ALTA'
    end
    object xCambiosF_BAJA: TDateTimeField
      DisplayLabel = 'Fec. Baja'
      FieldName = 'F_BAJA'
    end
    object xCambiosCAMBIO: TFloatField
      DisplayLabel = 'Cambio'
      FieldName = 'CAMBIO'
    end
    object xCambiosFACTOR: TFloatField
      DisplayLabel = 'Factor'
      FieldName = 'FACTOR'
    end
    object xCambiosACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
  end
  object DSxCambios: TDataSource
    DataSet = xCambios
    Left = 128
    Top = 112
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 128
    Top = 16
  end
end
