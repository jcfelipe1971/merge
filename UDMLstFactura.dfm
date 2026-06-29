object DMLstFactura: TDMLstFactura
  OldCreateOrder = False
  OnCreate = DMLstFacturaCreate
  OnDestroy = DMLstFacturaDestroy
  Left = 179
  Top = 3
  Height = 978
  Width = 1763
  object frFactura: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frFacturaGetValue
    OnBeforePrint = frFacturaEnterRect
    OnEnterRect = frFacturaEnterRect
    OnUserFunction = frFacturaUserFunction
    OnPrintReport = frFacturaPrintReport
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 192
    Top = 8
    ReportForm = {19000000}
  end
  object frDBCabecera: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSCabecera
    Left = 192
    Top = 56
  end
  object frDBdetalle: TfrDBDataSet
    DataSource = DSDetalle
    OpenDataSource = False
    Left = 192
    Top = 104
  end
  object DSCabecera: TDataSource
    DataSet = QMCabecera
    Left = 104
    Top = 56
  end
  object DSDetalle: TDataSource
    DataSet = QMDetalle
    Left = 104
    Top = 104
  end
  object DSxCliente: TDataSource
    DataSet = xCliente
    Left = 104
    Top = 152
  end
  object frUDPie: TfrUserDataset
    RangeEnd = reCount
    RangeEndCount = 1
    Left = 1256
    Top = 8
  end
  object frDBxDatosIva: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDatosIva
    Left = 192
    Top = 296
  end
  object DSxDatosIva: TDataSource
    DataSet = xDatosIva
    Left = 104
    Top = 296
  end
  object DSxAgente: TDataSource
    DataSet = xAgente
    Left = 104
    Top = 248
  end
  object frDBDxAgente: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxAgente
    Left = 192
    Top = 248
  end
  object DSxFormaPago: TDataSource
    DataSet = xFormaPago
    Left = 104
    Top = 200
  end
  object frDBxFormaPago: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxFormaPago
    Left = 192
    Top = 200
  end
  object frUserDataset1: TfrUserDataset
    RangeEnd = reCount
    RangeEndCount = 1
    Left = 1368
    Top = 8
  end
  object frDBxCuenta: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxCuenta
    Left = 656
    Top = 440
  end
  object DSxCuenta: TDataSource
    DataSet = xCuenta
    Left = 568
    Top = 440
  end
  object DSxTerceroBanco: TDataSource
    DataSet = xTerceroBanco
    Left = 568
    Top = 296
  end
  object frDBxTerceroBanco: TfrDBDataSet
    DataSource = DSxTerceroBanco
    Left = 656
    Top = 296
  end
  object DSxNombreBanco: TDataSource
    DataSet = xNombreBanco
    Left = 568
    Top = 392
  end
  object frDBxNombreBanco: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxNombreBanco
    Left = 656
    Top = 392
  end
  object DSxRecibos: TDataSource
    DataSet = xRecibos
    Left = 104
    Top = 488
  end
  object frDBxRecibos: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxRecibos
    Left = 184
    Top = 488
  end
  object FRUDNotasArt: TfrUserDataset
    OnCheckEOF = FRUDNotasArtCheckEOF
    OnFirst = FRUDNotasArtFirst
    OnNext = FRUDNotasArtNext
    Left = 1256
    Top = 104
  end
  object frDBxCliente: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxCliente
    Left = 192
    Top = 152
  end
  object DSxDireccion_Cliente: TDataSource
    DataSet = xDireccion_Cliente
    Left = 104
    Top = 680
  end
  object DSxNombreIva: TDataSource
    DataSet = xNombreIva
    Left = 104
    Top = 728
  end
  object frDBxDireccion_Cliente: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDireccion_Cliente
    Left = 184
    Top = 680
  end
  object frDBxNombreIva: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxNombreIva
    Left = 184
    Top = 728
  end
  object DSQSPProcedencia: TDataSource
    DataSet = QSPProcedencia
    Left = 568
    Top = 344
  end
  object frDBQSPProcedencia: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSQSPProcedencia
    Left = 656
    Top = 344
  end
  object DSxNotasCliente: TDataSource
    DataSet = xNotasCliente
    Left = 568
    Top = 640
  end
  object frDBxNotasCliente: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxNotasCliente
    Left = 656
    Top = 640
  end
  object DSxRuta: TDataSource
    DataSet = xRuta
    Left = 104
    Top = 344
  end
  object frDBxRuta: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxRuta
    Left = 192
    Top = 344
  end
  object DSxDireccionFiscal: TDataSource
    DataSet = xDireccionFiscal
    Left = 568
    Top = 728
  end
  object frDBxDireccionFiscal: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDireccionFiscal
    Left = 656
    Top = 728
  end
  object DSxDatosBancarios: TDataSource
    DataSet = xDatosBancarios
    Left = 568
    Top = 496
  end
  object frDBxDatosBancarios: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDatosBancarios
    Left = 656
    Top = 496
  end
  object DSxEntidad: TDataSource
    DataSet = xEntidad
    Left = 568
    Top = 544
  end
  object frDBxEntidad: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxEntidad
    Left = 656
    Top = 544
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 104
    Top = 8
  end
  object DSDobleCabecera: TDataSource
    DataSet = DobleCabecera
    Left = 568
    Top = 56
  end
  object frDBDobleCabecera: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSDobleCabecera
    Left = 656
    Top = 56
  end
  object DSxDobFormaPago: TDataSource
    DataSet = xDobFormaPago
    Left = 568
    Top = 104
  end
  object frDBxDobFormaPago: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDobFormaPago
    Left = 656
    Top = 104
  end
  object DSxDobTerceroBan: TDataSource
    DataSet = xDobTerceroBan
    Left = 104
    Top = 776
  end
  object frDBxDobTerceroBan: TfrDBDataSet
    DataSource = DSxDobTerceroBan
    Left = 184
    Top = 776
  end
  object DSxDobNomBan: TDataSource
    DataSet = xDobNomBan
    Left = 104
    Top = 824
  end
  object frDBxDobNomBan: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDobNomBan
    Left = 184
    Top = 824
  end
  object HYReport: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 1998
    ValorGrupo = 36
    DataSet = DMMain.QListados
    Opciones.Pagina.Margenes.Abajo = 0
    Opciones.Pagina.Margenes.Izquierda = 0
    Opciones.Pagina.Margenes.Derecha = 0
    Opciones.Pagina.Margenes.Arriba = 0
    Opciones.Pagina.Alto = 58
    Opciones.Pagina.Ancho = 80
    Opciones.Pagina.Tamanyo = 59
    Opciones.Pagina.SaltoPagina = False
    Opciones.Pagina.ImprimePrimeraCabecera = False
    Opciones.Pagina.ImprimeUltimoPie = False
    ControlaLongitud = True
    OnEnterFields = HYReportEnterFields
    OnLengthBands = HYReportLengthBands
    OnPrepareFields = HYReportPrepareFields
    OnPrintReport = HYReportPrintReport
    Left = 328
    Top = 8
  end
  object HYRSCabecera: THYReportSource
    DataSet = QMCabecera
    CloseDataset = True
    Left = 328
    Top = 56
  end
  object HYRSxCliente: THYReportSource
    DataSet = xCliente
    CloseDataset = True
    Left = 328
    Top = 152
  end
  object HYRSxDireccionCliente: THYReportSource
    DataSet = xDireccion_Cliente
    CloseDataset = True
    Left = 328
    Top = 680
  end
  object HYRSDetalle: THYReportSource
    DataSet = QMDetalle
    CloseDataset = False
    Left = 328
    Top = 104
  end
  object HYRSDetalleIVA: THYReportSource
    DataSet = xDatosIva
    CloseDataset = True
    Left = 328
    Top = 296
  end
  object HYRSxFormaPago: THYReportSource
    DataSet = xFormaPago
    CloseDataset = True
    Left = 328
    Top = 200
  end
  object HYRSxAgente: THYReportSource
    DataSet = xAgente
    CloseDataset = True
    Left = 328
    Top = 248
  end
  object HYRSxNombreIVA: THYReportSource
    DataSet = xNombreIva
    CloseDataset = True
    Left = 328
    Top = 728
  end
  object HYRSRuta: THYReportSource
    DataSet = xRuta
    CloseDataset = True
    Left = 328
    Top = 344
  end
  object QUnidadesExt: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select * from ges_detalles_s_ue'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and'
      
        '           serie=?serie and rig=?rig and tipo=?tipo and linea=?l' +
        'inea')
    Transaction = TLocal
    AutoTrans = True
    Left = 1144
    Top = 104
  end
  object DSxTercero: TDataSource
    DataSet = xTercero
    Left = 104
    Top = 392
  end
  object frDBxTransportista: TfrDBDataSet
    DataSource = DSxTransportistas
    Left = 656
    Top = 688
  end
  object DSxTransportistas: TDataSource
    DataSet = xTransportistas
    Left = 568
    Top = 688
  end
  object frUserNotasCab: TfrUserDataset
    OnCheckEOF = frUserNotasCabCheckEOF
    OnFirst = frUserNotasCabFirst
    OnNext = frUserNotasCabNext
    Left = 1256
    Top = 56
  end
  object DobleCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_FACTURA_LST'
      'WHERE'
      'ID_S = ?ID_S')
    UniDirectional = False
    Plan.Strings = (
      
        'PLAN JOIN (VER_CABECERAS_FACTURA CAB INDEX (GES_CABECERAS_S_ID),' +
        'VER_CABECERAS_FACTURA FAC INDEX (GES_CABECERAS_S_FAC_ID),VER_CAB' +
        'ECERAS_FACTURA TER INDEX (PK_SYS_TERCEROS))')
    AfterOpen = DobleCabeceraAfterOpen
    AfterScroll = DobleCabeceraAfterScroll
    BeforeClose = DobleCabeceraBeforeClose
    Left = 488
    Top = 56
  end
  object xDobFormaPago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT* FROM VER_FORMAS_PAGO_EMP'
      'WHERE EMPRESA=?EMPRESA AND'
      '               EJERCICIO=?EJERCICIO AND'
      '               CANAL=?CANAL AND'
      '               FORMA=?FORMA_PAGO')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 488
    Top = 104
  end
  object xDobTerceroBan: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'SELECT ORDEN, CAST(BANCO AS INTEGER) BANCO, TITULO, ENTIDAD, SUC' +
        'URSAL, CONTROL, CUENTA, IBAN, BIC, PAIS'
      'FROM SYS_TERCEROS_BANCOS'
      'WHERE'
      'TERCERO = :TERCERO AND'
      'MODO IN (0, 2) AND'
      '((:BANCO_CLI = 0) OR (BANCO = :BANCO_CLI)) AND'
      'ACTIVA = 1'
      ''
      'UNION'
      ''
      
        'SELECT CAST(1 AS SMALLINT) ORDEN, BANCO, CAST(SUBSTRING(TITULO F' +
        'ROM 1 FOR 40) AS VARCHAR(40)) TITULO, ENTIDAD, SUCURSAL,'
      '       CONTROL, CUENTA_CORRIENTE, IBAN, BIC, PAIS'
      'FROM EMP_BANCOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'BANCO = :BANCO AND'
      'ACTIVO = 1'
      'ORDER BY 1')
    UniDirectional = False
    AfterOpen = xDobTerceroBanAfterOpen
    BeforeClose = xDobTerceroBanBeforeClose
    Left = 32
    Top = 776
  end
  object xDobNomBan: TFIBDataSetRO
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
    DataSource = DSxDobTerceroBan
    Left = 32
    Top = 824
  end
  object QSPProcedencia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM  G_PROCEDENCIA_DOCUMENTO_LINEA'
      '(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA)')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 488
    Top = 344
  end
  object xNombreBanco: TFIBDataSetRO
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
    DataSource = DSxTerceroBanco
    Left = 488
    Top = 392
  end
  object xRecibos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT CAB.EMPRESA, CAB.EJERCICIO, CAB.CANAL, CAB.SIGNO, CAB.REG' +
        'ISTRO, CAB.FECHA_REGISTRO, CAB.CUENTA, CAB.DOC_NUMERO,'
      
        '       CAB.DOC_SERIE, CAB.DOC_FECHA, DET.VENCIMIENTO, DET.LIQUID' +
        'O, DET.PAGADO, DET.TIPO_EFECTO, EFE.TITULO TITULO_TIPO_EFECTO,'
      '       CAB.ID_CARTERA, DET.ID_CARTERA_DETALLE, '
      '       (SELECT A.TITULO'
      '        FROM CON_CUENTAS A'
      '        WHERE'
      '        CAB.EMPRESA = A.EMPRESA AND'
      '        CAB.EJERCICIO = A.EJERCICIO AND'
      '        CAB.CANAL = A.CANAL AND'
      '        CAB.CUENTA = A.CUENTA AND'
      '        A.PGC = CAN.PGC) AS TITULO'
      'FROM EMP_CARTERA CAB'
      
        'JOIN EMP_CARTERA_DETALLE DET ON (CAB.ID_CARTERA = DET.ID_CARTERA' +
        ')'
      'JOIN SYS_TIPO_EFECTO EFE on (DET.TIPO_EFECTO = EFE.TIPO)'
      
        'JOIN EMP_CANALES CAN ON (CAB.EMPRESA = CAN.EMPRESA AND CAB.EJERC' +
        'ICIO = CAN.EJERCICIO AND CAB.CANAL = CAN.CANAL)'
      'WHERE'
      'CAB.ID_DOC = :ID_S AND'
      'CAB.DOC_TIPO = '#39'FAC'#39' AND'
      'CAB.ORIGEN_IMPAGADO = 0'
      'ORDER BY DET.VENCIMIENTO')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 32
    Top = 488
  end
  object xDireccion_Cliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM UT_JUSTIFICA_DOMICILIO_3(:TERCERO, :CLIENTE, :ID_S, 0)'
      'WHERE'
      '((NUM = :DIRECCION) OR (NUM = 0))')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 32
    Top = 680
  end
  object xNotasCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES_CUENTAS'
      'where cliente=?cliente and empresa=?empresa and'
      '           ejercicio=?ejercicio and canal=?canal')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 488
    Top = 640
  end
  object xDireccionFiscal: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO (?tercero)'
      'where (num=1)')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 488
    Top = 728
  end
  object xNombreIva: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_IVA'
      'where (pais=?pais) and (tipo=?tipo)')
    UniDirectional = False
    Left = 32
    Top = 728
  end
  object xTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TERCEROS'
      '  where tercero=?tercero')
    UniDirectional = False
    DataSource = DSxCliente
    Left = 32
    Top = 392
  end
  object xTransportistas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_TRANSPORTISTAS'
      'WHERE EMPRESA=?EMPRESA AND '
      'TRANSPORTISTA=?TRANSPORTISTA')
    UniDirectional = False
    DataSource = DSCabecera
    Plan.Strings = (
      
        'PLAN JOIN (VER_TRANSPORTISTAS EA INDEX (PK_EMP_ACREEDORES),VER_T' +
        'RANSPORTISTAS ST INDEX (PK_SYS_TERCEROS))')
    Left = 488
    Top = 688
  end
  object xEntidad: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SYS_BANCOS'
      'WHERE'
      'PAIS = :PAIS AND'
      'ENTIDAD = :ENTIDAD   ')
    UniDirectional = False
    DataSource = DSxDatosBancarios
    Left = 488
    Top = 544
  end
  object xDatosBancarios: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TERCEROS_BANCOS'
      'where (tercero=?tercero)'
      ' and ((modo=0) or (modo=2)) and (activa=1)'
      'order by orden')
    UniDirectional = False
    DataSource = DSxCliente
    AfterOpen = xDatosBancariosAfterOpen
    BeforeClose = xDatosBancariosBeforeClose
    Left = 488
    Top = 496
  end
  object xRuta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM EMP_AGRUPACIONES_CLI'
      'WHERE EMPRESA=?EMPRESA AND CLIENTE=?CLIENTE')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 32
    Top = 344
  end
  object xTerceroBanco: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'SELECT ORDEN, CAST(BANCO AS INTEGER) BANCO, TITULO, ENTIDAD, SUC' +
        'URSAL, CONTROL, CUENTA, IBAN, BIC, PAIS'
      'FROM SYS_TERCEROS_BANCOS'
      'WHERE'
      'TERCERO = :TERCERO AND'
      'MODO IN (0, 2) AND'
      '((:BANCO_CLI = 0) OR (BANCO = :BANCO_CLI)) AND'
      'ACTIVA = 1'
      ''
      'UNION'
      ''
      
        'SELECT CAST(1 AS SMALLINT) ORDEN, BANCO, CAST(SUBSTRING(TITULO F' +
        'ROM 1 FOR 40) AS VARCHAR(40)) TITULO, ENTIDAD, SUCURSAL,'
      '       CONTROL, CUENTA_CORRIENTE, IBAN, BIC, PAIS'
      'FROM EMP_BANCOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'BANCO = :BANCO AND'
      'ACTIVO = 1'
      'ORDER BY 1')
    UniDirectional = False
    AfterOpen = xTerceroBancoAfterOpen
    BeforeClose = xTerceroBancoBeforeClose
    Left = 488
    Top = 296
  end
  object xDatosIva: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_CABECERAS_S_REDONDEOS'
      'WHERE'
      'ID_S = :ID_S'
      'ORDER BY TIPO_IVA')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 32
    Top = 296
  end
  object xAgente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT ag.*,dir.dir_completa_n,loc.titulo as LOCALIDAD,dir.dir_t' +
        'elefono01,'
      'prov.titulo as PROVINCIA'
      ' FROM VER_AGENTES ag'
      'join sys_terceros ter'
      'on (ter.tercero=ag.tercero)'
      'join sys_terceros_direcciones dir'
      'on (dir.tercero=ter.tercero and dir_defecto=1)'
      'join sys_localidades loc'
      'on(loc.id_local=dir.id_local)'
      'join sys_provincias prov'
      'on (prov.pais=loc.pais and prov.provincia=loc.provincia)'
      'where ag.empresa=?empresa and ag.agente=?agente')
    UniDirectional = False
    DataSource = DSCabecera
    Plan.Strings = (
      
        'PLAN JOIN (VER_AGENTES EA INDEX (PK_EMP_AGENTES),VER_AGENTES ST ' +
        'INDEX (PK_SYS_TERCEROS))')
    Left = 32
    Top = 248
  end
  object xFormaPago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT* FROM VER_FORMAS_PAGO_EMP'
      'WHERE EMPRESA=?EMPRESA AND'
      '               EJERCICIO=?EJERCICIO AND'
      '               CANAL=?CANAL AND'
      '               FORMA=?FORMA_PAGO'
      '')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 32
    Top = 200
  end
  object xCuenta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES_CUENTAS'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' '
      'and cliente=?cliente')
    UniDirectional = False
    DataSource = DSxCliente
    Left = 488
    Top = 440
  end
  object xCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'SELECT * FROM DAME_DATOS_CLIENTE(:EMPRESA, :EJERCICIO, :CLIENTE,' +
        ' :CANAL, :ID_S)')
    UniDirectional = False
    DataSource = DSCabecera
    Plan.Strings = (
      'PLAN JOIN (VER_CLIENTES CU INDEX (PK_CON_CUENTAS_GES_CLI),'
      
        'VER_CLIENTES EC INDEX (PK_EMP_CLIENTES),VER_CLIENTES ST INDEX (P' +
        'K_SYS_TERCEROS))')
    AfterOpen = xClienteAfterOpen
    BeforeClose = xClienteBeforeClose
    Left = 32
    Top = 152
  end
  object QMDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_FACTURA'
      'WHERE ID_S = ?ID_S AND TIPO_LINEA<>'#39'PRM'#39
      'order by orden')
    UniDirectional = False
    DataSource = DSCabecera
    Plan.Strings = (
      
        'PLAN JOIN (VER_DETALLE_FACTURA DET INDEX (GES_DETALLES_S_CAB_ID)' +
        ','
      
        '             VER_DETALLE_FACTURA FAC INDEX (GES_DETALLES_S_FAC_I' +
        'D)) ')
    AfterOpen = QMDetalleAfterOpen
    AfterScroll = QMDetalleAfterScroll
    BeforeClose = QMDetalleBeforeClose
    Left = 32
    Top = 104
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_FACTURA_LST'
      'WHERE'
      'ID_S = ?ID_S')
    UniDirectional = False
    Plan.Strings = (
      
        'PLAN JOIN (VER_CABECERAS_FACTURA CAB INDEX (GES_CABECERAS_S_ID),' +
        'VER_CABECERAS_FACTURA FAC INDEX (GES_CABECERAS_S_FAC_ID),VER_CAB' +
        'ECERAS_FACTURA TER INDEX (PK_SYS_TERCEROS))')
    AfterOpen = QMCabeceraAfterOpen
    AfterScroll = QMCabeceraAfterScroll
    BeforeClose = QMCabeceraBeforeClose
    Left = 32
    Top = 56
  end
  object HYRxTercero: THYReportSource
    DataSet = xTercero
    CloseDataset = True
    Left = 328
    Top = 392
  end
  object HYRDobleCabecera: THYReportSource
    DataSet = DobleCabecera
    CloseDataset = True
    Left = 728
    Top = 56
  end
  object HYRxDobFormaPago: THYReportSource
    DataSet = xDobFormaPago
    CloseDataset = True
    Left = 728
    Top = 104
  end
  object HYRxDobTerceroBan: THYReportSource
    DataSet = xDobTerceroBan
    CloseDataset = True
    Left = 328
    Top = 776
  end
  object HYRDobNomBan: THYReportSource
    DataSet = xDobNomBan
    CloseDataset = True
    Left = 328
    Top = 824
  end
  object xDobNotasClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES_CUENTAS'
      'where cliente=?cliente and empresa=?empresa and'
      '           ejercicio=?ejercicio and canal=?canal')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 488
    Top = 152
  end
  object DSxDobNotasClientes: TDataSource
    DataSet = xDobNotasClientes
    Left = 568
    Top = 152
  end
  object frDBxDobNotasClientes: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDobNotasClientes
    Left = 656
    Top = 152
  end
  object HYRxDobNotasClientes: THYReportSource
    DataSet = xDobNotasClientes
    CloseDataset = True
    Left = 728
    Top = 152
  end
  object DSxDobRecibos: TDataSource
    DataSet = xDobRecibos
    Left = 568
    Top = 200
  end
  object frDBxDobRecibos: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDobRecibos
    Left = 656
    Top = 200
  end
  object xDobRecibos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT CAB.EMPRESA, CAB.EJERCICIO, CAB.CANAL, CAB.SIGNO, CAB.REG' +
        'ISTRO, CAB.FECHA_REGISTRO, CAB.CUENTA, CAB.DOC_NUMERO,'
      
        '       CAB.DOC_SERIE, CAB.DOC_FECHA, DET.VENCIMIENTO, DET.LIQUID' +
        'O, DET.PAGADO, DET.TIPO_EFECTO, EFE.TITULO TITULO_TIPO_EFECTO,'
      '       (SELECT A.TITULO'
      '        FROM CON_CUENTAS A'
      '        WHERE'
      '        CAB.EMPRESA = A.EMPRESA AND'
      '        CAB.EJERCICIO = A.EJERCICIO AND'
      '        CAB.CANAL = A.CANAL AND'
      '        CAB.CUENTA = A.CUENTA AND'
      '        A.PGC = CAN.PGC) AS TITULO'
      'FROM EMP_CARTERA CAB'
      
        'JOIN EMP_CARTERA_DETALLE DET ON (CAB.ID_CARTERA = DET.ID_CARTERA' +
        ')'
      'JOIN SYS_TIPO_EFECTO EFE on (DET.TIPO_EFECTO = EFE.TIPO)'
      
        'JOIN EMP_CANALES CAN ON (CAB.EMPRESA = CAN.EMPRESA AND CAB.EJERC' +
        'ICIO = CAN.EJERCICIO AND CAB.CANAL = CAN.CANAL)'
      'WHERE'
      'CAB.ID_DOC = :ID_S AND'
      'CAB.DOC_TIPO = '#39'FAC'#39' AND'
      'CAB.ORIGEN_IMPAGADO = 0'
      'ORDER BY DET.VENCIMIENTO')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 488
    Top = 200
  end
  object xDobDireccionCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO (?tercero)'
      'where (num=?Direccion)')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 1248
    Top = 773
  end
  object DSxDobDireccionCliente: TDataSource
    DataSet = xDobDireccionCliente
    Left = 1336
    Top = 776
  end
  object frDBxDobDireccionCliente: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDobDireccionCliente
    Left = 1424
    Top = 776
  end
  object HYRDobRecibos: THYReportSource
    DataSet = xDobRecibos
    CloseDataset = True
    Left = 728
    Top = 200
  end
  object HYRDobDireccionCliente: THYReportSource
    DataSet = xDobDireccionCliente
    CloseDataset = True
    Left = 1520
    Top = 776
  end
  object xDobleIva: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_CABECERAS_S_REDONDEOS'
      'WHERE'
      'ID_S = :ID_S'
      'AND S_BASES <> 0'
      'ORDER BY TIPO_IVA')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 1248
    Top = 632
  end
  object HYRSDobleIva: THYReportSource
    DataSet = xDobleIva
    CloseDataset = True
    Left = 1352
    Top = 629
  end
  object xDobleRecibos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT CAB.EMPRESA, CAB.EJERCICIO, CAB.CANAL, CAB.SIGNO, CAB.REG' +
        'ISTRO, CAB.FECHA_REGISTRO, CAB.CUENTA, CAB.DOC_NUMERO,'
      
        '       CAB.DOC_SERIE, CAB.DOC_FECHA, DET.VENCIMIENTO, DET.LIQUID' +
        'O, DET.PAGADO, DET.TIPO_EFECTO, EFE.TITULO TITULO_TIPO_EFECTO,'
      '       CAB.ID_CARTERA, DET.ID_CARTERA_DETALLE, '
      '       (SELECT A.TITULO'
      '        FROM CON_CUENTAS A'
      '        WHERE'
      '        CAB.EMPRESA = A.EMPRESA AND'
      '        CAB.EJERCICIO = A.EJERCICIO AND'
      '        CAB.CANAL = A.CANAL AND'
      '        CAB.CUENTA = A.CUENTA AND'
      '        A.PGC = CAN.PGC) AS TITULO'
      'FROM EMP_CARTERA CAB'
      
        'JOIN EMP_CARTERA_DETALLE DET ON (CAB.ID_CARTERA = DET.ID_CARTERA' +
        ')'
      'JOIN SYS_TIPO_EFECTO EFE on (DET.TIPO_EFECTO = EFE.TIPO)'
      
        'JOIN EMP_CANALES CAN ON (CAB.EMPRESA = CAN.EMPRESA AND CAB.EJERC' +
        'ICIO = CAN.EJERCICIO AND CAB.CANAL = CAN.CANAL)'
      'WHERE'
      'CAB.ID_DOC = :ID_S AND'
      'CAB.DOC_TIPO = '#39'FAC'#39' AND'
      'CAB.ORIGEN_IMPAGADO = 0'
      'ORDER BY DET.VENCIMIENTO')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 488
    Top = 248
  end
  object HYRDobleRecibos: THYReportSource
    DataSet = xDobleRecibos
    CloseDataset = True
    Left = 728
    Top = 248
  end
  object SPObtenerVtos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM G_OBTENER_VENCIMIENTOS(?EMPRESA,?EJERCICIO,'
      ' ?CANAL,?SERIE,?RIG,'#39'C'#39',?MONEDA,?ID_S,?TIPO)')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 808
    Top = 728
  end
  object HYReportMail: THYReportMail
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    ValorCodigo = 1800
    ValorGrupo = 36
    DataSet = DMMain.QListados
    Opciones.Pagina.Margenes.Abajo = 0
    Opciones.Pagina.Margenes.Izquierda = 0
    Opciones.Pagina.Margenes.Derecha = 0
    Opciones.Pagina.Margenes.Arriba = 0
    Opciones.Pagina.Alto = 66
    Opciones.Pagina.Ancho = 80
    Opciones.Pagina.Tamanyo = 66
    Opciones.Pagina.SaltoPagina = True
    Opciones.Pagina.ImprimePrimeraCabecera = False
    Opciones.Pagina.ImprimeUltimoPie = False
    ControlaLongitud = True
    OnEnterFields = HYReportMailEnterFields
    Left = 408
    Top = 8
  end
  object HYMSCabecera: THYReportMailSource
    DataSet = QMCabecera
    CloseDataset = True
    Left = 408
    Top = 56
  end
  object HYMSDetalle: THYReportMailSource
    DataSet = QMDetalle
    CloseDataset = False
    Left = 408
    Top = 104
  end
  object HYMSxCliente: THYReportMailSource
    DataSet = xCliente
    CloseDataset = True
    Left = 408
    Top = 152
  end
  object HYMSxDireccionCliente: THYReportMailSource
    DataSet = xDireccion_Cliente
    CloseDataset = True
    Left = 408
    Top = 488
  end
  object HYMSDetalleIVA: THYReportMailSource
    DataSet = xDatosIva
    CloseDataset = True
    Left = 408
    Top = 296
  end
  object HYMSxFormaPago: THYReportMailSource
    DataSet = xFormaPago
    CloseDataset = True
    Left = 408
    Top = 200
  end
  object HYMSxAgente: THYReportMailSource
    DataSet = xAgente
    CloseDataset = True
    Left = 408
    Top = 248
  end
  object HYMSxNombreIVA: THYReportMailSource
    DataSet = xNombreIva
    CloseDataset = True
    Left = 1440
    Top = 728
  end
  object HYMSRuta: THYReportMailSource
    DataSet = xRuta
    CloseDataset = True
    Left = 408
    Top = 344
  end
  object HYMSxTercero: THYReportMailSource
    DataSet = xTercero
    CloseDataset = True
    Left = 408
    Top = 392
  end
  object HYMDobleCabecera: THYReportMailSource
    DataSet = DobleCabecera
    CloseDataset = True
    Left = 808
    Top = 56
  end
  object HYMxDobTerceroBan: THYReportMailSource
    DataSet = xDobTerceroBan
    CloseDataset = True
    Left = 408
    Top = 776
  end
  object HYMDobRecibos: THYReportMailSource
    DataSet = xDobRecibos
    CloseDataset = True
    Left = 808
    Top = 200
  end
  object HYMxDobFormaPago: THYReportMailSource
    DataSet = xDobFormaPago
    CloseDataset = True
    Left = 808
    Top = 104
  end
  object HYMxDobNotasClientes: THYReportMailSource
    DataSet = xDobNotasClientes
    CloseDataset = True
    Left = 808
    Top = 152
  end
  object HYMDobDireccionCliente: THYReportMailSource
    DataSet = xDobDireccionCliente
    CloseDataset = True
    Left = 1472
    Top = 776
  end
  object HYMSDobleIva: THYReportMailSource
    DataSet = xDobleIva
    CloseDataset = True
    Left = 408
    Top = 536
  end
  object HYMDobNomBan: THYReportMailSource
    DataSet = xDobNomBan
    CloseDataset = True
    Left = 408
    Top = 824
  end
  object HYMDobreRecibos: THYReportMailSource
    DataSet = xDobleRecibos
    CloseDataset = True
    Left = 808
    Top = 248
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
    Left = 32
    Top = 8
  end
  object HYRSxCuenta: THYReportSource
    DataSet = xCuenta
    CloseDataset = True
    Left = 728
    Top = 440
  end
  object xNroSerie: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT S.ARTICULO, A.TITULO, LIST(S.NSERIE, '#39', '#39')'
      'FROM VER_DETALLE_SERIALIZACION S'
      
        'JOIN ART_ARTICULOS A ON S.EMPRESA = A.EMPRESA AND S.ARTICULO = A' +
        '.ARTICULO '
      'WHERE '
      'S.EMPRESA = :EMPRESA AND '
      'S.EJERCICIO = :EJERCICIO AND '
      'S.CANAL = :CANAL AND '
      'S.SERIE = :SERIE AND '
      'S.TIPO = :TIPO AND '
      'S.RIG = :RIG AND '
      'S.LINEA = :LINEA'
      'GROUP BY S.ARTICULO, A.TITULO')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 32
    Top = 536
  end
  object DSxNroSerie: TDataSource
    DataSet = xNroSerie
    Left = 104
    Top = 536
  end
  object HYRSxNroSerie: THYReportSource
    DataSet = xNroSerie
    CloseDataset = True
    Left = 328
    Top = 536
  end
  object HYRSxRecibos: THYReportSource
    DataSet = xRecibos
    CloseDataset = True
    Left = 328
    Top = 488
  end
  object HYRSQSPProcedencia: THYReportSource
    DataSet = QSPProcedencia
    CloseDataset = True
    Left = 728
    Top = 344
  end
  object xLotes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_DETALLES_S_LOTES'
      'WHERE'
      'ID_DETALLES_S = :ID_DETALLES_S'
      'ORDER BY LOTE')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 32
    Top = 584
  end
  object DSxLotes: TDataSource
    DataSet = xLotes
    Left = 104
    Top = 584
  end
  object frDBxLotes: TfrDBDataSet
    DataSource = DSxLotes
    Left = 184
    Top = 584
  end
  object HYxLotes: THYReportSource
    DataSet = xLotes
    CloseDataset = True
    Left = 328
    Top = 584
  end
  object QSPProcedencia_kri: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM  G_PROCEDENCIA_DOCUMENTO_LINEA'
      '(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA)')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 912
    Top = 584
  end
  object DSQSPProcedencia_kri: TDataSource
    DataSet = QSPProcedencia_kri
    Left = 1016
    Top = 584
  end
  object QLoteKri: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT COUNT(*),EMPRESA,ARTICULO,CADUCIDAD,LOTE FROM NRO_SERIE_K' +
        'RI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      '/* ARTICULO = ?ARTICULO AND*/'
      ' EJERCICIO_SAL = ?EJERCICIO_S AND'
      ' CANAL_SAL = ?CANAL AND'
      ' SERIE_SAL = ?SERIE AND'
      ' RIG_SAL = ?RIG_S AND'
      ' LINEA_SAL = ?LINEA_S AND'
      ' LOTE>'#39#39
      'GROUP BY EMPRESA,ARTICULO,CADUCIDAD,LOTE, LINEA_SAL'
      ''
      'UNION'
      ''
      
        'SELECT COUNT(*),EMPRESA,ARTICULO,CADUCIDAD,LOTE FROM NRO_SERIE_K' +
        'RI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      '/* ARTICULO = ?ARTICULO AND*/'
      ' EJERCICIO_DEV = ?EJERCICIO_S AND'
      ' CANAL_DEV = ?CANAL AND'
      ' SERIE_DEV = ?SERIE AND'
      ' RIG_DEV = ?RIG_S AND'
      ' LINEA_DEV = ?LINEA_S AND'
      ' LOTE>'#39#39
      'GROUP BY EMPRESA,ARTICULO,CADUCIDAD,LOTE, LINEA_DEV')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 808
    Top = 632
  end
  object QNroSerieKri: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT EMPRESA,ARTICULO,NRO_SERIE FROM NRO_SERIE_KRI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      '/* ARTICULO = ?ARTICULO AND*/'
      ' EJERCICIO_SAL = ?EJERCICIO_S AND'
      ' CANAL_SAL = ?CANAL AND'
      ' SERIE_SAL = ?SERIE AND'
      ' RIG_SAL = ?RIG_S AND'
      ' LINEA_SAL = ?LINEA_S'
      ''
      'UNION'
      ''
      'SELECT EMPRESA,ARTICULO,NRO_SERIE FROM NRO_SERIE_KRI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      '/* ARTICULO = ?ARTICULO AND*/'
      ' EJERCICIO_DEV = ?EJERCICIO_S AND'
      ' CANAL_DEV = ?CANAL AND'
      ' SERIE_DEV = ?SERIE AND'
      ' RIG_DEV = ?RIG_S AND'
      ' LINEA_DEV = ?LINEA_S')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 808
    Top = 680
  end
  object QSPProcedencia2_kri: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'SELECT R.O_EMPRESA, R.O_EJERCICIO, R.O_CANAL, R.O_SERIE, R.O_TIP' +
        'O, R.O_RIG, C.SU_REFERENCIA'
      'FROM GES_CABECERAS_RELACIONES R'
      'LEFT JOIN GES_CABECERAS_S C ON R.O_ID_S = C.ID_S'
      'WHERE'
      'R.D_EMPRESA = :EMPRESA AND'
      'R.D_EJERCICIO = :EJERCICIO AND'
      'R.D_CANAL = :CANAL AND'
      'R.D_SERIE = :SERIE AND'
      'R.D_TIPO = :TIPO AND'
      'R.D_RIG = :RIG')
    UniDirectional = True
    Left = 808
    Top = 488
  end
  object xDireccionKRI: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO (?tercero)'
      'where (num=?Direccion)')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 1248
    Top = 725
  end
  object DSxDireccionKRI: TDataSource
    DataSet = xDireccionKRI
    Left = 1336
    Top = 728
  end
  object HYRxDirecionKRI: THYReportSource
    DataSet = xDireccionKRI
    CloseDataset = True
    Left = 1528
    Top = 728
  end
  object xDireccionesNIF: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
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
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'SERIE = ?SERIE AND'
      'TIPO = ?TIPO AND'
      'RIG = ?RIG')
    UniDirectional = True
    DataSource = DSCabecera
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG ')
    Opciones = []
    AutoSQLdeVistas = False
    TableName = 'GES_CABECERAS_S_FAC_NIF'
    Left = 1144
    Top = 8
  end
  object xDobDireccionesNIF: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
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
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'SERIE = ?SERIE AND'
      'TIPO = ?TIPO AND'
      'RIG = ?RIG')
    UniDirectional = True
    DataSource = DSDobleCabecera
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG ')
    Opciones = []
    AutoSQLdeVistas = False
    TableName = 'GES_CABECERAS_S_FAC_NIF'
    Left = 1144
    Top = 56
  end
  object xAutofactura: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select'
      'gcs.empresa,gcs.ejercicio,gcs.canal,gcs.serie,gcs.tipo,gcs.rig,'
      
        'gcef.empresa,gcef.ejercicio,gcef.canal,gcef.serie,gcef.tipo,gcef' +
        '.rig,'
      'st.tercero,st.nombre_r_social'
      'from ges_cabeceras_s gcs'
      'join ges_cabeceras_s_fac gcsf'
      'on'
      'gcs.id_s = gcsf.id_s'
      'join ges_cabeceras_e_fac gcef '
      'on '
      'gcsf.empresa = gcef.empresa and'
      'gcsf.ejercicio = gcef.ejercicio and'
      'gcsf.canal = gcef.canal and'
      'gcsf.serie = gcef.serie_autofactura and'
      #39'FAP'#39' = gcef.tipo and'
      'gcsf.rig = gcef.autofactura'
      'join sys_terceros st '
      'on'
      'gcef.tercero = st.tercero'
      'where'
      'gcs.empresa = ?empresa and'
      'gcs.ejercicio = ?ejercicio and'
      'gcs.canal=  ?canal and'
      'gcs.serie = ?serie and'
      'gcs.tipo = ?tipo and'
      'gcs.rig = ?rig and'
      'gcsf.autofactura <> 0 and'
      'gcef.autofactura <> 0'
      ''
      'union'
      ''
      'select '
      'gcs.empresa,gcs.ejercicio,gcs.canal,gcs.serie,gcs.tipo,gcs.rig,'
      
        'gcef.empresa,gcef.ejercicio,gcef.canal,gcef.serie,gcef.tipo,gcef' +
        '.rig,'
      'st.tercero,st.nombre_r_social'
      'from ges_cabeceras_s gcs'
      'join ges_cabeceras_s_fac gcsf'
      'on'
      'gcs.id_s = gcsf.id_s'
      'join ges_cabeceras_e_fcr gcef '
      'on '
      'gcsf.empresa = gcef.empresa and'
      'gcsf.ejercicio = gcef.ejercicio and'
      'gcsf.canal = gcef.canal and'
      'gcsf.serie = gcef.serie_autofactura and'
      #39'FCR'#39' = gcef.tipo and'
      'gcsf.rig = gcef.autofactura'
      'join sys_terceros st '
      'on'
      'gcef.tercero = st.tercero '
      'where'
      'gcs.empresa = ?empresa and'
      'gcs.ejercicio = ?ejercicio and'
      'gcs.canal=  ?canal and'
      'gcs.serie = ?serie and'
      'gcs.tipo = ?tipo and'
      'gcs.rig = ?rig and'
      'gcsf.autofactura <> 0 and'
      'gcef.autofactura <> 0'
      ''
      '')
    UniDirectional = True
    DataSource = DSCabecera
    Left = 808
    Top = 584
  end
  object xDobDireccionAlbKri: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM UT_JUSTIFICA_DOMICILIO(:TERCERO)'
      'WHERE'
      '(NUM IN (SELECT CAB.DIRECCION'
      '         FROM GES_CABECERAS_S CAB'
      
        '         JOIN GES_CABECERAS_RELACIONES REL ON CAB.ID_S = REL.O_I' +
        'D_S'
      '         WHERE'
      '         D_EMPRESA = :EMPRESA AND'
      '         D_EJERCICIO = :EJERCICIO AND'
      '         D_CANAL = :CANAL AND'
      '         D_SERIE = :SERIE AND'
      '         D_TIPO = :TIPO AND'
      '         D_RIG = :RIG))')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 912
    Top = 344
  end
  object DSxDobDireccionAlbKri: TDataSource
    DataSet = xDobDireccionAlbKri
    Left = 1016
    Top = 344
  end
  object xDobleDireccionEDI: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO (?tercero)'
      'where num=?Direccion')
    UniDirectional = False
    Left = 912
    Top = 8
  end
  object DSxDobleDireccionEDI: TDataSource
    DataSet = xDobleDireccionEDI
    Left = 1016
    Top = 8
  end
  object xUpdateaDocumentos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    UniDirectional = False
    Left = 808
    Top = 536
  end
  object QGen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 1144
    Top = 152
  end
  object frDBxNroSerie: TfrDBDataSet
    DataSource = DSxNroSerie
    Left = 184
    Top = 536
  end
  object xEmpresa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM SYS_EMPRESAS'
      '  where empresa=?empresa')
    UniDirectional = False
    DataSource = DSxCliente
    Left = 912
    Top = 632
  end
  object DSxEmpresa: TDataSource
    DataSet = xEmpresa
    Left = 1016
    Top = 632
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_CUENTAS '
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND '
      'ARTICULO=?ARTICULO')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 488
    Top = 8
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 568
    Top = 8
  end
  object frDBxArticulos: TfrDBDataSet
    DataSource = DSxArticulos
    Left = 656
    Top = 8
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 912
    Top = 536
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 1016
    Top = 536
  end
  object xMonedasIdiomas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO'
      'FROM SYS_MONEDAS_IDIOMAS'
      'WHERE MONEDA=?MONEDA AND IDIOMA=?IDIOMA')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 912
    Top = 440
  end
  object DSxMonedasIdiomas: TDataSource
    DataSet = xMonedasIdiomas
    Left = 1016
    Top = 440
  end
  object DSxNombreIvaIdioma: TDataSource
    DataSet = xNombreIvaIdioma
    Left = 1016
    Top = 488
  end
  object xNombreIvaIdioma: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_IVA_IDIOMAS'
      'where (pais=?pais) and (tipo=?tipo) and (idioma=?idioma)')
    UniDirectional = False
    Left = 912
    Top = 488
  end
  object xFormaPagoIdioma: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO '
      'FROM SYS_FORMAS_PAGO_IDIOMAS'
      'WHERE FORMA_PAGO=?FORMA_PAGO AND IDIOMA=?IDIOMA')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 912
    Top = 392
  end
  object DSxFormaPagoIdioma: TDataSource
    DataSet = xFormaPagoIdioma
    Left = 1016
    Top = 392
  end
  object HYRSxArticulos: THYReportSource
    DataSet = xArticulos
    CloseDataset = True
    Left = 728
    Top = 8
  end
  object frDBxGarantiasKri: TfrDBDataSet
    DataSource = DSxGarantiasKri
    Left = 656
    Top = 776
  end
  object DSxGarantiasKri: TDataSource
    DataSet = xGarantiasKri
    Left = 568
    Top = 776
  end
  object xGarantiasKri: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ART_GARANTIAS_REPARACION R'
      'LEFT JOIN ART_ARTICULOS A'
      'ON A.EMPRESA=R.EMPRESA AND A.ARTICULO=R.DETALLE'
      'WHERE'
      'R.ID_S_CAB=?ID_S'
      'ORDER BY R.ARTICULO,R.ORDEN')
    UniDirectional = False
    Left = 488
    Top = 776
  end
  object frDBPromociones: TfrDBDataSet
    DataSource = DSQMPromociones
    Left = 184
    Top = 632
  end
  object QMPromociones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_FACTURA'
      'WHERE '
      'ID_S=?ID_S AND '
      'ORIGEN=?ID_DETALLES_S AND '
      'TIPO_LINEA='#39'PRM'#39
      'order by orden')
    UniDirectional = False
    DataSource = DSDetalle
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_DETALLE_OFERTA_C DET INDEX (GES_DETALLES_S_' +
        'CAB_ID),'
      
        '                VER_DETALLE_OFERTA_C OFC INDEX (GES_DETALLES_S_O' +
        'FC_ID)))  '
      '')
    AfterOpen = QMPromocionesAfterOpen
    AfterScroll = QMPromocionesAfterScroll
    BeforeClose = QMPromocionesBeforeClose
    Left = 32
    Top = 632
  end
  object DSQMPromociones: TDataSource
    DataSet = QMPromociones
    Left = 104
    Top = 632
  end
  object xArticulosPRM: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_CUENTAS '
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND '
      'ARTICULO=?ARTICULO')
    UniDirectional = False
    DataSource = DSQMPromociones
    Left = 488
    Top = 592
  end
  object DSxArticulosPRM: TDataSource
    DataSet = xArticulosPRM
    Left = 568
    Top = 592
  end
  object frDBxArticulosPRM: TfrDBDataSet
    DataSource = DSxArticulosPRM
    Left = 656
    Top = 592
  end
  object frUDNotasArtPRM: TfrUserDataset
    OnCheckEOF = frUDNotasArtPRMCheckEOF
    OnFirst = frUDNotasArtPRMFirst
    OnNext = frUDNotasArtPRMNext
    Left = 1368
    Top = 56
  end
  object HYRSPromociones: THYReportSource
    DataSet = QMPromociones
    CloseDataset = True
    Left = 328
    Top = 632
  end
  object HYMSPromociones: THYReportMailSource
    DataSet = QMPromociones
    CloseDataset = True
    Left = 408
    Top = 632
  end
  object frxFactura: TfrxHYReport
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
    OnBeforePrint = frxFacturaBeforePrint
    OnGetValue = frxFacturaGetValue
    OnPrintReport = frxFacturaPrintReport
    OnProgressStart = frxFacturaProgressStart
    OnProgress = frxFacturaProgress
    OnProgressStop = frxFacturaProgressStop
    OnUserFunction = frxFacturaUserFunction
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 264
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDBDetalle: TfrxDBDataset
    UserName = 'frxDBDetalle'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = DSDetalle
    Left = 264
    Top = 104
  end
  object frxDBxNroSerie: TfrxDBDataset
    UserName = 'frxDBxNroSerie'
    CloseDataSource = False
    DataSource = DSxNroSerie
    Left = 256
    Top = 536
  end
  object frxDBPromociones: TfrxDBDataset
    UserName = 'frxDBPromociones'
    CloseDataSource = False
    DataSource = DSQMPromociones
    Left = 256
    Top = 632
  end
  object frxDBxDatosIva: TfrxDBDataset
    UserName = 'frxDBxDatosIva'
    CloseDataSource = False
    DataSource = DSxDatosIva
    Left = 264
    Top = 296
  end
  object frxDBxRecibos: TfrxDBDataset
    UserName = 'frxDBxRecibos'
    CloseDataSource = False
    DataSource = DSxRecibos
    Left = 256
    Top = 488
  end
  object frxDBCabecera: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSCabecera
    Left = 264
    Top = 56
  end
  object frxUDNotasArtPRM: TfrxUserDataSet
    UserName = 'frxUDNotasArtPRM'
    OnCheckEOF = frUDNotasArtPRMCheckEOF
    OnFirst = frUDNotasArtPRMFirst
    OnNext = frUDNotasArtPRMNext
    Left = 1368
    Top = 104
  end
  object xProyectos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMP_PROYECTOS'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'PROYECTO=?PROYECTO')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 912
    Top = 248
  end
  object DSxProyectos: TDataSource
    DataSet = xProyectos
    Left = 1016
    Top = 248
  end
  object xProyectosDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMP_PROYECTOS'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'PROYECTO=?PROYECTO')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 912
    Top = 296
  end
  object DSxProyectosDetalle: TDataSource
    DataSet = xProyectosDetalle
    Left = 1016
    Top = 296
  end
  object xHerenciaALB: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT R.O_EMPRESA, R.O_EJERCICIO, R.O_CANAL, R.O_SERIE, R.O_TIP' +
        'O, R.O_RIG, R.O_LINEA, C.SERIE, C.RIG, C.FECHA,'
      '       C.PEDIDO_CLIENTE, C.SU_REFERENCIA'
      'FROM GES_DETALLES_RELACIONES R'
      
        'JOIN GES_CABECERAS_S C ON C.EMPRESA = R.O_EMPRESA AND C.EJERCICI' +
        'O = R.O_EJERCICIO AND C.CANAL = R.O_CANAL AND C.SERIE = R.O_SERI' +
        'E AND C.TIPO = R.O_TIPO AND C.RIG = R.O_RIG'
      'WHERE'
      'R.D_EMPRESA = :EMPRESA AND'
      'R.D_EJERCICIO = :EJERCICIO AND'
      'R.D_CANAL = :CANAL AND'
      'R.D_SERIE = :SERIE AND'
      'R.D_TIPO = :TIPO AND'
      'R.D_RIG = :RIG AND'
      'R.D_LINEA = :LINEA')
    UniDirectional = False
    DataSource = DSDetalle
    AfterOpen = xHerenciaALBAfterOpen
    Left = 912
    Top = 56
  end
  object xHerenciaPEC: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT R.O_EMPRESA, R.O_EJERCICIO, R.O_CANAL, R.O_SERIE, R.O_TIP' +
        'O, R.O_RIG, R.O_LINEA, C.SERIE, C.RIG, C.FECHA,'
      '       C.PEDIDO_CLIENTE, C.SU_REFERENCIA'
      'FROM GES_DETALLES_RELACIONES R'
      
        'JOIN GES_CABECERAS_S C ON C.EMPRESA = R.O_EMPRESA AND C.EJERCICI' +
        'O = R.O_EJERCICIO AND C.CANAL = R.O_CANAL AND C.SERIE = R.O_SERI' +
        'E AND C.TIPO = R.O_TIPO AND C.RIG = R.O_RIG'
      'WHERE'
      'R.D_EMPRESA = :O_EMPRESA AND'
      'R.D_EJERCICIO = :O_EJERCICIO AND'
      'R.D_CANAL = :O_CANAL AND'
      'R.D_SERIE = :O_SERIE AND'
      'R.D_TIPO = :O_TIPO AND'
      'R.D_RIG = :O_RIG AND'
      'R.D_LINEA = :O_LINEA')
    UniDirectional = False
    DataSource = DSxHerenciaALB
    AfterOpen = xHerenciaPECAfterOpen
    Left = 912
    Top = 104
  end
  object xHerenciaOFC: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT O_EMPRESA, O_EJERCICIO, O_CANAL, O_SERIE, O_TIPO, O_RIG, ' +
        'O_LINEA FROM GES_DETALLES_RELACIONES'
      'WHERE'
      'D_EMPRESA=?O_EMPRESA AND'
      'D_EJERCICIO=?O_EJERCICIO AND'
      'D_CANAL=?O_CANAL AND'
      'D_SERIE=?O_SERIE AND'
      'D_TIPO=?O_TIPO AND'
      'D_RIG=?O_RIG AND'
      'D_LINEA=?O_LINEA')
    UniDirectional = False
    DataSource = DSxHerenciaPEC
    Left = 912
    Top = 152
  end
  object DSxHerenciaALB: TDataSource
    DataSet = xHerenciaALB
    Left = 1016
    Top = 56
  end
  object DSxHerenciaPEC: TDataSource
    DataSet = xHerenciaPEC
    Left = 1016
    Top = 104
  end
  object DSxHerenciaOFC: TDataSource
    DataSet = xHerenciaOFC
    Left = 1016
    Top = 152
  end
  object DSDetalleUE: TDataSource
    DataSet = QMDetalleUE
    Left = 1448
    Top = 392
  end
  object QMDetalleUE: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select unidades, medida1, medida2, medida3, medida4, precio'
      'from ges_detalles_s_ue'
      'where'
      'empresa = ?empresa and'
      'ejercicio = ?ejercicio and'
      'canal = ?canal and'
      'serie = ?serie and'
      'tipo = ?tipo and'
      'rig = ?rig and'
      'linea = ?linea   ')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 1376
    Top = 392
  end
  object DSDireccionEntregaLinea: TDataSource
    DataSet = xDireccionEntregaLinea
    Left = 1352
    Top = 584
  end
  object xDireccionEntregaLinea: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO (?TERCERO)'
      'WHERE'
      'NUM = ?DIRECCION_ENTREGA')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 1248
    Top = 584
  end
  object DSCuota: TDataSource
    DataSet = xCuota
    Left = 1016
    Top = 680
  end
  object xCuota: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT DISTINCT A.ID_ALQ, C.*, D.LINEA AS NRO_CUOTA,'
      '       (SELECT FIRST 1 FECHA'
      '        FROM EMP_CLIENTES_CUOTAS_DETALLE_DOC'
      '        WHERE'
      '        EMPRESA = D.EMPRESA AND'
      '        CANAL = D.CANAL AND'
      '        CLIENTE = D.CLIENTE AND'
      '        CUOTA = D.CUOTA AND'
      '        LINEA = D.LINEA) FECHA_CUOTA,'
      '       (SELECT FIRST 1 FECHA'
      '        FROM EMP_CLIENTES_CUOTAS_DETALLE_DOC'
      '        WHERE'
      '        EMPRESA = D.EMPRESA AND'
      '        CANAL = D.CANAL AND'
      '        CLIENTE = D.CLIENTE AND'
      '        CUOTA = D.CUOTA AND'
      '        LINEA = D.LINEA - 1) FECHA_CUOTA_ANT'
      'FROM GES_CABECERAS_S F'
      'JOIN EMP_CLIENTES_CUOTAS_DETALLE_DOC D ON F.ID_S = D.ID_S'
      'JOIN EMP_CLIENTES_CUOTAS C ON D.ID_CUOTA = C.ID_CUOTA'
      'LEFT JOIN EMP_ALQUILER A ON A.ID_S_PEC = C.ID_ORIGEN'
      'WHERE'
      '-- ID DE LA FACTURA'
      'F.ID_S = :ID_S'
      '-- TIPO DE DOCUMENTO ORIGEN DEL LA CUOTA'
      '-- AND C.TIPO_ORIGEN = '#39'PEC'#39)
    UniDirectional = False
    DataSource = DSCabecera
    AfterOpen = xCuotaAfterOpen
    Left = 912
    Top = 680
  end
  object NrosSerieAlquiler: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 912
    Top = 728
    object NrosSerieAlquilerEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object NrosSerieAlquilerCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object NrosSerieAlquilerCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object NrosSerieAlquilerALMACEN: TStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object NrosSerieAlquilerARTICULO: TStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object NrosSerieAlquilerNSERIE: TStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 25
    end
    object NrosSerieAlquilerSELECCIONADO: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'SELECCIONADO'
    end
    object NrosSerieAlquilerUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
  end
  object DSNrosSerieAlquiler: TDataSource
    DataSet = NrosSerieAlquiler
    Left = 1016
    Top = 728
  end
  object frDBNrosSerieAlquiler: TfrDBDataSet
    CloseDataSource = True
    DataSet = NrosSerieAlquiler
    Left = 1120
    Top = 728
  end
  object xRecibosAnticipos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT C.*, D.*, T.TEXTO, T.OBSERVACIONES'
      'FROM E_CARTERA_BUSCA_FACTURA_LISTA(:ENTRADA) L'
      
        'JOIN EMP_CARTERA_DETALLE D ON L.ID_CARTERA_DET = D.ID_CARTERA_DE' +
        'TALLE'
      'JOIN EMP_CARTERA C ON D.ID_CARTERA = C.ID_CARTERA'
      'JOIN EMP_CARTERA_TEXTO T ON C.ID_CARTERA = T.ID_CARTERA'
      'WHERE'
      'C.DOC_TIPO = '#39'NRC'#39)
    UniDirectional = False
    Left = 912
    Top = 776
  end
  object DSxRecibosAnticipos: TDataSource
    DataSet = xRecibosAnticipos
    Left = 1016
    Top = 776
  end
  object xTotalRecibosAnticipos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      
        'SELECT SUM(LIQUIDO) AS TOTAL FROM E_CARTERA_BUSCA_FACTURA_LISTA(' +
        ':ENTRADA)')
    SelectSQL.Strings = (
      'SELECT SUM(D.LIQUIDO) TOTAL'
      'FROM E_CARTERA_BUSCA_FACTURA_LISTA(:ENTRADA) L'
      
        'JOIN EMP_CARTERA_DETALLE D ON L.ID_CARTERA_DET = D.ID_CARTERA_DE' +
        'TALLE'
      'JOIN EMP_CARTERA C ON D.ID_CARTERA = C.ID_CARTERA'
      'WHERE'
      'C.DOC_TIPO = '#39'NRC'#39)
    UniDirectional = False
    Left = 912
    Top = 824
  end
  object DSxTotalRecibosAnticipos: TDataSource
    DataSet = xTotalRecibosAnticipos
    Left = 1016
    Top = 824
  end
  object frDBxRecibosAnticipos: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxRecibosAnticipos
    Left = 1120
    Top = 776
  end
  object frDBxTotalRecibosAnticipos: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxTotalRecibosAnticipos
    Left = 1120
    Top = 824
  end
  object xLstFirmas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT ID_FIRMA, NOMBRE, NIF, FECHA, COMENTARIO FROM GES_FIRMAS'
      'WHERE'
      'TIPO = :TIPO AND'
      'ID_DOC = :ID_S AND'
      'OCTET_LENGTH(COALESCE(FIRMA, '#39#39')) > 10'
      'ORDER BY ID_FIRMA')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 1248
    Top = 682
  end
  object DSxLstFirmas: TDataSource
    DataSet = xLstFirmas
    Left = 1336
    Top = 682
  end
  object frDBDLstFirmas: TfrDBDataSet
    DataSource = DSxLstFirmas
    Left = 1440
    Top = 682
  end
  object frxDBxLstFirmas: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = xLstFirmas
    Left = 1528
    Top = 682
  end
  object frDBGrupoTalla: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSGrupoTalla
    Left = 1304
    Top = 200
  end
  object DSGrupoTalla: TDataSource
    DataSet = QMGrupoTalla
    Left = 1216
    Top = 200
  end
  object HYRSGrupoTalla: THYReportSource
    DataSet = QMGrupoTalla
    CloseDataset = True
    Left = 1440
    Top = 200
  end
  object QMGrupoTalla: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      '/* Se modifica dinamicamente */'
      ''
      
        '/* Los distintos grupos de talla que intervienen en el detalle d' +
        'el documento */'
      
        'SELECT DISTINCT X.ID_S, X.O_ID_S, X.ID_G_T, G.TITULO, X.O_DOC, C' +
        '.*'
      'FROM XVER_DETALLES_S_GR_RO_LST(:ID_S, 0, -1) X'
      'JOIN ART_GRUPOS_TALLAS G ON X.ID_G_T = G.ID_G_T'
      'LEFT JOIN GES_CABECERAS_S C ON X.O_ID_S = C.ID_S '
      'WHERE'
      
        '(ABS(COALESCE(X.T01, 0)) + ABS(COALESCE(X.T02, 0)) + ABS(COALESC' +
        'E(X.T03, 0)) +'
      
        'ABS(COALESCE(X.T04, 0)) + ABS(COALESCE(X.T05, 0)) + ABS(COALESCE' +
        '(X.T06, 0)) +'
      
        'ABS(COALESCE(X.T07, 0)) + ABS(COALESCE(X.T08, 0)) + ABS(COALESCE' +
        '(X.T09, 0)) +'
      
        'ABS(COALESCE(X.T10, 0)) + ABS(COALESCE(X.T11, 0)) + ABS(COALESCE' +
        '(X.T12, 0)) +'
      
        'ABS(COALESCE(X.T13, 0)) + ABS(COALESCE(X.T14, 0)) + ABS(COALESCE' +
        '(X.T15, 0)) +'
      
        'ABS(COALESCE(X.T16, 0)) + ABS(COALESCE(X.T17, 0)) + ABS(COALESCE' +
        '(X.T18, 0)) +'
      
        'ABS(COALESCE(X.T19, 0)) + ABS(COALESCE(X.T20, 0)) + ABS(COALESCE' +
        '(X.T21, 0)) +'
      'ABS(COALESCE(X.T22, 0))) > 0'
      'ORDER BY X.O_DOC, X.ID_G_T')
    UniDirectional = False
    DataSource = DSCabecera
    Plan.Strings = (
      
        'PLAN JOIN (VER_CABECERAS_FACTURA CAB INDEX (GES_CABECERAS_S_ID),' +
        'VER_CABECERAS_FACTURA FAC INDEX (GES_CABECERAS_S_FAC_ID),VER_CAB' +
        'ECERAS_FACTURA TER INDEX (PK_SYS_TERCEROS))')
    AfterOpen = QMGrupoTallaAfterOpen
    BeforeClose = QMGrupoTallaBeforeClose
    Left = 1144
    Top = 200
  end
  object HYRMGrupoTalla: THYReportMailSource
    DataSet = QMGrupoTalla
    CloseDataset = True
    Left = 1520
    Top = 200
  end
  object frxDBGrupoTalla: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSGrupoTalla
    Left = 1376
    Top = 200
  end
  object frDBTituloTalla: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSTituloTalla
    Left = 1304
    Top = 248
  end
  object DSTituloTalla: TDataSource
    DataSet = QMTituloTalla
    Left = 1216
    Top = 248
  end
  object HYRSTituloTalla: THYReportSource
    DataSet = QMTituloTalla
    CloseDataset = True
    Left = 1440
    Top = 248
  end
  object QMTituloTalla: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM XGET_TALLAS'
      'WHERE'
      'ID_G_T = :ID_G_T')
    UniDirectional = False
    DataSource = DSGrupoTalla
    Plan.Strings = (
      
        'PLAN JOIN (VER_CABECERAS_FACTURA CAB INDEX (GES_CABECERAS_S_ID),' +
        'VER_CABECERAS_FACTURA FAC INDEX (GES_CABECERAS_S_FAC_ID),VER_CAB' +
        'ECERAS_FACTURA TER INDEX (PK_SYS_TERCEROS))')
    Left = 1144
    Top = 248
  end
  object HYRMTituloTalla: THYReportMailSource
    DataSet = QMTituloTalla
    CloseDataset = True
    Left = 1520
    Top = 248
  end
  object frxDBTituloTalla: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSTituloTalla
    Left = 1376
    Top = 248
  end
  object frDBDetalleTallas: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSDetalleTallas
    Left = 1304
    Top = 296
  end
  object DSDetalleTallas: TDataSource
    DataSet = QMDetalleTallas
    Left = 1216
    Top = 296
  end
  object HYRSDetalleTallas: THYReportSource
    DataSet = QMDetalleTallas
    CloseDataset = True
    Left = 1440
    Top = 296
  end
  object QMDetalleTallas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      '/* Se modifica dinamicamente */'
      ''
      'SELECT X.*'
      'FROM XVER_DETALLES_S_GR_RO_LST(:ID_S, :ID_G_T, :O_ID_S) X'
      'WHERE'
      '-- Se pasa a parametro X.ID_G_T = :ID_G_T AND'
      'X.O_ID_S = :O_ID_S AND'
      '(ABS(COALESCE(X.T01, 0)) +'
      'ABS(COALESCE(X.T02, 0)) +'
      'ABS(COALESCE(X.T03, 0)) +'
      'ABS(COALESCE(X.T04, 0)) +'
      'ABS(COALESCE(X.T05, 0)) +'
      'ABS(COALESCE(X.T06, 0)) +'
      'ABS(COALESCE(X.T07, 0)) +'
      'ABS(COALESCE(X.T08, 0)) +'
      'ABS(COALESCE(X.T09, 0)) +'
      'ABS(COALESCE(X.T10, 0)) +'
      'ABS(COALESCE(X.T11, 0)) +'
      'ABS(COALESCE(X.T12, 0)) +'
      'ABS(COALESCE(X.T13, 0)) +'
      'ABS(COALESCE(X.T14, 0)) +'
      'ABS(COALESCE(X.T15, 0)) +'
      'ABS(COALESCE(X.T16, 0)) +'
      'ABS(COALESCE(X.T17, 0)) +'
      'ABS(COALESCE(X.T18, 0)) +'
      'ABS(COALESCE(X.T19, 0)) +'
      'ABS(COALESCE(X.T20, 0)) +'
      'ABS(COALESCE(X.T21, 0)) +'
      'ABS(COALESCE(X.T22, 0)))'
      ' > 0'
      
        'ORDER BY X.CAJA_EDI, X.GENERO, X.FAMILIA, X.SUBFAMILIA, X.REF_PR' +
        'OVEEDOR, X.S_COLOR')
    UniDirectional = False
    DataSource = DSGrupoTalla
    Plan.Strings = (
      
        'PLAN JOIN (VER_CABECERAS_FACTURA CAB INDEX (GES_CABECERAS_S_ID),' +
        'VER_CABECERAS_FACTURA FAC INDEX (GES_CABECERAS_S_FAC_ID),VER_CAB' +
        'ECERAS_FACTURA TER INDEX (PK_SYS_TERCEROS))')
    AfterOpen = QMDetalleTallasAfterOpen
    BeforeClose = QMDetalleTallasBeforeClose
    Left = 1144
    Top = 296
  end
  object HYRMDetalleTallas: THYReportMailSource
    DataSet = QMDetalleTallas
    CloseDataset = True
    Left = 1520
    Top = 296
  end
  object frxDBDetalleTallas: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSDetalleTallas
    Left = 1376
    Top = 296
  end
  object QMArticuloTallas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'SELECT EMPRESA, ARTICULO, TITULO_CORTO, ALFA_1, ALFA_2, ALFA_3, ' +
        'ALFA_4, ALFA_5, ALFA_6, ALFA_7, ALFA_8, PESO,'
      '       VOLUMEN_UNIT, DIAMETRO_UNIT'
      'FROM ART_ARTICULOS'
      'WHERE'
      'ID_A_M_C_T = (SELECT FIRST 1 ID_A_M_C_T'
      '              FROM ART_ARTICULOS_M_C_TALLAS'
      '              WHERE'
      '              ID_A_M_C = :ID_A_M_C'
      '              ORDER BY ID_A_M_C_T)')
    UniDirectional = True
    DataSource = DSDetalleTallas
    Left = 1144
    Top = 341
  end
  object DSArticuloTallas: TDataSource
    DataSet = QMArticuloTallas
    Left = 1240
    Top = 341
  end
  object xContacto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SYS_TERCEROS_CONTACTOS'
      'WHERE'
      'TERCERO = :TERCERO AND'
      'CONTACTO = :CONTACTO')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 1144
    Top = 390
  end
  object DSxContacto: TDataSource
    DataSet = xContacto
    Left = 1240
    Top = 390
  end
  object QMEscandallo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_ESCANDALLO'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'ARTICULO=?ARTICULO'
      'ORDER BY DETALLE')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 488
    Top = 824
  end
  object DSEscandallo: TDataSource
    DataSet = QMEscandallo
    Left = 568
    Top = 824
  end
  object frDBDEscandallo: TfrDBDataSet
    DataSource = DSEscandallo
    Left = 656
    Top = 824
  end
  object HYRSEscandallo: THYReportSource
    DataSet = QMEscandallo
    CloseDataset = True
    Left = 744
    Top = 816
  end
  object xTipoPorte: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TIPO, TITULO'
      'FROM CON_CUENTAS_GES_PORTES'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'TIPO = :TIPO_PORTES')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 1144
    Top = 437
  end
  object DSxTipoPorte: TDataSource
    DataSet = xTipoPorte
    Left = 1240
    Top = 437
  end
  object xDobTipoPorte: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TIPO, TITULO'
      'FROM CON_CUENTAS_GES_PORTES'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'TIPO = :TIPO_PORTES')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 1144
    Top = 485
  end
  object DSxDobTipoPorte: TDataSource
    DataSet = xDobTipoPorte
    Left = 1240
    Top = 485
  end
  object xReferenciaDte: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SII_DTE_REFERENCIA'
      'WHERE'
      '((ID_S = :ID_S) AND'
      '(TPODOCREF <> :TIPO_DOC_TRIBUTARIO)AND'
      '(FOLIOREF <> :FOLIO))')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 32
    Top = 872
  end
  object DSxReferenciaDte: TDataSource
    DataSet = xReferenciaDte
    Left = 104
    Top = 874
  end
  object frDBxReferenciaDte: TfrDBDataSet
    DataSource = DSxReferenciaDte
    Left = 184
    Top = 872
  end
  object xArticulosIdioma: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO,DESCRIPCION_EXTENDIDA FROM ART_ARTICULOS_IDIOMAS'
      'WHERE '
      'EMPRESA=?EMPRESA AND'
      'ARTICULO=?ARTICULO AND '
      'IDIOMA=?IDIOMA')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 1144
    Top = 532
  end
  object DSxArticulosIdioma: TDataSource
    DataSet = xArticulosIdioma
    Left = 1248
    Top = 532
  end
  object frDBxArticulosIdioma: TfrDBDataSet
    DataSource = DSxArticulosIdioma
    Left = 1352
    Top = 532
  end
  object xArticuloTYC: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'SELECT A.EMPRESA, A.ARTICULO, A.TITULO_LARGO TITULO_ARTICULO, MC' +
        '.COD_COLOR, MC.S_COLOR, C.TITULO TITULO_COLOR,'
      
        '       T.COD_TALLA, T.TALLA, T.TITULO TITULO_TALLA, M.TITULO TIT' +
        'ULO_MODELO, M.REF_CLIENTE, M.AGNO, M.TEMPORADA,'
      
        '       M.SECCION, M.REF_PROVEEDOR, M.CODIGO_GENERO, M.CODIGO_TEM' +
        'PORADA'
      'FROM ART_ARTICULOS A'
      'JOIN ART_ARTICULOS_M_C_TALLAS MCT ON A.ARTICULO = MCT.ARTICULO'
      'JOIN ART_ARTICULOS_MOD_COLOR MC ON MC.ID_A_M_C = MCT.ID_A_M_C'
      'JOIN ART_ARTICULOS_MODELOS M ON M.ID_A_M = MC.ID_A_M'
      'JOIN ART_COLORES C ON MC.ID_A_C = C.ID_A_C'
      'JOIN ART_TALLAS T ON MCT.ID_A_T = T.ID_A_T'
      'WHERE'
      'A.EMPRESA = :EMPRESA AND'
      'A.ARTICULO = :ARTICULO AND'
      '-- SOLO ARTICULOS QUE VIENEN DE MODELOS DE TALLAS Y COLORES'
      'A.ID_A_M_C_T > 0')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 1384
    Top = 436
  end
  object DSxArticuloTYC: TDataSource
    DataSet = xArticuloTYC
    Left = 1472
    Top = 436
  end
  object xDobleContacto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SYS_TERCEROS_CONTACTOS'
      'WHERE'
      'TERCERO = :TERCERO AND'
      'CONTACTO = :CONTACTO')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 1376
    Top = 344
  end
  object DSxDobleContacto: TDataSource
    DataSet = xDobleContacto
    Left = 1464
    Top = 344
  end
  object DobleLetras: TLetra
    Decimales = 2
    GeneroMasculino = True
    LongLinea = 92
    LongPrimeraLinea = 80
    Separador = ','
    Relleno = '*'
    Moneda = 'Eur.'
    DescDecimales = 'c'#233'ntimos'
    ModoDecimales = 0
    Left = 1376
    Top = 480
  end
  object QMDetallePorClienteOrigen: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT O.CLIENTE AS CLIENTE_ORIGEN, T.NOMBRE_R_SOCIAL AS NOMBRE_' +
        'R_SOCIAL_ORIGEN,'
      '       --'
      
        '       SUM(O.BRUTO) BRUTO, SUM(O.I_DTO_LINEAS) I_DTO_LINEAS, SUM' +
        '(O.S_BASES) S_BASES, SUM(O.S_CUOTA_IVA) S_CUOTA_IVA,'
      
        '       SUM(O.S_CUOTA_RE) S_CUOTA_RE, SUM(I_FINANCIACION) I_FINAN' +
        'CIACION, SUM(O.I_DTO_PP) I_DTO_PP,'
      
        '       SUM(I_DTO_CIAL) I_DTO_CIAL, SUM(O.B_DTO_LINEAS) B_DTO_LIN' +
        'EAS, SUM(I_PORTES) I_PORTES, SUM(O.LIQUIDO) LIQUIDO,'
      
        '       SUM(S_CUOTA_IMPUESTO_ADICIONAL) S_CUOTA_IMPUESTO_ADICIONA' +
        'L,'
      '       --'
      
        '       LIST(O.SERIE || '#39' '#39' || O.RIG) LST_DOCUMENTOS_ORIGEN, LIST' +
        '(O.SU_REFERENCIA) LST_SU_REFERENCIA_ORIGEN,'
      '       LIST(O.PEDIDO_CLIENTE) LST_PEDIDO_CLIENTE_ORIGEN'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_CABECERAS_RELACIONES R ON C.ID_S = R.D_ID_S'
      'JOIN GES_CABECERAS_S O ON O.ID_S = R.O_ID_S'
      'JOIN SYS_TERCEROS T ON T.TERCERO = O.TERCERO'
      'WHERE'
      'C.ID_S = :ID_S'
      'GROUP BY O.CLIENTE, T.NOMBRE_R_SOCIAL')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 488
    Top = 896
  end
  object DSQMDetallePorClienteOrigen: TDataSource
    DataSet = QMDetallePorClienteOrigen
    Left = 632
    Top = 896
  end
  object frDBQMDetallePorClienteOrigen: TfrDBDataSet
    DataSource = DSQMDetallePorClienteOrigen
    Left = 792
    Top = 896
  end
  object frxDBQMDetallePorClienteOrigen: TfrxDBDataset
    UserName = 'frxDBQMDetallePorClienteOrigen'
    CloseDataSource = False
    DataSource = DSQMDetallePorClienteOrigen
    Left = 952
    Top = 896
  end
  object xCabReparacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_REPAR_CAB_REPARACIONES'
      'WHERE'
      'ID_S = :ID_S')
    UniDirectional = False
    DataSource = DSCabecera
    AfterOpen = xCabReparacionAfterOpen
    BeforeClose = xCabReparacionBeforeClose
    Left = 912
    Top = 872
  end
  object DSxCabReparacion: TDataSource
    DataSet = xCabReparacion
    Left = 1016
    Top = 872
  end
  object frDBxCabReparacion: TfrDBDataSet
    DataSource = DSxCabReparacion
    Left = 1120
    Top = 872
  end
  object frxDBxCabReparacion: TfrxDBDataset
    UserName = 'frxDBxCliente'
    CloseDataSource = False
    DataSource = DSxCabReparacion
    Left = 1224
    Top = 872
  end
  object xRecepcion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_REP_RECEPCION'
      'WHERE'
      'ID_REP_RECEPCION = :ID_REP_RECEPCION')
    UniDirectional = False
    DataSource = DSxCabReparacion
    Left = 1336
    Top = 824
  end
  object frxDBxRecepcion: TfrxDBDataset
    UserName = 'frxDBxRecepcion'
    CloseDataSource = False
    DataSource = DSxRecepcion
    Left = 1648
    Top = 824
  end
  object frDBxRecepcion: TfrDBDataSet
    DataSource = DSxRecepcion
    Left = 1544
    Top = 824
  end
  object DSxRecepcion: TDataSource
    DataSet = xRecepcion
    Left = 1440
    Top = 824
  end
  object xFichaTecnica: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_FICHA_TECNICA'
      'WHERE'
      'ID_FICHA_TECNICA= :ID_FICHA_TECNICA')
    UniDirectional = False
    DataSource = DSxCabReparacion
    Left = 1336
    Top = 872
  end
  object DSxFichaTecnica: TDataSource
    DataSet = xFichaTecnica
    Left = 1440
    Top = 872
  end
  object frDBxFichaTecnica: TfrDBDataSet
    DataSource = DSxFichaTecnica
    Left = 1544
    Top = 872
  end
  object frxDBxFichaTecnica: TfrxDBDataset
    UserName = 'frxDBxFichaTecnica'
    CloseDataSource = False
    DataSource = DSxFichaTecnica
    Left = 1648
    Top = 872
  end
  object xVerifactu: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT INFO_QR'
      'FROM VF_REGISTRO_ALTA'
      'WHERE'
      'ID_S = :ID_S')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 1472
    Top = 512
  end
  object DSxVerifactu: TDataSource
    DataSet = xVerifactu
    Left = 1576
    Top = 512
  end
  object xECF: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      
        'SELECT DOCUMENT_STAMP_URL, STAMP_DATE, SECURITY_CODE FROM GES_CA' +
        'BECERAS_S_FAC_DGII'
      'WHERE ID_S = :ID_S')
    SelectSQL.Strings = (
      
        'SELECT DOCUMENT_STAMP_URL, STAMP_DATE, SECURITY_CODE FROM GES_CA' +
        'BECERAS_S_FAC_DGII'
      'WHERE ID_S = :ID_S')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 1480
    Top = 576
    object xECFDOCUMENT_STAMP_URL: TFIBStringField
      FieldName = 'DOCUMENT_STAMP_URL'
      Size = 500
    end
    object xECFSTAMP_DATE: TFIBStringField
      FieldName = 'STAMP_DATE'
    end
    object xECFSECURITY_CODE: TFIBStringField
      FieldName = 'SECURITY_CODE'
    end
  end
  object DSxECF: TDataSource
    DataSet = xECF
    Left = 1576
    Top = 576
  end
end
