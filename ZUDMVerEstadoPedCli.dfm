object ZDMVerEstadoPedCli: TZDMVerEstadoPedCli
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 732
  Top = 187
  Height = 297
  Width = 236
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 32
    Top = 16
  end
  object DSQMVerPedidos: TDataSource
    DataSet = QMVerPedidos
    Left = 128
    Top = 64
  end
  object QMVerPedidos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM VER_ESTADO_PEDIDOS_CLIENTE'
      
        '(:EMPRESA, :EJERCICIO_CALCULO, :CANAL_CALCULO, :CLIENTE_CALCULO,' +
        ' :ENTRADA, :MODO)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AfterOpen = QMVerPedidosAfterOpen
    BeforeClose = QMVerPedidosBeforeClose
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 64
    object QMVerPedidosSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMVerPedidosNUM_PEDIDO: TIntegerField
      DisplayLabel = 'Nro. Pedido'
      FieldName = 'NUM_PEDIDO'
    end
    object QMVerPedidosREF_PEDIDO: TFIBStringField
      DisplayLabel = 'Ref. Pedido'
      FieldName = 'REF_PEDIDO'
      Size = 40
    end
    object QMVerPedidosFECHA_PEDIDO: TDateTimeField
      DisplayLabel = 'Fec. Pedido'
      FieldName = 'FECHA_PEDIDO'
    end
    object QMVerPedidosZ_CB_PEDIDO: TIntegerField
      DisplayLabel = 'C'#243'd. Barras Ped.'
      FieldName = 'Z_CB_PEDIDO'
    end
    object QMVerPedidosFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'Fec. Entrega Prev.'
      FieldName = 'FECHA_ENTREGA_PREV'
      OnGetText = QMVerPedidosFECHA_ENTREGA_PREVGetText
    end
    object QMVerPedidosFECHA_CORTE: TDateTimeField
      DisplayLabel = 'Fec. CrLON'
      FieldName = 'FECHA_CORTE'
    end
    object QMVerPedidosOPERARIO_CORTE: TIntegerField
      DisplayLabel = 'Oper. CrLON'
      FieldName = 'OPERARIO_CORTE'
    end
    object QMVerPedidosFECHA_UNION: TDateTimeField
      DisplayLabel = 'Fec. UNION'
      FieldName = 'FECHA_UNION'
    end
    object QMVerPedidosOPERARIO_UNION: TIntegerField
      DisplayLabel = 'Oper. UNION'
      FieldName = 'OPERARIO_UNION'
    end
    object QMVerPedidosFECHA_MACARRON: TDateTimeField
      DisplayLabel = 'Fec. MACAR'
      FieldName = 'FECHA_MACARRON'
    end
    object QMVerPedidosOPERARIO_MACARRON: TIntegerField
      DisplayLabel = 'Oper. MACAR'
      FieldName = 'OPERARIO_MACARRON'
    end
    object QMVerPedidosFECHA_MONTAJE: TDateTimeField
      DisplayLabel = 'Fec. MONT'
      FieldName = 'FECHA_MONTAJE'
    end
    object QMVerPedidosOPERARIO_MONTAJE: TIntegerField
      DisplayLabel = 'Oper. MONT'
      FieldName = 'OPERARIO_MONTAJE'
    end
    object QMVerPedidosOPERARIO_TERMINADO: TIntegerField
      DisplayLabel = 'Oper. TERM'
      FieldName = 'OPERARIO_TERMINADO'
    end
    object QMVerPedidosFECHA_TERMINADO: TDateTimeField
      DisplayLabel = 'Fec. TERM'
      FieldName = 'FECHA_TERMINADO'
    end
    object QMVerPedidosFECHA_PREPARADO: TDateTimeField
      DisplayLabel = 'Fec. PREP'
      FieldName = 'FECHA_PREPARADO'
    end
    object QMVerPedidosOPERARIO_PREPARADO: TIntegerField
      DisplayLabel = 'Oper. PREP'
      FieldName = 'OPERARIO_PREPARADO'
    end
    object QMVerPedidosESTADO_PEP: TIntegerField
      DisplayLabel = 'Estado Ped. a Prov.'
      FieldName = 'ESTADO_PEP'
    end
    object QMVerPedidosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
    end
    object QMVerPedidosID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object QMVerPedidosCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMVerPedidosTITULO: TStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMVerPedidosID_S_ALB: TIntegerField
      DisplayLabel = 'Id. Alb.'
      FieldName = 'ID_S_ALB'
    end
    object QMVerPedidosFECHA_ALB: TDateTimeField
      DisplayLabel = 'Fecha Alb.'
      FieldName = 'FECHA_ALB'
      OnGetText = QMVerPedidosFECHA_ALBGetText
    end
    object QMVerPedidosID_RUTA: TIntegerField
      DisplayLabel = 'Id Ruta'
      FieldName = 'ID_RUTA'
    end
    object QMVerPedidosFECHA_RUTA: TDateTimeField
      DisplayLabel = 'Fecha Ruta'
      FieldName = 'FECHA_RUTA'
      OnGetText = QMVerPedidosFECHA_RUTAGetText
    end
    object QMVerPedidosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMVerPedidosLINEA_PED: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA_PED'
    end
    object QMVerPedidosFECHA_MOTOR: TDateTimeField
      DisplayLabel = 'Fec. CrHER'
      FieldName = 'FECHA_MOTOR'
    end
    object QMVerPedidosOPERARIO_MOTOR: TIntegerField
      DisplayLabel = 'Oper. CrHER'
      FieldName = 'OPERARIO_MOTOR'
    end
    object QMVerPedidosZONA: TFIBStringField
      DisplayLabel = 'Zona'
      FieldName = 'ZONA'
      Size = 15
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
    Left = 128
    Top = 16
  end
  object DSxPedidosCompra: TDataSource
    DataSet = xPedidosCompra
    Left = 128
    Top = 112
  end
  object xPedidosCompra: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      
        'SELECT DETC.*, DETCP.*, CP.PROVEEDOR, T.NOMBRE_R_SOCIAL, C.SU_RE' +
        'FERENCIA'
      'FROM GES_CABECERAS_S CAB'
      'JOIN GES_CABECERAS_RELACIONES REL ON (CAB.ID_S = REL.O_ID_S)'
      'JOIN GES_CABECERAS_E C ON (REL.D_ID_S = C.ID_E)'
      'JOIN GES_CABECERAS_E_PED CP ON (C.ID_E = CP.ID_E)'
      'JOIN GES_DETALLES_E DETC ON (DETC.ID_E = C.ID_E)'
      
        'JOIN GES_DETALLES_E_PED DETCP ON (DETC.ID_DETALLES_E = DETCP.ID_' +
        'DETALLES_E)'
      'JOIN SYS_TERCEROS T ON (CP.TERCERO = T.TERCERO)'
      'WHERE'
      'CAB.ID_S = :ID_S AND'
      'DETCP.LINEA_SERVIDA = 0'
      'ORDER BY DETC.LINEA ')
    UniDirectional = False
    DataSource = DSQMVerPedidos
    Left = 32
    Top = 112
    object xPedidosCompraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xPedidosCompraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xPedidosCompraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xPedidosCompraSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xPedidosCompraTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xPedidosCompraRIG: TIntegerField
      DisplayLabel = 'R.I.G.'
      FieldName = 'RIG'
    end
    object xPedidosCompraLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xPedidosCompraALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xPedidosCompraARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xPedidosCompraTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xPedidosCompraUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object xPedidosCompraPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xPedidosCompraDESCUENTO: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO'
    end
    object xPedidosCompraDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object xPedidosCompraDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object xPedidosCompraP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xPedidosCompraPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xPedidosCompraTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object xPedidosCompraP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object xPedidosCompraP_RECARGO: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_RECARGO'
    end
    object xPedidosCompraBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object xPedidosCompraI_DESCUENTO: TFloatField
      DisplayLabel = 'Imp. Desc.'
      FieldName = 'I_DESCUENTO'
    end
    object xPedidosCompraB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object xPedidosCompraENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xPedidosCompraDTO_PP: TFloatField
      DisplayLabel = 'Dto. PP'
      FieldName = 'DTO_PP'
    end
    object xPedidosCompraM_MOV_STOCK: TIntegerField
      DisplayLabel = 'N. Mov. Stock'
      FieldName = 'M_MOV_STOCK'
    end
    object xPedidosCompraENTRADA_RECEPCION: TIntegerField
      DisplayLabel = 'Entrada Recep.'
      FieldName = 'ENTRADA_RECEPCION'
    end
    object xPedidosCompraUNIDADES_EXT: TFloatField
      DisplayLabel = 'Uds. Ext.'
      FieldName = 'UNIDADES_EXT'
    end
    object xPedidosCompraNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object xPedidosCompraB_IMPONIBLE_CANAL: TFloatField
      DisplayLabel = 'B. Imponible Can.'
      FieldName = 'B_IMPONIBLE_CANAL'
    end
    object xPedidosCompraBASE_IMPORTACION: TFloatField
      DisplayLabel = 'B. Importacion'
      FieldName = 'BASE_IMPORTACION'
    end
    object xPedidosCompraID_DETALLES_E: TIntegerField
      DisplayLabel = 'Id Doc. Det.'
      FieldName = 'ID_DETALLES_E'
    end
    object xPedidosCompraID_E: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_E'
    end
    object xPedidosCompraID_D_E_GR: TIntegerField
      DisplayLabel = 'Id E. GR'
      FieldName = 'ID_D_E_GR'
    end
    object xPedidosCompraID_A_M_C_T: TIntegerField
      DisplayLabel = 'Id Art. TyC'
      FieldName = 'ID_A_M_C_T'
    end
    object xPedidosCompraID_C_A: TIntegerField
      DisplayLabel = 'Id Art. C.'
      FieldName = 'ID_C_A'
    end
    object xPedidosCompraID_A: TIntegerField
      DisplayLabel = 'Id Art.'
      FieldName = 'ID_A'
    end
    object xPedidosCompraID_MOV_STOCKS: TIntegerField
      DisplayLabel = 'Id Mov. Stock'
      FieldName = 'ID_MOV_STOCKS'
    end
    object xPedidosCompraI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial.'
      FieldName = 'I_DTO_CIAL'
    end
    object xPedidosCompraNSERIE: TFIBStringField
      DisplayLabel = 'N.Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object xPedidosCompraBULTOS: TFloatField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object xPedidosCompraORDEN: TIntegerField
      DisplayLabel = 'Origen'
      FieldName = 'ORDEN'
    end
    object xPedidosCompraUNIDADES_SEC: TFloatField
      DisplayLabel = 'Uds. Sec.'
      FieldName = 'UNIDADES_SEC'
    end
    object xPedidosCompraAPLICA_UNIDADES_SECUNDARIAS: TIntegerField
      DisplayLabel = 'Aplica Uds. Sec.'
      FieldName = 'APLICA_UNIDADES_SECUNDARIAS'
    end
    object xPedidosCompraPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object xPedidosCompraNOTAS2: TMemoField
      DisplayLabel = 'Notas Int.'
      FieldName = 'NOTAS2'
      BlobType = ftMemo
      Size = 8
    end
    object xPedidosCompraCRC_NOTAS: TFIBStringField
      DisplayLabel = 'CRC Notas'
      FieldName = 'CRC_NOTAS'
      Size = 15
    end
    object xPedidosCompraCRC_NOTAS2: TFIBStringField
      DisplayLabel = 'CRC Notas Int.'
      FieldName = 'CRC_NOTAS2'
      Size = 15
    end
    object xPedidosCompraID_DETALLES_E_REGALO: TIntegerField
      DisplayLabel = 'Id Doc Det. Regalo'
      FieldName = 'ID_DETALLES_E_REGALO'
    end
    object xPedidosCompraCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xPedidosCompraIMPORTE_ICE: TFloatField
      DisplayLabel = 'Importe ICE'
      FieldName = 'IMPORTE_ICE'
    end
    object xPedidosCompraINVERSION_SUJETO_PASIVO: TIntegerField
      DisplayLabel = 'I.S.P.'
      FieldName = 'INVERSION_SUJETO_PASIVO'
    end
    object xPedidosCompraB_DTO_LINEA: TFloatField
      DisplayLabel = 'B. Dto. Linea'
      FieldName = 'B_DTO_LINEA'
    end
    object xPedidosCompraC_IVA: TFloatField
      DisplayLabel = 'Cuota IVA'
      FieldName = 'C_IVA'
    end
    object xPedidosCompraC_RECARGO: TFloatField
      DisplayLabel = 'Cuota Rec.'
      FieldName = 'C_RECARGO'
    end
    object xPedidosCompraT_COSTE: TFloatField
      DisplayLabel = 'T. Coste'
      FieldName = 'T_COSTE'
    end
    object xPedidosCompraM_BRUTO: TFloatField
      DisplayLabel = 'Marg. Bruto'
      FieldName = 'M_BRUTO'
    end
    object xPedidosCompraLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xPedidosCompraTIPO_IMPUESTO_ADICIONAL: TIntegerField
      DisplayLabel = 'Tipo Imp. Adic.'
      FieldName = 'TIPO_IMPUESTO_ADICIONAL'
    end
    object xPedidosCompraP_IMPUESTO_ADICIONAL: TFloatField
      DisplayLabel = '% Imp. Adic.'
      FieldName = 'P_IMPUESTO_ADICIONAL'
    end
    object xPedidosCompraI_IMPUESTO_ADICIONAL: TFloatField
      DisplayLabel = 'Imp. Impuesto Adic.'
      FieldName = 'I_IMPUESTO_ADICIONAL'
    end
    object xPedidosCompraI_IMPUESTO_ADICIONAL_CANAL: TFloatField
      DisplayLabel = 'Imp. Impuesto Adic. Can.'
      FieldName = 'I_IMPUESTO_ADICIONAL_CANAL'
    end
    object xPedidosCompraUNIDADES_ORIGINALES: TFloatField
      DisplayLabel = 'Uds. Orig.'
      FieldName = 'UNIDADES_ORIGINALES'
    end
    object xPedidosCompraUNIDADES_SERVIDAS: TFloatField
      DisplayLabel = 'Uds. Servidas'
      FieldName = 'UNIDADES_SERVIDAS'
    end
    object xPedidosCompraUNIDADES_POR_SERVIR: TFloatField
      DisplayLabel = 'Uds. x Servir'
      FieldName = 'UNIDADES_POR_SERVIR'
    end
    object xPedidosCompraFECHA_PRE_DET: TDateTimeField
      DisplayLabel = 'Fec. Prev. Det.'
      FieldName = 'FECHA_PRE_DET'
    end
    object xPedidosCompraFECHA_REC_DET: TDateTimeField
      DisplayLabel = 'Fec. Rec. Det.'
      FieldName = 'FECHA_REC_DET'
    end
    object xPedidosCompraFECHA_CONF_KRI: TDateTimeField
      DisplayLabel = 'Fec. Conf.'
      FieldName = 'FECHA_CONF_KRI'
    end
    object xPedidosCompraPLAZO_CONFIRM_KRI: TDateTimeField
      DisplayLabel = 'Plazo Conf.'
      FieldName = 'PLAZO_CONFIRM_KRI'
    end
    object xPedidosCompraTIPO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Tipo U.L.'
      FieldName = 'TIPO_UNIDAD_LOGISTICA'
      Size = 5
    end
    object xPedidosCompraUNIDADES_LOGISTICAS: TFloatField
      DisplayLabel = 'U.L.'
      FieldName = 'UNIDADES_LOGISTICAS'
    end
    object xPedidosCompraPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xPedidosCompraNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xPedidosCompraSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Ref.'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
  end
end
