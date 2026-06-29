object DMRAnaSumasySaldos: TDMRAnaSumasySaldos
  OldCreateOrder = False
  OnCreate = DMRSumasYSaldosCreate
  OnDestroy = DMRSumasySaldosDestroy
  Left = 210
  Top = 172
  Height = 346
  Width = 524
  object TSBalance: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ANA_TMP_BALANCES_SS_CC_PADRE'
      'WHERE'
      '  CENTRO_COSTE=?CENTRO_COSTE AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM ANA_TMP_BALANCES_SS_CC_PADRE'
      'WHERE '
      '    ENTRADA=?ENTRADA AND'
      '    EMPRESA=?EMPRESA  AND'
      '    EJERCICIO=?EJERCICIO  AND'
      '    CANAL=?CANAL AND'
      '    PLAN_CONTABLE= ?PLAN_CONTABLE AND'
      '    NIVEL=?NIVEL_INI'
      'ORDER BY CENTRO_COSTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      '')
    OnCalcFields = TSBalanceCalcFields
    ClavesPrimarias.Strings = (
      'CENTRO_COSTE '
      'PLAN_CONTABLE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ANA_TMP_BALANCES_SS_CC_PADRE'
    UpdateTransaction = TLocal
    Left = 38
    Top = 68
    object TSBalanceENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object TSBalanceEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object TSBalanceEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object TSBalanceCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object TSBalancePLAN_CONTABLE: TFIBStringField
      DisplayLabel = 'P.C.G.'
      FieldName = 'PLAN_CONTABLE'
      Size = 10
    end
    object TSBalanceCENTRO_COSTE: TFIBStringField
      DisplayLabel = 'Centro Coste'
      FieldName = 'CENTRO_COSTE'
      Size = 10
    end
    object TSBalanceTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object TSBalanceDEBE: TFloatField
      DisplayLabel = 'Debe'
      FieldName = 'DEBE'
    end
    object TSBalanceHABER: TFloatField
      DisplayLabel = 'Haber'
      FieldName = 'HABER'
    end
    object TSBalanceDEBE_MES: TFloatField
      DisplayLabel = 'Debe Mes'
      FieldName = 'DEBE_MES'
    end
    object TSBalanceHABER_MES: TFloatField
      DisplayLabel = 'Haber Mes'
      FieldName = 'HABER_MES'
    end
    object TSBalanceNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object TSBalanceCENTRO_COSTE_PADRE: TFIBStringField
      DisplayLabel = 'C. Coste Padre'
      FieldName = 'CENTRO_COSTE_PADRE'
      Size = 10
    end
    object TSBalanceSALDO_ACREEDOR: TFloatField
      DisplayLabel = 'Saldo Acreedor'
      FieldKind = fkCalculated
      FieldName = 'SALDO_ACREEDOR'
      Calculated = True
    end
    object TSBalanceSALDO_DEUDOR: TFloatField
      DisplayLabel = 'Saldo Deudor'
      FieldKind = fkCalculated
      FieldName = 'SALDO_DEUDOR'
      Calculated = True
    end
  end
  object TSBalance_Medio: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ANA_TMP_BALANCES_SS_CC_PADRE'
      'WHERE'
      '  CENTRO_COSTE=?CENTRO_COSTE AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM ANA_TMP_BALANCES_SS_CC_PADRE'
      'WHERE'
      '    ENTRADA=?ENTRADA AND '
      '    EMPRESA=?EMPRESA AND'
      '    EJERCICIO=?EJERCICIO AND'
      '    CANAL=?CANAL AND'
      '    PLAN_CONTABLE=?PLAN_CONTABLE AND'
      '    CENTRO_COSTE STARTING WITH ?CENTRO_COSTE AND'
      '    NIVEL>?NIVEL_INI AND NIVEL<=?NIVEL_FIN '
      'ORDER BY CENTRO_COSTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSBalance
    OnCalcFields = TSBalance_MedioCalcFields
    ClavesPrimarias.Strings = (
      'CENTRO_COSTE '
      'PLAN_CONTABLE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ANA_TMP_BALANCES_SS_CC_PADRE'
    UpdateTransaction = TLocal
    Left = 38
    Top = 122
    object TSBalance_MedioENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object TSBalance_MedioEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object TSBalance_MedioEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object TSBalance_MedioCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object TSBalance_MedioPLAN_CONTABLE: TFIBStringField
      DisplayLabel = 'P.C.G.'
      FieldName = 'PLAN_CONTABLE'
      Size = 10
    end
    object TSBalance_MedioCENTRO_COSTE: TFIBStringField
      DisplayLabel = 'Centro Coste'
      FieldName = 'CENTRO_COSTE'
      Size = 10
    end
    object TSBalance_MedioTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object TSBalance_MedioDEBE: TFloatField
      DisplayLabel = 'Debe'
      FieldName = 'DEBE'
    end
    object TSBalance_MedioHABER: TFloatField
      DisplayLabel = 'Haber'
      FieldName = 'HABER'
    end
    object TSBalance_MedioDEBE_MES: TFloatField
      DisplayLabel = 'Debe Mes'
      FieldName = 'DEBE_MES'
    end
    object TSBalance_MedioHABER_MES: TFloatField
      DisplayLabel = 'Haber Mes'
      FieldName = 'HABER_MES'
    end
    object TSBalance_MedioNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object TSBalance_MedioCENTRO_COSTE_PADRE: TFIBStringField
      DisplayLabel = 'C. Coste Padre'
      FieldName = 'CENTRO_COSTE_PADRE'
      Size = 10
    end
    object TSBalance_MedioSALDO_ACREEDOR: TFloatField
      DisplayLabel = 'Saldo Acreedor'
      FieldKind = fkCalculated
      FieldName = 'SALDO_ACREEDOR'
      Calculated = True
    end
    object TSBalance_MedioSALDO_DEUDOR: TFloatField
      DisplayLabel = 'Saldo Deudor'
      FieldKind = fkCalculated
      FieldName = 'SALDO_DEUDOR'
      Calculated = True
    end
  end
  object DSBalance: TDataSource
    DataSet = TSBalance
    Left = 138
    Top = 70
  end
  object DSBalance_Medio: TDataSource
    DataSet = TSBalance_Medio
    Left = 138
    Top = 122
  end
  object TSBalance_Detalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ANA_TMP_BALANCES_SS'
      'WHERE'
      '  CENTRO_COSTE=?CENTRO_COSTE AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM ANA_TMP_BALANCES_SS'
      'WHERE'
      '    ENTRADA=?ENTRADA AND'
      '    EMPRESA=?EMPRESA AND'
      '    EJERCICIO=?EJERCICIO AND'
      '    CANAL=?CANAL AND '
      '    PLAN_CONTABLE=?PLAN_CONTABLE AND '
      '    CENTRO_COSTE=?CENTRO_COSTE'
      'ORDER BY CENTRO_COSTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSBalance
    OnCalcFields = TSBalance_DetalleCalcFields
    ClavesPrimarias.Strings = (
      'CENTRO_COSTE '
      'PLAN_CONTABLE '
      'CANAL '
      'EJERCICIO '
      'EMPRESA '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ANA_TMP_BALANCES_SS'
    UpdateTransaction = TLocal
    Left = 38
    Top = 180
    object TSBalance_DetalleENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object TSBalance_DetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object TSBalance_DetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object TSBalance_DetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object TSBalance_DetallePLAN_CONTABLE: TFIBStringField
      DisplayLabel = 'P.C.G.'
      FieldName = 'PLAN_CONTABLE'
      Size = 10
    end
    object TSBalance_DetalleCENTRO_COSTE: TFIBStringField
      DisplayLabel = 'Centro Coste'
      FieldName = 'CENTRO_COSTE'
      Size = 10
    end
    object TSBalance_DetalleTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object TSBalance_DetalleCENTRO_COSTE_PADRE: TFIBStringField
      DisplayLabel = 'C. Coste Padre'
      FieldName = 'CENTRO_COSTE_PADRE'
      Size = 10
    end
    object TSBalance_DetalleDEBE: TFloatField
      DisplayLabel = 'Debe'
      FieldName = 'DEBE'
    end
    object TSBalance_DetalleHABER: TFloatField
      DisplayLabel = 'Haber'
      FieldName = 'HABER'
    end
    object TSBalance_DetalleDEBE_MES: TFloatField
      DisplayLabel = 'Debe Mes'
      FieldName = 'DEBE_MES'
    end
    object TSBalance_DetalleHABER_MES: TFloatField
      DisplayLabel = 'Haber Mes'
      FieldName = 'HABER_MES'
    end
    object TSBalance_DetalleSALDO_ACREEDOR: TFloatField
      DisplayLabel = 'Saldo Acreedor'
      FieldKind = fkCalculated
      FieldName = 'SALDO_ACREEDOR'
      Calculated = True
    end
    object TSBalance_DetalleSALDO_DEUDOR: TFloatField
      DisplayLabel = 'Saldo Deudor'
      FieldKind = fkCalculated
      FieldName = 'SALDO_DEUDOR'
      Calculated = True
    end
  end
  object DSBalance_Detalle: TDataSource
    DataSet = TSBalance_Detalle
    Left = 138
    Top = 178
  end
  object SPBalanceDetalle: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure n_centros_coste_balance_detalle'
      '    (?empresa,?ejercicio,?canal,?plan_contable,'
      
        '     ?centro_coste_ini,?centro_coste_fin,?fecha_ini,?fecha_fin,?' +
        'moneda,'
      '     ?entrada,?seccion_ini,?seccion_fin,?nivel_filtro)')
    Transaction = TLocal
    AutoTrans = True
    Left = 46
    Top = 252
  end
  object SPBalanceSuperior: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure n_centros_coste_balance_niveles'
      
        '    (?empresa,?ejercicio,?canal,?plan_contable,?nivel_ini,?nivel' +
        '_fin,?entrada)')
    Transaction = TLocal
    AutoTrans = True
    Left = 146
    Top = 252
  end
  object SPRangos: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure n_apuntes_max_min (?EMPRESA,?EJERCICIO,?CANAL,' +
        '?PLAN_CONTABLE)')
    Transaction = TLocal
    AutoTrans = True
    Left = 240
    Top = 253
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_MONEDAS')
    UniDirectional = False
    Left = 342
    Top = 24
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 442
    Top = 24
  end
  object xCC_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM ana_centros_coste'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      'and plan_contable=?plan_contable and centro_coste=?centro_coste'
      '')
    UniDirectional = False
    Left = 342
    Top = 80
  end
  object DSxCC_Desde: TDataSource
    DataSet = xCC_Desde
    Left = 442
    Top = 84
  end
  object xCC_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM ana_centros_coste'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal'
      'and plan_contable=?plan_contable and centro_coste=?centro_coste'
      '')
    UniDirectional = False
    Left = 342
    Top = 134
  end
  object DSxCC_Hasta: TDataSource
    DataSet = xCC_Hasta
    Left = 442
    Top = 136
  end
  object frSumasySaldos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Sumas y Saldos Cont. Ana.'
    RebuildPrinter = False
    OnBeginDoc = frSumasySaldosBeginDoc
    OnGetValue = frSumasySaldosGetValue
    OnBeforePrint = frSumasySaldosEnterRect
    OnEnterRect = frSumasySaldosEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 14
    ReportForm = {19000000}
  end
  object frDSBalance: TfrDBDataSet
    DataSource = DSBalance
    Left = 234
    Top = 70
  end
  object frDSBalance_Medio: TfrDBDataSet
    DataSource = DSBalance_Medio
    Left = 238
    Top = 120
  end
  object frDSBalance_Detalle: TfrDBDataSet
    DataSource = DSBalance_Detalle
    Left = 242
    Top = 176
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 136
    Top = 16
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
    Left = 342
    Top = 198
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
    Left = 442
    Top = 200
  end
end
