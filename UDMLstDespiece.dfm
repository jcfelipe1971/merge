object DMLstDespiece: TDMLstDespiece
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 599
  Top = 161
  Height = 538
  Width = 440
  object frDespiece: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Despiece'
    RebuildPrinter = False
    OnGetValue = frDespieceGetValue
    OnBeforePrint = frDespieceEnterRect
    OnEnterRect = frDespieceEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 256
    Top = 8
    ReportForm = {19000000}
  end
  object frDBCab: TfrDBDataSet
    DataSource = DSDespieceCab
    Left = 256
    Top = 56
  end
  object frDBComponente: TfrDBDataSet
    DataSource = DSDespieceCom
    Left = 256
    Top = 104
  end
  object frDBTarea: TfrDBDataSet
    DataSource = DSDespieceTar
    Left = 256
    Top = 152
  end
  object DSDespieceCab: TDataSource
    DataSet = xDespieceCab
    Left = 152
    Top = 56
  end
  object DSDespieceCom: TDataSource
    DataSet = xDespieceCom
    Left = 152
    Top = 104
  end
  object DSDespieceTar: TDataSource
    DataSet = xDespieceTar
    Left = 152
    Top = 152
  end
  object xDespieceCab: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT C.*, E.TITULO TITULO_ESTADO, T.NOMBRE_R_SOCIAL'
      'FROM PRO_DESPIECE_CAB C'
      'JOIN SYS_GES_ESTADOS E ON C.ESTADO = E.ESTADO'
      'LEFT JOIN GES_CABECERAS_S D ON C.ID_ORIGEN = D.ID_S'
      'LEFT JOIN SYS_TERCEROS T ON D.TERCERO = T.TERCERO'
      'WHERE'
      'C.ID_DESPIECE_CAB = :ID_DESPIECE_CAB')
    UniDirectional = False
    AfterOpen = xDespieceCabAfterOpen
    BeforeClose = xDespieceCabBeforeClose
    Left = 40
    Top = 56
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
    Top = 8
  end
  object xDespieceCom: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT DET.*, CAB.EMPRESA, ART.TITULO_LARGO AS TITULO, F.NOMBRE TITULO_FORMULA'
      'FROM PRO_DESPIECE_DET_COMPONENTE DET'
      
        'JOIN PRO_DESPIECE_CAB CAB ON (CAB.ID_DESPIECE_CAB = DET.ID_DESPI' +
        'ECE_CAB)'
      
        'JOIN ART_ARTICULOS ART ON (ART.EMPRESA = CAB.EMPRESA AND ART.ART' +
        'ICULO = DET.COMPONENTE)'
      'LEFT JOIN PRO_FORMULAS F ON DET.FORMULA = F.ID_FORMULA'
      'WHERE'
      'ID_DESPIECE_CAB = :ID_DESPIECE_CAB'
      'ORDER BY ID_DESPIECE_CAB, ID_DESPIECE_DET')
    UniDirectional = False
    DataSource = DSDespieceCab
    AfterOpen = xDespieceComAfterOpen
    BeforeClose = xDespieceComBeforeClose
    Left = 40
    Top = 104
  end
  object xDespieceTar: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT T.*, S.TITULO TITULO_TAREA, R.TITULO TITULO_RECURSO, F.NO' +
        'MBRE TITULO_FORMULA'
      'FROM PRO_DESPIECE_DET_TAREA T'
      'LEFT JOIN PRO_SYS_TAREAS S ON T.TIPO_TAREA = S.TAREA'
      'LEFT JOIN PRO_RECURSOS R ON T.RECURSO = R.RECURSO'
      'LEFT JOIN PRO_FORMULAS F ON T.FORMULA = F.ID_FORMULA'
      'WHERE'
      'T.ID_DESPIECE_CAB = :ID_DESPIECE_CAB AND'
      'S.EMPRESA = :EMPRESA AND'
      'R.EMPRESA = :EMPRESA'
      'ORDER BY T.ID_DESPIECE_CAB, T.ID_DESPIECE_TAREA')
    UniDirectional = False
    DataSource = DSDespieceCab
    Left = 40
    Top = 152
  end
  object xImagenModelo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select imagen from z_sys_modelos'
      'where codigo=?modelo')
    UniDirectional = False
    Left = 40
    Top = 200
  end
  object xImagenComponente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select imagen from web_imagenes_articulos'
      'where id_a=?id_a')
    UniDirectional = False
    Left = 40
    Top = 248
  end
  object xEscandallo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from pro_ver_escandallo'
      'where empresa=?empresa and escandallo=?escandallo')
    UniDirectional = False
    DataSource = DSDespieceCab
    Left = 40
    Top = 296
  end
  object DSxDescEscandallo: TDataSource
    DataSet = xEscandallo
    Left = 152
    Top = 296
  end
  object xComponente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_ARTICULOS_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ARTICULO = :COMPONENTE')
    UniDirectional = False
    DataSource = DSDespieceCom
    Left = 40
    Top = 344
  end
  object DSxComponente: TDataSource
    DataSet = xComponente
    Left = 152
    Top = 344
  end
  object frxDespiece: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 43976.4509977315
    ReportOptions.LastChange = 43976.4509977315
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxDespieceBeforePrint
    OnGetValue = frxDespieceGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 336
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object DSCabDocumento: TDataSource
    DataSet = QMCabDocumento
    Left = 152
    Top = 392
  end
  object QMCabDocumento: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S'
      'WHERE'
      'ID_S = :ID_ORIGEN')
    UniDirectional = False
    DataSource = DSDespieceCab
    Left = 40
    Top = 392
  end
  object DSDetDocumento: TDataSource
    DataSet = QMDetDocumento
    Left = 152
    Top = 440
  end
  object QMDetDocumento: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM GES_DETALLES_S'
      'WHERE'
      'ID_DETALLES_S = :ID_DETALLE')
    UniDirectional = False
    DataSource = DSDespieceCab
    Left = 40
    Top = 440
  end
end
