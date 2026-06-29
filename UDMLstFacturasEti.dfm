object DMLstFacturasEti: TDMLstFacturasEti
  OldCreateOrder = False
  OnCreate = DMLstFacturasEtiCreate
  OnDestroy = DMLstFacturasEtiDestroy
  Left = 520
  Top = 242
  Height = 392
  Width = 487
  object DSxEtiquetas: TDataSource
    DataSet = xEtiquetas
    Left = 144
    Top = 56
  end
  object frDBxEtiquetas: TfrDBDataSet
    DataSource = DSxEtiquetas
    Left = 264
    Top = 56
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
  object frFacturas: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frFacturasGetValue
    OnBeforePrint = frFacturasBeforePrint
    OnEnterRect = frFacturasBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 264
    Top = 8
    ReportForm = {19000000}
  end
  object xEtiquetas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM C_CREA_ETIQUETAS_ALB_FAC(:EMPRESA, :EJERCICIO, :CA' +
        'NAL, :SERIE, :RIG, :VACIAS, :COPIAS, :TIPO)'
      ' ')
    UniDirectional = False
    AfterOpen = xEtiquetasAfterOpen
    BeforeClose = xEtiquetasBeforeClose
    Left = 32
    Top = 56
  end
  object frDBDCabecera: TfrDBDataSet
    DataSource = DSQMCabecera
    Left = 264
    Top = 104
  end
  object QMCabecera: TFIBDataSetRW
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_FACTURA_LST'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'SERIE = ?SERIE AND'
      'TIPO = ?TIPO AND'
      'RIG = ?RIG')
    UniDirectional = False
    DataSource = DSxEtiquetas
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    Left = 32
    Top = 104
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 144
    Top = 104
  end
  object frDBCabAlbaran: TfrDBDataSet
    DataSource = DSQMCabAlbaran
    Left = 264
    Top = 200
  end
  object QMCabAlbaran: TFIBDataSetRW
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_ALBARAN_LST'
      'WHERE'
      'EMPRESA = ?O_EMPRESA AND'
      'EJERCICIO = ?O_EJERCICIO AND'
      'CANAL = ?O_CANAL AND'
      'SERIE = ?O_SERIE AND'
      'TIPO = ?O_TIPO AND'
      'RIG = ?O_RIG')
    UniDirectional = False
    DataSource = DSQSPProcedencia
    AfterOpen = QMCabAlbaranAfterOpen
    BeforeClose = QMCabAlbaranBeforeClose
    Left = 32
    Top = 200
  end
  object DSQMCabAlbaran: TDataSource
    DataSet = QMCabAlbaran
    Left = 144
    Top = 200
  end
  object QSPProcedencia: TFIBDataSetRW
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT O_EMPRESA, O_EJERCICIO, O_CANAL, O_SERIE, O_TIPO, O_RIG F' +
        'ROM GES_CABECERAS_RELACIONES'
      'WHERE'
      'D_EMPRESA = ?EMPRESA AND '
      'D_EJERCICIO = ?EJERCICIO AND'
      'D_CANAL = ?CANAL AND '
      'D_SERIE = ?SERIE AND'
      'D_TIPO = ?TIPO AND '
      'D_RIG = ?RIG AND'
      'O_TIPO = '#39'ALB'#39)
    UniDirectional = False
    DataSource = DSQMCabecera
    AfterOpen = QSPProcedenciaAfterOpen
    BeforeClose = QSPProcedenciaBeforeClose
    Left = 32
    Top = 152
  end
  object xDireccionAlbaran: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO (:TERCERO)'
      'WHERE'
      'NUM = :DIRECCION')
    UniDirectional = False
    DataSource = DSQMCabAlbaran
    Left = 32
    Top = 248
  end
  object DSxDireccionAlbaran: TDataSource
    DataSet = xDireccionAlbaran
    Left = 144
    Top = 248
  end
  object frDBxDireccionAlbaran: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxDireccionAlbaran
    Left = 264
    Top = 248
  end
  object HYReport: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 60
    ValorGrupo = 0
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
    Titulo = 'Etiquetas de Facturas'
    ControlaLongitud = True
    Left = 384
    Top = 8
  end
  object HYREtiquetas: THYReportSource
    DataSet = xEtiquetas
    CloseDataset = True
    Left = 384
    Top = 56
  end
  object HYRCabecera: THYReportSource
    CloseDataset = True
    Left = 384
    Top = 104
  end
  object HYRQMCabAlbaran: THYReportSource
    DataSet = QMCabAlbaran
    CloseDataset = True
    Left = 384
    Top = 200
  end
  object HYRxDireccionAlbaran: THYReportSource
    DataSet = xDireccionAlbaran
    CloseDataset = True
    Left = 384
    Top = 248
  end
  object DSQSPProcedencia: TDataSource
    DataSet = QSPProcedencia
    Left = 144
    Top = 152
  end
end
