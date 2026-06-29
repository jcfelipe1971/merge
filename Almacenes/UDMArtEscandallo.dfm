object DMArtEscandallo: TDMArtEscandallo
  OldCreateOrder = False
  OnCreate = DMArt_EscandalloCreate
  Left = 526
  Top = 323
  Height = 293
  Width = 299
  object QMEscandallo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ARTICULOS_ESCANDALLO'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  DETALLE=?old_DETALLE ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ARTICULOS_ESCANDALLO'
      
        '  (P_COSTE,CANTIDAD,UNIDADES,ID_A,ID_A_DET,EMPRESA,TITULO,MARCAD' +
        'O,ARTICULO,DETALLE,FAMILIA)'
      'VALUES'
      
        '  (?P_COSTE,?CANTIDAD,?UNIDADES,?ID_A,?ID_A_DET,?EMPRESA,?TITULO' +
        ',?MARCADO,?ARTICULO,?DETALLE,?FAMILIA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ARTICULOS_ESCANDALLO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  DETALLE=?DETALLE ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_ESCANDALLO'
      'WHERE '
      'EMPRESA = :EMPRESA AND'
      'ARTICULO = :ARTICULO'
      'ORDER BY DETALLE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ARTICULOS_ESCANDALLO'
      'SET'
      '  P_COSTE=?P_COSTE '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,UNIDADES=?UNIDADES '
      '  ,ID_A=?ID_A '
      '  ,ID_A_DET=?ID_A_DET '
      '  ,TITULO=?TITULO '
      '  ,MARCADO=?MARCADO '
      '  ,FAMILIA=?FAMILIA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  DETALLE=?DETALLE ')
    DataSource = DSxArticulo
    AfterPost = QMEscandalloAfterPost
    OnNewRecord = QMEscandalloNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO '
      'DETALLE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ARTICULOS_ESCANDALLO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 72
    object QMEscandalloEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEscandalloARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMEscandalloDETALLE: TFIBStringField
      DisplayLabel = 'Detalle'
      FieldName = 'DETALLE'
      Size = 15
    end
    object QMEscandalloTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMEscandalloP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMEscandalloCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMEscandalloFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMEscandalloUNIDADES: TFIBStringField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
      Size = 2
    end
    object QMEscandalloBARRAS: TStringField
      DisplayLabel = 'Cod. Barra'
      FieldKind = fkCalculated
      FieldName = 'BARRAS'
      OnGetText = QMEscandalloBARRASGetText
      Calculated = True
    end
  end
  object DSQMEscandallo: TDataSource
    DataSet = QMEscandallo
    Left = 112
    Top = 72
  end
  object xArticulo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ARTICULOS_CUENTAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  ARTICULO=?old_ARTICULO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ARTICULOS_CUENTAS'
      
        '  (P_COSTE,UNIDADES,NOTAS,PTO_VERDE,LITROS_POR_UNIDAD,MULTIPLO_1' +
        ',MULTIPLO_2,MULTIPLO_3,MULTIPLO_4,FACTOR_ESCALA,UD_MINIMO_COMPRA' +
        ',UD_MINIMO_VENTA,PESO,VOLUMEN_UNIT,DIAMETRO_UNIT,DEFECTO_UD_SECU' +
        'NDARIA,NOTAS_COMPRAS,NOTAS_VENTAS,FECHA_BAJA,Z_LINEA,Z_SALIDA,Z_' +
        'LONA_MODELO,Z_TIPO_LACADO_FORZADO,ULT_MODIFICACION,Z_LAM_ANCHO,Z' +
        '_LAM_LARGO,COSTE_ADICIONAL,PMP,PRECIO_MERCADO,ENTRADA,CONTROLA_M' +
        'EDIDAS,DESCUENTO,DESCUENTO_2,DESCUENTO_3,ID_A_M_C_T,ID_A,ID_C_A,' +
        'IMAGEN,ID_GALERIA,FABRICANTE,TIPO_CLAVE_ADR,Z_MERMA,ID_MARCA,ID_' +
        'A_M,FORMULA_DEFECTO,ID_FAMILIA,ID_SUBFAMILIA,EMPRESA,EJERCICIO,C' +
        'ANAL,TITULO,ABIERTO,VIRTUAL,CONTROL_STOCK,TIPO_IVA,TITULO_CORTO,' +
        'DISPONIBILIDAD,ACTUALIZA_VENTA,SERIALIZADO,GARANTIA,PRODUCCION,I' +
        'VA_ESCANDALLO,PVP_POR_UD_SECUNDARIA,ALFA_1,ALFA_2,ALFA_3,BLOQUEO' +
        '_VENTAS,MOTIVO_BLOQUEO_VENTAS,ADR_PACKAGE,PREPARABLE,TIPO_IBAE,A' +
        'LFA_4,ALFA_5,ALFA_6,ALFA_7,ALFA_8,SERIALIZADO_KRI,LOTES_KRI,LOTE' +
        'S,CODIGO_INTRA,UBICABLE,NO_CALCULA_STOCKMINMAX,ANTICIPO,ANTICIPO' +
        '_CONTADO,ANTICIPO_PREG_DATOS,WEB,BAJA,MOTIVO_BAJA,CANTIDAD_LIMIT' +
        'ADA,Z_LACADO,Z_TIPO_LACADO,Z_CORTE,Z_QUITAR_SI_HAY_MOTOR,Z_PREPA' +
        'RABLE,Z_FORZAR_LACADO_SN,COMPONENTE_MOTOR,Z_LAM_COLOR,EXPORTAR,Z' +
        '_QUITAR_SI_ES_MANUAL,TITULO_MARCA,BLOQUEO_COMPRAS,MOTIVO_BLOQUEO' +
        '_COMPRAS,TIPO_IMPUESTO_ADICIONAL,GENERAR_PEDIDO_COMPRA_SIEMPRE,A' +
        'RTICULO,FAMILIA,SUBFAMILIA,PAIS,CTA_COMPRAS,CTA_VENTAS,CTA_DEVOL' +
        'UCION_COMPRAS,CTA_DEVOLUCION_VENTAS,CTA_ABONO_COMPRAS,CTA_ABONO_' +
        'VENTAS,TIPO_ARTICULO,TIPO_REGISTRO_FITOSANITARIO,Z_RIBETE_DEFECT' +
        'O,Z_LON_COLOR_1,Z_LON_COLOR_2,Z_LON_COLOR_3,CRC_NOTAS,CRC_NOTAS_' +
        'COMPRAS,CRC_NOTAS_VENTAS,TIPO_ARTICULO_TYC,Z_MODELO,Z_ARMAZON,Z_' +
        'LONA,Z_LONA_TIPO,Z_LONA_FORMA,Z_LONA_CONFECCION,Z_SUSTITUTO,Z_KI' +
        'T_TIPO,SUBTIPO_ARTICULO_TYC,MARCA,COD_COLOR_HILO,SECCION)'
      'VALUES'
      
        '  (?P_COSTE,?UNIDADES,?NOTAS,?PTO_VERDE,?LITROS_POR_UNIDAD,?MULT' +
        'IPLO_1,?MULTIPLO_2,?MULTIPLO_3,?MULTIPLO_4,?FACTOR_ESCALA,?UD_MI' +
        'NIMO_COMPRA,?UD_MINIMO_VENTA,?PESO,?VOLUMEN_UNIT,?DIAMETRO_UNIT,' +
        '?DEFECTO_UD_SECUNDARIA,?NOTAS_COMPRAS,?NOTAS_VENTAS,?FECHA_BAJA,' +
        '?Z_LINEA,?Z_SALIDA,?Z_LONA_MODELO,?Z_TIPO_LACADO_FORZADO,?ULT_MO' +
        'DIFICACION,?Z_LAM_ANCHO,?Z_LAM_LARGO,?COSTE_ADICIONAL,?PMP,?PREC' +
        'IO_MERCADO,?ENTRADA,?CONTROLA_MEDIDAS,?DESCUENTO,?DESCUENTO_2,?D' +
        'ESCUENTO_3,?ID_A_M_C_T,?ID_A,?ID_C_A,?IMAGEN,?ID_GALERIA,?FABRIC' +
        'ANTE,?TIPO_CLAVE_ADR,?Z_MERMA,?ID_MARCA,?ID_A_M,?FORMULA_DEFECTO' +
        ',?ID_FAMILIA,?ID_SUBFAMILIA,?EMPRESA,?EJERCICIO,?CANAL,?TITULO,?' +
        'ABIERTO,?VIRTUAL,?CONTROL_STOCK,?TIPO_IVA,?TITULO_CORTO,?DISPONI' +
        'BILIDAD,?ACTUALIZA_VENTA,?SERIALIZADO,?GARANTIA,?PRODUCCION,?IVA' +
        '_ESCANDALLO,?PVP_POR_UD_SECUNDARIA,?ALFA_1,?ALFA_2,?ALFA_3,?BLOQ' +
        'UEO_VENTAS,?MOTIVO_BLOQUEO_VENTAS,?ADR_PACKAGE,?PREPARABLE,?TIPO' +
        '_IBAE,?ALFA_4,?ALFA_5,?ALFA_6,?ALFA_7,?ALFA_8,?SERIALIZADO_KRI,?' +
        'LOTES_KRI,?LOTES,?CODIGO_INTRA,?UBICABLE,?NO_CALCULA_STOCKMINMAX' +
        ',?ANTICIPO,?ANTICIPO_CONTADO,?ANTICIPO_PREG_DATOS,?WEB,?BAJA,?MO' +
        'TIVO_BAJA,?CANTIDAD_LIMITADA,?Z_LACADO,?Z_TIPO_LACADO,?Z_CORTE,?' +
        'Z_QUITAR_SI_HAY_MOTOR,?Z_PREPARABLE,?Z_FORZAR_LACADO_SN,?COMPONE' +
        'NTE_MOTOR,?Z_LAM_COLOR,?EXPORTAR,?Z_QUITAR_SI_ES_MANUAL,?TITULO_' +
        'MARCA,?BLOQUEO_COMPRAS,?MOTIVO_BLOQUEO_COMPRAS,?TIPO_IMPUESTO_AD' +
        'ICIONAL,?GENERAR_PEDIDO_COMPRA_SIEMPRE,?ARTICULO,?FAMILIA,?SUBFA' +
        'MILIA,?PAIS,?CTA_COMPRAS,?CTA_VENTAS,?CTA_DEVOLUCION_COMPRAS,?CT' +
        'A_DEVOLUCION_VENTAS,?CTA_ABONO_COMPRAS,?CTA_ABONO_VENTAS,?TIPO_A' +
        'RTICULO,?TIPO_REGISTRO_FITOSANITARIO,?Z_RIBETE_DEFECTO,?Z_LON_CO' +
        'LOR_1,?Z_LON_COLOR_2,?Z_LON_COLOR_3,?CRC_NOTAS,?CRC_NOTAS_COMPRA' +
        'S,?CRC_NOTAS_VENTAS,?TIPO_ARTICULO_TYC,?Z_MODELO,?Z_ARMAZON,?Z_L' +
        'ONA,?Z_LONA_TIPO,?Z_LONA_FORMA,?Z_LONA_CONFECCION,?Z_SUSTITUTO,?' +
        'Z_KIT_TIPO,?SUBTIPO_ARTICULO_TYC,?MARCA,?COD_COLOR_HILO,?SECCION' +
        ')')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ARTICULOS_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_ARTICULOS_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND '
      'CANAL = :CANAL '
      'ORDER BY ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ARTICULOS_CUENTAS'
      'SET'
      '  P_COSTE=?P_COSTE '
      '  ,UNIDADES=?UNIDADES '
      '  ,NOTAS=?NOTAS '
      '  ,PTO_VERDE=?PTO_VERDE '
      '  ,LITROS_POR_UNIDAD=?LITROS_POR_UNIDAD '
      '  ,MULTIPLO_1=?MULTIPLO_1 '
      '  ,MULTIPLO_2=?MULTIPLO_2 '
      '  ,MULTIPLO_3=?MULTIPLO_3 '
      '  ,MULTIPLO_4=?MULTIPLO_4 '
      '  ,FACTOR_ESCALA=?FACTOR_ESCALA '
      '  ,UD_MINIMO_COMPRA=?UD_MINIMO_COMPRA '
      '  ,UD_MINIMO_VENTA=?UD_MINIMO_VENTA '
      '  ,PESO=?PESO '
      '  ,VOLUMEN_UNIT=?VOLUMEN_UNIT '
      '  ,DIAMETRO_UNIT=?DIAMETRO_UNIT '
      '  ,DEFECTO_UD_SECUNDARIA=?DEFECTO_UD_SECUNDARIA '
      '  ,NOTAS_COMPRAS=?NOTAS_COMPRAS '
      '  ,NOTAS_VENTAS=?NOTAS_VENTAS '
      '  ,FECHA_BAJA=?FECHA_BAJA '
      '  ,Z_LINEA=?Z_LINEA '
      '  ,Z_SALIDA=?Z_SALIDA '
      '  ,Z_LONA_MODELO=?Z_LONA_MODELO '
      '  ,Z_TIPO_LACADO_FORZADO=?Z_TIPO_LACADO_FORZADO '
      '  ,ULT_MODIFICACION=?ULT_MODIFICACION '
      '  ,Z_LAM_ANCHO=?Z_LAM_ANCHO '
      '  ,Z_LAM_LARGO=?Z_LAM_LARGO '
      '  ,COSTE_ADICIONAL=?COSTE_ADICIONAL '
      '  ,PMP=?PMP '
      '  ,PRECIO_MERCADO=?PRECIO_MERCADO '
      '  ,ENTRADA=?ENTRADA '
      '  ,CONTROLA_MEDIDAS=?CONTROLA_MEDIDAS '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,DESCUENTO_2=?DESCUENTO_2 '
      '  ,DESCUENTO_3=?DESCUENTO_3 '
      '  ,ID_A_M_C_T=?ID_A_M_C_T '
      '  ,ID_A=?ID_A '
      '  ,ID_C_A=?ID_C_A '
      '  ,IMAGEN=?IMAGEN '
      '  ,ID_GALERIA=?ID_GALERIA '
      '  ,FABRICANTE=?FABRICANTE '
      '  ,TIPO_CLAVE_ADR=?TIPO_CLAVE_ADR '
      '  ,Z_MERMA=?Z_MERMA '
      '  ,ID_MARCA=?ID_MARCA '
      '  ,ID_A_M=?ID_A_M '
      '  ,FORMULA_DEFECTO=?FORMULA_DEFECTO '
      '  ,ID_FAMILIA=?ID_FAMILIA '
      '  ,ID_SUBFAMILIA=?ID_SUBFAMILIA '
      '  ,TITULO=?TITULO '
      '  ,ABIERTO=?ABIERTO '
      '  ,VIRTUAL=?VIRTUAL '
      '  ,CONTROL_STOCK=?CONTROL_STOCK '
      '  ,TIPO_IVA=?TIPO_IVA '
      '  ,TITULO_CORTO=?TITULO_CORTO '
      '  ,DISPONIBILIDAD=?DISPONIBILIDAD '
      '  ,ACTUALIZA_VENTA=?ACTUALIZA_VENTA '
      '  ,SERIALIZADO=?SERIALIZADO '
      '  ,GARANTIA=?GARANTIA '
      '  ,PRODUCCION=?PRODUCCION '
      '  ,IVA_ESCANDALLO=?IVA_ESCANDALLO '
      '  ,PVP_POR_UD_SECUNDARIA=?PVP_POR_UD_SECUNDARIA '
      '  ,ALFA_1=?ALFA_1 '
      '  ,ALFA_2=?ALFA_2 '
      '  ,ALFA_3=?ALFA_3 '
      '  ,BLOQUEO_VENTAS=?BLOQUEO_VENTAS '
      '  ,MOTIVO_BLOQUEO_VENTAS=?MOTIVO_BLOQUEO_VENTAS '
      '  ,ADR_PACKAGE=?ADR_PACKAGE '
      '  ,PREPARABLE=?PREPARABLE '
      '  ,TIPO_IBAE=?TIPO_IBAE '
      '  ,ALFA_4=?ALFA_4 '
      '  ,ALFA_5=?ALFA_5 '
      '  ,ALFA_6=?ALFA_6 '
      '  ,ALFA_7=?ALFA_7 '
      '  ,ALFA_8=?ALFA_8 '
      '  ,SERIALIZADO_KRI=?SERIALIZADO_KRI '
      '  ,LOTES_KRI=?LOTES_KRI '
      '  ,LOTES=?LOTES '
      '  ,CODIGO_INTRA=?CODIGO_INTRA '
      '  ,UBICABLE=?UBICABLE '
      '  ,NO_CALCULA_STOCKMINMAX=?NO_CALCULA_STOCKMINMAX '
      '  ,ANTICIPO=?ANTICIPO '
      '  ,ANTICIPO_CONTADO=?ANTICIPO_CONTADO '
      '  ,ANTICIPO_PREG_DATOS=?ANTICIPO_PREG_DATOS '
      '  ,WEB=?WEB '
      '  ,BAJA=?BAJA '
      '  ,MOTIVO_BAJA=?MOTIVO_BAJA '
      '  ,CANTIDAD_LIMITADA=?CANTIDAD_LIMITADA '
      '  ,Z_LACADO=?Z_LACADO '
      '  ,Z_TIPO_LACADO=?Z_TIPO_LACADO '
      '  ,Z_CORTE=?Z_CORTE '
      '  ,Z_QUITAR_SI_HAY_MOTOR=?Z_QUITAR_SI_HAY_MOTOR '
      '  ,Z_PREPARABLE=?Z_PREPARABLE '
      '  ,Z_FORZAR_LACADO_SN=?Z_FORZAR_LACADO_SN '
      '  ,COMPONENTE_MOTOR=?COMPONENTE_MOTOR '
      '  ,Z_LAM_COLOR=?Z_LAM_COLOR '
      '  ,EXPORTAR=?EXPORTAR '
      '  ,Z_QUITAR_SI_ES_MANUAL=?Z_QUITAR_SI_ES_MANUAL '
      '  ,TITULO_MARCA=?TITULO_MARCA '
      '  ,BLOQUEO_COMPRAS=?BLOQUEO_COMPRAS '
      '  ,MOTIVO_BLOQUEO_COMPRAS=?MOTIVO_BLOQUEO_COMPRAS '
      '  ,TIPO_IMPUESTO_ADICIONAL=?TIPO_IMPUESTO_ADICIONAL '
      '  ,GENERAR_PEDIDO_COMPRA_SIEMPRE=?GENERAR_PEDIDO_COMPRA_SIEMPRE '
      '  ,FAMILIA=?FAMILIA '
      '  ,SUBFAMILIA=?SUBFAMILIA '
      '  ,PAIS=?PAIS '
      '  ,CTA_COMPRAS=?CTA_COMPRAS '
      '  ,CTA_VENTAS=?CTA_VENTAS '
      '  ,CTA_DEVOLUCION_COMPRAS=?CTA_DEVOLUCION_COMPRAS '
      '  ,CTA_DEVOLUCION_VENTAS=?CTA_DEVOLUCION_VENTAS '
      '  ,CTA_ABONO_COMPRAS=?CTA_ABONO_COMPRAS '
      '  ,CTA_ABONO_VENTAS=?CTA_ABONO_VENTAS '
      '  ,TIPO_ARTICULO=?TIPO_ARTICULO '
      '  ,TIPO_REGISTRO_FITOSANITARIO=?TIPO_REGISTRO_FITOSANITARIO '
      '  ,Z_RIBETE_DEFECTO=?Z_RIBETE_DEFECTO '
      '  ,Z_LON_COLOR_1=?Z_LON_COLOR_1 '
      '  ,Z_LON_COLOR_2=?Z_LON_COLOR_2 '
      '  ,Z_LON_COLOR_3=?Z_LON_COLOR_3 '
      '  ,CRC_NOTAS=?CRC_NOTAS '
      '  ,CRC_NOTAS_COMPRAS=?CRC_NOTAS_COMPRAS '
      '  ,CRC_NOTAS_VENTAS=?CRC_NOTAS_VENTAS '
      '  ,TIPO_ARTICULO_TYC=?TIPO_ARTICULO_TYC '
      '  ,Z_MODELO=?Z_MODELO '
      '  ,Z_ARMAZON=?Z_ARMAZON '
      '  ,Z_LONA=?Z_LONA '
      '  ,Z_LONA_TIPO=?Z_LONA_TIPO '
      '  ,Z_LONA_FORMA=?Z_LONA_FORMA '
      '  ,Z_LONA_CONFECCION=?Z_LONA_CONFECCION '
      '  ,Z_SUSTITUTO=?Z_SUSTITUTO '
      '  ,Z_KIT_TIPO=?Z_KIT_TIPO '
      '  ,SUBTIPO_ARTICULO_TYC=?SUBTIPO_ARTICULO_TYC '
      '  ,MARCA=?MARCA '
      '  ,COD_COLOR_HILO=?COD_COLOR_HILO '
      '  ,SECCION=?SECCION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  ARTICULO=?ARTICULO ')
    AfterOpen = xArticuloAfterOpen
    BeforeClose = xArticuloBeforeClose
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'ARTICULO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ARTICULOS_CUENTAS'
    UpdateTransaction = TLocal
    Left = 32
    Top = 24
    object xArticuloEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xArticuloEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xArticuloCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xArticuloARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArticuloTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xArticuloID_FAMILIA: TIntegerField
      DisplayLabel = 'Id Familia'
      FieldName = 'ID_FAMILIA'
    end
    object xArticuloFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xArticuloID_SUBFAMILIA: TIntegerField
      DisplayLabel = 'Id Subfamilia'
      FieldName = 'ID_SUBFAMILIA'
    end
    object xArticuloSUBFAMILIA: TFIBStringField
      DisplayLabel = 'Subfamilia'
      FieldName = 'SUBFAMILIA'
      Size = 5
    end
    object xArticuloP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xArticuloABIERTO: TIntegerField
      DisplayLabel = 'Abierto'
      FieldName = 'ABIERTO'
    end
    object xArticuloVIRTUAL: TIntegerField
      DisplayLabel = 'Virtual'
      FieldName = 'VIRTUAL'
    end
    object xArticuloCONTROL_STOCK: TIntegerField
      DisplayLabel = 'Control Stock'
      FieldName = 'CONTROL_STOCK'
    end
    object xArticuloPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xArticuloTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object xArticuloCTA_COMPRAS: TFIBStringField
      FieldName = 'CTA_COMPRAS'
      Size = 15
    end
    object xArticuloCTA_VENTAS: TFIBStringField
      FieldName = 'CTA_VENTAS'
      Size = 15
    end
    object xArticuloCTA_DEVOLUCION_COMPRAS: TFIBStringField
      FieldName = 'CTA_DEVOLUCION_COMPRAS'
      Size = 15
    end
    object xArticuloCTA_DEVOLUCION_VENTAS: TFIBStringField
      FieldName = 'CTA_DEVOLUCION_VENTAS'
      Size = 15
    end
    object xArticuloCTA_ABONO_COMPRAS: TFIBStringField
      FieldName = 'CTA_ABONO_COMPRAS'
      Size = 15
    end
    object xArticuloCTA_ABONO_VENTAS: TFIBStringField
      FieldName = 'CTA_ABONO_VENTAS'
      Size = 15
    end
    object xArticuloENTRADA: TIntegerField
      FieldName = 'ENTRADA'
    end
    object xArticuloUNIDADES: TFIBStringField
      FieldName = 'UNIDADES'
      Size = 2
    end
    object xArticuloTITULO_CORTO: TFIBStringField
      DisplayLabel = 'Titulo Corto'
      FieldName = 'TITULO_CORTO'
    end
    object xArticuloNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object xArticuloDISPONIBILIDAD: TIntegerField
      FieldName = 'DISPONIBILIDAD'
    end
    object xArticuloACTUALIZA_VENTA: TIntegerField
      FieldName = 'ACTUALIZA_VENTA'
    end
    object xArticuloPTO_VERDE: TFloatField
      FieldName = 'PTO_VERDE'
    end
    object xArticuloCONTROLA_MEDIDAS: TIntegerField
      FieldName = 'CONTROLA_MEDIDAS'
    end
    object xArticuloSERIALIZADO: TIntegerField
      FieldName = 'SERIALIZADO'
    end
    object xArticuloGARANTIA: TIntegerField
      FieldName = 'GARANTIA'
    end
    object xArticuloPRODUCCION: TIntegerField
      FieldName = 'PRODUCCION'
    end
    object xArticuloDESCUENTO: TFloatField
      FieldName = 'DESCUENTO'
    end
    object xArticuloDESCUENTO_2: TFloatField
      FieldName = 'DESCUENTO_2'
    end
    object xArticuloDESCUENTO_3: TFloatField
      FieldName = 'DESCUENTO_3'
    end
    object xArticuloIVA_ESCANDALLO: TIntegerField
      FieldName = 'IVA_ESCANDALLO'
    end
    object xArticuloPVP_POR_UD_SECUNDARIA: TIntegerField
      FieldName = 'PVP_POR_UD_SECUNDARIA'
    end
    object xArticuloALFA_1: TFIBStringField
      FieldName = 'ALFA_1'
      Size = 40
    end
    object xArticuloALFA_2: TFIBStringField
      FieldName = 'ALFA_2'
      Size = 40
    end
    object xArticuloALFA_3: TFIBStringField
      FieldName = 'ALFA_3'
      Size = 40
    end
    object xArticuloALFA_4: TFIBStringField
      FieldName = 'ALFA_4'
      Size = 40
    end
    object xArticuloALFA_5: TFIBStringField
      FieldName = 'ALFA_5'
      Size = 40
    end
    object xArticuloALFA_6: TFIBStringField
      FieldName = 'ALFA_6'
      Size = 40
    end
    object xArticuloALFA_7: TFIBStringField
      FieldName = 'ALFA_7'
      Size = 40
    end
    object xArticuloALFA_8: TFIBStringField
      FieldName = 'ALFA_8'
      Size = 40
    end
    object xArticuloSERIALIZADO_KRI: TIntegerField
      FieldName = 'SERIALIZADO_KRI'
    end
    object xArticuloLOTES_KRI: TIntegerField
      FieldName = 'LOTES_KRI'
    end
    object xArticuloLOTES: TIntegerField
      FieldName = 'LOTES'
    end
    object xArticuloMULTIPLO_1: TFloatField
      FieldName = 'MULTIPLO_1'
    end
    object xArticuloMULTIPLO_2: TFloatField
      FieldName = 'MULTIPLO_2'
    end
    object xArticuloMULTIPLO_3: TFloatField
      FieldName = 'MULTIPLO_3'
    end
    object xArticuloMULTIPLO_4: TFloatField
      FieldName = 'MULTIPLO_4'
    end
    object xArticuloFACTOR_ESCALA: TFloatField
      FieldName = 'FACTOR_ESCALA'
    end
    object xArticuloUD_MINIMO_COMPRA: TFloatField
      FieldName = 'UD_MINIMO_COMPRA'
    end
    object xArticuloUD_MINIMO_VENTA: TFloatField
      FieldName = 'UD_MINIMO_VENTA'
    end
    object xArticuloID_A_M_C_T: TIntegerField
      FieldName = 'ID_A_M_C_T'
    end
    object xArticuloID_A: TIntegerField
      FieldName = 'ID_A'
    end
    object xArticuloID_C_A: TIntegerField
      FieldName = 'ID_C_A'
    end
    object xArticuloIMAGEN: TIntegerField
      FieldName = 'IMAGEN'
    end
    object xArticuloID_GALERIA: TIntegerField
      FieldName = 'ID_GALERIA'
    end
    object xArticuloCODIGO_INTRA: TFIBStringField
      FieldName = 'CODIGO_INTRA'
      Size = 10
    end
    object xArticuloPESO: TFloatField
      FieldName = 'PESO'
    end
    object xArticuloUBICABLE: TIntegerField
      FieldName = 'UBICABLE'
    end
    object xArticuloVOLUMEN_UNIT: TFloatField
      FieldName = 'VOLUMEN_UNIT'
    end
    object xArticuloDIAMETRO_UNIT: TFloatField
      FieldName = 'DIAMETRO_UNIT'
    end
    object xArticuloDEFECTO_UD_SECUNDARIA: TFloatField
      FieldName = 'DEFECTO_UD_SECUNDARIA'
    end
    object xArticuloNOTAS_COMPRAS: TMemoField
      FieldName = 'NOTAS_COMPRAS'
      BlobType = ftMemo
      Size = 8
    end
    object xArticuloNOTAS_VENTAS: TMemoField
      FieldName = 'NOTAS_VENTAS'
      BlobType = ftMemo
      Size = 8
    end
    object xArticuloNO_CALCULA_STOCKMINMAX: TIntegerField
      FieldName = 'NO_CALCULA_STOCKMINMAX'
    end
    object xArticuloCRC_NOTAS: TFIBStringField
      FieldName = 'CRC_NOTAS'
      Size = 15
    end
    object xArticuloCRC_NOTAS_COMPRAS: TFIBStringField
      FieldName = 'CRC_NOTAS_COMPRAS'
      Size = 15
    end
    object xArticuloCRC_NOTAS_VENTAS: TFIBStringField
      FieldName = 'CRC_NOTAS_VENTAS'
      Size = 15
    end
    object xArticuloANTICIPO: TIntegerField
      FieldName = 'ANTICIPO'
    end
    object xArticuloANTICIPO_CONTADO: TIntegerField
      FieldName = 'ANTICIPO_CONTADO'
    end
    object xArticuloANTICIPO_PREG_DATOS: TIntegerField
      FieldName = 'ANTICIPO_PREG_DATOS'
    end
    object xArticuloWEB: TIntegerField
      FieldName = 'WEB'
    end
    object xArticuloFABRICANTE: TIntegerField
      FieldName = 'FABRICANTE'
    end
    object xArticuloBAJA: TIntegerField
      FieldName = 'BAJA'
    end
    object xArticuloFECHA_BAJA: TDateTimeField
      FieldName = 'FECHA_BAJA'
    end
    object xArticuloMOTIVO_BAJA: TFIBStringField
      FieldName = 'MOTIVO_BAJA'
      Size = 60
    end
    object xArticuloTIPO_CLAVE_ADR: TIntegerField
      FieldName = 'TIPO_CLAVE_ADR'
    end
    object xArticuloCANTIDAD_LIMITADA: TIntegerField
      FieldName = 'CANTIDAD_LIMITADA'
    end
    object xArticuloTIPO_ARTICULO_TYC: TFIBStringField
      DisplayWidth = 3
      FieldName = 'TIPO_ARTICULO_TYC'
      Size = 3
    end
    object xArticuloZ_MODELO: TFIBStringField
      FieldName = 'Z_MODELO'
      Size = 5
    end
    object xArticuloZ_LINEA: TFloatField
      FieldName = 'Z_LINEA'
    end
    object xArticuloZ_SALIDA: TFloatField
      FieldName = 'Z_SALIDA'
    end
    object xArticuloZ_ARMAZON: TFIBStringField
      FieldName = 'Z_ARMAZON'
      Size = 15
    end
    object xArticuloZ_LONA: TFIBStringField
      FieldName = 'Z_LONA'
      Size = 15
    end
    object xArticuloZ_LONA_TIPO: TFIBStringField
      FieldName = 'Z_LONA_TIPO'
      Size = 3
    end
    object xArticuloZ_LONA_FORMA: TFIBStringField
      FieldName = 'Z_LONA_FORMA'
      Size = 3
    end
    object xArticuloZ_LONA_MODELO: TFIBStringField
      FieldName = 'Z_LONA_MODELO'
      Size = 10
    end
    object xArticuloZ_LONA_CONFECCION: TFIBStringField
      FieldName = 'Z_LONA_CONFECCION'
      Size = 3
    end
    object xArticuloZ_LACADO: TIntegerField
      FieldName = 'Z_LACADO'
    end
    object xArticuloZ_TIPO_LACADO: TFIBStringField
      FieldName = 'Z_TIPO_LACADO'
      Size = 2
    end
    object xArticuloZ_CORTE: TIntegerField
      FieldName = 'Z_CORTE'
    end
    object xArticuloZ_QUITAR_SI_HAY_MOTOR: TIntegerField
      FieldName = 'Z_QUITAR_SI_HAY_MOTOR'
    end
    object xArticuloZ_SUSTITUTO: TFIBStringField
      FieldName = 'Z_SUSTITUTO'
      Size = 15
    end
    object xArticuloZ_KIT_TIPO: TFIBStringField
      FieldName = 'Z_KIT_TIPO'
      Size = 3
    end
    object xArticuloZ_PREPARABLE: TIntegerField
      FieldName = 'Z_PREPARABLE'
    end
    object xArticuloZ_MERMA: TFloatField
      FieldName = 'Z_MERMA'
    end
    object xArticuloZ_FORZAR_LACADO_SN: TIntegerField
      FieldName = 'Z_FORZAR_LACADO_SN'
    end
    object xArticuloZ_TIPO_LACADO_FORZADO: TFIBStringField
      FieldName = 'Z_TIPO_LACADO_FORZADO'
      Size = 2
    end
    object xArticuloCOMPONENTE_MOTOR: TIntegerField
      FieldName = 'COMPONENTE_MOTOR'
    end
    object xArticuloULT_MODIFICACION: TDateTimeField
      FieldName = 'ULT_MODIFICACION'
    end
    object xArticuloZ_LAM_ANCHO: TFloatField
      FieldName = 'Z_LAM_ANCHO'
    end
    object xArticuloZ_LAM_LARGO: TFloatField
      FieldName = 'Z_LAM_LARGO'
    end
    object xArticuloZ_LAM_COLOR: TFIBStringField
      FieldName = 'Z_LAM_COLOR'
      Size = 2
    end
    object xArticuloSUBTIPO_ARTICULO_TYC: TFIBStringField
      DisplayWidth = 3
      FieldName = 'SUBTIPO_ARTICULO_TYC'
      Size = 3
    end
    object xArticuloEXPORTAR: TIntegerField
      FieldName = 'EXPORTAR'
    end
    object xArticuloCOSTE_ADICIONAL: TFloatField
      FieldName = 'COSTE_ADICIONAL'
    end
    object xArticuloZ_QUITAR_SI_ES_MANUAL: TIntegerField
      FieldName = 'Z_QUITAR_SI_ES_MANUAL'
    end
    object xArticuloID_MARCA: TIntegerField
      FieldName = 'ID_MARCA'
    end
    object xArticuloMARCA: TFIBStringField
      FieldName = 'MARCA'
      Size = 5
    end
    object xArticuloTITULO_MARCA: TFIBStringField
      FieldName = 'TITULO_MARCA'
      Size = 60
    end
    object xArticuloPMP: TFloatField
      FieldName = 'PMP'
    end
    object xArticuloPRECIO_MERCADO: TFloatField
      FieldName = 'PRECIO_MERCADO'
    end
    object xArticuloCOD_COLOR_HILO: TFIBStringField
      FieldName = 'COD_COLOR_HILO'
      Size = 3
    end
    object xArticuloID_A_M: TIntegerField
      FieldName = 'ID_A_M'
    end
    object xArticuloBLOQUEO_COMPRAS: TIntegerField
      FieldName = 'BLOQUEO_COMPRAS'
    end
    object xArticuloMOTIVO_BLOQUEO_COMPRAS: TFIBStringField
      FieldName = 'MOTIVO_BLOQUEO_COMPRAS'
      Size = 40
    end
    object xArticuloBLOQUEO_VENTAS: TIntegerField
      FieldName = 'BLOQUEO_VENTAS'
    end
    object xArticuloMOTIVO_BLOQUEO_VENTAS: TFIBStringField
      FieldName = 'MOTIVO_BLOQUEO_VENTAS'
      Size = 40
    end
    object xArticuloADR_PACKAGE: TFIBStringField
      FieldName = 'ADR_PACKAGE'
      Size = 40
    end
    object xArticuloTIPO_ARTICULO: TFIBStringField
      FieldName = 'TIPO_ARTICULO'
      Size = 3
    end
    object xArticuloTIPO_REGISTRO_FITOSANITARIO: TFIBStringField
      FieldName = 'TIPO_REGISTRO_FITOSANITARIO'
      Size = 1
    end
    object xArticuloPREPARABLE: TIntegerField
      FieldName = 'PREPARABLE'
    end
    object xArticuloTIPO_IBAE: TIntegerField
      FieldName = 'TIPO_IBAE'
    end
    object xArticuloLITROS_POR_UNIDAD: TFloatField
      FieldName = 'LITROS_POR_UNIDAD'
    end
    object xArticuloZ_RIBETE_DEFECTO: TFIBStringField
      FieldName = 'Z_RIBETE_DEFECTO'
      Size = 3
    end
    object xArticuloZ_LON_COLOR_1: TFIBStringField
      FieldName = 'Z_LON_COLOR_1'
      Size = 5
    end
    object xArticuloZ_LON_COLOR_2: TFIBStringField
      FieldName = 'Z_LON_COLOR_2'
      Size = 5
    end
    object xArticuloZ_LON_COLOR_3: TFIBStringField
      FieldName = 'Z_LON_COLOR_3'
      Size = 5
    end
    object xArticuloFORMULA_DEFECTO: TIntegerField
      FieldName = 'FORMULA_DEFECTO'
    end
    object xArticuloTIPO_IMPUESTO_ADICIONAL: TIntegerField
      FieldName = 'TIPO_IMPUESTO_ADICIONAL'
    end
    object xArticuloGENERAR_PEDIDO_COMPRA_SIEMPRE: TIntegerField
      FieldName = 'GENERAR_PEDIDO_COMPRA_SIEMPRE'
    end
    object xArticuloSECCION: TFIBStringField
      FieldName = 'SECCION'
      Size = 3
    end
  end
  object DSxArticulo: TDataSource
    DataSet = xArticulo
    Left = 112
    Top = 24
  end
  object DSxDetalle: TDataSource
    DataSet = xDetalle
    Left = 112
    Top = 120
  end
  object xDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_ESCANDALLO'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ARTICULO = :DETALLE')
    UniDirectional = False
    DataSource = DSQMEscandallo
    Left = 32
    Top = 120
    object xDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xDetalleDETALLE: TFIBStringField
      DisplayLabel = 'Detalle'
      FieldName = 'DETALLE'
      Size = 15
    end
    object xDetalleTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xDetalleP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xDetalleCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 192
    Top = 24
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 240
    Top = 24
  end
end
