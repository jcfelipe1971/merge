object DMOrdenesDePago: TDMOrdenesDePago
  OldCreateOrder = False
  OnCreate = DMOrdenesDePagoCreate
  OnDestroy = DMOrdenesDePagoDestroy
  Left = 702
  Top = 150
  Height = 491
  Width = 553
  object QMOrdenPago: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CARTERA_ORD_PAGO'
      'WHERE'
      '  NUM_ORDEN=?old_NUM_ORDEN AND '
      '  SIGNO=?old_SIGNO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CARTERA_ORD_PAGO'
      
        '  (EMPRESA,EJERCICIO,CANAL,SIGNO,NUM_ORDEN,FECHA,FECHA_VTO,IMPOR' +
        'TE,BANCO,TITULO,CERRADO,RIC,ASIENTO,LINEAS,COD_NORMA34,GASTOS,DE' +
        'TALLE_CARGOS,NORMA_CREADA)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?SIGNO,?NUM_ORDEN,?FECHA,?FECHA_VT' +
        'O,?IMPORTE,?BANCO,?TITULO,?CERRADO,?RIC,?ASIENTO,?LINEAS,?COD_NO' +
        'RMA34,?GASTOS,?DETALLE_CARGOS,?NORMA_CREADA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CARTERA_ORD_PAGO'
      'WHERE'
      '  NUM_ORDEN=?NUM_ORDEN AND '
      '  SIGNO=?SIGNO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA '
      ''
      ''
      '')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CARTERA_ORD_PAGO'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  SIGNO='#39'P'#39
      'ORDER BY NUM_ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CARTERA_ORD_PAGO'
      'SET'
      '  FECHA=?FECHA '
      '  ,FECHA_VTO=?FECHA_VTO '
      '  ,IMPORTE=?IMPORTE '
      '  ,BANCO=?BANCO '
      '  ,TITULO=?TITULO '
      '  ,CERRADO=?CERRADO '
      '  ,RIC=?RIC '
      '  ,ASIENTO=?ASIENTO '
      '  ,LINEAS=?LINEAS '
      '  ,COD_NORMA34=?COD_NORMA34 '
      '  ,GASTOS=?GASTOS '
      '  ,DETALLE_CARGOS=?DETALLE_CARGOS '
      '  ,NORMA_CREADA=?NORMA_CREADA'
      'WHERE'
      '  NUM_ORDEN=?NUM_ORDEN AND '
      '  SIGNO=?SIGNO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    AfterOpen = QMOrdenPagoAfterOpen
    AfterPost = QMOrdenPagoAfterPost
    AfterScroll = QMOrdenPagoAfterScroll
    BeforeClose = QMOrdenPagoBeforeClose
    BeforePost = QMOrdenPagoBeforePost
    OnNewRecord = QMOrdenPagoNewRecord
    OnPostError = QMOrdenPagoPostError
    ClavesPrimarias.Strings = (
      'NUM_ORDEN '
      'SIGNO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CARTERA_ORD_PAGO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 8
    object QMOrdenPagoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMOrdenPagoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMOrdenPagoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMOrdenPagoSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMOrdenPagoNUM_ORDEN: TIntegerField
      DisplayLabel = 'Num. Orden'
      FieldName = 'NUM_ORDEN'
    end
    object QMOrdenPagoFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMOrdenPagoFECHA_VTO: TDateTimeField
      DisplayLabel = 'Fecha Vto.'
      FieldName = 'FECHA_VTO'
    end
    object QMOrdenPagoIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMOrdenPagoBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object QMOrdenPagoTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMOrdenPagoCERRADO: TIntegerField
      DisplayLabel = 'Cerrado'
      FieldName = 'CERRADO'
    end
    object QMOrdenPagoRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMOrdenPagoASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
      OnGetText = QMOrdenPagoASIENTOGetText
    end
    object QMOrdenPagoLINEAS: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINEAS'
    end
    object QMOrdenPagoCOD_NORMA34: TIntegerField
      DisplayLabel = 'Cod. Norma 34'
      FieldName = 'COD_NORMA34'
    end
    object QMOrdenPagoGASTOS: TIntegerField
      DisplayLabel = 'Gastos'
      FieldName = 'GASTOS'
    end
    object QMOrdenPagoDETALLE_CARGOS: TIntegerField
      DisplayLabel = 'Detalles Cargos'
      FieldName = 'DETALLE_CARGOS'
    end
    object QMOrdenPagoNORMA_CREADA: TIntegerField
      DisplayLabel = 'Norma Creada'
      FieldName = 'NORMA_CREADA'
    end
  end
  object DSQMOrdenPago: TDataSource
    DataSet = QMOrdenPago
    Left = 152
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 464
    Top = 8
  end
  object xBancos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
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
    DataSource = DSQMOrdenPago
    Left = 48
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
    Left = 152
    Top = 104
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CARTERA_ORD_PAGO'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SIGNO=?old_SIGNO AND '
      '  REGISTRO=?old_REGISTRO AND '
      '  LINEA=?old_LINEA AND '
      '  EJERCICIO_ORD_PAGO=?old_EJERCICIO_ORD_PAGO AND '
      '  ORD_PAGO=?old_ORD_PAGO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CARTERA_ORD_PAGO'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SIGNO,REGISTRO,LINEA,COD_CLI_PRO,VE' +
        'NCIMIENTO,CTA_PAGO,LIQUIDO,PAGADO,'#13#10'IMPAGADO,FORMA_PAGO,TIPO_EFE' +
        'CTO,ORDENAR_PAGO,CONFIRMING,REMESAR,ESTADO,REMESA,DOC_NUMERO,DOC' +
        '_SERIE,'#13#10'DOC_FECHA,DOC_TIPO,RIC,RIVA,FECHA_CIERRE,ESTADO_RECIBO,' +
        'RECIBIDO,ORD_PAGO,MONEDA,LIQUIDO_CANAL,'#13#10'MONEDA_CANAL,EJERCICIO_' +
        'ORD_PAGO,ID_CARTERA,ID_CARTERA_DETALLE,ID_DOC,SOCIEDAD,PAGO_AUTO' +
        'RIZADO,TITULO)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SIGNO,?REGISTRO,?LINEA,?COD_CLI' +
        '_PRO,?VENCIMIENTO,?CTA_PAGO,?LIQUIDO,?PAGADO,'#13#10'?IMPAGADO,?FORMA_' +
        'PAGO,?TIPO_EFECTO,?ORDENAR_PAGO,?CONFIRMING,?REMESAR,?ESTADO,?RE' +
        'MESA,?DOC_NUMERO,?DOC_SERIE,'#13#10'?DOC_FECHA,?DOC_TIPO,?RIC,?RIVA,?F' +
        'ECHA_CIERRE,?ESTADO_RECIBO,?RECIBIDO,?ORD_PAGO,?MONEDA,?LIQUIDO_' +
        'CANAL,'#13#10'?MONEDA_CANAL,?EJERCICIO_ORD_PAGO,?ID_CARTERA,?ID_CARTER' +
        'A_DETALLE,?ID_DOC,?SOCIEDAD,?PAGO_AUTORIZADO,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CARTERA_ORD_PAGO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      '/* Se crea dinamicamente */'
      'SELECT * FROM VER_CARTERA_ORD_PAGO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO_ORD_PAGO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO='#39'P'#39' AND'
      '  ORD_PAGO=?NUM_ORDEN'
      'order by vencimiento')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CARTERA_ORD_PAGO'
      'SET'
      '  ORD_PAGO=?ORD_PAGO,'
      '  EJERCICIO_ORD_PAGO=?EJERCICIO_ORD_PAGO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMOrdenPago
    AfterPost = QMDetalleAfterPost
    BeforePost = QMDetalleBeforePost
    OnCalcFields = QMDetalleCalcFields
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
    TableName = 'VER_CARTERA_ORD_PAGO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 152
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Doc. Ejer.'
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
      DisplayLabel = 'Cod Cli Pro'
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
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMDetalleTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efec.'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object QMDetalleREMESAR: TIntegerField
      DisplayLabel = 'Rem.'
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
      DisplayLabel = 'Doc. Nro.'
      FieldName = 'DOC_NUMERO'
    end
    object QMDetalleDOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc. Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMDetalleDOC_FECHA: TDateTimeField
      DisplayLabel = 'Doc Fec.'
      FieldName = 'DOC_FECHA'
    end
    object QMDetalleDOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
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
    object QMDetalleORD_PAGO: TIntegerField
      DisplayLabel = 'Ord. Pago'
      FieldName = 'ORD_PAGO'
    end
    object QMDetalleMONEDA: TFIBStringField
      DisplayLabel = 'Mon.'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMDetalleLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO_CANAL'
    end
    object QMDetalleMONEDA_CANAL: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA_CANAL'
      Size = 3
    end
    object QMDetalleEJERCICIO_ORD_PAGO: TIntegerField
      DisplayLabel = 'Ej. Orden'
      FieldName = 'EJERCICIO_ORD_PAGO'
    end
    object QMDetalleID_CARTERA: TIntegerField
      DisplayLabel = 'ID Cartera'
      FieldName = 'ID_CARTERA'
    end
    object QMDetalleID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'ID Det. Cartera'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object QMDetalleID_DOC: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_DOC'
    end
    object QMDetalleORDENAR_PAGO: TIntegerField
      DisplayLabel = 'Ord. Pago'
      FieldName = 'ORDENAR_PAGO'
    end
    object QMDetalleSOCIEDAD: TFIBStringField
      DisplayLabel = 'Sociedad'
      FieldName = 'SOCIEDAD'
      Size = 4
    end
    object QMDetalleCONFIRMING: TIntegerField
      DisplayLabel = 'Confirming'
      FieldName = 'CONFIRMING'
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
    object QMDetalleNUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Factura'
      FieldName = 'NUM_FACTURA'
      Size = 40
    end
    object QMDetallePAGO_AUTORIZADO: TIntegerField
      DisplayLabel = 'Pago Autorizado'
      FieldName = 'PAGO_AUTORIZADO'
    end
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 150
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 152
    Top = 152
  end
  object xInfoActualizada: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT IMPORTE, CERRADO, COD_NORMA34, RIC, ASIENTO'
      'FROM EMP_CARTERA_ORD_PAGO'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  SIGNO='#39'P'#39' AND'
      '  NUM_ORDEN=?NUM_ORDEN')
    SelectSQL.Strings = (
      'SELECT IMPORTE, CERRADO, COD_NORMA34, RIC, ASIENTO'
      'FROM EMP_CARTERA_ORD_PAGO'
      'WHERE '
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  SIGNO='#39'P'#39' AND'
      '  NUM_ORDEN=?NUM_ORDEN')
    UniDirectional = False
    DataSource = DSQMOrdenPago
    Left = 48
    Top = 56
    object xInfoActualizadaIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xInfoActualizadaCERRADO: TIntegerField
      DisplayLabel = 'Cerrado'
      FieldName = 'CERRADO'
    end
    object xInfoActualizadaCOD_NORMA34: TIntegerField
      DisplayLabel = 'Cod. Norma 34'
      FieldName = 'COD_NORMA34'
    end
    object xInfoActualizadaRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object xInfoActualizadaASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
  end
  object DSxInfoActualizada: TDataSource
    DataSet = xInfoActualizada
    Left = 152
    Top = 56
  end
  object xBancoOrdPago: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_BANCOS_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  BANCO=?BANCO')
    UniDirectional = False
    Left = 264
    Top = 8
  end
  object xProveedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT NIF,TITULO,TERCERO /*dji lrk kri*/'
      'FROM VER_PROVEEDORES'
      '  where empresa=?empresa and'
      '             ejercicio=?ejercicio and'
      '             canal=?canal and'
      '             proveedor=?cod_cli_pro')
    UniDirectional = False
    DataSource = DSxRecibos
    Left = 48
    Top = 248
  end
  object xProveedorBanco: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TERCEROS_BANCOS'
      'WHERE'
      '  TERCERO=?TERCERO AND '
      '  BANCO=?BANCO ')
    SelectSQL.Strings = (
      'SELECT ENTIDAD, SUCURSAL, CONTROL, CUENTA, IBAN, BIC'
      'FROM SYS_TERCEROS_BANCOS'
      'WHERE'
      'TERCERO = ?TERCERO AND'
      'ACTIVA = 1 AND'
      '((MODO = 0) OR (MODO = 1))'
      'ORDER BY ORDEN')
    UniDirectional = False
    Left = 264
    Top = 104
  end
  object xRecibos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CARTERA_ORD_PAGO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CARTERA_ORD_PAGO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO_ORD_PAGO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO='#39'P'#39' AND'
      '  ORD_PAGO=?NUM_ORDEN'
      'order by vencimiento')
    UniDirectional = False
    DataSource = DSQMOrdenPago
    AfterScroll = xRecibosAfterScroll
    BeforeOpen = xRecibosBeforeOpen
    Left = 48
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
    object xRecibosORD_PAGO: TIntegerField
      DisplayLabel = 'Ord. Pago'
      FieldName = 'ORD_PAGO'
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
    object xRecibosMONEDA_CANAL: TFIBStringField
      DisplayLabel = 'Mon. Can.'
      FieldName = 'MONEDA_CANAL'
      Size = 3
    end
    object xRecibosEJERCICIO_ORD_PAGO: TIntegerField
      DisplayLabel = 'Ejer. Ord. Pago'
      FieldName = 'EJERCICIO_ORD_PAGO'
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
    object xRecibosORDENAR_PAGO: TIntegerField
      DisplayLabel = 'Ordenar Pago'
      FieldName = 'ORDENAR_PAGO'
    end
    object xRecibosNUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Factura'
      FieldName = 'NUM_FACTURA'
      Size = 40
    end
  end
  object DSxRecibos: TDataSource
    DataSet = xRecibos
    Left = 152
    Top = 200
  end
  object DSxProveedor: TDataSource
    DataSet = xProveedor
    Left = 152
    Top = 248
  end
  object xDireccionProveedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from sys_terceros_direcciones '
      'where tercero=?tercero')
    UniDirectional = False
    Left = 48
    Top = 344
  end
  object xLoc_T: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT '
      'LO.CODIGO_POSTAL AS CODPOSTAL,'
      'LO.TITULO,'
      'PR.TITULO AS PROVINCIA,'
      'PA.TITULO AS TITULO_PAIS,'
      'PA.PAIS_C2 AS PAIS_C2,'
      'PA.PERTENECE_CEE'
      'FROM SYS_LOCALIDADES LO  '
      'LEFT JOIN SYS_PROVINCIAS PR'
      'ON (LO.PROVINCIA=PR.PROVINCIA AND LO.PAIS=PR.PAIS)'
      'LEFT JOIN SYS_PAISES PA'
      'ON (PR.PAIS=PA.PAIS)'
      'WHERE LO.LOCALIDAD = ?DIR_LOCALIDAD')
    UniDirectional = False
    DataSource = DSxDireccionProveedor
    Left = 48
    Top = 392
  end
  object DSxLoc_T: TDataSource
    DataSet = xLoc_T
    Left = 152
    Top = 392
  end
  object DSxDireccionProveedor: TDataSource
    DataSet = xDireccionProveedor
    Left = 152
    Top = 344
  end
  object xTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TERCEROS'
      'WHERE'
      '  TERCERO=?TERCERO ')
    SelectSQL.Strings = (
      'SELECT TELEFONO01,TELEFAX, NOMBRE_R_SOCIAL'
      'FROM SYS_TERCEROS'
      '  WHERE TERCERO=?TERCERO')
    UniDirectional = False
    Left = 264
    Top = 152
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
      'SELECT * FROM CON_CUENTAS_GES_FP'
      
        '  where((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?ca' +
        'nal)and'
      '             (forma_pago=?forma_pago))')
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
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 264
    Top = 56
  end
  object xAcreedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT NIF,TITULO, TERCERO /*dji lrk kri*/'
      'FROM VER_ACREEDORES'
      '  where empresa=?empresa and'
      '             ejercicio=?ejercicio and'
      '             canal=?canal and'
      '             Acreedor=?cod_cli_pro')
    UniDirectional = False
    DataSource = DSxRecibos
    Left = 48
    Top = 296
  end
  object DSxAcreedor: TDataSource
    DataSet = xAcreedor
    Left = 152
    Top = 296
  end
  object Norma34: TCVBNorma34CSB
    NomFichero = 'CSB34.TXT'
    Euros = True
    Left = 368
    Top = 8
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
    Top = 56
  end
  object Norma34_1: TCVBNorma34_1CSB
    NomFichero = 'CSB34.TXT'
    Left = 368
    Top = 56
  end
  object Norma34_14: TCVBNorma34_14CSB
    NomFichero = 'CSB34.TXT'
    Depura = True
    Left = 368
    Top = 104
  end
end
