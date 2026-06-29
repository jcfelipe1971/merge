object ZDMPedidosEspTodos: TZDMPedidosEspTodos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 448
  Top = 276
  Height = 243
  Width = 383
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 266
    Top = 18
  end
  object DSPedidosEsp: TDataSource
    DataSet = QMPedidosEsp
    Left = 144
    Top = 16
  end
  object QMPedidosEsp: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from z_ges_cabeceras_s_ped'
      'where empresa=?empresa and ejercicio=?ejercicio'
      'order by rig')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMPedidosEspEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPedidosEspEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPedidosEspRIG: TIntegerField
      DisplayLabel = 'N'#250'm. Pedido'
      FieldName = 'RIG'
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
    object QMPedidosEspFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMPedidosEspNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMPedidosEspDIAS_SERVIR: TIntegerField
      DisplayLabel = 'D'#237'as a Servir'
      FieldName = 'DIAS_SERVIR'
    end
    object QMPedidosEspFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'Fecha Entrega Prev.'
      FieldName = 'FECHA_ENTREGA_PREV'
    end
    object QMPedidosEspESTADO_PED: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO_PED'
    end
    object QMPedidosEspEMPRESA_D: TIntegerField
      DisplayLabel = 'Emp. Destino'
      FieldName = 'EMPRESA_D'
    end
    object QMPedidosEspEJERCICIO_D: TIntegerField
      DisplayLabel = 'Ejercicio D.'
      FieldName = 'EJERCICIO_D'
    end
    object QMPedidosEspCANAL_D: TIntegerField
      DisplayLabel = 'Can. Destino'
      FieldName = 'CANAL_D'
    end
    object QMPedidosEspSERIE_D: TFIBStringField
      DisplayLabel = 'Serie D.'
      FieldName = 'SERIE_D'
      Size = 10
    end
    object QMPedidosEspTIPO_D: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_D'
      Size = 3
    end
    object QMPedidosEspRIG_D: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG_D'
    end
    object QMPedidosEspID_S_D: TIntegerField
      DisplayLabel = 'ID Det. S.'
      FieldName = 'ID_S_D'
    end
  end
  object xDescCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from ver_clientes_empresa'
      'where empresa=?empresa and cliente=?cliente')
    UniDirectional = False
    Left = 40
    Top = 72
    object xDescClienteTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxDescCliente: TDataSource
    DataSet = xDescCliente
    Left = 144
    Top = 72
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 266
    Top = 74
  end
end
