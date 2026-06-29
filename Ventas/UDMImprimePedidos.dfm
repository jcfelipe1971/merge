object DMImprimePedidos: TDMImprimePedidos
  OldCreateOrder = False
  OnCreate = DMImprimePedidosCreate
  Left = 563
  Top = 297
  Height = 204
  Width = 331
  object DSQMPedidos: TDataSource
    DataSet = QMPedidos
    Left = 112
    Top = 24
  end
  object QMPedidos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT  *'
      'FROM VER_CABECERAS_PEDIDO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT   *'
      'FROM  VER_CABECERAS_PEDIDO'
      'WHERE EMPRESA   = ?EMPRESA   AND'
      '               EJERCICIO = ?EJERCICIO AND'
      '               CANAL     = ?CANAL     AND'
      '               TIPO      = '#39'PEC'#39'      AND'
      '               MODIFICA_DOC = 0'
      'ORDER BY SERIE, RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CABECERAS_PEDIDO CAB INDEX (GES_CABECERAS_S' +
        '_IDX2),'
      
        '                 VER_CABECERAS_PEDIDO PED INDEX (GES_CABECERAS_S' +
        '_PED_ID),'
      
        '                 VER_CABECERAS_PEDIDO TER INDEX (PK_SYS_TERCEROS' +
        ')))                ')
    OnCalcFields = QMPedidosCalcFields
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
    TableName = 'VER_CABECERAS_PEDIDO'
    UpdateTransaction = TLocal
    Left = 32
    Top = 24
    object QMPedidosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPedidosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPedidosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPedidosSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMPedidosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMPedidosRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMPedidosALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMPedidosMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMPedidosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMPedidosTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMPedidosTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMPedidosDIRECCION: TIntegerField
      DisplayLabel = 'Dir.'
      FieldName = 'DIRECCION'
    end
    object QMPedidosCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMPedidosCONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
    end
    object QMPedidosSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMPedidosFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMPedidosCAMPANYA: TIntegerField
      DisplayLabel = 'Campa'#241'a'
      FieldName = 'CAMPANYA'
    end
    object QMPedidosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMPedidosESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMPedidosBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object QMPedidosLINEAS: TIntegerField
      DisplayLabel = 'L'#237'neas'
      FieldName = 'LINEAS'
    end
    object QMPedidosBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object QMPedidosI_DTO_LINEAS: TFloatField
      DisplayLabel = 'Imp. Dto. Lin.'
      FieldName = 'I_DTO_LINEAS'
    end
    object QMPedidosS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object QMPedidosM_BRUTO: TFloatField
      DisplayLabel = 'M. Bruto'
      FieldName = 'M_BRUTO'
    end
    object QMPedidosC_TOTAL: TFloatField
      DisplayLabel = 'C. Total'
      FieldName = 'C_TOTAL'
    end
    object QMPedidosAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMPedidosS_CUOTA_IVA: TFloatField
      DisplayLabel = 'S. Cuota IVA'
      FieldName = 'S_CUOTA_IVA'
    end
    object QMPedidosS_CUOTA_RE: TFloatField
      DisplayLabel = 'S. Cuota RE'
      FieldName = 'S_CUOTA_RE'
    end
    object QMPedidosB_DTO_LINEAS: TFloatField
      DisplayLabel = 'B. Dto. Lineas'
      FieldName = 'B_DTO_LINEAS'
    end
    object QMPedidosDTO_PP: TFloatField
      DisplayLabel = 'Dto. PP'
      FieldName = 'DTO_PP'
    end
    object QMPedidosDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial.'
      FieldName = 'DTO_CIAL'
    end
    object QMPedidosI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial.'
      FieldName = 'I_DTO_CIAL'
    end
    object QMPedidosI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. PP'
      FieldName = 'I_DTO_PP'
    end
    object QMPedidosB_COMISION: TFloatField
      DisplayLabel = 'B. Comisi'#243'n'
      FieldName = 'B_COMISION'
    end
    object QMPedidosI_COMISION: TFloatField
      DisplayLabel = 'Imp. Comisi'#243'n'
      FieldName = 'I_COMISION'
    end
    object QMPedidosPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object QMPedidosI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Financ.'
      FieldName = 'I_FINANCIACION'
    end
    object QMPedidosLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object QMPedidosENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMPedidosFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'F. Prev. Entr.'
      FieldName = 'FECHA_ENTREGA_PREV'
    end
    object QMPedidosFECHA_REC_CAB: TDateTimeField
      DisplayLabel = 'Fecha Rec.'
      FieldName = 'FECHA_REC_CAB'
    end
    object QMPedidosSERVIDO: TIntegerField
      DisplayLabel = 'Servido'
      FieldName = 'SERVIDO'
    end
    object QMPedidosNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nom. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMPedidosPORTES: TIntegerField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
    end
    object QMPedidosTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMPedidosAGRUPACION_KRI: TIntegerField
      DisplayLabel = 'Agrup.'
      FieldName = 'AGRUPACION_KRI'
    end
    object QMPedidosID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMPedidosIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMPedidosUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object QMPedidosMARGEN_KRI: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN_KRI'
    end
    object QMPedidosTIPO_PORTES: TIntegerField
      DisplayLabel = 'Tipo Portes'
      FieldName = 'TIPO_PORTES'
    end
    object QMPedidosPOR_PORTES: TFloatField
      DisplayLabel = '% Portes'
      FieldName = 'POR_PORTES'
    end
    object QMPedidosI_PORTES: TFloatField
      DisplayLabel = 'Imp.Portes'
      FieldName = 'I_PORTES'
    end
    object QMPedidosI_PORTES_CANAL: TFloatField
      DisplayLabel = 'Imp. Portes Canal'
      FieldName = 'I_PORTES_CANAL'
    end
    object QMPedidosCAMBIO_FIJO: TIntegerField
      DisplayLabel = 'Cambio Fijo'
      FieldName = 'CAMBIO_FIJO'
    end
    object QMPedidosVALOR_CAMB_FIJO: TFloatField
      DisplayLabel = 'Valor Camb. Fijo'
      FieldName = 'VALOR_CAMB_FIJO'
    end
    object QMPedidosPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMPedidosNOTAS_INTERNAS_KRI: TBlobField
      DisplayLabel = 'Notas Int.'
      FieldName = 'NOTAS_INTERNAS_KRI'
      Size = 8
    end
    object QMPedidosTIPO_LINEA_KRI: TIntegerField
      DisplayLabel = 'Tipo L'#237'nea'
      FieldName = 'TIPO_LINEA_KRI'
    end
    object QMPedidosFECHA_CLIENTE: TDateTimeField
      DisplayLabel = 'Fecha Cliente'
      FieldName = 'FECHA_CLIENTE'
    end
    object QMPedidosTIT_CONTACTO: TFIBStringField
      DisplayLabel = 'Nombre Contacto'
      FieldName = 'TIT_CONTACTO'
      Size = 81
    end
    object QMPedidosFECHA_CREACION_KRI: TDateTimeField
      DisplayLabel = 'Fecha Creaci'#243'n'
      FieldName = 'FECHA_CREACION_KRI'
    end
    object QMPedidosPEDIDO_CLIENTE: TFIBStringField
      DisplayLabel = 'Nro. Pedido'
      FieldName = 'PEDIDO_CLIENTE'
      Size = 60
    end
    object QMPedidosRANGO: TIntegerField
      DisplayLabel = 'Rango'
      FieldName = 'RANGO'
    end
    object QMPedidosINDICE: TIntegerField
      DisplayLabel = 'Indice'
      FieldName = 'INDICE'
    end
    object QMPedidosTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
    end
    object QMPedidosEMAIL: TStringField
      DisplayLabel = 'Correo electr'#243'nico'
      FieldKind = fkCalculated
      FieldName = 'EMAIL'
      Size = 100
      Calculated = True
    end
    object QMPedidosZ_OBSERVACION: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'Z_OBSERVACION'
      Size = 256
    end
    object QMPedidosID_FICHA_TECNICA: TIntegerField
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
    Left = 200
    Top = 24
  end
end
