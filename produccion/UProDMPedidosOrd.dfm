object ProDMPedidosOrd: TProDMPedidosOrd
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 971
  Top = 238
  Height = 238
  Width = 382
  object QMDetallePedidos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_DET_PEDIDOS_ORD'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_DET_PEDIDOS_ORD'
      
        '  (FECHA_PEDIDO,NOTAS,PRO_B_IMPONIBLE,PRO_UNIDADES,B_IMPONIBLE,P' +
        'RECIO,UNIDADES,ENTRADA,ESCANDALLO,CLIENTE,RIG,SERIE,ESTADO,MARCA' +
        ',TITULO,LINEA,CANAL,EJERCICIO,EMPRESA,ALMACEN,ARTICULO,TIPO)'
      'VALUES'
      
        '  (?FECHA_PEDIDO,?NOTAS,?PRO_B_IMPONIBLE,?PRO_UNIDADES,?B_IMPONI' +
        'BLE,?PRECIO,?UNIDADES,?ENTRADA,?ESCANDALLO,?CLIENTE,?RIG,?SERIE,' +
        '?ESTADO,?MARCA,?TITULO,?LINEA,?CANAL,?EJERCICIO,?EMPRESA,?ALMACE' +
        'N,?ARTICULO,?TIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_DET_PEDIDOS_ORD'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_DET_PEDIDOS_ORD'
      
        'Where empresa=?empresa and ejercicio=?ejercicio and Estado=?Esta' +
        'do'
      'order by rig,linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_DET_PEDIDOS_ORD'
      'SET'
      '  FECHA_PEDIDO=?FECHA_PEDIDO '
      '  ,NOTAS=?NOTAS '
      '  ,PRO_B_IMPONIBLE=?PRO_B_IMPONIBLE '
      '  ,PRO_UNIDADES=?PRO_UNIDADES '
      '  ,B_IMPONIBLE=?B_IMPONIBLE '
      '  ,PRECIO=?PRECIO '
      '  ,UNIDADES=?UNIDADES '
      '  ,ENTRADA=?ENTRADA '
      '  ,ESCANDALLO=?ESCANDALLO '
      '  ,CLIENTE=?CLIENTE '
      '  ,ESTADO=?ESTADO '
      '  ,MARCA=?MARCA '
      '  ,TITULO=?TITULO '
      '  ,ALMACEN=?ALMACEN '
      '  ,ARTICULO=?ARTICULO '
      '  ,TIPO=?TIPO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    AfterOpen = QMDetallePedidosAfterOpen
    BeforeClose = QMDetallePedidosBeforeClose
    OnCalcFields = QMDetallePedidosCalcFields
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'RIG '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_DET_PEDIDOS_ORD'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMDetallePedidosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetallePedidosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetallePedidosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetallePedidosSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetallePedidosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetallePedidosRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDetallePedidosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetallePedidosARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDetallePedidosTITULO: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMDetallePedidosUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object QMDetallePedidosPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDetallePedidosB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMDetallePedidosPRO_UNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'PRO_UNIDADES'
    end
    object QMDetallePedidosPRO_B_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'PRO_B_IMPONIBLE'
    end
    object QMDetallePedidosNOTAS: TMemoField
      DefaultExpression = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMDetallePedidosMARCA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'MARCA'
    end
    object QMDetallePedidosESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMDetallePedidosCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMDetallePedidosALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetallePedidosFECHA_PEDIDO: TDateTimeField
      DisplayLabel = 'Fec. Ped.'
      FieldName = 'FECHA_PEDIDO'
    end
    object QMDetallePedidosESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QMDetallePedidosENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMDetallePedidosSITUACION: TStringField
      DisplayLabel = 'Situaci'#243'n'
      FieldKind = fkCalculated
      FieldName = 'SITUACION'
      Size = 30
      Calculated = True
    end
    object QMDetallePedidosUDS_PRODUCIDAS: TFloatField
      DisplayLabel = 'Uds. Producidas'
      FieldName = 'UDS_PRODUCIDAS'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 240
    Top = 16
  end
  object DSQMDetallePedidos: TDataSource
    DataSet = QMDetallePedidos
    Left = 144
    Top = 16
  end
  object DSQMProPedidosOrd: TDataSource
    DataSet = QMProPedidosOrd
    Left = 144
    Top = 64
  end
  object QMProPedidosOrd: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_PEDIDOS_ORD'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA AND '
      '  RIG_OF=?old_RIG_OF ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_PEDIDOS_ORD'
      
        '  (FECHA_PEDIDO,NOTAS,UNIDADES,FECHA,UDS_MANUAL,ENTRADA,ESCANDAL' +
        'LO,CLIENTE,SERIE,RIG_OF,RIG,TITULO,MARCA,LINEA,CANAL,EJERCICIO,E' +
        'MPRESA,ARTICULO,ALMACEN_ENT,ALMACEN_SAL,ALMACEN_LAN,ID_ORDEN)'
      'VALUES'
      
        '  (?FECHA_PEDIDO,?NOTAS,?UNIDADES,?FECHA,?UDS_MANUAL,?ENTRADA,?E' +
        'SCANDALLO,?CLIENTE,?SERIE,?RIG_OF,?RIG,?TITULO,?MARCA,?LINEA,?CA' +
        'NAL,?EJERCICIO,?EMPRESA,?ARTICULO,?ALMACEN_ENT,?ALMACEN_SAL,?ALM' +
        'ACEN_LAN,?ID_ORDEN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_PEDIDOS_ORD'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA AND '
      '  RIG_OF=?RIG_OF ')
    SelectSQL.Strings = (
      'SELECT ord.situacion,ped.* FROM PRO_PEDIDOS_ORD ped'
      'left join pro_ord ord on'
      '  (ord.empresa=ped.empresa and'
      '   ord.ejercicio=ped.ejercicio and'
      '   ord.canal=ped.canal and'
      '   ord.series=ped.serie and'
      '   ord.rig_of=ped.id_orden) '
      'Where ped.Empresa=?Empresa and'
      '            ped.Ejercicio=?Ejercicio and'
      '            ped.Canal=?Canal and'
      '            ped.Serie=?Serie and'
      '            ped.Rig=?Rig and'
      '            ped.Linea=?Linea'
      'order by fecha')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_PEDIDOS_ORD'
      'SET'
      '  FECHA_PEDIDO=?FECHA_PEDIDO '
      '  ,NOTAS=?NOTAS '
      '  ,UNIDADES=?UNIDADES '
      '  ,FECHA=?FECHA '
      '  ,UDS_MANUAL=?UDS_MANUAL '
      '  ,ENTRADA=?ENTRADA '
      '  ,ESCANDALLO=?ESCANDALLO '
      '  ,CLIENTE=?CLIENTE '
      '  ,TITULO=?TITULO '
      '  ,MARCA=?MARCA '
      '  ,ARTICULO=?ARTICULO '
      '  ,ALMACEN_ENT=?ALMACEN_ENT '
      '  ,ALMACEN_SAL=?ALMACEN_SAL '
      '  ,ALMACEN_LAN=?ALMACEN_LAN '
      '  ,ID_ORDEN=?ID_ORDEN '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA AND '
      '  RIG_OF=?RIG_OF ')
    DataSource = DSQMDetallePedidos
    OnCalcFields = QMProPedidosOrdCalcFields
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'RIG '
      'LINEA '
      'RIG_OF ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_PEDIDOS_ORD'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 64
    object QMProPedidosOrdSITUACION: TIntegerField
      DisplayLabel = 'Situaci'#243'n'
      FieldName = 'SITUACION'
    end
    object QMProPedidosOrdFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMProPedidosOrdUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object QMProPedidosOrdNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMProPedidosOrdUDS_MANUAL: TFloatField
      DisplayLabel = 'Uds. Manual'
      FieldName = 'UDS_MANUAL'
    end
    object QMProPedidosOrdSITUACION_STR: TStringField
      FieldKind = fkCalculated
      FieldName = 'Situaci'#243'n'
      Size = 30
      Calculated = True
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 304
    Top = 16
  end
end
