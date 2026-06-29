object DMUbicacionesSimple: TDMUbicacionesSimple
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 396
  Top = 338
  Height = 230
  Width = 354
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 270
    Top = 18
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 270
    Top = 74
  end
  object QMUbicacionesSimple: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_UBICACION_SIMPLE'
      'WHERE'
      '  ID_UBICACION_SIMPLE=?old_ID_UBICACION_SIMPLE ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_UBICACION_SIMPLE'
      '  (ID_UBICACION_SIMPLE,EMPRESA,TITULO)'
      'VALUES'
      '  (?ID_UBICACION_SIMPLE,?EMPRESA,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_UBICACION_SIMPLE'
      'WHERE'
      '  ID_UBICACION_SIMPLE=?ID_UBICACION_SIMPLE ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_UBICACION_SIMPLE'
      'WHERE EMPRESA = ?EMPRESA'
      'ORDER BY ID_UBICACION_SIMPLE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_UBICACION_SIMPLE'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  ID_UBICACION_SIMPLE=?ID_UBICACION_SIMPLE ')
    OnNewRecord = QMUbicacionesSimpleNewRecord
    ClavesPrimarias.Strings = (
      'ID_UBICACION_SIMPLE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_UBICACION_SIMPLE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 24
    object QMUbicacionesSimpleID_UBICACION_SIMPLE: TIntegerField
      DisplayLabel = 'ID Ubic.'
      FieldName = 'ID_UBICACION_SIMPLE'
    end
    object QMUbicacionesSimpleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMUbicacionesSimpleTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSQMUbicacionesSimple: TDataSource
    DataSet = QMUbicacionesSimple
    Left = 176
    Top = 24
  end
end
