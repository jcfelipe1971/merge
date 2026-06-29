inherited DMAlbaranesAlquiler: TDMAlbaranesAlquiler
  OldCreateOrder = True
  inherited QMDetalle: TFIBTableSet
    DeleteSQL.Strings = (
      'DELETE FROM VER_DETALLE_ALBARAN_ALQ'
      'WHERE'
      '  ID_DETALLES_S=?old_ID_DETALLES_S AND '
      '  ID_S=?old_ID_S ')
    InsertSQL.Strings = (
      'INSERT INTO VER_DETALLE_ALBARAN_ALQ'
      
        '  (UNIDADES_FACTURADAS,COMISION_LINEAL,I_COMISION_LINEAL,FECHA_P' +
        'RE_DET,FECHA_REC_DET,UNIDADES_LOGISTICAS,UNIDADES_UB,UNIDADES_LO' +
        'T,COSTE_ADICIONAL,SERIE,UNIDADES,PRECIO,P_COSTE,BRUTO,B_COMISION' +
        ',I_DESCUENTO,B_IMPONIBLE,I_COMISION,NOTAS,NOTAS2,UNIDADES_EXT,UN' +
        'IDADES_SEC,CAJA_EDI,TIPO_LINEA_KRI,ORDEN,ORIGEN,ID_P,PROYECTO,ID' +
        '_UBICACION,ID_A_UBICACION,ID_LOTE,ID_IMAGEN,UNIDADES_ROTAS,RIG,L' +
        'INEA,DESCUENTO,DESCUENTO_2,DESCUENTO_3,COMISION,M_MOV_STOCK,P_IV' +
        'A,P_RECARGO,ENTRADA,ID_DETALLES_S,ID_S,ID_A,ID_C_A,P_IMPUESTO_AD' +
        'ICIONAL,LINEA_SERVIDA,TITULO_IDIOMA,PROC_PROMOCION,APLICA_UNIDAD' +
        'ES_SECUNDARIAS,LINEA_RELACION,COMPOSICION,LOTE,LOTE_SIMPLE,DIREC' +
        'CION_ENTREGA,LOTEABLE,MANIPULACION,ALFA_1,ALFA_2,ALFA_3,ALFA_4,A' +
        'LFA_5,ALFA_6,ALFA_7,ALFA_8,INVERSION_SUJETO_PASIVO,EMPRESA,EJERC' +
        'ICIO,CANAL,TITULO,PIEZAS_X_BULTO,BULTOS,TIPO_IVA,TIPO_IMPUESTO_A' +
        'DICIONAL,TIPO_CAJA_EDI,TIPO_LINEA,CRC_NOTAS,CRC_NOTAS2,PRO_NUM_P' +
        'LANO,TIPO_UNIDAD_LOGISTICA,TITULO_UNIDAD_LOGISTICA,ALMACEN_UB,CA' +
        'LLE,ESTANTERIA,REPISA,POSICION,PAIS,TIPO,ALMACEN,ARTICULO,NSERIE' +
        ',NO_FABRICACION_KRI,PESO,PESO_TOTAL,PESO_REAL,DECIMALES_UNIDADES' +
        ',SIGNO_UNIDADES)'
      'VALUES'
      
        '  (?UNIDADES_FACTURADAS,?COMISION_LINEAL,?I_COMISION_LINEAL,?FEC' +
        'HA_PRE_DET,?FECHA_REC_DET,?UNIDADES_LOGISTICAS,?UNIDADES_UB,?UNI' +
        'DADES_LOT,?COSTE_ADICIONAL,?SERIE,?UNIDADES,?PRECIO,?P_COSTE,?BR' +
        'UTO,?B_COMISION,?I_DESCUENTO,?B_IMPONIBLE,?I_COMISION,?NOTAS,?NO' +
        'TAS2,?UNIDADES_EXT,?UNIDADES_SEC,?CAJA_EDI,?TIPO_LINEA_KRI,?ORDE' +
        'N,?ORIGEN,?ID_P,?PROYECTO,?ID_UBICACION,?ID_A_UBICACION,?ID_LOTE' +
        ',?ID_IMAGEN,?UNIDADES_ROTAS,?RIG,?LINEA,?DESCUENTO,?DESCUENTO_2,' +
        '?DESCUENTO_3,?COMISION,?M_MOV_STOCK,?P_IVA,?P_RECARGO,?ENTRADA,?' +
        'ID_DETALLES_S,?ID_S,?ID_A,?ID_C_A,?P_IMPUESTO_ADICIONAL,?LINEA_S' +
        'ERVIDA,?TITULO_IDIOMA,?PROC_PROMOCION,?APLICA_UNIDADES_SECUNDARI' +
        'AS,?LINEA_RELACION,?COMPOSICION,?LOTE,?LOTE_SIMPLE,?DIRECCION_EN' +
        'TREGA,?LOTEABLE,?MANIPULACION,?ALFA_1,?ALFA_2,?ALFA_3,?ALFA_4,?A' +
        'LFA_5,?ALFA_6,?ALFA_7,?ALFA_8,?INVERSION_SUJETO_PASIVO,?EMPRESA,' +
        '?EJERCICIO,?CANAL,?TITULO,?PIEZAS_X_BULTO,?BULTOS,?TIPO_IVA,?TIP' +
        'O_IMPUESTO_ADICIONAL,?TIPO_CAJA_EDI,?TIPO_LINEA,?CRC_NOTAS,?CRC_' +
        'NOTAS2,?PRO_NUM_PLANO,?TIPO_UNIDAD_LOGISTICA,?TITULO_UNIDAD_LOGI' +
        'STICA,?ALMACEN_UB,?CALLE,?ESTANTERIA,?REPISA,?POSICION,?PAIS,?TI' +
        'PO,?ALMACEN,?ARTICULO,?NSERIE,?NO_FABRICACION_KRI,?PESO,?PESO_TO' +
        'TAL,?PESO_REAL,?DECIMALES_UNIDADES,?SIGNO_UNIDADES)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DETALLE_ALBARAN_ALQ'
      'WHERE'
      '  ID_DETALLES_S=?ID_DETALLES_S AND '
      '  ID_S=?ID_S ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_ALBARAN_ALQ'
      'WHERE'
      '  ID_S = ?ID_S'
      'ORDER BY ORDEN')
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLE_ALBARAN_ALQ'
      'SET'
      '  UNIDADES_FACTURADAS=?UNIDADES_FACTURADAS '
      '  ,COMISION_LINEAL=?COMISION_LINEAL '
      '  ,I_COMISION_LINEAL=?I_COMISION_LINEAL '
      '  ,FECHA_PRE_DET=?FECHA_PRE_DET '
      '  ,FECHA_REC_DET=?FECHA_REC_DET '
      '  ,UNIDADES_LOGISTICAS=?UNIDADES_LOGISTICAS '
      '  ,UNIDADES_UB=?UNIDADES_UB '
      '  ,UNIDADES_LOT=?UNIDADES_LOT '
      '  ,COSTE_ADICIONAL=?COSTE_ADICIONAL '
      '  ,SERIE=?SERIE '
      '  ,UNIDADES=?UNIDADES '
      '  ,PRECIO=?PRECIO '
      '  ,P_COSTE=?P_COSTE '
      '  ,BRUTO=?BRUTO '
      '  ,B_COMISION=?B_COMISION '
      '  ,I_DESCUENTO=?I_DESCUENTO '
      '  ,B_IMPONIBLE=?B_IMPONIBLE '
      '  ,I_COMISION=?I_COMISION '
      '  ,NOTAS=?NOTAS '
      '  ,NOTAS2=?NOTAS2 '
      '  ,UNIDADES_EXT=?UNIDADES_EXT '
      '  ,UNIDADES_SEC=?UNIDADES_SEC '
      '  ,CAJA_EDI=?CAJA_EDI '
      '  ,TIPO_LINEA_KRI=?TIPO_LINEA_KRI '
      '  ,ORDEN=?ORDEN '
      '  ,ORIGEN=?ORIGEN '
      '  ,ID_P=?ID_P '
      '  ,PROYECTO=?PROYECTO '
      '  ,ID_UBICACION=?ID_UBICACION '
      '  ,ID_A_UBICACION=?ID_A_UBICACION '
      '  ,ID_LOTE=?ID_LOTE '
      '  ,ID_IMAGEN=?ID_IMAGEN '
      '  ,UNIDADES_ROTAS=?UNIDADES_ROTAS '
      '  ,RIG=?RIG '
      '  ,LINEA=?LINEA '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,DESCUENTO_2=?DESCUENTO_2 '
      '  ,DESCUENTO_3=?DESCUENTO_3 '
      '  ,COMISION=?COMISION '
      '  ,M_MOV_STOCK=?M_MOV_STOCK '
      '  ,P_IVA=?P_IVA '
      '  ,P_RECARGO=?P_RECARGO '
      '  ,ENTRADA=?ENTRADA '
      '  ,ID_A=?ID_A '
      '  ,ID_C_A=?ID_C_A '
      '  ,P_IMPUESTO_ADICIONAL=?P_IMPUESTO_ADICIONAL '
      '  ,LINEA_SERVIDA=?LINEA_SERVIDA '
      '  ,TITULO_IDIOMA=?TITULO_IDIOMA '
      '  ,PROC_PROMOCION=?PROC_PROMOCION '
      '  ,APLICA_UNIDADES_SECUNDARIAS=?APLICA_UNIDADES_SECUNDARIAS '
      '  ,LINEA_RELACION=?LINEA_RELACION '
      '  ,COMPOSICION=?COMPOSICION '
      '  ,LOTE=?LOTE '
      '  ,LOTE_SIMPLE=?LOTE_SIMPLE '
      '  ,DIRECCION_ENTREGA=?DIRECCION_ENTREGA '
      '  ,LOTEABLE=?LOTEABLE '
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
      '  ,EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,TITULO=?TITULO '
      '  ,PIEZAS_X_BULTO=?PIEZAS_X_BULTO '
      '  ,BULTOS=?BULTOS '
      '  ,TIPO_IVA=?TIPO_IVA '
      '  ,TIPO_IMPUESTO_ADICIONAL=?TIPO_IMPUESTO_ADICIONAL '
      '  ,TIPO_CAJA_EDI=?TIPO_CAJA_EDI '
      '  ,TIPO_LINEA=?TIPO_LINEA '
      '  ,CRC_NOTAS=?CRC_NOTAS '
      '  ,CRC_NOTAS2=?CRC_NOTAS2 '
      '  ,PRO_NUM_PLANO=?PRO_NUM_PLANO '
      '  ,TIPO_UNIDAD_LOGISTICA=?TIPO_UNIDAD_LOGISTICA '
      '  ,TITULO_UNIDAD_LOGISTICA=?TITULO_UNIDAD_LOGISTICA '
      '  ,ALMACEN_UB=?ALMACEN_UB '
      '  ,CALLE=?CALLE '
      '  ,ESTANTERIA=?ESTANTERIA '
      '  ,REPISA=?REPISA '
      '  ,POSICION=?POSICION '
      '  ,PAIS=?PAIS '
      '  ,TIPO=?TIPO '
      '  ,ALMACEN=?ALMACEN '
      '  ,ARTICULO=?ARTICULO '
      '  ,NSERIE=?NSERIE '
      '  ,NO_FABRICACION_KRI=?NO_FABRICACION_KRI '
      '  ,PESO=?PESO '
      '  ,PESO_TOTAL=?PESO_TOTAL '
      '  ,PESO_REAL=?PESO_REAL '
      '  ,DECIMALES_UNIDADES=?DECIMALES_UNIDADES '
      '  ,SIGNO_UNIDADES=?SIGNO_UNIDADES '
      'WHERE'
      '  ID_DETALLES_S=?ID_DETALLES_S AND '
      '  ID_S=?ID_S ')
    ClavesPrimarias.Strings = (
      'ID_DETALLES_S '
      'ID_S ')
    TableName = 'VER_DETALLE_ALBARAN_ALQ'
    object QMDetalleUNIDADES_ROTAS: TIntegerField [99]
      DisplayLabel = 'Uds. Rotas'
      FieldName = 'UNIDADES_ROTAS'
    end
  end
  inherited QMCabecera: TFIBTableSet
    DeleteSQL.Strings = (
      'DELETE FROM VER_CABECERAS_ALBARAN_ALQ'
      'WHERE'
      '  ID_S=?old_ID_S ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CABECERAS_ALBARAN_ALQ'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,ALMACEN,MONEDA,FECHA,T' +
        'ERCERO,TITULO,DIRECCION,CLIENTE,CONTACTO,SU_REFERENCIA,FORMA_PAG' +
        'O,CAMPANYA,NOTAS,ESTADO,BULTOS,LINEAS,BRUTO,I_DTO_LINEAS,S_BASES' +
        ',M_BRUTO,C_TOTAL,AGENTE,S_CUOTA_IVA,S_CUOTA_RE,B_DTO_LINEAS,DTO_' +
        'PP,DTO_CIAL,I_DTO_CIAL,I_DTO_PP,B_COMISION,I_COMISION,POR_FINANC' +
        'IACION,I_FINANCIACION,LIQUIDO,ENTRADA,TRANSPORTISTA,I_BASE_RETEN' +
        'CION,P_RETENCION,I_RETENCION,TIPO_IRPF,A_IRPF,TOTAL_A_COBRAR,NOM' +
        'BRE_COMERCIAL,PORTES,TARIFA,ID_S,BULTOS_KRI,GARANTIA,AGRUPACION_' +
        'KRI,ALMACEN_DEPOSITO,NUM_MOV_DEPOSITO,DEPOSITO,DEVOLUCION_DEPOSI' +
        'TO,IDIOMA,TIPO_PORTES,POR_PORTES,I_PORTES,I_PORTES_CANAL,RANGO,I' +
        'NDICE,CAMBIO_FIJO,VALOR_CAMB_FIJO,PROYECTO,NOTAS_INTERNAS_KRI,TI' +
        'PO_LINEA_KRI,MODIFICA_DOC,ALBARAN_VALORADO,SERIE_ROTURAS,ID_S_FA' +
        'C_ROTURAS,ID_S_FAC_ALQUILER,ID_ST_DEVOLUCION,BANCO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ALMACEN,?MONEDA' +
        ',?FECHA,?TERCERO,?TITULO,?DIRECCION,?CLIENTE,?CONTACTO,?SU_REFER' +
        'ENCIA,?FORMA_PAGO,?CAMPANYA,?NOTAS,?ESTADO,?BULTOS,?LINEAS,?BRUT' +
        'O,?I_DTO_LINEAS,?S_BASES,?M_BRUTO,?C_TOTAL,?AGENTE,?S_CUOTA_IVA,' +
        '?S_CUOTA_RE,?B_DTO_LINEAS,?DTO_PP,?DTO_CIAL,?I_DTO_CIAL,?I_DTO_P' +
        'P,?B_COMISION,?I_COMISION,?POR_FINANCIACION,?I_FINANCIACION,?LIQ' +
        'UIDO,?ENTRADA,?TRANSPORTISTA,?I_BASE_RETENCION,?P_RETENCION,?I_R' +
        'ETENCION,?TIPO_IRPF,?A_IRPF,?TOTAL_A_COBRAR,?NOMBRE_COMERCIAL,?P' +
        'ORTES,?TARIFA,?ID_S,?BULTOS_KRI,?GARANTIA,?AGRUPACION_KRI,?ALMAC' +
        'EN_DEPOSITO,?NUM_MOV_DEPOSITO,?DEPOSITO,?DEVOLUCION_DEPOSITO,?ID' +
        'IOMA,?TIPO_PORTES,?POR_PORTES,?I_PORTES,?I_PORTES_CANAL,?RANGO,?' +
        'INDICE,?CAMBIO_FIJO,?VALOR_CAMB_FIJO,?PROYECTO,?NOTAS_INTERNAS_K' +
        'RI,?TIPO_LINEA_KRI,?MODIFICA_DOC,?ALBARAN_VALORADO,?SERIE_ROTURA' +
        'S,?ID_S_FAC_ROTURAS,?ID_S_FAC_ALQUILER,?ID_ST_DEVOLUCION,?BANCO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_ALBARAN_ALQ'
      'WHERE'
      '  ID_S=?ID_S ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_ALBARAN_ALQ'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'CANAL=?CANAL AND'
      'SERIE=?SERIE AND'
      'TIPO='#39'ALB'#39
      
        'AND (EJERCICIO=?EJERCICIO OR ((EJERCICIO < ?EJERCICIO) AND ((EST' +
        'ADO = 0) OR (ESTADO = 3))))'
      'ORDER BY EJERCICIO, RIG')
    UpdateSQL.Strings = (
      'UPDATE VER_CABECERAS_ALBARAN_ALQ'
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
      '  ,CLIENTE=?CLIENTE '
      '  ,CONTACTO=?CONTACTO '
      '  ,SU_REFERENCIA=?SU_REFERENCIA '
      '  ,FORMA_PAGO=?FORMA_PAGO '
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
      '  ,SERIE_ROTURAS=?SERIE_ROTURAS '
      '  ,ID_S_FAC_ROTURAS=?ID_S_FAC_ROTURAS '
      '  ,ID_S_FAC_ALQUILER=?ID_S_FAC_ALQUILER '
      '  ,ID_ST_DEVOLUCION=?ID_ST_DEVOLUCION '
      '  ,BANCO=?BANCO'
      'WHERE'
      '  ID_S=?ID_S ')
    TableName = 'VER_CABECERAS_ALBARAN_ALQ'
    object QMCabeceraSERIE_ROTURAS: TFIBStringField
      DisplayLabel = 'Serie Roturas'
      FieldName = 'SERIE_ROTURAS'
      Size = 10
    end
    object QMCabeceraID_S_FAC_ROTURAS: TIntegerField
      DisplayLabel = 'Id Fac. Roturas'
      FieldName = 'ID_S_FAC_ROTURAS'
    end
    object QMCabeceraID_S_FAC_ALQUILER: TIntegerField
      DisplayLabel = 'Id Fac. Alquiler'
      FieldName = 'ID_S_FAC_ALQUILER'
    end
    object QMCabeceraID_ST_DEVOLUCION: TIntegerField
      DisplayLabel = 'Id Mov. Devolucion'
      FieldName = 'ID_ST_DEVOLUCION'
    end
  end
  inherited xInfoActualizada: TFIBDataSet
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
      '                     C.CLIENTE = A.CLIENTE), 0) RIESGO_PED,'
      '           --'
      '           COALESCE((SELECT SERIE || '#39'/'#39' || RIG'
      '                     FROM GES_CABECERAS_S'
      '                     WHERE'
      
        '                     ID_S = A.ID_S_FAC_ALQUILER), '#39#39') FAC_ALQUIL' +
        'ER, --'
      '           COALESCE((SELECT SERIE || '#39'/'#39' || RIG'
      '                     FROM GES_CABECERAS_S'
      '                     WHERE'
      
        '                     ID_S = A.ID_S_FAC_ROTURAS), '#39#39') FAC_ROTURAS' +
        ', --'
      '           COALESCE((SELECT SERIE || '#39'/'#39' || RIG'
      '                     FROM GES_CABECERAS_ST'
      '                     WHERE'
      
        '                     ID_ST = A.ID_ST_DEVOLUCION), '#39#39') MOV_DEVOLU' +
        'CION'
      '    FROM VER_CABECERAS_ALBARAN_ALQ A'
      
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
    object xInfoActualizadaFAC_ALQUILER: TFIBStringField
      DisplayLabel = 'Fac. Alquiler'
      FieldName = 'FAC_ALQUILER'
      Size = 22
    end
    object xInfoActualizadaFAC_ROTURAS: TFIBStringField
      DisplayLabel = 'Fac. Roturas'
      FieldName = 'FAC_ROTURAS'
      Size = 22
    end
    object xInfoActualizadaMOV_DEVOLUCION: TFIBStringField
      DisplayLabel = 'Mov. Devolucion'
      FieldName = 'MOV_DEVOLUCION'
      Size = 22
    end
  end
end
