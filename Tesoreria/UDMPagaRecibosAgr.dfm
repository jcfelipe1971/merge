object DMPagaRecibosAgr: TDMPagaRecibosAgr
  OldCreateOrder = False
  OnCreate = DMPagaRecibosAgrupCreate
  Left = 452
  Top = 332
  Height = 461
  Width = 497
  object QMRecibos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CARTERA_AGRUPACION_FAC'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SIGNO=?old_SIGNO AND '
      '  REGISTRO=?old_REGISTRO AND '
      '  LINEA=?old_LINEA ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CARTERA_AGRUPACION_FAC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SIGNO=?SIGNO AND '
      '  REGISTRO=?REGISTRO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_CARTERA_AGRUPACION_FAC'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO <= :EJERCICIO AND'
      'CANAL = :CANAL AND'
      
        '((DOC_TIPO = :TIPO) OR (DOC_TIPO = :TIPOAGRUPADO) OR (DOC_TIPO =' +
        ' :TIPONUEVO) OR (DOC_TIPO = :TIPOASIENTO)) AND'
      'COD_CLI_PRO = :COD_CLI_PRO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CARTERA_AGRUPACION_FAC'
      'SET'
      '  ENTRADA=?ENTRADA '
      '  ,EJERCICIO_AGRUPACION=?EJERCICIO_AGRUPACION'
      'WHERE'
      '  ID_CARTERA_DETALLE=?ID_CARTERA_DETALLE')
    BeforeInsert = QMRecibosBeforeInsert
    BeforePost = QMRecibosBeforePost
    OnCalcFields = QMRecibosCalcFields
    OnNewRecord = QMRecibosNewRecord
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
    TableName = 'VER_CARTERA_AGRUPACION_FAC'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 8
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
    object QMRecibosREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMRecibosLINEA: TIntegerField
      DisplayLabel = 'Recibo'
      FieldName = 'LINEA'
    end
    object QMRecibosCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cod. Cli./Prov.'
      FieldName = 'COD_CLI_PRO'
    end
    object QMRecibosVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Vencimiento'
      FieldName = 'VENCIMIENTO'
    end
    object QMRecibosLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMRecibosDOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object QMRecibosDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMRecibosDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object QMRecibosDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMRecibosRECIBIDO: TIntegerField
      DisplayLabel = 'Rec.'
      FieldName = 'RECIBIDO'
    end
    object QMRecibosENTRADA: TIntegerField
      DisplayLabel = 'Pagar'
      FieldName = 'ENTRADA'
      OnChange = QMRecibosENTRADAChange
    end
    object QMRecibosCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object QMRecibosEJERCICIO_AGRUPACION: TIntegerField
      DisplayLabel = 'Ejer. Agrup.'
      FieldName = 'EJERCICIO_AGRUPACION'
    end
    object QMRecibosliquido_moneda: TFloatField
      DisplayLabel = 'Liquido Mon.'
      FieldKind = fkCalculated
      FieldName = 'liquido_moneda'
      OnGetText = QMRecibosliquido_monedaGetText
      Calculated = True
    end
    object QMRecibosLIQUIDO_CANAL: TFloatField
      DisplayLabel = 'Liquido Can.'
      FieldName = 'LIQUIDO_CANAL'
    end
    object QMRecibosMONEDA: TFIBStringField
      DisplayLabel = 'Mon.'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMRecibosSU_REFERENCIA: TStringField
      DisplayLabel = 'Su Referencia'
      FieldKind = fkCalculated
      FieldName = 'SU_REFERENCIA'
      Size = 40
      Calculated = True
    end
    object QMRecibosNUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Factura'
      FieldName = 'NUM_FACTURA'
      Size = 40
    end
    object QMRecibosFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMRecibosID_CARTERA: TIntegerField
      DisplayLabel = 'Id Cartera'
      FieldName = 'ID_CARTERA'
    end
    object QMRecibosID_DOC: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_DOC'
    end
    object QMRecibosID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'Id Cartera Det.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object QMRecibosFOLIO: TFIBStringField
      DisplayLabel = 'Folio'
      FieldName = 'FOLIO'
      Size = 40
    end
    object QMRecibosOBSERVACIONES: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVACIONES'
      Size = 100
    end
  end
  object DSQMRecibos: TDataSource
    DataSet = QMRecibos
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
    Left = 280
    Top = 8
  end
  object xClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo, forma_pago FROM VER_CLIENTES'
      'WHERE'
      '  empresa=?empresa and'
      '  ejercicio=?ejercicio and'
      '  canal=?canal and'
      '  cliente=?cliente')
    UniDirectional = False
    Left = 48
    Top = 104
  end
  object xProveedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo, forma_pago FROM VER_PROVEEDORES'
      'WHERE'
      '  empresa=?empresa and'
      '  ejercicio=?ejercicio and'
      '  canal=?canal and'
      '  proveedor=?proveedor')
    UniDirectional = False
    Left = 48
    Top = 152
  end
  object xAcreedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo, forma_pago FROM VER_ACREEDORES'
      'WHERE'
      '  empresa=?empresa and'
      '  ejercicio=?ejercicio and'
      '  canal=?canal and'
      '  acreedor=?acreedor')
    UniDirectional = False
    Left = 48
    Top = 200
  end
  object QMCPRecMarcados: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_CARTERA_CP_REC_MARC'
      'WHERE'
      '  TIPO_DOC=?old_TIPO_DOC AND '
      '  SIGNO=?old_SIGNO AND '
      '  COD_CLI_PRO=?old_COD_CLI_PRO ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_CARTERA_CP_REC_MARC'
      '  (COD_CLI_PRO,SIGNO,TIPO_DOC,CUENTA,FECHA,CANTIDAD)'
      'VALUES'
      '  (?COD_CLI_PRO,?SIGNO,?TIPO_DOC,?CUENTA,?FECHA,?CANTIDAD)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_CARTERA_CP_REC_MARC'
      'WHERE'
      '  TIPO=?TIPO AND '
      '  SIGNO=?SIGNO AND '
      '  COD_CLI_PRO=?COD_CLI_PRO ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_CARTERA_CP_REC_MARC'
      'WHERE ENTRADA = ?ENTRADA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_CARTERA_CP_REC_MARC'
      'SET'
      '  CUENTA=?CUENTA '
      '  ,CANTIDAD=?CANTIDAD '
      'WHERE'
      '  TIPO=?TIPO AND'
      '  SIGNO=?SIGNO AND '
      '  COD_CLI_PRO=?COD_CLI_PRO ')
    AfterOpen = QMCPRecMarcadosAfterOpen
    ClavesPrimarias.Strings = (
      'TIPO '
      'SIGNO '
      'COD_CLI_PRO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_CARTERA_CP_REC_MARC'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 56
    object QMCPRecMarcadosCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cliente/Prov/Acre'
      FieldName = 'COD_CLI_PRO'
    end
    object QMCPRecMarcadosSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMCPRecMarcadosCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta Cobro/Pago'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMCPRecMarcadosCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMCPRecMarcadosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCPRecMarcadosIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMCPRecMarcadosRECIBOS: TIntegerField
      DisplayLabel = 'Nro. Recibos'
      FieldName = 'RECIBOS'
    end
    object QMCPRecMarcadosENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
  end
  object DSQMCPRecMarcados: TDataSource
    DataSet = QMCPRecMarcados
    Left = 160
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
    Left = 280
    Top = 56
  end
  object frListado: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frListadoGetValue
    OnBeforePrint = frListadoBeforePrint
    OnEnterRect = frListadoBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 160
    Top = 248
    ReportForm = {19000000}
  end
  object xLstCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT NOMBRE, DIRECCION, COD_POSTAL, PROVINCIA, LOCALIDAD'
      'FROM VER_CLIENTES_CPOSTAL'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'CLIENTE = :CLIENTE')
    UniDirectional = False
    Left = 48
    Top = 344
    object xLstClienteNOMBRE: TFIBStringField
      FieldName = 'NOMBRE'
      Size = 60
    end
    object xLstClienteDIRECCION: TFIBStringField
      FieldName = 'DIRECCION'
      Size = 76
    end
    object xLstClienteCOD_POSTAL: TFIBStringField
      FieldName = 'COD_POSTAL'
      Size = 10
    end
    object xLstClientePROVINCIA: TFIBStringField
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object xLstClienteLOCALIDAD: TFIBStringField
      FieldName = 'LOCALIDAD'
      Size = 40
    end
  end
  object xLstRecibo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT MAX(VENCIMIENTO) VENCIMIENTO, SUM(LIQUIDO) LIQUIDO'
      'FROM EMP_CARTERA_DOCUMENTO DOC'
      'LEFT JOIN EMP_CARTERA_DETALLE DET'
      'ON'
      'DOC.EMPRESA = DET.EMPRESA AND'
      'DOC.EJERCICIO_REC = DET.EJERCICIO AND'
      'DOC.CANAL = DET.CANAL AND'
      'DOC.SIGNO = DET.SIGNO AND'
      'DOC.REGISTRO_REC = DET.REGISTRO AND'
      'DOC.LINEA_REC = DET.LINEA'
      'WHERE'
      'DOC.EMPRESA = :EMPRESA AND'
      'DOC.EJERCICIO <= :EJERCICIO AND'
      'DOC.CANAL = :CANAL AND'
      'DOC.SIGNO = :SIGNO AND'
      'DOC.REGISTRO = :REGISTRO')
    UniDirectional = False
    Left = 48
    Top = 248
    object xLstReciboVENCIMIENTO: TDateTimeField
      FieldName = 'VENCIMIENTO'
    end
    object xLstReciboLIQUIDO: TFloatField
      FieldName = 'LIQUIDO'
    end
  end
  object xLstDetRecibo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM EMP_CARTERA_DOCUMENTO DOC'
      'LEFT JOIN EMP_CARTERA_DETALLE DET'
      'ON'
      'DOC.EMPRESA = DET.EMPRESA AND'
      'DOC.EJERCICIO_REC = DET.EJERCICIO AND'
      'DOC.CANAL = DET.CANAL AND'
      'DOC.SIGNO = DET.SIGNO AND'
      'DOC.REGISTRO_REC = DET.REGISTRO AND'
      'DOC.LINEA_REC = DET.LINEA'
      'LEFT JOIN EMP_CARTERA CAR'
      'ON'
      'DOC.EMPRESA = CAR.EMPRESA AND'
      'DOC.EJERCICIO_REC = CAR.EJERCICIO AND'
      'DOC.CANAL = CAR.CANAL AND'
      'DOC.SIGNO = CAR.SIGNO AND'
      'DOC.REGISTRO_REC = CAR.REGISTRO'
      'WHERE'
      'DOC.EMPRESA = :EMPRESA AND'
      'DOC.EJERCICIO = :EJERCICIO AND'
      'DOC.CANAL = :CANAL AND'
      'DOC.SIGNO = :SIGNO AND'
      'DOC.REGISTRO = :REGISTRO')
    UniDirectional = False
    Left = 48
    Top = 296
    object xLstDetReciboEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xLstDetReciboEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object xLstDetReciboCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object xLstDetReciboSIGNO: TFIBStringField
      FieldName = 'SIGNO'
      Size = 1
    end
    object xLstDetReciboREGISTRO: TIntegerField
      FieldName = 'REGISTRO'
    end
    object xLstDetReciboREGISTRO_REC: TIntegerField
      FieldName = 'REGISTRO_REC'
    end
    object xLstDetReciboLINEA_REC: TIntegerField
      FieldName = 'LINEA_REC'
    end
    object xLstDetReciboEJERCICIO_REC: TIntegerField
      FieldName = 'EJERCICIO_REC'
    end
    object xLstDetReciboEMPRESA1: TIntegerField
      FieldName = 'EMPRESA1'
    end
    object xLstDetReciboEJERCICIO1: TIntegerField
      FieldName = 'EJERCICIO1'
    end
    object xLstDetReciboCANAL1: TIntegerField
      FieldName = 'CANAL1'
    end
    object xLstDetReciboSIGNO1: TFIBStringField
      FieldName = 'SIGNO1'
      Size = 1
    end
    object xLstDetReciboREGISTRO1: TIntegerField
      FieldName = 'REGISTRO1'
    end
    object xLstDetReciboLINEA: TIntegerField
      FieldName = 'LINEA'
    end
    object xLstDetReciboVENCIMIENTO: TDateTimeField
      FieldName = 'VENCIMIENTO'
    end
    object xLstDetReciboCTA_PAGO: TFIBStringField
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object xLstDetReciboLIQUIDO: TFloatField
      FieldName = 'LIQUIDO'
    end
    object xLstDetReciboPAGADO: TIntegerField
      FieldName = 'PAGADO'
    end
    object xLstDetReciboMOD_MANUAL: TIntegerField
      FieldName = 'MOD_MANUAL'
    end
    object xLstDetReciboTIPO_EFECTO: TFIBStringField
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object xLstDetReciboREMESAR: TIntegerField
      FieldName = 'REMESAR'
    end
    object xLstDetReciboESTADO: TIntegerField
      FieldName = 'ESTADO'
    end
    object xLstDetReciboREMESA: TIntegerField
      FieldName = 'REMESA'
    end
    object xLstDetReciboBANCO: TIntegerField
      FieldName = 'BANCO'
    end
    object xLstDetReciboRIC: TIntegerField
      FieldName = 'RIC'
    end
    object xLstDetReciboIMPAGADO: TIntegerField
      FieldName = 'IMPAGADO'
    end
    object xLstDetReciboFECHA_CIERRE: TDateTimeField
      FieldName = 'FECHA_CIERRE'
    end
    object xLstDetReciboESTADO_RECIBO: TFIBStringField
      FieldName = 'ESTADO_RECIBO'
      Size = 1
    end
    object xLstDetReciboRECIBIDO: TIntegerField
      FieldName = 'RECIBIDO'
    end
    object xLstDetReciboVISIBLE: TIntegerField
      FieldName = 'VISIBLE'
    end
    object xLstDetReciboENTRADA: TIntegerField
      FieldName = 'ENTRADA'
    end
    object xLstDetReciboAGRUPACION: TIntegerField
      FieldName = 'AGRUPACION'
    end
    object xLstDetReciboCONFIRMING: TIntegerField
      FieldName = 'CONFIRMING'
    end
    object xLstDetReciboANTICIPADO: TFloatField
      FieldName = 'ANTICIPADO'
    end
    object xLstDetReciboDOCUMENTO: TFIBStringField
      FieldName = 'DOCUMENTO'
      Size = 15
    end
    object xLstDetReciboDOC_AUTOMATICO: TIntegerField
      FieldName = 'DOC_AUTOMATICO'
    end
    object xLstDetReciboEJERCICIO_REMESA: TIntegerField
      FieldName = 'EJERCICIO_REMESA'
    end
    object xLstDetReciboEJERCICIO_AGRUPACION: TIntegerField
      FieldName = 'EJERCICIO_AGRUPACION'
    end
    object xLstDetReciboMONEDA: TFIBStringField
      FieldName = 'MONEDA'
      Size = 3
    end
    object xLstDetReciboLIQUIDO_CANAL: TFloatField
      FieldName = 'LIQUIDO_CANAL'
    end
    object xLstDetReciboCAMBIO: TFloatField
      FieldName = 'CAMBIO'
    end
    object xLstDetReciboRIC_RECIBIDO: TIntegerField
      FieldName = 'RIC_RECIBIDO'
    end
    object xLstDetReciboFECHA_RECIBIDO: TDateTimeField
      FieldName = 'FECHA_RECIBIDO'
    end
    object xLstDetReciboEJERCICIO_CONFIRMING: TIntegerField
      FieldName = 'EJERCICIO_CONFIRMING'
    end
    object xLstDetReciboMONEDA_CANAL: TFIBStringField
      FieldName = 'MONEDA_CANAL'
      Size = 3
    end
    object xLstDetReciboEMPRESA2: TIntegerField
      FieldName = 'EMPRESA2'
    end
    object xLstDetReciboEJERCICIO2: TIntegerField
      FieldName = 'EJERCICIO2'
    end
    object xLstDetReciboCANAL2: TIntegerField
      FieldName = 'CANAL2'
    end
    object xLstDetReciboSIGNO2: TFIBStringField
      FieldName = 'SIGNO2'
      Size = 1
    end
    object xLstDetReciboREGISTRO2: TIntegerField
      FieldName = 'REGISTRO2'
    end
    object xLstDetReciboFECHA_REGISTRO: TDateTimeField
      FieldName = 'FECHA_REGISTRO'
    end
    object xLstDetReciboLINEAS: TIntegerField
      FieldName = 'LINEAS'
    end
    object xLstDetReciboCUENTA: TFIBStringField
      FieldName = 'CUENTA'
      Size = 15
    end
    object xLstDetReciboDOC_NUMERO: TIntegerField
      FieldName = 'DOC_NUMERO'
    end
    object xLstDetReciboDOC_SERIE: TFIBStringField
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xLstDetReciboDOC_FECHA: TDateTimeField
      FieldName = 'DOC_FECHA'
    end
    object xLstDetReciboDOC_TIPO: TFIBStringField
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xLstDetReciboVALOR: TDateTimeField
      FieldName = 'VALOR'
    end
    object xLstDetReciboFORMA_PAGO: TFIBStringField
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xLstDetReciboBASES: TFloatField
      FieldName = 'BASES'
    end
    object xLstDetReciboLIQUIDO1: TFloatField
      FieldName = 'LIQUIDO1'
    end
    object xLstDetReciboPAGADO1: TIntegerField
      FieldName = 'PAGADO1'
    end
    object xLstDetReciboRIC1: TIntegerField
      FieldName = 'RIC1'
    end
    object xLstDetReciboRIVA: TIntegerField
      FieldName = 'RIVA'
    end
    object xLstDetReciboREG_IVA: TIntegerField
      FieldName = 'REG_IVA'
    end
    object xLstDetReciboESTADO1: TIntegerField
      FieldName = 'ESTADO1'
    end
    object xLstDetReciboDIA_PAGO_1: TIntegerField
      FieldName = 'DIA_PAGO_1'
    end
    object xLstDetReciboDIA_PAGO_2: TIntegerField
      FieldName = 'DIA_PAGO_2'
    end
    object xLstDetReciboDIA_PAGO_3: TIntegerField
      FieldName = 'DIA_PAGO_3'
    end
    object xLstDetReciboCOD_CLI_PRO: TIntegerField
      FieldName = 'COD_CLI_PRO'
    end
    object xLstDetReciboORIGEN_IMPAGADO: TIntegerField
      FieldName = 'ORIGEN_IMPAGADO'
    end
    object xLstDetReciboASIENTO: TIntegerField
      FieldName = 'ASIENTO'
    end
    object xLstDetReciboEJERCICIO_FINAL: TIntegerField
      FieldName = 'EJERCICIO_FINAL'
    end
    object xLstDetReciboMONEDA1: TFIBStringField
      FieldName = 'MONEDA1'
      Size = 3
    end
    object xLstDetReciboLIQUIDO_CANAL1: TFloatField
      FieldName = 'LIQUIDO_CANAL1'
    end
    object xLstDetReciboCAMBIO1: TFloatField
      FieldName = 'CAMBIO1'
    end
    object xLstDetReciboC_PAGADA: TFloatField
      FieldName = 'C_PAGADA'
    end
    object xLstDetReciboMONEDA_CANAL1: TFIBStringField
      FieldName = 'MONEDA_CANAL1'
      Size = 3
    end
  end
  object frdbLstDetRecibo: TfrDBDataSet
    DataSet = xLstDetRecibo
    Left = 160
    Top = 296
  end
end
