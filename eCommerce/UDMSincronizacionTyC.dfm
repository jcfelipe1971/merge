object DMSincronizacionTyC: TDMSincronizacionTyC
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 545
  Top = 103
  Height = 295
  Width = 367
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM API_PEDIDOS_TOLDOS_CAB'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO API_PEDIDOS_TOLDOS_CAB'
      
        '  (EMPRESA,'#13#10'ID,REFERENCE,DELIVERY_DATE,CLIENTE,DIRECCION,TOTAL_' +
        'AMOUNT,MARGIN,INSTALLATION_AMOUNT,SHIPPING_AMOUNT,SALES_BUDGET,'#13 +
        #10'SALES_BUDGET_PLUS_TAXES,OBSERVATIONS,RAW_JSON,DATE_ADD,DATE_UPD' +
        ',ID_S)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?ID,?REFERENCE,?DELIVERY_DATE,?CLIENTE,?DIRECCION,' +
        '?TOTAL_AMOUNT,?MARGIN,?INSTALLATION_AMOUNT,?SHIPPING_AMOUNT,?SAL' +
        'ES_BUDGET,'#13#10'?SALES_BUDGET_PLUS_TAXES,?OBSERVATIONS,?RAW_JSON,?DA' +
        'TE_ADD,?DATE_UPD,?ID_S)')
    RefreshSQL.Strings = (
      
        'SELECT T.TERCERO, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, D.DIR_C' +
        'OMPLETA_N, A.*,'
      '       CASE'
      '         WHEN ID_S = 0 THEN'
      '             '#39#39
      
        '         ELSE (SELECT TIPO || '#39' '#39' || EJERCICIO || '#39'-'#39' || SERIE |' +
        '| '#39'/'#39' || RIG'
      '               FROM GES_CABECERAS_S'
      '               WHERE'
      '               ID_S = A.ID_S)'
      '       END DOCUMENTO'
      'FROM API_PEDIDOS_TOLDOS_CAB A'
      
        'LEFT JOIN EMP_CLIENTES C ON A.EMPRESA = C.EMPRESA AND A.CLIENTE ' +
        '= C.CLIENTE'
      'LEFT JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO'
      
        'LEFT JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO AN' +
        'D A.DIRECCION = D.DIRECCION'
      'WHERE'
      'A.EMPRESA = :EMPRESA AND '
      'A.ID = :ID ')
    SelectSQL.Strings = (
      
        'SELECT T.TERCERO, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, D.DIR_C' +
        'OMPLETA_N, A.*,'
      '       CASE'
      '         WHEN ID_S = 0 THEN'
      '             '#39#39
      
        '         ELSE (SELECT TIPO || '#39' '#39' || EJERCICIO || '#39'-'#39' || SERIE |' +
        '| '#39'/'#39' || RIG'
      '               FROM GES_CABECERAS_S'
      '               WHERE'
      '               ID_S = A.ID_S)'
      '       END DOCUMENTO'
      'FROM API_PEDIDOS_TOLDOS_CAB A'
      
        'LEFT JOIN EMP_CLIENTES C ON A.EMPRESA = C.EMPRESA AND A.CLIENTE ' +
        '= C.CLIENTE'
      'LEFT JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO'
      
        'LEFT JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO AN' +
        'D A.DIRECCION = D.DIRECCION'
      'WHERE'
      'A.EMPRESA = :EMPRESA'
      'ORDER BY A.DATE_ADD')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE API_PEDIDOS_TOLDOS_CAB'
      'SET'
      '  REFERENCE=?REFERENCE '
      '  ,DELIVERY_DATE=?DELIVERY_DATE '
      '  ,CLIENTE=?CLIENTE '
      '  ,DIRECCION=?DIRECCION '
      '  ,TOTAL_AMOUNT=?TOTAL_AMOUNT '
      '  ,MARGIN=?MARGIN '
      '  ,INSTALLATION_AMOUNT=?INSTALLATION_AMOUNT '
      '  ,SHIPPING_AMOUNT=?SHIPPING_AMOUNT '
      '  ,SALES_BUDGET=?SALES_BUDGET '
      '  ,SALES_BUDGET_PLUS_TAXES=?SALES_BUDGET_PLUS_TAXES '
      '  ,OBSERVATIONS=?OBSERVATIONS '
      '  ,RAW_JSON=?RAW_JSON '
      '  ,DATE_ADD=?DATE_ADD '
      '  ,DATE_UPD=?DATE_UPD '
      '  ,ID_S=?ID_S '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ID=?ID ')
    AutoCalcFields = False
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    AccionesInhibidas = []
    Opciones = [DesactivarControlesAlOrdenar, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'API_PEDIDOS_TOLDOS_CAB'
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
    object QMCabeceraID: TFIBStringField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Size = 40
    end
    object QMCabeceraREFERENCE: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCE'
      Size = 40
    end
    object QMCabeceraDELIVERY_DATE: TDateTimeField
      DisplayLabel = 'Fec. Entrega'
      FieldName = 'DELIVERY_DATE'
    end
    object QMCabeceraCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCabeceraDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object QMCabeceraTOTAL_AMOUNT: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL_AMOUNT'
    end
    object QMCabeceraMARGIN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGIN'
    end
    object QMCabeceraINSTALLATION_AMOUNT: TFloatField
      DisplayLabel = 'Total Inst.'
      FieldName = 'INSTALLATION_AMOUNT'
    end
    object QMCabeceraSHIPPING_AMOUNT: TFloatField
      DisplayLabel = 'Total Porte'
      FieldName = 'SHIPPING_AMOUNT'
    end
    object QMCabeceraSALES_BUDGET: TFloatField
      DisplayLabel = 'Prevision Venta'
      FieldName = 'SALES_BUDGET'
    end
    object QMCabeceraSALES_BUDGET_PLUS_TAXES: TFloatField
      DisplayLabel = 'Prev. Vente IVA'
      FieldName = 'SALES_BUDGET_PLUS_TAXES'
    end
    object QMCabeceraOBSERVATIONS: TMemoField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVATIONS'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabeceraRAW_JSON: TMemoField
      FieldName = 'RAW_JSON'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabeceraDATE_ADD: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'DATE_ADD'
    end
    object QMCabeceraDATE_UPD: TDateTimeField
      DisplayLabel = 'Fec. Modif.'
      FieldName = 'DATE_UPD'
    end
    object QMCabeceraID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object QMCabeceraTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMCabeceraNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Razon Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMCabeceraNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMCabeceraDIR_COMPLETA_N: TFIBStringField
      DisplayLabel = 'Dir. Completa'
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
    object QMCabeceraDOCUMENTO: TFIBStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 33
    end
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM API_PEDIDOS_TOLDOS_DET'
      'WHERE'
      '  ID_CAB=?old_ID_CAB AND '
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO API_PEDIDOS_TOLDOS_DET'
      
        '  (ID,'#13#10'ID_CAB,ARTICULO,UNITS,RATE_BEFORE_DISCOUNT,DTO1,DTO2,DTO' +
        '3,TOTAL,ES_TOLDO,ACC_AUTO_LADO,'#13#10'ACC_AUTO_LONG_MANIVELA,ACC_AUTO' +
        '_TIPO,ACC_OP_BRAZOS_LUZ_LED,ACC_OP_ESCUADRA_A_TECHO,ACC_OP_ESCUA' +
        'DRA_A_TECHO_UDS,ACC_OP_ESCUADRA_SOPORTE_A_TECHO,ACC_OP_JUEGO_SOP' +
        'ORTES_TECHO,ACC_OP_JUEGO_SOPORTES_TECHO_TIP,ACC_OP_LASTRE_HORMIG' +
        'O_MACETERO_,ACC_OP_LUZ_LED_BARRA_DE_CARGA,'#13#10'ACC_OP_LUZ_LED_PERFI' +
        'L_COFRE,ACC_OP_MACETERO_GEMINI_POT,ACC_OP_PAREJA_PUNTALES_TELESC' +
        'OP,ACC_OP_PL_AJ_SOPORTE_BRAZO,ACC_OP_PL_AJ_SOPORTE_BRAZO_UDS,ACC' +
        '_OP_PL_AJ_SOPORTE_CENTRAL,ACC_OP_PLACA_PATAS_FIJAS_MACETE,ACC_OP' +
        '_RUEDA_GIRATORIA_MACETERO,ACC_OP_SOPORTE_ENTREPAREDES,ACC_OP_SOP' +
        'ORTE_ENTREPAREDES_UDS,'#13#10'ACC_OP_SOPORTE_LARGO,ACC_OP_SOPORTE_LARG' +
        'O_UDS,ACC_OP_TEJADILLO,ACC_OP_TEJADILLO_JUEGO_TAPAS,ACC_OP_TEJAD' +
        'ILLO_N_LAMAS,ACC_OP_VIGAS_PIES_100_100,COLOR_ESTRUCTURA_COLOR,IN' +
        'STALACION_TIPO,MEDIDAS_ALTURA_DELANTERA,MEDIDAS_ALTURA_PIES,'#13#10'ME' +
        'DIDAS_ALTURA_PORTERIA,MEDIDAS_ALTURA_PORTERIA_2,MEDIDAS_ALTURA_T' +
        'RASERA,MEDIDAS_CAIDA,MEDIDAS_LINEA,MEDIDAS_SALIDA,MEDIDAS_UDS,OP' +
        '_ESTRUCTURA_DOBLE_TIRO,OP_ESTRUCTURA_GUIA_120_120,OP_ESTRUCTURA_' +
        'GUIA_ADICIONAL,'#13#10'OP_ESTRUCTURA_N_LATERALES,OP_ESTRUCTURA_PERIMET' +
        'RAL,OP_ESTRUCTURA_PILAR_AD_BASE,OP_ESTRUCTURA_PILAR_AD_BASE_UDS,' +
        'OP_ESTRUCTURA_POLEA_TIRO_CUERDA,OP_ESTRUCTURA_SUPLEMENTO_TAPA,OP' +
        '_ESTRUCTURA_TEJ_MOD,OP_ESTRUCTURA_TEJ_MOD_N_LAMAS,OP_ESTRUCTURA_' +
        'TEJ_MO_SOPORTE,OP_ESTRUCTURA_TEJ_MOD_TAPA,'#13#10'OP_ESTRUCTURA_TEJAD_' +
        'MOD_UDS,TEJIDO_ALTURA,TEJIDO_BAMBALINA,TEJIDO_LONA,TEJIDO_ONDA,T' +
        'EJIDO_RIBETE,DATE_ADD,DATE_UPD,ID_DETALLES_S,ID_DESPIECE_CAB,'#13#10'C' +
        'REATED,MEDIDA_1,MEDIDA_2,MEDIDA_3,MEDIDA_4,COLOR,COLOCACION,LONA' +
        ',MONTAJE,ES_MOTOR,'#13#10'MOTOR,MANIVELA)'
      'VALUES'
      
        '  (?ID,'#13#10'?ID_CAB,?ARTICULO,?UNITS,?RATE_BEFORE_DISCOUNT,?DTO1,?D' +
        'TO2,?DTO3,?TOTAL,?ES_TOLDO,?ACC_AUTO_LADO,'#13#10'?ACC_AUTO_LONG_MANIV' +
        'ELA,?ACC_AUTO_TIPO,?ACC_OP_BRAZOS_LUZ_LED,?ACC_OP_ESCUADRA_A_TEC' +
        'HO,?ACC_OP_ESCUADRA_A_TECHO_UDS,?ACC_OP_ESCUADRA_SOPORTE_A_TECHO' +
        ',?ACC_OP_JUEGO_SOPORTES_TECHO,?ACC_OP_JUEGO_SOPORTES_TECHO_TIP,?' +
        'ACC_OP_LASTRE_HORMIGO_MACETERO_,?ACC_OP_LUZ_LED_BARRA_DE_CARGA,'#13 +
        #10'?ACC_OP_LUZ_LED_PERFIL_COFRE,?ACC_OP_MACETERO_GEMINI_POT,?ACC_O' +
        'P_PAREJA_PUNTALES_TELESCOP,?ACC_OP_PL_AJ_SOPORTE_BRAZO,?ACC_OP_P' +
        'L_AJ_SOPORTE_BRAZO_UDS,?ACC_OP_PL_AJ_SOPORTE_CENTRAL,?ACC_OP_PLA' +
        'CA_PATAS_FIJAS_MACETE,?ACC_OP_RUEDA_GIRATORIA_MACETERO,?ACC_OP_S' +
        'OPORTE_ENTREPAREDES,?ACC_OP_SOPORTE_ENTREPAREDES_UDS,'#13#10'?ACC_OP_S' +
        'OPORTE_LARGO,?ACC_OP_SOPORTE_LARGO_UDS,?ACC_OP_TEJADILLO,?ACC_OP' +
        '_TEJADILLO_JUEGO_TAPAS,?ACC_OP_TEJADILLO_N_LAMAS,?ACC_OP_VIGAS_P' +
        'IES_100_100,?COLOR_ESTRUCTURA_COLOR,?INSTALACION_TIPO,?MEDIDAS_A' +
        'LTURA_DELANTERA,?MEDIDAS_ALTURA_PIES,'#13#10'?MEDIDAS_ALTURA_PORTERIA,' +
        '?MEDIDAS_ALTURA_PORTERIA_2,?MEDIDAS_ALTURA_TRASERA,?MEDIDAS_CAID' +
        'A,?MEDIDAS_LINEA,?MEDIDAS_SALIDA,?MEDIDAS_UDS,?OP_ESTRUCTURA_DOB' +
        'LE_TIRO,?OP_ESTRUCTURA_GUIA_120_120,?OP_ESTRUCTURA_GUIA_ADICIONA' +
        'L,'#13#10'?OP_ESTRUCTURA_N_LATERALES,?OP_ESTRUCTURA_PERIMETRAL,?OP_EST' +
        'RUCTURA_PILAR_AD_BASE,?OP_ESTRUCTURA_PILAR_AD_BASE_UDS,?OP_ESTRU' +
        'CTURA_POLEA_TIRO_CUERDA,?OP_ESTRUCTURA_SUPLEMENTO_TAPA,?OP_ESTRU' +
        'CTURA_TEJ_MOD,?OP_ESTRUCTURA_TEJ_MOD_N_LAMAS,?OP_ESTRUCTURA_TEJ_' +
        'MO_SOPORTE,?OP_ESTRUCTURA_TEJ_MOD_TAPA,'#13#10'?OP_ESTRUCTURA_TEJAD_MO' +
        'D_UDS,?TEJIDO_ALTURA,?TEJIDO_BAMBALINA,?TEJIDO_LONA,?TEJIDO_ONDA' +
        ',?TEJIDO_RIBETE,?DATE_ADD,?DATE_UPD,?ID_DETALLES_S,?ID_DESPIECE_' +
        'CAB,'#13#10'?CREATED,?MEDIDA_1,?MEDIDA_2,?MEDIDA_3,?MEDIDA_4,?COLOR,?C' +
        'OLOCACION,?LONA,?MONTAJE,?ES_MOTOR,'#13#10'?MOTOR,?MANIVELA)')
    RefreshSQL.Strings = (
      'SELECT R.TITULO_LARGO, SM.CODIGO, SM.DESCRIPCION, A.*'
      'FROM API_PEDIDOS_TOLDOS_DET A'
      'JOIN API_PEDIDOS_TOLDOS_CAB C ON A.ID_CAB = C.ID'
      
        'LEFT JOIN ART_ARTICULOS R ON R.EMPRESA = C.EMPRESA AND R.ARTICUL' +
        'O = A.ARTICULO'
      'LEFT JOIN Z_ART_ARTICULOS_TOLDO T ON R.ID_A = T.ID_A'
      'LEFT JOIN Z_ART_ARTICULOS_ARMAZON AR ON T.ID_A_ARMAZON = AR.ID_A'
      
        'LEFT JOIN Z_SYS_MODELOS_DET M ON AR.MODELO = M.CODIGO AND AR.LIN' +
        'EA = M.LINEA AND AR.SALIDA = M.SALIDA'
      'LEFT JOIN Z_SYS_MODELOS SM ON M.CODIGO = SM.CODIGO'
      'WHERE'
      'A.ID_CAB = :ID_CAB AND '
      'A.ID = :ID '
      'ORDER BY A.ID')
    SelectSQL.Strings = (
      'SELECT R.TITULO_LARGO, SM.CODIGO, SM.DESCRIPCION, A.*'
      'FROM API_PEDIDOS_TOLDOS_DET A'
      'JOIN API_PEDIDOS_TOLDOS_CAB C ON A.ID_CAB = C.ID'
      
        'LEFT JOIN ART_ARTICULOS R ON R.EMPRESA = C.EMPRESA AND R.ARTICUL' +
        'O = A.ARTICULO'
      'LEFT JOIN Z_ART_ARTICULOS_TOLDO T ON R.ID_A = T.ID_A'
      'LEFT JOIN Z_ART_ARTICULOS_ARMAZON AR ON T.ID_A_ARMAZON = AR.ID_A'
      
        'LEFT JOIN Z_SYS_MODELOS_DET M ON AR.MODELO = M.CODIGO AND AR.LIN' +
        'EA = M.LINEA AND AR.SALIDA = M.SALIDA'
      'LEFT JOIN Z_SYS_MODELOS SM ON M.CODIGO = SM.CODIGO'
      'WHERE'
      'A.ID_CAB = :ID'
      'ORDER BY A.ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE API_PEDIDOS_TOLDOS_DET'
      'SET'
      '  ARTICULO=?ARTICULO '
      '  ,UNITS=?UNITS '
      '  ,RATE_BEFORE_DISCOUNT=?RATE_BEFORE_DISCOUNT '
      '  ,DTO1=?DTO1 '
      '  ,DTO2=?DTO2 '
      '  ,DTO3=?DTO3 '
      '  ,TOTAL=?TOTAL '
      '  ,ES_TOLDO=?ES_TOLDO '
      '  ,ACC_AUTO_LADO=?ACC_AUTO_LADO '
      '  ,ACC_AUTO_LONG_MANIVELA=?ACC_AUTO_LONG_MANIVELA '
      '  ,ACC_AUTO_TIPO=?ACC_AUTO_TIPO '
      '  ,ACC_OP_BRAZOS_LUZ_LED=?ACC_OP_BRAZOS_LUZ_LED '
      '  ,ACC_OP_ESCUADRA_A_TECHO=?ACC_OP_ESCUADRA_A_TECHO '
      '  ,ACC_OP_ESCUADRA_A_TECHO_UDS=?ACC_OP_ESCUADRA_A_TECHO_UDS '
      
        '  ,ACC_OP_ESCUADRA_SOPORTE_A_TECHO=?ACC_OP_ESCUADRA_SOPORTE_A_TE' +
        'CHO '
      '  ,ACC_OP_JUEGO_SOPORTES_TECHO=?ACC_OP_JUEGO_SOPORTES_TECHO '
      
        '  ,ACC_OP_JUEGO_SOPORTES_TECHO_TIP=?ACC_OP_JUEGO_SOPORTES_TECHO_' +
        'TIP '
      
        '  ,ACC_OP_LASTRE_HORMIGO_MACETERO_=?ACC_OP_LASTRE_HORMIGO_MACETE' +
        'RO_ '
      '  ,ACC_OP_LUZ_LED_BARRA_DE_CARGA=?ACC_OP_LUZ_LED_BARRA_DE_CARGA '
      '  ,ACC_OP_LUZ_LED_PERFIL_COFRE=?ACC_OP_LUZ_LED_PERFIL_COFRE '
      '  ,ACC_OP_MACETERO_GEMINI_POT=?ACC_OP_MACETERO_GEMINI_POT '
      
        '  ,ACC_OP_PAREJA_PUNTALES_TELESCOP=?ACC_OP_PAREJA_PUNTALES_TELES' +
        'COP '
      '  ,ACC_OP_PL_AJ_SOPORTE_BRAZO=?ACC_OP_PL_AJ_SOPORTE_BRAZO '
      
        '  ,ACC_OP_PL_AJ_SOPORTE_BRAZO_UDS=?ACC_OP_PL_AJ_SOPORTE_BRAZO_UD' +
        'S '
      '  ,ACC_OP_PL_AJ_SOPORTE_CENTRAL=?ACC_OP_PL_AJ_SOPORTE_CENTRAL '
      
        '  ,ACC_OP_PLACA_PATAS_FIJAS_MACETE=?ACC_OP_PLACA_PATAS_FIJAS_MAC' +
        'ETE '
      
        '  ,ACC_OP_RUEDA_GIRATORIA_MACETERO=?ACC_OP_RUEDA_GIRATORIA_MACET' +
        'ERO '
      '  ,ACC_OP_SOPORTE_ENTREPAREDES=?ACC_OP_SOPORTE_ENTREPAREDES '
      
        '  ,ACC_OP_SOPORTE_ENTREPAREDES_UDS=?ACC_OP_SOPORTE_ENTREPAREDES_' +
        'UDS '
      '  ,ACC_OP_SOPORTE_LARGO=?ACC_OP_SOPORTE_LARGO '
      '  ,ACC_OP_SOPORTE_LARGO_UDS=?ACC_OP_SOPORTE_LARGO_UDS '
      '  ,ACC_OP_TEJADILLO=?ACC_OP_TEJADILLO '
      '  ,ACC_OP_TEJADILLO_JUEGO_TAPAS=?ACC_OP_TEJADILLO_JUEGO_TAPAS '
      '  ,ACC_OP_TEJADILLO_N_LAMAS=?ACC_OP_TEJADILLO_N_LAMAS '
      '  ,ACC_OP_VIGAS_PIES_100_100=?ACC_OP_VIGAS_PIES_100_100 '
      '  ,COLOR_ESTRUCTURA_COLOR=?COLOR_ESTRUCTURA_COLOR '
      '  ,INSTALACION_TIPO=?INSTALACION_TIPO '
      '  ,MEDIDAS_ALTURA_DELANTERA=?MEDIDAS_ALTURA_DELANTERA '
      '  ,MEDIDAS_ALTURA_PIES=?MEDIDAS_ALTURA_PIES '
      '  ,MEDIDAS_ALTURA_PORTERIA=?MEDIDAS_ALTURA_PORTERIA '
      '  ,MEDIDAS_ALTURA_PORTERIA_2=?MEDIDAS_ALTURA_PORTERIA_2 '
      '  ,MEDIDAS_ALTURA_TRASERA=?MEDIDAS_ALTURA_TRASERA '
      '  ,MEDIDAS_CAIDA=?MEDIDAS_CAIDA '
      '  ,MEDIDAS_LINEA=?MEDIDAS_LINEA '
      '  ,MEDIDAS_SALIDA=?MEDIDAS_SALIDA '
      '  ,MEDIDAS_UDS=?MEDIDAS_UDS '
      '  ,OP_ESTRUCTURA_DOBLE_TIRO=?OP_ESTRUCTURA_DOBLE_TIRO '
      '  ,OP_ESTRUCTURA_GUIA_120_120=?OP_ESTRUCTURA_GUIA_120_120 '
      '  ,OP_ESTRUCTURA_GUIA_ADICIONAL=?OP_ESTRUCTURA_GUIA_ADICIONAL '
      '  ,OP_ESTRUCTURA_N_LATERALES=?OP_ESTRUCTURA_N_LATERALES '
      '  ,OP_ESTRUCTURA_PERIMETRAL=?OP_ESTRUCTURA_PERIMETRAL '
      '  ,OP_ESTRUCTURA_PILAR_AD_BASE=?OP_ESTRUCTURA_PILAR_AD_BASE '
      
        '  ,OP_ESTRUCTURA_PILAR_AD_BASE_UDS=?OP_ESTRUCTURA_PILAR_AD_BASE_' +
        'UDS '
      
        '  ,OP_ESTRUCTURA_POLEA_TIRO_CUERDA=?OP_ESTRUCTURA_POLEA_TIRO_CUE' +
        'RDA '
      '  ,OP_ESTRUCTURA_SUPLEMENTO_TAPA=?OP_ESTRUCTURA_SUPLEMENTO_TAPA '
      '  ,OP_ESTRUCTURA_TEJ_MOD=?OP_ESTRUCTURA_TEJ_MOD '
      '  ,OP_ESTRUCTURA_TEJ_MOD_N_LAMAS=?OP_ESTRUCTURA_TEJ_MOD_N_LAMAS '
      '  ,OP_ESTRUCTURA_TEJ_MO_SOPORTE=?OP_ESTRUCTURA_TEJ_MO_SOPORTE '
      '  ,OP_ESTRUCTURA_TEJ_MOD_TAPA=?OP_ESTRUCTURA_TEJ_MOD_TAPA '
      '  ,OP_ESTRUCTURA_TEJAD_MOD_UDS=?OP_ESTRUCTURA_TEJAD_MOD_UDS '
      '  ,TEJIDO_ALTURA=?TEJIDO_ALTURA '
      '  ,TEJIDO_BAMBALINA=?TEJIDO_BAMBALINA '
      '  ,TEJIDO_LONA=?TEJIDO_LONA '
      '  ,TEJIDO_ONDA=?TEJIDO_ONDA '
      '  ,TEJIDO_RIBETE=?TEJIDO_RIBETE '
      '  ,DATE_ADD=?DATE_ADD '
      '  ,DATE_UPD=?DATE_UPD '
      '  ,ID_DETALLES_S=?ID_DETALLES_S '
      '  ,ID_DESPIECE_CAB=?ID_DESPIECE_CAB '
      '  ,CREATED=?CREATED '
      '  ,MEDIDA_1=?MEDIDA_1 '
      '  ,MEDIDA_2=?MEDIDA_2 '
      '  ,MEDIDA_3=?MEDIDA_3 '
      '  ,MEDIDA_4=?MEDIDA_4 '
      '  ,COLOR=?COLOR '
      '  ,COLOCACION=?COLOCACION '
      '  ,LONA=?LONA '
      '  ,MONTAJE=?MONTAJE '
      '  ,ES_MOTOR=?ES_MOTOR '
      '  ,MOTOR=?MOTOR '
      '  ,MANIVELA=?MANIVELA '
      'WHERE'
      '  ID_CAB=?ID_CAB AND '
      '  ID=?ID ')
    DataSource = DSQMCabecera
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_DETALLE_ALBARAN DET INDEX (GES_DETALLES_S_C' +
        'AB_ID),VER_DETALLE_ALBARAN ALB INDEX (GES_DETALLES_S_ALB_ID)))')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'API_PEDIDOS_TOLDOS_DET'
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
    object QMDetalleID: TFIBStringField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Size = 100
    end
    object QMDetalleID_CAB: TFIBStringField
      DisplayLabel = 'Id Cab.'
      FieldName = 'ID_CAB'
      Size = 40
    end
    object QMDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 40
    end
    object QMDetalleUNITS: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNITS'
    end
    object QMDetalleRATE_BEFORE_DISCOUNT: TFloatField
      FieldName = 'RATE_BEFORE_DISCOUNT'
    end
    object QMDetalleDTO1: TFloatField
      DisplayLabel = 'Dto. 1'
      FieldName = 'DTO1'
    end
    object QMDetalleDTO2: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'DTO2'
    end
    object QMDetalleDTO3: TFloatField
      DisplayLabel = 'Dto. 3'
      FieldName = 'DTO3'
    end
    object QMDetalleTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object QMDetalleES_TOLDO: TIntegerField
      DisplayLabel = 'Es Toldo'
      FieldName = 'ES_TOLDO'
    end
    object QMDetalleACC_AUTO_LADO: TFIBStringField
      FieldName = 'ACC_AUTO_LADO'
      Size = 40
    end
    object QMDetalleACC_AUTO_LONG_MANIVELA: TFloatField
      FieldName = 'ACC_AUTO_LONG_MANIVELA'
    end
    object QMDetalleACC_AUTO_TIPO: TFIBStringField
      FieldName = 'ACC_AUTO_TIPO'
      Size = 40
    end
    object QMDetalleACC_OP_BRAZOS_LUZ_LED: TIntegerField
      FieldName = 'ACC_OP_BRAZOS_LUZ_LED'
    end
    object QMDetalleACC_OP_ESCUADRA_A_TECHO: TIntegerField
      FieldName = 'ACC_OP_ESCUADRA_A_TECHO'
    end
    object QMDetalleACC_OP_ESCUADRA_A_TECHO_UDS: TFloatField
      FieldName = 'ACC_OP_ESCUADRA_A_TECHO_UDS'
    end
    object QMDetalleACC_OP_ESCUADRA_SOPORTE_A_TECHO: TIntegerField
      FieldName = 'ACC_OP_ESCUADRA_SOPORTE_A_TECHO'
    end
    object QMDetalleACC_OP_JUEGO_SOPORTES_TECHO: TIntegerField
      FieldName = 'ACC_OP_JUEGO_SOPORTES_TECHO'
    end
    object QMDetalleACC_OP_JUEGO_SOPORTES_TECHO_TIP: TFIBStringField
      FieldName = 'ACC_OP_JUEGO_SOPORTES_TECHO_TIP'
      Size = 40
    end
    object QMDetalleACC_OP_LASTRE_HORMIGO_MACETERO_: TIntegerField
      FieldName = 'ACC_OP_LASTRE_HORMIGO_MACETERO_'
    end
    object QMDetalleACC_OP_LUZ_LED_BARRA_DE_CARGA: TIntegerField
      FieldName = 'ACC_OP_LUZ_LED_BARRA_DE_CARGA'
    end
    object QMDetalleACC_OP_LUZ_LED_PERFIL_COFRE: TIntegerField
      FieldName = 'ACC_OP_LUZ_LED_PERFIL_COFRE'
    end
    object QMDetalleACC_OP_MACETERO_GEMINI_POT: TIntegerField
      FieldName = 'ACC_OP_MACETERO_GEMINI_POT'
    end
    object QMDetalleACC_OP_PAREJA_PUNTALES_TELESCOP: TIntegerField
      FieldName = 'ACC_OP_PAREJA_PUNTALES_TELESCOP'
    end
    object QMDetalleACC_OP_PL_AJ_SOPORTE_BRAZO: TIntegerField
      FieldName = 'ACC_OP_PL_AJ_SOPORTE_BRAZO'
    end
    object QMDetalleACC_OP_PL_AJ_SOPORTE_BRAZO_UDS: TFloatField
      FieldName = 'ACC_OP_PL_AJ_SOPORTE_BRAZO_UDS'
    end
    object QMDetalleACC_OP_PL_AJ_SOPORTE_CENTRAL: TIntegerField
      FieldName = 'ACC_OP_PL_AJ_SOPORTE_CENTRAL'
    end
    object QMDetalleACC_OP_PLACA_PATAS_FIJAS_MACETE: TIntegerField
      FieldName = 'ACC_OP_PLACA_PATAS_FIJAS_MACETE'
    end
    object QMDetalleACC_OP_RUEDA_GIRATORIA_MACETERO: TIntegerField
      FieldName = 'ACC_OP_RUEDA_GIRATORIA_MACETERO'
    end
    object QMDetalleACC_OP_SOPORTE_ENTREPAREDES: TIntegerField
      FieldName = 'ACC_OP_SOPORTE_ENTREPAREDES'
    end
    object QMDetalleACC_OP_SOPORTE_ENTREPAREDES_UDS: TFloatField
      FieldName = 'ACC_OP_SOPORTE_ENTREPAREDES_UDS'
    end
    object QMDetalleACC_OP_SOPORTE_LARGO: TIntegerField
      FieldName = 'ACC_OP_SOPORTE_LARGO'
    end
    object QMDetalleACC_OP_SOPORTE_LARGO_UDS: TFloatField
      FieldName = 'ACC_OP_SOPORTE_LARGO_UDS'
    end
    object QMDetalleACC_OP_TEJADILLO: TIntegerField
      FieldName = 'ACC_OP_TEJADILLO'
    end
    object QMDetalleACC_OP_TEJADILLO_JUEGO_TAPAS: TIntegerField
      FieldName = 'ACC_OP_TEJADILLO_JUEGO_TAPAS'
    end
    object QMDetalleACC_OP_TEJADILLO_N_LAMAS: TFloatField
      FieldName = 'ACC_OP_TEJADILLO_N_LAMAS'
    end
    object QMDetalleACC_OP_VIGAS_PIES_100_100: TIntegerField
      FieldName = 'ACC_OP_VIGAS_PIES_100_100'
    end
    object QMDetalleCOLOR_ESTRUCTURA_COLOR: TFIBStringField
      DisplayLabel = 'Color Estruct.'
      FieldName = 'COLOR_ESTRUCTURA_COLOR'
      Size = 40
    end
    object QMDetalleINSTALACION_TIPO: TFIBStringField
      FieldName = 'INSTALACION_TIPO'
      Size = 40
    end
    object QMDetalleMEDIDAS_ALTURA_DELANTERA: TFloatField
      FieldName = 'MEDIDAS_ALTURA_DELANTERA'
    end
    object QMDetalleMEDIDAS_ALTURA_PIES: TFloatField
      FieldName = 'MEDIDAS_ALTURA_PIES'
    end
    object QMDetalleMEDIDAS_ALTURA_PORTERIA: TFloatField
      FieldName = 'MEDIDAS_ALTURA_PORTERIA'
    end
    object QMDetalleMEDIDAS_ALTURA_PORTERIA_2: TFloatField
      FieldName = 'MEDIDAS_ALTURA_PORTERIA_2'
    end
    object QMDetalleMEDIDAS_ALTURA_TRASERA: TFloatField
      FieldName = 'MEDIDAS_ALTURA_TRASERA'
    end
    object QMDetalleMEDIDAS_CAIDA: TFloatField
      FieldName = 'MEDIDAS_CAIDA'
    end
    object QMDetalleMEDIDAS_LINEA: TFloatField
      DisplayLabel = 'Linea'
      FieldName = 'MEDIDAS_LINEA'
    end
    object QMDetalleMEDIDAS_SALIDA: TFloatField
      DisplayLabel = 'Salida'
      FieldName = 'MEDIDAS_SALIDA'
    end
    object QMDetalleMEDIDAS_UDS: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'MEDIDAS_UDS'
    end
    object QMDetalleOP_ESTRUCTURA_DOBLE_TIRO: TIntegerField
      FieldName = 'OP_ESTRUCTURA_DOBLE_TIRO'
    end
    object QMDetalleOP_ESTRUCTURA_GUIA_120_120: TIntegerField
      FieldName = 'OP_ESTRUCTURA_GUIA_120_120'
    end
    object QMDetalleOP_ESTRUCTURA_GUIA_ADICIONAL: TIntegerField
      FieldName = 'OP_ESTRUCTURA_GUIA_ADICIONAL'
    end
    object QMDetalleOP_ESTRUCTURA_N_LATERALES: TFloatField
      FieldName = 'OP_ESTRUCTURA_N_LATERALES'
    end
    object QMDetalleOP_ESTRUCTURA_PERIMETRAL: TIntegerField
      FieldName = 'OP_ESTRUCTURA_PERIMETRAL'
    end
    object QMDetalleOP_ESTRUCTURA_PILAR_AD_BASE: TIntegerField
      FieldName = 'OP_ESTRUCTURA_PILAR_AD_BASE'
    end
    object QMDetalleOP_ESTRUCTURA_PILAR_AD_BASE_UDS: TFloatField
      FieldName = 'OP_ESTRUCTURA_PILAR_AD_BASE_UDS'
    end
    object QMDetalleOP_ESTRUCTURA_POLEA_TIRO_CUERDA: TIntegerField
      FieldName = 'OP_ESTRUCTURA_POLEA_TIRO_CUERDA'
    end
    object QMDetalleOP_ESTRUCTURA_SUPLEMENTO_TAPA: TIntegerField
      FieldName = 'OP_ESTRUCTURA_SUPLEMENTO_TAPA'
    end
    object QMDetalleOP_ESTRUCTURA_TEJ_MOD: TIntegerField
      FieldName = 'OP_ESTRUCTURA_TEJ_MOD'
    end
    object QMDetalleOP_ESTRUCTURA_TEJ_MOD_N_LAMAS: TFloatField
      FieldName = 'OP_ESTRUCTURA_TEJ_MOD_N_LAMAS'
    end
    object QMDetalleOP_ESTRUCTURA_TEJ_MO_SOPORTE: TIntegerField
      FieldName = 'OP_ESTRUCTURA_TEJ_MO_SOPORTE'
    end
    object QMDetalleOP_ESTRUCTURA_TEJ_MOD_TAPA: TIntegerField
      FieldName = 'OP_ESTRUCTURA_TEJ_MOD_TAPA'
    end
    object QMDetalleOP_ESTRUCTURA_TEJAD_MOD_UDS: TFloatField
      FieldName = 'OP_ESTRUCTURA_TEJAD_MOD_UDS'
    end
    object QMDetalleTEJIDO_ALTURA: TFloatField
      FieldName = 'TEJIDO_ALTURA'
    end
    object QMDetalleTEJIDO_BAMBALINA: TFIBStringField
      DisplayLabel = 'Bambalina'
      FieldName = 'TEJIDO_BAMBALINA'
      Size = 40
    end
    object QMDetalleTEJIDO_LONA: TFIBStringField
      DisplayLabel = 'Lona'
      FieldName = 'TEJIDO_LONA'
      Size = 15
    end
    object QMDetalleTEJIDO_ONDA: TFIBStringField
      DisplayLabel = 'Onda'
      FieldName = 'TEJIDO_ONDA'
      Size = 40
    end
    object QMDetalleTEJIDO_RIBETE: TFIBStringField
      DisplayLabel = 'Ribete'
      FieldName = 'TEJIDO_RIBETE'
      Size = 40
    end
    object QMDetalleDATE_ADD: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'DATE_ADD'
    end
    object QMDetalleDATE_UPD: TDateTimeField
      DisplayLabel = 'Fec. Modif.'
      FieldName = 'DATE_UPD'
    end
    object QMDetalleID_DETALLES_S: TIntegerField
      DisplayLabel = 'Id Det. Doc.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMDetalleID_DESPIECE_CAB: TIntegerField
      DisplayLabel = 'Id Despiece'
      FieldName = 'ID_DESPIECE_CAB'
    end
    object QMDetalleCREATED: TIntegerField
      DisplayLabel = 'Creado'
      FieldName = 'CREATED'
    end
    object QMDetalleMEDIDA_1: TFloatField
      FieldName = 'MEDIDA_1'
    end
    object QMDetalleMEDIDA_2: TFloatField
      FieldName = 'MEDIDA_2'
    end
    object QMDetalleMEDIDA_3: TFloatField
      FieldName = 'MEDIDA_3'
    end
    object QMDetalleMEDIDA_4: TFloatField
      FieldName = 'MEDIDA_4'
    end
    object QMDetalleCOLOR: TFIBStringField
      DisplayLabel = 'Cod. Color'
      FieldName = 'COLOR'
      Size = 2
    end
    object QMDetalleCOLOCACION: TIntegerField
      FieldName = 'COLOCACION'
    end
    object QMDetalleLONA: TFIBStringField
      DisplayLabel = 'Art. Lona'
      FieldName = 'LONA'
      Size = 15
    end
    object QMDetalleMONTAJE: TIntegerField
      FieldName = 'MONTAJE'
    end
    object QMDetalleES_MOTOR: TIntegerField
      DisplayLabel = 'Es Motor'
      FieldName = 'ES_MOTOR'
    end
    object QMDetalleMOTOR: TIntegerField
      FieldName = 'MOTOR'
    end
    object QMDetalleMANIVELA: TFIBStringField
      DisplayLabel = 'Manivela'
      FieldName = 'MANIVELA'
      Size = 15
    end
    object QMDetalleTITULO_LARGO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_LARGO'
      Size = 256
    end
    object QMDetalleCODIGO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'CODIGO'
      Size = 5
    end
    object QMDetalleDESCRIPCION: TFIBStringField
      DisplayLabel = 'Desc. Modelo'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 128
    Top = 56
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 128
    Top = 8
  end
  object TLocal: THYTransaction
    Active = True
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 166
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 166
    Top = 56
  end
end
