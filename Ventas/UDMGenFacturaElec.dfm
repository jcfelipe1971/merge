object DMGenFacturaElec: TDMGenFacturaElec
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 786
  Top = 324
  Height = 286
  Width = 415
  object QMFacturas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_FACTURA'
      'WHERE'
      '  ID_S=?ID_S ')
    SelectSQL.Strings = (
      'SELECT   *'
      'FROM  VER_CABECERAS_FACTURA'
      'WHERE '
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'TIPO = '#39'FAC'#39' AND'
      'ESTADO >= ?ESTADOD AND'
      'ESTADO <= ?ESTADOH'
      'ORDER BY SERIE, RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AfterOpen = QMFacturasAfterOpen
    ClavesPrimarias.Strings = (
      'ID_S ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CABECERAS_FACTURA'
    UpdateTransaction = TLocal
    Left = 32
    Top = 24
    object QMFacturasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMFacturasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMFacturasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMFacturasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMFacturasRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMFacturasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMFacturasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMFacturasCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMFacturasSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Ref.'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMFacturasFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMFacturasTOTAL_A_COBRAR: TFloatField
      DisplayLabel = 'Total a Cobrar'
      FieldName = 'TOTAL_A_COBRAR'
    end
    object QMFacturasMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMFacturasID_S: TIntegerField
      DisplayLabel = 'ID S'
      FieldName = 'ID_S'
    end
    object QMFacturasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMFacturasPROCESO_AUTO: TIntegerField
      DisplayLabel = 'Proc. Auto.'
      FieldName = 'PROCESO_AUTO'
    end
    object QMFacturasEMAIL: TStringField
      DisplayLabel = 'Correo Electr'#243'nico'
      FieldKind = fkCalculated
      FieldName = 'EMAIL'
      Size = 100
      Calculated = True
    end
    object QMFacturasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMFacturasAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMFacturasESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMFacturasFECHA_ENTREGA_REPARTO: TDateTimeField
      DisplayLabel = 'Fec. Entrega Reparto'
      FieldName = 'FECHA_ENTREGA_REPARTO'
    end
    object QMFacturasZ_OBSERVACION: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'Z_OBSERVACION'
      Size = 256
    end
    object QMFacturasTITULO_ESTADO: TStringField
      DisplayLabel = 'Desc. Estado'
      DisplayWidth = 40
      FieldKind = fkCalculated
      FieldName = 'TITULO_ESTADO'
      Size = 40
      Calculated = True
    end
    object QMFacturasFECHA_CON: TDateTimeField
      DisplayLabel = 'Fec. Contabilizacion'
      FieldName = 'FECHA_CON'
    end
    object QMFacturasPEDIDO_CLIENTE: TFIBStringField
      DisplayLabel = 'Nro. Pedido'
      FieldName = 'PEDIDO_CLIENTE'
      Size = 60
    end
    object QMFacturasDIRECCION: TIntegerField
      FieldName = 'DIRECCION'
    end
    object QMFacturasPERIODO_FACTURACION_INI: TDateTimeField
      FieldName = 'PERIODO_FACTURACION_INI'
    end
    object QMFacturasPERIODO_FACTURACION_FIN: TDateTimeField
      FieldName = 'PERIODO_FACTURACION_FIN'
    end
    object QMFacturasI_PORTES: TFloatField
      FieldName = 'I_PORTES'
    end
    object QMFacturasTIPO_PORTES: TIntegerField
      FieldName = 'TIPO_PORTES'
    end
    object QMFacturasBANCO: TIntegerField
      FieldName = 'BANCO'
    end
    object QMFacturasRECC: TIntegerField
      FieldName = 'RECC'
    end
    object QMFacturasS_BASES: TFloatField
      FieldName = 'S_BASES'
    end
    object QMFacturasS_CUOTA_IVA: TFloatField
      FieldName = 'S_CUOTA_IVA'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 322
    Top = 12
  end
  object DSQMFacturas: TDataSource
    DataSet = QMFacturas
    Left = 112
    Top = 24
  end
  object QMNIF: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_CABECERAS_S_FAC_NIF'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG ')
    InsertSQL.Strings = (
      'INSERT INTO GES_CABECERAS_S_FAC_NIF'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,TIPO,RIG,NOMBRE,NIF,DIRECCION' +
        ',C_POSTAL,PROVINCIA,'#13#10'ID_S,PAIS,LOCALIDAD,TELEFONO01,TELEFONO02,' +
        'TELEFAX,EMAIL,NOTAS,COLONIA,TERCERO,'#13#10'CARNET_APLICADOR,NOMBRE_CO' +
        'NTACTO,COMO_NOS_CONOCIERON,TIPO_DOC_IDENT,PAIS_DOC_IDENT)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?NOMBRE,?NIF,?' +
        'DIRECCION,?C_POSTAL,?PROVINCIA,'#13#10'?ID_S,?PAIS,?LOCALIDAD,?TELEFON' +
        'O01,?TELEFONO02,?TELEFAX,?EMAIL,?NOTAS,?COLONIA,?TERCERO,'#13#10'?CARN' +
        'ET_APLICADOR,?NOMBRE_CONTACTO,?COMO_NOS_CONOCIERON,?TIPO_DOC_IDE' +
        'NT,?PAIS_DOC_IDENT)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_S_FAC_NIF'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_FAC_NIF'
      'WHERE'
      'TIPO = ?TIPO AND /*Para evitar colisiones con ticket*/'
      'ID_S = ?ID_S')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_S_FAC_NIF'
      'SET'
      '  NOMBRE=?NOMBRE '
      '  ,NIF=?NIF '
      '  ,DIRECCION=?DIRECCION '
      '  ,C_POSTAL=?C_POSTAL '
      '  ,PROVINCIA=?PROVINCIA '
      '  ,ID_S=?ID_S '
      '  ,PAIS=?PAIS '
      '  ,LOCALIDAD=?LOCALIDAD '
      '  ,TELEFONO01=?TELEFONO01 '
      '  ,TELEFONO02=?TELEFONO02 '
      '  ,TELEFAX=?TELEFAX '
      '  ,EMAIL=?EMAIL '
      '  ,NOTAS=?NOTAS '
      '  ,COLONIA=?COLONIA '
      '  ,TERCERO=?TERCERO '
      '  ,CARNET_APLICADOR=?CARNET_APLICADOR '
      '  ,NOMBRE_CONTACTO=?NOMBRE_CONTACTO '
      '  ,COMO_NOS_CONOCIERON=?COMO_NOS_CONOCIERON '
      '  ,TIPO_DOC_IDENT=?TIPO_DOC_IDENT '
      '  ,PAIS_DOC_IDENT=?PAIS_DOC_IDENT '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'EMPRESA'
      'EJERCICIO'
      'CANAL'
      'SERIE'
      'TIPO'
      'RIG')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_S_FAC_NIF'
    BloqOpt = True
    UpdateTransaction = DMMain.TLocal
    AutoCommit = True
    Left = 24
    Top = 136
    object QMNIFEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMNIFEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMNIFCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMNIFSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMNIFTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMNIFRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMNIFNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object QMNIFDIRECCION: TFIBStringField
      DisplayLabel = 'Direccion'
      DisplayWidth = 100
      FieldName = 'DIRECCION'
      Size = 100
    end
    object QMNIFC_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'C_POSTAL'
      Size = 10
    end
    object QMNIFPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object QMNIFNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object QMNIFPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMNIFID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMNIFLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 40
    end
    object QMNIFTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel. 1'
      DisplayWidth = 15
      FieldName = 'TELEFONO01'
      Size = 15
    end
    object QMNIFTELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      DisplayWidth = 15
      FieldName = 'TELEFONO02'
      Size = 15
    end
    object QMNIFTELEFAX: TFIBStringField
      DisplayLabel = 'Fax'
      DisplayWidth = 15
      FieldName = 'TELEFAX'
      Size = 15
    end
    object QMNIFEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object QMNIFNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMNIFCOLONIA: TFIBStringField
      DisplayLabel = 'Colonia'
      FieldName = 'COLONIA'
      Size = 40
    end
    object QMNIFTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMNIFCARNET_APLICADOR: TFIBStringField
      DisplayLabel = 'Carnet Aplicador'
      FieldName = 'CARNET_APLICADOR'
    end
    object QMNIFNOMBRE_CONTACTO: TFIBStringField
      DisplayLabel = 'Nombre Contacto'
      FieldName = 'NOMBRE_CONTACTO'
      Size = 60
    end
    object QMNIFCOMO_NOS_CONOCIERON: TIntegerField
      DisplayLabel = 'Como nos conocieron'
      FieldName = 'COMO_NOS_CONOCIERON'
    end
    object QMNIFTIPO_DOC_IDENT: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'TIPO_DOC_IDENT'
      Size = 3
    end
    object QMNIFPAIS_DOC_IDENT: TFIBStringField
      DisplayLabel = 'Pais Doc.'
      FieldName = 'PAIS_DOC_IDENT'
      Size = 3
    end
  end
  object DSQMNIF: TDataSource
    DataSet = QMNIF
    Left = 80
    Top = 136
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_DETALLE_FACTURA'
      'WHERE'
      '  ID_DETALLES_S=?old_ID_DETALLES_S AND '
      '  ID_S=?old_ID_S ')
    InsertSQL.Strings = (
      'INSERT INTO VER_DETALLE_FACTURA ('
      
        'SERIE, UNIDADES, PRECIO, P_COSTE, BRUTO, B_COMISION, I_DESCUENTO' +
        ', B_IMPONIBLE, I_COMISION, NOTAS, NOTAS2, UNIDADES_EXT,'
      
        ' UNIDADES_SEC, COMISION_LINEAL, I_COMISION_LINEAL, FECHA_PRE_DET' +
        ', FECHA_REC_DET, FECHA_ANTICIPO, UNIDADES_LOGISTICAS,'
      
        ' COSTE_ADICIONAL, RIG, LINEA, CLIENTE, DESCUENTO, DESCUENTO_2, D' +
        'ESCUENTO_3, COMISION, M_MOV_STOCK, P_IVA, P_RECARGO,'
      
        ' ENTRADA, ID_DETALLES_S, ID_S, ID_A, ID_C_A, TIPO_LINEA_KRI, ORD' +
        'EN, ORIGEN, ID_P, PROYECTO, ID_IMAGEN,'
      
        ' P_IMPUESTO_ADICIONAL, EMPRESA, EJERCICIO, CANAL, TITULO, PIEZAS' +
        '_X_BULTO, BULTOS, TIPO_IVA, CENTRO_COSTE, TITULO_IDIOMA,'
      
        ' PROC_PROMOCION, APLICA_UNIDADES_SECUNDARIAS, LINEA_RELACION, CE' +
        'RTIFICADO, CERT_NEGATIVO, LOTE_SIMPLE,'
      
        ' DIRECCION_ENTREGA, MANIPULACION, ALFA_1, ALFA_2, ALFA_3, ALFA_4' +
        ', ALFA_5, ALFA_6, ALFA_7, ALFA_8,'
      
        ' INVERSION_SUJETO_PASIVO, DECIMALES_UNIDADES, TIPO_IMPUESTO_ADIC' +
        'IONAL, LOTEABLE, TIPO, ALMACEN, ARTICULO, NSERIE,'
      
        ' TIPO_LINEA, CTA_PAGO_ANTICIPO, CRC_NOTAS, CRC_NOTAS2, PRO_NUM_P' +
        'LANO, TIPO_UNIDAD_LOGISTICA, TITULO_UNIDAD_LOGISTICA,'
      
        ' CUENTA, PAIS, PESO, PESO_TOTAL, PESO_REAL, SIGNO_UNIDADES, UNID' +
        'AD_FOMENTO)'
      'VALUES ('
      
        '?SERIE, ?UNIDADES, ?PRECIO, ?P_COSTE, ?BRUTO, ?B_COMISION, ?I_DE' +
        'SCUENTO, ?B_IMPONIBLE, ?I_COMISION, ?NOTAS,'
      
        ' ?NOTAS2, ?UNIDADES_EXT, ?UNIDADES_SEC, ?COMISION_LINEAL, ?I_COM' +
        'ISION_LINEAL, ?FECHA_PRE_DET, ?FECHA_REC_DET,'
      
        ' ?FECHA_ANTICIPO, ?UNIDADES_LOGISTICAS, ?COSTE_ADICIONAL, ?RIG, ' +
        '?LINEA, ?CLIENTE, ?DESCUENTO, ?DESCUENTO_2,'
      
        ' ?DESCUENTO_3, ?COMISION, ?M_MOV_STOCK, ?P_IVA, ?P_RECARGO, ?ENT' +
        'RADA, ?ID_DETALLES_S, ?ID_S, ?ID_A, ?ID_C_A,'
      
        ' ?TIPO_LINEA_KRI, ?ORDEN, ?ORIGEN, ?ID_P, ?PROYECTO, ?ID_IMAGEN,' +
        ' ?P_IMPUESTO_ADICIONAL, ?EMPRESA, ?EJERCICIO,'
      
        ' ?CANAL, ?TITULO, ?PIEZAS_X_BULTO, ?BULTOS, ?TIPO_IVA, ?CENTRO_C' +
        'OSTE, ?TITULO_IDIOMA, ?PROC_PROMOCION,'
      
        ' ?APLICA_UNIDADES_SECUNDARIAS, ?LINEA_RELACION, ?CERTIFICADO, ?C' +
        'ERT_NEGATIVO, ?LOTE_SIMPLE, ?DIRECCION_ENTREGA,'
      
        ' ?MANIPULACION, ?ALFA_1, ?ALFA_2, ?ALFA_3, ?ALFA_4, ?ALFA_5, ?AL' +
        'FA_6, ?ALFA_7, ?ALFA_8,'
      
        ' ?INVERSION_SUJETO_PASIVO, ?DECIMALES_UNIDADES, ?TIPO_IMPUESTO_A' +
        'DICIONAL, ?LOTEABLE, ?TIPO, ?ALMACEN, ?ARTICULO,'
      
        ' ?NSERIE, ?TIPO_LINEA, ?CTA_PAGO_ANTICIPO, ?CRC_NOTAS, ?CRC_NOTA' +
        'S2, ?PRO_NUM_PLANO, ?TIPO_UNIDAD_LOGISTICA,'
      
        ' ?TITULO_UNIDAD_LOGISTICA, ?CUENTA, ?PAIS, ?PESO, ?PESO_TOTAL, ?' +
        'PESO_REAL, ?SIGNO_UNIDADES, ?UNIDAD_FOMENTO)  ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_DETALLE_FACTURA'
      'WHERE'
      '  ID_DETALLES_S=?ID_DETALLES_S AND '
      '  ID_S=?ID_S ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_FACTURA'
      'WHERE'
      '  ID_S = ?ID_S AND CERTIFICADO = 0 AND CERT_NEGATIVO =  0'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLE_FACTURA'
      'SET'
      '  SERIE=?SERIE '
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
      '  ,COMISION_LINEAL=?COMISION_LINEAL '
      '  ,I_COMISION_LINEAL=?I_COMISION_LINEAL '
      '  ,FECHA_PRE_DET=?FECHA_PRE_DET '
      '  ,FECHA_REC_DET=?FECHA_REC_DET '
      '  ,FECHA_ANTICIPO=?FECHA_ANTICIPO '
      '  ,UNIDADES_LOGISTICAS=?UNIDADES_LOGISTICAS '
      '  ,COSTE_ADICIONAL=?COSTE_ADICIONAL '
      '  ,RIG=?RIG '
      '  ,LINEA=?LINEA '
      '  ,CLIENTE=?CLIENTE '
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
      '  ,TIPO_LINEA_KRI=?TIPO_LINEA_KRI '
      '  ,ORDEN=?ORDEN '
      '  ,ORIGEN=?ORIGEN '
      '  ,ID_P=?ID_P '
      '  ,PROYECTO=?PROYECTO '
      '  ,ID_IMAGEN=?ID_IMAGEN '
      '  ,P_IMPUESTO_ADICIONAL=?P_IMPUESTO_ADICIONAL '
      '  ,EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,TITULO=?TITULO '
      '  ,PIEZAS_X_BULTO=?PIEZAS_X_BULTO '
      '  ,BULTOS=?BULTOS '
      '  ,TIPO_IVA=?TIPO_IVA '
      '  ,CENTRO_COSTE=?CENTRO_COSTE '
      '  ,TITULO_IDIOMA=?TITULO_IDIOMA '
      '  ,PROC_PROMOCION=?PROC_PROMOCION '
      '  ,APLICA_UNIDADES_SECUNDARIAS=?APLICA_UNIDADES_SECUNDARIAS '
      '  ,LINEA_RELACION=?LINEA_RELACION '
      '  ,CERTIFICADO=?CERTIFICADO '
      '  ,CERT_NEGATIVO=?CERT_NEGATIVO '
      '  ,LOTE_SIMPLE=?LOTE_SIMPLE '
      '  ,DIRECCION_ENTREGA=?DIRECCION_ENTREGA '
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
      '  ,DECIMALES_UNIDADES=?DECIMALES_UNIDADES '
      '  ,TIPO_IMPUESTO_ADICIONAL=?TIPO_IMPUESTO_ADICIONAL '
      '  ,LOTEABLE=?LOTEABLE '
      '  ,TIPO=?TIPO '
      '  ,ALMACEN=?ALMACEN '
      '  ,ARTICULO=?ARTICULO '
      '  ,NSERIE=?NSERIE '
      '  ,TIPO_LINEA=?TIPO_LINEA '
      '  ,CTA_PAGO_ANTICIPO=?CTA_PAGO_ANTICIPO '
      '  ,CRC_NOTAS=?CRC_NOTAS '
      '  ,CRC_NOTAS2=?CRC_NOTAS2 '
      '  ,PRO_NUM_PLANO=?PRO_NUM_PLANO '
      '  ,TIPO_UNIDAD_LOGISTICA=?TIPO_UNIDAD_LOGISTICA '
      '  ,TITULO_UNIDAD_LOGISTICA=?TITULO_UNIDAD_LOGISTICA '
      '  ,CUENTA=?CUENTA '
      '  ,PAIS=?PAIS '
      '  ,PESO=?PESO '
      '  ,PESO_TOTAL=?PESO_TOTAL '
      '  ,PESO_REAL=?PESO_REAL '
      '  ,SIGNO_UNIDADES=?SIGNO_UNIDADES '
      '  ,UNIDAD_FOMENTO=?UNIDAD_FOMENTO'
      'WHERE'
      '  ID_DETALLES_S=?ID_DETALLES_S AND '
      '  ID_S=?ID_S ')
    DataSource = DSQMFacturas
    Plan.Strings = (
      
        'PLAN JOIN (VER_DETALLE_FACTURA DET INDEX (GES_DETALLES_S_CAB_ID)' +
        ','
      
        '             VER_DETALLE_FACTURA FAC INDEX (GES_DETALLES_S_FAC_I' +
        'D)) ')
    ClavesPrimarias.Strings = (
      'ID_DETALLES_S '
      'ID_S ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_DETALLE_FACTURA'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_DETALLES_S'
      'GES_DETALLES_S_FAC')
    CamposBloqueo.Strings = (
      'ID_DETALLES_S'
      'ID_DETALLES_S')
    UpdateTransaction = DMMain.TLocal
    AutoCommit = True
    Left = 24
    Top = 192
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetalleSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetalleTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetalleRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      DisplayWidth = 15
      FieldName = 'ARTICULO'
      EditMask = '>ccccccccccccccc;0;_'
      Size = 15
    end
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'Desc. Art'#237'culo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMDetalleUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDetallePIEZAS_X_BULTO: TIntegerField
      DisplayLabel = 'Piezas x Bulto'
      FieldName = 'PIEZAS_X_BULTO'
    end
    object QMDetalleBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object QMDetalleDESCUENTO: TFloatField
      DisplayLabel = 'Desc.'
      FieldName = 'DESCUENTO'
    end
    object QMDetalleCOMISION: TFloatField
      DisplayLabel = 'Comision'
      FieldName = 'COMISION'
    end
    object QMDetalleP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMDetalleM_MOV_STOCK: TIntegerField
      DisplayLabel = 'N. Mov. Stock'
      FieldName = 'M_MOV_STOCK'
    end
    object QMDetalleTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMDetalleP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object QMDetalleP_RECARGO: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_RECARGO'
    end
    object QMDetalleBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object QMDetalleB_COMISION: TFloatField
      DisplayLabel = 'B. Comision'
      FieldName = 'B_COMISION'
    end
    object QMDetalleI_DESCUENTO: TFloatField
      DisplayLabel = 'Imp. Desc.'
      FieldName = 'I_DESCUENTO'
    end
    object QMDetalleB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMDetalleB_DTO_LINEA: TFloatField
      DisplayLabel = 'B. Dto. Linea'
      FieldName = 'B_DTO_LINEA'
    end
    object QMDetalleI_COMISION: TFloatField
      DisplayLabel = 'Imp. Comision'
      FieldName = 'I_COMISION'
    end
    object QMDetalleC_IVA: TFloatField
      DisplayLabel = 'C. IVA'
      FieldName = 'C_IVA'
    end
    object QMDetalleC_RECARGO: TFloatField
      DisplayLabel = 'C. Rec.'
      FieldName = 'C_RECARGO'
    end
    object QMDetalleT_COSTE: TFloatField
      DisplayLabel = 'T. Coste'
      FieldName = 'T_COSTE'
    end
    object QMDetalleM_BRUTO: TFloatField
      DisplayLabel = 'M Bruto'
      FieldName = 'M_BRUTO'
    end
    object QMDetalleLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMDetalleENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMDetalleNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMDetalleUNIDADES_EXT: TFloatField
      DisplayLabel = 'Uds. Ext.'
      FieldName = 'UNIDADES_EXT'
    end
    object QMDetalleDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object QMDetalleDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object QMDetalleUNIDADES_SEC: TFloatField
      DisplayLabel = 'Uds. Sec.'
      FieldName = 'UNIDADES_SEC'
    end
    object QMDetalleNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object QMDetalleID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det. S.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMDetalleID_S: TIntegerField
      DisplayLabel = 'ID S.'
      FieldName = 'ID_S'
    end
    object QMDetalleCENTRO_COSTE: TIntegerField
      DisplayLabel = 'Cent. Coste'
      FieldName = 'CENTRO_COSTE'
    end
    object QMDetalleID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetalleID_C_A: TIntegerField
      DisplayLabel = 'ID Art. C.'
      FieldName = 'ID_C_A'
    end
    object QMDetalleCOMISION_LINEAL: TFloatField
      DisplayLabel = 'Com. Lin.'
      FieldName = 'COMISION_LINEAL'
    end
    object QMDetalleI_COMISION_LINEAL: TFloatField
      DisplayLabel = 'Imp. Com. Lin.'
      FieldName = 'I_COMISION_LINEAL'
    end
    object QMDetalleFECHA_PRE_DET: TDateTimeField
      DisplayLabel = 'Fec. Prev.'
      FieldName = 'FECHA_PRE_DET'
    end
    object QMDetalleFECHA_REC_DET: TDateTimeField
      DisplayLabel = 'Fec. Recep.'
      FieldName = 'FECHA_REC_DET'
    end
    object QMDetalleTITULO_IDIOMA: TFIBStringField
      DisplayLabel = 'Titulo Idioma'
      FieldName = 'TITULO_IDIOMA'
      Size = 60
    end
    object QMDetalleORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMDetalleTIPO_LINEA: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_LINEA'
      Size = 3
    end
    object QMDetallePROC_PROMOCION: TIntegerField
      DisplayLabel = 'Proc. Prom.'
      FieldName = 'PROC_PROMOCION'
    end
    object QMDetalleORIGEN: TIntegerField
      DisplayLabel = 'Origen'
      FieldName = 'ORIGEN'
    end
    object QMDetalleID_P: TIntegerField
      DisplayLabel = 'ID Prom.'
      FieldName = 'ID_P'
    end
    object QMDetalleFECHA_ANTICIPO: TDateTimeField
      DisplayLabel = 'Fec. Ant.'
      FieldName = 'FECHA_ANTICIPO'
    end
    object QMDetalleCTA_PAGO_ANTICIPO: TFIBStringField
      DisplayLabel = 'Cta. Pago. Ant.'
      FieldName = 'CTA_PAGO_ANTICIPO'
      Size = 15
    end
    object QMDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField
      DisplayLabel = 'Aplica Uds. Sec.'
      FieldName = 'APLICA_UNIDADES_SECUNDARIAS'
    end
    object QMDetallePROYECTO: TIntegerField
      DisplayLabel = 'Proy.'
      FieldName = 'PROYECTO'
    end
    object QMDetalleLINEA_RELACION: TIntegerField
      DisplayLabel = 'L.R.'
      FieldName = 'LINEA_RELACION'
    end
    object QMDetalleTIPO_LINEA_KRI: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_LINEA_KRI'
    end
    object QMDetallePRO_NUM_PLANO: TFIBStringField
      DisplayLabel = 'Num. Plano'
      FieldName = 'PRO_NUM_PLANO'
      Size = 35
    end
    object QMDetalleCRC_NOTAS: TFIBStringField
      DisplayLabel = 'CRC Notas'
      FieldName = 'CRC_NOTAS'
      Size = 15
    end
    object QMDetalleCRC_NOTAS2: TFIBStringField
      DisplayLabel = 'CRC Notas Int.'
      FieldName = 'CRC_NOTAS2'
      Size = 35
    end
    object QMDetalleNOTAS2: TBlobField
      DisplayLabel = 'Notas Int.'
      FieldName = 'NOTAS2'
      Size = 8
    end
    object QMDetalleTIPO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Tipo UL'
      FieldName = 'TIPO_UNIDAD_LOGISTICA'
      Size = 5
    end
    object QMDetalleTITULO_UNIDAD_LOGISTICA: TFIBStringField
      DisplayLabel = 'Titulo UL'
      FieldName = 'TITULO_UNIDAD_LOGISTICA'
      Size = 35
    end
    object QMDetalleUNIDADES_LOGISTICAS: TFloatField
      DisplayLabel = 'Uds. Log.'
      FieldName = 'UNIDADES_LOGISTICAS'
    end
    object QMDetalleCERTIFICADO2: TIntegerField
      DisplayLabel = 'Num. Certificado'
      FieldName = 'CERTIFICADO'
    end
    object QMDetalleCERT_NEGATIVO: TIntegerField
      DisplayLabel = 'Cert. Neg.'
      FieldName = 'CERT_NEGATIVO'
    end
    object QMDetalleCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMDetalleLOTE_SIMPLE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE_SIMPLE'
    end
    object QMDetalleDIRECCION_ENTREGA: TIntegerField
      DisplayLabel = 'Dir. Entrega'
      FieldName = 'DIRECCION_ENTREGA'
    end
    object QMDetalleCOSTE_ADICIONAL: TFloatField
      DisplayLabel = 'Coste Adic.'
      FieldName = 'COSTE_ADICIONAL'
    end
    object QMDetalleCODIGO_CLIENTE: TStringField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'CODIGO_CLIENTE'
      Size = 40
    end
    object QMDetalleTITULO_CLIENTE: TStringField
      DisplayLabel = 'Titulo Segun Cli.'
      FieldName = 'TITULO_CLIENTE'
      Size = 256
    end
    object QMDetalleTOTAL_UNIDADES_EXT: TFloatField
      DisplayLabel = 'Tot. Uds. Ext.'
      FieldName = 'TOTAL_UNIDADES_EXT'
    end
    object QMDetalleMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldKind = fkCalculated
      FieldName = 'MARGEN'
      Calculated = True
    end
    object QMDetalleMANIPULACION: TIntegerField
      DisplayLabel = 'Man.'
      FieldName = 'MANIPULACION'
    end
    object QMDetalleALFA_1: TFIBStringField
      DisplayLabel = 'Alfa 1'
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMDetalleALFA_2: TFIBStringField
      DisplayLabel = 'Alfa 2'
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMDetalleALFA_3: TFIBStringField
      DisplayLabel = 'Alfa 3'
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMDetalleALFA_4: TFIBStringField
      DisplayLabel = 'Alfa 4'
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMDetalleALFA_5: TFIBStringField
      DisplayLabel = 'Alfa 5'
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMDetalleALFA_6: TFIBStringField
      DisplayLabel = 'Alfa 6'
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMDetalleALFA_7: TFIBStringField
      DisplayLabel = 'Alfa 7'
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMDetalleALFA_8: TFIBStringField
      DisplayLabel = 'Alfa 8'
      FieldName = 'ALFA_8'
      Size = 40
    end
    object QMDetalleID_IMAGEN: TIntegerField
      FieldName = 'ID_IMAGEN'
    end
    object QMDetalleINVERSION_SUJETO_PASIVO: TIntegerField
      DisplayLabel = 'ISP'
      FieldName = 'INVERSION_SUJETO_PASIVO'
    end
    object QMDetalleDECIMALES_UNIDADES: TIntegerField
      DisplayLabel = 'Decimales Uds.'
      FieldName = 'DECIMALES_UNIDADES'
    end
    object QMDetalleTIPO_IMPUESTO_ADICIONAL: TIntegerField
      DisplayLabel = 'Tipo Imp. Adicional'
      FieldName = 'TIPO_IMPUESTO_ADICIONAL'
    end
    object QMDetalleP_IMPUESTO_ADICIONAL: TFloatField
      DisplayLabel = '% Imp. Adicional'
      FieldName = 'P_IMPUESTO_ADICIONAL'
    end
    object QMDetalleLOTEABLE: TIntegerField
      DisplayLabel = 'Loteable'
      FieldName = 'LOTEABLE'
    end
    object QMDetalleCANT_LOTE: TFloatField
      DisplayLabel = 'Cant. Lote'
      FieldName = 'CANT_LOTE'
    end
    object QMDetalleID_LOTE: TIntegerField
      DisplayLabel = 'Id Lote'
      FieldName = 'ID_LOTE'
    end
    object QMDetalleLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMDetallePESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object QMDetallePESO_TOTAL: TFloatField
      DisplayLabel = 'Peso Total'
      FieldName = 'PESO_TOTAL'
    end
    object QMDetallePESO_REAL: TFloatField
      DisplayLabel = 'Peso Real'
      FieldName = 'PESO_REAL'
    end
    object QMDetalleSIGNO_UNIDADES: TFIBStringField
      DisplayLabel = 'Unidad'
      FieldName = 'SIGNO_UNIDADES'
      Size = 3
    end
    object QMDetalleUNIDAD_FOMENTO: TFloatField
      DisplayLabel = 'UF'
      FieldName = 'UNIDAD_FOMENTO'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 88
    Top = 192
  end
  object QSPProcedencia: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM  G_PROCEDENCIA_DOCUMENTO_LINEA'
      '(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMDetalle
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = DMMain.TLocal
    AutoCommit = True
    Left = 200
    Top = 40
  end
  object DSQSPProcedencia: TDataSource
    DataSet = QSPProcedencia
    Left = 296
    Top = 48
  end
end
