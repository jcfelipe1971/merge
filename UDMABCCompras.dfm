object DMABCCompras: TDMABCCompras
  OldCreateOrder = False
  OnCreate = DMABCComprasCreate
  OnDestroy = DMABCComprasDestroy
  Left = 322
  Top = 178
  Height = 765
  Width = 1133
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 808
    Top = 16
  end
  object QDameFecha: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select duracion,apertura from sys_empresas'
      '  where empresa=?empresa')
    Transaction = TLocal
    AutoTrans = True
    Left = 544
    Top = 352
  end
  object frAbc: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frAbcGetValue
    OnBeforePrint = frAbcEnterRect
    OnEnterRect = frAbcEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 64
    Top = 16
    ReportForm = {19000000}
  end
  object QMaxProveedor: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(PROVEEDOR) AS MAXIMO'
      'FROM VER_PROVEEDORES_EMPRESA'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 624
    Top = 352
  end
  object xTmp_Abc_Proveedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_ABC_PROVEEDOR'
      'WHERE'
      '  PROVEEDOR=?PROVEEDOR AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_ABC_PROVEEDOR'
      'WHERE'
      'ENTRADA=?ENTRADA AND'
      'TIPO_REGISTROS=1')
    UniDirectional = False
    AfterScroll = xTmp_Abc_ProveedoresAfterScroll
    Left = 64
    Top = 64
  end
  object DSxTmp_Abc_Proveedores: TDataSource
    DataSet = xTmp_Abc_Proveedores
    Left = 216
    Top = 64
  end
  object frDBxTmp_Abc_Proveedores: TfrDBDataSet
    DataSource = DSxTmp_Abc_Proveedores
    Left = 384
    Top = 64
  end
  object xTmp_Abc_Articulos_Pro: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_ABC_ARTICULO_PRO'
      'WHERE'
      '  ARTICULO=?ARTICULO AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_ABC_ARTICULO_PRO'
      '  where entrada=?entrada')
    UniDirectional = False
    Left = 64
    Top = 240
  end
  object DSxTmp_Abc_Articulos: TDataSource
    DataSet = xTmp_Abc_Articulos_Pro
    Left = 216
    Top = 240
  end
  object frDBxTmp_Abc_Articulos: TfrDBDataSet
    DataSource = DSxTmp_Abc_Articulos
    Left = 384
    Top = 240
  end
  object QMinArticulo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(ARTICULO) AS MINIMO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 544
    Top = 400
  end
  object QMaxArticulo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(ARTICULO) AS MAXIMO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 624
    Top = 400
  end
  object QMinFamilia: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(FAMILIA) AS MINIMO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 544
    Top = 448
  end
  object QMaxFamilia: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(FAMILIA) AS MAXIMO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 624
    Top = 448
  end
  object QMaxAcreedor: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(ACREEDOR) AS MAXIMO'
      'FROM VER_ACREEDORES'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 704
    Top = 448
  end
  object xAcreedorD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_ACREEDORES'
      'WHERE EMPRESA=?EMPRESA AND ACREEDOR=?ACREEDOR')
    UniDirectional = False
    Left = 544
    Top = 208
  end
  object DSxAcreedorD: TDataSource
    DataSet = xAcreedorD
    Left = 624
    Top = 208
  end
  object xAcreedorH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_ACREEDORES'
      'WHERE EMPRESA=?EMPRESA AND ACREEDOR=?ACREEDOR')
    UniDirectional = False
    Left = 544
    Top = 256
  end
  object DSxAcreedorH: TDataSource
    DataSet = xAcreedorH
    Left = 624
    Top = 256
  end
  object xTmp_Abc_acreedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_ABC_PROVEEDOR'
      'WHERE'
      '  PROVEEDOR=?PROVEEDOR AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_ABC_ACREEDOR'
      '  where entrada=?entrada')
    UniDirectional = False
    Left = 64
    Top = 296
  end
  object DSxTmp_Abc_acreedores: TDataSource
    DataSet = xTmp_Abc_acreedores
    Left = 216
    Top = 296
  end
  object frDBxTmp_Abc_acreedores: TfrDBDataSet
    DataSource = DSxTmp_Abc_acreedores
    Left = 384
    Top = 296
  end
  object SPAcumulaAcr: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure g_compras_abc_Acreedor(?empresa,?ejercicio,?ca' +
        'nal,?serie,'
      '  ?acreedord,?acreedorh,?fechad,?fechah,?borrar,?alcance,'
      '  ?entrada,?CanalCal)')
    Transaction = TLocal
    AutoTrans = True
    Left = 544
    Top = 304
  end
  object xAgrupProv: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_AGRUPACIONES'
      'WHERE AGRUPACION=?AGRUPACION')
    UniDirectional = False
    DataSource = DSxTmp_Abc_Proveedores
    Left = 544
    Top = 112
    object xAgrupProvTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxAgrupProv: TDataSource
    DataSet = xAgrupProv
    Left = 624
    Top = 112
  end
  object xAgrupacionProv: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_AGRUPACIONES_PROVEEDORES_EF'
      'WHERE EMPRESA=?EMPRESA AND AGRUPACION=?AGRUPACION')
    UniDirectional = False
    Left = 544
    Top = 160
    object xAgrupacionProvTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxAgrupacionProv: TDataSource
    DataSet = xAgrupacionProv
    Left = 624
    Top = 160
  end
  object frxAbc: TfrxHYReport
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
    OnBeforePrint = frxAbcBeforePrint
    OnGetValue = frxAbcGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 216
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
      'read_committed'
      'rec_version'
      'nowait')
    Left = 736
    Top = 16
  end
  object xTmp_Abc_Familias: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_ABC_FAMILIA_PRO'
      'WHERE'
      '  ARTICULO=?ARTICULO AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_ABC_FAMILIA_PRO'
      'WHERE ENTRADA=?ENTRADA')
    UniDirectional = False
    Left = 64
    Top = 344
  end
  object DSxTmp_Abc_familias: TDataSource
    DataSet = xTmp_Abc_Familias
    Left = 216
    Top = 344
  end
  object frDBDSxTmp_Abc_familias: TfrDBDataSet
    DataSource = DSxTmp_Abc_familias
    Left = 384
    Top = 344
  end
  object xTmp_Abc_Prov_Art: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM TMP_ABC_PROVEEDOR'
      'WHERE'
      'PROVEEDOR=?PROVEEDOR AND'
      'ENTRADA=?ENTRADA AND'
      'TIPO_REGISTROS=3'
      'ORDER BY ARTICULO')
    UniDirectional = False
    DataSource = DSxTmp_Abc_Proveedores
    Left = 64
    Top = 112
  end
  object DSxTmp_Abc_Prov_Art: TDataSource
    DataSet = xTmp_Abc_Prov_Art
    Left = 216
    Top = 112
  end
  object frDBxTmp_Abc_Prov_Art: TfrDBDataSet
    DataSource = DSxTmp_Abc_Prov_Art
    Left = 384
    Top = 112
  end
  object xTmp_Abc_Prov_Fam: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM TMP_ABC_PROVEEDOR'
      'WHERE'
      'PROVEEDOR=?PROVEEDOR AND'
      'ENTRADA=?ENTRADA AND'
      'TIPO_REGISTROS=2'
      'ORDER BY FAMILIA, SUBFAMILIA')
    UniDirectional = False
    DataSource = DSxTmp_Abc_Proveedores
    Left = 64
    Top = 160
  end
  object DSxTmp_Abc_Prov_Fam: TDataSource
    DataSet = xTmp_Abc_Prov_Fam
    Left = 216
    Top = 160
  end
  object frDBxTmp_Abc_Prov_Fam: TfrDBDataSet
    DataSource = DSxTmp_Abc_Prov_Fam
    Left = 384
    Top = 160
  end
end
