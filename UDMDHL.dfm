object DMDHL: TDMDHL
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
  object xDHLTransportista: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM DHL_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ACREEDOR=?old_ACREEDOR ')
    InsertSQL.Strings = (
      'INSERT INTO DHL_CONFIGURACION'
      
        '  (EMPRESA,'#13#10'ACREEDOR,ACCOUNT_TYPECODE,ACCOUNT_NUMBER,PICKUP_CLO' +
        'SETIME,PICKUP_LOCATION,PICKUP_LOCATIONTYPE,PICKUP_SPECIALINST_VA' +
        'LUE,PICKUP_SPECIALINST_TYPECODE,PICKUP_REMARK,PICKUP_SHIPPER_POS' +
        'TALCODE,'#13#10'PICKUP_SHIPPER_CITYNAME,PICKUP_SHIPPER_COUNTRYCODE,PIC' +
        'KUP_SHIPPER_PROVINCECODE,PICKUP_SHIPPER_ADDRESSLINE1,PICKUP_SHIP' +
        'PER_ADDRESSLINE2,PICKUP_SHIPPER_ADDRESSLINE3,PICKUP_SHIPPER_COUN' +
        'TYNAME,PICKUP_SH_CONTACT_EMAIL,PICKUP_SH_CONTACT_PHONE,PICKUP_SH' +
        '_CONTACT_MOBILEPHONE,'#13#10'PICKUP_SH_CONTACT_COMPANYNAME,PICKUP_SH_C' +
        'ONTACT_FULLNAME,PICKUP_DETAILS_POSTALCODE,PICKUP_DETAILS_CITYNAM' +
        'E,PICKUP_DETAILS_COUNTRYCODE,PICKUP_DETAILS_PROVINCECODE,PICKUP_' +
        'DETAILS_ADDRESSLINE1,PICKUP_DETAILS_ADDRESSLINE2,PICKUP_DETAILS_' +
        'ADDRESSLINE3,PICKUP_DETAILS_COUNTYNAME,'#13#10'PICKUP_DE_CONTACT_EMAIL' +
        ',PICKUP_DE_CONTACT_PHONE,PICKUP_DE_CONTACT_MOBILEPHONE,PICKUP_DE' +
        '_CONTACT_COMPANYNAME,PICKUP_DE_CONTACT_FULLNAME,UNITOFMEASUREMEN' +
        'T,WS_USERNAME,WS_PASSWORD,WS_URL)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?ACREEDOR,?ACCOUNT_TYPECODE,?ACCOUNT_NUMBER,?PICKU' +
        'P_CLOSETIME,?PICKUP_LOCATION,?PICKUP_LOCATIONTYPE,?PICKUP_SPECIA' +
        'LINST_VALUE,?PICKUP_SPECIALINST_TYPECODE,?PICKUP_REMARK,?PICKUP_' +
        'SHIPPER_POSTALCODE,'#13#10'?PICKUP_SHIPPER_CITYNAME,?PICKUP_SHIPPER_CO' +
        'UNTRYCODE,?PICKUP_SHIPPER_PROVINCECODE,?PICKUP_SHIPPER_ADDRESSLI' +
        'NE1,?PICKUP_SHIPPER_ADDRESSLINE2,?PICKUP_SHIPPER_ADDRESSLINE3,?P' +
        'ICKUP_SHIPPER_COUNTYNAME,?PICKUP_SH_CONTACT_EMAIL,?PICKUP_SH_CON' +
        'TACT_PHONE,?PICKUP_SH_CONTACT_MOBILEPHONE,'#13#10'?PICKUP_SH_CONTACT_C' +
        'OMPANYNAME,?PICKUP_SH_CONTACT_FULLNAME,?PICKUP_DETAILS_POSTALCOD' +
        'E,?PICKUP_DETAILS_CITYNAME,?PICKUP_DETAILS_COUNTRYCODE,?PICKUP_D' +
        'ETAILS_PROVINCECODE,?PICKUP_DETAILS_ADDRESSLINE1,?PICKUP_DETAILS' +
        '_ADDRESSLINE2,?PICKUP_DETAILS_ADDRESSLINE3,?PICKUP_DETAILS_COUNT' +
        'YNAME,'#13#10'?PICKUP_DE_CONTACT_EMAIL,?PICKUP_DE_CONTACT_PHONE,?PICKU' +
        'P_DE_CONTACT_MOBILEPHONE,?PICKUP_DE_CONTACT_COMPANYNAME,?PICKUP_' +
        'DE_CONTACT_FULLNAME,?UNITOFMEASUREMENT,?WS_USERNAME,?WS_PASSWORD' +
        ',?WS_URL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM DHL_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ACREEDOR=?ACREEDOR ')
    SelectSQL.Strings = (
      'SELECT * FROM DHL_CONFIGURACION'
      'WHERE'
      'EMPRESA = :EMPRESA'
      'ORDER BY ACREEDOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE DHL_CONFIGURACION'
      'SET'
      '  ACCOUNT_TYPECODE=?ACCOUNT_TYPECODE '
      '  ,ACCOUNT_NUMBER=?ACCOUNT_NUMBER '
      '  ,PICKUP_CLOSETIME=?PICKUP_CLOSETIME '
      '  ,PICKUP_LOCATION=?PICKUP_LOCATION '
      '  ,PICKUP_LOCATIONTYPE=?PICKUP_LOCATIONTYPE '
      '  ,PICKUP_SPECIALINST_VALUE=?PICKUP_SPECIALINST_VALUE '
      '  ,PICKUP_SPECIALINST_TYPECODE=?PICKUP_SPECIALINST_TYPECODE '
      '  ,PICKUP_REMARK=?PICKUP_REMARK '
      '  ,PICKUP_SHIPPER_POSTALCODE=?PICKUP_SHIPPER_POSTALCODE '
      '  ,PICKUP_SHIPPER_CITYNAME=?PICKUP_SHIPPER_CITYNAME '
      '  ,PICKUP_SHIPPER_COUNTRYCODE=?PICKUP_SHIPPER_COUNTRYCODE '
      '  ,PICKUP_SHIPPER_PROVINCECODE=?PICKUP_SHIPPER_PROVINCECODE '
      '  ,PICKUP_SHIPPER_ADDRESSLINE1=?PICKUP_SHIPPER_ADDRESSLINE1 '
      '  ,PICKUP_SHIPPER_ADDRESSLINE2=?PICKUP_SHIPPER_ADDRESSLINE2 '
      '  ,PICKUP_SHIPPER_ADDRESSLINE3=?PICKUP_SHIPPER_ADDRESSLINE3 '
      '  ,PICKUP_SHIPPER_COUNTYNAME=?PICKUP_SHIPPER_COUNTYNAME '
      '  ,PICKUP_SH_CONTACT_EMAIL=?PICKUP_SH_CONTACT_EMAIL '
      '  ,PICKUP_SH_CONTACT_PHONE=?PICKUP_SH_CONTACT_PHONE '
      '  ,PICKUP_SH_CONTACT_MOBILEPHONE=?PICKUP_SH_CONTACT_MOBILEPHONE '
      '  ,PICKUP_SH_CONTACT_COMPANYNAME=?PICKUP_SH_CONTACT_COMPANYNAME '
      '  ,PICKUP_SH_CONTACT_FULLNAME=?PICKUP_SH_CONTACT_FULLNAME '
      '  ,PICKUP_DETAILS_POSTALCODE=?PICKUP_DETAILS_POSTALCODE '
      '  ,PICKUP_DETAILS_CITYNAME=?PICKUP_DETAILS_CITYNAME '
      '  ,PICKUP_DETAILS_COUNTRYCODE=?PICKUP_DETAILS_COUNTRYCODE '
      '  ,PICKUP_DETAILS_PROVINCECODE=?PICKUP_DETAILS_PROVINCECODE '
      '  ,PICKUP_DETAILS_ADDRESSLINE1=?PICKUP_DETAILS_ADDRESSLINE1 '
      '  ,PICKUP_DETAILS_ADDRESSLINE2=?PICKUP_DETAILS_ADDRESSLINE2 '
      '  ,PICKUP_DETAILS_ADDRESSLINE3=?PICKUP_DETAILS_ADDRESSLINE3 '
      '  ,PICKUP_DETAILS_COUNTYNAME=?PICKUP_DETAILS_COUNTYNAME '
      '  ,PICKUP_DE_CONTACT_EMAIL=?PICKUP_DE_CONTACT_EMAIL '
      '  ,PICKUP_DE_CONTACT_PHONE=?PICKUP_DE_CONTACT_PHONE '
      '  ,PICKUP_DE_CONTACT_MOBILEPHONE=?PICKUP_DE_CONTACT_MOBILEPHONE '
      '  ,PICKUP_DE_CONTACT_COMPANYNAME=?PICKUP_DE_CONTACT_COMPANYNAME '
      '  ,PICKUP_DE_CONTACT_FULLNAME=?PICKUP_DE_CONTACT_FULLNAME '
      '  ,UNITOFMEASUREMENT=?UNITOFMEASUREMENT '
      '  ,WS_USERNAME=?WS_USERNAME '
      '  ,WS_PASSWORD=?WS_PASSWORD '
      '  ,WS_URL=?WS_URL '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ACREEDOR=?ACREEDOR ')
    OnNewRecord = xDHLTransportistaNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ACREEDOR ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'DHL_CONFIGURACION'
    TablasBloqueo.Strings = (
      'SELECT * FROM DHL_CONFIGURACION'
      'WHERE '
      'EMPRESA = :EMPRESA'
      'ORDER BY EMPRESA, ACREEDOR')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object xDHLTransportistaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDHLTransportistaACREEDOR: TIntegerField
      DisplayLabel = 'Acreedor'
      FieldName = 'ACREEDOR'
    end
    object xDHLTransportistaACCOUNT_TYPECODE: TFIBStringField
      DisplayLabel = 'Account typeCode'
      FieldName = 'ACCOUNT_TYPECODE'
    end
    object xDHLTransportistaACCOUNT_NUMBER: TFIBStringField
      DisplayLabel = 'Account number'
      FieldName = 'ACCOUNT_NUMBER'
    end
    object xDHLTransportistaPICKUP_CLOSETIME: TFIBStringField
      DisplayLabel = 'closeTime'
      FieldName = 'PICKUP_CLOSETIME'
    end
    object xDHLTransportistaPICKUP_LOCATION: TFIBStringField
      DisplayLabel = 'location'
      FieldName = 'PICKUP_LOCATION'
      Size = 100
    end
    object xDHLTransportistaPICKUP_LOCATIONTYPE: TFIBStringField
      DisplayLabel = 'locationType'
      FieldName = 'PICKUP_LOCATIONTYPE'
    end
    object xDHLTransportistaPICKUP_SPECIALINST_VALUE: TFIBStringField
      DisplayLabel = 'specialInstructions'
      FieldName = 'PICKUP_SPECIALINST_VALUE'
      Size = 100
    end
    object xDHLTransportistaPICKUP_SPECIALINST_TYPECODE: TFIBStringField
      DisplayLabel = 'specialInstructions Type'
      FieldName = 'PICKUP_SPECIALINST_TYPECODE'
    end
    object xDHLTransportistaPICKUP_REMARK: TFIBStringField
      DisplayLabel = 'Remark'
      FieldName = 'PICKUP_REMARK'
      Size = 100
    end
    object xDHLTransportistaPICKUP_SHIPPER_POSTALCODE: TFIBStringField
      DisplayLabel = 'ShipperDetails postalCode'
      FieldName = 'PICKUP_SHIPPER_POSTALCODE'
    end
    object xDHLTransportistaPICKUP_SHIPPER_CITYNAME: TFIBStringField
      DisplayLabel = 'ShipperDetails cityName'
      FieldName = 'PICKUP_SHIPPER_CITYNAME'
      Size = 60
    end
    object xDHLTransportistaPICKUP_SHIPPER_COUNTRYCODE: TFIBStringField
      DisplayLabel = 'ShipperDetails countryCode'
      FieldName = 'PICKUP_SHIPPER_COUNTRYCODE'
    end
    object xDHLTransportistaPICKUP_SHIPPER_PROVINCECODE: TFIBStringField
      DisplayLabel = 'ShipperDetails provinceCode'
      FieldName = 'PICKUP_SHIPPER_PROVINCECODE'
      Size = 60
    end
    object xDHLTransportistaPICKUP_SHIPPER_ADDRESSLINE1: TFIBStringField
      DisplayLabel = 'ShipperDetails addressLine1'
      FieldName = 'PICKUP_SHIPPER_ADDRESSLINE1'
      Size = 60
    end
    object xDHLTransportistaPICKUP_SHIPPER_ADDRESSLINE2: TFIBStringField
      DisplayLabel = 'ShipperDetails addressLine2'
      FieldName = 'PICKUP_SHIPPER_ADDRESSLINE2'
      Size = 60
    end
    object xDHLTransportistaPICKUP_SHIPPER_ADDRESSLINE3: TFIBStringField
      DisplayLabel = 'ShipperDetails addressLine3'
      FieldName = 'PICKUP_SHIPPER_ADDRESSLINE3'
      Size = 60
    end
    object xDHLTransportistaPICKUP_SHIPPER_COUNTYNAME: TFIBStringField
      DisplayLabel = 'ShipperDetails countyName'
      FieldName = 'PICKUP_SHIPPER_COUNTYNAME'
      Size = 60
    end
    object xDHLTransportistaPICKUP_SH_CONTACT_EMAIL: TFIBStringField
      DisplayLabel = 'ShipperDetails email'
      FieldName = 'PICKUP_SH_CONTACT_EMAIL'
      Size = 100
    end
    object xDHLTransportistaPICKUP_SH_CONTACT_PHONE: TFIBStringField
      DisplayLabel = 'ShipperDetails phone'
      FieldName = 'PICKUP_SH_CONTACT_PHONE'
      Size = 100
    end
    object xDHLTransportistaPICKUP_SH_CONTACT_MOBILEPHONE: TFIBStringField
      DisplayLabel = 'ShipperDetails mobilePhone'
      FieldName = 'PICKUP_SH_CONTACT_MOBILEPHONE'
      Size = 100
    end
    object xDHLTransportistaPICKUP_SH_CONTACT_COMPANYNAME: TFIBStringField
      DisplayLabel = 'ShipperDetails companyName'
      FieldName = 'PICKUP_SH_CONTACT_COMPANYNAME'
      Size = 100
    end
    object xDHLTransportistaPICKUP_SH_CONTACT_FULLNAME: TFIBStringField
      DisplayLabel = 'ShipperDetails fullName'
      FieldName = 'PICKUP_SH_CONTACT_FULLNAME'
      Size = 256
    end
    object xDHLTransportistaPICKUP_DETAILS_POSTALCODE: TFIBStringField
      DisplayLabel = 'pickupDetails postalCode'
      FieldName = 'PICKUP_DETAILS_POSTALCODE'
    end
    object xDHLTransportistaPICKUP_DETAILS_CITYNAME: TFIBStringField
      DisplayLabel = 'pickupDetails cityName'
      FieldName = 'PICKUP_DETAILS_CITYNAME'
      Size = 60
    end
    object xDHLTransportistaPICKUP_DETAILS_COUNTRYCODE: TFIBStringField
      DisplayLabel = 'pickupDetails countryCode'
      FieldName = 'PICKUP_DETAILS_COUNTRYCODE'
    end
    object xDHLTransportistaPICKUP_DETAILS_PROVINCECODE: TFIBStringField
      DisplayLabel = 'pickupDetails provinceCode'
      FieldName = 'PICKUP_DETAILS_PROVINCECODE'
      Size = 60
    end
    object xDHLTransportistaPICKUP_DETAILS_ADDRESSLINE1: TFIBStringField
      DisplayLabel = 'pickupDetails addressLine1'
      FieldName = 'PICKUP_DETAILS_ADDRESSLINE1'
      Size = 60
    end
    object xDHLTransportistaPICKUP_DETAILS_ADDRESSLINE2: TFIBStringField
      DisplayLabel = 'pickupDetails addressLine2'
      FieldName = 'PICKUP_DETAILS_ADDRESSLINE2'
      Size = 60
    end
    object xDHLTransportistaPICKUP_DETAILS_ADDRESSLINE3: TFIBStringField
      DisplayLabel = 'pickupDetails addressLine3'
      FieldName = 'PICKUP_DETAILS_ADDRESSLINE3'
      Size = 60
    end
    object xDHLTransportistaPICKUP_DETAILS_COUNTYNAME: TFIBStringField
      DisplayLabel = 'pickupDetails countyName'
      FieldName = 'PICKUP_DETAILS_COUNTYNAME'
      Size = 60
    end
    object xDHLTransportistaPICKUP_DE_CONTACT_EMAIL: TFIBStringField
      DisplayLabel = 'pickupDetails email'
      FieldName = 'PICKUP_DE_CONTACT_EMAIL'
      Size = 100
    end
    object xDHLTransportistaPICKUP_DE_CONTACT_PHONE: TFIBStringField
      DisplayLabel = 'pickupDetails phone'
      FieldName = 'PICKUP_DE_CONTACT_PHONE'
      Size = 100
    end
    object xDHLTransportistaPICKUP_DE_CONTACT_MOBILEPHONE: TFIBStringField
      DisplayLabel = 'pickupDetails mobilePhone'
      FieldName = 'PICKUP_DE_CONTACT_MOBILEPHONE'
      Size = 100
    end
    object xDHLTransportistaPICKUP_DE_CONTACT_COMPANYNAME: TFIBStringField
      DisplayLabel = 'pickupDetails companyName'
      FieldName = 'PICKUP_DE_CONTACT_COMPANYNAME'
      Size = 100
    end
    object xDHLTransportistaPICKUP_DE_CONTACT_FULLNAME: TFIBStringField
      DisplayLabel = 'pickupDetails fullName'
      FieldName = 'PICKUP_DE_CONTACT_FULLNAME'
      Size = 256
    end
    object xDHLTransportistaUNITOFMEASUREMENT: TFIBStringField
      DisplayLabel = 'unitOfMeasurement'
      FieldName = 'UNITOFMEASUREMENT'
    end
    object xDHLTransportistaWS_USERNAME: TFIBStringField
      FieldName = 'WS_USERNAME'
      Size = 256
    end
    object xDHLTransportistaWS_PASSWORD: TFIBStringField
      FieldName = 'WS_PASSWORD'
      Size = 256
    end
    object xDHLTransportistaWS_URL: TFIBStringField
      FieldName = 'WS_URL'
      Size = 256
    end
  end
  object DSxDHLTransportista: TDataSource
    DataSet = xDHLTransportista
    Left = 168
    Top = 16
  end
end
