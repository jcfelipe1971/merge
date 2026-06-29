object DMAjustes: TDMAjustes
  OldCreateOrder = False
  OnCreate = DMAjustesCreate
  Left = 561
  Top = 521
  Height = 194
  Width = 221
  object QMAjustes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT * FROM SYS_REVISIONES '
      'WHERE'
      '  REVISION=?REVISION ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_REVISIONES'
      'ORDER BY REVISION, TIPOS_REVISION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    ClavesPrimarias.Strings = (
      'REVISION ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_REVISIONES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 28
    object QMAjustesREVISION: TIntegerField
      DisplayLabel = 'Revisi'#243'n'
      DisplayWidth = 12
      FieldName = 'REVISION'
    end
    object QMAjustesFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      DisplayWidth = 12
      FieldName = 'FECHA'
    end
    object QMAjustesTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      DisplayWidth = 48
      FieldName = 'TITULO'
      Size = 40
    end
    object QMAjustesSYS_USUARIO: TFIBStringField
      DisplayLabel = 'Usuario'
      DisplayWidth = 40
      FieldName = 'SYS_USUARIO'
      Size = 40
    end
    object QMAjustesTIPOS_REVISION: TFIBStringField
      DisplayLabel = 'Tipo Rev.'
      FieldName = 'TIPOS_REVISION'
      Size = 3
    end
    object QMAjustesNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object DSQMAjustes: TDataSource
    DataSet = QMAjustes
    Left = 112
    Top = 28
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 32
    Top = 100
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 112
    Top = 100
  end
end
