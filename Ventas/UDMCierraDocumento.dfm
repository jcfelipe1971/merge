object DMCierraDocumento: TDMCierraDocumento
  OldCreateOrder = False
  OnCreate = DMCierraDocumentoCreate
  Left = 741
  Top = 210
  Height = 300
  Width = 436
  object QMCabeceras: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_FACTURA'
      'WHERE'
      '  ID_S=?ID_S ')
    InsertSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_FACTURA'
      'WHERE'
      '  ID_S=?ID_S ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_FACTURA'
      'WHERE'
      '  ID_S=?ID_S ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_CABECERAS_FACTURA'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'ESTADO = :ESTADO'
      'ORDER BY RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE '
      '  GES_CABECERAS_S_FAC'
      'SET'
      '  ENTRADA_FACTURACION = :ENTRADA_FACTURACION'
      'WHERE'
      '  ID_S=?ID_S ')
    DataSource = DSxSeries
    BeforeOpen = QMCabecerasBeforeOpen
    OnNewRecord = QMCabecerasNewRecord
    ClavesPrimarias.Strings = (
      'ID_S')
    AccionesInhibidas = [Borrar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CABECERAS_FACTURA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
    object QMCabecerasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabecerasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCabecerasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCabecerasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabecerasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCabecerasRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCabecerasALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMCabecerasMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMCabecerasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCabecerasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMCabecerasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMCabecerasDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object QMCabecerasCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCabecerasCONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
    end
    object QMCabecerasSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMCabecerasFORMA_PAGO: TFIBStringField
      DisplayLabel = 'Forma Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMCabecerasCAMPANYA: TIntegerField
      DisplayLabel = 'Campa'#241'a'
      FieldName = 'CAMPANYA'
    end
    object QMCabecerasNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMCabecerasESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCabecerasBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object QMCabecerasLINEAS: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINEAS'
    end
    object QMCabecerasBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object QMCabecerasI_DTO_LINEAS: TFloatField
      DisplayLabel = 'Imp. Dto. Lineas'
      FieldName = 'I_DTO_LINEAS'
    end
    object QMCabecerasS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object QMCabecerasM_BRUTO: TFloatField
      DisplayLabel = 'M. Bruto'
      FieldName = 'M_BRUTO'
    end
    object QMCabecerasC_TOTAL: TFloatField
      DisplayLabel = 'C. Total'
      FieldName = 'C_TOTAL'
    end
    object QMCabecerasAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMCabecerasS_CUOTA_IVA: TFloatField
      DisplayLabel = 'Cuotas IVA'
      FieldName = 'S_CUOTA_IVA'
    end
    object QMCabecerasS_CUOTA_RE: TFloatField
      DisplayLabel = 'Cuotas Rec.'
      FieldName = 'S_CUOTA_RE'
    end
    object QMCabecerasB_DTO_LINEAS: TFloatField
      DisplayLabel = 'B. Dto. Linea'
      FieldName = 'B_DTO_LINEAS'
    end
    object QMCabecerasDTO_PP: TFloatField
      DisplayLabel = 'Dto. PP'
      FieldName = 'DTO_PP'
    end
    object QMCabecerasDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial'
      FieldName = 'DTO_CIAL'
    end
    object QMCabecerasI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial'
      FieldName = 'I_DTO_CIAL'
    end
    object QMCabecerasI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. PP'
      FieldName = 'I_DTO_PP'
    end
    object QMCabecerasB_COMISION: TFloatField
      DisplayLabel = 'B. Comision'
      FieldName = 'B_COMISION'
    end
    object QMCabecerasI_COMISION: TFloatField
      DisplayLabel = 'Imp. Comision'
      FieldName = 'I_COMISION'
    end
    object QMCabecerasPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object QMCabecerasI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Financ.'
      FieldName = 'I_FINANCIACION'
    end
    object QMCabecerasLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMCabecerasENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMCabecerasTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
    end
    object QMCabecerasI_BASE_RETENCION: TFloatField
      DisplayLabel = 'Imp. Base Ret.'
      FieldName = 'I_BASE_RETENCION'
    end
    object QMCabecerasP_RETENCION: TFloatField
      DisplayLabel = '% Ret.'
      FieldName = 'P_RETENCION'
    end
    object QMCabecerasI_RETENCION: TFloatField
      DisplayLabel = 'Imp. Ret.'
      FieldName = 'I_RETENCION'
    end
    object QMCabecerasFUERZA_VENCIMIENTOS: TIntegerField
      DisplayLabel = 'Fuerza Venc.'
      FieldName = 'FUERZA_VENCIMIENTOS'
    end
    object QMCabecerasRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMCabecerasTIPO_IRPF: TIntegerField
      DisplayLabel = 'Tipo IRPF'
      FieldName = 'TIPO_IRPF'
    end
    object QMCabecerasA_IRPF: TIntegerField
      DisplayLabel = 'A. IRPF'
      FieldName = 'A_IRPF'
    end
    object QMCabecerasTOTAL_A_COBRAR: TFloatField
      DisplayLabel = 'Total a Cobrar'
      FieldName = 'TOTAL_A_COBRAR'
    end
    object QMCabecerasDEVOLUCION: TIntegerField
      DisplayLabel = 'Dev.'
      FieldName = 'DEVOLUCION'
    end
    object QMCabecerasSIN_DETALLE: TIntegerField
      DisplayLabel = 'Sin Det.'
      FieldName = 'SIN_DETALLE'
    end
    object QMCabecerasASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object QMCabecerasNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Com.'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMCabecerasREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMCabecerasPORTES: TIntegerField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
    end
    object QMCabecerasI_FINANCIACION_CANAL: TFloatField
      DisplayLabel = 'Imp. Finac.'
      FieldName = 'I_FINANCIACION_CANAL'
    end
    object QMCabecerasTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMCabecerasCENTRO_COSTE: TIntegerField
      DisplayLabel = 'C. Coste'
      FieldName = 'CENTRO_COSTE'
    end
    object QMCabecerasID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object QMCabecerasPROCESO_AUTO: TIntegerField
      DisplayLabel = 'Proc. Auto.'
      FieldName = 'PROCESO_AUTO'
    end
    object QMCabecerasFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fecha Entrega'
      FieldName = 'FECHA_ENTREGA'
    end
    object QMCabecerasIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMCabecerasRECT: TIntegerField
      DisplayLabel = 'Rect.'
      FieldName = 'RECT'
    end
    object QMCabecerasID_RECT: TIntegerField
      DisplayLabel = 'Id Rect.'
      FieldName = 'ID_RECT'
    end
    object QMCabecerasTIPO_PORTES: TIntegerField
      DisplayLabel = 'Tipo Porte'
      FieldName = 'TIPO_PORTES'
    end
    object QMCabecerasPOR_PORTES: TFloatField
      DisplayLabel = '% Porte'
      FieldName = 'POR_PORTES'
    end
    object QMCabecerasI_PORTES: TFloatField
      DisplayLabel = 'Imp. Porte'
      FieldName = 'I_PORTES'
    end
    object QMCabecerasI_PORTES_CANAL: TFloatField
      DisplayLabel = 'Imp. Porte'
      FieldName = 'I_PORTES_CANAL'
    end
    object QMCabecerasRANGO: TIntegerField
      DisplayLabel = 'Rango Porte'
      FieldName = 'RANGO'
    end
    object QMCabecerasINDICE: TIntegerField
      DisplayLabel = 'Indice Porte'
      FieldName = 'INDICE'
    end
    object QMCabecerasCAMBIO_FIJO: TIntegerField
      DisplayLabel = 'Cambio Fijo'
      FieldName = 'CAMBIO_FIJO'
    end
    object QMCabecerasVALOR_CAMB_FIJO: TFloatField
      DisplayLabel = 'Valor Camb. Fijo'
      FieldName = 'VALOR_CAMB_FIJO'
    end
    object QMCabecerasPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMCabecerasNOTAS_INTERNAS_KRI: TBlobField
      DisplayLabel = 'Notas Int.'
      FieldName = 'NOTAS_INTERNAS_KRI'
      Size = 8
    end
    object QMCabecerasTIPO_LINEA_KRI: TIntegerField
      DisplayLabel = 'Tipo Linea'
      FieldName = 'TIPO_LINEA_KRI'
    end
    object QMCabecerasTIT_CONTACTO: TFIBStringField
      DisplayLabel = 'Contacto'
      FieldName = 'TIT_CONTACTO'
      Size = 81
    end
    object QMCabecerasMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object QMCabecerasZ_PREFIJO_NCF: TFIBStringField
      DisplayLabel = 'Pref. NCF'
      FieldName = 'Z_PREFIJO_NCF'
      Size = 11
    end
    object QMCabecerasZ_CONTADOR_NCF: TFIBStringField
      DisplayLabel = 'Cont. NCF'
      FieldName = 'Z_CONTADOR_NCF'
      Size = 8
    end
    object QMCabecerasZ_TIPO_NCF: TIntegerField
      DisplayLabel = 'Tipo NCF'
      FieldName = 'Z_TIPO_NCF'
    end
    object QMCabecerasCADENA_ORIGINAL: TBlobField
      DisplayLabel = 'Cad. Orig.'
      FieldName = 'CADENA_ORIGINAL'
      Size = 8
    end
    object QMCabecerasSELLO_DIGITAL: TBlobField
      DisplayLabel = 'Sello Dig.'
      FieldName = 'SELLO_DIGITAL'
      Size = 8
    end
    object QMCabecerasCERTIFICADO: TBlobField
      DisplayLabel = 'Cert.'
      FieldName = 'CERTIFICADO'
      Size = 8
    end
    object QMCabecerasFICHERO: TBlobField
      DisplayLabel = 'Fichero'
      FieldName = 'FICHERO'
      Size = 8
    end
    object QMCabecerasMODIFICA_DOC: TIntegerField
      DisplayLabel = 'Impreso'
      FieldName = 'MODIFICA_DOC'
    end
    object QMCabecerasNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object QMCabecerasRECC: TIntegerField
      DisplayLabel = 'R.E.C.C.'
      FieldName = 'RECC'
    end
    object QMCabecerasIMPORTE_ANTICIPO: TFloatField
      DisplayLabel = 'Imp. Antic.'
      FieldName = 'IMPORTE_ANTICIPO'
    end
    object QMCabecerasSALDO_ANTICIPO_A_CIERRE_FAC: TFloatField
      DisplayLabel = 'Saldo Antic.'
      FieldName = 'SALDO_ANTICIPO_A_CIERRE_FAC'
    end
    object QMCabecerasINVERSION_SUJETO_PASIVO: TIntegerField
      DisplayLabel = 'I.S.P.'
      FieldName = 'INVERSION_SUJETO_PASIVO'
    end
    object QMCabecerasUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object QMCabecerasEMPLEADO_RESPONSABLE: TIntegerField
      DisplayLabel = 'Empl. Resp.'
      FieldName = 'EMPLEADO_RESPONSABLE'
    end
    object QMCabecerasEMPLEADO_ATENCION: TIntegerField
      DisplayLabel = 'Emp. Atenc.'
      FieldName = 'EMPLEADO_ATENCION'
    end
    object QMCabecerasZ_OBSERVACION: TFIBStringField
      FieldName = 'Z_OBSERVACION'
      Size = 256
    end
    object QMCabecerasENTRADA_FACTURACION: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA_FACTURACION'
    end
    object QMCabecerasPEDIDO_CLIENTE: TFIBStringField
      DisplayLabel = 'Ped. Cliente'
      FieldName = 'PEDIDO_CLIENTE'
      Size = 60
    end
    object QMCabecerasDIR_COMPLETA: TFIBStringField
      DisplayLabel = 'Dir. Completa'
      FieldName = 'DIR_COMPLETA'
      Size = 76
    end
    object QMCabecerasCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object QMCabecerasLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 40
    end
    object QMCabecerasBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object QMCabecerasVALOR_CAMB_FIJO_INV: TFloatField
      DisplayLabel = 'Val. Cambio Fijo'
      FieldName = 'VALOR_CAMB_FIJO_INV'
    end
    object QMCabecerasREGISTRO_CARTERA: TIntegerField
      DisplayLabel = 'Reg. Cartera'
      FieldName = 'REGISTRO_CARTERA'
    end
    object QMCabecerasTOTAL_ANTICIPADO: TFloatField
      DisplayLabel = 'Total Antic.'
      FieldName = 'TOTAL_ANTICIPADO'
    end
    object QMCabecerasUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMCabecerasPOR_PROPINA: TFloatField
      DisplayLabel = 'Porc. Propina'
      FieldName = 'POR_PROPINA'
    end
    object QMCabecerasSFV_AUTORIZACION: TFIBStringField
      DisplayLabel = 'SFV Autorizacion'
      FieldName = 'SFV_AUTORIZACION'
    end
    object QMCabecerasSFV_NUM_DOSIFICACION: TIntegerField
      DisplayLabel = 'SFV Num Dosificacion'
      FieldName = 'SFV_NUM_DOSIFICACION'
    end
    object QMCabecerasSFV_CODIGO_CONTROL: TFIBStringField
      DisplayLabel = 'SFV Cod. Control'
      FieldName = 'SFV_CODIGO_CONTROL'
    end
    object QMCabecerasSFV_CODIGO_RESPUESTA_RAPIDA: TFIBStringField
      DisplayLabel = 'SFV Cod. Resp.'
      FieldName = 'SFV_CODIGO_RESPUESTA_RAPIDA'
      Size = 256
    end
    object QMCabecerasPOR_RETENCION_GARANTIA: TFloatField
      DisplayLabel = 'Porc. Ret. Garantia'
      FieldName = 'POR_RETENCION_GARANTIA'
    end
    object QMCabecerasI_RETENCION_GARANTIA: TFloatField
      DisplayLabel = 'Imp. Ret. Garantia'
      FieldName = 'I_RETENCION_GARANTIA'
    end
    object QMCabecerasFECHA_RETENCION_GARANTIA: TDateTimeField
      DisplayLabel = 'Fec. Ret. Garantia'
      FieldName = 'FECHA_RETENCION_GARANTIA'
    end
    object QMCabecerasID_DEV: TIntegerField
      DisplayLabel = 'Id Dev.'
      FieldName = 'ID_DEV'
    end
    object QMCabecerasID_TIPO_GIRO_CLIENTE: TIntegerField
      DisplayLabel = 'Id Tipo Giro Cliente'
      FieldName = 'ID_TIPO_GIRO_CLIENTE'
    end
    object QMCabecerasCODIGO_GIRO_CLIENTE: TIntegerField
      DisplayLabel = 'Cod. Giro Cliente'
      FieldName = 'CODIGO_GIRO_CLIENTE'
    end
    object QMCabecerasID_TIPO_GIRO_EMPRESA: TIntegerField
      DisplayLabel = 'Id tipo Giro Empresa'
      FieldName = 'ID_TIPO_GIRO_EMPRESA'
    end
    object QMCabecerasCODIGO_GIRO_EMPRESA: TIntegerField
      DisplayLabel = 'Cod. Giro Empresa'
      FieldName = 'CODIGO_GIRO_EMPRESA'
    end
    object QMCabecerasTIPO_VENTA: TIntegerField
      DisplayLabel = 'Tipo Venta'
      FieldName = 'TIPO_VENTA'
    end
    object QMCabecerasCODIGO_RESPUESTA_SII: TMemoField
      DisplayLabel = 'Cod. Resp. SII'
      FieldName = 'CODIGO_RESPUESTA_SII'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabecerasFOLIO: TIntegerField
      DisplayLabel = 'Folio'
      FieldName = 'FOLIO'
    end
    object QMCabecerasTIPO_DOC_TRIBUTARIO: TFIBStringField
      DisplayLabel = 'Tipo Doc. Tributario'
      FieldName = 'TIPO_DOC_TRIBUTARIO'
      Size = 3
    end
    object QMCabecerasID_TIPO_DESPACHO: TIntegerField
      DisplayLabel = 'Id Tipo Despacho'
      FieldName = 'ID_TIPO_DESPACHO'
    end
    object QMCabecerasSII_FMA_PAGO: TIntegerField
      DisplayLabel = 'SII Firma Pago'
      FieldName = 'SII_FMA_PAGO'
    end
    object QMCabecerasSIN_RECIBOS: TIntegerField
      DisplayLabel = 'Sin Recibos'
      FieldName = 'SIN_RECIBOS'
    end
    object QMCabecerasFECHA_CON: TDateTimeField
      DisplayLabel = 'Fec. Cont.'
      FieldName = 'FECHA_CON'
    end
    object QMCabecerasFECHA_ENTREGA_REPARTO: TDateTimeField
      DisplayLabel = 'Fec. Entrega Reparto'
      FieldName = 'FECHA_ENTREGA_REPARTO'
    end
    object QMCabecerasEMPAQUETADO_EMPRESA: TIntegerField
      DisplayLabel = 'Empaq. Empresa'
      FieldName = 'EMPAQUETADO_EMPRESA'
    end
    object QMCabecerasDIR_RECOGIDA_MANUAL: TMemoField
      DisplayLabel = 'Dir. Recogida Manual'
      FieldName = 'DIR_RECOGIDA_MANUAL'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabecerasDIR_ENTREGA_MANUAL: TMemoField
      DisplayLabel = 'Dir. Entrega Manual'
      FieldName = 'DIR_ENTREGA_MANUAL'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabecerasEQUIPO_RECOGIDA: TFIBStringField
      DisplayLabel = 'Equip. Recogida'
      FieldName = 'EQUIPO_RECOGIDA'
      Size = 40
    end
    object QMCabecerasEQUIPO_ENTREGA: TFIBStringField
      DisplayLabel = 'Equip. Entrega'
      FieldName = 'EQUIPO_ENTREGA'
      Size = 40
    end
    object QMCabecerasMATRICULA_RECOGIDA: TFIBStringField
      DisplayLabel = 'Matr. Recogida'
      FieldName = 'MATRICULA_RECOGIDA'
      Size = 40
    end
    object QMCabecerasMATRICULA_ENTREGA: TFIBStringField
      DisplayLabel = 'Matr. Entrega'
      FieldName = 'MATRICULA_ENTREGA'
      Size = 40
    end
    object QMCabecerasFECHA_RECOGIDA_MANUAL: TDateTimeField
      DisplayLabel = 'Fec. Recogida Manual'
      FieldName = 'FECHA_RECOGIDA_MANUAL'
    end
    object QMCabecerasFECHA_ENTREGA_MANUAL: TDateTimeField
      DisplayLabel = 'Fec. Entrega Manual'
      FieldName = 'FECHA_ENTREGA_MANUAL'
    end
    object QMCabecerasSII_ID_DOC_REF: TIntegerField
      DisplayLabel = 'SII Id Doc. Ref.'
      FieldName = 'SII_ID_DOC_REF'
    end
    object QMCabecerasUSUARIO_CREACION: TIntegerField
      DisplayLabel = 'Usuario Creacion'
      FieldName = 'USUARIO_CREACION'
    end
    object QMCabecerasVALOR_UNIDAD_FOMENTO: TFloatField
      DisplayLabel = 'Val. Unid. Fomento'
      FieldName = 'VALOR_UNIDAD_FOMENTO'
    end
    object QMCabecerasPERIODO_FACTURACION_INI: TDateTimeField
      DisplayLabel = 'Periodo Fact. Ini.'
      FieldName = 'PERIODO_FACTURACION_INI'
    end
    object QMCabecerasPERIODO_FACTURACION_FIN: TDateTimeField
      DisplayLabel = 'Periodo Fact. Fin.'
      FieldName = 'PERIODO_FACTURACION_FIN'
    end
    object QMCabecerasINDSERVICIO: TIntegerField
      DisplayLabel = 'Ind. Servicio'
      FieldName = 'INDSERVICIO'
    end
    object QMCabecerasRECIBO_PAGADO: TIntegerField
      DisplayLabel = 'Rec. Pagado'
      FieldName = 'RECIBO_PAGADO'
    end
    object QMCabecerasLEGAL_LITERALS: TMemoField
      DisplayLabel = 'Legal Literals'
      FieldName = 'LEGAL_LITERALS'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabecerasCOD_MOTIVO_ABONO: TIntegerField
      DisplayLabel = 'Cod. Motivo Abono'
      FieldName = 'COD_MOTIVO_ABONO'
    end
    object QMCabecerasDIR_NOMBRE_2: TFIBStringField
      DisplayLabel = 'Direccion 2'
      FieldName = 'DIR_NOMBRE_2'
      Size = 40
    end
    object QMCabecerasVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Vencimiento'
      FieldName = 'VENCIMIENTO'
    end
    object QMCabecerasEMITIDA_POR_TERCEROS: TIntegerField
      FieldName = 'EMITIDA_POR_TERCEROS'
    end
    object QMCabecerasID_FICHA_TECNICA: TIntegerField
      DisplayLabel = 'Id. Fic. Tecnica'
      FieldName = 'ID_FICHA_TECNICA'
    end
    object QMCabecerasMATRICULA: TFIBStringField
      DisplayLabel = 'Matricula'
      FieldName = 'MATRICULA'
    end
    object QMCabecerasORIGEN_DOCUMENTO: TFIBStringField
      DisplayLabel = 'Orig. Documento'
      FieldName = 'ORIGEN_DOCUMENTO'
      Size = 3
    end
    object QMCabecerasTITULO_GIRO_CLIENTE: TFIBStringField
      DisplayLabel = 'Titulo Giro Cliente'
      FieldName = 'TITULO_GIRO_CLIENTE'
      Size = 150
    end
    object QMCabecerasTIPO_INGRESOS: TIntegerField
      DisplayLabel = 'Tipo Ingresos'
      FieldName = 'TIPO_INGRESOS'
    end
    object QMCabecerasGD_NROLINREF: TIntegerField
      DisplayLabel = 'G.D. Nro. Lin. Ref.'
      FieldName = 'GD_NROLINREF'
    end
    object QMCabecerasGD_TPODOCREF: TFIBStringField
      DisplayLabel = 'G.D. T. Doc. Ref.'
      FieldName = 'GD_TPODOCREF'
      Size = 3
    end
    object QMCabecerasGD_FOLIOREF: TFIBStringField
      DisplayLabel = 'G.D. Folio Ref.'
      FieldName = 'GD_FOLIOREF'
    end
    object QMCabecerasGD_RUTOTR: TFIBStringField
      DisplayLabel = 'G.D. RUT'
      FieldName = 'GD_RUTOTR'
    end
    object QMCabecerasGD_FCHREF: TDateTimeField
      DisplayLabel = 'G.D. Fec. Ref.'
      FieldName = 'GD_FCHREF'
    end
    object QMCabecerasGD_CODREF: TIntegerField
      DisplayLabel = 'G.D. Cod. Ref.'
      FieldName = 'GD_CODREF'
    end
    object QMCabecerasGD_RAZONREF: TFIBStringField
      DisplayLabel = 'G.D. Razon Ref.'
      FieldName = 'GD_RAZONREF'
      Size = 100
    end
    object QMCabecerasOC_NROLINREF: TIntegerField
      DisplayLabel = 'O.C. Nro. Lin. Ref.'
      FieldName = 'OC_NROLINREF'
    end
    object QMCabecerasOC_TPODOCREF: TFIBStringField
      DisplayLabel = 'O.C. T. Doc. Ref.'
      FieldName = 'OC_TPODOCREF'
      Size = 3
    end
    object QMCabecerasOC_FOLIOREF: TFIBStringField
      DisplayLabel = 'O.C. Folio Ref.'
      FieldName = 'OC_FOLIOREF'
    end
    object QMCabecerasOC_RUTOTR: TFIBStringField
      DisplayLabel = 'O.C. RUT'
      FieldName = 'OC_RUTOTR'
    end
    object QMCabecerasOC_FCHREF: TDateTimeField
      DisplayLabel = 'O.C. Fec. Ref.'
      FieldName = 'OC_FCHREF'
    end
    object QMCabecerasOC_CODREF: TIntegerField
      DisplayLabel = 'O.C. Cod. Ref.'
      FieldName = 'OC_CODREF'
    end
    object QMCabecerasOC_RAZONREF: TFIBStringField
      DisplayLabel = 'O.C. Razon Ref.'
      FieldName = 'OC_RAZONREF'
      Size = 100
    end
  end
  object DSQMCabeceras: TDataSource
    DataSet = QMCabeceras
    Left = 128
    Top = 56
  end
  object DSxSeries: TDataSource
    DataSet = xSeries
    Left = 128
    Top = 8
  end
  object xSeries: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CANALES_SERIES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TITULO=?TITULO')
    SelectSQL.Strings = (
      'SELECT SERIE,TITULO FROM VER_CANALES_SERIES'
      
        'where((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?cana' +
        'l))'
      'order by serie')
    UniDirectional = False
    AfterOpen = xSeriesAfterOpen
    BeforeClose = xSeriesBeforeClose
    Left = 40
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 216
    Top = 8
  end
  object xRecorre: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      'select * from tmp_cierra_facturas'
      'where entrada=?entrada'
      'order by rig')
    UniDirectional = False
    Left = 40
    Top = 104
    object xRecorreENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xRecorreEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xRecorreEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xRecorreCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xRecorreSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xRecorreTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xRecorreRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xRecorreFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xRecorreID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 280
    Top = 8
  end
end
