object DMLstPedidos_Prov: TDMLstPedidos_Prov
  OldCreateOrder = False
  OnCreate = DMLstPedidos_ProvCreate
  OnDestroy = DMLstPedidos_ProvDestroy
  Left = 278
  Top = 181
  Height = 639
  Width = 1490
  object frPedidos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frPedidosGetValue
    OnBeforePrint = frPedidosEnterRect
    OnEnterRect = frPedidosEnterRect
    OnUserFunction = frPedidosUserFunction
    OnPrintReport = frPedidosPrintReport
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 208
    Top = 16
    ReportForm = {19000000}
  end
  object frDBCabecera: TfrDBDataSet
    DataSource = DSCabecera
    OpenDataSource = False
    Left = 208
    Top = 64
  end
  object frDBdetalle: TfrDBDataSet
    DataSource = DSDetalle
    OpenDataSource = False
    Left = 208
    Top = 160
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_PEDIDO_PROV_LST'
      'WHERE'
      'ID_E = ?ID_E'
      '')
    UniDirectional = False
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    Left = 40
    Top = 64
  end
  object DSCabecera: TDataSource
    DataSet = QMCabecera
    Left = 128
    Top = 64
  end
  object QMDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_PEDIDO_PROV'
      'where    ID_E = ?ID_E'
      'order by orden')
    UniDirectional = False
    DataSource = DSCabecera
    AfterOpen = QMDetalleAfterOpen
    AfterScroll = QMDetalleAfterScroll
    BeforeClose = QMDetalleBeforeClose
    Left = 40
    Top = 160
  end
  object DSDetalle: TDataSource
    DataSet = QMDetalle
    Left = 128
    Top = 160
  end
  object xProveedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'select * from dame_datos_proveedor(?EMPRESA,?EJERCICIO,?PROVEEDO' +
        'R,?CANAL,?ID_E)')
    UniDirectional = False
    DataSource = DSCabecera
    AfterOpen = xProveedoresAfterOpen
    BeforeClose = xProveedoresBeforeClose
    Left = 40
    Top = 256
  end
  object DSxProveedores: TDataSource
    DataSet = xProveedores
    Left = 128
    Top = 256
  end
  object xDireccion_Proveedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM UT_JUSTIFICA_DOMICILIO_3(:TERCERO, :PROVEEDOR, :ID_E, 1)'
      'WHERE'
      '((NUM = :DIRECCION) OR (NUM = 0))')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 40
    Top = 352
  end
  object frUDPie: TfrUserDataset
    RangeEnd = reCount
    RangeEndCount = 1
    Left = 656
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 40
    Top = 16
  end
  object xTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_EDICION'
      'where tercero=?tercero')
    UniDirectional = False
    DataSource = DSxProveedores
    Left = 40
    Top = 400
  end
  object DSxTerceros: TDataSource
    DataSet = xTerceros
    Left = 128
    Top = 400
  end
  object frUDNotasArt: TfrUserDataset
    OnCheckEOF = frUDNotasArtCheckEOF
    OnFirst = frUDNotasArtFirst
    OnNext = frUDNotasArtNext
    Left = 656
    Top = 16
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
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
    Left = 128
    Top = 448
  end
  object HYReportMail: THYReportMail
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    ValorCodigo = 1802
    ValorGrupo = 40
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
    Titulo = 'Listado de Pedido Proveedores E-Mail'
    ControlaLongitud = True
    OnEnterFields = HYReportMailEnterFields
    Left = 368
    Top = 16
  end
  object HYMSCabecera: THYReportMailSource
    DataSet = QMCabecera
    CloseDataset = True
    Left = 368
    Top = 64
  end
  object HYMSDetalle: THYReportMailSource
    DataSet = QMDetalle
    CloseDataset = True
    Left = 368
    Top = 160
  end
  object HYMSxProveedores: THYReportMailSource
    DataSet = xProveedores
    CloseDataset = True
    Left = 368
    Top = 264
  end
  object HYMSxDireccionProveedor: THYReportMailSource
    DataSet = xDireccion_Proveedores
    CloseDataset = True
    Left = 368
    Top = 352
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
      '               FORMA=?FORMA_DE_PAGO')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 880
    Top = 352
  end
  object HYReport: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 2000
    ValorGrupo = 38
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
    Titulo = 'Ofertas de Clientes'
    ControlaLongitud = True
    OnEnterFields = HYReportEnterFields
    OnPrintReport = HYReportPrintReport
    Left = 288
    Top = 16
  end
  object HYRSCabecera: THYReportSource
    DataSet = QMCabecera
    CloseDataset = True
    Left = 288
    Top = 64
  end
  object HYRSDetalle: THYReportSource
    DataSet = QMDetalle
    CloseDataset = True
    Left = 288
    Top = 160
  end
  object HYRSxProveedores: THYReportSource
    DataSet = xProveedores
    CloseDataset = True
    Left = 288
    Top = 264
  end
  object HYRSxDireccionProveedor: THYReportSource
    DataSet = xDireccion_Proveedores
    CloseDataset = True
    Left = 288
    Top = 352
  end
  object HYRxTerceros: THYReportSource
    DataSet = xTerceros
    CloseDataset = True
    Left = 288
    Top = 400
  end
  object xAlmacen: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM ART_ALMACENES'
      'WHERE EMPRESA = ?EMPRESA AND ALMACEN = ?ALMACEN')
    UniDirectional = False
    DataSource = DSCabecera
    AfterOpen = xAlmacenAfterOpen
    BeforeClose = xAlmacenBeforeClose
    Left = 472
    Top = 16
  end
  object DSxAlmacen: TDataSource
    DataSet = xAlmacen
    Left = 560
    Top = 16
  end
  object QGen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 880
    Top = 400
  end
  object xUpdateaDocumentos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    UniDirectional = False
    Left = 880
    Top = 304
  end
  object DSxDireccion_Proveedores: TDataSource
    DataSet = xDireccion_Proveedores
    Left = 128
    Top = 352
  end
  object DobleCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_PEDIDO_PROV'
      'where id_e = ?id_e'
      'order by rig')
    UniDirectional = False
    AfterOpen = DobleCabeceraAfterOpen
    AfterScroll = DobleCabeceraAfterScroll
    BeforeClose = DobleCabeceraBeforeClose
    Left = 40
    Top = 112
  end
  object DSDobleCabecera: TDataSource
    DataSet = DobleCabecera
    Left = 128
    Top = 112
  end
  object HYRSDobleCabecera: THYReportSource
    DataSet = DobleCabecera
    CloseDataset = True
    Left = 288
    Top = 112
  end
  object HYMSDobleCabecera: THYReportMailSource
    DataSet = DobleCabecera
    CloseDataset = True
    Left = 368
    Top = 112
  end
  object HYRSxArticulos: THYReportSource
    DataSet = xArticulos
    CloseDataset = True
    Left = 288
    Top = 208
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_CUENTAS '
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND '
      'ARTICULO=?ARTICULO')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 40
    Top = 208
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 128
    Top = 208
  end
  object frDBxArticulos: TfrDBDataSet
    DataSource = DSxArticulos
    Left = 208
    Top = 208
  end
  object xProyectos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'select titulo from emp_proyectos where '
      '  empresa=?empresa and proyecto=?proyecto')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 40
    Top = 496
  end
  object DSxProyectos: TDataSource
    DataSet = xProyectos
    Left = 128
    Top = 496
  end
  object xProyectosDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'select titulo from emp_proyectos where '
      '  empresa=?empresa and proyecto=?proyecto')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 40
    Top = 544
  end
  object DSxProyectosDetalle: TDataSource
    DataSet = xProyectosDetalle
    Left = 128
    Top = 544
  end
  object frxPedidos: TfrxHYReport
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
    OnBeforePrint = frxPedidosBeforePrint
    OnGetValue = frxPedidosGetValue
    OnUserFunction = frxPedidosUserFunction
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 128
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxUDNotasArt: TfrxUserDataSet
    UserName = 'frxUDNotasArt'
    OnCheckEOF = frUDNotasArtCheckEOF
    OnFirst = frUDNotasArtFirst
    OnNext = frUDNotasArtNext
    Left = 728
    Top = 16
  end
  object frxUDPie: TfrxUserDataSet
    RangeEnd = reCount
    RangeEndCount = 1
    UserName = 'frxUDPie'
    Left = 728
    Top = 64
  end
  object DSxTransportista: TDataSource
    DataSet = xTransportista
    Left = 560
    Top = 160
  end
  object xTransportista: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'select * from VER_ACREEDORES_CUENTAS'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'ACREEDOR=?TRANSPORTISTA')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 472
    Top = 160
  end
  object xEmpleado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'select em.empleado, st.nombre_r_social as titulo from sys_usuari' +
        'os us '
      'join OPE_EMPLEADO em on (em.empleado=us.usuario) '
      'join sys_terceros st on (em.tercero=st.tercero) '
      'where em.empresa=?empresa and us.usuario=?usuario')
    UniDirectional = False
    Left = 40
    Top = 304
  end
  object DSxEmpleado: TDataSource
    DataSet = xEmpleado
    Left = 128
    Top = 304
  end
  object xArticulosIdioma: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM ART_ARTICULOS_IDIOMAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ARTICULO = :ARTICULO AND'
      'IDIOMA = :IDIOMA')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 472
    Top = 208
  end
  object DSxArticulosIdioma: TDataSource
    DataSet = xArticulosIdioma
    Left = 560
    Top = 208
  end
  object QMNecesidadesProduccion: TFIBDataSetRW
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM PRO_LST_NECESIDADES_LANZAR(:ID_ORDEN, '#39'000'#39', '#39'ZZZ'#39 +
        ', :ENTRADA, 1)')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 472
    Top = 352
  end
  object frDBNecesidadesProduccion: TfrDBDataSet
    DataSource = DSQMNecesidadesProduccion
    OpenDataSource = False
    Left = 768
    Top = 352
  end
  object DSQMNecesidadesProduccion: TDataSource
    DataSet = QMNecesidadesProduccion
    Left = 616
    Top = 352
  end
  object xMaterialesProduccion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      '    POM.LINEA_MAT AS LINE_MATERIAL,'
      '    POM.ALMACEN AS ALMACEN_DESTINO,'
      '    POM.COMPONENTE,'
      '    POM.UNIDADES_NEC AS UNIDADES_NECESARIAS,'
      '    UNIDADES_UTIL,'
      '    POM.LINEA_FASE,'
      '    POM.PRECIO_FIJO,'
      '    POM.TOTAL,'
      '    POM.ID_ORDEN,'
      '    POM.ID_ORDEN_MAT AS ID_ORDEN_MATERIAL,'
      '    POM.UNIDADES_FAB AS UNIDADES_A_FABRICAR,'
      '    POM.UNIDADES_STOCK,'
      '    POM.UNIDADES_PREV AS UNIDADES_PREVISTA,'
      '    POM.UDS_COMPRA,'
      '    ART.TITULO'
      'FROM PRO_ORD_TAREA_TEX POTT'
      'LEFT JOIN PRO_ORD_MAT POM'
      'ON'
      '(POM.EMPRESA = POTT.EMPRESA AND'
      'POM.EJERCICIO = POTT.EJERCICIO AND'
      'POM.CANAL = POTT.CANAL AND'
      'POM.SERIES = POTT.SERIE AND'
      'POM.RIG_OF = POTT.RIG_OF)'
      'LEFT JOIN ART_ALMACENES ALM'
      'ON (ALM.EMPRESA = POM.EMPRESA AND ALM.ALMACEN = POM.ALMACEN)'
      'LEFT JOIN ART_ARTICULOS ART'
      'ON (ART.EMPRESA = POM.EMPRESA AND ART.ARTICULO = POM.COMPONENTE)'
      'WHERE'
      'POTT.ID_E_PEDIDO = :ID_E'
      'ORDER BY POM.LINEA_FASE, POM.LINEA_MAT')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 472
    Top = 400
  end
  object DSxMaterialesProduccion: TDataSource
    DataSet = xMaterialesProduccion
    Left = 616
    Top = 400
  end
  object frDBMaterialesProduccion: TfrDBDataSet
    DataSource = DSxMaterialesProduccion
    OpenDataSource = False
    Left = 768
    Top = 400
  end
  object QMDetalleUE: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'select unidades, medida1, medida2, medida3, medida4, precio'
      'from ges_detalles_e_ue'
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
    Left = 472
    Top = 448
  end
  object DSDetalleUE: TDataSource
    DataSet = QMDetalleUE
    Left = 616
    Top = 448
  end
  object frDBGrupoTalla: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSGrupoTalla
    Left = 1064
    Top = 16
  end
  object DSGrupoTalla: TDataSource
    DataSet = QMGrupoTalla
    Left = 976
    Top = 16
  end
  object HYRSGrupoTalla: THYReportSource
    DataSet = QMGrupoTalla
    CloseDataset = True
    Left = 1200
    Top = 16
  end
  object QMGrupoTalla: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        '/* Los distintos grupos de talla que intervienen en el detalle d' +
        'el documento */'
      '/* Solo los que tienen lineas con unidades */'
      'SELECT DISTINCT X.ID_G_T, X.ID_E, G.TITULO, X.O_ID_E, X.O_DOC'
      'FROM XVER_DETALLES_E_GR_RO_LST(:ID_E) X'
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
    Left = 880
    Top = 16
  end
  object HYRMGrupoTalla: THYReportMailSource
    DataSet = QMGrupoTalla
    CloseDataset = True
    Left = 1280
    Top = 16
  end
  object frxDBGrupoTalla: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSGrupoTalla
    Left = 1136
    Top = 16
  end
  object frDBTituloTalla: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSTituloTalla
    Left = 1064
    Top = 64
  end
  object DSTituloTalla: TDataSource
    DataSet = QMTituloTalla
    Left = 976
    Top = 64
  end
  object HYRSTituloTalla: THYReportSource
    DataSet = QMTituloTalla
    CloseDataset = True
    Left = 1200
    Top = 64
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
    Left = 880
    Top = 64
  end
  object HYRMTituloTalla: THYReportMailSource
    DataSet = QMTituloTalla
    CloseDataset = True
    Left = 1280
    Top = 64
  end
  object frxDBTituloTalla: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSTituloTalla
    Left = 1136
    Top = 64
  end
  object frDBDetalleTallas: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSDetalleTallas
    Left = 1064
    Top = 112
  end
  object DSDetalleTallas: TDataSource
    DataSet = QMDetalleTallas
    Left = 976
    Top = 112
  end
  object HYRSDetalleTallas: THYReportSource
    DataSet = QMDetalleTallas
    CloseDataset = True
    Left = 1200
    Top = 112
  end
  object QMDetalleTallas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT X.*'
      'FROM XVER_DETALLES_E_GR_RO_LST(:ID_E) X'
      'WHERE'
      'X.ID_G_T = :ID_G_T AND'
      'X.O_ID_E = :O_ID_E AND'
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
      
        'ORDER BY X.ID_G_T, X.GENERO, X.FAMILIA, X.SUBFAMILIA, X.REF_PROV' +
        'EEDOR, X.S_COLOR, X.CAJA_EDI')
    UniDirectional = False
    DataSource = DSGrupoTalla
    Plan.Strings = (
      
        'PLAN JOIN (VER_CABECERAS_FACTURA CAB INDEX (GES_CABECERAS_S_ID),' +
        'VER_CABECERAS_FACTURA FAC INDEX (GES_CABECERAS_S_FAC_ID),VER_CAB' +
        'ECERAS_FACTURA TER INDEX (PK_SYS_TERCEROS))')
    AfterOpen = QMDetalleTallasAfterOpen
    BeforeClose = QMDetalleTallasBeforeClose
    Left = 880
    Top = 112
  end
  object HYRMDetalleTallas: THYReportMailSource
    DataSet = QMDetalleTallas
    CloseDataset = True
    Left = 1280
    Top = 112
  end
  object frxDBDetalleTallas: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSDetalleTallas
    Left = 1136
    Top = 112
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
    Left = 880
    Top = 157
  end
  object DSArticuloTallas: TDataSource
    DataSet = QMArticuloTallas
    Left = 976
    Top = 157
  end
  object xDatosIva: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_CABECERAS_E_REDONDEOS'
      'WHERE'
      'ID_E = :ID_E'
      'ORDER BY P_IVA DESC')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 880
    Top = 208
  end
  object DSxDatosIva: TDataSource
    DataSet = xDatosIva
    Left = 976
    Top = 208
  end
  object frDBxDatosIva: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDatosIva
    Left = 1064
    Top = 208
  end
  object xDobleIva: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_CABECERAS_E_REDONDEOS'
      'WHERE'
      'ID_E = :ID_E'
      'ORDER BY P_IVA DESC')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 880
    Top = 256
  end
  object DSxDobleIva: TDataSource
    DataSet = xDobleIva
    Left = 976
    Top = 256
  end
  object xAlmacenDireccion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT FIRST (1) * FROM UT_JUSTIFICA_DOMICILIO(:TERCERO)'
      'WHERE'
      'DIR_DEFECTO = 1')
    UniDirectional = False
    DataSource = DSxAlmacen
    Left = 472
    Top = 64
  end
  object DSxAlmacenDireccion: TDataSource
    DataSet = xAlmacenDireccion
    Left = 560
    Top = 64
  end
  object xOrdenProduccion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT O.*, T.NOMBRE_R_SOCIAL NOMBRE_RESPONSABLE'
      'FROM PRO_ORD O'
      
        'JOIN OPE_EMPLEADO E ON O.EMPRESA = E.EMPRESA AND O.RESPONSABLE =' +
        ' E.EMPLEADO'
      'JOIN SYS_TERCEROS T ON E.TERCERO = T.TERCERO'
      'WHERE'
      'O.ID_ORDEN = :ID_ORDEN')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 472
    Top = 304
  end
  object DSxOrdenProduccion: TDataSource
    DataSet = xOrdenProduccion
    Left = 616
    Top = 304
  end
  object xTrabajoExterno: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_PRO_ORD_TAREA_TEX_MOVS'
      'WHERE'
      'ID_DOC = :ID_E')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 880
    Top = 448
  end
  object DSxTrabajoExterno: TDataSource
    DataSet = xTrabajoExterno
    Left = 976
    Top = 448
  end
end
