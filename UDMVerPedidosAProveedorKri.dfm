object DMVerPedidosAProveedorKri: TDMVerPedidosAProveedorKri
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 425
  Top = 175
  Height = 150
  Width = 215
  object TLocal: THYTransaction
    Active = True
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 32
    Top = 64
  end
  object xVerPedidos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_PEDIDOS_POR_PROVEEDOR_KRI '
      'WHERE '
      '(EMPRESA=?EMPRESA) AND '
      '((EJERCICIO = ?EJERCICIO) OR (EJERCICIO = ?EJERCICIO - 1)) AND '
      '(CANAL = ?CANAL) AND '
      '(PROVEEDOR = ?PROVEEDOR) '
      'AND (ALMACEN = ?ALMACEN) ')
    UniDirectional = False
    Left = 32
    Top = 8
    object xVerPedidosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVerPedidosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVerPedidosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVerPedidosSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xVerPedidosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xVerPedidosRIG: TIntegerField
      DisplayLabel = 'Rig'
      FieldName = 'RIG'
    end
    object xVerPedidosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xVerPedidosALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xVerPedidosALMACEN_TITULO: TFIBStringField
      DisplayLabel = 'Titulo Alm.'
      FieldName = 'ALMACEN_TITULO'
      Size = 40
    end
    object xVerPedidosPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xVerPedidosPROVEEDOR_TITULO: TFIBStringField
      DisplayLabel = 'Titulo Prov.'
      FieldName = 'PROVEEDOR_TITULO'
      Size = 60
    end
    object xVerPedidosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xVerPedidosTITULO: TFIBStringField
      DisplayLabel = 'Titulo Art.'
      FieldName = 'TITULO'
      Size = 60
    end
    object xVerPedidosUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object xVerPedidosUNIDADES_ORIGINALES: TFloatField
      DisplayLabel = 'Uds. Orig.'
      FieldName = 'UNIDADES_ORIGINALES'
    end
    object xVerPedidosUNIDADES_SERVIDAS: TFloatField
      DisplayLabel = 'Uds. Serv.'
      FieldName = 'UNIDADES_SERVIDAS'
    end
    object xVerPedidosUNIDADES_POR_SERVIR: TFloatField
      DisplayLabel = 'Uds. por Serv.'
      FieldName = 'UNIDADES_POR_SERVIR'
    end
    object xVerPedidosLINEA_SERVIDA: TIntegerField
      DisplayLabel = 'Servido'
      FieldName = 'LINEA_SERVIDA'
    end
    object xVerPedidosPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xVerPedidosDESCUENTO: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO'
    end
    object xVerPedidosDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object xVerPedidosDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object xVerPedidosP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xVerPedidosESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
  end
  object DSxVerPedidos: TDataSource
    DataSet = xVerPedidos
    Left = 120
    Top = 8
  end
end
