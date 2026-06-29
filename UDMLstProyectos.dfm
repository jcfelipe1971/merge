object DMLstProyectos: TDMLstProyectos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 664
  Top = 272
  Height = 373
  Width = 853
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 256
    Top = 16
  end
  object frProyectos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frProyectosGetValue
    OnBeforePrint = frProyectosEnterRect
    OnEnterRect = frProyectosEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 48
    Top = 16
    ReportForm = {19000000}
  end
  object frxProyectos: TfrxHYReport
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
    OnBeforePrint = frxProyectosBeforePrint
    OnGetValue = frxProyectosGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 152
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 360
    Top = 16
  end
  object frDBProyectos: TfrDBDataSet
    DataSource = DSxLstProyectos
    Left = 256
    Top = 64
  end
  object xLstProyectos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMP_PROYECTOS'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'PROYECTO >= ?DESDE_PROYECTO AND'
      'PROYECTO <= ?HASTA_PROYECTO'
      'ORDER BY PROYECTO')
    UniDirectional = False
    AfterOpen = xLstProyectosAfterOpen
    BeforeClose = xLstProyectosBeforeClose
    Left = 48
    Top = 64
  end
  object DSxLstProyectos: TDataSource
    DataSet = xLstProyectos
    Left = 152
    Top = 64
  end
  object frDBProyectosCompras: TfrDBDataSet
    DataSource = DSxProyectoCompras
    Left = 256
    Top = 112
  end
  object frDBDProyectosVentas: TfrDBDataSet
    DataSource = DSxProyectoVentas
    Left = 256
    Top = 160
  end
  object frDBProyectosOtros: TfrDBDataSet
    DataSource = DSxProyectoOtros
    Left = 256
    Top = 208
  end
  object xProyectoCompras: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT P.*, C.FECHA, C.SU_REFERENCIA, C.ESTADO, D.*'
      'FROM EMP_PROYECTOS_COMPRAS P'
      'JOIN GES_CABECERAS_E C ON P.ID_E = C.ID_E'
      'JOIN GES_DETALLES_E D ON P.ID_DETALLES_E = D.ID_DETALLES_E'
      'WHERE'
      'P.EMPRESA = :EMPRESA AND'
      'P.PROYECTO = :PROYECTO AND'
      'C.FECHA >= :DESDE_FECHA AND'
      'C.FECHA <= :HASTA_FECHA'
      
        'ORDER BY C.EJERCICIO, EXTRACT(YEARDAY FROM C.FECHA), C.SERIE, C.' +
        'TIPO, C.RIG, D.LINEA')
    UniDirectional = False
    DataSource = DSxLstProyectos
    Left = 48
    Top = 112
  end
  object DSxProyectoCompras: TDataSource
    DataSet = xProyectoCompras
    Left = 152
    Top = 112
  end
  object xProyectoVentas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT P.*, C.FECHA, C.CLIENTE, C.SU_REFERENCIA, C.PEDIDO_CLIENTE' +
        ', C.Z_OBSERVACION, C.ESTADO, R.O_TIPO, D.*'
      'FROM EMP_PROYECTOS_VENTAS P'
      'JOIN GES_CABECERAS_S C ON P.ID_S = C.ID_S'
      'JOIN GES_DETALLES_S D ON P.ID_DETALLES_S = D.ID_DETALLES_S'
      'LEFT JOIN GES_CABECERAS_RELACIONES R ON C.ID_S = R.D_ID_S'
      'WHERE'
      'P.EMPRESA = :EMPRESA AND'
      'P.PROYECTO = :PROYECTO AND'
      'C.FECHA >= :DESDE_FECHA AND'
      'C.FECHA <= :HASTA_FECHA'
      
        'ORDER BY C.EJERCICIO, EXTRACT(YEARDAY FROM C.FECHA), C.SERIE, C.' +
        'TIPO, C.RIG, D.LINEA')
    UniDirectional = False
    DataSource = DSxLstProyectos
    Left = 48
    Top = 160
  end
  object DSxProyectoVentas: TDataSource
    DataSet = xProyectoVentas
    Left = 152
    Top = 160
  end
  object xProyectoOtros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM EMP_PROYECTOS_OTROS'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'PROYECTO = ?PROYECTO AND'
      'USUARIO >= ?DESDE_USUARIO AND'
      'USUARIO <= ?HASTA_USUARIO AND'
      'FECHA >= ?DESDE_FECHA AND'
      'FECHA <= ?HASTA_FECHA'
      'ORDER BY FECHA')
    UniDirectional = False
    DataSource = DSxLstProyectos
    Left = 48
    Top = 208
  end
  object DSxProyectoOtros: TDataSource
    DataSet = xProyectoOtros
    Left = 152
    Top = 208
  end
  object frDBProyectoOfertas: TfrDBDataSet
    DataSource = DSxProyectoOfertas
    Left = 568
    Top = 64
  end
  object xProyectoOfertas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      '*'
      'FROM VER_CABECERAS_OFERTA_C'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'PROYECTO = ?PROYECTO AND'
      'FECHA >= ?DESDE_FECHA AND'
      'FECHA <= ?HASTA_FECHA AND'
      'CLIENTE >= ?DESDE_CLIENTE AND'
      'CLIENTE <= ?HASTA_CLIENTE'
      'ORDER BY EJERCICIO, CANAL, SERIE, RIG')
    UniDirectional = False
    DataSource = DSxLstProyectos
    Left = 360
    Top = 64
  end
  object DSxProyectoOfertas: TDataSource
    DataSet = xProyectoOfertas
    Left = 464
    Top = 64
  end
  object xCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES_EF'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'CLIENTE = ?CLIENTE_NULL')
    UniDirectional = False
    DataSource = DSxLstProyectos
    Left = 360
    Top = 112
  end
  object DSxCliente: TDataSource
    DataSet = xCliente
    Left = 464
    Top = 112
  end
  object xTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_EDICION'
      'WHERE'
      'TERCERO = :TERCERO_NULL')
    UniDirectional = False
    DataSource = DSxLstProyectos
    Left = 360
    Top = 160
  end
  object DSxTercero: TDataSource
    DataSet = xTercero
    Left = 464
    Top = 160
  end
  object frDBProyectoEmpleados: TfrDBDataSet
    DataSource = DSxProyectoEmpleados
    Left = 256
    Top = 256
  end
  object xProyectoEmpleados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM EMP_PROYECTOS_EMPLEADOS'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'PROYECTO = ?PROYECTO AND'
      'FECHA >= ?DESDE_FECHA AND'
      'FECHA <= ?HASTA_FECHA'
      'ORDER BY FECHA, EMPLEADO')
    UniDirectional = False
    DataSource = DSxLstProyectos
    Left = 48
    Top = 256
  end
  object DSxProyectoEmpleados: TDataSource
    DataSet = xProyectoEmpleados
    Left = 152
    Top = 256
  end
end
