object DMDisenador: TDMDisenador
  OldCreateOrder = False
  OnCreate = DMDisenadorCreate
  OnDestroy = DataModuleDestroy
  Left = 676
  Top = 196
  Height = 466
  Width = 459
  object QMGrupo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM DIC_LISTADOS_GRUPOS'
      'WHERE'
      '  GRUPO=?GRUPO ')
    SelectSQL.Strings = (
      'SELECT * FROM DIC_LISTADOS_GRUPOS'
      'order by grupo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE DIC_LISTADOS_GRUPOS'
      'SET'
      '   LISTADODEF=?LISTADODEF'
      '  ,COPIAS=?COPIAS '
      '  ,PIJAMA=?PIJAMA '
      'WHERE'
      '  GRUPO=?GRUPO ')
    AfterOpen = QMGrupoAfterOpen
    AfterScroll = QMGrupoAfterScroll
    ClavesPrimarias.Strings = (
      'GRUPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'DIC_LISTADOS_GRUPOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMGrupoGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object QMGrupoTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMGrupoLISTADODEF: TIntegerField
      DisplayLabel = 'List. Def.'
      FieldName = 'LISTADODEF'
    end
    object QMGrupoCOPIAS: TIntegerField
      DisplayLabel = 'N. Copias'
      FieldName = 'COPIAS'
    end
    object QMGrupoPIJAMA: TIntegerField
      DisplayLabel = 'Pijama'
      FieldName = 'PIJAMA'
    end
    object QMGrupoLISTADODEFMAIL: TIntegerField
      DisplayLabel = 'List. Def.'
      FieldName = 'LISTADODEFMAIL'
    end
  end
  object DSQMGrupo: TDataSource
    DataSet = QMGrupo
    Left = 144
    Top = 8
  end
  object QMListado: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM DIC_LISTADOS'
      'WHERE'
      '  LISTADO=?old_LISTADO ')
    InsertSQL.Strings = (
      'INSERT INTO DIC_LISTADOS'
      '  (DEF_LISTADO,GRUPO,TITULO,LISTADO,EDITABLE,CABECERA,TIPO)'
      'VALUES'
      
        '  (?DEF_LISTADO,?GRUPO,?TITULO,?LISTADO,?EDITABLE,?CABECERA,?TIP' +
        'O)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM DIC_LISTADOS'
      'WHERE'
      '  LISTADO=?LISTADO ')
    SelectSQL.Strings = (
      'SELECT * FROM DIC_LISTADOS'
      'where grupo=?grupo'
      'order by listado')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE DIC_LISTADOS'
      'SET'
      '  DEF_LISTADO=?DEF_LISTADO '
      '  ,GRUPO=?GRUPO '
      '  ,TITULO=?TITULO '
      '  ,EDITABLE=?EDITABLE '
      '  ,CABECERA=?CABECERA '
      '  ,TIPO=?TIPO '
      '  ,IMPRESORA=?IMPRESORA'
      'WHERE'
      '  LISTADO=?LISTADO ')
    DataSource = DSQMGrupo
    AfterOpen = QMListadoAfterOpen
    BeforeDelete = QMListadoBeforeDelete
    BeforePost = QMListadoBeforePost
    OnDeleteError = QMListadoDeleteError
    OnNewRecord = QMListadoNewRecord
    ClavesPrimarias.Strings = (
      'LISTADO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'DIC_LISTADOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
    object QMListadoLISTADO: TIntegerField
      DisplayLabel = 'Listado'
      FieldName = 'LISTADO'
    end
    object QMListadoGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object QMListadoTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMListadoDEF_LISTADO: TBlobField
      DisplayLabel = 'Defecto'
      FieldName = 'DEF_LISTADO'
      Size = 8
    end
    object QMListadoEDITABLE: TIntegerField
      DisplayLabel = 'Editable'
      FieldName = 'EDITABLE'
    end
    object QMListadoCABECERA: TIntegerField
      DisplayLabel = 'Cabecera'
      FieldName = 'CABECERA'
    end
    object QMListadoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMListadoIMPRESORA: TFIBStringField
      DisplayLabel = 'Impresora'
      FieldName = 'IMPRESORA'
      Size = 3
    end
  end
  object DSQMListado: TDataSource
    DataSet = QMListado
    Left = 144
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 256
    Top = 8
  end
  object frListado: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 256
    Top = 104
    ReportForm = {19000000}
  end
  object xListados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM DIC_LISTADOS'
      'where Listado=?cabecera')
    UniDirectional = False
    DataSource = DSQMListado
    Left = 40
    Top = 104
    object xListadosLISTADO: TIntegerField
      DisplayLabel = 'Listado'
      FieldName = 'LISTADO'
    end
    object xListadosGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object xListadosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object xListadosDEF_LISTADO: TBlobField
      DisplayLabel = 'Def. Listado'
      FieldName = 'DEF_LISTADO'
      Size = 8
    end
    object xListadosEDITABLE: TIntegerField
      DisplayLabel = 'Editable'
      FieldName = 'EDITABLE'
    end
    object xListadosCABECERA: TIntegerField
      DisplayLabel = 'Cabecera'
      FieldName = 'CABECERA'
    end
    object xListadosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xListadosIMPRESORA: TFIBStringField
      DisplayLabel = 'Impresora'
      FieldName = 'IMPRESORA'
      Size = 3
    end
  end
  object DSxListados: TDataSource
    DataSet = xListados
    Left = 144
    Top = 104
  end
  object xGrupos_EEC: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM DIC_LISTADOS_GRUPOS_EEC'
      'WHERE'
      '  GRUPO=?GRUPO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM DIC_LISTADOS_GRUPOS_EEC'
      'where empresa=?empresa and '
      '           ejercicio=?ejercicio and '
      '           canal=?canal and '
      '           grupo=?grupo')
    UniDirectional = False
    Left = 40
    Top = 152
    object xGrupos_EECEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xGrupos_EECEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xGrupos_EECCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xGrupos_EECGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object xGrupos_EECLISTADODEF: TIntegerField
      DisplayLabel = 'Listado Def.'
      FieldName = 'LISTADODEF'
    end
    object xGrupos_EECLISTADODEFMAIL: TIntegerField
      DisplayLabel = 'List. Def. e-mail'
      FieldName = 'LISTADODEFMAIL'
    end
  end
  object DSxGrupos_EEC: TDataSource
    DataSet = xGrupos_EEC
    Left = 144
    Top = 152
  end
  object HYReport: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 0
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
    ControlaLongitud = True
    Left = 256
    Top = 152
  end
  object QMListadosEECS: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_LISTADOS_EECS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  GRUPO=?old_GRUPO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_LISTADOS_EECS'
      
        '  (SERIE,EMPRESA,EJERCICIO,CANAL,GRUPO,LISTADODEF,TITULO_SERIE,T' +
        'ITULO_LISTADO,LISTADODEFMAIL)'
      'VALUES'
      
        '  (?SERIE,?EMPRESA,?EJERCICIO,?CANAL,?GRUPO,?LISTADODEF,?TITULO_' +
        'SERIE,?TITULO_LISTADO,?LISTADODEFMAIL)'
      ' ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_LISTADOS_EECS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  GRUPO=?GRUPO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_LISTADOS_EECS'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND GRUPO=?GRUPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_LISTADOS_EECS'
      'SET'
      '  LISTADODEF=?LISTADODEF'
      '  ,LISTADODEFMAIL = ?LISTADODEFMAIL'
      '  ,TITULO_SERIE=?TITULO_SERIE '
      '  ,TITULO_LISTADO=?TITULO_LISTADO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  GRUPO=?GRUPO ')
    BeforePost = QMListadosEECSBeforePost
    OnNewRecord = QMListadosEECSNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'GRUPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_LISTADOS_EECS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 200
    object QMListadosEECSEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMListadosEECSEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMListadosEECSCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMListadosEECSSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      OnChange = QMListadosEECSSERIEChange
      Size = 10
    end
    object QMListadosEECSGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object QMListadosEECSLISTADODEF: TIntegerField
      DisplayLabel = 'Listado Def.'
      FieldName = 'LISTADODEF'
      OnChange = QMListadosEECSLISTADODEFChange
    end
    object QMListadosEECSTITULO_SERIE: TFIBStringField
      DisplayLabel = 'T'#237'tulo Serie'
      FieldName = 'TITULO_SERIE'
      Size = 40
    end
    object QMListadosEECSTITULO_LISTADO: TFIBStringField
      DisplayLabel = 'T'#237'tulo Listado'
      FieldName = 'TITULO_LISTADO'
      Size = 40
    end
    object QMListadosEECSLISTADODEFMAIL: TIntegerField
      DisplayLabel = 'Lst. e-mail'
      FieldName = 'LISTADODEFMAIL'
    end
  end
  object DSQMListadosEECS: TDataSource
    DataSet = QMListadosEECS
    Left = 144
    Top = 200
  end
  object HYReportMail: THYReportMail
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    ValorCodigo = 0
    ValorGrupo = 0
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
    ControlaLongitud = True
    Left = 256
    Top = 248
  end
  object frxListado: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38675.5375695718
    ReportOptions.LastChange = 38675.5375695718
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 256
    Top = 200
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object QExportadorLst: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM DIC_LISTADOS_GRUPOS_EEC'
      'WHERE'
      '  GRUPO=?GRUPO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM DIC_LISTADOS '
      'ORDER BY GRUPO,LISTADO')
    UniDirectional = False
    Left = 40
    Top = 248
    object QExportadorLstLISTADO: TIntegerField
      DisplayLabel = 'Listado'
      FieldName = 'LISTADO'
    end
    object QExportadorLstGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object QExportadorLstTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object QExportadorLstDEF_LISTADO: TBlobField
      DisplayLabel = 'Def. Listado'
      FieldName = 'DEF_LISTADO'
      Size = 8
    end
    object QExportadorLstEDITABLE: TIntegerField
      DisplayLabel = 'Editable'
      FieldName = 'EDITABLE'
    end
    object QExportadorLstCABECERA: TIntegerField
      DisplayLabel = 'Cabecera'
      FieldName = 'CABECERA'
    end
    object QExportadorLstTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 256
    Top = 56
  end
end
