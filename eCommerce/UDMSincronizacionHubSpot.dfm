object DMSincronizacionHubSpot: TDMSincronizacionHubSpot
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 447
  Top = 238
  Height = 406
  Width = 497
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 325
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
    Left = 325
    Top = 56
  end
  object xConfiguracion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM HS_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO HS_CONFIGURACION'
      '  (EMPRESA,'#13#10'ACCESS_TOKEN,URL)'
      'VALUES'
      '  (?EMPRESA,'#13#10'?ACCESS_TOKEN,?URL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM HS_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM HS_CONFIGURACION'
      'WHERE '
      'EMPRESA = :EMPRESA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE HS_CONFIGURACION'
      'SET'
      '  ACCESS_TOKEN=?ACCESS_TOKEN '
      '  ,URL=?URL '
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    ClavesPrimarias.Strings = (
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'HS_CONFIGURACION'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 8
    object xfiguracionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xConfiguracionACCESS_TOKEN: TFIBStringField
      DisplayLabel = 'Token'
      FieldName = 'ACCESS_TOKEN'
      Size = 3000
    end
    object xConfiguracionURL: TFIBStringField
      FieldName = 'URL'
      Size = 3000
    end
  end
  object DSConfiguracion: TDataSource
    DataSet = xConfiguracion
    Left = 176
    Top = 8
  end
  object xCompanies: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM HS_COMPANIES'
      'WHERE'
      '  HUBSPOT_COMPANY_ID=?old_HUBSPOT_COMPANY_ID AND '
      '  DELFOS_COMPANY_ID=?old_DELFOS_COMPANY_ID ')
    InsertSQL.Strings = (
      'INSERT INTO HS_COMPANIES'
      
        '  (HUBSPOT_COMPANY_ID,'#13#10'DELFOS_COMPANY_ID,NAME,COMPANY_CIF,COMPA' +
        'NY_DOMAIN,PHONE,EMAIL,ADDRESS,ZIP_CODE,CITY,COUNTRY,'#13#10'SECTOR,DIS' +
        'COUNT_PROFILE,ID_CLIENTE,TERCERO,TERCERO_DIRECCION,DATE_ADD,DATE' +
        '_UPD,DATE_SINC,RESULTADO_ENVIO,RESPUESTA_ENVIO)'
      'VALUES'
      
        '  (?HUBSPOT_COMPANY_ID,'#13#10'?DELFOS_COMPANY_ID,?NAME,?COMPANY_CIF,?' +
        'COMPANY_DOMAIN,?PHONE,?EMAIL,?ADDRESS,?ZIP_CODE,?CITY,?COUNTRY,'#13 +
        #10'?SECTOR,?DISCOUNT_PROFILE,?ID_CLIENTE,?TERCERO,?TERCERO_DIRECCI' +
        'ON,?DATE_ADD,?DATE_UPD,?DATE_SINC,?RESULTADO_ENVIO,?RESPUESTA_EN' +
        'VIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM HS_COMPANIES'
      'WHERE'
      '  HUBSPOT_COMPANY_ID=?old_HUBSPOT_COMPANY_ID AND '
      '  DELFOS_COMPANY_ID=?old_DELFOS_COMPANY_ID ')
    SelectSQL.Strings = (
      'SELECT * FROM HS_COMPANIES'
      ' ORDER BY HUBSPOT_COMPANY_ID, DELFOS_COMPANY_ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE HS_COMPANIES'
      'SET'
      '  HUBSPOT_COMPANY_ID=?new_HUBSPOT_COMPANY_ID '
      '  ,DELFOS_COMPANY_ID=?new_DELFOS_COMPANY_ID '
      '  ,NAME=?NAME '
      '  ,COMPANY_CIF=?COMPANY_CIF '
      '  ,COMPANY_DOMAIN=?COMPANY_DOMAIN '
      '  ,PHONE=?PHONE '
      '  ,EMAIL=?EMAIL '
      '  ,ADDRESS=?ADDRESS '
      '  ,ZIP_CODE=?ZIP_CODE '
      '  ,CITY=?CITY '
      '  ,COUNTRY=?COUNTRY '
      '  ,SECTOR=?SECTOR '
      '  ,DISCOUNT_PROFILE=?DISCOUNT_PROFILE '
      '  ,ID_CLIENTE=?ID_CLIENTE '
      '  ,TERCERO=?TERCERO '
      '  ,TERCERO_DIRECCION=?TERCERO_DIRECCION '
      '  ,DATE_ADD=?DATE_ADD '
      '  ,DATE_UPD=?DATE_UPD '
      '  ,DATE_SINC=?DATE_SINC '
      '  ,RESULTADO_ENVIO=?RESULTADO_ENVIO '
      '  ,RESPUESTA_ENVIO=?RESPUESTA_ENVIO '
      'WHERE'
      '  HUBSPOT_COMPANY_ID=?old_HUBSPOT_COMPANY_ID AND '
      '  DELFOS_COMPANY_ID=?old_DELFOS_COMPANY_ID ')
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    AfterOpen = xCompaniesAfterOpen
    BeforeClose = xCompaniesBeforeClose
    ClavesPrimarias.Strings = (
      'HUBSPOT_COMPANY_ID '
      'DELFOS_COMPANY_ID ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'HS_COMPANIES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 56
    object xCompaniesHUBSPOT_COMPANY_ID: TFIBStringField
      DisplayLabel = 'HubSpot Company Id'
      FieldName = 'HUBSPOT_COMPANY_ID'
      Size = 256
    end
    object xCompaniesDELFOS_COMPANY_ID: TFIBStringField
      DisplayLabel = 'Delfos Company Id'
      FieldName = 'DELFOS_COMPANY_ID'
      Size = 256
    end
    object xCompaniesNAME: TFIBStringField
      DisplayLabel = 'Name'
      FieldName = 'NAME'
      Size = 256
    end
    object xCompaniesCOMPANY_CIF: TFIBStringField
      DisplayLabel = 'CIF'
      FieldName = 'COMPANY_CIF'
      Size = 256
    end
    object xCompaniesCOMPANY_DOMAIN: TFIBStringField
      DisplayLabel = 'Domain'
      FieldName = 'COMPANY_DOMAIN'
      Size = 256
    end
    object xCompaniesPHONE: TFIBStringField
      DisplayLabel = 'Phone'
      FieldName = 'PHONE'
      Size = 256
    end
    object xCompaniesEMAIL: TFIBStringField
      DisplayLabel = 'email'
      FieldName = 'EMAIL'
      Size = 256
    end
    object xCompaniesADDRESS: TFIBStringField
      DisplayLabel = 'Address'
      FieldName = 'ADDRESS'
      Size = 256
    end
    object xCompaniesZIP_CODE: TFIBStringField
      DisplayLabel = 'Zip Code'
      FieldName = 'ZIP_CODE'
      Size = 256
    end
    object xCompaniesCITY: TFIBStringField
      DisplayLabel = 'City'
      FieldName = 'CITY'
      Size = 256
    end
    object xCompaniesCOUNTRY: TFIBStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Size = 256
    end
    object xCompaniesSECTOR: TFIBStringField
      DisplayLabel = 'Sector'
      FieldName = 'SECTOR'
      Size = 256
    end
    object xCompaniesDISCOUNT_PROFILE: TFIBStringField
      DisplayLabel = 'Discount Profile'
      FieldName = 'DISCOUNT_PROFILE'
      Size = 256
    end
    object xCompaniesID_CLIENTE: TIntegerField
      DisplayLabel = 'Id Cliente'
      FieldName = 'ID_CLIENTE'
    end
    object xCompaniesTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xCompaniesTERCERO_DIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'TERCERO_DIRECCION'
    end
    object xCompaniesDATE_ADD: TDateTimeField
      DisplayLabel = 'Date Add'
      FieldName = 'DATE_ADD'
    end
    object xCompaniesDATE_UPD: TDateTimeField
      DisplayLabel = 'Date Upd'
      FieldName = 'DATE_UPD'
    end
    object xCompaniesRESULTADO_ENVIO: TIntegerField
      DisplayLabel = 'Resultado Envio'
      FieldName = 'RESULTADO_ENVIO'
    end
    object xCompaniesRESPUESTA_ENVIO: TMemoField
      DisplayLabel = 'Respuesta Envio'
      FieldName = 'RESPUESTA_ENVIO'
      BlobType = ftMemo
      Size = 8
    end
    object xCompaniesDATE_SINC: TDateTimeField
      DisplayLabel = 'Date Sinc'
      FieldName = 'DATE_SINC'
    end
  end
  object DSCompanies: TDataSource
    DataSet = xCompanies
    Left = 176
    Top = 56
  end
  object xContacts: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 128
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM HS_CONTACTS'
      'WHERE'
      '  HUBSPOT_CONTACT_ID=?old_HUBSPOT_CONTACT_ID AND '
      '  HUBSPOT_COMPANY_ID=?old_HUBSPOT_COMPANY_ID AND '
      '  TERCERO=?old_TERCERO AND '
      '  TERCERO_CONTACTO=?old_TERCERO_CONTACTO ')
    InsertSQL.Strings = (
      'INSERT INTO HS_CONTACTS'
      
        '  (HUBSPOT_CONTACT_ID,'#13#10'HUBSPOT_COMPANY_ID,DELFOS_CONTACT_ID,DEL' +
        'FOS_COMPANY_ID,FIRSTNAME,LASTNAME,EMAIL,PHONE,JOBTITLE,DEPARTMEN' +
        'T,TERCERO,'#13#10'TERCERO_CONTACTO,DATE_ADD,DATE_UPD,DATE_SINC,ID_CLIE' +
        'NTE,RESULTADO_ENVIO,RESPUESTA_ENVIO)'
      'VALUES'
      
        '  (?HUBSPOT_CONTACT_ID,'#13#10'?HUBSPOT_COMPANY_ID,?DELFOS_CONTACT_ID,' +
        '?DELFOS_COMPANY_ID,?FIRSTNAME,?LASTNAME,?EMAIL,?PHONE,?JOBTITLE,' +
        '?DEPARTMENT,?TERCERO,'#13#10'?TERCERO_CONTACTO,?DATE_ADD,?DATE_UPD,?DA' +
        'TE_SINC,?ID_CLIENTE,?RESULTADO_ENVIO,?RESPUESTA_ENVIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM HS_CONTACTS'
      'WHERE'
      '  HUBSPOT_CONTACT_ID=?HUBSPOT_CONTACT_ID AND '
      '  HUBSPOT_COMPANY_ID=?HUBSPOT_COMPANY_ID AND '
      '  TERCERO=?TERCERO AND '
      '  TERCERO_CONTACTO=?TERCERO_CONTACTO ')
    SelectSQL.Strings = (
      'SELECT * FROM HS_CONTACTS'
      'WHERE'
      '  HUBSPOT_COMPANY_ID=?HUBSPOT_COMPANY_ID AND'
      '  DELFOS_COMPANY_ID=?DELFOS_COMPANY_ID AND'
      '  TERCERO=?TERCERO'
      'ORDER BY HUBSPOT_CONTACT_ID, TERCERO_CONTACTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE HS_CONTACTS'
      'SET'
      '  HUBSPOT_CONTACT_ID=?new_HUBSPOT_CONTACT_ID '
      '  ,HUBSPOT_COMPANY_ID=?new_HUBSPOT_COMPANY_ID '
      '  ,TERCERO=?new_TERCERO '
      '  ,TERCERO_CONTACTO=?new_TERCERO_CONTACTO '
      '  ,DELFOS_CONTACT_ID=?new_DELFOS_CONTACT_ID '
      '  ,DELFOS_COMPANY_ID=?new_DELFOS_COMPANY_ID '
      '  ,FIRSTNAME=?FIRSTNAME '
      '  ,LASTNAME=?LASTNAME '
      '  ,EMAIL=?EMAIL '
      '  ,PHONE=?PHONE '
      '  ,JOBTITLE=?JOBTITLE '
      '  ,DEPARTMENT=?DEPARTMENT '
      '  ,DATE_ADD=?DATE_ADD '
      '  ,DATE_UPD=?DATE_UPD '
      '  ,DATE_SINC=?DATE_SINC '
      '  ,ID_CLIENTE=?ID_CLIENTE '
      '  ,RESULTADO_ENVIO=?RESULTADO_ENVIO '
      '  ,RESPUESTA_ENVIO=?RESPUESTA_ENVIO '
      'WHERE'
      '  HUBSPOT_CONTACT_ID=?old_HUBSPOT_CONTACT_ID AND '
      '  HUBSPOT_COMPANY_ID=?old_HUBSPOT_COMPANY_ID AND '
      '  DELFOS_CONTACT_ID=?old_DELFOS_CONTACT_ID AND '
      '  DELFOS_COMPANY_ID=?old_DELFOS_COMPANY_ID AND '
      '  TERCERO=?old_TERCERO AND '
      '  TERCERO_CONTACTO=?old_TERCERO_CONTACTO ')
    DataSource = DSCompanies
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    ClavesPrimarias.Strings = (
      'HUBSPOT_CONTACT_ID '
      'HUBSPOT_COMPANY_ID '
      'TERCERO '
      'TERCERO_CONTACTO ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'HS_CONTACTS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 104
    object xContactsHUBSPOT_CONTACT_ID: TFIBStringField
      DisplayLabel = 'HubSpot Contact Id'
      FieldName = 'HUBSPOT_CONTACT_ID'
      Size = 256
    end
    object xContactsHUBSPOT_COMPANY_ID: TFIBStringField
      DisplayLabel = 'HubSpot Company Id'
      FieldName = 'HUBSPOT_COMPANY_ID'
      Size = 256
    end
    object xContactsDELFOS_CONTACT_ID: TFIBStringField
      DisplayLabel = 'Delfos ContactId'
      FieldName = 'DELFOS_CONTACT_ID'
      Size = 256
    end
    object xContactsDELFOS_COMPANY_ID: TFIBStringField
      DisplayLabel = 'Delfos Company Id'
      FieldName = 'DELFOS_COMPANY_ID'
      Size = 256
    end
    object xContactsFIRSTNAME: TFIBStringField
      DisplayLabel = 'First Name'
      FieldName = 'FIRSTNAME'
      Size = 256
    end
    object xContactsLASTNAME: TFIBStringField
      DisplayLabel = 'Last Name'
      FieldName = 'LASTNAME'
      Size = 256
    end
    object xContactsEMAIL: TFIBStringField
      DisplayLabel = 'email'
      FieldName = 'EMAIL'
      Size = 256
    end
    object xContactsPHONE: TFIBStringField
      DisplayLabel = 'Phone'
      FieldName = 'PHONE'
      Size = 256
    end
    object xContactsJOBTITLE: TFIBStringField
      DisplayLabel = 'Job Title'
      FieldName = 'JOBTITLE'
      Size = 256
    end
    object xContactsDEPARTMENT: TFIBStringField
      DisplayLabel = 'Department'
      FieldName = 'DEPARTMENT'
      Size = 256
    end
    object xContactsTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xContactsTERCERO_CONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'TERCERO_CONTACTO'
    end
    object xContactsDATE_ADD: TDateTimeField
      DisplayLabel = 'Date Add'
      FieldName = 'DATE_ADD'
    end
    object xContactsDATE_UPD: TDateTimeField
      DisplayLabel = 'Date Upd'
      FieldName = 'DATE_UPD'
    end
    object xContactsRESULTADO_ENVIO: TIntegerField
      DisplayLabel = 'Resultado Envio'
      FieldName = 'RESULTADO_ENVIO'
    end
    object xContactsRESPUESTA_ENVIO: TMemoField
      DisplayLabel = 'Respuesta Envio'
      FieldName = 'RESPUESTA_ENVIO'
      BlobType = ftMemo
      Size = 8
    end
    object xContactsID_CLIENTE: TIntegerField
      DisplayLabel = 'Id Cliente'
      FieldName = 'ID_CLIENTE'
    end
    object xContactsDATE_SINC: TDateTimeField
      DisplayLabel = 'Date Sinc'
      FieldName = 'DATE_SINC'
    end
  end
  object DSContacts: TDataSource
    DataSet = xContacts
    Left = 176
    Top = 104
  end
  object xDeals: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM HS_DEALS'
      'WHERE'
      '  HUBSPOT_DEAL_ID=?old_HUBSPOT_DEAL_ID ')
    InsertSQL.Strings = (
      'INSERT INTO HS_DEALS'
      
        '  (HUBSPOT_DEAL_ID,'#13#10'DELFOS_DEAL_ID,HUBSPOT_CONTACT_ID,HUBSPOT_C' +
        'OMPANY_ID,DEAL_URL,DEAL_AMOUNT,CURRENCY,DEAL_STATUS,ID_S,DATE_AD' +
        'D,DATE_UPD,'#13#10'DATE_SINC,RESULTADO_ENVIO,RESPUESTA_ENVIO)'
      'VALUES'
      
        '  (?HUBSPOT_DEAL_ID,'#13#10'?DELFOS_DEAL_ID,?HUBSPOT_CONTACT_ID,?HUBSP' +
        'OT_COMPANY_ID,?DEAL_URL,?DEAL_AMOUNT,?CURRENCY,?DEAL_STATUS,?ID_' +
        'S,?DATE_ADD,?DATE_UPD,'#13#10'?DATE_SINC,?RESULTADO_ENVIO,?RESPUESTA_E' +
        'NVIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM HS_DEALS'
      'WHERE'
      '  HUBSPOT_DEAL_ID=?HUBSPOT_DEAL_ID ')
    SelectSQL.Strings = (
      'SELECT * FROM HS_DEALS'
      ' ORDER BY HUBSPOT_DEAL_ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE HS_DEALS'
      'SET'
      '  HUBSPOT_DEAL_ID=?new_HUBSPOT_DEAL_ID '
      '  ,DELFOS_DEAL_ID=?new_DELFOS_DEAL_ID '
      '  ,HUBSPOT_CONTACT_ID=?HUBSPOT_CONTACT_ID '
      '  ,HUBSPOT_COMPANY_ID=?HUBSPOT_COMPANY_ID '
      '  ,DEAL_URL=?DEAL_URL '
      '  ,DEAL_AMOUNT=?DEAL_AMOUNT '
      '  ,CURRENCY=?CURRENCY '
      '  ,DEAL_STATUS=?DEAL_STATUS '
      '  ,ID_S=?ID_S '
      '  ,DATE_ADD=?DATE_ADD '
      '  ,DATE_UPD=?DATE_UPD '
      '  ,DATE_SINC=?DATE_SINC '
      '  ,RESULTADO_ENVIO=?RESULTADO_ENVIO '
      '  ,RESPUESTA_ENVIO=?RESPUESTA_ENVIO '
      'WHERE'
      '  HUBSPOT_DEAL_ID=?old_HUBSPOT_DEAL_ID AND'
      '  DELFOS_DEAL_ID=?old_DELFOS_DEAL_ID ')
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    AfterOpen = xDealsAfterOpen
    BeforeClose = xDealsBeforeClose
    ClavesPrimarias.Strings = (
      'HUBSPOT_DEAL_ID ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'HS_DEALS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 152
    object xDealsHUBSPOT_DEAL_ID: TFIBStringField
      DisplayLabel = 'HubSpot Deal Id'
      FieldName = 'HUBSPOT_DEAL_ID'
      Size = 256
    end
    object xDealsDELFOS_DEAL_ID: TFIBStringField
      DisplayLabel = 'Delfo Deal Id'
      FieldName = 'DELFOS_DEAL_ID'
      Size = 256
    end
    object xDealsHUBSPOT_CONTACT_ID: TFIBStringField
      DisplayLabel = 'HubSpot Contact Id'
      FieldName = 'HUBSPOT_CONTACT_ID'
      Size = 256
    end
    object xDealsHUBSPOT_COMPANY_ID: TFIBStringField
      DisplayLabel = 'HubSpot Company Id'
      FieldName = 'HUBSPOT_COMPANY_ID'
      Size = 256
    end
    object xDealsDEAL_URL: TFIBStringField
      DisplayLabel = 'Deal URL'
      FieldName = 'DEAL_URL'
      Size = 256
    end
    object xDealsDEAL_AMOUNT: TFloatField
      DisplayLabel = 'Deal Amount'
      FieldName = 'DEAL_AMOUNT'
    end
    object xDealsCURRENCY: TFIBStringField
      DisplayLabel = 'Currency'
      FieldName = 'CURRENCY'
      Size = 256
    end
    object xDealsDEAL_STATUS: TFIBStringField
      DisplayLabel = 'Status'
      FieldName = 'DEAL_STATUS'
      OnGetText = xDealsDEAL_STATUSGetText
      OnSetText = xDealsDEAL_STATUSSetText
      Size = 256
    end
    object xDealsID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object xDealsDATE_ADD: TDateTimeField
      DisplayLabel = 'Date Add'
      FieldName = 'DATE_ADD'
    end
    object xDealsDATE_UPD: TDateTimeField
      DisplayLabel = 'Date Upd'
      FieldName = 'DATE_UPD'
    end
    object xDealsRESULTADO_ENVIO: TIntegerField
      DisplayLabel = 'Resultado Envio'
      FieldName = 'RESULTADO_ENVIO'
    end
    object xDealsRESPUESTA_ENVIO: TMemoField
      DisplayLabel = 'respuesta Envio'
      FieldName = 'RESPUESTA_ENVIO'
      BlobType = ftMemo
      Size = 8
    end
    object xDealsDATE_SINC: TDateTimeField
      DisplayLabel = 'DateSinc'
      FieldName = 'DATE_SINC'
    end
  end
  object DSDeals: TDataSource
    DataSet = xDeals
    Left = 176
    Top = 152
  end
  object xDealsDatos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM HS_DEALS'
      'WHERE'
      '  HUBSPOT_DEAL_ID=?old_HUBSPOT_DEAL_ID ')
    InsertSQL.Strings = (
      'INSERT INTO HS_DEALS'
      
        '  (HUBSPOT_DEAL_ID,'#13#10'DELFOS_DEAL_ID,HUBSPOT_CONTACT_ID,HUBSPOT_C' +
        'OMPANY_ID,DEAL_URL,DEAL_AMOUNT,CURRENCY,DEAL_STATUS,ID_S,DATE_AD' +
        'D,DATE_UPD,'#13#10'RESULTADO_ENVIO,RESPUESTA_ENVIO)'
      'VALUES'
      
        '  (?HUBSPOT_DEAL_ID,'#13#10'?DELFOS_DEAL_ID,?HUBSPOT_CONTACT_ID,?HUBSP' +
        'OT_COMPANY_ID,?DEAL_URL,?DEAL_AMOUNT,?CURRENCY,?DEAL_STATUS,?ID_' +
        'S,?DATE_ADD,?DATE_UPD,'#13#10'?RESULTADO_ENVIO,?RESPUESTA_ENVIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM HS_DEALS'
      'WHERE'
      '  HUBSPOT_DEAL_ID=?HUBSPOT_DEAL_ID ')
    SelectSQL.Strings = (
      
        'SELECT C.NAME, C.COMPANY_CIF, CC.FIRSTNAME, CC.LASTNAME, CC.PHON' +
        'E, CC.EMAIL'
      'FROM HS_COMPANIES C'
      
        'LEFT JOIN HS_CONTACTS CC ON C.HUBSPOT_COMPANY_ID = CC.HUBSPOT_CO' +
        'MPANY_ID AND CC.HUBSPOT_CONTACT_ID = :HUBSPOT_CONTACT_ID'
      'WHERE'
      'C.HUBSPOT_COMPANY_ID <> '#39#39' AND'
      'CC.HUBSPOT_CONTACT_ID <> '#39#39' AND'
      'C.HUBSPOT_COMPANY_ID = :HUBSPOT_COMPANY_ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE HS_DEALS'
      'SET'
      '  DELFOS_DEAL_ID=?DELFOS_DEAL_ID '
      '  ,HUBSPOT_CONTACT_ID=?HUBSPOT_CONTACT_ID '
      '  ,HUBSPOT_COMPANY_ID=?HUBSPOT_COMPANY_ID '
      '  ,DEAL_URL=?DEAL_URL '
      '  ,DEAL_AMOUNT=?DEAL_AMOUNT '
      '  ,CURRENCY=?CURRENCY '
      '  ,DEAL_STATUS=?DEAL_STATUS '
      '  ,ID_S=?ID_S '
      '  ,DATE_ADD=?DATE_ADD '
      '  ,DATE_UPD=?DATE_UPD '
      '  ,RESULTADO_ENVIO=?RESULTADO_ENVIO '
      '  ,RESPUESTA_ENVIO=?RESPUESTA_ENVIO '
      'WHERE'
      '  HUBSPOT_DEAL_ID=?HUBSPOT_DEAL_ID ')
    DataSource = DSDeals
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    ClavesPrimarias.Strings = (
      'HUBSPOT_DEAL_ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'HS_DEALS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 200
    object xDealsDatosNAME: TFIBStringField
      DisplayLabel = 'Name'
      FieldName = 'NAME'
      Size = 256
    end
    object xDealsDatosCOMPANY_CIF: TFIBStringField
      DisplayLabel = 'CIF'
      FieldName = 'COMPANY_CIF'
      Size = 256
    end
    object xDealsDatosFIRSTNAME: TFIBStringField
      DisplayLabel = 'First Name'
      FieldName = 'FIRSTNAME'
      Size = 256
    end
    object xDealsDatosLASTNAME: TFIBStringField
      DisplayLabel = 'Last Name'
      FieldName = 'LASTNAME'
      Size = 256
    end
    object xDealsDatosPHONE: TFIBStringField
      DisplayLabel = 'Phone'
      FieldName = 'PHONE'
      Size = 256
    end
    object xDealsDatosEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 256
    end
  end
  object DSDealsDatos: TDataSource
    DataSet = xDealsDatos
    Left = 176
    Top = 200
  end
end
