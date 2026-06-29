object CrmDMAcciones: TCrmDMAcciones
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
    Left = 132
    Top = 16
  end
  object QMAcciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_SYS_ACCIONES'
      'WHERE'
      '  ACCION=?old_ACCION ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_SYS_ACCIONES'
      '  (ACCION,DESCRIPCION,FIN_ACCION,TIPO_SEG,CREAR_SEGUIMIENTO)'
      'VALUES'
      
        '  (?ACCION,?DESCRIPCION,?FIN_ACCION,?TIPO_SEG,?CREAR_SEGUIMIENTO' +
        ')')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_SYS_ACCIONES'
      'WHERE'
      '  ACCION=?ACCION ')
    SelectSQL.Strings = (
      'SELECT * FROM CRM_SYS_ACCIONES'
      'order by accion')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CRM_SYS_ACCIONES'
      'SET'
      '  DESCRIPCION=?DESCRIPCION,'
      '  FIN_ACCION=?FIN_ACCION,'
      '  TIPO_SEG=?TIPO_SEG,'
      '  CREAR_SEGUIMIENTO=?CREAR_SEGUIMIENTO'
      'WHERE'
      '  ACCION=?ACCION ')
    OnNewRecord = QMAccionesNewRecord
    ClavesPrimarias.Strings = (
      'ACCION ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_SYS_ACCIONES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 34
    Top = 14
    object QMAccionesACCION: TFIBStringField
      DisplayLabel = 'Acci'#243'n'
      FieldName = 'ACCION'
      Size = 3
    end
    object QMAccionesDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 25
    end
    object QMAccionesFIN_ACCION: TIntegerField
      DisplayLabel = 'Fin Acci'#243'n'
      FieldName = 'FIN_ACCION'
    end
    object QMAccionesTIPO_SEG: TFIBStringField
      DisplayLabel = 'Tipo Seg.'
      FieldName = 'TIPO_SEG'
      Size = 3
    end
    object QMAccionesCREAR_SEGUIMIENTO: TIntegerField
      DisplayLabel = 'Crear Seg.'
      FieldName = 'CREAR_SEGUIMIENTO'
    end
  end
  object DSQMAcciones: TDataSource
    DataSet = QMAcciones
    Left = 36
    Top = 64
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 200
    Top = 16
  end
end
