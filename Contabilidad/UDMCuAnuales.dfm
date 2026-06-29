object DMCuAnuales: TDMCuAnuales
  OldCreateOrder = False
  OnCreate = DMCuAnualesCreate
  OnDestroy = DMCuAnualesDestroy
  Left = 542
  Top = 133
  Height = 716
  Width = 667
  object QMCuentasAn: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_BALANCES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  BALANCE=?old_BALANCE AND '
      '  PERIODO=?old_PERIODO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_BALANCES'
      
        '  (DESDE,HASTA,ENTRADA,EMPRESA,CANAL,EJERCICIO,PERIODO,P_TITULO,' +
        'BALANCE,B_TITULO,TIPO,MONEDA,DIGITO_1,DIGITO_2,DIGITO_3,DIGITO_4' +
        ',DIGITO_5,PAIS,ARRASTRAR,COMENTARIO,FECHA,MULTI_CANAL)'
      'VALUES'
      
        '  (?DESDE,?HASTA,?ENTRADA,?EMPRESA,?CANAL,?EJERCICIO,?PERIODO,?P' +
        '_TITULO,?BALANCE,?B_TITULO,?TIPO,?MONEDA,?DIGITO_1,?DIGITO_2,?DI' +
        'GITO_3,?DIGITO_4,?DIGITO_5,?PAIS,?ARRASTRAR,?COMENTARIO,?FECHA,?' +
        'MULTI_CANAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_BALANCES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  BALANCE=?BALANCE AND '
      '  PERIODO=?PERIODO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_BALANCES'
      'WHERE'
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'PAIS=?PAIS'
      'ORDER BY BALANCE, PERIODO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_BALANCES'
      'SET'
      '  COMENTARIO=?COMENTARIO '
      '  ,FECHA=?FECHA'
      '  ,MULTI_CANAL=?MULTI_CANAL'
      '  ,ARRASTRAR=?ARRASTRAR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  BALANCE=?BALANCE AND '
      '  PERIODO=?PERIODO ')
    AfterOpen = QMCuentasAnAfterOpen
    AfterPost = QMCuentasAnAfterPost
    BeforePost = QMCuentasAnBeforePost
    OnNewRecord = QMCuentasAnNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'BALANCE '
      'PERIODO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_BALANCES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 56
    object QMCuentasAnEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCuentasAnCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCuentasAnEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCuentasAnPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMCuentasAnDESDE: TDateTimeField
      DisplayLabel = 'Desde'
      FieldName = 'DESDE'
    end
    object QMCuentasAnHASTA: TDateTimeField
      DisplayLabel = 'Hasta'
      FieldName = 'HASTA'
    end
    object QMCuentasAnBALANCE: TIntegerField
      DisplayLabel = 'Balance'
      FieldName = 'BALANCE'
    end
    object QMCuentasAnB_TITULO: TFIBStringField
      DisplayLabel = 'R. Titulo'
      FieldName = 'B_TITULO'
      Size = 40
    end
    object QMCuentasAnTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMCuentasAnP_TITULO: TFIBStringField
      DisplayLabel = 'P. Titulo'
      FieldName = 'P_TITULO'
      Size = 40
    end
    object QMCuentasAnMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      OnChange = QMCuentasAnMONEDAChange
      Size = 3
    end
    object QMCuentasAnENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMCuentasAnDIGITO_1: TFIBStringField
      DisplayLabel = 'Dig. 1'
      FieldName = 'DIGITO_1'
      Size = 1
    end
    object QMCuentasAnDIGITO_2: TFIBStringField
      DisplayLabel = 'Dig. 2'
      FieldName = 'DIGITO_2'
      Size = 1
    end
    object QMCuentasAnDIGITO_3: TFIBStringField
      DisplayLabel = 'Dig. 3'
      FieldName = 'DIGITO_3'
      Size = 1
    end
    object QMCuentasAnDIGITO_4: TFIBStringField
      DisplayLabel = 'Dig. 4'
      FieldName = 'DIGITO_4'
      Size = 1
    end
    object QMCuentasAnDIGITO_5: TFIBStringField
      DisplayLabel = 'Dig. 5'
      FieldName = 'DIGITO_5'
      Size = 1
    end
    object QMCuentasAnPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMCuentasAnARRASTRAR: TIntegerField
      DisplayLabel = 'Arrastrar'
      FieldName = 'ARRASTRAR'
    end
    object QMCuentasAnCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 100
    end
    object QMCuentasAnFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCuentasAnMULTI_CANAL: TFIBStringField
      DisplayLabel = 'Multi-Canal'
      FieldName = 'MULTI_CANAL'
      Size = 40
    end
  end
  object DSQMCuentasAn: TDataSource
    DataSet = QMCuentasAn
    Left = 208
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 64
    Top = 8
  end
  object frDBCuentasAn: TfrDBDataSet
    DataSource = DSQMCuentasAn
    Left = 368
    Top = 56
  end
  object frHYCuentasAn: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frHYCuentasAnGetValue
    OnBeforePrint = frHYCuentasAnEnterRect
    OnEnterRect = frHYCuentasAnEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 368
    Top = 8
    ReportForm = {19000000}
  end
  object xVerBalanceHaber: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    RefreshSQL.Strings = (
      'select * from ver_balances_contenido '
      
        '  where((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?ca' +
        'nal)and'
      
        '    (periodo=?periodo)and(balance=?balance)and(grupo=?grupo)and(' +
        'activo=1))'
      '  order by orden')
    SelectSQL.Strings = (
      'SELECT * FROM VER_BALANCES_CONTENIDO '
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'PERIODO = ?PERIODO AND'
      'BALANCE = ?BALANCE AND'
      'GRUPO = ?GRUPO AND'
      'ACTIVO = 1'
      'ORDER BY ORDEN')
    UniDirectional = False
    AfterScroll = xVerBalanceHaberAfterScroll
    Left = 64
    Top = 296
    object xVerBalanceHaberEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVerBalanceHaberCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVerBalanceHaberEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVerBalanceHaberPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object xVerBalanceHaberBALANCE: TIntegerField
      DisplayLabel = 'Balance'
      FieldName = 'BALANCE'
    end
    object xVerBalanceHaberCLAVE: TFIBStringField
      DisplayLabel = 'Clave'
      FieldName = 'CLAVE'
      Size = 15
    end
    object xVerBalanceHaberORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xVerBalanceHaberTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 100
    end
    object xVerBalanceHaberTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 1
    end
    object xVerBalanceHaberGRUPO: TFIBStringField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
      Size = 1
    end
    object xVerBalanceHaberANTERIOR: TFloatField
      DisplayLabel = 'Anterior'
      FieldName = 'ANTERIOR'
    end
    object xVerBalanceHaberACTUAL: TFloatField
      DisplayLabel = 'Actual'
      FieldName = 'ACTUAL'
    end
    object xVerBalanceHaberDIFERENCIA: TFloatField
      DisplayLabel = 'Diferencia'
      FieldName = 'DIFERENCIA'
    end
    object xVerBalanceHaberPORCENTUAL: TFloatField
      DisplayLabel = 'Porc.'
      FieldName = 'PORCENTUAL'
    end
    object xVerBalanceHaberACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
  end
  object xVerBalanceDebe: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT * FROM VER_BALANCES_CONTENIDO '
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'PERIODO = ?PERIODO AND'
      'BALANCE = ?BALANCE AND'
      'GRUPO = ?GRUPO AND'
      'ACTIVO = 1'
      'ORDER BY ORDEN')
    UniDirectional = False
    AfterScroll = xVerBalanceDebeAfterScroll
    Left = 64
    Top = 344
    object xVerBalanceDebeEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVerBalanceDebeCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVerBalanceDebeEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVerBalanceDebePERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object xVerBalanceDebeBALANCE: TIntegerField
      DisplayLabel = 'Balance'
      FieldName = 'BALANCE'
    end
    object xVerBalanceDebeCLAVE: TFIBStringField
      DisplayLabel = 'Clave'
      FieldName = 'CLAVE'
      Size = 15
    end
    object xVerBalanceDebeORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xVerBalanceDebeTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 100
    end
    object xVerBalanceDebeTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 1
    end
    object xVerBalanceDebeGRUPO: TFIBStringField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
      Size = 1
    end
    object xVerBalanceDebeANTERIOR: TFloatField
      DisplayLabel = 'Anterior'
      FieldName = 'ANTERIOR'
    end
    object xVerBalanceDebeACTUAL: TFloatField
      DisplayLabel = 'Actual'
      FieldName = 'ACTUAL'
    end
    object xVerBalanceDebeDIFERENCIA: TFloatField
      DisplayLabel = 'Diferencia'
      FieldName = 'DIFERENCIA'
    end
    object xVerBalanceDebePORCENTUAL: TFloatField
      DisplayLabel = 'Porc.'
      FieldName = 'PORCENTUAL'
    end
    object xVerBalanceDebeACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
  end
  object DSxHaber: TDataSource
    DataSet = xVerBalanceHaber
    Left = 208
    Top = 296
  end
  object DSxDebe: TDataSource
    DataSet = xVerBalanceDebe
    Left = 208
    Top = 344
  end
  object frDBHaber: TfrDBDataSet
    DataSource = DSxHaber
    Left = 368
    Top = 296
  end
  object frDBDebe: TfrDBDataSet
    DataSource = DSxDebe
    Left = 368
    Top = 344
  end
  object xVerBalanceDebeCuentas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT * FROM VER_BALANCES_CONTENIDO_CUENTAS'
      '  WHERE ((EMPRESA=?EMPRESA)AND'
      '                 (EJERCICIO=?EJERCICIO)AND'
      '                 (CANAL=?CANAL)AND'
      '                 (PERIODO=?PERIODO)AND'
      '                 (BALANCE=?BALANCE)AND'
      '                 (CLAVE=?CLAVE) AND PGC=?PGC)'
      'ORDER BY CUENTA')
    UniDirectional = False
    DataSource = DSxDebe
    BeforeOpen = SetPGCBeforeOpen
    BeforeScroll = xVerBalanceDebeCuentasBeforeScroll
    Left = 64
    Top = 440
    object xVerBalanceDebeCuentasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVerBalanceDebeCuentasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVerBalanceDebeCuentasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVerBalanceDebeCuentasPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object xVerBalanceDebeCuentasBALANCE: TIntegerField
      DisplayLabel = 'Balance'
      FieldName = 'BALANCE'
    end
    object xVerBalanceDebeCuentasCLAVE: TFIBStringField
      DisplayLabel = 'Clave'
      FieldName = 'CLAVE'
      Size = 15
    end
    object xVerBalanceDebeCuentasCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xVerBalanceDebeCuentasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 150
    end
    object xVerBalanceDebeCuentasANTERIOR: TFloatField
      DisplayLabel = 'Anterior'
      FieldName = 'ANTERIOR'
    end
    object xVerBalanceDebeCuentasACTUAL: TFloatField
      DisplayLabel = 'Actual'
      FieldName = 'ACTUAL'
    end
  end
  object xVerBalanceHaberCuentas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT * FROM VER_BALANCES_CONTENIDO_CUENTAS'
      '  WHERE ((EMPRESA=?EMPRESA)AND'
      '                 (EJERCICIO=?EJERCICIO)AND'
      '                 (CANAL=?CANAL)AND'
      '                 (PERIODO=?PERIODO)AND'
      '                 (BALANCE=?BALANCE)AND'
      '                 (CLAVE=?CLAVE) AND PGC=?PGC)'
      'ORDER BY CUENTA')
    UniDirectional = False
    DataSource = DSxHaber
    BeforeOpen = SetPGCBeforeOpen
    BeforeScroll = xVerBalanceHaberCuentasBeforeScroll
    Left = 64
    Top = 392
    object xVerBalanceHaberCuentasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVerBalanceHaberCuentasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVerBalanceHaberCuentasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVerBalanceHaberCuentasPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object xVerBalanceHaberCuentasBALANCE: TIntegerField
      DisplayLabel = 'Balance'
      FieldName = 'BALANCE'
    end
    object xVerBalanceHaberCuentasCLAVE: TFIBStringField
      DisplayLabel = 'Clave'
      FieldName = 'CLAVE'
      Size = 15
    end
    object xVerBalanceHaberCuentasCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xVerBalanceHaberCuentasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 150
    end
    object xVerBalanceHaberCuentasANTERIOR: TFloatField
      DisplayLabel = 'Anterior'
      FieldName = 'ANTERIOR'
    end
    object xVerBalanceHaberCuentasACTUAL: TFloatField
      DisplayLabel = 'Actual'
      FieldName = 'ACTUAL'
    end
  end
  object DSxVerBalanceHaberCuentas: TDataSource
    DataSet = xVerBalanceHaberCuentas
    Left = 208
    Top = 392
  end
  object DSxVerBalanceDebeCuentas: TDataSource
    DataSet = xVerBalanceDebeCuentas
    Left = 208
    Top = 440
  end
  object frDBxVerBalanceDebeCuentas: TfrDBDataSet
    DataSource = DSxVerBalanceDebeCuentas
    Left = 368
    Top = 440
  end
  object frDBxVerBalanceHaberCuentas: TfrDBDataSet
    DataSource = DSxVerBalanceHaberCuentas
    Left = 368
    Top = 392
  end
  object xMonedasListado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_MONEDAS'
      'WHERE'
      '  MONEDA=?MONEDA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_MONEDAS'
      'WHERE MONEDA = ?MONEDA')
    UniDirectional = False
    DataSource = DSQMCuentasAn
    Left = 64
    Top = 248
    object FIBStringField1: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object FIBStringField2: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object FIBStringField3: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO_MONEDA'
      Size = 3
    end
    object IntegerField1: TIntegerField
      DisplayLabel = 'Dec. Ver'
      FieldName = 'DEC_VER'
    end
    object IntegerField2: TIntegerField
      DisplayLabel = 'D. Calc.'
      FieldName = 'DEC_CALCULOS'
    end
    object IntegerField3: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
  end
  object DSxMonedasListado: TDataSource
    DataSet = xMonedasListado
    Left = 208
    Top = 248
  end
  object xVerBalanceDebeCtaFin: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT * FROM VER_BALANCES_CONTENIDO_CTA_FIN'
      '  WHERE ((EMPRESA=?EMPRESA)AND'
      '                 (EJERCICIO=?EJERCICIO)AND'
      '                 (CANAL=?CANAL)AND'
      '                 (PERIODO=?PERIODO)AND'
      '                 (BALANCE=?BALANCE)AND'
      '                 (CLAVE=?CLAVE)AND'
      '                 (CUENTA=?CUENTA) AND PGC=?PGC)'
      'ORDER BY CUENTA_FINAL')
    UniDirectional = False
    DataSource = DSxVerBalanceDebeCuentas
    BeforeOpen = SetPGCBeforeOpen
    Left = 64
    Top = 536
    object xVerBalanceDebeCtaFinEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVerBalanceDebeCtaFinEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVerBalanceDebeCtaFinCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVerBalanceDebeCtaFinPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object xVerBalanceDebeCtaFinBALANCE: TIntegerField
      DisplayLabel = 'Balance'
      FieldName = 'BALANCE'
    end
    object xVerBalanceDebeCtaFinCLAVE: TFIBStringField
      DisplayLabel = 'Clave'
      FieldName = 'CLAVE'
      Size = 15
    end
    object xVerBalanceDebeCtaFinCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xVerBalanceDebeCtaFinCUENTA_FINAL: TFIBStringField
      DisplayLabel = 'Cta. Final'
      FieldName = 'CUENTA_FINAL'
      Size = 15
    end
    object xVerBalanceDebeCtaFinTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 150
    end
    object xVerBalanceDebeCtaFinANTERIOR: TFloatField
      DisplayLabel = 'Anterior'
      FieldName = 'ANTERIOR'
    end
    object xVerBalanceDebeCtaFinACTUAL: TFloatField
      DisplayLabel = 'Actual'
      FieldName = 'ACTUAL'
    end
  end
  object xVerBalanceHaberCtaFin: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT * FROM VER_BALANCES_CONTENIDO_CTA_FIN'
      '  WHERE ((EMPRESA=?EMPRESA)AND'
      '                 (EJERCICIO=?EJERCICIO)AND'
      '                 (CANAL=?CANAL)AND'
      '                 (PERIODO=?PERIODO)AND'
      '                 (BALANCE=?BALANCE)AND'
      '                 (CLAVE=?CLAVE)AND'
      '                 (CUENTA=?CUENTA) AND PGC=?PGC)'
      'ORDER BY CUENTA_FINAL')
    UniDirectional = False
    DataSource = DSxVerBalanceHaberCuentas
    BeforeOpen = SetPGCBeforeOpen
    Left = 64
    Top = 488
    object xVerBalanceHaberCtaFinEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVerBalanceHaberCtaFinEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVerBalanceHaberCtaFinCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVerBalanceHaberCtaFinPERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object xVerBalanceHaberCtaFinBALANCE: TIntegerField
      DisplayLabel = 'Balance'
      FieldName = 'BALANCE'
    end
    object xVerBalanceHaberCtaFinCLAVE: TFIBStringField
      DisplayLabel = 'Clave'
      FieldName = 'CLAVE'
      Size = 15
    end
    object xVerBalanceHaberCtaFinCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xVerBalanceHaberCtaFinCUENTA_FINAL: TFIBStringField
      DisplayLabel = 'Cta. Final'
      FieldName = 'CUENTA_FINAL'
      Size = 15
    end
    object xVerBalanceHaberCtaFinTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 150
    end
    object xVerBalanceHaberCtaFinANTERIOR: TFloatField
      DisplayLabel = 'Anterior'
      FieldName = 'ANTERIOR'
    end
    object xVerBalanceHaberCtaFinACTUAL: TFloatField
      DisplayLabel = 'Actual'
      FieldName = 'ACTUAL'
    end
  end
  object DSxVerBalanceHaberCtaFin: TDataSource
    DataSet = xVerBalanceHaberCtaFin
    Left = 208
    Top = 488
  end
  object DSxVerBalanceDebeCtaFin: TDataSource
    DataSet = xVerBalanceDebeCtaFin
    Left = 208
    Top = 536
  end
  object frDBxVerBalanceDebeCtaFin: TfrDBDataSet
    DataSource = DSxVerBalanceDebeCtaFin
    Left = 368
    Top = 536
  end
  object frDBxVerBalanceHaberCtaFin: TfrDBDataSet
    DataSource = DSxVerBalanceHaberCtaFin
    Left = 368
    Top = 488
  end
  object frxHYCuentasAn: TfrxHYReport
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
    OnBeforePrint = frxHYCuentasAnBeforePrint
    OnGetValue = frxHYCuentasAnGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 464
    Top = 8
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object xNotas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'select * from ver_balances_contenido '
      
        '  where((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?ca' +
        'nal)and'
      
        '    (periodo=?periodo)and(balance=?balance)and(grupo=?grupo)and(' +
        'activo=1))'
      '  order by orden')
    SelectSQL.Strings = (
      
        'select * from c_dame_notas_balance (?EMPRESA, ?EJERCICIO, ?CANAL' +
        ','
      ' ?PERIODO,?BALANCE)  nn'
      'join con_notas n'
      'on nn.id_nota=n.id_nota')
    UniDirectional = False
    AfterScroll = xVerBalanceHaberAfterScroll
    Left = 64
    Top = 584
    object xNotasID_NOTA: TIntegerField
      DisplayLabel = 'ID Nota'
      FieldName = 'ID_NOTA'
    end
    object xNotasNUMERO_NOTA: TIntegerField
      DisplayLabel = 'Nro. Nota'
      FieldName = 'NUMERO_NOTA'
    end
    object xNotasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xNotasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xNotasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xNotasRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object xNotasASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object xNotasVISIBLE: TIntegerField
      DisplayLabel = 'Visible'
      FieldName = 'VISIBLE'
    end
    object xNotasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xNotasNOTA: TBlobField
      DisplayLabel = 'Nota'
      FieldName = 'NOTA'
      Size = 8
    end
  end
  object DSxNotas: TDataSource
    DataSet = xNotas
    Left = 208
    Top = 584
  end
  object frDBxNotas: TfrDBDataSet
    DataSource = DSxNotas
    Left = 368
    Top = 584
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 208
    Top = 8
  end
  object xComprobacionBalances: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'select * from ver_balances_contenido '
      
        '  where((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?ca' +
        'nal)and'
      
        '    (periodo=?periodo)and(balance=?balance)and(grupo=?grupo)and(' +
        'activo=1))'
      '  order by orden')
    SelectSQL.Strings = (
      'select * from comprueba_balances(?empresa,?ejercicio,?balance)')
    UniDirectional = False
    Left = 64
    Top = 632
    object xComprobacionBalancesLINEA: TFIBStringField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
      Size = 1000
    end
    object xComprobacionBalancesTIP: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIP'
    end
  end
  object DSxComprobacionBalances: TDataSource
    DataSet = xComprobacionBalances
    Left = 208
    Top = 632
  end
  object frDBxComprobacionBalances: TfrDBDataSet
    DataSource = DSxComprobacionBalances
    Left = 368
    Top = 632
  end
  object xVerBalanceHaberCuentasExportacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_BALANCES_CONTENIDO_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'PERIODO BETWEEN '#39'01'#39' AND '#39'12'#39' AND'
      'BALANCE = :BALANCE AND'
      'CLAVE = :CLAVE AND'
      'PGC = :PGC'
      'ORDER BY CUENTA, PERIODO')
    UniDirectional = False
    DataSource = DSxHaber
    BeforeOpen = SetPGCBeforeOpen
    BeforeScroll = xVerBalanceHaberCuentasBeforeScroll
    Left = 520
    Top = 392
  end
  object xVerBalanceDebeCuentasExportacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_BALANCES_CONTENIDO_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'PERIODO BETWEEN '#39'01'#39' AND '#39'12'#39' AND'
      'BALANCE = :BALANCE AND'
      'CLAVE = :CLAVE AND'
      'PGC = :PGC'
      'ORDER BY CUENTA, PERIODO')
    UniDirectional = False
    DataSource = DSxDebe
    BeforeOpen = SetPGCBeforeOpen
    BeforeScroll = xVerBalanceHaberCuentasBeforeScroll
    Left = 520
    Top = 440
  end
end
