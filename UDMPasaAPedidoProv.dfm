object DMPasaAPedidoProv: TDMPasaAPedidoProv
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 274
  Top = 107
  Height = 296
  Width = 304
  object DSTMPPedidosAProv: TDataSource
    DataSet = TMPPedidosAProv
    Left = 160
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 56
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 160
    Top = 16
  end
  object TMPPedidosAProv: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_PEDIDOS_POR_ENTRADA'
      'WHERE'
      '  LINEA_ESC=?old_LINEA_ESC AND '
      '  LINEA=?old_LINEA AND '
      '  ENTRADA=?old_ENTRADA AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_PEDIDOS_POR_ENTRADA'
      
        '  (UNIDADES,PEDIR,PROYECTO,PROVEEDOR,ENTRADA,LINEA,NUEVO,MARCADO' +
        ',NOMBRE_R_SOCIAL,ARTICULO_TITULO,CANAL,EJERCICIO,EMPRESA,ARTICUL' +
        'O,ALMACEN,LINEA_ESC,FECHA_ENTREGA)'
      'VALUES'
      
        '  (?UNIDADES,?PEDIR,?PROYECTO,?PROVEEDOR,?ENTRADA,?LINEA,?NUEVO,' +
        '?MARCADO,?NOMBRE_R_SOCIAL,?ARTICULO_TITULO,?CANAL,?EJERCICIO,?EM' +
        'PRESA,?ARTICULO,?ALMACEN,?LINEA_ESC,?FECHA_ENTREGA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_PEDIDOS_POR_ENTRADA'
      'WHERE'
      '  LINEA_ESC=?LINEA_ESC AND '
      '  LINEA=?LINEA AND '
      '  ENTRADA=?ENTRADA AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_PEDIDOS_POR_ENTRADA'
      'WHERE ENTRADA=?ENTRADA'
      'ORDER BY LINEA,LINEA_ESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_PEDIDOS_POR_ENTRADA'
      'SET'
      '  UNIDADES=?UNIDADES '
      '  ,PEDIR=?PEDIR '
      '  ,PROYECTO=?PROYECTO '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,NUEVO=?NUEVO '
      '  ,MARCADO=?MARCADO '
      '  ,ARTICULO_TITULO=?ARTICULO_TITULO '
      '  ,CANAL=?CANAL '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,ARTICULO=?ARTICULO '
      '  ,ALMACEN=?ALMACEN '
      '  ,FECHA_ENTREGA=?FECHA_ENTREGA'
      'WHERE'
      '  LINEA_ESC=?LINEA_ESC AND '
      '  LINEA=?LINEA AND '
      '  ENTRADA=?ENTRADA AND '
      '  EMPRESA=?EMPRESA ')
    OnCalcFields = TMPPedidosAProvCalcFields
    OnNewRecord = TMPPedidosAProvNewRecord
    ClavesPrimarias.Strings = (
      'LINEA_ESC '
      'LINEA '
      'ENTRADA '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_PEDIDOS_POR_ENTRADA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 64
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
      DisplayLabel = 'Prov.'
      FieldName = 'PROVEEDOR'
    end
    object TMPPedidosAProvNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object TMPPedidosAProvUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object TMPPedidosAProvPEDIR: TFloatField
      DisplayLabel = 'Uds. a Pedir'
      FieldName = 'PEDIR'
    end
    object TMPPedidosAProvMARCADO: TIntegerField
      DisplayLabel = 'Pedir'
      FieldName = 'MARCADO'
    end
    object TMPPedidosAProvNUEVO: TIntegerField
      DisplayLabel = 'Nuevo'
      FieldName = 'NUEVO'
    end
    object TMPPedidosAProvLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object TMPPedidosAProvPROYECTO: TIntegerField
      DisplayLabel = 'Proy.'
      FieldName = 'PROYECTO'
    end
    object TMPPedidosAProvLINEA_ESC: TIntegerField
      DisplayLabel = 'Linea Esc.'
      FieldName = 'LINEA_ESC'
    end
    object TMPPedidosAProvES_COMPONENTE: TIntegerField
      DisplayLabel = 'Es Componente'
      FieldName = 'ES_COMPONENTE'
    end
    object TMPPedidosAProvID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
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
    object TMPPedidosAProvPEDIDOS_A_PRO: TFloatField
      DisplayLabel = 'Ped. a Prov.'
      FieldName = 'PEDIDOS_A_PRO'
    end
    object TMPPedidosAProvPEDIDOS_D_CLI: TFloatField
      DisplayLabel = 'Ped. de Cli.'
      FieldName = 'PEDIDOS_D_CLI'
    end
    object TMPPedidosAProvEN_PROCESO_PROD: TFloatField
      DisplayLabel = 'En proc. Prod.'
      FieldName = 'EN_PROCESO_PROD'
    end
    object TMPPedidosAProvPEDIDO_MINIMO: TFloatField
      DisplayLabel = 'Ped. Minimo'
      FieldName = 'PEDIDO_MINIMO'
    end
    object TMPPedidosAProvPEDIDO_OPTIMO: TFloatField
      DisplayLabel = 'Ped. Optimo'
      FieldName = 'PEDIDO_OPTIMO'
    end
    object TMPPedidosAProvINCR_PEDIDO: TFloatField
      DisplayLabel = 'Incremento Ped.'
      FieldName = 'INCR_PEDIDO'
    end
    object TMPPedidosAProvDIAS_ENTREGA: TIntegerField
      DisplayLabel = 'Dias Entrega'
      FieldName = 'DIAS_ENTREGA'
    end
    object TMPPedidosAProvFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fec. Entrega Prov.'
      FieldName = 'FECHA_ENTREGA'
    end
    object TMPPedidosAProvID_DETALLES_S: TIntegerField
      DisplayLabel = 'Id Det. S.'
      FieldName = 'ID_DETALLES_S'
    end
    object TMPPedidosAProvID_DETALLES_E: TIntegerField
      DisplayLabel = 'Id Det. E.'
      FieldName = 'ID_DETALLES_E'
    end
    object TMPPedidosAProvFECHA_ENTREGA_PREV: TDateField
      DisplayLabel = 'Fec. Ent. Prev.'
      FieldKind = fkCalculated
      FieldName = 'FECHA_ENTREGA_PREV'
      ReadOnly = True
      OnGetText = TMPPedidosAProvFECHA_ENTREGA_PREVGetText
      Calculated = True
    end
    object TMPPedidosAProvPRO_NUM_PLANO: TStringField
      DisplayLabel = 'Ref. linea'
      FieldKind = fkCalculated
      FieldName = 'PRO_NUM_PLANO'
      ReadOnly = True
      Size = 35
      Calculated = True
    end
    object TMPPedidosAProvD_RIG: TIntegerField
      DisplayLabel = 'Pedido compra'
      FieldKind = fkCalculated
      FieldName = 'D_RIG'
      ReadOnly = True
      OnGetText = TMPPedidosAProvD_RIGGetText
      Calculated = True
    end
    object TMPPedidosAProvSTOCK_TOTAL: TFloatField
      DisplayLabel = 'Stock Total'
      FieldName = 'STOCK_TOTAL'
    end
    object TMPPedidosAProvDES_ALTO: TFloatField
      DisplayLabel = 'Alto'
      FieldName = 'DES_ALTO'
    end
    object TMPPedidosAProvDES_ANCHO: TFloatField
      DisplayLabel = 'Ancho'
      FieldName = 'DES_ANCHO'
    end
    object TMPPedidosAProvDES_GRUESO: TFloatField
      DisplayLabel = 'Grueso'
      FieldName = 'DES_GRUESO'
    end
    object TMPPedidosAProvSTOCK_ALM: TFloatField
      DisplayLabel = 'Stock Alm.'
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM'
      Calculated = True
    end
  end
end
