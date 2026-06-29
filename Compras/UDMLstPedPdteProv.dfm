object DMLSTPedPdteProv: TDMLSTPedPdteProv
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 447
  Top = 221
  Height = 419
  Width = 444
  object xProveedorD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT TER.NOMBRE_R_SOCIAL as TITULO FROM EMP_PROVEEDORES PROV L' +
        'EFT JOIN SYS_TERCEROS TER ON (PROV.TERCERO=TER.TERCERO)'
      'WHERE PROV.EMPRESA=?EMPRESA AND PROV.PROVEEDOR=?PROVEEDOR')
    UniDirectional = False
    Left = 288
    Top = 83
  end
  object DSProveedorD: TDataSource
    DataSet = xProveedorD
    Left = 364
    Top = 83
  end
  object DSListado: TDataSource
    DataSet = QMListado
    Left = 92
    Top = 82
  end
  object QMListado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from lst_pedidos_pdte_recibir(?EMPRESA,?EJERCICIO,'
      ' ?CANAL,?SERIE,?TIPO_FILTRO,?FECHAD,?FECHAH,'
      ' ?FAMILIAD,?FAMILIAH,?PROVEEDORD,?PROVEEDORH,'
      ' ?ARTICULOD,?ARTICULOH,?RECIBIDO)')
    UniDirectional = False
    Left = 28
    Top = 82
  end
  object xProveedorH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT TER.NOMBRE_R_SOCIAL as TITULO FROM EMP_PROVEEDORES PROV L' +
        'EFT JOIN SYS_TERCEROS TER ON (PROV.TERCERO=TER.TERCERO)'
      'WHERE PROV.EMPRESA=?EMPRESA AND PROV.PROVEEDOR=?PROVEEDOR')
    UniDirectional = False
    Left = 288
    Top = 143
    object xProveedorHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSProveedorH: TDataSource
    DataSet = xProveedorH
    Left = 364
    Top = 143
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 198
    Top = 22
  end
  object frPedPdteProv: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de pedidos de proveedores'
    RebuildPrinter = False
    OnGetValue = frPedPdteProvGetValue
    OnBeforePrint = frPedPdteProvBeforePrint
    OnEnterRect = frPedPdteProvBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 28
    Top = 22
    ReportForm = {19000000}
  end
  object FrDBPedPdteProv: TfrDBDataSet
    DataSource = DSListado
    Left = 172
    Top = 82
  end
  object QGeneral: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 50
    Top = 162
  end
  object xArticuloD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO_LARGO AS TITULO FROM ART_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    Left = 292
    Top = 219
    object xArticuloDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object xArticuloH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO_LARGO AS TITULO FROM ART_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    Left = 292
    Top = 279
    object xArticuloHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object DSArticuloD: TDataSource
    DataSet = xArticuloD
    Left = 368
    Top = 215
  end
  object DSArticuloH: TDataSource
    DataSet = xArticuloH
    Left = 368
    Top = 275
  end
  object QMultiSerie: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'insert into tmp_multiserie '
      
        ' select es.empresa,es.ejercicio,es.canal,es.serie,gs.titulo,0,?e' +
        'ntrada'
      'from emp_series es join gen_series gs'
      'on((es.empresa=gs.empresa)and(es.serie=gs.serie))'
      
        'where (es.empresa=:empresa and es.ejercicio=:ejercicio and es.ca' +
        'nal=:canal);')
    Transaction = TLocal
    AutoTrans = True
    Left = 50
    Top = 246
  end
  object frxPedPdteProv: TfrxHYReport
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
    OnBeforePrint = frxPedPdteProvBeforePrint
    OnGetValue = frxPedPdteProvGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 114
    Top = 22
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
    Left = 278
    Top = 22
  end
end
