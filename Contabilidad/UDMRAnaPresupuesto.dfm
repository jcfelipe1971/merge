object DMRAnaPresupuesto: TDMRAnaPresupuesto
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 350
  Top = 244
  Height = 355
  Width = 510
  object DSxCcDesde: TDataSource
    DataSet = xCcDesde
    Left = 408
    Top = 24
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 232
    Top = 16
  end
  object xCcDesde: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ana_centros_coste'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and'
      'plan_contable=?plan_contable and centro_coste=?centro_coste')
    UniDirectional = False
    Opciones = []
    AutoSQLdeVistas = False
    Left = 328
    Top = 24
    object xCcDesdeEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCcDesdeEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xCcDesdeCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xCcDesdePLAN_CONTABLE: TFIBStringField
      DisplayLabel = 'P.C.G.'
      FieldName = 'PLAN_CONTABLE'
      Size = 10
    end
    object xCcDesdeCENTRO_COSTE: TFIBStringField
      DisplayLabel = 'Centro Coste'
      FieldName = 'CENTRO_COSTE'
      Size = 10
    end
    object xCcDesdeTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xCcDesdeNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object xCcDesdeDISTRIBUCION_POSTERIOR: TIntegerField
      DisplayLabel = 'Distr. Posterior'
      FieldName = 'DISTRIBUCION_POSTERIOR'
    end
    object xCcDesdeCENTRO_COSTE_PADRE: TFIBStringField
      DisplayLabel = 'C. Coste Padre'
      FieldName = 'CENTRO_COSTE_PADRE'
      Size = 10
    end
    object xCcDesdeID_P: TIntegerField
      DisplayLabel = 'ID Prom.'
      FieldName = 'ID_P'
    end
    object xCcDesdeID_CC: TIntegerField
      DisplayLabel = 'ID C. C.'
      FieldName = 'ID_CC'
    end
    object xCcDesdeID_CC_PADRE: TIntegerField
      DisplayLabel = 'ID C. C. Padre'
      FieldName = 'ID_CC_PADRE'
    end
  end
  object frDSPresupuestos: TfrDBDataSet
    DataSource = DSPresupuestos
    Left = 232
    Top = 82
  end
  object frAnaPresupuesto: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de An'#225'lisis de Prespuesto'
    RebuildPrinter = False
    OnGetValue = frAnaPresupuestoGetValue
    OnBeforePrint = frAnaPresupuestoEnterRect
    OnEnterRect = frAnaPresupuestoEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 14
    ReportForm = {19000000}
  end
  object xCcHasta: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ana_centros_coste'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and'
      'plan_contable=?plan_contable and centro_coste=?centro_coste')
    UniDirectional = False
    Opciones = []
    AutoSQLdeVistas = False
    Left = 328
    Top = 88
    object xCcHastaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCcHastaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xCcHastaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xCcHastaPLAN_CONTABLE: TFIBStringField
      DisplayLabel = 'P.C.G.'
      FieldName = 'PLAN_CONTABLE'
      Size = 10
    end
    object xCcHastaCENTRO_COSTE: TFIBStringField
      DisplayLabel = 'Centro Coste'
      FieldName = 'CENTRO_COSTE'
      Size = 10
    end
    object xCcHastaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xCcHastaNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object xCcHastaDISTRIBUCION_POSTERIOR: TIntegerField
      DisplayLabel = 'Distr. Posterior'
      FieldName = 'DISTRIBUCION_POSTERIOR'
    end
    object xCcHastaCENTRO_COSTE_PADRE: TFIBStringField
      DisplayLabel = 'C. Coste Padre'
      FieldName = 'CENTRO_COSTE_PADRE'
      Size = 10
    end
    object xCcHastaID_P: TIntegerField
      DisplayLabel = 'ID Prom.'
      FieldName = 'ID_P'
    end
    object xCcHastaID_CC: TIntegerField
      DisplayLabel = 'ID C. C.'
      FieldName = 'ID_CC'
    end
    object xCcHastaID_CC_PADRE: TIntegerField
      DisplayLabel = 'ID C. C. Padre'
      FieldName = 'ID_CC_PADRE'
    end
  end
  object DSxCcHasta: TDataSource
    DataSet = xCcHasta
    Left = 408
    Top = 88
  end
  object xPlan: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select plan_contable,titulo from ana_plan_contable'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      'and plan_contable=?plan_contable'
      '')
    UniDirectional = False
    Left = 330
    Top = 151
    object xPlanPLAN_CONTABLE: TFIBStringField
      DisplayLabel = 'P.C.G.'
      FieldName = 'PLAN_CONTABLE'
      Size = 10
    end
    object xPlanTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxPlan: TDataSource
    DataSet = xPlan
    Left = 410
    Top = 152
  end
  object DSPresupuestos: TDataSource
    DataSet = TSPresupuestos
    Left = 134
    Top = 80
  end
  object frDSMeses: TfrDBDataSet
    DataSource = DSMeses
    Left = 232
    Top = 146
  end
  object DSMeses: TDataSource
    DataSet = TSMeses
    Left = 134
    Top = 151
  end
  object xCentroCoste: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ana_centros_coste'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and'
      'plan_contable=?plan_contable and centro_coste=?centro_coste')
    UniDirectional = False
    DataSource = DSPresupuestos
    Opciones = []
    AutoSQLdeVistas = False
    Left = 330
    Top = 208
    object xCentroCosteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCentroCosteEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xCentroCosteCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xCentroCostePLAN_CONTABLE: TFIBStringField
      DisplayLabel = 'P.C.G.'
      FieldName = 'PLAN_CONTABLE'
      Size = 10
    end
    object xCentroCosteCENTRO_COSTE: TFIBStringField
      DisplayLabel = 'Centro Coste'
      FieldName = 'CENTRO_COSTE'
      Size = 10
    end
    object xCentroCosteTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xCentroCosteNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object xCentroCosteDISTRIBUCION_POSTERIOR: TIntegerField
      DisplayLabel = 'Distr. Posterior'
      FieldName = 'DISTRIBUCION_POSTERIOR'
    end
    object xCentroCosteCENTRO_COSTE_PADRE: TFIBStringField
      DisplayLabel = 'C. Coste Padre'
      FieldName = 'CENTRO_COSTE_PADRE'
      Size = 10
    end
    object xCentroCosteID_P: TIntegerField
      DisplayLabel = 'ID Prom.'
      FieldName = 'ID_P'
    end
    object xCentroCosteID_CC: TIntegerField
      DisplayLabel = 'ID C. C.'
      FieldName = 'ID_CC'
    end
    object xCentroCosteID_CC_PADRE: TIntegerField
      DisplayLabel = 'ID C. C. Padre'
      FieldName = 'ID_CC_PADRE'
    end
  end
  object DSxCentroCoste: TDataSource
    DataSet = xCentroCoste
    Left = 410
    Top = 208
  end
  object xPeriodo: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from emp_periodos'
      
        'where empresa=?empresa and ejercicio=?ejercicio and  periodo=?pe' +
        'riodo')
    UniDirectional = False
    DataSource = DSMeses
    Opciones = []
    AutoSQLdeVistas = False
    Left = 330
    Top = 264
    object xPeriodoPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object xPeriodoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 50
    end
  end
  object DSxPeriodo: TDataSource
    DataSet = xPeriodo
    Left = 410
    Top = 264
  end
  object TSPresupuestos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM ANA_CENTRO_COSTE_PERIODO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AfterOpen = TSPresupuestosAfterOpen
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ANA_CENTRO_COSTE_PERIODO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 38
    Top = 84
    object TSPresupuestosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object TSPresupuestosCENTRO_COSTE: TFIBStringField
      DisplayLabel = 'Centro Coste'
      FieldName = 'CENTRO_COSTE'
      Size = 10
    end
    object TSPresupuestosSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
    object TSPresupuestosPRESUPUESTO: TFloatField
      DisplayLabel = 'Presupuesto'
      FieldName = 'PRESUPUESTO'
    end
    object TSPresupuestosDESVIACION: TFloatField
      DisplayLabel = 'Desviacion'
      FieldName = 'DESVIACION'
    end
    object TSPresupuestosCONTROL: TFloatField
      DisplayLabel = 'Control'
      FieldName = 'CONTROL'
    end
    object TSPresupuestosTIPO_CONTROL: TIntegerField
      DisplayLabel = 'Tipo Control'
      FieldName = 'TIPO_CONTROL'
    end
  end
  object TSMeses: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM ANA_CENTRO_COSTE_PERIODO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSPresupuestos
    AfterOpen = TSMesesAfterOpen
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ANA_CENTRO_COSTE_PERIODO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 38
    Top = 148
    object TSMesesCENTRO_COSTE: TFIBStringField
      DisplayLabel = 'Centro Coste'
      FieldName = 'CENTRO_COSTE'
      Size = 10
    end
    object TSMesesPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object TSMesesPRESUPUESTO: TFloatField
      DisplayLabel = 'Presupuesto'
      FieldName = 'PRESUPUESTO'
    end
    object TSMesesDESVIACION: TFloatField
      DisplayLabel = 'Desviacion'
      FieldName = 'DESVIACION'
    end
    object TSMesesCONTROL: TFloatField
      DisplayLabel = 'Control'
      FieldName = 'CONTROL'
    end
    object TSMesesSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
    object TSMesesTIPO_CONTROL: TIntegerField
      DisplayLabel = 'Tipo Control'
      FieldName = 'TIPO_CONTROL'
    end
  end
  object frxAnaPresupuesto: TfrxHYReport
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
    OnBeforePrint = frxAnaPresupuestoBeforePrint
    OnGetValue = frxAnaPresupuestoGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 142
    Top = 14
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
    Left = 32
    Top = 216
  end
end
