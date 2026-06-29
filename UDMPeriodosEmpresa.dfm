object DMPeriodosEmpresa: TDMPeriodosEmpresa
  OldCreateOrder = False
  OnCreate = DMPeriodosEmpresaCreate
  Left = 478
  Top = 331
  Height = 172
  Width = 275
  object QMPeriodos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_PERIODOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  PERIODO=?old_PERIODO ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_PERIODOS'
      '  (DESDE,HASTA,TITULO,TIPO,EMPRESA,EJERCICIO,PERIODO)'
      'VALUES'
      '  (?DESDE,?HASTA,?TITULO,?TIPO,?EMPRESA,?EJERCICIO,?PERIODO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_PERIODOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  PERIODO=?old_PERIODO ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_PERIODOS'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_PERIODOS'
      'SET'
      '  DESDE=?DESDE '
      '  ,HASTA=?HASTA '
      '  ,TITULO=?TITULO '
      '  ,TIPO=?TIPO '
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  PERIODO=?old_PERIODO ')
    AfterDelete = Graba
    AfterOpen = QMPeriodosAfterOpen
    AfterPost = Graba
    BeforePost = QMPeriodosBeforePost
    OnNewRecord = QMPeriodosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'PERIODO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_PERIODOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 36
    Top = 20
    object QMPeriodosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPeriodosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPeriodosPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMPeriodosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 50
    end
    object QMPeriodosDESDE: TDateTimeField
      DisplayLabel = 'Desde'
      FieldName = 'DESDE'
    end
    object QMPeriodosHASTA: TDateTimeField
      DisplayLabel = 'Hasta'
      FieldName = 'HASTA'
    end
    object QMPeriodosTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
  end
  object DSQMPeriodos: TDataSource
    DataSet = QMPeriodos
    Left = 108
    Top = 20
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 188
    Top = 18
  end
  object xTipoPeriodo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO'
      ' FROM SYS_TIPO_PERIODOS'
      'WHERE TIPO=?TIPO')
    UniDirectional = False
    DataSource = DSQMPeriodos
    Left = 108
    Top = 76
  end
  object DSxTipoPeriodo: TDataSource
    DataSet = xTipoPeriodo
    Left = 184
    Top = 76
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 36
    Top = 74
  end
end
