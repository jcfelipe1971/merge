object DMAnaMayor: TDMAnaMayor
  OldCreateOrder = False
  OnCreate = DMAnaMayorCreate
  Left = 267
  Top = 203
  Height = 302
  Width = 501
  object xMayor: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM '
      'N_CENTROS_COSTE_MAYOR(?EMPRESA,?EJERCICIO,?CANAL,'
      '?PLAN_CONTABLE,?CENTRO_COSTE,?DESDE,?HASTA,?MONEDA,?ALCANCE,'
      '?ID_CC)'
      'WHERE FECHA>=?DESDE')
    UniDirectional = False
    DataSource = DSxCentrosCoste
    Opciones = []
    AutoSQLdeVistas = False
    Left = 96
    Top = 76
    object xMayorRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object xMayorLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object xMayorFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xMayorTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 100
    end
    object xMayorDEBE: TFloatField
      DisplayLabel = 'Debe'
      FieldName = 'DEBE'
    end
    object xMayorHABER: TFloatField
      DisplayLabel = 'Haber'
      FieldName = 'HABER'
    end
    object xMayorSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
    object xMayorD_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'D_NUMERO'
    end
    object xMayorD_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'D_SERIE'
      Size = 10
    end
    object xMayorD_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'D_FECHA'
    end
    object xMayorASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object xMayorCANAL: TIntegerField
      DisplayLabel = 'Can.'
      FieldName = 'CANAL'
    end
    object xMayorTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xMayorCENTRO_COSTE: TFIBStringField
      DisplayLabel = 'C. Coste'
      FieldName = 'CENTRO_COSTE'
      Size = 10
    end
    object xMayorTITULO_CC: TFIBStringField
      DisplayLabel = 'Titulo C. C.'
      FieldName = 'TITULO_CC'
      Size = 60
    end
    object xMayorCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xMayorTITULO_CUENTA: TFIBStringField
      DisplayLabel = 'T'#237'tulo Cta.'
      FieldName = 'TITULO_CUENTA'
      Size = 150
    end
    object xMayorIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
  end
  object xCentrosCoste: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ANA_CENTROS_COSTE'
      'WHERE'
      '  EMPRESA=?EMPRESA  AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PLAN_CONTABLE=?PLAN_CONTABLE')
    SelectSQL.Strings = (
      'SELECT * FROM ANA_CENTROS_COSTE'
      'WHERE'
      '   EMPRESA=?EMPRESA AND'
      '   EJERCICIO=?EJERCICIO AND'
      '   CANAL=?CANAL AND'
      '   PLAN_CONTABLE=?PLANCONTABLE'
      'ORDER BY CENTRO_COSTE')
    UniDirectional = False
    AfterOpen = xCentrosCosteAfterOpen
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'PLAN_CONTABLE'#13)
    Opciones = []
    AutoSQLdeVistas = False
    TableName = 'ANA_CENTROS_COSTE'
    Left = 28
    Top = 20
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
      DisplayLabel = 'Plan Contable'
      FieldName = 'PLAN_CONTABLE'
      Size = 10
    end
    object xCentrosCosteCENTRO_COSTE: TFIBStringField
      DisplayLabel = 'C. Coste'
      FieldName = 'CENTRO_COSTE'
      Size = 10
    end
    object xCentrosCosteTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
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
      DisplayLabel = 'ID P.'
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
    Left = 114
    Top = 20
  end
  object DSxMayor: TDataSource
    DataSet = xMayor
    Left = 178
    Top = 76
  end
  object xSaldos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from n_centros_coste_mayor_saldos(?empresa,?ejercicio,'
      
        '?canal,?plan_contable,?centro_coste,?desde,?hasta,?moneda,?alcan' +
        'ce,'
      '?id_cc)')
    UniDirectional = False
    DataSource = DSxCentrosCoste
    Left = 94
    Top = 136
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
    Left = 178
    Top = 136
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 316
    Top = 20
  end
  object xmayor_cc_periodo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM N_CENTROS_COSTE_MAYOR_PERIODO'
      
        '(?empresa,?ejercicio,?canal,?plancontable,?centrocoste,?moneda,?' +
        'alcance) ')
    UniDirectional = False
    DataSource = DSxCentrosCoste
    Left = 98
    Top = 196
    object xmayor_cc_periodoPERIODO: TFIBStringField
      DisplayLabel = 'Per'#237'odo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object xmayor_cc_periodoTIT_PER: TFIBStringField
      DisplayLabel = 'T'#237'tulo Per'#237'odo'
      FieldName = 'TIT_PER'
      Size = 40
    end
    object xmayor_cc_periodoDEBE: TFloatField
      DisplayLabel = 'Debe'
      FieldName = 'DEBE'
    end
    object xmayor_cc_periodoHABER: TFloatField
      DisplayLabel = 'Haber'
      FieldName = 'HABER'
    end
    object xmayor_cc_periodoSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
  end
  object DSxmayor_cc_periodo: TDataSource
    DataSet = xmayor_cc_periodo
    Left = 220
    Top = 196
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, SIGNO_MONEDA FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 320
    Top = 80
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 396
    Top = 80
  end
  object xCanales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select canal from emp_canales '
      'where'
      '  ((empresa=?empresa)and'
      '  (ejercicio=?ejercicio)and'
      '  (activo=1)) '
      'order by canal')
    UniDirectional = False
    Left = 320
    Top = 140
  end
  object QTipoAsiento: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select tipo from con_cuentas_asientos where '
      'empresa=?empresa and ejercicio=?ejercicio and '
      'canal=?canal and ric=?ric')
    Transaction = TLocal
    AutoTrans = True
    Left = 398
    Top = 144
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 380
    Top = 20
  end
end
