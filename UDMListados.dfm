object DMListados: TDMListados
  OldCreateOrder = False
  OnCreate = DMListadosCreate
  OnDestroy = DMListadosDestroy
  Left = 755
  Top = 233
  Height = 411
  Width = 349
  object frCab: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 32
    Top = 24
    ReportForm = {19000000}
  end
  object frCuerpo: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 128
    Top = 24
    ReportForm = {19000000}
  end
  object DSxGrupo: TDataSource
    Left = 128
    Top = 168
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 240
    Top = 24
  end
  object QListado: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT LISTADO,GRUPO,CABECERA,TIPO,IMPRESORA '
      'FROM DIC_LISTADOS'
      'WHERE LISTADO=?LISTADODEF')
    Transaction = TLocal
    AutoTrans = True
    Left = 240
    Top = 72
  end
  object QListadoMail: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT LISTADO,GRUPO,CABECERA,TIPO '
      'FROM DIC_LISTADOS'
      'WHERE LISTADO=?LISTADODEFMAIL')
    Transaction = TLocal
    AutoTrans = True
    Left = 240
    Top = 120
  end
  object SMTP: TIdSMTP
    OnStatus = SMTPStatus
    IOHandler = IdSSLIOHandlerSocketOpenSSL
    OnDisconnected = SMTPDisconnected
    OnWork = SMTPWork
    OnWorkBegin = SMTPWorkBegin
    OnWorkEnd = SMTPWorkEnd
    OnConnected = SMTPConnected
    OnFailedRecipient = SMTPFailedRecipient
    SASLMechanisms = <>
    OnTLSNotAvailable = SMTPTLSNotAvailable
    Left = 32
    Top = 120
  end
  object Mail: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 128
    Top = 120
  end
  object frxCab: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38674.7025121296
    ReportOptions.LastChange = 38674.7025121296
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
    Left = 32
    Top = 72
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxCuerpo: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38672.4127839468
    ReportOptions.LastChange = 38672.4127839468
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
    Left = 128
    Top = 72
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object xGrupo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM DIC_LISTADOS_GRUPOS'
      'where grupo=?grupo')
    UniDirectional = False
    Left = 32
    Top = 168
    object xGrupoGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object xGrupoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xGrupoLISTADODEF: TIntegerField
      DisplayLabel = 'Listado Def.'
      FieldName = 'LISTADODEF'
    end
    object xGrupoCOPIAS: TIntegerField
      DisplayLabel = 'N. Copias'
      FieldName = 'COPIAS'
    end
    object xGrupoPIJAMA: TIntegerField
      DisplayLabel = 'Pijama'
      FieldName = 'PIJAMA'
    end
    object xGrupoLISTADODEFMAIL: TIntegerField
      DisplayLabel = 'List. Def. e-mail'
      FieldName = 'LISTADODEFMAIL'
    end
  end
  object Letras: TLetra
    Decimales = 2
    GeneroMasculino = True
    LongLinea = 200
    LongPrimeraLinea = 200
    Separador = ','
    Relleno = #0
    Moneda = 'Eur.'
    DescDecimales = 'c'#233'ntimos'
    ModoDecimales = 0
    Left = 32
    Top = 216
  end
  object IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL
    OnStatus = IdSSLIOHandlerSocketOpenSSLStatus
    Destination = ':25'
    MaxLineAction = maException
    Port = 25
    DefaultPort = 0
    SSLOptions.Method = sslvSSLv23
    SSLOptions.SSLVersions = [sslvSSLv2, sslvSSLv3, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2]
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    OnStatusInfo = IdSSLIOHandlerSocketOpenSSLStatusInfo
    OnStatusInfoEx = IdSSLIOHandlerSocketOpenSSLStatusInfoEx
    Left = 240
    Top = 168
  end
end
