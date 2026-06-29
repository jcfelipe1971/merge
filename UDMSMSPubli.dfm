object DMSMSPubli: TDMSMSPubli
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 301
  Top = 249
  Height = 223
  Width = 338
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 264
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
    Left = 264
    Top = 64
  end
  object xSMSPubliConfig: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SMSPUBLI_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CANAL=?old_CANAL ')
    InsertSQL.Strings = (
      'INSERT INTO SMSPUBLI_CONFIGURACION'
      
        '  (EMPRESA,'#13#10'CANAL,APIKEY,REPORT_URL,MESSAGE_FROM,CONCAT,ENCODIN' +
        'G)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?CANAL,?APIKEY,?REPORT_URL,?MESSAGE_FROM,?CONCAT,?' +
        'ENCODING)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SMSPUBLI_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL ')
    SelectSQL.Strings = (
      'SELECT * FROM SMSPUBLI_CONFIGURACION'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SMSPUBLI_CONFIGURACION'
      'SET'
      '  APIKEY=?APIKEY '
      '  ,REPORT_URL=?REPORT_URL '
      '  ,MESSAGE_FROM=?MESSAGE_FROM '
      '  ,CONCAT=?CONCAT '
      '  ,ENCODING=?ENCODING '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL ')
    OnNewRecord = xSMSPubliConfigNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CANAL ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SMSPUBLI_CONFIGURACION'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 16
    object xSMSPubliConfigEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xSMSPubliConfigCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xSMSPubliConfigAPIKEY: TFIBStringField
      DisplayLabel = 'API Key'
      FieldName = 'APIKEY'
      Size = 256
    end
    object xSMSPubliConfigREPORT_URL: TFIBStringField
      DisplayLabel = 'Report URL'
      FieldName = 'REPORT_URL'
      Size = 256
    end
    object xSMSPubliConfigMESSAGE_FROM: TFIBStringField
      DisplayLabel = 'From'
      FieldName = 'MESSAGE_FROM'
      Size = 15
    end
    object xSMSPubliConfigCONCAT: TIntegerField
      DisplayLabel = 'Concat'
      FieldName = 'CONCAT'
    end
    object xSMSPubliConfigENCODING: TFIBStringField
      DisplayLabel = 'Encoding'
      FieldName = 'ENCODING'
      Size = 5
    end
  end
  object DSxSMSPubliConfig: TDataSource
    DataSet = xSMSPubliConfig
    Left = 168
    Top = 16
  end
  object xSMSPubliMensajes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SMSPUBLI_MENSAJES'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO SMSPUBLI_MENSAJES'
      
        '  (ID,'#13#10'EMPRESA,CANAL,MESSAGE_FROM,MESSAGE_TO,MESSAGE_TEXT,MESSA' +
        'GE_CUSTOM,MESSAGE_SEND_AT,REPORT_URL,CONCAT,ENCODING,'#13#10'FAKE,RESP' +
        'ONSE_STATUS,RESPONSE_SMS_ID,RESPONSE_CUSTOM)'
      'VALUES'
      
        '  (?ID,'#13#10'?EMPRESA,?CANAL,?MESSAGE_FROM,?MESSAGE_TO,?MESSAGE_TEXT' +
        ',?MESSAGE_CUSTOM,?MESSAGE_SEND_AT,?REPORT_URL,?CONCAT,?ENCODING,' +
        #13#10'?FAKE,?RESPONSE_STATUS,?RESPONSE_SMS_ID,?RESPONSE_CUSTOM)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SMSPUBLI_MENSAJES'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SMSPUBLI_MENSAJES'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL'
      'ORDER BY ID DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SMSPUBLI_MENSAJES'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,CANAL=?CANAL '
      '  ,MESSAGE_FROM=?MESSAGE_FROM '
      '  ,MESSAGE_TO=?MESSAGE_TO '
      '  ,MESSAGE_TEXT=?MESSAGE_TEXT '
      '  ,MESSAGE_CUSTOM=?MESSAGE_CUSTOM '
      '  ,MESSAGE_SEND_AT=?MESSAGE_SEND_AT '
      '  ,REPORT_URL=?REPORT_URL '
      '  ,CONCAT=?CONCAT '
      '  ,ENCODING=?ENCODING '
      '  ,FAKE=?FAKE '
      '  ,RESPONSE_STATUS=?RESPONSE_STATUS '
      '  ,RESPONSE_SMS_ID=?RESPONSE_SMS_ID '
      '  ,RESPONSE_CUSTOM=?RESPONSE_CUSTOM '
      'WHERE'
      '  ID=?ID ')
    OnNewRecord = xSMSPubliMensajesNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SMSPUBLI_MENSAJES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 64
    object xSMSPubliMensajesID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object xSMSPubliMensajesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xSMSPubliMensajesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xSMSPubliMensajesMESSAGE_FROM: TFIBStringField
      DisplayLabel = 'From'
      FieldName = 'MESSAGE_FROM'
    end
    object xSMSPubliMensajesMESSAGE_TO: TFIBStringField
      DisplayLabel = 'to'
      FieldName = 'MESSAGE_TO'
    end
    object xSMSPubliMensajesMESSAGE_TEXT: TFIBStringField
      DisplayLabel = 'Text'
      FieldName = 'MESSAGE_TEXT'
      Size = 512
    end
    object xSMSPubliMensajesMESSAGE_CUSTOM: TFIBStringField
      DisplayLabel = 'Custom'
      FieldName = 'MESSAGE_CUSTOM'
      Size = 35
    end
    object xSMSPubliMensajesMESSAGE_SEND_AT: TDateTimeField
      DisplayLabel = 'Send At'
      FieldName = 'MESSAGE_SEND_AT'
    end
    object xSMSPubliMensajesREPORT_URL: TFIBStringField
      DisplayLabel = 'Report URL'
      FieldName = 'REPORT_URL'
      Size = 256
    end
    object xSMSPubliMensajesCONCAT: TIntegerField
      DisplayLabel = 'Concat'
      FieldName = 'CONCAT'
    end
    object xSMSPubliMensajesENCODING: TFIBStringField
      DisplayLabel = 'Encoding'
      FieldName = 'ENCODING'
      Size = 5
    end
    object xSMSPubliMensajesFAKE: TIntegerField
      DisplayLabel = 'Fake'
      FieldName = 'FAKE'
    end
    object xSMSPubliMensajesRESPONSE_STATUS: TFIBStringField
      DisplayLabel = 'Resp. Status'
      FieldName = 'RESPONSE_STATUS'
      Size = 35
    end
    object xSMSPubliMensajesRESPONSE_SMS_ID: TFIBStringField
      DisplayLabel = 'Resp. SMS Id'
      FieldName = 'RESPONSE_SMS_ID'
      Size = 256
    end
    object xSMSPubliMensajesRESPONSE_CUSTOM: TFIBStringField
      DisplayLabel = 'Resp. Custom'
      FieldName = 'RESPONSE_CUSTOM'
      Size = 35
    end
  end
  object DSxSMSPubliMensajes: TDataSource
    DataSet = xSMSPubliMensajes
    Left = 168
    Top = 64
  end
end
