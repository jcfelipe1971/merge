object DMLstRestricciones: TDMLstRestricciones
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 752
  Top = 196
  Height = 396
  Width = 362
  object RMDCategorias: TRxMemoryData
    Capacity = 30
    FieldDefs = <
      item
        Name = 'CATEGORIA'
        DataType = ftString
        Size = 40
      end>
    AfterScroll = RMDCategoriasAfterScroll
    Left = 45
    Top = 179
    object RMDCategoriasCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      Size = 40
    end
  end
  object RMDRestricciones: TRxMemoryData
    Capacity = 1000
    FieldDefs = <
      item
        Name = 'CATEGORIA'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TITULO'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'COLOR'
        DataType = ftSmallint
      end>
    Left = 45
    Top = 243
    object RMDRestriccionesCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      Size = 40
    end
    object RMDRestriccionesTITULO: TStringField
      FieldName = 'TITULO'
      Size = 60
    end
    object RMDRestriccionesCOLOR: TSmallintField
      FieldName = 'COLOR'
    end
  end
  object DSLRPerfil: TDataSource
    DataSet = LRPerfil
    Left = 157
    Top = 115
  end
  object DSRMDCategorias: TDataSource
    DataSet = RMDCategorias
    Left = 157
    Top = 187
  end
  object DSRMDRestricciones: TDataSource
    DataSet = RMDRestricciones
    Left = 157
    Top = 243
  end
  object LRPerfil: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_USUARIOS_PERFIL'
      'WHERE'
      '  PERFIL=?old_PERFIL ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_USUARIOS_PERFIL'
      
        '  (PROTECCION,AGENTE,TACTIL,CONTABILIDAD_ANALITICA,SUPERIOR,PERF' +
        'IL_DE_AGENTE,PERFIL,TITULO)'
      'VALUES'
      
        '  (?PROTECCION,?AGENTE,?TACTIL,?CONTABILIDAD_ANALITICA,?SUPERIOR' +
        ',?PERFIL_DE_AGENTE,?PERFIL,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_USUARIOS_PERFIL'
      'WHERE'
      '  PERFIL=?PERFIL ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_USUARIOS_PERFIL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_USUARIOS_PERFIL'
      'SET'
      '  PROTECCION=?PROTECCION '
      '  ,AGENTE=?AGENTE '
      '  ,TACTIL=?TACTIL '
      '  ,CONTABILIDAD_ANALITICA=?CONTABILIDAD_ANALITICA '
      '  ,SUPERIOR=?SUPERIOR '
      '  ,PERFIL_DE_AGENTE=?PERFIL_DE_AGENTE '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  PERFIL=?PERFIL ')
    AfterScroll = LRPerfilAfterScroll
    ClavesPrimarias.Strings = (
      'PERFIL ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_USUARIOS_PERFIL'
    UpdateTransaction = TLocal
    Left = 45
    Top = 115
    object LRPerfilPERFIL: TIntegerField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
    end
    object LRPerfilTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 35
    end
    object LRPerfilPROTECCION: TBlobField
      DisplayLabel = 'Proteccion'
      FieldName = 'PROTECCION'
      Size = 8
    end
    object LRPerfilPERFIL_DE_AGENTE: TIntegerField
      DisplayLabel = 'Perfil Agente'
      FieldName = 'PERFIL_DE_AGENTE'
    end
    object LRPerfilAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object LRPerfilSUPERIOR: TIntegerField
      DisplayLabel = 'Superior'
      FieldName = 'SUPERIOR'
    end
    object LRPerfilCONTABILIDAD_ANALITICA: TIntegerField
      DisplayLabel = 'Contb. Analitica'
      FieldName = 'CONTABILIDAD_ANALITICA'
    end
    object LRPerfilTACTIL: TIntegerField
      DisplayLabel = 'Tactil'
      FieldName = 'TACTIL'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 45
    Top = 36
  end
  object FRRestricciones: TfrDBDataSet
    DataSource = DSRMDRestricciones
    Left = 269
    Top = 248
  end
  object FrRestriciones: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 161
    Top = 37
    ReportForm = {19000000}
  end
  object frRMDCategorias: TfrDBDataSet
    DataSource = DSRMDCategorias
    Left = 269
    Top = 184
  end
  object frLRPerfil: TfrDBDataSet
    DataSource = DSLRPerfil
    Left = 269
    Top = 112
  end
  object frxRestriciones: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 40086.7788463889
    ReportOptions.LastChange = 40086.7788463889
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
    Left = 264
    Top = 40
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
