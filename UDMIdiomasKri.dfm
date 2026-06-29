object DMIdiomasKri: TDMIdiomasKri
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 327
  Top = 107
  Height = 150
  Width = 332
  object QMIdiomas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_IDIOMAS'
      'WHERE'
      '  IDIOMA=?old_IDIOMA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_IDIOMAS'
      '  (DEFECTO,TITULO,IDIOMA,NOTAS_KRI,NOTAS_INTERNAS_KRI)'
      'VALUES'
      '  (?DEFECTO,?TITULO,?IDIOMA,?NOTAS_KRI,?NOTAS_INTERNAS_KRI)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_IDIOMAS'
      'WHERE'
      '  IDIOMA=?IDIOMA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_IDIOMAS'
      'ORDER BY DEFECTO desc, IDIOMA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_IDIOMAS'
      'SET'
      '  DEFECTO=?DEFECTO '
      '  ,TITULO=?TITULO '
      '  ,NOTAS_KRI=?NOTAS_KRI '
      '  ,NOTAS_INTERNAS_KRI=?NOTAS_INTERNAS_KRI '
      'WHERE'
      '  IDIOMA=?IDIOMA ')
    ClavesPrimarias.Strings = (
      'IDIOMA')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_IDIOMAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 22
    Top = 18
    object QMIdiomasIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMIdiomasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMIdiomasDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
    object QMIdiomasNOTAS_KRI: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS_KRI'
      Size = 8
    end
    object QMIdiomasNOTAS_INTERNAS_KRI: TBlobField
      DisplayLabel = 'Notas Internas'
      FieldName = 'NOTAS_INTERNAS_KRI'
      Size = 8
    end
  end
  object DSQMIdiomas: TDataSource
    DataSet = QMIdiomas
    Left = 94
    Top = 18
  end
  object TLocal: THYTransaction
    Active = True
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 172
    Top = 14
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 244
    Top = 14
  end
end
