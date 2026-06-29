object DMLstPedPdte: TDMLstPedPdte
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 462
  Top = 262
  Height = 547
  Width = 460
  object DSListado: TDataSource
    DataSet = QMListado
    Left = 128
    Top = 64
  end
  object QMListado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 100
    SelectSQL.Strings = (
      'select * from lst_pedidos_pdte_servir(?EMPRESA,?EJERCICIO,'
      ' ?CANAL,?SERIE,?TIPO_FILTRO,?FECHAD,?FECHAH,'
      ' ?FAMILIAD,?FAMILIAH,?CLIENTED,?CLIENTEH,'
      ' ?ARTICULOD,?ARTICULOH,?SERVIDO,?AGENTED,?AGENTEH)'
      'order by v_codcliente,v_rigpec, v_articulo')
    UniDirectional = True
    Left = 48
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 392
    Top = 16
  end
  object frPedPdte: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de pedidos'
    RebuildPrinter = False
    OnGetValue = frPedPdteGetValue
    OnBeforePrint = frPedPdteBeforePrint
    OnEnterRect = frPedPdteBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 48
    Top = 16
    ReportForm = {19000000}
  end
  object FrDBPedPdte: TfrDBDataSet
    DataSource = DSListado
    Left = 208
    Top = 64
  end
  object QGeneral: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 296
    Top = 16
  end
  object xArticuloD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    Left = 48
    Top = 304
    object xArticuloDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xArticuloH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    Left = 48
    Top = 352
    object xArticuloHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSArticuloD: TDataSource
    DataSet = xArticuloD
    Left = 128
    Top = 304
  end
  object DSArticuloH: TDataSource
    DataSet = xArticuloH
    Left = 128
    Top = 352
  end
  object xAgenteD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT TER.NOMBRE_R_SOCIAL as TITULO FROM EMP_AGENTES AG LEFT JO' +
        'IN SYS_TERCEROS TER ON (AG.TERCERO=TER.TERCERO)'
      'WHERE EMPRESA=?EMPRESA AND AGENTE=?AGENTE')
    UniDirectional = False
    Left = 48
    Top = 112
    object xAgenteDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xAgenteH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT TER.NOMBRE_R_SOCIAL as TITULO FROM EMP_AGENTES AG LEFT JO' +
        'IN SYS_TERCEROS TER ON (AG.TERCERO=TER.TERCERO)'
      'WHERE EMPRESA=?EMPRESA AND AGENTE=?AGENTE')
    UniDirectional = False
    Left = 48
    Top = 160
    object xAgenteHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSAgenteD: TDataSource
    DataSet = xAgenteD
    Left = 128
    Top = 112
  end
  object DSAgenteH: TDataSource
    DataSet = xAgenteH
    Left = 128
    Top = 160
  end
  object xFamiliaH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_FAMILIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  FAMILIA=?FAMILIA ')
    SelectSQL.Strings = (
      'SELECT FAMILIA,TITULO TITULO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND FAMILIA=?FAMILIA')
    UniDirectional = False
    Left = 48
    Top = 256
    object xFamiliaHFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xFamiliaHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxFamiliaH: TDataSource
    DataSet = xFamiliaH
    Left = 128
    Top = 256
  end
  object DSxFamiliaD: TDataSource
    DataSet = xFamiliaD
    Left = 128
    Top = 208
  end
  object xFamiliaD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_FAMILIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  FAMILIA=?FAMILIA ')
    SelectSQL.Strings = (
      'SELECT FAMILIA,TITULO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND FAMILIA=?FAMILIA')
    UniDirectional = False
    Left = 48
    Top = 208
    object xFamiliaDFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xFamiliaDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object frxPedPdte: TfrxHYReport
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
    OnBeforePrint = frxPedPdteBeforePrint
    OnGetValue = frxPedPdteGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 128
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
