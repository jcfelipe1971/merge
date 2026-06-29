object DMSiiConfiguracionCorreo: TDMSiiConfiguracionCorreo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 1000
  Top = 380
  Height = 308
  Width = 432
  object QMSiiConfguracionCorreos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SII_CONFIGURACION_EMAIL WHERE EMPRESA = :EMPRESA')
    InsertSQL.Strings = (
      'INSERT INTO SII_CONFIGURACION_EMAIL ('
      
        'EMPRESA, COMPRAS_SERVIDOR_POP3, COMPRAS_PUERTO_POP3, COMPRAS_USU' +
        'ARIO_POP3, COMPRAS_PASSWORD_POP3, VENTAS_SERVIDOR_SMTP,'
      
        ' VENTAS_PUERTO_SMTP, VENTAS_USUARIO_SMTP, VENTAS_PASSWORD_SMTP, ' +
        'VENTAS_DIR_CORREO, VENTAS_SMTP_AUTENTIFICAR,'
      ' VENTAS_SMTP_TSL)'
      'VALUES ('
      
        ':EMPRESA, :COMPRAS_SERVIDOR_POP3, :COMPRAS_PUERTO_POP3, :COMPRAS' +
        '_USUARIO_POP3, :COMPRAS_PASSWORD_POP3,'
      
        ' :VENTAS_SERVIDOR_SMTP, :VENTAS_PUERTO_SMTP, :VENTAS_USUARIO_SMT' +
        'P, :VENTAS_PASSWORD_SMTP, :VENTAS_DIR_CORREO,'
      ' :VENTAS_SMTP_AUTENTIFICAR, :VENTAS_SMTP_TSL)  ')
    RefreshSQL.Strings = (
      'SELECT * FROM SII_CONFIGURACION_EMAIL '
      'WHERE '
      'EMPRESA = :EMPRESA')
    SelectSQL.Strings = (
      'SELECT * FROM SII_CONFIGURACION_EMAIL '
      'WHERE '
      'EMPRESA = :EMPRESA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SII_CONFIGURACION_EMAIL'
      'SET'
      'COMPRAS_SERVIDOR_POP3 = :COMPRAS_SERVIDOR_POP3,'
      'COMPRAS_PUERTO_POP3 = :COMPRAS_PUERTO_POP3,'
      'COMPRAS_USUARIO_POP3 = :COMPRAS_USUARIO_POP3,'
      'COMPRAS_PASSWORD_POP3 = :COMPRAS_PASSWORD_POP3,'
      'VENTAS_SERVIDOR_SMTP = :VENTAS_SERVIDOR_SMTP,'
      'VENTAS_PUERTO_SMTP = :VENTAS_PUERTO_SMTP,'
      'VENTAS_USUARIO_SMTP = :VENTAS_USUARIO_SMTP,'
      'VENTAS_PASSWORD_SMTP = :VENTAS_PASSWORD_SMTP,'
      'VENTAS_SMTP_AUTENTIFICAR = :VENTAS_SMTP_AUTENTIFICAR,'
      'VENTAS_SMTP_TSL = :VENTAS_SMTP_TSL,'
      'VENTAS_DIR_CORREO = :VENTAS_DIR_CORREO'
      'WHERE'
      'EMPRESA = :EMPRESA')
    OnNewRecord = QMSiiConfguracionCorreosNewRecord
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SII_CONFIGURACION_EMAIL'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 16
    object QMSiiConfguracionCorreosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMSiiConfguracionCorreosVENTAS_SERVIDOR_POP3: TFIBStringField
      DisplayLabel = 'Envio Servidor POP3'
      FieldName = 'VENTAS_SERVIDOR_POP3'
      Size = 100
    end
    object QMSiiConfguracionCorreosVENTAS_PUERTO_POP3: TIntegerField
      DisplayLabel = 'Envio Puertor POP3'
      FieldName = 'VENTAS_PUERTO_POP3'
    end
    object QMSiiConfguracionCorreosVENTAS_USUARIO_POP3: TFIBStringField
      DisplayLabel = 'Envio Usuario POP3'
      FieldName = 'VENTAS_USUARIO_POP3'
      Size = 100
    end
    object QMSiiConfguracionCorreosVENTAS_PASSWORD_POP3: TFIBStringField
      DisplayLabel = 'Envio Password POP3'
      FieldName = 'VENTAS_PASSWORD_POP3'
      Size = 100
    end
    object QMSiiConfguracionCorreosVENTAS_SERVIDOR_SMTP: TFIBStringField
      DisplayLabel = 'Envio Servidor SMTP'
      FieldName = 'VENTAS_SERVIDOR_SMTP'
      Size = 100
    end
    object QMSiiConfguracionCorreosVENTAS_PUERTO_SMTP: TIntegerField
      DisplayLabel = 'Envio Puertor SMTP'
      FieldName = 'VENTAS_PUERTO_SMTP'
    end
    object QMSiiConfguracionCorreosVENTAS_USUARIO_SMTP: TFIBStringField
      DisplayLabel = 'Envio Usuario SMTP'
      FieldName = 'VENTAS_USUARIO_SMTP'
      Size = 100
    end
    object QMSiiConfguracionCorreosVENTAS_PASSWORD_SMTP: TFIBStringField
      DisplayLabel = 'Envio Password SMTP'
      FieldName = 'VENTAS_PASSWORD_SMTP'
      Size = 100
    end
    object QMSiiConfguracionCorreosCOMPRAS_SERVIDOR_POP3: TFIBStringField
      DisplayLabel = 'Recepcion Servidor POP3'
      FieldName = 'COMPRAS_SERVIDOR_POP3'
      Size = 100
    end
    object QMSiiConfguracionCorreosCOMPRAS_PUERTO_POP3: TIntegerField
      DisplayLabel = 'Recepcion Puertor POP3'
      FieldName = 'COMPRAS_PUERTO_POP3'
    end
    object QMSiiConfguracionCorreosCOMPRAS_USUARIO_POP3: TFIBStringField
      DisplayLabel = 'Recepcion Usuario POP3'
      FieldName = 'COMPRAS_USUARIO_POP3'
      Size = 100
    end
    object QMSiiConfguracionCorreosCOMPRAS_PASSWORD_POP3: TFIBStringField
      DisplayLabel = 'Recepcion Password POP3'
      FieldName = 'COMPRAS_PASSWORD_POP3'
      Size = 100
    end
    object QMSiiConfguracionCorreosCOMPRAS_SERVIDOR_SMTP: TFIBStringField
      DisplayLabel = 'Recepcion Servidor SMTP'
      FieldName = 'COMPRAS_SERVIDOR_SMTP'
      Size = 100
    end
    object QMSiiConfguracionCorreosCOMPRAS_PUERTO_SMTP: TIntegerField
      DisplayLabel = 'Recepcion Puertor SMTP'
      FieldName = 'COMPRAS_PUERTO_SMTP'
    end
    object QMSiiConfguracionCorreosCOMPRAS_USUARIO_SMTP: TFIBStringField
      DisplayLabel = 'Recepcion Usuario SMTP'
      FieldName = 'COMPRAS_USUARIO_SMTP'
      Size = 100
    end
    object QMSiiConfguracionCorreosCOMPRAS_PASSWORD_SMTP: TFIBStringField
      DisplayLabel = 'Recepcion Password SMTP'
      FieldName = 'COMPRAS_PASSWORD_SMTP'
      Size = 100
    end
    object QMSiiConfguracionCorreosVENTAS_SMTP_AUTENTIFICAR: TIntegerField
      DisplayLabel = 'Envio Autenticar'
      FieldName = 'VENTAS_SMTP_AUTENTIFICAR'
    end
    object QMSiiConfguracionCorreosVENTAS_SMTP_TSL: TIntegerField
      DisplayLabel = 'Envio TSL'
      FieldName = 'VENTAS_SMTP_TSL'
    end
    object QMSiiConfguracionCorreosVENTAS_DIR_CORREO: TFIBStringField
      DisplayLabel = 'Envio Correo SMTP'
      FieldName = 'VENTAS_DIR_CORREO'
      Size = 100
    end
  end
  object DSQMSiiConfguracionCorreos: TDataSource
    DataSet = QMSiiConfguracionCorreos
    Left = 200
    Top = 16
  end
  object TLocal: TFIBTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 328
    Top = 16
  end
  object TUpdate: TFIBTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 384
    Top = 16
  end
end
