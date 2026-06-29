object DMLSTCartera: TDMLSTCartera
  OldCreateOrder = False
  OnCreate = DMLSTCarteraCreate
  OnDestroy = DMLSTCarteraDestroy
  Left = 485
  Top = 120
  Height = 567
  Width = 721
  object DSxRecibos: TDataSource
    DataSet = xRecibos
    Left = 152
    Top = 56
  end
  object frRecibos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de recibos por Agente'
    RebuildPrinter = False
    OnGetValue = frRecibosGetValue
    OnBeforePrint = frRecibosEnterRect
    OnEnterRect = frRecibosEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 272
    Top = 8
    ReportForm = {19000000}
  end
  object frDBxRecibos: TfrDBDataSet
    DataSource = DSxRecibos
    Left = 272
    Top = 56
  end
  object DSCliente: TDataSource
    DataSet = xClientes
    Left = 152
    Top = 200
  end
  object frDBCliente: TfrDBDataSet
    DataSource = DSCliente
    Left = 272
    Top = 200
  end
  object DSxRemesa: TDataSource
    DataSet = xRemesa
    Left = 152
    Top = 104
  end
  object frDBxRemesa: TfrDBDataSet
    DataSource = DSxRemesa
    Left = 272
    Top = 104
  end
  object DSxProveedores: TDataSource
    DataSet = xProveedores
    Left = 152
    Top = 296
  end
  object DSxC_cartera_Agente: TDataSource
    DataSet = xC_cartera_Agente
    Left = 152
    Top = 392
  end
  object frDBxC_cartera_Agente: TfrDBDataSet
    DataSource = DSxC_cartera_Agente
    Left = 272
    Top = 392
  end
  object DSxClienteCuenta: TDataSource
    DataSet = xClienteCuenta
    Left = 152
    Top = 248
  end
  object frDBxClienteCuenta: TfrDBDataSet
    DataSource = DSxClienteCuenta
    Left = 272
    Top = 248
  end
  object DSxAcreedores: TDataSource
    DataSet = xAcreedores
    Left = 152
    Top = 344
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 48
    Top = 8
  end
  object xImpagados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM EMP_CARTERA_IMPAGADOS IMP'
      'LEFT JOIN EMP_CARTERA_DETALLE DET'
      'ON'
      'IMP.EMPRESA = DET.EMPRESA AND'
      'IMP.EJERCICIO = DET.EJERCICIO AND'
      'IMP.CANAL = DET.CANAL AND'
      'IMP.SIGNO = DET.SIGNO AND'
      'IMP.RECIBO_IMPAGADO = DET.REGISTRO'
      'WHERE'
      'IMP.EMPRESA = :EMPRESA AND'
      'IMP.EJERCICIO = :EJERCICIO AND'
      'IMP.CANAL = :CANAL AND'
      'IMP.SIGNO = :SIGNO AND'
      'IMP.REGISTRO = :REGISTRO_IMPAGADO AND'
      'IMP.LINEA = :LINEA'
      '')
    UniDirectional = False
    Left = 48
    Top = 152
  end
  object frDBxImpagados: TfrDBDataSet
    DataSource = DSxImpagados
    OpenDataSource = False
    Left = 272
    Top = 152
  end
  object DSxImpagados: TDataSource
    DataSet = xImpagados
    Left = 152
    Top = 152
  end
  object xRecibos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select det.empresa,det.ejercicio,det.canal,det.signo,det.registr' +
        'o,det.linea,car.cod_cli_pro,det.vencimiento,'
      
        'det.cta_pago,det.liquido,det.liquido_canal,det.pagado,det.impaga' +
        'do,fp.forma_pago,det.tipo_efecto,det.remesar,det.estado,det.reme' +
        'sa,'
      
        'car.doc_numero,car.doc_serie,car.doc_fecha,car.doc_tipo,car.ric,' +
        'car.riva,det.fecha_cierre,'
      
        'det.estado_recibo,det.recibido,car.fecha_registro,fp.aceptar,det' +
        '.moneda,det.moneda_canal'
      'from emp_cartera_detalle det '
      'left join emp_cartera car on '
      
        '  ((det.empresa=car.empresa)and(det.ejercicio=car.ejercicio)and(' +
        'det.canal=car.canal)and'
      '  (det.signo=car.signo)and(det.registro=car.registro))'
      'left join con_cuentas_ges_fp fp on'
      
        '  ((det.empresa=fp.empresa)and(det.ejercicio=fp.ejercicio)and(de' +
        't.canal=fp.canal)and(car.forma_pago=fp.forma_pago))'
      'where ((det.empresa=?empresa)and(det.canal=?canal)and'
      
        '       (det.visible=1)and(det.vencimiento<=?max_fecha)and(det.ve' +
        'ncimiento>=?min_fecha)and '
      
        '       (car.cod_cli_pro<=?max_cliente)and(car.cod_cli_pro>=?min_' +
        'cliente)and'
      '       (det.signo=?signo)and'
      
        '       ((car.doc_tipo=?tipo)or(car.doc_tipo=?tipo2)or(car.doc_ti' +
        'po=?tipo3))and(det.recibido<>?rec)and'
      '       (fp.aceptar<>?aceptado))'
      '')
    UniDirectional = False
    AfterOpen = xRecibosAfterOpen
    AfterScroll = xRecibosAfterScroll
    BeforeClose = xRecibosBeforeClose
    Left = 48
    Top = 56
  end
  object xClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from emp_clientes c'
      'left join sys_terceros t'
      'on (c.tercero=t.tercero)  '
      'where ((c.empresa=?empresa)and(c.cliente=?cod_cli_pro))')
    UniDirectional = False
    Left = 48
    Top = 200
  end
  object xRemesa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CARTERA_REMESAS'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and'
      '           remesa=?remesa')
    UniDirectional = False
    Left = 48
    Top = 104
  end
  object xProveedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select *'
      'from emp_proveedores p'
      'join sys_terceros t on p.tercero = t.tercero'
      'where ((p.empresa=?empresa)and(p.proveedor=?cod_cli_pro))')
    UniDirectional = False
    Left = 48
    Top = 296
  end
  object xClienteCuenta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select GCLI.EMPRESA,GCLI.EJERCICIO,GCLI.CANAL,GCLI.CLIENTE,CLI.T' +
        'ERCERO,CLI.TARIFA,GCLI.FORMA_PAGO,'
      
        '       CLI.RIESGO_AUT,CLI.RIESGO_ACT,GCLI.MODO_IVA,CLI.DIA_PAGO_' +
        '1,CLI.DIA_PAGO_2,CLI.DESCUENTO_PP,'
      
        '       CLI.AGENTE,CLI.NOTAS,GCLI.CUENTA,TER.NOMBRE_R_SOCIAL,GCLI' +
        '.PERFIL, GCLI.TIPO_IRPF,GCLI.PAIS, CLI.TIPO, '
      '       CLI.PORTES'
      'from CON_CUENTAS_GES_CLI GCLI '
      
        'LEFT JOIN EMP_CLIENTES CLI ON (CLI.EMPRESA=GCLI.EMPRESA AND CLI.' +
        'CLIENTE=GCLI.CLIENTE) '
      'LEFT JOIN SYS_TERCEROS TER ON (TER.TERCERO=CLI.TERCERO)'
      'where ((gcli.empresa=?empresa)and '
      '           (gcli.ejercicio=?ejercicio)and '
      '           (gcli.canal=?canal)and'
      '           (gcli.cliente=?cliente))')
    UniDirectional = False
    Left = 48
    Top = 248
  end
  object xAcreedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_ACREEDORES'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND ACREEDOR=?ACREEDOR')
    UniDirectional = False
    Left = 48
    Top = 344
  end
  object xC_cartera_Agente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select g.empresa,g.ejercicio,g.canal,d.signo,d.registro,d.linea,' +
        'e.cod_cli_pro,'
      
        '             d.vencimiento,d.cta_pago,d.liquido,d.liquido_canal,' +
        'd.pagado,d.impagado,fp.forma_pago,d.tipo_efecto,'
      
        '             d.remesar,d.estado,d.remesa,e.doc_numero,e.doc_seri' +
        'e,e.doc_fecha,e.ric,e.riva,'
      
        '             d.fecha_cierre,d.estado_recibo,d.recibido,fp.acepta' +
        'r,d.moneda,d.moneda_canal'
      '  from ges_cabeceras_s g     '
      '    left join emp_cartera e'
      
        '    on ((g.empresa=e.empresa)and(g.ejercicio=e.ejercicio)and(g.c' +
        'anal=e.canal)and(g.tipo=e.doc_tipo)and'
      '       (g.rig=e.doc_numero)and(g.serie=doc_serie))'
      '    left join con_cuentas_ges_fp fp on'
      
        '    ((e.empresa=fp.empresa)and(e.ejercicio=fp.ejercicio)and(e.ca' +
        'nal=fp.canal)and(e.forma_pago=fp.forma_pago))'
      '    left join emp_cartera_detalle d'
      
        '    on ((g.empresa=d.empresa)and(g.ejercicio=d.ejercicio)and(g.c' +
        'anal=d.canal)and'
      '        (e.signo=d.signo)and(e.registro=d.registro))'
      
        'where ((g.empresa=?empresa)and(g.canal=?canal)and(g.tipo='#39'FAC'#39')a' +
        'nd'
      
        '           (g.agente=?agente)and(d.vencimiento>=?min_fecha)and(d' +
        '.vencimiento<=?max_fecha)and'
      '           (d.visible=1)and(fp.aceptar<>?aceptado)and '
      '           (recibido<>?rec))'
      '')
    UniDirectional = False
    AfterOpen = xC_cartera_AgenteAfterOpen
    AfterScroll = xC_cartera_AgenteAfterScroll
    BeforeClose = xC_cartera_AgenteBeforeClose
    Left = 48
    Top = 392
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
    Left = 472
    Top = 8
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
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 576
    Top = 8
  end
  object frxRecibos: TfrxHYReport
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
    OnBeforePrint = frxRecibosBeforePrint
    OnGetValue = frxRecibosGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 360
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
    Left = 152
    Top = 8
  end
end
