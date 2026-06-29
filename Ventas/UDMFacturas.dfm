object DMFacturas: TDMFacturas
  OldCreateOrder = False
  OnCreate = DMDocsFacturaCreate
  OnDestroy = DMFacturasDestroy
  Left = 220
  Top = 139
  Height = 667
  Width = 847
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_DETALLE_FACTURA'
      'WHERE'
      '  ID_DETALLES_S=?old_ID_DETALLES_S ')
    InsertSQL.Strings = (
      'INSERT INTO VER_DETALLE_FACTURA'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,CLIENTE,ALMACE' +
        'N,ARTICULO,TITULO,'#13#10'UNIDADES,PRECIO,PIEZAS_X_BULTO,BULTOS,DESCUE' +
        'NTO,DESCUENTO_2,DESCUENTO_3,COMISION,P_COSTE,M_MOV_STOCK,'#13#10'TIPO_' +
        'IVA,TIPO_IVA_ART,P_IVA,P_RECARGO,BRUTO,B_COMISION,I_DESCUENTO,B_' +
        'IMPONIBLE,I_COMISION,'#13#10'ENTRADA,NOTAS,NOTAS2,UNIDADES_EXT,NSERIE,' +
        'UNIDADES_SEC,CENTRO_COSTE,ID_DETALLES_S,ID_S,ID_A,ID_C_A,COMISIO' +
        'N_LINEAL,I_COMISION_LINEAL,FECHA_PRE_DET,'#13#10'FECHA_REC_DET,TITULO_' +
        'IDIOMA,TIPO_LINEA_KRI,ORDEN,TIPO_LINEA,PROC_PROMOCION,ORIGEN,ID_' +
        'P,FECHA_ANTICIPO,CTA_PAGO_ANTICIPO,'#13#10'APLICA_UNIDADES_SECUNDARIAS' +
        ',PROYECTO,LINEA_RELACION,CERTIFICADO,CERT_NEGATIVO,CRC_NOTAS,CRC' +
        '_NOTAS2,PRO_NUM_PLANO,NO_FABRICACION_KRI,TIPO_UNIDAD_LOGISTICA,'#13 +
        #10'TITULO_UNIDAD_LOGISTICA,U_POR_U_LOGISTICA,RELACIONAR_U_LOGISTIC' +
        'A,UNIDADES_LOGISTICAS,CUENTA,LOTE_SIMPLE,DIRECCION_ENTREGA,PAIS,' +
        'COSTE_ADICIONAL,ID_IMAGEN,'#13#10'MANIPULACION,ALFA_1,ALFA_2,ALFA_3,AL' +
        'FA_4,ALFA_5,ALFA_6,ALFA_7,'#13#10'ALFA_8,INVERSION_SUJETO_PASIVO,DECIM' +
        'ALES_UNIDADES,SIGNO_UNIDADES,TIPO_IMPUESTO_ADICIONAL,P_IMPUESTO_' +
        'ADICIONAL,LOTEABLE,PESO,PESO_TOTAL,PESO_REAL,UNIDAD_FOMENTO,ECOT' +
        'ASA,REQUIERE_LOTE_SIMPLE,CONTROL_STOCK,UE_UNIDADES,UE_MEDIDA1,UE' +
        '_MEDIDA2,'#13#10'UE_MEDIDA3,UE_MEDIDA4)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?CLIENT' +
        'E,?ALMACEN,?ARTICULO,?TITULO,'#13#10'?UNIDADES,?PRECIO,?PIEZAS_X_BULTO' +
        ',?BULTOS,?DESCUENTO,?DESCUENTO_2,?DESCUENTO_3,?COMISION,?P_COSTE' +
        ',?M_MOV_STOCK,'#13#10'?TIPO_IVA,?TIPO_IVA_ART,?P_IVA,?P_RECARGO,?BRUTO' +
        ',?B_COMISION,?I_DESCUENTO,?B_IMPONIBLE,?I_COMISION,'#13#10'?ENTRADA,?N' +
        'OTAS,?NOTAS2,?UNIDADES_EXT,?NSERIE,?UNIDADES_SEC,?CENTRO_COSTE,?' +
        'ID_DETALLES_S,?ID_S,?ID_A,?ID_C_A,?COMISION_LINEAL,?I_COMISION_L' +
        'INEAL,?FECHA_PRE_DET,'#13#10'?FECHA_REC_DET,?TITULO_IDIOMA,?TIPO_LINEA' +
        '_KRI,?ORDEN,?TIPO_LINEA,?PROC_PROMOCION,?ORIGEN,?ID_P,?FECHA_ANT' +
        'ICIPO,?CTA_PAGO_ANTICIPO,'#13#10'?APLICA_UNIDADES_SECUNDARIAS,?PROYECT' +
        'O,?LINEA_RELACION,?CERTIFICADO,?CERT_NEGATIVO,?CRC_NOTAS,?CRC_NO' +
        'TAS2,?PRO_NUM_PLANO,?NO_FABRICACION_KRI,?TIPO_UNIDAD_LOGISTICA,'#13 +
        #10'?TITULO_UNIDAD_LOGISTICA,?U_POR_U_LOGISTICA,?RELACIONAR_U_LOGIS' +
        'TICA,?UNIDADES_LOGISTICAS,?CUENTA,?LOTE_SIMPLE,?DIRECCION_ENTREG' +
        'A,?PAIS,?COSTE_ADICIONAL,?ID_IMAGEN,'#13#10'?MANIPULACION,?ALFA_1,?ALF' +
        'A_2,?ALFA_3,?ALFA_4,?ALFA_5,?ALFA_6,?ALFA_7,'#13#10'?ALFA_8,?INVERSION' +
        '_SUJETO_PASIVO,?DECIMALES_UNIDADES,?SIGNO_UNIDADES,?TIPO_IMPUEST' +
        'O_ADICIONAL,?P_IMPUESTO_ADICIONAL,?LOTEABLE,?PESO,?PESO_TOTAL,?P' +
        'ESO_REAL,?UNIDAD_FOMENTO,?ECOTASA,?REQUIERE_LOTE_SIMPLE,?CONTROL' +
        '_STOCK,?UE_UNIDADES,?UE_MEDIDA1,?UE_MEDIDA2,'#13#10'?UE_MEDIDA3,?UE_ME' +
        'DIDA4)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DETALLE_FACTURA'
      'WHERE'
      '  ID_DETALLES_S=?ID_DETALLES_S ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_FACTURA'
      'WHERE'
      'ID_S = ?ID_S AND '
      'CERTIFICADO = 0 AND '
      'CERT_NEGATIVO =  0'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLE_FACTURA'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,TIPO=?TIPO '
      '  ,RIG=?RIG '
      '  ,LINEA=?LINEA '
      '  ,CLIENTE=?CLIENTE '
      '  ,ALMACEN=?ALMACEN '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO=?TITULO '
      '  ,UNIDADES=?UNIDADES '
      '  ,PRECIO=?PRECIO '
      '  ,PIEZAS_X_BULTO=?PIEZAS_X_BULTO '
      '  ,BULTOS=?BULTOS '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,DESCUENTO_2=?DESCUENTO_2 '
      '  ,DESCUENTO_3=?DESCUENTO_3 '
      '  ,COMISION=?COMISION '
      '  ,P_COSTE=?P_COSTE '
      '  ,M_MOV_STOCK=?M_MOV_STOCK '
      '  ,TIPO_IVA=?TIPO_IVA '
      '  ,TIPO_IVA_ART=?TIPO_IVA_ART '
      '  ,P_IVA=?P_IVA '
      '  ,P_RECARGO=?P_RECARGO '
      '  ,BRUTO=?BRUTO '
      '  ,B_COMISION=?B_COMISION '
      '  ,I_DESCUENTO=?I_DESCUENTO '
      '  ,B_IMPONIBLE=?B_IMPONIBLE '
      '  ,I_COMISION=?I_COMISION '
      '  ,ENTRADA=?ENTRADA '
      '  ,NOTAS=?NOTAS '
      '  ,NOTAS2=?NOTAS2 '
      '  ,UNIDADES_EXT=?UNIDADES_EXT '
      '  ,NSERIE=?NSERIE '
      '  ,UNIDADES_SEC=?UNIDADES_SEC '
      '  ,CENTRO_COSTE=?CENTRO_COSTE '
      '  ,ID_S=?ID_S '
      '  ,ID_A=?ID_A '
      '  ,ID_C_A=?ID_C_A '
      '  ,COMISION_LINEAL=?COMISION_LINEAL '
      '  ,I_COMISION_LINEAL=?I_COMISION_LINEAL '
      '  ,FECHA_PRE_DET=?FECHA_PRE_DET '
      '  ,FECHA_REC_DET=?FECHA_REC_DET '
      '  ,TITULO_IDIOMA=?TITULO_IDIOMA '
      '  ,TIPO_LINEA_KRI=?TIPO_LINEA_KRI '
      '  ,ORDEN=?ORDEN '
      '  ,TIPO_LINEA=?TIPO_LINEA '
      '  ,PROC_PROMOCION=?PROC_PROMOCION '
      '  ,ORIGEN=?ORIGEN '
      '  ,ID_P=?ID_P '
      '  ,FECHA_ANTICIPO=?FECHA_ANTICIPO '
      '  ,CTA_PAGO_ANTICIPO=?CTA_PAGO_ANTICIPO '
      '  ,APLICA_UNIDADES_SECUNDARIAS=?APLICA_UNIDADES_SECUNDARIAS '
      '  ,PROYECTO=?PROYECTO '
      '  ,LINEA_RELACION=?LINEA_RELACION '
      '  ,CERTIFICADO=?CERTIFICADO '
      '  ,CERT_NEGATIVO=?CERT_NEGATIVO '
      '  ,CRC_NOTAS=?CRC_NOTAS '
      '  ,CRC_NOTAS2=?CRC_NOTAS2 '
      '  ,PRO_NUM_PLANO=?PRO_NUM_PLANO '
      '  ,NO_FABRICACION_KRI=?NO_FABRICACION_KRI '
      '  ,TIPO_UNIDAD_LOGISTICA=?TIPO_UNIDAD_LOGISTICA '
      '  ,TITULO_UNIDAD_LOGISTICA=?TITULO_UNIDAD_LOGISTICA '
      '  ,U_POR_U_LOGISTICA=?U_POR_U_LOGISTICA '
      '  ,RELACIONAR_U_LOGISTICA=?RELACIONAR_U_LOGISTICA '
      '  ,UNIDADES_LOGISTICAS=?UNIDADES_LOGISTICAS '
      '  ,CUENTA=?CUENTA '
      '  ,LOTE_SIMPLE=?LOTE_SIMPLE '
      '  ,DIRECCION_ENTREGA=?DIRECCION_ENTREGA '
      '  ,PAIS=?PAIS '
      '  ,COSTE_ADICIONAL=?COSTE_ADICIONAL '
      '  ,ID_IMAGEN=?ID_IMAGEN '
      '  ,MANIPULACION=?MANIPULACION '
      '  ,ALFA_1=?ALFA_1 '
      '  ,ALFA_2=?ALFA_2 '
      '  ,ALFA_3=?ALFA_3 '
      '  ,ALFA_4=?ALFA_4 '
      '  ,ALFA_5=?ALFA_5 '
      '  ,ALFA_6=?ALFA_6 '
      '  ,ALFA_7=?ALFA_7 '
      '  ,ALFA_8=?ALFA_8 '
      '  ,INVERSION_SUJETO_PASIVO=?INVERSION_SUJETO_PASIVO '
      '  ,DECIMALES_UNIDADES=?DECIMALES_UNIDADES '
      '  ,SIGNO_UNIDADES=?SIGNO_UNIDADES '
      '  ,TIPO_IMPUESTO_ADICIONAL=?TIPO_IMPUESTO_ADICIONAL '
      '  ,P_IMPUESTO_ADICIONAL=?P_IMPUESTO_ADICIONAL '
      '  ,LOTEABLE=?LOTEABLE '
      '  ,PESO=?PESO '
      '  ,PESO_TOTAL=?PESO_TOTAL '
      '  ,PESO_REAL=?PESO_REAL '
      '  ,UNIDAD_FOMENTO=?UNIDAD_FOMENTO '
      '  ,ECOTASA=?ECOTASA '
      '  ,REQUIERE_LOTE_SIMPLE=?REQUIERE_LOTE_SIMPLE '
      '  ,CONTROL_STOCK=?CONTROL_STOCK '
      '  ,UE_UNIDADES=?UE_UNIDADES '
      '  ,UE_MEDIDA1=?UE_MEDIDA1 '
      '  ,UE_MEDIDA2=?UE_MEDIDA2 '
      '  ,UE_MEDIDA3=?UE_MEDIDA3 '
      '  ,UE_MEDIDA4=?UE_MEDIDA4 '
      'WHERE'
      '  ID_DETALLES_S=?ID_DETALLES_S ')
    DataSource = DSQMCabecera
    Plan.Strings = (
      
        'PLAN JOIN (VER_DETALLE_FACTURA DET INDEX (GES_DETALLES_S_CAB_ID)' +
        ','
      
        '             VER_DETALLE_FACTURA FAC INDEX (GES_DETALLES_S_FAC_I' +
        'D)) ')
    AfterDelete = QMDetalleAfterDelete
    AfterOpen = QMDetalleAfterOpen
    AfterPost = QMDetalleAfterPost
    AfterScroll = QMDetalleAfterScroll
    BeforeClose = QMDetalleBeforeClose
    BeforeDelete = QMDetalleBeforeDelete
    BeforeEdit = AntesDeEditar
    BeforeInsert = QMDetalleBeforeInsert
    BeforePost = QMDetalleBeforePost
    BeforeScroll = QMDetalleBeforeScroll
    OnCalcFields = QMDetalleCalcFields
    OnNewRecord = QMDetalleNewRecord
    OnPostError = QMDetallePostError
    ClavesPrimarias.Strings = (
      'ID_DETALLES_S ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_DETALLE_FACTURA'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_DETALLES_S'
      'GES_DETALLES_S_FAC')
    CamposBloqueo.Strings = (
      'ID_DETALLES_S'
      'ID_DETALLES_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetalleSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetalleTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetalleRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      OnChange = QMDetalleALMACENChange
      Size = 3
    end
    object QMDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      DisplayWidth = 15
      FieldName = 'ARTICULO'
      OnChange = QMDetalleARTICULOChange
      EditMask = '>ccccccccccccccc;0;_'
      Size = 15
    end
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'Desc. Art'#237'culo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMDetalleUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
      OnChange = QMDetalleUNIDADESChange
      OnGetText = QMDetalleUNIDADESGetText
    end
    object QMDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
      OnChange = QMDetallePRECIOChange
    end
    object QMDetallePIEZAS_X_BULTO: TIntegerField
      DisplayLabel = 'Piezas x Bulto'
      FieldName = 'PIEZAS_X_BULTO'
    end
    object QMDetalleBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object QMDetalleDESCUENTO: TFloatField
      DisplayLabel = 'Desc.'
      FieldName = 'DESCUENTO'
    end
    object QMDetalleCOMISION: TFloatField
      DisplayLabel = 'Comision'
      FieldName = 'COMISION'
      OnChange = QMDetalleCOMISIONChange
    end
    object QMDetalleP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
      OnChange = QMDetalleP_COSTEChange
    end
    object QMDetalleM_MOV_STOCK: TIntegerField
      DisplayLabel = 'N. Mov. Stock'
      FieldName = 'M_MOV_STOCK'
    end
    object QMDetalleTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
      OnChange = QMDetalleTIPO_IVAChange
    end
    object QMDetalleP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object QMDetalleP_RECARGO: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_RECARGO'
    end
    object QMDetalleBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object QMDetalleB_COMISION: TFloatField
      DisplayLabel = 'B. Comision'
      FieldName = 'B_COMISION'
    end
    object QMDetalleI_DESCUENTO: TFloatField
      DisplayLabel = 'Imp. Desc.'
      FieldName = 'I_DESCUENTO'
    end
    object QMDetalleB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMDetalleB_DTO_LINEA: TFloatField
      DisplayLabel = 'B. Dto. Linea'
      FieldName = 'B_DTO_LINEA'
    end
    object QMDetalleI_COMISION: TFloatField
      DisplayLabel = 'Imp. Comision'
      FieldName = 'I_COMISION'
    end
    object QMDetalleC_IVA: TFloatField
      DisplayLabel = 'C. IVA'
      FieldName = 'C_IVA'
    end
    object QMDetalleC_RECARGO: TFloatField
      DisplayLabel = 'C. Rec.'
      FieldName = 'C_RECARGO'
    end
    object QMDetalleT_COSTE: TFloatField
      DisplayLabel = 'T. Coste'
      FieldName = 'T_COSTE'
    end
    object QMDetalleM_BRUTO: TFloatField
      DisplayLabel = 'M Bruto'
      FieldName = 'M_BRUTO'
    end
    object QMDetalleLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMDetalleENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMDetalleNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMDetalleUNIDADES_EXT: TFloatField
      DisplayLabel = 'Uds. Ext.'
      FieldName = 'UNIDADES_EXT'
      OnGetText = QMDetalleUNIDADES_EXTGetText
    end
    object QMDetalleDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object QMDetalleDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object QMDetalleUNIDADES_SEC: TFloatField
      DisplayLabel = 'Uds. Sec.'
      FieldName = 'UNIDADES_SEC'
      OnChange = QMDetalleUNIDADES_SECChange
    end
    object QMDetalleNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object QMDetalleID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det. S.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMDetalleID_S: TIntegerField
      DisplayLabel = 'ID S.'
      FieldName = 'ID_S'
    end
    object QMDetalleCENTRO_COSTE: TIntegerField
      DisplayLabel = 'Cent. Coste'
      FieldName = 'CENTRO_COSTE'
    end
    object QMDetalleID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetalleID_C_A: TIntegerField
      DisplayLabel = 'ID Art. C.'
      FieldName = 'ID_C_A'
    end
    object QMDetalleCOMISION_LINEAL: TFloatField
      DisplayLabel = 'Com. Lin.'
      FieldName = 'COMISION_LINEAL'
    end
    object QMDetalleI_COMISION_LINEAL: TFloatField
      DisplayLabel = 'Imp. Com. Lin.'
      FieldName = 'I_COMISION_LINEAL'
    end
    object QMDetalleFECHA_PRE_DET: TDateTimeField
      DisplayLabel = 'Fec. Prev.'
      FieldName = 'FECHA_PRE_DET'
    end
    object QMDetalleFECHA_REC_DET: TDateTimeField
      DisplayLabel = 'Fec. Recep.'
      FieldName = 'FECHA_REC_DET'
    end
    object QMDetalleTITULO_IDIOMA: TFIBStringField
      DisplayLabel = 'Titulo Idioma'
      FieldName = 'TITULO_IDIOMA'
      Size = 256
    end
    object QMDetalleORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMDetalleTIPO_LINEA: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_LINEA'
      Size = 3
    end
    object QMDetallePROC_PROMOCION: TIntegerField
      DisplayLabel = 'Proc. Prom.'
      FieldName = 'PROC_PROMOCION'
    end
    object QMDetalleORIGEN: TIntegerField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
    end
    object QMDetalleID_P: TIntegerField
      DisplayLabel = 'ID Prom.'
      FieldName = 'ID_P'
    end
    object QMDetalleFECHA_ANTICIPO: TDateTimeField
      DisplayLabel = 'Fec. Ant.'
      FieldName = 'FECHA_ANTICIPO'
    end
    object QMDetalleCTA_PAGO_ANTICIPO: TFIBStringField
      DisplayLabel = 'Cta. Pago. Ant.'
      FieldName = 'CTA_PAGO_ANTICIPO'
      Size = 15
    end
    object QMDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField
      DisplayLabel = 'Aplica Uds. Sec.'
      FieldName = 'APLICA_UNIDADES_SECUNDARIAS'
    end
    object QMDetallePROYECTO: TIntegerField
      DisplayLabel = 'Proy.'
      FieldName = 'PROYECTO'
    end
    object QMDetalleLINEA_RELACION: TIntegerField
      DisplayLabel = 'L.R.'
      FieldName = 'LINEA_RELACION'
    end
    object QMDetalleTIPO_LINEA_KRI: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_LINEA_KRI'
    end
    object QMDetallePRO_NUM_PLANO: TFIBStringField
      DisplayLabel = 'Num. Plano'
      FieldName = 'PRO_NUM_PLANO'
      Size = 35
    end
    object QMDetalleCRC_NOTAS: TFIBStringField
      DisplayLabel = 'CRC Notas'
      FieldName = 'CRC_NOTAS'
      Size = 15
    end
    object QMDetalleCRC_NOTAS2: TFIBStringField
      DisplayLabel = 'CRC Notas Int.'
      FieldName = 'CRC_NOTAS2'
      Size = 35
    end
    object QMDetalleNOTAS2: TBlobField
      DisplayLabel = 'Notas Int.'
      FieldName = 'NOTAS2'
      Size = 8
    end
    object QMDetalleTIPO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Tipo UL'
      FieldName = 'TIPO_UNIDAD_LOGISTICA'
      OnChange = QMDetalleTIPO_UNIDAD_LOGISTICAChange
      Size = 5
    end
    object QMDetalleTITULO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Titulo UL'
      FieldName = 'TITULO_UNIDAD_LOGISTICA'
      OnChange = QMDetalleTITULO_UNIDAD_LOGISTICAChange
      Size = 35
    end
    object QMDetalleUNIDADES_LOGISTICAS: TFloatField
      DisplayLabel = 'Uds. Log.'
      FieldName = 'UNIDADES_LOGISTICAS'
      OnChange = QMDetalleUNIDADES_LOGISTICASChange
    end
    object QMDetalleCERTIFICADO2: TIntegerField
      DisplayLabel = 'Num. Certificado'
      FieldName = 'CERTIFICADO'
    end
    object QMDetalleCERT_NEGATIVO: TIntegerField
      DisplayLabel = 'Cert. Neg.'
      FieldName = 'CERT_NEGATIVO'
    end
    object QMDetalleCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMDetalleLOTE_SIMPLE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE_SIMPLE'
    end
    object QMDetalleDIRECCION_ENTREGA: TIntegerField
      DisplayLabel = 'Dir. Entrega'
      FieldName = 'DIRECCION_ENTREGA'
    end
    object QMDetalleCOSTE_ADICIONAL: TFloatField
      DisplayLabel = 'Coste Adic.'
      FieldName = 'COSTE_ADICIONAL'
    end
    object QMDetalleCODIGO_CLIENTE: TStringField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'CODIGO_CLIENTE'
      Size = 40
    end
    object QMDetalleTITULO_CLIENTE: TStringField
      DisplayLabel = 'Titulo Segun Cli.'
      FieldName = 'TITULO_CLIENTE'
      Size = 256
    end
    object QMDetalleTOTAL_UNIDADES_EXT: TFloatField
      DisplayLabel = 'Tot. Uds. Ext.'
      FieldName = 'TOTAL_UNIDADES_EXT'
      OnGetText = QMDetalleTOTAL_UNIDADES_EXTGetText
    end
    object QMDetalleMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldKind = fkCalculated
      FieldName = 'MARGEN'
      Calculated = True
    end
    object QMDetalleMANIPULACION: TIntegerField
      DisplayLabel = 'Man.'
      FieldName = 'MANIPULACION'
    end
    object QMDetalleALFA_1: TFIBStringField
      DisplayLabel = 'Alfa 1'
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMDetalleALFA_2: TFIBStringField
      DisplayLabel = 'Alfa 2'
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMDetalleALFA_3: TFIBStringField
      DisplayLabel = 'Alfa 3'
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMDetalleALFA_4: TFIBStringField
      DisplayLabel = 'Alfa 4'
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMDetalleALFA_5: TFIBStringField
      DisplayLabel = 'Alfa 5'
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMDetalleALFA_6: TFIBStringField
      DisplayLabel = 'Alfa 6'
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMDetalleALFA_7: TFIBStringField
      DisplayLabel = 'Alfa 7'
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMDetalleALFA_8: TFIBStringField
      DisplayLabel = 'Alfa 8'
      FieldName = 'ALFA_8'
      Size = 40
    end
    object QMDetalleID_IMAGEN: TIntegerField
      FieldName = 'ID_IMAGEN'
    end
    object QMDetalleINVERSION_SUJETO_PASIVO: TIntegerField
      DisplayLabel = 'ISP'
      FieldName = 'INVERSION_SUJETO_PASIVO'
    end
    object QMDetalleDECIMALES_UNIDADES: TIntegerField
      DisplayLabel = 'Decimales Uds.'
      FieldName = 'DECIMALES_UNIDADES'
    end
    object QMDetalleTIPO_IMPUESTO_ADICIONAL: TIntegerField
      DisplayLabel = 'Tipo Imp. Adicional'
      FieldName = 'TIPO_IMPUESTO_ADICIONAL'
    end
    object QMDetalleP_IMPUESTO_ADICIONAL: TFloatField
      DisplayLabel = '% Imp. Adicional'
      FieldName = 'P_IMPUESTO_ADICIONAL'
    end
    object QMDetalleLOTEABLE: TIntegerField
      DisplayLabel = 'Loteable'
      FieldName = 'LOTEABLE'
    end
    object QMDetalleCANT_LOTE: TFloatField
      DisplayLabel = 'Cant. Lote'
      FieldName = 'CANT_LOTE'
      OnGetText = QMDetalleCANT_LOTEGetText
    end
    object QMDetalleID_LOTE: TIntegerField
      DisplayLabel = 'Id Lote'
      FieldName = 'ID_LOTE'
    end
    object QMDetalleLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMDetallePESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
      OnGetText = QMDetallePESOGetText
    end
    object QMDetallePESO_TOTAL: TFloatField
      DisplayLabel = 'Peso Total'
      FieldName = 'PESO_TOTAL'
      OnGetText = QMDetallePESO_TOTALGetText
    end
    object QMDetallePESO_REAL: TFloatField
      DisplayLabel = 'Peso Real'
      FieldName = 'PESO_REAL'
      OnChange = QMDetallePESO_REALChange
      OnGetText = QMDetallePESO_REALGetText
    end
    object QMDetalleSIGNO_UNIDADES: TFIBStringField
      DisplayLabel = 'Unidad'
      FieldName = 'SIGNO_UNIDADES'
      Size = 3
    end
    object QMDetalleUNIDAD_FOMENTO: TFloatField
      DisplayLabel = 'UF'
      FieldName = 'UNIDAD_FOMENTO'
    end
    object QMDetalleU_POR_U_LOGISTICA: TFloatField
      DisplayLabel = 'Uds./U.Log.'
      FieldName = 'U_POR_U_LOGISTICA'
    end
    object QMDetalleRELACIONAR_U_LOGISTICA: TIntegerField
      DisplayLabel = 'Rel. U. Log.'
      FieldName = 'RELACIONAR_U_LOGISTICA'
    end
    object QMDetalleTIPO_IVA_ART: TIntegerField
      FieldName = 'TIPO_IVA_ART'
    end
    object QMDetalleECOTASA: TFloatField
      DisplayLabel = 'Ecotasa'
      FieldName = 'ECOTASA'
    end
    object QMDetalleREQUIERE_LOTE_SIMPLE: TIntegerField
      DisplayLabel = 'Req. Lote Simple'
      FieldName = 'REQUIERE_LOTE_SIMPLE'
    end
    object QMDetalleCONTROL_STOCK: TIntegerField
      DisplayLabel = 'Control Stock'
      FieldName = 'CONTROL_STOCK'
    end
    object QMDetalleUE_UNIDADES: TIntegerField
      DisplayLabel = 'Uds. Extendidas'
      FieldName = 'UE_UNIDADES'
    end
    object QMDetalleUE_MEDIDA1: TFloatField
      DisplayLabel = 'Medida 1'
      FieldName = 'UE_MEDIDA1'
    end
    object QMDetalleUE_MEDIDA2: TFloatField
      DisplayLabel = 'Medida 2'
      FieldName = 'UE_MEDIDA2'
    end
    object QMDetalleUE_MEDIDA3: TFloatField
      DisplayLabel = 'Medida 3'
      FieldName = 'UE_MEDIDA3'
    end
    object QMDetalleUE_MEDIDA4: TFloatField
      DisplayLabel = 'Medida 4'
      FieldName = 'UE_MEDIDA4'
    end
    object QMDetalleSTOCK_REAL: TFloatField
      DisplayLabel = 'Stock Real'
      FieldKind = fkCalculated
      FieldName = 'STOCK_REAL'
      Calculated = True
    end
    object QMDetalleNO_FABRICACION_KRI: TFIBStringField
      DisplayLabel = 'No. Fabricacion'
      FieldName = 'NO_FABRICACION_KRI'
      Size = 15
    end
    object QMDetallePRECIO_U_C_DESC: TFloatField
      DisplayLabel = 'Precio U. C. Desc.'
      FieldName = 'PRECIO_U_C_DESC'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 160
    Top = 56
  end
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CABECERAS_FACTURA'
      'WHERE'
      '  ID_S=?old_ID_S ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CABECERAS_FACTURA'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,ALMACEN,MONEDA,FECHA' +
        ',TERCERO,TITULO,'#13#10'DIRECCION,DIR_NOMBRE_2,CODIGO_POSTAL,LOCALIDAD' +
        ',CLIENTE,CONTACTO,SU_REFERENCIA,FORMA_PAGO,BANCO,'#13#10'CAMPANYA,NOTA' +
        'S,ESTADO,BULTOS,LINEAS,BRUTO,I_DTO_LINEAS,S_BASES,M_BRUTO,C_TOTA' +
        'L,'#13#10'AGENTE,S_CUOTA_IVA,S_CUOTA_RE,B_DTO_LINEAS,DTO_PP,DTO_CIAL,I' +
        '_DTO_CIAL,I_DTO_PP,B_COMISION,I_COMISION,'#13#10'POR_FINANCIACION,I_FI' +
        'NANCIACION,ENTRADA,TRANSPORTISTA,I_BASE_RETENCION,P_RETENCION,I_' +
        'RETENCION,FUERZA_VENCIMIENTOS,RIC,'#13#10'TIPO_IRPF,A_IRPF,TOTAL_A_COB' +
        'RAR,DEVOLUCION,SIN_DETALLE,ASIENTO,NOMBRE_COMERCIAL,REGISTRO,POR' +
        'TES,I_FINANCIACION_CANAL,'#13#10'TARIFA,CENTRO_COSTE,ID_S,PROCESO_AUTO' +
        ',FECHA_ENTREGA,IDIOMA,RECT,ID_RECT,TIPO_PORTES,POR_PORTES,'#13#10'I_PO' +
        'RTES,I_PORTES_CANAL,RANGO,INDICE,CAMBIO_FIJO,VALOR_CAMB_FIJO,PRO' +
        'YECTO,NOTAS_INTERNAS_KRI,TIPO_LINEA_KRI,'#13#10'MODO_IVA,Z_PREFIJO_NCF' +
        ',Z_CONTADOR_NCF,Z_TIPO_NCF,CADENA_ORIGINAL,SELLO_DIGITAL,CERTIFI' +
        'CADO,'#13#10'FICHERO,MODIFICA_DOC,NIF,RECC,IMPORTE_ANTICIPO,SALDO_ANTI' +
        'CIPO_A_CIERRE_FAC,USUARIO,EMPLEADO_RESPONSABLE,EMPLEADO_ATENCION' +
        ',INVERSION_SUJETO_PASIVO,'#13#10'POR_PROPINA,SFV_AUTORIZACION,SFV_NUM_' +
        'DOSIFICACION,SFV_CODIGO_CONTROL,SFV_CODIGO_RESPUESTA_RAPIDA,POR_' +
        'RETENCION_GARANTIA,I_RETENCION_GARANTIA,FECHA_RETENCION_GARANTIA' +
        ','#13#10'ID_DEV,SIN_RECIBOS,FECHA_CON,FECHA_ENTREGA_REPARTO,Z_OBSERVAC' +
        'ION,ENTRADA_FACTURACION,PEDIDO_CLIENTE,EMPAQUETADO_EMPRESA,DIR_RE' +
        'COGIDA_MANUAL,DIR_ENTREGA_MANUAL,'#13#10'EQUIPO_RECOGIDA,EQUIPO_ENTREG' +
        'A,MATRICULA_RECOGIDA,MATRICULA_ENTREGA,FECHA_RECOGIDA_MANUAL,FEC' +
        'HA_ENTREGA_MANUAL,SII_ID_DOC_REF,USUARIO_CREACION,PERIODO_FACTUR' +
        'ACION_INI,PERIODO_FACTURACION_FIN,'#13#10'LEGAL_LITERALS,COD_MOTIVO_AB' +
        'ONO,EMITIDA_POR_TERCEROS,ID_FICHA_TECNICA,ORIGEN_DOCUMENTO,VALOR' +
        '_UNIDAD_FOMENTO,INDSERVICIO,ID_TIPO_GIRO_CLIENTE,'#13#10'CODIGO_GIRO_C' +
        'LIENTE,TITULO_GIRO_CLIENTE,ID_TIPO_GIRO_EMPRESA,CODIGO_GIRO_EMPR' +
        'ESA,TIPO_VENTA,CODIGO_RESPUESTA_SII,FOLIO,TIPO_DOC_TRIBUTARIO,ID' +
        '_TIPO_DESPACHO,SII_FMA_PAGO,'#13#10'TIPO_INGRESOS,GD_NROLINREF,GD_TPOD' +
        'OCREF,GD_FOLIOREF,GD_RUTOTR,GD_FCHREF,GD_CODREF,GD_RAZONREF,OC_N' +
        'ROLINREF,OC_TPODOCREF,'#13#10'OC_FOLIOREF,OC_RUTOTR,OC_FCHREF,OC_CODRE' +
        'F,OC_RAZONREF,VF_ESTADO_REGISTRO_ALTA,VF_CODIGO_ERROR_ALTA,VF_DE' +
        'SCRIPCION_ERROR_ALTA,VF_ESTADO_REGISTRO_ANULACION,VF_CODIGO_ERRO' +
        'R_ANULACION,'#13#10'VF_DESCRIPCION_ERROR_ANULACION)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ALMACEN,?MONE' +
        'DA,?FECHA,?TERCERO,?TITULO,'#13#10'?DIRECCION,?DIR_NOMBRE_2,?CODIGO_PO' +
        'STAL,?LOCALIDAD,?CLIENTE,?CONTACTO,?SU_REFERENCIA,?FORMA_PAGO,?B' +
        'ANCO,'#13#10'?CAMPANYA,?NOTAS,?ESTADO,?BULTOS,?LINEAS,?BRUTO,?I_DTO_LI' +
        'NEAS,?S_BASES,?M_BRUTO,?C_TOTAL,'#13#10'?AGENTE,?S_CUOTA_IVA,?S_CUOTA_' +
        'RE,?B_DTO_LINEAS,?DTO_PP,?DTO_CIAL,?I_DTO_CIAL,?I_DTO_PP,?B_COMI' +
        'SION,?I_COMISION,'#13#10'?POR_FINANCIACION,?I_FINANCIACION,?ENTRADA,?T' +
        'RANSPORTISTA,?I_BASE_RETENCION,?P_RETENCION,?I_RETENCION,?FUERZA' +
        '_VENCIMIENTOS,?RIC,'#13#10'?TIPO_IRPF,?A_IRPF,?TOTAL_A_COBRAR,?DEVOLUC' +
        'ION,?SIN_DETALLE,?ASIENTO,?NOMBRE_COMERCIAL,?REGISTRO,?PORTES,?I' +
        '_FINANCIACION_CANAL,'#13#10'?TARIFA,?CENTRO_COSTE,?ID_S,?PROCESO_AUTO,' +
        '?FECHA_ENTREGA,?IDIOMA,?RECT,?ID_RECT,?TIPO_PORTES,?POR_PORTES,'#13 +
        #10'?I_PORTES,?I_PORTES_CANAL,?RANGO,?INDICE,?CAMBIO_FIJO,?VALOR_CA' +
        'MB_FIJO,?PROYECTO,?NOTAS_INTERNAS_KRI,?TIPO_LINEA_KRI,'#13#10'?MODO_IV' +
        'A,?Z_PREFIJO_NCF,?Z_CONTADOR_NCF,?Z_TIPO_NCF,?CADENA_ORIGINAL,?S' +
        'ELLO_DIGITAL,?CERTIFICADO,'#13#10'?FICHERO,?MODIFICA_DOC,?NIF,?RECC,?I' +
        'MPORTE_ANTICIPO,?SALDO_ANTICIPO_A_CIERRE_FAC,?USUARIO,?EMPLEADO_' +
        'RESPONSABLE,?EMPLEADO_ATENCION,?INVERSION_SUJETO_PASIVO,'#13#10'?POR_P' +
        'ROPINA,?SFV_AUTORIZACION,?SFV_NUM_DOSIFICACION,?SFV_CODIGO_CONTR' +
        'OL,?SFV_CODIGO_RESPUESTA_RAPIDA,?POR_RETENCION_GARANTIA,?I_RETEN' +
        'CION_GARANTIA,?FECHA_RETENCION_GARANTIA,'#13#10'?ID_DEV,?SIN_RECIBOS,?' +
        'FECHA_CON,?FECHA_ENTREGA_REPARTO,?Z_OBSERVACION,?ENTRADA_FACTURA' +
        'CION,?PEDIDO_CLIENTE,?EMPAQUETADO_EMPRESA,?DIR_RECOGIDA_MANUAL,?D' +
        'IR_ENTREGA_MANUAL,'#13#10'?EQUIPO_RECOGIDA,?EQUIPO_ENTREGA,?MATRICULA_' +
        'RECOGIDA,?MATRICULA_ENTREGA,?FECHA_RECOGIDA_MANUAL,?FECHA_ENTREG' +
        'A_MANUAL,?SII_ID_DOC_REF,?USUARIO_CREACION,?PERIODO_FACTURACION_' +
        'INI,?PERIODO_FACTURACION_FIN,'#13#10'?LEGAL_LITERALS,?COD_MOTIVO_ABONO' +
        ',?EMITIDA_POR_TERCEROS,?ID_FICHA_TECNICA,?ORIGEN_DOCUMENTO,?VALO' +
        'R_UNIDAD_FOMENTO,?INDSERVICIO,?ID_TIPO_GIRO_CLIENTE,'#13#10'?CODIGO_GI' +
        'RO_CLIENTE,?TITULO_GIRO_CLIENTE,?ID_TIPO_GIRO_EMPRESA,?CODIGO_GI' +
        'RO_EMPRESA,?TIPO_VENTA,?CODIGO_RESPUESTA_SII,?FOLIO,?TIPO_DOC_TR' +
        'IBUTARIO,?ID_TIPO_DESPACHO,?SII_FMA_PAGO,'#13#10'?TIPO_INGRESOS,?GD_NR' +
        'OLINREF,?GD_TPODOCREF,?GD_FOLIOREF,?GD_RUTOTR,?GD_FCHREF,?GD_COD' +
        'REF,?GD_RAZONREF,?OC_NROLINREF,?OC_TPODOCREF,'#13#10'?OC_FOLIOREF,?OC_' +
        'RUTOTR,?OC_FCHREF,?OC_CODREF,?OC_RAZONREF,?VF_ESTADO_REGISTRO_AL' +
        'TA,?VF_CODIGO_ERROR_ALTA,?VF_DESCRIPCION_ERROR_ALTA,?VF_ESTADO_R' +
        'EGISTRO_ANULACION,?VF_CODIGO_ERROR_ANULACION,'#13#10'?VF_DESCRIPCION_E' +
        'RROR_ANULACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_FACTURA'
      'WHERE'
      '  ID_S=?ID_S ')
    SelectSQL.Strings = (
      '/* Se establece en el OnCreate */'
      'SELECT * FROM VER_CABECERAS_FACTURA'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'CANAL=?CANAL AND'
      'SERIE=?SERIE AND'
      'TIPO='#39'FAC'#39
      
        'AND (EJERCICIO=?EJERCICIO OR ((EJERCICIO < ?EJERCICIO) AND ((EST' +
        'ADO = 0) OR (ESTADO = 3))))'
      'ORDER BY EJERCICIO, RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CABECERAS_FACTURA'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,TIPO=?TIPO '
      '  ,RIG=?RIG '
      '  ,ALMACEN=?ALMACEN '
      '  ,MONEDA=?MONEDA '
      '  ,FECHA=?FECHA '
      '  ,TERCERO=?TERCERO '
      '  ,TITULO=?TITULO '
      '  ,DIRECCION=?DIRECCION '
      '  ,DIR_NOMBRE_2=?DIR_NOMBRE_2 '
      '  ,CODIGO_POSTAL=?CODIGO_POSTAL '
      '  ,LOCALIDAD=?LOCALIDAD '
      '  ,CLIENTE=?CLIENTE '
      '  ,CONTACTO=?CONTACTO '
      '  ,SU_REFERENCIA=?SU_REFERENCIA '
      '  ,FORMA_PAGO=?FORMA_PAGO '
      '  ,BANCO=?BANCO '
      '  ,CAMPANYA=?CAMPANYA '
      '  ,NOTAS=?NOTAS '
      '  ,ESTADO=?ESTADO '
      '  ,BULTOS=?BULTOS '
      '  ,LINEAS=?LINEAS '
      '  ,BRUTO=?BRUTO '
      '  ,I_DTO_LINEAS=?I_DTO_LINEAS '
      '  ,S_BASES=?S_BASES '
      '  ,M_BRUTO=?M_BRUTO '
      '  ,C_TOTAL=?C_TOTAL '
      '  ,AGENTE=?AGENTE '
      '  ,S_CUOTA_IVA=?S_CUOTA_IVA '
      '  ,S_CUOTA_RE=?S_CUOTA_RE '
      '  ,B_DTO_LINEAS=?B_DTO_LINEAS '
      '  ,DTO_PP=?DTO_PP '
      '  ,DTO_CIAL=?DTO_CIAL '
      '  ,I_DTO_CIAL=?I_DTO_CIAL '
      '  ,I_DTO_PP=?I_DTO_PP '
      '  ,B_COMISION=?B_COMISION '
      '  ,I_COMISION=?I_COMISION '
      '  ,POR_FINANCIACION=?POR_FINANCIACION '
      '  ,I_FINANCIACION=?I_FINANCIACION '
      '  ,ENTRADA=?ENTRADA '
      '  ,TRANSPORTISTA=?TRANSPORTISTA '
      '  ,I_BASE_RETENCION=?I_BASE_RETENCION '
      '  ,P_RETENCION=?P_RETENCION '
      '  ,I_RETENCION=?I_RETENCION '
      '  ,FUERZA_VENCIMIENTOS=?FUERZA_VENCIMIENTOS '
      '  ,RIC=?RIC '
      '  ,TIPO_IRPF=?TIPO_IRPF '
      '  ,A_IRPF=?A_IRPF '
      '  ,TOTAL_A_COBRAR=?TOTAL_A_COBRAR '
      '  ,DEVOLUCION=?DEVOLUCION '
      '  ,SIN_DETALLE=?SIN_DETALLE '
      '  ,ASIENTO=?ASIENTO '
      '  ,NOMBRE_COMERCIAL=?NOMBRE_COMERCIAL '
      '  ,REGISTRO=?REGISTRO '
      '  ,PORTES=?PORTES '
      '  ,I_FINANCIACION_CANAL=?I_FINANCIACION_CANAL '
      '  ,TARIFA=?TARIFA '
      '  ,CENTRO_COSTE=?CENTRO_COSTE '
      '  ,PROCESO_AUTO=?PROCESO_AUTO '
      '  ,FECHA_ENTREGA=?FECHA_ENTREGA '
      '  ,IDIOMA=?IDIOMA '
      '  ,RECT=?RECT '
      '  ,ID_RECT=?ID_RECT '
      '  ,TIPO_PORTES=?TIPO_PORTES '
      '  ,POR_PORTES=?POR_PORTES '
      '  ,I_PORTES=?I_PORTES '
      '  ,I_PORTES_CANAL=?I_PORTES_CANAL '
      '  ,RANGO=?RANGO '
      '  ,INDICE=?INDICE '
      '  ,CAMBIO_FIJO=?CAMBIO_FIJO '
      '  ,VALOR_CAMB_FIJO=?VALOR_CAMB_FIJO '
      '  ,PROYECTO=?PROYECTO '
      '  ,NOTAS_INTERNAS_KRI=?NOTAS_INTERNAS_KRI '
      '  ,TIPO_LINEA_KRI=?TIPO_LINEA_KRI '
      '  ,MODO_IVA=?MODO_IVA '
      '  ,Z_PREFIJO_NCF=?Z_PREFIJO_NCF '
      '  ,Z_CONTADOR_NCF=?Z_CONTADOR_NCF '
      '  ,Z_TIPO_NCF=?Z_TIPO_NCF '
      '  ,CADENA_ORIGINAL=?CADENA_ORIGINAL '
      '  ,SELLO_DIGITAL=?SELLO_DIGITAL '
      '  ,CERTIFICADO=?CERTIFICADO '
      '  ,FICHERO=?FICHERO '
      '  ,MODIFICA_DOC=?MODIFICA_DOC '
      '  ,NIF=?NIF '
      '  ,RECC=?RECC '
      '  ,IMPORTE_ANTICIPO=?IMPORTE_ANTICIPO '
      '  ,SALDO_ANTICIPO_A_CIERRE_FAC=?SALDO_ANTICIPO_A_CIERRE_FAC '
      '  ,USUARIO=?USUARIO '
      '  ,EMPLEADO_RESPONSABLE=?EMPLEADO_RESPONSABLE '
      '  ,EMPLEADO_ATENCION=?EMPLEADO_ATENCION '
      '  ,INVERSION_SUJETO_PASIVO=?INVERSION_SUJETO_PASIVO '
      '  ,POR_PROPINA=?POR_PROPINA '
      '  ,SFV_AUTORIZACION=?SFV_AUTORIZACION '
      '  ,SFV_NUM_DOSIFICACION=?SFV_NUM_DOSIFICACION '
      '  ,SFV_CODIGO_CONTROL=?SFV_CODIGO_CONTROL '
      '  ,SFV_CODIGO_RESPUESTA_RAPIDA=?SFV_CODIGO_RESPUESTA_RAPIDA '
      '  ,POR_RETENCION_GARANTIA=?POR_RETENCION_GARANTIA '
      '  ,I_RETENCION_GARANTIA=?I_RETENCION_GARANTIA '
      '  ,FECHA_RETENCION_GARANTIA=?FECHA_RETENCION_GARANTIA '
      '  ,ID_DEV=?ID_DEV '
      '  ,SIN_RECIBOS=?SIN_RECIBOS '
      '  ,FECHA_CON=?FECHA_CON '
      '  ,FECHA_ENTREGA_REPARTO=?FECHA_ENTREGA_REPARTO '
      '  ,Z_OBSERVACION=?Z_OBSERVACION '
      '  ,ENTRADA_FACTURACION=?ENTRADA_FACTURACION '
      '  ,PEDIDO_CLIENTE=?PEDIDO_CLIENTE '
      '  ,EMPAQUETADO_EMPRESA=?EMPAQUETADO_EMPRESA '
      '  ,DIR_RECOGIDA_MANUAL=?DIR_RECOGIDA_MANUAL '
      '  ,DIR_ENTREGA_MANUAL=?DIR_ENTREGA_MANUAL '
      '  ,EQUIPO_RECOGIDA=?EQUIPO_RECOGIDA '
      '  ,EQUIPO_ENTREGA=?EQUIPO_ENTREGA '
      '  ,MATRICULA_RECOGIDA=?MATRICULA_RECOGIDA '
      '  ,MATRICULA_ENTREGA=?MATRICULA_ENTREGA '
      '  ,FECHA_RECOGIDA_MANUAL=?FECHA_RECOGIDA_MANUAL '
      '  ,FECHA_ENTREGA_MANUAL=?FECHA_ENTREGA_MANUAL '
      '  ,SII_ID_DOC_REF=?SII_ID_DOC_REF '
      '  ,USUARIO_CREACION=?USUARIO_CREACION '
      '  ,PERIODO_FACTURACION_INI=?PERIODO_FACTURACION_INI '
      '  ,PERIODO_FACTURACION_FIN=?PERIODO_FACTURACION_FIN '
      '  ,LEGAL_LITERALS=?LEGAL_LITERALS '
      '  ,COD_MOTIVO_ABONO=?COD_MOTIVO_ABONO '
      '  ,EMITIDA_POR_TERCEROS=?EMITIDA_POR_TERCEROS '
      '  ,ID_FICHA_TECNICA=?ID_FICHA_TECNICA '
      '  ,ORIGEN_DOCUMENTO=?ORIGEN_DOCUMENTO '
      '  ,VALOR_UNIDAD_FOMENTO=?VALOR_UNIDAD_FOMENTO '
      '  ,INDSERVICIO=?INDSERVICIO '
      '  ,ID_TIPO_GIRO_CLIENTE=?ID_TIPO_GIRO_CLIENTE '
      '  ,CODIGO_GIRO_CLIENTE=?CODIGO_GIRO_CLIENTE '
      '  ,TITULO_GIRO_CLIENTE=?TITULO_GIRO_CLIENTE '
      '  ,ID_TIPO_GIRO_EMPRESA=?ID_TIPO_GIRO_EMPRESA '
      '  ,CODIGO_GIRO_EMPRESA=?CODIGO_GIRO_EMPRESA '
      '  ,TIPO_VENTA=?TIPO_VENTA '
      '  ,CODIGO_RESPUESTA_SII=?CODIGO_RESPUESTA_SII '
      '  ,FOLIO=?FOLIO '
      '  ,TIPO_DOC_TRIBUTARIO=?TIPO_DOC_TRIBUTARIO '
      '  ,ID_TIPO_DESPACHO=?ID_TIPO_DESPACHO '
      '  ,SII_FMA_PAGO=?SII_FMA_PAGO '
      '  ,TIPO_INGRESOS=?TIPO_INGRESOS '
      '  ,GD_NROLINREF=?GD_NROLINREF '
      '  ,GD_TPODOCREF=?GD_TPODOCREF '
      '  ,GD_FOLIOREF=?GD_FOLIOREF '
      '  ,GD_RUTOTR=?GD_RUTOTR '
      '  ,GD_FCHREF=?GD_FCHREF '
      '  ,GD_CODREF=?GD_CODREF '
      '  ,GD_RAZONREF=?GD_RAZONREF '
      '  ,OC_NROLINREF=?OC_NROLINREF '
      '  ,OC_TPODOCREF=?OC_TPODOCREF '
      '  ,OC_FOLIOREF=?OC_FOLIOREF '
      '  ,OC_RUTOTR=?OC_RUTOTR '
      '  ,OC_FCHREF=?OC_FCHREF '
      '  ,OC_CODREF=?OC_CODREF '
      '  ,OC_RAZONREF=?OC_RAZONREF '
      '  ,VF_ESTADO_REGISTRO_ALTA=?VF_ESTADO_REGISTRO_ALTA '
      '  ,VF_CODIGO_ERROR_ALTA=?VF_CODIGO_ERROR_ALTA '
      '  ,VF_DESCRIPCION_ERROR_ALTA=?VF_DESCRIPCION_ERROR_ALTA '
      '  ,VF_ESTADO_REGISTRO_ANULACION=?VF_ESTADO_REGISTRO_ANULACION '
      '  ,VF_CODIGO_ERROR_ANULACION=?VF_CODIGO_ERROR_ANULACION '
      
        '  ,VF_DESCRIPCION_ERROR_ANULACION=?VF_DESCRIPCION_ERROR_ANULACIO' +
        'N '
      'WHERE'
      '  ID_S=?ID_S ')
    AfterDelete = GrabaBorrado
    AfterInsert = QMCabeceraAfterInsert
    AfterOpen = QMCabeceraAfterOpen
    AfterPost = QMCabeceraAfterPost
    AfterScroll = QMCabeceraAfterScroll
    BeforeClose = QMCabeceraBeforeClose
    BeforeDelete = QMCabeceraBeforeDelete
    BeforeEdit = AntesDeEditar
    BeforeInsert = QMCabeceraBeforeInsert
    BeforePost = QMCabeceraBeforePost
    OnCalcFields = QMCabeceraCalcFields
    OnNewRecord = QMCabeceraNewRecord
    OnPostError = QMCabeceraPostError
    ClavesPrimarias.Strings = (
      'ID_S ')
    AccionesInhibidas = []
    Opciones = [DesactivarControlesAlOrdenar, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CABECERAS_FACTURA'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_FAC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCabeceraSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabeceraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCabeceraTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCabeceraRIG: TIntegerField
      DisplayLabel = 'Factura'
      FieldName = 'RIG'
    end
    object QMCabeceraALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMCabeceraMONEDA: TFIBStringField
      DisplayLabel = 'Mon.'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMCabeceraFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      OnChange = QMCabeceraFECHAChange
    end
    object QMCabeceraTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMCabeceraDIRECCION: TIntegerField
      DisplayLabel = 'Dir.'
      FieldName = 'DIRECCION'
      OnChange = QMCabeceraDIRECCIONChange
    end
    object QMCabeceraCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      OnChange = QMCabeceraCLIENTEChange
    end
    object QMCabeceraNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMCabeceraESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCabeceraBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object QMCabeceraLINEAS: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINEAS'
    end
    object QMCabeceraBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object QMCabeceraI_DTO_LINEAS: TFloatField
      DisplayLabel = 'Imp. Dto. Lineas'
      FieldName = 'I_DTO_LINEAS'
    end
    object QMCabeceraS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object QMCabeceraM_BRUTO: TFloatField
      DisplayLabel = 'M. Bruto'
      FieldName = 'M_BRUTO'
    end
    object QMCabeceraC_TOTAL: TFloatField
      DisplayLabel = 'C. Total'
      FieldName = 'C_TOTAL'
      Visible = False
    end
    object QMCabeceraAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMCabeceraS_CUOTA_IVA: TFloatField
      DisplayLabel = 'S.Cuota IVA'
      FieldName = 'S_CUOTA_IVA'
    end
    object QMCabeceraS_CUOTA_RE: TFloatField
      DisplayLabel = 'S. Cuota RE'
      FieldName = 'S_CUOTA_RE'
    end
    object QMCabeceraB_DTO_LINEAS: TFloatField
      DisplayLabel = 'B. Dto. Lineas'
      FieldName = 'B_DTO_LINEAS'
    end
    object QMCabeceraDTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DTO_PP'
      OnChange = QMCabeceraDTO_PPChange
    end
    object QMCabeceraDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial.'
      FieldName = 'DTO_CIAL'
    end
    object QMCabeceraI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial.'
      FieldName = 'I_DTO_CIAL'
    end
    object QMCabeceraI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. P.P.'
      FieldName = 'I_DTO_PP'
    end
    object QMCabeceraB_COMISION: TFloatField
      DisplayLabel = 'B. Comision'
      FieldName = 'B_COMISION'
    end
    object QMCabeceraI_COMISION: TFloatField
      DisplayLabel = 'Imp. Comision'
      FieldName = 'I_COMISION'
    end
    object QMCabeceraPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object QMCabeceraLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMCabeceraFORMA_PAGO: TFIBStringField
      DisplayLabel = 'Forma Pago'
      FieldName = 'FORMA_PAGO'
      OnChange = QMCabeceraFORMA_PAGOChange
      Size = 3
    end
    object QMCabeceraCAMPANYA: TIntegerField
      DisplayLabel = 'Campa'#241'a'
      FieldName = 'CAMPANYA'
      OnChange = QMCabeceraCAMPANYAChange
    end
    object QMCabeceraTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transp.'
      FieldName = 'TRANSPORTISTA'
      OnChange = QMCabeceraTRANSPORTISTAChange
    end
    object QMCabeceraI_BASE_RETENCION: TFloatField
      DisplayLabel = 'I. Base Ret.'
      FieldName = 'I_BASE_RETENCION'
    end
    object QMCabeceraP_RETENCION: TFloatField
      DisplayLabel = '% Ret.'
      FieldName = 'P_RETENCION'
    end
    object QMCabeceraI_RETENCION: TFloatField
      DisplayLabel = 'Imp. Ret.'
      FieldName = 'I_RETENCION'
    end
    object QMCabeceraENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMCabeceraFUERZA_VENCIMIENTOS: TIntegerField
      DisplayLabel = 'Fuerza Venc.'
      FieldName = 'FUERZA_VENCIMIENTOS'
    end
    object QMCabeceraRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMCabeceraTIPO_IRPF: TIntegerField
      DisplayLabel = 'Tipo IRPF'
      FieldName = 'TIPO_IRPF'
      OnChange = QMCabeceraTIPO_IRPFChange
    end
    object QMCabeceraA_IRPF: TIntegerField
      DisplayLabel = 'A. IRPF'
      FieldName = 'A_IRPF'
    end
    object QMCabeceraTOTAL_A_COBRAR: TFloatField
      DisplayLabel = 'Tot. a Cobrar'
      FieldName = 'TOTAL_A_COBRAR'
    end
    object QMCabeceraAPLICA_IRPF: TStringField
      DisplayLabel = 'Aplic. IRPF'
      FieldKind = fkCalculated
      FieldName = 'APLICA_IRPF'
      OnGetText = QMCabeceraAPLICA_IRPFGetText
      Size = 45
      Calculated = True
    end
    object QMCabeceraDEVOLUCION: TIntegerField
      DisplayLabel = 'Devol.'
      FieldName = 'DEVOLUCION'
    end
    object QMCabeceraSIN_DETALLE: TIntegerField
      DisplayLabel = 'Sin Det.'
      FieldName = 'SIN_DETALLE'
    end
    object QMCabeceraI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Financ.'
      FieldName = 'I_FINANCIACION'
    end
    object QMCabeceraRIC_FAC: TStringField
      DisplayLabel = 'RIC Fac.'
      FieldKind = fkCalculated
      FieldName = 'RIC_FAC'
      OnGetText = QMCabeceraRIC_FACGetText
      Size = 8
      Calculated = True
    end
    object QMCabeceraASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object QMCabeceraREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
      OnGetText = QMCabeceraREGISTROGetText
    end
    object QMCabeceraTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      OnGetText = QMCabeceraTITULOGetText
      Size = 60
    end
    object QMCabeceraNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nom. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMCabeceraSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Ref.'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMCabeceraPORTES: TIntegerField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
    end
    object QMCabeceraTOTAL_CANAL: TFloatField
      DisplayLabel = 'Total Factura'
      FieldKind = fkCalculated
      FieldName = 'TOTAL_CANAL'
      OnGetText = QMCabeceraTOTAL_CANALGetText
      Calculated = True
    end
    object QMCabeceraI_FINANCIACION_CANAL: TFloatField
      DisplayLabel = 'Imp. Financ. C.'
      FieldName = 'I_FINANCIACION_CANAL'
    end
    object QMCabeceraTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      OnChange = QMCabeceraTARIFAChange
      Size = 3
    end
    object QMCabeceraID_S: TIntegerField
      DisplayLabel = 'ID S.'
      FieldName = 'ID_S'
    end
    object QMCabeceraCENTRO_COSTE: TIntegerField
      DisplayLabel = 'Centro Coste'
      FieldName = 'CENTRO_COSTE'
    end
    object QMCabeceraFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fec. Entrega'
      FieldName = 'FECHA_ENTREGA'
    end
    object QMCabeceraIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMCabeceraRECT: TIntegerField
      DisplayLabel = 'Rect.'
      FieldName = 'RECT'
    end
    object QMCabeceraID_RECT: TIntegerField
      DisplayLabel = 'ID Rect.'
      FieldName = 'ID_RECT'
    end
    object QMCabeceraTIPO_PORTES: TIntegerField
      DisplayLabel = 'Tipo Portes'
      FieldName = 'TIPO_PORTES'
      OnChange = QMCabeceraTIPO_PORTESChange
    end
    object QMCabeceraPOR_PORTES: TFloatField
      DisplayLabel = '% Portes'
      FieldName = 'POR_PORTES'
    end
    object QMCabeceraI_PORTES: TFloatField
      DisplayLabel = 'Imp. Portes'
      FieldName = 'I_PORTES'
    end
    object QMCabeceraI_PORTES_CANAL: TFloatField
      DisplayLabel = 'Imp. Portes Canal'
      FieldName = 'I_PORTES_CANAL'
    end
    object QMCabeceraRANGO: TIntegerField
      DisplayLabel = 'Rango'
      FieldName = 'RANGO'
      OnChange = QMCabeceraRANGOChange
    end
    object QMCabeceraINDICE: TIntegerField
      DisplayLabel = 'Indice'
      FieldName = 'INDICE'
      OnChange = QMCabeceraINDICEChange
    end
    object QMCabeceraCAMBIO_FIJO: TIntegerField
      DisplayLabel = 'Cambio Fijo'
      FieldName = 'CAMBIO_FIJO'
      OnChange = QMCabeceraCAMBIO_FIJOChange
    end
    object QMCabeceraVALOR_CAMB_FIJO: TFloatField
      DisplayLabel = 'Val. Cambio Fijo'
      FieldName = 'VALOR_CAMB_FIJO'
      OnChange = QMCabeceraVALOR_CAMB_FIJOChange
      DisplayFormat = '0.00####'
    end
    object QMCabeceraVALOR_CAMB_FIJO_INV: TFloatField
      DisplayLabel = 'Val. Cambio Fijo Inv.'
      FieldName = 'VALOR_CAMB_FIJO_INV'
      OnChange = QMCabeceraVALOR_CAMB_FIJO_INVChange
      DisplayFormat = '0.00####'
    end
    object QMCabeceraCONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
      OnChange = QMCabeceraCONTACTOChange
    end
    object QMCabeceraPROYECTO: TIntegerField
      DisplayLabel = 'Proy.'
      FieldName = 'PROYECTO'
    end
    object QMCabeceraNOTAS_INTERNAS_KRI: TBlobField
      DisplayLabel = 'Notas Internas'
      FieldName = 'NOTAS_INTERNAS_KRI'
      Size = 8
    end
    object QMCabeceraTIPO_LINEA_KRI: TIntegerField
      DisplayLabel = 'Tipo Linea'
      FieldName = 'TIPO_LINEA_KRI'
    end
    object QMCabeceraMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object QMCabeceraZ_PREFIJO_NCF: TFIBStringField
      DisplayLabel = 'Prefijo NCF'
      FieldName = 'Z_PREFIJO_NCF'
      Size = 11
    end
    object QMCabeceraZ_CONTADOR_NCF: TFIBStringField
      DisplayLabel = 'Contador NCF'
      FieldName = 'Z_CONTADOR_NCF'
      Size = 8
    end
    object QMCabeceraZ_TIPO_NCF: TIntegerField
      DisplayLabel = 'Tipo NCF'
      FieldName = 'Z_TIPO_NCF'
    end
    object QMCabeceraRECC: TIntegerField
      DisplayLabel = 'Reg. Esp. Criterio de Caja'
      FieldName = 'RECC'
    end
    object QMCabeceraTIT_CONTACTO: TFIBStringField
      DisplayLabel = 'Tit. Contacto'
      FieldName = 'TIT_CONTACTO'
      Size = 81
    end
    object QMCabeceraIMPORTE_ANTICIPO: TFloatField
      DisplayLabel = 'Imp. Anticipo'
      FieldName = 'IMPORTE_ANTICIPO'
    end
    object QMCabeceraEMPLEADO_RESPONSABLE: TIntegerField
      DisplayLabel = 'Empl. Responsable'
      FieldName = 'EMPLEADO_RESPONSABLE'
    end
    object QMCabeceraEMPLEADO_ATENCION: TIntegerField
      DisplayLabel = 'Empl. Atencion'
      FieldName = 'EMPLEADO_ATENCION'
    end
    object QMCabeceraTITULO_ESTADO: TStringField
      DisplayLabel = 'T'#237'tulo Estado'
      FieldKind = fkCalculated
      FieldName = 'TITULO_ESTADO'
      Size = 40
      Calculated = True
    end
    object QMCabeceraMARGEN: TFloatField
      FieldKind = fkCalculated
      FieldName = 'MARGEN'
      Calculated = True
    end
    object QMCabeceraINVERSION_SUJETO_PASIVO: TIntegerField
      DisplayLabel = 'Inv. Sujeto Pasivo'
      FieldName = 'INVERSION_SUJETO_PASIVO'
    end
    object QMCabeceraUNIDADES: TFloatField
      DisplayLabel = 'Total Uds.'
      FieldName = 'UNIDADES'
    end
    object QMCabeceraREGISTRO_CARTERA: TIntegerField
      DisplayLabel = 'Registro Cartera'
      FieldName = 'REGISTRO_CARTERA'
    end
    object QMCabeceraPOR_PROPINA: TFloatField
      DisplayLabel = '% Propina'
      FieldName = 'POR_PROPINA'
    end
    object QMCabeceraSFV_AUTORIZACION: TFIBStringField
      DisplayLabel = 'Autorizaci'#243'n'
      FieldName = 'SFV_AUTORIZACION'
    end
    object QMCabeceraSFV_NUM_DOSIFICACION: TIntegerField
      DisplayLabel = 'Nro. Dosificacion'
      FieldName = 'SFV_NUM_DOSIFICACION'
    end
    object QMCabeceraSFV_CODIGO_CONTROL: TFIBStringField
      DisplayLabel = 'C'#243'digo control'
      FieldName = 'SFV_CODIGO_CONTROL'
    end
    object QMCabeceraSFV_CODIGO_RESPUESTA_RAPIDA: TFIBStringField
      DisplayLabel = 'Cod. Respuesta Rapido'
      FieldName = 'SFV_CODIGO_RESPUESTA_RAPIDA'
      Size = 256
    end
    object QMCabeceraPOR_RETENCION_GARANTIA: TFloatField
      DisplayLabel = '% Ret. Garant'#237'a'
      FieldName = 'POR_RETENCION_GARANTIA'
    end
    object QMCabeceraI_RETENCION_GARANTIA: TFloatField
      DisplayLabel = 'Imp. Ret. Garant'#237'a'
      FieldName = 'I_RETENCION_GARANTIA'
    end
    object QMCabeceraFECHA_RETENCION_GARANTIA: TDateTimeField
      DisplayLabel = 'Fec. Vto. Garant'#237'a'
      FieldName = 'FECHA_RETENCION_GARANTIA'
    end
    object QMCabeceraID_DEV: TIntegerField
      DisplayLabel = 'Id Devolucion'
      FieldName = 'ID_DEV'
    end
    object QMCabeceraBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object QMCabeceraID_TIPO_GIRO_CLIENTE: TIntegerField
      DisplayLabel = 'Id Tipo Giro Cliente'
      FieldName = 'ID_TIPO_GIRO_CLIENTE'
    end
    object QMCabeceraID_TIPO_GIRO_EMPRESA: TIntegerField
      DisplayLabel = 'Id Tipo Giro Empresa'
      FieldName = 'ID_TIPO_GIRO_EMPRESA'
    end
    object QMCabeceraTIPO_VENTA: TIntegerField
      DisplayLabel = 'Tipo Venta SII'
      FieldName = 'TIPO_VENTA'
    end
    object QMCabeceraCODIGO_RESPUESTA_SII: TMemoField
      DisplayLabel = 'Codigo Respuesta SII'
      FieldName = 'CODIGO_RESPUESTA_SII'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabeceraFOLIO: TIntegerField
      DisplayLabel = 'Folio'
      FieldName = 'FOLIO'
    end
    object QMCabeceraCODIGO_GIRO_CLIENTE: TIntegerField
      DisplayLabel = 'Cod. Giro Cliente'
      FieldName = 'CODIGO_GIRO_CLIENTE'
    end
    object QMCabeceraCODIGO_GIRO_EMPRESA: TIntegerField
      DisplayLabel = 'Cod. Giro Empresa'
      FieldName = 'CODIGO_GIRO_EMPRESA'
    end
    object QMCabeceraID_TIPO_DESPACHO: TIntegerField
      DisplayLabel = 'Tipo Despacho SII'
      FieldName = 'ID_TIPO_DESPACHO'
    end
    object QMCabeceraTIPO_DOC_TRIBUTARIO: TFIBStringField
      DisplayLabel = 'Tipo Doc Tributario'
      FieldName = 'TIPO_DOC_TRIBUTARIO'
      OnChange = QMCabeceraTIPO_DOC_TRIBUTARIOChange
      Size = 3
    end
    object QMCabeceraSII_FMA_PAGO: TIntegerField
      DisplayLabel = 'F. Pago SII'
      FieldName = 'SII_FMA_PAGO'
    end
    object QMCabeceraDESC_RECTIFICACION: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESC_RECTIFICACION'
      Size = 60
      Calculated = True
    end
    object QMCabeceraTOTAL_ANTICIPADO: TFloatField
      DisplayLabel = 'Total Antic.'
      FieldName = 'TOTAL_ANTICIPADO'
    end
    object QMCabeceraSIN_RECIBOS: TIntegerField
      DisplayLabel = 'Sin Recibos'
      FieldName = 'SIN_RECIBOS'
    end
    object QMCabeceraFECHA_CON: TDateTimeField
      DisplayLabel = 'Fecha Cont'
      FieldName = 'FECHA_CON'
    end
    object QMCabeceraFECHA_ENTREGA_REPARTO: TDateTimeField
      DisplayLabel = 'Fecha Reparto'
      FieldName = 'FECHA_ENTREGA_REPARTO'
    end
    object QMCabeceraPEDIDO_CLIENTE: TFIBStringField
      DisplayLabel = 'Nro. Pedido'
      FieldName = 'PEDIDO_CLIENTE'
      Size = 60
    end
    object QMCabeceraZ_OBSERVACION: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'Z_OBSERVACION'
      Size = 256
    end
    object QMCabeceraDIR_ENTREGA_MANUAL: TMemoField
      DisplayLabel = 'Dir. Entrega Manual'
      FieldName = 'DIR_ENTREGA_MANUAL'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabeceraSII_ID_DOC_REF: TIntegerField
      DisplayLabel = 'Id Doc. Ref.'
      FieldName = 'SII_ID_DOC_REF'
    end
    object QMCabeceraUSUARIO_CREACION: TIntegerField
      DisplayLabel = 'Usuario Creacion'
      FieldName = 'USUARIO_CREACION'
    end
    object QMCabeceraDIR_COMPLETA: TFIBStringField
      DisplayLabel = 'Dir. Completa'
      FieldName = 'DIR_COMPLETA'
      Size = 76
    end
    object QMCabeceraCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object QMCabeceraLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 40
    end
    object QMCabeceraFECHA_ENTREGA_MANUAL: TDateTimeField
      DisplayLabel = 'Fec. Entrega Manual'
      FieldName = 'FECHA_ENTREGA_MANUAL'
    end
    object QMCabeceraEMPAQUETADO_EMPRESA: TIntegerField
      DisplayLabel = 'Empaq. Empresa'
      FieldName = 'EMPAQUETADO_EMPRESA'
    end
    object QMCabeceraDIR_RECOGIDA_MANUAL: TMemoField
      DisplayLabel = 'Dir. Recogida Manual'
      FieldName = 'DIR_RECOGIDA_MANUAL'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabeceraEQUIPO_RECOGIDA: TFIBStringField
      DisplayLabel = 'Equipo Recogida'
      FieldName = 'EQUIPO_RECOGIDA'
      Size = 40
    end
    object QMCabeceraEQUIPO_ENTREGA: TFIBStringField
      DisplayLabel = 'Equipo Entrega'
      FieldName = 'EQUIPO_ENTREGA'
      Size = 40
    end
    object QMCabeceraMATRICULA_RECOGIDA: TFIBStringField
      DisplayLabel = 'Matr. Recogida'
      FieldName = 'MATRICULA_RECOGIDA'
      Size = 40
    end
    object QMCabeceraMATRICULA_ENTREGA: TFIBStringField
      DisplayLabel = 'Mat. Entrega'
      FieldName = 'MATRICULA_ENTREGA'
      Size = 40
    end
    object QMCabeceraFECHA_RECOGIDA_MANUAL: TDateTimeField
      DisplayLabel = 'Fec. Recogida Manual'
      FieldName = 'FECHA_RECOGIDA_MANUAL'
    end
    object QMCabeceraVALOR_UNIDAD_FOMENTO: TFloatField
      DisplayLabel = 'Valor UF'
      FieldName = 'VALOR_UNIDAD_FOMENTO'
    end
    object QMCabeceraPERIODO_FACTURACION_INI: TDateTimeField
      DisplayLabel = 'Per. Fact. Ini'
      FieldName = 'PERIODO_FACTURACION_INI'
    end
    object QMCabeceraPERIODO_FACTURACION_FIN: TDateTimeField
      DisplayLabel = 'Per. Fact. Fin'
      FieldName = 'PERIODO_FACTURACION_FIN'
    end
    object QMCabeceraINDSERVICIO: TIntegerField
      DisplayLabel = 'Ind. Servicios'
      FieldName = 'INDSERVICIO'
    end
    object QMCabeceraRECIBO_PAGADO: TIntegerField
      DisplayLabel = 'Rec. Pagado'
      FieldName = 'RECIBO_PAGADO'
    end
    object QMCabeceraLEGAL_LITERALS: TMemoField
      DisplayLabel = 'Textos Legales'
      FieldName = 'LEGAL_LITERALS'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabeceraCOD_MOTIVO_ABONO: TIntegerField
      DisplayLabel = 'Motivo Abono'
      FieldName = 'COD_MOTIVO_ABONO'
    end
    object QMCabeceraEMITIDA_POR_TERCEROS: TIntegerField
      DisplayLabel = 'Emitida por Terceros'
      FieldName = 'EMITIDA_POR_TERCEROS'
    end
    object QMCabeceraVENCIMIENTO: TDateTimeField
      DisplayLabel = '1er. Vencimiento'
      FieldName = 'VENCIMIENTO'
    end
    object QMCabeceraID_FICHA_TECNICA: TIntegerField
      DisplayLabel = 'Id ficha Tec.'
      FieldName = 'ID_FICHA_TECNICA'
    end
    object QMCabeceraTITULO_GIRO_CLIENTE: TFIBStringField
      DisplayLabel = 'Titulo Giro Cliente'
      FieldName = 'TITULO_GIRO_CLIENTE'
      Size = 150
    end
    object QMCabeceraNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object QMCabeceraDIR_NOMBRE_2: TFIBStringField
      DisplayLabel = 'Dir. Nombre 2'
      FieldName = 'DIR_NOMBRE_2'
      Size = 40
    end
    object QMCabeceraMATRICULA: TFIBStringField
      DisplayLabel = 'Matricula'
      FieldName = 'MATRICULA'
    end
    object QMCabeceraORIGEN_DOCUMENTO: TFIBStringField
      DisplayLabel = 'Orig. Doc.'
      FieldName = 'ORIGEN_DOCUMENTO'
      Size = 3
    end
    object QMCabeceraMODIFICA_DOC: TIntegerField
      DisplayLabel = 'Listado'
      FieldName = 'MODIFICA_DOC'
    end
    object QMCabeceraTIPO_INGRESOS: TIntegerField
      DisplayLabel = 'Tipo Ingresos'
      FieldName = 'TIPO_INGRESOS'
    end
    object QMCabeceraENTRADA_FACTURACION: TIntegerField
      DisplayLabel = 'Seleccion'
      FieldName = 'ENTRADA_FACTURACION'
    end
    object QMCabeceraGD_NROLINREF: TIntegerField
      DisplayLabel = 'G.D. Nro. Lin. Ref'
      FieldName = 'GD_NROLINREF'
    end
    object QMCabeceraGD_TPODOCREF: TFIBStringField
      DisplayLabel = 'G.D. T. Doc. Ref.'
      FieldName = 'GD_TPODOCREF'
      Size = 3
    end
    object QMCabeceraGD_FOLIOREF: TFIBStringField
      DisplayLabel = 'G.D. Folio Ref.'
      FieldName = 'GD_FOLIOREF'
    end
    object QMCabeceraGD_RUTOTR: TFIBStringField
      DisplayLabel = 'G.D. RUT'
      FieldName = 'GD_RUTOTR'
    end
    object QMCabeceraGD_FCHREF: TDateTimeField
      DisplayLabel = 'G.D. Fec. Ref.'
      FieldName = 'GD_FCHREF'
    end
    object QMCabeceraGD_CODREF: TIntegerField
      DisplayLabel = 'G.D. Cod. Ref.'
      FieldName = 'GD_CODREF'
    end
    object QMCabeceraGD_RAZONREF: TFIBStringField
      DisplayLabel = 'G.D. Razon Ref.'
      FieldName = 'GD_RAZONREF'
      Size = 100
    end
    object QMCabeceraOC_NROLINREF: TIntegerField
      DisplayLabel = 'O.C. Nro. Lin. Ref.'
      FieldName = 'OC_NROLINREF'
    end
    object QMCabeceraOC_TPODOCREF: TFIBStringField
      DisplayLabel = 'O.C. T. Doc. Ref.'
      FieldName = 'OC_TPODOCREF'
      Size = 3
    end
    object QMCabeceraOC_FOLIOREF: TFIBStringField
      DisplayLabel = 'O.C. Folio Ref.'
      FieldName = 'OC_FOLIOREF'
    end
    object QMCabeceraOC_RUTOTR: TFIBStringField
      DisplayLabel = 'O.C. RUT'
      FieldName = 'OC_RUTOTR'
    end
    object QMCabeceraOC_FCHREF: TDateTimeField
      DisplayLabel = 'O.C. Fec. Ref'
      FieldName = 'OC_FCHREF'
    end
    object QMCabeceraOC_CODREF: TIntegerField
      DisplayLabel = 'O.C. Cod. Ref.'
      FieldName = 'OC_CODREF'
    end
    object QMCabeceraOC_RAZONREF: TFIBStringField
      DisplayLabel = 'O.C. Razon Ref.'
      FieldName = 'OC_RAZONREF'
      Size = 100
    end
    object QMCabeceraVF_ESTADO_REGISTRO_ALTA: TFIBStringField
      DisplayLabel = 'Estado Verifactu'
      FieldName = 'VF_ESTADO_REGISTRO_ALTA'
    end
    object QMCabeceraVF_CODIGO_ERROR_ALTA: TFIBStringField
      DisplayLabel = 'Cod. Estado Verifactu'
      FieldName = 'VF_CODIGO_ERROR_ALTA'
    end
    object QMCabeceraVF_DESCRIPCION_ERROR_ALTA: TFIBStringField
      DisplayLabel = 'Desc. Estado Verifactu'
      FieldName = 'VF_DESCRIPCION_ERROR_ALTA'
      Size = 500
    end
    object QMCabeceraVF_ESTADO_REGISTRO_ANULACION: TFIBStringField
      DisplayLabel = 'Anulacion Verifactu'
      FieldName = 'VF_ESTADO_REGISTRO_ANULACION'
    end
    object QMCabeceraVF_CODIGO_ERROR_ANULACION: TFIBStringField
      DisplayLabel = 'Cod. Anulacion Verifactu'
      FieldName = 'VF_CODIGO_ERROR_ANULACION'
    end
    object QMCabeceraVF_DESCRIPCION_ERROR_ANULACION: TFIBStringField
      DisplayLabel = 'Desc. Anulacion Verifactu'
      FieldName = 'VF_DESCRIPCION_ERROR_ANULACION'
      Size = 500
    end
    object QMCabeceraVF_ESTADO_REGISTRO: TStringField
      DisplayLabel = 'Estado Verifactu'
      FieldKind = fkCalculated
      FieldName = 'VF_ESTADO_REGISTRO'
      Calculated = True
    end
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 160
    Top = 8
  end
  object xCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      'EMPRESA, TERCERO, CLIENTE, TITULO, TARIFA, AGENTE,'
      'DESCUENTO_PP, DESCUENTO_CIAL, FORMA_PAGO,'
      'TIPO_IRPF, NO_ALB_FAC, NO_VENTA_RIESGO,'
      'POR_FINANCIACION, RIESGO_AUT, RIESGO_ACT,'
      'TRANSPORTISTA, NOMBRE_COMERCIAL,'
      'TIPO_PORTES, POR_PORTES, I_PORTES, RANGO, INDICE,'
      'IDIOMA, MONEDA, ALBARAN_VALORADO, NOTAS, '
      'NOTAS_FACTURACION_KRI, ZONA, '
      'TIPO_DOC_IDENT, NIF, DIAS_ENTREGA, '
      'PEDIDO_VALORADO, MODO_IVA, TIPO_NCF, RECC,'
      'GRUPO_CUENTAS, FECHA_ENTREGA_X_STOCK,'
      'SU_REFERENCIA, PAIS_C2, IMPORTE_MINIMO_PORTE, '
      'GIRO_CLIENTE, DIR_NOMBRE, DIR_COMPLETA_N'
      'FROM VER_CLIENTES_CUENTAS'
      'WHERE'
      'EMPRESA=?EMPRESA'
      'AND EJERCICIO=?EJERCICIO'
      'AND CANAL=?CANAL'
      'AND CLIENTE=?CLIENTE')
    SelectSQL.Strings = (
      'SELECT'
      'EMPRESA, TERCERO, CLIENTE, TITULO, TARIFA, AGENTE,'
      'DESCUENTO_PP, DESCUENTO_CIAL, FORMA_PAGO,'
      'TIPO_IRPF, NO_ALB_FAC, NO_VENTA_RIESGO,'
      'POR_FINANCIACION, RIESGO_AUT, RIESGO_ACT,'
      'TRANSPORTISTA, NOMBRE_COMERCIAL,'
      'TIPO_PORTES, POR_PORTES, I_PORTES, RANGO, INDICE,'
      'IDIOMA, MONEDA, ALBARAN_VALORADO, NOTAS, '
      'NOTAS_FACTURACION_KRI, ZONA, '
      'PAIS_TERCERO, TIPO_DOC_IDENT, NIF, DIAS_ENTREGA, '
      'PEDIDO_VALORADO, MODO_IVA, TIPO_NCF, RECC,'
      'GRUPO_CUENTAS, FECHA_ENTREGA_X_STOCK,'
      'SU_REFERENCIA, PAIS_C2, IMPORTE_MINIMO_PORTE,'
      'ID_CLIENTE, GIRO_CLIENTE, DIR_COMPLETA_N'
      'FROM VER_CLIENTES_CUENTAS'
      'WHERE'
      'EMPRESA=?EMPRESA'
      'AND EJERCICIO=?EJERCICIO'
      'AND CANAL=?CANAL'
      'AND CLIENTE=?CLIENTE')
    UniDirectional = False
    DataSource = DSQMCabecera
    AfterOpen = xClienteAfterOpen
    BeforeClose = xClienteBeforeClose
    Left = 256
    Top = 8
  end
  object DSxCliente: TDataSource
    DataSet = xCliente
    Left = 360
    Top = 8
  end
  object xDirecciones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_DIRECCIONES'
      'WHERE TERCERO=?TERCERO AND DIRECCION=?DIRECCION')
    UniDirectional = False
    DataSource = DSQMCabecera
    Plan.Strings = (
      
        'PLAN JOIN (VER_DIRECCIONES SD INDEX (PK_SYS_TERCEROS_DIRECCIONES' +
        '),VER_DIRECCIONES SL INDEX (ID_LOCALIDADES))')
    Left = 256
    Top = 104
    object xDireccionesTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xDireccionesDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object xDireccionesTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      OnGetText = xDireccionesTITULOGetText
      Size = 109
    end
    object xDireccionesDIR_NOMBRE_2: TFIBStringField
      DisplayLabel = 'Dir. Nombre 2'
      FieldName = 'DIR_NOMBRE_2'
      Size = 40
    end
    object xDireccionesDIR_NOMBRE_3: TFIBStringField
      DisplayLabel = 'Dir. Nombre 3'
      FieldName = 'DIR_NOMBRE_3'
      Size = 40
    end
    object xDireccionesLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 40
    end
    object xDireccionesCOD_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'COD_POSTAL'
      Size = 10
    end
    object xDireccionesDIR_TRANSPORTISTA: TIntegerField
      DisplayLabel = 'Dir. Transportista'
      FieldName = 'DIR_TRANSPORTISTA'
    end
    object xDireccionesCLASE: TIntegerField
      DisplayLabel = 'Clase'
      FieldName = 'CLASE'
    end
  end
  object DSxDirecciones: TDataSource
    DataSet = xDirecciones
    Left = 360
    Top = 104
  end
  object xInfoActualizada: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    SelectSQL.Strings = (
      'WITH I'
      
        'AS (SELECT F.BULTOS, F.S_BASES, F.S_CUOTA_IVA, F.S_CUOTA_RE, F.L' +
        'IQUIDO, F.B_COMISION, F.I_COMISION, F.I_FINANCIACION,'
      
        '           F.B_DTO_LINEAS, F.I_DTO_LINEAS, F.ESTADO, F.I_PORTES,' +
        ' F.MODIFICA_DOC, F.I_BASE_RETENCION, F.I_RETENCION,'
      '           F.TOTAL_A_COBRAR, F.ID_S, F.C_TOTAL,'
      '           (SELECT SUM(D.B_DTO_LINEA)'
      '            FROM GES_DETALLES_S D'
      '            JOIN ART_ARTICULOS AA ON D.ID_A = AA.ID_A'
      '            WHERE'
      '            D.ID_S = F.ID_S AND'
      '            AA.INFLUYE_MARGEN = 1) SUMA_BASES,'
      '           (SELECT SUM(D.T_COSTE)'
      '            FROM GES_DETALLES_S D'
      '            JOIN ART_ARTICULOS AA ON D.ID_A = AA.ID_A'
      '            WHERE'
      '            D.ID_S = F.ID_S AND'
      '            AA.INFLUYE_MARGEN = 1) SUMA_COSTES,'
      '           (SELECT SUM(UNIDADES)'
      '            FROM GES_DETALLES_S'
      '            WHERE'
      '            ID_S = F.ID_S) SUM_UNIDADES,'
      '           (SELECT SUM(UNIDADES_SEC)'
      '            FROM GES_DETALLES_S'
      '            WHERE'
      '            ID_S = F.ID_S) SUM_UNIDADES_SEC,'
      '           (SELECT SUM(UNIDADES_LOGISTICAS)'
      '            FROM GES_DETALLES_S_FAC'
      '            WHERE'
      '            ID_S = F.ID_S) SUM_UNIDADES_LOGISTICAS,'
      '           (SELECT SUM(PESO_REAL)'
      '            FROM GES_DETALLES_S'
      '            WHERE'
      '            ID_S = F.ID_S) SUM_PESO,'
      '           (SELECT COUNT(LINEA)'
      '            FROM GES_DETALLES_S'
      '            WHERE'
      '            ID_S = F.ID_S) COUNT_LINEA, --'
      
        '           EC.RIESGO_AUT, EC.RIESGO_EMP, EC.RIESGO_ACT, EC.NO_VE' +
        'NTA_RIESGO,'
      '           --'
      
        '           COALESCE((SELECT SUM(D.LIQUIDO / D.UNIDADES * P.U_PEN' +
        'DIENTES)'
      '                     FROM GES_CABECERAS_S C'
      '                     JOIN GES_DETALLES_S D ON C.ID_S = D.ID_S'
      
        '                     JOIN GES_DETALLES_S_PED P ON D.ID_DETALLES_' +
        'S = P.ID_DETALLES_S'
      '                     WHERE'
      '                     C.EMPRESA = F.EMPRESA AND'
      '                     C.CANAL = F.CANAL AND'
      '                     C.TIPO = '#39'PEC'#39' AND'
      '                     C.ESTADO = 0 AND'
      '                     D.UNIDADES <> 0 AND'
      '                     P.U_PENDIENTES <> 0 AND'
      '                     C.CLIENTE = F.CLIENTE), 0) RIESGO_PED'
      '    FROM VER_CABECERAS_FACTURA F'
      
        '    JOIN EMP_CLIENTES EC ON EC.EMPRESA = F.EMPRESA AND EC.CLIENT' +
        'E = F.CLIENTE'
      '    WHERE'
      '    F.ID_S = :ID_S)'
      'SELECT I.*,'
      '       CASE'
      '         WHEN ((I.SUMA_BASES + I.I_PORTES) <> 0) THEN'
      
        '             (1 - (I.SUMA_COSTES / (I.SUMA_BASES + I.I_PORTES)))' +
        ' * 100'
      '         ELSE 0'
      '       END AS MARGEN,'
      '       CASE'
      '         WHEN (I.SUMA_BASES <> 0) THEN'
      '             (1 - (I.SUMA_COSTES / I.SUMA_BASES)) * 100'
      '         ELSE 0'
      '       END AS MARGEN_SIN_PORTES'
      'FROM I')
    UniDirectional = True
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMCabecera
    OnCalcFields = xInfoActualizadaCalcFields
    Left = 40
    Top = 248
    object xInfoActualizadaBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object xInfoActualizadaI_DTO_LINEAS: TFloatField
      DisplayLabel = 'Imp. Dto. Lineas'
      FieldName = 'I_DTO_LINEAS'
    end
    object xInfoActualizadaS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object xInfoActualizadaS_CUOTA_IVA: TFloatField
      DisplayLabel = 'S. Cuota IVA'
      FieldName = 'S_CUOTA_IVA'
    end
    object xInfoActualizadaS_CUOTA_RE: TFloatField
      DisplayLabel = 'S. Couta Ret.'
      FieldName = 'S_CUOTA_RE'
    end
    object xInfoActualizadaB_DTO_LINEAS: TFloatField
      DisplayLabel = 'B. Dto. Lineas'
      FieldName = 'B_DTO_LINEAS'
    end
    object xInfoActualizadaB_COMISION: TFloatField
      DisplayLabel = 'B. Comision'
      FieldName = 'B_COMISION'
    end
    object xInfoActualizadaI_COMISION: TFloatField
      DisplayLabel = 'Imp. Comision'
      FieldName = 'I_COMISION'
    end
    object xInfoActualizadaI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Financ.'
      FieldName = 'I_FINANCIACION'
    end
    object xInfoActualizadaLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xInfoActualizadaI_BASE_RETENCION: TFloatField
      DisplayLabel = 'Imp. Base Ret.'
      FieldName = 'I_BASE_RETENCION'
    end
    object xInfoActualizadaI_RETENCION: TFloatField
      DisplayLabel = 'Imp. Ret.'
      FieldName = 'I_RETENCION'
    end
    object xInfoActualizadaTOTAL_A_COBRAR: TFloatField
      DisplayLabel = 'Total a Cobrar'
      FieldName = 'TOTAL_A_COBRAR'
    end
    object xInfoActualizadaESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xInfoActualizadaID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object xInfoActualizadaSUM_UNIDADES: TFloatField
      DisplayLabel = 'Suma Uds.'
      FieldName = 'SUM_UNIDADES'
    end
    object xInfoActualizadaSUM_PESO: TFloatField
      DisplayLabel = 'Suma Peso'
      FieldName = 'SUM_PESO'
    end
    object xInfoActualizadaI_PORTES: TFloatField
      DisplayLabel = 'Imp. Portes'
      FieldName = 'I_PORTES'
    end
    object xInfoActualizadaMODIFICA_DOC: TIntegerField
      DisplayLabel = 'Modif. Doc.'
      FieldName = 'MODIFICA_DOC'
    end
    object xInfoActualizadaTITULO_ESTADO: TStringField
      DisplayLabel = 'Estado'
      FieldKind = fkCalculated
      FieldName = 'TITULO_ESTADO'
      OnGetText = xInfoActualizadaTITULO_ESTADOGetText
      Size = 40
      Calculated = True
    end
    object xInfoActualizadaC_TOTAL: TFloatField
      DisplayLabel = 'Coste Total'
      FieldName = 'C_TOTAL'
    end
    object xInfoActualizadaMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
    object xInfoActualizadaMARGEN_SIN_PORTES: TFloatField
      DisplayLabel = 'Margen s/Portes'
      FieldName = 'MARGEN_SIN_PORTES'
    end
    object xInfoActualizadaRIESGO_ACT: TFloatField
      DisplayLabel = 'Riesgo Actual'
      FieldName = 'RIESGO_ACT'
    end
    object xInfoActualizadaRIESGO_AUT: TFloatField
      DisplayLabel = 'Riesgo Autorizado'
      FieldName = 'RIESGO_AUT'
    end
    object xInfoActualizadaNO_VENTA_RIESGO: TIntegerField
      DisplayLabel = 'No Superar Riesgo'
      FieldName = 'NO_VENTA_RIESGO'
    end
    object xInfoActualizadaRIESGO_PED: TFloatField
      DisplayLabel = 'Riesgo Pedido'
      FieldName = 'RIESGO_PED'
    end
    object xInfoActualizadaRIESGO_EMP: TFloatField
      DisplayLabel = 'Riesgo Empresa'
      FieldName = 'RIESGO_EMP'
    end
    object xInfoActualizadaRIESGO_DISPONIBLE: TFloatField
      DisplayLabel = 'Riesgo Disponible'
      FieldKind = fkCalculated
      FieldName = 'RIESGO_DISPONIBLE'
      Calculated = True
    end
    object xInfoActualizadaCOUNT_LINEA: TIntegerField
      DisplayLabel = 'Cant. Lineas'
      FieldName = 'COUNT_LINEA'
    end
    object xInfoActualizadaSUMA_BASES: TFloatField
      DisplayLabel = 'Suma Bases'
      FieldName = 'SUMA_BASES'
    end
    object xInfoActualizadaSUMA_COSTES: TFloatField
      DisplayLabel = 'Suma Costes'
      FieldName = 'SUMA_COSTES'
    end
    object xInfoActualizadaSUM_UNIDADES_SEC: TFloatField
      DisplayLabel = 'Suma Uds. Sec.'
      FieldName = 'SUM_UNIDADES_SEC'
    end
    object xInfoActualizadaSUM_UNIDADES_LOGISTICAS: TFloatField
      DisplayLabel = 'Suma Uds. Log.'
      FieldName = 'SUM_UNIDADES_LOGISTICAS'
    end
  end
  object DSxInfoActualizada: TDataSource
    DataSet = xInfoActualizada
    Left = 160
    Top = 152
  end
  object EntornoDoc: TEntornoFind2000
    Empresa = 0
    Ejercicio = 0
    Canal = 0
    Tercero = 0
    Cliente = 0
    Pgc = 0
    Left = 760
    Top = 8
  end
  object xCampanyas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_CAMPANYAS_ACTIVAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CAMPANYA=?CAMPANYA')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 256
    Top = 152
  end
  object DSxCampanyas: TDataSource
    DataSet = xCampanyas
    Left = 360
    Top = 152
  end
  object xFormasPago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_GES_FP'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  FORMA_PAGO=?FORMA_PAGO ')
    SelectSQL.Strings = (
      
        'SELECT TITULO, PRONTO_PAGO, HEREDA_FINANCIACION, PAGO_AUTOMATICO' +
        ', TIPO_EFECTO, SIN_RECIBOS'
      'FROM CON_CUENTAS_GES_FP'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'FORMA_PAGO=?FORMA_PAGO')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 256
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 760
    Top = 56
  end
  object QSPProcedencia: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM  G_PROCEDENCIA_DOCUMENTO_LINEA'
      '(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMDetalle
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 200
  end
  object DSQSPProcedencia: TDataSource
    DataSet = QSPProcedencia
    Left = 160
    Top = 200
  end
  object SPRefrescaDetalle: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure ut_refresca_detalle_s (?empresa,?ejercicio,?ca' +
        'nal,'
      '?serie,?tipo,?rig,?cliente,?tarifa,?fecha,?moneda)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 560
    Top = 104
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT '
      'ARTICULO, ID_A, SERIALIZADO, LOTES, '
      'SERIALIZADO_KRI, LOTES_KRI, ABIERTO,'
      'CONTROL_STOCK, COSTE_ADICIONAL,'
      'ANTICIPO, ANTICIPO_PREG_DATOS, ANTICIPO_CONTADO,'
      'VIRTUAL, TIPO_ARTICULO_TYC, COSTE_ADICIONAL,'
      'MULTIPLO_1, MULTIPLO_2, MULTIPLO_3, MULTIPLO_4,'
      'FACTOR_ESCALA, UD_MINIMO_COMPRA, UD_MINIMO_VENTA,'
      'UNIDADES, CONTROLA_MEDIDAS, '
      'PVP_POR_UD_SECUNDARIA, '
      'DEFECTO_UD_SECUNDARIA'
      'FROM ART_ARTICULOS'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'ARTICULO=?ARTICULO'
      '')
    SelectSQL.Strings = (
      
        'SELECT A.ARTICULO, A.ID_A, A.TITULO_LARGO, A.SERIALIZADO, A.LOTE' +
        'S, A.SERIALIZADO_KRI, A.LOTES_KRI, A.ABIERTO, A.CONTROL_STOCK,'
      
        '       A.COSTE_ADICIONAL, A.ANTICIPO, A.ANTICIPO_PREG_DATOS, A.A' +
        'NTICIPO_CONTADO, A.VIRTUAL, A.TIPO_ARTICULO_TYC,'
      
        '       A.MULTIPLO_1, A.MULTIPLO_2, A.MULTIPLO_3, A.MULTIPLO_4, A' +
        '.FACTOR_ESCALA, A.UD_MINIMO_COMPRA,'
      
        '       A.UD_MINIMO_VENTA, A.UNIDADES, A.CONTROLA_MEDIDAS, A.PVP_' +
        'POR_UD_SECUNDARIA, A.DEFECTO_UD_SECUNDARIA,'
      
        '       A.TIPO_REGISTRO_FITOSANITARIO, A.TIPO_ARTICULO, A.PESO, A' +
        '.FACTOR_UNIDAD, A.BAJA, A.ALFA_1, A.ALFA_2, A.ALFA_3,'
      
        '       A.ALFA_4, A.ALFA_5, A.ALFA_6, A.ALFA_7, A.ALFA_8, U.SIGNO' +
        ', A.NO_APLICA_DESC_LINEA_CLIENTE, A.Z_COM_CORTE, A.PROYECTO'
      'FROM ART_ARTICULOS A'
      'JOIN SYS_UNIDADES_ARTICULOS U ON A.UNIDADES = U.TIPO'
      'WHERE'
      'A.EMPRESA = :EMPRESA AND'
      'A.ARTICULO = :ARTICULO')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 456
    Top = 8
  end
  object QMNIF: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_CABECERAS_S_FAC_NIF'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO GES_CABECERAS_S_FAC_NIF'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,NOMBRE,NIF,DIRECCION' +
        ',C_POSTAL,PROVINCIA,'#13#10'ID_S,PAIS,LOCALIDAD,TELEFONO01,TELEFONO02,' +
        'TELEFAX,EMAIL,NOTAS,COLONIA,TERCERO,'#13#10'CARNET_APLICADOR,NOMBRE_CO' +
        'NTACTO,COMO_NOS_CONOCIERON,TIPO_DOC_IDENT,PAIS_DOC_IDENT)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?NOMBRE,?NIF,?' +
        'DIRECCION,?C_POSTAL,?PROVINCIA,'#13#10'?ID_S,?PAIS,?LOCALIDAD,?TELEFON' +
        'O01,?TELEFONO02,?TELEFAX,?EMAIL,?NOTAS,?COLONIA,?TERCERO,'#13#10'?CARN' +
        'ET_APLICADOR,?NOMBRE_CONTACTO,?COMO_NOS_CONOCIERON,?TIPO_DOC_IDE' +
        'NT,?PAIS_DOC_IDENT)')
    RefreshSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_FAC_NIF'
      'WHERE'
      'TIPO = ?TIPO AND /*Para evitar colisiones con ticket*/'
      'ID_S = ?ID_S')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_FAC_NIF'
      'WHERE'
      'TIPO = ?TIPO AND /*Para evitar colisiones con ticket*/'
      'ID_S = ?ID_S')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_S_FAC_NIF'
      'SET'
      '  NOMBRE=?NOMBRE '
      '  ,NIF=?NIF '
      '  ,DIRECCION=?DIRECCION '
      '  ,C_POSTAL=?C_POSTAL '
      '  ,PROVINCIA=?PROVINCIA '
      '  ,ID_S=?ID_S '
      '  ,PAIS=?PAIS '
      '  ,LOCALIDAD=?LOCALIDAD '
      '  ,TELEFONO01=?TELEFONO01 '
      '  ,TELEFONO02=?TELEFONO02 '
      '  ,TELEFAX=?TELEFAX '
      '  ,EMAIL=?EMAIL '
      '  ,NOTAS=?NOTAS '
      '  ,COLONIA=?COLONIA '
      '  ,TERCERO=?TERCERO '
      '  ,CARNET_APLICADOR=?CARNET_APLICADOR '
      '  ,NOMBRE_CONTACTO=?NOMBRE_CONTACTO '
      '  ,COMO_NOS_CONOCIERON=?COMO_NOS_CONOCIERON '
      '  ,TIPO_DOC_IDENT=?TIPO_DOC_IDENT '
      '  ,PAIS_DOC_IDENT=?PAIS_DOC_IDENT '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    DataSource = DSQMCabecera
    Plan.Strings = (
      ' ')
    AfterPost = Graba
    OnNewRecord = QMNIFNewRecord
    ClavesPrimarias.Strings = (
      'TIPO '
      'ID_S'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_S_FAC_NIF'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 104
    object QMNIFEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMNIFEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMNIFCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMNIFSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMNIFTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMNIFRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMNIFNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object QMNIFDIRECCION: TFIBStringField
      DisplayLabel = 'Direccion'
      DisplayWidth = 100
      FieldName = 'DIRECCION'
      Size = 100
    end
    object QMNIFC_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'C_POSTAL'
      Size = 10
    end
    object QMNIFPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object QMNIFNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object QMNIFPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMNIFID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMNIFLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 40
    end
    object QMNIFTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel. 1'
      DisplayWidth = 15
      FieldName = 'TELEFONO01'
      Size = 15
    end
    object QMNIFTELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      DisplayWidth = 15
      FieldName = 'TELEFONO02'
      Size = 15
    end
    object QMNIFTELEFAX: TFIBStringField
      DisplayLabel = 'Fax'
      DisplayWidth = 15
      FieldName = 'TELEFAX'
      Size = 15
    end
    object QMNIFEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object QMNIFNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMNIFCOLONIA: TFIBStringField
      DisplayLabel = 'Colonia'
      FieldName = 'COLONIA'
      Size = 40
    end
    object QMNIFTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMNIFCARNET_APLICADOR: TFIBStringField
      DisplayLabel = 'Carnet Aplicador'
      FieldName = 'CARNET_APLICADOR'
    end
    object QMNIFNOMBRE_CONTACTO: TFIBStringField
      DisplayLabel = 'Nombre Contacto'
      FieldName = 'NOMBRE_CONTACTO'
      Size = 60
    end
    object QMNIFCOMO_NOS_CONOCIERON: TIntegerField
      DisplayLabel = 'Como nos conocieron'
      FieldName = 'COMO_NOS_CONOCIERON'
    end
    object QMNIFTIPO_DOC_IDENT: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'TIPO_DOC_IDENT'
      Size = 3
    end
    object QMNIFPAIS_DOC_IDENT: TFIBStringField
      DisplayLabel = 'Pais Doc.'
      FieldName = 'PAIS_DOC_IDENT'
      Size = 3
    end
  end
  object DSQMNIF: TDataSource
    DataSet = QMNIF
    Left = 160
    Top = 104
  end
  object QMCabecerasCostes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_CABECERAS_COSTES'
      'WHERE'
      '  RIG=?old_RIG AND '
      '  TIPO=?old_TIPO AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_CABECERAS_COSTES'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,DIGITO_1,DIGITO_2,DIGI' +
        'TO_3,DIGITO_4,DIGITO_5)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?DIGITO_1,?DIGIT' +
        'O_2,?DIGITO_3,?DIGITO_4,?DIGITO_5)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_COSTES'
      'WHERE'
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_COSTES'
      '  WHERE'
      '               EMPRESA=?EMPRESA AND'
      '               EJERCICIO=?EJERCICIO AND'
      '               CANAL=?CANAL AND'
      '               SERIE=?SERIE AND'
      '               TIPO='#39'FAC'#39' AND'
      '               RIG=?RIG ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_COSTES'
      'SET'
      '  DIGITO_1=?DIGITO_1 '
      '  ,DIGITO_2=?DIGITO_2 '
      '  ,DIGITO_3=?DIGITO_3 '
      '  ,DIGITO_4=?DIGITO_4 '
      '  ,DIGITO_5=?DIGITO_5 '
      'WHERE'
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMCabecera
    ClavesPrimarias.Strings = (
      'RIG '
      'TIPO '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_COSTES'
    UpdateTransaction = TUpdate
    Left = 560
    Top = 56
    object QMCabecerasCostesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabecerasCostesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCabecerasCostesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCabecerasCostesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabecerasCostesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCabecerasCostesRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCabecerasCostesDIGITO_1: TFIBStringField
      DisplayLabel = 'Dig. 1'
      FieldName = 'DIGITO_1'
      Size = 3
    end
    object QMCabecerasCostesDIGITO_2: TFIBStringField
      DisplayLabel = 'Dig. 2'
      FieldName = 'DIGITO_2'
      Size = 3
    end
    object QMCabecerasCostesDIGITO_3: TFIBStringField
      DisplayLabel = 'Dig. 3'
      FieldName = 'DIGITO_3'
      Size = 3
    end
    object QMCabecerasCostesDIGITO_4: TFIBStringField
      DisplayLabel = 'Dig. 4'
      FieldName = 'DIGITO_4'
      Size = 3
    end
    object QMCabecerasCostesDIGITO_5: TFIBStringField
      DisplayLabel = 'Dig. 5'
      FieldName = 'DIGITO_5'
      Size = 3
    end
  end
  object QMDetallesCostes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_DETALLES_COSTES'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  TIPO=?old_TIPO AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_DETALLES_COSTES'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,DIGITO_1,DIGITO_' +
        '2,DIGITO_3,DIGITO_4,DIGITO_5)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?DIGITO_1' +
        ',?DIGITO_2,?DIGITO_3,?DIGITO_4,?DIGITO_5)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_DETALLES_COSTES'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_DETALLES_COSTES'
      '  WHERE'
      '               EMPRESA=?EMPRESA AND'
      '               EJERCICIO=?EJERCICIO AND'
      '               CANAL=?CANAL AND'
      '               SERIE=?SERIE AND'
      '               TIPO='#39'FAC'#39' AND'
      '               RIG=?RIG AND'
      #9'LINEA=?LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_COSTES'
      'SET'
      '  DIGITO_1=?DIGITO_1 '
      '  ,DIGITO_2=?DIGITO_2 '
      '  ,DIGITO_3=?DIGITO_3 '
      '  ,DIGITO_4=?DIGITO_4 '
      '  ,DIGITO_5=?DIGITO_5 '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  TIPO=?TIPO AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMDetalle
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'TIPO '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_DETALLES_COSTES'
    UpdateTransaction = TUpdate
    Left = 456
    Top = 56
    object QMDetallesCostesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetallesCostesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetallesCostesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetallesCostesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetallesCostesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetallesCostesRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDetallesCostesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetallesCostesDIGITO_1: TFIBStringField
      DisplayLabel = 'Dig. 1'
      FieldName = 'DIGITO_1'
      Size = 3
    end
    object QMDetallesCostesDIGITO_2: TFIBStringField
      DisplayLabel = 'Dig. 2'
      FieldName = 'DIGITO_2'
      Size = 3
    end
    object QMDetallesCostesDIGITO_3: TFIBStringField
      DisplayLabel = 'Dig. 3'
      FieldName = 'DIGITO_3'
      Size = 3
    end
    object QMDetallesCostesDIGITO_4: TFIBStringField
      DisplayLabel = 'Dig. 4'
      FieldName = 'DIGITO_4'
      Size = 3
    end
    object QMDetallesCostesDIGITO_5: TFIBStringField
      DisplayLabel = 'Dig. 5'
      FieldName = 'DIGITO_5'
      Size = 3
    end
  end
  object xCuentaArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT ART.CTA_VENTAS, CON.CENTRO_COSTE'
      'FROM CON_CUENTAS_GES_ART ART'
      'JOIN CON_CUENTAS CON'
      'ON'
      'ART.EMPRESA = CON.EMPRESA AND'
      'ART.EJERCICIO = CON.EJERCICIO AND'
      'ART.CANAL = CON.CANAL AND'
      'ART.CTA_VENTAS = CON.CUENTA AND'
      'ART.CTA_VENTAS_PGC = CON.PGC'
      'WHERE'
      'ART.EMPRESA = ?EMPRESA AND'
      'ART.EJERCICIO = ?EJERCICIO AND'
      'ART.CANAL = ?CANAL AND'
      'ART.ARTICULO = ?ARTICULO')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 560
    Top = 8
    object xCuentaArticuloCTA_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Ventas'
      FieldName = 'CTA_VENTAS'
      Size = 15
    end
    object xCuentaArticuloCENTRO_COSTE: TIntegerField
      DisplayLabel = 'Centro Coste'
      FieldName = 'CENTRO_COSTE'
    end
  end
  object xTipoIRPF: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO,P_IRPF,BASE FROM SYS_TIPO_IRPF'
      'WHERE TIPO = ?TIPO_IRPF AND'
      'PAIS = ?PAIS')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 256
    Top = 200
  end
  object DSxTipoIRPF: TDataSource
    DataSet = xTipoIRPF
    Left = 360
    Top = 200
  end
  object xRangos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from emp_rangos'
      'where empresa=?empresa and rango=?rango')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 256
    Top = 248
    object FIBStringField1: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxRangos: TDataSource
    DataSet = xRangos
    Left = 360
    Top = 248
  end
  object xIndices: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from emp_rangos_indices'
      'where empresa=?empresa and rango=?rango and indice=?indice')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 256
    Top = 296
    object FIBStringField2: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxIndices: TDataSource
    DataSet = xIndices
    Left = 360
    Top = 296
  end
  object DSQMDetalleCertificado: TDataSource
    DataSet = QMDetalleCertificado
    Left = 160
    Top = 248
  end
  object xCertificadoAnt: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT SUM(B_IMPONIBLE) AS IMPORTE'
      'FROM GES_DETALLES_S'
      'WHERE'
      'ID_S = :ID_S AND'
      'CERTIFICADO = 1 AND'
      'CERT_NEGATIVO = 0')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 40
    Top = 296
    object xCertificadoAntIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
  end
  object DSxCertificadoAnt: TDataSource
    DataSet = xCertificadoAnt
    Left = 160
    Top = 296
  end
  object QMDetalleCertificado: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DETALLE_FACTURA'
      'WHERE'
      '  ID_DETALLES_S = ?ID_DETALLES_S')
    SelectSQL.Strings = (
      
        'SELECT EJERCICIO,LINEA,ARTICULO,LINEA_RELACION,TITULO,PRECIO,UNI' +
        'DADES,DESCUENTO,'
      
        '            DESCUENTO_2, DESCUENTO_3,B_IMPONIBLE,UNIDADES_SEC,UN' +
        'IDADES_EXT '
      'FROM VER_DETALLE_FACTURA'
      'WHERE'
      '  ID_S = ?ID_S AND CERTIFICADO = 1 AND CERT_NEGATIVO = 0'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMCabecera
    Plan.Strings = (
      
        'PLAN JOIN (VER_DETALLE_FACTURA DET INDEX (GES_DETALLES_S_CAB_ID)' +
        ','
      
        '             VER_DETALLE_FACTURA FAC INDEX (GES_DETALLES_S_FAC_I' +
        'D)) ')
    ClavesPrimarias.Strings = (
      'ID_DETALLES_S'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_DETALLE_FACTURA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 152
    object QMDetalleCertificadoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
    end
    object QMDetalleCertificadoLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleCertificadoARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDetalleCertificadoLINEA_RELACION: TIntegerField
      DisplayLabel = 'L.R.'
      FieldName = 'LINEA_RELACION'
    end
    object QMDetalleCertificadoTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMDetalleCertificadoPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDetalleCertificadoUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMDetalleCertificadoDESCUENTO: TFloatField
      DisplayLabel = 'Desc.'
      FieldName = 'DESCUENTO'
    end
    object QMDetalleCertificadoDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object QMDetalleCertificadoDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object QMDetalleCertificadoB_IMPONIBLE: TFloatField
      DisplayLabel = 'Base Imp.'
      FieldName = 'B_IMPONIBLE'
    end
    object QMDetalleCertificadoUNIDADES_SEC: TFloatField
      DisplayLabel = 'Uds. Sec.'
      FieldName = 'UNIDADES_SEC'
    end
    object QMDetalleCertificadoUNIDADES_EXT: TFloatField
      DisplayLabel = 'Uds. Ext.'
      FieldName = 'UNIDADES_EXT'
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
    Left = 760
    Top = 104
  end
  object xTipoNCF: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM Z_SYS_TIPO_NCF'
      'WHERE'
      'TIPO_NCF=?TIPO_NCF')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_TIPO_NCF '
      'WHERE TIPO_DOCUMENTO IN (0, 2)'
      'ORDER BY TIPO_NCF')
    UniDirectional = False
    Left = 256
    Top = 344
    object xTipoNCFTIPO_NCF: TIntegerField
      DisplayLabel = 'Tipo NCF'
      FieldName = 'TIPO_NCF'
    end
    object xTipoNCFTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxTipoNCF: TDataSource
    DataSet = xTipoNCF
    Left = 360
    Top = 344
  end
  object QMFirmas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT ID_FIRMA, NOMBRE, NIF FROM GES_FIRMAS'
      'WHERE'
      'TIPO = :TIPO AND'
      'ID_DOC = :ID_S AND'
      'OCTET_LENGTH(COALESCE(FIRMA, '#39#39')) > 10'
      'ORDER BY ID_FIRMA')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 256
    Top = 392
    object QMFirmasID_FIRMA: TIntegerField
      DisplayLabel = 'Id Firma'
      FieldName = 'ID_FIRMA'
    end
    object QMFirmasNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object QMFirmasNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
  end
  object DSQMFirmas: TDataSource
    DataSet = QMFirmas
    Left = 360
    Top = 392
  end
  object QMCabeceraFEChile: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_CABECERAS_S_FE_CHL WHERE  ID_S = :ID_S')
    InsertSQL.Strings = (
      'INSERT INTO GES_CABECERAS_S_FE_CHL ('
      
        'ID_S, INDSERVICIO, MNTBRUTO, TPOTRANCOMPRA, TPOTRANVENTA, FMAPAG' +
        'O, FCHCANCEL, MNTCANCEL, SALDOINSOL, MEDIOPAGO,'
      
        ' TIPOCTAPAGO, NUMCTAPAGO, BCOPAGO, TERMPAGOCDG, TERMPAGOGLOSA, T' +
        'ERMPAGODIAS, FCHVENC, TIPOFACTESP, GIROEMIS, RUTEMISOR,'
      
        ' RZNSOC, TELEFONO, CORREOEMISOR, ACTECO, SUCURSAL, CDGSIISUCUR, ' +
        'DIRORIGEN, CMNAORIGEN, CIUDADORIGEN, CDGVENDEDOR,'
      
        ' RUTMANDANTE, RUTRECEP, CDGINTRECEP, RZNSOCRECEP, NUMID, NACIONA' +
        'LIDAD, TIPODOCID, GIRORECEP, CONTACTO, CORREORECEP,'
      
        ' DIRRECEP, CMNARECEP, CIUDADRECEP, DIRPOSTAL, CMNAPOSTAL, CIUDAD' +
        'POSTAL, RUTSOLICITA, PATENTE, RUTTRANS, RUTCHOFER,'
      
        ' NOMBRECHOFER, DIRDEST, CMNADEST, CIUDADDEST, MNTNETO, MNTEXE, M' +
        'NTBASE, MNTMARGENCOM, TASAIVA, IVA, VAPROP, IVATERC,'
      
        ' CREDEC, GRNTDEP, MNTTOTAL, MONTONF, MONTOPERIODO, SALDOANTERIOR' +
        ', VLRPAGAR, TPOMONEDA, TPOCAMBIO, MNTNETOOTRMNDA,'
      
        ' MNTEXEOTRMNDA, MNTFAECARNEOTRMNDA, MNTMARGCOMOTRMNDA, IVAOTRMND' +
        'A, VANORETOTRMNDA, MNTTOTOTRMNDA)'
      'VALUES ('
      
        ':ID_S, :INDSERVICIO, :MNTBRUTO, :TPOTRANCOMPRA, :TPOTRANVENTA, :' +
        'FMAPAGO, :FCHCANCEL, :MNTCANCEL, :SALDOINSOL,'
      
        ' :MEDIOPAGO, :TIPOCTAPAGO, :NUMCTAPAGO, :BCOPAGO, :TERMPAGOCDG, ' +
        ':TERMPAGOGLOSA, :TERMPAGODIAS, :FCHVENC, :TIPOFACTESP,'
      
        ' :GIROEMIS, :RUTEMISOR, :RZNSOC, :TELEFONO, :CORREOEMISOR, :ACTE' +
        'CO, :SUCURSAL, :CDGSIISUCUR, :DIRORIGEN, :CMNAORIGEN,'
      
        ' :CIUDADORIGEN, :CDGVENDEDOR, :RUTMANDANTE, :RUTRECEP, :CDGINTRE' +
        'CEP, :RZNSOCRECEP, :NUMID, :NACIONALIDAD, :TIPODOCID,'
      
        ' :GIRORECEP, :CONTACTO, :CORREORECEP, :DIRRECEP, :CMNARECEP, :CI' +
        'UDADRECEP, :DIRPOSTAL, :CMNAPOSTAL, :CIUDADPOSTAL,'
      
        ' :RUTSOLICITA, :PATENTE, :RUTTRANS, :RUTCHOFER, :NOMBRECHOFER, :' +
        'DIRDEST, :CMNADEST, :CIUDADDEST, :MNTNETO, :MNTEXE,'
      
        ' :MNTBASE, :MNTMARGENCOM, :TASAIVA, :IVA, :VAPROP, :IVATERC, :CR' +
        'EDEC, :GRNTDEP, :MNTTOTAL, :MONTONF, :MONTOPERIODO,'
      
        ' :SALDOANTERIOR, :VLRPAGAR, :TPOMONEDA, :TPOCAMBIO, :MNTNETOOTRM' +
        'NDA, :MNTEXEOTRMNDA, :MNTFAECARNEOTRMNDA,'
      
        ' :MNTMARGCOMOTRMNDA, :IVAOTRMNDA, :VANORETOTRMNDA, :MNTTOTOTRMND' +
        'A)  ')
    RefreshSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_FE_CHL WHERE ID_S = :ID_S')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_FE_CHL WHERE ID_S = :ID_S')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_S_FE_CHL'
      'SET'
      'INDSERVICIO = :INDSERVICIO,'
      'MNTBRUTO = :MNTBRUTO,'
      'TPOTRANCOMPRA = :TPOTRANCOMPRA,'
      'TPOTRANVENTA = :TPOTRANVENTA,'
      'FMAPAGO = :FMAPAGO,'
      'FCHCANCEL = :FCHCANCEL,'
      'MNTCANCEL = :MNTCANCEL,'
      'SALDOINSOL = :SALDOINSOL,'
      'MEDIOPAGO = :MEDIOPAGO,'
      'TIPOCTAPAGO = :TIPOCTAPAGO,'
      'NUMCTAPAGO = :NUMCTAPAGO,'
      'BCOPAGO = :BCOPAGO,'
      'TERMPAGOCDG = :TERMPAGOCDG,'
      'TERMPAGOGLOSA = :TERMPAGOGLOSA,'
      'TERMPAGODIAS = :TERMPAGODIAS,'
      'FCHVENC = :FCHVENC,'
      'TIPOFACTESP = :TIPOFACTESP,'
      'GIROEMIS = :GIROEMIS,'
      'RUTEMISOR = :RUTEMISOR,'
      'RZNSOC = :RZNSOC,'
      'TELEFONO = :TELEFONO,'
      'CORREOEMISOR = :CORREOEMISOR,'
      'ACTECO = :ACTECO,'
      'SUCURSAL = :SUCURSAL,'
      'CDGSIISUCUR = :CDGSIISUCUR,'
      'DIRORIGEN = :DIRORIGEN,'
      'CMNAORIGEN = :CMNAORIGEN,'
      'CIUDADORIGEN = :CIUDADORIGEN,'
      'CDGVENDEDOR = :CDGVENDEDOR,'
      'RUTMANDANTE = :RUTMANDANTE,'
      'CDGINTRECEP = :CDGINTRECEP,'
      'RZNSOCRECEP = :RZNSOCRECEP,'
      'NUMID = :NUMID,'
      'NACIONALIDAD = :NACIONALIDAD,'
      'TIPODOCID = :TIPODOCID,'
      'GIRORECEP = :GIRORECEP,'
      'CONTACTO = :CONTACTO,'
      'CORREORECEP = :CORREORECEP,'
      'DIRRECEP = :DIRRECEP,'
      'CMNARECEP = :CMNARECEP,'
      'CIUDADRECEP = :CIUDADRECEP,'
      'DIRPOSTAL = :DIRPOSTAL,'
      'CMNAPOSTAL = :CMNAPOSTAL,'
      'CIUDADPOSTAL = :CIUDADPOSTAL,'
      'RUTSOLICITA = :RUTSOLICITA,'
      'PATENTE = :PATENTE,'
      'RUTTRANS = :RUTTRANS,'
      'RUTCHOFER = :RUTCHOFER,'
      'NOMBRECHOFER = :NOMBRECHOFER,'
      'DIRDEST = :DIRDEST,'
      'CMNADEST = :CMNADEST,'
      'CIUDADDEST = :CIUDADDEST,'
      'MNTNETO = :MNTNETO,'
      'MNTEXE = :MNTEXE,'
      'MNTBASE = :MNTBASE,'
      'MNTMARGENCOM = :MNTMARGENCOM,'
      'TASAIVA = :TASAIVA,'
      'IVA = :IVA,'
      'VAPROP = :VAPROP,'
      'IVATERC = :IVATERC,'
      'CREDEC = :CREDEC,'
      'GRNTDEP = :GRNTDEP,'
      'MNTTOTAL = :MNTTOTAL,'
      'MONTONF = :MONTONF,'
      'MONTOPERIODO = :MONTOPERIODO,'
      'SALDOANTERIOR = :SALDOANTERIOR,'
      'VLRPAGAR = :VLRPAGAR,'
      'TPOMONEDA = :TPOMONEDA,'
      'TPOCAMBIO = :TPOCAMBIO,'
      'MNTNETOOTRMNDA = :MNTNETOOTRMNDA,'
      'MNTEXEOTRMNDA = :MNTEXEOTRMNDA,'
      'MNTFAECARNEOTRMNDA = :MNTFAECARNEOTRMNDA,'
      'MNTMARGCOMOTRMNDA = :MNTMARGCOMOTRMNDA,'
      'IVAOTRMNDA = :IVAOTRMNDA,'
      'VANORETOTRMNDA = :VANORETOTRMNDA,'
      'MNTTOTOTRMNDA = :MNTTOTOTRMNDA'
      'WHERE'
      'ID_S = :ID_S   ')
    DataSource = DSQMCabecera
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_S_FE_CHL'
    UpdateTransaction = TUpdate
    Left = 40
    Top = 344
    object QMCabeceraFEChileID_S: TIntegerField
      FieldName = 'ID_S'
    end
    object QMCabeceraFEChileINDSERVICIO: TIntegerField
      FieldName = 'INDSERVICIO'
    end
    object QMCabeceraFEChileMNTBRUTO: TFloatField
      FieldName = 'MNTBRUTO'
    end
    object QMCabeceraFEChileTPOTRANCOMPRA: TIntegerField
      FieldName = 'TPOTRANCOMPRA'
    end
    object QMCabeceraFEChileTPOTRANVENTA: TIntegerField
      FieldName = 'TPOTRANVENTA'
    end
    object QMCabeceraFEChileFMAPAGO: TIntegerField
      FieldName = 'FMAPAGO'
    end
    object QMCabeceraFEChileFCHCANCEL: TDateTimeField
      FieldName = 'FCHCANCEL'
    end
    object QMCabeceraFEChileMNTCANCEL: TFloatField
      FieldName = 'MNTCANCEL'
    end
    object QMCabeceraFEChileSALDOINSOL: TFloatField
      FieldName = 'SALDOINSOL'
    end
    object QMCabeceraFEChileMEDIOPAGO: TFIBStringField
      FieldName = 'MEDIOPAGO'
      Size = 15
    end
    object QMCabeceraFEChileTIPOCTAPAGO: TFIBStringField
      FieldName = 'TIPOCTAPAGO'
      Size = 15
    end
    object QMCabeceraFEChileNUMCTAPAGO: TFIBStringField
      FieldName = 'NUMCTAPAGO'
      Size = 15
    end
    object QMCabeceraFEChileBCOPAGO: TFIBStringField
      FieldName = 'BCOPAGO'
      Size = 40
    end
    object QMCabeceraFEChileTERMPAGOCDG: TFIBStringField
      FieldName = 'TERMPAGOCDG'
      Size = 15
    end
    object QMCabeceraFEChileTERMPAGOGLOSA: TFIBStringField
      FieldName = 'TERMPAGOGLOSA'
      Size = 100
    end
    object QMCabeceraFEChileTERMPAGODIAS: TFloatField
      FieldName = 'TERMPAGODIAS'
    end
    object QMCabeceraFEChileFCHVENC: TDateTimeField
      FieldName = 'FCHVENC'
    end
    object QMCabeceraFEChileTIPOFACTESP: TFloatField
      FieldName = 'TIPOFACTESP'
    end
    object QMCabeceraFEChileGIROEMIS: TFIBStringField
      FieldName = 'GIROEMIS'
      Size = 100
    end
    object QMCabeceraFEChileRUTEMISOR: TFIBStringField
      FieldName = 'RUTEMISOR'
      Size = 15
    end
    object QMCabeceraFEChileRZNSOC: TFIBStringField
      FieldName = 'RZNSOC'
      Size = 100
    end
    object QMCabeceraFEChileTELEFONO: TFIBStringField
      FieldName = 'TELEFONO'
      Size = 15
    end
    object QMCabeceraFEChileCORREOEMISOR: TFIBStringField
      FieldName = 'CORREOEMISOR'
      Size = 100
    end
    object QMCabeceraFEChileACTECO: TIntegerField
      FieldName = 'ACTECO'
    end
    object QMCabeceraFEChileSUCURSAL: TFIBStringField
      FieldName = 'SUCURSAL'
    end
    object QMCabeceraFEChileCDGSIISUCUR: TIntegerField
      FieldName = 'CDGSIISUCUR'
    end
    object QMCabeceraFEChileDIRORIGEN: TFIBStringField
      FieldName = 'DIRORIGEN'
      Size = 100
    end
    object QMCabeceraFEChileCMNAORIGEN: TFIBStringField
      FieldName = 'CMNAORIGEN'
    end
    object QMCabeceraFEChileCIUDADORIGEN: TFIBStringField
      FieldName = 'CIUDADORIGEN'
    end
    object QMCabeceraFEChileCDGVENDEDOR: TFIBStringField
      FieldName = 'CDGVENDEDOR'
      Size = 100
    end
    object QMCabeceraFEChileRUTMANDANTE: TFIBStringField
      FieldName = 'RUTMANDANTE'
      Size = 15
    end
    object QMCabeceraFEChileRUTRECEP: TFIBStringField
      FieldName = 'RUTRECEP'
      Size = 15
    end
    object QMCabeceraFEChileCDGINTRECEP: TFIBStringField
      FieldName = 'CDGINTRECEP'
    end
    object QMCabeceraFEChileRZNSOCRECEP: TFIBStringField
      FieldName = 'RZNSOCRECEP'
      Size = 100
    end
    object QMCabeceraFEChileNUMID: TFIBStringField
      FieldName = 'NUMID'
    end
    object QMCabeceraFEChileNACIONALIDAD: TFIBStringField
      FieldName = 'NACIONALIDAD'
      Size = 15
    end
    object QMCabeceraFEChileTIPODOCID: TFIBStringField
      FieldName = 'TIPODOCID'
    end
    object QMCabeceraFEChileGIRORECEP: TFIBStringField
      FieldName = 'GIRORECEP'
      Size = 40
    end
    object QMCabeceraFEChileCONTACTO: TFIBStringField
      FieldName = 'CONTACTO'
      Size = 100
    end
    object QMCabeceraFEChileCORREORECEP: TFIBStringField
      FieldName = 'CORREORECEP'
      Size = 100
    end
    object QMCabeceraFEChileDIRRECEP: TFIBStringField
      FieldName = 'DIRRECEP'
      Size = 100
    end
    object QMCabeceraFEChileCMNARECEP: TFIBStringField
      FieldName = 'CMNARECEP'
    end
    object QMCabeceraFEChileCIUDADRECEP: TFIBStringField
      FieldName = 'CIUDADRECEP'
    end
    object QMCabeceraFEChileDIRPOSTAL: TFIBStringField
      FieldName = 'DIRPOSTAL'
      Size = 100
    end
    object QMCabeceraFEChileCMNAPOSTAL: TFIBStringField
      FieldName = 'CMNAPOSTAL'
    end
    object QMCabeceraFEChileCIUDADPOSTAL: TFIBStringField
      FieldName = 'CIUDADPOSTAL'
    end
    object QMCabeceraFEChileRUTSOLICITA: TFIBStringField
      FieldName = 'RUTSOLICITA'
    end
    object QMCabeceraFEChilePATENTE: TFIBStringField
      FieldName = 'PATENTE'
    end
    object QMCabeceraFEChileRUTTRANS: TFIBStringField
      FieldName = 'RUTTRANS'
    end
    object QMCabeceraFEChileRUTCHOFER: TFIBStringField
      FieldName = 'RUTCHOFER'
    end
    object QMCabeceraFEChileNOMBRECHOFER: TFIBStringField
      FieldName = 'NOMBRECHOFER'
      Size = 40
    end
    object QMCabeceraFEChileDIRDEST: TFIBStringField
      FieldName = 'DIRDEST'
      Size = 100
    end
    object QMCabeceraFEChileCMNADEST: TFIBStringField
      FieldName = 'CMNADEST'
    end
    object QMCabeceraFEChileCIUDADDEST: TFIBStringField
      FieldName = 'CIUDADDEST'
    end
    object QMCabeceraFEChileMNTNETO: TFloatField
      FieldName = 'MNTNETO'
    end
    object QMCabeceraFEChileMNTEXE: TFloatField
      FieldName = 'MNTEXE'
    end
    object QMCabeceraFEChileMNTBASE: TFloatField
      FieldName = 'MNTBASE'
    end
    object QMCabeceraFEChileMNTMARGENCOM: TFloatField
      FieldName = 'MNTMARGENCOM'
    end
    object QMCabeceraFEChileTASAIVA: TFloatField
      FieldName = 'TASAIVA'
    end
    object QMCabeceraFEChileIVA: TFloatField
      FieldName = 'IVA'
    end
    object QMCabeceraFEChileVAPROP: TFloatField
      FieldName = 'VAPROP'
    end
    object QMCabeceraFEChileIVATERC: TFloatField
      FieldName = 'IVATERC'
    end
    object QMCabeceraFEChileCREDEC: TFloatField
      FieldName = 'CREDEC'
    end
    object QMCabeceraFEChileGRNTDEP: TFloatField
      FieldName = 'GRNTDEP'
    end
    object QMCabeceraFEChileMNTTOTAL: TFloatField
      FieldName = 'MNTTOTAL'
    end
    object QMCabeceraFEChileMONTONF: TFloatField
      FieldName = 'MONTONF'
    end
    object QMCabeceraFEChileMONTOPERIODO: TFloatField
      FieldName = 'MONTOPERIODO'
    end
    object QMCabeceraFEChileSALDOANTERIOR: TFloatField
      FieldName = 'SALDOANTERIOR'
    end
    object QMCabeceraFEChileVLRPAGAR: TFloatField
      FieldName = 'VLRPAGAR'
    end
    object QMCabeceraFEChileTPOMONEDA: TFIBStringField
      FieldName = 'TPOMONEDA'
    end
    object QMCabeceraFEChileTPOCAMBIO: TFloatField
      FieldName = 'TPOCAMBIO'
    end
    object QMCabeceraFEChileMNTNETOOTRMNDA: TFloatField
      FieldName = 'MNTNETOOTRMNDA'
    end
    object QMCabeceraFEChileMNTEXEOTRMNDA: TFloatField
      FieldName = 'MNTEXEOTRMNDA'
    end
    object QMCabeceraFEChileMNTFAECARNEOTRMNDA: TFloatField
      FieldName = 'MNTFAECARNEOTRMNDA'
    end
    object QMCabeceraFEChileMNTMARGCOMOTRMNDA: TFloatField
      FieldName = 'MNTMARGCOMOTRMNDA'
    end
    object QMCabeceraFEChileIVAOTRMNDA: TFloatField
      FieldName = 'IVAOTRMNDA'
    end
    object QMCabeceraFEChileVANORETOTRMNDA: TFloatField
      FieldName = 'VANORETOTRMNDA'
    end
    object QMCabeceraFEChileMNTTOTOTRMNDA: TFloatField
      FieldName = 'MNTTOTOTRMNDA'
    end
    object QMCabeceraFEChileSII_TRACKID: TFIBStringField
      DisplayLabel = 'Track Id'
      FieldName = 'SII_TRACKID'
    end
    object QMCabeceraFEChileNROLINREF: TIntegerField
      FieldName = 'NROLINREF'
    end
    object QMCabeceraFEChileTPODOCREF: TFIBStringField
      FieldName = 'TPODOCREF'
      Size = 3
    end
    object QMCabeceraFEChileRUTOTR: TFIBStringField
      FieldName = 'RUTOTR'
    end
    object QMCabeceraFEChileFCHREF: TDateTimeField
      FieldName = 'FCHREF'
    end
    object QMCabeceraFEChileCODREF: TIntegerField
      FieldName = 'CODREF'
    end
    object QMCabeceraFEChileRAZONREF: TFIBStringField
      FieldName = 'RAZONREF'
      Size = 100
    end
    object QMCabeceraFEChileXML_GENERADO: TMemoField
      FieldName = 'XML_GENERADO'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabeceraFEChileCANTIDAD_ERRORES: TIntegerField
      DisplayLabel = 'Errores'
      FieldName = 'CANTIDAD_ERRORES'
    end
    object QMCabeceraFEChileMENSAJE_ERROR: TFIBStringField
      DisplayLabel = 'M. Error'
      DisplayWidth = 100
      FieldName = 'MENSAJE_ERROR'
      Size = 100
    end
    object QMCabeceraFEChileXML_RESPUESTA: TMemoField
      FieldName = 'XML_RESPUESTA'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabeceraFEChileFOLIOREF: TFIBStringField
      FieldName = 'FOLIOREF'
      Size = 40
    end
  end
  object DSQMCabeceraFEChile: TDataSource
    DataSet = QMCabeceraFEChile
    Left = 160
    Top = 344
  end
  object xTicketBAI: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT ID_S, CODIGO_IDENTIFICATIVO'
      'FROM GES_CABECERAS_S_FAC_TBAI'
      'WHERE'
      'ID_S = :ID_S')
    SelectSQL.Strings = (
      'SELECT ID_S, CODIGO_IDENTIFICATIVO'
      'FROM GES_CABECERAS_S_FAC_TBAI'
      'WHERE'
      'ID_S = :ID_S')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 256
    Top = 440
    object xTicketBAICODIGO_IDENTIFICATIVO: TFIBStringField
      DisplayLabel = 'Cod. Identificativo'
      FieldName = 'CODIGO_IDENTIFICATIVO'
      Size = 60
    end
  end
  object DSxTicketBAI: TDataSource
    DataSet = xTicketBAI
    Left = 360
    Top = 440
  end
  object QMSIIDteReferencia: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SII_DTE_REFERENCIA'
      'WHERE'
      '  NROLINREF=?old_NROLINREF AND '
      '  ID_S=?old_ID_S ')
    InsertSQL.Strings = (
      'INSERT INTO SII_DTE_REFERENCIA'
      
        '  (ID_S,NROLINREF,TPODOCREF,FOLIOREF,FCHREF,CODREF,RAZONREF,ID_S' +
        '_REF,RUTOTR)'
      'VALUES'
      
        '  (?ID_S,?NROLINREF,?TPODOCREF,?FOLIOREF,?FCHREF,?CODREF,?RAZONR' +
        'EF,?ID_S_REF,?RUTOTR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SII_DTE_REFERENCIA'
      'WHERE'
      '  NROLINREF=?NROLINREF AND '
      '  ID_S=?ID_S ')
    SelectSQL.Strings = (
      'SELECT * FROM SII_DTE_REFERENCIA'
      'WHERE ID_S = :ID_S'
      'ORDER BY NROLINREF')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SII_DTE_REFERENCIA'
      'SET'
      '  TPODOCREF=?TPODOCREF '
      '  ,FOLIOREF=?FOLIOREF '
      '  ,FCHREF=?FCHREF '
      '  ,CODREF=?CODREF '
      '  ,RAZONREF=?RAZONREF '
      '  ,ID_S_REF=?ID_S_REF '
      '  ,RUTOTR=?RUTOTR '
      'WHERE'
      '  NROLINREF=?NROLINREF AND '
      '  ID_S=?ID_S ')
    DataSource = DSQMCabecera
    AfterPost = QMSIIDteReferenciaAfterPost
    BeforePost = QMSIIDteReferenciaBeforePost
    OnNewRecord = QMSIIDteReferenciaNewRecord
    ClavesPrimarias.Strings = (
      'NROLINREF '
      'ID_S ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SII_DTE_REFERENCIA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 392
    object QMSIIDteReferenciaID_S: TIntegerField
      FieldName = 'ID_S'
    end
    object QMSIIDteReferenciaNROLINREF: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'NROLINREF'
    end
    object QMSIIDteReferenciaTPODOCREF: TFIBStringField
      DisplayLabel = 'Tipo Doc Ref'
      FieldName = 'TPODOCREF'
      Size = 3
    end
    object QMSIIDteReferenciaFCHREF: TDateTimeField
      DisplayLabel = 'Fecha Ref'
      FieldName = 'FCHREF'
    end
    object QMSIIDteReferenciaCODREF: TIntegerField
      DisplayLabel = 'Cod. Ref'
      FieldName = 'CODREF'
    end
    object QMSIIDteReferenciaRAZONREF: TFIBStringField
      DisplayLabel = 'Razon Ref'
      FieldName = 'RAZONREF'
      Size = 100
    end
    object QMSIIDteReferenciaID_S_REF: TIntegerField
      DisplayLabel = 'ID_S Ref.'
      FieldName = 'ID_S_REF'
    end
    object QMSIIDteReferenciaRUTOTR: TFIBStringField
      DisplayLabel = 'RUT Otro'
      FieldName = 'RUTOTR'
    end
    object QMSIIDteReferenciaFOLIOREF: TFIBStringField
      DisplayLabel = 'Folio Ref.'
      FieldName = 'FOLIOREF'
    end
  end
  object DSQMSIIDteReferencia: TDataSource
    DataSet = QMSIIDteReferencia
    Left = 160
    Top = 392
  end
  object xAvisos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT (SELECT MENSAJE'
      '        FROM EMP_AVISOS'
      '        WHERE'
      '        TIPO_OBJETO = '#39'CLI'#39' AND'
      '        ID_OBJETO = :ID_CLIENTE AND'
      '        TIPO_DOCUMENTO = '#39'FAC'#39' AND'
      '        ACTIVO = 1),'
      '        (SELECT NOTAS'
      '         FROM EMP_CLIENTES'
      '         WHERE'
      '         ID_CLIENTE = :ID_CLIENTE)'
      'FROM RDB$DATABASE')
    SelectSQL.Strings = (
      'SELECT (SELECT MENSAJE'
      '        FROM EMP_AVISOS'
      '        WHERE'
      '        TIPO_OBJETO = '#39'CLI'#39' AND'
      '        ID_OBJETO = :ID_CLIENTE AND'
      '        TIPO_DOCUMENTO = '#39'FAC'#39' AND'
      '        ACTIVO = 1),'
      '        (SELECT NOTAS'
      '         FROM EMP_CLIENTES'
      '         WHERE'
      '         ID_CLIENTE = :ID_CLIENTE)'
      'FROM RDB$DATABASE')
    UniDirectional = False
    DataSource = DSxCliente
    Left = 40
    Top = 488
    object xAvisosMENSAJE: TMemoField
      DisplayLabel = 'Aviso'
      FieldName = 'MENSAJE'
      BlobType = ftMemo
      Size = 8
    end
    object xAvisosNOTAS: TMemoField
      DisplayLabel = 'Notas Cliente'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
  end
  object xProveedores: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_GES_DETALLES_S_PROVEEDORES'
      'WHERE'
      '  ID_S=?old_ID_S AND '
      '  ID_A=?old_ID_A AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  PROVEEDOR=?old_PROVEEDOR ')
    InsertSQL.Strings = (
      'INSERT INTO VER_GES_DETALLES_S_PROVEEDORES'
      '  (EMPRESA,'
      
        'EJERCICIO,CANAL,SERIE,TIPO,RIG,ID_S,ID_A,ARTICULO,TITULO,PROVEED' +
        'OR,'
      
        'NOMBRE_R_SOCIAL,NOMBRE_COMERCIAL,PRECIO,FECHA_ENTREGA,UTILIZAR_C' +
        'OSTE,OBSERVACIONES)'
      'VALUES'
      '  (?EMPRESA,'
      
        '?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ID_S,?ID_A,?ARTICULO,?TITUL' +
        'O,?PROVEEDOR,'
      
        '?NOMBRE_R_SOCIAL,?NOMBRE_COMERCIAL,?PRECIO,?FECHA_ENTREGA,?UTILI' +
        'ZAR_COSTE,?OBSERVACIONES)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_GES_DETALLES_S_PROVEEDORES'
      'WHERE'
      '  ID_S=?ID_S AND '
      '  ID_A=?ID_A AND '
      '  EMPRESA=?EMPRESA AND '
      '  PROVEEDOR=?PROVEEDOR ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_GES_DETALLES_S_PROVEEDORES'
      'WHERE'
      '  ID_S = :ID_S AND'
      '  ID_A = :ID_A '
      'ORDER BY PROVEEDOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_GES_DETALLES_S_PROVEEDORES'
      'SET'
      '  EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,TIPO=?TIPO '
      '  ,RIG=?RIG '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO=?TITULO '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,NOMBRE_COMERCIAL=?NOMBRE_COMERCIAL '
      '  ,PRECIO=?PRECIO '
      '  ,FECHA_ENTREGA=?FECHA_ENTREGA '
      '  ,UTILIZAR_COSTE=?UTILIZAR_COSTE '
      '  ,OBSERVACIONES=?OBSERVACIONES '
      'WHERE'
      '  ID_S=?ID_S AND '
      '  ID_A=?ID_A AND '
      '  EMPRESA=?EMPRESA AND '
      '  PROVEEDOR=?PROVEEDOR ')
    DataSource = DSQMDetalle
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_DETALLE_OFERTA_C DET INDEX (GES_DETALLES_S_' +
        'CAB_ID),'
      
        '                VER_DETALLE_OFERTA_C OFC INDEX (GES_DETALLES_S_O' +
        'FC_ID)))  ')
    AfterPost = xProveedoresAfterPost
    OnNewRecord = xProveedoresNewRecord
    ClavesPrimarias.Strings = (
      'ID_S '
      'ID_A '
      'EMPRESA '
      'PROVEEDOR ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_GES_DETALLES_S_PROVEEDORES'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_DETALLES_S'
      'GES_DETALLES_S_OFC')
    CamposBloqueo.Strings = (
      'ID_DETALLES_S'
      'ID_DETALLES_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 440
    object xProveedoresEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xProveedoresEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xProveedoresCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xProveedoresSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xProveedoresTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xProveedoresRIG: TIntegerField
      DisplayLabel = 'R.I.G.'
      FieldName = 'RIG'
    end
    object xProveedoresID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object xProveedoresID_A: TIntegerField
      DisplayLabel = 'Id Art.'
      FieldName = 'ID_A'
    end
    object xProveedoresARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = xProveedoresARTICULOChange
      Size = 15
    end
    object xProveedoresTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object xProveedoresPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xProveedoresNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Razon Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xProveedoresNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xProveedoresPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xProveedoresFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fec. Entrega'
      FieldName = 'FECHA_ENTREGA'
    end
    object xProveedoresUTILIZAR_COSTE: TIntegerField
      DisplayLabel = 'Utilizar Coste'
      FieldName = 'UTILIZAR_COSTE'
    end
    object xProveedoresOBSERVACIONES: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVACIONES'
      Size = 256
    end
  end
  object DSxProveedores: TDataSource
    DataSet = xProveedores
    Left = 160
    Top = 440
  end
  object DSxAvisos: TDataSource
    DataSet = xAvisos
    Left = 160
    Top = 488
  end
  object xVerifactu: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 2
    RefreshSQL.Strings = (
      
        'SELECT A.*, S.ENC_RA_IDEMISORFACTURA, S.ENC_RA_NUMSERIEFACTURA, ' +
        'S.ENC_RA_FECHAEXPEDICIONFACTURA, S.ENC_RA_HUELLA,'
      '       S.HUELLA'
      'FROM VF_REGISTRO_ALTA A'
      'JOIN VF_SECUENCIA S ON A.ID_SECUENCIA = S.ID_SECUENCIA'
      'WHERE'
      'A.ID_SECUENCIA = :ID_SECUENCIA')
    SelectSQL.Strings = (
      
        'SELECT A.*, S.ENC_RA_IDEMISORFACTURA, S.ENC_RA_NUMSERIEFACTURA, ' +
        'S.ENC_RA_FECHAEXPEDICIONFACTURA, S.ENC_RA_HUELLA,'
      '       S.HUELLA'
      'FROM VF_REGISTRO_ALTA A'
      'JOIN VF_SECUENCIA S ON A.ID_SECUENCIA = S.ID_SECUENCIA'
      'WHERE'
      'A.ID_S = :ID_S'
      'ORDER BY S.ID_SECUENCIA')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 256
    Top = 488
    object xVerifactuID_SECUENCIA: TIntegerField
      FieldName = 'ID_SECUENCIA'
    end
    object xVerifactuID_I: TIntegerField
      FieldName = 'ID_I'
    end
    object xVerifactuID_S: TIntegerField
      FieldName = 'ID_S'
    end
    object xVerifactuIDVERSION: TFIBStringField
      FieldName = 'IDVERSION'
      Size = 3
    end
    object xVerifactuIDFACTURA_IDEMISORFACTURA: TFIBStringField
      FieldName = 'IDFACTURA_IDEMISORFACTURA'
      Size = 9
    end
    object xVerifactuIDFACTURA_NUMSERIEFACTURA: TFIBStringField
      FieldName = 'IDFACTURA_NUMSERIEFACTURA'
      Size = 60
    end
    object xVerifactuIDFACTURA_FECHAEXPEDICIONFAC: TDateTimeField
      FieldName = 'IDFACTURA_FECHAEXPEDICIONFAC'
    end
    object xVerifactuREFEXTERNA: TFIBStringField
      FieldName = 'REFEXTERNA'
      Size = 60
    end
    object xVerifactuNOMBRERAZONEMISOR: TFIBStringField
      FieldName = 'NOMBRERAZONEMISOR'
      Size = 120
    end
    object xVerifactuSUBSANACION: TFIBStringField
      FieldName = 'SUBSANACION'
      Size = 1
    end
    object xVerifactuRECHAZOPREVIO: TFIBStringField
      FieldName = 'RECHAZOPREVIO'
      Size = 1
    end
    object xVerifactuTIPOFACTURA: TFIBStringField
      FieldName = 'TIPOFACTURA'
      Size = 2
    end
    object xVerifactuTIPORECTIFICATIVA: TFIBStringField
      FieldName = 'TIPORECTIFICATIVA'
      Size = 1
    end
    object xVerifactuFR_IDFR_IDEMISORFACTURA: TFIBStringField
      FieldName = 'FR_IDFR_IDEMISORFACTURA'
      Size = 9
    end
    object xVerifactuFR_IDFR_NUMSERIEFACTURA: TFIBStringField
      FieldName = 'FR_IDFR_NUMSERIEFACTURA'
      Size = 60
    end
    object xVerifactuFR_IDFR_FECHAEXPEDICIONFAC: TDateTimeField
      FieldName = 'FR_IDFR_FECHAEXPEDICIONFAC'
    end
    object xVerifactuFS_IDFS_IDEMISORFACTURA: TFIBStringField
      FieldName = 'FS_IDFS_IDEMISORFACTURA'
      Size = 9
    end
    object xVerifactuFS_IDFS_NUMSERIEFACTURA: TFIBStringField
      FieldName = 'FS_IDFS_NUMSERIEFACTURA'
      Size = 60
    end
    object xVerifactuFS_IDFS_FECHAEXPEDICIONFAC: TDateTimeField
      FieldName = 'FS_IDFS_FECHAEXPEDICIONFAC'
    end
    object xVerifactuIMPORTERECT_BASERECTIFICADA: TFloatField
      FieldName = 'IMPORTERECT_BASERECTIFICADA'
    end
    object xVerifactuIMPORTERECT_CUOTARECTIFICADA: TFloatField
      FieldName = 'IMPORTERECT_CUOTARECTIFICADA'
    end
    object xVerifactuIMPORTERECT_CUOTARECARGORECT: TFloatField
      FieldName = 'IMPORTERECT_CUOTARECARGORECT'
    end
    object xVerifactuFECHAOPERACION: TDateTimeField
      FieldName = 'FECHAOPERACION'
    end
    object xVerifactuDESCRIPCIONOPERACION: TFIBStringField
      FieldName = 'DESCRIPCIONOPERACION'
      Size = 500
    end
    object xVerifactuFACTURASIMPLIFICADAART7273: TFIBStringField
      FieldName = 'FACTURASIMPLIFICADAART7273'
      Size = 1
    end
    object xVerifactuFACTURASINIDENTIFDEST: TFIBStringField
      FieldName = 'FACTURASINIDENTIFDEST'
      Size = 1
    end
    object xVerifactuMACRODATO: TFIBStringField
      FieldName = 'MACRODATO'
      Size = 1
    end
    object xVerifactuEMITIDAPORTERCEROODEST: TFIBStringField
      FieldName = 'EMITIDAPORTERCEROODEST'
      Size = 1
    end
    object xVerifactuTERCERO_NOMBRERAZON: TFIBStringField
      FieldName = 'TERCERO_NOMBRERAZON'
      Size = 120
    end
    object xVerifactuTERCERO_NIF: TFIBStringField
      FieldName = 'TERCERO_NIF'
      Size = 9
    end
    object xVerifactuTERCERO_IDOTRO_CODIGOPAIS: TFIBStringField
      FieldName = 'TERCERO_IDOTRO_CODIGOPAIS'
      Size = 2
    end
    object xVerifactuTERCERO_IDOTRO_IDTYPE: TFIBStringField
      FieldName = 'TERCERO_IDOTRO_IDTYPE'
      Size = 2
    end
    object xVerifactuTERCERO_IDOTRO_ID: TFIBStringField
      FieldName = 'TERCERO_IDOTRO_ID'
    end
    object xVerifactuDEST_IDD_NOMBRERAZON: TFIBStringField
      FieldName = 'DEST_IDD_NOMBRERAZON'
      Size = 120
    end
    object xVerifactuDEST_IDD_NIF: TFIBStringField
      FieldName = 'DEST_IDD_NIF'
      Size = 9
    end
    object xVerifactuDEST_IDD_IDOTRO_CODIGOPAIS: TFIBStringField
      FieldName = 'DEST_IDD_IDOTRO_CODIGOPAIS'
      Size = 2
    end
    object xVerifactuDEST_IDD_IDOTRO_IDTYPE: TFIBStringField
      FieldName = 'DEST_IDD_IDOTRO_IDTYPE'
      Size = 2
    end
    object xVerifactuDEST_IDD_IDOTRO_ID: TFIBStringField
      FieldName = 'DEST_IDD_IDOTRO_ID'
    end
    object xVerifactuCUPON: TFIBStringField
      FieldName = 'CUPON'
      Size = 1
    end
    object xVerifactuCUOTATOTAL: TFloatField
      FieldName = 'CUOTATOTAL'
    end
    object xVerifactuIMPORTETOTAL: TFloatField
      FieldName = 'IMPORTETOTAL'
    end
    object xVerifactuNUMREGISTROACUERDOFACTURACION: TFIBStringField
      FieldName = 'NUMREGISTROACUERDOFACTURACION'
    end
    object xVerifactuIDACUERDOSISTEMAINFORMATICO: TFIBStringField
      FieldName = 'IDACUERDOSISTEMAINFORMATICO'
    end
    object xVerifactuINFO_QR: TFIBStringField
      FieldName = 'INFO_QR'
      Size = 500
    end
    object xVerifactuENC_RA_IDEMISORFACTURA: TFIBStringField
      FieldName = 'ENC_RA_IDEMISORFACTURA'
      Size = 9
    end
    object xVerifactuENC_RA_NUMSERIEFACTURA: TFIBStringField
      FieldName = 'ENC_RA_NUMSERIEFACTURA'
      Size = 60
    end
    object xVerifactuENC_RA_FECHAEXPEDICIONFACTURA: TDateTimeField
      FieldName = 'ENC_RA_FECHAEXPEDICIONFACTURA'
    end
    object xVerifactuENC_RA_HUELLA: TFIBStringField
      FieldName = 'ENC_RA_HUELLA'
      Size = 65
    end
    object xVerifactuHUELLA: TFIBStringField
      FieldName = 'HUELLA'
      Size = 65
    end
  end
  object DSxVerifactu: TDataSource
    DataSet = xVerifactu
    Left = 360
    Top = 488
  end
  object xFactoring: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT ID_S, TRACKID, STATUS'
      'FROM GES_CABECERAS_S_AEC_CHL'
      'WHERE'
      'ID_S = :ID_S')
    SelectSQL.Strings = (
      'SELECT ID_S, TRACKID, STATUS'
      'FROM GES_CABECERAS_S_AEC_CHL'
      'WHERE'
      'ID_S = :ID_S')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 40
    Top = 536
    object xFactoringID_S: TIntegerField
      FieldName = 'ID_S'
    end
    object xFactoringTRACKID: TFIBStringField
      DisplayLabel = 'TrackID'
      FieldName = 'TRACKID'
    end
    object xFactoringSTATUS: TIntegerField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
    end
  end
  object DSxFactoring: TDataSource
    DataSet = xFactoring
    Left = 160
    Top = 536
  end
  object xFacturaDGII: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      
        'SELECT ID_S, ID_ENVIO, STAMP_DATE, STATUS, SECURITY_CODE, SEQUEN' +
        'CE_CONSUMED, '
      '       ENCF, URL_XML, URL_PDF, DOCUMENT_STAMP_URL, TRACK_ID, '
      
        '       GOVERMENT_RESPONSE, MENSAJE_ERROR_ENVIO_ECF, STATUS_CONSU' +
        'LTA, '
      '       LEGAL_STATUS_CONSULTA, MENSAJE_ERROR_CONSULTA_ECF'
      'FROM GES_CABECERAS_S_FAC_DGII'
      'WHERE'
      'ID_S = :ID_S')
    SelectSQL.Strings = (
      '/* Evito cargar BLOBs */'
      
        'SELECT ID_S, ID_ENVIO, STAMP_DATE, STATUS, SECURITY_CODE, SEQUEN' +
        'CE_CONSUMED, '
      '       ENCF, URL_XML, URL_PDF, DOCUMENT_STAMP_URL, TRACK_ID, '
      
        '       GOVERMENT_RESPONSE, MENSAJE_ERROR_ENVIO_ECF, STATUS_CONSU' +
        'LTA, '
      
        '       LEGAL_STATUS_CONSULTA, MENSAJE_ERROR_CONSULTA_ECF, CODIGO' +
        '_ERROR_ENVIO'
      'FROM GES_CABECERAS_S_FAC_DGII'
      'WHERE'
      'ID_S = :ID_S')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 456
    Top = 160
    object xFacturaDGIIID_S: TIntegerField
      FieldName = 'ID_S'
    end
    object xFacturaDGIIID_ENVIO: TFIBStringField
      FieldName = 'ID_ENVIO'
      Size = 40
    end
    object xFacturaDGIISTAMP_DATE: TFIBStringField
      FieldName = 'STAMP_DATE'
    end
    object xFacturaDGIISTATUS: TFIBStringField
      FieldName = 'STATUS'
    end
    object xFacturaDGIISECURITY_CODE: TFIBStringField
      FieldName = 'SECURITY_CODE'
    end
    object xFacturaDGIISEQUENCE_CONSUMED: TIntegerField
      FieldName = 'SEQUENCE_CONSUMED'
    end
    object xFacturaDGIIENCF: TFIBStringField
      FieldName = 'ENCF'
    end
    object xFacturaDGIIURL_XML: TFIBStringField
      FieldName = 'URL_XML'
      Size = 500
    end
    object xFacturaDGIIURL_PDF: TFIBStringField
      FieldName = 'URL_PDF'
      Size = 500
    end
    object xFacturaDGIIDOCUMENT_STAMP_URL: TFIBStringField
      FieldName = 'DOCUMENT_STAMP_URL'
      Size = 500
    end
    object xFacturaDGIITRACK_ID: TFIBStringField
      FieldName = 'TRACK_ID'
      Size = 40
    end
    object xFacturaDGIIGOVERMENT_RESPONSE: TFIBStringField
      FieldName = 'GOVERMENT_RESPONSE'
      Size = 256
    end
    object xFacturaDGIIMENSAJE_ERROR_ENVIO_ECF: TFIBStringField
      FieldName = 'MENSAJE_ERROR_ENVIO_ECF'
      Size = 500
    end
    object xFacturaDGIISTATUS_CONSULTA: TFIBStringField
      FieldName = 'STATUS_CONSULTA'
    end
    object xFacturaDGIILEGAL_STATUS_CONSULTA: TFIBStringField
      FieldName = 'LEGAL_STATUS_CONSULTA'
    end
    object xFacturaDGIIMENSAJE_ERROR_CONSULTA_ECF: TFIBStringField
      FieldName = 'MENSAJE_ERROR_CONSULTA_ECF'
      Size = 500
    end
    object xFacturaDGIICODIGO_ERROR_ENVIO: TFIBStringField
      DisplayLabel = 'Cod. Error Envio'
      FieldName = 'CODIGO_ERROR_ENVIO'
    end
  end
  object DSxFacturaDGII: TDataSource
    DataSet = xFacturaDGII
    Left = 560
    Top = 160
  end
  object QMDGIIReferencias: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    InsertSQL.Strings = (
      'UPDATE DGII_ECF_REFERENCIA'
      'SET'
      'ID_S_REF = :ID_S_REF,'
      'TIPO_CF_REF = :TIPO_CF_REF,'
      'ENCF_REF = :ENCF_REF,'
      'TIPO_REF = :TIPO_REF'
      'WHERE ID_S = :ID_S')
    RefreshSQL.Strings = (
      'SELECT * FROM DGII_ECF_REFERENCIA'
      'WHERE ID_S = :ID_S')
    SelectSQL.Strings = (
      'SELECT * FROM DGII_ECF_REFERENCIA'
      'WHERE ID_S = :ID_S')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE DGII_ECF_REFERENCIA'
      'SET'
      'ID_S_REF = :ID_S_REF,'
      'TIPO_CF_REF = :TIPO_CF_REF,'
      'ENCF_REF = :ENCF_REF,'
      'TIPO_REF = :TIPO_REF'
      'WHERE ID_S = :ID_S')
    DataSource = DSQMCabecera
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    Left = 456
    Top = 224
    object QMDGIIReferenciasID_S: TIntegerField
      FieldName = 'ID_S'
    end
    object QMDGIIReferenciasID_S_REF: TIntegerField
      FieldName = 'ID_S_REF'
    end
    object QMDGIIReferenciasTIPO_CF_REF: TIntegerField
      FieldName = 'TIPO_CF_REF'
    end
    object QMDGIIReferenciasENCF_REF: TFIBStringField
      FieldName = 'ENCF_REF'
    end
    object QMDGIIReferenciasTIPO_REF: TIntegerField
      FieldName = 'TIPO_REF'
    end
  end
  object DSQMDGIIReferencias: TDataSource
    DataSet = QMDGIIReferencias
    Left = 576
    Top = 224
  end
end
