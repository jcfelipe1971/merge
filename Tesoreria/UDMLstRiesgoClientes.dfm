object DMLstRiesgoClientes: TDMLstRiesgoClientes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 370
  Top = 301
  Height = 491
  Width = 602
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 424
    Top = 8
  end
  object frRiesgoClientes: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Riesgo de Bancos'
    RebuildPrinter = False
    OnGetValue = frRiesgoClientesGetValue
    OnBeforePrint = frRiesgoClientesBeforePrint
    OnEnterRect = frRiesgoClientesBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 48
    Top = 8
    ReportForm = {19000000}
  end
  object DSxEmpClientes: TDataSource
    DataSet = xEmpClientes
    Left = 168
    Top = 56
  end
  object xRecibosRemesados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select '
      'det.empresa,det.ejercicio,det.canal,det.linea,det.vencimiento,'
      
        'det.liquido,det.remesa,car.doc_numero,car.doc_serie,car.doc_fech' +
        'a,'
      'car.moneda,det.fecha_valor,det.tipo_efecto,det.cta_pago'
      'from emp_cartera_detalle det '
      'join emp_cartera car '
      
        '    on ((det.empresa=car.empresa)and(det.ejercicio=car.ejercicio' +
        ')and'
      '          (det.canal=car.canal)and(det.signo=car.signo)and'
      '          (det.registro=car.registro))'
      'left join emp_cartera_det_descontado des '
      
        '    on ((det.empresa=des.empresa)and(det.ejercicio=des.ejercicio' +
        ')and'
      '            (det.canal=des.canal)and(det.signo=des.signo)and'
      
        '            (det.registro=des.registro)and(det.linea=des.linea))' +
        ' '
      'where '
      
        '    ((det.empresa=?empresa)and(det.canal=?canal)and(det.signo='#39'C' +
        #39')and'
      
        '     (det.remesa>0)and(det.visible=1)and(car.cod_cli_pro=?client' +
        'e)and'
      '     (det.fecha_valor>=?fechad)and(det.fecha_valor<=?fechah)and'
      '     ((det.pagado=0)or'
      
        '     ((det.pagado=1)and(des.ric_descuento=0)and(det.impagado=0))' +
        '))'
      'order by det.vencimiento')
    UniDirectional = False
    DataSource = DSxEmpClientes
    Left = 48
    Top = 152
  end
  object DSxRecibosRemesados: TDataSource
    DataSet = xRecibosRemesados
    Left = 168
    Top = 152
  end
  object frDBDSEmpClientes: TfrDBDataSet
    DataSource = DSxEmpClientes
    Left = 304
    Top = 56
  end
  object frDBDSxRecibosRemesados: TfrDBDataSet
    DataSource = DSxRecibosRemesados
    Left = 304
    Top = 152
  end
  object xEmpClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_CLIENTES_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'CLIENTE >= :CLIENTE_DESDE AND'
      'CLIENTE <= :CLIENTE_HASTA AND'
      'AGENTE >= :AGENTE_DESDE AND'
      'AGENTE <= :AGENTE_HASTA'
      'ORDER BY AGENTE, CLIENTE')
    UniDirectional = False
    Left = 48
    Top = 56
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
    Left = 48
    Top = 200
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
    Left = 168
    Top = 200
  end
  object QMaxCliente: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(CLIENTE) AS MAXIMO FROM EMP_CLIENTES'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 424
    Top = 56
  end
  object xRecibosCartera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_RECIBOS_CARTERA'
      ' WHERE'
      '    EMPRESA=?EMPRESA AND'
      '    CANAL=?CANAL AND'
      '    SIGNO='#39'C'#39' AND'
      '    REMESA=0 AND'
      '    PAGADO=0 AND'
      '    COD_CLI_PRO=?CLIENTE AND'
      '    FECHA_VALOR >= ?FECHAD AND'
      '    FECHA_VALOR <= ?FECHAH'
      'ORDER BY VENCIMIENTO')
    UniDirectional = False
    DataSource = DSxEmpClientes
    Left = 48
    Top = 104
  end
  object DSxRecibosCartera: TDataSource
    DataSet = xRecibosCartera
    Left = 168
    Top = 104
  end
  object frDBDSxRecibosCartera: TfrDBDataSet
    DataSource = DSxRecibosCartera
    Left = 304
    Top = 104
  end
  object frxRiesgoClientes: TfrxHYReport
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
    OnBeforePrint = frxRiesgoClientesBeforePrint
    OnGetValue = frxRiesgoClientesGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 168
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
      'nowait')
    Left = 496
    Top = 8
  end
  object QMaxAgente: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(AGENTE) AS MAXIMO FROM EMP_AGENTES'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 424
    Top = 104
  end
end
