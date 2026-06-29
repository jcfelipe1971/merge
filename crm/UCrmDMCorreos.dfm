object CrmDMCorreos: TCrmDMCorreos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 540
  Top = 220
  Height = 317
  Width = 344
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_SYS_EMAILS'
      'WHERE'
      '  ID_EMAIL=?old_ID_EMAIL ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_SYS_EMAILS'
      '  (ID_EMAIL,DIRECCION_EMAIL,ACTIVO)'
      'VALUES'
      '  (?ID_EMAIL,?DIRECCION_EMAIL,?ACTIVO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_SYS_EMAILS'
      'WHERE'
      '  ID_EMAIL=?ID_EMAIL ')
    SelectSQL.Strings = (
      'SELECT * FROM CRM_SYS_EMAILS'
      'order by id_email')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CRM_SYS_EMAILS'
      'SET'
      '  DIRECCION_EMAIL=?DIRECCION_EMAIL '
      '  ,ACTIVO=?ACTIVO '
      'WHERE'
      '  ID_EMAIL=?ID_EMAIL ')
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    BeforePost = QMCabeceraBeforePost
    OnNewRecord = QMCabeceraNewRecord
    ClavesPrimarias.Strings = (
      'ID_EMAIL ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_SYS_EMAILS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 16
    object QMCabeceraID_EMAIL: TIntegerField
      DisplayLabel = 'ID E-Mail'
      FieldName = 'ID_EMAIL'
    end
    object QMCabeceraDIRECCION_EMAIL: TFIBStringField
      DisplayLabel = 'Direcci'#243'n E-Mail'
      DisplayWidth = 100
      FieldName = 'DIRECCION_EMAIL'
      Size = 100
    end
    object QMCabeceraACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 112
    Top = 16
  end
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
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_SYS_EMAILS_AMBITOS'
      'WHERE'
      '  AMBITO=?old_AMBITO AND '
      '  ID_EMAIL=?old_ID_EMAIL ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_SYS_EMAILS_AMBITOS'
      '  (ID_EMAIL,AMBITO)'
      'VALUES'
      '  (?ID_EMAIL,?AMBITO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_SYS_EMAILS_AMBITOS'
      'WHERE'
      '  ambito=?ambito and'
      '  ID_EMAIL=?ID_EMAIL ')
    SelectSQL.Strings = (
      'SELECT * FROM CRM_SYS_EMAILS_AMBITOS'
      'where ID_EMAIL=?ID_EMAIL'
      'order by ambito')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CRM_SYS_EMAILS_AMBITOS'
      'SET AMBITO=?new_AMBITO'
      'WHERE'
      '  AMBITO=?old_AMBITO AND '
      '  ID_EMAIL=?ID_EMAIL ')
    DataSource = DSQMCabecera
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'ambito '
      'ID_EMAIL ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_SYS_EMAILS_AMBITOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 64
    object QMDetalleID_EMAIL: TIntegerField
      DisplayLabel = 'ID E-mail'
      FieldName = 'ID_EMAIL'
    end
    object QMDetalleAMBITO: TIntegerField
      DisplayLabel = #193'mbito'
      FieldName = 'AMBITO'
    end
    object QMDetalleDescripcin: TStringField
      DisplayWidth = 40
      FieldKind = fkCalculated
      FieldName = 'Descripci'#243'n'
      OnGetText = QMDetalleDescripcinGetText
      Size = 40
      Calculated = True
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 112
    Top = 64
  end
  object xExportaAmbitos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM CRM_SYS_AMBITOS'
      'order by ambito')
    UniDirectional = False
    Left = 32
    Top = 112
    object xExportaAmbitosAMBITO: TIntegerField
      DisplayLabel = 'Ambito'
      FieldName = 'AMBITO'
    end
    object xExportaAmbitosDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
  end
  object xExportaEMails: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select distinct cab.direccion_email'
      '  from crm_sys_emails cab'
      '  join crm_sys_emails_ambitos det on (cab.id_email=det.id_email)'
      '  where cab.activo=1')
    UniDirectional = False
    Left = 32
    Top = 160
    object xExportaEMailsDIRECCION_EMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'DIRECCION_EMAIL'
      Size = 100
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 280
    Top = 16
  end
end
