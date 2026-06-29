object DMEtiqCli: TDMEtiqCli
  OldCreateOrder = False
  OnCreate = DMEtiqCliCreate
  OnDestroy = DMEtiqCliDestroy
  Left = 796
  Top = 190
  Height = 339
  Width = 513
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 186
    Top = 16
  end
  object QMEtiqCliCab: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_ETIQUETAS_CLI_CABECERA'
      'WHERE'
      '  NUMERO=?old_NUMERO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_ETIQUETAS_CLI_CABECERA'
      '  (EMPRESA,EJERCICIO,CANAL,NUMERO,TITULO)'
      'VALUES'
      '  (?EMPRESA,?EJERCICIO,?CANAL,?NUMERO,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_ETIQUETAS_CLI_CABECERA'
      'WHERE'
      '  NUMERO=?NUMERO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_ETIQUETAS_CLI_CABECERA'
      'where (empresa=?empresa) and (ejercicio=?ejercicio)'
      'and (canal=?canal)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_ETIQUETAS_CLI_CABECERA'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  NUMERO=?NUMERO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterOpen = QMEtiqCliCabAfterOpen
    AfterPost = Graba
    BeforeClose = QMEtiqCliCabBeforeClose
    BeforePost = QMEtiqCliCabBeforePost
    OnNewRecord = QMEtiqCliCabNewRecord
    ClavesPrimarias.Strings = (
      'NUMERO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_ETIQUETAS_CLI_CABECERA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 34
    Top = 74
    object QMEtiqCliCabEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEtiqCliCabEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMEtiqCliCabCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMEtiqCliCabNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
    end
    object QMEtiqCliCabTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSQMEtiqCliCab: TDataSource
    DataSet = QMEtiqCliCab
    Left = 130
    Top = 72
  end
  object QMEtiqCliDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ETIQUETAS_CLI'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  NUMERO=?old_NUMERO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ETIQUETAS_CLI'
      
        '  (EMPRESA,EJERCICIO,CANAL,NUMERO,LINEA,CLIENTE,NUM_COPIAS,TITUL' +
        'O,TERCERO,DIRECC)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?NUMERO,?LINEA,?CLIENTE,?NUM_COPIA' +
        'S,?TITULO,?TERCERO,?DIRECC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ETIQUETAS_CLI'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  NUMERO=?NUMERO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ETIQUETAS_CLI'
      'where (empresa=?empresa) and (ejercicio=?ejercicio)'
      'and (canal=?canal) and (numero=?numero)'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ETIQUETAS_CLI'
      'SET'
      '  CLIENTE=?CLIENTE '
      '  ,NUM_COPIAS=?NUM_COPIAS '
      '  ,TITULO=?TITULO '
      '  ,TERCERO=?TERCERO '
      '  ,DIRECC=?DIRECC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  NUMERO=?NUMERO AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMEtiqCliCab
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMEtiqCliDetalleNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'NUMERO '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ETIQUETAS_CLI'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 34
    Top = 128
    object QMEtiqCliDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEtiqCliDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMEtiqCliDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMEtiqCliDetalleNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
    end
    object QMEtiqCliDetalleLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMEtiqCliDetalleCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      OnChange = QMEtiqCliDetalleCLIENTEChange
    end
    object QMEtiqCliDetalleNUM_COPIAS: TIntegerField
      DisplayLabel = 'Nro. Copias'
      FieldName = 'NUM_COPIAS'
    end
    object QMEtiqCliDetalleTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMEtiqCliDetalleTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMEtiqCliDetalleDIRECC: TIntegerField
      DisplayLabel = 'Direcci'#243'n'
      FieldName = 'DIRECC'
    end
  end
  object DSQMEtiqCliDetalle: TDataSource
    DataSet = QMEtiqCliDetalle
    Left = 128
    Top = 128
  end
  object SPLineaSiguiente: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure G_CABECERA_LINEA_SIG_ETC'
      ' (?EMPRESA,?EJERCICIO,?CANAL,?NUMERO)')
    Transaction = TLocal
    AutoTrans = True
    Left = 354
    Top = 74
  end
  object QNomCliente: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select titulo from ver_clientes_ef'
      'where (empresa=?empresa) and (ejercicio=?ejercicio)'
      '  and (canal=?canal) and (cliente=?cliente)')
    Transaction = TLocal
    AutoTrans = True
    Left = 354
    Top = 128
  end
  object frEtiqCli: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frEtiqCliGetValue
    OnBeforePrint = frEtiqCliEnterRect
    OnEnterRect = frEtiqCliEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 36
    Top = 16
    ReportForm = {19000000}
  end
  object frDBQMEtiqCliDetalle: TfrDBDataSet
    DataSource = DSQMEtiqListado
    OnFirst = frDBQMEtiqCliDetalleFirst
    OnNext = frDBQMEtiqCliDetalleNext
    Left = 230
    Top = 184
  end
  object frUserDSEtiqCli: TfrUserDataset
    RangeEnd = reCount
    Left = 34
    Top = 244
  end
  object QMEtiqListado: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ETIQUETAS_CLI'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  NUMERO=?old_NUMERO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ETIQUETAS_CLI'
      
        '  (EMPRESA,EJERCICIO,CANAL,NUMERO,LINEA,CLIENTE,NUM_COPIAS,TITUL' +
        'O,TERCERO,DIRECC)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?NUMERO,?LINEA,?CLIENTE,?NUM_COPIA' +
        'S,?TITULO,?TERCERO,?DIRECC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ETIQUETAS_CLI'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  NUMERO=?NUMERO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ETIQUETAS_CLI'
      'where (empresa=?empresa) and (ejercicio=?ejercicio)'
      'and (canal=?canal) and (numero=?numero)'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ETIQUETAS_CLI'
      'SET'
      '  CLIENTE=?CLIENTE '
      '  ,NUM_COPIAS=?NUM_COPIAS '
      '  ,TITULO=?TITULO '
      '  ,TERCERO=?TERCERO'
      '  ,DIRECC=?DIRECC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  NUMERO=?NUMERO AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMEtiqCliCab
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMEtiqCliDetalleNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'NUMERO '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ETIQUETAS_CLI'
    UpdateTransaction = TLocal
    Left = 36
    Top = 186
    object QMEtiqListadoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEtiqListadoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMEtiqListadoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMEtiqListadoNUMERO: TIntegerField
      DisplayLabel = 'Nro.'
      FieldName = 'NUMERO'
    end
    object QMEtiqListadoLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMEtiqListadoCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMEtiqListadoNUM_COPIAS: TIntegerField
      DisplayLabel = 'Nro. Copias'
      FieldName = 'NUM_COPIAS'
    end
    object QMEtiqListadoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMEtiqListadoTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMEtiqListadoDIRECC: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECC'
    end
  end
  object DSQMEtiqListado: TDataSource
    DataSet = QMEtiqListado
    Left = 128
    Top = 184
  end
  object QDatosCliente: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure ut_justifica_un_domicilio(?tercero,?direcc)')
    Transaction = TLocal
    AutoTrans = True
    Left = 438
    Top = 72
  end
  object QDameTercero: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select tercero from emp_clientes'
      'where  (empresa=?empresa) and'
      '   (cliente=?cliente)')
    Transaction = TLocal
    AutoTrans = True
    Left = 438
    Top = 130
  end
  object SPAddAgrupacion: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure crea_etiquetas_clientes (?EMPRESA,?EJERCICIO,?' +
        'CANAL,?AGRUPACION)')
    Transaction = TLocal
    AutoTrans = True
    Left = 354
    Top = 186
  end
  object frxEtiqCli: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.9705409491
    ReportOptions.LastChange = 38691.9705409491
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxEtiqCliBeforePrint
    OnGetValue = frxEtiqCliGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 109
    Top = 17
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDBQMEtiqCliDetalle: TfrxDBDataset
    UserName = 'frxDBQMEtiqCliDetalle'
    OnFirst = frxDBQMEtiqCliDetalleFirst
    OnNext = frxDBQMEtiqCliDetalleNext
    CloseDataSource = False
    DataSource = DSQMEtiqListado
    Left = 232
    Top = 232
  end
  object frxUserDSEtiqCli: TfrxUserDataSet
    RangeEnd = reCount
    UserName = 'frxUserDSEtiqCli'
    Left = 120
    Top = 244
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 250
    Top = 16
  end
end
