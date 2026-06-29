object DMArticulos: TDMArticulos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 208
  Top = 105
  Height = 716
  Width = 1069
  object DSQMArticulos: TDataSource
    DataSet = QMArticulos
    Left = 120
    Top = 8
  end
  object xHistCoste: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_ART_HIST_COST'
      'where ID_A = ?ID_A'
      'order by fecha desc')
    UniDirectional = False
    DataSource = DSQMArticulos
    Left = 24
    Top = 152
    object xHistCosteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xHistCosteARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xHistCostePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xHistCosteUSUARIO: TFIBStringField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
      Size = 31
    end
    object xHistCosteFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xHistCosteMAQUINA: TFIBStringField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
      Size = 31
    end
  end
  object DSxHistCoste: TDataSource
    DataSet = xHistCoste
    Left = 120
    Top = 152
  end
  object QMArticulos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ARTICULOS_CUENTAS'
      'WHERE'
      '  ID_A=?old_ID_A AND '
      '  ID_C_A=?old_ID_C_A ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ARTICULOS_CUENTAS'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,ARTICULO,TITULO,TITULO_LARGO,ID_FAM' +
        'ILIA,FAMILIA,ID_SUBFAMILIA,SUBFAMILIA,P_COSTE,'#13#10'ABIERTO,VIRTUAL,' +
        'CONTROL_STOCK,PAIS,TIPO_IVA,CTA_COMPRAS,CTA_VENTAS,CTA_DEVOLUCIO' +
        'N_COMPRAS,CTA_DEVOLUCION_VENTAS,CTA_ABONO_COMPRAS,'#13#10'CTA_ABONO_VE' +
        'NTAS,ENTRADA,UNIDADES,TITULO_CORTO,NOTAS,DISPONIBILIDAD,ACTUALIZ' +
        'A_VENTA,PTO_VERDE,CONTROLA_MEDIDAS,SERIALIZADO,'#13#10'GARANTIA,PRODUC' +
        'CION,DESCUENTO,DESCUENTO_2,DESCUENTO_3,IVA_ESCANDALLO,PVP_POR_UD' +
        '_SECUNDARIA,ALFA_1,ALFA_2,ALFA_3,'#13#10'ALFA_4,ALFA_5,ALFA_6,ALFA_7,A' +
        'LFA_8,SERIALIZADO_KRI,LOTES_KRI,LOTES,MULTIPLO_1,MULTIPLO_2,'#13#10'MU' +
        'LTIPLO_3,MULTIPLO_4,FACTOR_ESCALA,UD_MINIMO_COMPRA,UD_MINIMO_VEN' +
        'TA,ID_A_M_C_T,ID_A,ID_C_A,IMAGEN,ID_GALERIA,'#13#10'CODIGO_INTRA,PESO,' +
        'UBICABLE,VOLUMEN_UNIT,DIAMETRO_UNIT,DEFECTO_UD_SECUNDARIA,NOTAS_' +
        'COMPRAS,NOTAS_VENTAS,NO_CALCULA_STOCKMINMAX,CRC_NOTAS,'#13#10'CRC_NOTA' +
        'S_COMPRAS,CRC_NOTAS_VENTAS,ANTICIPO,ANTICIPO_CONTADO,ANTICIPO_PR' +
        'EG_DATOS,WEB,FABRICANTE,BAJA,FECHA_BAJA,MOTIVO_BAJA,'#13#10'TIPO_CLAVE' +
        '_ADR,CANTIDAD_LIMITADA,TIPO_ARTICULO_TYC,Z_MODELO,Z_LINEA,Z_SALI' +
        'DA,Z_ARMAZON,Z_LONA,Z_LONA_TIPO,Z_LONA_FORMA,'#13#10'Z_LONA_MODELO,Z_L' +
        'ONA_CONFECCION,Z_LACADO,Z_TIPO_LACADO,Z_CORTE,Z_QUITAR_SI_HAY_MO' +
        'TOR,Z_SUSTITUTO,Z_KIT_TIPO,Z_PREPARABLE,Z_MERMA,'#13#10'Z_FORZAR_LACAD' +
        'O_SN,Z_TIPO_LACADO_FORZADO,COMPONENTE_MOTOR,ULT_MODIFICACION,Z_L' +
        'AM_ANCHO,Z_LAM_LARGO,Z_LAM_COLOR,SUBTIPO_ARTICULO_TYC,EXPORTAR,C' +
        'OSTE_ADICIONAL,'#13#10'Z_QUITAR_SI_ES_MANUAL,ID_MARCA,MARCA,TITULO_MAR' +
        'CA,PMP,PRECIO_MERCADO,COD_COLOR_HILO,ID_A_M,BLOQUEO_COMPRAS,MOTI' +
        'VO_BLOQUEO_COMPRAS,'#13#10'BLOQUEO_VENTAS,MOTIVO_BLOQUEO_VENTAS,ADR_PA' +
        'CKAGE,TIPO_ARTICULO,TIPO_REGISTRO_FITOSANITARIO,PREPARABLE,TIPO_' +
        'IBAE,LITROS_POR_UNIDAD,Z_RIBETE_DEFECTO,Z_LON_COLOR_1,'#13#10'Z_LON_CO' +
        'LOR_2,Z_LON_COLOR_3,FORMULA_DEFECTO,TIPO_IMPUESTO_ADICIONAL,GENE' +
        'RAR_PEDIDO_COMPRA_SIEMPRE,SECCION,FACTOR_UNIDAD,NO_APLICA_DESC_L' +
        'INEA_CLIENTE,ALTO,ANCHO,'#13#10'FONDO,FECHA_ALTA,KG_PLASTICO_VIRGEN,IM' +
        'PORTE_IEPNR,ECOTASA,TASA_DE_DESTRUCCION,PASTADAS,PASTADA_CANT_ET' +
        'IQUETAS,INFLUYE_MARGEN,PARETO,'#13#10'ESTRATEGIA_COMPRA,IEPNR_CLAVE_PR' +
        'ODUCTO,IEPNR_KILOGRAMOS,IEPNR_KILOGRAMOS_NO_RECICLADOS,REQUIERE_' +
        'LOTE_SIMPLE,BLISTER,PROYECTO)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?ARTICULO,?TITULO,?TITULO_LARGO,' +
        '?ID_FAMILIA,?FAMILIA,?ID_SUBFAMILIA,?SUBFAMILIA,?P_COSTE,'#13#10'?ABIE' +
        'RTO,?VIRTUAL,?CONTROL_STOCK,?PAIS,?TIPO_IVA,?CTA_COMPRAS,?CTA_VE' +
        'NTAS,?CTA_DEVOLUCION_COMPRAS,?CTA_DEVOLUCION_VENTAS,?CTA_ABONO_C' +
        'OMPRAS,'#13#10'?CTA_ABONO_VENTAS,?ENTRADA,?UNIDADES,?TITULO_CORTO,?NOT' +
        'AS,?DISPONIBILIDAD,?ACTUALIZA_VENTA,?PTO_VERDE,?CONTROLA_MEDIDAS' +
        ',?SERIALIZADO,'#13#10'?GARANTIA,?PRODUCCION,?DESCUENTO,?DESCUENTO_2,?D' +
        'ESCUENTO_3,?IVA_ESCANDALLO,?PVP_POR_UD_SECUNDARIA,?ALFA_1,?ALFA_' +
        '2,?ALFA_3,'#13#10'?ALFA_4,?ALFA_5,?ALFA_6,?ALFA_7,?ALFA_8,?SERIALIZADO' +
        '_KRI,?LOTES_KRI,?LOTES,?MULTIPLO_1,?MULTIPLO_2,'#13#10'?MULTIPLO_3,?MU' +
        'LTIPLO_4,?FACTOR_ESCALA,?UD_MINIMO_COMPRA,?UD_MINIMO_VENTA,?ID_A' +
        '_M_C_T,?ID_A,?ID_C_A,?IMAGEN,?ID_GALERIA,'#13#10'?CODIGO_INTRA,?PESO,?' +
        'UBICABLE,?VOLUMEN_UNIT,?DIAMETRO_UNIT,?DEFECTO_UD_SECUNDARIA,?NO' +
        'TAS_COMPRAS,?NOTAS_VENTAS,?NO_CALCULA_STOCKMINMAX,?CRC_NOTAS,'#13#10'?' +
        'CRC_NOTAS_COMPRAS,?CRC_NOTAS_VENTAS,?ANTICIPO,?ANTICIPO_CONTADO,' +
        '?ANTICIPO_PREG_DATOS,?WEB,?FABRICANTE,?BAJA,?FECHA_BAJA,?MOTIVO_' +
        'BAJA,'#13#10'?TIPO_CLAVE_ADR,?CANTIDAD_LIMITADA,?TIPO_ARTICULO_TYC,?Z_' +
        'MODELO,?Z_LINEA,?Z_SALIDA,?Z_ARMAZON,?Z_LONA,?Z_LONA_TIPO,?Z_LON' +
        'A_FORMA,'#13#10'?Z_LONA_MODELO,?Z_LONA_CONFECCION,?Z_LACADO,?Z_TIPO_LA' +
        'CADO,?Z_CORTE,?Z_QUITAR_SI_HAY_MOTOR,?Z_SUSTITUTO,?Z_KIT_TIPO,?Z' +
        '_PREPARABLE,?Z_MERMA,'#13#10'?Z_FORZAR_LACADO_SN,?Z_TIPO_LACADO_FORZAD' +
        'O,?COMPONENTE_MOTOR,?ULT_MODIFICACION,?Z_LAM_ANCHO,?Z_LAM_LARGO,' +
        '?Z_LAM_COLOR,?SUBTIPO_ARTICULO_TYC,?EXPORTAR,?COSTE_ADICIONAL,'#13#10 +
        '?Z_QUITAR_SI_ES_MANUAL,?ID_MARCA,?MARCA,?TITULO_MARCA,?PMP,?PREC' +
        'IO_MERCADO,?COD_COLOR_HILO,?ID_A_M,?BLOQUEO_COMPRAS,?MOTIVO_BLOQ' +
        'UEO_COMPRAS,'#13#10'?BLOQUEO_VENTAS,?MOTIVO_BLOQUEO_VENTAS,?ADR_PACKAG' +
        'E,?TIPO_ARTICULO,?TIPO_REGISTRO_FITOSANITARIO,?PREPARABLE,?TIPO_' +
        'IBAE,?LITROS_POR_UNIDAD,?Z_RIBETE_DEFECTO,?Z_LON_COLOR_1,'#13#10'?Z_LO' +
        'N_COLOR_2,?Z_LON_COLOR_3,?FORMULA_DEFECTO,?TIPO_IMPUESTO_ADICION' +
        'AL,?GENERAR_PEDIDO_COMPRA_SIEMPRE,?SECCION,?FACTOR_UNIDAD,?NO_AP' +
        'LICA_DESC_LINEA_CLIENTE,?ALTO,?ANCHO,'#13#10'?FONDO,?FECHA_ALTA,?KG_PL' +
        'ASTICO_VIRGEN,?IMPORTE_IEPNR,?ECOTASA,?TASA_DE_DESTRUCCION,?PAST' +
        'ADAS,?PASTADA_CANT_ETIQUETAS,?INFLUYE_MARGEN,?PARETO,'#13#10'?ESTRATEG' +
        'IA_COMPRA,?IEPNR_CLAVE_PRODUCTO,?IEPNR_KILOGRAMOS,?IEPNR_KILOGRA' +
        'MOS_NO_RECICLADOS,?REQUIERE_LOTE_SIMPLE,?BLISTER,?PROYECTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ARTICULOS_CUENTAS'
      'WHERE'
      '  ID_A=?ID_A AND '
      '  ID_C_A=?ID_C_A ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_CUENTAS'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'FAMILIA <> ?FAMILIA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ARTICULOS_CUENTAS'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO=?TITULO '
      '  ,TITULO_LARGO=?TITULO_LARGO '
      '  ,ID_FAMILIA=?ID_FAMILIA '
      '  ,FAMILIA=?FAMILIA '
      '  ,ID_SUBFAMILIA=?ID_SUBFAMILIA '
      '  ,SUBFAMILIA=?SUBFAMILIA '
      '  ,P_COSTE=?P_COSTE '
      '  ,ABIERTO=?ABIERTO '
      '  ,VIRTUAL=?VIRTUAL '
      '  ,CONTROL_STOCK=?CONTROL_STOCK '
      '  ,PAIS=?PAIS '
      '  ,TIPO_IVA=?TIPO_IVA '
      '  ,CTA_COMPRAS=?CTA_COMPRAS '
      '  ,CTA_VENTAS=?CTA_VENTAS '
      '  ,CTA_DEVOLUCION_COMPRAS=?CTA_DEVOLUCION_COMPRAS '
      '  ,CTA_DEVOLUCION_VENTAS=?CTA_DEVOLUCION_VENTAS '
      '  ,CTA_ABONO_COMPRAS=?CTA_ABONO_COMPRAS '
      '  ,CTA_ABONO_VENTAS=?CTA_ABONO_VENTAS '
      '  ,ENTRADA=?ENTRADA '
      '  ,UNIDADES=?UNIDADES '
      '  ,TITULO_CORTO=?TITULO_CORTO '
      '  ,NOTAS=?NOTAS '
      '  ,DISPONIBILIDAD=?DISPONIBILIDAD '
      '  ,ACTUALIZA_VENTA=?ACTUALIZA_VENTA '
      '  ,PTO_VERDE=?PTO_VERDE '
      '  ,CONTROLA_MEDIDAS=?CONTROLA_MEDIDAS '
      '  ,SERIALIZADO=?SERIALIZADO '
      '  ,GARANTIA=?GARANTIA '
      '  ,PRODUCCION=?PRODUCCION '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,DESCUENTO_2=?DESCUENTO_2 '
      '  ,DESCUENTO_3=?DESCUENTO_3 '
      '  ,IVA_ESCANDALLO=?IVA_ESCANDALLO '
      '  ,PVP_POR_UD_SECUNDARIA=?PVP_POR_UD_SECUNDARIA '
      '  ,ALFA_1=?ALFA_1 '
      '  ,ALFA_2=?ALFA_2 '
      '  ,ALFA_3=?ALFA_3 '
      '  ,ALFA_4=?ALFA_4 '
      '  ,ALFA_5=?ALFA_5 '
      '  ,ALFA_6=?ALFA_6 '
      '  ,ALFA_7=?ALFA_7 '
      '  ,ALFA_8=?ALFA_8 '
      '  ,SERIALIZADO_KRI=?SERIALIZADO_KRI '
      '  ,LOTES_KRI=?LOTES_KRI '
      '  ,LOTES=?LOTES '
      '  ,MULTIPLO_1=?MULTIPLO_1 '
      '  ,MULTIPLO_2=?MULTIPLO_2 '
      '  ,MULTIPLO_3=?MULTIPLO_3 '
      '  ,MULTIPLO_4=?MULTIPLO_4 '
      '  ,FACTOR_ESCALA=?FACTOR_ESCALA '
      '  ,UD_MINIMO_COMPRA=?UD_MINIMO_COMPRA '
      '  ,UD_MINIMO_VENTA=?UD_MINIMO_VENTA '
      '  ,ID_A_M_C_T=?ID_A_M_C_T '
      '  ,IMAGEN=?IMAGEN '
      '  ,ID_GALERIA=?ID_GALERIA '
      '  ,CODIGO_INTRA=?CODIGO_INTRA '
      '  ,PESO=?PESO '
      '  ,UBICABLE=?UBICABLE '
      '  ,VOLUMEN_UNIT=?VOLUMEN_UNIT '
      '  ,DIAMETRO_UNIT=?DIAMETRO_UNIT '
      '  ,DEFECTO_UD_SECUNDARIA=?DEFECTO_UD_SECUNDARIA '
      '  ,NOTAS_COMPRAS=?NOTAS_COMPRAS '
      '  ,NOTAS_VENTAS=?NOTAS_VENTAS '
      '  ,NO_CALCULA_STOCKMINMAX=?NO_CALCULA_STOCKMINMAX '
      '  ,CRC_NOTAS=?CRC_NOTAS '
      '  ,CRC_NOTAS_COMPRAS=?CRC_NOTAS_COMPRAS '
      '  ,CRC_NOTAS_VENTAS=?CRC_NOTAS_VENTAS '
      '  ,ANTICIPO=?ANTICIPO '
      '  ,ANTICIPO_CONTADO=?ANTICIPO_CONTADO '
      '  ,ANTICIPO_PREG_DATOS=?ANTICIPO_PREG_DATOS '
      '  ,WEB=?WEB '
      '  ,FABRICANTE=?FABRICANTE '
      '  ,BAJA=?BAJA '
      '  ,FECHA_BAJA=?FECHA_BAJA '
      '  ,MOTIVO_BAJA=?MOTIVO_BAJA '
      '  ,TIPO_CLAVE_ADR=?TIPO_CLAVE_ADR '
      '  ,CANTIDAD_LIMITADA=?CANTIDAD_LIMITADA '
      '  ,TIPO_ARTICULO_TYC=?TIPO_ARTICULO_TYC '
      '  ,Z_MODELO=?Z_MODELO '
      '  ,Z_LINEA=?Z_LINEA '
      '  ,Z_SALIDA=?Z_SALIDA '
      '  ,Z_ARMAZON=?Z_ARMAZON '
      '  ,Z_LONA=?Z_LONA '
      '  ,Z_LONA_TIPO=?Z_LONA_TIPO '
      '  ,Z_LONA_FORMA=?Z_LONA_FORMA '
      '  ,Z_LONA_MODELO=?Z_LONA_MODELO '
      '  ,Z_LONA_CONFECCION=?Z_LONA_CONFECCION '
      '  ,Z_LACADO=?Z_LACADO '
      '  ,Z_TIPO_LACADO=?Z_TIPO_LACADO '
      '  ,Z_CORTE=?Z_CORTE '
      '  ,Z_QUITAR_SI_HAY_MOTOR=?Z_QUITAR_SI_HAY_MOTOR '
      '  ,Z_SUSTITUTO=?Z_SUSTITUTO '
      '  ,Z_KIT_TIPO=?Z_KIT_TIPO '
      '  ,Z_PREPARABLE=?Z_PREPARABLE '
      '  ,Z_MERMA=?Z_MERMA '
      '  ,Z_FORZAR_LACADO_SN=?Z_FORZAR_LACADO_SN '
      '  ,Z_TIPO_LACADO_FORZADO=?Z_TIPO_LACADO_FORZADO '
      '  ,COMPONENTE_MOTOR=?COMPONENTE_MOTOR '
      '  ,ULT_MODIFICACION=?ULT_MODIFICACION '
      '  ,Z_LAM_ANCHO=?Z_LAM_ANCHO '
      '  ,Z_LAM_LARGO=?Z_LAM_LARGO '
      '  ,Z_LAM_COLOR=?Z_LAM_COLOR '
      '  ,SUBTIPO_ARTICULO_TYC=?SUBTIPO_ARTICULO_TYC '
      '  ,EXPORTAR=?EXPORTAR '
      '  ,COSTE_ADICIONAL=?COSTE_ADICIONAL '
      '  ,Z_QUITAR_SI_ES_MANUAL=?Z_QUITAR_SI_ES_MANUAL '
      '  ,ID_MARCA=?ID_MARCA '
      '  ,MARCA=?MARCA '
      '  ,TITULO_MARCA=?TITULO_MARCA '
      '  ,PMP=?PMP '
      '  ,PRECIO_MERCADO=?PRECIO_MERCADO '
      '  ,COD_COLOR_HILO=?COD_COLOR_HILO '
      '  ,ID_A_M=?ID_A_M '
      '  ,BLOQUEO_COMPRAS=?BLOQUEO_COMPRAS '
      '  ,MOTIVO_BLOQUEO_COMPRAS=?MOTIVO_BLOQUEO_COMPRAS '
      '  ,BLOQUEO_VENTAS=?BLOQUEO_VENTAS '
      '  ,MOTIVO_BLOQUEO_VENTAS=?MOTIVO_BLOQUEO_VENTAS '
      '  ,ADR_PACKAGE=?ADR_PACKAGE '
      '  ,TIPO_ARTICULO=?TIPO_ARTICULO '
      '  ,TIPO_REGISTRO_FITOSANITARIO=?TIPO_REGISTRO_FITOSANITARIO '
      '  ,PREPARABLE=?PREPARABLE '
      '  ,TIPO_IBAE=?TIPO_IBAE '
      '  ,LITROS_POR_UNIDAD=?LITROS_POR_UNIDAD '
      '  ,Z_RIBETE_DEFECTO=?Z_RIBETE_DEFECTO '
      '  ,Z_LON_COLOR_1=?Z_LON_COLOR_1 '
      '  ,Z_LON_COLOR_2=?Z_LON_COLOR_2 '
      '  ,Z_LON_COLOR_3=?Z_LON_COLOR_3 '
      '  ,FORMULA_DEFECTO=?FORMULA_DEFECTO '
      '  ,TIPO_IMPUESTO_ADICIONAL=?TIPO_IMPUESTO_ADICIONAL '
      '  ,GENERAR_PEDIDO_COMPRA_SIEMPRE=?GENERAR_PEDIDO_COMPRA_SIEMPRE '
      '  ,SECCION=?SECCION '
      '  ,FACTOR_UNIDAD=?FACTOR_UNIDAD '
      '  ,NO_APLICA_DESC_LINEA_CLIENTE=?NO_APLICA_DESC_LINEA_CLIENTE '
      '  ,ALTO=?ALTO '
      '  ,ANCHO=?ANCHO '
      '  ,FONDO=?FONDO '
      '  ,FECHA_ALTA=?FECHA_ALTA '
      '  ,KG_PLASTICO_VIRGEN=?KG_PLASTICO_VIRGEN '
      '  ,IMPORTE_IEPNR=?IMPORTE_IEPNR '
      '  ,ECOTASA=?ECOTASA '
      '  ,TASA_DE_DESTRUCCION=?TASA_DE_DESTRUCCION '
      '  ,PASTADAS=?PASTADAS '
      '  ,PASTADA_CANT_ETIQUETAS=?PASTADA_CANT_ETIQUETAS '
      '  ,INFLUYE_MARGEN=?INFLUYE_MARGEN '
      '  ,PARETO=?PARETO '
      '  ,ESTRATEGIA_COMPRA=?ESTRATEGIA_COMPRA '
      '  ,IEPNR_CLAVE_PRODUCTO=?IEPNR_CLAVE_PRODUCTO '
      '  ,IEPNR_KILOGRAMOS=?IEPNR_KILOGRAMOS '
      
        '  ,IEPNR_KILOGRAMOS_NO_RECICLADOS=?IEPNR_KILOGRAMOS_NO_RECICLADO' +
        'S '
      '  ,REQUIERE_LOTE_SIMPLE=?REQUIERE_LOTE_SIMPLE '
      '  ,BLISTER=?BLISTER '
      '  ,PROYECTO=?PROYECTO '
      'WHERE'
      '  ID_A=?ID_A AND '
      '  ID_C_A=?ID_C_A ')
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    AfterCancel = QMArticulosAfterCancel
    AfterDelete = Graba
    AfterOpen = QMArticulosAfterOpen
    AfterPost = QMArticulosAfterPost
    AfterScroll = QMArticulosAfterScroll
    BeforeClose = QMArticulosBeforeClose
    BeforePost = QMArticulosBeforePost
    OnCalcFields = QMArticulosCalcFields
    OnNewRecord = CamposDefectoNewRecord
    ClavesPrimarias.Strings = (
      'ID_A '
      'ID_C_A ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ARTICULOS_CUENTAS'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'ART_ARTICULOS'
      'CON_CUENTAS_GES_ART')
    CamposBloqueo.Strings = (
      'ID_A'
      'ID_C_A')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 8
    object QMArticulosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMArticulosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMArticulosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMArticulosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMArticulosFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      OnChange = QMArticulosFAMILIAChange
      Size = 5
    end
    object QMArticulosP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMArticulosABIERTO: TIntegerField
      DisplayLabel = 'Abierto'
      FieldName = 'ABIERTO'
      OnChange = CalculaCosteKRI20
    end
    object QMArticulosCONTROL_STOCK: TIntegerField
      DisplayLabel = 'Ctrol. Stock'
      FieldName = 'CONTROL_STOCK'
    end
    object QMArticulosPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMArticulosTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
      OnChange = QMArticulosTIPO_IVAChange
    end
    object QMArticulosCTA_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Compras'
      FieldName = 'CTA_COMPRAS'
      Size = 15
    end
    object QMArticulosCTA_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Ventas'
      FieldName = 'CTA_VENTAS'
      Size = 15
    end
    object QMArticulosENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMArticulosUNIDADES: TFIBStringField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
      OnChange = QMArticulosUNIDADESChange
      Size = 2
    end
    object QMArticulosVIRTUAL: TIntegerField
      DisplayLabel = 'Virtual'
      FieldName = 'VIRTUAL'
    end
    object QMArticulosTITULO_CORTO: TFIBStringField
      DisplayLabel = 'Titulo Corto'
      FieldName = 'TITULO_CORTO'
    end
    object QMArticulosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMArticulosDISPONIBILIDAD: TIntegerField
      DisplayLabel = 'Disp.'
      FieldName = 'DISPONIBILIDAD'
      OnChange = QMArticulosDISPONIBILIDADChange
    end
    object QMArticulosACTUALIZA_VENTA: TIntegerField
      DisplayLabel = 'Act. Venta'
      FieldName = 'ACTUALIZA_VENTA'
    end
    object QMArticulosPTO_VERDE: TFloatField
      DisplayLabel = 'Pto. Verde'
      FieldName = 'PTO_VERDE'
    end
    object QMArticulosCONTROLA_MEDIDAS: TIntegerField
      DisplayLabel = 'Ctrol. Medidas'
      FieldName = 'CONTROLA_MEDIDAS'
    end
    object QMArticulosSERIALIZADO: TIntegerField
      DisplayLabel = 'Serializado'
      FieldName = 'SERIALIZADO'
    end
    object QMArticulosGARANTIA: TIntegerField
      DisplayLabel = 'Garantia'
      FieldName = 'GARANTIA'
      OnChange = QMArticulosGARANTIAChange
    end
    object QMArticulosPRODUCCION: TIntegerField
      DisplayLabel = 'Prod.'
      FieldName = 'PRODUCCION'
    end
    object QMArticulosDESCUENTO: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO'
    end
    object QMArticulosDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object QMArticulosDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object QMArticulosIVA_ESCANDALLO: TIntegerField
      DisplayLabel = 'IVA Escand.'
      FieldName = 'IVA_ESCANDALLO'
    end
    object QMArticulosP_COSTE_CANAL: TFloatField
      DisplayLabel = 'P. Coste Canal'
      FieldKind = fkCalculated
      FieldName = 'P_COSTE_CANAL'
      OnGetText = QMArticulosP_COSTE_CANALGetText
      Calculated = True
    end
    object QMArticulosALFA_1: TFIBStringField
      DisplayLabel = 'Alfa 1'
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMArticulosALFA_2: TFIBStringField
      DisplayLabel = 'Alfa 2'
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMArticulosALFA_3: TFIBStringField
      DisplayLabel = 'Alfa 3'
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMArticulosALFA_4: TFIBStringField
      DisplayLabel = 'Alfa 4'
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMArticulosALFA_5: TFIBStringField
      DisplayLabel = 'Alfa 5'
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMArticulosSERIALIZADO_KRI: TIntegerField
      DisplayLabel = 'Serializado'
      FieldName = 'SERIALIZADO_KRI'
    end
    object QMArticulosLOTES_KRI: TIntegerField
      DisplayLabel = 'Loteable'
      FieldName = 'LOTES_KRI'
    end
    object QMArticulosPVP_POR_UD_SECUNDARIA: TIntegerField
      DisplayLabel = 'PVP. x Uds. Sec.'
      FieldName = 'PVP_POR_UD_SECUNDARIA'
    end
    object QMArticulosLOTES: TIntegerField
      DisplayLabel = 'Loteable'
      FieldName = 'LOTES'
    end
    object QMArticulosMULTIPLO_1: TFloatField
      DisplayLabel = 'Mult. 1'
      FieldName = 'MULTIPLO_1'
    end
    object QMArticulosMULTIPLO_2: TFloatField
      DisplayLabel = 'Mult. 2'
      FieldName = 'MULTIPLO_2'
    end
    object QMArticulosMULTIPLO_3: TFloatField
      DisplayLabel = 'Mult. 3'
      FieldName = 'MULTIPLO_3'
    end
    object QMArticulosMULTIPLO_4: TFloatField
      DisplayLabel = 'Mult. 4'
      FieldName = 'MULTIPLO_4'
    end
    object QMArticulosFACTOR_ESCALA: TFloatField
      DisplayLabel = 'Fact. Escala'
      FieldName = 'FACTOR_ESCALA'
    end
    object QMArticulosUD_MINIMO_COMPRA: TFloatField
      DisplayLabel = 'Uds. Min. Compra'
      FieldName = 'UD_MINIMO_COMPRA'
    end
    object QMArticulosUD_MINIMO_VENTA: TFloatField
      DisplayLabel = 'Uds. Min. Venta'
      FieldName = 'UD_MINIMO_VENTA'
    end
    object QMArticulosID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMArticulosID_C_A: TIntegerField
      DisplayLabel = 'ID Art. Cta.'
      FieldName = 'ID_C_A'
    end
    object QMArticulosIMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
    end
    object QMArticulosCODIGO_INTRA: TFIBStringField
      DisplayLabel = 'Cod. Intra.'
      FieldName = 'CODIGO_INTRA'
      Size = 10
    end
    object QMArticulosPESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object QMArticulosCTA_DEVOLUCION_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Compra'
      FieldName = 'CTA_DEVOLUCION_COMPRAS'
      Size = 15
    end
    object QMArticulosCTA_DEVOLUCION_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Venta'
      FieldName = 'CTA_DEVOLUCION_VENTAS'
      Size = 15
    end
    object QMArticulosCTA_ABONO_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Abono. Compra'
      FieldName = 'CTA_ABONO_COMPRAS'
      Size = 15
    end
    object QMArticulosCTA_ABONO_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Abono Venta'
      FieldName = 'CTA_ABONO_VENTAS'
      Size = 15
    end
    object QMArticulosUBICABLE: TIntegerField
      DisplayLabel = 'Ubicable'
      FieldName = 'UBICABLE'
    end
    object QMArticulosVOLUMEN_UNIT: TFloatField
      DisplayLabel = 'Vol. Unit.'
      FieldName = 'VOLUMEN_UNIT'
    end
    object QMArticulosDIAMETRO_UNIT: TFloatField
      DisplayLabel = 'Diam. Unit.'
      FieldName = 'DIAMETRO_UNIT'
    end
    object QMArticulosDEFECTO_UD_SECUNDARIA: TFloatField
      DisplayLabel = 'Def. Uds. Sec.'
      FieldName = 'DEFECTO_UD_SECUNDARIA'
    end
    object QMArticulosNOTAS_COMPRAS: TBlobField
      DisplayLabel = 'Notas Compra'
      FieldName = 'NOTAS_COMPRAS'
      Size = 8
    end
    object QMArticulosNOTAS_VENTAS: TBlobField
      DisplayLabel = 'Notas Venta'
      FieldName = 'NOTAS_VENTAS'
      Size = 8
    end
    object QMArticulosNO_CALCULA_STOCKMINMAX: TIntegerField
      DisplayLabel = 'No Calc. Stock Min./Max.'
      FieldName = 'NO_CALCULA_STOCKMINMAX'
    end
    object QMArticulosANTICIPO: TIntegerField
      DisplayLabel = 'Anticipo'
      FieldName = 'ANTICIPO'
    end
    object QMArticulosANTICIPO_CONTADO: TIntegerField
      DisplayLabel = 'Anticipo Contado'
      FieldName = 'ANTICIPO_CONTADO'
    end
    object QMArticulosANTICIPO_PREG_DATOS: TIntegerField
      DisplayLabel = 'Anticipo Preg. Datos'
      FieldName = 'ANTICIPO_PREG_DATOS'
    end
    object QMArticulosWEB: TIntegerField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
    end
    object QMArticulosFABRICANTE: TIntegerField
      DisplayLabel = 'Fabricante'
      FieldName = 'FABRICANTE'
      OnChange = QMArticulosFABRICANTEChange
    end
    object QMArticulosCRC_NOTAS: TFIBStringField
      DisplayLabel = 'CRC Notas'
      FieldName = 'CRC_NOTAS'
      Size = 15
    end
    object QMArticulosCRC_NOTAS_COMPRAS: TFIBStringField
      DisplayLabel = 'CRC Notas Compra'
      FieldName = 'CRC_NOTAS_COMPRAS'
      Size = 15
    end
    object QMArticulosCRC_NOTAS_VENTAS: TFIBStringField
      DisplayLabel = 'CRC Notas Venta'
      FieldName = 'CRC_NOTAS_VENTAS'
      Size = 15
    end
    object QMArticulosBAJA: TIntegerField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMArticulosFECHA_BAJA: TDateTimeField
      DisplayLabel = 'Fecha Baja'
      FieldName = 'FECHA_BAJA'
    end
    object QMArticulosMOTIVO_BAJA: TFIBStringField
      DisplayLabel = 'Motivo Baja'
      FieldName = 'MOTIVO_BAJA'
      Size = 60
    end
    object QMArticulosID_A_M_C_T: TIntegerField
      DisplayLabel = 'ID Mod.'
      FieldName = 'ID_A_M_C_T'
    end
    object QMArticulosTIPO_CLAVE_ADR: TIntegerField
      DisplayLabel = 'Tipo Clave ADR'
      FieldName = 'TIPO_CLAVE_ADR'
    end
    object QMArticulosCANTIDAD_LIMITADA: TIntegerField
      DisplayLabel = 'Cant. Lim.'
      FieldName = 'CANTIDAD_LIMITADA'
    end
    object QMArticulosTIPO_ARTICULO_TYC: TFIBStringField
      DisplayLabel = 'Tipo Art.'
      DisplayWidth = 3
      FieldName = 'TIPO_ARTICULO_TYC'
      OnChange = QMArticulosTIPO_ARTICULO_TYCChange
      Size = 3
    end
    object QMArticulosZ_SALIDA: TFloatField
      DisplayLabel = 'Salida'
      FieldName = 'Z_SALIDA'
      OnChange = Z_Armazon
    end
    object QMArticulosZ_LINEA: TFloatField
      DisplayLabel = 'Linea'
      FieldName = 'Z_LINEA'
      OnChange = Z_Armazon
    end
    object QMArticulosZ_ARMAZON: TFIBStringField
      DisplayLabel = 'Armazon'
      FieldName = 'Z_ARMAZON'
      OnChange = Z_Toldo
      Size = 15
    end
    object QMArticulosZ_LONA: TFIBStringField
      DisplayLabel = 'Lona'
      FieldName = 'Z_LONA'
      OnChange = Z_Toldo
      Size = 15
    end
    object QMArticulosZ_LONA_FORMA: TFIBStringField
      DisplayLabel = 'Forma'
      FieldName = 'Z_LONA_FORMA'
      OnChange = Z_Lona
      Size = 3
    end
    object QMArticulosZ_LONA_MODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'Z_LONA_MODELO'
      OnChange = Z_Lona
      Size = 10
    end
    object QMArticulosZ_LONA_CONFECCION: TFIBStringField
      DisplayLabel = 'Confexxion'
      FieldName = 'Z_LONA_CONFECCION'
      OnChange = Z_Lona
      Size = 3
    end
    object QMArticulosZ_LACADO: TIntegerField
      DisplayLabel = 'Lacado'
      FieldName = 'Z_LACADO'
    end
    object QMArticulosZ_TIPO_LACADO: TFIBStringField
      DisplayLabel = 'Tipo Lacado'
      FieldName = 'Z_TIPO_LACADO'
      OnChange = QMArticulosZ_TIPO_LACADOChange
      Size = 2
    end
    object QMArticulosZ_CORTE: TIntegerField
      DisplayLabel = 'Corte'
      FieldName = 'Z_CORTE'
    end
    object QMArticulosZ_QUITAR_SI_HAY_MOTOR: TIntegerField
      DisplayLabel = 'Quitar Si Hay Motor'
      FieldName = 'Z_QUITAR_SI_HAY_MOTOR'
    end
    object QMArticulosZ_SUSTITUTO: TFIBStringField
      DisplayLabel = 'Sustituto'
      FieldName = 'Z_SUSTITUTO'
      Size = 15
    end
    object QMArticulosZ_KIT_TIPO: TFIBStringField
      DisplayLabel = 'Tipo KIT'
      FieldName = 'Z_KIT_TIPO'
      OnChange = Z_Kit
      Size = 3
    end
    object QMArticulosZ_PREPARABLE: TIntegerField
      DisplayLabel = 'Preparable'
      FieldName = 'Z_PREPARABLE'
    end
    object QMArticulosZ_MERMA: TFloatField
      DisplayLabel = 'Merma'
      FieldName = 'Z_MERMA'
    end
    object QMArticulosZ_LONA_TIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Z_LONA_TIPO'
      Size = 3
    end
    object QMArticulosZ_MODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'Z_MODELO'
      Size = 5
    end
    object QMArticulosZ_FORZAR_LACADO_SN: TIntegerField
      DisplayLabel = 'Forzar Lacado SN'
      FieldName = 'Z_FORZAR_LACADO_SN'
    end
    object QMArticulosZ_TIPO_LACADO_FORZADO: TFIBStringField
      DisplayLabel = 'Tipo Lacado Forzado'
      FieldName = 'Z_TIPO_LACADO_FORZADO'
      Size = 2
    end
    object QMArticulosCOMPONENTE_MOTOR: TIntegerField
      DisplayLabel = 'Componente Motor'
      FieldName = 'COMPONENTE_MOTOR'
    end
    object QMArticulosULT_MODIFICACION: TDateTimeField
      DisplayLabel = 'Ult. Mod.'
      FieldName = 'ULT_MODIFICACION'
    end
    object QMArticulosZ_LAM_ANCHO: TFloatField
      DisplayLabel = 'Lam. Ancho'
      FieldName = 'Z_LAM_ANCHO'
    end
    object QMArticulosZ_LAM_LARGO: TFloatField
      DisplayLabel = 'Lam. Largo'
      FieldName = 'Z_LAM_LARGO'
    end
    object QMArticulosZ_LAM_COLOR: TFIBStringField
      DisplayLabel = 'Lam. Color'
      FieldName = 'Z_LAM_COLOR'
      Size = 2
    end
    object QMArticulosSUBFAMILIA: TFIBStringField
      DisplayLabel = 'Subfamilia'
      FieldName = 'SUBFAMILIA'
      Size = 5
    end
    object QMArticulosALFA_6: TFIBStringField
      DisplayLabel = 'Alfa 6'
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMArticulosSUBTIPO_ARTICULO_TYC: TFIBStringField
      DisplayLabel = 'Subtipo'
      DisplayWidth = 3
      FieldName = 'SUBTIPO_ARTICULO_TYC'
      Size = 3
    end
    object QMArticulosID_GALERIA: TIntegerField
      DisplayLabel = 'Id Galeria'
      FieldName = 'ID_GALERIA'
    end
    object QMArticulosEXPORTAR: TIntegerField
      DisplayLabel = 'Exportar'
      FieldName = 'EXPORTAR'
    end
    object QMArticulosCOSTE_ADICIONAL: TFloatField
      DisplayLabel = 'Coste Adic.'
      FieldName = 'COSTE_ADICIONAL'
    end
    object QMArticulosP_COSTE_MAS_ADICIONAL: TFloatField
      DisplayLabel = 'P. Coste + Adic.'
      FieldKind = fkCalculated
      FieldName = 'P_COSTE_MAS_ADICIONAL'
      Calculated = True
    end
    object QMArticulosSTOCK_ALM: TFloatField
      DisplayLabel = 'Stock'
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM'
      OnGetText = QMArticulosSTOCK_ALMGetText
      Calculated = True
    end
    object QMArticulosALFA_7: TFIBStringField
      DisplayLabel = 'Alfa 7'
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMArticulosALFA_8: TFIBStringField
      DisplayLabel = 'Alfa 8'
      FieldName = 'ALFA_8'
      Size = 40
    end
    object QMArticulosTITULO_FABRICANTE: TStringField
      DisplayLabel = 'Fabricante'
      FieldKind = fkCalculated
      FieldName = 'TITULO_FABRICANTE'
      Size = 60
      Calculated = True
    end
    object QMArticulosSTOCK_VIRTUAL: TFloatField
      FieldKind = fkCalculated
      FieldName = 'STOCK_VIRTUAL'
      OnGetText = QMArticulosSTOCK_VIRTUALGetText
      Calculated = True
    end
    object QMArticulosPRECIO_TARIFA: TFloatField
      DisplayLabel = 'P. Tarifa'
      FieldKind = fkCalculated
      FieldName = 'PRECIO_TARIFA'
      OnGetText = QMArticulosPRECIO_TARIFAGetText
      Calculated = True
    end
    object QMArticulosPRECIO_MERCADO: TFloatField
      DisplayLabel = 'P. Mercado'
      FieldName = 'PRECIO_MERCADO'
    end
    object QMArticulosZ_QUITAR_SI_ES_MANUAL: TIntegerField
      DisplayLabel = 'Quitar si es manual'
      FieldName = 'Z_QUITAR_SI_ES_MANUAL'
    end
    object QMArticulosID_MARCA: TIntegerField
      DisplayLabel = 'Id Marca'
      FieldName = 'ID_MARCA'
    end
    object QMArticulosMARCA: TFIBStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      Size = 5
    end
    object QMArticulosTITULO_MARCA: TFIBStringField
      DisplayLabel = 'Titulo Marca'
      FieldName = 'TITULO_MARCA'
      Size = 60
    end
    object QMArticulosPMP: TFloatField
      DisplayLabel = 'P.M.P.'
      FieldName = 'PMP'
    end
    object QMArticulosCOD_COLOR_HILO: TFIBStringField
      DisplayLabel = 'Color Hilo'
      FieldName = 'COD_COLOR_HILO'
      Size = 3
    end
    object QMArticulosID_A_M: TIntegerField
      DisplayLabel = 'Id Modelo'
      FieldName = 'ID_A_M'
    end
    object QMArticulosBLOQUEO_COMPRAS: TIntegerField
      DisplayLabel = 'Bloqueo Compras'
      FieldName = 'BLOQUEO_COMPRAS'
    end
    object QMArticulosMOTIVO_BLOQUEO_COMPRAS: TFIBStringField
      DisplayLabel = 'Motivo Bloqueo Compras'
      FieldName = 'MOTIVO_BLOQUEO_COMPRAS'
      Size = 40
    end
    object QMArticulosBLOQUEO_VENTAS: TIntegerField
      DisplayLabel = 'Bloqueo Ventas'
      FieldName = 'BLOQUEO_VENTAS'
    end
    object QMArticulosMOTIVO_BLOQUEO_VENTAS: TFIBStringField
      DisplayLabel = 'Motivo Bloqueo Ventas'
      FieldName = 'MOTIVO_BLOQUEO_VENTAS'
      Size = 40
    end
    object QMArticulosADR_PACKAGE: TFIBStringField
      DisplayLabel = 'Bulto ADR'
      FieldName = 'ADR_PACKAGE'
      Size = 40
    end
    object QMArticulosTIPO_ARTICULO: TFIBStringField
      DisplayLabel = 'Tipo Art'#237'culo'
      FieldName = 'TIPO_ARTICULO'
      Size = 3
    end
    object QMArticulosTIPO_REGISTRO_FITOSANITARIO: TFIBStringField
      DisplayLabel = 'Tipo Reg. Fitosanitario'
      FieldName = 'TIPO_REGISTRO_FITOSANITARIO'
      Size = 1
    end
    object QMArticulosPREPARABLE: TIntegerField
      DisplayLabel = 'Preparable'
      FieldName = 'PREPARABLE'
    end
    object QMArticulosTIPO_IBAE: TIntegerField
      DisplayLabel = 'Tipo IBAE'
      FieldName = 'TIPO_IBAE'
    end
    object QMArticulosLITROS_POR_UNIDAD: TFloatField
      DisplayLabel = 'Litros por Ud.'
      FieldName = 'LITROS_POR_UNIDAD'
    end
    object QMArticulosZ_RIBETE_DEFECTO: TFIBStringField
      DisplayLabel = 'Ribete Defecto'
      FieldName = 'Z_RIBETE_DEFECTO'
      Size = 3
    end
    object QMArticulosZ_LON_COLOR_1: TFIBStringField
      DisplayLabel = 'Color Lona 1'
      FieldName = 'Z_LON_COLOR_1'
      Size = 5
    end
    object QMArticulosZ_LON_COLOR_2: TFIBStringField
      DisplayLabel = 'Color Lona 2'
      FieldName = 'Z_LON_COLOR_2'
      Size = 5
    end
    object QMArticulosZ_LON_COLOR_3: TFIBStringField
      DisplayLabel = 'Color Lona 3'
      FieldName = 'Z_LON_COLOR_3'
      Size = 5
    end
    object QMArticulosFORMULA_DEFECTO: TIntegerField
      DisplayLabel = 'Formula Defecto'
      FieldName = 'FORMULA_DEFECTO'
    end
    object QMArticulosTIPO_IMPUESTO_ADICIONAL: TIntegerField
      DisplayLabel = 'Tipo Imp. Adic.'
      FieldName = 'TIPO_IMPUESTO_ADICIONAL'
    end
    object QMArticulosGENERAR_PEDIDO_COMPRA_SIEMPRE: TIntegerField
      DisplayLabel = 'Generar Pedido Siempre'
      FieldName = 'GENERAR_PEDIDO_COMPRA_SIEMPRE'
    end
    object QMArticulosSECCION: TFIBStringField
      DisplayLabel = 'Seccion'
      FieldName = 'SECCION'
      Size = 3
    end
    object QMArticulosFACTOR_UNIDAD: TFloatField
      DisplayLabel = 'Factor Unidad'
      FieldName = 'FACTOR_UNIDAD'
    end
    object QMArticulosPESO_FACTOR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'PESO_FACTOR'
      Calculated = True
    end
    object QMArticulosDIAMETRO_FACTOR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'DIAMETRO_FACTOR'
      Calculated = True
    end
    object QMArticulosVOLUMEN_FACTOR: TFloatField
      FieldKind = fkCalculated
      FieldName = 'VOLUMEN_FACTOR'
      Calculated = True
    end
    object QMArticulosNO_APLICA_DESC_LINEA_CLIENTE: TIntegerField
      DisplayLabel = 'No Aplica Desc. Linea Cliente'
      FieldName = 'NO_APLICA_DESC_LINEA_CLIENTE'
    end
    object QMArticulosALTO: TFloatField
      DisplayLabel = 'Alto'
      FieldName = 'ALTO'
    end
    object QMArticulosANCHO: TFloatField
      DisplayLabel = 'Ancho'
      FieldName = 'ANCHO'
    end
    object QMArticulosFONDO: TFloatField
      DisplayLabel = 'Fondo'
      FieldName = 'FONDO'
    end
    object QMArticulosTITULO_LARGO: TFIBStringField
      DisplayLabel = 'Titulo Largo'
      FieldName = 'TITULO_LARGO'
      Size = 256
    end
    object QMArticulosFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMArticulosLANZADA_ALM: TFloatField
      DisplayLabel = 'Lanzadas'
      FieldKind = fkCalculated
      FieldName = 'LANZADA_ALM'
      OnGetText = QMArticulosLANZADA_ALMGetText
      Calculated = True
    end
    object QMArticulosKG_PLASTICO_VIRGEN: TFloatField
      DisplayLabel = 'Kg Plastico Virgen'
      FieldName = 'KG_PLASTICO_VIRGEN'
    end
    object QMArticulosIMPORTE_IEPNR: TFloatField
      DisplayLabel = 'Importe IEPNR'
      FieldName = 'IMPORTE_IEPNR'
    end
    object QMArticulosTASA_DE_DESTRUCCION: TFloatField
      DisplayLabel = 'Tasa Destruccion'
      FieldName = 'TASA_DE_DESTRUCCION'
    end
    object QMArticulosPASTADAS: TIntegerField
      DisplayLabel = 'Pastadas'
      FieldName = 'PASTADAS'
    end
    object QMArticulosPASTADA_CANT_ETIQUETAS: TIntegerField
      DisplayLabel = 'Etiq./Pastada'
      FieldName = 'PASTADA_CANT_ETIQUETAS'
    end
    object QMArticulosECOTASA: TFloatField
      DisplayLabel = 'Ecotasa'
      FieldName = 'ECOTASA'
    end
    object QMArticulosID_FAMILIA: TIntegerField
      FieldName = 'ID_FAMILIA'
    end
    object QMArticulosID_SUBFAMILIA: TIntegerField
      FieldName = 'ID_SUBFAMILIA'
    end
    object QMArticulosINFLUYE_MARGEN: TIntegerField
      DisplayLabel = 'Influye Margen'
      FieldName = 'INFLUYE_MARGEN'
    end
    object QMArticulosPARETO: TFIBStringField
      DisplayLabel = 'Pareto'
      FieldName = 'PARETO'
      Size = 1
    end
    object QMArticulosESTRATEGIA_COMPRA: TIntegerField
      DisplayLabel = 'Estrategia de compra'
      FieldName = 'ESTRATEGIA_COMPRA'
    end
    object QMArticulosIEPNR_CLAVE_PRODUCTO: TFIBStringField
      DisplayLabel = 'Clave Prod. IEPNR'
      FieldName = 'IEPNR_CLAVE_PRODUCTO'
      Size = 1
    end
    object QMArticulosIEPNR_KILOGRAMOS: TFloatField
      DisplayLabel = 'Kg. IEPNR'
      FieldName = 'IEPNR_KILOGRAMOS'
    end
    object QMArticulosIEPNR_KILOGRAMOS_NO_RECICLADOS: TFloatField
      DisplayLabel = 'Kg. no Recclados IEPNR'
      FieldName = 'IEPNR_KILOGRAMOS_NO_RECICLADOS'
    end
    object QMArticulosREQUIERE_LOTE_SIMPLE: TIntegerField
      DisplayLabel = 'Req. Lote Simple'
      FieldName = 'REQUIERE_LOTE_SIMPLE'
    end
    object QMArticulosBLISTER: TFIBStringField
      DisplayLabel = 'Blister'
      FieldName = 'BLISTER'
      Size = 15
    end
    object QMArticulosPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
  end
  object xTipoIva: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT P_IVA, P_RECARGO, TITULO FROM SYS_TIPO_IVA   '
      'WHERE PAIS=?PAIS AND TIPO=?TIPO_IVA')
    UniDirectional = False
    DataSource = DSQMArticulos
    Left = 24
    Top = 200
    object xTipoIvaP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object xTipoIvaP_RECARGO: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_RECARGO'
    end
    object xTipoIvaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 15
    end
  end
  object DSxTipoIva: TDataSource
    DataSet = xTipoIva
    Left = 120
    Top = 200
  end
  object QMProveedores: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS_PROVEEDORES'
      'WHERE'
      '  ID_A = ?ID_A'
      '  PROVEEDOR=?old_PROVEEDOR ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS_PROVEEDORES'
      
        '  (PEDIDO_OPTIMO,PEDIDO_MINIMO,PROVEEDOR,EMPRESA,PRIORIDAD,ACTIV' +
        'O,ARTICULO,INCR_PEDIDO,ID_A,P_COSTE,DESCUENTO)'
      'VALUES'
      
        '  (?PEDIDO_OPTIMO,?PEDIDO_MINIMO,?PROVEEDOR,?EMPRESA,?PRIORIDAD,' +
        '?ACTIVO,?ARTICULO,?INCR_PEDIDO,?ID_A,?P_COSTE,?DESCUENTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_PROVEEDORES'
      'WHERE'
      '  ID_A = ?ID_A AND'
      '  PROVEEDOR=?PROVEEDOR ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_PROVEEDORES'
      'WHERE '
      'ID_A = ?ID_A'
      'ORDER BY PRIORIDAD')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_PROVEEDORES'
      'SET'
      '  PEDIDO_OPTIMO=?PEDIDO_OPTIMO '
      '  ,PEDIDO_MINIMO=?PEDIDO_MINIMO '
      '  ,PRIORIDAD=?PRIORIDAD '
      '  ,ACTIVO=?ACTIVO'
      '  ,INCR_PEDIDO=?INCR_PEDIDO '
      '  ,DIAS_ENTREGA=?DIAS_ENTREGA'
      '  ,P_COSTE=?P_COSTE'
      '  ,DESCUENTO=?DESCUENTO'
      'WHERE'
      '  ID_A = ?ID_A AND'
      '  PROVEEDOR=?PROVEEDOR ')
    DataSource = DSQMArticulos
    Plan.Strings = (
      ' ')
    AfterPost = Graba
    BeforeEdit = QMProveedoresBeforeEdit
    OnNewRecord = QMProveedoresNewRecord
    ClavesPrimarias.Strings = (
      'ID_A '
      'PROVEEDOR ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS_PROVEEDORES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 216
    Top = 104
    object QMProveedoresEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProveedoresARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMProveedoresPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMProveedoresPRIORIDAD: TIntegerField
      DisplayLabel = 'Prioridad'
      FieldName = 'PRIORIDAD'
    end
    object QMProveedoresPEDIDO_MINIMO: TFloatField
      DisplayLabel = 'Ped. Min.'
      FieldName = 'PEDIDO_MINIMO'
    end
    object QMProveedoresPEDIDO_OPTIMO: TFloatField
      DisplayLabel = 'Ped. Optimo'
      FieldName = 'PEDIDO_OPTIMO'
    end
    object QMProveedoresACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMProveedoresTITULO: TStringField
      DisplayWidth = 60
      FieldKind = fkCalculated
      FieldName = 'TITULO'
      OnGetText = QMProveedoresTITULOGetText
      Size = 60
      Calculated = True
    end
    object QMProveedoresDESCUENTO: TFloatField
      DisplayLabel = 'Dto.'
      FieldName = 'DESCUENTO'
    end
    object QMProveedoresP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMProveedoresINCR_PEDIDO: TFloatField
      DisplayLabel = 'Inc. Pedido'
      FieldName = 'INCR_PEDIDO'
    end
    object QMProveedoresID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMProveedoresDIAS_ENTREGA: TIntegerField
      DisplayLabel = 'Dias Entrega'
      FieldName = 'DIAS_ENTREGA'
    end
  end
  object DSQMProveedores: TDataSource
    DataSet = QMProveedores
    Left = 312
    Top = 104
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 992
    Top = 8
  end
  object xUnidades: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_UNIDADES_ARTICULOS'
      'WHERE TIPO=?UNIDADES')
    UniDirectional = False
    DataSource = DSQMArticulos
    Left = 24
    Top = 56
  end
  object DSxUnidades: TDataSource
    DataSet = xUnidades
    Left = 120
    Top = 56
  end
  object QMCodigoBarra: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ARTICULOS_BARRAS_EDICION'
      'WHERE'
      '  BARRAS=?old_BARRAS AND '
      '  ID_A = ?ID_A')
    InsertSQL.Strings = (
      'INSERT INTO VER_ARTICULOS_BARRAS_EDICION'
      '  (EMPRESA,ARTICULO,BARRAS,TIPO,FUNCION,TITULO,LONGITUD,ID_A)'
      'VALUES'
      
        '  (?EMPRESA,?ARTICULO,?BARRAS,?TIPO,?FUNCION,?TITULO,?LONGITUD,?' +
        'ID_A)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ARTICULOS_BARRAS_EDICION'
      'WHERE'
      '  EMPRESA = :EMPRESA AND'
      '  ARTICULO = :ARTICULO AND'
      '  BARRAS = :old_BARRAS')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_BARRAS_EDICION'
      'WHERE '
      'ID_A = ?ID_A'
      'ORDER BY BARRAS'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ARTICULOS_BARRAS_EDICION'
      'SET'
      '  TIPO = :TIPO '
      '  ,FUNCION = :FUNCION '
      '  ,BARRAS = :new_BARRAS'
      'WHERE'
      '  EMPRESA = :EMPRESA AND'
      '  ARTICULO = :ARTICULO AND'
      '  BARRAS = :old_BARRAS')
    DataSource = DSQMArticulos
    Plan.Strings = (
      ' ')
    AfterDelete = QMCodigoBarraAfterDelete
    AfterPost = QMCodigoBarraAfterPost
    BeforePost = QMCodigoBarraBeforePost
    OnNewRecord = QMCodigoBarraNewRecord
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ARTICULOS_BARRAS_EDICION'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 216
    Top = 152
    object QMCodigoBarraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCodigoBarraARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMCodigoBarraBARRAS: TFIBStringField
      DisplayLabel = 'Barras'
      FieldName = 'BARRAS'
      Size = 25
    end
    object QMCodigoBarraTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      OnChange = QMCodigoBarraTIPOChange
    end
    object QMCodigoBarraFUNCION: TIntegerField
      DisplayLabel = 'Funcion'
      FieldName = 'FUNCION'
    end
    object QMCodigoBarraTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMCodigoBarraLONGITUD: TIntegerField
      DisplayLabel = 'Long.'
      FieldName = 'LONGITUD'
    end
    object QMCodigoBarraID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
  end
  object DSCodigoBarra: TDataSource
    DataSet = QMCodigoBarra
    Left = 312
    Top = 152
  end
  object xTitulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *  FROM SYS_TIPO_CODIGO_BARRAS'
      '  WHERE TIPO= ?TIPO')
    UniDirectional = False
    DataSource = DSCodigoBarra
    Left = 896
    Top = 8
  end
  object xDisponibilidad: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SYS_ART_DISPONIBILIDAD'
      'WHERE DISPONIBILIDAD=?DISPONIBILIDAD')
    UniDirectional = False
    DataSource = DSQMArticulos
    Left = 24
    Top = 248
  end
  object DSxDisponibilidad: TDataSource
    DataSet = xDisponibilidad
    Left = 120
    Top = 248
  end
  object QMProvArt: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ARTICULOS_COD_PROV'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  PROVEEDOR=?old_PROVEEDOR AND '
      '  CODIGO_PROVEEDOR=?old_CODIGO_PROVEEDOR ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ARTICULOS_COD_PROV'
      
        '  (PROVEEDOR,ID_A,EMPRESA,CODIGO_PROVEEDOR,NOMBRE_PROVEEDOR,TITU' +
        'LO_ART,ARTICULO)'
      'VALUES'
      
        '  (?PROVEEDOR,?ID_A,?EMPRESA,?CODIGO_PROVEEDOR,?NOMBRE_PROVEEDOR' +
        ',?TITULO_ART,?ARTICULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ARTICULOS_COD_PROV'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  PROVEEDOR=?old_PROVEEDOR AND '
      '  CODIGO_PROVEEDOR=?old_CODIGO_PROVEEDOR ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_COD_PROV'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO '
      'ORDER BY '
      '  PROVEEDOR, CODIGO_PROVEEDOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ARTICULOS_COD_PROV'
      'SET'
      '  ID_A=?ID_A '
      '  ,NOMBRE_PROVEEDOR=?NOMBRE_PROVEEDOR '
      '  ,TITULO_ART=?TITULO_ART '
      '  ,PROVEEDOR=?new_PROVEEDOR  '
      '  ,CODIGO_PROVEEDOR=?new_CODIGO_PROVEEDOR '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  PROVEEDOR=?old_PROVEEDOR AND '
      '  CODIGO_PROVEEDOR=?old_CODIGO_PROVEEDOR ')
    DataSource = DSQMArticulos
    Plan.Strings = (
      ' ')
    AfterDelete = QMProvArtAfterDelete
    AfterPost = QMProvArtAfterPost
    BeforePost = QMProvArtBeforePost
    OnNewRecord = QMProvArtNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO '
      'PROVEEDOR '
      'CODIGO_PROVEEDOR ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ARTICULOS_COD_PROV'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 216
    Top = 248
    object QMProvArtEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProvArtARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMProvArtPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
      OnChange = QMProvArtPROVEEDORChange
    end
    object QMProvArtNOMBRE_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_PROVEEDOR'
      Size = 60
    end
    object QMProvArtCODIGO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Cod. Prov.'
      DisplayWidth = 40
      FieldName = 'CODIGO_PROVEEDOR'
      Size = 40
    end
    object QMProvArtID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMProvArtTITULO_ART: TFIBStringField
      DisplayLabel = 'Descripcion Proveedor'
      FieldName = 'TITULO_ART'
      Size = 256
    end
  end
  object DSQMProvArt: TDataSource
    DataSet = QMProvArt
    Left = 312
    Top = 248
  end
  object xTipoGarantia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_PLAZOS_GARANTIA'
      'WHERE TIPO=?GARANTIA')
    UniDirectional = False
    DataSource = DSQMArticulos
    Left = 24
    Top = 104
  end
  object DSxTipoGarantia: TDataSource
    DataSet = xTipoGarantia
    Left = 120
    Top = 104
  end
  object DSQMSeries: TDataSource
    AutoEdit = False
    DataSet = QMSeries
    Left = 312
    Top = 200
  end
  object xAgrupDisp: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, AGRUPACION'
      'FROM VER_AGRUPACIONES'
      'WHERE'
      'TIPO = '#39'T'#39' AND'
      'AGRUPACION NOT IN (SELECT AGRUPACION'
      '                   FROM EMP_AGRUPACIONES_ART'
      '                   WHERE'
      '                   ID_A = :ID_A)'
      'ORDER BY AGRUPACION')
    UniDirectional = False
    DataSource = DSQMArticulos
    Left = 408
    Top = 392
  end
  object DSxAgrupDisp: TDataSource
    DataSet = xAgrupDisp
    Left = 504
    Top = 392
  end
  object xAgrupSon: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT AGRUPACION,TITULO FROM VER_AGRUPACIONES_ART'
      'where id_a = ?id_a'
      'order by agrupacion')
    UniDirectional = False
    DataSource = DSQMArticulos
    Left = 408
    Top = 344
  end
  object DSxAgrupSon: TDataSource
    DataSet = xAgrupSon
    Left = 504
    Top = 344
  end
  object QMArticulosPrecios: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS_PRECIOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS_PRECIOS'
      
        '  (EMPRESA,'#13#10'ARTICULO,TIPO_PRECIO_BASE,ACT_TAR_AUTOM,ENTRADA,PRE' +
        'CIO_BASE,MARGEN,PRECIO_ENTRADA,PRECIO_ULT_ENTRADA,PRECIO_ULT_VEN' +
        'TA,PRECIO_PMP,'#13#10'PRECIO_LIFO,PRECIO_FIFO,PRECIO_MERCADO,PRECIO_MA' +
        'NUAL,PUNTOS,CANAL_CALCULO,ALMACEN_CALCULO,FECHA_ULT_VENTA,TIPO_R' +
        'EDONDEO,PRORRATEO,'#13#10'ID_A,PRECIO_BASE_REPOSICION,PRECIO_REPOSICIO' +
        'N,GAMA)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?ARTICULO,?TIPO_PRECIO_BASE,?ACT_TAR_AUTOM,?ENTRAD' +
        'A,?PRECIO_BASE,?MARGEN,?PRECIO_ENTRADA,?PRECIO_ULT_ENTRADA,?PREC' +
        'IO_ULT_VENTA,?PRECIO_PMP,'#13#10'?PRECIO_LIFO,?PRECIO_FIFO,?PRECIO_MER' +
        'CADO,?PRECIO_MANUAL,?PUNTOS,?CANAL_CALCULO,?ALMACEN_CALCULO,?FEC' +
        'HA_ULT_VENTA,?TIPO_REDONDEO,?PRORRATEO,'#13#10'?ID_A,?PRECIO_BASE_REPO' +
        'SICION,?PRECIO_REPOSICION,?GAMA)')
    RefreshSQL.Strings = (
      
        'SELECT P.EMPRESA, P.ARTICULO, P.TIPO_PRECIO_BASE, P.ACT_TAR_AUTO' +
        'M, P.ENTRADA, P.MARGEN, P.PRECIO_ENTRADA,'
      
        '       P.PRECIO_ULT_ENTRADA, PRECIO_ULT_VENTA, P.PRECIO_PMP, P.P' +
        'RECIO_LIFO, P.PRECIO_FIFO, P.PRECIO_MERCADO,'
      
        '       P.PRECIO_MANUAL, P.PUNTOS, P.CANAL_CALCULO, P.ALMACEN_CAL' +
        'CULO, P.PRECIO_BASE, P.PRECIO_BASE_REPOSICION,'
      
        '       P.PRECIO_REPOSICION, P.GAMA, P.FECHA_ULT_VENTA, P.TIPO_RE' +
        'DONDEO, P.ID_A, P.PRORRATEO,'
      '       (PRORRATEO + PRECIO_ENTRADA) AS PMP_MAS_PRORRATEO,'
      '       --'
      '       (SELECT FIRST 1 C.FECHA'
      '        FROM GES_DETALLES_S D'
      '        LEFT JOIN GES_CABECERAS_S C ON C.ID_S = D.ID_S'
      '        WHERE'
      '        D.EMPRESA = P.EMPRESA AND'
      '        D.TIPO = '#39'ALB'#39' AND'
      '        D.ARTICULO = P.ARTICULO'
      '        ORDER BY C.FECHA DESC) FECHA_ULT_ALBARAN_VENTA,'
      '       --'
      '       (SELECT FIRST 1 C.FECHA'
      '        FROM GES_DETALLES_S D'
      '        LEFT JOIN GES_CABECERAS_S C ON C.ID_S = D.ID_S'
      '        WHERE'
      '        D.EMPRESA = P.EMPRESA AND'
      '        D.TIPO = '#39'FAC'#39' AND'
      '        D.ARTICULO = P.ARTICULO'
      '        ORDER BY C.FECHA DESC) FECHA_ULT_FACTURA_VENTA,'
      '       --'
      '       (SELECT FIRST 1 C.FECHA'
      '        FROM GES_DETALLES_E D'
      '        LEFT JOIN GES_CABECERAS_E C ON C.ID_E = D.ID_E'
      '        WHERE'
      '        D.EMPRESA = P.EMPRESA AND'
      '        D.TIPO = '#39'ALP'#39' AND'
      '        D.ARTICULO = P.ARTICULO'
      '        ORDER BY C.FECHA DESC) FECHA_ULT_ALBARAN_COMPRA,'
      '       --'
      '       (SELECT FIRST 1 C.FECHA'
      '        FROM GES_DETALLES_E D'
      '        LEFT JOIN GES_CABECERAS_E C ON C.ID_E = D.ID_E'
      '        WHERE'
      '        D.EMPRESA = P.EMPRESA AND'
      '        D.TIPO = '#39'FAP'#39' AND'
      '        D.ARTICULO = P.ARTICULO'
      '        ORDER BY C.FECHA DESC) FECHA_ULT_FACTURA_COMPRA'
      'FROM ART_ARTICULOS_PRECIOS P'
      'WHERE'
      'P.ID_A = :ID_A')
    SelectSQL.Strings = (
      
        'SELECT P.EMPRESA, P.ARTICULO, P.TIPO_PRECIO_BASE, P.ACT_TAR_AUTO' +
        'M, P.ENTRADA, P.MARGEN, P.PRECIO_ENTRADA,'
      
        '       P.PRECIO_ULT_ENTRADA, PRECIO_ULT_VENTA, P.PRECIO_PMP, P.P' +
        'RECIO_LIFO, P.PRECIO_FIFO, P.PRECIO_MERCADO,'
      
        '       P.PRECIO_MANUAL, P.PUNTOS, P.CANAL_CALCULO, P.ALMACEN_CAL' +
        'CULO, P.PRECIO_BASE, P.PRECIO_BASE_REPOSICION,'
      
        '       P.PRECIO_REPOSICION, P.GAMA, P.FECHA_ULT_VENTA, P.TIPO_RE' +
        'DONDEO, P.ID_A, P.PRORRATEO,'
      '       (PRORRATEO + PRECIO_ENTRADA) AS PMP_MAS_PRORRATEO,'
      '       --'
      '       (SELECT FIRST 1 C.FECHA'
      '        FROM GES_DETALLES_S D'
      '        LEFT JOIN GES_CABECERAS_S C ON C.ID_S = D.ID_S'
      '        WHERE'
      '        D.EMPRESA = P.EMPRESA AND'
      '        D.TIPO = '#39'ALB'#39' AND'
      '        D.ARTICULO = P.ARTICULO'
      '        ORDER BY C.FECHA DESC) FECHA_ULT_ALBARAN_VENTA,'
      '       --'
      '       (SELECT FIRST 1 C.FECHA'
      '        FROM GES_DETALLES_S D'
      '        LEFT JOIN GES_CABECERAS_S C ON C.ID_S = D.ID_S'
      '        WHERE'
      '        D.EMPRESA = P.EMPRESA AND'
      '        D.TIPO = '#39'FAC'#39' AND'
      '        D.ARTICULO = P.ARTICULO'
      '        ORDER BY C.FECHA DESC) FECHA_ULT_FACTURA_VENTA,'
      '       --'
      '       (SELECT FIRST 1 C.FECHA'
      '        FROM GES_DETALLES_E D'
      '        LEFT JOIN GES_CABECERAS_E C ON C.ID_E = D.ID_E'
      '        WHERE'
      '        D.EMPRESA = P.EMPRESA AND'
      '        D.TIPO = '#39'ALP'#39' AND'
      '        D.ARTICULO = P.ARTICULO'
      '        ORDER BY C.FECHA DESC) FECHA_ULT_ALBARAN_COMPRA,'
      '       --'
      '       (SELECT FIRST 1 C.FECHA'
      '        FROM GES_DETALLES_E D'
      '        LEFT JOIN GES_CABECERAS_E C ON C.ID_E = D.ID_E'
      '        WHERE'
      '        D.EMPRESA = P.EMPRESA AND'
      '        D.TIPO = '#39'FAP'#39' AND'
      '        D.ARTICULO = P.ARTICULO'
      '        ORDER BY C.FECHA DESC) FECHA_ULT_FACTURA_COMPRA'
      'FROM ART_ARTICULOS_PRECIOS P'
      'WHERE'
      'P.ID_A = :ID_A')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_PRECIOS'
      'SET'
      '  TIPO_PRECIO_BASE=?TIPO_PRECIO_BASE '
      '  ,ACT_TAR_AUTOM=?ACT_TAR_AUTOM '
      '  ,ENTRADA=?ENTRADA '
      '  ,PRECIO_BASE=?PRECIO_BASE '
      '  ,MARGEN=?MARGEN '
      '  ,PRECIO_ENTRADA=?PRECIO_ENTRADA '
      '  ,PRECIO_ULT_ENTRADA=?PRECIO_ULT_ENTRADA '
      '  ,PRECIO_ULT_VENTA=?PRECIO_ULT_VENTA '
      '  ,PRECIO_PMP=?PRECIO_PMP '
      '  ,PRECIO_LIFO=?PRECIO_LIFO '
      '  ,PRECIO_FIFO=?PRECIO_FIFO '
      '  ,PRECIO_MERCADO=?PRECIO_MERCADO '
      '  ,PRECIO_MANUAL=?PRECIO_MANUAL '
      '  ,PUNTOS=?PUNTOS '
      '  ,CANAL_CALCULO=?CANAL_CALCULO '
      '  ,ALMACEN_CALCULO=?ALMACEN_CALCULO '
      '  ,FECHA_ULT_VENTA=?FECHA_ULT_VENTA '
      '  ,TIPO_REDONDEO=?TIPO_REDONDEO '
      '  ,PRORRATEO=?PRORRATEO '
      '  ,ID_A=?ID_A '
      '  ,PRECIO_BASE_REPOSICION=?PRECIO_BASE_REPOSICION '
      '  ,PRECIO_REPOSICION=?PRECIO_REPOSICION '
      '  ,GAMA=?GAMA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    AutoCalcFields = False
    DataSource = DSQMArticulos
    Plan.Strings = (
      ' ')
    AfterOpen = QMArticulosPreciosAfterOpen
    AfterPost = QMArticulosPreciosAfterPost
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS_PRECIOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 216
    Top = 296
    object QMArticulosPreciosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMArticulosPreciosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMArticulosPreciosTIPO_PRECIO_BASE: TIntegerField
      DisplayLabel = 'Tipo Precio Base'
      FieldName = 'TIPO_PRECIO_BASE'
      OnChange = QMArticulosPreciosTIPO_PRECIO_BASEChange
    end
    object QMArticulosPreciosACT_TAR_AUTOM: TIntegerField
      DisplayLabel = 'Act. Tar. Aut.'
      FieldName = 'ACT_TAR_AUTOM'
    end
    object QMArticulosPreciosENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMArticulosPreciosMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
    object QMArticulosPreciosPRECIO_ENTRADA: TFloatField
      DisplayLabel = 'Precio Entrada'
      FieldName = 'PRECIO_ENTRADA'
    end
    object QMArticulosPreciosPRECIO_ULT_ENTRADA: TFloatField
      DisplayLabel = 'Precio Ult. Entrada'
      FieldName = 'PRECIO_ULT_ENTRADA'
    end
    object QMArticulosPreciosPRECIO_ULT_VENTA: TFloatField
      DisplayLabel = 'Precio Ult. Venta'
      FieldName = 'PRECIO_ULT_VENTA'
    end
    object QMArticulosPreciosPRECIO_PMP: TFloatField
      DisplayLabel = 'Precio P.M.P.'
      FieldName = 'PRECIO_PMP'
    end
    object QMArticulosPreciosPRECIO_LIFO: TFloatField
      DisplayLabel = 'Precio LIFO'
      FieldName = 'PRECIO_LIFO'
    end
    object QMArticulosPreciosPRECIO_FIFO: TFloatField
      DisplayLabel = 'Precio Fijo'
      FieldName = 'PRECIO_FIFO'
    end
    object QMArticulosPreciosPRECIO_MERCADO: TFloatField
      DisplayLabel = 'Precio Mercado'
      FieldName = 'PRECIO_MERCADO'
    end
    object QMArticulosPreciosPRECIO_MANUAL: TFloatField
      DisplayLabel = 'Precio Manual'
      FieldName = 'PRECIO_MANUAL'
    end
    object QMArticulosPreciosPUNTOS: TFloatField
      DisplayLabel = 'Puntos'
      FieldName = 'PUNTOS'
    end
    object QMArticulosPreciosCANAL_CALCULO: TIntegerField
      DisplayLabel = 'Can. Calc.'
      FieldName = 'CANAL_CALCULO'
    end
    object QMArticulosPreciosALMACEN_CALCULO: TFIBStringField
      DisplayLabel = 'Alm. Calc.'
      FieldName = 'ALMACEN_CALCULO'
      Size = 3
    end
    object QMArticulosPreciosPRECIO_BASE: TIntegerField
      DisplayLabel = 'Precio Base'
      FieldName = 'PRECIO_BASE'
    end
    object QMArticulosPreciosFECHA_ULT_VENTA: TDateTimeField
      DisplayLabel = 'Fec. Ult. Venta'
      FieldName = 'FECHA_ULT_VENTA'
    end
    object QMArticulosPreciosTIPO_REDONDEO: TIntegerField
      DisplayLabel = 'Tipo Redondeo'
      FieldName = 'TIPO_REDONDEO'
      OnChange = QMArticulosPreciosTIPO_REDONDEOChange
    end
    object QMArticulosPreciosID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMArticulosPreciosPRORRATEO: TFloatField
      DisplayLabel = 'Prorrateo'
      FieldName = 'PRORRATEO'
    end
    object QMArticulosPreciosPMP_MAS_PRORRATEO: TFloatField
      DisplayLabel = 'P.M.P. Prorr.'
      FieldName = 'PMP_MAS_PRORRATEO'
    end
    object QMArticulosPreciosFECHA_ULT_ALBARAN_VENTA: TDateTimeField
      DisplayLabel = 'Fec. Ult. Alb. Venta'
      FieldName = 'FECHA_ULT_ALBARAN_VENTA'
    end
    object QMArticulosPreciosFECHA_ULT_FACTURA_VENTA: TDateTimeField
      DisplayLabel = 'Fec. Ult. Fac. Venta'
      FieldName = 'FECHA_ULT_FACTURA_VENTA'
    end
    object QMArticulosPreciosFECHA_ULT_ALBARAN_COMPRA: TDateTimeField
      DisplayLabel = 'Fec. Ult. Alb. Compra'
      FieldName = 'FECHA_ULT_ALBARAN_COMPRA'
    end
    object QMArticulosPreciosFECHA_ULT_FACTURA_COMPRA: TDateTimeField
      DisplayLabel = 'Fec. Ult. Fac. Compra'
      FieldName = 'FECHA_ULT_FACTURA_COMPRA'
    end
    object QMArticulosPreciosPRECIO_REPOSICION: TFloatField
      DisplayLabel = 'Precio Reposicion'
      FieldName = 'PRECIO_REPOSICION'
    end
    object QMArticulosPreciosGAMA: TFIBStringField
      DisplayLabel = 'Gama'
      FieldName = 'GAMA'
      Size = 5
    end
    object QMArticulosPreciosPRECIO_BASE_REPOSICION: TFloatField
      DisplayLabel = 'Precio Base Reposicion'
      FieldName = 'PRECIO_BASE_REPOSICION'
    end
  end
  object DSQMArticulosPrecios: TDataSource
    AutoEdit = False
    DataSet = QMArticulosPrecios
    Left = 312
    Top = 296
  end
  object QMArticuloTarifas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ART_TARIFAS_PRECIOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TARIFA=?TARIFA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LINEA=?LINEA ')
    InsertSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ART_TARIFAS_PRECIOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TARIFA=?TARIFA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LINEA=?LINEA ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ART_TARIFAS_PRECIOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TARIFA=?TARIFA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ART_TARIFAS_PRECIOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'ID_A = :ID_A AND'
      'ACTIVA = 1'
      'ORDER BY TARIFA, UNID_MINIMAS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ART_TARIFAS_PRECIOS'
      'SET'
      '  PRECIO_VENTA=?PRECIO_VENTA '
      '  ,COMISION=?COMISION '
      '  ,BLOQUEADO=?BLOQUEADO '
      '  ,MARGEN=?MARGEN '
      '  ,DESCUENTO_COMPRA=?DESCUENTO_COMPRA '
      '  ,DESCUENTO_COMPRA_2=?DESCUENTO_COMPRA_2 '
      '  ,DESCUENTO_COMPRA_3=?DESCUENTO_COMPRA_3 '
      '  ,PRECIO_COMPRA=?PRECIO_COMPRA '
      '  ,CODIGO_ARTICULO_TARIFA=?CODIGO_ARTICULO_TARIFA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TARIFA=?TARIFA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LINEA=?LINEA ')
    AutoCalcFields = False
    DataSource = DSQMArticulos
    Plan.Strings = (
      
        'PLAN JOIN (VER_ART_TARIFAS_PRECIOS TAR INDEX (ID_A_TARIFAS_PRECI' +
        'OS),'
      '           VER_ART_TARIFAS_PRECIOS TAF INDEX (PK_ART_TARIFAS_C),'
      
        '           VER_ART_TARIFAS_PRECIOS CAL INDEX (PK_ART_TARIFAS_CAL' +
        'CULOS),'
      '           VER_ART_TARIFAS_PRECIOS ART INDEX (ID_A))')
    AfterDelete = Graba
    AfterPost = Graba
    OnCalcFields = QMArticuloTarifasCalcFields
    OnNewRecord = QMArticuloTarifasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'TARIFA '
      'ARTICULO '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ART_TARIFAS_PRECIOS'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'art_tarifas_precios'
      'art_tarifas_calculos'
      'art_articulos'
      'art_tarifas_c'
      'emp_agrupaciones_art')
    CamposBloqueo.Strings = (
      'EMPRESA,TARIFA,ARTICULO,LINEA'
      'EMPRESA,CALCULO'
      'ID_A'
      'EMPRESA,TARIFA'
      'AGRUPACION,EMPRESA,ARTICULO')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 216
    Top = 8
    object QMArticuloTarifasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMArticuloTarifasTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMArticuloTarifasARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMArticuloTarifasTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMArticuloTarifasLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMArticuloTarifasCALCULO: TIntegerField
      DisplayLabel = 'Calculo'
      FieldName = 'CALCULO'
    end
    object QMArticuloTarifasTITULO_CALCULO: TFIBStringField
      DisplayLabel = 'Titulo Calc.'
      FieldName = 'TITULO_CALCULO'
      Size = 60
    end
    object QMArticuloTarifasUNID_MAXIMAS: TFloatField
      DisplayLabel = 'Uds. Max.'
      FieldName = 'UNID_MAXIMAS'
    end
    object QMArticuloTarifasUNID_MINIMAS: TFloatField
      DisplayLabel = 'Uds. Min.'
      FieldName = 'UNID_MINIMAS'
    end
    object QMArticuloTarifasPRECIO_VENTA: TFloatField
      DisplayLabel = 'Prec. Venta'
      FieldName = 'PRECIO_VENTA'
      OnChange = CalculaMargenKRI20
    end
    object QMArticuloTarifasPRECIO_VENTA_CANAL: TFloatField
      DisplayLabel = 'Prev. Venta Canal'
      FieldKind = fkCalculated
      FieldName = 'PRECIO_VENTA_CANAL'
      OnGetText = QMArticuloTarifasPRECIO_VENTA_CANALGetText
      Calculated = True
    end
    object QMArticuloTarifasMARGEN_PC: TFloatField
      DisplayLabel = 'Margen P.C.'
      FieldName = 'MARGEN_PC'
    end
    object QMArticuloTarifasMARGEN_PV: TFloatField
      DisplayLabel = 'Margen P.V.'
      FieldName = 'MARGEN_PV'
    end
    object QMArticuloTarifasCOMISION: TFloatField
      DisplayLabel = 'Comision'
      FieldName = 'COMISION'
    end
    object QMArticuloTarifasCOMISION_CANAL: TFloatField
      DisplayLabel = 'Comision Canal'
      FieldKind = fkCalculated
      FieldName = 'COMISION_CANAL'
      OnGetText = QMArticuloTarifasCOMISION_CANALGetText
      Calculated = True
    end
    object QMArticuloTarifasBLOQUEADO: TIntegerField
      DisplayLabel = 'Bloq.'
      FieldName = 'BLOQUEADO'
    end
    object QMArticuloTarifasPRECIO_VENTA_MONEDA: TFloatField
      DisplayLabel = 'Prec. Venta Moneda'
      FieldKind = fkCalculated
      FieldName = 'PRECIO_VENTA_MONEDA'
      OnGetText = QMArticuloTarifasPRECIO_VENTA_MONEDAGetText
      Calculated = True
    end
    object QMArticuloTarifasFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMArticuloTarifasMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMArticuloTarifasACTIVA: TIntegerField
      DisplayLabel = 'Act.'
      FieldName = 'ACTIVA'
    end
    object QMArticuloTarifasMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
    object QMArticuloTarifasPRECIO_BASE: TFloatField
      DisplayLabel = 'Prec. Base'
      FieldName = 'PRECIO_BASE'
    end
    object QMArticuloTarifasPRECIO_BASE_MONEDA: TFloatField
      DisplayLabel = 'Prec. Base Moneda'
      FieldKind = fkCalculated
      FieldName = 'PRECIO_BASE_MONEDA'
      OnGetText = QMArticuloTarifasPRECIO_BASE_MONEDAGetText
      Calculated = True
    end
    object QMArticuloTarifasID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMArticuloTarifasDESCUENTO_COMPRA: TFloatField
      DisplayLabel = 'Dto.'
      FieldName = 'DESCUENTO_COMPRA'
      OnChange = CalculaCosteKRI20
    end
    object QMArticuloTarifasPRECIO_COSTE: TFloatField
      DisplayLabel = 'Precio Coste'
      FieldName = 'PRECIO_COSTE'
      OnChange = CalculaMargenKRI20
    end
    object QMArticuloTarifasPRECIO_COMPRA: TFloatField
      DisplayLabel = 'Precio Compra'
      FieldName = 'PRECIO_COMPRA'
      OnChange = CalculaCosteKRI20
    end
    object QMArticuloTarifasDESCUENTO_COMPRA_2: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'DESCUENTO_COMPRA_2'
      OnChange = CalculaCosteKRI20
    end
    object QMArticuloTarifasDESCUENTO_COMPRA_3: TFloatField
      DisplayLabel = 'Dto. 3'
      FieldName = 'DESCUENTO_COMPRA_3'
      OnChange = CalculaCosteKRI20
    end
    object QMArticuloTarifasTITULO_TARIFA: TStringField
      DisplayLabel = 'Tit. Tarifa'
      FieldKind = fkCalculated
      FieldName = 'TITULO_TARIFA'
      Size = 40
      Calculated = True
    end
    object QMArticuloTarifasCODIGO_ARTICULO_TARIFA: TFIBStringField
      DisplayLabel = 'Cod. Art'#237'ciulo Tarifa'
      FieldName = 'CODIGO_ARTICULO_TARIFA'
      Size = 40
    end
    object QMArticuloTarifasPRECIO_SIN_IVA: TFloatField
      DisplayLabel = 'Precio sin IVA'
      FieldKind = fkCalculated
      FieldName = 'PRECIO_SIN_IVA'
      ReadOnly = True
      Calculated = True
    end
    object QMArticuloTarifasPRECIO_CON_IVA: TFloatField
      DisplayLabel = 'Precio con IVA'
      FieldKind = fkCalculated
      FieldName = 'PRECIO_CON_IVA'
      ReadOnly = True
      Calculated = True
    end
  end
  object DSQMArticuloTarifas: TDataSource
    AutoEdit = False
    DataSet = QMArticuloTarifas
    Left = 312
    Top = 8
  end
  object xTiposRedondeo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPO_REDONDEOS'
      'WHERE TIPO_REDONDEO = ?TIPO_REDONDEO'
      '')
    UniDirectional = False
    DataSource = DSQMArticulosPrecios
    Plan.Strings = (
      'PLAN (SYS_TIPO_REDONDEOS INDEX (PK_SYS_TIPO_REDONDEOS))')
    Left = 24
    Top = 296
  end
  object DSxTiposRedondeos: TDataSource
    DataSet = xTiposRedondeo
    Left = 120
    Top = 296
  end
  object QMSeries: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CUENTAS_GES_ART_EECS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  ARTICULO=?old_ARTICULO ')
    InsertSQL.Strings = (
      'INSERT INTO CON_CUENTAS_GES_ART_EECS'
      
        '  (ID_C_A,SERIE,EMPRESA,EJERCICIO,CANAL,ARTICULO,CTA_COMPRAS,CTA' +
        '_VENTAS,CTA_DEVOLUCION_COMPRAS,CTA_DEVOLUCION_VENTAS,CTA_ABONO_C' +
        'OMPRAS,CTA_ABONO_VENTAS)'
      'VALUES'
      
        '  (?ID_C_A,?SERIE,?EMPRESA,?EJERCICIO,?CANAL,?ARTICULO,?CTA_COMP' +
        'RAS,?CTA_VENTAS,?CTA_DEVOLUCION_COMPRAS,?CTA_DEVOLUCION_VENTAS,?' +
        'CTA_ABONO_COMPRAS,?CTA_ABONO_VENTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_GES_ART_EECS'
      'WHERE'
      '   SERIE=?SERIE AND '
      '   ID_C_A = ?ID_C_A'
      '')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_GES_ART_EECS'
      'WHERE'
      '  ID_C_A = ?ID_C_A'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CUENTAS_GES_ART_EECS'
      'SET'
      '  ARTICULO = ?ARTICULO'
      '  ,CTA_COMPRAS=?CTA_COMPRAS '
      '  ,CTA_VENTAS=?CTA_VENTAS '
      '  ,CTA_DEVOLUCION_COMPRAS=?CTA_DEVOLUCION_COMPRAS '
      '  ,CTA_DEVOLUCION_VENTAS=?CTA_DEVOLUCION_VENTAS '
      '  ,CTA_ABONO_COMPRAS=?CTA_ABONO_COMPRAS '
      '  ,CTA_ABONO_VENTAS=?CTA_ABONO_VENTAS '
      'WHERE'
      '  ID_C_A = ?ID_C_A AND'
      '  SERIE=?SERIE')
    AutoCalcFields = False
    DataSource = DSQMArticulos
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMSeriesNewRecord
    ClavesPrimarias.Strings = (
      'SERIE '
      'ID_C_A'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CUENTAS_GES_ART_EECS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 216
    Top = 200
    object QMSeriesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMSeriesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMSeriesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMSeriesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMSeriesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMSeriesCTA_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Comrpas'
      FieldName = 'CTA_COMPRAS'
      Size = 15
    end
    object QMSeriesCTA_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Ventas'
      FieldName = 'CTA_VENTAS'
      Size = 15
    end
    object QMSeriesID_C_A: TIntegerField
      DisplayLabel = 'ID Art. Canal'
      FieldName = 'ID_C_A'
    end
    object QMSeriesCTA_DEVOLUCION_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Compras'
      FieldName = 'CTA_DEVOLUCION_COMPRAS'
      Size = 15
    end
    object QMSeriesCTA_DEVOLUCION_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Ventas'
      FieldName = 'CTA_DEVOLUCION_VENTAS'
      Size = 15
    end
    object QMSeriesCTA_ABONO_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Abono Compras'
      FieldName = 'CTA_ABONO_COMPRAS'
      Size = 15
    end
    object QMSeriesCTA_ABONO_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Abono Ventas'
      FieldName = 'CTA_ABONO_VENTAS'
      Size = 15
    end
  end
  object QMIdiomas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS_IDIOMAS'
      'WHERE'
      '  ID_A =?OLD_ID_A  AND'
      '  IDIOMA=?old_IDIOMA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS_IDIOMAS'
      
        '  (EMPRESA,ARTICULO,IDIOMA,TITULO,ID_A,DESCRIPCION_EXTENDIDA,CRC' +
        '_DESC_EXT)'
      'VALUES'
      
        '  (?EMPRESA,?ARTICULO,?IDIOMA,?TITULO,?ID_A,?DESCRIPCION_EXTENDI' +
        'DA,?CRC_DESC_EXT)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_IDIOMAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  IDIOMA=?IDIOMA ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_IDIOMAS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO =?ARTICULO'
      'ORDER BY IDIOMA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_IDIOMAS'
      'SET'
      '  TITULO=?TITULO '
      '  ,DESCRIPCION_EXTENDIDA=?DESCRIPCION_EXTENDIDA'
      '  ,CRC_DESC_EXT=?CRC_DESC_EXT'
      'WHERE'
      '   ID_A = ?ID_A AND'
      '   IDIOMA=?IDIOMA')
    DataSource = DSQMArticulos
    AfterDelete = GrabaIdioma
    AfterPost = GrabaIdioma
    BeforePost = QMIdiomasBeforePost
    OnNewRecord = QMIdiomasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO '
      'IDIOMA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS_IDIOMAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 584
    object QMIdiomasARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMIdiomasIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMIdiomasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMIdiomasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMIdiomasID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMIdiomasDESCRIPCION_EXTENDIDA: TBlobField
      DisplayLabel = 'Desc. Extendida'
      FieldName = 'DESCRIPCION_EXTENDIDA'
      Size = 8
    end
    object QMIdiomasCRC_DESC_EXT: TFIBStringField
      DisplayLabel = 'CRC Desc. Ext.'
      FieldName = 'CRC_DESC_EXT'
      Size = 15
    end
  end
  object DSQMIdiomas: TDataSource
    DataSet = QMIdiomas
    Left = 120
    Top = 584
  end
  object xPedidosDeClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, ' +
        'C.ID_S, D.ALMACEN, C.FECHA, C.CLIENTE,'
      
        '       T.NOMBRE_R_SOCIAL TITULO_CLIENTE, C.AGENTE, CP.FECHA_ENTR' +
        'EGA_PREV, CP.FECHA_CLIENTE, D.LINEA, D.ARTICULO,'
      
        '       D.TITULO, D.ID_A, D.UNIDADES, D.PRECIO, D.DESCUENTO, D.DE' +
        'SCUENTO_2, D.DESCUENTO_3, D.B_IMPONIBLE, DP.U_SERVIDAS,'
      
        '       DP.U_PENDIENTES, DP.FECHA_ENTREGA_PREV AS FECHA_ENTREGA_A' +
        'RTICULO, DP.FECHA_CONF_DET, A.CODIGO_CLIENTE,'
      
        '       C.SU_REFERENCIA, C.PEDIDO_CLIENTE, DP.FECHA_REC_DET, D.ID_' +
        'DETALLES_S'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_CABECERAS_S_PED CP ON C.ID_S = CP.ID_S'
      'JOIN GES_DETALLES_S D ON CP.ID_S = D.ID_S'
      'JOIN GES_DETALLES_S_PED DP ON D.ID_DETALLES_S = DP.ID_DETALLES_S'
      
        'JOIN EMP_CLIENTES CL ON C.EMPRESA = CL.EMPRESA AND C.CLIENTE = C' +
        'L.CLIENTE'
      'JOIN SYS_TERCEROS T ON CL.TERCERO = T.TERCERO'
      
        'LEFT JOIN ART_ARTICULOS_CODCLI A ON C.EMPRESA = A.EMPRESA AND C.' +
        'CLIENTE = A.CLIENTE AND D.ARTICULO = A.ARTICULO'
      'WHERE'
      'C.ID_S = :ID_S AND'
      'D.ID_DETALLES_S = :ID_DETALLES_S AND'
      'D.ID_A = :ID_A'
      'UNION'
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, ' +
        'C.ID_S, D.ALMACEN, C.FECHA, C.CLIENTE,'
      
        '       T.NOMBRE_R_SOCIAL TITULO_CLIENTE, C.AGENTE, CP.FECHA_ENTR' +
        'EGA_PREV, CP.FECHA_CLIENTE, D.LINEA, D.ARTICULO,'
      
        '       D.TITULO, D.ID_A, D.UNIDADES, D.PRECIO, D.DESCUENTO, D.DE' +
        'SCUENTO_2, D.DESCUENTO_3, D.B_IMPONIBLE, DP.U_SERVIDAS,'
      
        '       DP.U_PENDIENTES * ESC.CANTIDAD, DP.FECHA_ENTREGA_PREV AS ' +
        'FECHA_ENTREGA_ARTICULO, DP.FECHA_CONF_DET,'
      
        '       A.CODIGO_CLIENTE, C.SU_REFERENCIA, C.PEDIDO_CLIENTE, DP.FE' +
        'CHA_REC_DET, D.ID_DETALLES_S'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_CABECERAS_S_PED CP ON C.ID_S = CP.ID_S'
      'JOIN GES_DETALLES_S D ON CP.ID_S = D.ID_S'
      'JOIN GES_DETALLES_S_PED DP ON D.ID_DETALLES_S = DP.ID_DETALLES_S'
      'JOIN ART_ARTICULOS_ESCANDALLO ESC ON D.ID_A = ESC.ID_A'
      
        'JOIN EMP_CLIENTES CL ON C.EMPRESA = CL.EMPRESA AND C.CLIENTE = C' +
        'L.CLIENTE'
      'JOIN SYS_TERCEROS T ON CL.TERCERO = T.TERCERO'
      
        'LEFT JOIN ART_ARTICULOS_CODCLI A ON C.EMPRESA = A.EMPRESA AND C.' +
        'CLIENTE = A.CLIENTE AND ESC.DETALLE = A.ARTICULO'
      'WHERE'
      'C.ID_S = :ID_S AND'
      'D.ID_DETALLES_S = :ID_DETALLES_S AND'
      'ESC.ID_A_DET = :ID_A')
    SelectSQL.Strings = (
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, ' +
        'C.ID_S, D.ALMACEN, C.FECHA, C.CLIENTE,'
      
        '       T.NOMBRE_R_SOCIAL TITULO_CLIENTE, C.AGENTE, CP.FECHA_ENTR' +
        'EGA_PREV, CP.FECHA_CLIENTE, D.LINEA, D.ARTICULO,'
      
        '       D.TITULO, D.ID_A, D.UNIDADES, D.PRECIO, D.DESCUENTO, D.DE' +
        'SCUENTO_2, D.DESCUENTO_3, D.B_IMPONIBLE, DP.U_SERVIDAS,'
      
        '       DP.U_PENDIENTES, DP.FECHA_ENTREGA_PREV AS FECHA_ENTREGA_A' +
        'RTICULO, DP.FECHA_CONF_DET, A.CODIGO_CLIENTE,'
      
        '       C.SU_REFERENCIA, C.PEDIDO_CLIENTE, DP.FECHA_REC_DET, D.ID_' +
        'DETALLES_S, DP.SERVIDO'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_CABECERAS_S_PED CP ON C.ID_S = CP.ID_S'
      'JOIN GES_DETALLES_S D ON CP.ID_S = D.ID_S'
      'JOIN GES_DETALLES_S_PED DP ON D.ID_DETALLES_S = DP.ID_DETALLES_S'
      
        'JOIN EMP_CLIENTES CL ON C.EMPRESA = CL.EMPRESA AND C.CLIENTE = C' +
        'L.CLIENTE'
      'JOIN SYS_TERCEROS T ON CL.TERCERO = T.TERCERO'
      
        'LEFT JOIN ART_ARTICULOS_CODCLI A ON C.EMPRESA = A.EMPRESA AND C.' +
        'CLIENTE = A.CLIENTE AND D.ARTICULO = A.ARTICULO'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      '((C.SERIE = :DOC_SERIE) OR (:DOC_SERIE LIKE '#39'X%'#39')) AND'
      'C.TIPO = '#39'PEC'#39' AND'
      'DP.U_PENDIENTES > 0 AND'
      'D.ID_A = :ID_A AND'
      'C.ESTADO = 0'
      'UNION'
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, ' +
        'C.ID_S, D.ALMACEN, C.FECHA, C.CLIENTE,'
      
        '       T.NOMBRE_R_SOCIAL TITULO_CLIENTE, C.AGENTE, CP.FECHA_ENTR' +
        'EGA_PREV, CP.FECHA_CLIENTE, D.LINEA, D.ARTICULO,'
      
        '       D.TITULO, D.ID_A, D.UNIDADES, D.PRECIO, D.DESCUENTO, D.DE' +
        'SCUENTO_2, D.DESCUENTO_3, D.B_IMPONIBLE, DP.U_SERVIDAS,'
      
        '       DP.U_PENDIENTES * ESC.CANTIDAD, DP.FECHA_ENTREGA_PREV AS ' +
        'FECHA_ENTREGA_ARTICULO, DP.FECHA_CONF_DET,'
      
        '       A.CODIGO_CLIENTE, C.SU_REFERENCIA, C.PEDIDO_CLIENTE, DP.FE' +
        'CHA_REC_DET, D.ID_DETALLES_S, DP.SERVIDO'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_CABECERAS_S_PED CP ON C.ID_S = CP.ID_S'
      'JOIN GES_DETALLES_S D ON CP.ID_S = D.ID_S'
      'JOIN GES_DETALLES_S_PED DP ON D.ID_DETALLES_S = DP.ID_DETALLES_S'
      'JOIN ART_ARTICULOS_ESCANDALLO ESC ON D.ID_A = ESC.ID_A'
      
        'JOIN EMP_CLIENTES CL ON C.EMPRESA = CL.EMPRESA AND C.CLIENTE = C' +
        'L.CLIENTE'
      'JOIN SYS_TERCEROS T ON CL.TERCERO = T.TERCERO'
      
        'LEFT JOIN ART_ARTICULOS_CODCLI A ON C.EMPRESA = A.EMPRESA AND C.' +
        'CLIENTE = A.CLIENTE AND ESC.DETALLE = A.ARTICULO'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      '((C.SERIE = :DOC_SERIE) OR (:DOC_SERIE LIKE '#39'X%'#39')) AND'
      'C.TIPO = '#39'PEC'#39' AND'
      'DP.U_PENDIENTES > 0 AND'
      'ESC.ID_A_DET = :ID_A AND'
      'C.ESTADO = 0'
      'UNION'
      
        'SELECT O.EMPRESA, O.EJERCICIO, O.CANAL, O.SERIES, '#39'ORD'#39', O.RIG_O' +
        'F, O.ID_ORDEN, M.ALMACEN, O.FECHA_ORD, O.CLIENTE,'
      
        '       T.NOMBRE_R_SOCIAL TITULO_CLIENTE, CL.AGENTE, O.FECHA_ENTR' +
        'EGA, O.FECHA_PED, M.LINEA_MAT, M.COMPONENTE, AR.TITULO,'
      
        '       M.ID_A, M.UNIDADES_STOCK, M.PRE_COS_UNI, 0, 0, 0, 0 /*B_I' +
        'MPONIBLE*/ , 0 /*U_SERVIDAS*/ ,'
      
        '       M.UNIDADES_STOCK /*U_PENDIENTES*/ , O.FECHA_ENTREGA /*FEC' +
        'HA_ENTREGA_ARTICULO*/ ,'
      
        '       O.FECHA_ENTREGA /*FECHA_CONF_DET*/ , A.CODIGO_CLIENTE, '#39#39 +
        ' /*SU_REFERENCIA*/ , '#39#39' /*PEDIDO_CLIENTE*/ ,'
      
        '       O.FECHA_ENTREGA /*FECHA_REC_DET*/ , M.ID_ORDEN_MAT, 0 /*S' +
        'ERVIDO*/'
      'FROM PRO_ORD O'
      'JOIN PRO_ORD_MAT M ON O.ID_ORDEN = M.ID_ORDEN'
      
        'JOIN EMP_CLIENTES CL ON O.EMPRESA = CL.EMPRESA AND O.CLIENTE = C' +
        'L.CLIENTE'
      'JOIN SYS_TERCEROS T ON CL.TERCERO = T.TERCERO'
      
        'JOIN ART_ARTICULOS AR ON M.EMPRESA = AR.EMPRESA AND M.COMPONENTE' +
        ' = AR.ARTICULO'
      
        'LEFT JOIN ART_ARTICULOS_CODCLI A ON O.EMPRESA = A.EMPRESA AND O.' +
        'CLIENTE = A.CLIENTE AND M.COMPONENTE = A.ARTICULO'
      'WHERE'
      'O.EMPRESA = :EMPRESA AND'
      '((O.SERIES = :DOC_SERIE) OR (:DOC_SERIE LIKE '#39'X%'#39')) AND'
      '-- DP.U_PENDIENTES > 0 AND'
      'M.ID_A = :ID_A AND'
      'O.SITUACION < 4'
      'ORDER BY 8, 2 DESC, 6 DESC, 13')
    UniDirectional = False
    Left = 408
    Top = 8
    object xPedidosDeClientesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xPedidosDeClientesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xPedidosDeClientesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xPedidosDeClientesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xPedidosDeClientesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xPedidosDeClientesRIG: TIntegerField
      DisplayLabel = 'Rig'
      FieldName = 'RIG'
    end
    object xPedidosDeClientesID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object xPedidosDeClientesALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xPedidosDeClientesFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xPedidosDeClientesCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xPedidosDeClientesAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xPedidosDeClientesFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'Fec. Prev. Ped.'
      FieldName = 'FECHA_ENTREGA_PREV'
    end
    object xPedidosDeClientesLINEA: TIntegerField
      DisplayLabel = 'Lin.'
      FieldName = 'LINEA'
    end
    object xPedidosDeClientesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xPedidosDeClientesTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object xPedidosDeClientesID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xPedidosDeClientesUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xPedidosDeClientesPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xPedidosDeClientesDESCUENTO: TFloatField
      DisplayLabel = 'Desc.'
      FieldName = 'DESCUENTO'
    end
    object xPedidosDeClientesDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object xPedidosDeClientesDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object xPedidosDeClientesB_IMPONIBLE: TFloatField
      DisplayLabel = 'B.Imp.'
      FieldName = 'B_IMPONIBLE'
    end
    object xPedidosDeClientesU_SERVIDAS: TFloatField
      DisplayLabel = 'Uds. Serv.'
      FieldName = 'U_SERVIDAS'
    end
    object xPedidosDeClientesU_PENDIENTES: TFloatField
      DisplayLabel = 'Uds.Pend.'
      FieldName = 'U_PENDIENTES'
    end
    object xPedidosDeClientesFECHA_ENTREGA_ARTICULO: TDateTimeField
      DisplayLabel = 'Fec. Prev. Det.'
      FieldName = 'FECHA_ENTREGA_ARTICULO'
    end
    object xPedidosDeClientesFECHA_CONF_DET: TDateTimeField
      DisplayLabel = 'Fec. Conf. Det.'
      FieldName = 'FECHA_CONF_DET'
    end
    object xPedidosDeClientesFECHA_CLIENTE: TDateTimeField
      DisplayLabel = 'Fecha Pedido'
      FieldName = 'FECHA_CLIENTE'
    end
    object xPedidosDeClientesCODIGO_CLIENTE: TFIBStringField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'CODIGO_CLIENTE'
      Size = 40
    end
    object xPedidosDeClientesSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xPedidosDeClientesPEDIDO_CLIENTE: TFIBStringField
      DisplayLabel = 'Ped. Cliente'
      FieldName = 'PEDIDO_CLIENTE'
      Size = 60
    end
    object xPedidosDeClientesFECHA_REC_DET: TDateTimeField
      DisplayLabel = 'Fec. Recepcion'
      FieldName = 'FECHA_REC_DET'
    end
    object xPedidosDeClientesTITULO_CLIENTE: TFIBStringField
      DisplayLabel = 'Titulo Cliente'
      FieldName = 'TITULO_CLIENTE'
      Size = 60
    end
    object xPedidosDeClientesID_DETALLES_S: TIntegerField
      DisplayLabel = 'Id Doc. Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object xPedidosDeClientesSERVIDO: TIntegerField
      DisplayLabel = 'Servido'
      FieldName = 'SERVIDO'
    end
  end
  object DSPedidosDeClientes: TDataSource
    DataSet = xPedidosDeClientes
    Left = 504
    Top = 8
  end
  object DSPropuestas: TDataSource
    DataSet = xPropuestas
    Left = 504
    Top = 104
  end
  object xPedidosAProveedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, ' +
        'C.ID_E, D.ALMACEN, C.FECHA, CP.PROVEEDOR,'
      
        '       T.NOMBRE_R_SOCIAL TITULO_PROVEEDOR, CP.FECHA_PRE_CAB, CP.' +
        'FECHA_CONFIRMADA_KRI,'
      
        '       CP.PLAZO_CONFIRM_KRI AS PALZO_CONFIRM_KRI_CAB, CP.PLAZO_I' +
        'NICIAL_KRI,'
      
        '       DP.PLAZO_CONFIRM_KRI AS PALZO_CONFIRM_KRI_DET, D.LINEA, D' +
        '.ARTICULO, D.TITULO, D.ID_A, D.UNIDADES, D.P_COSTE,'
      
        '       D.DESCUENTO, D.DESCUENTO_2, D.DESCUENTO_3, D.B_IMPONIBLE,' +
        ' DP.UNIDADES_SERVIDAS, DP.UNIDADES_POR_SERVIR,'
      
        '       DP.FECHA_CONF_KRI, DP.FECHA_PRE_DET, A.CODIGO_PROVEEDOR, ' +
        'C.SU_REFERENCIA, DP.FECHA_REC_DET, D.ID_DETALLES_E'
      'FROM GES_CABECERAS_E C'
      'JOIN GES_CABECERAS_E_PED CP ON C.ID_E = CP.ID_E'
      'JOIN GES_DETALLES_E D ON CP.ID_E = D.ID_E'
      'JOIN GES_DETALLES_E_PED DP ON D.ID_DETALLES_E = DP.ID_DETALLES_E'
      
        'JOIN EMP_PROVEEDORES P ON CP.EMPRESA = P.EMPRESA AND CP.PROVEEDO' +
        'R = P.PROVEEDOR'
      'JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO'
      
        'LEFT JOIN ART_ARTICULOS_CODPROV A ON C.EMPRESA = A.EMPRESA AND C' +
        'P.PROVEEDOR = A.PROVEEDOR AND D.ARTICULO = A.ARTICULO'
      'WHERE'
      'C.ID_E = :ID_E AND'
      'D.ID_DETALLES_E = :ID_DETALLES_E AND'
      'D.ID_A = :ID_A'
      'UNION'
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, ' +
        'C.ID_E, D.ALMACEN, C.FECHA, CP.PROVEEDOR,'
      
        '       T.NOMBRE_R_SOCIAL TITULO_PROVEEDOR, CP.FECHA_PRE_CAB, CP.' +
        'FECHA_CONFIRMADA_KRI,'
      
        '       CP.PLAZO_CONFIRM_KRI AS PALZO_CONFIRM_KRI_CAB, CP.PLAZO_I' +
        'NICIAL_KRI,'
      
        '       DP.PLAZO_CONFIRM_KRI AS PALZO_CONFIRM_KRI_DET, D.LINEA, D' +
        '.ARTICULO, D.TITULO, D.ID_A, D.UNIDADES, D.P_COSTE,'
      
        '       D.DESCUENTO, D.DESCUENTO_2, D.DESCUENTO_3, D.B_IMPONIBLE,' +
        ' DP.UNIDADES_SERVIDAS,'
      
        '       DP.UNIDADES_POR_SERVIR * ESC.CANTIDAD, DP.FECHA_CONF_KRI,' +
        ' DP.FECHA_PRE_DET, A.CODIGO_PROVEEDOR, C.SU_REFERENCIA,'
      '       DP.FECHA_REC_DET, D.ID_DETALLES_E'
      'FROM GES_CABECERAS_E C'
      'JOIN GES_CABECERAS_E_PED CP ON C.ID_E = CP.ID_E'
      'JOIN GES_DETALLES_E D ON CP.ID_E = D.ID_E'
      'JOIN GES_DETALLES_E_PED DP ON D.ID_DETALLES_E = DP.ID_DETALLES_E'
      
        'JOIN EMP_PROVEEDORES P ON CP.EMPRESA = P.EMPRESA AND CP.PROVEEDO' +
        'R = P.PROVEEDOR'
      'JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO'
      'JOIN ART_ARTICULOS_ESCANDALLO ESC ON D.ID_A = ESC.ID_A'
      
        'LEFT JOIN ART_ARTICULOS_CODPROV A ON C.EMPRESA = A.EMPRESA AND C' +
        'P.PROVEEDOR = A.PROVEEDOR AND ESC.DETALLE = A.ARTICULO'
      'WHERE'
      'C.ID_E = :ID_E AND'
      'D.ID_DETALLES_E = :ID_DETALLES_E AND'
      'D.ID_A = :ID_A')
    SelectSQL.Strings = (
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, ' +
        'C.ID_E, D.ALMACEN, C.FECHA, CP.PROVEEDOR,'
      
        '       T.NOMBRE_R_SOCIAL TITULO_PROVEEDOR, CP.FECHA_PRE_CAB, CP.' +
        'FECHA_CONFIRMADA_KRI,'
      
        '       CP.PLAZO_CONFIRM_KRI AS PALZO_CONFIRM_KRI_CAB, CP.PLAZO_I' +
        'NICIAL_KRI,'
      
        '       DP.PLAZO_CONFIRM_KRI AS PALZO_CONFIRM_KRI_DET, D.LINEA, D' +
        '.ARTICULO, D.TITULO, D.ID_A, D.UNIDADES, D.P_COSTE,'
      
        '       D.DESCUENTO, D.DESCUENTO_2, D.DESCUENTO_3, D.B_IMPONIBLE,' +
        ' DP.UNIDADES_SERVIDAS, DP.UNIDADES_POR_SERVIR,'
      
        '       DP.FECHA_CONF_KRI, DP.FECHA_PRE_DET, A.CODIGO_PROVEEDOR, ' +
        'C.SU_REFERENCIA, DP.FECHA_REC_DET, D.ID_DETALLES_E, DP.LINEA_SER' +
        'VIDA'
      'FROM GES_CABECERAS_E C'
      'JOIN GES_CABECERAS_E_PED CP ON C.ID_E = CP.ID_E'
      'JOIN GES_DETALLES_E D ON CP.ID_E = D.ID_E'
      'JOIN GES_DETALLES_E_PED DP ON D.ID_DETALLES_E = DP.ID_DETALLES_E'
      
        'JOIN EMP_PROVEEDORES P ON CP.EMPRESA = P.EMPRESA AND CP.PROVEEDO' +
        'R = P.PROVEEDOR'
      'JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO'
      
        'LEFT JOIN ART_ARTICULOS_CODPROV A ON C.EMPRESA = A.EMPRESA AND C' +
        'P.PROVEEDOR = A.PROVEEDOR AND D.ARTICULO = A.ARTICULO'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      '((C.SERIE = :DOC_SERIE) OR (:DOC_SERIE LIKE '#39'X%'#39')) AND'
      'C.TIPO = '#39'PEP'#39' AND'
      'D.ID_A = :ID_A AND'
      'ABS(DP.UNIDADES_POR_SERVIR) > 0.001 AND'
      'C.ESTADO = 0'
      'UNION'
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, ' +
        'C.ID_E, D.ALMACEN, C.FECHA, CP.PROVEEDOR,'
      
        '       T.NOMBRE_R_SOCIAL TITULO_PROVEEDOR, CP.FECHA_PRE_CAB, CP.' +
        'FECHA_CONFIRMADA_KRI,'
      
        '       CP.PLAZO_CONFIRM_KRI AS PALZO_CONFIRM_KRI_CAB, CP.PLAZO_I' +
        'NICIAL_KRI,'
      
        '       DP.PLAZO_CONFIRM_KRI AS PALZO_CONFIRM_KRI_DET, D.LINEA, D' +
        '.ARTICULO, D.TITULO, D.ID_A, D.UNIDADES, D.P_COSTE,'
      
        '       D.DESCUENTO, D.DESCUENTO_2, D.DESCUENTO_3, D.B_IMPONIBLE,' +
        ' DP.UNIDADES_SERVIDAS,'
      
        '       DP.UNIDADES_POR_SERVIR * ESC.CANTIDAD, DP.FECHA_CONF_KRI,' +
        ' DP.FECHA_PRE_DET, A.CODIGO_PROVEEDOR, C.SU_REFERENCIA,'
      '       DP.FECHA_REC_DET, D.ID_DETALLES_E, DP.LINEA_SERVIDA'
      'FROM GES_CABECERAS_E C'
      'JOIN GES_CABECERAS_E_PED CP ON C.ID_E = CP.ID_E'
      'JOIN GES_DETALLES_E D ON CP.ID_E = D.ID_E'
      'JOIN GES_DETALLES_E_PED DP ON D.ID_DETALLES_E = DP.ID_DETALLES_E'
      
        'JOIN EMP_PROVEEDORES P ON CP.EMPRESA = P.EMPRESA AND CP.PROVEEDO' +
        'R = P.PROVEEDOR'
      'JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO'
      'JOIN ART_ARTICULOS_ESCANDALLO ESC ON D.ID_A = ESC.ID_A'
      
        'LEFT JOIN ART_ARTICULOS_CODPROV A ON C.EMPRESA = A.EMPRESA AND C' +
        'P.PROVEEDOR = A.PROVEEDOR AND ESC.DETALLE = A.ARTICULO'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      '((C.SERIE = :DOC_SERIE) OR (:DOC_SERIE LIKE '#39'X%'#39')) AND'
      'C.TIPO = '#39'PEP'#39' AND'
      'ESC.ID_A_DET = :ID_A AND'
      'ABS(DP.UNIDADES_POR_SERVIR) > 0.001 AND'
      'C.ESTADO = 0'
      'ORDER BY 8, 2 DESC, 6 DESC, 13')
    UniDirectional = False
    Left = 408
    Top = 56
    object xPedidosAProveedorEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xPedidosAProveedorEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xPedidosAProveedorCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xPedidosAProveedorSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xPedidosAProveedorTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xPedidosAProveedorRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xPedidosAProveedorID_E: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_E'
    end
    object xPedidosAProveedorALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xPedidosAProveedorFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xPedidosAProveedorPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xPedidosAProveedorFECHA_PRE_CAB: TDateTimeField
      DisplayLabel = 'Fec. Ent. Ped.'
      FieldName = 'FECHA_PRE_CAB'
    end
    object xPedidosAProveedorLINEA: TIntegerField
      DisplayLabel = 'Lin.'
      FieldName = 'LINEA'
    end
    object xPedidosAProveedorARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xPedidosAProveedorTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      DisplayWidth = 256
      FieldName = 'TITULO'
      Size = 256
    end
    object xPedidosAProveedorID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xPedidosAProveedorUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xPedidosAProveedorP_COSTE: TFloatField
      DisplayLabel = 'P.Coste'
      FieldName = 'P_COSTE'
    end
    object xPedidosAProveedorDESCUENTO: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO'
    end
    object xPedidosAProveedorDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object xPedidosAProveedorDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object xPedidosAProveedorB_IMPONIBLE: TFloatField
      DisplayLabel = 'B.Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object xPedidosAProveedorUNIDADES_SERVIDAS: TFloatField
      DisplayLabel = 'Uds.Serv.'
      FieldName = 'UNIDADES_SERVIDAS'
    end
    object xPedidosAProveedorUNIDADES_POR_SERVIR: TFloatField
      DisplayLabel = 'Uds.Pend.'
      FieldName = 'UNIDADES_POR_SERVIR'
    end
    object xPedidosAProveedorFECHA_CONF_KRI: TDateTimeField
      DisplayLabel = 'Fec. Conf. Det.'
      FieldName = 'FECHA_CONF_KRI'
    end
    object xPedidosAProveedorFECHA_PRE_DET: TDateTimeField
      DisplayLabel = 'Fec. Prev. Det.'
      FieldName = 'FECHA_PRE_DET'
    end
    object xPedidosAProveedorFECHA_CONFIRMADA_KRI: TDateTimeField
      DisplayLabel = 'Fec. Conf. Cab.'
      FieldName = 'FECHA_CONFIRMADA_KRI'
    end
    object xPedidosAProveedorPALZO_CONFIRM_KRI_CAB: TDateTimeField
      DisplayLabel = 'Plazo Conf. Cab.'
      FieldName = 'PALZO_CONFIRM_KRI_CAB'
    end
    object xPedidosAProveedorPLAZO_INICIAL_KRI: TDateTimeField
      DisplayLabel = 'Plazo Inicial'
      FieldName = 'PLAZO_INICIAL_KRI'
    end
    object xPedidosAProveedorPALZO_CONFIRM_KRI_DET: TDateTimeField
      DisplayLabel = 'Plazo Conf. Det.'
      FieldName = 'PALZO_CONFIRM_KRI_DET'
    end
    object xPedidosAProveedorCODIGO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Cod. Prov.'
      FieldName = 'CODIGO_PROVEEDOR'
      Size = 40
    end
    object xPedidosAProveedorSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xPedidosAProveedorFECHA_REC_DET: TDateTimeField
      DisplayLabel = 'Fec. Recepcion'
      FieldName = 'FECHA_REC_DET'
    end
    object xPedidosAProveedorTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Titulo Proveedor'
      FieldName = 'TITULO_PROVEEDOR'
      Size = 60
    end
    object xPedidosAProveedorID_DETALLES_E: TIntegerField
      DisplayLabel = 'Id Doc. Det.'
      FieldName = 'ID_DETALLES_E'
    end
    object xPedidosAProveedorLINEA_SERVIDA: TIntegerField
      DisplayLabel = 'Servido'
      FieldName = 'LINEA_SERVIDA'
    end
  end
  object DSQMProyectos: TDataSource
    AutoEdit = False
    DataSet = QMProyectos
    Left = 504
    Top = 248
  end
  object QMProyectos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CUENTAS_GES_ART_PROY'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  PROYECTO=?old_PROYECTO AND '
      '  ARTICULO=?old_ARTICULO ')
    InsertSQL.Strings = (
      'INSERT INTO CON_CUENTAS_GES_ART_PROY'
      
        '  (ID_C_A,PROYECTO,EMPRESA,EJERCICIO,CANAL,ARTICULO,CTA_COMPRAS,' +
        'CTA_VENTAS,CTA_DEVOLUCION_COMPRAS,CTA_DEVOLUCION_VENTAS,CTA_ABON' +
        'O_COMPRAS,CTA_ABONO_VENTAS)'
      'VALUES'
      
        '  (?ID_C_A,?PROYECTO,?EMPRESA,?EJERCICIO,?CANAL,?ARTICULO,?CTA_C' +
        'OMPRAS,?CTA_VENTAS,?CTA_DEVOLUCION_COMPRAS,?CTA_DEVOLUCION_VENTA' +
        'S,?CTA_ABONO_COMPRAS,?CTA_ABONO_VENTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_GES_ART_PROY'
      'WHERE'
      '  ARTICULO=?ARTICULO AND '
      '  PROYECTO=?PROYECTO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM CON_CUENTAS_GES_ART_PROY'
      'WHERE'
      '  ID_C_A = ?ID_C_A')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CUENTAS_GES_ART_PROY'
      'SET'
      '  ARTICULO = ?ARTICULO'
      '  ,CTA_COMPRAS=?CTA_COMPRAS '
      '  ,CTA_VENTAS=?CTA_VENTAS '
      '  ,CTA_DEVOLUCION_COMPRAS=?CTA_DEVOLUCION_COMPRAS '
      '  ,CTA_DEVOLUCION_VENTAS=?CTA_DEVOLUCION_VENTAS '
      '  ,CTA_ABONO_COMPRAS=?CTA_ABONO_COMPRAS '
      '  ,CTA_ABONO_VENTAS=?CTA_ABONO_VENTAS '
      'WHERE'
      '  ID_C_A = ?ID_C_A AND'
      '  PROYECTO=?PROYECTO')
    AutoCalcFields = False
    DataSource = DSQMArticulos
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMSeriesNewRecord
    ClavesPrimarias.Strings = (
      'ARTICULO '
      'PROYECTO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CUENTAS_GES_ART_PROY'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 408
    Top = 248
    object QMProyectosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProyectosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProyectosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProyectosPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMProyectosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMProyectosCTA_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Compras'
      FieldName = 'CTA_COMPRAS'
      Size = 15
    end
    object QMProyectosCTA_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Ventas'
      FieldName = 'CTA_VENTAS'
      Size = 15
    end
    object QMProyectosID_C_A: TIntegerField
      DisplayLabel = 'ID Art. Canal'
      FieldName = 'ID_C_A'
    end
    object QMProyectosCTA_DEVOLUCION_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Compras'
      FieldName = 'CTA_DEVOLUCION_COMPRAS'
      Size = 15
    end
    object QMProyectosCTA_DEVOLUCION_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Ventas'
      FieldName = 'CTA_DEVOLUCION_VENTAS'
      Size = 15
    end
    object QMProyectosCTA_ABONO_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Abono Compras'
      FieldName = 'CTA_ABONO_COMPRAS'
      Size = 15
    end
    object QMProyectosCTA_ABONO_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Abono Ventas'
      FieldName = 'CTA_ABONO_VENTAS'
      Size = 15
    end
  end
  object DSQMProyectosSeries: TDataSource
    AutoEdit = False
    DataSet = QMProyectosSeries
    Left = 504
    Top = 296
  end
  object QMProyectosSeries: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CUENTAS_GES_ART_PROY_EECS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  PROYECTO=?old_PROYECTO AND '
      '  SERIE =?old_SERIE AND'
      '  ARTICULO=?old_ARTICULO')
    InsertSQL.Strings = (
      'INSERT INTO CON_CUENTAS_GES_ART_PROY_EECS'
      
        '  (ID_C_A,PROYECTO,SERIE,EMPRESA,EJERCICIO,CANAL,ARTICULO,CTA_CO' +
        'MPRAS,CTA_VENTAS,CTA_DEVOLUCION_COMPRAS,CTA_DEVOLUCION_VENTAS,CT' +
        'A_ABONO_COMPRAS,CTA_ABONO_VENTAS)'
      'VALUES'
      
        '  (?ID_C_A,?PROYECTO,?SERIE,?EMPRESA,?EJERCICIO,?CANAL,?ARTICULO' +
        ',?CTA_COMPRAS,?CTA_VENTAS,?CTA_DEVOLUCION_COMPRAS,?CTA_DEVOLUCIO' +
        'N_VENTAS,?CTA_ABONO_COMPRAS,?CTA_ABONO_VENTAS)'
      '')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_GES_ART_PROY_EECS'
      'WHERE'
      '  ARTICULO=?ARTICULO AND '
      '  SERIE=?SERIE AND '
      '  PROYECTO=?PROYECTO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM CON_CUENTAS_GES_ART_PROY_EECS'
      'WHERE'
      '  ID_C_A = ?ID_C_A')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CUENTAS_GES_ART_PROY_EECS'
      'SET'
      '  ARTICULO = ?ARTICULO'
      '  ,CTA_COMPRAS=?CTA_COMPRAS '
      '  ,CTA_VENTAS=?CTA_VENTAS '
      '  ,CTA_DEVOLUCION_COMPRAS=?CTA_DEVOLUCION_COMPRAS '
      '  ,CTA_DEVOLUCION_VENTAS=?CTA_DEVOLUCION_VENTAS '
      '  ,CTA_ABONO_COMPRAS=?CTA_ABONO_COMPRAS '
      '  ,CTA_ABONO_VENTAS=?CTA_ABONO_VENTAS '
      'WHERE'
      '  ID_C_A = ?ID_C_A AND'
      '  PROYECTO = ?PROYECTO AND'
      '  SERIE = ?SERIE')
    AutoCalcFields = False
    DataSource = DSQMArticulos
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMSeriesNewRecord
    ClavesPrimarias.Strings = (
      'ARTICULO '
      'SERIE '
      'PROYECTO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CUENTAS_GES_ART_PROY_EECS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 408
    Top = 296
    object QMProyectosSeriesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProyectosSeriesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMProyectosSeriesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMProyectosSeriesPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMProyectosSeriesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMProyectosSeriesCTA_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Compras'
      FieldName = 'CTA_COMPRAS'
      Size = 15
    end
    object QMProyectosSeriesCTA_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Ventas'
      FieldName = 'CTA_VENTAS'
      Size = 15
    end
    object QMProyectosSeriesID_C_A: TIntegerField
      DisplayLabel = 'ID Art. Canal'
      FieldName = 'ID_C_A'
    end
    object QMProyectosSeriesCTA_DEVOLUCION_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Compras'
      FieldName = 'CTA_DEVOLUCION_COMPRAS'
      Size = 15
    end
    object QMProyectosSeriesCTA_DEVOLUCION_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Ventas'
      FieldName = 'CTA_DEVOLUCION_VENTAS'
      Size = 15
    end
    object QMProyectosSeriesCTA_ABONO_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Abono Compras'
      FieldName = 'CTA_ABONO_COMPRAS'
      Size = 15
    end
    object QMProyectosSeriesCTA_ABONO_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Abono Ventas'
      FieldName = 'CTA_ABONO_VENTAS'
      Size = 15
    end
    object QMProyectosSeriesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
  end
  object QMArtStocks: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT S.*, COALESCE((SELECT SUM(MAT.UNIDADES_STOCK)'
      '                      FROM PRO_ORD_MAT MAT'
      
        '                      JOIN PRO_ORD ORD ON (ORD.ID_ORDEN = MAT.ID' +
        '_ORDEN)'
      '                      WHERE'
      '                      MAT.EMPRESA = S.EMPRESA AND'
      '                      MAT.CANAL = S.CANAL AND'
      '                      MAT.EJERCICIO <= 3000 AND'
      '                      MAT.ALMACEN = S.ALMACEN AND'
      '                      MAT.COMPONENTE = S.ARTICULO AND'
      '                      ORD.SITUACION = 1), 0) LANZADAS, --'
      '       COALESCE((SELECT SUM(D.UNIDADES)'
      '                 FROM GES_DETALLES_S D'
      '                 JOIN GES_CABECERAS_S C ON D.ID_S = C.ID_S'
      '                 JOIN GES_CABECERAS_S_PED CP ON D.ID_S = CP.ID_S'
      '                 WHERE'
      '                 D.EMPRESA = S.EMPRESA AND'
      '                 D.CANAL = S.CANAL AND'
      '                 D.ALMACEN = S.ALMACEN AND'
      '                 D.ARTICULO = S.ARTICULO AND'
      '                 C.ESTADO = 0 AND'
      '                 CP.SERVIDO = 1), 0) PREPARACION'
      
        'FROM A_ART_DAME_STOCK_ART_ED(:EMPRESA, :CANAL, :ARTICULO, :ALMAC' +
        'EN, 1, 1, 1 /*DJI LRK KRI*/ , 1 /*DJI LRK KRI*/ , 0, 0, 0, NULL)' +
        ' S'
      'WHERE'
      'S.EMPRESA = :EMPRESA AND'
      'S.CANAL = :CANAL AND'
      'S.ALMACEN = :ALMACEN AND'
      'S.ARTICULO = :ARTICULO')
    SelectSQL.Strings = (
      'SELECT S.*, COALESCE((SELECT SUM(MAT.UNIDADES_STOCK)'
      '                      FROM PRO_ORD_MAT MAT'
      
        '                      JOIN PRO_ORD ORD ON (ORD.ID_ORDEN = MAT.ID' +
        '_ORDEN)'
      '                      WHERE'
      '                      MAT.EMPRESA = S.EMPRESA AND'
      '                      MAT.CANAL = S.CANAL AND'
      '                      MAT.EJERCICIO <= 3000 AND'
      '                      MAT.ALMACEN = S.ALMACEN AND'
      '                      MAT.COMPONENTE = S.ARTICULO AND'
      '                      ORD.SITUACION = 1), 0) LANZADAS, --'
      '       COALESCE((SELECT SUM(D.UNIDADES)'
      '                 FROM GES_DETALLES_S D'
      '                 JOIN GES_CABECERAS_S C ON D.ID_S = C.ID_S'
      '                 JOIN GES_CABECERAS_S_PED CP ON D.ID_S = CP.ID_S'
      '                 WHERE'
      '                 D.EMPRESA = S.EMPRESA AND'
      '                 D.CANAL = S.CANAL AND'
      '                 D.ALMACEN = S.ALMACEN AND'
      '                 D.ARTICULO = S.ARTICULO AND'
      '                 C.ESTADO = 0 AND'
      '                 CP.SERVIDO = 1), 0) PREPARACION'
      
        'FROM A_ART_DAME_STOCK_ART_ED(:EMPRESA, :CANAL, :ARTICULO, '#39#39', 1,' +
        ' 1, 1 /*DJI LRK KRI*/ , 1 /*DJI LRK KRI*/ , 0, 0, 0, NULL) S'
      'WHERE'
      'S.EMPRESA = :EMPRESA AND'
      'S.CANAL = :CANAL'
      'ORDER BY S.ALMACEN, S.CANAL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      
        'EXECUTE PROCEDURE A_ART_ACTUALIZA_STOCK_MIN_MAX(?EMPRESA, ?CANAL' +
        ', ?ALMACEN, ?ARTICULO, ?STOCK_MINIMO, ?STOCK_MAXIMO,?AVISO_STOCK' +
        '_MINIMO, ?ALMACEN_DEFECTO)')
    DataSource = DSQMArticulos
    AfterPost = QMArtStocksAfterPost
    BeforeClose = QMArtStocksBeforeClose
    BeforeEdit = QMArtStocksBeforeEdit
    OnCalcFields = QMArtStocksCalcFields
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ART_STOCKS_EDICION'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 216
    Top = 56
    object QMArtStocksEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMArtStocksCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMArtStocksALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMArtStocksARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMArtStocksEXISTENCIAS: TFloatField
      DisplayLabel = 'Existencias'
      FieldName = 'EXISTENCIAS'
    end
    object QMArtStocksENTRADAS: TFloatField
      DisplayLabel = 'Entradas'
      FieldName = 'ENTRADAS'
    end
    object QMArtStocksVALOR_ENTRADAS: TFloatField
      DisplayLabel = 'Valor Entradas'
      FieldName = 'VALOR_ENTRADAS'
    end
    object QMArtStocksSALIDAS: TFloatField
      DisplayLabel = 'Salidas'
      FieldName = 'SALIDAS'
    end
    object QMArtStocksVALOR_SALIDAS: TFloatField
      DisplayLabel = 'Valor Salidas'
      FieldName = 'VALOR_SALIDAS'
    end
    object QMArtStocksP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMArtStocksPMP: TFloatField
      DisplayLabel = 'P.M.P.'
      FieldName = 'PMP'
    end
    object QMArtStocksSTOCK_MINIMO: TFloatField
      DisplayLabel = 'Stock Min.'
      FieldName = 'STOCK_MINIMO'
    end
    object QMArtStocksSTOCK_MAXIMO: TFloatField
      DisplayLabel = 'Stock Max.'
      FieldName = 'STOCK_MAXIMO'
    end
    object QMArtStocksPEDIDOS_A_PRO: TFloatField
      DisplayLabel = 'Ped. Prov.'
      FieldName = 'PEDIDOS_A_PRO'
    end
    object QMArtStocksPEDIDOS_D_CLI: TFloatField
      DisplayLabel = 'Ped. cli.'
      FieldName = 'PEDIDOS_D_CLI'
    end
    object QMArtStocksPEDIDOS_A_TMP: TFloatField
      DisplayLabel = 'Ped. a Tmp.'
      FieldName = 'PEDIDOS_A_TMP'
    end
    object QMArtStocksSTOCK_VIRTUAL: TFloatField
      DisplayLabel = 'Stock virtual'
      FieldName = 'STOCK_VIRTUAL'
    end
    object QMArtStocksRESERVADAS: TFloatField
      DisplayLabel = 'Reservadas'
      FieldName = 'RESERVADAS'
    end
    object QMArtStocksDISPONIBLES: TFloatField
      DisplayLabel = 'Disponibles'
      FieldName = 'DISPONIBLES'
    end
    object QMArtStocksEN_PROCESO_PROD: TFloatField
      DisplayLabel = 'En Proc. Prod.'
      FieldName = 'EN_PROCESO_PROD'
    end
    object QMArtStocksTITULO_ALM: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_ALM'
      Size = 60
    end
    object QMArtStocksTITULO_ART: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_ART'
      Size = 256
    end
    object QMArtStocksVALOR_EXISTENCIAS: TFloatField
      DisplayLabel = 'Valor Existencias'
      FieldName = 'VALOR_EXISTENCIAS'
    end
    object QMArtStocksID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMArtStocksExistFabr: TFloatField
      DisplayLabel = 'Exist. Fab.'
      FieldKind = fkCalculated
      FieldName = 'ExistFabr'
      OnGetText = QMArtStocksExistFabrGetText
      Calculated = True
    end
    object QMArtStocksfabricables: TFloatField
      DisplayLabel = 'Fabricables'
      FieldKind = fkCalculated
      FieldName = 'fabricables'
      OnGetText = QMArtStocksfabricablesGetText
      Calculated = True
    end
    object QMArtStocksEXISTENCIAS_EXT: TFloatField
      DisplayLabel = 'Exist. Ext.'
      FieldName = 'EXISTENCIAS_EXT'
    end
    object QMArtStocksLANZADAS: TFloatField
      DisplayLabel = 'Lanzadas'
      FieldName = 'LANZADAS'
    end
    object QMArtStocksAVISO_STOCK_MINIMO: TIntegerField
      DisplayLabel = 'Aviso Stock Minimo'
      FieldName = 'AVISO_STOCK_MINIMO'
    end
    object QMArtStocksALMACEN_DEFECTO: TIntegerField
      DisplayLabel = 'Alm. def.'
      FieldName = 'ALMACEN_DEFECTO'
    end
    object QMArtStocksSTOCK_REAL: TFloatField
      DisplayLabel = 'Stock Real'
      FieldKind = fkCalculated
      FieldName = 'STOCK_REAL'
      Calculated = True
    end
    object QMArtStocksEXISTENCIAS_REALES: TFloatField
      DisplayLabel = 'Exist. Reales'
      FieldName = 'EXISTENCIAS_REALES'
    end
    object QMArtStocksPREPARADAS: TFloatField
      DisplayLabel = 'Preparadas'
      FieldName = 'PREPARADAS'
    end
    object QMArtStocksPREPARACION: TFloatField
      DisplayLabel = 'En Preparacion'
      FieldName = 'PREPARACION'
    end
  end
  object DSQMArtStocks: TDataSource
    DataSet = QMArtStocks
    Left = 312
    Top = 56
  end
  object xTiposPreciosBase: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPO_PRECIO_BASE'
      'WHERE TIPO_PRECIO_BASE = ?TIPO_PRECIO_BASE')
    UniDirectional = False
    DataSource = DSQMArticulosPrecios
    Plan.Strings = (
      'PLAN (SYS_TIPO_REDONDEOS INDEX (PK_SYS_TIPO_REDONDEOS))')
    Left = 24
    Top = 344
  end
  object DSxTiposPreciosBase: TDataSource
    DataSet = xTiposPreciosBase
    Left = 120
    Top = 344
  end
  object DSPedidosAProveedor: TDataSource
    DataSet = xPedidosAProveedor
    Left = 504
    Top = 56
  end
  object DSPropuestasConfir: TDataSource
    DataSet = xPropuestasConfir
    Left = 504
    Top = 152
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 992
    Top = 56
  end
  object DSQMStockUbicaciones: TDataSource
    DataSet = QMStockUbicaciones
    Left = 312
    Top = 392
  end
  object QMStockUbicaciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT EMPRESA, ALMACEN, CALLE, ESTANTERIA, REPISA, POSICION, AR' +
        'TICULO, TITULO, COMPOSICION, TITULO_COMP, ID_A,'
      
        '       SUM(ENTRADAS) AS ENTRADAS, SUM(SALIDAS) AS SALIDAS, SUM(E' +
        'XISTENCIAS) AS EXISTENCIAS, ID_A_UBICACION,'
      '       ID_UBICACION, GENERAL, DISPONIBLE'
      'FROM VER_ART_STOCKS_UBICACIONES'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ARTICULO = :ARTICULO AND'
      '/* CANAL = :CANAL  AND */'
      'ALMACEN = :ALMACEN AND'
      'ID_A_UBICACION = :ID_A_UBICACION'
      
        'GROUP BY COMPOSICION, EMPRESA, ALMACEN, CALLE, ESTANTERIA, REPIS' +
        'A, POSICION, ARTICULO, TITULO,'
      
        '         TITULO_COMP, ID_A, ID_A_UBICACION, ID_UBICACION, GENERA' +
        'L, DISPONIBLE  ')
    SelectSQL.Strings = (
      
        'SELECT EMPRESA, ALMACEN, CALLE, ESTANTERIA, REPISA, POSICION, AR' +
        'TICULO, TITULO, COMPOSICION, TITULO_COMP, ID_A,'
      
        '       SUM(ENTRADAS) AS ENTRADAS, SUM(SALIDAS) AS SALIDAS, SUM(E' +
        'XISTENCIAS) AS EXISTENCIAS, ID_A_UBICACION,'
      '       ID_UBICACION, GENERAL, DISPONIBLE'
      'FROM VER_ART_STOCKS_UBICACIONES'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ARTICULO = :ARTICULO AND'
      '/* CANAL = :CANAL  AND */'
      'ALMACEN = :ALMACEN'
      '--IF (FSOLOUBICACIONCONSTOCK) THEN'
      '    AND EXISTENCIAS <> 0'
      
        'GROUP BY COMPOSICION, EMPRESA, ALMACEN, CALLE, ESTANTERIA, REPIS' +
        'A, POSICION, ARTICULO, TITULO,'
      
        '         TITULO_COMP, ID_A, ID_A_UBICACION, ID_UBICACION, GENERA' +
        'L, DISPONIBLE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMArtStocks
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ART_STOCKS_UBICACIONES'
    BloqOpt = True
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 216
    Top = 392
    object QMStockUbicacionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMStockUbicacionesALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMStockUbicacionesCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMStockUbicacionesESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanteria'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMStockUbicacionesREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMStockUbicacionesPOSICION: TFIBStringField
      DisplayLabel = 'Posici'#243'n'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMStockUbicacionesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMStockUbicacionesTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMStockUbicacionesCOMPOSICION: TFIBStringField
      DisplayLabel = 'Composici'#243'n'
      FieldName = 'COMPOSICION'
      Size = 15
    end
    object QMStockUbicacionesTITULO_COMP: TFIBStringField
      DisplayLabel = 'Titulo Comp'
      FieldName = 'TITULO_COMP'
      Size = 60
    end
    object QMStockUbicacionesID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMStockUbicacionesENTRADAS: TFloatField
      DisplayLabel = 'Entradas'
      FieldName = 'ENTRADAS'
    end
    object QMStockUbicacionesSALIDAS: TFloatField
      DisplayLabel = 'Salidas'
      FieldName = 'SALIDAS'
    end
    object QMStockUbicacionesEXISTENCIAS: TFloatField
      DisplayLabel = 'Existencias'
      FieldName = 'EXISTENCIAS'
    end
    object QMStockUbicacionesID_A_UBICACION: TIntegerField
      DisplayLabel = 'ID Art Ubic.'
      FieldName = 'ID_A_UBICACION'
    end
    object QMStockUbicacionesID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubicaci'#243'n'
      FieldName = 'ID_UBICACION'
    end
    object QMStockUbicacionesGENERAL: TIntegerField
      DisplayLabel = 'General'
      FieldName = 'GENERAL'
    end
    object QMStockUbicacionesDISPONIBLE: TIntegerField
      DisplayLabel = 'Disponible'
      FieldName = 'DISPONIBLE'
    end
  end
  object QMNrosLote: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT * FROM A_ART_STOCK_LOTE(:EMPRESA, :ARTICULO, :CANAL, :ALM' +
        'ACEN, -1 /* TODAS LAS UBIACIONES */ ) L'
      
        'JOIN ART_ALMACENES_UBICACIONES U ON L.ID_UBICACION = U.ID_UBICAC' +
        'ION'
      'WHERE'
      'L.ID_LOTE = :ID_LOTE AND'
      'L.ID_UBICACION = :ID_UBICACION')
    SelectSQL.Strings = (
      
        'SELECT * FROM A_ART_STOCK_LOTE(:EMPRESA, :ARTICULO, :CANAL, :ALM' +
        'ACEN, -1 /* TODAS LAS UBIACIONES */ ) L'
      
        'LEFT JOIN ART_ALMACENES_UBICACIONES U ON L.ID_UBICACION = U.ID_U' +
        'BICACION'
      'WHERE'
      'L.STOCK <> 0'
      'ORDER BY L.CANAL, L.LOTE, U.COMPOSICION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMArtStocks
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'NRO_SERIE_KRI'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 440
    object QMNrosLoteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMNrosLoteCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMNrosLoteARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMNrosLoteLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMNrosLoteSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMNrosLoteCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificacion'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object QMNrosLoteF_ENVASADO: TDateTimeField
      DisplayLabel = 'F. Env.'
      FieldName = 'F_ENVASADO'
    end
    object QMNrosLoteF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'F. Cad.'
      FieldName = 'F_CADUCIDAD'
    end
    object QMNrosLoteF_FABRICACION: TDateTimeField
      DisplayLabel = 'F. Fab.'
      FieldName = 'F_FABRICACION'
    end
    object QMNrosLoteID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMNrosLoteAUTO_REETIQUETADO: TIntegerField
      DisplayLabel = 'Auto Reetiq.'
      FieldName = 'AUTO_REETIQUETADO'
    end
    object QMNrosLoteCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object QMNrosLotePROVEEDOR: TIntegerField
      DisplayLabel = 'Prov.'
      FieldName = 'PROVEEDOR'
    end
    object QMNrosLoteID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMNrosLoteALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMNrosLoteSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object QMNrosLoteID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ub.'
      FieldName = 'ID_UBICACION'
    end
    object QMNrosLoteID_A_UBICACION: TIntegerField
      DisplayLabel = 'ID Art. Ubi.'
      FieldName = 'ID_A_UBICACION'
    end
    object QMNrosLoteCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMNrosLoteESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanteria'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMNrosLoteREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMNrosLotePOSICION: TFIBStringField
      DisplayLabel = 'Posicion'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMNrosLoteTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMNrosLoteVOLUMEN_MAX: TFloatField
      DisplayLabel = 'Vol Max.'
      FieldName = 'VOLUMEN_MAX'
    end
    object QMNrosLoteDIAMETRO_MAX: TFloatField
      DisplayLabel = 'Diam. Max.'
      FieldName = 'DIAMETRO_MAX'
    end
    object QMNrosLotePESO_MAX: TFloatField
      DisplayLabel = 'Peso Max.'
      FieldName = 'PESO_MAX'
    end
    object QMNrosLoteVOLUMEN_ACC: TFloatField
      DisplayLabel = 'Vol. Acc.'
      FieldName = 'VOLUMEN_ACC'
    end
    object QMNrosLotePESO_ACC: TFloatField
      DisplayLabel = 'Peso Acc.'
      FieldName = 'PESO_ACC'
    end
    object QMNrosLoteDIAMETRO_ACC: TFloatField
      DisplayLabel = 'Diam. Acc.'
      FieldName = 'DIAMETRO_ACC'
    end
    object QMNrosLoteCOMPOSICION: TFIBStringField
      DisplayLabel = 'Composicion'
      FieldName = 'COMPOSICION'
      Size = 15
    end
    object QMNrosLoteGENERAL: TIntegerField
      DisplayLabel = 'General'
      FieldName = 'GENERAL'
    end
    object QMNrosLoteUNIDADES_ACC: TFloatField
      DisplayLabel = 'Uds. Acc.'
      FieldName = 'UNIDADES_ACC'
    end
    object QMNrosLoteTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 5
    end
    object QMNrosLoteSECTOR: TFIBStringField
      DisplayLabel = 'Sector'
      FieldName = 'SECTOR'
      Size = 5
    end
    object QMNrosLoteDISPONIBLE: TIntegerField
      DisplayLabel = 'Disponible'
      FieldName = 'DISPONIBLE'
    end
  end
  object DSNrosLote: TDataSource
    DataSet = QMNrosLote
    Left = 120
    Top = 440
  end
  object QMNroSerieKRI: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM NRO_SERIE_KRI'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO NRO_SERIE_KRI'
      
        '  (FECHA_DEC,FECHA_ENT,FECHA_SAL,FECHA_MOV,FECHA_GAR,CADUCIDAD,F' +
        'ECHA_DEV,FECHA_MOE,FECHA_MOS,RIG_DEC,SERIE_DEC,SERIE_ENT,RIG_ENT' +
        ',PROVEEDOR,SERIE_SAL,RIG_SAL,CLIENTE,SERIE_MOV,RIG_MOV,SERIE_GAR' +
        ',RIG_GAR,ID,SERIE_DEV,RIG_DEV,SERIE_MOE,RIG_MOE,SERIE_MOS,RIG_MO' +
        'S,MOVIMIENTO,CANAL_DST_MOV,TITULO_ALMACEN_DEC,LINEA_DEC,CANAL_DE' +
        'C,EJERCICIO_DEC,EMPRESA,DEVOLUCION,EJERCICIO_ENT,CANAL_ENT,LINEA' +
        '_ENT,EJERCICIO_SAL,CANAL_SAL,LINEA_SAL,EJERCICIO_MOV,CANAL_MOV,L' +
        'INEA_MOV,EJERCICIO_GAR,CANAL_GAR,LINEA_GAR,TITULO_PROVEEDOR,TITU' +
        'LO_CLIENTE,TITULO_ALMACEN_ENT,TITULO_ALMACEN_SAL,TITULO_ALMACEN_' +
        'ORI_MOV,TITULO_ALMACEN_DEST_MOV,TITULO_ALMACEN_GAR,TRASPASADO,DE' +
        'VOLUCION_VENTA,EJERCICIO_DEV,CANAL_DEV,LINEA_DEV,TITULO_ALMACEN_' +
        'DEV,EJERCICIO_MOE,CANAL_MOE,LINEA_MOE,TITULO_ALMACEN_MOE,EJERCIC' +
        'IO_MOS,CANAL_MOS,LINEA_MOS,TITULO_ALMACEN_MOS,ALMACEN_DEC,ARTICU' +
        'LO,NRO_SERIE,ALMACEN_ENT,ALMACEN_SAL,ALMACEN_ORI_MOV,ALMACEN_DES' +
        'T_MOV,ALMACEN_GAR,LOTE,ALMACEN_DEV,ALMACEN_MOE,ALMACEN_MOS)'
      'VALUES'
      
        '  (?FECHA_DEC,?FECHA_ENT,?FECHA_SAL,?FECHA_MOV,?FECHA_GAR,?CADUC' +
        'IDAD,?FECHA_DEV,?FECHA_MOE,?FECHA_MOS,?RIG_DEC,?SERIE_DEC,?SERIE' +
        '_ENT,?RIG_ENT,?PROVEEDOR,?SERIE_SAL,?RIG_SAL,?CLIENTE,?SERIE_MOV' +
        ',?RIG_MOV,?SERIE_GAR,?RIG_GAR,?ID,?SERIE_DEV,?RIG_DEV,?SERIE_MOE' +
        ',?RIG_MOE,?SERIE_MOS,?RIG_MOS,?MOVIMIENTO,?CANAL_DST_MOV,?TITULO' +
        '_ALMACEN_DEC,?LINEA_DEC,?CANAL_DEC,?EJERCICIO_DEC,?EMPRESA,?DEVO' +
        'LUCION,?EJERCICIO_ENT,?CANAL_ENT,?LINEA_ENT,?EJERCICIO_SAL,?CANA' +
        'L_SAL,?LINEA_SAL,?EJERCICIO_MOV,?CANAL_MOV,?LINEA_MOV,?EJERCICIO' +
        '_GAR,?CANAL_GAR,?LINEA_GAR,?TITULO_PROVEEDOR,?TITULO_CLIENTE,?TI' +
        'TULO_ALMACEN_ENT,?TITULO_ALMACEN_SAL,?TITULO_ALMACEN_ORI_MOV,?TI' +
        'TULO_ALMACEN_DEST_MOV,?TITULO_ALMACEN_GAR,?TRASPASADO,?DEVOLUCIO' +
        'N_VENTA,?EJERCICIO_DEV,?CANAL_DEV,?LINEA_DEV,?TITULO_ALMACEN_DEV' +
        ',?EJERCICIO_MOE,?CANAL_MOE,?LINEA_MOE,?TITULO_ALMACEN_MOE,?EJERC' +
        'ICIO_MOS,?CANAL_MOS,?LINEA_MOS,?TITULO_ALMACEN_MOS,?ALMACEN_DEC,' +
        '?ARTICULO,?NRO_SERIE,?ALMACEN_ENT,?ALMACEN_SAL,?ALMACEN_ORI_MOV,' +
        '?ALMACEN_DEST_MOV,?ALMACEN_GAR,?LOTE,?ALMACEN_DEV,?ALMACEN_MOE,?' +
        'ALMACEN_MOS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT ARTICULO, EMPRESA, NRO_SERIE, ALMACEN_ENT, ID'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ARTICULO = :ARTICULO AND'
      '((CANAL_ENT = :CANAL) OR (CANAL_MOE = :CANAL)) AND'
      'MOVIMIENTO = 0 AND'
      'RIG_SAL = 0 AND'
      'RIG_MOS = 0 AND'
      'RIG_DEC = 0 AND'
      'RIG_DEV = 0 AND'
      'LOTE = '#39#39' AND'
      'MOVIMIENTO = 0 AND'
      '((ALMACEN_ENT = :ALMACEN) OR (ALMACEN_MOE = :ALMACEN))'
      'ORDER BY NRO_SERIE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE NRO_SERIE_KRI'
      'SET'
      '  FECHA_DEC=?FECHA_DEC '
      '  ,FECHA_ENT=?FECHA_ENT '
      '  ,FECHA_SAL=?FECHA_SAL '
      '  ,FECHA_MOV=?FECHA_MOV '
      '  ,FECHA_GAR=?FECHA_GAR '
      '  ,CADUCIDAD=?CADUCIDAD '
      '  ,FECHA_DEV=?FECHA_DEV '
      '  ,FECHA_MOE=?FECHA_MOE '
      '  ,FECHA_MOS=?FECHA_MOS '
      '  ,RIG_DEC=?RIG_DEC '
      '  ,SERIE_DEC=?SERIE_DEC '
      '  ,SERIE_ENT=?SERIE_ENT '
      '  ,RIG_ENT=?RIG_ENT '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,SERIE_SAL=?SERIE_SAL '
      '  ,RIG_SAL=?RIG_SAL '
      '  ,CLIENTE=?CLIENTE '
      '  ,SERIE_MOV=?SERIE_MOV '
      '  ,RIG_MOV=?RIG_MOV '
      '  ,SERIE_GAR=?SERIE_GAR '
      '  ,RIG_GAR=?RIG_GAR '
      '  ,SERIE_DEV=?SERIE_DEV '
      '  ,RIG_DEV=?RIG_DEV '
      '  ,SERIE_MOE=?SERIE_MOE '
      '  ,RIG_MOE=?RIG_MOE '
      '  ,SERIE_MOS=?SERIE_MOS '
      '  ,RIG_MOS=?RIG_MOS '
      '  ,MOVIMIENTO=?MOVIMIENTO '
      '  ,CANAL_DST_MOV=?CANAL_DST_MOV '
      '  ,TITULO_ALMACEN_DEC=?TITULO_ALMACEN_DEC '
      '  ,LINEA_DEC=?LINEA_DEC '
      '  ,CANAL_DEC=?CANAL_DEC '
      '  ,EJERCICIO_DEC=?EJERCICIO_DEC '
      '  ,EMPRESA=?EMPRESA '
      '  ,DEVOLUCION=?DEVOLUCION '
      '  ,EJERCICIO_ENT=?EJERCICIO_ENT '
      '  ,CANAL_ENT=?CANAL_ENT '
      '  ,LINEA_ENT=?LINEA_ENT '
      '  ,EJERCICIO_SAL=?EJERCICIO_SAL '
      '  ,CANAL_SAL=?CANAL_SAL '
      '  ,LINEA_SAL=?LINEA_SAL '
      '  ,EJERCICIO_MOV=?EJERCICIO_MOV '
      '  ,CANAL_MOV=?CANAL_MOV '
      '  ,LINEA_MOV=?LINEA_MOV '
      '  ,EJERCICIO_GAR=?EJERCICIO_GAR '
      '  ,CANAL_GAR=?CANAL_GAR '
      '  ,LINEA_GAR=?LINEA_GAR '
      '  ,TITULO_PROVEEDOR=?TITULO_PROVEEDOR '
      '  ,TITULO_CLIENTE=?TITULO_CLIENTE '
      '  ,TITULO_ALMACEN_ENT=?TITULO_ALMACEN_ENT '
      '  ,TITULO_ALMACEN_SAL=?TITULO_ALMACEN_SAL '
      '  ,TITULO_ALMACEN_ORI_MOV=?TITULO_ALMACEN_ORI_MOV '
      '  ,TITULO_ALMACEN_DEST_MOV=?TITULO_ALMACEN_DEST_MOV '
      '  ,TITULO_ALMACEN_GAR=?TITULO_ALMACEN_GAR '
      '  ,TRASPASADO=?TRASPASADO '
      '  ,DEVOLUCION_VENTA=?DEVOLUCION_VENTA '
      '  ,EJERCICIO_DEV=?EJERCICIO_DEV '
      '  ,CANAL_DEV=?CANAL_DEV '
      '  ,LINEA_DEV=?LINEA_DEV '
      '  ,TITULO_ALMACEN_DEV=?TITULO_ALMACEN_DEV '
      '  ,EJERCICIO_MOE=?EJERCICIO_MOE '
      '  ,CANAL_MOE=?CANAL_MOE '
      '  ,LINEA_MOE=?LINEA_MOE '
      '  ,TITULO_ALMACEN_MOE=?TITULO_ALMACEN_MOE '
      '  ,EJERCICIO_MOS=?EJERCICIO_MOS '
      '  ,CANAL_MOS=?CANAL_MOS '
      '  ,LINEA_MOS=?LINEA_MOS '
      '  ,TITULO_ALMACEN_MOS=?TITULO_ALMACEN_MOS '
      '  ,ALMACEN_DEC=?ALMACEN_DEC '
      '  ,ARTICULO=?ARTICULO '
      '  ,NRO_SERIE=?NRO_SERIE '
      '  ,ALMACEN_ENT=?ALMACEN_ENT '
      '  ,ALMACEN_SAL=?ALMACEN_SAL '
      '  ,ALMACEN_ORI_MOV=?ALMACEN_ORI_MOV '
      '  ,ALMACEN_DEST_MOV=?ALMACEN_DEST_MOV '
      '  ,ALMACEN_GAR=?ALMACEN_GAR '
      '  ,LOTE=?LOTE '
      '  ,ALMACEN_DEV=?ALMACEN_DEV '
      '  ,ALMACEN_MOE=?ALMACEN_MOE '
      '  ,ALMACEN_MOS=?ALMACEN_MOS '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMArtStocks
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'NRO_SERIE_KRI'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 536
    object QMNroSerieKRIARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMNroSerieKRIEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMNroSerieKRINRO_SERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NRO_SERIE'
      Size = 25
    end
    object QMNroSerieKRIALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Almacen Ent'
      FieldName = 'ALMACEN_ENT'
      Size = 3
    end
    object QMNroSerieKRIID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
  end
  object DSQMNroSerieKRI: TDataSource
    DataSet = QMNroSerieKRI
    Left = 120
    Top = 536
  end
  object DSQMUnidadesLogisticas: TDataSource
    DataSet = QMUnidadesLogisticas
    Left = 504
    Top = 200
  end
  object QMUnidadesLogisticas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ARTICULOS_UNID_LOG'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ARTICULOS_UNID_LOG'
      
        '  (EMPRESA,ARTICULO,TIPO,PESO,PESO_TOTAL,DEFECTO,ID_A,TITULO,UNI' +
        'DADES)'
      'VALUES'
      
        '  (?EMPRESA,?ARTICULO,?TIPO,?PESO,?PESO_TOTAL,?DEFECTO,?ID_A,?TI' +
        'TULO,?UNIDADES)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ARTICULOS_UNID_LOG'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_UNID_LOG'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO'
      'ORDER BY TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ARTICULOS_UNID_LOG'
      'SET'
      '  PESO=?PESO '
      '  ,PESO_TOTAL=?PESO_TOTAL '
      '  ,DEFECTO=?DEFECTO '
      '  ,ID_A=?ID_A '
      '  ,TITULO=?TITULO '
      '  ,UNIDADES=?UNIDADES '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  TIPO=?TIPO ')
    DataSource = DSQMArticulos
    AfterPost = QMUnidadesLogisticasAfterPost
    OnNewRecord = QMUnidadesLogisticasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO '
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ARTICULOS_UNID_LOG'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 408
    Top = 200
    object QMUnidadesLogisticasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMUnidadesLogisticasARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMUnidadesLogisticasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 5
    end
    object QMUnidadesLogisticasPESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object QMUnidadesLogisticasPESO_TOTAL: TFloatField
      DisplayLabel = 'Peso Total'
      FieldName = 'PESO_TOTAL'
    end
    object QMUnidadesLogisticasDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
    object QMUnidadesLogisticasID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMUnidadesLogisticasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 35
    end
    object QMUnidadesLogisticasUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
  end
  object xPropuestas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, ' +
        'C.ID_E, D.ALMACEN, C.FECHA, CP.PROVEEDOR,'
      
        '       T.NOMBRE_R_SOCIAL TITULO_PROVEEDOR, D.LINEA, D.ARTICULO, ' +
        'D.TITULO, D.ID_A, D.UNIDADES, D.P_COSTE, D.DESCUENTO,'
      
        '       D.DESCUENTO_2, D.DESCUENTO_3, D.B_IMPONIBLE, CP.FECHA_PRE' +
        '_CAB, D.ID_DETALLES_E'
      'FROM GES_CABECERAS_E C'
      'JOIN GES_CABECERAS_E_OFP CP ON C.ID_E = CP.ID_E'
      'JOIN GES_DETALLES_E D ON CP.ID_E = D.ID_E'
      
        'JOIN EMP_PROVEEDORES P ON CP.EMPRESA = P.EMPRESA AND CP.PROVEEDO' +
        'R = P.PROVEEDOR'
      'JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO'
      'WHERE'
      'C.ID_E = :ID_E AND'
      'D.ID_DETALLES_E = :ID_DETALLES_E AND'
      'D.ID_A = :ID_A')
    SelectSQL.Strings = (
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, ' +
        'C.ID_E, D.ALMACEN, C.FECHA, CP.PROVEEDOR,'
      
        '       T.NOMBRE_R_SOCIAL TITULO_PROVEEDOR, D.LINEA, D.ARTICULO, ' +
        'D.TITULO, D.ID_A, D.UNIDADES, D.P_COSTE, D.DESCUENTO,'
      
        '       D.DESCUENTO_2, D.DESCUENTO_3, D.B_IMPONIBLE, CP.FECHA_PRE' +
        '_CAB, D.ID_DETALLES_E '
      'FROM GES_CABECERAS_E C'
      'JOIN GES_CABECERAS_E_OFP CP ON C.ID_E = CP.ID_E'
      'JOIN GES_DETALLES_E D ON CP.ID_E = D.ID_E'
      
        'JOIN EMP_PROVEEDORES P ON CP.EMPRESA = P.EMPRESA AND CP.PROVEEDO' +
        'R = P.PROVEEDOR'
      'JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      '((C.SERIE = :DOC_SERIE) OR (:DOC_SERIE LIKE '#39'X%'#39')) AND'
      'C.TIPO = '#39'OFP'#39' AND'
      'D.ID_A = :ID_A AND'
      'C.ESTADO = 0'
      'ORDER BY 8, 2 DESC, 6 DESC, 13'
      '')
    UniDirectional = False
    Left = 408
    Top = 104
    object xPropuestasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xPropuestasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xPropuestasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xPropuestasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xPropuestasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xPropuestasRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xPropuestasID_E: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_E'
    end
    object xPropuestasALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xPropuestasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xPropuestasPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xPropuestasLINEA: TIntegerField
      DisplayLabel = 'Lin.'
      FieldName = 'LINEA'
    end
    object xPropuestasARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xPropuestasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xPropuestasID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xPropuestasUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xPropuestasP_COSTE: TFloatField
      DisplayLabel = 'P.Coste'
      FieldName = 'P_COSTE'
    end
    object xPropuestasDESCUENTO: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO'
    end
    object xPropuestasDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object xPropuestasDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object xPropuestasB_IMPONIBLE: TFloatField
      DisplayLabel = 'B.Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object xPropuestasFECHA_PRE_CAB: TDateTimeField
      DisplayLabel = 'F. Prev. Entrega'
      FieldName = 'FECHA_PRE_CAB'
    end
    object xPropuestasTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Titulo Proveedor'
      FieldName = 'TITULO_PROVEEDOR'
      Size = 60
    end
    object xPropuestasID_DETALLES_E: TIntegerField
      DisplayLabel = 'Id Doc. Det.'
      FieldName = 'ID_DETALLES_E'
    end
  end
  object xPropuestasConfir: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, ' +
        'C.ID_E, D.ALMACEN, C.FECHA, CP.PROVEEDOR,'
      
        '       T.NOMBRE_R_SOCIAL TITULO_PROVEEDOR, D.LINEA, D.ARTICULO, ' +
        'D.TITULO, D.ID_A, D.UNIDADES, D.P_COSTE, D.DESCUENTO,'
      
        '       D.DESCUENTO_2, D.DESCUENTO_3, D.B_IMPONIBLE, FECHA_PRE_CA' +
        'B, D.ID_DETALLES_E'
      'FROM GES_CABECERAS_E C'
      'JOIN GES_CABECERAS_E_OCP CP ON C.ID_E = CP.ID_E'
      'JOIN GES_DETALLES_E D ON CP.ID_E = D.ID_E'
      
        'JOIN EMP_PROVEEDORES P ON CP.EMPRESA = P.EMPRESA AND CP.PROVEEDO' +
        'R = P.PROVEEDOR'
      'JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO'
      'WHERE'
      'C.ID_E = :ID_E AND'
      'D.ID_DETALLES_E = :ID_DETALLES_E AND'
      'D.ID_A = :ID_A')
    SelectSQL.Strings = (
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, ' +
        'C.ID_E, D.ALMACEN, C.FECHA, CP.PROVEEDOR,'
      
        '       T.NOMBRE_R_SOCIAL TITULO_PROVEEDOR, D.LINEA, D.ARTICULO, ' +
        'D.TITULO, D.ID_A, D.UNIDADES, D.P_COSTE, D.DESCUENTO,'
      
        '       D.DESCUENTO_2, D.DESCUENTO_3, D.B_IMPONIBLE, FECHA_PRE_CA' +
        'B, D.ID_DETALLES_E'
      'FROM GES_CABECERAS_E C'
      'JOIN GES_CABECERAS_E_OCP CP ON C.ID_E = CP.ID_E'
      'JOIN GES_DETALLES_E D ON CP.ID_E = D.ID_E'
      
        'JOIN EMP_PROVEEDORES P ON CP.EMPRESA = P.EMPRESA AND CP.PROVEEDO' +
        'R = P.PROVEEDOR'
      'JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      '((C.SERIE = :DOC_SERIE) OR (:DOC_SERIE LIKE '#39'X%'#39')) AND'
      'C.TIPO = '#39'OCP'#39' AND'
      'D.ID_A = :ID_A AND'
      'C.ESTADO = 0'
      'ORDER BY 8, 2 DESC, 6 DESC, 13')
    UniDirectional = False
    Left = 408
    Top = 152
    object xPropuestasConfirEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xPropuestasConfirEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xPropuestasConfirCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xPropuestasConfirSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xPropuestasConfirTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xPropuestasConfirRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xPropuestasConfirID_E: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_E'
    end
    object xPropuestasConfirALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xPropuestasConfirFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xPropuestasConfirPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xPropuestasConfirLINEA: TIntegerField
      DisplayLabel = 'Lin.'
      FieldName = 'LINEA'
    end
    object xPropuestasConfirARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xPropuestasConfirTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xPropuestasConfirID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xPropuestasConfirUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xPropuestasConfirP_COSTE: TFloatField
      DisplayLabel = 'P.Coste'
      FieldName = 'P_COSTE'
    end
    object xPropuestasConfirDESCUENTO: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO'
    end
    object xPropuestasConfirDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object xPropuestasConfirDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object xPropuestasConfirB_IMPONIBLE: TFloatField
      DisplayLabel = 'B.Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object xPropuestasConfirFECHA_PRE_CAB: TDateTimeField
      DisplayLabel = 'F. Prev. Entrega'
      FieldName = 'FECHA_PRE_CAB'
    end
    object xPropuestasConfirTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Titulo Proveedor'
      FieldName = 'TITULO_PROVEEDOR'
      Size = 60
    end
    object xPropuestasConfirID_DETALLES_E: TIntegerField
      DisplayLabel = 'Id Doc. Det.'
      FieldName = 'ID_DETALLES_E'
    end
  end
  object DSQMCondiciones: TDataSource
    DataSet = QMCondiciones
    Left = 120
    Top = 392
  end
  object QMCondiciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.TIPO, C.RIG, D.LINEA, ' +
        'C.ARTICULO, C.PROVEEDOR, A.PRIORIDAD, A.PEDIDO_MINIMO,'
      
        '       A.PEDIDO_OPTIMO, C.ALTA, C.BAJA, D.UNID_MINIMAS, D.UNID_M' +
        'AXIMAS, D.PRECIO, D.DESCUENTO, D.DESCUENTO_2,'
      '       D.DESCUENTO_3, A.DIAS_ENTREGA, T.NOMBRE_R_SOCIAL'
      'FROM ART_COND_COM_C C'
      
        'JOIN ART_COND_COM_D D ON C.EMPRESA = D.EMPRESA AND C.EJERCICIO =' +
        ' D.EJERCICIO AND C.CANAL = D.CANAL AND C.TIPO = D.TIPO AND C.RIG' +
        ' = D.RIG'
      
        'JOIN ART_ARTICULOS_PROVEEDORES A ON A.EMPRESA = C.EMPRESA AND A.' +
        'ARTICULO = C.ARTICULO AND A.PROVEEDOR = C.PROVEEDOR'
      
        'JOIN EMP_PROVEEDORES P ON P.EMPRESA = C.EMPRESA AND P.PROVEEDOR ' +
        '= C.PROVEEDOR'
      'JOIN SYS_TERCEROS T ON T.TERCERO = P.TERCERO'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.TIPO = :TIPO AND'
      'C.RIG = :RIG AND'
      'D.LINEA = :LINEA')
    SelectSQL.Strings = (
      '-- CONDICIONES POR ARTICULO PROVEEDOR'
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.TIPO, C.RIG, D.LINEA, ' +
        'C.ARTICULO, C.FAMILIA, C.PROVEEDOR, C.AGRUPACION,'
      
        '       A.PRIORIDAD, A.PEDIDO_MINIMO, A.PEDIDO_OPTIMO, C.ALTA, C.' +
        'BAJA, D.UNID_MINIMAS, D.UNID_MAXIMAS, D.PRECIO,'
      
        '       D.DESCUENTO, D.DESCUENTO_2, D.DESCUENTO_3, A.DIAS_ENTREGA' +
        ', T.NOMBRE_R_SOCIAL, C.ACTIVO'
      'FROM ART_COND_COM_C C'
      
        'JOIN ART_COND_COM_D D ON C.EMPRESA = D.EMPRESA AND C.EJERCICIO =' +
        ' D.EJERCICIO AND C.CANAL = D.CANAL AND C.TIPO = D.TIPO AND C.RIG' +
        ' = D.RIG'
      
        'JOIN ART_ARTICULOS_PROVEEDORES A ON A.EMPRESA = C.EMPRESA AND A.' +
        'ARTICULO = C.ARTICULO AND A.PROVEEDOR = C.PROVEEDOR'
      
        'JOIN EMP_PROVEEDORES P ON P.EMPRESA = C.EMPRESA AND P.PROVEEDOR ' +
        '= C.PROVEEDOR'
      'JOIN SYS_TERCEROS T ON T.TERCERO = P.TERCERO'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.TIPO = '#39'PRA'#39' AND'
      'C.ARTICULO = :ARTICULO AND'
      'C.ACTIVO = 1 AND'
      'A.ACTIVO = 1'
      'UNION'
      '-- CONDICIONES POR FAMILIA PROVEEDOR'
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.TIPO, C.RIG, D.LINEA, ' +
        'C.ARTICULO, C.FAMILIA, C.PROVEEDOR, C.AGRUPACION,'
      
        '       0 PRIORIDAD, 0 PEDIDO_MINIMO, 0 PEDIDO_OPTIMO, C.ALTA, C.' +
        'BAJA, D.UNID_MINIMAS, D.UNID_MAXIMAS, D.PRECIO,'
      
        '       D.DESCUENTO, D.DESCUENTO_2, D.DESCUENTO_3, 0 DIAS_ENTREGA' +
        ', T.NOMBRE_R_SOCIAL, C.ACTIVO'
      'FROM ART_COND_COM_C C'
      
        'JOIN ART_COND_COM_D D ON C.EMPRESA = D.EMPRESA AND C.EJERCICIO =' +
        ' D.EJERCICIO AND C.CANAL = D.CANAL AND C.TIPO = D.TIPO AND C.RIG' +
        ' = D.RIG'
      
        'JOIN ART_ARTICULOS ART ON C.EMPRESA = ART.EMPRESA AND C.FAMILIA ' +
        '= ART.FAMILIA'
      
        'JOIN EMP_PROVEEDORES P ON P.EMPRESA = C.EMPRESA AND P.PROVEEDOR ' +
        '= C.PROVEEDOR'
      'JOIN SYS_TERCEROS T ON T.TERCERO = P.TERCERO'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.TIPO = '#39'PRF'#39' AND'
      'C.FAMILIA = :FAMILIA AND'
      'C.ACTIVO = 1 AND'
      'EXISTS(SELECT EMPRESA'
      '       FROM ART_ARTICULOS_PROVEEDORES'
      '       WHERE'
      '       EMPRESA = C.EMPRESA AND'
      '       ARTICULO = :ARTICULO AND'
      '       PROVEEDOR = C.PROVEEDOR AND'
      '       ACTIVO = 1)'
      'UNION'
      '-- CONDICIONES POR AGRUPACION ARTICULO'
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.TIPO, C.RIG, D.LINEA, ' +
        'C.ARTICULO, C.FAMILIA, C.PROVEEDOR, C.AGRUPACION,'
      
        '       0 PRIORIDAD, 0 PEDIDO_MINIMO, 0 PEDIDO_OPTIMO, C.ALTA, C.' +
        'BAJA, D.UNID_MINIMAS, D.UNID_MAXIMAS, D.PRECIO,'
      
        '       D.DESCUENTO, D.DESCUENTO_2, D.DESCUENTO_3, 0 DIAS_ENTREGA' +
        ', T.NOMBRE_R_SOCIAL, C.ACTIVO'
      'FROM ART_COND_COM_C C'
      
        'JOIN ART_COND_COM_D D ON C.EMPRESA = D.EMPRESA AND C.EJERCICIO =' +
        ' D.EJERCICIO AND C.CANAL = D.CANAL AND C.TIPO = D.TIPO AND C.RIG' +
        ' = D.RIG'
      
        'JOIN EMP_PROVEEDORES P ON P.EMPRESA = C.EMPRESA AND P.PROVEEDOR ' +
        '= C.PROVEEDOR'
      'JOIN SYS_TERCEROS T ON T.TERCERO = P.TERCERO'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.TIPO = '#39'PRG'#39' AND'
      'C.AGRUPACION IN (SELECT AGRUPACION'
      '                 FROM EMP_AGRUPACIONES_ART'
      '                 WHERE'
      '                 EMPRESA = :EMPRESA AND'
      '                 ARTICULO = :ARTICULO) AND'
      'C.ACTIVO = 1 AND'
      'EXISTS(SELECT EMPRESA'
      '       FROM ART_ARTICULOS_PROVEEDORES'
      '       WHERE'
      '       EMPRESA = C.EMPRESA AND'
      '       ARTICULO = :ARTICULO AND'
      '       PROVEEDOR = C.PROVEEDOR AND'
      '       ACTIVO = 1)'
      
        'ORDER BY 4 /*C.TIPO*/ , 11 /*A.PRIORIDAD*/ DESC, 9 /*AGRUPACION*' +
        '/, 10 /*AGRUPACION*/, 16 /*D.UNID_MINIMAS*/')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMArticulos
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TLocal
    Left = 24
    Top = 392
    object QMCondicionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondicionesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondicionesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondicionesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCondicionesRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCondicionesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMCondicionesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMCondicionesPRIORIDAD: TIntegerField
      DisplayLabel = 'Prioridad'
      FieldName = 'PRIORIDAD'
    end
    object QMCondicionesPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMCondicionesPEDIDO_MINIMO: TFloatField
      DisplayLabel = 'Ped. Min.'
      FieldName = 'PEDIDO_MINIMO'
    end
    object QMCondicionesPEDIDO_OPTIMO: TFloatField
      DisplayLabel = 'Ped. Max.'
      FieldName = 'PEDIDO_OPTIMO'
    end
    object QMCondicionesALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'ALTA'
    end
    object QMCondicionesBAJA: TDateTimeField
      DisplayLabel = 'Fec. Baja'
      FieldName = 'BAJA'
    end
    object QMCondicionesUNID_MINIMAS: TFloatField
      DisplayLabel = 'Uds. Min.'
      FieldName = 'UNID_MINIMAS'
    end
    object QMCondicionesUNID_MAXIMAS: TFloatField
      DisplayLabel = 'Uds. Max.'
      FieldName = 'UNID_MAXIMAS'
    end
    object QMCondicionesPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMCondicionesDIAS_ENTREGA: TIntegerField
      DisplayLabel = 'Dias Entrega'
      FieldName = 'DIAS_ENTREGA'
    end
    object QMCondicionesNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMCondicionesDESCUENTO: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO'
    end
    object QMCondicionesDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object QMCondicionesDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object QMCondicionesFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMCondicionesACTIVO: TIntegerField
      DisplayLabel = 'Activa'
      FieldName = 'ACTIVO'
    end
    object QMCondicionesAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
  end
  object DSQMArticulosSimilares: TDataSource
    DataSet = QMArticulosSimilares
    Left = 312
    Top = 536
  end
  object QMArticulosSimilares: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ARTICULOS_SIMILARES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  ARTICULO_SIMILAR=?old_ARTICULO_SIMILAR ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ARTICULOS_SIMILARES'
      
        '  (ID_A,ARTICULO_SIMILAR,EMPRESA,TITULO,TITULO_SIMILAR,ARTICULO,' +
        'ID_A_SIMILAR)'
      'VALUES'
      
        '  (?ID_A,?ARTICULO_SIMILAR,?EMPRESA,?TITULO,?TITULO_SIMILAR,?ART' +
        'ICULO,?ID_A_SIMILAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ARTICULOS_SIMILARES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  ARTICULO_SIMILAR=?ARTICULO_SIMILAR ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_SIMILARES'
      'WHERE ID_A=?ID_A')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ARTICULOS_SIMILARES'
      'SET'
      '  ID_A=?ID_A '
      '  ,TITULO=?TITULO '
      '  ,TITULO_SIMILAR=?TITULO_SIMILAR '
      '  ,ID_A_SIMILAR=?ID_A_SIMILAR '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  ARTICULO_SIMILAR=?ARTICULO_SIMILAR ')
    DataSource = DSQMArticulos
    OnNewRecord = QMArticulosSimilaresNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO '
      'ARTICULO_SIMILAR ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ARTICULOS_SIMILARES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 216
    Top = 536
    object QMArticulosSimilaresEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMArticulosSimilaresARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMArticulosSimilaresID_A: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_A'
    end
    object QMArticulosSimilaresTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMArticulosSimilaresARTICULO_SIMILAR: TFIBStringField
      DisplayLabel = 'Art'#237'culo similar'
      FieldName = 'ARTICULO_SIMILAR'
      Size = 15
    end
    object QMArticulosSimilaresID_A_SIMILAR: TIntegerField
      DisplayLabel = 'Id Similar'
      FieldName = 'ID_A_SIMILAR'
    end
    object QMArticulosSimilaresTITULO_SIMILAR: TFIBStringField
      DisplayLabel = 'T'#237'tulo similar'
      FieldName = 'TITULO_SIMILAR'
      Size = 256
    end
  end
  object QMCliArt: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ARTICULOS_COD_CLI'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  CLIENTE=?old_CLIENTE ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ARTICULOS_COD_CLI'
      
        '  (EMPRESA,ARTICULO,CLIENTE,NOMBRE_R_SOCIAL,TITULO_ARTICULO,ID_A' +
        ',CODIGO_CLIENTE,TITULO_ARTICULO_CLIENTE,NOTAS_PREPARACION)'
      'VALUES'
      
        '  (?EMPRESA,?ARTICULO,?CLIENTE,?NOMBRE_R_SOCIAL,?TITULO_ARTICULO' +
        ',?ID_A,?CODIGO_CLIENTE,?TITULO_ARTICULO_CLIENTE,?NOTAS_PREPARACI' +
        'ON)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ARTICULOS_COD_CLI'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  CLIENTE=?CLIENTE ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_COD_CLI'
      'WHERE '
      'ID_A = ?ID_A'
      'ORDER BY CLIENTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ARTICULOS_COD_CLI'
      'SET'
      '  NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,ID_A=?ID_A '
      '  ,CODIGO_CLIENTE=?CODIGO_CLIENTE '
      '  ,TITULO_ARTICULO_CLIENTE=?TITULO_ARTICULO_CLIENTE '
      '  ,NOTAS_PREPARACION=?NOTAS_PREPARACION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  CLIENTE=?CLIENTE ')
    DataSource = DSQMArticulos
    Plan.Strings = (
      ' ')
    BeforePost = QMCliArtBeforePost
    OnNewRecord = QMCliArtNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO '
      'CLIENTE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ARTICULOS_COD_CLI'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 216
    Top = 440
    object QMCliArtEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCliArtARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMCliArtCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      OnChange = QMCliArtCLIENTEChange
    end
    object QMCliArtCODIGO_CLIENTE: TFIBStringField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'CODIGO_CLIENTE'
      Size = 40
    end
    object QMCliArtNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMCliArtID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMCliArtTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMCliArtNOTAS_PREPARACION: TFIBStringField
      DisplayLabel = 'Notas Preparacion'
      FieldName = 'NOTAS_PREPARACION'
      Size = 256
    end
    object QMCliArtTITULO_ARTICULO_CLIENTE: TFIBStringField
      DisplayLabel = 'Descripcion Cliente'
      FieldName = 'TITULO_ARTICULO_CLIENTE'
      Size = 256
    end
  end
  object DSQMCliArt: TDataSource
    DataSet = QMCliArt
    Left = 312
    Top = 440
  end
  object QMNroSerie: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS_SERIALIZACION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CANAL=?old_CANAL AND '
      '  CODIGO=?old_CODIGO AND '
      '  ALMACEN=?old_ALMACEN ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS_SERIALIZACION'
      
        '  (NOTAS,FECHA_GARANTIA_PROVEEDOR,FECHA_GARANTIA_CLIENTE,FECHA_C' +
        'ADUCIDAD,CODIGO,CONTADOR,CLIENTE_REPARACION,ACTIVO,ESTADO,CANAL,' +
        'EMPRESA,DEVUELTO_PROV,ALMACEN,ARTICULO,NSERIE)'
      'VALUES'
      
        '  (?NOTAS,?FECHA_GARANTIA_PROVEEDOR,?FECHA_GARANTIA_CLIENTE,?FEC' +
        'HA_CADUCIDAD,?CODIGO,?CONTADOR,?CLIENTE_REPARACION,?ACTIVO,?ESTA' +
        'DO,?CANAL,?EMPRESA,?DEVUELTO_PROV,?ALMACEN,?ARTICULO,?NSERIE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_SERIALIZACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  CODIGO=?CODIGO AND '
      '  ALMACEN=?ALMACEN ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM ART_ARTICULOS_SERIALIZACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  ALMACEN=?ALMACEN AND '
      '  ARTICULO=?ARTICULO AND'
      '  ESTADO = 1'
      'ORDER BY NSERIE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_SERIALIZACION'
      'SET'
      '  NOTAS=?NOTAS '
      '  ,FECHA_GARANTIA_PROVEEDOR=?FECHA_GARANTIA_PROVEEDOR '
      '  ,FECHA_GARANTIA_CLIENTE=?FECHA_GARANTIA_CLIENTE '
      '  ,FECHA_CADUCIDAD=?FECHA_CADUCIDAD '
      '  ,CONTADOR=?CONTADOR '
      '  ,CLIENTE_REPARACION=?CLIENTE_REPARACION '
      '  ,ACTIVO=?ACTIVO '
      '  ,ESTADO=?ESTADO '
      '  ,DEVUELTO_PROV=?DEVUELTO_PROV '
      '  ,ARTICULO=?ARTICULO '
      '  ,NSERIE=?NSERIE '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  CODIGO=?CODIGO AND '
      '  ALMACEN=?ALMACEN ')
    DataSource = DSQMArtStocks
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CANAL '
      'CODIGO '
      'ALMACEN ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS_SERIALIZACION'
    UpdateTransaction = TUpdate
    Left = 24
    Top = 488
    object QMNroSerieNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object QMNroSerieARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMNroSerieALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMNroSerieFECHA_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caducidad'
      FieldName = 'FECHA_CADUCIDAD'
    end
    object QMNroSerieFECHA_GARANTIA_CLIENTE: TDateTimeField
      DisplayLabel = 'Fec. Garantia Cli.'
      FieldName = 'FECHA_GARANTIA_CLIENTE'
    end
    object QMNroSerieFECHA_GARANTIA_PROVEEDOR: TDateTimeField
      DisplayLabel = 'Fec. Garantia Prov.'
      FieldName = 'FECHA_GARANTIA_PROVEEDOR'
    end
    object QMNroSerieCLIENTE_REPARACION: TIntegerField
      DisplayLabel = 'Cli. Reparacion'
      FieldName = 'CLIENTE_REPARACION'
    end
  end
  object DSQMNroSerie: TDataSource
    DataSet = QMNroSerie
    Left = 120
    Top = 488
  end
  object QMMovimientosStock: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'SELECT * FROM A_ART_DAME_MOV_STOCK(:EMPRESA, :CANAL, :ALMACEN, :' +
        'ARTICULO, :CALCULAR_PMP)'
      
        'ORDER BY FECHA DESC, TIPO_OPER DESC, ID_MOV_STOCK DESC, ID_LOTE ' +
        'DESC, SALIDAS DESC, ENTRADAS DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMArtStocks
    BeforeOpen = QMMovimientosStockBeforeOpen
    Left = 216
    Top = 488
    object QMMovimientosStockEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMMovimientosStockCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMMovimientosStockALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMMovimientosStockARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMMovimientosStockLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      OnGetText = QMMovimientosStockLOTEGetText
    end
    object QMMovimientosStockENTRADAS: TFloatField
      DisplayLabel = 'Entradas'
      FieldName = 'ENTRADAS'
    end
    object QMMovimientosStockSALIDAS: TFloatField
      DisplayLabel = 'Salidas'
      FieldName = 'SALIDAS'
    end
    object QMMovimientosStockSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object QMMovimientosStockFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMMovimientosStockDOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object QMMovimientosStockDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMMovimientosStockDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMMovimientosStockTIPO_OPER: TFIBStringField
      DisplayLabel = 'Tipo Oper.'
      FieldName = 'TIPO_OPER'
      OnGetText = QMMovimientosStockTIPO_OPERGetText
      Size = 1
    end
    object QMMovimientosStockID_DOC: TIntegerField
      DisplayLabel = 'Id. Doc.'
      FieldName = 'ID_DOC'
    end
    object QMMovimientosStockID_LOTE: TIntegerField
      DisplayLabel = 'Id Lote'
      FieldName = 'ID_LOTE'
    end
    object QMMovimientosStockID_MOV_STOCK: TIntegerField
      DisplayLabel = 'Id Mov. Stock'
      FieldName = 'ID_MOV_STOCK'
    end
    object QMMovimientosStockCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cod. Cli./Prov.'
      FieldName = 'COD_CLI_PRO'
    end
    object QMMovimientosStockTITULO_CLI_PRO: TFIBStringField
      DisplayLabel = 'Titulo Cli./Prov.'
      FieldName = 'TITULO_CLI_PRO'
      Size = 60
    end
    object QMMovimientosStockREF_PEDIDO: TFIBStringField
      DisplayLabel = 'Ref. Pedido'
      FieldName = 'REF_PEDIDO'
      Size = 40
    end
    object QMMovimientosStockID_DOC_PEDIDO: TIntegerField
      DisplayLabel = 'Id Doc. Pedido'
      FieldName = 'ID_DOC_PEDIDO'
    end
    object QMMovimientosStockPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMMovimientosStockPRECIO_SIN_DTO: TFloatField
      DisplayLabel = 'Precio sin Dto.'
      FieldName = 'PRECIO_SIN_DTO'
    end
    object QMMovimientosStockCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 40
    end
    object QMMovimientosStockCLASIFICACION: TStringField
      DisplayLabel = 'Clasificaci'#243'n'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object QMMovimientosStockPMP: TFloatField
      FieldName = 'PMP'
    end
    object QMMovimientosStockALFA_2: TStringField
      DisplayLabel = 'Campo 1'
      DisplayWidth = 40
      FieldKind = fkCalculated
      FieldName = 'ALFA_2'
      OnGetText = QMMovimientosStockALFA_2GetText
      Size = 40
      Calculated = True
    end
  end
  object DSQMMovimientosStock: TDataSource
    DataSet = QMMovimientosStock
    Left = 312
    Top = 488
  end
  object QMStockFuturo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TRW
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      '/* Se define dinamicamente */'
      
        'SELECT F.*, CS.FECHA_ENTREGA_PREV, DS.FECHA_ENTREGA_PREV FECHA_E' +
        'NTREGA_PREV_DET, CE.FECHA_CONFIRMADA_KRI FECHA_CONF,'
      '       DE.FECHA_CONF_KRI FECHA_CONF_DET'
      'FROM A_ART_STOCK_FUTURO(:ID_A, :CANAL, :ALMACEN) F'
      
        'LEFT JOIN GES_CABECERAS_S_PED CS ON F.ID_DOC = CS.ID_S AND F.TIP' +
        'O = CS.TIPO'
      
        'LEFT JOIN GES_CABECERAS_E_PED CE ON F.ID_DOC = CE.ID_E AND F.TIP' +
        'O = CE.TIPO'
      
        'LEFT JOIN GES_DETALLES_S_PED DS ON F.ID_DETALLE_DOC = DS.ID_DETA' +
        'LLES_S AND F.TIPO = DS.TIPO'
      
        'LEFT JOIN GES_DETALLES_E_PED DE ON F.ID_DETALLE_DOC = DE.ID_DETA' +
        'LLES_E AND F.TIPO = DE.TIPO'
      'WHERE'
      'F.CANTIDAD <> 0')
    UniDirectional = False
    DataSource = DSQMArtStocks
    Left = 216
    Top = 584
    object QMStockFuturoARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMStockFuturoFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMStockFuturoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMStockFuturoCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cod. Cli./Prov.'
      FieldName = 'COD_CLI_PRO'
    end
    object QMStockFuturoNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object QMStockFuturoDOCUMENTO: TFIBStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 30
    end
    object QMStockFuturoCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMStockFuturoSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object QMStockFuturoID_DOC: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_DOC'
    end
    object QMStockFuturoALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMStockFuturoSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMStockFuturoID_DETALLE_DOC: TIntegerField
      DisplayLabel = 'Id Doc. Det.'
      FieldName = 'ID_DETALLE_DOC'
    end
    object QMStockFuturoFECHA_ENTREGA_PREV: TDateTimeField
      DisplayLabel = 'Fec. Entr. Prev.'
      DisplayWidth = 18
      FieldName = 'FECHA_ENTREGA_PREV'
    end
    object QMStockFuturoFECHA_ENTREGA_PREV_DET: TDateTimeField
      DisplayLabel = 'Fec. Entr. Prev. Det.'
      FieldName = 'FECHA_ENTREGA_PREV_DET'
    end
    object QMStockFuturoFECHA_CONF: TDateTimeField
      DisplayLabel = 'Fec. Conf.'
      FieldName = 'FECHA_CONF'
    end
    object QMStockFuturoFECHA_CONF_DET: TDateTimeField
      DisplayLabel = 'Fec. Conf. Det.'
      FieldName = 'FECHA_CONF_DET'
    end
  end
  object DSQMStockFuturo: TDataSource
    DataSet = QMStockFuturo
    Left = 312
    Top = 584
  end
  object dsQMEquivalenciasCab: TDataSource
    DataSet = QMEquivalenciasCab
    Left = 504
    Top = 440
  end
  object QMEquivalenciasCab: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_SYS_CAB_EQUIVAL'
      'WHERE'
      'ID_EQUIVAL IN (SELECT ID_EQUIVAL'
      '               FROM PRO_SYS_CAB_EQUIVAL'
      '               WHERE'
      '               EMPRESA = :EMPRESA AND'
      '               ARTICULO = :ARTICULO'
      '               UNION'
      '               SELECT ID_EQUIVAL'
      '               FROM PRO_SYS_DET_EQUIVAL'
      '               WHERE'
      '               EMPRESA = :EMPRESA AND'
      '               ARTICULO_EQUIVAL = :ARTICULO)    '
      'ORDER BY DEFECTO DESC, ID_EQUIVAL')
    UniDirectional = False
    DataSource = DSQMArticulos
    AfterOpen = QMEquivalenciasCabAfterOpen
    BeforeClose = QMEquivalenciasCabBeforeClose
    Left = 408
    Top = 440
    object QMEquivalenciasCabEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEquivalenciasCabID_EQUIVAL: TIntegerField
      DisplayLabel = 'ID Equivalencia'
      FieldName = 'ID_EQUIVAL'
    end
    object QMEquivalenciasCabDESC_EQUIVAL: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESC_EQUIVAL'
      Size = 60
    end
    object QMEquivalenciasCabARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMEquivalenciasCabDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
  end
  object DSQMEquivalenciasDet: TDataSource
    DataSet = QMEquivalenciasDet
    Left = 504
    Top = 488
  end
  object QMEquivalenciasDet: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT E.*, A.TITULO_LARGO AS TITULO'
      'FROM PRO_SYS_DET_EQUIVAL E'
      
        'JOIN ART_ARTICULOS A ON E.EMPRESA = A.EMPRESA AND E.ARTICULO_EQU' +
        'IVAL = A.ARTICULO'
      'WHERE'
      'E.ID_EQUIVAL = :ID_EQUIVAL'
      'ORDER BY E.ORDEN')
    UniDirectional = False
    DataSource = dsQMEquivalenciasCab
    Left = 408
    Top = 488
    object QMEquivalenciasDetEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEquivalenciasDetID_EQUIVAL: TIntegerField
      DisplayLabel = 'ID Equivalencia'
      FieldName = 'ID_EQUIVAL'
    end
    object QMEquivalenciasDetLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMEquivalenciasDetORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMEquivalenciasDetARTICULO_EQUIVAL: TFIBStringField
      DisplayLabel = 'Art. Equivalente'
      FieldName = 'ARTICULO_EQUIVAL'
      Size = 15
    end
    object QMEquivalenciasDetTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object xCondiciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT C.*, D.LINEA, D.UNID_MINIMAS, D.UNID_MAXIMAS, D.PRECIO, D' +
        '.DESCUENTO, D.DESCUENTO_2, D.DESCUENTO_3,'
      '       T.NOMBRE_R_SOCIAL TITULO_CLIENTE'
      'FROM ART_CONDICIONES_C C'
      
        'JOIN ART_CONDICIONES_D D ON (C.EMPRESA = D.EMPRESA AND C.EJERCIC' +
        'IO = D.EJERCICIO AND C.CANAL = D.CANAL AND C.TIPO = D.TIPO AND C' +
        '.RIG = D.RIG)'
      
        'LEFT JOIN EMP_CLIENTES CL ON (C.EMPRESA = CL.EMPRESA AND C.CLIEN' +
        'TE = CL.CLIENTE)'
      'LEFT JOIN SYS_TERCEROS T ON (CL.TERCERO = T.TERCERO)'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      'C.TIPO = :TIPO AND'
      'C.RIG = :RIG AND'
      'D.LINEA = :LINEA')
    SelectSQL.Strings = (
      
        'SELECT C.*, D.LINEA, D.UNID_MINIMAS, D.UNID_MAXIMAS, D.PRECIO, D' +
        '.DESCUENTO, D.DESCUENTO_2, D.DESCUENTO_3,'
      '       T.NOMBRE_R_SOCIAL TITULO_CLIENTE'
      'FROM ART_CONDICIONES_C C'
      
        'JOIN ART_CONDICIONES_D D ON (C.EMPRESA = D.EMPRESA AND C.EJERCIC' +
        'IO = D.EJERCICIO AND C.CANAL = D.CANAL AND C.TIPO = D.TIPO AND C' +
        '.RIG = D.RIG)'
      
        'LEFT JOIN EMP_CLIENTES CL ON (C.EMPRESA = CL.EMPRESA AND C.CLIEN' +
        'TE = CL.CLIENTE)'
      'LEFT JOIN SYS_TERCEROS T ON (CL.TERCERO = T.TERCERO)'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      '('
      '    (C.TIPO IN ('#39'CCA'#39', '#39'CAA'#39', '#39'CAT'#39', '#39'CAR'#39', '#39'CPA'#39') AND'
      '     C.ARTICULO = :ARTICULO)'
      'OR'
      '    (C.TIPO IN ('#39'CAF'#39', '#39'CCF'#39', '#39'CPF'#39', '#39'CFA'#39') AND'
      '     C.FAMILIA = (SELECT FAMILIA'
      '     FROM ART_ARTICULOS'
      '     WHERE'
      '     EMPRESA = C.EMPRESA AND'
      '     ARTICULO = :ARTICULO))'
      ')'
      'ORDER BY C.TIPO, C.CLIENTE, C.FAMILIA, D.UNID_MINIMAS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMArticulos
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 408
    Top = 536
    object xCondicionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCondicionesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xCondicionesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xCondicionesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xCondicionesRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xCondicionesCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xCondicionesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xCondicionesFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xCondicionesPERFIL: TFIBStringField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
      Size = 4
    end
    object xCondicionesAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrup.'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object xCondicionesALTA: TDateTimeField
      DisplayLabel = 'Alta'
      FieldName = 'ALTA'
    end
    object xCondicionesBAJA: TDateTimeField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object xCondicionesACTIVO: TIntegerField
      DisplayLabel = 'Act.'
      FieldName = 'ACTIVO'
    end
    object xCondicionesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xCondicionesUNID_MINIMAS: TFloatField
      DisplayLabel = 'Uds. Min.'
      FieldName = 'UNID_MINIMAS'
    end
    object xCondicionesUNID_MAXIMAS: TFloatField
      DisplayLabel = 'Uds. Max.'
      FieldName = 'UNID_MAXIMAS'
    end
    object xCondicionesPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xCondicionesDESCUENTO: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO'
    end
    object xCondicionesDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object xCondicionesDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object xCondicionesTITULO_CLIENTE: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO_CLIENTE'
      Size = 60
    end
  end
  object DSxCondiciones: TDataSource
    DataSet = xCondiciones
    Left = 504
    Top = 536
  end
  object TRW: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 992
    Top = 104
  end
  object xCombinaciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 128
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_COMBINACIONES_EGINER'
      'WHERE'
      'ID_COMBINACION = :ID_COMBINACION')
    RefreshSQL.Strings = (
      'SELECT * FROM VER_COMBINACIONES_EGINER'
      'WHERE'
      'ID_COMBINACION = :ID_COMBINACION')
    SelectSQL.Strings = (
      'SELECT * FROM VER_COMBINACIONES_EGINER'
      'WHERE'
      'ID_A = :ID_A'
      'ORDER BY MARCA, MODELO, ESPECIFICACION, BOMBIN, LLAVE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMArticulos
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_COMBINACIONES_EGINER'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 632
    object xCombinacionesID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_COMBINACION'
    end
    object xCombinacionesID_A: TIntegerField
      DisplayLabel = 'Id Articulo'
      FieldName = 'ID_A'
    end
    object xCombinacionesMARCA: TFIBStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      Size = 60
    end
    object xCombinacionesMODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Size = 60
    end
    object xCombinacionesESPECIFICACION: TFIBStringField
      DisplayLabel = 'Especificacion'
      FieldName = 'ESPECIFICACION'
      Size = 60
    end
    object xCombinacionesBOMBIN: TFIBStringField
      DisplayLabel = 'Bombin'
      FieldName = 'BOMBIN'
      Size = 60
    end
    object xCombinacionesLLAVE: TFIBStringField
      DisplayLabel = 'Llave'
      FieldName = 'LLAVE'
      Size = 60
    end
    object xCombinacionesTIPO_VEHICULO: TFIBStringField
      DisplayLabel = 'Tipo Vehiculo'
      FieldName = 'TIPO_VEHICULO'
      Size = 60
    end
    object xCombinacionesID_MARCA: TIntegerField
      DisplayLabel = 'Id Marca'
      FieldName = 'ID_MARCA'
    end
    object xCombinacionesID_MODELO: TIntegerField
      DisplayLabel = 'Id Modelo'
      FieldName = 'ID_MODELO'
    end
    object xCombinacionesID_ESPECIFICACION: TIntegerField
      DisplayLabel = 'Id Especificacion'
      FieldName = 'ID_ESPECIFICACION'
    end
    object xCombinacionesID_BOMBIN: TIntegerField
      DisplayLabel = 'Id Bombin'
      FieldName = 'ID_BOMBIN'
    end
    object xCombinacionesID_LLAVE: TIntegerField
      DisplayLabel = 'Id Llave'
      FieldName = 'ID_LLAVE'
    end
    object xCombinacionesID_TIPO_VEHICULO: TIntegerField
      DisplayLabel = 'Id Tipo Vehiculo'
      FieldName = 'ID_TIPO_VEHICULO'
    end
  end
  object DSxCombinaciones: TDataSource
    DataSet = xCombinaciones
    Left = 120
    Top = 632
  end
  object QMConfECPrestashop: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_CONF_PRESTASHOP'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_CONF_PRESTASHOP'
      
        '  (SERIE,ID,AGENTE,WEB_BACKOFFICE,ID_TIENDA_ARTICULOS,WS_LANGUAG' +
        'E,WS_ORDER_STATE,ART_SIN_CONTROL_STOCK,ACTIVO,CANAL,EMPRESA,WEB,' +
        'SOLO_CLIENTE_CON_PEDIDO,UTILIZA_MODULO_PAYPAL,UTILIZA_REF_PRESTA' +
        'HOP,WS_URL,WS_KEY,WS_DEBUG,ALMACEN,PREFIJO_ART,TITULO,VERSION_PR' +
        'ESTASHOP,WS_VERSION,MANTENER_DESCRIPCIONES,MANTENER_PRECIO,TARIF' +
        'A)'
      'VALUES'
      
        '  (?SERIE,?ID,?AGENTE,?WEB_BACKOFFICE,?ID_TIENDA_ARTICULOS,?WS_L' +
        'ANGUAGE,?WS_ORDER_STATE,?ART_SIN_CONTROL_STOCK,?ACTIVO,?CANAL,?E' +
        'MPRESA,?WEB,?SOLO_CLIENTE_CON_PEDIDO,?UTILIZA_MODULO_PAYPAL,?UTI' +
        'LIZA_REF_PRESTAHOP,?WS_URL,?WS_KEY,?WS_DEBUG,?ALMACEN,?PREFIJO_A' +
        'RT,?TITULO,?VERSION_PRESTASHOP,?WS_VERSION,?MANTENER_DESCRIPCION' +
        'ES,?MANTENER_PRECIO,?TARIFA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CONF_PRESTASHOP'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SYS_CONF_PRESTASHOP'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL'
      'ORDER BY ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CONF_PRESTASHOP'
      'SET'
      '  SERIE=?SERIE '
      '  ,AGENTE=?AGENTE '
      '  ,WEB_BACKOFFICE=?WEB_BACKOFFICE '
      '  ,ID_TIENDA_ARTICULOS=?ID_TIENDA_ARTICULOS '
      '  ,WS_LANGUAGE=?WS_LANGUAGE '
      '  ,WS_ORDER_STATE=?WS_ORDER_STATE '
      '  ,ART_SIN_CONTROL_STOCK=?ART_SIN_CONTROL_STOCK '
      '  ,ACTIVO=?ACTIVO '
      '  ,CANAL=?CANAL '
      '  ,EMPRESA=?EMPRESA '
      '  ,WEB=?WEB '
      '  ,SOLO_CLIENTE_CON_PEDIDO=?SOLO_CLIENTE_CON_PEDIDO '
      '  ,UTILIZA_MODULO_PAYPAL=?UTILIZA_MODULO_PAYPAL '
      '  ,UTILIZA_REF_PRESTAHOP=?UTILIZA_REF_PRESTAHOP '
      '  ,WS_URL=?WS_URL '
      '  ,WS_KEY=?WS_KEY '
      '  ,WS_DEBUG=?WS_DEBUG '
      '  ,ALMACEN=?ALMACEN '
      '  ,PREFIJO_ART=?PREFIJO_ART '
      '  ,TITULO=?TITULO '
      '  ,VERSION_PRESTASHOP=?VERSION_PRESTASHOP '
      '  ,WS_VERSION=?WS_VERSION '
      '  ,MANTENER_DESCRIPCIONES=?MANTENER_DESCRIPCIONES '
      '  ,MANTENER_PRECIO=?MANTENER_PRECIO '
      '  ,TARIFA=?TARIFA '
      'WHERE'
      '  ID=?ID ')
    AfterScroll = QMConfECPrestashopAfterScroll
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CONF_PRESTASHOP'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 632
    Top = 8
    object QMConfECPrestashopID: TIntegerField
      DisplayLabel = 'Id Conf.'
      FieldName = 'ID'
    end
    object QMConfECPrestashopTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 35
    end
    object QMConfECPrestashopWEB: TFIBStringField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
      Size = 200
    end
    object QMConfECPrestashopEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConfECPrestashopCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMConfECPrestashopSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMConfECPrestashopACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMConfECPrestashopPREFIJO_ART: TFIBStringField
      DisplayLabel = 'Prefijo Art.'
      FieldName = 'PREFIJO_ART'
      Size = 15
    end
    object QMConfECPrestashopALMACEN: TFIBStringField
      DisplayLabel = 'Alm.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMConfECPrestashopAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMConfECPrestashopSOLO_CLIENTE_CON_PEDIDO: TIntegerField
      DisplayLabel = 'Solo Clientes con Ped.'
      FieldName = 'SOLO_CLIENTE_CON_PEDIDO'
    end
    object QMConfECPrestashopUTILIZA_MODULO_PAYPAL: TIntegerField
      DisplayLabel = 'Utiliza Mod. Peypal'
      FieldName = 'UTILIZA_MODULO_PAYPAL'
    end
    object QMConfECPrestashopART_SIN_CONTROL_STOCK: TIntegerField
      DisplayLabel = 'Art sin Control Stock'
      FieldName = 'ART_SIN_CONTROL_STOCK'
    end
    object QMConfECPrestashopUTILIZA_REF_PRESTAHOP: TIntegerField
      DisplayLabel = 'Utiliza Ref. PS'
      FieldName = 'UTILIZA_REF_PRESTAHOP'
    end
    object QMConfECPrestashopVERSION_PRESTASHOP: TFIBStringField
      DisplayLabel = 'Version PS'
      FieldName = 'VERSION_PRESTASHOP'
      Size = 15
    end
    object QMConfECPrestashopID_TIENDA_ARTICULOS: TIntegerField
      DisplayLabel = 'Id Tienda Art.'
      FieldName = 'ID_TIENDA_ARTICULOS'
    end
    object QMConfECPrestashopWS_URL: TFIBStringField
      DisplayLabel = 'WS URL'
      FieldName = 'WS_URL'
      Size = 256
    end
    object QMConfECPrestashopWS_KEY: TFIBStringField
      DisplayLabel = 'WS Key'
      FieldName = 'WS_KEY'
      Size = 256
    end
    object QMConfECPrestashopWS_VERSION: TFIBStringField
      DisplayLabel = 'WS Version'
      FieldName = 'WS_VERSION'
      Size = 15
    end
    object QMConfECPrestashopWS_DEBUG: TIntegerField
      DisplayLabel = 'WS Debug'
      FieldName = 'WS_DEBUG'
    end
    object QMConfECPrestashopWS_LANGUAGE: TIntegerField
      DisplayLabel = 'WS Language'
      FieldName = 'WS_LANGUAGE'
    end
    object QMConfECPrestashopWS_ORDER_STATE: TIntegerField
      DisplayLabel = 'WS Order State'
      FieldName = 'WS_ORDER_STATE'
    end
    object QMConfECPrestashopTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMConfECPrestashopWEB_BACKOFFICE: TFIBStringField
      DisplayLabel = 'BackOffice'
      FieldName = 'WEB_BACKOFFICE'
      Size = 200
    end
    object QMConfECPrestashopMANTENER_DESCRIPCIONES: TIntegerField
      DisplayLabel = 'Mentener Desc.'
      FieldName = 'MANTENER_DESCRIPCIONES'
    end
    object QMConfECPrestashopMANTENER_PRECIO: TIntegerField
      DisplayLabel = 'Mantener Precio'
      FieldName = 'MANTENER_PRECIO'
    end
  end
  object DSQMConfECPrestashop: TDataSource
    DataSet = QMConfECPrestashop
    Left = 768
    Top = 8
  end
  object DSQMArticuloECPrestashop: TDataSource
    DataSet = QMArticuloECPrestashop
    Left = 768
    Top = 56
  end
  object QMArticuloECPrestashop: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_CONF_PRESTASHOP_ARTICULO'
      'WHERE'
      '  ID_CONFIGURACION=?old_ID_CONFIGURACION AND '
      '  ID_PRODUCT=?old_ID_PRODUCT AND '
      '  ID_PRODUCT_ATTRIBUTE=?old_ID_PRODUCT_ATTRIBUTE AND '
      '  ID_A=?old_ID_A ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_CONF_PRESTASHOP_ARTICULO'
      
        '  (ULT_SINCRONIZACION,DESCRIPCION_CORTA,DESCRIPCION_LARGA,PRECIO' +
        ',STOCK,ID_PRODUCT_ATTRIBUTE,ID_ATTRIBUTE,ID_PRODUCT,ID_A,ID_CONF' +
        'IGURACION,REFERENCIA,ID_ATTRIBUTES,ID_STOCK_AVAILABLE,TITULO)'
      'VALUES'
      
        '  (?ULT_SINCRONIZACION,?DESCRIPCION_CORTA,?DESCRIPCION_LARGA,?PR' +
        'ECIO,?STOCK,?ID_PRODUCT_ATTRIBUTE,?ID_ATTRIBUTE,?ID_PRODUCT,?ID_' +
        'A,?ID_CONFIGURACION,?REFERENCIA,?ID_ATTRIBUTES,?ID_STOCK_AVAILAB' +
        'LE,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CONF_PRESTASHOP_ARTICULO'
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_PRODUCT=?ID_PRODUCT AND '
      '  ID_PRODUCT_ATTRIBUTE=?ID_PRODUCT_ATTRIBUTE AND '
      '  ID_A=?ID_A ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SYS_CONF_PRESTASHOP_ARTICULO'
      'WHERE'
      'ID_CONFIGURACION = :ID_CONFIGURACION AND '
      'ID_A = :ID_A')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CONF_PRESTASHOP_ARTICULO'
      'SET'
      '  ULT_SINCRONIZACION=?ULT_SINCRONIZACION '
      '  ,DESCRIPCION_CORTA=?DESCRIPCION_CORTA '
      '  ,DESCRIPCION_LARGA=?DESCRIPCION_LARGA '
      '  ,PRECIO=?PRECIO '
      '  ,STOCK=?STOCK '
      '  ,ID_ATTRIBUTE=?ID_ATTRIBUTE '
      '  ,REFERENCIA=?REFERENCIA '
      '  ,ID_ATTRIBUTES=?ID_ATTRIBUTES '
      '  ,ID_STOCK_AVAILABLE=?ID_STOCK_AVAILABLE '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_PRODUCT=?ID_PRODUCT AND '
      '  ID_PRODUCT_ATTRIBUTE=?ID_PRODUCT_ATTRIBUTE AND '
      '  ID_A=?ID_A ')
    DataSource = DSQMArticulos
    BeforeEdit = QMArticuloECPrestashopBeforeEdit
    BeforeOpen = QMArticuloECPrestashopBeforeOpen
    OnNewRecord = QMArticuloECPrestashopNewRecord
    ClavesPrimarias.Strings = (
      'ID_CONFIGURACION '
      'ID_PRODUCT '
      'ID_PRODUCT_ATTRIBUTE '
      'ID_A ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CONF_PRESTASHOP_ARTICULO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 632
    Top = 56
    object QMArticuloECPrestashopID_CONFIGURACION: TIntegerField
      DisplayLabel = 'Id Conf.'
      FieldName = 'ID_CONFIGURACION'
    end
    object QMArticuloECPrestashopID_A: TIntegerField
      DisplayLabel = 'Id Art.'
      FieldName = 'ID_A'
    end
    object QMArticuloECPrestashopID_PRODUCT: TIntegerField
      DisplayLabel = 'Id Product'
      FieldName = 'ID_PRODUCT'
    end
    object QMArticuloECPrestashopID_ATTRIBUTE: TIntegerField
      DisplayLabel = 'Id Attribute'
      FieldName = 'ID_ATTRIBUTE'
    end
    object QMArticuloECPrestashopULT_SINCRONIZACION: TDateTimeField
      DisplayLabel = 'Ult. Sinc.'
      FieldName = 'ULT_SINCRONIZACION'
    end
    object QMArticuloECPrestashopID_ATTRIBUTES: TFIBStringField
      DisplayLabel = 'Id Attributes'
      FieldName = 'ID_ATTRIBUTES'
      Size = 25
    end
    object QMArticuloECPrestashopID_PRODUCT_ATTRIBUTE: TIntegerField
      DisplayLabel = 'Id Combination'
      FieldName = 'ID_PRODUCT_ATTRIBUTE'
    end
    object QMArticuloECPrestashopTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      DisplayWidth = 256
      FieldName = 'TITULO'
      Size = 256
    end
    object QMArticuloECPrestashopREFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCIA'
      Size = 40
    end
    object QMArticuloECPrestashopDESCRIPCION_CORTA: TBlobField
      DisplayLabel = 'Desc. Corta'
      FieldName = 'DESCRIPCION_CORTA'
      Size = 8
    end
    object QMArticuloECPrestashopDESCRIPCION_LARGA: TBlobField
      DisplayLabel = 'Desc. Larga'
      FieldName = 'DESCRIPCION_LARGA'
      Size = 8
    end
    object QMArticuloECPrestashopPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMArticuloECPrestashopSTOCK: TFloatField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object QMArticuloECPrestashopID_STOCK_AVAILABLE: TIntegerField
      DisplayLabel = 'Id Stock'
      FieldName = 'ID_STOCK_AVAILABLE'
    end
  end
  object QMConfECWoocommerce: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_CONF_WOOCOMMERCE'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_CONF_WOOCOMMERCE'
      
        '  (WS_ORDER_STATE,UTILIZA_REF_WOOCOMMERCE,ART_SIN_CONTROL_STOCK,' +
        'VERSION_WORDPRESS,WS_VERSION,WS_CONSUMER_KEY,WS_CONSUMER_SECRET,' +
        'WEB_BACKOFFICE,ID,TITULO,WEB,EMPRESA,CANAL,SERIE,ACTIVO,PREFIJO_' +
        'ART,ALMACEN,AGENTE,ID_TIENDA_ARTICULOS,WS_URL,TARIFA)'
      'VALUES'
      
        '  (?WS_ORDER_STATE,?UTILIZA_REF_WOOCOMMERCE,?ART_SIN_CONTROL_STO' +
        'CK,?VERSION_WORDPRESS,?WS_VERSION,?WS_CONSUMER_KEY,?WS_CONSUMER_' +
        'SECRET,?WEB_BACKOFFICE,?ID,?TITULO,?WEB,?EMPRESA,?CANAL,?SERIE,?' +
        'ACTIVO,?PREFIJO_ART,?ALMACEN,?AGENTE,?ID_TIENDA_ARTICULOS,?WS_UR' +
        'L,?TARIFA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CONF_WOOCOMMERCE'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SYS_CONF_WOOCOMMERCE'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL'
      'ORDER BY ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CONF_WOOCOMMERCE'
      'SET'
      '  WS_ORDER_STATE=?WS_ORDER_STATE '
      '  ,UTILIZA_REF_WOOCOMMERCE=?UTILIZA_REF_WOOCOMMERCE '
      '  ,ART_SIN_CONTROL_STOCK=?ART_SIN_CONTROL_STOCK '
      '  ,VERSION_WORDPRESS=?VERSION_WORDPRESS '
      '  ,WS_VERSION=?WS_VERSION '
      '  ,WS_CONSUMER_KEY=?WS_CONSUMER_KEY '
      '  ,WS_CONSUMER_SECRET=?WS_CONSUMER_SECRET '
      '  ,WEB_BACKOFFICE=?WEB_BACKOFFICE '
      '  ,TITULO=?TITULO '
      '  ,WEB=?WEB '
      '  ,EMPRESA=?EMPRESA '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,ACTIVO=?ACTIVO '
      '  ,PREFIJO_ART=?PREFIJO_ART '
      '  ,ALMACEN=?ALMACEN '
      '  ,AGENTE=?AGENTE '
      '  ,ID_TIENDA_ARTICULOS=?ID_TIENDA_ARTICULOS '
      '  ,WS_URL=?WS_URL '
      '  ,TARIFA=?TARIFA '
      'WHERE'
      '  ID=?ID ')
    AfterScroll = QMConfECWoocommerceAfterScroll
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CONF_WOOCOMMERCE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 632
    Top = 104
    object QMConfECWoocommerceID: TIntegerField
      FieldName = 'ID'
    end
    object QMConfECWoocommerceTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 35
    end
    object QMConfECWoocommerceWEB: TFIBStringField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
      Size = 200
    end
    object QMConfECWoocommerceEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConfECWoocommerceCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMConfECWoocommerceSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMConfECWoocommerceACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMConfECWoocommercePREFIJO_ART: TFIBStringField
      DisplayLabel = 'Prefijo Art'
      FieldName = 'PREFIJO_ART'
      Size = 15
    end
    object QMConfECWoocommerceALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMConfECWoocommerceAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMConfECWoocommerceVERSION_WORDPRESS: TFIBStringField
      DisplayLabel = 'Version Wordpress'
      FieldName = 'VERSION_WORDPRESS'
      Size = 15
    end
    object QMConfECWoocommerceWS_URL: TFIBStringField
      DisplayLabel = 'WS Url'
      FieldName = 'WS_URL'
      Size = 256
    end
    object QMConfECWoocommerceID_TIENDA_ARTICULOS: TIntegerField
      DisplayLabel = 'ID Tienda Articulos'
      FieldName = 'ID_TIENDA_ARTICULOS'
    end
    object QMConfECWoocommerceTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMConfECWoocommerceWS_CONSUMER_KEY: TFIBStringField
      DisplayLabel = 'WS Consumer Key'
      FieldName = 'WS_CONSUMER_KEY'
      Size = 256
    end
    object QMConfECWoocommerceWS_CONSUMER_SECRET: TFIBStringField
      DisplayLabel = 'WS Consumer Secret'
      FieldName = 'WS_CONSUMER_SECRET'
      Size = 256
    end
    object QMConfECWoocommerceWS_ORDER_STATE: TIntegerField
      DisplayLabel = 'Order State'
      FieldName = 'WS_ORDER_STATE'
    end
    object QMConfECWoocommerceUTILIZA_REF_WOOCOMMERCE: TIntegerField
      DisplayLabel = 'Utiliza Ref. Woocomerce'
      FieldName = 'UTILIZA_REF_WOOCOMMERCE'
    end
    object QMConfECWoocommerceART_SIN_CONTROL_STOCK: TIntegerField
      DisplayLabel = 'Art sin Ctrol. Stock'
      FieldName = 'ART_SIN_CONTROL_STOCK'
    end
    object QMConfECWoocommerceWS_VERSION: TFIBStringField
      DisplayLabel = 'Version WS'
      FieldName = 'WS_VERSION'
      Size = 35
    end
    object QMConfECWoocommerceWEB_BACKOFFICE: TFIBStringField
      DisplayLabel = 'Backoffice'
      FieldName = 'WEB_BACKOFFICE'
      Size = 200
    end
  end
  object QMArticuloECWoocommerce: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_CONF_WOOCOMMERCE_ARTICULO'
      'WHERE'
      '  ID_CONFIGURACION=?old_ID_CONFIGURACION AND '
      '  ID_A=?old_ID_A ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_CONF_WOOCOMMERCE_ARTICULO'
      
        '  (ULT_SINCRONIZACION,DESCRIPCION_CORTA,DESCRIPCION_LARGA,PRECIO' +
        ',STOCK,ID_CONFIGURACION,ID_A,ID_PRODUCT,TITULO,REFERENCIA,PRODUC' +
        'T_TYPE,ID_VARIATION)'
      'VALUES'
      
        '  (?ULT_SINCRONIZACION,?DESCRIPCION_CORTA,?DESCRIPCION_LARGA,?PR' +
        'ECIO,?STOCK,?ID_CONFIGURACION,?ID_A,?ID_PRODUCT,?TITULO,?REFEREN' +
        'CIA,?PRODUCT_TYPE,?ID_VARIATION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CONF_WOOCOMMERCE_ARTICULO'
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_A=?ID_A ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_CONF_WOOCOMMERCE_ARTICULO'
      'WHERE'
      'ID_CONFIGURACION = :ID_CONFIGURACION AND '
      'ID_A = :ID_A')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CONF_WOOCOMMERCE_ARTICULO'
      'SET'
      '  ULT_SINCRONIZACION=?ULT_SINCRONIZACION '
      '  ,DESCRIPCION_CORTA=?DESCRIPCION_CORTA '
      '  ,DESCRIPCION_LARGA=?DESCRIPCION_LARGA '
      '  ,PRECIO=?PRECIO '
      '  ,STOCK=?STOCK '
      '  ,ID_PRODUCT=?ID_PRODUCT '
      '  ,TITULO=?TITULO '
      '  ,REFERENCIA=?REFERENCIA '
      '  ,PRODUCT_TYPE=?PRODUCT_TYPE '
      '  ,ID_VARIATION=?ID_VARIATION '
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_A=?ID_A ')
    DataSource = DSQMArticulos
    BeforeEdit = QMArticuloECWoocommerceBeforeEdit
    BeforeOpen = QMArticuloECWoocommerceBeforeOpen
    BeforePost = QMArticuloECWoocommerceBeforePost
    OnNewRecord = QMArticuloECWoocommerceNewRecord
    ClavesPrimarias.Strings = (
      'ID_CONFIGURACION '
      'ID_A ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CONF_WOOCOMMERCE_ARTICULO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 632
    Top = 152
    object QMArticuloECWoocommerceID_CONFIGURACION: TIntegerField
      DisplayLabel = 'Id Configuracion'
      FieldName = 'ID_CONFIGURACION'
    end
    object QMArticuloECWoocommerceID_A: TIntegerField
      FieldName = 'ID_A'
    end
    object QMArticuloECWoocommerceID_PRODUCT: TIntegerField
      DisplayLabel = 'ID Product'
      FieldName = 'ID_PRODUCT'
    end
    object QMArticuloECWoocommerceID_VARIATION: TIntegerField
      DisplayLabel = 'Id Variacion'
      FieldName = 'ID_VARIATION'
    end
    object QMArticuloECWoocommerceULT_SINCRONIZACION: TDateTimeField
      DisplayLabel = 'Ult Sincronizacion'
      FieldName = 'ULT_SINCRONIZACION'
    end
    object QMArticuloECWoocommerceTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMArticuloECWoocommerceREFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCIA'
      Size = 40
    end
    object QMArticuloECWoocommerceDESCRIPCION_CORTA: TBlobField
      DisplayLabel = 'Desc. Corta'
      FieldName = 'DESCRIPCION_CORTA'
      Size = 8
    end
    object QMArticuloECWoocommerceDESCRIPCION_LARGA: TBlobField
      DisplayLabel = 'Desc. Larga'
      FieldName = 'DESCRIPCION_LARGA'
      Size = 8
    end
    object QMArticuloECWoocommercePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMArticuloECWoocommerceSTOCK: TIntegerField
      DisplayLabel = 'Stock'
      FieldName = 'STOCK'
    end
    object QMArticuloECWoocommercePRODUCT_TYPE: TFIBStringField
      DisplayLabel = 'Tipo Producto'
      FieldName = 'PRODUCT_TYPE'
      Size = 40
    end
  end
  object DSQMConfECWoocommerce: TDataSource
    DataSet = QMConfECWoocommerce
    Left = 768
    Top = 104
  end
  object DSQMArticuloECWoocommerce: TDataSource
    DataSet = QMArticuloECWoocommerce
    Left = 768
    Top = 152
  end
  object DSxAvisos: TDataSource
    DataSet = xAvisos
    Left = 504
    Top = 584
  end
  object xAvisos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    InsertSQL.Strings = (
      'UPDATE OR INSERT INTO VER_EMP_AVISOS ('
      
        'TIPO_OBJETO, ID_OBJETO, ACTIVO_OFC, MENSAJE_OFC, ACTIVO_PEC, MEN' +
        'SAJE_PEC, ACTIVO_ALB, MENSAJE_ALB, ACTIVO_FAC, MENSAJE_FAC,'
      
        'ACTIVO_OFP, MENSAJE_OFP, ACTIVO_OCP, MENSAJE_OCP, ACTIVO_PEP, ME' +
        'NSAJE_PEP, ACTIVO_ALP, MENSAJE_ALP, ACTIVO_FAP, MENSAJE_FAP)'
      'VALUES ('
      
        #39'ART'#39', :ID_OBJETO, :ACTIVO_OFC, :MENSAJE_OFC, :ACTIVO_PEC, :MENS' +
        'AJE_PEC, :ACTIVO_ALB, :MENSAJE_ALB, :ACTIVO_FAC, :MENSAJE_FAC,'
      
        ':ACTIVO_OFP, :MENSAJE_OFP, :ACTIVO_OCP, :MENSAJE_OCP, :ACTIVO_PE' +
        'P, :MENSAJE_PEP, :ACTIVO_ALP, :MENSAJE_ALP, :ACTIVO_FAP, :MENSAJ' +
        'E_FAP)'
      'MATCHING (TIPO_OBJETO, ID_OBJETO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_AVISOS'
      'WHERE'
      '  TIPO_OBJETO=?TIPO_OBJETO AND '
      '  ID_OBJETO=?ID_OBJETO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMP_AVISOS'
      'WHERE'
      'TIPO_OBJETO = '#39'ART'#39' AND'
      'ID_OBJETO = :ID_A')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OR INSERT INTO VER_EMP_AVISOS ('
      
        'TIPO_OBJETO, ID_OBJETO, ACTIVO_OFC, MENSAJE_OFC, ACTIVO_PEC, MEN' +
        'SAJE_PEC, ACTIVO_ALB, MENSAJE_ALB, ACTIVO_FAC, MENSAJE_FAC,'
      
        'ACTIVO_OFP, MENSAJE_OFP, ACTIVO_OCP, MENSAJE_OCP, ACTIVO_PEP, ME' +
        'NSAJE_PEP, ACTIVO_ALP, MENSAJE_ALP, ACTIVO_FAP, MENSAJE_FAP)'
      'VALUES ('
      
        #39'ART'#39', :ID_OBJETO, :ACTIVO_OFC, :MENSAJE_OFC, :ACTIVO_PEC, :MENS' +
        'AJE_PEC, :ACTIVO_ALB, :MENSAJE_ALB, :ACTIVO_FAC, :MENSAJE_FAC,'
      
        ':ACTIVO_OFP, :MENSAJE_OFP, :ACTIVO_OCP, :MENSAJE_OCP, :ACTIVO_PE' +
        'P, :MENSAJE_PEP, :ACTIVO_ALP, :MENSAJE_ALP, :ACTIVO_FAP, :MENSAJ' +
        'E_FAP)'
      'MATCHING (TIPO_OBJETO, ID_OBJETO)')
    DataSource = DSQMArticulos
    BeforePost = xAvisosBeforePost
    OnNewRecord = xAvisosNewRecord
    ClavesPrimarias.Strings = (
      'TIPO_OBJETO '
      'ID_OBJETO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_AVISOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 408
    Top = 584
    object xAvisosTIPO_OBJETO: TFIBStringField
      FieldName = 'TIPO_OBJETO'
      Size = 3
    end
    object xAvisosID_OBJETO: TIntegerField
      FieldName = 'ID_OBJETO'
    end
    object xAvisosID_AVISO_OFC: TIntegerField
      FieldName = 'ID_AVISO_OFC'
    end
    object xAvisosACTIVO_OFC: TIntegerField
      FieldName = 'ACTIVO_OFC'
    end
    object xAvisosMENSAJE_OFC: TMemoField
      FieldName = 'MENSAJE_OFC'
      BlobType = ftMemo
      Size = 8
    end
    object xAvisosID_AVISO_PEC: TIntegerField
      FieldName = 'ID_AVISO_PEC'
    end
    object xAvisosACTIVO_PEC: TIntegerField
      FieldName = 'ACTIVO_PEC'
    end
    object xAvisosMENSAJE_PEC: TMemoField
      FieldName = 'MENSAJE_PEC'
      BlobType = ftMemo
      Size = 8
    end
    object xAvisosID_AVISO_ALB: TIntegerField
      FieldName = 'ID_AVISO_ALB'
    end
    object xAvisosACTIVO_ALB: TIntegerField
      FieldName = 'ACTIVO_ALB'
    end
    object xAvisosMENSAJE_ALB: TMemoField
      FieldName = 'MENSAJE_ALB'
      BlobType = ftMemo
      Size = 8
    end
    object xAvisosID_AVISO_FAC: TIntegerField
      FieldName = 'ID_AVISO_FAC'
    end
    object xAvisosACTIVO_FAC: TIntegerField
      FieldName = 'ACTIVO_FAC'
    end
    object xAvisosMENSAJE_FAC: TMemoField
      FieldName = 'MENSAJE_FAC'
      BlobType = ftMemo
      Size = 8
    end
    object xAvisosID_AVISO_OFP: TIntegerField
      FieldName = 'ID_AVISO_OFP'
    end
    object xAvisosACTIVO_OFP: TIntegerField
      FieldName = 'ACTIVO_OFP'
    end
    object xAvisosMENSAJE_OFP: TMemoField
      FieldName = 'MENSAJE_OFP'
      BlobType = ftMemo
      Size = 8
    end
    object xAvisosID_AVISO_OCP: TIntegerField
      FieldName = 'ID_AVISO_OCP'
    end
    object xAvisosACTIVO_OCP: TIntegerField
      FieldName = 'ACTIVO_OCP'
    end
    object xAvisosMENSAJE_OCP: TMemoField
      FieldName = 'MENSAJE_OCP'
      BlobType = ftMemo
      Size = 8
    end
    object xAvisosID_AVISO_PEP: TIntegerField
      FieldName = 'ID_AVISO_PEP'
    end
    object xAvisosACTIVO_PEP: TIntegerField
      FieldName = 'ACTIVO_PEP'
    end
    object xAvisosMENSAJE_PEP: TMemoField
      FieldName = 'MENSAJE_PEP'
      BlobType = ftMemo
      Size = 8
    end
    object xAvisosID_AVISO_ALP: TIntegerField
      FieldName = 'ID_AVISO_ALP'
    end
    object xAvisosACTIVO_ALP: TIntegerField
      FieldName = 'ACTIVO_ALP'
    end
    object xAvisosMENSAJE_ALP: TMemoField
      FieldName = 'MENSAJE_ALP'
      BlobType = ftMemo
      Size = 8
    end
    object xAvisosID_AVISO_FAP: TIntegerField
      FieldName = 'ID_AVISO_FAP'
    end
    object xAvisosACTIVO_FAP: TIntegerField
      FieldName = 'ACTIVO_FAP'
    end
    object xAvisosMENSAJE_FAP: TMemoField
      FieldName = 'MENSAJE_FAP'
      BlobType = ftMemo
      Size = 8
    end
    object xAvisosID_AVISO_FCR: TIntegerField
      FieldName = 'ID_AVISO_FCR'
    end
    object xAvisosACTIVO_FCR: TIntegerField
      FieldName = 'ACTIVO_FCR'
    end
    object xAvisosMENSAJE_FCR: TMemoField
      FieldName = 'MENSAJE_FCR'
      BlobType = ftMemo
      Size = 8
    end
  end
  object xBultos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 128
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ART_ARTICULOS_BULTOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  BULTO=?old_BULTO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ART_ARTICULOS_BULTOS'
      '  (EMPRESA,ARTICULO,BULTO,TITULO,UNIDADES)'
      'VALUES'
      '  (?EMPRESA,?ARTICULO,?BULTO,?TITULO,?UNIDADES)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ART_ARTICULOS_BULTOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  BULTO=?BULTO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ART_ARTICULOS_BULTOS'
      'WHERE'
      'EMPRESA=?EMPRESA AND '
      'ARTICULO=?ARTICULO'
      'ORDER BY BULTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ART_ARTICULOS_BULTOS'
      'SET'
      '  TITULO=?TITULO '
      '  ,UNIDADES=?UNIDADES '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  BULTO=?BULTO ')
    DataSource = DSQMArticulos
    OnNewRecord = xBultosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO '
      'BULTO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ART_ARTICULOS_BULTOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 632
    Top = 200
    object xBultosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xBultosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xBultosBULTO: TIntegerField
      DisplayLabel = 'Bulto'
      FieldName = 'BULTO'
      OnChange = xBultosBULTOChange
    end
    object xBultosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xBultosUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
  end
  object DSxBultos: TDataSource
    DataSet = xBultos
    Left = 768
    Top = 200
  end
  object xTarfiasProveedor: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.PROVEEDOR, C.TARIFA, C' +
        '.TITULO, C.FECHA_INICIO, C.FECHA_FINAL, C.DESCUENTO1,'
      
        '       C.DESCUENTO2, C.DESCUENTO3, C.MONEDA, T.NOMBRE_R_SOCIAL, ' +
        'D.ARTICULO, D.ARTICULO_PROVEEDOR, D.P_COSTE'
      'FROM ART_TARIFAS_PROVEEDOR C'
      
        'JOIN ART_TARIFAS_PROVEEDOR_DETALLE D ON C.EMPRESA = D.EMPRESA AN' +
        'D C.EJERCICIO = D.EJERCICIO AND C.CANAL = D.CANAL AND C.PROVEEDO' +
        'R = D.PROVEEDOR AND C.TARIFA = D.TARIFA'
      
        'JOIN EMP_PROVEEDORES P ON C.EMPRESA = P.EMPRESA AND C.PROVEEDOR ' +
        '= P.PROVEEDOR'
      'JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO'
      'WHERE'
      'D.EMPRESA = :EMPRESA AND'
      'D.EJERCICIO = :EJERCICIO AND'
      'D.CANAL = :CANAL AND'
      'D.PROVEEDOR = :PROVEEDOR AND'
      'D.TARIFA = :TARIFA AND'
      'D.ARTICULO = :ARTICULO')
    SelectSQL.Strings = (
      
        'SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.PROVEEDOR, C.TARIFA, C' +
        '.TITULO, C.FECHA_INICIO, C.FECHA_FINAL, C.DESCUENTO1,'
      
        '       C.DESCUENTO2, C.DESCUENTO3, C.MONEDA, T.NOMBRE_R_SOCIAL, ' +
        'D.ARTICULO, D.ARTICULO_PROVEEDOR, D.P_COSTE'
      'FROM ART_TARIFAS_PROVEEDOR C'
      
        'JOIN ART_TARIFAS_PROVEEDOR_DETALLE D ON C.EMPRESA = D.EMPRESA AN' +
        'D C.EJERCICIO = D.EJERCICIO AND C.CANAL = D.CANAL AND C.PROVEEDO' +
        'R = D.PROVEEDOR AND C.TARIFA = D.TARIFA'
      
        'JOIN EMP_PROVEEDORES P ON C.EMPRESA = P.EMPRESA AND C.PROVEEDOR ' +
        '= P.PROVEEDOR'
      'JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO'
      'WHERE'
      'D.EMPRESA = :EMPRESA AND'
      'D.CANAL = :CANAL AND'
      'D.ARTICULO = :ARTICULO'
      'ORDER BY C.EMPRESA, C.EJERCICIO DESC, C.PROVEEDOR, C.TARIFA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMArticulos
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TLocal
    Left = 632
    Top = 248
    object xTarfiasProveedorEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTarfiasProveedorEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xTarfiasProveedorCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xTarfiasProveedorPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xTarfiasProveedorTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object xTarfiasProveedorTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object xTarfiasProveedorFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fec. Inicio'
      FieldName = 'FECHA_INICIO'
    end
    object xTarfiasProveedorFECHA_FINAL: TDateTimeField
      DisplayLabel = 'Fec. Final'
      FieldName = 'FECHA_FINAL'
    end
    object xTarfiasProveedorDESCUENTO1: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO1'
    end
    object xTarfiasProveedorDESCUENTO2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO2'
    end
    object xTarfiasProveedorDESCUENTO3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO3'
    end
    object xTarfiasProveedorMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xTarfiasProveedorNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Titulo Poveedor'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xTarfiasProveedorARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xTarfiasProveedorARTICULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Articulo Proveedor'
      FieldName = 'ARTICULO_PROVEEDOR'
      Size = 40
    end
    object xTarfiasProveedorP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
  end
  object DSxTarfiasProveedor: TDataSource
    DataSet = xTarfiasProveedor
    Left = 768
    Top = 248
  end
  object QMPictograma: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ARTICULOS_PICTOGRAMAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  PICTOGRAMA=?old_PICTOGRAMA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ARTICULOS_PICTOGRAMAS'
      '  (EMPRESA,'#13#10'ARTICULO,PICTOGRAMA,IMAGEN,NOMBRE)'
      'VALUES'
      '  (?EMPRESA,'#13#10'?ARTICULO,?PICTOGRAMA,?IMAGEN,?NOMBRE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ARTICULOS_PICTOGRAMAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  PICTOGRAMA=?PICTOGRAMA ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ARTICULOS_PICTOGRAMAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO'
      'ORDER BY PICTOGRAMA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ARTICULOS_PICTOGRAMAS'
      'SET'
      '  IMAGEN=?IMAGEN '
      '  ,NOMBRE=?NOMBRE '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  PICTOGRAMA=?PICTOGRAMA ')
    DataSource = DSQMArticulos
    BeforePost = QMPictogramaBeforePost
    OnNewRecord = QMPictogramaNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO '
      'PICTOGRAMA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ARTICULOS_PICTOGRAMAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 216
    Top = 632
    object QMPictogramaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPictogramaARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMPictogramaPICTOGRAMA: TIntegerField
      DisplayLabel = 'Pictograma'
      FieldName = 'PICTOGRAMA'
    end
    object QMPictogramaIMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
    end
    object QMPictogramaNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      ReadOnly = True
      Size = 35
    end
  end
  object DSQMPictograma: TDataSource
    DataSet = QMPictograma
    Left = 312
    Top = 632
  end
  object DSxLogistica: TDataSource
    DataSet = xLogistica
    Left = 504
    Top = 632
  end
  object xLogistica: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS_LOGISITCA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS_LOGISITCA'
      
        '  (EMPRESA,'#13#10'ARTICULO,ID_A,EAN13,PESO_ENVASE_GR,ALTO_ENVASE_CM,A' +
        'NCHO_ENVASE_CM,FONDO_ENVASE_CM,DUN14,UNIDADES_X_CAJA,PESO_CAJA_G' +
        'R,'#13#10'ALTO_CAJA_CM,ANCHO_CAJA_CM,FONDO_CAJA_CM,PESO_PALET_KG,CAJAS' +
        '_X_PALET,CAPAS_PALET,ALTO_PALET_M)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?ARTICULO,?ID_A,?EAN13,?PESO_ENVASE_GR,?ALTO_ENVAS' +
        'E_CM,?ANCHO_ENVASE_CM,?FONDO_ENVASE_CM,?DUN14,?UNIDADES_X_CAJA,?' +
        'PESO_CAJA_GR,'#13#10'?ALTO_CAJA_CM,?ANCHO_CAJA_CM,?FONDO_CAJA_CM,?PESO' +
        '_PALET_KG,?CAJAS_X_PALET,?CAPAS_PALET,?ALTO_PALET_M)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_LOGISITCA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_LOGISITCA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_LOGISITCA'
      'SET'
      '  ID_A=?ID_A '
      '  ,EAN13=?EAN13 '
      '  ,PESO_ENVASE_GR=?PESO_ENVASE_GR '
      '  ,ALTO_ENVASE_CM=?ALTO_ENVASE_CM '
      '  ,ANCHO_ENVASE_CM=?ANCHO_ENVASE_CM '
      '  ,FONDO_ENVASE_CM=?FONDO_ENVASE_CM '
      '  ,DUN14=?DUN14 '
      '  ,UNIDADES_X_CAJA=?UNIDADES_X_CAJA '
      '  ,PESO_CAJA_GR=?PESO_CAJA_GR '
      '  ,ALTO_CAJA_CM=?ALTO_CAJA_CM '
      '  ,ANCHO_CAJA_CM=?ANCHO_CAJA_CM '
      '  ,FONDO_CAJA_CM=?FONDO_CAJA_CM '
      '  ,PESO_PALET_KG=?PESO_PALET_KG '
      '  ,CAJAS_X_PALET=?CAJAS_X_PALET '
      '  ,CAPAS_PALET=?CAPAS_PALET '
      '  ,ALTO_PALET_M=?ALTO_PALET_M '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    DataSource = DSQMArticulos
    OnNewRecord = xLogisticaNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS_LOGISITCA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 408
    Top = 632
    object xLogisticaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xLogisticaARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xLogisticaID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xLogisticaEAN13: TFIBStringField
      DisplayLabel = 'EAN 13'
      FieldName = 'EAN13'
      Size = 25
    end
    object xLogisticaPESO_ENVASE_GR: TFloatField
      DisplayLabel = 'Peso (gr)'
      FieldName = 'PESO_ENVASE_GR'
    end
    object xLogisticaALTO_ENVASE_CM: TFloatField
      DisplayLabel = 'Alto (cm)'
      FieldName = 'ALTO_ENVASE_CM'
    end
    object xLogisticaANCHO_ENVASE_CM: TFloatField
      DisplayLabel = 'Ancho (cm)'
      FieldName = 'ANCHO_ENVASE_CM'
    end
    object xLogisticaFONDO_ENVASE_CM: TFloatField
      DisplayLabel = 'Fondo (cm)'
      FieldName = 'FONDO_ENVASE_CM'
    end
    object xLogisticaDUN14: TFIBStringField
      DisplayLabel = 'DUN 14'
      FieldName = 'DUN14'
      Size = 25
    end
    object xLogisticaUNIDADES_X_CAJA: TFloatField
      DisplayLabel = 'Uds. x Caja'
      FieldName = 'UNIDADES_X_CAJA'
    end
    object xLogisticaPESO_CAJA_GR: TFloatField
      DisplayLabel = 'Peso (gr)'
      FieldName = 'PESO_CAJA_GR'
    end
    object xLogisticaALTO_CAJA_CM: TFloatField
      DisplayLabel = 'Alto (cm)'
      FieldName = 'ALTO_CAJA_CM'
    end
    object xLogisticaANCHO_CAJA_CM: TFloatField
      DisplayLabel = 'Ancho (cm)'
      FieldName = 'ANCHO_CAJA_CM'
    end
    object xLogisticaFONDO_CAJA_CM: TFloatField
      DisplayLabel = 'Fondo (cm)'
      FieldName = 'FONDO_CAJA_CM'
    end
    object xLogisticaPESO_PALET_KG: TFloatField
      DisplayLabel = 'Peso (kg)'
      FieldName = 'PESO_PALET_KG'
    end
    object xLogisticaCAJAS_X_PALET: TFloatField
      DisplayLabel = 'Cajas x Palet'
      FieldName = 'CAJAS_X_PALET'
    end
    object xLogisticaCAPAS_PALET: TFloatField
      DisplayLabel = 'Capas'
      FieldName = 'CAPAS_PALET'
    end
    object xLogisticaALTO_PALET_M: TFloatField
      DisplayLabel = 'Alto (m)'
      FieldName = 'ALTO_PALET_M'
    end
  end
  object xCaracteristica: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 128
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ARTICULOS_CARACTERISTICA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ARTICULOS_CARACTERISTICA'
      '  (EMPRESA,'#13#10'ARTICULO,CODIGO,TITULO,ID_A,VALOR1,VALOR2)'
      'VALUES'
      '  (?EMPRESA,'#13#10'?ARTICULO,?CODIGO,?TITULO,?ID_A,?VALOR1,?VALOR2)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ARTICULOS_CARACTERISTICA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ARTICULOS_CARACTERISTICA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO '
      'ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ARTICULOS_CARACTERISTICA'
      'SET'
      '  TITULO=?TITULO '
      '  ,ID_A=?ID_A '
      '  ,VALOR1=?VALOR1 '
      '  ,VALOR2=?VALOR2 '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  CODIGO=?CODIGO ')
    DataSource = DSQMArticulos
    OnNewRecord = xCaracteristicaNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO '
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ARTICULOS_CARACTERISTICA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 632
    Top = 296
    object xCaracteristicaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCaracteristicaARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xCaracteristicaCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      OnChange = xCaracteristicaCODIGOChange
      Size = 25
    end
    object xCaracteristicaTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object xCaracteristicaID_A: TIntegerField
      DisplayLabel = 'Id Art.'
      FieldName = 'ID_A'
    end
    object xCaracteristicaVALOR1: TFIBStringField
      DisplayLabel = 'Valor 1'
      FieldName = 'VALOR1'
      Size = 256
    end
    object xCaracteristicaVALOR2: TFIBStringField
      DisplayLabel = 'Valor 2'
      FieldName = 'VALOR2'
      Size = 256
    end
  end
  object DSxCaracteristica: TDataSource
    DataSet = xCaracteristica
    Left = 768
    Top = 296
  end
end
