object DMEnviaxmLfacturasChl: TDMEnviaxmLfacturasChl
  OldCreateOrder = False
  OnCreate = DMEnviaxmLfacturasChlCreate
  OnDestroy = DataModuleDestroy
  Left = 480
  Top = 190
  Height = 574
  Width = 508
  object DSQMDocumentos: TDataSource
    DataSet = QMDocumentos
    Left = 200
    Top = 24
  end
  object QMDocumentos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT *'
      
        'FROM (SELECT A.EMPRESA, A.EJERCICIO, A.CANAL, A.SERIE, A.TIPO, A' +
        '.RIG, A.ENTRADA_FACTURACION, A.FECHA, A.CLIENTE,'
      
        'A.TITULO, A.SU_REFERENCIA, A.FORMA_PAGO, A.TOTAL_A_COBRAR, A.MON' +
        'EDA, A.TIPO_DOC_TRIBUTARIO, A.FOLIO,'
      
        'A.ID_S, 0 AS INDSERVICIO, '#39#39' AS FECHA_ENTREGA, A.INDTRASLADO AS ' +
        'INDTRASLADO,'
      
        'A.TPOIMPRESION AS TPOIMPRESION, A.ID_TIPO_DESPACHO, A.SII_FMA_PA' +
        'GO, A.CODIGO_GIRO_EMPRESA, A.TERCERO,'
      
        'A.DIRECCION, A.LIQUIDO, A.CODIGO_GIRO_CLIENTE, P.PERIODO, P.TITU' +
        'LO AS TITULO_PERIODO, V.FECHA_DOCTO,'
      
        'V.FECHA_RECLAMO, V.MONTO_TOTAL, T.NIF, TDT.TITULO AS T_D_TRIB, F' +
        'E.CANTIDAD_ERRORES, FE.SII_TRACKID,'
      'FE.XML_GENERADO, FE.XML_RESPUESTA, FE.ESTADO, FE.GLOSA,'
      
        'FE.ENVIADO_MAIL_CLIENTE, FE.ACEPTADO_CLIENTE, FE.ERR_CODE, FE.GL' +
        'OSA_ERR, FE.ID_ADJUNTO_SIE,'
      
        'FE.RECEPDTEGLOSA, FE.MENSAJE_ERROR, FE.ESTADO_DOCUMENTO, FE.GLOS' +
        'A_ESTADO_DOCUMENTO '
      'FROM VER_CABECERAS_ALBARAN A'
      
        'JOIN EMP_PERIODOS P ON A.EMPRESA = P.EMPRESA AND A.EJERCICIO = P' +
        '.EJERCICIO AND A.FECHA BETWEEN P.DESDE AND P.HASTA AND P.TIPO = ' +
        '1'
      
        'LEFT JOIN RCV_VENTA V ON A.EMPRESA = V.EMPRESA AND A.TIPO_DOC_TR' +
        'IBUTARIO = V.TIPO_DOC AND A.FOLIO = V.FOLIO'
      'LEFT JOIN SYS_TERCEROS T ON (T.TERCERO = A.TERCERO)'
      
        'LEFT JOIN SII_TIPO_DOCUMENTO_TRIBUTARIO TDT ON (A.TIPO_DOC_TRIBU' +
        'TARIO = TDT.CODIGO)'
      'LEFT JOIN GES_CABECERAS_S_FE_CHL FE ON (FE.ID_S = A.ID_S)'
      'WHERE'
      'A.EMPRESA = :EMPRESA AND'
      'A.EJERCICIO = :EJERCICIO AND'
      'A.CANAL = :CANAL AND'
      '((A.TIPO = :TIPO) OR (CAST(:TIPO AS VARCHAR(3)) = '#39#39')) AND'
      'A.TIPO <> '#39'DES'#39' AND'
      'A.TIPO_DOC_TRIBUTARIO NOT IN('#39'48'#39')'
      'UNION'
      
        'SELECT F.EMPRESA, F.EJERCICIO, F.CANAL, F.SERIE, F.TIPO, F.RIG, ' +
        'F.ENTRADA_FACTURACION, F.FECHA, F.CLIENTE,'
      
        'F.TITULO, F.SU_REFERENCIA, F.FORMA_PAGO, F.TOTAL_A_COBRAR, F.MON' +
        'EDA, F.TIPO_DOC_TRIBUTARIO, F.FOLIO,'
      
        'F.ID_S, F.INDSERVICIO, F.FECHA_ENTREGA, 0 AS INDTRASLADO, CAST('#39 +
        #39' AS VARCHAR(10)) AS TPOIMPRESION,'
      
        'F.ID_TIPO_DESPACHO, F.SII_FMA_PAGO, F.CODIGO_GIRO_EMPRESA, F.TER' +
        'CERO, F.DIRECCION, F.LIQUIDO,'
      
        'F.CODIGO_GIRO_CLIENTE, P.PERIODO, P.TITULO AS TITULO_PERIODO, V.' +
        'FECHA_DOCTO, V.FECHA_RECLAMO,'
      
        'V.MONTO_TOTAL, T.NIF, TDT.TITULO AS T_D_TRIB, FE.CANTIDAD_ERRORE' +
        'S, FE.SII_TRACKID, FE.XML_GENERADO,'
      'FE.XML_RESPUESTA, FE.ESTADO, FE.GLOSA,'
      
        'FE.ENVIADO_MAIL_CLIENTE, FE.ACEPTADO_CLIENTE, FE.ERR_CODE, FE.GL' +
        'OSA_ERR, FE.ID_ADJUNTO_SIE,'
      
        'FE.RECEPDTEGLOSA, FE.MENSAJE_ERROR, FE.ESTADO_DOCUMENTO, FE.GLOS' +
        'A_ESTADO_DOCUMENTO '
      'FROM VER_CABECERAS_FACTURA F'
      
        'JOIN EMP_PERIODOS P ON F.EMPRESA = P.EMPRESA AND F.EJERCICIO = P' +
        '.EJERCICIO AND F.FECHA BETWEEN P.DESDE AND P.HASTA AND P.TIPO = ' +
        '1'
      
        'LEFT JOIN RCV_VENTA V ON F.EMPRESA = V.EMPRESA AND F.TIPO_DOC_TR' +
        'IBUTARIO = V.TIPO_DOC AND F.FOLIO = V.FOLIO'
      'LEFT JOIN SYS_TERCEROS T ON (T.TERCERO = F.TERCERO)'
      
        'LEFT JOIN SII_TIPO_DOCUMENTO_TRIBUTARIO TDT ON (F.TIPO_DOC_TRIBU' +
        'TARIO = TDT.CODIGO)'
      'LEFT JOIN GES_CABECERAS_S_FE_CHL FE ON (FE.ID_S = F.ID_S)'
      'WHERE'
      'F.EMPRESA = :EMPRESA AND'
      'F.EJERCICIO = :EJERCICIO AND'
      'F.CANAL = :CANAL AND'
      '((F.TIPO = :TIPO) OR (CAST(:TIPO AS VARCHAR(3)) = '#39#39')) AND'
      'F.TIPO <> '#39'DES'#39' AND'
      'F.TIPO_DOC_TRIBUTARIO NOT IN('#39'48'#39')'
      ')'
      'ORDER BY EJERCICIO, SERIE, TIPO, RIG')
    SelectSQL.Strings = (
      '/* Se modifica dinamicamente */'
      'SELECT *'
      
        'FROM (SELECT A.EMPRESA, A.EJERCICIO, A.CANAL, A.SERIE, A.TIPO, A' +
        '.RIG, A.ENTRADA_FACTURACION, A.FECHA, A.CLIENTE,'
      
        'A.TITULO, A.SU_REFERENCIA, A.FORMA_PAGO, A.TOTAL_A_COBRAR, A.MON' +
        'EDA, A.TIPO_DOC_TRIBUTARIO, A.FOLIO,'
      
        'A.ID_S, 0 AS INDSERVICIO, '#39#39' AS FECHA_ENTREGA, A.INDTRASLADO AS ' +
        'INDTRASLADO,'
      
        'A.TPOIMPRESION AS TPOIMPRESION, A.ID_TIPO_DESPACHO, A.SII_FMA_PA' +
        'GO, A.CODIGO_GIRO_EMPRESA, A.TERCERO,'
      
        'A.DIRECCION, A.LIQUIDO, A.CODIGO_GIRO_CLIENTE, P.PERIODO, P.TITU' +
        'LO AS TITULO_PERIODO, V.FECHA_DOCTO,'
      
        'V.FECHA_RECLAMO, V.MONTO_TOTAL, T.NIF, TDT.TITULO AS T_D_TRIB, F' +
        'E.CANTIDAD_ERRORES, FE.SII_TRACKID,'
      'FE.XML_GENERADO, FE.XML_RESPUESTA, FE.ESTADO, FE.GLOSA,'
      
        'FE.ENVIADO_MAIL_CLIENTE, FE.ACEPTADO_CLIENTE, FE.ERR_CODE, FE.GL' +
        'OSA_ERR, FE.ID_ADJUNTO_SIE,'
      
        'FE.RECEPDTEGLOSA, FE.MENSAJE_ERROR, FE.ESTADO_DOCUMENTO, FE.GLOS' +
        'A_ESTADO_DOCUMENTO '
      'FROM VER_CABECERAS_ALBARAN A'
      
        'JOIN EMP_PERIODOS P ON A.EMPRESA = P.EMPRESA AND A.EJERCICIO = P' +
        '.EJERCICIO AND A.FECHA BETWEEN P.DESDE AND P.HASTA AND P.TIPO = ' +
        '1'
      
        'LEFT JOIN RCV_VENTA V ON A.EMPRESA = V.EMPRESA AND A.TIPO_DOC_TR' +
        'IBUTARIO = V.TIPO_DOC AND A.FOLIO = V.FOLIO'
      'LEFT JOIN SYS_TERCEROS T ON (T.TERCERO = A.TERCERO)'
      
        'LEFT JOIN SII_TIPO_DOCUMENTO_TRIBUTARIO TDT ON (A.TIPO_DOC_TRIBU' +
        'TARIO = TDT.CODIGO)'
      'LEFT JOIN GES_CABECERAS_S_FE_CHL FE ON (FE.ID_S = A.ID_S)'
      'WHERE'
      'A.EMPRESA = :EMPRESA AND'
      'A.EJERCICIO = :EJERCICIO AND'
      'A.CANAL = :CANAL AND'
      '((A.TIPO = :TIPO) OR (CAST(:TIPO AS VARCHAR(3)) = '#39#39')) AND'
      'A.TIPO <> '#39'DES'#39' AND'
      'A.TIPO_DOC_TRIBUTARIO NOT IN('#39'48'#39')'
      'UNION'
      
        'SELECT F.EMPRESA, F.EJERCICIO, F.CANAL, F.SERIE, F.TIPO, F.RIG, ' +
        'F.ENTRADA_FACTURACION, F.FECHA, F.CLIENTE,'
      
        'F.TITULO, F.SU_REFERENCIA, F.FORMA_PAGO, F.TOTAL_A_COBRAR, F.MON' +
        'EDA, F.TIPO_DOC_TRIBUTARIO, F.FOLIO,'
      
        'F.ID_S, F.INDSERVICIO, F.FECHA_ENTREGA, 0 AS INDTRASLADO, CAST('#39 +
        #39' AS VARCHAR(10)) AS TPOIMPRESION,'
      
        'F.ID_TIPO_DESPACHO, F.SII_FMA_PAGO, F.CODIGO_GIRO_EMPRESA, F.TER' +
        'CERO, F.DIRECCION, F.LIQUIDO,'
      
        'F.CODIGO_GIRO_CLIENTE, P.PERIODO, P.TITULO AS TITULO_PERIODO, V.' +
        'FECHA_DOCTO, V.FECHA_RECLAMO,'
      
        'V.MONTO_TOTAL, T.NIF, TDT.TITULO AS T_D_TRIB, FE.CANTIDAD_ERRORE' +
        'S, FE.SII_TRACKID, FE.XML_GENERADO,'
      'FE.XML_RESPUESTA, FE.ESTADO, FE.GLOSA,'
      
        'FE.ENVIADO_MAIL_CLIENTE, FE.ACEPTADO_CLIENTE, FE.ERR_CODE, FE.GL' +
        'OSA_ERR, FE.ID_ADJUNTO_SIE,'
      
        'FE.RECEPDTEGLOSA, FE.MENSAJE_ERROR, FE.ESTADO_DOCUMENTO, FE.GLOS' +
        'A_ESTADO_DOCUMENTO '
      'FROM VER_CABECERAS_FACTURA F'
      
        'JOIN EMP_PERIODOS P ON F.EMPRESA = P.EMPRESA AND F.EJERCICIO = P' +
        '.EJERCICIO AND F.FECHA BETWEEN P.DESDE AND P.HASTA AND P.TIPO = ' +
        '1'
      
        'LEFT JOIN RCV_VENTA V ON F.EMPRESA = V.EMPRESA AND F.TIPO_DOC_TR' +
        'IBUTARIO = V.TIPO_DOC AND F.FOLIO = V.FOLIO'
      'LEFT JOIN SYS_TERCEROS T ON (T.TERCERO = F.TERCERO)'
      
        'LEFT JOIN SII_TIPO_DOCUMENTO_TRIBUTARIO TDT ON (F.TIPO_DOC_TRIBU' +
        'TARIO = TDT.CODIGO)'
      'LEFT JOIN GES_CABECERAS_S_FE_CHL FE ON (FE.ID_S = F.ID_S)'
      'WHERE'
      'F.EMPRESA = :EMPRESA AND'
      'F.EJERCICIO = :EJERCICIO AND'
      'F.CANAL = :CANAL AND'
      '((F.TIPO = :TIPO) OR (CAST(:TIPO AS VARCHAR(3)) = '#39#39')) AND'
      'F.TIPO <> '#39'DES'#39' AND'
      'F.TIPO_DOC_TRIBUTARIO NOT IN('#39'48'#39')'
      ')'
      'ORDER BY EJERCICIO, SERIE, TIPO, RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'EXECUTE PROCEDURE G_MARCA_DOC_VENTA(:ID_S, :ENTRADA_FACTURACION)')
    OnCalcFields = QMDocumentosCalcFields
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 24
    object QMDocumentosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDocumentosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDocumentosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDocumentosSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDocumentosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDocumentosRIG: TIntegerField
      DisplayLabel = 'R.I.G.'
      FieldName = 'RIG'
    end
    object QMDocumentosENTRADA_FACTURACION: TIntegerField
      DisplayLabel = 'Enviar'
      FieldName = 'ENTRADA_FACTURACION'
    end
    object QMDocumentosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMDocumentosCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMDocumentosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMDocumentosSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMDocumentosFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMDocumentosTOTAL_A_COBRAR: TFloatField
      DisplayLabel = 'Total a Cobrar'
      FieldName = 'TOTAL_A_COBRAR'
    end
    object QMDocumentosMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMDocumentosTIPO_DOC_TRIBUTARIO: TFIBStringField
      DisplayLabel = 'Tipo Doc. Trib.'
      FieldName = 'TIPO_DOC_TRIBUTARIO'
      Size = 3
    end
    object QMDocumentosID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object QMDocumentosINDTRASLADO: TIntegerField
      FieldName = 'INDTRASLADO'
    end
    object QMDocumentosTPOIMPRESION: TFIBStringField
      FieldName = 'TPOIMPRESION'
      Size = 10
    end
    object QMDocumentosID_TIPO_DESPACHO: TIntegerField
      FieldName = 'ID_TIPO_DESPACHO'
    end
    object QMDocumentosSII_FMA_PAGO: TIntegerField
      FieldName = 'SII_FMA_PAGO'
    end
    object QMDocumentosCODIGO_GIRO_EMPRESA: TIntegerField
      FieldName = 'CODIGO_GIRO_EMPRESA'
    end
    object QMDocumentosTERCERO: TIntegerField
      FieldName = 'TERCERO'
    end
    object QMDocumentosDIRECCION: TIntegerField
      FieldName = 'DIRECCION'
    end
    object QMDocumentosLIQUIDO: TFloatField
      FieldName = 'LIQUIDO'
    end
    object QMDocumentosCODIGO_GIRO_CLIENTE: TIntegerField
      FieldName = 'CODIGO_GIRO_CLIENTE'
    end
    object QMDocumentosPERIODO: TStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
    end
    object QMDocumentosFECHA_DOCTO: TDateTimeField
      DisplayLabel = 'Fec. Doc.'
      FieldName = 'FECHA_DOCTO'
    end
    object QMDocumentosFECHA_RECLAMO: TDateTimeField
      DisplayLabel = 'Fec. Reclamo'
      FieldName = 'FECHA_RECLAMO'
    end
    object QMDocumentosMONTO_TOTAL: TFloatField
      DisplayLabel = 'Monto Total'
      FieldName = 'MONTO_TOTAL'
    end
    object QMDocumentosNIF: TFIBStringField
      DisplayLabel = 'RUT'
      FieldName = 'NIF'
    end
    object QMDocumentosFOLIO: TIntegerField
      DisplayLabel = 'Folio'
      FieldName = 'FOLIO'
    end
    object QMDocumentosT_D_TRIB: TFIBStringField
      DisplayLabel = 'Documento Tributario'
      FieldName = 'T_D_TRIB'
      Size = 60
    end
    object QMDocumentosENVIADO_MAIL_CLIENTE: TIntegerField
      DisplayLabel = 'Enviado Mail Cliente'
      FieldName = 'ENVIADO_MAIL_CLIENTE'
      ReadOnly = True
    end
    object QMDocumentosACEPTADO_CLIENTE: TIntegerField
      DisplayLabel = 'Aceptado Cliente'
      FieldName = 'ACEPTADO_CLIENTE'
      ReadOnly = True
    end
    object QMDocumentosESTADO: TFIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      Size = 15
    end
    object QMDocumentosGLOSA: TFIBStringField
      DisplayLabel = 'Estado - Glosa'
      FieldName = 'GLOSA'
      Size = 256
    end
    object QMDocumentosERR_CODE: TFIBStringField
      DisplayLabel = 'Con. Cod. Error'
      FieldName = 'ERR_CODE'
      Size = 15
    end
    object QMDocumentosGLOSA_ERR: TFIBStringField
      DisplayLabel = 'Con. Error Glosa'
      FieldName = 'GLOSA_ERR'
      Size = 256
    end
    object QMDocumentosENVIADO_SII: TSmallintField
      DisplayLabel = 'Enviado SII'
      FieldKind = fkCalculated
      FieldName = 'ENVIADO_SII'
      OnGetText = QMDocumentosENVIADO_SIIGetText
      Calculated = True
    end
    object QMDocumentosCANTIDAD_ERRORES: TIntegerField
      DisplayLabel = 'Cant. Errores'
      FieldName = 'CANTIDAD_ERRORES'
    end
    object QMDocumentosSII_TRACKID: TFIBStringField
      DisplayLabel = 'Track Id'
      FieldName = 'SII_TRACKID'
    end
    object QMDocumentosESTADO_SII: TSmallintField
      DisplayLabel = 'Estado SII'
      FieldKind = fkCalculated
      FieldName = 'ESTADO_SII'
      OnGetText = QMDocumentosESTADO_SIIGetText
      Calculated = True
    end
    object QMDocumentosEstadoDteCliente: TSmallintField
      FieldKind = fkCalculated
      FieldName = 'EstadoDteCliente'
      OnGetText = QMDocumentosEstadoDteClienteGetText
      Calculated = True
    end
    object QMDocumentosID_ADJUNTO_SIE: TIntegerField
      DisplayLabel = 'ID Adjunto SIE'
      FieldName = 'ID_ADJUNTO_SIE'
    end
    object QMDocumentosRECEPDTEGLOSA: TFIBStringField
      FieldName = 'RECEPDTEGLOSA'
      Size = 256
    end
    object QMDocumentosINDSERVICIO: TIntegerField
      FieldName = 'INDSERVICIO'
    end
    object QMDocumentosFECHA_ENTREGA: TFIBStringField
      FieldName = 'FECHA_ENTREGA'
      Size = 25
    end
    object QMDocumentosXML_GENERADO: TMemoField
      FieldName = 'XML_GENERADO'
      BlobType = ftMemo
      Size = 8
    end
    object QMDocumentosXML_RESPUESTA: TMemoField
      FieldName = 'XML_RESPUESTA'
      BlobType = ftMemo
      Size = 8
    end
    object QMDocumentosMENSAJE_ERROR: TFIBStringField
      DisplayLabel = 'Msj. Conexion SII'
      FieldName = 'MENSAJE_ERROR'
      Size = 100
    end
    object QMDocumentosXML_DTE_RECIBIDO: TIntegerField
      DisplayLabel = 'XML DTE Recibido'
      FieldKind = fkCalculated
      FieldName = 'XML_DTE_RECIBIDO'
      ReadOnly = True
      Calculated = True
    end
    object QMDocumentosXML_RESPUESTA_ENVIO: TIntegerField
      DisplayLabel = 'XML Respuesta Envio'
      FieldKind = fkCalculated
      FieldName = 'XML_RESPUESTA_ENVIO'
      ReadOnly = True
      Calculated = True
    end
    object QMDocumentosESTADO_DOCUMENTO: TFIBStringField
      DisplayLabel = 'Con. Estado Doc.'
      FieldName = 'ESTADO_DOCUMENTO'
      Size = 15
    end
    object QMDocumentosGLOSA_ESTADO_DOCUMENTO: TFIBStringField
      DisplayLabel = 'Con. Glosa Estado Doc.'
      FieldName = 'GLOSA_ESTADO_DOCUMENTO'
      Size = 256
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 312
    Top = 24
  end
  object QMDetalleFactura: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT ORDEN, LINEA, ARTICULO, TITULO, UNIDADES, PRECIO, I_DESCU' +
        'ENTO, NOTAS, DESCUENTO'
      'FROM VER_DETALLE_FACTURA'
      'WHERE'
      'ID_S = ?ID_S AND'
      'CERTIFICADO = 0 AND'
      'CERT_NEGATIVO = 0'
      'UNION'
      
        'SELECT ORDEN, LINEA, ARTICULO, TITULO, UNIDADES, PRECIO, I_DESCU' +
        'ENTO, NOTAS, DESCUENTO'
      'FROM VER_DETALLE_ALBARAN'
      'WHERE'
      'ID_S = ?ID_S'
      ''
      'ORDER BY 1 /*ORDEN*/   ')
    UniDirectional = False
    DataSource = DSQMDTE
    Left = 56
    Top = 72
    object QMDetalleFacturaLINEA: TIntegerField
      FieldName = 'LINEA'
    end
    object QMDetalleFacturaARTICULO: TFIBStringField
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDetalleFacturaTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 256
    end
    object QMDetalleFacturaUNIDADES: TFloatField
      FieldName = 'UNIDADES'
    end
    object QMDetalleFacturaPRECIO: TFloatField
      FieldName = 'PRECIO'
    end
    object QMDetalleFacturaI_DESCUENTO: TFloatField
      FieldName = 'I_DESCUENTO'
    end
    object QMDetalleFacturaNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMDetalleFacturaDESCUENTO: TFloatField
      FieldName = 'DESCUENTO'
    end
    object QMDetalleFacturaORDEN: TIntegerField
      FieldName = 'ORDEN'
    end
  end
  object DSDetalleFactura: TDataSource
    DataSet = QMDetalleFactura
    Left = 200
    Top = 72
  end
  object QMCabeceraFEChile: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_FE_CHL '
      'WHERE '
      'ID_S = :ID_S')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_FE_CHL'
      'WHERE '
      'ID_S = :ID_S')
    UniDirectional = False
    DataSource = DSQMDTE
    Left = 56
    Top = 120
    object QMCabeceraFEChileID_S: TIntegerField
      FieldName = 'ID_S'
    end
    object QMCabeceraFEChileINDSERVICIO: TIntegerField
      FieldName = 'INDSERVICIO'
    end
    object QMCabeceraFEChileMNTBRUTO: TFloatField
      FieldName = 'MNTBRUTO'
    end
    object QMCabeceraFEChileTPOTRANCOMPRA: TIntegerField
      FieldName = 'TPOTRANCOMPRA'
    end
    object QMCabeceraFEChileTPOTRANVENTA: TIntegerField
      FieldName = 'TPOTRANVENTA'
    end
    object QMCabeceraFEChileFMAPAGO: TIntegerField
      FieldName = 'FMAPAGO'
    end
    object QMCabeceraFEChileFCHCANCEL: TDateTimeField
      FieldName = 'FCHCANCEL'
    end
    object QMCabeceraFEChileMNTCANCEL: TFloatField
      FieldName = 'MNTCANCEL'
    end
    object QMCabeceraFEChileSALDOINSOL: TFloatField
      FieldName = 'SALDOINSOL'
    end
    object QMCabeceraFEChileMEDIOPAGO: TFIBStringField
      FieldName = 'MEDIOPAGO'
      Size = 15
    end
    object QMCabeceraFEChileTIPOCTAPAGO: TFIBStringField
      FieldName = 'TIPOCTAPAGO'
      Size = 15
    end
    object QMCabeceraFEChileNUMCTAPAGO: TFIBStringField
      FieldName = 'NUMCTAPAGO'
      Size = 15
    end
    object QMCabeceraFEChileBCOPAGO: TFIBStringField
      FieldName = 'BCOPAGO'
      Size = 40
    end
    object QMCabeceraFEChileTERMPAGOCDG: TFIBStringField
      FieldName = 'TERMPAGOCDG'
      Size = 15
    end
    object QMCabeceraFEChileTERMPAGOGLOSA: TFIBStringField
      FieldName = 'TERMPAGOGLOSA'
      Size = 100
    end
    object QMCabeceraFEChileTERMPAGODIAS: TFloatField
      FieldName = 'TERMPAGODIAS'
    end
    object QMCabeceraFEChileFCHVENC: TDateTimeField
      FieldName = 'FCHVENC'
    end
    object QMCabeceraFEChileTIPOFACTESP: TFloatField
      FieldName = 'TIPOFACTESP'
    end
    object QMCabeceraFEChileGIROEMIS: TFIBStringField
      FieldName = 'GIROEMIS'
      Size = 100
    end
    object QMCabeceraFEChileRUTEMISOR: TFIBStringField
      FieldName = 'RUTEMISOR'
      Size = 15
    end
    object QMCabeceraFEChileRZNSOC: TFIBStringField
      FieldName = 'RZNSOC'
      Size = 100
    end
    object QMCabeceraFEChileTELEFONO: TFIBStringField
      FieldName = 'TELEFONO'
      Size = 15
    end
    object QMCabeceraFEChileCORREOEMISOR: TFIBStringField
      FieldName = 'CORREOEMISOR'
      Size = 100
    end
    object QMCabeceraFEChileACTECO: TIntegerField
      FieldName = 'ACTECO'
    end
    object QMCabeceraFEChileSUCURSAL: TFIBStringField
      FieldName = 'SUCURSAL'
      Size = 100
    end
    object QMCabeceraFEChileCDGSIISUCUR: TIntegerField
      FieldName = 'CDGSIISUCUR'
    end
    object QMCabeceraFEChileDIRORIGEN: TFIBStringField
      FieldName = 'DIRORIGEN'
      Size = 100
    end
    object QMCabeceraFEChileCMNAORIGEN: TFIBStringField
      FieldName = 'CMNAORIGEN'
    end
    object QMCabeceraFEChileCIUDADORIGEN: TFIBStringField
      FieldName = 'CIUDADORIGEN'
    end
    object QMCabeceraFEChileCDGVENDEDOR: TFIBStringField
      FieldName = 'CDGVENDEDOR'
      Size = 100
    end
    object QMCabeceraFEChileRUTMANDANTE: TFIBStringField
      FieldName = 'RUTMANDANTE'
      Size = 15
    end
    object QMCabeceraFEChileRUTRECEP: TFIBStringField
      FieldName = 'RUTRECEP'
      Size = 15
    end
    object QMCabeceraFEChileCDGINTRECEP: TFIBStringField
      FieldName = 'CDGINTRECEP'
    end
    object QMCabeceraFEChileRZNSOCRECEP: TFIBStringField
      FieldName = 'RZNSOCRECEP'
      Size = 100
    end
    object QMCabeceraFEChileNUMID: TFIBStringField
      FieldName = 'NUMID'
    end
    object QMCabeceraFEChileNACIONALIDAD: TFIBStringField
      FieldName = 'NACIONALIDAD'
      Size = 15
    end
    object QMCabeceraFEChileTIPODOCID: TFIBStringField
      FieldName = 'TIPODOCID'
    end
    object QMCabeceraFEChileGIRORECEP: TFIBStringField
      FieldName = 'GIRORECEP'
      Size = 40
    end
    object QMCabeceraFEChileCONTACTO: TFIBStringField
      FieldName = 'CONTACTO'
      Size = 100
    end
    object QMCabeceraFEChileCORREORECEP: TFIBStringField
      FieldName = 'CORREORECEP'
      Size = 100
    end
    object QMCabeceraFEChileDIRRECEP: TFIBStringField
      FieldName = 'DIRRECEP'
      Size = 100
    end
    object QMCabeceraFEChileCMNARECEP: TFIBStringField
      FieldName = 'CMNARECEP'
    end
    object QMCabeceraFEChileCIUDADRECEP: TFIBStringField
      FieldName = 'CIUDADRECEP'
    end
    object QMCabeceraFEChileDIRPOSTAL: TFIBStringField
      FieldName = 'DIRPOSTAL'
      Size = 100
    end
    object QMCabeceraFEChileCMNAPOSTAL: TFIBStringField
      FieldName = 'CMNAPOSTAL'
    end
    object QMCabeceraFEChileCIUDADPOSTAL: TFIBStringField
      FieldName = 'CIUDADPOSTAL'
    end
    object QMCabeceraFEChileRUTSOLICITA: TFIBStringField
      FieldName = 'RUTSOLICITA'
    end
    object QMCabeceraFEChilePATENTE: TFIBStringField
      FieldName = 'PATENTE'
    end
    object QMCabeceraFEChileRUTTRANS: TFIBStringField
      FieldName = 'RUTTRANS'
    end
    object QMCabeceraFEChileRUTCHOFER: TFIBStringField
      FieldName = 'RUTCHOFER'
    end
    object QMCabeceraFEChileNOMBRECHOFER: TFIBStringField
      FieldName = 'NOMBRECHOFER'
      Size = 40
    end
    object QMCabeceraFEChileDIRDEST: TFIBStringField
      FieldName = 'DIRDEST'
      Size = 100
    end
    object QMCabeceraFEChileCMNADEST: TFIBStringField
      FieldName = 'CMNADEST'
    end
    object QMCabeceraFEChileCIUDADDEST: TFIBStringField
      FieldName = 'CIUDADDEST'
    end
    object QMCabeceraFEChileMNTNETO: TFloatField
      FieldName = 'MNTNETO'
    end
    object QMCabeceraFEChileMNTEXE: TFloatField
      FieldName = 'MNTEXE'
    end
    object QMCabeceraFEChileMNTBASE: TFloatField
      FieldName = 'MNTBASE'
    end
    object QMCabeceraFEChileMNTMARGENCOM: TFloatField
      FieldName = 'MNTMARGENCOM'
    end
    object QMCabeceraFEChileTASAIVA: TFloatField
      FieldName = 'TASAIVA'
    end
    object QMCabeceraFEChileIVA: TFloatField
      FieldName = 'IVA'
    end
    object QMCabeceraFEChileVAPROP: TFloatField
      FieldName = 'VAPROP'
    end
    object QMCabeceraFEChileIVATERC: TFloatField
      FieldName = 'IVATERC'
    end
    object QMCabeceraFEChileCREDEC: TFloatField
      FieldName = 'CREDEC'
    end
    object QMCabeceraFEChileGRNTDEP: TFloatField
      FieldName = 'GRNTDEP'
    end
    object QMCabeceraFEChileMNTTOTAL: TFloatField
      FieldName = 'MNTTOTAL'
    end
    object QMCabeceraFEChileMONTONF: TFloatField
      FieldName = 'MONTONF'
    end
    object QMCabeceraFEChileMONTOPERIODO: TFloatField
      FieldName = 'MONTOPERIODO'
    end
    object QMCabeceraFEChileSALDOANTERIOR: TFloatField
      FieldName = 'SALDOANTERIOR'
    end
    object QMCabeceraFEChileVLRPAGAR: TFloatField
      FieldName = 'VLRPAGAR'
    end
    object QMCabeceraFEChileTPOMONEDA: TFIBStringField
      FieldName = 'TPOMONEDA'
    end
    object QMCabeceraFEChileTPOCAMBIO: TFloatField
      FieldName = 'TPOCAMBIO'
    end
    object QMCabeceraFEChileMNTNETOOTRMNDA: TFloatField
      FieldName = 'MNTNETOOTRMNDA'
    end
    object QMCabeceraFEChileMNTEXEOTRMNDA: TFloatField
      FieldName = 'MNTEXEOTRMNDA'
    end
    object QMCabeceraFEChileMNTFAECARNEOTRMNDA: TFloatField
      FieldName = 'MNTFAECARNEOTRMNDA'
    end
    object QMCabeceraFEChileMNTMARGCOMOTRMNDA: TFloatField
      FieldName = 'MNTMARGCOMOTRMNDA'
    end
    object QMCabeceraFEChileIVAOTRMNDA: TFloatField
      FieldName = 'IVAOTRMNDA'
    end
    object QMCabeceraFEChileVANORETOTRMNDA: TFloatField
      FieldName = 'VANORETOTRMNDA'
    end
    object QMCabeceraFEChileMNTTOTOTRMNDA: TFloatField
      FieldName = 'MNTTOTOTRMNDA'
    end
    object QMCabeceraFEChileXML_GENERADO: TMemoField
      FieldName = 'XML_GENERADO'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabeceraFEChileSII_TRACKID: TFIBStringField
      FieldName = 'SII_TRACKID'
    end
    object QMCabeceraFEChileXML_RESPUESTA: TMemoField
      FieldName = 'XML_RESPUESTA'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabeceraFEChileNROLINREF: TIntegerField
      FieldName = 'NROLINREF'
    end
    object QMCabeceraFEChileTPODOCREF: TFIBStringField
      FieldName = 'TPODOCREF'
      Size = 3
    end
    object QMCabeceraFEChileRUTOTR: TFIBStringField
      FieldName = 'RUTOTR'
    end
    object QMCabeceraFEChileFCHREF: TDateTimeField
      FieldName = 'FCHREF'
    end
    object QMCabeceraFEChileCODREF: TIntegerField
      FieldName = 'CODREF'
    end
    object QMCabeceraFEChileRAZONREF: TFIBStringField
      FieldName = 'RAZONREF'
      Size = 100
    end
    object QMCabeceraFEChileTIMBRE_TEXTO: TMemoField
      FieldName = 'TIMBRE_TEXTO'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabeceraFEChileTIMBRE_COD_BARRA: TBlobField
      FieldName = 'TIMBRE_COD_BARRA'
      Size = 8
    end
    object QMCabeceraFEChileFOLIOREF: TFIBStringField
      FieldName = 'FOLIOREF'
      Size = 40
    end
    object QMCabeceraFEChileESTADO_DOCUMENTO: TFIBStringField
      DisplayLabel = 'Estado Doc.'
      FieldName = 'ESTADO_DOCUMENTO'
      Size = 15
    end
    object QMCabeceraFEChileGLOSA_ESTADO_DOCUMENTO: TFIBStringField
      DisplayLabel = 'Glosa Estado Doc.'
      FieldName = 'GLOSA_ESTADO_DOCUMENTO'
      Size = 256
    end
    object QMCabeceraFEChileESTADO: TFIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      Size = 15
    end
    object QMCabeceraFEChileGLOSA: TFIBStringField
      DisplayLabel = 'Glosa'
      FieldName = 'GLOSA'
      Size = 256
    end
    object QMCabeceraFEChileERR_CODE: TFIBStringField
      DisplayLabel = 'Err. Codigo'
      FieldName = 'ERR_CODE'
      Size = 15
    end
    object QMCabeceraFEChileGLOSA_ERR: TFIBStringField
      DisplayLabel = 'Glosa Error'
      FieldName = 'GLOSA_ERR'
      Size = 256
    end
  end
  object DSCabeceraFEChile: TDataSource
    DataSet = QMCabeceraFEChile
    Left = 200
    Top = 120
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 384
    Top = 24
  end
  object QMSIIDteReferencia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM SII_DTE_REFERENCIA WHERE ID_S = :ID_S')
    SelectSQL.Strings = (
      'SELECT DTE.*, FAC.FOLIO'
      'FROM SII_DTE_REFERENCIA DTE'
      'LEFT JOIN GES_CABECERAS_S_FAC FAC ON (DTE.ID_S_REF = FAC.ID_S)'
      'WHERE'
      'DTE.ID_S = :ID_S'
      'ORDER BY DTE.NROLINREF')
    UniDirectional = False
    DataSource = DSQMDTE
    Left = 56
    Top = 168
    object QMSIIDteReferenciaID_S: TIntegerField
      FieldName = 'ID_S'
    end
    object QMSIIDteReferenciaNROLINREF: TIntegerField
      FieldName = 'NROLINREF'
    end
    object QMSIIDteReferenciaTPODOCREF: TFIBStringField
      FieldName = 'TPODOCREF'
      Size = 3
    end
    object QMSIIDteReferenciaFCHREF: TDateTimeField
      FieldName = 'FCHREF'
    end
    object QMSIIDteReferenciaCODREF: TIntegerField
      FieldName = 'CODREF'
    end
    object QMSIIDteReferenciaRAZONREF: TFIBStringField
      FieldName = 'RAZONREF'
      Size = 100
    end
    object QMSIIDteReferenciaFOLIO: TIntegerField
      FieldName = 'FOLIO'
    end
    object QMSIIDteReferenciaID_S_REF: TIntegerField
      FieldName = 'ID_S_REF'
    end
    object QMSIIDteReferenciaRUTOTR: TFIBStringField
      FieldName = 'RUTOTR'
    end
    object QMSIIDteReferenciaFOLIOREF: TFIBStringField
      DisplayLabel = 'Folio Ref.'
      FieldName = 'FOLIOREF'
    end
  end
  object DSQMSIIDteReferencia: TDataSource
    DataSet = QMSIIDteReferencia
    Left = 200
    Top = 168
  end
  object DSQMSIITipDocTributario: TDataSource
    DataSet = QMSIITipDocTributario
    Left = 200
    Top = 216
  end
  object QMSIITipDocTributario: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM SII_TIPO_DOCUMENTO_TRIBUTARIO'
      'WHERE'
      'CODIGO = :CODIGO')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SII_TIPO_DOCUMENTO_TRIBUTARIO'
      'WHERE'
      'VISIBLE_ALB = 1 OR VISIBLE_FAC = 1'
      'ORDER BY CODIGO')
    UniDirectional = False
    Left = 56
    Top = 216
    object QMSIITipDocTributarioCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object QMSIITipDocTributarioTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMSIITipDocTributarioVISIBLE_ALB: TIntegerField
      DisplayLabel = 'Visible (ALB)'
      FieldName = 'VISIBLE_ALB'
    end
    object QMSIITipDocTributarioVISIBLE_FAC: TIntegerField
      DisplayLabel = 'Visible (FAC)'
      FieldName = 'VISIBLE_FAC'
    end
  end
  object DSQMRCV_VENTA: TDataSource
    DataSet = QMRCV_VENTA
    Left = 200
    Top = 264
  end
  object QMRCV_VENTA: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM RCV_VENTA'
      'WHERE'
      '  FOLIO=?old_FOLIO AND '
      '  TIPO_DOC=?old_TIPO_DOC AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO RCV_VENTA'
      
        '  (EMPRESA,TIPO_DOC,TIPO_VENTA,RUT_CLIENTE,RAZON_SOCIAL,FOLIO,FE' +
        'CHA_DOCTO,FECHA_RECEPCION,FECHA_ACUSE_RECIBO,FECHA_RECLAMO,MONTO' +
        '_EXENTO,MONTO_NETO,MONTO_IVA,MONTO_TOTAL,IVA_RETENIDO_TOTAL,IVA_' +
        'RETENIDO_PARCIAL,IVA_NO_RETENIDO,IVA_PROPIO,IVA_TERCEROS,RUT_EMI' +
        'SOR_LIQUID_FACTURA,NETO_COMISION_LIQUID_FACTURA,EXENTO_COMISION_' +
        'LIQUID_FACTURA,IVA_COMISION_LIQUID_FACTURA,IVA_FUERA_DE_PLAZO,TI' +
        'PO_DOCTO_REFERENCIA,FOLIO_DOCTO_REFERENCIA,NUM_IDENT_RECEPTOR_EX' +
        'TRANJERO,NACIONALIDAD_RECEPTOR_EXT,CREDITO_EMPRESA_CONSTRUCTORA,' +
        'IMPTO_ZONA_FRANCA_LEY_18211,GARANTIA_DEP_ENVASES,INDICADOR_VENTA' +
        '_SIN_COSTO,INDICADOR_SERVICIO_PERIODICO,MONTO_NO_FACTURABLE,TOTA' +
        'L_MONTO_PERIODO,VENTA_PASAJES_TRANSPORTE_NAC,VENTA_PASAJES_TRANS' +
        'PORTE_INT,NUMERO_INTERNO,CODIGO_SUCURSAL,NCE_O_NDE_SOBRE_FACT_DE' +
        '_COM,CODIGO_OTRO_IMP,VALOR_OTRO_IMP,TASA_OTRO_IMP)'
      'VALUES'
      
        '  (?EMPRESA,?TIPO_DOC,?TIPO_VENTA,?RUT_CLIENTE,?RAZON_SOCIAL,?FO' +
        'LIO,?FECHA_DOCTO,?FECHA_RECEPCION,?FECHA_ACUSE_RECIBO,?FECHA_REC' +
        'LAMO,?MONTO_EXENTO,?MONTO_NETO,?MONTO_IVA,?MONTO_TOTAL,?IVA_RETE' +
        'NIDO_TOTAL,?IVA_RETENIDO_PARCIAL,?IVA_NO_RETENIDO,?IVA_PROPIO,?I' +
        'VA_TERCEROS,?RUT_EMISOR_LIQUID_FACTURA,?NETO_COMISION_LIQUID_FAC' +
        'TURA,?EXENTO_COMISION_LIQUID_FACTURA,?IVA_COMISION_LIQUID_FACTUR' +
        'A,?IVA_FUERA_DE_PLAZO,?TIPO_DOCTO_REFERENCIA,?FOLIO_DOCTO_REFERE' +
        'NCIA,?NUM_IDENT_RECEPTOR_EXTRANJERO,?NACIONALIDAD_RECEPTOR_EXT,?' +
        'CREDITO_EMPRESA_CONSTRUCTORA,?IMPTO_ZONA_FRANCA_LEY_18211,?GARAN' +
        'TIA_DEP_ENVASES,?INDICADOR_VENTA_SIN_COSTO,?INDICADOR_SERVICIO_P' +
        'ERIODICO,?MONTO_NO_FACTURABLE,?TOTAL_MONTO_PERIODO,?VENTA_PASAJE' +
        'S_TRANSPORTE_NAC,?VENTA_PASAJES_TRANSPORTE_INT,?NUMERO_INTERNO,?' +
        'CODIGO_SUCURSAL,?NCE_O_NDE_SOBRE_FACT_DE_COM,?CODIGO_OTRO_IMP,?V' +
        'ALOR_OTRO_IMP,?TASA_OTRO_IMP)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM RCV_VENTA'
      'WHERE'
      '  FOLIO=?FOLIO AND '
      '  TIPO_DOC=?TIPO_DOC AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      '/* Se modifica dinamicamente */'
      'SELECT * FROM RCV_VENTA'
      'WHERE'
      'EMPRESA = :EMPRESA'
      'ORDER BY TIPO_DOC, FOLIO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE RCV_VENTA'
      'SET'
      '  TIPO_VENTA=?TIPO_VENTA '
      '  ,RUT_CLIENTE=?RUT_CLIENTE '
      '  ,RAZON_SOCIAL=?RAZON_SOCIAL '
      '  ,FECHA_DOCTO=?FECHA_DOCTO '
      '  ,FECHA_RECEPCION=?FECHA_RECEPCION '
      '  ,FECHA_ACUSE_RECIBO=?FECHA_ACUSE_RECIBO '
      '  ,FECHA_RECLAMO=?FECHA_RECLAMO '
      '  ,MONTO_EXENTO=?MONTO_EXENTO '
      '  ,MONTO_NETO=?MONTO_NETO '
      '  ,MONTO_IVA=?MONTO_IVA '
      '  ,MONTO_TOTAL=?MONTO_TOTAL '
      '  ,IVA_RETENIDO_TOTAL=?IVA_RETENIDO_TOTAL '
      '  ,IVA_RETENIDO_PARCIAL=?IVA_RETENIDO_PARCIAL '
      '  ,IVA_NO_RETENIDO=?IVA_NO_RETENIDO '
      '  ,IVA_PROPIO=?IVA_PROPIO '
      '  ,IVA_TERCEROS=?IVA_TERCEROS '
      '  ,RUT_EMISOR_LIQUID_FACTURA=?RUT_EMISOR_LIQUID_FACTURA '
      '  ,NETO_COMISION_LIQUID_FACTURA=?NETO_COMISION_LIQUID_FACTURA '
      
        '  ,EXENTO_COMISION_LIQUID_FACTURA=?EXENTO_COMISION_LIQUID_FACTUR' +
        'A '
      '  ,IVA_COMISION_LIQUID_FACTURA=?IVA_COMISION_LIQUID_FACTURA '
      '  ,IVA_FUERA_DE_PLAZO=?IVA_FUERA_DE_PLAZO '
      '  ,TIPO_DOCTO_REFERENCIA=?TIPO_DOCTO_REFERENCIA '
      '  ,FOLIO_DOCTO_REFERENCIA=?FOLIO_DOCTO_REFERENCIA '
      '  ,NUM_IDENT_RECEPTOR_EXTRANJERO=?NUM_IDENT_RECEPTOR_EXTRANJERO '
      '  ,NACIONALIDAD_RECEPTOR_EXT=?NACIONALIDAD_RECEPTOR_EXT '
      '  ,CREDITO_EMPRESA_CONSTRUCTORA=?CREDITO_EMPRESA_CONSTRUCTORA '
      '  ,IMPTO_ZONA_FRANCA_LEY_18211=?IMPTO_ZONA_FRANCA_LEY_18211 '
      '  ,GARANTIA_DEP_ENVASES=?GARANTIA_DEP_ENVASES '
      '  ,INDICADOR_VENTA_SIN_COSTO=?INDICADOR_VENTA_SIN_COSTO '
      '  ,INDICADOR_SERVICIO_PERIODICO=?INDICADOR_SERVICIO_PERIODICO '
      '  ,MONTO_NO_FACTURABLE=?MONTO_NO_FACTURABLE '
      '  ,TOTAL_MONTO_PERIODO=?TOTAL_MONTO_PERIODO '
      '  ,VENTA_PASAJES_TRANSPORTE_NAC=?VENTA_PASAJES_TRANSPORTE_NAC '
      '  ,VENTA_PASAJES_TRANSPORTE_INT=?VENTA_PASAJES_TRANSPORTE_INT '
      '  ,NUMERO_INTERNO=?NUMERO_INTERNO '
      '  ,CODIGO_SUCURSAL=?CODIGO_SUCURSAL '
      '  ,NCE_O_NDE_SOBRE_FACT_DE_COM=?NCE_O_NDE_SOBRE_FACT_DE_COM '
      '  ,CODIGO_OTRO_IMP=?CODIGO_OTRO_IMP '
      '  ,VALOR_OTRO_IMP=?VALOR_OTRO_IMP '
      '  ,TASA_OTRO_IMP=?TASA_OTRO_IMP '
      'WHERE'
      '  FOLIO=?FOLIO AND '
      '  TIPO_DOC=?TIPO_DOC AND '
      '  EMPRESA=?EMPRESA ')
    ClavesPrimarias.Strings = (
      'FOLIO '
      'TIPO_DOC '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'RCV_VENTA'
    UpdateTransaction = TUpdate
    Left = 56
    Top = 264
    object QMRCV_VENTAEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMRCV_VENTATIPO_DOC: TFIBStringField
      DisplayLabel = 'Tipo de Documento'
      DisplayWidth = 3
      FieldName = 'TIPO_DOC'
      Size = 3
    end
    object QMRCV_VENTATIPO_VENTA: TFIBStringField
      DisplayLabel = 'Tipo de Venta'
      DisplayWidth = 35
      FieldName = 'TIPO_VENTA'
      Size = 35
    end
    object QMRCV_VENTARUT_CLIENTE: TFIBStringField
      DisplayLabel = 'RUT'
      FieldName = 'RUT_CLIENTE'
    end
    object QMRCV_VENTARAZON_SOCIAL: TFIBStringField
      DisplayLabel = 'Raz'#243'n Social'
      FieldName = 'RAZON_SOCIAL'
      Size = 60
    end
    object QMRCV_VENTAFOLIO: TIntegerField
      DisplayLabel = 'Folio'
      FieldName = 'FOLIO'
    end
    object QMRCV_VENTAFECHA_DOCTO: TDateTimeField
      DisplayLabel = 'Fecha de Documentos'
      FieldName = 'FECHA_DOCTO'
    end
    object QMRCV_VENTAFECHA_RECEPCION: TDateTimeField
      DisplayLabel = 'Fecha de Recepci'#243'n'
      FieldName = 'FECHA_RECEPCION'
    end
    object QMRCV_VENTAFECHA_ACUSE_RECIBO: TDateTimeField
      DisplayLabel = 'Fecha de Acuse de Recibo'
      FieldName = 'FECHA_ACUSE_RECIBO'
    end
    object QMRCV_VENTAFECHA_RECLAMO: TDateTimeField
      DisplayLabel = 'Fecha de Reclamo'
      FieldName = 'FECHA_RECLAMO'
    end
    object QMRCV_VENTAMONTO_EXENTO: TFloatField
      DisplayLabel = 'Monto Exento'
      FieldName = 'MONTO_EXENTO'
    end
    object QMRCV_VENTAMONTO_NETO: TFloatField
      DisplayLabel = 'Monto Neto'
      FieldName = 'MONTO_NETO'
    end
    object QMRCV_VENTAMONTO_IVA: TFloatField
      DisplayLabel = 'Monto IVA'
      FieldName = 'MONTO_IVA'
    end
    object QMRCV_VENTAMONTO_TOTAL: TFloatField
      DisplayLabel = 'Monto Total'
      FieldName = 'MONTO_TOTAL'
    end
    object QMRCV_VENTAIVA_RETENIDO_TOTAL: TFloatField
      DisplayLabel = 'Iva Retenido Total'
      FieldName = 'IVA_RETENIDO_TOTAL'
    end
    object QMRCV_VENTAIVA_RETENIDO_PARCIAL: TFloatField
      DisplayLabel = 'Iva Retenido Parcial'
      FieldName = 'IVA_RETENIDO_PARCIAL'
    end
    object QMRCV_VENTAIVA_NO_RETENIDO: TFloatField
      DisplayLabel = 'Iva no Retenido'
      FieldName = 'IVA_NO_RETENIDO'
    end
    object QMRCV_VENTAIVA_PROPIO: TFloatField
      DisplayLabel = 'Iva Propio'
      FieldName = 'IVA_PROPIO'
    end
    object QMRCV_VENTAIVA_TERCEROS: TFloatField
      DisplayLabel = 'Iva Terceros'
      FieldName = 'IVA_TERCEROS'
    end
    object QMRCV_VENTARUT_EMISOR_LIQUID_FACTURA: TFIBStringField
      DisplayLabel = 'RUT Emisor L'#237'quido Factura'
      FieldName = 'RUT_EMISOR_LIQUID_FACTURA'
    end
    object QMRCV_VENTANETO_COMISION_LIQUID_FACTURA: TFloatField
      DisplayLabel = 'Neto Comisi'#243'n L'#237'quido Factura'
      FieldName = 'NETO_COMISION_LIQUID_FACTURA'
    end
    object QMRCV_VENTAEXENTO_COMISION_LIQUID_FACTURA: TFloatField
      DisplayLabel = 'Exento Comisi'#243'n L'#237'quido Factura'
      FieldName = 'EXENTO_COMISION_LIQUID_FACTURA'
    end
    object QMRCV_VENTAIVA_COMISION_LIQUID_FACTURA: TFloatField
      DisplayLabel = 'Iva Comisi'#243'n L'#237'quido Factura'
      FieldName = 'IVA_COMISION_LIQUID_FACTURA'
    end
    object QMRCV_VENTAIVA_FUERA_DE_PLAZO: TFloatField
      DisplayLabel = 'Iva Fuera de Plazo'
      FieldName = 'IVA_FUERA_DE_PLAZO'
    end
    object QMRCV_VENTATIPO_DOCTO_REFERENCIA: TFIBStringField
      DisplayLabel = 'Tipo Documento Referencia'
      FieldName = 'TIPO_DOCTO_REFERENCIA'
      Size = 3
    end
    object QMRCV_VENTAFOLIO_DOCTO_REFERENCIA: TIntegerField
      DisplayLabel = 'Folio Documento Referencia'
      FieldName = 'FOLIO_DOCTO_REFERENCIA'
    end
    object QMRCV_VENTANUM_IDENT_RECEPTOR_EXTRANJERO: TFIBStringField
      DisplayLabel = 'N'#250'mero Identidad Receptor Extranjero'
      FieldName = 'NUM_IDENT_RECEPTOR_EXTRANJERO'
      Size = 35
    end
    object QMRCV_VENTANACIONALIDAD_RECEPTOR_EXT: TFIBStringField
      DisplayLabel = 'Nacionalidad Receptor Extranjero'
      FieldName = 'NACIONALIDAD_RECEPTOR_EXT'
      Size = 2
    end
    object QMRCV_VENTACREDITO_EMPRESA_CONSTRUCTORA: TFloatField
      DisplayLabel = 'Cr'#233'dito Empresa Constructora'
      FieldName = 'CREDITO_EMPRESA_CONSTRUCTORA'
    end
    object QMRCV_VENTAIMPTO_ZONA_FRANCA_LEY_18211: TFloatField
      DisplayLabel = 'Impuesto Zona Franca Ley 18211'
      FieldName = 'IMPTO_ZONA_FRANCA_LEY_18211'
    end
    object QMRCV_VENTAGARANTIA_DEP_ENVASES: TFloatField
      DisplayLabel = 'Garant'#237'a dep Envaces'
      FieldName = 'GARANTIA_DEP_ENVASES'
    end
    object QMRCV_VENTAINDICADOR_VENTA_SIN_COSTO: TFloatField
      DisplayLabel = 'Indicador Venta sin Costo'
      FieldName = 'INDICADOR_VENTA_SIN_COSTO'
    end
    object QMRCV_VENTAINDICADOR_SERVICIO_PERIODICO: TFloatField
      DisplayLabel = 'Indicador servicio peri'#243'dico'
      FieldName = 'INDICADOR_SERVICIO_PERIODICO'
    end
    object QMRCV_VENTAMONTO_NO_FACTURABLE: TFloatField
      DisplayLabel = 'Monto no facturable'
      FieldName = 'MONTO_NO_FACTURABLE'
    end
    object QMRCV_VENTATOTAL_MONTO_PERIODO: TFloatField
      DisplayLabel = 'Total monto periodo'
      FieldName = 'TOTAL_MONTO_PERIODO'
    end
    object QMRCV_VENTAVENTA_PASAJES_TRANSPORTE_NAC: TFloatField
      DisplayLabel = 'Venta Pasajes transporte nacional'
      FieldName = 'VENTA_PASAJES_TRANSPORTE_NAC'
    end
    object QMRCV_VENTAVENTA_PASAJES_TRANSPORTE_INT: TFloatField
      DisplayLabel = 'Venta Pasajes transporte internacional'
      FieldName = 'VENTA_PASAJES_TRANSPORTE_INT'
    end
    object QMRCV_VENTANUMERO_INTERNO: TIntegerField
      DisplayLabel = 'N'#250'mero Interno'
      FieldName = 'NUMERO_INTERNO'
    end
    object QMRCV_VENTACODIGO_SUCURSAL: TIntegerField
      DisplayLabel = 'C'#243'digo sucursal'
      FieldName = 'CODIGO_SUCURSAL'
    end
    object QMRCV_VENTANCE_O_NDE_SOBRE_FACT_DE_COM: TIntegerField
      DisplayLabel = 'NCE o NDE Sobre factura de ompra'
      FieldName = 'NCE_O_NDE_SOBRE_FACT_DE_COM'
    end
    object QMRCV_VENTACODIGO_OTRO_IMP: TIntegerField
      DisplayLabel = 'C'#243'digo otro IMP'
      FieldName = 'CODIGO_OTRO_IMP'
    end
    object QMRCV_VENTAVALOR_OTRO_IMP: TFloatField
      DisplayLabel = 'Valor otro IMP'
      FieldName = 'VALOR_OTRO_IMP'
    end
    object QMRCV_VENTATASA_OTRO_IMP: TFloatField
      DisplayLabel = 'Tasa otro IMP'
      FieldName = 'TASA_OTRO_IMP'
    end
  end
  object QMRCV_VENTA_TOTAL: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'select'
      '    titulo,'
      '    count(tipo_doc) as tipo_doc,'
      '    sum(monto_exento) as monto_exento,'
      '    sum(monto_neto) as monto_neto,'
      '    sum(monto_iva) as monto_iva,'
      
        '    sum(monto_exento) + sum(monto_neto)+ sum(monto_iva) as monto' +
        '_total'
      '    from'
      '(select'
      '    tipo_doc,'
      '    monto_exento,'
      '    monto_neto,'
      '    monto_iva,'
      '    sii_tipo_documento_tributario.titulo'
      'from sii_tipo_documento_tributario'
      
        '   inner join rcv_venta on (sii_tipo_documento_tributario.codigo' +
        ' = rcv_venta.tipo_doc))'
      'group by titulo')
    SelectSQL.Strings = (
      'select'
      '    titulo,'
      '    count(tipo_doc) as tipo_doc,'
      '    sum(monto_exento) as monto_exento,'
      '    sum(monto_neto) as monto_neto,'
      '    sum(monto_iva) as monto_iva,'
      
        '    sum(monto_exento) + sum(monto_neto)+ sum(monto_iva) as monto' +
        '_total'
      '    from'
      '(select'
      '    tipo_doc,'
      '    monto_exento,'
      '    monto_neto,'
      '    monto_iva,'
      '    sii_tipo_documento_tributario.titulo'
      'from sii_tipo_documento_tributario'
      
        '   inner join rcv_venta on (sii_tipo_documento_tributario.codigo' +
        ' = rcv_venta.tipo_doc))'
      'group by titulo')
    UniDirectional = False
    DataSource = DSQMDocumentos
    Left = 56
    Top = 312
    object QMRCV_VENTA_TOTALTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMRCV_VENTA_TOTALTIPO_DOC: TIntegerField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'TIPO_DOC'
    end
    object QMRCV_VENTA_TOTALMONTO_EXENTO: TFloatField
      DisplayLabel = 'Monto Exento'
      FieldName = 'MONTO_EXENTO'
    end
    object QMRCV_VENTA_TOTALMONTO_NETO: TFloatField
      DisplayLabel = 'Monto Neto'
      FieldName = 'MONTO_NETO'
    end
    object QMRCV_VENTA_TOTALMONTO_IVA: TFloatField
      DisplayLabel = 'Monto IVA'
      FieldName = 'MONTO_IVA'
    end
    object QMRCV_VENTA_TOTALMONTO_TOTAL: TFloatField
      DisplayLabel = 'Monto Total'
      FieldName = 'MONTO_TOTAL'
    end
  end
  object DSQMRCV_VENTA_TOTAL: TDataSource
    DataSet = QMRCV_VENTA_TOTAL
    Left = 200
    Top = 312
  end
  object QMDocumentos_Totales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      ' SELECT * FROM ('
      
        ' SELECT TIPO_DOC_TRIBUTARIO, sum ( TOTAL_A_COBRAR) as TOTAL_A_CO' +
        'BRAR,sum ( LIQUIDO) as LIQUIDO'
      ' FROM VER_CABECERAS_ALBARAN '
      ' WHERE '
      ' EMPRESA = 1 AND'
      ' EJERCICIO <= 2022 AND'
      ' CANAL = 1'
      ' AND FOLIO = 0 '
      ' group by TIPO_DOC_TRIBUTARIO'
      ' UNION '
      
        ' SELECT TIPO_DOC_TRIBUTARIO, sum ( TOTAL_A_COBRAR) as TOTAL_A_CO' +
        'BRAR,sum ( LIQUIDO) as LIQUIDO'
      ' FROM VER_CABECERAS_FACTURA '
      ' WHERE '
      ' ESTADO = 5 AND '
      ' EMPRESA = 1 AND'
      ' EJERCICIO <= 2022 AND'
      ' CANAL = 1 '
      ''
      ' AND FOLIO = 0 group by TIPO_DOC_TRIBUTARIO'
      ' )')
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM (SELECT TIPO_DOC_TRIBUTARIO, SUM(TOTAL_A_COBRAR) AS TOTAL_A' +
        '_COBRAR, SUM(LIQUIDO) AS LIQUIDO'
      '      FROM VER_CABECERAS_ALBARAN'
      '      WHERE'
      '      EMPRESA = 1 AND'
      '      EJERCICIO <= 2022 AND'
      '      CANAL = 1 AND'
      '      FOLIO = 0'
      '      GROUP BY TIPO_DOC_TRIBUTARIO'
      '      UNION'
      
        '      SELECT TIPO_DOC_TRIBUTARIO, SUM(TOTAL_A_COBRAR) AS TOTAL_A' +
        '_COBRAR, SUM(LIQUIDO) AS LIQUIDO'
      '      FROM VER_CABECERAS_FACTURA'
      '      WHERE'
      '      ESTADO = 5 AND'
      '      EMPRESA = 1 AND'
      '      EJERCICIO <= 2022 AND'
      '      CANAL = 1 AND'
      '      FOLIO = 0'
      '      GROUP BY TIPO_DOC_TRIBUTARIO)')
    UniDirectional = False
    DataSource = DSQMDocumentos
    Left = 56
    Top = 360
    object QMDocumentos_TotalesTIPO_DOC_TRIBUTARIO: TFIBStringField
      FieldName = 'TIPO_DOC_TRIBUTARIO'
      Size = 3
    end
    object QMDocumentos_TotalesTOTAL_A_COBRAR: TFloatField
      FieldName = 'TOTAL_A_COBRAR'
    end
    object QMDocumentos_TotalesLIQUIDO: TFloatField
      FieldName = 'LIQUIDO'
    end
  end
  object DSQMDocumentos_Totales: TDataSource
    DataSet = QMDocumentos_Totales
    Left = 200
    Top = 360
  end
  object IdPOP31: TIdPOP3
    AutoLogin = True
    SASLMechanisms = <>
    Left = 312
    Top = 72
  end
  object SSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 384
    Top = 72
  end
  object DSxAdjuntos: TDataSource
    DataSet = xAdjuntos
    Left = 200
    Top = 408
  end
  object xAdjuntos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * '
      'FROM VER_ADJUNTOS'
      'WHERE'
      'TIPO = '#39'SIE'#39' AND'
      'ID = :ID_ADJUNTO_SIE')
    SelectSQL.Strings = (
      'SELECT ID, NOMBRE '
      'FROM VER_ADJUNTOS'
      'WHERE'
      'TIPO = '#39'SIE'#39' AND'
      'ID = :ID_ADJUNTO_SIE')
    UniDirectional = False
    DataSource = DSQMDTE
    Plan.Strings = (
      'SELECT *'
      'FROM VER_ADJUNTOS'
      'WHERE'
      'TIPO = '#39'SIE'#39' AND'
      'ID = :ID_SIE   ')
    Left = 56
    Top = 408
    object xAdjuntosID: TIntegerField
      FieldName = 'ID'
    end
    object xAdjuntosNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 256
    end
  end
  object QMDTE: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT first 1 *'
      
        'FROM (SELECT A.EMPRESA, A.EJERCICIO, A.CANAL, A.SERIE, A.TIPO, A' +
        '.RIG, A.ENTRADA_FACTURACION, A.FECHA, A.CLIENTE,'
      
        '             A.TITULO, A.SU_REFERENCIA, A.FORMA_PAGO, A.TOTAL_A_' +
        'COBRAR, A.MONEDA, A.TIPO_DOC_TRIBUTARIO, A.FOLIO,'
      
        '             A.ID_S, A.INDTRASLADO AS INDTRASLADO, A.TPOIMPRESIO' +
        'N AS TPOIMPRESION, A.ID_TIPO_DESPACHO, A.SII_FMA_PAGO,'
      
        '             A.CODIGO_GIRO_EMPRESA, A.TERCERO, A.DIRECCION, A.LI' +
        'QUIDO, A.CODIGO_GIRO_CLIENTE, P.PERIODO,'
      
        '             P.TITULO AS TITULO_PERIODO, V.FECHA_DOCTO, V.FECHA_' +
        'RECLAMO, V.MONTO_TOTAL, T.NIF, TDT.TITULO AS T_D_TRIB,'
      
        '             FE.ENVIADO_MAIL_CLIENTE, FE.ACEPTADO_CLIENTE, FE.ES' +
        'TADO, FE.GLOSA, FE.ERR_CODE, FE.GLOSA_ERR,'
      
        '             FE.CANTIDAD_ERRORES, FE.SII_TRACKID, FE.ID_ADJUNTO_' +
        'SIE, FE.RECEPDTEGLOSA, 0 AS INDSERVICIO,'
      '             '#39#39' AS FECHA_ENTREGA, A.TITULO_GIRO_CLIENTE'
      '      FROM VER_CABECERAS_ALBARAN A'
      
        '      JOIN EMP_PERIODOS P ON A.EMPRESA = P.EMPRESA AND A.EJERCIC' +
        'IO = P.EJERCICIO AND A.FECHA BETWEEN P.DESDE AND P.HASTA AND P.T' +
        'IPO = 1'
      
        '      LEFT JOIN RCV_VENTA V ON A.EMPRESA = V.EMPRESA AND A.TIPO_' +
        'DOC_TRIBUTARIO = V.TIPO_DOC AND A.FOLIO = V.FOLIO'
      '      LEFT JOIN SYS_TERCEROS T ON (T.TERCERO = A.TERCERO)'
      
        '      LEFT JOIN SII_TIPO_DOCUMENTO_TRIBUTARIO TDT ON (A.TIPO_DOC' +
        '_TRIBUTARIO = TDT.CODIGO)'
      '      LEFT JOIN GES_CABECERAS_S_FE_CHL FE ON (FE.ID_S = A.ID_S)'
      '      WHERE'
      '      A.ID_S = :ID_S AND'
      '      A.TIPO <> '#39'DES'#39
      '      UNION'
      
        '      SELECT F.EMPRESA, F.EJERCICIO, F.CANAL, F.SERIE, F.TIPO, F' +
        '.RIG, F.ENTRADA_FACTURACION, F.FECHA, F.CLIENTE,'
      
        '             F.TITULO, F.SU_REFERENCIA, FORMA_PAGO, F.TOTAL_A_CO' +
        'BRAR, F.MONEDA, F.TIPO_DOC_TRIBUTARIO, F.FOLIO, F.ID_S,'
      
        '             0 AS INDTRASLADO, CAST('#39#39' AS VARCHAR(10)) AS TPOIMP' +
        'RESION, F.ID_TIPO_DESPACHO, F.SII_FMA_PAGO,'
      
        '             F.CODIGO_GIRO_EMPRESA, F.TERCERO, DIRECCION, F.LIQU' +
        'IDO, F.CODIGO_GIRO_CLIENTE, P.PERIODO,'
      
        '             P.TITULO AS TITULO_PERIODO, V.FECHA_DOCTO, V.FECHA_' +
        'RECLAMO, V.MONTO_TOTAL, T.NIF, TDT.TITULO AS T_D_TRIB,'
      
        '             FE.ENVIADO_MAIL_CLIENTE, FE.ACEPTADO_CLIENTE, FE.ES' +
        'TADO, FE.GLOSA, FE.ERR_CODE, FE.GLOSA_ERR,'
      
        '             FE.CANTIDAD_ERRORES, FE.SII_TRACKID, FE.ID_ADJUNTO_' +
        'SIE, FE.RECEPDTEGLOSA, F.INDSERVICIO, F.FECHA_ENTREGA, F.TITULO_' +
        'GIRO_CLIENTE'
      '      FROM VER_CABECERAS_FACTURA F'
      
        '      JOIN EMP_PERIODOS P ON F.EMPRESA = P.EMPRESA AND F.EJERCIC' +
        'IO = P.EJERCICIO AND F.FECHA BETWEEN P.DESDE AND P.HASTA AND P.T' +
        'IPO = 1'
      
        '      LEFT JOIN RCV_VENTA V ON F.EMPRESA = V.EMPRESA AND F.TIPO_' +
        'DOC_TRIBUTARIO = V.TIPO_DOC AND F.FOLIO = V.FOLIO'
      '      LEFT JOIN SYS_TERCEROS T ON (T.TERCERO = F.TERCERO)'
      
        '      LEFT JOIN SII_TIPO_DOCUMENTO_TRIBUTARIO TDT ON (F.TIPO_DOC' +
        '_TRIBUTARIO = TDT.CODIGO)'
      '      LEFT JOIN GES_CABECERAS_S_FE_CHL FE ON (FE.ID_S = F.ID_S)'
      '      WHERE'
      '      F.ID_S = :ID_S AND'
      '      F.TIPO <> '#39'DES'#39')  ')
    SelectSQL.Strings = (
      'SELECT first 1 *'
      
        'FROM (SELECT A.EMPRESA, A.EJERCICIO, A.CANAL, A.SERIE, A.TIPO, A' +
        '.RIG, A.ENTRADA_FACTURACION, A.FECHA, A.CLIENTE,'
      
        '             A.TITULO, A.SU_REFERENCIA, A.FORMA_PAGO, A.TOTAL_A_' +
        'COBRAR, A.MONEDA, A.TIPO_DOC_TRIBUTARIO, A.FOLIO,'
      
        '             A.ID_S, A.INDTRASLADO AS INDTRASLADO, A.TPOIMPRESIO' +
        'N AS TPOIMPRESION, A.ID_TIPO_DESPACHO, A.SII_FMA_PAGO,'
      
        '             A.CODIGO_GIRO_EMPRESA, A.TERCERO, A.DIRECCION, A.LI' +
        'QUIDO, A.CODIGO_GIRO_CLIENTE, P.PERIODO,'
      
        '             P.TITULO AS TITULO_PERIODO, V.FECHA_DOCTO, V.FECHA_' +
        'RECLAMO, V.MONTO_TOTAL, T.NIF, TDT.TITULO AS T_D_TRIB,'
      
        '             FE.ENVIADO_MAIL_CLIENTE, FE.ACEPTADO_CLIENTE, FE.ES' +
        'TADO, FE.GLOSA, FE.ERR_CODE, FE.GLOSA_ERR,'
      
        '             FE.CANTIDAD_ERRORES, FE.SII_TRACKID, FE.ID_ADJUNTO_' +
        'SIE, FE.RECEPDTEGLOSA, 0 AS INDSERVICIO,'
      '             '#39#39' AS FECHA_ENTREGA, A.TITULO_GIRO_CLIENTE'
      '      FROM VER_CABECERAS_ALBARAN A'
      
        '      JOIN EMP_PERIODOS P ON A.EMPRESA = P.EMPRESA AND A.EJERCIC' +
        'IO = P.EJERCICIO AND A.FECHA BETWEEN P.DESDE AND P.HASTA AND P.T' +
        'IPO = 1'
      
        '      LEFT JOIN RCV_VENTA V ON A.EMPRESA = V.EMPRESA AND A.TIPO_' +
        'DOC_TRIBUTARIO = V.TIPO_DOC AND A.FOLIO = V.FOLIO'
      '      LEFT JOIN SYS_TERCEROS T ON (T.TERCERO = A.TERCERO)'
      
        '      LEFT JOIN SII_TIPO_DOCUMENTO_TRIBUTARIO TDT ON (A.TIPO_DOC' +
        '_TRIBUTARIO = TDT.CODIGO)'
      '      LEFT JOIN GES_CABECERAS_S_FE_CHL FE ON (FE.ID_S = A.ID_S)'
      '      WHERE'
      '      A.TIPO <> '#39'DES'#39
      '      UNION'
      
        '      SELECT F.EMPRESA, F.EJERCICIO, F.CANAL, F.SERIE, F.TIPO, F' +
        '.RIG, F.ENTRADA_FACTURACION, F.FECHA, F.CLIENTE,'
      
        '             F.TITULO, F.SU_REFERENCIA, FORMA_PAGO, F.TOTAL_A_CO' +
        'BRAR, F.MONEDA, F.TIPO_DOC_TRIBUTARIO, F.FOLIO, F.ID_S,'
      
        '             0 AS INDTRASLADO, CAST('#39#39' AS VARCHAR(10)) AS TPOIMP' +
        'RESION, F.ID_TIPO_DESPACHO, F.SII_FMA_PAGO,'
      
        '             F.CODIGO_GIRO_EMPRESA, F.TERCERO, DIRECCION, F.LIQU' +
        'IDO, F.CODIGO_GIRO_CLIENTE, P.PERIODO,'
      
        '             P.TITULO AS TITULO_PERIODO, V.FECHA_DOCTO, V.FECHA_' +
        'RECLAMO, V.MONTO_TOTAL, T.NIF, TDT.TITULO AS T_D_TRIB,'
      
        '             FE.ENVIADO_MAIL_CLIENTE, FE.ACEPTADO_CLIENTE, FE.ES' +
        'TADO, FE.GLOSA, FE.ERR_CODE, FE.GLOSA_ERR,'
      
        '             FE.CANTIDAD_ERRORES, FE.SII_TRACKID, FE.ID_ADJUNTO_' +
        'SIE, FE.RECEPDTEGLOSA, F.INDSERVICIO, F.FECHA_ENTREGA,'
      '             F.TITULO_GIRO_CLIENTE'
      '      FROM VER_CABECERAS_FACTURA F'
      
        '      JOIN EMP_PERIODOS P ON F.EMPRESA = P.EMPRESA AND F.EJERCIC' +
        'IO = P.EJERCICIO AND F.FECHA BETWEEN P.DESDE AND P.HASTA AND P.T' +
        'IPO = 1'
      
        '      LEFT JOIN RCV_VENTA V ON F.EMPRESA = V.EMPRESA AND F.TIPO_' +
        'DOC_TRIBUTARIO = V.TIPO_DOC AND F.FOLIO = V.FOLIO'
      '      LEFT JOIN SYS_TERCEROS T ON (T.TERCERO = F.TERCERO)'
      
        '      LEFT JOIN SII_TIPO_DOCUMENTO_TRIBUTARIO TDT ON (F.TIPO_DOC' +
        '_TRIBUTARIO = TDT.CODIGO)'
      '      LEFT JOIN GES_CABECERAS_S_FE_CHL FE ON (FE.ID_S = F.ID_S)'
      '      WHERE'
      '      F.TIPO <> '#39'DES'#39')  ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AfterOpen = QMDTEAfterOpen
    BeforeClose = QMDTEBeforeClose
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 488
    object QMDTEEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMDTEEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object QMDTECANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object QMDTESERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDTETIPO: TFIBStringField
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDTERIG: TIntegerField
      FieldName = 'RIG'
    end
    object QMDTEENTRADA_FACTURACION: TIntegerField
      FieldName = 'ENTRADA_FACTURACION'
    end
    object QMDTEFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QMDTECLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object QMDTETITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 60
    end
    object QMDTESU_REFERENCIA: TFIBStringField
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMDTEFORMA_PAGO: TFIBStringField
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMDTETOTAL_A_COBRAR: TFloatField
      FieldName = 'TOTAL_A_COBRAR'
    end
    object QMDTEMONEDA: TFIBStringField
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMDTETIPO_DOC_TRIBUTARIO: TFIBStringField
      FieldName = 'TIPO_DOC_TRIBUTARIO'
      Size = 3
    end
    object QMDTEFOLIO: TIntegerField
      FieldName = 'FOLIO'
    end
    object QMDTEID_S: TIntegerField
      FieldName = 'ID_S'
    end
    object QMDTEINDTRASLADO: TIntegerField
      FieldName = 'INDTRASLADO'
    end
    object QMDTETPOIMPRESION: TFIBStringField
      FieldName = 'TPOIMPRESION'
      Size = 10
    end
    object QMDTEID_TIPO_DESPACHO: TIntegerField
      FieldName = 'ID_TIPO_DESPACHO'
    end
    object QMDTESII_FMA_PAGO: TIntegerField
      FieldName = 'SII_FMA_PAGO'
    end
    object QMDTECODIGO_GIRO_EMPRESA: TIntegerField
      FieldName = 'CODIGO_GIRO_EMPRESA'
    end
    object QMDTETERCERO: TIntegerField
      FieldName = 'TERCERO'
    end
    object QMDTEDIRECCION: TIntegerField
      FieldName = 'DIRECCION'
    end
    object QMDTELIQUIDO: TFloatField
      FieldName = 'LIQUIDO'
    end
    object QMDTECODIGO_GIRO_CLIENTE: TIntegerField
      FieldName = 'CODIGO_GIRO_CLIENTE'
    end
    object QMDTEPERIODO: TFIBStringField
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMDTETITULO_PERIODO: TFIBStringField
      FieldName = 'TITULO_PERIODO'
      Size = 100
    end
    object QMDTEFECHA_DOCTO: TDateTimeField
      FieldName = 'FECHA_DOCTO'
    end
    object QMDTEFECHA_RECLAMO: TDateTimeField
      FieldName = 'FECHA_RECLAMO'
    end
    object QMDTEMONTO_TOTAL: TFloatField
      FieldName = 'MONTO_TOTAL'
    end
    object QMDTENIF: TFIBStringField
      FieldName = 'NIF'
    end
    object QMDTET_D_TRIB: TFIBStringField
      FieldName = 'T_D_TRIB'
      Size = 60
    end
    object QMDTEENVIADO_MAIL_CLIENTE: TIntegerField
      FieldName = 'ENVIADO_MAIL_CLIENTE'
    end
    object QMDTEACEPTADO_CLIENTE: TIntegerField
      FieldName = 'ACEPTADO_CLIENTE'
    end
    object QMDTEESTADO: TFIBStringField
      FieldName = 'ESTADO'
      Size = 15
    end
    object QMDTEGLOSA: TFIBStringField
      FieldName = 'GLOSA'
      Size = 256
    end
    object QMDTEERR_CODE: TFIBStringField
      FieldName = 'ERR_CODE'
      Size = 15
    end
    object QMDTEGLOSA_ERR: TFIBStringField
      FieldName = 'GLOSA_ERR'
      Size = 256
    end
    object QMDTECANTIDAD_ERRORES: TIntegerField
      FieldName = 'CANTIDAD_ERRORES'
    end
    object QMDTESII_TRACKID: TFIBStringField
      FieldName = 'SII_TRACKID'
    end
    object QMDTEID_ADJUNTO_SIE: TIntegerField
      FieldName = 'ID_ADJUNTO_SIE'
    end
    object QMDTERECEPDTEGLOSA: TFIBStringField
      FieldName = 'RECEPDTEGLOSA'
      Size = 256
    end
    object QMDTEINDSERVICIO: TIntegerField
      FieldName = 'INDSERVICIO'
    end
    object QMDTEFECHA_ENTREGA: TFIBStringField
      FieldName = 'FECHA_ENTREGA'
      Size = 25
    end
    object QMDTETITULO_GIRO_CLIENTE: TFIBStringField
      FieldName = 'TITULO_GIRO_CLIENTE'
      Size = 150
    end
  end
  object DSQMDTE: TDataSource
    DataSet = QMDTE
    Left = 208
    Top = 488
  end
end
