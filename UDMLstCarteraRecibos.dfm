object DMLstCarteraRecibos: TDMLstCarteraRecibos
  OldCreateOrder = False
  OnCreate = DMLstCarteraRecibosCreate
  OnDestroy = DMLstCarteraRecibosDestroy
  Left = 462
  Top = 175
  Height = 721
  Width = 708
  object frRecibos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frRecibosGetValue
    OnBeforePrint = frRecibosEnterRect
    OnEnterRect = frRecibosEnterRect
    OnPrintReport = frRecibosPrintReport
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 224
    Top = 8
    ReportForm = {19000000}
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 640
    Top = 8
  end
  object xDirecCli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_DIRECCION'
      'where tercero=?tercero')
    UniDirectional = False
    DataSource = DSxCli
    AfterOpen = xDirecCliAfterOpen
    Left = 32
    Top = 344
  end
  object xCli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT '
      
        'empresa,ejercicio,canal,cliente,tercero,titulo,nif,descuento_pp,' +
        ' '
      
        'modo_iva,forma_pago,moneda,nombre_comercial,riesgo_aut,riesgo_ac' +
        't, '
      'agente,tarifa,descuento_cial,su_proveedor '
      'FROM VER_CLIENTES'
      'where empresa=?empresa and ejercicio=?ejercicio and '
      '          canal=?canal and cliente=?cod_cli_pro and '#39'C'#39' = ?signo'
      'union'
      'SELECT '
      
        'empresa,ejercicio,canal,proveedor as cliente,tercero,titulo,nif,' +
        ' '
      
        'descuento_pp,modo_iva,forma_pago,moneda,titulo as nombre_comerci' +
        'al, '
      
        'cast(0 as double precision) as riesgo_aut,cast(0 as double preci' +
        'sion) as riesgo_act,cast(0 as integer) as agente,cast('#39'   '#39' as v' +
        'archar(3)) as tarifa,cast(0 as numeric(4,2)) as descuento_cial, '
      'cast('#39#39' as varchar(40)) as su_proveedor '
      'FROM VER_PROVEEDORES'
      'where empresa=?empresa and ejercicio=?ejercicio and '
      
        '          canal=?canal and proveedor=?cod_cli_pro and '#39'P'#39' = ?sig' +
        'no and'
      '          '#39'FCR'#39' <> ?doc_tipo'
      'union'
      'SELECT '
      'empresa,ejercicio,canal,acreedor as cliente,tercero,titulo,nif, '
      
        'descuento_pp,modo_iva,forma_pago,moneda,titulo as nombre_comerci' +
        'al,'
      
        'cast(0 as double precision) as riesgo_aut,cast(0 as double preci' +
        'sion) as riesgo_act,cast(0 as integer) as agente,cast('#39'   '#39' as v' +
        'archar(3)) as tarifa,cast(0 as numeric(4,2)) as descuento_cial,'
      'cast('#39#39' as varchar(40)) as su_proveedor '
      'FROM VER_ACREEDORES'
      'where empresa=?empresa and ejercicio=?ejercicio and '
      
        '          canal=?canal and acreedor=?cod_cli_pro and '#39'P'#39' = ?sign' +
        'o and'
      '          '#39'FCR'#39' = ?doc_tipo')
    UniDirectional = False
    DataSource = DSxRecibos
    AfterOpen = xCliAfterOpen
    Left = 32
    Top = 200
  end
  object DSxDirecCli: TDataSource
    DataSet = xDirecCli
    Left = 128
    Top = 344
  end
  object DSxCli: TDataSource
    DataSet = xCli
    Left = 128
    Top = 200
  end
  object xLoc_T: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_LOCALIDADES'
      'where localidad = ?localidad')
    UniDirectional = False
    DataSource = DSxDirecCli
    Left = 32
    Top = 392
  end
  object DSxLoc_T: TDataSource
    DataSet = xLoc_T
    Left = 128
    Top = 392
  end
  object xTipoEfecto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_EFECTO'
      'WHERE TIPO=?TIPO_EFECTO')
    UniDirectional = False
    DataSource = DSxRecibos
    Left = 440
    Top = 152
  end
  object xClienteRecibo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT EMPRESA, EJERCICIO, CANAL, CLIENTE, TERCERO, TITULO, CUEN' +
        'TA, DESCUENTO_PP, MODO_IVA, FORMA_PAGO, MONEDA, TARIFA,'
      
        '       RIESGO_AUT, RIESGO_ACT, DIA_PAGO_1, DIA_PAGO_2, DIA_PAGO_' +
        '3, DESCUENTO_CIAL, AGENTE, NOTAS, NOMBRE_COMERCIAL,'
      '       PERFIL, TIPO_IRPF, TIPO, PORTES, SU_PROVEEDOR, PAIS'
      'FROM VER_CLIENTES_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'CLIENTE = :COD_CLI_PRO AND'
      #39'C'#39' = :SIGNO'
      ''
      'UNION'
      ''
      
        'SELECT EMPRESA, EJERCICIO, CANAL, PROVEEDOR AS CLIENTE, TERCERO,' +
        ' TITULO, CUENTA, DESCUENTO_PP, MODO_IVA, FORMA_PAGO,'
      
        '       MONEDA, CAST('#39'   '#39' AS VARCHAR(3)) AS TARIFA, CAST(0 AS DO' +
        'UBLE PRECISION) AS RIESGO_AUT,'
      
        '       CAST(0 AS DOUBLE PRECISION) AS RIESGO_ACT, DIA_PAGO_1, DI' +
        'A_PAGO_2, DIA_PAGO_3,'
      
        '       CAST(0 AS NUMERIC(4,2)) AS DESCUENTO_CIAL, CAST(0 AS INTE' +
        'GER) AS AGENTE, NOTAS,'
      
        '       CAST('#39#39' AS VARCHAR(60)) AS NOMBRE_COMERCIAL, CAST('#39'    '#39' ' +
        'AS VARCHAR(4)) AS PERFIL,'
      
        '       CAST(0 AS SMALLINT) AS TIPO_IRPF, CAST(0 AS SMALLINT) AS ' +
        'TIPO, CAST(0 AS SMALLINT) AS PORTES,'
      '       CAST('#39#39' AS VARCHAR(40)) AS SU_PROVEEDOR, PAIS'
      'FROM VER_PROVEEDORES_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'PROVEEDOR = :COD_CLI_PRO AND'
      #39'P'#39' = :SIGNO AND'
      #39'FCR'#39' <> :DOC_TIPO'
      ''
      'UNION'
      ''
      
        'SELECT EMPRESA, EJERCICIO, CANAL, ACREEDOR AS CLIENTE, TERCERO, ' +
        'TITULO, CUENTA, DESCUENTO_PP, MODO_IVA, FORMA_PAGO,'
      
        '       MONEDA, CAST('#39'   '#39' AS VARCHAR(3)) AS TARIFA, CAST(0 AS DO' +
        'UBLE PRECISION) AS RIESGO_AUT,'
      
        '       CAST(0 AS DOUBLE PRECISION) AS RIESGO_ACT, DIA_PAGO_1, DI' +
        'A_PAGO_2, DIA_PAGO_3,'
      
        '       CAST(0 AS NUMERIC(4,2)) AS DESCUENTO_CIAL, CAST(0 AS INTE' +
        'GER) AS AGENTE, NOTAS,'
      
        '       CAST('#39#39' AS VARCHAR(60)) AS NOMBRE_COMERCIAL, CAST('#39'    '#39' ' +
        'AS VARCHAR(4)) AS PERFIL,'
      
        '       CAST(0 AS SMALLINT) AS TIPO_IRPF, CAST(0 AS SMALLINT) AS ' +
        'TIPO, CAST(0 AS SMALLINT) AS PORTES,'
      '       CAST('#39#39' AS VARCHAR(40)) AS SU_PROVEEDOR, PAIS'
      'FROM VER_ACREEDORES_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'ACREEDOR = :COD_CLI_PRO AND'
      #39'P'#39' = :SIGNO AND'
      #39'FCR'#39' = :DOC_TIPO')
    UniDirectional = False
    DataSource = DSxRecibos
    Left = 440
    Top = 200
  end
  object xLocalidadEmpresa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_LOCALIDADES'
      'WHERE LOCALIDAD=?DIR_LOCALIDAD')
    UniDirectional = False
    DataSource = DSxTerceroEmpresa
    Left = 32
    Top = 296
  end
  object DSxTipoEfecto: TDataSource
    DataSet = xTipoEfecto
    Left = 568
    Top = 152
  end
  object DSxClienteRecibo: TDataSource
    DataSet = xClienteRecibo
    Left = 568
    Top = 200
  end
  object DSxLocalidadEmpresa: TDataSource
    DataSet = xLocalidadEmpresa
    Left = 128
    Top = 296
  end
  object xTerceroEmpresa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_EDICION'
      'WHERE TERCERO=?TERCERO')
    UniDirectional = False
    DataSource = DSxCli
    AfterOpen = xTerceroEmpresaAfterOpen
    Left = 440
    Top = 104
  end
  object DSxTerceroEmpresa: TDataSource
    DataSet = xTerceroEmpresa
    Left = 568
    Top = 104
  end
  object xRecibos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_RECIBOS_CARTERA')
    UniDirectional = False
    AfterOpen = xRecibosAfterOpen
    Left = 32
    Top = 56
  end
  object DSxRecibos: TDataSource
    DataSet = xRecibos
    Left = 128
    Top = 56
  end
  object frDBxRecibos: TfrDBDataSet
    DataSource = DSxRecibos
    Left = 224
    Top = 56
  end
  object xBancoCliRe: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT EC.EMPRESA, CU.EJERCICIO, CU.CANAL, EC.CLIENTE, EC.TERCER' +
        'O, ST.NOMBRE_R_SOCIAL AS TITULO, ST.NIF, EC.RIESGO_AUT,'
      
        '       EC.RIESGO_ACT, EC.AGENTE, EC.TARIFA, EC.DESCUENTO_PP, CU.' +
        'FORMA_PAGO, CU.MODO_IVA, BAN.BANCO,'
      
        '       BAN.TITULO AS TITULAR, BAN.ENTIDAD, BAN.SUCURSAL, BAN.CON' +
        'TROL, BAN.CUENTA, BAN.ORDEN, BAN.IBAN, BAN.BIC, BAN.PAIS'
      'FROM EMP_CLIENTES EC'
      'JOIN SYS_TERCEROS ST ON (EC.TERCERO = ST.TERCERO)'
      
        'JOIN CON_CUENTAS_GES_CLI CU ON ((EC.CLIENTE = CU.CLIENTE) AND (E' +
        'C.EMPRESA = CU.EMPRESA))'
      'LEFT JOIN SYS_TERCEROS_BANCOS BAN ON (ST.TERCERO = BAN.TERCERO)'
      'WHERE'
      'EC.EMPRESA = :EMPRESA AND'
      '/* CU.EJERCICIO=:EJERCICIO_CARTERA AND */'
      'CU.EJERCICIO = :EJERCICIO AND'
      'CU.CANAL = :CANAL AND'
      'EC.CLIENTE = :COD_CLI_PRO AND'
      'BAN.ACTIVA = 1'
      'ORDER BY BAN.ORDEN')
    UniDirectional = False
    DataSource = DSxRecibos
    AfterOpen = xBancoCliReAfterOpen
    Left = 440
    Top = 8
  end
  object DSxBancoCliRe: TDataSource
    DataSet = xBancoCliRe
    Left = 568
    Top = 8
  end
  object DSxBancosRe: TDataSource
    DataSet = xBancosRe
    Left = 128
    Top = 536
  end
  object xBancosRe: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SYS_BANCOS'
      'WHERE'
      'PAIS = :PAIS AND'
      'ENTIDAD = :ENTIDAD   ')
    UniDirectional = False
    DataSource = DSxBancoCliRe
    Left = 32
    Top = 536
  end
  object HYRRecibos: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 1993
    ValorGrupo = 1
    DataSet = DMMain.QListados
    Opciones.Pagina.Margenes.Abajo = 0
    Opciones.Pagina.Margenes.Izquierda = 0
    Opciones.Pagina.Margenes.Derecha = 0
    Opciones.Pagina.Margenes.Arriba = 0
    Opciones.Pagina.Alto = 24
    Opciones.Pagina.Ancho = 106
    Opciones.Pagina.Tamanyo = 24
    Opciones.Pagina.SaltoPagina = False
    Opciones.Pagina.ImprimePrimeraCabecera = True
    Opciones.Pagina.ImprimeUltimoPie = True
    Titulo = 'Recibos de la Remesa 2'
    ControlaLongitud = True
    OnEnterFields = HYRRecibosEnterFields
    OnPrintReport = HYRRecibosPrintReport
    Left = 336
    Top = 8
  end
  object HYRSxRecibos: THYReportSource
    DataSet = xRecibos
    CloseDataset = True
    Left = 336
    Top = 56
  end
  object HYRSxLocalidadEmpresa: THYReportSource
    DataSet = xLocalidadEmpresa
    CloseDataset = True
    Left = 336
    Top = 296
  end
  object HYRSxBancoCliRe: THYReportSource
    DataSet = xBancoCliRe
    CloseDataset = True
    Left = 336
    Top = 584
  end
  object HYRSxClienteRecibo: THYReportSource
    DataSet = xClienteRecibo
    CloseDataset = True
    Left = 336
    Top = 440
  end
  object HYRSxCli: THYReportSource
    DataSet = xCli
    CloseDataset = True
    Left = 336
    Top = 200
  end
  object HYRSxBancosRe: THYReportSource
    DataSet = xBancosRe
    CloseDataset = True
    Left = 336
    Top = 536
  end
  object HYRSxLoc_T: THYReportSource
    DataSet = xLoc_T
    CloseDataset = True
    Left = 336
    Top = 392
  end
  object xInfoBanco: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT dir.nombre_r_social, dir.titulo_localidad'
      'FROM SYS_TERCEROS_BANCOS ban JOIN VER_TERCEROS_DIRECCION dir ON '
      '(ban.tercero=dir.tercero)'
      'WHERE ((ban.tercero=?tercero)and(ban.banco=?banco))')
    UniDirectional = False
    DataSource = DSxBancoCliRe
    Left = 32
    Top = 248
  end
  object HYRxInfoBanco: THYReportSource
    DataSet = xInfoBanco
    CloseDataset = True
    Left = 336
    Top = 248
  end
  object HYRxDirecCli: THYReportSource
    DataSet = xDirecCli
    CloseDataset = True
    Left = 336
    Top = 344
  end
  object Letras: TLetra
    Decimales = 2
    GeneroMasculino = True
    LongLinea = 92
    LongPrimeraLinea = 80
    Separador = ','
    Relleno = '*'
    Moneda = 'Eur.'
    DescDecimales = 'c'#233'ntimos'
    ModoDecimales = 0
    Left = 640
    Top = 104
  end
  object xSerie: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT SERIE,TITULO FROM VER_SERIES'
      
        'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL' +
        ' AND '
      '               SERIE=?SERIE')
    UniDirectional = False
    Left = 440
    Top = 296
  end
  object DSxSerie: TDataSource
    DataSet = xSerie
    Left = 568
    Top = 296
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * '
      'FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 440
    Top = 632
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 568
    Top = 632
  end
  object xDetalleFacturas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select doc.registro as registro, doc.registro_rec as registro_re' +
        'c, doc.linea_rec as linea_rec, car.doc_tipo,'
      
        '       cast(car.doc_numero as varchar(15)) as doc_numero, car.do' +
        'c_serie, car.valor as doc_fecha, det.liquido as liquido,'
      
        '       gcs.liquido as doc_liquido, cast(gcs.su_referencia as var' +
        'char(60)) as su_referencia, det.vencimiento'
      'from emp_cartera_documento doc'
      'left join emp_cartera car on doc.id_cartera_rec = car.id_cartera'
      
        'left join emp_cartera_detalle det on doc.id_cartera_detalle = de' +
        't.id_cartera_detalle'
      
        'left join ges_cabeceras_s gcs on gcs.empresa = doc.empresa and g' +
        'cs.ejercicio = doc.ejercicio_rec and gcs.canal = doc.canal and g' +
        'cs.serie = car.doc_serie and gcs.tipo = car.doc_tipo and gcs.rig' +
        ' = car.doc_numero'
      'where'
      'doc.empresa = :empresa and'
      'doc.ejercicio = :ejercicio and'
      'doc.canal = :canal and'
      'doc.signo = :signo and'
      'doc.registro = :registro and'
      'gcs.empresa is not null'
      ''
      'union'
      ''
      
        'select doc.registro as registro, doc.registro_rec as registro_re' +
        'c, doc.linea_rec as linea_rec, car.doc_tipo,'
      
        '       gcef.num_factura as doc_numero, cast('#39#39' as varchar(10)) a' +
        's doc_serie, car.valor as doc_fecha,'
      
        '       det.liquido as liquido, gce.liquido as doc_liquido, cast(' +
        #39#39' as varchar(60)) as su_referencia, det.vencimiento'
      'from emp_cartera_documento doc'
      'left join emp_cartera car on doc.id_cartera_rec = car.id_cartera'
      
        'left join emp_cartera_detalle det on doc.id_cartera_detalle = de' +
        't.id_cartera_detalle'
      
        'left join ges_cabeceras_e gce on gce.empresa = doc.empresa and g' +
        'ce.ejercicio = doc.ejercicio_rec and gce.canal = doc.canal and g' +
        'ce.serie = car.doc_serie and gce.tipo = car.doc_tipo and gce.rig' +
        ' = car.doc_numero'
      'left join ges_cabeceras_e_fac gcef on gcef.id_e = gce.id_e'
      'where'
      'doc.empresa = :empresa and'
      'doc.ejercicio = :ejercicio and'
      'doc.canal = :canal and'
      'doc.signo = :signo and'
      'car.doc_tipo = '#39'FAP'#39' and'
      'doc.registro = :registro'
      ''
      'union'
      ''
      
        'select doc.registro as registro, doc.registro_rec as registro_re' +
        'c, doc.linea_rec as linea_rec, car.doc_tipo,'
      
        '       gcef.num_factura as doc_numero, cast('#39#39' as varchar(10)) a' +
        's doc_serie, car.valor as doc_fecha,'
      
        '       det.liquido as liquido, gce.liquido as doc_liquido, cast(' +
        #39#39' as varchar(60)) as su_referencia, det.vencimiento'
      'from emp_cartera_documento doc'
      'left join emp_cartera car on doc.id_cartera_rec = car.id_cartera'
      
        'left join emp_cartera_detalle det on doc.id_cartera_detalle = de' +
        't.id_cartera_detalle'
      
        'left join ges_cabeceras_e gce on gce.empresa = doc.empresa and g' +
        'ce.ejercicio = doc.ejercicio_rec and gce.canal = doc.canal and g' +
        'ce.serie = car.doc_serie and gce.tipo = car.doc_tipo and gce.rig' +
        ' = car.doc_numero'
      'left join ges_cabeceras_e_fcr gcef on gcef.id_e = gce.id_e'
      'where'
      'doc.empresa = :empresa and'
      'doc.ejercicio = :ejercicio and'
      'doc.canal = :canal and'
      'doc.signo = :signo and'
      'car.doc_tipo = '#39'FCR'#39' and'
      'doc.registro = :registro'
      ''
      'union'
      ''
      
        'select car.registro as registro, car.registro as registro_rec, d' +
        'et.linea as linea_rec, car.doc_tipo,'
      
        '       cast(gcef.num_factura as varchar(15)) as doc_numero, car.' +
        'doc_serie, car.valor as doc_fecha,'
      
        '       det.liquido as liquido, car.liquido as doc_liquido, cast(' +
        #39#39' as varchar(60)) as su_referencia, det.vencimiento'
      'from emp_cartera car'
      
        'left join emp_cartera_detalle det on car.id_cartera = det.id_car' +
        'tera'
      
        'left join ges_cabeceras_e gce on gce.empresa = car.empresa and g' +
        'ce.ejercicio = car.ejercicio and gce.canal = car.canal and gce.s' +
        'erie = car.doc_serie and gce.tipo = car.doc_tipo and gce.rig = c' +
        'ar.doc_numero'
      'left join ges_cabeceras_e_fcr gcef on gcef.id_e = gce.id_e'
      'where'
      'car.empresa = :empresa and'
      'car.ejercicio = :ejercicio and'
      'visible = 1 and'
      'car.doc_tipo <> '#39'AGC'#39' and'
      'car.doc_tipo <> '#39'AGP'#39' and'
      'car.doc_tipo = '#39'FCR'#39' and'
      'car.canal = :canal and'
      'car.signo = :signo and'
      'car.registro = :registro and'
      'det.linea = :linea'
      ''
      'union'
      ''
      
        'select car.registro as registro, car.registro as registro_rec, d' +
        'et.linea as linea_rec, car.doc_tipo,'
      
        '       cast(gcef.num_factura as varchar(15)) as doc_numero, car.' +
        'doc_serie, car.valor as doc_fecha,'
      
        '       det.liquido as liquido, car.liquido as doc_liquido, cast(' +
        #39#39' as varchar(60)) as su_referencia, det.vencimiento'
      'from emp_cartera car'
      
        'left join emp_cartera_detalle det on car.id_cartera = det.id_car' +
        'tera'
      
        'left join ges_cabeceras_e gce on gce.empresa = car.empresa and g' +
        'ce.ejercicio = car.ejercicio and gce.canal = car.canal and gce.s' +
        'erie = car.doc_serie and gce.tipo = car.doc_tipo and gce.rig = c' +
        'ar.doc_numero'
      'left join ges_cabeceras_e_fac gcef on gcef.id_e = gce.id_e'
      'where'
      'car.empresa = :empresa and'
      'car.ejercicio = :ejercicio and'
      'det.visible = 1 and'
      'car.doc_tipo <> '#39'AGC'#39' and'
      'car.doc_tipo <> '#39'AGP'#39' and'
      'car.doc_tipo = '#39'FAP'#39' and'
      'car.canal = :canal and'
      'car.signo = :signo and'
      'car.registro = :registro and'
      'det.linea = :linea'
      ''
      'union'
      ''
      
        'select car.registro as registro, car.registro as registro_rec, d' +
        'et.linea as linea_rec, car.doc_tipo,'
      
        '       cast(gcs.rig as varchar(15)) as doc_numero, car.doc_serie' +
        ', car.valor as doc_fecha, det.liquido as liquido,'
      
        '       gcs.liquido as doc_liquido, cast(gcs.su_referencia as var' +
        'char(60)) as su_referencia, det.vencimiento'
      'from emp_cartera car'
      
        'left join emp_cartera_detalle det on car.id_cartera = det.id_car' +
        'tera'
      
        'left join ges_cabeceras_s gcs on gcs.empresa = car.empresa and g' +
        'cs.ejercicio = car.ejercicio and gcs.canal = car.canal and gcs.s' +
        'erie = car.doc_serie and gcs.tipo = car.doc_tipo and gcs.rig = c' +
        'ar.doc_numero'
      'where'
      'car.empresa = :empresa and'
      'car.ejercicio = :ejercicio and'
      'car.doc_tipo <> '#39'AGC'#39' and'
      'car.doc_tipo <> '#39'AGP'#39' and'
      'car.doc_tipo = '#39'FAC'#39' and'
      'car.canal = :canal and'
      'car.signo = :signo and'
      'car.registro = :registro and'
      'det.linea = :linea'
      ''
      'union'
      ''
      
        'select c.registro as registro, c.registro as registro_rec, d.lin' +
        'ea as linea_rec, c.doc_tipo,'
      
        '       cast(c.doc_numero as varchar(15)) as doc_numero, c.doc_se' +
        'rie, c.valor as doc_fecha, d.liquido as liquido,'
      
        '       c.liquido as doc_liquido, cast(substring(t.texto from 1 f' +
        'or 60) as varchar(60)) as su_referencia, d.vencimiento'
      'from emp_cartera car'
      
        'left join emp_cartera_detalle det on car.id_cartera = det.id_car' +
        'tera'
      
        'left join emp_cartera_documento a on (det.id_cartera = a.id_cart' +
        'era)'
      'left join emp_cartera c on (a.id_cartera_rec = c.id_cartera)'
      'left join emp_cartera_texto t on (t.id_cartera = c.id_cartera)'
      
        'left join emp_cartera_detalle d on (d.id_cartera_detalle = a.id_' +
        'cartera_detalle)'
      'where'
      'car.empresa = :empresa and'
      'car.ejercicio = :ejercicio and'
      'det.visible = 1 and'
      'car.doc_tipo = '#39'AGC'#39' and'
      'c.doc_tipo = '#39'AFC'#39' and'
      'car.canal = 1 and'
      'car.signo = :signo and'
      'car.registro = :registro and'
      'det.linea = :linea'
      ''
      'union'
      ''
      
        'select c.registro as registro, c.registro as registro_rec, d.lin' +
        'ea as linea_rec, c.doc_tipo,'
      
        '       cast(c.doc_numero as varchar(15)) as doc_numero, c.doc_se' +
        'rie, c.valor as doc_fecha, d.liquido as liquido,'
      
        '       c.liquido as doc_liquido, cast(substring(t.texto from 1 f' +
        'or 60) as varchar(60)) as su_referencia, d.vencimiento'
      'from emp_cartera car'
      
        'left join emp_cartera_detalle det on car.id_cartera = det.id_car' +
        'tera'
      
        'left join emp_cartera_documento a on (det.id_cartera = a.id_cart' +
        'era)'
      'left join emp_cartera c on (a.id_cartera_rec = c.id_cartera)'
      'left join emp_cartera_texto t on (t.id_cartera = c.id_cartera)'
      
        'left join emp_cartera_detalle d on (d.id_cartera_detalle = a.id_' +
        'cartera_detalle)'
      'where'
      'car.empresa = :empresa and'
      'car.ejercicio = :ejercicio and'
      'det.visible = 1 and'
      'car.doc_tipo = '#39'AGC'#39' and'
      'c.doc_tipo = '#39'AFP'#39' and'
      'car.canal = 1 and'
      'car.signo = :signo and'
      'car.registro = :registro and'
      'det.linea = :linea'
      ''
      'union'
      ''
      
        'select c.registro as registro, c.registro as registro_rec, d.lin' +
        'ea as linea_rec, c.doc_tipo,'
      
        '       cast(c.doc_numero as varchar(15)) as doc_numero, c.doc_se' +
        'rie, c.valor as doc_fecha, d.liquido as liquido,'
      
        '       c.liquido as doc_liquido, cast(substring(t.texto from 1 f' +
        'or 60) as varchar(60)) as su_referencia, d.vencimiento'
      'from emp_cartera car'
      
        'left join emp_cartera_detalle det on car.id_cartera = det.id_car' +
        'tera'
      
        'left join emp_cartera_documento a on (det.id_cartera = a.id_cart' +
        'era)'
      'left join emp_cartera c on (a.id_cartera_rec = c.id_cartera)'
      'left join emp_cartera_texto t on (t.id_cartera = c.id_cartera)'
      
        'left join emp_cartera_detalle d on (d.id_cartera_detalle = a.id_' +
        'cartera_detalle)'
      'where'
      'car.empresa = :empresa and'
      'car.ejercicio = :ejercicio and'
      'det.visible = 1 and'
      'car.doc_tipo = '#39'AGP'#39' and'
      'c.doc_tipo = '#39'AFC'#39' and'
      'car.canal = 1 and'
      'car.signo = :signo and'
      'car.registro = :registro and'
      'det.linea = :linea'
      ''
      'union'
      ''
      
        'select c.registro as registro, c.registro as registro_rec, d.lin' +
        'ea as linea_rec, c.doc_tipo,'
      
        '       cast(c.doc_numero as varchar(15)) as doc_numero, c.doc_se' +
        'rie, c.valor as doc_fecha, d.liquido as liquido,'
      
        '       c.liquido as doc_liquido, cast(substring(t.texto from 1 f' +
        'or 60) as varchar(60)) as su_referencia, d.vencimiento'
      'from emp_cartera car'
      
        'left join emp_cartera_detalle det on car.id_cartera = det.id_car' +
        'tera'
      
        'left join emp_cartera_documento a on (det.id_cartera = a.id_cart' +
        'era)'
      'left join emp_cartera c on (a.id_cartera_rec = c.id_cartera)'
      'left join emp_cartera_texto t on (t.id_cartera = c.id_cartera)'
      
        'left join emp_cartera_detalle d on (d.id_cartera_detalle = a.id_' +
        'cartera_detalle)'
      'where'
      'car.empresa = :empresa and'
      'car.ejercicio = :ejercicio and'
      'det.visible = 1 and'
      'car.doc_tipo = '#39'AGP'#39' and'
      'c.doc_tipo = '#39'AFP'#39' and'
      'car.canal = 1 and'
      'car.signo = :signo and'
      'car.registro = :registro and'
      'det.linea = :linea'
      ''
      'union'
      ''
      
        'select car.registro as registro, car.registro as registro_rec, d' +
        'et.linea as linea_rec, car.doc_tipo,'
      
        '       cast(car.doc_numero as varchar(15)) as doc_numero, car.do' +
        'c_serie, car.valor as doc_fecha, det.liquido as liquido,'
      
        '       car.liquido as doc_liquido, cast(substring(t.texto from 1' +
        ' for 60) as varchar(60)) as su_referencia,'
      '       det.vencimiento'
      'from emp_cartera car'
      
        'left join emp_cartera_detalle det on car.id_cartera = det.id_car' +
        'tera'
      'left join emp_cartera_texto t on (t.id_cartera = car.id_cartera)'
      'where'
      'car.empresa = :empresa and'
      'car.ejercicio = :ejercicio and'
      'det.visible = 1 and'
      'car.doc_tipo = '#39'AFP'#39' and'
      'car.canal = 1 and'
      'car.signo = :signo and'
      'car.registro = :registro and'
      'det.linea = :linea'
      ''
      'union'
      ''
      
        'select car.registro as registro, car.registro as registro_rec, d' +
        'et.linea as linea_rec, car.doc_tipo,'
      
        '       cast(car.doc_numero as varchar(15)) as doc_numero, car.do' +
        'c_serie, car.valor as doc_fecha, det.liquido as liquido,'
      
        '       car.liquido as doc_liquido, cast(substring(t.texto from 1' +
        ' for 60) as varchar(60)) as su_referencia,'
      '       det.vencimiento'
      'from emp_cartera car'
      
        'left join emp_cartera_detalle det on car.id_cartera = det.id_car' +
        'tera'
      'left join emp_cartera_texto t on (t.id_cartera = car.id_cartera)'
      'where'
      'car.empresa = :empresa and'
      'car.ejercicio = :ejercicio and'
      'det.visible = 1 and'
      'car.doc_tipo = '#39'AFC'#39' and'
      'car.canal = 1 and'
      'car.signo = :signo and'
      'car.registro = :registro and'
      'det.linea = :linea'
      ''
      'union'
      ''
      
        'select car.registro as registro, car.registro as registro_rec, d' +
        'et.linea as linea_rec, car.doc_tipo,'
      
        '       cast(car.doc_numero as varchar(15)) as doc_numero, car.do' +
        'c_serie, car.valor as doc_fecha, det.liquido as liquido,'
      
        '       car.liquido as doc_liquido, cast(substring(t.texto from 1' +
        ' for 60) as varchar(60)) as su_referencia,'
      '       det.vencimiento'
      'from emp_cartera car'
      
        'left join emp_cartera_detalle det on car.id_cartera = det.id_car' +
        'tera'
      'left join emp_cartera_texto t on (t.id_cartera = car.id_cartera)'
      'where'
      'car.empresa = :empresa and'
      'car.ejercicio = :ejercicio and'
      'det.visible = 1 and'
      'car.doc_tipo = '#39'NRP'#39' and'
      'car.canal = :canal and'
      'car.signo = :signo and'
      'car.registro = :registro and'
      'det.linea = :linea'
      ''
      'union'
      ''
      
        'select car.registro as registro, car.registro as registro_rec, d' +
        'et.linea as linea_rec, car.doc_tipo,'
      
        '       cast(car.doc_numero as varchar(15)) as doc_numero, car.do' +
        'c_serie, car.valor as doc_fecha, det.liquido as liquido,'
      
        '       car.liquido as doc_liquido, cast(substring(t.texto from 1' +
        ' for 60) as varchar(60)) as su_referencia,'
      '       det.vencimiento'
      'from emp_cartera car'
      
        'left join emp_cartera_detalle det on car.id_cartera = det.id_car' +
        'tera'
      'left join emp_cartera_texto t on (t.id_cartera = car.id_cartera)'
      'where'
      'car.empresa = :empresa and'
      'car.ejercicio = :ejercicio and'
      'det.visible = 1 and'
      'car.doc_tipo = '#39'NRC'#39' and'
      'car.canal = :canal and'
      'car.signo = :signo and'
      'car.registro = :registro and'
      'det.linea = :linea'
      ''
      'union'
      ''
      
        'select c.registro as registro, c.registro as registro_rec, d.lin' +
        'ea as linea_rec, c.doc_tipo,'
      
        '       cast(c.doc_numero as varchar(15)) as doc_numero, c.doc_se' +
        'rie, c.valor as doc_fecha, d.liquido as liquido,'
      
        '       c.liquido as doc_liquido, cast(substring(t.texto from 1 f' +
        'or 60) as varchar(60)) as su_referencia, d.vencimiento'
      'from emp_cartera car'
      
        'left join emp_cartera_detalle det on car.id_cartera = det.id_car' +
        'tera'
      
        'left join emp_cartera_documento a on (det.id_cartera = a.id_cart' +
        'era)'
      'left join emp_cartera c on (a.id_cartera_rec = c.id_cartera)'
      'left join emp_cartera_texto t on (t.id_cartera = c.id_cartera)'
      
        'left join emp_cartera_detalle d on (d.id_cartera_detalle = a.id_' +
        'cartera_detalle)'
      'where'
      'car.empresa = :empresa and'
      'car.ejercicio = :ejercicio and'
      'det.visible = 1 and'
      '((car.doc_tipo = '#39'AGC'#39') or (car.doc_tipo = '#39'AGP'#39')) and'
      'c.doc_tipo <> '#39'AFC'#39' and'
      'c.doc_tipo <> '#39'AFP'#39' and'
      'c.doc_tipo <> '#39'FAC'#39' and'
      'c.doc_tipo <> '#39'FAP'#39' and'
      'car.canal = :canal and'
      'car.signo = :signo and'
      'car.registro = :registro and'
      'det.linea = :linea')
    UniDirectional = False
    DataSource = DSxRecibos
    Left = 32
    Top = 152
  end
  object DSxDetalleFacturas: TDataSource
    DataSet = xDetalleFacturas
    Left = 128
    Top = 152
  end
  object HYRxDetalleFacturasKri: THYReportSource
    DataSet = xDetalleFacturas
    CloseDataset = True
    Left = 336
    Top = 152
  end
  object xDobleRecibos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CARTERA_REMESA '
      'WHERE '
      '   ((EMPRESA=?EMPRESA) AND'
      '    (EJERCICIO_CARTERA=?EJERCICIO) AND'
      '    (CANAL=?CANAL) AND'
      '    (SIGNO=?SIGNO) AND'
      '    (REMESA=?REMESA) AND'
      '    (COD_CLI_PRO=?COD_CLI_PRO) AND'
      '    (VENCIMIENTO=?VENCIMIENTO) AND '
      '    (REGISTRO = ?REGISTRO))')
    UniDirectional = False
    DataSource = DSxRecibos
    AfterOpen = xDobleRecibosAfterOpen
    Left = 32
    Top = 488
  end
  object DSxDobleRecibos: TDataSource
    DataSet = xDobleRecibos
    Left = 128
    Top = 488
  end
  object frDBxDobleRecibos: TfrDBDataSet
    DataSource = DSxDobleRecibos
    Left = 224
    Top = 104
  end
  object xDobleCli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT '
      
        'empresa,ejercicio,canal,cliente,tercero,titulo,nif,descuento_pp,' +
        'modo_iva,forma_pago,moneda'
      'FROM VER_CLIENTES'
      'where empresa=?empresa and ejercicio=?ejercicio_cartera and '
      '          canal=?canal and cliente=?cod_cli_pro and '#39'C'#39' = ?signo'
      'union'
      'SELECT '
      
        'empresa,ejercicio,canal,proveedor as cliente,tercero,titulo,nif,' +
        'descuento_pp,modo_iva,forma_pago,moneda'
      'FROM VER_PROVEEDORES'
      'where empresa=?empresa and ejercicio=?ejercicio_cartera and '
      
        '          canal=?canal and proveedor=?cod_cli_pro and '#39'P'#39' = ?sig' +
        'no and'
      '          '#39'FCR'#39' <> ?doc_tipo'
      'union'
      'SELECT '
      
        'empresa,ejercicio,canal,acreedor as cliente,tercero,titulo,nif,d' +
        'escuento_pp,modo_iva,forma_pago,moneda'
      'FROM VER_ACREEDORES'
      'where empresa=?empresa and ejercicio=?ejercicio_cartera and '
      
        '          canal=?canal and acreedor=?cod_cli_pro and '#39'P'#39' = ?sign' +
        'o and'
      '          '#39'FCR'#39' = ?doc_tipo'
      '')
    UniDirectional = False
    DataSource = DSxDobleRecibos
    AfterOpen = xDobleCliAfterOpen
    Left = 440
    Top = 56
  end
  object DSxDobleCli: TDataSource
    DataSet = xDobleCli
    Left = 568
    Top = 56
  end
  object xDobleBancoCliRe: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT EC.EMPRESA, CU.EJERCICIO, CU.CANAL, EC.CLIENTE, EC.TERCER' +
        'O, ST.NOMBRE_R_SOCIAL AS TITULO, ST.NIF, EC.RIESGO_AUT,'
      
        '       EC.RIESGO_ACT, EC.AGENTE, EC.TARIFA, EC.DESCUENTO_PP, CU.' +
        'FORMA_PAGO, CU.MODO_IVA, BAN.BANCO,'
      
        '       BAN.TITULO AS TITULAR, BAN.ENTIDAD, BAN.SUCURSAL, BAN.CON' +
        'TROL, BAN.CUENTA, BAN.ORDEN, BAN.IBAN, BAN.BIC, BAN.PAIS'
      'FROM EMP_CLIENTES EC'
      'JOIN SYS_TERCEROS ST ON (EC.TERCERO = ST.TERCERO)'
      
        'JOIN CON_CUENTAS_GES_CLI CU ON ((EC.CLIENTE = CU.CLIENTE) AND (E' +
        'C.EMPRESA = CU.EMPRESA))'
      'LEFT JOIN SYS_TERCEROS_BANCOS BAN ON (ST.TERCERO = BAN.TERCERO)'
      'WHERE'
      'EC.EMPRESA = :EMPRESA AND'
      '/* CU.EJERCICIO=:EJERCICIO_CARTERA AND */'
      'CU.EJERCICIO = :EJERCICIO AND'
      'CU.CANAL = :CANAL AND'
      'EC.CLIENTE = :COD_CLI_PRO AND'
      'BAN.ACTIVA = 1'
      'ORDER BY BAN.ORDEN')
    UniDirectional = False
    DataSource = DSxDobleRecibos
    AfterOpen = xDobleBancoCliReAfterOpen
    Left = 32
    Top = 104
  end
  object DSxDobleBancoCliRe: TDataSource
    DataSet = xDobleBancoCliRe
    Left = 128
    Top = 104
  end
  object xDobleTerceroEmpresa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_EDICION'
      'WHERE TERCERO=?COD_CLI_PRO')
    UniDirectional = False
    DataSource = DSxDobleRecibos
    AfterOpen = xTerceroEmpresaAfterOpen
    Left = 440
    Top = 584
  end
  object DSxDobleTerceroEmpresa: TDataSource
    DataSet = xDobleTerceroEmpresa
    Left = 568
    Top = 584
  end
  object xDobleTipoEfecto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_EFECTO'
      'WHERE TIPO=?TIPO_EFECTO')
    UniDirectional = False
    DataSource = DSxDobleRecibos
    Left = 440
    Top = 344
  end
  object DSxDobleTipoEfecto: TDataSource
    DataSet = xDobleTipoEfecto
    Left = 568
    Top = 344
  end
  object xDobleClienteRecibo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT '
      
        'empresa,ejercicio,canal,cliente,tercero,titulo,cuenta,descuento_' +
        'pp,modo_iva,forma_pago,moneda'
      'FROM VER_CLIENTES_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  CLIENTE=?COD_CLI_PRO'
      ' and '#39'C'#39' = ?signo'
      ''
      'union'
      ''
      'SELECT '
      
        'empresa,ejercicio,canal,proveedor as cliente,tercero,titulo,cuen' +
        'ta,descuento_pp,modo_iva,forma_pago,moneda'
      'FROM VER_PROVEEDORES_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  PROVEEDOR=?COD_CLI_PRO'
      ' and '#39'P'#39' = ?signo'
      ' and '#39'FCR'#39' <> ?doc_tipo'
      ''
      ''
      'union'
      ''
      'SELECT '
      
        'empresa,ejercicio,canal,acreedor as cliente,tercero,titulo,cuent' +
        'a,descuento_pp,modo_iva,forma_pago,moneda'
      'FROM VER_ACREEDORES_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  ACREEDOR=?COD_CLI_PRO'
      ' and '#39'P'#39' = ?signo '
      ' and '#39'FCR'#39' = ?doc_tipo'
      '')
    UniDirectional = False
    DataSource = DSxDobleRecibos
    Left = 32
    Top = 440
  end
  object DSxDobleClienteRecibo: TDataSource
    DataSet = xDobleClienteRecibo
    Left = 128
    Top = 440
  end
  object xDobleInfoBanco: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT dir.nombre_r_social, dir.titulo_localidad'
      'FROM SYS_TERCEROS_BANCOS ban JOIN VER_TERCEROS_DIRECCION dir ON '
      '(ban.tercero=dir.tercero)'
      'WHERE ((tercero=?tercero)and(banco=?banco))')
    UniDirectional = False
    DataSource = DSxDobleBancoCliRe
    Left = 440
    Top = 440
  end
  object DSxDobleInfoBanco: TDataSource
    DataSet = xDobleInfoBanco
    Left = 568
    Top = 440
  end
  object xDobleBancoRe: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SYS_BANCOS'
      'WHERE'
      'PAIS = :PAIS AND'
      'ENTIDAD = :ENTIDAD   ')
    UniDirectional = False
    DataSource = DSxDobleBancoCliRe
    Left = 440
    Top = 392
  end
  object DSxDobleBancoRe: TDataSource
    DataSet = xDobleBancoRe
    Left = 568
    Top = 392
  end
  object xDobleDirecCli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_DIRECCION'
      'where tercero=?tercero')
    UniDirectional = False
    DataSource = DSxDobleCli
    AfterOpen = xDobleDirecCliAfterOpen
    Left = 440
    Top = 488
  end
  object DSxDobleDirecCli: TDataSource
    DataSet = xDobleDirecCli
    Left = 568
    Top = 488
  end
  object xDobleLoc_T: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_LOCALIDADES'
      'where localidad = ?localidad')
    UniDirectional = False
    DataSource = DSxDobleDirecCli
    Left = 440
    Top = 536
  end
  object DSxDobleLoc_T: TDataSource
    DataSet = xDobleLoc_T
    Left = 568
    Top = 536
  end
  object frDBxDetalleFacturas: TfrDBDataSet
    DataSource = DSxDetalleFacturas
    Left = 224
    Top = 152
  end
  object xBancoProv: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'select * from ver_bancos_cuentas'
      'where'
      'empresa =  ?empresa and'
      'ejercicio = ?ejercicio and'
      'canal = ?canal and'
      'cuenta_cc = ?cta_pago and'
      'activo=1')
    UniDirectional = True
    DataSource = DSxRecibos
    AfterOpen = xBancoCliReAfterOpen
    Left = 32
    Top = 584
  end
  object DSxBancoProv: TDataSource
    DataSet = xBancoProv
    Left = 128
    Top = 584
  end
  object xDobleBancoProv: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'select * from ver_bancos_cuentas'
      'where'
      'empresa =  ?empresa and'
      'ejercicio = ?ejercicio_cartera and'
      'canal = ?canal and'
      'cuenta_cc = ?cta_pago and'
      'activo=1')
    UniDirectional = True
    DataSource = DSxDobleRecibos
    AfterOpen = xBancoCliReAfterOpen
    Left = 440
    Top = 248
  end
  object DSxDobleBancoProv: TDataSource
    DataSet = xDobleBancoProv
    Left = 568
    Top = 248
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 640
    Top = 56
  end
  object frxRecibos: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 41527.3873800926
    ReportOptions.LastChange = 41527.3873800926
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnPrintReport = frxRecibosPrintReport
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 280
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
