object DMImprimeCartaPortes: TDMImprimeCartaPortes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 205
  Top = 106
  Height = 165
  Width = 215
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 74
    Top = 76
  end
  object QMAlbaranes: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      
        '  A.*, COALESCE((SELECT 1 FROM GES_CABECERAS_S_CGA WHERE ID_S = ' +
        'A.ID_S), 0) AS CARTA_PORTE'
      'FROM VER_CABECERAS_ALBARAN A'
      'WHERE'
      '  A.EMPRESA=?EMPRESA AND '
      '  A.EJERCICIO=?EJERCICIO AND '
      '  A.CANAL=?CANAL AND '
      '  A.SERIE=?SERIE AND '
      '  A.TIPO=?TIPO AND '
      '  A.RIG=?RIG ')
    SelectSQL.Strings = (
      
        'SELECT A.*, COALESCE((SELECT 1 FROM GES_CABECERAS_S_CGA WHERE ID' +
        '_S = A.ID_S), 0) AS CARTA_PORTE'
      'FROM VER_CABECERAS_ALBARAN A'
      'WHERE'
      'A.EMPRESA = :EMPRESA AND'
      'A.EJERCICIO = :EJERCICIO AND'
      'A.CANAL = :CANAL AND'
      'A.TIPO = '#39'ALB'#39' AND'
      'A.ESTADO = 0 AND'
      'NOT EXISTS(SELECT ID_S'
      '           FROM GES_CABECERAS_S_CGA'
      '           WHERE'
      '           ID_S = A.ID_S)'
      'ORDER BY A.EJERCICIO, A.SERIE, A.RIG')
    UniDirectional = False
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CABECERAS_ALBARAN CAB INDEX (GES_CABECERAS_' +
        'S_IDX2),'
      
        '                 VER_CABECERAS_ALBARAN ALB INDEX (GES_CABECERAS_' +
        'S_ALB_ID),'
      
        '                 VER_CABECERAS_ALBARAN TER INDEX (PK_SYS_TERCERO' +
        'S)))                ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG ')
    Opciones = []
    AutoSQLdeVistas = True
    TableName = 'VER_CABECERAS_ALBARAN'
    Left = 32
    Top = 24
    object QMAlbaranesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAlbaranesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMAlbaranesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMAlbaranesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMAlbaranesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMAlbaranesRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMAlbaranesALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMAlbaranesMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMAlbaranesFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMAlbaranesTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMAlbaranesTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMAlbaranesDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object QMAlbaranesCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMAlbaranesSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Ref.'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMAlbaranesFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMAlbaranesCAMPANYA: TIntegerField
      DisplayLabel = 'Campa'#241'a'
      FieldName = 'CAMPANYA'
    end
    object QMAlbaranesNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMAlbaranesESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMAlbaranesBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object QMAlbaranesLINEAS: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINEAS'
    end
    object QMAlbaranesBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object QMAlbaranesI_DTO_LINEAS: TFloatField
      DisplayLabel = 'Imp. Dto. Lin.'
      FieldName = 'I_DTO_LINEAS'
    end
    object QMAlbaranesS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object QMAlbaranesM_BRUTO: TFloatField
      DisplayLabel = 'M. Bruto'
      FieldName = 'M_BRUTO'
    end
    object QMAlbaranesC_TOTAL: TFloatField
      DisplayLabel = 'C. Total'
      FieldName = 'C_TOTAL'
    end
    object QMAlbaranesAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMAlbaranesS_CUOTA_IVA: TFloatField
      DisplayLabel = 'S. Cuota IVA'
      FieldName = 'S_CUOTA_IVA'
    end
    object QMAlbaranesS_CUOTA_RE: TFloatField
      DisplayLabel = 'S. Cuota RE'
      FieldName = 'S_CUOTA_RE'
    end
    object QMAlbaranesB_DTO_LINEAS: TFloatField
      DisplayLabel = 'B. Dto. Lin.'
      FieldName = 'B_DTO_LINEAS'
    end
    object QMAlbaranesDTO_PP: TFloatField
      DisplayLabel = 'Dto. PP'
      FieldName = 'DTO_PP'
    end
    object QMAlbaranesDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial.'
      FieldName = 'DTO_CIAL'
    end
    object QMAlbaranesI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial.'
      FieldName = 'I_DTO_CIAL'
    end
    object QMAlbaranesI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. PP.'
      FieldName = 'I_DTO_PP'
    end
    object QMAlbaranesB_COMISION: TFloatField
      DisplayLabel = 'B. Comision'
      FieldName = 'B_COMISION'
    end
    object QMAlbaranesI_COMISION: TFloatField
      DisplayLabel = 'Imp. Comision'
      FieldName = 'I_COMISION'
    end
    object QMAlbaranesPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object QMAlbaranesI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Financ.'
      FieldName = 'I_FINANCIACION'
    end
    object QMAlbaranesLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMAlbaranesENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMAlbaranesTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transp.'
      FieldName = 'TRANSPORTISTA'
    end
    object QMAlbaranesI_BASE_RETENCION: TFloatField
      DisplayLabel = 'Imp. Base Ret.'
      FieldName = 'I_BASE_RETENCION'
    end
    object QMAlbaranesP_RETENCION: TFloatField
      DisplayLabel = '% Ret.'
      FieldName = 'P_RETENCION'
    end
    object QMAlbaranesI_RETENCION: TFloatField
      DisplayLabel = 'Imp. Ret.'
      FieldName = 'I_RETENCION'
    end
    object QMAlbaranesTIPO_IRPF: TIntegerField
      DisplayLabel = 'Tipo IRPF'
      FieldName = 'TIPO_IRPF'
    end
    object QMAlbaranesA_IRPF: TIntegerField
      DisplayLabel = 'A. IRPF'
      FieldName = 'A_IRPF'
    end
    object QMAlbaranesTOTAL_A_COBRAR: TFloatField
      DisplayLabel = 'Total a Cobrar'
      FieldName = 'TOTAL_A_COBRAR'
    end
    object QMAlbaranesNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMAlbaranesPORTES: TIntegerField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
    end
    object QMAlbaranesTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMAlbaranesID_S: TIntegerField
      DisplayLabel = 'ID S.'
      FieldName = 'ID_S'
    end
    object QMAlbaranesCONTACTO: TIntegerField
      FieldName = 'CONTACTO'
    end
    object QMAlbaranesBULTOS_KRI: TIntegerField
      FieldName = 'BULTOS_KRI'
    end
    object QMAlbaranesGARANTIA: TIntegerField
      FieldName = 'GARANTIA'
    end
    object QMAlbaranesAGRUPACION_KRI: TIntegerField
      FieldName = 'AGRUPACION_KRI'
    end
    object QMAlbaranesALMACEN_DEPOSITO: TFIBStringField
      FieldName = 'ALMACEN_DEPOSITO'
      Size = 3
    end
    object QMAlbaranesNUM_MOV_DEPOSITO: TIntegerField
      FieldName = 'NUM_MOV_DEPOSITO'
    end
    object QMAlbaranesDEPOSITO: TIntegerField
      FieldName = 'DEPOSITO'
    end
    object QMAlbaranesDEVOLUCION_DEPOSITO: TIntegerField
      FieldName = 'DEVOLUCION_DEPOSITO'
    end
    object QMAlbaranesIDIOMA: TFIBStringField
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMAlbaranesTIPO_PORTES: TIntegerField
      FieldName = 'TIPO_PORTES'
    end
    object QMAlbaranesPOR_PORTES: TFloatField
      FieldName = 'POR_PORTES'
    end
    object QMAlbaranesI_PORTES: TFloatField
      FieldName = 'I_PORTES'
    end
    object QMAlbaranesI_PORTES_CANAL: TFloatField
      FieldName = 'I_PORTES_CANAL'
    end
    object QMAlbaranesRANGO: TIntegerField
      FieldName = 'RANGO'
    end
    object QMAlbaranesINDICE: TIntegerField
      FieldName = 'INDICE'
    end
    object QMAlbaranesCAMBIO_FIJO: TIntegerField
      FieldName = 'CAMBIO_FIJO'
    end
    object QMAlbaranesVALOR_CAMB_FIJO: TFloatField
      FieldName = 'VALOR_CAMB_FIJO'
    end
    object QMAlbaranesPROYECTO: TIntegerField
      FieldName = 'PROYECTO'
    end
    object QMAlbaranesNOTAS_INTERNAS_KRI: TBlobField
      FieldName = 'NOTAS_INTERNAS_KRI'
      Size = 8
    end
    object QMAlbaranesTIPO_LINEA_KRI: TIntegerField
      FieldName = 'TIPO_LINEA_KRI'
    end
    object QMAlbaranesTIT_CONTACTO: TFIBStringField
      FieldName = 'TIT_CONTACTO'
      Size = 81
    end
    object QMAlbaranesMODIFICA_DOC: TIntegerField
      FieldName = 'MODIFICA_DOC'
    end
    object QMAlbaranesALBARAN_VALORADO: TIntegerField
      FieldName = 'ALBARAN_VALORADO'
    end
    object QMAlbaranesFECHA_SERVIDO: TDateTimeField
      FieldName = 'FECHA_SERVIDO'
    end
    object QMAlbaranesCARTA_PORTE: TIntegerField
      DisplayLabel = 'Carta Porte'
      FieldName = 'CARTA_PORTE'
    end
  end
  object DSQMAlbaranes: TDataSource
    DataSet = QMAlbaranes
    Left = 112
    Top = 24
  end
end
