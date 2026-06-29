object DMLstDescargasGas: TDMLstDescargasGas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 794
  Top = 292
  Height = 466
  Width = 609
  object xDescargasGas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM GES_GAS_CAB_DESCARGA'
      '  WHERE ID_DESCARGA=?ID_DESCARGA')
    UniDirectional = False
    Left = 36
    Top = 74
    object xDescargasGasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDescargasGasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xDescargasGasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xDescargasGasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xDescargasGasRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xDescargasGasID_DESCARGA: TIntegerField
      DisplayLabel = 'ID Desc.'
      FieldName = 'ID_DESCARGA'
    end
    object xDescargasGasFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fec. Ini.'
      FieldName = 'FECHA_INICIO'
    end
    object xDescargasGasFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object xDescargasGasTIEMPO_DESCARGA: TFloatField
      DisplayLabel = 'Tiempo Desc.'
      FieldName = 'TIEMPO_DESCARGA'
    end
    object xDescargasGasORDEN_COMPRA: TIntegerField
      DisplayLabel = 'Ord. Compra'
      FieldName = 'ORDEN_COMPRA'
    end
    object xDescargasGasCOLA_CAMION: TIntegerField
      DisplayLabel = 'Cola Camion'
      FieldName = 'COLA_CAMION'
    end
    object xDescargasGasTURNO: TFIBStringField
      DisplayLabel = 'Turno'
      FieldName = 'TURNO'
      Size = 3
    end
    object xDescargasGasPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xDescargasGasPRESION: TFloatField
      DisplayLabel = 'Presion'
      FieldName = 'PRESION'
    end
    object xDescargasGasTEMPERATURA: TFloatField
      DisplayLabel = 'Temp.'
      FieldName = 'TEMPERATURA'
    end
    object xDescargasGasALBARAN_CONDUCE: TFloatField
      DisplayLabel = 'Alb. Conduce'
      FieldName = 'ALBARAN_CONDUCE'
    end
    object xDescargasGasNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xDescargasGasID_DESCARGA_O: TIntegerField
      DisplayLabel = 'ID Desc. Orig.'
      FieldName = 'ID_DESCARGA_O'
    end
    object xDescargasGasID_DESCARGA_D: TIntegerField
      DisplayLabel = 'ID Desc. Dest.'
      FieldName = 'ID_DESCARGA_D'
    end
    object xDescargasGasENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xDescargasGasESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xDescargasGasORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
  end
  object DSxDescargasGas: TDataSource
    DataSet = xDescargasGas
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
  object frxDescargasGas: TfrxHYReport
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
    OnBeforePrint = frxDescargasGasBeforePrint
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
  object frxDBxDescargasGas: TfrxDBDataset
    UserName = 'frxDBxDescargasGas'
    CloseDataSource = False
    OpenDataSource = False
    DataSource = DSxDescargasGas
    Left = 504
    Top = 16
  end
  object frDescargasGas: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frDescargasGasGetValue
    OnBeforePrint = frDescargasGasEnterRect
    OnEnterRect = frDescargasGasEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 35
    Top = 24
    ReportForm = {19000000}
  end
  object frDSQMDescargasGas: TfrDBDataSet
    DataSource = DSxDescargasGas
    Left = 240
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
    DataSource = DSxDescargasGas
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
      'DELETE FROM GES_GAS_DET_DESC_TANQUE'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_GAS_DET_DESC_TANQUE'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,RIG,ID_DESCARGA,LINEA,COD_TANQU' +
        'E,CAP_INICIAL,CAP_FINAL,UNID_CARGA,PRECIO,IMPORTE_TOTAL,RIG_MOV,' +
        'POR_INICIAL,POR_FINAL)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG,?ID_DESCARGA,?LINEA,?C' +
        'OD_TANQUE,?CAP_INICIAL,?CAP_FINAL,?UNID_CARGA,?PRECIO,?IMPORTE_T' +
        'OTAL,?RIG_MOV,?POR_INICIAL,?POR_FINAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_GAS_DET_DESC_TANQUE'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_GAS_DET_DESC_TANQUE'
      'Where (Empresa=?Empresa and'
      '             Ejercicio=?Ejercicio and'
      '             Canal=?Canal  and'
      '             Serie=?Serie and'
      '             Rig=?Rig)'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_GAS_DET_DESC_TANQUE'
      'SET'
      '  ID_DESCARGA=?ID_DESCARGA '
      '  ,COD_TANQUE=?COD_TANQUE '
      '  ,CAP_INICIAL=?CAP_INICIAL '
      '  ,CAP_FINAL=?CAP_FINAL '
      '  ,UNID_CARGA=?UNID_CARGA '
      '  ,PRECIO=?PRECIO '
      '  ,IMPORTE_TOTAL=?IMPORTE_TOTAL '
      '  ,RIG_MOV=?RIG_MOV '
      '  ,POR_INICIAL=?POR_INICIAL '
      '  ,POR_FINAL=?POR_FINAL '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSxDescargasGas
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
    TableName = 'GES_GAS_DET_DESC_TANQUE'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 330
    Top = 96
    object QMTanqueEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTanqueEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMTanqueCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMTanqueSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMTanqueRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMTanqueID_DESCARGA: TIntegerField
      DisplayLabel = 'ID Desc.'
      FieldName = 'ID_DESCARGA'
    end
    object QMTanqueLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMTanqueCOD_TANQUE: TIntegerField
      DisplayLabel = 'Cod. Tanque'
      FieldName = 'COD_TANQUE'
    end
    object QMTanqueCAP_INICIAL: TFloatField
      DisplayLabel = 'Cap. Inicial'
      FieldName = 'CAP_INICIAL'
    end
    object QMTanqueCAP_FINAL: TFloatField
      DisplayLabel = 'Cap. Final'
      FieldName = 'CAP_FINAL'
    end
    object QMTanqueUNID_CARGA: TFloatField
      DisplayLabel = 'Uds. Carga'
      FieldName = 'UNID_CARGA'
    end
    object QMTanquePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMTanqueIMPORTE_TOTAL: TFloatField
      DisplayLabel = 'Imp. Total'
      FieldName = 'IMPORTE_TOTAL'
    end
    object QMTanqueRIG_MOV: TIntegerField
      DisplayLabel = 'Rig Mov.'
      FieldName = 'RIG_MOV'
    end
    object QMTanquePOR_INICIAL: TFloatField
      DisplayLabel = '% Inicial'
      FieldName = 'POR_INICIAL'
    end
    object QMTanquePOR_FINAL: TFloatField
      DisplayLabel = '% Final'
      FieldName = 'POR_FINAL'
    end
    object QMTanqueCapacidad: TStringField
      FieldKind = fkCalculated
      FieldName = 'Capacidad'
      Calculated = True
    end
    object QMTanqueDescTanque: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescTanque'
      Calculated = True
    end
  end
  object DSQMTanque: TDataSource
    DataSet = QMTanque
    Left = 416
    Top = 88
  end
  object QMDispensador: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_GAS_DET_DESC_DISP'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RIG=?old_RIG AND '
      '  SERIE=?old_SERIE AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO GES_GAS_DET_DESC_DISP'
      
        '  (EMPRESA,EJERCICIO,CANAL,SERIE,RIG,ID_DESCARGA,LINEA,COD_DISP,' +
        'LECTURA_INICIAL,LECTURA_FINAL,UNID_DISPENSADAS)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?RIG,?ID_DESCARGA,?LINEA,?C' +
        'OD_DISP,?LECTURA_INICIAL,?LECTURA_FINAL,?UNID_DISPENSADAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_GAS_DET_DESC_DISP'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIG=?RIG AND '
      '  SERIE=?SERIE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_GAS_DET_DESC_DISP'
      'Where (Empresa=?Empresa and'
      '             Ejercicio=?Ejercicio and'
      '             Canal=?Canal  and'
      '             Serie=?Serie and'
      '             Rig=?Rig)'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_GAS_DET_DESC_DISP'
      'SET'
      '  ID_DESCARGA=?ID_DESCARGA '
      '  ,COD_DISP=?COD_DISP '
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
    DataSource = DSxDescargasGas
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
    TableName = 'GES_GAS_DET_DESC_DISP'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'GES_CABECERAS_S'
      'GES_CABECERAS_S_OFC')
    CamposBloqueo.Strings = (
      'ID_S'
      'ID_S')
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 330
    Top = 144
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
    object QMDispensadorID_DESCARGA: TIntegerField
      DisplayLabel = 'ID Desc.'
      FieldName = 'ID_DESCARGA'
    end
    object QMDispensadorLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDispensadorCOD_DISP: TIntegerField
      DisplayLabel = 'Dispensador'
      FieldName = 'COD_DISP'
    end
    object QMDispensadorLECTURA_INICIAL: TFloatField
      DisplayLabel = 'Lectura Ini.'
      FieldName = 'LECTURA_INICIAL'
    end
    object QMDispensadorLECTURA_FINAL: TFloatField
      DisplayLabel = 'Lectura Final'
      FieldName = 'LECTURA_FINAL'
    end
    object QMDispensadorUNID_DISPENSADAS: TFloatField
      DisplayLabel = 'Uds. Dispensadas'
      FieldName = 'UNID_DISPENSADAS'
    end
    object QMDispensadorDescDispensador: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescDispensador'
      Calculated = True
    end
  end
  object DSQMDispensador: TDataSource
    DataSet = QMDispensador
    Left = 416
    Top = 144
  end
  object frDBDTanque: TfrDBDataSet
    DataSource = DSQMTanque
    Left = 512
    Top = 81
  end
  object frDBDDispensador: TfrDBDataSet
    DataSource = DSQMDispensador
    Left = 512
    Top = 129
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
    Left = 212
    Top = 224
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
    Left = 306
    Top = 224
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
    Left = 220
    Top = 336
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
    Left = 306
    Top = 328
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
    Left = 388
    Top = 208
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
    Left = 482
    Top = 208
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
    Left = 380
    Top = 272
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
    Left = 482
    Top = 264
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
    Left = 388
    Top = 344
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
    Left = 490
    Top = 336
  end
end
