object DMAltaHojasDePreparacion: TDMAltaHojasDePreparacion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 615
  Top = 104
  Height = 476
  Width = 344
  object DSQMAltaPedidos: TDataSource
    DataSet = QMAltaPedidos
    Left = 192
    Top = 72
  end
  object QMAltaPedidos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_DETALLE_PREPARA_PEDIDO'
      'WHERE'
      '  ID_S=?old_ID_S AND '
      '  ID_DETALLES_S=?old_ID_DETALLES_S ')
    InsertSQL.Strings = (
      'INSERT INTO VER_DETALLE_PREPARA_PEDIDO'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,ESTADO,CLIENTE,M' +
        'ONEDA,ALMACEN,ARTICULO,TITULO,UNIDADES,UNIDADES_SERVIDAS,UNIDADE' +
        'S_PENDIENTES,UNIDADES_RESERVADAS,SERVIDO,PRECIO,PIEZAS_X_BULTO,B' +
        'ULTOS,DESCUENTO,DESCUENTO_2,DESCUENTO_3,COMISION,P_COSTE,M_MOV_S' +
        'TOCK,TIPO_IVA,P_IVA,P_RECARGO,BRUTO,B_COMISION,I_DESCUENTO,B_IMP' +
        'ONIBLE,I_COMISION,ENTRADA,ENTRADA_AGRUPACION,UNIDADES_EXT,ORDEN_' +
        'PRODUCCION,UNIDADES_SEC,DIRECCION_ENTREGA,ID_DETALLES_S,ID_S,ID_' +
        'A,ID_C_A,COMISION_LINEAL,I_COMISION_LINEAL,FECHA_ENTREGA_PREV,FE' +
        'CHA_REC_DET,TITULO_IDIOMA,MARGEN_KRI,TIPO_LINEA_KRI,ORDEN,TIPO_L' +
        'INEA,PROC_PROMOCION,ORIGEN,ID_P,APLICA_UNIDADES_SECUNDARIAS,PROY' +
        'ECTO,CRC_NOTAS,CRC_NOTAS2,PRO_NUM_PLANO,U_RESERVADAS)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?ESTADO,?' +
        'CLIENTE,?MONEDA,?ALMACEN,?ARTICULO,?TITULO,?UNIDADES,?UNIDADES_S' +
        'ERVIDAS,?UNIDADES_PENDIENTES,?UNIDADES_RESERVADAS,?SERVIDO,?PREC' +
        'IO,?PIEZAS_X_BULTO,?BULTOS,?DESCUENTO,?DESCUENTO_2,?DESCUENTO_3,' +
        '?COMISION,?P_COSTE,?M_MOV_STOCK,?TIPO_IVA,?P_IVA,?P_RECARGO,?BRU' +
        'TO,?B_COMISION,?I_DESCUENTO,?B_IMPONIBLE,?I_COMISION,?ENTRADA,?E' +
        'NTRADA_AGRUPACION,?UNIDADES_EXT,?ORDEN_PRODUCCION,?UNIDADES_SEC,' +
        '?DIRECCION_ENTREGA,?ID_DETALLES_S,?ID_S,?ID_A,?ID_C_A,?COMISION_' +
        'LINEAL,?I_COMISION_LINEAL,?FECHA_ENTREGA_PREV,?FECHA_REC_DET,?TI' +
        'TULO_IDIOMA,?MARGEN_KRI,?TIPO_LINEA_KRI,?ORDEN,?TIPO_LINEA,?PROC' +
        '_PROMOCION,?ORIGEN,?ID_P,?APLICA_UNIDADES_SECUNDARIAS,?PROYECTO,' +
        '?CRC_NOTAS,?CRC_NOTAS2,?PRO_NUM_PLANO,?U_RESERVADA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DETALLE_PREPARA_PEDIDO'
      'WHERE'
      '  ID_S=?ID_S AND '
      '  ID_DETALLES_S=?ID_DETALLES_S ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_PREPARA_PEDIDO'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO<=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  SERIE=?SERIE AND'
      '  TIPO=?TIPO'
      'ORDER BY RIG,LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLE_PREPARA_PEDIDO'
      'SET'
      '  ENTRADA_AGRUPACION=?ENTRADA_AGRUPACION,'
      '  U_RESERVADAS = ?U_RESERVADAS'
      'WHERE'
      '  ID_S=?ID_S AND '
      '  ID_DETALLES_S=?ID_DETALLES_S ')
    OnCalcFields = QMAltaPedidosCalcFields
    ClavesPrimarias.Strings = (
      'ID_S '
      'ID_DETALLES_S ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_DETALLE_PREPARA_PEDIDO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 72
    object QMAltaPedidosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAltaPedidosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMAltaPedidosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMAltaPedidosSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMAltaPedidosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMAltaPedidosRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMAltaPedidosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMAltaPedidosESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMAltaPedidosCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMAltaPedidosMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMAltaPedidosALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMAltaPedidosARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMAltaPedidosTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMAltaPedidosUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMAltaPedidosUNIDADES_SERVIDAS: TFloatField
      DisplayLabel = 'Uds Serv.'
      FieldName = 'UNIDADES_SERVIDAS'
    end
    object QMAltaPedidosUNIDADES_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'UNIDADES_PENDIENTES'
    end
    object QMAltaPedidosUNIDADES_RESERVADAS: TFloatField
      DisplayLabel = 'Uds. Reserv.'
      FieldName = 'UNIDADES_RESERVADAS'
    end
    object QMAltaPedidosSERVIDO: TIntegerField
      DisplayLabel = 'Serv.'
      FieldName = 'SERVIDO'
    end
    object QMAltaPedidosPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMAltaPedidosPIEZAS_X_BULTO: TIntegerField
      DisplayLabel = 'Piezas x Bulto'
      FieldName = 'PIEZAS_X_BULTO'
    end
    object QMAltaPedidosBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object QMAltaPedidosDESCUENTO: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO'
    end
    object QMAltaPedidosDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object QMAltaPedidosDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object QMAltaPedidosCOMISION: TFloatField
      DisplayLabel = 'Comisi'#243'n'
      FieldName = 'COMISION'
    end
    object QMAltaPedidosP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMAltaPedidosM_MOV_STOCK: TIntegerField
      DisplayLabel = 'N. Mov. Stock'
      FieldName = 'M_MOV_STOCK'
    end
    object QMAltaPedidosTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMAltaPedidosP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object QMAltaPedidosP_RECARGO: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_RECARGO'
    end
    object QMAltaPedidosBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object QMAltaPedidosB_COMISION: TFloatField
      DisplayLabel = 'Base Comisi'#243'n'
      FieldName = 'B_COMISION'
    end
    object QMAltaPedidosI_DESCUENTO: TFloatField
      DisplayLabel = 'Imp. Desc.'
      FieldName = 'I_DESCUENTO'
    end
    object QMAltaPedidosB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMAltaPedidosB_DTO_LINEA: TFloatField
      DisplayLabel = 'B. Dto. L'#237'nea'
      FieldName = 'B_DTO_LINEA'
    end
    object QMAltaPedidosI_COMISION: TFloatField
      DisplayLabel = 'Imp. Comisi'#243'n'
      FieldName = 'I_COMISION'
    end
    object QMAltaPedidosC_IVA: TFloatField
      DisplayLabel = 'C. IVA'
      FieldName = 'C_IVA'
    end
    object QMAltaPedidosC_RECARGO: TFloatField
      DisplayLabel = 'C. Rec.'
      FieldName = 'C_RECARGO'
    end
    object QMAltaPedidosT_COSTE: TFloatField
      DisplayLabel = 'T. Coste'
      FieldName = 'T_COSTE'
    end
    object QMAltaPedidosM_BRUTO: TFloatField
      DisplayLabel = 'M. Bruto'
      FieldName = 'M_BRUTO'
    end
    object QMAltaPedidosLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object QMAltaPedidosENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMAltaPedidosENTRADA_AGRUPACION: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA_AGRUPACION'
    end
    object QMAltaPedidosUNIDADES_EXT: TFloatField
      DisplayLabel = 'Uds. Ext.'
      FieldName = 'UNIDADES_EXT'
    end
    object QMAltaPedidosORDEN_PRODUCCION: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'ORDEN_PRODUCCION'
    end
    object QMAltaPedidosUNIDADES_SEC: TFloatField
      DisplayLabel = 'Uds. Sec.'
      FieldName = 'UNIDADES_SEC'
    end
    object QMAltaPedidosDIRECCION_ENTREGA: TIntegerField
      DisplayLabel = 'Dir. Entrega'
      FieldName = 'DIRECCION_ENTREGA'
    end
    object QMAltaPedidosID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMAltaPedidosID_S: TIntegerField
      DisplayLabel = 'ID Cab.'
      FieldName = 'ID_S'
    end
    object QMAltaPedidosID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMAltaPedidosID_C_A: TIntegerField
      DisplayLabel = 'ID Art. Can.'
      FieldName = 'ID_C_A'
    end
    object QMAltaPedidosCOMISION_LINEAL: TFloatField
      DisplayLabel = 'Comisi'#243'n Lineal'
      FieldName = 'COMISION_LINEAL'
    end
    object QMAltaPedidosI_COMISION_LINEAL: TFloatField
      DisplayLabel = 'Imp. Com. Lineal'
      FieldName = 'I_COMISION_LINEAL'
    end
    object QMAltaPedidosFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'Fecha Ent. Prev.'
      FieldName = 'FECHA_ENTREGA_PREV'
    end
    object QMAltaPedidosFECHA_REC_DET: TDateTimeField
      DisplayLabel = 'Fec. Rec. Det.'
      FieldName = 'FECHA_REC_DET'
    end
    object QMAltaPedidosTITULO_IDIOMA: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_IDIOMA'
      Size = 60
    end
    object QMAltaPedidosMARGEN_KRI: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN_KRI'
    end
    object QMAltaPedidosTIPO_LINEA_KRI: TIntegerField
      DisplayLabel = 'Tipo L'#237'nea'
      FieldName = 'TIPO_LINEA_KRI'
    end
    object QMAltaPedidosORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMAltaPedidosTIPO_LINEA: TFIBStringField
      DisplayLabel = 'Tipo L'#237'nea'
      FieldName = 'TIPO_LINEA'
      Size = 3
    end
    object QMAltaPedidosPROC_PROMOCION: TIntegerField
      DisplayLabel = 'Poc. Prom.'
      FieldName = 'PROC_PROMOCION'
    end
    object QMAltaPedidosORIGEN: TIntegerField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
    end
    object QMAltaPedidosID_P: TIntegerField
      DisplayLabel = 'ID Prom.'
      FieldName = 'ID_P'
    end
    object QMAltaPedidosAPLICA_UNIDADES_SECUNDARIAS: TIntegerField
      DisplayLabel = 'Aplica Uds. Sec.'
      FieldName = 'APLICA_UNIDADES_SECUNDARIAS'
    end
    object QMAltaPedidosPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMAltaPedidosCRC_NOTAS: TFIBStringField
      DisplayLabel = 'CRC Notas'
      FieldName = 'CRC_NOTAS'
      Size = 15
    end
    object QMAltaPedidosCRC_NOTAS2: TFIBStringField
      DisplayLabel = 'CRC Notas Int.'
      FieldName = 'CRC_NOTAS2'
      Size = 15
    end
    object QMAltaPedidosPRO_NUM_PLANO: TFIBStringField
      DisplayLabel = 'N'#250'm. Plano'
      FieldName = 'PRO_NUM_PLANO'
      Size = 35
    end
    object QMAltaPedidosSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldKind = fkCalculated
      FieldName = 'STOCK'
      OnGetText = QMAltaPedidosSTOCKGetText
      Calculated = True
    end
    object QMAltaPedidosU_RESERVADAS: TFloatField
      DisplayLabel = 'Uds.a Servir'
      FieldName = 'U_RESERVADAS'
      OnChange = QMAltaPedidosU_RESERVADASChange
    end
    object QMAltaPedidosUDS_EN_PREPARACION: TFloatField
      DisplayLabel = 'Uds. en Prep. Total'
      FieldKind = fkCalculated
      FieldName = 'UDS_EN_PREPARACION'
      OnGetText = QMAltaPedidosUDS_EN_PREPARACIONGetText
      Calculated = True
    end
    object QMAltaPedidosU_DISP_PARA_SERVIR: TFloatField
      DisplayLabel = 'Uds. Disponibles'
      FieldKind = fkCalculated
      FieldName = 'U_DISP_PARA_SERVIR'
      OnGetText = QMAltaPedidosU_DISP_PARA_SERVIRGetText
      Calculated = True
    end
    object QMAltaPedidosUNI_PREPARADOACTUAL: TIntegerField
      DisplayLabel = 'Uds. Prep. Actual'
      FieldKind = fkCalculated
      FieldName = 'UNI_PREPARADOACTUAL'
      Calculated = True
    end
    object QMAltaPedidosFECHA_RIG: TDateTimeField
      DisplayLabel = 'Fecha RIG'
      FieldName = 'FECHA_RIG'
    end
    object QMAltaPedidosESTADO_REGISTRO: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ESTADO_REGISTRO'
      Calculated = True
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 48
    Top = 24
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 192
    Top = 24
  end
  object SPMarcaEntradas: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'UPDATE VER_DETALLE_PREPARA_PEDIDO'
      'SET ENTRADA_AGRUPACION = 1'
      ''
      'WHERE ENTRADA_AGRUPACION = ?ENTRADA_AGRUPACION')
    Transaction = TLocal
    AutoTrans = True
    Left = 48
    Top = 120
  end
  object SPGeneraHojasPedido: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'EXECUTE PROCEDURE GENERA_ALTA_PEDIDOS'
      
        '(?EMPRESA,?CANAL,?SERIE,?ENTRADA,?ALMACEN,?RESPONSABLE,?ID_UBICA' +
        'CION_SIMPLE)')
    Transaction = TLocal
    AutoTrans = True
    Left = 48
    Top = 168
  end
  object RxStock: TRxMemoryData
    FieldDefs = <>
    Left = 192
    Top = 120
    object RxStockALMACEN: TStringField
      FieldName = 'ALMACEN'
      Size = 3
    end
    object RxStockARTICULO: TStringField
      FieldName = 'ARTICULO'
      Size = 15
    end
    object RxStockSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
  end
  object RxUnidadesPreparacion: TRxMemoryData
    FieldDefs = <>
    Left = 192
    Top = 168
    object RxUnidadesPreparacionU_PREPARACION: TFloatField
      DisplayLabel = 'Uds. Rep.'
      FieldName = 'U_PREPARACION'
    end
    object RxUnidadesPreparacionALMACEN: TStringField
      FieldName = 'ALMACEN'
    end
    object RxUnidadesPreparacionARTICULO: TStringField
      FieldName = 'ARTICULO'
    end
  end
end
