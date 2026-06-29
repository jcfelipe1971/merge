inherited DMPedidosAlquiler: TDMPedidosAlquiler
  OldCreateOrder = True
  inherited QMDetalle: TFIBTableSet
    object QMDetalleSTOCK_FUTURO: TFloatField [97]
      FieldKind = fkCalculated
      FieldName = 'STOCK_FUTURO'
      Calculated = True
    end
  end
  inherited QMCabecera: TFIBTableSet
    DeleteSQL.Strings = (
      'DELETE FROM VER_CABECERAS_PEDIDO_ALQ'
      'WHERE'
      '  ID_S=?old_ID_S ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CABECERAS_PEDIDO_ALQ'
      
        '  (SERIE,FECHA,NOTAS,BRUTO,I_DTO_LINEAS,S_BASES,M_BRUTO,C_TOTAL,' +
        'S_CUOTA_IVA,S_CUOTA_RE,B_DTO_LINEAS,I_DTO_CIAL,I_DTO_PP,B_COMISI' +
        'ON,I_COMISION,I_FINANCIACION,FECHA_ENTREGA_PREV,FECHA_REC_CAB,PO' +
        'R_PORTES,I_PORTES,I_PORTES_CANAL,VALOR_CAMB_FIJO,NOTAS_INTERNAS_' +
        'KRI,FECHA_CLIENTE,FECHA_CREACION_KRI,DIRECCION_EVENTO,FECHA_EVEN' +
        'TO,FECHA_ENTREGA,FECHA_RECOGIDA,DIAS,RIG,TERCERO,CLIENTE,CONTACT' +
        'O,CAMPANYA,LINEAS,AGENTE,DTO_PP,DTO_CIAL,POR_FINANCIACION,ENTRAD' +
        'A,AGRUPACION_KRI,ID_S,MARGEN_KRI,PROYECTO,TIPO_LINEA_KRI,RANGO,I' +
        'NDICE,TRANSPORTISTA,MODIFICA_DOC,Z_COD_BARRAS_PED,EMPLEADO_RESPO' +
        'NSABLE,EMPLEADO_ATENCION,EMPRESA,EJERCICIO,CANAL,TITULO,DIRECCIO' +
        'N,SU_REFERENCIA,BANCO,ESTADO,BULTOS,SERVIDO,NOMBRE_COMERCIAL,POR' +
        'TES,USUARIO,TIPO_PORTES,CAMBIO_FIJO,PEDIDO_CLIENTE,Z_CONTACTO,LIS' +
        'TO_PARA_PREPARAR,PEDIDO_VALORADO,RECEPTOR,DOCUMENTO_MUESTRAS,INV' +
        'ERSION_SUJETO_PASIVO,TIPO,ALMACEN,MONEDA,FORMA_PAGO,TARIFA,IDIOM' +
        'A,LOCALIDAD,Z_OBSERVACION,ASEGURADO,PACIENTE,AUTORIZACION,POLIZA' +
        ',FEC_REC_IH)'
      'VALUES'
      
        '  (?SERIE,?FECHA,?NOTAS,?BRUTO,?I_DTO_LINEAS,?S_BASES,?M_BRUTO,?' +
        'C_TOTAL,?S_CUOTA_IVA,?S_CUOTA_RE,?B_DTO_LINEAS,?I_DTO_CIAL,?I_DT' +
        'O_PP,?B_COMISION,?I_COMISION,?I_FINANCIACION,?FECHA_ENTREGA_PREV' +
        ',?FECHA_REC_CAB,?POR_PORTES,?I_PORTES,?I_PORTES_CANAL,?VALOR_CAM' +
        'B_FIJO,?NOTAS_INTERNAS_KRI,?FECHA_CLIENTE,?FECHA_CREACION_KRI,?D' +
        'IRECCION_EVENTO,?FECHA_EVENTO,?FECHA_ENTREGA,?FECHA_RECOGIDA,?DI' +
        'AS,?RIG,?TERCERO,?CLIENTE,?CONTACTO,?CAMPANYA,?LINEAS,?AGENTE,?D' +
        'TO_PP,?DTO_CIAL,?POR_FINANCIACION,?ENTRADA,?AGRUPACION_KRI,?ID_S' +
        ',?MARGEN_KRI,?PROYECTO,?TIPO_LINEA_KRI,?RANGO,?INDICE,?TRANSPORT' +
        'ISTA,?MODIFICA_DOC,?Z_COD_BARRAS_PED,?EMPLEADO_RESPONSABLE,?EMPL' +
        'EADO_ATENCION,?EMPRESA,?EJERCICIO,?CANAL,?TITULO,?DIRECCION,?SU_' +
        'REFERENCIA,?BANCO,?ESTADO,?BULTOS,?SERVIDO,?NOMBRE_COMERCIAL,?PO' +
        'RTES,?USUARIO,?TIPO_PORTES,?CAMBIO_FIJO,?PEDIDO_CLIENTE,?Z_CONTAC' +
        'TO,?LISTO_PARA_PREPARAR,?PEDIDO_VALORADO,?RECEPTOR,?DOCUMENTO_MU' +
        'ESTRAS,?INVERSION_SUJETO_PASIVO,?TIPO,?ALMACEN,?MONEDA,?FORMA_PA' +
        'GO,?TARIFA,?IDIOMA,?LOCALIDAD,?Z_OBSERVACION,?ASEGURADO,?PACIENT' +
        'E,?AUTORIZACION,?POLIZA,?FEC_REC_IH)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_PEDIDO_ALQ'
      'WHERE'
      '  ID_S=?ID_S ')
    SelectSQL.Strings = (
      '/* Se establece en el OnCreate */'
      'SELECT * FROM VER_CABECERAS_PEDIDO_ALQ'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'CANAL=?CANAL AND'
      'SERIE=?SERIE AND'
      'TIPO='#39'PEC'#39
      
        'AND (EJERCICIO=?EJERCICIO OR ((EJERCICIO < ?EJERCICIO) AND (ESTA' +
        'DO = 0 OR ESTADO=3))) '
      'ORDER BY EJERCICIO, RIG')
    UpdateSQL.Strings = (
      'UPDATE VER_CABECERAS_PEDIDO_ALQ'
      'SET'
      '  SERIE=?SERIE '
      '  ,FECHA=?FECHA '
      '  ,NOTAS=?NOTAS '
      '  ,BRUTO=?BRUTO '
      '  ,I_DTO_LINEAS=?I_DTO_LINEAS '
      '  ,S_BASES=?S_BASES '
      '  ,M_BRUTO=?M_BRUTO '
      '  ,C_TOTAL=?C_TOTAL '
      '  ,S_CUOTA_IVA=?S_CUOTA_IVA '
      '  ,S_CUOTA_RE=?S_CUOTA_RE '
      '  ,B_DTO_LINEAS=?B_DTO_LINEAS '
      '  ,I_DTO_CIAL=?I_DTO_CIAL '
      '  ,I_DTO_PP=?I_DTO_PP '
      '  ,B_COMISION=?B_COMISION '
      '  ,I_COMISION=?I_COMISION '
      '  ,I_FINANCIACION=?I_FINANCIACION '
      '  ,FECHA_ENTREGA_PREV=?FECHA_ENTREGA_PREV '
      '  ,FECHA_REC_CAB=?FECHA_REC_CAB '
      '  ,POR_PORTES=?POR_PORTES '
      '  ,I_PORTES=?I_PORTES '
      '  ,I_PORTES_CANAL=?I_PORTES_CANAL '
      '  ,VALOR_CAMB_FIJO=?VALOR_CAMB_FIJO '
      '  ,NOTAS_INTERNAS_KRI=?NOTAS_INTERNAS_KRI '
      '  ,FECHA_CLIENTE=?FECHA_CLIENTE '
      '  ,FECHA_CREACION_KRI=?FECHA_CREACION_KRI '
      '  ,DIRECCION_EVENTO=?DIRECCION_EVENTO '
      '  ,FECHA_EVENTO=?FECHA_EVENTO '
      '  ,FECHA_ENTREGA=?FECHA_ENTREGA '
      '  ,FECHA_RECOGIDA=?FECHA_RECOGIDA '
      '  ,DIAS=?DIAS '
      '  ,RIG=?RIG '
      '  ,TERCERO=?TERCERO '
      '  ,CLIENTE=?CLIENTE '
      '  ,CONTACTO=?CONTACTO '
      '  ,CAMPANYA=?CAMPANYA '
      '  ,LINEAS=?LINEAS '
      '  ,AGENTE=?AGENTE '
      '  ,DTO_PP=?DTO_PP '
      '  ,DTO_CIAL=?DTO_CIAL '
      '  ,POR_FINANCIACION=?POR_FINANCIACION '
      '  ,ENTRADA=?ENTRADA '
      '  ,AGRUPACION_KRI=?AGRUPACION_KRI '
      '  ,MARGEN_KRI=?MARGEN_KRI '
      '  ,PROYECTO=?PROYECTO '
      '  ,TIPO_LINEA_KRI=?TIPO_LINEA_KRI '
      '  ,RANGO=?RANGO '
      '  ,INDICE=?INDICE '
      '  ,TRANSPORTISTA=?TRANSPORTISTA '
      '  ,MODIFICA_DOC=?MODIFICA_DOC '
      '  ,Z_COD_BARRAS_PED=?Z_COD_BARRAS_PED '
      '  ,EMPLEADO_RESPONSABLE=?EMPLEADO_RESPONSABLE '
      '  ,EMPLEADO_ATENCION=?EMPLEADO_ATENCION '
      '  ,EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,TITULO=?TITULO '
      '  ,DIRECCION=?DIRECCION '
      '  ,SU_REFERENCIA=?SU_REFERENCIA '
      '  ,BANCO=?BANCO '
      '  ,ESTADO=?ESTADO '
      '  ,BULTOS=?BULTOS '
      '  ,SERVIDO=?SERVIDO '
      '  ,NOMBRE_COMERCIAL=?NOMBRE_COMERCIAL '
      '  ,PORTES=?PORTES '
      '  ,USUARIO=?USUARIO '
      '  ,TIPO_PORTES=?TIPO_PORTES '
      '  ,CAMBIO_FIJO=?CAMBIO_FIJO '
      '  ,PEDIDO_CLIENTE=?PEDIDO_CLIENTE '
      '  ,Z_CONTACTO=?Z_CONTACTO '
      '  ,LISTO_PARA_PREPARAR=?LISTO_PARA_PREPARAR '
      '  ,PEDIDO_VALORADO=?PEDIDO_VALORADO '
      '  ,RECEPTOR=?RECEPTOR '
      '  ,DOCUMENTO_MUESTRAS=?DOCUMENTO_MUESTRAS '
      '  ,INVERSION_SUJETO_PASIVO=?INVERSION_SUJETO_PASIVO '
      '  ,TIPO=?TIPO '
      '  ,ALMACEN=?ALMACEN '
      '  ,MONEDA=?MONEDA '
      '  ,FORMA_PAGO=?FORMA_PAGO '
      '  ,TARIFA=?TARIFA '
      '  ,IDIOMA=?IDIOMA '
      '  ,LOCALIDAD=?LOCALIDAD '
      '  ,Z_OBSERVACION=?Z_OBSERVACION '
      '  ,ASEGURADO=?ASEGURADO '
      '  ,PACIENTE=?PACIENTE '
      '  ,AUTORIZACION=?AUTORIZACION '
      '  ,POLIZA=?POLIZA '
      '  ,FEC_REC_IH=?FEC_REC_IH '
      'WHERE'
      '  ID_S=?ID_S ')
    TableName = 'VER_CABECERAS_PEDIDO_ALQ'
    object QMCabeceraDIRECCION_EVENTO: TBlobField [70]
      FieldName = 'DIRECCION_EVENTO'
      Size = 8
    end
    object QMCabeceraRECEPTOR: TFIBStringField [71]
      DisplayLabel = 'Receptor'
      FieldName = 'RECEPTOR'
      Size = 40
    end
    object QMCabeceraFECHA_EVENTO: TDateTimeField [72]
      DisplayLabel = 'Fec. Evento'
      FieldName = 'FECHA_EVENTO'
    end
    object QMCabeceraFECHA_ENTREGA: TDateTimeField [73]
      DisplayLabel = 'Fec. Entrega'
      FieldName = 'FECHA_ENTREGA'
    end
    object QMCabeceraFECHA_RECOGIDA: TDateTimeField [74]
      DisplayLabel = 'Fec. Recogida'
      FieldName = 'FECHA_RECOGIDA'
    end
    object QMCabeceraDIAS: TFloatField [75]
      DisplayLabel = 'Dias'
      FieldName = 'DIAS'
    end
  end
  inherited xInfoActualizada: TFIBDataSet
    object xInfoActualizadaTOTAL_ANTICIPOS: TFloatField
      FieldKind = fkCalculated
      FieldName = 'TOTAL_ANTICIPOS'
      OnGetText = xInfoActualizadaTOTAL_ANTICIPOSGetText
      Calculated = True
    end
  end
  object xAnticiposAlquiler: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT A.ID_S, A.ID_CARTERA, C.REGISTRO, C.FECHA_REGISTRO, C.LIQ' +
        'UIDO, C.MONEDA, C.PAGADO'
      'FROM GES_CABECERAS_S_CAR A'
      'JOIN EMP_CARTERA C ON C.ID_CARTERA = A.ID_CARTERA'
      'WHERE'
      'A.ID_S = :ID_S'
      'ORDER BY C.FECHA_REGISTRO DESC')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 248
    Top = 440
    object xAnticiposAlquilerID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object xAnticiposAlquilerID_CARTERA: TIntegerField
      DisplayLabel = 'Id Cartera'
      FieldName = 'ID_CARTERA'
    end
    object xAnticiposAlquilerREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xAnticiposAlquilerFECHA_REGISTRO: TDateTimeField
      DisplayLabel = 'Fec. Registro'
      FieldName = 'FECHA_REGISTRO'
    end
    object xAnticiposAlquilerLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xAnticiposAlquilerMONEDA: TFIBStringField
      DisplayLabel = 'Mon.'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xAnticiposAlquilerPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
  end
  object DSxAnticiposAlquiler: TDataSource
    DataSet = xAnticiposAlquiler
    Left = 352
    Top = 440
  end
end
