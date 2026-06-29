object DMLstRecepcionFichaTecnica: TDMLstRecepcionFichaTecnica
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 692
  Top = 260
  Height = 492
  Width = 623
  object xRecepcion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT * FROM VER_REP_RECEPCION'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ID_REP_RECEPCION = :ID_REP_RECEPCION'
      '')
    SelectSQL.Strings = (
      'SELECT * FROM VER_REP_RECEPCION'
      'WHERE'
      'ID_REP_RECEPCION = :ID_REP_RECEPCION')
    UniDirectional = False
    AfterOpen = xRecepcionAfterOpen
    BeforeClose = xRecepcionBeforeClose
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
  object frLstRecepcion: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frLstRecepcionGetValue
    OnBeforePrint = frLstRecepcionBeforePrint
    OnEnterRect = frLstRecepcionBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 248
    Top = 16
    ReportForm = {19000000}
  end
  object frxLstRecepcion: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 45498.6917426968
    ReportOptions.LastChange = 45498.6917426968
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxLstRecepcionBeforePrint
    OnGetValue = frLstRecepcionGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 352
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDBxRecepcion: TfrxDBDataset
    UserName = 'frxDBxRecepcion'
    CloseDataSource = False
    DataSource = DSxRecepcion
    Left = 352
    Top = 64
  end
  object frDBxRecepcion: TfrDBDataSet
    DataSource = DSxRecepcion
    Left = 248
    Top = 64
  end
  object DSxRecepcion: TDataSource
    DataSet = xRecepcion
    Left = 144
    Top = 64
  end
  object xCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_CLIENTES_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'CLIENTE = :CLIENTE ')
    UniDirectional = False
    DataSource = DSxRecepcion
    Left = 40
    Top = 112
  end
  object DSxCliente: TDataSource
    DataSet = xCliente
    Left = 144
    Top = 112
  end
  object frDBxCliente: TfrDBDataSet
    DataSource = DSxCliente
    Left = 248
    Top = 112
  end
  object frxDBxCliente: TfrxDBDataset
    UserName = 'frxDBxCliente'
    CloseDataSource = False
    DataSource = DSxCliente
    Left = 352
    Top = 112
  end
  object xFichaTecnica: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_FICHA_TECNICA'
      'WHERE'
      'ID_FICHA_TECNICA= :ID_FICHA_TECNICA')
    UniDirectional = False
    DataSource = DSxRecepcion
    Left = 40
    Top = 160
  end
  object DSxFichaTecnica: TDataSource
    DataSet = xFichaTecnica
    Left = 144
    Top = 160
  end
  object frDBxFichaTecnica: TfrDBDataSet
    DataSource = DSxFichaTecnica
    Left = 248
    Top = 160
  end
  object frxDBxFichaTecnica: TfrxDBDataset
    UserName = 'frxDBxCliente'
    CloseDataSource = False
    DataSource = DSxFichaTecnica
    Left = 352
    Top = 160
  end
  object xCabReparacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_REPAR_CAB_REPARACIONES'
      'WHERE'
      'IDCABREPARAR = :ID_REPARACION')
    UniDirectional = False
    DataSource = DSxRecepcion
    AfterOpen = xCabReparacionAfterOpen
    BeforeClose = xCabReparacionBeforeClose
    Left = 40
    Top = 208
  end
  object DSxCabReparacion: TDataSource
    DataSet = xCabReparacion
    Left = 144
    Top = 208
  end
  object frDBxCabReparacion: TfrDBDataSet
    DataSource = DSxCabReparacion
    Left = 248
    Top = 208
  end
  object frxDBxCabReparacion: TfrxDBDataset
    UserName = 'frxDBxCliente'
    CloseDataSource = False
    DataSource = DSxCabReparacion
    Left = 352
    Top = 208
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
    Left = 560
    Top = 16
  end
  object HYReport: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 1998
    ValorGrupo = 36
    DataSet = DMMain.QListados
    Opciones.Pagina.Margenes.Abajo = 0
    Opciones.Pagina.Margenes.Izquierda = 0
    Opciones.Pagina.Margenes.Derecha = 0
    Opciones.Pagina.Margenes.Arriba = 0
    Opciones.Pagina.Alto = 58
    Opciones.Pagina.Ancho = 80
    Opciones.Pagina.Tamanyo = 59
    Opciones.Pagina.SaltoPagina = False
    Opciones.Pagina.ImprimePrimeraCabecera = False
    Opciones.Pagina.ImprimeUltimoPie = False
    ControlaLongitud = True
    Left = 456
    Top = 16
  end
  object xDocOrigen: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_CABECERAS_S'
      'WHERE'
      'ID_S = :ID_S_ORIGEN')
    UniDirectional = False
    DataSource = DSxCabReparacion
    Left = 40
    Top = 256
  end
  object DSxDocOrigen: TDataSource
    DataSet = xDocOrigen
    Left = 144
    Top = 256
  end
  object frDBxDocOrigen: TfrDBDataSet
    DataSource = DSxDocOrigen
    Left = 248
    Top = 256
  end
  object frxDBxDocOrigen: TfrxDBDataset
    UserName = 'frxDBxCliente'
    CloseDataSource = False
    DataSource = DSxDocOrigen
    Left = 352
    Top = 256
  end
  object xPreITV: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PRE_ITV_INSPECCION'
      'WHERE'
      '  ID_INSPECCION=?ID_INSPECCION ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PRE_ITV_INSPECCION'
      'WHERE'
      'ID_RECEPCION = :ID_REP_RECEPCION'
      'ORDER BY ID_INSPECCION')
    UniDirectional = False
    DataSource = DSxRecepcion
    AfterOpen = xPreITVAfterOpen
    BeforeClose = xPreITVBeforeClose
    Left = 40
    Top = 304
  end
  object DSxPreITV: TDataSource
    DataSet = xPreITV
    Left = 144
    Top = 304
  end
  object xPreITVVerificacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PRE_ITV_INSPEC_VERIF'
      'WHERE'
      '  ID_INSPECCION=?ID_INSPECCION AND '
      '  ID_VERIFICACION=?ID_VERIFICACION ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_PRE_ITV_INSPEC_VERIF'
      'WHERE'
      'ID_INSPECCION = :ID_INSPECCION'
      'ORDER BY ORDEN')
    UniDirectional = False
    DataSource = DSxPreITV
    Left = 40
    Top = 352
  end
  object DSPreITVVerificacion: TDataSource
    DataSet = xPreITVVerificacion
    Left = 144
    Top = 352
  end
  object frDBxPreITV: TfrDBDataSet
    DataSet = xPreITV
    Left = 248
    Top = 304
  end
  object frxDBxDBPreITV: TfrxDBDataset
    UserName = 'frxDBxCliente'
    CloseDataSource = False
    DataSource = DSxPreITV
    Left = 352
    Top = 304
  end
  object frDBxPreITVVerificacion: TfrDBDataSet
    DataSource = DSPreITVVerificacion
    Left = 248
    Top = 352
  end
  object frxDBxPreITVVerificacion: TfrxDBDataset
    UserName = 'frxDBxCliente'
    CloseDataSource = False
    DataSource = DSxFichaTecnica
    Left = 352
    Top = 352
  end
end
