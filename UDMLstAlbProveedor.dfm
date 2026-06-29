object DMLstAlbProveedor: TDMLstAlbProveedor
  OldCreateOrder = False
  OnCreate = DMLstAlbProveedorCreate
  OnDestroy = DMLstAlbProveedorDestroy
  Left = 387
  Top = 196
  Height = 619
  Width = 1187
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 120
    Top = 56
  end
  object frDBCabecera: TfrDBDataSet
    DataSource = DSQMCabecera
    Left = 224
    Top = 56
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 120
    Top = 104
  end
  object frDBDetalle: TfrDBDataSet
    DataSource = DSQMDetalle
    Left = 224
    Top = 104
  end
  object DSxProv: TDataSource
    DataSet = xProv
    Left = 120
    Top = 152
  end
  object DSxDirProv: TDataSource
    DataSet = xDirProv
    Left = 120
    Top = 200
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 32
    Top = 8
  end
  object frAlbaranes: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Informe de Albaranes de Proveedor'
    RebuildPrinter = False
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
    Left = 224
    Top = 8
    ReportForm = {19000000}
  end
  object frUDPie: TfrUserDataset
    RangeEnd = reCount
    RangeEndCount = 1
    Left = 584
    Top = 56
  end
  object DSQSPProcedencia: TDataSource
    DataSet = QSPProcedencia
    Left = 120
    Top = 296
  end
  object frDBQSPProcedencia: TfrDBDataSet
    DataSource = DSQSPProcedencia
    Left = 224
    Top = 296
  end
  object DSxNotasProv: TDataSource
    DataSet = xNotasProv
    Left = 120
    Top = 248
  end
  object frDBxNotasProv: TfrDBDataSet
    DataSource = DSxNotasProv
    Left = 224
    Top = 248
  end
  object frDBxDirProv: TfrDBDataSet
    DataSource = DSxDirProv
    Left = 224
    Top = 200
  end
  object HYReport: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 1997
    ValorGrupo = 72
    DataSet = DMMain.QListados
    Opciones.Pagina.Margenes.Abajo = 0
    Opciones.Pagina.Margenes.Izquierda = 0
    Opciones.Pagina.Margenes.Derecha = 0
    Opciones.Pagina.Margenes.Arriba = 0
    Opciones.Pagina.Alto = 66
    Opciones.Pagina.Ancho = 80
    Opciones.Pagina.Tamanyo = 66
    Opciones.Pagina.SaltoPagina = False
    Opciones.Pagina.ImprimePrimeraCabecera = False
    Opciones.Pagina.ImprimeUltimoPie = False
    Titulo = 'Informe Albar'#225'n Prov. Matricial'
    ControlaLongitud = True
    OnEnterFields = HYReportEnterFields
    OnPrintReport = HYReportPrintReport
    Left = 344
    Top = 8
  end
  object HYRSCabecera: THYReportSource
    DataSet = QMCabecera
    CloseDataset = True
    Left = 344
    Top = 56
  end
  object HYRSxProv: THYReportSource
    DataSet = xProv
    CloseDataset = True
    Left = 344
    Top = 152
  end
  object HYRSxDirProv: THYReportSource
    DataSet = xDirProv
    CloseDataset = True
    Left = 344
    Top = 200
  end
  object HYRSDetalle: THYReportSource
    DataSet = QMDetalle
    CloseDataset = True
    Left = 344
    Top = 104
  end
  object frUDNotasArt: TfrUserDataset
    OnCheckEOF = frUDNotasArtCheckEOF
    OnFirst = frUDNotasArtFirst
    OnNext = frUDNotasArtNext
    Left = 488
    Top = 56
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_ALBARAN_PROV_LST'
      'WHERE'
      'ID_E = ?ID_E')
    UniDirectional = False
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    Left = 32
    Top = 56
  end
  object QMDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_ALBARAN_PROV'
      'where    ID_E = ?ID_E'
      'order by orden')
    UniDirectional = False
    DataSource = DSQMCabecera
    AfterOpen = QMDetalleAfterOpen
    AfterScroll = QMDetalleAfterScroll
    BeforeClose = QMDetalleBeforeClose
    Left = 32
    Top = 104
  end
  object xProv: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from dame_datos_proveedor(?EMPRESA,?EJERCICIO,?PROVEEDO' +
        'R,?CANAL,?ID_E)')
    UniDirectional = False
    DataSource = DSQMCabecera
    AfterScroll = xProvAfterScroll
    Left = 32
    Top = 152
  end
  object xDirProv: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM UT_JUSTIFICA_DOMICILIO_3(:TERCERO, :PROVEEDOR, :ID_E, 1)'
      'WHERE'
      '((NUM = :DIRECCION) OR (NUM = 0))')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 32
    Top = 200
  end
  object xNotasProv: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_PROVEEDORES_CUENTAS'
      
        'where (empresa=?empresa) and (ejercicio=?ejercicio) and (canal=?' +
        'canal)'
      '  and (proveedor=?proveedor)')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 32
    Top = 248
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
    DataSource = DSQMDetalle
    Left = 32
    Top = 296
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
    Left = 488
    Top = 392
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 576
    Top = 392
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
    Left = 488
    Top = 104
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
      ' ARTICULO = ?ARTICULO AND'
      ' EJERCICIO_ENT = ?EJERCICIO AND'
      ' CANAL_ENT = ?CANAL AND'
      ' SERIE_ENT = ?SERIE AND'
      ' RIG_ENT = ?RIG AND'
      ' LINEA_ENT = ?LINEA AND'
      ' DEVOLUCION_VENTA = 0 '
      'GROUP BY EMPRESA,ARTICULO,CADUCIDAD,LOTE, LINEA_ENT'
      ''
      'UNION'
      ''
      
        'SELECT COUNT(*),EMPRESA,ARTICULO,CADUCIDAD,LOTE FROM NRO_SERIE_K' +
        'RI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' ARTICULO = ?ARTICULO AND'
      ' EJERCICIO_DEC = ?EJERCICIO AND'
      ' CANAL_DEC = ?CANAL AND'
      ' SERIE_DEC = ?SERIE AND'
      ' RIG_DEC = ?RIG AND'
      ' LINEA_DEC = ?LINEA AND'
      ' DEVOLUCION = 1 '
      'GROUP BY EMPRESA,ARTICULO,CADUCIDAD,LOTE, LINEA_ENT')
    UniDirectional = True
    DataSource = DSQMDetalle
    Left = 488
    Top = 440
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
      ' ARTICULO = ?ARTICULO AND'
      ' EJERCICIO_ENT = ?EJERCICIO AND'
      ' CANAL_ENT = ?CANAL AND'
      ' SERIE_ENT = ?SERIE AND'
      ' RIG_ENT = ?RIG AND'
      ' LINEA_ENT = ?LINEA AND'
      ' DEVOLUCION_VENTA = 0'
      ''
      'UNION'
      ''
      'SELECT EMPRESA,ARTICULO,NRO_SERIE FROM NRO_SERIE_KRI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' ARTICULO = ?ARTICULO AND'
      ' EJERCICIO_DEC = ?EJERCICIO AND'
      ' CANAL_DEC = ?CANAL AND'
      ' SERIE_DEC = ?SERIE AND'
      ' RIG_DEC = ?RIG AND'
      ' LINEA_DEC = ?LINEA AND'
      ' DEVOLUCION = 1')
    UniDirectional = True
    DataSource = DSQMDetalle
    Left = 488
    Top = 488
  end
  object xDatosIVA: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_CABECERAS_E_REDONDEOS'
      'WHERE'
      'ID_E = :ID_E'
      'ORDER BY P_IVA DESC')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 32
    Top = 344
  end
  object DSxDatosIVA: TDataSource
    DataSet = xDatosIVA
    Left = 120
    Top = 344
  end
  object frDBxDatosIVA: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDatosIVA
    Left = 224
    Top = 344
  end
  object QGen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 488
    Top = 152
  end
  object xUpdateaDocumentos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    UniDirectional = False
    Left = 488
    Top = 200
  end
  object DSDobleCabecera: TDataSource
    DataSet = DobleCabecera
    Left = 120
    Top = 536
  end
  object DobleCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_ALBARAN_PROV'
      'where ID_E = ?ID_E'
      'order by rig')
    UniDirectional = False
    AfterScroll = DobleCabeceraAfterScroll
    Left = 32
    Top = 536
  end
  object HYRSDobleCabecera: THYReportSource
    DataSet = DobleCabecera
    CloseDataset = True
    Left = 224
    Top = 536
  end
  object xLotes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM GES_DETALLES_E_LOTES'
      '  WHERE (id_detalles_e=?id_detalles_e)')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 32
    Top = 392
  end
  object DSxLotes: TDataSource
    DataSet = xLotes
    Left = 120
    Top = 392
  end
  object frDBxLotes: TfrDBDataSet
    DataSource = DSxLotes
    Left = 224
    Top = 392
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
    DataSource = DSQMDetalle
    Left = 32
    Top = 440
  end
  object DSxNroSerie: TDataSource
    DataSet = xNroSerie
    Left = 120
    Top = 440
  end
  object frDBxNroSerie: TfrDBDataSet
    DataSource = DSxNroSerie
    Left = 224
    Top = 440
  end
  object HYRSxNroSerie: THYReportSource
    DataSet = xNroSerie
    CloseDataset = True
    Left = 344
    Top = 440
  end
  object HYRSxLotes: THYReportSource
    DataSet = xLotes
    CloseDataset = True
    Left = 344
    Top = 392
  end
  object HYRSxArticulos: THYReportSource
    DataSet = xArticulos
    CloseDataset = True
    Left = 344
    Top = 488
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
    DataSource = DSQMDetalle
    Left = 32
    Top = 488
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 120
    Top = 488
  end
  object frDBxArticulos: TfrDBDataSet
    DataSource = DSxArticulos
    Left = 224
    Top = 488
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
    DataSource = DSQMCabecera
    Left = 488
    Top = 248
  end
  object DSxProyectos: TDataSource
    DataSet = xProyectos
    Left = 576
    Top = 248
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
    DataSource = DSQMDetalle
    Left = 488
    Top = 296
  end
  object DSxProyectosDetalle: TDataSource
    DataSet = xProyectosDetalle
    Left = 576
    Top = 296
  end
  object frxAlbaranes: TfrxHYReport
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
    OnBeforePrint = frxAlbaranesBeforePrint
    OnGetValue = frxAlbaranesGetValue
    OnPrintReport = frxAlbaranesPrintReport
    OnUserFunction = frxAlbaranesUserFunction
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 288
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxUDPie: TfrxUserDataSet
    RangeEnd = reCount
    RangeEndCount = 1
    UserName = 'frxUDPie'
    Left = 584
    Top = 8
  end
  object frxUDNotasArt: TfrxUserDataSet
    RangeEnd = reCount
    UserName = 'frxUDNotasArt'
    OnCheckEOF = frUDNotasArtCheckEOF
    OnFirst = frUDNotasArtFirst
    OnNext = frUDNotasArtNext
    Left = 488
    Top = 8
  end
  object xArticulosIdioma: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM ART_ARTICULOS_IDIOMAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ARTICULO = :ARTICULO AND'
      'IDIOMA = :IDIOMA')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 488
    Top = 536
  end
  object DSxArticulosIdioma: TDataSource
    DataSet = xArticulosIdioma
    Left = 576
    Top = 536
  end
  object DSDetalleUE: TDataSource
    DataSet = QMDetalleUE
    Left = 400
    Top = 296
  end
  object QMDetalleUE: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
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
    DataSource = DSQMDetalle
    Left = 320
    Top = 296
  end
  object frDBGrupoTalla: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSGrupoTalla
    Left = 864
    Top = 8
  end
  object DSGrupoTalla: TDataSource
    DataSet = QMGrupoTalla
    Left = 776
    Top = 8
  end
  object HYRSGrupoTalla: THYReportSource
    DataSet = QMGrupoTalla
    CloseDataset = True
    Left = 1000
    Top = 8
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
    Plan.Strings = (
      
        'PLAN JOIN (VER_CABECERAS_FACTURA CAB INDEX (GES_CABECERAS_S_ID),' +
        'VER_CABECERAS_FACTURA FAC INDEX (GES_CABECERAS_S_FAC_ID),VER_CAB' +
        'ECERAS_FACTURA TER INDEX (PK_SYS_TERCEROS))')
    AfterOpen = QMGrupoTallaAfterOpen
    BeforeClose = QMGrupoTallaBeforeClose
    Left = 704
    Top = 8
  end
  object HYRMGrupoTalla: THYReportMailSource
    DataSet = QMGrupoTalla
    CloseDataset = True
    Left = 1080
    Top = 8
  end
  object frxDBGrupoTalla: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSGrupoTalla
    Left = 936
    Top = 8
  end
  object frDBTituloTalla: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSTituloTalla
    Left = 864
    Top = 56
  end
  object DSTituloTalla: TDataSource
    DataSet = QMTituloTalla
    Left = 776
    Top = 56
  end
  object HYRSTituloTalla: THYReportSource
    DataSet = QMTituloTalla
    CloseDataset = True
    Left = 1000
    Top = 56
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
    Left = 704
    Top = 56
  end
  object HYRMTituloTalla: THYReportMailSource
    DataSet = QMTituloTalla
    CloseDataset = True
    Left = 1080
    Top = 56
  end
  object frxDBTituloTalla: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSTituloTalla
    Left = 936
    Top = 56
  end
  object frDBDetalleTallas: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSDetalleTallas
    Left = 864
    Top = 104
  end
  object DSDetalleTallas: TDataSource
    DataSet = QMDetalleTallas
    Left = 776
    Top = 104
  end
  object HYRSDetalleTallas: THYReportSource
    DataSet = QMDetalleTallas
    CloseDataset = True
    Left = 1000
    Top = 104
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
    Left = 704
    Top = 104
  end
  object HYRMDetalleTallas: THYReportMailSource
    DataSet = QMDetalleTallas
    CloseDataset = True
    Left = 1080
    Top = 104
  end
  object frxDBDetalleTallas: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSDetalleTallas
    Left = 936
    Top = 104
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
    Left = 704
    Top = 149
  end
  object DSArticuloTallas: TDataSource
    DataSet = QMArticuloTallas
    Left = 800
    Top = 149
  end
  object DSxDobleIva: TDataSource
    DataSet = xDobleIva
    Left = 792
    Top = 200
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
    Left = 704
    Top = 200
  end
end
