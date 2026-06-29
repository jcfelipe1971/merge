object CrmDMAccionesCab: TCrmDMAccionesCab
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 462
  Top = 301
  Height = 259
  Width = 354
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 232
    Top = 16
  end
  object QMAccionesCab: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_ACCIONES'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_ACCIONES'
      
        '  (ID,'#13#10'TIPO_ACCION,FECHA_ACCION,DESCRIPCION_ACCION,NOTAS,FECHA_' +
        'PREVISTA_CIERRE,FECHA_CIERRE_REAL,COMENTARIO_CIERRE,ESTADO,NUMER' +
        'O_CONTACTOS,EMPRESA,'#13#10'PROYECTO)'
      'VALUES'
      
        '  (?ID,'#13#10'?TIPO_ACCION,?FECHA_ACCION,?DESCRIPCION_ACCION,?NOTAS,?' +
        'FECHA_PREVISTA_CIERRE,?FECHA_CIERRE_REAL,?COMENTARIO_CIERRE,?EST' +
        'ADO,?NUMERO_CONTACTOS,?EMPRESA,'#13#10'?PROYECTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_ACCIONES'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM CRM_ACCIONES'
      'ORDER BY ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CRM_ACCIONES'
      'SET'
      '  TIPO_ACCION=?TIPO_ACCION '
      '  ,FECHA_ACCION=?FECHA_ACCION '
      '  ,DESCRIPCION_ACCION=?DESCRIPCION_ACCION '
      '  ,NOTAS=?NOTAS '
      '  ,FECHA_PREVISTA_CIERRE=?FECHA_PREVISTA_CIERRE '
      '  ,FECHA_CIERRE_REAL=?FECHA_CIERRE_REAL '
      '  ,COMENTARIO_CIERRE=?COMENTARIO_CIERRE '
      '  ,ESTADO=?ESTADO '
      '  ,NUMERO_CONTACTOS=?NUMERO_CONTACTOS '
      '  ,EMPRESA=?EMPRESA '
      '  ,PROYECTO=?PROYECTO '
      'WHERE'
      '  ID=?ID ')
    OnNewRecord = QMAccionesCabNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_ACCIONES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMAccionesCabID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMAccionesCabTIPO_ACCION: TFIBStringField
      DisplayLabel = 'Tipo Acci'#243'n'
      FieldName = 'TIPO_ACCION'
      Size = 3
    end
    object QMAccionesCabFECHA_ACCION: TDateTimeField
      DisplayLabel = 'Fecha Acci'#243'n'
      FieldName = 'FECHA_ACCION'
    end
    object QMAccionesCabDESCRIPCION_ACCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n Acci'#243'n'
      FieldName = 'DESCRIPCION_ACCION'
      Size = 60
    end
    object QMAccionesCabNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMAccionesCabNUMERO_CONTACTOS: TIntegerField
      DisplayLabel = 'N'#250'mero de Contactos'
      FieldName = 'NUMERO_CONTACTOS'
    end
    object QMAccionesCabFECHA_PREVISTA_CIERRE: TDateTimeField
      DisplayLabel = 'Fecha Prev. Cierre'
      FieldName = 'FECHA_PREVISTA_CIERRE'
    end
    object QMAccionesCabFECHA_CIERRE_REAL: TDateTimeField
      DisplayLabel = 'Fecha Real Cierre'
      FieldName = 'FECHA_CIERRE_REAL'
    end
    object QMAccionesCabCOMENTARIO_CIERRE: TMemoField
      DisplayLabel = 'Comentario Cierre'
      FieldName = 'COMENTARIO_CIERRE'
      BlobType = ftMemo
      Size = 8
    end
    object QMAccionesCabESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMAccionesCabEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMAccionesCabPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
      OnChange = QMAccionesCabPROYECTOChange
    end
  end
  object DSQMAccionesCab: TDataSource
    DataSet = QMAccionesCab
    Left = 128
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 296
    Top = 16
  end
end
