object ProDMTareas: TProDMTareas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 689
  Top = 183
  Height = 306
  Width = 330
  object DSQMProSysTareas: TDataSource
    DataSet = QMProSysTareas
    Left = 136
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 264
    Top = 16
  end
  object QMProSysTareas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_SYS_TAREAS'
      'WHERE'
      '  EMPRESA = ?old_EMPRESA AND'
      '  TAREA=?old_TAREA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_SYS_TAREAS'
      '  (EMPRESA,TAREA,TITULO,ABSOLUTO,FASE,CENTRO)'
      'VALUES'
      '  (?EMPRESA,?TAREA,?TITULO,?ABSOLUTO,?FASE,?CENTRO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_SYS_TAREAS'
      'WHERE'
      '  EMPRESA = ?EMPRESA AND'
      '  TAREA=?TAREA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_SYS_TAREAS'
      'WHERE EMPRESA = ?EMPRESA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_SYS_TAREAS'
      'SET'
      '  TITULO=?TITULO, '
      '  ABSOLUTO=?ABSOLUTO,'
      '  FASE=?FASE,'
      '  CENTRO= ?CENTRO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  TAREA=?TAREA ')
    Plan.Strings = (
      'PLAN (PRO_SYS_TAREAS NATURAL)')
    AfterOpen = QMProSysTareasAfterOpen
    BeforeClose = QMProSysTareasBeforeClose
    OnNewRecord = QMProSysTareasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'TAREA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_SYS_TAREAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMProSysTareasTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 3
    end
    object QMProSysTareasTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMProSysTareasABSOLUTO: TIntegerField
      DisplayLabel = 'Absoluto'
      FieldName = 'ABSOLUTO'
    end
    object QMProSysTareasFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 3
    end
    object QMProSysTareasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProSysTareasCENTRO: TFIBStringField
      DisplayLabel = 'Centro Trab.'
      FieldName = 'CENTRO'
      Size = 3
    end
  end
  object frProTareas: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado c'#243'digo barras'
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 32
    Top = 112
    ReportForm = {19000000}
  end
  object frDBLstTareas: TfrDBDataSet
    DataSource = DSQMProSysTareas
    Left = 136
    Top = 112
  end
  object DSxArtRep: TDataSource
    DataSet = xArtRep
    Left = 136
    Top = 64
  end
  object xArtRep: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_REPAR_CONF_ART_TAREA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  TAREA=?old_TAREA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_REPAR_CONF_ART_TAREA'
      '  (EMPRESA,'#13#10'ARTICULO,TITULO_LARGO,TAREA,TITULO)'
      'VALUES'
      '  (?EMPRESA,'#13#10'?ARTICULO,?TITULO_LARGO,?TAREA,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_REPAR_CONF_ART_TAREA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  TAREA=?TAREA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_REPAR_CONF_ART_TAREA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  TAREA=?TAREA '
      'ORDER BY ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_REPAR_CONF_ART_TAREA'
      'SET'
      '  ARTICULO=?new_ARTICULO'
      '  ,TAREA=?new_TAREA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  TAREA=?old_TAREA ')
    DataSource = DSQMProSysTareas
    Plan.Strings = (
      'PLAN (PRO_SYS_TAREAS NATURAL)')
    OnNewRecord = xArtRepNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA'
      'ARTICULO'
      'TAREA')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_REPAR_CONF_ART_TAREA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 64
    object xArtRepEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xArtRepARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArtRepTITULO_LARGO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_LARGO'
      Size = 256
    end
    object xArtRepTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 3
    end
    object xArtRepTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 267
    Top = 64
  end
end
