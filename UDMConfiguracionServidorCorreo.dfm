object DMConfiguracionServidorCorreo: TDMConfiguracionServidorCorreo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 1150
  Top = 228
  Height = 308
  Width = 375
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 56
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 200
    Top = 8
  end
  object DSQMConfiguracionCorreos: TDataSource
    DataSet = QMConfiguracionCorreos
    Left = 200
    Top = 56
  end
  object QMConfiguracionCorreos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CONFIG_SERVIDOR_CORREO'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CONFIG_SERVIDOR_CORREO'
      
        '  (ID,'#13#10'EMPRESA,DESCRIPCION,SERVIDOR_POP3,PUERTO_POP3,USUARIO_PO' +
        'P3,PASSWORD_POP3,SERVIDOR_SMTP,PUERTO_SMTP,USUARIO_SMTP,PASSWORD' +
        '_SMTP,'#13#10'SMTP_AUTENTIFICAR,SMTP_TSL,DIR_CORREO)'
      'VALUES'
      
        '  (?ID,'#13#10'?EMPRESA,?DESCRIPCION,?SERVIDOR_POP3,?PUERTO_POP3,?USUA' +
        'RIO_POP3,?PASSWORD_POP3,?SERVIDOR_SMTP,?PUERTO_SMTP,?USUARIO_SMT' +
        'P,?PASSWORD_SMTP,'#13#10'?SMTP_AUTENTIFICAR,?SMTP_TSL,?DIR_CORREO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CONFIG_SERVIDOR_CORREO'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CONFIG_SERVIDOR_CORREO'
      'WHERE '
      'EMPRESA = :EMPRESA'
      'ORDER BY ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CONFIG_SERVIDOR_CORREO'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,SERVIDOR_POP3=?SERVIDOR_POP3 '
      '  ,PUERTO_POP3=?PUERTO_POP3 '
      '  ,USUARIO_POP3=?USUARIO_POP3 '
      '  ,PASSWORD_POP3=?PASSWORD_POP3 '
      '  ,SERVIDOR_SMTP=?SERVIDOR_SMTP '
      '  ,PUERTO_SMTP=?PUERTO_SMTP '
      '  ,USUARIO_SMTP=?USUARIO_SMTP '
      '  ,PASSWORD_SMTP=?PASSWORD_SMTP '
      '  ,SMTP_AUTENTIFICAR=?SMTP_AUTENTIFICAR '
      '  ,SMTP_TSL=?SMTP_TSL '
      '  ,DIR_CORREO=?DIR_CORREO '
      'WHERE'
      '  ID=?ID ')
    BeforePost = QMConfiguracionCorreosBeforePost
    OnNewRecord = QMConfiguracionCorreosNewRecord
    ClavesPrimarias.Strings = (
      'ID')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CONFIG_SERVIDOR_CORREO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object QMConfiguracionCorreosID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMConfiguracionCorreosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConfiguracionCorreosDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 35
    end
    object QMConfiguracionCorreosSERVIDOR_POP3: TFIBStringField
      DisplayLabel = 'Servidor POP3'
      FieldName = 'SERVIDOR_POP3'
      Size = 100
    end
    object QMConfiguracionCorreosPUERTO_POP3: TIntegerField
      DisplayLabel = 'Puerto POP3'
      FieldName = 'PUERTO_POP3'
    end
    object QMConfiguracionCorreosUSUARIO_POP3: TFIBStringField
      DisplayLabel = 'Usuario POP3'
      FieldName = 'USUARIO_POP3'
      Size = 100
    end
    object QMConfiguracionCorreosPASSWORD_POP3: TFIBStringField
      DisplayLabel = 'Password POP3'
      FieldName = 'PASSWORD_POP3'
      Size = 100
    end
    object QMConfiguracionCorreosSERVIDOR_SMTP: TFIBStringField
      DisplayLabel = 'Servidor SMTP'
      FieldName = 'SERVIDOR_SMTP'
      Size = 100
    end
    object QMConfiguracionCorreosPUERTO_SMTP: TIntegerField
      DisplayLabel = 'Puerto SMTP'
      FieldName = 'PUERTO_SMTP'
    end
    object QMConfiguracionCorreosUSUARIO_SMTP: TFIBStringField
      DisplayLabel = 'Usuario SMTP'
      FieldName = 'USUARIO_SMTP'
      Size = 100
    end
    object QMConfiguracionCorreosPASSWORD_SMTP: TFIBStringField
      DisplayLabel = 'Password SMTP'
      FieldName = 'PASSWORD_SMTP'
      Size = 100
    end
    object QMConfiguracionCorreosSMTP_AUTENTIFICAR: TIntegerField
      DisplayLabel = 'SMTP Autenticar'
      FieldName = 'SMTP_AUTENTIFICAR'
    end
    object QMConfiguracionCorreosSMTP_TSL: TIntegerField
      DisplayLabel = 'SMTP TSL'
      FieldName = 'SMTP_TSL'
    end
    object QMConfiguracionCorreosDIR_CORREO: TFIBStringField
      DisplayLabel = 'Correo'
      FieldName = 'DIR_CORREO'
      Size = 100
    end
  end
end
