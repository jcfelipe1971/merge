object DMLstFactura_Prov: TDMLstFactura_Prov
  OldCreateOrder = False
  OnCreate = DMLstFactura_ProvCreate
  OnDestroy = DMLstFactura_ProvDestroy
  Left = 873
  Top = 218
  Height = 364
  Width = 390
  object frFactura: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Fac. Proveedor entre Fechas'
    RebuildPrinter = False
    OnGetValue = frFacturaGetValue
    OnBeforePrint = frFacturaEnterRect
    OnEnterRect = frFacturaEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 312
    Top = 56
    ReportForm = {19000000}
  end
  object frDBCabecera: TfrDBDataSet
    DataSource = DSCabecera
    OpenDataSource = False
    Left = 216
    Top = 8
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_FACTURA_PROV_LST'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'SERIE=?SERIE AND'
      'FECHA>=?DESDE AND'
      'FECHA<=?HASTA'
      'ORDER BY RIG')
    UniDirectional = False
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    Left = 24
    Top = 8
  end
  object DSCabecera: TDataSource
    DataSet = QMCabecera
    Left = 112
    Top = 8
  end
  object xProveedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_PROVEEDORES'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND '
      'PROVEEDOR=?PROVEEDOR')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 24
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 312
    Top = 8
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, SIGNO_MONEDA FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 24
    Top = 200
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 112
    Top = 200
  end
  object xEstados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      '  ESTADO,TITULO'
      'FROM SYS_GES_ESTADOS                '
      'WHERE'
      '  ESTADO=?ESTADO ')
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_GES_ESTADOS'
      'WHERE '
      'ESTADO=?ESTADO')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 24
    Top = 152
    object xEstadosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxEstado: TDataSource
    DataSet = xEstados
    Left = 112
    Top = 152
  end
  object xProyectos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM EMP_PROYECTOS'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'PROYECTO=?PROYECTO')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 24
    Top = 104
  end
  object DSxProyectos: TDataSource
    DataSet = xProyectos
    Left = 112
    Top = 104
  end
  object frxFactura: TfrxHYReport
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
    OnBeforePrint = frxFacturaBeforePrint
    OnGetValue = frxFacturaGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 312
    Top = 104
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
