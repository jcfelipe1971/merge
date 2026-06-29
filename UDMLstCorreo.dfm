object DMLstCorreo: TDMLstCorreo
  OldCreateOrder = False
  OnCreate = DMLstCorreoCreate
  OnDestroy = DMLstCorreoDestroy
  Left = 426
  Top = 267
  Height = 426
  Width = 502
  object frCorreo: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de e-mail'
    RebuildPrinter = False
    OnGetValue = frCorreoGetValue
    OnBeforePrint = frCorreoEnterRect
    OnEnterRect = frCorreoEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 48
    Top = 10
    ReportForm = {19000000}
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 194
    Top = 10
  end
  object frDBxCorreo: TfrDBDataSet
    DataSource = DSxCorreo
    Left = 237
    Top = 97
  end
  object xCorreo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CORREO'
      'WHERE EMPRESA = ?EMPRESA AND'
      'USUARIO = ?USUARIO AND'
      'RIG = ?RIG'
      'ORDER BY RIG')
    UniDirectional = False
    AfterOpen = xCorreoAfterOpen
    Left = 48
    Top = 96
    object xCorreoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCorreoRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xCorreoUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object xCorreoASUNTO: TFIBStringField
      DisplayLabel = 'Asunto'
      FieldName = 'ASUNTO'
      Size = 100
    end
    object xCorreoMENSAJE: TBlobField
      DisplayLabel = 'Mensaje'
      FieldName = 'MENSAJE'
      Size = 8
    end
  end
  object DSxCorreo: TDataSource
    DataSet = xCorreo
    Left = 135
    Top = 96
  end
  object xCorreoDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CORREO_DETALLE'
      'WHERE EMPRESA = ?EMPRESA AND'
      'RIG = ?RIG'
      'order by TIPO')
    UniDirectional = False
    DataSource = DSxCorreo
    Left = 48
    Top = 155
    object xCorreoDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCorreoDetalleRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xCorreoDetalleDIR: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR'
    end
    object xCorreoDetalleTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 15
    end
    object xCorreoDetalleDESTINO_ADRESS: TFIBStringField
      DisplayLabel = 'Destino'
      FieldName = 'DESTINO_ADRESS'
      Size = 100
    end
    object xCorreoDetalleAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object xCorreoDetalleCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xCorreoDetalleTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
  end
  object DSxCorreoDetalle: TDataSource
    DataSet = xCorreoDetalle
    Left = 135
    Top = 155
  end
  object xCorreoAdjuntos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CORREO_ADJUNTOS'
      'WHERE'
      '  RIG=?RIG AND '
      '  EMPRESA=?EMPRESA ')
    UniDirectional = False
    DataSource = DSxCorreo
    Left = 46
    Top = 211
    object xCorreoAdjuntosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCorreoAdjuntosRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xCorreoAdjuntosDIR: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR'
    end
    object xCorreoAdjuntosFICHERO: TFIBStringField
      DisplayLabel = 'Fichero'
      FieldName = 'FICHERO'
      Size = 200
    end
    object xCorreoAdjuntosTAMANYO: TFloatField
      DisplayLabel = 'Tama'#241'o'
      FieldName = 'TAMANYO'
    end
  end
  object DSxCorreoAdjuntos: TDataSource
    DataSet = xCorreoAdjuntos
    Left = 135
    Top = 211
  end
  object frDBxCorreoDetalle: TfrDBDataSet
    DataSource = DSxCorreoDetalle
    Left = 238
    Top = 155
  end
  object frDBxCorreoAdjuntos: TfrDBDataSet
    DataSource = DSxCorreoAdjuntos
    Left = 238
    Top = 211
  end
  object xUsuarios: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT NOMBRE,NOMBRE_CORREO,DIR_CORREO FROM'
      'SYS_USUARIOS'
      'WHERE USUARIO=?USUARIO')
    UniDirectional = False
    Left = 48
    Top = 268
    object xUsuariosNOMBRE_CORREO: TFIBStringField
      DisplayLabel = 'Nombre Correo'
      FieldName = 'NOMBRE_CORREO'
      Size = 60
    end
    object xUsuariosDIR_CORREO: TFIBStringField
      DisplayLabel = 'Correo'
      FieldName = 'DIR_CORREO'
      Size = 100
    end
    object xUsuariosNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 31
    end
  end
  object DSxUsuarios: TDataSource
    DataSet = xUsuarios
    Left = 135
    Top = 268
  end
  object frDBxUsuarios: TfrDBDataSet
    DataSource = DSxUsuarios
    Left = 238
    Top = 268
  end
  object QDameDelTipo: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT DESTINO_ADRESS FROM EMP_CORREO_DETALLE'
      'WHERE'
      '  EMPRESA = ?EMPRESA AND'
      '  RIG = ?RIG AND'
      '  TIPO = ?TIPO')
    Transaction = TLocal
    Left = 416
    Top = 70
  end
  object frUserDataset1: TfrUserDataset
    RangeEnd = reCount
    RangeEndCount = 1
    Left = 239
    Top = 321
  end
  object frxCorreo: TfrxHYReport
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
    OnBeforePrint = frxCorreoBeforePrint
    OnGetValue = frxCorreoGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 119
    Top = 10
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDBxCorreo: TfrxDBDataset
    UserName = 'frxDBxCorreo'
    CloseDataSource = False
    DataSource = DSxCorreo
    Left = 334
    Top = 98
  end
  object frxDBxCorreoDetalle: TfrxDBDataset
    UserName = 'frxDBxCorreoDetalle'
    CloseDataSource = False
    DataSource = DSxCorreoDetalle
    Left = 334
    Top = 155
  end
  object frxDBxCorreoAdjuntos: TfrxDBDataset
    UserName = 'frxDBxCorreoAdjuntos'
    CloseDataSource = False
    DataSource = DSxCorreoAdjuntos
    Left = 334
    Top = 211
  end
  object frxDBxUsuarios: TfrxDBDataset
    UserName = 'frxDBxUsuarios'
    CloseDataSource = False
    DataSource = DSxUsuarios
    Left = 334
    Top = 268
  end
end
