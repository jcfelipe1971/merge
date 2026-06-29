object DMIDRIL: TDMIDRIL
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 230
  Top = 173
  Height = 263
  Width = 345
  object TLocal: THYTransaction
    Active = True
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
  object xIDRILTransportista: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM IDRIL_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ACREEDOR=?old_ACREEDOR ')
    InsertSQL.Strings = (
      'INSERT INTO IDRIL_CONFIGURACION'
      
        '  (EMPRESA,'#13#10'ACREEDOR,REMITENTE_NOMBRE,REMITENTE_DIRECCION,REMIT' +
        'ENTE_POBLACION,REMITENTE_PAIS,REMITENTE_CP,REMITENTE_TELEFONO,RE' +
        'MITENTE_MOVIL,REMITENTE_EMAIL,REMITENTE_DEPARTAMENTO,'#13#10'REMITENTE' +
        '_OBSERVACIONES,RUTA_EJECUTABLE)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?ACREEDOR,?REMITENTE_NOMBRE,?REMITENTE_DIRECCION,?' +
        'REMITENTE_POBLACION,?REMITENTE_PAIS,?REMITENTE_CP,?REMITENTE_TEL' +
        'EFONO,?REMITENTE_MOVIL,?REMITENTE_EMAIL,?REMITENTE_DEPARTAMENTO,' +
        #13#10'?REMITENTE_OBSERVACIONES,?RUTA_EJECUTABLE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM IDRIL_CONFIGURACION'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ACREEDOR=?ACREEDOR ')
    SelectSQL.Strings = (
      'SELECT * FROM IDRIL_CONFIGURACION'
      'WHERE EMPRESA=?EMPRESA'
      'ORDER BY EMPRESA,ACREEDOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE IDRIL_CONFIGURACION'
      'SET'
      '  REMITENTE_NOMBRE=?REMITENTE_NOMBRE '
      '  ,REMITENTE_DIRECCION=?REMITENTE_DIRECCION '
      '  ,REMITENTE_POBLACION=?REMITENTE_POBLACION '
      '  ,REMITENTE_PAIS=?REMITENTE_PAIS '
      '  ,REMITENTE_CP=?REMITENTE_CP '
      '  ,REMITENTE_TELEFONO=?REMITENTE_TELEFONO '
      '  ,REMITENTE_MOVIL=?REMITENTE_MOVIL '
      '  ,REMITENTE_EMAIL=?REMITENTE_EMAIL '
      '  ,REMITENTE_DEPARTAMENTO=?REMITENTE_DEPARTAMENTO '
      '  ,REMITENTE_OBSERVACIONES=?REMITENTE_OBSERVACIONES '
      '  ,RUTA_EJECUTABLE=?RUTA_EJECUTABLE '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ACREEDOR=?ACREEDOR ')
    OnNewRecord = xIDRILTransportistaNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ACREEDOR ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'IDRIL_CONFIGURACION'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object xIDRILTransportistaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xIDRILTransportistaACREEDOR: TIntegerField
      DisplayLabel = 'Acreedor'
      FieldName = 'ACREEDOR'
    end
    object xIDRILTransportistaREMITENTE_NOMBRE: TFIBStringField
      DisplayLabel = 'Remit. Nombre'
      FieldName = 'REMITENTE_NOMBRE'
      Size = 256
    end
    object xIDRILTransportistaREMITENTE_DIRECCION: TFIBStringField
      DisplayLabel = 'Remit. Direccion'
      FieldName = 'REMITENTE_DIRECCION'
      Size = 256
    end
    object xIDRILTransportistaREMITENTE_POBLACION: TFIBStringField
      DisplayLabel = 'Remit. Poblacion'
      FieldName = 'REMITENTE_POBLACION'
      Size = 256
    end
    object xIDRILTransportistaREMITENTE_PAIS: TFIBStringField
      DisplayLabel = 'Remit. Pais'
      FieldName = 'REMITENTE_PAIS'
      Size = 256
    end
    object xIDRILTransportistaREMITENTE_CP: TFIBStringField
      DisplayLabel = 'Remit. Cod. Postal'
      FieldName = 'REMITENTE_CP'
      Size = 256
    end
    object xIDRILTransportistaREMITENTE_TELEFONO: TFIBStringField
      DisplayLabel = 'Remit. Telefono'
      FieldName = 'REMITENTE_TELEFONO'
      Size = 256
    end
    object xIDRILTransportistaREMITENTE_MOVIL: TFIBStringField
      DisplayLabel = 'Remit. Movil'
      FieldName = 'REMITENTE_MOVIL'
      Size = 256
    end
    object xIDRILTransportistaREMITENTE_EMAIL: TFIBStringField
      DisplayLabel = 'Remit. Email'
      FieldName = 'REMITENTE_EMAIL'
      Size = 256
    end
    object xIDRILTransportistaREMITENTE_DEPARTAMENTO: TFIBStringField
      DisplayLabel = 'Remit. Departamento'
      FieldName = 'REMITENTE_DEPARTAMENTO'
      Size = 256
    end
    object xIDRILTransportistaREMITENTE_OBSERVACIONES: TFIBStringField
      DisplayLabel = 'Remit. Observaciones'
      FieldName = 'REMITENTE_OBSERVACIONES'
      Size = 256
    end
    object xIDRILTransportistaRUTA_EJECUTABLE: TFIBStringField
      DisplayLabel = 'Ruta Ejecutable'
      FieldName = 'RUTA_EJECUTABLE'
      Size = 256
    end
  end
  object DSxIDRILTransportista: TDataSource
    DataSet = xIDRILTransportista
    Left = 168
    Top = 16
  end
end
