object DMTiposReparacion: TDMTiposReparacion
  OldCreateOrder = False
  OnCreate = DMTiposReparacionCreate
  Left = 494
  Top = 342
  Height = 224
  Width = 300
  object DSQMTiposReparacion: TDataSource
    DataSet = QMTiposReparacion
    Left = 134
    Top = 18
  end
  object QMTiposReparacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TIPO_REPARACION'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TIPO_REPARACION'
      '  (TIPO,TITULO)'
      'VALUES'
      '  (?TIPO,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_REPARACION'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_REPARACION'
      'ORDER BY TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TIPO_REPARACION'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  TIPO=?TIPO ')
    OnNewRecord = QMTiposReparacionNewRecord
    ClavesPrimarias.Strings = (
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TIPO_REPARACION'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 36
    Top = 16
    object QMTiposReparacionTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMTiposReparacionTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      DisplayWidth = 25
      FieldName = 'TITULO'
      Size = 25
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 134
    Top = 74
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 30
    Top = 74
  end
end
