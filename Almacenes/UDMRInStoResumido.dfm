object DMRInStoResumido: TDMRInStoResumido
  OldCreateOrder = False
  OnCreate = DMRInStoResumidoCreate
  OnDestroy = DMRCabeceraDestroy
  Left = 393
  Top = 209
  Height = 283
  Width = 771
  object frInStoResumido: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frInStoResumidoGetValue
    OnBeforePrint = frInStoResumidoEnterRect
    OnEnterRect = frInStoResumidoEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 42
    Top = 12
    ReportForm = {19000000}
  end
  object SPInStoResumido: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure a_art_inventario_stocks_res(?ENTRADA,?EMPRESA,' +
        ' '
      '   ?EJERCICIO, ?CANAL, ?ALMACEN, ?ART_INI, ?ART_FIN, '
      '   ?FAM_INI, ?FAM_FIN, ?TIPO_CALCULO, ?CANAL_CALCULO,?MONEDA)')
    Transaction = TLocal
    AutoTrans = True
    Left = 154
    Top = 150
  end
  object xArt_Almacen: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
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
    Left = 593
    Top = 18
  end
  object DSxArt_Almacen: TDataSource
    DataSet = xArt_Almacen
    Left = 684
    Top = 18
  end
  object xArt_Inventario_Tmp: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_INVENTARIO_RES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ENTRADA=?ENTRADA AND '
      '  PERIODO=?PERIODO ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_INVENTARIO_RES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND'
      '  ENTRADA=?ENTRADA   ')
    UniDirectional = False
    Left = 38
    Top = 70
    object xArt_Inventario_TmpEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xArt_Inventario_TmpEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xArt_Inventario_TmpCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xArt_Inventario_TmpENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xArt_Inventario_TmpPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object xArt_Inventario_TmpTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xArt_Inventario_TmpENTRADAS: TFloatField
      DisplayLabel = 'Entradas'
      FieldName = 'ENTRADAS'
    end
    object xArt_Inventario_TmpSALIDAS: TFloatField
      DisplayLabel = 'Salidas'
      FieldName = 'SALIDAS'
    end
  end
  object DSxArt_Inventario_Tmp: TDataSource
    DataSet = xArt_Inventario_Tmp
    Left = 152
    Top = 70
  end
  object frDSxArt_Inventario_Tmp: TfrDBDataSet
    DataSource = DSxArt_Inventario_Tmp
    Left = 280
    Top = 72
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 283
    Top = 11
  end
  object xArt_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM VER_ARTICULOS'
      'WHERE empresa=?empresa AND articulo=?articulo'
      '')
    UniDirectional = False
    Left = 392
    Top = 16
  end
  object xArt_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM VER_ARTICULOS'
      'WHERE empresa=?empresa AND articulo=?articulo'
      '')
    UniDirectional = False
    Left = 392
    Top = 72
  end
  object xFamilia_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM ART_FAMILIAS'
      'WHERE empresa=?empresa AND familia=?familia'
      '')
    UniDirectional = False
    Left = 392
    Top = 125
  end
  object xFamilia_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM ART_FAMILIAS'
      'WHERE empresa=?empresa AND familia=?familia'
      '')
    UniDirectional = False
    Left = 392
    Top = 177
  end
  object DSxFamilia_Hasta: TDataSource
    DataSet = xFamilia_Hasta
    Left = 480
    Top = 177
  end
  object DSxFamilia_Desde: TDataSource
    DataSet = xFamilia_Desde
    Left = 480
    Top = 125
  end
  object DSxArt_Hasta: TDataSource
    DataSet = xArt_Hasta
    Left = 480
    Top = 72
  end
  object DSxArt_Desde: TDataSource
    DataSet = xArt_Desde
    Left = 480
    Top = 16
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT MONEDA, TITULO, SIGNO_MONEDA FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 590
    Top = 79
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 688
    Top = 79
  end
  object frxInStoResumido: TfrxHYReport
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
    OnBeforePrint = frxInStoResumidoBeforePrint
    OnGetValue = frxInStoResumidoGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 152
    Top = 12
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
      'nowait')
    Left = 283
    Top = 139
  end
end
