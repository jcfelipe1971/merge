object DMDatosTecnicos: TDMDatosTecnicos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 436
  Top = 405
  Height = 413
  Width = 474
  object QMDatosTecnicos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_DATOS_TECNICOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO Z_DATOS_TECNICOS'
      
        '  (ID,ID_ORDEN,REFERENCIA,N_FABRICACION,FECHA,CLIENTE,TIPO_FILTR' +
        'O,NUM_FILTRO,PEDIDO,FECHA_PEDIDO,SU_OFERTA,FECHA_OFERTA,MARCA_MO' +
        'TOR,POTENCIA_KW,TENSION_VOLTAJES,RPM,BUJE,EJE_DIAMETRO,TURBINA,G' +
        'IRO,OT,TIPO_PLACA,TALLER,FECHA_ENTREGA_PLANOS,PRESUPUESTO_TALLER' +
        ',FECHA_ENTREGA_EQUIPO,VIA_SECA_SUP_FILTRANTE_M2,CAUDAL_M3_H,PRES' +
        'ION_DAPA,POSICION,RAL_EXTERIOR,RAL_PROTECCION,CAPACIDAD_L,OBSERV' +
        'ACIONES,RESPONSABLE,LUGAR_ENTREGA,ST,INOX_304,INOX_316,CREUSABRO' +
        '_4000,IMPR_BASICA,IMPR_2,POTENCIA_MOTOR_REDUCTOR_KW,ARMARIO_ELEC' +
        'TRICO,COLECTOR,MONTAJE,MONTAJE_ELECTRICO,TRANSPORTE,ELEMENTOS_SE' +
        'GURIDAD,ACCESORIOS,PROHIBIDO_FUMAR_GRANDE,PROHIBIDO_FUMAR_MEDIAN' +
        'O,PARO_SEGURIDAD,RETROCESO_DESCARGADOR,ATENCION_PELIGRO,NIVEL_PA' +
        'RADO,NIVEL_FUNCIONAMIENTO,FLECHA_RECTA,FLECHA_CURVADA,USO_GAFAS,' +
        'USO_MASCARAS,MAQUINARIA_FUNCIONAMIENTO,RIESGO_FUNCIONAMIENTO,RIE' +
        'SGO_ATRAPAMIENTO,PROHIBIDO_ENGRASAR_LIMPIAR,DATOS_CALDERIN,DEJAR' +
        '_LIBRE_ZONA_PROYECCION,HANDTE_GRANDE,LUGAR_PUESTA_MARCHA,FECHA_P' +
        'UESTA_MARCHA,CAUDAL_BOMBA_M3_H,PRESION_BOMBA_M,POTENCIA_BOMBA_KW' +
        ',B1,B88,B76,B44,B35,TH,TL,B30,B23,B11,B3,B2,CONSUMO_MOTOR_VENTIL' +
        'ADOR_A,CONSUMO_MOTOR_BOMBA_A,CONSUMO_MOTOR_REDUCTOR_A,CONSUMO_NO' +
        'MINAL_VENTILADOR,CONSUMO_NOMINAL_BOMBA,CONSUMO_NOMINAL_MOTOR_RED' +
        'UCTOR,VALOR_TERMICO_VENTILADOR,VALOR_TERMICO_BOMBA,VALOR_MOTOR_R' +
        'EDUCTOR,CAUDAL_REAL_VENTILADOR_M3_H,P_MIN_PHOTOHELIC_DAPA,P_VENT' +
        'URI_DAPA,P_CARTUCHO_MANGA_DAPA,PRESION_CALDERIN_BAR,TIEMPO_PAUSA' +
        '_EVS,TIEMPO_POST_LIMPIEZAS,TIEMPO_V_DS,NOMINAL_VENTILADOR_A,NOMI' +
        'NAL_BOMBA_A,NOMINAL_MOTOR_REDUCTOR_A,P_MAX_PHOTOHELIC_DAPA,P_TUB' +
        '_DAPA,L_NIVEL_MM,PREOCAT_KG,TIEMPO_IMPULSO_EVS,TIEMPO_ON_DRAGA_M' +
        'IN,TIEMPO_OFF_DRAGA_MIN,OBSERVACIONES1,OBSERVACIONES2,OBSERVACIO' +
        'NES3,OBSERVACIONES4,OBSERVACIONES5,OBSERVACIONES6,OBSERVACIONES7' +
        ',OBSERVACIONES8,FOTO1,FOTO2,EMPRESA,ANO,SENALIZACION_EQUIPO,PROH' +
        'IBIDO_FUMAR_PEQUENO,HANDTE_PEQUENO,APLICACION)'
      'VALUES'
      
        '  (?ID,?ID_ORDEN,?REFERENCIA,?N_FABRICACION,?FECHA,?CLIENTE,?TIP' +
        'O_FILTRO,?NUM_FILTRO,?PEDIDO,?FECHA_PEDIDO,?SU_OFERTA,?FECHA_OFE' +
        'RTA,?MARCA_MOTOR,?POTENCIA_KW,?TENSION_VOLTAJES,?RPM,?BUJE,?EJE_' +
        'DIAMETRO,?TURBINA,?GIRO,?OT,?TIPO_PLACA,?TALLER,?FECHA_ENTREGA_P' +
        'LANOS,?PRESUPUESTO_TALLER,?FECHA_ENTREGA_EQUIPO,?VIA_SECA_SUP_FI' +
        'LTRANTE_M2,?CAUDAL_M3_H,?PRESION_DAPA,?POSICION,?RAL_EXTERIOR,?R' +
        'AL_PROTECCION,?CAPACIDAD_L,?OBSERVACIONES,?RESPONSABLE,?LUGAR_EN' +
        'TREGA,?ST,?INOX_304,?INOX_316,?CREUSABRO_4000,?IMPR_BASICA,?IMPR' +
        '_2,?POTENCIA_MOTOR_REDUCTOR_KW,?ARMARIO_ELECTRICO,?COLECTOR,?MON' +
        'TAJE,?MONTAJE_ELECTRICO,?TRANSPORTE,?ELEMENTOS_SEGURIDAD,?ACCESO' +
        'RIOS,?PROHIBIDO_FUMAR_GRANDE,?PROHIBIDO_FUMAR_MEDIANO,?PARO_SEGU' +
        'RIDAD,?RETROCESO_DESCARGADOR,?ATENCION_PELIGRO,?NIVEL_PARADO,?NI' +
        'VEL_FUNCIONAMIENTO,?FLECHA_RECTA,?FLECHA_CURVADA,?USO_GAFAS,?USO' +
        '_MASCARAS,?MAQUINARIA_FUNCIONAMIENTO,?RIESGO_FUNCIONAMIENTO,?RIE' +
        'SGO_ATRAPAMIENTO,?PROHIBIDO_ENGRASAR_LIMPIAR,?DATOS_CALDERIN,?DE' +
        'JAR_LIBRE_ZONA_PROYECCION,?HANDTE_GRANDE,?LUGAR_PUESTA_MARCHA,?F' +
        'ECHA_PUESTA_MARCHA,?CAUDAL_BOMBA_M3_H,?PRESION_BOMBA_M,?POTENCIA' +
        '_BOMBA_KW,?B1,?B88,?B76,?B44,?B35,?TH,?TL,?B30,?B23,?B11,?B3,?B2' +
        ',?CONSUMO_MOTOR_VENTILADOR_A,?CONSUMO_MOTOR_BOMBA_A,?CONSUMO_MOT' +
        'OR_REDUCTOR_A,?CONSUMO_NOMINAL_VENTILADOR,?CONSUMO_NOMINAL_BOMBA' +
        ',?CONSUMO_NOMINAL_MOTOR_REDUCTOR,?VALOR_TERMICO_VENTILADOR,?VALO' +
        'R_TERMICO_BOMBA,?VALOR_MOTOR_REDUCTOR,?CAUDAL_REAL_VENTILADOR_M3' +
        '_H,?P_MIN_PHOTOHELIC_DAPA,?P_VENTURI_DAPA,?P_CARTUCHO_MANGA_DAPA' +
        ',?PRESION_CALDERIN_BAR,?TIEMPO_PAUSA_EVS,?TIEMPO_POST_LIMPIEZAS,' +
        '?TIEMPO_V_DS,?NOMINAL_VENTILADOR_A,?NOMINAL_BOMBA_A,?NOMINAL_MOT' +
        'OR_REDUCTOR_A,?P_MAX_PHOTOHELIC_DAPA,?P_TUB_DAPA,?L_NIVEL_MM,?PR' +
        'EOCAT_KG,?TIEMPO_IMPULSO_EVS,?TIEMPO_ON_DRAGA_MIN,?TIEMPO_OFF_DR' +
        'AGA_MIN,?OBSERVACIONES1,?OBSERVACIONES2,?OBSERVACIONES3,?OBSERVA' +
        'CIONES4,?OBSERVACIONES5,?OBSERVACIONES6,?OBSERVACIONES7,?OBSERVA' +
        'CIONES8,?FOTO1,?FOTO2,?EMPRESA,?ANO,?SENALIZACION_EQUIPO,?PROHIB' +
        'IDO_FUMAR_PEQUENO,?HANDTE_PEQUENO,?APLICACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_DATOS_TECNICOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_DATOS_TECNICOS'
      ' ORDER BY EMPRESA, ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_DATOS_TECNICOS'
      'SET'
      '  ID_ORDEN=?ID_ORDEN '
      '  ,REFERENCIA=?REFERENCIA '
      '  ,N_FABRICACION=?N_FABRICACION '
      '  ,FECHA=?FECHA '
      '  ,CLIENTE=?CLIENTE '
      '  ,TIPO_FILTRO=?TIPO_FILTRO '
      '  ,NUM_FILTRO=?NUM_FILTRO '
      '  ,PEDIDO=?PEDIDO '
      '  ,FECHA_PEDIDO=?FECHA_PEDIDO '
      '  ,SU_OFERTA=?SU_OFERTA '
      '  ,FECHA_OFERTA=?FECHA_OFERTA '
      '  ,MARCA_MOTOR=?MARCA_MOTOR '
      '  ,POTENCIA_KW=?POTENCIA_KW '
      '  ,TENSION_VOLTAJES=?TENSION_VOLTAJES '
      '  ,RPM=?RPM '
      '  ,BUJE=?BUJE '
      '  ,EJE_DIAMETRO=?EJE_DIAMETRO '
      '  ,TURBINA=?TURBINA '
      '  ,GIRO=?GIRO '
      '  ,OT=?OT '
      '  ,TIPO_PLACA=?TIPO_PLACA '
      '  ,TALLER=?TALLER '
      '  ,FECHA_ENTREGA_PLANOS=?FECHA_ENTREGA_PLANOS '
      '  ,PRESUPUESTO_TALLER=?PRESUPUESTO_TALLER '
      '  ,FECHA_ENTREGA_EQUIPO=?FECHA_ENTREGA_EQUIPO '
      '  ,VIA_SECA_SUP_FILTRANTE_M2=?VIA_SECA_SUP_FILTRANTE_M2 '
      '  ,CAUDAL_M3_H=?CAUDAL_M3_H '
      '  ,PRESION_DAPA=?PRESION_DAPA '
      '  ,POSICION=?POSICION '
      '  ,RAL_EXTERIOR=?RAL_EXTERIOR '
      '  ,RAL_PROTECCION=?RAL_PROTECCION '
      '  ,CAPACIDAD_L=?CAPACIDAD_L '
      '  ,OBSERVACIONES=?OBSERVACIONES '
      '  ,RESPONSABLE=?RESPONSABLE '
      '  ,LUGAR_ENTREGA=?LUGAR_ENTREGA '
      '  ,ST=?ST '
      '  ,INOX_304=?INOX_304 '
      '  ,INOX_316=?INOX_316 '
      '  ,CREUSABRO_4000=?CREUSABRO_4000 '
      '  ,IMPR_BASICA=?IMPR_BASICA '
      '  ,IMPR_2=?IMPR_2 '
      '  ,POTENCIA_MOTOR_REDUCTOR_KW=?POTENCIA_MOTOR_REDUCTOR_KW '
      '  ,ARMARIO_ELECTRICO=?ARMARIO_ELECTRICO '
      '  ,COLECTOR=?COLECTOR '
      '  ,MONTAJE=?MONTAJE '
      '  ,MONTAJE_ELECTRICO=?MONTAJE_ELECTRICO '
      '  ,TRANSPORTE=?TRANSPORTE '
      '  ,ELEMENTOS_SEGURIDAD=?ELEMENTOS_SEGURIDAD '
      '  ,ACCESORIOS=?ACCESORIOS '
      '  ,PROHIBIDO_FUMAR_GRANDE=?PROHIBIDO_FUMAR_GRANDE '
      '  ,PROHIBIDO_FUMAR_MEDIANO=?PROHIBIDO_FUMAR_MEDIANO '
      '  ,PARO_SEGURIDAD=?PARO_SEGURIDAD '
      '  ,RETROCESO_DESCARGADOR=?RETROCESO_DESCARGADOR '
      '  ,ATENCION_PELIGRO=?ATENCION_PELIGRO '
      '  ,NIVEL_PARADO=?NIVEL_PARADO '
      '  ,NIVEL_FUNCIONAMIENTO=?NIVEL_FUNCIONAMIENTO '
      '  ,FLECHA_RECTA=?FLECHA_RECTA '
      '  ,FLECHA_CURVADA=?FLECHA_CURVADA '
      '  ,USO_GAFAS=?USO_GAFAS '
      '  ,USO_MASCARAS=?USO_MASCARAS '
      '  ,MAQUINARIA_FUNCIONAMIENTO=?MAQUINARIA_FUNCIONAMIENTO '
      '  ,RIESGO_FUNCIONAMIENTO=?RIESGO_FUNCIONAMIENTO '
      '  ,RIESGO_ATRAPAMIENTO=?RIESGO_ATRAPAMIENTO '
      '  ,PROHIBIDO_ENGRASAR_LIMPIAR=?PROHIBIDO_ENGRASAR_LIMPIAR '
      '  ,DATOS_CALDERIN=?DATOS_CALDERIN '
      '  ,DEJAR_LIBRE_ZONA_PROYECCION=?DEJAR_LIBRE_ZONA_PROYECCION '
      '  ,HANDTE_GRANDE=?HANDTE_GRANDE '
      '  ,LUGAR_PUESTA_MARCHA=?LUGAR_PUESTA_MARCHA '
      '  ,FECHA_PUESTA_MARCHA=?FECHA_PUESTA_MARCHA '
      '  ,CAUDAL_BOMBA_M3_H=?CAUDAL_BOMBA_M3_H '
      '  ,PRESION_BOMBA_M=?PRESION_BOMBA_M '
      '  ,POTENCIA_BOMBA_KW=?POTENCIA_BOMBA_KW '
      '  ,B1=?B1 '
      '  ,B88=?B88 '
      '  ,B76=?B76 '
      '  ,B44=?B44 '
      '  ,B35=?B35 '
      '  ,TH=?TH '
      '  ,TL=?TL '
      '  ,B30=?B30 '
      '  ,B23=?B23 '
      '  ,B11=?B11 '
      '  ,B3=?B3 '
      '  ,B2=?B2 '
      '  ,CONSUMO_MOTOR_VENTILADOR_A=?CONSUMO_MOTOR_VENTILADOR_A '
      '  ,CONSUMO_MOTOR_BOMBA_A=?CONSUMO_MOTOR_BOMBA_A '
      '  ,CONSUMO_MOTOR_REDUCTOR_A=?CONSUMO_MOTOR_REDUCTOR_A '
      '  ,CONSUMO_NOMINAL_VENTILADOR=?CONSUMO_NOMINAL_VENTILADOR '
      '  ,CONSUMO_NOMINAL_BOMBA=?CONSUMO_NOMINAL_BOMBA '
      
        '  ,CONSUMO_NOMINAL_MOTOR_REDUCTOR=?CONSUMO_NOMINAL_MOTOR_REDUCTO' +
        'R '
      '  ,VALOR_TERMICO_VENTILADOR=?VALOR_TERMICO_VENTILADOR '
      '  ,VALOR_TERMICO_BOMBA=?VALOR_TERMICO_BOMBA '
      '  ,VALOR_MOTOR_REDUCTOR=?VALOR_MOTOR_REDUCTOR '
      '  ,CAUDAL_REAL_VENTILADOR_M3_H=?CAUDAL_REAL_VENTILADOR_M3_H '
      '  ,P_MIN_PHOTOHELIC_DAPA=?P_MIN_PHOTOHELIC_DAPA '
      '  ,P_VENTURI_DAPA=?P_VENTURI_DAPA '
      '  ,P_CARTUCHO_MANGA_DAPA=?P_CARTUCHO_MANGA_DAPA '
      '  ,PRESION_CALDERIN_BAR=?PRESION_CALDERIN_BAR '
      '  ,TIEMPO_PAUSA_EVS=?TIEMPO_PAUSA_EVS '
      '  ,TIEMPO_POST_LIMPIEZAS=?TIEMPO_POST_LIMPIEZAS '
      '  ,TIEMPO_V_DS=?TIEMPO_V_DS '
      '  ,NOMINAL_VENTILADOR_A=?NOMINAL_VENTILADOR_A '
      '  ,NOMINAL_BOMBA_A=?NOMINAL_BOMBA_A '
      '  ,NOMINAL_MOTOR_REDUCTOR_A=?NOMINAL_MOTOR_REDUCTOR_A '
      '  ,P_MAX_PHOTOHELIC_DAPA=?P_MAX_PHOTOHELIC_DAPA '
      '  ,P_TUB_DAPA=?P_TUB_DAPA '
      '  ,L_NIVEL_MM=?L_NIVEL_MM '
      '  ,PREOCAT_KG=?PREOCAT_KG '
      '  ,TIEMPO_IMPULSO_EVS=?TIEMPO_IMPULSO_EVS '
      '  ,TIEMPO_ON_DRAGA_MIN=?TIEMPO_ON_DRAGA_MIN '
      '  ,TIEMPO_OFF_DRAGA_MIN=?TIEMPO_OFF_DRAGA_MIN '
      '  ,OBSERVACIONES1=?OBSERVACIONES1 '
      '  ,OBSERVACIONES2=?OBSERVACIONES2 '
      '  ,OBSERVACIONES3=?OBSERVACIONES3 '
      '  ,OBSERVACIONES4=?OBSERVACIONES4 '
      '  ,OBSERVACIONES5=?OBSERVACIONES5 '
      '  ,OBSERVACIONES6=?OBSERVACIONES6 '
      '  ,OBSERVACIONES7=?OBSERVACIONES7 '
      '  ,OBSERVACIONES8=?OBSERVACIONES8 '
      '  ,FOTO1=?FOTO1 '
      '  ,FOTO2=?FOTO2 '
      '  ,ANO=?ANO '
      '  ,SENALIZACION_EQUIPO=?SENALIZACION_EQUIPO '
      '  ,PROHIBIDO_FUMAR_PEQUENO=?PROHIBIDO_FUMAR_PEQUENO '
      '  ,HANDTE_PEQUENO=?HANDTE_PEQUENO '
      '  ,APLICACION=?APLICACION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ID=?ID ')
    AfterDelete = Graba
    AfterOpen = QMDatosTecnicosAfterOpen
    AfterPost = Graba
    BeforePost = QMDatosTecnicosBeforePost
    OnNewRecord = QMDatosTecnicosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ID ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_DATOS_TECNICOS'
    UpdateTransaction = TLocal
    Left = 48
    Top = 32
    object QMDatosTecnicosID: TIntegerField
      FieldName = 'ID'
    end
    object QMDatosTecnicosEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMDatosTecnicosID_ORDEN: TIntegerField
      FieldName = 'ID_ORDEN'
      OnChange = QMDatosTecnicosID_ORDENChange
    end
    object QMDatosTecnicosREFERENCIA: TFIBStringField
      FieldName = 'REFERENCIA'
      Size = 15
    end
    object QMDatosTecnicosN_FABRICACION: TFIBStringField
      FieldName = 'N_FABRICACION'
      Size = 60
    end
    object QMDatosTecnicosFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QMDatosTecnicosANO: TFIBStringField
      FieldName = 'ANO'
      Size = 15
    end
    object QMDatosTecnicosCLIENTE: TFIBStringField
      FieldName = 'CLIENTE'
      Size = 60
    end
    object QMDatosTecnicosTIPO_FILTRO: TFIBStringField
      FieldName = 'TIPO_FILTRO'
      Size = 60
    end
    object QMDatosTecnicosNUM_FILTRO: TFIBStringField
      FieldName = 'NUM_FILTRO'
      Size = 60
    end
    object QMDatosTecnicosPEDIDO: TFIBStringField
      FieldName = 'PEDIDO'
      OnGetText = QMDatosTecnicosPEDIDOGetText
      Size = 60
    end
    object QMDatosTecnicosFECHA_PEDIDO: TDateTimeField
      FieldName = 'FECHA_PEDIDO'
      OnGetText = QMDatosTecnicosFECHA_PEDIDOGetText
    end
    object QMDatosTecnicosSU_OFERTA: TFIBStringField
      FieldName = 'SU_OFERTA'
      Size = 60
    end
    object QMDatosTecnicosFECHA_OFERTA: TDateTimeField
      FieldName = 'FECHA_OFERTA'
    end
    object QMDatosTecnicosMARCA_MOTOR: TFIBStringField
      FieldName = 'MARCA_MOTOR'
      Size = 60
    end
    object QMDatosTecnicosPOTENCIA_KW: TFIBStringField
      FieldName = 'POTENCIA_KW'
      Size = 60
    end
    object QMDatosTecnicosTENSION_VOLTAJES: TFIBStringField
      FieldName = 'TENSION_VOLTAJES'
      Size = 60
    end
    object QMDatosTecnicosRPM: TFIBStringField
      FieldName = 'RPM'
      Size = 60
    end
    object QMDatosTecnicosBUJE: TFIBStringField
      FieldName = 'BUJE'
      Size = 60
    end
    object QMDatosTecnicosEJE_DIAMETRO: TFIBStringField
      FieldName = 'EJE_DIAMETRO'
      Size = 60
    end
    object QMDatosTecnicosTURBINA: TFIBStringField
      FieldName = 'TURBINA'
      Size = 60
    end
    object QMDatosTecnicosGIRO: TFIBStringField
      FieldName = 'GIRO'
      Size = 60
    end
    object QMDatosTecnicosOT: TIntegerField
      FieldName = 'OT'
    end
    object QMDatosTecnicosTIPO_PLACA: TFIBStringField
      FieldName = 'TIPO_PLACA'
      Size = 60
    end
    object QMDatosTecnicosTALLER: TFIBStringField
      FieldName = 'TALLER'
      Size = 60
    end
    object QMDatosTecnicosFECHA_ENTREGA_PLANOS: TDateTimeField
      FieldName = 'FECHA_ENTREGA_PLANOS'
    end
    object QMDatosTecnicosPRESUPUESTO_TALLER: TFIBStringField
      FieldName = 'PRESUPUESTO_TALLER'
      Size = 60
    end
    object QMDatosTecnicosFECHA_ENTREGA_EQUIPO: TDateTimeField
      FieldName = 'FECHA_ENTREGA_EQUIPO'
    end
    object QMDatosTecnicosVIA_SECA_SUP_FILTRANTE_M2: TFIBStringField
      FieldName = 'VIA_SECA_SUP_FILTRANTE_M2'
      Size = 60
    end
    object QMDatosTecnicosCAUDAL_M3_H: TFIBStringField
      FieldName = 'CAUDAL_M3_H'
      Size = 60
    end
    object QMDatosTecnicosPRESION_DAPA: TFIBStringField
      FieldName = 'PRESION_DAPA'
      Size = 60
    end
    object QMDatosTecnicosPOSICION: TFIBStringField
      FieldName = 'POSICION'
      Size = 60
    end
    object QMDatosTecnicosRAL_EXTERIOR: TFIBStringField
      FieldName = 'RAL_EXTERIOR'
      Size = 60
    end
    object QMDatosTecnicosRAL_PROTECCION: TFIBStringField
      FieldName = 'RAL_PROTECCION'
      Size = 60
    end
    object QMDatosTecnicosCAPACIDAD_L: TFIBStringField
      FieldName = 'CAPACIDAD_L'
      Size = 60
    end
    object QMDatosTecnicosOBSERVACIONES: TBlobField
      FieldName = 'OBSERVACIONES'
      Size = 8
    end
    object QMDatosTecnicosRESPONSABLE: TFIBStringField
      FieldName = 'RESPONSABLE'
      OnGetText = QMDatosTecnicosRESPONSABLEGetText
      Size = 60
    end
    object QMDatosTecnicosLUGAR_ENTREGA: TFIBStringField
      FieldName = 'LUGAR_ENTREGA'
      Size = 60
    end
    object QMDatosTecnicosST: TIntegerField
      FieldName = 'ST'
    end
    object QMDatosTecnicosINOX_304: TIntegerField
      FieldName = 'INOX_304'
    end
    object QMDatosTecnicosINOX_316: TIntegerField
      FieldName = 'INOX_316'
    end
    object QMDatosTecnicosCREUSABRO_4000: TIntegerField
      FieldName = 'CREUSABRO_4000'
    end
    object QMDatosTecnicosIMPR_BASICA: TIntegerField
      FieldName = 'IMPR_BASICA'
    end
    object QMDatosTecnicosIMPR_2: TIntegerField
      FieldName = 'IMPR_2'
    end
    object QMDatosTecnicosPOTENCIA_MOTOR_REDUCTOR_KW: TFIBStringField
      FieldName = 'POTENCIA_MOTOR_REDUCTOR_KW'
      Size = 60
    end
    object QMDatosTecnicosARMARIO_ELECTRICO: TIntegerField
      FieldName = 'ARMARIO_ELECTRICO'
    end
    object QMDatosTecnicosCOLECTOR: TIntegerField
      FieldName = 'COLECTOR'
    end
    object QMDatosTecnicosMONTAJE: TIntegerField
      FieldName = 'MONTAJE'
    end
    object QMDatosTecnicosMONTAJE_ELECTRICO: TIntegerField
      FieldName = 'MONTAJE_ELECTRICO'
    end
    object QMDatosTecnicosTRANSPORTE: TIntegerField
      FieldName = 'TRANSPORTE'
    end
    object QMDatosTecnicosELEMENTOS_SEGURIDAD: TIntegerField
      FieldName = 'ELEMENTOS_SEGURIDAD'
    end
    object QMDatosTecnicosACCESORIOS: TIntegerField
      FieldName = 'ACCESORIOS'
    end
    object QMDatosTecnicosSENALIZACION_EQUIPO: TFIBStringField
      FieldName = 'SENALIZACION_EQUIPO'
      Size = 60
    end
    object QMDatosTecnicosPROHIBIDO_FUMAR_GRANDE: TFIBStringField
      FieldName = 'PROHIBIDO_FUMAR_GRANDE'
      Size = 60
    end
    object QMDatosTecnicosPROHIBIDO_FUMAR_MEDIANO: TFIBStringField
      FieldName = 'PROHIBIDO_FUMAR_MEDIANO'
      Size = 60
    end
    object QMDatosTecnicosPROHIBIDO_FUMAR_PEQUENO: TFIBStringField
      FieldName = 'PROHIBIDO_FUMAR_PEQUENO'
      Size = 60
    end
    object QMDatosTecnicosPARO_SEGURIDAD: TFIBStringField
      FieldName = 'PARO_SEGURIDAD'
      Size = 60
    end
    object QMDatosTecnicosRETROCESO_DESCARGADOR: TFIBStringField
      FieldName = 'RETROCESO_DESCARGADOR'
      Size = 60
    end
    object QMDatosTecnicosATENCION_PELIGRO: TFIBStringField
      FieldName = 'ATENCION_PELIGRO'
      Size = 60
    end
    object QMDatosTecnicosNIVEL_PARADO: TFIBStringField
      FieldName = 'NIVEL_PARADO'
      Size = 60
    end
    object QMDatosTecnicosNIVEL_FUNCIONAMIENTO: TFIBStringField
      FieldName = 'NIVEL_FUNCIONAMIENTO'
      Size = 60
    end
    object QMDatosTecnicosFLECHA_RECTA: TFIBStringField
      FieldName = 'FLECHA_RECTA'
      Size = 60
    end
    object QMDatosTecnicosFLECHA_CURVADA: TFIBStringField
      FieldName = 'FLECHA_CURVADA'
      Size = 60
    end
    object QMDatosTecnicosUSO_GAFAS: TFIBStringField
      FieldName = 'USO_GAFAS'
      Size = 60
    end
    object QMDatosTecnicosUSO_MASCARAS: TFIBStringField
      FieldName = 'USO_MASCARAS'
      Size = 60
    end
    object QMDatosTecnicosMAQUINARIA_FUNCIONAMIENTO: TFIBStringField
      FieldName = 'MAQUINARIA_FUNCIONAMIENTO'
      Size = 60
    end
    object QMDatosTecnicosRIESGO_FUNCIONAMIENTO: TFIBStringField
      FieldName = 'RIESGO_FUNCIONAMIENTO'
      Size = 60
    end
    object QMDatosTecnicosRIESGO_ATRAPAMIENTO: TFIBStringField
      FieldName = 'RIESGO_ATRAPAMIENTO'
      Size = 60
    end
    object QMDatosTecnicosPROHIBIDO_ENGRASAR_LIMPIAR: TFIBStringField
      FieldName = 'PROHIBIDO_ENGRASAR_LIMPIAR'
      Size = 60
    end
    object QMDatosTecnicosDATOS_CALDERIN: TFIBStringField
      FieldName = 'DATOS_CALDERIN'
      Size = 60
    end
    object QMDatosTecnicosDEJAR_LIBRE_ZONA_PROYECCION: TFIBStringField
      FieldName = 'DEJAR_LIBRE_ZONA_PROYECCION'
      Size = 60
    end
    object QMDatosTecnicosHANDTE_GRANDE: TFIBStringField
      FieldName = 'HANDTE_GRANDE'
      Size = 60
    end
    object QMDatosTecnicosHANDTE_PEQUENO: TFIBStringField
      FieldName = 'HANDTE_PEQUENO'
      Size = 60
    end
    object QMDatosTecnicosLUGAR_PUESTA_MARCHA: TFIBStringField
      FieldName = 'LUGAR_PUESTA_MARCHA'
      Size = 60
    end
    object QMDatosTecnicosFECHA_PUESTA_MARCHA: TDateTimeField
      FieldName = 'FECHA_PUESTA_MARCHA'
    end
    object QMDatosTecnicosCAUDAL_BOMBA_M3_H: TFIBStringField
      FieldName = 'CAUDAL_BOMBA_M3_H'
      Size = 60
    end
    object QMDatosTecnicosPRESION_BOMBA_M: TFIBStringField
      FieldName = 'PRESION_BOMBA_M'
      Size = 60
    end
    object QMDatosTecnicosPOTENCIA_BOMBA_KW: TFIBStringField
      FieldName = 'POTENCIA_BOMBA_KW'
      Size = 60
    end
    object QMDatosTecnicosB1: TFIBStringField
      FieldName = 'B1'
      Size = 60
    end
    object QMDatosTecnicosB88: TFIBStringField
      FieldName = 'B88'
      Size = 60
    end
    object QMDatosTecnicosB76: TFIBStringField
      FieldName = 'B76'
      Size = 60
    end
    object QMDatosTecnicosB44: TFIBStringField
      FieldName = 'B44'
      Size = 60
    end
    object QMDatosTecnicosB35: TFIBStringField
      FieldName = 'B35'
      Size = 60
    end
    object QMDatosTecnicosTH: TFIBStringField
      FieldName = 'TH'
      Size = 60
    end
    object QMDatosTecnicosTL: TFIBStringField
      FieldName = 'TL'
      Size = 60
    end
    object QMDatosTecnicosB30: TFIBStringField
      FieldName = 'B30'
      Size = 60
    end
    object QMDatosTecnicosB23: TFIBStringField
      FieldName = 'B23'
      Size = 60
    end
    object QMDatosTecnicosB11: TFIBStringField
      FieldName = 'B11'
      Size = 60
    end
    object QMDatosTecnicosB3: TFIBStringField
      FieldName = 'B3'
      Size = 60
    end
    object QMDatosTecnicosB2: TFIBStringField
      FieldName = 'B2'
      Size = 60
    end
    object QMDatosTecnicosCONSUMO_MOTOR_VENTILADOR_A: TFIBStringField
      FieldName = 'CONSUMO_MOTOR_VENTILADOR_A'
      Size = 60
    end
    object QMDatosTecnicosCONSUMO_MOTOR_BOMBA_A: TFIBStringField
      FieldName = 'CONSUMO_MOTOR_BOMBA_A'
      Size = 60
    end
    object QMDatosTecnicosCONSUMO_MOTOR_REDUCTOR_A: TFIBStringField
      FieldName = 'CONSUMO_MOTOR_REDUCTOR_A'
      Size = 60
    end
    object QMDatosTecnicosCONSUMO_NOMINAL_VENTILADOR: TFIBStringField
      FieldName = 'CONSUMO_NOMINAL_VENTILADOR'
      Size = 60
    end
    object QMDatosTecnicosCONSUMO_NOMINAL_BOMBA: TFIBStringField
      FieldName = 'CONSUMO_NOMINAL_BOMBA'
      Size = 60
    end
    object QMDatosTecnicosCONSUMO_NOMINAL_MOTOR_REDUCTOR: TFIBStringField
      FieldName = 'CONSUMO_NOMINAL_MOTOR_REDUCTOR'
      Size = 60
    end
    object QMDatosTecnicosVALOR_TERMICO_VENTILADOR: TFIBStringField
      FieldName = 'VALOR_TERMICO_VENTILADOR'
      Size = 60
    end
    object QMDatosTecnicosVALOR_TERMICO_BOMBA: TFIBStringField
      FieldName = 'VALOR_TERMICO_BOMBA'
      Size = 60
    end
    object QMDatosTecnicosVALOR_MOTOR_REDUCTOR: TFIBStringField
      FieldName = 'VALOR_MOTOR_REDUCTOR'
      Size = 60
    end
    object QMDatosTecnicosCAUDAL_REAL_VENTILADOR_M3_H: TFIBStringField
      FieldName = 'CAUDAL_REAL_VENTILADOR_M3_H'
      Size = 60
    end
    object QMDatosTecnicosP_MIN_PHOTOHELIC_DAPA: TFIBStringField
      FieldName = 'P_MIN_PHOTOHELIC_DAPA'
      Size = 60
    end
    object QMDatosTecnicosP_VENTURI_DAPA: TIntegerField
      FieldName = 'P_VENTURI_DAPA'
    end
    object QMDatosTecnicosP_CARTUCHO_MANGA_DAPA: TFIBStringField
      FieldName = 'P_CARTUCHO_MANGA_DAPA'
      Size = 60
    end
    object QMDatosTecnicosPRESION_CALDERIN_BAR: TFIBStringField
      FieldName = 'PRESION_CALDERIN_BAR'
      Size = 60
    end
    object QMDatosTecnicosTIEMPO_PAUSA_EVS: TFIBStringField
      FieldName = 'TIEMPO_PAUSA_EVS'
      Size = 60
    end
    object QMDatosTecnicosTIEMPO_POST_LIMPIEZAS: TFIBStringField
      FieldName = 'TIEMPO_POST_LIMPIEZAS'
      Size = 60
    end
    object QMDatosTecnicosTIEMPO_V_DS: TFIBStringField
      FieldName = 'TIEMPO_V_DS'
      Size = 60
    end
    object QMDatosTecnicosNOMINAL_VENTILADOR_A: TFIBStringField
      FieldName = 'NOMINAL_VENTILADOR_A'
      Size = 60
    end
    object QMDatosTecnicosNOMINAL_BOMBA_A: TFIBStringField
      FieldName = 'NOMINAL_BOMBA_A'
      Size = 60
    end
    object QMDatosTecnicosNOMINAL_MOTOR_REDUCTOR_A: TFIBStringField
      FieldName = 'NOMINAL_MOTOR_REDUCTOR_A'
      Size = 60
    end
    object QMDatosTecnicosP_MAX_PHOTOHELIC_DAPA: TFIBStringField
      FieldName = 'P_MAX_PHOTOHELIC_DAPA'
      Size = 60
    end
    object QMDatosTecnicosP_TUB_DAPA: TFIBStringField
      FieldName = 'P_TUB_DAPA'
      Size = 60
    end
    object QMDatosTecnicosL_NIVEL_MM: TFIBStringField
      FieldName = 'L_NIVEL_MM'
      Size = 60
    end
    object QMDatosTecnicosPREOCAT_KG: TFIBStringField
      FieldName = 'PREOCAT_KG'
      Size = 60
    end
    object QMDatosTecnicosTIEMPO_IMPULSO_EVS: TFIBStringField
      FieldName = 'TIEMPO_IMPULSO_EVS'
      Size = 60
    end
    object QMDatosTecnicosTIEMPO_ON_DRAGA_MIN: TFIBStringField
      FieldName = 'TIEMPO_ON_DRAGA_MIN'
      Size = 60
    end
    object QMDatosTecnicosTIEMPO_OFF_DRAGA_MIN: TFIBStringField
      FieldName = 'TIEMPO_OFF_DRAGA_MIN'
      Size = 60
    end
    object QMDatosTecnicosOBSERVACIONES1: TBlobField
      FieldName = 'OBSERVACIONES1'
      Size = 8
    end
    object QMDatosTecnicosOBSERVACIONES2: TBlobField
      FieldName = 'OBSERVACIONES2'
      Size = 8
    end
    object QMDatosTecnicosOBSERVACIONES3: TBlobField
      FieldName = 'OBSERVACIONES3'
      Size = 8
    end
    object QMDatosTecnicosOBSERVACIONES4: TBlobField
      FieldName = 'OBSERVACIONES4'
      Size = 8
    end
    object QMDatosTecnicosOBSERVACIONES5: TBlobField
      FieldName = 'OBSERVACIONES5'
      Size = 8
    end
    object QMDatosTecnicosOBSERVACIONES6: TBlobField
      FieldName = 'OBSERVACIONES6'
      Size = 8
    end
    object QMDatosTecnicosOBSERVACIONES7: TBlobField
      FieldName = 'OBSERVACIONES7'
      Size = 8
    end
    object QMDatosTecnicosOBSERVACIONES8: TBlobField
      FieldName = 'OBSERVACIONES8'
      Size = 8
    end
    object QMDatosTecnicosFOTO1: TFIBStringField
      FieldName = 'FOTO1'
      Size = 35
    end
    object QMDatosTecnicosFOTO2: TFIBStringField
      FieldName = 'FOTO2'
      Size = 35
    end
    object QMDatosTecnicosAPLICACION: TFIBStringField
      FieldName = 'APLICACION'
      Size = 60
    end
  end
  object DSQMDatosTecnicos: TDataSource
    DataSet = QMDatosTecnicos
    Left = 184
    Top = 32
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 336
    Top = 32
  end
  object xDadesOP: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT ORD.RESPONSABLE, T.NOMBRE_R_SOCIAL TITULO, ORD.PEDIDO, OR' +
        'D.FECHA_PED'
      'FROM PRO_ORD ORD'
      
        'LEFT JOIN OPE_EMPLEADO OPE ON (OPE.EMPRESA = ORD.EMPRESA AND OPE' +
        '.EMPLEADO = ORD.RESPONSABLE)'
      'LEFT JOIN SYS_TERCEROS T ON OPE.TERCERO = T.TERCERO'
      'WHERE'
      'ORD.ID_ORDEN = :ID_ORDEN')
    UniDirectional = False
    DataSource = DSQMDatosTecnicos
    Left = 48
    Top = 80
    object xDadesOPRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
    end
    object xDadesOPTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 60
    end
    object xDadesOPPEDIDO: TIntegerField
      FieldName = 'PEDIDO'
    end
    object xDadesOPFECHA_PED: TDateTimeField
      FieldName = 'FECHA_PED'
    end
  end
  object DSxDadesOP: TDataSource
    DataSet = xDadesOP
    Left = 184
    Top = 80
  end
  object xExisteOF: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select count(*) from pro_ord'
      'where id_orden=?id_orden')
    UniDirectional = False
    DataSource = DSQMDatosTecnicos
    Left = 48
    Top = 128
    object xExisteOFCOUNT: TIntegerField
      FieldName = 'COUNT'
    end
  end
end
