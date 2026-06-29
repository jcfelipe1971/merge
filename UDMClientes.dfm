object DMClientes: TDMClientes
  OldCreateOrder = False
  OnCreate = DMClientesCreate
  OnDestroy = DMClientesDestroy
  Left = 356
  Top = 209
  Height = 728
  Width = 998
  object QMClientes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CLIENTES_CUENTAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  CLIENTE=?old_CLIENTE ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CLIENTES_CUENTAS'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,CLIENTE,TERCERO,TARIFA,FORMA_PAGO,R' +
        'IESGO_EMP,RIESGO_CYC,RIESGO_FACTOR,RIESGO_AUT,'#13#10'RIESGO_ACT,MODO_' +
        'IVA,DIA_PAGO_1,DIA_PAGO_2,DIA_PAGO_3,DESCUENTO_PP,DESCUENTO_CIAL' +
        ',AGENTE,AGENTE2,NOTAS,'#13#10'CUENTA,TITULO,PERFIL,TIPO_IRPF,PAIS,TIPO' +
        ',PORTES,NOMBRE_COMERCIAL,USAR_ANTICIPOS,SU_PROVEEDOR,'#13#10'EVAL_FEB,' +
        'EVAL_FEB_SI,MONEDA,FINANCIACION,FACTURAR_AGENTE,FACTURAR_TRANSPO' +
        'RTISTA,FACTURAR_REFERENCIA,FACTURAR_DIRECCION,FACTURAR_SERIE,SER' +
        'IE_A_FACTURAR,'#13#10'ALBARANAR_SERIE,SERIE_A_ALBARANAR,FACTURAR_ALMAC' +
        'EN,TRANSPORTISTA,FACTURA_DIRECCION_ADMTVA,ALBARAN_DIRECCION_ENVI' +
        'O,POR_FINANCIACION,NO_ALB_FAC,NO_VENTA_RIESGO,SU_REFERENCIA,'#13#10'RI' +
        'ESGO_FAC,RIESGO_ALB,RIESGO_PEC,RIESGO_CAR,RIESGO_REM,MOROSO,CRED' +
        'ITO_Y_CAUCION,NRO_EMPLEADOS,FACTURACION_TOTAL,CONSUMO_MATERIAL,'#13 +
        #10'PROVEEDORES_HABITUALES,RUTA,RUTA_ORDEN,CLIENTE_POTENCIAL,TIPO_C' +
        'LIENTE,NO_CALC_DESC_KRI,NO_AGRUPAR_PED_KRI,POTENCIAL_DE_COMPRA,N' +
        'OTAS_FACTURACION_KRI,INTRA,'#13#10'INTRA_TRANS,FACTURAR_TARIFA,PAIS_C2' +
        ',TIT_LOCALIDAD,CODIGO_POSTAL,CUENTA_DTOPP,CUENTA_DTOCIAL,CUENTA_' +
        'IRPF,DIAS_ENTREGA,IDIOMA,'#13#10'APLICAR_PTO_VERDE,COD_CREDITO_Y_CAUCI' +
        'ON,FACTURAS_POR_EMAIL_KRI,TIPO_PORTES,POR_PORTES,I_PORTES,RANGO,' +
        'INDICE,FRECUENCIA,ZONA,'#13#10'TITULO_ZONA,PROTOCOLO,BLOQUEO,MOTIVO_BL' +
        'OQUEO,CODIGO_INCOTERM,DIR_DEFECTO_VENTAS,DIRECCION_DEFECTO,FECHA' +
        '_ENTREGA_X_STOCK,SIN_DESCUENTOS,'#13#10'UTILIZA_F_PAGO_ALTERNATIVA,BAJ' +
        'A,FECHA_BAJA,MOTIVO_BAJA,TELEFONO,TELEFONO02,TELEFAX,TIPO_NCF,CU' +
        'ENTA_COMPRA,CUENTA_VENTA,'#13#10'DTO_CIAL_LINEA,DTO_CIAL_LINEA_2,DTO_C' +
        'IAL_LINEA_3,FEC_PROP_CREDITO_Y_CAUCION,RECC,EXPORTAR,BANCO_PAGOS' +
        ',PEDIDO_VALORADO,ALBARAN_VALORADO,PERIODO_FACTURACION,'#13#10'CLIENTE_' +
        'PADRE,GRUPO_CUENTAS,PAIS_TERCERO,TIPO_DOC_IDENT,NIF,SEPARAR_DTO_' +
        'CIAL,ID_CLIENTE,DIA_SEMANA_PAGO,CATEGORIA,CANAL_DST_PEC,'#13#10'SERIE_' +
        'DST_PEC,TIPO_DST_PEC,IMPORTE_MINIMO_PORTE,FECHA_ALTA,NO_AGRUPAR_' +
        'ALBARANES,EMAIL,ALFA_1,ALFA_2,ALFA_3,ALFA_4,'#13#10'ALFA_5,ALFA_6,ALFA' +
        '_7,ALFA_8,TITULO_REGION,TITULO_PROVINCIA,TITULO_POBLACION,TITULO' +
        '_CODIGO_POSTAL,PROYECTO,GIRO_CLIENTE,'#13#10'ENTRADA,ENVIAR_CONFIRMACI' +
        'ON_PEDIDO)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?CLIENTE,?TERCERO,?TARIFA,?FORMA' +
        '_PAGO,?RIESGO_EMP,?RIESGO_CYC,?RIESGO_FACTOR,?RIESGO_AUT,'#13#10'?RIES' +
        'GO_ACT,?MODO_IVA,?DIA_PAGO_1,?DIA_PAGO_2,?DIA_PAGO_3,?DESCUENTO_' +
        'PP,?DESCUENTO_CIAL,?AGENTE,?AGENTE2,?NOTAS,'#13#10'?CUENTA,?TITULO,?PE' +
        'RFIL,?TIPO_IRPF,?PAIS,?TIPO,?PORTES,?NOMBRE_COMERCIAL,?USAR_ANTI' +
        'CIPOS,?SU_PROVEEDOR,'#13#10'?EVAL_FEB,?EVAL_FEB_SI,?MONEDA,?FINANCIACI' +
        'ON,?FACTURAR_AGENTE,?FACTURAR_TRANSPORTISTA,?FACTURAR_REFERENCIA' +
        ',?FACTURAR_DIRECCION,?FACTURAR_SERIE,?SERIE_A_FACTURAR,'#13#10'?ALBARA' +
        'NAR_SERIE,?SERIE_A_ALBARANAR,?FACTURAR_ALMACEN,?TRANSPORTISTA,?F' +
        'ACTURA_DIRECCION_ADMTVA,?ALBARAN_DIRECCION_ENVIO,?POR_FINANCIACI' +
        'ON,?NO_ALB_FAC,?NO_VENTA_RIESGO,?SU_REFERENCIA,'#13#10'?RIESGO_FAC,?RI' +
        'ESGO_ALB,?RIESGO_PEC,?RIESGO_CAR,?RIESGO_REM,?MOROSO,?CREDITO_Y_' +
        'CAUCION,?NRO_EMPLEADOS,?FACTURACION_TOTAL,?CONSUMO_MATERIAL,'#13#10'?P' +
        'ROVEEDORES_HABITUALES,?RUTA,?RUTA_ORDEN,?CLIENTE_POTENCIAL,?TIPO' +
        '_CLIENTE,?NO_CALC_DESC_KRI,?NO_AGRUPAR_PED_KRI,?POTENCIAL_DE_COM' +
        'PRA,?NOTAS_FACTURACION_KRI,?INTRA,'#13#10'?INTRA_TRANS,?FACTURAR_TARIF' +
        'A,?PAIS_C2,?TIT_LOCALIDAD,?CODIGO_POSTAL,?CUENTA_DTOPP,?CUENTA_D' +
        'TOCIAL,?CUENTA_IRPF,?DIAS_ENTREGA,?IDIOMA,'#13#10'?APLICAR_PTO_VERDE,?' +
        'COD_CREDITO_Y_CAUCION,?FACTURAS_POR_EMAIL_KRI,?TIPO_PORTES,?POR_' +
        'PORTES,?I_PORTES,?RANGO,?INDICE,?FRECUENCIA,?ZONA,'#13#10'?TITULO_ZONA' +
        ',?PROTOCOLO,?BLOQUEO,?MOTIVO_BLOQUEO,?CODIGO_INCOTERM,?DIR_DEFEC' +
        'TO_VENTAS,?DIRECCION_DEFECTO,?FECHA_ENTREGA_X_STOCK,?SIN_DESCUEN' +
        'TOS,'#13#10'?UTILIZA_F_PAGO_ALTERNATIVA,?BAJA,?FECHA_BAJA,?MOTIVO_BAJA' +
        ',?TELEFONO,?TELEFONO02,?TELEFAX,?TIPO_NCF,?CUENTA_COMPRA,?CUENTA' +
        '_VENTA,'#13#10'?DTO_CIAL_LINEA,?DTO_CIAL_LINEA_2,?DTO_CIAL_LINEA_3,?FE' +
        'C_PROP_CREDITO_Y_CAUCION,?RECC,?EXPORTAR,?BANCO_PAGOS,?PEDIDO_VA' +
        'LORADO,?ALBARAN_VALORADO,?PERIODO_FACTURACION,'#13#10'?CLIENTE_PADRE,?' +
        'GRUPO_CUENTAS,?PAIS_TERCERO,?TIPO_DOC_IDENT,?NIF,?SEPARAR_DTO_CI' +
        'AL,?ID_CLIENTE,?DIA_SEMANA_PAGO,?CATEGORIA,?CANAL_DST_PEC,'#13#10'?SER' +
        'IE_DST_PEC,?TIPO_DST_PEC,?IMPORTE_MINIMO_PORTE,?FECHA_ALTA,?NO_A' +
        'GRUPAR_ALBARANES,?EMAIL,?ALFA_1,?ALFA_2,?ALFA_3,?ALFA_4,'#13#10'?ALFA_' +
        '5,?ALFA_6,?ALFA_7,?ALFA_8,?TITULO_REGION,?TITULO_PROVINCIA,?TITU' +
        'LO_POBLACION,?TITULO_CODIGO_POSTAL,?PROYECTO,?GIRO_CLIENTE,'#13#10'?EN' +
        'TRADA,?ENVIAR_CONFIRMACION_PEDIDO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CLIENTES_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  CLIENTE=?CLIENTE ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CLIENTES_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL '
      'ORDER BY CLIENTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CLIENTES_CUENTAS'
      'SET'
      '  TERCERO=?TERCERO '
      '  ,TARIFA=?TARIFA '
      '  ,FORMA_PAGO=?FORMA_PAGO '
      '  ,RIESGO_EMP=?RIESGO_EMP '
      '  ,RIESGO_CYC=?RIESGO_CYC '
      '  ,RIESGO_FACTOR=?RIESGO_FACTOR '
      '  ,RIESGO_AUT=?RIESGO_AUT '
      '  ,RIESGO_ACT=?RIESGO_ACT '
      '  ,MODO_IVA=?MODO_IVA '
      '  ,DIA_PAGO_1=?DIA_PAGO_1 '
      '  ,DIA_PAGO_2=?DIA_PAGO_2 '
      '  ,DIA_PAGO_3=?DIA_PAGO_3 '
      '  ,DESCUENTO_PP=?DESCUENTO_PP '
      '  ,DESCUENTO_CIAL=?DESCUENTO_CIAL '
      '  ,AGENTE=?AGENTE '
      '  ,AGENTE2=?AGENTE2 '
      '  ,NOTAS=?NOTAS '
      '  ,CUENTA=?CUENTA '
      '  ,TITULO=?TITULO '
      '  ,PERFIL=?PERFIL '
      '  ,TIPO_IRPF=?TIPO_IRPF '
      '  ,PAIS=?PAIS '
      '  ,TIPO=?TIPO '
      '  ,PORTES=?PORTES '
      '  ,NOMBRE_COMERCIAL=?NOMBRE_COMERCIAL '
      '  ,USAR_ANTICIPOS=?USAR_ANTICIPOS '
      '  ,SU_PROVEEDOR=?SU_PROVEEDOR '
      '  ,EVAL_FEB=?EVAL_FEB '
      '  ,EVAL_FEB_SI=?EVAL_FEB_SI '
      '  ,MONEDA=?MONEDA '
      '  ,FINANCIACION=?FINANCIACION '
      '  ,FACTURAR_AGENTE=?FACTURAR_AGENTE '
      '  ,FACTURAR_TRANSPORTISTA=?FACTURAR_TRANSPORTISTA '
      '  ,FACTURAR_REFERENCIA=?FACTURAR_REFERENCIA '
      '  ,FACTURAR_DIRECCION=?FACTURAR_DIRECCION '
      '  ,FACTURAR_SERIE=?FACTURAR_SERIE '
      '  ,SERIE_A_FACTURAR=?SERIE_A_FACTURAR '
      '  ,ALBARANAR_SERIE=?ALBARANAR_SERIE '
      '  ,SERIE_A_ALBARANAR=?SERIE_A_ALBARANAR '
      '  ,FACTURAR_ALMACEN=?FACTURAR_ALMACEN '
      '  ,TRANSPORTISTA=?TRANSPORTISTA '
      '  ,FACTURA_DIRECCION_ADMTVA=?FACTURA_DIRECCION_ADMTVA '
      '  ,ALBARAN_DIRECCION_ENVIO=?ALBARAN_DIRECCION_ENVIO '
      '  ,POR_FINANCIACION=?POR_FINANCIACION '
      '  ,NO_ALB_FAC=?NO_ALB_FAC '
      '  ,NO_VENTA_RIESGO=?NO_VENTA_RIESGO '
      '  ,SU_REFERENCIA=?SU_REFERENCIA '
      '  ,RIESGO_FAC=?RIESGO_FAC '
      '  ,RIESGO_ALB=?RIESGO_ALB '
      '  ,RIESGO_PEC=?RIESGO_PEC '
      '  ,RIESGO_CAR=?RIESGO_CAR '
      '  ,RIESGO_REM=?RIESGO_REM '
      '  ,MOROSO=?MOROSO '
      '  ,CREDITO_Y_CAUCION=?CREDITO_Y_CAUCION '
      '  ,NRO_EMPLEADOS=?NRO_EMPLEADOS '
      '  ,FACTURACION_TOTAL=?FACTURACION_TOTAL '
      '  ,CONSUMO_MATERIAL=?CONSUMO_MATERIAL '
      '  ,PROVEEDORES_HABITUALES=?PROVEEDORES_HABITUALES '
      '  ,RUTA=?RUTA '
      '  ,RUTA_ORDEN=?RUTA_ORDEN '
      '  ,CLIENTE_POTENCIAL=?CLIENTE_POTENCIAL '
      '  ,TIPO_CLIENTE=?TIPO_CLIENTE '
      '  ,NO_CALC_DESC_KRI=?NO_CALC_DESC_KRI '
      '  ,NO_AGRUPAR_PED_KRI=?NO_AGRUPAR_PED_KRI '
      '  ,POTENCIAL_DE_COMPRA=?POTENCIAL_DE_COMPRA '
      '  ,NOTAS_FACTURACION_KRI=?NOTAS_FACTURACION_KRI '
      '  ,INTRA=?INTRA '
      '  ,INTRA_TRANS=?INTRA_TRANS '
      '  ,FACTURAR_TARIFA=?FACTURAR_TARIFA '
      '  ,PAIS_C2=?PAIS_C2 '
      '  ,TIT_LOCALIDAD=?TIT_LOCALIDAD '
      '  ,CODIGO_POSTAL=?CODIGO_POSTAL '
      '  ,CUENTA_DTOPP=?CUENTA_DTOPP '
      '  ,CUENTA_DTOCIAL=?CUENTA_DTOCIAL '
      '  ,CUENTA_IRPF=?CUENTA_IRPF '
      '  ,DIAS_ENTREGA=?DIAS_ENTREGA '
      '  ,IDIOMA=?IDIOMA '
      '  ,APLICAR_PTO_VERDE=?APLICAR_PTO_VERDE '
      '  ,COD_CREDITO_Y_CAUCION=?COD_CREDITO_Y_CAUCION '
      '  ,FACTURAS_POR_EMAIL_KRI=?FACTURAS_POR_EMAIL_KRI '
      '  ,TIPO_PORTES=?TIPO_PORTES '
      '  ,POR_PORTES=?POR_PORTES '
      '  ,I_PORTES=?I_PORTES '
      '  ,RANGO=?RANGO '
      '  ,INDICE=?INDICE '
      '  ,FRECUENCIA=?FRECUENCIA '
      '  ,ZONA=?ZONA '
      '  ,TITULO_ZONA=?TITULO_ZONA '
      '  ,PROTOCOLO=?PROTOCOLO '
      '  ,BLOQUEO=?BLOQUEO '
      '  ,MOTIVO_BLOQUEO=?MOTIVO_BLOQUEO '
      '  ,CODIGO_INCOTERM=?CODIGO_INCOTERM '
      '  ,DIR_DEFECTO_VENTAS=?DIR_DEFECTO_VENTAS '
      '  ,DIRECCION_DEFECTO=?DIRECCION_DEFECTO '
      '  ,FECHA_ENTREGA_X_STOCK=?FECHA_ENTREGA_X_STOCK '
      '  ,SIN_DESCUENTOS=?SIN_DESCUENTOS '
      '  ,UTILIZA_F_PAGO_ALTERNATIVA=?UTILIZA_F_PAGO_ALTERNATIVA '
      '  ,BAJA=?BAJA '
      '  ,FECHA_BAJA=?FECHA_BAJA '
      '  ,MOTIVO_BAJA=?MOTIVO_BAJA '
      '  ,TELEFONO=?TELEFONO '
      '  ,TELEFONO02=?TELEFONO02 '
      '  ,TELEFAX=?TELEFAX '
      '  ,TIPO_NCF=?TIPO_NCF '
      '  ,CUENTA_COMPRA=?CUENTA_COMPRA '
      '  ,CUENTA_VENTA=?CUENTA_VENTA '
      '  ,DTO_CIAL_LINEA=?DTO_CIAL_LINEA '
      '  ,DTO_CIAL_LINEA_2=?DTO_CIAL_LINEA_2 '
      '  ,DTO_CIAL_LINEA_3=?DTO_CIAL_LINEA_3 '
      '  ,FEC_PROP_CREDITO_Y_CAUCION=?FEC_PROP_CREDITO_Y_CAUCION '
      '  ,RECC=?RECC '
      '  ,EXPORTAR=?EXPORTAR '
      '  ,BANCO_PAGOS=?BANCO_PAGOS '
      '  ,PEDIDO_VALORADO=?PEDIDO_VALORADO '
      '  ,ALBARAN_VALORADO=?ALBARAN_VALORADO '
      '  ,PERIODO_FACTURACION=?PERIODO_FACTURACION '
      '  ,CLIENTE_PADRE=?CLIENTE_PADRE '
      '  ,GRUPO_CUENTAS=?GRUPO_CUENTAS '
      '  ,PAIS_TERCERO=?PAIS_TERCERO '
      '  ,TIPO_DOC_IDENT=?TIPO_DOC_IDENT '
      '  ,NIF=?NIF '
      '  ,SEPARAR_DTO_CIAL=?SEPARAR_DTO_CIAL '
      '  ,ID_CLIENTE=?ID_CLIENTE '
      '  ,DIA_SEMANA_PAGO=?DIA_SEMANA_PAGO '
      '  ,CATEGORIA=?CATEGORIA '
      '  ,CANAL_DST_PEC=?CANAL_DST_PEC '
      '  ,SERIE_DST_PEC=?SERIE_DST_PEC '
      '  ,TIPO_DST_PEC=?TIPO_DST_PEC '
      '  ,IMPORTE_MINIMO_PORTE=?IMPORTE_MINIMO_PORTE '
      '  ,FECHA_ALTA=?FECHA_ALTA '
      '  ,NO_AGRUPAR_ALBARANES=?NO_AGRUPAR_ALBARANES '
      '  ,EMAIL=?EMAIL '
      '  ,ALFA_1=?ALFA_1 '
      '  ,ALFA_2=?ALFA_2 '
      '  ,ALFA_3=?ALFA_3 '
      '  ,ALFA_4=?ALFA_4 '
      '  ,ALFA_5=?ALFA_5 '
      '  ,ALFA_6=?ALFA_6 '
      '  ,ALFA_7=?ALFA_7 '
      '  ,ALFA_8=?ALFA_8 '
      '  ,TITULO_REGION=?TITULO_REGION '
      '  ,TITULO_PROVINCIA=?TITULO_PROVINCIA '
      '  ,TITULO_POBLACION=?TITULO_POBLACION '
      '  ,TITULO_CODIGO_POSTAL=?TITULO_CODIGO_POSTAL '
      '  ,PROYECTO=?PROYECTO '
      '  ,GIRO_CLIENTE=?GIRO_CLIENTE '
      '  ,ENTRADA=?ENTRADA '
      '  ,ENVIAR_CONFIRMACION_PEDIDO=?ENVIAR_CONFIRMACION_PEDIDO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  CLIENTE=?CLIENTE ')
    AutoCalcFields = False
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CLIENTES_CUENTAS CLI INDEX (EMP_CLIENTES_CL' +
        'I_TER),VER_CLIENTES_CUENTAS DI INDEX (PK_SYS_TERCEROS_DIRECCIONE' +
        'S),VER_CLIENTES_CUENTAS LOC INDEX (ID_LOCALIDADES),VER_CLIENTES_' +
        'CUENTAS GCLI INDEX (PK_CON_CUENTAS_GES_CLI),VER_CLIENTES_CUENTAS' +
        ' TER INDEX (PK_SYS_TERCEROS)))')
    AfterOpen = QMClientesAfterOpen
    AfterPost = QMClientesAfterPost
    BeforeClose = QMClientesBeforeClose
    BeforeEdit = QMClientesBeforeEdit
    BeforePost = QMClientesBeforePost
    OnCalcFields = QMClientesCalcFields
    OnNewRecord = QMClientesNewRecord
    OnPostError = QMClientesPostError
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'CLIENTE ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CLIENTES_CUENTAS'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'CON_CUENTAS_GES_CLI'
      'EMP_CLIENTES')
    CamposBloqueo.Strings = (
      'EMPRESA,EJERCICIO,CANAL,CLIENTE'
      'EMPRESA,CLIENTE')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 8
    object QMClientesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMClientesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMClientesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMClientesCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMClientesTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
      OnChange = QMClientesTERCEROChange
    end
    object QMClientesTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMClientesFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMClientesRIESGO_AUT: TFloatField
      DisplayLabel = 'Riesgo Autorizado'
      FieldName = 'RIESGO_AUT'
    end
    object QMClientesRIESGO_ACT: TFloatField
      DisplayLabel = 'Riesgo Actual'
      FieldName = 'RIESGO_ACT'
    end
    object QMClientesMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object QMClientesDIA_PAGO_1: TIntegerField
      DisplayLabel = 'Dia Pago 1'
      FieldName = 'DIA_PAGO_1'
    end
    object QMClientesDIA_PAGO_2: TIntegerField
      DisplayLabel = 'Dia Pago 2'
      FieldName = 'DIA_PAGO_2'
    end
    object QMClientesDESCUENTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DESCUENTO_PP'
    end
    object QMClientesDESCUENTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial.'
      FieldName = 'DESCUENTO_CIAL'
    end
    object QMClientesAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMClientesNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMClientesCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMClientesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMClientesPERFIL: TFIBStringField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
      Size = 4
    end
    object QMClientesTIPO_IRPF: TIntegerField
      DisplayLabel = 'Tipo IRPF'
      FieldName = 'TIPO_IRPF'
      OnChange = QMClientesTIPO_IRPFChange
    end
    object QMClientesPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMClientesTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      OnChange = QMClientesTIPOChange
    end
    object QMClientesPORTES: TIntegerField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
    end
    object QMClientesNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMClientesUSAR_ANTICIPOS: TIntegerField
      DisplayLabel = 'Usar Antic.'
      FieldName = 'USAR_ANTICIPOS'
    end
    object QMClientesSU_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Su Prov.'
      FieldName = 'SU_PROVEEDOR'
      Size = 40
    end
    object QMClientesEVAL_FEB: TIntegerField
      DisplayLabel = 'Eval. Feb.'
      FieldName = 'EVAL_FEB'
    end
    object QMClientesEVAL_FEB_SI: TIntegerField
      DisplayLabel = 'Eval. Feb. Si'
      FieldName = 'EVAL_FEB_SI'
    end
    object QMClientesMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMClientesFINANCIACION: TIntegerField
      DisplayLabel = 'Financ.'
      FieldName = 'FINANCIACION'
    end
    object QMClientesFACTURAR_AGENTE: TIntegerField
      DisplayLabel = 'Fact. Agente'
      FieldName = 'FACTURAR_AGENTE'
    end
    object QMClientesFACTURAR_TRANSPORTISTA: TIntegerField
      DisplayLabel = 'Fact. Transp.'
      FieldName = 'FACTURAR_TRANSPORTISTA'
    end
    object QMClientesFACTURAR_REFERENCIA: TIntegerField
      DisplayLabel = 'Fact. Ref.'
      FieldName = 'FACTURAR_REFERENCIA'
    end
    object QMClientesFACTURAR_DIRECCION: TIntegerField
      DisplayLabel = 'Fact. Dir.'
      FieldName = 'FACTURAR_DIRECCION'
    end
    object QMClientesRIESGOVENCIDO: TFloatField
      DisplayLabel = 'Riesgo Vencido'
      FieldKind = fkCalculated
      FieldName = 'RIESGOVENCIDO'
      Calculated = True
    end
    object QMClientesRIESGO_AUT_CANAL: TFloatField
      DisplayLabel = 'Riesgo Autorizado Can.'
      FieldKind = fkCalculated
      FieldName = 'RIESGO_AUT_CANAL'
      Calculated = True
    end
    object QMClientesRIESGO_ACT_CANAL: TFloatField
      DisplayLabel = 'Riesgo Actual Can.'
      FieldKind = fkCalculated
      FieldName = 'RIESGO_ACT_CANAL'
      Calculated = True
    end
    object QMClientesFACTURA_DIRECCION_ADMTVA: TIntegerField
      DisplayLabel = 'Fact. Dir. Admtiva.'
      FieldName = 'FACTURA_DIRECCION_ADMTVA'
    end
    object QMClientesALBARAN_DIRECCION_ENVIO: TIntegerField
      DisplayLabel = 'Alb. Direccion de Envio'
      FieldName = 'ALBARAN_DIRECCION_ENVIO'
    end
    object QMClientesPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object QMClientesNO_ALB_FAC: TIntegerField
      DisplayLabel = 'No Alb. Fac.'
      FieldName = 'NO_ALB_FAC'
    end
    object QMClientesNO_VENTA_RIESGO: TIntegerField
      DisplayLabel = 'No venta bajo riesgo'
      FieldName = 'NO_VENTA_RIESGO'
      OnChange = QMClientesRIESGO_AUTChange
    end
    object QMClientesFACTURAR_SERIE: TIntegerField
      DisplayLabel = 'Fact. Serie'
      FieldName = 'FACTURAR_SERIE'
    end
    object QMClientesSERIE_A_FACTURAR: TFIBStringField
      DisplayLabel = 'Serie a Fact.'
      FieldName = 'SERIE_A_FACTURAR'
      Size = 10
    end
    object QMClientesTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
    end
    object QMClientesSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMClientesFACTURAR_ALMACEN: TIntegerField
      DisplayLabel = 'Fact. Alm.'
      FieldName = 'FACTURAR_ALMACEN'
    end
    object QMClientesRIESGO_FAC: TFloatField
      DisplayLabel = 'Riesgo Fac.'
      FieldName = 'RIESGO_FAC'
    end
    object QMClientesRIESGO_ALB: TFloatField
      DisplayLabel = 'Riesgo Alb.'
      FieldName = 'RIESGO_ALB'
    end
    object QMClientesRIESGO_CAR: TFloatField
      DisplayLabel = 'Riesgo Cartera'
      FieldName = 'RIESGO_CAR'
    end
    object QMClientesRIESGO_REM: TFloatField
      DisplayLabel = 'Riesgo Rem.'
      FieldName = 'RIESGO_REM'
    end
    object QMClientesRIESGODESCUENTO: TFloatField
      DisplayLabel = 'Riesgo Desc.'
      FieldKind = fkCalculated
      FieldName = 'RIESGODESCUENTO'
      Calculated = True
    end
    object QMClientesRIESGO_PENDIENTE: TFloatField
      DisplayLabel = 'Riesgo Pend.'
      FieldKind = fkCalculated
      FieldName = 'RIESGO_PENDIENTE'
      Calculated = True
    end
    object QMClientesFACTURAR_TARIFA: TIntegerField
      DisplayLabel = 'Fact. Tarifa'
      FieldName = 'FACTURAR_TARIFA'
    end
    object QMClientesMOROSO: TIntegerField
      DisplayLabel = 'Moroso'
      FieldName = 'MOROSO'
    end
    object QMClientesCREDITO_Y_CAUCION: TIntegerField
      DisplayLabel = 'Cred. y Caucion'
      FieldName = 'CREDITO_Y_CAUCION'
    end
    object QMClientesNRO_EMPLEADOS: TIntegerField
      DisplayLabel = 'Nro. Empleados'
      FieldName = 'NRO_EMPLEADOS'
    end
    object QMClientesFACTURACION_TOTAL: TFloatField
      DisplayLabel = 'Fact. Total'
      FieldName = 'FACTURACION_TOTAL'
    end
    object QMClientesCONSUMO_MATERIAL: TFloatField
      DisplayLabel = 'Consumo Mat.'
      FieldName = 'CONSUMO_MATERIAL'
    end
    object QMClientesPROVEEDORES_HABITUALES: TFIBStringField
      DisplayLabel = 'Proveedores Habituales'
      FieldName = 'PROVEEDORES_HABITUALES'
      Size = 100
    end
    object QMClientesRUTA: TIntegerField
      DisplayLabel = 'Ruta'
      FieldName = 'RUTA'
      OnChange = QMClientesRUTAChange
    end
    object QMClientesRUTA_ORDEN: TIntegerField
      DisplayLabel = 'Orden de Ruta'
      FieldName = 'RUTA_ORDEN'
    end
    object QMClientesCLIENTE_POTENCIAL: TIntegerField
      DisplayLabel = 'Cliente Potencial'
      FieldName = 'CLIENTE_POTENCIAL'
    end
    object QMClientesTIPO_CLIENTE: TFIBStringField
      DisplayLabel = 'Tipo Cli.'
      FieldName = 'TIPO_CLIENTE'
      Size = 25
    end
    object QMClientesNO_CALC_DESC_KRI: TSmallintField
      FieldName = 'NO_CALC_DESC_KRI'
    end
    object QMClientesNO_AGRUPAR_PED_KRI: TIntegerField
      DisplayLabel = 'No Agrup. Ped.'
      FieldName = 'NO_AGRUPAR_PED_KRI'
    end
    object QMClientesPOTENCIAL_DE_COMPRA: TFloatField
      DisplayLabel = 'Pot. de Compra'
      FieldName = 'POTENCIAL_DE_COMPRA'
    end
    object QMClientesNOTAS_FACTURACION_KRI: TBlobField
      DisplayLabel = 'Notas Fac.'
      FieldName = 'NOTAS_FACTURACION_KRI'
      Size = 8
    end
    object QMClientesRIESGO_PED: TFloatField
      DisplayLabel = 'Riesgo Ped. Pend.'
      FieldKind = fkCalculated
      FieldName = 'RIESGO_PED'
      ReadOnly = True
      Calculated = True
    end
    object QMClientesRIESGO_PEC: TFloatField
      DisplayLabel = 'Riesgo Ped.'
      FieldName = 'RIESGO_PEC'
    end
    object QMClientesINTRA: TIntegerField
      DisplayLabel = 'Intra.'
      FieldName = 'INTRA'
    end
    object QMClientesINTRA_TRANS: TIntegerField
      DisplayLabel = 'Intra. Trans.'
      FieldName = 'INTRA_TRANS'
    end
    object QMClientesPAIS_C2: TFIBStringField
      DisplayLabel = 'Pais C2'
      FieldName = 'PAIS_C2'
      Size = 2
    end
    object QMClientesRIESGOREMPAG: TFloatField
      DisplayLabel = 'Riesgo Pagare'
      FieldKind = fkCalculated
      FieldName = 'RIESGOREMPAG'
      Calculated = True
    end
    object QMClientesTIT_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TIT_LOCALIDAD'
      Size = 40
    end
    object QMClientesCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object QMClientesCUENTA_DTOPP: TFIBStringField
      DisplayLabel = 'Cta. Dto. P.P.'
      FieldName = 'CUENTA_DTOPP'
      Size = 15
    end
    object QMClientesDIAS_ENTREGA: TIntegerField
      DisplayLabel = 'Dias Entrega'
      FieldName = 'DIAS_ENTREGA'
    end
    object QMClientesIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMClientesAPLICAR_PTO_VERDE: TIntegerField
      DisplayLabel = 'Aplic. Pto. Verde'
      FieldName = 'APLICAR_PTO_VERDE'
    end
    object QMClientesCOD_CREDITO_Y_CAUCION: TIntegerField
      DisplayLabel = 'Cod. Cred./Caucion'
      FieldName = 'COD_CREDITO_Y_CAUCION'
    end
    object QMClientesFACTURAS_POR_EMAIL_KRI: TIntegerField
      DisplayLabel = 'Fact. x email'
      FieldName = 'FACTURAS_POR_EMAIL_KRI'
    end
    object QMClientesTIPO_PORTES: TIntegerField
      DisplayLabel = 'Tipo Portes'
      FieldName = 'TIPO_PORTES'
      OnChange = QMClientesTIPO_PORTESChange
    end
    object QMClientesPOR_PORTES: TFloatField
      DisplayLabel = '% Portes'
      FieldName = 'POR_PORTES'
    end
    object QMClientesI_PORTES: TFloatField
      DisplayLabel = 'Imp. Portes'
      FieldName = 'I_PORTES'
    end
    object QMClientesRANGO: TIntegerField
      DisplayLabel = 'Rango'
      FieldName = 'RANGO'
      OnChange = QMClientesRANGOChange
    end
    object QMClientesINDICE: TIntegerField
      DisplayLabel = 'Indice'
      FieldName = 'INDICE'
      OnChange = QMClientesINDICEChange
    end
    object QMClientesANTICIPO_EMP: TFloatField
      DisplayLabel = 'Anticipado Emp.'
      FieldKind = fkCalculated
      FieldName = 'ANTICIPO_EMP'
      Calculated = True
    end
    object QMClientesANTICIPO_CAN: TFloatField
      DisplayLabel = 'Anticipado'
      FieldKind = fkCalculated
      FieldName = 'ANTICIPO_CAN'
      Calculated = True
    end
    object QMClientesFRECUENCIA: TIntegerField
      DisplayLabel = 'Frecuencia'
      FieldName = 'FRECUENCIA'
    end
    object QMClientesFECHA_ULT_COMPRA_KRI: TDateField
      DisplayLabel = 'Fec. Ult. Compra'
      FieldKind = fkCalculated
      FieldName = 'FECHA_ULT_COMPRA_KRI'
      OnGetText = QMClientesFECHA_ULT_COMPRA_KRIGetText
      Calculated = True
    end
    object QMClientesRIESGO_ACT_PED: TFloatField
      DisplayLabel = 'Riesgo Total'
      FieldKind = fkCalculated
      FieldName = 'RIESGO_ACT_PED'
      Calculated = True
    end
    object QMClientesRIESGO_PENDIENTE_PED: TFloatField
      DisplayLabel = 'Riesgo Pend. Total'
      FieldKind = fkCalculated
      FieldName = 'RIESGO_PENDIENTE_PED'
      Calculated = True
    end
    object QMClientesIMPAGADOS_KRI: TFloatField
      DisplayLabel = 'Impagado'
      FieldKind = fkCalculated
      FieldName = 'IMPAGADOS_KRI'
      OnGetText = QMClientesIMPAGADOS_KRIGetText
      Calculated = True
    end
    object QMClientesZONA: TFIBStringField
      DisplayLabel = 'Zona'
      FieldName = 'ZONA'
      Size = 15
    end
    object QMClientesPROTOCOLO: TFIBStringField
      DisplayLabel = 'Protocolo'
      FieldName = 'PROTOCOLO'
      Size = 5
    end
    object QMClientesBLOQUEO: TIntegerField
      DisplayLabel = 'Bloqueo'
      FieldName = 'BLOQUEO'
    end
    object QMClientesMOTIVO_BLOQUEO: TFIBStringField
      DisplayLabel = 'Motivo Bloq.'
      FieldName = 'MOTIVO_BLOQUEO'
      Size = 40
    end
    object QMClientesCODIGO_INCOTERM: TFIBStringField
      DisplayLabel = 'Cod. INCOTERM'
      FieldName = 'CODIGO_INCOTERM'
      Size = 3
    end
    object QMClientesDIR_DEFECTO_VENTAS: TIntegerField
      DisplayLabel = 'Direccion por defecto en ventas'
      FieldName = 'DIR_DEFECTO_VENTAS'
    end
    object QMClientesFECHA_ENTREGA_X_STOCK: TIntegerField
      DisplayLabel = 'Calc. Fecha entrega por stock'
      FieldName = 'FECHA_ENTREGA_X_STOCK'
    end
    object QMClientesDIRECCION_DEFECTO: TIntegerField
      DisplayLabel = 'Dir. Defecto en Ventas'
      FieldName = 'DIRECCION_DEFECTO'
    end
    object QMClientesSIN_DESCUENTOS: TIntegerField
      DisplayLabel = 'Sin Dtos.'
      FieldName = 'SIN_DESCUENTOS'
    end
    object QMClientesUTILIZA_F_PAGO_ALTERNATIVA: TIntegerField
      DisplayLabel = 'Utiliza F. Pago Alternativa'
      FieldName = 'UTILIZA_F_PAGO_ALTERNATIVA'
    end
    object QMClientesBAJA: TIntegerField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMClientesFECHA_BAJA: TDateTimeField
      DisplayLabel = 'Fecha Baja'
      FieldName = 'FECHA_BAJA'
    end
    object QMClientesMOTIVO_BAJA: TFIBStringField
      DisplayLabel = 'Motivo Baja'
      FieldName = 'MOTIVO_BAJA'
      Size = 60
    end
    object QMClientesCUENTA_DTOCIAL: TFIBStringField
      DisplayLabel = 'Cta. Dto. Cial.'
      FieldName = 'CUENTA_DTOCIAL'
      Size = 15
    end
    object QMClientesTIPO_NCF: TIntegerField
      DisplayLabel = 'Tipo NCF'
      FieldName = 'TIPO_NCF'
    end
    object QMClientesCUENTA_COMPRA: TFIBStringField
      DisplayLabel = 'Cuenta Compras'
      FieldName = 'CUENTA_COMPRA'
      Size = 15
    end
    object QMClientesCUENTA_VENTA: TFIBStringField
      DisplayLabel = 'Cuenta Ventas'
      FieldName = 'CUENTA_VENTA'
      Size = 15
    end
    object QMClientesALBARAN_VALORADO: TIntegerField
      DisplayLabel = 'Valorar Alb.'
      FieldName = 'ALBARAN_VALORADO'
    end
    object QMClientesTELEFONO: TFIBStringField
      DisplayLabel = 'Tel'#233'fono'
      FieldName = 'TELEFONO'
    end
    object QMClientesFEC_PROP_CREDITO_Y_CAUCION: TDateTimeField
      DisplayLabel = 'F. propuesta'
      FieldName = 'FEC_PROP_CREDITO_Y_CAUCION'
    end
    object QMClientesRECC: TIntegerField
      DisplayLabel = 'Reg. Esp. Critero de Caja'
      FieldName = 'RECC'
    end
    object QMClientesEXPORTAR: TIntegerField
      DisplayLabel = 'Exportar'
      FieldName = 'EXPORTAR'
    end
    object QMClientesID_CUSTOMER_PRESTASHOP: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ID_CUSTOMER_PRESTASHOP'
      ProviderFlags = [pfInUpdate]
      Calculated = True
    end
    object QMClientesBANCO_PAGOS: TIntegerField
      DisplayLabel = 'Banco cobros'
      FieldName = 'BANCO_PAGOS'
    end
    object QMClientesPEDIDO_VALORADO: TIntegerField
      DisplayLabel = 'Valorar Ped.'
      FieldName = 'PEDIDO_VALORADO'
    end
    object QMClientesPERIODO_FACTURACION: TFIBStringField
      DisplayLabel = 'Periodo Facturacion'
      FieldName = 'PERIODO_FACTURACION'
      Size = 2
    end
    object QMClientesCLIENTE_PADRE: TIntegerField
      DisplayLabel = 'Cliente Padre'
      FieldName = 'CLIENTE_PADRE'
    end
    object QMClientesGRUPO_CUENTAS: TIntegerField
      DisplayLabel = 'Grupo Cuentas'
      FieldName = 'GRUPO_CUENTAS'
    end
    object QMClientesCUENTA_IRPF: TFIBStringField
      DisplayLabel = 'Cuenta IRPF'
      FieldName = 'CUENTA_IRPF'
      Size = 15
    end
    object QMClientesNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object QMClientesDTO_CIAL_LINEA: TFloatField
      DisplayLabel = 'Dto. Cial./Linea'
      FieldName = 'DTO_CIAL_LINEA'
    end
    object QMClientesDTO_CIAL_LINEA_2: TFloatField
      DisplayLabel = 'Dto. Cial./Linea 2'
      FieldName = 'DTO_CIAL_LINEA_2'
    end
    object QMClientesDTO_CIAL_LINEA_3: TFloatField
      DisplayLabel = 'Dto. Cial./Linea 3'
      FieldName = 'DTO_CIAL_LINEA_3'
    end
    object QMClientesTELEFONO02: TFIBStringField
      DisplayLabel = 'Telefono 2'
      FieldName = 'TELEFONO02'
    end
    object QMClientesTELEFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'TELEFAX'
    end
    object QMClientesSEPARAR_DTO_CIAL: TIntegerField
      DisplayLabel = 'Separar Apu. Dto. Cial.'
      FieldName = 'SEPARAR_DTO_CIAL'
    end
    object QMClientesID_CLIENTE: TIntegerField
      DisplayLabel = 'Id Cliente'
      FieldName = 'ID_CLIENTE'
    end
    object QMClientesDIA_SEMANA_PAGO: TFIBStringField
      DisplayLabel = 'Dia Semana Pago'
      FieldName = 'DIA_SEMANA_PAGO'
      Size = 1
    end
    object QMClientesCATEGORIA: TFIBStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      Size = 3
    end
    object QMClientesCANAL_DST_PEC: TIntegerField
      DisplayLabel = 'Canal Dest. Pedido'
      FieldName = 'CANAL_DST_PEC'
    end
    object QMClientesSERIE_DST_PEC: TFIBStringField
      DisplayLabel = 'Serie Dest. Pedido'
      FieldName = 'SERIE_DST_PEC'
      Size = 10
    end
    object QMClientesTIPO_DST_PEC: TFIBStringField
      DisplayLabel = 'Tipo Dest. Pedido'
      FieldName = 'TIPO_DST_PEC'
      Size = 3
    end
    object QMClientesIMPORTE_MINIMO_PORTE: TFloatField
      DisplayLabel = 'Imp. Min. Porte'
      FieldName = 'IMPORTE_MINIMO_PORTE'
    end
    object QMClientesTIPO_DOC_IDENT: TFIBStringField
      DisplayLabel = 'Tipo Doc. Ident.'
      FieldName = 'TIPO_DOC_IDENT'
      Size = 3
    end
    object QMClientesALBARANAR_SERIE: TIntegerField
      DisplayLabel = 'Albaranar Serie'
      FieldName = 'ALBARANAR_SERIE'
    end
    object QMClientesSERIE_A_ALBARANAR: TFIBStringField
      DisplayLabel = 'Serie a Albaranar'
      FieldName = 'SERIE_A_ALBARANAR'
      Size = 10
    end
    object QMClientesRIESGO_EMP: TFloatField
      DisplayLabel = 'Riesgo Emp.'
      FieldName = 'RIESGO_EMP'
      OnChange = QMClientesRIESGO_AUTChange
    end
    object QMClientesRIESGO_CYC: TFloatField
      DisplayLabel = 'Riesgo Cred. y Caucion'
      FieldName = 'RIESGO_CYC'
      OnChange = QMClientesRIESGO_AUTChange
    end
    object QMClientesRIESGO_FACTOR: TFloatField
      DisplayLabel = 'Riesgo Factor'
      FieldName = 'RIESGO_FACTOR'
      OnChange = QMClientesRIESGO_AUTChange
    end
    object QMClientesDIA_PAGO_3: TIntegerField
      DisplayLabel = 'Dia Pago 3'
      FieldName = 'DIA_PAGO_3'
    end
    object QMClientesFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
    object QMClientesNO_AGRUPAR_ALBARANES: TIntegerField
      DisplayLabel = 'No Agrupar Albaranes'
      FieldName = 'NO_AGRUPAR_ALBARANES'
    end
    object QMClientesALFA_1: TStringField
      DisplayLabel = 'Alfa 1'
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMClientesALFA_2: TStringField
      DisplayLabel = 'Alfa 2'
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMClientesALFA_3: TStringField
      DisplayLabel = 'Alfa 3'
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMClientesALFA_4: TStringField
      DisplayLabel = 'Alfa 4'
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMClientesALFA_5: TStringField
      DisplayLabel = 'Alfa 5'
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMClientesALFA_6: TStringField
      DisplayLabel = 'Alfa 6'
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMClientesALFA_7: TStringField
      DisplayLabel = 'Alfa 7'
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMClientesALFA_8: TStringField
      DisplayLabel = 'Alfa 8'
      FieldName = 'ALFA_8'
      Size = 40
    end
    object QMClientesTITULO_ZONA: TFIBStringField
      DisplayLabel = 'Zona'
      FieldName = 'TITULO_ZONA'
      Size = 60
    end
    object QMClientesDIR_COMPLETA_N: TFIBStringField
      DisplayLabel = 'Dir. Completa'
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
    object QMClientesEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object QMClientesTITULO_REGION: TFIBStringField
      DisplayLabel = 'Titulo Region'
      FieldName = 'TITULO_REGION'
      Size = 40
    end
    object QMClientesTITULO_PROVINCIA: TFIBStringField
      DisplayLabel = 'Titulo Provincia'
      FieldName = 'TITULO_PROVINCIA'
      Size = 40
    end
    object QMClientesTITULO_POBLACION: TFIBStringField
      DisplayLabel = 'Titulo Poblacion'
      FieldName = 'TITULO_POBLACION'
      Size = 40
    end
    object QMClientesTITULO_CODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Titulo Codigo Postal'
      FieldName = 'TITULO_CODIGO_POSTAL'
      Size = 40
    end
    object QMClientesPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMClientesPAIS_TERCERO: TFIBStringField
      DisplayLabel = 'Pais Tercero'
      FieldName = 'PAIS_TERCERO'
      Size = 3
    end
    object QMClientesGIRO_CLIENTE: TFIBStringField
      DisplayLabel = 'Giro'
      FieldName = 'GIRO_CLIENTE'
      Size = 150
    end
    object QMClientesENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMClientesAGENTE2: TIntegerField
      DisplayLabel = 'Agente 2'
      FieldName = 'AGENTE2'
    end
    object QMClientesENVIAR_CONFIRMACION_PEDIDO: TIntegerField
      DisplayLabel = 'Enviar  Conf. Pedido'
      FieldName = 'ENVIAR_CONFIRMACION_PEDIDO'
    end
  end
  object DSQMClientes: TDataSource
    DataSet = QMClientes
    Left = 160
    Top = 8
  end
  object DSxIRPF: TDataSource
    DataSet = xIRPF
    Left = 376
    Top = 200
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 888
    Top = 8
  end
  object DSxAgrupDisp: TDataSource
    DataSet = xAgrupDisp
    Left = 160
    Top = 248
  end
  object DSxAgrupSon: TDataSource
    DataSet = xAgrupSon
    Left = 160
    Top = 200
  end
  object SPRellena: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure e_agrupaciones_rellena(?agrupacion,'
      '?empresa,?cliente)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 888
    Top = 152
  end
  object SPVacia: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'delete from emp_agrupaciones_cli where(agrupacion=?agrupacion)an' +
        'd'
      '(empresa=?empresa)and(cliente=?cliente); ')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 888
    Top = 200
  end
  object QMVacaciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CLIENTES_VACACIONES'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  CLIENTE=?old_CLIENTE AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CLIENTES_VACACIONES'
      
        '  (EMPRESA,CLIENTE,INICIO_VACACIONES,FIN_VACACIONES,FECHA_PAGO,L' +
        'INEA,MES_VENCIMIENTO)'
      'VALUES'
      
        '  (?EMPRESA,?CLIENTE,?INICIO_VACACIONES,?FIN_VACACIONES,?FECHA_P' +
        'AGO,?LINEA,?MES_VENCIMIENTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CLIENTES_VACACIONES'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  CLIENTE=?CLIENTE AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CLIENTES_VACACIONES'
      '  WHERE EMPRESA=?EMPRESA AND CLIENTE=?CLIENTE'
      '  ORDER BY LINEA, CLIENTE, EMPRESA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CLIENTES_VACACIONES'
      'SET'
      '  INICIO_VACACIONES=?INICIO_VACACIONES '
      '  ,FIN_VACACIONES=?FIN_VACACIONES '
      '  ,FECHA_PAGO=?FECHA_PAGO'
      '  ,MES_VENCIMIENTO=?MES_VENCIMIENTO '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  CLIENTE=?CLIENTE AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMClientes
    Plan.Strings = (
      ' ')
    OnNewRecord = QMVacacionesNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'CLIENTE '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CLIENTES_VACACIONES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 296
    object QMVacacionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMVacacionesCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMVacacionesINICIO_VACACIONES: TDateTimeField
      DisplayLabel = 'Inicio Vacaciones'
      FieldName = 'INICIO_VACACIONES'
    end
    object QMVacacionesFIN_VACACIONES: TDateTimeField
      DisplayLabel = 'Fin. Vacaciones'
      FieldName = 'FIN_VACACIONES'
    end
    object QMVacacionesFECHA_PAGO: TDateTimeField
      DisplayLabel = 'Fec. Pago'
      FieldName = 'FECHA_PAGO'
    end
    object QMVacacionesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMVacacionesMES_VENCIMIENTO: TIntegerField
      DisplayLabel = 'Mes Venc.'
      FieldName = 'MES_VENCIMIENTO'
    end
  end
  object DSQMVacaciones: TDataSource
    DataSet = QMVacaciones
    Left = 160
    Top = 296
  end
  object xAgrupDisp: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO,AGRUPACION FROM VER_AGRUPACIONES'
      'where tipo='#39'C'#39' and '
      
        'agrupacion not in (select agrupacion from emp_agrupaciones_cli w' +
        'here empresa=?empresa and cliente =?cliente)'
      'order by agrupacion')
    UniDirectional = False
    DataSource = DSQMClientes
    Plan.Strings = (
      
        'PLAN (VER_AGRUPACIONES SYS_AGRUPACIONES ORDER PK_SYS_AGRUPACIONE' +
        'S)')
    Left = 56
    Top = 248
  end
  object xAgrupSon: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT AGRUPACION,TITULO FROM VER_AGRUPACIONES_CLI'
      'where empresa=?empresa and cliente=?cliente'
      'order by agrupacion')
    UniDirectional = False
    DataSource = DSQMClientes
    Plan.Strings = (
      
        'PLAN JOIN (VER_AGRUPACIONES_CLI C ORDER PK_EMP_AGRUPACIONES_CLI,' +
        'VER_AGRUPACIONES_CLI A INDEX (PK_SYS_AGRUPACIONES))')
    Left = 56
    Top = 200
  end
  object xIRPF: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT P_IRPF,TITULO FROM SYS_TIPO_IRPF'
      'WHERE PAIS=?PAIS AND TIPO=?TIPO_IRPF')
    UniDirectional = False
    DataSource = DSQMClientes
    Left = 288
    Top = 200
    object xIRPFP_IRPF: TFloatField
      DisplayLabel = '% IRPF'
      FieldName = 'P_IRPF'
    end
    object xIRPFTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 15
    end
  end
  object xSeries: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select serie from emp_series'
      
        '  where((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?ca' +
        'nal)and(activo=1)) '
      '  order by serie')
    Transaction = TLocal
    Left = 888
    Top = 440
  end
  object DSxVentas: TDataSource
    DataSet = xVentas
    Left = 160
    Top = 392
  end
  object xVentas: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    RefreshSQL.Strings = (
      
        'SELECT C.*, N.NOMBRE, N.NIF, N.DIRECCION DIR_NOMBRE, N.C_POSTAL,' +
        ' N.LOCALIDAD, N.PROVINCIA, N.PAIS, N.TELEFONO01,'
      
        '       N.TELEFONO02, N.TELEFAX, N.EMAIL, N.NOMBRE_CONTACTO, CC.T' +
        'ITULO COMO_NOS_CONOCIERON'
      'FROM GES_CABECERAS_S C'
      
        'LEFT JOIN GES_CABECERAS_S_FAC_NIF N ON C.ID_S = N.ID_S AND C.TIP' +
        'O = N.TIPO'
      
        'LEFT JOIN SYS_COMO_NOS_CONOCIERON CC ON N.COMO_NOS_CONOCIERON = ' +
        'CC.MODO'
      'WHERE'
      'C.ID_S = :ID_S')
    SelectSQL.Strings = (
      
        'SELECT C.*, N.NOMBRE, N.NIF, N.DIRECCION DIR_NOMBRE, N.C_POSTAL,' +
        ' N.LOCALIDAD, N.PROVINCIA, N.PAIS, N.TELEFONO01,'
      
        '       N.TELEFONO02, N.TELEFAX, N.EMAIL, N.NOMBRE_CONTACTO, CC.T' +
        'ITULO COMO_NOS_CONOCIERON'
      'FROM GES_CABECERAS_S C'
      
        'LEFT JOIN GES_CABECERAS_S_FAC_NIF N ON C.ID_S = N.ID_S AND C.TIP' +
        'O = N.TIPO'
      
        'LEFT JOIN SYS_COMO_NOS_CONOCIERON CC ON N.COMO_NOS_CONOCIERON = ' +
        'CC.MODO'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.CLIENTE = :CLIENTE AND'
      'C.TERCERO = :TERCERO /* PARA UTILIZAR INDICES */'
      'ORDER BY C.FECHA DESC')
    UniDirectional = False
    DataSource = DSQMClientes
    Opciones = []
    AutoSQLdeVistas = False
    Left = 56
    Top = 392
    object xVentasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVentasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVentasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVentasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xVentasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xVentasRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xVentasALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xVentasMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xVentasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xVentasCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xVentasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xVentasDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object xVentasSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xVentasFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xVentasCAMPANYA: TIntegerField
      DisplayLabel = 'Campa'#241'a'
      FieldName = 'CAMPANYA'
    end
    object xVentasNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xVentasESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xVentasBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object xVentasLINEAS: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINEAS'
    end
    object xVentasBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object xVentasI_DTO_LINEAS: TFloatField
      DisplayLabel = 'Imp. Dto. Lineas'
      FieldName = 'I_DTO_LINEAS'
    end
    object xVentasS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object xVentasM_BRUTO: TFloatField
      DisplayLabel = 'M. Bruto'
      FieldName = 'M_BRUTO'
    end
    object xVentasC_TOTAL: TFloatField
      DisplayLabel = 'C. Total'
      FieldName = 'C_TOTAL'
    end
    object xVentasAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xVentasS_CUOTA_IVA: TFloatField
      DisplayLabel = 'S. Cuota IVA'
      FieldName = 'S_CUOTA_IVA'
    end
    object xVentasS_CUOTA_RE: TFloatField
      DisplayLabel = 'S. Couta Ret.'
      FieldName = 'S_CUOTA_RE'
    end
    object xVentasB_DTO_LINEAS: TFloatField
      DisplayLabel = 'B. Dto. Lineas'
      FieldName = 'B_DTO_LINEAS'
    end
    object xVentasDTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DTO_PP'
    end
    object xVentasDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial'
      FieldName = 'DTO_CIAL'
    end
    object xVentasB_COMISION: TFloatField
      DisplayLabel = 'B. Comision'
      FieldName = 'B_COMISION'
    end
    object xVentasI_COMISION: TFloatField
      DisplayLabel = 'Imp. Comision'
      FieldName = 'I_COMISION'
    end
    object xVentasPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object xVentasI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Financ.'
      FieldName = 'I_FINANCIACION'
    end
    object xVentasLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xVentasENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xVentasPROCESO_AUTO: TIntegerField
      DisplayLabel = 'Proc. Autom.'
      FieldName = 'PROCESO_AUTO'
    end
    object xVentasI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. PP'
      FieldName = 'I_DTO_PP'
    end
    object xVentasI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial.'
      FieldName = 'I_DTO_CIAL'
    end
    object xVentasPORTES: TIntegerField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
    end
    object xVentasI_FINANCIACION_CANAL: TFloatField
      DisplayLabel = 'Imp. Financ. Can.'
      FieldName = 'I_FINANCIACION_CANAL'
    end
    object xVentasS_BASES_CANAL: TFloatField
      DisplayLabel = 'S. Bases Can.'
      FieldName = 'S_BASES_CANAL'
    end
    object xVentasS_CUOTA_IVA_CANAL: TFloatField
      DisplayLabel = 'S. Cuota IVA Can.'
      FieldName = 'S_CUOTA_IVA_CANAL'
    end
    object xVentasS_CUOTA_RE_CANAL: TFloatField
      DisplayLabel = 'S. Cuota Ret. Can.'
      FieldName = 'S_CUOTA_RE_CANAL'
    end
    object xVentasLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object xVentasCHG_MONEDA: TIntegerField
      DisplayLabel = 'Chg. Mon.'
      FieldName = 'CHG_MONEDA'
    end
    object xVentasTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object xVentasID_S: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_S'
    end
    object xVentasPEDIDO_CLIENTE: TFIBStringField
      DisplayLabel = 'Ref. Cliente'
      FieldName = 'PEDIDO_CLIENTE'
      Size = 60
    end
    object xVentasZ_OBSERVACION: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'Z_OBSERVACION'
      Size = 256
    end
    object xVentasCONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
    end
    object xVentasI_PORTES: TFloatField
      DisplayLabel = 'Imp. Portes'
      FieldName = 'I_PORTES'
    end
    object xVentasPOR_PORTES: TFloatField
      DisplayLabel = 'Porc. Portes'
      FieldName = 'POR_PORTES'
    end
    object xVentasTIPO_PORTES: TIntegerField
      DisplayLabel = 'Tipo Porte'
      FieldName = 'TIPO_PORTES'
    end
    object xVentasRANGO: TIntegerField
      DisplayLabel = 'Rango Porte'
      FieldName = 'RANGO'
    end
    object xVentasINDICE: TIntegerField
      DisplayLabel = 'Indice Porte'
      FieldName = 'INDICE'
    end
    object xVentasPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object xVentasTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
    end
    object xVentasNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object xVentasNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object xVentasDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Dir. Nombre'
      FieldName = 'DIR_NOMBRE'
      Size = 100
    end
    object xVentasC_POSTAL: TFIBStringField
      DisplayLabel = 'C. Postal'
      FieldName = 'C_POSTAL'
      Size = 10
    end
    object xVentasLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 40
    end
    object xVentasPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object xVentasPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xVentasTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel. 1'
      FieldName = 'TELEFONO01'
    end
    object xVentasTELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      FieldName = 'TELEFONO02'
    end
    object xVentasTELEFAX: TFIBStringField
      DisplayLabel = 'Telefax'
      FieldName = 'TELEFAX'
    end
    object xVentasEMAIL: TFIBStringField
      DisplayLabel = 'email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object xVentasNOMBRE_CONTACTO: TFIBStringField
      DisplayLabel = 'Nom. Contacto'
      FieldName = 'NOMBRE_CONTACTO'
      Size = 60
    end
    object xVentasCOMO_NOS_CONOCIERON: TFIBStringField
      DisplayLabel = 'Como nos Conoc.'
      FieldName = 'COMO_NOS_CONOCIERON'
      Size = 60
    end
  end
  object QMPrecios: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT C.*, D.LINEA, D.UNID_MINIMAS, D.UNID_MAXIMAS, D.PRECIO, D' +
        '.DESCUENTO, D.DESCUENTO_2, D.DESCUENTO_3,'
      
        '       A.TITULO_LARGO TITULO_ARTICULO, F.TITULO TITULO_FAMILIA, ' +
        'A.P_COSTE, A.ALFA_1, A.ALFA_2, A.ALFA_3, A.ALFA_4, A.ALFA_5,'
      '       A.ALFA_6, A.ALFA_7, A.ALFA_8,'
      '       CASE /* 100 * (P_VENTA - P_COSTE) / P_COSTE */'
      '         WHEN (A.P_COSTE <> 0) THEN'
      
        '             100 * ((D.PRECIO - (D.PRECIO * D.DESCUENTO / 100) -' +
        ' ((D.PRECIO - (D.PRECIO * D.DESCUENTO / 100)) * D.DESCUENTO_2 / ' +
        '100) - (((D.PRECIO - (D.PRECIO - (D.PRECIO * D.DESCUENTO / 100))' +
        ' * D.DESCUENTO_2 / 100)) * D.DESCUENTO_3 / 100)) - A.P_COSTE) / ' +
        'A.P_COSTE'
      '         ELSE 0'
      '       END AS MARGEN_PC,'
      '       CASE /* 100 * (P_VENTA - P_COSTE) / P_VENTA */'
      
        '         WHEN ((D.PRECIO - (D.PRECIO * D.DESCUENTO / 100) - ((D.' +
        'PRECIO - (D.PRECIO * D.DESCUENTO / 100)) * D.DESCUENTO_2 / 100) ' +
        '- (((D.PRECIO - (D.PRECIO - (D.PRECIO * D.DESCUENTO / 100)) * D.' +
        'DESCUENTO_2 / 100)) * D.DESCUENTO_3 / 100)) <> 0) THEN'
      
        '             100 * ((D.PRECIO - (D.PRECIO * D.DESCUENTO / 100) -' +
        ' ((D.PRECIO - (D.PRECIO * D.DESCUENTO / 100)) * D.DESCUENTO_2 / ' +
        '100) - (((D.PRECIO - (D.PRECIO - (D.PRECIO * D.DESCUENTO / 100))' +
        ' * D.DESCUENTO_2 / 100)) * D.DESCUENTO_3 / 100)) - A.P_COSTE) / ' +
        '(D.PRECIO - (D.PRECIO * D.DESCUENTO / 100) - ((D.PRECIO - (D.PRE' +
        'CIO * D.DESCUENTO / 100)) * D.DESCUENTO_2 / 100) - (((D.PRECIO -' +
        ' (D.PRECIO - (D.PRECIO * D.DESCUENTO / 100)) * D.DESCUENTO_2 / 1' +
        '00)) * D.DESCUENTO_3 / 100))'
      '         ELSE 0'
      '       END AS MARGEN_PV'
      'FROM ART_CONDICIONES_C C'
      
        'JOIN ART_CONDICIONES_D D ON (C.EMPRESA = D.EMPRESA AND C.EJERCIC' +
        'IO = D.EJERCICIO AND C.CANAL = D.CANAL AND C.TIPO = D.TIPO AND C' +
        '.RIG = D.RIG)'
      
        'LEFT JOIN ART_ARTICULOS A ON (C.EMPRESA = A.EMPRESA AND C.ARTICU' +
        'LO = A.ARTICULO)'
      
        'LEFT JOIN ART_FAMILIAS F ON (C.EMPRESA = A.EMPRESA AND C.FAMILIA' +
        ' = A.FAMILIA)'
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
      
        '       A.TITULO_LARGO TITULO_ARTICULO, F.TITULO TITULO_FAMILIA, ' +
        'A.P_COSTE, A.ALFA_1, A.ALFA_2, A.ALFA_3, A.ALFA_4, A.ALFA_5,'
      '       A.ALFA_6, A.ALFA_7, A.ALFA_8,'
      '       CASE /* 100 * (P_VENTA - P_COSTE) / P_COSTE */'
      '         WHEN (A.P_COSTE <> 0) THEN'
      
        '             100 * ((D.PRECIO - (D.PRECIO * D.DESCUENTO / 100) -' +
        ' ((D.PRECIO - (D.PRECIO * D.DESCUENTO / 100)) * D.DESCUENTO_2 / ' +
        '100) - (((D.PRECIO - (D.PRECIO - (D.PRECIO * D.DESCUENTO / 100))' +
        ' * D.DESCUENTO_2 / 100)) * D.DESCUENTO_3 / 100)) - A.P_COSTE) / ' +
        'A.P_COSTE'
      '         ELSE 0'
      '       END AS MARGEN_PC,'
      '       CASE /* 100 * (P_VENTA - P_COSTE) / P_VENTA */'
      
        '         WHEN ((D.PRECIO - (D.PRECIO * D.DESCUENTO / 100) - ((D.' +
        'PRECIO - (D.PRECIO * D.DESCUENTO / 100)) * D.DESCUENTO_2 / 100) ' +
        '- (((D.PRECIO - (D.PRECIO - (D.PRECIO * D.DESCUENTO / 100)) * D.' +
        'DESCUENTO_2 / 100)) * D.DESCUENTO_3 / 100)) <> 0) THEN'
      
        '             100 * ((D.PRECIO - (D.PRECIO * D.DESCUENTO / 100) -' +
        ' ((D.PRECIO - (D.PRECIO * D.DESCUENTO / 100)) * D.DESCUENTO_2 / ' +
        '100) - (((D.PRECIO - (D.PRECIO - (D.PRECIO * D.DESCUENTO / 100))' +
        ' * D.DESCUENTO_2 / 100)) * D.DESCUENTO_3 / 100)) - A.P_COSTE) / ' +
        '(D.PRECIO - (D.PRECIO * D.DESCUENTO / 100) - ((D.PRECIO - (D.PRE' +
        'CIO * D.DESCUENTO / 100)) * D.DESCUENTO_2 / 100) - (((D.PRECIO -' +
        ' (D.PRECIO - (D.PRECIO * D.DESCUENTO / 100)) * D.DESCUENTO_2 / 1' +
        '00)) * D.DESCUENTO_3 / 100))'
      '         ELSE 0'
      '       END AS MARGEN_PV'
      'FROM ART_CONDICIONES_C C'
      
        'JOIN ART_CONDICIONES_D D ON (C.EMPRESA = D.EMPRESA AND C.EJERCIC' +
        'IO = D.EJERCICIO AND C.CANAL = D.CANAL AND C.TIPO = D.TIPO AND C' +
        '.RIG = D.RIG)'
      
        'LEFT JOIN ART_ARTICULOS A ON (C.EMPRESA = A.EMPRESA AND C.ARTICU' +
        'LO = A.ARTICULO)'
      
        'LEFT JOIN ART_FAMILIAS F ON (C.EMPRESA = A.EMPRESA AND C.FAMILIA' +
        ' = A.FAMILIA)'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL AND'
      '((C.CLIENTE = :CLIENTE AND'
      'C.TIPO IN ('#39'CCA'#39', '#39'CCF'#39')) OR'
      '--'
      '(C.AGRUPACION IN (SELECT AGRUPACION'
      '                  FROM EMP_AGRUPACIONES_CLI'
      '                  WHERE'
      '                  EMPRESA = C.EMPRESA AND'
      '                  CLIENTE = :CLIENTE) AND'
      'C.TIPO IN ('#39'CAA'#39', '#39'CAF'#39', '#39'CAG'#39')) OR'
      '--'
      '(C.PERFIL IN (SELECT PERFIL'
      '              FROM CON_CUENTAS_GES_CLI'
      '              WHERE'
      '              EMPRESA = C.EMPRESA AND'
      '              EJERCICIO = C.EJERCICIO AND'
      '              CANAL = C.CANAL AND'
      '              CLIENTE = :CLIENTE) AND'
      'C.TIPO IN ('#39'CPA'#39', '#39'CPF'#39', '#39'CPE'#39')))'
      'ORDER BY C.TIPO, C.ARTICULO, C.FAMILIA, D.UNID_MINIMAS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMClientes
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    Left = 56
    Top = 440
    object QMPreciosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPreciosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPreciosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPreciosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMPreciosRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMPreciosCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMPreciosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMPreciosFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMPreciosPERFIL: TFIBStringField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
      Size = 4
    end
    object QMPreciosAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrup.'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QMPreciosALTA: TDateTimeField
      DisplayLabel = 'Alta'
      FieldName = 'ALTA'
    end
    object QMPreciosBAJA: TDateTimeField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMPreciosACTIVO: TIntegerField
      DisplayLabel = 'Act.'
      FieldName = 'ACTIVO'
    end
    object QMPreciosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMPreciosUNID_MINIMAS: TFloatField
      DisplayLabel = 'Uds. Min.'
      FieldName = 'UNID_MINIMAS'
    end
    object QMPreciosUNID_MAXIMAS: TFloatField
      DisplayLabel = 'Uds. Max.'
      FieldName = 'UNID_MAXIMAS'
    end
    object QMPreciosPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMPreciosDESCUENTO: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO'
    end
    object QMPreciosDESCUENTO_2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO_2'
    end
    object QMPreciosDESCUENTO_3: TFloatField
      DisplayLabel = 'Desc. 3'
      FieldName = 'DESCUENTO_3'
    end
    object QMPreciosTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Desc. Articulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 60
    end
    object QMPreciosTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Desc. Familia'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMPreciosP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMPreciosMARGEN_PC: TFloatField
      DisplayLabel = 'Margen P.C.'
      FieldName = 'MARGEN_PC'
    end
    object QMPreciosMARGEN_PV: TFloatField
      DisplayLabel = 'Margen P.V.'
      FieldName = 'MARGEN_PV'
    end
    object QMPreciosALFA_1: TFIBStringField
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMPreciosALFA_2: TFIBStringField
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMPreciosALFA_3: TFIBStringField
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMPreciosALFA_4: TFIBStringField
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMPreciosALFA_5: TFIBStringField
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMPreciosALFA_6: TFIBStringField
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMPreciosALFA_7: TFIBStringField
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMPreciosALFA_8: TFIBStringField
      FieldName = 'ALFA_8'
      Size = 40
    end
  end
  object DSQMPrecios: TDataSource
    DataSet = QMPrecios
    Left = 160
    Top = 440
  end
  object xBuscoMaxCte: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(cliente) from emp_clientes'
      'where empresa=?empresa and'
      'cliente < ?cliente ')
    Transaction = TLocal
    Left = 888
    Top = 488
  end
  object DSQMClientes2: TDataSource
    DataSet = QMClientes
    Left = 240
    Top = 8
  end
  object xIncidencias: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_INCIDENCIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  TIPO_TERCERO=?TIPO_TERCERO AND '
      '  COD_CLI_PRO=?COD_CLI_PRO AND '
      '  INCIDENCIA=?INCIDENCIA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_INCIDENCIAS'
      'WHERE '
      'EMPRESA = ?EMPRESA AND'
      'COD_CLI_PRO =  ?CLIENTE AND'
      'TIPO_TERCERO = '#39'CLI'#39
      'ORDER BY INCIDENCIA DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMClientes
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'TIPO_TERCERO '
      'COD_CLI_PRO '
      'INCIDENCIA ')
    AccionesInhibidas = [Borrar, Insertar, Modificar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_INCIDENCIAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 288
    Top = 440
    object xIncidenciasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xIncidenciasINCIDENCIA: TIntegerField
      DisplayLabel = 'Incidencia'
      FieldName = 'INCIDENCIA'
    end
    object xIncidenciasTITULO_INCIDENCIA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_INCIDENCIA'
      Size = 60
    end
    object xIncidenciasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xIncidenciasFECHA_RECEPCION: TDateTimeField
      DisplayLabel = 'Fecha Recep.'
      FieldName = 'FECHA_RECEPCION'
    end
    object xIncidenciasTIPO_TERCERO: TFIBStringField
      DisplayLabel = 'Tipo Tercero'
      FieldName = 'TIPO_TERCERO'
      Size = 3
    end
    object xIncidenciasCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cli./Prov./Acr.'
      FieldName = 'COD_CLI_PRO'
    end
    object xIncidenciasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xIncidenciasTITULO_TERCERO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_TERCERO'
      Size = 60
    end
    object xIncidenciasDATOS_INCIDENCIA: TBlobField
      DisplayLabel = 'Datos Incidencia'
      FieldName = 'DATOS_INCIDENCIA'
      Size = 8
    end
    object xIncidenciasFECHA_RESPUESTA: TDateTimeField
      DisplayLabel = 'Fec. Respuesta'
      FieldName = 'FECHA_RESPUESTA'
    end
    object xIncidenciasRESPUESTA_INCIDENCIA: TBlobField
      DisplayLabel = 'Respuesta'
      FieldName = 'RESPUESTA_INCIDENCIA'
      Size = 8
    end
    object xIncidenciasID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object xIncidenciasID_E: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_E'
    end
    object xIncidenciasDOC_EJERCICIO: TIntegerField
      DisplayLabel = 'Ejer. Doc.'
      FieldName = 'DOC_EJERCICIO'
    end
    object xIncidenciasDOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xIncidenciasDOC_CANAL: TIntegerField
      DisplayLabel = 'Canal Doc.'
      FieldName = 'DOC_CANAL'
    end
    object xIncidenciasDOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xIncidenciasDOC_RIG: TIntegerField
      DisplayLabel = 'Doc. Nro.'
      FieldName = 'DOC_RIG'
    end
    object xIncidenciasDIRECCION: TIntegerField
      DisplayLabel = 'Dir.'
      FieldName = 'DIRECCION'
    end
    object xIncidenciasDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_NOMBRE'
      Size = 76
    end
    object xIncidenciasAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xIncidenciasCONTACTO: TIntegerField
      DisplayLabel = 'Cont. 1'
      FieldName = 'CONTACTO'
    end
    object xIncidenciasTIT_CONTACTO: TFIBStringField
      DisplayLabel = 'Contacto 1'
      FieldName = 'TIT_CONTACTO'
      Size = 81
    end
    object xIncidenciasCONTACTO2: TIntegerField
      DisplayLabel = 'Cont. 2'
      FieldName = 'CONTACTO2'
    end
    object xIncidenciasTIT_CONTACTO2: TFIBStringField
      DisplayLabel = 'Contacto 2'
      FieldName = 'TIT_CONTACTO2'
      Size = 81
    end
    object xIncidenciasCONTACTO3: TIntegerField
      DisplayLabel = 'Cont. 3'
      FieldName = 'CONTACTO3'
    end
    object xIncidenciasTIT_CONTACTO3: TFIBStringField
      DisplayLabel = 'Contacto 3'
      FieldName = 'TIT_CONTACTO3'
      Size = 81
    end
    object xIncidenciasTIT_AGENTE: TFIBStringField
      DisplayLabel = 'Agente'
      FieldName = 'TIT_AGENTE'
      Size = 60
    end
    object xIncidenciasTIPO_INCIDENCIA_KRI: TFIBStringField
      DisplayLabel = 'Tipo Inc.'
      FieldName = 'TIPO_INCIDENCIA_KRI'
      Size = 3
    end
    object xIncidenciasTIT_TIPO_INCIDENCIA_KRI: TFIBStringField
      DisplayLabel = 'Desc. Tipo Inc.'
      FieldName = 'TIT_TIPO_INCIDENCIA_KRI'
      Size = 40
    end
    object xIncidenciasUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object xIncidenciasNOMBRE_USUARIO: TFIBStringField
      DisplayLabel = 'Usuario'
      FieldName = 'NOMBRE_USUARIO'
      Size = 31
    end
    object xIncidenciasHORAS: TFloatField
      DisplayLabel = 'Horas'
      FieldName = 'HORAS'
    end
    object xIncidenciasFINALIZADO: TIntegerField
      DisplayLabel = 'Finalizado'
      FieldName = 'FINALIZADO'
    end
  end
  object DSxIncidencias: TDataSource
    DataSet = xIncidencias
    Left = 376
    Top = 440
  end
  object xRangos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from emp_rangos'
      'where empresa=?empresa and rango=?rango')
    UniDirectional = False
    DataSource = DSQMClientes
    Left = 288
    Top = 536
    object xRangosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxRangos: TDataSource
    DataSet = xRangos
    Left = 376
    Top = 536
  end
  object xIndices: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from emp_rangos_indices'
      'where empresa=?empresa and rango=?rango and indice=?indice')
    UniDirectional = False
    DataSource = DSQMClientes
    Left = 56
    Top = 536
    object xIndicesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxIndices: TDataSource
    DataSet = xIndices
    Left = 160
    Top = 536
  end
  object xFacturasAnualC_1: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mensuales_anuales'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?CLIENTE,  ?MODO, ?MONEDA, ?TIPO' +
        ', ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TEstadistica
    Left = 480
    Top = 296
    object xFacturasAnualC_1TOTAL_BASE: TFloatField
      DisplayLabel = 'Total Base'
      FieldName = 'TOTAL_BASE'
    end
    object xFacturasAnualC_1TOTAL_LIQUIDO: TFloatField
      DisplayLabel = 'Total Liquido'
      FieldName = 'TOTAL_LIQUIDO'
    end
  end
  object DSxFacturasAnualC_1: TDataSource
    DataSet = xFacturasAnualC_1
    Left = 584
    Top = 296
  end
  object xFacturasAnualC_2: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mensuales_anuales'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?CLIENTE,  ?MODO, ?MONEDA, ?TIPO' +
        ', ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TEstadistica
    Left = 480
    Top = 344
    object xFacturasAnualC_2TOTAL_BASE: TFloatField
      DisplayLabel = 'Total Base'
      FieldName = 'TOTAL_BASE'
    end
    object xFacturasAnualC_2TOTAL_LIQUIDO: TFloatField
      DisplayLabel = 'Total Liquido'
      FieldName = 'TOTAL_LIQUIDO'
    end
  end
  object DSxFacturasAnualC_2: TDataSource
    DataSet = xFacturasAnualC_2
    Left = 584
    Top = 344
  end
  object xFacturasAnualC_3: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mensuales_anuales'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?CLIENTE,  ?MODO, ?MONEDA, ?TIPO' +
        ', ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TEstadistica
    Left = 480
    Top = 392
    object xFacturasAnualC_3TOTAL_BASE: TFloatField
      DisplayLabel = 'Total Base'
      FieldName = 'TOTAL_BASE'
    end
    object xFacturasAnualC_3TOTAL_LIQUIDO: TFloatField
      DisplayLabel = 'Total Liquido'
      FieldName = 'TOTAL_LIQUIDO'
    end
  end
  object DSxFacturasAnualC_3: TDataSource
    DataSet = xFacturasAnualC_3
    Left = 584
    Top = 392
  end
  object xFacturasMensual: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mensuales_anuales '
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?CLIENTE,  ?MODO, ?MONEDA, ?TIPO' +
        ', ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TEstadistica
    AutoCommit = True
    Left = 480
    Top = 8
    object xFacturasMensualB_ENERO: TFloatField
      DisplayLabel = 'B. Enero'
      FieldName = 'B_ENERO'
    end
    object xFacturasMensualL_ENERO: TFloatField
      DisplayLabel = 'Enero'
      FieldName = 'L_ENERO'
    end
    object xFacturasMensualB_FEBRERO: TFloatField
      DisplayLabel = 'B. Febrero'
      FieldName = 'B_FEBRERO'
    end
    object xFacturasMensualL_FEBRERO: TFloatField
      DisplayLabel = 'Febrero'
      FieldName = 'L_FEBRERO'
    end
    object xFacturasMensualB_MARZO: TFloatField
      DisplayLabel = 'B. Marzo'
      FieldName = 'B_MARZO'
    end
    object xFacturasMensualL_MARZO: TFloatField
      DisplayLabel = 'Marzo'
      FieldName = 'L_MARZO'
    end
    object xFacturasMensualB_ABRIL: TFloatField
      DisplayLabel = 'B. Abril'
      FieldName = 'B_ABRIL'
    end
    object xFacturasMensualL_ABRIL: TFloatField
      DisplayLabel = 'Abril'
      FieldName = 'L_ABRIL'
    end
    object xFacturasMensualB_MAYO: TFloatField
      DisplayLabel = 'B. Mayo'
      FieldName = 'B_MAYO'
    end
    object xFacturasMensualL_MAYO: TFloatField
      DisplayLabel = 'Mayo'
      FieldName = 'L_MAYO'
    end
    object xFacturasMensualB_JUNIO: TFloatField
      DisplayLabel = 'B. Junio'
      FieldName = 'B_JUNIO'
    end
    object xFacturasMensualL_JUNIO: TFloatField
      DisplayLabel = 'Junio'
      FieldName = 'L_JUNIO'
    end
    object xFacturasMensualL_JULIO: TFloatField
      DisplayLabel = 'Julio'
      FieldName = 'L_JULIO'
    end
    object xFacturasMensualL_AGOSTO: TFloatField
      DisplayLabel = 'Agosto'
      FieldName = 'L_AGOSTO'
    end
    object xFacturasMensualB_SEPTIEMBRE: TFloatField
      DisplayLabel = 'B. Septiembre'
      FieldName = 'B_SEPTIEMBRE'
    end
    object xFacturasMensualL_SEPTIEMBRE: TFloatField
      DisplayLabel = 'Septiembre'
      FieldName = 'L_SEPTIEMBRE'
    end
    object xFacturasMensualB_OCTUBRE: TFloatField
      DisplayLabel = 'B. Octubre'
      FieldName = 'B_OCTUBRE'
    end
    object xFacturasMensualL_OCTUBRE: TFloatField
      DisplayLabel = 'Octubre'
      FieldName = 'L_OCTUBRE'
    end
    object xFacturasMensualL_NOVIEMBRE: TFloatField
      DisplayLabel = 'Noviembre'
      FieldName = 'L_NOVIEMBRE'
    end
    object xFacturasMensualB_DICIEMBRE: TFloatField
      DisplayLabel = 'B. Diciembre'
      FieldName = 'B_DICIEMBRE'
    end
    object xFacturasMensualL_DICIEMBRE: TFloatField
      DisplayLabel = 'Diciembre'
      FieldName = 'L_DICIEMBRE'
    end
    object xFacturasMensualB_JULIO: TFloatField
      DisplayLabel = 'B. Julio'
      FieldName = 'B_JULIO'
    end
    object xFacturasMensualB_AGOSTO: TFloatField
      DisplayLabel = 'B. Agostro'
      FieldName = 'B_AGOSTO'
    end
    object xFacturasMensualB_NOVIEMBRE: TFloatField
      DisplayLabel = 'B. Noviembre'
      FieldName = 'B_NOVIEMBRE'
    end
  end
  object DSxFacturasMensual: TDataSource
    DataSet = xFacturasMensual
    Left = 584
    Top = 8
  end
  object xFacturasMensualCompara: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mensuales_anuales '
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?CLIENTE,  ?MODO, ?MONEDA, ?TIPO' +
        ', ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TEstadistica
    Left = 480
    Top = 56
    object xFacturasMensualComparaB_ENERO: TFloatField
      DisplayLabel = 'B. Enero'
      FieldName = 'B_ENERO'
    end
    object xFacturasMensualComparaL_ENERO: TFloatField
      DisplayLabel = 'Enero'
      FieldName = 'L_ENERO'
    end
    object xFacturasMensualComparaB_FEBRERO: TFloatField
      DisplayLabel = 'B. Febrero'
      FieldName = 'B_FEBRERO'
    end
    object xFacturasMensualComparaL_FEBRERO: TFloatField
      DisplayLabel = 'Febrero'
      FieldName = 'L_FEBRERO'
    end
    object xFacturasMensualComparaB_MARZO: TFloatField
      DisplayLabel = 'B. Marzo'
      FieldName = 'B_MARZO'
    end
    object xFacturasMensualComparaL_MARZO: TFloatField
      DisplayLabel = 'Marzo'
      FieldName = 'L_MARZO'
    end
    object xFacturasMensualComparaB_ABRIL: TFloatField
      DisplayLabel = 'B. Abril'
      FieldName = 'B_ABRIL'
    end
    object xFacturasMensualComparaL_ABRIL: TFloatField
      DisplayLabel = 'Abril'
      FieldName = 'L_ABRIL'
    end
    object xFacturasMensualComparaB_MAYO: TFloatField
      DisplayLabel = 'B. Mayo'
      FieldName = 'B_MAYO'
    end
    object xFacturasMensualComparaL_MAYO: TFloatField
      DisplayLabel = 'Mayo'
      FieldName = 'L_MAYO'
    end
    object xFacturasMensualComparaB_JUNIO: TFloatField
      DisplayLabel = 'B. Junio'
      FieldName = 'B_JUNIO'
    end
    object xFacturasMensualComparaL_JUNIO: TFloatField
      DisplayLabel = 'Junio'
      FieldName = 'L_JUNIO'
    end
    object xFacturasMensualComparaL_JULIO: TFloatField
      DisplayLabel = 'Julio'
      FieldName = 'L_JULIO'
    end
    object xFacturasMensualComparaL_AGOSTO: TFloatField
      DisplayLabel = 'Agosto'
      FieldName = 'L_AGOSTO'
    end
    object xFacturasMensualComparaB_SEPTIEMBRE: TFloatField
      DisplayLabel = 'B. Septiembre'
      FieldName = 'B_SEPTIEMBRE'
    end
    object xFacturasMensualComparaL_SEPTIEMBRE: TFloatField
      DisplayLabel = 'Septiembre'
      FieldName = 'L_SEPTIEMBRE'
    end
    object xFacturasMensualComparaB_OCTUBRE: TFloatField
      DisplayLabel = 'B. Octubre'
      FieldName = 'B_OCTUBRE'
    end
    object xFacturasMensualComparaL_OCTUBRE: TFloatField
      DisplayLabel = 'Octubre'
      FieldName = 'L_OCTUBRE'
    end
    object xFacturasMensualComparaL_NOVIEMBRE: TFloatField
      DisplayLabel = 'Noviembre'
      FieldName = 'L_NOVIEMBRE'
    end
    object xFacturasMensualComparaB_DICIEMBRE: TFloatField
      DisplayLabel = 'B. Diciembre'
      FieldName = 'B_DICIEMBRE'
    end
    object xFacturasMensualComparaL_DICIEMBRE: TFloatField
      DisplayLabel = 'Diciembre'
      FieldName = 'L_DICIEMBRE'
    end
    object xFacturasMensualComparaB_JULIO: TFloatField
      DisplayLabel = 'B. Julio'
      FieldName = 'B_JULIO'
    end
    object xFacturasMensualComparaB_AGOSTO: TFloatField
      DisplayLabel = 'B. Agostro'
      FieldName = 'B_AGOSTO'
    end
    object xFacturasMensualComparaB_NOVIEMBRE: TFloatField
      DisplayLabel = 'B. Noviembre'
      FieldName = 'B_NOVIEMBRE'
    end
  end
  object DSxFacturasMensualCompara: TDataSource
    DataSet = xFacturasMensualCompara
    Left = 584
    Top = 56
  end
  object xFacturasAnual: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mensuales_anuales '
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?CLIENTE,  ?MODO, ?MONEDA, ?TIPO' +
        ', ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TEstadistica
    Left = 480
    Top = 104
    object xFacturasAnualTOTAL_BASE: TFloatField
      DisplayLabel = 'Total Base'
      FieldName = 'TOTAL_BASE'
    end
    object xFacturasAnualTOTAL_LIQUIDO: TFloatField
      DisplayLabel = 'Total Liquido'
      FieldName = 'TOTAL_LIQUIDO'
    end
  end
  object DSxFacturasAnual: TDataSource
    DataSet = xFacturasAnual
    Left = 584
    Top = 104
  end
  object xFacturasAnualCompara: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_ventas_mensuales_anuales'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?CLIENTE,  ?MODO, ?MONEDA, ?TIPO' +
        ', ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TEstadistica
    Left = 480
    Top = 152
    object xFacturasAnualComparaTOTAL_BASE: TFloatField
      DisplayLabel = 'Total Base'
      FieldName = 'TOTAL_BASE'
    end
    object xFacturasAnualComparaTOTAL_LIQUIDO: TFloatField
      DisplayLabel = 'Total Liquido'
      FieldName = 'TOTAL_LIQUIDO'
    end
  end
  object DSxFacturasAnualCompara: TDataSource
    DataSet = xFacturasAnualCompara
    Left = 584
    Top = 152
  end
  object xPrevisionMensual: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_vent_prev_mensuales_anuales'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?CLIENTE,  ?MODO, ?MONEDA,  ?POR' +
        'CENTAJE_VENTAS, ?TIPO, ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TEstadistica
    Left = 480
    Top = 200
    object xPrevisionMensualCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xPrevisionMensualEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xPrevisionMensualB_ENERO: TFloatField
      DisplayLabel = 'B. Enero'
      FieldName = 'B_ENERO'
    end
    object xPrevisionMensualL_ENERO: TFloatField
      DisplayLabel = 'Enero'
      FieldName = 'L_ENERO'
    end
    object xPrevisionMensualB_FEBRERO: TFloatField
      DisplayLabel = 'B. Febrero'
      FieldName = 'B_FEBRERO'
    end
    object xPrevisionMensualL_FEBRERO: TFloatField
      DisplayLabel = 'Febrero'
      FieldName = 'L_FEBRERO'
    end
    object xPrevisionMensualB_MARZO: TFloatField
      DisplayLabel = 'B. Marzo'
      FieldName = 'B_MARZO'
    end
    object xPrevisionMensualL_MARZO: TFloatField
      DisplayLabel = 'Marzo'
      FieldName = 'L_MARZO'
    end
    object xPrevisionMensualB_ABRIL: TFloatField
      DisplayLabel = 'B. Abril'
      FieldName = 'B_ABRIL'
    end
    object xPrevisionMensualL_ABRIL: TFloatField
      DisplayLabel = 'Abril'
      FieldName = 'L_ABRIL'
    end
    object xPrevisionMensualB_MAYO: TFloatField
      DisplayLabel = 'B. Mayo'
      FieldName = 'B_MAYO'
    end
    object xPrevisionMensualL_MAYO: TFloatField
      DisplayLabel = 'Mayo'
      FieldName = 'L_MAYO'
    end
    object xPrevisionMensualB_JUNIO: TFloatField
      DisplayLabel = 'B. Junio'
      FieldName = 'B_JUNIO'
    end
    object xPrevisionMensualL_JUNIO: TFloatField
      DisplayLabel = 'Junio'
      FieldName = 'L_JUNIO'
    end
    object xPrevisionMensualL_JULIO: TFloatField
      DisplayLabel = 'Julio'
      FieldName = 'L_JULIO'
    end
    object xPrevisionMensualL_AGOSTO: TFloatField
      DisplayLabel = 'Agosto'
      FieldName = 'L_AGOSTO'
    end
    object xPrevisionMensualB_SEPTIEMBRE: TFloatField
      DisplayLabel = 'B. Septiembre'
      FieldName = 'B_SEPTIEMBRE'
    end
    object xPrevisionMensualL_SEPTIEMBRE: TFloatField
      DisplayLabel = 'Septiembre'
      FieldName = 'L_SEPTIEMBRE'
    end
    object xPrevisionMensualB_OCTUBRE: TFloatField
      DisplayLabel = 'B. Octubre'
      FieldName = 'B_OCTUBRE'
    end
    object xPrevisionMensualL_OCTUBRE: TFloatField
      DisplayLabel = 'Octubre'
      FieldName = 'L_OCTUBRE'
    end
    object xPrevisionMensualL_NOVIEMBRE: TFloatField
      DisplayLabel = 'Noviembre'
      FieldName = 'L_NOVIEMBRE'
    end
    object xPrevisionMensualB_DICIEMBRE: TFloatField
      DisplayLabel = 'B. Diciembre'
      FieldName = 'B_DICIEMBRE'
    end
    object xPrevisionMensualL_DICIEMBRE: TFloatField
      DisplayLabel = 'Diciembre'
      FieldName = 'L_DICIEMBRE'
    end
    object xPrevisionMensualB_AGOSTO: TFloatField
      DisplayLabel = 'B. Agostro'
      FieldName = 'B_AGOSTO'
    end
    object xPrevisionMensualB_NOVIEMBRE: TFloatField
      DisplayLabel = 'B. Noviembre'
      FieldName = 'B_NOVIEMBRE'
    end
    object xPrevisionMensualB_JULIO: TFloatField
      DisplayLabel = 'B. Julio'
      FieldName = 'B_JULIO'
    end
  end
  object DSxPrevisionMensual: TDataSource
    DataSet = xPrevisionMensual
    Left = 584
    Top = 200
  end
  object xPrevisionAnual: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TEstadistica
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from g_vent_prev_mensuales_anuales'
      
        '(?EMPRESA, ?EJERCICIO,  ?CANAL, ?CLIENTE,  ?MODO, ?MONEDA,  ?POR' +
        'CENTAJE_VENTAS, ?TIPO, ?ENTRADA) ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TEstadistica
    Left = 480
    Top = 248
    object xPrevisionAnualTOTAL_BASE: TFloatField
      DisplayLabel = 'Total Base'
      FieldName = 'TOTAL_BASE'
    end
    object xPrevisionAnualTOTAL_LIQUIDO: TFloatField
      DisplayLabel = 'Total Liquido'
      FieldName = 'TOTAL_LIQUIDO'
    end
  end
  object DSxPrevisionAnual: TDataSource
    DataSet = xPrevisionAnual
    Left = 584
    Top = 248
  end
  object xDocumentos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'select * from g_estado_recibos '
      '(?Empresa, ?Ejercicio,?Canal, ?Cliente, ?Moneda, '#39'FAC'#39', 2)')
    UniDirectional = True
    DataSource = DSQMClientes
    Left = 480
    Top = 440
    object xDocumentosN_PAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'N_PAGADO'
    end
    object xDocumentosT_PAGADO: TFloatField
      DisplayLabel = 'T. Pagado'
      FieldName = 'T_PAGADO'
    end
    object xDocumentosN_IMPAGADO: TIntegerField
      DisplayLabel = 'Impag.'
      FieldName = 'N_IMPAGADO'
    end
    object xDocumentosT_IMPAGADO: TFloatField
      DisplayLabel = 'Total Impagado'
      FieldName = 'T_IMPAGADO'
    end
    object xDocumentosN_PEND_COBRAR: TIntegerField
      DisplayLabel = 'Pend. Cobrar'
      FieldName = 'N_PEND_COBRAR'
    end
    object xDocumentosT_PEND_COBRAR: TFloatField
      DisplayLabel = 'Total Pend. Cobrar'
      FieldName = 'T_PEND_COBRAR'
    end
    object xDocumentosN_PEND_RECIBIR: TIntegerField
      DisplayLabel = 'Pend. Recibir'
      FieldName = 'N_PEND_RECIBIR'
    end
    object xDocumentosT_PEND_RECIBIR: TFloatField
      DisplayLabel = 'Total Pend. Recibir'
      FieldName = 'T_PEND_RECIBIR'
    end
    object xDocumentosMEDIA_DIAS_PAGO: TIntegerField
      DisplayLabel = 'Media Dias Pago'
      FieldName = 'MEDIA_DIAS_PAGO'
    end
    object xDocumentosMEDIA_DIAS_REC: TIntegerField
      DisplayLabel = 'Medias Dias Rec.'
      FieldName = 'MEDIA_DIAS_REC'
    end
    object xDocumentosCUENTA_PEND: TFIBStringField
      DisplayLabel = 'Cta. Pend.'
      FieldName = 'CUENTA_PEND'
      Size = 15
    end
    object xDocumentosCUENTA_ANTICIPO: TFIBStringField
      DisplayLabel = 'Cta. Anticipo'
      FieldName = 'CUENTA_ANTICIPO'
      Size = 15
    end
    object xDocumentosN_PRESUP_PEND: TIntegerField
      DisplayLabel = 'Presup. Pend.'
      FieldName = 'N_PRESUP_PEND'
    end
    object xDocumentosB_PRESUP_PEND: TFloatField
      DisplayLabel = 'B. Presup. Pend.'
      FieldName = 'B_PRESUP_PEND'
    end
    object xDocumentosT_PRESUP_PEND: TFloatField
      DisplayLabel = 'Total Presup. Pendiente'
      FieldName = 'T_PRESUP_PEND'
    end
    object xDocumentosN_PRESUP_ACEPT: TIntegerField
      DisplayLabel = 'Presup. Aceptado'
      FieldName = 'N_PRESUP_ACEPT'
    end
    object xDocumentosB_PRESUP_ACEPT: TFloatField
      DisplayLabel = 'B. Presup. Aceptado'
      FieldName = 'B_PRESUP_ACEPT'
    end
    object xDocumentosT_PRESUP_ACEPT: TFloatField
      DisplayLabel = 'Total Presup. Aceptado'
      FieldName = 'T_PRESUP_ACEPT'
    end
    object xDocumentosN_PRESUP_DENI: TIntegerField
      DisplayLabel = 'Presup. Denegado'
      FieldName = 'N_PRESUP_DENI'
    end
    object xDocumentosB_PRESUP_DENI: TFloatField
      DisplayLabel = 'B. Presup. Den.'
      FieldName = 'B_PRESUP_DENI'
    end
    object xDocumentosT_PRESUP_DENI: TFloatField
      DisplayLabel = 'Total Presup. Denegado'
      FieldName = 'T_PRESUP_DENI'
    end
    object xDocumentosN_PED_PEND: TIntegerField
      DisplayLabel = 'Ped. Pdte.'
      FieldName = 'N_PED_PEND'
    end
    object xDocumentosB_PED_PEND: TFloatField
      DisplayLabel = 'B. Ped. Pend.'
      FieldName = 'B_PED_PEND'
    end
    object xDocumentosT_PED_PEND: TFloatField
      DisplayLabel = 'Total Ped. Pend.'
      FieldName = 'T_PED_PEND'
    end
    object xDocumentosN_ALB_PEND: TIntegerField
      DisplayLabel = 'Alb. Pdte.'
      FieldName = 'N_ALB_PEND'
    end
    object xDocumentosB_ALB_PEND: TFloatField
      DisplayLabel = 'B. Alb. Pend.'
      FieldName = 'B_ALB_PEND'
    end
    object xDocumentosT_ALB_PEND: TFloatField
      DisplayLabel = 'Total Alb. Pend.'
      FieldName = 'T_ALB_PEND'
    end
    object xDocumentosN_FAC_PEND: TIntegerField
      DisplayLabel = 'Fac. Pdte.'
      FieldName = 'N_FAC_PEND'
    end
    object xDocumentosB_FAC_PEND: TFloatField
      DisplayLabel = 'B Fac. Pend'
      FieldName = 'B_FAC_PEND'
    end
    object xDocumentosT_FAC_PEND: TFloatField
      DisplayLabel = 'Total Fac. Pend.'
      FieldName = 'T_FAC_PEND'
    end
  end
  object xFactCobrada: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'select * from g_estado_recibos '
      '(?Empresa, ?Ejercicio,?Canal, ?Cliente, ?Moneda, '#39'FAC'#39', 1)')
    UniDirectional = True
    DataSource = DSQMClientes
    Left = 480
    Top = 488
    object xFactCobradaN_PAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'N_PAGADO'
    end
    object xFactCobradaT_PAGADO: TFloatField
      DisplayLabel = 'T. Pagado'
      FieldName = 'T_PAGADO'
    end
    object xFactCobradaN_IMPAGADO: TIntegerField
      DisplayLabel = 'Impag.'
      FieldName = 'N_IMPAGADO'
    end
    object xFactCobradaT_IMPAGADO: TFloatField
      DisplayLabel = 'Total Impagado'
      FieldName = 'T_IMPAGADO'
    end
    object xFactCobradaN_PEND_COBRAR: TIntegerField
      DisplayLabel = 'Pend. Cobrar'
      FieldName = 'N_PEND_COBRAR'
    end
    object xFactCobradaT_PEND_COBRAR: TFloatField
      DisplayLabel = 'Total Pend. Cobrar'
      FieldName = 'T_PEND_COBRAR'
    end
    object xFactCobradaN_PEND_RECIBIR: TIntegerField
      DisplayLabel = 'Pend. Recibir'
      FieldName = 'N_PEND_RECIBIR'
    end
    object xFactCobradaT_PEND_RECIBIR: TFloatField
      DisplayLabel = 'Total Pend. Recibir'
      FieldName = 'T_PEND_RECIBIR'
    end
    object xFactCobradaMEDIA_DIAS_PAGO: TIntegerField
      DisplayLabel = 'Media Dias Pago'
      FieldName = 'MEDIA_DIAS_PAGO'
    end
    object xFactCobradaMEDIA_DIAS_REC: TIntegerField
      DisplayLabel = 'Medias Dias Rec.'
      FieldName = 'MEDIA_DIAS_REC'
    end
  end
  object DSxDocumentos: TDataSource
    DataSet = xDocumentos
    Left = 584
    Top = 440
  end
  object DSxFactCobrada: TDataSource
    DataSet = xFactCobrada
    Left = 584
    Top = 488
  end
  object DSQMDescuentosKri: TDataSource
    DataSet = QMDescuentosKri
    Left = 584
    Top = 536
  end
  object QMDescuentosKri: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CLIENTES_DESCUENTOS_KRI'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CLIENTES_DESCUENTOS_KRI'
      '  (EMPRESA,EJERCICIO,CANAL,CLIENTE,DTO_CIAL,IMPORTE,ID)'
      'VALUES'
      '  (?EMPRESA,?EJERCICIO,?CANAL,?CLIENTE,?DTO_CIAL,?IMPORTE,?ID)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CLIENTES_DESCUENTOS_KRI'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CLIENTES_DESCUENTOS_KRI'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND'
      'CLIENTE=?CLIENTE'
      'ORDER BY IMPORTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CLIENTES_DESCUENTOS_KRI'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,CLIENTE=?CLIENTE '
      '  ,DTO_CIAL=?DTO_CIAL '
      '  ,IMPORTE=?IMPORTE '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMClientes
    Plan.Strings = (
      ' ')
    BeforePost = QMDescuentosKriBeforePost
    OnNewRecord = QMDescuentosKriNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CLIENTES_DESCUENTOS_KRI'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 480
    Top = 536
    object QMDescuentosKriEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDescuentosKriEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDescuentosKriCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDescuentosKriCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMDescuentosKriDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Comercial'
      FieldName = 'DTO_CIAL'
    end
    object QMDescuentosKriIMPORTE: TFloatField
      DisplayLabel = 'Desde Importe'
      FieldName = 'IMPORTE'
    end
    object QMDescuentosKriID: TIntegerField
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
    Left = 888
    Top = 56
  end
  object SPRellenarSeleccion: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'EXECUTE PROCEDURE '
      'T_RELLENA_MULTISELECCION(?ENTRADA,?EMPRESA,?EJERCICIO,?MODO)')
    Transaction = TLocal
    AutoTrans = True
    Left = 888
    Top = 536
  end
  object DSxComunicaciones: TDataSource
    DataSet = xComunicaciones
    Left = 376
    Top = 488
  end
  object xComunicaciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_COMUNICACIONES'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_COMUNICACIONES'
      
        '  (ID,EMPRESA,TIPO,COD_CLI_PRO,FECHA_CREACION,FECHA_MODIFICACION' +
        ',ARCHIVO,DESCRIPCION)'
      'VALUES'
      
        '  (?ID,?EMPRESA,?TIPO,?COD_CLI_PRO,?FECHA_CREACION,?FECHA_MODIFI' +
        'CACION,?ARCHIVO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_COMUNICACIONES'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_COMUNICACIONES'
      'WHERE'
      ' EMPRESA=?EMPRESA AND'
      ' TIPO='#39'CLI'#39' AND'
      ' COD_CLI_PRO=?CLIENTE'
      ' ORDER BY ID desc')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_COMUNICACIONES'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,TIPO=?TIPO '
      '  ,COD_CLI_PRO=?COD_CLI_PRO '
      '  ,FECHA_CREACION=?FECHA_CREACION '
      '  ,FECHA_MODIFICACION=?FECHA_MODIFICACION '
      '  ,ARCHIVO=?ARCHIVO '
      '  ,DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMClientes
    Plan.Strings = (
      ' ')
    BeforePost = xComunicacionesBeforePost
    OnNewRecord = xComunicacionesNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_COMUNICACIONES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 288
    Top = 488
    object xComunicacionesID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object xComunicacionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xComunicacionesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xComunicacionesCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CLI_PRO'
    end
    object xComunicacionesARCHIVO: TFIBStringField
      DisplayLabel = 'Archivo'
      FieldName = 'ARCHIVO'
      Size = 100
    end
    object xComunicacionesFECHA_CREACION: TDateTimeField
      DisplayLabel = 'Fecha Creacion'
      FieldName = 'FECHA_CREACION'
    end
    object xComunicacionesFECHA_MODIFICACION: TDateTimeField
      DisplayLabel = 'Fecha Modificacion'
      FieldName = 'FECHA_MODIFICACION'
    end
    object xComunicacionesDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 200
    end
  end
  object DSDetConsumo: TDataSource
    DataSet = QMDetConsumo
    Left = 584
    Top = 584
  end
  object QMDetConsumo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CLIENTES_CONSUMO'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  CLIENTE=?old_CLIENTE AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CLIENTES_CONSUMO'
      
        '  (IDDETCONSUMO,AGRUPACION,LINEA,CONSUMO,CLIENTE,EMPRESA,EJERCIC' +
        'IO,TERCERO)'
      'VALUES'
      
        '  (?IDDETCONSUMO,?AGRUPACION,?LINEA,?CONSUMO,?CLIENTE,?EMPRESA,?' +
        'EJERCICIO,?TERCERO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CLIENTES_CONSUMO'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  CLIENTE=?CLIENTE AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CLIENTES_CONSUMO'
      
        'where empresa=?empresa and ejercicio=?ejercicio and cliente=?cli' +
        'ente')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CLIENTES_CONSUMO'
      'SET'
      '   AGRUPACION=?AGRUPACION '
      '  ,CONSUMO=?CONSUMO '
      'WHERE'
      '  IDDETCONSUMO=?IDDETCONSUMO'
      '/*  LINEA=?LINEA AND '
      '  CLIENTE=?CLIENTE AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA */')
    DataSource = DSQMClientes
    OnNewRecord = QMDetConsumoNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'CLIENTE '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CLIENTES_CONSUMO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 480
    Top = 584
    object QMDetConsumoIDDETCONSUMO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'IDDETCONSUMO'
    end
    object QMDetConsumoAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      OnChange = QMDetConsumoAGRUPACIONChange
      Size = 3
    end
    object QMDetConsumoCONSUMO: TFloatField
      DisplayLabel = 'Consumo'
      FieldName = 'CONSUMO'
    end
    object QMDetConsumoDescAgrupacion: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescAgrupacion'
      OnGetText = QMDetConsumoDescAgrupacionGetText
      Size = 0
      Calculated = True
    end
    object QMDetConsumoLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetConsumoCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMDetConsumoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetConsumoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetConsumoTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
  end
  object xTipoNCF: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM Z_SYS_TIPO_NCF'
      'WHERE'
      'TIPO_NCF=?TIPO_NCF')
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_TIPO_NCF '
      'WHERE TIPO_DOCUMENTO IN (0, 2)'
      'ORDER BY TIPO_NCF')
    UniDirectional = False
    Left = 56
    Top = 488
    object xTipoNCFTIPO_NCF: TIntegerField
      DisplayLabel = 'Tipo NCF'
      FieldName = 'TIPO_NCF'
    end
    object xTipoNCFTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxTipoNCF: TDataSource
    DataSet = xTipoNCF
    Left = 160
    Top = 488
  end
  object xIsoCli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ISO_NO_CONFORMIDAD'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'CLIPRO=?CLIENTE')
    UniDirectional = False
    DataSource = DSQMClientes
    Left = 56
    Top = 584
    object xIsoCliEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xIsoCliRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object xIsoCliTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xIsoCliCLI_PRO_INTE: TIntegerField
      DisplayLabel = 'CLi./Prov. INTE'
      FieldName = 'CLI_PRO_INTE'
    end
    object xIsoCliSITUACION: TFIBStringField
      DisplayLabel = 'Situacion'
      FieldName = 'SITUACION'
      Size = 3
    end
    object xIsoCliSERIE_DOC: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'SERIE_DOC'
      Size = 10
    end
    object xIsoCliNUM_DOC: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'NUM_DOC'
    end
    object xIsoCliDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 200
    end
    object xIsoCliFECHA_INC: TDateTimeField
      DisplayLabel = 'Fecha Inc.'
      FieldName = 'FECHA_INC'
    end
    object xIsoCliRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
    object xIsoCliPOR_CLASIFICA: TIntegerField
      DisplayLabel = 'Por Clasificar'
      FieldName = 'POR_CLASIFICA'
    end
    object xIsoCliESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xIsoCliNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xIsoCliTIRAR: TIntegerField
      DisplayLabel = 'Tirar'
      FieldName = 'TIRAR'
    end
    object xIsoCliRECUPERAR_ISO: TIntegerField
      DisplayLabel = 'Recuperar ISO'
      FieldName = 'RECUPERAR_ISO'
    end
    object xIsoCliDEVOLVER: TIntegerField
      DisplayLabel = 'Devolver'
      FieldName = 'DEVOLVER'
    end
    object xIsoCliACEPTAR: TIntegerField
      DisplayLabel = 'Aceptar'
      FieldName = 'ACEPTAR'
    end
    object xIsoCliOTROS: TIntegerField
      DisplayLabel = 'Otros'
      FieldName = 'OTROS'
    end
    object xIsoCliVBCALIDAD: TIntegerField
      DisplayLabel = 'VB Calidad'
      FieldName = 'VBCALIDAD'
    end
    object xIsoCliVBRESDEPARTAMENTO: TIntegerField
      DisplayLabel = 'VB Res Dpto.'
      FieldName = 'VBRESDEPARTAMENTO'
    end
    object xIsoCliCANTIDAD: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xIsoCliFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object xIsoCliNDEVOLUCION: TIntegerField
      DisplayLabel = 'Nro. Dev.'
      FieldName = 'NDEVOLUCION'
    end
    object xIsoCliCONTADOR: TFIBStringField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object xIsoCliDEPARTAMENTO: TFIBStringField
      DisplayLabel = 'Dpto.'
      FieldName = 'DEPARTAMENTO'
      Size = 3
    end
    object xIsoCliEVIDENCIA: TFIBStringField
      DisplayLabel = 'Evidencia'
      FieldName = 'EVIDENCIA'
      Size = 200
    end
    object xIsoCliNDOCCLI: TIntegerField
      DisplayLabel = 'Nro. Doc. Cli.'
      FieldName = 'NDOCCLI'
    end
    object xIsoCliREFERENCIACLI: TFIBStringField
      DisplayLabel = 'Ref. Cli.'
      FieldName = 'REFERENCIACLI'
      Size = 40
    end
    object xIsoCliNOTAS_INC: TMemoField
      FieldName = 'NOTAS_INC'
      BlobType = ftMemo
      Size = 8
    end
    object xIsoCliCOSTE_TOTAL: TFloatField
      DisplayLabel = 'Coste Total'
      FieldName = 'COSTE_TOTAL'
    end
    object xIsoCliLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xIsoCliEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xIsoCliCLIPRO: TIntegerField
      DisplayLabel = 'Cli./Prov.'
      FieldName = 'CLIPRO'
    end
    object xIsoCliCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xIsoCliCOSTE_INC: TFloatField
      DisplayLabel = 'Coste Inc.'
      FieldName = 'COSTE_INC'
    end
  end
  object DSxIsoCli: TDataSource
    DataSet = xIsoCli
    Left = 160
    Top = 584
  end
  object QMCentroAdministrativo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CLIENTES_CENTRO_ADM'
      'WHERE'
      '  ROL_CENTRO_ADMINISTRATIVO=?old_ROL_CENTRO_ADMINISTRATIVO AND '
      '  DIRECCION=?old_DIRECCION AND '
      '  CLIENTE=?old_CLIENTE AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CLIENTES_CENTRO_ADM'
      
        '  (ROL_CENTRO_ADMINISTRATIVO,CENTRO_ADMINISTRATIVO,ID_CLIENTE,CL' +
        'IENTE,EMPRESA,TERCERO,DIRECCION,NOMBRE)'
      'VALUES'
      
        '  (?ROL_CENTRO_ADMINISTRATIVO,?CENTRO_ADMINISTRATIVO,?ID_CLIENTE' +
        ',?CLIENTE,?EMPRESA,?TERCERO,?DIRECCION,?NOMBRE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CLIENTES_CENTRO_ADM'
      'WHERE'
      '  ROL_CENTRO_ADMINISTRATIVO=?old_ROL_CENTRO_ADMINISTRATIVO AND '
      '  DIRECCION=?old_DIRECCION AND '
      '  CLIENTE=?CLIENTE AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CLIENTES_CENTRO_ADM'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'CLIENTE=?CLIENTE'
      'ORDER BY DIRECCION, ROL_CENTRO_ADMINISTRATIVO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CLIENTES_CENTRO_ADM'
      'SET'
      '  DIRECCION=?new_DIRECCION'
      '  ,ROL_CENTRO_ADMINISTRATIVO=?new_ROL_CENTRO_ADMINISTRATIVO'
      '  ,CENTRO_ADMINISTRATIVO=?new_CENTRO_ADMINISTRATIVO '
      '  ,ID_CLIENTE=?ID_CLIENTE '
      '  ,TERCERO=?TERCERO '
      '  ,NOMBRE=?NOMBRE'
      'WHERE'
      '  ROL_CENTRO_ADMINISTRATIVO=?old_ROL_CENTRO_ADMINISTRATIVO AND '
      '  DIRECCION=?old_DIRECCION AND '
      '  CLIENTE=?CLIENTE AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMClientes
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CLIENTES_CUENTAS CLI INDEX (EMP_CLIENTES_CL' +
        'I_TER),VER_CLIENTES_CUENTAS DI INDEX (PK_SYS_TERCEROS_DIRECCIONE' +
        'S),VER_CLIENTES_CUENTAS LOC INDEX (ID_LOCALIDADES),VER_CLIENTES_' +
        'CUENTAS GCLI INDEX (PK_CON_CUENTAS_GES_CLI),VER_CLIENTES_CUENTAS' +
        ' TER INDEX (PK_SYS_TERCEROS)))')
    OnNewRecord = QMCentroAdministrativoNewRecord
    ClavesPrimarias.Strings = (
      'ROL_CENTRO_ADMINISTRATIVO '
      'DIRECCION '
      'CLIENTE '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CLIENTES_CENTRO_ADM'
    BloqOpt = True
    CamposBloqueo.Strings = (
      'EMPRESA,EJERCICIO,CANAL,CLIENTE'
      'EMPRESA,CLIENTE')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 632
    object QMCentroAdministrativoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCentroAdministrativoCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCentroAdministrativoID_CLIENTE: TIntegerField
      DisplayLabel = 'ID Cliente'
      FieldName = 'ID_CLIENTE'
    end
    object QMCentroAdministrativoCENTRO_ADMINISTRATIVO: TFIBStringField
      DisplayLabel = 'Centro Adm.'
      FieldName = 'CENTRO_ADMINISTRATIVO'
      Size = 10
    end
    object QMCentroAdministrativoROL_CENTRO_ADMINISTRATIVO: TFIBStringField
      DisplayLabel = 'Rol'
      FieldName = 'ROL_CENTRO_ADMINISTRATIVO'
      Size = 2
    end
    object QMCentroAdministrativoTITULO_ROL: TStringField
      DisplayLabel = 'Titulo'
      FieldKind = fkCalculated
      FieldName = 'TITULO_ROL'
      OnGetText = QMCentroAdministrativoTITULO_ROLGetText
      Size = 40
      Calculated = True
    end
    object QMCentroAdministrativoTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMCentroAdministrativoDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object QMCentroAdministrativoTITULO_DIRECCION: TStringField
      DisplayLabel = 'Titulo'
      DisplayWidth = 125
      FieldKind = fkCalculated
      FieldName = 'TITULO_DIRECCION'
      OnGetText = QMCentroAdministrativoTITULO_DIRECCIONGetText
      Size = 125
      Calculated = True
    end
    object QMCentroAdministrativoNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre (Centro Adm.)'
      FieldName = 'NOMBRE'
      Size = 40
    end
  end
  object DSQMCentroAdministrativo: TDataSource
    DataSet = QMCentroAdministrativo
    Left = 160
    Top = 632
  end
  object DSQMPrestaShop: TDataSource
    DataSet = QMPrestaShop
    Left = 376
    Top = 584
  end
  object QMPrestaShop: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_CONF_PRESTASHOP_CLIENTE'
      'WHERE'
      '  ID_CONFIGURACION=?old_ID_CONFIGURACION AND '
      '  ID_CLIENTE=?old_ID_CLIENTE ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_CONF_PRESTASHOP_CLIENTE'
      '  (ULT_SINCRONIZACION,ID_CONFIGURACION,ID_CLIENTE,ID_CUSTOMER)'
      'VALUES'
      
        '  (?ULT_SINCRONIZACION,?ID_CONFIGURACION,?ID_CLIENTE,?ID_CUSTOME' +
        'R)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CONF_PRESTASHOP_CLIENTE'
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_CLIENTE=?ID_CLIENTE ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CONF_PRESTASHOP_CLIENTE'
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_CLIENTE=?ID_CLIENTE ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CONF_PRESTASHOP_CLIENTE'
      'SET'
      '  ID_CUSTOMER=?ID_CUSTOMER '
      'WHERE'
      '  ID_CONFIGURACION=?ID_CONFIGURACION AND '
      '  ID_CLIENTE=?ID_CLIENTE ')
    DataSource = DSQMClientes
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'ID_CONFIGURACION '
      'ID_CLIENTE ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CONF_PRESTASHOP_CLIENTE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 288
    Top = 584
    object QMPrestaShopID_CONFIGURACION: TIntegerField
      DisplayLabel = 'ID Conf.'
      FieldName = 'ID_CONFIGURACION'
    end
    object QMPrestaShopID_CLIENTE: TIntegerField
      DisplayLabel = 'ID Cliente'
      FieldName = 'ID_CLIENTE'
    end
    object QMPrestaShopID_CUSTOMER: TIntegerField
      DisplayLabel = 'ID Customer'
      FieldName = 'ID_CUSTOMER'
    end
    object QMPrestaShopULT_SINCRONIZACION: TDateTimeField
      DisplayLabel = 'Ult. Sincronizacion'
      FieldName = 'ULT_SINCRONIZACION'
    end
  end
  object DSxVentasDetalle: TDataSource
    DataSet = xVentasDetalle
    Left = 376
    Top = 392
  end
  object xVentasDetalle: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    RefreshSQL.Strings = (
      
        'SELECT C.MONEDA, C.FECHA, C.CLIENTE, C.TERCERO, C.DIRECCION, C.S' +
        'U_REFERENCIA, C.FORMA_PAGO, C.CAMPANYA, C.ESTADO,'
      
        '       C.POR_FINANCIACION, C.PORTES, C.TARIFA, C.FECHA_ENTREGA, ' +
        'C.IDIOMA, C.CONTACTO, C.ADJUNTO, C.I_PORTES,'
      
        '       C.POR_PORTES, C.TIPO_PORTES, C.RANGO, C.INDICE, C.CAMBIO_' +
        'FIJO, C.PEDIDO_CLIENTE, C.Z_CONTACTO, C.Z_OBSERVACION,'
      '       C.TRANSPORTISTA, C.BANCO, D.*, CC.CODIGO_CLIENTE,'
      '       CASE C.TIPO'
      '         WHEN '#39'PEC'#39' THEN'
      '             DP.U_PENDIENTES'
      '         WHEN '#39'ALB'#39' THEN'
      '             DA.UNIDADES_A_FACTURAR'
      '         ELSE 0'
      '       END AS U_PENDIENTES'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_DETALLES_S D ON C.ID_S = D.ID_S'
      
        'LEFT JOIN ART_ARTICULOS_CODCLI CC ON C.EMPRESA = CC.EMPRESA AND ' +
        'D.ARTICULO = CC.ARTICULO AND C.CLIENTE = CC.CLIENTE'
      
        'LEFT JOIN GES_DETALLES_S_PED DP ON D.ID_DETALLES_S = DP.ID_DETAL' +
        'LES_S'
      
        'LEFT JOIN GES_DETALLES_S_ALB DA ON D.ID_DETALLES_S = DA.ID_DETAL' +
        'LES_S'
      'WHERE'
      'D.ID_DETALLES_S = :ID_DETALLE_S'
      ' ')
    SelectSQL.Strings = (
      
        'SELECT C.MONEDA, C.FECHA, C.CLIENTE, C.TERCERO, C.DIRECCION, C.S' +
        'U_REFERENCIA, C.FORMA_PAGO, C.CAMPANYA, C.ESTADO,'
      
        '       C.POR_FINANCIACION, C.PORTES, C.TARIFA, C.FECHA_ENTREGA, ' +
        'C.IDIOMA, C.CONTACTO, C.ADJUNTO, C.I_PORTES,'
      
        '       C.POR_PORTES, C.TIPO_PORTES, C.RANGO, C.INDICE, C.CAMBIO_' +
        'FIJO, C.PEDIDO_CLIENTE, C.Z_CONTACTO, C.Z_OBSERVACION,'
      '       C.TRANSPORTISTA, C.BANCO, D.*, CC.CODIGO_CLIENTE,'
      '       CASE C.TIPO'
      '         WHEN '#39'PEC'#39' THEN'
      '             DP.U_PENDIENTES'
      '         WHEN '#39'ALB'#39' THEN'
      '             DA.UNIDADES_A_FACTURAR'
      '         ELSE 0'
      '       END AS U_PENDIENTES'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_DETALLES_S D ON C.ID_S = D.ID_S'
      
        'LEFT JOIN ART_ARTICULOS_CODCLI CC ON C.EMPRESA = CC.EMPRESA AND ' +
        'D.ARTICULO = CC.ARTICULO AND C.CLIENTE = CC.CLIENTE'
      
        'LEFT JOIN GES_DETALLES_S_PED DP ON D.ID_DETALLES_S = DP.ID_DETAL' +
        'LES_S'
      
        'LEFT JOIN GES_DETALLES_S_ALB DA ON D.ID_DETALLES_S = DA.ID_DETAL' +
        'LES_S'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.CLIENTE = :CLIENTE AND'
      'C.TERCERO = :TERCERO /* PARA UTILIZAR INDICES */'
      'ORDER BY C.FECHA DESC'
      ' ')
    UniDirectional = False
    DataSource = DSQMClientes
    Opciones = []
    AutoSQLdeVistas = False
    Left = 288
    Top = 392
    object xVentasDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVentasDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVentasDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVentasDetalleSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xVentasDetalleTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xVentasDetalleRIG: TIntegerField
      DisplayLabel = 'Documento'
      FieldName = 'RIG'
    end
    object xVentasDetalleALMACEN: TFIBStringField
      DisplayLabel = 'Almacen Cab.'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xVentasDetalleMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xVentasDetalleFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xVentasDetalleCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xVentasDetalleTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xVentasDetalleDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object xVentasDetalleSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xVentasDetalleFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xVentasDetalleCAMPANYA: TIntegerField
      DisplayLabel = 'Campa'#241'a'
      FieldName = 'CAMPANYA'
    end
    object xVentasDetalleESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xVentasDetalleAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xVentasDetalleDTO_PP: TFloatField
      DisplayLabel = 'Dto. PP'
      FieldName = 'DTO_PP'
    end
    object xVentasDetalleDTO_CIAL: TFloatField
      DisplayLabel = 'Dto . Cial'
      FieldName = 'DTO_CIAL'
    end
    object xVentasDetallePOR_FINANCIACION: TFloatField
      DisplayLabel = 'Porc. Financiacion'
      FieldName = 'POR_FINANCIACION'
    end
    object xVentasDetallePORTES: TIntegerField
      DisplayLabel = 'Portes'
      FieldName = 'PORTES'
    end
    object xVentasDetalleTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object xVentasDetalleID_S: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_S'
    end
    object xVentasDetalleFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fecha Entrega'
      FieldName = 'FECHA_ENTREGA'
    end
    object xVentasDetalleIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object xVentasDetalleCONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
    end
    object xVentasDetallePOR_PORTES: TFloatField
      DisplayLabel = 'Porc. Portes'
      FieldName = 'POR_PORTES'
    end
    object xVentasDetalleTIPO_PORTES: TIntegerField
      DisplayLabel = 'Tipo Portes'
      FieldName = 'TIPO_PORTES'
    end
    object xVentasDetalleRANGO: TIntegerField
      DisplayLabel = 'Rango Portes'
      FieldName = 'RANGO'
    end
    object xVentasDetalleINDICE: TIntegerField
      DisplayLabel = 'Inidice Portes'
      FieldName = 'INDICE'
    end
    object xVentasDetalleCAMBIO_FIJO: TIntegerField
      DisplayLabel = 'Cambio Fijo'
      FieldName = 'CAMBIO_FIJO'
    end
    object xVentasDetallePROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object xVentasDetallePEDIDO_CLIENTE: TFIBStringField
      DisplayLabel = 'Ref. Cliente'
      FieldName = 'PEDIDO_CLIENTE'
      Size = 60
    end
    object xVentasDetalleZ_CONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'Z_CONTACTO'
    end
    object xVentasDetalleZ_OBSERVACION: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'Z_OBSERVACION'
      Size = 256
    end
    object xVentasDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xVentasDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xVentasDetalleTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object xVentasDetalleUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xVentasDetallePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xVentasDetallePIEZAS_X_BULTO: TIntegerField
      DisplayLabel = 'Pezas x Bultos'
      FieldName = 'PIEZAS_X_BULTO'
    end
    object xVentasDetalleDESCUENTO: TFloatField
      DisplayLabel = 'Dto. 1'
      FieldName = 'DESCUENTO'
    end
    object xVentasDetalleDESCUENTO_2: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'DESCUENTO_2'
    end
    object xVentasDetalleDESCUENTO_3: TFloatField
      DisplayLabel = 'Dto. 3'
      FieldName = 'DESCUENTO_3'
    end
    object xVentasDetalleCOMISION: TFloatField
      DisplayLabel = 'Comision'
      FieldName = 'COMISION'
    end
    object xVentasDetalleP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xVentasDetalleM_MOV_STOCK: TIntegerField
      DisplayLabel = 'N. Mov. Stock'
      FieldName = 'M_MOV_STOCK'
    end
    object xVentasDetallePAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xVentasDetalleTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object xVentasDetalleP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object xVentasDetalleP_RECARGO: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_RECARGO'
    end
    object xVentasDetalleI_DESCUENTO: TFloatField
      DisplayLabel = 'Imp. Desc.'
      FieldName = 'I_DESCUENTO'
    end
    object xVentasDetalleB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object xVentasDetalleB_DTO_LINEA: TFloatField
      DisplayLabel = 'Base Linea'
      FieldName = 'B_DTO_LINEA'
    end
    object xVentasDetalleC_IVA: TFloatField
      DisplayLabel = 'IVA Linea'
      FieldName = 'C_IVA'
    end
    object xVentasDetalleC_RECARGO: TFloatField
      DisplayLabel = 'C. Recargo'
      FieldName = 'C_RECARGO'
    end
    object xVentasDetalleUNIDADES_EXT: TFloatField
      DisplayLabel = 'Uds. Ext.'
      FieldName = 'UNIDADES_EXT'
    end
    object xVentasDetalleIVA_INCLUIDO: TIntegerField
      DisplayLabel = 'IVA Incl.'
      FieldName = 'IVA_INCLUIDO'
    end
    object xVentasDetalleNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object xVentasDetalleB_COMISION_CANAL: TFloatField
      DisplayLabel = 'B. Comision'
      FieldName = 'B_COMISION_CANAL'
    end
    object xVentasDetalleEJER_MOV: TIntegerField
      DisplayLabel = 'Ejer. Mov.'
      FieldName = 'EJER_MOV'
    end
    object xVentasDetalleUNIDADES_SEC: TFloatField
      DisplayLabel = 'Uds. Sec.'
      FieldName = 'UNIDADES_SEC'
    end
    object xVentasDetalleNO_FABRICACION_KRI: TFIBStringField
      DisplayLabel = 'Nro. Fabr.'
      FieldName = 'NO_FABRICACION_KRI'
      Size = 15
    end
    object xVentasDetalleID_DETALLES_S: TIntegerField
      DisplayLabel = 'Id Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object xVentasDetalleID_D_S_GR: TIntegerField
      DisplayLabel = 'Id. TyC'
      FieldName = 'ID_D_S_GR'
    end
    object xVentasDetalleID_A_M_C_T: TIntegerField
      DisplayLabel = 'Id. Mod.'
      FieldName = 'ID_A_M_C_T'
    end
    object xVentasDetalleID_C_A: TIntegerField
      DisplayLabel = 'Id. C. A.'
      FieldName = 'ID_C_A'
    end
    object xVentasDetalleID_A: TIntegerField
      DisplayLabel = 'Id Art.'
      FieldName = 'ID_A'
    end
    object xVentasDetalleID_MOV_STOCKS: TIntegerField
      DisplayLabel = 'Id. Mov. Stock'
      FieldName = 'ID_MOV_STOCKS'
    end
    object xVentasDetalleTITULO_IDIOMA: TFIBStringField
      DisplayLabel = 'Titulo Idioma'
      FieldName = 'TITULO_IDIOMA'
      Size = 60
    end
    object xVentasDetalleORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xVentasDetalleTIPO_LINEA: TFIBStringField
      DisplayLabel = 'Tipo Lin.'
      FieldName = 'TIPO_LINEA'
      Size = 3
    end
    object xVentasDetalleORIGEN: TIntegerField
      DisplayLabel = 'Orig.'
      FieldName = 'ORIGEN'
    end
    object xVentasDetallePROC_PROMOCION: TIntegerField
      DisplayLabel = 'Proc. Prom.'
      FieldName = 'PROC_PROMOCION'
    end
    object xVentasDetalleID_P: TIntegerField
      DisplayLabel = 'Id Prom.'
      FieldName = 'ID_P'
    end
    object xVentasDetalleAPLICA_UNIDADES_SECUNDARIAS: TIntegerField
      DisplayLabel = 'Aplica Uds. Ext.'
      FieldName = 'APLICA_UNIDADES_SECUNDARIAS'
    end
    object xVentasDetalleCERTIFICADO: TIntegerField
      DisplayLabel = 'Certif.'
      FieldName = 'CERTIFICADO'
    end
    object xVentasDetalleCERT_NEGATIVO: TIntegerField
      DisplayLabel = 'Cert. Negativo'
      FieldName = 'CERT_NEGATIVO'
    end
    object xVentasDetalleLINEA_RELACION: TIntegerField
      DisplayLabel = 'Lin. Relacion'
      FieldName = 'LINEA_RELACION'
    end
    object xVentasDetalleNOTAS2: TBlobField
      DisplayLabel = 'Notas Int.'
      FieldName = 'NOTAS2'
      Size = 8
    end
    object xVentasDetalleCRC_NOTAS: TFIBStringField
      DisplayLabel = 'CRC Notas'
      FieldName = 'CRC_NOTAS'
      Size = 15
    end
    object xVentasDetalleCRC_NOTAS2: TFIBStringField
      DisplayLabel = 'CRC Notas Int.'
      FieldName = 'CRC_NOTAS2'
      Size = 15
    end
    object xVentasDetallePRO_NUM_PLANO: TFIBStringField
      DisplayLabel = 'Obs.'
      FieldName = 'PRO_NUM_PLANO'
      Size = 35
    end
    object xVentasDetalleCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xVentasDetalleLOTE_SIMPLE: TFIBStringField
      DisplayLabel = 'Lote Simple'
      FieldName = 'LOTE_SIMPLE'
    end
    object xVentasDetalleID_DESPIECE: TIntegerField
      DisplayLabel = 'Id Despiece'
      FieldName = 'ID_DESPIECE'
    end
    object xVentasDetalleCOSTE_ADICIONAL: TFloatField
      DisplayLabel = 'Coste Adic.'
      FieldName = 'COSTE_ADICIONAL'
    end
    object xVentasDetalleT_COSTE: TFloatField
      DisplayLabel = 'Total Coste'
      FieldName = 'T_COSTE'
    end
    object xVentasDetalleMANIPULACION: TIntegerField
      DisplayLabel = 'Manip.'
      FieldName = 'MANIPULACION'
    end
    object xVentasDetalleCODIGO_CLIENTE: TFIBStringField
      DisplayLabel = 'Cod. Art. Cliente'
      FieldName = 'CODIGO_CLIENTE'
      Size = 40
    end
    object xVentasDetalleADJUNTO: TFIBStringField
      DisplayLabel = 'Adjunto'
      FieldName = 'ADJUNTO'
      Size = 200
    end
    object xVentasDetalleI_PORTES: TFloatField
      DisplayLabel = 'Imp. Portes'
      FieldName = 'I_PORTES'
    end
    object xVentasDetalleTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'TRANSPORTISTA'
    end
    object xVentasDetalleBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object xVentasDetalleBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object xVentasDetalleBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object xVentasDetalleB_COMISION: TFloatField
      DisplayLabel = 'B. Comision'
      FieldName = 'B_COMISION'
    end
    object xVentasDetalleI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. PP'
      FieldName = 'I_DTO_PP'
    end
    object xVentasDetalleI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial.'
      FieldName = 'I_DTO_CIAL'
    end
    object xVentasDetalleI_COMISION: TFloatField
      DisplayLabel = 'Imp. Comision'
      FieldName = 'I_COMISION'
    end
    object xVentasDetalleENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xVentasDetalleNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object xVentasDetalleCOMISION_LINEAL: TFloatField
      DisplayLabel = 'Com. Lineal'
      FieldName = 'COMISION_LINEAL'
    end
    object xVentasDetalleI_COMISION_LINEAL: TFloatField
      DisplayLabel = 'Imp. Comision Lineal'
      FieldName = 'I_COMISION_LINEAL'
    end
    object xVentasDetalleMARGEN_KRI: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN_KRI'
    end
    object xVentasDetalleTIPO_LINEA_KRI: TIntegerField
      DisplayLabel = 'Tipo Linea'
      FieldName = 'TIPO_LINEA_KRI'
    end
    object xVentasDetalleULT_MODIFICACION: TDateTimeField
      DisplayLabel = 'Ult. Modificacion'
      FieldName = 'ULT_MODIFICACION'
    end
    object xVentasDetalleID_REGISTRO: TIntegerField
      DisplayLabel = 'Id Registro'
      FieldName = 'ID_REGISTRO'
    end
    object xVentasDetalleINVERSION_SUJETO_PASIVO: TIntegerField
      DisplayLabel = 'I.S.P.'
      FieldName = 'INVERSION_SUJETO_PASIVO'
    end
    object xVentasDetalleTIPO_IMPUESTO_ADICIONAL: TIntegerField
      DisplayLabel = 'Tipo Imp. Adicional'
      FieldName = 'TIPO_IMPUESTO_ADICIONAL'
    end
    object xVentasDetalleLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xVentasDetalleM_BRUTO: TFloatField
      DisplayLabel = 'Marg. Bruto'
      FieldName = 'M_BRUTO'
    end
    object xVentasDetallePESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object xVentasDetallePESO_TOTAL: TFloatField
      DisplayLabel = 'Peso Total'
      FieldName = 'PESO_TOTAL'
    end
    object xVentasDetallePESO_REAL: TFloatField
      DisplayLabel = 'Peso Real'
      FieldName = 'PESO_REAL'
    end
    object xVentasDetalleU_PENDIENTES: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'U_PENDIENTES'
    end
  end
  object xTipoGiro: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CLIENTES_GIROS'
      'WHERE'
      '  CODIGO_GIRO=?old_CODIGO_GIRO AND '
      '  CLIENTE=?old_CLIENTE AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CLIENTES_GIROS'
      '  (EMPRESA,CLIENTE,CODIGO_GIRO,ID_TIPO_GIRO,ID_CLIENTE,DEFECTO)'
      'VALUES'
      
        '  (?EMPRESA,?CLIENTE,?CODIGO_GIRO,?ID_TIPO_GIRO,?ID_CLIENTE,?DEF' +
        'ECTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  C.*, T.TITULO'
      'FROM EMP_CLIENTES_GIROS C'
      'JOIN SYS_TIPO_GIRO T'
      'ON C.CODIGO_GIRO = T.CODIGO'
      'WHERE'
      '  C.EMPRESA=?EMPRESA AND'
      '  C.CLIENTE=?CLIENTE AND '
      '  C.CODIGO_GIRO=?CODIGO_GIRO')
    SelectSQL.Strings = (
      'SELECT'
      '  C.*, T.TITULO'
      'FROM EMP_CLIENTES_GIROS C'
      'JOIN SYS_TIPO_GIRO T'
      'ON C.CODIGO_GIRO = T.CODIGO'
      'WHERE'
      '  C.EMPRESA=?EMPRESA AND'
      '  C.CLIENTE=?CLIENTE'
      'ORDER BY C.CODIGO_GIRO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CLIENTES_GIROS'
      'SET'
      '  ID_TIPO_GIRO=?ID_TIPO_GIRO '
      '  ,ID_CLIENTE=?ID_CLIENTE '
      '  ,DEFECTO=?DEFECTO '
      'WHERE'
      '  CODIGO_GIRO=?CODIGO_GIRO AND '
      '  CLIENTE=?CLIENTE AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMClientes
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_CLIENTES_CUENTAS CLI INDEX (EMP_CLIENTES_CL' +
        'I_TER),VER_CLIENTES_CUENTAS DI INDEX (PK_SYS_TERCEROS_DIRECCIONE' +
        'S),VER_CLIENTES_CUENTAS LOC INDEX (ID_LOCALIDADES),VER_CLIENTES_' +
        'CUENTAS GCLI INDEX (PK_CON_CUENTAS_GES_CLI),VER_CLIENTES_CUENTAS' +
        ' TER INDEX (PK_SYS_TERCEROS)))')
    AfterDelete = xTipoGiroAfterDelete
    AfterPost = xTipoGiroAfterPost
    OnNewRecord = xTipoGiroNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CLIENTE '
      'CODIGO_GIRO'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CLIENTES_GIROS'
    BloqOpt = True
    CamposBloqueo.Strings = (
      'EMPRESA,EJERCICIO,CANAL,CLIENTE'
      'EMPRESA,CLIENTE')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 288
    Top = 632
    object xTipoGiroEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTipoGiroCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xTipoGiroCODIGO_GIRO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO_GIRO'
    end
    object xTipoGiroDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
    object xTipoGiroTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 150
    end
  end
  object DSxTipoGiro: TDataSource
    DataSet = xTipoGiro
    Left = 376
    Top = 632
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
        'SAJE_PEC, ACTIVO_ALB, MENSAJE_ALB, ACTIVO_FAC, MENSAJE_FAC)'
      'VALUES ('
      
        #39'CLI'#39', :ID_OBJETO, :ACTIVO_OFC, :MENSAJE_OFC, :ACTIVO_PEC, :MENS' +
        'AJE_PEC, :ACTIVO_ALB, :MENSAJE_ALB, :ACTIVO_FAC, :MENSAJE_FAC)'
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
      'TIPO_OBJETO = '#39'CLI'#39' AND'
      'ID_OBJETO = :ID_CLIENTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OR INSERT INTO VER_EMP_AVISOS ('
      
        'TIPO_OBJETO, ID_OBJETO, ACTIVO_OFC, MENSAJE_OFC, ACTIVO_PEC, MEN' +
        'SAJE_PEC, ACTIVO_ALB, MENSAJE_ALB, ACTIVO_FAC, MENSAJE_FAC)'
      'VALUES ('
      
        #39'CLI'#39', :ID_OBJETO, :ACTIVO_OFC, :MENSAJE_OFC, :ACTIVO_PEC, :MENS' +
        'AJE_PEC, :ACTIVO_ALB, :MENSAJE_ALB, :ACTIVO_FAC, :MENSAJE_FAC)'
      'MATCHING (TIPO_OBJETO, ID_OBJETO)')
    DataSource = DSQMClientes
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
    Left = 480
    Top = 632
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
  object DSxAvisos: TDataSource
    DataSet = xAvisos
    Left = 584
    Top = 632
  end
  object TEstadistica: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 888
    Top = 104
  end
  object DSxVentasMargenes: TDataSource
    DataSet = xVentasMargenes
    Left = 376
    Top = 344
  end
  object xVentasMargenes: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    RefreshSQL.Strings = (
      'SELECT *'
      
        'FROM DAME_MARGEN_VENTA_CLIENTE(:EMPRESA, :SERIE, :CLIENTE, :TIPO' +
        ', :DESDE_FECHA, :HASTA_FECHA)'
      'WHERE ARTICULO = :ARTICULO')
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM DAME_MARGEN_VENTA_CLIENTE(:EMPRESA, :SERIE, :CLIENTE, :DOCT' +
        'IPO, :DESDE_FECHA, :HASTA_FECHA)'
      'ORDER BY ARTICULO')
    UniDirectional = False
    DataSource = DSQMClientes
    Opciones = []
    AutoSQLdeVistas = False
    Left = 288
    Top = 344
    object xVentasMargenesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVentasMargenesCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xVentasMargenesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xVentasMargenesTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object xVentasMargenesULTIMA_FECHA_DOC: TDateTimeField
      DisplayLabel = 'Fecha Ult. Alb.'
      FieldName = 'ULTIMA_FECHA_DOC'
    end
    object xVentasMargenesULTIMO_P_COSTE_DOC: TFloatField
      DisplayLabel = 'P. Coste Ult  Alb.'
      FieldName = 'ULTIMO_P_COSTE_DOC'
    end
    object xVentasMargenesULTIMO_PRECIO_DOC: TFloatField
      DisplayLabel = 'Precio Ult. Alb.'
      FieldName = 'ULTIMO_PRECIO_DOC'
    end
    object xVentasMargenesP_COSTE_ARTICULO: TFloatField
      DisplayLabel = 'P. Coste Art.'
      FieldName = 'P_COSTE_ARTICULO'
    end
    object xVentasMargenesMARGEN_P_COSTE_ART_B_IMP: TFloatField
      DisplayLabel = 'Margen CosteArt-B.Imp'
      FieldName = 'MARGEN_P_COSTE_ART_B_IMP'
    end
    object xVentasMargenesMARGEN_P_COSTE_ART_PRECIO: TFloatField
      DisplayLabel = 'Margen CosteArt-PrecUnit'
      FieldName = 'MARGEN_P_COSTE_ART_PRECIO'
    end
    object xVentasMargenesMARGEN_P_COSTE_DOC_PRECIO: TFloatField
      DisplayLabel = 'Margen CosteDoc-PrecUnit'
      FieldName = 'MARGEN_P_COSTE_DOC_PRECIO'
    end
    object xVentasMargenesMARGEN_P_COSTE_DOC_B_IMP: TFloatField
      DisplayLabel = 'Margen CosteDoc-B.Imp'
      FieldName = 'MARGEN_P_COSTE_DOC_B_IMP'
    end
    object xVentasMargenesALFA_1: TFIBStringField
      DisplayLabel = 'Alfa 1'
      FieldName = 'ALFA_1'
      Size = 40
    end
    object xVentasMargenesALFA_2: TFIBStringField
      DisplayLabel = 'Alfa 2'
      FieldName = 'ALFA_2'
      Size = 40
    end
    object xVentasMargenesALFA_3: TFIBStringField
      DisplayLabel = 'Alfa 3'
      FieldName = 'ALFA_3'
      Size = 40
    end
    object xVentasMargenesALFA_4: TFIBStringField
      DisplayLabel = 'Alfa 4'
      FieldName = 'ALFA_4'
      Size = 40
    end
    object xVentasMargenesALFA_5: TFIBStringField
      DisplayLabel = 'Alfa 5'
      FieldName = 'ALFA_5'
      Size = 40
    end
    object xVentasMargenesALFA_6: TFIBStringField
      DisplayLabel = 'Alfa 6'
      FieldName = 'ALFA_6'
      Size = 40
    end
    object xVentasMargenesALFA_7: TFIBStringField
      DisplayLabel = 'Alfa 7'
      FieldName = 'ALFA_7'
      Size = 40
    end
    object xVentasMargenesALFA_8: TFIBStringField
      DisplayLabel = 'Alfa 8'
      FieldName = 'ALFA_8'
      Size = 40
    end
    object xVentasMargenesMARGEN_V_P_COSTE_ART_PRECIO: TFloatField
      DisplayLabel = 'Marg.V. CosteArt-PrecUnit'
      FieldName = 'MARGEN_V_P_COSTE_ART_PRECIO'
    end
    object xVentasMargenesMARGEN_V_P_COSTE_ART_B_IMP: TFloatField
      DisplayLabel = 'Marg.V. CosteArt-B.Imp'
      FieldName = 'MARGEN_V_P_COSTE_ART_B_IMP'
    end
    object xVentasMargenesMARGEN_V_P_COSTE_DOC_PRECIO: TFloatField
      DisplayLabel = 'Marg.V. CosteDoc-PrecUnit'
      FieldName = 'MARGEN_V_P_COSTE_DOC_PRECIO'
    end
    object xVentasMargenesMARGEN_V_P_COSTE_DOC_B_IMP: TFloatField
      DisplayLabel = 'Marg.V. CosteDoc-B.Imp'
      FieldName = 'MARGEN_V_P_COSTE_DOC_B_IMP'
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
      'EMPRESA=?EMPRESA AND '
      'CLIENTE=?CLIENTE'
      'ORDER BY ARTICULO')
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
    DataSource = DSQMClientes
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
    Left = 704
    Top = 8
    object QMCliArtEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCliArtARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = QMCliArtARTICULOChange
      Size = 15
    end
    object QMCliArtCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
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
    Left = 808
    Top = 8
  end
  object QMRedesSociales: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_TERCEROS_REDES_SOCIALES'
      'WHERE'
      '  TERCERO=?old_TERCERO AND '
      '  ROL=?old_ROL AND '
      '  ID_RED_SOCIAL=?old_ID_RED_SOCIAL ')
    InsertSQL.Strings = (
      'INSERT INTO VER_TERCEROS_REDES_SOCIALES'
      
        '  (TERCERO,'#13#10'ROL,ID_RED_SOCIAL,NOMBRE,HANDLE,URL_BASE,RED_SOCIAL' +
        '_ACTIVA,URL)'
      'VALUES'
      
        '  (?TERCERO,'#13#10'?ROL,?ID_RED_SOCIAL,?NOMBRE,?HANDLE,?URL_BASE,?RED' +
        '_SOCIAL_ACTIVA,?URL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_TERCEROS_REDES_SOCIALES'
      'WHERE'
      '  TERCERO=?TERCERO AND '
      '  ROL=?ROL AND '
      '  ID_RED_SOCIAL=?ID_RED_SOCIAL ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_REDES_SOCIALES '
      'WHERE '
      'TERCERO = :TERCERO AND '
      'ROL = '#39'CLI'#39
      'ORDER BY NOMBRE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_TERCEROS_REDES_SOCIALES'
      'SET'
      '  NOMBRE=?NOMBRE '
      '  ,HANDLE=?HANDLE '
      '  ,URL_BASE=?URL_BASE '
      '  ,RED_SOCIAL_ACTIVA=?RED_SOCIAL_ACTIVA '
      '  ,URL=?URL '
      'WHERE'
      '  TERCERO=?TERCERO AND '
      '  ROL=?ROL AND '
      '  ID_RED_SOCIAL=?ID_RED_SOCIAL ')
    DataSource = DSQMClientes
    OnNewRecord = QMRedesSocialesNewRecord
    ClavesPrimarias.Strings = (
      'TERCERO '
      'ROL '
      'ID_RED_SOCIAL ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_TERCEROS_REDES_SOCIALES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 344
    object QMRedesSocialesTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMRedesSocialesID_RED_SOCIAL: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_RED_SOCIAL'
      OnChange = QMRedesSocialesID_RED_SOCIALChange
    end
    object QMRedesSocialesNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 40
    end
    object QMRedesSocialesURL_BASE: TFIBStringField
      DisplayLabel = 'URL Base'
      FieldName = 'URL_BASE'
      Size = 256
    end
    object QMRedesSocialesROL: TFIBStringField
      DisplayLabel = 'Rol'
      FieldName = 'ROL'
      Size = 3
    end
    object QMRedesSocialesRED_SOCIAL_ACTIVA: TIntegerField
      DisplayLabel = 'Red Social Activa'
      FieldName = 'RED_SOCIAL_ACTIVA'
    end
    object QMRedesSocialesURL: TFIBStringField
      FieldName = 'URL'
      Size = 256
    end
    object QMRedesSocialesHANDLE: TFIBStringField
      DisplayLabel = 'Handle'
      FieldName = 'HANDLE'
      Size = 256
    end
  end
  object DSQMRedesSociales: TDataSource
    DataSet = QMRedesSociales
    Left = 160
    Top = 344
  end
end
