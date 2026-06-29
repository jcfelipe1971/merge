object ProDMTipTareasManu: TProDMTipTareasManu
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 218
  Top = 103
  Height = 164
  Width = 215
  object QMProTipTareasManu: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_TIPOS_TAREAS_MANU'
      'WHERE'
      '  ID_TIPO_TAREA_MANU=?old_ID_TIPO_TAREA_MANU ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_TIPOS_TAREAS_MANU'
      '  (ID_TIPO_TAREA_MANU,TITULO)'
      'VALUES'
      '  (?ID_TIPO_TAREA_MANU,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_TIPOS_TAREAS_MANU'
      'WHERE'
      '  ID_TIPO_TAREA_MANU=?ID_TIPO_TAREA_MANU ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_TIPOS_TAREAS_MANU')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_TIPOS_TAREAS_MANU'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  ID_TIPO_TAREA_MANU=?ID_TIPO_TAREA_MANU ')
    Plan.Strings = (
      'PLAN (PRO_SYS_FASES NATURAL)')
    AfterDelete = Graba
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'ID_TIPO_TAREA_MANU ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_TIPOS_TAREAS_MANU'
    UpdateTransaction = TLocal
    Left = 32
    Top = 16
    object QMProTipTareasManuID_TIPO_TAREA_MANU: TFIBStringField
      DisplayLabel = 'Id'
      FieldName = 'ID_TIPO_TAREA_MANU'
      Size = 5
    end
    object QMProTipTareasManuTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object TLocal: THYTransaction
    Active = True
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 120
    Top = 80
  end
  object DSQMProTipTareasManu: TDataSource
    DataSet = QMProTipTareasManu
    Left = 120
    Top = 16
  end
end
