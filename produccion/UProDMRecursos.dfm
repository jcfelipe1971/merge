object ProDMRecursos: TProDMRecursos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 434
  Top = 264
  Height = 190
  Width = 242
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 136
    Top = 64
  end
  object QMProRecursos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_SYS_RECURSOS'
      'WHERE'
      '  RECURSO=?old_RECURSO ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_SYS_RECURSOS'
      '  (RECURSO,TITULO)'
      'VALUES'
      '  (?RECURSO,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_SYS_RECURSOS'
      'WHERE'
      '  RECURSO=?RECURSO ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_SYS_RECURSOS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_SYS_RECURSOS'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  RECURSO=?RECURSO ')
    Plan.Strings = (
      'PLAN (PRO_SYS_RECURSOS NATURAL)')
    AfterDelete = Graba
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'RECURSO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_SYS_RECURSOS'
    UpdateTransaction = TLocal
    Left = 24
    Top = 8
    object QMProRecursosRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 3
    end
    object QMProRecursosTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSQMProRecursos: TDataSource
    DataSet = QMProRecursos
    Left = 136
    Top = 8
  end
end
