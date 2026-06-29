object DMSectorUbicacion: TDMSectorUbicacion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 448
  Top = 241
  Height = 150
  Width = 365
  object DSQMSectorUbicacion: TDataSource
    DataSet = QMSectorUbicacion
    Left = 138
    Top = 28
  end
  object QMSectorUbicacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_SECTORES'
      'WHERE'
      '  SECTOR=?old_SECTOR ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_SECTORES'
      '  (SECTOR,TITULO)'
      'VALUES'
      '  (?SECTOR,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_SECTORES'
      'WHERE'
      '  SECTOR=?SECTOR ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_SECTORES'
      'ORDER BY SECTOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_SECTORES'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  SECTOR=?SECTOR ')
    ClavesPrimarias.Strings = (
      'SECTOR ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_SECTORES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 24
    object QMSectorUbicacionSECTOR: TFIBStringField
      DisplayLabel = 'Sector'
      FieldName = 'SECTOR'
      Size = 5
    end
    object QMSectorUbicacionTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 224
    Top = 26
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 288
    Top = 26
  end
end
