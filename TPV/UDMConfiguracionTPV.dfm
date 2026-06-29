object DMConfiguracionTPV: TDMConfiguracionTPV
  OldCreateOrder = False
  OnCreate = DMConfiguracionTPVCreate
  OnDestroy = DataModuleDestroy
  Left = 659
  Top = 272
  Height = 350
  Width = 461
  object QMConfiguracion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GES_TPV_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE ')
    InsertSQL.Strings = (
      'INSERT INTO GES_TPV_CONFIGURACION'
      
        '  (LIMITE_FAC,SERIE,CLIENTE,TERCERO,ACREEDOR,ROLLO_HACIENDA,UNIC' +
        'A_FAC,'
      
        '   FACTURAR,EMPRESA,EJERCICIO,CANAL,CONTROL_STOCK,DIAS_CADUCIDAD' +
        '_RESERVA,'
      
        '   DIAS_CADUCIDAD_VALES,DESPLEGAR_BUSQUEDA_VALES,USAR_MEDIOS_VAL' +
        'ES,'
      '   USAR_MEDIAS_ENTREGAS,CUENTA_VALES,OBLIGA_TICKET_DEVOLUCION,'
      
        '   OBLIGA_ARTICULOS_DEVOLUCION,GENERA_VALE_DEVOLUCION,PRIORIZA_F' +
        'P,'
      '   PRIORIZA_STK,POR_IMPORTES,FORMA_PAGO_TICKET,FORMA_PAGO_ABONO,'
      
        '   DIAS_PROPUESTA_PEDIDO,FACTURACION_POR_LINEAS,OBLIGA_FP_DEVOLU' +
        'CION,'
      
        '   REGULA_MOV_STOCK,CANAL_FACTURACION_DEFECTO,AUTO_GRABA_CABECER' +
        'A,'
      '   CONTROLA_DISPONIBILIDAD)'
      'VALUES'
      
        '  (?LIMITE_FAC,?SERIE,?CLIENTE,?TERCERO,?ACREEDOR,?ROLLO_HACIEND' +
        'A,?UNICA_FAC,'
      
        '   ?FACTURAR,?EMPRESA,?EJERCICIO,?CANAL,?CONTROL_STOCK,?DIAS_CAD' +
        'UCIDAD_RESERVA,'
      
        '   ?DIAS_CADUCIDAD_VALES,?DESPLEGAR_BUSQUEDA_VALES,?USAR_MEDIOS_' +
        'VALES,'
      
        '   ?USAR_MEDIAS_ENTREGAS,?CUENTA_VALES,?OBLIGA_TICKET_DEVOLUCION' +
        ','
      
        '   ?OBLIGA_ARTICULOS_DEVOLUCION,?GENERA_VALE_DEVOLUCION,?PRIORIZ' +
        'A_FP,'
      
        '   ?PRIORIZA_STK,?POR_IMPORTES,?FORMA_PAGO_TICKET,?FORMA_PAGO_AB' +
        'ONO,'
      
        '   ?DIAS_PROPUESTA_PEDIDO,?FACTURACION_POR_LINEAS,?OBLIGA_FP_DEV' +
        'OLUCION,'
      
        '   ?REGULA_MOV_STOCK,?CANAL_FACTURACION_DEFECTO,?AUTO_GRABA_CABE' +
        'CERA,'
      '   ?CONTROLA_DISPONIBILIDAD)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_TPV_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_TPV_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE GES_TPV_CONFIGURACION'
      'SET'
      '  LIMITE_FAC=?LIMITE_FAC '
      '  ,CLIENTE=?CLIENTE '
      '  ,TERCERO=?TERCERO '
      '  ,ACREEDOR=?ACREEDOR '
      '  ,ROLLO_HACIENDA=?ROLLO_HACIENDA '
      '  ,UNICA_FAC=?UNICA_FAC '
      '  ,FACTURAR=?FACTURAR '
      '  ,CONTROL_STOCK=?CONTROL_STOCK '
      '  ,DIAS_CADUCIDAD_RESERVA=?DIAS_CADUCIDAD_RESERVA '
      '  ,DIAS_CADUCIDAD_VALES=?DIAS_CADUCIDAD_VALES '
      '  ,DESPLEGAR_BUSQUEDA_VALES=?DESPLEGAR_BUSQUEDA_VALES '
      '  ,USAR_MEDIOS_VALES=?USAR_MEDIOS_VALES '
      '  ,USAR_MEDIAS_ENTREGAS=?USAR_MEDIAS_ENTREGAS '
      '  ,CUENTA_VALES=?CUENTA_VALES '
      '  ,OBLIGA_TICKET_DEVOLUCION=?OBLIGA_TICKET_DEVOLUCION '
      '  ,OBLIGA_ARTICULOS_DEVOLUCION=?OBLIGA_ARTICULOS_DEVOLUCION '
      '  ,GENERA_VALE_DEVOLUCION=?GENERA_VALE_DEVOLUCION '
      '  ,PRIORIZA_FP=?PRIORIZA_FP '
      '  ,PRIORIZA_STK=?PRIORIZA_STK '
      '  ,POR_IMPORTES=?POR_IMPORTES '
      '  ,FORMA_PAGO_TICKET=?FORMA_PAGO_TICKET '
      '  ,FORMA_PAGO_ABONO=?FORMA_PAGO_ABONO '
      '  ,DIAS_PROPUESTA_PEDIDO=?DIAS_PROPUESTA_PEDIDO '
      '  ,FACTURACION_POR_LINEAS=?FACTURACION_POR_LINEAS '
      '  ,OBLIGA_FP_DEVOLUCION=?OBLIGA_FP_DEVOLUCION'
      '  ,REGULA_MOV_STOCK=?REGULA_MOV_STOCK'
      '  ,CANAL_FACTURACION_DEFECTO=?CANAL_FACTURACION_DEFECTO'
      '  ,AUTO_GRABA_CABECERA=?AUTO_GRABA_CABECERA'
      '  ,OBLIGA_CLIENTE_CONCRETO=?OBLIGA_CLIENTE_CONCRETO'
      '  ,CERRAR_TICKET_PRECIO_0=?CERRAR_TICKET_PRECIO_0'
      '  ,CONTROLA_DISPONIBILIDAD=?CONTROLA_DISPONIBILIDAD'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE ')
    AfterOpen = QMConfiguracionAfterOpen
    BeforePost = QMConfiguracionBeforePost
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_TPV_CONFIGURACION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMConfiguracionEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMConfiguracionEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object QMConfiguracionCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object QMConfiguracionSERIE: TFIBStringField
      FieldName = 'SERIE'
      Size = 10
    end
    object QMConfiguracionTERCERO: TIntegerField
      FieldName = 'TERCERO'
    end
    object QMConfiguracionCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
    end
    object QMConfiguracionCONTROL_STOCK: TIntegerField
      FieldName = 'CONTROL_STOCK'
      OnChange = QMConfiguracionCONTROL_STOCKChange
    end
    object QMConfiguracionFACTURAR: TIntegerField
      FieldName = 'FACTURAR'
    end
    object QMConfiguracionUNICA_FAC: TIntegerField
      FieldName = 'UNICA_FAC'
    end
    object QMConfiguracionLIMITE_FAC: TFloatField
      FieldName = 'LIMITE_FAC'
    end
    object QMConfiguracionROLLO_HACIENDA: TIntegerField
      FieldName = 'ROLLO_HACIENDA'
    end
    object QMConfiguracionACREEDOR: TIntegerField
      FieldName = 'ACREEDOR'
    end
    object QMConfiguracionDIAS_CADUCIDAD_RESERVA: TIntegerField
      FieldName = 'DIAS_CADUCIDAD_RESERVA'
    end
    object QMConfiguracionDIAS_CADUCIDAD_VALES: TIntegerField
      FieldName = 'DIAS_CADUCIDAD_VALES'
    end
    object QMConfiguracionDESPLEGAR_BUSQUEDA_VALES: TIntegerField
      FieldName = 'DESPLEGAR_BUSQUEDA_VALES'
    end
    object QMConfiguracionUSAR_MEDIOS_VALES: TIntegerField
      FieldName = 'USAR_MEDIOS_VALES'
    end
    object QMConfiguracionUSAR_MEDIAS_ENTREGAS: TIntegerField
      FieldName = 'USAR_MEDIAS_ENTREGAS'
    end
    object QMConfiguracionCUENTA_VALES: TFIBStringField
      FieldName = 'CUENTA_VALES'
      Size = 15
    end
    object QMConfiguracionOBLIGA_TICKET_DEVOLUCION: TIntegerField
      FieldName = 'OBLIGA_TICKET_DEVOLUCION'
    end
    object QMConfiguracionOBLIGA_ARTICULOS_DEVOLUCION: TIntegerField
      FieldName = 'OBLIGA_ARTICULOS_DEVOLUCION'
    end
    object QMConfiguracionGENERA_VALE_DEVOLUCION: TIntegerField
      FieldName = 'GENERA_VALE_DEVOLUCION'
    end
    object QMConfiguracionPRIORIZA_FP: TIntegerField
      FieldName = 'PRIORIZA_FP'
    end
    object QMConfiguracionPRIORIZA_STK: TIntegerField
      FieldName = 'PRIORIZA_STK'
    end
    object QMConfiguracionPOR_IMPORTES: TIntegerField
      FieldName = 'POR_IMPORTES'
    end
    object QMConfiguracionFORMA_PAGO_TICKET: TFIBStringField
      FieldName = 'FORMA_PAGO_TICKET'
      Size = 3
    end
    object QMConfiguracionFORMA_PAGO_ABONO: TFIBStringField
      FieldName = 'FORMA_PAGO_ABONO'
      Size = 3
    end
    object QMConfiguracionDIAS_PROPUESTA_PEDIDO: TIntegerField
      FieldName = 'DIAS_PROPUESTA_PEDIDO'
    end
    object QMConfiguracionFACTURACION_POR_LINEAS: TIntegerField
      FieldName = 'FACTURACION_POR_LINEAS'
    end
    object QMConfiguracionOBLIGA_FP_DEVOLUCION: TIntegerField
      FieldName = 'OBLIGA_FP_DEVOLUCION'
    end
    object QMConfiguracionREGULA_MOV_STOCK: TIntegerField
      FieldName = 'REGULA_MOV_STOCK'
    end
    object QMConfiguracionCANAL_FACTURACION_DEFECTO: TIntegerField
      FieldName = 'CANAL_FACTURACION_DEFECTO'
    end
    object QMConfiguracionAUTO_GRABA_CABECERA: TIntegerField
      FieldName = 'AUTO_GRABA_CABECERA'
    end
    object QMConfiguracionOBLIGA_CLIENTE_CONCRETO: TIntegerField
      FieldName = 'OBLIGA_CLIENTE_CONCRETO'
    end
    object QMConfiguracionCERRAR_TICKET_PRECIO_0: TIntegerField
      FieldName = 'CERRAR_TICKET_PRECIO_0'
    end
    object QMConfiguracionCONTROLA_DISPONIBILIDAD: TIntegerField
      DisplayLabel = 'Control Disponibilidad'
      FieldName = 'CONTROLA_DISPONIBILIDAD'
    end
  end
  object DSQMConfiguracion: TDataSource
    DataSet = QMConfiguracion
    Left = 128
    Top = 16
  end
  object xTipoStock: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM GES_TPV_TIPOS_STOCK'
      'WHERE'
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM GES_TPV_TIPOS_STOCK'
      'WHERE'
      'TIPO=?CONTROL_STOCK AND '
      'TIPO<>0')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMConfiguracion
    ClavesPrimarias.Strings = (
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'GES_TPV_TIPOS_STOCK'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 64
    object xTipoStockTIPO: TIntegerField
      FieldName = 'TIPO'
    end
    object xTipoStockTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxTiposStock: TDataSource
    DataSet = xTipoStock
    Left = 128
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 280
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 376
    Top = 16
  end
end
