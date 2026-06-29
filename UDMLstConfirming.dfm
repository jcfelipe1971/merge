object DMLstConfirming: TDMLstConfirming
  OldCreateOrder = False
  OnCreate = DMLstConfirmingCreate
  OnDestroy = DMLstConfirmingDestroy
  Left = 396
  Top = 306
  Height = 300
  Width = 435
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 184
    Top = 16
  end
  object frConfirming: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Confirmings'
    RebuildPrinter = False
    OnGetValue = frConfirmingGetValue
    OnBeforePrint = frConfirmingEnterRect
    OnEnterRect = frConfirmingEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'FRF'
    Left = 24
    Top = 16
    ReportForm = {19000000}
  end
  object frDBConfirming: TfrDBDataSet
    DataSource = DSxConfirming
    Left = 184
    Top = 112
  end
  object DSxConfirming: TDataSource
    DataSet = xConfirming
    Left = 104
    Top = 112
  end
  object xConfirming: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CARTERA_CONFIRMING'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  NUM_CONFIRMING=?NUM_CONFIRMING ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CARTERA_CONFIRMING'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SIGNO = '#39'P'#39' AND'
      'BANCO = :BANCO'
      '--AND FECHA_VTO >= _FECHA'
      'AND FECHA >= :FECHA')
    UniDirectional = False
    AfterOpen = xConfirmingAfterOpen
    BeforeClose = xConfirmingBeforeClose
    Left = 24
    Top = 112
  end
  object frDBBancos: TfrDBDataSet
    DataSource = DSxBancos
    Left = 184
    Top = 64
  end
  object DSxBancos: TDataSource
    DataSet = xBancos
    Left = 104
    Top = 64
  end
  object xBancos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_BANCOS_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL'
      'ORDER BY BANCO')
    UniDirectional = False
    AfterScroll = xBancosAfterScroll
    Left = 24
    Top = 64
  end
  object SPVencimientos: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(fecha_vto) as maximo from emp_cartera_confirming'
      
        '  where ((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?c' +
        'anal))')
    Transaction = TLocal
    AutoTrans = True
    Left = 312
    Top = 72
  end
  object frxConfirming: TfrxHYReport
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
    OnBeforePrint = frxConfirmingBeforePrint
    OnGetValue = frxConfirmingGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 104
    Top = 16
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
    Left = 264
    Top = 16
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CARTERA_CONFIRMING'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SIGNO=?old_SIGNO AND '
      '  REGISTRO=?old_REGISTRO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CARTERA_CONFIRMING'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SIGNO,REGISTRO,LINEA,COD_CLI_PRO,TI' +
        'TULO,VENCIMIENTO,CTA_PAGO,LIQUIDO,'#13#10'PAGADO,IMPAGADO,FORMA_PAGO,T' +
        'IPO_EFECTO,ACEPTADO,REMESAR,ESTADO,REMESA,DOC_NUMERO,DOC_SERIE,'#13 +
        #10'DOC_FECHA,DOC_TIPO,RIC,RIVA,FECHA_CIERRE,ESTADO_RECIBO,RECIBIDO' +
        ',CONFIRMING,MONEDA,LIQUIDO_CANAL,'#13#10'MONEDA_CANAL,EJERCICIO_CONFIR' +
        'MING,ID_CARTERA,ID_CARTERA_DETALLE,ID_DOC,PAGO_AUTORIZADO)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SIGNO,?REGISTRO,?LINEA,?COD_CLI' +
        '_PRO,?TITULO,?VENCIMIENTO,?CTA_PAGO,?LIQUIDO,'#13#10'?PAGADO,?IMPAGADO' +
        ',?FORMA_PAGO,?TIPO_EFECTO,?ACEPTADO,?REMESAR,?ESTADO,?REMESA,?DO' +
        'C_NUMERO,?DOC_SERIE,'#13#10'?DOC_FECHA,?DOC_TIPO,?RIC,?RIVA,?FECHA_CIE' +
        'RRE,?ESTADO_RECIBO,?RECIBIDO,?CONFIRMING,?MONEDA,?LIQUIDO_CANAL,' +
        #13#10'?MONEDA_CANAL,?EJERCICIO_CONFIRMING,?ID_CARTERA,?ID_CARTERA_DE' +
        'TALLE,?ID_DOC,?PAGO_AUTORIZADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CARTERA_CONFIRMING'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CARTERA_CONFIRMING'
      'WHERE'
      '  EMPRESA = :EMPRESA AND '
      '  EJERCICIO_CONFIRMING = :EJERCICIO AND '
      '  CANAL = :CANAL AND '
      '  SIGNO = '#39'P'#39' AND'
      '  CONFIRMING = :NUM_CONFIRMING AND'
      '  CONFIRMING > 0'
      'ORDER BY VENCIMIENTO ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CARTERA_CONFIRMING'
      'SET'
      '  CONFIRMING=?CONFIRMING '
      '  ,EJERCICIO_CONFIRMING=?EJERCICIO_CONFIRMING'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO AND '
      '  LINEA=?LINEA ')
    DataSource = DSxConfirming
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SIGNO '
      'REGISTRO '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CARTERA_CONFIRMING'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 160
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 104
    Top = 160
  end
  object frDBDetalle: TfrDBDataSet
    DataSource = DSQMDetalle
    Left = 184
    Top = 160
  end
end
