object DMPeriodosSistema: TDMPeriodosSistema
  OldCreateOrder = False
  OnCreate = DMPeriodosSistemaCreate
  Left = 576
  Top = 353
  Height = 333
  Width = 401
  object QMPeriodos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_PERIODOS'
      'WHERE'
      '  PERIODO=?old_PERIODO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_PERIODOS'
      '  (TITULO,HASTA,DESDE,PERIODO,TIPO)'
      'VALUES'
      '  (?TITULO,?HASTA,?DESDE,?PERIODO,?TIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_PERIODOS'
      'WHERE'
      '  PERIODO=?old_PERIODO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_PERIODOS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_PERIODOS'
      'SET'
      '  TITULO=?TITULO '
      '  ,HASTA=?HASTA '
      '  ,DESDE=?DESDE '
      '  ,TIPO=?TIPO '
      'WHERE'
      '  PERIODO=?old_PERIODO ')
    AfterDelete = Graba
    AfterOpen = QMPeriodosAfterOpen
    AfterPost = Graba
    BeforePost = QMPeriodosBeforePost
    OnNewRecord = QMPeriodosNewRecord
    ClavesPrimarias.Strings = (
      'PERIODO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_PERIODOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 52
    Top = 16
    object QMPeriodosPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMPeriodosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMPeriodosTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMPeriodosDESDE: TFIBStringField
      DisplayLabel = 'Desde'
      FieldName = 'DESDE'
      OnChange = QMPeriodosDESDEChange
      Size = 2
    end
    object QMPeriodosHASTA: TFIBStringField
      DisplayLabel = 'Hasta'
      FieldName = 'HASTA'
      OnChange = QMPeriodosHASTAChange
      Size = 2
    end
    object QMPeriodosSISTEMA: TIntegerField
      DisplayLabel = 'Sistema'
      FieldName = 'SISTEMA'
    end
  end
  object DSQMPeriodos: TDataSource
    DataSet = QMPeriodos
    Left = 128
    Top = 16
  end
  object DSxPeriodoDesde: TDataSource
    DataSet = xPeriodoDesde
    Left = 140
    Top = 72
  end
  object DSxPeriodoHasta: TDataSource
    DataSet = xPeriodoHasta
    Left = 140
    Top = 120
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 292
    Top = 26
  end
  object DSxTipoPeriodo: TDataSource
    DataSet = xTipoPeriodo
    Left = 140
    Top = 176
  end
  object xPeriodoDesde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_PERIODOS'
      'WHERE'
      '  PERIODO=?DESDE')
    UniDirectional = False
    DataSource = DSQMPeriodos
    Left = 56
    Top = 72
    object xPeriodoDesdeTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object xPeriodoHasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_PERIODOS'
      'WHERE'
      '  PERIODO=?HASTA')
    UniDirectional = False
    DataSource = DSQMPeriodos
    Left = 56
    Top = 120
    object xPeriodoHastaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object xTipoPeriodo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TIPO,TITULO FROM SYS_TIPO_PERIODOS'
      'WHERE TIPO=?TIPO')
    UniDirectional = False
    DataSource = DSQMPeriodos
    Left = 56
    Top = 184
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 292
    Top = 90
  end
end
