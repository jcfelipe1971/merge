object DMLstRiesgoBancos: TDMLstRiesgoBancos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 364
  Top = 134
  Height = 423
  Width = 596
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 264
    Top = 16
  end
  object frRiesgoBancos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Riesgo de Bancos'
    RebuildPrinter = False
    OnGetValue = frRiesgoBancosGetValue
    OnBeforePrint = frRiesgoBancosBeforePrint
    OnEnterRect = frRiesgoBancosBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 16
    ReportForm = {19000000}
  end
  object DSxEmpBancos: TDataSource
    DataSet = xEmpBancos
    Left = 152
    Top = 64
  end
  object xVerRecibosCartera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT DET.EMPRESA, DET.EJERCICIO, DET.CANAL, DET.LINEA, CAR.COD' +
        '_CLI_PRO, DET.VENCIMIENTO, DET.LIQUIDO, DET.REMESA,'
      
        '       CAR.DOC_NUMERO, CAR.DOC_SERIE, CAR.DOC_FECHA, CAR.MONEDA,' +
        ' DET.FECHA_VALOR'
      'from emp_cartera_detalle det '
      
        'JOIN EMP_CARTERA CAR ON (DET.EMPRESA = CAR.EMPRESA AND DET.EJERC' +
        'ICIO = CAR.EJERCICIO AND DET.CANAL = CAR.CANAL AND DET.SIGNO = C' +
        'AR.SIGNO AND DET.REGISTRO = CAR.REGISTRO)'
      
        'LEFT JOIN EMP_CARTERA_DET_DESCONTADO DES ON (DET.EMPRESA = DES.E' +
        'MPRESA AND DET.EJERCICIO = DES.EJERCICIO AND DET.CANAL = DES.CAN' +
        'AL AND DET.SIGNO = DES.SIGNO AND DET.REGISTRO = DES.REGISTRO AND' +
        ' DET.LINEA = DES.LINEA)'
      'where '
      'DET.EMPRESA = :EMPRESA AND'
      'DET.CANAL = :CANAL AND'
      'DET.SIGNO = '#39'C'#39' AND'
      'DET.REMESA > 0 AND'
      'DET.VISIBLE = 1 AND'
      'DET.BANCO = :BANCO AND'
      'DET.FECHA_VALOR >= :FECHAD AND'
      'DET.FECHA_VALOR <= :FECHAH AND'
      '('
      ' (DET.PAGADO = 0) OR'
      ' ((DET.PAGADO = 1) AND (DES.RIC_DESCUENTO = 0))'
      ')'
      'order by det.fecha_valor')
    UniDirectional = False
    DataSource = DSxEmpBancos
    Left = 40
    Top = 112
  end
  object DSxVerRecibosCartera: TDataSource
    DataSet = xVerRecibosCartera
    Left = 152
    Top = 112
  end
  object frDBDSEmpBancos: TfrDBDataSet
    DataSource = DSxEmpBancos
    Left = 264
    Top = 64
  end
  object frDBDSVerRecibosCartera: TfrDBDataSet
    DataSource = DSxVerRecibosCartera
    Left = 264
    Top = 112
  end
  object xEmpBancos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_BANCOS_CUENTAS'
      ' WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'BANCO >= :BANCO_DESDE AND'
      'BANCO <= :BANCO_HASTA AND'
      'ACTIVO = 1'
      'ORDER BY BANCO')
    UniDirectional = False
    Left = 40
    Top = 64
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_MONEDAS'
      'WHERE'
      '  MONEDA=?MONEDA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_MONEDAS')
    UniDirectional = False
    Left = 40
    Top = 160
    object xMonedasMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xMonedasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xMonedasSIGNO_MONEDA: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO_MONEDA'
      Size = 3
    end
    object xMonedasDEC_VER: TIntegerField
      DisplayLabel = 'Dec. Ver'
      FieldName = 'DEC_VER'
    end
    object xMonedasDEC_CALCULOS: TIntegerField
      DisplayLabel = 'D. Calc.'
      FieldName = 'DEC_CALCULOS'
    end
    object xMonedasDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 152
    Top = 160
  end
  object frxRiesgoBancos: TfrxHYReport
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
    OnBeforePrint = frxRiesgoBancosBeforePrint
    OnGetValue = frxRiesgoBancosGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 152
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
    Left = 376
    Top = 16
  end
end
