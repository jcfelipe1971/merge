object DMFormasPago: TDMFormasPago
  OldCreateOrder = False
  OnCreate = DMFormasPagoCreate
  Left = 373
  Top = 190
  Height = 322
  Width = 346
  object QMFormaPago: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_FORMAS_PAGO'
      'WHERE'
      '  FORMA=?old_FORMA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_FORMAS_PAGO'
      
        '  (ID_REGISTRO,TITULO,PLAZOS,DIAS_1_PLAZO,DIAS_E_PLAZOS,REMESAR,' +
        'PRONTO_PAGO,PAGO_AUTOMATICO,ACEPTAR,HEREDA_FINANCIACION,ORDENAR_' +
        'PAGO,MES_NATURAL,PEDIR_DETALLE_PAGO,TITULO_LARGO,FORMA,TIPO_EFEC' +
        'TO,DATOS_BANCARIOS,SIN_RECIBOS)'
      'VALUES'
      
        '  (?ID_REGISTRO,?TITULO,?PLAZOS,?DIAS_1_PLAZO,?DIAS_E_PLAZOS,?RE' +
        'MESAR,?PRONTO_PAGO,?PAGO_AUTOMATICO,?ACEPTAR,?HEREDA_FINANCIACIO' +
        'N,?ORDENAR_PAGO,?MES_NATURAL,?PEDIR_DETALLE_PAGO,?TITULO_LARGO,?' +
        'FORMA,?TIPO_EFECTO,?DATOS_BANCARIOS,?SIN_RECIBOS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_FORMAS_PAGO'
      'WHERE'
      '  FORMA=?FORMA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_FORMAS_PAGO'
      'ORDER BY FORMA'
      ' ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_FORMAS_PAGO'
      'SET'
      '  ID_REGISTRO=?ID_REGISTRO '
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
      '  ,TIPO_EFECTO=?TIPO_EFECTO '
      '  ,DATOS_BANCARIOS=?DATOS_BANCARIOS '
      '  ,SIN_RECIBOS=?SIN_RECIBOS '
      'WHERE'
      '  FORMA=?FORMA ')
    AfterOpen = QMFormaPagoAfterOpen
    OnNewRecord = QMFormaPagoNewRecord
    ClavesPrimarias.Strings = (
      'FORMA')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_FORMAS_PAGO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 8
    object QMFormaPagoFORMA: TFIBStringField
      DisplayLabel = 'Forma'
      FieldName = 'FORMA'
      Size = 3
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
      OnChange = QMFormaPagoTIPO_EFECTOChange
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
    object QMFormaPagoPAGO_AUTOMATICO: TIntegerField
      DisplayLabel = 'Pago Autom'#225'tico'
      FieldName = 'PAGO_AUTOMATICO'
    end
    object QMFormaPagoDATOS_BANCARIOS: TFIBStringField
      DisplayLabel = 'Datos Bancarios'
      FieldName = 'DATOS_BANCARIOS'
      Size = 1
    end
    object QMFormaPagoHEREDA_FINANCIACION: TIntegerField
      DisplayLabel = 'Hereda Financiaci'#243'n'
      FieldName = 'HEREDA_FINANCIACION'
    end
    object QMFormaPagoORDENAR_PAGO: TIntegerField
      DisplayLabel = 'Ordenar Pago'
      FieldName = 'ORDENAR_PAGO'
    end
    object QMFormaPagoMES_NATURAL: TIntegerField
      DisplayLabel = 'Mes Natural'
      FieldName = 'MES_NATURAL'
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
    object QMFormaPagoSIN_RECIBOS: TIntegerField
      DisplayLabel = 'Sin Recibos'
      FieldName = 'SIN_RECIBOS'
    end
  end
  object DSQMFormaPago: TDataSource
    DataSet = QMFormaPago
    Left = 176
    Top = 8
  end
  object DSxTipoEfecto: TDataSource
    DataSet = xTipoEfecto
    Left = 176
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 272
    Top = 8
  end
  object xTipoEfecto: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPO_EFECTO'
      'WHERE TIPO=?TIPO_EFECTO')
    UniDirectional = False
    DataSource = DSQMFormaPago
    Left = 48
    Top = 56
  end
  object QMFormasPagoIdioma: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_FORMAS_PAGO_IDIOMAS'
      'WHERE'
      '  FORMA_PAGO=?old_FORMA_PAGO AND '
      '  IDIOMA=?old_IDIOMA ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_FORMAS_PAGO_IDIOMAS'
      '  (FORMA_PAGO,IDIOMA,TITULO,TITULO_LARGO)'
      'VALUES'
      '  (?FORMA_PAGO,?IDIOMA,?TITULO,?TITULO_LARGO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_FORMAS_PAGO_IDIOMAS'
      'WHERE'
      '  FORMA_PAGO=?FORMA_PAGO AND '
      '  IDIOMA=?IDIOMA ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_FORMAS_PAGO_IDIOMAS'
      'WHERE FORMA_PAGO=?FORMA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_FORMAS_PAGO_IDIOMAS'
      'SET'
      '  TITULO=?TITULO '
      '  ,TITULO_LARGO=?TITULO_LARGO'
      'WHERE'
      '  FORMA_PAGO=?FORMA_PAGO AND '
      '  IDIOMA=?IDIOMA ')
    DataSource = DSQMFormaPago
    AfterDelete = GrabaIdioma
    AfterPost = GrabaIdioma
    OnNewRecord = QMFormasPagoIdiomaNewRecord
    ClavesPrimarias.Strings = (
      'FORMA_PAGO '
      'IDIOMA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_FORMAS_PAGO_IDIOMAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 104
    object QMFormasPagoIdiomaFORMA_PAGO: TFIBStringField
      DisplayLabel = 'Forma de Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object QMFormasPagoIdiomaIDIOMA: TFIBStringField
      DisplayLabel = 'Idioma'
      FieldName = 'IDIOMA'
      Size = 3
    end
    object QMFormasPagoIdiomaTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMFormasPagoIdiomaTITULO_LARGO: TFIBStringField
      DisplayLabel = 'Titulo Largo'
      FieldName = 'TITULO_LARGO'
      Size = 100
    end
  end
  object DSQMFormasPagoIdioma: TDataSource
    DataSet = QMFormasPagoIdioma
    Left = 176
    Top = 104
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 272
    Top = 56
  end
end
