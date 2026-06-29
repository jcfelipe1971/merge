object ZDMVerEstadoOFCli: TZDMVerEstadoOFCli
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 808
  Top = 418
  Height = 197
  Width = 236
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 122
    Top = 10
  end
  object xVerPedidos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM Z_VER_ESTADO_OF_CLIENTE(:EMPRESA, :EJERCICIO, :CAN' +
        'AL, :SERIE, :CLIENTE)')
    UniDirectional = False
    Left = 32
    Top = 8
    object xVerPedidosNUM_PEDIDO: TIntegerField
      DisplayLabel = 'Nro. Piezas'
      FieldName = 'NUM_PEDIDO'
    end
    object xVerPedidosREF_PEDIDO: TFIBStringField
      DisplayLabel = 'Ref. Pedido'
      FieldName = 'REF_PEDIDO'
      Size = 40
    end
    object xVerPedidosLINEA_PEDIDO: TIntegerField
      DisplayLabel = 'Linea Ped.'
      FieldName = 'LINEA_PEDIDO'
    end
    object xVerPedidosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xVerPedidosNUM_OF: TIntegerField
      DisplayLabel = 'Nro. Orden'
      FieldName = 'NUM_OF'
    end
    object xVerPedidosLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object xVerPedidosTIPOFASE: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPOFASE'
      Size = 3
    end
    object xVerPedidosFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 60
    end
    object xVerPedidosTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      Size = 3
    end
    object xVerPedidosLINEA_TAREA: TIntegerField
      DisplayLabel = 'Linea Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object xVerPedidosTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 60
    end
    object xVerPedidosESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xVerPedidosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
  end
end
