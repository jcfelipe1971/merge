object DMSEUR: TDMSEUR
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 230
  Top = 173
  Height = 263
  Width = 345
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
  object xSEURTransportista: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SEUR_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ACREEDOR=?old_ACREEDOR ')
    InsertSQL.Strings = (
      'INSERT INTO SEUR_CONFIGURACION'
      '  (CODIGO_INTEGRACION,'
      
        'NUMERO_BULTO,LIMITE_BULTO_INFERIOR,LIMITE_BULTO_SUPERIOR,EMPRESA' +
        ',ACREEDOR,CODIGO_CLIENTE,GRANT_TYPE,CLIENT_ID,CLIENT_SECRET,USER' +
        'NAME,'
      
        'USER_PASSWORD,ACCESS_TOKEN,REFRESH_TOKEN,FECHA_EXPIRACION,CCC,ID' +
        '_NUMBER,BUSINESS_UNIT,SENDER_NAME,SENDER_PHONE,SENDER_ADDR_STREE' +
        'T,'
      'SENDER_ADDR_POSTCODE,SENDER_ADDR_COUNTRY,SENDER_ADDR_CITY)'
      'VALUES'
      '  (?CODIGO_INTEGRACION,'
      
        '?NUMERO_BULTO,?LIMITE_BULTO_INFERIOR,?LIMITE_BULTO_SUPERIOR,?EMP' +
        'RESA,?ACREEDOR,?CODIGO_CLIENTE,?GRANT_TYPE,?CLIENT_ID,?CLIENT_SE' +
        'CRET,?USERNAME,'
      
        '?USER_PASSWORD,?ACCESS_TOKEN,?REFRESH_TOKEN,?FECHA_EXPIRACION,?C' +
        'CC,?ID_NUMBER,?BUSINESS_UNIT,?SENDER_NAME,?SENDER_PHONE,?SENDER_' +
        'ADDR_STREET,'
      '?SENDER_ADDR_POSTCODE,?SENDER_ADDR_COUNTRY,?SENDER_ADDR_CITY)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SEUR_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ACREEDOR=?ACREEDOR ')
    SelectSQL.Strings = (
      'SELECT * FROM SEUR_CONFIGURACION'
      'WHERE EMPRESA=?EMPRESA'
      'ORDER BY EMPRESA,ACREEDOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SEUR_CONFIGURACION'
      'SET'
      '  CODIGO_INTEGRACION=?CODIGO_INTEGRACION '
      '  ,NUMERO_BULTO=?NUMERO_BULTO '
      '  ,LIMITE_BULTO_INFERIOR=?LIMITE_BULTO_INFERIOR '
      '  ,LIMITE_BULTO_SUPERIOR=?LIMITE_BULTO_SUPERIOR '
      '  ,CODIGO_CLIENTE=?CODIGO_CLIENTE '
      '  ,GRANT_TYPE=?GRANT_TYPE '
      '  ,CLIENT_ID=?CLIENT_ID '
      '  ,CLIENT_SECRET=?CLIENT_SECRET '
      '  ,USERNAME=?USERNAME '
      '  ,USER_PASSWORD=?USER_PASSWORD '
      '  ,ACCESS_TOKEN=?ACCESS_TOKEN '
      '  ,REFRESH_TOKEN=?REFRESH_TOKEN '
      '  ,FECHA_EXPIRACION=?FECHA_EXPIRACION '
      '  ,CCC=?CCC '
      '  ,ID_NUMBER=?ID_NUMBER '
      '  ,BUSINESS_UNIT=?BUSINESS_UNIT '
      '  ,SENDER_NAME=?SENDER_NAME '
      '  ,SENDER_PHONE=?SENDER_PHONE '
      '  ,SENDER_ADDR_STREET=?SENDER_ADDR_STREET '
      '  ,SENDER_ADDR_POSTCODE=?SENDER_ADDR_POSTCODE '
      '  ,SENDER_ADDR_COUNTRY=?SENDER_ADDR_COUNTRY '
      '  ,SENDER_ADDR_CITY=?SENDER_ADDR_CITY '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ACREEDOR=?ACREEDOR ')
    OnNewRecord = xSEURTransportistaNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ACREEDOR ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SEUR_CONFIGURACION'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object xSEURTransportistaCODIGO_INTEGRACION: TIntegerField
      DisplayLabel = 'Cod. Integracion'
      FieldName = 'CODIGO_INTEGRACION'
    end
    object xSEURTransportistaNUMERO_BULTO: TIntegerField
      DisplayLabel = 'Nro. Bulto'
      FieldName = 'NUMERO_BULTO'
    end
    object xSEURTransportistaLIMITE_BULTO_INFERIOR: TIntegerField
      DisplayLabel = 'L'#237'm. Inf.'
      FieldName = 'LIMITE_BULTO_INFERIOR'
    end
    object xSEURTransportistaLIMITE_BULTO_SUPERIOR: TIntegerField
      DisplayLabel = 'Lim. Sup.'
      FieldName = 'LIMITE_BULTO_SUPERIOR'
    end
    object xSEURTransportistaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xSEURTransportistaACREEDOR: TIntegerField
      DisplayLabel = 'Acreedor'
      FieldName = 'ACREEDOR'
    end
    object xSEURTransportistaCODIGO_CLIENTE: TIntegerField
      DisplayLabel = 'C'#243'd. Cliente'
      FieldName = 'CODIGO_CLIENTE'
    end
    object xSEURTransportistaGRANT_TYPE: TFIBStringField
      DisplayLabel = 'Grant Type'
      FieldName = 'GRANT_TYPE'
      Size = 256
    end
    object xSEURTransportistaCLIENT_ID: TFIBStringField
      DisplayLabel = 'Client Id'
      FieldName = 'CLIENT_ID'
      Size = 256
    end
    object xSEURTransportistaCLIENT_SECRET: TFIBStringField
      DisplayLabel = 'Client Secret'
      FieldName = 'CLIENT_SECRET'
      Size = 256
    end
    object xSEURTransportistaUSERNAME: TFIBStringField
      DisplayLabel = 'Username'
      FieldName = 'USERNAME'
      Size = 256
    end
    object xSEURTransportistaUSER_PASSWORD: TFIBStringField
      DisplayLabel = 'Password'
      FieldName = 'USER_PASSWORD'
      Size = 256
    end
    object xSEURTransportistaACCESS_TOKEN: TFIBStringField
      DisplayLabel = 'Accoss Token'
      FieldName = 'ACCESS_TOKEN'
      Size = 3000
    end
    object xSEURTransportistaREFRESH_TOKEN: TFIBStringField
      DisplayLabel = 'Refresh Token'
      FieldName = 'REFRESH_TOKEN'
      Size = 3000
    end
    object xSEURTransportistaFECHA_EXPIRACION: TDateTimeField
      DisplayLabel = 'Exporacion Token'
      FieldName = 'FECHA_EXPIRACION'
    end
    object xSEURTransportistaCCC: TFIBStringField
      DisplayLabel = 'Cod. Cta. Contable'
      FieldName = 'CCC'
      Size = 256
    end
    object xSEURTransportistaID_NUMBER: TFIBStringField
      DisplayLabel = 'Id number'
      FieldName = 'ID_NUMBER'
      Size = 256
    end
    object xSEURTransportistaBUSINESS_UNIT: TFIBStringField
      DisplayLabel = 'Buss. Unit'
      FieldName = 'BUSINESS_UNIT'
      Size = 256
    end
    object xSEURTransportistaSENDER_NAME: TFIBStringField
      DisplayLabel = 'Name'
      FieldName = 'SENDER_NAME'
      Size = 256
    end
    object xSEURTransportistaSENDER_PHONE: TFIBStringField
      DisplayLabel = 'Phone'
      FieldName = 'SENDER_PHONE'
      Size = 256
    end
    object xSEURTransportistaSENDER_ADDR_STREET: TFIBStringField
      DisplayLabel = 'Streename'
      FieldName = 'SENDER_ADDR_STREET'
      Size = 256
    end
    object xSEURTransportistaSENDER_ADDR_POSTCODE: TFIBStringField
      DisplayLabel = 'PostCode'
      FieldName = 'SENDER_ADDR_POSTCODE'
      Size = 256
    end
    object xSEURTransportistaSENDER_ADDR_COUNTRY: TFIBStringField
      DisplayLabel = 'Country'
      FieldName = 'SENDER_ADDR_COUNTRY'
      Size = 256
    end
    object xSEURTransportistaSENDER_ADDR_CITY: TFIBStringField
      DisplayLabel = 'City'
      FieldName = 'SENDER_ADDR_CITY'
      Size = 256
    end
  end
  object DSxSEURTransportista: TDataSource
    DataSet = xSEURTransportista
    Left = 168
    Top = 16
  end
end
