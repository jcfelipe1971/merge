object CrmDMContactosDetAcc: TCrmDMContactosDetAcc
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 240
  Top = 173
  Height = 150
  Width = 215
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 24
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
    Left = 24
    Top = 56
  end
  object DSQMAccionesDet: TDataSource
    DataSet = QMAccionesDet
    Left = 128
    Top = 56
  end
  object QMAccionesDet: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_CONTACTOS_ACCIONES_DET'
      'WHERE'
      '  ID_CONTACTO=?old_ID_CONTACTO AND '
      '  LINEA_CAB=?old_LINEA_CAB AND '
      '  ORDEN=?old_ORDEN ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_CONTACTOS_ACCIONES_DET'
      
        '  (ID_CONTACTO,'#13#10'LINEA_CAB,ORDEN,ID_ACCION_DET,ID_ACCION,FECHA,D' +
        'ESCRIPCION_SEGUIMIENTO,HORA_ACCION,NOTAS,FIN_SEG,ID_SEG_SIGUIENT' +
        'E,'#13#10'FECHA_SEG_SIGUIENTE,DESCRIPCION_ACCION,ID_UBICACION,PROGRESO' +
        ',ID_EKEVENT,HORARIO_DESDE,HORARIO_HASTA,EMPRESA_AGENTE,AGENTE,TI' +
        'PO_SEG,'#13#10'ULT_MODIFICACION)'
      'VALUES'
      
        '  (?ID_CONTACTO,'#13#10'?LINEA_CAB,?ORDEN,?ID_ACCION_DET,?ID_ACCION,?F' +
        'ECHA,?DESCRIPCION_SEGUIMIENTO,?HORA_ACCION,?NOTAS,?FIN_SEG,?ID_S' +
        'EG_SIGUIENTE,'#13#10'?FECHA_SEG_SIGUIENTE,?DESCRIPCION_ACCION,?ID_UBIC' +
        'ACION,?PROGRESO,?ID_EKEVENT,?HORARIO_DESDE,?HORARIO_HASTA,?EMPRE' +
        'SA_AGENTE,?AGENTE,?TIPO_SEG,'#13#10'?ULT_MODIFICACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_CONTACTOS_ACCIONES_DET'
      'WHERE'
      '  ID_CONTACTO=?ID_CONTACTO AND '
      '  LINEA_CAB=?LINEA_CAB AND '
      '  ORDEN=?ORDEN ')
    SelectSQL.Strings = (
      'SELECT * FROM CRM_CONTACTOS_ACCIONES_DET'
      'WHERE'
      'ID_ACCION_DET = :ID_ACCION_DET'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted, cusDeleted]
    UpdateSQL.Strings = (
      'UPDATE CRM_CONTACTOS_ACCIONES_DET'
      'SET'
      '  ID_ACCION_DET=?ID_ACCION_DET '
      '  ,ID_ACCION=?ID_ACCION '
      '  ,FECHA=?FECHA '
      '  ,DESCRIPCION_SEGUIMIENTO=?DESCRIPCION_SEGUIMIENTO '
      '  ,HORA_ACCION=?HORA_ACCION '
      '  ,NOTAS=?NOTAS '
      '  ,FIN_SEG=?FIN_SEG '
      '  ,ID_SEG_SIGUIENTE=?ID_SEG_SIGUIENTE '
      '  ,FECHA_SEG_SIGUIENTE=?FECHA_SEG_SIGUIENTE '
      '  ,DESCRIPCION_ACCION=?DESCRIPCION_ACCION '
      '  ,ID_UBICACION=?ID_UBICACION '
      '  ,PROGRESO=?PROGRESO '
      '  ,ID_EKEVENT=?ID_EKEVENT '
      '  ,HORARIO_DESDE=?HORARIO_DESDE '
      '  ,HORARIO_HASTA=?HORARIO_HASTA '
      '  ,EMPRESA_AGENTE=?EMPRESA_AGENTE '
      '  ,AGENTE=?AGENTE '
      '  ,TIPO_SEG=?TIPO_SEG '
      '  ,ULT_MODIFICACION=?ULT_MODIFICACION '
      'WHERE'
      '  ID_CONTACTO=?ID_CONTACTO AND '
      '  LINEA_CAB=?LINEA_CAB AND '
      '  ORDEN=?ORDEN ')
    BeforePost = QMAccionesDetBeforePost
    OnNewRecord = QMAccionesDetNewRecord
    ClavesPrimarias.Strings = (
      'ID_CONTACTO'
      'LINEA_CAB'
      'ORDEN')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_CONTACTOS_ACCIONES_DET'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 128
    Top = 8
    object QMAccionesDetID_ACCION_DET: TIntegerField
      DisplayLabel = 'ID Det. Acci'#243'n'
      FieldName = 'ID_ACCION_DET'
    end
    object QMAccionesDetID_ACCION: TIntegerField
      DisplayLabel = 'ID Acci'#243'n'
      FieldName = 'ID_ACCION'
    end
    object QMAccionesDetORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMAccionesDetFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QMAccionesDetHORA_ACCION: TFIBStringField
      DisplayLabel = 'Hora'
      FieldName = 'HORA_ACCION'
      Size = 15
    end
    object QMAccionesDetNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMAccionesDetID_CONTACTO: TIntegerField
      DisplayLabel = 'ID Contacto'
      FieldName = 'ID_CONTACTO'
    end
    object QMAccionesDetLINEA_CAB: TIntegerField
      DisplayLabel = 'L'#237'nea Cab.'
      FieldName = 'LINEA_CAB'
    end
    object QMAccionesDetFIN_SEG: TIntegerField
      DisplayLabel = 'Fin Seguimiento'
      FieldName = 'FIN_SEG'
    end
    object QMAccionesDetID_SEG_SIGUIENTE: TIntegerField
      DisplayLabel = 'ID Seg. Siguiente'
      FieldName = 'ID_SEG_SIGUIENTE'
    end
    object QMAccionesDetFECHA_SEG_SIGUIENTE: TDateTimeField
      DisplayLabel = 'Fecha Seg. Siguiente'
      FieldName = 'FECHA_SEG_SIGUIENTE'
    end
    object QMAccionesDetTIPO_SEG: TFIBStringField
      DisplayLabel = 'Tipo Seguimiento'
      FieldName = 'TIPO_SEG'
      Size = 3
    end
    object QMAccionesDetDESCRIPCION_SEGUIMIENTO: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION_SEGUIMIENTO'
      Size = 60
    end
    object QMAccionesDetPROGRESO: TIntegerField
      DisplayLabel = 'Progreso'
      FieldName = 'PROGRESO'
    end
  end
end
