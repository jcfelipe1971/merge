object DMENCFDOM: TDMENCFDOM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 452
  Top = 237
  Height = 543
  Width = 610
  object xFacturaCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_FACTURA'
      'WHERE'
      'ID_S = :ID_S')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_FACTURA'
      'WHERE'
      'ID_S = :ID_S')
    UniDirectional = False
    AfterOpen = xFacturaCabeceraAfterOpen
    BeforeClose = xFacturaCabeceraBeforeClose
    Left = 48
    Top = 16
    object xFacturaCabeceraEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xFacturaCabeceraEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object xFacturaCabeceraCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object xFacturaCabeceraSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object xFacturaCabeceraTIPO: TFIBStringField
      FieldName = 'TIPO'
      Size = 3
    end
    object xFacturaCabeceraRIG: TIntegerField
      FieldName = 'RIG'
    end
    object xFacturaCabeceraALMACEN: TFIBStringField
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xFacturaCabeceraMONEDA: TFIBStringField
      FieldName = 'MONEDA'
      Size = 3
    end
    object xFacturaCabeceraFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object xFacturaCabeceraTERCERO: TIntegerField
      FieldName = 'TERCERO'
    end
    object xFacturaCabeceraTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 60
    end
    object xFacturaCabeceraDIRECCION: TIntegerField
      FieldName = 'DIRECCION'
    end
    object xFacturaCabeceraDIR_COMPLETA: TFIBStringField
      FieldName = 'DIR_COMPLETA'
      Size = 76
    end
    object xFacturaCabeceraDIR_NOMBRE_2: TFIBStringField
      FieldName = 'DIR_NOMBRE_2'
      Size = 40
    end
    object xFacturaCabeceraCODIGO_POSTAL: TFIBStringField
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object xFacturaCabeceraLOCALIDAD: TFIBStringField
      FieldName = 'LOCALIDAD'
      Size = 40
    end
    object xFacturaCabeceraCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object xFacturaCabeceraCONTACTO: TIntegerField
      FieldName = 'CONTACTO'
    end
    object xFacturaCabeceraSU_REFERENCIA: TFIBStringField
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xFacturaCabeceraFORMA_PAGO: TFIBStringField
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xFacturaCabeceraBANCO: TIntegerField
      FieldName = 'BANCO'
    end
    object xFacturaCabeceraCAMPANYA: TIntegerField
      FieldName = 'CAMPANYA'
    end
    object xFacturaCabeceraNOTAS: TBlobField
      FieldName = 'NOTAS'
      Size = 8
    end
    object xFacturaCabeceraESTADO: TIntegerField
      FieldName = 'ESTADO'
    end
    object xFacturaCabeceraBULTOS: TIntegerField
      FieldName = 'BULTOS'
    end
    object xFacturaCabeceraLINEAS: TIntegerField
      FieldName = 'LINEAS'
    end
    object xFacturaCabeceraBRUTO: TFloatField
      FieldName = 'BRUTO'
    end
    object xFacturaCabeceraI_DTO_LINEAS: TFloatField
      FieldName = 'I_DTO_LINEAS'
    end
    object xFacturaCabeceraS_BASES: TFloatField
      FieldName = 'S_BASES'
    end
    object xFacturaCabeceraM_BRUTO: TFloatField
      FieldName = 'M_BRUTO'
    end
    object xFacturaCabeceraC_TOTAL: TFloatField
      FieldName = 'C_TOTAL'
    end
    object xFacturaCabeceraAGENTE: TIntegerField
      FieldName = 'AGENTE'
    end
    object xFacturaCabeceraS_CUOTA_IVA: TFloatField
      FieldName = 'S_CUOTA_IVA'
    end
    object xFacturaCabeceraS_CUOTA_RE: TFloatField
      FieldName = 'S_CUOTA_RE'
    end
    object xFacturaCabeceraB_DTO_LINEAS: TFloatField
      FieldName = 'B_DTO_LINEAS'
    end
    object xFacturaCabeceraDTO_PP: TFloatField
      FieldName = 'DTO_PP'
    end
    object xFacturaCabeceraDTO_CIAL: TFloatField
      FieldName = 'DTO_CIAL'
    end
    object xFacturaCabeceraI_DTO_CIAL: TFloatField
      FieldName = 'I_DTO_CIAL'
    end
    object xFacturaCabeceraI_DTO_PP: TFloatField
      FieldName = 'I_DTO_PP'
    end
    object xFacturaCabeceraB_COMISION: TFloatField
      FieldName = 'B_COMISION'
    end
    object xFacturaCabeceraI_COMISION: TFloatField
      FieldName = 'I_COMISION'
    end
    object xFacturaCabeceraPOR_FINANCIACION: TFloatField
      FieldName = 'POR_FINANCIACION'
    end
    object xFacturaCabeceraI_FINANCIACION: TFloatField
      FieldName = 'I_FINANCIACION'
    end
    object xFacturaCabeceraLIQUIDO: TFloatField
      FieldName = 'LIQUIDO'
    end
    object xFacturaCabeceraENTRADA: TIntegerField
      FieldName = 'ENTRADA'
    end
    object xFacturaCabeceraTRANSPORTISTA: TIntegerField
      FieldName = 'TRANSPORTISTA'
    end
    object xFacturaCabeceraI_BASE_RETENCION: TFloatField
      FieldName = 'I_BASE_RETENCION'
    end
    object xFacturaCabeceraP_RETENCION: TFloatField
      FieldName = 'P_RETENCION'
    end
    object xFacturaCabeceraI_RETENCION: TFloatField
      FieldName = 'I_RETENCION'
    end
    object xFacturaCabeceraFUERZA_VENCIMIENTOS: TIntegerField
      FieldName = 'FUERZA_VENCIMIENTOS'
    end
    object xFacturaCabeceraRIC: TIntegerField
      FieldName = 'RIC'
    end
    object xFacturaCabeceraTIPO_IRPF: TIntegerField
      FieldName = 'TIPO_IRPF'
    end
    object xFacturaCabeceraA_IRPF: TIntegerField
      FieldName = 'A_IRPF'
    end
    object xFacturaCabeceraTOTAL_A_COBRAR: TFloatField
      FieldName = 'TOTAL_A_COBRAR'
    end
    object xFacturaCabeceraDEVOLUCION: TIntegerField
      FieldName = 'DEVOLUCION'
    end
    object xFacturaCabeceraSIN_DETALLE: TIntegerField
      FieldName = 'SIN_DETALLE'
    end
    object xFacturaCabeceraASIENTO: TIntegerField
      FieldName = 'ASIENTO'
    end
    object xFacturaCabeceraNOMBRE_COMERCIAL: TFIBStringField
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xFacturaCabeceraREGISTRO: TIntegerField
      FieldName = 'REGISTRO'
    end
    object xFacturaCabeceraPORTES: TIntegerField
      FieldName = 'PORTES'
    end
    object xFacturaCabeceraI_FINANCIACION_CANAL: TFloatField
      FieldName = 'I_FINANCIACION_CANAL'
    end
    object xFacturaCabeceraTARIFA: TFIBStringField
      FieldName = 'TARIFA'
      Size = 3
    end
    object xFacturaCabeceraCENTRO_COSTE: TIntegerField
      FieldName = 'CENTRO_COSTE'
    end
    object xFacturaCabeceraID_S: TIntegerField
      FieldName = 'ID_S'
    end
    object xFacturaCabeceraPROCESO_AUTO: TIntegerField
      FieldName = 'PROCESO_AUTO'
    end
    object xFacturaCabeceraFECHA_ENTREGA: TDateTimeField
      FieldName = 'FECHA_ENTREGA'
    end
    object xFacturaCabeceraIDIOMA: TFIBStringField
      FieldName = 'IDIOMA'
      Size = 3
    end
    object xFacturaCabeceraRECT: TIntegerField
      FieldName = 'RECT'
    end
    object xFacturaCabeceraID_RECT: TIntegerField
      FieldName = 'ID_RECT'
    end
    object xFacturaCabeceraTIPO_PORTES: TIntegerField
      FieldName = 'TIPO_PORTES'
    end
    object xFacturaCabeceraPOR_PORTES: TFloatField
      FieldName = 'POR_PORTES'
    end
    object xFacturaCabeceraI_PORTES: TFloatField
      FieldName = 'I_PORTES'
    end
    object xFacturaCabeceraI_PORTES_CANAL: TFloatField
      FieldName = 'I_PORTES_CANAL'
    end
    object xFacturaCabeceraRANGO: TIntegerField
      FieldName = 'RANGO'
    end
    object xFacturaCabeceraINDICE: TIntegerField
      FieldName = 'INDICE'
    end
    object xFacturaCabeceraCAMBIO_FIJO: TIntegerField
      FieldName = 'CAMBIO_FIJO'
    end
    object xFacturaCabeceraVALOR_CAMB_FIJO: TFloatField
      FieldName = 'VALOR_CAMB_FIJO'
    end
    object xFacturaCabeceraVALOR_CAMB_FIJO_INV: TFloatField
      FieldName = 'VALOR_CAMB_FIJO_INV'
    end
    object xFacturaCabeceraPROYECTO: TIntegerField
      FieldName = 'PROYECTO'
    end
    object xFacturaCabeceraNOTAS_INTERNAS_KRI: TBlobField
      FieldName = 'NOTAS_INTERNAS_KRI'
      Size = 8
    end
    object xFacturaCabeceraTIPO_LINEA_KRI: TIntegerField
      FieldName = 'TIPO_LINEA_KRI'
    end
    object xFacturaCabeceraREGISTRO_CARTERA: TIntegerField
      FieldName = 'REGISTRO_CARTERA'
    end
    object xFacturaCabeceraVENCIMIENTO: TDateTimeField
      FieldName = 'VENCIMIENTO'
    end
    object xFacturaCabeceraTIT_CONTACTO: TFIBStringField
      FieldName = 'TIT_CONTACTO'
      Size = 81
    end
    object xFacturaCabeceraMODO_IVA: TIntegerField
      FieldName = 'MODO_IVA'
    end
    object xFacturaCabeceraZ_PREFIJO_NCF: TFIBStringField
      FieldName = 'Z_PREFIJO_NCF'
      Size = 11
    end
    object xFacturaCabeceraZ_CONTADOR_NCF: TFIBStringField
      FieldName = 'Z_CONTADOR_NCF'
      Size = 8
    end
    object xFacturaCabeceraZ_TIPO_NCF: TIntegerField
      FieldName = 'Z_TIPO_NCF'
    end
    object xFacturaCabeceraCADENA_ORIGINAL: TBlobField
      FieldName = 'CADENA_ORIGINAL'
      Size = 8
    end
    object xFacturaCabeceraSELLO_DIGITAL: TBlobField
      FieldName = 'SELLO_DIGITAL'
      Size = 8
    end
    object xFacturaCabeceraCERTIFICADO: TBlobField
      FieldName = 'CERTIFICADO'
      Size = 8
    end
    object xFacturaCabeceraFICHERO: TBlobField
      FieldName = 'FICHERO'
      Size = 8
    end
    object xFacturaCabeceraMODIFICA_DOC: TIntegerField
      FieldName = 'MODIFICA_DOC'
    end
    object xFacturaCabeceraNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object xFacturaCabeceraRECC: TIntegerField
      FieldName = 'RECC'
    end
    object xFacturaCabeceraIMPORTE_ANTICIPO: TFloatField
      FieldName = 'IMPORTE_ANTICIPO'
    end
    object xFacturaCabeceraSALDO_ANTICIPO_A_CIERRE_FAC: TFloatField
      FieldName = 'SALDO_ANTICIPO_A_CIERRE_FAC'
    end
    object xFacturaCabeceraUSUARIO: TIntegerField
      FieldName = 'USUARIO'
    end
    object xFacturaCabeceraEMPLEADO_RESPONSABLE: TIntegerField
      FieldName = 'EMPLEADO_RESPONSABLE'
    end
    object xFacturaCabeceraEMPLEADO_ATENCION: TIntegerField
      FieldName = 'EMPLEADO_ATENCION'
    end
    object xFacturaCabeceraINVERSION_SUJETO_PASIVO: TIntegerField
      FieldName = 'INVERSION_SUJETO_PASIVO'
    end
    object xFacturaCabeceraTOTAL_ANTICIPADO: TFloatField
      FieldName = 'TOTAL_ANTICIPADO'
    end
    object xFacturaCabeceraUNIDADES: TFloatField
      FieldName = 'UNIDADES'
    end
    object xFacturaCabeceraPOR_PROPINA: TFloatField
      FieldName = 'POR_PROPINA'
    end
    object xFacturaCabeceraPOR_RETENCION_GARANTIA: TFloatField
      FieldName = 'POR_RETENCION_GARANTIA'
    end
    object xFacturaCabeceraI_RETENCION_GARANTIA: TFloatField
      FieldName = 'I_RETENCION_GARANTIA'
    end
    object xFacturaCabeceraFECHA_RETENCION_GARANTIA: TDateTimeField
      FieldName = 'FECHA_RETENCION_GARANTIA'
    end
    object xFacturaCabeceraID_DEV: TIntegerField
      FieldName = 'ID_DEV'
    end
    object xFacturaCabeceraID_TIPO_GIRO_CLIENTE: TIntegerField
      FieldName = 'ID_TIPO_GIRO_CLIENTE'
    end
    object xFacturaCabeceraCODIGO_GIRO_CLIENTE: TIntegerField
      FieldName = 'CODIGO_GIRO_CLIENTE'
    end
    object xFacturaCabeceraID_TIPO_GIRO_EMPRESA: TIntegerField
      FieldName = 'ID_TIPO_GIRO_EMPRESA'
    end
    object xFacturaCabeceraCODIGO_GIRO_EMPRESA: TIntegerField
      FieldName = 'CODIGO_GIRO_EMPRESA'
    end
    object xFacturaCabeceraTIPO_VENTA: TIntegerField
      FieldName = 'TIPO_VENTA'
    end
    object xFacturaCabeceraCODIGO_RESPUESTA_SII: TBlobField
      FieldName = 'CODIGO_RESPUESTA_SII'
      Size = 8
    end
    object xFacturaCabeceraID_TIPO_DESPACHO: TIntegerField
      FieldName = 'ID_TIPO_DESPACHO'
    end
    object xFacturaCabeceraFECHA_CON: TDateTimeField
      FieldName = 'FECHA_CON'
    end
    object xFacturaCabeceraFECHA_ENTREGA_REPARTO: TDateTimeField
      FieldName = 'FECHA_ENTREGA_REPARTO'
    end
    object xFacturaCabeceraZ_OBSERVACION: TFIBStringField
      FieldName = 'Z_OBSERVACION'
      Size = 256
    end
    object xFacturaCabeceraENTRADA_FACTURACION: TIntegerField
      FieldName = 'ENTRADA_FACTURACION'
    end
    object xFacturaCabeceraPEDIDO_CLIENTE: TFIBStringField
      FieldName = 'PEDIDO_CLIENTE'
      Size = 60
    end
    object xFacturaCabeceraEMPAQUETADO_EMPRESA: TIntegerField
      FieldName = 'EMPAQUETADO_EMPRESA'
    end
    object xFacturaCabeceraDIR_RECOGIDA_MANUAL: TBlobField
      FieldName = 'DIR_RECOGIDA_MANUAL'
      Size = 8
    end
    object xFacturaCabeceraDIR_ENTREGA_MANUAL: TBlobField
      FieldName = 'DIR_ENTREGA_MANUAL'
      Size = 8
    end
    object xFacturaCabeceraEQUIPO_RECOGIDA: TFIBStringField
      FieldName = 'EQUIPO_RECOGIDA'
      Size = 40
    end
    object xFacturaCabeceraEQUIPO_ENTREGA: TFIBStringField
      FieldName = 'EQUIPO_ENTREGA'
      Size = 40
    end
    object xFacturaCabeceraMATRICULA_RECOGIDA: TFIBStringField
      FieldName = 'MATRICULA_RECOGIDA'
      Size = 40
    end
    object xFacturaCabeceraMATRICULA_ENTREGA: TFIBStringField
      FieldName = 'MATRICULA_ENTREGA'
      Size = 40
    end
    object xFacturaCabeceraFECHA_RECOGIDA_MANUAL: TDateTimeField
      FieldName = 'FECHA_RECOGIDA_MANUAL'
    end
    object xFacturaCabeceraFECHA_ENTREGA_MANUAL: TDateTimeField
      FieldName = 'FECHA_ENTREGA_MANUAL'
    end
    object xFacturaCabeceraSII_ID_DOC_REF: TIntegerField
      FieldName = 'SII_ID_DOC_REF'
    end
    object xFacturaCabeceraUSUARIO_CREACION: TIntegerField
      FieldName = 'USUARIO_CREACION'
    end
    object xFacturaCabeceraVALOR_UNIDAD_FOMENTO: TFloatField
      FieldName = 'VALOR_UNIDAD_FOMENTO'
    end
    object xFacturaCabeceraPERIODO_FACTURACION_INI: TDateTimeField
      FieldName = 'PERIODO_FACTURACION_INI'
    end
    object xFacturaCabeceraPERIODO_FACTURACION_FIN: TDateTimeField
      FieldName = 'PERIODO_FACTURACION_FIN'
    end
    object xFacturaCabeceraINDSERVICIO: TIntegerField
      FieldName = 'INDSERVICIO'
    end
    object xFacturaCabeceraRECIBO_PAGADO: TIntegerField
      FieldName = 'RECIBO_PAGADO'
    end
    object xFacturaCabeceraLEGAL_LITERALS: TBlobField
      FieldName = 'LEGAL_LITERALS'
      Size = 8
    end
    object xFacturaCabeceraCOD_MOTIVO_ABONO: TIntegerField
      FieldName = 'COD_MOTIVO_ABONO'
    end
    object xFacturaCabeceraEMITIDA_POR_TERCEROS: TIntegerField
      FieldName = 'EMITIDA_POR_TERCEROS'
    end
    object xFacturaCabeceraID_FICHA_TECNICA: TIntegerField
      FieldName = 'ID_FICHA_TECNICA'
    end
    object xFacturaCabeceraMATRICULA: TFIBStringField
      FieldName = 'MATRICULA'
    end
    object xFacturaCabeceraTITULO_GIRO_CLIENTE: TFIBStringField
      FieldName = 'TITULO_GIRO_CLIENTE'
      Size = 150
    end
    object xFacturaCabeceraORIGEN_DOCUMENTO: TFIBStringField
      FieldName = 'ORIGEN_DOCUMENTO'
      Size = 3
    end
    object xFacturaCabeceraTIPO_INGRESOS: TIntegerField
      FieldName = 'TIPO_INGRESOS'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 328
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 496
    Top = 16
  end
  object xNcfDet: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT FIRST 1 *'
      'FROM Z_SYS_NCF_DET'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'TIPO = :TIPO AND'
      'TIPO_NCF = :TIPO_NCF AND'
      'LINEA = :LINEA')
    SelectSQL.Strings = (
      'SELECT FIRST 1 *'
      'FROM Z_SYS_NCF_DET'
      'WHERE'
      '(TIPO_NCF = :Z_TIPO_NCF) AND'
      '(:Z_CONTADOR_NCF BETWEEN CONTADOR_INI AND CONTADOR_FIN)'
      'ORDER BY LINEA DESC')
    UniDirectional = False
    DataSource = DSxFacturaCabecera
    Left = 48
    Top = 112
    object xNcfDetTIPO: TFIBStringField
      FieldName = 'TIPO'
      Size = 3
    end
    object xNcfDetPREFIJO: TFIBStringField
      FieldName = 'PREFIJO'
      Size = 11
    end
    object xNcfDetLINEA: TIntegerField
      FieldName = 'LINEA'
    end
    object xNcfDetFECHA_INI: TDateTimeField
      FieldName = 'FECHA_INI'
    end
    object xNcfDetCONTADOR_INI: TIntegerField
      FieldName = 'CONTADOR_INI'
    end
    object xNcfDetCONTADOR_FIN: TIntegerField
      FieldName = 'CONTADOR_FIN'
    end
    object xNcfDetCONTADOR_ACTUAL: TIntegerField
      FieldName = 'CONTADOR_ACTUAL'
    end
    object xNcfDetACTIVO: TIntegerField
      FieldName = 'ACTIVO'
    end
    object xNcfDetTIPO_NCF: TIntegerField
      FieldName = 'TIPO_NCF'
    end
    object xNcfDetFECHA_FIN: TDateTimeField
      FieldName = 'FECHA_FIN'
    end
  end
  object xFormaPago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT IIF(TIPO_EFECTO = '#39'CRE'#39', 2, 1) TIPO_PAGO'
      'FROM SYS_FORMAS_PAGO'
      'WHERE '
      'FORMA = :FORMA_PAGO  ')
    SelectSQL.Strings = (
      'SELECT IIF(TIPO_EFECTO = '#39'CRE'#39', 2, 1) TIPO_PAGO'
      'FROM SYS_FORMAS_PAGO'
      'WHERE '
      'FORMA = :FORMA_PAGO  ')
    UniDirectional = False
    DataSource = DSxFacturaCabecera
    Left = 48
    Top = 160
    object xFormaPagoTIPO_PAGO: TIntegerField
      FieldName = 'TIPO_PAGO'
    end
  end
  object DSxFacturaCabecera: TDataSource
    DataSet = xFacturaCabecera
    Left = 168
    Top = 16
  end
  object DSxNcfDet: TDataSource
    DataSet = xNcfDet
    Left = 168
    Top = 112
  end
  object DSxFormaPago: TDataSource
    DataSet = xFormaPago
    Left = 168
    Top = 160
  end
  object xTerceroCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM VER_TERCEROS_EDICION'
      'WHERE'
      'TERCERO = :TERCERO')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_TERCEROS_EDICION'
      'WHERE'
      'TERCERO = :TERCERO')
    UniDirectional = False
    DataSource = DSxFacturaCabecera
    Left = 48
    Top = 208
    object xTerceroClienteTERCERO: TIntegerField
      FieldName = 'TERCERO'
    end
    object xTerceroClienteNOMBRE_R_SOCIAL: TFIBStringField
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xTerceroClienteNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object xTerceroClienteDIR_NOMBRE: TFIBStringField
      FieldName = 'DIR_NOMBRE'
      Size = 40
    end
    object xTerceroClienteTELEFONO01: TFIBStringField
      FieldName = 'TELEFONO01'
    end
    object xTerceroClienteTELEFONO02: TFIBStringField
      FieldName = 'TELEFONO02'
    end
    object xTerceroClienteEMAIL: TFIBStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object xTerceroClienteNOMBRE_COMERCIAL: TFIBStringField
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xTerceroClienteTIPO_DOC_IDENT: TFIBStringField
      FieldName = 'TIPO_DOC_IDENT'
      Size = 3
    end
    object xTerceroClientePAIS_TERCERO: TFIBStringField
      FieldName = 'PAIS_TERCERO'
      Size = 3
    end
  end
  object DSxTerceroCliente: TDataSource
    DataSet = xTerceroCliente
    Left = 168
    Top = 208
  end
  object DSxEmisor: TDataSource
    DataSet = xEmisor
    Left = 168
    Top = 256
  end
  object xEmisor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'SELECT T.NIF, T.NOMBRE_R_SOCIAL, T.TELEFONO01, T.EMAIL, D.DIR_CO' +
        'MPLETA_N, T.WEB, T.NOMBRE_COMERCIAL'
      'FROM SYS_EMPRESAS E'
      'JOIN SYS_TERCEROS T ON E.TERCERO = T.TERCERO'
      'JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO'
      'WHERE '
      'E.EMPRESA = :EMPRESA AND'
      'D.DIR_DEFECTO = 1')
    SelectSQL.Strings = (
      
        'SELECT T.NIF, T.NOMBRE_R_SOCIAL, T.TELEFONO01, T.EMAIL, D.DIR_CO' +
        'MPLETA_N, T.WEB, T.NOMBRE_COMERCIAL'
      'FROM SYS_EMPRESAS E'
      'JOIN SYS_TERCEROS T ON E.TERCERO = T.TERCERO'
      'JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO'
      'WHERE '
      'E.EMPRESA = :EMPRESA AND'
      'D.DIR_DEFECTO = 1')
    UniDirectional = False
    DataSource = DSxFacturaCabecera
    Left = 48
    Top = 256
    object xEmisorNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object xEmisorNOMBRE_R_SOCIAL: TFIBStringField
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xEmisorTELEFONO01: TFIBStringField
      FieldName = 'TELEFONO01'
    end
    object xEmisorEMAIL: TFIBStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object xEmisorDIR_COMPLETA_N: TFIBStringField
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
    object xEmisorWEB: TFIBStringField
      FieldName = 'WEB'
      Size = 60
    end
    object xEmisorNOMBRE_COMERCIAL: TFIBStringField
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
  end
  object xFacturaDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'SELECT ORDEN, LINEA, ARTICULO, TITULO, UNIDADES, PRECIO, I_DESCU' +
        'ENTO, NOTAS, DESCUENTO, SIGNO_UNIDADES, TIPO_IVA,'
      
        '       B_IMPONIBLE, B_DTO_LINEA, B_COMISION, BRUTO, COMISION, CO' +
        'STE_ADICIONAL, P_IVA LIQUIDO, P_IVA, CONTROL_STOCK'
      'FROM VER_DETALLE_FACTURA'
      'WHERE '
      'ID_S = :ID_S')
    SelectSQL.Strings = (
      
        'SELECT ORDEN, LINEA, ARTICULO, TITULO, UNIDADES, PRECIO, I_DESCU' +
        'ENTO, NOTAS, DESCUENTO, SIGNO_UNIDADES, TIPO_IVA,'
      
        '       B_IMPONIBLE, B_DTO_LINEA, B_COMISION, BRUTO, COMISION, CO' +
        'STE_ADICIONAL, P_IVA LIQUIDO, P_IVA, CONTROL_STOCK'
      'FROM VER_DETALLE_FACTURA'
      'WHERE '
      'ID_S = :ID_S'
      'ORDER BY ORDEN')
    UniDirectional = False
    DataSource = DSxFacturaCabecera
    Left = 48
    Top = 64
    object xFacturaDetalleORDEN: TIntegerField
      FieldName = 'ORDEN'
    end
    object xFacturaDetalleLINEA: TIntegerField
      FieldName = 'LINEA'
    end
    object xFacturaDetalleARTICULO: TFIBStringField
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xFacturaDetalleTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 256
    end
    object xFacturaDetalleUNIDADES: TFloatField
      FieldName = 'UNIDADES'
    end
    object xFacturaDetallePRECIO: TFloatField
      FieldName = 'PRECIO'
    end
    object xFacturaDetalleI_DESCUENTO: TFloatField
      FieldName = 'I_DESCUENTO'
    end
    object xFacturaDetalleNOTAS: TBlobField
      FieldName = 'NOTAS'
      Size = 8
    end
    object xFacturaDetalleDESCUENTO: TFloatField
      FieldName = 'DESCUENTO'
    end
    object xFacturaDetalleSIGNO_UNIDADES: TFIBStringField
      FieldName = 'SIGNO_UNIDADES'
      Size = 3
    end
    object xFacturaDetalleTIPO_IVA: TIntegerField
      FieldName = 'TIPO_IVA'
    end
    object xFacturaDetalleLIQUIDO: TFloatField
      FieldName = 'LIQUIDO'
    end
    object xFacturaDetalleB_IMPONIBLE: TFloatField
      FieldName = 'B_IMPONIBLE'
    end
    object xFacturaDetalleB_DTO_LINEA: TFloatField
      FieldName = 'B_DTO_LINEA'
    end
    object xFacturaDetalleB_COMISION: TFloatField
      FieldName = 'B_COMISION'
    end
    object xFacturaDetalleBRUTO: TFloatField
      FieldName = 'BRUTO'
    end
    object xFacturaDetalleCOMISION: TFloatField
      FieldName = 'COMISION'
    end
    object xFacturaDetalleCOSTE_ADICIONAL: TFloatField
      FieldName = 'COSTE_ADICIONAL'
    end
    object xFacturaDetalleP_IVA: TFloatField
      FieldName = 'P_IVA'
    end
    object xFacturaDetalleCONTROL_STOCK: TIntegerField
      DisplayLabel = 'Control Stock'
      FieldName = 'CONTROL_STOCK'
    end
  end
  object DSxFacturaDetalle: TDataSource
    DataSet = xFacturaDetalle
    Left = 168
    Top = 64
  end
  object xDGIIConfiguracion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM DGII_CONFIGURACION'
      'WHERE '
      'EMPRESA = :EMPRESA')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM DGII_CONFIGURACION'
      'WHERE '
      'EMPRESA = :EMPRESA')
    UniDirectional = False
    DataSource = DSxFacturaCabecera
    Left = 48
    Top = 304
    object xDGIIConfiguracionEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xDGIIConfiguracionTOKEN: TFIBStringField
      FieldName = 'TOKEN'
      Size = 3000
    end
    object xDGIIConfiguracionURL_BASE: TFIBStringField
      FieldName = 'URL_BASE'
      Size = 256
    end
    object xDGIIConfiguracionID_COMPANY: TFIBStringField
      FieldName = 'ID_COMPANY'
      Size = 40
    end
  end
  object xECFVentas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_FAC_DGII'
      'WHERE ID_S = :ID_S')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_FAC_DGII'
      'WHERE ID_S = :ID_S')
    UniDirectional = False
    DataSource = DSxFacturaCabecera
    Left = 48
    Top = 352
    object xECFVentasID_S: TIntegerField
      FieldName = 'ID_S'
    end
    object xECFVentasID_ENVIO: TFIBStringField
      FieldName = 'ID_ENVIO'
      Size = 40
    end
    object xECFVentasSTAMP_DATE: TFIBStringField
      FieldName = 'STAMP_DATE'
    end
    object xECFVentasSTATUS: TFIBStringField
      FieldName = 'STATUS'
    end
    object xECFVentasSECURITY_CODE: TFIBStringField
      FieldName = 'SECURITY_CODE'
    end
    object xECFVentasSEQUENCE_CONSUMED: TIntegerField
      FieldName = 'SEQUENCE_CONSUMED'
    end
    object xECFVentasENCF: TFIBStringField
      FieldName = 'ENCF'
    end
    object xECFVentasURL_XML: TFIBStringField
      FieldName = 'URL_XML'
      Size = 500
    end
    object xECFVentasURL_PDF: TFIBStringField
      FieldName = 'URL_PDF'
      Size = 500
    end
    object xECFVentasXML: TMemoField
      FieldName = 'XML'
      BlobType = ftMemo
      Size = 8
    end
    object xECFVentasPDF: TBlobField
      FieldName = 'PDF'
      Size = 8
    end
    object xECFVentasDOCUMENT_STAMP_URL: TFIBStringField
      FieldName = 'DOCUMENT_STAMP_URL'
      Size = 500
    end
    object xECFVentasTRACK_ID: TFIBStringField
      FieldName = 'TRACK_ID'
      Size = 40
    end
    object xECFVentasENVIO_RESPUESTA_JSON: TMemoField
      FieldName = 'ENVIO_RESPUESTA_JSON'
      BlobType = ftMemo
      Size = 8
    end
    object xECFVentasCONSULTA_RESPUESTA_JSON: TMemoField
      FieldName = 'CONSULTA_RESPUESTA_JSON'
      BlobType = ftMemo
      Size = 8
    end
    object xECFVentasGOVERMENT_RESPONSE: TFIBStringField
      FieldName = 'GOVERMENT_RESPONSE'
      Size = 256
    end
    object xECFVentasMENSAJE_ERROR_ENVIO_ECF: TFIBStringField
      FieldName = 'MENSAJE_ERROR_ENVIO_ECF'
      Size = 500
    end
    object xECFVentasSTATUS_CONSULTA: TFIBStringField
      FieldName = 'STATUS_CONSULTA'
    end
    object xECFVentasLEGAL_STATUS_CONSULTA: TFIBStringField
      FieldName = 'LEGAL_STATUS_CONSULTA'
    end
  end
  object DSxECFVentas: TDataSource
    DataSet = xECFVentas
    Left = 168
    Top = 352
  end
  object QMDGIIReferencias: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM DGII_ECF_REFERENCIA'
      'WHERE ID_S = :ID_S')
    SelectSQL.Strings = (
      'SELECT * FROM DGII_ECF_REFERENCIA'
      'WHERE ID_S = :ID_S')
    UniDirectional = False
    DataSource = DSxFacturaCabecera
    Left = 48
    Top = 400
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
    Left = 168
    Top = 400
  end
  object xFacturaCabeceraCompras: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_FACTURA_PROV'
      'WHERE'
      'ID_E = :ID_E')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_FACTURA_PROV'
      'WHERE'
      'ID_E = :ID_E')
    UniDirectional = False
    AfterOpen = xFacturaCabeceraComprasAfterOpen
    BeforeClose = xFacturaCabeceraComprasBeforeClose
    Left = 328
    Top = 64
    object xFacturaCabeceraComprasEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xFacturaCabeceraComprasEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object xFacturaCabeceraComprasCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object xFacturaCabeceraComprasSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object xFacturaCabeceraComprasTIPO: TFIBStringField
      FieldName = 'TIPO'
      Size = 3
    end
    object xFacturaCabeceraComprasRIG: TIntegerField
      FieldName = 'RIG'
    end
    object xFacturaCabeceraComprasALMACEN: TFIBStringField
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xFacturaCabeceraComprasMONEDA: TFIBStringField
      FieldName = 'MONEDA'
      Size = 3
    end
    object xFacturaCabeceraComprasFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object xFacturaCabeceraComprasPROVEEDOR: TIntegerField
      FieldName = 'PROVEEDOR'
    end
    object xFacturaCabeceraComprasTERCERO: TIntegerField
      FieldName = 'TERCERO'
    end
    object xFacturaCabeceraComprasDIRECCION: TIntegerField
      FieldName = 'DIRECCION'
    end
    object xFacturaCabeceraComprasTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 60
    end
    object xFacturaCabeceraComprasNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object xFacturaCabeceraComprasESTADO: TIntegerField
      FieldName = 'ESTADO'
    end
    object xFacturaCabeceraComprasBULTOS: TIntegerField
      FieldName = 'BULTOS'
    end
    object xFacturaCabeceraComprasLINEAS: TIntegerField
      FieldName = 'LINEAS'
    end
    object xFacturaCabeceraComprasBRUTO: TFloatField
      FieldName = 'BRUTO'
    end
    object xFacturaCabeceraComprasI_DTO_LINEAS: TFloatField
      FieldName = 'I_DTO_LINEAS'
    end
    object xFacturaCabeceraComprasS_BASES: TFloatField
      FieldName = 'S_BASES'
    end
    object xFacturaCabeceraComprasS_CUOTA_IVA: TFloatField
      FieldName = 'S_CUOTA_IVA'
    end
    object xFacturaCabeceraComprasS_CUOTA_RE: TFloatField
      FieldName = 'S_CUOTA_RE'
    end
    object xFacturaCabeceraComprasB_DTO_LINEAS: TFloatField
      FieldName = 'B_DTO_LINEAS'
    end
    object xFacturaCabeceraComprasDTO_PP: TFloatField
      FieldName = 'DTO_PP'
    end
    object xFacturaCabeceraComprasDTO_CIAL: TFloatField
      FieldName = 'DTO_CIAL'
    end
    object xFacturaCabeceraComprasI_DTO_CIAL: TFloatField
      FieldName = 'I_DTO_CIAL'
    end
    object xFacturaCabeceraComprasI_DTO_PP: TFloatField
      FieldName = 'I_DTO_PP'
    end
    object xFacturaCabeceraComprasLIQUIDO: TFloatField
      FieldName = 'LIQUIDO'
    end
    object xFacturaCabeceraComprasENTRADA: TIntegerField
      FieldName = 'ENTRADA'
    end
    object xFacturaCabeceraComprasP_IRPF: TFloatField
      FieldName = 'P_IRPF'
    end
    object xFacturaCabeceraComprasI_IRPF: TFloatField
      FieldName = 'I_IRPF'
    end
    object xFacturaCabeceraComprasA_IRPF: TIntegerField
      FieldName = 'A_IRPF'
    end
    object xFacturaCabeceraComprasTOTAL_FACTURA: TFloatField
      FieldName = 'TOTAL_FACTURA'
    end
    object xFacturaCabeceraComprasNUM_FACTURA: TFIBStringField
      FieldName = 'NUM_FACTURA'
      Size = 40
    end
    object xFacturaCabeceraComprasFORMA_DE_PAGO: TFIBStringField
      FieldName = 'FORMA_DE_PAGO'
      Size = 3
    end
    object xFacturaCabeceraComprasTIPO_IRPF: TIntegerField
      FieldName = 'TIPO_IRPF'
    end
    object xFacturaCabeceraComprasBASE_IRPF: TFloatField
      FieldName = 'BASE_IRPF'
    end
    object xFacturaCabeceraComprasDEVOLUCION: TIntegerField
      FieldName = 'DEVOLUCION'
    end
    object xFacturaCabeceraComprasSIN_DETALLE: TIntegerField
      FieldName = 'SIN_DETALLE'
    end
    object xFacturaCabeceraComprasASIENTO: TIntegerField
      FieldName = 'ASIENTO'
    end
    object xFacturaCabeceraComprasNOMBRE_COMERCIAL: TFIBStringField
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xFacturaCabeceraComprasREGISTRO: TIntegerField
      FieldName = 'REGISTRO'
    end
    object xFacturaCabeceraComprasPOR_FINANCIACION: TFloatField
      FieldName = 'POR_FINANCIACION'
    end
    object xFacturaCabeceraComprasI_FINANCIACION: TFloatField
      FieldName = 'I_FINANCIACION'
    end
    object xFacturaCabeceraComprasFECHA_CON: TDateTimeField
      FieldName = 'FECHA_CON'
    end
    object xFacturaCabeceraComprasFECHA_SII: TDateTimeField
      FieldName = 'FECHA_SII'
    end
    object xFacturaCabeceraComprasSIN_RECIBOS: TIntegerField
      FieldName = 'SIN_RECIBOS'
    end
    object xFacturaCabeceraComprasFUERZA_VENCIMIENTOS: TIntegerField
      FieldName = 'FUERZA_VENCIMIENTOS'
    end
    object xFacturaCabeceraComprasI_FINANCIACION_CANAL: TFloatField
      FieldName = 'I_FINANCIACION_CANAL'
    end
    object xFacturaCabeceraComprasCENTRO_COSTE: TIntegerField
      FieldName = 'CENTRO_COSTE'
    end
    object xFacturaCabeceraComprasID_E: TIntegerField
      FieldName = 'ID_E'
    end
    object xFacturaCabeceraComprasFECHA_ENTREGA: TDateTimeField
      FieldName = 'FECHA_ENTREGA'
    end
    object xFacturaCabeceraComprasSU_REFERENCIA: TFIBStringField
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xFacturaCabeceraComprasRECT: TIntegerField
      FieldName = 'RECT'
    end
    object xFacturaCabeceraComprasID_RECT: TIntegerField
      FieldName = 'ID_RECT'
    end
    object xFacturaCabeceraComprasTIPO_PORTES: TIntegerField
      FieldName = 'TIPO_PORTES'
    end
    object xFacturaCabeceraComprasPOR_PORTES: TFloatField
      FieldName = 'POR_PORTES'
    end
    object xFacturaCabeceraComprasI_PORTES: TFloatField
      FieldName = 'I_PORTES'
    end
    object xFacturaCabeceraComprasI_PORTES_CANAL: TFloatField
      FieldName = 'I_PORTES_CANAL'
    end
    object xFacturaCabeceraComprasCAMBIO_FIJO: TIntegerField
      FieldName = 'CAMBIO_FIJO'
    end
    object xFacturaCabeceraComprasVALOR_CAMB_FIJO: TFloatField
      FieldName = 'VALOR_CAMB_FIJO'
    end
    object xFacturaCabeceraComprasVALOR_CAMB_FIJO_INV: TFloatField
      FieldName = 'VALOR_CAMB_FIJO_INV'
    end
    object xFacturaCabeceraComprasPROYECTO: TIntegerField
      FieldName = 'PROYECTO'
    end
    object xFacturaCabeceraComprasOBLIGA_AUTOFACTURA: TIntegerField
      FieldName = 'OBLIGA_AUTOFACTURA'
    end
    object xFacturaCabeceraComprasFUERZA_MODO_IVA: TIntegerField
      FieldName = 'FUERZA_MODO_IVA'
    end
    object xFacturaCabeceraComprasMODO_IVA: TIntegerField
      FieldName = 'MODO_IVA'
    end
    object xFacturaCabeceraComprasZ_TIPO_BIENES: TFIBStringField
      FieldName = 'Z_TIPO_BIENES'
      Size = 2
    end
    object xFacturaCabeceraComprasZ_TIPO_NCF: TIntegerField
      FieldName = 'Z_TIPO_NCF'
    end
    object xFacturaCabeceraComprasZ_PREFIJO_NCF: TFIBStringField
      FieldName = 'Z_PREFIJO_NCF'
      Size = 11
    end
    object xFacturaCabeceraComprasZ_CONTADOR_NCF: TFIBStringField
      FieldName = 'Z_CONTADOR_NCF'
      Size = 8
    end
    object xFacturaCabeceraComprasMODIFICA_DOC: TIntegerField
      FieldName = 'MODIFICA_DOC'
    end
    object xFacturaCabeceraComprasRECC: TIntegerField
      FieldName = 'RECC'
    end
    object xFacturaCabeceraComprasINVERSION_SUJETO_PASIVO: TIntegerField
      FieldName = 'INVERSION_SUJETO_PASIVO'
    end
    object xFacturaCabeceraComprasREGISTRO_CARTERA: TIntegerField
      FieldName = 'REGISTRO_CARTERA'
    end
    object xFacturaCabeceraComprasVENCIMIENTO: TDateTimeField
      FieldName = 'VENCIMIENTO'
    end
    object xFacturaCabeceraComprasSFV_AUTORIZACION: TFIBStringField
      FieldName = 'SFV_AUTORIZACION'
    end
    object xFacturaCabeceraComprasSFV_CODIGO_CONTROL: TFIBStringField
      FieldName = 'SFV_CODIGO_CONTROL'
    end
    object xFacturaCabeceraComprasSFV_CODIGO_RESPUESTA_RAPIDA: TFIBStringField
      FieldName = 'SFV_CODIGO_RESPUESTA_RAPIDA'
      Size = 256
    end
    object xFacturaCabeceraComprasIMPORTE_ICE_TOTAL: TFloatField
      FieldName = 'IMPORTE_ICE_TOTAL'
    end
    object xFacturaCabeceraComprasID_TIPO_GIRO_PRO_ACR: TIntegerField
      FieldName = 'ID_TIPO_GIRO_PRO_ACR'
    end
    object xFacturaCabeceraComprasCODIGO_GIRO_PRO_ACR: TIntegerField
      FieldName = 'CODIGO_GIRO_PRO_ACR'
    end
    object xFacturaCabeceraComprasID_TIPO_GIRO_EMPRESA: TIntegerField
      FieldName = 'ID_TIPO_GIRO_EMPRESA'
    end
    object xFacturaCabeceraComprasCODIGO_GIRO_EMPRESA: TIntegerField
      FieldName = 'CODIGO_GIRO_EMPRESA'
    end
    object xFacturaCabeceraComprasTIPO_COMPRA: TIntegerField
      FieldName = 'TIPO_COMPRA'
    end
    object xFacturaCabeceraComprasCODIGO_RESPUESTA_SII: TMemoField
      FieldName = 'CODIGO_RESPUESTA_SII'
      BlobType = ftMemo
      Size = 8
    end
    object xFacturaCabeceraComprasFOLIO: TFIBStringField
      FieldName = 'FOLIO'
      Size = 40
    end
    object xFacturaCabeceraComprasIMPORTE_MINIMO_PORTE: TFloatField
      FieldName = 'IMPORTE_MINIMO_PORTE'
    end
    object xFacturaCabeceraComprasTIPO_DOC_TRIBUTARIO: TFIBStringField
      FieldName = 'TIPO_DOC_TRIBUTARIO'
      Size = 3
    end
    object xFacturaCabeceraComprasS_CUOTA_IMPUESTO_ADICIONAL: TFloatField
      FieldName = 'S_CUOTA_IMPUESTO_ADICIONAL'
    end
    object xFacturaCabeceraComprasS_CUOTA_IMP_ADICIONAL_CANAL: TFloatField
      FieldName = 'S_CUOTA_IMP_ADICIONAL_CANAL'
    end
    object xFacturaCabeceraComprasEMPAQUETADO_EMPRESA: TIntegerField
      FieldName = 'EMPAQUETADO_EMPRESA'
    end
    object xFacturaCabeceraComprasDIR_RECOGIDA_MANUAL: TMemoField
      FieldName = 'DIR_RECOGIDA_MANUAL'
      BlobType = ftMemo
      Size = 8
    end
    object xFacturaCabeceraComprasDIR_ENTREGA_MANUAL: TMemoField
      FieldName = 'DIR_ENTREGA_MANUAL'
      BlobType = ftMemo
      Size = 8
    end
    object xFacturaCabeceraComprasEQUIPO_RECOGIDA: TFIBStringField
      FieldName = 'EQUIPO_RECOGIDA'
      Size = 40
    end
    object xFacturaCabeceraComprasEQUIPO_ENTREGA: TFIBStringField
      FieldName = 'EQUIPO_ENTREGA'
      Size = 40
    end
    object xFacturaCabeceraComprasMATRICULA_RECOGIDA: TFIBStringField
      FieldName = 'MATRICULA_RECOGIDA'
      Size = 40
    end
    object xFacturaCabeceraComprasMATRICULA_ENTREGA: TFIBStringField
      FieldName = 'MATRICULA_ENTREGA'
      Size = 40
    end
    object xFacturaCabeceraComprasFECHA_RECOGIDA_MANUAL: TDateTimeField
      FieldName = 'FECHA_RECOGIDA_MANUAL'
    end
    object xFacturaCabeceraComprasFECHA_ENTREGA_MANUAL: TDateTimeField
      FieldName = 'FECHA_ENTREGA_MANUAL'
    end
    object xFacturaCabeceraComprasIDIOMA: TFIBStringField
      FieldName = 'IDIOMA'
      Size = 3
    end
    object xFacturaCabeceraComprasRECIBO_PAGADO: TIntegerField
      FieldName = 'RECIBO_PAGADO'
    end
    object xFacturaCabeceraComprasUSUARIO_CREACION: TIntegerField
      FieldName = 'USUARIO_CREACION'
    end
    object xFacturaCabeceraComprasCOD_MOTIVO_ABONO: TIntegerField
      FieldName = 'COD_MOTIVO_ABONO'
    end
    object xFacturaCabeceraComprasNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object xFacturaCabeceraComprasORIGEN_DOCUMENTO: TFIBStringField
      FieldName = 'ORIGEN_DOCUMENTO'
      Size = 3
    end
    object xFacturaCabeceraComprasOBSERVACIONES: TFIBStringField
      FieldName = 'OBSERVACIONES'
      Size = 256
    end
    object xFacturaCabeceraComprasDOM_ID_TIPO_RETENCION: TIntegerField
      DisplayLabel = 'ID Tipo Retencion'
      FieldName = 'DOM_ID_TIPO_RETENCION'
    end
    object xFacturaCabeceraComprasDOM_RET_POR_ITBIS: TFloatField
      DisplayLabel = 'Porc. Ret. ITBIS'
      FieldName = 'DOM_RET_POR_ITBIS'
    end
    object xFacturaCabeceraComprasDOM_RET_POR_ISR: TFloatField
      DisplayLabel = 'Porc. Ret. ISR'
      FieldName = 'DOM_RET_POR_ISR'
    end
  end
  object xFacturaDetalleCompras: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'SELECT ORDEN, LINEA, ARTICULO, TITULO, UNIDADES, PRECIO, I_DESCU' +
        'ENTO, NOTAS, DESCUENTO /*, SIGNO_UNIDADES*/ , TIPO_IVA,'
      
        '       B_IMPONIBLE, B_DTO_LINEA, /*B_COMISION,*/ BRUTO, /*COMISI' +
        'ON, */ COSTE_ADICIONAL, P_IVA LIQUIDO, P_IVA, CONTROL_STOCK, P_C' +
        'OSTE'
      'FROM VER_DETALLE_FACTURA_PROV'
      'WHERE ID_E = :ID_E'
      'ORDER BY ORDEN  ')
    SelectSQL.Strings = (
      
        'SELECT ORDEN, LINEA, ARTICULO, TITULO, UNIDADES, PRECIO, I_DESCU' +
        'ENTO, NOTAS, DESCUENTO /*, SIGNO_UNIDADES*/ , TIPO_IVA,'
      
        '       B_IMPONIBLE, B_DTO_LINEA, /*B_COMISION,*/ BRUTO, /*COMISI' +
        'ON, */ COSTE_ADICIONAL, P_IVA LIQUIDO, P_IVA, CONTROL_STOCK, P_C' +
        'OSTE'
      'FROM VER_DETALLE_FACTURA_PROV'
      'WHERE ID_E = :ID_E'
      'ORDER BY ORDEN  ')
    UniDirectional = False
    DataSource = DSxFacturaCabeceraCompras
    Left = 328
    Top = 112
    object xFacturaDetalleComprasORDEN: TIntegerField
      FieldName = 'ORDEN'
    end
    object xFacturaDetalleComprasLINEA: TIntegerField
      FieldName = 'LINEA'
    end
    object xFacturaDetalleComprasARTICULO: TFIBStringField
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xFacturaDetalleComprasTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 256
    end
    object xFacturaDetalleComprasUNIDADES: TFloatField
      FieldName = 'UNIDADES'
    end
    object xFacturaDetalleComprasPRECIO: TFloatField
      FieldName = 'PRECIO'
    end
    object xFacturaDetalleComprasI_DESCUENTO: TFloatField
      FieldName = 'I_DESCUENTO'
    end
    object xFacturaDetalleComprasNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object xFacturaDetalleComprasDESCUENTO: TFloatField
      FieldName = 'DESCUENTO'
    end
    object xFacturaDetalleComprasTIPO_IVA: TIntegerField
      FieldName = 'TIPO_IVA'
    end
    object xFacturaDetalleComprasB_IMPONIBLE: TFloatField
      FieldName = 'B_IMPONIBLE'
    end
    object xFacturaDetalleComprasB_DTO_LINEA: TFloatField
      FieldName = 'B_DTO_LINEA'
    end
    object xFacturaDetalleComprasBRUTO: TFloatField
      FieldName = 'BRUTO'
    end
    object xFacturaDetalleComprasCOSTE_ADICIONAL: TFloatField
      FieldName = 'COSTE_ADICIONAL'
    end
    object xFacturaDetalleComprasLIQUIDO: TFloatField
      FieldName = 'LIQUIDO'
    end
    object xFacturaDetalleComprasP_IVA: TFloatField
      FieldName = 'P_IVA'
    end
    object xFacturaDetalleComprasCONTROL_STOCK: TIntegerField
      FieldName = 'CONTROL_STOCK'
    end
    object xFacturaDetalleComprasP_COSTE: TFloatField
      FieldName = 'P_COSTE'
    end
  end
  object xDGIIConfiguracionCompras: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM DGII_CONFIGURACION'
      'WHERE '
      'EMPRESA = :EMPRESA')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM DGII_CONFIGURACION'
      'WHERE '
      'EMPRESA = :EMPRESA')
    UniDirectional = False
    DataSource = DSxFacturaCabeceraCompras
    Left = 328
    Top = 160
    object xDGIIConfiguracionComprasEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xDGIIConfiguracionComprasTOKEN: TFIBStringField
      FieldName = 'TOKEN'
      Size = 3000
    end
    object xDGIIConfiguracionComprasURL_BASE: TFIBStringField
      FieldName = 'URL_BASE'
      Size = 256
    end
    object xDGIIConfiguracionComprasID_COMPANY: TFIBStringField
      FieldName = 'ID_COMPANY'
      Size = 40
    end
  end
  object xNcfDetCompras: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT FIRST 1 *'
      'FROM Z_SYS_NCF_DET'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'TIPO = :TIPO AND'
      'TIPO_NCF = :TIPO_NCF AND'
      'LINEA = :LINEA')
    SelectSQL.Strings = (
      'SELECT FIRST 1 *'
      'FROM Z_SYS_NCF_DET'
      'WHERE'
      'TIPO_NCF = :Z_TIPO_NCF AND'
      '(:Z_CONTADOR_NCF BETWEEN CONTADOR_INI AND CONTADOR_FIN)'
      'ORDER BY LINEA DESC')
    UniDirectional = False
    DataSource = DSxFacturaCabeceraCompras
    Left = 328
    Top = 208
    object xNcfDetComprasTIPO: TFIBStringField
      FieldName = 'TIPO'
      Size = 3
    end
    object xNcfDetComprasSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object xNcfDetComprasPREFIJO: TFIBStringField
      FieldName = 'PREFIJO'
      Size = 11
    end
    object xNcfDetComprasLINEA: TIntegerField
      FieldName = 'LINEA'
    end
    object xNcfDetComprasORDEN: TIntegerField
      FieldName = 'ORDEN'
    end
    object xNcfDetComprasFECHA_INI: TDateTimeField
      FieldName = 'FECHA_INI'
    end
    object xNcfDetComprasCONTADOR_INI: TIntegerField
      FieldName = 'CONTADOR_INI'
    end
    object xNcfDetComprasCONTADOR_FIN: TIntegerField
      FieldName = 'CONTADOR_FIN'
    end
    object xNcfDetComprasCONTADOR_ACTUAL: TIntegerField
      FieldName = 'CONTADOR_ACTUAL'
    end
    object xNcfDetComprasACTIVO: TIntegerField
      FieldName = 'ACTIVO'
    end
    object xNcfDetComprasTIPO_NCF: TIntegerField
      FieldName = 'TIPO_NCF'
    end
    object xNcfDetComprasFECHA_FIN: TDateTimeField
      FieldName = 'FECHA_FIN'
    end
    object xNcfDetComprasFOLIO_INI: TIntegerField
      FieldName = 'FOLIO_INI'
    end
    object xNcfDetComprasFOLIO_FIN: TIntegerField
      FieldName = 'FOLIO_FIN'
    end
    object xNcfDetComprasNUM_APROBACION: TIntegerField
      FieldName = 'NUM_APROBACION'
    end
    object xNcfDetComprasANO_APROBACION: TIntegerField
      FieldName = 'ANO_APROBACION'
    end
    object xNcfDetComprasSERIE_DIR: TFIBStringField
      FieldName = 'SERIE_DIR'
      Size = 100
    end
    object xNcfDetComprasFICHERO: TFIBStringField
      FieldName = 'FICHERO'
      Size = 100
    end
    object xNcfDetComprasCLAVE: TFIBStringField
      FieldName = 'CLAVE'
      Size = 25
    end
    object xNcfDetComprasCERTIFICADO: TFIBStringField
      FieldName = 'CERTIFICADO'
      Size = 60
    end
    object xNcfDetComprasEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xNcfDetComprasCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object xNcfDetComprasVERSION_NCF: TFIBStringField
      FieldName = 'VERSION_NCF'
      Size = 15
    end
  end
  object DSxFacturaCabeceraCompras: TDataSource
    DataSet = xFacturaCabeceraCompras
    Left = 496
    Top = 64
  end
  object DSxFacturaDetalleCompras: TDataSource
    DataSet = xFacturaDetalleCompras
    Left = 496
    Top = 112
  end
  object DSxDGIIConfiguracionCompras: TDataSource
    DataSet = xDGIIConfiguracionCompras
    Left = 496
    Top = 160
  end
  object DSxNcfDetCompras: TDataSource
    DataSet = xNcfDetCompras
    Left = 496
    Top = 208
  end
  object DSxEmisorCompras: TDataSource
    DataSet = xEmisorCompras
    Left = 496
    Top = 256
  end
  object DSxTerceroProveedor: TDataSource
    DataSet = xTerceroProveedor
    Left = 496
    Top = 304
  end
  object xEmisorCompras: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'SELECT T.NIF, T.NOMBRE_R_SOCIAL, T.TELEFONO01, T.EMAIL, D.DIR_CO' +
        'MPLETA_N, T.WEB, T.NOMBRE_COMERCIAL'
      'FROM SYS_EMPRESAS E'
      'JOIN SYS_TERCEROS T ON E.TERCERO = T.TERCERO'
      'JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO'
      'WHERE '
      'E.EMPRESA = :EMPRESA AND'
      'D.DIR_DEFECTO = 1')
    SelectSQL.Strings = (
      
        'SELECT T.NIF, T.NOMBRE_R_SOCIAL, T.TELEFONO01, T.EMAIL, D.DIR_CO' +
        'MPLETA_N, T.WEB, T.NOMBRE_COMERCIAL'
      'FROM SYS_EMPRESAS E'
      'JOIN SYS_TERCEROS T ON E.TERCERO = T.TERCERO'
      'JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO'
      'WHERE '
      'E.EMPRESA = :EMPRESA AND'
      'D.DIR_DEFECTO = 1')
    UniDirectional = False
    DataSource = DSxFacturaCabeceraCompras
    Left = 328
    Top = 256
    object xEmisorComprasNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object xEmisorComprasNOMBRE_R_SOCIAL: TFIBStringField
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xEmisorComprasTELEFONO01: TFIBStringField
      FieldName = 'TELEFONO01'
    end
    object xEmisorComprasEMAIL: TFIBStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object xEmisorComprasDIR_COMPLETA_N: TFIBStringField
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
    object xEmisorComprasWEB: TFIBStringField
      FieldName = 'WEB'
      Size = 60
    end
    object xEmisorComprasNOMBRE_COMERCIAL: TFIBStringField
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
  end
  object xTerceroProveedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM VER_TERCEROS_EDICION'
      'WHERE'
      'TERCERO = :TERCERO')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_TERCEROS_EDICION'
      'WHERE'
      'TERCERO = :TERCERO')
    UniDirectional = False
    DataSource = DSxFacturaCabeceraCompras
    Left = 328
    Top = 304
    object xTerceroProveedorTERCERO: TIntegerField
      FieldName = 'TERCERO'
    end
    object xTerceroProveedorNOMBRE_COMERCIAL: TFIBStringField
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xTerceroProveedorNOMBRE_R_SOCIAL: TFIBStringField
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xTerceroProveedorTIPO_RAZON: TFIBStringField
      FieldName = 'TIPO_RAZON'
      Size = 4
    end
    object xTerceroProveedorNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object xTerceroProveedorDIR_CLASE: TIntegerField
      FieldName = 'DIR_CLASE'
    end
    object xTerceroProveedorDIR_TIPO: TFIBStringField
      FieldName = 'DIR_TIPO'
      Size = 3
    end
    object xTerceroProveedorDIR_NOMBRE: TFIBStringField
      FieldName = 'DIR_NOMBRE'
      Size = 40
    end
    object xTerceroProveedorDIR_NOMBRE_2: TFIBStringField
      FieldName = 'DIR_NOMBRE_2'
      Size = 40
    end
    object xTerceroProveedorDIR_NOMBRE_3: TFIBStringField
      FieldName = 'DIR_NOMBRE_3'
      Size = 40
    end
    object xTerceroProveedorDIR_NUMERO: TFIBStringField
      FieldName = 'DIR_NUMERO'
      Size = 15
    end
    object xTerceroProveedorDIR_BLOQUE_ESCALERA: TFIBStringField
      FieldName = 'DIR_BLOQUE_ESCALERA'
      Size = 4
    end
    object xTerceroProveedorDIR_PISO: TFIBStringField
      FieldName = 'DIR_PISO'
      Size = 2
    end
    object xTerceroProveedorDIR_PUERTA: TFIBStringField
      FieldName = 'DIR_PUERTA'
      Size = 6
    end
    object xTerceroProveedorDIR_LOCALIDAD: TFIBStringField
      FieldName = 'DIR_LOCALIDAD'
      Size = 8
    end
    object xTerceroProveedorCOLONIA: TFIBStringField
      FieldName = 'COLONIA'
      Size = 40
    end
    object xTerceroProveedorDIR_DEFECTO: TIntegerField
      FieldName = 'DIR_DEFECTO'
    end
    object xTerceroProveedorFECHA_ALTA: TDateTimeField
      FieldName = 'FECHA_ALTA'
    end
    object xTerceroProveedorNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object xTerceroProveedorTELEFONO01: TFIBStringField
      FieldName = 'TELEFONO01'
    end
    object xTerceroProveedorTELEFONO02: TFIBStringField
      FieldName = 'TELEFONO02'
    end
    object xTerceroProveedorTELEFAX: TFIBStringField
      FieldName = 'TELEFAX'
    end
    object xTerceroProveedorEMAIL: TFIBStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object xTerceroProveedorWEB: TFIBStringField
      FieldName = 'WEB'
      Size = 60
    end
    object xTerceroProveedorIMAGEN: TIntegerField
      FieldName = 'IMAGEN'
    end
    object xTerceroProveedorCLIENTE_POTENCIAL: TIntegerField
      FieldName = 'CLIENTE_POTENCIAL'
    end
    object xTerceroProveedorCODIGO_EDI: TFIBStringField
      FieldName = 'CODIGO_EDI'
      Size = 25
    end
    object xTerceroProveedorREGISTRO_MERCANTIL: TFIBStringField
      FieldName = 'REGISTRO_MERCANTIL'
      Size = 100
    end
    object xTerceroProveedorTIT_LOCALIDAD: TFIBStringField
      FieldName = 'TIT_LOCALIDAD'
      Size = 40
    end
    object xTerceroProveedorCODIGO_POSTAL: TFIBStringField
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object xTerceroProveedorID_LOCAL: TIntegerField
      FieldName = 'ID_LOCAL'
    end
    object xTerceroProveedorFECHA_NACIMIENTO: TDateTimeField
      FieldName = 'FECHA_NACIMIENTO'
    end
    object xTerceroProveedorCARNET_APLICADOR: TFIBStringField
      FieldName = 'CARNET_APLICADOR'
    end
    object xTerceroProveedorFECHA_VALIDEZ_CARNET_APLICADOR: TDateTimeField
      FieldName = 'FECHA_VALIDEZ_CARNET_APLICADOR'
    end
    object xTerceroProveedorLATITUD: TFloatField
      FieldName = 'LATITUD'
    end
    object xTerceroProveedorLONGITUD: TFloatField
      FieldName = 'LONGITUD'
    end
    object xTerceroProveedorPAIS_TERCERO: TFIBStringField
      FieldName = 'PAIS_TERCERO'
      Size = 3
    end
    object xTerceroProveedorTIPO_DOC_IDENT: TFIBStringField
      FieldName = 'TIPO_DOC_IDENT'
      Size = 3
    end
    object xTerceroProveedorPAIS_DIRECCION: TFIBStringField
      FieldName = 'PAIS_DIRECCION'
      Size = 3
    end
    object xTerceroProveedorPROVINCIA_DIRECCION: TFIBStringField
      FieldName = 'PROVINCIA_DIRECCION'
      Size = 2
    end
    object xTerceroProveedorREGION_DIRECCION: TFIBStringField
      FieldName = 'REGION_DIRECCION'
      Size = 15
    end
    object xTerceroProveedorPOBLACION_DIRECCION: TFIBStringField
      FieldName = 'POBLACION_DIRECCION'
      Size = 15
    end
    object xTerceroProveedorDIRECCION: TIntegerField
      FieldName = 'DIRECCION'
    end
    object xTerceroProveedorDIR_TRANSPORTISTA: TIntegerField
      FieldName = 'DIR_TRANSPORTISTA'
    end
    object xTerceroProveedorDIRECCION_LITERAL: TMemoField
      FieldName = 'DIRECCION_LITERAL'
      BlobType = ftMemo
      Size = 8
    end
    object xTerceroProveedorDIRECCION_CODIGO_POSTAL: TFIBStringField
      FieldName = 'DIRECCION_CODIGO_POSTAL'
      Size = 10
    end
    object xTerceroProveedorTITULO_REGION: TFIBStringField
      FieldName = 'TITULO_REGION'
      Size = 40
    end
    object xTerceroProveedorTITULO_PROVINCIA: TFIBStringField
      FieldName = 'TITULO_PROVINCIA'
      Size = 40
    end
    object xTerceroProveedorTITULO_POBLACION: TFIBStringField
      FieldName = 'TITULO_POBLACION'
      Size = 40
    end
    object xTerceroProveedorTITULO_CODIGO_POSTAL: TFIBStringField
      FieldName = 'TITULO_CODIGO_POSTAL'
      Size = 40
    end
    object xTerceroProveedorTITULO_PROVINCIA_LOC: TFIBStringField
      FieldName = 'TITULO_PROVINCIA_LOC'
      Size = 40
    end
    object xTerceroProveedorCOMO_NOS_CONOCIERON: TIntegerField
      FieldName = 'COMO_NOS_CONOCIERON'
    end
  end
  object xECFCompras: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_E_FAC_DGII'
      'WHERE ID_E = :ID_E')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_E_FAC_DGII'
      'WHERE ID_E = :ID_E')
    UniDirectional = False
    DataSource = DSxFacturaCabeceraCompras
    Left = 328
    Top = 352
    object xECFComprasID_E: TIntegerField
      FieldName = 'ID_E'
    end
    object xECFComprasSTAMP_DATE: TFIBStringField
      FieldName = 'STAMP_DATE'
    end
    object xECFComprasSTATUS: TFIBStringField
      FieldName = 'STATUS'
    end
    object xECFComprasSECURITY_CODE: TFIBStringField
      FieldName = 'SECURITY_CODE'
    end
    object xECFComprasSEQUENCE_CONSUMED: TIntegerField
      FieldName = 'SEQUENCE_CONSUMED'
    end
    object xECFComprasENCF: TFIBStringField
      FieldName = 'ENCF'
    end
    object xECFComprasURL_XML: TFIBStringField
      FieldName = 'URL_XML'
      Size = 500
    end
    object xECFComprasURL_PDF: TFIBStringField
      FieldName = 'URL_PDF'
      Size = 500
    end
    object xECFComprasXML: TMemoField
      FieldName = 'XML'
      BlobType = ftMemo
      Size = 8
    end
    object xECFComprasPDF: TBlobField
      FieldName = 'PDF'
      Size = 8
    end
    object xECFComprasDOCUMENT_STAMP_URL: TFIBStringField
      FieldName = 'DOCUMENT_STAMP_URL'
      Size = 500
    end
    object xECFComprasTRACK_ID: TFIBStringField
      FieldName = 'TRACK_ID'
      Size = 40
    end
    object xECFComprasENVIO_RESPUESTA_JSON: TMemoField
      FieldName = 'ENVIO_RESPUESTA_JSON'
      BlobType = ftMemo
      Size = 8
    end
    object xECFComprasCONSULTA_RESPUESTA_JSON: TMemoField
      FieldName = 'CONSULTA_RESPUESTA_JSON'
      BlobType = ftMemo
      Size = 8
    end
    object xECFComprasGOVERMENT_RESPONSE: TFIBStringField
      FieldName = 'GOVERMENT_RESPONSE'
      Size = 256
    end
    object xECFComprasMENSAJE_ERROR_ENVIO_ECF: TFIBStringField
      FieldName = 'MENSAJE_ERROR_ENVIO_ECF'
      Size = 500
    end
    object xECFComprasSTATUS_CONSULTA: TFIBStringField
      FieldName = 'STATUS_CONSULTA'
    end
    object xECFComprasLEGAL_STATUS_CONSULTA: TFIBStringField
      FieldName = 'LEGAL_STATUS_CONSULTA'
    end
    object xECFComprasMENSAJE_ERROR_CONSULTA_ECF: TFIBStringField
      FieldName = 'MENSAJE_ERROR_CONSULTA_ECF'
      Size = 500
    end
    object xECFComprasID_ENVIO: TFIBStringField
      DisplayLabel = 'ID Envio'
      FieldName = 'ID_ENVIO'
      Size = 40
    end
  end
  object DSxECFCompras: TDataSource
    DataSet = xECFCompras
    Left = 496
    Top = 352
  end
end
