object DMRSumasySaldos: TDMRSumasySaldos
  OldCreateOrder = False
  OnCreate = DMRSumasYSaldosCreate
  OnDestroy = DMRSumasySaldosDestroy
  Left = 699
  Top = 279
  Height = 346
  Width = 524
  object TSBalance: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      '/* Se define dinamicamente */'
      'SELECT T.*,'
      '       CASE'
      '         WHEN ((T.DEBE - T.HABER) > 0) THEN'
      '             (T.DEBE - T.HABER)'
      '         ELSE 0'
      '       END SALDO_DEUDOR,'
      '       CASE'
      '         WHEN ((T.DEBE - T.HABER) < 0) THEN'
      '             (T.HABER - T.DEBE)'
      '         ELSE 0'
      '       END SALDO_ACREEDOR'
      'FROM TMP_CON_BALANCES_SS_SUPERIOR T'
      
        'JOIN CON_CUENTAS C ON T.EMPRESA = C.EMPRESA AND T.EJERCICIO = C.' +
        'EJERCICIO AND T.CANAL = C.CANAL AND T.CUENTA = C.CUENTA AND T.CU' +
        'ENTA_PGC = C.PGC'
      'WHERE'
      'T.EMPRESA = :EMPRESA AND'
      'T.EJERCICIO = :EJERCICIO'
      
        'AND ((CANAL = 1) OR (CANAL = 2)) /*DMMultiSeleccion.WhereCanales' +
        '()*/'
      'AND T.USUARIO = :USUARIO AND'
      'T.NIVEL BETWEEN :NIVEL_INI AND :NIVEL_FIN'
      'ORDER BY T.CUENTA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_CON_BALANCES_SS_SUPERIOR'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
  end
  object TSBalance_Medio: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT T.*,'
      '       CASE'
      '         WHEN ((T.DEBE - T.HABER) > 0) THEN'
      '             (T.DEBE - T.HABER)'
      '         ELSE 0'
      '       END SALDO_DEUDOR,'
      '       CASE'
      '         WHEN ((T.DEBE - T.HABER) < 0) THEN'
      '             (T.HABER - T.DEBE)'
      '         ELSE 0'
      '       END SALDO_ACREEDOR'
      'FROM TMP_CON_BALANCES_SS_SUPERIOR T'
      'WHERE'
      'T.EMPRESA = :EMPRESA AND'
      'T.EJERCICIO = :EJERCICIO AND'
      'T.CANAL = :CANAL AND'
      'T.USUARIO = :USUARIO AND'
      'T.CUENTA STARTING WITH :CUENTA AND'
      'T.NIVEL > :NIVEL_INI AND T.NIVEL <= :NIVEL_FIN'
      'ORDER BY T.CUENTA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSBalance
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_CON_BALANCES_SS_SUPERIOR'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
  end
  object DSBalance: TDataSource
    DataSet = TSBalance
    Left = 144
    Top = 8
  end
  object DSBalance_Medio: TDataSource
    DataSet = TSBalance_Medio
    Left = 144
    Top = 56
  end
  object TSBalance_Detalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT T.*,'
      '       CASE'
      '         WHEN ((T.DEBE - T.HABER) > 0) THEN'
      '             (T.DEBE - T.HABER)'
      '         ELSE 0'
      '       END SALDO_DEUDOR,'
      '       CASE'
      '         WHEN ((T.DEBE - T.HABER) < 0) THEN'
      '             (T.HABER - T.DEBE)'
      '         ELSE 0'
      '       END SALDO_ACREEDOR'
      'FROM TMP_CON_BALANCES_SS T'
      'WHERE'
      'T.EMPRESA = :EMPRESA AND'
      'T.EJERCICIO = :EJERCICIO AND'
      'T.CANAL = :CANAL AND'
      'T.USUARIO = :USUARIO AND'
      'T.SUPERIOR = :CUENTA'
      'ORDER BY T.CUENTA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_CON_BALANCES_SS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 104
  end
  object DSBalance_Detalle: TDataSource
    DataSet = TSBalance_Detalle
    Left = 144
    Top = 104
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_MONEDAS')
    UniDirectional = False
    Left = 40
    Top = 152
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 144
    Top = 152
  end
  object frSumasySaldos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnBeginDoc = frSumasySaldosBeginDoc
    OnGetValue = frSumasySaldosGetValue
    OnBeforePrint = frSumasySaldosEnterRect
    OnEnterRect = frSumasySaldosEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 352
    Top = 56
    ReportForm = {19000000}
  end
  object frDSBalance: TfrDBDataSet
    DataSource = DSBalance
    Left = 248
    Top = 8
  end
  object frDSBalance_Medio: TfrDBDataSet
    DataSource = DSBalance_Medio
    Left = 248
    Top = 56
  end
  object frDSBalance_Detalle: TfrDBDataSet
    DataSource = DSBalance_Detalle
    Left = 248
    Top = 104
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 352
    Top = 8
  end
  object frxSumasySaldos: TfrxHYReport
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
    OnBeforePrint = frxSumasySaldosBeforePrint
    OnBeginDoc = frxSumasySaldosBeginDoc
    OnGetValue = frxSumasySaldosGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 440
    Top = 56
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
      'nowait')
    Left = 440
    Top = 8
  end
  object TSBalanceMes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT CT.EJERCICIO, CT.CUENTA, CT.TITULO,'
      '   SUM(COALESCE((SELECT S.SALDO '
      '       FROM CON_CUENTAS_SALDOS S '
      '       WHERE '
      '       CT.EMPRESA = S.EMPRESA AND '
      '       CT.CANAL = S.CANAL AND '
      '       CT.EJERCICIO = S.EJERCICIO AND '
      '       CT.CUENTA = S.CUENTA AND '
      '       S.PERIODO = '#39'00'#39' AND'
      '       CT.PGC = S.CUENTA_PGC), 0)) APERTURA,'
      '   SUM(COALESCE((SELECT S.SALDO '
      '       FROM CON_CUENTAS_SALDOS S '
      '       WHERE '
      '       CT.EMPRESA = S.EMPRESA AND '
      '       CT.CANAL = S.CANAL AND '
      '       CT.EJERCICIO = S.EJERCICIO AND '
      '       CT.CUENTA = S.CUENTA AND '
      '       S.PERIODO = '#39'98'#39' AND'
      '       CT.PGC = S.CUENTA_PGC), 0)) REGULARIZACION,'
      '   SUM(COALESCE((SELECT S.SALDO '
      '       FROM CON_CUENTAS_SALDOS S '
      '       WHERE '
      '       CT.EMPRESA = S.EMPRESA AND '
      '       CT.CANAL = S.CANAL AND '
      '       CT.EJERCICIO = S.EJERCICIO AND '
      '       CT.CUENTA = S.CUENTA AND '
      '       S.PERIODO = '#39'99'#39' AND'
      '       CT.PGC = S.CUENTA_PGC), 0)) CIERRE,'
      '   SUM(COALESCE((SELECT S.SALDO'
      '       FROM CON_CUENTAS_SALDOS S '
      '       WHERE '
      '       CT.EMPRESA = S.EMPRESA AND '
      '       CT.CANAL = S.CANAL AND '
      '       CT.EJERCICIO = S.EJERCICIO AND '
      '       CT.CUENTA = S.CUENTA AND '
      '       S.PERIODO = '#39'01'#39' AND '
      '       CT.PGC = S.CUENTA_PGC), 0)) ENERO, '
      '   SUM(COALESCE((SELECT S.SALDO'
      '       FROM CON_CUENTAS_SALDOS S '
      '       WHERE '
      '       CT.EMPRESA = S.EMPRESA AND '
      '       CT.CANAL = S.CANAL AND '
      '       CT.EJERCICIO = S.EJERCICIO AND '
      '       CT.CUENTA = S.CUENTA AND '
      '       S.PERIODO = '#39'02'#39' AND '
      '       CT.PGC = S.CUENTA_PGC), 0)) FEBRERO, '
      '   SUM(COALESCE((SELECT S.SALDO '
      '       FROM CON_CUENTAS_SALDOS S '
      '       WHERE '
      '       CT.EMPRESA = S.EMPRESA AND '
      '       CT.CANAL = S.CANAL AND '
      '       CT.EJERCICIO = S.EJERCICIO AND '
      '       CT.CUENTA = S.CUENTA AND '
      '       S.PERIODO = '#39'03'#39' AND '
      '       CT.PGC = S.CUENTA_PGC), 0)) MARZO, '
      '   SUM(COALESCE((SELECT S.SALDO '
      '       FROM CON_CUENTAS_SALDOS S '
      '       WHERE '
      '       CT.EMPRESA = S.EMPRESA AND '
      '       CT.CANAL = S.CANAL AND '
      '       CT.EJERCICIO = S.EJERCICIO AND '
      '       CT.CUENTA = S.CUENTA AND '
      '       S.PERIODO = '#39'04'#39' AND '
      '       CT.PGC = S.CUENTA_PGC), 0)) ABRIL, '
      '   SUM(COALESCE((SELECT S.SALDO '
      '       FROM CON_CUENTAS_SALDOS S '
      '       WHERE '
      '       CT.EMPRESA = S.EMPRESA AND '
      '       CT.CANAL = S.CANAL AND '
      '       CT.EJERCICIO = S.EJERCICIO AND '
      '       CT.CUENTA = S.CUENTA AND '
      '       S.PERIODO = '#39'05'#39' AND '
      '       CT.PGC = S.CUENTA_PGC), 0)) MAYO, '
      '   SUM(COALESCE((SELECT S.SALDO '
      '       FROM CON_CUENTAS_SALDOS S '
      '       WHERE '
      '       CT.EMPRESA = S.EMPRESA AND '
      '       CT.CANAL = S.CANAL AND '
      '       CT.EJERCICIO = S.EJERCICIO AND '
      '       CT.CUENTA = S.CUENTA AND '
      '       S.PERIODO = '#39'06'#39' AND '
      '       CT.PGC = S.CUENTA_PGC), 0)) JUNIO, '
      '   SUM(COALESCE((SELECT S.SALDO '
      '       FROM CON_CUENTAS_SALDOS S '
      '       WHERE '
      '       CT.EMPRESA = S.EMPRESA AND '
      '       CT.CANAL = S.CANAL AND '
      '       CT.EJERCICIO = S.EJERCICIO AND '
      '       CT.CUENTA = S.CUENTA AND '
      '       S.PERIODO = '#39'07'#39' AND '
      '       CT.PGC = S.CUENTA_PGC), 0)) JULIO, '
      '   SUM(COALESCE((SELECT S.SALDO '
      '       FROM CON_CUENTAS_SALDOS S '
      '       WHERE '
      '       CT.EMPRESA = S.EMPRESA AND '
      '       CT.CANAL = S.CANAL AND '
      '       CT.EJERCICIO = S.EJERCICIO AND '
      '       CT.CUENTA = S.CUENTA AND '
      '       S.PERIODO = '#39'08'#39' AND '
      '       CT.PGC = S.CUENTA_PGC), 0)) AGOSTO, '
      '   SUM(COALESCE((SELECT S.SALDO '
      '       FROM CON_CUENTAS_SALDOS S '
      '       WHERE '
      '       CT.EMPRESA = S.EMPRESA AND '
      '       CT.CANAL = S.CANAL AND '
      '       CT.EJERCICIO = S.EJERCICIO AND '
      '       CT.CUENTA = S.CUENTA AND '
      '       S.PERIODO = '#39'09'#39' AND '
      '       CT.PGC = S.CUENTA_PGC), 0)) SEPTIEMBRE, '
      '   SUM(COALESCE((SELECT S.SALDO '
      '       FROM CON_CUENTAS_SALDOS S '
      '       WHERE '
      '       CT.EMPRESA = S.EMPRESA AND '
      '       CT.CANAL = S.CANAL AND '
      '       CT.EJERCICIO = S.EJERCICIO AND '
      '       CT.CUENTA = S.CUENTA AND '
      '       S.PERIODO = '#39'10'#39' AND '
      '       CT.PGC = S.CUENTA_PGC), 0)) OCTUBRE, '
      '   SUM(COALESCE((SELECT S.SALDO '
      '       FROM CON_CUENTAS_SALDOS S '
      '       WHERE '
      '       CT.EMPRESA = S.EMPRESA AND '
      '       CT.CANAL = S.CANAL AND '
      '       CT.EJERCICIO = S.EJERCICIO AND '
      '       CT.CUENTA = S.CUENTA AND '
      '       S.PERIODO = '#39'11'#39' AND '
      '       CT.PGC = S.CUENTA_PGC), 0)) NOVIEMBRE, '
      '   SUM(COALESCE((SELECT S.SALDO '
      '       FROM CON_CUENTAS_SALDOS S '
      '       WHERE '
      '       CT.EMPRESA = S.EMPRESA AND '
      '       CT.CANAL = S.CANAL AND '
      '       CT.EJERCICIO = S.EJERCICIO AND '
      '       CT.CUENTA = S.CUENTA AND '
      '       S.PERIODO = '#39'12'#39' AND '
      '       CT.PGC = S.CUENTA_PGC), 0)) DICIEMBRE, '
      '   MIN(COALESCE((SELECT COUNT(*)'
      '       FROM CON_CUENTAS_APUNTES S'
      '       WHERE '
      '       CT.EMPRESA = S.EMPRESA AND '
      '       CT.CANAL = S.CANAL AND '
      '       CT.EJERCICIO = S.EJERCICIO AND '
      '       CT.CUENTA STARTING WITH S.CUENTA AND'
      '       CT.PGC = S.CUENTA_PGC), 0)) CANT_APUNTES'
      'FROM CON_CUENTAS CT '
      'WHERE '
      'CT.EMPRESA = :EMPRESA AND'
      'CT.EJERCICIO = :EJERCICIO AND'
      'CT.CANAL = :CANAL AND'
      'CT.CUENTA BETWEEN :CUENTA_INI AND :CUENTA_FIN AND'
      'CT.NIVEL >= :NIVELDESDE AND CT.NIVEL <= :NIVELHASTA'
      'AND CT.REG_CIERRE IN (-1, 0, 1, 2)'
      'GROUP BY CT.EJERCICIO, CT.CUENTA, CT.TITULO '
      'ORDER BY CT.EJERCICIO, CT.CUENTA ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_CON_BALANCES_SS_SUPERIOR'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 200
  end
  object DSBalanceMes: TDataSource
    DataSet = TSBalanceMes
    Left = 144
    Top = 200
  end
  object frDSBalanceMes: TfrDBDataSet
    DataSource = DSBalanceMes
    Left = 248
    Top = 200
  end
  object xBalanceExportacionExcel: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      '/* Se define dinamicamente */'
      'SELECT T.*,'
      '       CASE'
      '         WHEN ((T.DEBE - T.HABER) > 0) THEN'
      '             (T.DEBE - T.HABER)'
      '         ELSE 0'
      '       END SALDO_DEUDOR,'
      '       CASE'
      '         WHEN ((T.DEBE - T.HABER) < 0) THEN'
      '             (T.HABER - T.DEBE)'
      '         ELSE 0'
      '       END SALDO_ACREEDOR'
      'FROM TMP_CON_BALANCES_SS_SUPERIOR T'
      
        'JOIN CON_CUENTAS C ON T.EMPRESA = C.EMPRESA AND T.EJERCICIO = C.' +
        'EJERCICIO AND T.CANAL = C.CANAL AND T.CUENTA = C.CUENTA AND T.CU' +
        'ENTA_PGC = C.PGC'
      'WHERE'
      'T.EMPRESA = :EMPRESA AND'
      'T.EJERCICIO = :EJERCICIO'
      
        'AND ((CANAL = 1) OR (CANAL = 2)) /*DMMultiSeleccion.WhereCanales' +
        '()*/'
      'AND T.USUARIO = :USUARIO AND'
      'T.NIVEL BETWEEN :NIVEL_INI AND :NIVEL_FIN'
      'ORDER BY T.CUENTA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_CON_BALANCES_SS_SUPERIOR'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 248
  end
  object DSBalanceExportacionExcel: TDataSource
    DataSet = xBalanceExportacionExcel
    Left = 144
    Top = 248
  end
end
