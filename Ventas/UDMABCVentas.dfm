object DMABCVentas: TDMABCVentas
  OldCreateOrder = False
  OnCreate = DMABCVentasCreate
  OnDestroy = DMABCVentasDestroy
  Left = 312
  Top = 159
  Height = 610
  Width = 864
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 552
    Top = 8
  end
  object xTmp_Abc_Agentes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM TMP_ABC_AGENTE'
      'WHERE ENTRADA=?ENTRADA'
      'AND TIPO_REGISTROS=1')
    UniDirectional = False
    AfterScroll = xTmp_Abc_AgentesAfterScroll
    Left = 64
    Top = 56
  end
  object DSxTmp_Abc_Agentes: TDataSource
    DataSet = xTmp_Abc_Agentes
    Left = 216
    Top = 56
  end
  object frAbc: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'ABC Art'#237'culo Venta Uds. Secundarias'
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
    Top = 8
    ReportForm = {19000000}
  end
  object frDBxTmp_Abc_Agentes: TfrDBDataSet
    DataSource = DSxTmp_Abc_Agentes
    Left = 384
    Top = 56
  end
  object xAgrupacionCli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_AGRUPACIONES_CLIENTE'
      'WHERE EMPRESA=?EMPRESA AND AGRUPACION=?AGRUPACION')
    UniDirectional = False
    Left = 552
    Top = 56
  end
  object DSxAgrupacionCli: TDataSource
    DataSet = xAgrupacionCli
    Left = 680
    Top = 56
  end
  object xTmp_Abc_Clientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT *'
      'FROM TMP_ABC_CLIENTE'
      'WHERE'
      'ENTRADA = :ENTRADA AND'
      'TIPO_REGISTROS = 1')
    UniDirectional = False
    AfterOpen = xTmp_Abc_ClientesAfterOpen
    Left = 64
    Top = 248
  end
  object DSxTmp_Abc_Clientes: TDataSource
    DataSet = xTmp_Abc_Clientes
    Left = 216
    Top = 248
  end
  object frDBxTmp_Abc_Clientes: TfrDBDataSet
    DataSource = DSxTmp_Abc_Clientes
    Left = 384
    Top = 248
  end
  object xTmp_Abc_Articulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_ABC_ARTICULO'
      'WHERE'
      '  ARTICULO=?ARTICULO AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_ABC_ARTICULO'
      'WHERE ENTRADA=?ENTRADA')
    UniDirectional = False
    AfterScroll = xTmp_Abc_ArticulosAfterScroll
    Left = 64
    Top = 104
  end
  object DSxTmp_Abc_Articulos: TDataSource
    DataSet = xTmp_Abc_Articulos
    Left = 216
    Top = 104
  end
  object frDBxTmp_Abc_Articulos: TfrDBDataSet
    DataSource = DSxTmp_Abc_Articulos
    Left = 384
    Top = 104
  end
  object xAgrupacionAge: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_AGRUPACIONES_AGENTES_EF'
      'WHERE EMPRESA=?EMPRESA AND AGRUPACION=?AGRUPACION')
    UniDirectional = False
    Left = 552
    Top = 104
  end
  object DSxAgrupacionAge: TDataSource
    DataSet = xAgrupacionAge
    Left = 680
    Top = 104
  end
  object xAgrupacionArt: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_AGRUPACIONES_ART_EF'
      'WHERE EMPRESA=?EMPRESA AND AGRUPACION=?AGRUPACION')
    UniDirectional = False
    Left = 552
    Top = 296
  end
  object DSxAgrupacionArt: TDataSource
    DataSet = xAgrupacionArt
    Left = 680
    Top = 296
  end
  object xAgrupArtTitu: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_AGRUPACIONES'
      'WHERE AGRUPACION=?AGRUPACION')
    UniDirectional = False
    DataSource = DSxTmp_Abc_Articulos
    Left = 552
    Top = 344
    object xAgrupArtTituTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxAgrupArtTitu: TDataSource
    DataSet = xAgrupArtTitu
    Left = 680
    Top = 344
  end
  object xAgrupCliTitu: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_AGRUPACIONES'
      'WHERE AGRUPACION=?AGRUPACION')
    UniDirectional = True
    DataSource = DSxTmp_Abc_Clientes
    Left = 552
    Top = 392
  end
  object DSxAgrupCliTitu: TDataSource
    DataSet = xAgrupCliTitu
    Left = 680
    Top = 392
  end
  object xAgrupAgeTitu: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_AGRUPACIONES'
      'WHERE AGRUPACION=?AGRUPACION')
    UniDirectional = False
    DataSource = DSxTmp_Abc_Agentes
    Left = 552
    Top = 440
    object xAgrupAgeTituTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxAgrupAgeTitu: TDataSource
    DataSet = xAgrupAgeTitu
    Left = 680
    Top = 440
  end
  object xTmp_abc_agentes_fam: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from tmp_abc_agente'
      'where agente=?agente and entrada=?entrada and tipo_registros=2')
    UniDirectional = False
    DataSource = DSxTmp_Abc_Agentes
    Left = 64
    Top = 152
  end
  object DSxTmp_abc_agentes_fam: TDataSource
    DataSet = xTmp_abc_agentes_fam
    Left = 216
    Top = 152
  end
  object frDBxTmp_abc_agentes_fam: TfrDBDataSet
    DataSource = DSxTmp_abc_agentes_fam
    Left = 384
    Top = 152
  end
  object xTmp_agentes_art: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from tmp_abc_agente'
      'where agente=?agente and entrada=?entrada and tipo_registros=3')
    UniDirectional = False
    DataSource = DSxTmp_Abc_Agentes
    Left = 64
    Top = 200
  end
  object DSxTmp_agentes_art: TDataSource
    DataSet = xTmp_agentes_art
    Left = 216
    Top = 200
  end
  object frDBxTmp_agentes_art: TfrDBDataSet
    DataSource = DSxTmp_agentes_art
    Left = 384
    Top = 200
  end
  object xTmp_Abc_Clientes_Art: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM TMP_ABC_CLIENTE'
      'WHERE'
      'CLIENTE = :CLIENTE AND'
      'ENTRADA = :ENTRADA AND'
      'TIPO_REGISTROS = 3'
      'ORDER BY ARTICULO')
    UniDirectional = False
    DataSource = DSxTmp_Abc_Clientes
    Left = 64
    Top = 296
  end
  object DSxTmp_Abc_Clientes_Art: TDataSource
    DataSet = xTmp_Abc_Clientes_Art
    Left = 216
    Top = 296
  end
  object frDBxTmp_Abc_Clientes_Art: TfrDBDataSet
    DataSource = DSxTmp_Abc_Clientes_Art
    Left = 384
    Top = 296
  end
  object xTmp_Abc_Clientes_Fam: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM TMP_ABC_CLIENTE'
      'WHERE'
      'CLIENTE = :CLIENTE AND'
      'ENTRADA = :ENTRADA AND'
      'TIPO_REGISTROS = 2'
      'ORDER BY FAMILIA')
    UniDirectional = False
    DataSource = DSxTmp_Abc_Clientes
    Left = 64
    Top = 344
  end
  object DSxTmp_Abc_Clientes_Fam: TDataSource
    DataSet = xTmp_Abc_Clientes_Fam
    Left = 216
    Top = 344
  end
  object frDBxTmp_Abc_Clientes_Fam: TfrDBDataSet
    DataSource = DSxTmp_Abc_Clientes_Fam
    Left = 384
    Top = 344
  end
  object xTmp_Abc_familias: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_ABC_ARTICULO'
      'WHERE'
      '  ARTICULO=?ARTICULO AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_ABC_FAMILIA'
      'WHERE ENTRADA=?ENTRADA')
    UniDirectional = False
    AfterScroll = xTmp_Abc_ArticulosAfterScroll
    Left = 64
    Top = 440
  end
  object DSxTmp_Abc_familias: TDataSource
    DataSet = xTmp_Abc_familias
    Left = 216
    Top = 440
  end
  object frDBxTmp_Abc_familias: TfrDBDataSet
    DataSource = DSxTmp_Abc_familias
    Left = 384
    Top = 440
  end
  object xAgrupacionCliH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_AGRUPACIONES_CLIENTE'
      'WHERE EMPRESA=?EMPRESA AND AGRUPACION=?AGRUPACION')
    UniDirectional = False
    Left = 552
    Top = 152
    object xAgrupacionCliHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxAgrupacionCliH: TDataSource
    DataSet = xAgrupacionCliH
    Left = 680
    Top = 152
  end
  object xAgrupacionAgeH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_AGRUPACIONES_AGENTES_EF'
      'WHERE EMPRESA=?EMPRESA AND AGRUPACION=?AGRUPACION')
    UniDirectional = False
    Left = 552
    Top = 200
    object xAgrupacionAgeHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxAgrupacionAgeH: TDataSource
    DataSet = xAgrupacionAgeH
    Left = 680
    Top = 200
  end
  object xTmp_Abc_Clientes_cli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM TMP_ABC_CLIENTE'
      'WHERE'
      'ENTRADA = :ENTRADA AND'
      'TIPO_REGISTROS = 4 AND'
      'AGRUPACION = :AGRUPACION'
      'ORDER BY CLIENTE')
    UniDirectional = False
    DataSource = DSxTmp_Abc_Clientes
    Left = 64
    Top = 392
  end
  object DSxTmp_Abc_Clientes_cli: TDataSource
    DataSet = xTmp_Abc_Clientes_cli
    Left = 216
    Top = 392
  end
  object frDBxTmp_Abc_Clientes_cli: TfrDBDataSet
    DataSource = DSxTmp_Abc_Clientes_cli
    Left = 384
    Top = 392
  end
  object xAgrupacionArtH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_AGRUPACIONES_ART_EF'
      'WHERE EMPRESA=?EMPRESA AND AGRUPACION=?AGRUPACION')
    UniDirectional = False
    Left = 552
    Top = 248
  end
  object DSxAgrupacionArtH: TDataSource
    DataSet = xAgrupacionArtH
    Left = 680
    Top = 248
  end
  object frxAbc: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    EngineOptions.MaxMemSize = 100
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Modal = False
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
      'read_committed'
      'rec_version'
      'nowait')
    Left = 680
    Top = 8
  end
  object xLstCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT AGENTE'
      'FROM VER_CLIENTES_CUENTAS'
      'WHERE '
      'EMPRESA = ?EMPRESA AND '
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'CLIENTE=?CLIENTE')
    UniDirectional = False
    DataSource = DSxTmp_Abc_Clientes
    Left = 64
    Top = 488
  end
  object DSxLstCliente: TDataSource
    DataSet = xLstCliente
    Left = 216
    Top = 488
  end
end
