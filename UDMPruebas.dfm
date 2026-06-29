object DMPruebas: TDMPruebas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 547
  Top = 215
  Height = 323
  Width = 512
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 432
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 432
    Top = 64
  end
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 128
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CABECERAS_OFERTA_C'
      'WHERE'
      '  ID_S = ?ID_S')
    InsertSQL.Strings = (
      'INSERT INTO VER_CABECERAS_OFERTA_C'
      
        '  ( FECHA, NOTAS, BRUTO, I_DTO_LINEAS, S_BASES, M_BRUTO, C_TOTAL' +
        ', S_CUOTA_IVA,'
      
        '    S_CUOTA_RE, B_COMISION, I_COMISION, SERIE, RIG, TERCERO, CLI' +
        'ENTE, AGENTE, ENTRADA,'
      
        '    EMPRESA, EJERCICIO, CANAL, TITULO, DIRECCION, ESTADO, BULTOS' +
        ', LINEAS, DTO_PP,'
      
        '    DTO_CIAL, POR_FINANCIACION, TIPO, ALMACEN, MONEDA, SU_REFERE' +
        'NCIA, FORMA_PAGO,'
      
        '    CAMPANYA, TARIFA, ID_S, IDIOMA, PRESUPUESTO, CAMBIO_FIJO, VA' +
        'LOR_CAMB_FIJO, CONTACTO,'
      
        '    ADJUNTO, PROYECTO, NOTAS_INTERNAS_KRI, TIPO_LINEA_KRI, RANGO' +
        ', INDICE, TIPO_PORTES,'
      
        '    POR_PORTES, I_PORTES, Z_OBSERVACION,FECHA_VALIDEZ,PLAZO_ENTR' +
        'EGA)'
      'VALUES'
      
        '  (?FECHA,?NOTAS,?BRUTO,?I_DTO_LINEAS,?S_BASES,?M_BRUTO,?C_TOTAL' +
        ',?S_CUOTA_IVA,'
      
        '   ?S_CUOTA_RE,?B_COMISION,?I_COMISION,?SERIE,?RIG,?TERCERO,?CLI' +
        'ENTE,?AGENTE,?ENTRADA,'
      
        '   ?EMPRESA,?EJERCICIO,?CANAL,?TITULO,?DIRECCION,?ESTADO,?BULTOS' +
        ',?LINEAS,?DTO_PP,'
      
        '   ?DTO_CIAL,?POR_FINANCIACION,?TIPO,?ALMACEN,?MONEDA,?SU_REFERE' +
        'NCIA,?FORMA_PAGO,'
      
        '   ?CAMPANYA,?TARIFA,?ID_S,?IDIOMA,?PRESUPUESTO,?CAMBIO_FIJO,?VA' +
        'LOR_CAMB_FIJO,?CONTACTO,'
      
        '   ?ADJUNTO,?PROYECTO,?NOTAS_INTERNAS_KRI,?TIPO_LINEA_KRI,?RANGO' +
        ',?INDICE,?TIPO_PORTES,'
      
        '   ?POR_PORTES,?I_PORTES, ?Z_OBSERVACION,?FECHA_VALIDEZ,?PLAZO_E' +
        'NTREGA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_OFERTA_C'
      'WHERE'
      '  ID_S = ?ID_S')
    SelectSQL.Strings = (
      '/* Se establece en el OnCreate */'
      'SELECT '
      'EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, '
      'FECHA, TERCERO, TITULO, DIRECCION, CLIENTE, '
      'SU_REFERENCIA, FORMA_PAGO, ESTADO,'
      'AGENTE, '
      'B_DTO_LINEAS, DTO_PP, DTO_CIAL, '
      'POR_FINANCIACION, '
      'LIQUIDO, TARIFA, '
      'ID_S, IDIOMA, TIPO_PORTES, '
      'USUARIO, NOMBRE, MODIFICA_DOC '
      ' FROM VER_CABECERAS_OFERTA_C'
      'WHERE '
      'EMPRESA=?EMPRESA AND'
      'CANAL=?CANAL AND'
      'SERIE=?SERIE AND'
      'TIPO='#39'OFC'#39
      
        'AND (EJERCICIO=?EJERCICIO OR ((EJERCICIO < ?EJERCICIO) AND (ESTA' +
        'DO = 0)))'
      'ORDER BY EJERCICIO,RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CABECERAS_OFERTA_C'
      'SET'
      '  FECHA=?FECHA '
      '  ,NOTAS=?NOTAS '
      '  ,BRUTO=?BRUTO '
      '  ,I_DTO_LINEAS=?I_DTO_LINEAS '
      '  ,S_BASES=?S_BASES '
      '  ,M_BRUTO=?M_BRUTO '
      '  ,C_TOTAL=?C_TOTAL '
      '  ,S_CUOTA_IVA=?S_CUOTA_IVA '
      '  ,S_CUOTA_RE=?S_CUOTA_RE '
      '  ,B_COMISION=?B_COMISION '
      '  ,I_COMISION=?I_COMISION '
      '  ,TERCERO=?TERCERO '
      '  ,CLIENTE=?CLIENTE '
      '  ,AGENTE=?AGENTE '
      '  ,ENTRADA=?ENTRADA '
      '  ,TITULO=?TITULO '
      '  ,DIRECCION=?DIRECCION '
      '  ,ESTADO=?ESTADO '
      '  ,BULTOS=?BULTOS '
      '  ,LINEAS=?LINEAS '
      '  ,DTO_PP=?DTO_PP '
      '  ,DTO_CIAL=?DTO_CIAL '
      '  ,POR_FINANCIACION=?POR_FINANCIACION '
      '  ,ALMACEN=?ALMACEN '
      '  ,MONEDA=?MONEDA '
      '  ,SU_REFERENCIA=?SU_REFERENCIA '
      '  ,FORMA_PAGO=?FORMA_PAGO'
      '  ,CAMPANYA=?CAMPANYA'
      '  ,TARIFA = ?TARIFA'
      '  ,IDIOMA=?IDIOMA'
      '  ,PRESUPUESTO=?PRESUPUESTO'
      '  ,CAMBIO_FIJO=?CAMBIO_FIJO'
      '  ,VALOR_CAMB_FIJO=?VALOR_CAMB_FIJO'
      '  ,CONTACTO=?CONTACTO'
      '  ,ADJUNTO=?ADJUNTO'
      '  ,PROYECTO=?PROYECTO'
      '  ,NOTAS_INTERNAS_KRI=?NOTAS_INTERNAS_KRI'
      '  ,TIPO_LINEA_KRI=?TIPO_LINEA_KRI'
      '  ,RANGO = ?RANGO'
      '  ,INDICE =?INDICE'
      '  ,TIPO_PORTES = ?TIPO_PORTES'
      '  ,POR_PORTES = ?POR_PORTES'
      '  ,I_PORTES = ?I_PORTES'
      '  ,Z_OBSERVACION =?Z_OBSERVACION'
      '  ,FECHA_VALIDEZ=?FECHA_VALIDEZ'
      '  ,PLAZO_ENTREGA=?PLAZO_ENTREGA'
      'WHERE'
      '  ID_S = ?ID_S')
    ClavesPrimarias.Strings = (
      'ID_S'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CABECERAS_OFERTA_C'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 24
    object QMCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCabeceraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCabeceraSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabeceraTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCabeceraRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCabeceraFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCabeceraTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMCabeceraTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMCabeceraDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object QMCabeceraCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCabeceraSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMCabeceraFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMCabeceraESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCabeceraAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMCabeceraB_DTO_LINEAS: TFloatField
      DisplayLabel = 'B. Dto. Lineas'
      FieldName = 'B_DTO_LINEAS'
    end
    object QMCabeceraDTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DTO_PP'
    end
    object QMCabeceraDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial'
      FieldName = 'DTO_CIAL'
    end
    object QMCabeceraPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object QMCabeceraLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMCabeceraTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMCabeceraID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMCabeceraIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMCabeceraTIPO_PORTES: TIntegerField
      DisplayLabel = 'Tipo Portes'
      FieldName = 'TIPO_PORTES'
    end
    object QMCabeceraUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object QMCabeceraNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 31
    end
    object QMCabeceraMODIFICA_DOC: TIntegerField
      DisplayLabel = 'Modif. Doc.'
      FieldName = 'MODIFICA_DOC'
    end
  end
  object DSCabecera: TDataSource
    DataSet = QMCabecera
    Left = 120
    Top = 24
  end
  object xArticulos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 128
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS'
      
        '  (P_COSTE,UNIDADES,NOTAS,MULTIPLO_1,MULTIPLO_2,MULTIPLO_3,MULTI' +
        'PLO_4,FACTOR_ESCALA,UD_MINIMO_COMPRA,UD_MINIMO_VENTA,PESO,DEFECT' +
        'O_UD_SECUNDARIA,VOLUMEN_UNIT,DIAMETRO_UNIT,NOTAS_COMPRAS,NOTAS_V' +
        'ENTAS,ULT_MODIFICACION,FECHA_ENLOTADO,FECHA_BAJA,Z_ARM_LINEA,Z_A' +
        'RM_SALIDA,Z_LON_MODELO,Z_TIPO_LACADO_FORZADO,Z_LAM_ANCHO,Z_LAM_L' +
        'ARGO,COSTE_ADICIONAL,ENTRADA,CONTROLA_MEDIDAS,ID_A,ID_A_M_C_T,IM' +
        'AGEN,FABRICANTE,TIPO_CLAVE_ADR,Z_TOL_ID_A_ARMAZON,Z_TOL_ID_A_LON' +
        'A,ID_GALERIA,EMPRESA,TITULO,ABIERTO,CONTROL_STOCK,VIRTUAL,TITULO' +
        '_CORTO,SERIALIZADO,GARANTIA,PRODUCCION,DESCUENTO,DESCUENTO_2,DES' +
        'CUENTO_3,ALFA_1,ALFA_2,DISPONIBILIDAD,PVP_POR_UD_SECUNDARIA,ALFA' +
        '_3,ALFA_4,ALFA_5,LOTES_KRI,LOTES,CODIGO_INTRA,UBICABLE,ANTICIPO,' +
        'ANTICIPO_PREG_DATOS,ANTICIPO_CONTADO,WEB,NO_CALCULA_STOCKMINMAX,' +
        'BAJA,MOTIVO_BAJA,CANTIDAD_LIMITADA,Z_COM_LACADO,Z_COM_TIPO_LACAD' +
        'O,Z_COM_CORTE,Z_COM_QUITAR_SI_HAY_MOTOR,Z_PREPARABLE,Z_MERMA,Z_F' +
        'ORZAR_LACADO_SN,COMPONENTE_MOTOR,Z_LAM_COLOR,ALFA_6,EXPORTAR,ALF' +
        'A_7,ALFA_8,Z_COM_QUITAR_SI_ES_MANUAL,BLOQUEO_COMPRAS,MOTIVO_BLOQ' +
        'UEO_COMPRAS,BLOQUEO_VENTAS,MOTIVO_BLOQUEO_VENTAS,ADR_PACKAGE,PRE' +
        'PARABLE,REPLICADO,SERIALIZADO_KRI,ARTICULO,FAMILIA,CRC_NOTAS,CRC' +
        '_NOTAS_COMPRAS,CRC_NOTAS_VENTAS,TIPO_ARTICULO,TIPO_ARTICULO_TYC,' +
        'Z_ARM_MODELO,Z_TOL_ARMAZON,Z_TOL_LONA,Z_LON_TIPO,Z_LON_FORMA,Z_L' +
        'ON_CONFECCION,Z_COM_SUSTITUTO,Z_KIT_TIPO,SUBFAMILIA,SUBTIPO_ARTI' +
        'CULO_TYC,COD_COLOR_HILO,TIPO_REGISTRO_FITOSANITARIO)'
      'VALUES'
      
        '  (?P_COSTE,?UNIDADES,?NOTAS,?MULTIPLO_1,?MULTIPLO_2,?MULTIPLO_3' +
        ',?MULTIPLO_4,?FACTOR_ESCALA,?UD_MINIMO_COMPRA,?UD_MINIMO_VENTA,?' +
        'PESO,?DEFECTO_UD_SECUNDARIA,?VOLUMEN_UNIT,?DIAMETRO_UNIT,?NOTAS_' +
        'COMPRAS,?NOTAS_VENTAS,?ULT_MODIFICACION,?FECHA_ENLOTADO,?FECHA_B' +
        'AJA,?Z_ARM_LINEA,?Z_ARM_SALIDA,?Z_LON_MODELO,?Z_TIPO_LACADO_FORZ' +
        'ADO,?Z_LAM_ANCHO,?Z_LAM_LARGO,?COSTE_ADICIONAL,?ENTRADA,?CONTROL' +
        'A_MEDIDAS,?ID_A,?ID_A_M_C_T,?IMAGEN,?FABRICANTE,?TIPO_CLAVE_ADR,' +
        '?Z_TOL_ID_A_ARMAZON,?Z_TOL_ID_A_LONA,?ID_GALERIA,?EMPRESA,?TITUL' +
        'O,?ABIERTO,?CONTROL_STOCK,?VIRTUAL,?TITULO_CORTO,?SERIALIZADO,?G' +
        'ARANTIA,?PRODUCCION,?DESCUENTO,?DESCUENTO_2,?DESCUENTO_3,?ALFA_1' +
        ',?ALFA_2,?DISPONIBILIDAD,?PVP_POR_UD_SECUNDARIA,?ALFA_3,?ALFA_4,' +
        '?ALFA_5,?LOTES_KRI,?LOTES,?CODIGO_INTRA,?UBICABLE,?ANTICIPO,?ANT' +
        'ICIPO_PREG_DATOS,?ANTICIPO_CONTADO,?WEB,?NO_CALCULA_STOCKMINMAX,' +
        '?BAJA,?MOTIVO_BAJA,?CANTIDAD_LIMITADA,?Z_COM_LACADO,?Z_COM_TIPO_' +
        'LACADO,?Z_COM_CORTE,?Z_COM_QUITAR_SI_HAY_MOTOR,?Z_PREPARABLE,?Z_' +
        'MERMA,?Z_FORZAR_LACADO_SN,?COMPONENTE_MOTOR,?Z_LAM_COLOR,?ALFA_6' +
        ',?EXPORTAR,?ALFA_7,?ALFA_8,?Z_COM_QUITAR_SI_ES_MANUAL,?BLOQUEO_C' +
        'OMPRAS,?MOTIVO_BLOQUEO_COMPRAS,?BLOQUEO_VENTAS,?MOTIVO_BLOQUEO_V' +
        'ENTAS,?ADR_PACKAGE,?PREPARABLE,?REPLICADO,?SERIALIZADO_KRI,?ARTI' +
        'CULO,?FAMILIA,?CRC_NOTAS,?CRC_NOTAS_COMPRAS,?CRC_NOTAS_VENTAS,?T' +
        'IPO_ARTICULO,?TIPO_ARTICULO_TYC,?Z_ARM_MODELO,?Z_TOL_ARMAZON,?Z_' +
        'TOL_LONA,?Z_LON_TIPO,?Z_LON_FORMA,?Z_LON_CONFECCION,?Z_COM_SUSTI' +
        'TUTO,?Z_KIT_TIPO,?SUBFAMILIA,?SUBTIPO_ARTICULO_TYC,?COD_COLOR_HI' +
        'LO,?TIPO_REGISTRO_FITOSANITARIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS'
      'WHERE'
      'EMPRESA = 1 AND'
      'ARTICULO = '#39'.'#39)
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS'
      'SET'
      '  P_COSTE=?P_COSTE '
      '  ,UNIDADES=?UNIDADES '
      '  ,NOTAS=?NOTAS '
      '  ,MULTIPLO_1=?MULTIPLO_1 '
      '  ,MULTIPLO_2=?MULTIPLO_2 '
      '  ,MULTIPLO_3=?MULTIPLO_3 '
      '  ,MULTIPLO_4=?MULTIPLO_4 '
      '  ,FACTOR_ESCALA=?FACTOR_ESCALA '
      '  ,UD_MINIMO_COMPRA=?UD_MINIMO_COMPRA '
      '  ,UD_MINIMO_VENTA=?UD_MINIMO_VENTA '
      '  ,PESO=?PESO '
      '  ,DEFECTO_UD_SECUNDARIA=?DEFECTO_UD_SECUNDARIA '
      '  ,VOLUMEN_UNIT=?VOLUMEN_UNIT '
      '  ,DIAMETRO_UNIT=?DIAMETRO_UNIT '
      '  ,NOTAS_COMPRAS=?NOTAS_COMPRAS '
      '  ,NOTAS_VENTAS=?NOTAS_VENTAS '
      '  ,ULT_MODIFICACION=?ULT_MODIFICACION '
      '  ,FECHA_ENLOTADO=?FECHA_ENLOTADO '
      '  ,FECHA_BAJA=?FECHA_BAJA '
      '  ,Z_ARM_LINEA=?Z_ARM_LINEA '
      '  ,Z_ARM_SALIDA=?Z_ARM_SALIDA '
      '  ,Z_LON_MODELO=?Z_LON_MODELO '
      '  ,Z_TIPO_LACADO_FORZADO=?Z_TIPO_LACADO_FORZADO '
      '  ,Z_LAM_ANCHO=?Z_LAM_ANCHO '
      '  ,Z_LAM_LARGO=?Z_LAM_LARGO '
      '  ,COSTE_ADICIONAL=?COSTE_ADICIONAL '
      '  ,ENTRADA=?ENTRADA '
      '  ,CONTROLA_MEDIDAS=?CONTROLA_MEDIDAS '
      '  ,ID_A=?ID_A '
      '  ,ID_A_M_C_T=?ID_A_M_C_T '
      '  ,IMAGEN=?IMAGEN '
      '  ,FABRICANTE=?FABRICANTE '
      '  ,TIPO_CLAVE_ADR=?TIPO_CLAVE_ADR '
      '  ,Z_TOL_ID_A_ARMAZON=?Z_TOL_ID_A_ARMAZON '
      '  ,Z_TOL_ID_A_LONA=?Z_TOL_ID_A_LONA '
      '  ,ID_GALERIA=?ID_GALERIA '
      '  ,TITULO=?TITULO '
      '  ,ABIERTO=?ABIERTO '
      '  ,CONTROL_STOCK=?CONTROL_STOCK '
      '  ,VIRTUAL=?VIRTUAL '
      '  ,TITULO_CORTO=?TITULO_CORTO '
      '  ,SERIALIZADO=?SERIALIZADO '
      '  ,GARANTIA=?GARANTIA '
      '  ,PRODUCCION=?PRODUCCION '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,DESCUENTO_2=?DESCUENTO_2 '
      '  ,DESCUENTO_3=?DESCUENTO_3 '
      '  ,ALFA_1=?ALFA_1 '
      '  ,ALFA_2=?ALFA_2 '
      '  ,DISPONIBILIDAD=?DISPONIBILIDAD '
      '  ,PVP_POR_UD_SECUNDARIA=?PVP_POR_UD_SECUNDARIA '
      '  ,ALFA_3=?ALFA_3 '
      '  ,ALFA_4=?ALFA_4 '
      '  ,ALFA_5=?ALFA_5 '
      '  ,LOTES_KRI=?LOTES_KRI '
      '  ,LOTES=?LOTES '
      '  ,CODIGO_INTRA=?CODIGO_INTRA '
      '  ,UBICABLE=?UBICABLE '
      '  ,ANTICIPO=?ANTICIPO '
      '  ,ANTICIPO_PREG_DATOS=?ANTICIPO_PREG_DATOS '
      '  ,ANTICIPO_CONTADO=?ANTICIPO_CONTADO '
      '  ,WEB=?WEB '
      '  ,NO_CALCULA_STOCKMINMAX=?NO_CALCULA_STOCKMINMAX '
      '  ,BAJA=?BAJA '
      '  ,MOTIVO_BAJA=?MOTIVO_BAJA '
      '  ,CANTIDAD_LIMITADA=?CANTIDAD_LIMITADA '
      '  ,Z_COM_LACADO=?Z_COM_LACADO '
      '  ,Z_COM_TIPO_LACADO=?Z_COM_TIPO_LACADO '
      '  ,Z_COM_CORTE=?Z_COM_CORTE '
      '  ,Z_COM_QUITAR_SI_HAY_MOTOR=?Z_COM_QUITAR_SI_HAY_MOTOR '
      '  ,Z_PREPARABLE=?Z_PREPARABLE '
      '  ,Z_MERMA=?Z_MERMA '
      '  ,Z_FORZAR_LACADO_SN=?Z_FORZAR_LACADO_SN '
      '  ,COMPONENTE_MOTOR=?COMPONENTE_MOTOR '
      '  ,Z_LAM_COLOR=?Z_LAM_COLOR '
      '  ,ALFA_6=?ALFA_6 '
      '  ,EXPORTAR=?EXPORTAR '
      '  ,ALFA_7=?ALFA_7 '
      '  ,ALFA_8=?ALFA_8 '
      '  ,Z_COM_QUITAR_SI_ES_MANUAL=?Z_COM_QUITAR_SI_ES_MANUAL '
      '  ,BLOQUEO_COMPRAS=?BLOQUEO_COMPRAS '
      '  ,MOTIVO_BLOQUEO_COMPRAS=?MOTIVO_BLOQUEO_COMPRAS '
      '  ,BLOQUEO_VENTAS=?BLOQUEO_VENTAS '
      '  ,MOTIVO_BLOQUEO_VENTAS=?MOTIVO_BLOQUEO_VENTAS '
      '  ,ADR_PACKAGE=?ADR_PACKAGE '
      '  ,PREPARABLE=?PREPARABLE '
      '  ,REPLICADO=?REPLICADO '
      '  ,SERIALIZADO_KRI=?SERIALIZADO_KRI '
      '  ,FAMILIA=?FAMILIA '
      '  ,CRC_NOTAS=?CRC_NOTAS '
      '  ,CRC_NOTAS_COMPRAS=?CRC_NOTAS_COMPRAS '
      '  ,CRC_NOTAS_VENTAS=?CRC_NOTAS_VENTAS '
      '  ,TIPO_ARTICULO=?TIPO_ARTICULO '
      '  ,TIPO_ARTICULO_TYC=?TIPO_ARTICULO_TYC '
      '  ,Z_ARM_MODELO=?Z_ARM_MODELO '
      '  ,Z_TOL_ARMAZON=?Z_TOL_ARMAZON '
      '  ,Z_TOL_LONA=?Z_TOL_LONA '
      '  ,Z_LON_TIPO=?Z_LON_TIPO '
      '  ,Z_LON_FORMA=?Z_LON_FORMA '
      '  ,Z_LON_CONFECCION=?Z_LON_CONFECCION '
      '  ,Z_COM_SUSTITUTO=?Z_COM_SUSTITUTO '
      '  ,Z_KIT_TIPO=?Z_KIT_TIPO '
      '  ,SUBFAMILIA=?SUBFAMILIA '
      '  ,SUBTIPO_ARTICULO_TYC=?SUBTIPO_ARTICULO_TYC '
      '  ,COD_COLOR_HILO=?COD_COLOR_HILO '
      '  ,TIPO_REGISTRO_FITOSANITARIO=?TIPO_REGISTRO_FITOSANITARIO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 72
    object xArticulosEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xArticulosARTICULO: TFIBStringField
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArticulosTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 60
    end
    object xArticulosFAMILIA: TFIBStringField
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xArticulosP_COSTE: TFloatField
      FieldName = 'P_COSTE'
    end
    object xArticulosABIERTO: TIntegerField
      FieldName = 'ABIERTO'
    end
    object xArticulosCONTROL_STOCK: TIntegerField
      FieldName = 'CONTROL_STOCK'
    end
    object xArticulosENTRADA: TIntegerField
      FieldName = 'ENTRADA'
    end
    object xArticulosUNIDADES: TFIBStringField
      FieldName = 'UNIDADES'
      Size = 2
    end
    object xArticulosVIRTUAL: TIntegerField
      FieldName = 'VIRTUAL'
    end
    object xArticulosNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object xArticulosTITULO_CORTO: TFIBStringField
      FieldName = 'TITULO_CORTO'
    end
    object xArticulosCONTROLA_MEDIDAS: TIntegerField
      FieldName = 'CONTROLA_MEDIDAS'
    end
    object xArticulosSERIALIZADO: TIntegerField
      FieldName = 'SERIALIZADO'
    end
    object xArticulosGARANTIA: TIntegerField
      FieldName = 'GARANTIA'
    end
    object xArticulosPRODUCCION: TIntegerField
      FieldName = 'PRODUCCION'
    end
    object xArticulosDESCUENTO: TFloatField
      FieldName = 'DESCUENTO'
    end
    object xArticulosDESCUENTO_2: TFloatField
      FieldName = 'DESCUENTO_2'
    end
    object xArticulosDESCUENTO_3: TFloatField
      FieldName = 'DESCUENTO_3'
    end
    object xArticulosALFA_1: TFIBStringField
      FieldName = 'ALFA_1'
      Size = 40
    end
    object xArticulosALFA_2: TFIBStringField
      FieldName = 'ALFA_2'
      Size = 40
    end
    object xArticulosDISPONIBILIDAD: TIntegerField
      FieldName = 'DISPONIBILIDAD'
    end
    object xArticulosPVP_POR_UD_SECUNDARIA: TIntegerField
      FieldName = 'PVP_POR_UD_SECUNDARIA'
    end
    object xArticulosALFA_3: TFIBStringField
      FieldName = 'ALFA_3'
      Size = 40
    end
    object xArticulosALFA_4: TFIBStringField
      FieldName = 'ALFA_4'
      Size = 40
    end
    object xArticulosALFA_5: TFIBStringField
      FieldName = 'ALFA_5'
      Size = 40
    end
    object xArticulosLOTES_KRI: TIntegerField
      FieldName = 'LOTES_KRI'
    end
    object xArticulosLOTES: TIntegerField
      FieldName = 'LOTES'
    end
    object xArticulosMULTIPLO_1: TFloatField
      FieldName = 'MULTIPLO_1'
    end
    object xArticulosMULTIPLO_2: TFloatField
      FieldName = 'MULTIPLO_2'
    end
    object xArticulosMULTIPLO_3: TFloatField
      FieldName = 'MULTIPLO_3'
    end
    object xArticulosMULTIPLO_4: TFloatField
      FieldName = 'MULTIPLO_4'
    end
    object xArticulosFACTOR_ESCALA: TFloatField
      FieldName = 'FACTOR_ESCALA'
    end
    object xArticulosUD_MINIMO_COMPRA: TFloatField
      FieldName = 'UD_MINIMO_COMPRA'
    end
    object xArticulosUD_MINIMO_VENTA: TFloatField
      FieldName = 'UD_MINIMO_VENTA'
    end
    object xArticulosID_A: TIntegerField
      FieldName = 'ID_A'
    end
    object xArticulosID_A_M_C_T: TIntegerField
      FieldName = 'ID_A_M_C_T'
    end
    object xArticulosIMAGEN: TIntegerField
      FieldName = 'IMAGEN'
    end
    object xArticulosCODIGO_INTRA: TFIBStringField
      FieldName = 'CODIGO_INTRA'
      Size = 10
    end
    object xArticulosPESO: TFloatField
      FieldName = 'PESO'
    end
    object xArticulosUBICABLE: TIntegerField
      FieldName = 'UBICABLE'
    end
    object xArticulosDEFECTO_UD_SECUNDARIA: TFloatField
      FieldName = 'DEFECTO_UD_SECUNDARIA'
    end
    object xArticulosVOLUMEN_UNIT: TFloatField
      FieldName = 'VOLUMEN_UNIT'
    end
    object xArticulosDIAMETRO_UNIT: TFloatField
      FieldName = 'DIAMETRO_UNIT'
    end
    object xArticulosNOTAS_COMPRAS: TMemoField
      FieldName = 'NOTAS_COMPRAS'
      BlobType = ftMemo
      Size = 8
    end
    object xArticulosNOTAS_VENTAS: TMemoField
      FieldName = 'NOTAS_VENTAS'
      BlobType = ftMemo
      Size = 8
    end
    object xArticulosULT_MODIFICACION: TDateTimeField
      FieldName = 'ULT_MODIFICACION'
    end
    object xArticulosANTICIPO: TIntegerField
      FieldName = 'ANTICIPO'
    end
    object xArticulosANTICIPO_PREG_DATOS: TIntegerField
      FieldName = 'ANTICIPO_PREG_DATOS'
    end
    object xArticulosANTICIPO_CONTADO: TIntegerField
      FieldName = 'ANTICIPO_CONTADO'
    end
    object xArticulosWEB: TIntegerField
      FieldName = 'WEB'
    end
    object xArticulosFABRICANTE: TIntegerField
      FieldName = 'FABRICANTE'
    end
    object xArticulosNO_CALCULA_STOCKMINMAX: TIntegerField
      FieldName = 'NO_CALCULA_STOCKMINMAX'
    end
    object xArticulosCRC_NOTAS: TFIBStringField
      FieldName = 'CRC_NOTAS'
      Size = 15
    end
    object xArticulosCRC_NOTAS_COMPRAS: TFIBStringField
      FieldName = 'CRC_NOTAS_COMPRAS'
      Size = 15
    end
    object xArticulosCRC_NOTAS_VENTAS: TFIBStringField
      FieldName = 'CRC_NOTAS_VENTAS'
      Size = 15
    end
    object xArticulosFECHA_ENLOTADO: TDateTimeField
      FieldName = 'FECHA_ENLOTADO'
    end
    object xArticulosTIPO_ARTICULO: TFIBStringField
      FieldName = 'TIPO_ARTICULO'
      Size = 3
    end
    object xArticulosBAJA: TIntegerField
      FieldName = 'BAJA'
    end
    object xArticulosFECHA_BAJA: TDateTimeField
      FieldName = 'FECHA_BAJA'
    end
    object xArticulosMOTIVO_BAJA: TFIBStringField
      FieldName = 'MOTIVO_BAJA'
      Size = 60
    end
    object xArticulosTIPO_CLAVE_ADR: TIntegerField
      FieldName = 'TIPO_CLAVE_ADR'
    end
    object xArticulosCANTIDAD_LIMITADA: TIntegerField
      FieldName = 'CANTIDAD_LIMITADA'
    end
    object xArticulosTIPO_ARTICULO_TYC: TFIBStringField
      DisplayWidth = 3
      FieldName = 'TIPO_ARTICULO_TYC'
      Size = 3
    end
    object xArticulosZ_ARM_MODELO: TFIBStringField
      FieldName = 'Z_ARM_MODELO'
      Size = 5
    end
    object xArticulosZ_ARM_LINEA: TFloatField
      FieldName = 'Z_ARM_LINEA'
    end
    object xArticulosZ_ARM_SALIDA: TFloatField
      FieldName = 'Z_ARM_SALIDA'
    end
    object xArticulosZ_TOL_ARMAZON: TFIBStringField
      FieldName = 'Z_TOL_ARMAZON'
      Size = 15
    end
    object xArticulosZ_TOL_LONA: TFIBStringField
      FieldName = 'Z_TOL_LONA'
      Size = 15
    end
    object xArticulosZ_TOL_ID_A_ARMAZON: TIntegerField
      FieldName = 'Z_TOL_ID_A_ARMAZON'
    end
    object xArticulosZ_TOL_ID_A_LONA: TIntegerField
      FieldName = 'Z_TOL_ID_A_LONA'
    end
    object xArticulosZ_LON_TIPO: TFIBStringField
      FieldName = 'Z_LON_TIPO'
      Size = 3
    end
    object xArticulosZ_LON_FORMA: TFIBStringField
      FieldName = 'Z_LON_FORMA'
      Size = 3
    end
    object xArticulosZ_LON_MODELO: TFIBStringField
      FieldName = 'Z_LON_MODELO'
      Size = 10
    end
    object xArticulosZ_LON_CONFECCION: TFIBStringField
      FieldName = 'Z_LON_CONFECCION'
      Size = 3
    end
    object xArticulosZ_COM_LACADO: TIntegerField
      FieldName = 'Z_COM_LACADO'
    end
    object xArticulosZ_COM_TIPO_LACADO: TFIBStringField
      FieldName = 'Z_COM_TIPO_LACADO'
      Size = 2
    end
    object xArticulosZ_COM_CORTE: TIntegerField
      FieldName = 'Z_COM_CORTE'
    end
    object xArticulosZ_COM_QUITAR_SI_HAY_MOTOR: TIntegerField
      FieldName = 'Z_COM_QUITAR_SI_HAY_MOTOR'
    end
    object xArticulosZ_COM_SUSTITUTO: TFIBStringField
      FieldName = 'Z_COM_SUSTITUTO'
      Size = 15
    end
    object xArticulosZ_KIT_TIPO: TFIBStringField
      FieldName = 'Z_KIT_TIPO'
      Size = 3
    end
    object xArticulosZ_PREPARABLE: TIntegerField
      FieldName = 'Z_PREPARABLE'
    end
    object xArticulosZ_MERMA: TFloatField
      FieldName = 'Z_MERMA'
    end
    object xArticulosZ_FORZAR_LACADO_SN: TIntegerField
      FieldName = 'Z_FORZAR_LACADO_SN'
    end
    object xArticulosZ_TIPO_LACADO_FORZADO: TFIBStringField
      FieldName = 'Z_TIPO_LACADO_FORZADO'
      Size = 2
    end
    object xArticulosCOMPONENTE_MOTOR: TIntegerField
      FieldName = 'COMPONENTE_MOTOR'
    end
    object xArticulosZ_LAM_ANCHO: TFloatField
      FieldName = 'Z_LAM_ANCHO'
    end
    object xArticulosZ_LAM_LARGO: TFloatField
      FieldName = 'Z_LAM_LARGO'
    end
    object xArticulosZ_LAM_COLOR: TFIBStringField
      FieldName = 'Z_LAM_COLOR'
      Size = 2
    end
    object xArticulosSUBFAMILIA: TFIBStringField
      FieldName = 'SUBFAMILIA'
      Size = 5
    end
    object xArticulosALFA_6: TFIBStringField
      FieldName = 'ALFA_6'
      Size = 40
    end
    object xArticulosSUBTIPO_ARTICULO_TYC: TFIBStringField
      DisplayWidth = 3
      FieldName = 'SUBTIPO_ARTICULO_TYC'
      Size = 3
    end
    object xArticulosID_GALERIA: TIntegerField
      FieldName = 'ID_GALERIA'
    end
    object xArticulosEXPORTAR: TIntegerField
      FieldName = 'EXPORTAR'
    end
    object xArticulosCOSTE_ADICIONAL: TFloatField
      FieldName = 'COSTE_ADICIONAL'
    end
    object xArticulosALFA_7: TFIBStringField
      FieldName = 'ALFA_7'
      Size = 40
    end
    object xArticulosALFA_8: TFIBStringField
      FieldName = 'ALFA_8'
      Size = 40
    end
    object xArticulosZ_COM_QUITAR_SI_ES_MANUAL: TIntegerField
      FieldName = 'Z_COM_QUITAR_SI_ES_MANUAL'
    end
    object xArticulosCOD_COLOR_HILO: TFIBStringField
      FieldName = 'COD_COLOR_HILO'
      Size = 3
    end
    object xArticulosBLOQUEO_COMPRAS: TIntegerField
      FieldName = 'BLOQUEO_COMPRAS'
    end
    object xArticulosMOTIVO_BLOQUEO_COMPRAS: TFIBStringField
      FieldName = 'MOTIVO_BLOQUEO_COMPRAS'
      Size = 40
    end
    object xArticulosBLOQUEO_VENTAS: TIntegerField
      FieldName = 'BLOQUEO_VENTAS'
    end
    object xArticulosMOTIVO_BLOQUEO_VENTAS: TFIBStringField
      FieldName = 'MOTIVO_BLOQUEO_VENTAS'
      Size = 40
    end
    object xArticulosADR_PACKAGE: TFIBStringField
      FieldName = 'ADR_PACKAGE'
      Size = 40
    end
    object xArticulosTIPO_REGISTRO_FITOSANITARIO: TFIBStringField
      FieldName = 'TIPO_REGISTRO_FITOSANITARIO'
      Size = 1
    end
    object xArticulosPREPARABLE: TIntegerField
      FieldName = 'PREPARABLE'
    end
    object xArticulosREPLICADO: TIntegerField
      FieldName = 'REPLICADO'
    end
    object xArticulosSERIALIZADO_KRI: TIntegerField
      FieldName = 'SERIALIZADO_KRI'
    end
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 120
    Top = 72
  end
  object xOrden: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 128
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PRO_ORD'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIES=?old_SERIES AND '
      '  RIG_OF=?old_RIG_OF ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PRO_ORD'
      
        '  (FECHA_ORD,FECHA_PED,UNI_PEDID,UNI_MANUAL,UNI_TOTAL,UNI_PRODUC' +
        ',UNI_PENDIENTES,FECHA_ENTREGA,OBSERVACIONES,MARGEN_UNI_CIEN,COST' +
        'E_COMPRAS,HORAS_OPERARIO,HORAS_MAQUINA,MEDIDA_1,MEDIDA_2,MEDIDA_' +
        '3,MEDIDA_4,FECHA_INI,FECHA_FIN,COSTE_FIJO_PRE,COSTE_VAR_PRE,COST' +
        'E_MAT_PRE,COSTE_MO_PRE,COSTE_MAQ_PRE,COSTE_TEX_PRE,COSTE_TOT_PRE' +
        ',COSTE_FIJO_REAL,COSTE_VAR_REAL,COSTE_MAT_REAL,COSTE_MO_REAL,COS' +
        'TE_MAQ_REAL,COSTE_TEX_REAL,COSTE_TOT_REAL,COSTE_UNITARIO,PRECIO_' +
        'VENTA,HORAS_TOTALES,MARGEN_UNI,MARGEN_TOTAL,COSTE_COMPRAS_PRE,MA' +
        'RGEN_TOTAL_PRE,MARGEN_UNI_CIEN_PRE,COSTE_UNITARIO_PRE,MARGEN_UNI' +
        '_PRE,PRECIO_VENTA_PRE,PRECIO_VENTA_TOT_PRE,PRECIO_VENTA_TOT_REAL' +
        ',HORAS_OPERARIO_PRE,HORAS_MAQUINA_PRE,UNI_FABRICADAS,COSTE_MERMA' +
        '_PRE,COSTE_MERMA_REAL,DIF_COSTE_MERMA,SERIES,RIG_OF,SUBORDEN,CLI' +
        'ENTE,ESCANDALLO,PEDIDO,MERMA,ENTRADA,ID_ORDEN,ID_ORDEN_MAT,ID_MO' +
        'V_STOCK,ISO_APROBADO,ISO_VERIFICADO,ISO_VALIDADO,ID_A,PADRE_SUBO' +
        'RDEN,CONT_SUBORDEN,ID_DESPIECE,ID_ORDEN_SUBORDEN,RESPONSABLE,PLA' +
        'NIFICACION,LINEA_PLANIFICACION,ID_PLANIFICACION,ID_PLANIFICACION' +
        '_DET,ID_UBICACION,ID_MOV_STOCK_RESERVA,UNIDAD,COPIAS_PMP,EMPRESA' +
        ',EJERCICIO,CANAL,TITULO,ESTADO,LINEA_PED,PRIORIDAD,VISTOBUENO1,V' +
        'ISTOBUENO2,VISTOBUENO3,SITUACION,TIPO_LANZAMIENTO,TIPO_RESERVA,R' +
        'EFERENCIA,SELECCIONADA,PREVALECE_ALM_ORDEN,CERRAR_SUBORDENES,IMP' +
        'ORTAR_OP,CASO_OP,RESERVA_STOCK_OP,DESACTIVA_TRIGGER,COMPUESTOS_V' +
        'IRTUALES,SEGUIR_SIN_STOCK,RECUPERADO_MARCAJE,ALMACEN_SAL,ALMACEN' +
        '_LAN,ALMACEN_ENT,COMPUESTO,VERSION_ORDEN)'
      'VALUES'
      
        '  (?FECHA_ORD,?FECHA_PED,?UNI_PEDID,?UNI_MANUAL,?UNI_TOTAL,?UNI_' +
        'PRODUC,?UNI_PENDIENTES,?FECHA_ENTREGA,?OBSERVACIONES,?MARGEN_UNI' +
        '_CIEN,?COSTE_COMPRAS,?HORAS_OPERARIO,?HORAS_MAQUINA,?MEDIDA_1,?M' +
        'EDIDA_2,?MEDIDA_3,?MEDIDA_4,?FECHA_INI,?FECHA_FIN,?COSTE_FIJO_PR' +
        'E,?COSTE_VAR_PRE,?COSTE_MAT_PRE,?COSTE_MO_PRE,?COSTE_MAQ_PRE,?CO' +
        'STE_TEX_PRE,?COSTE_TOT_PRE,?COSTE_FIJO_REAL,?COSTE_VAR_REAL,?COS' +
        'TE_MAT_REAL,?COSTE_MO_REAL,?COSTE_MAQ_REAL,?COSTE_TEX_REAL,?COST' +
        'E_TOT_REAL,?COSTE_UNITARIO,?PRECIO_VENTA,?HORAS_TOTALES,?MARGEN_' +
        'UNI,?MARGEN_TOTAL,?COSTE_COMPRAS_PRE,?MARGEN_TOTAL_PRE,?MARGEN_U' +
        'NI_CIEN_PRE,?COSTE_UNITARIO_PRE,?MARGEN_UNI_PRE,?PRECIO_VENTA_PR' +
        'E,?PRECIO_VENTA_TOT_PRE,?PRECIO_VENTA_TOT_REAL,?HORAS_OPERARIO_P' +
        'RE,?HORAS_MAQUINA_PRE,?UNI_FABRICADAS,?COSTE_MERMA_PRE,?COSTE_ME' +
        'RMA_REAL,?DIF_COSTE_MERMA,?SERIES,?RIG_OF,?SUBORDEN,?CLIENTE,?ES' +
        'CANDALLO,?PEDIDO,?MERMA,?ENTRADA,?ID_ORDEN,?ID_ORDEN_MAT,?ID_MOV' +
        '_STOCK,?ISO_APROBADO,?ISO_VERIFICADO,?ISO_VALIDADO,?ID_A,?PADRE_' +
        'SUBORDEN,?CONT_SUBORDEN,?ID_DESPIECE,?ID_ORDEN_SUBORDEN,?RESPONS' +
        'ABLE,?PLANIFICACION,?LINEA_PLANIFICACION,?ID_PLANIFICACION,?ID_P' +
        'LANIFICACION_DET,?ID_UBICACION,?ID_MOV_STOCK_RESERVA,?UNIDAD,?CO' +
        'PIAS_PMP,?EMPRESA,?EJERCICIO,?CANAL,?TITULO,?ESTADO,?LINEA_PED,?' +
        'PRIORIDAD,?VISTOBUENO1,?VISTOBUENO2,?VISTOBUENO3,?SITUACION,?TIP' +
        'O_LANZAMIENTO,?TIPO_RESERVA,?REFERENCIA,?SELECCIONADA,?PREVALECE' +
        '_ALM_ORDEN,?CERRAR_SUBORDENES,?IMPORTAR_OP,?CASO_OP,?RESERVA_STO' +
        'CK_OP,?DESACTIVA_TRIGGER,?COMPUESTOS_VIRTUALES,?SEGUIR_SIN_STOCK' +
        ',?RECUPERADO_MARCAJE,?ALMACEN_SAL,?ALMACEN_LAN,?ALMACEN_ENT,?COM' +
        'PUESTO,?VERSION_ORDEN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PRO_ORD'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIES=?SERIES AND '
      '  RIG_OF=?RIG_OF ')
    SelectSQL.Strings = (
      'SELECT    '
      '    EMPRESA,'
      '    EJERCICIO,'
      '    CANAL,'
      '    SERIES,'
      '    RIG_OF,/*'
      '   SUBORDEN,'
      '    ALMACEN_SAL,'
      '    ALMACEN_LAN,'
      '    ALMACEN_ENT,'
      '    FECHA_ORD,'
      '    CLIENTE,'
      '    COMPUESTO,'
      '    TITULO,'
      '    ESCANDALLO,'
      '    ESTADO,'
      '    PEDIDO,'
      '    LINEA_PED,'
      '    FECHA_PED,'
      '    UNI_PEDID,'
      '    UNI_MANUAL,'
      '    UNI_TOTAL,'
      '    PRIORIDAD,'
      '    MERMA,'
      '    UNI_PRODUC,'
      '    UNI_PENDIENTES,'
      '    FECHA_ENTREGA,'
      '    FECHA_INI,'
      '    FECHA_FIN,'
      '    COSTE_FIJO_PRE,'
      '    COSTE_VAR_PRE,'
      '    COSTE_MAT_PRE,'
      '    COSTE_MO_PRE,'
      '    COSTE_MAQ_PRE,'
      '    COSTE_TEX_PRE,'
      '    COSTE_TOT_PRE,'
      '    COSTE_FIJO_REAL,'
      '    COSTE_VAR_REAL,'
      '    COSTE_MAT_REAL,'
      '    COSTE_MO_REAL,'
      '    COSTE_MAQ_REAL,'
      '    COSTE_TEX_REAL,'
      '    COSTE_TOT_REAL,'
      '    COSTE_UNITARIO,'
      '    PRECIO_VENTA,'
      '    HORAS_TOTALES,'
      '    MARGEN_UNI,'
      '    MARGEN_TOTAL,*/'
      '  /*  OBSERVACIONES,*/'
      '    VISTOBUENO1,'
      '    VISTOBUENO2,'
      '    VISTOBUENO3,'
      '    SITUACION,'
      '    MARGEN_UNI_CIEN,'
      '    ENTRADA,'
      '    ID_ORDEN,'
      '    TIPO_LANZAMIENTO,'
      '    ID_ORDEN_MAT,'
      '    TIPO_RESERVA,'
      '    ID_MOV_STOCK,'
      '    ISO_APROBADO,'
      '    ISO_VERIFICADO,'
      '    ISO_VALIDADO,'
      '    ID_A,'
      '    PADRE_SUBORDEN,'
      '    CONT_SUBORDEN,'
      '    REFERENCIA,'
      '    COSTE_COMPRAS,'
      '    HORAS_OPERARIO,'
      '    HORAS_MAQUINA,'
      '    ID_DESPIECE,'
      '    ID_ORDEN_SUBORDEN,'
      '    SELECCIONADA,'
      '    PREVALECE_ALM_ORDEN,'
      '    CERRAR_SUBORDENES,'
      '    IMPORTAR_OP,'
      '    CASO_OP,'
      '    RESERVA_STOCK_OP,'
      '    MEDIDA_1,'
      '    MEDIDA_2,'
      '    MEDIDA_3,'
      '    MEDIDA_4,'
      '    DESACTIVA_TRIGGER,'
      '    RESPONSABLE,/*'
      '    DIF_COSTE_FIJO,'
      '    DIF_COSTE_MAT,'
      '    DIF_COSTE_MO,'
      '    DIF_COSTE_MAQ,'
      '    DIF_COSTE_TEXT,'
      '    DIF_COSTE_VAR,*/'
      '    COSTE_COMPRAS_PRE,/*'
      '    DIF_COSTE_COMPRAS,'
      '    DIF_COSTE_TOTAL,*/'
      '    COMPUESTOS_VIRTUALES,'
      '    SEGUIR_SIN_STOCK,'
      '    MARGEN_TOTAL_PRE,'
      '    MARGEN_UNI_CIEN_PRE,'
      '    COSTE_UNITARIO_PRE,'
      '    MARGEN_UNI_PRE,'
      '    PRECIO_VENTA_PRE,'
      '    PRECIO_VENTA_TOT_PRE,'
      '    PRECIO_VENTA_TOT_REAL,/*'
      '    DIF_COSTE_MARGEN_TOTAL,'
      '    DIF_MARGEN_TOTAL,'
      '    DIF_MARGEN_UNI_CIEN,'
      '    DIF_PRECIO_VENTA_UNI,'
      '    DIF_COSTE_UNI,'
      '    DIF_MARGEN_UNI,'
      '    DIF_PRECIO_VENTA_TOT,*/'
      '    HORAS_OPERARIO_PRE,'
      '    HORAS_MAQUINA_PRE,'
      '    DIF_HORAS_MAQUINA,'
      '    DIF_HORAS_OPERARIO,'
      '    RECUPERADO_MARCAJE,'
      '    UNI_FABRICADAS,'
      '    PLANIFICACION,'
      '    LINEA_PLANIFICACION,'
      '    ID_PLANIFICACION,'
      '    ID_PLANIFICACION_DET,'
      '    ID_UBICACION,'
      '    ID_MOV_STOCK_RESERVA,'
      '    UNIDAD,'
      '    COSTE_MERMA_PRE,'
      '    COSTE_MERMA_REAL,'
      '    DIF_COSTE_MERMA,'
      '    COPIAS_PMP,'
      '    VERSION_ORDEN/*,'
      '    ID_LOTE,'
      '    DESC_LOTE,'
      '    RESERVA,'
      '    CANT_RESERVAR,'
      '    ESTADO_RESERVA*/'
      'FROM VER_PRO_ORD'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'SERIES = :SERIE AND'
      '((EJERCICIO = :EJERCICIO) OR (EJERCICIO < :EJERCICIO))'
      'ORDER BY ID_ORDEN, FECHA_ORD')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PRO_ORD'
      'SET'
      '  FECHA_ORD=?FECHA_ORD '
      '  ,FECHA_PED=?FECHA_PED '
      '  ,UNI_PEDID=?UNI_PEDID '
      '  ,UNI_MANUAL=?UNI_MANUAL '
      '  ,UNI_TOTAL=?UNI_TOTAL '
      '  ,UNI_PRODUC=?UNI_PRODUC '
      '  ,UNI_PENDIENTES=?UNI_PENDIENTES '
      '  ,FECHA_ENTREGA=?FECHA_ENTREGA '
      '  ,OBSERVACIONES=?OBSERVACIONES '
      '  ,MARGEN_UNI_CIEN=?MARGEN_UNI_CIEN '
      '  ,COSTE_COMPRAS=?COSTE_COMPRAS '
      '  ,HORAS_OPERARIO=?HORAS_OPERARIO '
      '  ,HORAS_MAQUINA=?HORAS_MAQUINA '
      '  ,MEDIDA_1=?MEDIDA_1 '
      '  ,MEDIDA_2=?MEDIDA_2 '
      '  ,MEDIDA_3=?MEDIDA_3 '
      '  ,MEDIDA_4=?MEDIDA_4 '
      '  ,FECHA_INI=?FECHA_INI '
      '  ,FECHA_FIN=?FECHA_FIN '
      '  ,COSTE_FIJO_PRE=?COSTE_FIJO_PRE '
      '  ,COSTE_VAR_PRE=?COSTE_VAR_PRE '
      '  ,COSTE_MAT_PRE=?COSTE_MAT_PRE '
      '  ,COSTE_MO_PRE=?COSTE_MO_PRE '
      '  ,COSTE_MAQ_PRE=?COSTE_MAQ_PRE '
      '  ,COSTE_TEX_PRE=?COSTE_TEX_PRE '
      '  ,COSTE_TOT_PRE=?COSTE_TOT_PRE '
      '  ,COSTE_FIJO_REAL=?COSTE_FIJO_REAL '
      '  ,COSTE_VAR_REAL=?COSTE_VAR_REAL '
      '  ,COSTE_MAT_REAL=?COSTE_MAT_REAL '
      '  ,COSTE_MO_REAL=?COSTE_MO_REAL '
      '  ,COSTE_MAQ_REAL=?COSTE_MAQ_REAL '
      '  ,COSTE_TEX_REAL=?COSTE_TEX_REAL '
      '  ,COSTE_TOT_REAL=?COSTE_TOT_REAL '
      '  ,COSTE_UNITARIO=?COSTE_UNITARIO '
      '  ,PRECIO_VENTA=?PRECIO_VENTA '
      '  ,HORAS_TOTALES=?HORAS_TOTALES '
      '  ,MARGEN_UNI=?MARGEN_UNI '
      '  ,MARGEN_TOTAL=?MARGEN_TOTAL '
      '  ,COSTE_COMPRAS_PRE=?COSTE_COMPRAS_PRE '
      '  ,MARGEN_TOTAL_PRE=?MARGEN_TOTAL_PRE '
      '  ,MARGEN_UNI_CIEN_PRE=?MARGEN_UNI_CIEN_PRE '
      '  ,COSTE_UNITARIO_PRE=?COSTE_UNITARIO_PRE '
      '  ,MARGEN_UNI_PRE=?MARGEN_UNI_PRE '
      '  ,PRECIO_VENTA_PRE=?PRECIO_VENTA_PRE '
      '  ,PRECIO_VENTA_TOT_PRE=?PRECIO_VENTA_TOT_PRE '
      '  ,PRECIO_VENTA_TOT_REAL=?PRECIO_VENTA_TOT_REAL '
      '  ,HORAS_OPERARIO_PRE=?HORAS_OPERARIO_PRE '
      '  ,HORAS_MAQUINA_PRE=?HORAS_MAQUINA_PRE '
      '  ,UNI_FABRICADAS=?UNI_FABRICADAS '
      '  ,COSTE_MERMA_PRE=?COSTE_MERMA_PRE '
      '  ,COSTE_MERMA_REAL=?COSTE_MERMA_REAL '
      '  ,DIF_COSTE_MERMA=?DIF_COSTE_MERMA '
      '  ,SUBORDEN=?SUBORDEN '
      '  ,CLIENTE=?CLIENTE '
      '  ,ESCANDALLO=?ESCANDALLO '
      '  ,PEDIDO=?PEDIDO '
      '  ,MERMA=?MERMA '
      '  ,ENTRADA=?ENTRADA '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,ID_ORDEN_MAT=?ID_ORDEN_MAT '
      '  ,ID_MOV_STOCK=?ID_MOV_STOCK '
      '  ,ISO_APROBADO=?ISO_APROBADO '
      '  ,ISO_VERIFICADO=?ISO_VERIFICADO '
      '  ,ISO_VALIDADO=?ISO_VALIDADO '
      '  ,ID_A=?ID_A '
      '  ,PADRE_SUBORDEN=?PADRE_SUBORDEN '
      '  ,CONT_SUBORDEN=?CONT_SUBORDEN '
      '  ,ID_DESPIECE=?ID_DESPIECE '
      '  ,ID_ORDEN_SUBORDEN=?ID_ORDEN_SUBORDEN '
      '  ,RESPONSABLE=?RESPONSABLE '
      '  ,PLANIFICACION=?PLANIFICACION '
      '  ,LINEA_PLANIFICACION=?LINEA_PLANIFICACION '
      '  ,ID_PLANIFICACION=?ID_PLANIFICACION '
      '  ,ID_PLANIFICACION_DET=?ID_PLANIFICACION_DET '
      '  ,ID_UBICACION=?ID_UBICACION '
      '  ,ID_MOV_STOCK_RESERVA=?ID_MOV_STOCK_RESERVA '
      '  ,UNIDAD=?UNIDAD '
      '  ,COPIAS_PMP=?COPIAS_PMP '
      '  ,TITULO=?TITULO '
      '  ,ESTADO=?ESTADO '
      '  ,LINEA_PED=?LINEA_PED '
      '  ,PRIORIDAD=?PRIORIDAD '
      '  ,VISTOBUENO1=?VISTOBUENO1 '
      '  ,VISTOBUENO2=?VISTOBUENO2 '
      '  ,VISTOBUENO3=?VISTOBUENO3 '
      '  ,SITUACION=?SITUACION '
      '  ,TIPO_LANZAMIENTO=?TIPO_LANZAMIENTO '
      '  ,TIPO_RESERVA=?TIPO_RESERVA '
      '  ,REFERENCIA=?REFERENCIA '
      '  ,SELECCIONADA=?SELECCIONADA '
      '  ,PREVALECE_ALM_ORDEN=?PREVALECE_ALM_ORDEN '
      '  ,CERRAR_SUBORDENES=?CERRAR_SUBORDENES '
      '  ,IMPORTAR_OP=?IMPORTAR_OP '
      '  ,CASO_OP=?CASO_OP '
      '  ,RESERVA_STOCK_OP=?RESERVA_STOCK_OP '
      '  ,DESACTIVA_TRIGGER=?DESACTIVA_TRIGGER '
      '  ,COMPUESTOS_VIRTUALES=?COMPUESTOS_VIRTUALES '
      '  ,SEGUIR_SIN_STOCK=?SEGUIR_SIN_STOCK '
      '  ,RECUPERADO_MARCAJE=?RECUPERADO_MARCAJE '
      '  ,ALMACEN_SAL=?ALMACEN_SAL '
      '  ,ALMACEN_LAN=?ALMACEN_LAN '
      '  ,ALMACEN_ENT=?ALMACEN_ENT '
      '  ,COMPUESTO=?COMPUESTO '
      '  ,VERSION_ORDEN=?VERSION_ORDEN '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIES=?SERIES AND '
      '  RIG_OF=?RIG_OF ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIES '
      'RIG_OF ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PRO_ORD'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 120
    object xOrdenEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xOrdenEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object xOrdenCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object xOrdenSERIES: TFIBStringField
      FieldName = 'SERIES'
      Size = 10
    end
    object xOrdenRIG_OF: TIntegerField
      FieldName = 'RIG_OF'
    end
    object xOrdenVISTOBUENO1: TIntegerField
      FieldName = 'VISTOBUENO1'
    end
    object xOrdenVISTOBUENO2: TIntegerField
      FieldName = 'VISTOBUENO2'
    end
    object xOrdenVISTOBUENO3: TIntegerField
      FieldName = 'VISTOBUENO3'
    end
    object xOrdenSITUACION: TIntegerField
      FieldName = 'SITUACION'
    end
    object xOrdenMARGEN_UNI_CIEN: TFloatField
      FieldName = 'MARGEN_UNI_CIEN'
    end
    object xOrdenENTRADA: TIntegerField
      FieldName = 'ENTRADA'
    end
    object xOrdenID_ORDEN: TIntegerField
      FieldName = 'ID_ORDEN'
    end
    object xOrdenTIPO_LANZAMIENTO: TIntegerField
      FieldName = 'TIPO_LANZAMIENTO'
    end
    object xOrdenID_ORDEN_MAT: TIntegerField
      FieldName = 'ID_ORDEN_MAT'
    end
    object xOrdenTIPO_RESERVA: TIntegerField
      FieldName = 'TIPO_RESERVA'
    end
    object xOrdenID_MOV_STOCK: TIntegerField
      FieldName = 'ID_MOV_STOCK'
    end
    object xOrdenISO_APROBADO: TIntegerField
      FieldName = 'ISO_APROBADO'
    end
    object xOrdenISO_VERIFICADO: TIntegerField
      FieldName = 'ISO_VERIFICADO'
    end
    object xOrdenISO_VALIDADO: TIntegerField
      FieldName = 'ISO_VALIDADO'
    end
    object xOrdenID_A: TIntegerField
      FieldName = 'ID_A'
    end
    object xOrdenPADRE_SUBORDEN: TIntegerField
      FieldName = 'PADRE_SUBORDEN'
    end
    object xOrdenCONT_SUBORDEN: TIntegerField
      FieldName = 'CONT_SUBORDEN'
    end
    object xOrdenREFERENCIA: TFIBStringField
      FieldName = 'REFERENCIA'
      Size = 40
    end
    object xOrdenCOSTE_COMPRAS: TFloatField
      FieldName = 'COSTE_COMPRAS'
    end
    object xOrdenHORAS_OPERARIO: TFloatField
      FieldName = 'HORAS_OPERARIO'
    end
    object xOrdenHORAS_MAQUINA: TFloatField
      FieldName = 'HORAS_MAQUINA'
    end
    object xOrdenID_DESPIECE: TIntegerField
      FieldName = 'ID_DESPIECE'
    end
    object xOrdenID_ORDEN_SUBORDEN: TIntegerField
      FieldName = 'ID_ORDEN_SUBORDEN'
    end
    object xOrdenSELECCIONADA: TIntegerField
      FieldName = 'SELECCIONADA'
    end
    object xOrdenPREVALECE_ALM_ORDEN: TIntegerField
      FieldName = 'PREVALECE_ALM_ORDEN'
    end
    object xOrdenCERRAR_SUBORDENES: TIntegerField
      FieldName = 'CERRAR_SUBORDENES'
    end
    object xOrdenIMPORTAR_OP: TIntegerField
      FieldName = 'IMPORTAR_OP'
    end
    object xOrdenCASO_OP: TIntegerField
      FieldName = 'CASO_OP'
    end
    object xOrdenRESERVA_STOCK_OP: TIntegerField
      FieldName = 'RESERVA_STOCK_OP'
    end
    object xOrdenMEDIDA_1: TFloatField
      FieldName = 'MEDIDA_1'
    end
    object xOrdenMEDIDA_2: TFloatField
      FieldName = 'MEDIDA_2'
    end
    object xOrdenMEDIDA_3: TFloatField
      FieldName = 'MEDIDA_3'
    end
    object xOrdenMEDIDA_4: TFloatField
      FieldName = 'MEDIDA_4'
    end
    object xOrdenDESACTIVA_TRIGGER: TIntegerField
      FieldName = 'DESACTIVA_TRIGGER'
    end
    object xOrdenRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
    end
    object xOrdenCOSTE_COMPRAS_PRE: TFloatField
      FieldName = 'COSTE_COMPRAS_PRE'
    end
    object xOrdenCOMPUESTOS_VIRTUALES: TIntegerField
      FieldName = 'COMPUESTOS_VIRTUALES'
    end
    object xOrdenSEGUIR_SIN_STOCK: TIntegerField
      FieldName = 'SEGUIR_SIN_STOCK'
    end
    object xOrdenMARGEN_TOTAL_PRE: TFloatField
      FieldName = 'MARGEN_TOTAL_PRE'
    end
    object xOrdenMARGEN_UNI_CIEN_PRE: TFloatField
      FieldName = 'MARGEN_UNI_CIEN_PRE'
    end
    object xOrdenCOSTE_UNITARIO_PRE: TFloatField
      FieldName = 'COSTE_UNITARIO_PRE'
    end
    object xOrdenMARGEN_UNI_PRE: TFloatField
      FieldName = 'MARGEN_UNI_PRE'
    end
    object xOrdenPRECIO_VENTA_PRE: TFloatField
      FieldName = 'PRECIO_VENTA_PRE'
    end
    object xOrdenPRECIO_VENTA_TOT_PRE: TFloatField
      FieldName = 'PRECIO_VENTA_TOT_PRE'
    end
    object xOrdenPRECIO_VENTA_TOT_REAL: TFloatField
      FieldName = 'PRECIO_VENTA_TOT_REAL'
    end
    object xOrdenHORAS_OPERARIO_PRE: TFloatField
      FieldName = 'HORAS_OPERARIO_PRE'
    end
    object xOrdenHORAS_MAQUINA_PRE: TFloatField
      FieldName = 'HORAS_MAQUINA_PRE'
    end
    object xOrdenDIF_HORAS_MAQUINA: TFloatField
      FieldName = 'DIF_HORAS_MAQUINA'
    end
    object xOrdenDIF_HORAS_OPERARIO: TFloatField
      FieldName = 'DIF_HORAS_OPERARIO'
    end
    object xOrdenRECUPERADO_MARCAJE: TIntegerField
      FieldName = 'RECUPERADO_MARCAJE'
    end
    object xOrdenUNI_FABRICADAS: TFloatField
      FieldName = 'UNI_FABRICADAS'
    end
    object xOrdenPLANIFICACION: TIntegerField
      FieldName = 'PLANIFICACION'
    end
    object xOrdenLINEA_PLANIFICACION: TIntegerField
      FieldName = 'LINEA_PLANIFICACION'
    end
    object xOrdenID_PLANIFICACION: TIntegerField
      FieldName = 'ID_PLANIFICACION'
    end
    object xOrdenID_PLANIFICACION_DET: TIntegerField
      FieldName = 'ID_PLANIFICACION_DET'
    end
    object xOrdenID_UBICACION: TIntegerField
      FieldName = 'ID_UBICACION'
    end
    object xOrdenID_MOV_STOCK_RESERVA: TIntegerField
      FieldName = 'ID_MOV_STOCK_RESERVA'
    end
    object xOrdenUNIDAD: TFIBStringField
      FieldName = 'UNIDAD'
      Size = 2
    end
    object xOrdenCOSTE_MERMA_PRE: TFloatField
      FieldName = 'COSTE_MERMA_PRE'
    end
    object xOrdenCOSTE_MERMA_REAL: TFloatField
      FieldName = 'COSTE_MERMA_REAL'
    end
    object xOrdenDIF_COSTE_MERMA: TFloatField
      FieldName = 'DIF_COSTE_MERMA'
    end
    object xOrdenCOPIAS_PMP: TIntegerField
      FieldName = 'COPIAS_PMP'
    end
    object xOrdenVERSION_ORDEN: TFIBStringField
      FieldName = 'VERSION_ORDEN'
      Size = 15
    end
  end
  object DSxOrden: TDataSource
    DataSet = xOrden
    Left = 120
    Top = 120
  end
end
