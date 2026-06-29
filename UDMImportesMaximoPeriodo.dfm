object DMImportesMaximoPeriodo: TDMImportesMaximoPeriodo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 328
  Top = 111
  Height = 214
  Width = 306
  object QMPeriodos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_PERIODOS_COMPRAS'
      'WHERE'
      '  PERIODO=?old_PERIODO AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_PERIODOS_COMPRAS'
      '  (EMPRESA,EJERCICIO,PERIODO,IMPORTE_MAXIMO_PEDIDOS)'
      'VALUES'
      '  (?EMPRESA,?EJERCICIO,?PERIODO,?IMPORTE_MAXIMO_PEDIDOS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_PERIODOS_COMPRAS'
      'WHERE'
      '  PERIODO=?old_PERIODO AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_PERIODOS_COMPRAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO '
      'ORDER BY PERIODO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_PERIODOS_COMPRAS'
      'SET'
      '  IMPORTE_MAXIMO_PEDIDOS=?IMPORTE_MAXIMO_PEDIDOS '
      '  ,PERIODO = ?new_PERIODO'
      'WHERE'
      '  PERIODO=?old_PERIODO AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    OnNewRecord = QMPeriodosNewRecord
    ClavesPrimarias.Strings = (
      'PERIODO '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_PERIODOS_COMPRAS'
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
    object QMPeriodosIMPORTE_MAXIMO_PEDIDOS: TFloatField
      DisplayLabel = 'Importe Maximo Pedidos'
      FieldName = 'IMPORTE_MAXIMO_PEDIDOS'
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
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 188
    Top = 66
  end
end
