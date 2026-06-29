object DMLstTrazabilidadLotes: TDMLstTrazabilidadLotes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 475
  Top = 287
  Height = 332
  Width = 414
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 224
    Top = 24
  end
  object xLotes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from art_articulos_lotes'
      'where empresa=?empresa and canal=?canal')
    UniDirectional = False
    Left = 32
    Top = 72
    object xLotesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xLotesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xLotesALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xLotesARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xLotesLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object xLotesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xLotesCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificacion'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object xLotesF_ENVASADO: TDateTimeField
      DisplayLabel = 'Fec. Envas.'
      FieldName = 'F_ENVASADO'
    end
    object xLotesF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caduc.'
      FieldName = 'F_CADUCIDAD'
    end
    object xLotesF_FABRICACION: TDateTimeField
      DisplayLabel = 'Fec. Fab.'
      FieldName = 'F_FABRICACION'
    end
    object xLotesID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xLotesAUTO_REETIQUETADO: TIntegerField
      DisplayLabel = 'Auto Reetiq.'
      FieldName = 'AUTO_REETIQUETADO'
    end
    object xLotesCODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
    end
    object xLotesPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xLotesID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
  end
  object DSxLotes: TDataSource
    DataSet = xLotes
    Left = 128
    Top = 72
  end
  object DSxLoteFiltrado: TDataSource
    DataSet = xLoteFiltrado
    Left = 128
    Top = 120
  end
  object frLotes: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frLotesGetValue
    OnBeforePrint = frLotesEnterRect
    OnEnterRect = frLotesEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 32
    Top = 24
    ReportForm = {19000000}
  end
  object DSxListado: TDataSource
    DataSet = xListado
    Left = 128
    Top = 168
  end
  object frDBxListado: TfrDBDataSet
    DataSource = DSxListado
    Left = 224
    Top = 168
  end
  object xLoteFiltrado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from art_articulos_lotes'
      'where id_lote=?id_lote'
      '')
    UniDirectional = False
    Left = 32
    Top = 120
    object xLoteFiltradoLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object xLoteFiltradoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xLoteFiltradoID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object xLoteFiltradoALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
  end
  object xListado: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from TMP_TRAZABILIDAD_LOTES'
      'where'
      'entrada=?entrada'
      'order by NIVEL, ORDEN, ID_LOTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TLocal
    Left = 32
    Top = 168
  end
  object frxLotes: TfrxHYReport
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
    OnBeforePrint = frxLotesBeforePrint
    OnGetValue = frxLotesGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 128
    Top = 24
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 224
    Top = 72
  end
  object DSxTransformacion: TDataSource
    DataSet = xTransformacion
    Left = 128
    Top = 224
  end
  object xTransformacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from TMP_PRO_LST_LOTE_TRAZABILIDAD'
      'where'
      'entrada=?entrada'
      'order by nivel, ID_LOTE_ORIGEN, fecha'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TLocal
    Left = 32
    Top = 224
  end
  object frDBxTransformacion: TfrDBDataSet
    DataSource = DSxTransformacion
    Left = 224
    Top = 224
  end
end
