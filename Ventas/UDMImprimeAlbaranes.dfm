object DMImprimeAlbaranes: TDMImprimeAlbaranes
  OldCreateOrder = False
  OnCreate = DMImprimeAlbaranesCreate
  Left = 563
  Top = 297
  Height = 153
  Width = 200
  object DSQMAlbaranes: TDataSource
    DataSet = QMAlbaranes
    Left = 112
    Top = 24
  end
  object QMAlbaranes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_ALBARAN'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT   *'
      'FROM  VER_CABECERAS_ALBARAN'
      'WHERE EMPRESA   = ?EMPRESA   AND'
      '               EJERCICIO = ?EJERCICIO AND'
      '               CANAL     = ?CANAL     AND'
      '               TIPO      = '#39'ALB'#39'      AND'
      '               MODIFICA_DOC = 0'
      'ORDER BY SERIE, RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CABECERAS_ALBARAN CAB INDEX (GES_CABECERAS_' +
        'S_IDX2),'
      
        '                 VER_CABECERAS_ALBARAN ALB INDEX (GES_CABECERAS_' +
        'S_ALB_ID),'
      
        '                 VER_CABECERAS_ALBARAN TER INDEX (PK_SYS_TERCERO' +
        'S)))                ')
    OnCalcFields = QMAlbaranesCalcFields
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CABECERAS_ALBARAN'
    UpdateTransaction = TLocal
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
      OnGetText = QMAlbaranesTOTAL_A_COBRARGetText
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
    object QMAlbaranesEMAIL: TStringField
      DisplayLabel = 'Correo Electr'#243'nico'
      FieldKind = fkCalculated
      FieldName = 'EMAIL'
      Size = 100
      Calculated = True
    end
    object QMAlbaranesPEDIDO_CLIENTE: TFIBStringField
      DisplayLabel = 'Nro. Pedido'
      FieldName = 'PEDIDO_CLIENTE'
      Size = 60
    end
    object QMAlbaranesZ_OBSERVACION: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'Z_OBSERVACION'
      Size = 256
    end
    object QMAlbaranesFOLIO: TIntegerField
      DisplayLabel = 'Folio'
      FieldName = 'FOLIO'
    end
    object QMAlbaranesTIPO_DOC_TRIBUTARIO: TFIBStringField
      DisplayLabel = 'Tipo Doc. Trib.'
      FieldName = 'TIPO_DOC_TRIBUTARIO'
      Size = 3
    end
    object QMAlbaranesID_FICHA_TECNICA: TIntegerField
      DisplayLabel = 'Id Ficha Tec.'
      FieldName = 'ID_FICHA_TECNICA'
    end
  end
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
end
