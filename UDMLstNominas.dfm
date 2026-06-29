object DMLstNominas: TDMLstNominas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 418
  Top = 187
  Height = 454
  Width = 789
  object frNominas: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de albaranes por Agente'
    RebuildPrinter = False
    OnGetValue = frNominasGetValue
    OnBeforePrint = frNominasBeforePrint
    OnEnterRect = frNominasBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 664
    Top = 64
    ReportForm = {19000000}
  end
  object QMCabNomina: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_EMP_NOMINAS_CABECERA'
      'WHERE'
      'ID = :ID')
    UniDirectional = False
    AfterOpen = QMCabNominaAfterOpen
    BeforeClose = QMCabNominaBeforeClose
    Left = 56
    Top = 16
  end
  object DSQMCabNominas: TDataSource
    DataSet = QMCabNomina
    Left = 192
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 664
    Top = 16
  end
  object frxNominas: TfrxHYReport
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
    OnBeforePrint = frxNominasBeforePrint
    OnGetValue = frNominasGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 664
    Top = 112
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object HYRSCabNomina: THYReportSource
    DataSet = QMCabNomina
    CloseDataset = False
    Left = 552
    Top = 16
  end
  object frxDBCabNominas: TfrxDBDataset
    UserName = 'frxDBCabNominas'
    CloseDataSource = False
    DataSource = DSQMCabNominas
    Left = 440
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
    Left = 664
    Top = 160
  end
  object QMDetNomina: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_EMP_NOMINAS_DETALLE'
      'WHERE'
      'ID_CABECERA = :ID'
      'ORDER BY LINEA')
    UniDirectional = False
    DataSource = DSQMCabNominas
    Left = 56
    Top = 64
  end
  object DSQMDetNomina: TDataSource
    DataSet = QMDetNomina
    Left = 192
    Top = 64
  end
  object HYRSDetNomina: THYReportSource
    DataSet = QMDetNomina
    CloseDataset = False
    Left = 552
    Top = 64
  end
  object frxDBDetNominas: TfrxDBDataset
    UserName = 'frxDBNominas'
    CloseDataSource = False
    DataSource = DSQMDetNomina
    Left = 440
    Top = 64
  end
  object QMEmpleado: TFIBDataSetRO
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
      'EMPLEADO = :EMPLEADO')
    UniDirectional = False
    DataSource = DSQMCabNominas
    Left = 56
    Top = 112
  end
  object DSEmpleado: TDataSource
    DataSet = QMEmpleado
    Left = 192
    Top = 112
  end
  object frDBCabNomina: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSQMCabNominas
    Left = 320
    Top = 16
  end
  object frDBDetNomina: TfrDBDataSet
    DataSource = DSQMDetNomina
    OpenDataSource = False
    Left = 320
    Top = 64
  end
  object QMNomDetHaberes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_EMP_NOMINAS_DET_HABERES'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO VER_EMP_NOMINAS_DET_HABERES'
      
        '  (ID,'#13#10'ID_CABECERA,LINEA,IMPORTE,CODIGO,GLOSA,CALCULABLE,ES_IMP' +
        'ONIBLE)'
      'VALUES'
      
        '  (?ID,'#13#10'?ID_CABECERA,?LINEA,?IMPORTE,?CODIGO,?GLOSA,?CALCULABLE' +
        ',?ES_IMPONIBLE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_NOMINAS_DET_HABERES'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_NOMINAS_DET_HABERES'
      'WHERE'
      '  ID_CABECERA=?ID '
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_EMP_NOMINAS_DET_HABERES'
      'SET'
      '  ID_CABECERA=?ID_CABECERA '
      '  ,LINEA=?LINEA '
      '  ,IMPORTE=?IMPORTE '
      '  ,CODIGO=?CODIGO '
      '  ,GLOSA=?GLOSA '
      '  ,CALCULABLE=?CALCULABLE '
      '  ,ES_IMPONIBLE=?ES_IMPONIBLE '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMCabNominas
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_NOMINAS_DET_HABERES'
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 56
    Top = 160
  end
  object DSQMNomDetHaberes: TDataSource
    DataSet = QMNomDetHaberes
    Left = 192
    Top = 160
  end
  object QMNomDetDescuentos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_EMP_NOMINAS_DET_DESCUENTOS'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO VER_EMP_NOMINAS_DET_DESCUENTOS'
      
        '  (ID,'#13#10'ID_CABECERA,LINEA,IMPORTE,CODIGO,GLOSA,CALCULABLE,ES_PER' +
        'SONAL)'
      'VALUES'
      
        '  (?ID,'#13#10'?ID_CABECERA,?LINEA,?IMPORTE,?CODIGO,?GLOSA,?CALCULABLE' +
        ',?ES_PERSONAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_NOMINAS_DET_DESCUENTOS'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_NOMINAS_DET_DESCUENTOS'
      'WHERE'
      '  ID_CABECERA=?ID '
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_EMP_NOMINAS_DET_DESCUENTOS'
      'SET'
      '  ID_CABECERA=?ID_CABECERA '
      '  ,LINEA=?LINEA '
      '  ,IMPORTE=?IMPORTE '
      '  ,CODIGO=?CODIGO '
      '  ,GLOSA=?GLOSA '
      '  ,CALCULABLE=?CALCULABLE '
      '  ,ES_PERSONAL=?ES_PERSONAL '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMCabNominas
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_NOMINAS_DET_DESCUENTOS'
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 56
    Top = 208
  end
  object DSQMNomDetDescuentos: TDataSource
    DataSet = QMNomDetDescuentos
    Left = 192
    Top = 208
  end
  object QMNomDetParametros: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_EMP_NOMINAS_DET_PARAMETROS'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO VER_EMP_NOMINAS_DET_PARAMETROS'
      
        '  (ID,'#13#10'ID_CABECERA,LINEA,IMPORTE,DATO_TEXTO,DATO_FECHA,CODIGO,G' +
        'LOSA,CALCULABLE,TIPO_DATO)'
      'VALUES'
      
        '  (?ID,'#13#10'?ID_CABECERA,?LINEA,?IMPORTE,?DATO_TEXTO,?DATO_FECHA,?C' +
        'ODIGO,?GLOSA,?CALCULABLE,?TIPO_DATO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_NOMINAS_DET_PARAMETROS'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMP_NOMINAS_DET_PARAMETROS'
      'WHERE'
      '  ID_CABECERA=?ID '
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_EMP_NOMINAS_DET_PARAMETROS'
      'SET'
      '  ID_CABECERA=?ID_CABECERA '
      '  ,LINEA=?LINEA '
      '  ,IMPORTE=?IMPORTE '
      '  ,DATO_TEXTO=?DATO_TEXTO '
      '  ,DATO_FECHA=?DATO_FECHA '
      '  ,CODIGO=?CODIGO '
      '  ,GLOSA=?GLOSA '
      '  ,CALCULABLE=?CALCULABLE '
      '  ,TIPO_DATO=?TIPO_DATO '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMCabNominas
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_NOMINAS_DET_PARAMETROS'
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 56
    Top = 256
  end
  object DSQMNomDetParametros: TDataSource
    DataSet = QMNomDetParametros
    Left = 192
    Top = 256
  end
  object HYRSNomDetHaberes: THYReportSource
    DataSet = QMNomDetHaberes
    CloseDataset = False
    Left = 552
    Top = 160
  end
  object frxDBNomDetHaberes: TfrxDBDataset
    UserName = 'frxDBNominas'
    CloseDataSource = False
    DataSource = DSQMNomDetHaberes
    Left = 440
    Top = 160
  end
  object frDBNomDetHaberes: TfrDBDataSet
    DataSource = DSQMNomDetHaberes
    OpenDataSource = False
    Left = 320
    Top = 160
  end
  object HYRSNomDetDescuentos: THYReportSource
    DataSet = QMNomDetDescuentos
    CloseDataset = False
    Left = 552
    Top = 208
  end
  object frxDBNomDetDescuentos: TfrxDBDataset
    UserName = 'frxDBNominas'
    CloseDataSource = False
    DataSource = DSQMNomDetDescuentos
    Left = 440
    Top = 208
  end
  object frDBNomDetDescuentos: TfrDBDataSet
    DataSource = DSQMNomDetDescuentos
    OpenDataSource = False
    Left = 320
    Top = 208
  end
  object HYRSNomDetParametros: THYReportSource
    DataSet = QMNomDetParametros
    CloseDataset = False
    Left = 552
    Top = 256
  end
  object frxDBNomDetParametros: TfrxDBDataset
    UserName = 'frxDBNominas'
    CloseDataSource = False
    DataSource = DSQMNomDetParametros
    Left = 440
    Top = 256
  end
  object frDBNomDetParametros: TfrDBDataSet
    DataSource = DSQMNomDetParametros
    OpenDataSource = False
    Left = 320
    Top = 256
  end
  object QMNomConstantes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_EMP_NOMINAS_CONSTANTES'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO VER_EMP_NOMINAS_CONSTANTES'
      
        '  (ID,'#13#10'EMPRESA,EJERCICIO,CANAL,PERIODO,CODIGO,IMPORTE,DATO_TEXT' +
        'O,GLOSA,TIPO_DATO)'
      'VALUES'
      
        '  (?ID,'#13#10'?EMPRESA,?EJERCICIO,?CANAL,?PERIODO,?CODIGO,?IMPORTE,?D' +
        'ATO_TEXTO,?GLOSA,?TIPO_DATO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_NOMINAS_CONSTANTES'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_EMP_NOMINAS_CONSTANTES'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'PERIODO = SUBSTRING(:PERIODO FROM 1 FOR 2)'
      'ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_EMP_NOMINAS_CONSTANTES'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,PERIODO=?PERIODO '
      '  ,CODIGO=?CODIGO '
      '  ,IMPORTE=?IMPORTE '
      '  ,DATO_TEXTO=?DATO_TEXTO '
      '  ,GLOSA=?GLOSA '
      '  ,TIPO_DATO=?TIPO_DATO '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSQMCabNominas
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_NOMINAS_CONSTANTES'
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 56
    Top = 304
  end
  object DSNomConstantes: TDataSource
    DataSet = QMNomConstantes
    Left = 192
    Top = 304
  end
  object HYRSNomConstantes: THYReportSource
    DataSet = QMNomConstantes
    CloseDataset = False
    Left = 552
    Top = 304
  end
  object frxDBNomConstantes: TfrxDBDataset
    UserName = 'frxDBNominas'
    CloseDataSource = False
    DataSource = DSNomConstantes
    Left = 440
    Top = 304
  end
  object frDBNomConstantes: TfrDBDataSet
    DataSource = DSNomConstantes
    OpenDataSource = False
    Left = 320
    Top = 304
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
    Left = 664
    Top = 216
  end
end
