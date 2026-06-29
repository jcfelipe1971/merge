object DMLSTClientes: TDMLSTClientes
  OldCreateOrder = False
  OnCreate = DMLSTClientesCreate
  OnDestroy = DMLSTClientesDestroy
  Left = 330
  Top = 203
  Height = 637
  Width = 1059
  object frClientes: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frClientesGetValue
    OnBeforePrint = frClientesEnterRect
    OnEnterRect = frClientesEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 8
    ReportForm = {19000000}
  end
  object frDSQMClientes: TfrDBDataSet
    DataSource = DSQMClientes
    Left = 208
    Top = 56
  end
  object QMClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_CLIENTES_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'CLIENTE <= :MAXIMO AND'
      'CLIENTE >= :MINIMO'
      'ORDER BY CLIENTE')
    UniDirectional = False
    AfterOpen = QMClientesAfterOpen
    BeforeClose = QMClientesBeforeClose
    Left = 40
    Top = 56
  end
  object DSQMClientes: TDataSource
    DataSet = QMClientes
    Left = 120
    Top = 56
  end
  object QMTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_EDICION'
      '  WHERE TERCERO = ?TERCERO')
    UniDirectional = False
    DataSource = DSQMClientes
    Left = 40
    Top = 104
  end
  object DSQMTerceros: TDataSource
    DataSet = QMTerceros
    Left = 120
    Top = 104
  end
  object frDSQMTerceros: TfrDBDataSet
    DataSource = DSQMTerceros
    Left = 208
    Top = 104
  end
  object frDSQMJustifica: TfrDBDataSet
    DataSource = DSQMJustifica
    Left = 208
    Top = 152
  end
  object DSQMJustifica: TDataSource
    DataSet = QMJustifica
    Left = 120
    Top = 152
  end
  object QMJustifica: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO(?TERCERO)')
    UniDirectional = False
    DataSource = DSQMClientes
    Left = 40
    Top = 152
  end
  object QMFormasdePago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_GES_FP'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  FORMA_PAGO=?FORMA_PAGO ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_CUENTAS_GES_FP'
      '  WHERE EMPRESA=?EMPRESA AND'
      '                 EJERCICIO=?EJERCICIO AND'
      '                 CANAL=?CANAL AND'
      '                 FORMA_PAGO = ?FORMA_PAGO')
    UniDirectional = False
    DataSource = DSQMClientes
    Left = 40
    Top = 200
  end
  object DSFormasdePago: TDataSource
    DataSet = QMFormasdePago
    Left = 128
    Top = 200
  end
  object frDSQMFormasdePago: TfrDBDataSet
    DataSource = DSFormasdePago
    Left = 208
    Top = 200
  end
  object frDSQMIvaModos: TfrDBDataSet
    DataSource = DSIvaModos
    Left = 208
    Top = 248
  end
  object DSIvaModos: TDataSource
    DataSet = QMIvaModos
    Left = 120
    Top = 248
  end
  object QMIvaModos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_MODO_IVA'
      'WHERE'
      '  MODO=?MODO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_MODO_IVA'
      '  WHERE MODO = ?MODO_IVA')
    UniDirectional = False
    DataSource = DSQMClientes
    Left = 40
    Top = 248
  end
  object QMIRPF: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_IRPF'
      'WHERE'
      '  PAIS=?PAIS AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_IRPF'
      '  WHERE TIPO = ?TIPO_IRPF')
    UniDirectional = False
    DataSource = DSQMClientes
    Left = 40
    Top = 296
  end
  object DSIRPF: TDataSource
    DataSet = QMIRPF
    Left = 120
    Top = 296
  end
  object frDSQMIRPF: TfrDBDataSet
    DataSource = DSIRPF
    Left = 208
    Top = 296
  end
  object frDSQMTipoTerceros: TfrDBDataSet
    DataSource = DSTipoTerceros
    Left = 568
    Top = 8
  end
  object DSTipoTerceros: TDataSource
    DataSet = QMTipoTercero
    Left = 472
    Top = 8
  end
  object QMTipoTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPOS_TERCERO'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPOS_TERCERO')
    UniDirectional = False
    DataSource = DSQMClientes
    Left = 384
    Top = 8
  end
  object QSeleccion: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 472
    Top = 440
  end
  object QAgrupaciones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_AGRUPACIONES_CLI'
      'WHERE'
      '  AGRUPACION=?AGRUPACION AND '
      '  EMPRESA=?EMPRESA AND '
      '  CLIENTE=?CLIENTE ')
    SelectSQL.Strings = (
      'SELECT DISTINCT agrupacion, titulo FROM emp_agrupaciones_cli e'
      'join sys_agrupaciones s'
      'on (e.agrupacion=s.agrupacion)'
      'WHERE'
      '  ((e.empresa=?empresa) and'
      '   (s.tipo=?tipo) and'
      '   (s.Agrupacion=?agrupacion))')
    UniDirectional = False
    AfterOpen = QAgrupacionesAfterOpen
    BeforeClose = QAgrupacionesBeforeClose
    Left = 384
    Top = 56
  end
  object DSQAgrupaciones: TDataSource
    DataSet = QAgrupaciones
    Left = 472
    Top = 56
  end
  object frDSQAgrupaciones: TfrDBDataSet
    DataSource = DSQAgrupaciones
    Left = 568
    Top = 56
  end
  object QCliAgrup: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ver_clientes v'
      'JOIN emp_agrupaciones_cli e'
      'ON ((v.empresa=e.empresa and v.cliente=e.cliente))'
      'WHERE'
      '  ((e.empresa=?empresa) and'
      '   (v.ejercicio=?ejercicio) and '
      '   (v.canal=?canal) and'
      '   (e.agrupacion=?agrupacion))')
    UniDirectional = False
    DataSource = DSQAgrupaciones
    AfterOpen = QCliAgrupAfterOpen
    BeforeClose = QCliAgrupBeforeClose
    Left = 384
    Top = 104
  end
  object DSCliAgrup: TDataSource
    DataSet = QCliAgrup
    Left = 472
    Top = 104
  end
  object frDSCliAgrup: TfrDBDataSet
    DataSource = DSCliAgrup
    Left = 568
    Top = 104
  end
  object xTerceroAgrupacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_EDICION'
      '  WHERE TERCERO = ?TERCERO')
    UniDirectional = False
    DataSource = DSCliAgrup
    AfterOpen = xTerceroAgrupacionAfterOpen
    BeforeClose = xTerceroAgrupacionBeforeClose
    Left = 40
    Top = 392
  end
  object DSxTerceroagrupacon: TDataSource
    DataSet = xTerceroAgrupacion
    Left = 120
    Top = 392
  end
  object frDBxTerceroAgrupacion: TfrDBDataSet
    DataSource = DSxTerceroagrupacon
    Left = 280
    Top = 392
  end
  object xAgrupacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_AGRUPACIONES'
      'where agrupacion=?agrupacion')
    UniDirectional = False
    Left = 384
    Top = 248
  end
  object DSxAgrupacion: TDataSource
    DataSet = xAgrupacion
    Left = 472
    Top = 248
  end
  object xMinAgrup: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT min(agrupacion) as Agrupacion FROM VER_AGRUPACIONES'
      'where tipo='#39'C'#39)
    UniDirectional = False
    Left = 384
    Top = 440
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 208
    Top = 8
  end
  object xEtiquetas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM C_CREA_ETIQUETAS_CLI_PROV(?TERCERO,?DIRECCION,?VAC' +
        'IAS,?COPIAS)')
    UniDirectional = False
    Left = 384
    Top = 152
  end
  object DSxEtiquetas: TDataSource
    DataSet = xEtiquetas
    Left = 472
    Top = 152
  end
  object frDBxEtiquetas: TfrDBDataSet
    DataSource = DSxEtiquetas
    Left = 568
    Top = 152
  end
  object xLocalidad: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_LOCALIDADES'
      'where localidad=?dir_localidad')
    UniDirectional = False
    DataSource = DSxTerceroagrupacon
    Left = 40
    Top = 440
  end
  object DSxLocalidad: TDataSource
    DataSet = xLocalidad
    Left = 120
    Top = 440
  end
  object frDBClientesCP: TfrDBDataSet
    DataSource = DSQMClientesCP
    Left = 208
    Top = 344
  end
  object QMClientesCP: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_CLIENTES_CPOSTAL'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'COD_POSTAL >= :CP_MIN AND'
      'COD_POSTAL <= :CP_MAX'
      'ORDER BY COD_POSTAL, CLIENTE')
    UniDirectional = False
    Left = 40
    Top = 344
  end
  object DSQMClientesCP: TDataSource
    DataSet = QMClientesCP
    Left = 120
    Top = 344
  end
  object QMCPDesde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_LOCALIDADES'
      'WHERE'
      '  LOCALIDAD=?LOCALIDAD ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_LOCALIDADES'
      'WHERE CODIGO_POSTAL=?CP')
    UniDirectional = False
    Left = 384
    Top = 200
  end
  object DSQMCPDesde: TDataSource
    DataSet = QMCPDesde
    Left = 472
    Top = 200
  end
  object QMCPHasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_LOCALIDADES'
      'WHERE'
      '  LOCALIDAD=?LOCALIDAD ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_LOCALIDADES'
      'WHERE CODIGO_POSTAL=?CP')
    UniDirectional = False
    Left = 568
    Top = 200
  end
  object DSQMCPHasta: TDataSource
    DataSet = QMCPHasta
    Left = 568
    Top = 248
  end
  object QMinCPostal: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(CODIGO_POSTAL) AS MINIMO'
      'FROM SYS_LOCALIDADES')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 472
    Top = 392
  end
  object QMaxCPostal: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(CODIGO_POSTAL) AS MAXIMO'
      'FROM SYS_LOCALIDADES')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 568
    Top = 392
  end
  object xBancoCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPOS_TERCERO'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SYS_TERCEROS_BANCOS'
      'WHERE TERCERO = ?TERCERO AND '
      '  (MODO=0 OR MODO=2) AND ACTIVA = 1'
      'ORDER BY ORDEN')
    UniDirectional = False
    Left = 384
    Top = 296
  end
  object QNombreBanco: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT ENTIDAD, TITULO'
      'FROM SYS_BANCOS'
      'WHERE'
      'PAIS = :PAIS AND'
      'ENTIDAD = :ENTIDAD   ')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 384
    Top = 392
  end
  object frDSxBancoCliente: TfrDBDataSet
    DataSource = DSxBancoCliente
    Left = 568
    Top = 296
  end
  object DSxBancoCliente: TDataSource
    DataSet = xBancoCliente
    Left = 472
    Top = 296
  end
  object xFacturasMensual: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM G_VENTAS_MENSUALES_ANUALES(:EMPRESA, :EJERCICIO, :CANAL, :C' +
        'LIENTE, :MODO, :MONEDA, :TIPO, :ENTRADA)'
      'ORDER BY EJERCICIO DESC')
    UniDirectional = False
    Left = 704
    Top = 8
  end
  object DSxFacturasMensual: TDataSource
    DataSet = xFacturasMensual
    Left = 808
    Top = 8
  end
  object xFacturasMensualCompara: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM G_VENTAS_MENSUALES_ANUALES(:EMPRESA, :EJERCICIO, :CANAL, :C' +
        'LIENTE, :MODO, :MONEDA, :TIPO, :ENTRADA)'
      'ORDER BY EJERCICIO DESC')
    UniDirectional = False
    Left = 704
    Top = 56
  end
  object DSxFacturasMensualCompara: TDataSource
    DataSet = xFacturasMensualCompara
    Left = 808
    Top = 56
  end
  object xClienteTitulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT CLIENTE, TITULO'
      'FROM VER_CLIENTES'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'CLIENTE = :CLIENTE')
    UniDirectional = False
    Left = 704
    Top = 104
  end
  object DSxClienteTitulo: TDataSource
    DataSet = xClienteTitulo
    Left = 808
    Top = 104
  end
  object xFacturasAnual: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM G_VENTAS_MENSUALES_ANUALES(:EMPRESA, :EJERCICIO, :CANAL, :C' +
        'LIENTE, :MODO, :MONEDA, :TIPO, :ENTRADA)'
      'ORDER BY EJERCICIO DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 704
    Top = 152
  end
  object DSxFacturasAnual: TDataSource
    DataSet = xFacturasAnual
    Left = 808
    Top = 152
  end
  object xFacturasAnualCompara: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM G_VENTAS_MENSUALES_ANUALES(:EMPRESA, :EJERCICIO, :CANAL, :C' +
        'LIENTE, :MODO, :MONEDA, :TIPO, :ENTRADA)'
      'ORDER BY EJERCICIO DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 704
    Top = 200
  end
  object DSxFacturasAnualCompara: TDataSource
    DataSet = xFacturasAnualCompara
    Left = 808
    Top = 200
  end
  object xFacturasAnualC_1: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM G_VENTAS_MENSUALES_ANUALES(:EMPRESA, :EJERCICIO, :CANAL, :C' +
        'LIENTE, :MODO, :MONEDA, :TIPO, :ENTRADA)'
      'ORDER BY EJERCICIO DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 704
    Top = 248
  end
  object DSxFacturasAnualC_1: TDataSource
    DataSet = xFacturasAnualC_1
    Left = 808
    Top = 248
  end
  object xFacturasAnualC_2: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM G_VENTAS_MENSUALES_ANUALES(:EMPRESA, :EJERCICIO, :CANAL, :C' +
        'LIENTE, :MODO, :MONEDA, :TIPO, :ENTRADA)'
      'ORDER BY EJERCICIO DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 704
    Top = 296
  end
  object DSxFacturasAnualC_2: TDataSource
    DataSet = xFacturasAnualC_2
    Left = 808
    Top = 296
  end
  object xFacturasAnualC_3: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM G_VENTAS_MENSUALES_ANUALES(:EMPRESA, :EJERCICIO, :CANAL, :C' +
        'LIENTE, :MODO, :MONEDA, :TIPO, :ENTRADA)'
      'ORDER BY EJERCICIO DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 704
    Top = 344
  end
  object DSxFacturasAnualC_3: TDataSource
    DataSet = xFacturasAnualC_3
    Left = 808
    Top = 344
  end
  object xPrevisionMensual: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM G_VENT_PREV_MENSUALES_ANUALES(:EMPRESA, :EJERCICIO, :CANAL,' +
        ' :CLIENTE, :MODO, :MONEDA, :PORCENTAJE_VENTAS, :TIPO, :ENTRADA)'
      'ORDER BY EJERCICIO DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 704
    Top = 392
  end
  object DSxPrevisionMensual: TDataSource
    DataSet = xPrevisionMensual
    Left = 808
    Top = 392
  end
  object DSxPrevisionAnual: TDataSource
    DataSet = xPrevisionAnual
    Left = 808
    Top = 440
  end
  object xPrevisionAnual: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM G_VENT_PREV_MENSUALES_ANUALES(:EMPRESA, :EJERCICIO, :CANAL,' +
        ' :CLIENTE, :MODO, :MONEDA, :PORCENTAJE_VENTAS, :TIPO, :ENTRADA)'
      'ORDER BY EJERCICIO DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 704
    Top = 440
  end
  object frxClientes: TfrxHYReport
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
    OnBeforePrint = frxClientesBeforePrint
    OnGetValue = frxClientesGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 120
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDBClientesCP: TfrxDBDataset
    UserName = 'frxDBClientesCP'
    CloseDataSource = False
    DataSource = DSQMClientesCP
    Left = 280
    Top = 344
  end
  object frLstConsumo: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de reparaciones'
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 960
    Top = 8
    ReportForm = {19000000}
  end
  object frDBDetConsumo: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxLstDetConsumo
    Left = 960
    Top = 56
  end
  object xLstDetConsumo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from z_det_consumo'
      '/*where idcabconsumo=?idcabconsumo*/'
      'where cliente=?cliente and agrupacion=?agrupacion')
    UniDirectional = False
    Left = 960
    Top = 104
  end
  object DSxLstDetConsumo: TDataSource
    DataSet = xLstDetConsumo
    Left = 960
    Top = 152
  end
  object xLstTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select ter.*,prov.titulo from ver_terceros_edicion ter'
      
        'left join sys_localidades loc on (ter.dir_localidad=loc.localida' +
        'd)'
      
        'left join sys_provincias prov on (loc.pais=prov.pais and loc.pro' +
        'vincia=prov.provincia)'
      'where ter.tercero=?tercero')
    UniDirectional = False
    Left = 960
    Top = 200
  end
  object DSxLstTerceros: TDataSource
    DataSet = xLstTerceros
    Left = 960
    Top = 248
  end
  object xLstFirmas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT ID_DOC, TIPO, ID_FIRMA, NOMBRE, NIF, FECHA, COMENTARIO FR' +
        'OM GES_FIRMAS'
      'WHERE'
      'TIPO = :TIPO_FIRMA AND'
      'ID_DOC = :ID_CLIENTE  AND'
      'OCTET_LENGTH(COALESCE(FIRMA, '#39#39')) > 10'
      'ORDER BY ID_FIRMA')
    UniDirectional = False
    DataSource = DSQMClientes
    Left = 40
    Top = 488
  end
  object DSxLstFirmas: TDataSource
    DataSet = xLstFirmas
    Left = 120
    Top = 488
  end
  object frDBDLstFirmas: TfrDBDataSet
    DataSource = DSxLstFirmas
    Left = 208
    Top = 488
  end
  object xEmpresa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_EMPRESAS'
      'WHERE'
      'EMPRESA = :EMPRESA')
    UniDirectional = False
    DataSource = DSQMTerceros
    Left = 40
    Top = 536
  end
  object QMContactos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SYS_TERCEROS_CONTACTOS'
      'WHERE'
      'TERCERO = :TERCERO'
      'ORDER BY CONTACTO')
    UniDirectional = False
    DataSource = DSQMClientes
    Left = 384
    Top = 344
  end
  object DSQMContactos: TDataSource
    DataSet = QMContactos
    Left = 472
    Top = 344
  end
  object frDSQMContactos: TfrDBDataSet
    DataSource = DSQMContactos
    Left = 568
    Top = 344
  end
end
