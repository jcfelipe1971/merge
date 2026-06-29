object DMSincronizacionEginer: TDMSincronizacionEginer
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 195
  Top = 107
  Height = 382
  Width = 412
  object xUsuarios: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM USUARIOS_WEB'
      'WHERE'
      '  USUARIOID=?old_USUARIOID ')
    InsertSQL.Strings = (
      'INSERT INTO USUARIOS_WEB'
      
        '  (WEB_SERIE,DIRECCION_AMPLIADA,ID_CLIENTE_AGENTE,ID_USUARIO,ID_' +
        'EMPLEADO,IMAGEN,USUARIOID,CONTRASENYA,EMAIL,NOMBRE,CIUDAD,PROVIN' +
        'CIA,CP,PAIS,TELEFONO,TIPO_USUARIO,ACEPTAR,DIRECCION,STOCK,WEB_EM' +
        'PRESA,WEB_EJERCICIO,WEB_CANAL,WEB_APLICA_TARIFA,USUARIO,CONFIGUR' +
        'ACION,HOJA_TRABAJO_VER_MAQUINA,VISTA,WEB_ALMACEN,WEB_TARIFA,SECC' +
        'ION,DATE_INS,DATE_UPD)'
      'VALUES'
      
        '  (?WEB_SERIE,?DIRECCION_AMPLIADA,?ID_CLIENTE_AGENTE,?ID_USUARIO' +
        ',?ID_EMPLEADO,?IMAGEN,?USUARIOID,?CONTRASENYA,?EMAIL,?NOMBRE,?CI' +
        'UDAD,?PROVINCIA,?CP,?PAIS,?TELEFONO,?TIPO_USUARIO,?ACEPTAR,?DIRE' +
        'CCION,?STOCK,?WEB_EMPRESA,?WEB_EJERCICIO,?WEB_CANAL,?WEB_APLICA_' +
        'TARIFA,?USUARIO,?CONFIGURACION,?HOJA_TRABAJO_VER_MAQUINA,?VISTA,' +
        '?WEB_ALMACEN,?WEB_TARIFA,?SECCION,?DATE_INS,?DATE_UPD)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM USUARIOS_WEB'
      'WHERE'
      '  USUARIOID=?USUARIOID ')
    SelectSQL.Strings = (
      'SELECT U.ID_USUARIO, U.USUARIOID, U.EMAIL, U.NOMBRE, U.DATE_UPD'
      'FROM USUARIOS_WEB U'
      'JOIN EMP_CLIENTES C ON U.ID_CLIENTE_AGENTE = C.ID_CLIENTE'
      'WHERE'
      'U.TIPO_USUARIO = 0 AND'
      
        '((U.DATE_UPD > :FECHA_ULTIMA_MODIFICACION) OR (C.ULT_MODIFICACIO' +
        'N > :FECHA_ULTIMA_MODIFICACION) OR'
      '(EXISTS(SELECT EMPRESA'
      '        FROM EMP_AGRUPACIONES_CLI'
      '        WHERE'
      '        EMPRESA = C.EMPRESA AND'
      '        CLIENTE = C.CLIENTE AND'
      '        DATE_UPD > :FECHA_ULTIMA_MODIFICACION)))'
      'ORDER BY U.USUARIOID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE USUARIOS_WEB'
      'SET'
      '  WEB_SERIE=?WEB_SERIE '
      '  ,DIRECCION_AMPLIADA=?DIRECCION_AMPLIADA '
      '  ,ID_CLIENTE_AGENTE=?ID_CLIENTE_AGENTE '
      '  ,ID_USUARIO=?ID_USUARIO '
      '  ,ID_EMPLEADO=?ID_EMPLEADO '
      '  ,IMAGEN=?IMAGEN '
      '  ,CONTRASENYA=?CONTRASENYA '
      '  ,EMAIL=?EMAIL '
      '  ,NOMBRE=?NOMBRE '
      '  ,CIUDAD=?CIUDAD '
      '  ,PROVINCIA=?PROVINCIA '
      '  ,CP=?CP '
      '  ,PAIS=?PAIS '
      '  ,TELEFONO=?TELEFONO '
      '  ,TIPO_USUARIO=?TIPO_USUARIO '
      '  ,ACEPTAR=?ACEPTAR '
      '  ,DIRECCION=?DIRECCION '
      '  ,STOCK=?STOCK '
      '  ,WEB_EMPRESA=?WEB_EMPRESA '
      '  ,WEB_EJERCICIO=?WEB_EJERCICIO '
      '  ,WEB_CANAL=?WEB_CANAL '
      '  ,WEB_APLICA_TARIFA=?WEB_APLICA_TARIFA '
      '  ,USUARIO=?USUARIO '
      '  ,CONFIGURACION=?CONFIGURACION '
      '  ,HOJA_TRABAJO_VER_MAQUINA=?HOJA_TRABAJO_VER_MAQUINA '
      '  ,VISTA=?VISTA '
      '  ,WEB_ALMACEN=?WEB_ALMACEN '
      '  ,WEB_TARIFA=?WEB_TARIFA '
      '  ,SECCION=?SECCION '
      '  ,DATE_INS=?DATE_INS '
      '  ,DATE_UPD=?DATE_UPD '
      'WHERE'
      '  USUARIOID=?USUARIOID ')
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    ClavesPrimarias.Strings = (
      'USUARIOID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'USUARIOS_WEB'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 8
    object xUsuariosUSUARIOID: TFIBStringField
      DisplayLabel = 'Usuario Id'
      FieldName = 'USUARIOID'
    end
    object xUsuariosEMAIL: TFIBStringField
      DisplayLabel = 'Correo'
      FieldName = 'EMAIL'
      Size = 100
    end
    object xUsuariosNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object xUsuariosID_USUARIO: TIntegerField
      DisplayLabel = 'Id Usuario'
      FieldName = 'ID_USUARIO'
    end
    object xUsuariosDATE_UPD: TDateTimeField
      DisplayLabel = 'Ult. Modificacion'
      FieldName = 'DATE_UPD'
    end
  end
  object DSxUsuarios: TDataSource
    DataSet = xUsuarios
    Left = 176
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 277
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 277
    Top = 56
  end
  object xAtributos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ATRIBUTO'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ATRIBUTO'
      '  (ID,ID_PADRE,ATRIBUTO,TIPO,TIPO_PADRE,DATE_INS,DATE_UPD)'
      'VALUES'
      
        '  (?ID,?ID_PADRE,?ATRIBUTO,?TIPO,?TIPO_PADRE,?DATE_INS,?DATE_UPD' +
        ')')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ATRIBUTO'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ATRIBUTO'
      'WHERE'
      'DATE_UPD >= :FECHA_ULTIMA_MODIFICACION'
      'ORDER BY ATRIBUTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ATRIBUTO'
      'SET'
      '  ID_PADRE=?ID_PADRE '
      '  ,ATRIBUTO=?ATRIBUTO '
      '  ,TIPO=?TIPO '
      '  ,TIPO_PADRE=?TIPO_PADRE '
      '  ,DATE_INS=?DATE_INS '
      '  ,DATE_UPD=?DATE_UPD '
      'WHERE'
      '  ID=?ID ')
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ATRIBUTO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 56
  end
  object DSxAtributos: TDataSource
    DataSet = xAtributos
    Left = 176
    Top = 56
  end
  object xArticulos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
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
        'ARGO,COSTE_ADICIONAL,LITROS_POR_UNIDAD,ENTRADA,CONTROLA_MEDIDAS,' +
        'DESCUENTO,DESCUENTO_2,DESCUENTO_3,ID_A,ID_A_M_C_T,IMAGEN,FABRICA' +
        'NTE,TIPO_CLAVE_ADR,Z_TOL_ID_A_ARMAZON,Z_TOL_ID_A_LONA,Z_MERMA,ID' +
        '_GALERIA,ID_MARCA,FORMULA_DEFECTO,EMPRESA,TITULO,ABIERTO,CONTROL' +
        '_STOCK,VIRTUAL,TITULO_CORTO,SERIALIZADO,GARANTIA,PRODUCCION,ALFA' +
        '_1,ALFA_2,DISPONIBILIDAD,PVP_POR_UD_SECUNDARIA,ALFA_3,ALFA_4,ALF' +
        'A_5,LOTES_KRI,LOTES,CODIGO_INTRA,UBICABLE,ANTICIPO,ANTICIPO_PREG' +
        '_DATOS,ANTICIPO_CONTADO,WEB,NO_CALCULA_STOCKMINMAX,BAJA,MOTIVO_B' +
        'AJA,CANTIDAD_LIMITADA,Z_COM_LACADO,Z_COM_TIPO_LACADO,Z_COM_CORTE' +
        ',Z_COM_QUITAR_SI_HAY_MOTOR,Z_PREPARABLE,Z_FORZAR_LACADO_SN,COMPO' +
        'NENTE_MOTOR,Z_LAM_COLOR,ALFA_6,EXPORTAR,ALFA_7,ALFA_8,Z_COM_QUIT' +
        'AR_SI_ES_MANUAL,BLOQUEO_COMPRAS,MOTIVO_BLOQUEO_COMPRAS,BLOQUEO_V' +
        'ENTAS,MOTIVO_BLOQUEO_VENTAS,ADR_PACKAGE,PREPARABLE,REPLICADO,SER' +
        'IALIZADO_KRI,ARTICULO,FAMILIA,CRC_NOTAS,CRC_NOTAS_COMPRAS,CRC_NO' +
        'TAS_VENTAS,TIPO_ARTICULO,TIPO_ARTICULO_TYC,Z_ARM_MODELO,Z_TOL_AR' +
        'MAZON,Z_TOL_LONA,Z_LON_TIPO,Z_LON_FORMA,Z_LON_CONFECCION,Z_COM_S' +
        'USTITUTO,Z_KIT_TIPO,SUBFAMILIA,SUBTIPO_ARTICULO_TYC,COD_COLOR_HI' +
        'LO,TIPO_REGISTRO_FITOSANITARIO,Z_RIBETE_DEFECTO,Z_LON_COLOR_1,Z_' +
        'LON_COLOR_2,Z_LON_COLOR_3,GENERAR_PEDIDO_COMPRA_SIEMPRE)'
      'VALUES'
      
        '  (?P_COSTE,?UNIDADES,?NOTAS,?MULTIPLO_1,?MULTIPLO_2,?MULTIPLO_3' +
        ',?MULTIPLO_4,?FACTOR_ESCALA,?UD_MINIMO_COMPRA,?UD_MINIMO_VENTA,?' +
        'PESO,?DEFECTO_UD_SECUNDARIA,?VOLUMEN_UNIT,?DIAMETRO_UNIT,?NOTAS_' +
        'COMPRAS,?NOTAS_VENTAS,?ULT_MODIFICACION,?FECHA_ENLOTADO,?FECHA_B' +
        'AJA,?Z_ARM_LINEA,?Z_ARM_SALIDA,?Z_LON_MODELO,?Z_TIPO_LACADO_FORZ' +
        'ADO,?Z_LAM_ANCHO,?Z_LAM_LARGO,?COSTE_ADICIONAL,?LITROS_POR_UNIDA' +
        'D,?ENTRADA,?CONTROLA_MEDIDAS,?DESCUENTO,?DESCUENTO_2,?DESCUENTO_' +
        '3,?ID_A,?ID_A_M_C_T,?IMAGEN,?FABRICANTE,?TIPO_CLAVE_ADR,?Z_TOL_I' +
        'D_A_ARMAZON,?Z_TOL_ID_A_LONA,?Z_MERMA,?ID_GALERIA,?ID_MARCA,?FOR' +
        'MULA_DEFECTO,?EMPRESA,?TITULO,?ABIERTO,?CONTROL_STOCK,?VIRTUAL,?' +
        'TITULO_CORTO,?SERIALIZADO,?GARANTIA,?PRODUCCION,?ALFA_1,?ALFA_2,' +
        '?DISPONIBILIDAD,?PVP_POR_UD_SECUNDARIA,?ALFA_3,?ALFA_4,?ALFA_5,?' +
        'LOTES_KRI,?LOTES,?CODIGO_INTRA,?UBICABLE,?ANTICIPO,?ANTICIPO_PRE' +
        'G_DATOS,?ANTICIPO_CONTADO,?WEB,?NO_CALCULA_STOCKMINMAX,?BAJA,?MO' +
        'TIVO_BAJA,?CANTIDAD_LIMITADA,?Z_COM_LACADO,?Z_COM_TIPO_LACADO,?Z' +
        '_COM_CORTE,?Z_COM_QUITAR_SI_HAY_MOTOR,?Z_PREPARABLE,?Z_FORZAR_LA' +
        'CADO_SN,?COMPONENTE_MOTOR,?Z_LAM_COLOR,?ALFA_6,?EXPORTAR,?ALFA_7' +
        ',?ALFA_8,?Z_COM_QUITAR_SI_ES_MANUAL,?BLOQUEO_COMPRAS,?MOTIVO_BLO' +
        'QUEO_COMPRAS,?BLOQUEO_VENTAS,?MOTIVO_BLOQUEO_VENTAS,?ADR_PACKAGE' +
        ',?PREPARABLE,?REPLICADO,?SERIALIZADO_KRI,?ARTICULO,?FAMILIA,?CRC' +
        '_NOTAS,?CRC_NOTAS_COMPRAS,?CRC_NOTAS_VENTAS,?TIPO_ARTICULO,?TIPO' +
        '_ARTICULO_TYC,?Z_ARM_MODELO,?Z_TOL_ARMAZON,?Z_TOL_LONA,?Z_LON_TI' +
        'PO,?Z_LON_FORMA,?Z_LON_CONFECCION,?Z_COM_SUSTITUTO,?Z_KIT_TIPO,?' +
        'SUBFAMILIA,?SUBTIPO_ARTICULO_TYC,?COD_COLOR_HILO,?TIPO_REGISTRO_' +
        'FITOSANITARIO,?Z_RIBETE_DEFECTO,?Z_LON_COLOR_1,?Z_LON_COLOR_2,?Z' +
        '_LON_COLOR_3,?GENERAR_PEDIDO_COMPRA_SIEMPRE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      'SELECT A.*'
      'FROM ART_ARTICULOS A'
      'WHERE'
      'A.EMPRESA = :EMPRESA AND'
      'A.WEB = 1 AND'
      '('
      '--'
      '(A.ULT_MODIFICACION >= :FECHA_ULTIMA_MODIFICACION)'
      '--'
      'OR (EXISTS(SELECT ID_A'
      '           FROM EMP_AGRUPACIONES_ART'
      '           WHERE'
      '           ID_A = A.ID_A AND'
      '           REPLICADO = 0 AND'
      '           ('
      '           (AGRUPACION BETWEEN '#39'M01'#39' AND '#39'M99'#39') OR'
      '           (AGRUPACION BETWEEN '#39'CL1'#39' AND '#39'CL9'#39')'
      '           )))'
      '--'
      'OR (EXISTS(SELECT CODIGO'
      '           FROM SYS_IMAGENES'
      '           WHERE'
      '           CODIGO = A.IMAGEN AND'
      '           ULT_MODIFICACION >= :FECHA_ULTIMA_MODIFICACION))'
      '--'
      'OR (EXISTS(SELECT EMPRESA'
      '           FROM  ART_TARIFAS_PRECIOS'
      '           WHERE'
      '           EMPRESA = A.EMPRESA AND'
      '           TARIFA = :TARIFA AND'
      '           ARTICULO = A.ARTICULO AND'
      '           LINEA = 1  AND'
      '           ULT_MODIFICACION >= :FECHA_ULTIMA_MODIFICACION'
      '           ))'
      '--'
      ')'
      'ORDER BY A.ID_A')
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
      '  ,LITROS_POR_UNIDAD=?LITROS_POR_UNIDAD '
      '  ,ENTRADA=?ENTRADA '
      '  ,CONTROLA_MEDIDAS=?CONTROLA_MEDIDAS '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,DESCUENTO_2=?DESCUENTO_2 '
      '  ,DESCUENTO_3=?DESCUENTO_3 '
      '  ,ID_A=?ID_A '
      '  ,ID_A_M_C_T=?ID_A_M_C_T '
      '  ,IMAGEN=?IMAGEN '
      '  ,FABRICANTE=?FABRICANTE '
      '  ,TIPO_CLAVE_ADR=?TIPO_CLAVE_ADR '
      '  ,Z_TOL_ID_A_ARMAZON=?Z_TOL_ID_A_ARMAZON '
      '  ,Z_TOL_ID_A_LONA=?Z_TOL_ID_A_LONA '
      '  ,Z_MERMA=?Z_MERMA '
      '  ,ID_GALERIA=?ID_GALERIA '
      '  ,ID_MARCA=?ID_MARCA '
      '  ,FORMULA_DEFECTO=?FORMULA_DEFECTO '
      '  ,TITULO=?TITULO '
      '  ,ABIERTO=?ABIERTO '
      '  ,CONTROL_STOCK=?CONTROL_STOCK '
      '  ,VIRTUAL=?VIRTUAL '
      '  ,TITULO_CORTO=?TITULO_CORTO '
      '  ,SERIALIZADO=?SERIALIZADO '
      '  ,GARANTIA=?GARANTIA '
      '  ,PRODUCCION=?PRODUCCION '
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
      '  ,Z_RIBETE_DEFECTO=?Z_RIBETE_DEFECTO '
      '  ,Z_LON_COLOR_1=?Z_LON_COLOR_1 '
      '  ,Z_LON_COLOR_2=?Z_LON_COLOR_2 '
      '  ,Z_LON_COLOR_3=?Z_LON_COLOR_3 '
      '  ,GENERAR_PEDIDO_COMPRA_SIEMPRE=?GENERAR_PEDIDO_COMPRA_SIEMPRE '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
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
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 104
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 176
    Top = 104
  end
  object xCombinaciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_COMBINACION'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO ART_COMBINACION'
      '  (ID,ID_A,COMBINACION,DATE_INS,DATE_UPD,ID_TIPO_VEHICULO)'
      'VALUES'
      '  (?ID,?ID_A,?COMBINACION,?DATE_INS,?DATE_UPD,?ID_TIPO_VEHICULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_COMBINACION'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_COMBINACION'
      'WHERE'
      'DATE_UPD >= :FECHA_ULTIMA_MODIFICACION'
      'ORDER BY ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_COMBINACION'
      'SET'
      '  ID_A=?ID_A '
      '  ,COMBINACION=?COMBINACION '
      '  ,DATE_INS=?DATE_INS '
      '  ,DATE_UPD=?DATE_UPD '
      '  ,ID_TIPO_VEHICULO=?ID_TIPO_VEHICULO '
      'WHERE'
      '  ID=?ID ')
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_COMBINACION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 152
  end
  object DSxCombinaciones: TDataSource
    DataSet = xCombinaciones
    Left = 176
    Top = 152
  end
  object xCombinacionArtributo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_COMBINACION_ART_ATRIB'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO ART_COMBINACION_ART_ATRIB'
      
        '  (ID,ID_COMBINACION,ID_ATRIBUTO,DATE_INS,DATE_UPD,TIPO_ATRIBUTO' +
        '_PADRE,ID_ATRIBUTO_PADRE)'
      'VALUES'
      
        '  (?ID,?ID_COMBINACION,?ID_ATRIBUTO,?DATE_INS,?DATE_UPD,?TIPO_AT' +
        'RIBUTO_PADRE,?ID_ATRIBUTO_PADRE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_COMBINACION_ART_ATRIB'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_COMBINACION_ART_ATRIB'
      'WHERE'
      'DATE_UPD >= :FECHA_ULTIMA_MODIFICACION'
      'ORDER BY ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_COMBINACION_ART_ATRIB'
      'SET'
      '  ID_COMBINACION=?ID_COMBINACION '
      '  ,ID_ATRIBUTO=?ID_ATRIBUTO '
      '  ,DATE_INS=?DATE_INS '
      '  ,DATE_UPD=?DATE_UPD '
      '  ,TIPO_ATRIBUTO_PADRE=?TIPO_ATRIBUTO_PADRE '
      '  ,ID_ATRIBUTO_PADRE=?ID_ATRIBUTO_PADRE '
      'WHERE'
      '  ID=?ID ')
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_COMBINACION_ART_ATRIB'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 200
  end
  object DSxCombinacionAtributo: TDataSource
    DataSet = xCombinacionArtributo
    Left = 176
    Top = 200
  end
  object xElementosBorrados: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_SINC_ID_BORRADO'
      'WHERE')
    InsertSQL.Strings = (
      'INSERT INTO SYS_SINC_ID_BORRADO'
      '  ()'
      'VALUES'
      '  ()')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_SINC_ID_BORRADO'
      'WHERE')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_SINC_ID_BORRADO'
      'ORDER BY TIPO, ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_SINC_ID_BORRADO'
      'WHERE')
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_SINC_ID_BORRADO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 248
  end
  object DSxElementosBorrados: TDataSource
    DataSet = xElementosBorrados
    Left = 176
    Top = 248
  end
  object xStocks: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT DISTINCT S.ID_A'
      'FROM ART_MOV_STOCKS S'
      'JOIN ART_ARTICULOS A ON S.ID_A = A.ID_A'
      'WHERE'
      'S.EMPRESA = :EMPRESA AND'
      'A.WEB = 1 AND'
      'S.FECHA >= :FECHA_ULTIMA_MODIFICACION AND'
      'S.ID_A = :ID_A'
      'ORDER BY S.ID_A')
    SelectSQL.Strings = (
      'SELECT DISTINCT S.ID_A, A.ARTICULO'
      'FROM ART_MOV_STOCKS S'
      'JOIN ART_ARTICULOS A ON S.ID_A = A.ID_A'
      'WHERE'
      'S.EMPRESA = :EMPRESA AND'
      'A.WEB = 1 AND'
      'S.FECHA >= :FECHA_ULTIMA_MODIFICACION AND'
      'A.VIRTUAL = 0'
      'ORDER BY S.ID_A')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 296
  end
  object DSsStocks: TDataSource
    DataSet = xStocks
    Left = 176
    Top = 296
  end
end
