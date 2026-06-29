object DMLstAlbaranes: TDMLstAlbaranes
  OldCreateOrder = False
  OnCreate = DMLstAlbaranesCreate
  OnDestroy = DMLstAlbaranesDestroy
  Left = 52
  Top = 22
  Height = 925
  Width = 1894
  object frAlbaranes: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnBeginDoc = frAlbaranesBeginDoc
    OnGetValue = frAlbaranesGetValue
    OnBeforePrint = frAlbaranesEnterRect
    OnEnterRect = frAlbaranesEnterRect
    OnUserFunction = frAlbaranesUserFunction
    OnPrintReport = frAlbaranesPrintReport
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 16
    Top = 5
    ReportForm = {19000000}
  end
  object frDBDetalle: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSDetalle
    Left = 200
    Top = 101
  end
  object DSDetalle: TDataSource
    DataSet = QMDetalle
    Left = 104
    Top = 101
  end
  object DSxCliente: TDataSource
    DataSet = xCliente
    Left = 104
    Top = 197
  end
  object frUDPie: TfrUserDataset
    RangeEnd = reCount
    RangeEndCount = 1
    Left = 1344
    Top = 245
  end
  object frUDNotasArt: TfrUserDataset
    OnCheckEOF = frUDNotasArtCheckEOF
    OnFirst = frUDNotasArtFirst
    OnNext = frUDNotasArtNext
    Left = 1344
    Top = 197
  end
  object frDBxTransportista: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxTransportistas
    Left = 200
    Top = 293
  end
  object frDBxDireccion_Cliente: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDireccion_Cliente
    Left = 200
    Top = 677
  end
  object DSxDireccion_Cliente: TDataSource
    DataSet = xDireccion_Cliente
    Left = 104
    Top = 677
  end
  object DSxTransportistas: TDataSource
    DataSet = xTransportistas
    Left = 104
    Top = 293
  end
  object DSQSPProcedencia: TDataSource
    DataSet = QSPProcedencia
    Left = 104
    Top = 581
  end
  object frDBQSPProcedencia: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSQSPProcedencia
    Left = 200
    Top = 581
  end
  object frDBxNotasCliente: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxNotasCliente
    Left = 200
    Top = 389
  end
  object DSxNotasCliente: TDataSource
    DataSet = xNotasCliente
    Left = 104
    Top = 389
  end
  object DSxRuta: TDataSource
    DataSet = xRuta
    Left = 104
    Top = 341
  end
  object frDBxRuta: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxRuta
    Left = 200
    Top = 341
  end
  object DSxDireccionFiscal: TDataSource
    DataSet = xDireccionFiscal
    Left = 104
    Top = 725
  end
  object frDBxDireccionFiscal: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDireccionFiscal
    Left = 200
    Top = 725
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 104
    Top = 5
  end
  object HYReport: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 1994
    ValorGrupo = 34
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
    Titulo = 'Albar'#225'n de Clientes'
    ControlaLongitud = True
    OnEnterFields = HYReportEnterFields
    OnLengthBands = HYReportLengthBands
    OnPrepareFields = HYReportPrepareFields
    OnPrintReport = HYReportPrintReport
    Left = 408
    Top = 5
  end
  object HYRSCabecera: THYReportSource
    DataSet = QMCabecera
    CloseDataset = True
    Left = 408
    Top = 53
  end
  object HYRSxCliente: THYReportSource
    DataSet = xCliente
    CloseDataset = True
    Left = 408
    Top = 197
  end
  object HYRSxDirCliente: THYReportSource
    DataSet = xDireccion_Cliente
    CloseDataset = True
    Left = 408
    Top = 685
  end
  object HYRSDetalle: THYReportSource
    DataSet = QMDetalle
    CloseDataset = True
    Left = 408
    Top = 101
  end
  object HYRSDetalleIVA: THYReportSource
    DataSet = xDatosIva
    CloseDataset = True
    Left = 408
    Top = 541
  end
  object DSxCuenta: TDataSource
    DataSet = xCuenta
    Left = 1048
    Top = 101
  end
  object HYRSTransportista: THYReportSource
    DataSet = xTransportistas
    CloseDataset = True
    Left = 408
    Top = 293
  end
  object DSxTercero: TDataSource
    DataSet = xTercero
    Left = 104
    Top = 629
  end
  object frDBxTercero: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxTercero
    Left = 200
    Top = 629
  end
  object QDirCompleta: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT DIR_COMPLETA FROM SYS_TERCEROS_DIRECCIONES'
      'WHERE TERCERO=?TERCERO')
    Transaction = TLocal
    AutoTrans = True
    Left = 840
    Top = 245
  end
  object DSxAgente: TDataSource
    DataSet = xAgente
    Left = 104
    Top = 437
  end
  object frDBDxAgente: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxAgente
    Left = 200
    Top = 437
  end
  object QProcedenciaUnica: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT O_TIPO, O_RIG FROM GES_CABECERAS_RELACIONES'
      'WHERE'
      'D_EMPRESA = ?EMPRESA AND'
      'D_EJERCICIO = ?EJERCICIO AND'
      'D_CANAL = ?CANAL AND'
      'D_SERIE = ?SERIE AND'
      'D_TIPO = ?TIPO AND'
      'D_RIG = ?RIG'
      '')
    Transaction = TLocal
    AutoTrans = True
    Left = 840
    Top = 341
  end
  object frDBxDatosIva: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDatosIva
    Left = 200
    Top = 533
  end
  object DSxDatosIva: TDataSource
    DataSet = xDatosIva
    Left = 104
    Top = 533
  end
  object DSxFormaPago: TDataSource
    DataSet = xFormaPago
    Left = 104
    Top = 485
  end
  object frDBxFormaPago: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxFormaPago
    Left = 200
    Top = 485
  end
  object SPDame_factor: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure s_monedas_factor_eec(?EMPRESA,?EJERCICIO,?CANA' +
        'L,'#39'EUR'#39',?FECHA)')
    Transaction = TLocal
    AutoTrans = True
    Left = 840
    Top = 293
  end
  object frUserNotasCab: TfrUserDataset
    OnCheckEOF = frUserNotasCabCheckEOF
    OnFirst = frUserNotasCabFirst
    OnNext = frUserNotasCabNext
    Left = 1344
    Top = 149
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_ALBARAN_LST'
      'WHERE '
      'ID_S = ?ID_S')
    UniDirectional = False
    Plan.Strings = (
      'PLAN JOIN (VER_CABECERAS_ALBARAN CAB INDEX (GES_CABECERAS_S_ID),'
      
        '           VER_CABECERAS_ALBARAN ALB INDEX (GES_CABECERAS_S_ALB_' +
        'ID),'
      '           VER_CABECERAS_ALBARAN TER INDEX (PK_SYS_TERCEROS))')
    AfterOpen = QMCabeceraAfterOpen
    AfterScroll = QMCabeceraAfterScroll
    BeforeClose = QMCabeceraBeforeClose
    Left = 16
    Top = 53
  end
  object QMDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_ALBARAN_LST'
      'WHERE '
      'ID_S = :ID_S AND'
      'TIPO_LINEA <> '#39'PRM'#39
      'ORDER BY ORDEN')
    UniDirectional = False
    DataSource = DSCabecera
    AfterOpen = QMDetalleAfterOpen
    AfterScroll = QMDetalleAfterScroll
    BeforeClose = QMDetalleBeforeClose
    Left = 16
    Top = 101
  end
  object xCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'SELECT * FROM DAME_DATOS_CLIENTE(:EMPRESA, :EJERCICIO, :CLIENTE,' +
        ' :CANAL, :ID_S)')
    UniDirectional = False
    DataSource = DSCabecera
    AfterOpen = xClienteAfterOpen
    AfterScroll = xClienteAfterScroll
    BeforeClose = xClienteBeforeClose
    Left = 16
    Top = 197
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
    Left = 16
    Top = 677
  end
  object xTransportistas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_TRANSPORTISTAS'
      'where empresa=?empresa and transportista=?transportista')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 16
    Top = 293
  end
  object xRuta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM EMP_AGRUPACIONES_CLI'
      'where cliente=?cliente and empresa=?empresa')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 16
    Top = 341
  end
  object xNotasCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES_CUENTAS'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND '
      'CLIENTE=?CLIENTE')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 16
    Top = 389
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
    Left = 16
    Top = 581
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
    Left = 16
    Top = 725
  end
  object xTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TERCEROS'
      'WHERE TERCERO=?TERCERO')
    UniDirectional = False
    DataSource = DSxCliente
    Left = 16
    Top = 629
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
      'WHERE ag.EMPRESA=?EMPRESA AND ag.AGENTE=?AGENTE')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 16
    Top = 437
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
    Left = 16
    Top = 533
  end
  object xCuenta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES_CUENTAS'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND '
      'CLIENTE=?CLIENTE')
    UniDirectional = False
    DataSource = DSxCliente
    Left = 952
    Top = 101
  end
  object xFormaPago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT* FROM VER_FORMAS_PAGO_EMP'
      'WHERE EMPRESA=?EMPRESA AND'
      '               EJERCICIO=?EJERCICIO AND'
      '               CANAL=?CANAL AND'
      '               FORMA=?FORMA_PAGO'
      '')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 16
    Top = 485
  end
  object frDBDSDobleCabecera: TfrDBDataSet
    DataSource = DSDobleCabecera
    Left = 736
    Top = 53
  end
  object DSDobleCabecera: TDataSource
    DataSet = DobleCabecera
    Left = 632
    Top = 53
  end
  object DobleCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_ALBARAN_LST'
      'WHERE '
      'ID_S = ?ID_S')
    UniDirectional = False
    Plan.Strings = (
      'PLAN JOIN (VER_CABECERAS_ALBARAN CAB INDEX (GES_CABECERAS_S_ID),'
      
        '           VER_CABECERAS_ALBARAN ALB INDEX (GES_CABECERAS_S_ALB_' +
        'ID),'
      '           VER_CABECERAS_ALBARAN TER INDEX (PK_SYS_TERCEROS))'
      '')
    AfterOpen = DobleCabeceraAfterOpen
    AfterScroll = DobleCabeceraAfterScroll
    BeforeClose = DobleCabeceraBeforeClose
    Left = 528
    Top = 53
  end
  object DSxDobFormaPago: TDataSource
    DataSet = xDobFormaPago
    Left = 632
    Top = 101
  end
  object frDBDSxDobFormaPago: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDobFormaPago
    Left = 736
    Top = 101
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
    Left = 528
    Top = 101
  end
  object HYRxTercero: THYReportSource
    DataSet = xTercero
    CloseDataset = True
    Left = 408
    Top = 637
  end
  object xDobTransportista: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_TRANSPORTISTAS'
      'where empresa=?empresa and transportista=?transportista')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 528
    Top = 245
  end
  object HYRxDobTransportista: THYReportSource
    DataSet = xDobTransportista
    CloseDataset = True
    Left = 736
    Top = 245
  end
  object HYRSDobleCabecera: THYReportSource
    DataSet = DobleCabecera
    CloseDataset = True
    Left = 848
    Top = 53
  end
  object HYRDobDireccionCliente: THYReportSource
    DataSet = xDobDireccionCliente
    CloseDataset = True
    Left = 736
    Top = 293
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
    Left = 528
    Top = 293
  end
  object xDireccionCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO (?tercero)'
      'order by num')
    UniDirectional = False
    DataSource = DSxDireccionKRI
    Left = 528
    Top = 341
  end
  object HYRSDireccionCliente: THYReportSource
    DataSet = xDireccionCliente
    CloseDataset = True
    Left = 736
    Top = 341
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
    Left = 528
    Top = 149
  end
  object HYRxDobNotasClientes: THYReportSource
    DataSet = xDobNotasClientes
    CloseDataset = True
    Left = 736
    Top = 149
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
    Left = 952
    Top = 5
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
    Left = 1144
    Top = 389
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 1240
    Top = 389
  end
  object QDamePrecioUdPtoVerde: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select pto_verde from con_cuentas_ges_art'
      'where '
      '((empresa=?empresa) and'
      ' (ejercicio=?ejercicio) and'
      ' (canal=?canal) and'
      ' (articulo=?articulo))')
    Transaction = TLocal
    AutoTrans = True
    Left = 840
    Top = 389
  end
  object xLotes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM GES_DETALLES_S_LOTES'
      'WHERE '
      'ID_DETALLES_S = :ID_DETALLES_S'
      'ORDER BY LOTE')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 16
    Top = 773
  end
  object DSxLotes: TDataSource
    DataSet = xLotes
    Left = 104
    Top = 773
  end
  object frDBxLotes: TfrDBDataSet
    DataSource = DSxLotes
    Left = 200
    Top = 773
  end
  object HYxLotes: THYReportSource
    DataSet = xLotes
    CloseDataset = True
    Left = 408
    Top = 781
  end
  object QGen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 840
    Top = 197
  end
  object xUpdateaDocumentos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    UniDirectional = False
    Left = 952
    Top = 53
  end
  object DSxDobleIva: TDataSource
    DataSet = xDobleIva
    Left = 1048
    Top = 5
  end
  object DSxDobNotasClientes: TDataSource
    DataSet = xDobNotasClientes
    Left = 632
    Top = 149
  end
  object DSxDireccionCliente: TDataSource
    DataSet = xDireccionCliente
    Left = 632
    Top = 341
  end
  object DSxDobDireccionCliente: TDataSource
    DataSet = xDobDireccionCliente
    Left = 632
    Top = 293
  end
  object DSxDobTransportista: TDataSource
    DataSet = xDobTransportista
    Left = 632
    Top = 245
  end
  object HYRSxAgente: THYReportSource
    DataSet = xAgente
    CloseDataset = True
    Left = 408
    Top = 445
  end
  object DSQSPProcedencia_kri: TDataSource
    DataSet = QSPProcedencia_kri
    Left = 1240
    Top = 245
  end
  object QSPProcedencia_kri: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM  G_PROCEDENCIA_DOCUMENTO_LINEA'
      '(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA)')
    UniDirectional = True
    DataSource = DSDetalle
    Left = 1144
    Top = 245
  end
  object QLoteKri: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT COUNT(*), EMPRESA, ARTICULO, CADUCIDAD, LOTE'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      '/* ARTICULO = :ARTICULO AND*/'
      'EJERCICIO_SAL = :EJERCICIO AND'
      'CANAL_SAL = :CANAL AND'
      'SERIE_SAL = :SERIE AND'
      'RIG_SAL = :RIG AND'
      'LINEA_SAL = :LINEA AND'
      'LOTE > '#39#39
      'GROUP BY EMPRESA, ARTICULO, CADUCIDAD, LOTE, LINEA_SAL'
      ''
      'UNION'
      ''
      'SELECT COUNT(*), EMPRESA, ARTICULO, CADUCIDAD, LOTE'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      '/* ARTICULO = :ARTICULO AND*/'
      'EJERCICIO_DEV = :EJERCICIO AND'
      'CANAL_DEV = :CANAL AND'
      'SERIE_DEV = :SERIE AND'
      'RIG_DEV = :RIG AND'
      'LINEA_DEV = :LINEA AND'
      'LOTE > '#39#39
      'GROUP BY EMPRESA, ARTICULO, CADUCIDAD, LOTE, LINEA_DEV')
    UniDirectional = True
    DataSource = DSDetalle
    Left = 840
    Top = 437
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
      ' /*ARTICULO = ?ARTICULO AND*/'
      ' EJERCICIO_SAL = ?EJERCICIO AND'
      ' CANAL_SAL = ?CANAL AND'
      ' SERIE_SAL = ?SERIE AND'
      ' RIG_SAL = ?RIG AND'
      ' LINEA_SAL = ?LINEA'
      ''
      'UNION'
      ''
      'SELECT EMPRESA,ARTICULO,NRO_SERIE FROM NRO_SERIE_KRI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' /*ARTICULO = ?ARTICULO AND*/'
      ' EJERCICIO_DEV = ?EJERCICIO AND'
      ' CANAL_DEV = ?CANAL AND'
      ' SERIE_DEV = ?SERIE AND'
      ' RIG_DEV = ?RIG AND'
      ' LINEA_DEV = ?LINEA'
      '')
    UniDirectional = True
    DataSource = DSDetalle
    Left = 840
    Top = 485
  end
  object DSxDireccionKRI: TDataSource
    DataSet = xDireccionKRI
    Left = 632
    Top = 197
  end
  object xDireccionKRI: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO (?tercero)'
      'where num=?Direccion')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 528
    Top = 197
  end
  object HYRxDireccionKRI: THYReportSource
    DataSet = xDireccionKRI
    CloseDataset = True
    Left = 736
    Top = 197
  end
  object xDireccionesNIF: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_E_FAC_NIF'
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
    TableName = 'GES_CABECERAS_E_FAC_NIF'
    Left = 840
    Top = 533
  end
  object xDobDireccionesNIF: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_E_FAC_NIF'
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
    TableName = 'GES_CABECERAS_E_FAC_NIF'
    Left = 840
    Top = 581
  end
  object frDBDetalleTallas_borrar: TfrDBDataSet
    DataSource = DSDetalleTallas_borrar
    Left = 200
    Top = 149
  end
  object DSDetalleTallas_borrar: TDataSource
    DataSet = QMDetalleTallas_borrar
    Left = 104
    Top = 149
  end
  object QMDetalleTallas_borrar: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM XVER_DETALLES_S_GR_RO (?ID_S)'
      'ORDER BY ID_G_T, REF_PROVEEDOR, S_COLOR')
    UniDirectional = False
    DataSource = DSCabecera
    AfterOpen = QMDetalleTallas_borrarAfterOpen
    AfterScroll = QMDetalleTallas_borrarAfterScroll
    Left = 16
    Top = 149
  end
  object xTallas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM XGET_TALLAS'
      'WHERE ID_G_T = ?ID_G_T')
    UniDirectional = False
    DataSource = DSDetalleTallas_borrar
    Left = 528
    Top = 773
  end
  object DSxTallas: TDataSource
    DataSet = xTallas
    Left = 632
    Top = 773
  end
  object frDBxTallas: TfrDBDataSet
    DataSet = xTallas
    Left = 736
    Top = 773
  end
  object xDireccionEDI: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO (?tercero)'
      'where num=?Direccion')
    UniDirectional = False
    Left = 1144
    Top = 53
  end
  object DSxDireccionEDI: TDataSource
    DataSet = xDireccionEDI
    Left = 1240
    Top = 53
  end
  object DSQMCabeceraEDI: TDataSource
    DataSet = QMCabeceraEDI
    Left = 1240
    Top = 101
  end
  object QMCabeceraEDI: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EDI_ALB_CAB'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EDI_ALB_CAB'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG ')
    UniDirectional = False
    DataSource = DSCabecera
    AfterOpen = QMCabeceraEDIAfterOpen
    Left = 1144
    Top = 101
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
    Left = 952
    Top = 581
  end
  object DSArticuloTallas: TDataSource
    DataSet = QMArticuloTallas
    Left = 1048
    Top = 581
  end
  object xDestinatario: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT T.*, D.*, L.*, P.TITULO AS TITULO_PROVINCIA'
      'FROM SYS_TERCEROS T'
      'LEFT JOIN SYS_TERCEROS_DIRECCIONES D ON (T.TERCERO = D.TERCERO)'
      'LEFT JOIN SYS_LOCALIDADES L ON (D.DIR_LOCALIDAD = L.LOCALIDAD)'
      
        'LEFT JOIN SYS_PROVINCIAS P ON (L.PROVINCIA = P.PROVINCIA) AND (L' +
        '.PAIS = P.PAIS)'
      'WHERE'
      'T.TERCERO = :DESTINATARIO AND'
      'D.DIRECCION = :DIR_DESTINATARIO')
    UniDirectional = False
    DataSource = DSxDobleCartaPortes
    Left = 952
    Top = 341
  end
  object DSxDestinatario: TDataSource
    DataSet = xDestinatario
    Left = 1048
    Top = 341
  end
  object xIntermediaria: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT T.*, D.*, L.*, P.TITULO AS TITULO_PROVINCIA'
      'FROM SYS_TERCEROS T'
      'LEFT JOIN SYS_TERCEROS_DIRECCIONES D ON (T.TERCERO = D.TERCERO)'
      'LEFT JOIN SYS_LOCALIDADES L ON (D.DIR_LOCALIDAD = L.LOCALIDAD)'
      
        'LEFT JOIN SYS_PROVINCIAS P ON (L.PROVINCIA = P.PROVINCIA) AND (L' +
        '.PAIS = P.PAIS)'
      'WHERE'
      'T.TERCERO = :INTERMEDIARIA AND'
      'D.DIRECCION = :DIR_INTERMEDIARIA')
    UniDirectional = False
    DataSource = DSxDobleCartaPortes
    Left = 952
    Top = 197
  end
  object DSxIntermediaria: TDataSource
    DataSet = xIntermediaria
    Left = 1048
    Top = 197
  end
  object xTransportistaCarta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT A.*, T.*, D.*, L.*, P.TITULO AS TITULO_PROVINCIA'
      'FROM EMP_ACREEDORES A'
      'LEFT JOIN SYS_TERCEROS T ON (A.TERCERO = T.TERCERO)'
      'LEFT JOIN SYS_TERCEROS_DIRECCIONES D ON (T.TERCERO = D.TERCERO)'
      'LEFT JOIN SYS_LOCALIDADES L ON (D.DIR_LOCALIDAD = L.LOCALIDAD)'
      
        'LEFT JOIN SYS_PROVINCIAS P ON (L.PROVINCIA = P.PROVINCIA) AND (L' +
        '.PAIS = P.PAIS)'
      'WHERE'
      'A.EMPRESA = :EMPRESA AND'
      'A.ACREEDOR = :TRANSPORTISTA AND'
      'D.DIRECCION = :DIR_TRANSPORTISTA')
    UniDirectional = False
    DataSource = DSxCartaPortes
    Left = 952
    Top = 245
  end
  object DSxTransportistaCarta: TDataSource
    DataSet = xTransportistaCarta
    Left = 1048
    Top = 245
  end
  object xExpedidora: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT T.*, D.*, L.*, P.TITULO AS TITULO_PROVINCIA'
      'FROM SYS_TERCEROS T'
      'LEFT JOIN SYS_TERCEROS_DIRECCIONES D ON (T.TERCERO = D.TERCERO)'
      'LEFT JOIN SYS_LOCALIDADES L ON (D.DIR_LOCALIDAD = L.LOCALIDAD)'
      
        'LEFT JOIN SYS_PROVINCIAS P ON (L.PROVINCIA = P.PROVINCIA) AND (L' +
        '.PAIS = P.PAIS)'
      'WHERE'
      'T.TERCERO = :EXPEDIDORA AND'
      'D.DIRECCION = :DIR_EXPEDIDORA')
    UniDirectional = False
    DataSource = DSxDobleCartaPortes
    Left = 952
    Top = 293
  end
  object DSxExpedidora: TDataSource
    DataSet = xExpedidora
    Left = 1048
    Top = 293
  end
  object xPeso: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'select peso from dame_peso_documento(?id_s)')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 1608
    Top = 197
  end
  object DSxPeso: TDataSource
    DataSet = xPeso
    Left = 1704
    Top = 197
  end
  object xPortes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_CABECERAS_S_CGA'
      'WHERE'
      'ID_S = :ID_S')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 1608
    Top = 245
  end
  object DSxPortes: TDataSource
    DataSet = xPortes
    Left = 1704
    Top = 245
  end
  object xCargadora: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT T.*, D.*, L.*, P.TITULO AS TITULO_PROVINCIA'
      'FROM SYS_TERCEROS T'
      'LEFT JOIN SYS_TERCEROS_DIRECCIONES D ON (T.TERCERO = D.TERCERO)'
      'LEFT JOIN SYS_LOCALIDADES L ON (D.DIR_LOCALIDAD = L.LOCALIDAD)'
      
        'LEFT JOIN SYS_PROVINCIAS P ON (L.PROVINCIA = P.PROVINCIA) AND (L' +
        '.PAIS = P.PAIS)'
      'WHERE'
      'T.TERCERO = :CARGADORA AND'
      'D.DIRECCION = :DIR_CARGADORA')
    UniDirectional = False
    DataSource = DSxDobleCartaPortes
    Left = 952
    Top = 149
  end
  object DSxCargadora: TDataSource
    DataSet = xCargadora
    Left = 1048
    Top = 149
  end
  object xNaturaleza1: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT FIRST 1 *'
      'FROM VER_CABECERAS_NATURALEZAS'
      'WHERE'
      'ID_S = :ID_S'
      'ORDER BY NATURALEZA')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 1424
    Top = 149
  end
  object DSxNaturaleza1: TDataSource
    DataSet = xNaturaleza1
    Left = 1512
    Top = 149
  end
  object xNaturaleza2: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT FIRST 1 SKIP 1 *'
      'FROM VER_CABECERAS_NATURALEZAS'
      'WHERE'
      'ID_S = :ID_S'
      'ORDER BY NATURALEZA')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 1424
    Top = 197
  end
  object DSxNaturaleza2: TDataSource
    DataSet = xNaturaleza2
    Left = 1512
    Top = 197
  end
  object xNaturaleza3: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT FIRST 1 SKIP 2 *'
      'FROM VER_CABECERAS_NATURALEZAS'
      'WHERE'
      'ID_S = :ID_S'
      'ORDER BY NATURALEZA')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 1424
    Top = 245
  end
  object DSxNaturaleza3: TDataSource
    DataSet = xNaturaleza3
    Left = 1512
    Top = 245
  end
  object xMatricula1: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT FIRST 1 *'
      'FROM VER_CABECERAS_MATRICULAS'
      'WHERE'
      'ID_S = :ID_S'
      'ORDER BY MATRICULA')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 1424
    Top = 5
  end
  object DSxMatricula1: TDataSource
    DataSet = xMatricula1
    Left = 1512
    Top = 5
  end
  object xMatricula2: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT FIRST 1 SKIP 1 *'
      'FROM VER_CABECERAS_MATRICULAS'
      'WHERE'
      'ID_S = :ID_S'
      'ORDER BY MATRICULA')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 1424
    Top = 53
  end
  object DSxMatricula2: TDataSource
    DataSet = xMatricula2
    Left = 1512
    Top = 53
  end
  object xMatricula3: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT FIRST 1 SKIP 2 *'
      'FROM VER_CABECERAS_MATRICULAS'
      'WHERE'
      'ID_S = :ID_S'
      'ORDER BY MATRICULA')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 1424
    Top = 101
  end
  object DSxMatricula3: TDataSource
    DataSet = xMatricula3
    Left = 1512
    Top = 101
  end
  object xDobleMatricula: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_MAT'
      'WHERE ID_S = ?ID_S')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 528
    Top = 533
  end
  object xDobleCartaPortes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_CABECERAS_S_CGA'
      'WHERE'
      'ID_S = :ID_S')
    UniDirectional = False
    DataSource = DSDobleCabecera
    AfterOpen = xDobleCartaPortesAfterOpen
    BeforeClose = xDobleCartaPortesBeforeClose
    Left = 528
    Top = 437
  end
  object xDobleNaturaleza: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'select * from ges_cabeceras_s_nat'
      'where id_s=?id_s')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 528
    Top = 485
  end
  object DSxDobleMatricula: TDataSource
    DataSet = xDobleMatricula
    Left = 632
    Top = 533
  end
  object DSxDobleNaturaleza: TDataSource
    DataSet = xDobleNaturaleza
    Left = 632
    Top = 485
  end
  object DSxDobleCartaPortes: TDataSource
    DataSet = xDobleCartaPortes
    Left = 632
    Top = 437
  end
  object frDBxDobleMatricula: TfrDBDataSet
    DataSource = DSxDobleMatricula
    Left = 736
    Top = 533
  end
  object frDBxDobleNaturaleza: TfrDBDataSet
    DataSource = DSxDobleNaturaleza
    Left = 736
    Top = 485
  end
  object frDBxDobleCartaPortes: TfrDBDataSet
    DataSource = DSxDobleCartaPortes
    Left = 736
    Top = 437
  end
  object xNroSerie: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT S.ARTICULO, A.TITULO_LARGO AS TITULO, LIST(S.NSERIE, '#39', '#39 +
        ')'
      'FROM VER_DETALLE_SERIALIZACION S'
      
        'JOIN ART_ARTICULOS A ON S.EMPRESA = A.EMPRESA AND S.ARTICULO = A' +
        '.ARTICULO'
      'WHERE'
      'S.TIPO = '#39'ALB'#39' AND'
      'S.ID_DETALLE_DOC = :ID_DETALLES_S'
      'GROUP BY S.ARTICULO, A.TITULO_LARGO')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 16
    Top = 821
  end
  object DSxNroSerie: TDataSource
    DataSet = xNroSerie
    Left = 104
    Top = 821
  end
  object frDBxNroSerie: TfrDBDataSet
    DataSource = DSxNroSerie
    Left = 200
    Top = 821
  end
  object HYRSxNroSerie: THYReportSource
    DataSet = xNroSerie
    CloseDataset = True
    Left = 408
    Top = 829
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
    Left = 520
    Top = 5
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 632
    Top = 5
  end
  object frDBxArticulos: TfrDBDataSet
    DataSource = DSxArticulos
    Left = 736
    Top = 5
  end
  object xMonedasIdiomas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_MONEDAS_IDIOMAS'
      'WHERE MONEDA=?MONEDA AND IDIOMA=?IDIOMA')
    UniDirectional = False
    Left = 952
    Top = 389
  end
  object DSxMonedasIdiomas: TDataSource
    DataSet = xMonedasIdiomas
    Left = 1048
    Top = 389
  end
  object frDBCabecera: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSCabecera
    Left = 200
    Top = 53
  end
  object DSCabecera: TDataSource
    DataSet = QMCabecera
    Left = 104
    Top = 53
  end
  object HYRSxArticulos: THYReportSource
    DataSet = xArticulos
    CloseDataset = True
    Left = 848
    Top = 5
  end
  object HYRSxFormaPago: THYReportSource
    DataSet = xFormaPago
    CloseDataset = True
    Left = 408
    Top = 493
  end
  object HYRxDobFormaPago: THYReportSource
    DataSet = xDobFormaPago
    CloseDataset = True
    Left = 848
    Top = 101
  end
  object HYRSxRuta: THYReportSource
    DataSet = xRuta
    CloseDataset = True
    Left = 408
    Top = 341
  end
  object frDBxGarantiasKri: TfrDBDataSet
    DataSource = DSxGarantiasKri
    Left = 736
    Top = 725
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
      'ORDER BY R.ARTICULO,R.ORDEN'
      '')
    UniDirectional = False
    Left = 528
    Top = 725
  end
  object DSxGarantiasKri: TDataSource
    DataSet = xGarantiasKri
    Left = 632
    Top = 725
  end
  object frDBPromociones: TfrDBDataSet
    DataSource = DSQMPromociones
    Left = 200
    Top = 245
  end
  object QMPromociones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_DETALLE_ALBARAN'
      'WHERE'
      'ORIGEN = :ID_DETALLES_S AND'
      'TIPO_LINEA = '#39'PRM'#39
      '/* Agrego este campo para ayudar con los indices */'
      'AND ID_S=:ID_S '
      'ORDER BY ORDEN')
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
    Left = 16
    Top = 245
  end
  object DSQMPromociones: TDataSource
    DataSet = QMPromociones
    Left = 104
    Top = 245
  end
  object frUDNotasArtPRM: TfrUserDataset
    OnCheckEOF = frUDNotasArtPRMCheckEOF
    OnFirst = frUDNotasArtPRMFirst
    OnNext = frUDNotasArtPRMNext
    Left = 1344
    Top = 101
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
    Left = 528
    Top = 389
  end
  object DSxArticulosPRM: TDataSource
    DataSet = xArticulosPRM
    Left = 632
    Top = 389
  end
  object frDBxArticulosPRM: TfrDBDataSet
    DataSource = DSxArticulosPRM
    Left = 736
    Top = 389
  end
  object HYRSPromociones: THYReportSource
    DataSet = QMPromociones
    CloseDataset = True
    Left = 408
    Top = 245
  end
  object frxAlbaranes: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.9690797569
    ReportOptions.LastChange = 38691.9690797569
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxAlbaranesBeforePrint
    OnBeginDoc = frxAlbaranesBeginDoc
    OnGetValue = frAlbaranesGetValue
    OnPrintReport = frxAlbaranesPrintReport
    OnUserFunction = frxAlbaranesUserFunction
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 200
    Top = 5
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDBCabecera: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSCabecera
    Left = 304
    Top = 53
  end
  object frxDBDetalle: TfrxDBDataset
    UserName = 'frxDBDetalle'
    CloseDataSource = False
    DataSource = DSDetalle
    Left = 304
    Top = 101
  end
  object frxDBPromociones: TfrxDBDataset
    UserName = 'frxDBPromociones'
    CloseDataSource = False
    DataSource = DSQMPromociones
    Left = 296
    Top = 245
  end
  object frxUDNotasArtPRM: TfrxUserDataSet
    UserName = 'frxUDNotasArtPRM'
    OnCheckEOF = frUDNotasArtPRMCheckEOF
    OnFirst = frUDNotasArtPRMFirst
    OnNext = frUDNotasArtPRMNext
    Left = 1344
    Top = 53
  end
  object frxUDNotasArt: TfrxUserDataSet
    UserName = 'frxUDNotasArt'
    OnCheckEOF = frUDNotasArtCheckEOF
    OnFirst = frUDNotasArtFirst
    OnNext = frUDNotasArtNext
    Left = 1344
    Top = 5
  end
  object frxDBQSPProcedencia: TfrxDBDataset
    UserName = 'frxDBQSPProcedencia'
    CloseDataSource = False
    DataSource = DSQSPProcedencia
    Left = 296
    Top = 589
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
    Left = 1144
    Top = 149
  end
  object DSxProyectos: TDataSource
    DataSet = xProyectos
    Left = 1240
    Top = 149
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
    Left = 1144
    Top = 197
  end
  object DSxProyectosDetalle: TDataSource
    DataSet = xProyectosDetalle
    Left = 1240
    Top = 197
  end
  object frxDBxDatosIva: TfrxDBDataset
    UserName = 'frxDBxDatosIva'
    CloseDataSource = False
    DataSource = DSxDatosIva
    Left = 296
    Top = 541
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
    Left = 304
    Top = 5
  end
  object QMDetallesPortesQui: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM LST_DETALLES_S_PORTE_QUI (?ID_S)'
      'ORDER BY GRUPO_TRANSP, NUMERO_UN, TITULO')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 528
    Top = 677
  end
  object DSQMDetallesPortesQui: TDataSource
    DataSet = QMDetallesPortesQui
    Left = 632
    Top = 677
  end
  object frDBQMDetallesPortesQui: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSQMDetallesPortesQui
    Left = 736
    Top = 677
  end
  object frDBxCartaPortes: TfrDBDataSet
    DataSource = DSxCartaPortes
    Left = 736
    Top = 581
  end
  object DSxCartaPortes: TDataSource
    DataSet = xCartaPortes
    Left = 632
    Top = 581
  end
  object xCartaPortes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_CABECERAS_S_CGA'
      'WHERE'
      'ID_S = :ID_S')
    UniDirectional = False
    DataSource = DSCabecera
    AfterOpen = xCartaPortesAfterOpen
    BeforeClose = xCartaPortesBeforeClose
    Left = 528
    Top = 581
  end
  object DSxDobTranspCarta: TDataSource
    DataSet = xDobTranspCarta
    Left = 632
    Top = 629
  end
  object xDobTranspCarta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT A.*, T.*, D.*, L.*, P.TITULO AS TITULO_PROVINCIA'
      'FROM EMP_ACREEDORES A'
      'LEFT JOIN SYS_TERCEROS T ON (A.TERCERO = T.TERCERO)'
      'LEFT JOIN SYS_TERCEROS_DIRECCIONES D ON (T.TERCERO = D.TERCERO)'
      'LEFT JOIN SYS_LOCALIDADES L ON (D.DIR_LOCALIDAD = L.LOCALIDAD)'
      
        'LEFT JOIN SYS_PROVINCIAS P ON (L.PROVINCIA = P.PROVINCIA) AND (L' +
        '.PAIS = P.PAIS)'
      'WHERE'
      'A.EMPRESA = :EMPRESA AND'
      'A.ACREEDOR = :TRANSPORTISTA AND'
      'D.DIRECCION = :DIR_TRANSPORTISTA')
    UniDirectional = False
    DataSource = DSxDobleCartaPortes
    Left = 528
    Top = 629
  end
  object xDetalleDeCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_DETALLE'
      'WHERE ID_S = ?ID_S')
    UniDirectional = False
    DataSource = DSCabecera
    Plan.Strings = (
      'PLAN JOIN (VER_CABECERAS_ALBARAN CAB INDEX (GES_CABECERAS_S_ID),'
      
        '           VER_CABECERAS_ALBARAN ALB INDEX (GES_CABECERAS_S_ALB_' +
        'ID),'
      '           VER_CABECERAS_ALBARAN TER INDEX (PK_SYS_TERCEROS))')
    Left = 1144
    Top = 341
  end
  object DSxDetalleDeCabecera: TDataSource
    DataSet = xDetalleDeCabecera
    Left = 1240
    Top = 341
  end
  object DSDetalleUE: TDataSource
    DataSet = QMDetalleUE
    Left = 408
    Top = 149
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
    Left = 304
    Top = 149
  end
  object DSDireccionEntregaLinea: TDataSource
    DataSet = xDireccionEntregaLinea
    Left = 1704
    Top = 5
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
    Left = 1608
    Top = 5
  end
  object xPedidoAlquiler: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT A.ID_ALQ, P.*'
      'FROM EMP_ALQUILER_REV R'
      'JOIN EMP_ALQUILER A ON A.ID_ALQ = R.ID_ALQ'
      'JOIN GES_CABECERAS_S P ON A.ID_S_PEC = P.ID_S'
      'WHERE'
      'R.ID_S_ALB = :ID_S')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 1424
    Top = 293
  end
  object DSPedidoAlquiler: TDataSource
    DataSet = xPedidoAlquiler
    Left = 1512
    Top = 293
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
    Left = 1608
    Top = 53
  end
  object DSxRecibosAnticipos: TDataSource
    DataSet = xRecibosAnticipos
    Left = 1704
    Top = 53
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
    Left = 1608
    Top = 101
  end
  object DSxTotalRecibosAnticipos: TDataSource
    DataSet = xTotalRecibosAnticipos
    Left = 1704
    Top = 101
  end
  object frDBxRecibosAnticipos: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxRecibosAnticipos
    Left = 1800
    Top = 53
  end
  object frDBxTotalRecibosAnticipos: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxTotalRecibosAnticipos
    Left = 1800
    Top = 101
  end
  object QMDetalleADR: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM LST_DETALLES_PORTES_ADR (?ID_S)'
      'ORDER BY GRUPO_TRANSP, UN_NUMBER, TITULO')
    UniDirectional = False
    DataSource = DSCabecera
    AfterOpen = QMDetalleADRAfterOpen
    BeforeClose = QMDetalleADRBeforeClose
    Left = 528
    Top = 821
  end
  object DSQMDetalleADR: TDataSource
    DataSet = QMDetalleADR
    Left = 632
    Top = 821
  end
  object frDBQMDetalleADR: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSQMDetalleADR
    Left = 736
    Top = 821
  end
  object xLstFirmas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ID_FIRMA, NOMBRE, NIF, FECHA, COMENTARIO FROM GES_FIRMAS'
      'WHERE'
      'TIPO = :TIPO AND'
      'ID_DOC = :ID_S AND'
      'OCTET_LENGTH(COALESCE(FIRMA, '#39#39')) > 10'
      'ORDER BY ID_FIRMA')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 1424
    Top = 338
  end
  object DSxLstFirmas: TDataSource
    DataSet = xLstFirmas
    Left = 1512
    Top = 338
  end
  object frDBDLstFirmas: TfrDBDataSet
    DataSource = DSxLstFirmas
    Left = 1616
    Top = 338
  end
  object frxDBxLstFirmas: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = xLstFirmas
    Left = 1704
    Top = 338
  end
  object DSCuota: TDataSource
    DataSet = xCuota
    Left = 1704
    Top = 152
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
    Left = 1608
    Top = 152
  end
  object frDBGrupoTalla: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSGrupoTalla
    Left = 1136
    Top = 440
  end
  object DSGrupoTalla: TDataSource
    DataSet = QMGrupoTalla
    Left = 1048
    Top = 440
  end
  object HYRSGrupoTalla: THYReportSource
    DataSet = QMGrupoTalla
    CloseDataset = True
    Left = 1272
    Top = 440
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
      'SELECT DISTINCT X.ID_G_T, X.ID_S, G.TITULO, X.O_ID_S, X.O_DOC'
      'FROM XVER_DETALLES_S_GR_RO_LST(:ID_S, 0) X'
      'JOIN ART_GRUPOS_TALLAS G ON X.ID_G_T = G.ID_G_T'
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
    Left = 952
    Top = 440
  end
  object HYRMGrupoTalla: THYReportMailSource
    DataSet = QMGrupoTalla
    CloseDataset = True
    Left = 1352
    Top = 440
  end
  object frxDBGrupoTalla: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSGrupoTalla
    Left = 1208
    Top = 440
  end
  object frDBTituloTalla: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSTituloTalla
    Left = 1136
    Top = 488
  end
  object DSTituloTalla: TDataSource
    DataSet = QMTituloTalla
    Left = 1048
    Top = 488
  end
  object HYRSTituloTalla: THYReportSource
    DataSet = QMTituloTalla
    CloseDataset = True
    Left = 1272
    Top = 488
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
    Left = 952
    Top = 488
  end
  object HYRMTituloTalla: THYReportMailSource
    DataSet = QMTituloTalla
    CloseDataset = True
    Left = 1352
    Top = 488
  end
  object frxDBTituloTalla: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSTituloTalla
    Left = 1208
    Top = 488
  end
  object frDBDetalleTallas: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSDetalleTallas
    Left = 1136
    Top = 536
  end
  object DSDetalleTallas: TDataSource
    DataSet = QMDetalleTallas
    Left = 1048
    Top = 536
  end
  object HYRSDetalleTallas: THYReportSource
    DataSet = QMDetalleTallas
    CloseDataset = True
    Left = 1272
    Top = 536
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
      'FROM XVER_DETALLES_S_GR_RO_LST(:ID_S, :ID_G_T) X'
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
    Left = 952
    Top = 536
  end
  object HYRMDetalleTallas: THYReportMailSource
    DataSet = QMDetalleTallas
    CloseDataset = True
    Left = 1352
    Top = 536
  end
  object frxDBDetalleTallas: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSDetalleTallas
    Left = 1208
    Top = 536
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
    Left = 952
    Top = 628
  end
  object DSEscandallo: TDataSource
    DataSet = QMEscandallo
    Left = 1048
    Top = 628
  end
  object frDBDEscandallo: TfrDBDataSet
    DataSource = DSEscandallo
    Left = 1152
    Top = 628
  end
  object HYRSEscandallo: THYReportSource
    DataSet = QMEscandallo
    CloseDataset = True
    Left = 1256
    Top = 628
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
    Left = 952
    Top = 677
  end
  object DSxTipoPorte: TDataSource
    DataSet = xTipoPorte
    Left = 1048
    Top = 677
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
    Left = 952
    Top = 725
  end
  object DSxDobTipoPorte: TDataSource
    DataSet = xDobTipoPorte
    Left = 1048
    Top = 725
  end
  object xOrdProd: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_PRO_ORD'
      'WHERE'
      'ID_ORDEN = :ID_ORDEN')
    UniDirectional = False
    AfterOpen = xOrdProdAfterOpen
    BeforeClose = xOrdProdBeforeClose
    Left = 952
    Top = 776
  end
  object DSxOrdProd: TDataSource
    DataSet = xOrdProd
    Left = 1048
    Top = 776
  end
  object xOrdProdEmpleado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_EMPLEADOS_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'EMPLEADO = :RESPONSABLE')
    UniDirectional = False
    DataSource = DSxOrdProd
    Left = 952
    Top = 824
  end
  object DSxOrdProdEmpleado: TDataSource
    DataSet = xOrdProdEmpleado
    Left = 1048
    Top = 824
  end
  object xHerenciaPEC: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT O_EMPRESA, O_EJERCICIO, O_CANAL, O_SERIE, O_TIPO, O_RIG, ' +
        'O_LINEA FROM GES_DETALLES_RELACIONES'
      'WHERE'
      'D_EMPRESA=?EMPRESA AND'
      'D_EJERCICIO=?EJERCICIO AND'
      'D_CANAL=?CANAL AND'
      'D_SERIE=?SERIE AND'
      'D_TIPO=?TIPO AND'
      'D_RIG=?RIG AND'
      'D_LINEA=?LINEA')
    UniDirectional = False
    DataSource = DSDetalle
    AfterOpen = xHerenciaPECAfterOpen
    BeforeClose = xHerenciaPECBeforeClose
    Left = 1152
    Top = 680
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
    Left = 1152
    Top = 728
  end
  object DSxHerenciaPEC: TDataSource
    DataSet = xHerenciaPEC
    Left = 1256
    Top = 680
  end
  object DSxHerenciaOFC: TDataSource
    DataSet = xHerenciaOFC
    Left = 1256
    Top = 728
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
    Left = 1152
    Top = 824
  end
  object frDBxReferenciaDte: TfrDBDataSet
    DataSource = DSxReferenciaDte
    Left = 1342
    Top = 824
  end
  object DSxReferenciaDte: TDataSource
    DataSet = xReferenciaDte
    Left = 1244
    Top = 825
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
    Left = 1424
    Top = 384
  end
  object DSxArticulosIdioma: TDataSource
    DataSet = xArticulosIdioma
    Left = 1512
    Top = 384
  end
  object frDBxArticulosIdioma: TfrDBDataSet
    DataSource = DSxArticulosIdioma
    Left = 1616
    Top = 384
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
    Left = 1424
    Top = 436
  end
  object DSxArticuloTYC: TDataSource
    DataSet = xArticuloTYC
    Left = 1512
    Top = 436
  end
  object xCopiasCartaPorte: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM LST_REPETIR_REGISTRO(:CANTIDAD)')
    UniDirectional = False
    Left = 1424
    Top = 485
  end
  object DSxCopiasCartaPorte: TDataSource
    DataSet = xCopiasCartaPorte
    Left = 1512
    Top = 485
  end
  object frDBxCopiasCartaPorte: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxCopiasCartaPorte
    Left = 1616
    Top = 485
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
    Left = 1424
    Top = 536
  end
  object DSxTerceroBanco: TDataSource
    DataSet = xTerceroBanco
    Left = 1512
    Top = 536
  end
  object frDBxTerceroBanco: TfrDBDataSet
    DataSource = DSxTerceroBanco
    Left = 1616
    Top = 536
  end
  object DSxDobTerceroBan: TDataSource
    DataSet = xDobTerceroBan
    Left = 1512
    Top = 584
  end
  object frDBxDobTerceroBan: TfrDBDataSet
    DataSource = DSxDobTerceroBan
    Left = 1616
    Top = 584
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
    Left = 1424
    Top = 584
  end
end
