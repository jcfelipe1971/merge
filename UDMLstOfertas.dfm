object DMLstOfertas: TDMLstOfertas
  OldCreateOrder = False
  OnCreate = DMLstOfertasCreate
  OnDestroy = DMLstOfertasDestroy
  Left = 226
  Top = 37
  Height = 908
  Width = 1626
  object frOfertas: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frOfertasGetValue
    OnBeforePrint = frOfertasEnterRect
    OnEnterRect = frOfertasEnterRect
    OnUserFunction = frOfertasUserFunction
    OnPrintReport = frOfertasPrintReport
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 248
    Top = 8
    ReportForm = {19000000}
  end
  object frDBCabecera: TfrDBDataSet
    DataSource = DSCabecera
    Left = 248
    Top = 56
  end
  object frDBDetalle: TfrDBDataSet
    DataSource = DSDetalle
    Left = 248
    Top = 104
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_OFERTA_C_LST'
      'WHERE '
      'ID_S = ?ID_S')
    UniDirectional = False
    AfterOpen = QMCabeceraAfterOpen
    AfterScroll = QMCabeceraAfterScroll
    BeforeClose = QMCabeceraBeforeClose
    Left = 40
    Top = 56
  end
  object DSCabecera: TDataSource
    DataSet = QMCabecera
    Left = 144
    Top = 56
  end
  object QMDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_OFERTA_C'
      'WHERE ID_S =?ID_S AND TIPO_LINEA<>'#39'PRM'#39
      'ORDER BY ORDEN')
    UniDirectional = False
    DataSource = DSCabecera
    AfterOpen = QMDetalleAfterOpen
    AfterScroll = QMDetalleAfterScroll
    BeforeClose = QMDetalleBeforeClose
    Left = 40
    Top = 104
  end
  object DSDetalle: TDataSource
    DataSet = QMDetalle
    Left = 144
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
    Left = 40
    Top = 440
  end
  object DSxCliente: TDataSource
    DataSet = xCliente
    Left = 144
    Top = 440
  end
  object xDireccion_Cliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM UT_JUSTIFICA_DOMICILIO_3(:TERCERO, :CLIENTE, :ID_S, 0)'
      'WHERE'
      '((NUM = :DIRECCION) OR (NUM = 0))')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 40
    Top = 488
  end
  object frUDPie: TfrUserDataset
    RangeEnd = reCount
    RangeEndCount = 1
    Left = 576
    Top = 56
  end
  object frUDNotasArt: TfrUserDataset
    OnCheckEOF = frUDNotasArtCheckEOF
    OnFirst = frUDNotasArtFirst
    OnNext = frUDNotasArtNext
    Left = 680
    Top = 104
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 144
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
    Left = 40
    Top = 536
  end
  object DSxTercero: TDataSource
    DataSet = xTercero
    Left = 144
    Top = 536
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
    Top = 584
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 144
    Top = 584
  end
  object HYReport: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 1991
    ValorGrupo = 38
    DataSet = DMMain.QListados
    Opciones.Pagina.Margenes.Abajo = 0
    Opciones.Pagina.Margenes.Izquierda = 0
    Opciones.Pagina.Margenes.Derecha = 0
    Opciones.Pagina.Margenes.Arriba = 0
    Opciones.Pagina.Alto = 66
    Opciones.Pagina.Ancho = 80
    Opciones.Pagina.Tamanyo = 66
    Opciones.Pagina.SaltoPagina = True
    Opciones.Pagina.ImprimePrimeraCabecera = True
    Opciones.Pagina.ImprimeUltimoPie = True
    Titulo = 'Oferta Matricial'
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
  object HYRSDetalle: THYReportSource
    DataSet = QMDetalle
    CloseDataset = True
    Left = 344
    Top = 104
  end
  object HYRSxCliente: THYReportSource
    DataSet = xCliente
    CloseDataset = True
    Left = 344
    Top = 440
  end
  object HYRSxDireccionCliente: THYReportSource
    DataSet = xDireccion_Cliente
    CloseDataset = True
    Left = 344
    Top = 488
  end
  object HYRxTercero: THYReportSource
    DataSet = xTercero
    CloseDataset = True
    Left = 344
    Top = 536
  end
  object QGen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 576
    Top = 8
  end
  object xUpdateaDocumentos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    UniDirectional = False
    Left = 760
    Top = 344
  end
  object DSxDireccion_Cliente: TDataSource
    AutoEdit = False
    DataSet = xDireccion_Cliente
    Left = 144
    Top = 488
  end
  object DobleCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_OFERTA_C_LST'
      'WHERE '
      'ID_S = ?ID_S')
    UniDirectional = False
    AfterOpen = DobleCabeceraAfterOpen
    AfterScroll = DobleCabeceraAfterScroll
    BeforeClose = DobleCabeceraBeforeClose
    Left = 760
    Top = 104
  end
  object DSDobleCabecera: TDataSource
    DataSet = DobleCabecera
    Left = 872
    Top = 104
  end
  object DSxDireccionFiscal: TDataSource
    DataSet = xDireccionFiscal
    Left = 144
    Top = 632
  end
  object xDireccionFiscal: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO (?tercero)'
      'where (num=1)')
    UniDirectional = False
    Left = 40
    Top = 632
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
    Top = 296
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 144
    Top = 296
  end
  object frDBxArticulos: TfrDBDataSet
    DataSource = DSxArticulos
    Left = 248
    Top = 296
  end
  object xMonedasIdiomas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_MONEDAS_IDIOMAS'
      'WHERE MONEDA=?MONEDA AND IDIOMA=?IDIOMA')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 40
    Top = 680
  end
  object DSxMonedasIdiomas: TDataSource
    DataSet = xMonedasIdiomas
    Left = 144
    Top = 680
  end
  object frDBxGarantiasKri: TfrDBDataSet
    DataSource = DSxGarantiasKri
    Left = 248
    Top = 152
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
    DataSource = DSCabecera
    Left = 40
    Top = 152
  end
  object DSxGarantiasKri: TDataSource
    DataSet = xGarantiasKri
    Left = 144
    Top = 152
  end
  object xFormaPago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT* FROM VER_FORMAS_PAGO_EMP'
      'WHERE EMPRESA=?EMPRESA AND'
      '               EJERCICIO=?EJERCICIO AND'
      '               CANAL=?CANAL AND'
      '               FORMA=?FORMA_PAGO')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 40
    Top = 248
  end
  object DSxFormaPago: TDataSource
    DataSet = xFormaPago
    Left = 144
    Top = 248
  end
  object frDBxFormaPago: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxFormaPago
    Left = 248
    Top = 248
  end
  object HYRSxArticulos: THYReportSource
    DataSet = xArticulos
    CloseDataset = True
    Left = 344
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
    Left = 760
    Top = 488
  end
  object DSxAgente: TDataSource
    DataSet = xAgente
    Left = 872
    Top = 488
  end
  object frDBDxAgente: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxAgente
    Left = 984
    Top = 488
  end
  object xNombreIva: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_IVA'
      'WHERE'
      '  PAIS=?PAIS AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_IVA'
      'where (pais=?pais) and (tipo=?tipo)')
    UniDirectional = False
    Left = 40
    Top = 392
  end
  object DSxNombreIva: TDataSource
    DataSet = xNombreIva
    Left = 144
    Top = 392
  end
  object frDBxNombreIva: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxNombreIva
    Left = 248
    Top = 392
  end
  object frDBxCliente: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxCliente
    Left = 248
    Top = 440
  end
  object frDBDobleCabecera: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSDobleCabecera
    Left = 872
    Top = 344
  end
  object frUDSubTotal: TfrUserDataset
    RangeEnd = reCount
    RangeEndCount = 1
    Left = 680
    Top = 152
  end
  object frDBPromociones: TfrDBDataSet
    DataSource = DSQMPromociones
    Left = 248
    Top = 200
  end
  object QMPromociones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_DETALLE_OFERTA_C'
      'WHERE'
      'ID_S = ?ID_S AND'
      'ORIGEN = ?ID_DETALLES_S AND'
      'TIPO_LINEA = '#39'PRM'#39
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
    Left = 40
    Top = 200
  end
  object DSQMPromociones: TDataSource
    DataSet = QMPromociones
    Left = 144
    Top = 200
  end
  object xArticulosPRM: TFIBDataSetRO
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
    DataSource = DSQMPromociones
    Left = 40
    Top = 392
  end
  object DSxArticulosPRM: TDataSource
    DataSet = xArticulosPRM
    Left = 144
    Top = 392
  end
  object frDBxArticulosPRM: TfrDBDataSet
    DataSource = DSxArticulosPRM
    Left = 248
    Top = 392
  end
  object frUDNotasArtPRM: TfrUserDataset
    OnCheckEOF = frUDNotasArtPRMCheckEOF
    OnFirst = frUDNotasArtPRMFirst
    OnNext = frUDNotasArtPRMNext
    Left = 680
    Top = 152
  end
  object HYRSPromociones: THYReportSource
    DataSet = QMPromociones
    CloseDataset = True
    Left = 344
    Top = 200
  end
  object frxOfertas: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.9719063426
    ReportOptions.LastChange = 38691.9719063426
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxOfertasBeforePrint
    OnGetValue = frxOfertasGetValue
    OnPrintReport = frxOfertasPrintReport
    OnUserFunction = frxOfertasUserFunction
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 440
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDBCabecera: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSCabecera
    Left = 440
    Top = 56
  end
  object frxDBDetalle: TfrxDBDataset
    UserName = 'frxDBDetalle'
    CloseDataSource = False
    DataSource = DSDetalle
    Left = 440
    Top = 104
  end
  object frxDBPromociones: TfrxDBDataset
    UserName = 'frxDBPromociones'
    CloseDataSource = False
    DataSource = DSQMPromociones
    Left = 440
    Top = 200
  end
  object frxUDNotasArt: TfrxUserDataSet
    UserName = 'frxUDNotasArt'
    OnCheckEOF = frUDNotasArtCheckEOF
    OnFirst = frUDNotasArtFirst
    OnNext = frUDNotasArtNext
    Left = 576
    Top = 104
  end
  object DSxTerceroBanco: TDataSource
    DataSet = xTerceroBanco
    Left = 872
    Top = 584
  end
  object frDBxTerceroBanco: TfrDBDataSet
    DataSource = DSxTerceroBanco
    Left = 984
    Top = 584
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
    Left = 760
    Top = 584
  end
  object DSxDobTerceroBan: TDataSource
    DataSet = xDobTerceroBan
    Left = 872
    Top = 536
  end
  object frDBxDobTerceroBan: TfrDBDataSet
    DataSource = DSxDobTerceroBan
    Left = 984
    Top = 536
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
    Left = 760
    Top = 536
  end
  object frxDBxDatosIva: TfrxDBDataset
    UserName = 'frxDBxDatosIva'
    CloseDataSource = False
    DataSource = DSxDatosIva
    Left = 344
    Top = 776
  end
  object frxUDNotasArtPRM: TfrxUserDataSet
    UserName = 'frxUDNotasArtPRM'
    OnCheckEOF = frUDNotasArtPRMCheckEOF
    OnFirst = frUDNotasArtPRMFirst
    OnNext = frUDNotasArtPRMNext
    Left = 576
    Top = 152
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
    Left = 760
    Top = 8
  end
  object DSxProyectos: TDataSource
    DataSet = xProyectos
    Left = 872
    Top = 8
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
    Left = 760
    Top = 56
  end
  object DSxProyectosDetalle: TDataSource
    DataSet = xProyectosDetalle
    Left = 872
    Top = 56
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
    Left = 40
    Top = 344
  end
  object DSxArticulosIdioma: TDataSource
    DataSet = xArticulosIdioma
    Left = 144
    Top = 344
  end
  object frDBxArticulosIdioma: TfrDBDataSet
    DataSource = DSxArticulosIdioma
    Left = 248
    Top = 344
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
    Left = 760
    Top = 152
  end
  object DSxEmpleado: TDataSource
    DataSet = xEmpleado
    Left = 872
    Top = 152
  end
  object xDobleIVA: TFIBDataSetRO
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
    Left = 760
    Top = 200
  end
  object DSxDobleIVA: TDataSource
    DataSet = xDobleIVA
    Left = 872
    Top = 200
  end
  object xDatosIva: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_S_REDONDEOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  TIPO_IVA=?TIPO_IVA ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_CABECERAS_S_REDONDEOS'
      'WHERE'
      'ID_S = :ID_S'
      'ORDER BY TIPO_IVA')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 40
    Top = 776
  end
  object DSxDatosIva: TDataSource
    DataSet = xDatosIva
    Left = 144
    Top = 776
  end
  object frDBxDatosIva: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDatosIva
    Left = 240
    Top = 776
  end
  object DSDetalleDetalle: TDataSource
    DataSet = QMDetalleDetalle
    Left = 872
    Top = 248
  end
  object QMDetalleDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM GES_DETALLES_S_DETALLES'
      'WHERE '
      'ID_DETALLES_S = ?ID_DETALLES_S')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 760
    Top = 248
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
    Left = 1080
    Top = 296
  end
  object DSDetalleUE: TDataSource
    DataSet = QMDetalleUE
    Left = 448
    Top = 152
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
    Left = 344
    Top = 152
  end
  object DSDireccionEntregaLinea: TDataSource
    DataSet = xDireccionEntregaLinea
    Left = 872
    Top = 296
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
    Left = 760
    Top = 296
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
    Left = 760
    Top = 392
  end
  object DSxRecibosAnticipos: TDataSource
    DataSet = xRecibosAnticipos
    Left = 872
    Top = 392
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
    Left = 760
    Top = 440
  end
  object DSxTotalRecibosAnticipos: TDataSource
    DataSet = xTotalRecibosAnticipos
    Left = 872
    Top = 440
  end
  object frDBxRecibosAnticipos: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxRecibosAnticipos
    Left = 984
    Top = 392
  end
  object frDBxTotalRecibosAnticipos: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxTotalRecibosAnticipos
    Left = 984
    Top = 440
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
    Left = 40
    Top = 728
  end
  object DSxLstFirmas: TDataSource
    DataSet = xLstFirmas
    Left = 144
    Top = 728
  end
  object frDBDLstFirmas: TfrDBDataSet
    DataSource = DSxLstFirmas
    Left = 240
    Top = 728
  end
  object frxDBxLstFirmas: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = xLstFirmas
    Left = 344
    Top = 728
  end
  object frDBGrupoTalla: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSGrupoTalla
    Left = 1248
    Top = 8
  end
  object DSGrupoTalla: TDataSource
    DataSet = QMGrupoTalla
    Left = 1160
    Top = 8
  end
  object HYRSGrupoTalla: THYReportSource
    DataSet = QMGrupoTalla
    CloseDataset = True
    Left = 1384
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
    Left = 1077
    Top = 8
  end
  object HYRMGrupoTalla: THYReportMailSource
    DataSet = QMGrupoTalla
    CloseDataset = True
    Left = 1464
    Top = 8
  end
  object frxDBGrupoTalla: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSGrupoTalla
    Left = 1320
    Top = 8
  end
  object frDBTituloTalla: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSTituloTalla
    Left = 1248
    Top = 56
  end
  object DSTituloTalla: TDataSource
    DataSet = QMTituloTalla
    Left = 1160
    Top = 56
  end
  object HYRSTituloTalla: THYReportSource
    DataSet = QMTituloTalla
    CloseDataset = True
    Left = 1384
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
    Left = 1077
    Top = 56
  end
  object HYRMTituloTalla: THYReportMailSource
    DataSet = QMTituloTalla
    CloseDataset = True
    Left = 1464
    Top = 56
  end
  object frxDBTituloTalla: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSTituloTalla
    Left = 1320
    Top = 56
  end
  object frDBDetalleTallas: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSDetalleTallas
    Left = 1248
    Top = 104
  end
  object DSDetalleTallas: TDataSource
    DataSet = QMDetalleTallas
    Left = 1160
    Top = 104
  end
  object HYRSDetalleTallas: THYReportSource
    DataSet = QMDetalleTallas
    CloseDataset = True
    Left = 1384
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
      'X.ID_G_T = :ID_G_T AND'
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
    Left = 1077
    Top = 104
  end
  object HYRMDetalleTallas: THYReportMailSource
    DataSet = QMDetalleTallas
    CloseDataset = True
    Left = 1464
    Top = 104
  end
  object frxDBDetalleTallas: TfrxDBDataset
    UserName = 'frxDBCabecera'
    CloseDataSource = False
    DataSource = DSDetalleTallas
    Left = 1320
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
    Left = 1077
    Top = 152
  end
  object DSArticuloTallas: TDataSource
    DataSet = QMArticuloTallas
    Left = 1160
    Top = 152
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
    Left = 1077
    Top = 200
  end
  object DSxContacto: TDataSource
    DataSet = xContacto
    Left = 1160
    Top = 200
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
    Left = 40
    Top = 824
  end
  object DSEscandallo: TDataSource
    DataSet = QMEscandallo
    Left = 144
    Top = 824
  end
  object frDBDEscandallo: TfrDBDataSet
    DataSource = DSEscandallo
    Left = 248
    Top = 824
  end
  object HYRSEscandallo: THYReportSource
    DataSet = QMEscandallo
    CloseDataset = True
    Left = 344
    Top = 824
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
    Left = 760
    Top = 637
  end
  object DSxTipoPorte: TDataSource
    DataSet = xTipoPorte
    Left = 872
    Top = 637
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
    Left = 760
    Top = 685
  end
  object DSxDobTipoPorte: TDataSource
    DataSet = xDobTipoPorte
    Left = 872
    Top = 685
  end
  object xEtiEscandallo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'SELECT FIRST 1 ET.*, E.DESCRIPCION, A.ALFA_1, A.ALFA_2, A.ALFA_3' +
        ', A.ALFA_4, A.ALFA_5, A.ALFA_6, A.ALFA_7, A.ALFA_8,'
      
        '               A.TITULO_LARGO, A.ALTO ART_ALTO, A.ANCHO ART_ANCH' +
        'O, A.FONDO ART_FONDO, A.PESO ART_PESO'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_DETALLES_S D ON C.ID_S = D.ID_S'
      'JOIN GES_DETALLES_S_OFC O ON D.ID_DETALLES_S = O.ID_DETALLES_S'
      'JOIN PRO_ESCANDALLO E ON O.ID_ESC = E.ID_ESC'
      'JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A'
      
        'LEFT JOIN ETI_ESCANDALLO_CALC ET ON ET.EMPRESA = E.EMPRESA AND E' +
        'T.ESCANDALLO = E.ESCANDALLO AND ET.TIPO = E.TIPO'
      'WHERE'
      'C.ID_S = :ID_S AND'
      'O.ID_ESC <> 0'
      'ORDER BY D.ORDEN')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 1076
    Top = 248
  end
  object DSEtiEscandallo: TDataSource
    DataSet = xEtiEscandallo
    Left = 1160
    Top = 248
  end
  object frDBEtiEscandallo: TfrDBDataSet
    DataSource = DSEtiEscandallo
    Left = 1258
    Top = 248
  end
  object HYRSEtiEscandallo: THYReportSource
    DataSet = xEtiEscandallo
    CloseDataset = True
    Left = 1358
    Top = 248
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
    Left = 1080
    Top = 340
  end
  object DSxArticuloTYC: TDataSource
    DataSet = xArticuloTYC
    Left = 1168
    Top = 340
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
    Left = 1080
    Top = 388
  end
  object DSxFichaTecnica: TDataSource
    DataSet = xFichaTecnica
    Left = 1168
    Top = 388
  end
end
