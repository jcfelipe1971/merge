object DMPedidos: TDMPedidos
  OldCreateOrder = False
  OnCreate = DMDocsPedidoCreate
  OnDestroy = DataModuleDestroy
  Left = 516
  Top = 230
  Height = 630
  Width = 836
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_DETALLE_PEDIDO'
      'WHERE'
      '  ID_DETALLES_S=?old_ID_DETALLES_S ')
    InsertSQL.Strings = (
      'INSERT INTO VER_DETALLE_PEDIDO'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,ESTADO,CLIENTE' +
        ',MONEDA,ALMACEN,'#13#10'ARTICULO,TITULO,UNIDADES,UNIDADES_SERVIDAS,UNI' +
        'DADES_PENDIENTES,UNIDADES_RESERVADAS,UNIDADES_PREPARADAS,SERVIDO' +
        ',PRECIO,PIEZAS_X_BULTO,'#13#10'BULTOS,DESCUENTO,DESCUENTO_2,DESCUENTO_' +
        '3,COMISION,P_COSTE,M_MOV_STOCK,TIPO_IVA,TIPO_IVA_ART,P_IVA,'#13#10'P_R' +
        'ECARGO,BRUTO,B_COMISION,I_DESCUENTO,B_IMPONIBLE,I_COMISION,ENTRA' +
        'DA,ENTRADA_AGRUPACION,NOTAS,UNIDADES_EXT,ORDEN_PRODUCCION,UNIDAD' +
        'ES_SEC,DIRECCION_ENTREGA,'#13#10'PAIS,ID_DETALLES_S,ID_S,ID_A,ID_C_A,C' +
        'OMISION_LINEAL,I_COMISION_LINEAL,FECHA_ENTREGA_PREV,FECHA_REC_DE' +
        'T,TITULO_IDIOMA,'#13#10'MARGEN_KRI,TIPO_LINEA_KRI,ORDEN,TIPO_LINEA,PRO' +
        'C_PROMOCION,ORIGEN,ID_P,APLICA_UNIDADES_SECUNDARIAS,PROYECTO,NOT' +
        'AS2,'#13#10'CRC_NOTAS,CRC_NOTAS2,PRO_NUM_PLANO,NO_FABRICACION_KRI,TIPO' +
        '_UNIDAD_LOGISTICA,TITULO_UNIDAD_LOGISTICA,U_POR_U_LOGISTICA,RELA' +
        'CIONAR_U_LOGISTICA,UNIDADES_LOGISTICAS,U_LOGISTICAS_RESERVADAS,'#13 +
        #10'LOTE_SIMPLE,ID_DESPIECE,FECHA_CAB,FECHA_CONF_DET,COSTE_ADICIONA' +
        'L,ID_IMAGEN,PEDIR,MANIPULACION,'#13#10'ALFA_1,ALFA_2,ALFA_3,ALFA_4,ALF' +
        'A_5,ALFA_6,ALFA_7,ALFA_8,SU_REFERENCIA,ASEGURADO,'#13#10'PACIENTE,AUTO' +
        'RIZACION,POLIZA,FEC_REC_IH,INVERSION_SUJETO_PASIVO,DECIMALES_UNI' +
        'DADES,SIGNO_UNIDADES,TIPO_IMPUESTO_ADICIONAL,P_IMPUESTO_ADICIONA' +
        'L,ID_ESC,'#13#10'ID_ESC_2,ID_MEDIDA,ID_ORDEN,AGENTE,PESO,PESO_TOTAL,PE' +
        'SO_REAL,DIRECCION_ALM_LOGISTICO,LISTO_PARA_PREPARAR,ECOTASA,'#13#10'RE' +
        'QUIERE_LOTE_SIMPLE,CONTROL_STOCK,UE_UNIDADES,UE_MEDIDA1,UE_MEDID' +
        'A2,UE_MEDIDA3,UE_MEDIDA4)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?ESTADO' +
        ',?CLIENTE,?MONEDA,?ALMACEN,'#13#10'?ARTICULO,?TITULO,?UNIDADES,?UNIDAD' +
        'ES_SERVIDAS,?UNIDADES_PENDIENTES,?UNIDADES_RESERVADAS,?UNIDADES_' +
        'PREPARADAS,?SERVIDO,?PRECIO,?PIEZAS_X_BULTO,'#13#10'?BULTOS,?DESCUENTO' +
        ',?DESCUENTO_2,?DESCUENTO_3,?COMISION,?P_COSTE,?M_MOV_STOCK,?TIPO' +
        '_IVA,?TIPO_IVA_ART,?P_IVA,'#13#10'?P_RECARGO,?BRUTO,?B_COMISION,?I_DES' +
        'CUENTO,?B_IMPONIBLE,?I_COMISION,?ENTRADA,?ENTRADA_AGRUPACION,?NO' +
        'TAS,?UNIDADES_EXT,?ORDEN_PRODUCCION,?UNIDADES_SEC,?DIRECCION_ENT' +
        'REGA,'#13#10'?PAIS,?ID_DETALLES_S,?ID_S,?ID_A,?ID_C_A,?COMISION_LINEAL' +
        ',?I_COMISION_LINEAL,?FECHA_ENTREGA_PREV,?FECHA_REC_DET,?TITULO_I' +
        'DIOMA,'#13#10'?MARGEN_KRI,?TIPO_LINEA_KRI,?ORDEN,?TIPO_LINEA,?PROC_PRO' +
        'MOCION,?ORIGEN,?ID_P,?APLICA_UNIDADES_SECUNDARIAS,?PROYECTO,?NOT' +
        'AS2,'#13#10'?CRC_NOTAS,?CRC_NOTAS2,?PRO_NUM_PLANO,?NO_FABRICACION_KRI,' +
        '?TIPO_UNIDAD_LOGISTICA,?TITULO_UNIDAD_LOGISTICA,?U_POR_U_LOGISTI' +
        'CA,?RELACIONAR_U_LOGISTICA,?UNIDADES_LOGISTICAS,?U_LOGISTICAS_RE' +
        'SERVADAS,'#13#10'?LOTE_SIMPLE,?ID_DESPIECE,?FECHA_CAB,?FECHA_CONF_DET,' +
        '?COSTE_ADICIONAL,?ID_IMAGEN,?PEDIR,?MANIPULACION,'#13#10'?ALFA_1,?ALFA' +
        '_2,?ALFA_3,?ALFA_4,?ALFA_5,?ALFA_6,?ALFA_7,?ALFA_8,?SU_REFERENCI' +
        'A,?ASEGURADO,'#13#10'?PACIENTE,?AUTORIZACION,?POLIZA,?FEC_REC_IH,?INVE' +
        'RSION_SUJETO_PASIVO,?DECIMALES_UNIDADES,?SIGNO_UNIDADES,?TIPO_IM' +
        'PUESTO_ADICIONAL,?P_IMPUESTO_ADICIONAL,?ID_ESC,'#13#10'?ID_ESC_2,?ID_M' +
        'EDIDA,?ID_ORDEN,?AGENTE,?PESO,?PESO_TOTAL,?PESO_REAL,?DIRECCION_' +
        'ALM_LOGISTICO,?LISTO_PARA_PREPARAR,?ECOTASA,'#13#10'?REQUIERE_LOTE_SIM' +
        'PLE,?CONTROL_STOCK,?UE_UNIDADES,?UE_MEDIDA1,?UE_MEDIDA2,?UE_MEDI' +
        'DA3,?UE_MEDIDA4)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DETALLE_PEDIDO'
      'WHERE'
      '  ID_DETALLES_S=?ID_DETALLES_S ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_PEDIDO '
      'WHERE'
      'ID_S = ?ID_S'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLE_PEDIDO'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,TIPO=?TIPO '
      '  ,RIG=?RIG '
      '  ,LINEA=?LINEA '
      '  ,ESTADO=?ESTADO '
      '  ,CLIENTE=?CLIENTE '
      '  ,MONEDA=?MONEDA '
      '  ,ALMACEN=?ALMACEN '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO=?TITULO '
      '  ,UNIDADES=?UNIDADES '
      '  ,UNIDADES_SERVIDAS=?UNIDADES_SERVIDAS '
      '  ,UNIDADES_PENDIENTES=?UNIDADES_PENDIENTES '
      '  ,UNIDADES_RESERVADAS=?UNIDADES_RESERVADAS '
      '  ,UNIDADES_PREPARADAS=?UNIDADES_PREPARADAS '
      '  ,SERVIDO=?SERVIDO '
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
      '  ,ENTRADA_AGRUPACION=?ENTRADA_AGRUPACION '
      '  ,NOTAS=?NOTAS '
      '  ,UNIDADES_EXT=?UNIDADES_EXT '
      '  ,ORDEN_PRODUCCION=?ORDEN_PRODUCCION '
      '  ,UNIDADES_SEC=?UNIDADES_SEC '
      '  ,DIRECCION_ENTREGA=?DIRECCION_ENTREGA '
      '  ,PAIS=?PAIS '
      '  ,ID_S=?ID_S '
      '  ,ID_A=?ID_A '
      '  ,ID_C_A=?ID_C_A '
      '  ,COMISION_LINEAL=?COMISION_LINEAL '
      '  ,I_COMISION_LINEAL=?I_COMISION_LINEAL '
      '  ,FECHA_ENTREGA_PREV=?FECHA_ENTREGA_PREV '
      '  ,FECHA_REC_DET=?FECHA_REC_DET '
      '  ,TITULO_IDIOMA=?TITULO_IDIOMA '
      '  ,MARGEN_KRI=?MARGEN_KRI '
      '  ,TIPO_LINEA_KRI=?TIPO_LINEA_KRI '
      '  ,ORDEN=?ORDEN '
      '  ,TIPO_LINEA=?TIPO_LINEA '
      '  ,PROC_PROMOCION=?PROC_PROMOCION '
      '  ,ORIGEN=?ORIGEN '
      '  ,ID_P=?ID_P '
      '  ,APLICA_UNIDADES_SECUNDARIAS=?APLICA_UNIDADES_SECUNDARIAS '
      '  ,PROYECTO=?PROYECTO '
      '  ,NOTAS2=?NOTAS2 '
      '  ,CRC_NOTAS=?CRC_NOTAS '
      '  ,CRC_NOTAS2=?CRC_NOTAS2 '
      '  ,PRO_NUM_PLANO=?PRO_NUM_PLANO '
      '  ,NO_FABRICACION_KRI=?NO_FABRICACION_KRI '
      '  ,TIPO_UNIDAD_LOGISTICA=?TIPO_UNIDAD_LOGISTICA '
      '  ,TITULO_UNIDAD_LOGISTICA=?TITULO_UNIDAD_LOGISTICA '
      '  ,U_POR_U_LOGISTICA=?U_POR_U_LOGISTICA '
      '  ,RELACIONAR_U_LOGISTICA=?RELACIONAR_U_LOGISTICA '
      '  ,UNIDADES_LOGISTICAS=?UNIDADES_LOGISTICAS '
      '  ,U_LOGISTICAS_RESERVADAS=?U_LOGISTICAS_RESERVADAS '
      '  ,LOTE_SIMPLE=?LOTE_SIMPLE '
      '  ,ID_DESPIECE=?ID_DESPIECE '
      '  ,FECHA_CAB=?FECHA_CAB '
      '  ,FECHA_CONF_DET=?FECHA_CONF_DET '
      '  ,COSTE_ADICIONAL=?COSTE_ADICIONAL '
      '  ,ID_IMAGEN=?ID_IMAGEN '
      '  ,PEDIR=?PEDIR '
      '  ,MANIPULACION=?MANIPULACION '
      '  ,ALFA_1=?ALFA_1 '
      '  ,ALFA_2=?ALFA_2 '
      '  ,ALFA_3=?ALFA_3 '
      '  ,ALFA_4=?ALFA_4 '
      '  ,ALFA_5=?ALFA_5 '
      '  ,ALFA_6=?ALFA_6 '
      '  ,ALFA_7=?ALFA_7 '
      '  ,ALFA_8=?ALFA_8 '
      '  ,SU_REFERENCIA=?SU_REFERENCIA '
      '  ,ASEGURADO=?ASEGURADO '
      '  ,PACIENTE=?PACIENTE '
      '  ,AUTORIZACION=?AUTORIZACION '
      '  ,POLIZA=?POLIZA '
      '  ,FEC_REC_IH=?FEC_REC_IH '
      '  ,INVERSION_SUJETO_PASIVO=?INVERSION_SUJETO_PASIVO '
      '  ,DECIMALES_UNIDADES=?DECIMALES_UNIDADES '
      '  ,SIGNO_UNIDADES=?SIGNO_UNIDADES '
      '  ,TIPO_IMPUESTO_ADICIONAL=?TIPO_IMPUESTO_ADICIONAL '
      '  ,P_IMPUESTO_ADICIONAL=?P_IMPUESTO_ADICIONAL '
      '  ,ID_ESC=?ID_ESC '
      '  ,ID_ESC_2=?ID_ESC_2 '
      '  ,ID_MEDIDA=?ID_MEDIDA '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,AGENTE=?AGENTE '
      '  ,PESO=?PESO '
      '  ,PESO_TOTAL=?PESO_TOTAL '
      '  ,PESO_REAL=?PESO_REAL '
      '  ,DIRECCION_ALM_LOGISTICO=?DIRECCION_ALM_LOGISTICO '
      '  ,LISTO_PARA_PREPARAR=?LISTO_PARA_PREPARAR '
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
    AutoCalcFields = False
    DataSource = DSQMCabecera
    Plan.Strings = (
      'PLAN (VER_DETALLE_PEDIDO CAB INDEX (GES_CABECERAS_S_ID),'
      '           VER_DETALLE_PEDIDO DET INDEX (GES_DETALLES_S_CAB_ID),'
      '           VER_DETALLE_PEDIDO PED INDEX (GES_DETALLES_S_PED_ID))')
    AfterDelete = QMDetalleAfterDelete
    AfterOpen = QMDetalleAfterOpen
    AfterPost = QMDetalleAfterPost
    AfterScroll = QMDetalleAfterScroll
    BeforeDelete = QMDetalleBeforeDelete
    BeforeEdit = AntesDeEditar
    BeforeInsert = QMDetalleBeforeInsert
    BeforePost = QMDetalleBeforePost
    OnCalcFields = QMDetalleCalcFields
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'ID_DETALLES_S ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_DETALLE_PEDIDO'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_DETALLES_S'
      'GES_DETALLES_S_PED')
    CamposBloqueo.Strings = (
      'ID_DETALLES_S'
      'ID_DETALLES_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
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
      DisplayLabel = 'L'#237'nea'
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
      FieldName = 'ARTICULO'
      OnChange = QMDetalleARTICULOChange
      EditMask = '>ccccccccccccccc;0;_'
      Size = 15
    end
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
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
      DisplayLabel = 'Comisi'#243'n'
      FieldName = 'COMISION'
      OnChange = QMDetalleCOMISIONChange
    end
    object QMDetalleP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
      OnChange = QMDetalleP_COSTEChange
    end
    object QMDetalleM_MOV_STOCK: TIntegerField
      DisplayLabel = 'Nro. Mov. Stock'
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
      DisplayLabel = '% Recargo'
      FieldName = 'P_RECARGO'
    end
    object QMDetalleBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object QMDetalleB_COMISION: TFloatField
      DisplayLabel = 'B. Comisi'#243'n'
      FieldName = 'B_COMISION'
    end
    object QMDetalleI_DESCUENTO: TFloatField
      DisplayLabel = 'Imp. Dto.'
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
      DisplayLabel = 'Imp. Comisi'#243'n'
      FieldName = 'I_COMISION'
    end
    object QMDetalleC_IVA: TFloatField
      DisplayLabel = 'C. IVA'
      FieldName = 'C_IVA'
    end
    object QMDetalleC_RECARGO: TFloatField
      DisplayLabel = 'C. Recargo'
      FieldName = 'C_RECARGO'
    end
    object QMDetalleT_COSTE: TFloatField
      DisplayLabel = 'T. Coste'
      FieldName = 'T_COSTE'
    end
    object QMDetalleM_BRUTO: TFloatField
      DisplayLabel = 'M. Bruto'
      FieldName = 'M_BRUTO'
    end
    object QMDetalleLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
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
    object QMDetalleUNIDADES_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'UNIDADES_PENDIENTES'
      ReadOnly = True
      OnGetText = QMDetalleUNIDADES_PENDIENTESGetText
    end
    object QMDetalleUNIDADES_EXT: TFloatField
      DisplayLabel = 'Uds. Ext.'
      FieldName = 'UNIDADES_EXT'
      OnGetText = QMDetalleUNIDADES_EXTGetText
    end
    object QMDetalleSERVIDO: TIntegerField
      DisplayLabel = 'Servido'
      FieldName = 'SERVIDO'
    end
    object QMDetalleDESCUENTO_2: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'DESCUENTO_2'
    end
    object QMDetalleDESCUENTO_3: TFloatField
      DisplayLabel = 'Dto 3'
      FieldName = 'DESCUENTO_3'
    end
    object QMDetalleUNIDADES_SEC: TFloatField
      DisplayLabel = 'Uds. Sec.'
      FieldName = 'UNIDADES_SEC'
      OnChange = QMDetalleUNIDADES_SECChange
    end
    object QMDetalleID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_DETALLES_S'
      ReadOnly = True
    end
    object QMDetalleID_S: TIntegerField
      DisplayLabel = 'ID Cab'
      FieldName = 'ID_S'
      ReadOnly = True
    end
    object QMDetalleID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
      ReadOnly = True
    end
    object QMDetalleID_C_A: TIntegerField
      DisplayLabel = 'ID Art. Cta.'
      FieldName = 'ID_C_A'
      ReadOnly = True
    end
    object QMDetalleCOMISION_LINEAL: TFloatField
      DisplayLabel = 'Com. Lineal'
      FieldName = 'COMISION_LINEAL'
    end
    object QMDetalleI_COMISION_LINEAL: TFloatField
      DisplayLabel = 'Imp. Com. Lineal'
      FieldName = 'I_COMISION_LINEAL'
    end
    object QMDetalleFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'Fecha Entrega Prev.'
      FieldName = 'FECHA_ENTREGA_PREV'
    end
    object QMDetalleDIRECCION_ENTREGA: TIntegerField
      DisplayLabel = 'Dir. Entrega'
      FieldName = 'DIRECCION_ENTREGA'
    end
    object QMDetalleFECHA_REC_DET: TDateTimeField
      DisplayLabel = 'Fecha Rec. Det.'
      FieldName = 'FECHA_REC_DET'
    end
    object QMDetalleTITULO_IDIOMA: TFIBStringField
      DisplayLabel = 'Desc. Idioma'
      FieldName = 'TITULO_IDIOMA'
      Size = 256
    end
    object QMDetalleORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
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
      DisplayLabel = 'ID P.'
      FieldName = 'ID_P'
    end
    object QMDetalleTIPO_LINEA: TFIBStringField
      DisplayLabel = 'Tipo L'#237'nea'
      FieldName = 'TIPO_LINEA'
      Size = 3
    end
    object QMDetalleMARGEN_KRI: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN_KRI'
    end
    object QMDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField
      DisplayLabel = 'Aplica Uds. Sec.'
      FieldName = 'APLICA_UNIDADES_SECUNDARIAS'
    end
    object QMDetallePROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMDetalleTIPO_LINEA_KRI: TIntegerField
      DisplayLabel = 'Tipo Linea'
      FieldName = 'TIPO_LINEA_KRI'
    end
    object QMDetalleNOTAS2: TBlobField
      DisplayLabel = 'Notas 2'
      FieldName = 'NOTAS2'
      Size = 8
    end
    object QMDetalleCRC_NOTAS: TFIBStringField
      DisplayLabel = 'CRC Notas'
      FieldName = 'CRC_NOTAS'
      Size = 15
    end
    object QMDetalleCRC_NOTAS2: TFIBStringField
      DisplayLabel = 'CRC Notas 2'
      FieldName = 'CRC_NOTAS2'
      Size = 15
    end
    object QMDetallePRO_NUM_PLANO: TFIBStringField
      DisplayLabel = 'Nro. Plano'
      FieldName = 'PRO_NUM_PLANO'
      Size = 35
    end
    object QMDetalleTIPO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Tipo U.Log.'
      FieldName = 'TIPO_UNIDAD_LOGISTICA'
      OnChange = QMDetalleTIPO_UNIDAD_LOGISTICAChange
      Size = 5
    end
    object QMDetalleUNIDADES_LOGISTICAS: TFloatField
      DisplayLabel = 'Uds. Log.'
      FieldName = 'UNIDADES_LOGISTICAS'
      OnChange = QMDetalleUNIDADES_LOGISTICASChange
    end
    object QMDetalleTITULO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Titulo Ud. Log.'
      FieldName = 'TITULO_UNIDAD_LOGISTICA'
      Size = 35
    end
    object QMDetalleLOTE_SIMPLE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE_SIMPLE'
    end
    object QMDetalleESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMDetalleCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMDetalleMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMDetalleUNIDADES_SERVIDAS: TFloatField
      DisplayLabel = 'Uds. Servidas'
      FieldName = 'UNIDADES_SERVIDAS'
      ReadOnly = True
      OnGetText = QMDetalleUNIDADES_SERVIDASGetText
    end
    object QMDetalleUNIDADES_RESERVADAS: TFloatField
      DisplayLabel = 'Uds. Reservadas'
      FieldName = 'UNIDADES_RESERVADAS'
      OnGetText = QMDetalleUNIDADES_RESERVADASGetText
    end
    object QMDetalleENTRADA_AGRUPACION: TIntegerField
      DisplayLabel = 'Seleccionado'
      FieldName = 'ENTRADA_AGRUPACION'
    end
    object QMDetalleORDEN_PRODUCCION: TIntegerField
      DisplayLabel = 'Ord. Producccion'
      FieldName = 'ORDEN_PRODUCCION'
    end
    object QMDetallePAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMDetalleID_DESPIECE: TIntegerField
      DisplayLabel = 'Id. Despiece'
      FieldName = 'ID_DESPIECE'
    end
    object QMDetalleFECHA_CONF_DET: TDateTimeField
      DisplayLabel = 'Fecha Conf. Det.'
      FieldName = 'FECHA_CONF_DET'
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
    object QMDetalleCOSTE_ADICIONAL: TFloatField
      DisplayLabel = 'Coste Adic.'
      FieldName = 'COSTE_ADICIONAL'
    end
    object QMDetalleID_ORDEN: TIntegerField
      DisplayLabel = 'Id. Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMDetalleID_ESC: TIntegerField
      DisplayLabel = 'Id. Esc.'
      FieldName = 'ID_ESC'
    end
    object QMDetalleID_MEDIDA: TIntegerField
      DisplayLabel = 'Id. Medida'
      FieldName = 'ID_MEDIDA'
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
    object QMDetalleSTOCK_ALM: TFloatField
      DisplayLabel = 'Stock Alm.'
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM'
      Calculated = True
    end
    object QMDetalleSTOCK_ALM2: TFloatField
      DisplayLabel = 'Stock Alm. 2'
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM2'
      Calculated = True
    end
    object QMDetalleSTOCK_ALM3: TFloatField
      DisplayLabel = 'Stock Alm. 3'
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM3'
      Calculated = True
    end
    object QMDetalleSTOCKV_ALM: TFloatField
      DisplayLabel = 'Stock Virt. Alm.'
      FieldKind = fkCalculated
      FieldName = 'STOCKV_ALM'
      Calculated = True
    end
    object QMDetalleSTOCKV_ALM2: TFloatField
      DisplayLabel = 'Stock Virt. Alm. 2'
      FieldKind = fkCalculated
      FieldName = 'STOCKV_ALM2'
      Calculated = True
    end
    object QMDetalleSTOCKV_ALM3: TFloatField
      DisplayLabel = 'Stock Virt. Alm. 3'
      FieldKind = fkCalculated
      FieldName = 'STOCKV_ALM3'
      Calculated = True
    end
    object QMDetalleSTOCKR_ALM: TFloatField
      DisplayLabel = 'Stock Real Alm.'
      FieldKind = fkCalculated
      FieldName = 'STOCKR_ALM'
      Calculated = True
    end
    object QMDetalleSTOCKR_ALM2: TFloatField
      DisplayLabel = 'Stock Real Alm. 2'
      FieldKind = fkCalculated
      FieldName = 'STOCKR_ALM2'
      Calculated = True
    end
    object QMDetalleSTOCKR_ALM3: TFloatField
      DisplayLabel = 'Stock Real Alm. 3'
      FieldKind = fkCalculated
      FieldName = 'STOCKR_ALM3'
      Calculated = True
    end
    object QMDetalleSTOCKM_ALM: TFloatField
      DisplayLabel = 'S. Mont. Alm. 1'
      FieldKind = fkCalculated
      FieldName = 'STOCKM_ALM'
      Calculated = True
    end
    object QMDetalleSTOCKM_ALM2: TFloatField
      DisplayLabel = 'S. Mont. Alm. 2'
      FieldKind = fkCalculated
      FieldName = 'STOCKM_ALM2'
      Calculated = True
    end
    object QMDetalleSTOCKM_ALM3: TFloatField
      DisplayLabel = 'S. Mont. Alm. 3'
      FieldKind = fkCalculated
      FieldName = 'STOCKM_ALM3'
      Calculated = True
    end
    object QMDetalleSTOCK_VIRTUAL: TFloatField
      DisplayLabel = 'S. Virtual'
      FieldKind = fkCalculated
      FieldName = 'STOCK_VIRTUAL'
      ReadOnly = True
      Calculated = True
    end
    object QMDetalleSTOCK_REAL: TFloatField
      DisplayLabel = 'Stock Real'
      FieldKind = fkCalculated
      FieldName = 'STOCK_REAL'
      Calculated = True
    end
    object QMDetalleSTOCK_MONTURAS: TFloatField
      DisplayLabel = 'S. Montura'
      FieldKind = fkCalculated
      FieldName = 'STOCK_MONTURAS'
      Calculated = True
    end
    object QMDetalleSTOCK_REF_BASE: TFloatField
      DisplayLabel = 'S. Ref. Base'
      FieldKind = fkCalculated
      FieldName = 'STOCK_REF_BASE'
      Calculated = True
    end
    object QMDetalleUNIDADES_PREPARADAS: TFloatField
      DisplayLabel = 'U. Prep.'
      FieldName = 'UNIDADES_PREPARADAS'
      OnGetText = QMDetalleUNIDADES_PREPARADASGetText
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
    object QMDetalleAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
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
    object QMDetalleDIRECCION_ALM_LOGISTICO: TIntegerField
      DisplayLabel = 'Dir. Alm. Logistico'
      FieldName = 'DIRECCION_ALM_LOGISTICO'
    end
    object QMDetalleID_ESC_2: TIntegerField
      DisplayLabel = 'Id Esc. 2'
      FieldName = 'ID_ESC_2'
    end
    object QMDetalleU_POR_U_LOGISTICA: TFloatField
      DisplayLabel = 'Uds./U.Log.'
      FieldName = 'U_POR_U_LOGISTICA'
    end
    object QMDetalleRELACIONAR_U_LOGISTICA: TIntegerField
      DisplayLabel = 'Rel. U. Log.'
      FieldName = 'RELACIONAR_U_LOGISTICA'
    end
    object QMDetallePEDIR: TIntegerField
      DisplayLabel = 'Pedir'
      FieldName = 'PEDIR'
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
    object QMDetalleSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldKind = fkCalculated
      FieldName = 'STOCK'
      Calculated = True
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
    Left = 128
    Top = 56
  end
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CABECERAS_PEDIDO'
      'WHERE'
      '  ID_S=?old_ID_S ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CABECERAS_PEDIDO'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,ALMACEN,MONEDA,FECHA' +
        ',TERCERO,TITULO,'#13#10'DIRECCION,DIR_NOMBRE_2,CODIGO_POSTAL,LOCALIDAD' +
        ',CLIENTE,CONTACTO,SU_REFERENCIA,FORMA_PAGO,BANCO,'#13#10'CAMPANYA,NOTA' +
        'S,ESTADO,BULTOS,LINEAS,BRUTO,I_DTO_LINEAS,S_BASES,M_BRUTO,C_TOTA' +
        'L,'#13#10'AGENTE,S_CUOTA_IVA,S_CUOTA_RE,B_DTO_LINEAS,DTO_PP,DTO_CIAL,I' +
        '_DTO_CIAL,I_DTO_PP,B_COMISION,I_COMISION,'#13#10'POR_FINANCIACION,I_FI' +
        'NANCIACION,ENTRADA,FECHA_ENTREGA_PREV,FECHA_REC_CAB,SERVIDO,NOMB' +
        'RE_COMERCIAL,PORTES,TARIFA,'#13#10'AGRUPACION_KRI,ID_S,IDIOMA,MARGEN_K' +
        'RI,TIPO_PORTES,POR_PORTES,I_PORTES,I_PORTES_CANAL,CAMBIO_FIJO,VA' +
        'LOR_CAMB_FIJO,'#13#10'PROYECTO,NOTAS_INTERNAS_KRI,TIPO_LINEA_KRI,FECHA' +
        '_CLIENTE,FECHA_CREACION_KRI,PEDIDO_CLIENTE,RANGO,INDICE,'#13#10'TRANSPO' +
        'RTISTA,MODIFICA_DOC,Z_CONTACTO,Z_COD_BARRAS_PED,LISTO_PARA_PREPA' +
        'RAR,PEDIDO_VALORADO,EMPLEADO_RESPONSABLE,EMPLEADO_ATENCION,DOCUM' +
        'ENTO_MUESTRAS,INVERSION_SUJETO_PASIVO,'#13#10'ASEGURADO,PACIENTE,AUTOR' +
        'IZACION,POLIZA,FEC_REC_IH,Z_OBSERVACION,CANAL_DST_PEC,SERIE_DST_' +
        'PEC,'#13#10'TIPO_DST_PEC,EMPAQUETADO_EMPRESA,DIR_RECOGIDA_MANUAL,DIR_E' +
        'NTREGA_MANUAL,EQUIPO_RECOGIDA,EQUIPO_ENTREGA,MATRICULA_RECOGIDA,' +
        'MATRICULA_ENTREGA,FECHA_RECOGIDA_MANUAL,'#13#10'FECHA_ENTREGA_MANUAL,U' +
        'SUARIO_CREACION,USUARIO,RUTA,RUTA_ORDEN,MODO_IVA,ID_FICHA_TECNIC' +
        'A,TRATADO,ORIGEN_DOCUMENTO)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ALMACEN,?MONE' +
        'DA,?FECHA,?TERCERO,?TITULO,'#13#10'?DIRECCION,?DIR_NOMBRE_2,?CODIGO_PO' +
        'STAL,?LOCALIDAD,?CLIENTE,?CONTACTO,?SU_REFERENCIA,?FORMA_PAGO,?B' +
        'ANCO,'#13#10'?CAMPANYA,?NOTAS,?ESTADO,?BULTOS,?LINEAS,?BRUTO,?I_DTO_LI' +
        'NEAS,?S_BASES,?M_BRUTO,?C_TOTAL,'#13#10'?AGENTE,?S_CUOTA_IVA,?S_CUOTA_' +
        'RE,?B_DTO_LINEAS,?DTO_PP,?DTO_CIAL,?I_DTO_CIAL,?I_DTO_PP,?B_COMI' +
        'SION,?I_COMISION,'#13#10'?POR_FINANCIACION,?I_FINANCIACION,?ENTRADA,?F' +
        'ECHA_ENTREGA_PREV,?FECHA_REC_CAB,?SERVIDO,?NOMBRE_COMERCIAL,?POR' +
        'TES,?TARIFA,'#13#10'?AGRUPACION_KRI,?ID_S,?IDIOMA,?MARGEN_KRI,?TIPO_PO' +
        'RTES,?POR_PORTES,?I_PORTES,?I_PORTES_CANAL,?CAMBIO_FIJO,?VALOR_C' +
        'AMB_FIJO,'#13#10'?PROYECTO,?NOTAS_INTERNAS_KRI,?TIPO_LINEA_KRI,?FECHA_' +
        'CLIENTE,?FECHA_CREACION_KRI,?PEDIDO_CLIENTE,?RANGO,?INDICE,'#13#10'?TRA' +
        'NSPORTISTA,?MODIFICA_DOC,?Z_CONTACTO,?Z_COD_BARRAS_PED,?LISTO_PA' +
        'RA_PREPARAR,?PEDIDO_VALORADO,?EMPLEADO_RESPONSABLE,?EMPLEADO_ATE' +
        'NCION,?DOCUMENTO_MUESTRAS,?INVERSION_SUJETO_PASIVO,'#13#10'?ASEGURADO,' +
        '?PACIENTE,?AUTORIZACION,?POLIZA,?FEC_REC_IH,?Z_OBSERVACION,?CANA' +
        'L_DST_PEC,?SERIE_DST_PEC,'#13#10'?TIPO_DST_PEC,?EMPAQUETADO_EMPRESA,?D' +
        'IR_RECOGIDA_MANUAL,?DIR_ENTREGA_MANUAL,?EQUIPO_RECOGIDA,?EQUIPO_' +
        'ENTREGA,?MATRICULA_RECOGIDA,?MATRICULA_ENTREGA,?FECHA_RECOGIDA_M' +
        'ANUAL,'#13#10'?FECHA_ENTREGA_MANUAL,?USUARIO_CREACION,?USUARIO,?RUTA,?' +
        'RUTA_ORDEN,?MODO_IVA,?ID_FICHA_TECNICA,?TRATADO,?ORIGEN_DOCUMENT' +
        'O)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_PEDIDO'
      'WHERE'
      '  ID_S=?ID_S ')
    SelectSQL.Strings = (
      '/* Se establece en el OnCreate */'
      'SELECT * FROM VER_CABECERAS_PEDIDO'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'CANAL=?CANAL AND'
      'SERIE=?SERIE AND'
      'TIPO='#39'PEC'#39
      
        'AND (EJERCICIO=?EJERCICIO OR ((EJERCICIO < ?EJERCICIO) AND (ESTA' +
        'DO = 0 OR ESTADO=3))) '
      'ORDER BY EJERCICIO, RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CABECERAS_PEDIDO'
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
      '  ,FECHA_ENTREGA_PREV=?FECHA_ENTREGA_PREV '
      '  ,FECHA_REC_CAB=?FECHA_REC_CAB '
      '  ,SERVIDO=?SERVIDO '
      '  ,NOMBRE_COMERCIAL=?NOMBRE_COMERCIAL '
      '  ,PORTES=?PORTES '
      '  ,TARIFA=?TARIFA '
      '  ,AGRUPACION_KRI=?AGRUPACION_KRI '
      '  ,IDIOMA=?IDIOMA '
      '  ,MARGEN_KRI=?MARGEN_KRI '
      '  ,TIPO_PORTES=?TIPO_PORTES '
      '  ,POR_PORTES=?POR_PORTES '
      '  ,I_PORTES=?I_PORTES '
      '  ,I_PORTES_CANAL=?I_PORTES_CANAL '
      '  ,CAMBIO_FIJO=?CAMBIO_FIJO '
      '  ,VALOR_CAMB_FIJO=?VALOR_CAMB_FIJO '
      '  ,PROYECTO=?PROYECTO '
      '  ,NOTAS_INTERNAS_KRI=?NOTAS_INTERNAS_KRI '
      '  ,TIPO_LINEA_KRI=?TIPO_LINEA_KRI '
      '  ,FECHA_CLIENTE=?FECHA_CLIENTE '
      '  ,FECHA_CREACION_KRI=?FECHA_CREACION_KRI '
      '  ,PEDIDO_CLIENTE=?PEDIDO_CLIENTE '
      '  ,RANGO=?RANGO '
      '  ,INDICE=?INDICE '
      '  ,TRANSPORTISTA=?TRANSPORTISTA '
      '  ,MODIFICA_DOC=?MODIFICA_DOC '
      '  ,Z_CONTACTO=?Z_CONTACTO '
      '  ,Z_COD_BARRAS_PED=?Z_COD_BARRAS_PED '
      '  ,LISTO_PARA_PREPARAR=?LISTO_PARA_PREPARAR '
      '  ,PEDIDO_VALORADO=?PEDIDO_VALORADO '
      '  ,EMPLEADO_RESPONSABLE=?EMPLEADO_RESPONSABLE '
      '  ,EMPLEADO_ATENCION=?EMPLEADO_ATENCION '
      '  ,DOCUMENTO_MUESTRAS=?DOCUMENTO_MUESTRAS '
      '  ,INVERSION_SUJETO_PASIVO=?INVERSION_SUJETO_PASIVO '
      '  ,ASEGURADO=?ASEGURADO '
      '  ,PACIENTE=?PACIENTE '
      '  ,AUTORIZACION=?AUTORIZACION '
      '  ,POLIZA=?POLIZA '
      '  ,FEC_REC_IH=?FEC_REC_IH '
      '  ,Z_OBSERVACION=?Z_OBSERVACION '
      '  ,CANAL_DST_PEC=?CANAL_DST_PEC '
      '  ,SERIE_DST_PEC=?SERIE_DST_PEC '
      '  ,TIPO_DST_PEC=?TIPO_DST_PEC '
      '  ,EMPAQUETADO_EMPRESA=?EMPAQUETADO_EMPRESA '
      '  ,DIR_RECOGIDA_MANUAL=?DIR_RECOGIDA_MANUAL '
      '  ,DIR_ENTREGA_MANUAL=?DIR_ENTREGA_MANUAL '
      '  ,EQUIPO_RECOGIDA=?EQUIPO_RECOGIDA '
      '  ,EQUIPO_ENTREGA=?EQUIPO_ENTREGA '
      '  ,MATRICULA_RECOGIDA=?MATRICULA_RECOGIDA '
      '  ,MATRICULA_ENTREGA=?MATRICULA_ENTREGA '
      '  ,FECHA_RECOGIDA_MANUAL=?FECHA_RECOGIDA_MANUAL '
      '  ,FECHA_ENTREGA_MANUAL=?FECHA_ENTREGA_MANUAL '
      '  ,USUARIO_CREACION=?USUARIO_CREACION '
      '  ,USUARIO=?USUARIO '
      '  ,RUTA=?RUTA '
      '  ,RUTA_ORDEN=?RUTA_ORDEN '
      '  ,MODO_IVA=?MODO_IVA '
      '  ,ID_FICHA_TECNICA=?ID_FICHA_TECNICA '
      '  ,TRATADO=?TRATADO '
      '  ,ORIGEN_DOCUMENTO=?ORIGEN_DOCUMENTO '
      'WHERE'
      '  ID_S=?ID_S ')
    AutoCalcFields = False
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CABECERAS_PEDIDO CAB INDEX (GES_CABECERAS_S' +
        '_IDX2),'
      
        '                 VER_CABECERAS_PEDIDO PED INDEX (GES_CABECERAS_S' +
        '_PED_ID),'
      
        '                 VER_CABECERAS_PEDIDO TER INDEX (PK_SYS_TERCEROS' +
        ')))')
    AfterDelete = Graba
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
    TableName = 'VER_CABECERAS_PEDIDO'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_PED')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 8
    object QMCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCabeceraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCabeceraSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabeceraTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCabeceraRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCabeceraALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      OnChange = QMCabeceraALMACENChange
      Size = 3
    end
    object QMCabeceraMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      OnChange = QMCabeceraMONEDAChange
      Size = 3
    end
    object QMCabeceraFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
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
      DisplayLabel = 'L'#237'neas'
      FieldName = 'LINEAS'
    end
    object QMCabeceraBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object QMCabeceraI_DTO_LINEAS: TFloatField
      DisplayLabel = 'Imp. Dto. L'#237'neas'
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
    end
    object QMCabeceraAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
      OnChange = QMCabeceraAGENTEChange
    end
    object QMCabeceraS_CUOTA_IVA: TFloatField
      DisplayLabel = 'S. Cuota IVA'
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
      DisplayLabel = 'Dto. PP'
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
      DisplayLabel = 'Imp. Dto. PP.'
      FieldName = 'I_DTO_PP'
    end
    object QMCabeceraB_COMISION: TFloatField
      DisplayLabel = 'B. Comisi'#243'n'
      FieldName = 'B_COMISION'
    end
    object QMCabeceraI_COMISION: TFloatField
      DisplayLabel = 'Imp. Comisi'#243'n'
      FieldName = 'I_COMISION'
    end
    object QMCabeceraPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object QMCabeceraI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Financ.'
      FieldName = 'I_FINANCIACION'
    end
    object QMCabeceraLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object QMCabeceraENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMCabeceraTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      OnGetText = QMCabeceraTITULOGetText
      Size = 60
    end
    object QMCabeceraFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'Fec. Entrega'
      FieldName = 'FECHA_ENTREGA_PREV'
    end
    object QMCabeceraSERVIDO: TIntegerField
      DisplayLabel = 'Servido'
      FieldName = 'SERVIDO'
    end
    object QMCabeceraFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      OnChange = QMCabeceraFORMA_PAGOChange
      Size = 3
    end
    object QMCabeceraCAMPANYA: TIntegerField
      DisplayLabel = 'Camapa'#241'a'
      FieldName = 'CAMPANYA'
      OnChange = QMCabeceraCAMPANYAChange
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
      DisplayLabel = 'Total Can.'
      FieldKind = fkCalculated
      FieldName = 'TOTAL_CANAL'
      OnGetText = QMCabeceraTOTAL_CANALGetText
      Calculated = True
    end
    object QMCabeceraNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMCabeceraTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      OnChange = QMCabeceraTARIFAChange
      Size = 3
    end
    object QMCabeceraID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMCabeceraAGRUPACION_KRI: TIntegerField
      DisplayLabel = 'Agrupaci'#243'n'
      FieldName = 'AGRUPACION_KRI'
    end
    object QMCabeceraFECHA_REC_CAB: TDateTimeField
      DisplayLabel = 'Fec. Rec. Cab.'
      FieldName = 'FECHA_REC_CAB'
    end
    object QMCabeceraIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      OnChange = QMCabeceraIDIOMAChange
      Size = 3
    end
    object QMCabeceraCAMBIO_FIJO: TIntegerField
      DisplayLabel = 'Cambio Fijo'
      FieldName = 'CAMBIO_FIJO'
    end
    object QMCabeceraVALOR_CAMB_FIJO: TFloatField
      DisplayLabel = 'Valor Cambio Fijo'
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
    object QMCabeceraUSUARIO_CREACION: TIntegerField
      DisplayLabel = 'Usuario Creacion'
      FieldName = 'USUARIO_CREACION'
    end
    object QMCabeceraCONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
      OnChange = QMCabeceraCONTACTOChange
    end
    object QMCabeceraMARGEN_KRI: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN_KRI'
    end
    object QMCabeceraPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
      OnChange = QMCabeceraPROYECTOChange
    end
    object QMCabeceraNOTAS_INTERNAS_KRI: TBlobField
      DisplayLabel = 'Notas Int.'
      FieldName = 'NOTAS_INTERNAS_KRI'
      Size = 8
    end
    object QMCabeceraTIPO_LINEA_KRI: TIntegerField
      DisplayLabel = 'Tipo Linea'
      FieldName = 'TIPO_LINEA_KRI'
    end
    object QMCabeceraFECHA_CLIENTE: TDateTimeField
      DisplayLabel = 'Fecha Cli.'
      FieldName = 'FECHA_CLIENTE'
    end
    object QMCabeceraFECHA_CREACION_KRI: TDateTimeField
      DisplayLabel = 'Fecha Creaci'#243'n'
      FieldName = 'FECHA_CREACION_KRI'
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
    object QMCabeceraPEDIDO_CLIENTE: TFIBStringField
      DisplayLabel = 'Nro. Pedido'
      FieldName = 'PEDIDO_CLIENTE'
      Size = 60
    end
    object QMCabeceraTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
      OnChange = QMCabeceraTRANSPORTISTAChange
    end
    object QMCabeceraMODIFICA_DOC: TIntegerField
      DisplayLabel = 'Listado'
      FieldName = 'MODIFICA_DOC'
    end
    object QMCabeceraZ_COD_BARRAS_PED: TIntegerField
      DisplayLabel = 'Cod Barras'
      FieldName = 'Z_COD_BARRAS_PED'
    end
    object QMCabeceraPED_PROV_ASOCIADO: TStringField
      DisplayLabel = 'Ped. Prov. Asociado'
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'PED_PROV_ASOCIADO'
      OnGetText = QMCabeceraPED_PROV_ASOCIADOGetText
      Size = 30
      Calculated = True
    end
    object QMCabeceraLISTO_PARA_PREPARAR: TIntegerField
      FieldName = 'LISTO_PARA_PREPARAR'
    end
    object QMCabeceraPEDIDO_VALORADO: TIntegerField
      DisplayLabel = 'Valorado'
      FieldName = 'PEDIDO_VALORADO'
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
    object QMCabeceraDOCUMENTO_MUESTRAS: TIntegerField
      DisplayLabel = 'Muestras'
      FieldName = 'DOCUMENTO_MUESTRAS'
    end
    object QMCabeceraTOTAL_ANTICIPADO: TFloatField
      DisplayLabel = 'T. Anticipado'
      FieldName = 'TOTAL_ANTICIPADO'
    end
    object QMCabeceraMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldKind = fkCalculated
      FieldName = 'MARGEN'
      Calculated = True
    end
    object QMCabeceraTIT_CONTACTO: TFIBStringField
      DisplayLabel = 'Tit. Contacto'
      FieldName = 'TIT_CONTACTO'
      Size = 81
    end
    object QMCabeceraINVERSION_SUJETO_PASIVO: TIntegerField
      DisplayLabel = 'Inv. Sujeto Pasivo'
      FieldName = 'INVERSION_SUJETO_PASIVO'
    end
    object QMCabeceraUNIDADES: TFloatField
      DisplayLabel = 'Total Uds.'
      FieldName = 'UNIDADES'
    end
    object QMCabeceraASEGURADO: TFIBStringField
      DisplayLabel = 'Asegurado'
      FieldName = 'ASEGURADO'
      Size = 25
    end
    object QMCabeceraPACIENTE: TFIBStringField
      DisplayLabel = 'Paciente'
      FieldName = 'PACIENTE'
      Size = 25
    end
    object QMCabeceraAUTORIZACION: TFIBStringField
      DisplayLabel = 'Autorizacion'
      FieldName = 'AUTORIZACION'
    end
    object QMCabeceraPOLIZA: TFIBStringField
      DisplayLabel = 'Poliza'
      FieldName = 'POLIZA'
    end
    object QMCabeceraFEC_REC_IH: TDateTimeField
      DisplayLabel = 'Fecha Rec IH'
      FieldName = 'FEC_REC_IH'
    end
    object QMCabeceraBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object QMCabeceraZ_OBSERVACION: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'Z_OBSERVACION'
      Size = 256
    end
    object QMCabeceraDIR_ENTREGA_MANUAL: TBlobField
      DisplayLabel = 'Dir. Entrega Manual'
      FieldName = 'DIR_ENTREGA_MANUAL'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabeceraUSUARIO: TIntegerField
      DisplayLabel = 'Operario'
      FieldName = 'USUARIO'
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
    object QMCabeceraDIR_RECOGIDA_MANUAL: TBlobField
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
    object QMCabeceraRUTA: TIntegerField
      DisplayLabel = 'Ruta'
      FieldName = 'RUTA'
    end
    object QMCabeceraRUTA_ORDEN: TIntegerField
      DisplayLabel = 'Orden Ruta'
      FieldName = 'RUTA_ORDEN'
    end
    object QMCabeceraCANAL_DST_PEC: TIntegerField
      DisplayLabel = 'Canal Destino'
      FieldName = 'CANAL_DST_PEC'
    end
    object QMCabeceraSERIE_DST_PEC: TFIBStringField
      DisplayLabel = 'Serie Destino'
      FieldName = 'SERIE_DST_PEC'
      Size = 10
    end
    object QMCabeceraTIPO_DST_PEC: TFIBStringField
      DisplayLabel = 'Tipo Doc. Destino'
      FieldName = 'TIPO_DST_PEC'
      Size = 3
    end
    object QMCabeceraMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object QMCabeceraID_FICHA_TECNICA: TIntegerField
      DisplayLabel = 'Id Ficha Tec.'
      FieldName = 'ID_FICHA_TECNICA'
    end
    object QMCabeceraTRATADO: TIntegerField
      DisplayLabel = 'Tratado'
      FieldName = 'TRATADO'
    end
    object QMCabeceraDIR_NOMBRE_2: TFIBStringField
      DisplayLabel = 'Dir. Nombre 2'
      FieldName = 'DIR_NOMBRE_2'
      Size = 40
    end
    object QMCabeceraZ_CONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'Z_CONTACTO'
    end
    object QMCabeceraQPIDE: TFIBStringField
      DisplayLabel = 'Quien Pide'
      FieldName = 'QPIDE'
      Size = 17
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
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 128
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
      'SU_REFERENCIA, IMPORTE_MINIMO_PORTE'
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
      'TIPO_DOC_IDENT, NIF, DIAS_ENTREGA, '
      'PEDIDO_VALORADO, MODO_IVA, TIPO_NCF, RECC,'
      'GRUPO_CUENTAS, FECHA_ENTREGA_X_STOCK,'
      'SU_REFERENCIA, IMPORTE_MINIMO_PORTE,'
      'ID_CLIENTE, RUTA, RUTA_ORDEN, ENVIAR_CONFIRMACION_PEDIDO'
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
    Left = 32
    Top = 104
  end
  object DSxCliente: TDataSource
    DataSet = xCliente
    Left = 128
    Top = 104
  end
  object xAgentes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_AGENTES                    '
      'WHERE EMPRESA=?EMPRESA AND AGENTE=?AGENTE')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 32
    Top = 200
  end
  object DSxAgentes: TDataSource
    DataSet = xAgentes
    Left = 128
    Top = 200
  end
  object xDirecciones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, DIR_TRANSPORTISTA '
      'FROM VER_DIRECCIONES '
      'WHERE '
      'TERCERO=?TERCERO AND '
      'DIRECCION=?DIRECCION')
    UniDirectional = False
    DataSource = DSQMCabecera
    Plan.Strings = (
      
        'PLAN JOIN (VER_DIRECCIONES SD INDEX (PK_SYS_TERCEROS_DIRECCIONES' +
        '),VER_DIRECCIONES SL INDEX (ID_LOCALIDADES))')
    Left = 32
    Top = 152
    object xDireccionesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      OnGetText = xDireccionesTITULOGetText
      Size = 110
    end
    object xDireccionesDIR_TRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transp. Dir.'
      FieldName = 'DIR_TRANSPORTISTA'
    end
  end
  object DSxDirecciones: TDataSource
    DataSet = xDirecciones
    Left = 128
    Top = 152
  end
  object xInfoActualizada: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    SelectSQL.Strings = (
      'WITH I'
      
        'AS (SELECT P.BULTOS, P.S_BASES, P.S_CUOTA_IVA, P.S_CUOTA_RE, P.L' +
        'IQUIDO, P.B_COMISION, P.I_COMISION, P.I_FINANCIACION,'
      
        '           P.B_DTO_LINEAS, P.I_DTO_LINEAS, P.ESTADO, P.I_PORTES,' +
        ' P.MODIFICA_DOC,'
      '           (SELECT SUM(D.B_DTO_LINEA)'
      '            FROM GES_DETALLES_S D'
      '            JOIN ART_ARTICULOS AA ON D.ID_A = AA.ID_A'
      '            WHERE'
      '            D.ID_S = P.ID_S AND'
      '            AA.INFLUYE_MARGEN = 1) SUMA_BASES,'
      '           (SELECT SUM(D.T_COSTE)'
      '            FROM GES_DETALLES_S D'
      '            JOIN ART_ARTICULOS AA ON D.ID_A = AA.ID_A'
      '            WHERE'
      '            D.ID_S = P.ID_S AND'
      '            AA.INFLUYE_MARGEN = 1) SUMA_COSTES,'
      '           (SELECT SUM(UNIDADES)'
      '            FROM GES_DETALLES_S'
      '            WHERE'
      '            ID_S = P.ID_S) SUM_UNIDADES,'
      '           (SELECT SUM(UNIDADES_SEC)'
      '            FROM GES_DETALLES_S'
      '            WHERE'
      '            ID_S = P.ID_S) SUM_UNIDADES_SEC,'
      '           (SELECT SUM(UNIDADES_LOGISTICAS)'
      '            FROM GES_DETALLES_S_PED'
      '            WHERE'
      '            ID_S = P.ID_S) SUM_UNIDADES_LOGISTICAS,'
      '           (SELECT SUM(PESO_REAL)'
      '            FROM GES_DETALLES_S'
      '            WHERE'
      '            ID_S = P.ID_S) SUM_PESO,'
      '           (SELECT COUNT(LINEA)'
      '            FROM GES_DETALLES_S'
      '            WHERE'
      '            ID_S = P.ID_S) COUNT_LINEA,'
      '           ((COALESCE((SELECT SUM(DET.LIQUIDO)'
      '                       FROM G_RELACIONES_ORIGENES_ID(P.ID_S) DOC'
      
        '                       JOIN GES_CABECERAS_S_CAR REC ON REC.ID_S ' +
        '= DOC.ID_S'
      
        '                       JOIN EMP_CARTERA CAR ON REC.ID_CARTERA = ' +
        'CAR.ID_CARTERA'
      
        '                       JOIN EMP_CARTERA_DETALLE DET ON DET.ID_CA' +
        'RTERA = CAR.ID_CARTERA), 0) + --'
      '           (COALESCE((SELECT SUM(DET.LIQUIDO)'
      '                      FROM GES_CABECERAS_S DOC'
      
        '                      JOIN GES_CABECERAS_S_CAR REC ON REC.ID_S =' +
        ' DOC.ID_S'
      
        '                      JOIN EMP_CARTERA CAR ON REC.ID_CARTERA = C' +
        'AR.ID_CARTERA'
      
        '                      JOIN EMP_CARTERA_DETALLE DET ON DET.ID_CAR' +
        'TERA = CAR.ID_CARTERA'
      '                      WHERE'
      
        '                      DOC.ID_S = P.ID_S), 0)))) AS TOTAL_ANTICIP' +
        'ADO, --'
      
        '           EC.RIESGO_AUT, EC.RIESGO_EMP, EC.RIESGO_ACT, EC.NO_VE' +
        'NTA_RIESGO,'
      '           --'
      
        '           COALESCE((SELECT SUM(D.LIQUIDO / D.UNIDADES * PP.U_PE' +
        'NDIENTES)'
      '                     FROM GES_CABECERAS_S C'
      '                     JOIN GES_DETALLES_S D ON C.ID_S = D.ID_S'
      
        '                     JOIN GES_DETALLES_S_PED PP ON D.ID_DETALLES' +
        '_S = PP.ID_DETALLES_S'
      '                     WHERE'
      '                     C.EMPRESA = P.EMPRESA AND'
      '                     C.CANAL = P.CANAL AND'
      '                     C.TIPO = '#39'PEC'#39' AND'
      '                     C.ESTADO = 0 AND'
      '                     D.UNIDADES <> 0 AND'
      '                     PP.U_PENDIENTES <> 0 AND'
      '                     C.CLIENTE = P.CLIENTE), 0) RIESGO_PED'
      '    FROM VER_CABECERAS_PEDIDO P'
      
        '    JOIN EMP_CLIENTES EC ON EC.EMPRESA = P.EMPRESA AND EC.CLIENT' +
        'E = P.CLIENTE'
      '    WHERE'
      '    P.ID_S = :ID_S)'
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
    Left = 248
    Top = 152
    object xInfoActualizadaBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
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
    object xInfoActualizadaLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
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
    object xInfoActualizadaB_DTO_LINEAS: TFloatField
      DisplayLabel = 'B. Dto. Lineas'
      FieldName = 'B_DTO_LINEAS'
    end
    object xInfoActualizadaI_DTO_LINEAS: TFloatField
      DisplayLabel = 'Imp. Dto. Lineas'
      FieldName = 'I_DTO_LINEAS'
    end
    object xInfoActualizadaESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
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
      FieldKind = fkCalculated
      FieldName = 'TITULO_ESTADO'
      OnGetText = xInfoActualizadaTITULO_ESTADOGetText
      Size = 40
      Calculated = True
    end
    object xInfoActualizadaTOTAL_ANTICIPADO: TFloatField
      DisplayLabel = 'T. Anticipado'
      FieldName = 'TOTAL_ANTICIPADO'
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
    Left = 352
    Top = 152
  end
  object EntornoDoc: TEntornoFind2000
    Empresa = 0
    Ejercicio = 0
    Canal = 0
    Tercero = 0
    Cliente = 0
    Pgc = 0
    Left = 752
    Top = 8
  end
  object xAlmacenes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM ART_ALMACENES'
      'where empresa=?empresa and almacen=?almacen')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 32
    Top = 248
  end
  object DSxAlmacenes: TDataSource
    DataSet = xAlmacenes
    Left = 128
    Top = 248
  end
  object xCampanyas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_CAMPANYAS_ACTIVAS'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      'CAMPANYA=?CAMPANYA')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 248
    Top = 56
    object xCampanyasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxCampanyas: TDataSource
    DataSet = xCampanyas
    Left = 352
    Top = 56
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
      
        'SELECT TITULO,PRONTO_PAGO,HEREDA_FINANCIACION, DIAS_1_PLAZO FROM' +
        ' CON_CUENTAS_GES_FP'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND FORMA_PAGO=?FORMA_PAGO'
      '')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 248
    Top = 104
  end
  object DSxFormasPago: TDataSource
    DataSet = xFormasPago
    Left = 352
    Top = 104
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 752
    Top = 56
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      
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
        ', A.NO_APLICA_DESC_LINEA_CLIENTE, A.Z_COM_CORTE'
      'FROM ART_ARTICULOS A'
      'JOIN SYS_UNIDADES_ARTICULOS U ON A.UNIDADES = U.TIPO'
      'WHERE'
      'A.EMPRESA = :EMPRESA AND'
      'A.ARTICULO = :ARTICULO')
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
    Left = 248
    Top = 344
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 128
    Top = 344
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'SELECT TITULO, SIGNO_MONEDA, DEC_VER, DEC_CALCULOS FROM SYS_MONE' +
        'DAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 32
    Top = 344
  end
  object xTarifas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_TARIFAS_ARTICULO'
      'WHERE  EMPRESA = ?EMPRESA AND'
      'TARIFA = ?TARIFA')
    UniDirectional = False
    DataSource = DSQMCabecera
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_TARIFAS_ARTICULO ART INDEX (PK_ART_TARIFAS_' +
        'C),'
      'VER_TARIFAS_ARTICULO PROP INDEX (PK_ART_TARIFAS_PROPAGA)))'
      '')
    Left = 32
    Top = 296
  end
  object DSxTarifas: TDataSource
    DataSet = xTarifas
    Left = 128
    Top = 296
  end
  object QMarca: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'update TMP_PEDIDOS_POR_ENTRADA'
      '  set marcado=?marca'
      
        'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND ENTRADA=?ENT' +
        'RADA')
    Transaction = TLocal
    AutoTrans = True
    Left = 512
    Top = 64
  end
  object QMCabeceraEDI: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EDI_PED_CAB'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO EDI_PED_CAB'
      
        '  (FECHA,FECHAEPR,FECHAERE,FECHATOP,FCONTRAT,IMP_DES1,IMP_DES2,I' +
        'MP_DES3,IMP_DES4,IMP_DES5,BASEIMP1,IMPIMP1,BASEIMP2,IMPIMP2,BASE' +
        'IMP3,IMPIMP3,FECHAV,VTO1,IMPVTO1,VTO2,IMPVTO2,VTO3,IMPVTO3,TBRUT' +
        'O,TNETO,TCARGDES,BASEIMP,TOTIMPUES,TOTAL,FRECOGIDA,FREFPAG,TOTCA' +
        'NT,SERIE,RIG,PORCEN1,PORCEN2,PORCEN3,PORCEN4,PORCEN5,TASAIMP1,TA' +
        'SAIMP2,TASAIMP3,EMPRESA,EJERCICIO,CANAL,CLAVE1,SECUEN1,SECUEN2,S' +
        'ECUEN3,SECUEN4,SECUEN5,TIPO,NODO,FUNCION,NUMPED,FORMAPAG,CONDESP' +
        ',PEDABIER,LPRECIOS,NCONTRAT,CLIENTE,QPIDE,AQSF,DEPTO,RECEPTOR,MU' +
        'ELLE,VENDEDOR,QPAGA,PORTES,RECOGIDA,REPOSI,ENTREGA,MONEDA,CALIF1' +
        ',TIPO1,CALIF2,TIPO2,CALIF3,TIPO3,CALIF4,TIPO4,CALIF5,TIPO5,TIPOI' +
        'MP1,TIPOIMP2,TIPOIMP3,PATREF,PATDIAS,PATMES,TRANSPOR,ALMRECOG,TE' +
        'MPORA,SUCURSAL,DESTMSG,CONDPAGO,TRANSPORT,LUGADIENT,DEPTOVENT)'
      'VALUES'
      
        '  (?FECHA,?FECHAEPR,?FECHAERE,?FECHATOP,?FCONTRAT,?IMP_DES1,?IMP' +
        '_DES2,?IMP_DES3,?IMP_DES4,?IMP_DES5,?BASEIMP1,?IMPIMP1,?BASEIMP2' +
        ',?IMPIMP2,?BASEIMP3,?IMPIMP3,?FECHAV,?VTO1,?IMPVTO1,?VTO2,?IMPVT' +
        'O2,?VTO3,?IMPVTO3,?TBRUTO,?TNETO,?TCARGDES,?BASEIMP,?TOTIMPUES,?' +
        'TOTAL,?FRECOGIDA,?FREFPAG,?TOTCANT,?SERIE,?RIG,?PORCEN1,?PORCEN2' +
        ',?PORCEN3,?PORCEN4,?PORCEN5,?TASAIMP1,?TASAIMP2,?TASAIMP3,?EMPRE' +
        'SA,?EJERCICIO,?CANAL,?CLAVE1,?SECUEN1,?SECUEN2,?SECUEN3,?SECUEN4' +
        ',?SECUEN5,?TIPO,?NODO,?FUNCION,?NUMPED,?FORMAPAG,?CONDESP,?PEDAB' +
        'IER,?LPRECIOS,?NCONTRAT,?CLIENTE,?QPIDE,?AQSF,?DEPTO,?RECEPTOR,?' +
        'MUELLE,?VENDEDOR,?QPAGA,?PORTES,?RECOGIDA,?REPOSI,?ENTREGA,?MONE' +
        'DA,?CALIF1,?TIPO1,?CALIF2,?TIPO2,?CALIF3,?TIPO3,?CALIF4,?TIPO4,?' +
        'CALIF5,?TIPO5,?TIPOIMP1,?TIPOIMP2,?TIPOIMP3,?PATREF,?PATDIAS,?PA' +
        'TMES,?TRANSPOR,?ALMRECOG,?TEMPORA,?SUCURSAL,?DESTMSG,?CONDPAGO,?' +
        'TRANSPORT,?LUGADIENT,?DEPTOVENT)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EDI_PED_CAB'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EDI_PED_CAB'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EDI_PED_CAB'
      'SET'
      '  FECHA=?FECHA '
      '  ,FECHAEPR=?FECHAEPR '
      '  ,FECHAERE=?FECHAERE '
      '  ,FECHATOP=?FECHATOP '
      '  ,FCONTRAT=?FCONTRAT '
      '  ,IMP_DES1=?IMP_DES1 '
      '  ,IMP_DES2=?IMP_DES2 '
      '  ,IMP_DES3=?IMP_DES3 '
      '  ,IMP_DES4=?IMP_DES4 '
      '  ,IMP_DES5=?IMP_DES5 '
      '  ,BASEIMP1=?BASEIMP1 '
      '  ,IMPIMP1=?IMPIMP1 '
      '  ,BASEIMP2=?BASEIMP2 '
      '  ,IMPIMP2=?IMPIMP2 '
      '  ,BASEIMP3=?BASEIMP3 '
      '  ,IMPIMP3=?IMPIMP3 '
      '  ,FECHAV=?FECHAV '
      '  ,VTO1=?VTO1 '
      '  ,IMPVTO1=?IMPVTO1 '
      '  ,VTO2=?VTO2 '
      '  ,IMPVTO2=?IMPVTO2 '
      '  ,VTO3=?VTO3 '
      '  ,IMPVTO3=?IMPVTO3 '
      '  ,TBRUTO=?TBRUTO '
      '  ,TNETO=?TNETO '
      '  ,TCARGDES=?TCARGDES '
      '  ,BASEIMP=?BASEIMP '
      '  ,TOTIMPUES=?TOTIMPUES '
      '  ,TOTAL=?TOTAL '
      '  ,FRECOGIDA=?FRECOGIDA '
      '  ,FREFPAG=?FREFPAG '
      '  ,TOTCANT=?TOTCANT '
      '  ,PORCEN1=?PORCEN1 '
      '  ,PORCEN2=?PORCEN2 '
      '  ,PORCEN3=?PORCEN3 '
      '  ,PORCEN4=?PORCEN4 '
      '  ,PORCEN5=?PORCEN5 '
      '  ,TASAIMP1=?TASAIMP1 '
      '  ,TASAIMP2=?TASAIMP2 '
      '  ,TASAIMP3=?TASAIMP3 '
      '  ,CLAVE1=?CLAVE1 '
      '  ,SECUEN1=?SECUEN1 '
      '  ,SECUEN2=?SECUEN2 '
      '  ,SECUEN3=?SECUEN3 '
      '  ,SECUEN4=?SECUEN4 '
      '  ,SECUEN5=?SECUEN5 '
      '  ,NODO=?NODO '
      '  ,FUNCION=?FUNCION '
      '  ,NUMPED=?NUMPED '
      '  ,FORMAPAG=?FORMAPAG '
      '  ,CONDESP=?CONDESP '
      '  ,PEDABIER=?PEDABIER '
      '  ,LPRECIOS=?LPRECIOS '
      '  ,NCONTRAT=?NCONTRAT '
      '  ,CLIENTE=?CLIENTE '
      '  ,QPIDE=?QPIDE '
      '  ,AQSF=?AQSF '
      '  ,DEPTO=?DEPTO '
      '  ,RECEPTOR=?RECEPTOR '
      '  ,MUELLE=?MUELLE '
      '  ,VENDEDOR=?VENDEDOR '
      '  ,QPAGA=?QPAGA '
      '  ,PORTES=?PORTES '
      '  ,RECOGIDA=?RECOGIDA '
      '  ,REPOSI=?REPOSI '
      '  ,ENTREGA=?ENTREGA '
      '  ,MONEDA=?MONEDA '
      '  ,CALIF1=?CALIF1 '
      '  ,TIPO1=?TIPO1 '
      '  ,CALIF2=?CALIF2 '
      '  ,TIPO2=?TIPO2 '
      '  ,CALIF3=?CALIF3 '
      '  ,TIPO3=?TIPO3 '
      '  ,CALIF4=?CALIF4 '
      '  ,TIPO4=?TIPO4 '
      '  ,CALIF5=?CALIF5 '
      '  ,TIPO5=?TIPO5 '
      '  ,TIPOIMP1=?TIPOIMP1 '
      '  ,TIPOIMP2=?TIPOIMP2 '
      '  ,TIPOIMP3=?TIPOIMP3 '
      '  ,PATREF=?PATREF '
      '  ,PATDIAS=?PATDIAS '
      '  ,PATMES=?PATMES '
      '  ,TRANSPOR=?TRANSPOR '
      '  ,ALMRECOG=?ALMRECOG '
      '  ,TEMPORA=?TEMPORA '
      '  ,SUCURSAL=?SUCURSAL '
      '  ,DESTMSG=?DESTMSG '
      '  ,CONDPAGO=?CONDPAGO '
      '  ,TRANSPORT=?TRANSPORT '
      '  ,LUGADIENT=?LUGADIENT '
      '  ,DEPTOVENT=?DEPTOVENT '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    DataSource = DSQMCabecera
    AfterDelete = Graba
    AfterInsert = QMCabeceraAfterInsert
    AfterOpen = QMCabeceraAfterOpen
    AfterPost = QMCabeceraAfterPost
    BeforeEdit = AntesDeEditar
    BeforePost = QMCabeceraBeforePost
    OnNewRecord = QMCabeceraNewRecord
    OnPostError = QMCabeceraPostError
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG ')
    AccionesInhibidas = []
    Opciones = [DesactivarControlesAlOrdenar, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EDI_PED_CAB'
    UpdateTransaction = TUpdate
    Left = 248
    Top = 8
    object QMCabeceraEDIEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraEDIEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCabeceraEDICANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCabeceraEDISERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabeceraEDITIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCabeceraEDIRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCabeceraEDICLAVE1: TFIBStringField
      DisplayLabel = 'Clave'
      FieldName = 'CLAVE1'
      Size = 8
    end
    object QMCabeceraEDINODO: TFIBStringField
      DisplayLabel = 'Nodo'
      FieldName = 'NODO'
      Size = 3
    end
    object QMCabeceraEDIFUNCION: TFIBStringField
      DisplayLabel = 'Funcion'
      FieldName = 'FUNCION'
      Size = 3
    end
    object QMCabeceraEDINUMPED: TFIBStringField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'NUMPED'
      Size = 15
    end
    object QMCabeceraEDIFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCabeceraEDIFECHAEPR: TDateTimeField
      DisplayLabel = 'Fec. AERP'
      FieldName = 'FECHAEPR'
    end
    object QMCabeceraEDIFECHAERE: TDateTimeField
      DisplayLabel = 'Fec. AERE'
      FieldName = 'FECHAERE'
    end
    object QMCabeceraEDIFECHATOP: TDateTimeField
      DisplayLabel = 'Fec. Top'
      FieldName = 'FECHATOP'
    end
    object QMCabeceraEDIFORMAPAG: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMAPAG'
      Size = 3
    end
    object QMCabeceraEDICONDESP: TFIBStringField
      DisplayLabel = 'Cond. esp.'
      FieldName = 'CONDESP'
      Size = 3
    end
    object QMCabeceraEDIPEDABIER: TFIBStringField
      DisplayLabel = 'Ped. Abierto'
      FieldName = 'PEDABIER'
      Size = 17
    end
    object QMCabeceraEDILPRECIOS: TFIBStringField
      DisplayLabel = 'Precios'
      FieldName = 'LPRECIOS'
      Size = 17
    end
    object QMCabeceraEDINCONTRAT: TFIBStringField
      DisplayLabel = 'Contrato'
      FieldName = 'NCONTRAT'
      Size = 17
    end
    object QMCabeceraEDIFCONTRAT: TDateTimeField
      DisplayLabel = 'Fec. Contrato'
      FieldName = 'FCONTRAT'
    end
    object QMCabeceraEDICLIENTE: TFIBStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Size = 17
    end
    object QMCabeceraEDIQPIDE: TFIBStringField
      DisplayLabel = 'Q. Pide'
      FieldName = 'QPIDE'
      Size = 17
    end
    object QMCabeceraEDIAQSF: TFIBStringField
      DisplayLabel = 'A Quien se Factura'
      FieldName = 'AQSF'
      Size = 17
    end
    object QMCabeceraEDIDEPTO: TFIBStringField
      DisplayLabel = 'Dpto.'
      FieldName = 'DEPTO'
      Size = 17
    end
    object QMCabeceraEDIRECEPTOR: TFIBStringField
      DisplayLabel = 'Receptor'
      FieldName = 'RECEPTOR'
      Size = 17
    end
    object QMCabeceraEDIMUELLE: TFIBStringField
      DisplayLabel = 'Muelle'
      FieldName = 'MUELLE'
      Size = 17
    end
    object QMCabeceraEDIVENDEDOR: TFIBStringField
      DisplayLabel = 'Vendedor'
      FieldName = 'VENDEDOR'
      Size = 17
    end
    object QMCabeceraEDIQPAGA: TFIBStringField
      DisplayLabel = 'Q. Paga'
      FieldName = 'QPAGA'
      Size = 17
    end
    object QMCabeceraEDIPORTES: TFIBStringField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
      Size = 3
    end
    object QMCabeceraEDIRECOGIDA: TFIBStringField
      DisplayLabel = 'Recogida'
      FieldName = 'RECOGIDA'
      Size = 3
    end
    object QMCabeceraEDIREPOSI: TFIBStringField
      DisplayLabel = 'Prepos.'
      FieldName = 'REPOSI'
      Size = 35
    end
    object QMCabeceraEDIENTREGA: TFIBStringField
      DisplayLabel = 'Entrega'
      FieldName = 'ENTREGA'
      Size = 35
    end
    object QMCabeceraEDIMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMCabeceraEDICALIF1: TFIBStringField
      DisplayLabel = 'Calif. 1'
      FieldName = 'CALIF1'
      Size = 3
    end
    object QMCabeceraEDISECUEN1: TIntegerField
      DisplayLabel = 'Sec. 1'
      FieldName = 'SECUEN1'
    end
    object QMCabeceraEDITIPO1: TFIBStringField
      DisplayLabel = 'Tipo 1'
      FieldName = 'TIPO1'
      Size = 3
    end
    object QMCabeceraEDIPORCEN1: TFloatField
      DisplayLabel = 'Porc. 1'
      FieldName = 'PORCEN1'
    end
    object QMCabeceraEDIIMP_DES1: TFloatField
      DisplayLabel = 'Imp. Dtp. 1'
      FieldName = 'IMP_DES1'
    end
    object QMCabeceraEDICALIF2: TFIBStringField
      DisplayLabel = 'Calif. 2'
      FieldName = 'CALIF2'
      Size = 3
    end
    object QMCabeceraEDISECUEN2: TIntegerField
      DisplayLabel = 'Sec. 2'
      FieldName = 'SECUEN2'
    end
    object QMCabeceraEDITIPO2: TFIBStringField
      DisplayLabel = 'Tipo 2'
      FieldName = 'TIPO2'
      Size = 3
    end
    object QMCabeceraEDIPORCEN2: TFloatField
      DisplayLabel = 'Porc. 2'
      FieldName = 'PORCEN2'
    end
    object QMCabeceraEDIIMP_DES2: TFloatField
      DisplayLabel = 'Imp. Dtp. 2'
      FieldName = 'IMP_DES2'
    end
    object QMCabeceraEDICALIF3: TFIBStringField
      DisplayLabel = 'Calif. 3'
      FieldName = 'CALIF3'
      Size = 3
    end
    object QMCabeceraEDISECUEN3: TIntegerField
      DisplayLabel = 'Sec. 3'
      FieldName = 'SECUEN3'
    end
    object QMCabeceraEDITIPO3: TFIBStringField
      DisplayLabel = 'Tipo 3'
      FieldName = 'TIPO3'
      Size = 3
    end
    object QMCabeceraEDIPORCEN3: TFloatField
      DisplayLabel = 'Porc. 3'
      FieldName = 'PORCEN3'
    end
    object QMCabeceraEDIIMP_DES3: TFloatField
      DisplayLabel = 'Imp. Dtp. 3'
      FieldName = 'IMP_DES3'
    end
    object QMCabeceraEDICALIF4: TFIBStringField
      DisplayLabel = 'Calif. 4'
      FieldName = 'CALIF4'
      Size = 3
    end
    object QMCabeceraEDISECUEN4: TIntegerField
      DisplayLabel = 'Sec. 4'
      FieldName = 'SECUEN4'
    end
    object QMCabeceraEDITIPO4: TFIBStringField
      DisplayLabel = 'Tipo 4'
      FieldName = 'TIPO4'
      Size = 3
    end
    object QMCabeceraEDIPORCEN4: TFloatField
      DisplayLabel = 'Porc. 4'
      FieldName = 'PORCEN4'
    end
    object QMCabeceraEDIIMP_DES4: TFloatField
      DisplayLabel = 'Imp. Dtp. 4'
      FieldName = 'IMP_DES4'
    end
    object QMCabeceraEDICALIF5: TFIBStringField
      DisplayLabel = 'Calif. 5'
      FieldName = 'CALIF5'
      Size = 3
    end
    object QMCabeceraEDISECUEN5: TIntegerField
      DisplayLabel = 'Sec. 5'
      FieldName = 'SECUEN5'
    end
    object QMCabeceraEDITIPO5: TFIBStringField
      DisplayLabel = 'Tipo 5'
      FieldName = 'TIPO5'
      Size = 3
    end
    object QMCabeceraEDIPORCEN5: TFloatField
      DisplayLabel = 'Porc. 5'
      FieldName = 'PORCEN5'
    end
    object QMCabeceraEDIIMP_DES5: TFloatField
      DisplayLabel = 'Imp. Dtp. 5'
      FieldName = 'IMP_DES5'
    end
    object QMCabeceraEDITIPOIMP1: TFIBStringField
      DisplayLabel = 'Tipo Imp. 1'
      FieldName = 'TIPOIMP1'
      Size = 3
    end
    object QMCabeceraEDITASAIMP1: TFloatField
      DisplayLabel = 'Tasa 1'
      FieldName = 'TASAIMP1'
    end
    object QMCabeceraEDIBASEIMP1: TFloatField
      DisplayLabel = 'B. Imponible 1'
      FieldName = 'BASEIMP1'
    end
    object QMCabeceraEDIIMPIMP1: TFloatField
      DisplayLabel = 'Imp. Imp. 1'
      FieldName = 'IMPIMP1'
    end
    object QMCabeceraEDITIPOIMP2: TFIBStringField
      DisplayLabel = 'Tipo Imp. 2'
      FieldName = 'TIPOIMP2'
      Size = 3
    end
    object QMCabeceraEDITASAIMP2: TFloatField
      DisplayLabel = 'Tasa 2'
      FieldName = 'TASAIMP2'
    end
    object QMCabeceraEDIBASEIMP2: TFloatField
      DisplayLabel = 'B. Imponible 2'
      FieldName = 'BASEIMP2'
    end
    object QMCabeceraEDIIMPIMP2: TFloatField
      DisplayLabel = 'Imp. Imp. 2'
      FieldName = 'IMPIMP2'
    end
    object QMCabeceraEDITIPOIMP3: TFIBStringField
      DisplayLabel = 'Tipo Imp. 3'
      FieldName = 'TIPOIMP3'
      Size = 3
    end
    object QMCabeceraEDITASAIMP3: TFloatField
      DisplayLabel = 'Tasa 3'
      FieldName = 'TASAIMP3'
    end
    object QMCabeceraEDIBASEIMP3: TFloatField
      DisplayLabel = 'B. Imponible 3'
      FieldName = 'BASEIMP3'
    end
    object QMCabeceraEDIIMPIMP3: TFloatField
      DisplayLabel = 'Imp. Imp. 3'
      FieldName = 'IMPIMP3'
    end
    object QMCabeceraEDIPATREF: TFIBStringField
      DisplayLabel = 'Pat. Ref.'
      FieldName = 'PATREF'
      Size = 3
    end
    object QMCabeceraEDIPATDIAS: TFIBStringField
      DisplayLabel = 'Partidas'
      FieldName = 'PATDIAS'
      Size = 3
    end
    object QMCabeceraEDIPATMES: TFIBStringField
      DisplayLabel = 'Pat. Mes'
      FieldName = 'PATMES'
      Size = 3
    end
    object QMCabeceraEDIFECHAV: TDateTimeField
      DisplayLabel = 'Fec. V.'
      FieldName = 'FECHAV'
    end
    object QMCabeceraEDIVTO1: TDateTimeField
      DisplayLabel = 'Vto. 1'
      FieldName = 'VTO1'
    end
    object QMCabeceraEDIIMPVTO1: TFloatField
      DisplayLabel = 'Imp. Vto. 1'
      FieldName = 'IMPVTO1'
    end
    object QMCabeceraEDIVTO2: TDateTimeField
      DisplayLabel = 'Vto. 2'
      FieldName = 'VTO2'
    end
    object QMCabeceraEDIIMPVTO2: TFloatField
      DisplayLabel = 'Imp. Vto. 2'
      FieldName = 'IMPVTO2'
    end
    object QMCabeceraEDIVTO3: TDateTimeField
      DisplayLabel = 'Vto. 3'
      FieldName = 'VTO3'
    end
    object QMCabeceraEDIIMPVTO3: TFloatField
      DisplayLabel = 'Imp. Vto. 3'
      FieldName = 'IMPVTO3'
    end
    object QMCabeceraEDITBRUTO: TFloatField
      DisplayLabel = 'T. Bruto'
      FieldName = 'TBRUTO'
    end
    object QMCabeceraEDITNETO: TFloatField
      DisplayLabel = 'T. Neto'
      FieldName = 'TNETO'
    end
    object QMCabeceraEDITCARGDES: TFloatField
      DisplayLabel = 'T. Carg. Des.'
      FieldName = 'TCARGDES'
    end
    object QMCabeceraEDIBASEIMP: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'BASEIMP'
    end
    object QMCabeceraEDITOTIMPUES: TFloatField
      DisplayLabel = 'Total Impuestos'
      FieldName = 'TOTIMPUES'
    end
    object QMCabeceraEDITOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object QMCabeceraEDIFRECOGIDA: TDateTimeField
      DisplayLabel = 'Fec. Recogida'
      FieldName = 'FRECOGIDA'
    end
    object QMCabeceraEDITRANSPOR: TFIBStringField
      DisplayLabel = 'Transp.'
      FieldName = 'TRANSPOR'
      Size = 17
    end
    object QMCabeceraEDIALMRECOG: TFIBStringField
      DisplayLabel = 'Alm. Rec.'
      FieldName = 'ALMRECOG'
      Size = 17
    end
    object QMCabeceraEDIFREFPAG: TDateTimeField
      DisplayLabel = 'Fre. Pag.'
      FieldName = 'FREFPAG'
    end
    object QMCabeceraEDITOTCANT: TFloatField
      DisplayLabel = 'Total Can.'
      FieldName = 'TOTCANT'
    end
    object QMCabeceraEDITEMPORA: TFIBStringField
      DisplayLabel = 'Temporada'
      FieldName = 'TEMPORA'
      Size = 35
    end
    object QMCabeceraEDIDEPTOVENT: TFIBStringField
      DisplayLabel = 'Dep. Venta'
      FieldName = 'DEPTOVENT'
      Size = 17
    end
    object QMCabeceraEDISUCURSAL: TFIBStringField
      DisplayLabel = 'Sucursal'
      FieldName = 'SUCURSAL'
      Size = 17
    end
    object QMCabeceraEDIDESTMSG: TFIBStringField
      DisplayLabel = 'Dest. Mensaje'
      FieldName = 'DESTMSG'
      Size = 17
    end
    object QMCabeceraEDICONDPAGO: TFIBStringField
      DisplayLabel = 'Cond. Pago'
      FieldName = 'CONDPAGO'
      Size = 5
    end
    object QMCabeceraEDITRANSPORT: TFIBStringField
      DisplayLabel = 'Transp.'
      FieldName = 'TRANSPORT'
      Size = 5
    end
    object QMCabeceraEDILUGADIENT: TFIBStringField
      DisplayLabel = 'Lugadient'
      FieldName = 'LUGADIENT'
      Size = 17
    end
  end
  object DSQMCabeceraEDI: TDataSource
    DataSet = QMCabeceraEDI
    Left = 352
    Top = 8
  end
  object xIdiomas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from sys_idiomas'
      'where idioma=?idioma')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 32
    Top = 440
    object xIdiomasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxIdiomas: TDataSource
    DataSet = xIdiomas
    Left = 128
    Top = 440
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
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_S_FAC_NIF'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_FAC_NIF'
      'WHERE '
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
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_S_FAC_NIF'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 248
    Top = 200
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
    Left = 352
    Top = 200
  end
  object xProyectos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from emp_proyectos where '
      '  empresa=?empresa and proyecto=?proyecto')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 248
    Top = 296
  end
  object DSxProyectos: TDataSource
    DataSet = xProyectos
    Left = 352
    Top = 296
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 752
    Top = 104
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
    Left = 32
    Top = 488
    object xRangosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxRangos: TDataSource
    DataSet = xRangos
    Left = 128
    Top = 488
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
    Left = 32
    Top = 536
    object xIndicesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxIndices: TDataSource
    DataSet = xIndices
    Left = 128
    Top = 536
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
    Left = 248
    Top = 248
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
    Left = 352
    Top = 248
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
      '        TIPO_DOCUMENTO = '#39'PEC'#39' AND'
      '        ACTIVO = 1),'
      '        (SELECT NOTAS'
      '         FROM EMP_CLIENTES'
      '         WHERE'
      '         ID_CLIENTE = :ID_CLIENTE)'
      'FROM RDB$DATABASE'
      '')
    SelectSQL.Strings = (
      'SELECT (SELECT MENSAJE'
      '        FROM EMP_AVISOS'
      '        WHERE'
      '        TIPO_OBJETO = '#39'CLI'#39' AND'
      '        ID_OBJETO = :ID_CLIENTE AND'
      '        TIPO_DOCUMENTO = '#39'PEC'#39' AND'
      '        ACTIVO = 1),'
      '        (SELECT NOTAS'
      '         FROM EMP_CLIENTES'
      '         WHERE'
      '         ID_CLIENTE = :ID_CLIENTE)'
      'FROM RDB$DATABASE')
    UniDirectional = False
    DataSource = DSxCliente
    Left = 248
    Top = 392
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
    Left = 32
    Top = 392
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
    Left = 128
    Top = 392
  end
  object DSxAvisos: TDataSource
    DataSet = xAvisos
    Left = 352
    Top = 392
  end
  object xPedidoAnterior: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT DISTINCT D.ARTICULO, A.TITULO'
      'FROM GES_DETALLES_S D'
      'JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A'
      'WHERE'
      'D.ID_S = :ID_S_ANTERIOR AND'
      'D.ARTICULO NOT IN (SELECT ARTICULO'
      '                   FROM GES_DETALLES_S'
      '                   WHERE'
      '                   ID_S = :ID_S_ACTUAL)'
      'ORDER BY D.ARTICULO')
    UniDirectional = False
    Left = 488
    Top = 160
  end
end
