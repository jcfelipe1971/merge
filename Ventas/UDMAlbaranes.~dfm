object DMAlbaranes: TDMAlbaranes
  OldCreateOrder = False
  OnCreate = DMDocsAlbaranCreate
  OnDestroy = DMAlbaranesDestroy
  Left = 255
  Top = 219
  Height = 631
  Width = 843
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_DETALLE_ALBARAN'
      'WHERE'
      '  ID_DETALLES_S=?old_ID_DETALLES_S ')
    InsertSQL.Strings = (
      'INSERT INTO VER_DETALLE_ALBARAN'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,LINEA,ALMACEN,ARTICU' +
        'LO,TITULO,UNIDADES,'#13#10'PRECIO,PIEZAS_X_BULTO,BULTOS,DESCUENTO,DESC' +
        'UENTO_2,DESCUENTO_3,COMISION,P_COSTE,M_MOV_STOCK,TIPO_IVA,'#13#10'P_IV' +
        'A,P_RECARGO,BRUTO,B_COMISION,I_DESCUENTO,B_IMPONIBLE,I_COMISION,' +
        'ENTRADA,NOTAS,NOTAS2,UNIDADES_EXT,NSERIE,UNIDADES_SEC,'#13#10'ID_DETAL' +
        'LES_S,ID_S,ID_A,ID_C_A,NO_FABRICACION_KRI,UNIDADES_FACTURADAS,LI' +
        'NEA_SERVIDA,CAJA_EDI,TIPO_CAJA_EDI,COMISION_LINEAL,'#13#10'I_COMISION_' +
        'LINEAL,FECHA_PRE_DET,FECHA_REC_DET,TITULO_IDIOMA,TIPO_LINEA_KRI,' +
        'ORDEN,TIPO_LINEA,PROC_PROMOCION,ORIGEN,ID_P,'#13#10'APLICA_UNIDADES_SE' +
        'CUNDARIAS,PROYECTO,LINEA_RELACION,CRC_NOTAS,CRC_NOTAS2,PRO_NUM_P' +
        'LANO,TIPO_UNIDAD_LOGISTICA,TITULO_UNIDAD_LOGISTICA,U_POR_U_LOGIS' +
        'TICA,RELACIONAR_U_LOGISTICA,'#13#10'UNIDADES_LOGISTICAS,ID_UBICACION,C' +
        'OMPOSICION,ID_A_UBICACION,UNIDADES_UB,ALMACEN_UB,CALLE,ESTANTERI' +
        'A,REPISA,POSICION,'#13#10'LOTE_SIMPLE,DIRECCION_ENTREGA,PAIS,COSTE_ADI' +
        'CIONAL,ID_IMAGEN,MANIPULACION,ALFA_1,ALFA_2,'#13#10'ALFA_3,ALFA_4,ALFA' +
        '_5,ALFA_6,ALFA_7,ALFA_8,INVERSION_SUJETO_PASIVO,DECIMALES_UNIDAD' +
        'ES,SIGNO_UNIDADES,TIPO_IMPUESTO_ADICIONAL,'#13#10'P_IMPUESTO_ADICIONAL' +
        ',LOTEABLE,PESO,PESO_TOTAL,PESO_REAL,ECOTASA,REQUIERE_LOTE_SIMPLE' +
        ','#13#10'CONTROL_STOCK,UE_UNIDADES,UE_MEDIDA1,UE_MEDIDA2,UE_MEDIDA3,UE' +
        '_MEDIDA4)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?LINEA,?ALMACE' +
        'N,?ARTICULO,?TITULO,?UNIDADES,'#13#10'?PRECIO,?PIEZAS_X_BULTO,?BULTOS,' +
        '?DESCUENTO,?DESCUENTO_2,?DESCUENTO_3,?COMISION,?P_COSTE,?M_MOV_S' +
        'TOCK,?TIPO_IVA,'#13#10'?P_IVA,?P_RECARGO,?BRUTO,?B_COMISION,?I_DESCUEN' +
        'TO,?B_IMPONIBLE,?I_COMISION,?ENTRADA,?NOTAS,?NOTAS2,?UNIDADES_EX' +
        'T,?NSERIE,?UNIDADES_SEC,'#13#10'?ID_DETALLES_S,?ID_S,?ID_A,?ID_C_A,?NO' +
        '_FABRICACION_KRI,?UNIDADES_FACTURADAS,?LINEA_SERVIDA,?CAJA_EDI,?' +
        'TIPO_CAJA_EDI,?COMISION_LINEAL,'#13#10'?I_COMISION_LINEAL,?FECHA_PRE_D' +
        'ET,?FECHA_REC_DET,?TITULO_IDIOMA,?TIPO_LINEA_KRI,?ORDEN,?TIPO_LI' +
        'NEA,?PROC_PROMOCION,?ORIGEN,?ID_P,'#13#10'?APLICA_UNIDADES_SECUNDARIAS' +
        ',?PROYECTO,?LINEA_RELACION,?CRC_NOTAS,?CRC_NOTAS2,?PRO_NUM_PLANO' +
        ',?TIPO_UNIDAD_LOGISTICA,?TITULO_UNIDAD_LOGISTICA,?U_POR_U_LOGIST' +
        'ICA,?RELACIONAR_U_LOGISTICA,'#13#10'?UNIDADES_LOGISTICAS,?ID_UBICACION' +
        ',?COMPOSICION,?ID_A_UBICACION,?UNIDADES_UB,?ALMACEN_UB,?CALLE,?E' +
        'STANTERIA,?REPISA,?POSICION,'#13#10'?LOTE_SIMPLE,?DIRECCION_ENTREGA,?P' +
        'AIS,?COSTE_ADICIONAL,?ID_IMAGEN,?MANIPULACION,?ALFA_1,?ALFA_2,'#13#10 +
        '?ALFA_3,?ALFA_4,?ALFA_5,?ALFA_6,?ALFA_7,?ALFA_8,?INVERSION_SUJET' +
        'O_PASIVO,?DECIMALES_UNIDADES,?SIGNO_UNIDADES,?TIPO_IMPUESTO_ADIC' +
        'IONAL,'#13#10'?P_IMPUESTO_ADICIONAL,?LOTEABLE,?PESO,?PESO_TOTAL,?PESO_' +
        'REAL,?ECOTASA,?REQUIERE_LOTE_SIMPLE,'#13#10'?CONTROL_STOCK,?UE_UNIDADE' +
        'S,?UE_MEDIDA1,?UE_MEDIDA2,?UE_MEDIDA3,?UE_MEDIDA4)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DETALLE_ALBARAN'
      'WHERE'
      '  ID_DETALLES_S=?ID_DETALLES_S ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_ALBARAN'
      'WHERE'
      'ID_S = ?ID_S '
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLE_ALBARAN'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,TIPO=?TIPO '
      '  ,RIG=?RIG '
      '  ,LINEA=?LINEA '
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
      '  ,ID_S=?ID_S '
      '  ,ID_A=?ID_A '
      '  ,ID_C_A=?ID_C_A '
      '  ,NO_FABRICACION_KRI=?NO_FABRICACION_KRI '
      '  ,UNIDADES_FACTURADAS=?UNIDADES_FACTURADAS '
      '  ,LINEA_SERVIDA=?LINEA_SERVIDA '
      '  ,CAJA_EDI=?CAJA_EDI '
      '  ,TIPO_CAJA_EDI=?TIPO_CAJA_EDI '
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
      '  ,APLICA_UNIDADES_SECUNDARIAS=?APLICA_UNIDADES_SECUNDARIAS '
      '  ,PROYECTO=?PROYECTO '
      '  ,LINEA_RELACION=?LINEA_RELACION '
      '  ,CRC_NOTAS=?CRC_NOTAS '
      '  ,CRC_NOTAS2=?CRC_NOTAS2 '
      '  ,PRO_NUM_PLANO=?PRO_NUM_PLANO '
      '  ,TIPO_UNIDAD_LOGISTICA=?TIPO_UNIDAD_LOGISTICA '
      '  ,TITULO_UNIDAD_LOGISTICA=?TITULO_UNIDAD_LOGISTICA '
      '  ,U_POR_U_LOGISTICA=?U_POR_U_LOGISTICA '
      '  ,RELACIONAR_U_LOGISTICA=?RELACIONAR_U_LOGISTICA '
      '  ,UNIDADES_LOGISTICAS=?UNIDADES_LOGISTICAS '
      '  ,ID_UBICACION=?ID_UBICACION '
      '  ,COMPOSICION=?COMPOSICION '
      '  ,ID_A_UBICACION=?ID_A_UBICACION '
      '  ,UNIDADES_UB=?UNIDADES_UB '
      '  ,ALMACEN_UB=?ALMACEN_UB '
      '  ,CALLE=?CALLE '
      '  ,ESTANTERIA=?ESTANTERIA '
      '  ,REPISA=?REPISA '
      '  ,POSICION=?POSICION '
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
      
        'PLAN SORT (JOIN (VER_DETALLE_ALBARAN DET INDEX (GES_DETALLES_S_C' +
        'AB_ID),VER_DETALLE_ALBARAN ALB INDEX (GES_DETALLES_S_ALB_ID)))')
    AfterDelete = QMDetalleAfterDelete
    AfterOpen = QMDetalleAfterOpen
    AfterPost = GrabaDetalle
    AfterScroll = QMDetalleAfterScroll
    BeforeClose = QMDetalleBeforeClose
    BeforeDelete = QMDetalleBeforeDelete
    BeforeEdit = AntesDeEditar
    BeforeInsert = QMDetalleBeforeInsert
    BeforePost = QMDetalleBeforePost
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
    TableName = 'VER_DETALLE_ALBARAN'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_DETALLES_S'
      'GES_DETALLES_S_ALB')
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
      DisplayLabel = '% Rec.'
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
      DisplayLabel = 'B. Dto. L'#237'nea'
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
    object QMDetalleUNIDADES_EXT: TFloatField
      DisplayLabel = 'Uds. Ext.'
      FieldName = 'UNIDADES_EXT'
      OnGetText = QMDetalleUNIDADES_EXTGetText
    end
    object QMDetalleNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
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
    object QMDetalleNO_FABRICACION_KRI: TFIBStringField
      DisplayLabel = 'No Fabricacion'
      FieldName = 'NO_FABRICACION_KRI'
      Size = 15
    end
    object QMDetalleID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_DETALLES_S'
    end
    object QMDetalleID_S: TIntegerField
      DisplayLabel = 'ID Cab'
      FieldName = 'ID_S'
    end
    object QMDetalleUNIDADES_FACTURADAS: TFloatField
      DisplayLabel = 'Uds. Facturadas'
      FieldName = 'UNIDADES_FACTURADAS'
      OnGetText = QMDetalleUNIDADES_FACTURADASGetText
    end
    object QMDetalleLINEA_SERVIDA: TIntegerField
      DisplayLabel = 'L'#237'nea Serv.'
      FieldName = 'LINEA_SERVIDA'
    end
    object QMDetalleCAJA_EDI: TIntegerField
      DisplayLabel = 'Caja EDI'
      FieldName = 'CAJA_EDI'
    end
    object QMDetalleTIPO_CAJA_EDI: TFIBStringField
      DisplayLabel = 'Tipo Caja EDI'
      FieldName = 'TIPO_CAJA_EDI'
      Size = 5
    end
    object QMDetalleID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetalleID_C_A: TIntegerField
      DisplayLabel = 'ID Art. Can.'
      FieldName = 'ID_C_A'
    end
    object QMDetalleCOMISION_LINEAL: TFloatField
      DisplayLabel = 'Com. Lineal'
      FieldName = 'COMISION_LINEAL'
    end
    object QMDetalleI_COMISION_LINEAL: TFloatField
      DisplayLabel = 'Imp. Com. Lineal'
      FieldName = 'I_COMISION_LINEAL'
    end
    object QMDetalleFECHA_PRE_DET: TDateTimeField
      DisplayLabel = 'Fecha Prevista'
      FieldName = 'FECHA_PRE_DET'
    end
    object QMDetalleFECHA_REC_DET: TDateTimeField
      DisplayLabel = 'Fecha Recepci'#243'n'
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
    object QMDetalleTIPO_LINEA: TFIBStringField
      DisplayLabel = 'Tipo L'#237'nea'
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
      DisplayLabel = 'ID P.'
      FieldName = 'ID_P'
    end
    object QMDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField
      DisplayLabel = 'Aplica Uds Sec.'
      FieldName = 'APLICA_UNIDADES_SECUNDARIAS'
    end
    object QMDetallePROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMDetalleLINEA_RELACION: TIntegerField
      DisplayLabel = 'L'#237'nea Rel.'
      FieldName = 'LINEA_RELACION'
    end
    object QMDetalleTIPO_LINEA_KRI: TIntegerField
      DisplayLabel = 'Tipo L'#237'nea'
      FieldName = 'TIPO_LINEA_KRI'
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
    object QMDetalleNOTAS2: TBlobField
      DisplayLabel = 'Notas 2'
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
      DisplayLabel = 'T'#237'tulo UL'
      FieldName = 'TITULO_UNIDAD_LOGISTICA'
      OnChange = QMDetalleTITULO_UNIDAD_LOGISTICAChange
      Size = 35
    end
    object QMDetalleUNIDADES_LOGISTICAS: TFloatField
      DisplayLabel = 'Unidades Log.'
      FieldName = 'UNIDADES_LOGISTICAS'
      OnChange = QMDetalleUNIDADES_LOGISTICASChange
    end
    object QMDetalleID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic.'
      FieldName = 'ID_UBICACION'
    end
    object QMDetalleCOMPOSICION: TFIBStringField
      DisplayLabel = 'Composicion'
      FieldName = 'COMPOSICION'
    end
    object QMDetalleID_A_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic. Art.'
      FieldName = 'ID_A_UBICACION'
    end
    object QMDetalleUNIDADES_UB: TFloatField
      DisplayLabel = 'Uds. Ubic.'
      FieldName = 'UNIDADES_UB'
    end
    object QMDetalleALMACEN_UB: TFIBStringField
      DisplayLabel = 'Alm. Ubic.'
      FieldName = 'ALMACEN_UB'
      Size = 3
    end
    object QMDetalleCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMDetalleESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanteria'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMDetalleREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMDetallePOSICION: TFIBStringField
      DisplayLabel = 'Posicion'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMDetalleID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMDetalleLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
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
    object QMDetalleLOTEABLE: TIntegerField
      DisplayLabel = 'Loteable'
      FieldName = 'LOTEABLE'
      ReadOnly = True
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
    object QMDetalleINVERSION_SUJETO_PASIVO: TIntegerField
      DisplayLabel = 'ISP'
      FieldName = 'INVERSION_SUJETO_PASIVO'
    end
    object QMDetalleID_IMAGEN: TIntegerField
      DisplayLabel = 'Id Imagen'
      FieldName = 'ID_IMAGEN'
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
    object QMDetalleCANT_LOTE: TFloatField
      DisplayLabel = 'Cant. Lote'
      FieldName = 'CANT_LOTE'
      OnGetText = QMDetalleCANT_LOTEGetText
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
    object QMDetalleSTOCK_REAL: TFloatField
      DisplayLabel = 'Stock Real'
      FieldKind = fkCalculated
      FieldName = 'STOCK_REAL'
      Calculated = True
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
    UsaNulls = True
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CABECERAS_ALBARAN '
      'WHERE'
      '  ID_S=?old_ID_S ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CABECERAS_ALBARAN '
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,ALMACEN,MONEDA,FECHA' +
        ',TERCERO,TITULO,'#13#10'DIRECCION,DIR_COMPLETA,DIR_NOMBRE_2,CODIGO_POS' +
        'TAL,LOCALIDAD,CLIENTE,CONTACTO,SU_REFERENCIA,FORMA_PAGO,BANCO,'#13#10 +
        'CAMPANYA,NOTAS,ESTADO,BULTOS,LINEAS,BRUTO,I_DTO_LINEAS,S_BASES,M' +
        '_BRUTO,C_TOTAL,'#13#10'AGENTE,S_CUOTA_IVA,S_CUOTA_RE,B_DTO_LINEAS,DTO_' +
        'PP,DTO_CIAL,I_DTO_CIAL,I_DTO_PP,B_COMISION,I_COMISION,'#13#10'POR_FINA' +
        'NCIACION,I_FINANCIACION,LIQUIDO,ENTRADA,TRANSPORTISTA,I_BASE_RET' +
        'ENCION,P_RETENCION,I_RETENCION,TIPO_IRPF,A_IRPF,'#13#10'TOTAL_A_COBRAR' +
        ',NOMBRE_COMERCIAL,PORTES,TARIFA,ID_S,BULTOS_KRI,GARANTIA,AGRUPAC' +
        'ION_KRI,ALMACEN_DEPOSITO,NUM_MOV_DEPOSITO,'#13#10'DEPOSITO,DEVOLUCION_' +
        'DEPOSITO,IDIOMA,TIPO_PORTES,POR_PORTES,I_PORTES,I_PORTES_CANAL,R' +
        'ANGO,INDICE,CAMBIO_FIJO,'#13#10'VALOR_CAMB_FIJO,PROYECTO,NOTAS_INTERNA' +
        'S_KRI,TIPO_LINEA_KRI,MODIFICA_DOC,ALBARAN_VALORADO,FECHA_SERVIDO' +
        ',PEDIDO_CLIENTE,'#13#10'EMPLEADO_RESPONSABLE,EMPLEADO_ATENCION,DOCUMENT' +
        'O_MUESTRAS,FACTURABLE,INVERSION_SUJETO_PASIVO,ENTRADA_FACTURACIO' +
        'N,COMPRADOR_EDI,FECHA_ENTREGA_REPARTO,'#13#10'Z_OBSERVACION,EMPAQUETAD' +
        'O_EMPRESA,DIR_RECOGIDA_MANUAL,DIR_ENTREGA_MANUAL,EQUIPO_RECOGIDA' +
        ',EQUIPO_ENTREGA,MATRICULA_RECOGIDA,MATRICULA_ENTREGA,FECHA_RECOG' +
        'IDA_MANUAL,'#13#10'FECHA_ENTREGA_MANUAL,USUARIO_CREACION,ID_TIPO_GIRO_' +
        'CLIENTE,CODIGO_GIRO_CLIENTE,ID_TIPO_GIRO_EMPRESA,CODIGO_GIRO_EMP' +
        'RESA,INDTRASLADO,TPOIMPRESION,CARTA_PORTE_TRANSPORTISTA,COD_MOTI' +
        'VO_ABONO,'#13#10'MODO_IVA,ID_FICHA_TECNICA,DIA_PAGO_1,DIA_PAGO_2,DIA_P' +
        'AGO_3,TITULO_GIRO_CLIENTE,ORIGEN_DOCUMENTO,FOLIO,TIPO_DOC_TRIBUT' +
        'ARIO,'#13#10'SII_FMA_PAGO,TIPO_VENTA,ID_TIPO_DESPACHO,OC_NROLINREF,OC_' +
        'TPODOCREF,OC_FOLIOREF,OC_RUTOTR,OC_FCHREF,OC_CODREF,OC_RAZONREF)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ALMACEN,?MONE' +
        'DA,?FECHA,?TERCERO,?TITULO,'#13#10'?DIRECCION,?DIR_COMPLETA,?DIR_NOMBR' +
        'E_2,?CODIGO_POSTAL,?LOCALIDAD,?CLIENTE,?CONTACTO,?SU_REFERENCIA,' +
        '?FORMA_PAGO,?BANCO,'#13#10'?CAMPANYA,?NOTAS,?ESTADO,?BULTOS,?LINEAS,?B' +
        'RUTO,?I_DTO_LINEAS,?S_BASES,?M_BRUTO,?C_TOTAL,'#13#10'?AGENTE,?S_CUOTA' +
        '_IVA,?S_CUOTA_RE,?B_DTO_LINEAS,?DTO_PP,?DTO_CIAL,?I_DTO_CIAL,?I_' +
        'DTO_PP,?B_COMISION,?I_COMISION,'#13#10'?POR_FINANCIACION,?I_FINANCIACI' +
        'ON,?LIQUIDO,?ENTRADA,?TRANSPORTISTA,?I_BASE_RETENCION,?P_RETENCI' +
        'ON,?I_RETENCION,?TIPO_IRPF,?A_IRPF,'#13#10'?TOTAL_A_COBRAR,?NOMBRE_COM' +
        'ERCIAL,?PORTES,?TARIFA,?ID_S,?BULTOS_KRI,?GARANTIA,?AGRUPACION_K' +
        'RI,?ALMACEN_DEPOSITO,?NUM_MOV_DEPOSITO,'#13#10'?DEPOSITO,?DEVOLUCION_D' +
        'EPOSITO,?IDIOMA,?TIPO_PORTES,?POR_PORTES,?I_PORTES,?I_PORTES_CAN' +
        'AL,?RANGO,?INDICE,?CAMBIO_FIJO,'#13#10'?VALOR_CAMB_FIJO,?PROYECTO,?NOT' +
        'AS_INTERNAS_KRI,?TIPO_LINEA_KRI,?MODIFICA_DOC,?ALBARAN_VALORADO,' +
        '?FECHA_SERVIDO,?PEDIDO_CLIENTE,'#13#10'?EMPLEADO_RESPONSABLE,?EMPLEADO_' +
        'ATENCION,?DOCUMENTO_MUESTRAS,?FACTURABLE,?INVERSION_SUJETO_PASIV' +
        'O,?ENTRADA_FACTURACION,?COMPRADOR_EDI,?FECHA_ENTREGA_REPARTO,'#13#10'?' +
        'Z_OBSERVACION,?EMPAQUETADO_EMPRESA,?DIR_RECOGIDA_MANUAL,?DIR_ENT' +
        'REGA_MANUAL,?EQUIPO_RECOGIDA,?EQUIPO_ENTREGA,?MATRICULA_RECOGIDA' +
        ',?MATRICULA_ENTREGA,?FECHA_RECOGIDA_MANUAL,'#13#10'?FECHA_ENTREGA_MANU' +
        'AL,?USUARIO_CREACION,?ID_TIPO_GIRO_CLIENTE,?CODIGO_GIRO_CLIENTE,' +
        '?ID_TIPO_GIRO_EMPRESA,?CODIGO_GIRO_EMPRESA,?INDTRASLADO,?TPOIMPR' +
        'ESION,?CARTA_PORTE_TRANSPORTISTA,?COD_MOTIVO_ABONO,'#13#10'?MODO_IVA,?' +
        'ID_FICHA_TECNICA,?DIA_PAGO_1,?DIA_PAGO_2,?DIA_PAGO_3,?TITULO_GIR' +
        'O_CLIENTE,?ORIGEN_DOCUMENTO,?FOLIO,?TIPO_DOC_TRIBUTARIO,'#13#10'?SII_F' +
        'MA_PAGO,?TIPO_VENTA,?ID_TIPO_DESPACHO,?OC_NROLINREF,?OC_TPODOCRE' +
        'F,?OC_FOLIOREF,?OC_RUTOTR,?OC_FCHREF,?OC_CODREF,?OC_RAZONREF)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_ALBARAN '
      'WHERE'
      '  ID_S=?ID_S ')
    SelectSQL.Strings = (
      '/* Se establece en el OnCreate */'
      'SELECT * FROM VER_CABECERAS_ALBARAN'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'CANAL=?CANAL AND'
      'SERIE=?SERIE AND'
      'TIPO='#39'ALB'#39
      
        'AND (EJERCICIO=?EJERCICIO OR ((EJERCICIO < ?EJERCICIO) AND ((EST' +
        'ADO = 0) OR (ESTADO = 3))))'
      'ORDER BY EJERCICIO, RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CABECERAS_ALBARAN '
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
      '  ,DIR_COMPLETA=?DIR_COMPLETA '
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
      '  ,LIQUIDO=?LIQUIDO '
      '  ,ENTRADA=?ENTRADA '
      '  ,TRANSPORTISTA=?TRANSPORTISTA '
      '  ,I_BASE_RETENCION=?I_BASE_RETENCION '
      '  ,P_RETENCION=?P_RETENCION '
      '  ,I_RETENCION=?I_RETENCION '
      '  ,TIPO_IRPF=?TIPO_IRPF '
      '  ,A_IRPF=?A_IRPF '
      '  ,TOTAL_A_COBRAR=?TOTAL_A_COBRAR '
      '  ,NOMBRE_COMERCIAL=?NOMBRE_COMERCIAL '
      '  ,PORTES=?PORTES '
      '  ,TARIFA=?TARIFA '
      '  ,BULTOS_KRI=?BULTOS_KRI '
      '  ,GARANTIA=?GARANTIA '
      '  ,AGRUPACION_KRI=?AGRUPACION_KRI '
      '  ,ALMACEN_DEPOSITO=?ALMACEN_DEPOSITO '
      '  ,NUM_MOV_DEPOSITO=?NUM_MOV_DEPOSITO '
      '  ,DEPOSITO=?DEPOSITO '
      '  ,DEVOLUCION_DEPOSITO=?DEVOLUCION_DEPOSITO '
      '  ,IDIOMA=?IDIOMA '
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
      '  ,MODIFICA_DOC=?MODIFICA_DOC '
      '  ,ALBARAN_VALORADO=?ALBARAN_VALORADO '
      '  ,FECHA_SERVIDO=?FECHA_SERVIDO '
      '  ,PEDIDO_CLIENTE=?PEDIDO_CLIENTE '
      '  ,EMPLEADO_RESPONSABLE=?EMPLEADO_RESPONSABLE '
      '  ,EMPLEADO_ATENCION=?EMPLEADO_ATENCION '
      '  ,DOCUMENTO_MUESTRAS=?DOCUMENTO_MUESTRAS '
      '  ,FACTURABLE=?FACTURABLE '
      '  ,INVERSION_SUJETO_PASIVO=?INVERSION_SUJETO_PASIVO '
      '  ,ENTRADA_FACTURACION=?ENTRADA_FACTURACION '
      '  ,COMPRADOR_EDI=?COMPRADOR_EDI '
      '  ,FECHA_ENTREGA_REPARTO=?FECHA_ENTREGA_REPARTO '
      '  ,Z_OBSERVACION=?Z_OBSERVACION '
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
      '  ,ID_TIPO_GIRO_CLIENTE=?ID_TIPO_GIRO_CLIENTE '
      '  ,CODIGO_GIRO_CLIENTE=?CODIGO_GIRO_CLIENTE '
      '  ,ID_TIPO_GIRO_EMPRESA=?ID_TIPO_GIRO_EMPRESA '
      '  ,CODIGO_GIRO_EMPRESA=?CODIGO_GIRO_EMPRESA '
      '  ,INDTRASLADO=?INDTRASLADO '
      '  ,TPOIMPRESION=?TPOIMPRESION '
      '  ,CARTA_PORTE_TRANSPORTISTA=?CARTA_PORTE_TRANSPORTISTA '
      '  ,COD_MOTIVO_ABONO=?COD_MOTIVO_ABONO '
      '  ,MODO_IVA=?MODO_IVA '
      '  ,ID_FICHA_TECNICA=?ID_FICHA_TECNICA '
      '  ,DIA_PAGO_1=?DIA_PAGO_1 '
      '  ,DIA_PAGO_2=?DIA_PAGO_2 '
      '  ,DIA_PAGO_3=?DIA_PAGO_3 '
      '  ,TITULO_GIRO_CLIENTE=?TITULO_GIRO_CLIENTE '
      '  ,ORIGEN_DOCUMENTO=?ORIGEN_DOCUMENTO '
      '  ,FOLIO=?FOLIO '
      '  ,TIPO_DOC_TRIBUTARIO=?TIPO_DOC_TRIBUTARIO '
      '  ,SII_FMA_PAGO=?SII_FMA_PAGO '
      '  ,TIPO_VENTA=?TIPO_VENTA '
      '  ,ID_TIPO_DESPACHO=?ID_TIPO_DESPACHO '
      '  ,OC_NROLINREF=?OC_NROLINREF '
      '  ,OC_TPODOCREF=?OC_TPODOCREF '
      '  ,OC_FOLIOREF=?OC_FOLIOREF '
      '  ,OC_RUTOTR=?OC_RUTOTR '
      '  ,OC_FCHREF=?OC_FCHREF '
      '  ,OC_CODREF=?OC_CODREF '
      '  ,OC_RAZONREF=?OC_RAZONREF '
      'WHERE'
      '  ID_S=?ID_S ')
    AutoCalcFields = False
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
    TableName = 'VER_CABECERAS_ALBARAN '
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_ALB')
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
      Size = 3
    end
    object QMCabeceraFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      EditMask = '!99/99/00;1;_'
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
      DisplayLabel = 'B. Dto. L'#237'neas'
      FieldName = 'B_DTO_LINEAS'
    end
    object QMCabeceraDTO_PP: TFloatField
      DisplayLabel = 'Dto. PP'
      FieldName = 'DTO_PP'
      OnChange = QMCabeceraDTO_PPChange
    end
    object QMCabeceraDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial'
      FieldName = 'DTO_CIAL'
    end
    object QMCabeceraI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial.'
      FieldName = 'I_DTO_CIAL'
    end
    object QMCabeceraI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. PP'
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
      DisplayLabel = '% Financiacion'
      FieldName = 'POR_FINANCIACION'
    end
    object QMCabeceraI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Financiacion'
      FieldName = 'I_FINANCIACION'
    end
    object QMCabeceraLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object QMCabeceraTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
      OnChange = QMCabeceraTRANSPORTISTAChange
    end
    object QMCabeceraI_BASE_RETENCION: TFloatField
      DisplayLabel = 'Imp. Base Retenci'#243'n'
      FieldName = 'I_BASE_RETENCION'
    end
    object QMCabeceraP_RETENCION: TFloatField
      DisplayLabel = '% Retenci'#243'n'
      FieldName = 'P_RETENCION'
    end
    object QMCabeceraI_RETENCION: TFloatField
      DisplayLabel = 'Imp. Retenci'#243'n'
      FieldName = 'I_RETENCION'
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
    object QMCabeceraFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      OnChange = QMCabeceraFORMA_PAGOChange
      Size = 3
    end
    object QMCabeceraCAMPANYA: TIntegerField
      DisplayLabel = 'Campa'#241'a'
      FieldName = 'CAMPANYA'
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
      DisplayLabel = 'Total a Cobrar'
      FieldName = 'TOTAL_A_COBRAR'
    end
    object QMCabeceraAPLICA_IRPF: TStringField
      DisplayLabel = 'Aplica IRPF'
      FieldKind = fkCalculated
      FieldName = 'APLICA_IRPF'
      OnGetText = QMCabeceraAPLICA_IRPFGetText
      Size = 25
      Calculated = True
    end
    object QMCabeceraNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMCabeceraSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMCabeceraTOTAL_CANAL: TFloatField
      DisplayLabel = 'Total Canal'
      FieldKind = fkCalculated
      FieldName = 'TOTAL_CANAL'
      OnGetText = QMCabeceraTOTAL_CANALGetText
      Calculated = True
    end
    object QMCabeceraTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      OnChange = QMCabeceraTARIFAChange
      Size = 3
    end
    object QMCabeceraBULTOS_KRI: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS_KRI'
    end
    object QMCabeceraID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMCabeceraGARANTIA: TIntegerField
      DisplayLabel = 'Garant'#237'a'
      FieldName = 'GARANTIA'
    end
    object QMCabeceraAGRUPACION_KRI: TIntegerField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION_KRI'
    end
    object QMCabeceraALMACEN_DEPOSITO: TFIBStringField
      DisplayLabel = 'Alm. Dep'#243'sito'
      FieldName = 'ALMACEN_DEPOSITO'
      Size = 3
    end
    object QMCabeceraNUM_MOV_DEPOSITO: TIntegerField
      DisplayLabel = 'Nro. Mov. Dep'#243'sito'
      FieldName = 'NUM_MOV_DEPOSITO'
    end
    object QMCabeceraDEPOSITO: TIntegerField
      DisplayLabel = 'Dep'#243'sito'
      FieldName = 'DEPOSITO'
    end
    object QMCabeceraDEVOLUCION_DEPOSITO: TIntegerField
      DisplayLabel = 'DEv. Dep'#243'sito'
      FieldName = 'DEVOLUCION_DEPOSITO'
    end
    object QMCabeceraIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
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
      DisplayLabel = #205'ndice'
      FieldName = 'INDICE'
      OnChange = QMCabeceraINDICEChange
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
    object QMCabeceraCONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
      OnChange = QMCabeceraCONTACTOChange
    end
    object QMCabeceraPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
      OnChange = QMCabeceraPROYECTOChange
    end
    object QMCabeceraNOTAS_INTERNAS_KRI: TBlobField
      DisplayLabel = 'Notas Internas'
      FieldName = 'NOTAS_INTERNAS_KRI'
      Size = 8
    end
    object QMCabeceraTIPO_LINEA_KRI: TIntegerField
      DisplayLabel = 'Tipo L'#237'nea'
      FieldName = 'TIPO_LINEA_KRI'
    end
    object QMCabeceraALBARAN_VALORADO: TIntegerField
      DisplayLabel = 'Valorar Alb.'
      FieldName = 'ALBARAN_VALORADO'
    end
    object QMCabeceraFECHA_SERVIDO: TDateTimeField
      DisplayLabel = 'Fecha Servido'
      FieldName = 'FECHA_SERVIDO'
    end
    object QMCabeceraPEDIDO_CLIENTE: TFIBStringField
      DisplayLabel = 'Nro. Pedido'
      FieldName = 'PEDIDO_CLIENTE'
      Size = 60
    end
    object QMCabeceraEMPLEADO_RESPONSABLE: TIntegerField
      DisplayLabel = 'Empl. Responsable'
      FieldName = 'EMPLEADO_RESPONSABLE'
    end
    object QMCabeceraEMPLEADO_ATENCION: TIntegerField
      DisplayLabel = 'Empl Antencion'
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
      DisplayLabel = 'T. Anticipo'
      FieldName = 'TOTAL_ANTICIPADO'
    end
    object QMCabeceraFACTURABLE: TIntegerField
      DisplayLabel = 'Facturable'
      FieldName = 'FACTURABLE'
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
    object QMCabeceraBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object QMCabeceraFOLIO: TIntegerField
      DisplayLabel = 'Folio'
      FieldName = 'FOLIO'
    end
    object QMCabeceraTIPO_DOC_TRIBUTARIO: TFIBStringField
      DisplayLabel = 'Tipo Doc. Tributario'
      FieldName = 'TIPO_DOC_TRIBUTARIO'
      Size = 3
    end
    object QMCabeceraSII_FMA_PAGO: TIntegerField
      DisplayLabel = 'F. Pago SII'
      FieldName = 'SII_FMA_PAGO'
    end
    object QMCabeceraTIPO_VENTA: TIntegerField
      DisplayLabel = 'Tipo Venta SII'
      FieldName = 'TIPO_VENTA'
    end
    object QMCabeceraFECHA_ENTREGA_REPARTO: TDateTimeField
      DisplayLabel = 'Fecha Reparto'
      FieldName = 'FECHA_ENTREGA_REPARTO'
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
    object QMCabeceraUSUARIO_CREACION: TIntegerField
      DisplayLabel = 'Usuario Creacion'
      FieldName = 'USUARIO_CREACION'
    end
    object QMCabeceraID_TIPO_DESPACHO: TIntegerField
      DisplayLabel = 'Id Tipo Despacho'
      FieldName = 'ID_TIPO_DESPACHO'
    end
    object QMCabeceraID_TIPO_GIRO_CLIENTE: TIntegerField
      DisplayLabel = 'Id Tipo Giro Cliente'
      FieldName = 'ID_TIPO_GIRO_CLIENTE'
    end
    object QMCabeceraCODIGO_GIRO_CLIENTE: TIntegerField
      DisplayLabel = 'Cod. Tipo Giro Cliente'
      FieldName = 'CODIGO_GIRO_CLIENTE'
    end
    object QMCabeceraID_TIPO_GIRO_EMPRESA: TIntegerField
      DisplayLabel = 'Id Tipo Giro Empresa'
      FieldName = 'ID_TIPO_GIRO_EMPRESA'
    end
    object QMCabeceraCODIGO_GIRO_EMPRESA: TIntegerField
      DisplayLabel = 'Cod. Tipo Giro Empresa'
      FieldName = 'CODIGO_GIRO_EMPRESA'
    end
    object QMCabeceraINDTRASLADO: TIntegerField
      DisplayLabel = 'Ind. Traslado'
      FieldName = 'INDTRASLADO'
    end
    object QMCabeceraTPOIMPRESION: TFIBStringField
      DisplayLabel = 'Tipo Impresion'
      FieldName = 'TPOIMPRESION'
      Size = 10
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
    object QMCabeceraCARTA_PORTE_TRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transp. C.P.'
      FieldName = 'CARTA_PORTE_TRANSPORTISTA'
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
    object QMCabeceraCOD_MOTIVO_ABONO: TIntegerField
      DisplayLabel = 'Motivo Abono'
      FieldName = 'COD_MOTIVO_ABONO'
    end
    object QMCabeceraMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object QMCabeceraID_FICHA_TECNICA: TIntegerField
      DisplayLabel = 'Id Ficha Tec.'
      FieldName = 'ID_FICHA_TECNICA'
    end
    object QMCabeceraTITULO_GIRO_CLIENTE: TFIBStringField
      DisplayLabel = 'Titulo Giro Cliente'
      FieldName = 'TITULO_GIRO_CLIENTE'
      Size = 150
    end
    object QMCabeceraDIR_NOMBRE_2: TFIBStringField
      DisplayLabel = 'Dir. nombre 2'
      FieldName = 'DIR_NOMBRE_2'
      Size = 40
    end
    object QMCabeceraCOMPRADOR_EDI: TFIBStringField
      DisplayLabel = 'Comprador EDI'
      FieldName = 'COMPRADOR_EDI'
      Size = 17
    end
    object QMCabeceraCOMPRADOR: TFIBStringField
      DisplayLabel = 'Comprador'
      FieldName = 'COMPRADOR'
      Size = 17
    end
    object QMCabeceraMATRICULA: TFIBStringField
      DisplayLabel = 'Matricula'
      FieldName = 'MATRICULA'
    end
    object QMCabeceraDIA_PAGO_1: TIntegerField
      DisplayLabel = 'Dia Pago 1'
      FieldName = 'DIA_PAGO_1'
    end
    object QMCabeceraDIA_PAGO_2: TIntegerField
      DisplayLabel = 'Dia Pago 2'
      FieldName = 'DIA_PAGO_2'
    end
    object QMCabeceraDIA_PAGO_3: TIntegerField
      DisplayLabel = 'Dia Pago 3'
      FieldName = 'DIA_PAGO_3'
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
    object QMCabeceraPORTES: TIntegerField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
    end
    object QMCabeceraENTRADA_FACTURACION: TIntegerField
      DisplayLabel = 'Seleccion'
      FieldName = 'ENTRADA_FACTURACION'
    end
    object QMCabeceraOC_NROLINREF: TIntegerField
      DisplayLabel = 'O.C. Nro Ref.'
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
      DisplayLabel = 'O.C. Fec. Ref.'
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
      'ID_CLIENTE'
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
  object xDirecciones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, DIR_TRANSPORTISTA FROM VER_DIRECCIONES '
      'WHERE TERCERO=?TERCERO AND'
      'DIRECCION=?DIRECCION')
    UniDirectional = False
    DataSource = DSQMCabecera
    Plan.Strings = (
      
        'PLAN JOIN (VER_DIRECCIONES SD INDEX (PK_SYS_TERCEROS_DIRECCIONES' +
        '),VER_DIRECCIONES SL INDEX (ID_LOCALIDADES))')
    Left = 32
    Top = 152
    object xDireccionesTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      OnGetText = xDireccionesTITULOGetText
      Size = 109
    end
    object xDireccionesDIR_TRANSPORTISTA: TIntegerField
      DisplayLabel = 'Dir. Transportista'
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
      
        'AS (SELECT A.BULTOS, A.S_BASES, A.S_CUOTA_IVA, A.S_CUOTA_RE, A.L' +
        'IQUIDO, A.TOTAL_A_COBRAR, A.I_BASE_RETENCION,'
      
        '           A.I_RETENCION, A.B_COMISION, A.I_COMISION, A.I_FINANC' +
        'IACION, A.B_DTO_LINEAS, A.I_DTO_LINEAS, A.ESTADO,'
      '           A.I_PORTES, A.MODIFICA_DOC,'
      '           (SELECT SUM(D.B_DTO_LINEA)'
      '            FROM GES_DETALLES_S D'
      '            JOIN ART_ARTICULOS AA ON D.ID_A = AA.ID_A'
      '            WHERE'
      '            D.ID_S = A.ID_S AND'
      '            AA.INFLUYE_MARGEN = 1) SUMA_BASES,'
      '           (SELECT SUM(D.T_COSTE)'
      '            FROM GES_DETALLES_S D'
      '            JOIN ART_ARTICULOS AA ON D.ID_A = AA.ID_A'
      '            WHERE'
      '            D.ID_S = A.ID_S AND'
      '            AA.INFLUYE_MARGEN = 1) SUMA_COSTES,'
      '           (SELECT SUM(UNIDADES)'
      '            FROM GES_DETALLES_S'
      '            WHERE'
      '            ID_S = A.ID_S) SUM_UNIDADES,'
      '           (SELECT SUM(UNIDADES_SEC)'
      '            FROM GES_DETALLES_S'
      '            WHERE'
      '            ID_S = A.ID_S) SUM_UNIDADES_SEC,'
      '           (SELECT SUM(UNIDADES_LOGISTICAS)'
      '            FROM GES_DETALLES_S_ALB'
      '            WHERE'
      '            ID_S = A.ID_S) SUM_UNIDADES_LOGISTICAS,'
      '           (SELECT SUM(PESO_REAL)'
      '            FROM GES_DETALLES_S'
      '            WHERE'
      '            ID_S = A.ID_S) SUM_PESO,'
      '           (SELECT COUNT(LINEA)'
      '            FROM GES_DETALLES_S'
      '            WHERE'
      '            ID_S = A.ID_S) COUNT_LINEA,'
      '           ((COALESCE((SELECT SUM(DET.LIQUIDO)'
      '                       FROM G_RELACIONES_ORIGENES_ID(A.ID_S) DOC'
      
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
      
        '                      DOC.ID_S = A.ID_S), 0)))) AS TOTAL_ANTICIP' +
        'ADO, --'
      
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
      '                     C.EMPRESA = A.EMPRESA AND'
      '                     C.CANAL = A.CANAL AND'
      '                     C.TIPO = '#39'PEC'#39' AND'
      '                     C.ESTADO = 0 AND'
      '                     D.UNIDADES <> 0 AND'
      '                     P.U_PENDIENTES <> 0 AND'
      '                     C.CLIENTE = A.CLIENTE), 0) RIESGO_PED'
      '    FROM VER_CABECERAS_ALBARAN A'
      
        '    JOIN EMP_CLIENTES EC ON EC.EMPRESA = A.EMPRESA AND EC.CLIENT' +
        'E = A.CLIENTE'
      '    WHERE'
      '    A.ID_S = :ID_S)'
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
    Left = 232
    Top = 8
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
    object xInfoActualizadaTOTAL_A_COBRAR: TFloatField
      DisplayLabel = 'Total a Cobrar'
      FieldName = 'TOTAL_A_COBRAR'
    end
    object xInfoActualizadaI_BASE_RETENCION: TFloatField
      DisplayLabel = 'Imp. Base Ret.'
      FieldName = 'I_BASE_RETENCION'
    end
    object xInfoActualizadaI_RETENCION: TFloatField
      DisplayLabel = 'Imp. Ret.'
      FieldName = 'I_RETENCION'
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
    Left = 328
    Top = 8
  end
  object EntornoDoc: TEntornoFind2000
    Empresa = 0
    Ejercicio = 0
    Canal = 0
    Tercero = 0
    Cliente = 0
    Pgc = 0
    Left = 776
    Top = 8
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
      'SELECT TITULO,PRONTO_PAGO,HEREDA_FINANCIACION,'
      '               PAGO_AUTOMATICO  FROM CON_CUENTAS_GES_FP'
      'WHERE EMPRESA=?EMPRESA AND'
      '               EJERCICIO=?EJERCICIO AND'
      '               CANAL=?CANAL AND'
      '               FORMA_PAGO=?FORMA_PAGO')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 32
    Top = 200
  end
  object DSxFormasPago: TDataSource
    DataSet = xFormasPago
    Left = 128
    Top = 200
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 776
    Top = 56
  end
  object QSPProcedencia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM  G_PROCEDENCIA_DOCUMENTO_LINEA'
      '(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA)')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 232
    Top = 56
  end
  object DSQSPProcedencia: TDataSource
    DataSet = QSPProcedencia
    Left = 328
    Top = 56
  end
  object SPRefrescaDetalle: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure ut_refresca_detalle_s (?empresa,?ejercicio,?ca' +
        'nal,'
      '?serie,?tipo,?rig,?cliente,?tarifa,?fecha,?moneda)')
    Transaction = TLocal
    AutoTrans = True
    Left = 640
    Top = 8
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
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
    UniDirectional = True
    DataSource = DSQMDetalle
    Left = 232
    Top = 392
  end
  object SPCambiaMoneda: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure ut_refresca_detalle_s_moneda (?EMPRESA,?EJERCI' +
        'CIO,?CANAL,'
      ' ?SERIE,?TIPO,?RIG,?MONEDAOLD)')
    Transaction = TLocal
    AutoTrans = True
    Left = 640
    Top = 104
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
    Left = 32
    Top = 248
  end
  object DSxTipoIRPF: TDataSource
    DataSet = xTipoIRPF
    Left = 128
    Top = 248
  end
  object QMCabeceraEDI: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EDI_ALB_CAB'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO EDI_ALB_CAB'
      
        '  (FECDES,FECENT,FECENTSO,FECPANT,FECPDES,FECALB,FECPED,FECPICK,' +
        'TOTQTY,FECENVIO,SERIE,RIG,IDCAB,EMPRESA,EJERCICIO,CANAL,TIPO,NUM' +
        'DES,TIPOA,FUNCION,CONESP,NUMALB,NUMPED,NUMPICK,ORIGEN,DESTINO,PR' +
        'OVEEDOR,COMPRADOR,DPTO,RECEPTOR,MUELLE,PUNTENV,EXPEDIDOR,ULTCONS' +
        ',ENTREGA,REPOS,PORTES,RECOGIDA,TIPTRANS,IDTRANS,MATRIC,IDENTIF,C' +
        'ONSIG,CIP)'
      'VALUES'
      
        '  (?FECDES,?FECENT,?FECENTSO,?FECPANT,?FECPDES,?FECALB,?FECPED,?' +
        'FECPICK,?TOTQTY,?FECENVIO,?SERIE,?RIG,?IDCAB,?EMPRESA,?EJERCICIO' +
        ',?CANAL,?TIPO,?NUMDES,?TIPOA,?FUNCION,?CONESP,?NUMALB,?NUMPED,?N' +
        'UMPICK,?ORIGEN,?DESTINO,?PROVEEDOR,?COMPRADOR,?DPTO,?RECEPTOR,?M' +
        'UELLE,?PUNTENV,?EXPEDIDOR,?ULTCONS,?ENTREGA,?REPOS,?PORTES,?RECO' +
        'GIDA,?TIPTRANS,?IDTRANS,?MATRIC,?IDENTIF,?CONSIG,?CIP)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EDI_ALB_CAB'
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
      'FROM EDI_ALB_CAB'
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
      'UPDATE EDI_ALB_CAB'
      'SET'
      '  FECDES=?FECDES '
      '  ,FECENT=?FECENT '
      '  ,FECENTSO=?FECENTSO '
      '  ,FECPANT=?FECPANT '
      '  ,FECPDES=?FECPDES '
      '  ,FECALB=?FECALB '
      '  ,FECPED=?FECPED '
      '  ,FECPICK=?FECPICK '
      '  ,TOTQTY=?TOTQTY '
      '  ,FECENVIO=?FECENVIO '
      '  ,IDCAB=?IDCAB '
      '  ,NUMDES=?NUMDES '
      '  ,TIPOA=?TIPOA '
      '  ,FUNCION=?FUNCION '
      '  ,CONESP=?CONESP '
      '  ,NUMALB=?NUMALB '
      '  ,NUMPED=?NUMPED '
      '  ,NUMPICK=?NUMPICK '
      '  ,ORIGEN=?ORIGEN '
      '  ,DESTINO=?DESTINO '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,COMPRADOR=?COMPRADOR '
      '  ,DPTO=?DPTO '
      '  ,RECEPTOR=?RECEPTOR '
      '  ,MUELLE=?MUELLE '
      '  ,PUNTENV=?PUNTENV '
      '  ,EXPEDIDOR=?EXPEDIDOR '
      '  ,ULTCONS=?ULTCONS '
      '  ,ENTREGA=?ENTREGA '
      '  ,REPOS=?REPOS '
      '  ,PORTES=?PORTES '
      '  ,RECOGIDA=?RECOGIDA '
      '  ,TIPTRANS=?TIPTRANS '
      '  ,IDTRANS=?IDTRANS '
      '  ,MATRIC=?MATRIC '
      '  ,IDENTIF=?IDENTIF '
      '  ,CONSIG=?CONSIG '
      '  ,CIP=?CIP '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    DataSource = DSQMCabecera
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
    TableName = 'EDI_ALB_CAB'
    UpdateTransaction = TUpdate
    Left = 32
    Top = 344
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
    object QMCabeceraEDIIDCAB: TFIBStringField
      DisplayLabel = 'ID'
      FieldName = 'IDCAB'
      Size = 10
    end
    object QMCabeceraEDINUMDES: TFIBStringField
      DisplayLabel = 'Nro. Des.'
      FieldName = 'NUMDES'
      Size = 35
    end
    object QMCabeceraEDITIPOA: TFIBStringField
      DisplayLabel = 'Tipo A'
      FieldName = 'TIPOA'
      Size = 3
    end
    object QMCabeceraEDIFUNCION: TFIBStringField
      DisplayLabel = 'Funcion'
      FieldName = 'FUNCION'
      Size = 3
    end
    object QMCabeceraEDIFECDES: TDateTimeField
      DisplayLabel = 'Fec. Des.'
      FieldName = 'FECDES'
    end
    object QMCabeceraEDIFECENT: TDateTimeField
      DisplayLabel = 'Fec. Ent.'
      FieldName = 'FECENT'
    end
    object QMCabeceraEDIFECENTSO: TDateTimeField
      DisplayLabel = 'Fec. Entso.'
      FieldName = 'FECENTSO'
    end
    object QMCabeceraEDIFECPANT: TDateTimeField
      DisplayLabel = 'Fec. P. Ant'
      FieldName = 'FECPANT'
    end
    object QMCabeceraEDIFECPDES: TDateTimeField
      DisplayLabel = 'Fec. P. Des'
      FieldName = 'FECPDES'
    end
    object QMCabeceraEDICONESP: TFIBStringField
      DisplayLabel = 'Cond. Esp.'
      FieldName = 'CONESP'
      Size = 3
    end
    object QMCabeceraEDINUMALB: TFIBStringField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'NUMALB'
      Size = 35
    end
    object QMCabeceraEDIFECALB: TDateTimeField
      DisplayLabel = 'Fec. Alb.'
      FieldName = 'FECALB'
    end
    object QMCabeceraEDINUMPED: TFIBStringField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'NUMPED'
      Size = 35
    end
    object QMCabeceraEDIFECPED: TDateTimeField
      DisplayLabel = 'Fec. Ped.'
      FieldName = 'FECPED'
    end
    object QMCabeceraEDINUMPICK: TFIBStringField
      DisplayLabel = 'Nro. Pick'
      FieldName = 'NUMPICK'
      Size = 35
    end
    object QMCabeceraEDIFECPICK: TDateTimeField
      DisplayLabel = 'Fec. Pick'
      FieldName = 'FECPICK'
    end
    object QMCabeceraEDIORIGEN: TFIBStringField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
      Size = 17
    end
    object QMCabeceraEDIDESTINO: TFIBStringField
      DisplayLabel = 'Destino'
      FieldName = 'DESTINO'
      Size = 17
    end
    object QMCabeceraEDIPROVEEDOR: TFIBStringField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
      Size = 17
    end
    object QMCabeceraEDICOMPRADOR: TFIBStringField
      DisplayLabel = 'Comprador'
      FieldName = 'COMPRADOR'
      Size = 17
    end
    object QMCabeceraEDIDPTO: TFIBStringField
      DisplayLabel = 'Dpto.'
      FieldName = 'DPTO'
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
    object QMCabeceraEDIPUNTENV: TFIBStringField
      DisplayLabel = 'Punt. Env.'
      FieldName = 'PUNTENV'
      Size = 17
    end
    object QMCabeceraEDIEXPEDIDOR: TFIBStringField
      DisplayLabel = 'Expedidor'
      FieldName = 'EXPEDIDOR'
      Size = 17
    end
    object QMCabeceraEDIULTCONS: TFIBStringField
      DisplayLabel = 'Ult. Cons.'
      FieldName = 'ULTCONS'
      Size = 17
    end
    object QMCabeceraEDIENTREGA: TFIBStringField
      DisplayLabel = 'Entrega'
      FieldName = 'ENTREGA'
      Size = 3
    end
    object QMCabeceraEDIREPOS: TFIBStringField
      DisplayLabel = 'Repos.'
      FieldName = 'REPOS'
      Size = 35
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
    object QMCabeceraEDITIPTRANS: TFIBStringField
      DisplayLabel = 'Tipo Trans.'
      FieldName = 'TIPTRANS'
      Size = 3
    end
    object QMCabeceraEDIIDTRANS: TFIBStringField
      DisplayLabel = 'ID'
      FieldName = 'IDTRANS'
      Size = 17
    end
    object QMCabeceraEDIMATRIC: TFIBStringField
      DisplayLabel = 'Matricula'
      FieldName = 'MATRIC'
      Size = 35
    end
    object QMCabeceraEDITOTQTY: TFloatField
      DisplayLabel = 'Total Cant.'
      FieldName = 'TOTQTY'
    end
    object QMCabeceraEDIIDENTIF: TFIBStringField
      DisplayLabel = 'Identificador'
      FieldName = 'IDENTIF'
      Size = 3
    end
    object QMCabeceraEDICONSIG: TFIBStringField
      DisplayLabel = 'Consig.'
      FieldName = 'CONSIG'
      Size = 3
    end
    object QMCabeceraEDICIP: TFIBStringField
      DisplayLabel = 'C.I.P.'
      FieldName = 'CIP'
      Size = 17
    end
    object QMCabeceraEDIFECENVIO: TDateTimeField
      DisplayLabel = 'Fec. Envio'
      FieldName = 'FECENVIO'
    end
  end
  object DSQMCabeceraEDI: TDataSource
    DataSet = QMCabeceraEDI
    Left = 128
    Top = 344
  end
  object QMCartaPortes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_CABECERAS_S_CGA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO GES_CABECERAS_S_CGA'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,ID_S,CARGADORA,DIR_C' +
        'ARGADORA,EXPEDIDORA,DIR_EXPEDIDORA,'#13#10'INTERMEDIARIA,DIR_INTERMEDI' +
        'ARIA,TRANSPORTISTA,DIR_TRANSPORTISTA,DESTINATARIO,DIR_DESTINATAR' +
        'IO,BULTOS,PESO,ORIGEN,DESTINO,'#13#10'FECHA_TRANSPORTE,NOTAS,PALETS,PE' +
        'SO_BRUTO,UNIDADES_LOGISTICAS,VOLUMEN,CODIGO_EXPEDICION)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ID_S,?CARGADO' +
        'RA,?DIR_CARGADORA,?EXPEDIDORA,?DIR_EXPEDIDORA,'#13#10'?INTERMEDIARIA,?' +
        'DIR_INTERMEDIARIA,?TRANSPORTISTA,?DIR_TRANSPORTISTA,?DESTINATARI' +
        'O,?DIR_DESTINATARIO,?BULTOS,?PESO,?ORIGEN,?DESTINO,'#13#10'?FECHA_TRAN' +
        'SPORTE,?NOTAS,?PALETS,?PESO_BRUTO,?UNIDADES_LOGISTICAS,?VOLUMEN,' +
        '?CODIGO_EXPEDICION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_S_CGA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_CGA'
      'WHERE ID_S=?ID_S')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_S_CGA'
      'SET'
      '  ID_S=?ID_S '
      '  ,CARGADORA=?CARGADORA '
      '  ,DIR_CARGADORA=?DIR_CARGADORA '
      '  ,EXPEDIDORA=?EXPEDIDORA '
      '  ,DIR_EXPEDIDORA=?DIR_EXPEDIDORA '
      '  ,INTERMEDIARIA=?INTERMEDIARIA '
      '  ,DIR_INTERMEDIARIA=?DIR_INTERMEDIARIA '
      '  ,TRANSPORTISTA=?TRANSPORTISTA '
      '  ,DIR_TRANSPORTISTA=?DIR_TRANSPORTISTA '
      '  ,DESTINATARIO=?DESTINATARIO '
      '  ,DIR_DESTINATARIO=?DIR_DESTINATARIO '
      '  ,BULTOS=?BULTOS '
      '  ,PESO=?PESO '
      '  ,ORIGEN=?ORIGEN '
      '  ,DESTINO=?DESTINO '
      '  ,FECHA_TRANSPORTE=?FECHA_TRANSPORTE '
      '  ,NOTAS=?NOTAS '
      '  ,PALETS=?PALETS '
      '  ,PESO_BRUTO=?PESO_BRUTO '
      '  ,UNIDADES_LOGISTICAS=?UNIDADES_LOGISTICAS '
      '  ,VOLUMEN=?VOLUMEN '
      '  ,CODIGO_EXPEDICION=?CODIGO_EXPEDICION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    DataSource = DSQMCabecera
    AfterCancel = QMCartaPortesAfterCancel
    AfterDelete = GrabaBorrado
    AfterInsert = QMCartaPortesAfterInsert
    AfterOpen = QMCartaPortesAfterOpen
    AfterPost = GrabaMatNat
    BeforeCancel = QMCartaPortesBeforeCancel
    BeforeClose = QMCartaPortesBeforeClose
    BeforeEdit = QMCartaPortesBeforeEdit
    OnNewRecord = QMCartaPortesNewRecord
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
    TableName = 'GES_CABECERAS_S_CGA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 232
    Top = 104
    object QMCartaPortesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCartaPortesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCartaPortesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCartaPortesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCartaPortesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCartaPortesRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCartaPortesID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMCartaPortesCARGADORA: TIntegerField
      DisplayLabel = 'Cargadora'
      FieldName = 'CARGADORA'
      OnChange = QMCartaPortesCARGADORAChange
    end
    object QMCartaPortesDIR_CARGADORA: TIntegerField
      DisplayLabel = 'Dir. Cargadora'
      FieldName = 'DIR_CARGADORA'
    end
    object QMCartaPortesEXPEDIDORA: TIntegerField
      DisplayLabel = 'Expedidora'
      FieldName = 'EXPEDIDORA'
      OnChange = QMCartaPortesEXPEDIDORAChange
    end
    object QMCartaPortesDIR_EXPEDIDORA: TIntegerField
      DisplayLabel = 'Expedidora'
      FieldName = 'DIR_EXPEDIDORA'
    end
    object QMCartaPortesINTERMEDIARIA: TIntegerField
      DisplayLabel = 'Intermediaria'
      FieldName = 'INTERMEDIARIA'
      OnChange = QMCartaPortesINTERMEDIARIAChange
    end
    object QMCartaPortesDIR_INTERMEDIARIA: TIntegerField
      DisplayLabel = 'Intermediaria'
      FieldName = 'DIR_INTERMEDIARIA'
    end
    object QMCartaPortesTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
      OnChange = QMCartaPortesTRANSPORTISTAChange
    end
    object QMCartaPortesDIR_TRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transp. Dir.'
      FieldName = 'DIR_TRANSPORTISTA'
    end
    object QMCartaPortesDESTINATARIO: TIntegerField
      DisplayLabel = 'Destinatario'
      FieldName = 'DESTINATARIO'
      OnChange = QMCartaPortesDESTINATARIOChange
    end
    object QMCartaPortesDIR_DESTINATARIO: TIntegerField
      DisplayLabel = 'Destinatario'
      FieldName = 'DIR_DESTINATARIO'
    end
    object QMCartaPortesBULTOS: TFloatField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object QMCartaPortesPESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object QMCartaPortesORIGEN: TIntegerField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
    end
    object QMCartaPortesDESTINO: TIntegerField
      DisplayLabel = 'Destino'
      FieldName = 'DESTINO'
    end
    object QMCartaPortesFECHA_TRANSPORTE: TDateTimeField
      DisplayLabel = 'Fec. Transp.'
      FieldName = 'FECHA_TRANSPORTE'
    end
    object QMCartaPortesNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMCartaPortesPALETS: TFloatField
      DisplayLabel = 'Palets'
      FieldName = 'PALETS'
    end
    object QMCartaPortesPESO_BRUTO: TFloatField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESO_BRUTO'
    end
    object QMCartaPortesUNIDADES_LOGISTICAS: TFloatField
      DisplayLabel = 'Uds. Log.'
      FieldName = 'UNIDADES_LOGISTICAS'
    end
    object QMCartaPortesVOLUMEN: TFloatField
      DisplayLabel = 'Volumen'
      FieldName = 'VOLUMEN'
    end
    object QMCartaPortesCODIGO_EXPEDICION: TFIBStringField
      DisplayLabel = 'Codigo Expedicion'
      FieldName = 'CODIGO_EXPEDICION'
      Size = 40
    end
  end
  object DSCartaPortes: TDataSource
    DataSet = QMCartaPortes
    Left = 328
    Top = 104
  end
  object QMNaturaleza: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CABECERAS_NATURALEZAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG AND '
      '  NATURALEZA=?old_NATURALEZA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CABECERAS_NATURALEZAS'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,ID_S,NATURALEZA,TITULO' +
        ')'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ID_S,?NATURALEZ' +
        'A,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_NATURALEZAS'
      'WHERE ID_S=?ID_S')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_NATURALEZAS'
      'WHERE ID_S=?ID_S')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CABECERAS_NATURALEZAS'
      'SET'
      '  ID_S=?ID_S '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  NATURALEZA=?NATURALEZA ')
    DataSource = DSCartaPortes
    AfterDelete = GrabaBorrado
    AfterInsert = QMNaturalezaAfterInsert
    AfterPost = GrabaBorrado
    OnNewRecord = QMNaturalezaNewRecord
    ClavesPrimarias.Strings = (
      'ID_S'#13)
    AccionesInhibidas = []
    Opciones = [DesactivarControlesAlOrdenar, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CABECERAS_NATURALEZAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 232
    Top = 200
    object QMNaturalezaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMNaturalezaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMNaturalezaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMNaturalezaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMNaturalezaTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMNaturalezaRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMNaturalezaID_S: TIntegerField
      DisplayLabel = 'ID Cab.'
      FieldName = 'ID_S'
    end
    object QMNaturalezaNATURALEZA: TIntegerField
      DisplayLabel = 'Naturaleza'
      FieldName = 'NATURALEZA'
      OnChange = QMNaturalezaNATURALEZAChange
    end
    object QMNaturalezaTITULO: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSQMNaturaleza: TDataSource
    DataSet = QMNaturaleza
    Left = 328
    Top = 200
  end
  object QMMatriculas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CABECERAS_MATRICULAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG AND '
      '  MATRICULA=?old_MATRICULA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CABECERAS_MATRICULAS'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,ID_S,MATRICULA,TITULO,' +
        'TRANSPORTISTA,TITULO_TRANS)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ID_S,?MATRICULA' +
        ',?TITULO,?TRANSPORTISTA,?TITULO_TRANS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_MATRICULAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  MATRICULA=?MATRICULA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_MATRICULAS'
      'WHERE ID_S=?ID_S')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CABECERAS_MATRICULAS'
      'SET TITULO=?TITULO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  MATRICULA=?MATRICULA ')
    DataSource = DSCartaPortes
    AfterDelete = GrabaBorrado
    AfterInsert = QMMatriculasAfterInsert
    AfterPost = GrabaBorrado
    OnNewRecord = QMMatriculasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG '
      'MATRICULA ')
    AccionesInhibidas = []
    Opciones = [DesactivarControlesAlOrdenar, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CABECERAS_MATRICULAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 232
    Top = 152
    object QMMatriculasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMMatriculasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMMatriculasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMMatriculasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMMatriculasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMMatriculasRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMMatriculasID_S: TIntegerField
      DisplayLabel = 'ID Cab.'
      FieldName = 'ID_S'
    end
    object QMMatriculasMATRICULA: TFIBStringField
      DisplayLabel = 'Matr'#237'cula'
      FieldName = 'MATRICULA'
      OnChange = QMMatriculasMATRICULAChange
    end
    object QMMatriculasTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMMatriculasTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
    end
    object QMMatriculasTITULO_TRANS: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'TITULO_TRANS'
      Size = 60
    end
  end
  object DSQMMatriculas: TDataSource
    DataSet = QMMatriculas
    Left = 328
    Top = 152
  end
  object xTransportistaCarta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT ST.NOMBRE_R_SOCIAL TITULO, ST.TERCERO'
      'FROM EMP_ACREEDORES EA'
      'JOIN SYS_TERCEROS ST'
      'ON (EA.TERCERO = ST.TERCERO)'
      'WHERE'
      'EA.EMPRESA = ?EMPRESA AND'
      'EA.ACREEDOR = ?TRANSPORTISTA')
    SelectSQL.Strings = (
      'SELECT ST.NOMBRE_R_SOCIAL TITULO, ST.TERCERO'
      'FROM EMP_ACREEDORES EA'
      'JOIN SYS_TERCEROS ST'
      'ON (EA.TERCERO = ST.TERCERO)'
      'WHERE'
      'EA.EMPRESA = ?EMPRESA AND'
      'EA.ACREEDOR = ?TRANSPORTISTA')
    UniDirectional = False
    DataSource = DSCartaPortes
    Left = 232
    Top = 440
    object xTransportistaCartaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xTransportistaCartaTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
  end
  object xOrigen: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT DIR.TITULO FROM VER_DIRECCIONES DIR '
      'JOIN ART_ALMACENES ART '
      'ON (DIR.TERCERO=ART.TERCERO) '
      'WHERE '
      'ART.ALMACEN=?ALMACEN AND '
      'DIR.DIRECCION=1')
    SelectSQL.Strings = (
      'SELECT FIRST 1 DIR.TITULO FROM VER_DIRECCIONES DIR '
      'JOIN ART_ALMACENES ART '
      'ON (DIR.TERCERO=ART.TERCERO) '
      'WHERE '
      'ART.EMPRESA=?EMPRESA AND'
      'ART.ALMACEN=?ALMACEN '
      'ORDER BY DIR.DIRECCION')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 232
    Top = 248
    object xOrigenTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      DisplayWidth = 110
      FieldName = 'TITULO'
      Size = 110
    end
  end
  object DSxOrigen: TDataSource
    DataSet = xOrigen
    Left = 328
    Top = 248
  end
  object QTituloNaturaleza: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select titulo from sys_naturaleza_carga'
      'where naturaleza=?naturaleza')
    Transaction = TLocal
    AutoTrans = True
    Left = 520
    Top = 152
  end
  object QTituloMatricula: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select titulo from emp_matriculas '
      'where (empresa=?empresa)  and  (matricula=?matricula)')
    Transaction = TLocal
    AutoTrans = True
    Left = 640
    Top = 152
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
    Left = 232
    Top = 296
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
    Left = 328
    Top = 296
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
    Top = 392
    object FIBStringField1: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxRangos: TDataSource
    DataSet = xRangos
    Left = 128
    Top = 392
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
    Top = 440
    object FIBStringField2: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxIndices: TDataSource
    DataSet = xIndices
    Left = 128
    Top = 440
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
    Left = 32
    Top = 296
  end
  object DSxProyectos: TDataSource
    DataSet = xProyectos
    Left = 128
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
    Left = 776
    Top = 104
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
    Left = 232
    Top = 344
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
    Left = 328
    Top = 344
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
    Left = 32
    Top = 488
    object QMSIIDteReferenciaID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object QMSIIDteReferenciaID_S_REF: TIntegerField
      DisplayLabel = 'IDs Ref'
      FieldName = 'ID_S_REF'
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
      DisplayLabel = 'Cod Ref'
      FieldName = 'CODREF'
    end
    object QMSIIDteReferenciaRAZONREF: TFIBStringField
      DisplayLabel = 'Razon Ref'
      FieldName = 'RAZONREF'
      Size = 100
    end
    object QMSIIDteReferenciaRUTOTR: TFIBStringField
      DisplayLabel = 'RUT Otro'
      FieldName = 'RUTOTR'
    end
    object QMSIIDteReferenciaFOLIOREF: TFIBStringField
      DisplayLabel = 'Folio Ref'
      FieldName = 'FOLIOREF'
    end
  end
  object DSQMSIIDteReferencia: TDataSource
    DataSet = QMSIIDteReferencia
    Left = 128
    Top = 488
  end
  object xSiiDte: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      
        'SELECT ID_S, CANTIDAD_ERRORES, MENSAJE_ERROR, XML_RESPUESTA ,SII' +
        '_TRACKID'
      'FROM GES_CABECERAS_S_FE_CHL '
      'WHERE '
      'ID_S = :ID_S')
    SelectSQL.Strings = (
      
        'SELECT ID_S, CANTIDAD_ERRORES, MENSAJE_ERROR, XML_RESPUESTA, SII' +
        '_TRACKID '
      'FROM GES_CABECERAS_S_FE_CHL '
      'WHERE '
      'ID_S = :ID_S')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 32
    Top = 536
    object xSiiDteID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object xSiiDteCANTIDAD_ERRORES: TIntegerField
      DisplayLabel = 'Cant. Errores'
      FieldName = 'CANTIDAD_ERRORES'
    end
    object xSiiDteMENSAJE_ERROR: TFIBStringField
      DisplayLabel = 'Mensaje Error'
      FieldName = 'MENSAJE_ERROR'
      Size = 100
    end
    object xSiiDteXML_RESPUESTA: TMemoField
      DisplayLabel = 'XML Respuesta'
      FieldName = 'XML_RESPUESTA'
      BlobType = ftMemo
      Size = 8
    end
    object xSiiDteSII_TRACKID: TFIBStringField
      DisplayLabel = 'SII Track ID'
      FieldName = 'SII_TRACKID'
    end
  end
  object DSxSiiDte: TDataSource
    DataSet = xSiiDte
    Left = 128
    Top = 536
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
      '        TIPO_DOCUMENTO = '#39'ALB'#39' AND'
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
      '        TIPO_DOCUMENTO = '#39'ALB'#39' AND'
      '        ACTIVO = 1),'
      '        (SELECT NOTAS'
      '         FROM EMP_CLIENTES'
      '         WHERE'
      '         ID_CLIENTE = :ID_CLIENTE)'
      'FROM RDB$DATABASE')
    UniDirectional = False
    DataSource = DSxCliente
    Left = 232
    Top = 536
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
    Left = 232
    Top = 488
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
    Left = 328
    Top = 488
  end
  object DSxAvisos: TDataSource
    DataSet = xAvisos
    Left = 328
    Top = 536
  end
end
