object ProDMIntroduceDatosReserva: TProDMIntroduceDatosReserva
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 658
  Top = 319
  Height = 305
  Width = 383
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 304
    Top = 8
  end
  object QMMaterialesLot_Ubi: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT MAT.EMPRESA, MAT.EJERCICIO, MAT.CANAL, MAT.SERIES, MAT.RI' +
        'G_OF, MAT.SUBORDEN, MAT.LINEA_MAT, MAT.ALMACEN,'
      
        '       MAT.COMPONENTE, MAT.ORDEN, MAT.UNIDADES_NEC, UNIDADES_UTI' +
        'L, MAT.PORCENTAJE, MAT.LINEA_FASE, MAT.PRE_COS_UNI,'
      
        '       MAT.TOTAL_VAR, MAT.PRECIO_FIJO, MAT.TOTAL, MAT.PRODUCCION' +
        ', MAT.MATESC, MAT.ENTRADA, ID_ORDEN, MAT.ID_ORDEN_MAT,'
      
        '       RES.UNIDADES AS UNIDADES_FAB, MAT.UNIDADES_STOCK, MAT.PRE' +
        '_COS_UNI_REAL, MAT.ID_MOV_STOCK, MAT.UNIDADES_PREV,'
      
        '       PRECIO_FIJO_REAL, MAT.TOTAL_VAR_REAL, MAT.TOTAL_REAL, MAT' +
        '.NOTAS_MAT, MAT.MEDIDAS, MAT.TIPO_PIEZA, MAT.NUM_PIEZAS,'
      
        '       MAT.ID_MOV_STOCK_B, ID_MOV_STOCK_C, MAT.UNIDAD_ART, MAT.U' +
        'NIDAD_FAB, MAT.ID_EQUIVAL, MAT.COMPRAR,'
      
        '       MAT.PROVEEDOR_COMPRA, MAT.MOV_STOCK_COMPRA, MAT.ID_A, MAT' +
        '.UDS_COMPRA, RESERVA_STOCK, MAT.N_MOV_STOCK,'
      
        '       MAT.MINI_NOTA, MAT.RESULTADO_FORMULA, MAT.FORMULA, MAT.DE' +
        'SACTIVA_TRIGGER, MAT.DES_ALTO, MAT.DES_ANCHO,'
      
        '       DES_GRUESO, MAT.ESTADO, MAT.LINEA_TAREA, MAT.ID_DETALLES_' +
        'ST, MAT.MERMA, MAT.UNIDADES_DEVOLVER, ALMACEN_DEVOLVER,'
      
        '       MAT.N_MOV_STOCK_RESERVA, MAT.ALMACEN_SAL, ALM.CTROL_UBICA' +
        'CION, ART.UBICABLE, ART.LOTES, ART.CONTROL_STOCK,'
      
        '       ART.TITULO, MAT.ID_LOTE ID_LOTE_MAT, MAT.LOTE LOTE_MAT, M' +
        'AT.ID_UBICACION, RES.LINEA_RES, RES.ID_RESERVA_MAT,'
      '       RES.UNIDADES_ENVIAR, RES.PREPARADO,'
      '       (SELECT FIRST 1 ID_LOTE'
      '        FROM PRO_ORD_MAT_RESERVA_LOTES'
      '        WHERE'
      '        ID_ORDEN_MAT = MAT.ID_ORDEN_MAT AND'
      '        LINEA_RES = RES.LINEA_RES'
      '        ORDER BY ID_LOTE) ID_LOTE,'
      '       (SELECT FIRST 1 LOTE'
      '        FROM PRO_ORD_MAT_RESERVA_LOTES'
      '        WHERE'
      '        ID_ORDEN_MAT = MAT.ID_ORDEN_MAT AND'
      '        LINEA_RES = RES.LINEA_RES'
      '        ORDER BY ID_LOTE) LOTE,'
      '       (SELECT COUNT(ID_LOTE)'
      '        FROM PRO_ORD_MAT_RESERVA_LOTES'
      '        WHERE'
      '        ID_ORDEN_MAT = MAT.ID_ORDEN_MAT AND'
      
        '        LINEA_RES = RES.LINEA_RES) CANT_LOTE, RES.ALMACEN_SAL AL' +
        'MACEN_SAL_RES,'
      '       RES.COMPONENTE COMPONENTE_RES'
      'FROM PRO_ORD_MAT MAT'
      
        'LEFT JOIN PRO_ORD_MAT_RESERVA RES ON (MAT.ID_ORDEN_MAT = RES.ID_' +
        'ORDEN_MAT AND RES.LINEA_RES = :LINEA_RES)'
      
        'LEFT JOIN ART_ALMACENES ALM ON (ALM.EMPRESA = MAT.EMPRESA AND AL' +
        'M.ALMACEN = MAT.ALMACEN)'
      
        'LEFT JOIN ART_ARTICULOS ART ON (ART.EMPRESA = MAT.EMPRESA AND AR' +
        'T.ARTICULO = MAT.COMPONENTE)'
      'WHERE'
      'MAT.ID_ORDEN = :ID_ORDEN AND '
      'MAT.LINEA_MAT = :LINEA_MAT')
    SelectSQL.Strings = (
      
        'SELECT MAT.EMPRESA, MAT.EJERCICIO, MAT.CANAL, MAT.SERIES, MAT.RI' +
        'G_OF, MAT.SUBORDEN, MAT.LINEA_MAT, MAT.ALMACEN,'
      
        '       MAT.COMPONENTE, MAT.ORDEN, MAT.UNIDADES_NEC, UNIDADES_UTI' +
        'L, MAT.PORCENTAJE, MAT.LINEA_FASE, MAT.PRE_COS_UNI,'
      
        '       MAT.TOTAL_VAR, MAT.PRECIO_FIJO, MAT.TOTAL, MAT.PRODUCCION' +
        ', MAT.MATESC, MAT.ENTRADA, ID_ORDEN, MAT.ID_ORDEN_MAT,'
      
        '       RES.UNIDADES AS UNIDADES_FAB, MAT.UNIDADES_STOCK, MAT.PRE' +
        '_COS_UNI_REAL, MAT.ID_MOV_STOCK, MAT.UNIDADES_PREV,'
      
        '       PRECIO_FIJO_REAL, MAT.TOTAL_VAR_REAL, MAT.TOTAL_REAL, MAT' +
        '.NOTAS_MAT, MAT.MEDIDAS, MAT.TIPO_PIEZA, MAT.NUM_PIEZAS,'
      
        '       MAT.ID_MOV_STOCK_B, ID_MOV_STOCK_C, MAT.UNIDAD_ART, MAT.U' +
        'NIDAD_FAB, MAT.ID_EQUIVAL, MAT.COMPRAR,'
      
        '       MAT.PROVEEDOR_COMPRA, MAT.MOV_STOCK_COMPRA, MAT.ID_A, MAT' +
        '.UDS_COMPRA, RESERVA_STOCK, MAT.N_MOV_STOCK,'
      
        '       MAT.MINI_NOTA, MAT.RESULTADO_FORMULA, MAT.FORMULA, MAT.DE' +
        'SACTIVA_TRIGGER, MAT.DES_ALTO, MAT.DES_ANCHO,'
      
        '       DES_GRUESO, MAT.ESTADO, MAT.LINEA_TAREA, MAT.ID_DETALLES_' +
        'ST, MAT.MERMA, MAT.UNIDADES_DEVOLVER, ALMACEN_DEVOLVER,'
      
        '       MAT.N_MOV_STOCK_RESERVA, MAT.ALMACEN_SAL, ALM.CTROL_UBICA' +
        'CION, ART.UBICABLE, ART.LOTES, ART.CONTROL_STOCK,'
      
        '       ART.TITULO, MAT.ID_LOTE ID_LOTE_MAT, MAT.LOTE LOTE_MAT, M' +
        'AT.ID_UBICACION, RES.LINEA_RES, RES.ID_RESERVA_MAT,'
      '       RES.UNIDADES_ENVIAR, RES.PREPARADO,'
      '       (select first 1 ID_LOTE'
      '        from PRO_ORD_MAT_RESERVA_LOTES'
      '        where ID_ORDEN_MAT = MAT.ID_ORDEN_MAT and'
      '              LINEA_RES = RES.LINEA_RES'
      '        order by ID_LOTE) ID_LOTE,'
      '       (select first 1 AAL.CLASIFICACION'
      '        from PRO_ORD_MAT_RESERVA_LOTES POMR'
      
        '        join ART_ARTICULOS_LOTES AAL on POMR.ID_LOTE = AAL.ID_LO' +
        'TE'
      '        where ID_ORDEN_MAT = MAT.ID_ORDEN_MAT and'
      '              LINEA_RES = RES.LINEA_RES'
      '        order by ID_LOTE) CLASIFICACION,'
      '       (select first 1 LOTE'
      '        from PRO_ORD_MAT_RESERVA_LOTES'
      '        where ID_ORDEN_MAT = MAT.ID_ORDEN_MAT and'
      '              LINEA_RES = RES.LINEA_RES'
      '        order by ID_LOTE) LOTE,'
      '       (select count(ID_LOTE)'
      '        from PRO_ORD_MAT_RESERVA_LOTES'
      '        where ID_ORDEN_MAT = MAT.ID_ORDEN_MAT and'
      
        '              LINEA_RES = RES.LINEA_RES) CANT_LOTE, R.ESTADO EST' +
        'ADO_RESERVA, RES.ALMACEN_SAL ALMACEN_SAL_RES,'
      '       RES.COMPONENTE COMPONENTE_RES'
      'from PRO_ORD_MAT MAT'
      
        'left join PRO_ORD_MAT_RESERVA RES on (MAT.ID_ORDEN_MAT = RES.ID_' +
        'ORDEN_MAT and RES.LINEA_RES = :LINEA_RES)'
      'left join PRO_ORD_RESERVA R on (RES.ID_RESERVA = R.ID_RESERVA)'
      
        'left join ART_ALMACENES ALM on (ALM.EMPRESA = MAT.EMPRESA and AL' +
        'M.ALMACEN = MAT.ALMACEN)'
      
        'left join ART_ARTICULOS ART on (ART.EMPRESA = MAT.EMPRESA and AR' +
        'T.ARTICULO = MAT.COMPONENTE)'
      'where MAT.ID_ORDEN = :ID_ORDEN'
      'order by MAT.ORDEN, MAT.LINEA_FASE, MAT.LINEA_MAT')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_MAT_RESERVA'
      'SET'
      'UNIDADES = :UNIDADES_FAB,'
      'PREPARADO = :PREPARADO,'
      'ALMACEN_SAL = :ALMACEN_SAL_RES,'
      'COMPONENTE = :COMPONENTE_RES'
      'WHERE'
      'ID_ORDEN_MAT = :ID_ORDEN_MAT AND'
      'LINEA_RES = :LINEA_RES'
      ''
      '/*'
      'UPDATE PRO_ORD_MAT'
      'SET'
      'ID_UBICACION = :ID_UBICACION,'
      'UNIDADES_DEVOLVER = :UNIDADES_DEVOLVER,'
      'ALMACEN_DEVOLVER = :ALMACEN_DEVOLVER,'
      'MERMA = :MERMA'
      'WHERE'
      'ID_ORDEN = :ID_ORDEN AND'
      'LINEA_MAT = :LINEA_MAT'
      '*/')
    DataSource = ProDMOrden.DSQMProOrd
    AfterPost = Graba
    OnCalcFields = QMMaterialesLot_UbiCalcFields
    Left = 56
    Top = 8
    object QMMaterialesLot_UbiEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMMaterialesLot_UbiEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMMaterialesLot_UbiCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMMaterialesLot_UbiSERIES: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIES'
      Size = 10
    end
    object QMMaterialesLot_UbiRIG_OF: TIntegerField
      DisplayLabel = 'RIG'
      FieldName = 'RIG_OF'
    end
    object QMMaterialesLot_UbiSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object QMMaterialesLot_UbiLINEA_MAT: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_MAT'
    end
    object QMMaterialesLot_UbiALMACEN: TFIBStringField
      DisplayLabel = 'Alm. Lan.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMMaterialesLot_UbiLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMMaterialesLot_UbiCOMPONENTE: TFIBStringField
      DisplayLabel = 'Componente'
      FieldName = 'COMPONENTE'
      Size = 15
    end
    object QMMaterialesLot_UbiORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMMaterialesLot_UbiUNIDADES_NEC: TFloatField
      DisplayLabel = 'Uds. Nec.'
      FieldName = 'UNIDADES_NEC'
    end
    object QMMaterialesLot_UbiUNIDADES_UTIL: TFloatField
      DisplayLabel = 'Uds. Util'
      FieldName = 'UNIDADES_UTIL'
    end
    object QMMaterialesLot_UbiPORCENTAJE: TFloatField
      DisplayLabel = 'Porcentaje'
      FieldName = 'PORCENTAJE'
    end
    object QMMaterialesLot_UbiLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object QMMaterialesLot_UbiPRE_COS_UNI: TFloatField
      DisplayLabel = 'Pre. Cos. Uni.'
      FieldName = 'PRE_COS_UNI'
    end
    object QMMaterialesLot_UbiTOTAL_VAR: TFloatField
      DisplayLabel = 'Total Var.'
      FieldName = 'TOTAL_VAR'
    end
    object QMMaterialesLot_UbiPRECIO_FIJO: TFloatField
      DisplayLabel = 'Precio Fijo'
      FieldName = 'PRECIO_FIJO'
    end
    object QMMaterialesLot_UbiTOTAL: TFloatField
      DisplayLabel = 'total'
      FieldName = 'TOTAL'
    end
    object QMMaterialesLot_UbiPRODUCCION: TIntegerField
      DisplayLabel = 'Producion'
      FieldName = 'PRODUCCION'
    end
    object QMMaterialesLot_UbiMATESC: TIntegerField
      DisplayLabel = 'Mat. Esc.'
      FieldName = 'MATESC'
    end
    object QMMaterialesLot_UbiENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMMaterialesLot_UbiID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMMaterialesLot_UbiID_ORDEN_MAT: TIntegerField
      DisplayLabel = 'ID Orden Mat.'
      FieldName = 'ID_ORDEN_MAT'
    end
    object QMMaterialesLot_UbiUNIDADES_FAB: TFloatField
      DisplayLabel = 'Uds. Fab.'
      FieldName = 'UNIDADES_FAB'
    end
    object QMMaterialesLot_UbiUNIDADES_STOCK: TFloatField
      DisplayLabel = 'Uds. Stock'
      FieldName = 'UNIDADES_STOCK'
    end
    object QMMaterialesLot_UbiPRE_COS_UNI_REAL: TFloatField
      DisplayLabel = 'Prec. Cos. Uni. Real'
      FieldName = 'PRE_COS_UNI_REAL'
    end
    object QMMaterialesLot_UbiID_MOV_STOCK: TIntegerField
      DisplayLabel = 'ID Mov. Stock'
      FieldName = 'ID_MOV_STOCK'
    end
    object QMMaterialesLot_UbiUNIDADES_PREV: TFloatField
      DisplayLabel = 'Uds. Prev.'
      FieldName = 'UNIDADES_PREV'
    end
    object QMMaterialesLot_UbiPRECIO_FIJO_REAL: TFloatField
      DisplayLabel = 'Precio Fijo Real'
      FieldName = 'PRECIO_FIJO_REAL'
    end
    object QMMaterialesLot_UbiTOTAL_VAR_REAL: TFloatField
      DisplayLabel = 'Total Var. Real'
      FieldName = 'TOTAL_VAR_REAL'
    end
    object QMMaterialesLot_UbiTOTAL_REAL: TFloatField
      DisplayLabel = 'Total Real'
      FieldName = 'TOTAL_REAL'
    end
    object QMMaterialesLot_UbiNOTAS_MAT: TMemoField
      DisplayLabel = 'Notas Mat.'
      FieldName = 'NOTAS_MAT'
      BlobType = ftMemo
      Size = 8
    end
    object QMMaterialesLot_UbiMEDIDAS: TFIBStringField
      DisplayLabel = 'Medidas'
      FieldName = 'MEDIDAS'
      Size = 60
    end
    object QMMaterialesLot_UbiTIPO_PIEZA: TFIBStringField
      DisplayLabel = 'Tipo Pieza'
      FieldName = 'TIPO_PIEZA'
      Size = 60
    end
    object QMMaterialesLot_UbiNUM_PIEZAS: TFIBStringField
      DisplayLabel = 'Num Piezas'
      FieldName = 'NUM_PIEZAS'
      Size = 60
    end
    object QMMaterialesLot_UbiID_MOV_STOCK_B: TIntegerField
      DisplayLabel = 'ID Mov. Stock B'
      FieldName = 'ID_MOV_STOCK_B'
    end
    object QMMaterialesLot_UbiID_MOV_STOCK_C: TIntegerField
      DisplayLabel = 'ID Mov. Stock C'
      FieldName = 'ID_MOV_STOCK_C'
    end
    object QMMaterialesLot_UbiUNIDAD_ART: TFIBStringField
      DisplayLabel = 'Unidad Art.'
      FieldName = 'UNIDAD_ART'
      Size = 2
    end
    object QMMaterialesLot_UbiUNIDAD_FAB: TFIBStringField
      DisplayLabel = 'Unidad Fab.'
      FieldName = 'UNIDAD_FAB'
      Size = 2
    end
    object QMMaterialesLot_UbiID_EQUIVAL: TIntegerField
      DisplayLabel = 'ID Equiv.'
      FieldName = 'ID_EQUIVAL'
    end
    object QMMaterialesLot_UbiCOMPRAR: TIntegerField
      DisplayLabel = 'Comprar'
      FieldName = 'COMPRAR'
    end
    object QMMaterialesLot_UbiPROVEEDOR_COMPRA: TIntegerField
      DisplayLabel = 'Prov. Compra'
      FieldName = 'PROVEEDOR_COMPRA'
    end
    object QMMaterialesLot_UbiMOV_STOCK_COMPRA: TIntegerField
      DisplayLabel = 'Mov. Stock Compra'
      FieldName = 'MOV_STOCK_COMPRA'
    end
    object QMMaterialesLot_UbiID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMMaterialesLot_UbiUDS_COMPRA: TFloatField
      DisplayLabel = 'Uds Compra'
      FieldName = 'UDS_COMPRA'
    end
    object QMMaterialesLot_UbiRESERVA_STOCK: TIntegerField
      DisplayLabel = 'Reserva Stock'
      FieldName = 'RESERVA_STOCK'
    end
    object QMMaterialesLot_UbiN_MOV_STOCK: TIntegerField
      DisplayLabel = 'N. Mov. Stock'
      FieldName = 'N_MOV_STOCK'
    end
    object QMMaterialesLot_UbiMINI_NOTA: TFIBStringField
      DisplayLabel = 'Mini Nota'
      FieldName = 'MINI_NOTA'
      Size = 60
    end
    object QMMaterialesLot_UbiRESULTADO_FORMULA: TFloatField
      DisplayLabel = 'Result. Formula'
      FieldName = 'RESULTADO_FORMULA'
    end
    object QMMaterialesLot_UbiFORMULA: TIntegerField
      DisplayLabel = 'Formula'
      FieldName = 'FORMULA'
    end
    object QMMaterialesLot_UbiDESACTIVA_TRIGGER: TIntegerField
      DisplayLabel = 'Desact. Trigger'
      FieldName = 'DESACTIVA_TRIGGER'
    end
    object QMMaterialesLot_UbiDES_ALTO: TFloatField
      DisplayLabel = 'Des. Alto'
      FieldName = 'DES_ALTO'
    end
    object QMMaterialesLot_UbiDES_ANCHO: TFloatField
      DisplayLabel = 'Des. Ancho'
      FieldName = 'DES_ANCHO'
    end
    object QMMaterialesLot_UbiDES_GRUESO: TFloatField
      DisplayLabel = 'Des. Grueso'
      FieldName = 'DES_GRUESO'
    end
    object QMMaterialesLot_UbiESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMMaterialesLot_UbiLINEA_TAREA: TIntegerField
      DisplayLabel = 'Linea Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object QMMaterialesLot_UbiID_DETALLES_ST: TIntegerField
      DisplayLabel = 'ID Detalles ST'
      FieldName = 'ID_DETALLES_ST'
    end
    object QMMaterialesLot_UbiID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
      OnChange = QMMaterialesLot_UbiID_LOTEChange
    end
    object QMMaterialesLot_UbiTITULO_LOTE: TStringField
      DisplayLabel = 'Descripcion Lote'
      FieldKind = fkCalculated
      FieldName = 'TITULO_LOTE'
      OnGetText = QMMaterialesLot_UbiTITULO_LOTEGetText
      Calculated = True
    end
    object QMMaterialesLot_UbiID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubicacion'
      FieldName = 'ID_UBICACION'
      OnChange = QMMaterialesLot_UbiID_UBICACIONChange
    end
    object QMMaterialesLot_UbiTitulo_Ubicacion: TStringField
      DisplayLabel = 'Descripcion Ubicacion'
      FieldKind = fkCalculated
      FieldName = 'Titulo_Ubicacion'
      OnGetText = QMMaterialesLot_UbiTitulo_UbicacionGetText
      Calculated = True
    end
    object QMMaterialesLot_UbiCTROL_UBICACION: TIntegerField
      DisplayLabel = 'Ctrol. Ubicacion Alm. Lan'
      FieldName = 'CTROL_UBICACION'
    end
    object QMMaterialesLot_UbiUBICABLE: TIntegerField
      DisplayLabel = 'Ubicable'
      FieldName = 'UBICABLE'
    end
    object QMMaterialesLot_UbiLOTES: TIntegerField
      DisplayLabel = 'Ctrol. Lotes'
      FieldName = 'LOTES'
    end
    object QMMaterialesLot_UbiMERMA: TFloatField
      DisplayLabel = 'Merma'
      FieldName = 'MERMA'
    end
    object QMMaterialesLot_UbiUNIDADES_DEVOLVER: TFloatField
      DisplayLabel = 'Uds. Dev.'
      FieldName = 'UNIDADES_DEVOLVER'
    end
    object QMMaterialesLot_UbiALMACEN_DEVOLVER: TFIBStringField
      DisplayLabel = 'Alm. Dev.'
      FieldName = 'ALMACEN_DEVOLVER'
      Size = 3
    end
    object QMMaterialesLot_UbiUDS_POSIBLES: TFloatField
      DisplayLabel = 'Uds. Posibles'
      FieldKind = fkCalculated
      FieldName = 'UDS_POSIBLES'
      Calculated = True
    end
    object QMMaterialesLot_UbiALMACEN_SAL: TFIBStringField
      DisplayLabel = 'Alm. Sal'
      FieldName = 'ALMACEN_SAL'
      Size = 3
    end
    object QMMaterialesLot_UbiTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMMaterialesLot_UbiSTOCK_ALM_SAL: TFloatField
      DisplayLabel = 'Stock Alm. Sal.'
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM_SAL'
      Calculated = True
    end
    object QMMaterialesLot_UbiSTOCK_ALM_LAN: TFloatField
      DisplayLabel = 'Stock Alm. Lan.'
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM_LAN'
      Calculated = True
    end
    object QMMaterialesLot_UbiCONTROL_STOCK: TIntegerField
      DisplayLabel = 'Contr. Stock'
      FieldName = 'CONTROL_STOCK'
    end
    object QMMaterialesLot_UbiCANT_LOTE: TIntegerField
      DisplayLabel = 'Cantidad Lotes Diferentes'
      FieldName = 'CANT_LOTE'
    end
    object QMMaterialesLot_UbiLINEA_RES: TIntegerField
      DisplayLabel = 'Linea Res.'
      FieldName = 'LINEA_RES'
    end
    object QMMaterialesLot_UbiID_RESERVA_MAT: TIntegerField
      DisplayLabel = 'Id Reserva Mat.'
      FieldName = 'ID_RESERVA_MAT'
    end
    object QMMaterialesLot_UbiUNIDADES_ENVIAR: TFloatField
      DisplayLabel = 'Uds. Enviar'
      FieldName = 'UNIDADES_ENVIAR'
    end
    object QMMaterialesLot_UbiPREPARADO: TIntegerField
      DisplayLabel = 'Preparado'
      FieldName = 'PREPARADO'
    end
    object QMMaterialesLot_UbiESTADO_RESERVA: TIntegerField
      DisplayLabel = 'Estado Res.'
      FieldName = 'ESTADO_RESERVA'
    end
    object QMMaterialesLot_UbiCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificaci'#243'n'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object QMMaterialesLot_UbiALMACEN_SAL_RES: TFIBStringField
      DisplayLabel = 'Almac'#233'n Reserva'
      FieldName = 'ALMACEN_SAL_RES'
      Size = 3
    end
    object QMMaterialesLot_UbiCOMPONENTE_RES: TFIBStringField
      DisplayLabel = 'Componente Reserva'
      FieldName = 'COMPONENTE_RES'
      Size = 15
    end
  end
  object DSQMMaterialesLot_Ubi: TDataSource
    DataSet = QMMaterialesLot_Ubi
    Left = 176
    Top = 8
  end
  object QMCompuesto: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT COMP.*, RES.UNIDADES UNIDADES_RES, RES.LINEA_RES, ART.SER' +
        'IALIZADO, ART.SERIALIZADO_KRI, ART.UBICABLE, ART.LOTES,'
      
        '       RES.ID_RESERVA, /* RES.ID_LOTE ID_LOTE_RESERVA, AAL.CLASI' +
        'FICACION,*/ RES.NOTAS, ART.FAMILIA, RES.FECHA,'
      '       (SELECT FIRST 1 ID_LOTE'
      '        FROM PRO_ORD_LOTE'
      '        WHERE'
      '        ID_ORDEN = COMP.ID_ORDEN'
      '        ORDER BY SUBLINEA) ID_LOTE,'
      '       (CAST(SUBSTRING((SELECT LIST(LOTE)'
      '                   FROM PRO_ORD_LOTE OL'
      
        '                   JOIN ART_ARTICULOS_LOTES L ON (OL.ID_LOTE = L' +
        '.ID_LOTE)'
      '                   WHERE'
      
        '                   OL.ID_ORDEN = COMP.ID_ORDEN) FROM 1 FOR 20) A' +
        'S VARCHAR(20))) DESC_LOTE,'
      '       (SELECT COUNT(*)'
      '        FROM PRO_ORD_RESERVA'
      '        WHERE'
      '        ID_ORDEN = COMP.ID_ORDEN AND'
      '        LINEA_RES <> RES.LINEA_RES) CANT_RESERVAS,'
      '       (SELECT SUM(UNIDADES)'
      '        FROM PRO_ORD_RESERVA'
      '        WHERE'
      '        ID_ORDEN = COMP.ID_ORDEN AND'
      '        LINEA_RES <> RES.LINEA_RES) UNIDADES_RESERVAS,'
      '       (SELECT FIRST 1 ID_LOTE'
      '        FROM PRO_ORD_RESERVA_LOTE'
      '        WHERE'
      '        ID_ORDEN = COMP.ID_ORDEN AND'
      '        LINEA_RES = RES.LINEA_RES'
      '        ORDER BY ID_LOTE) ID_LOTE_RESERVA,'
      '       (SELECT FIRST 1 AAL.CLASIFICACION'
      '        FROM PRO_ORD_RESERVA_LOTE POMR'
      
        '        JOIN ART_ARTICULOS_LOTES AAL ON POMR.ID_LOTE = AAL.ID_LO' +
        'TE'
      '        WHERE'
      '        ID_ORDEN = COMP.ID_ORDEN AND'
      '        LINEA_RES = RES.LINEA_RES'
      '        ORDER BY ID_LOTE) CLASIFICACION,'
      '       (SELECT FIRST 1 LOTE'
      '        FROM PRO_ORD_RESERVA_LOTE'
      '        WHERE'
      '        ID_ORDEN = COMP.ID_ORDEN AND'
      '        LINEA_RES = RES.LINEA_RES'
      '        ORDER BY ID_LOTE) LOTE,'
      '       (SELECT COUNT(ID_LOTE)'
      '        FROM PRO_ORD_RESERVA_LOTE'
      '        WHERE'
      '        ID_ORDEN = COMP.ID_ORDEN AND'
      '        LINEA_RES = RES.LINEA_RES) CANT_LOTE'
      'FROM PRO_ORD COMP'
      
        'LEFT JOIN PRO_ORD_RESERVA RES ON (COMP.ID_ORDEN = RES.ID_ORDEN A' +
        'ND RES.LINEA_RES = :LINEA_RES)'
      
        'LEFT JOIN ART_ALMACENES ALM ON (ALM.EMPRESA = COMP.EMPRESA AND A' +
        'LM.ALMACEN = COMP.ALMACEN_SAL)'
      
        'LEFT JOIN ART_ARTICULOS ART ON (ART.EMPRESA = COMP.EMPRESA AND A' +
        'RT.ARTICULO = COMP.COMPUESTO)'
      'WHERE'
      'COMP.ID_ORDEN = :ID_ORDEN AND'
      'RES.LINEA_RES = :LINEA_RES')
    SelectSQL.Strings = (
      
        'SELECT COMP.*, RES.UNIDADES UNIDADES_RES, RES.LINEA_RES, ART.SER' +
        'IALIZADO, ART.SERIALIZADO_KRI, ART.UBICABLE, ART.LOTES,'
      
        '       RES.ID_RESERVA, /* RES.ID_LOTE ID_LOTE_RESERVA, AAL.CLASI' +
        'FICACION,*/ RES.NOTAS, ART.FAMILIA, RES.FECHA,'
      '       (SELECT FIRST 1 ID_LOTE'
      '        FROM PRO_ORD_LOTE'
      '        WHERE'
      '        ID_ORDEN = COMP.ID_ORDEN'
      '        ORDER BY SUBLINEA) ID_LOTE,'
      '       (CAST(SUBSTRING((SELECT LIST(LOTE)'
      '                   FROM PRO_ORD_LOTE OL'
      
        '                   JOIN ART_ARTICULOS_LOTES L ON (OL.ID_LOTE = L' +
        '.ID_LOTE)'
      '                   WHERE'
      
        '                   OL.ID_ORDEN = COMP.ID_ORDEN) FROM 1 FOR 20) A' +
        'S VARCHAR(20))) DESC_LOTE,'
      '       (SELECT COUNT(*)'
      '        FROM PRO_ORD_RESERVA'
      '        WHERE'
      '        ID_ORDEN = COMP.ID_ORDEN /* AND'
      '        LINEA_RES <> RES.LINEA_RES*/ ) CANT_RESERVAS,'
      '       (SELECT SUM(UNIDADES)'
      '        FROM PRO_ORD_RESERVA'
      '        WHERE'
      '        ID_ORDEN = COMP.ID_ORDEN /* AND'
      '        LINEA_RES <> RES.LINEA_RES*/ ) UNIDADES_RESERVAS,'
      '       (SELECT FIRST 1 ID_LOTE'
      '        FROM PRO_ORD_RESERVA_LOTE'
      '        WHERE'
      '        ID_ORDEN = COMP.ID_ORDEN AND'
      '        LINEA_RES = RES.LINEA_RES'
      '        ORDER BY ID_LOTE) ID_LOTE_RESERVA,'
      '       (SELECT FIRST 1 AAL.CLASIFICACION'
      '        FROM PRO_ORD_RESERVA_LOTE POMR'
      
        '        JOIN ART_ARTICULOS_LOTES AAL ON POMR.ID_LOTE = AAL.ID_LO' +
        'TE'
      '        WHERE'
      '        ID_ORDEN = COMP.ID_ORDEN AND'
      '        LINEA_RES = RES.LINEA_RES'
      '        ORDER BY ID_LOTE) CLASIFICACION,'
      '       (SELECT FIRST 1 LOTE'
      '        FROM PRO_ORD_RESERVA_LOTE'
      '        WHERE'
      '        ID_ORDEN = COMP.ID_ORDEN AND'
      '        LINEA_RES = RES.LINEA_RES'
      '        ORDER BY ID_LOTE) LOTE,'
      '       (SELECT COUNT(ID_LOTE)'
      '        FROM PRO_ORD_RESERVA_LOTE'
      '        WHERE'
      '        ID_ORDEN = COMP.ID_ORDEN AND'
      '        LINEA_RES = RES.LINEA_RES) CANT_LOTE'
      'FROM PRO_ORD COMP'
      
        'LEFT JOIN PRO_ORD_RESERVA RES ON (COMP.ID_ORDEN = RES.ID_ORDEN A' +
        'ND RES.LINEA_RES = :LINEA_RES)'
      
        'LEFT JOIN ART_ALMACENES ALM ON (ALM.EMPRESA = COMP.EMPRESA AND A' +
        'LM.ALMACEN = COMP.ALMACEN_SAL)'
      
        'LEFT JOIN ART_ARTICULOS ART ON (ART.EMPRESA = COMP.EMPRESA AND A' +
        'RT.ARTICULO = COMP.COMPUESTO)'
      'LEFT JOIN ART_ARTICULOS_LOTES AAL ON (RES.ID_LOTE = AAL.ID_LOTE)'
      'WHERE'
      'COMP.ID_ORDEN = :ID_ORDEN AND'
      'RES.LINEA_RES = :LINEA_RES')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_RESERVA'
      'SET'
      'UNIDADES = :UNIDADES_RES,'
      'NOTAS = :NOTAS,'
      'FECHA = :FECHA'
      'WHERE'
      'ID_ORDEN = :ID_ORDEN AND'
      'LINEA_RES = :LINEA_RES')
    DataSource = ProDMOrden.DSQMProOrd
    AfterOpen = QMCompuestoAfterOpen
    AfterPost = QMCompuestoAfterPost
    BeforeClose = QMCompuestoBeforeClose
    OnCalcFields = QMCompuestoCalcFields
    Left = 56
    Top = 56
    object QMCompuestoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCompuestoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCompuestoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCompuestoSERIES: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIES'
      Size = 10
    end
    object QMCompuestoRIG_OF: TIntegerField
      DisplayLabel = 'RIG'
      FieldName = 'RIG_OF'
    end
    object QMCompuestoSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object QMCompuestoALMACEN_SAL: TFIBStringField
      DisplayLabel = 'Alm. Sal.'
      FieldName = 'ALMACEN_SAL'
      Size = 3
    end
    object QMCompuestoALMACEN_LAN: TFIBStringField
      DisplayLabel = 'Alm. Lan.'
      FieldName = 'ALMACEN_LAN'
      Size = 3
    end
    object QMCompuestoALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Alm. Ent.'
      FieldName = 'ALMACEN_ENT'
      Size = 3
    end
    object QMCompuestoFECHA_ORD: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_ORD'
    end
    object QMCompuestoCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCompuestoCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object QMCompuestoESCANDALLO: TIntegerField
      DisplayLabel = 'Esc.'
      FieldName = 'ESCANDALLO'
    end
    object QMCompuestoESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCompuestoPEDIDO: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'PEDIDO'
    end
    object QMCompuestoLINEA_PED: TIntegerField
      DisplayLabel = 'Linea Ped.'
      FieldName = 'LINEA_PED'
    end
    object QMCompuestoFECHA_PED: TDateTimeField
      DisplayLabel = 'Fecha Ped.'
      FieldName = 'FECHA_PED'
    end
    object QMCompuestoUNI_PEDID: TFloatField
      DisplayLabel = 'Unid. Ped.'
      FieldName = 'UNI_PEDID'
    end
    object QMCompuestoUNI_MANUAL: TFloatField
      DisplayLabel = 'Unid. Manual'
      FieldName = 'UNI_MANUAL'
    end
    object QMCompuestoUNI_TOTAL: TFloatField
      DisplayLabel = 'Unid. Total'
      FieldName = 'UNI_TOTAL'
    end
    object QMCompuestoPRIORIDAD: TIntegerField
      DisplayLabel = 'Prioridad'
      FieldName = 'PRIORIDAD'
    end
    object QMCompuestoMERMA: TFloatField
      DisplayLabel = 'Merma'
      FieldName = 'MERMA'
    end
    object QMCompuestoUNI_PRODUC: TFloatField
      DisplayLabel = 'Unid. Prod.'
      FieldName = 'UNI_PRODUC'
    end
    object QMCompuestoUNI_PENDIENTES: TFloatField
      DisplayLabel = 'Unid. Pend.'
      FieldName = 'UNI_PENDIENTES'
    end
    object QMCompuestoFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fecha Entrega'
      FieldName = 'FECHA_ENTREGA'
    end
    object QMCompuestoFECHA_INI: TDateTimeField
      DisplayLabel = 'Fecha Ini.'
      FieldName = 'FECHA_INI'
    end
    object QMCompuestoFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fecha Fin.'
      FieldName = 'FECHA_FIN'
    end
    object QMCompuestoCOSTE_FIJO_PRE: TFloatField
      DisplayLabel = 'Coste Fijo Pre.'
      FieldName = 'COSTE_FIJO_PRE'
    end
    object QMCompuestoCOSTE_VAR_PRE: TFloatField
      DisplayLabel = 'Coste Var. Pre.'
      FieldName = 'COSTE_VAR_PRE'
    end
    object QMCompuestoCOSTE_MAT_PRE: TFloatField
      DisplayLabel = 'Coste Mat. Pre.'
      FieldName = 'COSTE_MAT_PRE'
    end
    object QMCompuestoCOSTE_MO_PRE: TFloatField
      DisplayLabel = 'Coste Mo. Pre.'
      FieldName = 'COSTE_MO_PRE'
    end
    object QMCompuestoCOSTE_MAQ_PRE: TFloatField
      DisplayLabel = 'Coste Maq. Pre.'
      FieldName = 'COSTE_MAQ_PRE'
    end
    object QMCompuestoCOSTE_TEX_PRE: TFloatField
      DisplayLabel = 'Coste Tex. Pre'
      FieldName = 'COSTE_TEX_PRE'
    end
    object QMCompuestoCOSTE_TOT_PRE: TFloatField
      DisplayLabel = 'Coste Tot. Pre.'
      FieldName = 'COSTE_TOT_PRE'
    end
    object QMCompuestoCOSTE_FIJO_REAL: TFloatField
      DisplayLabel = 'Coste Fijo Real'
      FieldName = 'COSTE_FIJO_REAL'
    end
    object QMCompuestoCOSTE_VAR_REAL: TFloatField
      DisplayLabel = 'Coste Var Real'
      FieldName = 'COSTE_VAR_REAL'
    end
    object QMCompuestoCOSTE_MAT_REAL: TFloatField
      DisplayLabel = 'Coste Mat. Real'
      FieldName = 'COSTE_MAT_REAL'
    end
    object QMCompuestoCOSTE_MO_REAL: TFloatField
      DisplayLabel = 'Coste MO Real.'
      FieldName = 'COSTE_MO_REAL'
    end
    object QMCompuestoCOSTE_MAQ_REAL: TFloatField
      DisplayLabel = 'Coste Maq. Real'
      FieldName = 'COSTE_MAQ_REAL'
    end
    object QMCompuestoCOSTE_TEX_REAL: TFloatField
      DisplayLabel = 'Coste Tex. Real'
      FieldName = 'COSTE_TEX_REAL'
    end
    object QMCompuestoCOSTE_TOT_REAL: TFloatField
      DisplayLabel = 'Coste Tot. Real'
      FieldName = 'COSTE_TOT_REAL'
    end
    object QMCompuestoCOSTE_UNITARIO: TFloatField
      DisplayLabel = 'Coste Unitario'
      FieldName = 'COSTE_UNITARIO'
    end
    object QMCompuestoPRECIO_VENTA: TFloatField
      DisplayLabel = 'Prec. Venta'
      FieldName = 'PRECIO_VENTA'
    end
    object QMCompuestoHORAS_TOTALES: TFloatField
      DisplayLabel = 'Horas Totales'
      FieldName = 'HORAS_TOTALES'
    end
    object QMCompuestoMARGEN_UNI: TFloatField
      DisplayLabel = 'Margen Unit.'
      FieldName = 'MARGEN_UNI'
    end
    object QMCompuestoMARGEN_TOTAL: TFloatField
      DisplayLabel = 'MArgen Total'
      FieldName = 'MARGEN_TOTAL'
    end
    object QMCompuestoOBSERVACIONES: TMemoField
      DisplayLabel = 'Obs.'
      FieldName = 'OBSERVACIONES'
      BlobType = ftMemo
      Size = 8
    end
    object QMCompuestoVISTOBUENO1: TIntegerField
      DisplayLabel = 'Visto Bueno 1'
      FieldName = 'VISTOBUENO1'
    end
    object QMCompuestoVISTOBUENO2: TIntegerField
      DisplayLabel = 'Visto Bueno 2'
      FieldName = 'VISTOBUENO2'
    end
    object QMCompuestoVISTOBUENO3: TIntegerField
      DisplayLabel = 'Visto Bueno 3'
      FieldName = 'VISTOBUENO3'
    end
    object QMCompuestoSITUACION: TIntegerField
      DisplayLabel = 'Situacion'
      FieldName = 'SITUACION'
    end
    object QMCompuestoMARGEN_UNI_CIEN: TFloatField
      DisplayLabel = 'Margen Unit. Cien'
      FieldName = 'MARGEN_UNI_CIEN'
    end
    object QMCompuestoENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMCompuestoID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMCompuestoTIPO_LANZAMIENTO: TIntegerField
      DisplayLabel = 'Tipo Lan.'
      FieldName = 'TIPO_LANZAMIENTO'
    end
    object QMCompuestoID_ORDEN_MAT: TIntegerField
      DisplayLabel = 'ID Orden Mat.'
      FieldName = 'ID_ORDEN_MAT'
    end
    object QMCompuestoTIPO_RESERVA: TIntegerField
      DisplayLabel = 'Tipo Reserva'
      FieldName = 'TIPO_RESERVA'
    end
    object QMCompuestoID_MOV_STOCK: TIntegerField
      DisplayLabel = 'ID Mov. Stock'
      FieldName = 'ID_MOV_STOCK'
    end
    object QMCompuestoISO_APROBADO: TIntegerField
      DisplayLabel = 'ISO Aprobado'
      FieldName = 'ISO_APROBADO'
    end
    object QMCompuestoISO_VERIFICADO: TIntegerField
      DisplayLabel = 'Iso Verificado'
      FieldName = 'ISO_VERIFICADO'
    end
    object QMCompuestoISO_VALIDADO: TIntegerField
      DisplayLabel = 'ISO Validado'
      FieldName = 'ISO_VALIDADO'
    end
    object QMCompuestoID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMCompuestoPADRE_SUBORDEN: TIntegerField
      DisplayLabel = 'Padre Suborden'
      FieldName = 'PADRE_SUBORDEN'
    end
    object QMCompuestoCONT_SUBORDEN: TIntegerField
      DisplayLabel = 'Cont. Suborden'
      FieldName = 'CONT_SUBORDEN'
    end
    object QMCompuestoREFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCIA'
      Size = 40
    end
    object QMCompuestoCOSTE_COMPRAS: TFloatField
      DisplayLabel = 'Coste Compras'
      FieldName = 'COSTE_COMPRAS'
    end
    object QMCompuestoHORAS_OPERARIO: TFloatField
      DisplayLabel = 'Horas Oper.'
      FieldName = 'HORAS_OPERARIO'
    end
    object QMCompuestoHORAS_MAQUINA: TFloatField
      DisplayLabel = 'Horas Maq.'
      FieldName = 'HORAS_MAQUINA'
    end
    object QMCompuestoID_DESPIECE: TIntegerField
      DisplayLabel = 'ID Despiece'
      FieldName = 'ID_DESPIECE'
    end
    object QMCompuestoID_ORDEN_SUBORDEN: TIntegerField
      DisplayLabel = 'ID Suborden'
      FieldName = 'ID_ORDEN_SUBORDEN'
    end
    object QMCompuestoSELECCIONADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'SELECCIONADA'
    end
    object QMCompuestoPREVALECE_ALM_ORDEN: TIntegerField
      DisplayLabel = 'Prevalece Alm. Ord.'
      FieldName = 'PREVALECE_ALM_ORDEN'
    end
    object QMCompuestoCERRAR_SUBORDENES: TIntegerField
      DisplayLabel = 'Cerrar SubOrd.'
      FieldName = 'CERRAR_SUBORDENES'
    end
    object QMCompuestoIMPORTAR_OP: TIntegerField
      DisplayLabel = 'Importar OP'
      FieldName = 'IMPORTAR_OP'
    end
    object QMCompuestoCASO_OP: TIntegerField
      DisplayLabel = 'Caso OP'
      FieldName = 'CASO_OP'
    end
    object QMCompuestoRESERVA_STOCK_OP: TIntegerField
      DisplayLabel = 'Reserva Stock OP'
      FieldName = 'RESERVA_STOCK_OP'
    end
    object QMCompuestoMEDIDA_1: TFloatField
      DisplayLabel = 'Medida 1'
      FieldName = 'MEDIDA_1'
    end
    object QMCompuestoMEDIDA_2: TFloatField
      DisplayLabel = 'Medida 2'
      FieldName = 'MEDIDA_2'
    end
    object QMCompuestoMEDIDA_3: TFloatField
      DisplayLabel = 'Medida 3'
      FieldName = 'MEDIDA_3'
    end
    object QMCompuestoMEDIDA_4: TFloatField
      DisplayLabel = 'Medida 4'
      FieldName = 'MEDIDA_4'
    end
    object QMCompuestoDESACTIVA_TRIGGER: TIntegerField
      DisplayLabel = 'Desact. Trigger'
      FieldName = 'DESACTIVA_TRIGGER'
    end
    object QMCompuestoRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
    object QMCompuestoDIF_COSTE_FIJO: TFloatField
      DisplayLabel = 'Dif. Coste Fijo'
      FieldName = 'DIF_COSTE_FIJO'
    end
    object QMCompuestoDIF_COSTE_MAT: TFloatField
      DisplayLabel = 'Dif. Coste Mat.'
      FieldName = 'DIF_COSTE_MAT'
    end
    object QMCompuestoDIF_COSTE_MO: TFloatField
      DisplayLabel = 'Dif. Coste MO'
      FieldName = 'DIF_COSTE_MO'
    end
    object QMCompuestoDIF_COSTE_MAQ: TFloatField
      DisplayLabel = 'Dif. Coste Maq.'
      FieldName = 'DIF_COSTE_MAQ'
    end
    object QMCompuestoDIF_COSTE_TEXT: TFloatField
      DisplayLabel = 'Dif. Coste Text'
      FieldName = 'DIF_COSTE_TEXT'
    end
    object QMCompuestoDIF_COSTE_VAR: TFloatField
      DisplayLabel = 'Dif. Coste Var'
      FieldName = 'DIF_COSTE_VAR'
    end
    object QMCompuestoCOSTE_COMPRAS_PRE: TFloatField
      DisplayLabel = 'Coste Compras Pre.'
      FieldName = 'COSTE_COMPRAS_PRE'
    end
    object QMCompuestoDIF_COSTE_COMPRAS: TFloatField
      DisplayLabel = 'Dif. Coste Compras'
      FieldName = 'DIF_COSTE_COMPRAS'
    end
    object QMCompuestoDIF_COSTE_TOTAL: TFloatField
      DisplayLabel = 'Dif. Coste Total'
      FieldName = 'DIF_COSTE_TOTAL'
    end
    object QMCompuestoCOMPUESTOS_VIRTUALES: TIntegerField
      DisplayLabel = 'Comp. Virtuales'
      FieldName = 'COMPUESTOS_VIRTUALES'
    end
    object QMCompuestoSEGUIR_SIN_STOCK: TIntegerField
      DisplayLabel = 'Seguir Sin Stock'
      FieldName = 'SEGUIR_SIN_STOCK'
    end
    object QMCompuestoMARGEN_TOTAL_PRE: TFloatField
      DisplayLabel = 'Margen Total Pre.'
      FieldName = 'MARGEN_TOTAL_PRE'
    end
    object QMCompuestoMARGEN_UNI_CIEN_PRE: TFloatField
      DisplayLabel = 'Margen Unit.Cien Pre.'
      FieldName = 'MARGEN_UNI_CIEN_PRE'
    end
    object QMCompuestoCOSTE_UNITARIO_PRE: TFloatField
      DisplayLabel = 'Coste Unit. Pre.'
      FieldName = 'COSTE_UNITARIO_PRE'
    end
    object QMCompuestoMARGEN_UNI_PRE: TFloatField
      DisplayLabel = 'Margen Unit. Pre.'
      FieldName = 'MARGEN_UNI_PRE'
    end
    object QMCompuestoPRECIO_VENTA_PRE: TFloatField
      DisplayLabel = 'Precio Venta Pre'
      FieldName = 'PRECIO_VENTA_PRE'
    end
    object QMCompuestoPRECIO_VENTA_TOT_PRE: TFloatField
      DisplayLabel = 'Precio Venta Tot. Pre.'
      FieldName = 'PRECIO_VENTA_TOT_PRE'
    end
    object QMCompuestoPRECIO_VENTA_TOT_REAL: TFloatField
      DisplayLabel = 'Precio Venta Tot. Real'
      FieldName = 'PRECIO_VENTA_TOT_REAL'
    end
    object QMCompuestoDIF_COSTE_MARGEN_TOTAL: TFloatField
      DisplayLabel = 'Dif Coste Marg. Total'
      FieldName = 'DIF_COSTE_MARGEN_TOTAL'
    end
    object QMCompuestoDIF_MARGEN_TOTAL: TFloatField
      DisplayLabel = 'Dif Margen total'
      FieldName = 'DIF_MARGEN_TOTAL'
    end
    object QMCompuestoDIF_MARGEN_UNI_CIEN: TFloatField
      DisplayLabel = 'Dif Margen Unit. Cien'
      FieldName = 'DIF_MARGEN_UNI_CIEN'
    end
    object QMCompuestoDIF_PRECIO_VENTA_UNI: TFloatField
      DisplayLabel = 'Dif. Precio Venta Unit'
      FieldName = 'DIF_PRECIO_VENTA_UNI'
    end
    object QMCompuestoDIF_COSTE_UNI: TFloatField
      DisplayLabel = 'Dif. Coste Unit.'
      FieldName = 'DIF_COSTE_UNI'
    end
    object QMCompuestoDIF_MARGEN_UNI: TFloatField
      DisplayLabel = 'Dif. Margen Unit.'
      FieldName = 'DIF_MARGEN_UNI'
    end
    object QMCompuestoDIF_PRECIO_VENTA_TOT: TFloatField
      DisplayLabel = 'Dif. Precio Venta Tot.'
      FieldName = 'DIF_PRECIO_VENTA_TOT'
    end
    object QMCompuestoHORAS_OPERARIO_PRE: TFloatField
      DisplayLabel = 'Horas Operario Pre.'
      FieldName = 'HORAS_OPERARIO_PRE'
    end
    object QMCompuestoHORAS_MAQUINA_PRE: TFloatField
      DisplayLabel = 'Horas Maquina Pre'
      FieldName = 'HORAS_MAQUINA_PRE'
    end
    object QMCompuestoDIF_HORAS_MAQUINA: TFloatField
      DisplayLabel = 'Dif. Horas Maq.'
      FieldName = 'DIF_HORAS_MAQUINA'
    end
    object QMCompuestoDIF_HORAS_OPERARIO: TFloatField
      DisplayLabel = 'Dif. Horas Oper.'
      FieldName = 'DIF_HORAS_OPERARIO'
    end
    object QMCompuestoRECUPERADO_MARCAJE: TIntegerField
      DisplayLabel = 'Recup. Marcaje'
      FieldName = 'RECUPERADO_MARCAJE'
    end
    object QMCompuestoUNI_FABRICADAS: TFloatField
      DisplayLabel = 'Unid. Fabricadas'
      FieldName = 'UNI_FABRICADAS'
    end
    object QMCompuestoPLANIFICACION: TIntegerField
      DisplayLabel = 'Planif.'
      FieldName = 'PLANIFICACION'
    end
    object QMCompuestoLINEA_PLANIFICACION: TIntegerField
      DisplayLabel = 'Linea Planif.'
      FieldName = 'LINEA_PLANIFICACION'
    end
    object QMCompuestoID_PLANIFICACION: TIntegerField
      DisplayLabel = 'ID Planif.'
      FieldName = 'ID_PLANIFICACION'
    end
    object QMCompuestoID_PLANIFICACION_DET: TIntegerField
      DisplayLabel = 'ID Planif. Det.'
      FieldName = 'ID_PLANIFICACION_DET'
    end
    object QMCompuestoID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMCompuestoID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic.'
      FieldName = 'ID_UBICACION'
      OnChange = QMCompuestoID_UBICACIONChange
    end
    object QMCompuestoTITULO_LOTES: TStringField
      DisplayLabel = 'Descrip. Lote'
      FieldKind = fkCalculated
      FieldName = 'Titulo_Lotes'
      OnGetText = QMCompuestoTITULO_LOTESGetText
      Calculated = True
    end
    object QMCompuestoTitulo_Ubicacion: TStringField
      DisplayLabel = 'Descrip. Ubicacion'
      FieldKind = fkCalculated
      FieldName = 'Titulo_Ubicacion'
      OnGetText = QMCompuestoTitulo_UbicacionGetText
      Calculated = True
    end
    object QMCompuestoSERIALIZADO: TIntegerField
      DisplayLabel = 'Serializado'
      FieldName = 'SERIALIZADO'
    end
    object QMCompuestoSERIALIZADO_KRI: TIntegerField
      DisplayLabel = 'Serializado'
      FieldName = 'SERIALIZADO_KRI'
    end
    object QMCompuestoUBICABLE: TIntegerField
      DisplayLabel = 'Ubicable'
      FieldName = 'UBICABLE'
    end
    object QMCompuestoID_MOV_STOCK_RESERVA: TIntegerField
      DisplayLabel = 'ID Mov. Stock Reserva'
      FieldName = 'ID_MOV_STOCK_RESERVA'
    end
    object QMCompuestoDESC_LOTE: TFIBStringField
      DisplayLabel = 'Descrip. Lote'
      FieldName = 'DESC_LOTE'
    end
    object QMCompuestoLOTES: TIntegerField
      DisplayLabel = 'Ctrol. Lote'
      FieldName = 'LOTES'
    end
    object QMCompuestoUNIDADES_RES: TFloatField
      DisplayLabel = 'Uds. Reservar'
      FieldName = 'UNIDADES_RES'
    end
    object QMCompuestoLINEA_RES: TIntegerField
      DisplayLabel = 'Linea Res.'
      FieldName = 'LINEA_RES'
    end
    object QMCompuestoCANT_RESERVAS: TIntegerField
      DisplayLabel = 'Cant. Reservas'
      FieldName = 'CANT_RESERVAS'
    end
    object QMCompuestoUNIDADES_RESERVAS: TFloatField
      DisplayLabel = 'Unidades Reservadas'
      FieldName = 'UNIDADES_RESERVAS'
    end
    object QMCompuestoID_RESERVA: TIntegerField
      FieldName = 'ID_RESERVA'
    end
    object QMCompuestoID_LOTE_RESERVA: TIntegerField
      DisplayLabel = 'Id Lote'
      FieldName = 'ID_LOTE_RESERVA'
      OnChange = QMCompuestoID_LOTE_RESERVAChange
    end
    object QMCompuestoUNIDADES_PENDIENTES_RESERVAR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'UNIDADES_PENDIENTES_RESERVAR'
      Calculated = True
    end
    object QMCompuestoNOTAS: TBlobField
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMCompuestoCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificaci'#243'n'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object QMCompuestoFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMCompuestoFECHA: TDateTimeField
      DisplayLabel = 'Fec. Reserva'
      FieldName = 'FECHA'
    end
    object QMCompuestoLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMCompuestoCANT_LOTE: TIntegerField
      DisplayLabel = 'Cant. Lote'
      FieldName = 'CANT_LOTE'
    end
  end
  object DSQMCompuesto: TDataSource
    DataSet = QMCompuesto
    Left = 176
    Top = 56
  end
  object QMSerieComponente: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'select * from pro_serializacion_orden'
      
        'where id_orden=?id_orden and linea=?linea and componente=?compon' +
        'ente and tipo=2'
      'order by componente,linea')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_SERIALIZACION_ORDEN'
      'WHERE'
      'ID_ORDEN = :ID_ORDEN AND'
      'TIPO = 2'
      'ORDER BY COMPONENTE, LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_SERIALIZACION_ORDEN'
      'SET'
      'COD_SERIALIZACION = :COD_SERIALIZACION'
      'WHERE'
      'ID_ORDEN = :ID_ORDEN AND'
      'LINEA = :LINEA AND'
      'COMPONENTE = :COMPONENTE AND'
      'TIPO = 2')
    DataSource = ProDMOrden.DSQMProOrd
    AfterPost = Graba
    Left = 56
    Top = 104
    object QMSerieComponenteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMSerieComponenteEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMSerieComponenteCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMSerieComponenteRIG_OF: TIntegerField
      DisplayLabel = 'RIG O.F.'
      FieldName = 'RIG_OF'
    end
    object QMSerieComponenteID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMSerieComponenteLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMSerieComponenteCOMPONENTE: TFIBStringField
      DisplayLabel = 'Componente'
      FieldName = 'COMPONENTE'
      Size = 15
    end
    object QMSerieComponenteCOD_SERIALIZACION: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'COD_SERIALIZACION'
      Size = 25
    end
    object QMSerieComponenteTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMSerieComponenteALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMSerieComponenteSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
  end
  object QMSerieCompuesto: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'select * from pro_serializacion_orden'
      
        'where id_orden=?id_orden and linea=?linea and componente=?compon' +
        'ente '
      'and tipo=1'
      'order by componente,linea')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_SERIALIZACION_ORDEN'
      'WHERE'
      'ID_ORDEN = :ID_ORDEN AND'
      'TIPO = 1'
      'ORDER BY COMPONENTE, LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_SERIALIZACION_ORDEN'
      'SET'
      'COD_SERIALIZACION = :COD_SERIALIZACION'
      'WHERE'
      'ID_ORDEN = :ID_ORDEN AND'
      'LINEA = :LINEA AND'
      'COMPONENTE = :COMPONENTE AND'
      'TIPO = 1')
    DataSource = ProDMOrden.DSQMProOrd
    AfterPost = Graba
    Left = 56
    Top = 152
    object QMSerieCompuestoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMSerieCompuestoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMSerieCompuestoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMSerieCompuestoRIG_OF: TIntegerField
      DisplayLabel = 'RIG O.F.'
      FieldName = 'RIG_OF'
    end
    object QMSerieCompuestoID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMSerieCompuestoLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMSerieCompuestoCOMPONENTE: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPONENTE'
      Size = 15
    end
    object QMSerieCompuestoCOD_SERIALIZACION: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'COD_SERIALIZACION'
      Size = 25
    end
    object QMSerieCompuestoTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMSerieCompuestoALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMSerieCompuestoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMSerieCompuestoCODIGO_SERIE: TIntegerField
      DisplayLabel = 'Cod. Serie'
      FieldName = 'CODIGO_SERIE'
    end
  end
  object DSSerieComponente: TDataSource
    DataSet = QMSerieComponente
    Left = 176
    Top = 104
  end
  object DSSerieCompuesto: TDataSource
    DataSet = QMSerieCompuesto
    Left = 176
    Top = 152
  end
  object QMReserva: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT ID_RESERVA, ESTADO, NOTAS FROM PRO_ORD_RESERVA '
      'WHERE ID_RESERVA = :ID_RESERVA')
    SelectSQL.Strings = (
      'SELECT ID_RESERVA, ESTADO, NOTAS FROM PRO_ORD_RESERVA '
      'WHERE ID_RESERVA = :ID_RESERVA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_RESERVA '
      'SET NOTAS = :NOTAS'
      'WHERE ID_RESERVA = :ID_RESERVA')
    DataSource = DSQMCompuesto
    AfterPost = Graba
    Left = 56
    Top = 200
    object QMReservaID_RESERVA: TIntegerField
      FieldName = 'ID_RESERVA'
    end
    object QMReservaNOTAS: TBlobField
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMReservaESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
  end
  object DSReserva: TDataSource
    DataSet = QMReserva
    Left = 176
    Top = 200
  end
end
