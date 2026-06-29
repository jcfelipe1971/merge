object ZDMInteresesAnticipos: TZDMInteresesAnticipos
  OldCreateOrder = False
  OnCreate = DMAnticiposCreate
  Left = 637
  Top = 44
  Height = 341
  Width = 387
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 252
    Top = 22
  end
  object QMAnticipos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_INTERES_ANTICIPO_CAB'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO Z_INTERES_ANTICIPO_CAB'
      
        '  (CONTABILIZAR,REGISTRO,ID,EMPRESA,EJERCICIO,CANAL,CLIENTE,ESTA' +
        'DO,INTERES,FECHA_CORTE,ASIENTO,CUENTA,C_CONTRAPARTIDA,CUENTA_PGC' +
        ',C_CONTRAPARTIDA_PGC)'
      'VALUES'
      
        '  (?CONTABILIZAR,?REGISTRO,?ID,?EMPRESA,?EJERCICIO,?CANAL,?CLIEN' +
        'TE,?ESTADO,?INTERES,?FECHA_CORTE,?ASIENTO,?CUENTA,?C_CONTRAPARTI' +
        'DA,?CUENTA_PGC,?C_CONTRAPARTIDA_PGC)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_INTERES_ANTICIPO_CAB'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_INTERES_ANTICIPO_CAB'
      'where empresa=?empresa and'
      'ejercicio=?ejercicio and'
      'canal=?canal'
      'order by id')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_INTERES_ANTICIPO_CAB'
      'SET'
      '  CONTABILIZAR=?CONTABILIZAR '
      '  ,REGISTRO=?REGISTRO '
      '  ,EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,CLIENTE=?CLIENTE '
      '  ,ESTADO=?ESTADO '
      '  ,INTERES=?INTERES '
      '  ,FECHA_CORTE=?FECHA_CORTE '
      '  ,ASIENTO=?ASIENTO '
      '  ,CUENTA=?CUENTA '
      '  ,C_CONTRAPARTIDA=?C_CONTRAPARTIDA '
      '  ,CUENTA_PGC=?CUENTA_PGC '
      '  ,C_CONTRAPARTIDA_PGC=?C_CONTRAPARTIDA_PGC '
      'WHERE'
      '  ID=?ID ')
    AfterDelete = Graba
    AfterOpen = QMAnticiposAfterOpen
    AfterPost = Graba
    AfterScroll = QMAnticiposAfterScroll
    OnNewRecord = QMAnticiposNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_INTERES_ANTICIPO_CAB'
    UpdateTransaction = TLocal
    Left = 35
    Top = 18
    object QMAnticiposID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
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
    object QMAnticiposCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      OnChange = QMAnticiposCLIENTEChange
    end
    object QMAnticiposESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMAnticiposINTERES: TFloatField
      DisplayLabel = 'Interes'
      FieldName = 'INTERES'
    end
    object QMAnticiposFECHA_CORTE: TDateTimeField
      DisplayLabel = 'Fec. Corte'
      FieldName = 'FECHA_CORTE'
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
    object QMAnticiposCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMAnticiposC_CONTRAPARTIDA: TFIBStringField
      DisplayLabel = 'Cta. Contrap.'
      FieldName = 'C_CONTRAPARTIDA'
      OnChange = QMAnticiposC_CONTRAPARTIDAChange
      Size = 15
    end
    object QMAnticiposCUENTA_PGC: TIntegerField
      DisplayLabel = 'PGC Cuenta'
      FieldName = 'CUENTA_PGC'
    end
    object QMAnticiposC_CONTRAPARTIDA_PGC: TIntegerField
      DisplayLabel = 'PGC Cta. Contrap.'
      FieldName = 'C_CONTRAPARTIDA_PGC'
    end
    object QMAnticiposASIENTO_VISIBLE: TBooleanField
      DisplayLabel = 'Asiento'
      FieldKind = fkCalculated
      FieldName = 'ASIENTO_VISIBLE'
      OnGetText = QMAnticiposASIENTO_VISIBLEGetText
      Calculated = True
    end
    object QMAnticiposIMPORTE_INTERES: TFloatField
      DisplayLabel = 'Importe Int.'
      FieldName = 'IMPORTE_INTERES'
    end
    object QMAnticiposTotalInteres: TIntegerField
      DisplayLabel = 'Total Interes'
      FieldKind = fkCalculated
      FieldName = 'TotalInteres'
      Calculated = True
    end
  end
  object DSQMAnticipos: TDataSource
    DataSet = QMAnticipos
    Left = 128
    Top = 20
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CARTERA_ANTICIPOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  ANTICIPO=?old_ANTICIPO AND '
      '  TIPO_TERCERO=?old_TIPO_TERCERO ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CARTERA_ANTICIPOS'
      
        '  (FECHA,CANTIDAD,CUENTA_CLI_PRO_PGC,C_CONTRAPARTIDA_PGC,ASIENTO' +
        ',REGISTRO,COD_CLI_PRO,ANTICIPO,ID_CAB_Z_TALONES,Z_BANCO,CONTABIL' +
        'IZAR,CANAL,EJERCICIO,EMPRESA,MARCADO,PAGADO,Z_DESCRIPCION,C_CONT' +
        'RAPARTIDA,CUENTA_CLI_PRO,TIPO_TERCERO,Z_TALON,Z_INTERES_ANTICIPO' +
        ',Z_FECHA_CORTE,Z_IMPORTE_INTERES,Z_MARCADO,Z_ID_INTERES_ANTICIPO' +
        ')'
      'VALUES'
      
        '  (?FECHA,?CANTIDAD,?CUENTA_CLI_PRO_PGC,?C_CONTRAPARTIDA_PGC,?AS' +
        'IENTO,?REGISTRO,?COD_CLI_PRO,?ANTICIPO,?ID_CAB_Z_TALONES,?Z_BANC' +
        'O,?CONTABILIZAR,?CANAL,?EJERCICIO,?EMPRESA,?MARCADO,?PAGADO,?Z_D' +
        'ESCRIPCION,?C_CONTRAPARTIDA,?CUENTA_CLI_PRO,?TIPO_TERCERO,?Z_TAL' +
        'ON,?Z_INTERES_ANTICIPO,?Z_FECHA_CORTE,?Z_IMPORTE_INTERES,?Z_MARC' +
        'ADO,?Z_ID_INTERES_ANTICIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CARTERA_ANTICIPOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  ANTICIPO=?ANTICIPO AND '
      '  TIPO_TERCERO=?TIPO_TERCERO ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CARTERA_ANTICIPOS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CARTERA_ANTICIPOS'
      'SET'
      '  FECHA=?FECHA '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,CUENTA_CLI_PRO_PGC=?CUENTA_CLI_PRO_PGC '
      '  ,C_CONTRAPARTIDA_PGC=?C_CONTRAPARTIDA_PGC '
      '  ,ASIENTO=?ASIENTO '
      '  ,REGISTRO=?REGISTRO '
      '  ,COD_CLI_PRO=?COD_CLI_PRO '
      '  ,ID_CAB_Z_TALONES=?ID_CAB_Z_TALONES '
      '  ,Z_BANCO=?Z_BANCO '
      '  ,CONTABILIZAR=?CONTABILIZAR '
      '  ,MARCADO=?MARCADO '
      '  ,PAGADO=?PAGADO '
      '  ,Z_DESCRIPCION=?Z_DESCRIPCION '
      '  ,C_CONTRAPARTIDA=?C_CONTRAPARTIDA '
      '  ,CUENTA_CLI_PRO=?CUENTA_CLI_PRO '
      '  ,Z_TALON=?Z_TALON '
      '  ,Z_INTERES_ANTICIPO=?Z_INTERES_ANTICIPO '
      '  ,Z_FECHA_CORTE=?Z_FECHA_CORTE '
      '  ,Z_IMPORTE_INTERES=?Z_IMPORTE_INTERES '
      '  ,Z_MARCADO=?Z_MARCADO '
      '  ,Z_ID_INTERES_ANTICIPO=?Z_ID_INTERES_ANTICIPO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  ANTICIPO=?ANTICIPO AND '
      '  TIPO_TERCERO=?TIPO_TERCERO ')
    DataSource = DSQMAnticipos
    AfterPost = QMDetalleAfterPost
    BeforeEdit = QMDetalleBeforeEdit
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'ANTICIPO '
      'TIPO_TERCERO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CARTERA_ANTICIPOS'
    BloqOpt = True
    UpdateTransaction = TLocal
    AutoCommit = True
    Left = 34
    Top = 78
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetalleANTICIPO: TIntegerField
      DisplayLabel = 'Anticipo'
      FieldName = 'ANTICIPO'
    end
    object QMDetalleTIPO_TERCERO: TFIBStringField
      DisplayLabel = 'Tipo Ter.'
      FieldName = 'TIPO_TERCERO'
      Size = 3
    end
    object QMDetalleCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cod. Cli./Pro.'
      FieldName = 'COD_CLI_PRO'
    end
    object QMDetalleCUENTA_CLI_PRO: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA_CLI_PRO'
      Size = 15
    end
    object QMDetalleC_CONTRAPARTIDA: TFIBStringField
      DisplayLabel = 'Cta. Contrapartida'
      FieldName = 'C_CONTRAPARTIDA'
      Size = 15
    end
    object QMDetalleCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMDetalleCONTABILIZAR: TIntegerField
      DisplayLabel = 'Contab.'
      FieldName = 'CONTABILIZAR'
    end
    object QMDetalleREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMDetalleASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object QMDetalleFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMDetalleID_CAB_Z_TALONES: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CAB_Z_TALONES'
    end
    object QMDetalleMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
    end
    object QMDetallePAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object QMDetalleZ_TALON: TFIBStringField
      DisplayLabel = 'Talon'
      FieldName = 'Z_TALON'
      Size = 15
    end
    object QMDetalleZ_DESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'Z_DESCRIPCION'
      Size = 60
    end
    object QMDetalleZ_BANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'Z_BANCO'
    end
    object QMDetalleC_CONTRAPARTIDA_PGC: TIntegerField
      DisplayLabel = 'PGC. Cta. Contrapartida'
      FieldName = 'C_CONTRAPARTIDA_PGC'
    end
    object QMDetalleCUENTA_CLI_PRO_PGC: TIntegerField
      DisplayLabel = 'PGC Cuenta'
      FieldName = 'CUENTA_CLI_PRO_PGC'
    end
    object QMDetalleZ_INTERES_ANTICIPO: TFloatField
      DisplayLabel = 'Intereses Ant.'
      FieldName = 'Z_INTERES_ANTICIPO'
    end
    object QMDetalleZ_FECHA_CORTE: TDateTimeField
      DisplayLabel = 'Fec. Corte'
      FieldName = 'Z_FECHA_CORTE'
    end
    object QMDetalleZ_IMPORTE_INTERES: TFloatField
      DisplayLabel = 'Importe Int.'
      FieldName = 'Z_IMPORTE_INTERES'
    end
    object QMDetalleZ_MARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'Z_MARCADO'
    end
    object QMDetalleZ_ID_INTERES_ANTICIPO: TIntegerField
      DisplayLabel = 'ID Interes Ant.'
      FieldName = 'Z_ID_INTERES_ANTICIPO'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 128
    Top = 76
  end
  object xClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_CLIENTES'
      
        '  where empresa=?empresa and ejercicio=?ejercicio and canal=?can' +
        'al and'
      '             cliente=?cod_cli_pro')
    UniDirectional = False
    DataSource = DSQMAnticipos
    Left = 34
    Top = 136
  end
  object DSxClientes: TDataSource
    DataSet = xClientes
    Left = 130
    Top = 138
  end
  object SPContabilizar: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'update Z_INTERES_ANTICIPO_CAB set contabilizar=?estado'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' '
      'and id=?anticipo')
    Transaction = TLocal
    AutoTrans = True
    Left = 226
    Top = 91
  end
  object SPCalculoInteres: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure z_calcula_interes(?EMPRESA,?EJERCICIO,?CANAL,?' +
        'ID,?INTERES,?FECHA_CORTE,?COD_CLI_PRO)')
    Transaction = TLocal
    AutoTrans = True
    Left = 234
    Top = 151
  end
  object xCuenta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
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
      
        '  where empresa=?empresa and ejercicio=?ejercicio and canal=?can' +
        'al and'
      '             cuenta=?c_contrapartida')
    UniDirectional = False
    DataSource = DSQMAnticipos
    Left = 42
    Top = 190
  end
  object DSxCuenta: TDataSource
    DataSet = xCuenta
    Left = 140
    Top = 192
  end
  object SPMarcaTodos: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 66
    Top = 255
  end
  object SPTotalInteres: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 194
    Top = 255
  end
end
