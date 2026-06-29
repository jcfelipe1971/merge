object CrmDMAmbitos: TCrmDMAmbitos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 517
  Top = 180
  Height = 271
  Width = 336
  object QMAmbitos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_SYS_AMBITOS'
      'WHERE'
      '  AMBITO=?old_AMBITO ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_SYS_AMBITOS'
      '  (AMBITO,DESCRIPCION)'
      'VALUES'
      '  (?AMBITO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_SYS_AMBITOS'
      'WHERE'
      '  AMBITO=?AMBITO ')
    SelectSQL.Strings = (
      'SELECT * FROM CRM_SYS_AMBITOS'
      'order by ambito')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CRM_SYS_AMBITOS'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  AMBITO=?AMBITO ')
    AfterOpen = QMAmbitosAfterOpen
    BeforePost = QMAmbitosBeforePost
    ClavesPrimarias.Strings = (
      'AMBITO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_SYS_AMBITOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMAmbitosAMBITO: TIntegerField
      DisplayLabel = #193'mbito'
      FieldName = 'AMBITO'
    end
    object QMAmbitosDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 216
    Top = 8
  end
  object DSQMAmbitos: TDataSource
    DataSet = QMAmbitos
    Left = 112
    Top = 8
  end
  object xNumEmails: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select count(*) from crm_sys_emails_ambitos'
      '        where ambito=?ambito')
    UniDirectional = False
    DataSource = DSQMAmbitos
    Left = 40
    Top = 56
    object xNumEmailsCOUNT: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'COUNT'
    end
  end
  object DSxNumEmails: TDataSource
    DataSet = xNumEmails
    Left = 112
    Top = 56
  end
  object xNumContactos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select count(*) from crm_ambitos_contacto'
      '        where id_crm_ambito=?ambito')
    UniDirectional = False
    DataSource = DSQMAmbitos
    Left = 40
    Top = 104
    object xNumContactosCOUNT: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'COUNT'
    end
  end
  object DSxNumContactos: TDataSource
    DataSet = xNumContactos
    Left = 112
    Top = 104
  end
  object xReemplazaAmbitos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM CRM_SYS_AMBITOS'
      'order by ambito')
    UniDirectional = False
    Left = 40
    Top = 152
    object xReemplazaAmbitosAMBITO: TIntegerField
      DisplayLabel = 'Ambito'
      FieldName = 'AMBITO'
    end
    object xReemplazaAmbitosDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
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
    Left = 272
    Top = 8
  end
end
