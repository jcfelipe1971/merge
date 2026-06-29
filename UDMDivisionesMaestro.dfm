object DMDivisionesMaestro: TDMDivisionesMaestro
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 272
  Top = 103
  Height = 150
  Width = 403
  object QMDivisiones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_DIVISIONES'
      'WHERE'
      '  DIVISION=?old_DIVISION AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO CON_DIVISIONES'
      '  (EMPRESA,DIVISION,TITULO)'
      'VALUES'
      '  (?EMPRESA,?DIVISION,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_DIVISIONES'
      'WHERE'
      '  DIVISION=?DIVISION AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_DIVISIONES'
      'WHERE'
      'EMPRESA=?EMPRESA'
      'ORDER BY DIVISION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_DIVISIONES'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  DIVISION=?DIVISION AND '
      '  EMPRESA=?EMPRESA ')
    OnNewRecord = QMDivisionesNewRecord
    ClavesPrimarias.Strings = (
      'DIVISION '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_DIVISIONES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 32
    object QMDivisionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDivisionesDIVISION: TFIBStringField
      DisplayLabel = 'Divisi'#243'n'
      FieldName = 'DIVISION'
      Size = 5
    end
    object QMDivisionesTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSQMDivisiones: TDataSource
    DataSet = QMDivisiones
    Left = 132
    Top = 30
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 230
    Top = 32
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 326
    Top = 32
  end
end
