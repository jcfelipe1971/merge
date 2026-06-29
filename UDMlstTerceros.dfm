object DMLstTerceros: TDMLstTerceros
  OldCreateOrder = False
  OnCreate = DMlstTercerosCreate
  OnDestroy = DMlstTercerosDestroy
  Left = 528
  Top = 231
  Height = 604
  Width = 761
  object frTerceros: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Terceros (Fiscal)'
    RebuildPrinter = False
    OnGetValue = frTercerosGetValue
    OnBeforePrint = frTercerosEnterRect
    OnEnterRect = frTercerosEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 48
    Top = 16
    ReportForm = {19000000}
  end
  object QMTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_EDICION')
    UniDirectional = False
    AfterOpen = QMTercerosAfterOpen
    BeforeClose = QMTercerosBeforeClose
    Left = 48
    Top = 64
  end
  object DSQMTerceros: TDataSource
    DataSet = QMTerceros
    Left = 144
    Top = 64
  end
  object frDSQMTerceros: TfrDBDataSet
    DataSource = DSQMTerceros
    Left = 248
    Top = 64
  end
  object frDSQMJustifica: TfrDBDataSet
    DataSource = DSQMJustifica
    Left = 248
    Top = 112
  end
  object DSQMJustifica: TDataSource
    DataSet = QMJustifica
    Left = 144
    Top = 112
  end
  object QMJustifica: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO(:TERCERO)')
    UniDirectional = False
    DataSource = DSQMTerceros
    Left = 48
    Top = 112
  end
  object QMFormasdePago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_GES_FP'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  FORMA_PAGO=?FORMA_PAGO ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_CUENTAS_GES_FP'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'FORMA_PAGO = :FORMA_PAGO')
    UniDirectional = False
    Left = 48
    Top = 160
  end
  object DSFormasdePago: TDataSource
    DataSet = QMFormasdePago
    Left = 144
    Top = 160
  end
  object frDSQMFormasdePago: TfrDBDataSet
    DataSource = DSFormasdePago
    Left = 248
    Top = 160
  end
  object frDSQMIvaModos: TfrDBDataSet
    DataSource = DSIvaModos
    Left = 248
    Top = 208
  end
  object DSIvaModos: TDataSource
    DataSet = QMIvaModos
    Left = 144
    Top = 208
  end
  object QMIvaModos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_MODO_IVA'
      'WHERE'
      '  MODO=?MODO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_MODO_IVA'
      '  WHERE MODO = ?MODO_IVA')
    UniDirectional = False
    Left = 48
    Top = 208
  end
  object QMIRPF: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_IRPF'
      'WHERE'
      '  PAIS=?PAIS AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_IRPF'
      '  WHERE TIPO = ?TIPO_IRPF')
    UniDirectional = False
    Left = 48
    Top = 256
  end
  object DSIRPF: TDataSource
    DataSet = QMIRPF
    Left = 144
    Top = 256
  end
  object frDSQMIRPF: TfrDBDataSet
    DataSource = DSIRPF
    Left = 248
    Top = 256
  end
  object frDSQMTipoTerceros: TfrDBDataSet
    DataSource = DSTipoTerceros
    Left = 248
    Top = 304
  end
  object DSTipoTerceros: TDataSource
    DataSet = QMTipoTercero
    Left = 144
    Top = 304
  end
  object QMTipoTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPOS_TERCERO'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPOS_TERCERO')
    UniDirectional = False
    Left = 48
    Top = 304
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
    Left = 248
    Top = 16
  end
  object frxTerceros: TfrxHYReport
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
    OnBeforePrint = frxTercerosBeforePrint
    OnGetValue = frxTercerosGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 144
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object QMBanco: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TERCEROS_BANCOS'
      'WHERE'
      'TERCERO = ?TERCERO AND'
      'BANCO = ?BANCO')
    UniDirectional = False
    AfterOpen = QMBancoAfterOpen
    BeforeClose = QMBancoBeforeClose
    Left = 48
    Top = 352
  end
  object DSQMBanco: TDataSource
    DataSet = QMBanco
    Left = 144
    Top = 352
  end
  object frDSQMBanco: TfrDBDataSet
    DataSource = DSQMBanco
    Left = 248
    Top = 352
  end
  object QMEntidad: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO FROM'
      'SYS_BANCOS'
      'WHERE '
      'PAIS = ?PAIS AND ENTIDAD = ?ENTIDAD')
    UniDirectional = False
    DataSource = DSQMBanco
    AfterOpen = QMTercerosAfterOpen
    BeforeClose = QMTercerosBeforeClose
    Left = 48
    Top = 400
  end
  object DSQMEntidad: TDataSource
    DataSet = QMEntidad
    Left = 144
    Top = 400
  end
  object frDSQMEntidad: TfrDBDataSet
    DataSource = DSQMEntidad
    Left = 248
    Top = 400
  end
  object xLstFirmas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ID_FIRMA, NOMBRE, NIF, FECHA, COMENTARIO'
      'FROM GES_FIRMAS'
      'WHERE'
      'TIPO = :TIPO AND'
      'ID_DOC = :TERCERO AND'
      'OCTET_LENGTH(COALESCE(FIRMA, '#39#39')) > 10'
      'ORDER BY ID_FIRMA')
    UniDirectional = False
    Left = 384
    Top = 64
  end
  object DSxLstFirmas: TDataSource
    DataSet = xLstFirmas
    Left = 472
    Top = 64
  end
  object frDBDLstFirmas: TfrDBDataSet
    DataSource = DSxLstFirmas
    Left = 584
    Top = 64
  end
  object frxDBxLstFirmas: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = xLstFirmas
    Left = 680
    Top = 64
  end
  object xEmpresa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM SYS_EMPRESAS'
      'WHERE'
      'EMPRESA = :EMPRESA')
    UniDirectional = False
    DataSource = DSQMTerceros
    Left = 384
    Top = 112
  end
  object QMContacto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM'
      'SYS_TERCEROS_CONTACTOS'
      'WHERE '
      'TERCERO = :TERCERO AND'
      'CONTACTO = :CONTACTO')
    UniDirectional = False
    AfterOpen = QMContactoAfterOpen
    BeforeClose = QMContactoBeforeClose
    Left = 48
    Top = 448
  end
  object DSQMContacto: TDataSource
    DataSet = QMContacto
    Left = 144
    Top = 448
  end
  object frDBDSQMContacto: TfrDBDataSet
    DataSource = DSQMContacto
    Left = 248
    Top = 448
  end
  object QMUsuarioWeb: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM USUARIOS_WEB'
      'WHERE'
      'TERCERO = :TERCERO AND'
      'CONTACTO = :CONTACTO')
    UniDirectional = False
    DataSource = DSQMContacto
    Left = 48
    Top = 496
  end
  object DSQMUsuarioWeb: TDataSource
    DataSet = QMUsuarioWeb
    Left = 144
    Top = 496
  end
  object frDBDSQMUsuarioWeb: TfrDBDataSet
    DataSource = DSQMUsuarioWeb
    Left = 248
    Top = 496
  end
  object frDBxDirContacto: TfrDBDataSet
    DataSource = DSxDirContacto
    Left = 584
    Top = 448
  end
  object DSxDirContacto: TDataSource
    DataSet = xDirContacto
    Left = 480
    Top = 448
  end
  object xDirContacto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM UT_JUSTIFICA_DOMICILIO(:TERCERO)'
      'WHERE '
      'NUM = :DIRECCION')
    UniDirectional = False
    DataSource = DSQMContacto
    Left = 384
    Top = 448
  end
end
