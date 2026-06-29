object DMAuditoria: TDMAuditoria
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 274
  Top = 225
  Height = 150
  Width = 454
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 320
    Top = 24
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 384
    Top = 24
  end
  object xAuditoria: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_SYS_AUDITORIA'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_SYS_AUDITORIA'
      'ORDER BY ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_SYS_AUDITORIA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 24
    object xAuditoriaID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object xAuditoriaTABLA: TFIBStringField
      DisplayLabel = 'Tabla'
      FieldName = 'TABLA'
      Size = 31
    end
    object xAuditoriaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xAuditoriaENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xAuditoriaVALORES_OLD: TMemoField
      DisplayLabel = 'Valores Originales'
      FieldName = 'VALORES_OLD'
      BlobType = ftMemo
      Size = 8
    end
    object xAuditoriaVALORES_NEW: TMemoField
      DisplayLabel = 'Valores Modificados'
      FieldName = 'VALORES_NEW'
      BlobType = ftMemo
      Size = 8
    end
    object xAuditoriaACCION: TFIBStringField
      DisplayLabel = 'Accion'
      FieldName = 'ACCION'
      OnGetText = xAuditoriaACCIONGetText
      Size = 1
    end
    object xAuditoriaUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object xAuditoriaFEC_ENTRADA: TDateTimeField
      DisplayLabel = 'Fec. Entrada'
      FieldName = 'FEC_ENTRADA'
    end
    object xAuditoriaFEC_SALIDA: TDateTimeField
      DisplayLabel = 'Fec. Salida'
      FieldName = 'FEC_SALIDA'
    end
    object xAuditoriaUBICACION: TIntegerField
      DisplayLabel = 'Ubicacion'
      FieldName = 'UBICACION'
    end
    object xAuditoriaMAQUINA: TFIBStringField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
      Size = 31
    end
    object xAuditoriaLOGIN: TFIBStringField
      DisplayLabel = 'Login'
      FieldName = 'LOGIN'
      Size = 31
    end
    object xAuditoriaSISTEMA: TFIBStringField
      DisplayLabel = 'Sistema'
      FieldName = 'SISTEMA'
      Size = 100
    end
    object xAuditoriaDESCRIPCION_UBICACION: TFIBStringField
      DisplayLabel = 'Descripcion Ubic.'
      FieldName = 'DESCRIPCION_UBICACION'
      Size = 31
    end
    object xAuditoriaNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 31
    end
  end
  object DSxAuditoria: TDataSource
    DataSet = xAuditoria
    Left = 144
    Top = 24
  end
end
