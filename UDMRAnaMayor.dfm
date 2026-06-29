object DMRAnaMayor: TDMRAnaMayor
  OldCreateOrder = False
  OnCreate = DMRAnaMayorCreate
  OnDestroy = DMRCabeceraDestroy
  Left = 402
  Top = 222
  Height = 386
  Width = 515
  object frAnaMayor: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listados Mayor Cont. Ana. Ord. C. Coste'
    RebuildPrinter = False
    OnGetValue = frAnaMayorGetValue
    OnBeforePrint = frAnaMayorEnterRect
    OnEnterRect = frAnaMayorEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 24
    Top = 20
    ReportForm = {19000000}
  end
  object frDSxListaAnaMayor: TfrDBDataSet
    DataSource = DSxListaAnaMayor
    Left = 231
    Top = 77
  end
  object DSxListaAnaMayor: TDataSource
    DataSet = xListaAnaMayor
    Left = 123
    Top = 77
  end
  object xCentrosCoste: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT * FROM ANA_CENTROS_COSTE'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND'
      '  CENTRO_COSTE>=?CC_DESDE AND'
      '  CENTRO_COSTE<=?CC_HASTA')
    UniDirectional = False
    Left = 23
    Top = 126
    object xCentrosCosteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCentrosCosteEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xCentrosCosteCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xCentrosCostePLAN_CONTABLE: TFIBStringField
      DisplayLabel = 'P.C.G.'
      FieldName = 'PLAN_CONTABLE'
      Size = 10
    end
    object xCentrosCosteCENTRO_COSTE: TFIBStringField
      DisplayLabel = 'Centro Coste'
      FieldName = 'CENTRO_COSTE'
      Size = 10
    end
    object xCentrosCosteTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xCentrosCosteNIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object xCentrosCosteDISTRIBUCION_POSTERIOR: TIntegerField
      DisplayLabel = 'Distr. Posterior'
      FieldName = 'DISTRIBUCION_POSTERIOR'
    end
    object xCentrosCosteCENTRO_COSTE_PADRE: TFIBStringField
      DisplayLabel = 'C. Coste Padre'
      FieldName = 'CENTRO_COSTE_PADRE'
      Size = 10
    end
    object xCentrosCosteID_P: TIntegerField
      DisplayLabel = 'ID Prom.'
      FieldName = 'ID_P'
    end
    object xCentrosCosteID_CC: TIntegerField
      DisplayLabel = 'ID C. C.'
      FieldName = 'ID_CC'
    end
    object xCentrosCosteID_CC_PADRE: TIntegerField
      DisplayLabel = 'ID C. C. Padre'
      FieldName = 'ID_CC_PADRE'
    end
  end
  object DSxCentrosCoste: TDataSource
    DataSet = xCentrosCoste
    Left = 122
    Top = 126
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 232
    Top = 23
  end
  object xCCDesde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM ANA_CENTROS_COSTE'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND'
      '  CENTRO_COSTE=?CENTRO_COSTE')
    UniDirectional = False
    Left = 322
    Top = 20
  end
  object DSxCCDesde: TDataSource
    DataSet = xCCDesde
    Left = 407
    Top = 20
  end
  object xCCHasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT TITULO FROM ANA_CENTROS_COSTE'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  PLAN_CONTABLE=?PLAN_CONTABLE AND'
      '  CENTRO_COSTE=?CENTRO_COSTE')
    UniDirectional = False
    Left = 320
    Top = 84
  end
  object DSxCCHasta: TDataSource
    DataSet = xCCHasta
    Left = 406
    Top = 84
  end
  object xListaAnaMayor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM N_CENTROS_COSTE_MAYOR(?EMPRESA,?EJERCICIO,?CANAL,'
      '?PLAN_CONTABLE,?CENTRO_COSTE,?DESDE,?HASTA,?MONEDA,?ALCANCE,'
      '?ID_CC)'
      'WHERE FECHA>=?DESDE'
      'ORDER BY FECHA,ASIENTO,LINEA,CENTRO_COSTE'
      '')
    UniDirectional = False
    DataSource = DSxCentrosCoste
    Left = 24
    Top = 76
    object xListaAnaMayorRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object xListaAnaMayorLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xListaAnaMayorFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xListaAnaMayorTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 100
    end
    object xListaAnaMayorDEBE: TFloatField
      DisplayLabel = 'Debe'
      FieldName = 'DEBE'
    end
    object xListaAnaMayorHABER: TFloatField
      DisplayLabel = 'Haber'
      FieldName = 'HABER'
    end
    object xListaAnaMayorSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
    object xListaAnaMayorD_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'D_NUMERO'
    end
    object xListaAnaMayorD_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'D_SERIE'
      Size = 10
    end
    object xListaAnaMayorD_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'D_FECHA'
    end
    object xListaAnaMayorASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object xListaAnaMayorCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xListaAnaMayorTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xListaAnaMayorCENTRO_COSTE: TFIBStringField
      DisplayLabel = 'Centro Coste'
      FieldName = 'CENTRO_COSTE'
      Size = 10
    end
    object xListaAnaMayorTITULO_CC: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_CC'
      Size = 60
    end
    object xListaAnaMayorCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xListaAnaMayorTITULO_CUENTA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_CUENTA'
      Size = 150
    end
    object xListaAnaMayorIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
  end
  object frDSxCentrosCoste: TfrDBDataSet
    DataSource = DSxCentrosCoste
    Left = 231
    Top = 126
  end
  object QMinCentroCoste: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select min(centro_coste) as minimo from ana_centros_coste'
      
        'where (empresa=?empresa) and (ejercicio=?ejercicio) and (canal=?' +
        'canal) and'
      '  (plan_contable=?plan_contable) ')
    Transaction = TLocal
    AutoTrans = True
    Left = 320
    Top = 256
  end
  object QMaxCentroCoste: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(centro_coste) as maximo from ana_centros_coste'
      
        'where (empresa=?empresa) and (ejercicio=?ejercicio) and (canal=?' +
        'canal) and'
      '  (plan_contable=?plan_contable) ')
    Transaction = TLocal
    AutoTrans = True
    Left = 416
    Top = 256
  end
  object xSaldos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from n_centros_coste_mayor_saldos(?empresa,?ejercicio,'
      
        '?canal,?plan_contable,?centro_coste,?desde,?hasta,?moneda,?alcan' +
        'ce,?id_cc)')
    UniDirectional = False
    DataSource = DSxCentrosCoste
    Left = 22
    Top = 184
    object xSaldosDEBE: TFloatField
      DisplayLabel = 'Debe'
      FieldName = 'DEBE'
    end
    object xSaldosHABER: TFloatField
      DisplayLabel = 'Haber'
      FieldName = 'HABER'
    end
    object xSaldosSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
    object xSaldosDEBE_A: TFloatField
      DisplayLabel = 'Debe a'
      FieldName = 'DEBE_A'
    end
    object xSaldosHABER_A: TFloatField
      DisplayLabel = 'Haber a'
      FieldName = 'HABER_A'
    end
    object xSaldosSALDO_A: TFloatField
      DisplayLabel = 'Saldo a'
      FieldName = 'SALDO_A'
    end
    object xSaldosSALDO_RNG: TFloatField
      DisplayLabel = 'Saldo RNG'
      FieldName = 'SALDO_RNG'
    end
  end
  object DSxSaldos: TDataSource
    DataSet = xSaldos
    Left = 120
    Top = 184
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 318
    Top = 136
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 410
    Top = 136
  end
  object xPlan: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT PLAN_CONTABLE,TITULO FROM ANA_PLAN_CONTABLE'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  PLAN_CONTABLE=?PLAN_CONTABLE')
    UniDirectional = False
    Left = 322
    Top = 196
    object xPlanTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xPlanPLAN_CONTABLE: TFIBStringField
      DisplayLabel = 'P.C.G.'
      FieldName = 'PLAN_CONTABLE'
      Size = 10
    end
  end
  object DSxPlan: TDataSource
    DataSet = xPlan
    Left = 410
    Top = 197
  end
  object xAcumulado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from n_centros_coste_mayor_acumulado(?empresa,?ejercici' +
        'o,'
      
        '?canal,?plan_contable,?centro_coste,?desde,?hasta,?moneda,?alcan' +
        'ce)')
    UniDirectional = False
    DataSource = DSxCentrosCoste
    Left = 22
    Top = 240
    object xAcumuladoDEBE: TFloatField
      DisplayLabel = 'Debe'
      FieldName = 'DEBE'
    end
    object xAcumuladoHABER: TFloatField
      DisplayLabel = 'Haber'
      FieldName = 'HABER'
    end
  end
  object DSxAcumulado: TDataSource
    DataSet = xAcumulado
    Left = 120
    Top = 240
  end
  object frxAnaMayor: TfrxHYReport
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
    OnBeforePrint = frxAnaMayorBeforePrint
    OnGetValue = frxAnaMayorGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 123
    Top = 19
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frDSxAcumulado: TfrDBDataSet
    DataSource = DSxAcumulado
    Left = 231
    Top = 239
  end
  object frDSxSaldos: TfrDBDataSet
    DataSource = DSxSaldos
    Left = 231
    Top = 183
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 168
    Top = 287
  end
end
