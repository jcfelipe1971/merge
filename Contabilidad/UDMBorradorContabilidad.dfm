object DMBorradorContabilidad: TDMBorradorContabilidad
  OldCreateOrder = False
  OnCreate = DMBorradorContabilidadCreate
  OnDestroy = DataModuleDestroy
  Left = 491
  Top = 173
  Height = 731
  Width = 766
  object DSQMAsientos: TDataSource
    DataSet = QMAsientos
    Left = 152
    Top = 8
  end
  object xTipos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, EXT FROM SYS_TIPO_ASIENTO '
      'WHERE TIPO=?TIPO ')
    UniDirectional = False
    DataSource = DSQMAsientos
    Left = 40
    Top = 632
    object xTiposTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xTiposEXT: TIntegerField
      DisplayLabel = 'Ext.'
      FieldName = 'EXT'
    end
  end
  object DSxTipos: TDataSource
    DataSet = xTipos
    Left = 152
    Top = 632
  end
  object QMApuntes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_BORRADOR_APUNTES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  RIB=?old_RIB AND '
      '  LINEA=?old_LINEA')
    InsertSQL.Strings = (
      'insert into VER_BORRADOR_APUNTES'
      
        '   (EMPRESA,EJERCICIO,RIB,LINEA,TIPO,CARGO,ABONO,TEXTO,IMPORTE,D' +
        'OC_NUMERO,DOC_SERIE,DOC_FECHA,ENLACE,REGISTRO,B_IMPONIBLE,LINEA_' +
        'REC,CUENTA_CON,PROYECTO)'
      'VALUES'
      
        '   (?EMPRESA,?EJERCICIO,?RIB,?LINEA,?TIPO,?CARGO,?ABONO,?TEXTO,?' +
        'IMPORTE,?DOC_NUMERO,?DOC_SERIE,?DOC_FECHA,?ENLACE,?REGISTRO,?B_I' +
        'MPONIBLE,?LINEA_REC,?CUENTA_CON,?PROYECTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_BORRADOR_APUNTES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  RIB=?RIB AND '
      '  LINEA=?LINEA '
      'ORDER BY LINEA')
    SelectSQL.Strings = (
      'SELECT * FROM VER_BORRADOR_APUNTES'
      'where((empresa=?empresa)and(ejercicio=?ejercicio)and(rib=?rib))'
      'order by linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'update VER_BORRADOR_APUNTES'
      '   set '
      '       TIPO         = ?TIPO'
      '      ,CARGO       = ?CARGO'
      '      ,ABONO       = ?ABONO'
      '      ,TEXTO       = ?TEXTO'
      '      ,IMPORTE     = ?IMPORTE'
      '      ,DOC_SERIE   = ?DOC_SERIE'
      '      ,DOC_FECHA   = ?DOC_FECHA'
      '      ,DOC_NUMERO  = ?DOC_NUMERO'
      '      ,ENLACE      = ?ENLACE'
      '      ,REGISTRO    = ?REGISTRO           '
      '      ,B_IMPONIBLE = ?B_IMPONIBLE'
      '      ,LINEA_REC   = ?LINEA_REC'
      '     ,CUENTA_CON = ?CUENTA_CON'
      '      ,PROYECTO=?PROYECTO'
      'WHERE'
      ' ((EMPRESA  =?old_EMPRESA) and '
      ' (EJERCICIO =?old_EJERCICIO) and '
      ' (RIB       =?old_RIB) and '
      ' (LINEA     =?old_LINEA))')
    DataSource = DSQMAsientos
    AfterDelete = QMApuntesAfterDelete
    AfterOpen = QMApuntesAfterOpen
    AfterPost = QMApuntesAfterPost
    BeforeDelete = QMApuntesBeforeDelete
    BeforeEdit = QMApuntesBeforeEdit
    BeforeInsert = QMApuntesBeforeInsert
    BeforePost = QMApuntesBeforePost
    OnNewRecord = QMApuntesNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'RIB '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    CamposNoComparables.Strings = (
      'DOC_FECHA')
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_BORRADOR_APUNTES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 56
    object QMApuntesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMApuntesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMApuntesRIB: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'RIB'
    end
    object QMApuntesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMApuntesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 5
    end
    object QMApuntesCARGO: TFIBStringField
      DisplayLabel = 'Cargo'
      FieldName = 'CARGO'
      OnChange = QMApuntesCARGOChange
      Size = 15
    end
    object QMApuntesABONO: TFIBStringField
      DisplayLabel = 'Abono'
      FieldName = 'ABONO'
      OnChange = QMApuntesABONOChange
      Size = 15
    end
    object QMApuntesTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      OnChange = QMApuntesTEXTOChange
      Size = 100
    end
    object QMApuntesIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMApuntesDOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Nro.'
      FieldName = 'DOC_NUMERO'
      OnValidate = QMApuntesDOC_NUMEROValidate
    end
    object QMApuntesDOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMApuntesDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object QMApuntesENLACE: TIntegerField
      DisplayLabel = 'Enlace'
      FieldName = 'ENLACE'
    end
    object QMApuntesREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMApuntesB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMApuntesLINEA_REC: TIntegerField
      DisplayLabel = 'Linea Rec.'
      FieldName = 'LINEA_REC'
    end
    object QMApuntesCUENTA_CON: TFIBStringField
      DisplayLabel = 'Cta. Contable'
      FieldName = 'CUENTA_CON'
      OnChange = QMApuntesCUENTA_CONChange
      Size = 15
    end
    object QMApuntesPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
      OnChange = QMApuntesPROYECTOChange
    end
    object QMApuntesTITULO_PROYECTO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_PROYECTO'
      Size = 60
    end
  end
  object DSQMApuntes: TDataSource
    DataSet = QMApuntes
    Left = 152
    Top = 56
  end
  object QMAsientos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_BORRADOR_ASIENTOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  RIB=?old_RIB ')
    InsertSQL.Strings = (
      'INSERT INTO VER_BORRADOR_ASIENTOS'
      
        '  (FECHA,DEBE,HABER,BASE_IMPONIBLE,DOC_SERIE,C_POSTAL,RIB,ENTRAD' +
        'A,LINEAS,TERCERO,DOC_NUMERO,MAESTRO,EMPRESA,EJERCICIO,TITULO,BLO' +
        'QUEADO,CANAL,MODO_IVA,SIGNO,TIPO_IVA,NIF,NOMBRE,DIRECCION,PROVIN' +
        'CIA,TIPO,MONEDA,CUENTA,CUENTA_CON,FORMA_PAGO,TIPO_ASIENTO_KRI,PA' +
        'IS,ID_ASIENTO)'
      'VALUES'
      
        '  (?FECHA,?DEBE,?HABER,?BASE_IMPONIBLE,?DOC_SERIE,?C_POSTAL,?RIB' +
        ',?ENTRADA,?LINEAS,?TERCERO,?DOC_NUMERO,?MAESTRO,?EMPRESA,?EJERCI' +
        'CIO,?TITULO,?BLOQUEADO,?CANAL,?MODO_IVA,?SIGNO,?TIPO_IVA,?NIF,?N' +
        'OMBRE,?DIRECCION,?PROVINCIA,?TIPO,?MONEDA,?CUENTA,?CUENTA_CON,?F' +
        'ORMA_PAGO,?TIPO_ASIENTO_KRI,?PAIS,?ID_ASIENTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_BORRADOR_ASIENTOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  RIB=?RIB ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_BORRADOR_ASIENTOS'
      'WHERE'
      'EMPRESA = :EMPRESA'
      'ORDER BY RIB')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_BORRADOR_ASIENTOS'
      'SET'
      '  FECHA=?FECHA '
      '  ,DEBE=?DEBE '
      '  ,HABER=?HABER '
      '  ,BASE_IMPONIBLE=?BASE_IMPONIBLE '
      '  ,DOC_SERIE=?DOC_SERIE '
      '  ,C_POSTAL=?C_POSTAL '
      '  ,ENTRADA=?ENTRADA '
      '  ,LINEAS=?LINEAS '
      '  ,TERCERO=?TERCERO '
      '  ,DOC_NUMERO=?DOC_NUMERO '
      '  ,MAESTRO=?MAESTRO '
      '  ,TITULO=?TITULO '
      '  ,BLOQUEADO=?BLOQUEADO '
      '  ,CANAL=?CANAL '
      '  ,MODO_IVA=?MODO_IVA '
      '  ,SIGNO=?SIGNO '
      '  ,TIPO_IVA=?TIPO_IVA '
      '  ,NIF=?NIF '
      '  ,NOMBRE=?NOMBRE '
      '  ,DIRECCION=?DIRECCION '
      '  ,PROVINCIA=?PROVINCIA '
      '  ,TIPO=?TIPO '
      '  ,MONEDA=?MONEDA '
      '  ,CUENTA=?CUENTA '
      '  ,CUENTA_CON=?CUENTA_CON '
      '  ,FORMA_PAGO=?FORMA_PAGO '
      '  ,TIPO_ASIENTO_KRI=?TIPO_ASIENTO_KRI '
      '  ,PAIS=?PAIS '
      '  ,ID_ASIENTO=?ID_ASIENTO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  RIB=?RIB ')
    AfterDelete = QMAsientosAfterDelete
    AfterInsert = QMAsientosAfterInsert
    AfterOpen = QMAsientosAfterOpen
    AfterPost = QMAsientosAfterPost
    AfterScroll = QMAsientosAfterScroll
    BeforeDelete = QMAsientosBeforeDelete
    BeforeEdit = QMAsientosBeforeEdit
    BeforePost = QMAsientosBeforePost
    OnNewRecord = QMAsientosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA'
      'EJERCICIO'
      'RIB')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_BORRADOR_ASIENTOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMAsientosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAsientosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMAsientosRIB: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'RIB'
    end
    object QMAsientosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      OnChange = QMAsientosTIPOChange
      Size = 3
    end
    object QMAsientosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      OnChange = QMAsientosTITULOChange
      Size = 100
    end
    object QMAsientosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMAsientosDEBE: TFloatField
      DisplayLabel = 'Debe'
      FieldName = 'DEBE'
    end
    object QMAsientosHABER: TFloatField
      DisplayLabel = 'Haber'
      FieldName = 'HABER'
    end
    object QMAsientosSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
    object QMAsientosBLOQUEADO: TIntegerField
      DisplayLabel = 'Bloqueado'
      FieldName = 'BLOQUEADO'
    end
    object QMAsientosENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMAsientosLINEAS: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINEAS'
    end
    object QMAsientosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
      OnChange = QMAsientosCANALChange
    end
    object QMAsientosMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      OnChange = QMAsientosMONEDAChange
      Size = 3
    end
    object QMAsientosTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
      OnChange = QMAsientosTERCEROChange
    end
    object QMAsientosCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      OnChange = QMAsientosCUENTAChange
      Size = 15
    end
    object QMAsientosMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
      OnChange = QMAsientosMODO_IVAChange
    end
    object QMAsientosSIGNO: TIntegerField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
    end
    object QMAsientosCUENTA_CON: TFIBStringField
      DisplayLabel = 'Cta. Contable'
      FieldName = 'CUENTA_CON'
      OnChange = QMAsientosCUENTA_CONChange
      Size = 15
    end
    object QMAsientosFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      OnChange = QMAsientosFORMA_PAGOChange
      Size = 3
    end
    object QMAsientosBASE_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'BASE_IMPONIBLE'
    end
    object QMAsientosTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
      OnChange = QMAsientosTIPO_IVAChange
    end
    object QMAsientosDOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Nro.'
      FieldName = 'DOC_NUMERO'
    end
    object QMAsientosDOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc Serie'
      FieldName = 'DOC_SERIE'
      OnChange = QMAsientosDOC_SERIEChange
      Size = 10
    end
    object QMAsientosNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object QMAsientosMAESTRO: TIntegerField
      DisplayLabel = 'Maestro'
      FieldName = 'MAESTRO'
      OnChange = QMAsientosMAESTROChange
    end
    object QMAsientosTIPO_ASIENTO_KRI: TFIBStringField
      DisplayLabel = 'Tipo Asiento'
      FieldName = 'TIPO_ASIENTO_KRI'
      Size = 3
    end
    object QMAsientosNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object QMAsientosDIRECCION: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
      Size = 60
    end
    object QMAsientosC_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'C_POSTAL'
      Size = 10
    end
    object QMAsientosPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object QMAsientosPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMAsientosID_ASIENTO: TIntegerField
      DisplayLabel = 'Id Asiento'
      FieldName = 'ID_ASIENTO'
    end
  end
  object QSPValida: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'SELECT * FROM C_BORRADOR_VALIDA(:EMPRESA, :EJERCICIO, :CANAL, :R' +
        'IB)'
      'WHERE'
      'ERROR > 0')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 344
    object QSPValidaERROR: TIntegerField
      DisplayLabel = 'Error'
      FieldName = 'ERROR'
    end
    object QSPValidaCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QSPValidaRIB_VALIDADO: TIntegerField
      DisplayLabel = 'RIB'
      FieldName = 'RIB_VALIDADO'
    end
    object QSPValidaLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QSPValidaDESCRIPCION_ERROR: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION_ERROR'
      Size = 60
    end
  end
  object DSQSPValida: TDataSource
    DataSet = QSPValida
    Left = 152
    Top = 344
  end
  object QSPTraspasa: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'EXECUTE PROCEDURE C_BORRADOR_TRASPASA(:EMPRESA, :EJERCICIO, :CAN' +
        'AL, :RIB, :ENTRADA)')
    Transaction = TLocal
    AutoTrans = True
    Left = 480
    Top = 200
  end
  object xCargos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select cuenta,titulo,centro_coste from VER_SUBCUENTAS '
      'where ((empresa=?empresa )and(ejercicio=?ejercicio) and'
      '(canal=?canal)and(cuenta=?cargo) and (pgc=?pgc))')
    UniDirectional = True
    AutoCalcFields = False
    DataSource = DSQMApuntes
    BeforeOpen = xCargosBeforeOpen
    Left = 40
    Top = 536
  end
  object DSxCargos: TDataSource
    DataSet = xCargos
    Left = 152
    Top = 536
  end
  object xAbonos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select cuenta,titulo,centro_coste from VER_SUBCUENTAS '
      'where ((empresa=?empresa )and(ejercicio=?ejercicio)'
      'and(canal=?canal)and(cuenta=?abono) and (pgc=?pgc))')
    UniDirectional = True
    AutoCalcFields = False
    DataSource = DSQMApuntes
    BeforeOpen = xAbonosBeforeOpen
    Left = 40
    Top = 584
  end
  object DSxAbonos: TDataSource
    DataSet = xAbonos
    Left = 152
    Top = 584
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 152
    Top = 200
  end
  object xCanales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT PAIS,TITULO FROM VER_CANALES_ACTIVOS            '
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL')
    UniDirectional = False
    DataSource = DSQMAsientos
    Left = 40
    Top = 248
  end
  object DSxCanales: TDataSource
    DataSet = xCanales
    Left = 152
    Top = 248
  end
  object EntornoFind: TEntornoFind2000
    Empresa = 0
    Ejercicio = 0
    Canal = 0
    Tercero = 0
    Cliente = 0
    Pgc = 0
    Left = 600
    Top = 104
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 600
    Top = 8
  end
  object xInfoActualizada: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT SALDO,HABER,DEBE'
      'FROM CON_BORRADOR_ASIENTOS        '
      'WHERE EMPRESA=?EMPRESA AND'
      '               EJERCICIO=?EJERCICIO   AND'
      '               RIB=?RIB')
    UniDirectional = False
    DataSource = DSQMAsientos
    Left = 40
    Top = 296
    object xInfoActualizadaSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
    object xInfoActualizadaHABER: TFloatField
      DisplayLabel = 'Haber'
      FieldName = 'HABER'
    end
    object xInfoActualizadaDEBE: TFloatField
      DisplayLabel = 'Debe'
      FieldName = 'DEBE'
    end
  end
  object DSxInfoActualizada: TDataSource
    DataSet = xInfoActualizada
    Left = 152
    Top = 296
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT T_DESTINO,CAMBIO,DESTINO,F_ALTA'
      'FROM VER_MONEDAS_CAMBIOS_TODAS'
      'WHERE ORIGEN=?ORIGEN AND DESTINO=?MONEDA')
    UniDirectional = False
    DataSource = DSQMAsientos
    BeforeOpen = xMonedasBeforeOpen
    Left = 40
    Top = 200
    object xMonedasT_DESTINO: TFIBStringField
      DisplayLabel = 'T. Destino'
      FieldName = 'T_DESTINO'
      Size = 40
    end
    object xMonedasCAMBIO: TFloatField
      DisplayLabel = 'Cambio'
      FieldName = 'CAMBIO'
    end
    object xMonedasDESTINO: TFIBStringField
      DisplayLabel = 'Destino'
      FieldName = 'DESTINO'
      Size = 3
    end
    object xMonedasF_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'F_ALTA'
    end
  end
  object QMCentroCoste: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_BORRADOR_APUNTES_COSTES'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RIB=?RIB AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_BORRADOR_APUNTES_COSTES'
      
        '  where((empresa=?empresa)and(ejercicio=?ejercicio)and(rib=?rib)' +
        'and(linea=?linea))')
    UniDirectional = True
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMApuntes
    ClavesPrimarias.Strings = (
      'LINEA '
      'RIB '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_BORRADOR_APUNTES_COSTES'
    UpdateTransaction = TLocal
    Left = 480
    Top = 8
    object QMCentroCosteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCentroCosteEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCentroCosteRIB: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'RIB'
    end
    object QMCentroCosteLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMCentroCosteDIGITO_1: TFIBStringField
      DisplayLabel = 'Dig. 1'
      FieldName = 'DIGITO_1'
      Size = 3
    end
    object QMCentroCosteDIGITO_2: TFIBStringField
      DisplayLabel = 'Dig. 2'
      FieldName = 'DIGITO_2'
      Size = 3
    end
    object QMCentroCosteDIGITO_3: TFIBStringField
      DisplayLabel = 'Dig. 3'
      FieldName = 'DIGITO_3'
      Size = 3
    end
    object QMCentroCosteDIGITO_4: TFIBStringField
      DisplayLabel = 'Dig. 4'
      FieldName = 'DIGITO_4'
      Size = 3
    end
    object QMCentroCosteDIGITO_5: TFIBStringField
      DisplayLabel = 'Dig. 5'
      FieldName = 'DIGITO_5'
      Size = 3
    end
  end
  object SPCostesIntroducidos: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure c_costes_borrador(?empresa,?ejercicio,?canal,?' +
        'rib)')
    Transaction = TLocal
    AutoTrans = True
    Left = 480
    Top = 56
  end
  object SPCambiaMoneda: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure ut_refresca_detalle_borrador (?EMPRESA,?EJERCI' +
        'CIO,?RIB,'
      '?MONEDAOLD,?MONEDA,?FECHA)')
    Transaction = TLocal
    AutoTrans = True
    Left = 480
    Top = 152
  end
  object xTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select ter.nombre_r_social,ter.nombre_comercial,'
      'ter.nif,dir.dir_completa_n,loc.codigo_postal,'
      '  pro.titulo,pro.pais'
      'from sys_terceros ter'
      '  join sys_terceros_direcciones dir on (ter.tercero=dir.tercero)'
      '  join sys_localidades loc on (dir.id_local=loc.id_local)'
      
        '  join sys_provincias pro on ((loc.pais=pro.pais)and(loc.provinc' +
        'ia=pro.provincia))'
      'where ((dir.tercero = ?tercero)and(dir.dir_defecto = 1))'
      '')
    UniDirectional = False
    DataSource = DSQMAsientos
    Left = 240
    Top = 152
  end
  object DSxTerceros: TDataSource
    DataSet = xTerceros
    Left = 352
    Top = 152
  end
  object xCuentas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select TITULO from CON_CUENTAS'
      'where empresa = ?empresa and '
      '          ejercicio = ?ejercicio and'
      '          canal = ?canal and'
      '          cuenta=?cuenta and pgc=?pgc'
      '')
    UniDirectional = False
    DataSource = DSQMAsientos
    BeforeOpen = SetPGCBeforeOpen
    Left = 240
    Top = 200
  end
  object DSxCuentas: TDataSource
    DataSet = xCuentas
    Left = 352
    Top = 200
  end
  object xModoIva: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select TITULO from SYS_MODO_IVA'
      'where modo=?modo_iva')
    UniDirectional = False
    DataSource = DSQMAsientos
    Left = 240
    Top = 248
  end
  object DSxModoIva: TDataSource
    DataSet = xModoIva
    Left = 352
    Top = 248
  end
  object xClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select TITULO,TERCERO,FORMA_PAGO,CUENTA,MODO_IVA'
      '  from ver_clientes_cuentas'
      '   where '
      '      empresa = ?EMPRESA and'
      '      ejercicio = ?EJERCICIO and'
      '      canal = ?CANAL and'
      '      cliente = ?CLIENTE'
      '  ')
    UniDirectional = False
    Left = 40
    Top = 392
  end
  object DSxClientes: TDataSource
    DataSet = xClientes
    Left = 152
    Top = 392
  end
  object xProveedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select TITULO,TERCERO,FORMA_PAGO,CUENTA,MODO_IVA'
      '  from ver_proveedores_cuentas'
      '   where '
      '      empresa = ?EMPRESA and'
      '      ejercicio = ?EJERCICIO and'
      '      canal = ?CANAL and'
      '      proveedor = ?PROVEEDOR'
      '  ')
    UniDirectional = False
    Left = 40
    Top = 440
  end
  object DSxProveedor: TDataSource
    DataSet = xProveedor
    Left = 152
    Top = 440
  end
  object xAcreedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select TITULO,TERCERO,FORMA_PAGO,CUENTA,MODO_IVA,CUENTA_GASTOS'
      '  from ver_acreedores_cuentas'
      '   where '
      '      empresa = ?EMPRESA and'
      '      ejercicio = ?EJERCICIO and'
      '      canal = ?CANAL and'
      '      acreedor = ?ACREEDOR'
      '  ')
    UniDirectional = False
    Left = 40
    Top = 488
  end
  object DSxAcreedor: TDataSource
    DataSet = xAcreedor
    Left = 152
    Top = 488
  end
  object xFormasPago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select distinct TITULO'
      '  from  CON_CUENTAS_GES_FP'
      '    where forma_pago = ?FORMA_PAGO'
      
        'and(empresa=?empresa and ejercicio=?ejercicio and canal=?canal)/' +
        '*dji lrk kri*/'
      '  ')
    UniDirectional = False
    DataSource = DSQMAsientos
    Left = 240
    Top = 344
  end
  object DSxFormasPago: TDataSource
    DataSet = xFormasPago
    Left = 352
    Top = 344
  end
  object xSerie: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select  TITULO from VER_SERIES'
      'where '
      
        '(empresa=?empresa and ejercicio=?ejercicio and canal=?canal and ' +
        'serie = ?DOC_SERIE)')
    UniDirectional = False
    DataSource = DSQMAsientos
    Left = 240
    Top = 392
  end
  object DSxSerie: TDataSource
    DataSet = xSerie
    Left = 352
    Top = 392
  end
  object xCuentasCon: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select TITULO from CON_CUENTAS'
      'where empresa = ?empresa and '
      '          ejercicio = ?ejercicio and'
      '          canal = ?canal and'
      '          cuenta=?cuenta_con and pgc=?pgc')
    UniDirectional = False
    DataSource = DSQMAsientos
    BeforeOpen = SetPGCBeforeOpen
    Left = 240
    Top = 440
  end
  object DSxCuentasCon: TDataSource
    DataSet = xCuentasCon
    Left = 352
    Top = 440
  end
  object QMAsientosCartera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_BORRADOR_ASIENTOS_CARTERA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  RIB=?old_RIB ')
    InsertSQL.Strings = (
      'INSERT INTO CON_BORRADOR_ASIENTOS_CARTERA'
      '  (EMPRESA,EJERCICIO,RIB,MAESTRO,SIGNO,CUENTA_CP,TIPO_FAC)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?RIB,?MAESTRO,?SIGNO,?CUENTA_CP,?TIPO_FAC' +
        ')')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_BORRADOR_ASIENTOS_CARTERA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  RIB=?RIB ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_BORRADOR_ASIENTOS_CARTERA'
      'WHERE (EMPRESA=?EMPRESA) AND (EJERCICIO=?EJERCICIO)  AND'
      '(RIB = ?RIB)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_BORRADOR_ASIENTOS_CARTERA'
      'SET'
      '  MAESTRO=?MAESTRO '
      '  ,SIGNO=?SIGNO '
      '  ,CUENTA_CP=?CUENTA_CP '
      '  ,TIPO_FAC=?TIPO_FAC '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  RIB=?RIB ')
    AfterPost = Graba
    OnNewRecord = QMAsientosCarteraNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'RIB ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_BORRADOR_ASIENTOS_CARTERA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 104
    object QMAsientosCarteraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAsientosCarteraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMAsientosCarteraRIB: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'RIB'
    end
    object QMAsientosCarteraMAESTRO: TIntegerField
      DisplayLabel = 'Maestro'
      FieldName = 'MAESTRO'
    end
    object QMAsientosCarteraSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMAsientosCarteraCUENTA_CP: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA_CP'
      Size = 15
    end
    object QMAsientosCarteraTIPO_FAC: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_FAC'
      Size = 3
    end
  end
  object DSQMAsientosCartera: TDataSource
    DataSet = QMAsientosCartera
    Left = 152
    Top = 104
  end
  object QMRecibos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'select * from sys_empresas'
      'where empresa = 1')
    InsertSQL.Strings = (
      'select * from sys_empresas'
      'where empresa = 1')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CARTERA_DETALLE'
      'WHERE'
      '  ID_CARTERA_DETALLE = ?ID_CARTERA_DETALLE')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CARTERA_DETALLE'
      'WHERE EMPRESA = ?EMPRESA AND '
      '      EJERCICIO = ?EJERCICIO AND'
      '      CANAL = ?CANAL AND'
      '      (SIGNO = ?SIGNO OR SIGNO= ?SIGNO2) AND '
      '      RIC = ?RIB AND'
      '      VISIBLE = 0')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CARTERA_DETALLE'
      'SET'
      'ENTRADA = ?ENTRADA'
      'WHERE'
      '  ID_CARTERA_DETALLE = ?ID_CARTERA_DETALLE')
    AfterPost = QMRecibosAfterPost
    BeforeDelete = QMRecibosBeforeDelete
    BeforeInsert = QMRecibosBeforeInsert
    BeforePost = QMRecibosBeforePost
    OnNewRecord = QMRecibosNewRecord
    ClavesPrimarias.Strings = (
      'ID_CARTERA_DETALLE'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CARTERA_DETALLE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 152
    object QMRecibosREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMRecibosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMRecibosVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Venc.'
      FieldName = 'VENCIMIENTO'
    end
    object QMRecibosCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object QMRecibosLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
      OnGetText = QMRecibosLIQUIDOGetText
    end
    object QMRecibosPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object QMRecibosFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object QMRecibosRECIBIDO: TIntegerField
      DisplayLabel = 'Recibido'
      FieldName = 'RECIBIDO'
    end
    object QMRecibosENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMRecibosMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMRecibosLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object QMRecibosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMRecibosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMRecibosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMRecibosSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMRecibosID_CARTERA: TIntegerField
      DisplayLabel = 'ID Cartera'
      FieldName = 'ID_CARTERA'
    end
    object QMRecibosID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'ID Cart. Det.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
  end
  object DSQMRecibos: TDataSource
    DataSet = QMRecibos
    Left = 152
    Top = 152
  end
  object xDebe: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT SALDO FROM CON_CUENTAS_SALDOS'
      'WHERE EMPRESA = ?EMPRESA AND'
      'CANAL = ?CANAL AND EJERCICIO = ?EJERCICIO'
      'AND CUENTA = ?CARGO'
      'AND PERIODO = '#39'20'#39)
    UniDirectional = True
    AutoCalcFields = False
    DataSource = DSQMApuntes
    Left = 240
    Top = 8
    object xDebeSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
  end
  object DSxDebe: TDataSource
    DataSet = xDebe
    Left = 352
    Top = 8
  end
  object xHaber: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT SALDO FROM CON_CUENTAS_SALDOS'
      'WHERE EMPRESA = ?EMPRESA AND'
      'CANAL = ?CANAL AND EJERCICIO = ?EJERCICIO'
      'AND CUENTA = ?ABONO'
      'AND PERIODO = '#39'20'#39)
    UniDirectional = True
    AutoCalcFields = False
    DataSource = DSQMApuntes
    Left = 240
    Top = 56
    object xHaberSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
  end
  object DSxHaber: TDataSource
    DataSet = xHaber
    Left = 352
    Top = 56
  end
  object xTipoIva: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select TITULO from SYS_TIPO_IVA'
      'where tipo=?tipo_iva'
      'and pais = ?pais')
    UniDirectional = False
    Left = 240
    Top = 296
    object xTipoIvaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 15
    end
  end
  object DSxTipoIva: TDataSource
    DataSet = xTipoIva
    Left = 352
    Top = 296
  end
  object xCuentasConDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select TITULO from CON_CUENTAS'
      'where empresa = ?empresa and '
      '          ejercicio = ?ejercicio and'
      '          canal = ?canal and'
      '          cuenta=?cuenta_con and pgc=?pgc')
    UniDirectional = False
    DataSource = DSQMApuntes
    BeforeOpen = SetPGCBeforeOpen
    Left = 240
    Top = 488
  end
  object DSxCuentasConDetalle: TDataSource
    DataSet = xCuentasConDetalle
    Left = 352
    Top = 488
  end
  object xProyectos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from emp_proyectos where '
      '  empresa=?empresa and proyecto=?proyecto')
    UniDirectional = False
    DataSource = DSQMApuntes
    Left = 240
    Top = 104
  end
  object DSxProyectos: TDataSource
    DataSet = xProyectos
    Left = 352
    Top = 104
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 600
    Top = 56
  end
end
