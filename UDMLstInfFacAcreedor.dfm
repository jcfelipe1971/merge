object DMLstInfFacAcreedor: TDMLstInfFacAcreedor
  OldCreateOrder = False
  OnCreate = DMLstInfFacAcreedorCreate
  OnDestroy = DMLstInfFacAcreedorDestroy
  Left = 713
  Top = 191
  Height = 629
  Width = 802
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 224
    Top = 16
  end
  object DSCabecera: TDataSource
    DataSet = QMCabecera
    Left = 128
    Top = 64
  end
  object frDBCabecera: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSCabecera
    Left = 224
    Top = 64
  end
  object QMDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_FACTURA_ACR'
      'WHERE ID_E = ?ID_E'
      'order by orden')
    UniDirectional = False
    DataSource = DSCabecera
    AfterOpen = QMDetalleAfterOpen
    AfterScroll = QMDetalleAfterScroll
    Left = 32
    Top = 112
  end
  object DSDetalle: TDataSource
    DataSet = QMDetalle
    Left = 128
    Top = 112
  end
  object frDBDetalle: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSDetalle
    Left = 224
    Top = 112
  end
  object xAcr: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from dame_datos_acreedor(?EMPRESA,?EJERCICIO,?ACREEDOR,' +
        '?CANAL,?ID_E)')
    UniDirectional = False
    DataSource = DSCabecera
    AfterScroll = xAcrAfterScroll
    Left = 32
    Top = 160
  end
  object DSxAcr: TDataSource
    DataSet = xAcr
    Left = 128
    Top = 160
  end
  object frDBxAcr: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxAcr
    Left = 224
    Top = 160
  end
  object xDirAcr: TFIBDataSetRO
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
    DataSource = DSCabecera
    Left = 32
    Top = 208
  end
  object DSxDirAcr: TDataSource
    DataSet = xDirAcr
    Left = 128
    Top = 208
  end
  object frDBxDirAcr: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDirAcr
    Left = 224
    Top = 208
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
      '               FORMA=?FORMA_DE_PAGO'
      ''
      '')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 32
    Top = 256
  end
  object DSxFormaPago: TDataSource
    DataSet = xFormaPago
    Left = 128
    Top = 256
  end
  object frDBxFormaPago: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxFormaPago
    Left = 224
    Top = 256
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
    Left = 32
    Top = 304
  end
  object DSxDatosIva: TDataSource
    DataSet = xDatosIva
    Left = 128
    Top = 304
  end
  object frDBxDatosIva: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDatosIva
    Left = 224
    Top = 304
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
    Top = 352
  end
  object DSxNombreIva: TDataSource
    DataSet = xNombreIva
    Left = 128
    Top = 352
  end
  object frDBxNombreIva: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxNombreIva
    Left = 224
    Top = 352
  end
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
    Left = 32
    Top = 16
    ReportForm = {19000000}
  end
  object frUDPie: TfrUserDataset
    RangeEnd = reCount
    RangeEndCount = 1
    Left = 408
    Top = 256
  end
  object frDBQSPProcedencia: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSQSPProcedencia
    Left = 224
    Top = 400
  end
  object DSQSPProcedencia: TDataSource
    DataSet = QSPProcedencia
    Left = 128
    Top = 400
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
    Left = 32
    Top = 400
  end
  object frUDNotasArt: TfrUserDataset
    OnCheckEOF = frUDNotasArtCheckEOF
    OnFirst = frUDNotasArtFirst
    OnNext = frUDNotasArtNext
    Left = 328
    Top = 256
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_FACTURA_ACR'
      'where ID_E = ?ID_E')
    UniDirectional = False
    AfterOpen = QMCabeceraAfterOpen
    AfterScroll = QMCabeceraAfterScroll
    BeforeClose = QMCabeceraBeforeClose
    Left = 32
    Top = 64
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
    Left = 32
    Top = 448
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
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
    Left = 600
    Top = 16
  end
  object HYRSCabecera: THYReportSource
    DataSet = QMCabecera
    CloseDataset = True
    Left = 600
    Top = 64
  end
  object HYRSDetalle: THYReportSource
    DataSet = QMDetalle
    CloseDataset = True
    Left = 712
    Top = 64
  end
  object HYRSxAcreedor: THYReportSource
    DataSet = xAcr
    CloseDataset = True
    Left = 600
    Top = 112
  end
  object HYRSxDireccionAcreedor: THYReportSource
    DataSet = xDirAcr
    CloseDataset = True
    Left = 712
    Top = 112
  end
  object HYRxFormaPago: THYReportSource
    DataSet = xFormaPago
    CloseDataset = True
    Left = 600
    Top = 160
  end
  object HYRxDatosIva: THYReportSource
    DataSet = xDatosIva
    CloseDataset = True
    Left = 712
    Top = 160
  end
  object HYRxNombreIva: THYReportSource
    DataSet = xNombreIva
    CloseDataset = True
    Left = 600
    Top = 208
  end
  object HYRxProcedencia: THYReportSource
    DataSet = QSPProcedencia
    CloseDataset = True
    Left = 712
    Top = 208
  end
  object QGen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 328
    Top = 352
  end
  object xUpdateaDocumentos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    UniDirectional = False
    Left = 328
    Top = 208
  end
  object DSDobleCabecera: TDataSource
    DataSet = DobleCabecera
    Left = 128
    Top = 496
  end
  object DobleCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_FACTURA_ACR'
      'where ID_E = ?ID_E')
    UniDirectional = False
    AfterScroll = DobleCabeceraAfterScroll
    Left = 32
    Top = 496
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
      '               FORMA=?FORMA_DE_PAGO'
      ''
      '')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 32
    Top = 544
  end
  object DSxDobFormaPago: TDataSource
    DataSet = xDobFormaPago
    Left = 128
    Top = 544
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
    Left = 328
    Top = 16
  end
  object DSxDobleIva: TDataSource
    DataSet = xDobleIva
    Left = 416
    Top = 16
  end
  object HYRSDobleCabecera: THYReportSource
    DataSet = DobleCabecera
    CloseDataset = True
    Left = 600
    Top = 256
  end
  object HYRSxDobFormaPago: THYReportSource
    DataSet = xDobFormaPago
    CloseDataset = True
    Left = 600
    Top = 304
  end
  object HYRSxDobDatosIva: THYReportSource
    DataSet = xDobleIva
    CloseDataset = True
    Left = 712
    Top = 256
  end
  object HYRSxArticulos: THYReportSource
    DataSet = xArticulos
    CloseDataset = True
    Left = 712
    Top = 304
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
    Left = 328
    Top = 64
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 416
    Top = 64
  end
  object frDBxArticulos: TfrDBDataSet
    DataSource = DSxArticulos
    Left = 480
    Top = 64
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
    Left = 328
    Top = 112
  end
  object DSxProyectos: TDataSource
    DataSet = xProyectos
    Left = 416
    Top = 112
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
    Left = 328
    Top = 160
  end
  object DSxProyectosDetalle: TDataSource
    DataSet = xProyectosDetalle
    Left = 416
    Top = 160
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
    OnUserFunction = frxFacturaUserFunction
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
  object frxUDPie: TfrxUserDataSet
    RangeEnd = reCount
    RangeEndCount = 1
    UserName = 'frxUDPie'
    Left = 408
    Top = 304
  end
  object frxUDNotasArt: TfrxUserDataSet
    UserName = 'frxUDNotasArt'
    OnCheckEOF = frUDNotasArtCheckEOF
    OnFirst = frUDNotasArtFirst
    OnNext = frUDNotasArtNext
    Left = 328
    Top = 304
  end
end
