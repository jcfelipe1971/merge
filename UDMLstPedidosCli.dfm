object DMLstPedidoscli: TDMLstPedidoscli
  OldCreateOrder = False
  OnCreate = DMLstPedidoscliCreate
  OnDestroy = DMLstPedidoDestroy
  Left = 770
  Top = 274
  Height = 333
  Width = 472
  object DSCabecera: TDataSource
    DataSet = QMCabecera
    Left = 112
    Top = 56
  end
  object frPedido: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Ped. entre Fechas y Clientes'
    RebuildPrinter = False
    OnGetValue = frPedidoGetValue
    OnBeforePrint = frPedidoEnterRect
    OnEnterRect = frPedidoEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 192
    Top = 8
    ReportForm = {19000000}
  end
  object frDBCabecera: TfrDBDataSet
    DataSource = DSCabecera
    Left = 192
    Top = 56
  end
  object xClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES'
      'where (empresa=?empresa) and (cliente=?cliente)')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 32
    Top = 200
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 32
    Top = 8
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_PEDIDO'
      'where     empresa=?empresa and '
      '               canal=?canal and serie=?serie and'
      '              (fecha >= ?desde) and (fecha <= ?hasta) and'
      '              (cliente>=?c_desde) and (cliente<=?c_hasta)'
      'order by fecha')
    UniDirectional = False
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    Left = 32
    Top = 56
  end
  object frxPedido: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.9724760301
    ReportOptions.LastChange = 38691.9724760301
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxPedidoBeforePrint
    OnGetValue = frxPedidoGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 288
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDBCabecera: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSCabecera
    Left = 288
    Top = 56
  end
  object xProyectos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from emp_proyectos where '
      '  empresa=?empresa and proyecto=?proyecto')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 32
    Top = 152
  end
  object DSxProyectos: TDataSource
    DataSet = xProyectos
    Left = 112
    Top = 152
  end
  object QMDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_PEDIDO'
      'WHERE '
      'ID_S= ?ID_S'
      'ORDER BY ORDEN')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 32
    Top = 104
  end
  object DSDetalle: TDataSource
    DataSet = QMDetalle
    Left = 112
    Top = 104
  end
  object frDBDetalle: TfrDBDataSet
    DataSource = DSDetalle
    Left = 192
    Top = 104
  end
  object DSCabeceraImportesPendientes: TDataSource
    DataSet = QMCabeceraImportesPendientes
    Left = 112
    Top = 248
  end
  object QMCabeceraImportesPendientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT C.S_BASES - COALESCE((SELECT SUM(D.B_DTO_LINEA)'
      '                           FROM GES_DETALLES_S D'
      
        '                           JOIN GES_DETALLES_S_PED P ON D.ID_DET' +
        'ALLES_S = P.ID_DETALLES_S'
      '                           WHERE'
      '                           D.ID_S = C.ID_S AND'
      '                           P.SERVIDO = 1), 0)'
      
        '                 - COALESCE((SELECT SUM((D.B_DTO_LINEA / D.UNIDA' +
        'DES) * P.U_SERVIDAS)'
      '                           FROM GES_DETALLES_S D'
      
        '                           JOIN GES_DETALLES_S_PED P ON D.ID_DET' +
        'ALLES_S = P.ID_DETALLES_S'
      '                           WHERE'
      '                           D.ID_S = C.ID_S AND'
      '                           P.SERVIDO = 0 AND'
      
        '                           D.UNIDADES <> P.U_PENDIENTES), 0) AS ' +
        'S_BASES,'
      '       --'
      '       C.LIQUIDO - COALESCE((SELECT SUM(D.LIQUIDO)'
      '                           FROM GES_DETALLES_S D'
      
        '                           JOIN GES_DETALLES_S_PED P ON D.ID_DET' +
        'ALLES_S = P.ID_DETALLES_S'
      '                           WHERE'
      '                           D.ID_S = C.ID_S AND'
      '                           P.SERVIDO = 1), 0)'
      
        '                 - COALESCE((SELECT SUM((D.LIQUIDO / D.UNIDADES)' +
        ' * P.U_SERVIDAS)'
      '                           FROM GES_DETALLES_S D'
      
        '                           JOIN GES_DETALLES_S_PED P ON D.ID_DET' +
        'ALLES_S = P.ID_DETALLES_S'
      '                           WHERE'
      '                           D.ID_S = C.ID_S AND'
      '                           P.SERVIDO = 0 AND'
      
        '                           D.UNIDADES <> P.U_PENDIENTES), 0) AS ' +
        'LIQUIDO,'
      '       --'
      '       C.B_COMISION - COALESCE((SELECT SUM(D.B_COMISION)'
      '                              FROM GES_DETALLES_S D'
      
        '                              JOIN GES_DETALLES_S_PED P ON D.ID_' +
        'DETALLES_S = P.ID_DETALLES_S'
      '                              WHERE'
      '                              D.ID_S = C.ID_S AND'
      '                              P.SERVIDO = 1), 0)'
      
        '                   - COALESCE((SELECT SUM((D.B_COMISION / D.UNID' +
        'ADES) * P.U_SERVIDAS)'
      '                             FROM GES_DETALLES_S D'
      
        '                             JOIN GES_DETALLES_S_PED P ON D.ID_D' +
        'ETALLES_S = P.ID_DETALLES_S'
      '                             WHERE'
      '                             D.ID_S = C.ID_S AND'
      '                             P.SERVIDO = 0 AND'
      
        '                             D.UNIDADES <> P.U_PENDIENTES), 0) A' +
        'S B_COMISION'
      'FROM VER_CABECERAS_PEDIDO C'
      'WHERE'
      'C.ID_S = :ID_S')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 32
    Top = 248
  end
end
