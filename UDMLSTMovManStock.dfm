object DMLSTMovManStock: TDMLSTMovManStock
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 410
  Top = 139
  Height = 721
  Width = 649
  object FRMovManStock: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Movimientos de Stock'
    RebuildPrinter = False
    OnGetValue = FRMovManStockGetValue
    OnBeforePrint = FRMovManStockEnterRect
    OnEnterRect = FRMovManStockEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 240
    Top = 16
    ReportForm = {19000000}
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_CABECERAS_ST'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'SERIE = :SERIE AND'
      'RIG = :RIG')
    UniDirectional = False
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    Left = 40
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 40
    Top = 16
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 128
    Top = 64
  end
  object QMDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM GES_DETALLES_ST'
      'WHERE'
      'ID_ST = :ID_ST'
      'ORDER BY LINEA')
    UniDirectional = False
    DataSource = DSQMCabecera
    AfterOpen = QMDetalleAfterOpen
    AfterScroll = QMDetalleAfterScroll
    BeforeClose = QMDetalleBeforeClose
    Left = 40
    Top = 112
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 128
    Top = 112
  end
  object FRDSQMcabecera: TfrDBDataSet
    DataSource = DSQMCabecera
    Left = 240
    Top = 64
  end
  object FRDBSQMDetalle: TfrDBDataSet
    DataSource = DSQMDetalle
    Left = 240
    Top = 112
  end
  object xAlmacenOrig: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM ART_ALMACENES A'
      'JOIN SYS_TERCEROS T ON A.TERCERO = T.TERCERO'
      'WHERE'
      'A.EMPRESA = :EMPRESA AND'
      'A.ALMACEN = :ALMACEN_ORI')
    UniDirectional = False
    DataSource = DSQDatosCabecera
    Left = 40
    Top = 304
  end
  object xAlmacenDst: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM ART_ALMACENES A'
      'JOIN SYS_TERCEROS T ON A.TERCERO = T.TERCERO'
      'WHERE'
      'A.EMPRESA = :EMPRESA AND'
      'A.ALMACEN = :ALMACEN_DST')
    UniDirectional = False
    DataSource = DSQDatosCabecera
    Left = 40
    Top = 352
  end
  object xCanalOrig: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_CANALES_ACTIVOS'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL_ORI')
    UniDirectional = False
    DataSource = DSQDatosCabecera
    Left = 40
    Top = 400
  end
  object xCanalDst: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_CANALES_ACTIVOS'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL_DST')
    UniDirectional = False
    DataSource = DSQDatosCabecera
    Left = 40
    Top = 448
  end
  object DSxAlmacenOrig: TDataSource
    DataSet = xAlmacenOrig
    Left = 128
    Top = 304
  end
  object DSxAlmacenDst: TDataSource
    DataSet = xAlmacenDst
    Left = 128
    Top = 352
  end
  object DSxCanalOrig: TDataSource
    DataSet = xCanalOrig
    Left = 128
    Top = 400
  end
  object DSxCanalDst: TDataSource
    DataSet = xCanalDst
    Left = 128
    Top = 448
  end
  object HYReport: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 849
    ValorGrupo = 507
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
    Titulo = 'Listado Matricial Movimientos de Stock'
    ControlaLongitud = True
    OnEnterFields = HYReportEnterFields
    Left = 360
    Top = 16
  end
  object HYRSCabecera: THYReportSource
    DataSet = QMCabecera
    CloseDataset = True
    Left = 360
    Top = 64
  end
  object HYRSDetalle: THYReportSource
    DataSet = QMDetalle
    CloseDataset = True
    Left = 360
    Top = 112
  end
  object HYRSAlmacenOrig: THYReportSource
    DataSet = xAlmacenOrig
    CloseDataset = True
    Left = 360
    Top = 304
  end
  object HYRSAlmacenDst: THYReportSource
    DataSet = xAlmacenDst
    CloseDataset = True
    Left = 360
    Top = 352
  end
  object HYRSCanalOrig: THYReportSource
    DataSet = xCanalOrig
    CloseDataset = True
    Left = 360
    Top = 400
  end
  object HYRSCanalDst: THYReportSource
    DataSet = xCanalDst
    CloseDataset = True
    Left = 360
    Top = 448
  end
  object xArticuloD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    Left = 40
    Top = 496
  end
  object DSxArticuloD: TDataSource
    DataSet = xArticuloD
    Left = 128
    Top = 496
  end
  object DSxArticuloH: TDataSource
    DataSet = xArticuloH
    Left = 128
    Top = 544
  end
  object xArticuloH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    Left = 40
    Top = 544
  end
  object xFamiliaH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_FAMILIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  FAMILIA=?FAMILIA ')
    SelectSQL.Strings = (
      'SELECT TITULO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND FAMILIA=?FAMILIA')
    UniDirectional = False
    Left = 464
    Top = 256
  end
  object DSxFamiliaH: TDataSource
    DataSet = xFamiliaH
    Left = 544
    Top = 256
  end
  object DSxFamiliaD: TDataSource
    DataSet = xFamiliaD
    Left = 544
    Top = 208
  end
  object xFamiliaD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_FAMILIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  FAMILIA=?FAMILIA ')
    SelectSQL.Strings = (
      'SELECT TITULO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND FAMILIA=?FAMILIA')
    UniDirectional = False
    Left = 464
    Top = 208
  end
  object xAlmacenH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_FAMILIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  FAMILIA=?FAMILIA ')
    SelectSQL.Strings = (
      'SELECT TITULO FROM ART_ALMACENES'
      'WHERE EMPRESA=?EMPRESA')
    UniDirectional = False
    Left = 464
    Top = 352
  end
  object DSxAlmacenH: TDataSource
    DataSet = xAlmacenH
    Left = 544
    Top = 352
  end
  object DSxAlmacenD: TDataSource
    DataSet = xAlmacenD
    Left = 544
    Top = 304
  end
  object xAlmacenD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_FAMILIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  FAMILIA=?FAMILIA ')
    SelectSQL.Strings = (
      'SELECT TITULO FROM ART_ALMACENES'
      'WHERE EMPRESA=?EMPRESA')
    UniDirectional = False
    Left = 464
    Top = 304
  end
  object QMinArticulo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(ARTICULO) AS MINIMO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 464
    Top = 64
  end
  object QMaxArticulo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(ARTICULO) AS MAXIMO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 544
    Top = 64
  end
  object QMinFamilia: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(FAMILIA) AS MINIMO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 464
    Top = 112
  end
  object QMaxFamilia: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(FAMILIA) AS MAXIMO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 544
    Top = 112
  end
  object QMinAlmacen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MIN(ALMACEN) AS MINIMO FROM ART_ALMACENES'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 464
    Top = 16
  end
  object QMaxAlmacen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(ALMACEN) AS MAXIMO FROM ART_ALMACENES'
      'WHERE EMPRESA=?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 544
    Top = 16
  end
  object xCanales: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select canal from emp_canales '
      
        '  where((empresa=?empresa)and(ejercicio=?ejercicio)and(activo=1)' +
        ') '
      '  order by canal')
    Transaction = TLocal
    Left = 464
    Top = 160
  end
  object xAlmacenes: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select almacen from art_almacenes'
      '  where(empresa=?empresa)'
      '  order by almacen')
    Transaction = TLocal
    Left = 544
    Top = 160
  end
  object QDatosCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_CABECERAS_ST'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'SERIE = :SERIE AND'
      'RIG = :RIG')
    UniDirectional = False
    DataSource = DSQMCabecera
    AfterOpen = QDatosCabeceraAfterOpen
    BeforeClose = QDatosCabeceraBeforeClose
    Left = 40
    Top = 160
  end
  object DSQDatosCabecera: TDataSource
    DataSet = QDatosCabecera
    Left = 128
    Top = 160
  end
  object frDBDSQDatosCabecera: TfrDBDataSet
    DataSource = DSQDatosCabecera
    Left = 240
    Top = 160
  end
  object HYRSDatosCabecera: THYReportSource
    DataSet = QDatosCabecera
    CloseDataset = True
    Left = 360
    Top = 160
  end
  object xArticulosKRI: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT ARTICULO,SERIALIZADO_KRI,LOTES_KRI FROM ART_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    DataSource = DSQMDetalle
    AfterScroll = xArticulosKRIAfterScroll
    Left = 464
    Top = 400
  end
  object xDirAlmOrig: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO (?TERCERO)'
      'WHERE NUM = ?DIRECCION')
    UniDirectional = False
    DataSource = DSxAlmacenOrig
    Left = 464
    Top = 448
  end
  object xDirAlmDst: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO (?TERCERO)'
      'WHERE NUM = ?DIRECCION')
    UniDirectional = False
    DataSource = DSxAlmacenDst
    Left = 544
    Top = 448
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
      'EMPRESA = ?EMPRESA AND'
      'ARTICULO = ?ARTICULO AND'
      'EJERCICIO_MOS = ?EJERCICIO AND'
      'CANAL_MOS = ?CANAL AND'
      'SERIE_MOS = ?SERIE AND'
      'RIG_MOS = ?RIG AND'
      'LINEA_MOS = ?LINEA'
      'GROUP BY EMPRESA,ARTICULO,CADUCIDAD,LOTE, LINEA_MOS'
      ''
      'UNION'
      ''
      
        'SELECT COUNT(*),EMPRESA,ARTICULO,CADUCIDAD,LOTE FROM NRO_SERIE_K' +
        'RI'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ARTICULO = ?ARTICULO AND'
      'EJERCICIO_MOE = ?EJERCICIO AND'
      'CANAL_MOE = ?CANAL AND'
      'SERIE_MOE = ?SERIE AND'
      'RIG_MOE = ?RIG AND'
      'LINEA_MOE = ?LINEA and'
      'devolucion_venta = 0 and'
      'movimiento = 0'
      'GROUP BY EMPRESA,ARTICULO,CADUCIDAD,LOTE, LINEA_MOE'
      ''
      'UNION'
      ''
      
        'SELECT COUNT(*),EMPRESA,ARTICULO,CADUCIDAD,LOTE FROM NRO_SERIE_K' +
        'RI'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ARTICULO = ?ARTICULO AND'
      'EJERCICIO_MOV = ?EJERCICIO AND'
      'CANAL_MOV = ?CANAL AND'
      'SERIE_MOV = ?SERIE AND'
      'RIG_MOV = ?RIG AND'
      'LINEA_MOV = ?LINEA and'
      'devolucion_venta = 0 and'
      'movimiento = 1'
      'GROUP BY EMPRESA,ARTICULO,CADUCIDAD,LOTE, LINEA_MOE')
    UniDirectional = False
    Left = 464
    Top = 496
  end
  object QNroSerieKri: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT EMPRESA,ARTICULO,NRO_SERIE FROM NRO_SERIE_KRI'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ARTICULO = ?ARTICULO AND'
      'EJERCICIO_MOS = ?EJERCICIO AND'
      'CANAL_MOS = ?CANAL AND'
      'SERIE_MOS = ?SERIE AND'
      'RIG_MOS = ?RIG AND'
      'LINEA_MOS = ?LINEA and'
      'movimiento = 0'
      ''
      'UNION'
      ''
      'SELECT EMPRESA,ARTICULO,NRO_SERIE FROM NRO_SERIE_KRI'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ARTICULO = ?ARTICULO AND'
      'EJERCICIO_MOE = ?EJERCICIO AND'
      'CANAL_MOE = ?CANAL AND'
      'SERIE_MOE = ?SERIE AND'
      'RIG_MOE = ?RIG AND'
      'LINEA_MOE = ?LINEA'
      'and devolucion_venta = 0'
      ''
      'UNION'
      ''
      'SELECT EMPRESA,ARTICULO,NRO_SERIE FROM NRO_SERIE_KRI'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ARTICULO = ?ARTICULO AND'
      'EJERCICIO_MOV = ?EJERCICIO AND'
      'CANAL_MOV = ?CANAL AND'
      'SERIE_MOV = ?SERIE AND'
      'RIG_MOV = ?RIG AND'
      'LINEA_MOV = ?LINEA and'
      'movimiento = 1')
    UniDirectional = False
    Left = 40
    Top = 592
    object QNroSerieKriEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QNroSerieKriARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QNroSerieKriNRO_SERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NRO_SERIE'
      Size = 25
    end
  end
  object frUDNroSerieLote: TfrUserDataset
    OnCheckEOF = frUDNroSerieLoteCheckEOF
    OnFirst = frUDNroSerieLoteFirst
    OnNext = frUDNroSerieLoteNext
    Left = 240
    Top = 592
  end
  object frxMovManStock: TfrxHYReport
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
    OnBeforePrint = frxMovManStockBeforePrint
    OnGetValue = frxMovManStockGetValue
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
  object frDBDSQSerializacion: TfrDBDataSet
    DataSource = DSQSerializacion
    Left = 240
    Top = 208
  end
  object DSQSerializacion: TDataSource
    DataSet = QMSerializacion
    Left = 128
    Top = 208
  end
  object QMSerializacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT NSERIE'
      'FROM GES_DETALLES_SERIALIZACION DET'
      'LEFT JOIN GES_CABECERAS_ST CAB '
      'ON '
      'CAB.EMPRESA = DET.EMPRESA AND '
      'CAB.EJERCICIO = DET.EJERCICIO AND '
      'CAB.SERIE = DET.SERIE AND '
      'CAB.RIG = DET.RIG'
      'LEFT JOIN ART_ARTICULOS_SERIALIZACION SER '
      'ON '
      'DET.EMPRESA = SER.EMPRESA AND '
      'DET.CANAL = SER.CANAL AND '
      'DET.CODIGO = SER.CODIGO AND '
      'DET.ALMACEN = SER.ALMACEN'
      'WHERE'
      'DET.EMPRESA = :EMPRESA AND'
      'DET.EJERCICIO = :EJERCICIO AND'
      'DET.CANAL = :CANAL AND'
      'DET.SERIE = :SERIE AND'
      'DET.TIPO LIKE '#39'MV%'#39' AND'
      'DET.RIG = :RIG AND'
      'DET.LINEA = :LINEA')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 40
    Top = 208
  end
  object frDBQMDetalleLotes: TfrDBDataSet
    DataSource = DSQMDetalleLotes
    Left = 240
    Top = 256
  end
  object DSQMDetalleLotes: TDataSource
    DataSet = QMDetalleLotes
    Left = 128
    Top = 256
  end
  object QMDetalleLotes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_DETALLES_ST_LOTES'
      'WHERE'
      'ID_DETALLES_ST = :ID_DETALLES_ST'
      'ORDER BY SUBLINEA')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 40
    Top = 256
  end
  object xCodProv: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM ART_ARTICULOS_CODPROV'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ARTICULO = :ARTICULO AND'
      'PROVEEDOR ='
      '(SELECT FIRST 1 P.PROVEEDOR'
      'FROM GES_DETALLES_ST D'
      'JOIN GES_CABECERAS_ST C ON D.ID_ST = C.ID_ST'
      
        'JOIN ART_ALMACENES A ON A.EMPRESA = C.EMPRESA AND A.ALMACEN = C.' +
        'ALMACEN_DST'
      'JOIN SYS_TERCEROS T ON A.TERCERO = T.TERCERO'
      'JOIN EMP_PROVEEDORES P ON T.TERCERO = P.TERCERO'
      'WHERE'
      'D.ID_DETALLES_ST = :ID_DETALLES_ST)')
    UniDirectional = False
    DataSource = DSQMDetalle
    Left = 464
    Top = 544
  end
end
