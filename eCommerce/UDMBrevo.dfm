object DMBrevo: TDMBrevo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 338
  Top = 133
  Height = 219
  Width = 554
  object DSxListas: TDataSource
    DataSet = xListas
    Left = 120
    Top = 56
  end
  object DSxPersonas: TDataSource
    DataSet = xPersonas
    Left = 120
    Top = 8
  end
  object xPersonas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CRM_PERSONAS_BREVO'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CRM_PERSONAS_BREVO'
      
        '  (ID,'#13#10'EMAIL,EMAIL_BLACKLISTED,SMS_BLACKLISTED,CREATED_AT,MODIF' +
        'IED_AT,ULT_SINCRONIZACION,ID_CONTACTO,NUM_PERSONA,ID_PERSONA,NOM' +
        'BRE,'#13#10'APELLIDOS)'
      'VALUES'
      
        '  (?ID,'#13#10'?EMAIL,?EMAIL_BLACKLISTED,?SMS_BLACKLISTED,?CREATED_AT,' +
        '?MODIFIED_AT,?ULT_SINCRONIZACION,?ID_CONTACTO,?NUM_PERSONA,?ID_P' +
        'ERSONA,?NOMBRE,'#13#10'?APELLIDOS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CRM_PERSONAS_BREVO'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CRM_PERSONAS_BREVO'
      'ORDER BY EMAIL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CRM_PERSONAS_BREVO'
      'SET'
      '  EMAIL=?EMAIL '
      '  ,EMAIL_BLACKLISTED=?EMAIL_BLACKLISTED '
      '  ,SMS_BLACKLISTED=?SMS_BLACKLISTED '
      '  ,CREATED_AT=?CREATED_AT '
      '  ,MODIFIED_AT=?MODIFIED_AT '
      '  ,ULT_SINCRONIZACION=?ULT_SINCRONIZACION '
      '  ,ID_CONTACTO=?ID_CONTACTO '
      '  ,NUM_PERSONA=?NUM_PERSONA '
      '  ,ID_PERSONA=?ID_PERSONA '
      '  ,NOMBRE=?NOMBRE '
      '  ,APELLIDOS=?APELLIDOS '
      'WHERE'
      '  ID=?ID ')
    DataSource = DSxListas
    ClavesPrimarias.Strings = (
      'ID')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CRM_PERSONAS_BREVO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 8
    object xPersonasID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object xPersonasEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object xPersonasEMAIL_BLACKLISTED: TIntegerField
      DisplayLabel = 'Email Blacklisted'
      FieldName = 'EMAIL_BLACKLISTED'
    end
    object xPersonasSMS_BLACKLISTED: TIntegerField
      DisplayLabel = 'SMS Blacklisted'
      FieldName = 'SMS_BLACKLISTED'
    end
    object xPersonasCREATED_AT: TDateTimeField
      DisplayLabel = 'Fec. Creacion'
      FieldName = 'CREATED_AT'
    end
    object xPersonasMODIFIED_AT: TDateTimeField
      DisplayLabel = 'Fec. Modificacion'
      FieldName = 'MODIFIED_AT'
    end
    object xPersonasULT_SINCRONIZACION: TDateTimeField
      DisplayLabel = 'Fec. Sincronizacion'
      FieldName = 'ULT_SINCRONIZACION'
    end
    object xPersonasID_CONTACTO: TIntegerField
      DisplayLabel = 'Id Contacto'
      FieldName = 'ID_CONTACTO'
    end
    object xPersonasNUM_PERSONA: TIntegerField
      DisplayLabel = 'Nro. Persona'
      FieldName = 'NUM_PERSONA'
    end
    object xPersonasID_PERSONA: TIntegerField
      DisplayLabel = 'Id Presona'
      FieldName = 'ID_PERSONA'
    end
    object xPersonasNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 40
    end
    object xPersonasAPELLIDOS: TFIBStringField
      DisplayLabel = 'Apellidos'
      FieldName = 'APELLIDOS'
      Size = 40
    end
  end
  object xListas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_LISTAS_BREVO'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_LISTAS_BREVO'
      
        '  (ID,'#13#10'NAME,TOTAL_BLACKLISTED,TOTAL_SUBSCRIBERS,UNIQUE_SUBSCRIB' +
        'ERS,FOLDER_ID,ULT_SINCRONIZACION)'
      'VALUES'
      
        '  (?ID,'#13#10'?NAME,?TOTAL_BLACKLISTED,?TOTAL_SUBSCRIBERS,?UNIQUE_SUB' +
        'SCRIBERS,?FOLDER_ID,?ULT_SINCRONIZACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_LISTAS_BREVO'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM CRM_LISTAS_BREVO'
      'ORDER BY NAME')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted, cusDeleted]
    UpdateSQL.Strings = (
      'UPDATE CRM_LISTAS_BREVO'
      'SET'
      '  NAME=?NAME '
      '  ,TOTAL_BLACKLISTED=?TOTAL_BLACKLISTED '
      '  ,TOTAL_SUBSCRIBERS=?TOTAL_SUBSCRIBERS '
      '  ,UNIQUE_SUBSCRIBERS=?UNIQUE_SUBSCRIBERS '
      '  ,FOLDER_ID=?FOLDER_ID '
      '  ,ULT_SINCRONIZACION=?ULT_SINCRONIZACION '
      'WHERE'
      '  ID=?ID ')
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_LISTAS_BREVO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 56
    object xListasID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object xListasNAME: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NAME'
      Size = 60
    end
    object xListasTOTAL_BLACKLISTED: TIntegerField
      DisplayLabel = 'Total Blacklisted'
      FieldName = 'TOTAL_BLACKLISTED'
    end
    object xListasTOTAL_SUBSCRIBERS: TIntegerField
      DisplayLabel = 'Total Subscritos'
      FieldName = 'TOTAL_SUBSCRIBERS'
    end
    object xListasUNIQUE_SUBSCRIBERS: TIntegerField
      DisplayLabel = 'Subscritores unicos'
      FieldName = 'UNIQUE_SUBSCRIBERS'
    end
    object xListasFOLDER_ID: TIntegerField
      DisplayLabel = 'Id Carpeta'
      FieldName = 'FOLDER_ID'
    end
    object xListasULT_SINCRONIZACION: TDateTimeField
      DisplayLabel = 'Fec. Sincronizacion'
      FieldName = 'ULT_SINCRONIZACION'
    end
  end
  object TLocal: THYTransaction
    Active = True
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 235
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
    Left = 235
    Top = 56
  end
end
