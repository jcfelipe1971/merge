object DMMovConta: TDMMovConta
  OldCreateOrder = False
  OnCreate = DMMovContaCreate
  OnDestroy = DMMovContaDestroy
  Left = 454
  Top = 270
  Height = 451
  Width = 443
  object QMAsientos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CUENTAS_ASIENTOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  RIC=?old_RIC ')
    InsertSQL.Strings = (
      'INSERT INTO CON_CUENTAS_ASIENTOS'
      
        '  (FECHA,DEBE,HABER,RIC,LINEAS,ENTRADA,ASIENTO,AGRUPACION_GENERA' +
        'L,EMPRESA,EJERCICIO,CANAL,TITULO,FIRME,TIPO,TIPO_ASIENTO_KRI,ID_' +
        'ASIENTO)'
      'VALUES'
      
        '  (?FECHA,?DEBE,?HABER,?RIC,?LINEAS,?ENTRADA,?ASIENTO,?AGRUPACIO' +
        'N_GENERAL,?EMPRESA,?EJERCICIO,?CANAL,?TITULO,?FIRME,?TIPO,?TIPO_' +
        'ASIENTO_KRI,?ID_ASIENTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_ASIENTOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  RIC=?RIC ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM CON_CUENTAS_ASIENTOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL'
      'ORDER BY ASIENTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CUENTAS_ASIENTOS'
      'SET'
      '  FECHA=?FECHA '
      '  ,DEBE=?DEBE '
      '  ,HABER=?HABER '
      '  ,LINEAS=?LINEAS '
      '  ,ENTRADA=?ENTRADA '
      '  ,ASIENTO=?ASIENTO '
      '  ,AGRUPACION_GENERAL=?AGRUPACION_GENERAL '
      '  ,TITULO=?TITULO '
      '  ,FIRME=?FIRME '
      '  ,TIPO=?TIPO '
      '  ,TIPO_ASIENTO_KRI=?TIPO_ASIENTO_KRI '
      '  ,ID_ASIENTO=?ID_ASIENTO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  RIC=?RIC ')
    AfterOpen = QMAsientosAfterOpen
    AfterScroll = QMAsientosAfterScroll
    BeforeClose = QMAsientosBeforeClose
    BeforePost = QMAsientosBeforePost
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'RIC ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CUENTAS_ASIENTOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMAsientosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAsientosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMAsientosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMAsientosRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMAsientosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
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
    object QMAsientosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 100
    end
    object QMAsientosFIRME: TIntegerField
      DisplayLabel = 'Firme'
      FieldName = 'FIRME'
    end
    object QMAsientosSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
    end
    object QMAsientosASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object QMAsientosTIPO_ASIENTO_KRI: TFIBStringField
      DisplayLabel = 'Tipo Asi. Kri'
      FieldName = 'TIPO_ASIENTO_KRI'
      Size = 3
    end
    object QMAsientosID_ASIENTO: TIntegerField
      DisplayLabel = 'Id Asiento'
      FieldName = 'ID_ASIENTO'
    end
  end
  object DSQMAsientos: TDataSource
    DataSet = QMAsientos
    Left = 144
    Top = 16
  end
  object QMApuntes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CUENTAS_APUNTES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  RIC=?old_RIC AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO CON_CUENTAS_APUNTES'
      
        '  (DOC_FECHA,IMPORTE,DOC_SERIE,DOC_NUMERO,ENTRADA,RIC,TEXTO,LINE' +
        'A,EJERCICIO,CANAL,EMPRESA,SIGNO,CUENTA,PROYECTO)'
      'VALUES'
      
        '  (?DOC_FECHA,?IMPORTE,?DOC_SERIE,?DOC_NUMERO,?ENTRADA,?RIC,?TEX' +
        'TO,?LINEA,?EJERCICIO,?CANAL,?EMPRESA,?SIGNO,?CUENTA,?PROYECTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_APUNTES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  RIC=?RIC AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM CON_CUENTAS_APUNTES'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'RIC = :RIC'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CUENTAS_APUNTES'
      'SET'
      '  DOC_FECHA=?DOC_FECHA '
      '  ,IMPORTE=?IMPORTE '
      '  ,DOC_SERIE=?DOC_SERIE '
      '  ,DOC_NUMERO=?DOC_NUMERO '
      '  ,ENTRADA=?ENTRADA '
      '  ,TEXTO=?TEXTO '
      '  ,SIGNO=?SIGNO '
      '  ,CUENTA=?CUENTA '
      '  ,PROYECTO=?PROYECTO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  RIC=?RIC AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMAsientos
    AfterOpen = QMApuntesAfterOpen
    BeforeClose = QMApuntesBeforeClose
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'RIC '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CUENTAS_APUNTES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 64
    object QMApuntesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMApuntesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMApuntesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMApuntesRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMApuntesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMApuntesCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMApuntesIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMApuntesDOC_NUMERO: TIntegerField
      DisplayLabel = 'Documento'
      FieldName = 'DOC_NUMERO'
    end
    object QMApuntesDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMApuntesDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object QMApuntesCargo: TStringField
      DisplayLabel = 'Cta. Cargo'
      FieldKind = fkCalculated
      FieldName = 'Cargo'
      OnGetText = QMApuntesCargoGetText
      Calculated = True
    end
    object QMApuntesAbono: TStringField
      DisplayLabel = 'Cta. Abono'
      FieldKind = fkCalculated
      FieldName = 'Abono'
      OnGetText = QMApuntesAbonoGetText
      Calculated = True
    end
    object QMApuntesTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 100
    end
    object QMApuntesSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMApuntesPROYECTO: TIntegerField
      DisplayLabel = 'Proy.'
      FieldName = 'PROYECTO'
    end
    object QMApuntesTITULO_PROYECTO: TStringField
      DisplayLabel = 'Titulo del Proyecto'
      FieldKind = fkCalculated
      FieldName = 'TITULO_PROYECTO'
      OnGetText = QMApuntesTITULO_PROYECTOGetText
      Size = 60
      Calculated = True
    end
    object QMApuntesCUENTA_PGC: TIntegerField
      DisplayLabel = 'PGC'
      FieldName = 'CUENTA_PGC'
    end
    object QMApuntesPUNTEO: TIntegerField
      DisplayLabel = 'Punteo'
      FieldName = 'PUNTEO'
    end
    object QMApuntesFECHA_PUNTEO: TDateTimeField
      DisplayLabel = 'Fec. Punteo'
      FieldName = 'FECHA_PUNTEO'
    end
  end
  object DSQMApuntes: TDataSource
    DataSet = QMApuntes
    Left = 144
    Top = 64
  end
  object DSxCuentas: TDataSource
    DataSet = xCuentas
    Left = 144
    Top = 112
  end
  object xTipos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPO_ASIENTO'
      'WHERE TIPO=?TIPO')
    UniDirectional = False
    DataSource = DSQMAsientos
    Left = 40
    Top = 256
  end
  object DSxTipos: TDataSource
    DataSet = xTipos
    Left = 144
    Top = 256
  end
  object xCuentas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_SUBCUENTAS'
      'WHERE EMPRESA=?EMPRESA AND'
      '              EJERCICIO=?EJERCICIO AND'
      '              CANAL=?CANAL AND'
      '              CUENTA=?CUENTA AND'
      '              PGC=?PGC')
    UniDirectional = False
    DataSource = DSQMApuntes
    BeforeOpen = xCuentasBeforeOpen
    Left = 40
    Top = 112
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
  object xDatosExtendido: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM DAME_DATOS_ASIENTO_EXTENDIDO'
      '  (?EMPRESA,?EJERCICIO,?CANAL,?RIC)')
    UniDirectional = False
    Left = 40
    Top = 160
    object xDatosExtendidoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xDatosExtendidoTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xDatosExtendidoNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xDatosExtendidoTIPO_MAESTRO: TFIBStringField
      DisplayLabel = 'Tipo Maestro'
      FieldName = 'TIPO_MAESTRO'
      Size = 9
    end
    object xDatosExtendidoMAESTRO: TIntegerField
      DisplayLabel = 'Maestro'
      FieldName = 'MAESTRO'
    end
    object xDatosExtendidoMODO_IVA: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO_IVA'
    end
    object xDatosExtendidoTIT_MODO_IVA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TIT_MODO_IVA'
      Size = 40
    end
    object xDatosExtendidoSIGNO_IVA: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO_IVA'
      Size = 12
    end
    object xDatosExtendidoCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xDatosExtendidoTIT_CUENTA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TIT_CUENTA'
      Size = 60
    end
    object xDatosExtendidoREG: TIntegerField
      DisplayLabel = 'Reg.'
      FieldName = 'REG'
    end
    object xDatosExtendidoREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xDatosExtendidoFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xDatosExtendidoTIT_FORMA_PAGO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TIT_FORMA_PAGO'
      Size = 40
    end
    object xDatosExtendidoBASE_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'BASE_IMPONIBLE'
    end
    object xDatosExtendidoDOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Nro.'
      FieldName = 'DOC_NUMERO'
    end
    object xDatosExtendidoDOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xDatosExtendidoTIT_DOC_SERIE: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TIT_DOC_SERIE'
      Size = 40
    end
    object xDatosExtendidoNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xDatosExtendidoC_IVA: TFloatField
      DisplayLabel = 'Cuota IVA'
      FieldName = 'C_IVA'
    end
    object xDatosExtendidoC_REC: TFloatField
      DisplayLabel = 'C. Rec.'
      FieldName = 'C_REC'
    end
    object xDatosExtendidoC_RET: TFloatField
      DisplayLabel = 'Cuota Ret.'
      FieldName = 'C_RET'
    end
    object xDatosExtendidoLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xDatosExtendidoTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object xDatosExtendidoRGC: TIntegerField
      DisplayLabel = 'R.G.C.'
      FieldName = 'RGC'
    end
  end
  object DSxDatosExtendido: TDataSource
    DataSet = xDatosExtendido
    Left = 144
    Top = 160
  end
  object xRecibos: TFIBDataSetRW
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from dame_recibos_asiento (?empresa, ?ejercicio, ?canal' +
        ','
      ' ?ric, ?tipo)')
    UniDirectional = False
    Left = 40
    Top = 208
    object xRecibosTIPO_MAESTRO: TFIBStringField
      DisplayLabel = 'Tipo Maestro'
      FieldName = 'TIPO_MAESTRO'
      Size = 9
    end
    object xRecibosCUENTA_CP: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA_CP'
      Size = 15
    end
    object xRecibosTIT_CUENTA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TIT_CUENTA'
      Size = 60
    end
    object xRecibosMAESTRO: TIntegerField
      DisplayLabel = 'Maestro'
      FieldName = 'MAESTRO'
    end
    object xRecibosNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xRecibosSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xRecibosREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xRecibosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xRecibosVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Venc.'
      FieldName = 'VENCIMIENTO'
    end
    object xRecibosLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xRecibosPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object xRecibosIMPAGADO: TIntegerField
      DisplayLabel = 'Impagado'
      FieldName = 'IMPAGADO'
    end
    object xRecibosMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xRecibosLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object xRecibosMONEDA_CAN: TFIBStringField
      DisplayLabel = 'Mon. Can.'
      FieldName = 'MONEDA_CAN'
      Size = 3
    end
    object xRecibosRECIBIDO: TIntegerField
      DisplayLabel = 'Recibido'
      FieldName = 'RECIBIDO'
    end
  end
  object DSxRecibos: TDataSource
    DataSet = xRecibos
    Left = 144
    Top = 208
  end
  object xProyectos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from emp_proyectos where '
      '  empresa=?empresa and proyecto=?proyecto')
    UniDirectional = False
    DataSource = DSQMApuntes
    Left = 40
    Top = 304
  end
  object DSxProyectos: TDataSource
    DataSet = xProyectos
    Left = 144
    Top = 304
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 248
    Top = 16
  end
end
