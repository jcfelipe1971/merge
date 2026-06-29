object DMLstVentasCliAge: TDMLstVentasCliAge
  OldCreateOrder = False
  OnCreate = DMVentasCliCreate
  OnDestroy = DMVentasCliDestroy
  Left = 471
  Top = 207
  Height = 536
  Width = 687
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 304
    Top = 18
  end
  object frDBDSxVentas_Clientes_agentes_detalle: TfrDBDataSet
    DataSource = DSxVentas_Clientes_agentes_detalle
    Left = 320
    Top = 202
  end
  object frHYVentasClientesAgentes: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Ventas por Cliente Agentes Uds. Secundarias'
    RebuildPrinter = False
    OnGetValue = frHYVentasClientesAgentesGetValue
    OnBeforePrint = frHYVentasClientesAgentesEnterRect
    OnEnterRect = frHYVentasClientesAgentesEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'FRF'
    Left = 54
    Top = 18
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
    Left = 44
    Top = 134
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 138
    Top = 134
  end
  object xVentas_Clientes_agentes_detalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM g_ventas_cli_age_mes (?EMPRESA ,?EJERCICIO,?CANALD' +
        ','
      
        '?CANALH,?SERIED,?SERIEH,?ARTICULOD,?ARTICULOH,?FAMILIAD ,?FAMILI' +
        'AH ,?CLIENTED,'
      
        '?CLIENTEH ,?AGENTED ,?AGENTEH ,?UNIFICAR_CLIENTES ,?UNIFICAR_AGE' +
        'NTES,'
      '?FACTURAS ,?MONEDA ,?ENTRADA)')
    UniDirectional = False
    Left = 74
    Top = 200
    object xVentas_Clientes_agentes_detalleCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xVentas_Clientes_agentes_detalleAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xVentas_Clientes_agentes_detalleTITULO_CLIENTE: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_CLIENTE'
      Size = 60
    end
    object xVentas_Clientes_agentes_detalleTITULO_AGENTE: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_AGENTE'
      Size = 60
    end
    object xVentas_Clientes_agentes_detalleENERO: TFloatField
      DisplayLabel = 'Enero'
      FieldName = 'ENERO'
    end
    object xVentas_Clientes_agentes_detalleFEBRERO: TFloatField
      DisplayLabel = 'Febrero'
      FieldName = 'FEBRERO'
    end
    object xVentas_Clientes_agentes_detalleMARZO: TFloatField
      DisplayLabel = 'Marzo'
      FieldName = 'MARZO'
    end
    object xVentas_Clientes_agentes_detalleABRIL: TFloatField
      DisplayLabel = 'Abril'
      FieldName = 'ABRIL'
    end
    object xVentas_Clientes_agentes_detalleMAYO: TFloatField
      DisplayLabel = 'Mayo'
      FieldName = 'MAYO'
    end
    object xVentas_Clientes_agentes_detalleJUNIO: TFloatField
      DisplayLabel = 'Junio'
      FieldName = 'JUNIO'
    end
    object xVentas_Clientes_agentes_detalleJULIO: TFloatField
      DisplayLabel = 'Julio'
      FieldName = 'JULIO'
    end
    object xVentas_Clientes_agentes_detalleAGOSTO: TFloatField
      DisplayLabel = 'Agosto'
      FieldName = 'AGOSTO'
    end
    object xVentas_Clientes_agentes_detalleSEPTIEMBRE: TFloatField
      DisplayLabel = 'Septiembre'
      FieldName = 'SEPTIEMBRE'
    end
    object xVentas_Clientes_agentes_detalleOCTUBRE: TFloatField
      DisplayLabel = 'Octubre'
      FieldName = 'OCTUBRE'
    end
    object xVentas_Clientes_agentes_detalleNOVIEMBRE: TFloatField
      DisplayLabel = 'Noviembre'
      FieldName = 'NOVIEMBRE'
    end
    object xVentas_Clientes_agentes_detalleDICIEMBRE: TFloatField
      DisplayLabel = 'Diciembre'
      FieldName = 'DICIEMBRE'
    end
    object xVentas_Clientes_agentes_detalleUENERO: TFloatField
      DisplayLabel = 'Uds. Enero'
      FieldName = 'UENERO'
    end
    object xVentas_Clientes_agentes_detalleUFEBRERO: TFloatField
      DisplayLabel = 'Uds. Febrero'
      FieldName = 'UFEBRERO'
    end
    object xVentas_Clientes_agentes_detalleUMARZO: TFloatField
      DisplayLabel = 'Uds. Marzo'
      FieldName = 'UMARZO'
    end
    object xVentas_Clientes_agentes_detalleUABRIL: TFloatField
      DisplayLabel = 'Uds. Abril'
      FieldName = 'UABRIL'
    end
    object xVentas_Clientes_agentes_detalleUMAYO: TFloatField
      DisplayLabel = 'Uds. Mayo'
      FieldName = 'UMAYO'
    end
    object xVentas_Clientes_agentes_detalleUJUNIO: TFloatField
      DisplayLabel = 'Uds. Junio'
      FieldName = 'UJUNIO'
    end
    object xVentas_Clientes_agentes_detalleUJULIO: TFloatField
      DisplayLabel = 'Uds. Julio'
      FieldName = 'UJULIO'
    end
    object xVentas_Clientes_agentes_detalleUAGOSTO: TFloatField
      DisplayLabel = 'Uds. Agostro'
      FieldName = 'UAGOSTO'
    end
    object xVentas_Clientes_agentes_detalleUSEPTIEMBRE: TFloatField
      DisplayLabel = 'Uds. Septiembre'
      FieldName = 'USEPTIEMBRE'
    end
    object xVentas_Clientes_agentes_detalleUOCTUBRE: TFloatField
      DisplayLabel = 'Uds. Octubre'
      FieldName = 'UOCTUBRE'
    end
    object xVentas_Clientes_agentes_detalleUNOVIEMBRE: TFloatField
      DisplayLabel = 'Uds. Noviembre'
      FieldName = 'UNOVIEMBRE'
    end
    object xVentas_Clientes_agentes_detalleUDICIEMBRE: TFloatField
      DisplayLabel = 'Uds. Diciembre'
      FieldName = 'UDICIEMBRE'
    end
  end
  object DSxVentas_Clientes_agentes_detalle: TDataSource
    DataSet = xVentas_Clientes_agentes_detalle
    Left = 196
    Top = 254
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
    Left = 478
    Top = 18
  end
  object DSxArt_Desde: TDataSource
    DataSet = xArt_Desde
    Left = 566
    Top = 18
  end
  object DSxArt_Hasta: TDataSource
    DataSet = xArt_Hasta
    Left = 566
    Top = 66
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
    Left = 478
    Top = 66
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
    Left = 474
    Top = 128
  end
  object DSxFam_Desde: TDataSource
    DataSet = xFam_Desde
    Left = 562
    Top = 128
  end
  object DSxFam_Hasta: TDataSource
    DataSet = xFam_Hasta
    Left = 564
    Top = 190
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
    Left = 478
    Top = 190
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
    Left = 478
    Top = 250
  end
  object DSxCli_Desde: TDataSource
    DataSet = xCli_Desde
    Left = 566
    Top = 250
  end
  object DSxCli_Hasta: TDataSource
    DataSet = xCli_Hasta
    Left = 566
    Top = 308
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
    Top = 308
  end
  object DSxSerie_Desde: TDataSource
    DataSet = xSerie_Desde
    Left = 570
    Top = 366
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
    Left = 484
    Top = 366
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
    Left = 488
    Top = 422
  end
  object DSxSerie_Hasta: TDataSource
    DataSet = xSerie_Hasta
    Left = 574
    Top = 420
  end
  object xAgente_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM Ver_agentes'
      'WHERE empresa=?empresa AND agente=?agente')
    UniDirectional = False
    Left = 312
    Top = 430
  end
  object xAgente_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM Ver_agentes'
      'WHERE empresa=?empresa AND agente=?agente')
    UniDirectional = False
    Left = 308
    Top = 374
  end
  object DSxAgente_Desde: TDataSource
    DataSet = xAgente_Desde
    Left = 394
    Top = 374
  end
  object DSxAgente_Hasta: TDataSource
    DataSet = xAgente_Hasta
    Left = 398
    Top = 428
  end
  object frxHYVentasClientesAgentes: TfrxHYReport
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
    OnBeforePrint = frxHYVentasClientesAgentesBeforePrint
    OnGetValue = frxHYVentasClientesAgentesGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 199
    Top = 18
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
