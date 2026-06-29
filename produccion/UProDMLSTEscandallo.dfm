object ProDMLSTEscandallo: TProDMLSTEscandallo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 430
  Top = 122
  Height = 497
  Width = 562
  object frListadoE: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Escandallo'
    RebuildPrinter = False
    OnGetValue = frListadoEGetValue
    OnBeforePrint = frListadoEEnterRect
    OnEnterRect = frListadoEEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 264
    Top = 112
    ReportForm = {19000000}
  end
  object frDBListadoE: TfrDBDataSet
    DataSource = DSLstEscandallo
    Left = 264
    Top = 160
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 496
    Top = 8
  end
  object xEscandallo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT COMPUESTO,DESCRIPCION,UNIDADES '
      'FROM PRO_ESCANDALLO'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'ESCANDALLO=?ESCANDALLO AND '
      'TIPO=?TIPO')
    UniDirectional = False
    Left = 40
    Top = 16
    object xEscandalloCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object xEscandalloDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object xEscandalloUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
  end
  object DSEscandallo: TDataSource
    DataSet = xEscandallo
    Left = 128
    Top = 16
  end
  object DSFaseD: TDataSource
    DataSet = xFaseD
    Left = 128
    Top = 64
  end
  object DSFaseH: TDataSource
    DataSet = xFaseH
    Left = 128
    Top = 112
  end
  object xFaseD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select fase from pro_fases_esc'
      'where '
      'empresa=?empresa and '
      'escandallo=?escandallo and '
      'linea_fase=?lineafase and '
      'tipo=?tipo')
    UniDirectional = False
    Left = 40
    Top = 64
    object xFaseDFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 60
    end
  end
  object xFaseH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select fase from pro_fases_esc'
      'where '
      'empresa=?empresa and '
      'escandallo=?escandallo and '
      'linea_fase=?lineafase and '
      'tipo=?tipo')
    UniDirectional = False
    Left = 40
    Top = 112
    object xFaseHFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 60
    end
  end
  object QMLstFase: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_FASES_ESC'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ESCANDALLO = :ESCANDALLO AND'
      'LINEA_FASE >= :FASED AND'
      'LINEA_FASE <= :FASEH AND'
      'TIPO = :TIPO'
      'ORDER BY ORDEN, LINEA_FASE')
    UniDirectional = False
    DataSource = DSLstEscandallo
    Left = 40
    Top = 208
  end
  object DSLstFase: TDataSource
    DataSet = QMLstFase
    Left = 128
    Top = 208
  end
  object DSLstMateriales: TDataSource
    DataSet = QMLstMateriales
    Left = 128
    Top = 256
  end
  object DSLstTareas: TDataSource
    DataSet = QMLstTareas
    Left = 128
    Top = 304
  end
  object QMLstMateriales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 256
    SelectSQL.Strings = (
      
        'SELECT MAT.*, ART.TITULO_LARGO AS TITULO_ART, ALM.TITULO AS TITU' +
        'LO_ALM_SAL'
      'FROM PRO_MAT_ESC MAT'
      
        'JOIN ART_ARTICULOS ART ON MAT.EMPRESA = ART.EMPRESA AND MAT.COMP' +
        'ONENTE = ART.ARTICULO'
      
        'JOIN ART_ALMACENES ALM ON MAT.EMPRESA = ALM.EMPRESA AND MAT.ALMA' +
        'CEN_SAL = ALM.ALMACEN'
      'WHERE'
      'MAT.EMPRESA = :EMPRESA AND'
      'MAT.ESCANDALLO = :ESCANDALLO AND'
      'MAT.LINEA_FASE = :LINEA_FASE AND'
      'MAT.TIPO = :TIPO'
      'ORDER BY MAT.ORDEN')
    UniDirectional = False
    DataSource = DSLstFase
    AfterClose = QMLstMaterialesAfterClose
    Left = 40
    Top = 256
  end
  object QMLstTareas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT TAR.*, REC.TITULO TITULO_RECURSO, UTI.DESCRIPCION TITULO_' +
        'UTILLAJE'
      'FROM PRO_TAREA_ESC TAR'
      
        'LEFT JOIN PRO_RECURSOS REC ON TAR.EMPRESA = REC.EMPRESA AND TAR.' +
        'RECURSO = REC.RECURSO'
      
        'LEFT JOIN PRO_SYS_UTILLAJES UTI ON TAR.EMPRESA = UTI.EMPRESA AND' +
        ' TAR.ID_UTILLAJES = UTI.CODIGO'
      'WHERE'
      'TAR.EMPRESA = :EMPRESA AND'
      'TAR.ESCANDALLO = :ESCANDALLO AND'
      'TAR.LINEA_FASE = :LINEA_FASE AND'
      'TAR.TIPO = :TIPO'
      'ORDER BY TAR.ORDEN')
    UniDirectional = False
    DataSource = DSLstFase
    Left = 40
    Top = 304
  end
  object QMLstEscandallo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_VER_ESCANDALLO'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ESCANDALLO = :ESCANDALLO AND'
      'TIPO = :TIPO')
    UniDirectional = False
    Left = 40
    Top = 160
  end
  object DSLstEscandallo: TDataSource
    DataSet = QMLstEscandallo
    Left = 128
    Top = 160
  end
  object frDBListadoFase: TfrDBDataSet
    DataSource = DSLstFase
    Left = 264
    Top = 208
  end
  object frDBListadoMate: TfrDBDataSet
    DataSource = DSLstMateriales
    Left = 264
    Top = 256
  end
  object frDBListadoTareas: TfrDBDataSet
    DataSource = DSLstTareas
    Left = 264
    Top = 304
  end
  object xMinMaxFase: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT MIN(LINEA_FASE), MAX(LINEA_FASE)'
      'FROM PRO_FASES_ESC'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ESCANDALLO = :ESCANDALLO AND'
      'TIPO = :TIPO')
    UniDirectional = False
    DataSource = DSEscandallo
    Left = 416
    Top = 160
    object xMinMaxFaseMIN: TIntegerField
      DisplayLabel = 'Min.'
      FieldName = 'MIN'
    end
    object xMinMaxFaseMAX: TIntegerField
      DisplayLabel = 'Max.'
      FieldName = 'MAX'
    end
  end
  object xDibEsc: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select first(1) id_imagen from pro_dib_esc'
      'where empresa=?empresa and escandallo=?escandallo and tipo=?tipo')
    UniDirectional = False
    Left = 416
    Top = 112
  end
  object frxListadoE: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 44498.591401412
    ReportOptions.LastChange = 44498.591401412
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxListadoEBeforePrint
    OnGetValue = frxListadoEGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 336
    Top = 112
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object DSComponente: TDataSource
    DataSet = QMComponente
    Left = 128
    Top = 352
  end
  object QMComponente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'ARTICULO=?COMPONENTE')
    UniDirectional = False
    DataSource = DSLstMateriales
    Left = 40
    Top = 352
  end
end
