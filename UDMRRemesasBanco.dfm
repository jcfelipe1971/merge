object DMRRemesasBanco: TDMRRemesasBanco
  OldCreateOrder = False
  OnCreate = DMRRemesasBancoCreate
  OnDestroy = DMRCabeceraDestroy
  Left = 421
  Top = 82
  Height = 716
  Width = 806
  object frRemesas: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Remesas Banco con C.C.'
    RebuildPrinter = False
    OnGetValue = frRemesasGetValue
    OnBeforePrint = frRemesasEnterRect
    OnEnterRect = frRemesasEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 168
    Top = 8
    ReportForm = {19000000}
  end
  object xCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CARTERA_REMESAS'
      'WHERE ID_REMESAS = ?ID_REMESAS')
    UniDirectional = False
    Left = 32
    Top = 56
  end
  object xDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CARTERA_REMESA'
      'WHERE ID_REMESAS = ?ID_REMESAS'
      'order by vencimiento desc')
    UniDirectional = False
    DataSource = DSxCabecera
    AfterOpen = xDetalleAfterOpen
    Left = 32
    Top = 104
  end
  object DSxDetalle: TDataSource
    DataSet = xDetalle
    Left = 96
    Top = 104
  end
  object DSxCabecera: TDataSource
    DataSet = xCabecera
    Left = 96
    Top = 56
  end
  object xCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES'
      'where'
      '    empresa=?empresa and '
      '    ejercicio=?ejercicio and'
      '    canal=?canal and'
      '    cliente=?cod_cli_pro')
    UniDirectional = False
    DataSource = DSxDetalle
    Left = 32
    Top = 200
  end
  object xProveedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_PROVEEDORES'
      'where empresa=?empresa and ejercicio=?ejercicio and '
      'canal=?canal and proveedor=?cod_cli_pro')
    UniDirectional = False
    DataSource = DSxDetalle
    Left = 32
    Top = 152
  end
  object xBanco: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM EMP_BANCOS'
      'where (empresa=?empresa) and (banco=?banco)')
    UniDirectional = False
    DataSource = DSxCabecera
    Left = 32
    Top = 248
  end
  object frDSxDetalle: TfrDBDataSet
    DataSource = DSxDetalle
    Left = 168
    Top = 104
  end
  object frDSxCabecera: TfrDBDataSet
    DataSource = DSxCabecera
    Left = 168
    Top = 56
  end
  object DSxBanco: TDataSource
    DataSet = xBanco
    Left = 96
    Top = 248
  end
  object frDBxBanco: TfrDBDataSet
    DataSource = DSxBanco
    Left = 168
    Top = 248
  end
  object DSxProveedor: TDataSource
    DataSet = xProveedor
    Left = 96
    Top = 152
  end
  object frDBxProveedor: TfrDBDataSet
    DataSource = DSxProveedor
    Left = 168
    Top = 152
  end
  object DSxCliente: TDataSource
    DataSet = xCliente
    Left = 96
    Top = 200
  end
  object frDBxCliente: TfrDBDataSet
    DataSource = DSxCliente
    Left = 168
    Top = 200
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 32
    Top = 8
  end
  object xBancoCli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      'EC.EMPRESA, CU.EJERCICIO, CU.CANAL, EC.CLIENTE, EC.TERCERO,'
      'ST.NOMBRE_R_SOCIAL AS TITULO, ST.NIF,'
      'EC.RIESGO_AUT, EC.RIESGO_ACT, EC.AGENTE,'
      'EC.TARIFA, EC.DESCUENTO_PP, CU.FORMA_PAGO, CU.MODO_IVA,'
      'BAN.BANCO, BAN.TITULO AS TITULAR,'
      'BAN.ENTIDAD, BAN.SUCURSAL, BAN.CONTROL, BAN.CUENTA, BAN.ORDEN,'
      'BAN.ACTIVA, BAN.IBAN, BAN.BIC, BAN.TIPO_ADEUDO_SEPA, BAN.FIRMA,'
      'BAN.FECHA_FIRMA, BAN.TIPO_CONTRATO_SEPA, BAN.PAIS'
      'FROM EMP_CLIENTES EC'
      'JOIN SYS_TERCEROS ST'
      'ON (EC.TERCERO=ST.TERCERO)'
      'JOIN CON_CUENTAS_GES_CLI CU'
      'ON ((EC.CLIENTE=CU.CLIENTE) AND (EC.EMPRESA=CU.EMPRESA))'
      'JOIN SYS_TERCEROS_BANCOS BAN'
      'ON (ST.TERCERO=BAN.TERCERO)'
      'WHERE'
      'EC.EMPRESA=?EMPRESA AND'
      'CU.EJERCICIO=?EJERCICIO AND'
      'CU.CANAL=?CANAL AND'
      'EC.CLIENTE=?COD_CLI_PRO'
      'ORDER BY BAN.ORDEN')
    UniDirectional = False
    DataSource = DSxDetalle
    Left = 608
    Top = 584
  end
  object DSxBancoCli: TDataSource
    DataSet = xBancoCli
    Left = 696
    Top = 584
  end
  object DSxBancos: TDataSource
    DataSet = xBancos
    Left = 696
    Top = 632
  end
  object xBancos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SYS_BANCOS'
      'WHERE'
      'PAIS = :PAIS AND'
      'ENTIDAD = :ENTIDAD')
    UniDirectional = False
    DataSource = DSxBancoCli
    Left = 608
    Top = 632
  end
  object HYRRemesas: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 1995
    ValorGrupo = 1
    DataSet = DMMain.QListados
    Opciones.Pagina.Margenes.Abajo = 0
    Opciones.Pagina.Margenes.Izquierda = 0
    Opciones.Pagina.Margenes.Derecha = 0
    Opciones.Pagina.Margenes.Arriba = 0
    Opciones.Pagina.Alto = 24
    Opciones.Pagina.Ancho = 80
    Opciones.Pagina.Tamanyo = 24
    Opciones.Pagina.SaltoPagina = False
    Opciones.Pagina.ImprimePrimeraCabecera = False
    Opciones.Pagina.ImprimeUltimoPie = False
    Titulo = 'Factura Remesas'
    ControlaLongitud = True
    OnEnterFields = HYRRemesasEnterFields
    OnPrepareFields = HYRRemesasPrepareFields
    Left = 304
    Top = 8
  end
  object xDirecCli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_DIRECCION'
      'where tercero=?tercero')
    UniDirectional = False
    DataSource = DSxCli
    AfterOpen = xDirecCliAfterOpen
    Left = 376
    Top = 152
  end
  object xCli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES'
      'where empresa=?empresa and ejercicio=?ejercicio and '
      '          canal=?canal and cliente=?cod_cli_pro')
    UniDirectional = False
    DataSource = DSxRecibos
    AfterOpen = xCliAfterOpen
    Left = 32
    Top = 536
  end
  object DSxDirecCli: TDataSource
    DataSet = xDirecCli
    Left = 456
    Top = 152
  end
  object DSxCli: TDataSource
    DataSet = xCli
    Left = 96
    Top = 536
  end
  object xLoc_T: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_LOCALIDADES'
      'where localidad = ?localidad')
    UniDirectional = False
    DataSource = DSxDirecCli
    Left = 376
    Top = 104
  end
  object DSxLoc_T: TDataSource
    DataSet = xLoc_T
    Left = 456
    Top = 104
  end
  object xTipoEfecto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_EFECTO'
      'WHERE TIPO=?TIPO_EFECTO')
    UniDirectional = False
    DataSource = DSxRecibos
    Left = 608
    Top = 56
  end
  object xClienteRecibo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  CLIENTE=?COD_CLI_PRO')
    UniDirectional = False
    DataSource = DSxRecibos
    AfterScroll = xClienteReciboAfterScroll
    Left = 32
    Top = 632
  end
  object xLocalidadEmpresa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_LOCALIDADES'
      'WHERE LOCALIDAD=?DIR_LOCALIDAD')
    UniDirectional = False
    DataSource = DSxTerceroEmpresa
    Left = 376
    Top = 248
  end
  object DSxTipoEfecto: TDataSource
    DataSet = xTipoEfecto
    Left = 696
    Top = 56
  end
  object DSxClienteRecibo: TDataSource
    DataSet = xClienteRecibo
    Left = 96
    Top = 632
  end
  object DSxLocalidadEmpresa: TDataSource
    DataSet = xLocalidadEmpresa
    Left = 456
    Top = 248
  end
  object xTerceroEmpresa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_EDICION'
      'WHERE TERCERO=?COD_CLI_PRO')
    UniDirectional = False
    DataSource = DSxRecibos
    AfterOpen = xTerceroEmpresaAfterOpen
    Left = 608
    Top = 104
  end
  object DSxTerceroEmpresa: TDataSource
    DataSet = xTerceroEmpresa
    Left = 696
    Top = 104
  end
  object xRecibos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_CARTERA_REMESA'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SIGNO = '#39'C'#39' AND'
      'REMESA = :REMESA AND'
      'COD_CLI_PRO <= :MAX_CLI AND'
      'COD_CLI_PRO >= :MIN_CLI AND'
      'VENCIMIENTO <= :MAX_VTO AND'
      'VENCIMIENTO >= :MIN_VTO')
    UniDirectional = False
    AfterOpen = xRecibosAfterOpen
    AfterScroll = xRecibosAfterScroll
    Left = 32
    Top = 440
  end
  object DSxRecibos: TDataSource
    DataSet = xRecibos
    Left = 96
    Top = 440
  end
  object frDBxRecibos: TfrDBDataSet
    DataSource = DSxRecibos
    Left = 168
    Top = 440
  end
  object xBancoCliRe: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES_BANCOS'
      'where empresa=?empresa and '
      '           ejercicio=?ejercicio and '
      '           canal=?canal and '
      '           cliente=?cod_cli_pro'
      'order by orden')
    UniDirectional = False
    DataSource = DSxRecibos
    AfterOpen = xBancoCliReAfterOpen
    Left = 32
    Top = 584
  end
  object DSxBancoCliRe: TDataSource
    DataSet = xBancoCliRe
    Left = 96
    Top = 584
  end
  object DSxBancosRe: TDataSource
    DataSet = xBancosRe
    Left = 456
    Top = 200
  end
  object xBancosRe: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SYS_BANCOS'
      'WHERE'
      'PAIS = :PAIS AND'
      'ENTIDAD = :ENTIDAD')
    UniDirectional = False
    DataSource = DSxBancoCliRe
    Left = 376
    Top = 200
  end
  object HYRSxRecibos: THYReportSource
    DataSet = xRecibos
    CloseDataset = True
    Left = 248
    Top = 440
  end
  object HYRSxLocalidadEmpresa: THYReportSource
    DataSet = xLocalidadEmpresa
    CloseDataset = True
    Left = 528
    Top = 248
  end
  object HYRSxBancoCliRe: THYReportSource
    DataSet = xBancoCliRe
    CloseDataset = True
    Left = 248
    Top = 584
  end
  object HYRSxClienteRecibo: THYReportSource
    DataSet = xClienteRecibo
    CloseDataset = True
    Left = 248
    Top = 632
  end
  object HYRSxCli: THYReportSource
    DataSet = xCli
    CloseDataset = True
    Left = 248
    Top = 536
  end
  object HYRSxBancosRe: THYReportSource
    DataSet = xBancosRe
    CloseDataset = True
    Left = 528
    Top = 200
  end
  object HYRSxLoc_T: THYReportSource
    DataSet = xLoc_T
    CloseDataset = True
    Left = 528
    Top = 104
  end
  object xInfoBanco: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT dir.nombre_r_social, dir.titulo_localidad'
      'FROM SYS_TERCEROS_BANCOS ban JOIN VER_TERCEROS_DIRECCION dir ON '
      '(ban.tercero=dir.tercero)'
      'WHERE ((ban.tercero=?tercero)and(ban.banco=?banco))')
    UniDirectional = False
    DataSource = DSxBancoCliRe
    Left = 376
    Top = 56
  end
  object HYRxInfoBanco: THYReportSource
    DataSet = xInfoBanco
    CloseDataset = True
    Left = 528
    Top = 56
  end
  object HYRxDirecCli: THYReportSource
    DataSet = xDirecCli
    CloseDataset = True
    Left = 528
    Top = 152
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * '
      'FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 608
    Top = 392
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 696
    Top = 392
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
    Left = 376
    Top = 8
  end
  object DSxDetalleFacturas: TDataSource
    DataSet = xDetalleFacturas
    Left = 96
    Top = 392
  end
  object xDetalleFacturas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select doc.registro as registro,doc.registro_rec as registro_rec' +
        ',doc.linea_rec as linea_rec,car.doc_tipo,car.doc_numero,car.doc_' +
        'serie,car.valor as doc_fecha,det.liquido as liquido,gcs.liquido ' +
        'as doc_liquido,gcs.su_referencia,det.vencimiento as vencimiento ' +
        'from emp_cartera_documento doc'
      'left join emp_cartera car'
      'on((doc.empresa=car.empresa)and(doc.ejercicio=car.ejercicio)and'
      
        '   (doc.canal=car.canal)and(doc.signo=car.signo)and(doc.registro' +
        '_rec=car.registro))'
      'left join emp_cartera_detalle det'
      'on((doc.empresa=det.empresa)and(doc.ejercicio=det.ejercicio)and'
      
        '   (doc.canal=det.canal)and(doc.signo=det.signo)and(doc.registro' +
        '_rec=det.registro)and'
      '   (doc.linea_rec=det.linea))'
      'left join ges_cabeceras_s gcs'
      'on'
      'gcs.empresa = doc.empresa and'
      'gcs.ejercicio = doc.ejercicio and'
      'gcs.canal = doc.canal and'
      'gcs.serie = car.doc_serie and'
      'gcs.tipo = car.doc_tipo and'
      'gcs.rig = car.doc_numero'
      
        'where((doc.empresa=?EMPRESA)and(doc.ejercicio=?EJERCICIO_CARTERA' +
        ')and'
      
        '    (doc.canal=?CANAL)and(doc.signo=?SIGNO)and(doc.registro=?REG' +
        'ISTRO))'
      'union'
      
        'select car.registro as registro,car.registro     as registro_rec' +
        ',det.linea     as linea_rec,car.doc_tipo,car.doc_numero,car.doc_' +
        'serie,car.valor as doc_fecha,det.liquido as liquido,car.liquido ' +
        'as doc_liquido,gcs.su_referencia,det.vencimiento as vencimiento ' +
        'from emp_cartera car'
      'left join emp_cartera_detalle det'
      'on((car.empresa=det.empresa)and(car.ejercicio=det.ejercicio)and'
      
        '   (car.canal=det.canal)and(car.signo=det.signo)and(car.registro' +
        '=det.registro))'
      'left join ges_cabeceras_s gcs'
      'on'
      'gcs.empresa = car.empresa and'
      'gcs.ejercicio = car.ejercicio and'
      'gcs.canal = car.canal and'
      'gcs.serie = car.doc_serie and'
      'gcs.tipo = car.doc_tipo and'
      'gcs.rig = car.doc_numero'
      
        'where((Car.empresa=?EMPRESA)and(car.ejercicio=?EJERCICIO_CARTERA' +
        ')and(visible=1)and(car.doc_tipo<> '#39'AGC'#39')and'
      
        '    (car.canal=?CANAL)and(car.signo=?SIGNO)and(car.registro=?REG' +
        'ISTRO)'
      '    and(det.linea=?LINEA))'
      ' '
      ' ')
    UniDirectional = False
    DataSource = DSxRecibos
    Left = 32
    Top = 392
  end
  object HYRxDetalleFacturas: THYReportSource
    DataSet = xDetalleFacturas
    CloseDataset = True
    Left = 248
    Top = 392
  end
  object frDBxDetalleFacturas: TfrDBDataSet
    DataSet = xDetalleFacturas
    Left = 168
    Top = 392
  end
  object xDobleRecibos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CARTERA_REMESA '
      'WHERE '
      '   ((EMPRESA=?EMPRESA) AND'
      '    (EJERCICIO=?EJERCICIO) AND'
      '    (CANAL=?CANAL) AND'
      '    (SIGNO='#39'C'#39') AND'
      '    (REMESA=?REMESA) AND'
      '    (COD_CLI_PRO=?COD_CLI_PRO) AND'
      '    (VENCIMIENTO=?VENCIMIENTO) AND '
      '    (REGISTRO = ?REGISTRO))')
    UniDirectional = False
    AfterOpen = xDobleRecibosAfterOpen
    Left = 32
    Top = 296
  end
  object DSxDobleRecibos: TDataSource
    DataSet = xDobleRecibos
    Left = 96
    Top = 296
  end
  object frDBxDobleRecibos: TfrDBDataSet
    DataSource = DSxDobleRecibos
    Left = 168
    Top = 296
  end
  object xDobleTipoEfecto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_EFECTO'
      'WHERE TIPO=?TIPO_EFECTO')
    UniDirectional = False
    DataSource = DSxDobleRecibos
    Left = 376
    Top = 296
  end
  object DSxDobleTipoEfecto: TDataSource
    DataSet = xDobleTipoEfecto
    Left = 456
    Top = 296
  end
  object xDobleCli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES'
      'where empresa=?empresa and ejercicio=?ejercicio and '
      '          canal=?canal and cliente=?cod_cli_pro')
    UniDirectional = False
    DataSource = DSxDobleRecibos
    AfterOpen = xDobleCliAfterOpen
    Left = 376
    Top = 344
  end
  object DSxDobleCli: TDataSource
    DataSet = xDobleCli
    Left = 456
    Top = 344
  end
  object xDobleBancoCliRe: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES_BANCOS'
      'where empresa=?empresa and '
      '           ejercicio=?ejercicio and '
      '           canal=?canal and '
      '           cliente=?cod_cli_pro'
      'order by orden')
    UniDirectional = False
    DataSource = DSxDobleRecibos
    AfterOpen = xDobleBancoCliReAfterOpen
    Left = 32
    Top = 344
  end
  object DSxDobleBancoCliRe: TDataSource
    DataSet = xDobleBancoCliRe
    Left = 96
    Top = 344
  end
  object xDobleTerceroEmpresa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_EDICION'
      'WHERE TERCERO=?COD_CLI_PRO')
    UniDirectional = False
    DataSource = DSxDobleRecibos
    AfterOpen = xTerceroEmpresaAfterOpen
    Left = 608
    Top = 536
  end
  object DSxDobleTerceroEmpresa: TDataSource
    DataSet = xDobleTerceroEmpresa
    Left = 696
    Top = 536
  end
  object xDobleClienteRecibo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  CLIENTE=?COD_CLI_PRO')
    UniDirectional = False
    DataSource = DSxDobleRecibos
    Left = 608
    Top = 488
  end
  object DSxDobleClienteRecibo: TDataSource
    DataSet = xDobleClienteRecibo
    Left = 696
    Top = 488
  end
  object xDobleInfoBanco: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT dir.nombre_r_social, dir.titulo_localidad'
      'FROM SYS_TERCEROS_BANCOS ban JOIN VER_TERCEROS_DIRECCION dir ON '
      '(ban.tercero=dir.tercero)'
      'WHERE ((tercero=?tercero)and(banco=?banco))')
    UniDirectional = False
    DataSource = DSxDobleBancoCliRe
    Left = 608
    Top = 344
  end
  object DSxDobleInfoBanco: TDataSource
    DataSet = xDobleInfoBanco
    Left = 696
    Top = 344
  end
  object xDobleBancoRe: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SYS_BANCOS'
      'WHERE'
      'PAIS = :PAIS AND'
      'ENTIDAD = :ENTIDAD')
    UniDirectional = False
    DataSource = DSxDobleBancoCliRe
    Left = 608
    Top = 440
  end
  object DSxDobleBancoRe: TDataSource
    DataSet = xDobleBancoRe
    Left = 696
    Top = 440
  end
  object xDobleDirecCli: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_DIRECCION'
      'where tercero=?tercero')
    UniDirectional = False
    DataSource = DSxDobleCli
    AfterOpen = xDobleDirecCliAfterOpen
    Left = 608
    Top = 248
  end
  object DSxDobleDirecCli: TDataSource
    DataSet = xDobleDirecCli
    Left = 696
    Top = 248
  end
  object xDobleLoc_T: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_LOCALIDADES'
      'where localidad = ?localidad')
    UniDirectional = False
    DataSource = DSxDobleDirecCli
    Left = 608
    Top = 296
  end
  object DSxDobleLoc_T: TDataSource
    DataSet = xDobleLoc_T
    Left = 696
    Top = 296
  end
  object HYRSxCliKRI: THYReportSource
    DataSet = xCliKRI
    CloseDataset = True
    Left = 248
    Top = 488
  end
  object xCliKRI: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO (?tercero)'
      'where (num=1)')
    UniDirectional = False
    DataSource = DSxClienteRecibo
    Left = 32
    Top = 488
  end
  object DSxCliKRI: TDataSource
    DataSet = xCliKRI
    Left = 96
    Top = 488
  end
  object frxRemesas: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.9705409491
    ReportOptions.LastChange = 38691.9705409491
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxRemesasBeforePrint
    OnGetValue = frxRemesasGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 232
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frDBxDobleBancoRe: TfrDBDataSet
    DataSource = DSxDobleBancoCliRe
    Left = 168
    Top = 344
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 96
    Top = 8
  end
end
