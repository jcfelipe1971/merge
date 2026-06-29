object DMClientesPotencialesKri: TDMClientesPotencialesKri
  OldCreateOrder = False
  OnCreate = DMClientesPotencialesKriCreate
  OnDestroy = DMClientesPotencialesKriDestroy
  Left = 343
  Top = 172
  Height = 612
  Width = 707
  object QMClientes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CLIENTES_POTENCIALES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CLIENTE=?old_CLIENTE ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CLIENTES_POTENCIALES'
      
        '  (EMPRESA,CLIENTE,TERCERO,TARIFA,DIA_PAGO_1,DIA_PAGO_2,DESCUENT' +
        'O_PP,DESCUENTO_CIAL,AGENTE,NOTAS,TITULO,PAIS,TIPO,PORTES,NOMBRE_' +
        'COMERCIAL,USAR_ANTICIPOS,SU_PROVEEDOR,EVAL_FEB,EVAL_FEB_SI,MONED' +
        'A,FINANCIACION,TRANSPORTISTA,POR_FINANCIACION,SU_REFERENCIA,CRED' +
        'ITO_Y_CAUCION,NRO_EMPLEADOS,FACTURACION_TOTAL,CONSUMO_MATERIAL,P' +
        'ROVEEDORES_HABITUALES,RUTA,TIPO_CLIENTE,POTENCIAL_DE_COMPRA,INTR' +
        'A,INTRA_TRANS,PAIS_C2,TIT_LOCALIDAD,CODIGO_POSTAL,DIAS_ENTREGA,I' +
        'DIOMA,APLICAR_PTO_VERDE,COD_CREDITO_Y_CAUCION,FRECUENCIA,FORMA_P' +
        'AGO)'
      'VALUES'
      
        '  (?EMPRESA,?CLIENTE,?TERCERO,?TARIFA,?DIA_PAGO_1,?DIA_PAGO_2,?D' +
        'ESCUENTO_PP,?DESCUENTO_CIAL,?AGENTE,?NOTAS,?TITULO,?PAIS,?TIPO,?' +
        'PORTES,?NOMBRE_COMERCIAL,?USAR_ANTICIPOS,?SU_PROVEEDOR,?EVAL_FEB' +
        ',?EVAL_FEB_SI,?MONEDA,?FINANCIACION,?TRANSPORTISTA,?POR_FINANCIA' +
        'CION,?SU_REFERENCIA,?CREDITO_Y_CAUCION,?NRO_EMPLEADOS,?FACTURACI' +
        'ON_TOTAL,?CONSUMO_MATERIAL,?PROVEEDORES_HABITUALES,?RUTA,?TIPO_C' +
        'LIENTE,?POTENCIAL_DE_COMPRA,?INTRA,?INTRA_TRANS,?PAIS_C2,?TIT_LO' +
        'CALIDAD,?CODIGO_POSTAL,?DIAS_ENTREGA,?IDIOMA,?APLICAR_PTO_VERDE,' +
        '?COD_CREDITO_Y_CAUCION,?FRECUENCIA,?FORMA_PAGO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CLIENTES_POTENCIALES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CLIENTE=?CLIENTE ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES_POTENCIALES'
      'WHERE EMPRESA=?EMPRESA '
      'ORDER BY EMPRESA, CLIENTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CLIENTES_POTENCIALES'
      'SET'
      '  TERCERO=?TERCERO '
      '  ,TARIFA=?TARIFA '
      '  ,DIA_PAGO_1=?DIA_PAGO_1 '
      '  ,DIA_PAGO_2=?DIA_PAGO_2 '
      '  ,DESCUENTO_PP=?DESCUENTO_PP '
      '  ,DESCUENTO_CIAL=?DESCUENTO_CIAL '
      '  ,AGENTE=?AGENTE '
      '  ,NOTAS=?NOTAS '
      '  ,TITULO=?TITULO '
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
      '  ,TRANSPORTISTA=?TRANSPORTISTA '
      '  ,POR_FINANCIACION=?POR_FINANCIACION '
      '  ,SU_REFERENCIA=?SU_REFERENCIA '
      '  ,CREDITO_Y_CAUCION=?CREDITO_Y_CAUCION '
      '  ,NRO_EMPLEADOS=?NRO_EMPLEADOS '
      '  ,FACTURACION_TOTAL=?FACTURACION_TOTAL '
      '  ,CONSUMO_MATERIAL=?CONSUMO_MATERIAL '
      '  ,PROVEEDORES_HABITUALES=?PROVEEDORES_HABITUALES '
      '  ,RUTA=?RUTA '
      '  ,TIPO_CLIENTE=?TIPO_CLIENTE '
      '  ,POTENCIAL_DE_COMPRA=?POTENCIAL_DE_COMPRA '
      '  ,INTRA=?INTRA '
      '  ,INTRA_TRANS=?INTRA_TRANS '
      '  ,PAIS_C2=?PAIS_C2 '
      '  ,TIT_LOCALIDAD=?TIT_LOCALIDAD '
      '  ,CODIGO_POSTAL=?CODIGO_POSTAL '
      '  ,DIAS_ENTREGA=?DIAS_ENTREGA '
      '  ,IDIOMA=?IDIOMA '
      '  ,APLICAR_PTO_VERDE=?APLICAR_PTO_VERDE '
      '  ,COD_CREDITO_Y_CAUCION=?COD_CREDITO_Y_CAUCION '
      '  ,FRECUENCIA=?FRECUENCIA '
      '  ,FORMA_PAGO=?FORMA_PAGO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CLIENTE=?CLIENTE ')
    AfterDelete = Graba
    AfterOpen = QMClientesAfterOpen
    AfterPost = Graba
    BeforeEdit = QMClientesBeforeEdit
    BeforePost = QMClientesBeforePost
    OnNewRecord = QMClientesNewRecord
    OnPostError = QMClientesPostError
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CLIENTE ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CLIENTES_POTENCIALES'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'EMP_CLIENTES_POTENCIALES')
    CamposBloqueo.Strings = (
      'EMPRESA,CLIENTE')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 30
    object QMClientesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
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
      OnChange = QMClientesTARIFAChange
      Size = 3
    end
    object QMClientesFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      OnChange = QMClientesFORMA_PAGOChange
      Size = 3
    end
    object QMClientesDIA_PAGO_1: TIntegerField
      DisplayLabel = 'D'#237'a Pago 1'
      FieldName = 'DIA_PAGO_1'
    end
    object QMClientesDIA_PAGO_2: TIntegerField
      DisplayLabel = 'D'#237'a Pago 2'
      FieldName = 'DIA_PAGO_2'
    end
    object QMClientesDESCUENTO_PP: TFloatField
      DisplayLabel = 'Desc. P.P.'
      FieldName = 'DESCUENTO_PP'
    end
    object QMClientesDESCUENTO_CIAL: TFloatField
      DisplayLabel = 'Desc. Cial.'
      FieldName = 'DESCUENTO_CIAL'
    end
    object QMClientesAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
      OnChange = QMClientesAGENTEChange
    end
    object QMClientesNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMClientesTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMClientesPAIS: TFIBStringField
      DisplayLabel = 'Pa'#237's'
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
      DisplayLabel = 'Nombre Comercial'
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
      DisplayLabel = 'Eval Feb.'
      FieldName = 'EVAL_FEB'
    end
    object QMClientesEVAL_FEB_SI: TIntegerField
      DisplayLabel = 'Eval Feb. Si'
      FieldName = 'EVAL_FEB_SI'
    end
    object QMClientesMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      OnChange = QMClientesMONEDAChange
      Size = 3
    end
    object QMClientesFINANCIACION: TIntegerField
      DisplayLabel = 'Financ.'
      FieldName = 'FINANCIACION'
    end
    object QMClientesPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object QMClientesTRANSPORTISTA: TIntegerField
      DisplayLabel = 'Transp.'
      FieldName = 'TRANSPORTISTA'
    end
    object QMClientesSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object QMClientesCREDITO_Y_CAUCION: TIntegerField
      DisplayLabel = 'Cred. y Cauci'#243'n'
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
    end
    object QMClientesTIPO_CLIENTE: TFIBStringField
      DisplayLabel = 'Tipo Cli.'
      FieldName = 'TIPO_CLIENTE'
      Size = 25
    end
    object QMClientesPOTENCIAL_DE_COMPRA: TFloatField
      DisplayLabel = 'Pot. de Compra'
      FieldName = 'POTENCIAL_DE_COMPRA'
    end
    object QMClientesINTRA: TIntegerField
      DisplayLabel = 'Intra'
      FieldName = 'INTRA'
    end
    object QMClientesINTRA_TRANS: TIntegerField
      DisplayLabel = 'Intra Trans.'
      FieldName = 'INTRA_TRANS'
      OnChange = QMClientesINTRA_TRANSChange
    end
    object QMClientesPAIS_C2: TFIBStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'PAIS_C2'
      OnChange = QMClientesPAIS_C2Change
      Size = 2
    end
    object QMClientesTIT_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'TIT_LOCALIDAD'
      Size = 40
    end
    object QMClientesCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'C'#243'd. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object QMClientesDIAS_ENTREGA: TIntegerField
      DisplayLabel = 'D'#237'as Entrega'
      FieldName = 'DIAS_ENTREGA'
    end
    object QMClientesIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      OnChange = QMClientesIDIOMAChange
      Size = 3
    end
    object QMClientesAPLICAR_PTO_VERDE: TIntegerField
      DisplayLabel = 'Aplic. Pto. Verde'
      FieldName = 'APLICAR_PTO_VERDE'
    end
    object QMClientesCOD_CREDITO_Y_CAUCION: TIntegerField
      DisplayLabel = 'C'#243'd. Cred. y Cauci'#243'n'
      FieldName = 'COD_CREDITO_Y_CAUCION'
    end
    object QMClientesFRECUENCIA: TIntegerField
      DisplayLabel = 'Frecuencia'
      FieldName = 'FRECUENCIA'
    end
  end
  object DSQMClientes: TDataSource
    DataSet = QMClientes
    Left = 130
    Top = 28
  end
  object DSxTerceros: TDataSource
    DataSet = xTerceros
    Left = 214
    Top = 85
  end
  object DSxAgentes: TDataSource
    DataSet = xAgentes
    Left = 214
    Top = 136
  end
  object DSxFormasPago: TDataSource
    DataSet = xFormasPago
    Left = 369
    Top = 192
  end
  object DSxTarifas: TDataSource
    DataSet = xTarifas
    Left = 369
    Top = 244
  end
  object DSxTipoTercero: TDataSource
    DataSet = xTipoTercero
    Left = 214
    Top = 244
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 544
    Top = 32
  end
  object xTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT NOMBRE_R_SOCIAL FROM VER_TERCEROS'
      'where tercero=?tercero')
    UniDirectional = False
    DataSource = DSQMClientes
    Plan.Strings = (
      
        'PLAN JOIN (VER_TERCEROS DI INDEX (PK_SYS_TERCEROS_DIRECCIONES),V' +
        'ER_TERCEROS TE INDEX (PK_SYS_TERCEROS))')
    Left = 130
    Top = 85
    object xTercerosNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object xAgentes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_AGENTES  '
      'where empresa=?empresa and agente=?agente                  ')
    UniDirectional = False
    DataSource = DSQMClientes
    Plan.Strings = (
      
        'PLAN JOIN (VER_AGENTES EA INDEX (PK_EMP_AGENTES),VER_AGENTES ST ' +
        'INDEX (PK_SYS_TERCEROS))')
    Left = 130
    Top = 136
    object xAgentesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xTipoTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPOS_TERCERO'
      'WHERE TIPO=?TIPO')
    UniDirectional = False
    DataSource = DSQMClientes
    Left = 130
    Top = 244
    object xTipoTerceroTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 25
    end
  end
  object xFormasPago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO,FORMA_PAGO FROM CON_CUENTAS_GES_FP'
      'where empresa=?empresa and'
      '          ejercicio=?ejercicio and'
      '          canal=?canal and forma_pago=?forma_pago')
    UniDirectional = False
    DataSource = DSQMClientes
    Left = 291
    Top = 192
    object xFormasPagoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xFormasPagoFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
  end
  object xTarifas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TARIFA,TITULO FROM ART_TARIFAS_C                  '
      'where empresa=?empresa and tarifa=?tarifa'
      'order by tarifa')
    UniDirectional = False
    DataSource = DSQMClientes
    Left = 291
    Top = 244
  end
  object xMoneda: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    DataSource = DSQMClientes
    Left = 291
    Top = 360
    object xMonedaMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xMonedaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xMonedaSIGNO_MONEDA: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO_MONEDA'
      Size = 3
    end
    object xMonedaDEC_VER: TIntegerField
      DisplayLabel = 'Dec. Ver'
      FieldName = 'DEC_VER'
    end
    object xMonedaDEC_CALCULOS: TIntegerField
      DisplayLabel = 'D. Calc.'
      FieldName = 'DEC_CALCULOS'
    end
    object xMonedaDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
  end
  object DSxMoneda: TDataSource
    DataSet = xMoneda
    Left = 369
    Top = 360
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
    Left = 67
    Top = 138
  end
  object QTransportista: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(TRANSPORTISTA) AS MINIMO  FROM VER_TRANSPORTISTAS'
      'WHERE EMPRESA = ?EMPRESA')
    Transaction = TLocal
    Plan.Strings = (
      
        'PLAN JOIN (VER_TRANSPORTISTAS EA INDEX (RDB$FOREIGN_F6E842EED),V' +
        'ER_TRANSPORTISTAS ST INDEX (PK_SYS_TERCEROS))')
    AutoTrans = True
    Left = 481
    Top = 366
  end
  object xBuscoMaxCte: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(cliente) from emp_clientes'
      'where empresa=?empresa and'
      'cliente < ?cliente ')
    Transaction = TLocal
    Left = 40
    Top = 232
  end
  object DSQMClientes2: TDataSource
    DataSet = QMClientes
    Left = 176
    Top = 40
  end
  object xTipoTrans: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * '
      'from SYS_TIPOS_TRANSPORTE'
      'where tipo=?intra_trans')
    UniDirectional = False
    DataSource = DSQMClientes
    Left = 293
    Top = 420
    object xTipoTransTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object xTipoTransTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxTipoTrans: TDataSource
    DataSet = xTipoTrans
    Left = 371
    Top = 420
  end
  object xPais: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * '
      'from SYS_PAISES'
      'where PAIS_C2=?PAIS_C2')
    UniDirectional = False
    DataSource = DSQMClientes
    Left = 293
    Top = 478
    object xPaisPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xPaisTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xPaisPAIS_C2: TFIBStringField
      DisplayLabel = 'Pais C2'
      FieldName = 'PAIS_C2'
      Size = 2
    end
    object xPaisPAIS_N3: TFIBStringField
      DisplayLabel = 'Pais N3'
      FieldName = 'PAIS_N3'
      Size = 3
    end
    object xPaisCODIGO_TEL: TFIBStringField
      DisplayLabel = 'Cod. Tel.'
      FieldName = 'CODIGO_TEL'
      Size = 4
    end
    object xPaisIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
  end
  object DSxPais: TDataSource
    DataSet = xPais
    Left = 371
    Top = 478
  end
  object QPaisTercero: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select pa.pais_c2'
      'from sys_terceros_direcciones di'
      'join sys_localidades loc on (di.id_local = loc.id_local)'
      'join sys_paises pa on (pa.pais = loc.pais)'
      'where ((di.tercero = ?tercero)and(di.dir_defecto = 1))')
    Transaction = TLocal
    AutoTrans = True
    Left = 605
    Top = 422
  end
  object xCuentas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM CON_CUENTAS'
      'WHERE EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'CUENTA = ?CUENTA_DTOPP')
    UniDirectional = False
    DataSource = DSQMClientes
    Left = 32
    Top = 493
  end
  object DSxCuentas: TDataSource
    DataSet = xCuentas
    Left = 104
    Top = 493
  end
  object xIdiomas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from sys_idiomas'
      'where idioma = ?idioma')
    UniDirectional = False
    DataSource = DSQMClientes
    Left = 288
    Top = 32
    object xIdiomasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxIdiomas: TDataSource
    DataSet = xIdiomas
    Left = 370
    Top = 28
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
      'TIPO_TERCERO = '#39'POT'#39
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
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_INCIDENCIAS'
    UpdateTransaction = TLocal
    Left = 292
    Top = 530
    object xIncidenciasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xIncidenciasINCIDENCIA: TIntegerField
      DisplayLabel = 'Incidencia'
      FieldName = 'INCIDENCIA'
    end
    object xIncidenciasTITULO_INCIDENCIA: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
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
      DisplayLabel = 'Tipo Terc.'
      FieldName = 'TIPO_TERCERO'
      Size = 3
    end
    object xIncidenciasCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'C'#243'd. Cli./Prov.'
      FieldName = 'COD_CLI_PRO'
    end
    object xIncidenciasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xIncidenciasTITULO_TERCERO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_TERCERO'
      Size = 60
    end
    object xIncidenciasDATOS_INCIDENCIA: TBlobField
      DisplayLabel = 'Datos Inc.'
      FieldName = 'DATOS_INCIDENCIA'
      Size = 8
    end
    object xIncidenciasFECHA_RESPUESTA: TDateTimeField
      DisplayLabel = 'Fecha Resp.'
      FieldName = 'FECHA_RESPUESTA'
    end
    object xIncidenciasRESPUESTA_INCIDENCIA: TBlobField
      DisplayLabel = 'Respuesta'
      FieldName = 'RESPUESTA_INCIDENCIA'
      Size = 8
    end
    object xIncidenciasID_S: TIntegerField
      DisplayLabel = 'ID S'
      FieldName = 'ID_S'
    end
    object xIncidenciasID_E: TIntegerField
      DisplayLabel = 'ID E'
      FieldName = 'ID_E'
    end
    object xIncidenciasDOC_EJERCICIO: TIntegerField
      DisplayLabel = 'Ejer. Doc.'
      FieldName = 'DOC_EJERCICIO'
    end
    object xIncidenciasDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xIncidenciasDOC_CANAL: TIntegerField
      DisplayLabel = 'Canal Doc.'
      FieldName = 'DOC_CANAL'
    end
    object xIncidenciasDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xIncidenciasDOC_RIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_RIG'
    end
    object xIncidenciasENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
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
      DisplayLabel = 'Age'
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
      DisplayLabel = 'Usu.'
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
    Left = 372
    Top = 531
  end
  object xAgrupSon: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT AGRUPACION,TITULO FROM VER_AGRUPACIONES_POT'
      'where empresa=?empresa and cliente=?cliente'
      'order by agrupacion')
    UniDirectional = False
    DataSource = DSQMClientes
    Plan.Strings = (
      
        'PLAN JOIN (VER_AGRUPACIONES_CLI C ORDER PK_EMP_AGRUPACIONES_CLI,' +
        'VER_AGRUPACIONES_CLI A INDEX (PK_SYS_AGRUPACIONES))')
    Left = 131
    Top = 357
  end
  object DSxAgrupSon: TDataSource
    DataSet = xAgrupSon
    Left = 213
    Top = 357
  end
  object xAgrupDisp: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO,AGRUPACION FROM VER_AGRUPACIONES'
      'where tipo='#39'C'#39' and '
      
        'agrupacion not in (select agrupacion from emp_agrupaciones_pot w' +
        'here empresa=?empresa and cliente =?cliente)'
      'order by agrupacion')
    UniDirectional = False
    DataSource = DSQMClientes
    Plan.Strings = (
      
        'PLAN (VER_AGRUPACIONES SYS_AGRUPACIONES ORDER PK_SYS_AGRUPACIONE' +
        'S)')
    Left = 130
    Top = 304
  end
  object DSxAgrupDisp: TDataSource
    DataSet = xAgrupDisp
    Left = 214
    Top = 304
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 592
    Top = 32
  end
end
