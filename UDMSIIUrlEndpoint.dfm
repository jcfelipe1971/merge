object DMSIIUrlEndpoint: TDMSIIUrlEndpoint
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 293
  Top = 238
  Height = 264
  Width = 361
  object QMURLEndPoint: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SII_URL_ENDPOINT '
      'WHERE '
      'TIPO = :TIPO AND '
      'PAIS = :PAIS')
    InsertSQL.Strings = (
      'INSERT INTO SII_URL_ENDPOINT ('
      'TIPO, URL, PAIS)'
      'VALUES ('
      ':TIPO, :URL, :PAIS)')
    RefreshSQL.Strings = (
      'SELECT * FROM SII_URL_ENDPOINT '
      'WHERE '
      'PAIS=:PAIS AND '
      'TIPO=:TIPO')
    SelectSQL.Strings = (
      'SELECT * FROM SII_URL_ENDPOINT '
      'WHERE '
      'PAIS = :PAIS'
      'ORDER BY TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SII_URL_ENDPOINT '
      'SET '
      'URL = :URL'
      'WHERE '
      'TIPO = :TIPO AND '
      'PAIS = :PAIS')
    OnNewRecord = QMURLEndPointNewRecord
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMURLEndPointTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMURLEndPointURL: TFIBStringField
      DisplayLabel = 'Url'
      FieldName = 'URL'
      Size = 500
    end
    object QMURLEndPointPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
  end
  object DSQMURLEndPoint: TDataSource
    DataSet = QMURLEndPoint
    Left = 152
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 272
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 272
    Top = 64
  end
end
