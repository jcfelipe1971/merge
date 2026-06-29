object DMRPrevisionCobro: TDMRPrevisionCobro
  OldCreateOrder = False
  OnCreate = DMRPrevisionCobroCreate
  OnDestroy = DMRPrevisionCobroDestroy
  Left = 435
  Top = 247
  Height = 569
  Width = 811
  object DSAsientos: TDataSource
    DataSet = QMAsientos
    Left = 152
    Top = 56
  end
  object QMAsientos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT *'
      'FROM C_CREA_PREVISION_C_P'
      
        '(?EMPRESA, ?CANAL, ?DESDE, ?HASTA, ?SIGNO, ?MONEDA, ?FECHA, ?CLI' +
        'PROACR, ?TIPOTER, ?IMPAGADOS, ?RECIBIDOS)')
    UniDirectional = False
    AfterOpen = QMAsientosAfterOpen
    AfterScroll = QMAsientosAfterScroll
    BeforeClose = QMAsientosBeforeClose
    Left = 40
    Top = 56
  end
  object frDBPrevisionCobro: TfrDBDataSet
    DataSource = DSAsientos
    Left = 264
    Top = 56
  end
  object xVer_Clientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_CLIENTES_CUENTAS'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CAN AND'
      'CLIENTE = ?COD_CLI')
    UniDirectional = False
    DataSource = DSAsientos
    BeforeOpen = xVer_ClientesBeforeOpen
    Left = 40
    Top = 152
  end
  object DSxClientes: TDataSource
    DataSet = xVer_Clientes
    Left = 152
    Top = 152
  end
  object frHYPrevisionCobro: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frHYPrevisionCobroGetValue
    OnBeforePrint = frHYPrevisionCobroEnterRect
    OnEnterRect = frHYPrevisionCobroEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 264
    Top = 8
    ReportForm = {19000000}
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 376
    Top = 8
  end
  object DSxVer_agentes: TDataSource
    DataSet = xVer_agentes
    Left = 152
    Top = 296
  end
  object xVer_agentes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_AGENTES_CUENTAS'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'AGENTE = ?AGENTE')
    UniDirectional = False
    DataSource = DSAsientos_age
    Left = 40
    Top = 296
  end
  object xTercerosDireccion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM UT_JUSTIFICA_DOMICILIO(:TERCERO)'
      'WHERE'
      'DIR_CLASE <> 2'
      'ORDER BY DIR_CLASE DESC, DIR_DEFECTO DESC')
    UniDirectional = False
    Left = 40
    Top = 200
  end
  object DSxTercerosDireccion: TDataSource
    DataSet = xTercerosDireccion
    Left = 152
    Top = 200
  end
  object xCuentaTerceros: TFIBDataSetRO
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
      
        'SELECT ORDEN, CAST(BANCO AS INTEGER) BANCO, TITULO, ENTIDAD, SUC' +
        'URSAL, CONTROL, CUENTA, IBAN, BIC'
      'FROM SYS_TERCEROS_BANCOS'
      'WHERE'
      'TERCERO = :TERCERO AND'
      'MODO IN (0, 2) AND'
      '((:BANCO_CLI = 0) OR (BANCO = :BANCO_CLI)) AND'
      'ACTIVA = 1'
      ''
      'UNION'
      ''
      
        'SELECT CAST(1 AS SMALLINT) ORDEN, BANCO, CAST(SUBSTRING(TITULO F' +
        'ROM 1 FOR 40) AS VARCHAR(40)) TITULO, ENTIDAD, SUCURSAL,'
      '       CONTROL, CUENTA_CORRIENTE, IBAN, BIC'
      'FROM EMP_BANCOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'BANCO = :BANCO AND'
      'ACTIVO = 1'
      'ORDER BY 1')
    UniDirectional = False
    Left = 40
    Top = 344
  end
  object DSxCuentaTerceros: TDataSource
    DataSet = xCuentaTerceros
    Left = 152
    Top = 344
  end
  object DSAsientos_age: TDataSource
    DataSet = QMAsientos_age
    Left = 152
    Top = 104
  end
  object QMAsientos_age: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM C_CREA_PREVISION_C_P_AGE'
      
        '(?EMPRESA, ?CANAL, ?DESDE, ?HASTA, ?MONEDA, ?FECHA, ?AGENTE, ?IM' +
        'PAGADOS, ?RECIBIDOS)')
    UniDirectional = False
    AfterOpen = QMAsientos_ageAfterOpen
    AfterScroll = QMAsientosAfterScroll
    BeforeClose = QMAsientos_ageBeforeClose
    Left = 40
    Top = 104
  end
  object frDSQMAsientos_age: TfrDBDataSet
    DataSource = DSAsientos_age
    Left = 264
    Top = 104
  end
  object frxHYPrevisionCobro: TfrxHYReport
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
    OnBeforePrint = frxHYPrevisionCobroBeforePrint
    OnGetValue = frxHYPrevisionCobroGetValue
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
    Left = 496
    Top = 8
  end
  object xTercerosDirPral: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM UT_JUSTIFICA_DOMICILIO(:TERCERO)'
      'WHERE'
      'DIR_DEFECTO = 1')
    UniDirectional = False
    Left = 40
    Top = 248
  end
  object DSxTercerosDirPral: TDataSource
    DataSet = xTercerosDirPral
    Left = 152
    Top = 248
  end
  object xCarteraDetalle: TFIBDataSetRO
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
      'SELECT *'
      'FROM EMP_CARTERA_DETALLE'
      'WHERE'
      'ID_CARTERA_DETALLE = :ID_CARTERA_DETALLE')
    UniDirectional = False
    Left = 40
    Top = 392
  end
  object DSxCarteraDetalle: TDataSource
    DataSet = xCarteraDetalle
    Left = 152
    Top = 392
  end
  object xDatosDTE: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT FOLIO, TIPO_DOC_TRIBUTARIO'
      'FROM GES_CABECERAS_S_FAC'
      'WHERE'
      'TIPO = :TIPO AND'
      'ID_S = :ID_DOC')
    SelectSQL.Strings = (
      'SELECT FOLIO, TIPO_DOC_TRIBUTARIO'
      'FROM GES_CABECERAS_S_FAC'
      'WHERE'
      'TIPO = :TIPO AND'
      'ID_S = :ID_DOC')
    UniDirectional = False
    DataSource = DSAsientos
    Left = 40
    Top = 472
  end
  object DSxDatosDTE: TDataSource
    DataSet = xDatosDTE
    Left = 144
    Top = 472
  end
end
