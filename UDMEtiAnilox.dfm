object DMEtiAnilox: TDMEtiAnilox
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 752
  Top = 399
  Height = 291
  Width = 478
  object QMEtiAnilox: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ETI_ANILOX'
      'WHERE'
      '  ID_ANILOX=?old_ID_ANILOX ')
    InsertSQL.Strings = (
      'INSERT INTO ETI_ANILOX'
      '  (ID_ANILOX,TITULO,VALOR)'
      'VALUES'
      '  (?ID_ANILOX,?TITULO,?VALOR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ETI_ANILOX'
      'WHERE'
      '  ID_ANILOX=?ID_ANILOX ')
    SelectSQL.Strings = (
      'SELECT * FROM ETI_ANILOX'
      'ORDER BY ID_ANILOX')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ETI_ANILOX'
      'SET'
      '  TITULO=?TITULO '
      '  ,VALOR=?VALOR '
      'WHERE'
      '  ID_ANILOX=?ID_ANILOX ')
    ClavesPrimarias.Strings = (
      'ID_ANILOX ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ETI_ANILOX'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object QMEtiAniloxID_ANILOX: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_ANILOX'
    end
    object QMEtiAniloxTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMEtiAniloxVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
  end
  object DSQMEtiAnilox: TDataSource
    DataSet = QMEtiAnilox
    Left = 184
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 56
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 184
    Top = 8
  end
end
