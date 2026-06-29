object ProDMTareasManu: TProDMTareasManu
  OldCreateOrder = False
  OnCreate = ProDMTareasManuCreate
  Left = 493
  Top = 234
  Height = 278
  Width = 250
  object QMProTareasManu: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_TAREAS_MANUALES'
      'WHERE'
      '  ID_TAREA_MAN=?old_ID_TAREA_MAN ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_TAREAS_MANUALES'
      '  (ID_RECURSO,TIEMPO,ID_TIPO_TAREA_MAN,ID_TAREA_MAN)'
      'VALUES'
      '  (?ID_RECURSO,?TIEMPO,?ID_TIPO_TAREA_MAN,?ID_TAREA_MAN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_TAREAS_MANUALES'
      'WHERE'
      '  ID_TAREA_MAN=?ID_TAREA_MAN ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_TAREAS_MANUALES')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_TAREAS_MANUALES'
      'SET'
      '  ID_RECURSO=?ID_RECURSO '
      '  ,TIEMPO=?TIEMPO '
      '  ,ID_TIPO_TAREA_MAN=?ID_TIPO_TAREA_MAN '
      'WHERE'
      '  ID_TAREA_MAN=?ID_TAREA_MAN ')
    Plan.Strings = (
      'PLAN (PRO_SYS_FASES NATURAL)')
    AfterDelete = Graba
    AfterOpen = QMProTareasManuAfterOpen
    AfterPost = Graba
    AfterScroll = QMProTareasManuAfterScroll
    BeforePost = QMProTareasManuBeforePost
    ClavesPrimarias.Strings = (
      'ID_TAREA_MAN ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_TAREAS_MANUALES'
    UpdateTransaction = TLocal
    Left = 40
    Top = 16
    object QMProTareasManuID_TAREA_MAN: TFIBStringField
      DisplayLabel = 'Id'
      FieldName = 'ID_TAREA_MAN'
      Size = 5
    end
    object QMProTareasManuID_RECURSO: TFIBStringField
      DisplayLabel = 'Id'
      FieldName = 'ID_RECURSO'
      OnChange = QMProTareasManuID_RECURSOChange
      Size = 5
    end
    object QMProTareasManuTIEMPO: TIntegerField
      DisplayLabel = 'Tiempo'
      FieldName = 'TIEMPO'
    end
    object QMProTareasManuID_TIPO_TAREA_MAN: TFIBStringField
      DisplayLabel = 'Id'
      FieldName = 'ID_TIPO_TAREA_MAN'
      OnChange = QMProTareasManuID_TIPO_TAREA_MANChange
      Size = 5
    end
    object QMProTareasManuTime: TStringField
      FieldKind = fkCalculated
      FieldName = 'Time'
      OnChange = QMProTareasManuTimeChange
      Size = 255
      Calculated = True
    end
  end
  object DSQMProTareasManu: TDataSource
    DataSet = QMProTareasManu
    Left = 40
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 168
    Top = 16
  end
  object xRecursos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select RECURSO,TITULO'
      'From PRO_RECURSOS'
      'Where recurso=?id_recurso')
    UniDirectional = False
    DataSource = DSQMProTareasManu
    Left = 24
    Top = 131
    object xRecursosRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object xRecursosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxRecursos: TDataSource
    DataSet = xRecursos
    Left = 120
    Top = 132
  end
  object xTipoTareaMan: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select *'
      'From PRO_TIPOS_TAREAS_MANU'
      'Where id_tipo_tarea_manu=?id_tipo_tarea_man')
    UniDirectional = False
    DataSource = DSQMProTareasManu
    Left = 24
    Top = 183
    object xTipoTareaManID_TIPO_TAREA_MANU: TFIBStringField
      DisplayLabel = 'Id'
      FieldName = 'ID_TIPO_TAREA_MANU'
      Size = 5
    end
    object xTipoTareaManTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxTipoTareaMan: TDataSource
    DataSet = xTipoTareaMan
    Left = 120
    Top = 184
  end
end
