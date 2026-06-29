object DMLstPedidos: TDMLstPedidos
  OldCreateOrder = False
  OnCreate = DMLstPedidosCreate
  OnDestroy = DMLstPedidosDestroy
  Left = 207
  Top = 71
  Height = 856
  Width = 1579
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
    Left = 232
    Top = 8
    ReportForm = {19000000}
  end
  object frDBCabecera: TfrDBDataSet
    DataSource = DSCabecera
    Left = 232
    Top = 56
  end
  object frDBdetalle: TfrDBDataSet
    DataSource = DSDetalle
    Left = 232
    Top = 104
  end
  object DSCabecera: TDataSource
    DataSet = QMCabecera
    Left = 120
    Top = 56
  end
  object QMDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_PEDIDO_LST'
      'WHERE '
      'ID_S = ?ID_S AND '
      'TIPO_LINEA <> '#39'PRM'#39
      'ORDER BY ORDEN')
    UniDirectional = False
    DataSource = DSCabecera
    Plan.Strings = (
      'PLAN (VER_DETALLE_PEDIDO CAB INDEX (GES_CABECERAS_S_ID),'
      '           VER_DETALLE_PEDIDO DET INDEX (GES_DETALLES_S_CAB_ID),'
      '           VER_DETALLE_PEDIDO PED INDEX (GES_DETALLES_S_PED_ID))')
    AfterOpen = QMDetalleAfterOpen
    AfterScroll = QMDetalleAfterScroll
    BeforeClose = QMDetalleBeforeClose
    Left = 32
    Top = 104
  end
  object DSDetalle: TDataSource
    DataSet = QMDetalle
    Left = 120
    Top = 104
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
    AfterOpen = xClienteAfterOpen
    AfterScroll = xClienteAfterScroll
    BeforeClose = xClienteBeforeClose
    Left = 32
    Top = 152
  end
  object DSxCliente: TDataSource
    DataSet = xCliente
    Left = 120
    Top = 152
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
    Top = 248
  end
  object frUDPie: TfrUserDataset
    RangeEnd = reCount
    RangeEndCount = 1
    Left = 544
    Top = 200
  end
  object frUDNotasArt: TfrUserDataset
    OnCheckEOF = frUDNotasArtCheckEOF
    OnFirst = frUDNotasArtFirst
    OnNext = frUDNotasArtNext
    Left = 544
    Top = 8
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
    Left = 32
    Top = 200
  end
  object DSxTercero: TDataSource
    DataSet = xTercero
    Left = 120
    Top = 200
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_PEDIDO_LST'
      'WHERE'
      'ID_S = ?ID_S')
    UniDirectional = False
    Plan.Strings = (
      'PLAN JOIN (VER_CABECERAS_PEDIDO CAB INDEX (GES_CABECERAS_S_ID),'
      
        '           VER_CABECERAS_PEDIDO PED INDEX (GES_CABECERAS_S_PED_I' +
        'D),'
      '           VER_CABECERAS_PEDIDO TER INDEX (PK_SYS_TERCEROS))')
    AfterOpen = QMCabeceraAfterOpen
    AfterScroll = QMCabeceraAfterScroll
    BeforeClose = QMCabeceraBeforeClose
    Left = 32
    Top = 56
  end
  object HYReport: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 1990
    ValorGrupo = 39
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
    Titulo = 'Pedido de Clientes (Doble Cabecera-4C)'
    ControlaLongitud = True
    OnEnterFields = HYReportEnterFields
    OnPrintReport = HYReportPrintReport
    Left = 336
    Top = 8
  end
  object HYRSCabecera: THYReportSource
    DataSet = QMCabecera
    CloseDataset = True
    Left = 336
    Top = 56
  end
  object HYRSDetalle: THYReportSource
    DataSet = QMDetalle
    CloseDataset = True
    Left = 336
    Top = 104
  end
  object HYRSxCliente: THYReportSource
    DataSet = xCliente
    CloseDataset = True
    Left = 336
    Top = 152
  end
  object HYRSxDireccionCliente: THYReportSource
    DataSet = xDireccion_Cliente
    CloseDataset = True
    Left = 336
    Top = 248
  end
  object HYRxTercero: THYReportSource
    DataSet = xTercero
    CloseDataset = True
    Left = 336
    Top = 200
  end
  object DobleCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_PEDIDO_LST'
      'WHERE '
      'ID_S = ?ID_S')
    UniDirectional = False
    Plan.Strings = (
      'PLAN JOIN (VER_CABECERAS_PEDIDO CAB INDEX (GES_CABECERAS_S_ID),'
      
        '           VER_CABECERAS_PEDIDO PED INDEX (GES_CABECERAS_S_PED_I' +
        'D),'
      '           VER_CABECERAS_PEDIDO TER INDEX (PK_SYS_TERCEROS))'
      '')
    AfterOpen = DobleCabeceraAfterOpen
    AfterScroll = DobleCabeceraAfterScroll
    BeforeClose = DobleCabeceraBeforeClose
    Left = 32
    Top = 344
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
    Left = 32
    Top = 392
  end
  object DSDobleCabecera: TDataSource
    DataSet = DobleCabecera
    Left = 120
    Top = 344
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
    Left = 32
    Top = 296
  end
  object HYRxDobFormaPago: THYReportSource
    DataSet = xDobFormaPago
    CloseDataset = True
    Left = 336
    Top = 296
  end
  object HYRDobleCabecera: THYReportSource
    DataSet = DobleCabecera
    CloseDataset = True
    Left = 336
    Top = 344
  end
  object HYRSDobleIva: THYReportSource
    DataSet = xDobleIva
    CloseDataset = True
    Left = 336
    Top = 392
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
    Left = 656
    Top = 56
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 760
    Top = 56
  end
  object xFormaPago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT* FROM VER_FORMAS_PAGO_EMP'
      'WHERE EMPRESA=?EMPRESA AND'
      '               EJERCICIO=?EJERCICIO AND'
      '               CANAL=?CANAL AND'
      '               FORMA=?FORMA_PAGO')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 872
    Top = 192
  end
  object xAlmacen: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ART_ALMACENES'
      'WHERE EMPRESA = ?EMPRESA AND ALMACEN = ?ALMACEN'
      '')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 656
    Top = 296
  end
  object DSxAlmacen: TDataSource
    DataSet = xAlmacen
    Left = 760
    Top = 296
  end
  object QGen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 656
    Top = 8
  end
  object xUpdateaDocumentos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    UniDirectional = False
    Left = 760
    Top = 8
  end
  object DSxDobleIva: TDataSource
    DataSet = xDobleIva
    Left = 120
    Top = 392
  end
  object DSxDobFormaPago: TDataSource
    DataSet = xDobFormaPago
    Left = 120
    Top = 296
  end
  object DSxDireccion_Cliente: TDataSource
    DataSet = xDireccion_Cliente
    Left = 120
    Top = 248
  end
  object DSxDireccionFiscal: TDataSource
    DataSet = xDireccionFiscal
    Left = 760
    Top = 344
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
    Left = 656
    Top = 344
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
    Left = 232
    Top = 488
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
    Left = 656
    Top = 392
  end
  object DSxMonedasIdiomas: TDataSource
    DataSet = xMonedasIdiomas
    Left = 760
    Top = 392
  end
  object HYRSxArticulos: THYReportSource
    DataSet = xArticulos
    CloseDataset = True
    Left = 336
    Top = 488
  end
  object frDBxGarantiasKri: TfrDBDataSet
    DataSource = DSxGarantiasKri
    Left = 232
    Top = 584
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
    Left = 32
    Top = 584
  end
  object DSxGarantiasKri: TDataSource
    DataSet = xGarantiasKri
    Left = 120
    Top = 584
  end
  object QMPromociones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select'
      'CAB.EMPRESA, CAB.EJERCICIO, CAB.CANAL, CAB.SERIE, CAB.TIPO,'
      
        'CAB.RIG, DET.LINEA, CAB.ESTADO, CAB.CLIENTE, CAB.MONEDA, DET.ALM' +
        'ACEN,'
      
        'DET.ARTICULO, DET.TITULO, DET.UNIDADES, PED.U_SERVIDAS AS UNIDAD' +
        'ES_SERVIDAS,'
      
        'PED.U_PENDIENTES AS UNIDADES_PENDIENTES, PED.U_RESERVADAS AS UNI' +
        'DADES_RESERVADAS,'
      
        'PED.SERVIDO, DET.PRECIO, DET.PIEZAS_X_BULTO, DET.BULTOS, DET.DES' +
        'CUENTO,'
      
        'DET.DESCUENTO_2, DET.DESCUENTO_3, DET.COMISION, DET.P_COSTE, DET' +
        '.M_MOV_STOCK,'
      
        'DET.TIPO_IVA, DET.P_IVA, DET.P_RECARGO, DET.BRUTO, DET.B_COMISIO' +
        'N,'
      
        'DET.I_DESCUENTO, DET.B_IMPONIBLE, DET.B_DTO_LINEA, DET.I_COMISIO' +
        'N, DET.C_IVA,'
      
        'DET.C_RECARGO, DET.T_COSTE, DET.M_BRUTO, DET.LIQUIDO, DET.ENTRAD' +
        'A,'
      
        'PED.ENTRADA_AGRUPACION, DET.NOTAS, DET.UNIDADES_EXT, PED.ORDEN_P' +
        'RODUCCION,'
      
        'DET.UNIDADES_SEC, PED.DIRECCION_ENTREGA, LOC.PAIS, DET.ID_DETALL' +
        'ES_S, CAB.ID_S,'
      
        'DET.ID_A, DET.ID_C_A, DET.COMISION_LINEAL, DET.I_COMISION_LINEAL' +
        ','
      
        'PED.FECHA_ENTREGA_PREV, PED.FECHA_REC_DET, DET.TITULO_IDIOMA, DE' +
        'T.MARGEN_KRI,'
      
        'det.tipo_linea_kri, DET.ORDEN, DET.TIPO_LINEA, DET.PROC_PROMOCIO' +
        'N, DET.ORIGEN,'
      
        'DET.ID_P, DET.APLICA_UNIDADES_SECUNDARIAS, DET.PROYECTO, det.not' +
        'as2, det.crc_notas,'
      'det.crc_notas2, det.pro_num_plano, PED.TIPO_UNIDAD_LOGISTICA,'
      'STU.TITULO AS TITULO_UNIDAD_LOGISTICA, PED.UNIDADES_LOGISTICAS'
      'from GES_DETALLES_S DET'
      'left join GES_CABECERAS_S CAB'
      'on (det.id_s = cab.id_s)'
      'join GES_DETALLES_S_PED PED'
      'on (det.id_detalles_s = ped.id_detalles_s)'
      'left join SYS_TIPO_UNIDAD_LOGISTICA STU'
      'on (STU.TIPO = PED.TIPO_UNIDAD_LOGISTICA)'
      'left join SYS_TERCEROS_DIRECCIONES DIR'
      
        'on (cab.tercero = dir.tercero and dir.DIRECCION = PED.DIRECCION_' +
        'ENTREGA)'
      'join SYS_LOCALIDADES LOC'
      'on (loc.id_local = dir.id_local)'
      'where'
      'det.ID_S = ?ID_S AND'
      'det.origen=?ID_DETALLES_S and '
      'det.tipo_linea <> '#39'PRM'#39
      'order by orden')
    UniDirectional = False
    DataSource = DSDetalle
    AfterOpen = QMPromocionesAfterOpen
    AfterScroll = QMPromocionesAfterScroll
    BeforeClose = QMPromocionesBeforeClose
    Left = 32
    Top = 440
  end
  object DSQMPromociones: TDataSource
    DataSet = QMPromociones
    Left = 120
    Top = 440
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
    Left = 32
    Top = 536
  end
  object DSxArticulosPRM: TDataSource
    DataSet = xArticulosPRM
    Left = 120
    Top = 536
  end
  object frDBxArticulosPRM: TfrDBDataSet
    DataSource = DSxArticulosPRM
    Left = 232
    Top = 536
  end
  object frDBPromociones: TfrDBDataSet
    DataSource = DSQMPromociones
    Left = 232
    Top = 440
  end
  object frUDNotasArtPRM: TfrUserDataset
    OnCheckEOF = frUDNotasArtPRMCheckEOF
    OnFirst = frUDNotasArtPRMFirst
    OnNext = frUDNotasArtPRMNext
    Left = 544
    Top = 56
  end
  object HYRSPromociones: THYReportSource
    DataSet = QMPromociones
    CloseDataset = True
    Left = 336
    Top = 440
  end
  object frxPedidos: TfrxHYReport
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
    OnBeforePrint = frxPedidosBeforePrint
    OnGetValue = frxPedidosGetValue
    OnPrintReport = frxPedidosPrintReport
    OnUserFunction = frxPedidosUserFunction
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 448
    Top = 8
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
    Top = 152
  end
  object frxDBCabecera: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSCabecera
    Left = 448
    Top = 56
  end
  object frxUDNotasArt: TfrxUserDataSet
    UserName = 'frxUDNotasArt'
    OnCheckEOF = frUDNotasArtCheckEOF
    OnFirst = frUDNotasArtFirst
    OnNext = frUDNotasArtNext
    Left = 544
    Top = 104
  end
  object frxDBDetalle: TfrxDBDataset
    UserName = 'frxDBDetalle'
    CloseDataSource = False
    DataSource = DSDetalle
    Left = 448
    Top = 104
  end
  object frxDBPromociones: TfrxDBDataset
    UserName = 'frxDBPromociones'
    CloseDataSource = False
    DataSource = DSQMPromociones
    Left = 440
    Top = 440
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
    Left = 656
    Top = 200
  end
  object DSxProyectos: TDataSource
    DataSet = xProyectos
    Left = 760
    Top = 200
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
    Left = 656
    Top = 152
  end
  object DSxProyectosDetalle: TDataSource
    DataSet = xProyectosDetalle
    Left = 760
    Top = 152
  end
  object DSxTransportistas: TDataSource
    DataSet = xTransportistas
    Left = 760
    Top = 104
  end
  object xTransportistas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_TRANSPORTISTAS             '
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'TRANSPORTISTA=?TRANSPORTISTA'
      '')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 656
    Top = 104
  end
  object QMDetalleAlfa1Alfa2Mod: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT P.*, M.BASE_CREACION, M.COD_MOD, M.TITULO AS TITULOMODELO'
      'FROM VER_DETALLE_PEDIDO_LST P'
      'LEFT JOIN ART_ARTICULOS A ON A.ID_A = P.ID_A'
      
        'LEFT JOIN ART_ARTICULOS_M_C_TALLAS T1 ON T1.ID_A_M_C_T = A.ID_A_' +
        'M_C_T'
      
        'LEFT JOIN ART_ARTICULOS_MOD_COLOR T2 ON T2.ID_A_M_C = T1.ID_A_M_' +
        'C'
      'LEFT JOIN ART_ARTICULOS_MODELOS M ON M.ID_A_M = T2.ID_A_M'
      'WHERE'
      'P.ID_S = :ID_S AND'
      'P.TIPO_LINEA <> '#39'PRM'#39
      'ORDER BY P.ALFA_1, P.ALFA_2, P.ARTICULO')
    UniDirectional = False
    DataSource = DSCabecera
    Plan.Strings = (
      'PLAN (VER_DETALLE_PEDIDO CAB INDEX (GES_CABECERAS_S_ID),'
      '           VER_DETALLE_PEDIDO DET INDEX (GES_DETALLES_S_CAB_ID),'
      '           VER_DETALLE_PEDIDO PED INDEX (GES_DETALLES_S_PED_ID))')
    AfterOpen = QMDetalleAfterOpen
    AfterScroll = QMDetalleAfterScroll
    BeforeClose = QMDetalleBeforeClose
    Left = 32
    Top = 632
  end
  object DSDetalleAlfa1Alfa2Mod: TDataSource
    DataSet = QMDetalleAlfa1Alfa2Mod
    Left = 120
    Top = 632
  end
  object frDSDetalleAlfa1Alfa2Mod: TfrDBDataSet
    DataSource = DSDetalleAlfa1Alfa2Mod
    Left = 232
    Top = 632
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
    Left = 872
    Top = 288
  end
  object DSDetalleUE: TDataSource
    DataSet = QMDetalleUE
    Left = 760
    Top = 584
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
    Left = 656
    Top = 584
  end
  object DSDireccionEntregaLinea: TDataSource
    DataSet = xDireccionEntregaLinea
    Left = 760
    Top = 536
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
    Left = 656
    Top = 536
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
    Left = 656
    Top = 440
  end
  object DSxRecibosAnticipos: TDataSource
    DataSet = xRecibosAnticipos
    Left = 760
    Top = 440
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
    Left = 656
    Top = 488
  end
  object DSxTotalRecibosAnticipos: TDataSource
    DataSet = xTotalRecibosAnticipos
    Left = 760
    Top = 488
  end
  object frDBxRecibosAnticipos: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxRecibosAnticipos
    Left = 872
    Top = 440
  end
  object frDBxTotalRecibosAnticipos: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxTotalRecibosAnticipos
    Left = 872
    Top = 488
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
    Left = 32
    Top = 680
  end
  object DSxLstFirmas: TDataSource
    DataSet = xLstFirmas
    Left = 120
    Top = 680
  end
  object frDBDLstFirmas: TfrDBDataSet
    DataSource = DSxLstFirmas
    Left = 232
    Top = 680
  end
  object frxDBxLstFirmas: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = xLstFirmas
    Left = 440
    Top = 680
  end
  object frDBGrupoTalla: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSGrupoTalla
    Left = 1160
    Top = 8
  end
  object DSGrupoTalla: TDataSource
    DataSet = QMGrupoTalla
    Left = 1072
    Top = 8
  end
  object HYRSGrupoTalla: THYReportSource
    DataSet = QMGrupoTalla
    CloseDataset = True
    Left = 1296
    Top = 8
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
    Left = 1000
    Top = 8
  end
  object HYRMGrupoTalla: THYReportMailSource
    DataSet = QMGrupoTalla
    CloseDataset = True
    Left = 1376
    Top = 8
  end
  object frxDBGrupoTalla: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSGrupoTalla
    Left = 1232
    Top = 8
  end
  object frDBTituloTalla: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSTituloTalla
    Left = 1160
    Top = 56
  end
  object DSTituloTalla: TDataSource
    DataSet = QMTituloTalla
    Left = 1072
    Top = 56
  end
  object HYRSTituloTalla: THYReportSource
    DataSet = QMTituloTalla
    CloseDataset = True
    Left = 1296
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
    Left = 1000
    Top = 56
  end
  object HYRMTituloTalla: THYReportMailSource
    DataSet = QMTituloTalla
    CloseDataset = True
    Left = 1376
    Top = 56
  end
  object frxDBTituloTalla: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSTituloTalla
    Left = 1232
    Top = 56
  end
  object frDBDetalleTallas: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSDetalleTallas
    Left = 1160
    Top = 104
  end
  object DSDetalleTallas: TDataSource
    DataSet = QMDetalleTallas
    Left = 1072
    Top = 104
  end
  object HYRSDetalleTallas: THYReportSource
    DataSet = QMDetalleTallas
    CloseDataset = True
    Left = 1296
    Top = 104
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
    Left = 1000
    Top = 104
  end
  object HYRMDetalleTallas: THYReportMailSource
    DataSet = QMDetalleTallas
    CloseDataset = True
    Left = 1376
    Top = 104
  end
  object frxDBDetalleTallas: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSDetalleTallas
    Left = 1232
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
    Left = 1000
    Top = 152
  end
  object DSArticuloTallas: TDataSource
    DataSet = QMArticuloTallas
    Left = 1112
    Top = 152
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
    Left = 1000
    Top = 200
  end
  object DSxAgente: TDataSource
    DataSet = xAgente
    Left = 1112
    Top = 200
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
    Left = 1000
    Top = 248
  end
  object DSxContacto: TDataSource
    DataSet = xContacto
    Left = 1112
    Top = 248
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
    Left = 32
    Top = 728
  end
  object DSEscandallo: TDataSource
    DataSet = QMEscandallo
    Left = 120
    Top = 728
  end
  object frDBDEscandallo: TfrDBDataSet
    DataSource = DSEscandallo
    Left = 232
    Top = 728
  end
  object HYRSEscandallo: THYReportSource
    DataSet = QMEscandallo
    CloseDataset = True
    Left = 336
    Top = 728
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
    Left = 656
    Top = 632
  end
  object DSxTipoPorte: TDataSource
    DataSet = xTipoPorte
    Left = 760
    Top = 632
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
    Left = 656
    Top = 680
  end
  object DSxDobTipoPorte: TDataSource
    DataSet = xDobTipoPorte
    Left = 760
    Top = 680
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
    Left = 656
    Top = 728
  end
  object DSQSPProcedencia: TDataSource
    DataSet = QSPProcedencia
    Left = 760
    Top = 728
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
    DataSource = DSDetalle
    AfterOpen = xOrdProdAfterOpen
    BeforeClose = xOrdProdBeforeClose
    Left = 1000
    Top = 296
  end
  object DSxOrdProd: TDataSource
    DataSet = xOrdProd
    Left = 1112
    Top = 296
  end
  object DSxOrdProdEmpleado: TDataSource
    DataSet = xOrdProdEmpleado
    Left = 1112
    Top = 343
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
    Left = 1000
    Top = 343
  end
  object frDBxNotasCliente: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxNotasCliente
    Left = 232
    Top = 773
  end
  object DSxNotasCliente: TDataSource
    DataSet = xNotasCliente
    Left = 120
    Top = 773
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
    Left = 32
    Top = 773
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
    Left = 1000
    Top = 392
  end
  object DSxArticulosIdioma: TDataSource
    DataSet = xArticulosIdioma
    Left = 1112
    Top = 392
  end
  object frDBxArticulosIdioma: TfrDBDataSet
    DataSource = DSxArticulosIdioma
    Left = 1224
    Top = 392
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
    Left = 1000
    Top = 436
  end
  object DSxArticuloTYC: TDataSource
    DataSet = xArticuloTYC
    Left = 1112
    Top = 436
  end
  object xFichaTecnica: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_FICHA_TECNICA'
      'WHERE'
      'ID_FICHA_TECNICA = :ID_FICHA_TECNICA')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 1000
    Top = 484
  end
  object DSxFichaTecnica: TDataSource
    DataSet = xFichaTecnica
    Left = 1112
    Top = 484
  end
  object xTerceroBanco: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'SELECT ORDEN, CAST(BANCO AS INTEGER) BANCO, TITULO, ENTIDAD, SUC' +
        'URSAL, CONTROL, CUENTA, IBAN, BIC'
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
      '       CONTROL, CUENTA_CORRIENTE, IBAN, BIC'
      'FROM EMP_BANCOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'BANCO = :BANCO AND'
      'ACTIVO = 1'
      'ORDER BY 1')
    UniDirectional = False
    Left = 1000
    Top = 576
  end
  object DSxTerceroBanco: TDataSource
    DataSet = xTerceroBanco
    Left = 1112
    Top = 576
  end
  object xDobTerceroBan: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'SELECT ORDEN, CAST(BANCO AS INTEGER) BANCO, TITULO, ENTIDAD, SUC' +
        'URSAL, CONTROL, CUENTA, IBAN, BIC'
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
      '       CONTROL, CUENTA_CORRIENTE, IBAN, BIC'
      'FROM EMP_BANCOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'BANCO = :BANCO AND'
      'ACTIVO = 1'
      'ORDER BY 1')
    UniDirectional = False
    Left = 1000
    Top = 528
  end
  object DSxDobTerceroBan: TDataSource
    DataSet = xDobTerceroBan
    Left = 1112
    Top = 528
  end
  object frDBxDobTerceroBan: TfrDBDataSet
    DataSource = DSxDobTerceroBan
    Left = 1224
    Top = 528
  end
  object frDBxTerceroBanco: TfrDBDataSet
    DataSource = DSxTerceroBanco
    Left = 1224
    Top = 576
  end
end
