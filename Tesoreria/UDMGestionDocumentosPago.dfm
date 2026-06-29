object DMGestionDocumentosPago: TDMGestionDocumentosPago
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 373
  Top = 105
  Height = 649
  Width = 424
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 64
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 208
    Top = 8
  end
  object DSAgrupacionDocumentos: TDataSource
    DataSet = xAgrupacionDocumentos
    Left = 208
    Top = 56
  end
  object xAgrupacionDocumentos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CARTERA_AGRUP_DOC'
      'WHERE'
      '  ID_AGRUP=?old_ID_AGRUP ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CARTERA_AGRUP_DOC'
      
        '  (ID_AGRUP,EMPRESA,EJERCICIO,CANAL,RIG,TIPO_EFECTO,ENTRADA,TITU' +
        'LO,BANCO,FECHA,IMPORTE)'
      'VALUES'
      
        '  (?ID_AGRUP,?EMPRESA,?EJERCICIO,?CANAL,?RIG,?TIPO_EFECTO,?ENTRA' +
        'DA,?TITULO,?BANCO,?FECHA,?IMPORTE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CARTERA_AGRUP_DOC'
      'WHERE'
      '  ID_AGRUP=?ID_AGRUP ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CARTERA_AGRUP_DOC'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'TIPO_EFECTO=?TIPO_EFECTO'
      'ORDER BY RIG')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CARTERA_AGRUP_DOC'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,RIG=?RIG '
      '  ,TIPO_EFECTO=?TIPO_EFECTO '
      '  ,ENTRADA=?ENTRADA '
      '  ,TITULO=?TITULO '
      '  ,BANCO=?BANCO '
      '  ,FECHA=?FECHA '
      '  ,IMPORTE=?IMPORTE'
      'WHERE'
      '  ID_AGRUP=?ID_AGRUP ')
    AfterOpen = xAgrupacionDocumentosAfterOpen
    BeforeClose = xAgrupacionDocumentosBeforeClose
    BeforePost = xAgrupacionDocumentosBeforePost
    OnNewRecord = xAgrupacionDocumentosNewRecord
    ClavesPrimarias.Strings = (
      'ID_AGRUP ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CARTERA_AGRUP_DOC'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 56
    object xAgrupacionDocumentosID_AGRUP: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_AGRUP'
    end
    object xAgrupacionDocumentosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAgrupacionDocumentosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xAgrupacionDocumentosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xAgrupacionDocumentosRIG: TIntegerField
      DisplayLabel = 'Agrup.'
      FieldName = 'RIG'
    end
    object xAgrupacionDocumentosTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efecto'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object xAgrupacionDocumentosENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xAgrupacionDocumentosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xAgrupacionDocumentosBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object xAgrupacionDocumentosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xAgrupacionDocumentosIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
  end
  object DSAgrupacionDocumentosDet: TDataSource
    DataSet = xAgrupacionDocumentosDet
    Left = 208
    Top = 152
  end
  object xAgrupacionDocumentosDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CARTERA_AGRUP_DOC_DET'
      'WHERE'
      '  DOCUMENTO=?old_DOCUMENTO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  TIPO_EFECTO=?old_TIPO_EFECTO AND '
      '  ID_AGRUP=?old_ID_AGRUP ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CARTERA_AGRUP_DOC_DET'
      '  (ID_AGRUP,TIPO_EFECTO,EMPRESA,EJERCICIO,CANAL,DOCUMENTO,MARCA)'
      'VALUES'
      
        '  (?ID_AGRUP,?TIPO_EFECTO,?EMPRESA,?EJERCICIO,?CANAL,?DOCUMENTO,' +
        '?MARCA)')
    RefreshSQL.Strings = (
      'SELECT'
      'A.ID_AGRUP, A.TIPO_EFECTO, A.EMPRESA, A.EJERCICIO, A.CANAL,'
      'A.DOCUMENTO, A.MARCA,'
      
        'MIN(C.COD_CLI_PRO) COD_CLI_PRO, MIN(CC.TITULO) TITULO, SUM(D.LIQ' +
        'UIDO) LIQUIDO'
      'FROM'
      'EMP_CARTERA_AGRUP_DOC_DET A'
      'LEFT JOIN EMP_CARTERA_DETALLE D'
      'ON'
      'D.EMPRESA = A.EMPRESA AND'
      'D.EJERCICIO = A.EJERCICIO AND'
      'D.CANAL = A.CANAL AND'
      'D.DOCUMENTO = A.DOCUMENTO AND'
      'D.SIGNO = '#39'P'#39' AND'
      'D.DOC_AUTOMATICO ='
      'CASE A.TIPO_EFECTO'
      '    WHEN '#39'TAL'#39' THEN 1'
      '    WHEN '#39'PAG'#39' THEN 2'
      'END'
      'LEFT JOIN EMP_CARTERA C'
      'ON'
      'C.ID_CARTERA = D.ID_CARTERA'
      'LEFT JOIN CON_CUENTAS CC'
      'ON'
      'C.EMPRESA = CC.EMPRESA AND'
      'C.EJERCICIO = CC.EJERCICIO AND'
      'C.CANAL = CC.CANAL AND'
      'C.CUENTA = CC.CUENTA AND'
      'C.CUENTA_PGC = CC.PGC'
      'WHERE'
      'A.DOCUMENTO=?DOCUMENTO AND'
      'A.CANAL=?CANAL AND'
      'A.EJERCICIO=?EJERCICIO AND'
      'A.EMPRESA=?EMPRESA AND'
      'A.TIPO_EFECTO=?TIPO_EFECTO AND'
      'A.ID_AGRUP=?ID_AGRUP'
      
        'GROUP BY A.ID_AGRUP, A.TIPO_EFECTO, A.EMPRESA, A.EJERCICIO, A.CA' +
        'NAL,'
      'A.DOCUMENTO, A.MARCA'
      '')
    SelectSQL.Strings = (
      'SELECT'
      'A.ID_AGRUP, A.TIPO_EFECTO, A.EMPRESA, A.EJERCICIO, A.CANAL,'
      'A.DOCUMENTO, A.MARCA,'
      
        'MIN(C.COD_CLI_PRO) COD_CLI_PRO, MIN(CC.TITULO) TITULO, SUM(D.LIQ' +
        'UIDO) LIQUIDO'
      'FROM'
      'EMP_CARTERA_AGRUP_DOC_DET A'
      'LEFT JOIN EMP_CARTERA_DETALLE D'
      'ON'
      'D.EMPRESA = A.EMPRESA AND'
      'D.EJERCICIO = A.EJERCICIO AND'
      'D.CANAL = A.CANAL AND'
      'D.DOCUMENTO = A.DOCUMENTO AND'
      'D.SIGNO = '#39'P'#39' AND'
      'D.DOC_AUTOMATICO ='
      'CASE A.TIPO_EFECTO'
      '    WHEN '#39'TAL'#39' THEN 1'
      '    WHEN '#39'PAG'#39' THEN 2'
      'END'
      'LEFT JOIN EMP_CARTERA C'
      'ON'
      'C.ID_CARTERA = D.ID_CARTERA'
      'LEFT JOIN CON_CUENTAS CC'
      'ON'
      'C.EMPRESA = CC.EMPRESA AND'
      'C.EJERCICIO = CC.EJERCICIO AND'
      'C.CANAL = CC.CANAL AND'
      'C.CUENTA = CC.CUENTA AND'
      'C.CUENTA_PGC = CC.PGC'
      'WHERE'
      'A.ID_AGRUP=?ID_AGRUP '
      
        'GROUP BY A.ID_AGRUP, A.TIPO_EFECTO, A.EMPRESA, A.EJERCICIO, A.CA' +
        'NAL,'
      'A.DOCUMENTO, A.MARCA'
      'ORDER BY MIN(C.COD_CLI_PRO), A.EMPRESA, A.EJERCICIO, A.CANAL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CARTERA_AGRUP_DOC_DET'
      'SET'
      '  MARCA=?MARCA '
      'WHERE'
      '  DOCUMENTO=?DOCUMENTO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  TIPO_EFECTO=?TIPO_EFECTO AND '
      '  ID_AGRUP=?ID_AGRUP ')
    DataSource = DSAgrupacionDocumentos
    AfterOpen = xAgrupacionDocumentosDetAfterOpen
    AfterPost = xAgrupacionDocumentosDetAfterPost
    BeforeClose = xAgrupacionDocumentosDetBeforeClose
    ClavesPrimarias.Strings = (
      'DOCUMENTO '
      'CANAL '
      'EJERCICIO '
      'EMPRESA '
      'TIPO_EFECTO '
      'ID_AGRUP'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CARTERA_AGRUP_DOC_DET'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 152
    object xAgrupacionDocumentosDetID_AGRUP: TIntegerField
      DisplayLabel = 'Id Agrup.'
      FieldName = 'ID_AGRUP'
    end
    object xAgrupacionDocumentosDetTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efecto'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object xAgrupacionDocumentosDetEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAgrupacionDocumentosDetEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xAgrupacionDocumentosDetCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xAgrupacionDocumentosDetDOCUMENTO: TFIBStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 15
    end
    object xAgrupacionDocumentosDetMARCA: TIntegerField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
    end
    object xAgrupacionDocumentosDetCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Prov/Acr'
      FieldName = 'COD_CLI_PRO'
    end
    object xAgrupacionDocumentosDetTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 150
    end
    object xAgrupacionDocumentosDetLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
  end
  object Confirming: TConfirming
    NomFichero = 'Confirming.TXT'
    Left = 352
    Top = 56
  end
  object xBanco: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_BANCOS_CUENTAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  BANCO=?BANCO')
    UniDirectional = False
    Left = 64
    Top = 248
  end
  object xInfoActualizada: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
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
      'SELECT IMPORTE FROM EMP_CARTERA_AGRUP_DOC'
      'WHERE'
      'ID_AGRUP=?ID_AGRUP')
    UniDirectional = False
    DataSource = DSAgrupacionDocumentos
    Left = 64
    Top = 104
    object xInfoActualizadaIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
  end
  object DSxInfoActualizada: TDataSource
    DataSet = xInfoActualizada
    Left = 208
    Top = 104
  end
  object xRecibos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      'A.ID_AGRUP, '
      
        'DET.EMPRESA, DET.EJERCICIO, DET.CANAL, DET.SIGNO, DET.REGISTRO, ' +
        'DET.LINEA, CAR.COD_CLI_PRO, DET.VENCIMIENTO, '
      
        'DET.CTA_PAGO, DET.LIQUIDO, DET.LIQUIDO_CANAL, DET.PAGADO, DET.IM' +
        'PAGADO, CAR.FORMA_PAGO, DET.TIPO_EFECTO, '
      
        'FP.ACEPTAR, DET.REMESAR, DET.ESTADO, DET.REMESA, CAR.DOC_NUMERO,' +
        ' CAR.DOC_SERIE, CAR.DOC_FECHA, CAR.DOC_TIPO, CAR.RIC, '
      
        'CAR.RIVA, DET.FECHA_CIERRE, DET.ESTADO_RECIBO, DET.RECIBIDO, DET' +
        '.CONFIRMING, DET.DOCUMENTO, DET.DOC_AUTOMATICO, '
      
        'DET.MONEDA, DET.CAMBIO, DET.ID_CARTERA, DET.ID_CARTERA_DETALLE, ' +
        'CAR.ID_DOC, DET.RETENCION, DET.TIPO_RETENCION'
      'FROM EMP_CARTERA_AGRUP_DOC_DET A'
      'JOIN EMP_CARTERA_DETALLE DET'
      'ON'
      'A.EMPRESA = DET.EMPRESA AND'
      'A.EJERCICIO = DET.EJERCICIO AND'
      'A.CANAL = DET.CANAL AND'
      'A.DOCUMENTO = DET.DOCUMENTO'
      'JOIN EMP_CARTERA CAR'
      'ON'
      'DET.ID_CARTERA = CAR.ID_CARTERA'
      'LEFT JOIN CON_CUENTAS_GES_FP FP'
      'ON'
      'DET.EMPRESA = FP.EMPRESA AND'
      'DET.EJERCICIO = FP.EJERCICIO AND'
      'DET.CANAL = FP.CANAL AND'
      'CAR.FORMA_PAGO = FP.FORMA_PAGO'
      'WHERE'
      'A.ID_AGRUP = ?ID_AGRUP AND'
      'DET.VISIBLE = 1 AND'
      'DET.DOC_AUTOMATICO = ?DOC_AUTOMATICO AND'
      'DET.CONFIRMING = 0 AND'
      'DET.ORD_PAGO = 0'
      
        'ORDER BY CAR.COD_CLI_PRO, A.EMPRESA, A.EJERCICIO, A.CANAL, A.DOC' +
        'UMENTO')
    UniDirectional = False
    AfterScroll = xRecibosAfterScroll
    Left = 64
    Top = 296
    object xRecibosID_AGRUP: TIntegerField
      FieldName = 'ID_AGRUP'
    end
    object xRecibosEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xRecibosEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object xRecibosCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object xRecibosSIGNO: TFIBStringField
      FieldName = 'SIGNO'
      Size = 1
    end
    object xRecibosREGISTRO: TIntegerField
      FieldName = 'REGISTRO'
    end
    object xRecibosLINEA: TIntegerField
      FieldName = 'LINEA'
    end
    object xRecibosCOD_CLI_PRO: TIntegerField
      FieldName = 'COD_CLI_PRO'
    end
    object xRecibosVENCIMIENTO: TDateTimeField
      FieldName = 'VENCIMIENTO'
    end
    object xRecibosCTA_PAGO: TFIBStringField
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object xRecibosLIQUIDO: TFloatField
      FieldName = 'LIQUIDO'
    end
    object xRecibosLIQUIDO_CANAL: TFloatField
      FieldName = 'LIQUIDO_CANAL'
    end
    object xRecibosPAGADO: TIntegerField
      FieldName = 'PAGADO'
    end
    object xRecibosIMPAGADO: TIntegerField
      FieldName = 'IMPAGADO'
    end
    object xRecibosFORMA_PAGO: TFIBStringField
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xRecibosTIPO_EFECTO: TFIBStringField
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object xRecibosACEPTAR: TIntegerField
      FieldName = 'ACEPTAR'
    end
    object xRecibosREMESAR: TIntegerField
      FieldName = 'REMESAR'
    end
    object xRecibosESTADO: TIntegerField
      FieldName = 'ESTADO'
    end
    object xRecibosREMESA: TIntegerField
      FieldName = 'REMESA'
    end
    object xRecibosDOC_NUMERO: TIntegerField
      FieldName = 'DOC_NUMERO'
    end
    object xRecibosDOC_SERIE: TFIBStringField
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xRecibosDOC_FECHA: TDateTimeField
      FieldName = 'DOC_FECHA'
    end
    object xRecibosDOC_TIPO: TFIBStringField
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xRecibosRIC: TIntegerField
      FieldName = 'RIC'
    end
    object xRecibosRIVA: TIntegerField
      FieldName = 'RIVA'
    end
    object xRecibosFECHA_CIERRE: TDateTimeField
      FieldName = 'FECHA_CIERRE'
    end
    object xRecibosESTADO_RECIBO: TFIBStringField
      FieldName = 'ESTADO_RECIBO'
      Size = 1
    end
    object xRecibosRECIBIDO: TIntegerField
      FieldName = 'RECIBIDO'
    end
    object xRecibosCONFIRMING: TIntegerField
      FieldName = 'CONFIRMING'
    end
    object xRecibosDOCUMENTO: TFIBStringField
      FieldName = 'DOCUMENTO'
      Size = 15
    end
    object xRecibosDOC_AUTOMATICO: TIntegerField
      FieldName = 'DOC_AUTOMATICO'
    end
    object xRecibosMONEDA: TFIBStringField
      FieldName = 'MONEDA'
      Size = 3
    end
    object xRecibosCAMBIO: TFloatField
      FieldName = 'CAMBIO'
    end
    object xRecibosID_CARTERA: TIntegerField
      FieldName = 'ID_CARTERA'
    end
    object xRecibosID_CARTERA_DETALLE: TIntegerField
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object xRecibosID_DOC: TIntegerField
      FieldName = 'ID_DOC'
    end
    object xRecibosRETENCION: TIntegerField
      FieldName = 'RETENCION'
    end
    object xRecibosTIPO_RETENCION: TIntegerField
      FieldName = 'TIPO_RETENCION'
    end
  end
  object xAcreedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT NIF,TITULO, TERCERO /*dji lrk kri*/'
      'FROM VER_ACREEDORES'
      '  where empresa=?empresa and'
      '             ejercicio=?ejercicio and'
      '             canal=?canal and'
      '             Acreedor=?cod_cli_pro')
    UniDirectional = False
    DataSource = DSxRecibos
    Left = 64
    Top = 440
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
  object xProveedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT NIF,TITULO,TERCERO /*dji lrk kri*/'
      'FROM VER_PROVEEDORES'
      '  where empresa=?empresa and'
      '             ejercicio=?ejercicio and'
      '             canal=?canal and'
      '             proveedor=?cod_cli_pro')
    UniDirectional = False
    DataSource = DSxRecibos
    Left = 64
    Top = 344
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
  object DSxRecibos: TDataSource
    DataSet = xRecibos
    Left = 208
    Top = 296
  end
  object xDireccionProveedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TERCEROS_DIRECCIONES'
      'WHERE'
      'TERCERO = :TERCERO AND'
      'DIR_DEFECTO = 1')
    UniDirectional = False
    Left = 64
    Top = 392
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
  object xProveedorBanco: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TERCEROS_BANCOS'
      'WHERE'
      '  TERCERO=?TERCERO AND '
      '  BANCO=?BANCO ')
    SelectSQL.Strings = (
      'SELECT ENTIDAD,SUCURSAL,CONTROL,CUENTA,IBAN,BIC, PAIS'
      'FROM SYS_TERCEROS_BANCOS'
      ' where tercero=?tercero and'
      '           activa=1 and ((modo=0)or(modo=1))'
      '  order by orden')
    UniDirectional = False
    Left = 352
    Top = 344
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
      FieldName = 'PAIS'
      Size = 3
    end
  end
  object xTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TERCEROS'
      'WHERE'
      '  TERCERO=?TERCERO ')
    SelectSQL.Strings = (
      'SELECT TELEFONO01,TELEFAX,EMAIL'
      'FROM SYS_TERCEROS'
      '  WHERE TERCERO=?TERCERO')
    UniDirectional = False
    Left = 352
    Top = 392
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
    BufferChunks = 32
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
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 352
    Top = 296
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
  object xLoc_T: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT CODPOSTAL,TITULO,PROVINCIA,C_PAIS'
      'FROM VER_LOCALIDADES'
      'WHERE'
      'LOCALIDAD = :DIR_LOCALIDAD')
    UniDirectional = False
    DataSource = DSxDireccionProveedor
    Left = 64
    Top = 488
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
  object DSxDireccionProveedor: TDataSource
    DataSet = xDireccionProveedor
    Left = 208
    Top = 392
  end
  object DSxProveedor: TDataSource
    DataSet = xProveedor
    Left = 208
    Top = 344
  end
  object DSxAcreedor: TDataSource
    DataSet = xAcreedor
    Left = 208
    Top = 440
  end
  object DSDetalleDocumento: TDataSource
    DataSet = xDetalleDocumento
    Left = 208
    Top = 200
  end
  object xDetalleDocumento: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      
        'DET.EMPRESA, DET.EJERCICIO, DET.CANAL, DET.SIGNO, DET.REGISTRO, ' +
        'DET.LINEA, CAR.COD_CLI_PRO, DET.VENCIMIENTO,'
      
        'DET.CTA_PAGO, DET.LIQUIDO, DET.LIQUIDO_CANAL, DET.PAGADO, DET.IM' +
        'PAGADO, CAR.FORMA_PAGO, DET.TIPO_EFECTO, '
      
        'FP.ACEPTAR, DET.REMESAR, DET.ESTADO, DET.REMESA, CAR.DOC_NUMERO,' +
        ' CAR.DOC_SERIE, CAR.DOC_FECHA, CAR.DOC_TIPO, CAR.RIC, '
      
        'CAR.RIVA, DET.FECHA_CIERRE, DET.ESTADO_RECIBO, DET.RECIBIDO, DET' +
        '.CONFIRMING, DET.DOCUMENTO, DET.DOC_AUTOMATICO, '
      
        'DET.MONEDA, DET.CAMBIO, DET.ID_CARTERA, DET.ID_CARTERA_DETALLE, ' +
        'CAR.ID_DOC, DET.RETENCION, DET.TIPO_RETENCION'
      'FROM EMP_CARTERA_DETALLE DET'
      'JOIN EMP_CARTERA CAR'
      'ON'
      'DET.ID_CARTERA = CAR.ID_CARTERA'
      'LEFT JOIN CON_CUENTAS_GES_FP FP'
      'ON'
      'DET.EMPRESA = FP.EMPRESA AND'
      'DET.EJERCICIO = FP.EJERCICIO AND'
      'DET.CANAL = FP.CANAL AND'
      'CAR.FORMA_PAGO = FP.FORMA_PAGO'
      'WHERE'
      'DET.EMPRESA = ?EMPRESA AND'
      'DET.EJERCICIO = ?EJERCICIO AND'
      'DET.CANAL = ?CANAL AND'
      'DET.SIGNO = '#39'P'#39' AND'
      'DET.DOC_AUTOMATICO = ?DOC_AUTOMATICO AND'
      'DET.DOCUMENTO = ?DOCUMENTO AND'
      'DET.VISIBLE = 1 AND'
      'DET.CONFIRMING = 0 AND'
      'DET.ORD_PAGO = 0'
      
        'ORDER BY DET.EMPRESA, DET.EJERCICIO, DET.CANAL, DET.REGISTRO, DE' +
        'T.LINEA')
    UniDirectional = False
    DataSource = DSAgrupacionDocumentosDet
    AfterOpen = xDetalleDocumentoAfterOpen
    AfterScroll = xDetalleDocumentoAfterScroll
    BeforeClose = xDetalleDocumentoBeforeClose
    Left = 64
    Top = 200
    object xDetalleDocumentoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDetalleDocumentoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xDetalleDocumentoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xDetalleDocumentoSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xDetalleDocumentoREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xDetalleDocumentoLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xDetalleDocumentoCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cod. Prov./Acr.'
      FieldName = 'COD_CLI_PRO'
    end
    object xDetalleDocumentoVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Vencimiento'
      FieldName = 'VENCIMIENTO'
    end
    object xDetalleDocumentoCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object xDetalleDocumentoLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xDetalleDocumentoLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object xDetalleDocumentoPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object xDetalleDocumentoIMPAGADO: TIntegerField
      DisplayLabel = 'Impagado'
      FieldName = 'IMPAGADO'
    end
    object xDetalleDocumentoFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xDetalleDocumentoTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efec.'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object xDetalleDocumentoACEPTAR: TIntegerField
      DisplayLabel = 'Aceptar'
      FieldName = 'ACEPTAR'
    end
    object xDetalleDocumentoREMESAR: TIntegerField
      DisplayLabel = 'Remesar'
      FieldName = 'REMESAR'
    end
    object xDetalleDocumentoESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xDetalleDocumentoREMESA: TIntegerField
      DisplayLabel = 'Remesa'
      FieldName = 'REMESA'
    end
    object xDetalleDocumentoDOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object xDetalleDocumentoDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xDetalleDocumentoDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object xDetalleDocumentoDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xDetalleDocumentoRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object xDetalleDocumentoRIVA: TIntegerField
      DisplayLabel = 'Reg. IVA'
      FieldName = 'RIVA'
    end
    object xDetalleDocumentoFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object xDetalleDocumentoESTADO_RECIBO: TFIBStringField
      DisplayLabel = 'Estado Rec.'
      FieldName = 'ESTADO_RECIBO'
      Size = 1
    end
    object xDetalleDocumentoRECIBIDO: TIntegerField
      DisplayLabel = 'Recibido'
      FieldName = 'RECIBIDO'
    end
    object xDetalleDocumentoCONFIRMING: TIntegerField
      DisplayLabel = 'Confirming'
      FieldName = 'CONFIRMING'
    end
    object xDetalleDocumentoDOCUMENTO: TFIBStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 15
    end
    object xDetalleDocumentoDOC_AUTOMATICO: TIntegerField
      DisplayLabel = 'Tal./Pagare'
      FieldName = 'DOC_AUTOMATICO'
    end
    object xDetalleDocumentoMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xDetalleDocumentoCAMBIO: TFloatField
      DisplayLabel = 'Cambio'
      FieldName = 'CAMBIO'
    end
    object xDetalleDocumentoID_CARTERA: TIntegerField
      DisplayLabel = 'Id Cartera'
      FieldName = 'ID_CARTERA'
    end
    object xDetalleDocumentoID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'Id Cartera Det.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object xDetalleDocumentoID_DOC: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_DOC'
    end
    object xDetalleDocumentoRETENCION: TIntegerField
      DisplayLabel = 'Retencion'
      FieldName = 'RETENCION'
    end
    object xDetalleDocumentoTIPO_RETENCION: TIntegerField
      DisplayLabel = 'Tipo Ret.'
      FieldName = 'TIPO_RETENCION'
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
    DataSource = DSDetalleDocumento
    Left = 64
    Top = 536
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
    Left = 208
    Top = 536
  end
end
