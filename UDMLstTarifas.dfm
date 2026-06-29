object DMLstTarifas: TDMLstTarifas
  OldCreateOrder = False
  OnCreate = DMLstTarifasCreate
  OnDestroy = DMLstTarifasDestroy
  Left = 486
  Top = 159
  Height = 663
  Width = 683
  object TTarifas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM ART_TARIFAS_C'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'TARIFA >= :TAR_INI AND'
      'TARIFA <= :TAR_FIN'
      'ORDER BY TARIFA')
    UniDirectional = False
    AfterOpen = TTarifasAfterOpen
    Left = 34
    Top = 61
  end
  object TDetalleTarifas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'SELECT TAR.EMPRESA, TAR.TARIFA, ART.ARTICULO, ART.TITULO_LARGO A' +
        'S TITULO, ART.FAMILIA, TAR.UNID_MINIMAS,'
      '       TAR.UNID_MAXIMAS, TAR.PRECIO_VENTA, ART.P_COSTE, ART.BAJA'
      'FROM ART_TARIFAS_PRECIOS TAR'
      
        'JOIN ART_ARTICULOS ART ON ART.EMPRESA = TAR.EMPRESA AND ART.ARTI' +
        'CULO = TAR.ARTICULO'
      'WHERE'
      'TAR.EMPRESA = :EMPRESA AND'
      'TAR.TARIFA = :TARIFA AND'
      'ART.FAMILIA <> :FAMILIA'
      'ORDER BY ART.TITULO_LARGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSTarifas
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_TARIFAS_PRECIOS'
    UpdateTransaction = TLocal
    Left = 95
    Top = 116
  end
  object DSTarifas: TDataSource
    DataSet = TTarifas
    Left = 94
    Top = 60
  end
  object DSDetalleTarifas: TDataSource
    DataSet = TDetalleTarifas
    Left = 177
    Top = 112
  end
  object frTarifas: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Precios por Tarifa Detallado'
    RebuildPrinter = False
    OnGetValue = frTarifasGetValue
    OnBeforePrint = frTarifasEnterRect
    OnEnterRect = frTarifasEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 34
    Top = 8
    ReportForm = {19000000}
  end
  object frDBTarifas: TfrDBDataSet
    DataSource = DSTarifas
    Left = 157
    Top = 60
  end
  object frDBDetalleTarifas: TfrDBDataSet
    DataSource = DSDetalleTarifas
    Left = 267
    Top = 113
  end
  object frDBDColumnas: TfrDBDataSet
    DataSource = DSColumnas
    Left = 174
    Top = 230
  end
  object frDBFilas: TfrDBDataSet
    DataSource = DSArticulos
    Left = 174
    Top = 286
  end
  object TColumnas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT EMPRESA, TARIFA, TITULO, MONEDA'
      'FROM ART_TARIFAS_C'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'TARIFA >= :TAR_INI AND'
      'TARIFA <= :TAR_FIN'
      'ORDER BY TARIFA')
    UniDirectional = False
    Left = 27
    Top = 232
  end
  object TArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT ARTICULO, TITULO_LARGO AS TITULO, P_COSTE, FAMILIA, BAJA'
      'FROM ART_ARTICULOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ARTICULO >= :ART_INI AND'
      'ARTICULO <= :ART_FIN AND'
      'FAMILIA >= :FAM_INI AND'
      'FAMILIA <= :FAM_FIN AND'
      'FAMILIA <> :FAMILIA'
      'ORDER BY ARTICULO')
    UniDirectional = False
    Left = 35
    Top = 286
  end
  object DSColumnas: TDataSource
    DataSet = TColumnas
    Left = 98
    Top = 230
  end
  object DSArticulos: TDataSource
    DataSet = TArticulos
    Left = 104
    Top = 287
  end
  object QPrecio: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT precio_venta FROM art_tarifas_precios'
      'WHERE '
      '    empresa=?empresa and'
      '    articulo=?articulo and '
      '    tarifa=?tarifa and'
      '    unid_minimas= (Select max(unid_minimas) from art_tarifas_d '
      
        '                              where empresa=?empresa and tarifa=' +
        '?tarifa and'
      '                              unid_minimas <= ?cantidad)')
    Transaction = TLocal
    AutoTrans = True
    Left = 390
    Top = 454
  end
  object min_tarifa: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select min(tarifa) as minimo  from art_tarifas_c'
      'where empresa=?empresa')
    Transaction = TLocal
    AutoTrans = True
    Left = 390
    Top = 512
  end
  object xTarifa_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM ART_TARIFAS_C'
      'WHERE empresa=?empresa AND tarifa=?tarifa')
    UniDirectional = False
    Left = 448
    Top = 8
  end
  object xTarifa_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM ART_TARIFAS_C'
      'WHERE empresa=?empresa AND tarifa=?tarifa')
    UniDirectional = False
    Left = 448
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 158
    Top = 8
  end
  object DSxTarifa_Desde: TDataSource
    DataSet = xTarifa_Desde
    Left = 536
    Top = 8
  end
  object DSxTarifa_Hasta: TDataSource
    DataSet = xTarifa_Hasta
    Left = 536
    Top = 56
  end
  object xArt_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM VER_ARTICULOS'
      'WHERE empresa=?empresa AND articulo=?articulo')
    UniDirectional = False
    Left = 456
    Top = 104
  end
  object xArt_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM VER_ARTICULOS'
      'WHERE empresa=?empresa AND articulo=?articulo')
    UniDirectional = False
    Left = 456
    Top = 152
  end
  object DSxArt_Desde: TDataSource
    DataSet = xArt_Desde
    Left = 536
    Top = 104
  end
  object DSxArt_Hasta: TDataSource
    DataSet = xArt_Hasta
    Left = 536
    Top = 144
  end
  object max_tarifa: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(tarifa) as maximo from art_tarifas_c'
      'where empresa=?empresa')
    Transaction = TLocal
    AutoTrans = True
    Left = 462
    Top = 510
  end
  object QMinArticulo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT min(articulo) as minimo FROM ver_articulos'
      'WHERE empresa=?empresa')
    Transaction = TLocal
    AutoTrans = True
    Left = 462
    Top = 454
  end
  object QMaxArticulo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT max(articulo) as maximo FROM ver_articulos'
      'WHERE empresa=?empresa')
    Transaction = TLocal
    AutoTrans = True
    Left = 536
    Top = 454
  end
  object SPPrecioMasIva: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure a_art_precio_mas_iva (?empresa,?ejercicio,?can' +
        'al,'
      ' ?articulo,?pais,?moneda,?precio,?iva_incluido)')
    Transaction = TLocal
    AutoTrans = True
    Left = 534
    Top = 510
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 174
    Top = 166
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, SIGNO_MONEDA FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 94
    Top = 166
  end
  object DSxFamilia_Desde: TDataSource
    DataSet = xFamilia_Desde
    Left = 538
    Top = 198
  end
  object xFamilia_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_FAMILIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  FAMILIA=?FAMILIA ')
    SelectSQL.Strings = (
      'SELECT TITULO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND FAMILIA=?FAMILIA')
    UniDirectional = False
    Left = 456
    Top = 204
  end
  object QMinFamilia: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(FAMILIA) AS MINIMO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND'
      '               FAMILIA<>?FAM_SISTEMA')
    Transaction = TLocal
    AutoTrans = True
    Left = 618
    Top = 456
  end
  object QMaxFamilia: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(FAMILIA) AS MAXIMO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND'
      '               FAMILIA<>?FAM_SISTEMA')
    Transaction = TLocal
    AutoTrans = True
    Left = 618
    Top = 508
  end
  object xAlmacen_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ALMACENES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ALMACEN=?ALMACEN ')
    SelectSQL.Strings = (
      'SELECT titulo FROM ART_ALMACENES'
      'where empresa=?empresa and almacen=?almacen')
    UniDirectional = False
    Left = 452
    Top = 358
  end
  object DSxAlmacen_Desde: TDataSource
    DataSet = xAlmacen_Desde
    Left = 548
    Top = 304
  end
  object DSxAlmacen_Hasta: TDataSource
    DataSet = xAlmacen_Hasta
    Left = 548
    Top = 352
  end
  object xAlmacen_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ALMACENES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ALMACEN=?ALMACEN ')
    SelectSQL.Strings = (
      'SELECT titulo FROM ART_ALMACENES'
      'where empresa=?empresa and almacen=?almacen')
    UniDirectional = False
    Left = 454
    Top = 303
  end
  object QMinAlmacen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT min(almacen) AS  MINIMO FROM ART_ALMACENES'
      'where empresa=?EMPRESA'
      '')
    Transaction = TLocal
    AutoTrans = True
    Left = 390
    Top = 576
  end
  object QMaxAlmacen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT max(almacen) AS  MAXIMO FROM ART_ALMACENES'
      'where empresa=?EMPRESA'
      ''
      ''
      '')
    Transaction = TLocal
    AutoTrans = True
    Left = 478
    Top = 576
  end
  object DSxFamilia_Hasta: TDataSource
    DataSet = xFamilia_Hasta
    Left = 538
    Top = 254
  end
  object xFamilia_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_FAMILIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  FAMILIA=?FAMILIA ')
    SelectSQL.Strings = (
      'SELECT TITULO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND FAMILIA=?FAMILIA')
    UniDirectional = False
    Left = 456
    Top = 252
  end
  object xDisponibilidad: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ALMACENES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ALMACEN=?ALMACEN ')
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_ART_DISPONIBILIDAD'
      '  WHERE DISPONIBILIDAD = ?DISPONIBILIDAD')
    UniDirectional = False
    Left = 452
    Top = 406
  end
  object DSxDisponibilidad: TDataSource
    DataSet = xDisponibilidad
    Left = 540
    Top = 408
  end
  object TTarifasDetallado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT *'
      'FROM LST_PRECIO_TARIFA_DET(:EMPRESA, :EJERCICIO, :CANAL, '
      ':TARIFA_DESDE, :TARIFA_HASTA, :FAMILIA_DESDE, :FAMILIA_HASTA,'
      
        ':ARTICULO_DESDE, :ARTICULO_HASTA, :ALMACEN_DESDE, :ALMACEN_HASTA' +
        ','
      ':DISPONIBILIDAD)'
      'ORDER BY TARIFA,FAMILIA,ARTICULO')
    UniDirectional = False
    AfterOpen = TTarifasAfterOpen
    Left = 34
    Top = 347
    object TTarifasDetalladoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object TTarifasDetalladoARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object TTarifasDetalladoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object TTarifasDetalladoEXISTENCIAS: TFloatField
      DisplayLabel = 'Existencias'
      FieldName = 'EXISTENCIAS'
    end
    object TTarifasDetalladoP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object TTarifasDetalladoPRECIO_VENTA: TFloatField
      DisplayLabel = 'Precio Venta'
      FieldName = 'PRECIO_VENTA'
    end
    object TTarifasDetalladoTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      OnChange = TTarifasDetalladoTARIFAChange
      Size = 3
    end
    object TTarifasDetalladoFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      OnChange = TTarifasDetalladoFAMILIAChange
      Size = 5
    end
    object TTarifasDetalladoALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object TTarifasDetalladoBAJA: TIntegerField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
  end
  object DSTarifasDetallado: TDataSource
    DataSet = TTarifasDetallado
    Left = 128
    Top = 346
  end
  object frDBTarifasDetallado: TfrDBDataSet
    DataSource = DSTarifasDetallado
    Left = 230
    Top = 346
  end
  object DSxTitTarifa: TDataSource
    DataSet = xTitTarifa
    Left = 238
    Top = 414
  end
  object xTitTarifa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM ART_TARIFAS_C'
      'WHERE empresa=?empresa AND tarifa=?tarifa'
      '')
    UniDirectional = False
    DataSource = DSTarifasDetallado
    Left = 120
    Top = 413
    object xTitTarifaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxTitFamilia: TDataSource
    DataSet = xTitFamilia
    Left = 244
    Top = 468
  end
  object xTitFamilia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND FAMILIA=?FAMILIA')
    UniDirectional = False
    DataSource = DSTarifasDetallado
    Left = 122
    Top = 466
    object xTitFamiliaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxTitFamilia2: TDataSource
    DataSet = xTitFamilia2
    Left = 356
    Top = 230
  end
  object xTitFamilia2: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND FAMILIA=?FAMILIA')
    UniDirectional = False
    Left = 266
    Top = 231
    object xTitFamilia2TITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object frxTarifas: TfrxHYReport
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
    OnBeforePrint = frxTarifasBeforePrint
    OnGetValue = frxTarifasGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 95
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDBFilas: TfrxDBDataset
    UserName = 'frxDBFilas'
    CloseDataSource = False
    DataSource = DSArticulos
    Left = 248
    Top = 286
  end
end
