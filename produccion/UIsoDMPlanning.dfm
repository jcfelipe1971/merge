object IsoDMPlanning: TIsoDMPlanning
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 401
  Top = 70
  Height = 423
  Width = 573
  object TLocal: TFIBTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 216
    Top = 32
  end
  object QMCabPlanning: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_CAB_PLANNING'
      'WHERE'
      '  RIG=?old_RIG AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_CAB_PLANNING'
      
        '  (EMPRESA,EJERCICIO,RIG,FECHA,NOTAS,TOTAL_COSTE,ISO_APROBADO,IS' +
        'O_VERIFICADO,ISO_VALIDADO,ENTRADA,DESCRIPCION,ID_CAB_PLANNING)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?RIG,?FECHA,?NOTAS,?TOTAL_COSTE,?ISO_APRO' +
        'BADO,?ISO_VERIFICADO,?ISO_VALIDADO,?ENTRADA,?DESCRIPCION,?ID_CAB' +
        '_PLANNING)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_CAB_PLANNING'
      'WHERE'
      '  RIG=?RIG AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_CAB_PLANNING'
      'WHERE '
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO '
      'ORDER BY RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_CAB_PLANNING'
      'SET'
      '  FECHA=?FECHA '
      '  ,NOTAS=?NOTAS '
      '  ,TOTAL_COSTE=?TOTAL_COSTE '
      '  ,ISO_APROBADO=?ISO_APROBADO '
      '  ,ISO_VERIFICADO=?ISO_VERIFICADO '
      '  ,ISO_VALIDADO=?ISO_VALIDADO '
      '  ,ENTRADA=?ENTRADA'
      ' ,DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  RIG=?RIG AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterOpen = QMCabPlanningAfterOpen
    BeforeClose = QMCabPlanningBeforeClose
    BeforePost = QMCabPlanningBeforePost
    OnNewRecord = QMCabPlanningNewRecord
    ClavesPrimarias.Strings = (
      'RIG '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_CAB_PLANNING'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 32
    object QMCabPlanningEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabPlanningEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCabPlanningRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCabPlanningFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCabPlanningNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMCabPlanningTOTAL_COSTE: TFloatField
      DisplayLabel = 'Total Coste'
      FieldName = 'TOTAL_COSTE'
    end
    object QMCabPlanningISO_APROBADO: TIntegerField
      DisplayLabel = 'ISO Aprobado'
      FieldName = 'ISO_APROBADO'
    end
    object QMCabPlanningISO_VERIFICADO: TIntegerField
      DisplayLabel = 'ISO Verificado'
      FieldName = 'ISO_VERIFICADO'
    end
    object QMCabPlanningISO_VALIDADO: TIntegerField
      DisplayLabel = 'ISO Validado'
      FieldName = 'ISO_VALIDADO'
    end
    object QMCabPlanningENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMCabPlanningDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 200
    end
    object QMCabPlanningID_CAB_PLANNING: TIntegerField
      DisplayLabel = 'Id Cab. Planning'
      FieldName = 'ID_CAB_PLANNING'
    end
  end
  object DSCabPlanning: TDataSource
    DataSet = QMCabPlanning
    Left = 128
    Top = 32
  end
  object DSDetPlanning: TDataSource
    DataSet = QMDetPlanning
    Left = 128
    Top = 80
  end
  object QMDetPlanning: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_DET_PLANNING'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_DET_PLANNING'
      
        '  (FECHA,COSTE,LINEA,RIG,EVALUACION,IMPARTIDOR,ACCION,EJERCICIO,' +
        'EMPRESA,FECHA_INICIO,FECHA_FIN,ID_CURSO)'
      'VALUES'
      
        '  (?FECHA,?COSTE,?LINEA,?RIG,?EVALUACION,?IMPARTIDOR,?ACCION,?EJ' +
        'ERCICIO,?EMPRESA,?FECHA_INICIO,?FECHA_FIN,?ID_CURSO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_DET_PLANNING'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM ISO_DET_PLANNING'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'RIG = ?RIG'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_DET_PLANNING'
      'SET'
      '  FECHA=?FECHA '
      '  ,COSTE=?COSTE '
      '  ,EVALUACION=?EVALUACION '
      '  ,IMPARTIDOR=?IMPARTIDOR '
      '  ,ACCION=?ACCION '
      '  ,FECHA_INICIO=?FECHA_INICIO '
      '  ,FECHA_FIN=?FECHA_FIN '
      '  ,ID_CURSO=?ID_CURSO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    DataSource = DSCabPlanning
    AfterOpen = QMDetPlanningAfterOpen
    BeforeClose = QMDetPlanningBeforeClose
    OnNewRecord = QMDetPlanningNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'RIG '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_DET_PLANNING'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 80
    object QMDetPlanningEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetPlanningEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetPlanningRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDetPlanningLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMDetPlanningACCION: TFIBStringField
      DisplayLabel = 'Acci'#243'n Formativa'
      FieldName = 'ACCION'
      Size = 100
    end
    object QMDetPlanningIMPARTIDOR: TFIBStringField
      DisplayLabel = 'Impartidor'
      FieldName = 'IMPARTIDOR'
      Size = 100
    end
    object QMDetPlanningCOSTE: TFloatField
      DisplayLabel = 'Coste'
      FieldName = 'COSTE'
    end
    object QMDetPlanningFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMDetPlanningEVALUACION: TIntegerField
      DisplayLabel = 'Evaluaci'#243'n'
      FieldName = 'EVALUACION'
    end
    object QMDetPlanningFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fecha Inicio'
      FieldName = 'FECHA_INICIO'
    end
    object QMDetPlanningFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fecha Fin'
      FieldName = 'FECHA_FIN'
    end
    object QMDetPlanningID_CURSO: TIntegerField
      DisplayLabel = 'ID Curso'
      FieldName = 'ID_CURSO'
      OnChange = QMDetPlanningID_CURSOChange
    end
    object QMDetPlanningDescCurso: TStringField
      DisplayLabel = 'Descripci'#243'n Curso'
      FieldKind = fkCalculated
      FieldName = 'DescCurso'
      OnGetText = QMDetPlanningDescCursoGetText
      Size = 100
      Calculated = True
    end
  end
  object frPlanning: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de planning de formaci'#243'n'
    RebuildPrinter = False
    OnGetValue = frPlanningGetValue
    OnBeforePrint = frPlanningEnterRect
    OnEnterRect = frPlanningEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 352
    Top = 32
    ReportForm = {19000000}
  end
  object frDBCabPlanning: TfrDBDataSet
    DataSource = DSCabPlanning
    Left = 352
    Top = 80
  end
  object frDBDetPlanning: TfrDBDataSet
    DataSource = DSDetPlanning
    Left = 352
    Top = 128
  end
  object xDescCurso: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select descripcion, profesor from iso_cursos'
      'where empresa=?empresa and id_curso=?id_curso')
    UniDirectional = False
    DataSource = DSDetPlanning
    Left = 40
    Top = 176
    object xDescCursoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object xDescCursoPROFESOR: TFIBStringField
      DisplayLabel = 'Profesor'
      FieldName = 'PROFESOR'
      Size = 100
    end
  end
  object QMRelEmplCursos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_REL_EMPL_CURSOS'
      'WHERE'
      '  ID_EMPLEADO=?old_ID_EMPLEADO AND '
      '  ID_CURSO=?old_ID_CURSO AND '
      '  LINEA_DET=?old_LINEA_DET AND '
      '  RIG_DET=?old_RIG_DET AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_REL_EMPL_CURSOS'
      
        '  (EMPRESA,EJERCICIO,ID_CURSO,ID_EMPLEADO,APTO,RIG_DET,LINEA_DET' +
        ')'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?ID_CURSO,?ID_EMPLEADO,?APTO,?RIG_DET,?LI' +
        'NEA_DET)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_REL_EMPL_CURSOS'
      'WHERE'
      '  ID_EMPLEADO=?ID_EMPLEADO AND '
      '  ID_CURSO=?ID_CURSO AND '
      '  LINEA_DET=?LINEA_DET AND '
      '  RIG_DET=?RIG_DET AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM ISO_REL_EMPL_CURSOS'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'RIG_DET = ?RIG AND'
      'LINEA_DET = ?LINEA AND'
      'ID_CURSO = ?ID_CURSO'
      'ORDER BY ID_EMPLEADO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_REL_EMPL_CURSOS'
      'SET'
      '  APTO=?APTO '
      'WHERE'
      '  ID_EMPLEADO=?ID_EMPLEADO AND '
      '  ID_CURSO=?ID_CURSO AND '
      '  LINEA_DET=?LINEA_DET AND '
      '  RIG_DET=?RIG_DET AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSDetPlanning
    BeforeInsert = QMRelEmplCursosBeforeInsert
    OnNewRecord = QMRelEmplCursosNewRecord
    ClavesPrimarias.Strings = (
      'ID_EMPLEADO '
      'ID_CURSO '
      'LINEA_DET '
      'RIG_DET '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_REL_EMPL_CURSOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 128
    object QMRelEmplCursosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMRelEmplCursosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMRelEmplCursosRIG_DET: TIntegerField
      DisplayLabel = 'RIG Det.'
      FieldName = 'RIG_DET'
    end
    object QMRelEmplCursosLINEA_DET: TIntegerField
      DisplayLabel = 'L'#237'nea Det.'
      FieldName = 'LINEA_DET'
    end
    object QMRelEmplCursosID_CURSO: TIntegerField
      DisplayLabel = 'ID Curso'
      FieldName = 'ID_CURSO'
    end
    object QMRelEmplCursosID_EMPLEADO: TIntegerField
      DisplayLabel = 'ID Empleado'
      FieldName = 'ID_EMPLEADO'
      OnChange = QMRelEmplCursosID_EMPLEADOChange
    end
    object QMRelEmplCursosDescEmpleado: TStringField
      DisplayLabel = 'Descripci'#243'n Empleado'
      FieldKind = fkCalculated
      FieldName = 'DescEmpleado'
      OnGetText = QMRelEmplCursosDescEmpleadoGetText
      Size = 60
      Calculated = True
    end
    object QMRelEmplCursosAPTO: TIntegerField
      DisplayLabel = 'Apto'
      FieldName = 'APTO'
      OnChange = QMRelEmplCursosAPTOChange
    end
    object QMRelEmplCursosDescApto: TStringField
      DisplayLabel = 'Descripci'#243'n Apto'
      FieldKind = fkCalculated
      FieldName = 'DescApto'
      OnGetText = QMRelEmplCursosDescAptoGetText
      Size = 40
      Calculated = True
    end
  end
  object DSQMRelEmplCursos: TDataSource
    DataSet = QMRelEmplCursos
    Left = 128
    Top = 128
  end
  object xDescEmpleado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from VER_EMPLEADOS_EF'
      'where empresa=?empresa and empleado=?id_empleado')
    UniDirectional = False
    DataSource = DSQMRelEmplCursos
    Left = 40
    Top = 224
    object xDescEmpleadoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xDescResultados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select nombre from iso_empl_resultados'
      'where id_resultado=?apto')
    UniDirectional = False
    DataSource = DSQMRelEmplCursos
    Left = 40
    Top = 272
    object xDescResultadosNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 40
    end
  end
  object frDBRelEmplCurso: TfrDBDataSet
    DataSource = DSQMRelEmplCursos
    Left = 352
    Top = 176
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 216
    Top = 80
  end
end
