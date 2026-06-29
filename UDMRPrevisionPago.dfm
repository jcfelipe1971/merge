object DMRPrevisionPago: TDMRPrevisionPago
  OldCreateOrder = False
  OnCreate = DMRPrevisionPagoCreate
  OnDestroy = DMRPrevisionPagoDestroy
  Left = 663
  Top = 196
  Height = 568
  Width = 724
  object QMAsientos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM C_CREA_PREVISION_C_P'
      
        '(?EMPRESA, ?CANAL, ?DESDE, ?HASTA, ?SIGNO, ?MONEDA, ?FECHA, ?CLI' +
        'PROACR, ?TIPOTER, 0, 1)')
    UniDirectional = False
    AfterOpen = QMAsientosAfterOpen
    BeforeClose = QMAsientosBeforeClose
    Left = 48
    Top = 56
  end
  object DSAsientos: TDataSource
    DataSet = QMAsientos
    Left = 152
    Top = 56
  end
  object xVer_Proveedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_PROVEEDORES'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CAN AND'
      'PROVEEDOR = ?CODCLI')
    UniDirectional = False
    DataSource = DSAsientos
    AfterOpen = xVer_ProveedoresAfterOpen
    BeforeClose = xVer_ProveedoresBeforeClose
    BeforeOpen = xVer_ProveedoresBeforeOpen
    Left = 48
    Top = 104
  end
  object DSxVer_Proveedores: TDataSource
    DataSet = xVer_Proveedores
    Left = 152
    Top = 104
  end
  object frDBPrevisionPago: TfrDBDataSet
    DataSource = DSAsientos
    Left = 256
    Top = 56
  end
  object frHYPrevisionPago: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Previsi'#243'n de Pagos (C'#243'digo)'
    RebuildPrinter = False
    OnGetValue = frHYPrevisionPagoGetValue
    OnBeforePrint = frHYPrevisionPagoEnterRect
    OnEnterRect = frHYPrevisionPagoEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 256
    Top = 8
    ReportForm = {19000000}
  end
  object xVer_Acreedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_ACREEDORES'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CAN AND'
      'ACREEDOR = ?CODCLI')
    UniDirectional = False
    DataSource = DSAsientos
    AfterOpen = xVer_AcreedoresAfterOpen
    BeforeClose = xVer_AcreedoresBeforeClose
    BeforeOpen = xVer_AcreedoresBeforeOpen
    Left = 48
    Top = 152
  end
  object DSxVer_Acreedores: TDataSource
    DataSet = xVer_Acreedores
    Left = 152
    Top = 152
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 352
    Top = 8
  end
  object xAcreedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_ACREEDORES_EMPRESA'
      'WHERE '
      'EMPRESA = ?EMPRESA AND '
      'ACREEDOR = ?ACREEDOR')
    UniDirectional = False
    Left = 48
    Top = 248
  end
  object DSxAcreedor: TDataSource
    DataSet = xAcreedor
    Left = 152
    Top = 248
  end
  object xProveedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_PROVEEDORES_EMPRESA'
      'WHERE '
      'EMPRESA = ?EMPRESA AND '
      'PROVEEDOR = ?PROVEEDOR')
    UniDirectional = False
    Left = 48
    Top = 200
  end
  object DSxProveedor: TDataSource
    DataSet = xProveedor
    Left = 152
    Top = 200
  end
  object xFormaPago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
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
      'WHERE '
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'FORMA_PAGO = ?FORMA_PAGO')
    UniDirectional = False
    Left = 48
    Top = 296
  end
  object DSxFormaPago: TDataSource
    DataSet = xFormaPago
    Left = 152
    Top = 296
  end
  object xBanco: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT SB.TITULO'
      'FROM EMP_PROVEEDORES EP'
      'LEFT JOIN SYS_TERCEROS_BANCOS STB ON EP.TERCERO = STB.TERCERO'
      'LEFT JOIN SYS_BANCOS SB ON STB.PAIS = SB.PAIS AND STB.ENTIDAD = SB.ENTIDAD'
      'WHERE'
      '(STB.BANCO = 1 OR STB.BANCO IS NULL) AND'
      'EP.EMPRESA = 1 AND'
      'EP.PROVEEDOR = 1')
    UniDirectional = True
    Left = 48
    Top = 440
  end
  object xCuenta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT CUENTA FROM CON_CUENTAS_GES_PRO'
      'WHERE'
      'EMPRESA = 1 AND'
      'EJERCICIO = 2001 AND'
      'CANAL = 1 AND'
      'PROVEEDOR = 1')
    UniDirectional = True
    Left = 48
    Top = 488
  end
  object xCuentaTercerosProv: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'select cuenta from sys_terceros_bancos'
      'where '
      'tercero?=tercero'
      'banco=?banco'
      ''
      '')
    SelectSQL.Strings = (
      'SELECT FIRST (1) *'
      'FROM SYS_TERCEROS_BANCOS'
      'WHERE'
      'TERCERO = ?TERCERO AND'
      'ACTIVA = 1'
      'ORDER BY ORDEN  ')
    UniDirectional = False
    DataSource = DSxVer_Proveedores
    Left = 48
    Top = 344
  end
  object DSxCuentaTercerosProv: TDataSource
    DataSet = xCuentaTercerosProv
    Left = 152
    Top = 344
  end
  object xCuentaTercerosAcre: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'select cuenta from sys_terceros_bancos'
      'where '
      'tercero?=tercero'
      'banco=?banco'
      ''
      '')
    SelectSQL.Strings = (
      'SELECT FIRST (1) *'
      'FROM SYS_TERCEROS_BANCOS'
      'WHERE'
      'TERCERO = ?TERCERO AND'
      'ACTIVA = 1'
      'ORDER BY ORDEN')
    UniDirectional = False
    DataSource = DSxVer_Acreedores
    Left = 48
    Top = 392
  end
  object DSxCuentaTercerosAcre: TDataSource
    DataSet = xCuentaTercerosAcre
    Left = 152
    Top = 392
  end
  object frxHYPrevisionPago: TfrxHYReport
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
    OnBeforePrint = frxHYPrevisionPagoBeforePrint
    OnGetValue = frxHYPrevisionPagoGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 152
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 448
    Top = 8
  end
  object xDatosDTE: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT FOLIO, TIPO_DOC_TRIBUTARIO'
      'FROM GES_CABECERAS_E_FAC'
      'WHERE'
      'TIPO = :TIPO AND'
      'ID_E = :ID_DOC    ')
    SelectSQL.Strings = (
      'SELECT FOLIO, TIPO_DOC_TRIBUTARIO'
      'FROM GES_CABECERAS_E_FAC'
      'WHERE'
      'TIPO = :TIPO AND'
      'ID_E = :ID_DOC    ')
    UniDirectional = False
    DataSource = DSAsientos
    Left = 232
    Top = 456
  end
  object DSxDatosDTE: TDataSource
    DataSet = xDatosDTE
    Left = 318
    Top = 457
  end
end
