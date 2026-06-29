object DMLstOrdenesPedidos: TDMLstOrdenesPedidos
  OldCreateOrder = False
  OnCreate = DMLstPedidosCreate
  OnDestroy = DMLstPedidosDestroy
  Left = 265
  Top = 167
  Height = 754
  Width = 1088
  object frOrdenesPedidos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frOrdenesPedidosGetValue
    OnBeforePrint = frOrdenesPedidosEnterRect
    OnEnterRect = frOrdenesPedidosEnterRect
    OnUserFunction = frOrdenesPedidosUserFunction
    OnPrintReport = frOrdenesPedidosPrintReport
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 16
    ReportForm = {19000000}
  end
  object frDBCabecera: TfrDBDataSet
    DataSource = DSCabecera
    Left = 240
    Top = 64
  end
  object frDBdetalle: TfrDBDataSet
    DataSource = DSDetalle
    Left = 240
    Top = 112
  end
  object DSCabecera: TDataSource
    DataSet = QMCabecera
    Left = 144
    Top = 64
  end
  object QMDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from GES_DETALLES_S DET  '
      'join GES_DETALLES_S_PED PED'
      '      on (det.id_detalles_s = ped.id_detalles_s)'
      '      join GES_CABECERAS_S CAB'
      '      on (det.id_s = cab.id_s)'
      '      where det.tipo='#39'PEC'#39' and ID_S = ?ID_S ')
    UniDirectional = False
    DataSource = DSCabecera
    Plan.Strings = (
      'PLAN (VER_DETALLE_PEDIDO CAB INDEX (GES_CABECERAS_S_ID),'
      '           VER_DETALLE_PEDIDO DET INDEX (GES_DETALLES_S_CAB_ID),'
      '           VER_DETALLE_PEDIDO PED INDEX (GES_DETALLES_S_PED_ID))')
    AfterOpen = QMDetalleAfterOpen
    AfterScroll = QMDetalleAfterScroll
    BeforeClose = QMDetalleBeforeClose
    Left = 40
    Top = 112
  end
  object DSDetalle: TDataSource
    DataSet = QMDetalle
    Left = 144
    Top = 112
  end
  object xImgEmpresa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_EMPRESAS'
      'where empresa=?empresa')
    UniDirectional = False
    Left = 992
    Top = 160
  end
  object xCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM DAME_DATOS_CLIENTE(?EMPRESA,?EJERCICIO,?CLIENTE,'
      '?CANAL,?ID_S)')
    UniDirectional = False
    DataSource = DSCabecera
    AfterOpen = xClienteAfterOpen
    AfterScroll = xClienteAfterScroll
    BeforeClose = xClienteBeforeClose
    Left = 40
    Top = 160
  end
  object DSxCliente: TDataSource
    DataSet = xCliente
    Left = 144
    Top = 160
  end
  object xDireccion_Cliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM ut_justifica_domicilio_3(?tercero,?cliente,?id_s,0' +
        ')'
      'where (num=?Direccion or num=0)')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 40
    Top = 256
  end
  object frUDPie: TfrUserDataset
    RangeEnd = reCount
    RangeEndCount = 1
    Left = 528
    Top = 64
  end
  object frUDNotasArt: TfrUserDataset
    OnCheckEOF = frUDNotasArtCheckEOF
    OnFirst = frUDNotasArtFirst
    OnNext = frUDNotasArtNext
    Left = 240
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 448
    Top = 16
  end
  object xtercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TERCEROS'
      'WHERE TERCERO=?TERCERO')
    UniDirectional = False
    DataSource = DSxCliente
    Left = 40
    Top = 208
  end
  object DSxTercero: TDataSource
    DataSet = xtercero
    Left = 144
    Top = 208
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_PEDIDO'
      'WHERE ID_S = ?ID_S'
      'order by rig')
    UniDirectional = False
    Plan.Strings = (
      'PLAN JOIN (VER_CABECERAS_PEDIDO CAB INDEX (GES_CABECERAS_S_ID),'
      
        '           VER_CABECERAS_PEDIDO PED INDEX (GES_CABECERAS_S_PED_I' +
        'D),'
      '           VER_CABECERAS_PEDIDO TER INDEX (PK_SYS_TERCEROS))')
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    Left = 40
    Top = 64
  end
  object HYReport: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 8035
    ValorGrupo = 8035
    DataSet = DMMain.QListados
    Opciones.Pagina.Margenes.Abajo = 0
    Opciones.Pagina.Margenes.Izquierda = 0
    Opciones.Pagina.Margenes.Derecha = 0
    Opciones.Pagina.Margenes.Arriba = 0
    Opciones.Pagina.Alto = 66
    Opciones.Pagina.Ancho = 130
    Opciones.Pagina.Tamanyo = 69
    Opciones.Pagina.SaltoPagina = True
    Opciones.Pagina.ImprimePrimeraCabecera = False
    Opciones.Pagina.ImprimeUltimoPie = False
    Titulo = 'Ordenes de Pedidos'
    ControlaLongitud = True
    OnEnterFields = HYReportEnterFields
    OnPrintReport = HYReportPrintReport
    Left = 352
    Top = 16
  end
  object HYRSCabecera: THYReportSource
    DataSet = QMCabecera
    CloseDataset = True
    Left = 352
    Top = 64
  end
  object HYRSDetalle: THYReportSource
    DataSet = QMDetalle
    CloseDataset = True
    Left = 352
    Top = 112
  end
  object HYRSxCliente: THYReportSource
    DataSet = xCliente
    CloseDataset = True
    Left = 352
    Top = 160
  end
  object HYRSxDireccionCliente: THYReportSource
    DataSet = xDireccion_Cliente
    CloseDataset = True
    Left = 352
    Top = 256
  end
  object HYRxTercero: THYReportSource
    DataSet = xtercero
    CloseDataset = True
    Left = 352
    Top = 208
  end
  object DobleCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_PEDIDO'
      'WHERE ID_S = ?ID_S'
      'order by rig')
    UniDirectional = False
    Plan.Strings = (
      'PLAN JOIN (VER_CABECERAS_PEDIDO CAB INDEX (GES_CABECERAS_S_ID),'
      
        '           VER_CABECERAS_PEDIDO PED INDEX (GES_CABECERAS_S_PED_I' +
        'D),'
      '           VER_CABECERAS_PEDIDO TER INDEX (PK_SYS_TERCEROS))'
      '')
    AfterOpen = DobleCabeceraAfterOpen
    BeforeClose = DobleCabeceraBeforeClose
    Left = 656
    Top = 64
  end
  object xDobleIva: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_REDONDEOS'
      'WHERE (EMPRESA=?EMPRESA AND'
      '               EJERCICIO=?EJERCICIO AND'
      '               CANAL=?CANAL AND'
      '               SERIE=?SERIE AND'
      '               RIG=?RIG AND TIPO=?TIPO)')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 656
    Top = 112
  end
  object DSDobleCabecera: TDataSource
    DataSet = DobleCabecera
    Left = 760
    Top = 64
  end
  object xDobFormaPago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT* FROM VER_FORMAS_PAGO_EMP'
      'WHERE EMPRESA=?EMPRESA AND'
      '               EJERCICIO=?EJERCICIO AND'
      '               CANAL=?CANAL AND'
      '               FORMA=?FORMA_PAGO')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 656
    Top = 160
  end
  object HYRxDobFormaPago: THYReportSource
    DataSet = xDobFormaPago
    CloseDataset = True
    Left = 872
    Top = 160
  end
  object HYRDobleCabecera: THYReportSource
    DataSet = DobleCabecera
    CloseDataset = True
    Left = 872
    Top = 64
  end
  object HYRSDobleIva: THYReportSource
    DataSet = xDobleIva
    CloseDataset = True
    Left = 872
    Top = 112
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, SIGNO_MONEDA FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 40
    Top = 448
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 144
    Top = 448
  end
  object QGen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 992
    Top = 64
  end
  object xUpdateaDocumentos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    UniDirectional = False
    Left = 992
    Top = 112
  end
  object DSxDobleIva: TDataSource
    DataSet = xDobleIva
    Left = 760
    Top = 112
  end
  object DSxDobFormaPago: TDataSource
    DataSet = xDobFormaPago
    Left = 760
    Top = 160
  end
  object DSxDireccion_Cliente: TDataSource
    DataSet = xDireccion_Cliente
    Left = 144
    Top = 256
  end
  object DSxDireccionFiscal: TDataSource
    DataSet = xDireccionFiscal
    Left = 144
    Top = 496
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
    Left = 40
    Top = 496
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_CUENTAS '
      'WHERE EMPRESA=?EMPRESA'
      'AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL '
      'AND ARTICULO=?ARTICULO')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 40
    Top = 304
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 144
    Top = 304
  end
  object frDBxArticulos: TfrDBDataSet
    DataSource = DSxArticulos
    Left = 248
    Top = 304
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
    DataSource = DSCabecera
    Left = 40
    Top = 544
  end
  object DSxMonedasIdiomas: TDataSource
    DataSet = xMonedasIdiomas
    Left = 144
    Top = 544
  end
  object HYRSxArticulos: THYReportSource
    DataSet = xArticulos
    CloseDataset = True
    Left = 352
    Top = 304
  end
  object QMPromociones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_PEDIDO'
      'WHERE ORIGEN=?ID_DETALLES_S AND TIPO_LINEA='#39'PRM'#39
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
    Left = 40
    Top = 400
  end
  object DSQMPromociones: TDataSource
    DataSet = QMPromociones
    Left = 144
    Top = 400
  end
  object xArticulosPRM: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_CUENTAS '
      'WHERE EMPRESA=?EMPRESA'
      'AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL '
      'AND ARTICULO=?ARTICULO')
    UniDirectional = False
    DataSource = DSQMPromociones
    Left = 40
    Top = 352
  end
  object DSxArticulosPRM: TDataSource
    DataSet = xArticulosPRM
    Left = 144
    Top = 352
  end
  object frDBxArticulosPRM: TfrDBDataSet
    DataSource = DSxArticulosPRM
    Left = 248
    Top = 352
  end
  object frDBPromociones: TfrDBDataSet
    DataSource = DSQMPromociones
    Left = 248
    Top = 400
  end
  object frUDNotasArtPRM: TfrUserDataset
    OnCheckEOF = frUDNotasArtPRMCheckEOF
    OnFirst = frUDNotasArtPRMFirst
    OnNext = frUDNotasArtPRMNext
    Left = 448
    Top = 352
  end
  object HYRSPromociones: THYReportSource
    DataSet = QMPromociones
    CloseDataset = True
    Left = 352
    Top = 400
  end
  object frxOrdenesPedidos: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.9723134954
    ReportOptions.LastChange = 38691.9723134954
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxOrdenesPedidosBeforePrint
    OnGetValue = frxOrdenesPedidosGetValue
    OnPrintReport = frxOrdenesPedidosPrintReport
    OnUserFunction = frxOrdenesPedidosUserFunction
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 144
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxUDNotasArtPRM: TfrxUserDataSet
    UserName = 'frxUDNotasArtPRM'
    OnCheckEOF = frUDNotasArtPRMCheckEOF
    OnFirst = frUDNotasArtPRMFirst
    OnNext = frUDNotasArtPRMNext
    Left = 544
    Top = 352
  end
  object frxDBCabecera: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSCabecera
    Left = 448
    Top = 64
  end
  object frxUDNotasArt: TfrxUserDataSet
    UserName = 'frxUDNotasArt'
    OnCheckEOF = frUDNotasArtCheckEOF
    OnFirst = frUDNotasArtFirst
    OnNext = frUDNotasArtNext
    Left = 448
    Top = 304
  end
  object frxDBDetalle: TfrxDBDataset
    UserName = 'frxDBDetalle'
    CloseDataSource = False
    DataSource = DSDetalle
    Left = 448
    Top = 112
  end
  object frxDBPromociones: TfrxDBDataset
    UserName = 'frxDBPromociones'
    CloseDataSource = False
    DataSource = DSQMPromociones
    Left = 448
    Top = 400
  end
  object xProyectos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from emp_proyectos where '
      '  empresa=?empresa and proyecto=?proyecto')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 656
    Top = 208
  end
  object xProyectosDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from emp_proyectos where '
      '  empresa=?empresa and proyecto=?proyecto')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 40
    Top = 592
  end
  object DSxProyectosDetalle: TDataSource
    DataSet = xProyectosDetalle
    Left = 144
    Top = 592
  end
  object DSxOrdenes: TDataSource
    DataSet = xOrdenes
    Left = 144
    Top = 640
  end
  object xOrdenes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from pro_ord'
      'where id_orden=?id_orden')
    UniDirectional = False
    DataSource = DSDetalle
    Plan.Strings = (
      'PLAN JOIN (VER_CABECERAS_PEDIDO CAB INDEX (GES_CABECERAS_S_ID),'
      
        '           VER_CABECERAS_PEDIDO PED INDEX (GES_CABECERAS_S_PED_I' +
        'D),'
      '           VER_CABECERAS_PEDIDO TER INDEX (PK_SYS_TERCEROS))')
    Left = 40
    Top = 640
  end
  object DSxEscandallo: TDataSource
    DataSet = xEscandallo
    Left = 760
    Top = 352
  end
  object xEscandallo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from pro_escandallo'
      'where id_esc=?id_esc')
    UniDirectional = False
    DataSource = DSDetalle
    Plan.Strings = (
      'PLAN JOIN (VER_CABECERAS_PEDIDO CAB INDEX (GES_CABECERAS_S_ID),'
      
        '           VER_CABECERAS_PEDIDO PED INDEX (GES_CABECERAS_S_PED_I' +
        'D),'
      '           VER_CABECERAS_PEDIDO TER INDEX (PK_SYS_TERCEROS))')
    Left = 656
    Top = 352
  end
  object xFases: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select id_orden,empresa,ejercicio,canal,series,rig_of,suborden,l' +
        'inea_fase,fase,orden,tipofase,notas,id_imagen'
      'from pro_ord_fases'
      'where id_orden=?id_orden '
      'order by orden, linea_fase')
    UniDirectional = False
    DataSource = DSxOrdenes
    Left = 656
    Top = 256
  end
  object DSxFases: TDataSource
    DataSet = xFases
    Left = 760
    Top = 256
  end
  object xTareas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT TAR.EMPRESA, TAR.EJERCICIO, TAR.CANAL, TAR.SERIE, TAR.RIG' +
        '_OF, TAR.LINEA_FASE, TAR.LINEA_TAREA, TAR.TAREA,'
      
        '       TAR.ORDEN, TAR.TIPOTAREA, TAR.COMENTARIO, TAR.RECURSO, TA' +
        'R.CANTIDAD, TAR.ARTICULO, TAR.PRE_COS_UNI_PRE,'
      
        '       TAR.TOTAL_VAR_PRE, TAR.PRECIO_FIJO_PRE, TAR.TOTAL_PRE, TA' +
        'R.CANTIDAD_UTIL, TAR.PRE_COS_UNI_REAL,'
      
        '       TAR.TOTAL_VAR_REAL, TAR.PRECIO_FIJO_REAL, TAR.TOTAL_REAL,' +
        ' TAR.ESTADO, REC.TITULO AS NOMBRERECURSO,'
      
        '       TAR.IDENTIFICADOR, UTI.CODIGO AS CODIGOUTILLAJE, UTI.DESC' +
        'RIPCION AS NOMBREUTILLAJE'
      'FROM PRO_ORD_TAREA TAR'
      'JOIN PRO_RECURSOS REC ON (TAR.RECURSO = REC.RECURSO)'
      
        'JOIN PRO_SYS_UTILLAJES UTI ON (UTI.EMPRESA = TAR.EMPRESA AND UTI' +
        '.CODIGO = TAR.ID_UTILLAJE)'
      'WHERE'
      'TAR.ID_ORDEN = :ID_ORDEN'
      'ORDER BY TAR.ORDEN, TAR.LINEA_TAREA ')
    UniDirectional = False
    DataSource = DSxOrdenes
    Left = 656
    Top = 304
  end
  object DSxTareas: TDataSource
    DataSet = xTareas
    Left = 760
    Top = 304
  end
  object frDBTareas: TfrDBDataSet
    DataSource = DSxTareas
    Left = 872
    Top = 304
  end
  object DSxProyectos: TDataSource
    DataSet = xProyectos
    Left = 760
    Top = 208
  end
end
