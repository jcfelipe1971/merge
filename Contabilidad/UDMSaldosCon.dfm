object DMSaldosCon: TDMSaldosCon
  OldCreateOrder = False
  OnCreate = DMSaldosConCreate
  Left = 524
  Top = 192
  Height = 445
  Width = 532
  object QMConsultas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_CONSULTAS_CON'
      'WHERE'
      '  CONSULTA=?old_CONSULTA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_CONSULTAS_CON'
      '  (CONSULTA,TITULO,MODO)'
      'VALUES'
      '  (?CONSULTA,?TITULO,?MODO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CONSULTAS_CON'
      'WHERE'
      '  CONSULTA=?CONSULTA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_CONSULTAS_CON'
      'order by consulta')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CONSULTAS_CON'
      'SET'
      '  TITULO=?TITULO'
      '  ,MODO=?MODO  '
      'WHERE'
      '  CONSULTA=?CONSULTA ')
    AfterDelete = Graba
    AfterOpen = QMConsultasAfterOpen
    AfterPost = Graba
    BeforePost = QMConsultasBeforePost
    OnNewRecord = QMConsultasNewRecord
    ClavesPrimarias.Strings = (
      'CONSULTA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CONSULTAS_CON'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 22
    object QMConsultasCONSULTA: TIntegerField
      DisplayLabel = 'Consulta'
      FieldName = 'CONSULTA'
    end
    object QMConsultasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMConsultasMODO: TIntegerField
      DisplayLabel = 'Modo'
      FieldName = 'MODO'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 214
    Top = 20
  end
  object DSQMConsultas: TDataSource
    DataSet = QMConsultas
    Left = 114
    Top = 23
  end
  object QMConsultasDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_CONSULTAS_CON_DETALLE'
      'WHERE'
      '  CUENTA=?old_CUENTA AND '
      '  CONSULTA=?old_CONSULTA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_CONSULTAS_CON_DETALLE'
      '  (CONSULTA,CUENTA,TITULO,MULTIPLICADOR,PORCENT)'
      'VALUES'
      '  (?CONSULTA,?CUENTA,?TITULO,?MULTIPLICADOR,?PORCENT)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_CONSULTAS_CON_DETALLE'
      'WHERE'
      '  CUENTA=?CUENTA AND '
      '  CONSULTA=?CONSULTA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_CONSULTAS_CON_DETALLE'
      'where consulta=?consulta')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_CONSULTAS_CON_DETALLE'
      'SET'
      '  TITULO=?TITULO'
      '  ,MULTIPLICADOR=?MULTIPLICADOR '
      '  ,PORCENT=?PORCENT '
      'WHERE'
      '  CUENTA=?CUENTA AND '
      '  CONSULTA=?CONSULTA ')
    DataSource = DSQMConsultas
    AfterDelete = Graba
    AfterOpen = QMConsultasAfterOpen
    AfterPost = Graba
    OnNewRecord = QMConsultasDetNewRecord
    ClavesPrimarias.Strings = (
      'CUENTA '
      'CONSULTA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_CONSULTAS_CON_DETALLE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 114
    Top = 86
    object QMConsultasDetCONSULTA: TIntegerField
      DisplayLabel = 'Consulta'
      FieldName = 'CONSULTA'
    end
    object QMConsultasDetCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      OnChange = QMConsultasDetCUENTAChange
      Size = 15
    end
    object QMConsultasDetTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMConsultasDetMULTIPLICADOR: TIntegerField
      DisplayLabel = 'Multip.'
      FieldName = 'MULTIPLICADOR'
    end
    object QMConsultasDetPORCENT: TFloatField
      DisplayLabel = 'Porc.'
      FieldName = 'PORCENT'
      DisplayFormat = '###%'
    end
  end
  object DSQMConsultasDet: TDataSource
    DataSet = QMConsultasDet
    Left = 210
    Top = 86
  end
  object xCuentas: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT titulo FROM CON_CUENTAS'
      
        'where ((empresa=?empresa) and (ejercicio=?ejercicio) and (canal=' +
        '?canal)and'
      '(cuenta=?cuenta))')
    Transaction = TLocal
    AutoTrans = True
    Left = 339
    Top = 144
  end
  object DSxSalida: TDataSource
    DataSet = xSalida
    Left = 112
    Top = 176
  end
  object SPRecalcula: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure c_consultas_con (?empresa,?ejercicio,?canal,?u' +
        'suario,'
      '?consulta,?fecha,?borrado,?detalle)')
    Transaction = TLocal
    AutoTrans = True
    Left = 269
    Top = 201
  end
  object xSaldo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT sum(saldo) as saldos FROM TMP_CONSULTAS_CON'
      'where ((empresa=?empresa)and(ejercicio=?ejercicio)and'
      '(consulta=?consulta)and(usuario=?usuario)) ')
    UniDirectional = False
    AutoCalcFields = False
    Left = 40
    Top = 284
    object xSaldoSALDOS: TFloatField
      DisplayLabel = 'Saldos'
      FieldName = 'SALDOS'
    end
  end
  object DSxSaldo: TDataSource
    DataSet = xSaldo
    Left = 114
    Top = 282
  end
  object xCanales: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select * from emp_canales where((empresa=?empresa)and'
      '(ejercicio=?ejercicio)and(activo=1)) order by canal')
    Transaction = TLocal
    Left = 291
    Top = 21
  end
  object QElimina: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'delete from TMP_CONSULTAS_CON where((empresa=?empresa)and'
      '(ejercicio=?ejercicio)and(canal=?canal)and(usuario=?usuario))')
    Transaction = TLocal
    AutoTrans = True
    Left = 270
    Top = 145
  end
  object QEliminarTodo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'DELETE FROM TMP_CONSULTAS_CON ')
    Transaction = TLocal
    AutoTrans = True
    Left = 342
    Top = 201
  end
  object xSalida: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_CONSULTAS_CON'
      'where ((empresa=?empresa)and(ejercicio=?ejercicio)and'
      '(consulta=?consulta)and(usuario=?usuario))'
      'order by cuenta')
    UniDirectional = False
    Opciones = []
    AutoSQLdeVistas = False
    TableName = 'TMP_CONSULTAS_CON'
    Left = 40
    Top = 176
    object xSalidaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xSalidaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xSalidaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xSalidaUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object xSalidaCONSULTA: TIntegerField
      DisplayLabel = 'Consulta'
      FieldName = 'CONSULTA'
    end
    object xSalidaCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xSalidaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xSalidaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xSalidaDEBE: TFloatField
      DisplayLabel = 'Debe'
      FieldName = 'DEBE'
    end
    object xSalidaHABER: TFloatField
      DisplayLabel = 'Haber'
      FieldName = 'HABER'
    end
    object xSalidaSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 30
    Top = 76
  end
end
