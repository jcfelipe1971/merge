object DMMayor: TDMMayor
  OldCreateOrder = False
  OnCreate = DMMayorCreate
  Left = 846
  Top = 371
  Height = 302
  Width = 501
  object xMayor: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT * FROM  C_CUENTAS_MAYOR('
      
        '?EMPRESA, ?EJERCICIO, ?CANAL, ?CUENTA, ?DESDE, ?HASTA, ?MONEDA, ' +
        '?ALCANCE, ?D1, ?D2, ?D3, ?D4, ?D5)'
      'WHERE'
      'FECHA >= ?DESDE ')
    UniDirectional = False
    DataSource = DSxCuentas
    Opciones = []
    AutoSQLdeVistas = False
    Left = 56
    Top = 72
    object xMayorEMPRESA_R: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xMayorEJERCICIO_R: TIntegerField
      DisplayLabel = 'Ejer. R.'
      FieldName = 'EJERCICIO'
    end
    object xMayorCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xMayorRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object xMayorASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object xMayorLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xMayorFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xMayorDEBE: TFloatField
      DisplayLabel = 'Debe'
      FieldName = 'DEBE'
    end
    object xMayorSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
    object xMayorHABER: TFloatField
      DisplayLabel = 'Haber'
      FieldName = 'HABER'
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
    object xMayorTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 100
    end
    object xMayorTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xMayorTIPO_ASIENTO_KRI: TFIBStringField
      DisplayLabel = 'Tipo Kri'
      FieldName = 'TIPO_ASIENTO_KRI'
      Size = 3
    end
    object xMayorDIGITO_1: TFIBStringField
      DisplayLabel = 'D1'
      FieldName = 'DIGITO_1'
      Size = 3
    end
    object xMayorDIGITO_2: TFIBStringField
      DisplayLabel = 'D2'
      FieldName = 'DIGITO_2'
      Size = 3
    end
    object xMayorDIGITO_3: TFIBStringField
      DisplayLabel = 'D3'
      FieldName = 'DIGITO_3'
      Size = 3
    end
    object xMayorDIGITO_4: TFIBStringField
      DisplayLabel = 'D4'
      FieldName = 'DIGITO_4'
      Size = 3
    end
    object xMayorDIGITO_5: TFIBStringField
      DisplayLabel = 'D5'
      FieldName = 'DIGITO_5'
      Size = 3
    end
    object xMayorPUNTEO: TIntegerField
      DisplayLabel = 'Punteo'
      FieldName = 'PUNTEO'
    end
    object xMayorFECHA_PUNTEO: TDateTimeField
      DisplayLabel = 'Fec. Punteo'
      FieldName = 'FECHA_PUNTEO'
    end
  end
  object xCuentas: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT CUENTA, CANAL, TITULO, TIPO, SUPERIOR'
      'FROM CON_CUENTAS'
      'WHERE '
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'RESTRICCION=0 AND'
      'PGC=?PGC'
      'ORDER BY CUENTA')
    UniDirectional = False
    AfterOpen = xCuentasAfterOpen
    AfterScroll = xCuentasAfterScroll
    BeforeOpen = xCuentasBeforeOpen
    Opciones = []
    AutoSQLdeVistas = False
    TableName = 'CON_CUENTAS'
    Left = 56
    Top = 24
    object xCuentasCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xCuentasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xCuentasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      DisplayWidth = 150
      FieldName = 'TITULO'
      Size = 150
    end
    object xCuentasTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object xCuentasSUPERIOR: TFIBStringField
      DisplayLabel = 'Superior'
      FieldName = 'SUPERIOR'
      Size = 15
    end
  end
  object DSxCuentas: TDataSource
    DataSet = xCuentas
    Left = 184
    Top = 24
  end
  object DSxMayor: TDataSource
    DataSet = xMayor
    Left = 184
    Top = 72
  end
  object xSaldos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from c_cuentas_mayor_saldos(?empresa,?ejercicio,'
      '?canal,?cuenta,?desde,?hasta,?moneda,?alcance)')
    UniDirectional = False
    DataSource = DSxCuentas
    Left = 56
    Top = 120
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
    object xSaldosHABER_A: TFloatField
      DisplayLabel = 'Haber a'
      FieldName = 'HABER_A'
    end
    object xSaldosDEBE_A: TFloatField
      DisplayLabel = 'Debe a'
      FieldName = 'DEBE_A'
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
    Left = 184
    Top = 120
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 320
    Top = 24
  end
  object xmayor_cuenta_periodo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM C_CUENTAS_MAYOR_PERIODO'
      '(?empresa,?ejercicio,?canal,?cuenta,?moneda,?alcance) ')
    UniDirectional = False
    DataSource = DSxCuentas
    Left = 56
    Top = 168
    object xmayor_cuenta_periodoPERIODO: TFIBStringField
      DisplayLabel = 'Per'#237'odo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object xmayor_cuenta_periodoTIT_PER: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TIT_PER'
      Size = 40
    end
    object xmayor_cuenta_periodoDEBE: TFloatField
      DisplayLabel = 'Debe'
      FieldName = 'DEBE'
    end
    object xmayor_cuenta_periodoHABER: TFloatField
      DisplayLabel = 'Haber'
      FieldName = 'HABER'
    end
    object xmayor_cuenta_periodoSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
  end
  object DSxmayor_cuenta_periodo: TDataSource
    DataSet = xmayor_cuenta_periodo
    Left = 184
    Top = 168
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
    Left = 56
    Top = 216
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 184
    Top = 216
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 384
    Top = 24
  end
end
