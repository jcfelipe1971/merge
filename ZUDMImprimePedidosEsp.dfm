object ZDMImprimePedidosEsp: TZDMImprimePedidosEsp
  OldCreateOrder = False
  OnCreate = ZDMImprimePedidosEspCreate
  Left = 563
  Top = 297
  Height = 149
  Width = 344
  object DSQMPedidosEsp: TDataSource
    DataSet = QMPedidosEsp
    Left = 128
    Top = 24
  end
  object QMPedidosEsp: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_PEDIDO'
      'WHERE'
      '  ID_S=?ID_S ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_PEDIDO'
      '  WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND'
      '                 CANAL = ?CANAL AND TIPO = '#39'PEC'#39'  and estado=0'
      'ORDER BY RIG'
      '')
    UniDirectional = False
    ClavesPrimarias.Strings = (
      'ID_S ')
    Opciones = []
    AutoSQLdeVistas = True
    TableName = 'VER_CABECERAS_PEDIDO'
    Left = 32
    Top = 24
    object QMPedidosEspEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPedidosEspEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPedidosEspCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPedidosEspSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMPedidosEspTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMPedidosEspRIG: TIntegerField
      DisplayLabel = 'Rig'
      FieldName = 'RIG'
    end
    object QMPedidosEspALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMPedidosEspMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMPedidosEspFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMPedidosEspTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMPedidosEspTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMPedidosEspDIRECCION: TIntegerField
      DisplayLabel = 'Direcci'#243'n'
      FieldName = 'DIRECCION'
    end
    object QMPedidosEspCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMPedidosEspSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMPedidosEspFORMA_PAGO: TFIBStringField
      DisplayLabel = 'Forma Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMPedidosEspCAMPANYA: TIntegerField
      DisplayLabel = 'Campa'#241'a'
      FieldName = 'CAMPANYA'
    end
    object QMPedidosEspNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMPedidosEspESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMPedidosEspBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object QMPedidosEspLINEAS: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINEAS'
    end
    object QMPedidosEspS_BASES: TFloatField
      DisplayLabel = 'Base Imponible'
      FieldName = 'S_BASES'
    end
    object QMPedidosEspAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMPedidosEspDTO_PP: TFloatField
      DisplayLabel = 'Dto. PP.'
      FieldName = 'DTO_PP'
    end
    object QMPedidosEspDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial'
      FieldName = 'DTO_CIAL'
    end
    object QMPedidosEspLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object QMPedidosEspENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMPedidosEspFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'Fecha Entrega Prev.'
      FieldName = 'FECHA_ENTREGA_PREV'
    end
    object QMPedidosEspFECHA_REC_CAB: TDateTimeField
      DisplayLabel = 'Fecha Recepci'#243'n'
      FieldName = 'FECHA_REC_CAB'
    end
    object QMPedidosEspNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMPedidosEspTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMPedidosEspID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMPedidosEspIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMPedidosEspZ_COD_BARRAS_PED: TIntegerField
      DisplayLabel = 'C'#243'd. Barras'
      FieldName = 'Z_COD_BARRAS_PED'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 260
    Top = 24
  end
end
