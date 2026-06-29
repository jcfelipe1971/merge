object DMRDepositosActivos: TDMRDepositosActivos
  OldCreateOrder = False
  OnCreate = DMRDepositosActivosCreate
  OnDestroy = DMRInventario_StocksDestroy
  Left = 337
  Top = 240
  Height = 378
  Width = 691
  object frDepositosActivos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Dep'#243'sitos Activos'
    RebuildPrinter = False
    OnGetValue = frDepositosActivosGetValue
    OnBeforePrint = frDepositosActivosEnterRect
    OnEnterRect = frDepositosActivosEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 42
    Top = 20
    ReportForm = {19000000}
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 246
    Top = 24
  end
  object xArt_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ARTICULO,TITULO FROM VER_ARTICULOS'
      'WHERE empresa=?empresa AND articulo=?articulo'
      '')
    UniDirectional = False
    Left = 367
    Top = 119
    object xArt_DesdeARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArt_DesdeTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xArt_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ARTICULO,TITULO FROM VER_ARTICULOS'
      'WHERE empresa=?empresa AND articulo=?articulo'
      '')
    UniDirectional = False
    Left = 365
    Top = 171
    object xArt_HastaARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArt_HastaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxArt_Desde: TDataSource
    DataSet = xArt_Desde
    Left = 439
    Top = 120
  end
  object DSxArt_Hasta: TDataSource
    DataSet = xArt_Hasta
    Left = 438
    Top = 172
  end
  object QEjercicios: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select apertura,cierre from emp_ejercicios'
      '  where ((empresa=?empresa)and(ejercicio=?ejercicio))')
    Transaction = TLocal
    AutoTrans = True
    Left = 174
    Top = 163
  end
  object xDepositosActivos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM A_ART_DEPOSITOS_ACTIVOS'
      '(?EMPRESA,?EJERCICIO,?CANAL,?PROV_INI,?PROV_FIN,'
      ' ?ARTICULO_INI,?ARTICULO_FIN,?ALMACEN_INI,?ALMACEN_FIN,'
      ' ?FECHA_INI,?FECHA_FIN,?MODO,?MONEDA)')
    UniDirectional = False
    Left = 42
    Top = 88
    object xDepositosActivosALBARAN_NUM: TFloatField
      DisplayLabel = 'Nro. Albaran'
      FieldName = 'ALBARAN_NUM'
    end
    object xDepositosActivosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xDepositosActivosPROVEEDOR: TFloatField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xDepositosActivosNOMBRE_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NOMBRE_PROVEEDOR'
      Size = 60
    end
    object xDepositosActivosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xDepositosActivosTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object xDepositosActivosALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xDepositosActivosCANT_TOTAL: TFloatField
      DisplayLabel = 'Cant. Total'
      FieldName = 'CANT_TOTAL'
    end
    object xDepositosActivosCANT_PENDIENTE: TFloatField
      DisplayLabel = 'Cant. Pend.'
      FieldName = 'CANT_PENDIENTE'
    end
    object xDepositosActivosCANT_FACTURADA: TFloatField
      DisplayLabel = 'Cant. Facturada'
      FieldName = 'CANT_FACTURADA'
    end
    object xDepositosActivosIMPORTE_FAC: TFloatField
      DisplayLabel = 'Imp. Fac.'
      FieldName = 'IMPORTE_FAC'
    end
    object xDepositosActivosMEDIA: TFloatField
      DisplayLabel = 'Media'
      FieldName = 'MEDIA'
    end
  end
  object DSxDepositosActivos: TDataSource
    DataSet = xDepositosActivos
    Left = 141
    Top = 89
  end
  object frDBxDepositosActivos: TfrDBDataSet
    DataSource = DSxDepositosActivos
    Left = 251
    Top = 90
  end
  object xAlm_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ALMACEN,TITULO FROM ART_ALMACENES'
      'WHERE EMPRESA=?EMPRESA AND ALMACEN=?ALMACEN')
    UniDirectional = False
    Left = 526
    Top = 14
    object xAlm_DesdeALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xAlm_DesdeTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxAlm_Desde: TDataSource
    DataSet = xAlm_Desde
    Left = 598
    Top = 16
  end
  object xAlm_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ALMACEN,TITULO FROM ART_ALMACENES'
      'WHERE EMPRESA=?EMPRESA AND ALMACEN=?ALMACEN'
      '')
    UniDirectional = False
    Left = 524
    Top = 68
    object xAlm_HastaALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xAlm_HastaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxAlm_Hasta: TDataSource
    DataSet = xAlm_Hasta
    Left = 599
    Top = 70
  end
  object xProveedorD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT PROVEEDOR,TITULO FROM VER_PROVEEDORES'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND PROVEEDOR=?PROVEEDOR')
    UniDirectional = False
    Left = 365
    Top = 12
    object xProveedorDPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xProveedorDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxProveedorD: TDataSource
    DataSet = xProveedorD
    Left = 440
    Top = 14
  end
  object xProveedorH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT PROVEEDOR,TITULO FROM VER_PROVEEDORES'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND PROVEEDOR=?PROVEEDOR')
    UniDirectional = False
    Left = 366
    Top = 66
    object xProveedorHPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xProveedorHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxProveedorH: TDataSource
    DataSet = xProveedorH
    Left = 442
    Top = 68
  end
  object QMinArt: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(ARTICULO) AS MINIMO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA'
      '')
    Transaction = TLocal
    AutoTrans = True
    Left = 38
    Top = 164
  end
  object QMaxArt: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(ARTICULO) AS MAXIMO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 103
    Top = 164
  end
  object QMaxProv: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(PROVEEDOR) AS MAXIMO '
      'FROM CON_CUENTAS_GES_PRO'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL')
    Transaction = TLocal
    AutoTrans = True
    Left = 102
    Top = 222
  end
  object QMaxAlmacen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(ALMACEN) AS MAXIMO FROM ART_ALMACENES'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 103
    Top = 281
  end
  object QMinProv: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(PROVEEDOR) AS MINIMO'
      'FROM CON_CUENTAS_GES_PRO'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL')
    Transaction = TLocal
    AutoTrans = True
    Left = 34
    Top = 224
  end
  object QMinAlmacen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(ALMACEN) AS MINIMO FROM ART_ALMACENES'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 33
    Top = 281
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT MONEDA, TITULO, SIGNO_MONEDA FROM SYS_MONEDAS' 
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 526
    Top = 127
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 598
    Top = 127
  end
  object frxDepositosActivos: TfrxHYReport
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
    OnBeforePrint = frxDepositosActivosBeforePrint
    OnGetValue = frxDepositosActivosGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 143
    Top = 21
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
    Left = 246
    Top = 152
  end
end
