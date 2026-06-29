object DMLstPedidosaProv: TDMLstPedidosaProv
  OldCreateOrder = False
  OnCreate = DMLstPedidosaProvCreate
  OnDestroy = DMLstPedidoaProvDestroy
  Left = 756
  Top = 300
  Height = 399
  Width = 398
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_PEDIDO_PROV'
      'where     empresa=?empresa  and canal=?canal and'
      
        '           serie=?serie and (fecha >= ?desde) and (fecha <= ?has' +
        'ta) and'
      '              (proveedor>=?p_desde) and (proveedor<=?p_hasta) '
      'order by fecha')
    UniDirectional = False
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    Left = 32
    Top = 56
  end
  object DSCabecera: TDataSource
    DataSet = QMCabecera
    Left = 112
    Top = 56
  end
  object frPedido: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Pedidos a Proveedor'
    RebuildPrinter = False
    OnGetValue = frPedidoGetValue
    OnBeforePrint = frPedidoEnterRect
    OnEnterRect = frPedidoEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 32
    Top = 8
    ReportForm = {19000000}
  end
  object frDBCabecera: TfrDBDataSet
    DataSource = DSCabecera
    Left = 200
    Top = 56
  end
  object xProveedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_PROVEEDORES'
      'where proveedor=?proveedor and empresa=?empresa')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 32
    Top = 248
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 200
    Top = 8
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
    Left = 32
    Top = 152
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 112
    Top = 152
  end
  object xEstados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  ESTADO,TITULO'
      'FROM SYS_GES_ESTADOS                '
      'WHERE'
      '  ESTADO=?ESTADO ')
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_GES_ESTADOS'
      'WHERE ESTADO=?ESTADO')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 32
    Top = 104
  end
  object DSxEstado: TDataSource
    DataSet = xEstados
    Left = 112
    Top = 104
  end
  object xProyectos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from emp_proyectos where '
      '  empresa=?empresa and proyecto=?proyecto')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 32
    Top = 200
  end
  object DSxProyectos: TDataSource
    DataSet = xProyectos
    Left = 112
    Top = 200
  end
  object frxPedido: TfrxHYReport
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
    OnBeforePrint = frxPedidoBeforePrint
    OnGetValue = frxPedidoGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 112
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object QMCabeceraImportesPendientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT C.ID_E,'
      '       -- '
      '       C.S_BASES - COALESCE((SELECT SUM(D.B_IMPONIBLE)'
      '                           FROM GES_DETALLES_E D'
      
        '                           JOIN GES_DETALLES_E_PED P ON D.ID_DET' +
        'ALLES_E = P.ID_DETALLES_E'
      '                           WHERE'
      '                           D.ID_E = C.ID_E AND'
      '                           P.LINEA_SERVIDA = 1), 0)'
      
        '                 - COALESCE((SELECT SUM((D.B_IMPONIBLE / D.UNIDA' +
        'DES) * P.UNIDADES_SERVIDAS)'
      '                           FROM GES_DETALLES_E D'
      
        '                           JOIN GES_DETALLES_E_PED P ON D.ID_DET' +
        'ALLES_E = P.ID_DETALLES_E'
      '                           WHERE'
      '                           D.ID_E = C.ID_E AND'
      
        '                           D.UNIDADES <> P.UNIDADES_POR_SERVIR),' +
        ' 0) AS S_BASES,'
      '       --'
      '       C.LIQUIDO - COALESCE((SELECT SUM(D.LIQUIDO)'
      '                           FROM GES_DETALLES_E D'
      
        '                           JOIN GES_DETALLES_E_PED P ON D.ID_DET' +
        'ALLES_E = P.ID_DETALLES_E'
      '                           WHERE'
      '                           D.ID_E = C.ID_E AND'
      '                           P.LINEA_SERVIDA = 1), 0)'
      
        '                 - COALESCE((SELECT SUM((D.LIQUIDO / D.UNIDADES)' +
        ' * P.UNIDADES_SERVIDAS)'
      '                           FROM GES_DETALLES_E D'
      
        '                           JOIN GES_DETALLES_E_PED P ON D.ID_DET' +
        'ALLES_E = P.ID_DETALLES_E'
      '                           WHERE'
      '                           D.ID_E = C.ID_E AND'
      
        '                           D.UNIDADES <> P.UNIDADES_POR_SERVIR),' +
        ' 0) AS LIQUIDO'
      'FROM VER_CABECERAS_PEDIDO_PROV C'
      'WHERE'
      'C.ID_E = :ID_E')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 32
    Top = 296
  end
  object DSCabeceraImportesPendientes: TDataSource
    DataSet = QMCabeceraImportesPendientes
    Left = 112
    Top = 296
  end
end
