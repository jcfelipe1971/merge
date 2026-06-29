object DMHistoricoPrecios: TDMHistoricoPrecios
  OldCreateOrder = False
  OnCreate = DMHistoricoPreciosCreate
  Left = 588
  Top = 198
  Height = 423
  Width = 433
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 240
    Top = 8
  end
  object QMHistPrecios: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    InsertSQL.Strings = (
      
        'SELECT * FROM a_art_dame_stock(?empresa,?canal,?almacen,?articul' +
        'o,null,1,0, 0, 1, 0, 0, 0, 0, 0, 0, null)'
      'ORDER BY FECHA_p,N_MOV_STOCK')
    RefreshSQL.Strings = (
      
        'SELECT * FROM a_art_dame_stock(?empresa,?canal,?almacen,?articul' +
        'o,null,1,0, 0, 1, 0, 0, 0, 0, 0, 0, null)'
      'ORDER BY FECHA_p,N_MOV_STOCK')
    SelectSQL.Strings = (
      
        'SELECT * FROM a_art_dame_stock(?empresa,?canal,?almacen,?articul' +
        'o,null,1,0, 0, 1, 0, 0, 0, 0, 0, 0, null)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      
        'SELECT * FROM a_art_dame_stock(?empresa,?canal,?almacen,?articul' +
        'o,null,1,0, 0, 1, 0, 0, 0, 0, 0, 0, null)'
      'ORDER BY FECHA_p,N_MOV_STOCK')
    BeforeDelete = QMHistPreciosBeforeEdit
    BeforeEdit = QMHistPreciosBeforeEdit
    BeforeInsert = QMHistPreciosBeforeEdit
    ClavesPrimarias.Strings = (
      'empresa,'
      'canal,'
      'almacen,'
      'articulo,')
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ARTICULOS_HIST_PRECIOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMHistPreciosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMHistPreciosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMHistPreciosALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMHistPreciosARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMHistPreciosENTRADAS: TFloatField
      DisplayLabel = 'Entradas'
      FieldName = 'ENTRADAS'
    end
    object QMHistPreciosSALIDAS: TFloatField
      DisplayLabel = 'Salidas'
      FieldName = 'SALIDAS'
    end
    object QMHistPreciosENTRADAS_EXT: TFloatField
      DisplayLabel = 'entradas Ext.'
      FieldName = 'ENTRADAS_EXT'
    end
    object QMHistPreciosSALIDAS_EXT: TFloatField
      DisplayLabel = 'Salidas Ext.'
      FieldName = 'SALIDAS_EXT'
    end
    object QMHistPreciosVALOR_ENTRADAS: TFloatField
      DisplayLabel = 'Valor Ent.'
      FieldName = 'VALOR_ENTRADAS'
    end
    object QMHistPreciosVALOR_SALIDAS: TFloatField
      DisplayLabel = 'Valor Sal.'
      FieldName = 'VALOR_SALIDAS'
    end
    object QMHistPreciosSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object QMHistPreciosSTOCK_EXT: TFloatField
      DisplayLabel = 'Stock Ext.'
      FieldName = 'STOCK_EXT'
    end
    object QMHistPreciosP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMHistPreciosPMP: TFloatField
      DisplayLabel = 'P.M.P.'
      FieldName = 'PMP'
    end
    object QMHistPreciosFECHA_P: TDateTimeField
      DisplayLabel = 'Fecha P.'
      FieldName = 'FECHA_P'
    end
    object QMHistPreciosUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMHistPreciosUNIDADES_EXT: TFloatField
      DisplayLabel = 'Unidades Ext.'
      FieldName = 'UNIDADES_EXT'
    end
    object QMHistPreciosID_MOV_STOCK: TIntegerField
      DisplayLabel = 'ID Mov. Stock'
      FieldName = 'ID_MOV_STOCK'
    end
    object QMHistPreciosEMPRESA_O: TIntegerField
      DisplayLabel = 'Emp. O.'
      FieldName = 'EMPRESA_O'
    end
    object QMHistPreciosCANAL_O: TIntegerField
      DisplayLabel = 'Canal O.'
      FieldName = 'CANAL_O'
    end
    object QMHistPreciosALMACEN_O: TFIBStringField
      DisplayLabel = 'Alm. O.'
      FieldName = 'ALMACEN_O'
      Size = 3
    end
    object QMHistPreciosN_MOV_STOCK: TIntegerField
      DisplayLabel = 'N. Mov. Stock'
      FieldName = 'N_MOV_STOCK'
    end
    object QMHistPreciosID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMHistPreciosDOC_NUMERO: TIntegerField
      DisplayLabel = 'RIG'
      FieldName = 'DOC_NUMERO'
    end
    object QMHistPreciosDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMHistPreciosDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMHistPreciosTIPO_OPER: TFIBStringField
      DisplayLabel = 'Tipo Oper.'
      FieldName = 'TIPO_OPER'
      Size = 1
    end
    object QMHistPreciosSTOCK_MINIMO: TFloatField
      DisplayLabel = 'Stock M'#237'n.'
      FieldName = 'STOCK_MINIMO'
    end
    object QMHistPreciosSTOCK_MAXIMO: TFloatField
      DisplayLabel = 'Stock M'#225'x.'
      FieldName = 'STOCK_MAXIMO'
    end
    object QMHistPreciosPEDIDOS_A_PRO: TFloatField
      DisplayLabel = 'Ped. a Prov.'
      FieldName = 'PEDIDOS_A_PRO'
    end
    object QMHistPreciosPEDIDOS_D_CLI: TFloatField
      DisplayLabel = 'Ped. de Cli.'
      FieldName = 'PEDIDOS_D_CLI'
    end
    object QMHistPreciosPEDIDOS_A_TMP: TFloatField
      DisplayLabel = 'Ped. a Tmp.'
      FieldName = 'PEDIDOS_A_TMP'
    end
    object QMHistPreciosSTOCK_VIRTUAL: TFloatField
      DisplayLabel = 'Stock Virt.'
      FieldName = 'STOCK_VIRTUAL'
    end
    object QMHistPreciosRESERVADAS: TFloatField
      DisplayLabel = 'Reservadas'
      FieldName = 'RESERVADAS'
    end
    object QMHistPreciosDISPONIBLES: TFloatField
      DisplayLabel = 'Disponibles'
      FieldName = 'DISPONIBLES'
    end
    object QMHistPreciosEN_PROCESO_PROD: TFloatField
      DisplayLabel = 'En Proc. Prod.'
      FieldName = 'EN_PROCESO_PROD'
    end
  end
  object DSQMHistPrecios: TDataSource
    DataSet = QMHistPrecios
    Left = 144
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 328
    Top = 8
  end
end
