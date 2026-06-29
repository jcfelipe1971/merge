object DMLstComprasPro: TDMLstComprasPro
  OldCreateOrder = False
  OnCreate = DMComprasProCreate
  OnDestroy = DMComprasProDestroy
  Left = 694
  Top = 229
  Height = 374
  Width = 732
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 302
    Top = 11
  end
  object frDBDSxCompras_detalle: TfrDBDataSet
    DataSource = DSxCompras_detalle
    Left = 248
    Top = 146
  end
  object frHYComprasProveedores: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Ventas por Cliente Uds. Secundarias'
    RebuildPrinter = False
    OnGetValue = frHYComprasProveedoresGetValue
    OnBeforePrint = frHYComprasProveedoresEnterRect
    OnEnterRect = frHYComprasProveedoresEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'FRF'
    Left = 54
    Top = 10
    ReportForm = {19000000}
  end
  object QGen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select titulo  from ver_proveedores_empresa'
      '  where empresa=?empresa and proveedor=?proveedor')
    Transaction = TLocal
    AutoTrans = True
    Left = 306
    Top = 74
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
    Left = 20
    Top = 78
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 90
    Top = 78
  end
  object xCompras_detalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from g_compras_articulos_prov_doc (?empresa,?ejercicioD' +
        ',?ejercicioH,'
      ' ?canalD,?canalH,?serieD,?serieH, '
      ' ?proveedorD,?proveedorh, ?entrada,'
      ' ?moneda, ?Albaranes, ?facturas_abiertas, ?facturas_cerradas,'
      ' ?articuloD, ?articuloH, ?familiaD,?familiaH, '
      ' ?fechaD, ?fechaH)'
      '  order by fecha,proveedor,doc_canal,doc_tipo,doc_serie,doc_rig'
      '')
    UniDirectional = False
    Left = 28
    Top = 144
    object xCompras_detalleDOC_EMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'DOC_EMPRESA'
    end
    object xCompras_detalleDOC_EJERCICIO: TIntegerField
      DisplayLabel = 'Ejer. Doc.'
      FieldName = 'DOC_EJERCICIO'
    end
    object xCompras_detalleDOC_CANAL: TIntegerField
      DisplayLabel = 'Canal Doc.'
      FieldName = 'DOC_CANAL'
    end
    object xCompras_detalleDOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xCompras_detalleDOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xCompras_detalleDOC_RIG: TIntegerField
      DisplayLabel = 'Doc. Nro.'
      FieldName = 'DOC_RIG'
    end
    object xCompras_detalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xCompras_detalleTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xCompras_detalleUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xCompras_detalleCOSTE: TFloatField
      DisplayLabel = 'Coste'
      FieldName = 'COSTE'
    end
    object xCompras_detalleFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xCompras_detalleUNIDADES_EXT: TFloatField
      DisplayLabel = 'Uds. Ext.'
      FieldName = 'UNIDADES_EXT'
    end
    object xCompras_detallePROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xCompras_detalleTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_PROVEEDOR'
      Size = 60
    end
    object xCompras_detalleTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
  end
  object DSxCompras_detalle: TDataSource
    DataSet = xCompras_detalle
    Left = 124
    Top = 144
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
    Left = 400
    Top = 10
  end
  object DSxArt_Desde: TDataSource
    DataSet = xArt_Desde
    Left = 488
    Top = 10
  end
  object DSxArt_Hasta: TDataSource
    DataSet = xArt_Hasta
    Left = 640
    Top = 10
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
    Left = 568
    Top = 10
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
    Left = 404
    Top = 64
  end
  object DSxFam_Desde: TDataSource
    DataSet = xFam_Desde
    Left = 492
    Top = 64
  end
  object DSxFam_Hasta: TDataSource
    DataSet = xFam_Hasta
    Left = 646
    Top = 62
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
    Left = 568
    Top = 62
  end
  object xPro_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM Ver_proveedores_empresa'
      'WHERE empresa=?empresa AND proveedor=?proveedor')
    UniDirectional = False
    Left = 408
    Top = 122
  end
  object DSxPro_Desde: TDataSource
    DataSet = xPro_Desde
    Left = 488
    Top = 114
  end
  object DSxPro_Hasta: TDataSource
    DataSet = xPro_Hasta
    Left = 648
    Top = 116
  end
  object xPro_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM Ver_proveedores_empresa'
      'WHERE empresa=?empresa AND proveedor=?proveedor')
    UniDirectional = False
    Left = 570
    Top = 116
  end
  object DSxSerie_Desde: TDataSource
    DataSet = xSerie_Desde
    Left = 492
    Top = 174
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
    Left = 406
    Top = 174
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
    Left = 570
    Top = 174
  end
  object DSxSerie_Hasta: TDataSource
    DataSet = xSerie_Hasta
    Left = 648
    Top = 172
  end
  object frxHYComprasProveedores: TfrxHYReport
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
    OnBeforePrint = frxHYComprasProveedoresBeforePrint
    OnGetValue = frxHYComprasProveedoresGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 191
    Top = 10
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
