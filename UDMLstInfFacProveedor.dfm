object DMLstInfFacProveedor: TDMLstInfFacProveedor
  OldCreateOrder = False
  OnCreate = DMLstInfFacProveedorCreate
  OnDestroy = DMLstInfFacProveedorDestroy
  Left = 434
  Top = 164
  Height = 770
  Width = 1307
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 200
    Top = 16
  end
  object DSCabecera: TDataSource
    DataSet = QMCabecera
    Left = 112
    Top = 64
  end
  object frDBCabecera: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSCabecera
    Left = 200
    Top = 64
  end
  object QMDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_FACTURA_PROV'
      'where    ID_E = ?ID_E'
      'order by orden')
    UniDirectional = False
    DataSource = DSCabecera
    AfterOpen = QMDetalleAfterOpen
    AfterScroll = QMDetalleAfterScroll
    BeforeClose = QMDetalleBeforeClose
    Left = 32
    Top = 112
  end
  object DSDetalle: TDataSource
    DataSet = QMDetalle
    Left = 112
    Top = 112
  end
  object frDBDetalle: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSDetalle
    Left = 200
    Top = 112
  end
  object frDBxProv: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxProv
    Left = 200
    Top = 160
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
    DataSource = DSCabecera
    Left = 32
    Top = 208
  end
  object DSxDirProv: TDataSource
    DataSet = xDirProv
    Left = 112
    Top = 208
  end
  object frDBxDirProv: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDirProv
    Left = 200
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
      '               FORMA=?FORMA_DE_PAGO')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 32
    Top = 256
  end
  object DSxFormaPago: TDataSource
    DataSet = xFormaPago
    Left = 112
    Top = 256
  end
  object frDBxFormaPago: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxFormaPago
    Left = 200
    Top = 256
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
    Left = 112
    Top = 352
  end
  object frDBxNombreIva: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxNombreIva
    Left = 200
    Top = 352
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
    Left = 112
    Top = 304
  end
  object frDBxDatosIva: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDatosIva
    Left = 200
    Top = 304
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
    DataSource = DSCabecera
    AfterScroll = xProvAfterScroll
    Left = 32
    Top = 160
  end
  object DSxProv: TDataSource
    DataSet = xProv
    Left = 112
    Top = 160
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
    Left = 296
    Top = 16
  end
  object SPDame_factor: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure s_monedas_factor_eec(?EMPRESA,?EJERCICIO,?CANA' +
        'L,'#39'EUR'#39',?FECHA)')
    Transaction = TLocal
    AutoTrans = True
    Left = 544
    Top = 392
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
  object DSQSPProcedencia: TDataSource
    DataSet = QSPProcedencia
    Left = 112
    Top = 400
  end
  object frDBQSPProcedencia: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSQSPProcedencia
    Left = 200
    Top = 400
  end
  object HYReport: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 1996
    ValorGrupo = 73
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
    Titulo = 'Informe de Facturas de Prov. Matricial'
    ControlaLongitud = True
    OnEnterFields = HYReportEnterFields
    OnPrintReport = HYReportPrintReport
    Left = 544
    Top = 8
  end
  object HYRSCabecera: THYReportSource
    DataSet = QMCabecera
    CloseDataset = True
    Left = 544
    Top = 56
  end
  object HYRSDetalle: THYReportSource
    DataSet = QMDetalle
    CloseDataset = True
    Left = 656
    Top = 56
  end
  object HYRSxProv: THYReportSource
    DataSet = xProv
    CloseDataset = True
    Left = 544
    Top = 104
  end
  object HYRSxDirProv: THYReportSource
    DataSet = xDirProv
    CloseDataset = True
    Left = 656
    Top = 104
  end
  object HYRSxNombreIva: THYReportSource
    DataSet = xNombreIva
    CloseDataset = True
    Left = 656
    Top = 152
  end
  object HYRSxDatosIva: THYReportSource
    DataSet = xDatosIva
    CloseDataset = True
    Left = 544
    Top = 152
  end
  object frUDNotasArt: TfrUserDataset
    OnCheckEOF = frUDNotasArtCheckEOF
    OnFirst = frUDNotasArtFirst
    OnNext = frUDNotasArtNext
    Left = 384
    Top = 16
  end
  object xDatosBancarios: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TERCEROS_BANCOS'
      
        'where (tercero=?tercero) and ((modo=0) or (modo=2)) and (activa=' +
        '1)'
      'order by orden')
    UniDirectional = False
    DataSource = DSxProv
    AfterScroll = xDatosBancariosAfterScroll
    Left = 32
    Top = 496
  end
  object DSxDatosBancarios: TDataSource
    DataSet = xDatosBancarios
    Left = 112
    Top = 496
  end
  object frDBxDatosBancarios: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDatosBancarios
    Left = 200
    Top = 496
  end
  object xEntidad: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_BANCOS'
      'WHERE PAIS = ?PAIS AND ENTIDAD=?ENTIDAD')
    UniDirectional = False
    DataSource = DSxDatosBancarios
    Left = 32
    Top = 544
  end
  object DSxEntidad: TDataSource
    DataSet = xEntidad
    Left = 112
    Top = 544
  end
  object frDBxEntidad: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxEntidad
    Left = 200
    Top = 544
  end
  object frUserNotasCab: TfrUserDataset
    OnCheckEOF = frUserNotasCabCheckEOF
    OnFirst = frUserNotasCabFirst
    OnNext = frUserNotasCabNext
    Left = 464
    Top = 16
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_FACTURA_PROV_LST'
      'WHERE'
      'ID_E = ?ID_E')
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
      'SELECT TITULO FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 32
    Top = 448
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 112
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
      ' EMPRESA = ?EMPRESA AND'
      ' ARTICULO = ?ARTICULO AND'
      ' EJERCICIO_ENT = ?EJERCICIO_S AND'
      ' CANAL_ENT = ?CANAL AND'
      ' SERIE_ENT = ?SERIE AND'
      ' RIG_ENT = ?RIG_S AND'
      ' LINEA_ENT = ?LINEA_S AND'
      'LOTE>'#39#39
      'GROUP BY EMPRESA,ARTICULO,CADUCIDAD,LOTE, LINEA_SAL'
      ''
      'UNION'
      ''
      
        'SELECT COUNT(*),EMPRESA,ARTICULO,CADUCIDAD,LOTE FROM NRO_SERIE_K' +
        'RI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' ARTICULO = ?ARTICULO AND'
      ' EJERCICIO_DEC = ?EJERCICIO_S AND'
      ' CANAL_DEC = ?CANAL AND'
      ' SERIE_DEC = ?SERIE AND'
      ' RIG_DEC = ?RIG_S AND'
      ' LINEA_DEC = ?LINEA_S AND'
      'LOTE>'#39#39
      'GROUP BY EMPRESA,ARTICULO,CADUCIDAD,LOTE, LINEA_DEV')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 296
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
      ' EMPRESA = ?EMPRESA AND'
      ' ARTICULO = ?ARTICULO AND'
      ' EJERCICIO_ENT = ?EJERCICIO_S AND'
      ' CANAL_ENT = ?CANAL AND'
      ' SERIE_ENT = ?SERIE AND'
      ' RIG_ENT = ?RIG_S AND'
      ' LINEA_ENT = ?LINEA_S'
      ''
      'UNION'
      ''
      'SELECT EMPRESA,ARTICULO,NRO_SERIE FROM NRO_SERIE_KRI'
      'WHERE'
      ' EMPRESA = ?EMPRESA AND'
      ' ARTICULO = ?ARTICULO AND'
      ' EJERCICIO_DEC = ?EJERCICIO_S AND'
      ' CANAL_DEC = ?CANAL AND'
      ' SERIE_DEC = ?SERIE AND'
      ' RIG_DEC = ?RIG_S AND'
      ' LINEA_DEC = ?LINEA_S')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 296
    Top = 256
  end
  object DSxArticuloKri: TDataSource
    DataSet = xArticuloKri
    Left = 112
    Top = 688
  end
  object xArticuloKri: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT TITULO_CORTO,ALFA_1,ALFA_2,ALFA_3,ALFA_4,ALFA_5 FROM ART_' +
        'ARTICULOS'
      'WHERE '
      ' EMPRESA = ?EMPRESA AND '
      ' ARTICULO = ?ARTICULO')
    UniDirectional = True
    DataSource = DSDetalle
    Left = 32
    Top = 688
  end
  object QGen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 544
    Top = 536
  end
  object xUpdateaDocumentos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    UniDirectional = False
    Left = 296
    Top = 448
  end
  object DSDobleCabecera: TDataSource
    DataSet = DobleCabecera
    Left = 384
    Top = 112
  end
  object DobleCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_FACTURA_PROV'
      'where ID_E = ?ID_E')
    UniDirectional = False
    AfterScroll = DobleCabeceraAfterScroll
    Left = 296
    Top = 112
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
      '               FORMA=?FORMA_DE_PAGO')
    UniDirectional = False
    DataSource = DSDobleCabecera
    Left = 296
    Top = 160
  end
  object DSxDobFormaPago: TDataSource
    DataSet = xDobFormaPago
    Left = 384
    Top = 160
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
    Left = 296
    Top = 208
  end
  object DSxDobleIva: TDataSource
    DataSet = xDobleIva
    Left = 384
    Top = 208
  end
  object HYRSDobleCabecera: THYReportSource
    DataSet = DobleCabecera
    CloseDataset = True
    Left = 544
    Top = 200
  end
  object HYRSxDobDatosIva: THYReportSource
    DataSet = xDobleIva
    CloseDataset = True
    Left = 656
    Top = 200
  end
  object HYRSxDobFormaPago: THYReportSource
    DataSet = xDobFormaPago
    CloseDataset = True
    Left = 544
    Top = 248
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
    DataSource = DSDetalle
    Left = 32
    Top = 588
  end
  object DSxLotes: TDataSource
    DataSet = xLotes
    Left = 112
    Top = 588
  end
  object frDBxLotes: TfrDBDataSet
    DataSource = DSxLotes
    Left = 200
    Top = 588
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
        '.ARTICULO '
      'WHERE '
      'S.EMPRESA = :EMPRESA AND '
      'S.EJERCICIO = :EJERCICIO AND '
      'S.CANAL = :CANAL AND '
      'S.SERIE = :SERIE AND '
      'S.TIPO = :TIPO AND '
      'S.RIG = :RIG AND '
      'S.LINEA = :LINEA'
      'GROUP BY S.ARTICULO, A.TITULO_LARGO')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 32
    Top = 639
  end
  object DSxNroSerie: TDataSource
    DataSet = xNroSerie
    Left = 112
    Top = 639
  end
  object frDBxNroSerie: TfrDBDataSet
    DataSource = DSxNroSerie
    Left = 200
    Top = 639
  end
  object HYRSxNroSerie: THYReportSource
    DataSet = xNroSerie
    CloseDataset = True
    Left = 544
    Top = 296
  end
  object HYRSxLotes: THYReportSource
    DataSet = xLotes
    CloseDataset = True
    Left = 656
    Top = 248
  end
  object HYRSxArticulos: THYReportSource
    DataSet = xArticulos
    CloseDataset = True
    Left = 656
    Top = 296
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
    Left = 296
    Top = 400
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 384
    Top = 256
  end
  object frDBxArticulos: TfrDBDataSet
    DataSource = DSxArticulos
    Left = 448
    Top = 256
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
    Left = 296
    Top = 304
  end
  object DSxProyectos: TDataSource
    DataSet = xProyectos
    Left = 384
    Top = 304
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
    Left = 296
    Top = 352
  end
  object DSxProyectosDetalle: TDataSource
    DataSet = xProyectosDetalle
    Left = 384
    Top = 352
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
    Left = 112
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxUDPie: TfrxUserDataSet
    RangeEnd = reCount
    RangeEndCount = 1
    UserName = 'frxUDPie'
    Left = 296
    Top = 64
  end
  object frxUDNotasArt: TfrxUserDataSet
    UserName = 'frxUDNotasArt'
    OnCheckEOF = frUDNotasArtCheckEOF
    OnFirst = frUDNotasArtFirst
    OnNext = frUDNotasArtNext
    Left = 384
    Top = 64
  end
  object frxUserNotasCab: TfrxUserDataSet
    UserName = 'frxUserNotasCab'
    OnCheckEOF = frUserNotasCabCheckEOF
    OnFirst = frUserNotasCabFirst
    OnNext = frUserNotasCabNext
    Left = 464
    Top = 64
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
    DataSource = DSDetalle
    Left = 296
    Top = 544
  end
  object DSxArticulosIdioma: TDataSource
    DataSet = xArticulosIdioma
    Left = 384
    Top = 544
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
    DataSource = DSDetalle
    Left = 296
    Top = 592
  end
  object DSDetalleUE: TDataSource
    DataSet = QMDetalleUE
    Left = 384
    Top = 592
  end
  object frDBGrupoTalla: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSGrupoTalla
    Left = 944
    Top = 8
  end
  object DSGrupoTalla: TDataSource
    DataSet = QMGrupoTalla
    Left = 856
    Top = 8
  end
  object HYRSGrupoTalla: THYReportSource
    DataSet = QMGrupoTalla
    CloseDataset = True
    Left = 1080
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
    DataSource = DSCabecera
    Plan.Strings = (
      
        'PLAN JOIN (VER_CABECERAS_FACTURA CAB INDEX (GES_CABECERAS_S_ID),' +
        'VER_CABECERAS_FACTURA FAC INDEX (GES_CABECERAS_S_FAC_ID),VER_CAB' +
        'ECERAS_FACTURA TER INDEX (PK_SYS_TERCEROS))')
    AfterOpen = QMGrupoTallaAfterOpen
    BeforeClose = QMGrupoTallaBeforeClose
    Left = 784
    Top = 8
  end
  object HYRMGrupoTalla: THYReportMailSource
    DataSet = QMGrupoTalla
    CloseDataset = True
    Left = 1160
    Top = 8
  end
  object frxDBGrupoTalla: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSGrupoTalla
    Left = 1016
    Top = 8
  end
  object frDBTituloTalla: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSTituloTalla
    Left = 944
    Top = 56
  end
  object DSTituloTalla: TDataSource
    DataSet = QMTituloTalla
    Left = 856
    Top = 56
  end
  object HYRSTituloTalla: THYReportSource
    DataSet = QMTituloTalla
    CloseDataset = True
    Left = 1080
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
    Left = 784
    Top = 56
  end
  object HYRMTituloTalla: THYReportMailSource
    DataSet = QMTituloTalla
    CloseDataset = True
    Left = 1160
    Top = 56
  end
  object frxDBTituloTalla: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSTituloTalla
    Left = 1016
    Top = 56
  end
  object frDBDetalleTallas: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSDetalleTallas
    Left = 944
    Top = 104
  end
  object DSDetalleTallas: TDataSource
    DataSet = QMDetalleTallas
    Left = 856
    Top = 104
  end
  object HYRSDetalleTallas: THYReportSource
    DataSet = QMDetalleTallas
    CloseDataset = True
    Left = 1080
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
    Left = 784
    Top = 104
  end
  object HYRMDetalleTallas: THYReportMailSource
    DataSet = QMDetalleTallas
    CloseDataset = True
    Left = 1160
    Top = 104
  end
  object frxDBDetalleTallas: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSDetalleTallas
    Left = 1016
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
    Left = 784
    Top = 149
  end
  object DSArticuloTallas: TDataSource
    DataSet = QMArticuloTallas
    Left = 880
    Top = 149
  end
  object xEmpresa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT E.TITULO TITULO_EMPRESA,'
      '       (SELECT TITULO'
      '        FROM SYS_REGIONES'
      '        WHERE'
      '        PAIS = TD.PAIS_DIRECCION AND'
      '        REGION = TD.REGION) TITULO_REGION,'
      '       (SELECT TITULO'
      '        FROM SYS_PROVINCIAS'
      '        WHERE'
      '        PAIS = TD.PAIS_DIRECCION AND'
      '        REGION = TD.REGION AND'
      '        PROVINCIA = TD.PROVINCIA) TITULO_PROVINCIA,'
      '       (SELECT TITULO'
      '        FROM SYS_POBLACION'
      '        WHERE'
      '        PAIS = TD.PAIS_DIRECCION AND'
      '        PROVINCIA = TD.PROVINCIA AND'
      '        POBLACION = TD.POBLACION) TITULO_POBLACION,'
      '       (SELECT TITULO'
      '        FROM SYS_CODIGOS_POSTALES'
      '        WHERE'
      '        PAIS = TD.PAIS_DIRECCION AND'
      '        CODIGO_POSTAL = TD.CODIGO_POSTAL AND'
      '        REGION = TD.REGION AND'
      '        POBLACION = TD.POBLACION) TITULO_CODIGO_POSTAL,'
      '        T.*, TD.*'
      'FROM SYS_EMPRESAS E'
      'JOIN SYS_TERCEROS T ON (T.TERCERO = E.TERCERO)'
      
        'LEFT JOIN SYS_TERCEROS_DIRECCIONES TD ON (T.TERCERO = TD.TERCERO' +
        ' AND TD.DIR_DEFECTO = 1)'
      'WHERE'
      'EMPRESA = :EMPRESA')
    SelectSQL.Strings = (
      'SELECT E.TITULO TITULO_EMPRESA,'
      '       (SELECT TITULO'
      '        FROM SYS_REGIONES'
      '        WHERE'
      '        PAIS = TD.PAIS_DIRECCION AND'
      '        REGION = TD.REGION) TITULO_REGION,'
      '       (SELECT TITULO'
      '        FROM SYS_PROVINCIAS'
      '        WHERE'
      '        PAIS = TD.PAIS_DIRECCION AND'
      '        REGION = TD.REGION AND'
      '        PROVINCIA = TD.PROVINCIA) TITULO_PROVINCIA,'
      '       (SELECT TITULO'
      '        FROM SYS_POBLACION'
      '        WHERE'
      '        PAIS = TD.PAIS_DIRECCION AND'
      '        PROVINCIA = TD.PROVINCIA AND'
      '        POBLACION = TD.POBLACION) TITULO_POBLACION,'
      '       (SELECT TITULO'
      '        FROM SYS_CODIGOS_POSTALES'
      '        WHERE'
      '        PAIS = TD.PAIS_DIRECCION AND'
      '        CODIGO_POSTAL = TD.CODIGO_POSTAL AND'
      '        REGION = TD.REGION AND'
      '        POBLACION = TD.POBLACION) TITULO_CODIGO_POSTAL,'
      '        T.*, TD.*'
      'FROM SYS_EMPRESAS E'
      'JOIN SYS_TERCEROS T ON (T.TERCERO = E.TERCERO)'
      
        'LEFT JOIN SYS_TERCEROS_DIRECCIONES TD ON (T.TERCERO = TD.TERCERO' +
        ' AND TD.DIR_DEFECTO = 1)'
      'WHERE'
      'EMPRESA = :EMPRESA')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 296
    Top = 640
  end
  object frxDBxEmpresa: TfrxDBDataset
    UserName = 'frxDBxEmpresa'
    CloseDataSource = False
    DataSource = DSxEmpresa
    Left = 584
    Top = 640
  end
  object DSxEmpresa: TDataSource
    DataSet = xEmpresa
    Left = 392
    Top = 640
  end
  object frDBxEmpresa: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxEmpresa
    Left = 496
    Top = 640
  end
end
