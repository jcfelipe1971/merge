object ProDMPedidosOrdSelec: TProDMPedidosOrdSelec
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 426
  Top = 161
  Height = 306
  Width = 314
  object DSQMSelec: TDataSource
    DataSet = QAlmacen
    Left = 128
    Top = 8
  end
  object QAlmacen: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select esc.almacen_ent, al.titulo from Pro_escandallo esc'
      
        'left join art_almacenes al on (al.empresa=esc.empresa and al.alm' +
        'acen=esc.almacen_ent)'
      'where empresa=:empresa and escandallo=:escandallo and tipo='#39'EPR'#39)
    UniDirectional = False
    Left = 40
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 224
    Top = 8
  end
  object QStock: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select stock from a_art_dame_stock(:empresa,:canal, :almacen, :a' +
        'rticulo,null, 0, 1, 0,0,0, 0, 0,0, 1, 0, null)')
    UniDirectional = False
    Left = 40
    Top = 56
  end
  object DSQStock: TDataSource
    DataSet = QStock
    Left = 128
    Top = 56
  end
  object QVarios: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 128
    Top = 152
  end
  object QModificarEstado: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'Update PRO_DET_PEDIDOS_ORD'
      
        ' set Estado=?estado,Marca=0,ProUnds=?VProUnds,ProB_Imponible=?VP' +
        'roB_Imponible'
      
        'Where Empresa=?Empresa and Ejercicio=?Ejercicio and Canal=?Canal' +
        ' and'
      'Series=?Series and Rig=?Rig and Linea=?Linea')
    Transaction = TLocal
    AutoTrans = True
    Left = 40
    Top = 200
  end
  object QMarcadosPedidos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from pro_det_pedidos_ord'
      'where marca=1')
    UniDirectional = False
    Left = 40
    Top = 104
    object QMarcadosPedidosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMarcadosPedidosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMarcadosPedidosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMarcadosPedidosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMarcadosPedidosRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMarcadosPedidosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMarcadosPedidosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMarcadosPedidosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMarcadosPedidosUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object QMarcadosPedidosPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMarcadosPedidosB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMarcadosPedidosNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMarcadosPedidosMARCA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'MARCA'
    end
    object QMarcadosPedidosESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMarcadosPedidosCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMarcadosPedidosALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMarcadosPedidosFECHA_PEDIDO: TDateTimeField
      DisplayLabel = 'Fec. Ped.'
      FieldName = 'FECHA_PEDIDO'
    end
    object QMarcadosPedidosESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QMarcadosPedidosENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMarcadosPedidosSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMarcadosPedidosPRO_UNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'PRO_UNIDADES'
    end
    object QMarcadosPedidosPRO_B_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'PRO_B_IMPONIBLE'
    end
    object QMarcadosPedidosUDS_PRODUCIDAS: TFloatField
      DisplayLabel = 'Uds. producidas'
      FieldName = 'UDS_PRODUCIDAS'
    end
  end
  object DSMarcados: TDataSource
    DataSet = QMarcadosPedidos
    Left = 128
    Top = 104
  end
  object QInsertPedidosOrd: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'INSERT INTO PRO_PEDIDOS_ORD'
      
        '  (FECHA_PEDIDO,NOTAS,UNIDADES,FECHA,UDS_MANUAL,ENTRADA,ESCANDAL' +
        'LO,CLIENTE,SERIE,RIG_OF,RIG,TITULO,MARCA,LINEA,CANAL,EJERCICIO,E' +
        'MPRESA,ARTICULO,ALMACEN_ENT,ALMACEN_SAL,ALMACEN_LAN)'
      'VALUES'
      
        '  (?FECHA_PEDIDO,?NOTAS,?UNIDADES,?FECHA,?UDS_MANUAL,?ENTRADA,?E' +
        'SCANDALLO,?CLIENTE,?SERIE,?RIG_OF,?RIG,?TITULO,?MARCA,?LINEA,?CA' +
        'NAL,?EJERCICIO,?EMPRESA,?ARTICULO,?ALMACEN_ENT,?ALMACEN_SAL,?ALM' +
        'ACEN_LAN)')
    Transaction = TLocal
    AutoTrans = True
    Left = 40
    Top = 152
  end
end
