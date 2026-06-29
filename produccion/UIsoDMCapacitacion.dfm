object IsoDMCapacitacion: TIsoDMCapacitacion
  OldCreateOrder = False
  OnCreate = DMIsoCapacitacionCreate
  Left = 412
  Top = 222
  Height = 390
  Width = 475
  object QMIsoCapacitacionC: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_CAPACITACION_C'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  SECCION=?old_SECCION AND '
      '  EMPLEADO=?old_EMPLEADO ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_CAPACITACION_C'
      
        '  (EMPLEADO,SECCION,CAPACITACION,TOTAL_REAL,TOTAL_POSIBLE,EMPRES' +
        'A)'
      'VALUES'
      
        '  (?EMPLEADO,?SECCION,?CAPACITACION,?TOTAL_REAL,?TOTAL_POSIBLE,?' +
        'EMPRESA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_CAPACITACION_C'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  SECCION=?SECCION AND '
      '  EMPLEADO=?EMPLEADO ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_CAPACITACION_C'
      'order by empresa,empleado,seccion')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_CAPACITACION_C'
      'SET'
      '  CAPACITACION=?CAPACITACION '
      '  ,TOTAL_REAL=?TOTAL_REAL '
      '  ,TOTAL_POSIBLE=?TOTAL_POSIBLE '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  SECCION=?SECCION AND '
      '  EMPLEADO=?EMPLEADO ')
    AfterDelete = Graba
    AfterOpen = QMIsoCapacitacionCAfterOpen
    AfterPost = Graba
    OnNewRecord = QMIsoCapacitacionCNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'SECCION '
      'EMPLEADO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_CAPACITACION_C'
    UpdateTransaction = TLocal
    Left = 40
    Top = 16
    object QMIsoCapacitacionCEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
      OnChange = QMIsoCapacitacionCEMPLEADOChange
    end
    object QMIsoCapacitacionCSECCION: TFIBStringField
      DisplayLabel = 'Secci'#243'n'
      FieldName = 'SECCION'
      OnChange = QMIsoCapacitacionCSECCIONChange
      Size = 3
    end
    object QMIsoCapacitacionCCAPACITACION: TFloatField
      DisplayLabel = 'Capacitaci'#243'n'
      FieldName = 'CAPACITACION'
    end
    object QMIsoCapacitacionCTOTAL_REAL: TIntegerField
      DisplayLabel = 'Total Real'
      FieldName = 'TOTAL_REAL'
    end
    object QMIsoCapacitacionCTOTAL_POSIBLE: TIntegerField
      DisplayLabel = 'Total Posible'
      FieldName = 'TOTAL_POSIBLE'
    end
    object QMIsoCapacitacionCEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
  end
  object DSQMIsoCapacitacionC: TDataSource
    DataSet = QMIsoCapacitacionC
    Left = 168
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 312
    Top = 16
  end
  object xEmpleado: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMPLEADOS_EF'
      'where empleado=:empleado and ACTIVO=1')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMIsoCapacitacionC
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMPLEADOS_EF'
    UpdateTransaction = TLocal
    Left = 40
    Top = 112
    object xEmpleadoEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object xEmpleadoTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xEmpleadoTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xEmpleadoNIF: TFIBStringField
      DisplayLabel = 'NIF'
      FieldName = 'NIF'
    end
  end
  object DSxEmpleado: TDataSource
    DataSet = xEmpleado
    Left = 168
    Top = 112
  end
  object QMIsoCapacitacionD: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_CAPACITACION_D'
      'WHERE'
      '  TAREA=?old_TAREA AND '
      '  EMPLEADO=?old_EMPLEADO AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  SECCION=?old_SECCION ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_CAPACITACION_D'
      '  (CAPACITACION,TAREA,EMPRESA,SECCION,EMPLEADO)'
      'VALUES'
      '  (?CAPACITACION,?TAREA,?EMPRESA,?SECCION,?EMPLEADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_CAPACITACION_D'
      'WHERE'
      '  TAREA=?TAREA AND '
      '  EMPLEADO=?EMPLEADO AND '
      '  EMPRESA=?EMPRESA AND '
      '  SECCION=?SECCION ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_CAPACITACION_D'
      
        'where empresa=?empresa and empleado=?empleado and seccion=?secci' +
        'on'
      'order by empresa,empleado,seccion,linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_CAPACITACION_D'
      'SET'
      '  CAPACITACION=?CAPACITACION '
      'WHERE'
      '  TAREA=?old_TAREA AND '
      '  EMPLEADO=?old_EMPLEADO AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  SECCION=?old_SECCION ')
    DataSource = DSQMIsoCapacitacionC
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMIsoCapacitacionDNewRecord
    ClavesPrimarias.Strings = (
      'TAREA '
      'EMPLEADO '
      'EMPRESA '
      'SECCION ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_CAPACITACION_D'
    UpdateTransaction = TLocal
    Left = 40
    Top = 64
    object QMIsoCapacitacionDCAPACITACION: TIntegerField
      DisplayLabel = 'Capacitaci'#243'n'
      FieldName = 'CAPACITACION'
    end
    object QMIsoCapacitacionDTAREA: TIntegerField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      OnChange = QMIsoCapacitacionDTAREAChange
    end
    object QMIsoCapacitacionDDescTarea: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldKind = fkCalculated
      FieldName = 'DescTarea'
      OnGetText = QMIsoCapacitacionDDescTareaGetText
      Size = 40
      Calculated = True
    end
    object QMIsoCapacitacionDEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMIsoCapacitacionDSECCION: TFIBStringField
      DisplayLabel = 'Secci'#243'n'
      FieldName = 'SECCION'
      Size = 3
    end
    object QMIsoCapacitacionDEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
  end
  object DSQMIsoCapacitacionD: TDataSource
    DataSet = QMIsoCapacitacionD
    Left = 168
    Top = 64
  end
  object xSeccion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_SECCIONES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  SECCION=?old_SECCION ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_SECCIONES'
      
        '  (CAPACITACION,TAREA,TOTAL_POSIBLE,TOTAL_REAL,NPERSONAS,NTAREAS' +
        ',DESCRIPCION,EMPRESA,SECCION)'
      'VALUES'
      
        '  (?CAPACITACION,?TAREA,?TOTAL_POSIBLE,?TOTAL_REAL,?NPERSONAS,?N' +
        'TAREAS,?DESCRIPCION,?EMPRESA,?SECCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_SECCIONES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  SECCION=?SECCION ')
    SelectSQL.Strings = (
      'SELECT * FROM OPE_SECCIONES'
      'where empresa=?empresa '
      '   and seccion=?seccion')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_SECCIONES'
      'SET'
      '  CAPACITACION=?CAPACITACION '
      '  ,TAREA=?TAREA '
      '  ,TOTAL_POSIBLE=?TOTAL_POSIBLE '
      '  ,TOTAL_REAL=?TOTAL_REAL '
      '  ,NPERSONAS=?NPERSONAS '
      '  ,NTAREAS=?NTAREAS '
      '  ,DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  SECCION=?SECCION ')
    DataSource = DSQMIsoCapacitacionC
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'SECCION ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_SECCIONES'
    UpdateTransaction = TLocal
    Left = 40
    Top = 160
    object xSeccionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xSeccionSECCION: TFIBStringField
      DisplayLabel = 'Secci'#243'n'
      FieldName = 'SECCION'
      Size = 3
    end
    object xSeccionDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
  end
  object DSxSeccion: TDataSource
    DataSet = xSeccion
    Left = 168
    Top = 160
  end
  object xTarea: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_SECCIONES_D'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  SECCION=?old_SECCION AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_SECCIONES_D'
      
        '  (POLIVALENCIA,TOTAL_POSIBLE,TOTAL_REAL,DESCRIPCION,LINEA,EMPRE' +
        'SA,SECCION)'
      'VALUES'
      
        '  (?POLIVALENCIA,?TOTAL_POSIBLE,?TOTAL_REAL,?DESCRIPCION,?LINEA,' +
        '?EMPRESA,?SECCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_SECCIONES_D'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  SECCION=?SECCION AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM OPE_SECCIONES_D'
      'where seccion=?seccion and empresa=?empresa and linea=?tarea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_SECCIONES_D'
      'SET'
      '  POLIVALENCIA=?POLIVALENCIA '
      '  ,TOTAL_POSIBLE=?TOTAL_POSIBLE '
      '  ,TOTAL_REAL=?TOTAL_REAL '
      '  ,DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  SECCION=?SECCION AND '
      '  LINEA=?LINEA ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'SECCION '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_SECCIONES_D'
    UpdateTransaction = TLocal
    Left = 40
    Top = 208
    object xTareaSECCION: TFIBStringField
      DisplayLabel = 'Secci'#243'n'
      FieldName = 'SECCION'
      Size = 3
    end
    object xTareaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTareaLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object xTareaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object DSxTarea: TDataSource
    DataSet = xTarea
    Left = 168
    Top = 208
  end
  object frIsoCapacitacion: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Capactiacion/Polivalencia'
    RebuildPrinter = False
    OnGetValue = frIsoCapacitacionGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 312
    Top = 64
    ReportForm = {19000000}
  end
end
