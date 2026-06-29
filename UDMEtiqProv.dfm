object DMEtiqProv: TDMEtiqProv
  OldCreateOrder = False
  OnCreate = DMEtiqProvCreate
  OnDestroy = DMEtiqProvDestroy
  Left = 752
  Top = 213
  Height = 414
  Width = 511
  object QMEtiqProvCab: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_ETIQUETAS_PROV_CABECERA'
      'WHERE'
      '  NUMERO=?old_NUMERO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_ETIQUETAS_PROV_CABECERA'
      '  (EMPRESA,EJERCICIO,CANAL,NUMERO,TITULO)'
      'VALUES'
      '  (?EMPRESA,?EJERCICIO,?CANAL,?NUMERO,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_ETIQUETAS_PROV_CABECERA'
      'WHERE'
      '  NUMERO=?NUMERO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_ETIQUETAS_PROV_CABECERA'
      'where (empresa=?empresa) and (ejercicio=?ejercicio)'
      'and (canal=?canal)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_ETIQUETAS_PROV_CABECERA'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  NUMERO=?NUMERO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterOpen = QMEtiqProvCabAfterOpen
    AfterPost = Graba
    BeforePost = QMEtiqProvCabBeforePost
    OnNewRecord = QMEtiqProvCabNewRecord
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
    TableName = 'EMP_ETIQUETAS_PROV_CABECERA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 38
    Top = 72
    object QMEtiqProvCabEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEtiqProvCabEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMEtiqProvCabCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMEtiqProvCabNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
    end
    object QMEtiqProvCabTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSQMEtiqProvCab: TDataSource
    DataSet = QMEtiqProvCab
    Left = 158
    Top = 76
  end
  object QMEtiqProvDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ETIQUETAS_PROV'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  NUMERO=?old_NUMERO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ETIQUETAS_PROV'
      
        '  (EMPRESA,EJERCICIO,CANAL,NUMERO,LINEA,PROVEEDOR,NUM_COPIAS,TIT' +
        'ULO,TERCERO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?NUMERO,?LINEA,?PROVEEDOR,?NUM_COP' +
        'IAS,?TITULO,?TERCERO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ETIQUETAS_PROV'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  NUMERO=?NUMERO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ETIQUETAS_PROV'
      'where (empresa=?empresa) and (ejercicio=?ejercicio)'
      'and (canal=?canal) and (numero=?numero)'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ETIQUETAS_PROV'
      'SET'
      '  PROVEEDOR=?PROVEEDOR '
      '  ,NUM_COPIAS=?NUM_COPIAS '
      '  ,TITULO=?TITULO '
      '  ,TERCERO=?TERCERO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  NUMERO=?NUMERO AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMEtiqProvCab
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMEtiqProvDetalleNewRecord
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
    TableName = 'VER_ETIQUETAS_PROV'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 38
    Top = 128
    object QMEtiqProvDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEtiqProvDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMEtiqProvDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMEtiqProvDetalleNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
    end
    object QMEtiqProvDetalleLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMEtiqProvDetallePROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
      OnChange = QMEtiqProvDetallePROVEEDORChange
    end
    object QMEtiqProvDetalleNUM_COPIAS: TIntegerField
      DisplayLabel = 'Nro. Copias'
      FieldName = 'NUM_COPIAS'
    end
    object QMEtiqProvDetalleTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMEtiqProvDetalleTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
  end
  object DSQMEtiqProvDetalle: TDataSource
    DataSet = QMEtiqProvDetalle
    Left = 158
    Top = 132
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 176
    Top = 18
  end
  object frEtiqProv: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frEtiqProvGetValue
    OnBeforePrint = frEtiqProvEnterRect
    OnEnterRect = frEtiqProvEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 38
    Top = 16
    ReportForm = {19000000}
  end
  object frDBQMEtiqProvDetalle: TfrDBDataSet
    DataSource = DSQMEtiqListado
    OnFirst = frDBQMEtiqProvDetalleFirst
    OnNext = frDBQMEtiqProvDetalleNext
    Left = 274
    Top = 132
  end
  object frUserDSEtiqProv: TfrUserDataset
    RangeEnd = reCount
    Left = 158
    Top = 182
  end
  object QMEtiqListado: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ETIQUETAS_PROV'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  NUMERO=?old_NUMERO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ETIQUETAS_PROV'
      
        '  (EMPRESA,EJERCICIO,CANAL,NUMERO,LINEA,PROVEEDOR,NUM_COPIAS,TIT' +
        'ULO,TERCERO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?NUMERO,?LINEA,?PROVEEDOR,?NUM_COP' +
        'IAS,?TITULO,?TERCERO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ETIQUETAS_PROV'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  NUMERO=?NUMERO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ETIQUETAS_PROV'
      'where (empresa=?empresa) and (ejercicio=?ejercicio)'
      'and (canal=?canal) and (numero=?numero)'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ETIQUETAS_PROV'
      'SET'
      '  PROVEEDOR=?PROVEEDOR '
      '  ,NUM_COPIAS=?NUM_COPIAS '
      '  ,TITULO=?TITULO '
      '  ,TERCERO=?TERCERO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  NUMERO=?NUMERO AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMEtiqProvCab
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMEtiqProvDetalleNewRecord
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
    TableName = 'VER_ETIQUETAS_PROV'
    UpdateTransaction = TLocal
    Left = 30
    Top = 262
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
    object QMEtiqListadoPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
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
  end
  object DSQMEtiqListado: TDataSource
    DataSet = QMEtiqListado
    Left = 142
    Top = 260
  end
  object SPLineaSiguiente: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure G_CABECERA_LINEA_SIG_ETP'
      ' (?EMPRESA,?EJERCICIO,?CANAL,?NUMERO)')
    Transaction = TLocal
    AutoTrans = True
    Left = 272
    Top = 236
  end
  object QNomProv: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select titulo from ver_proveedores'
      'where (empresa=?empresa) and (ejercicio=?ejercicio)'
      '  and (canal=?canal) and (proveedor=?proveedor)')
    Transaction = TLocal
    AutoTrans = True
    Left = 272
    Top = 292
  end
  object QDatosProv: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure ut_justifica_un_domicilio(?tercero,1)')
    Transaction = TLocal
    AutoTrans = True
    Left = 364
    Top = 288
  end
  object SPAddAgrupacion: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure crea_etiquetas_proveedores (?EMPRESA,?EJERCICI' +
        'O,?CANAL,?AGRUPACION)')
    Transaction = TLocal
    AutoTrans = True
    Left = 364
    Top = 236
  end
  object frxEtiqProv: TfrxHYReport
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
    OnBeforePrint = frxEtiqProvBeforePrint
    OnGetValue = frxEtiqProvGetValue
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
  object frxDBQMEtiqProvDetalle: TfrxDBDataset
    UserName = 'frxDBQMEtiqProvDetalle'
    OnFirst = frxDBQMEtiqProvDetalleFirst
    OnNext = frxDBQMEtiqProvDetalleNext
    CloseDataSource = False
    DataSource = DSQMEtiqListado
    Left = 400
    Top = 132
  end
  object frxUserDSEtiqProv: TfrxUserDataSet
    RangeEnd = reCount
    UserName = 'frxUserDSEtiqProv'
    Left = 274
    Top = 182
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 240
    Top = 18
  end
end
