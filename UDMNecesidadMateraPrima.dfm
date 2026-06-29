object DMNecesidadMateraPrima: TDMNecesidadMateraPrima
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 205
  Top = 106
  Height = 364
  Width = 429
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 320
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 376
    Top = 8
  end
  object xNecesidades: TFIBDataSetRW
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT * FROM PRO_NECESIDAD_MATERIA_PRIMA (?EMPRESA)'
      'ORDER BY COMPONENTE')
    UniDirectional = False
    Left = 56
    Top = 24
  end
  object DSxPedidos: TDataSource
    DataSet = xPedidos
    Left = 184
    Top = 72
  end
  object xPedidos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'select c.empresa, c.ejercicio, c.canal, c.serie, c.tipo, c.rig, ' +
        'd.linea, c.id_s, d.id_detalles_s, c.cliente,'
      
        '       t.nombre_r_social, d.articulo, d.titulo, d.unidades, dp.u' +
        '_pendientes, dp.u_servidas, dp.entrada_agrupacion,'
      '       dp.fecha_entrega_prev, a.familia, a.subfamilia, c.fecha'
      'from ges_cabeceras_s c'
      'join ges_cabeceras_s_ped cp on c.id_s = cp.id_s'
      'join sys_terceros t on c.tercero = t.tercero'
      'join ges_detalles_s d on c.id_s = d.id_s'
      'join ges_detalles_s_ped dp on d.id_detalles_s = dp.id_detalles_s'
      'join art_articulos a on d.id_a = a.id_a'
      'where'
      'c.id_s = :id_s and'
      'd.id_detalles_s = :id_detalles_s')
    SelectSQL.Strings = (
      
        'select c.empresa, c.ejercicio, c.canal, c.serie, c.tipo, c.rig, ' +
        'd.linea, c.id_s, d.id_detalles_s, c.cliente,'
      
        '       t.nombre_r_social, d.articulo, d.titulo, d.unidades, dp.u' +
        '_pendientes, dp.u_servidas, dp.entrada_agrupacion,'
      '       dp.fecha_entrega_prev, a.familia, a.subfamilia, c.fecha'
      'from ges_cabeceras_s c'
      'join ges_cabeceras_s_ped cp on c.id_s = cp.id_s'
      'join sys_terceros t on c.tercero = t.tercero'
      'join ges_detalles_s d on c.id_s = d.id_s'
      'join ges_detalles_s_ped dp on d.id_detalles_s = dp.id_detalles_s'
      'join art_articulos a on d.id_a = a.id_a'
      'where'
      'c.empresa = :empresa and'
      'c.ejercicio <= :ejercicio and'
      'c.canal = :canal and'
      'c.tipo = '#39'PEC'#39' and'
      'c.estado = 0 and'
      'dp.servido = 0 and'
      'dp.id_esc <> 0')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'update ges_detalles_s_ped'
      'set entrada_agrupacion = :entrada_agrupacion'
      'where'
      'id_detalles_s = :id_detalles_s')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 72
    object xPedidosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xPedidosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xPedidosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xPedidosSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xPedidosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xPedidosRIG: TIntegerField
      DisplayLabel = 'R.I.G.'
      FieldName = 'RIG'
    end
    object xPedidosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xPedidosID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object xPedidosID_DETALLES_S: TIntegerField
      DisplayLabel = 'Id Det. Doc.'
      FieldName = 'ID_DETALLES_S'
    end
    object xPedidosCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xPedidosNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xPedidosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xPedidosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xPedidosUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object xPedidosU_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pendientes'
      FieldName = 'U_PENDIENTES'
    end
    object xPedidosU_SERVIDAS: TFloatField
      DisplayLabel = 'Uds. Servidas'
      FieldName = 'U_SERVIDAS'
    end
    object xPedidosENTRADA_AGRUPACION: TIntegerField
      DisplayLabel = 'Marca'
      FieldName = 'ENTRADA_AGRUPACION'
    end
    object xPedidosFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'Fec. Ent. Prev.'
      FieldName = 'FECHA_ENTREGA_PREV'
    end
    object xPedidosFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xPedidosSUBFAMILIA: TFIBStringField
      DisplayLabel = 'Subfamilia'
      FieldName = 'SUBFAMILIA'
      Size = 5
    end
    object xPedidosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
  end
  object xProveedoresArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT A.*, T.NOMBRE_R_SOCIAL'
      'FROM ART_ARTICULOS_PROVEEDORES A'
      'JOIN EMP_PROVEEDORES P '
      'ON A.EMPRESA = P.EMPRESA AND A.PROVEEDOR = P.PROVEEDOR'
      'JOIN SYS_TERCEROS T '
      'ON P.TERCERO = T.TERCERO'
      'WHERE'
      'A.EMPRESA = :EMPRESA AND'
      'A.ARTICULO = :ARTICULO AND'
      'A.ACTIVO = 1 AND'
      'A.PROVEEDOR = :PROVEEDOR')
    SelectSQL.Strings = (
      'SELECT A.*, T.NOMBRE_R_SOCIAL'
      'FROM ART_ARTICULOS_PROVEEDORES A'
      'JOIN EMP_PROVEEDORES P '
      'ON A.EMPRESA = P.EMPRESA AND A.PROVEEDOR = P.PROVEEDOR'
      'JOIN SYS_TERCEROS T '
      'ON P.TERCERO = T.TERCERO'
      'WHERE'
      'A.EMPRESA = :EMPRESA AND'
      'A.ARTICULO = :ARTICULO AND'
      'A.ACTIVO = 1'
      'ORDER BY A.PRIORIDAD  ')
    UniDirectional = False
    Left = 56
    Top = 120
    object xProveedoresArticuloEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xProveedoresArticuloARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xProveedoresArticuloPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xProveedoresArticuloPRIORIDAD: TIntegerField
      DisplayLabel = 'Prioridad'
      FieldName = 'PRIORIDAD'
    end
    object xProveedoresArticuloPEDIDO_MINIMO: TFloatField
      DisplayLabel = 'Ped. Min.'
      FieldName = 'PEDIDO_MINIMO'
    end
    object xProveedoresArticuloPEDIDO_OPTIMO: TFloatField
      DisplayLabel = 'Ped. Optimo'
      FieldName = 'PEDIDO_OPTIMO'
    end
    object xProveedoresArticuloACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object xProveedoresArticuloDESCUENTO: TFloatField
      DisplayLabel = 'Descuento'
      FieldName = 'DESCUENTO'
    end
    object xProveedoresArticuloP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xProveedoresArticuloINCR_PEDIDO: TFloatField
      DisplayLabel = 'Incr. Pedido'
      FieldName = 'INCR_PEDIDO'
    end
    object xProveedoresArticuloID_A: TIntegerField
      DisplayLabel = 'Id Art.'
      FieldName = 'ID_A'
    end
    object xProveedoresArticuloDIAS_ENTREGA: TIntegerField
      DisplayLabel = 'Dias Entrega'
      FieldName = 'DIAS_ENTREGA'
    end
    object xProveedoresArticuloNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object DSxProveedoresArticulos: TDataSource
    DataSet = xProveedoresArticulo
    Left = 184
    Top = 120
  end
end
