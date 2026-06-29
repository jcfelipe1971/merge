object DMNaturalezaMat: TDMNaturalezaMat
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 414
  Top = 219
  Height = 220
  Width = 239
  object DSQMNaturalezaMat: TDataSource
    DataSet = QMNaturalezaMat
    Left = 144
    Top = 32
  end
  object QMNaturalezaMat: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_NATURALEZA_CARGA'
      'WHERE'
      '  NATURALEZA=?old_NATURALEZA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_NATURALEZA_CARGA'
      '  (NATURALEZA,TITULO,DEFECTO)'
      'VALUES'
      '  (?NATURALEZA,?TITULO,?DEFECTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_NATURALEZA_CARGA'
      'WHERE'
      '  NATURALEZA=?NATURALEZA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_NATURALEZA_CARGA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_NATURALEZA_CARGA'
      'SET'
      '  TITULO=?TITULO '
      '  ,DEFECTO=?DEFECTO '
      'WHERE'
      '  NATURALEZA=?NATURALEZA ')
    OnNewRecord = QMNaturalezaMatNewRecord
    ClavesPrimarias.Strings = (
      'NATURALEZA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_NATURALEZA_CARGA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 32
    object QMNaturalezaMatNATURALEZA: TIntegerField
      DisplayLabel = 'Naturaleza'
      FieldName = 'NATURALEZA'
    end
    object QMNaturalezaMatTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMNaturalezaMatDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 28
    Top = 104
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 132
    Top = 104
  end
end
