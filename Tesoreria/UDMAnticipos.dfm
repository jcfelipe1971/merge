object DMAnticipos: TDMAnticipos
  OldCreateOrder = False
  OnCreate = DMAnticiposCreate
  Left = 466
  Top = 221
  Height = 370
  Width = 525
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 224
    Top = 24
  end
  object QMAnticipos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CARTERA_ANTICIPOS'
      'WHERE'
      '  TIPO_TERCERO=?old_TIPO_TERCERO AND '
      '  ANTICIPO=?old_ANTICIPO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CARTERA_ANTICIPOS'
      
        '  (EMPRESA,EJERCICIO,CANAL,ANTICIPO,TIPO_TERCERO,C_CONTRAPARTIDA' +
        ',CANTIDAD,COD_CLI_PRO,FECHA,CONTABILIZAR,REGISTRO,ASIENTO,CUENTA' +
        '_CLI_PRO,TIPO_ASIENTO, ENTRADA, CREA_CARTERA_NEGATIVA)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?ANTICIPO,?TIPO_TERCERO,?C_CONTRAP' +
        'ARTIDA,?CANTIDAD,?COD_CLI_PRO,?FECHA,?CONTABILIZAR,?REGISTRO,?AS' +
        'IENTO,?CUENTA_CLI_PRO,?TIPO_ASIENTO, ?ENTRADA, ?CREA_CARTERA_NEG' +
        'ATIVA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CARTERA_ANTICIPOS'
      'WHERE'
      '  TIPO_TERCERO=?TIPO_TERCERO AND '
      '  ANTICIPO=?ANTICIPO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CARTERA_ANTICIPOS'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'TIPO_TERCERO=?TIPO_TERCERO'
      'ORDER BY ANTICIPO'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CARTERA_ANTICIPOS'
      'SET'
      '  C_CONTRAPARTIDA=?C_CONTRAPARTIDA '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,COD_CLI_PRO=?COD_CLI_PRO '
      '  ,FECHA=?FECHA '
      '  ,CONTABILIZAR=?CONTABILIZAR '
      '  ,REGISTRO=?REGISTRO '
      '  ,ASIENTO=?ASIENTO '
      '  ,CUENTA_CLI_PRO=?CUENTA_CLI_PRO '
      '  ,TIPO_ASIENTO=?TIPO_ASIENTO'
      '  ,ENTRADA=?ENTRADA'
      '  ,CREA_CARTERA_NEGATIVA=?CREA_CARTERA_NEGATIVA'
      'WHERE'
      '  TIPO_TERCERO=?TIPO_TERCERO AND '
      '  ANTICIPO=?ANTICIPO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterOpen = QMAnticiposAfterOpen
    BeforeClose = QMAnticiposBeforeClose
    OnNewRecord = QMAnticiposNewRecord
    ClavesPrimarias.Strings = (
      'TIPO_TERCERO '
      'ANTICIPO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CARTERA_ANTICIPOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 24
    object QMAnticiposEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAnticiposEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMAnticiposCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMAnticiposANTICIPO: TIntegerField
      DisplayLabel = 'Anticipo'
      FieldName = 'ANTICIPO'
    end
    object QMAnticiposTIPO_TERCERO: TFIBStringField
      DisplayLabel = 'Tipo Terc.'
      FieldName = 'TIPO_TERCERO'
      Size = 3
    end
    object QMAnticiposCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cod. Cli/Pro'
      FieldName = 'COD_CLI_PRO'
      OnChange = QMAnticiposCOD_CLI_PROChange
    end
    object QMAnticiposCUENTA_CLI_PRO: TFIBStringField
      DisplayLabel = 'Cuenta Cli/Pro'
      FieldName = 'CUENTA_CLI_PRO'
      Size = 15
    end
    object QMAnticiposC_CONTRAPARTIDA: TFIBStringField
      DisplayLabel = 'Cuenta Contrapartida'
      FieldName = 'C_CONTRAPARTIDA'
      OnChange = QMAnticiposC_CONTRAPARTIDAChange
      Size = 15
    end
    object QMAnticiposCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMAnticiposCONTABILIZAR: TIntegerField
      DisplayLabel = 'Contabilizar'
      FieldName = 'CONTABILIZAR'
    end
    object QMAnticiposREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMAnticiposASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object QMAnticiposFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMAnticiposTIPO_ASIENTO: TFIBStringField
      DisplayLabel = 'Tipo Asiento'
      FieldName = 'TIPO_ASIENTO'
      OnChange = QMAnticiposTIPO_ASIENTOChange
      Size = 3
    end
    object QMAnticiposASIENTO_VISIBLE: TStringField
      DisplayLabel = 'Asiento Visible'
      FieldKind = fkCalculated
      FieldName = 'ASIENTO_VISIBLE'
      OnGetText = QMAnticiposASIENTO_VISIBLEGetText
      Calculated = True
    end
    object QMAnticiposCUENTA_CLI_PRO_PGC: TIntegerField
      DisplayLabel = 'PGC. Cta. Cli./Prov.'
      FieldName = 'CUENTA_CLI_PRO_PGC'
    end
    object QMAnticiposC_CONTRAPARTIDA_PGC: TIntegerField
      DisplayLabel = 'PGC Cta. Contrapartida'
      FieldName = 'C_CONTRAPARTIDA_PGC'
    end
    object QMAnticiposENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMAnticiposID_CARTERA: TIntegerField
      DisplayLabel = 'ID Cartera'
      FieldName = 'ID_CARTERA'
    end
    object QMAnticiposCREA_CARTERA_NEGATIVA: TIntegerField
      DisplayLabel = 'Crea Cartera Negativa'
      FieldName = 'CREA_CARTERA_NEGATIVA'
    end
  end
  object DSQMAnticipos: TDataSource
    DataSet = QMAnticipos
    Left = 136
    Top = 24
  end
  object xClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_CLIENTES'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'CLIENTE=?COD_CLI_PRO')
    UniDirectional = False
    DataSource = DSQMAnticipos
    Left = 40
    Top = 120
  end
  object xCuenta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  CUENTA=?CUENTA ')
    SelectSQL.Strings = (
      'SELECT TITULO FROM CON_CUENTAS'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND'
      'CUENTA=?C_CONTRAPARTIDA AND'
      'PGC=?C_CONTRAPARTIDA_PGC')
    UniDirectional = False
    DataSource = DSQMAnticipos
    Left = 40
    Top = 72
  end
  object xProveedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_PROVEEDORES'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND '
      'CANAL=?CANAL AND'
      'PROVEEDOR=?COD_CLI_PRO')
    UniDirectional = False
    DataSource = DSQMAnticipos
    Left = 40
    Top = 168
  end
  object xAcreedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_ACREEDORES'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'ACREEDOR=?COD_CLI_PRO')
    UniDirectional = False
    DataSource = DSQMAnticipos
    Left = 40
    Top = 216
  end
  object DSxClientes: TDataSource
    DataSet = xClientes
    Left = 136
    Top = 120
  end
  object DSxProveedores: TDataSource
    DataSet = xProveedores
    Left = 136
    Top = 168
  end
  object DSxAcreedores: TDataSource
    DataSet = xAcreedores
    Left = 136
    Top = 216
  end
  object DSxCuenta: TDataSource
    DataSet = xCuenta
    Left = 136
    Top = 72
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 304
    Top = 24
  end
  object QSaldo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT SALDO FROM CON_CUENTAS_SALDOS'
      'WHERE '
      'EMPRESA=?EMPRESA '
      'AND EJERCICIO=?EJERCICIO '
      'AND CANAL=?CANAL '
      'AND CUENTA=?CUENTA_CLI_PRO'
      'AND PERIODO='#39'20'#39' /*dji lrk kri - quiz'#225's deba ser 19*/'
      'AND CUENTA_PGC=?CUENTA_CLI_PRO_PGC')
    UniDirectional = False
    DataSource = DSQMAnticipos
    Left = 40
    Top = 264
    object QSaldoSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
  end
  object DSQSaldo: TDataSource
    DataSet = QSaldo
    Left = 136
    Top = 264
  end
end
