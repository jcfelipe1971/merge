object DMGenEjercicios: TDMGenEjercicios
  OldCreateOrder = False
  OnCreate = DMGenEjerciciosCreate
  Left = 678
  Top = 432
  Height = 239
  Width = 345
  object QMGenEjercicios: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GEN_EJERCICIOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO ')
    InsertSQL.Strings = (
      'INSERT INTO GEN_EJERCICIOS'
      '  (EMPRESA,'#13#10'EJERCICIO,ACTIVO,APERTURA,CIERRE,COLOR)'
      'VALUES'
      '  (?EMPRESA,'#13#10'?EJERCICIO,?ACTIVO,?APERTURA,?CIERRE,?COLOR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GEN_EJERCICIOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO ')
    SelectSQL.Strings = (
      'SELECT * FROM GEN_EJERCICIOS'
      'WHERE'
      'EMPRESA = :EMPRESA'
      'ORDER BY EJERCICIO DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GEN_EJERCICIOS'
      'SET'
      '  ACTIVO=?ACTIVO '
      '  ,APERTURA=?APERTURA '
      '  ,CIERRE=?CIERRE '
      '  ,COLOR=?COLOR '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO ')
    BeforePost = QMGenEjerciciosBeforePost
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GEN_EJERCICIOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 26
    object QMGenEjerciciosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMGenEjerciciosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMGenEjerciciosACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMGenEjerciciosAPERTURA: TDateTimeField
      DisplayLabel = 'Apertura'
      FieldName = 'APERTURA'
    end
    object QMGenEjerciciosCIERRE: TDateTimeField
      DisplayLabel = 'Cierre'
      FieldName = 'CIERRE'
    end
    object QMGenEjerciciosCOLOR: TFloatField
      DisplayLabel = 'Color'
      FieldName = 'COLOR'
    end
  end
  object DSQMGenEjercicios: TDataSource
    DataSet = QMGenEjercicios
    Left = 134
    Top = 26
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 246
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
    Left = 246
    Top = 82
  end
end
