object DMTiposActuacion: TDMTiposActuacion
  OldCreateOrder = False
  OnCreate = DMTiposActuacionCreate
  Left = 494
  Top = 342
  Height = 224
  Width = 300
  object DSQMTiposActuacion: TDataSource
    DataSet = QMTiposActuacion
    Left = 134
    Top = 18
  end
  object QMTiposActuacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TIPO_ACTUACION'
      'WHERE'
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TIPO_ACTUACION'
      '  (TIPO,TITULO,DESCRIPCION)'
      'VALUES'
      '  (?TIPO,?TITULO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_ACTUACION'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_ACTUACION'
      'ORDER BY TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TIPO_ACTUACION'
      'SET'
      '  TITULO=?TITULO '
      '  ,DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  TIPO=?TIPO ')
    OnNewRecord = QMTiposActuacionNewRecord
    ClavesPrimarias.Strings = (
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TIPO_ACTUACION'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 36
    Top = 16
    object QMTiposActuacionTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMTiposActuacionTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 25
    end
    object QMTiposActuacionDESCRIPCION: TMemoField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      BlobType = ftMemo
      Size = 8
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
