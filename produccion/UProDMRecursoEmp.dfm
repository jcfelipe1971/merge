object ProDMRecursoEmp: TProDMRecursoEmp
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 901
  Top = 227
  Height = 363
  Width = 328
  object DSQMProRecursos: TDataSource
    DataSet = QMProRecursos
    Left = 136
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 248
    Top = 8
  end
  object QMProRecursos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_RECURSOS'
      'WHERE'
      '  RECURSO=?old_RECURSO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_RECURSOS'
      
        '  (EMPRESA,RECURSO,TITULO,UNIDAD,TIPORECURSO,IMPORTE,PLANIFICABL' +
        'E,PORCEN_CAPACIDAD,ID_HORARIO,ID_RECURSO,OPERACIONES_NUM,OPERACI' +
        'ONES_TIEMPO,FASES,CODMAQ)'
      'VALUES'
      
        '  (?EMPRESA,?RECURSO,?TITULO,?UNIDAD,?TIPORECURSO,?IMPORTE,?PLAN' +
        'IFICABLE,?PORCEN_CAPACIDAD,?ID_HORARIO,?ID_RECURSO,?OPERACIONES_' +
        'NUM,?OPERACIONES_TIEMPO,?FASES,?CODMAQ)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_RECURSOS'
      'WHERE'
      '  RECURSO=?RECURSO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_RECURSOS WHERE EMPRESA= ?EMPRESA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_RECURSOS'
      'SET'
      '  TITULO=?TITULO '
      '  ,UNIDAD=?UNIDAD '
      '  ,TIPORECURSO=?TIPORECURSO '
      '  ,IMPORTE=?IMPORTE'
      '  ,PLANIFICABLE=?PLANIFICABLE'
      '  ,PORCEN_CAPACIDAD=?PORCEN_CAPACIDAD'
      '  ,ID_HORARIO=?ID_HORARIO'
      '  ,ID_RECURSO=?ID_RECURSO'
      '  ,OPERACIONES_NUM=?OPERACIONES_NUM'
      '  ,OPERACIONES_TIEMPO=?OPERACIONES_TIEMPO'
      '  ,FASES=?FASES'
      '  ,CODMAQ=?CODMAQ'
      'WHERE'
      '  RECURSO=?RECURSO AND '
      '  EMPRESA=?EMPRESA ')
    Plan.Strings = (
      'PLAN (PRO_RECURSOS NATURAL)')
    AfterDelete = Graba
    AfterOpen = QMProRecursosAfterOpen
    AfterPost = Graba
    BeforePost = QMProRecursosBeforePost
    OnNewRecord = QMProRecursosNewRecord
    ClavesPrimarias.Strings = (
      'RECURSO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_RECURSOS'
    UpdateTransaction = TLocal
    Left = 32
    Top = 8
    object QMProRecursosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProRecursosRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object QMProRecursosTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMProRecursosUNIDAD: TFIBStringField
      DisplayLabel = 'Unidad'
      FieldName = 'UNIDAD'
      Size = 2
    end
    object QMProRecursosTIPORECURSO: TFIBStringField
      DisplayLabel = 'Tipo Recurso'
      FieldName = 'TIPORECURSO'
      Size = 3
    end
    object QMProRecursosIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMProRecursosDescRecurso: TStringField
      DisplayLabel = 'Desc. Recurso'
      FieldKind = fkCalculated
      FieldName = 'DescRecurso'
      OnGetText = QMProRecursosDescRecursoGetText
      Size = 60
      Calculated = True
    end
    object QMProRecursosDescUnidad: TStringField
      DisplayLabel = 'Desc. Unidad'
      FieldKind = fkCalculated
      FieldName = 'DescUnidad'
      OnGetText = QMProRecursosDescUnidadGetText
      Size = 60
      Calculated = True
    end
    object QMProRecursosPLANIFICABLE: TIntegerField
      DisplayLabel = 'Planificable'
      FieldName = 'PLANIFICABLE'
    end
    object QMProRecursosPORCEN_CAPACIDAD: TFloatField
      DisplayLabel = '% Capac.'
      FieldName = 'PORCEN_CAPACIDAD'
    end
    object QMProRecursosID_HORARIO: TFIBStringField
      DisplayLabel = 'ID Horario'
      FieldName = 'ID_HORARIO'
      OnChange = QMProRecursosID_HORARIOChange
      Size = 3
    end
    object QMProRecursosID_RECURSO: TIntegerField
      DisplayLabel = 'ID Recurso'
      FieldName = 'ID_RECURSO'
    end
    object QMProRecursosOPERACIONES_NUM: TIntegerField
      DisplayLabel = 'Op. Num.'
      FieldName = 'OPERACIONES_NUM'
    end
    object QMProRecursosOPERACIONES_TIEMPO: TIntegerField
      DisplayLabel = 'Op. Tiempo'
      FieldName = 'OPERACIONES_TIEMPO'
    end
    object QMProRecursosImporteOperacion: TFloatField
      DisplayLabel = 'Importe Operacion'
      FieldKind = fkCalculated
      FieldName = 'ImporteOperacion'
      OnGetText = QMProRecursosImporteOperacionGetText
      Calculated = True
    end
    object QMProRecursosFASES: TFIBStringField
      DisplayLabel = 'Fases'
      FieldName = 'FASES'
      Size = 3
    end
    object QMProRecursosDescFase: TStringField
      DisplayLabel = 'Desc. Fase'
      FieldKind = fkCalculated
      FieldName = 'DescFase'
      OnGetText = QMProRecursosDescFaseGetText
      Calculated = True
    end
    object QMProRecursosCODMAQ: TIntegerField
      DisplayLabel = 'M'#225'quina'
      FieldName = 'CODMAQ'
    end
  end
  object DSQMProRecPre: TDataSource
    DataSet = QMProRecPre
    OnStateChange = DSQMProRecPreStateChange
    Left = 136
    Top = 56
  end
  object xRecurso: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select RECURSO,TITULO'
      'From Pro_Sys_Recursos'
      'Where Recurso=?TipoRecurso')
    UniDirectional = False
    DataSource = DSQMProRecursos
    Left = 32
    Top = 152
    object xRecursoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xRecursoRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 3
    end
  end
  object xTipoUnidad: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select TIPO,TITULO'
      'From Sys_Unidades_Articulos'
      'Where Tipo=?Unidad')
    UniDirectional = False
    DataSource = DSQMProRecursos
    Left = 32
    Top = 200
    object xTipoUnidadTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 25
    end
    object xTipoUnidadTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 2
    end
  end
  object QMProRecPre: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_REC_PRE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  RECURSO=?old_RECURSO AND '
      '  FECHA_INI=?old_FECHA_INI ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_REC_PRE'
      '  (FECHA_FIN,FECHA_INI,PRECIO_REA,PRECIO_EST,EMPRESA,RECURSO)'
      'VALUES'
      
        '  (?FECHA_FIN,?FECHA_INI,?PRECIO_REA,?PRECIO_EST,?EMPRESA,?RECUR' +
        'SO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_REC_PRE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  RECURSO=?RECURSO AND '
      '  FECHA_INI=?FECHA_INI ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_REC_PRE'
      'Where Empresa=?Empresa and Recurso=?Recurso')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_REC_PRE'
      'SET'
      '  FECHA_FIN=?FECHA_FIN '
      '  ,PRECIO_REA=?PRECIO_REA '
      '  ,PRECIO_EST=?PRECIO_EST '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  RECURSO=?RECURSO AND '
      '  FECHA_INI=?FECHA_INI ')
    DataSource = DSQMProRecursos
    Plan.Strings = (
      'PLAN (PRO_REC_PRE NATURAL)')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMProRecPreNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'RECURSO '
      'FECHA_INI ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_REC_PRE'
    UpdateTransaction = TLocal
    Left = 32
    Top = 56
    object QMProRecPreEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProRecPreRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object QMProRecPrePRECIO_EST: TFloatField
      DisplayLabel = 'Precio Estimado'
      FieldName = 'PRECIO_EST'
    end
    object QMProRecPrePRECIO_REA: TFloatField
      DisplayLabel = 'Precio Real'
      FieldName = 'PRECIO_REA'
    end
    object QMProRecPreFECHA_INI: TDateTimeField
      DisplayLabel = 'Fec. Inicio'
      FieldName = 'FECHA_INI'
    end
    object QMProRecPreFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fec. Final'
      FieldName = 'FECHA_FIN'
    end
  end
  object xHorarios: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'Select HORARIO,DESCRIPCION'
      'From OPE_HORARIOS'
      'Where horario=?id_horario')
    UniDirectional = False
    DataSource = DSQMProRecursos
    Left = 32
    Top = 104
    object xHorariosHORARIO: TFIBStringField
      DisplayLabel = 'Horario'
      FieldName = 'HORARIO'
      Size = 3
    end
    object xHorariosDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object DSxHorarios: TDataSource
    DataSet = xHorarios
    Left = 136
    Top = 104
  end
  object frProRecursos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado c'#243'digo barras'
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 248
    Top = 56
    ReportForm = {19000000}
  end
  object frDBLstRecursos: TfrDBDataSet
    DataSource = DSQMProRecursos
    Left = 248
    Top = 104
  end
end
