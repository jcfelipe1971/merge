object DMListConfig: TDMListConfig
  OldCreateOrder = False
  OnCreate = DMListCreate
  Left = 743
  Top = 245
  Height = 359
  Width = 395
  object QMGrupo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM DIC_LISTADOS_GRUPOS'
      'WHERE'
      '  GRUPO=?GRUPO ')
    SelectSQL.Strings = (
      'SELECT * FROM DIC_LISTADOS_GRUPOS'
      'where grupo=?grupo'
      'order by grupo')
    UniDirectional = False
    Left = 26
    Top = 82
    object QMGrupoGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object QMGrupoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMGrupoLISTADODEF: TIntegerField
      DisplayLabel = 'Listado Def.'
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
  end
  object DSQMGrupo: TDataSource
    DataSet = QMGrupo
    Left = 114
    Top = 82
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 276
    Top = 22
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
    Left = 28
    Top = 18
    ReportForm = {19000000}
  end
  object xListadoDef: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM DIC_LISTADOS'
      'where Listado=?ListadoDef')
    UniDirectional = False
    Left = 26
    Top = 146
    object xListadoDefLISTADO: TIntegerField
      DisplayLabel = 'Listado'
      FieldName = 'LISTADO'
    end
    object xListadoDefGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object xListadoDefTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xListadoDefDEF_LISTADO: TBlobField
      DisplayLabel = 'Def. Listado'
      FieldName = 'DEF_LISTADO'
      Size = 8
    end
    object xListadoDefEDITABLE: TIntegerField
      DisplayLabel = 'Editable'
      FieldName = 'EDITABLE'
    end
    object xListadoDefCABECERA: TIntegerField
      DisplayLabel = 'Cabecera'
      FieldName = 'CABECERA'
    end
    object xListadoDefTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
  end
  object DSxListadoDef: TDataSource
    DataSet = xListadoDef
    Left = 114
    Top = 144
  end
  object xListadoCab: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM DIC_LISTADOS'
      'where Listado=?Cabecera')
    UniDirectional = False
    Left = 27
    Top = 204
    object xListadoCabLISTADO: TIntegerField
      DisplayLabel = 'Listado'
      FieldName = 'LISTADO'
    end
    object xListadoCabGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object xListadoCabTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xListadoCabDEF_LISTADO: TBlobField
      DisplayLabel = 'Def. Listado'
      FieldName = 'DEF_LISTADO'
      Size = 8
    end
    object xListadoCabEDITABLE: TIntegerField
      DisplayLabel = 'Editable'
      FieldName = 'EDITABLE'
    end
    object xListadoCabCABECERA: TIntegerField
      DisplayLabel = 'Cabecera'
      FieldName = 'CABECERA'
    end
    object xListadoCabTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
  end
  object DSxListadoCab: TDataSource
    DataSet = xListadoCab
    Left = 114
    Top = 204
  end
  object xListadoEEC: TFIBDataSetRO
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
      'where empresa=?empresa and'
      '           ejercicio=?ejercicio and'
      '           canal=?canal and'
      '           grupo=?grupo')
    UniDirectional = False
    Left = 26
    Top = 260
    object xListadoEECEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xListadoEECEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xListadoEECCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xListadoEECGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object xListadoEECLISTADODEF: TIntegerField
      DisplayLabel = 'Listado Def.'
      FieldName = 'LISTADODEF'
    end
  end
  object DSxListadoEEC: TDataSource
    DataSet = xListadoEEC
    Left = 114
    Top = 260
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
    Opciones.Pagina.SaltoPagina = True
    Opciones.Pagina.ImprimePrimeraCabecera = False
    Opciones.Pagina.ImprimeUltimoPie = False
    ControlaLongitud = True
    Left = 116
    Top = 21
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
    Left = 196
    Top = 22
  end
  object frxListado: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38674.6734666088
    ReportOptions.LastChange = 38674.6734666088
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
    Left = 200
    Top = 80
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
