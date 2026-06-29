object DMGenFormasPago: TDMGenFormasPago
  OldCreateOrder = False
  OnCreate = DMFormasPagoCreate
  Left = 434
  Top = 211
  Height = 313
  Width = 332
  object QMFormaPago: TFIBTableSet
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
      
        '  (SERIE,IMPORTE_MINIMO,CUENTA_PAGO_PGC,ID_REGISTRO,COMISION_TAR' +
        'JETA,EMPRESA,EJERCICIO,CANAL,TITULO,PLAZOS,DIAS_1_PLAZO,DIAS_E_P' +
        'LAZOS,REMESAR,PRONTO_PAGO,PAGO_AUTOMATICO,ACEPTAR,HEREDA_FINANCI' +
        'ACION,ORDENAR_PAGO,MES_NATURAL,PEDIR_DETALLE_PAGO,TITULO_LARGO,A' +
        'CTIVO,DIVIDE_ASIENTO_COMISION_TARJETA,FORMA_PAGO,CUENTA_PAGO,TIP' +
        'O_EFECTO,TIPO_PAGO,DATOS_BANCARIOS,FORMA_ALTERNATIVA,CUENTA_PAGO' +
        '_COMISION_TARJETA,SIN_RECIBOS)'
      'VALUES'
      
        '  (?SERIE,?IMPORTE_MINIMO,?CUENTA_PAGO_PGC,?ID_REGISTRO,?COMISIO' +
        'N_TARJETA,?EMPRESA,?EJERCICIO,?CANAL,?TITULO,?PLAZOS,?DIAS_1_PLA' +
        'ZO,?DIAS_E_PLAZOS,?REMESAR,?PRONTO_PAGO,?PAGO_AUTOMATICO,?ACEPTA' +
        'R,?HEREDA_FINANCIACION,?ORDENAR_PAGO,?MES_NATURAL,?PEDIR_DETALLE' +
        '_PAGO,?TITULO_LARGO,?ACTIVO,?DIVIDE_ASIENTO_COMISION_TARJETA,?FO' +
        'RMA_PAGO,?CUENTA_PAGO,?TIPO_EFECTO,?TIPO_PAGO,?DATOS_BANCARIOS,?' +
        'FORMA_ALTERNATIVA,?CUENTA_PAGO_COMISION_TARJETA,?SIN_RECIBOS)')
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
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_GES_FP'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL'
      'ORDER BY FORMA_PAGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CUENTAS_GES_FP'
      'SET'
      '  SERIE=?SERIE '
      '  ,IMPORTE_MINIMO=?IMPORTE_MINIMO '
      '  ,CUENTA_PAGO_PGC=?CUENTA_PAGO_PGC '
      '  ,ID_REGISTRO=?ID_REGISTRO '
      '  ,COMISION_TARJETA=?COMISION_TARJETA '
      '  ,TITULO=?TITULO '
      '  ,PLAZOS=?PLAZOS '
      '  ,DIAS_1_PLAZO=?DIAS_1_PLAZO '
      '  ,DIAS_E_PLAZOS=?DIAS_E_PLAZOS '
      '  ,REMESAR=?REMESAR '
      '  ,PRONTO_PAGO=?PRONTO_PAGO '
      '  ,PAGO_AUTOMATICO=?PAGO_AUTOMATICO '
      '  ,ACEPTAR=?ACEPTAR '
      '  ,HEREDA_FINANCIACION=?HEREDA_FINANCIACION '
      '  ,ORDENAR_PAGO=?ORDENAR_PAGO '
      '  ,MES_NATURAL=?MES_NATURAL '
      '  ,PEDIR_DETALLE_PAGO=?PEDIR_DETALLE_PAGO '
      '  ,TITULO_LARGO=?TITULO_LARGO '
      '  ,ACTIVO=?ACTIVO '
      
        '  ,DIVIDE_ASIENTO_COMISION_TARJETA=?DIVIDE_ASIENTO_COMISION_TARJ' +
        'ETA '
      '  ,CUENTA_PAGO=?CUENTA_PAGO '
      '  ,TIPO_EFECTO=?TIPO_EFECTO '
      '  ,TIPO_PAGO=?TIPO_PAGO '
      '  ,DATOS_BANCARIOS=?DATOS_BANCARIOS '
      '  ,FORMA_ALTERNATIVA=?FORMA_ALTERNATIVA '
      '  ,CUENTA_PAGO_COMISION_TARJETA=?CUENTA_PAGO_COMISION_TARJETA '
      '  ,SIN_RECIBOS=?SIN_RECIBOS '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  FORMA_PAGO=?FORMA_PAGO ')
    AfterOpen = QMFormaPagoAfterOpen
    BeforeClose = QMFormaPagoBeforeClose
    OnNewRecord = QMFormaPagoNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'FORMA_PAGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CUENTAS_GES_FP'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMFormaPagoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMFormaPagoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMFormaPagoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMFormaPagoFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMFormaPagoCUENTA: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CUENTA_PAGO'
      Size = 15
    end
    object QMFormaPagoTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMFormaPagoPLAZOS: TIntegerField
      DisplayLabel = 'Plazos'
      FieldName = 'PLAZOS'
    end
    object QMFormaPagoDIAS_1_PLAZO: TIntegerField
      DisplayLabel = 'D'#237'as 1er Plazo'
      FieldName = 'DIAS_1_PLAZO'
    end
    object QMFormaPagoDIAS_E_PLAZOS: TIntegerField
      DisplayLabel = 'D'#237'as e/Plazos'
      FieldName = 'DIAS_E_PLAZOS'
    end
    object QMFormaPagoTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efecto'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object QMFormaPagoREMESAR: TIntegerField
      DisplayLabel = 'Remesar'
      FieldName = 'REMESAR'
    end
    object QMFormaPagoPRONTO_PAGO: TIntegerField
      DisplayLabel = 'Pronto Pago'
      FieldName = 'PRONTO_PAGO'
    end
    object QMFormaPagoACEPTAR: TIntegerField
      DisplayLabel = 'Aceptar'
      FieldName = 'ACEPTAR'
    end
    object QMFormaPagoTIPO_PAGO: TFIBStringField
      DisplayLabel = 'Tipo Pago'
      FieldName = 'TIPO_PAGO'
      Size = 1
    end
    object QMFormaPagoPAGO_AUTOMATICO: TIntegerField
      DisplayLabel = 'Pago Autom.'
      FieldName = 'PAGO_AUTOMATICO'
    end
    object QMFormaPagoDATOS_BANCARIOS: TFIBStringField
      DisplayLabel = 'Datos Bancarios'
      FieldName = 'DATOS_BANCARIOS'
      Size = 1
    end
    object QMFormaPagoHEREDA_FINANCIACION: TIntegerField
      DisplayLabel = 'Hereda Financ.'
      FieldName = 'HEREDA_FINANCIACION'
    end
    object QMFormaPagoORDENAR_PAGO: TIntegerField
      DisplayLabel = 'Ord. Pago'
      FieldName = 'ORDENAR_PAGO'
    end
    object QMFormaPagoMES_NATURAL: TIntegerField
      DisplayLabel = 'Mes Natural'
      FieldName = 'MES_NATURAL'
    end
    object QMFormaPagoIMPORTE_MINIMO: TFloatField
      DisplayLabel = 'Importe M'#237'nimo'
      FieldName = 'IMPORTE_MINIMO'
    end
    object QMFormaPagoFORMA_ALTERNATIVA: TFIBStringField
      DisplayLabel = 'F. Pago Alternativa'
      FieldName = 'FORMA_ALTERNATIVA'
      Size = 3
    end
    object QMFormaPagoPEDIR_DETALLE_PAGO: TIntegerField
      DisplayLabel = 'Pedir Det. Pago'
      FieldName = 'PEDIR_DETALLE_PAGO'
    end
    object QMFormaPagoTITULO_LARGO: TFIBStringField
      DisplayLabel = 'Titulo Largo'
      FieldName = 'TITULO_LARGO'
      Size = 100
    end
    object QMFormaPagoACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMFormaPagoDIVIDE_ASIENTO_COMISION_TARJETA: TIntegerField
      DisplayLabel = 'Divide Ato. Comision Tarjeta'
      FieldName = 'DIVIDE_ASIENTO_COMISION_TARJETA'
    end
    object QMFormaPagoCUENTA_PAGO_COMISION_TARJETA: TFIBStringField
      DisplayLabel = 'Cta. Pago Comision Tarjeta'
      FieldName = 'CUENTA_PAGO_COMISION_TARJETA'
      Size = 15
    end
    object QMFormaPagoCOMISION_TARJETA: TFloatField
      DisplayLabel = 'Comision Tarjeta'
      FieldName = 'COMISION_TARJETA'
    end
    object QMFormaPagoSIN_RECIBOS: TIntegerField
      DisplayLabel = 'Sin Recibos'
      FieldName = 'SIN_RECIBOS'
    end
  end
  object DSQMFormaPago: TDataSource
    DataSet = QMFormaPago
    Left = 136
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 248
    Top = 64
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
  object QMSeries: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CUENTAS_GES_FP_EECS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  FORMA_PAGO=?old_FORMA_PAGO AND '
      '  SERIE=?old_SERIE ')
    InsertSQL.Strings = (
      'INSERT INTO CON_CUENTAS_GES_FP_EECS'
      
        '  (SERIE,CUENTA_PAGO_PGC,EMPRESA,EJERCICIO,CANAL,FORMA_PAGO,CUEN' +
        'TA_PAGO,DIVIDE_ASIENTO_COMISION_TARJETA,CUENTA_PAGO_COMISION_TAR' +
        'JETA)'
      'VALUES'
      
        '  (?SERIE,?CUENTA_PAGO_PGC,?EMPRESA,?EJERCICIO,?CANAL,?FORMA_PAG' +
        'O,?CUENTA_PAGO,?DIVIDE_ASIENTO_COMISION_TARJETA,?CUENTA_PAGO_COM' +
        'ISION_TARJETA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_GES_FP_EECS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  FORMA_PAGO=?FORMA_PAGO AND '
      '  SERIE=?SERIE ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_CUENTAS_GES_FP_EECS'
      'WHERE'
      '  FORMA_PAGO=?FORMA_PAGO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA '
      'ORDER BY SERIE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CUENTAS_GES_FP_EECS'
      'SET'
      '  CUENTA_PAGO_PGC=?CUENTA_PAGO_PGC '
      '  ,CUENTA_PAGO=?CUENTA_PAGO '
      
        '  ,DIVIDE_ASIENTO_COMISION_TARJETA=?DIVIDE_ASIENTO_COMISION_TARJ' +
        'ETA '
      '  ,CUENTA_PAGO_COMISION_TARJETA=?CUENTA_PAGO_COMISION_TARJETA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  FORMA_PAGO=?FORMA_PAGO AND '
      '  SERIE=?SERIE ')
    DataSource = DSQMFormaPago
    OnNewRecord = QMSeriesNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'FORMA_PAGO '
      'SERIE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CUENTAS_GES_FP_EECS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 64
    object QMSeriesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMSeriesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMSeriesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMSeriesFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMSeriesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMSeriesCUENTA_PAGO: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA_PAGO'
      Size = 15
    end
    object QMSeriesTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      DisplayWidth = 150
      FieldKind = fkCalculated
      FieldName = 'TITULO'
      OnGetText = QMSeriesTITULOGetText
      Size = 40
      Calculated = True
    end
    object QMSeriesDIVIDE_ASIENTO_COMISION_TARJETA: TIntegerField
      DisplayLabel = 'Divide Ato. Comision Tarjeta'
      FieldName = 'DIVIDE_ASIENTO_COMISION_TARJETA'
    end
    object QMSeriesCUENTA_PAGO_COMISION_TARJETA: TFIBStringField
      DisplayLabel = 'Cta. Pago Comision Tarjeta'
      FieldName = 'CUENTA_PAGO_COMISION_TARJETA'
      Size = 15
    end
  end
  object DSQMSeries: TDataSource
    DataSet = QMSeries
    Left = 136
    Top = 64
  end
  object QMSuplemento: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_CUENTAS_GES_FP_SUPL_PORTE'
      'WHERE'
      '  PAIS=?old_PAIS AND '
      '  ACREEDOR=?old_ACREEDOR AND '
      '  FORMA_PAGO=?old_FORMA_PAGO AND '
      '  CANAL=?old_CANAL AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO CON_CUENTAS_GES_FP_SUPL_PORTE'
      
        '  (EMPRESA,EJERCICIO,CANAL,FORMA_PAGO,ACREEDOR,PAIS,IMPORTE_SUPL' +
        'EMENTO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?FORMA_PAGO,?ACREEDOR,?PAIS,?IMPOR' +
        'TE_SUPLEMENTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_GES_FP_SUPL_PORTE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  FORMA_PAGO=?FORMA_PAGO AND '
      '  ACREEDOR=?ACREEDOR AND '
      '  PAIS=?PAIS')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_CUENTAS_GES_FP_SUPL_PORTE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  FORMA_PAGO=?FORMA_PAGO'
      'ORDER BY ACREEDOR, PAIS'
      '')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_CUENTAS_GES_FP_SUPL_PORTE'
      'SET'
      '  IMPORTE_SUPLEMENTO=?IMPORTE_SUPLEMENTO '
      'WHERE'
      '  PAIS=?PAIS AND '
      '  ACREEDOR=?ACREEDOR AND '
      '  FORMA_PAGO=?FORMA_PAGO AND '
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMFormaPago
    OnNewRecord = QMSuplementoNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'FORMA_PAGO '
      'ACREEDOR '
      'PAIS'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_CUENTAS_GES_FP_SUPL_PORTE'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 112
    object QMSuplementoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMSuplementoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMSuplementoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMSuplementoFORMA_PAGO: TFIBStringField
      DisplayLabel = 'Forma Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMSuplementoACREEDOR: TIntegerField
      DisplayLabel = 'Transportista'
      FieldName = 'ACREEDOR'
    end
    object QMSuplementoPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMSuplementoIMPORTE_SUPLEMENTO: TFloatField
      DisplayLabel = 'Importe Supl.'
      FieldName = 'IMPORTE_SUPLEMENTO'
    end
    object QMSuplementoTITULO: TStringField
      DisplayLabel = 'Titulo'
      FieldKind = fkCalculated
      FieldName = 'TITULO'
      OnGetText = QMSuplementoTITULOGetText
      Size = 60
      Calculated = True
    end
  end
  object DSQMSuplemento: TDataSource
    DataSet = QMSuplemento
    Left = 136
    Top = 112
  end
end
