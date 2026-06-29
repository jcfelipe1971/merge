object DMTercerosCuentas: TDMTercerosCuentas
  OldCreateOrder = False
  OnCreate = DMTercerosCuentasCreate
  Left = 494
  Top = 196
  Height = 272
  Width = 634
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 30
    Top = 31
  end
  object SPCueTerUna: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure c_cuentas_rellena_ter_0(?empresa,?ejercicio,?c' +
        'anal)')
    Transaction = TLocal
    AutoTrans = True
    Left = 124
    Top = 168
  end
  object SPCueTerTot: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure c_cuentas_rellena_ter')
    Transaction = TLocal
    AutoTrans = True
    Left = 214
    Top = 166
  end
  object SPBorraTot: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'delete from con_cuentas_terceros ')
    Transaction = TLocal
    AutoTrans = True
    Left = 382
    Top = 168
  end
  object QBorraUna: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'delete from con_cuentas_terceros'
      'where '
      '    ((empresa=?empresa) and'
      '    (ejercicio=?ejercicio) and'
      '    (canal=?canal))')
    Transaction = TLocal
    AutoTrans = True
    Left = 300
    Top = 167
  end
  object QMTercerosCuentas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from con_cuentas_terceros'
      
        'where((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?cana' +
        'l)and'
      '(cuenta=?cuenta)and(tercero=?tercero))')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CUENTAS_TERCEROS'
      'where((tercero=?tercero and ejercicio=?ejercicio))'
      'order by empresa,canal,cuenta')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSxTerceros
    AfterDelete = Graba
    AfterPost = Graba
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CUENTAS_TERCEROS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 170
    Top = 92
    object QMTercerosCuentasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTercerosCuentasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMTercerosCuentasCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMTercerosCuentasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMTercerosCuentasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMTercerosCuentasGESTION: TIntegerField
      DisplayLabel = 'Gestion'
      FieldName = 'GESTION'
    end
  end
  object DSQMTercerosCuentas: TDataSource
    DataSet = QMTercerosCuentas
    Left = 294
    Top = 92
  end
  object xTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS'
      'where ( tercero = ?tercero )')
    UniDirectional = False
    AfterOpen = xTercerosAfterOpen
    Left = 232
    Top = 23
    object xTercerosTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xTercerosNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xTercerosNIF: TFIBStringField
      DisplayLabel = 'NIF'
      FieldName = 'NIF'
    end
    object xTercerosDIR_COMPLETA: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_COMPLETA'
      Size = 69
    end
  end
  object DSxTerceros: TDataSource
    DataSet = xTerceros
    Left = 306
    Top = 24
  end
  object EFTerCuentas: TEntornoFind2000
    Empresa = 0
    Ejercicio = 0
    Canal = 0
    Tercero = 0
    Cliente = 0
    Pgc = 0
    Left = 40
    Top = 168
  end
  object SPAltaCuenta: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure c_cuentas_rellena_ter_1 (?tercero,?empresa,?ej' +
        'ercicio,'
      '?canal,?cuenta,?gestion)')
    Transaction = TLocal
    AutoTrans = True
    Left = 464
    Top = 168
  end
  object QGestCuentas: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT gestion '
      'FROM con_cuentas'
      'WHERE'
      '    ((empresa=?empresa) and'
      '    (ejercicio=?ejercicio) and'
      '    (canal=?canal) and'
      '    (cuenta=?cuenta))')
    Transaction = TLocal
    AutoTrans = True
    Left = 548
    Top = 168
  end
  object xVerSaldos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CUENTAS_TERCEROS_SALDOS'
      
        'where((tercero=?tercero)and(ejercicio=?ejercicio)and(periodo=?pe' +
        'riodo))'
      'order by empresa,canal,cuenta,periodo')
    UniDirectional = False
    DataSource = DSxPeriodos
    Left = 453
    Top = 86
    object xVerSaldosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVerSaldosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVerSaldosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVerSaldosCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xVerSaldosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xVerSaldosTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xVerSaldosGESTION: TIntegerField
      DisplayLabel = 'Gestion'
      FieldName = 'GESTION'
    end
    object xVerSaldosPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object xVerSaldosDEBE: TFloatField
      DisplayLabel = 'Debe'
      FieldName = 'DEBE'
    end
    object xVerSaldosHABER: TFloatField
      DisplayLabel = 'Haber'
      FieldName = 'HABER'
    end
    object xVerSaldosSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
  end
  object DSxVerSaldos: TDataSource
    DataSet = xVerSaldos
    Left = 523
    Top = 86
  end
  object xPeriodos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_PERIODOS  '
      'where((empresa=?empresa)and(ejercicio=?ejercicio))'
      'order by periodo')
    UniDirectional = False
    Left = 378
    Top = 24
  end
  object DSxPeriodos: TDataSource
    DataSet = xPeriodos
    Left = 452
    Top = 25
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 91
    Top = 31
  end
end
