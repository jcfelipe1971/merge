object DMConfirming: TDMConfirming
  OldCreateOrder = False
  OnCreate = DMConfirmingCreate
  OnDestroy = DMConfirmingDestroy
  Left = 455
  Top = 158
  Height = 492
  Width = 553
  object QMConfirming: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CARTERA_CONFIRMING'
      'WHERE'
      '  NUM_CONFIRMING=?old_NUM_CONFIRMING AND '
      '  SIGNO=?old_SIGNO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CARTERA_CONFIRMING'
      
        '  (EMPRESA,EJERCICIO,CANAL,NUM_CONFIRMING,BANCO,TITULO,SIGNO,IMP' +
        'ORTE,CERRADO,RIC,FECHA,ASIENTO,CLASE_PAGO,CODIGO_ESTADISTICO,TIP' +
        'O_PAGO,FECHA_VTO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?NUM_CONFIRMING,?BANCO,?TITULO,?SI' +
        'GNO,?IMPORTE,?CERRADO,?RIC,?FECHA,?ASIENTO,?CLASE_PAGO,?CODIGO_E' +
        'STADISTICO,?TIPO_PAGO,?FECHA_VTO)'
      ' ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CARTERA_CONFIRMING'
      'WHERE'
      '  NUM_CONFIRMING=?NUM_CONFIRMING AND '
      '  SIGNO=?SIGNO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CARTERA_CONFIRMING'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  SIGNO='#39'P'#39
      'ORDER BY NUM_CONFIRMING')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CARTERA_CONFIRMING'
      'SET'
      '  BANCO=?BANCO '
      '  ,TITULO=?TITULO '
      '  ,CERRADO=?CERRADO '
      '  ,RIC=?RIC '
      '  ,FECHA=?FECHA '
      '  ,ASIENTO=?ASIENTO '
      '  ,CLASE_PAGO=?CLASE_PAGO'
      '  ,CODIGO_ESTADISTICO=?CODIGO_ESTADISTICO'
      '  ,TIPO_PAGO=?TIPO_PAGO'
      '  ,FECHA_VTO=?FECHA_VTO'
      'WHERE'
      '  NUM_CONFIRMING=?NUM_CONFIRMING AND '
      '  SIGNO=?SIGNO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterOpen = QMConfirmingAfterOpen
    AfterPost = QMConfirmingAfterPost
    AfterScroll = QMConfirmingAfterScroll
    BeforePost = QMConfirmingBeforePost
    OnNewRecord = QMConfirmingNewRecord
    OnPostError = QMConfirmingPostError
    ClavesPrimarias.Strings = (
      'NUM_CONFIRMING '
      'SIGNO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CARTERA_CONFIRMING'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMConfirmingEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConfirmingEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMConfirmingCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMConfirmingSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMConfirmingNUM_CONFIRMING: TIntegerField
      DisplayLabel = 'Confirming'
      FieldName = 'NUM_CONFIRMING'
    end
    object QMConfirmingFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMConfirmingIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMConfirmingBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object QMConfirmingTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMConfirmingCERRADO: TIntegerField
      DisplayLabel = 'Cerrado'
      FieldName = 'CERRADO'
    end
    object QMConfirmingRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMConfirmingASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
      OnGetText = QMConfirmingASIENTOGetText
    end
    object QMConfirmingRIESGO_DESCONTADO: TIntegerField
      DisplayLabel = 'Riesgo Desc.'
      FieldName = 'RIESGO_DESCONTADO'
    end
    object QMConfirmingRIC_VTO: TIntegerField
      DisplayLabel = 'RIC Vto.'
      FieldName = 'RIC_VTO'
    end
    object QMConfirmingASIENTO_VTO: TIntegerField
      DisplayLabel = 'Ato. Vto.'
      FieldName = 'ASIENTO_VTO'
      OnGetText = QMConfirmingASIENTO_VTOGetText
    end
    object QMConfirmingCLASE_PAGO: TFIBStringField
      DisplayLabel = 'Clase de Pago'
      FieldName = 'CLASE_PAGO'
      Size = 1
    end
    object QMConfirmingCODIGO_ESTADISTICO: TFIBStringField
      DisplayLabel = 'C'#243'digo Estad'#237'stico'
      FieldName = 'CODIGO_ESTADISTICO'
      Size = 6
    end
    object QMConfirmingTIPO_PAGO: TFIBStringField
      DisplayLabel = 'Tipo Pago'
      FieldName = 'TIPO_PAGO'
      Size = 1
    end
    object QMConfirmingFECHA_VTO: TDateTimeField
      DisplayLabel = 'Fec. Vencimiento'
      FieldName = 'FECHA_VTO'
    end
  end
  object DSQMConfirming: TDataSource
    DataSet = QMConfirming
    Left = 168
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 424
    Top = 8
  end
  object xBancos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_BANCOS'
      'WHERE'
      '  BANCO=?BANCO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT EMPRESA,BANCO,TITULO'
      'FROM EMP_BANCOS'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  BANCO=?BANCO')
    UniDirectional = False
    DataSource = DSQMConfirming
    Left = 40
    Top = 104
    object xBancosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
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
    Left = 168
    Top = 104
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CARTERA_CONFIRMING'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SIGNO=?old_SIGNO AND '
      '  REGISTRO=?old_REGISTRO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CARTERA_CONFIRMING'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SIGNO,REGISTRO,LINEA,COD_CLI_PRO,TI' +
        'TULO,VENCIMIENTO,CTA_PAGO,LIQUIDO,'#13#10'PAGADO,IMPAGADO,FORMA_PAGO,T' +
        'IPO_EFECTO,ACEPTADO,REMESAR,ESTADO,REMESA,DOC_NUMERO,DOC_SERIE,'#13 +
        #10'DOC_FECHA,DOC_TIPO,RIC,RIVA,FECHA_CIERRE,ESTADO_RECIBO,RECIBIDO' +
        ',CONFIRMING,MONEDA,LIQUIDO_CANAL,'#13#10'MONEDA_CANAL,EJERCICIO_CONFIR' +
        'MING,ID_CARTERA,ID_CARTERA_DETALLE,ID_DOC,PAGO_AUTORIZADO)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SIGNO,?REGISTRO,?LINEA,?COD_CLI' +
        '_PRO,?TITULO,?VENCIMIENTO,?CTA_PAGO,?LIQUIDO,'#13#10'?PAGADO,?IMPAGADO' +
        ',?FORMA_PAGO,?TIPO_EFECTO,?ACEPTADO,?REMESAR,?ESTADO,?REMESA,?DO' +
        'C_NUMERO,?DOC_SERIE,'#13#10'?DOC_FECHA,?DOC_TIPO,?RIC,?RIVA,?FECHA_CIE' +
        'RRE,?ESTADO_RECIBO,?RECIBIDO,?CONFIRMING,?MONEDA,?LIQUIDO_CANAL,' +
        #13#10'?MONEDA_CANAL,?EJERCICIO_CONFIRMING,?ID_CARTERA,?ID_CARTERA_DE' +
        'TALLE,?ID_DOC,?PAGO_AUTORIZADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CARTERA_CONFIRMING'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CARTERA_CONFIRMING'
      'WHERE'
      '  EMPRESA = :EMPRESA AND '
      '  EJERCICIO_CONFIRMING = :EJERCICIO AND '
      '  CANAL = :CANAL AND '
      '  SIGNO = '#39'P'#39' AND'
      '  CONFIRMING = :NUM_CONFIRMING AND'
      '  CONFIRMING > 0'
      'ORDER BY VENCIMIENTO ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CARTERA_CONFIRMING'
      'SET'
      '  CONFIRMING=?CONFIRMING '
      '  ,EJERCICIO_CONFIRMING=?EJERCICIO_CONFIRMING'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMConfirming
    AfterPost = QMDetalleAfterPost
    BeforePost = QMDetalleBeforePost
    OnCalcFields = QMDetalleCalcFields
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
    TableName = 'VER_CARTERA_CONFIRMING'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 152
    object QMDetalleLIQUIDO_MONEDA: TFloatField
      DisplayLabel = 'Liquido Mon.'
      FieldKind = fkCalculated
      FieldName = 'LIQUIDO_MONEDA'
      OnGetText = QMDetalleLIQUIDO_MONEDAGetText
      Calculated = True
    end
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
      DisplayLabel = 'Reg. Cartera'
      FieldName = 'REGISTRO'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cod. Cli./Prov.'
      FieldName = 'COD_CLI_PRO'
    end
    object QMDetalleVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Vencimiento'
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
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMDetalleTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efec.'
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
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMDetalleDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
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
    object QMDetalleMONEDA: TFIBStringField
      DisplayLabel = 'Mon.'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMDetalleLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object QMDetalleMONEDA_CANAL: TFIBStringField
      DisplayLabel = 'Mon. Can.'
      FieldName = 'MONEDA_CANAL'
      Size = 3
    end
    object QMDetalleEJERCICIO_CONFIRMING: TIntegerField
      DisplayLabel = 'Ejer. Conf.'
      FieldName = 'EJERCICIO_CONFIRMING'
    end
    object QMDetalleSALDO_DEUDOR: TFloatField
      DisplayLabel = 'Saldo Deudor'
      FieldKind = fkCalculated
      FieldName = 'SALDO_DEUDOR'
      Calculated = True
    end
    object QMDetalleSALDO_ACREEDOR: TFloatField
      DisplayLabel = 'Saldo Acreedor'
      FieldKind = fkCalculated
      FieldName = 'SALDO_ACREEDOR'
      Calculated = True
    end
    object QMDetalleSALDO: TFloatField
      DisplayLabel = 'Saldo'
      FieldKind = fkCalculated
      FieldName = 'SALDO'
      Calculated = True
    end
    object QMDetalleID_CARTERA: TIntegerField
      DisplayLabel = 'Id Cartera'
      FieldName = 'ID_CARTERA'
    end
    object QMDetalleID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'Id Cartera Det.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object QMDetalleID_DOC: TIntegerField
      DisplayLabel = 'Id Documento'
      FieldName = 'ID_DOC'
    end
    object QMDetalleRIC_DESCUENTO: TIntegerField
      DisplayLabel = 'RIC Venc.'
      FieldName = 'RIC_DESCUENTO'
    end
    object QMDetalleEJERCICIO_RIC_DESCUENTO: TIntegerField
      DisplayLabel = 'Ejer. Venc.'
      FieldName = 'EJERCICIO_RIC_DESCUENTO'
    end
    object QMDetalleNUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Factura'
      FieldName = 'NUM_FACTURA'
      Size = 40
    end
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 150
    end
    object QMDetallePAGO_AUTORIZADO: TIntegerField
      DisplayLabel = 'Pago Autorizado'
      FieldName = 'PAGO_AUTORIZADO'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 168
    Top = 152
  end
  object xInfoActualizada: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CARTERA_CONFIRMING'
      'WHERE'
      '  NUM_CONFIRMING=?NUM_CONFIRMING AND '
      '  SIGNO=?SIGNO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT IMPORTE,CERRADO'
      'FROM EMP_CARTERA_CONFIRMING'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  SIGNO='#39'P'#39' AND'
      '  NUM_CONFIRMING=?NUM_CONFIRMING')
    UniDirectional = False
    DataSource = DSQMConfirming
    Left = 40
    Top = 56
    object xInfoActualizadaIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xInfoActualizadaCERRADO: TIntegerField
      DisplayLabel = 'Cerrado'
      FieldName = 'CERRADO'
    end
  end
  object DSxInfoActualizada: TDataSource
    DataSet = xInfoActualizada
    Left = 168
    Top = 56
  end
  object Confirming: TConfirming
    NomFichero = 'Confirming.TXT'
    Left = 424
    Top = 200
  end
  object xBancoConfirming: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_BANCOS_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'BANCO = :BANCO')
    UniDirectional = False
    Left = 296
    Top = 152
    object xBancoConfirmingEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xBancoConfirmingEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xBancoConfirmingCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xBancoConfirmingBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object xBancoConfirmingTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 35
    end
    object xBancoConfirmingENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'ENTIDAD'
      Size = 4
    end
    object xBancoConfirmingSUCURSAL: TFIBStringField
      DisplayLabel = 'Sucursal'
      FieldName = 'SUCURSAL'
      Size = 4
    end
    object xBancoConfirmingCONTROL: TFIBStringField
      DisplayLabel = 'Control'
      FieldName = 'CONTROL'
      Size = 2
    end
    object xBancoConfirmingRIESGO_CON: TFloatField
      DisplayLabel = 'Riesgo Con.'
      FieldName = 'RIESGO_CON'
    end
    object xBancoConfirmingRIESGO_UTI: TFloatField
      DisplayLabel = 'Riesgo Utilizado'
      FieldName = 'RIESGO_UTI'
    end
    object xBancoConfirmingACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object xBancoConfirmingCUENTA_CONTABLE: TFIBStringField
      DisplayLabel = 'Cta. Contable'
      FieldName = 'CUENTA_CONTABLE'
      Size = 15
    end
    object xBancoConfirmingCUENTA_CC: TFIBStringField
      DisplayLabel = 'Cta. Ccorriente'
      FieldName = 'CUENTA_CC'
      Size = 15
    end
    object xBancoConfirmingCUENTA_AHORRO: TFIBStringField
      DisplayLabel = 'Cta. Ahorro'
      FieldName = 'CUENTA_AHORRO'
      Size = 15
    end
    object xBancoConfirmingCUENTA_DTO: TFIBStringField
      DisplayLabel = 'Cta. Dto.'
      FieldName = 'CUENTA_DTO'
      Size = 15
    end
    object xBancoConfirmingSEPARA_APUNTES: TIntegerField
      DisplayLabel = 'Separa Apu.'
      FieldName = 'SEPARA_APUNTES'
    end
    object xBancoConfirmingCUENTA_CORRIENTE: TFIBStringField
      DisplayLabel = 'Cta. Corriente'
      FieldName = 'CUENTA_CORRIENTE'
    end
  end
  object xProveedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT NIF, TITULO, TERCERO /*DJI LRK KRI*/'
      'FROM VER_PROVEEDORES'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'PROVEEDOR = :COD_CLI_PRO')
    UniDirectional = False
    DataSource = DSxRecibos
    Left = 40
    Top = 248
    object xProveedorTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xProveedorNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xProveedorTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
  end
  object xProveedorBanco: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TERCEROS_BANCOS'
      'WHERE'
      '  TERCERO=?TERCERO AND '
      '  BANCO=?BANCO ')
    SelectSQL.Strings = (
      'SELECT ENTIDAD, SUCURSAL, CONTROL, CUENTA, IBAN, BIC, PAIS'
      'FROM SYS_TERCEROS_BANCOS'
      'WHERE'
      'TERCERO = :TERCERO AND'
      'ACTIVA = 1 AND'
      '((MODO = 0) OR (MODO = 1))'
      'ORDER BY ORDEN')
    UniDirectional = False
    Left = 296
    Top = 56
    object xProveedorBancoENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'ENTIDAD'
      Size = 4
    end
    object xProveedorBancoSUCURSAL: TFIBStringField
      DisplayLabel = 'Sucursal'
      FieldName = 'SUCURSAL'
      Size = 4
    end
    object xProveedorBancoCONTROL: TFIBStringField
      DisplayLabel = 'Control'
      FieldName = 'CONTROL'
      Size = 2
    end
    object xProveedorBancoCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
    end
    object xProveedorBancoIBAN: TFIBStringField
      DisplayLabel = 'I.B.A.N.'
      FieldName = 'IBAN'
      Size = 34
    end
    object xProveedorBancoBIC: TFIBStringField
      DisplayLabel = 'B.I.C.'
      FieldName = 'BIC'
      Size = 30
    end
    object xProveedorBancoPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
  end
  object xRecibos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CARTERA_CONFIRMING'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CARTERA_CONFIRMING'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO_CONFIRMING=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO='#39'P'#39' AND'
      '  CONFIRMING=?CONFIRMING'
      'order by vencimiento')
    UniDirectional = False
    DataSource = DSQMConfirming
    AfterScroll = xRecibosAfterScroll
    Left = 40
    Top = 200
    object xRecibosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xRecibosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xRecibosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
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
    object xRecibosCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cli./Prov./Acr.'
      FieldName = 'COD_CLI_PRO'
    end
    object xRecibosVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Venc.'
      FieldName = 'VENCIMIENTO'
    end
    object xRecibosCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
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
    object xRecibosFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xRecibosTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efecto'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object xRecibosACEPTADO: TIntegerField
      DisplayLabel = 'Aceptado'
      FieldName = 'ACEPTADO'
    end
    object xRecibosREMESAR: TIntegerField
      DisplayLabel = 'Remesar'
      FieldName = 'REMESAR'
    end
    object xRecibosESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xRecibosREMESA: TIntegerField
      DisplayLabel = 'Remesa'
      FieldName = 'REMESA'
    end
    object xRecibosDOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Nro.'
      FieldName = 'DOC_NUMERO'
    end
    object xRecibosDOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xRecibosDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object xRecibosDOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xRecibosRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object xRecibosRIVA: TIntegerField
      DisplayLabel = 'Reg. IVA'
      FieldName = 'RIVA'
    end
    object xRecibosFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object xRecibosESTADO_RECIBO: TFIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO_RECIBO'
      Size = 1
    end
    object xRecibosRECIBIDO: TIntegerField
      DisplayLabel = 'Recibido'
      FieldName = 'RECIBIDO'
    end
    object xRecibosCONFIRMING: TIntegerField
      DisplayLabel = 'Confirming'
      FieldName = 'CONFIRMING'
    end
    object xRecibosID_CARTERA: TIntegerField
      DisplayLabel = 'ID Cartera'
      FieldName = 'ID_CARTERA'
    end
    object xRecibosID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'ID Cart. Det.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object xRecibosID_DOC: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_DOC'
    end
    object xRecibosNUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Factura'
      FieldName = 'NUM_FACTURA'
      Size = 40
    end
  end
  object DSxRecibos: TDataSource
    DataSet = xRecibos
    Left = 168
    Top = 200
  end
  object DSxProveedor: TDataSource
    DataSet = xProveedor
    Left = 168
    Top = 248
  end
  object xDireccionProveedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SYS_TERCEROS_DIRECCIONES'
      'WHERE'
      'TERCERO = :TERCERO AND'
      'DIR_DEFECTO = 1')
    UniDirectional = False
    Left = 40
    Top = 296
    object xDireccionProveedorTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xDireccionProveedorDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object xDireccionProveedorDIR_TIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'DIR_TIPO'
      Size = 3
    end
    object xDireccionProveedorDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_NOMBRE'
      Size = 40
    end
    object xDireccionProveedorDIR_NOMBRE_2: TFIBStringField
      DisplayLabel = 'Direccion 2'
      FieldName = 'DIR_NOMBRE_2'
      Size = 40
    end
    object xDireccionProveedorDIR_NUMERO: TFIBStringField
      DisplayLabel = 'Numero'
      FieldName = 'DIR_NUMERO'
      Size = 15
    end
    object xDireccionProveedorDIR_BLOQUE_ESCALERA: TFIBStringField
      DisplayLabel = 'Bloq./Esc.'
      FieldName = 'DIR_BLOQUE_ESCALERA'
      Size = 4
    end
    object xDireccionProveedorDIR_PISO: TFIBStringField
      DisplayLabel = 'Piso'
      FieldName = 'DIR_PISO'
      Size = 2
    end
    object xDireccionProveedorDIR_PUERTA: TFIBStringField
      DisplayLabel = 'Puerta'
      FieldName = 'DIR_PUERTA'
      Size = 6
    end
    object xDireccionProveedorDIR_COMPLETA: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_COMPLETA'
      Size = 69
    end
    object xDireccionProveedorDIR_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'DIR_LOCALIDAD'
      Size = 8
    end
    object xDireccionProveedorDIR_COMPLETA_N: TFIBStringField
      DisplayLabel = 'Direccion Completa'
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
  end
  object xLoc_T: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT CODPOSTAL, TITULO, PROVINCIA, C_PAIS'
      'FROM VER_LOCALIDADES'
      'WHERE'
      'LOCALIDAD = :DIR_LOCALIDAD')
    UniDirectional = False
    DataSource = DSxDireccionProveedor
    Left = 40
    Top = 392
    object xLoc_TTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xLoc_TCODPOSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODPOSTAL'
      Size = 10
    end
    object xLoc_TPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object xLoc_TC_PAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'C_PAIS'
      Size = 3
    end
  end
  object DSxLoc_T: TDataSource
    DataSet = xLoc_T
    Left = 168
    Top = 392
  end
  object DSxDireccionProveedor: TDataSource
    DataSet = xDireccionProveedor
    Left = 168
    Top = 296
  end
  object xTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TERCEROS'
      'WHERE'
      '  TERCERO=?TERCERO ')
    SelectSQL.Strings = (
      'SELECT TELEFONO01, TELEFAX, EMAIL'
      'FROM SYS_TERCEROS'
      'WHERE'
      'TERCERO = :TERCERO')
    UniDirectional = False
    Left = 296
    Top = 104
    object xTercerosTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel. 1'
      FieldName = 'TELEFONO01'
    end
    object xTercerosTELEFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'TELEFAX'
    end
    object xTercerosEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
  end
  object xFormaPago: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CUENTAS_GES_FP'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  FORMA_PAGO=?old_FORMA_PAGO ')
    InsertSQL.Strings = (
      'INSERT INTO CON_CUENTAS_GES_FP'
      
        '  (TIPO_PAGO,CANAL,EJERCICIO,EMPRESA,TITULO,PLAZOS,DIAS_1_PLAZO,' +
        'DIAS_E_PLAZOS,REMESAR,PRONTO_PAGO,CUENTA_PAGO,FORMA_PAGO,TIPO_EF' +
        'ECTO,ACEPTAR)'
      'VALUES'
      
        '  (?TIPO_PAGO,?CANAL,?EJERCICIO,?EMPRESA,?TITULO,?PLAZOS,?DIAS_1' +
        '_PLAZO,?DIAS_E_PLAZOS,?REMESAR,?PRONTO_PAGO,?CUENTA_PAGO,?FORMA_' +
        'PAGO,?TIPO_EFECTO,?ACEPTAR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_GES_FP'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  FORMA_PAGO=?FORMA_PAGO ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM CON_CUENTAS_GES_FP'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'FORMA_PAGO = :FORMA_PAGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CUENTAS_GES_FP'
      'SET'
      '  TIPO_PAGO=?TIPO_PAGO '
      '  ,TITULO=?TITULO '
      '  ,PLAZOS=?PLAZOS '
      '  ,DIAS_1_PLAZO=?DIAS_1_PLAZO '
      '  ,DIAS_E_PLAZOS=?DIAS_E_PLAZOS '
      '  ,REMESAR=?REMESAR '
      '  ,PRONTO_PAGO=?PRONTO_PAGO '
      '  ,CUENTA_PAGO=?CUENTA_PAGO '
      '  ,TIPO_EFECTO=?TIPO_EFECTO '
      '  ,ACEPTAR=?ACEPTAR '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  FORMA_PAGO=?FORMA_PAGO ')
    DataSource = DSxRecibos
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'FORMA_PAGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CUENTAS_GES_FP'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 296
    Top = 8
    object xFormaPagoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xFormaPagoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xFormaPagoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xFormaPagoFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xFormaPagoCUENTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CUENTA_PAGO'
      Size = 15
    end
    object xFormaPagoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xFormaPagoPLAZOS: TIntegerField
      DisplayLabel = 'Plazos'
      FieldName = 'PLAZOS'
    end
    object xFormaPagoDIAS_1_PLAZO: TIntegerField
      DisplayLabel = 'Dia Plazo'
      FieldName = 'DIAS_1_PLAZO'
    end
    object xFormaPagoDIAS_E_PLAZOS: TIntegerField
      DisplayLabel = 'Dia e/Plazo'
      FieldName = 'DIAS_E_PLAZOS'
    end
    object xFormaPagoTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efecto'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object xFormaPagoREMESAR: TIntegerField
      DisplayLabel = 'Remesar'
      FieldName = 'REMESAR'
    end
    object xFormaPagoPRONTO_PAGO: TIntegerField
      DisplayLabel = 'Pronto Pago'
      FieldName = 'PRONTO_PAGO'
    end
    object xFormaPagoACEPTAR: TIntegerField
      DisplayLabel = 'Aceptar'
      FieldName = 'ACEPTAR'
    end
    object xFormaPagoTIPO_PAGO: TFIBStringField
      DisplayLabel = 'Tipo Pago'
      FieldName = 'TIPO_PAGO'
      Size = 1
    end
  end
  object xAcreedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT NIF, TITULO, TERCERO /*DJI LRK KRI*/'
      'FROM VER_ACREEDORES'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'ACREEDOR = :COD_CLI_PRO')
    UniDirectional = False
    DataSource = DSxRecibos
    Left = 40
    Top = 344
    object xAcreedorTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xAcreedorNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xAcreedorTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
  end
  object DSxAcreedor: TDataSource
    DataSet = xAcreedor
    Left = 168
    Top = 344
  end
  object Norma34: TCVBNorma34CSB
    NomFichero = 'CSB34.TXT'
    Euros = True
    Left = 424
    Top = 248
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 424
    Top = 56
  end
end
