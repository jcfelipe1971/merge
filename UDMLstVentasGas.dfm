object DMLstVentasGas: TDMLstVentasGas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 967
  Top = 286
  Height = 659
  Width = 615
  object xVentasGas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM GES_GAS_CAB_VENTA'
      '  WHERE ID_VENTA=?ID_VENTA')
    UniDirectional = False
    Left = 36
    Top = 74
    object xVentasGasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVentasGasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVentasGasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVentasGasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xVentasGasRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xVentasGasID_VENTA: TIntegerField
      DisplayLabel = 'ID Venta'
      FieldName = 'ID_VENTA'
    end
    object xVentasGasFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fec. Ini.'
      FieldName = 'FECHA_INICIO'
    end
    object xVentasGasFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object xVentasGasACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object xVentasGasTURNO: TFIBStringField
      DisplayLabel = 'Turno'
      FieldName = 'TURNO'
      Size = 3
    end
    object xVentasGasDIF_TANQUES_DISPENSADORES: TFloatField
      DisplayLabel = 'Dif. Tanques Disp.'
      FieldName = 'DIF_TANQUES_DISPENSADORES'
    end
    object xVentasGasDIF_COB_TANQUE: TFloatField
      DisplayLabel = 'Dif. Cobr. Tanque'
      FieldName = 'DIF_COB_TANQUE'
    end
    object xVentasGasNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xVentasGasESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xVentasGasID_VENTA_O: TIntegerField
      DisplayLabel = 'ID Venta Ori.'
      FieldName = 'ID_VENTA_O'
    end
    object xVentasGasID_VENTA_D: TIntegerField
      DisplayLabel = 'ID Venta Dest.'
      FieldName = 'ID_VENTA_D'
    end
    object xVentasGasTOT_INI_TANQUE: TFloatField
      DisplayLabel = 'Tot Ini. Tanque'
      FieldName = 'TOT_INI_TANQUE'
    end
    object xVentasGasTOT_FIN_TANQUE: TFloatField
      DisplayLabel = 'Tot Fin Tanque'
      FieldName = 'TOT_FIN_TANQUE'
    end
    object xVentasGasTOT_INI_DISP: TFloatField
      DisplayLabel = 'Tot Ini. Disp.'
      FieldName = 'TOT_INI_DISP'
    end
    object xVentasGasTOT_FIN_DISP: TFloatField
      DisplayLabel = 'Tot Fin Disp.'
      FieldName = 'TOT_FIN_DISP'
    end
    object xVentasGasTOTAL_COBRADO: TFloatField
      DisplayLabel = 'Total Cobrado'
      FieldName = 'TOTAL_COBRADO'
    end
    object xVentasGasTOT_DIF_TANQUE: TFloatField
      DisplayLabel = 'Total Dif. Tanque'
      FieldName = 'TOT_DIF_TANQUE'
    end
    object xVentasGasTOT_DIF_DISP: TFloatField
      DisplayLabel = 'Total Dif. Disp.'
      FieldName = 'TOT_DIF_DISP'
    end
    object xVentasGasIMPORTE_DIF_TANQUE: TFloatField
      DisplayLabel = 'Imp. Dif. Tanque'
      FieldName = 'IMPORTE_DIF_TANQUE'
    end
    object xVentasGasIMPORTE_DIF_DISP: TFloatField
      DisplayLabel = 'Imp. Dif. Disp.'
      FieldName = 'IMPORTE_DIF_DISP'
    end
    object xVentasGasENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xVentasGasARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xVentasGasPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xVentasGasORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xVentasGasDIF_IMPORTE_TANQ_DISP: TFloatField
      DisplayLabel = 'Dif. Importe'
      FieldName = 'DIF_IMPORTE_TANQ_DISP'
    end
  end
  object DSxVentasGas: TDataSource
    DataSet = xVentasGas
    Left = 116
    Top = 67
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
    Left = 116
    Top = 16
  end
  object QGen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 305
    Top = 26
  end
  object frxVentasGas: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.971597338
    ReportOptions.LastChange = 38691.971597338
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxVentasGasBeforePrint
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 416
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDBxVentasGas: TfrxDBDataset
    UserName = 'frxDBxVentasGas'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = DSxVentasGas
    Left = 504
    Top = 16
  end
  object frVentasGas: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frVentasGasGetValue
    OnBeforePrint = frVentasGasEnterRect
    OnEnterRect = frVentasGasEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 35
    Top = 16
    ReportForm = {19000000}
  end
  object frDSQMVentasGas: TfrDBDataSet
    DataSource = DSxVentasGas
    Left = 208
    Top = 65
  end
  object DSxTurnos: TDataSource
    DataSet = xTurnos
    Left = 146
    Top = 120
  end
  object xTurnos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT descripcion from pro_turnos where turno=?turno')
    UniDirectional = False
    Left = 52
    Top = 120
    object xTurnosDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object QMTanque: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_GAS_DET_TANQUE'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_GAS_DET_TANQUE'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,RIG,ID_VENTA,LINEA,COD_TANQUE,P' +
        'OR_INICIAL,POR_FINAL,CAP_INICIAL,CAP_FINAL,UNID_SALIDA,PRECIO,IM' +
        'PORTE_TOTAL,RIG_MOV)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG,?ID_VENTA,?LINEA,?COD_' +
        'TANQUE,?POR_INICIAL,?POR_FINAL,?CAP_INICIAL,?CAP_FINAL,?UNID_SAL' +
        'IDA,?PRECIO,?IMPORTE_TOTAL,?RIG_MOV)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_GAS_DET_TANQUE'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_GAS_DET_TANQUE'
      'Where (id_venta=?id_venta)'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_GAS_DET_TANQUE'
      'SET'
      '  ID_VENTA=?ID_VENTA '
      '  ,COD_TANQUE=?COD_TANQUE '
      '  ,POR_INICIAL=?POR_INICIAL '
      '  ,POR_FINAL=?POR_FINAL '
      '  ,CAP_INICIAL=?CAP_INICIAL '
      '  ,CAP_FINAL=?CAP_FINAL '
      '  ,UNID_SALIDA=?UNID_SALIDA '
      '  ,PRECIO=?PRECIO '
      '  ,IMPORTE_TOTAL=?IMPORTE_TOTAL '
      '  ,RIG_MOV=?RIG_MOV '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSxVentasGas
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_GAS_DET_TANQUE'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 298
    Top = 88
    object QMTanqueEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTanqueRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMTanqueID_VENTA: TIntegerField
      DisplayLabel = 'ID Venta'
      FieldName = 'ID_VENTA'
    end
    object QMTanqueLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMTanqueCOD_TANQUE: TIntegerField
      DisplayLabel = 'Cod. Tanque'
      FieldName = 'COD_TANQUE'
    end
    object QMTanquePOR_INICIAL: TFloatField
      DisplayLabel = '% Inicial'
      FieldName = 'POR_INICIAL'
    end
    object QMTanquePOR_FINAL: TFloatField
      DisplayLabel = '% Final'
      FieldName = 'POR_FINAL'
    end
    object QMTanqueCAP_INICIAL: TFloatField
      DisplayLabel = 'Cap. Inicial'
      FieldName = 'CAP_INICIAL'
    end
    object QMTanqueCAP_FINAL: TFloatField
      DisplayLabel = 'Cap. Final'
      FieldName = 'CAP_FINAL'
    end
    object QMTanqueUNID_SALIDA: TFloatField
      DisplayLabel = 'Unid. Salida'
      FieldName = 'UNID_SALIDA'
    end
    object QMTanquePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMTanqueDescTanque: TStringField
      DisplayLabel = 'Desc. Tanque'
      FieldKind = fkCalculated
      FieldName = 'DescTanque'
      Calculated = True
    end
    object QMTanqueCapacidad: TIntegerField
      DisplayLabel = 'Capacidad'
      FieldKind = fkCalculated
      FieldName = 'CAPACIDAD'
      Calculated = True
    end
    object QMTanqueIMPORTE_TOTAL: TFloatField
      DisplayLabel = 'Imp. Total'
      FieldName = 'IMPORTE_TOTAL'
    end
    object QMTanqueSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMTanqueEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMTanqueCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMTanqueRIG_MOV: TIntegerField
      DisplayLabel = 'RIG Mov.'
      FieldName = 'RIG_MOV'
    end
  end
  object DSQMTanque: TDataSource
    DataSet = QMTanque
    Left = 384
    Top = 80
  end
  object QMEmpleado: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_GAS_DET_EMPLEADO'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_GAS_DET_EMPLEADO'
      '  (EMPRESA,EJERCICIO,CANAL,SERIE,RIG,ID_VENTA,LINEA,EMPLEADO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG,?ID_VENTA,?LINEA,?EMPL' +
        'EADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_GAS_DET_EMPLEADO'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_GAS_DET_EMPLEADO'
      'Where (id_venta=?id_venta)'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_GAS_DET_EMPLEADO'
      'SET'
      '  ID_VENTA=?ID_VENTA '
      '  ,EMPLEADO=?EMPLEADO '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSxVentasGas
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_GAS_DET_EMPLEADO'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 298
    Top = 136
    object QMEmpleadoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEmpleadoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMEmpleadoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMEmpleadoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMEmpleadoRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMEmpleadoID_VENTA: TIntegerField
      DisplayLabel = 'ID Venta'
      FieldName = 'ID_VENTA'
    end
    object QMEmpleadoLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMEmpleadoEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object QMEmpleadoDescEmpleado: TStringField
      DisplayLabel = 'Descripcion'
      FieldKind = fkCalculated
      FieldName = 'DescEmpleado'
      Calculated = True
    end
  end
  object DSQMEmpleado: TDataSource
    DataSet = QMEmpleado
    Left = 384
    Top = 128
  end
  object QMDispensador: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_GAS_DET_DISPENSADOR'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_GAS_DET_DISPENSADOR'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,RIG,ID_VENTA,LINEA_EMPLEADO,LIN' +
        'EA,COD_DISPENSADOR,LECTURA_INICIAL,LECTURA_FINAL,UNID_DISPENSADA' +
        'S)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG,?ID_VENTA,?LINEA_EMPLE' +
        'ADO,?LINEA,?COD_DISPENSADOR,?LECTURA_INICIAL,?LECTURA_FINAL,?UNI' +
        'D_DISPENSADAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_GAS_DET_DISPENSADOR'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_GAS_DET_DISPENSADOR'
      'Where (id_venta=?id_venta and'
      '            linea_empleado=?linea)'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_GAS_DET_DISPENSADOR'
      'SET'
      '  ID_VENTA=?ID_VENTA '
      '  ,LINEA_EMPLEADO=?LINEA_EMPLEADO '
      '  ,COD_DISPENSADOR=?COD_DISPENSADOR '
      '  ,LECTURA_INICIAL=?LECTURA_INICIAL '
      '  ,LECTURA_FINAL=?LECTURA_FINAL '
      '  ,UNID_DISPENSADAS=?UNID_DISPENSADAS '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMEmpleado
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_GAS_DET_DISPENSADOR'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 298
    Top = 184
    object QMDispensadorEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDispensadorEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDispensadorCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDispensadorSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDispensadorRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDispensadorID_VENTA: TIntegerField
      DisplayLabel = 'ID Venta'
      FieldName = 'ID_VENTA'
    end
    object QMDispensadorLINEA_EMPLEADO: TIntegerField
      DisplayLabel = 'Linea Empleado'
      FieldName = 'LINEA_EMPLEADO'
    end
    object QMDispensadorLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDispensadorCOD_DISPENSADOR: TIntegerField
      DisplayLabel = 'Cod. Disp.'
      FieldName = 'COD_DISPENSADOR'
    end
    object QMDispensadorLECTURA_INICIAL: TFloatField
      DisplayLabel = 'Lectura Ini.'
      FieldName = 'LECTURA_INICIAL'
    end
    object QMDispensadorLECTURA_FINAL: TFloatField
      DisplayLabel = 'Lectura Fin.'
      FieldName = 'LECTURA_FINAL'
    end
    object QMDispensadorUNID_DISPENSADAS: TFloatField
      DisplayLabel = 'Uds. Dispensadas'
      FieldName = 'UNID_DISPENSADAS'
    end
    object QMDispensadorDescDispensador: TStringField
      DisplayLabel = 'Desc. Dispensador'
      FieldKind = fkCalculated
      FieldName = 'DescDispensador'
      Calculated = True
    end
    object QMDispensadorPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMDispensadorIMPORTE_TOTAL: TFloatField
      DisplayLabel = 'Importe Total'
      FieldName = 'IMPORTE_TOTAL'
    end
  end
  object DSQMDispensador: TDataSource
    DataSet = QMDispensador
    Left = 384
    Top = 184
  end
  object QMFPago: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_GAS_DET_FPAGO'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_GAS_DET_FPAGO'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,RIG,ID_VENTA,LINEA_EMPLEADO,LIN' +
        'EA,FORMA_PAGO,IMPORTE)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG,?ID_VENTA,?LINEA_EMPLE' +
        'ADO,?LINEA,?FORMA_PAGO,?IMPORTE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_GAS_DET_FPAGO'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_GAS_DET_FPAGO'
      'Where (id_venta=?id_venta and'
      '            linea_empleado=?linea)'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_GAS_DET_FPAGO'
      'SET'
      '  SERIE=?SERIE '
      '  ,ID_VENTA=?ID_VENTA '
      '  ,LINEA_EMPLEADO=?LINEA_EMPLEADO '
      '  ,FORMA_PAGO=?FORMA_PAGO '
      '  ,IMPORTE=?IMPORTE '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMEmpleado
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_GAS_DET_FPAGO'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 298
    Top = 232
    object QMFPagoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMFPagoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMFPagoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMFPagoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMFPagoRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMFPagoID_VENTA: TIntegerField
      DisplayLabel = 'ID Venta'
      FieldName = 'ID_VENTA'
    end
    object QMFPagoLINEA_EMPLEADO: TIntegerField
      DisplayLabel = 'Linea Empleado'
      FieldName = 'LINEA_EMPLEADO'
    end
    object QMFPagoLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMFPagoFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMFPagoIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMFPagoDescFPago: TStringField
      DisplayLabel = 'Desc. F. Pago'
      FieldKind = fkCalculated
      FieldName = 'DescFPago'
      Calculated = True
    end
  end
  object DSQMFPago: TDataSource
    DataSet = QMFPago
    Left = 384
    Top = 232
  end
  object QMMonedas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_GAS_DET_MONEDAS'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_GAS_DET_MONEDAS'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,RIG,ID_VENTA,LINEA_EMPLEADO,LIN' +
        'EA,COD_MONEDA,CANTIDAD,TOTAL)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG,?ID_VENTA,?LINEA_EMPLE' +
        'ADO,?LINEA,?COD_MONEDA,?CANTIDAD,?TOTAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_GAS_DET_MONEDAS'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_GAS_DET_MONEDAS'
      'Where (id_venta=?id_venta and'
      '            linea_empleado=?linea)'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_GAS_DET_MONEDAS'
      'SET'
      '  ID_VENTA=?ID_VENTA '
      '  ,LINEA_EMPLEADO=?LINEA_EMPLEADO '
      '  ,COD_MONEDA=?COD_MONEDA '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,TOTAL=?TOTAL '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMEmpleado
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIG '
      'SERIE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_GAS_DET_MONEDAS'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 298
    Top = 288
    object QMMonedasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMMonedasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMMonedasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMMonedasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMMonedasRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMMonedasID_VENTA: TIntegerField
      DisplayLabel = 'ID Venta'
      FieldName = 'ID_VENTA'
    end
    object QMMonedasLINEA_EMPLEADO: TIntegerField
      DisplayLabel = 'Linea Empleado'
      FieldName = 'LINEA_EMPLEADO'
    end
    object QMMonedasLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMMonedasCOD_MONEDA: TIntegerField
      DisplayLabel = 'Cod. Moneda'
      FieldName = 'COD_MONEDA'
    end
    object QMMonedasCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMMonedasTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object QMMonedasDescMoneda: TStringField
      DisplayLabel = 'Desc. Moneda'
      FieldKind = fkCalculated
      FieldName = 'DescMoneda'
      Calculated = True
    end
    object QMMonedasValor: TIntegerField
      DisplayLabel = 'Valor'
      FieldKind = fkCalculated
      FieldName = 'VALOR'
      Calculated = True
    end
  end
  object DSQMMonedas: TDataSource
    DataSet = QMMonedas
    Left = 384
    Top = 304
  end
  object frDBDTanque: TfrDBDataSet
    DataSource = DSQMTanque
    Left = 456
    Top = 81
  end
  object frDBDEmpleado: TfrDBDataSet
    DataSource = DSQMEmpleado
    Left = 464
    Top = 137
  end
  object frDBDDispensador: TfrDBDataSet
    DataSource = DSQMDispensador
    Left = 464
    Top = 193
  end
  object frDBDFPago: TfrDBDataSet
    DataSource = DSQMFPago
    Left = 464
    Top = 249
  end
  object frDBDMonedas: TfrDBDataSet
    DataSource = DSQMMonedas
    Left = 448
    Top = 313
  end
  object xTanque: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_GAS_TANQUE'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and serie=?serie and cod_tanque=?tanque '
      ''
      '')
    UniDirectional = False
    Left = 60
    Top = 192
    object xTanqueEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTanqueSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xTanqueCOD_TANQUE: TIntegerField
      DisplayLabel = 'Cod. Tanque'
      FieldName = 'COD_TANQUE'
    end
    object xTanqueTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xTanqueEVAPORACION: TFloatField
      DisplayLabel = 'Evaporacion'
      FieldName = 'EVAPORACION'
    end
    object xTanqueCAPACIDAD: TFloatField
      DisplayLabel = 'Capacidad'
      FieldName = 'CAPACIDAD'
    end
    object xTanqueALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xTanqueARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xTanqueTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object xTanqueESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xTanqueNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object DSxTanque: TDataSource
    DataSet = xTanque
    Left = 146
    Top = 184
  end
  object xEmpleado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMPLEADOS_EF'
      'where empresa=?empresa and empleado=?empleado'
      ''
      '')
    UniDirectional = False
    Left = 60
    Top = 240
    object xEmpleadoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xEmpleadoEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object xEmpleadoTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xEmpleadoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xEmpleadoNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xEmpleadoID_EMPLEADO: TIntegerField
      DisplayLabel = 'ID Empleado'
      FieldName = 'ID_EMPLEADO'
    end
  end
  object DSxEmpleado: TDataSource
    DataSet = xEmpleado
    Left = 146
    Top = 232
  end
  object xDispensador: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_GAS_DISPENSADOR'
      'where cod_dispensador=?dispensador '
      ''
      '')
    UniDirectional = False
    Left = 60
    Top = 288
    object xDispensadorCOD_DISPENSADOR: TIntegerField
      DisplayLabel = 'Cod. Dispensador'
      FieldName = 'COD_DISPENSADOR'
    end
    object xDispensadorTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xDispensadorESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xDispensadorNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
  end
  object DSxDispensador: TDataSource
    DataSet = xDispensador
    Left = 154
    Top = 288
  end
  object xFPago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_formas_pago'
      'where forma=?forma '
      ''
      '')
    UniDirectional = False
    Left = 52
    Top = 352
    object xFPagoFORMA: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA'
      Size = 3
    end
    object xFPagoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xFPagoPLAZOS: TIntegerField
      DisplayLabel = 'Plazos'
      FieldName = 'PLAZOS'
    end
    object xFPagoDIAS_1_PLAZO: TIntegerField
      DisplayLabel = 'Dia Plazo'
      FieldName = 'DIAS_1_PLAZO'
    end
    object xFPagoDIAS_E_PLAZOS: TIntegerField
      DisplayLabel = 'Dia e/Plazo'
      FieldName = 'DIAS_E_PLAZOS'
    end
    object xFPagoTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efecto'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object xFPagoREMESAR: TIntegerField
      DisplayLabel = 'Remesar'
      FieldName = 'REMESAR'
    end
    object xFPagoPRONTO_PAGO: TIntegerField
      DisplayLabel = 'Pronto Pago'
      FieldName = 'PRONTO_PAGO'
    end
    object xFPagoPAGO_AUTOMATICO: TIntegerField
      DisplayLabel = 'Pago Autom.'
      FieldName = 'PAGO_AUTOMATICO'
    end
    object xFPagoACEPTAR: TIntegerField
      DisplayLabel = 'Aceptar'
      FieldName = 'ACEPTAR'
    end
    object xFPagoDATOS_BANCARIOS: TFIBStringField
      DisplayLabel = 'Datos Bancarios'
      FieldName = 'DATOS_BANCARIOS'
      Size = 1
    end
    object xFPagoHEREDA_FINANCIACION: TIntegerField
      DisplayLabel = 'Hereda Financiacion'
      FieldName = 'HEREDA_FINANCIACION'
    end
    object xFPagoORDENAR_PAGO: TIntegerField
      DisplayLabel = 'Ordenar Pago'
      FieldName = 'ORDENAR_PAGO'
    end
    object xFPagoMES_NATURAL: TIntegerField
      DisplayLabel = 'Mes Natural'
      FieldName = 'MES_NATURAL'
    end
  end
  object DSxFPago: TDataSource
    DataSet = xFPago
    Left = 154
    Top = 344
  end
  object xTipoMoneda: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT DESCRIPCION,VALOR FROM sys_tipo_monedas'
      'where cod_moneda=?cod_moneda'
      ''
      '')
    UniDirectional = False
    DataSource = DSQMMonedas
    Left = 60
    Top = 424
    object xTipoMonedaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 15
    end
    object xTipoMonedaVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
  end
  object DSxTipoMoneda: TDataSource
    DataSet = xTipoMoneda
    Left = 162
    Top = 416
  end
end
