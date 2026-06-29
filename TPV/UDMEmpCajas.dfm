object DMEmpCajas: TDMEmpCajas
  OldCreateOrder = False
  OnCreate = DMEmpCajasCreate
  Left = 411
  Top = 265
  Height = 361
  Width = 431
  object QMEmpCajas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CAJAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  CAJA=?old_CAJA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CAJAS'
      
        '  (CAJA,SERIE,EMPRESA,EJERCICIO,CANAL,TITULO,ACTIVA,ALMACEN,AGEN' +
        'TE,PIDE_USER,PIDE_CLAVE,PIDE_AGE,PEDIR_A_PROV)'
      'VALUES'
      
        '  (?CAJA,?SERIE,?EMPRESA,?EJERCICIO,?CANAL,?TITULO,?ACTIVA,?ALMA' +
        'CEN,?AGENTE,?PIDE_USER,?PIDE_CLAVE,?PIDE_AGE,?PEDIR_A_PROV)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CAJAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  CAJA=?CAJA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CAJAS'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND '
      '((SERIE=?SERIE) OR (CAST(?SERIE AS VARCHAR(10)) = '#39#39'))'
      'ORDER BY CAJA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CAJAS'
      'SET'
      '  TITULO=?TITULO '
      '  ,ACTIVA=?ACTIVA '
      '  ,ALMACEN=?ALMACEN '
      '  ,AGENTE=?AGENTE '
      '  ,PIDE_USER=?PIDE_USER '
      '  ,PIDE_CLAVE=?PIDE_CLAVE '
      '  ,PIDE_AGE=?PIDE_AGE '
      '  ,PEDIR_A_PROV=?PEDIR_A_PROV '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  CAJA=?CAJA ')
    AfterOpen = QMEmpCajasAfterOpen
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'CAJA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CAJAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMEmpCajasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEmpCajasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMEmpCajasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMEmpCajasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMEmpCajasCAJA: TIntegerField
      DisplayLabel = 'Caja'
      FieldName = 'CAJA'
    end
    object QMEmpCajasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMEmpCajasACTIVA: TIntegerField
      DisplayLabel = 'Act.'
      FieldName = 'ACTIVA'
    end
    object QMEmpCajasALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMEmpCajasAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMEmpCajasPIDE_USER: TIntegerField
      DisplayLabel = 'Pide Usuario'
      FieldName = 'PIDE_USER'
    end
    object QMEmpCajasPIDE_CLAVE: TIntegerField
      DisplayLabel = 'Pide Clave'
      FieldName = 'PIDE_CLAVE'
    end
    object QMEmpCajasPIDE_AGE: TIntegerField
      DisplayLabel = 'Pide Agente'
      FieldName = 'PIDE_AGE'
    end
    object QMEmpCajasPEDIR_A_PROV: TIntegerField
      DisplayLabel = 'Pedir a Prov.'
      FieldName = 'PEDIR_A_PROV'
    end
  end
  object DSQMEmpCajas: TDataSource
    DataSet = QMEmpCajas
    Left = 128
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 320
    Top = 16
  end
  object DSQMUsuarios: TDataSource
    DataSet = QMUsuarios
    Left = 128
    Top = 64
  end
  object DSQMFormasPago: TDataSource
    DataSet = QMFormasPago
    Left = 128
    Top = 112
  end
  object xCuenta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo, cuenta_pago from con_cuentas_ges_fp'
      'where (empresa=?empresa and ejercicio=?ejercicio and '
      ' canal=?canal and forma_pago=?forma_pago)')
    UniDirectional = False
    DataSource = DSQMFormasPago
    Left = 224
    Top = 16
    object xCuentaCUENTA_PAGO: TFIBStringField
      FieldName = 'CUENTA_PAGO'
      Size = 15
    end
    object xCuentaTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object QMFormasPago: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_TPV_FP'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  CAJA=?old_CAJA AND '
      '  FORMA_PAGO=?old_FORMA_PAGO ')
    InsertSQL.Strings = (
      'INSERT INTO GES_TPV_FP'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,CAJA,FORMA_PAGO,TITULO,CUENTA' +
        '_PAGO,FACTURACION,ACTIVA,CUENTA_PAGO_PGC,'#13#10'ORDEN)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?CAJA,?FORMA_PAGO,?TITULO' +
        ',?CUENTA_PAGO,?FACTURACION,?ACTIVA,?CUENTA_PAGO_PGC,'#13#10'?ORDEN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_TPV_FP'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  CAJA=?CAJA AND '
      '  FORMA_PAGO=?FORMA_PAGO ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_TPV_FP'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'CAJA = :CAJA'
      'ORDER BY FORMA_PAGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_TPV_FP'
      'SET'
      '  TITULO=?TITULO '
      '  ,CUENTA_PAGO=?CUENTA_PAGO '
      '  ,FACTURACION=?FACTURACION '
      '  ,ACTIVA=?ACTIVA '
      '  ,CUENTA_PAGO_PGC=?CUENTA_PAGO_PGC '
      '  ,ORDEN=?ORDEN '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  CAJA=?CAJA AND '
      '  FORMA_PAGO=?FORMA_PAGO ')
    DataSource = DSQMEmpCajas
    AfterPost = QMFormasPagoAfterPost
    OnNewRecord = QMFormasPagoNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA'
      'EJERCICIO'
      'CANAL'
      'SERIE'
      'CAJA'
      'FORMA_PAGO')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_TPV_FP'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 112
    object QMFormasPagoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMFormasPagoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMFormasPagoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMFormasPagoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMFormasPagoCAJA: TIntegerField
      DisplayLabel = 'Caja'
      FieldName = 'CAJA'
    end
    object QMFormasPagoFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F.P.'
      FieldName = 'FORMA_PAGO'
      OnChange = QMFormasPagoFPChange
      Size = 3
    end
    object QMFormasPagoCUENTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CUENTA_PAGO'
      Size = 15
    end
    object QMFormasPagoFACTURACION: TIntegerField
      DisplayLabel = 'Fact.'
      FieldName = 'FACTURACION'
    end
    object QMFormasPagoACTIVA: TIntegerField
      DisplayLabel = 'Act.'
      FieldName = 'ACTIVA'
    end
    object QMFormasPagoTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMFormasPagoORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
  end
  object QMUsuarios: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CAJAS_USUARIOS'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'CAJA=?CAJA AND'
      'USUARIO=?USUARIO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CAJAS_USUARIOS'
      '(EMPRESA, CAJA, USUARIO, NOMBRE, AGENTE, TITULO, ACTIVO)'
      'VALUES'
      '(?EMPRESA, ?CAJA, ?USUARIO, ?NOMBRE, ?AGENTE, ?TITULO, ?ACTIVO)')
    RefreshSQL.Strings = (
      'SELECT * FROM VER_CAJAS_USUARIOS'
      'WHERE '
      '  EMPRESA=?EMPRESA'
      '  AND CAJA=?CAJA'
      '  AND USUARIO=?USUARIO'
      '')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CAJAS_USUARIOS'
      'WHERE '
      '  EMPRESA=?EMPRESA'
      '  AND CAJA=?CAJA'
      'ORDER BY USUARIO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CAJAS_USUARIOS'
      'SET'
      '  NOMBRE=?NOMBRE,'
      '  AGENTE=?AGENTE,'
      '  TITULO=?TITULO,'
      '  ACTIVO=?ACTIVO'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'CAJA=?CAJA AND'
      'USUARIO=?USUARIO')
    DataSource = DSQMEmpCajas
    BeforeEdit = QMUsuariosBeforeEdit
    BeforePost = QMUsuariosBeforePost
    OnNewRecord = QMUsuariosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA'#13
      'CAJA'#13
      'USUARIO'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CAJAS_USUARIOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 64
    object QMUsuariosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMUsuariosCAJA: TIntegerField
      DisplayLabel = 'Caja'
      FieldName = 'CAJA'
    end
    object QMUsuariosUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
      OnChange = QMUsuariosUSUARIOChange
    end
    object QMUsuariosNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 31
    end
    object QMUsuariosAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
      OnChange = QMUsuariosAGENTEChange
    end
    object QMUsuariosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMUsuariosACTIVO: TIntegerField
      DisplayLabel = 'Act.'
      FieldName = 'ACTIVO'
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
    Left = 320
    Top = 64
  end
end
