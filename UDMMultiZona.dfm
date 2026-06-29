object DMMultiZona: TDMMultiZona
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 686
  Top = 203
  Height = 229
  Width = 320
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 40
    Top = 24
  end
  object DSxMultiZona: TDataSource
    DataSet = xMultiZona
    Left = 128
    Top = 72
  end
  object xMultiZona: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_ZONAS'
      'WHERE'
      '  ZONA=?old_ZONA AND '
      '  ENTRADA=?old_ENTRADA ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_ZONAS'
      'WHERE'
      '  ZONA=?ZONA AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_ZONAS'
      'WHERE '
      'ENTRADA=?ENTRADA'
      'ORDER BY ZONA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_ZONAS'
      'SET'
      '  MARCADO=?MARCADO '
      'WHERE'
      '  ZONA=?ZONA AND '
      '  ENTRADA=?ENTRADA ')
    AfterPost = xMultiZonaAfterPost
    OnNewRecord = xMultiZonaNewRecord
    ClavesPrimarias.Strings = (
      'ZONA '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_ZONAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 72
    object xMultiZonaENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xMultiZonaZONA: TFIBStringField
      DisplayLabel = 'Zona'
      FieldName = 'ZONA'
      Size = 15
    end
    object xMultiZonaTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xMultiZonaMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
    end
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
    Top = 24
  end
end
