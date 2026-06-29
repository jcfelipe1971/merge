object DMRecibosDesglose: TDMRecibosDesglose
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 267
  Top = 124
  Height = 533
  Width = 530
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 400
    Top = 8
  end
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_RECIBOS_CAB'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO Z_RECIBOS_CAB'
      
        '  (MONTO_RECIBO,IMPORTE,FECHA,MONTO_CHEQUE,MONTO_EFECTIVO,MONTO_' +
        'TARJETA,CLIENTE,BANCO,ID,LUGAR,ESTADO,CANAL,EJERCICIO,EMPRESA,CU' +
        'ENTA_COBRO,CUENTA,RECIBO,TITULO,SERIE,NRO_RECIBO)'
      'VALUES'
      
        '  (?MONTO_RECIBO,?IMPORTE,?FECHA,?MONTO_CHEQUE,?MONTO_EFECTIVO,?' +
        'MONTO_TARJETA,?CLIENTE,?BANCO,?ID,?LUGAR,?ESTADO,?CANAL,?EJERCIC' +
        'IO,?EMPRESA,?CUENTA_COBRO,?CUENTA,?RECIBO,?TITULO,?SERIE,?NRO_RE' +
        'CIBO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_RECIBOS_CAB'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_RECIBOS_CAB'
      'WHERE '
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO<=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'SERIE=?SERIE'
      'ORDER BY EMPRESA, EJERCICIO, CANAL, SERIE, NRO_RECIBO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_RECIBOS_CAB'
      'SET'
      '  MONTO_RECIBO=?MONTO_RECIBO '
      '  ,IMPORTE=?IMPORTE '
      '  ,FECHA=?FECHA '
      '  ,MONTO_CHEQUE=?MONTO_CHEQUE '
      '  ,MONTO_EFECTIVO=?MONTO_EFECTIVO '
      '  ,MONTO_TARJETA=?MONTO_TARJETA '
      '  ,CLIENTE=?CLIENTE '
      '  ,BANCO=?BANCO '
      '  ,LUGAR=?LUGAR '
      '  ,ESTADO=?ESTADO '
      '  ,CANAL=?CANAL '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,EMPRESA=?EMPRESA '
      '  ,CUENTA_COBRO=?CUENTA_COBRO '
      '  ,CUENTA=?CUENTA '
      '  ,RECIBO=?RECIBO '
      '  ,TITULO=?TITULO '
      '  ,SERIE=?SERIE '
      '  ,NRO_RECIBO=?NRO_RECIBO '
      'WHERE'
      '  ID=?ID ')
    AfterDelete = Graba
    AfterOpen = QMCabeceraAfterOpen
    AfterPost = Graba
    BeforeClose = QMCabeceraBeforeClose
    BeforeOpen = QMCabeceraBeforeOpen
    BeforePost = QMCabeceraBeforePost
    OnCalcFields = QMCabeceraCalcFields
    OnNewRecord = QMCabeceraNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_RECIBOS_CAB'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 8
    object QMCabeceraID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCabeceraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCabeceraSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabeceraNRO_RECIBO: TIntegerField
      DisplayLabel = 'Nro. Recibo'
      FieldName = 'NRO_RECIBO'
    end
    object QMCabeceraESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCabeceraRECIBO: TFIBStringField
      DisplayLabel = 'Recibo'
      FieldName = 'RECIBO'
      Size = 15
    end
    object QMCabeceraBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object QMCabeceraFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCabeceraLUGAR: TFIBStringField
      DisplayLabel = 'Lugar'
      FieldName = 'LUGAR'
      Size = 60
    end
    object QMCabeceraIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMCabeceraCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMCabeceraCUENTA_COBRO: TFIBStringField
      DisplayLabel = 'Cta. Cobro'
      FieldName = 'CUENTA_COBRO'
      Size = 15
    end
    object QMCabeceraCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      OnChange = QMCabeceraCLIENTEChange
    end
    object QMCabeceraMONTO_RECIBO: TFloatField
      DisplayLabel = 'Monto Aplicado'
      FieldName = 'MONTO_RECIBO'
    end
    object QMCabeceraMONTO_TARJETA: TFloatField
      DisplayLabel = 'Monto Tarj.'
      FieldName = 'MONTO_TARJETA'
    end
    object QMCabeceraMONTO_EFECTIVO: TFloatField
      DisplayLabel = 'Monto Efec.'
      FieldName = 'MONTO_EFECTIVO'
    end
    object QMCabeceraMONTO_CHEQUE: TFloatField
      DisplayLabel = 'Monto Cheque'
      FieldName = 'MONTO_CHEQUE'
    end
    object QMCabeceraTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      DisplayWidth = 60
      FieldName = 'TITULO'
      Size = 60
    end
    object QMCabeceraTITULO_ESTADO: TStringField
      DisplayLabel = 'Titulo Estado'
      FieldKind = fkCalculated
      FieldName = 'TITULO_ESTADO'
      Size = 40
      Calculated = True
    end
  end
  object QMCobros: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CARTERA_DETALLE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SIGNO=?old_SIGNO AND '
      '  REGISTRO=?old_REGISTRO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CARTERA_DETALLE'
      
        '  (VENCIMIENTO,LIQUIDO,FECHA_CIERRE,ANTICIPADO,CAMBIO,FECHA_RECI' +
        'BIDO,LIQUIDO_CANAL,FECHA_VALOR,DOC_AUTOMATICO,AGRUPACION,ENTRADA' +
        ',RIC,BANCO,REMESA,REGISTRO,CONFIRMING,RIC_RECIBIDO,ABONO,AGRUPAC' +
        'ION_GENERAL,ID_CARTERA_DETALLE,ID_CARTERA,ID_REMESAS,LINEA,MOD_M' +
        'ANUAL,IMPAGADO,ESTADO,EMPRESA,EJERCICIO,CANAL,PAGADO,REMESAR,REC' +
        'IBIDO,VISIBLE,EJERCICIO_REMESA,EJERCICIO_AGRUPACION,EJERCICIO_CO' +
        'NFIRMING,EJERCICIO_ABONO,BANDERA,DOCUMENTO,SIGNO,CTA_PAGO,TIPO_E' +
        'FECTO,ESTADO_RECIBO,MONEDA,MONEDA_CANAL,ID_CAB_Z_recibos,MARCADO' +
        ')'
      'VALUES'
      
        '  (?VENCIMIENTO,?LIQUIDO,?FECHA_CIERRE,?ANTICIPADO,?CAMBIO,?FECH' +
        'A_RECIBIDO,?LIQUIDO_CANAL,?FECHA_VALOR,?DOC_AUTOMATICO,?AGRUPACI' +
        'ON,?ENTRADA,?RIC,?BANCO,?REMESA,?REGISTRO,?CONFIRMING,?RIC_RECIB' +
        'IDO,?ABONO,?AGRUPACION_GENERAL,?ID_CARTERA_DETALLE,?ID_CARTERA,?' +
        'ID_REMESAS,?LINEA,?MOD_MANUAL,?IMPAGADO,?ESTADO,?EMPRESA,?EJERCI' +
        'CIO,?CANAL,?PAGADO,?REMESAR,?RECIBIDO,?VISIBLE,?EJERCICIO_REMESA' +
        ',?EJERCICIO_AGRUPACION,?EJERCICIO_CONFIRMING,?EJERCICIO_ABONO,?B' +
        'ANDERA,?DOCUMENTO,?SIGNO,?CTA_PAGO,?TIPO_EFECTO,?ESTADO_RECIBO,?' +
        'MONEDA,?MONEDA_CANAL,?ID_CAB_Z_recibos,?MARCADO)')
    RefreshSQL.Strings = (
      'SELECT * FROM EMP_CARTERA_DETALLE DET'
      'JOIN EMP_CARTERA CAB'
      'ON (DET.ID_CARTERA = CAB.ID_CARTERA)'
      'WHERE'
      'ID_CARTERA_DETALLE = ?ID_CARTERA_DETALLE')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CARTERA_DETALLE DET'
      'JOIN EMP_CARTERA CAB ON (DET.ID_CARTERA=CAB.ID_CARTERA)'
      'WHERE'
      'DET.EMPRESA = ?EMPRESA'
      'AND (DET.EJERCICIO = ?EJERCICIO OR DET.EJERCICIO <= ?EJERCICIO)'
      'AND DET.CANAL = ?CANAL'
      'AND DET.SIGNO = '#39'C'#39
      'AND DET.VISIBLE = 1'
      'AND DET.PAGADO <> 1'
      
        'AND ((DET.MARCADO = 0) OR ((DET.MARCADO = 1) AND (DET.ID_CAB_Z_R' +
        'ECIBOS = ?ID)))'
      'AND CAB.COD_CLI_PRO = ?CLIENTE'
      'ORDER BY DET.VENCIMIENTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CARTERA_DETALLE'
      'SET'
      '  MARCADO=?MARCADO,'
      '  ID_CAB_Z_recibos=?ID_CAB_Z_recibos '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO AND '
      '  LINEA=?LINEA ')
    DataSource = DSCabecera
    AfterPost = QMCobrosAfterPost
    AfterScroll = QMCobrosAfterScroll
    BeforeOpen = QMCobrosBeforeOpen
    BeforePost = BeforePostGeneral
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
    Left = 32
    Top = 56
    object QMCobrosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCobrosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
    end
    object QMCobrosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCobrosSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMCobrosREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMCobrosLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMCobrosVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Vencimiento'
      FieldName = 'VENCIMIENTO'
    end
    object QMCobrosCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object QMCobrosLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object QMCobrosPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object QMCobrosMOD_MANUAL: TIntegerField
      DisplayLabel = 'Mod. Manual'
      FieldName = 'MOD_MANUAL'
    end
    object QMCobrosTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efe.'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object QMCobrosREMESAR: TIntegerField
      DisplayLabel = 'Remesar'
      FieldName = 'REMESAR'
    end
    object QMCobrosESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCobrosREMESA: TIntegerField
      DisplayLabel = 'Remesa'
      FieldName = 'REMESA'
    end
    object QMCobrosBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object QMCobrosRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMCobrosIMPAGADO: TIntegerField
      DisplayLabel = 'Impagado'
      FieldName = 'IMPAGADO'
    end
    object QMCobrosFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object QMCobrosESTADO_RECIBO: TFIBStringField
      DisplayLabel = 'Estado Rec.'
      FieldName = 'ESTADO_RECIBO'
      Size = 1
    end
    object QMCobrosRECIBIDO: TIntegerField
      DisplayLabel = 'Recibido'
      FieldName = 'RECIBIDO'
    end
    object QMCobrosVISIBLE: TIntegerField
      DisplayLabel = 'Visible'
      FieldName = 'VISIBLE'
    end
    object QMCobrosENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMCobrosAGRUPACION: TIntegerField
      DisplayLabel = 'Agrup.'
      FieldName = 'AGRUPACION'
    end
    object QMCobrosCONFIRMING: TIntegerField
      DisplayLabel = 'Confirm.'
      FieldName = 'CONFIRMING'
    end
    object QMCobrosANTICIPADO: TFloatField
      DisplayLabel = 'Ant.'
      FieldName = 'ANTICIPADO'
    end
    object QMCobrosDOCUMENTO: TFIBStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 15
    end
    object QMCobrosDOC_AUTOMATICO: TIntegerField
      DisplayLabel = 'Doc. Auto.'
      FieldName = 'DOC_AUTOMATICO'
    end
    object QMCobrosEJERCICIO_REMESA: TIntegerField
      DisplayLabel = 'Ejer. Rem.'
      FieldName = 'EJERCICIO_REMESA'
    end
    object QMCobrosEJERCICIO_AGRUPACION: TIntegerField
      DisplayLabel = 'Ejer. Agr.'
      FieldName = 'EJERCICIO_AGRUPACION'
    end
    object QMCobrosMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMCobrosLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'L'#237'quido Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object QMCobrosCAMBIO: TFloatField
      DisplayLabel = 'Cambio'
      FieldName = 'CAMBIO'
    end
    object QMCobrosRIC_RECIBIDO: TIntegerField
      DisplayLabel = 'RIC Rec.'
      FieldName = 'RIC_RECIBIDO'
    end
    object QMCobrosFECHA_RECIBIDO: TDateTimeField
      DisplayLabel = 'Fec. Rec.'
      FieldName = 'FECHA_RECIBIDO'
    end
    object QMCobrosMONEDA_CANAL: TFIBStringField
      DisplayLabel = 'Mon. Can.'
      FieldName = 'MONEDA_CANAL'
      Size = 3
    end
    object QMCobrosEJERCICIO_CONFIRMING: TIntegerField
      DisplayLabel = 'Ejer. Conf.'
      FieldName = 'EJERCICIO_CONFIRMING'
    end
    object QMCobrosFECHA_VALOR: TDateTimeField
      DisplayLabel = 'Fec. Valor'
      FieldName = 'FECHA_VALOR'
    end
    object QMCobrosABONO: TIntegerField
      DisplayLabel = 'Abono'
      FieldName = 'ABONO'
    end
    object QMCobrosEJERCICIO_ABONO: TIntegerField
      DisplayLabel = 'Ejer. Abono'
      FieldName = 'EJERCICIO_ABONO'
    end
    object QMCobrosAGRUPACION_GENERAL: TIntegerField
      DisplayLabel = 'Agrup. Gen.'
      FieldName = 'AGRUPACION_GENERAL'
    end
    object QMCobrosBANDERA: TIntegerField
      DisplayLabel = 'Bandera'
      FieldName = 'BANDERA'
    end
    object QMCobrosID_CARTERA: TIntegerField
      DisplayLabel = 'ID Cart.'
      FieldName = 'ID_CARTERA'
    end
    object QMCobrosID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'ID Cart. Det.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object QMCobrosID_REMESAS: TIntegerField
      DisplayLabel = 'ID Rem.'
      FieldName = 'ID_REMESAS'
    end
    object QMCobrosID_CAB_Z_recibos: TIntegerField
      DisplayLabel = 'ID Cab. Rec.'
      FieldName = 'ID_CAB_Z_recibos'
    end
    object QMCobrosMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
    end
    object QMCobrosC_Pendientes: TFloatField
      DisplayLabel = 'C. Pend.'
      FieldKind = fkCalculated
      FieldName = 'C_Pendientes'
      Calculated = True
    end
    object QMCobrosAbrirCartera: TIntegerField
      DisplayLabel = 'Abrir Cart.'
      FieldKind = fkCalculated
      FieldName = 'Abrir Cartera'
      OnChange = QMCobrosAbrirCarteraChange
      Calculated = True
    end
    object QMCobrosZ_MONTO_APLICAR: TFloatField
      DisplayLabel = 'Monto Aplic.'
      FieldName = 'Z_MONTO_APLICAR'
    end
    object QMCobrosZ_PENDIENTE: TFloatField
      DisplayLabel = 'Pendiente'
      FieldName = 'Z_PENDIENTE'
    end
    object QMCobrosDOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
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
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  ANTICIPO=?old_ANTICIPO AND '
      '  TIPO_TERCERO=?old_TIPO_TERCERO ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CARTERA_ANTICIPOS'
      
        '  (CANTIDAD,FECHA,ANTICIPO,COD_CLI_PRO,REGISTRO,ASIENTO,EMPRESA,' +
        'EJERCICIO,CANAL,CONTABILIZAR,TIPO_TERCERO,CUENTA_CLI_PRO,C_CONTR' +
        'APARTIDA)'
      'VALUES'
      
        '  (?CANTIDAD,?FECHA,?ANTICIPO,?COD_CLI_PRO,?REGISTRO,?ASIENTO,?E' +
        'MPRESA,?EJERCICIO,?CANAL,?CONTABILIZAR,?TIPO_TERCERO,?CUENTA_CLI' +
        '_PRO,?C_CONTRAPARTIDA)')
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
      '  MARCADO=?MARCADO,'
      '  ID_CAB_Z_recibos=?ID_CAB_Z_recibos '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  ANTICIPO=?ANTICIPO AND '
      '  TIPO_TERCERO=?TIPO_TERCERO ')
    DataSource = DSCabecera
    AfterPost = Graba
    BeforePost = BeforePostGeneral
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'ANTICIPO '
      'TIPO_TERCERO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CARTERA_ANTICIPOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 104
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
      DisplayLabel = 'Tipo Tercero'
      FieldName = 'TIPO_TERCERO'
      Size = 3
    end
    object QMAnticiposCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cli./Prov./Acr.'
      FieldName = 'COD_CLI_PRO'
    end
    object QMAnticiposCUENTA_CLI_PRO: TFIBStringField
      DisplayLabel = 'Cta. Cli./Pro.'
      FieldName = 'CUENTA_CLI_PRO'
      Size = 15
    end
    object QMAnticiposC_CONTRAPARTIDA: TFIBStringField
      DisplayLabel = 'Cta. Contrapartida'
      FieldName = 'C_CONTRAPARTIDA'
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
    object QMAnticiposID_CAB_Z_recibos: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CAB_Z_recibos'
    end
    object QMAnticiposMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
    end
    object QMAnticiposP_anticipos: TFloatField
      DisplayLabel = 'P. Antic.'
      FieldKind = fkCalculated
      FieldName = 'P_anticipos'
      Calculated = True
    end
  end
  object QMPagos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CARTERA_DETALLE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SIGNO=?old_SIGNO AND '
      '  REGISTRO=?old_REGISTRO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CARTERA_DETALLE'
      
        '  (VENCIMIENTO,LIQUIDO,FECHA_CIERRE,ANTICIPADO,CAMBIO,FECHA_RECI' +
        'BIDO,LIQUIDO_CANAL,FECHA_VALOR,DOC_AUTOMATICO,AGRUPACION,ENTRADA' +
        ',RIC,BANCO,REMESA,REGISTRO,CONFIRMING,RIC_RECIBIDO,ABONO,AGRUPAC' +
        'ION_GENERAL,ID_CARTERA_DETALLE,ID_CARTERA,ID_REMESAS,LINEA,MOD_M' +
        'ANUAL,IMPAGADO,ESTADO,EMPRESA,EJERCICIO,CANAL,PAGADO,REMESAR,REC' +
        'IBIDO,VISIBLE,EJERCICIO_REMESA,EJERCICIO_AGRUPACION,EJERCICIO_CO' +
        'NFIRMING,EJERCICIO_ABONO,BANDERA,DOCUMENTO,SIGNO,CTA_PAGO,TIPO_E' +
        'FECTO,ESTADO_RECIBO,MONEDA,MONEDA_CANAL,ID_CAB_Z_recibos,MARCADO' +
        ')'
      'VALUES'
      
        '  (?VENCIMIENTO,?LIQUIDO,?FECHA_CIERRE,?ANTICIPADO,?CAMBIO,?FECH' +
        'A_RECIBIDO,?LIQUIDO_CANAL,?FECHA_VALOR,?DOC_AUTOMATICO,?AGRUPACI' +
        'ON,?ENTRADA,?RIC,?BANCO,?REMESA,?REGISTRO,?CONFIRMING,?RIC_RECIB' +
        'IDO,?ABONO,?AGRUPACION_GENERAL,?ID_CARTERA_DETALLE,?ID_CARTERA,?' +
        'ID_REMESAS,?LINEA,?MOD_MANUAL,?IMPAGADO,?ESTADO,?EMPRESA,?EJERCI' +
        'CIO,?CANAL,?PAGADO,?REMESAR,?RECIBIDO,?VISIBLE,?EJERCICIO_REMESA' +
        ',?EJERCICIO_AGRUPACION,?EJERCICIO_CONFIRMING,?EJERCICIO_ABONO,?B' +
        'ANDERA,?DOCUMENTO,?SIGNO,?CTA_PAGO,?TIPO_EFECTO,?ESTADO_RECIBO,?' +
        'MONEDA,?MONEDA_CANAL,?ID_CAB_Z_recibos,?MARCADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CARTERA_DETALLE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO AND '
      '  LINEA=?LINEA ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CARTERA_DETALLE'
      'SET'
      '  MARCADO=?MARCADO,'
      '  ID_CAB_Z_recibos=?ID_CAB_Z_recibos '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO AND '
      '  LINEA=?LINEA ')
    AfterPost = QMPagosAfterPost
    BeforePost = BeforePostGeneral
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SIGNO '
      'REGISTRO '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CARTERA_DETALLE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 152
    object QMPagosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPagosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPagosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPagosSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMPagosREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMPagosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMPagosVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Venc.'
      FieldName = 'VENCIMIENTO'
    end
    object QMPagosCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object QMPagosLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMPagosPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object QMPagosMOD_MANUAL: TIntegerField
      DisplayLabel = 'Mod. Manual'
      FieldName = 'MOD_MANUAL'
    end
    object QMPagosTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efecto'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object QMPagosREMESAR: TIntegerField
      DisplayLabel = 'Remesar'
      FieldName = 'REMESAR'
    end
    object QMPagosESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMPagosREMESA: TIntegerField
      DisplayLabel = 'Remesa'
      FieldName = 'REMESA'
    end
    object QMPagosBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object QMPagosRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMPagosIMPAGADO: TIntegerField
      DisplayLabel = 'Impagado'
      FieldName = 'IMPAGADO'
    end
    object QMPagosFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object QMPagosESTADO_RECIBO: TFIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO_RECIBO'
      Size = 1
    end
    object QMPagosRECIBIDO: TIntegerField
      DisplayLabel = 'Recibido'
      FieldName = 'RECIBIDO'
    end
    object QMPagosVISIBLE: TIntegerField
      DisplayLabel = 'Visible'
      FieldName = 'VISIBLE'
    end
    object QMPagosENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMPagosAGRUPACION: TIntegerField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
    end
    object QMPagosCONFIRMING: TIntegerField
      DisplayLabel = 'Confirming'
      FieldName = 'CONFIRMING'
    end
    object QMPagosANTICIPADO: TFloatField
      DisplayLabel = 'Anticipado'
      FieldName = 'ANTICIPADO'
    end
    object QMPagosDOCUMENTO: TFIBStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 15
    end
    object QMPagosDOC_AUTOMATICO: TIntegerField
      DisplayLabel = 'Doc. Auto.'
      FieldName = 'DOC_AUTOMATICO'
    end
    object QMPagosEJERCICIO_REMESA: TIntegerField
      DisplayLabel = 'Ejer. Remesa'
      FieldName = 'EJERCICIO_REMESA'
    end
    object QMPagosEJERCICIO_AGRUPACION: TIntegerField
      DisplayLabel = 'Ejer. Agrup.'
      FieldName = 'EJERCICIO_AGRUPACION'
    end
    object QMPagosMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMPagosLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object QMPagosCAMBIO: TFloatField
      DisplayLabel = 'Cambio'
      FieldName = 'CAMBIO'
    end
    object QMPagosRIC_RECIBIDO: TIntegerField
      DisplayLabel = 'RIC Recibido'
      FieldName = 'RIC_RECIBIDO'
    end
    object QMPagosFECHA_RECIBIDO: TDateTimeField
      DisplayLabel = 'Fec. Recibido'
      FieldName = 'FECHA_RECIBIDO'
    end
    object QMPagosMONEDA_CANAL: TFIBStringField
      DisplayLabel = 'Mon. Can.'
      FieldName = 'MONEDA_CANAL'
      Size = 3
    end
    object QMPagosEJERCICIO_CONFIRMING: TIntegerField
      DisplayLabel = 'Ejer. Confirming'
      FieldName = 'EJERCICIO_CONFIRMING'
    end
    object QMPagosFECHA_VALOR: TDateTimeField
      DisplayLabel = 'Fec. Valor'
      FieldName = 'FECHA_VALOR'
    end
    object QMPagosABONO: TIntegerField
      DisplayLabel = 'Abono'
      FieldName = 'ABONO'
    end
    object QMPagosEJERCICIO_ABONO: TIntegerField
      DisplayLabel = 'Ejer. Abono'
      FieldName = 'EJERCICIO_ABONO'
    end
    object QMPagosAGRUPACION_GENERAL: TIntegerField
      DisplayLabel = 'Agrup. Gen.'
      FieldName = 'AGRUPACION_GENERAL'
    end
    object QMPagosBANDERA: TIntegerField
      DisplayLabel = 'Bandera'
      FieldName = 'BANDERA'
    end
    object QMPagosID_CARTERA: TIntegerField
      DisplayLabel = 'ID Cartera'
      FieldName = 'ID_CARTERA'
    end
    object QMPagosID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'ID Cart. Det.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object QMPagosID_REMESAS: TIntegerField
      DisplayLabel = 'ID Remesa'
      FieldName = 'ID_REMESAS'
    end
    object QMPagosID_CAB_Z_recibos: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CAB_Z_recibos'
    end
    object QMPagosMARCADO: TIntegerField
      DisplayLabel = 'Marcado'
      FieldName = 'MARCADO'
    end
    object QMPagosP_Pendientes: TFloatField
      DisplayLabel = 'P. Pendientes'
      FieldKind = fkCalculated
      FieldName = 'P_Pendientes'
      Calculated = True
    end
    object QMPagosAbrir_Cartera: TIntegerField
      DisplayLabel = 'Abrir Cart.'
      FieldKind = fkCalculated
      FieldName = 'Abrir_Cartera'
      Calculated = True
    end
  end
  object DSCabecera: TDataSource
    DataSet = QMCabecera
    Left = 120
    Top = 8
  end
  object DsCobros: TDataSource
    DataSet = QMCobros
    Left = 120
    Top = 56
  end
  object DsAnticipos: TDataSource
    DataSet = QMAnticipos
    Left = 120
    Top = 104
  end
  object DsPagos: TDataSource
    DataSet = QMPagos
    Left = 120
    Top = 152
  end
  object xBancos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM EMP_BANCOS'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  BANCO=?BANCO')
    SelectSQL.Strings = (
      'SELECT BANCO,TITULO FROM EMP_BANCOS'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  BANCO=?BANCO')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 32
    Top = 200
    object xBancosBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object xBancosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 35
    end
  end
  object DSxBancos: TDataSource
    DataSet = xBancos
    Left = 120
    Top = 200
  end
  object xCuenta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM EMP_BANCOS'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  BANCO=?BANCO')
    SelectSQL.Strings = (
      'SELECT TITULO FROM CON_CUENTAS'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  CUENTA=?CUENTA')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 32
    Top = 296
    object xCuentaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxCuenta: TDataSource
    DataSet = xCuenta
    Left = 120
    Top = 296
  end
  object xCuentaCobro: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM EMP_BANCOS'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  BANCO=?BANCO')
    SelectSQL.Strings = (
      'SELECT TITULO FROM CON_CUENTAS'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  CUENTA=?CUENTA_COBRO')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 32
    Top = 344
    object xCuentaCobroTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 150
    end
  end
  object DSxCuentaCobro: TDataSource
    DataSet = xCuentaCobro
    Left = 120
    Top = 344
  end
  object xDescripcion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TEXTO,EMPRESA,EJERCICIO,CANAL,ID'
      ' FROM Z_RECIBOS_CAB_TEXTO'
      
        'where(empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and '
      '  id=?id) ')
    UniDirectional = False
    DataSource = DSCabecera
    Left = 32
    Top = 248
    object xDescripcionTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 60
    end
    object xDescripcionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDescripcionEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xDescripcionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xDescripcionID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
  end
  object DSxDescripcion: TDataSource
    DataSet = xDescripcion
    Left = 120
    Top = 248
  end
  object xTotales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'select sum(liquido) as liquido'
      'from emp_cartera_detalle '
      'where '
      'empresa=?empresa and'
      'ejercicio<=?ejercicio and'
      'canal=?canal and '
      'signo='#39'C'#39' and'
      'marcado=0 and '
      'id_cab_z_recibos=?id')
    UniDirectional = False
    DataSource = DSCabecera
    Plan.Strings = (
      
        'PLAN JOIN (VER_TERCEROS DI INDEX (PK_SYS_TERCEROS_DIRECCIONES),V' +
        'ER_TERCEROS TE INDEX (PK_SYS_TERCEROS))')
    Left = 32
    Top = 392
    object xTotalesLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
  end
  object DSxTotales: TDataSource
    DataSet = xTotales
    Left = 120
    Top = 392
  end
  object QMFacturasDesglose: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT DET.ID_REGISTRO, CAB.FECHA, DET.UNIDADES, DET.PRECIO, DET' +
        '.BRUTO, DET.TITULO_IDIOMA, DET.PRO_NUM_PLANO, FA.RIG,'
      
        '       FA.LINEA, ART.TITULO_LARGO AS TITULO, FA.ID_RECIBO, FA.IM' +
        'PORTE_DESGLOSE, DET.ID_DETALLES_S'
      'FROM GES_DETALLES_S DET'
      'JOIN GES_CABECERAS_S CAB ON DET.ID_S = CAB.ID_S'
      
        'JOIN GES_DETALLES_S_FAC FA ON DET.ID_DETALLES_S = FA.ID_DETALLES' +
        '_S'
      'INNER JOIN ART_ARTICULOS ART ON ART.ID_A = DET.ID_A'
      'WHERE'
      'DET.ID_DETALLES_S = :ID_DETALLES_S')
    SelectSQL.Strings = (
      
        'SELECT DET.ID_REGISTRO, CAB.FECHA, DET.UNIDADES, DET.PRECIO, DET' +
        '.BRUTO, DET.TITULO_IDIOMA, DET.PRO_NUM_PLANO, FA.RIG,'
      
        '       FA.LINEA, ART.TITULO_LARGO AS TITULO, FA.ID_RECIBO, FA.IM' +
        'PORTE_DESGLOSE, DET.ID_DETALLES_S'
      'FROM GES_DETALLES_S DET'
      'JOIN GES_CABECERAS_S CAB ON DET.ID_S = CAB.ID_S'
      
        'JOIN GES_DETALLES_S_FAC FA ON DET.ID_DETALLES_S = FA.ID_DETALLES' +
        '_S'
      'JOIN EMP_CARTERA C ON DET.ID_S = C.ID_DOC'
      'JOIN EMP_CARTERA_DETALLE D ON C.ID_CARTERA = D.ID_CARTERA'
      'INNER JOIN ART_ARTICULOS ART ON ART.ID_A = DET.ID_A'
      'WHERE'
      'D.EMPRESA = :EMPRESA AND'
      'D.EJERCICIO <= :EJERCICIO AND'
      'D.CANAL = :CANAL AND'
      'D.SIGNO = '#39'C'#39' AND'
      'D.ID_CAB_Z_RECIBOS = :ID AND'
      '((FA.ID_RECIBO = :ID) OR (FA.ID_RECIBO = 0)) AND'
      'D.MARCADO = 1 AND'
      'D.VISIBLE = 1')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_DETALLES_S_FAC'
      'SET '
      'ID_RECIBO = ?ID_RECIBO,'
      'IMPORTE_DESGLOSE=?IMPORTE_DESGLOSE'
      'WHERE '
      'ID_DETALLES_S = ?ID_DETALLES_S')
    DataSource = DSCabecera
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 216
    Top = 56
    object QMFacturasDesgloseID_REGISTRO: TIntegerField
      DisplayLabel = 'Id Reg.'
      FieldName = 'ID_REGISTRO'
    end
    object dtmfldQMFacturasDesgloseFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMFacturasDesgloseUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMFacturasDesglosePRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object QMFacturasDesgloseBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object QMFacturasDesgloseTITULO_IDIOMA: TFIBStringField
      DisplayLabel = 'Titulo Idioma'
      FieldName = 'TITULO_IDIOMA'
      Size = 60
    end
    object QMFacturasDesglosePRO_NUM_PLANO: TFIBStringField
      DisplayLabel = 'Pro. Num. Plano'
      FieldName = 'PRO_NUM_PLANO'
      Size = 35
    end
    object QMFacturasDesgloseRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMFacturasDesgloseLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMFacturasDesgloseTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      DisplayWidth = 60
      FieldName = 'TITULO'
      Size = 256
    end
    object QMFacturasDesgloseID_RECIBO: TIntegerField
      DisplayLabel = 'Id Recibo'
      FieldName = 'ID_RECIBO'
      OnChange = QMFacturasDesgloseID_RECIBOChange
    end
    object QMFacturasDesgloseID_DETALLES_S: TIntegerField
      DisplayLabel = 'Id Doc. Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMFacturasDesgloseIMPORTE_DESGLOSE: TFloatField
      DisplayLabel = 'Importe Desglose'
      FieldName = 'IMPORTE_DESGLOSE'
      DisplayFormat = '0.00'
    end
  end
  object DSFacturasDesglose: TDataSource
    DataSet = QMFacturasDesglose
    Left = 320
    Top = 56
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 464
    Top = 8
  end
end
