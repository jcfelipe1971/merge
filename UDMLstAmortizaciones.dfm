object DMLstAmortizaciones: TDMLstAmortizaciones
  OldCreateOrder = False
  OnCreate = DMLstAmortizacionesCreate
  OnDestroy = DMLstAmortizacionesDestroy
  Left = 471
  Top = 249
  Height = 466
  Width = 429
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
  object DSxAmortizaciones: TDataSource
    DataSet = xAmortizaciones
    Left = 136
    Top = 104
  end
  object xAmortizaciones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT *'
      'FROM CON_INMOVILIZADOS_DETALLE'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'ARTICULO = :ARTICULO AND'
      'FECHA BETWEEN :FECHA_DESDE AND :FECHA_HASTA'
      'ORDER BY LINEA')
    UniDirectional = False
    Left = 40
    Top = 104
  end
  object frDBxAmortizacion: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxAmortizaciones
    Left = 232
    Top = 104
  end
  object frAmortizacion: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frAmortizacionGetValue
    OnBeforePrint = frAmortizacionEnterRect
    OnEnterRect = frAmortizacionEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 8
    ReportForm = {19000000}
  end
  object xInmovilizado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT *'
      'FROM CON_INMOVILIZADOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'ARTICULO >= :ARTICULO_INI AND'
      'ARTICULO <= :ARTICULO_FIN AND'
      
        'FECHA_ADQUISICION BETWEEN :FECHA_ADQUISICION_DESDE AND :FECHA_AD' +
        'QUISICION_HASTA AND'
      'CANCELADO <= :CANCELADO'
      'ORDER BY ARTICULO')
    UniDirectional = False
    AfterOpen = xInmovilizadoAfterOpen
    AfterScroll = xInmovilizadoAfterScroll
    BeforeClose = xInmovilizadoBeforeClose
    Left = 40
    Top = 56
  end
  object DSInmovilizado: TDataSource
    DataSet = xInmovilizado
    Left = 136
    Top = 56
  end
  object frDBDxInmovilizado: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSInmovilizado
    Left = 232
    Top = 56
  end
  object DSxArt_Desde: TDataSource
    DataSet = xArt_Desde
    Left = 136
    Top = 296
  end
  object xArt_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO FROM CON_INMOVILIZADOS'
      
        'where ((empresa=?empresa)and(articulo=?articulo)and(canal=?canal' +
        '))')
    UniDirectional = False
    Left = 40
    Top = 296
  end
  object xArt_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO FROM CON_INMOVILIZADOS'
      
        'where ((empresa=?empresa)and(articulo=?articulo)and(canal=?canal' +
        '))')
    UniDirectional = False
    Left = 40
    Top = 344
  end
  object DSxArt_Hasta: TDataSource
    DataSet = xArt_Hasta
    Left = 136
    Top = 344
  end
  object DSQTitGrupo: TDataSource
    DataSet = QTitGrupo
    Left = 136
    Top = 152
  end
  object QTitGrupo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      ' FROM SYS_GRUPOS_INMOVILIZADO'
      'WHERE '
      'PAIS=?PAIS AND '
      'PADRE=?PADRE AND '
      'GRUPO=?GRUPO')
    UniDirectional = False
    DataSource = DSInmovilizado
    Left = 40
    Top = 152
  end
  object frDSQTitGrupo: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSQTitGrupo
    Left = 232
    Top = 152
  end
  object DSQTitMetodo: TDataSource
    DataSet = QTitMetodo
    Left = 136
    Top = 200
  end
  object QTitMetodo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPO_AMORTIZACION'
      'WHERE '
      'TIPO=?TIPO_AMORTIZACION')
    UniDirectional = False
    DataSource = DSInmovilizado
    Left = 40
    Top = 200
  end
  object frDSQTitMetodo: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSQTitMetodo
    Left = 232
    Top = 200
  end
  object DSQTitPeriodo: TDataSource
    DataSet = QTitPeriodo
    Left = 136
    Top = 248
  end
  object QTitPeriodo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_PERIODOS_AMORTIZACION'
      'WHERE '
      'PERIODICIDAD=?PERIODOS_AMORTIZACION')
    UniDirectional = False
    DataSource = DSInmovilizado
    Left = 40
    Top = 248
  end
  object frDSQTitPeriodo: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSQTitPeriodo
    Left = 232
    Top = 248
  end
  object frxAmortizacion: TfrxHYReport
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
    OnBeforePrint = frxAmortizacionBeforePrint
    OnGetValue = frxAmortizacionGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 136
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
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 344
    Top = 56
  end
end
