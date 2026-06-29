object DMLstArticulos: TDMLstArticulos
  OldCreateOrder = False
  OnCreate = DMLstArticulosCreate
  OnDestroy = DMLstArticulosDestroy
  Left = 510
  Top = 172
  Height = 660
  Width = 600
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 160
    Top = 13
  end
  object frArticulos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Art'#237'culos'
    RebuildPrinter = False
    OnGetValue = frArticulosGetValue
    OnBeforePrint = frArticulosEnterRect
    OnEnterRect = frArticulosEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 22
    Top = 12
    ReportForm = {19000000}
  end
  object xTipoIvaD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPO_IVA   '
      'WHERE PAIS=?PAIS AND TIPO=?TIPO')
    UniDirectional = False
    Left = 242
    Top = 408
    object xTipoIvaDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 15
    end
  end
  object DSxTipoIvaD: TDataSource
    DataSet = xTipoIvaD
    Left = 315
    Top = 406
  end
  object xTipoIvaH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPO_IVA   '
      'WHERE PAIS=?PAIS AND TIPO=?TIPO')
    UniDirectional = False
    Left = 242
    Top = 464
    object xTipoIvaHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 15
    end
  end
  object DSxTipoIvaH: TDataSource
    DataSet = xTipoIvaH
    Left = 315
    Top = 462
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_CUENTAS '
      'WHERE EMPRESA=?EMPRESA'
      'AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL')
    UniDirectional = False
    AfterOpen = xArticulosAfterOpen
    AfterScroll = xArticulosAfterScroll
    Left = 22
    Top = 72
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 86
    Top = 72
  end
  object frDBxArticulos: TfrDBDataSet
    DataSource = DSxArticulos
    Left = 160
    Top = 72
  end
  object xTipoIVA: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT P_IVA, P_RECARGO, TITULO FROM SYS_TIPO_IVA   '
      'WHERE PAIS=?PAIS AND TIPO=?TIPO_IVA')
    UniDirectional = False
    DataSource = DSxArticulos
    Left = 21
    Top = 128
  end
  object DSxTipoIVA: TDataSource
    DataSet = xTipoIVA
    Left = 86
    Top = 128
  end
  object frDBxTipoIVA: TfrDBDataSet
    DataSource = DSxTipoIVA
    Left = 160
    Top = 128
  end
  object QMinTipoIVA: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(TIPO) AS MINIMO FROM SYS_TIPO_IVA   '
      'WHERE PAIS=?PAIS')
    Transaction = TLocal
    AutoTrans = True
    Left = 22
    Top = 568
  end
  object QMaxTipoIVA: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(TIPO) AS MAXIMO FROM SYS_TIPO_IVA   '
      'WHERE PAIS=?PAIS')
    Transaction = TLocal
    AutoTrans = True
    Left = 90
    Top = 568
  end
  object QMaxPrecioCoste: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT max(p_coste) as maximo'
      'from ver_articulos_cuentas'
      'where empresa=?empresa and ejercicio=?ejercicio and'
      'canal=?canal')
    Transaction = TLocal
    AutoTrans = True
    Left = 200
    Top = 528
  end
  object QAgrupaciones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_AGRUPACIONES_CLI'
      'WHERE'
      '  AGRUPACION=?AGRUPACION AND '
      '  EMPRESA=?EMPRESA AND '
      '  CLIENTE=?CLIENTE ')
    SelectSQL.Strings = (
      'SELECT DISTINCT agrupacion, titulo FROM emp_agrupaciones_art r'
      'join sys_agrupaciones s'
      'on (r.agrupacion=s.agrupacion)'
      'WHERE'
      '  ((r.empresa=?empresa) and'
      '   (s.tipo=?tipo) and'
      '   (s.Agrupacion=?agrupacion))')
    UniDirectional = False
    Left = 18
    Top = 181
  end
  object DSQAgrupaciones: TDataSource
    DataSet = QAgrupaciones
    Left = 100
    Top = 181
  end
  object frDSQAgrupaciones: TfrDBDataSet
    DataSource = DSQAgrupaciones
    Left = 180
    Top = 181
  end
  object QArtAgrup: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT A.*, E.AGRUPACION, E.REPLICADO'
      'FROM VER_ARTICULOS A'
      
        'JOIN EMP_AGRUPACIONES_ART E ON A.EMPRESA = E.EMPRESA AND A.ARTIC' +
        'ULO = E.ARTICULO'
      'WHERE'
      'E.EMPRESA = :EMPRESA AND'
      'E.AGRUPACION = :AGRUPACION'
      'ORDER BY A.ARTICULO')
    UniDirectional = False
    DataSource = DSQAgrupaciones
    Left = 16
    Top = 248
  end
  object DSCliAgrup: TDataSource
    DataSet = QArtAgrup
    Left = 100
    Top = 248
  end
  object frDSCliAgrup: TfrDBDataSet
    DataSource = DSCliAgrup
    Left = 164
    Top = 252
  end
  object xAgrupacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_AGRUPACIONES'
      'where agrupacion=?agrupacion')
    UniDirectional = False
    Left = 416
    Top = 253
    object xAgrupacionAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object xAgrupacionTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xAgrupacionTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 1
    end
  end
  object DSxAgrupacion: TDataSource
    DataSet = xAgrupacion
    Left = 500
    Top = 253
  end
  object xMinAgrup: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT min(agrupacion) as Agrupacion FROM VER_AGRUPACIONES'
      'where tipo='#39'T'#39)
    UniDirectional = False
    Left = 420
    Top = 317
  end
  object frxArticulos: TfrxHYReport
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
    OnBeforePrint = frxArticulosBeforePrint
    OnGetValue = frxArticulosGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 92
    Top = 12
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object xCodigoBarras: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM ART_ARTICULOS_BARRAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ARTICULO = :ARTICULO'
      'ORDER BY TIPO, BARRAS')
    UniDirectional = False
    DataSource = DSxArticulos
    Left = 25
    Top = 309
  end
  object DSxCodigoBarras: TDataSource
    DataSet = xCodigoBarras
    Left = 107
    Top = 309
  end
  object frDSxCodigoBarras: TfrDBDataSet
    DataSource = DSxCodigoBarras
    Left = 187
    Top = 309
  end
end
