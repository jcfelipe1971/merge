object ProDMLstHojaTrabajo: TProDMLstHojaTrabajo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 365
  Top = 159
  Height = 462
  Width = 735
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 180
    Top = 16
  end
  object frListadoHoja: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Hojas de Trabajo'
    RebuildPrinter = False
    OnGetValue = frListadoHojaGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 36
    Top = 18
    ReportForm = {19000000}
  end
  object frDBLstFases: TfrDBDataSet
    DataSource = DSxLstFases
    Left = 36
    Top = 132
  end
  object xEntrePedidos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select min(rig), max(rig) from ver_cabeceras_pedido'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal')
    UniDirectional = False
    Left = 40
    Top = 312
    object xEntrePedidosMIN: TIntegerField
      DisplayLabel = 'Min.'
      FieldName = 'MIN'
    end
    object xEntrePedidosMAX: TIntegerField
      DisplayLabel = 'Max.'
      FieldName = 'MAX'
    end
  end
  object xEntreClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select min(cliente), max(cliente) from ver_clientes_ef'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal')
    UniDirectional = False
    Left = 40
    Top = 365
    object xEntreClientesMIN: TIntegerField
      DisplayLabel = 'Min.'
      FieldName = 'MIN'
    end
    object xEntreClientesMAX: TIntegerField
      DisplayLabel = 'Max.'
      FieldName = 'MAX'
    end
  end
  object xLstFases: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select id_orden, linea_fase, fase, estado '
      'from pro_ord_fases '
      'where id_orden=?id_orden'
      'order by orden')
    UniDirectional = False
    DataSource = DSxLstPedidos
    Left = 240
    Top = 130
  end
  object DSxLstFases: TDataSource
    DataSet = xLstFases
    Left = 140
    Top = 130
  end
  object xLstPedidos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT DET.EMPRESA, DET.EJERCICIO, DET.CANAL, DET.SERIE, DET.RIG' +
        ', DET.LINEA, DET.ARTICULO, ART.TITULO AS TIT_ARTICULO,'
      
        '       DET.UNIDADES, DET.CLIENTE, T.NOMBRE_R_SOCIAL AS TIT_CLIEN' +
        'TE, DET.ALMACEN, DET.FECHA_PEDIDO, DET.ESTADO,'
      '       ORD.RIG_OF, ORD.SITUACION, ORD.ID_ORDEN, ORD.UNI_TOTAL'
      'FROM PRO_DET_PEDIDOS_ORD DET'
      
        'JOIN PRO_PEDIDOS_ORD PED ON (PED.EMPRESA = DET.EMPRESA AND PED.E' +
        'JERCICIO = DET.EJERCICIO AND PED.CANAL = DET.CANAL AND PED.SERIE' +
        ' = DET.SERIE AND PED.TIPO = DET.TIPO AND PED.RIG = DET.RIG AND P' +
        'ED.LINEA = DET.LINEA)'
      
        'JOIN PRO_ORD ORD ON (ORD.EMPRESA = PED.EMPRESA AND ORD.EJERCICIO' +
        ' = PED.EJERCICIO AND ORD.CANAL = PED.CANAL AND ORD.SERIES = PED.' +
        'SERIE AND ORD.RIG_OF = PED.ID_ORDEN)'
      
        'JOIN EMP_CLIENTES CLI ON (CLI.EMPRESA = DET.EMPRESA AND CLI.CLIE' +
        'NTE = DET.CLIENTE)'
      'JOIN SYS_TERCEROS T ON CLI.TERCERO = T.TERCERO'
      
        'JOIN ART_ARTICULOS ART ON (ART.EMPRESA = DET.EMPRESA AND ART.ART' +
        'ICULO = DET.ARTICULO)'
      'WHERE'
      'DET.EMPRESA = :EMPRESA AND'
      'DET.EJERCICIO = :EJERCICIO AND'
      'DET.CANAL = :CANAL AND'
      'DET.SERIE = :SERIE AND'
      'DET.TIPO = :TIPO AND'
      'DET.RIG >= :PEDIDO_D AND'
      'DET.RIG <= :PEDIDO_H'
      '-- AND DET.ESTADO = 0'
      'AND'
      'DET.CLIENTE >= :CLIENTE_D AND'
      'DET.CLIENTE <= :CLIENTE_H'
      'ORDER BY DET.RIG, DET.LINEA')
    UniDirectional = False
    Left = 240
    Top = 76
  end
  object frDBLstPedidos: TfrDBDataSet
    DataSource = DSxLstPedidos
    Left = 36
    Top = 78
  end
  object DSxLstPedidos: TDataSource
    DataSet = xLstPedidos
    Left = 140
    Top = 76
  end
  object frDBLstMateriales: TfrDBDataSet
    DataSource = DSxLstMateriales
    Left = 36
    Top = 180
  end
  object DSxLstMateriales: TDataSource
    DataSet = xLstMateriales
    Left = 140
    Top = 178
  end
  object xLstMateriales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select *'
      'from pro_ord_mat'
      'where id_orden=?id_orden and linea_fase=?linea_fase'
      'order by orden')
    UniDirectional = False
    DataSource = DSxLstFases
    Left = 240
    Top = 178
  end
  object frDBLstTareas: TfrDBDataSet
    DataSource = DSxLstTareas
    Left = 36
    Top = 232
  end
  object DSxLstTareas: TDataSource
    DataSet = xLstTareas
    Left = 140
    Top = 230
  end
  object xLstTareas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select *'
      'from pro_ord_tarea'
      'where id_orden=?id_orden and linea_fase=?linea_fase'
      'order by orden')
    UniDirectional = False
    DataSource = DSxLstFases
    Left = 240
    Top = 230
  end
  object xPedidoD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ver_cabeceras_pedido'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      'and serie=?serie and tipo='#39'PEC'#39' and rig=?rig')
    UniDirectional = False
    Left = 148
    Top = 318
  end
  object DSxPedidoD: TDataSource
    DataSet = xPedidoD
    Left = 148
    Top = 367
  end
  object xPedidoH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ver_cabeceras_pedido'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      'and serie=?serie and tipo='#39'PEC'#39' and rig=?rig')
    UniDirectional = False
    Left = 220
    Top = 318
  end
  object DSxPedidoH: TDataSource
    DataSet = xPedidoH
    Left = 220
    Top = 367
  end
  object xClienteD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ver_clientes_empresa'
      'where empresa=?empresa and cliente=?cliente')
    UniDirectional = False
    Left = 292
    Top = 318
  end
  object DSxClienteD: TDataSource
    DataSet = xClienteD
    Left = 292
    Top = 367
  end
  object xClienteH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ver_clientes_empresa'
      'where empresa=?empresa and cliente=?cliente')
    UniDirectional = False
    Left = 364
    Top = 318
  end
  object DSxClienteH: TDataSource
    DataSet = xClienteH
    Left = 364
    Top = 367
  end
end
