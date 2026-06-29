object DMLstPropPedidos: TDMLstPropPedidos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 268
  Top = 208
  Height = 458
  Width = 929
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 144
    Top = 8
  end
  object DSQMPedidosPorProveedorTodosLosAlm: TDataSource
    DataSet = QMPedidosPorProveedorTodosLosAlm
    Left = 608
    Top = 64
  end
  object frDBQMPedidosPorProveedorTodosLosAlm: TfrDBDataSet
    DataSource = DSQMPedidosPorProveedorTodosLosAlm
    Left = 784
    Top = 80
  end
  object QMPedidosPorProveedorTodosLosAlm: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM LST_PROPUESTA_PEDIDO_ALM_KRI(:EMPRESA, :EJERCICIO,' +
        ' :PROVEEDOR)')
    UniDirectional = False
    DataSource = DSQMProveedores
    Left = 400
    Top = 64
  end
  object DSQMPedidosPorFamiliaTodosLosAlm: TDataSource
    DataSet = QMPedidosPorFamiliaTodosLosAlm
    Left = 608
    Top = 112
  end
  object frDBQMPedidosPorFamiliaTodosLosAlm: TfrDBDataSet
    DataSource = DSQMPedidosPorFamiliaTodosLosAlm
    Left = 784
    Top = 128
  end
  object QMPedidosPorFamiliaTodosLosAlm: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM LST_PROP_PEDIDO_ALM_FAM_KRI(:EMPRESA, :EJERCICIO, ' +
        ':FAMILIA)')
    UniDirectional = False
    DataSource = DSQMFamilias
    Left = 400
    Top = 112
  end
  object QMPedidosPorFamilia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM LST_PROPUESTA_PEDIDO_FAM_KRI(:EMPRESA, :EJERCICIO,' +
        ' :ALMACEN, :FAMILIA)')
    UniDirectional = False
    DataSource = DSQMFamAlm
    Left = 616
    Top = 320
  end
  object DSQMPedidosPorFamilia: TDataSource
    DataSet = QMPedidosPorFamilia
    Left = 616
    Top = 368
  end
  object frDBQMPedidosPorFamilia: TfrDBDataSet
    DataSource = DSQMPedidosPorFamilia
    Left = 784
    Top = 368
  end
  object QMPedidosPorProveedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM LST_PROPUESTA_PEDIDO_KRI(:EMPRESA, :EJERCICIO, :AL' +
        'MACEN, :PROVEEDOR)')
    UniDirectional = False
    DataSource = DSQMProvAlm
    Left = 616
    Top = 192
  end
  object DSQMPedidosPorProveedor: TDataSource
    DataSet = QMPedidosPorProveedor
    Left = 616
    Top = 240
  end
  object frDBQMPedidosPorProveedor: TfrDBDataSet
    DataSource = DSQMPedidosPorProveedor
    Left = 784
    Top = 240
  end
  object frPropuestaDePedido: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Propuesta de Pedidos'
    RebuildPrinter = False
    OnGetValue = frPropuestaDePedidoGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 48
    Top = 8
    ReportForm = {19000000}
  end
  object QMProveedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT DISTINCT TP.EMPRESA, TP.EJERCICIO, TP.PROVEEDOR, TP.NOMBR' +
        'E_R_SOCIAL'
      'FROM TMP_PEDIDOS TP'
      'WHERE'
      'TP.EMPRESA = :EMPRESA AND'
      'TP.EJERCICIO = :EJERCICIO AND'
      'TP.PROVEEDOR >= :DPROVEEDOR AND'
      'TP.PROVEEDOR <= :HPROVEEDOR')
    UniDirectional = False
    AfterScroll = QMProveedoresAfterScroll
    Left = 48
    Top = 64
  end
  object QMAlmacenes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT DISTINCT TP.EMPRESA, TP.EJERCICIO, TP.ALMACEN, AL.TITULO'
      'FROM TMP_PEDIDOS TP'
      
        'JOIN ART_ALMACENES AL ON AL.EMPRESA = TP.EMPRESA AND AL.ALMACEN ' +
        '= TP.ALMACEN'
      'WHERE'
      'TP.EMPRESA = :EMPRESA AND'
      'TP.EJERCICIO = :EJERCICIO AND'
      'TP.ALMACEN >= :DALMACEN AND'
      'TP.ALMACEN <= :HALMACEN'
      'ORDER BY ALMACEN')
    UniDirectional = False
    AfterScroll = QMAlmacenesAfterScroll
    Left = 48
    Top = 192
  end
  object DSQMProveedores: TDataSource
    DataSet = QMProveedores
    Left = 144
    Top = 64
  end
  object DSQMAlmacenes: TDataSource
    DataSet = QMAlmacenes
    Left = 144
    Top = 192
  end
  object frDBQMProveedores: TfrDBDataSet
    DataSource = DSQMProveedores
    Left = 248
    Top = 64
  end
  object QMFamilias: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT DISTINCT TP.EMPRESA, TP.EJERCICIO, AF.FAMILIA, AF.TITULO'
      'FROM TMP_PEDIDOS TP'
      
        'LEFT JOIN ART_ARTICULOS AR ON TP.EMPRESA = AR.EMPRESA AND TP.ART' +
        'ICULO = AR.ARTICULO'
      
        'LEFT JOIN ART_FAMILIAS AF ON AF.EMPRESA = AR.EMPRESA AND AF.FAMI' +
        'LIA = AR.FAMILIA'
      'WHERE'
      'TP.EMPRESA = :EMPRESA AND'
      'TP.EJERCICIO = :EJERCICIO AND'
      'AF.FAMILIA >= :DFAMILIA AND'
      'AF.FAMILIA <= :HFAMILIA')
    UniDirectional = False
    AfterScroll = QMFamiliasAfterScroll
    Left = 48
    Top = 112
  end
  object DSQMFamilias: TDataSource
    DataSet = QMFamilias
    Left = 144
    Top = 112
  end
  object frDBQMFamilias: TfrDBDataSet
    DataSource = DSQMFamilias
    Left = 248
    Top = 112
  end
  object frDBQMAlmacenes: TfrDBDataSet
    DataSource = DSQMAlmacenes
    Left = 248
    Top = 192
  end
  object QMProvAlm: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT DISTINCT TP.EMPRESA, TP.EJERCICIO, TP.ALMACEN, TP.PROVEED' +
        'OR, TP.NOMBRE_R_SOCIAL'
      'FROM TMP_PEDIDOS TP'
      'WHERE'
      'TP.EMPRESA = :EMPRESA AND'
      'TP.EJERCICIO = :EJERCICIO AND'
      'TP.ALMACEN = :ALMACEN AND'
      'TP.PROVEEDOR >= :DPROVEEDOR AND'
      'TP.PROVEEDOR <= :HPROVEEDOR'
      'ORDER BY TP.PROVEEDOR')
    UniDirectional = False
    DataSource = DSQMAlmacenes
    AfterScroll = QMProvAlmAfterScroll
    Left = 400
    Top = 192
  end
  object DSQMProvAlm: TDataSource
    DataSet = QMProvAlm
    Left = 400
    Top = 240
  end
  object frDBQMProvAlm: TfrDBDataSet
    DataSource = DSQMProvAlm
    Left = 488
    Top = 240
  end
  object QMAlmFam: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT DISTINCT TP.EMPRESA, TP.EJERCICIO, TP.ALMACEN, AL.TITULO'
      'FROM TMP_PEDIDOS TP'
      
        'JOIN ART_ALMACENES AL ON AL.EMPRESA = TP.EMPRESA AND AL.ALMACEN ' +
        '= TP.ALMACEN'
      'WHERE'
      'TP.EMPRESA = :EMPRESA AND'
      'TP.EJERCICIO = :EJERCICIO AND'
      'TP.ALMACEN >= :DALMACEN AND'
      'TP.ALMACEN <= :HALMACEN'
      'ORDER BY TP.ALMACEN')
    UniDirectional = False
    AfterScroll = QMAlmFamAfterScroll
    Left = 45
    Top = 320
  end
  object DSQMAlmFam: TDataSource
    DataSet = QMAlmFam
    Left = 144
    Top = 320
  end
  object frDBQMAlmFam: TfrDBDataSet
    DataSource = DSQMAlmFam
    Left = 248
    Top = 320
  end
  object QMFamAlm: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT DISTINCT TP.EMPRESA, TP.EJERCICIO, TP.ALMACEN, AR.FAMILIA' +
        ', AF.TITULO'
      'FROM TMP_PEDIDOS TP'
      
        'JOIN ART_ARTICULOS AR ON TP.EMPRESA = AR.EMPRESA AND TP.ARTICULO' +
        ' = AR.ARTICULO'
      
        'JOIN ART_FAMILIAS AF ON AR.EMPRESA = AF.EMPRESA AND AR.FAMILIA =' +
        ' AF.FAMILIA'
      'WHERE'
      'TP.EMPRESA = :EMPRESA AND'
      'TP.EJERCICIO = :EJERCICIO AND'
      'TP.ALMACEN = :ALMACEN AND'
      'AF.FAMILIA >= :DFAMILIA AND'
      'AF.FAMILIA <= :HFAMILIA'
      'ORDER BY AR.FAMILIA')
    UniDirectional = False
    DataSource = DSQMAlmFam
    AfterScroll = QMFamAlmAfterScroll
    Left = 400
    Top = 320
  end
  object DSQMFamAlm: TDataSource
    DataSet = QMFamAlm
    Left = 400
    Top = 368
  end
  object frDBQMFamAlm: TfrDBDataSet
    DataSource = DSQMFamAlm
    Left = 488
    Top = 368
  end
end
