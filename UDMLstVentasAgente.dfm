object DMLstVentasAgente: TDMLstVentasAgente
  OldCreateOrder = False
  OnCreate = DMVentasAgeCreate
  OnDestroy = DMVentasAgeDestroy
  Left = 487
  Top = 228
  Height = 510
  Width = 690
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 344
    Top = 8
  end
  object frDBDSxVentas_Agente_detalle: TfrDBDataSet
    DataSource = DSxVentas_Agente_detalle
    Left = 352
    Top = 104
  end
  object frHYVentasAgentes: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Ventas por Cliente Uds. Secundarias'
    RebuildPrinter = False
    OnGetValue = frHYVentasAgenteGetValue
    OnBeforePrint = frHYVentasAgentesEnterRect
    OnEnterRect = frHYVentasAgentesEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'FRF'
    Left = 48
    Top = 8
    ReportForm = {19000000}
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, SIGNO_MONEDA FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 48
    Top = 56
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 192
    Top = 56
  end
  object xVentas_Agente_detalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM g_ventas_articulos_agente_doc (?empresa,?ejercicio' +
        'D,?ejercicioH,'
      ' ?canalD,?canalH,?serieD,?serieH, '
      ' ?clienteD,?clienteh, ?entrada,'
      ' ?moneda, ?Albaranes, ?facturas_abiertas, ?facturas_cerradas,'
      ' ?articuloD, ?articuloH, ?familiaD,?familiaH, '
      '?fechaD, ?fechaH,?AgenteD,?AgenteH) ')
    UniDirectional = False
    AfterScroll = xVentas_Agente_detalleAfterScroll
    Left = 48
    Top = 104
  end
  object DSxVentas_Agente_detalle: TDataSource
    DataSet = xVentas_Agente_detalle
    Left = 192
    Top = 104
  end
  object xArt_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM VER_ARTICULOS'
      'WHERE empresa=?empresa AND articulo=?articulo')
    UniDirectional = False
    Left = 480
    Top = 16
  end
  object DSxArt_Desde: TDataSource
    DataSet = xArt_Desde
    Left = 568
    Top = 16
  end
  object DSxArt_Hasta: TDataSource
    DataSet = xArt_Hasta
    Left = 568
    Top = 64
  end
  object xArt_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM VER_ARTICULOS'
      'WHERE empresa=?empresa AND articulo=?articulo')
    UniDirectional = False
    Left = 480
    Top = 64
  end
  object xFam_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM art_familias'
      'WHERE empresa=?empresa AND familia=?familia')
    UniDirectional = False
    Left = 480
    Top = 112
  end
  object DSxFam_Desde: TDataSource
    DataSet = xFam_Desde
    Left = 568
    Top = 112
  end
  object DSxFam_Hasta: TDataSource
    DataSet = xFam_Hasta
    Left = 568
    Top = 160
  end
  object xFam_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM art_familias'
      'WHERE empresa=?empresa AND familia=?familia')
    UniDirectional = False
    Left = 480
    Top = 160
  end
  object xCli_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM Ver_clientes_empresa'
      'WHERE empresa=?empresa AND cliente=?cliente')
    UniDirectional = False
    Left = 480
    Top = 208
  end
  object DSxCli_Desde: TDataSource
    DataSet = xCli_Desde
    Left = 568
    Top = 208
  end
  object DSxCli_Hasta: TDataSource
    DataSet = xCli_Hasta
    Left = 568
    Top = 256
  end
  object xCli_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM Ver_clientes_empresa'
      'WHERE empresa=?empresa AND cliente=?cliente')
    UniDirectional = False
    Left = 480
    Top = 256
  end
  object DSxSerie_Desde: TDataSource
    DataSet = xSerie_Desde
    Left = 568
    Top = 304
  end
  object xSerie_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM Ver_series'
      'WHERE empresa=?empresa AND serie=?serie')
    UniDirectional = False
    Left = 480
    Top = 304
  end
  object xSerie_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM Ver_series'
      'WHERE empresa=?empresa AND serie=?serie')
    UniDirectional = False
    Left = 480
    Top = 352
  end
  object DSxSerie_Hasta: TDataSource
    DataSet = xSerie_Hasta
    Left = 568
    Top = 352
  end
  object xAgenteD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from ver_agentes'
      'where empresa = ?empresa and agente=?agente')
    UniDirectional = False
    Left = 48
    Top = 248
  end
  object xAgenteH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from ver_agentes'
      'where empresa=?empresa and agente=?agente')
    UniDirectional = False
    Left = 48
    Top = 296
  end
  object DSxAgenteD: TDataSource
    DataSet = xAgenteD
    Left = 192
    Top = 248
  end
  object DSxAgenteH: TDataSource
    DataSet = xAgenteH
    Left = 192
    Top = 296
  end
  object frDBDSxVentas_Agente_detalle_PREV: TfrDBDataSet
    DataSource = DSxVentas_Agente_detalle_PREV
    Left = 352
    Top = 152
  end
  object xVentas_Agente_detalle_PREV: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM lst_ventas_agente_prev (?empresa,?ejercicioD,?ejer' +
        'cicioH,'
      ' ?canalD,?canalH,?serieD,?serieH, '
      ' ?clienteD,?clienteh, ?entrada,'
      ' ?moneda, ?Albaranes, ?facturas_abiertas, ?facturas_cerradas,'
      ' ?articuloD, ?articuloH, ?familiaD,?familiaH, '
      '?fechaD, ?fechaH,?AgenteD,?AgenteH) ')
    UniDirectional = False
    AfterScroll = xVentas_Agente_detalleAfterScroll
    Left = 48
    Top = 152
  end
  object DSxVentas_Agente_detalle_PREV: TDataSource
    DataSet = xVentas_Agente_detalle_PREV
    Left = 192
    Top = 152
  end
  object frDBDSxInfoLotes: TfrDBDataSet
    DataSource = DSxInfoLotes
    Left = 352
    Top = 200
  end
  object xInfoLotes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ges_detalles_s_lotes'
      ' where ((empresa=?doc_empresa)and(ejercicio=?doc_ejercicio)and'
      
        '            (canal=?doc_canal)and(serie=?doc_serie)and(tipo=?doc' +
        '_tipo)and'
      '            (rig=?doc_rig)and(linea=?doc_linea))')
    UniDirectional = False
    DataSource = DSxVentas_Agente_detalle
    Left = 48
    Top = 200
  end
  object DSxInfoLotes: TDataSource
    DataSet = xInfoLotes
    Left = 192
    Top = 200
  end
  object frxHYVentasAgentes: TfrxHYReport
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
    OnBeforePrint = frxHYVentasAgentesBeforePrint
    OnGetValue = frxHYVentasAgentesGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 192
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
