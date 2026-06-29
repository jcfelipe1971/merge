object DMLstPagares: TDMLstPagares
  OldCreateOrder = False
  OnCreate = DMLstPagaresCreate
  OnDestroy = DMLstPagaresDestroy
  Left = 397
  Top = 205
  Height = 549
  Width = 774
  object SPDamePagare: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(pagare),min(pagare)  from ver_pagares'
      
        '  where ((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?c' +
        'anal))')
    Transaction = TLocal
    AutoTrans = True
    Left = 512
    Top = 352
  end
  object xPagareDesde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT PAGARE,DESCRIPCION FROM VER_PAGARES'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  PAGARE=?PAGARE')
    UniDirectional = False
    Left = 48
    Top = 64
    object xPagareDesdePAGARE: TFIBStringField
      DisplayLabel = 'Pagare'
      FieldName = 'PAGARE'
      Size = 15
    end
    object xPagareDesdeDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 256
    Top = 16
  end
  object xPagareHasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT PAGARE,DESCRIPCION FROM VER_PAGARES'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  PAGARE=?PAGARE')
    UniDirectional = False
    Left = 48
    Top = 112
    object xPagareHastaPAGARE: TFIBStringField
      DisplayLabel = 'Pagare'
      FieldName = 'PAGARE'
      Size = 15
    end
    object xPagareHastaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object DSxPagareDesde: TDataSource
    DataSet = xPagareDesde
    Left = 136
    Top = 64
  end
  object DSxPagareHasta: TDataSource
    DataSet = xPagareHasta
    Left = 136
    Top = 112
  end
  object xPagares: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_PAGARES'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  PAGARE>=?PAGAREDESDE AND'
      '  PAGARE<=?PAGAREHASTA'
      'order by PAGARE')
    UniDirectional = False
    AfterOpen = xPagaresAfterOpen
    AfterScroll = xPagaresAfterScroll
    Left = 48
    Top = 160
  end
  object Letra1: TLetra
    Decimales = 2
    GeneroMasculino = True
    LongLinea = 61
    LongPrimeraLinea = 51
    Separador = ','
    Relleno = '#'
    Moneda = 'Eur.'
    DescDecimales = 'c'#233'ntimos'
    ModoDecimales = 0
    Left = 256
    Top = 64
  end
  object HYPagares: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 509
    ValorGrupo = 102
    DataSet = DMMain.QListados
    Opciones.Pagina.Margenes.Abajo = 0
    Opciones.Pagina.Margenes.Izquierda = 0
    Opciones.Pagina.Margenes.Derecha = 0
    Opciones.Pagina.Margenes.Arriba = 0
    Opciones.Pagina.Alto = 18
    Opciones.Pagina.Ancho = 70
    Opciones.Pagina.Tamanyo = 18
    Opciones.Pagina.SaltoPagina = False
    Opciones.Pagina.ImprimePrimeraCabecera = False
    Opciones.Pagina.ImprimeUltimoPie = False
    Titulo = 'Listado de Pagares por Cuenta'
    ControlaLongitud = True
    OnEnterFields = HYPagaresEnterFields
    Left = 512
    Top = 112
  end
  object HYRSxPagares: THYReportSource
    DataSet = xPagares
    CloseDataset = True
    Left = 416
    Top = 160
  end
  object xProveedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'SELECT tercero,nombre_r_social as TITULO from ver_proveedores_cu' +
        'entas'
      '  where empresa=?empresa and '
      '             ejercicio=?ejercicio and'
      '             canal=?canal and'
      '             proveedor=?cod_cli_pro')
    UniDirectional = False
    DataSource = DSxPagares
    Left = 48
    Top = 304
  end
  object DSxPagares: TDataSource
    DataSet = xPagares
    Left = 136
    Top = 160
  end
  object xAcreedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TERCERO,TITULO from ver_acreedores_cuentas'
      '  where empresa=?empresa and '
      '             ejercicio=?ejercicio and'
      '             canal=?canal and'
      '             acreedor=?cod_cli_pro')
    UniDirectional = False
    DataSource = DSxPagares
    Left = 48
    Top = 352
  end
  object xDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CARTERA_PAGARES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO<=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  PAGARE=?PAGARE AND'
      '  PAGARE_AUTOMATICO=2')
    UniDirectional = False
    DataSource = DSxPagares
    AfterOpen = xDetalleAfterOpen
    BeforeClose = xDetalleBeforeClose
    Left = 48
    Top = 208
  end
  object DSxDetalle: TDataSource
    DataSet = xDetalle
    Left = 136
    Top = 208
  end
  object HYRxDetalle: THYReportSource
    DataSet = xDetalle
    CloseDataset = True
    Left = 416
    Top = 208
  end
  object frDBxPagares: TfrDBDataSet
    DataSource = DSxPagares
    Left = 256
    Top = 160
  end
  object frDBDBDetalle: TfrDBDataSet
    DataSource = DSxDetalle
    Left = 256
    Top = 208
  end
  object frCartaPago: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Carta de Pago '
    RebuildPrinter = False
    OnGetValue = frPagaresGetValue
    OnBeforePrint = frPagaresEnterRect
    OnEnterRect = frPagaresEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'FRF'
    Left = 512
    Top = 16
    ReportForm = {19000000}
  end
  object xCodigoPostal: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_LOCALIDADES'
      'where localidad = ?localidad')
    UniDirectional = False
    DataSource = DSxDirPRO_ACR
    Left = 512
    Top = 160
  end
  object DSxCodPostal: TDataSource
    DataSet = xCodigoPostal
    Left = 608
    Top = 160
  end
  object DSxDirPRO_ACR: TDataSource
    DataSet = xDirPRO_ACR
    Left = 144
    Top = 16
  end
  object xDirPRO_ACR: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT FIRST (1) *'
      'FROM VER_TERCEROS_DIRECCION_TODAS'
      'WHERE'
      'TERCERO = ?TERCERO AND'
      'DIR_CLASE <> 2'
      'ORDER BY DIR_CLASE, DIR_DEFECTO DESC ')
    UniDirectional = False
    AfterScroll = xDirPRO_ACRAfterScroll
    Left = 48
    Top = 16
  end
  object xBanco: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM emp_bancos'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  BANCO=?BANCO')
    UniDirectional = False
    DataSource = DSxPagares
    Left = 48
    Top = 400
  end
  object DSxBanco: TDataSource
    DataSet = xBanco
    Left = 136
    Top = 400
  end
  object Letras: TLetra
    Decimales = 2
    GeneroMasculino = True
    LongLinea = 200
    LongPrimeraLinea = 200
    Separador = ','
    Relleno = #0
    Moneda = 'Eur.'
    DescDecimales = 'c'#233'ntimos'
    ModoDecimales = 0
    Left = 336
    Top = 64
  end
  object DSxProveedores: TDataSource
    DataSet = xProveedores
    Left = 136
    Top = 304
  end
  object DSxAcreedores: TDataSource
    DataSet = xAcreedores
    Left = 136
    Top = 352
  end
  object xNum_Factura: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT NUM_FACTURA FROM ges_cabeceras_e_fac'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  SERIE=?SERIE AND'
      '  TIPO=?TIPO AND '
      '  RIG=?RIG')
    UniDirectional = False
    Left = 512
    Top = 256
  end
  object DSxNumFactura: TDataSource
    DataSet = xNum_Factura
    Left = 608
    Top = 256
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * '
      'FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 512
    Top = 304
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 608
    Top = 304
  end
  object xClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT tercero,titulo from ver_clientes_cuentas'
      '  where empresa=?empresa and '
      '             ejercicio=?ejercicio and'
      '             canal=?canal and'
      '             cliente=?cod_cli_pro')
    UniDirectional = False
    DataSource = DSxPagares
    Left = 512
    Top = 208
  end
  object DSxClientes: TDataSource
    DataSet = xClientes
    Left = 608
    Top = 208
  end
  object frxCartaPago: TfrxHYReport
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
    OnBeforePrint = frxCartaPagoBeforePrint
    OnGetValue = frxPagaresGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 608
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frPagares: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Pagare'
    RebuildPrinter = False
    OnGetValue = frPagaresGetValue
    OnBeforePrint = frPagaresEnterRect
    OnEnterRect = frPagaresEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'FRF'
    Left = 512
    Top = 64
    ReportForm = {19000000}
  end
  object frxPagares: TfrxHYReport
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
    OnBeforePrint = frxPagaresBeforePrint
    OnGetValue = frxPagaresGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 608
    Top = 64
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frDSxPagares: TfrDBDataSet
    DataSource = DSxPagares
    Left = 336
    Top = 160
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 336
    Top = 16
  end
  object xModoImporte: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select importe_letras from sys_empresas'
      '  where (empresa=?empresa)')
    Transaction = TLocal
    AutoTrans = True
    Left = 48
    Top = 446
  end
  object xDetalleRecAgrupKri: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select det.empresa,det.ejercicio,det.canal,det.signo,det.registr' +
        'o,det.linea,det.vencimiento,'
      
        '       det.liquido,car.cuenta,car.cuenta_pgc,car.fecha_registro,' +
        'car.doc_numero,'
      
        '       car.doc_serie,car.doc_tipo,car.doc_fecha,car.forma_pago,c' +
        'ar.cod_cli_pro,car.ric from emp_cartera_documento doc'
      '   join emp_cartera_detalle det'
      '  on(doc.id_cartera_detalle = det.id_cartera_detalle)'
      '   join emp_cartera car'
      '  on(car.id_cartera = det.id_cartera)'
      
        'where((doc.empresa=?empresa)and(doc.ejercicio_rec<=:ejercicio/*_' +
        'rec*/)and'
      
        '(doc.ejercicio=:ejercicio)and(doc.canal=:canal)and(doc.signo=:si' +
        'gno)and(doc.registro=:registro))')
    UniDirectional = False
    DataSource = DSxDetalle
    Left = 48
    Top = 256
  end
  object DSxDetalleRecAgrupKri: TDataSource
    DataSet = xDetalleRecAgrupKri
    Left = 136
    Top = 256
  end
  object HYRSxDetalleRecAgrupKri: THYReportSource
    DataSet = xDetalleRecAgrupKri
    CloseDataset = True
    Left = 416
    Top = 256
  end
  object frDBxDetalleRecAgrupKri: TfrDBDataSet
    DataSource = DSxDetalleRecAgrupKri
    Left = 256
    Top = 256
  end
end
