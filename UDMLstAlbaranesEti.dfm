object DMLstAlbaranesEti: TDMLstAlbaranesEti
  OldCreateOrder = False
  OnCreate = DMLstAlbaranesCreate
  OnDestroy = DMLstAlbaranesDestroy
  Left = 616
  Top = 433
  Height = 347
  Width = 420
  object frAlbaranes: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Etiquetas de Albaranes'
    RebuildPrinter = False
    OnGetValue = frAlbaranesGetValue
    OnBeforePrint = frAlbaranesBeforePrint
    OnEnterRect = frAlbaranesBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 120
    Top = 8
    ReportForm = {19000000}
  end
  object frDBxEtiquetas: TfrDBDataSet
    DataSource = DSxEtiquetas
    Left = 208
    Top = 56
  end
  object xEtiquetas: TFIBDataSetRW
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM C_CREA_ETIQUETAS_ALB_FAC(:EMPRESA, :EJERCICIO, :CA' +
        'NAL, :SERIE, :RIG, :VACIAS, :COPIAS, :TIPO)'
      ' ')
    UniDirectional = False
    AfterOpen = xEtiquetasAfterOpen
    BeforeClose = xEtiquetasBeforeClose
    Left = 40
    Top = 56
  end
  object DSxEtiquetas: TDataSource
    DataSet = xEtiquetas
    Left = 120
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 40
    Top = 8
  end
  object frDBDCabecera: TfrDBDataSet
    DataSource = DSQMCabecera
    Left = 208
    Top = 104
  end
  object QMCabecera: TFIBDataSetRW
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_ALBARAN_LST'
      'WHERE'
      'ID_S=?ID_S')
    UniDirectional = False
    DataSource = DSxEtiquetas
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    Left = 40
    Top = 104
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 120
    Top = 104
  end
  object HYReport: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 5950
    ValorGrupo = 58
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
    Titulo = 'Etiquetas de Albaranes'
    ControlaLongitud = True
    Left = 280
    Top = 8
  end
  object HYREtiquetas: THYReportSource
    DataSet = xEtiquetas
    CloseDataset = True
    Left = 280
    Top = 56
  end
  object HYRQMCabecera: THYReportSource
    DataSet = QMCabecera
    CloseDataset = True
    Left = 280
    Top = 104
  end
  object QMCartaPortes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_CABECERAS_S_CGA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG AND '
      '  ID_S=?old_ID_S ')
    InsertSQL.Strings = (
      'INSERT INTO GES_CABECERAS_S_CGA'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,TIPO,RIG,ID_S,CARGADORA,EXPEDID' +
        'ORA,DIR_EXPEDIDORA,DIR_CARGADORA,INTERMEDIARIA,DIR_INTERMEDIARIA' +
        ',TRANSPORTISTA,DIR_TRANSPORTISTA,DESTINATARIO,DIR_DESTINATARIO,B' +
        'ULTOS,PESO,ORIGEN,DESTINO,FECHA_TRANSPORTE,NOTAS,PALETS,PESO_BRU' +
        'TO,UNIDADES_LOGISTICAS)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?TIPO,?RIG,?ID_S,?CARGADORA' +
        ',?EXPEDIDORA,?DIR_EXPEDIDORA,?DIR_CARGADORA,?INTERMEDIARIA,?DIR_' +
        'INTERMEDIARIA,?TRANSPORTISTA,?DIR_TRANSPORTISTA,?DESTINATARIO,?D' +
        'IR_DESTINATARIO,?BULTOS,?PESO,?ORIGEN,?DESTINO,?FECHA_TRANSPORTE' +
        ',?NOTAS,?PALETS,?PESO_BRUTO,?UNIDADES_LOGISTICAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_CABECERAS_S_CGA'
      'WHERE'
      '  ID_S=?ID_S ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_CGA'
      'WHERE ID_S=?ID_S')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_CABECERAS_S_CGA'
      'SET'
      '  CARGADORA=?CARGADORA '
      '  ,EXPEDIDORA=?EXPEDIDORA '
      '  ,DIR_EXPEDIDORA=?DIR_EXPEDIDORA '
      '  ,DIR_CARGADORA=?DIR_CARGADORA '
      '  ,INTERMEDIARIA=?INTERMEDIARIA '
      '  ,DIR_INTERMEDIARIA=?DIR_INTERMEDIARIA '
      '  ,TRANSPORTISTA=?TRANSPORTISTA '
      '  ,DIR_TRANSPORTISTA=?DIR_TRANSPORTISTA '
      '  ,DESTINATARIO=?DESTINATARIO '
      '  ,DIR_DESTINATARIO=?DIR_DESTINATARIO '
      '  ,BULTOS=?BULTOS '
      '  ,PESO=?PESO '
      '  ,ORIGEN=?ORIGEN '
      '  ,DESTINO=?DESTINO '
      '  ,FECHA_TRANSPORTE=?FECHA_TRANSPORTE '
      '  ,NOTAS=?NOTAS '
      '  ,PALETS=?PALETS '
      '  ,PESO_BRUTO=?PESO_BRUTO'
      '  ,UNIDADES_LOGISTICAS=?UNIDADES_LOGISTICAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  ID_S=?ID_S ')
    DataSource = DSQMCabecera
    ClavesPrimarias.Strings = (
      'ID_S ')
    AccionesInhibidas = []
    Opciones = [DesactivarControlesAlOrdenar, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_CABECERAS_S_CGA'
    BloqOpt = True
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 40
    Top = 152
  end
  object DSCartaPortes: TDataSource
    DataSet = QMCartaPortes
    Left = 120
    Top = 152
  end
  object frDBCartaPortes: TfrDBDataSet
    DataSource = DSCartaPortes
    Left = 208
    Top = 152
  end
  object HYRQMCartaPortes: THYReportSource
    DataSet = QMCartaPortes
    CloseDataset = True
    Left = 280
    Top = 152
  end
  object frxAlbaranes: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38755.5062082176
    ReportOptions.LastChange = 38755.5062082176
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnGetValue = frxAlbaranesGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 208
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
