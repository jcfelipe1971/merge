object DMFacturarTickets: TDMFacturarTickets
  OldCreateOrder = False
  OnCreate = DMFacturarTicketsCreate
  OnDestroy = DataModuleDestroy
  Left = 339
  Top = 130
  Height = 675
  Width = 928
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 856
    Top = 168
  end
  object QMTickets: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_TICKETS_FACTURACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIT=?RIT ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_TICKETS_FACTURACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND'
      '  SESION >= ?DESDE_SESION AND'
      '  SESION <= ?HASTA_SESION AND'
      '  CAJA >= ?DESDE_CAJA AND'
      '  CAJA <= ?HASTA_CAJA AND'
      '  TURNO >= ?DESDE_TURNO AND'
      '  TURNO <= ?HASTA_TURNO AND'
      '  FECHA >= ?DESDE_FECHA AND'
      '  FECHA <= ?HASTA_FECHA AND'
      '  FACTURACION = 0 AND'
      '  ESTADO <> ?ESTADO'
      'ORDER BY  RIT')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_TICKETS_FACTURACION'
      'SET'
      '  CANAL_A_FACTURAR=?CANAL_A_FACTURAR '
      '  ,ENTRADA_FAC=?ENTRADA_FAC '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIT=?RIT ')
    AfterPost = QMTicketsAfterPost
    BeforeDelete = QMTicketsBeforeDelete
    BeforeInsert = QMTicketsBeforeInsert
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIT ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_TICKETS_FACTURACION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 256
    Top = 16
    object QMTicketsTOTAL_CANAL: TFloatField
      DisplayLabel = 'Tot. Can.'
      FieldKind = fkCalculated
      FieldName = 'TOTAL_CANAL'
      OnGetText = QMTicketsTOTAL_CANALGetText
      Calculated = True
    end
    object QMTicketsEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTicketsEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMTicketsCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMTicketsSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMTicketsTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMTicketsRIT: TIntegerField
      FieldName = 'RIT'
    end
    object QMTicketsSESION: TIntegerField
      DisplayLabel = 'Sesion'
      FieldName = 'SESION'
    end
    object QMTicketsNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMTicketsCAJA: TIntegerField
      DisplayLabel = 'Caja'
      FieldName = 'CAJA'
    end
    object QMTicketsTITULO_CAJA: TFIBStringField
      DisplayLabel = 'Desc. Caja'
      FieldName = 'TITULO_CAJA'
      Size = 40
    end
    object QMTicketsTURNO: TIntegerField
      DisplayLabel = 'Turno'
      FieldName = 'TURNO'
    end
    object QMTicketsDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object QMTicketsESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMTicketsTITULO_ESTADO: TFIBStringField
      DisplayLabel = 'Desc. Estado'
      FieldName = 'TITULO_ESTADO'
    end
    object QMTicketsLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object QMTicketsMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMTicketsUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object QMTicketsNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 31
    end
    object QMTicketsFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMTicketsALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMTicketsFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMTicketsCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMTicketsAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMTicketsCANAL_A_FACTURAR: TIntegerField
      DisplayLabel = 'Canal Dst.'
      FieldName = 'CANAL_A_FACTURAR'
    end
    object QMTicketsENTRADA_FAC: TIntegerField
      DisplayLabel = 'Proc.'
      FieldName = 'ENTRADA_FAC'
    end
    object QMTicketsID_TICKET: TIntegerField
      DisplayLabel = 'Id Ticket'
      FieldName = 'ID_TICKET'
    end
    object QMTicketsDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial.'
      FieldName = 'DTO_CIAL'
    end
    object QMTicketsI_DTO_CIAL: TFloatField
      DisplayLabel = 'I Dto Cial'
      FieldName = 'I_DTO_CIAL'
    end
    object QMTicketsS_BASES: TFloatField
      DisplayLabel = 'S Bases'
      FieldName = 'S_BASES'
    end
    object QMTicketsMOTIVO_ANULADO: TFIBStringField
      DisplayLabel = 'Motivo anulaci'#243'n'
      FieldName = 'MOTIVO_ANULADO'
      Size = 40
    end
    object QMTicketsSFV_NUM_DOSIFICACION: TIntegerField
      DisplayLabel = 'Num Ticket'
      FieldName = 'SFV_NUM_DOSIFICACION'
    end
    object QMTicketsVALIDO: TIntegerField
      DisplayLabel = 'V'#225'lido'
      FieldName = 'VALIDO'
    end
    object QMTicketsSFV_AUTORIZACION: TFIBStringField
      DisplayLabel = 'SFV Autorizacion'
      FieldName = 'SFV_AUTORIZACION'
    end
    object QMTicketsSFV_CODIGO_CONTROL: TFIBStringField
      DisplayLabel = 'SFV Cod. Control'
      FieldName = 'SFV_CODIGO_CONTROL'
    end
    object QMTicketsFORMAS_PAGO: TFIBStringField
      DisplayLabel = 'Formas de Pago'
      FieldName = 'FORMAS_PAGO'
    end
    object QMTicketsFACTURACION: TIntegerField
      DisplayLabel = 'Facturacion'
      FieldName = 'FACTURACION'
    end
    object QMTicketsFACTURA: TFIBStringField
      DisplayLabel = 'Factura'
      FieldName = 'FACTURA'
      Size = 40
    end
    object QMTicketsPERIODO_FACTURACION: TFIBStringField
      DisplayLabel = 'Per. Fact.'
      FieldName = 'PERIODO_FACTURACION'
      Size = 2
    end
  end
  object DSQMTickets: TDataSource
    DataSet = QMTickets
    Left = 360
    Top = 16
  end
  object xRecorre: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TRecorre
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM G_FACTURA_TICKETS_RECORRE'
      '(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?SESIONI, ?SESIONF,'
      
        '?PRIORIZA_FP, ?PRIORIZA_STK, ?POR_IMPORTES, ?POR_LINEAS, ?ENTRAD' +
        'A,'
      '?MODO, ?TIPO_TICKET)'
      'ORDER BY TIPO_DEV, RIT')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TRecorre
    AutoCommit = True
    Left = 256
    Top = 208
    object xRecorreEMPRESA_DEV: TIntegerField
      FieldName = 'EMPRESA_DEV'
    end
    object xRecorreEJERCICIO_DEV: TIntegerField
      FieldName = 'EJERCICIO_DEV'
    end
    object xRecorreCANAL_DEV: TIntegerField
      FieldName = 'CANAL_DEV'
    end
    object xRecorreSERIE_DEV: TFIBStringField
      FieldName = 'SERIE_DEV'
      Size = 10
    end
    object xRecorreRIT: TIntegerField
      FieldName = 'RIT'
    end
    object xRecorreCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object xRecorreD_CANAL: TIntegerField
      FieldName = 'D_CANAL'
    end
    object xRecorreTIPO_DEV: TFIBStringField
      FieldName = 'TIPO_DEV'
      Size = 3
    end
  end
  object xRegistros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT * FROM TMP_FACTURA_TICKETS'
      'WHERE'
      'ENTRADA = ?ENTRADA'
      'ORDER BY TIPO, RIT')
    UniDirectional = False
    Left = 256
    Top = 160
    object xRegistrosENTRADA: TIntegerField
      FieldName = 'ENTRADA'
    end
    object xRegistrosEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xRegistrosEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object xRegistrosCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object xRegistrosSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object xRegistrosRIT: TIntegerField
      FieldName = 'RIT'
    end
    object xRegistrosFORMA_PAGO: TFIBStringField
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xRegistrosSERIED: TFIBStringField
      FieldName = 'SERIED'
      Size = 10
    end
    object xRegistrosRIGD: TIntegerField
      FieldName = 'RIGD'
    end
    object xRegistrosID_S_D: TIntegerField
      FieldName = 'ID_S_D'
    end
    object xRegistrosTIPO: TFIBStringField
      FieldName = 'TIPO'
      Size = 3
    end
    object xRegistrosD_CANAL: TIntegerField
      FieldName = 'D_CANAL'
    end
    object xRegistrosLINEA: TIntegerField
      FieldName = 'LINEA'
    end
    object xRegistrosLIQUIDO_TICKET: TFloatField
      FieldName = 'LIQUIDO_TICKET'
    end
    object xRegistrosBLOQUEO: TIntegerField
      FieldName = 'BLOQUEO'
    end
    object xRegistrosTIPO_GASTO: TIntegerField
      FieldName = 'TIPO_GASTO'
    end
  end
  object xFacturas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT DISTINCT(TIPO)  AS TIPO, ID_S_D, SERIED, RIGD, D_CANAL'
      'FROM  TMP_FACTURA_TICKETS'
      'WHERE '
      'ENTRADA=?ENTRADA'
      'ORDER  BY TIPO, ID_S_D')
    UniDirectional = False
    Left = 256
    Top = 304
    object xFacturasID_S_D: TIntegerField
      FieldName = 'ID_S_D'
    end
    object xFacturasSERIED: TFIBStringField
      FieldName = 'SERIED'
      Size = 10
    end
    object xFacturasRIGD: TIntegerField
      FieldName = 'RIGD'
    end
    object xFacturasTIPO: TFIBStringField
      FieldName = 'TIPO'
      Size = 3
    end
    object xFacturasD_CANAL: TIntegerField
      FieldName = 'D_CANAL'
    end
  end
  object QMCanales: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_TICKET_CANAL_A_FACTURAR'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CANAL=?old_CANAL AND'
      '  CAJA=?old_CAJA')
    InsertSQL.Strings = (
      'INSERT INTO GES_TICKET_CANAL_A_FACTURAR'
      '  (EMPRESA,CANAL,PORCENTAJE,RESTO,CAJA,IMPORTE)'
      'VALUES'
      '  (?EMPRESA,?CANAL,?PORCENTAJE,?RESTO,?CAJA,?IMPORTE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_TICKET_CANAL_A_FACTURAR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND'
      '  CAJA=?CAJA')
    SelectSQL.Strings = (
      'SELECT * FROM GES_TICKET_CANAL_A_FACTURAR'
      'where empresa=?empresa')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_TICKET_CANAL_A_FACTURAR'
      'SET'
      '  PORCENTAJE=?PORCENTAJE '
      '  ,RESTO=?RESTO'
      '  ,IMPORTE=?IMPORTE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND'
      '  CAJA=?CAJA')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CANAL '
      'CAJA'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_TICKET_CANAL_A_FACTURAR'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMCanalesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCanalesCAJA: TIntegerField
      DisplayLabel = 'Caja'
      FieldName = 'CAJA'
    end
    object QMCanalesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCanalesPORCENTAJE: TFloatField
      DisplayLabel = 'Porcentaje'
      FieldName = 'PORCENTAJE'
    end
    object QMCanalesRESTO: TIntegerField
      DisplayLabel = 'Resto'
      FieldName = 'RESTO'
    end
    object QMCanalesIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
  end
  object DSQMCanales: TDataSource
    DataSet = QMCanales
    Left = 136
    Top = 16
  end
  object xFacturaciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM GES_TPV_FACTURACIONES'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'SERIE=?SERIE'
      'ORDER BY FACTURACION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_TPV_FACTURACIONES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 64
    object xFacturacionesEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xFacturacionesEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object xFacturacionesCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object xFacturacionesSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object xFacturacionesFACTURACION: TIntegerField
      FieldName = 'FACTURACION'
    end
    object xFacturacionesTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 60
    end
    object xFacturacionesPRIORIZA_FP: TIntegerField
      FieldName = 'PRIORIZA_FP'
    end
    object xFacturacionesPRIORIZA_STK: TIntegerField
      FieldName = 'PRIORIZA_STK'
    end
    object xFacturacionesSESION_INICIAL: TIntegerField
      FieldName = 'SESION_INICIAL'
    end
    object xFacturacionesSESION_FINAL: TIntegerField
      FieldName = 'SESION_FINAL'
    end
    object xFacturacionesFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object xFacturacionesFECHA_FACTURAS: TDateTimeField
      FieldName = 'FECHA_FACTURAS'
    end
    object xFacturacionesUSUARIO: TIntegerField
      FieldName = 'USUARIO'
    end
    object xFacturacionesPOR_PORCENTAJES: TIntegerField
      FieldName = 'POR_PORCENTAJES'
    end
    object xFacturacionesPOR_IMPORTES: TIntegerField
      FieldName = 'POR_IMPORTES'
    end
  end
  object DSxFacturaciones: TDataSource
    DataSet = xFacturaciones
    Left = 136
    Top = 64
  end
  object DSxTotal: TDataSource
    DataSet = xTotal
    Left = 136
    Top = 112
  end
  object xVerGesPrc: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_GES_PROCESOS_AUTO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  EJERCICIO=?EJERCICIO AND'
      '  CANAL=?CANAL AND'
      '  SERIE=?SERIE AND'
      '  TIPO='#39'+AT'#39' AND'
      '  CONTADOR<>0'
      'ORDER BY CONTADOR DESC')
    UniDirectional = False
    AfterOpen = xVerGesPrcAfterOpen
    BeforeClose = xVerGesPrcBeforeClose
    Opciones = []
    AutoSQLdeVistas = False
    Left = 40
    Top = 160
    object xVerGesPrcEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVerGesPrcEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVerGesPrcCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVerGesPrcSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xVerGesPrcPROCESO: TFIBStringField
      DisplayLabel = 'Proceso'
      FieldName = 'PROCESO'
      Size = 40
    end
    object xVerGesPrcTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xVerGesPrcCONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object xVerGesPrcANTERIOR: TIntegerField
      DisplayLabel = 'Anterior'
      FieldName = 'ANTERIOR'
    end
    object xVerGesPrcENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xVerGesPrcUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object xVerGesPrcNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 31
    end
    object xVerGesPrcFECHA_E: TDateTimeField
      DisplayLabel = 'Fecha E.'
      FieldName = 'FECHA_E'
    end
    object xVerGesPrcFECHA_S: TDateTimeField
      DisplayLabel = 'Fecha S.'
      FieldName = 'FECHA_S'
    end
    object xVerGesPrcUBICACION: TFIBStringField
      DisplayLabel = 'Ubicacion'
      FieldName = 'UBICACION'
      Size = 31
    end
  end
  object DSxVerGesPrc: TDataSource
    DataSet = xVerGesPrc
    Left = 136
    Top = 160
  end
  object xRecorre2: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT * FROM TMP_DESHACER_FACTURACION'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'ENTRADA = ?ENTRADA AND'
      'PROC_AUTO = ?PROC_AUTO')
    UniDirectional = False
    Left = 256
    Top = 256
    object xRecorre2ENTRADA: TIntegerField
      FieldName = 'ENTRADA'
    end
    object xRecorre2EMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xRecorre2EJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object xRecorre2CANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object xRecorre2SERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object xRecorre2RIG: TIntegerField
      FieldName = 'RIG'
    end
    object xRecorre2ID_S: TIntegerField
      FieldName = 'ID_S'
    end
    object xRecorre2ESTADO: TIntegerField
      FieldName = 'ESTADO'
    end
    object xRecorre2PROC_AUTO: TIntegerField
      FieldName = 'PROC_AUTO'
    end
    object xRecorre2TIPO: TFIBStringField
      FieldName = 'TIPO'
      Size = 3
    end
  end
  object DSxVerGesPrcFras: TDataSource
    DataSet = xVerGesPrcFras
    Left = 136
    Top = 208
  end
  object DSxVerGesPrcFraE: TDataSource
    DataSet = xVerGesPrcFraE
    Left = 136
    Top = 256
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 856
    Top = 216
  end
  object xTotal: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT coalesce(SUM(LIQUIDO_CANAL), 0) AS TOTAL'
      'FROM GES_TICKET_CABECERA'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'ESTADO = 5 AND'
      'ENTRADA_FAC = :ENTRADA AND'
      'TIPO = :TIPO AND'
      'FACTURACION = 0')
    UniDirectional = False
    Left = 40
    Top = 112
    object xTotalTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
  end
  object xVerGesPrcFras: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      'EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, FECHA, CLIENTE '
      'FROM GES_CABECERAS_S '
      'WHERE '
      'PROCESO_AUTO=?CONTADOR '
      'ORDER BY EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG'
      '')
    UniDirectional = False
    DataSource = DSxVerGesPrc
    Left = 40
    Top = 208
    object xVerGesPrcFrasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVerGesPrcFrasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVerGesPrcFrasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVerGesPrcFrasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xVerGesPrcFrasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xVerGesPrcFrasRIG: TIntegerField
      FieldName = 'RIG'
    end
    object xVerGesPrcFrasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xVerGesPrcFrasCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
  end
  object xVerGesPrcFraE: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT '
      
        'E.EMPRESA, E.EJERCICIO, E.CANAL, E.SERIE, E.TIPO, E.RIG, E.FECHA' +
        ', F.ACREEDOR'
      'FROM GES_CABECERAS_E E '
      'JOIN GES_CABECERAS_E_FCR F '
      'ON (E.ID_E = F.ID_E)'
      'WHERE '
      'E.PROCESO_AUTO=?CONTADOR'
      'ORDER BY E.EMPRESA, E.EJERCICIO, E.CANAL, E.SERIE, E.TIPO, E.RIG')
    UniDirectional = False
    DataSource = DSxVerGesPrc
    Left = 40
    Top = 256
    object xVerGesPrcFraEEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVerGesPrcFraEEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVerGesPrcFraECANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVerGesPrcFraESERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xVerGesPrcFraETIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xVerGesPrcFraERIG: TIntegerField
      FieldName = 'RIG'
    end
    object xVerGesPrcFraEFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xVerGesPrcFraEACREEDOR: TIntegerField
      DisplayLabel = 'Acreedor'
      FieldName = 'ACREEDOR'
    end
  end
  object TRecorre: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 856
    Top = 264
  end
  object QMLstTicketsDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM GES_TICKET_DETALLE '
      'WHERE '
      'ID_TICKET = ?ID_TICKET'
      'ORDER BY LINEA')
    UniDirectional = False
    DataSource = DSQMLstTickets
    Left = 40
    Top = 400
  end
  object DSQMLstTicketsDetalle: TDataSource
    DataSet = QMLstTicketsDetalle
    Left = 136
    Top = 400
  end
  object frDBQMTickets: TfrDBDataSet
    DataSource = DSQMTickets
    Left = 480
    Top = 16
  end
  object frxDBQMTickets: TfrxDBDataset
    UserName = 'frxDBQMTickets'
    CloseDataSource = False
    DataSource = DSQMTickets
    Left = 600
    Top = 16
  end
  object frxDBQMLstTicketsDetalle: TfrxDBDataset
    UserName = 'frxDBQM'
    CloseDataSource = False
    DataSource = DSQMLstTicketsDetalle
    Left = 384
    Top = 400
  end
  object frDBQMLstTicketsDetalle: TfrDBDataSet
    DataSource = DSQMLstTicketsDetalle
    Left = 256
    Top = 400
  end
  object frTickets: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frTicketsGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 856
    Top = 24
    ReportForm = {19000000}
  end
  object HYReport: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 610
    ValorGrupo = 99
    DataSet = DMMain.QListados
    Opciones.Pagina.Margenes.Abajo = 0
    Opciones.Pagina.Margenes.Izquierda = 0
    Opciones.Pagina.Margenes.Derecha = 0
    Opciones.Pagina.Margenes.Arriba = 0
    Opciones.Pagina.Alto = 22
    Opciones.Pagina.Ancho = 40
    Opciones.Pagina.Tamanyo = 22
    Opciones.Pagina.SaltoPagina = False
    Opciones.Pagina.ImprimePrimeraCabecera = False
    Opciones.Pagina.ImprimeUltimoPie = False
    Titulo = 'Comprobante de ingresos y egresos'
    ControlaLongitud = True
    Left = 856
    Top = 120
  end
  object frxTickets: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 43455.6496641898
    ReportOptions.LastChange = 43455.6496641898
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnGetValue = frxTicketsGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 856
    Top = 72
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object QMLstTicketFP: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM GES_TICKET_FP'
      'WHERE '
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'TIPO = :TIPO AND'
      'RIT = :RIT'
      'ORDER BY FORMA_PAGO')
    UniDirectional = False
    DataSource = DSQMLstTickets
    Left = 40
    Top = 448
  end
  object DSQLstMTicketFP: TDataSource
    DataSet = QMLstTicketFP
    Left = 136
    Top = 448
  end
  object frxDBQLstMTicketFP: TfrxDBDataset
    UserName = 'frxDBQM'
    CloseDataSource = False
    DataSource = DSQLstMTicketFP
    Left = 384
    Top = 448
  end
  object frDBQMLstTicketFP: TfrDBDataSet
    DataSource = DSQLstMTicketFP
    Left = 256
    Top = 448
  end
  object QMLstTickets: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_TICKETS_FACTURACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND'
      '  SESION >= ?DESDE_SESION AND'
      '  SESION <= ?HASTA_SESION AND'
      '  CAJA >= ?DESDE_CAJA AND'
      '  CAJA <= ?HASTA_CAJA AND'
      '  TURNO >= ?DESDE_TURNO AND'
      '  TURNO <= ?HASTA_TURNO AND'
      '  FECHA >= ?DESDE_FECHA AND'
      '  FECHA <= ?HASTA_FECHA AND'
      '  FACTURACION = 0 AND'
      '  ESTADO <> 0'
      'ORDER BY  RIT')
    UniDirectional = False
    AfterOpen = QMLstTicketsAfterOpen
    BeforeClose = QMLstTicketsBeforeClose
    Left = 40
    Top = 352
  end
  object DSQMLstTickets: TDataSource
    DataSet = QMLstTickets
    Left = 136
    Top = 352
  end
  object frxDBQMLstTickets: TfrxDBDataset
    UserName = 'frxDBQM'
    CloseDataSource = False
    DataSource = DSQMLstTickets
    Left = 384
    Top = 352
  end
  object frDBQMLstTickets: TfrDBDataSet
    DataSource = DSQMLstTickets
    Left = 256
    Top = 352
  end
  object DSxTotalAnulados: TDataSource
    DataSet = xTotalAnulados
    Left = 360
    Top = 112
  end
  object xTotalAnulados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT coalesce(SUM(LIQUIDO_CANAL), 0) AS TOTAL'
      'FROM GES_TICKET_CABECERA'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'ESTADO = 2 AND'
      'ENTRADA_FAC = :ENTRADA AND'
      'TIPO = :TIPO AND'
      'FACTURACION = 0')
    UniDirectional = False
    Left = 256
    Top = 112
    object xTotalAnuladosTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
  end
  object xCabeceraFacNIF: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM GES_CABECERAS_S_FAC_NIF'
      'WHERE'
      '  TIPO = :TIPO AND'
      '  ID_S = :ID_TICKET')
    UniDirectional = False
    DataSource = DSQMLstTickets
    Left = 504
    Top = 352
  end
  object DSxCabeceraFacNIF: TDataSource
    DataSet = xCabeceraFacNIF
    Left = 608
    Top = 352
  end
  object QMLstIngresosEgresos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM GES_TPV_INGRESOS_EGRESOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'SESION BETWEEN :DESDE_SESION AND :HASTA_SESION AND'
      'CAJA BETWEEN :DESDE_CAJA AND :HASTA_CAJA AND'
      'TURNO BETWEEN :DESDE_TURNO AND :HASTA_TURNO')
    UniDirectional = False
    Left = 40
    Top = 496
  end
  object DSQMLstIngresosEgresos: TDataSource
    DataSet = QMLstIngresosEgresos
    Left = 136
    Top = 496
  end
  object frxDBQMLstIngresosEgresos: TfrxDBDataset
    UserName = 'frxDBQM'
    CloseDataSource = False
    DataSource = DSQMLstIngresosEgresos
    Left = 384
    Top = 496
  end
  object frDBQMLstIngresosEgresos: TfrDBDataSet
    DataSource = DSQMLstIngresosEgresos
    Left = 256
    Top = 496
  end
end
