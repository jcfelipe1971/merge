object DMTalones: TDMTalones
  OldCreateOrder = False
  OnCreate = DMTalonesCreate
  OnDestroy = DMTalonesDestroy
  Left = 517
  Top = 363
  Height = 377
  Width = 366
  object QMTalones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_TALONES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TALON=?old_TALON ')
    InsertSQL.Strings = (
      'INSERT INTO VER_TALONES'
      
        '  (EMPRESA,EJERCICIO,CANAL,TALON,COD_CLI_PRO,TIPO_TERCERO,DESCRI' +
        'PCION,LUGAR_LIBRAMIENTO,FECHA_LIBRAMIENTO,BANCO,IMPORTE,PAGADO,R' +
        'IC,ASIENTO,TIPO_ASIENTO_KRI,MARCA_CONT,TALON_PAPEL,Z_CONTADOR,Z_' +
        'NOTASTALON)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TALON,?COD_CLI_PRO,?TIPO_TERCERO,' +
        '?DESCRIPCION,?LUGAR_LIBRAMIENTO,?FECHA_LIBRAMIENTO,?BANCO,?IMPOR' +
        'TE,?PAGADO,?RIC,?ASIENTO,?TIPO_ASIENTO_KRI,?MARCA_CONT,?TALON_PA' +
        'PEL,?Z_CONTADOR,?Z_NOTASTALON)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_TALONES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TALON=?TALON ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_TALONES'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL'
      'ORDER BY EMPRESA, EJERCICIO, CANAL, TALON')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_TALONES'
      'SET'
      '  COD_CLI_PRO=?COD_CLI_PRO '
      '  ,TIPO_TERCERO=?TIPO_TERCERO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,LUGAR_LIBRAMIENTO=?LUGAR_LIBRAMIENTO '
      '  ,FECHA_LIBRAMIENTO=?FECHA_LIBRAMIENTO '
      '  ,BANCO=?BANCO '
      '  ,IMPORTE=?IMPORTE '
      '  ,PAGADO=?PAGADO '
      '  ,RIC=?RIC '
      '  ,ASIENTO=?ASIENTO '
      '  ,TALON=?TALON'
      '  ,TIPO_ASIENTO_KRI=?TIPO_ASIENTO_KRI'
      '  ,MARCA_CONT=?MARCA_CONT'
      '  ,TALON_PAPEL=?TALON_PAPEL'
      '  ,Z_CONTADOR=?Z_CONTADOR'
      '  ,Z_NOTASTALON=?Z_NOTASTALON'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TALON=?old_TALON ')
    AfterCancel = QMTalonesAfterCancel
    AfterOpen = QMTalonesAfterOpen
    AfterPost = Graba
    AfterScroll = QMTalonesAfterScroll
    BeforeCancel = QMTalonesBeforeCancel
    BeforePost = QMTalonesBeforePost
    OnCalcFields = QMTalonesCalcFields
    OnNewRecord = QMTalonesNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'TALON ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_TALONES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 8
    object QMTalonesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTalonesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMTalonesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMTalonesTALON: TFIBStringField
      DisplayLabel = 'Talon'
      FieldName = 'TALON'
      Size = 15
    end
    object QMTalonesCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cli./Prov./Acr.'
      FieldName = 'COD_CLI_PRO'
      OnChange = QMTalonesCOD_CLI_PROChange
    end
    object QMTalonesTIPO_TERCERO: TFIBStringField
      DisplayLabel = 'Tipo Tercero'
      FieldName = 'TIPO_TERCERO'
      Size = 3
    end
    object QMTalonesDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMTalonesLUGAR_LIBRAMIENTO: TFIBStringField
      DisplayLabel = 'Lugar Libramiento'
      FieldName = 'LUGAR_LIBRAMIENTO'
      Size = 60
    end
    object QMTalonesFECHA_LIBRAMIENTO: TDateTimeField
      DisplayLabel = 'Fec. Libramiento'
      FieldName = 'FECHA_LIBRAMIENTO'
    end
    object QMTalonesBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object QMTalonesIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMTalonesPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object QMTalonesRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMTalonesASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object QMTalonesTIPO_ASIENTO_KRI: TFIBStringField
      DisplayLabel = 'Tipo Asiento'
      FieldName = 'TIPO_ASIENTO_KRI'
      OnChange = QMTalonesTIPO_ASIENTO_KRIChange
      Size = 3
    end
    object QMTalonesMARCA_CONT: TIntegerField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_CONT'
    end
    object QMTalonesTALON_PAPEL: TFIBStringField
      DisplayLabel = 'Talon Papel'
      FieldName = 'TALON_PAPEL'
      Size = 15
    end
    object QMTalonesZ_NOTASTALON: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'Z_NOTASTALON'
      Size = 8
    end
    object QMTalonesZ_CONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'Z_CONTADOR'
    end
    object QMTalonesSALDO_DEUDOR: TFloatField
      DisplayLabel = 'Saldo Deudor'
      FieldKind = fkCalculated
      FieldName = 'SALDO_DEUDOR'
      Calculated = True
    end
    object QMTalonesSALDO_ACREEDOR: TFloatField
      DisplayLabel = 'Saldo Acreedor'
      FieldKind = fkCalculated
      FieldName = 'SALDO_ACREEDOR'
      Calculated = True
    end
    object QMTalonesSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldKind = fkCalculated
      FieldName = 'SALDO'
      Calculated = True
    end
  end
  object DSQMTalones: TDataSource
    DataSet = QMTalones
    Left = 160
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 288
    Top = 8
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CARTERA_TALONES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO AND '
      '  LINEA=?LINEA ')
    InsertSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CARTERA_TALONES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO AND '
      '  LINEA=?LINEA ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CARTERA_TALONES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CARTERA_TALONES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO<=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  TALON=?TALON AND'
      '  TALON_AUTOMATICO=1'
      'ORDER BY VENCIMIENTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CARTERA_TALONES'
      'SET'
      '  COD_CLI_PRO=?COD_CLI_PRO '
      '  ,VENCIMIENTO=?VENCIMIENTO '
      '  ,CTA_PAGO=?CTA_PAGO '
      '  ,LIQUIDO=?LIQUIDO '
      '  ,LIQUIDO_CANAL=?LIQUIDO_CANAL '
      '  ,PAGADO=?PAGADO '
      '  ,IMPAGADO=?IMPAGADO '
      '  ,FORMA_PAGO=?FORMA_PAGO '
      '  ,TIPO_EFECTO=?TIPO_EFECTO '
      '  ,ACEPTADO=?ACEPTADO '
      '  ,REMESAR=?REMESAR '
      '  ,ESTADO=?ESTADO '
      '  ,REMESA=?REMESA '
      '  ,DOC_NUMERO=?DOC_NUMERO '
      '  ,DOC_SERIE=?DOC_SERIE '
      '  ,DOC_FECHA=?DOC_FECHA '
      '  ,DOC_TIPO=?DOC_TIPO '
      '  ,RIC=?RIC '
      '  ,RIVA=?RIVA '
      '  ,FECHA_CIERRE=?FECHA_CIERRE '
      '  ,ESTADO_RECIBO=?ESTADO_RECIBO '
      '  ,RECIBIDO=?RECIBIDO '
      '  ,CONFIRMING=?CONFIRMING '
      '  ,TALON=?TALON '
      '  ,TALON_AUTOMATICO=?TALON_AUTOMATICO '
      '  ,MONEDA=?MONEDA '
      '  ,CAMBIO=?CAMBIO '
      '  ,ID_CARTERA=?ID_CARTERA '
      '  ,ID_CARTERA_DETALLE=?ID_CARTERA_DETALLE '
      '  ,ID_DOC=?ID_DOC '
      '  ,RETENCION=?RETENCION '
      '  ,TIPO_RETENCION=?TIPO_RETENCION '
      '  ,PAGO_AUTORIZADO=?PAGO_AUTORIZADO '
      '  ,NUM_FACTURA_PROV=?NUM_FACTURA_PROV '
      '  ,NUM_FACTURA_ACR=?NUM_FACTURA_ACR '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMTalones
    AfterPost = QMDetalleAfterPost
    BeforeEdit = QMDetalleBeforeEdit
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SIGNO '
      'REGISTRO '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CARTERA_TALONES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 104
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
    object QMDetalleSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMDetalleREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cod. Cli./Pro.'
      FieldName = 'COD_CLI_PRO'
    end
    object QMDetalleVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Venc.'
      FieldName = 'VENCIMIENTO'
    end
    object QMDetalleCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object QMDetalleLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMDetallePAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object QMDetalleIMPAGADO: TIntegerField
      DisplayLabel = 'Impagado'
      FieldName = 'IMPAGADO'
    end
    object QMDetalleFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F.Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMDetalleTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efecto'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object QMDetalleACEPTADO: TIntegerField
      DisplayLabel = 'Acept.'
      FieldName = 'ACEPTADO'
    end
    object QMDetalleREMESAR: TIntegerField
      DisplayLabel = 'Remesar'
      FieldName = 'REMESAR'
    end
    object QMDetalleESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMDetalleREMESA: TIntegerField
      DisplayLabel = 'Remesa'
      FieldName = 'REMESA'
    end
    object QMDetalleDOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object QMDetalleDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMDetalleDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fec. Doc.'
      FieldName = 'DOC_FECHA'
    end
    object QMDetalleDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMDetalleRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMDetalleRIVA: TIntegerField
      DisplayLabel = 'Reg. IVA'
      FieldName = 'RIVA'
    end
    object QMDetalleFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object QMDetalleESTADO_RECIBO: TFIBStringField
      DisplayLabel = 'Estado Rec.'
      FieldName = 'ESTADO_RECIBO'
      Size = 1
    end
    object QMDetalleRECIBIDO: TIntegerField
      DisplayLabel = 'Recibido'
      FieldName = 'RECIBIDO'
    end
    object QMDetalleCONFIRMING: TIntegerField
      DisplayLabel = 'Confirming'
      FieldName = 'CONFIRMING'
    end
    object QMDetalleTALON: TFIBStringField
      DisplayLabel = 'Talon'
      FieldName = 'TALON'
      Size = 15
    end
    object QMDetalleTALON_AUTOMATICO: TIntegerField
      DisplayLabel = 'Talon Autom.'
      FieldName = 'TALON_AUTOMATICO'
    end
    object QMDetalleLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object QMDetalleMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMDetalleLIQUIDO_MONEDA: TFloatField
      DisplayLabel = 'Liquido Moneda'
      FieldKind = fkCalculated
      FieldName = 'LIQUIDO_MONEDA'
      OnGetText = QMDetalleLIQUIDO_MONEDAGetText
      Calculated = True
    end
    object QMDetalleCAMBIO: TFloatField
      DisplayLabel = 'Cambio'
      FieldName = 'CAMBIO'
    end
    object QMDetalleID_CARTERA: TIntegerField
      DisplayLabel = 'ID Cartera'
      FieldName = 'ID_CARTERA'
    end
    object QMDetalleID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'ID Cart. Det.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object QMDetalleID_DOC: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_DOC'
    end
    object QMDetalleRETENCION: TIntegerField
      DisplayLabel = 'Ret.'
      FieldName = 'RETENCION'
    end
    object QMDetalleTIPO_RETENCION: TIntegerField
      DisplayLabel = 'Tipo Ret.'
      FieldName = 'TIPO_RETENCION'
    end
    object QMDetalleNUM_FACTURA_PROV: TFIBStringField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'NUM_FACTURA_PROV'
      Size = 40
    end
    object QMDetalleNUM_FACTURA_ACR: TFIBStringField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'NUM_FACTURA_ACR'
      Size = 40
    end
    object QMDetallePAGO_AUTORIZADO: TIntegerField
      DisplayLabel = 'Pago Autorizado'
      FieldName = 'PAGO_AUTORIZADO'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 160
    Top = 104
  end
  object DSxInfoActualizada: TDataSource
    DataSet = xInfoActualizada
    Left = 160
    Top = 56
  end
  object xInfoActualizada: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT IMPORTE,PAGADO'
      'FROM EMP_CARTERA_TALONES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  TALON=?TALON')
    SelectSQL.Strings = (
      'SELECT IMPORTE,PAGADO FROM EMP_CARTERA_TALONES'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  TALON=?TALON')
    UniDirectional = False
    DataSource = DSQMTalones
    Left = 48
    Top = 56
    object xInfoActualizadaIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xInfoActualizadaPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
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
    Left = 288
    Top = 56
  end
  object DSxTalonesPendientes: TDataSource
    DataSet = xTalonesPendientes
    Left = 160
    Top = 152
  end
  object xTalonesPendientes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_TALONES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TALON=?old_TALON ')
    InsertSQL.Strings = (
      'INSERT INTO VER_TALONES'
      
        '  (EMPRESA,EJERCICIO,CANAL,TALON,COD_CLI_PRO,TIPO_TERCERO,DESCRI' +
        'PCION,LUGAR_LIBRAMIENTO,FECHA_LIBRAMIENTO,BANCO,IMPORTE,PAGADO,R' +
        'IC,ASIENTO,TIPO_ASIENTO_KRI,MARCA_CONT)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?TALON,?COD_CLI_PRO,?TIPO_TERCERO,' +
        '?DESCRIPCION,?LUGAR_LIBRAMIENTO,?FECHA_LIBRAMIENTO,?BANCO,?IMPOR' +
        'TE,?PAGADO,?RIC,?ASIENTO,?TIPO_ASIENTO_KRI,?MARCA_CONT)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_TALONES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TALON=?TALON ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_TALONES'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'PAGADO=0'
      'ORDER BY EMPRESA, EJERCICIO, CANAL, TALON')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_TALONES'
      'SET'
      '  COD_CLI_PRO=?COD_CLI_PRO '
      '  ,TIPO_TERCERO=?TIPO_TERCERO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,LUGAR_LIBRAMIENTO=?LUGAR_LIBRAMIENTO '
      '  ,FECHA_LIBRAMIENTO=?FECHA_LIBRAMIENTO '
      '  ,BANCO=?BANCO '
      '  ,IMPORTE=?IMPORTE '
      '  ,PAGADO=?PAGADO '
      '  ,RIC=?RIC '
      '  ,ASIENTO=?ASIENTO '
      '  ,TIPO_ASIENTO_KRI=?TIPO_ASIENTO_KRI '
      '  ,MARCA_CONT=?MARCA_CONT '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TALON=?TALON ')
    AfterOpen = xTalonesPendientesAfterOpen
    BeforeClose = xTalonesPendientesBeforeClose
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'TALON ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_TALONES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 152
    object xTalonesPendientesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTalonesPendientesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xTalonesPendientesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xTalonesPendientesTALON: TFIBStringField
      DisplayLabel = 'Talon'
      FieldName = 'TALON'
      Size = 15
    end
    object xTalonesPendientesCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'COD_CLI_PRO'
    end
    object xTalonesPendientesTIPO_TERCERO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_TERCERO'
      Size = 3
    end
    object xTalonesPendientesDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object xTalonesPendientesLUGAR_LIBRAMIENTO: TFIBStringField
      DisplayLabel = 'Lugar'
      FieldName = 'LUGAR_LIBRAMIENTO'
      Size = 60
    end
    object xTalonesPendientesFECHA_LIBRAMIENTO: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_LIBRAMIENTO'
    end
    object xTalonesPendientesBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object xTalonesPendientesIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xTalonesPendientesPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object xTalonesPendientesRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object xTalonesPendientesASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object xTalonesPendientesTIPO_ASIENTO_KRI: TFIBStringField
      DisplayLabel = 'Tipo Asiento'
      FieldName = 'TIPO_ASIENTO_KRI'
      Size = 3
    end
    object xTalonesPendientesMARCA_CONT: TIntegerField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA_CONT'
    end
  end
  object xIncidencias: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_INCIDENCIAS'
      'WHERE '
      '  EMPRESA = ?EMPRESA AND'
      '  COD_CLI_PRO =  ?COD_CLI_PRO AND'
      '  TIPO_TERCERO = ?TIPO_TERCERO'
      'ORDER BY FECHA DESC')
    UniDirectional = False
    DataSource = DSxTalonesPendientes
    Left = 48
    Top = 200
    object xIncidenciasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xIncidenciasINCIDENCIA: TIntegerField
      DisplayLabel = 'Incidencia'
      FieldName = 'INCIDENCIA'
    end
    object xIncidenciasTITULO_INCIDENCIA: TFIBStringField
      DisplayLabel = 'Incidencia'
      FieldName = 'TITULO_INCIDENCIA'
      Size = 60
    end
    object xIncidenciasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xIncidenciasFECHA_RECEPCION: TDateTimeField
      DisplayLabel = 'Fec. Recep.'
      FieldName = 'FECHA_RECEPCION'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xIncidenciasTIPO_TERCERO: TFIBStringField
      DisplayLabel = 'Tipo Ter.'
      FieldName = 'TIPO_TERCERO'
      Size = 3
    end
    object xIncidenciasCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cod Cli./Pro.'
      FieldName = 'COD_CLI_PRO'
    end
    object xIncidenciasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xIncidenciasTITULO_TERCERO: TFIBStringField
      DisplayLabel = 'Titulo Terc.'
      FieldName = 'TITULO_TERCERO'
      Size = 60
    end
    object xIncidenciasDATOS_INCIDENCIA: TBlobField
      DisplayLabel = 'Datos Inc.'
      FieldName = 'DATOS_INCIDENCIA'
      Size = 8
    end
    object xIncidenciasFECHA_RESPUESTA: TDateTimeField
      DisplayLabel = 'Fecha Resp.'
      FieldName = 'FECHA_RESPUESTA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xIncidenciasRESPUESTA_INCIDENCIA: TBlobField
      DisplayLabel = 'Resp.'
      FieldName = 'RESPUESTA_INCIDENCIA'
      Size = 8
    end
    object xIncidenciasID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object xIncidenciasID_E: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_E'
    end
    object xIncidenciasDOC_EJERCICIO: TIntegerField
      DisplayLabel = 'Doc. Ejer.'
      FieldName = 'DOC_EJERCICIO'
    end
    object xIncidenciasDOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc. Ser.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xIncidenciasDOC_CANAL: TIntegerField
      DisplayLabel = 'Doc. Canl.'
      FieldName = 'DOC_CANAL'
    end
    object xIncidenciasDOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xIncidenciasDOC_RIG: TIntegerField
      DisplayLabel = 'Doc. Num.'
      FieldName = 'DOC_RIG'
    end
    object xIncidenciasENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xIncidenciasDIRECCION: TIntegerField
      DisplayLabel = 'Dir.'
      FieldName = 'DIRECCION'
    end
    object xIncidenciasDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_NOMBRE'
      Size = 76
    end
    object xIncidenciasAGENTE: TIntegerField
      DisplayLabel = 'Age.'
      FieldName = 'AGENTE'
    end
    object xIncidenciasCONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
    end
    object xIncidenciasTIT_CONTACTO: TFIBStringField
      DisplayLabel = 'Titulo Cont.'
      FieldName = 'TIT_CONTACTO'
      Size = 81
    end
    object xIncidenciasTIT_AGENTE: TFIBStringField
      DisplayLabel = 'Titulo Age.'
      FieldName = 'TIT_AGENTE'
      Size = 60
    end
    object xIncidenciasTIPO_INCIDENCIA_KRI: TFIBStringField
      DisplayLabel = 'Tipo Inc.'
      FieldName = 'TIPO_INCIDENCIA_KRI'
      Size = 3
    end
    object xIncidenciasTIT_TIPO_INCIDENCIA_KRI: TFIBStringField
      DisplayLabel = 'Tipo Incidencia'
      FieldName = 'TIT_TIPO_INCIDENCIA_KRI'
      Size = 40
    end
    object xIncidenciasUSUARIO: TIntegerField
      DisplayLabel = 'Usu.'
      FieldName = 'USUARIO'
    end
    object xIncidenciasNOMBRE_USUARIO: TFIBStringField
      DisplayLabel = 'Nombre Usu.'
      FieldName = 'NOMBRE_USUARIO'
      Size = 31
    end
  end
  object DSxIncidencias: TDataSource
    DataSet = xIncidencias
    Left = 160
    Top = 200
  end
end
