object ProDMLstEscandalloDesg: TProDMLstEscandalloDesg
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 569
  Top = 193
  Height = 352
  Width = 467
  object frDBlstEscDesg: TfrDBDataSet
    DataSet = QGenerarLst
    Left = 240
    Top = 80
  end
  object DSEscandallo: TDataSource
    DataSet = xEscandallo
    Left = 136
    Top = 176
  end
  object xEscandallo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT EMPRESA,COMPUESTO,TIPO FROM PRO_ESCANDALLO'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ESCANDALLO = ?ESCANDALLO AND'
      'TIPO = ?TIPO')
    UniDirectional = False
    Left = 32
    Top = 176
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 360
    Top = 32
  end
  object frListadoEG: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Escandallo desglosado'
    RebuildPrinter = False
    OnGetValue = frListadoEGGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 32
    Top = 32
    ReportForm = {19000000}
  end
  object QGenerarLst: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'SELECT * FROM  PRO_LST_ESC_DESG (?EMPRESA, ?ESCANDALLO, ?TIPO, ?' +
        'ENTRADA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AfterOpen = QGenerarLstAfterOpen
    BeforeClose = QGenerarLstBeforeClose
    Left = 32
    Top = 80
  end
  object QGenerarLstTar: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM  PRO_LST_ESC_DES_TAR(?ENTRADA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 32
    Top = 128
  end
  object frDBlstEscDesgTar: TfrDBDataSet
    DataSet = QGenerarLstTar
    Left = 240
    Top = 128
  end
  object xCompuesto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_CUENTAS '
      'WHERE '
      'EMPRESA=?EMPRESA'
      'AND EJERCICIO=?EJERCICIO '
      'AND CANAL=?CANAL '
      'AND ARTICULO=?ARTICULO')
    UniDirectional = False
    DataSource = DSQGenerarLst
    BeforeOpen = xCompuestoBeforeOpen
    Left = 360
    Top = 80
  end
  object xComponente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_ARTICULOS_CUENTAS '
      'WHERE '
      'EMPRESA=?EMPRESA'
      'AND EJERCICIO=?EJERCICIO '
      'AND CANAL=?CANAL '
      'AND ARTICULO=?ARTICULO')
    UniDirectional = False
    DataSource = DSQGenerarLst
    BeforeOpen = xCompuestoBeforeOpen
    Left = 360
    Top = 128
  end
  object DSQGenerarLst: TDataSource
    DataSet = QGenerarLst
    Left = 136
    Top = 80
  end
  object DSQGenerarLstTar: TDataSource
    DataSet = QGenerarLstTar
    Left = 136
    Top = 128
  end
  object xComponenteProv: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT FIRST 1 A.*, T.NOMBRE_COMERCIAL TITULO, T.NOMBRE_R_SOCIAL'
      'FROM ART_ARTICULOS_PROVEEDORES A'
      
        'JOIN EMP_PROVEEDORES P ON A.EMPRESA = P.EMPRESA AND A.PROVEEDOR ' +
        '= P.PROVEEDOR'
      'JOIN SYS_TERCEROS T ON P.TERCERO = T.TERCERO'
      'WHERE'
      'A.EMPRESA = :EMPRESA AND'
      'A.ARTICULO = :ARTICULO AND'
      'A.ACTIVO = 1'
      'ORDER BY PRIORIDAD')
    UniDirectional = False
    DataSource = DSQGenerarLst
    BeforeOpen = xComponenteProvBeforeOpen
    Left = 360
    Top = 176
  end
  object frxListadoEG: TfrxHYReport
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
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 136
    Top = 32
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
