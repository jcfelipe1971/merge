object ProDMGantt: TProDMGantt
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 375
  Top = 288
  Height = 318
  Width = 461
  object DSQMGantt: TDataSource
    DataSet = QMGantt
    Left = 88
    Top = 24
  end
  object TLocal: THYTransaction
    Active = True
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 308
    Top = 16
  end
  object QMGantt: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_PLANIFICA_GANT'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_PLANIFICA_GANT'
      
        '  (ID,TAREA,RECURSO,INICIO,DURACION,IDENTIFICADOR_TAREA,DESCRIPC' +
        'ION,PRIORIDAD)'
      'VALUES'
      
        '  (?ID,?TAREA,?RECURSO,?INICIO,?DURACION,?IDENTIFICADOR_TAREA,?D' +
        'ESCRIPCION,?PRIORIDAD)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_PLANIFICA_GANT'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_PLANIFICA_GANT')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_PLANIFICA_GANT'
      'SET'
      '  TAREA=?TAREA '
      '  ,RECURSO=?RECURSO '
      '  ,INICIO=?INICIO '
      '  ,DURACION=?DURACION '
      '  ,IDENTIFICADOR_TAREA=?IDENTIFICADOR_TAREA '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,PRIORIDAD=?PRIORIDAD '
      'WHERE'
      '  ID=?ID ')
    AfterDelete = Graba
    AfterInsert = QMGanttAfterInsert
    AfterPost = Graba
    OnNewRecord = QMGanttNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_PLANIFICA_GANT'
    UpdateTransaction = TLocal
    Left = 24
    Top = 24
    object QMGanttID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID'
    end
    object QMGanttTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 3
    end
    object QMGanttRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 3
    end
    object QMGanttINICIO: TDateTimeField
      DisplayLabel = 'Inicio'
      FieldName = 'INICIO'
    end
    object QMGanttDURACION: TIntegerField
      DisplayLabel = 'Duracion'
      FieldName = 'DURACION'
    end
    object QMGanttIDENTIFICADOR_TAREA: TIntegerField
      DisplayLabel = 'Identif. Tarea'
      FieldName = 'IDENTIFICADOR_TAREA'
    end
    object QMGanttDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object QMGanttPRIORIDAD: TIntegerField
      DisplayLabel = 'Prioridad'
      FieldName = 'PRIORIDAD'
    end
  end
end
