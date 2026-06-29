object DMTraspasoPedCliAPedPro: TDMTraspasoPedCliAPedPro
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 297
  Top = 156
  Height = 273
  Width = 286
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 48
    Top = 8
  end
  object DSTMPPedidosAProv: TDataSource
    DataSet = TMPPedidosAProv
    Left = 152
    Top = 56
  end
  object TMPPedidosAProv: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_PEDIDOS_POR_ENTRADA_KRI'
      'WHERE'
      '  ID_DETALLES_S=?ID_DETALLES_S AND '
      '  ENTRADA=?ENTRADA AND'
      '  LINEA_ESC=?LINEA_ESC'
      '')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_PEDIDOS_POR_ENTRADA_KRI'
      'where entrada=?entrada'
      'order by pedido')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_PEDIDOS_POR_ENTRADA_KRI'
      'SET'
      '  PEDIR=?PEDIR '
      '  ,MARCADO=?MARCADO '
      '  ,P_COSTE=?P_COSTE '
      '  ,NOTAS=?NOTAS '
      '  ,NOTAS2=?NOTAS2 '
      '  ,CRC_NOTAS=?CRC_NOTAS '
      '  ,CRC_NOTAS2=?CRC_NOTAS2 '
      '  ,DESCUENTO_1=?DESCUENTO_1 '
      '  ,DESCUENTO_2=?DESCUENTO_2 '
      '  ,DESCUENTO_3=?DESCUENTO_3 '
      'WHERE'
      '  ID_DETALLES_S=?ID_DETALLES_S AND '
      '  ENTRADA=?ENTRADA AND'
      '  LINEA_ESC=?LINEA_ESC')
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = TMPPedidosAProvBeforePost
    OnCalcFields = TMPPedidosAProvCalcFields
    OnNewRecord = TMPPedidosAProvNewRecord
    ClavesPrimarias.Strings = (
      'ID_DETALLES_S '
      'ENTRADA '
      'LINEA_ESC'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_PEDIDOS_POR_ENTRADA_KRI'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 56
    object TMPPedidosAProvEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object TMPPedidosAProvEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object TMPPedidosAProvCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object TMPPedidosAProvALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object TMPPedidosAProvARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object TMPPedidosAProvARTICULO_TITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'ARTICULO_TITULO'
      Size = 256
    end
    object TMPPedidosAProvENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object TMPPedidosAProvPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object TMPPedidosAProvPEDIR: TFloatField
      DisplayLabel = 'Uds. a Pedir'
      FieldName = 'PEDIR'
    end
    object TMPPedidosAProvMARCADO: TIntegerField
      DisplayLabel = 'Pedir'
      FieldName = 'MARCADO'
    end
    object TMPPedidosAProvUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object TMPPedidosAProvID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object TMPPedidosAProvID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object TMPPedidosAProvP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object TMPPedidosAProvNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object TMPPedidosAProvDESCUENTO_1: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO_1'
    end
    object TMPPedidosAProvDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object TMPPedidosAProvDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object TMPPedidosAProvCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object TMPPedidosAProvTITULO_CLI: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_CLI'
      Size = 60
    end
    object TMPPedidosAProvSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object TMPPedidosAProvSTOCK_MINIMO: TFloatField
      DisplayLabel = 'Stock Min.'
      FieldName = 'STOCK_MINIMO'
    end
    object TMPPedidosAProvSTOCK_MAXIMO: TFloatField
      DisplayLabel = 'Stock Max.'
      FieldName = 'STOCK_MAXIMO'
    end
    object TMPPedidosAProvSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object TMPPedidosAProvPEDIDO: TFIBStringField
      DisplayLabel = 'Pedido'
      FieldName = 'PEDIDO'
      Size = 40
    end
    object TMPPedidosAProvNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object TMPPedidosAProvNOTAS2: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS2'
      Size = 8
    end
    object TMPPedidosAProvCRC_NOTAS: TFIBStringField
      DisplayLabel = 'CRC Notas'
      FieldName = 'CRC_NOTAS'
      Size = 15
    end
    object TMPPedidosAProvCRC_NOTAS2: TFIBStringField
      DisplayLabel = 'CRC Notas 2'
      FieldName = 'CRC_NOTAS2'
      Size = 15
    end
    object TMPPedidosAProvLINEA_ESC: TIntegerField
      DisplayLabel = 'Linea Esc.'
      FieldName = 'LINEA_ESC'
    end
    object TMPPedidosAProvSTOCK_ALM: TFloatField
      DisplayLabel = 'Stock Alm.'
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM'
      Calculated = True
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 152
    Top = 8
  end
end
